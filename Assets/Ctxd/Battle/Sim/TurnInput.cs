namespace Ctxd.Battle.Sim
{
    /// <summary>One side's decision for a round: a stance, optionally pressing Giác (觉醒) to awaken.</summary>
    public struct TurnInput
    {
        public Stance Stance;
        public bool Awaken;
        public TurnInput(Stance stance, bool awaken = false) { Stance = stance; Awaken = awaken; }
    }

    /// <summary>Strategy for choosing a side's input each round (AI / scripted / player playback).</summary>
    public interface IBattleBrain
    {
        TurnInput Decide(BattleState state, Faction side, DeterministicRng rng);
    }
}
