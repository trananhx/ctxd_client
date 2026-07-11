using UnityEngine;
using Ctxd.Battle.Sim;
using Terrain = Ctxd.Battle.Sim.Terrain;

namespace Ctxd.Data
{
    /// <summary>A troop type (兵种) → its on-field unit visual + flavour. Generals reference one (GDD §5).</summary>
    [CreateAssetMenu(menuName = "CTXD/Troop Type", fileName = "TroopType")]
    public sealed class TroopTypeDefinition : CtxdDefinition
    {
        public TroopType troopType = TroopType.ThuongBinh;
        public string displayName = "枪兵 / Thương binh";
        [TextArea] public string role;
        public UnitVisualDefinition unitVisual;
        public Terrain[] favouredTerrain;
        public Sprite icon;
    }
}
