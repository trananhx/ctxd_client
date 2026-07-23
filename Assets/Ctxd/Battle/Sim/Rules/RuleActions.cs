using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Applies one <see cref="RuleAction"/> to a resolved (target, groups) pair.</summary>
    public static class RuleActions
    {
        public static void Apply(RuleAction a, TacticContext c, Combatant target, List<Group> groups)
        {
            if (a == null || target == null) return;
            switch (a.Kind)
            {
                case ActionKind.Damage:
                {
                    if (groups == null || groups.Count == 0) return;
                    int baseDmg = CombatOps.TacticDamage(c.Actor, target, c.Tactic, c.EffMult, c.Awakened, c.Terrain, c.Cfg, c.Rng, out bool crit);
                    int dmg = Math.Max(1, (int)Math.Round(baseDmg * (a.PowerScale <= 0 ? 1.0 : a.PowerScale)));
                    int killed = CombatOps.ApplyDamageToGroups(target, groups, dmg, a.Dist, c.Round, c.Events);
                    CombatOps.GainMorale(target, c.Cfg.MoraleOnTakeDamage, c.Cfg, c.Round, c.Events);
                    c.Emit(CombatOps.DamageEvent(c.Round, c.Actor, target, killed, crit, c.Tactic.Kind));
                    break;
                }
                case ActionKind.InstantKill:
                    CombatOps.KillGroups(target, groups, c.Round, c.Events);
                    break;
                case ActionKind.SetToHpPct:
                    CombatOps.SetGroupsToHpPct(target, groups, a.HpPct, c.Round, c.Events);
                    break;
                case ActionKind.Confuse:
                    target.ConfusedTurns = Math.Max(target.ConfusedTurns, a.ConfuseTurns + 1);
                    c.Emit(new BattleEvent { Round = c.Round, Type = BattleEventType.Confusion, Side = c.Actor.Faction,
                        ActorId = c.Actor.Id, TargetId = target.Id, Amount = a.ConfuseTurns, Text = $"{target.DisplayName} bị Hỗn Loạn" });
                    break;
                case ActionKind.Pushback:
                    CombatOps.ApplyDamageToGroups(target, groups, Math.Max(0, a.PushbackTroops), a.Dist, c.Round, c.Events);
                    c.Emit(new BattleEvent { Round = c.Round, Type = BattleEventType.Pushback, Side = c.Actor.Faction,
                        ActorId = c.Actor.Id, TargetId = target.Id, Amount = a.PushbackTroops, Text = $"{target.DisplayName} bị đẩy lùi" });
                    break;
                case ActionKind.Heal:
                case ActionKind.Buff:
                {
                    int heal = (int)Math.Round(c.Actor.Stats.TacticAtk * (a.HealScale <= 0 ? 1.0 : a.HealScale));
                    CombatOps.HealFront(target, heal);
                    c.Emit(CombatOps.DamageEvent(c.Round, c.Actor, target, -heal, false, c.Tactic.Kind));
                    break;
                }
            }
        }
    }
}
