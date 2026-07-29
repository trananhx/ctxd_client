using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>
    /// Gói E: va chạm khi hàng đầu chết → hàng sau lao lên chịu 1 nhát "va nhẹ" server tính (deterministic).
    /// Truyền qua BattleEvent.RowAdvanced.Amount (dùng lại field sẵn có — wire không thêm gì).
    /// </summary>
    public class AdvanceClashTests
    {
        static Combatant TwoRow(int cap) => new GeneralDto
        {
            Id = "t", Troop = "KyBinh", Rows = 2,
            Formation = new List<List<string>>
            {
                new List<string> { "KyBinh", "KyBinh", "KyBinh" },
                new List<string> { "KyBinh", "KyBinh", "KyBinh" },
            },
            TroopCapacity = cap,
        }.ToCombatant(Faction.Defense, "def0");

        [Fact]
        public void AdvanceClash_Damages_New_Front_Row_And_Stamps_Amount()
        {
            var t = TwoRow(12000);
            int rearBefore = t.Formation[1].Soldiers;
            var ev = new List<BattleEvent>();

            CombatOps.ApplyDamageToFront(t, t.FrontRow.Soldiers, 1, ev, new BattleConfig { AdvanceClashPct = 0.10 });

            var adv = ev.Find(e => e.Type == BattleEventType.RowAdvanced);
            Assert.NotNull(adv);
            int expected = (int)System.Math.Round(rearBefore * 0.10);
            Assert.Equal(expected, (int)adv.Amount);
            Assert.Equal(rearBefore - expected, t.Formation[1].Soldiers);   // hàng sau bị va nhẹ
        }

        [Fact]
        public void No_Clash_When_Pct_Zero()
        {
            var t = TwoRow(12000);
            int rearBefore = t.Formation[1].Soldiers;
            var ev = new List<BattleEvent>();

            CombatOps.ApplyDamageToFront(t, t.FrontRow.Soldiers, 1, ev, new BattleConfig());   // AdvanceClashPct = 0

            var adv = ev.Find(e => e.Type == BattleEventType.RowAdvanced);
            Assert.Equal(0, (int)adv.Amount);
            Assert.Equal(rearBefore, t.Formation[1].Soldiers);             // hàng sau nguyên vẹn
        }

        [Fact]
        public void Null_Cfg_Preserves_Legacy_Behavior()
        {
            var t = TwoRow(12000);
            int rearBefore = t.Formation[1].Soldiers;
            var ev = new List<BattleEvent>();

            CombatOps.ApplyDamageToFront(t, t.FrontRow.Soldiers, 1, ev);   // cfg null (mọi caller cũ)

            Assert.Equal(0, (int)ev.Find(e => e.Type == BattleEventType.RowAdvanced).Amount);
            Assert.Equal(rearBefore, t.Formation[1].Soldiers);
        }

        [Fact]
        public void Clearing_Last_Row_Has_No_Clash()
        {
            var t = new GeneralDto
            {
                Id = "t", Troop = "KyBinh", Rows = 1,
                Formation = new List<List<string>> { new List<string> { "KyBinh", "KyBinh" } },
                TroopCapacity = 4000,
            }.ToCombatant(Faction.Defense, "def0");
            var ev = new List<BattleEvent>();

            CombatOps.ApplyDamageToFront(t, t.FrontRow.Soldiers, 1, ev, new BattleConfig { AdvanceClashPct = 0.20 });

            var adv = ev.Find(e => e.Type == BattleEventType.RowAdvanced);
            Assert.NotNull(adv);
            Assert.Equal(0, (int)adv.Amount);   // không có hàng sau → không va chạm
        }

        [Fact]
        public void Clash_Is_Deterministic()
        {
            Assert.Equal(ClashAmount(), ClashAmount());

            int ClashAmount()
            {
                var t = TwoRow(12000);
                var ev = new List<BattleEvent>();
                CombatOps.ApplyDamageToFront(t, t.FrontRow.Soldiers, 1, ev, new BattleConfig { AdvanceClashPct = 0.10 });
                return (int)ev.Find(e => e.Type == BattleEventType.RowAdvanced).Amount;
            }
        }
    }
}
