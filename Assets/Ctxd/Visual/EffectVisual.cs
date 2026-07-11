using UnityEngine;

namespace Ctxd.Visual
{
    /// <summary>An effect prefab's own component: plays its sequence once and auto-destroys. (Plain MonoBehaviour.)</summary>
    [DisallowMultipleComponent]
    public sealed class EffectVisual : MonoBehaviour
    {
        public SpriteRenderer spriteRenderer;
        public Animator animator;
        public SpriteFramePlayer framePlayer;
        public float lifetime = 1.5f;

        private void OnEnable() => Play();

        public void Play()
        {
            // spriteRenderer/animator are wired in the prefab by AssetForge — no runtime GetComponent.
            if (animator != null && animator.runtimeAnimatorController != null) animator.Play(0, 0, 0f);
            else if (framePlayer != null) framePlayer.Play();

            if (lifetime > 0f) Destroy(gameObject, lifetime);
        }
    }
}
