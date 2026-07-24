using UnityEngine;

namespace Ctxd.Battle
{
    /// <summary>Marker on a group's anchor so a click raycast can identify which (field,row,group) was hit.</summary>
    public sealed class GroupClickTarget : MonoBehaviour
    {
        public BattleSideField field;
        public int rowIndex, groupIndex;
    }
}
