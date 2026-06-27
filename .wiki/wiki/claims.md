---
title: Claims Ledger
category: meta
created: 2026-06-27
updated: 2026-06-27
---

# Claims Ledger

Cross-page factual claims with citations. Each entry must cite a source page or raw file. Claims here are reused by other pages via `(see [[claims#claim-id]])`.

## How to use

- Append a new claim when ingesting reveals a fact that multiple pages will reference (e.g. "max party size = 4", "damage formula uses cubic falloff").
- Each claim gets a stable ID: `c-YYYYMMDD-NN`.
- If a later GDD revision contradicts an existing claim, do **not** delete it. Append the new claim and add an entry to [[contradictions]].
- If a claim becomes uncertain (e.g. "still under design"), move it to [[open-questions]].

## Format

```markdown
### c-YYYYMMDD-NN — <one-line claim>
- **Sources**: `raw/gdd/combat-v3.md:42`, [[systems/damage-formula]]
- **Status**: active | disputed | superseded
- **First seen**: YYYY-MM-DD
- **Notes**: optional gameplay/balance context
```

## Active claims

<!-- Append new claims below. Keep newest at the top of each year-section. -->

### c-20260627-01 — Engine is Unity 6.5 (6000.5.1f1) with URP 17.5 and the 2D toolchain
- **Sources**: `ProjectSettings/ProjectVersion.txt`, `Packages/manifest.json`
- **Status**: active
- **First seen**: 2026-06-27
- **Notes**: 2D packages present: animation, aseprite, psdimporter, spriteshape, tilemap(+extras). New Input System 1.19.0. See [[technical/asset-pipeline]].

### c-20260627-02 — Army units are sprite-defined with parallel attack/defense animation sets keyed by unit ID
- **Sources**: `Assets/Resources/sprite/army/att/att_<id>/`, `Assets/Resources/sprite/army/def/def_<id>/`
- **Status**: active
- **First seen**: 2026-06-27
- **Notes**: Same numeric IDs appear under both `att/` and `def/` (e.g. 2, 10, 31, 33, 43, 67, 102, 1001). Confirms a unit/general roster shared across attack & defense states. See [[technical/asset-pipeline]].
