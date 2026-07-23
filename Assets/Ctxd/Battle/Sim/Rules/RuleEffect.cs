namespace Ctxd.Battle.Sim
{
    /// <summary>Interprets a <see cref="TacticProgram"/> — the single strategy behind data-driven skills.</summary>
    public sealed class RuleEffect : ITacticEffect
    {
        private static readonly DamageEffect _fallback = new DamageEffect();
        public TacticEffectKind Kind => TacticEffectKind.Rule;

        public void Apply(TacticContext c)
        {
            var prog = c.Tactic?.Program;
            if (prog == null || prog.Steps == null || prog.Steps.Count == 0) { _fallback.Apply(c); return; }
            foreach (var step in prog.Steps)
            {
                if (step == null) continue;
                if (!RuleConditions.Eval(step.Condition, c)) continue;
                var targets = TargetResolver.Resolve(step.Select, c.State, c.Actor.Faction);
                foreach (var (combatant, groups) in targets)
                    RuleActions.Apply(step.Action, c, combatant, groups);
            }
        }
    }
}
