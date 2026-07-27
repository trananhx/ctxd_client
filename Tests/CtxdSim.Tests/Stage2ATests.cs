using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    /// <summary>Đặc tả Stage 2A theo RE mobile: né (report3 'ms'), beHold (report14 phản/giữ),
    /// chuỗi chiến pháp (nextTacticId), buff Loạn Vũ.</summary>
    public class Stage2ATests
    {
        static Combatant Unit(TroopType t, Faction f = Faction.Offense)
            => new Combatant { Id = "u", DisplayName = "U", Faction = f, Troop = t, MaxTroops = 1000, Troops = 1000 };

        static Combatant Hero(string id, Faction f, int strategy, TacticSpec skill2, TacticSpec skill1 = null, bool fiveStar = true)
            => new Combatant
            {
                Id = id, DisplayName = id, Faction = f, Troop = TroopType.KyBinh, MaxTroops = 500000, Rows = 2, FiveStar = fiveStar,
                Stats = new GeneralStats(100, 80, 100, 80, strategy, 0), Skill1 = skill1, Skill2 = skill2,
            };

        static TacticSpec Dmg(string id, string next = null) => new TacticSpec
        { Id = id, DisplayName = id, Kind = TacticEffectKind.Damage, Power = 1.0, RowsHit = 1, NextTacticId = next };

        static (BattleRunner r, Combatant off, Combatant def) Battle(Combatant off, Combatant def, BattleConfig cfg = null)
        {
            var setup = new BattleSetup { Terrain = Terrain.Plain, Seed = 1, OffenseNation = "A", DefenseNation = "B", Config = cfg ?? new BattleConfig() };
            setup.OffenseLineup.Add(off); setup.DefenseLineup.Add(def);
            var r = new BattleRunner(setup);
            r.Begin();
            return (r, off, def);
        }

        // ── 1. Né (dodge / 'ms') ──────────────────────────────────────────────────
        [Fact]
        public void Dodge_ZeroChance_Never_Misses()
        {
            var cfg = new BattleConfig();                       // DodgeChance = 0 mặc định
            var rng = new DeterministicRng(7);
            var a = Unit(TroopType.KyBinh); var b = Unit(TroopType.CungBinh, Faction.Defense);
            for (int i = 0; i < 50; i++)
            { CombatOps.BasicDamage(a, b, 1.0, Terrain.Plain, cfg, rng, out _, out bool miss); Assert.False(miss); }
        }

        [Fact]
        public void Dodge_FullChance_Always_Misses_For_Zero_Damage()
        {
            var cfg = new BattleConfig { DodgeChance = 1.0 };
            var rng = new DeterministicRng(7);
            int dmg = CombatOps.BasicDamage(Unit(TroopType.KyBinh), Unit(TroopType.CungBinh, Faction.Defense),
                                            1.0, Terrain.Plain, cfg, rng, out _, out bool miss);
            Assert.True(miss); Assert.Equal(0, dmg);
        }

        [Fact]
        public void Dodge_Awakened_And_Undodgeable_Never_Miss()
        {
            var cfg = new BattleConfig { DodgeChance = 1.0 };
            var rng = new DeterministicRng(7);
            var a = Unit(TroopType.KyBinh); var b = Unit(TroopType.CungBinh, Faction.Defense);
            var normal = Dmg("n"); var undodge = new TacticSpec { Id = "u", Kind = TacticEffectKind.Damage, Power = 1.0, Undodgeable = true };
            CombatOps.TacticDamage(a, b, undodge, 1.0, false, Terrain.Plain, cfg, rng, out _, out bool m1); Assert.False(m1); // undodgeable
            CombatOps.TacticDamage(a, b, normal, 1.0, true, Terrain.Plain, cfg, rng, out _, out bool m2); Assert.False(m2);  // awakened
            CombatOps.TacticDamage(a, b, normal, 1.0, false, Terrain.Plain, cfg, rng, out _, out bool m3); Assert.True(m3);  // thường → né
        }

        // ── 2. beHold (phản/giữ) ──────────────────────────────────────────────────
        [Fact]
        public void BeHold_BothCast_LowerStrategy_Is_Held()
        {
            var (r, _, _) = Battle(Hero("strong", Faction.Offense, 100, Dmg("s2a")),
                                   Hero("weak", Faction.Defense, 50, Dmg("s2b")));
            var ev = r.StepRound(new TurnInput(Stance.TanCong, cast: true));   // cả 2 đều đủ nộ (FiveStar) → cùng cast
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticHeld && e.Side == Faction.Defense && e.BeHold > 0);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Defense);
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense);
        }

        [Fact]
        public void BeHold_Awakened_Is_Unblockable()
        {
            var weak = Hero("weak", Faction.Defense, 50, new TacticSpec { Id = "s2b", Kind = TacticEffectKind.Damage, Power = 1.0, IsAwakening = true });
            weak.Awakened = true;   // AutoBrain sẽ set awaken=true
            var (r, _, _) = Battle(Hero("strong", Faction.Offense, 100, Dmg("s2a")), weak);
            var ev = r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticHeld && e.Side == Faction.Defense);
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Defense);
        }

        [Fact]
        public void BeHold_Only_One_Casts_No_Hold()
        {
            var def = Hero("def", Faction.Defense, 50, null, fiveStar: false);   // không Skill2 → không cast
            var (r, _, _) = Battle(Hero("off", Faction.Offense, 100, Dmg("s2a")), def);
            var ev = r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticHeld);
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense);
        }

        // ── 3. Chuỗi chiến pháp (nextTacticId) ────────────────────────────────────
        [Fact]
        public void Chain_Follows_NextTacticId()
        {
            var off = Hero("off", Faction.Offense, 60, Dmg("link1", next: "link2"), skill1: Dmg("link2"));  // link2 đăng ký qua Skill1
            var def = Hero("def", Faction.Defense, 50, null, fiveStar: false);
            var (r, _, _) = Battle(off, def);
            var ev = r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense && e.ChainDepth == 0);
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticChain && e.Side == Faction.Offense && e.ChainDepth == 1);
        }

        [Fact]
        public void Chain_Respects_MaxTacticChain()
        {
            var off = Hero("off", Faction.Offense, 60, Dmg("link1", next: "link2"), skill1: Dmg("link2"));
            var def = Hero("def", Faction.Defense, 50, null, fiveStar: false);
            var (r, _, _) = Battle(off, def, new BattleConfig { MaxTacticChain = 1 });   // cấm chuỗi
            var ev = r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticChain);
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.ChainDepth == 0);
        }

        // ── 4. Loạn Vũ ────────────────────────────────────────────────────────────
        [Fact]
        public void Luanwu_Grant_Sets_Buff()
        {
            var s2 = new TacticSpec { Id = "lw", DisplayName = "Loạn Vũ", Kind = TacticEffectKind.Buff, Power = 0.1, GrantsLuanwu = true };
            var off = Hero("off", Faction.Offense, 60, s2);
            var def = Hero("def", Faction.Defense, 50, null, fiveStar: false);
            var (r, o, _) = Battle(off, def);
            Assert.Equal(0, o.LuanwuTurns);
            r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.True(o.LuanwuTurns >= 1);   // set 2, giảm 1 cuối hiệp → còn ≥1
        }

        // ── beHold fixes (review) ─────────────────────────────────────────────────
        [Fact]
        public void BeHold_Held_Actor_Loses_Morale()   // [FIX] lượt nộ bị tiêu dù bị giữ → không kẹt vòng
        {
            var (r, o, _) = Battle(Hero("off", Faction.Offense, 50, Dmg("s2a")),   // 计策 thấp → bị giữ
                                   Hero("def", Faction.Defense, 100, Dmg("s2b")));
            r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.Equal(0, o.Morale);   // MoraleAfterTacticReset
        }

        [Fact]
        public void BeHold_Reflect_Damages_Actor_On_Large_Gap()   // beHold 2/3 = phản chiến
        {
            var (r, o, _) = Battle(Hero("off", Faction.Offense, 30, Dmg("s2a")),    // gap 70 ≥ 2×30 → beHold=2
                                   Hero("def", Faction.Defense, 100, Dmg("s2b")));
            int before = o.Troops;
            var ev = r.StepRound(new TurnInput(Stance.TanCong, cast: true));
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticHeld && e.Side == Faction.Offense && e.BeHold >= 2);
            Assert.True(o.Troops < before);   // chiến pháp bị bật ngược → off chịu sát thương phản
        }
    }
}
