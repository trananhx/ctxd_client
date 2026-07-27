using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    /// <summary>
    /// Layer-1 (campaign flow) contract: the "Chọn tướng" roster + "Chọn màn" stages + difficulty scaling +
    /// roster-chosen offense, all in the server-authoritative data layer (ScenarioLoader / ScenarioDto).
    /// Wire fields must survive a JSON round-trip so the Unity client and server agree.
    /// </summary>
    public class CampaignFlowTests
    {
        // ── roster ("Chọn tướng") ────────────────────────────────────────────────
        [Fact]
        public void Roster_Summaries_Are_Nonempty_And_Have_Positive_Power()
        {
            var roster = ScenarioLoader.RosterSummaries();
            Assert.NotEmpty(roster);
            Assert.All(roster, g => Assert.True(g.Power > 0, $"{g.Id} power should be > 0"));
            Assert.All(roster, g => Assert.False(string.IsNullOrEmpty(g.DisplayName)));
            // Covers multiple troop types (the picker shows 骑/步/弓/器械/谋士).
            Assert.True(roster.Select(g => g.Troop).Distinct().Count() >= 3);
        }

        [Fact]
        public void Roster_Contains_Core_Shu_Generals()
        {
            var ids = ScenarioLoader.RosterSummaries().Select(g => g.Id).ToHashSet();
            Assert.Contains("guanyu", ids);
            Assert.Contains("zhaoyun", ids);
        }

        [Fact]
        public void Power_Is_Composite_Not_Damage_And_FiveStar_Boosts()
        {
            var weak = new GeneralDto { Id = "w", NormalAtk = 100, NormalDef = 100, TacticAtk = 100, TacticDef = 100, Strategy = 10, TroopCapacity = 1000 };
            var strong = new GeneralDto { Id = "s", NormalAtk = 100, NormalDef = 100, TacticAtk = 100, TacticDef = 100, Strategy = 10, TroopCapacity = 1000, FiveStar = true };
            Assert.True(strong.Power() > weak.Power());   // FiveStar adds a flat bonus
            Assert.True(weak.Power() > 0);
        }

        // ── stages ("Chọn màn") ──────────────────────────────────────────────────
        [Fact]
        public void Stages_Catalog_Lists_Multiple_Playable_Stages()
        {
            var stages = ScenarioLoader.ListStages();
            Assert.True(stages.Count >= 3);
            Assert.All(stages, s => Assert.False(string.IsNullOrEmpty(s.Id)));
            Assert.All(stages, s => Assert.False(string.IsNullOrEmpty(s.Name)));
            Assert.Contains(stages, s => s.Id == "stage_khanhvang");
        }

        [Fact]
        public void Every_Stage_Id_Resolves_To_A_Loadable_Scenario()
        {
            foreach (var s in ScenarioLoader.ListStages())
            {
                var dto = ScenarioLoader.Load(s.Id);
                Assert.NotNull(dto);
                Assert.NotEmpty(dto.Defense);   // a stage must have enemies
            }
        }

        // ── difficulty scaling ───────────────────────────────────────────────────
        [Fact]
        public void Difficulty_Scales_Enemy_Troops_Monotonically()
        {
            int Cap(int tier)
            {
                var dto = ScenarioLoader.Load("stage_khanhvang");
                dto.ApplyDifficulty(tier);
                return dto.Defense.Sum(g => g.TroopCapacity);
            }
            int thuong = Cap(2), kho = Cap(3), diaNguc = Cap(4), chienThan = Cap(5);
            Assert.True(kho > thuong);
            Assert.True(diaNguc > kho);
            Assert.True(chienThan > diaNguc);
        }

        [Fact]
        public void Difficulty_Thuong_Does_Not_Change_Troops()
        {
            var baseDto = ScenarioLoader.Load("stage_khanhvang");
            int before = baseDto.Defense.Sum(g => g.TroopCapacity);
            baseDto.ApplyDifficulty(2);
            Assert.Equal(before, baseDto.Defense.Sum(g => g.TroopCapacity));
        }

        // ── roster-chosen offense ("Chọn tướng" → JoinBattle) ────────────────────
        [Fact]
        public void OverrideOffense_Replaces_In_Chosen_Order()
        {
            var dto = ScenarioLoader.Load("stage_khanhvang");
            var roster = ScenarioLoader.LoadRosterDtos();
            dto.OverrideOffense(new List<string> { "zhaoyun", "guanyu", "huangzhong" }, roster);
            Assert.Equal(3, dto.Offense.Count);
            Assert.Equal("zhaoyun", dto.Offense[0].Id);
            Assert.Equal("guanyu", dto.Offense[1].Id);
            Assert.Equal("huangzhong", dto.Offense[2].Id);
        }

        [Fact]
        public void OverrideOffense_Skips_Unknown_Ids_And_Keeps_Stage_Default_When_Empty()
        {
            var dto = ScenarioLoader.Load("stage_khanhvang");
            int defaultCount = dto.Offense.Count;
            dto.OverrideOffense(new List<string> { "no_such_general" }, ScenarioLoader.LoadRosterDtos());
            Assert.Equal(defaultCount, dto.Offense.Count);   // nothing resolved → keep default
        }

        // ── end-to-end: chosen stage + roster + difficulty → a real battle ───────
        [Fact]
        public void Campaign_Selection_Produces_A_Startable_Battle_With_Chosen_Offense()
        {
            var dto = ScenarioLoader.Load("stage_quando");
            dto.OverrideOffense(new List<string> { "guanyu", "zhaoyun", "machao" }, ScenarioLoader.LoadRosterDtos());
            dto.ApplyDifficulty(3);

            var session = new BattleSession(dto.ToSetup());
            var snap = session.Snapshot();
            // Offense queue reflects the chosen generals (deputies may add extra entries — check the leads are present).
            var offNames = snap.Offense.Queue.Select(c => c.DefId).ToList();
            Assert.Contains("guanyu", offNames);
            Assert.Contains("machao", offNames);
            Assert.NotEmpty(snap.Defense.Queue);

            var begin = session.Begin();
            Assert.NotNull(begin);
            // The battle can be stepped without throwing.
            var ev = session.Step(new TurnInput(Stance.DotKich, false, false));
            Assert.NotNull(ev);
        }

        // ── wire round-trip: client ↔ server agree on the new fields ─────────────
        [Fact]
        public void JoinStage_Command_Survives_Json_Roundtrip()
        {
            var cmd = Command.JoinStage("stage_xichbich", new List<string> { "zhouyu", "zhugeliang" }, difficulty: 4, seed: 123);
            var back = Wire.Deserialize<Command>(Wire.Serialize(cmd));
            Assert.Equal(ClientMsgType.JoinBattle, back.Type);
            Assert.Equal("stage_xichbich", back.ScenarioId);
            Assert.Equal(4, back.Difficulty);
            Assert.Equal((ulong)123, back.Seed);
            Assert.Equal(new List<string> { "zhouyu", "zhugeliang" }, back.OffenseGeneralIds);
        }

        [Fact]
        public void Stages_And_Roster_Server_Messages_Survive_Json_Roundtrip()
        {
            var stagesMsg = Wire.Deserialize<ServerMsg>(Wire.Serialize(ServerMsg.Stages(ScenarioLoader.ListStages())));
            Assert.Equal(ServerMsgType.Stages, stagesMsg.Type);
            Assert.NotEmpty(stagesMsg.StageList);

            var rosterMsg = Wire.Deserialize<ServerMsg>(Wire.Serialize(ServerMsg.Roster(ScenarioLoader.RosterSummaries())));
            Assert.Equal(ServerMsgType.Roster, rosterMsg.Type);
            Assert.NotEmpty(rosterMsg.RosterList);
            Assert.All(rosterMsg.RosterList, g => Assert.True(g.Power > 0));
        }
    }
}
