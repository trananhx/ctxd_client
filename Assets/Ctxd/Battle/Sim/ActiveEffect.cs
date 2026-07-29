namespace Ctxd.Battle.Sim
{
    /// <summary>Neo một FX bền trên sân — dùng chung "ngữ pháp vị trí" với BattleSideField (dưới chân / tâm hàng / tâm phe).</summary>
    public enum FxAnchorKind { SideCenter, RowCenter, UnderFoot }

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
        public bool UntilRemoved => RemainingRounds < 0;
    }
}
