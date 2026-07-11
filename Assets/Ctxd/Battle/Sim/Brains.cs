namespace Ctxd.Battle.Sim
{
    /// <summary>Default AI: counter-predicts the enemy's last stance, else deterministic-random; awakens when able.</summary>
    public sealed class AutoBrain : IBattleBrain
    {
        public TurnInput Decide(BattleState state, Faction side, DeterministicRng rng)
        {
            var me = state.Active(side);
            var enemy = state.Active(side == Faction.Offense ? Faction.Defense : Faction.Offense);
            Stance stance = (enemy != null && enemy.HasLastStance && rng.Chance(0.65))
                ? StanceRules.Counter(enemy.LastStance)
                : (Stance)rng.Range(0, 3);
            bool awaken = me != null && me.Awakened && me.Morale >= 100 && me.Skill2 != null && !me.Confused;
            return new TurnInput(stance, awaken);
        }
    }

    public sealed class FixedBrain : IBattleBrain
    {
        private readonly TurnInput _input;
        public FixedBrain(Stance stance, bool awaken = false) => _input = new TurnInput(stance, awaken);
        public TurnInput Decide(BattleState state, Faction side, DeterministicRng rng) => _input;
    }
}
