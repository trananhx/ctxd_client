using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleConditionsTests
    {
        static TacticContext Ctx(int enemyTroops, int enemyMax, int actorMorale = 0)
        {
            var enemy = new Combatant { Id = "e", Faction = Faction.Defense, Troops = enemyTroops, MaxTroops = enemyMax };
            var erow = new Row(); erow.Groups.Add(new Group { Troop = TroopType.CungBinh, MaxSoldiers = enemyMax, Soldiers = enemyTroops });
            enemy.Formation.Add(erow);
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Troops = 10, MaxTroops = 10, Morale = actorMorale };
            var st = new BattleState
            {
                Offense = new SideState { Faction = Faction.Offense },
                Defense = new SideState { Faction = Faction.Defense },
            };
            st.Offense.Queue.Add(actor); st.Defense.Queue.Add(enemy);
            return new TacticContext { Actor = actor, Target = enemy, State = st, Cfg = new BattleConfig(), Rng = new DeterministicRng(1), Terrain = Terrain.Plain };
        }

        [Fact] public void Always_True() => Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.Always }, Ctx(50, 100)));

        [Fact]
        public void TargetHpBelowPct()
        {
            var c = Ctx(20, 100);
            Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetHpBelowPct, Value = 30 }, c));
            Assert.False(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetHpBelowPct, Value = 10 }, c));
        }

        [Fact]
        public void TargetTroopPresent()
        {
            var c = Ctx(50, 100);
            Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetTroopPresent, Troop = TroopType.CungBinh }, c));
            Assert.False(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetTroopPresent, Troop = TroopType.ChienXa }, c));
        }

        [Fact]
        public void TerrainIs()
        {
            var c = Ctx(50, 100);
            Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TerrainIs, Terrain = Terrain.Plain }, c));
            Assert.False(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TerrainIs, Terrain = Terrain.Water }, c));
        }
    }
}
