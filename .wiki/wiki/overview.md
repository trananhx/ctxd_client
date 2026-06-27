---
title: Project Overview
category: overview
tags: [unity, 2d, war-game, three-kingdoms]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# ctxd_client — Project Overview

> [!info] Provenance
> This overview was seeded from a read of the Unity project (`Assets/`, `Packages/manifest.json`, `ProjectSettings/`) on 2026-06-27. No Game Design Document has been ingested yet, so **genre, loop, and platform below are inferred from assets** and flagged. Drop a GDD into `raw/gdd/` and run an INGEST to confirm.

## Game
- **Engine**: Unity 6.5 (6000.5.1f1) — URP 17.5, full 2D toolchain (see [[claims#c-20260627-01]])
- **Genre**: *(inferred)* 2D Three Kingdoms-style turn-based war/battle game — generals, troop units, skills, formations, and a rage meter
- **Platform**: TBD *(no build target confirmed; 2D + UI-heavy asset set is consistent with mobile or PC)*
- **Architecture**: *(inferred)* networked client — project is named `ctxd_client`, implying a separate backend (see [[open-questions#q-20260627-02]])
- **Team size**: TBD

## Core pillars
<!-- 3-5 design pillars defining this game — populate from GDD -->
> [!question] Not yet defined — awaiting a GDD ingest.

## Current state
Wiki initialized. The project is currently **asset-driven**: the codebase contains only TextMesh Pro example scripts, while `Assets/Resources/` holds the battle art for armies, generals, skills, effects, formations, and battle UI. Gameplay rules are not yet expressed in code or docs in-repo.

## Key systems
*(inferred from asset folders — each becomes a `systems/` page once a GDD confirms the rules)*
- **Army combat** — units with parallel attack/defense animation sets keyed by unit ID (see [[claims#c-20260627-02]])
- **Skills** — `sprite/skill/{att,def}/skill_<id>` — attack & defense skill effects
- **Formations** (阵 / formation) — `sprite/eff/formation/{att,def,doc}`
- **Rage / Anger meter** (怒气) — `sprite/warFeatAnger`
- **General special states** — `WuShenFuTi` (武神附体, "War God Possession"), `wujiangjuexing` (武将觉醒, "General Awakening")
- **Buffs & battle states** — `sprite/warBuff`, `sprite/warState`

## Key entities
*(inferred — needs a data table to resolve IDs to names; see [[open-questions#q-20260627-03]])*
- **Generals / troop units** — numeric IDs (2, 10, 31, 33, 43, 67, 102, 1001) under `sprite/army/{att,def}/`
- **Tactical general portraits** — `sprite/tacticalGeneralPicMax`

## Technical
- [[technical/asset-pipeline]] — How assets are laid out under `Assets/Resources/` and the 2D import toolchain

## Open questions
- [[open-questions#q-20260627-01]] — Core combat loop unknown
- [[open-questions#q-20260627-02]] — Runtime code location & server component
- [[open-questions#q-20260627-03]] — Mapping of numeric unit IDs to generals/troops

---
## Backlinks
- [[index]] — catalog entry
