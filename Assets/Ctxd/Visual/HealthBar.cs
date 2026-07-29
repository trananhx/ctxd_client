using UnityEngine;

namespace Ctxd.Visual
{
    /// <summary>
    /// A thin procedural HP bar (background + fill) driven by a 0..1 ratio.
    /// Built in code rather than from a prefab because the bar is pure geometry: a 1×1 white sprite at PPU=1 means
    /// <c>localScale</c> IS the world size, so one shared sprite serves every bar at any width.
    /// <para>Sits above a troop group and auto-hides while the group is at full strength — see
    /// <c>BattleSideField</c>, which owns one bar per group and tints it by faction.</para>
    /// </summary>
    [DisallowMultipleComponent]
    public sealed class HealthBar : MonoBehaviour
    {
        private SpriteRenderer _bg, _fill;
        private float _width = 0.9f;
        private float _height = 0.14f;   // scales with the unit: a boss-wide bar at soldier thickness reads as a thread

        // [C1] chế độ CHIA NGĂN: N-1 vạch tối mỏng đè lên fill (fill vẫn liên tục bên dưới các vạch).
        private bool _segmented;
        private int _segments = 1;
        private readonly System.Collections.Generic.List<SpriteRenderer> _dividers = new System.Collections.Generic.List<SpriteRenderer>();
        private const float DividerWidth = 0.03f;
        private static readonly Color DividerColor = new Color(0f, 0f, 0f, 0.9f);

        private static Sprite _sprite;
        private static Sprite WhiteSprite()
        {
            if (_sprite != null) return _sprite;
            var tex = new Texture2D(1, 1, TextureFormat.RGBA32, false) { filterMode = FilterMode.Point };
            tex.SetPixel(0, 0, Color.white); tex.Apply();
            _sprite = Sprite.Create(tex, new Rect(0, 0, 1, 1), new Vector2(0f, 0.5f), 1f); // PPU=1: 1×1 tex = 1 world unit (100 → sub-pixel/invisible)
            _sprite.name = "HpBarPixel";
            return _sprite;
        }

        public static HealthBar Create(Transform parent, Vector3 localPos, float width, Color fill, int sortingOrder,
                                       float height = 0.14f, bool segmented = false, int segments = 1)
        {
            var go = new GameObject("HealthBar");
            go.transform.SetParent(parent, false);
            go.transform.localPosition = localPos;
            var bar = go.AddComponent<HealthBar>();
            bar._width = Mathf.Max(0.1f, width);
            bar._height = Mathf.Max(0.02f, height);
            bar._segmented = segmented && segments > 1;
            bar._segments = Mathf.Max(1, segments);
            bar.BuildRenderers(fill);
            bar.SetSortingOrder(sortingOrder);
            return bar;
        }

        private void BuildRenderers(Color fill)
        {
            _bg   = MakeQuad("bg",   new Color(0f, 0f, 0f, 0.65f), 0);
            _fill = MakeQuad("fill", fill,                          1);
            // both anchored left (pivot x=0) then shifted half a width → the pair reads as centred on the group
            _bg.transform.localPosition   = new Vector3(-_width * 0.5f, 0f, 0f);
            _bg.transform.localScale      = new Vector3(_width, _height, 1f);
            _fill.transform.localPosition = new Vector3(-_width * 0.5f, 0f, 0f);
            _fill.transform.localScale    = new Vector3(_width, _height * 0.75f, 1f);
            if (_segmented) BuildDividers();
            SetRatio(1f);
        }

        /// <summary>[C1] N ngăn → N-1 vạch tối cắt ngang thanh, đè LÊN fill (localOrder 2) — "chia từng ngăn".</summary>
        private void BuildDividers()
        {
            for (int i = 1; i < _segments; i++)
            {
                var d = MakeQuad($"div{i}", DividerColor, 2);
                float x = -_width * 0.5f + _width * (i / (float)_segments) - DividerWidth * 0.5f;
                d.transform.localPosition = new Vector3(x, 0f, 0f);
                d.transform.localScale    = new Vector3(DividerWidth, _height, 1f);   // cao hết thanh để vạch cắt xuyên
                _dividers.Add(d);
            }
        }

        private SpriteRenderer MakeQuad(string n, Color color, int localOrder)
        {
            var go = new GameObject(n);
            go.transform.SetParent(transform, false);
            var sr = go.AddComponent<SpriteRenderer>();
            sr.sprite = WhiteSprite();
            sr.color = color;
            sr.sortingOrder = localOrder;
            return sr;
        }

        public void SetRatio(float ratio)
        {
            ratio = Mathf.Clamp01(ratio);
            if (_fill == null) return;
            var s = _fill.transform.localScale; s.x = _width * ratio; _fill.transform.localScale = s;
        }

        public void SetVisible(bool visible)
        {
            if (gameObject.activeSelf != visible) gameObject.SetActive(visible);
        }

        public void SetSortingOrder(int order)
        {
            if (_bg != null) _bg.sortingOrder = order;
            if (_fill != null) _fill.sortingOrder = order + 1;
            foreach (var d in _dividers) if (d != null) d.sortingOrder = order + 2;   // vạch trên fill, vẫn dưới floating text
        }
    }
}
