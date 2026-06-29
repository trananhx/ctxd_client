---
title: AssetForge — Frame-by-Frame Animation & Prefab Generator (Task 1)
category: technical
tags: [ctxd, asset, animation, prefab, editor, generator, task1]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# AssetForge — sprite → Unity animation + prefab generator

**Task 1**: turn every sprite sequence under `Assets/Resources/sprite` into ready-to-use Unity assets — **frame-by-frame `AnimationClip`s + `AnimatorController`s + prefabs (SpriteRenderer + Animator + UnitView/EffectView) + visual ScriptableObjects**, with every reference wired in code. Implemented as `Ctxd.EditorTools.AssetForge` (`Assets/Ctxd/Editor/AssetForge.cs`).

> [!info] Why a C# Editor generator (not hand-authored YAML)
> There are ~1,992 source PNGs. Hand-writing `.anim`/`.controller`/`.prefab` YAML (with sprite sub-asset fileIDs + GUIDs) for that many frames is hopelessly error-prone and Unity-version-fragile. An Editor generator using `AnimationUtility`/`AnimatorController`/`PrefabUtility`/`AssetDatabase` is correct, idempotent and re-runnable. See [[decisions/ctxd-implementation-2026-06-29]].

## What it generates
Output under `Assets/Ctxd/Generated/`:
- `Anim/Units/{att,def}/{facing}_{id}/<State>.anim` — one clip per action folder.
- `Anim/Units/.../{facing}_{id}.controller` — states Idle/Move/Attack/Hurt/Die (+ extras), default Idle.
- `Prefabs/Units/{att,def}_{id}.prefab` — SpriteRenderer + Animator(controller) + `UnitView` (refs wired, `resourcesBasePath` set for the fallback player).
- `Data/UnitVisuals/unit_{id}.asset` — `UnitVisualDefinition` referencing the att + def prefabs.
- `Anim/Eff/*.anim` + `Prefabs/Eff/*.prefab` + `Data/EffectVisuals/*.asset` — skills, arrows, awakening, formation, anger.
- `Assets/Ctxd/Resources/CtxdGameDatabase.asset` — the indexed registry.

## Source → action mapping (army units)
`sprite/army/{att,def}/<id>/<1-5>/<n>.png` (8 ids: 2,10,31,33,43,67,102,1001):

| Folder | Frames (typ.) | State | Loop |
|---|---|---|---|
| 1 | 1 | Idle | yes |
| 2 | 6–7 | Move | yes |
| 3 | 12–13 | Attack | no |
| 4 | 4 | Hurt | no |
| 5 | 13–14 | Die | no (holds last) |
| 11/13/16/17 (only `102`) | — | Action11… | no |

Clips are built at **12 fps** (units) / **14 fps** (effects) via `AnimationUtility.SetObjectReferenceCurve` on `SpriteRenderer.m_Sprite`. `UnitView.PlayAction` calls `Animator.Play(stateName)`.

## How to run
- **One click**: menu **CTXD ▸ Build Everything** (forge + sample content + scene), or **CTXD ▸ Forge ▸ Forge ALL Battle Assets**.
- **Headless / CLI**: `Unity.exe -batchmode -quit -projectPath <proj> -executeMethod Ctxd.EditorTools.AssetForge.ForgeAllFromCLI` (requires the project not be open in another Editor).
- Idempotent — re-running rebuilds in place.

> [!warning] Frame alignment caveat (verify in-editor)
> Army frames import as `spriteMode: Multiple` with a per-frame rect offset that *encodes* registration. The generator keyframes the Sprite sub-asset as-is. If frames jitter when played, normalise pivots (a future AssetForge option) or re-import with a consistent bottom-centre pivot, then re-run. Must be eyeballed once in Play — not verifiable offline.

## Resilience: plays without baking
`UnitView`/`UnitFormationView` fall back to a runtime `SpriteFramePlayer` that loads frames straight from `Resources` (`sprite/army/{att,def}/{att,def}_{id}/<folder>`). So a battle **renders even before AssetForge is run** — AssetForge then upgrades it to the owner's baked Unity AnimationClips.

---
## Backlinks
- [[technical/ctxd-code-architecture]] — how the generated assets are consumed
- [[technical/asset-system-mapping]] — source sprite folder → system mapping
- [[technical/asset-pipeline]] — Resources layout
- [[decisions/ctxd-implementation-2026-06-29]]
