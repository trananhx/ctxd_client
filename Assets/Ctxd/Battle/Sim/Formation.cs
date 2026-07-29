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
        public float Scale = 1f;      // multiplies the field-wide unit scale (1 = normal soldier)
        public string VisualId;       // null = art chosen by troop type; set = a specific UnitVisualDefinition
        public bool Alive => Soldiers > 0;
    }

    /// <summary>
    /// Per-general override of how a unit is DRAWN — never how it fights. Lets a scenario author one oversized
    /// figure (a boss / duel unit) instead of the default 3 groups × 6 sprites, without inventing troop types.
    /// <para>Every field is opt-in: 0 or null means "keep the default", so existing generals are untouched.
    /// <see cref="GroupsPerRow"/> belongs here rather than on the layout because the formation is rebuilt from
    /// scratch on several paths (reinforcement, phantom, deputy) that only know the combatant, not its JSON.</para>
    /// </summary>
    public sealed class GroupStyle
    {
        public int GroupsPerRow;              // 0 → BattleConfig.GroupsPerRow (3)
        public int SpriteCols, SpriteRows;    // 0 → 3 × 2 = 6 sprites
        public float Scale;                   // 0 → 1×
        public string VisualId;               // null → by troop type

        // ── Package D: nhóm GIỮA hàng CUỐI thành MỘT hình lớn (không đụng nhóm khác) ──
        public bool LastRowMiddleSingle;      // true → middle group of the LAST row = one enlarged figure
        public string LastRowMiddleVisualId;  // art "B" cho hình đó; null → giữ art của nhóm
        public float LastRowMiddleScale;      // 0 → FormationBuilder.DefaultLastRowMiddleScale (1.3)

        // ── [G2] Dáng hàng (thế trận cánh cung). Client chỉ UỐN hàng ĐANG giao tranh (rowSlot 0) —
        // ngữ nghĩa "engagedShape": hàng sau thẳng, tiến lên hàng đầu mới cong. Nằm trên style để sống qua 6 đường rebuild.
        public RowShape RowShape = RowShape.HangNgang;
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
        public const float DefaultLastRowMiddleScale = 1.3f;            // Package D: +30% so lính thường

        /// <summary>Uniform formation: rows×groupsPerRow groups, all one troop type, total split evenly.
        /// A <paramref name="style"/> with GroupsPerRow set WINS over the caller's value — the rebuild paths
        /// (reinforcement / phantom / deputy) all pass the config default, which would silently re-split a
        /// single-figure boss back into three groups.</summary>
        public static List<Row> Uniform(int rows, int groupsPerRow, TroopType troop, int totalTroops, GroupStyle style = null)
        {
            if (style != null && style.GroupsPerRow > 0) groupsPerRow = style.GroupsPerRow;
            rows = rows < 1 ? 1 : rows;
            groupsPerRow = groupsPerRow < 1 ? 1 : groupsPerRow;
            var layout = new List<List<TroopType>>(rows);
            for (int r = 0; r < rows; r++)
            {
                var row = new List<TroopType>(groupsPerRow);
                for (int c = 0; c < groupsPerRow; c++) row.Add(troop);
                layout.Add(row);
            }
            return FromLayout(layout, totalTroops, style);
        }

        /// <summary>Explicit per-group troop-type layout (rows × groups). Total split evenly across all groups.</summary>
        public static List<Row> FromLayout(List<List<TroopType>> layout, int totalTroops, GroupStyle style = null)
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
                if (style != null && style.RowShape != RowShape.HangNgang) row.Shape = style.RowShape;   // [G2]
                foreach (var t in rl)
                {
                    int s = per + (remainder > 0 ? 1 : 0);
                    if (remainder > 0) remainder--;
                    row.Groups.Add(NewGroup(t, s, style));
                }
                rows.Add(row);
            }

            // ── Package D: nhóm GIỮA của hàng CUỐI (đã dựng) → 1 hình lớn; HP + nhóm khác giữ nguyên ──
            // Đặt Ở ĐÂY (choke point của cả 6 đường rebuild) nên phantom/viện binh/phó tướng đều giữ được hình.
            if (style != null && style.LastRowMiddleSingle && rows.Count > 0)
            {
                var last = rows[rows.Count - 1];
                int gc = last.Groups.Count;
                if (gc > 0)
                {
                    var g = last.Groups[gc / 2];          // floor(n/2): giữa (chẵn → upper-middle)
                    g.SpriteCols = 1; g.SpriteRows = 1;   // "1 con" = 1 SPRITE (Soldiers/HP giữ nguyên)
                    g.Scale = style.LastRowMiddleScale > 0f ? style.LastRowMiddleScale : DefaultLastRowMiddleScale;
                    if (!string.IsNullOrEmpty(style.LastRowMiddleVisualId)) g.VisualId = style.LastRowMiddleVisualId;
                }
            }
            return rows;
        }

        static Group NewGroup(TroopType troop, int soldiers, GroupStyle style)
        {
            var g = new Group { Troop = troop, MaxSoldiers = soldiers, Soldiers = soldiers };
            if (style == null) return g;
            if (style.SpriteCols > 0) g.SpriteCols = style.SpriteCols;
            if (style.SpriteRows > 0) g.SpriteRows = style.SpriteRows;
            if (style.Scale > 0f) g.Scale = style.Scale;
            if (!string.IsNullOrEmpty(style.VisualId)) g.VisualId = style.VisualId;
            return g;
        }
    }
}
