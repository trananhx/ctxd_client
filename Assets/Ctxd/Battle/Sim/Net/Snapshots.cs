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
        // APPEND-ONLY (see Protocol): how the group is drawn. Defaults keep every existing scenario identical.
        public float Scale = 1f;   // multiplies the field-wide unit scale
        public string VisualId;    // null = art by troop type
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
        public int MoraleFull;                    // ngưỡng nộ đầy (tunable) → HUD vẽ thanh nộ đúng tỉ lệ
        public bool Awakened, FiveStar, Alive;
        public bool CanCast;                      // RE: đủ nộ + có skill2 + không hỗn loạn + không bị vây → bật nút thả 战法
        public bool IsPhantom;                    // [2D] đơn vị ảo ảnh
        public PhantomKind Phantom;               // [2D] loại giao chiến/ảo ảnh
        public int XianzhengStars;                // [2D] số sao Hãm Trận
        public int Rows;                          // configured row count
        public int EngageRows;                    // [G1] số hàng trước diễn animation đánh (0 = 1)
        public string FormationId;
        public string Skill1Id, Skill1Name, Skill2Id, Skill2Name;
        public List<RowSnapshot> Formation;       // server-authoritative rows of groups (client renders these)
    }

    public sealed class SideSnapshot
    {
        public Faction Faction;
        public string Nation;
        public int ActiveIndex;
        public bool Surrounded;                   // [2D] phe đang bị bao vây
        public int SlamCd;                        // [2D] đếm ngược tới đòn phong toả kế
        public TowerSnapshot Tower;               // [2E] trụ tên phe Thủ (null = không có)
        public List<ActiveEffectSnapshot> Effects; // [FX] FX bền (buff/lửa); null khi rỗng → wire byte-identical
        public List<CombatantSnapshot> Queue = new List<CombatantSnapshot>();
    }

    /// <summary>[2E] Trụ tên phòng thủ (client HUD).</summary>
    public sealed class TowerSnapshot
    {
        public int Blood, MaxBlood, NextAttackRound;
    }

    /// <summary>[FX] Một FX BỀN chiếu xuống client (buff/lửa). Client diff theo (FxId, RowIndex): spawn/keep/destroy.</summary>
    public sealed class ActiveEffectSnapshot
    {
        public string FxId;
        public FxAnchorKind Anchor;
        public int RowIndex = -1;
        public int SortingOrder;
        public int RemainingRounds = -1;
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
            Offense = SideFrom(s.Offense, s.MoraleFull),
            Defense = SideFrom(s.Defense, s.MoraleFull),
        };

        private static SideSnapshot SideFrom(SideState side, int moraleFull)
        {
            var snap = new SideSnapshot { Faction = side.Faction, Nation = side.Nation, ActiveIndex = side.ActiveIndex,
                Surrounded = side.Surrounded, SlamCd = side.SlamCd,
                Tower = side.Tower == null ? null : new TowerSnapshot { Blood = side.Tower.Blood, MaxBlood = side.Tower.MaxBlood, NextAttackRound = side.Tower.NextAttackRound },
                Effects = EffectsFrom(side.Effects) };
            foreach (var c in side.Queue) snap.Queue.Add(From(c, moraleFull, side.Surrounded));
            return snap;
        }

        /// <summary>[FX] Chiếu danh sách FX bền; rỗng → null để wire bỏ qua (0-drift với scenario không có FX).</summary>
        private static List<ActiveEffectSnapshot> EffectsFrom(List<ActiveEffect> src)
        {
            if (src == null || src.Count == 0) return null;
            var l = new List<ActiveEffectSnapshot>(src.Count);
            foreach (var e in src)
                l.Add(new ActiveEffectSnapshot { FxId = e.FxId, Anchor = e.Anchor, RowIndex = e.RowIndex, SortingOrder = e.SortingOrder, RemainingRounds = e.RemainingRounds });
            return l;
        }

        public static CombatantSnapshot From(Combatant c, int moraleFull = 100, bool surrounded = false) => new CombatantSnapshot
        {
            Id = c.Id, DefId = c.DefId, DisplayName = c.DisplayName,
            Faction = c.Faction, Troop = c.Troop,
            MaxTroops = c.MaxTroops, Troops = c.Troops, Morale = c.Morale, MoraleFull = moraleFull,
            Awakened = c.Awakened, FiveStar = c.FiveStar, Alive = c.Alive, Rows = c.Rows, EngageRows = c.EngageRows,
            CanCast = c.UseAble(moraleFull) && !surrounded,
            IsPhantom = c.IsPhantom, Phantom = c.Phantom, XianzhengStars = c.XianzhengStars,
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
                        Scale = g.Scale, VisualId = g.VisualId,
                    });
                list.Add(rs);
            }
            return list;
        }
    }
}
