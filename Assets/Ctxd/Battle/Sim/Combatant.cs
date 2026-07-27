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
        // Thiên phú % Lực chiến (战力) theo địa hình (RE): key = (int)Terrain, value = % (0.25 = +25%).
        // City (Thành trì) chỉ áp phe Công (城池战力仅攻方) — xem CombatOps.TerrainMult. null → không thiên phú.
        public System.Collections.Generic.Dictionary<int, double> TerrainBonus = null;
        // [2B] Khắc chế binh chủng PER-TƯỚNG (Thức tỉnh/tech "Khắc chế lv%"): key = (int)TroopType địch, value = bonus%.
        // Cộng CHỒNG lên vòng ring universal (BattleConfig.TroopCounterRing). null → chỉ dùng ring.
        public System.Collections.Generic.Dictionary<int, double> CounterVsTroop = null;
        public int MaxTroops, Troops, Morale;
        public bool Awakened, FiveStar;
        public TacticSpec Skill1, Skill2;
        public System.Collections.Generic.List<TacticSpec> Skill2Variants = null;   // [2C] biến thể chiến pháp theo địa hình
        public int ConfusedTurns;
        public int LuanwuTurns;   // [2A] Loạn Vũ: >0 → sát thương chiến pháp ×LuanwuMult; giảm mỗi hiệp.
        public bool IsPhantom;        // [2D] đơn vị ảo ảnh (quân sao chép)
        public PhantomKind Phantom;   // [2D] loại giao chiến/ảo ảnh
        public int XianzhengStars;    // [2D] số sao Hãm Trận (khi Phantom==Xianzheng)
        public string FormationId;
        public int Rows = 4;
        public Stance LastStance;
        public bool HasLastStance;

        /// <summary>Rows of troop-groups (server-authoritative geometry). Combat depletes the FRONT living row first.</summary>
        public readonly List<Row> Formation = new List<Row>();
        public bool HasFormation => Formation.Count > 0;

        public bool Alive => Troops > 0;
        public bool Confused => ConfusedTurns > 0;

        /// <summary>Đủ điều kiện thả 战法 (useAble): đầy nộ + có skill2 + không hỗn loạn.
        /// NGUỒN-SỰ-THẬT-DUY-NHẤT cho cast-gate (sim, AI, snapshot đều dùng) — tránh hardcode ngưỡng nộ.</summary>
        public bool UseAble(int moraleFull) => Morale >= moraleFull && Skill2 != null && !Confused;

        /// <summary>[2C] Chọn biến thể chiến pháp khớp địa hình; không có → bản gốc Skill2.</summary>
        public TacticSpec Skill2ForTerrain(Terrain terrain)
        {
            if (Skill2Variants != null)
                foreach (var v in Skill2Variants)
                    if (v != null && v.TerrainTag.HasValue && v.TerrainTag.Value == terrain) return v;
            return Skill2;
        }

        /// <summary>First row that still has living soldiers, or null.</summary>
        public Row FrontRow { get { foreach (var r in Formation) if (r.Alive) return r; return null; } }
        public int LivingRows { get { int n = 0; foreach (var r in Formation) if (r.Alive) n++; return n; } }

        /// <summary>Recompute the cached <see cref="Troops"/> total from the formation (call after mutating groups).</summary>
        public void SyncTroops() { if (!HasFormation) return; int s = 0; foreach (var r in Formation) s += r.Soldiers; Troops = s; }
    }
}
