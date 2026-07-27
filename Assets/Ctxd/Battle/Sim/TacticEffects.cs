using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>
    /// Registry of tactic-effect strategies (Strategy + Registry pattern). Add/override an effect at runtime
    /// with <see cref="Register"/> — no resolver change. Defaults cover the GDD §8 effect families.
    /// </summary>
    public static class TacticEffects
    {
        private static readonly Dictionary<TacticEffectKind, ITacticEffect> _map = new Dictionary<TacticEffectKind, ITacticEffect>();

        static TacticEffects()
        {
            Register(new DamageEffect());
            Register(new AoeDamageEffect());
            Register(new ConfusionEffect());
            Register(new InstantTo1HpEffect());
            Register(new PushbackEffect());
            Register(new BuffEffect());
            Register(new HealEffect());
            Register(new RuleEffect());
        }

        public static void Register(ITacticEffect effect) => _map[effect.Kind] = effect;

        public static ITacticEffect Get(TacticEffectKind kind)
            => _map.TryGetValue(kind, out var e) ? e : _map[TacticEffectKind.Damage];
    }

    public sealed class DamageEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.Damage;
        public void Apply(TacticContext c) { int d = c.RollDamage(out bool crit, out bool miss); c.DealDamage(d, crit, miss); }
    }

    public sealed class AoeDamageEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.AoeDamage;
        public void Apply(TacticContext c) { int d = c.RollDamage(out bool crit, out bool miss); c.DealDamage(d, crit, miss); } // rows via Tactic.RowsHit
    }

    public sealed class ConfusionEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.Confusion;
        public void Apply(TacticContext c)
        {
            int d = c.RollDamage(out bool crit);
            c.DealDamage(d, crit);
            c.Target.ConfusedTurns = Math.Max(c.Target.ConfusedTurns, c.Tactic.ConfusionTurns + 1); // +1 survives this round's decrement
            c.Emit(new BattleEvent { Round = c.Round, Type = BattleEventType.Confusion, Side = c.Actor.Faction,
                ActorId = c.Actor.Id, TargetId = c.Target.Id, Amount = c.Tactic.ConfusionTurns,
                Text = $"{c.Target.DisplayName} bị Hỗn Loạn" });
        }
    }

    public sealed class InstantTo1HpEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.InstantTo1Hp;
        public void Apply(TacticContext c)
        {
            // GDD: forces front RowsHit/Rows of troops to ~1 HP — big hit, but never lethal by itself.
            double frac = Math.Min(1.0, (double)c.Tactic.RowsHit / Math.Max(1, c.Target.Rows));
            int removed = (int)Math.Round(c.Target.MaxTroops * frac);
            removed = Math.Min(removed, Math.Max(0, c.Target.Troops - 1));
            c.DealDamage(removed, false);
        }
    }

    public sealed class PushbackEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.Pushback;
        public void Apply(TacticContext c)
        {
            int d = c.RollDamage(out bool crit, out bool miss);
            c.DealDamage(miss ? 0 : d + c.Tactic.PushbackTroops, crit, miss);
            if (miss) return;   // né → không đẩy lùi
            c.Emit(new BattleEvent { Round = c.Round, Type = BattleEventType.Pushback, Side = c.Actor.Faction,
                ActorId = c.Actor.Id, TargetId = c.Target.Id, Amount = c.Tactic.PushbackTroops,
                Text = $"{c.Target.DisplayName} bị đẩy lùi" });
        }
    }

    public sealed class BuffEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.Buff;
        public void Apply(TacticContext c)
        {
            int heal = (int)Math.Round(c.Actor.Stats.TacticAtk * c.Tactic.Power);
            CombatOps.HealFront(c.Actor, heal);
            c.Emit(CombatOps.DamageEvent(c.Round, c.Actor, c.Actor, -heal, false, c.Tactic.Kind));
        }
    }

    public sealed class HealEffect : ITacticEffect
    {
        public TacticEffectKind Kind => TacticEffectKind.Heal;
        public void Apply(TacticContext c)
        {
            int heal = (int)Math.Round(c.Actor.Stats.TacticAtk * c.Tactic.Power);
            CombatOps.HealFront(c.Actor, heal);
            c.Emit(CombatOps.DamageEvent(c.Round, c.Actor, c.Actor, -heal, false, c.Tactic.Kind));
        }
    }
}
