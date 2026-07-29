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
        public bool barSegmented;     // [C1] thanh máu CHIA NGĂN thay vì fill liền
        public int barSegments;       // số ngăn khi segmented
        public float advanceDelay;    // [C2] giây chờ SAU anim chết trước khi hàng sau tiến lên (0 = như cũ)
        public static FieldLayout Default => new FieldLayout
        {
            rowSpacing = 1.5f, groupSpacing = 1.1f, spriteSpacing = 2.0f, unitScale = 0.7f,
            offenseBarColor = new Color(0.25f, 0.62f, 1f, 0.95f),
            defenseBarColor = new Color(0.90f, 0.20f, 0.18f, 0.95f),
            barSegmented = false, barSegments = 10, advanceDelay = 0f,
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
            public string visualId;                  // [F] hình đã dựng (null = art theo binh chủng) — phát hiện server đổi hình giữa trận
            public float scale = 1f;                 // [F] scale đã dựng — đổi scale cũng phải dựng lại (foot-anchor + bar phụ thuộc)
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
        private const float BarGapAboveSprite = 0.18f;    // khe hở trên ĐỈNH THẬT của sprite (nhân theo cỡ đơn vị)
        private const float BarThickness = 0.14f;         // độ dày thanh máu ở cỡ lính thường
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
                        // [F] Server đổi hình nhóm ĐANG SỐNG giữa trận (VisualId/Scale — vd còn giáp → gãy giáp):
                        // swap sprite tại chỗ, giữ nguyên anchor/slot/máu. So cả scale vì foot-anchor + bar phụ thuộc nó.
                        float wantScale = _unitScale * (g.Scale > 0f ? g.Scale : 1f);
                        if (!cell.dying && (cell.visualId != g.VisualId || !Mathf.Approximately(cell.scale, wantScale)))
                            SwapVisual(cell, g);
                        RefreshBar(cell);
                        if (!initial && (cell.slotPos - target).sqrMagnitude > 0.0001f)
                            MoveCell(cell, target, _layout.advanceDelay);   // [C2] hàng sau tiến lên — đợi anim chết xong
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

            var cell = new Cell { rowIndex = r, groupIndex = gi, troop = g.Troop, anchor = anchor, slotPos = target };
            BuildVisuals(cell, g);
            return cell;
        }

        /// <summary>
        /// Dựng (hoặc DỰNG LẠI khi server đổi hình giữa trận — gói F) sprite + thanh máu của nhóm vào anchor sẵn có.
        /// Ghi lại <c>visualId/scale</c> đã dùng để nhánh diff phát hiện lần đổi kế tiếp.
        /// </summary>
        private void BuildVisuals(Cell cell, GroupSnapshot g)
        {
            cell.soldiers = g.Soldiers; cell.maxSoldiers = g.MaxSoldiers;
            int cols = Mathf.Max(1, g.SpriteCols), srows = Mathf.Max(1, g.SpriteRows);
            cell.cols = cols; cell.srows = srows; cell.capacity = cols * srows;

            // Art: server may name a specific UnitVisualDefinition (a boss figure); otherwise it is picked by troop type.
            var visual = _db == null ? null
                : (!string.IsNullOrEmpty(g.VisualId) ? _db.GetUnitVisual(g.VisualId) : null) ?? _db.GetVisualForTroop(g.Troop);
            float scale = _unitScale * (g.Scale > 0f ? g.Scale : 1f);
            cell.visualId = g.VisualId; cell.scale = scale;

            // Bao đóng THẬT của cụm (đơn vị local của anchor) — dùng để đặt thanh máu.
            float minX = float.PositiveInfinity, maxX = float.NegativeInfinity, maxY = float.NegativeInfinity;
            for (int sr = 0; sr < srows; sr++)
            for (int sc = 0; sc < cols; sc++)
            {
                Vector2 off = _spriteCol * (sc - (cols - 1) * 0.5f) + _spriteRow * sr;
                var uv = VisualSpawner.SpawnUnit(visual, _faction, cell.anchor);
                if (uv == null) continue;
                uv.transform.localScale = Vector3.one * scale;

                // Sprite quân đều pivot GIỮA. Đặt thẳng vào `off` thì nửa dưới thò xuống dưới mốc hàng — với lính
                // 0.7× chỉ lệch ~0.24 nên không ai thấy, nhưng một hình boss phóng to sẽ lún hẳn xuống mấy hàng.
                // Nâng lên đúng nửa chiều cao → mọi đơn vị ĐỨNG BẰNG CHÂN trên mốc hàng, bất kể cỡ.
                Vector3 ext = uv.spriteRenderer != null && uv.spriteRenderer.sprite != null
                    ? uv.spriteRenderer.sprite.bounds.extents * scale
                    : Vector3.zero;
                uv.transform.localPosition = new Vector3(off.x, off.y + ext.y, 0f);
                uv.PlayIdle();
                cell.sprites.Add(uv);

                minX = Mathf.Min(minX, off.x - ext.x); maxX = Mathf.Max(maxX, off.x + ext.x);
                maxY = Mathf.Max(maxY, off.y + ext.y * 2f);
            }

            // Thanh máu riêng của NHÓM: bám bao đóng thật nên tự đúng khi đổi spriteSpacing HOẶC khi nhóm là 1 hình to.
            if (cell.sprites.Count > 0 && maxX > minX)
            {
                float width = Mathf.Max(0.5f, (maxX - minX) + 0.3f * scale);
                float barY = maxY + BarGapAboveSprite * Mathf.Max(1f, scale);
                cell.bar = HealthBar.Create(cell.anchor, new Vector3((minX + maxX) * 0.5f, barY, 0f),
                                            width, BarColor(), BarSortingOrder, BarThickness * Mathf.Max(1f, scale),
                                            _layout.barSegmented, _layout.barSegments);   // [C1] mode chia ngăn
            }
            RefreshBar(cell);

            UpdateSorting(cell);
        }

        /// <summary>[F] Server đổi hình nhóm đang sống → despawn sprite + bar cũ, dựng hình mới vào CÙNG anchor.
        /// Máu/slot/vị trí giữ nguyên; bar dựng lại vì bề ngang phụ thuộc bounds của hình mới.</summary>
        private void SwapVisual(Cell cell, GroupSnapshot g)
        {
            if (cell.anchor == null) return;
            foreach (var uv in cell.sprites) if (uv != null) Destroy(uv.gameObject);
            cell.sprites.Clear();
            if (cell.bar != null) { Destroy(cell.bar.gameObject); cell.bar = null; }
            BuildVisuals(cell, g);
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

        private void MoveCell(Cell cell, Vector2 target, float delay = 0f)
        {
            cell.slotPos = target;   // claim NGAY để snapshot kế (đến trong lúc chờ) không kích hoạt double-move
            if (cell.moveCo != null) StopCoroutine(cell.moveCo);
            cell.moveCo = StartCoroutine(MoveDelayedCo(cell, target, delay));
        }

        /// <summary>[C2] Chờ <paramref name="delay"/> giây (anim chết của hàng trước diễn xong) rồi mới tween lên.
        /// Chạy trong coroutine của field nên KHÔNG chặn Drain của director.</summary>
        private IEnumerator MoveDelayedCo(Cell cell, Vector2 target, float delay)
        {
            if (delay > 0f) yield return new WaitForSeconds(delay);
            yield return MoveCo(cell, target);
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
                // Depth-sort by where the unit STANDS, not where its middle is: a tall figure has a much higher
                // centre than its feet and would otherwise sort as if it stood several rows further back.
                float footY = uv.spriteRenderer != null ? uv.spriteRenderer.bounds.min.y : uv.transform.position.y;
                int order = 500 - Mathf.RoundToInt(footY * 50f);
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
        public void SpawnUnderFootEffect(EffectVisualDefinition eff, float yOffset, float scale, bool perGroup,
                                         bool wholeGroup = false, int? anchorRows = null, int? sortingOverride = null, float? lifetimeSec = null)
        {
            if (eff == null) return;

            if (wholeGroup)   // [B2] MỘT aura ôm trọn đội quân — tâm mọi nhóm sống
            {
                Vector3 sum = Vector3.zero; int n = 0;
                foreach (var cell in _cells.Values)
                {
                    if (cell.dying || cell.anchor == null) continue;
                    sum += cell.anchor.position; n++;
                }
                if (n > 0) Place(eff, sum / n + Vector3.up * yOffset, scale, sortingOverride, lifetimeSec);
                return;
            }

            int rowLimit = anchorRows.HasValue ? Mathf.Max(1, anchorRows.Value) : int.MaxValue;   // [4] 0/1 = hàng trước; N = N hàng trước
            if (perGroup)
            {
                foreach (var cell in _cells.Values)
                {
                    if (cell.dying || cell.anchor == null || cell.rowSlot >= rowLimit) continue;
                    Place(eff, cell.anchor.position + Vector3.up * yOffset, scale, sortingOverride, lifetimeSec);
                }
                return;
            }

            var centre = new Dictionary<int, (Vector3 sum, int n)>();
            foreach (var cell in _cells.Values)
            {
                if (cell.dying || cell.anchor == null || cell.rowSlot >= rowLimit) continue;
                centre.TryGetValue(cell.rowIndex, out var acc);
                centre[cell.rowIndex] = (acc.sum + cell.anchor.position, acc.n + 1);
            }
            foreach (var kv in centre)
                Place(eff, kv.Value.sum / kv.Value.n + Vector3.up * yOffset, scale, sortingOverride, lifetimeSec);
        }

        /// <summary>Tâm N hàng trước đang sống (theo rowSlot). N ≤ 0 → tâm cả đội. Dùng đặt FX skill "hàng 1 / giữa nhiều hàng".</summary>
        public Vector3 RowCenter(int frontRows)
        {
            Vector3 sum = Vector3.zero; int n = 0;
            foreach (var cell in _cells.Values)
            {
                if (cell.dying || cell.anchor == null) continue;
                if (frontRows > 0 && cell.rowSlot >= frontRows) continue;
                sum += cell.anchor.position; n++;
            }
            return n > 0 ? sum / n : Center;
        }

        private void Place(EffectVisualDefinition eff, Vector3 pos, float scale, int? sorting = null, float? lifetimeSec = null)
        {
            var go = VisualSpawner.SpawnEffect(eff, pos, transform, sorting, lifetimeSec);
            if (go != null && scale > 0f) go.transform.localScale *= scale;
        }

        // ── [A] FX BỀN server-driven: diff danh sách ActiveEffects mỗi snapshot ────────
        private readonly Dictionary<string, GameObject> _activeFx = new Dictionary<string, GameObject>();
        private readonly HashSet<string> _fxSeen = new HashSet<string>();
        private readonly List<string> _fxRemove = new List<string>();

        /// <summary>
        /// Đồng bộ FX bền theo danh sách server gửi trong snapshot: mục MỚI → spawn FX lặp; CÒN → giữ (và bám
        /// theo vị trí hàng khi tiến lên); MẤT → huỷ. Gọi từ <c>ServerBattleDirector.RenderFields</c> — đúng seam
        /// áp snapshot, nên buff "giữ liên tục xuyên suốt" không nhấp nháy theo event.
        /// </summary>
        public void SyncActiveEffects(List<ActiveEffectSnapshot> effects,
                                      System.Func<string, EffectVisualDefinition> resolve, float yOffset, float scale)
        {
            _fxSeen.Clear();
            if (effects != null)
            {
                foreach (var fx in effects)
                {
                    if (fx == null || string.IsNullOrEmpty(fx.FxId)) continue;
                    string key = fx.FxId + "#" + fx.RowIndex;
                    _fxSeen.Add(key);
                    Vector3 pos = PersistentAnchor(fx.Anchor, fx.RowIndex, yOffset);
                    if (_activeFx.TryGetValue(key, out var live) && live != null)
                    {
                        live.transform.position = pos;   // hàng tiến lên → aura bám theo
                        continue;
                    }
                    var def = resolve != null ? resolve(fx.FxId) : null;
                    if (def == null) continue;
                    var go = VisualSpawner.SpawnEffect(def, pos, transform, fx.SortingOrder, null, loop: true);
                    if (go == null) continue;
                    if (scale > 0f) go.transform.localScale *= scale;
                    _activeFx[key] = go;
                }
            }

            _fxRemove.Clear();
            foreach (var kv in _activeFx) if (!_fxSeen.Contains(kv.Key) || kv.Value == null) _fxRemove.Add(kv.Key);
            foreach (var k in _fxRemove)
            {
                var go = _activeFx[k];
                _activeFx.Remove(k);
                if (go == null) continue;
                var ev = go.GetComponent<EffectVisual>();
                if (ev != null) ev.StopAndDestroy(); else Destroy(go);
            }
        }

        /// <summary>Vị trí neo FX bền: SideCenter = tâm đội; RowIndex ≥ 0 = tâm ĐÚNG hàng đó; -1 = tâm hàng ĐẦU đang sống.</summary>
        private Vector3 PersistentAnchor(FxAnchorKind anchor, int rowIndex, float yOffset)
        {
            if (anchor == FxAnchorKind.SideCenter) return Center;
            Vector3 sum = Vector3.zero; int n = 0;
            foreach (var cell in _cells.Values)
            {
                if (cell.dying || cell.anchor == null) continue;
                bool match = rowIndex >= 0 ? cell.rowIndex == rowIndex : cell.rowSlot == 0;
                if (!match) continue;
                sum += cell.anchor.position; n++;
            }
            return (n > 0 ? sum / n : Center) + Vector3.up * yOffset;
        }

        /// <summary>[E] Cú xô về phía địch khi 2 quân va nhau lúc đổi hàng — dài và xa hơn lunge đánh thường.</summary>
        public void PlayClash()
        {
            foreach (var cell in _cells.Values)
            {
                if (cell.rowSlot != 0) continue;
                foreach (var uv in cell.sprites) if (uv != null) uv.Play(UnitAction.Attack);
            }
            if (!isActiveAndEnabled) return;
            if (_lunge != null) StopCoroutine(_lunge);
            _lunge = StartCoroutine(LungeCo(0.24f, 0.45f));
            if (_idleCo != null) StopCoroutine(_idleCo);
            _idleCo = StartCoroutine(ReturnIdle(0.6f));
        }

        private IEnumerator LungeCo(float dur = 0.18f, float dist = 0.3f)
        {
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
