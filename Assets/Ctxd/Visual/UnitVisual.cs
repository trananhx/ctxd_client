using UnityEngine;

namespace Ctxd.Visual
{
    public enum UnitAction { Idle, Move, Attack, Hurt, Die }

    /// <summary>
    /// The army-unit prefab's own visual component (plain MonoBehaviour — NOT a shared view base). Plays the
    /// baked frame-by-frame Unity AnimationClips via the Animator; falls back to <see cref="SpriteFramePlayer"/>
    /// (Resources frames) when no controller is baked. The presenter just calls Play(action) — no data contract.
    /// </summary>
    [DisallowMultipleComponent]
    public sealed class UnitVisual : MonoBehaviour
    {
        public SpriteRenderer spriteRenderer;
        public Animator animator;
        public SpriteFramePlayer framePlayer;
        public string resourcesBasePath;   // e.g. sprite/army/att/att_10 (fallback)
        public float frameFps = 12f;
        public int baseSortingOrder;
        public Color fallbackTint = Color.white;   // shown only if no sprite art is found, so a unit is never invisible

        private static Sprite _fallbackSprite;

        public UnitAction Current { get; private set; } = UnitAction.Idle;

        // spriteRenderer/animator are wired in the prefab by AssetForge — no runtime GetComponent lookups.

        public void SetSortingOrder(int order) { if (spriteRenderer != null) spriteRenderer.sortingOrder = order; }

        public void Play(UnitAction action)
        {
            Current = action;
            // Live check (works in edit-mode Instantiate too); animator is the prefab's wired reference.
            if (animator != null && animator.runtimeAnimatorController != null) { animator.Play(StateName(action), 0, 0f); return; }
            if (framePlayer == null) { ShowFallback(); return; }

            bool loop = action == UnitAction.Idle || action == UnitAction.Move;
            if (!string.IsNullOrEmpty(resourcesBasePath))
            {
                framePlayer.LoadFromResources($"{resourcesBasePath}/{Folder(action)}", frameFps, loop);
                // Missing art for this action? fall back to the Idle frames so the unit still shows a pose.
                if (framePlayer.FrameCount == 0 && action != UnitAction.Idle)
                    framePlayer.LoadFromResources($"{resourcesBasePath}/{Folder(UnitAction.Idle)}", frameFps, true);
            }
            if (framePlayer.FrameCount == 0) { ShowFallback(); return; }   // no art at all → visible tinted mark

            if (spriteRenderer != null) spriteRenderer.color = Color.white;
            framePlayer.loop = loop;
            framePlayer.Play();
        }

        /// <summary>Last-resort visible mark so a unit is never invisible when its sprite folder is missing.</summary>
        private void ShowFallback()
        {
            if (spriteRenderer == null) return;
            framePlayer?.Stop();
            spriteRenderer.sprite = FallbackSprite();
            spriteRenderer.color = fallbackTint;
        }

        private static Sprite FallbackSprite()
        {
            if (_fallbackSprite != null) return _fallbackSprite;
            var tex = new Texture2D(8, 12, TextureFormat.RGBA32, false) { filterMode = FilterMode.Point };
            var px = new Color32[8 * 12];
            for (int i = 0; i < px.Length; i++) px[i] = new Color32(255, 255, 255, 255);
            tex.SetPixels32(px); tex.Apply();
            _fallbackSprite = Sprite.Create(tex, new Rect(0, 0, 8, 12), new Vector2(0.5f, 0f), 100f);
            _fallbackSprite.name = "UnitFallback";
            return _fallbackSprite;
        }

        public void PlayIdle() => Play(UnitAction.Idle);
        public void PlayAttack() => Play(UnitAction.Attack);
        public void PlayHurt() => Play(UnitAction.Hurt);
        public void PlayDie() => Play(UnitAction.Die);

        public static string StateName(UnitAction a) => a switch
        {
            UnitAction.Move => "Move", UnitAction.Attack => "Attack",
            UnitAction.Hurt => "Hurt", UnitAction.Die => "Die", _ => "Idle",
        };

        public static int Folder(UnitAction a) => a switch
        {
            UnitAction.Idle => 1, UnitAction.Move => 2, UnitAction.Attack => 3,
            UnitAction.Hurt => 4, UnitAction.Die => 5, _ => 1,
        };
    }
}
