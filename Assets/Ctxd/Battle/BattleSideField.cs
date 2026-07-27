using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Data;
using Ctxd.Visual;

namespace Ctxd.Battle
{

    /// <summary>Tunable field spacing (from the director's Inspector). Multipliers on the base ISO layout.</summary>
    public struct FieldLayout
    {
        public float rowSpacing;      // ↑ = rows further apart
        public float groupSpacing;    // ↑ = groups within a row further apart
        public float spriteSpacing;   // ↑ = soldiers within a group further apart
        public float unitScale;       // per-sprite scale
        public Color offenseBarColor; // HP bar tint for Công (att sprites are blue-armoured)
        public Color defenseBarColor; // HP bar tint for Thủ (def sprites are red-armoured)
        public static FieldLayout Default => new FieldLayout
        {
            rowSpacing = 1.5f, groupSpacing = 1.1f, spriteSpacing = 2.0f, unitScale = 0.7f,
            offenseBarColor = new Color(0.25f, 0.62f, 1f, 0.95f),
            defenseBarColor = new Color(0.90f, 0.20f, 0.18f, 0.95f),
        };
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
            public Transform anchor;                 // child of field; sprites + HP bar live here
            public readonly List<UnitVisual> sprites = new List<UnitVisual>();
            public HealthBar bar;                    // always-on HP bar; hidden while the group is at full strength
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
        private const float BarHeightAboveGroup = 0.5f;   // trên đỉnh cụm sprite của nhóm
        private const int BarSortingOrder = 800;          // trên lính (~400) + FX (600), dưới floating text (1000)

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
                        RefreshBar(cell);
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

            // Thanh máu riêng của NHÓM: bám theo bao đóng thực tế của cụm sprite → tự đúng khi đổi spriteSpacing.
            if (cell.sprites.Count > 0)
            {
                Vector2 span = hi - lo;
                float width = Mathf.Max(0.5f, span.x + 0.35f);
                var barPos = new Vector3((lo.x + hi.x) * 0.5f, hi.y + BarHeightAboveGroup, 0f);
                cell.bar = HealthBar.Create(anchor, barPos, width, BarColor(), BarSortingOrder);
            }
            RefreshBar(cell);

            UpdateSorting(cell);
            return cell;
        }

        private Color BarColor()
            => _faction == Faction.Offense ? _layout.offenseBarColor : _layout.defenseBarColor;

        /// <summary>Bar is visible ONLY while the group is damaged but alive — full-strength groups stay clean.</summary>
        private static void RefreshBar(Cell cell)
        {
            if (cell.bar == null) return;
            bool damaged = cell.maxSoldiers > 0 && cell.soldiers > 0 && cell.soldiers < cell.maxSoldiers;
            cell.bar.SetVisible(damaged);
            if (damaged) cell.bar.SetRatio((float)cell.soldiers / cell.maxSoldiers);
        }

        private void KillCell(Cell cell)
        {
            cell.dying = true;
            _cells.Remove((cell.rowIndex, cell.groupIndex));
            if (cell.moveCo != null) StopCoroutine(cell.moveCo);
            if (cell.bar != null) cell.bar.SetVisible(false);   // nhóm tan → giấu thanh máu, chỉ còn animation Die
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

        /// <summary>
        /// Drops a ground aura at the FEET of this army — the visual grammar for buffs and stance, as opposed to
        /// attack VFX which land on the target (see <c>ServerBattleDirector.SpawnSkillEffect</c>).
        /// <para><paramref name="perGroup"/> = false spawns ONE aura per living row, centred on that row. The
        /// extracted <c>eff/formation</c> art is drawn row-wide (three linked shapes, one per group slot), so one
        /// copy per group would stack three redundant auras on top of each other.</para>
        /// </summary>
        public void SpawnUnderFootEffect(EffectVisualDefinition eff, float yOffset, float scale, bool perGroup)
        {
            if (eff == null) return;
            if (perGroup)
            {
                foreach (var cell in _cells.Values)
                {
                    if (cell.dying || cell.anchor == null) continue;
                    Place(eff, cell.anchor.position + Vector3.up * yOffset, scale);
                }
                return;
            }

            var centre = new Dictionary<int, (Vector3 sum, int n)>();
            foreach (var cell in _cells.Values)
            {
                if (cell.dying || cell.anchor == null) continue;
                centre.TryGetValue(cell.rowIndex, out var acc);
                centre[cell.rowIndex] = (acc.sum + cell.anchor.position, acc.n + 1);
            }
            foreach (var kv in centre)
                Place(eff, kv.Value.sum / kv.Value.n + Vector3.up * yOffset, scale);
        }

        private void Place(EffectVisualDefinition eff, Vector3 pos, float scale)
        {
            var go = VisualSpawner.SpawnEffect(eff, pos, transform);
            if (go != null && scale > 0f) go.transform.localScale *= scale;
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
    }
}
