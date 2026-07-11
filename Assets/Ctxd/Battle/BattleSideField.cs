using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Data;
using Ctxd.Visual;

namespace Ctxd.Battle
{
    /// <summary>
    /// One active general's army, rendered from a server <see cref="CombatantSnapshot"/> as SEPARATED rows of
    /// troop-groups (each group a cluster of prefab units of its own troop type) plus a large HERO figure at the
    /// front. Front row faces the enemy; deeper rows recede. Pure rendering, every unit a prefab-in-SO; no Find.
    /// </summary>
    public sealed class BattleSideField : MonoBehaviour
    {
        private readonly List<UnitVisual> _units = new List<UnitVisual>();
        private Vector3 _lungeDir;
        private Coroutine _lunge;

        /// <summary>Where damage numbers / cast effects appear (above the block).</summary>
        public Vector3 Center => transform.position + Vector3.up * 0.7f;

        public void Build(CombatantSnapshot snap, Faction faction, CtxdGameDatabase db)
        {
            Clear();
            bool offense = faction == Faction.Offense;
            // Chiến trường ISO: Công (dưới-trái) ↔ Thủ (trên-phải) giáp mặt theo đường chéo "/".
            // 1 HÀNG NGANG trải theo đường chéo "\" (vuông góc trục giáp mặt); các HÀNG lùi dần theo "/" ra xa địch.
            Vector2 rowAxis   = offense ? new Vector2(-0.62f, -0.34f) : new Vector2(0.62f, 0.34f);  // lùi hàng ra xa địch ("/")
            Vector2 groupAxis = new Vector2(0.80f, -0.40f);                                          // nhóm đứng cạnh nhau trong 1 hàng ("\")
            Vector2 spriteCol = new Vector2(0.16f, -0.08f);                                          // lính trong nhóm xếp theo hàng ("\")
            Vector2 spriteRow = rowAxis * 0.16f;                                                     // độ dày nhóm theo hướng lùi
            const float unitScale = 0.7f;
            _lungeDir = offense ? new Vector3(0.5f, 0.28f, 0f) : new Vector3(-0.5f, -0.28f, 0f);      // lao thẳng về phía địch ("/")

            int rowCount = snap?.Formation != null ? snap.Formation.Count : 0;
            int livingRows = 0;
            if (snap?.Formation != null)
                foreach (var row in snap.Formation)
                { int s = 0; foreach (var g in row.Groups) s += g.Soldiers; if (s > 0) livingRows++; }

            // DẠNG "vài hàng quân": TƯỚNG CHÍNH LÀ các hàng lính (không có figure tướng riêng). Server luôn ăn HÀNG ĐẦU
            // trước ⇒ hàng sát địch chết trước; các hàng CÒN SỐNG nén về trước (rowSlot) ⇒ "các hàng sống VẪN TIẾN LÊN"
            // cho tới khi hết sạch = tướng chết. (Phó tướng = 1 hàng của tướng này, server đã ghép sẵn vào Formation.)
            int rowSlot = 0;
            for (int r = 0; r < rowCount; r++)
            {
                var row = snap.Formation[r];
                int rowSoldiers = 0; foreach (var gg in row.Groups) rowSoldiers += gg.Soldiers;
                if (rowSoldiers <= 0) continue;   // hàng đã tan → hàng sau tiến lên chiếm chỗ
                int groups = row.Groups.Count;
                for (int gi = 0; gi < groups; gi++)
                {
                    var g = row.Groups[gi];
                    var visual = db != null ? db.GetVisualForTroop(g.Troop) : null;
                    Vector2 groupCenter = rowAxis * rowSlot + groupAxis * (gi - (groups - 1) * 0.5f);

                    int cols = Mathf.Max(1, g.SpriteCols), srows = Mathf.Max(1, g.SpriteRows);
                    int capacity = cols * srows;
                    int alive = g.MaxSoldiers > 0
                        ? Mathf.Clamp(Mathf.CeilToInt(capacity * (float)g.Soldiers / g.MaxSoldiers), 0, capacity)
                        : 0;

                    int idx = 0;
                    for (int sr = 0; sr < srows; sr++)
                    for (int sc = 0; sc < cols; sc++)
                    {
                        if (idx++ >= alive) continue;
                        var uv = VisualSpawner.SpawnUnit(visual, faction, transform);
                        if (uv == null) continue;
                        Vector2 p = groupCenter + spriteCol * (sc - (cols - 1) * 0.5f) + spriteRow * sr;
                        uv.transform.localPosition = new Vector3(p.x, p.y, 0f);
                        uv.transform.localScale = Vector3.one * unitScale;
                        int order = 500 - Mathf.RoundToInt((transform.position.y + p.y) * 50f);
                        uv.baseSortingOrder = order; uv.SetSortingOrder(order);
                        uv.PlayIdle();
                        _units.Add(uv);
                    }
                }
                rowSlot++;
            }

            // DẠNG "1 CON TƯỚNG" (không có hàng quân nào): thể hiện bằng MỘT đơn vị tướng lớn — tướng chết khi đơn vị
            // này hết máu. Data hiện tại đều là "vài hàng quân" nên nhánh này KHÔNG kích hoạt (không có figure thừa).
            if (livingRows == 0 && snap != null)
            {
                var heroVisual = db != null ? db.GetVisualForTroop(snap.Troop) : null;
                var hero = VisualSpawner.SpawnUnit(heroVisual, faction, transform);
                if (hero != null)
                {
                    hero.transform.localPosition = Vector3.zero;
                    hero.transform.localScale = Vector3.one * 1.6f;
                    int ho = 560 - Mathf.RoundToInt(transform.position.y * 50f);
                    hero.baseSortingOrder = ho; hero.SetSortingOrder(ho);
                    hero.PlayIdle();
                    _units.Add(hero);
                }
            }
        }

        public void PlayAction(UnitAction action)
        {
            foreach (var u in _units) if (u != null) u.Play(action);
            if (action == UnitAction.Attack && isActiveAndEnabled)
            {
                if (_lunge != null) StopCoroutine(_lunge);
                _lunge = StartCoroutine(LungeCo());
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

        public void SetTroopRatio(float ratio) { }   // snapshot-driven now (server soldier counts)

        public void Clear()
        {
            if (_lunge != null) { StopCoroutine(_lunge); _lunge = null; }
            transform.localPosition = Vector3.zero;
            foreach (var u in _units) if (u != null) Destroy(u.gameObject);
            _units.Clear();
        }
    }
}
