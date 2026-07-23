using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class CombatOpsKillTests
    {
        static Combatant Mixed()
        {
            var c = new Combatant { Id = "t", DisplayName = "T", Faction = Faction.Defense };
            var row = new Row();
            row.Groups.Add(new Group { Troop = TroopType.ChienXa, MaxSoldiers = 50, Soldiers = 50 });
            row.Groups.Add(new Group { Troop = TroopType.CungBinh, MaxSoldiers = 50, Soldiers = 50 });
            c.Formation.Add(row); c.SyncTroops();
            return c;
        }

        [Fact]
        public void KillGroups_Zeroes_And_Emits()
        {
            var c = Mixed(); var ev = new List<BattleEvent>();
            var g = c.Formation[0].Groups[0]; // ChienXa
            int killed = CombatOps.KillGroups(c, new List<Group> { g }, 1, ev);
            Assert.Equal(50, killed);
            Assert.Equal(0, g.Soldiers);
            Assert.Equal(50, c.Troops);       // CungBinh untouched
            var e = Assert.Single(ev, x => x.Type == BattleEventType.GroupKilled);
            Assert.Equal(TroopType.ChienXa, e.Troop);
        }

        [Fact]
        public void SetGroupsToHpPct_Zero_Leaves_One()
        {
            var c = Mixed(); var ev = new List<BattleEvent>();
            var g = c.Formation[0].Groups[1]; // CungBinh 50
            int removed = CombatOps.SetGroupsToHpPct(c, new List<Group> { g }, 0.0, 1, ev);
            Assert.Equal(49, removed);
            Assert.Equal(1, g.Soldiers);
        }
    }
}
