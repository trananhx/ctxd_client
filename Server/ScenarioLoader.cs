using System;
using System.Collections.Generic;
using System.IO;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.Server
{
    // ─────────────────────────────────────────────────────────────────────────
    //  The NUMBERS live on the server (owner mandate): generals/troops/tactics
    //  stats are loaded from Server/data/*.json into a sim BattleSetup. The Unity
    //  client never holds the source of truth for these numbers — only visuals.
    // ─────────────────────────────────────────────────────────────────────────

    /// <summary>One authored rule step in scenario.json (select → condition → act) → sim <see cref="RuleStep"/>.</summary>
    public sealed class RuleStepDto
    {
        // SELECT — which combatants + which groups
        public string Scope = "EnemyActive";   // EnemyActive | EnemyAll | AllySelf | AllyActive | AllyAll
        public string Rows = "FrontRow";       // FrontRow | FrontNRows | AllRows | RowIndex
        public int RowCount = 1;               // Rows == FrontNRows
        public int RowIndex = 0;               // Rows == RowIndex
        public List<string> TroopFilter;       // troop names to hit (e.g. ["ChienXa"]); non-empty → filter by troop
        public int MaxGroups = 0;              // 0 = unlimited

        // CONDITION — optional gate
        public string Condition = "Always";    // Always | TargetHpBelowPct | TargetHpAbovePct | ActorMoraleFull | TerrainIs | TargetTroopPresent | Chance
        public double CondValue = 0;           // pct / probability
        public string CondTerrain = "Plain";
        public string CondTroop = "CungBinh";

        // ACTION — what to do
        public string Action = "Damage";       // Damage | InstantKill | SetToHpPct | Confuse | Pushback | Heal | Buff
        public double PowerScale = 1.0;
        public string Dist = "EvenByHp";        // EvenByHp | FocusFrontFirst
        public double HpPct = 0.0;
        public int ConfuseTurns = 1;
        public int PushbackTroops = 0;
        public double HealScale = 1.0;

        public RuleStep ToStep()
        {
            int mask = 0; bool filter = false;
            if (TroopFilter != null && TroopFilter.Count > 0)
            {
                filter = true;
                foreach (var s in TroopFilter)
                    if (Enum.TryParse<TroopType>(s, true, out var tt)) mask |= 1 << (int)tt;
            }
            return new RuleStep
            {
                Select = new TargetSelect
                {
                    Scope = P(Scope, TargetScope.EnemyActive),
                    Rows = P(Rows, RowMode.FrontRow),
                    RowCount = RowCount, RowIndexValue = RowIndex,
                    FilterByTroop = filter, TroopMask = mask, MaxGroups = MaxGroups,
                },
                Condition = new RuleCondition
                {
                    Kind = P(Condition, ConditionKind.Always),
                    Value = CondValue, Terrain = P(CondTerrain, Terrain.Plain), Troop = P(CondTroop, TroopType.CungBinh),
                },
                Action = new RuleAction
                {
                    Kind = P(Action, ActionKind.Damage), PowerScale = PowerScale, Dist = P(Dist, Distribution.EvenByHp),
                    HpPct = HpPct, ConfuseTurns = ConfuseTurns, PushbackTroops = PushbackTroops, HealScale = HealScale,
                },
            };
        }

        private static T P<T>(string s, T fallback) where T : struct => Enum.TryParse<T>(s, true, out var v) ? v : fallback;
    }

    public sealed class TacticDto
    {
        public string Id, Name, Kind = "Damage";
        public int RowsHit = 1;
        public double Power = 1.0;
        public bool IsAwakening;
        public double FixedPower;
        public int ConfusionTurns = 1;
        public int PushbackTroops;

        /// <summary>Rule-engine program (data-driven targeting). Non-empty → Kind becomes Rule and legacy Kind is ignored.</summary>
        public List<RuleStepDto> Program;

        public TacticSpec ToSpec()
        {
            bool hasProgram = Program != null && Program.Count > 0;
            var spec = new TacticSpec
            {
                Id = Id, DisplayName = string.IsNullOrEmpty(Name) ? Id : Name,
                Kind = hasProgram ? TacticEffectKind.Rule : ParseEnum(Kind, TacticEffectKind.Damage),
                RowsHit = RowsHit, Power = Power, IsAwakening = IsAwakening,
                FixedPower = FixedPower, ConfusionTurns = ConfusionTurns, PushbackTroops = PushbackTroops,
            };
            if (hasProgram)
            {
                spec.Program = new TacticProgram();
                foreach (var s in Program) if (s != null) spec.Program.Steps.Add(s.ToStep());
            }
            return spec;
        }

        private static T ParseEnum<T>(string s, T fallback) where T : struct
            => Enum.TryParse<T>(s, true, out var v) ? v : fallback;
    }

    public sealed class GeneralDto
    {
        public string Id, DisplayName, Troop = "ThuongBinh";
        public double NormalAtk = 500, NormalDef = 280, TacticAtk = 480, TacticDef = 260, Strategy = 75, Resilience = 0.1;
        public int TroopCapacity = 3800;
        public int Rows = 4;
        public bool FiveStar, CanAwaken, StartAwakened;
        public TacticDto Skill1, Skill2;

        /// <summary>Optional per-group troop-type layout (rows × groups). Absent → uniform Rows×3 of the general's Troop.</summary>
        public List<List<string>> Formation;

        /// <summary>Optional deputy general (phó tướng): takes ONE row of this general — own stats, HP = total/rows.</summary>
        public GeneralDto Deputy;

        public Combatant ToCombatant(Faction faction, string runtimeId)
        {
            var skill2 = Skill2?.ToSpec();
            var troop = Enum.TryParse<TroopType>(Troop, true, out var t) ? t : TroopType.ThuongBinh;
            int cap = Math.Max(1, TroopCapacity);
            var c = new Combatant
            {
                Id = runtimeId,
                DefId = Id,
                DisplayName = string.IsNullOrEmpty(DisplayName) ? Id : DisplayName,
                Faction = faction,
                Troop = troop,
                Stats = new GeneralStats(NormalAtk, NormalDef, TacticAtk, TacticDef, Strategy, Resilience),
                MaxTroops = cap,
                Troops = cap,
                Rows = Rows,
                FiveStar = FiveStar,
                Skill1 = Skill1?.ToSpec(),
                Skill2 = skill2,
                Awakened = StartAwakened || (CanAwaken && skill2 != null && skill2.IsAwakening),
            };

            if (Formation != null && Formation.Count > 0)
            {
                var layout = new List<List<TroopType>>();
                foreach (var row in Formation)
                {
                    var rl = new List<TroopType>();
                    if (row != null)
                        foreach (var s in row)
                            rl.Add(Enum.TryParse<TroopType>(s, true, out var gt) ? gt : troop);
                    layout.Add(rl);
                }
                c.Formation.AddRange(FormationBuilder.FromLayout(layout, cap));
                c.SyncTroops();
            }
            // else: BattleRunner.BuildSide builds a uniform Rows×3 formation of `troop`.
            return c;
        }
    }

    public sealed class ScenarioDto
    {
        public string Terrain = "Plain";
        public ulong Seed = 20260630;
        public string OffenseNation = "Thục", DefenseNation = "Ngụy";
        public List<GeneralDto> Offense = new List<GeneralDto>();
        public List<GeneralDto> Defense = new List<GeneralDto>();
        public List<GeneralDto> OffenseReserve = new List<GeneralDto>();   // 借兵 pool (strongest added on Mượn Binh)
        public List<GeneralDto> DefenseReserve = new List<GeneralDto>();

        public BattleSetup ToSetup()
        {
            var setup = new BattleSetup
            {
                Terrain = Enum.TryParse<Terrain>(Terrain, true, out var ter) ? ter : Battle.Sim.Terrain.Plain,
                Seed = Seed,
                OffenseNation = OffenseNation,
                DefenseNation = DefenseNation,
                Config = new BattleConfig(),
            };
            for (int i = 0; i < Offense.Count; i++) AddWithDeputy(setup.OffenseLineup, Offense[i], Faction.Offense, "off", i);
            for (int i = 0; i < Defense.Count; i++) AddWithDeputy(setup.DefenseLineup, Defense[i], Faction.Defense, "def", i);
            if (OffenseReserve != null)
                for (int i = 0; i < OffenseReserve.Count; i++) setup.OffenseReserve.Add(OffenseReserve[i].ToCombatant(Faction.Offense, $"offres_{i}_{OffenseReserve[i].Id}"));
            if (DefenseReserve != null)
                for (int i = 0; i < DefenseReserve.Count; i++) setup.DefenseReserve.Add(DefenseReserve[i].ToCombatant(Faction.Defense, $"defres_{i}_{DefenseReserve[i].Id}"));
            return setup;
        }

        // A general optionally brings a deputy (phó tướng) that takes ONE of its rows.
        static void AddWithDeputy(List<Combatant> dst, GeneralDto g, Faction f, string pfx, int i)
        {
            var main = g.ToCombatant(f, $"{pfx}_{i}_{g.Id}");
            if (g.Deputy != null && main.Rows > 1)
            {
                int perRow = Math.Max(1, main.MaxTroops / main.Rows);
                int mainRows = main.Rows - 1;
                main.Rows = mainRows; main.MaxTroops = perRow * mainRows; main.Troops = main.MaxTroops;
                main.Formation.Clear();
                main.Formation.AddRange(FormationBuilder.Uniform(mainRows, FormationBuilder.DefaultGroupsPerRow, main.Troop, main.MaxTroops));
                main.SyncTroops();
                dst.Add(main);

                var dep = g.Deputy.ToCombatant(f, $"{pfx}_{i}_{g.Id}_dep");
                dep.DisplayName = (string.IsNullOrEmpty(g.Deputy.DisplayName) ? g.Deputy.Id : g.Deputy.DisplayName) + " (Phó)";
                dep.Rows = 1; dep.MaxTroops = perRow; dep.Troops = perRow;
                dep.Formation.Clear();
                dep.Formation.AddRange(FormationBuilder.Uniform(1, FormationBuilder.DefaultGroupsPerRow, dep.Troop, perRow));
                dep.SyncTroops();
                dst.Add(dep);
            }
            else dst.Add(main);
        }
    }

    public static class ScenarioLoader
    {
        public static ScenarioDto Load(string scenarioId = null)
        {
            string dir = ResolveDataDir();
            string file = string.IsNullOrEmpty(scenarioId) ? "scenario.json" : $"{scenarioId}.json";
            string path = Path.Combine(dir, file);
            if (!File.Exists(path))
            {
                Console.WriteLine($"[server] scenario '{path}' not found — using a built-in default.");
                return Default();
            }
            var dto = Wire.Deserialize<ScenarioDto>(File.ReadAllText(path));
            Console.WriteLine($"[server] loaded scenario '{path}': {dto.Offense.Count} vs {dto.Defense.Count}, terrain {dto.Terrain}.");
            return dto;
        }

        /// <summary>data/ next to the exe (copied), else walk up to find Server/data.</summary>
        public static string ResolveDataDir()
        {
            string near = Path.Combine(AppContext.BaseDirectory, "data");
            if (Directory.Exists(near)) return near;
            var d = new DirectoryInfo(AppContext.BaseDirectory);
            for (int i = 0; i < 8 && d != null; i++, d = d.Parent)
            {
                string candidate = Path.Combine(d.FullName, "data");
                if (Directory.Exists(candidate) && File.Exists(Path.Combine(candidate, "scenario.json"))) return candidate;
                candidate = Path.Combine(d.FullName, "Server", "data");
                if (Directory.Exists(candidate)) return candidate;
            }
            return near;
        }

        private static ScenarioDto Default()
        {
            ScenarioDto s = new ScenarioDto();
            s.Offense.Add(new GeneralDto { Id = "guanyu", DisplayName = "Quan Vũ", Troop = "KyBinh", TroopCapacity = 16043, FiveStar = true, CanAwaken = true, NormalAtk = 640, TacticAtk = 600, Skill2 = new TacticDto { Id = "wushen", Name = "Võ Thần Phụ Thể", Kind = "AoeDamage", RowsHit = 3, Power = 1.9, IsAwakening = true, FixedPower = 2.6 } });
            s.Defense.Add(new GeneralDto { Id = "caocao", DisplayName = "Tào Tháo", Troop = "KyBinh", TroopCapacity = 13770, NormalAtk = 560, TacticAtk = 540, Skill2 = new TacticDto { Id = "rampage", Name = "Loạn Thế Gian Hùng", Kind = "Damage", RowsHit = 2, Power = 1.6 } });
            return s;
        }
    }
}
