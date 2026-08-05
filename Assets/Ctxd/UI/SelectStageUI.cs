using System.Collections.Generic;
using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Luzart;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.UI
{
    /// <summary>"Chọn màn" payload: danh mục phó bản (server-owned) + callback vào trận (stageId, độ khó 1–5).</summary>
    public sealed class SelectStageData
    {
        public List<StageInfo> Stages;
        public System.Action<string, int> OnConfirm;   // (stageId, difficulty 1..5)
        public System.Action OnBack;
    }

    /// <summary>
    /// Màn "Chọn màn / Phó bản": danh sách kịch bản (Trấn Áp Khăn Vàng / Quan Độ / Xích Bích…) + 5 độ khó
    /// (Dễ/Thường/Khó/Địa Ngục/Chiến Thần). Chọn màn + độ khó → Vào trận. Slot cố định do Forge dựng + wire.
    /// </summary>
    public sealed class SelectStageUI : UIBase<SelectStageData>
    {
        [System.Serializable]
        public struct StageCard
        {
            public GameObject root;
            public Button button;
            public Image thumb;         // [Reskin] thumbnail phong cảnh warBG theo stageId/terrain
            public TMP_Text name;
            public TMP_Text terrain;
            public TMP_Text desc;
            public GameObject selectedMark;
        }

        [System.Serializable]
        public struct TierButton
        {
            public Button button;
            public GameObject selectedMark;
        }

        public static readonly string[] TierNames = { "Dễ", "Thường", "Khó", "Địa Ngục", "Chiến Thần" };

        [SerializeField] private StageCard[] _cards;
        [SerializeField] private TierButton[] _tiers;   // 5 độ khó
        [SerializeField] private Button _confirm;
        [SerializeField] private Button _back;
        [SerializeField] private TMP_Text _info;
        [SerializeField] private CanvasGroup _screenGroup;   // [Reskin] fade-in vào màn

        private readonly List<string> _stageIds = new List<string>();
        private int _selStage = -1;
        private int _selTier = 1;   // mặc định Thường (index 1)

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            if (_cards != null)
                for (int i = 0; i < _cards.Length; i++)
                {
                    int idx = i;
                    if (_cards[i].button != null) _cards[i].button.onClick.AddListener(() => SelectStage(idx));
                }
            if (_tiers != null)
                for (int i = 0; i < _tiers.Length; i++)
                {
                    int idx = i;
                    if (_tiers[i].button != null) _tiers[i].button.onClick.AddListener(() => SelectTier(idx));
                }
            if (_confirm != null) _confirm.onClick.AddListener(Confirm);
            if (_back != null) _back.onClick.AddListener(() => Data?.OnBack?.Invoke());
            return UniTask.CompletedTask;
        }

        protected override UniTask OnBeforeShowAsync(SelectStageData data, CancellationToken ct)
        {
            _stageIds.Clear();
            _selStage = -1;
            _selTier = 1;
            var stages = data?.Stages;
            if (_cards != null)
                for (int i = 0; i < _cards.Length; i++)
                {
                    bool has = stages != null && i < stages.Count;
                    if (_cards[i].root != null) _cards[i].root.SetActive(has);
                    if (!has) continue;
                    var s = stages[i];
                    _stageIds.Add(s.Id);
                    if (_cards[i].thumb != null)
                    {
                        var sp = CtxdArt.StageBg(s.Id, s.Terrain);
                        _cards[i].thumb.sprite = sp;
                        _cards[i].thumb.enabled = sp != null;
                    }
                    if (_cards[i].name != null) _cards[i].name.text = s.Name;
                    if (_cards[i].terrain != null) _cards[i].terrain.text = $"Địa hình: {TerrainLabel(s.Terrain)}  •  Địch: {s.DefenseNation} ({s.EnemyCount})";
                    if (_cards[i].desc != null) _cards[i].desc.text = s.Desc;
                }
            if (_stageIds.Count > 0) _selStage = 0;   // chọn sẵn màn đầu
            Refresh();
            CtxdUiFx.Enter(_screenGroup);
            return UniTask.CompletedTask;
        }

        private void SelectStage(int i) { if (i >= 0 && i < _stageIds.Count) { _selStage = i; Refresh(); } }
        private void SelectTier(int i) { if (_tiers != null && i >= 0 && i < _tiers.Length) { _selTier = i; Refresh(); } }

        private void Confirm()
        {
            if (_selStage < 0 || _selStage >= _stageIds.Count) return;
            Data?.OnConfirm?.Invoke(_stageIds[_selStage], _selTier + 1);   // độ khó 1..5
        }

        private void Refresh()
        {
            if (_cards != null)
                for (int i = 0; i < _cards.Length; i++)
                    if (_cards[i].selectedMark != null) _cards[i].selectedMark.SetActive(i == _selStage);
            if (_tiers != null)
                for (int i = 0; i < _tiers.Length; i++)
                    if (_tiers[i].selectedMark != null) _tiers[i].selectedMark.SetActive(i == _selTier);
            if (_info != null)
            {
                string tier = (_selTier >= 0 && _selTier < TierNames.Length) ? TierNames[_selTier] : "?";
                _info.text = _selStage >= 0
                    ? $"Độ khó: {tier}  —  quân địch mạnh hơn ở độ khó cao"
                    : "Chọn một phó bản để xuất chinh";
            }
            if (_confirm != null) _confirm.interactable = _selStage >= 0;
        }

        private static string TerrainLabel(string terrain) => terrain switch
        {
            "Plain" => "Đồng Bằng",
            "Mountain" => "Núi",
            "Forest" => "Rừng",
            "Water" => "Sông Nước",
            "City" => "Thành Trì",
            "Pass" => "Quan Ải",
            _ => terrain,
        };
    }
}
