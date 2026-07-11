using System;
using UnityEngine;
using Ctxd.Battle.Sim;

namespace Ctxd.Data
{
    /// <summary>
    /// Data-driven formation (阵法): row layout + situational shapes + stat bonuses + a formation VFX.
    /// Owner wants MANY formations, bound to generals, shapes changing by situation. GDD §6.
    /// </summary>
    [CreateAssetMenu(menuName = "CTXD/Formation", fileName = "Formation")]
    public sealed class FormationDefinition : CtxdDefinition
    {
        [Serializable]
        public struct FormationRow
        {
            public RowShape defaultShape;   // shape when not engaged
            public RowShape engagedShape;   // shape when front row engaged (e.g. Arc / cánh cung)
            public Vector2 anchor;          // local offset from side origin
            [Range(1, 5)] public int groups;
        }

        public string displayName;
        public FormationRow[] rows = new FormationRow[0];

        [Header("Bonuses")]
        public float normalAtkMult = 1f, normalDefMult = 1f, tacticAtkMult = 1f, tacticDefMult = 1f;

        [Header("Affinity")]
        public TroopType[] favouredTroops;
        public EffectVisualDefinition formationEffect;

        public int RowCount => rows != null ? rows.Length : 0;

        public GeneralStats Modify(GeneralStats s)
        {
            s.NormalAtk *= normalAtkMult; s.NormalDef *= normalDefMult;
            s.TacticAtk *= tacticAtkMult; s.TacticDef *= tacticDefMult;
            return s;
        }
    }
}
