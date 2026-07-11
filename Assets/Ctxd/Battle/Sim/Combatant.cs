using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>A general + their troops in a side's queue. Troops act as HP (GDD: lính = máu tướng).</summary>
    public sealed class Combatant
    {
        public string Id, DefId, DisplayName;
        public Faction Faction;
        public TroopType Troop;
        public GeneralStats Stats;
        public int MaxTroops, Troops, Morale;
        public bool Awakened, FiveStar;
        public TacticSpec Skill1, Skill2;
        public int ConfusedTurns;
        public string FormationId;
        public int Rows = 4;
        public Stance LastStance;
        public bool HasLastStance;

        /// <summary>Rows of troop-groups (server-authoritative geometry). Combat depletes the FRONT living row first.</summary>
        public readonly List<Row> Formation = new List<Row>();
        public bool HasFormation => Formation.Count > 0;

        public bool Alive => Troops > 0;
        public bool Confused => ConfusedTurns > 0;

        /// <summary>First row that still has living soldiers, or null.</summary>
        public Row FrontRow { get { foreach (var r in Formation) if (r.Alive) return r; return null; } }
        public int LivingRows { get { int n = 0; foreach (var r in Formation) if (r.Alive) n++; return n; } }

        /// <summary>Recompute the cached <see cref="Troops"/> total from the formation (call after mutating groups).</summary>
        public void SyncTroops() { if (!HasFormation) return; int s = 0; foreach (var r in Formation) s += r.Soldiers; Troops = s; }
    }
}
