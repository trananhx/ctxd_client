using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class TargetResolverTests
    {
        static Combatant WithRows(string id, params TroopType[][] rows)
        {
            var c = new Combatant { Id = id, DisplayName = id, Faction = Faction.Defense };
            foreach (var r in rows)
            {
                var row = new Row();
                foreach (var t in r) row.Groups.Add(new Group { Troop = t, MaxSoldiers = 30, Soldiers = 30 });
                c.Formation.Add(row);
            }
            c.SyncTroops();
            return c;
        }

        static BattleState State(List<Combatant> def)
        {
            var s = new BattleState
            {
                Offense = new SideState { Faction = Faction.Offense },
                Defense = new SideState { Faction = Faction.Defense },
            };
            s.Offense.Queue.Add(new Combatant { Id = "off", Faction = Faction.Offense, Troops = 10, MaxTroops = 10 });
            foreach (var c in def) s.Defense.Queue.Add(c);
            return s;
        }

        [Fact]
        public void EnemyActive_FrontRow()
        {
            var d0 = WithRows("d0", new[] { TroopType.ThuongBinh, TroopType.CungBinh }, new[] { TroopType.KyBinh });
            var st = State(new List<Combatant> { d0 });
            var sel = new TargetSelect { Scope = TargetScope.EnemyActive, Rows = RowMode.FrontRow };
            var res = TargetResolver.Resolve(sel, st, Faction.Offense);
            Assert.Single(res);
            Assert.Equal(d0, res[0].c);
            Assert.Equal(2, res[0].groups.Count);   // only the front row's 2 groups
        }

        [Fact]
        public void EnemyAll_TroopFilter_CungBinh_Across_Rows()
        {
            var d0 = WithRows("d0", new[] { TroopType.CungBinh, TroopType.KyBinh }, new[] { TroopType.CungBinh });
            var d1 = WithRows("d1", new[] { TroopType.ChienXa });
            var st = State(new List<Combatant> { d0, d1 });
            var sel = new TargetSelect
            {
                Scope = TargetScope.EnemyAll, Rows = RowMode.AllRows,
                FilterByTroop = true, TroopMask = TroopMasks.Of(TroopType.CungBinh),
            };
            var res = TargetResolver.Resolve(sel, st, Faction.Offense);
            Assert.Equal(2, res.Count);
            Assert.Equal(2, res[0].groups.Count);   // d0 has 2 CungBinh groups
            Assert.Empty(res[1].groups);            // d1 has none
            Assert.All(res.SelectMany(r => r.groups), g => Assert.Equal(TroopType.CungBinh, g.Troop));
        }

        [Fact]
        public void MaxGroups_Caps_FrontToBack()
        {
            var d0 = WithRows("d0", new[] { TroopType.CungBinh, TroopType.CungBinh, TroopType.CungBinh });
            var st = State(new List<Combatant> { d0 });
            var sel = new TargetSelect { Scope = TargetScope.EnemyActive, Rows = RowMode.AllRows, MaxGroups = 2 };
            var res = TargetResolver.Resolve(sel, st, Faction.Offense);
            Assert.Equal(2, res[0].groups.Count);
        }
    }
}
