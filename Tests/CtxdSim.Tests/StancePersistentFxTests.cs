using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>
    /// FX thế trận BỀN (yêu cầu chủ dự án 2026-08-05): bấm Tấn Công/Phòng Thủ/Đột Kích → FX hiện MÃI
    /// (UntilRemoved) cho tới khi ĐỔI thế khác (fx cũ bị thay) hoặc server chủ động gỡ — KHÔNG tự tắt theo lượt.
    /// Server ghi stance thành ActiveEffect "stance_*" trên SideState; client render qua đường FX bền sẵn có.
    /// </summary>
    public class StancePersistentFxTests
    {
        static BattleRunner Runner()
        {
            var setup = new BattleSetup { Seed = 1, Terrain = Terrain.Plain };
            setup.OffenseLineup.Add(new GeneralDto { Id = "off", Troop = "KyBinh", TroopCapacity = 12000 }.ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(new GeneralDto { Id = "def", Troop = "KyBinh", TroopCapacity = 12000 }.ToCombatant(Faction.Defense, "def0"));
            var r = new BattleRunner(setup);
            r.Begin();
            return r;
        }

        [Fact]
        public void StepRound_Registers_UntilRemoved_Stance_Fx_On_Both_Sides()
        {
            var r = Runner();
            r.StepRound(new TurnInput(Stance.TanCong));

            var offFx = r.State.Offense.Effects.Find(e => e.FxId == "stance_tancong");
            Assert.NotNull(offFx);
            Assert.True(offFx.UntilRemoved);                                            // KHÔNG hết hạn theo hiệp
            Assert.Contains(r.State.Defense.Effects, e => e.FxId.StartsWith("stance_"));// phe thủ (AI) cũng có thế trận
        }

        [Fact]
        public void Same_Stance_Over_Rounds_Keeps_Single_Fx()
        {
            var r = Runner();
            r.StepRound(new TurnInput(Stance.PhongThu));
            r.StepRound(new TurnInput(Stance.PhongThu));
            r.StepRound(new TurnInput(Stance.PhongThu));

            Assert.Single(r.State.Offense.Effects.FindAll(e => e.FxId.StartsWith("stance_")));   // không nhân đôi
            Assert.Contains(r.State.Offense.Effects, e => e.FxId == "stance_phongthu");          // vẫn còn sau 3 hiệp
        }

        [Fact]
        public void Changing_Stance_Swaps_Fx_And_Leaves_Other_Effects_Alone()
        {
            var r = Runner();
            r.State.Offense.AddOrRefreshEffect("burn", 5);       // FX thường khác prefix — không được đụng

            r.StepRound(new TurnInput(Stance.TanCong));
            Assert.Contains(r.State.Offense.Effects, e => e.FxId == "stance_tancong");

            r.StepRound(new TurnInput(Stance.DotKich));
            Assert.DoesNotContain(r.State.Offense.Effects, e => e.FxId == "stance_tancong");   // thế cũ bị thay
            Assert.Contains(r.State.Offense.Effects, e => e.FxId == "stance_dotkich");         // thế mới vào
            Assert.Contains(r.State.Offense.Effects, e => e.FxId == "burn");                   // FX thường còn nguyên
        }

        [Fact]
        public void Stance_Fx_Projects_Through_Snapshot_Wire()
        {
            var r = Runner();
            r.StepRound(new TurnInput(Stance.DotKich));

            var back = Wire.Deserialize<BattleSnapshot>(Wire.Serialize(BattleSnapshot.From(r.State)));
            Assert.Contains(back.Offense.Effects, e => e.FxId == "stance_dotkich");
            Assert.True(back.Offense.Effects.Find(e => e.FxId == "stance_dotkich").RemainingRounds < 0);
        }
    }
}
