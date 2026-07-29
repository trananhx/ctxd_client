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
        // [Stage 2A] hệ số chuỗi + Loạn Vũ (mặc định trung tính → không đổi hành vi cũ).
        public double ChainMult = 1.0;
        public bool LuanwuActive;

        /// <summary>Awakening tactics ignore the stance triangle.</summary>
        public double EffMult => Awakened ? 1.0 : StanceMult;

        public int RollDamage(out bool crit) => RollDamage(out crit, out _);

        public int RollDamage(out bool crit, out bool miss)
        {
            int d = CombatOps.TacticDamage(Actor, Target, Tactic, EffMult, Awakened, Terrain, Cfg, Rng, out crit, out miss);
            if (miss) return 0;
            double m = ChainMult * (LuanwuActive ? Cfg.LuanwuMult : 1.0);   // suy giảm chuỗi × Loạn Vũ
            return System.Math.Max(1, (int)System.Math.Round(d * m));
        }

        public void DealDamage(int amount, bool crit) => DealDamage(amount, crit, false);

        public void DealDamage(int amount, bool crit, bool miss)
        {
            if (!miss)
            {
                CombatOps.ApplyDamageToFront(Target, amount, Round, Events, Cfg);
                CombatOps.GainMorale(Target, Cfg.MoraleOnTakeDamage, Cfg, Round, Events);
            }
            Events.Add(CombatOps.DamageEvent(Round, Actor, Target, miss ? 0 : amount, crit, Tactic.Kind, miss));
        }

        public void Emit(BattleEvent e) => Events.Add(e);
    }
}
