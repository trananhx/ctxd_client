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
    /// <summary>"Chọn tướng" payload: danh sách tướng khả dụng (server-owned) + callback xác nhận đội hình.</summary>
    public sealed class SelectGeneralData
    {
        public List<GeneralSummary> Roster;
        public System.Action<List<string>> OnConfirm;   // trả về id các tướng đã chọn theo thứ tự vị trí
        public System.Action OnBack;
    }

    /// <summary>
    /// Màn "Chọn tướng / Đội hình": lưới thẻ tướng bên trái (avatar-color + tên + binh chủng + Lực chiến + cấp),
    /// 5 vị trí xuất chiến 1–5 bên phải. Bấm thẻ để thêm/bỏ vào đội hình (tối đa 5). Xác nhận → gửi id theo thứ tự.
    /// Slot cố định do Forge dựng + wire (không Find/GetComponent runtime).
    /// </summary>
    public sealed class SelectGeneralUI : UIBase<SelectGeneralData>
    {
        [System.Serializable]
        public struct Card
        {
            public GameObject root;
            public Button button;
            public Image portrait;      // [Reskin] chân dung rip theo GeneralSummary.Id (ẩn nếu không có art)
            public TMP_Text name;
            public TMP_Text troop;
            public TMP_Text power;
            public TMP_Text level;
            public GameObject selectedMark;
        }

        [System.Serializable]
        public struct Slot
        {
            public GameObject root;
            public TMP_Text label;
            public Button remove;
        }

        [SerializeField] private Card[] _cards;
        [SerializeField] private Slot[] _slots;   // 5 vị trí
        [SerializeField] private Button _confirm;
        [SerializeField] private Button _back;
        [SerializeField] private TMP_Text _hint;

        private readonly List<string> _rosterIds = new List<string>();
        private readonly List<string> _selected = new List<string>();
        private int MaxSlots => _slots != null ? _slots.Length : 5;

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            if (_cards != null)
                for (int i = 0; i < _cards.Length; i++)
                {
                    int idx = i;
                    if (_cards[i].button != null) _cards[i].button.onClick.AddListener(() => ToggleCard(idx));
                }
            if (_slots != null)
                for (int i = 0; i < _slots.Length; i++)
                {
                    int idx = i;
                    if (_slots[i].remove != null) _slots[i].remove.onClick.AddListener(() => RemoveSlot(idx));
                }
            if (_confirm != null) _confirm.onClick.AddListener(Confirm);
            if (_back != null) _back.onClick.AddListener(() => Data?.OnBack?.Invoke());
            return UniTask.CompletedTask;
        }

        protected override UniTask OnBeforeShowAsync(SelectGeneralData data, CancellationToken ct)
        {
            _rosterIds.Clear();
            _selected.Clear();
            var roster = data?.Roster;
            if (_cards != null)
                for (int i = 0; i < _cards.Length; i++)
                {
                    bool has = roster != null && i < roster.Count;
                    if (_cards[i].root != null) _cards[i].root.SetActive(has);
                    if (!has) continue;
                    var g = roster[i];
                    _rosterIds.Add(g.Id);
                    if (_cards[i].portrait != null)
                    {
                        var sp = CtxdArt.Portrait(g.Id);
                        _cards[i].portrait.sprite = sp;
                        _cards[i].portrait.enabled = sp != null;
                    }
                    if (_cards[i].name != null) _cards[i].name.text = g.DisplayName;
                    if (_cards[i].troop != null)
                    {
                        _cards[i].troop.text = TroopVisual.Label(g.Troop);
                        _cards[i].troop.color = TroopVisual.Color(g.Troop);
                    }
                    if (_cards[i].power != null) _cards[i].power.text = $"Lực chiến {g.Power:n0}";
                    if (_cards[i].level != null) _cards[i].level.text = $"Lv.{g.Level}";
                }
            Refresh();
            return UniTask.CompletedTask;
        }

        private void ToggleCard(int cardIndex)
        {
            if (cardIndex < 0 || cardIndex >= _rosterIds.Count) return;
            string id = _rosterIds[cardIndex];
            if (_selected.Contains(id)) _selected.Remove(id);
            else if (_selected.Count < MaxSlots) _selected.Add(id);
            Refresh();
        }

        private void RemoveSlot(int slotIndex)
        {
            if (slotIndex >= 0 && slotIndex < _selected.Count) _selected.RemoveAt(slotIndex);
            Refresh();
        }

        private void Confirm()
        {
            if (_selected.Count == 0) return;
            Data?.OnConfirm?.Invoke(new List<string>(_selected));
        }

        private void Refresh()
        {
            // Thẻ: đánh dấu đã chọn.
            if (_cards != null)
                for (int i = 0; i < _cards.Length; i++)
                {
                    if (_cards[i].selectedMark == null) continue;
                    bool sel = i < _rosterIds.Count && _selected.Contains(_rosterIds[i]);
                    _cards[i].selectedMark.SetActive(sel);
                }
            // Vị trí 1–5: điền tên theo thứ tự đã chọn.
            if (_slots != null)
                for (int i = 0; i < _slots.Length; i++)
                {
                    bool filled = i < _selected.Count;
                    if (_slots[i].label != null)
                        _slots[i].label.text = filled ? $"{i + 1}.  {NameOf(_selected[i])}" : $"{i + 1}.  (trống)";
                    if (_slots[i].remove != null) _slots[i].remove.gameObject.SetActive(filled);
                }
            if (_hint != null) _hint.text = $"Đã chọn {_selected.Count}/{MaxSlots} tướng — bấm thẻ để thêm/bỏ";
            if (_confirm != null) _confirm.interactable = _selected.Count > 0;
        }

        private string NameOf(string id)
        {
            int i = _rosterIds.IndexOf(id);
            if (i >= 0 && _cards != null && i < _cards.Length && _cards[i].name != null) return _cards[i].name.text;
            return id;
        }
    }
}
