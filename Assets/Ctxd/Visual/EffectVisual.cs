using UnityEngine;

namespace Ctxd.Visual
{
    /// <summary>
    /// An effect prefab's own component. Two lifetimes (feedback #1/#5):
    /// <list type="bullet">
    /// <item>one-shot (default): plays once and self-destroys after <see cref="lifetime"/> seconds;</item>
    /// <item><see cref="loop"/>: loops forever and NEVER self-destroys — the owner (server-driven
    /// <c>BattleSideField.SyncActiveEffects</c>) destroys it when the server removes the effect.</item>
    /// </list>
    /// Self-destroy is scheduled with <c>Invoke</c> (cancelable) rather than delayed <c>Destroy</c> (not cancelable),
    /// so <see cref="Configure"/> can retune lifetime/loop AFTER Instantiate already ran OnEnable→Play.
    /// </summary>
    [DisallowMultipleComponent]
    public sealed class EffectVisual : MonoBehaviour
    {
        public SpriteRenderer spriteRenderer;
        public Animator animator;
        public SpriteFramePlayer framePlayer;
        public float lifetime = 1.5f;
        public bool loop = false;   // FX bền: lặp, client-owned lifetime (set từ EffectVisualDefinition.loopUntilRemoved)

        private void OnEnable() => Play();

        public void Play()
        {
            // spriteRenderer/animator are wired in the prefab by AssetForge — no runtime GetComponent.
            if (animator != null && animator.runtimeAnimatorController != null) animator.Play(0, 0, 0f);
            else if (framePlayer != null)
            {
                if (loop) { framePlayer.loop = true; framePlayer.destroyOnFinish = false; }
                framePlayer.Play();
            }

            CancelInvoke(nameof(SelfDestroy));
            if (!loop && lifetime > 0f) Invoke(nameof(SelfDestroy), lifetime);
        }

        /// <summary>Re-configure AFTER Instantiate (OnEnable already played): switch to loop and/or override lifetime.</summary>
        public void Configure(bool loopMode, float lifetimeOverride = -1f)
        {
            loop = loopMode;
            if (lifetimeOverride >= 0f) lifetime = lifetimeOverride;
            Play();
        }

        /// <summary>Owner-driven removal for looping FX (server dropped the effect from ActiveEffects).</summary>
        public void StopAndDestroy()
        {
            CancelInvoke(nameof(SelfDestroy));
            if (framePlayer != null) framePlayer.Stop();
            Destroy(gameObject);
        }

        private void SelfDestroy() => Destroy(gameObject);
    }
}
