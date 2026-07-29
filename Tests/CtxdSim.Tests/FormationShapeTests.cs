using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>[G1/G2] Thế cánh cung (RowShape trên style) + số hàng diễn đánh (EngageRows) — server config, client render.</summary>
    public class FormationShapeTests
    {
        static GeneralDto Archer() => new GeneralDto
        {
            Id = "archer", DisplayName = "Cung Thủ", Troop = "CungBinh", TroopCapacity = 18000,
            Rows = 3, RowShape = "CanhCung", EngageRows = 2,
        };

        [Fact]
        public void RowShape_Config_Marks_Every_Row_CanhCung()
        {
            var setup = new BattleSetup { Seed = 1 };
            setup.OffenseLineup.Add(Archer().ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(new GeneralDto { Id = "d", Troop = "BoBinh", TroopCapacity = 9000 }.ToCombatant(Faction.Defense, "def0"));
            var r = new BattleRunner(setup); r.Begin();

            var c = setup.OffenseLineup[0];
            Assert.True(c.Formation.Count > 0);
            foreach (var row in c.Formation) Assert.Equal(RowShape.CanhCung, row.Shape);   // mọi hàng mang cờ; client chỉ uốn hàng đầu

            // ra tới wire + round-trip
            var snap = BattleSnapshot.From(r.State);
            var back = Wire.Deserialize<BattleSnapshot>(Wire.Serialize(snap));
            Assert.Equal(RowShape.CanhCung, back.Offense.Queue[0].Formation[0].Shape);
            Assert.Equal(2, back.Offense.Queue[0].EngageRows);
        }

        [Fact]
        public void Phantom_Keeps_RowShape_And_EngageRows()
        {
            var setup = new BattleSetup { Seed = 1 };
            setup.OffenseLineup.Add(new GeneralDto { Id = "h", Troop = "KyBinh", TroopCapacity = 9000 }.ToCombatant(Faction.Offense, "off0"));
            setup.DefenseLineup.Add(Archer().ToCombatant(Faction.Defense, "def0"));
            var session = new BattleSession(setup); session.Begin();
            session.CopyArmy(Faction.Defense, PhantomKind.Normal, 1);

            var phantom = session.Snapshot().Defense.Queue.Find(c => c.Id != "def0" && c.DisplayName.Contains("Ảo"));
            Assert.NotNull(phantom);
            Assert.Equal(RowShape.CanhCung, phantom.Formation[0].Shape);   // style-driven → sống qua rebuild
            Assert.Equal(2, phantom.EngageRows);
        }

        [Fact]
        public void Defaults_Stay_HangNgang_And_Zero()
        {
            var c = new GeneralDto { Id = "x", Troop = "KyBinh", TroopCapacity = 9000, Rows = 2 }.ToCombatant(Faction.Offense, "off0");
            Assert.Null(c.Style);            // không khai gì → style null, hành vi cũ nguyên vẹn
            Assert.Equal(0, c.EngageRows);   // 0 → client hiểu là 1 (chỉ hàng đầu)
        }
    }
}
