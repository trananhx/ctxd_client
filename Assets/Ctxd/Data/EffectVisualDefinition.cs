using UnityEngine;

namespace Ctxd.Data
{
    /// <summary>One-shot effect visual (skill VFX, awaken flash, formation aura, anger burst). SO → prefab ref.</summary>
    [CreateAssetMenu(menuName = "CTXD/Visual/Effect Visual", fileName = "EffectVisual")]
    public sealed class EffectVisualDefinition : CtxdDefinition
    {
        public enum EffectKind { Skill, Arrow, Awaken, Formation, Anger, Misc }
        public EffectKind kind = EffectKind.Misc;
        public string sourceId;       // lookup slug, e.g. wushen, wujiangjuexing
        public GameObject prefab;     // optional baked prefab (auto-destroys); else the Resources fallback below is used
        public string resourcesPath;  // Resources frame folder when no prefab, e.g. sprite/eff/gjjl
        public float fps = 16f;
        public float scale = 1f;
        public float lifetime = 1.5f;
        [Tooltip("FX BỀN: lặp vô hạn, KHÔNG tự huỷ — vòng đời do server quyết (client diff ActiveEffects)")]
        public bool loopUntilRemoved = false;
    }
}
