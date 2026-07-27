using UnityEngine;
using Ctxd.Battle.Sim;

namespace Ctxd.Data
{
    /// <summary>A general (武将): authored stats/troop/tactics/portrait → converted to a sim Combatant. GDD §4.</summary>
    [CreateAssetMenu(menuName = "CTXD/General", fileName = "General")]
    public sealed class GeneralDefinition : CtxdDefinition
    {
        [Header("Identity")]
        public string displayName;
        public GeneralQuality quality = GeneralQuality.Do;
        public Sprite portrait;   // sprite/tacticalGeneralPicMax

        [Header("Combat")]
        public TroopTypeDefinition troopType;
        public GeneralStats stats = new GeneralStats(500, 280, 480, 260, 75, 0.1);
        public int troopCapacity = 3800;
        [Range(4, 6)] public int rows = 4;

        [Header("Tactics")]
        public TacticDefinition skill1;
        public TacticDefinition skill2;

        [Header("Flags")]
        public bool canAwaken;
        public bool startAwakened;
        public bool fiveStar;

        [Header("Formation")]
        public FormationDefinition defaultFormation;

        [System.Serializable]
        public struct TerrainBonusEntry { public Ctxd.Battle.Sim.Terrain terrain; public double bonus; }   // qualify: tránh nhập nhằng UnityEngine.Terrain
        [Header("Thiên phú địa hình (RE) — % Lực chiến; City chỉ áp phe Công")]
        public TerrainBonusEntry[] terrainBonuses;

        public string DisplayNameOrName => string.IsNullOrEmpty(displayName) ? name : displayName;
        public UnitVisualDefinition UnitVisual => troopType != null ? troopType.unitVisual : null;

        public Combatant ToCombatant(Faction faction, string runtimeId)
        {
            var s = stats;
            if (defaultFormation != null) s = defaultFormation.Modify(s);
            var c = new Combatant
            {
                Id = runtimeId,
                DefId = Id,
                DisplayName = DisplayNameOrName,
                Faction = faction,
                Troop = troopType != null ? troopType.troopType : TroopType.ThuongBinh,
                Stats = s,
                MaxTroops = Mathf.Max(1, troopCapacity),
                Troops = Mathf.Max(1, troopCapacity),
                Skill1 = skill1 != null ? skill1.ToSpec() : null,
                Skill2 = skill2 != null ? skill2.ToSpec() : null,
                Awakened = startAwakened || (canAwaken && skill2 != null && skill2.isAwakening),
                FiveStar = fiveStar,
                Rows = rows,
                FormationId = defaultFormation != null ? defaultFormation.Id : null,
            };
            // [2E] vá drift SO: gán thiên phú địa hình (parity với đường JSON ScenarioLoader) — preview offline không mất thiên phú.
            if (terrainBonuses != null && terrainBonuses.Length > 0)
            {
                c.TerrainBonus = new System.Collections.Generic.Dictionary<int, double>();
                foreach (var tb in terrainBonuses) c.TerrainBonus[(int)tb.terrain] = tb.bonus;
            }
            return c;
        }
    }
}
