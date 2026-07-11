using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Visual/tactical shape of a troop row (set by formation/situation). The sim treats it as a hint.</summary>
    public enum RowShape { HangNgang, CanhCung }

    /// <summary>
    /// A cluster of soldiers of one troop type. <see cref="Soldiers"/> act as HP; <see cref="SpriteCols"/>×<see cref="SpriteRows"/>
    /// is the SYMBOLIC on-field sprite count (a 6-sprite group can represent hundreds of troops).
    /// </summary>
    public sealed class Group
    {
        public TroopType Troop;
        public int MaxSoldiers, Soldiers;
        public int SpriteCols = FormationBuilder.DefaultSpriteCols;
        public int SpriteRows = FormationBuilder.DefaultSpriteRows;
        public bool Alive => Soldiers > 0;
    }

    /// <summary>One row of groups. Rows engage SEQUENTIALLY: only the front living row fights; cleared → the next advances.</summary>
    public sealed class Row
    {
        public RowShape Shape = RowShape.HangNgang;
        public readonly List<Group> Groups = new List<Group>();

        public int Soldiers { get { int s = 0; foreach (var g in Groups) s += g.Soldiers; return s; } }
        public int MaxSoldiers { get { int s = 0; foreach (var g in Groups) s += g.MaxSoldiers; return s; } }
        public bool Alive { get { foreach (var g in Groups) if (g.Alive) return true; return false; } }
    }

    /// <summary>Builds a Combatant's row/group formation from a layout (per-group troop types) + a total troop budget.</summary>
    public static class FormationBuilder
    {
        public const int DefaultGroupsPerRow = 3;
        public const int DefaultSpriteCols = 3, DefaultSpriteRows = 2;   // a×b = 6 sprites/group

        /// <summary>Uniform formation: rows×groupsPerRow groups, all one troop type, total split evenly.</summary>
        public static List<Row> Uniform(int rows, int groupsPerRow, TroopType troop, int totalTroops)
        {
            rows = rows < 1 ? 1 : rows;
            groupsPerRow = groupsPerRow < 1 ? 1 : groupsPerRow;
            var layout = new List<List<TroopType>>(rows);
            for (int r = 0; r < rows; r++)
            {
                var row = new List<TroopType>(groupsPerRow);
                for (int c = 0; c < groupsPerRow; c++) row.Add(troop);
                layout.Add(row);
            }
            return FromLayout(layout, totalTroops);
        }

        /// <summary>Explicit per-group troop-type layout (rows × groups). Total split evenly across all groups.</summary>
        public static List<Row> FromLayout(List<List<TroopType>> layout, int totalTroops)
        {
            var rows = new List<Row>();
            if (layout == null) return rows;
            int groupCount = 0;
            foreach (var r in layout) groupCount += (r?.Count ?? 0);
            if (groupCount <= 0) return rows;

            int per = Math.Max(1, totalTroops / groupCount);
            int remainder = Math.Max(0, totalTroops - per * groupCount);
            foreach (var rl in layout)
            {
                if (rl == null) continue;
                var row = new Row();
                foreach (var t in rl)
                {
                    int s = per + (remainder > 0 ? 1 : 0);
                    if (remainder > 0) remainder--;
                    row.Groups.Add(new Group { Troop = t, MaxSoldiers = s, Soldiers = s });
                }
                rows.Add(row);
            }
            return rows;
        }
    }
}
