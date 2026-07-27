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

        // Optional structured addressing (additive; wire ignores absent/default via NullValueHandling).
        public int RowIndex = -1;
        public int GroupIndex = -1;
        public TroopType Troop;
        public int SoldiersKilled;

        // [Stage 2A] né / phản-giữ / chuỗi chiến pháp (append — wire bỏ qua default).
        public bool Miss;                              // report3 'ms': đòn bị NÉ → dmg 0
        public int BeHold;                             // report14 beHold 0-3: 0=hiệu lực,1=đỡ,2/3=phản (chiến pháp bị hoá giải)
        public int ChainDepth;                         // mắt xích trong chuỗi (0=gốc)
        public string NextTacticId, NextTacticName;    // chiến pháp chuỗi kế

        // [Stage 2C] report27 (bảng chọn biến thể chiến pháp theo địa hình)
        public string VariantId1, VariantId2, VariantId3;
        public int VariantRecommend = -1;              // index 1-3 biến thể server gợi ý (khớp địa hình)
        public bool StrategyUseAble;                   // nút nộ khả dụng lượt này

        public override string ToString()
            => $"[R{Round}] {Type} {Side} {ActorId}->{TargetId} amt={Amount:0} {(Crit ? "CRIT " : "")}{(Miss ? "MISS " : "")}{Text}".Trim();
    }
}
