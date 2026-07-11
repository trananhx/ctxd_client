using UnityEngine;
using TMPro;

namespace Ctxd.Visual
{
    /// <summary>Floating combat number (red − / green +) that rises and fades. (Plain MonoBehaviour.)</summary>
    [DisallowMultipleComponent]
    public sealed class FloatingText : MonoBehaviour
    {
        public TextMeshPro label;
        public float duration = 1.0f;
        public float rise = 1.4f;

        private float _t;
        private Color _color = Color.white;
        private Vector3 _start;
        private bool _running;

        public void Show(string text, Color color)
        {
            if (label == null) label = GetComponent<TextMeshPro>();
            if (label != null) { label.text = text; label.color = color; }
            _color = color; _start = transform.position; _t = 0f; _running = true;
        }

        private void Update()
        {
            if (!_running) return;
            _t += Time.deltaTime;
            float k = duration > 0f ? _t / duration : 1f;
            transform.position = _start + Vector3.up * (rise * k);
            if (label != null) { var c = _color; c.a = Mathf.Clamp01(1f - k); label.color = c; }
            if (_t >= duration) Destroy(gameObject);
        }
    }
}
