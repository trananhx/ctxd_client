using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class ApplyDamageToFrontCharacterizationTests
    {
        static Combatant TwoRows(int perRow)
        {
            var c = new Combatant { Id = "t", DisplayName = "T", Faction = Faction.Defense };
            var r0 = new Row(); r0.Groups.Add(new Group { Troop = TroopType.ThuongBinh, MaxSoldiers = perRow, Soldiers = perRow });
            var r1 = new Row(); r1.Groups.Add(new Group { Troop = TroopType.CungBinh, MaxSoldiers = perRow, Soldiers = perRow });
            c.Formation.Add(r0); c.Formation.Add(r1); c.SyncTroops();
            return c;
        }

        [Fact]
        public void Partial_Hit_Front_Row_No_Kill()
        {
            var c = TwoRows(100); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToFront(c, 40, 1, ev);
            Assert.Equal(40, killed);
            Assert.Equal(60, c.Formation[0].Soldiers);
            Assert.Equal(100, c.Formation[1].Soldiers);
            Assert.Equal(160, c.Troops);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.RowAdvanced);
        }

        [Fact]
        public void Exact_Front_Row_Clears_And_Advances()
        {
            var c = TwoRows(100); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToFront(c, 100, 1, ev);
            Assert.Equal(100, killed);
            Assert.Equal(0, c.Formation[0].Soldiers);
            Assert.Equal(100, c.Formation[1].Soldiers);
            Assert.Contains(ev, e => e.Type == BattleEventType.RowAdvanced);
        }

        [Fact]
        public void Overkill_Spills_To_Next_Row()
        {
            var c = TwoRows(100); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToFront(c, 250, 1, ev);
            Assert.Equal(200, killed);              // capped at total troops
            Assert.Equal(0, c.Troops);
            Assert.Equal(2, ev.FindAll(e => e.Type == BattleEventType.RowAdvanced).Count);
        }
    }
}
