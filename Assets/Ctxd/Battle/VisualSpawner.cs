using UnityEngine;
using Ctxd.Battle.Sim;
using Ctxd.Data;
using Ctxd.Visual;

namespace Ctxd.Battle
{
    /// <summary>
    /// Spawns battle visuals by INSTANTIATING a prefab referenced by a ScriptableObject. Unit/floating-text refs are
    /// TYPED, so <c>Instantiate</c> returns the component directly — no runtime GetComponent (owner rule). A missing
    /// prefab ref is a content error (logged) — run <c>CTXD ▸ Forge ▸ Bake All Prefabs</c>.
    /// </summary>
    public static class VisualSpawner
    {
        public static UnitVisual SpawnUnit(UnitVisualDefinition visual, Faction faction, Transform parent)
        {
            var unit = visual != null ? visual.UnitFor(faction) : null;
            if (unit == null)
            {
                Debug.LogError($"[VisualSpawner] UnitVisualDefinition '{(visual != null ? visual.name : "<null>")}' has no " +
                               $"{(faction == Faction.Offense ? "attackUnit" : "defenseUnit")} — run CTXD ▸ Forge ▸ Bake All Prefabs.");
                return null;
            }
            return Object.Instantiate(unit, parent);
        }

        public static GameObject SpawnEffect(EffectVisualDefinition eff, Vector3 pos, Transform parent)
        {
            if (eff == null) return null;
            if (eff.prefab == null)
            {
                Debug.LogError($"[VisualSpawner] EffectVisualDefinition '{eff.name}' has no prefab — run CTXD ▸ Forge ▸ Bake All Prefabs.");
                return null;
            }
            var go = Object.Instantiate(eff.prefab, pos, Quaternion.identity);   // EffectVisual self-plays on OnEnable
            if (parent != null) go.transform.SetParent(parent, true);
            return go;
        }

        public static FloatingText SpawnFloatingText(FloatingText prefab, Vector3 pos, string text, Color color, bool big)
        {
            if (prefab == null)
            {
                Debug.LogError("[VisualSpawner] database.floatingText not assigned — run CTXD ▸ Forge ▸ Bake All Prefabs.");
                return null;
            }
            var ft = Object.Instantiate(prefab, pos, Quaternion.identity);
            if (big) ft.transform.localScale *= 1.5f;
            ft.Show(text, color);
            return ft;
        }
    }
}
