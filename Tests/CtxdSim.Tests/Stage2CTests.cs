using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    /// <summary>Stage 2C: biến thể chiến pháp theo địa hình (jiacheng) + report27 (TacticVariantOffer).</summary>
    public class Stage2CTests
    {
        static TacticSpec T(string id, Terrain? tag = null, double jc = 1.0) => new TacticSpec
        { Id = id, DisplayName = id, Kind = TacticEffectKind.Damage, Power = 1.0, RowsHit = 1, TerrainTag = tag, JiachengMult = jc };

        static Combatant Hero(string id, Faction f, TacticSpec s2, List<TacticSpec> variants = null, bool five = true)
            => new Combatant
            {
                Id = id, DisplayName = id, Faction = f, Troop = TroopType.KyBinh, MaxTroops = 500000, Rows = 2, FiveStar = five,
                Stats = new GeneralStats(100, 80, 1000, 80, f == Faction.Offense ? 60 : 50, 0), Skill2 = s2, Skill2Variants = variants,
            };

        static (BattleRunner r, List<BattleEvent> ev) Round(Combatant off, Combatant def, Terrain terrain)
        {
            var setup = new BattleSetup { Terrain = terrain, Seed = 1, OffenseNation = "A", DefenseNation = "B", Config = new BattleConfig() };
            setup.OffenseLineup.Add(off); setup.DefenseLineup.Add(def);
            var r = new BattleRunner(setup); r.Begin();
            return (r, r.StepRound(new TurnInput(Stance.TanCong, cast: true)));
        }

        [Fact]
        public void Skill2ForTerrain_Returns_Matching_Variant_Else_Base()
        {
            var c = new Combatant { Skill2 = T("base"), Skill2Variants = new List<TacticSpec> { T("cityvar", Terrain.City) } };
            Assert.Equal("cityvar", c.Skill2ForTerrain(Terrain.City).Id);
            Assert.Equal("base", c.Skill2ForTerrain(Terrain.Plain).Id);
        }

        [Fact]
        public void Jiacheng_Multiplies_TacticDamage_On_Terrain_Match()
        {
            var cfg = new BattleConfig();
            var a = new Combatant { Troop = TroopType.KyBinh, Stats = new GeneralStats(100, 80, 1000, 80, 60, 0), MaxTroops = 1000, Troops = 1000 };
            var b = new Combatant { Troop = TroopType.CungBinh, Faction = Faction.Defense, Stats = new GeneralStats(100, 80, 100, 80, 60, 0), MaxTroops = 1000, Troops = 1000 };
            var t = T("v", Terrain.City, jc: 2.0);
            int onCity = CombatOps.TacticDamage(a, b, t, 1.0, false, Terrain.City, cfg, new DeterministicRng(5), out _, out _);
            int onPlain = CombatOps.TacticDamage(a, b, t, 1.0, false, Terrain.Plain, cfg, new DeterministicRng(5), out _, out _);
            Assert.True(onCity > onPlain);   // jiacheng ×2 khi khớp City (cùng seed → chênh do jc)
        }

        [Fact]
        public void Cast_Uses_Terrain_Variant_And_Emits_Offer_With_Recommend()
        {
            var off = Hero("off", Faction.Offense, T("base"), new List<TacticSpec> { T("cityvar", Terrain.City, 1.5) });
            var def = Hero("def", Faction.Defense, null, five: false);   // không cast → không beHold
            var (_, ev) = Round(off, def, Terrain.City);
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense && e.TacticId == "cityvar");
            var offer = ev.First(e => e.Type == BattleEventType.TacticVariantOffer && e.Side == Faction.Offense);
            Assert.Equal(2, offer.VariantRecommend);   // cityvar là lựa chọn #2, khớp địa hình City
            Assert.True(offer.StrategyUseAble);
        }

        [Fact]
        public void Cast_Falls_Back_To_Base_On_Unmatched_Terrain()
        {
            var off = Hero("off", Faction.Offense, T("base"), new List<TacticSpec> { T("cityvar", Terrain.City) });
            var def = Hero("def", Faction.Defense, null, five: false);
            var (_, ev) = Round(off, def, Terrain.Plain);   // không khớp City → dùng base
            Assert.Contains(ev, e => e.Type == BattleEventType.TacticCast && e.Side == Faction.Offense && e.TacticId == "base");
        }

        [Fact]
        public void VariantOffer_Not_Emitted_Without_Variants()   // 0 drift cho tướng không có biến thể
        {
            var off = Hero("off", Faction.Offense, T("base"));   // no variants
            var def = Hero("def", Faction.Defense, null, five: false);
            var (_, ev) = Round(off, def, Terrain.Plain);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.TacticVariantOffer);
        }
    }
}
