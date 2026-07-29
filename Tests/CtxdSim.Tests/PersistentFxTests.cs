using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>
    /// Gói A: FX BỀN server-driven (buff giữ liên tục / lửa qua vài hiệp) truyền qua snapshot.
    /// Gói B: field render FX một-phát trên BattleEvent.
    /// </summary>
    public class PersistentFxTests
    {
        static BattleRunner Runner()
        {
            var setup = new BattleSetup { Seed = 1, Terrain = Terrain.Plain };
            setup.OffenseLineup.Add(new GeneralDto { Id = "off", Troop = "KyBinh", TroopCapacity = 12000 }.ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(new GeneralDto { Id = "def", Troop = "KyBinh", TroopCapacity = 12000 }.ToCombatant(Faction.Defense, "def0"));
            var r = new BattleRunner(setup);
            r.Begin();
            return r;
        }

        [Fact]
        public void AddOrRefresh_DoesNotDuplicate()
        {
            var s = new SideState { Faction = Faction.Offense };
            s.AddOrRefreshEffect("buff", 3);
            s.AddOrRefreshEffect("buff", 5);                   // trùng fxId + rowIndex -1 → refresh, không nhân đôi
            Assert.Single(s.Effects);
            Assert.Equal(5, s.Effects[0].RemainingRounds);

            s.AddOrRefreshEffect("buff", 5, rowIndex: 0);      // khác rowIndex → mục mới (stack)
            Assert.Equal(2, s.Effects.Count);
        }

        [Fact]
        public void Effects_Decrement_Per_Round_And_UntilRemoved_Survives()
        {
            var r = Runner();
            r.State.Offense.AddOrRefreshEffect("burn", 2);      // hết sau 2 hiệp
            r.State.Offense.AddOrRefreshEffect("aura", -1);     // UntilRemoved

            r.StepRound(new TurnInput(Stance.TanCong));
            Assert.Contains(r.State.Offense.Effects, e => e.FxId == "burn");        // còn sau 1

            r.StepRound(new TurnInput(Stance.TanCong));
            Assert.DoesNotContain(r.State.Offense.Effects, e => e.FxId == "burn");  // hết sau 2
            Assert.Contains(r.State.Offense.Effects, e => e.FxId == "aura");        // UntilRemoved vẫn sống
        }

        [Fact]
        public void Effects_Project_To_Snapshot_And_RoundTrip()
        {
            var r = Runner();
            r.State.Defense.AddOrRefreshEffect("fire", 3, FxAnchorKind.RowCenter, rowIndex: 1, sorting: 780);

            var snap = BattleSnapshot.From(r.State);
            Assert.Null(snap.Offense.Effects);                 // rỗng → null (0-drift)
            Assert.NotNull(snap.Defense.Effects);
            var fx = snap.Defense.Effects[0];
            Assert.Equal("fire", fx.FxId);
            Assert.Equal(FxAnchorKind.RowCenter, fx.Anchor);
            Assert.Equal(1, fx.RowIndex);
            Assert.Equal(780, fx.SortingOrder);
            Assert.Equal(3, fx.RemainingRounds);

            var back = Wire.Deserialize<BattleSnapshot>(Wire.Serialize(snap));
            var bfx = back.Defense.Effects[0];
            Assert.Equal("fire", bfx.FxId);
            Assert.Equal(FxAnchorKind.RowCenter, bfx.Anchor);
            Assert.Equal(780, bfx.SortingOrder);
        }

        [Fact]
        public void Empty_Effects_Omitted_From_Wire()
        {
            var json = Wire.Serialize(BattleSnapshot.From(Runner().State));
            Assert.DoesNotContain("\"Effects\"", json);        // không FX → không có khoá → wire byte-identical
        }

        [Fact]
        public void BuffCast_Registers_A_Persistent_Aura_On_Caster_Side()
        {
            var actor = new GeneralDto { Id = "a", Troop = "KyBinh", TroopCapacity = 10000 }.ToCombatant(Faction.Offense, "off0");
            var state = new BattleState { Offense = new SideState { Faction = Faction.Offense }, Defense = new SideState { Faction = Faction.Defense } };
            state.Offense.Queue.Add(actor);
            var ctx = new TacticContext
            {
                Actor = actor, Target = actor, State = state, Cfg = new BattleConfig(), Round = 1,
                Events = new List<BattleEvent>(), Tactic = new TacticSpec { Kind = TacticEffectKind.Buff, Power = 1.0 },
            };

            new BuffEffect().Apply(ctx);

            Assert.Single(state.Offense.Effects);
            Assert.Equal("buff", state.Offense.Effects[0].FxId);
            Assert.Equal(new BattleConfig().BuffAuraRounds, state.Offense.Effects[0].RemainingRounds);
        }

        [Fact]
        public void FireTactic_Damages_And_Registers_Persistent_Fire_On_Target_Side()
        {
            var actor = new GeneralDto { Id = "a", Troop = "KyBinh", TroopCapacity = 10000 }.ToCombatant(Faction.Offense, "off0");
            var target = new GeneralDto { Id = "t", Troop = "BoBinh", TroopCapacity = 12000, Rows = 2 }.ToCombatant(Faction.Defense, "def0");
            var state = new BattleState { Offense = new SideState { Faction = Faction.Offense }, Defense = new SideState { Faction = Faction.Defense } };
            state.Offense.Queue.Add(actor); state.Defense.Queue.Add(target);
            // target cần formation để ApplyFire lan theo hàng
            target.Formation.AddRange(FormationBuilder.Uniform(2, 3, TroopType.ThuongBinh, 12000));
            target.SyncTroops();
            var ev = new List<BattleEvent>();
            var cfg = new BattleConfig();

            TacticEffects.Get(TacticEffectKind.Fire).Apply(new TacticContext
            {
                Actor = actor, Target = target, State = state, Cfg = cfg, Round = 1, Events = ev,
                Tactic = new TacticSpec { Kind = TacticEffectKind.Fire, RowsHit = 2 },
            });

            Assert.True(target.Troops < 12000);                                        // có sát thương
            Assert.Contains(ev, e => e.Type == BattleEventType.Fire);                  // event lửa phát ra
            Assert.Single(state.Defense.Effects);                                      // FX bền trên phe BỊ ĐỐT
            Assert.Equal("fire", state.Defense.Effects[0].FxId);
            Assert.Equal(cfg.FireDurationRounds, state.Defense.Effects[0].RemainingRounds);
            Assert.Empty(state.Offense.Effects);                                       // phe đốt không có lửa
        }

        [Fact]
        public void LowHp_Swaps_Group_VisualId_ServerSide()
        {
            var setup = new BattleSetup { Seed = 1 };
            setup.OffenseLineup.Add(new GeneralDto { Id = "h", Troop = "KyBinh", TroopCapacity = 30000 }.ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(new GeneralDto { Id = "g", Troop = "BoBinh", TroopCapacity = 12000, Rows = 2, LowHpVisualId = "43" }
                .ToCombatant(Faction.Defense, "def0"));
            var r = new BattleRunner(setup); r.Begin();

            var def = setup.DefenseLineup[0];
            Assert.Null(def.Formation[0].Groups[0].VisualId);                          // đầu trận: hình gốc

            // đánh hàng đầu xuống dưới 50% rồi bước 1 hiệp → rule server đổi hình các nhóm tổn thương
            CombatOps.ApplyDamageRaw(def, def.FrontRow.Soldiers * 6 / 10);
            r.StepRound(new TurnInput(Stance.TanCong));

            bool swapped = false;
            foreach (var row in def.Formation)
                foreach (var g in row.Groups)
                    if (g.Alive && g.Soldiers < g.MaxSoldiers * 0.5f) { Assert.Equal("43", g.VisualId); swapped = true; }
            Assert.True(swapped);                                                      // có ít nhất 1 nhóm đã gãy giáp
        }

        [Fact]
        public void BattleEvent_Fx_Fields_Default_Omit_And_RoundTrip()
        {
            var e = new BattleEvent { Round = 1, Type = BattleEventType.TacticCast };
            Assert.Null(e.Sorting);
            Assert.Null(e.AnchorRows);
            Assert.False(e.AnchorWholeGroup);

            var json = Wire.Serialize(e);
            Assert.DoesNotContain("\"Sorting\"", json);        // nullable → omit khi không set
            Assert.DoesNotContain("\"AnchorRows\"", json);

            var pop = new BattleEvent { Round = 2, Type = BattleEventType.TacticCast, Sorting = 250, AnchorRows = 2, AnchorWholeGroup = true, LifetimeSec = 3.5f };
            var back = Wire.Deserialize<BattleEvent>(Wire.Serialize(pop));
            Assert.Equal(250, back.Sorting);
            Assert.Equal(2, back.AnchorRows);
            Assert.True(back.AnchorWholeGroup);
            Assert.Equal(3.5f, back.LifetimeSec, 3);
        }
    }
}
