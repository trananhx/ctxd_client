using UnityEngine;
using Ctxd.Battle.Sim;
using Ctxd.Visual;

namespace Ctxd.Data
{
    /// <summary>
    /// Owner's pattern: an SO that holds the spawnable UNIT prefab refs (typed as <see cref="UnitVisual"/> so
    /// <c>Instantiate(unit)</c> returns the component directly — no runtime GetComponent). The prefab carries its
    /// own visual code; to change the look, edit the prefab. Baked + wired by AssetForge.
    /// Source frames: Assets/Resources/sprite/army/{att,def}/&lt;facing&gt;_&lt;unitId&gt;/&lt;action&gt;/&lt;frame&gt;.png
    /// </summary>
    [CreateAssetMenu(menuName = "CTXD/Visual/Unit Visual", fileName = "UnitVisual")]
    public sealed class UnitVisualDefinition : CtxdDefinition
    {
        public string unitId;             // army sprite id, e.g. 10, 31, 102
        public UnitVisual attackUnit;     // Offense (att) prefab's UnitVisual component
        public UnitVisual defenseUnit;    // Defense (def) prefab's UnitVisual component
        public float pixelsPerUnit = 100f;

        public UnitVisual UnitFor(Faction faction) => faction == Faction.Offense ? attackUnit : defenseUnit;
    }
}
