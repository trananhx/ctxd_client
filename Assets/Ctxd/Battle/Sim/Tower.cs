namespace Ctxd.Battle.Sim
{
    /// <summary>[Stage 2E] Trụ tên phòng thủ trận công thành (report 26/32/33/35).
    /// Bắn phe Công định kỳ; phe Công phá dần độ bền mỗi hiệp cho tới khi trụ sập.</summary>
    public sealed class Tower
    {
        public int Blood, MaxBlood;
        public int AttackPeriod = 3;     // bắn mỗi N hiệp
        public int NextAttackRound;      // hiệp kế trụ bắn
        public int ShootPower = 400;     // sát thương mỗi phát vào hàng đầu phe Công
        public bool Alive => Blood > 0;
    }
}
