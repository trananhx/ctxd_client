using System.Collections.Generic;
using UnityEngine;

namespace Ctxd.Visual
{
    /// <summary>
    /// Lightweight frame-by-frame sprite player (its own little component — not a framework). Used by effects
    /// and as the fallback for units with no baked Animator yet (loads frames from Resources at runtime).
    /// </summary>
    [RequireComponent(typeof(SpriteRenderer))]
    public sealed class SpriteFramePlayer : MonoBehaviour
    {
        public Sprite[] frames;
        public float fps = 12f;
        public bool loop = true;
        public bool playOnEnable = true;
        public bool destroyOnFinish = false;

        private SpriteRenderer _sr;
        private float _t;
        private int _index;
        private bool _playing;

        public bool IsPlaying => _playing;
        public int FrameCount => frames != null ? frames.Length : 0;

        private void Awake() => _sr = GetComponent<SpriteRenderer>();
        private void OnEnable() { if (playOnEnable) Play(); }

        public void SetFrames(IReadOnlyList<Sprite> sprites, float framesPerSecond, bool looping)
        {
            frames = sprites != null ? new List<Sprite>(sprites).ToArray() : new Sprite[0];
            fps = framesPerSecond; loop = looping;
        }

        // Cache loaded+sorted frame sets by resource folder (20 units replay the same few actions all battle).
        private static readonly Dictionary<string, Sprite[]> _cache = new Dictionary<string, Sprite[]>();

        public void LoadFromResources(string resourceFolder, float framesPerSecond, bool looping)
        {
            if (!_cache.TryGetValue(resourceFolder, out var sprites))
            {
                sprites = Resources.LoadAll<Sprite>(resourceFolder) ?? new Sprite[0];
                System.Array.Sort(sprites, (a, b) => Num(a != null ? a.name : null).CompareTo(Num(b != null ? b.name : null)));
                _cache[resourceFolder] = sprites;
                if (sprites.Length == 0) Debug.LogWarning($"[SpriteFramePlayer] no frames at Resources/{resourceFolder}");
            }
            SetFrames(sprites, framesPerSecond, looping);
        }

        private static int Num(string n)
        {
            if (string.IsNullOrEmpty(n)) return 0;
            var m = System.Text.RegularExpressions.Regex.Match(n, "\\d+");
            return m.Success ? int.Parse(m.Value) : 0;
        }

        public void Play()
        {
            if (_sr == null) _sr = GetComponent<SpriteRenderer>();
            _index = 0; _t = 0f;
            _playing = frames != null && frames.Length > 0;
            if (_playing) _sr.sprite = frames[0];
        }

        public void Stop() => _playing = false;

        private void Update()
        {
            if (!_playing || frames == null || frames.Length == 0 || fps <= 0f) return;
            _t += Time.deltaTime;
            float dur = 1f / fps;
            while (_t >= dur)
            {
                _t -= dur; _index++;
                if (_index >= frames.Length)
                {
                    if (loop) _index = 0;
                    else { _index = frames.Length - 1; _playing = false; _sr.sprite = frames[_index]; if (destroyOnFinish) Destroy(gameObject); return; }
                }
                _sr.sprite = frames[_index];
            }
        }
    }
}
