using DG.Tweening;
using UnityEngine;
using UnityEngine.Events;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Luzart.Tweener
{
    public class TweenAnimation : TweenAnimationBase
    {
        [SerializeField] private EAnimation typeAnimation;
        [SerializeField] private TweenAnimationSettings tweenAnimationSettings = new TweenAnimationSettings();

        // Worker is cached per component: allocated on first Show(), reused afterwards so its
        // resolved-target cache survives across plays. Rebuilt only if typeAnimation changes.
        private TweenAnimationWorker _worker;
        private EAnimation _workerType;

        public TweenAnimationSettings Settings => tweenAnimationSettings;
        public EAnimation TypeAnimation => typeAnimation;

        // Referenced by ShowIf/ShowIfAll string paths in TweenValueSettings — keep names stable.
        public bool IsAnimationVector3 => typeAnimation == EAnimation.Move ||
                                          typeAnimation == EAnimation.MoveLocal ||
                                          typeAnimation == EAnimation.MoveAnchors ||
                                          typeAnimation == EAnimation.Scale ||
                                          typeAnimation == EAnimation.Euler ||
                                          typeAnimation == EAnimation.SizeDelta ||
                                          typeAnimation == EAnimation.AnchorMin ||
                                          typeAnimation == EAnimation.AnchorMax;

        public bool IsAnimationFloat => typeAnimation == EAnimation.FadeByCanvasGroup ||
                                        typeAnimation == EAnimation.Float;

        /// <summary>
        /// True for animation types whose From/To values can be either user-provided (Override=true)
        /// or auto-pulled from the target's current value (Override=false).
        /// UnityEvent type does not use From/To at all and so does not support override.
        /// </summary>
        public bool SupportsValueOverride =>
            IsAnimationVector3
            || typeAnimation == EAnimation.FadeByCanvasGroup
            || typeAnimation == EAnimation.Float
            || typeAnimation == EAnimation.TextMeshProDOText;

        public override Tween Show()
        {
            if (_worker != null && _workerType != typeAnimation)
            {
                _worker.Dispose();
                _worker = null;
            }
            if (_worker == null)
            {
                _worker = CreateWorker();
                if (_worker == null)
                {
                    Debug.LogError($"TweenAnimation: unknown animation type '{typeAnimation}' on '{name}'", this);
                    return null;
                }
                _workerType = typeAnimation;
            }

            if (tweenAnimationSettings.General.Target == null)
            {
                tweenAnimationSettings.General.Target = gameObject;
            }

            // Worker.Show kills its previous timeline (if any still runs) before building the new one.
            return _worker.Show(tweenAnimationSettings);
        }

        public override void Stop()
        {
            _worker?.Dispose();
        }

        public override void OnRootNestedIntoSequence()
        {
            _worker?.ReleaseRoot();
        }

        public override float GetTotalDuration() => tweenAnimationSettings.TotalDuration;

        private TweenAnimationWorker CreateWorker()
        {
            return typeAnimation switch
            {
                EAnimation.Move => new TweenAnimationMove(),
                EAnimation.MoveLocal => new TweenAnimationMoveLocal(),
                EAnimation.MoveAnchors => new TweenAnimationMoveAnchors(),
                EAnimation.Euler => new TweenAnimationEuler(),
                EAnimation.Scale => new TweenAnimationScale(),
                EAnimation.SizeDelta => new TweenAnimationSizeDelta(),
                EAnimation.AnchorMin => new TweenAnimationAnchorMin(),
                EAnimation.AnchorMax => new TweenAnimationAnchorMax(),
                EAnimation.FadeByCanvasGroup => new TweenAnimationFade(),
                EAnimation.TextMeshProDOText => new TweenAnimationTextMeshPro(),
                EAnimation.Float => new TweenAnimationFloat(),
                EAnimation.UnityEvent => new TweenAnimationUnityEvent(),
                _ => null
            };
        }

        private void OnValidate()
        {
#if UNITY_EDITOR
            if (tweenAnimationSettings == null || tweenAnimationSettings.General == null)
            {
                return;
            }
            // Float has no "current value" to pull From/To from — force explicit values so the
            // From/To fields stay visible and the worker never animates from an unset 0.
            if (typeAnimation == EAnimation.Float && tweenAnimationSettings.Values != null)
            {
                tweenAnimationSettings.Values.OverrideFrom = true;
                tweenAnimationSettings.Values.OverrideTo = true;
            }
            if (tweenAnimationSettings.General.Target == null)
            {
                return;
            }
            // Defer structural changes: Unity forbids AddComponent/SendMessage inside OnValidate.
            EditorApplication.delayCall += DeferredEnsureCanvasGroup;
#endif
        }

#if UNITY_EDITOR
        private void DeferredEnsureCanvasGroup()
        {
            if (this == null)
            {
                return;
            }
            // Never structurally mutate prefab ASSETS from a validate callback — the change either
            // fails or silently reverts on every import, looping forever. Scene instances only.
            if (EditorUtility.IsPersistent(this))
            {
                return;
            }
            EnsureCanvasGroupTarget();
        }
#endif

        private void Reset()
        {
            if (tweenAnimationSettings?.General != null)
            {
                tweenAnimationSettings.General.Target = gameObject;
            }
            EnsureCanvasGroupTarget();
        }

        private void EnsureCanvasGroupTarget()
        {
            if (typeAnimation != EAnimation.FadeByCanvasGroup)
            {
                return;
            }
            if (tweenAnimationSettings?.General == null || tweenAnimationSettings.General.Target == null)
            {
                return;
            }
            if (tweenAnimationSettings.General.Target is CanvasGroup)
            {
                return;
            }

            GameObject go = tweenAnimationSettings.General.Target as GameObject;
            if (go == null && tweenAnimationSettings.General.Target is Component comp)
            {
                go = comp.gameObject;
            }
            if (go == null)
            {
                Debug.LogError($"TweenAnimation: Target of {name} is not a GameObject or Component — cannot auto-add CanvasGroup.", this);
                return;
            }

            if (!go.TryGetComponent(out CanvasGroup canvas))
            {
#if UNITY_EDITOR
                if (!Application.isPlaying)
                {
                    // Structural edits on prefab ASSETS are only legal inside Prefab Mode —
                    // attempting them from a validate callback silently reverts on every import.
                    if (EditorUtility.IsPersistent(go))
                    {
                        Debug.LogError($"TweenAnimation: Target of '{name}' is a prefab asset without a CanvasGroup — " +
                                       "open the prefab in Prefab Mode to add it, or reference a scene object instead.", this);
                        return;
                    }
                    canvas = Undo.AddComponent<CanvasGroup>(go);
                }
                else
#endif
                {
                    canvas = go.AddComponent<CanvasGroup>();
                }
            }
#if UNITY_EDITOR
            if (!Application.isPlaying)
            {
                Undo.RecordObject(this, "Set Tween Target");
                tweenAnimationSettings.General.Target = canvas;
                EditorUtility.SetDirty(this);
                return;
            }
#endif
            tweenAnimationSettings.General.Target = canvas;
        }
    }

    #region Data Structures

    // Full settings for individual animations
    [System.Serializable]
    public class TweenAnimationSettings
    {
        public TweenGeneralSettings General = new TweenGeneralSettings();

        public TweenTimingSettings Timing;

        public TweenLoopSettings Loop;

        public TweenValueSettings Values = new TweenValueSettings();

        public TweenEventSettings Events = new TweenEventSettings();

        public float TotalDuration => TweenTimeline.ComputeTotalDuration(Timing, Loop, General.Duration);
    }

    [System.Serializable]
    public class TweenGeneralSettings
    {
        public UnityEngine.Object Target;
        public float Duration = 1f;
        public Ease Easing = Ease.Linear;
        public bool IsIgnoreTimeScale = false;

        [Tooltip("Euler only. Fast = shortest path (0→360 does not move!). " +
                 "FastBeyond360 = rotates the full requested degrees (e.g. 360, 720). " +
                 "LocalAxisAdd/WorldAxisAdd = additive rotation around local/world axes.")]
        [ShowIf("../../typeAnimation", EAnimation.Euler)]
        public RotateMode RotateMode = RotateMode.Fast;
    }

    [System.Serializable]
    public struct TweenTimingSettings
    {
        public float DelayStart;
        [ShowIf("../Loop.IsLoop", true)]
        public float TimeDelayPreLoop;
        [ShowIf("../Loop.IsLoop", true)]
        public float TimeDelayAfterLoop;
    }

    [System.Serializable]
    public struct TweenLoopSettings
    {
        public bool IsLoop;
        public LoopType LoopType;
        [Tooltip("-1 = infinite (only valid on a standalone animation or the OUTERMOST sequence — " +
                 "DOTween silently clamps infinite loops nested inside a Sequence to 1).")]
        public int LoopCount;
    }

    [System.Serializable]
    public class TweenValueSettings
    {
        [Tooltip(
            "Only relevant when OverrideFrom = true — controls WHEN the target snaps to the From value:\n\n" +
            "Eager: snap immediately when Show() is called (before DelayStart). " +
            "Use for popups that must sit at From (e.g. scale 0) while waiting for their delay/turn.\n\n" +
            "Lazy: snap right when the tween starts playing (after DelayStart / after previous Sequence entries).\n\n" +
            "When OverrideFrom = false, DOTween natively captures From at play time (always lazy), " +
            "so this setting has no effect.")]
        public EValueTiming Timing = EValueTiming.Eager;

        [Tooltip("If false, the animation starts from the target's current value (captured by DOTween when the tween starts playing). " +
                 "If true, the target snaps to the explicit From value below (see Timing for when).")]
        [ShowIf("../../SupportsValueOverride", true)]
        public bool OverrideFrom = false;

        [Tooltip("If false, To = the target's current value at Show() time (rare). " +
                 "If true, use the explicit To value below.")]
        [ShowIf("../../SupportsValueOverride", true)]
        public bool OverrideTo = true;

        [ShowIfAll("../../IsAnimationVector3", true, "OverrideFrom", true)]
        public Vector3 Vector3From;

        [ShowIfAll("../../IsAnimationVector3", true, "OverrideTo", true)]
        public Vector3 Vector3To;

        [ShowIfAll("../../IsAnimationFloat", true, "OverrideFrom", true)]
        public float FloatFrom;

        [ShowIfAll("../../IsAnimationFloat", true, "OverrideTo", true)]
        public float FloatTo;

        [ShowIfAll("../../typeAnimation", EAnimation.TextMeshProDOText, "OverrideFrom", true)]
        public string StringFrom = "";

        [ShowIfAll("../../typeAnimation", EAnimation.TextMeshProDOText, "OverrideTo", true)]
        public string StringTo = "";

        [ShowIf("../../typeAnimation", EAnimation.Float)]
        public UnityEvent<float> OnFloatUnityEventInvoke;
        [ShowIf("../../typeAnimation", EAnimation.UnityEvent)]
        public UnityEvent OnUnityEventInvoke;
    }

    [System.Serializable]
    public class TweenEventSettings
    {
        [Tooltip("Invoked when the timeline actually starts playing (after DelayStart).")]
        public UnityEvent OnTweenStart;

        [Tooltip("Invoked when the whole timeline completes (all loops finished). " +
                 "Never fires for infinite loops or when the animation is stopped/killed.")]
        public UnityEvent OnTweenComplete;

        // Callbacks are attached only when something is wired in the inspector — zero overhead otherwise.
        // Runtime AddListener users should subscribe on the Tween returned by Show() instead.
        public bool HasStart => OnTweenStart != null && OnTweenStart.GetPersistentEventCount() > 0;
        public bool HasComplete => OnTweenComplete != null && OnTweenComplete.GetPersistentEventCount() > 0;
    }

    /// <summary>
    /// When the target snaps to the From value (only used when OverrideFrom = true).
    /// </summary>
    public enum EValueTiming
    {
        /// <summary>At the moment Show() is called (before DelayStart). Good for standalone animations.</summary>
        Eager = 0,

        /// <summary>
        /// When the tween actually starts playing (after DelayStart / after previous Sequence entries).
        /// Good for Sequence children that must not touch the target until their turn.
        /// </summary>
        Lazy = 1,
    }

    public enum ETypeShow
    {
        None = 0,
        Awake = 1,
        Start = 2,
        OnEnable = 3,
    }

    public enum EAnimation
    {
        Move = 0,
        MoveLocal = 1,
        MoveAnchors = 2,
        Float = 3,
        Euler = 4,
        Scale = 5,
        SizeDelta = 6,
        AnchorMin = 7,
        AnchorMax = 8,
        FadeByCanvasGroup = 9,
        TextMeshProDOText = 10,
        UnityEvent = 11,
    }

    #endregion
}
