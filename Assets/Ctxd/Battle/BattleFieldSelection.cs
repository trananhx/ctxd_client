using UnityEngine;
using Ctxd.Visual;

namespace Ctxd.Battle
{
    /// <summary>
    /// Click a troop group to toggle an on-demand HP bar. Repeated clicks on the SAME group cycle
    /// group HP → row HP → off. Clicking another group selects it (group scope); clicking empty space hides.
    /// One bar at a time; each frame it follows the selected group/row's live HP + world position.
    /// </summary>
    public sealed class BattleFieldSelection : MonoBehaviour
    {
        public Camera cam;

        private enum Scope { None, Group, Row }
        private BattleSideField _field;
        private int _row = -1, _grp = -1;
        private Scope _scope = Scope.None;
        private RowHealthBar _bar;
        private float _barWidth = -1f;

        private Camera Cam()
        {
            if (cam != null) return cam;
            cam = Camera.main != null ? Camera.main : FindAnyObjectByType<Camera>();
            return cam;
        }

        private void Update()
        {
            if (!Input.GetMouseButtonDown(0)) return;
            var c = Cam();
            if (c == null) return;
            Vector3 wp = c.ScreenToWorldPoint(Input.mousePosition); wp.z = 0f;
            var hit = Physics2D.OverlapPoint(wp);
            var target = hit != null ? hit.GetComponent<GroupClickTarget>() : null;
            if (target == null || target.field == null) { Hide(); return; }

            if (target.field == _field && target.rowIndex == _row && target.groupIndex == _grp)
                _scope = _scope == Scope.Group ? Scope.Row : Scope.None;   // same group → group → row → off
            else { _field = target.field; _row = target.rowIndex; _grp = target.groupIndex; _scope = Scope.Group; }

            if (_scope == Scope.None) Hide();
        }

        private void LateUpdate()
        {
            if (_scope == Scope.None || _field == null) return;
            HpTarget t;
            bool ok = _scope == Scope.Group ? _field.TryGetGroup(_row, _grp, out t) : _field.TryGetRow(_row, out t);
            if (!ok) { Hide(); return; }
            EnsureBar(t.width);
            _bar.transform.position = t.top;
            _bar.SetRatio(t.max > 0 ? (float)t.soldiers / t.max : 0f);
        }

        private void EnsureBar(float width)
        {
            if (_bar != null && Mathf.Approximately(_barWidth, width)) return;
            if (_bar != null) Destroy(_bar.gameObject);
            _bar = RowHealthBar.Create(transform, Vector3.zero, width);
            _bar.SetSortingOrder(900);
            _barWidth = width;
        }

        private void Hide()
        {
            _scope = Scope.None; _field = null; _row = _grp = -1;
            if (_bar != null) { Destroy(_bar.gameObject); _bar = null; _barWidth = -1f; }
        }
    }
}
