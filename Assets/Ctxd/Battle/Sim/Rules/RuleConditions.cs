namespace Ctxd.Battle.Sim
{
    /// <summary>Deterministic predicate gates for rule steps. Reference target = enemy Active.</summary>
    public static class RuleConditions
    {
        public static bool Eval(RuleCondition cond, TacticContext c)
        {
            if (cond == null) return true;
            var enemy = c.State?.Enemy(c.Actor.Faction)?.Active;
            switch (cond.Kind)
            {
                case ConditionKind.Always: return true;
                case ConditionKind.TargetHpBelowPct: return enemy != null && HpPct(enemy) < cond.Value;
                case ConditionKind.TargetHpAbovePct: return enemy != null && HpPct(enemy) > cond.Value;
                case ConditionKind.ActorMoraleFull: return c.Actor != null && c.Cfg != null && c.Actor.Morale >= c.Cfg.MoraleFull;
                case ConditionKind.TerrainIs: return c.Terrain == cond.Terrain;
                case ConditionKind.TargetTroopPresent: return enemy != null && HasLivingTroop(enemy, cond.Troop);
                case ConditionKind.Chance: return c.Rng != null && c.Rng.Chance(cond.Value);
                default: return true;
            }
        }

        static double HpPct(Combatant c) => c.MaxTroops > 0 ? (double)c.Troops / c.MaxTroops * 100.0 : 0.0;

        static bool HasLivingTroop(Combatant c, TroopType t)
        {
            foreach (var r in c.Formation) foreach (var g in r.Groups) if (g.Alive && g.Troop == t) return true;
            return false;
        }
    }
}
