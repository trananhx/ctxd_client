using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Resolves a step's <see cref="TargetSelect"/> into (combatant, groups) — deterministic, front→back.</summary>
    public static class TargetResolver
    {
        public static List<(Combatant c, List<Group> groups)> Resolve(TargetSelect s, BattleState state, Faction actorFaction)
        {
            var result = new List<(Combatant, List<Group>)>();
            if (s == null || state == null) return result;
            var ally = state.Side(actorFaction);
            var enemy = state.Enemy(actorFaction);
            foreach (var c in SelectCombatants(s.Scope, ally, enemy))
            {
                if (c == null || !c.Alive) continue;
                result.Add((c, SelectGroups(s, c)));
            }
            return result;
        }

        static IEnumerable<Combatant> SelectCombatants(TargetScope scope, SideState ally, SideState enemy)
        {
            switch (scope)
            {
                case TargetScope.EnemyActive: return One(enemy?.Active);
                case TargetScope.EnemyAll:    return Living(enemy);
                case TargetScope.AllyAll:     return Living(ally);
                case TargetScope.AllySelf:
                case TargetScope.AllyActive:  return One(ally?.Active);
                default:                      return One(enemy?.Active);
            }
        }

        static IEnumerable<Combatant> One(Combatant c) { if (c != null) yield return c; }

        static IEnumerable<Combatant> Living(SideState side)
        {
            if (side == null) yield break;
            foreach (var c in side.Queue) if (c != null && c.Alive) yield return c;   // Queue order = deterministic
        }

        static List<Group> SelectGroups(TargetSelect s, Combatant c)
        {
            var rows = new List<Row>();
            var living = new List<Row>();
            foreach (var r in c.Formation) if (r.Alive) living.Add(r);
            switch (s.Rows)
            {
                case RowMode.FrontRow:   if (living.Count > 0) rows.Add(living[0]); break;
                case RowMode.FrontNRows: for (int i = 0; i < living.Count && i < Math.Max(1, s.RowCount); i++) rows.Add(living[i]); break;
                case RowMode.RowIndex:   if (s.RowIndexValue >= 0 && s.RowIndexValue < c.Formation.Count) rows.Add(c.Formation[s.RowIndexValue]); break;
                case RowMode.AllRows:    rows.AddRange(living); break;
            }
            var groups = new List<Group>();
            foreach (var r in rows)
                foreach (var g in r.Groups)
                    if (g.Alive && (!s.FilterByTroop || TroopMasks.Has(s.TroopMask, g.Troop)))
                        groups.Add(g);
            if (s.MaxGroups > 0 && groups.Count > s.MaxGroups) groups = groups.GetRange(0, s.MaxGroups);
            return groups;
        }
    }
}
