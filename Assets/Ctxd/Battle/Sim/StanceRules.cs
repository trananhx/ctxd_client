namespace Ctxd.Battle.Sim
{
    /// <summary>Stance triangle (GDD §3.2): 突击 › 攻击 › 防守 › 突击.</summary>
    public static class StanceRules
    {
        public static bool Beats(Stance a, Stance b)
            => (a == Stance.DotKich && b == Stance.TanCong)
            || (a == Stance.TanCong && b == Stance.PhongThu)
            || (a == Stance.PhongThu && b == Stance.DotKich);

        /// <summary>+1 if a wins, -1 if b wins, 0 tie.</summary>
        public static int Compare(Stance a, Stance b) => a == b ? 0 : (Beats(a, b) ? 1 : -1);

        public static Stance Counter(Stance s) => s switch
        {
            Stance.TanCong => Stance.DotKich,
            Stance.PhongThu => Stance.TanCong,
            _ => Stance.PhongThu,
        };
    }
}
