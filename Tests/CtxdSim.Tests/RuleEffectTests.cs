using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleEffectTests
    {
        static Combatant Def(string id, params TroopType[] frontRow)
        {
            var c = new Combatant { Id = id, DisplayName = id, Faction = Faction.Defense };
            var row = new Row(); foreach (var t in frontRow) row.Groups.Add(new Group { Troop = t, MaxSoldiers = 40, Soldiers = 40 });
            c.Formation.Add(row); c.SyncTroops();
            return c;
        }

        [Fact]
        public void KillAll_ChienXa_Across_Whole_Enemy_Lineup()
        {
            var d0 = Def("d0", TroopType.ChienXa, TroopType.CungBinh);
            var d1 = Def("d1", TroopType.ChienXa);
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0) };
            var st = new BattleState { Offense = new SideState { Faction = Faction.Offense }, Defense = new SideState { Faction = Faction.Defense } };
            st.Offense.Queue.Add(actor); st.Defense.Queue.Add(d0); st.Defense.Queue.Add(d1);

            var prog = new TacticProgram();
            prog.Steps.Add(new RuleStep
            {
                Select = new TargetSelect { Scope = TargetScope.EnemyAll, Rows = RowMode.AllRows, FilterByTroop = true, TroopMask = TroopMasks.Of(TroopType.ChienXa) },
                Action = new RuleAction { Kind = ActionKind.InstantKill },
            });
            var tactic = new TacticSpec { Kind = TacticEffectKind.Rule, Program = prog };
            var ctx = new TacticContext { Actor = actor, Target = d0, Tactic = tactic, State = st, Cfg = new BattleConfig(), Rng = new DeterministicRng(1), Terrain = Terrain.Plain, Round = 1, Events = new List<BattleEvent>() };

            TacticEffects.Get(TacticEffectKind.Rule).Apply(ctx);

            Assert.Equal(0, d0.Formation[0].Groups[0].Soldiers); // ChienXa gone
            Assert.Equal(40, d0.Formation[0].Groups[1].Soldiers); // CungBinh intact
            Assert.Equal(0, d1.Troops);                           // d1 was all ChienXa
        }

        [Fact]
        public void Null_Program_Falls_Back_To_Damage()
        {
            var d0 = Def("d0", TroopType.ThuongBinh);
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0) };
            var st = new BattleState { Offense = new SideState { Faction = Faction.Offense }, Defense = new SideState { Faction = Faction.Defense } };
            st.Offense.Queue.Add(actor); st.Defense.Queue.Add(d0);
            var tactic = new TacticSpec { Kind = TacticEffectKind.Rule, Program = null, Power = 1.0 };
            var ctx = new TacticContext { Actor = actor, Target = d0, Tactic = tactic, State = st, Cfg = new BattleConfig(), Rng = new DeterministicRng(1), Terrain = Terrain.Plain, Round = 1, Events = new List<BattleEvent>() };
            TacticEffects.Get(TacticEffectKind.Rule).Apply(ctx);
            Assert.True(d0.Troops < 40);   // fell back to a normal damage hit on the front row
        }
    }
}
