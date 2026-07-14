using DG.Tweening;
using System.Collections.Generic;
using UnityEngine;

namespace Luzart.Tweener
{
    public class SequenceTweenAnimation : TweenAnimationBase
    {
        [SerializeField] private List<TweenSequence> tweenSequences = new List<TweenSequence>();
        [SerializeField] private TweenSequenceSettings sequenceSettings = new TweenSequenceSettings();

        private Tween _root;
        private Tween _delayGate;
        private TweenCallback _invokeStart;
        private TweenCallback _invokeComplete;

        // Re-entrancy guards against circular sequence references (A contains B contains A),
        // which would otherwise stack-overflow both playback and duration computation.
        private static readonly HashSet<SequenceTweenAnimation> ShowStack = new HashSet<SequenceTweenAnimation>();
        private static readonly HashSet<SequenceTweenAnimation> DurationStack = new HashSet<SequenceTweenAnimation>();

        public override Tween Show()
        {
            if (!ShowStack.Add(this))
            {
                Debug.LogError($"SequenceTweenAnimation: circular reference detected at '{name}' — this entry is skipped.", this);
                return null;
            }
            Sequence content = null;
            try
            {
                Stop(); // kill the previous run so re-Show never leaves an orphaned timeline

                content = DOTween.Sequence();
                var used = new HashSet<TweenAnimationBase>();
                for (int i = 0; i < tweenSequences.Count; i++)
                {
                    TweenSequence entry = tweenSequences[i];
                    if (entry == null || entry.TweenAnimation == null)
                    {
                        continue;
                    }
                    if (entry.TweenAnimation == this)
                    {
                        Debug.LogError($"SequenceTweenAnimation: '{name}' references itself at entry {i} — skipped.", this);
                        continue;
                    }
                    if (!used.Add(entry.TweenAnimation))
                    {
                        // A second Show() on the same component would silently orphan its already
                        // nested tween (Kill on nested tweens is a no-op) and fight it per frame.
                        Debug.LogError($"SequenceTweenAnimation: '{entry.TweenAnimation.name}' appears more than once " +
                                       $"in '{name}' (entry {i}) — duplicate skipped. Use separate TweenAnimation components instead.", this);
                        continue;
                    }
                    if (entry.TweenAnimation.GetTotalDuration() >= float.MaxValue)
                    {
                        Debug.LogWarning($"SequenceTweenAnimation: entry {i} ('{entry.TweenAnimation.name}') has an infinite loop — " +
                                         "DOTween clamps nested infinite loops to 1. Use -1 only on the outermost animation.", this);
                    }

                    Tween tween = entry.TweenAnimation.Show();
                    if (tween == null)
                    {
                        continue;
                    }
                    switch (entry.SequenceType)
                    {
                        case ESequenceType.Append:
                            content.Append(tween);
                            break;
                        case ESequenceType.Join:
                            content.Join(tween);
                            break;
                        case ESequenceType.Insert:
                            content.Insert(entry.InsertTime, tween);
                            break;
                    }
                    // Ownership of the child's root moved into `content` — the child must drop
                    // its reference (DOTween ignores Kill() on nested tweens).
                    entry.TweenAnimation.OnRootNestedIntoSequence();
                }

                TweenEventSettings events = sequenceSettings.Events;
                TweenCallback onStart = null;
                if (events != null && events.HasStart)
                {
                    onStart = _invokeStart ??= InvokeStartEvent;
                }

                _root = TweenTimeline.Build(content, sequenceSettings.Timing, sequenceSettings.Loop,
                    sequenceSettings.IsIgnoreTimeScale, onStart, out _delayGate);

                if (events != null && events.HasComplete)
                {
                    _root.OnComplete(_invokeComplete ??= InvokeCompleteEvent);
                }
                return _root;
            }
            catch
            {
                // A child Show threw mid-build — never leave a half-built timeline playing.
                if (_root != null && _root.IsActive())
                {
                    _root.Kill();
                    _root = null;
                }
                else if (content != null && content.IsActive())
                {
                    content.Kill();
                }
                throw;
            }
            finally
            {
                ShowStack.Remove(this);
            }
        }

        private void InvokeStartEvent()
        {
            if (!TweenTimeline.SuppressUserEvents)
            {
                sequenceSettings.Events?.OnTweenStart?.Invoke();
            }
        }

        private void InvokeCompleteEvent()
        {
            if (!TweenTimeline.SuppressUserEvents)
            {
                sequenceSettings.Events?.OnTweenComplete?.Invoke();
            }
        }

        public override void Stop()
        {
            if (_delayGate != null)
            {
                if (_delayGate.IsActive())
                {
                    _delayGate.Kill();
                }
                _delayGate = null;
            }
            if (_root != null)
            {
                if (_root.IsActive())
                {
                    _root.Kill(); // children are nested inside — killed together
                }
                _root = null;
            }
        }

        public override void OnRootNestedIntoSequence()
        {
            // This sequence's root now belongs to an outer sequence — drop control of it.
            _root = null;
            _delayGate = null;
        }

        public override float GetTotalDuration()
        {
            if (!DurationStack.Add(this))
            {
                Debug.LogError($"SequenceTweenAnimation: circular reference detected at '{name}' while computing duration.", this);
                return 0f;
            }
            try
            {
                return TweenTimeline.ComputeTotalDuration(sequenceSettings.Timing, sequenceSettings.Loop, ComputeBaseDuration());
            }
            finally
            {
                DurationStack.Remove(this);
            }
        }

        /// <summary>Editor/preview helper — enumerates the wired child animations.</summary>
        public IEnumerable<TweenAnimationBase> GetChildren()
        {
            for (int i = 0; i < tweenSequences.Count; i++)
            {
                TweenSequence entry = tweenSequences[i];
                if (entry != null && entry.TweenAnimation != null)
                {
                    yield return entry.TweenAnimation;
                }
            }
        }

        private float ComputeBaseDuration()
        {
            float duration = 0f;
            float lastAppendStart = 0f;

            for (int i = 0; i < tweenSequences.Count; i++)
            {
                TweenSequence entry = tweenSequences[i];
                if (entry == null || entry.TweenAnimation == null || entry.TweenAnimation == this)
                {
                    continue;
                }
                float dur = Mathf.Max(0f, entry.TweenAnimation.GetTotalDuration());

                switch (entry.SequenceType)
                {
                    case ESequenceType.Append:
                        {
                            float start = duration;
                            lastAppendStart = start;
                            duration = start + dur;
                            break;
                        }

                    case ESequenceType.Join:
                        {
                            float end = lastAppendStart + dur;
                            duration = Mathf.Max(duration, end);
                            break;
                        }

                    case ESequenceType.Insert:
                        {
                            float start = Mathf.Max(0f, entry.InsertTime);
                            float end = start + dur;
                            if (end > duration)
                            {
                                duration = end;
                            }
                            lastAppendStart = start;
                            break;
                        }
                }
            }

            return duration;
        }

        private void OnValidate()
        {
#if UNITY_EDITOR
            if (sequenceSettings == null)
            {
                sequenceSettings = new TweenSequenceSettings();
            }
            float baseDuration = ComputeBaseDuration();
            if (float.IsInfinity(baseDuration))
            {
                baseDuration = float.MaxValue;
            }
            if (!Mathf.Approximately(sequenceSettings.DisplayDuration, baseDuration))
            {
                sequenceSettings.SetDisplayDuration(baseDuration);
            }
            ValidateEntries();
#endif
        }

#if UNITY_EDITOR
        private void ValidateEntries()
        {
            var seen = new HashSet<TweenAnimationBase>();
            for (int i = 0; i < tweenSequences.Count; i++)
            {
                TweenSequence entry = tweenSequences[i];
                if (entry == null || entry.TweenAnimation == null)
                {
                    continue;
                }
                if (entry.TweenAnimation == this)
                {
                    Debug.LogError($"SequenceTweenAnimation: '{name}' references itself at entry {i}.", this);
                    continue;
                }
                if (!seen.Add(entry.TweenAnimation))
                {
                    Debug.LogError($"SequenceTweenAnimation: '{entry.TweenAnimation.name}' appears more than once in '{name}' " +
                                   $"(entry {i}) — only the first entry will play. Use separate TweenAnimation components.", this);
                    continue;
                }
                if (entry.TweenAnimation.GetTotalDuration() >= float.MaxValue)
                {
                    Debug.LogWarning($"SequenceTweenAnimation: entry {i} ('{entry.TweenAnimation.name}') loops infinitely — " +
                                     "inside a Sequence it will play only ONCE (DOTween clamps nested -1 loops). " +
                                     "Set -1 only on the outermost animation.", this);
                }
                if (entry.TweenAnimation is TweenAnimation child &&
                    child.Settings?.General != null &&
                    child.Settings.General.IsIgnoreTimeScale != sequenceSettings.IsIgnoreTimeScale)
                {
                    Debug.LogWarning($"SequenceTweenAnimation: entry {i} ('{child.name}') has IsIgnoreTimeScale = " +
                                     $"{child.Settings.General.IsIgnoreTimeScale} but the sequence uses {sequenceSettings.IsIgnoreTimeScale}. " +
                                     "DOTween applies only the ROOT setting to nested tweens — the child setting is ignored.", this);
                }
            }
        }
#endif

        [System.Serializable]
        class TweenSequence
        {
            public TweenAnimationBase TweenAnimation;
            public ESequenceType SequenceType;
            [ShowIf("SequenceType", ESequenceType.Insert)]
            public float InsertTime;
        }

        public enum ESequenceType
        {
            Append,
            Join,
            Insert
        }
    }

    // Minimal settings for sequence animations with IgnoreTimeScale option
    [System.Serializable]
    public class TweenSequenceSettings
    {
        [ReadOnly]
        [SerializeField]
        [Tooltip("Computed content length (one pass, without this sequence's own delay/loops). Display only.")]
        private float _duration = 0f;

        public bool IsIgnoreTimeScale = false;

        public TweenTimingSettings Timing;

        public TweenLoopSettings Loop;

        public TweenEventSettings Events = new TweenEventSettings();

        public float DisplayDuration => _duration;

        public void SetDisplayDuration(float duration)
        {
            _duration = duration;
        }
    }
}
