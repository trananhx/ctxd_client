using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Data;
using Ctxd.Visual;

namespace Ctxd.Battle
{
    /// <summary>Marker on a group's anchor so a click raycast can identify which (field,row,group) was hit.</summary>
    public sealed class GroupClickTarget : MonoBehaviour
    {
        public BattleSideField field;
        public int rowIndex, groupIndex;
    }

    /// <summary>HP + placement of a clicked row/group, for the on-demand HP bar.</summary>
    public struct HpTarget { public int soldiers, max; public Vector3 top; public float width; }

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
        private Coroutine _lunge, _idleCo;

        private const float DieDuration = 0.4f;
        private const float MoveDuration = 0.3f;

        public Vector3 Center => transform.position + Vector3.up * 0.7f;
        public string CombatantId => _snap != null ? _snap.Id : null;

        // ── build / update ─────────────────────────────────────────────────────────
        public void Build(CombatantSnapshot snap, Faction faction, CtxdGameDatabase db)
        {
            _db = db; _faction = faction;
            ConfigureLayout(faction);
            ApplyStateInternal(snap, initial: true);
        }

        /// <summary>Diff the new snapshot against live groups and animate the deltas (same active general).</summary>
        public void ApplyState(CombatantSnapshot snap) => ApplyStateInternal(snap, initial: false);

        private void ConfigureLayout(Faction faction)
        {
            bool offense = faction == Faction.Offense;
            // Chiến trường ISO: Công (dưới-trái) ↔ Thủ (trên-phải). Hàng lùi theo "/"; nhóm trải theo "\".
            _rowAxis   = offense ? new Vector2(-0.62f, -0.34f) : new Vector2(0.62f, 0.34f);
            _groupAxis = new Vector2(0.80f, -0.40f);
            _spriteCol = new Vector2(0.16f, -0.08f);
            _spriteRow = _rowAxis * 0.16f;
            _unitScale = 0.7f;
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
                        _cells[key] = SpawnCell(g, r, gi, target);
                    }
                    else
                    {
                        cell.soldiers = g.Soldiers; cell.maxSoldiers = g.MaxSoldiers;
                        if (!initial && (cell.slotPos - target).sqrMagnitude > 0.0001f)
                            MoveCell(cell, target);       // hàng sau tiến lên → tween Move
                        else if (initial) { cell.slotPos = target; if (cell.anchor != null) cell.anchor.localPosition = target; }
                    }
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
            for (int sr = 0; sr < srows; sr++)
            for (int sc = 0; sc < cols; sc++)
            {
                var uv = VisualSpawner.SpawnUnit(visual, _faction, anchor);
                if (uv == null) continue;
                Vector2 off = _spriteCol * (sc - (cols - 1) * 0.5f) + _spriteRow * sr;
                uv.transform.localPosition = new Vector3(off.x, off.y, 0f);
                uv.transform.localScale = Vector3.one * _unitScale;
                uv.PlayIdle();
                cell.sprites.Add(uv);
            }

            var ct = anchorGo.AddComponent<GroupClickTarget>();
            ct.field = this; ct.rowIndex = r; ct.groupIndex = gi;
            var col = anchorGo.AddComponent<BoxCollider2D>();
            col.isTrigger = true;
            col.offset = new Vector2(0f, 0.15f);
            col.size = new Vector2(cols * 0.22f + 0.35f, srows * 0.18f + 0.6f);

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
            foreach (var cell in _cells.Values)
                foreach (var uv in cell.sprites) if (uv != null) uv.Play(action);

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
                foreach (var uv in cell.sprites)
                    if (uv != null && uv.Current != UnitAction.Move && uv.Current != UnitAction.Die) uv.PlayIdle();
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
