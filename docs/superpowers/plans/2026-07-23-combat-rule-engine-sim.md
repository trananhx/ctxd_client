# Combat Rule-Engine (Sim) Implementation Plan — PLAN 1/2

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a data-driven rule-engine to the CTXD combat sim so a skill can target by scope (active enemy / whole enemy lineup / ally), by row, and by troop type, and apply damage / instant-kill / status effects — all pure C#, deterministic, verified by `dotnet test`.

**Architecture:** A skill carries a `TacticProgram` (ordered `RuleStep`s: Select → Condition → Action). One new `RuleEffect : ITacticEffect` (Kind=`Rule`) interprets it, using a new `TargetResolver` (scope/row/troop selection) and new `CombatOps` primitives (`ApplyDamageToGroups`/`KillGroups`/`SetGroupsToHpPct`). Existing effects/tactics are untouched (additive). No wire/protocol change.

**Tech Stack:** C# (netstandard-compatible, UnityEngine-free), net8.0 test project, xUnit, Newtonsoft.Json 13.0.3, `dotnet` SDK 9.0.312.

## Global Constraints

- Sim code stays **UnityEngine-free** (`Assets/Ctxd/Battle/Sim/**` has zero `using UnityEngine`). Do NOT add UnityEngine references here.
- **Determinism is mandatory.** Consume `DeterministicRng` in a fixed order: Steps order × targets in `Queue`/`Formation` order × within action. No `HashSet`/`Dictionary` iteration for target selection.
- **Additive only.** Do not modify existing effect classes, existing `CombatOps.ApplyDamageToFront` observable behavior, `BattleEventType` order, or the wire. New `TacticEffectKind` members are **appended at the end**.
- **TroopType mapping (fixed):** cung binh=`CungBinh`, bộ binh=`ThuongBinh`, pháo binh=`ChienXa`, kỵ binh=`KyBinh`, mưu sĩ=`MuuSi`.
- Test project lives **outside `Assets/`** (`Tests/CtxdSim.Tests/`) so Unity ignores it. Run tests with the explicit csproj path.
- Every task ends green; commit after each task.

## File Structure

New (Sim, `namespace Ctxd.Battle.Sim`):
- `Assets/Ctxd/Battle/Sim/Rules/TacticProgram.cs` — program + step + select + condition + action data (POCOs) and troop-mask helper.
- `Assets/Ctxd/Battle/Sim/Rules/TargetResolver.cs` — `Resolve(TargetSelect, BattleState, Faction) → List<(Combatant, List<Group>)>`.
- `Assets/Ctxd/Battle/Sim/Rules/RuleConditions.cs` — `Eval(RuleCondition, TacticContext) → bool`.
- `Assets/Ctxd/Battle/Sim/Rules/RuleActions.cs` — `Apply(RuleAction, TacticContext, Combatant, List<Group>)`.
- `Assets/Ctxd/Battle/Sim/Rules/RuleEffect.cs` — `ITacticEffect` (Kind=Rule) interpreter.

Modified (Sim):
- `Assets/Ctxd/Battle/Sim/Enums.cs` — append `TacticEffectKind.Rule`; add rule enums.
- `Assets/Ctxd/Battle/Sim/TacticSpec.cs` — add `TacticProgram Program`.
- `Assets/Ctxd/Battle/Sim/ITacticEffect.cs` — add `TacticContext.State`.
- `Assets/Ctxd/Battle/Sim/CombatOps.cs` — add group primitives; extract a shared even-spread helper (ApplyDamageToFront behavior unchanged).
- `Assets/Ctxd/Battle/Sim/BattleEvent.cs` — add optional `RowIndex/GroupIndex/Troop/SoldiersKilled`.
- `Assets/Ctxd/Battle/Sim/TacticEffects.cs` — register `RuleEffect`.
- `Assets/Ctxd/Battle/Sim/BattleRunner.cs` — set `State` in `CastTactic`.
- `Server/BattleSession.cs` — set `State` in `UseSkill`.

New (test project, outside Assets):
- `Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`
- `Tests/CtxdSim.Tests/*.cs` (one file per task area)
- `Tests/.gitignore`

---

### Task 0: Test harness (.NET xUnit compiling shared Sim)

**Files:**
- Create: `Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`
- Create: `Tests/CtxdSim.Tests/SmokeTest.cs`
- Create: `Tests/.gitignore`

**Interfaces:**
- Produces: a runnable command `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj` that compiles `Assets/Ctxd/Battle/Sim/**/*.cs` + `Server/BattleSession.cs`.

- [ ] **Step 1: Create the test project file**

Create `Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`:
```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net8.0</TargetFramework>
    <Nullable>disable</Nullable>
    <LangVersion>latest</LangVersion>
    <IsPackable>false</IsPackable>
    <AssemblyName>CtxdSim.Tests</AssemblyName>
    <RootNamespace>Ctxd.Tests</RootNamespace>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.11.1" />
    <PackageReference Include="xunit" Version="2.9.2" />
    <PackageReference Include="xunit.runner.visualstudio" Version="2.8.2" />
    <PackageReference Include="Newtonsoft.Json" Version="13.0.3" />
  </ItemGroup>
  <ItemGroup>
    <!-- Compile the shared, UnityEngine-free simulation source directly (same pattern the Server project uses). -->
    <Compile Include="..\..\Assets\Ctxd\Battle\Sim\**\*.cs" />
    <Compile Include="..\..\Server\BattleSession.cs" />
  </ItemGroup>
</Project>
```

- [ ] **Step 2: Create the smoke test**

Create `Tests/CtxdSim.Tests/SmokeTest.cs`:
```csharp
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class SmokeTest
    {
        [Fact]
        public void Sim_Types_Are_Reachable()
        {
            var c = new Combatant { Troops = 5, MaxTroops = 5 };
            Assert.True(c.Alive);
        }
    }
}
```

- [ ] **Step 3: Create `Tests/.gitignore`**

```gitignore
bin/
obj/
```

- [ ] **Step 4: Run the smoke test**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`
Expected: build succeeds, `Passed! - Failed: 0, Passed: 1`.

- [ ] **Step 5: Commit**

```bash
git add Tests/
git commit -m "test: add .NET xUnit harness compiling shared Sim sources"
```

---

### Task 1: Rule data model + enums

**Files:**
- Modify: `Assets/Ctxd/Battle/Sim/Enums.cs`
- Create: `Assets/Ctxd/Battle/Sim/Rules/TacticProgram.cs`
- Modify: `Assets/Ctxd/Battle/Sim/TacticSpec.cs`
- Test: `Tests/CtxdSim.Tests/RuleModelTests.cs`

**Interfaces:**
- Produces: `TargetScope`, `RowMode`, `Distribution`, `ConditionKind`, `ActionKind` enums; `TacticEffectKind.Rule`; classes `TacticProgram { List<RuleStep> Steps }`, `RuleStep { TargetSelect Select; RuleCondition Condition; RuleAction Action }`, `TargetSelect { TargetScope Scope; RowMode Rows; int RowCount; int RowIndexValue; bool FilterByTroop; int TroopMask; int MaxGroups }`, `RuleCondition { ConditionKind Kind; double Value; Terrain Terrain; TroopType Troop }`, `RuleAction { ActionKind Kind; double PowerScale; Distribution Dist; double HpPct; int ConfuseTurns; int PushbackTroops; double HealScale }`, static `TroopMasks.Has(int mask, TroopType t)` and `TroopMasks.Of(params TroopType[])`; `TacticSpec.Program`.

- [ ] **Step 1: Write the failing test**

Create `Tests/CtxdSim.Tests/RuleModelTests.cs`:
```csharp
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleModelTests
    {
        [Fact]
        public void Defaults_Are_SingleTarget_FrontRow_Damage()
        {
            var step = new RuleStep();
            Assert.Equal(TargetScope.EnemyActive, step.Select.Scope);
            Assert.Equal(RowMode.FrontRow, step.Select.Rows);
            Assert.Equal(ConditionKind.Always, step.Condition.Kind);
            Assert.Equal(ActionKind.Damage, step.Action.Kind);
            Assert.Equal(Distribution.EvenByHp, step.Action.Dist);
        }

        [Fact]
        public void RuleKind_Is_Appended_Last()
        {
            var values = System.Enum.GetValues(typeof(TacticEffectKind));
            Assert.Equal(TacticEffectKind.Rule, (TacticEffectKind)values.GetValue(values.Length - 1));
        }

        [Fact]
        public void TroopMask_Roundtrips()
        {
            int mask = TroopMasks.Of(TroopType.CungBinh, TroopType.ChienXa);
            Assert.True(TroopMasks.Has(mask, TroopType.CungBinh));
            Assert.True(TroopMasks.Has(mask, TroopType.ChienXa));
            Assert.False(TroopMasks.Has(mask, TroopType.KyBinh));
        }

        [Fact]
        public void TacticSpec_Can_Hold_A_Program()
        {
            var spec = new TacticSpec { Kind = TacticEffectKind.Rule, Program = new TacticProgram() };
            spec.Program.Steps.Add(new RuleStep());
            Assert.Single(spec.Program.Steps);
        }
    }
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`
Expected: FAIL — `TargetScope`/`RuleStep`/`TroopMasks`/`Program` do not exist (compile error).

- [ ] **Step 3: Add the enums**

In `Assets/Ctxd/Battle/Sim/Enums.cs`, change the `TacticEffectKind` enum to append `Rule`:
```csharp
    public enum TacticEffectKind
    {
        Damage, AoeDamage, Confusion, InstantTo1Hp, Pushback, Buff, Heal, Rule,
    }
```
Then add these enums to the same file (inside the `Ctxd.Battle.Sim` namespace):
```csharp
    // ── Rule-engine enums (data-driven skill targeting) ──────────────────────
    public enum TargetScope { EnemyActive, EnemyAll, AllySelf, AllyActive, AllyAll }
    public enum RowMode { FrontRow, FrontNRows, AllRows, RowIndex }
    public enum Distribution { EvenByHp, FocusFrontFirst }
    public enum ConditionKind { Always, TargetHpBelowPct, TargetHpAbovePct, ActorMoraleFull, TerrainIs, TargetTroopPresent, Chance }
    public enum ActionKind { Damage, InstantKill, SetToHpPct, Confuse, Pushback, Heal, Buff }
```

- [ ] **Step 4: Add the rule model POCOs**

Create `Assets/Ctxd/Battle/Sim/Rules/TacticProgram.cs`:
```csharp
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>A skill's behavior = an ordered list of rule steps (select → condition → act).</summary>
    public sealed class TacticProgram
    {
        public List<RuleStep> Steps = new List<RuleStep>();
    }

    public sealed class RuleStep
    {
        public TargetSelect Select = new TargetSelect();
        public RuleCondition Condition = new RuleCondition();
        public RuleAction Action = new RuleAction();
    }

    /// <summary>Which combatants + which groups within each. Deterministic (front→back order).</summary>
    public sealed class TargetSelect
    {
        public TargetScope Scope = TargetScope.EnemyActive;
        public RowMode Rows = RowMode.FrontRow;
        public int RowCount = 1;        // RowMode.FrontNRows
        public int RowIndexValue = 0;   // RowMode.RowIndex
        public bool FilterByTroop = false;
        public int TroopMask = 0;       // [Flags] bit per (int)TroopType; ignored unless FilterByTroop
        public int MaxGroups = 0;       // 0 == unlimited
    }

    public sealed class RuleCondition
    {
        public ConditionKind Kind = ConditionKind.Always;
        public double Value;            // pct / probability
        public Terrain Terrain;         // ConditionKind.TerrainIs
        public TroopType Troop;         // ConditionKind.TargetTroopPresent
    }

    public sealed class RuleAction
    {
        public ActionKind Kind = ActionKind.Damage;
        public double PowerScale = 1.0; // Damage / Pushback
        public Distribution Dist = Distribution.EvenByHp;
        public double HpPct = 0.0;      // SetToHpPct
        public int ConfuseTurns = 1;    // Confuse
        public int PushbackTroops = 0;  // Pushback
        public double HealScale = 1.0;  // Heal / Buff
    }

    /// <summary>Bit-mask helpers over <see cref="TroopType"/>.</summary>
    public static class TroopMasks
    {
        public static int Of(params TroopType[] troops)
        {
            int m = 0;
            if (troops != null) foreach (var t in troops) m |= 1 << (int)t;
            return m;
        }
        public static bool Has(int mask, TroopType t) => (mask & (1 << (int)t)) != 0;
    }
}
```

- [ ] **Step 5: Add `Program` to `TacticSpec`**

In `Assets/Ctxd/Battle/Sim/TacticSpec.cs`, add inside the `TacticSpec` class (after `PushbackTroops`):
```csharp
        public TacticProgram Program;   // non-null only when Kind == TacticEffectKind.Rule
```

- [ ] **Step 6: Run tests to verify they pass**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`
Expected: PASS (5 tests).

- [ ] **Step 7: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/Enums.cs Assets/Ctxd/Battle/Sim/Rules/TacticProgram.cs Assets/Ctxd/Battle/Sim/TacticSpec.cs Tests/
git commit -m "feat(sim): add rule-engine data model + enums"
```

---

### Task 2: `CombatOps.ApplyDamageToGroups` + refactor front-row spread (behavior unchanged)

**Files:**
- Modify: `Assets/Ctxd/Battle/Sim/CombatOps.cs`
- Test: `Tests/CtxdSim.Tests/CombatOpsGroupTests.cs`
- Test: `Tests/CtxdSim.Tests/ApplyDamageToFrontCharacterizationTests.cs`

**Interfaces:**
- Produces: `int CombatOps.ApplyDamageToGroups(Combatant c, List<Group> groups, int amount, Distribution dist, int round, List<BattleEvent> ev)` — spreads `amount` across `groups` (capped at their total soldiers), `EvenByHp` = proportional, `FocusFrontFirst` = deplete first group then next; emits one `GroupKilled` per group that reaches 0; returns soldiers killed. Also private `int SpreadEven(List<Group> groups, int hit)` reused by `ApplyDamageToFront`.

- [ ] **Step 1: Write the characterization test (locks current front-row behavior)**

Create `Tests/CtxdSim.Tests/ApplyDamageToFrontCharacterizationTests.cs`:
```csharp
using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class ApplyDamageToFrontCharacterizationTests
    {
        static Combatant TwoRows(int perRow)
        {
            var c = new Combatant { Id = "t", DisplayName = "T", Faction = Faction.Defense };
            var r0 = new Row(); r0.Groups.Add(new Group { Troop = TroopType.ThuongBinh, MaxSoldiers = perRow, Soldiers = perRow });
            var r1 = new Row(); r1.Groups.Add(new Group { Troop = TroopType.CungBinh, MaxSoldiers = perRow, Soldiers = perRow });
            c.Formation.Add(r0); c.Formation.Add(r1); c.SyncTroops();
            return c;
        }

        [Fact]
        public void Partial_Hit_Front_Row_No_Kill()
        {
            var c = TwoRows(100); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToFront(c, 40, 1, ev);
            Assert.Equal(40, killed);
            Assert.Equal(60, c.Formation[0].Soldiers);
            Assert.Equal(100, c.Formation[1].Soldiers);
            Assert.Equal(160, c.Troops);
            Assert.DoesNotContain(ev, e => e.Type == BattleEventType.RowAdvanced);
        }

        [Fact]
        public void Exact_Front_Row_Clears_And_Advances()
        {
            var c = TwoRows(100); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToFront(c, 100, 1, ev);
            Assert.Equal(100, killed);
            Assert.Equal(0, c.Formation[0].Soldiers);
            Assert.Equal(100, c.Formation[1].Soldiers);
            Assert.Contains(ev, e => e.Type == BattleEventType.RowAdvanced);
        }

        [Fact]
        public void Overkill_Spills_To_Next_Row()
        {
            var c = TwoRows(100); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToFront(c, 250, 1, ev);
            Assert.Equal(200, killed);              // capped at total troops
            Assert.Equal(0, c.Troops);
            Assert.Equal(2, ev.FindAll(e => e.Type == BattleEventType.RowAdvanced).Count);
        }
    }
}
```

- [ ] **Step 2: Run to verify it passes against the CURRENT implementation**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter ApplyDamageToFrontCharacterizationTests`
Expected: PASS (3 tests) — this pins existing behavior before refactor.

- [ ] **Step 3: Write the failing test for the new primitive**

Create `Tests/CtxdSim.Tests/CombatOpsGroupTests.cs`:
```csharp
using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class CombatOpsGroupTests
    {
        static (Combatant c, Group g1, Group g2) OneRowTwoGroups(int a, int b)
        {
            var c = new Combatant { Id = "t", DisplayName = "T", Faction = Faction.Defense };
            var row = new Row();
            var g1 = new Group { Troop = TroopType.CungBinh, MaxSoldiers = a, Soldiers = a };
            var g2 = new Group { Troop = TroopType.ThuongBinh, MaxSoldiers = b, Soldiers = b };
            row.Groups.Add(g1); row.Groups.Add(g2);
            c.Formation.Add(row); c.SyncTroops();
            return (c, g1, g2);
        }

        [Fact]
        public void EvenByHp_Spreads_Proportionally()
        {
            var (c, g1, g2) = OneRowTwoGroups(60, 40); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToGroups(c, new List<Group> { g1, g2 }, 50, Distribution.EvenByHp, 1, ev);
            Assert.Equal(50, killed);
            Assert.Equal(30, g1.Soldiers);   // 50*60/100
            Assert.Equal(20, g2.Soldiers);   // 50*40/100
            Assert.Equal(50, c.Troops);
        }

        [Fact]
        public void FocusFrontFirst_Depletes_First_Group_Then_Next()
        {
            var (c, g1, g2) = OneRowTwoGroups(60, 40); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToGroups(c, new List<Group> { g1, g2 }, 80, Distribution.FocusFrontFirst, 1, ev);
            Assert.Equal(80, killed);
            Assert.Equal(0, g1.Soldiers);
            Assert.Equal(20, g2.Soldiers);
            var killEv = Assert.Single(ev, e => e.Type == BattleEventType.GroupKilled);
            Assert.Equal(TroopType.CungBinh, killEv.Troop);
        }

        [Fact]
        public void Amount_Capped_At_Group_Total()
        {
            var (c, g1, g2) = OneRowTwoGroups(10, 10); var ev = new List<BattleEvent>();
            int killed = CombatOps.ApplyDamageToGroups(c, new List<Group> { g1, g2 }, 999, Distribution.EvenByHp, 1, ev);
            Assert.Equal(20, killed);
            Assert.Equal(0, c.Troops);
        }
    }
}
```
*(Note: `Assert.Single(ev, predicate)` overload requires xunit 2.9; it exists. If unavailable, use `Assert.Contains`.)*

- [ ] **Step 4: Run to verify the new tests fail**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter CombatOpsGroupTests`
Expected: FAIL — `ApplyDamageToGroups` not defined.

- [ ] **Step 5: Implement `ApplyDamageToGroups` + extract `SpreadEven`; keep `ApplyDamageToFront` behavior**

In `Assets/Ctxd/Battle/Sim/CombatOps.cs`, add these methods to the `CombatOps` class:
```csharp
        /// <summary>Locate a group's (rowIndex, groupIndex) inside a combatant's formation (-1,-1 if absent).</summary>
        private static (int row, int grp) Locate(Combatant c, Group g)
        {
            for (int r = 0; r < c.Formation.Count; r++)
            {
                var row = c.Formation[r];
                for (int i = 0; i < row.Groups.Count; i++)
                    if (ReferenceEquals(row.Groups[i], g)) return (r, i);
            }
            return (-1, -1);
        }

        private static BattleEvent GroupKilledEvent(Combatant c, Group g, int round, int killedInGroup)
        {
            var (row, grp) = Locate(c, g);
            return new BattleEvent
            {
                Round = round, Type = BattleEventType.GroupKilled, Side = c.Faction, ActorId = c.Id,
                Amount = g.MaxSoldiers, RowIndex = row, GroupIndex = grp, Troop = g.Troop, SoldiersKilled = killedInGroup,
                Text = $"{c.DisplayName}: 1 nhóm {g.Troop} tan",
            };
        }

        /// <summary>Proportional even spread of <paramref name="hit"/> across living groups; returns actually removed.</summary>
        private static int SpreadEven(List<Group> groups, int hit)
        {
            int total = 0; foreach (var g in groups) if (g.Alive) total += g.Soldiers;
            if (total <= 0 || hit <= 0) return 0;
            if (hit > total) hit = total;
            int distributed = 0;
            foreach (var g in groups)
            {
                if (!g.Alive) continue;
                int share = (int)((long)hit * g.Soldiers / total);
                if (share > g.Soldiers) share = g.Soldiers;
                g.Soldiers -= share; distributed += share;
            }
            for (int i = 0; i < groups.Count && distributed < hit; i++)
            {
                var g = groups[i];
                if (!g.Alive && g.Soldiers <= 0) continue;
                int take = hit - distributed;
                if (take > g.Soldiers) take = g.Soldiers;
                g.Soldiers -= take; distributed += take;
            }
            return distributed;
        }

        /// <summary>
        /// Apply <paramref name="amount"/> to an arbitrary set of groups (capped at their living total).
        /// EvenByHp = proportional; FocusFrontFirst = deplete list order. Emits one GroupKilled per group that dies.
        /// Does NOT emit RowAdvanced (front-row-only concept) and does NOT spill beyond the given groups.
        /// </summary>
        public static int ApplyDamageToGroups(Combatant c, List<Group> groups, int amount, Distribution dist,
                                              int round, List<BattleEvent> ev)
        {
            if (groups == null || groups.Count == 0 || amount <= 0) return 0;
            // snapshot pre-hit soldiers to compute per-group killed
            var before = new int[groups.Count];
            for (int i = 0; i < groups.Count; i++) before[i] = groups[i].Soldiers;

            int killed;
            if (dist == Distribution.FocusFrontFirst)
            {
                int remaining = amount, done = 0;
                foreach (var g in groups)
                {
                    if (remaining <= 0) break;
                    if (!g.Alive) continue;
                    int take = remaining < g.Soldiers ? remaining : g.Soldiers;
                    g.Soldiers -= take; remaining -= take; done += take;
                }
                killed = done;
            }
            else killed = SpreadEven(groups, amount);

            if (ev != null)
                for (int i = 0; i < groups.Count; i++)
                {
                    var g = groups[i];
                    int lost = before[i] - g.Soldiers;
                    if (lost > 0 && !g.Alive) ev.Add(GroupKilledEvent(c, g, round, lost));
                }
            c.SyncTroops();
            return killed;
        }
```
Then **refactor** `ApplyDamageToFront` so its front-row proportional block reuses `SpreadEven` — replacing the inline distribution loop (`CombatOps.cs:42-58`) with a single call, keeping the surrounding row-loop, GroupKilled-per-row and RowAdvanced emission **exactly as before**:
```csharp
                int rowSoldiers = row.Soldiers;
                int hitRow = remaining < rowSoldiers ? remaining : rowSoldiers;
                SpreadEven(row.Groups, hitRow);     // was: the inline proportional + remainder loops
                remaining -= hitRow; killed += hitRow;
```
(Leave the `if (!row.Alive) { ... GroupKilled per group + RowAdvanced ... } else break;` block untouched.)

- [ ] **Step 6: Run all CombatOps tests (new + characterization)**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter CombatOps`
Then: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter ApplyDamageToFront`
Expected: PASS — new primitive works AND front-row behavior is unchanged.

- [ ] **Step 7: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/CombatOps.cs Tests/
git commit -m "feat(sim): ApplyDamageToGroups + extract SpreadEven (front-row behavior preserved)"
```

---

### Task 3: `CombatOps.KillGroups` + `SetGroupsToHpPct`

**Files:**
- Modify: `Assets/Ctxd/Battle/Sim/CombatOps.cs`
- Test: `Tests/CtxdSim.Tests/CombatOpsKillTests.cs`

**Interfaces:**
- Produces: `int CombatOps.KillGroups(Combatant c, List<Group> groups, int round, List<BattleEvent> ev)` (soldiers→0 per group, one GroupKilled each, returns total killed); `int CombatOps.SetGroupsToHpPct(Combatant c, List<Group> groups, double pct, int round, List<BattleEvent> ev)` (set each group to `max(1, round(MaxSoldiers*pct))` clamped ≤ current; returns removed).

- [ ] **Step 1: Write the failing test**

Create `Tests/CtxdSim.Tests/CombatOpsKillTests.cs`:
```csharp
using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class CombatOpsKillTests
    {
        static Combatant Mixed()
        {
            var c = new Combatant { Id = "t", DisplayName = "T", Faction = Faction.Defense };
            var row = new Row();
            row.Groups.Add(new Group { Troop = TroopType.ChienXa, MaxSoldiers = 50, Soldiers = 50 });
            row.Groups.Add(new Group { Troop = TroopType.CungBinh, MaxSoldiers = 50, Soldiers = 50 });
            c.Formation.Add(row); c.SyncTroops();
            return c;
        }

        [Fact]
        public void KillGroups_Zeroes_And_Emits()
        {
            var c = Mixed(); var ev = new List<BattleEvent>();
            var g = c.Formation[0].Groups[0]; // ChienXa
            int killed = CombatOps.KillGroups(c, new List<Group> { g }, 1, ev);
            Assert.Equal(50, killed);
            Assert.Equal(0, g.Soldiers);
            Assert.Equal(50, c.Troops);       // CungBinh untouched
            var e = Assert.Single(ev, x => x.Type == BattleEventType.GroupKilled);
            Assert.Equal(TroopType.ChienXa, e.Troop);
        }

        [Fact]
        public void SetGroupsToHpPct_Zero_Leaves_One()
        {
            var c = Mixed(); var ev = new List<BattleEvent>();
            var g = c.Formation[0].Groups[1]; // CungBinh 50
            int removed = CombatOps.SetGroupsToHpPct(c, new List<Group> { g }, 0.0, 1, ev);
            Assert.Equal(49, removed);
            Assert.Equal(1, g.Soldiers);
        }
    }
}
```

- [ ] **Step 2: Run to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter CombatOpsKillTests`
Expected: FAIL — methods not defined.

- [ ] **Step 3: Implement**

Add to `CombatOps`:
```csharp
        /// <summary>Instantly zero each group (soldiers→0); one GroupKilled per group. Returns soldiers removed.</summary>
        public static int KillGroups(Combatant c, List<Group> groups, int round, List<BattleEvent> ev)
        {
            if (groups == null || groups.Count == 0) return 0;
            int killed = 0;
            foreach (var g in groups)
            {
                if (g.Soldiers <= 0) continue;
                int lost = g.Soldiers; g.Soldiers = 0; killed += lost;
                if (ev != null) ev.Add(GroupKilledEvent(c, g, round, lost));
            }
            c.SyncTroops();
            return killed;
        }

        /// <summary>Set each group to max(1, round(MaxSoldiers*pct)), never above current. Returns soldiers removed.</summary>
        public static int SetGroupsToHpPct(Combatant c, List<Group> groups, double pct, int round, List<BattleEvent> ev)
        {
            if (groups == null || groups.Count == 0) return 0;
            if (pct < 0) pct = 0; if (pct > 1) pct = 1;
            int removed = 0;
            foreach (var g in groups)
            {
                int target = (int)System.Math.Round(g.MaxSoldiers * pct);
                if (target < 1) target = 1;
                if (target >= g.Soldiers) continue;
                removed += g.Soldiers - target; g.Soldiers = target;
            }
            c.SyncTroops();
            return removed;
        }
```

- [ ] **Step 4: Run to verify it passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter CombatOpsKillTests`
Expected: PASS (2 tests).

- [ ] **Step 5: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/CombatOps.cs Tests/
git commit -m "feat(sim): KillGroups + SetGroupsToHpPct primitives"
```

---

### Task 4: `BattleEvent` structured fields

**Files:**
- Modify: `Assets/Ctxd/Battle/Sim/BattleEvent.cs`
- Test: `Tests/CtxdSim.Tests/BattleEventFieldsTests.cs`

**Interfaces:**
- Produces: `BattleEvent.RowIndex` (int, default -1), `.GroupIndex` (int, default -1), `.Troop` (TroopType), `.SoldiersKilled` (int). (Already consumed by `GroupKilledEvent` in Task 2 — this task adds the fields and a direct test.)

- [ ] **Step 1: Write the failing test**

Create `Tests/CtxdSim.Tests/BattleEventFieldsTests.cs`:
```csharp
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class BattleEventFieldsTests
    {
        [Fact]
        public void Defaults_Are_NegativeOne_For_Indices()
        {
            var e = new BattleEvent();
            Assert.Equal(-1, e.RowIndex);
            Assert.Equal(-1, e.GroupIndex);
            Assert.Equal(0, e.SoldiersKilled);
        }
    }
}
```

- [ ] **Step 2: Run to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter BattleEventFieldsTests`
Expected: FAIL — fields missing (compile error). *(If Task 2 already forced these to exist, this test simply passes — that is acceptable; keep the test for regression.)*

- [ ] **Step 3: Add the fields**

In `Assets/Ctxd/Battle/Sim/BattleEvent.cs`, add to the `BattleEvent` class:
```csharp
        // Optional structured addressing (additive; wire ignores absent/default via NullValueHandling).
        public int RowIndex = -1;
        public int GroupIndex = -1;
        public TroopType Troop;
        public int SoldiersKilled;
```

- [ ] **Step 4: Run to verify it passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter BattleEventFieldsTests`
Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/BattleEvent.cs Tests/
git commit -m "feat(sim): add optional structured fields to BattleEvent"
```

---

### Task 5: `TargetResolver`

**Files:**
- Create: `Assets/Ctxd/Battle/Sim/Rules/TargetResolver.cs`
- Test: `Tests/CtxdSim.Tests/TargetResolverTests.cs`

**Interfaces:**
- Consumes: `TargetSelect`, `BattleState`, `Faction`, `SideState`, `Combatant`, `Row`, `Group`, `TroopMasks`.
- Produces: `List<(Combatant c, List<Group> groups)> TargetResolver.Resolve(TargetSelect s, BattleState state, Faction actorFaction)`.

- [ ] **Step 1: Write the failing test**

Create `Tests/CtxdSim.Tests/TargetResolverTests.cs`:
```csharp
using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class TargetResolverTests
    {
        static Combatant WithRows(string id, params TroopType[][] rows)
        {
            var c = new Combatant { Id = id, DisplayName = id, Faction = Faction.Defense };
            foreach (var r in rows)
            {
                var row = new Row();
                foreach (var t in r) row.Groups.Add(new Group { Troop = t, MaxSoldiers = 30, Soldiers = 30 });
                c.Formation.Add(row);
            }
            c.SyncTroops();
            return c;
        }

        static BattleState State(List<Combatant> def)
        {
            var s = new BattleState
            {
                Offense = new SideState { Faction = Faction.Offense },
                Defense = new SideState { Faction = Faction.Defense },
            };
            s.Offense.Queue.Add(new Combatant { Id = "off", Faction = Faction.Offense, Troops = 10, MaxTroops = 10 });
            foreach (var c in def) s.Defense.Queue.Add(c);
            return s;
        }

        [Fact]
        public void EnemyActive_FrontRow()
        {
            var d0 = WithRows("d0", new[] { TroopType.ThuongBinh, TroopType.CungBinh }, new[] { TroopType.KyBinh });
            var st = State(new List<Combatant> { d0 });
            var sel = new TargetSelect { Scope = TargetScope.EnemyActive, Rows = RowMode.FrontRow };
            var res = TargetResolver.Resolve(sel, st, Faction.Offense);
            Assert.Single(res);
            Assert.Equal(d0, res[0].c);
            Assert.Equal(2, res[0].groups.Count);   // only the front row's 2 groups
        }

        [Fact]
        public void EnemyAll_TroopFilter_CungBinh_Across_Rows()
        {
            var d0 = WithRows("d0", new[] { TroopType.CungBinh, TroopType.KyBinh }, new[] { TroopType.CungBinh });
            var d1 = WithRows("d1", new[] { TroopType.ChienXa });
            var st = State(new List<Combatant> { d0, d1 });
            var sel = new TargetSelect
            {
                Scope = TargetScope.EnemyAll, Rows = RowMode.AllRows,
                FilterByTroop = true, TroopMask = TroopMasks.Of(TroopType.CungBinh),
            };
            var res = TargetResolver.Resolve(sel, st, Faction.Offense);
            Assert.Equal(2, res.Count);
            Assert.Equal(2, res[0].groups.Count);   // d0 has 2 CungBinh groups
            Assert.Empty(res[1].groups);            // d1 has none
            Assert.All(res.SelectMany(r => r.groups), g => Assert.Equal(TroopType.CungBinh, g.Troop));
        }

        [Fact]
        public void MaxGroups_Caps_FrontToBack()
        {
            var d0 = WithRows("d0", new[] { TroopType.CungBinh, TroopType.CungBinh, TroopType.CungBinh });
            var st = State(new List<Combatant> { d0 });
            var sel = new TargetSelect { Scope = TargetScope.EnemyActive, Rows = RowMode.AllRows, MaxGroups = 2 };
            var res = TargetResolver.Resolve(sel, st, Faction.Offense);
            Assert.Equal(2, res[0].groups.Count);
        }
    }
}
```

- [ ] **Step 2: Run to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter TargetResolverTests`
Expected: FAIL — `TargetResolver` not defined.

- [ ] **Step 3: Implement**

Create `Assets/Ctxd/Battle/Sim/Rules/TargetResolver.cs`:
```csharp
using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Resolves a step's <see cref="TargetSelect"/> into (combatant, groups) — deterministic, front→back.</summary>
    public static class TargetResolver
    {
        public static List<(Combatant c, List<Group> groups)> Resolve(TargetSelect s, BattleState state, Faction actorFaction)
        {
            var result = new List<(Combatant, List<Group>)>();
            if (s == null || state == null) return result;
            var ally = state.Side(actorFaction);
            var enemy = state.Enemy(actorFaction);
            foreach (var c in SelectCombatants(s.Scope, ally, enemy))
            {
                if (c == null || !c.Alive) continue;
                result.Add((c, SelectGroups(s, c)));
            }
            return result;
        }

        static IEnumerable<Combatant> SelectCombatants(TargetScope scope, SideState ally, SideState enemy)
        {
            switch (scope)
            {
                case TargetScope.EnemyActive: return One(enemy?.Active);
                case TargetScope.EnemyAll:    return Living(enemy);
                case TargetScope.AllyAll:     return Living(ally);
                case TargetScope.AllySelf:
                case TargetScope.AllyActive:  return One(ally?.Active);
                default:                      return One(enemy?.Active);
            }
        }

        static IEnumerable<Combatant> One(Combatant c) { if (c != null) yield return c; }

        static IEnumerable<Combatant> Living(SideState side)
        {
            if (side == null) yield break;
            foreach (var c in side.Queue) if (c != null && c.Alive) yield return c;   // Queue order = deterministic
        }

        static List<Group> SelectGroups(TargetSelect s, Combatant c)
        {
            var rows = new List<Row>();
            var living = new List<Row>();
            foreach (var r in c.Formation) if (r.Alive) living.Add(r);
            switch (s.Rows)
            {
                case RowMode.FrontRow:   if (living.Count > 0) rows.Add(living[0]); break;
                case RowMode.FrontNRows: for (int i = 0; i < living.Count && i < Math.Max(1, s.RowCount); i++) rows.Add(living[i]); break;
                case RowMode.RowIndex:   if (s.RowIndexValue >= 0 && s.RowIndexValue < c.Formation.Count) rows.Add(c.Formation[s.RowIndexValue]); break;
                case RowMode.AllRows:    rows.AddRange(living); break;
            }
            var groups = new List<Group>();
            foreach (var r in rows)
                foreach (var g in r.Groups)
                    if (g.Alive && (!s.FilterByTroop || TroopMasks.Has(s.TroopMask, g.Troop)))
                        groups.Add(g);
            if (s.MaxGroups > 0 && groups.Count > s.MaxGroups) groups = groups.GetRange(0, s.MaxGroups);
            return groups;
        }
    }
}
```

- [ ] **Step 4: Run to verify it passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter TargetResolverTests`
Expected: PASS (3 tests).

- [ ] **Step 5: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/Rules/TargetResolver.cs Tests/
git commit -m "feat(sim): TargetResolver (scope/row/troop selection)"
```

---

### Task 6: `TacticContext.State` + `RuleConditions`

**Files:**
- Modify: `Assets/Ctxd/Battle/Sim/ITacticEffect.cs`
- Create: `Assets/Ctxd/Battle/Sim/Rules/RuleConditions.cs`
- Test: `Tests/CtxdSim.Tests/RuleConditionsTests.cs`

**Interfaces:**
- Produces: `TacticContext.State` (BattleState); `bool RuleConditions.Eval(RuleCondition cond, TacticContext c)`. Semantics: reference combatant = enemy Active (`c.State.Enemy(c.Actor.Faction).Active`). `Always`→true; `TargetHpBelowPct`/`AbovePct` compare `Troops/MaxTroops*100`; `ActorMoraleFull`→`Actor.Morale >= Cfg.MoraleFull`; `TerrainIs`→`c.Terrain==cond.Terrain`; `TargetTroopPresent`→enemy has a living group of `cond.Troop`; `Chance`→`c.Rng.Chance(cond.Value)`.

- [ ] **Step 1: Add `State` to `TacticContext`**

In `Assets/Ctxd/Battle/Sim/ITacticEffect.cs`, add to the `TacticContext` class (after `Events`):
```csharp
        public BattleState State;   // full battle state, for rule targeting (scope beyond the single Target)
```

- [ ] **Step 2: Write the failing test**

Create `Tests/CtxdSim.Tests/RuleConditionsTests.cs`:
```csharp
using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleConditionsTests
    {
        static TacticContext Ctx(int enemyTroops, int enemyMax, int actorMorale = 0)
        {
            var enemy = new Combatant { Id = "e", Faction = Faction.Defense, Troops = enemyTroops, MaxTroops = enemyMax };
            var erow = new Row(); erow.Groups.Add(new Group { Troop = TroopType.CungBinh, MaxSoldiers = enemyMax, Soldiers = enemyTroops });
            enemy.Formation.Add(erow);
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Troops = 10, MaxTroops = 10, Morale = actorMorale };
            var st = new BattleState
            {
                Offense = new SideState { Faction = Faction.Offense },
                Defense = new SideState { Faction = Faction.Defense },
            };
            st.Offense.Queue.Add(actor); st.Defense.Queue.Add(enemy);
            return new TacticContext { Actor = actor, Target = enemy, State = st, Cfg = new BattleConfig(), Rng = new DeterministicRng(1), Terrain = Terrain.Plain };
        }

        [Fact] public void Always_True() => Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.Always }, Ctx(50, 100)));

        [Fact]
        public void TargetHpBelowPct()
        {
            var c = Ctx(20, 100);
            Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetHpBelowPct, Value = 30 }, c));
            Assert.False(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetHpBelowPct, Value = 10 }, c));
        }

        [Fact]
        public void TargetTroopPresent()
        {
            var c = Ctx(50, 100);
            Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetTroopPresent, Troop = TroopType.CungBinh }, c));
            Assert.False(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TargetTroopPresent, Troop = TroopType.ChienXa }, c));
        }

        [Fact]
        public void TerrainIs()
        {
            var c = Ctx(50, 100);
            Assert.True(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TerrainIs, Terrain = Terrain.Plain }, c));
            Assert.False(RuleConditions.Eval(new RuleCondition { Kind = ConditionKind.TerrainIs, Terrain = Terrain.Water }, c));
        }
    }
}
```

- [ ] **Step 3: Run to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter RuleConditionsTests`
Expected: FAIL — `RuleConditions` not defined.

- [ ] **Step 4: Implement**

Create `Assets/Ctxd/Battle/Sim/Rules/RuleConditions.cs`:
```csharp
namespace Ctxd.Battle.Sim
{
    /// <summary>Deterministic predicate gates for rule steps. Reference target = enemy Active.</summary>
    public static class RuleConditions
    {
        public static bool Eval(RuleCondition cond, TacticContext c)
        {
            if (cond == null) return true;
            var enemy = c.State?.Enemy(c.Actor.Faction)?.Active;
            switch (cond.Kind)
            {
                case ConditionKind.Always: return true;
                case ConditionKind.TargetHpBelowPct: return enemy != null && HpPct(enemy) < cond.Value;
                case ConditionKind.TargetHpAbovePct: return enemy != null && HpPct(enemy) > cond.Value;
                case ConditionKind.ActorMoraleFull: return c.Actor != null && c.Cfg != null && c.Actor.Morale >= c.Cfg.MoraleFull;
                case ConditionKind.TerrainIs: return c.Terrain == cond.Terrain;
                case ConditionKind.TargetTroopPresent: return enemy != null && HasLivingTroop(enemy, cond.Troop);
                case ConditionKind.Chance: return c.Rng != null && c.Rng.Chance(cond.Value);
                default: return true;
            }
        }

        static double HpPct(Combatant c) => c.MaxTroops > 0 ? (double)c.Troops / c.MaxTroops * 100.0 : 0.0;

        static bool HasLivingTroop(Combatant c, TroopType t)
        {
            foreach (var r in c.Formation) foreach (var g in r.Groups) if (g.Alive && g.Troop == t) return true;
            return false;
        }
    }
}
```

- [ ] **Step 5: Run to verify it passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter RuleConditionsTests`
Expected: PASS (4 tests).

- [ ] **Step 6: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/ITacticEffect.cs Assets/Ctxd/Battle/Sim/Rules/RuleConditions.cs Tests/
git commit -m "feat(sim): TacticContext.State + RuleConditions"
```

---

### Task 7: `RuleActions`

**Files:**
- Create: `Assets/Ctxd/Battle/Sim/Rules/RuleActions.cs`
- Test: `Tests/CtxdSim.Tests/RuleActionsTests.cs`

**Interfaces:**
- Consumes: `CombatOps.ApplyDamageToGroups/KillGroups/SetGroupsToHpPct/TacticDamage/HealFront/GainMorale`, `TacticContext`.
- Produces: `void RuleActions.Apply(RuleAction a, TacticContext c, Combatant target, List<Group> groups)`. `Damage`→scaled `TacticDamage` via `ApplyDamageToGroups`; `InstantKill`→`KillGroups`; `SetToHpPct`→`SetGroupsToHpPct`; `Confuse`→set `target.ConfusedTurns` + event; `Pushback`→`ApplyDamageToGroups(PushbackTroops)` + event; `Heal`/`Buff`→`HealFront(target)` + event.

- [ ] **Step 1: Write the failing test**

Create `Tests/CtxdSim.Tests/RuleActionsTests.cs`:
```csharp
using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleActionsTests
    {
        static (TacticContext c, Combatant target, List<Group> groups) Setup(int soldiers)
        {
            var target = new Combatant { Id = "t", Faction = Faction.Defense };
            var row = new Row(); var g = new Group { Troop = TroopType.ChienXa, MaxSoldiers = soldiers, Soldiers = soldiers };
            row.Groups.Add(g); target.Formation.Add(row); target.SyncTroops();
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0) };
            var ctx = new TacticContext
            {
                Actor = actor, Target = target, Tactic = new TacticSpec { Kind = TacticEffectKind.Rule },
                Cfg = new BattleConfig(), Rng = new DeterministicRng(7), Terrain = Terrain.Plain,
                Round = 1, Events = new List<BattleEvent>(),
            };
            return (ctx, target, new List<Group> { g });
        }

        [Fact]
        public void InstantKill_Zeroes()
        {
            var (c, t, groups) = Setup(80);
            RuleActions.Apply(new RuleAction { Kind = ActionKind.InstantKill }, c, t, groups);
            Assert.Equal(0, t.Troops);
        }

        [Fact]
        public void Damage_Reduces()
        {
            var (c, t, groups) = Setup(5000);
            RuleActions.Apply(new RuleAction { Kind = ActionKind.Damage, PowerScale = 1.0, Dist = Distribution.EvenByHp }, c, t, groups);
            Assert.True(t.Troops < 5000);
        }

        [Fact]
        public void Confuse_Sets_Turns_And_Event()
        {
            var (c, t, groups) = Setup(50);
            RuleActions.Apply(new RuleAction { Kind = ActionKind.Confuse, ConfuseTurns = 2 }, c, t, groups);
            Assert.True(t.ConfusedTurns >= 2);
            Assert.Contains(c.Events, e => e.Type == BattleEventType.Confusion);
        }
    }
}
```

- [ ] **Step 2: Run to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter RuleActionsTests`
Expected: FAIL — `RuleActions` not defined.

- [ ] **Step 3: Implement**

Create `Assets/Ctxd/Battle/Sim/Rules/RuleActions.cs`:
```csharp
using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Applies one <see cref="RuleAction"/> to a resolved (target, groups) pair.</summary>
    public static class RuleActions
    {
        public static void Apply(RuleAction a, TacticContext c, Combatant target, List<Group> groups)
        {
            if (a == null || target == null) return;
            switch (a.Kind)
            {
                case ActionKind.Damage:
                {
                    if (groups == null || groups.Count == 0) return;
                    int baseDmg = CombatOps.TacticDamage(c.Actor, target, c.Tactic, c.EffMult, c.Awakened, c.Terrain, c.Cfg, c.Rng, out bool crit);
                    int dmg = Math.Max(1, (int)Math.Round(baseDmg * (a.PowerScale <= 0 ? 1.0 : a.PowerScale)));
                    int killed = CombatOps.ApplyDamageToGroups(target, groups, dmg, a.Dist, c.Round, c.Events);
                    CombatOps.GainMorale(target, c.Cfg.MoraleOnTakeDamage, c.Cfg, c.Round, c.Events);
                    c.Emit(CombatOps.DamageEvent(c.Round, c.Actor, target, killed, crit, c.Tactic.Kind));
                    break;
                }
                case ActionKind.InstantKill:
                    CombatOps.KillGroups(target, groups, c.Round, c.Events);
                    break;
                case ActionKind.SetToHpPct:
                    CombatOps.SetGroupsToHpPct(target, groups, a.HpPct, c.Round, c.Events);
                    break;
                case ActionKind.Confuse:
                    target.ConfusedTurns = Math.Max(target.ConfusedTurns, a.ConfuseTurns + 1);
                    c.Emit(new BattleEvent { Round = c.Round, Type = BattleEventType.Confusion, Side = c.Actor.Faction,
                        ActorId = c.Actor.Id, TargetId = target.Id, Amount = a.ConfuseTurns, Text = $"{target.DisplayName} bị Hỗn Loạn" });
                    break;
                case ActionKind.Pushback:
                    CombatOps.ApplyDamageToGroups(target, groups, Math.Max(0, a.PushbackTroops), a.Dist, c.Round, c.Events);
                    c.Emit(new BattleEvent { Round = c.Round, Type = BattleEventType.Pushback, Side = c.Actor.Faction,
                        ActorId = c.Actor.Id, TargetId = target.Id, Amount = a.PushbackTroops, Text = $"{target.DisplayName} bị đẩy lùi" });
                    break;
                case ActionKind.Heal:
                case ActionKind.Buff:
                {
                    int heal = (int)Math.Round(c.Actor.Stats.TacticAtk * (a.HealScale <= 0 ? 1.0 : a.HealScale));
                    CombatOps.HealFront(target, heal);
                    c.Emit(CombatOps.DamageEvent(c.Round, c.Actor, target, -heal, false, c.Tactic.Kind));
                    break;
                }
            }
        }
    }
}
```

- [ ] **Step 4: Run to verify it passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter RuleActionsTests`
Expected: PASS (3 tests).

- [ ] **Step 5: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/Rules/RuleActions.cs Tests/
git commit -m "feat(sim): RuleActions (damage/kill/status dispatch)"
```

---

### Task 8: `RuleEffect` interpreter + registry

**Files:**
- Create: `Assets/Ctxd/Battle/Sim/Rules/RuleEffect.cs`
- Modify: `Assets/Ctxd/Battle/Sim/TacticEffects.cs`
- Test: `Tests/CtxdSim.Tests/RuleEffectTests.cs`

**Interfaces:**
- Consumes: `TargetResolver`, `RuleConditions`, `RuleActions`, `TacticContext`, `TacticEffects.Register`.
- Produces: `RuleEffect : ITacticEffect` with `Kind => TacticEffectKind.Rule`; registered in `TacticEffects` static ctor. `null` Program falls back to `DamageEffect`.

- [ ] **Step 1: Write the failing test**

Create `Tests/CtxdSim.Tests/RuleEffectTests.cs`:
```csharp
using System.Collections.Generic;
using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleEffectTests
    {
        static Combatant Def(string id, params TroopType[] frontRow)
        {
            var c = new Combatant { Id = id, DisplayName = id, Faction = Faction.Defense };
            var row = new Row(); foreach (var t in frontRow) row.Groups.Add(new Group { Troop = t, MaxSoldiers = 40, Soldiers = 40 });
            c.Formation.Add(row); c.SyncTroops();
            return c;
        }

        [Fact]
        public void KillAll_ChienXa_Across_Whole_Enemy_Lineup()
        {
            var d0 = Def("d0", TroopType.ChienXa, TroopType.CungBinh);
            var d1 = Def("d1", TroopType.ChienXa);
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0) };
            var st = new BattleState { Offense = new SideState { Faction = Faction.Offense }, Defense = new SideState { Faction = Faction.Defense } };
            st.Offense.Queue.Add(actor); st.Defense.Queue.Add(d0); st.Defense.Queue.Add(d1);

            var prog = new TacticProgram();
            prog.Steps.Add(new RuleStep
            {
                Select = new TargetSelect { Scope = TargetScope.EnemyAll, Rows = RowMode.AllRows, FilterByTroop = true, TroopMask = TroopMasks.Of(TroopType.ChienXa) },
                Action = new RuleAction { Kind = ActionKind.InstantKill },
            });
            var tactic = new TacticSpec { Kind = TacticEffectKind.Rule, Program = prog };
            var ctx = new TacticContext { Actor = actor, Target = d0, Tactic = tactic, State = st, Cfg = new BattleConfig(), Rng = new DeterministicRng(1), Terrain = Terrain.Plain, Round = 1, Events = new List<BattleEvent>() };

            TacticEffects.Get(TacticEffectKind.Rule).Apply(ctx);

            Assert.Equal(0, d0.Formation[0].Groups[0].Soldiers); // ChienXa gone
            Assert.Equal(40, d0.Formation[0].Groups[1].Soldiers); // CungBinh intact
            Assert.Equal(0, d1.Troops);                           // d1 was all ChienXa
        }

        [Fact]
        public void Null_Program_Falls_Back_To_Damage()
        {
            var d0 = Def("d0", TroopType.ThuongBinh);
            var actor = new Combatant { Id = "a", Faction = Faction.Offense, Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0) };
            var st = new BattleState { Offense = new SideState { Faction = Faction.Offense }, Defense = new SideState { Faction = Faction.Defense } };
            st.Offense.Queue.Add(actor); st.Defense.Queue.Add(d0);
            var tactic = new TacticSpec { Kind = TacticEffectKind.Rule, Program = null, Power = 1.0 };
            var ctx = new TacticContext { Actor = actor, Target = d0, Tactic = tactic, State = st, Cfg = new BattleConfig(), Rng = new DeterministicRng(1), Terrain = Terrain.Plain, Round = 1, Events = new List<BattleEvent>() };
            TacticEffects.Get(TacticEffectKind.Rule).Apply(ctx);
            Assert.True(d0.Troops < 40);   // fell back to a normal damage hit on the front row
        }
    }
}
```

- [ ] **Step 2: Run to verify it fails**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter RuleEffectTests`
Expected: FAIL — `RuleEffect` not registered / not defined.

- [ ] **Step 3: Implement the interpreter**

Create `Assets/Ctxd/Battle/Sim/Rules/RuleEffect.cs`:
```csharp
namespace Ctxd.Battle.Sim
{
    /// <summary>Interprets a <see cref="TacticProgram"/> — the single strategy behind data-driven skills.</summary>
    public sealed class RuleEffect : ITacticEffect
    {
        private static readonly DamageEffect _fallback = new DamageEffect();
        public TacticEffectKind Kind => TacticEffectKind.Rule;

        public void Apply(TacticContext c)
        {
            var prog = c.Tactic?.Program;
            if (prog == null || prog.Steps == null || prog.Steps.Count == 0) { _fallback.Apply(c); return; }
            foreach (var step in prog.Steps)
            {
                if (step == null) continue;
                if (!RuleConditions.Eval(step.Condition, c)) continue;
                var targets = TargetResolver.Resolve(step.Select, c.State, c.Actor.Faction);
                foreach (var (combatant, groups) in targets)
                    RuleActions.Apply(step.Action, c, combatant, groups);
            }
        }
    }
}
```

- [ ] **Step 4: Register it**

In `Assets/Ctxd/Battle/Sim/TacticEffects.cs`, add to the static constructor (after `Register(new HealEffect());`):
```csharp
            Register(new RuleEffect());
```

- [ ] **Step 5: Run to verify it passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter RuleEffectTests`
Expected: PASS (2 tests).

- [ ] **Step 6: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/Rules/RuleEffect.cs Assets/Ctxd/Battle/Sim/TacticEffects.cs Tests/
git commit -m "feat(sim): RuleEffect interpreter + registry"
```

---

### Task 9: Wire `State` into cast sites + end-to-end + determinism

**Files:**
- Modify: `Assets/Ctxd/Battle/Sim/BattleRunner.cs:123-127` (CastTactic)
- Modify: `Server/BattleSession.cs:114-118` (UseSkill)
- Test: `Tests/CtxdSim.Tests/EndToEndRuleTests.cs`

**Interfaces:**
- Consumes: everything above.
- Produces: both cast sites set `State` on the `TacticContext`; a full-`StepRound` integration test and a determinism test.

- [ ] **Step 1: Set `State` in `BattleRunner.CastTactic`**

In `Assets/Ctxd/Battle/Sim/BattleRunner.cs`, in `CastTactic`, add `State = State,` to the `new TacticContext { ... }`:
```csharp
            TacticEffects.Get(tactic.Kind).Apply(new TacticContext
            {
                Actor = actor, Target = target, Tactic = tactic, Awakened = awakened, StanceMult = stanceMult,
                Terrain = State.Terrain, Round = State.Round, Rng = Rng, Cfg = _cfg, Events = ev, State = State,
            });
```

- [ ] **Step 2: Set `State` in `BattleSession.UseSkill`**

In `Server/BattleSession.cs`, in `UseSkill`, add `State = St,` to the `new TacticContext { ... }`:
```csharp
            TacticEffects.Get(tactic.Kind).Apply(new TacticContext
            {
                Actor = actor, Target = target, Tactic = tactic, Awakened = awakened,
                StanceMult = 1.0, Terrain = _terrain, Round = St.Round, Rng = _runner.Rng, Cfg = _cfg, Events = ev, State = St,
            });
```

- [ ] **Step 3: Write the failing end-to-end + determinism test**

Create `Tests/CtxdSim.Tests/EndToEndRuleTests.cs`:
```csharp
using System.Collections.Generic;
using System.Linq;
using Xunit;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Server;

namespace Ctxd.Tests
{
    public class EndToEndRuleTests
    {
        static Combatant Hero(string id, Faction f, TacticSpec skill2, params TroopType[] frontRow)
        {
            var c = new Combatant
            {
                Id = id, DisplayName = id, Faction = f, Troop = frontRow.Length > 0 ? frontRow[0] : TroopType.ThuongBinh,
                Stats = new GeneralStats(400, 250, 400, 230, 60, 0.0), MaxTroops = 0, Rows = 1, Skill2 = skill2,
            };
            var row = new Row(); foreach (var t in frontRow) row.Groups.Add(new Group { Troop = t, MaxSoldiers = 40, Soldiers = 40 });
            c.Formation.Add(row); c.SyncTroops(); c.MaxTroops = c.Troops;
            return c;
        }

        static TacticSpec KillAllChienXa() => new TacticSpec
        {
            Id = "phaxa", DisplayName = "Phá Xa Lệnh", Kind = TacticEffectKind.Rule,
            Program = Prog(new RuleStep
            {
                Select = new TargetSelect { Scope = TargetScope.EnemyAll, Rows = RowMode.AllRows, FilterByTroop = true, TroopMask = TroopMasks.Of(TroopType.ChienXa) },
                Action = new RuleAction { Kind = ActionKind.InstantKill },
            }),
        };
        static TacticProgram Prog(params RuleStep[] steps) { var p = new TacticProgram(); p.Steps.AddRange(steps); return p; }

        static BattleSetup Setup()
        {
            var off = Hero("off", Faction.Offense, KillAllChienXa(), TroopType.KyBinh);
            var def0 = Hero("def0", Faction.Defense, null, TroopType.ChienXa, TroopType.CungBinh);
            var def1 = Hero("def1", Faction.Defense, null, TroopType.ChienXa);
            return new BattleSetup
            {
                OffenseLineup = new List<Combatant> { off },
                DefenseLineup = new List<Combatant> { def0, def1 },
                Terrain = Terrain.Plain, Seed = 12345, Config = new BattleConfig(),
                OffenseNation = "A", DefenseNation = "B",
            };
        }

        [Fact]
        public void Skill_Kills_ChienXa_Across_Lineup_Through_Session()
        {
            var session = new BattleSession(Setup());
            session.Begin();
            session.TestApi(TestApiKind.UseSkill, Faction.Offense);   // offense casts its rule Skill2 (no morale/turn dependency)

            var snap = session.Snapshot();
            var chienXa = snap.Defense.Queue
                .SelectMany(c => c.Formation)
                .SelectMany(r => r.Groups)
                .Where(g => g.Troop == TroopType.ChienXa)
                .ToList();
            Assert.NotEmpty(chienXa);
            Assert.All(chienXa, g => Assert.Equal(0, g.Soldiers));
        }

        [Fact]
        public void Same_Seed_Produces_Identical_Event_Log()
        {
            List<BattleEvent> Run()
            {
                var s = new BattleSession(Setup());
                var ev = new List<BattleEvent>();
                ev.AddRange(s.Begin());
                ev.AddRange(s.TestApi(TestApiKind.UseSkill, Faction.Offense));
                ev.AddRange(s.TestApi(TestApiKind.Attack, Faction.Defense));
                return ev;
            }
            var a = Run(); var b = Run();
            Assert.Equal(a.Count, b.Count);
            for (int i = 0; i < a.Count; i++)
            {
                Assert.Equal(a[i].Type, b[i].Type);
                Assert.Equal(a[i].Amount, b[i].Amount);
                Assert.Equal(a[i].Troop, b[i].Troop);
            }
        }
    }
}
```
*(`TestApiKind` lives in `Ctxd.Battle.Sim.Net`; `BattleSession` in `Ctxd.Server` — both compiled into the test assembly. Verify `TestApiKind.UseSkill`/`.Attack` names against `Assets/Ctxd/Battle/Sim/Net/Protocol.cs` before running.)*

- [ ] **Step 4: Run to verify it fails, then passes**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj --filter EndToEndRuleTests`
Expected: initially FAIL if `State` not yet wired; after Steps 1-2 it PASSES (2 tests).

- [ ] **Step 5: Run the FULL suite**

Run: `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj`
Expected: PASS — all tests from Tasks 0-9 green.

- [ ] **Step 6: Commit**

```bash
git add Assets/Ctxd/Battle/Sim/BattleRunner.cs Server/BattleSession.cs Tests/
git commit -m "feat(sim): wire BattleState into cast sites + end-to-end & determinism tests"
```

---

## Self-Review (Plan 1)

- **Spec coverage:** §3 program model → Task 1; §5.1 resolver → Task 5; §5.2 CombatOps primitives → Tasks 2-3; §5.3 RuleEffect → Task 8; §5.4 TacticContext.State + cast sites → Tasks 6, 9; §6 event fields → Task 4; §4 conditions/actions → Tasks 6-7. Visual §7 and authoring §8 are **Plan 2**. Determinism §10 → Task 9. Testing §11 items 1-5 → Tasks 2-9.
- **Placeholder scan:** none — every step has full code/commands. One flagged verify note (TurnInput stance member) is a "confirm against real file" instruction, not a placeholder.
- **Type consistency:** `ApplyDamageToGroups`, `KillGroups`, `SetGroupsToHpPct`, `TargetResolver.Resolve`, `RuleConditions.Eval`, `RuleActions.Apply`, `TacticContext.State`, `BattleEvent.RowIndex/GroupIndex/Troop/SoldiersKilled`, `TacticSpec.Program`, `TroopMasks.Of/Has` — names identical across tasks.

**Pre-flight to verify at execution (cheap reads, not placeholders):** `GeneralStats` 6-arg constructor (confirmed via `Server/BattleSession.cs:184`), `BattleConfig` field names `MoraleFull`/`MoraleOnTakeDamage`/`MoraleAfterTacticReset` (confirmed via CombatOps/BattleRunner), `TestApiKind.UseSkill`/`.Attack` (confirmed via `BattleSession.TestApi` switch), and `BattleSnapshot.Defense.Queue[].Formation[].Groups[].{Troop,Soldiers}` (confirmed via `Net/Snapshots.cs`). Re-confirm only if these files changed.
