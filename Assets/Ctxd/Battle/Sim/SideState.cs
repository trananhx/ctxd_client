using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>One faction's ordered general queue (max 5, expandable for 借兵 / Đào Viên).</summary>
    public sealed class SideState
    {
        public Faction Faction;
        public string Nation;
        public readonly List<Combatant> Queue = new List<Combatant>();
        public int ActiveIndex;
        // [2D] trạng thái bao vây (包围)
        public bool Surrounded;
        public int SurroundSince = -1, SlamCd;
        public Tower Tower;   // [2E] trụ tên phòng thủ (chỉ phe Thủ ở trận City); null = không có.
        public readonly List<ActiveEffect> Effects = new List<ActiveEffect>();   // [FX] FX bền (buff/lửa), server-owned; giảm theo hiệp.

        public Combatant Active => (ActiveIndex >= 0 && ActiveIndex < Queue.Count) ? Queue[ActiveIndex] : null;

        /// <summary>Thêm/làm mới FX bền: trùng (FxId,RowIndex) thì bump lại hiệp (không nhân đôi); khác thì thêm mới.</summary>
        public void AddOrRefreshEffect(string fxId, int rounds, FxAnchorKind anchor = FxAnchorKind.UnderFoot, int rowIndex = -1, int sorting = 100)
        {
            foreach (var e in Effects)
                if (e.FxId == fxId && e.RowIndex == rowIndex) { e.RemainingRounds = rounds; e.Anchor = anchor; e.SortingOrder = sorting; return; }
            Effects.Add(new ActiveEffect { FxId = fxId, RemainingRounds = rounds, Anchor = anchor, RowIndex = rowIndex, SortingOrder = sorting });
        }

        /// <summary>[FX] FX bền ĐỘC QUYỀN theo nhóm tiền tố (vd "stance_"): gỡ mọi FX cùng tiền tố khác id rồi
        /// thêm/refresh id mới. rounds mặc định -1 = UntilRemoved — sống tới khi server thay/gỡ (KHÔNG tự tắt theo hiệp).</summary>
        public void SetExclusiveEffect(string prefix, string fxId, int rounds = -1, FxAnchorKind anchor = FxAnchorKind.UnderFoot, int sorting = 100)
        {
            for (int i = Effects.Count - 1; i >= 0; i--)
                if (Effects[i].FxId != null && Effects[i].FxId.StartsWith(prefix) && Effects[i].FxId != fxId)
                    Effects.RemoveAt(i);
            if (!string.IsNullOrEmpty(fxId)) AddOrRefreshEffect(fxId, rounds, anchor, rowIndex: -1, sorting: sorting);
        }

        public bool HasLiving
        {
            get { for (int i = ActiveIndex; i < Queue.Count; i++) if (Queue[i].Alive) return true; return false; }
        }

        public int TotalTroops { get { int t = 0; foreach (var c in Queue) t += c.Troops; return t; } }

        public void AdvanceToNextLiving() { while (ActiveIndex < Queue.Count && !Queue[ActiveIndex].Alive) ActiveIndex++; }
    }
}
