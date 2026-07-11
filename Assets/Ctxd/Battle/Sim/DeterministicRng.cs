namespace Ctxd.Battle.Sim
{
    /// <summary>Seeded xorshift64 — deterministic across platforms (System.Random isn't), for replayable battles.</summary>
    public sealed class DeterministicRng
    {
        private ulong _state;
        public DeterministicRng(ulong seed) => _state = seed == 0 ? 0x9E3779B97F4A7C15UL : seed;

        public ulong NextULong() { ulong x = _state; x ^= x << 13; x ^= x >> 7; x ^= x << 17; _state = x; return x; }
        public double NextDouble() => (NextULong() >> 11) * (1.0 / 9007199254740992.0);
        public double Range(double min, double max) => min + NextDouble() * (max - min);
        public int Range(int minInc, int maxExc) => maxExc <= minInc ? minInc : minInc + (int)(NextDouble() * (maxExc - minInc));
        public bool Chance(double p) => NextDouble() < p;
    }
}
