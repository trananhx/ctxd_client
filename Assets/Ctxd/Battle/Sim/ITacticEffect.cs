using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Strategy: how one tactic-effect family (战法) resolves. Register in <see cref="TacticEffects"/>.</summary>
    public interface ITacticEffect
    {
        TacticEffectKind Kind { get; }
        void Apply(TacticContext c);
    }

    /// <summary>Everything an effect needs + ergonomic helpers. Created by the resolver per cast.</summary>
    public sealed class TacticContext
    {
        public Combatant Actor, Target;
        public TacticSpec Tactic;
        public bool Awakened;
        public double StanceMult;
        public Terrain Terrain;
        public int Round;
        public DeterministicRng Rng;
        public BattleConfig Cfg;
        public List<BattleEvent> Events;
        public BattleState State;   // full battle state, for rule targeting (scope beyond the single Target)

        /// <summary>Awakening tactics ignore the stance triangle.</summary>
        public double EffMult => Awakened ? 1.0 : StanceMult;

        public int RollDamage(out bool crit)
            => CombatOps.TacticDamage(Actor, Target, Tactic, EffMult, Awakened, Terrain, Cfg, Rng, out crit);

        public void DealDamage(int amount, bool crit)
        {
            CombatOps.ApplyDamageToFront(Target, amount, Round, Events);
            CombatOps.GainMorale(Target, Cfg.MoraleOnTakeDamage, Cfg, Round, Events);
            Events.Add(CombatOps.DamageEvent(Round, Actor, Target, amount, crit, Tactic.Kind));
        }

        public void Emit(BattleEvent e) => Events.Add(e);
    }
}
