namespace Ctxd.Battle.Sim
{
    /// <summary>
    /// Unity-free description of a tactic (战法), built from a TacticDefinition SO. The resolver applies it
    /// via the <see cref="ITacticEffect"/> Strategy registered for <see cref="Kind"/> — add a new effect type
    /// by implementing ITacticEffect and registering it, no resolver change.
    /// </summary>
    public sealed class TacticSpec
    {
        public string Id, DisplayName;
        public TacticEffectKind Kind = TacticEffectKind.Damage;
        public int RowsHit = 1;
        public double Power = 1.0;
        public bool IsAwakening;        // 觉醒: unblockable / fixed / ignore stance
        public double FixedPower;
        public int ConfusionTurns = 1;
        public int PushbackTroops;
        public TacticProgram Program;   // non-null only when Kind == TacticEffectKind.Rule
        public string SkillAnimId, NameBannerId; // presentation refs (sim ignores)
    }
}
