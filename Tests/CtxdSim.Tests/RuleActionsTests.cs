using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleActionsTests
    {
        static (TacticContext c, Combatant target, List<Group> groups) Setup(int soldiers)
        {
            var target = new Combatant { Id = "t", Faction = Faction.Defense };
            var row = new Row(); var g = new Group { Troop = TroopType.ChienXa, MaxSoldiers = soldiers, Soldiers = soldiers };
            row.Groups.Add(g); target.Formation.Add(row); target.SyncTroops();
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0) };
            var ctx = new TacticContext
            {
                Actor = actor, Target = target, Tactic = new TacticSpec { Kind = TacticEffectKind.Rule },
                Cfg = new BattleConfig(), Rng = new DeterministicRng(7), Terrain = Terrain.Plain,
                Round = 1, Events = new List<BattleEvent>(),
            };
            return (ctx, target, new List<Group> { g });
        }

        [Fact]
        public void InstantKill_Zeroes()
        {
            var (c, t, groups) = Setup(80);
            RuleActions.Apply(new RuleAction { Kind = ActionKind.InstantKill }, c, t, groups);
            Assert.Equal(0, t.Troops);
        }

        [Fact]
        public void Damage_Reduces()
        {
            var (c, t, groups) = Setup(5000);
            RuleActions.Apply(new RuleAction { Kind = ActionKind.Damage, PowerScale = 1.0, Dist = Distribution.EvenByHp }, c, t, groups);
            Assert.True(t.Troops < 5000);
        }

        [Fact]
        public void Confuse_Sets_Turns_And_Event()
        {
            var (c, t, groups) = Setup(50);
            RuleActions.Apply(new RuleAction { Kind = ActionKind.Confuse, ConfuseTurns = 2 }, c, t, groups);
            Assert.True(t.ConfusedTurns >= 2);
            Assert.Contains(c.Events, e => e.Type == BattleEventType.Confusion);
        }
    }
}
