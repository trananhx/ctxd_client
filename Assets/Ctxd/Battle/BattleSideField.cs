using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Data;
using Ctxd.Visual;

namespace Ctxd.Battle
{

    /// <summary>HP + placement of a clicked row/group, for the on-demand HP bar.</summary>
    public struct HpTarget { public int soldiers, max; public Vector3 top; public float width; }

    /// <summary>Tunable field spacing (from the director's Inspector). Multipliers on the base ISO layout.</summary>
    public struct FieldLayout
    {
        public float rowSpacing;      // ↑ = rows further apart
        public float groupSpacing;    // ↑ = groups within a row further apart
        public float spriteSpacing;   // ↑ = soldiers within a group further apart
        public float unitScale;       // per-sprite scale
        public static FieldLayout Default => new FieldLayout { rowSpacing = 1.5f, groupSpacing = 1.1f, spriteSpacing = 2.0f, unitScale = 0.7f };
    }

    /// <summary>
    /// One active general's army, rendered from a server <see cref="CombatantSnapshot"/> as PERSISTENT groups of
    /// troop-sprites. Instead of destroy+rebuild per snapshot, <see cref="ApplyState"/> DIFFS the new snapshot and
    /// animates transitions: new groups spawn Idle, dead groups play Die then vanish, and groups whose row advanced
    /// tween forward (Move). Each group carries a click collider so the UI can show its HP bar on demand.
    /// </summary>
    public sealed class BattleSideField : MonoBehaviour
    {
        private sealed class Cell
        {
            public int rowIndex, groupIndex;
            public TroopType troop;
            public int soldiers, maxSoldiers, capacity;
            public int cols, srows;
            public Transform anchor;                 // child of field; sprites + collider live here
            public readonly List<UnitVisual> sprites = new List<UnitVisual>();
            public Vector2 slotPos;                  // anchor target/current local position
            public int rowSlot;                      // render slot among LIVING rows (0 = front, engages)
            public bool dying;
            public Coroutine moveCo;
        }

        private readonly Dictionary<(int row, int grp), Cell> _cells = new Dictionary<(int, int), Cell>();
        private CtxdGameDatabase _db;
        private Faction _faction;
        private CombatantSnapshot _snap;

        // layout axes (isometric), set in ConfigureLayout
        private Vector2 _rowAxis, _groupAxis, _spriteCol, _spriteRow;
        private float _unitScale;
        private Vector3 _lungeDir;
        private FieldLayout _layout = FieldLayout.Default;
        private Coroutine _lunge, _idleCo;

        private const float DieDuration = 0.4f;
        private const float MoveDuration = 0.3f;

        public Vector3 Center => transform.position + Vector3.up * 0.7f;
        public string CombatantId => _snap != null ? _snap.Id : null;

        // ── build / update ─────────────────────────────────────────────────────────
        public void Build(CombatantSnapshot snap, Faction faction, CtxdGameDatabase db, FieldLayout layout)
        {
            _db = db; _faction = faction; _layout = layout;
            ConfigureLayout(faction);
            ApplyStateInternal(snap, initial: true);
        }

        /// <summary>Diff the new snapshot against live groups and animate the deltas (same active general).</summary>
        public void ApplyState(CombatantSnapshot snap) => ApplyStateInternal(snap, initial: false);

        private void ConfigureLayout(Faction faction)
        {
            bool offense = faction == Faction.Offense;
            // Hướng ISO cơ sở; khoảng cách hàng/nhóm NHÂN theo config (Inspector) để tách cho đỡ dính.
            Vector2 rowDir   = offense ? new Vector2(-0.62f, -0.34f) : new Vector2(0.62f, 0.34f);
            Vector2 groupDir = new Vector2(0.80f, -0.40f);
            float rs = _layout.rowSpacing   > 0f ? _layout.rowSpacing   : 1f;
            float gs = _layout.groupSpacing > 0f ? _layout.groupSpacing : 1f;
            _rowAxis   = rowDir * rs;              // giãn cách HÀNG (chỗ đang bị đè lên nhau)
            _groupAxis = groupDir * gs;           // giãn cách NHÓM trong một hàng
            float ss = _layout.spriteSpacing > 0f ? _layout.spriteSpacing : 1f;
            _spriteCol = new Vector2(0.16f, -0.08f) * ss;   // giãn cách lính theo CỘT trong nhóm
            _spriteRow = rowDir * 0.16f * ss;               // giãn cách lính theo CHIỀU SÂU trong nhóm
            _unitScale = _layout.unitScale > 0f ? _layout.unitScale : 0.7f;
            _lungeDir  = offense ? new Vector3(0.5f, 0.28f, 0f) : new Vector3(-0.5f, -0.28f, 0f);
        }

        private void ApplyStateInternal(CombatantSnapshot snap, bool initial)
        {
            _snap = snap;
            if (snap?.Formation == null) return;

            // render slot for each LIVING row (formation order) → living rows behind a cleared row advance forward.
            var rowSlotOf = new Dictionary<int, int>();
            int slot = 0;
            for (int r = 0; r < snap.Formation.Count; r++)
            {
                int s = 0; foreach (var g in snap.Formation[r].Groups) s += g.Soldiers;
                if (s > 0) { rowSlotOf[r] = slot; slot++; }
            }

            for (int r = 0; r < snap.Formation.Count; r++)
            {
                var row = snap.Formation[r];
                for (int gi = 0; gi < row.Groups.Count; gi++)
                {
                    var g = row.Groups[gi];
                    var key = (r, gi);
                    _cells.TryGetValue(key, out var cell);

                    if (g.Soldiers <= 0)
                    {
                        if (cell != null && !cell.dying) KillCell(cell);   // nhóm chết → Die rồi biến mất
                        continue;
                    }

                    int rowSlot = rowSlotOf[r];
                    Vector2 target = _rowAxis * rowSlot + _groupAxis * (gi - (row.Groups.Count - 1) * 0.5f);
                    if (cell == null)
                    {
                        cell = SpawnCell(g, r, gi, target);
                        _cells[key] = cell;
                    }
                    else
                    {
                        cell.soldiers = g.Soldiers; cell.maxSoldiers = g.MaxSoldiers;
                        if (!initial && (cell.slotPos - target).sqrMagnitude > 0.0001f)
                            MoveCell(cell, target);       // hàng sau tiến lên → tween Move
                        else if (initial) { cell.slotPos = target; if (cell.anchor != null) cell.anchor.localPosition = target; }
                    }
                    cell.rowSlot = rowSlot;
                }
            }
        }

        // ── cell lifecycle ─────────────────────────────────────────────────────────
        private Cell SpawnCell(GroupSnapshot g, int r, int gi, Vector2 target)
        {
            var anchorGo = new GameObject($"Grp_{r}_{gi}_{g.Troop}");
            var anchor = anchorGo.transform;
            anchor.SetParent(transform, false);
            anchor.localPosition = new Vector3(target.x, target.y, 0f);

            int cols = Mathf.Max(1, g.SpriteCols), srows = Mathf.Max(1, g.SpriteRows);
            var cell = new Cell
            {
                rowIndex = r, groupIndex = gi, troop = g.Troop, soldiers = g.Soldiers, maxSoldiers = g.MaxSoldiers,
                capacity = cols * srows, cols = cols, srows = srows, anchor = anchor, slotPos = target,
            };

            var visual = _db != null ? _db.GetVisualForTroop(g.Troop) : null;
            Vector2 lo = Vector2.positiveInfinity, hi = Vector2.negativeInfinity;
            for (int sr = 0; sr < srows; sr++)
            for (int sc = 0; sc < cols; sc++)
            {
                Vector2 off = _spriteCol * (sc - (cols - 1) * 0.5f) + _spriteRow * sr;
                lo = Vector2.Min(lo, off); hi = Vector2.Max(hi, off);
                var uv = VisualSpawner.SpawnUnit(visual, _faction, anchor);
                if (uv == null) continue;
                uv.transform.localPosition = new Vector3(off.x, off.y, 0f);
                uv.transform.localScale = Vector3.one * _unitScale;
                uv.PlayIdle();
                cell.sprites.Add(uv);
            }

            var ct = anchorGo.AddComponent<GroupClickTarget>();
            ct.field = this; ct.rowIndex = r; ct.groupIndex = gi;
            var col = anchorGo.AddComponent<BoxCollider2D>();
            col.isTrigger = true;
            // collider bao đúng cụm sprite (theo bao đóng thực tế) + đệm cho thân/đầu sprite → click chuẩn dù spacing đổi
            Vector2 span = hi - lo;
            col.offset = (lo + hi) * 0.5f + new Vector2(0f, 0.25f);
            col.size = new Vector2(span.x + 0.45f, span.y + 0.8f);

            UpdateSorting(cell);
            return cell;
        }

        private void KillCell(Cell cell)
        {
            cell.dying = true;
            _cells.Remove((cell.rowIndex, cell.groupIndex));
            if (cell.moveCo != null) StopCoroutine(cell.moveCo);
            if (cell.anchor != null)
            {
                var col = cell.anchor.GetComponent<BoxCollider2D>(); if (col != null) col.enabled = false;
            }
            foreach (var uv in cell.sprites) if (uv != null) uv.PlayDie();
            StartCoroutine(DestroyAfter(cell.anchor, DieDuration));
        }

        private IEnumerator DestroyAfter(Transform t, float delay)
        {
            yield return new WaitForSeconds(delay);
            if (t != null) Destroy(t.gameObject);
        }

        private void MoveCell(Cell cell, Vector2 target)
        {
            cell.slotPos = target;
            if (cell.moveCo != null) StopCoroutine(cell.moveCo);
            cell.moveCo = StartCoroutine(MoveCo(cell, target));
        }

        private IEnumerator MoveCo(Cell cell, Vector2 target)
        {
            foreach (var uv in cell.sprites) if (uv != null) uv.Play(UnitAction.Move);
            Vector3 from = cell.anchor != null ? cell.anchor.localPosition : Vector3.zero;
            Vector3 to = new Vector3(target.x, target.y, 0f);
            float t = 0f;
            while (t < MoveDuration && cell.anchor != null)
            {
                t += Time.deltaTime;
                cell.anchor.localPosition = Vector3.Lerp(from, to, Mathf.Clamp01(t / MoveDuration));
                yield return null;
            }
            if (cell.anchor != null) cell.anchor.localPosition = to;
            foreach (var uv in cell.sprites) if (uv != null) uv.PlayIdle();
            UpdateSorting(cell);
            cell.moveCo = null;
        }

        private void UpdateSorting(Cell cell)
        {
            foreach (var uv in cell.sprites)
            {
                if (uv == null) continue;
                int order = 500 - Mathf.RoundToInt(uv.transform.position.y * 50f);
                uv.baseSortingOrder = order; uv.SetSortingOrder(order);
            }
        }

        // ── whole-general action animations (attack lunge, hurt) ─────────────────────
        public void PlayAction(UnitAction action)
        {
            // Mặc định CHỈ hàng đầu (rowSlot 0) giao chiến → diễn Attack/Hurt; hàng sau đứng Idle chờ tiến lên.
            // (Điểm mở rộng: sau này có thể cho phép hàng cụ thể được config cùng đánh — vd cung binh bắn từ sau.)
            foreach (var cell in _cells.Values)
            {
                if (cell.rowSlot != 0) continue;
                foreach (var uv in cell.sprites) if (uv != null) uv.Play(action);
            }

            if (action == UnitAction.Attack && isActiveAndEnabled)
            {
                if (_lunge != null) StopCoroutine(_lunge);
                _lunge = StartCoroutine(LungeCo());
            }
            if (action == UnitAction.Attack || action == UnitAction.Hurt)
            {
                if (_idleCo != null) StopCoroutine(_idleCo);
                _idleCo = StartCoroutine(ReturnIdle(0.5f));
            }
        }

        private IEnumerator ReturnIdle(float delay)
        {
            yield return new WaitForSeconds(delay);
            foreach (var cell in _cells.Values)
            {
                if (cell.rowSlot != 0) continue;
                foreach (var uv in cell.sprites)
                    if (uv != null && uv.Current != UnitAction.Move && uv.Current != UnitAction.Die) uv.PlayIdle();
            }
        }

        private IEnumerator LungeCo()
        {
            const float dur = 0.18f, dist = 0.3f;
            float t = 0f;
            while (t < dur)
            {
                if (this == null) yield break;
                t += Time.deltaTime;
                transform.localPosition = _lungeDir * (Mathf.Sin(Mathf.Clamp01(t / dur) * Mathf.PI) * dist);
                yield return null;
            }
            if (this != null) transform.localPosition = Vector3.zero;
            _lunge = null;
        }

        // ── HP accessors for the on-demand bar ───────────────────────────────────────
        public bool TryGetGroup(int rowIndex, int groupIndex, out HpTarget info)
        {
            info = default;
            if (!_cells.TryGetValue((rowIndex, groupIndex), out var cell) || cell.dying || cell.anchor == null) return false;
            info.soldiers = cell.soldiers; info.max = cell.maxSoldiers;
            info.top = cell.anchor.position + Vector3.up * 0.55f;
            info.width = Mathf.Max(0.4f, cell.cols * 0.16f + 0.2f);
            return true;
        }

        public bool TryGetRow(int rowIndex, out HpTarget info)
        {
            info = default;
            Vector3 sum = Vector3.zero; int n = 0, sol = 0, max = 0;
            foreach (var cell in _cells.Values)
            {
                if (cell.rowIndex != rowIndex || cell.dying || cell.anchor == null) continue;
                sum += cell.anchor.position; n++; sol += cell.soldiers; max += cell.maxSoldiers;
            }
            if (n == 0) return false;
            info.soldiers = sol; info.max = max;
            info.top = sum / n + Vector3.up * 0.75f;
            info.width = Mathf.Max(0.6f, n * 0.55f + 0.3f);
            return true;
        }
    }
}
