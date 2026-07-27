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
        // [Stage 2A]
        public string NextTacticId;   // chiến pháp chuỗi kế (tra registry chiến pháp của runner)
        public bool Undodgeable;      // không thể bị né (như awakened)
        public bool GrantsLuanwu;     // cast xong → actor nhận Loạn Vũ (LuanwuTurns)
        // [Stage 2C]
        public Terrain? TerrainTag;   // biến thể gắn địa hình (null = không gắn); khớp State.Terrain → jiacheng bonus
        public double JiachengMult = 1.0;   // "gia thành": nhân sát thương khi dùng đúng biến thể địa hình
    }
}
