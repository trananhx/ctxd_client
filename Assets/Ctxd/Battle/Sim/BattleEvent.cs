namespace Ctxd.Battle.Sim
{
    /// <summary>One record in the battle event log. Client plays these back; it never recomputes numbers.</summary>
    public sealed class BattleEvent
    {
        public int Round;
        public BattleEventType Type;
        public Faction Side;
        public string ActorId, TargetId;
        public Stance Stance, TargetStance;
        public double Amount;
        public TacticEffectKind Effect;
        public string TacticId, TacticName;
        public bool Crit, Awakened;
        public int ActorTroopsAfter, TargetTroopsAfter, ActorMoraleAfter;
        public int Exp;     // EXP granted on a kill (UnitKilled / ExpPopup) — drives the exp pop-up in the screenshot.
        public int Count;   // units added (UnitAdded) / rows killed (KillRow).
        public string Text;
        public BattleOutcome Outcome;

        public override string ToString()
            => $"[R{Round}] {Type} {Side} {ActorId}->{TargetId} amt={Amount:0} {(Crit ? "CRIT " : "")}{Text}".Trim();
    }
}
