using UnityEngine;

namespace Ctxd.Visual
{
    /// <summary>A thin per-row HP bar built procedurally (background + fill), driven by a 0..1 ratio.</summary>
    [DisallowMultipleComponent]
    public sealed class RowHealthBar : MonoBehaviour
    {
        private SpriteRenderer _bg, _fill;
        private float _width = 0.9f;
        private const float Height = 0.10f;

        private static Sprite _sprite;
        private static Sprite WhiteSprite()
        {
            if (_sprite != null) return _sprite;
            var tex = new Texture2D(1, 1, TextureFormat.RGBA32, false) { filterMode = FilterMode.Point };
            tex.SetPixel(0, 0, Color.white); tex.Apply();
            _sprite = Sprite.Create(tex, new Rect(0, 0, 1, 1), new Vector2(0f, 0.5f), 100f); // left-anchored → scale.x = fill
            _sprite.name = "RowHpBarPixel";
            return _sprite;
        }

        public static RowHealthBar Create(Transform parent, Vector3 localPos, float width)
        {
            var go = new GameObject("RowHealthBar");
            go.transform.SetParent(parent, false);
            go.transform.localPosition = localPos;
            var bar = go.AddComponent<RowHealthBar>();
            bar._width = Mathf.Max(0.1f, width);
            bar.BuildRenderers();
            return bar;
        }

        private void BuildRenderers()
        {
            _bg = MakeQuad("bg", new Color(0f, 0f, 0f, 0.6f), -1);
            _fill = MakeQuad("fill", new Color(0.85f, 0.15f, 0.15f, 0.95f), 0);
            // background spans full width, anchored left; center it by shifting half width
            _bg.transform.localPosition = new Vector3(-_width * 0.5f, 0f, 0f);
            _bg.transform.localScale = new Vector3(_width, Height, 1f);
            _fill.transform.localPosition = new Vector3(-_width * 0.5f, 0f, 0f);
            _fill.transform.localScale = new Vector3(_width, Height * 0.8f, 1f);
            SetRatio(1f);
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
            if (_fill != null)
            {
                var s = _fill.transform.localScale; s.x = _width * ratio; _fill.transform.localScale = s;
            }
        }

        public void SetSortingOrder(int order)
        {
            if (_bg != null) _bg.sortingOrder = order;
            if (_fill != null) _fill.sortingOrder = order + 1;
        }
    }
}
