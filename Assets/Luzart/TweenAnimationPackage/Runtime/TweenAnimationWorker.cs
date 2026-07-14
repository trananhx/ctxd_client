using DG.Tweening;
using TMPro;
using UnityEngine;

namespace Luzart.Tweener
{
    /// <summary>
    /// Shared timeline math + builder implementing the canonical formula:
    /// DelayStart + LoopCount × (TimeDelayPreLoop + content + TimeDelayAfterLoop).
    /// Builds the flattest structure DOTween allows — a bare Tweener whenever possible.
    /// </summary>
    public static class TweenTimeline
    {
        /// <summary>
        /// Set by the editor Preview so designer-wired UnityEvents never fire in edit mode.
        /// Checked by every user-event invocation in the workers.
        /// </summary>
        public static bool SuppressUserEvents;

        public static float ComputeTotalDuration(in TweenTimingSettings timing, in TweenLoopSettings loop, float baseDuration)
        {
            if (loop.IsLoop)
            {
                if (loop.LoopCount < 0)
                {
                    return float.MaxValue;
                }
                int count = Mathf.Max(1, loop.LoopCount);
                return timing.DelayStart + (baseDuration + timing.TimeDelayPreLoop + timing.TimeDelayAfterLoop) * count;
            }
            return timing.DelayStart + baseDuration;
        }

        /// <summary>
        /// Wraps <paramref name="content"/> with delay/loop per the formula and returns the root tween.
        /// DOTween constraints honored here:
        /// - infinite loops (-1) are only legal on the ROOT tween (Sequence.Append silently clamps them to 1),
        /// - Tweener.SetDelay fires once even with loops, but Sequence.SetDelay repeats per loop
        ///   (this DOTween version has no one-shot overload for sequences), hence the delayGate fallback.
        /// <paramref name="delayGate"/> is a helper tween the caller must kill together with the root; usually null.
        /// <paramref name="onStart"/> (optional) is guaranteed to fire AFTER DelayStart in every branch —
        /// interval-realized delays are timeline content, so a plain OnStart on the root would fire at t=0 there.
        /// </summary>
        public static Tween Build(Tween content, in TweenTimingSettings timing, in TweenLoopSettings loop, bool ignoreTimeScale, TweenCallback onStart, out Tween delayGate)
        {
            delayGate = null;
            float delay = Mathf.Max(0f, timing.DelayStart);
            Tween root;
            bool delayIsInterval = false;

            if (!loop.IsLoop)
            {
                if (delay > 0f)
                {
                    // SetDelay on a Sequence is version-dependent in DOTween (ignored on older builds) —
                    // PrependInterval is the explicit, always-correct equivalent when there is no loop.
                    if (content is Sequence seq)
                    {
                        seq.PrependInterval(delay);
                        delayIsInterval = true;
                    }
                    else
                    {
                        content.SetDelay(delay);
                    }
                }
                root = content;
            }
            else
            {
                int count = loop.LoopCount < 0 ? -1 : Mathf.Max(1, loop.LoopCount);
                bool hasLoopDelays = timing.TimeDelayPreLoop > 0f || timing.TimeDelayAfterLoop > 0f;

                if (!hasLoopDelays && content is not Sequence)
                {
                    // Bare Tweener root: loops (incl. -1) and one-shot delay are both legal here.
                    content.SetLoops(count, loop.LoopType);
                    if (delay > 0f)
                    {
                        content.SetDelay(delay);
                    }
                    root = content;
                }
                else
                {
                    Sequence block;
                    if (hasLoopDelays)
                    {
                        block = DOTween.Sequence();
                        if (timing.TimeDelayPreLoop > 0f)
                        {
                            block.AppendInterval(timing.TimeDelayPreLoop);
                        }
                        block.Append(content);
                        if (timing.TimeDelayAfterLoop > 0f)
                        {
                            block.AppendInterval(timing.TimeDelayAfterLoop);
                        }
                    }
                    else
                    {
                        block = (Sequence)content;
                    }
                    block.SetLoops(count, loop.LoopType);

                    if (delay <= 0f)
                    {
                        root = block;
                    }
                    else if (count > 0)
                    {
                        // Finite loops nest fine — delay once, then the looping block.
                        Sequence wrap = DOTween.Sequence();
                        wrap.AppendInterval(delay);
                        wrap.Append(block);
                        root = wrap;
                        delayIsInterval = true;
                    }
                    else
                    {
                        // Infinite loops must stay on the root, so the delay is a separate gate tween.
                        block.Pause();
                        Sequence gated = block;
                        delayGate = DOVirtual.DelayedCall(delay, () =>
                        {
                            if (gated.IsActive())
                            {
                                gated.Play();
                            }
                        }, ignoreTimeScale);
                        root = block;
                    }
                }
            }

            root.SetUpdate(ignoreTimeScale);

            if (onStart != null)
            {
                if (delayIsInterval)
                {
                    // The delay is timeline content here — root "starts" at t=0, so anchor the
                    // callback at the delay position instead. Roots in these branches never loop,
                    // so the inserted callback fires exactly once.
                    ((Sequence)root).InsertCallback(delay, onStart);
                }
                else
                {
                    // Real delay (Tweener SetDelay) or gated Play — OnStart fires after the delay.
                    root.OnStart(onStart);
                }
            }
            return root;
        }
    }

    /// <summary>
    /// Strategy worker building the DOTween timeline for one animation type.
    /// One instance is cached per TweenAnimation component and reused across Show() calls.
    /// </summary>
    public abstract class TweenAnimationWorker
    {
        protected TweenAnimationSettings _settings;
        private Tween _root;
        private Tween _delayGate;
        private TweenCallback _invokeStart;
        private TweenCallback _invokeComplete;

        public Tween Show(TweenAnimationSettings settings)
        {
            Dispose(); // kill the previous run (if still playing) so tweens never fight over one target
            _settings = settings;

            Tween content = BuildContent();
            if (content == null)
            {
                return null;
            }

            TweenEventSettings events = settings.Events;
            TweenCallback onStart = null;
            if (events != null && events.HasStart)
            {
                onStart = _invokeStart ??= InvokeStartEvent;
            }

            _root = TweenTimeline.Build(content, settings.Timing, settings.Loop, settings.General.IsIgnoreTimeScale, onStart, out _delayGate);
            OnRootBuilt(_root);

            if (events != null && events.HasComplete)
            {
                _root.OnComplete(_invokeComplete ??= InvokeCompleteEvent);
            }
            return _root;
        }

        private void InvokeStartEvent()
        {
            if (!TweenTimeline.SuppressUserEvents)
            {
                _settings.Events?.OnTweenStart?.Invoke();
            }
        }

        private void InvokeCompleteEvent()
        {
            if (!TweenTimeline.SuppressUserEvents)
            {
                _settings.Events?.OnTweenComplete?.Invoke();
            }
        }

        /// <summary>
        /// Drops the root reference WITHOUT killing — called when the root was nested into a
        /// parent Sequence (ownership moved to the parent; Kill on nested tweens is a silent
        /// no-op in DOTween). An orphaned delay gate is harmless: Play() on a nested tween is
        /// a guarded no-op in DOTween, and the gate auto-kills itself after firing.
        /// </summary>
        public void ReleaseRoot()
        {
            _root = null;
            _delayGate = null;
        }

        /// <summary>Kills the current timeline in place (no completion, no callbacks).</summary>
        public void Dispose()
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
                    _root.Kill();
                }
                _root = null;
            }
        }

        /// <summary>Build the animation content tween (without delay/loop wrapping). Null aborts Show.</summary>
        protected abstract Tween BuildContent();

        protected virtual void OnRootBuilt(Tween root) { }

        protected static T ResolveComponent<T>(Object source) where T : Component
        {
            if (source == null)
            {
                return null;
            }
            if (source is T direct)
            {
                return direct;
            }
            GameObject go = source as GameObject;
            if (go == null && source is Component comp)
            {
                go = comp.gameObject;
            }
            if (go == null)
            {
                return null;
            }
            go.TryGetComponent(out T found);
            return found;
        }

        protected static T ResolveOrAddComponent<T>(Object source) where T : Component
        {
            T existing = ResolveComponent<T>(source);
            if (existing != null)
            {
                return existing;
            }
            GameObject go = source as GameObject;
            if (go == null && source is Component comp)
            {
                go = comp.gameObject;
            }
            return go == null ? null : go.AddComponent<T>();
        }
    }

    /// <summary>
    /// Worker for animations driven by a target component. Resolves and caches the target,
    /// handles From/To override semantics shared by all typed workers.
    /// </summary>
    public abstract class TweenAnimationWorker<T> : TweenAnimationWorker where T : Component
    {
        private T _target;
        private Object _targetSource;
        private TweenCallback _lazyFromSnap;

        protected T Target => _target;

        protected sealed override Tween BuildContent()
        {
            Object source = _settings.General.Target;
            if (!ReferenceEquals(source, _targetSource) || _target == null)
            {
                _targetSource = source;
                _target = ResolveTarget(source);
            }
            if (_target == null)
            {
                Debug.LogWarning($"{GetType().Name}: target {typeof(T).Name} could not be resolved from '{source}'");
                return null;
            }

            // Order matters: To must capture the CURRENT value before any From snap moves the target.
            ResolveToValue();

            bool overrideFrom = _settings.Values.OverrideFrom;
            bool lazy = _settings.Values.Timing == EValueTiming.Lazy;

            if (overrideFrom && !lazy)
            {
                // Eager: snap now, before DelayStart — target sits at From while waiting.
                ApplyFromValue();
            }

            Tween anim = CreateAnimationTween();
            if (anim == null)
            {
                return null;
            }
            anim.SetEase(_settings.General.Easing);

            if (overrideFrom && lazy)
            {
                // Lazy: snap right when this tween's turn arrives (fires again on every loop pass).
                _lazyFromSnap ??= ApplyFromValue;
                Sequence seq = DOTween.Sequence();
                seq.AppendCallback(_lazyFromSnap);
                seq.Append(anim);
                return seq;
            }
            // OverrideFrom = false needs no snap at all: DOTween natively captures the start value
            // when the tween begins playing (inherently lazy).
            return anim;
        }

        protected sealed override void OnRootBuilt(Tween root)
        {
            root.SetTarget(_target);
        }

        protected virtual T ResolveTarget(Object source) => ResolveComponent<T>(source);

        /// <summary>Capture the To value (explicit or current) into worker state.</summary>
        protected abstract void ResolveToValue();

        /// <summary>Snap the target to the explicit From value.</summary>
        protected abstract void ApplyFromValue();

        /// <summary>Create the value tween towards the resolved To (DOMove, DOFade, ...).</summary>
        protected abstract Tween CreateAnimationTween();
    }

    /// <summary>Base for Vector3-driven animations (position, scale, rotation, rect properties).</summary>
    public abstract class Vector3TweenAnimationWorker<T> : TweenAnimationWorker<T> where T : Component
    {
        private Vector3 _resolvedTo;

        protected sealed override void ResolveToValue()
        {
            TweenValueSettings values = _settings.Values;
            _resolvedTo = values.OverrideTo ? values.Vector3To : GetCurrentVector3Value();
        }

        protected sealed override void ApplyFromValue()
        {
            SetVector3Value(_settings.Values.Vector3From);
        }

        protected sealed override Tween CreateAnimationTween()
        {
            return CreateVector3Tween(_resolvedTo, _settings.General.Duration);
        }

        protected abstract Vector3 GetCurrentVector3Value();
        protected abstract void SetVector3Value(Vector3 value);
        protected abstract Tween CreateVector3Tween(Vector3 targetValue, float duration);
    }

    #region Vector3 Based Animations

    public class TweenAnimationMove : Vector3TweenAnimationWorker<Transform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.position;
        protected override void SetVector3Value(Vector3 value) => Target.position = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOMove(targetValue, duration);
    }

    public class TweenAnimationMoveLocal : Vector3TweenAnimationWorker<Transform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.localPosition;
        protected override void SetVector3Value(Vector3 value) => Target.localPosition = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOLocalMove(targetValue, duration);
    }

    public class TweenAnimationMoveAnchors : Vector3TweenAnimationWorker<RectTransform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.anchoredPosition;
        protected override void SetVector3Value(Vector3 value) => Target.anchoredPosition = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOAnchorPos(targetValue, duration);
    }

    public class TweenAnimationScale : Vector3TweenAnimationWorker<Transform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.localScale;
        protected override void SetVector3Value(Vector3 value) => Target.localScale = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOScale(targetValue, duration);
    }

    public class TweenAnimationEuler : Vector3TweenAnimationWorker<Transform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.eulerAngles;
        protected override void SetVector3Value(Vector3 value) => Target.eulerAngles = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DORotate(targetValue, duration, _settings.General.RotateMode);
    }

    public class TweenAnimationSizeDelta : Vector3TweenAnimationWorker<RectTransform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.sizeDelta;
        protected override void SetVector3Value(Vector3 value) => Target.sizeDelta = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOSizeDelta(targetValue, duration);
    }

    public class TweenAnimationAnchorMin : Vector3TweenAnimationWorker<RectTransform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.anchorMin;
        protected override void SetVector3Value(Vector3 value) => Target.anchorMin = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOAnchorMin(targetValue, duration);
    }

    public class TweenAnimationAnchorMax : Vector3TweenAnimationWorker<RectTransform>
    {
        protected override Vector3 GetCurrentVector3Value() => Target.anchorMax;
        protected override void SetVector3Value(Vector3 value) => Target.anchorMax = value;
        protected override Tween CreateVector3Tween(Vector3 targetValue, float duration) =>
            Target.DOAnchorMax(targetValue, duration);
    }

    #endregion

    #region CanvasGroup Based Animations

    public class TweenAnimationFade : TweenAnimationWorker<CanvasGroup>
    {
        private float _resolvedTo;

        protected override CanvasGroup ResolveTarget(Object source) => ResolveOrAddComponent<CanvasGroup>(source);

        protected override void ResolveToValue()
        {
            TweenValueSettings values = _settings.Values;
            _resolvedTo = values.OverrideTo ? values.FloatTo : Target.alpha;
        }

        protected override void ApplyFromValue()
        {
            Target.alpha = _settings.Values.FloatFrom;
        }

        protected override Tween CreateAnimationTween()
        {
            return Target.DOFade(_resolvedTo, _settings.General.Duration);
        }
    }

    #endregion

    #region Text Based Animations

    public class TweenAnimationTextMeshPro : TweenAnimationWorker<TextMeshProUGUI>
    {
        private string _resolvedTo;

        protected override void ResolveToValue()
        {
            TweenValueSettings values = _settings.Values;
            _resolvedTo = values.OverrideTo ? values.StringTo : Target.text;
        }

        protected override void ApplyFromValue()
        {
            Target.text = _settings.Values.StringFrom;
        }

        protected override Tween CreateAnimationTween()
        {
            return Target.DOText(_resolvedTo, _settings.General.Duration);
        }
    }

    #endregion

    #region Virtual Animations (no target component)

    public class TweenAnimationFloat : TweenAnimationWorker
    {
        private TweenCallback<float> _onUpdate;

        protected override Tween BuildContent()
        {
            _onUpdate ??= InvokeUpdate;
            return DOVirtual.Float(
                    _settings.Values.FloatFrom,
                    _settings.Values.FloatTo,
                    _settings.General.Duration,
                    _onUpdate)
                .SetEase(_settings.General.Easing);
        }

        private void InvokeUpdate(float value)
        {
            if (!TweenTimeline.SuppressUserEvents)
            {
                _settings.Values.OnFloatUnityEventInvoke?.Invoke(value);
            }
        }
    }

    public class TweenAnimationUnityEvent : TweenAnimationWorker
    {
        private TweenCallback _invoke;

        protected override Tween BuildContent()
        {
            _invoke ??= InvokeEvent;
            // Sequence + AppendCallback (instead of DelayedCall.OnComplete) so the event
            // fires on EVERY loop pass, matching the timeline formula.
            Sequence seq = DOTween.Sequence();
            if (_settings.General.Duration > 0f)
            {
                seq.AppendInterval(_settings.General.Duration);
            }
            seq.AppendCallback(_invoke);
            return seq;
        }

        private void InvokeEvent()
        {
            if (!TweenTimeline.SuppressUserEvents)
            {
                _settings.Values.OnUnityEventInvoke?.Invoke();
            }
        }
    }

    #endregion
}
