using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    public class ScenarioRuleTests
    {
        [Fact]
        public void RuleProgram_Json_Deserializes_To_TacticProgram()
        {
            string json = @"{
              ""Id"": ""phaxa"", ""Name"": ""Phá Xa Lệnh"", ""Kind"": ""Rule"",
              ""Program"": [
                { ""Scope"": ""EnemyAll"", ""Rows"": ""AllRows"", ""TroopFilter"": [""ChienXa""], ""Action"": ""InstantKill"" }
              ]}";
            var dto = Wire.Deserialize<TacticDto>(json);
            var spec = dto.ToSpec();
            Assert.Equal(TacticEffectKind.Rule, spec.Kind);
            Assert.NotNull(spec.Program);
            var step = Assert.Single(spec.Program.Steps);
            Assert.Equal(TargetScope.EnemyAll, step.Select.Scope);
            Assert.Equal(RowMode.AllRows, step.Select.Rows);
            Assert.True(step.Select.FilterByTroop);
            Assert.True(TroopMasks.Has(step.Select.TroopMask, TroopType.ChienXa));
            Assert.Equal(ActionKind.InstantKill, step.Action.Kind);
        }

        [Fact]
        public void RuleSkill_From_Scenario_Json_Kills_Filtered_Troop_Through_Session()
        {
            string sc = @"{
              ""Terrain"": ""Plain"", ""Seed"": 7,
              ""Offense"": [ { ""Id"": ""a"", ""Troop"": ""KyBinh"", ""TroopCapacity"": 6000, ""Rows"": 1,
                 ""Formation"": [[""KyBinh""]],
                 ""Skill2"": { ""Id"": ""phaxa"", ""Kind"": ""Rule"", ""Program"": [
                    { ""Scope"": ""EnemyAll"", ""Rows"": ""AllRows"", ""TroopFilter"": [""ChienXa""], ""Action"": ""InstantKill"" } ] } } ],
              ""Defense"": [
                 { ""Id"": ""d0"", ""Troop"": ""ChienXa"", ""TroopCapacity"": 6000, ""Rows"": 1, ""Formation"": [[""ChienXa"", ""CungBinh""]] },
                 { ""Id"": ""d1"", ""Troop"": ""ChienXa"", ""TroopCapacity"": 6000, ""Rows"": 1, ""Formation"": [[""ChienXa""]] }
              ]}";
            var dto = Wire.Deserialize<ScenarioDto>(sc);
            var session = new BattleSession(dto.ToSetup());
            session.Begin();
            session.TestApi(TestApiKind.UseSkill, Faction.Offense);

            var snap = session.Snapshot();
            var chienXa = new List<int>();
            foreach (var c in snap.Defense.Queue)
                foreach (var r in c.Formation)
                    foreach (var g in r.Groups)
                        if (g.Troop == TroopType.ChienXa) chienXa.Add(g.Soldiers);
            Assert.NotEmpty(chienXa);
            Assert.All(chienXa, s => Assert.Equal(0, s));
        }
    }
}
