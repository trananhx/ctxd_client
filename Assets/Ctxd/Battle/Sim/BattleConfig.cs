namespace Ctxd.Battle.Sim
{
    /// <summary>All battle tuning knobs (many GDD values are ❓ → designer-tunable here / mirrored by an SO).</summary>
    [System.Serializable]
    public sealed class BattleConfig
    {
        public double StanceAdvantageMult = 1.5, StanceDisadvantageMult = 0.7;
        public int MoraleStart = 50, MoraleFull = 100;
        public int MoraleOnDealDamage = 12, MoraleOnTakeDamage = 8, MoraleOnKillGeneral = 30, MoraleAfterTacticReset = 0;
        public double CritMult = 2.0, FrenzyMult = 1.5;
        public double CritChance = 0.15, FrenzyChance = 0.20, ResilienceTacticMult = 0.5;
        public int SoldiersPerGroup = 6, GroupsPerRow = 3, RowsMin = 4;
        public double DamageVariance = 0.1, BaseDamageScale = 1.0;
        public double TerrainAffinityBonus = 0.25, TroopCounterBonus = 0.20;
        public int MaxRounds = 80;

        public BattleConfig Clone() => (BattleConfig)MemberwiseClone();
    }
}
