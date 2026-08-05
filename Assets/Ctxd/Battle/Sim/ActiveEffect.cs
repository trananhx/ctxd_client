using Newtonsoft.Json;

namespace Ctxd.Battle.Sim
{
    /// <summary>Neo một FX bền trên sân — dùng chung "ngữ pháp vị trí" với BattleSideField (dưới chân / tâm hàng / tâm phe).
    /// APPEND-ONLY (wire theo số): UnderFootAllRows = vầng trải MỖI hàng sống (grammar thế trận row-wide).</summary>
    public enum FxAnchorKind { SideCenter, RowCenter, UnderFoot, UnderFootAllRows }

    /// <summary>
    /// [Pool FX theo PHA] Server khai báo FX thuộc pha nào của LƯỢT — client render đúng thời điểm, data-driven:
    /// PostTurn (0, mặc định = hành vi cũ) áp khi snapshot cuối lượt; PreTurn hiện NGAY đầu lượt (trước animation
    /// đánh — server phát kèm event <see cref="BattleEventType.PreTurnFx"/>); PostAttack dành cho FX sau đòn đánh
    /// (đã có wire, client sẽ tiêu thụ khi có FX đầu tiên dùng pha này).
    /// </summary>
    public enum FxPhase { PostTurn = 0, PreTurn = 1, PostAttack = 2 }

    /// <summary>
    /// Một FX BỀN (buff giữ liên tục / lửa cháy qua vài hiệp) do SERVER sở hữu. Client diff danh sách này mỗi
    /// snapshot: mục mới → spawn FX lặp; còn → giữ; mất → huỷ. Khác FX MỘT-PHÁT (đòn skill) đi qua event log.
    /// <para>Vòng đời đo bằng HIỆP (<see cref="RemainingRounds"/>); &lt;0 = sống tới khi server tự gỡ.</para>
    /// </summary>
    public sealed class ActiveEffect
    {
        public string FxId;                       // khoá client tra EffectVisualDefinition ({f} → att/def)
        public FxAnchorKind Anchor = FxAnchorKind.UnderFoot;
        public int RowIndex = -1;                 // -1 = cả phe / hàng trước
        public int SortingOrder = 100;            // buff dưới lính (100) mặc định
        public int RemainingRounds = -1;          // <0 = UntilRemoved (server tự gỡ)
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.Ignore)]
        public FxPhase Phase = FxPhase.PostTurn;  // pha render trong lượt (0 → wire omit, 0-drift)
        public bool UntilRemoved => RemainingRounds < 0;
    }
}
