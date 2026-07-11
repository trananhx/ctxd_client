using System.Collections.Generic;

namespace Ctxd.Battle.Sim.Net
{
    /// <summary>
    /// Serializable projection of the server-side <see cref="BattleState"/>. The client renders from these
    /// snapshots + the event log; it never holds a live <see cref="BattleRunner"/> and never recomputes numbers.
    /// </summary>
    /// <summary>One troop-group: troop type + HP (soldiers) + symbolic sprite count.</summary>
    public sealed class GroupSnapshot
    {
        public TroopType Troop;
        public int MaxSoldiers, Soldiers;
        public int SpriteCols, SpriteRows;
    }

    /// <summary>One row of groups (engages as a unit; front living row fights first).</summary>
    public sealed class RowSnapshot
    {
        public RowShape Shape;
        public List<GroupSnapshot> Groups = new List<GroupSnapshot>();
    }

    public sealed class CombatantSnapshot
    {
        public string Id, DefId, DisplayName;
        public Faction Faction;
        public TroopType Troop;
        public int MaxTroops, Troops, Morale;
        public bool Awakened, FiveStar, Alive;
        public int Rows;                          // configured row count
        public string FormationId;
        public string Skill1Id, Skill1Name, Skill2Id, Skill2Name;
        public List<RowSnapshot> Formation;       // server-authoritative rows of groups (client renders these)
    }

    public sealed class SideSnapshot
    {
        public Faction Faction;
        public string Nation;
        public int ActiveIndex;
        public List<CombatantSnapshot> Queue = new List<CombatantSnapshot>();
    }

    public sealed class BattleSnapshot
    {
        public Terrain Terrain;
        public int Round;
        public BattleOutcome Outcome;
        public SideSnapshot Offense, Defense;

        public static BattleSnapshot From(BattleState s) => new BattleSnapshot
        {
            Terrain = s.Terrain,
            Round = s.Round,
            Outcome = s.Outcome,
            Offense = SideFrom(s.Offense),
            Defense = SideFrom(s.Defense),
        };

        private static SideSnapshot SideFrom(SideState side)
        {
            var snap = new SideSnapshot { Faction = side.Faction, Nation = side.Nation, ActiveIndex = side.ActiveIndex };
            foreach (var c in side.Queue) snap.Queue.Add(From(c));
            return snap;
        }

        public static CombatantSnapshot From(Combatant c) => new CombatantSnapshot
        {
            Id = c.Id, DefId = c.DefId, DisplayName = c.DisplayName,
            Faction = c.Faction, Troop = c.Troop,
            MaxTroops = c.MaxTroops, Troops = c.Troops, Morale = c.Morale,
            Awakened = c.Awakened, FiveStar = c.FiveStar, Alive = c.Alive, Rows = c.Rows,
            FormationId = c.FormationId,
            Skill1Id = c.Skill1?.Id, Skill1Name = c.Skill1?.DisplayName,
            Skill2Id = c.Skill2?.Id, Skill2Name = c.Skill2?.DisplayName,
            Formation = RowsFrom(c.Formation),
        };

        private static List<RowSnapshot> RowsFrom(List<Row> rows)
        {
            var list = new List<RowSnapshot>();
            if (rows == null) return list;
            foreach (var r in rows)
            {
                var rs = new RowSnapshot { Shape = r.Shape };
                foreach (var g in r.Groups)
                    rs.Groups.Add(new GroupSnapshot
                    {
                        Troop = g.Troop, MaxSoldiers = g.MaxSoldiers, Soldiers = g.Soldiers,
                        SpriteCols = g.SpriteCols, SpriteRows = g.SpriteRows,
                    });
                list.Add(rs);
            }
            return list;
        }
    }
}
