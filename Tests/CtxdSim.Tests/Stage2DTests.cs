using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>Stage 2D: Surround (包围) + Phantom (幻影).</summary>
    public class Stage2DTests
    {
        static Combatant Small(Faction f, int troops)
            => new Combatant { Id = f.ToString(), DisplayName = f.ToString(), Faction = f, Troop = TroopType.KyBinh,
                MaxTroops = troops, Troops = troops, Rows = 3, Stats = new GeneralStats(100, 80, 100, 80, 60, 0) };

        static Combatant Caster(Faction f, int troops)
        { var c = Small(f, troops); c.FiveStar = true; c.Skill2 = new TacticSpec { Id = "s2", Kind = TacticEffectKind.Damage, Power = 1.0, RowsHit = 1 }; return c; }

        static (BattleRunner r, List<BattleEvent> ev) FirstRound(Combatant off, Combatant def, BattleConfig cfg = null)
        {
            var setup = new BattleSetup { Terrain = Terrain.Plain, Seed = 1, Config = cfg ?? new BattleConfig() };
            setup.OffenseLineup.Add(off); setup.DefenseLineup.Add(def);
            var r = new BattleRunner(setup); r.Begin();
            return (r, r.StepRound(new TurnInput(Stance.TanCong, cast: true)));
        }

        static BattleSession PhantomSession(BattleConfig cfg = null)
        {
            var setup = new BattleSetup { Terrain = Terrain.Plain, Seed = 1, Config = cfg ?? new BattleConfig() };
            setup.OffenseLineup.Add(Small(Faction.Offense, 60000));
            setup.DefenseLineup.Add(Small(Faction.Defense, 60000));
            var s = new BattleSession(setup); s.Begin();
            return s;
        }

        // ── Surround ──────────────────────────────────────────────────────────────
        [Fact]
        public void Surround_Triggers_When_Enemy_Exceeds_Ratio()
        {
            var (r, ev) = FirstRound(Small(Faction.Offense, 10000), Small(Faction.Defense, 100000));   // 100k ≥ 5×10k
            Assert.Contains(ev, e => e.Type == BattleEventType.SurroundBegin && e.Side == Faction.Offense);
            Assert.True(r.State.Offense.Surrounded);
        }

        [Fact]
        public void Surround_No_Trigger_Below_Ratio()
        {
            var (r, ev) = FirstRound(Small(Faction.Offense, 30000), Small(Faction.Defense, 100000));   // 100k < 5×30k
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.SurroundBegin);
            Assert.False(r.State.Offense.Surrounded);
        }

        [Fact]
        public void Surround_Slams_Active_Periodically()
        {
            var (_, ev) = FirstRound(Small(Faction.Offense, 10000), Small(Faction.Defense, 100000), new BattleConfig { SurroundSlamPeriod = 1 });
            Assert.Contains(ev, e => e.Type == BattleEventType.SurroundSlam && e.Side == Faction.Offense && e.Amount > 0);
        }

        [Fact]
        public void Surround_Blocks_Cast()
        {
            var (r, ev) = FirstRound(Caster(Faction.Offense, 10000), Small(Faction.Defense, 100000), new BattleConfig { SurroundSlamPeriod = 5 });
            Assert.True(r.State.Offense.Surrounded);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense);
            var snap = BattleSnapshot.From(r.State);
            Assert.False(snap.Offense.Queue[snap.Offense.ActiveIndex].CanCast);   // bị vây → nút cast tắt
            Assert.True(snap.Offense.Surrounded);
        }

        // ── Phantom ───────────────────────────────────────────────────────────────
        [Fact]
        public void Phantom_Copies_Active_To_Queue_End_With_Kind()
        {
            var s = PhantomSession();
            int before = s.Snapshot().Offense.Queue.Count;
            var ev = s.CopyArmy(Faction.Offense, PhantomKind.Tuji, 1);
            Assert.Contains(ev, e => e.Type == BattleEventType.PhantomSpawned && e.Side == Faction.Offense);
            var q = s.Snapshot().Offense.Queue;
            Assert.Equal(before + 1, q.Count);
            Assert.True(q[q.Count - 1].IsPhantom);
            Assert.Equal(PhantomKind.Tuji, q[q.Count - 1].Phantom);
        }

        [Fact]
        public void Phantom_Formation_Is_Deep_Copied()   // giết hàng của bản gốc KHÔNG ảnh hưởng ảo ảnh
        {
            var s = PhantomSession();
            s.CopyArmy(Faction.Offense, PhantomKind.Normal, 1);
            var q0 = s.Snapshot().Offense.Queue;
            int phantomBefore = q0[q0.Count - 1].Troops;
            s.TestApi(TestApiKind.KillRow, Faction.Offense);   // giết hàng đầu tướng ACTIVE (bản gốc)
            var q1 = s.Snapshot().Offense.Queue;
            Assert.Equal(phantomBefore, q1[q1.Count - 1].Troops);   // ảo ảnh nguyên vẹn → không share reference
        }

        [Fact]
        public void Phantom_Respects_PhantomMax()
        {
            var s = PhantomSession(new BattleConfig { PhantomMax = 2 });
            s.CopyArmy(Faction.Offense, PhantomKind.Normal, 5);   // xin 5, trần 2
            Assert.Equal(2, s.Snapshot().Offense.Queue.Count(c => c.IsPhantom));
        }
    }
}
