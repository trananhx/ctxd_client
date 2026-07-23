using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>A skill's behavior = an ordered list of rule steps (select → condition → act).</summary>
    public sealed class TacticProgram
    {
        public List<RuleStep> Steps = new List<RuleStep>();
    }

    public sealed class RuleStep
    {
        public TargetSelect Select = new TargetSelect();
        public RuleCondition Condition = new RuleCondition();
        public RuleAction Action = new RuleAction();
    }

    /// <summary>Which combatants + which groups within each. Deterministic (front→back order).</summary>
    public sealed class TargetSelect
    {
        public TargetScope Scope = TargetScope.EnemyActive;
        public RowMode Rows = RowMode.FrontRow;
        public int RowCount = 1;        // RowMode.FrontNRows
        public int RowIndexValue = 0;   // RowMode.RowIndex
        public bool FilterByTroop = false;
        public int TroopMask = 0;       // [Flags] bit per (int)TroopType; ignored unless FilterByTroop
        public int MaxGroups = 0;       // 0 == unlimited
    }

    public sealed class RuleCondition
    {
        public ConditionKind Kind = ConditionKind.Always;
        public double Value;            // pct / probability
        public Terrain Terrain;         // ConditionKind.TerrainIs
        public TroopType Troop;         // ConditionKind.TargetTroopPresent
    }

    public sealed class RuleAction
    {
        public ActionKind Kind = ActionKind.Damage;
        public double PowerScale = 1.0; // Damage / Pushback
        public Distribution Dist = Distribution.EvenByHp;
        public double HpPct = 0.0;      // SetToHpPct
        public int ConfuseTurns = 1;    // Confuse
        public int PushbackTroops = 0;  // Pushback
        public double HealScale = 1.0;  // Heal / Buff
    }

    /// <summary>Bit-mask helpers over <see cref="TroopType"/>.</summary>
    public static class TroopMasks
    {
        public static int Of(params TroopType[] troops)
        {
            int m = 0;
            if (troops != null) foreach (var t in troops) m |= 1 << (int)t;
            return m;
        }
        public static bool Has(int mask, TroopType t) => (mask & (1 << (int)t)) != 0;
    }
}
