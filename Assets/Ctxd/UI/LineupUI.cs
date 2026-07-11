using System.Collections.Generic;
using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Luzart;

namespace Ctxd.UI
{
    /// <summary>Pre-battle lobby payload: the generals to arrange + the confirm callback (sends the order to the server).</summary>
    public sealed class LineupData
    {
        public List<string> Names;
        public System.Action<List<int>> OnConfirm;
    }

    /// <summary>
    /// "Bày binh bố trận" — pre-battle lineup. Fixed slots (built + wired by the forge); shows the offense generals,
    /// reorders them with ▲▼, and confirms the order. No runtime Find/GetComponent.
    /// </summary>
    public sealed class LineupUI : UIBase<LineupData>
    {
        [System.Serializable]
        public struct Slot
        {
            public GameObject root;
            public TMP_Text label;
            public Button up;
            public Button down;
        }

        [SerializeField] private Slot[] _slots;
        [SerializeField] private Button _confirm;

        private readonly List<int> _order = new List<int>();

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            if (_slots != null)
                for (int i = 0; i < _slots.Length; i++)
                {
                    int slot = i;
                    if (_slots[i].up != null) _slots[i].up.onClick.AddListener(() => Move(slot, -1));
                    if (_slots[i].down != null) _slots[i].down.onClick.AddListener(() => Move(slot, +1));
                }
            if (_confirm != null) _confirm.onClick.AddListener(() => Data?.OnConfirm?.Invoke(new List<int>(_order)));
            return UniTask.CompletedTask;
        }

        protected override UniTask OnBeforeShowAsync(LineupData data, CancellationToken ct)
        {
            _order.Clear();
            int n = data?.Names != null ? data.Names.Count : 0;
            int max = _slots != null ? _slots.Length : 0;
            for (int i = 0; i < n && i < max; i++) _order.Add(i);
            Refresh();
            return UniTask.CompletedTask;
        }

        private void Move(int slot, int dir)
        {
            int j = slot + dir;
            if (slot < 0 || slot >= _order.Count || j < 0 || j >= _order.Count) return;
            (_order[slot], _order[j]) = (_order[j], _order[slot]);
            Refresh();
        }

        private void Refresh()
        {
            var names = Data?.Names;
            if (_slots == null) return;
            for (int i = 0; i < _slots.Length; i++)
            {
                bool active = names != null && i < _order.Count;
                if (_slots[i].root != null) _slots[i].root.SetActive(active);
                if (active && _slots[i].label != null) _slots[i].label.text = $"{i + 1}.  {names[_order[i]]}";
            }
        }
    }
}
