// CTXD battle simulation — pure C# (no UnityEngine): deterministic, server-portable, offline-testable.
namespace Ctxd.Battle.Sim
{
    public enum Faction { Offense, Defense }                 // 攻击方 / 防御方

    public enum Stance { DotKich, TanCong, PhongThu }        // 突击 / 攻击 / 防守 (rock-paper-scissors)

    // ⚠️ int nội bộ (Mountain=1, Forest=2) KHÁC terrainType RE (2 Đất rừng/Forest, 3 Vùng núi/Mountain) — map THEO TÊN, đừng cast số RE thẳng.
    public enum Terrain { Plain, Mountain, Forest, Water, City, Pass }   // 平原/山/林/水/城池/关卡 (append cuối — giữ int 0-3 cũ)

    // Client RE (c-20260724-10): 4 hệ khắc chế = 骑/步/弓/器械; MuuSi谋士 NGOÀI vòng khắc chế (chỉ biến thể hiển thị).
    public enum TroopType { KyBinh, ThuongBinh, CungBinh, ChienXa, MuuSi } // 骑/步/弓/器械/谋士

    /// <summary>Effect family of a tactic (战法). Maps to an <see cref="ITacticEffect"/> Strategy via the registry.</summary>
    public enum TacticEffectKind
    {
        Damage, AoeDamage, Confusion, InstantTo1Hp, Pushback, Buff, Heal, Rule,
    }

    // ── Rule-engine enums (data-driven skill targeting) ──────────────────────
    public enum TargetScope { EnemyActive, EnemyAll, AllySelf, AllyActive, AllyAll }
    public enum RowMode { FrontRow, FrontNRows, AllRows, RowIndex }
    public enum Distribution { EvenByHp, FocusFrontFirst }
    public enum ConditionKind { Always, TargetHpBelowPct, TargetHpAbovePct, ActorMoraleFull, TerrainIs, TargetTroopPresent, Chance }
    public enum ActionKind { Damage, InstantKill, SetToHpPct, Confuse, Pushback, Heal, Buff }

    public enum BattleEventType
    {
        BattleStart, RoundBegin, StanceChosen, StanceClash, GeneralEngage,
        Attack, TacticCast, Damage, Morale, Confusion, Pushback,
        GeneralDefeated, Banner, BattleEnd,
        // TEST-API + screenshot-driven events (server-authored, client renders).
        UnitKilled, UnitAdded, SkillCast, ExpPopup,
        // Row-by-row geometry events: a group wiped / the front row cleared and the next advances.
        GroupKilled, RowAdvanced,
        // RE report vocabulary (mobile 攻城掠地 reportHandler map). Server-authored metadata / stub render.
        // TacticHeld/TacticChain = enum-stub cho beHold (phản/giữ) + nextTacticId (chuỗi) — logic ở Stage 2.
        ArmyLoaded, GeneralRosterUpdate, StatsUpdate, ArmyTacticsTable,
        LossSummary, DeterUpdate, TacticHeld, TacticChain,
        // [Stage 2C] report27 — bảng chọn biến thể chiến pháp theo địa hình.
        TacticVariantOffer,
        // [Stage 2D] phantom (幻影) + surround (包围)
        PhantomSpawned, SurroundBegin, SurroundSlam, SurroundEnd,
        // [Stage 2E] công thành / trụ tên / hoả
        TowerShoot, TowerBreak, TowerCountdown, Fire, CityAssaultTactic,
    }

    // [Stage 2D] Loại ảo ảnh/giao chiến (khớp battleConstants lua; giá trị THƯA — KHÔNG dùng làm index mảng).
    public enum PhantomKind { Normal = 0, Tuji = 1, Dantiao = 2, Juli = 4, Xianzheng = 5, Hubaoqi = 20 }

    public enum BattleOutcome { Ongoing, OffenseWins, DefenseWins, Draw }
}
