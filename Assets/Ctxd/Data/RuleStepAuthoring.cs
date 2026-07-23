using System;
using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;
using Terrain = Ctxd.Battle.Sim.Terrain;   // disambiguate from UnityEngine.Terrain

namespace Ctxd.Data
{
    /// <summary>Inspector-authorable form of one rule step (flat fields → sim <see cref="RuleStep"/>).</summary>
    [Serializable]
    public sealed class RuleStepAuthoring
    {
        [Header("Select — combatants & groups")]
        public TargetScope scope = TargetScope.EnemyActive;
        public RowMode rows = RowMode.FrontRow;
        [Min(1)] public int rowCount = 1;
        [Min(0)] public int rowIndexValue = 0;
        public bool filterByTroop = false;
        public List<TroopType> troopFilter = new List<TroopType>();   // OR-ed into a mask
        [Min(0)] public int maxGroups = 0;

        [Header("Condition — gate (optional)")]
        public ConditionKind conditionKind = ConditionKind.Always;
        public float conditionValue = 0f;
        public Terrain conditionTerrain = Terrain.Plain;
        public TroopType conditionTroop = TroopType.CungBinh;

        [Header("Action")]
        public ActionKind actionKind = ActionKind.Damage;
        public float powerScale = 1f;
        public Distribution dist = Distribution.EvenByHp;
        public float hpPct = 0f;
        public int confuseTurns = 1;
        public int pushbackTroops = 0;
        public float healScale = 1f;

        public RuleStep ToRuleStep() => new RuleStep
        {
            Select = new TargetSelect
            {
                Scope = scope, Rows = rows, RowCount = rowCount, RowIndexValue = rowIndexValue,
                FilterByTroop = filterByTroop,
                TroopMask = troopFilter != null ? TroopMasks.Of(troopFilter.ToArray()) : 0,
                MaxGroups = maxGroups,
            },
            Condition = new RuleCondition
            {
                Kind = conditionKind, Value = conditionValue, Terrain = conditionTerrain, Troop = conditionTroop,
            },
            Action = new RuleAction
            {
                Kind = actionKind, PowerScale = powerScale, Dist = dist, HpPct = hpPct,
                ConfuseTurns = confuseTurns, PushbackTroops = pushbackTroops, HealScale = healScale,
            },
        };
    }
}
