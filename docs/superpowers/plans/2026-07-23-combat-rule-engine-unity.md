# Combat Rule-Engine (Unity) Implementation Plan — PLAN 2/2

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.
>
> **Depends on Plan 1** (`2026-07-23-combat-rule-engine-sim.md`) being complete: `TacticProgram`, rule enums, `TacticSpec.Program`, `RuleEffect`, `TargetResolver` must exist.

**Goal:** Let designers author rule-based skills in the Unity Inspector (`TacticDefinition`), and give visual feedback for row damage via a per-row HP bar — without touching the existing sprite rendering.

**Architecture:** `TacticDefinition` gains a flat `[Serializable]` list of `RuleStepAuthoring` entries; `ToSpec()` builds a `TacticProgram` from them. A new procedural `RowHealthBar` MonoBehaviour is spawned once per rendered row in `BattleSideField.Build`, its fill driven by the row's `Soldiers/MaxSoldiers` from the snapshot. Sprite rendering (rebuild-per-snapshot) is unchanged.

**Tech Stack:** Unity (C#, UnityEngine), MCP for Unity (compile/console checks), existing `CtxdGameDatabase`/`VisualSpawner`/`BattleSideField`.

## Global Constraints

- **Authoring uses a flat `[System.Serializable]` class list** (NOT `[SerializeReference]`) so the Inspector renders it without a custom drawer (spec §14 open decision resolved: flat).
- Visual: **HP bar only.** Do NOT add sprite attrition / `PlayDie` / diff / identity maps. Sprite rendering stays as-is.
- HP bar is **built procedurally** (runtime `Texture2D`, like `UnitVisual.FallbackSprite()` at `Assets/Ctxd/Visual/UnitVisual.cs:62-72`) — no new prefab asset required.
- Backward compatible: a `TacticDefinition` with `useRuleProgram == false` behaves exactly as today.
- No Unity EditMode/PlayMode test harness exists; verify via **MCP for Unity** compile/console checks + a manual Play-mode look. Each task must compile cleanly (zero Console errors) before commit.

## File Structure

- Modify: `Assets/Ctxd/Data/TacticDefinition.cs` — add authoring fields + build `Program` in `ToSpec()`.
- Create: `Assets/Ctxd/Data/RuleStepAuthoring.cs` — `[Serializable]` flat authoring row + `ToRuleStep()`.
- Create: `Assets/Ctxd/Visual/RowHealthBar.cs` — procedural per-row HP bar component.
- Modify: `Assets/Ctxd/Battle/BattleSideField.cs` — spawn a `RowHealthBar` per rendered row in `Build`.

---

### Task 1: `RuleStepAuthoring` + `TacticDefinition` rule authoring

**Files:**
- Create: `Assets/Ctxd/Data/RuleStepAuthoring.cs`
- Modify: `Assets/Ctxd/Data/TacticDefinition.cs`

**Interfaces:**
- Consumes (from Plan 1): `TacticProgram`, `RuleStep`, `TargetSelect`, `RuleCondition`, `RuleAction`, `TroopMasks`, all rule enums, `TacticEffectKind.Rule`.
- Produces: `[Serializable] RuleStepAuthoring` with `RuleStep ToRuleStep()`; `TacticDefinition.useRuleProgram` (bool) + `ruleSteps` (List<RuleStepAuthoring>); `ToSpec()` sets `Kind = Rule` and builds `Program` when `useRuleProgram`.

- [ ] **Step 1: Create the authoring row type**

Create `Assets/Ctxd/Data/RuleStepAuthoring.cs`:
```csharp
using System;
using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;

namespace Ctxd.Data
{
    /// <summary>Inspector-authorable form of one rule step (flat fields → sim <see cref="RuleStep"/>).</summary>
    [Serializable]
    public sealed class RuleStepAuthoring
    {
        [Header("Select — combatants & groups")]
        public TargetScope scope = TargetScope.EnemyActive;
        public RowMode rows = RowMode.FrontRow;
        [Min(1)] public int rowCount = 1;
        [Min(0)] public int rowIndexValue = 0;
        public bool filterByTroop = false;
        public List<TroopType> troopFilter = new List<TroopType>();   // OR-ed into a mask
        [Min(0)] public int maxGroups = 0;

        [Header("Condition — gate (optional)")]
        public ConditionKind conditionKind = ConditionKind.Always;
        public float conditionValue = 0f;
        public Terrain conditionTerrain = Terrain.Plain;
        public TroopType conditionTroop = TroopType.CungBinh;

        [Header("Action")]
        public ActionKind actionKind = ActionKind.Damage;
        public float powerScale = 1f;
        public Distribution dist = Distribution.EvenByHp;
        public float hpPct = 0f;
        public int confuseTurns = 1;
        public int pushbackTroops = 0;
        public float healScale = 1f;

        public RuleStep ToRuleStep() => new RuleStep
        {
            Select = new TargetSelect
            {
                Scope = scope, Rows = rows, RowCount = rowCount, RowIndexValue = rowIndexValue,
                FilterByTroop = filterByTroop,
                TroopMask = troopFilter != null ? TroopMasks.Of(troopFilter.ToArray()) : 0,
                MaxGroups = maxGroups,
            },
            Condition = new RuleCondition
            {
                Kind = conditionKind, Value = conditionValue, Terrain = conditionTerrain, Troop = conditionTroop,
            },
            Action = new RuleAction
            {
                Kind = actionKind, PowerScale = powerScale, Dist = dist, HpPct = hpPct,
                ConfuseTurns = confuseTurns, PushbackTroops = pushbackTroops, HealScale = healScale,
            },
        };
    }
}
```

- [ ] **Step 2: Add authoring fields + program build to `TacticDefinition`**

In `Assets/Ctxd/Data/TacticDefinition.cs`, add fields (after the `[Header("Effect params")]` block):
```csharp
        [Header("Rule Program (bật để dùng rule-engine data-driven; để tắt = giữ Kind legacy)")]
        public bool useRuleProgram = false;
        public List<RuleStepAuthoring> ruleSteps = new List<RuleStepAuthoring>();
```
Add `using System.Collections.Generic;` at the top if missing. Then, in `ToSpec()`, build the program. Replace the current `return new TacticSpec { ... };` with:
```csharp
            var spec = new TacticSpec
            {
                Id = Id,
                DisplayName = string.IsNullOrEmpty(displayName) ? name : displayName,
                Kind = useRuleProgram ? TacticEffectKind.Rule : kind,
                RowsHit = rowsHit,
                Power = power,
                IsAwakening = isAwakening,
                FixedPower = fixedPower,
                ConfusionTurns = confusionTurns,
                PushbackTroops = pushbackTroops,
                SkillAnimId = castEffect != null ? castEffect.sourceId : null,
                NameBannerId = nameBanner != null ? nameBanner.name : null,
            };
            if (useRuleProgram && ruleSteps != null && ruleSteps.Count > 0)
            {
                spec.Program = new TacticProgram();
                foreach (var s in ruleSteps) if (s != null) spec.Program.Steps.Add(s.ToRuleStep());
            }
            return spec;
```

- [ ] **Step 3: Compile in Unity, check Console**

In the MCP for Unity session: run `mcp__unityMCP__refresh_unity`, then `mcp__unityMCP__read_console` with `types: ["Error"]`.
Expected: no compile errors referencing `TacticDefinition.cs` / `RuleStepAuthoring.cs`. Poll `editor_state.isCompiling` until false first.

- [ ] **Step 4: Manual smoke — author a sample rule skill**

In Unity: create a `TacticDefinition` asset (menu `CTXD ▸ Tactic`), name it `Tactic_PhaXa`. Tick `useRuleProgram`, add one `ruleSteps` entry: scope=`EnemyAll`, rows=`AllRows`, filterByTroop=✓, troopFilter=[`ChienXa`], actionKind=`InstantKill`. Save.
Verify: the Inspector renders all authoring fields; no errors on save.

- [ ] **Step 5: Commit**

```bash
git add Assets/Ctxd/Data/RuleStepAuthoring.cs Assets/Ctxd/Data/TacticDefinition.cs
git commit -m "feat(data): author rule programs on TacticDefinition"
```

---

### Task 2: `RowHealthBar` component

**Files:**
- Create: `Assets/Ctxd/Visual/RowHealthBar.cs`

**Interfaces:**
- Produces: `RowHealthBar` MonoBehaviour with `void SetRatio(float ratio)`, `void SetSortingOrder(int order)`, and a static factory `RowHealthBar Create(Transform parent, Vector3 localPos, float width)`.

- [ ] **Step 1: Implement the component (procedural sprite, no prefab)**

Create `Assets/Ctxd/Visual/RowHealthBar.cs`:
```csharp
using UnityEngine;

namespace Ctxd.Visual
{
    /// <summary>A thin per-row HP bar built procedurally (background + fill), driven by a 0..1 ratio.</summary>
    [DisallowMultipleComponent]
    public sealed class RowHealthBar : MonoBehaviour
    {
        private SpriteRenderer _bg, _fill;
        private float _width = 0.9f;
        private const float Height = 0.10f;

        private static Sprite _sprite;
        private static Sprite WhiteSprite()
        {
            if (_sprite != null) return _sprite;
            var tex = new Texture2D(1, 1, TextureFormat.RGBA32, false) { filterMode = FilterMode.Point };
            tex.SetPixel(0, 0, Color.white); tex.Apply();
            _sprite = Sprite.Create(tex, new Rect(0, 0, 1, 1), new Vector2(0f, 0.5f), 100f); // left-anchored → scale.x = fill
            _sprite.name = "RowHpBarPixel";
            return _sprite;
        }

        public static RowHealthBar Create(Transform parent, Vector3 localPos, float width)
        {
            var go = new GameObject("RowHealthBar");
            go.transform.SetParent(parent, false);
            go.transform.localPosition = localPos;
            var bar = go.AddComponent<RowHealthBar>();
            bar._width = Mathf.Max(0.1f, width);
            bar.BuildRenderers();
            return bar;
        }

        private void BuildRenderers()
        {
            _bg = MakeQuad("bg", new Color(0f, 0f, 0f, 0.6f), -1);
            _fill = MakeQuad("fill", new Color(0.85f, 0.15f, 0.15f, 0.95f), 0);
            // background spans full width, anchored left; center it by shifting half width
            _bg.transform.localPosition = new Vector3(-_width * 0.5f, 0f, 0f);
            _bg.transform.localScale = new Vector3(_width, Height, 1f);
            _fill.transform.localPosition = new Vector3(-_width * 0.5f, 0f, 0f);
            _fill.transform.localScale = new Vector3(_width, Height * 0.8f, 1f);
            SetRatio(1f);
        }

        private SpriteRenderer MakeQuad(string n, Color color, int localOrder)
        {
            var go = new GameObject(n);
            go.transform.SetParent(transform, false);
            var sr = go.AddComponent<SpriteRenderer>();
            sr.sprite = WhiteSprite();
            sr.color = color;
            sr.sortingOrder = localOrder;
            return sr;
        }

        public void SetRatio(float ratio)
        {
            ratio = Mathf.Clamp01(ratio);
            if (_fill != null)
            {
                var s = _fill.transform.localScale; s.x = _width * ratio; _fill.transform.localScale = s;
            }
        }

        public void SetSortingOrder(int order)
        {
            if (_bg != null) _bg.sortingOrder = order;
            if (_fill != null) _fill.sortingOrder = order + 1;
        }
    }
}
```

- [ ] **Step 2: Compile in Unity, check Console**

Run `mcp__unityMCP__refresh_unity`; poll `editor_state.isCompiling` false; `mcp__unityMCP__read_console` `types: ["Error"]`.
Expected: no errors referencing `RowHealthBar.cs`.

- [ ] **Step 3: Commit**

```bash
git add Assets/Ctxd/Visual/RowHealthBar.cs
git commit -m "feat(visual): procedural RowHealthBar component"
```

---

### Task 3: Spawn a `RowHealthBar` per row in `BattleSideField.Build`

**Files:**
- Modify: `Assets/Ctxd/Battle/BattleSideField.cs`

**Interfaces:**
- Consumes: `RowHealthBar.Create/SetRatio/SetSortingOrder`, `RowSnapshot` (`Soldiers`/`MaxSoldiers` per group).
- Produces: one HP bar above each living row, cleared with the field.

- [ ] **Step 1: Track bars for cleanup**

In `Assets/Ctxd/Battle/BattleSideField.cs`, add a field next to `_units`:
```csharp
        private readonly List<RowHealthBar> _bars = new List<RowHealthBar>();
```
Add `using Ctxd.Visual;` if not already imported (it is — `UnitVisual` is used).

- [ ] **Step 2: Spawn the bar in the row loop**

In `Build`, inside the `for (int r = 0; ...)` loop, AFTER the `for (int gi = 0; ...)` group loop closes and BEFORE `rowSlot++;`, insert:
```csharp
                // Per-row HP bar (snapshot-driven): fill = rowSoldiers / rowMaxSoldiers, above the row.
                int rowMax = 0; foreach (var gg in row.Groups) rowMax += gg.MaxSoldiers;
                Vector2 rowCenter = rowAxis * rowSlot;
                var barPos = new Vector3(rowCenter.x, rowCenter.y + 0.55f, 0f);
                var bar = RowHealthBar.Create(transform, barPos, 0.9f);
                bar.SetRatio(rowMax > 0 ? (float)rowSoldiers / rowMax : 0f);
                int barOrder = 700 - Mathf.RoundToInt((transform.position.y + barPos.y) * 50f);
                bar.SetSortingOrder(barOrder);
                _bars.Add(bar);
```

- [ ] **Step 3: Clear bars in `Clear()`**

In `Clear()`, add before/after the `_units` cleanup:
```csharp
            foreach (var b in _bars) if (b != null) Destroy(b.gameObject);
            _bars.Clear();
```

- [ ] **Step 4: Compile in Unity, check Console**

Run `mcp__unityMCP__refresh_unity`; poll `isCompiling` false; `mcp__unityMCP__read_console` `types: ["Error"]`.
Expected: no errors.

- [ ] **Step 5: Play-mode visual verification**

Enter Play mode (start the local server scene as the project normally does, or `mcp__unityMCP__manage_editor` play). Observe a battle: each rendered row shows a red HP bar above it; when a row takes damage across snapshots, its bar shortens; when a row is wiped, its bar disappears with the row. Capture a screenshot (`mcp__unityMCP__manage_editor`/game-view capture, or the `run` skill).
Expected: bars visible and tracking row HP; no per-sprite death animation (by design).

- [ ] **Step 6: Commit**

```bash
git add Assets/Ctxd/Battle/BattleSideField.cs
git commit -m "feat(visual): per-row HP bar in BattleSideField"
```

---

## Self-Review (Plan 2)

- **Spec coverage:** §8 authoring (SO → Program) → Task 1; §7 HP bar (`RowHealthBar` + `Build` spawn + `Clear`) → Tasks 2-3. §7.3 optional flash is explicitly out of v1.
- **Placeholder scan:** none — full code for every file. Play-mode step describes concrete observable outcomes.
- **Type consistency:** `RowHealthBar.Create/SetRatio/SetSortingOrder`, `RuleStepAuthoring.ToRuleStep`, `TacticDefinition.useRuleProgram/ruleSteps` — consistent within this plan and with Plan 1's `TacticProgram`/`RuleStep`/rule enums/`TroopMasks`.

**Pre-flight to verify at execution:** confirm `TacticDefinition.ToSpec()` current body matches the snippet being replaced (it may have been edited); confirm `BattleSideField.Build` local variable names (`rowAxis`, `rowSlot`, `rowSoldiers`, `row`) are in scope at the insertion point (they are per `BattleSideField.cs:47-83`); confirm a Unity instance is connected for MCP compile checks (else open the project).
