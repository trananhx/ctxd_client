namespace Ctxd.Battle.Sim
{
    /// <summary>5 combat stats (GDD §3.5): 普通攻击/普通防御/战法攻击/战法防御/计策 + 韧性 (resilience).</summary>
    [System.Serializable]
    public struct GeneralStats
    {
        public double NormalAtk, NormalDef, TacticAtk, TacticDef, Strategy, Resilience;

        public GeneralStats(double nAtk, double nDef, double tAtk, double tDef, double strat, double resil = 0)
        {
            NormalAtk = nAtk; NormalDef = nDef; TacticAtk = tAtk; TacticDef = tDef; Strategy = strat; Resilience = resil;
        }
    }
}
