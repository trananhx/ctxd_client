using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class CombatOpsGroupTests
    {
        static (Combatant c, Group g1, Group g2) OneRowTwoGroups(int a, int b)
        {
            var c = new Combatant { Id = "t", DisplayName = "T", Faction = Faction.Defense };
            var row = new Row();
            var g1 = new Group { Troop = TroopType.CungBinh, MaxSoldiers = a, Soldiers = a };
            var g2 = new Group { Troop = TroopType.ThuongBinh, MaxSoldiers = b, Soldiers = b };
            row.Groups.Add(g1); row.Groups.Add(g2);
            c.Formation.Add(row); c.SyncTroops();
            return (c, g1, g2);
        }

        [Fact]
        public void EvenByHp_Spreads_Proportionally()
        {
            var (c, g1, g2) = OneRowTwoGroups(60, 40); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToGroups(c, new List<Group> { g1, g2 }, 50, Distribution.EvenByHp, 1, ev);
            Assert.Equal(50, killed);
            Assert.Equal(30, g1.Soldiers);   // 50*60/100
            Assert.Equal(20, g2.Soldiers);   // 50*40/100
            Assert.Equal(50, c.Troops);
        }

        [Fact]
        public void FocusFrontFirst_Depletes_First_Group_Then_Next()
        {
            var (c, g1, g2) = OneRowTwoGroups(60, 40); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToGroups(c, new List<Group> { g1, g2 }, 80, Distribution.FocusFrontFirst, 1, ev);
            Assert.Equal(80, killed);
            Assert.Equal(0, g1.Soldiers);
            Assert.Equal(20, g2.Soldiers);
            var killEv = Assert.Single(ev, e => e.Type == BattleEventType.GroupKilled);
            Assert.Equal(TroopType.CungBinh, killEv.Troop);
        }

        [Fact]
        public void Amount_Capped_At_Group_Total()
        {
            var (c, g1, g2) = OneRowTwoGroups(10, 10); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToGroups(c, new List<Group> { g1, g2 }, 999, Distribution.EvenByHp, 1, ev);
            Assert.Equal(20, killed);
            Assert.Equal(0, c.Troops);
        }
    }
}
