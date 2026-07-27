using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    /// <summary>Stage 2E: trụ tên công thành (report26/32/33/35) + hoả công; gated Terrain.City & EnableCityTower.</summary>
    public class Stage2ETests
    {
        static (BattleRunner r, List<BattleEvent> ev) CityRound(BattleConfig cfg, Terrain terrain = Terrain.City)
        {
            var off = new Combatant { Id = "off", DisplayName = "off", Faction = Faction.Offense, Troop = TroopType.KyBinh, MaxTroops = 500000, Rows = 3, Stats = new GeneralStats(100, 80, 100, 80, 60, 0) };
            var def = new Combatant { Id = "def", DisplayName = "def", Faction = Faction.Defense, Troop = TroopType.KyBinh, MaxTroops = 500000, Rows = 3, Stats = new GeneralStats(100, 80, 100, 80, 50, 0) };
            var setup = new BattleSetup { Terrain = terrain, Seed = 1, Config = cfg };
            setup.OffenseLineup.Add(off); setup.DefenseLineup.Add(def);
            var r = new BattleRunner(setup); r.Begin();
            return (r, r.StepRound(new TurnInput(Stance.TanCong)));
        }

        [Fact]
        public void Tower_Shoots_Offense_On_City()
        {
            var (r, ev) = CityRound(new BattleConfig { EnableCityTower = true, CityTowerPeriod = 1 });
            Assert.NotNull(r.State.Defense.Tower);
            Assert.Contains(ev, e => e.Type == BattleEventType.TowerShoot && e.Side == Faction.Defense && e.Amount > 0);
        }

        [Fact]
        public void Tower_Not_Present_On_NonCity()
        {
            var (r, ev) = CityRound(new BattleConfig { EnableCityTower = true }, Terrain.Plain);
            Assert.Null(r.State.Defense.Tower);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TowerShoot);
        }

        [Fact]
        public void Tower_Break_Destroys_When_Blood_Depleted()
        {
            var (r, ev) = CityRound(new BattleConfig { EnableCityTower = true, CityTowerBlood = 200, CityTowerBreakPerRound = 500 });
            Assert.False(r.State.Defense.Tower.Alive);
            Assert.Contains(ev, e => e.Type == BattleEventType.TowerBreak);
        }

        [Fact]
        public void Fire_Spreads_Across_Rows()
        {
            var c = new Combatant { Troop = TroopType.KyBinh, MaxTroops = 6000, Troops = 6000, Rows = 3 };
            c.Formation.AddRange(FormationBuilder.Uniform(3, 3, TroopType.KyBinh, 6000));
            c.SyncTroops();
            int before = c.Troops;
            int killed = CombatOps.ApplyFire(c, 2, 50.0, 1, new List<BattleEvent>());
            Assert.True(killed > 0);
            Assert.True(c.Troops < before);
        }

        [Fact]
        public void Tower_Off_By_Default_No_Drift()   // EnableCityTower=false mặc định → không có trụ
        {
            var (r, ev) = CityRound(new BattleConfig());
            Assert.Null(r.State.Defense.Tower);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TowerShoot || e.Type == BattleEventType.TowerBreak);
        }
    }
}
