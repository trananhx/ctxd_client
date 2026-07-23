// CTXD battle simulation — pure C# (no UnityEngine): deterministic, server-portable, offline-testable.
namespace Ctxd.Battle.Sim
{
    public enum Faction { Offense, Defense }                 // 攻击方 / 防御方

    public enum Stance { DotKich, TanCong, PhongThu }        // 突击 / 攻击 / 防守 (rock-paper-scissors)

    public enum Terrain { Plain, Mountain, Forest, Water }   // 平原/山/林/水

    public enum TroopType { KyBinh, ThuongBinh, CungBinh, ChienXa, MuuSi } // 骑/枪/弓/战车/谋士

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
    }

    public enum BattleOutcome { Ongoing, OffenseWins, DefenseWins, Draw }
}
