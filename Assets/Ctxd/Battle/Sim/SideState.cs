using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>One faction's ordered general queue (max 5, expandable for 借兵 / Đào Viên).</summary>
    public sealed class SideState
    {
        public Faction Faction;
        public string Nation;
        public readonly List<Combatant> Queue = new List<Combatant>();
        public int ActiveIndex;

        public Combatant Active => (ActiveIndex >= 0 && ActiveIndex < Queue.Count) ? Queue[ActiveIndex] : null;

        public bool HasLiving
        {
            get { for (int i = ActiveIndex; i < Queue.Count; i++) if (Queue[i].Alive) return true; return false; }
        }

        public int TotalTroops { get { int t = 0; foreach (var c in Queue) t += c.Troops; return t; } }

        public void AdvanceToNextLiving() { while (ActiveIndex < Queue.Count && !Queue[ActiveIndex].Alive) ActiveIndex++; }
    }
}
