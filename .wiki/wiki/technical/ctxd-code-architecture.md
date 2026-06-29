---
title: CTXD Game Code — Architecture (Assets/Ctxd)
category: technical
tags: [ctxd, architecture, scriptableobject, battle, view, prefab, code]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# CTXD Game Code — Architecture

The first gameplay code for the client, under **`Assets/Ctxd/`** (namespace root `Ctxd`). Built on the surviving Luzart framework ([[technical/luzart-framework]]) and the owner's preference: **anything visual = a ScriptableObject → ref to a prefab → the prefab holds sprite/visual/animation → spawn the prefab.** Implements the battle vertical slice ([[systems/battle-system]]) end-to-end.

> [!info] Build status (2026-06-29)
> All code compiles **0 errors** (runtime + Editor), verified offline with Unity's bundled Roslyn (see memory `offline-compile-verify`). The battle resolver is verified by a standalone smoke test (determinism, stance triangle, win/lose, morale→skill2). **Asset generation + Play-test require the Unity Editor** (the MCP was disconnected this session and the project is locked by the open Editor) — they are one menu click: **CTXD ▸ Build Everything**. See [[#How to run]].

## Layers (dependency order)

| Layer | Folder | Depends on | Role |
|---|---|---|---|
| **1. Sim** | `Ctxd/Battle/Sim` | *pure C#* (no UnityEngine) | Deterministic battle engine + event log. Unit-testable / server-portable. |
| **2. Data** | `Ctxd/Data` | Sim, Luzart `AbstractScriptableContent` | Authoring SOs: General/Troop/Tactic/Formation/UnitVisual/EffectVisual/Config + database. |
| **3. AssetForge** | `Ctxd/Editor` | Data, View, UnityEditor | TASK 1 generator: sprites → AnimationClips + Controllers + prefabs + visual SOs. |
| **4. View** | `Ctxd/View`, `Ctxd/Battle` | Sim, Data, Luzart `ViewT` | Spawnable visuals + presenter that plays the event log. |
| **5. UI** | `Ctxd/UI` | Sim, Data | Coded uGUI battle HUD (stance wheel, portraits, bars). |
| **6. Bootstrap** | `Ctxd/CtxdBootstrap.cs`, `Ctxd/Editor` | all | Composition root + sample-content generator + Battle scene. |

## 1. Battle simulation (`Ctxd.Battle.Sim`) — the brain
Pure C#, **no UnityEngine** (so it compiles & runs standalone, and can later run server-side unchanged).
- **`BattleRunner`** — the engine. `Begin()` then `StepRound(TurnInput)` per turn; returns a `List<BattleEvent>`. Models GDD §3: queue of generals (one Active per side duels), 3-stance triangle (`StanceRules`: 突击›攻击›防守›突击), morale 50→100→skill2, tactic effects (Damage/AoE/Confusion/InstantTo1Hp/Pushback/Buff/Heal), awakening (unblockable/fixed), terrain affinity, deterministic RNG (`DeterministicRng` xorshift).
- **`BattleResolver.ResolveAll`** — runs a whole battle with two `IBattleBrain`s (PvE auto / replay / tests).
- **`BattleConfig`** — every tuning knob (stance %, crit, morale, variance…). Mirrored by `BattleConfigDefinition` SO.
- Output **`BattleEvent`** log is the single source of truth the client renders — it never recomputes numbers ([[technical/client-server-architecture]], server-authoritative).

## 2. Data (`Ctxd.Data`) — ScriptableObjects
All inherit **`CtxdDefinition : AbstractScriptableContent`** (Luzart DI/lifecycle; id falls back to asset name).
- **`GeneralDefinition`** → `ToCombatant(faction,id)` builds a sim `Combatant`. Holds stats, troopType, skill1/2 (TacticDefinition), portrait, formation, quality, fiveStar/awaken.
- **`TroopTypeDefinition`** → links sim `TroopType` to a **`UnitVisualDefinition`**.
- **`UnitVisualDefinition`** ⭐ — the SO→prefab link: `attackPrefab`/`defensePrefab` (the generated unit prefabs) + `unitId`.
- **`TacticDefinition`** → `ToSpec()` builds a sim `TacticSpec`; refs cast VFX (`EffectVisualDefinition`) + name banner.
- **`FormationDefinition`** — rows with default/engaged `RowShape`, stat multipliers, favoured troops (data-driven, GDD §6).
- **`CtxdGameDatabase`** — id→definition registry (`GetGeneral/GetTactic/GetUnitVisual/...`), built by AssetForge, lives in `Assets/Ctxd/Resources` so the bootstrap can `Resources.Load` it.
- **`BattleSetupBuilder`** — bridges lineups of `GeneralDefinition` → a sim `BattleSetup`.

## 4. View & presentation (`Ctxd.View`, `Ctxd.Battle`)
- **`UnitView : ViewT<UnitRuntime>`** — root of every unit prefab (SpriteRenderer + Animator). Plays the baked frame-by-frame Unity AnimationClips via the Animator; **falls back to `SpriteFramePlayer`** (loads frames from Resources) when no baked controller exists — so the battle renders even before AssetForge runs.
- **`UnitFormationView`** — spawns a general's grid of unit prefabs from its `UnitVisualDefinition` (Instantiate → `Setup`). The owner's SO→prefab→spawn pattern in action.
- **`EffectView`** / **`FloatingText`** — one-shot VFX & rising damage numbers.
- **`BattlePresenter`** — owns the runner, spawns formations isometrically (Công lower-left, Thủ upper-right), and **plays the event log** as coroutines: attack→hurt→damage numbers→morale→defeat→engage-next, updating bars and spawning effects.

## 5. UI (`Ctxd.UI`)
- **`BattleHud`** — the customer HUD ([[sources/customer-battle-ui-spec-2026-06-27]]) built entirely in code (no prefab/scene authoring): two portraits with HP+morale bars, centre-bottom **stance wheel** (突击/攻击/防守 + 觉 centre) with countdown + Auto fallback, command menu, event banner, result panel. `UiBuilder` = uGUI construction helpers.
> [!info] The HUD is intentionally a self-contained coded uGUI rather than a LuzartUI `UIBase` screen — robust without a play-test and without editing Luzart's `UIId` enum. Migrating it into LuzartUI is a clean follow-up (the HUD logic is already isolated). [[decisions/ctxd-implementation-2026-06-29]].

## 6. Bootstrap & sample content
- **`CtxdBootstrap`** (composition root, replaces the removed `SceneRootManager`): loads the database, builds a Luzart `Domain`, creates camera/background/HUD/presenter and starts a sample battle. Drop into a scene → Play.
- **`SampleContentForge`** (Editor): authors 5 troop types, 6 tactics, 6 generals (Quan Vũ, Triệu Vân, Trương Phi, Lữ Bố, Chu Du, Cam Ninh), 3 formations, config, background; rebuilds the DB; creates `Assets/Ctxd/Scenes/Battle.unity`.

## How to run
1. **Focus the Unity Editor** (it compiles the new scripts) — or reconnect the [[unity-mcp-install|Unity MCP]].
2. Menu **CTXD ▸ Build Everything (Forge + Sample + Scene)** — forges all unit/effect animations+prefabs+visual SOs (Task 1), creates sample content, rebuilds the database, writes the Battle scene.
3. Open **`Assets/Ctxd/Scenes/Battle.unity`** and press **Play** — a 3v3 turn-based battle plays out with the stance wheel, frame-by-frame unit animations, skill casts and floating damage.
   - (Granular menus also exist: CTXD ▸ Forge ▸ … and CTXD ▸ Sample ▸ …)

## Extending (where each system plugs in)
- New general/troop/tactic/formation → create the SO (CTXD menu in CreateAssetMenu), it auto-joins the DB on rebuild.
- New troop visual → drop sprites under `Resources/sprite/army/{att,def}/<id>` and re-run AssetForge.
- Economy / world-map / equipment systems → add SOs (`AbstractScriptableContent`) + a service on the `Domain`, reuse `ViewT`/`UIBase` for screens. The battle event-log pattern generalises to any server-driven sequence.

---
## Backlinks
- [[technical/luzart-framework]] — framework this builds on
- [[systems/battle-system]] — the modelled mechanics
- [[technical/asset-generation-pipeline]] — Task 1 generator detail
- [[technical/client-server-architecture]] — event-log / server-authoritative rationale
- [[decisions/ctxd-implementation-2026-06-29]] — implementation decisions
