---
title: CTXD gameplay implementation — decisions (2026-06-29)
category: decisions
tags: [ctxd, battle, scriptableobject, animation, architecture, decision]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

## CTXD battle vertical slice + asset pipeline — implementation decisions

**Date**: 2026-06-29
**Decided by**: Claude (autonomous overnight build, per owner's two tasks) + owner's stated preferences
**Status**: active

### Context
Owner asked (while asleep) to: **(Task 1)** turn all Unity sprite assets into frame-by-frame Unity animations + prefabs + wired components, and **(Task 2)** read the project's code orientation and implement the game, with the orientation "visual = ScriptableObject → ref prefab → prefab holds sprite/visual/animation → spawn prefab". Constraints discovered: Luzart had just been trimmed to compile (DataResources, SceneRootManager, Universe, ThanhDemo removed — [[decisions/luzart-compile-cleanup-2026-06-29]]); Unity MCP was disconnected and the Editor held the project lock, so the Editor could not be driven this session.

### Options considered
1. **Hand-author `.anim`/`.prefab`/`.asset` YAML directly** (no Editor) — pros: produces assets without the Editor. Cons: ~2000 frames; sprite sub-asset fileIDs + GUIDs + AnimationClip/AnimatorController YAML are extremely error-prone and version-fragile → high risk of broken imports. **Rejected.**
2. **C# Editor generator (AssetForge) + offline-compile-verify the code** (chosen) — pros: correct, idempotent, re-runnable, one click / CLI; matches owner's SO→prefab pattern; all logic verifiable offline. Cons: final asset bake + Play-test need the owner to focus the Editor (one click).

### Decision
Chose (2), with these supporting choices:
- **Battle resolver = pure-C# deterministic engine emitting a `BattleEvent` log** (`Ctxd.Battle.Sim`, no UnityEngine). Client renders the log, never recomputes — ready for the server-authoritative split ([[technical/client-server-architecture]]). Verified by a standalone smoke test (determinism, stance triangle 突击›攻击›防守, morale→skill2, win/lose, no negative troops, stance advantage 40/40 vs 0/40).
- **Visual pattern = `UnitVisualDefinition` (SO) → generated unit prefab (SpriteRenderer + Animator + `UnitView : ViewT<T>`) → spawn via Instantiate+Setup** — exactly the owner's preference, reusing Luzart's `ViewT`.
- **Frame-by-frame = real Unity `AnimationClip`s + `AnimatorController`s** baked by AssetForge (owner asked for "Unity animation, frame-by-frame"), with a runtime `SpriteFramePlayer` fallback so the battle renders before baking.
- **Own bootstrap** (`CtxdBootstrap`) since `SceneRootManager` was removed.
- **HUD as self-contained coded uGUI** rather than a LuzartUI `UIBase` screen — robust without a play-test and without editing Luzart's `UIId` enum; migration to LuzartUI is an isolated follow-up.
- **New code isolated under `Assets/Ctxd/`** (namespace `Ctxd`), monolithic Assembly-CSharp (no asmdef, matching the project).

### Consequences
- All code compiles 0 errors (runtime + Editor), offline-verified. Battle logic verified by execution.
- **Pending owner action (one click):** focus the Editor (or reconnect Unity MCP), run **CTXD ▸ Build Everything**, open `Assets/Ctxd/Scenes/Battle.unity`, press Play. Asset bake + visual play-test were NOT done this session (no Editor access) — not claimed as verified.
- Many GDD unknowns (exact stance %, terrain %, crit, awakening rates) are exposed as tunable `BattleConfig`/SO fields, not hard-coded — see ❓ in [[open-questions]].
- Frame pivot/alignment for army sprites needs one in-editor eyeball (see [[technical/asset-generation-pipeline]]).
- Scope delivered = the **battle vertical slice** (core loop) + the **full Task-1 generator**; other systems (economy, world map, equipment, multiplayer) are scaffolded by the SO+service+event-log patterns and remain to build.

---
## Backlinks
- [[technical/ctxd-code-architecture]]
- [[technical/asset-generation-pipeline]]
- [[decisions/luzart-compile-cleanup-2026-06-29]] — framework state this built on
- [[systems/battle-system]]
