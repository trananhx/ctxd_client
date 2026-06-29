---
title: Log
category: log
created: 2026-06-27
updated: 2026-06-27
---

# ctxd_client — Log

Chronological record of all wiki operations.

## [2026-06-27] init | Wiki initialized
- Created `.wiki/` structure inside project folder
- Added to qmd collection: `ctxd-client`
- Detected project: Unity 6.5 (6000.5.1f1), URP 17.5, 2D toolchain (Aseprite/PSD/SpriteShape/Tilemap), new Input System
- Seeded [[overview]] and [[technical/asset-pipeline]] from a read of `Assets/` (sprites, packages, ProjectSettings)
- Ready for first source ingest (GDD → `raw/gdd/`)

## [2026-06-27] research+ingest | Game identified & 攻城掠地 documented
- Identified the game: recreation of **Công Thành Xưng Đế / 攻城掠地** (傲世堂 webgame, 2013) — confirmed by user + asset evidence
- Ran multi-agent web research (12 systems, VN+CN sources, adversarial verification) → [[sources/ctxd-web-research-2026-06-27]]
- Surfaced critical 3-game disambiguation (webgame vs 2019 VGP mobile vs 乱世曹操传) → [[decisions/game-version-scope]]
- Pages created: [[systems/battle-system]], [[systems/tactics-and-rage]], [[systems/troop-types]], [[systems/general-system]], [[systems/formation-system]], [[systems/city-conquest]], [[systems/economy-and-internal-affairs]], [[systems/equipment-and-gear]], [[systems/multiplayer-and-endgame]], [[systems/progression-and-vip]], [[entities/generals]], [[world/world-map-and-campaign]], [[technical/asset-system-mapping]], [[decisions/game-version-scope]]
- Pages updated: [[overview]], [[claims]] (18 claims), [[contradictions]] (7), [[open-questions]] (12), [[technical/asset-pipeline]], [[index]]

## [2026-06-27] ingest | Primary-source screenshot (xungde.somo.vn)
- User provided an in-game screenshot → confirms target game definitively (somo.vn platform, Quan Vũ, Công/Thủ, world city-siege at Bạch Đế, command UI)
- Resolved battle VIEW type: isometric diagonal + squad-grid; att=Công(attacker)/def=Thủ(defender)
- Page created: [[sources/screenshot-somo-battle-2026-06-27]]
- Pages updated: [[systems/battle-system]] (geometry + in-battle command UI), [[technical/asset-system-mapping]] (att/def=Công/Thủ), [[claims]] (c-19), [[contradictions]] (x-06 partially resolved), [[open-questions]] (q-05 partial), [[index]]

## [2026-06-27] ingest | 3 more screenshots (stance wheel + 武将对决 duel)
- Stance WHEEL confirmed: Đột Kích/Phòng Thủ/Tấn Công + center Giác (觉醒 in-battle awaken), ~3-4s timer
- 武将对决 duel: **5 positions 一二三四五/side**, joint pair 周瑜●诸葛亮, per-general troop-type icons (马超=骑/黄忠=弓/周泰=枪/黄月英=战车/周瑜·诸葛亮=谋士) → live game has ≥5 troop types (谋士+战车) → version-drift insight
- 武斗会 (martial tournament 8进4, 平原战) + 击鼓支持 (drum-support spectating)
- Pages updated: [[systems/battle-system]], [[systems/troop-types]], [[systems/multiplayer-and-endgame]], [[entities/generals]], [[claims]] (c-20,c-21), [[contradictions]] (x-01,x-06), [[open-questions]] (q-05,q-08), [[sources/screenshot-somo-battle-2026-06-27]]

## [2026-06-27] synthesize | Master GDD compiled
- Created [[GDD]] — single-document Game Design Document synthesizing all 24 pages + screenshot evidence, in Vietnamese, with confidence markers (✅/⚠️/❓/🎨)
- 16 sections: vision, core loop, combat, generals, troops, formations, PvE, world, economy, equipment, multiplayer, progression, UI, technical, open decisions, build roadmap
- Updated [[index]] to feature GDD as the master doc

## [2026-06-27] design | Client/Server architecture & work split
- Created [[technical/client-server-architecture]] — server-authoritative architecture, responsibility matrix per system, server/client module breakdown, combat turn-flow, anti-cheat, and concrete work division (Client / Server / Shared contracts)
- Adversarial architecture review (red-team agent) launched to verify before finalizing
- Updated [[index]]

## [2026-06-27] ingest | Customer battle-UI spec (resolves battle geometry)
- Customer-provided requirements for pre-battle screen, in-battle UI, troop geometry, terrain → [[sources/customer-battle-ui-spec-2026-06-27]]
- **RESOLVED battle geometry**: side = queue ≤5 generals (sequential) → each general ≥4 rows (sequential) → 3 groups/row → N soldiers/group (default 6, variable). Closed [[contradictions#x-20260627-06]] + [[open-questions#q-20260627-05]]
- Added: pre-battle waiting screen, reinforcement (借兵→queue end), skill cutscenes, under-foot circles (warState), static-terrain rule
- Pages updated: [[systems/battle-system]], [[GDD]] (§3.1/§13/legend 📋), [[technical/asset-system-mapping]], [[claims]] (c-22), [[contradictions]] (x-06 resolved), [[open-questions]] (q-05 answered)

## [2026-06-27] harden | Client/Server architecture revised per red-team
- Incorporated adversarial review findings into [[technical/client-server-architecture]] (§12 hardening): national-war concurrency, disconnect/reconnect, commit-reveal turn protocol, payment/reward idempotency, bot detection, server-side fog & auto-tactic, shared-C# scoping + float determinism

## [2026-06-27] refine | Formation system is rich & data-driven (owner)
- Owner clarified: troop-row shape is per-row situational (answer B); formations are many & varied, tied to generals (e.g. troops along both sides of a path), each with distinct gameplay characteristics — not just the 3–4 web 阵法 (VN "9 formations" now plausible)
- Reframed [[systems/formation-system]] (data-driven FormationLayout), [[systems/battle-system]] (Row.shape situational + data model), [[GDD]] §6, [[claims]] (c-23), [[open-questions]] (q-13: mechanism known, catalog to enumerate)

## [2026-06-29] rules | Owner set mandatory working agreement
- 5 rules: (1) wiki everything, (2) do it yourself autonomously (Unity MCP for hard tasks, manual steps yourself), (3) self-compile & self-verify vs requirements, (4) always re-check GDD, (5) re-read GDD/wiki when context thin
- Recorded in vault `CLAUDE.md` (Working agreement) + memory `working-rules.md`
- NOTE: Unity MCP currently DISCONNECTED → need Editor open + reconnect to compile/run/drive Unity (rules 2-3)

## [2026-06-29] research | Luzart framework deep-analysis → client architecture
- Ran 8-agent workflow deep-reading all ~130 Luzart .cs files (7 module clusters) + synthesis blueprint
- Created [[technical/luzart-framework]] — catalog: Content/DI (Domain+EventBus), Universe/Saveable, ReactiveValues, ThanhDemo/DataResources (SO stat architecture), View, LuzartUI, Tween/Select/Attributes — with patterns, API, and VERIFIED cautions (RuntimeStat.InitStat bug, AssetBool_Constant NotImplemented, AssetNumber_Formula returns 0, EventBus not thread-safe, pre-impl files missing, UI doc≠code)
- Created [[technical/client-architecture-patterns]] — blueprint: 6-layer client (Domain→Services→SO data→Reactive→View/UI→Tween), pattern→Luzart→CTXD map, battle-slice plan (SO data, turn FSM, stance wheel=Command+Strategy, server events→ReactiveValues, composite render 5×≥4×3×N), use-now vs build, P0-P6 MVP roadmap
- Updated [[GDD]] §14, [[index]]; client = SO Architecture + design patterns on Luzart, SERVER-AUTHORITATIVE (client never resolves combat)

## [2026-06-29] cleanup | Gỡ code rác để Luzart compile (0 lỗi)
- Project không compile (41 lỗi CS0246/CS0115): file demo/pre-impl tham chiếu type không tồn tại (Odin `Sirenix`, `StatType`/`ItemConfig`/equipment, `ICost*`, `GameManagerData`/`UIManagerData`, `Singleton<>`/`UniverseView`/`FindItemEditor`). UniTask + DOTween có cài → giữ.
- GỠ: `Content/ThanhDemo/`, `Content/DataResources/`, `Content/Universe/Universe.cs`, `Content/Universe/SceneRootManager.cs`, 2 nút editor `FindAll*` trong Bag. SỬA (Odin→attribute Luzart): `SaveService`/`ServiceBag`/`ContentBag`. GIỮ: Odin trong `#if ODIN_INSPECTOR` (guard hợp lệ).
- **Xác minh: 3 assembly (Assembly-CSharp, -firstpass, -Editor) compile 0 lỗi** — offline bằng Roslyn bundled của Unity + Bee `.rsp` (khớp Editor.log thật). Unity Editor chưa tự recompile (chưa focus).
- Pages created: [[decisions/luzart-compile-cleanup-2026-06-29]]
- Pages updated: [[technical/luzart-framework]] (intro cleanup note, §2 Universe, §4 ThanhDemo/DataResources marked removed)

## [2026-06-29] implement | CTXD battle vertical slice + Task-1 asset generator (Assets/Ctxd)
- Built the first gameplay code (owner's two overnight tasks). Waited for 3 concurrent agents (compile-cleanup, Luzart refactor, framework analysis) to finish first, then built on the cleaned framework.
- **Task 1** — `Ctxd.EditorTools.AssetForge` (Editor): sprite sequences → frame-by-frame Unity `AnimationClip`s + `AnimatorController`s + prefabs (SpriteRenderer+Animator+UnitView/EffectView) + `UnitVisualDefinition`/`EffectVisualDefinition` SOs, all refs wired in code; one-click (CTXD ▸ Forge) + CLI. [[technical/asset-generation-pipeline]]
- **Task 2** — battle vertical slice following the owner's SO→prefab→spawn pattern:
  - `Ctxd.Battle.Sim` — pure-C# deterministic resolver + `BattleEvent` log (stance triangle, morale→skill2, tactics/awakening, terrain, seeded RNG). **Verified by standalone smoke test** (determinism, win/lose, stance advantage 40/40 vs 0/40).
  - `Ctxd.Data` — `GeneralDefinition`/`TroopTypeDefinition`/`TacticDefinition`/`FormationDefinition`/`UnitVisualDefinition`/`EffectVisualDefinition`/`BattleConfigDefinition`/`CtxdGameDatabase` (all `AbstractScriptableContent`).
  - `Ctxd.View`/`Ctxd.Battle` — `UnitView : ViewT<T>`, `UnitFormationView`, `EffectView`, `FloatingText`, `BattlePresenter` (plays the event log) + `SpriteFramePlayer` (renders before baking).
  - `Ctxd.UI` — coded uGUI `BattleHud` (2 portraits+HP/morale, stance wheel 突击/攻击/防守 + 觉, command menu, banners, result).
  - `CtxdBootstrap` (composition root) + `SampleContentForge` (6 generals/6 tactics/5 troops/3 formations + Battle scene). CTXD ▸ Build Everything.
- **Verified**: all code compiles 0 errors (runtime + Editor) offline via bundled Roslyn; sim logic verified by execution. **NOT done** (no Editor access — MCP disconnected, project locked): asset bake + Play-test → one click for owner: focus Editor → CTXD ▸ Build Everything → open Battle.unity → Play.
- Pages created: [[technical/ctxd-code-architecture]], [[technical/asset-generation-pipeline]], [[decisions/ctxd-implementation-2026-06-29]]
- Pages updated: [[log]], [[index]]
