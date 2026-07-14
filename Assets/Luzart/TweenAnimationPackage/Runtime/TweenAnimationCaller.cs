using DG.Tweening;
using UnityEngine;

namespace Luzart.Tweener
{
    /// <summary>
    /// Auto-trigger for any TweenAnimationBase: plays on Awake / Start / OnEnable and
    /// kills the running timeline on OnDisable, tying the tween lifetime to the GameObject.
    /// </summary>
    public class TweenAnimationCaller : MonoBehaviour
    {
        [Header("Animation Reference")]
        [SerializeField] private TweenAnimationBase tweenAnimation;

        [Header("Trigger Settings")]
        [SerializeField] private ETypeShow typeShow = ETypeShow.OnEnable;

        private Tween _currentTween;
        private TweenCallback _clearCurrent;

        private void Awake()
        {
            // Unity runs Awake → OnEnable back-to-back in one activation, so OnEnable must NOT
            // kill unconditionally — it would destroy the tween Awake just started.
            if (typeShow == ETypeShow.Awake)
            {
                CallShow();
            }
        }

        private void Start()
        {
            if (typeShow == ETypeShow.Start)
            {
                CallShow();
            }
        }

        private void OnEnable()
        {
            if (typeShow == ETypeShow.OnEnable)
            {
                CallShow();
            }
        }

        private void OnDisable()
        {
            Stop();
        }

        private void Reset()
        {
            if (tweenAnimation == null)
            {
                tweenAnimation = GetComponent<TweenAnimationBase>();
            }
        }

        /// <summary>
        /// Manually trigger the animation. Kills the previous run if it is still playing.
        /// </summary>
        [ContextMenu("Call Show")]
        public void CallShow()
        {
            if (tweenAnimation == null)
            {
                Debug.LogWarning($"TweenAnimationCaller: TweenAnimation is null on {gameObject.name}", this);
                return;
            }

            try
            {
                Stop();
                _currentTween = tweenAnimation.Show();
                if (_currentTween != null)
                {
                    _clearCurrent ??= ClearCurrentIfDead;
                    _currentTween.OnKill(_clearCurrent); // fires on kill AND after complete (autoKill)
                }
            }
            catch (System.Exception e)
            {
                Debug.LogException(e, this);
            }
        }

        private void ClearCurrentIfDead()
        {
            // DOTween defers onKill to end-of-update when the kill happens inside the update loop,
            // so this callback can arrive from a PREVIOUS tween after a re-triggered CallShow has
            // already assigned a fresh one — only clear when the current tween is actually dead.
            if (_currentTween != null && !_currentTween.IsActive())
            {
                _currentTween = null;
            }
        }

        /// <summary>
        /// Stop the current animation in place (no snap to end, no OnComplete).
        /// </summary>
        public void Stop()
        {
            if (_currentTween != null)
            {
                if (_currentTween.IsActive())
                {
                    _currentTween.Kill();
                }
                _currentTween = null;
            }
        }

        /// <summary>
        /// Check if animation is currently playing
        /// </summary>
        public bool IsPlaying()
        {
            return _currentTween != null && _currentTween.IsActive();
        }

        /// <summary>
        /// Set new animation target at runtime
        /// </summary>
        public void SetTweenAnimation(TweenAnimationBase newAnimation)
        {
            Stop();
            tweenAnimation = newAnimation;
        }
    }
}
