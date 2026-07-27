using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.Tests
{
    /// <summary>
    /// Đặc tả hành vi ĐÃ CHỈNH theo reverse-engineering bản MOBILE 攻城掠地 v8.9:
    ///   (1) khắc chế binh chủng 4 hệ (步克弓/弓克骑/骑克器械/器械克步),
    ///   (2) thiên phú % Lực chiến theo địa hình (thay affinity-theo-binh-chủng cũ; City chỉ phe Công),
    ///   (3) nộ cast THỦ CÔNG (đầy nộ mà không bấm → không thả), (4) snapshot CanCast.
    /// </summary>
    public class ReAlignmentTests
    {
        static Combatant Unit(TroopType troop, Faction f = Faction.Offense)
            => new Combatant { Id = "u", DisplayName = "U", Faction = f, Troop = troop, MaxTroops = 1000, Troops = 1000 };

        // ── 1. Khắc chế binh chủng — vòng mobile mặc định ─────────────────────────
        [Fact]
        public void TroopCounter_Cavalry_Beats_Siege_But_Not_Reverse()
        {
            var cfg = new BattleConfig();                 // ring mobile mặc định
            Assert.Equal(1.0 + cfg.TroopCounterBonus, CombatOps.TroopMult(Unit(TroopType.KyBinh), Unit(TroopType.ChienXa), cfg)); // 骑克器械
            Assert.Equal(1.0, CombatOps.TroopMult(Unit(TroopType.ChienXa), Unit(TroopType.KyBinh), cfg));                          // ngược lại: không khắc
        }

        [Fact]
        public void TroopCounter_FullCycle_Holds()
        {
            var cfg = new BattleConfig();
            double b = 1.0 + cfg.TroopCounterBonus;
            Assert.Equal(b, CombatOps.TroopMult(Unit(TroopType.ThuongBinh), Unit(TroopType.CungBinh), cfg)); // 步克弓
            Assert.Equal(b, CombatOps.TroopMult(Unit(TroopType.CungBinh), Unit(TroopType.KyBinh), cfg));     // 弓克骑
            Assert.Equal(b, CombatOps.TroopMult(Unit(TroopType.KyBinh), Unit(TroopType.ChienXa), cfg));      // 骑克器械
            Assert.Equal(b, CombatOps.TroopMult(Unit(TroopType.ChienXa), Unit(TroopType.ThuongBinh), cfg));  // 器械克步
        }

        [Fact]
        public void TroopCounter_MuuSi_Outside_Ring_Is_Neutral()
        {
            var cfg = new BattleConfig();
            Assert.Equal(1.0, CombatOps.TroopMult(Unit(TroopType.MuuSi), Unit(TroopType.KyBinh), cfg));
            Assert.Equal(1.0, CombatOps.TroopMult(Unit(TroopType.KyBinh), Unit(TroopType.MuuSi), cfg));
        }

        [Fact]
        public void TroopCounter_NullRing_Reverts_To_Webgame_Neutral()   // 2013: 兵种互不相克
        {
            var cfg = new BattleConfig { TroopCounterRing = null };
            Assert.Equal(1.0, CombatOps.TroopMult(Unit(TroopType.KyBinh), Unit(TroopType.ChienXa), cfg));
        }

        // ── 2. Thiên phú % Lực chiến theo địa hình ────────────────────────────────
        [Fact]
        public void TerrainBonus_Applies_Only_On_Matching_Terrain()
        {
            var cfg = new BattleConfig();
            var u = Unit(TroopType.KyBinh);
            u.TerrainBonus = new Dictionary<int, double> { { (int)Terrain.Plain, 0.25 } };
            Assert.Equal(1.25, CombatOps.TerrainMult(u, Terrain.Plain, cfg), 6);
            Assert.Equal(1.0, CombatOps.TerrainMult(u, Terrain.Water, cfg), 6);
        }

        [Fact]
        public void TerrainBonus_Null_Is_Neutral()   // RE: KHÔNG còn affinity theo binh chủng như code cũ
        {
            var cfg = new BattleConfig();
            Assert.Equal(1.0, CombatOps.TerrainMult(Unit(TroopType.KyBinh), Terrain.Plain, cfg), 6);
        }

        [Fact]
        public void City_TerrainBonus_Applies_To_Offense_Only()   // 城池战力仅攻方
        {
            var cfg = new BattleConfig();
            var off = Unit(TroopType.KyBinh, Faction.Offense);
            var def = Unit(TroopType.KyBinh, Faction.Defense);
            off.TerrainBonus = new Dictionary<int, double> { { (int)Terrain.City, 0.30 } };
            def.TerrainBonus = new Dictionary<int, double> { { (int)Terrain.City, 0.30 } };
            Assert.Equal(1.30, CombatOps.TerrainMult(off, Terrain.City, cfg), 6);
            Assert.Equal(1.0, CombatOps.TerrainMult(def, Terrain.City, cfg), 6);
        }

        // ── 3. Nộ cast THỦ CÔNG ───────────────────────────────────────────────────
        static BattleSetup CastSetup()
        {
            var off = new Combatant
            {
                Id = "off", DisplayName = "Off", Troop = TroopType.KyBinh, MaxTroops = 2000, Rows = 2, FiveStar = true,
                Skill2 = new TacticSpec { Id = "s2", DisplayName = "Chiến Pháp", Kind = TacticEffectKind.Damage, Power = 1.5, RowsHit = 1 },
            };
            var def = new Combatant { Id = "def", DisplayName = "Def", Troop = TroopType.ThuongBinh, MaxTroops = 2000, Rows = 2 };
            var setup = new BattleSetup { Terrain = Terrain.Plain, Seed = 999, OffenseNation = "A", DefenseNation = "B" };
            setup.OffenseLineup.Add(off);
            setup.DefenseLineup.Add(def);
            return setup;
        }

        [Fact]
        public void FullMorale_Without_Cast_Does_Not_Release_Tactic()
        {
            var r = new BattleRunner(CastSetup());        // off FiveStar → nộ đầy ngay hồi 1
            r.Begin();
            var ev = r.StepRound(new TurnInput(Stance.TanCong, awaken: false, cast: false));
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense);
        }

        [Fact]
        public void FullMorale_With_Cast_Releases_Tactic()
        {
            var r = new BattleRunner(CastSetup());
            r.Begin();
            var ev = r.StepRound(new TurnInput(Stance.TanCong, awaken: false, cast: true));
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense);
        }

        // ── 4. Snapshot.CanCast = useAble ─────────────────────────────────────────
        [Fact]
        public void Snapshot_CanCast_Reflects_UseAble()
        {
            var skill = new TacticSpec { Id = "s", DisplayName = "S", Kind = TacticEffectKind.Damage };
            var ready = new Combatant { Id = "a", Troop = TroopType.KyBinh, Morale = 100, Skill2 = skill, MaxTroops = 100, Troops = 100 };
            var lowMorale = new Combatant { Id = "b", Troop = TroopType.KyBinh, Morale = 50, Skill2 = skill, MaxTroops = 100, Troops = 100 };
            var confused = new Combatant { Id = "c", Troop = TroopType.KyBinh, Morale = 100, Skill2 = skill, ConfusedTurns = 1, MaxTroops = 100, Troops = 100 };
            Assert.True(BattleSnapshot.From(ready).CanCast);
            Assert.False(BattleSnapshot.From(lowMorale).CanCast);
            Assert.False(BattleSnapshot.From(confused).CanCast);
        }
    }
}
