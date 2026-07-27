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
        // [2A] chuỗi / không-né / Loạn Vũ
        public string NextTacticId;
        public bool Undodgeable, GrantsLuanwu;
        // [2C] biến thể địa hình
        public string TerrainTag;
        public double JiachengMult = 1.0;

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
            spec.NextTacticId = NextTacticId;
            spec.Undodgeable = Undodgeable;
            spec.GrantsLuanwu = GrantsLuanwu;
            spec.JiachengMult = JiachengMult;
            if (!string.IsNullOrEmpty(TerrainTag) && Enum.TryParse<Terrain>(TerrainTag, true, out var tt)) spec.TerrainTag = tt;
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
        public int Level = 100;   // cấp tướng (display only — the picker shows it)
        public bool FiveStar, CanAwaken, StartAwakened;
        public TacticDto Skill1, Skill2;

        /// <summary>Optional per-group troop-type layout (rows × groups). Absent → uniform Rows×3 of the general's Troop.</summary>
        public List<List<string>> Formation;

        /// <summary>Optional deputy general (phó tướng): takes ONE row of this general — own stats, HP = total/rows.</summary>
        public GeneralDto Deputy;

        /// <summary>Optional thiên phú % Lực chiến (战力) theo địa hình (RE): {"City":0.25,"Plain":0.20}.
        /// City (Thành trì) chỉ áp phe Công. Giá trị % là DATA server (RE không lộ số → tunable).</summary>
        public Dictionary<string, double> TerrainBonus;

        /// <summary>[2B] Optional khắc chế binh chủng per-tướng (Thức tỉnh/tech): {"CungBinh":0.15}. Cộng chồng lên ring.</summary>
        public Dictionary<string, double> CounterVsTroop;

        /// <summary>[2C] Optional biến thể chiến pháp theo địa hình (mỗi cái có TerrainTag + JiachengMult).</summary>
        public List<TacticDto> Skill2Variants;

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

            if (TerrainBonus != null && TerrainBonus.Count > 0)
            {
                c.TerrainBonus = new Dictionary<int, double>();
                foreach (var kv in TerrainBonus)
                    if (Enum.TryParse<Terrain>(kv.Key, true, out var ter)) c.TerrainBonus[(int)ter] = kv.Value;
                    else Console.WriteLine($"[server] cảnh báo: TerrainBonus của '{Id}' có địa hình '{kv.Key}' không hợp lệ — bỏ qua.");
            }

            if (CounterVsTroop != null && CounterVsTroop.Count > 0)
            {
                c.CounterVsTroop = new Dictionary<int, double>();
                foreach (var kv in CounterVsTroop)
                    if (Enum.TryParse<TroopType>(kv.Key, true, out var tt)) c.CounterVsTroop[(int)tt] = kv.Value;
                    else Console.WriteLine($"[server] cảnh báo: CounterVsTroop của '{Id}' có binh chủng '{kv.Key}' không hợp lệ — bỏ qua.");
            }

            if (Skill2Variants != null && Skill2Variants.Count > 0)
            {
                c.Skill2Variants = new List<TacticSpec>();
                foreach (var sv in Skill2Variants) if (sv != null) c.Skill2Variants.Add(sv.ToSpec());
            }
            return c;
        }

        /// <summary>Composite "Lực chiến (战力)" — a display-only power stat (NOT damage). Server-owned formula.</summary>
        public int Power()
            => (int)(TroopCapacity * 2 + (NormalAtk + NormalDef + TacticAtk + TacticDef) * 20 + Strategy * 50
                     + (FiveStar ? 30000 : 0));

        /// <summary>Project to the wire summary shown in the "Chọn tướng" picker.</summary>
        public GeneralSummary ToSummary()
            => new GeneralSummary
            {
                Id = Id,
                DisplayName = string.IsNullOrEmpty(DisplayName) ? Id : DisplayName,
                Troop = Enum.TryParse<TroopType>(Troop, true, out var t) ? t : TroopType.ThuongBinh,
                Power = Power(),
                Level = Level,
                Rows = Rows,
                Skill2Name = Skill2?.Name ?? Skill1?.Name,
            };
    }

    public sealed class ScenarioDto
    {
        public string Terrain = "Plain";
        public ulong Seed = 20260630;
        public string OffenseNation = "Thục", DefenseNation = "Ngụy";
        public bool EnableCityTower;   // [2E] bật trụ tên (chỉ có tác dụng khi Terrain=City)
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
            setup.Config.EnableCityTower = EnableCityTower;   // [2E]
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

        // ── campaign flow: difficulty scaling + roster-chosen offense ─────────────

        /// <summary>Multiplier applied to enemy (Defense) troop capacity per difficulty tier
        /// 1..5 = 简单/普通/困难/地狱/战神 (Dễ/Thường/Khó/Địa Ngục/Chiến Thần). 0/1 → no scaling.</summary>
        public static double DifficultyMultiplier(int tier) => tier switch
        {
            <= 1 => 1.0,   // Dễ + Thường không tăng địch (Dễ có thể yếu hơn nếu muốn, giữ 1.0 cho an toàn)
            2 => 1.0,
            3 => 1.6,
            4 => 2.4,
            5 => 3.5,
            _ => 1.0,
        };

        /// <summary>Scale the defending army's troop capacity by the difficulty tier (server-authoritative).</summary>
        public void ApplyDifficulty(int tier)
        {
            double m = DifficultyMultiplier(tier);
            if (m == 1.0 || Defense == null) return;
            foreach (var g in Defense)
            {
                if (g == null) continue;
                g.TroopCapacity = Math.Max(1, (int)Math.Round(g.TroopCapacity * m));
                if (g.Deputy != null) g.Deputy.TroopCapacity = Math.Max(1, (int)Math.Round(g.Deputy.TroopCapacity * m));
            }
        }

        /// <summary>Replace the stage's default offense with the roster generals the player chose (in slot order).
        /// Unknown ids are skipped; if nothing resolves, the stage's own Offense is kept.</summary>
        public void OverrideOffense(IList<string> chosenIds, IList<GeneralDto> roster)
        {
            if (chosenIds == null || chosenIds.Count == 0 || roster == null || roster.Count == 0) return;
            var byId = new Dictionary<string, GeneralDto>(StringComparer.OrdinalIgnoreCase);
            foreach (var g in roster) if (g != null && !string.IsNullOrEmpty(g.Id) && !byId.ContainsKey(g.Id)) byId[g.Id] = g;
            var picked = new List<GeneralDto>();
            foreach (var id in chosenIds)
                if (!string.IsNullOrEmpty(id) && byId.TryGetValue(id, out var g)) picked.Add(g);
            if (picked.Count > 0) Offense = picked;
        }
    }

    /// <summary>roster.json → the pool of generals the player can pick from ("Chọn tướng").</summary>
    public sealed class RosterDto
    {
        public List<GeneralDto> Generals = new List<GeneralDto>();
    }

    /// <summary>stages.json → the campaign stage catalog ("Chọn màn"). Each entry's Id maps to a {Id}.json scenario.</summary>
    public sealed class StagesManifestDto
    {
        public List<StageInfo> Stages = new List<StageInfo>();
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

        // ── campaign catalog: roster ("Chọn tướng") + stages ("Chọn màn") ─────────

        /// <summary>The full pickable roster (raw DTOs) from data/roster.json. Empty list if the file is absent.</summary>
        public static List<GeneralDto> LoadRosterDtos()
        {
            string path = Path.Combine(ResolveDataDir(), "roster.json");
            if (!File.Exists(path))
            {
                Console.WriteLine($"[server] roster '{path}' not found — using a built-in default roster.");
                return DefaultRoster();
            }
            var dto = Wire.Deserialize<RosterDto>(File.ReadAllText(path));
            return dto?.Generals ?? new List<GeneralDto>();
        }

        /// <summary>Roster projected to wire summaries for the picker UI.</summary>
        public static List<GeneralSummary> RosterSummaries()
        {
            var list = new List<GeneralSummary>();
            foreach (var g in LoadRosterDtos()) if (g != null) list.Add(g.ToSummary());
            return list;
        }

        /// <summary>The campaign stage catalog from data/stages.json. Empty list if the file is absent.</summary>
        public static List<StageInfo> ListStages()
        {
            string path = Path.Combine(ResolveDataDir(), "stages.json");
            if (!File.Exists(path))
            {
                Console.WriteLine($"[server] stages '{path}' not found — using a built-in default stage list.");
                return DefaultStages();
            }
            var dto = Wire.Deserialize<StagesManifestDto>(File.ReadAllText(path));
            return dto?.Stages ?? new List<StageInfo>();
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

        private static List<GeneralDto> DefaultRoster()
        {
            // Minimal safety-net roster (used only if data/roster.json is missing).
            return new List<GeneralDto>
            {
                new GeneralDto { Id = "guanyu", DisplayName = "Quan Vũ", Troop = "KyBinh", Level = 220, TroopCapacity = 16043, FiveStar = true, CanAwaken = true, NormalAtk = 640, NormalDef = 320, TacticAtk = 600, TacticDef = 300, Strategy = 92, Skill2 = new TacticDto { Id = "wushen", Name = "Võ Thần Phụ Thể", Kind = "AoeDamage", RowsHit = 3, Power = 1.9, IsAwakening = true, FixedPower = 2.6 } },
                new GeneralDto { Id = "zhaoyun", DisplayName = "Triệu Vân", Troop = "KyBinh", Level = 200, TroopCapacity = 11497, CanAwaken = true, NormalAtk = 610, NormalDef = 330, TacticAtk = 580, TacticDef = 300, Strategy = 85, Skill2 = new TacticDto { Id = "dragonspear", Name = "Long Thương Ngạo Thế", Kind = "AoeDamage", RowsHit = 4, Power = 1.7 } },
                new GeneralDto { Id = "zhangfei", DisplayName = "Trương Phi", Troop = "ThuongBinh", Level = 190, TroopCapacity = 13770, CanAwaken = true, NormalAtk = 600, NormalDef = 360, TacticAtk = 540, TacticDef = 320, Strategy = 70, Skill2 = new TacticDto { Id = "roar", Name = "Diệt Thế Bào Hao", Kind = "Pushback", RowsHit = 3, Power = 1.6, PushbackTroops = 800 } },
                new GeneralDto { Id = "huangzhong", DisplayName = "Hoàng Trung", Troop = "CungBinh", Level = 170, TroopCapacity = 9930, NormalAtk = 590, TacticAtk = 600, Strategy = 68, Skill1 = new TacticDto { Id = "volley", Name = "Liên Châu Tiễn", Kind = "AoeDamage", RowsHit = 2, Power = 1.2 } },
            };
        }

        private static List<StageInfo> DefaultStages()
        {
            return new List<StageInfo>
            {
                new StageInfo { Id = "stage_khanhvang", Name = "Trấn Áp Khăn Vàng", Terrain = "Plain",  DefenseNation = "Khăn Vàng", Desc = "184 — Khởi nghĩa Hoàng Cân.", EnemyCount = 3 },
                new StageInfo { Id = "stage_quando",    Name = "Đại Chiến Quan Độ", Terrain = "Pass",   DefenseNation = "Viên Thiệu", Desc = "200 — Tào vs Viên.",       EnemyCount = 4 },
                new StageInfo { Id = "stage_xichbich",  Name = "Xích Bích Hỏa Công", Terrain = "Water", DefenseNation = "Tào Ngụy",  Desc = "208 — Liên minh Tôn-Lưu.", EnemyCount = 5 },
            };
        }
    }
}
