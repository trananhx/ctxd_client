using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Luzart;

namespace Ctxd.UI
{
    /// <summary>Kết quả trận payload: thắng/thua + phần thưởng + callback về sảnh.</summary>
    public sealed class ResultData
    {
        public bool Win;
        public string OutcomeText;   // "Phe Công chiến thắng!" …
        public string RewardText;    // dòng phần thưởng (EXP/Lương/mảnh tướng)
        public System.Action OnContinue;
    }

    /// <summary>Màn kết quả sau trận: banner CHIẾN THẮNG/THẤT BẠI + phần thưởng + nút VỀ SẢNH.</summary>
    public sealed class ResultUI : UIBase<ResultData>
    {
        [SerializeField] private TMP_Text _title;
        [SerializeField] private TMP_Text _outcome;
        [SerializeField] private TMP_Text _reward;
        [SerializeField] private Button _continue;

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            if (_continue != null) _continue.onClick.AddListener(() => Data?.OnContinue?.Invoke());
            return UniTask.CompletedTask;
        }

        protected override UniTask OnBeforeShowAsync(ResultData data, CancellationToken ct)
        {
            if (data == null) return UniTask.CompletedTask;
            if (_title != null)
            {
                _title.text = data.Win ? "CHIẾN THẮNG" : "THẤT BẠI";
                _title.color = data.Win ? new Color(1f, 0.85f, 0.35f) : new Color(0.9f, 0.4f, 0.35f);
            }
            if (_outcome != null) _outcome.text = data.OutcomeText ?? "";
            if (_reward != null) _reward.text = data.RewardText ?? "";
            return UniTask.CompletedTask;
        }
    }
}
