using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>
    /// "Tướng đơn" contract: a general authored as ONE oversized figure instead of a block of soldiers.
    /// The look is data (GroupStyle) carried on the combatant, so it must survive every path that REBUILDS the
    /// formation from scratch — reinforcement and phantom cloning both call FormationBuilder.Uniform with the
    /// config's groups-per-row and would otherwise silently split one boss back into three.
    /// </summary>
    public class SingleFigureUnitTests
    {
        static GeneralDto Boss() => new GeneralDto
        {
            Id = "baihu", DisplayName = "Bạch Hổ", Troop = "KyBinh",
            Rows = 1, Formation = new List<List<string>> { new List<string> { "KyBinh" } },
            GroupsPerRow = 1, SpriteCols = 1, SpriteRows = 1, UnitScale = 1.2, VisualId = "102",
            TroopCapacity = 42000,
        };

        static BattleSetup SetupWithBoss()
        {
            var boss = Boss().ToCombatant(Faction.Defense, "def0");
            var hero = new GeneralDto { Id = "guanyu", Troop = "KyBinh", TroopCapacity = 16000 }
                .ToCombatant(Faction.Offense, "off0");
            var setup = new BattleSetup { Seed = 1, Terrain = Terrain.Mountain };
            setup.OffenseLineup.Add(hero);
            setup.DefenseLineup.Add(boss);
            return setup;
        }

        [Fact]
        public void Authored_Boss_Is_One_Row_One_Group_Holding_All_Troops()
        {
            var boss = Boss().ToCombatant(Faction.Defense, "def0");

            Assert.Single(boss.Formation);
            Assert.Single(boss.Formation[0].Groups);
            Assert.Equal(42000, boss.Formation[0].Groups[0].Soldiers);
            Assert.Equal(42000, boss.Troops);
            // Rows is reconciled from the layout so row-scaled effects and the HUD agree with reality.
            Assert.Equal(1, boss.Rows);
        }

        [Fact]
        public void Style_Is_Stamped_Onto_The_Group_And_Reaches_The_Wire()
        {
            var runner = new BattleRunner(SetupWithBoss());
            runner.Begin();
            var snap = BattleSnapshot.From(runner.State);
            var g = snap.Defense.Queue[0].Formation[0].Groups[0];

            Assert.Equal(1, g.SpriteCols);
            Assert.Equal(1, g.SpriteRows);
            Assert.Equal(1.2f, g.Scale, 3);
            Assert.Equal("102", g.VisualId);

            // Round-trip: the client must read back exactly what the server sent.
            var back = Wire.Deserialize<BattleSnapshot>(Wire.Serialize(snap));
            var bg = back.Defense.Queue[0].Formation[0].Groups[0];
            Assert.Equal(1, bg.SpriteCols);
            Assert.Equal(1.2f, bg.Scale, 3);
            Assert.Equal("102", bg.VisualId);
        }

        [Fact]
        public void Ordinary_Generals_Keep_The_Default_Block()
        {
            var plain = new GeneralDto { Id = "x", Troop = "KyBinh", TroopCapacity = 12000, Rows = 4 }
                .ToCombatant(Faction.Offense, "off0");
            Assert.Null(plain.Style);

            var s2 = new BattleSetup { Seed = 1 };
            s2.OffenseLineup.Add(plain);
            s2.DefenseLineup.Add(Boss().ToCombatant(Faction.Defense, "def0"));
            new BattleRunner(s2).Begin();

            Assert.Equal(4, plain.Formation.Count);
            Assert.Equal(3, plain.Formation[0].Groups.Count);
            var g = plain.Formation[0].Groups[0];
            Assert.Equal(FormationBuilder.DefaultSpriteCols, g.SpriteCols);
            Assert.Equal(FormationBuilder.DefaultSpriteRows, g.SpriteRows);
            Assert.Equal(1f, g.Scale, 3);
            Assert.Null(g.VisualId);
        }

        [Fact]
        public void Phantom_Of_A_Boss_Stays_A_Single_Figure()
        {
            var session = new BattleSession(SetupWithBoss());
            session.Begin();
            session.CopyArmy(Faction.Defense, PhantomKind.Normal, 1);

            // Read it the way the client does — through the snapshot — so this also proves the look ships.
            var phantom = session.Snapshot().Defense.Queue
                .Find(c => c.Id != "def0" && c.DisplayName.Contains("Ảo"));
            Assert.NotNull(phantom);
            Assert.Single(phantom.Formation);
            Assert.Single(phantom.Formation[0].Groups);            // NOT DefaultGroupsPerRow (3)
            Assert.Equal("102", phantom.Formation[0].Groups[0].VisualId);
            Assert.Equal(1.2f, phantom.Formation[0].Groups[0].Scale, 3);
        }

        [Fact]
        public void Boss_Without_Explicit_Layout_Still_Builds_One_Group()
        {
            // GroupsPerRow on the style must also drive the UNIFORM path, which is what runs when a general
            // sets the look but omits "Formation" — the easiest authoring mistake to make.
            var dto = Boss();
            dto.Formation = null;
            var boss = dto.ToCombatant(Faction.Defense, "def0");
            Assert.Empty(boss.Formation);   // built later, by the runner

            var s3 = new BattleSetup { Seed = 1 };
            s3.OffenseLineup.Add(new GeneralDto { Id = "h", TroopCapacity = 9000 }.ToCombatant(Faction.Offense, "off0"));
            s3.DefenseLineup.Add(boss);
            new BattleRunner(s3).Begin();

            Assert.Single(boss.Formation);
            Assert.Single(boss.Formation[0].Groups);
            Assert.Equal(1, boss.Formation[0].Groups[0].SpriteCols);
        }

        [Fact]
        public void Empty_Row_Layout_Does_Not_Zero_Out_Rows()
        {
            // "Formation": [[]] produces no groups; Rows must keep its authored value rather than collapsing to 0,
            // which would ship a snapshot claiming zero rows while the runner builds one.
            var dto = Boss();
            dto.Rows = 3;
            dto.Formation = new List<List<string>> { new List<string>() };
            var c = dto.ToCombatant(Faction.Defense, "def0");

            Assert.Empty(c.Formation);
            Assert.Equal(3, c.Rows);
        }

        // ── Package D: nhóm GIỮA hàng CUỐI thành 1 hình lớn ─────────────────────────────
        static GeneralDto MidBoss() => new GeneralDto
        {
            Id = "midboss", DisplayName = "Trấn Thủ", Troop = "KyBinh",
            Rows = 2,
            Formation = new List<List<string>>
            {
                new List<string> { "KyBinh", "KyBinh", "KyBinh" },   // row 0 — nguyên
                new List<string> { "KyBinh", "KyBinh", "KyBinh" },   // row 1 (CUỐI) — giữa (idx 1) thành 1 hình
            },
            LastRowMiddleSingle = true, LastRowMiddleVisualId = "102",
            TroopCapacity = 30000,
        };

        [Fact]
        public void MiddleGroupOfLastRow_Becomes_One_Enlarged_Figure()
        {
            var c = MidBoss().ToCombatant(Faction.Defense, "def0");

            Assert.Equal(2, c.Formation.Count);
            var last = c.Formation[1];
            Assert.Equal(3, last.Groups.Count);

            var mid = last.Groups[1];                       // floor(3/2) = 1
            Assert.Equal(1, mid.SpriteCols);
            Assert.Equal(1, mid.SpriteRows);
            Assert.Equal(1.3f, mid.Scale, 3);
            Assert.Equal("102", mid.VisualId);

            // Các nhóm khác giữ nguyên block mặc định.
            Assert.Equal(FormationBuilder.DefaultSpriteCols, c.Formation[0].Groups[0].SpriteCols);
            Assert.Equal(1f, c.Formation[0].Groups[0].Scale, 3);
            Assert.Null(c.Formation[0].Groups[0].VisualId);
            Assert.Equal(FormationBuilder.DefaultSpriteCols, last.Groups[0].SpriteCols);
            Assert.Null(last.Groups[0].VisualId);

            // "1 con" = 1 SPRITE, KHÔNG phải 1 HP → tổng quân giữ nguyên.
            Assert.Equal(30000, c.Troops);
        }

        [Fact]
        public void MiddleFigure_Reaches_The_Wire()
        {
            var setup = new BattleSetup { Seed = 1, Terrain = Terrain.Mountain };
            setup.OffenseLineup.Add(new GeneralDto { Id = "h", Troop = "KyBinh", TroopCapacity = 12000 }
                .ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(MidBoss().ToCombatant(Faction.Defense, "def0"));
            var runner = new BattleRunner(setup);
            runner.Begin();

            var g = BattleSnapshot.From(runner.State).Defense.Queue[0].Formation[1].Groups[1];
            Assert.Equal(1, g.SpriteCols);
            Assert.Equal(1.3f, g.Scale, 3);
            Assert.Equal("102", g.VisualId);

            var snap = BattleSnapshot.From(runner.State);
            var bg = Wire.Deserialize<BattleSnapshot>(Wire.Serialize(snap)).Defense.Queue[0].Formation[1].Groups[1];
            Assert.Equal(1, bg.SpriteCols);
            Assert.Equal(1.3f, bg.Scale, 3);
            Assert.Equal("102", bg.VisualId);
        }

        [Fact]
        public void Phantom_Of_MidBoss_Preserves_The_Middle_Figure()
        {
            var setup = new BattleSetup { Seed = 1, Terrain = Terrain.Mountain };
            setup.OffenseLineup.Add(new GeneralDto { Id = "h", Troop = "KyBinh", TroopCapacity = 12000 }
                .ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(MidBoss().ToCombatant(Faction.Defense, "def0"));
            var session = new BattleSession(setup);
            session.Begin();
            session.CopyArmy(Faction.Defense, PhantomKind.Normal, 1);

            var phantom = session.Snapshot().Defense.Queue
                .Find(c => c.Id != "def0" && c.DisplayName.Contains("Ảo"));
            Assert.NotNull(phantom);

            var last = phantom.Formation[phantom.Formation.Count - 1];
            var mid = last.Groups[last.Groups.Count / 2];
            Assert.Equal("102", mid.VisualId);
            Assert.Equal(1.3f, mid.Scale, 3);
            Assert.Equal(1, mid.SpriteCols);
            Assert.Equal(FormationBuilder.DefaultSpriteCols, last.Groups[0].SpriteCols);
            Assert.Null(last.Groups[0].VisualId);
        }

        [Fact]
        public void Even_GroupCount_TieBreaks_To_Floor()
        {
            var dto = new GeneralDto
            {
                Id = "even", Troop = "KyBinh", Rows = 2,
                Formation = new List<List<string>>
                {
                    new List<string> { "KyBinh", "KyBinh" },
                    new List<string> { "KyBinh", "KyBinh", "KyBinh", "KyBinh" },   // hàng cuối 4 nhóm
                },
                LastRowMiddleSingle = true, LastRowMiddleVisualId = "102",
                TroopCapacity = 24000,
            };
            var c = dto.ToCombatant(Faction.Defense, "def0");
            var last = c.Formation[c.Formation.Count - 1];

            Assert.Equal(4, last.Groups.Count);
            Assert.Equal(1, last.Groups[2].SpriteCols);        // floor(4/2) = 2
            Assert.Equal("102", last.Groups[2].VisualId);
            Assert.Null(last.Groups[0].VisualId);
            Assert.Null(last.Groups[1].VisualId);
            Assert.Null(last.Groups[3].VisualId);
        }

        [Fact]
        public void Flag_Off_Leaves_Formation_Identical()
        {
            var dto = new GeneralDto
            {
                Id = "plainmulti", Troop = "KyBinh", Rows = 2,
                Formation = new List<List<string>>
                {
                    new List<string> { "KyBinh", "KyBinh", "KyBinh" },
                    new List<string> { "KyBinh", "KyBinh", "KyBinh" },
                },
                TroopCapacity = 18000,
            };
            var c = dto.ToCombatant(Faction.Defense, "def0");
            Assert.Null(c.Style);

            foreach (var row in c.Formation)
                foreach (var g in row.Groups)
                {
                    Assert.Equal(FormationBuilder.DefaultSpriteCols, g.SpriteCols);
                    Assert.Equal(1f, g.Scale, 3);
                    Assert.Null(g.VisualId);
                }
        }
    }
}
