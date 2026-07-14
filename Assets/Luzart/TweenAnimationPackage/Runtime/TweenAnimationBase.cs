using DG.Tweening;
using UnityEngine;

namespace Luzart.Tweener
{
    /// <summary>
    /// Base MonoBehaviour for all tween-animation components (single tween or sequence).
    /// </summary>
    public abstract class TweenAnimationBase : MonoBehaviour
    {
        /// <summary>
        /// Builds and plays the timeline, returning its root tween.
        /// Calling Show() while a previous timeline is still running kills the old one first.
        /// </summary>
        public abstract Tween Show();

        /// <summary>
        /// Kills the current timeline in place — no snap to end values, no OnComplete fired.
        /// </summary>
        public abstract void Stop();

        /// <summary>
        /// Total timeline length: DelayStart + LoopCount × (PreLoop + duration + AfterLoop).
        /// Returns float.MaxValue for infinite loops.
        /// </summary>
        public abstract float GetTotalDuration();

        /// <summary>
        /// Called by SequenceTweenAnimation right after this animation's root tween was nested
        /// into the parent sequence. Ownership transfers to the parent: DOTween silently ignores
        /// Kill() on nested tweens, so the component must drop its reference instead of holding
        /// a root it can no longer control.
        /// </summary>
        public virtual void OnRootNestedIntoSequence() { }

        protected virtual void OnDestroy()
        {
            Stop();
        }
    }
}
