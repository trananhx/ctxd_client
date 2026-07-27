using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    /// <summary>Stage 2B: khắc chế binh chủng PER-TƯỚNG (Thức tỉnh/tech) cộng chồng lên vòng ring universal.</summary>
    public class Stage2BTests
    {
        static Combatant U(TroopType t, Dictionary<int, double> counter = null)
            => new Combatant { Id = "u", Troop = t, MaxTroops = 1000, Troops = 1000, CounterVsTroop = counter };

        [Fact]
        public void PerGeneral_Counter_Stacks_On_Ring()
        {
            var cfg = new BattleConfig();   // ring: KyBinh(骑)→ChienXa(器械) = +TroopCounterBonus
            var a = U(TroopType.KyBinh, new Dictionary<int, double> { { (int)TroopType.ChienXa, 0.15 } });
            Assert.Equal(1.0 + cfg.TroopCounterBonus + 0.15, CombatOps.TroopMult(a, U(TroopType.ChienXa), cfg), 6);
        }

        [Fact]
        public void PerGeneral_Counter_Applies_Outside_Ring()
        {
            var cfg = new BattleConfig();   // ring KHÔNG cho KyBinh khắc CungBinh
            var a = U(TroopType.KyBinh, new Dictionary<int, double> { { (int)TroopType.CungBinh, 0.25 } });
            Assert.Equal(1.25, CombatOps.TroopMult(a, U(TroopType.CungBinh), cfg), 6);
        }

        [Fact]
        public void PerGeneral_Counter_Only_On_Matching_Enemy_Troop()
        {
            var cfg = new BattleConfig { TroopCounterRing = null };   // cô lập per-tướng
            var a = U(TroopType.KyBinh, new Dictionary<int, double> { { (int)TroopType.CungBinh, 0.30 } });
            Assert.Equal(1.30, CombatOps.TroopMult(a, U(TroopType.CungBinh), cfg), 6);   // khớp
            Assert.Equal(1.0, CombatOps.TroopMult(a, U(TroopType.KyBinh), cfg), 6);      // không khớp
        }

        [Fact]
        public void Null_CounterVsTroop_Preserves_Stage1_Ring()
        {
            var cfg = new BattleConfig();
            Assert.Equal(1.0 + cfg.TroopCounterBonus, CombatOps.TroopMult(U(TroopType.KyBinh), U(TroopType.ChienXa), cfg));
        }
    }
}
