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
            Assert.Equal(FxAnchorKind.UnderFoot, offFx.Anchor);                         // MỘT dải ở hàng đầu (chỉ đạo 2026-08-07)
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

        // ── [Pool FX theo PHA] server khai báo FX thuộc pha nào của lượt; client render đúng thời điểm ──

        [Fact]
        public void Stance_Fx_Is_PreTurn_Phase_And_Survives_Wire()
        {
            var r = Runner();
            r.StepRound(new TurnInput(Stance.TanCong));

            var fx = r.State.Offense.Effects.Find(e => e.FxId == "stance_tancong");
            Assert.Equal(FxPhase.PreTurn, fx.Phase);                       // thế trận = pha TRƯỚC lượt

            var back = Wire.Deserialize<BattleSnapshot>(Wire.Serialize(BattleSnapshot.From(r.State)));
            Assert.Equal(FxPhase.PreTurn, back.Offense.Effects.Find(e => e.FxId == "stance_tancong").Phase);
        }

        [Fact]
        public void Ordinary_Effects_Default_To_PostTurn_And_Wire_Omits_Zero()
        {
            var s = new SideState { Faction = Faction.Offense };
            s.AddOrRefreshEffect("buff", 3);
            Assert.Equal(FxPhase.PostTurn, s.Effects[0].Phase);            // mặc định = pha SAU lượt (hành vi cũ)

            var state = new BattleState { Offense = s, Defense = new SideState { Faction = Faction.Defense } };
            string json = Wire.Serialize(BattleSnapshot.From(state));
            Assert.DoesNotContain("\"Phase\"", json);                      // default 0 → wire omit (0-drift)
        }

        [Fact]
        public void StepRound_Emits_PreTurnFx_Event_Before_The_Clash()
        {
            var r = Runner();
            var ev = r.StepRound(new TurnInput(Stance.DotKich));

            int preOff = ev.FindIndex(e => e.Type == BattleEventType.PreTurnFx && e.Side == Faction.Offense);
            int preDef = ev.FindIndex(e => e.Type == BattleEventType.PreTurnFx && e.Side == Faction.Defense);
            int clash = ev.FindIndex(e => e.Type == BattleEventType.StanceClash);
            Assert.True(preOff >= 0 && preDef >= 0);                       // mỗi phe một event pool PreTurn
            Assert.True(preOff < clash && preDef < clash);                 // đứng TRƯỚC diễn biến đánh

            var offFx = ev[preOff].Effects;
            Assert.NotNull(offFx);
            Assert.Contains(offFx, e => e.FxId == "stance_dotkich");       // client render thẳng từ data này
            // wire round-trip event mang danh sách FX
            var back = Wire.Deserialize<BattleEvent>(Wire.Serialize(ev[preOff]));
            Assert.Contains(back.Effects, e => e.FxId == "stance_dotkich");
        }
    }
}
