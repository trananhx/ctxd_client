using UnityEngine;
using Ctxd.Battle.Sim;

namespace Ctxd.Data
{
    /// <summary>SO wrapper around the sim's <see cref="BattleConfig"/> tuning block.</summary>
    [CreateAssetMenu(menuName = "CTXD/Battle Config", fileName = "BattleConfig")]
    public sealed class BattleConfigDefinition : CtxdDefinition
    {
        public float stanceAdvantageMult = 1.5f, stanceDisadvantageMult = 0.7f;
        public int moraleStart = 50, moraleFull = 100;
        public int moraleOnDealDamage = 12, moraleOnTakeDamage = 8, moraleOnKillGeneral = 30, moraleAfterTacticReset = 0;
        public float critMult = 2.0f, frenzyMult = 1.5f;
        [Range(0, 1)] public float critChance = 0.15f, frenzyChance = 0.20f, resilienceTacticMult = 0.5f;
        public int soldiersPerGroup = 6, groupsPerRow = 3, rowsMin = 4;
        [Range(0, 0.5f)] public float damageVariance = 0.1f;
        public float baseDamageScale = 1.0f;
        public float terrainAffinityBonus = 0.25f, troopCounterBonus = 0.20f;
        public int maxRounds = 80;

        public BattleConfig ToConfig() => new BattleConfig
        {
            StanceAdvantageMult = stanceAdvantageMult, StanceDisadvantageMult = stanceDisadvantageMult,
            MoraleStart = moraleStart, MoraleFull = moraleFull,
            MoraleOnDealDamage = moraleOnDealDamage, MoraleOnTakeDamage = moraleOnTakeDamage,
            MoraleOnKillGeneral = moraleOnKillGeneral, MoraleAfterTacticReset = moraleAfterTacticReset,
            CritMult = critMult, FrenzyMult = frenzyMult,
            CritChance = critChance, FrenzyChance = frenzyChance, ResilienceTacticMult = resilienceTacticMult,
            SoldiersPerGroup = soldiersPerGroup, GroupsPerRow = groupsPerRow, RowsMin = rowsMin,
            DamageVariance = damageVariance, BaseDamageScale = baseDamageScale,
            TerrainAffinityBonus = terrainAffinityBonus, TroopCounterBonus = troopCounterBonus,
            MaxRounds = maxRounds,
        };
    }
}
