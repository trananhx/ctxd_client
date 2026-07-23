using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    public class EndToEndRuleTests
    {
        static Combatant Hero(string id, Faction f, TacticSpec skill2, params TroopType[] frontRow)
        {
            var c = new Combatant
            {
                Id = id, DisplayName = id, Faction = f, Troop = frontRow.Length > 0 ? frontRow[0] : TroopType.ThuongBinh,
                Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0), MaxTroops = 0, Rows = 1, Skill2 = skill2,
            };
            var row = new Row(); foreach (var t in frontRow) row.Groups.Add(new Group { Troop = t, MaxSoldiers = 40, Soldiers = 40 });
            c.Formation.Add(row); c.SyncTroops(); c.MaxTroops = c.Troops;
            return c;
        }

        static TacticProgram Prog(params RuleStep[] steps) { var p = new TacticProgram(); p.Steps.AddRange(steps); return p; }

        static TacticSpec KillAllChienXa() => new TacticSpec
        {
            Id = "phaxa", DisplayName = "Phá Xa Lệnh", Kind = TacticEffectKind.Rule,
            Program = Prog(new RuleStep
            {
                Select = new TargetSelect { Scope = TargetScope.EnemyAll, Rows = RowMode.AllRows, FilterByTroop = true, TroopMask = TroopMasks.Of(TroopType.ChienXa) },
                Action = new RuleAction { Kind = ActionKind.InstantKill },
            }),
        };

        static BattleSetup Setup()
        {
            var off = Hero("off", Faction.Offense, KillAllChienXa(), TroopType.KyBinh);
            var def0 = Hero("def0", Faction.Defense, null, TroopType.ChienXa, TroopType.CungBinh);
            var def1 = Hero("def1", Faction.Defense, null, TroopType.ChienXa);
            var setup = new BattleSetup { Terrain = Terrain.Plain, Seed = 12345, OffenseNation = "A", DefenseNation = "B" };
            setup.OffenseLineup.Add(off);
            setup.DefenseLineup.Add(def0);
            setup.DefenseLineup.Add(def1);
            return setup;
        }

        [Fact]
        public void Skill_Kills_ChienXa_Across_Lineup_Through_Session()
        {
            var session = new BattleSession(Setup());
            session.Begin();
            session.TestApi(TestApiKind.UseSkill, Faction.Offense);   // offense casts its rule Skill2 (no morale/turn dependency)

            var snap = session.Snapshot();
            var chienXa = snap.Defense.Queue
                .SelectMany(c => c.Formation)
                .SelectMany(r => r.Groups)
                .Where(g => g.Troop == TroopType.ChienXa)
                .ToList();
            Assert.NotEmpty(chienXa);
            Assert.All(chienXa, g => Assert.Equal(0, g.Soldiers));
        }

        [Fact]
        public void Same_Seed_Produces_Identical_Event_Log()
        {
            List<BattleEvent> Run()
            {
                var s = new BattleSession(Setup());
                var ev = new List<BattleEvent>();
                ev.AddRange(s.Begin());
                ev.AddRange(s.TestApi(TestApiKind.UseSkill, Faction.Offense));
                ev.AddRange(s.TestApi(TestApiKind.Attack, Faction.Defense));
                return ev;
            }
            var a = Run(); var b = Run();
            Assert.Equal(a.Count, b.Count);
            for (int i = 0; i < a.Count; i++)
            {
                Assert.Equal(a[i].Type, b[i].Type);
                Assert.Equal(a[i].Amount, b[i].Amount);
                Assert.Equal(a[i].Troop, b[i].Troop);
            }
        }
    }
}
