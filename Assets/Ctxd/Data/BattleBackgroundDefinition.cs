using UnityEngine;
using Terrain = Ctxd.Battle.Sim.Terrain;

namespace Ctxd.Data
{
    /// <summary>A battle background (sprite/warBG, 1280×774) + the terrain it represents.</summary>
    [CreateAssetMenu(menuName = "CTXD/Battle Background", fileName = "BattleBackground")]
    public sealed class BattleBackgroundDefinition : CtxdDefinition
    {
        public Sprite background;
        public Terrain terrain = Terrain.Plain;
        [TextArea] public string note;
    }
}
