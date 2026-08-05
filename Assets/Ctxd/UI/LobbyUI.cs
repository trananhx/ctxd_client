using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Luzart;

namespace Ctxd.UI
{
    /// <summary>Sảnh chính payload: thông tin Chủ Công + callback vào các luồng con.</summary>
    public sealed class LobbyData
    {
        public string PlayerName = "Chủ Công";
        public int Level = 1;
        public string Resources;                 // dòng tài nguyên (银/木/粮/镔铁) — hiển thị, có thể stub
        public System.Action OnCampaign;         // "XUẤT CHINH" → chọn tướng → chọn màn → đánh
        public System.Action OnFormation;        // "ĐỘI HÌNH" → mở màn chọn tướng
    }

    /// <summary>
    /// Sảnh chính (Chủ thành) — điểm vào của game. Header hiển thị tên + cấp Chủ Công + tài nguyên;
    /// hai nút chính XUẤT CHINH / ĐỘI HÌNH, cùng các nút stub (Trang bị / Bản đồ / Cửa hàng) tạm khoá.
    /// Mọi tham chiếu con được Forge wire (không Find/GetComponent runtime).
    /// </summary>
    public sealed class LobbyUI : UIBase<LobbyData>
    {
        [SerializeField] private TMP_Text _playerName;
        [SerializeField] private TMP_Text _level;
        [SerializeField] private TMP_Text _resources;
        [SerializeField] private Button _btnCampaign;
        [SerializeField] private Button _btnFormation;
        [SerializeField] private Button[] _stubButtons;   // tạm khoá (Trang bị / Bản đồ / Cửa hàng…)
        [SerializeField] private CanvasGroup _screenGroup;   // [Reskin] fade-in vào màn

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            if (_btnCampaign != null) _btnCampaign.onClick.AddListener(() => Data?.OnCampaign?.Invoke());
            if (_btnFormation != null) _btnFormation.onClick.AddListener(() => Data?.OnFormation?.Invoke());
            if (_stubButtons != null)
                foreach (var b in _stubButtons)
                    if (b != null) b.interactable = false;   // "sắp ra mắt"
            return UniTask.CompletedTask;
        }

        protected override UniTask OnBeforeShowAsync(LobbyData data, CancellationToken ct)
        {
            if (data == null) return UniTask.CompletedTask;
            if (_playerName != null) _playerName.text = data.PlayerName;
            if (_level != null) _level.text = $"Chủ Công  Lv.{data.Level}";
            if (_resources != null) _resources.text = data.Resources ?? "";
            CtxdUiFx.Enter(_screenGroup);
            return UniTask.CompletedTask;
        }
    }
}
