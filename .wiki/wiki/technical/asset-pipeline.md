---
title: Asset Pipeline & Resources Layout
category: technical
tags: [unity, 2d, resources, sprites, animation]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Asset Pipeline & Resources Layout

How `ctxd_client`'s battle art and data are organized, and the Unity 2D toolchain behind it. Seeded from a repo read on 2026-06-27 (no GDD yet).

## Engine & packages
- **Unity** 6000.5.1f1 (6.5), **URP** 17.5 (`Assets/Settings/UniversalRP.asset`, `Renderer2D.asset`)
- **2D toolchain**: `2d.animation`, `2d.aseprite`, `2d.psdimporter`, `2d.sprite`, `2d.spriteshape`, `2d.tilemap(.extras)`, `2d.tooling`
- **Input**: new Input System 1.19.0 (`Assets/InputSystem_Actions.inputactions`)
- **Text**: TextMesh Pro (the only C# in `Assets/` is TMP examples — no game code yet)
- Full list: `Packages/manifest.json` (see [[claims#c-20260627-01]])

## Resources folder convention
Runtime art is loaded from `Assets/Resources/` (Unity's `Resources.Load` path). Top-level sprite categories:

| Path | Purpose |
|------|---------|
| `sprite/army/att/att_<id>/` | Unit **attack** animation set, per unit ID |
| `sprite/army/def/def_<id>/` | Unit **defense** animation set, per unit ID |
| `sprite/skill/{att,def}/skill_<id>/` | Skill effect frames (attack / defense) |
| `sprite/eff/...` | Battle effects (see below) |
| `sprite/tacticalGeneralPicMax/` | Tactical general portraits |
| `sprite/warBG/` | Battle backgrounds (jpg, numeric IDs + `silkMap`) |
| `sprite/warBuff/` | Buff icons |
| `sprite/warFeatAnger/` | Rage / anger meter (怒气) art |
| `sprite/warSkillName/` | Skill-name banner art |
| `sprite/warState/` | Battle state icons |
| `sprite/warvsicon/` | VS / matchup icons |
| `sprite/windowBG/` | UI window backgrounds |
| `Font/` | Saira font family + TMP SDF asset |

### Unit animation structure
Each unit folder holds **5 action subfolders** (`1`–`5`), each a numbered frame sequence (`1.png`, `2.png`, …):

```
sprite/army/att/att_10/
├── 1/  (frames 1.png … )   # action 1 (e.g. idle/approach — TBD)
├── 2/  (frames 1.png … )   # action 2
├── 3/  (frames 1.png … )   # action 3
├── 4/  (frames 1.png … )
└── 5/  (frames 1.png … )
```

The same numeric IDs appear under both `att/` and `def/` (2, 10, 31, 33, 43, 67, 102, 1001), so each unit ID has a matched attack/defense set (see [[claims#c-20260627-02]]).

> [!question] Action-slot meaning
> The five action slots (1–5) are not yet mapped to gameplay actions (idle, move, attack, hit, die?). Confirm against animation/controller assets or a GDD.

### Effect categories (`sprite/eff/`)
| Folder | Meaning |
|--------|---------|
| `Arrow/` | Projectile/arrow attack effects (`attackMc1`, `attackMc2`) |
| `Recruit/` | Recruitment effect |
| `Strategy_fla/` | Strategy/tactic effects (Flash-exported timelines) |
| `WuShenFuTi/` | 武神附体 "War God Possession" — general ultimate state |
| `formation/{att,def,doc}/` | Battle formation (阵) effects |
| `gjjl/` | Likely 攻击奖励/激励 — combat reward/buff effect (verify) |
| `wujiangjuexing/` | 武将觉醒 "General Awakening" effect |

> [!info] Naming
> Many folders use Chinese-origin slugs. Record both the literal slug and meaning when documenting (per vault rule in `CLAUDE.md`). Several meanings above are best-guess and need confirmation.

## Open questions
- [[open-questions#q-20260627-01]] — combat loop the assets serve
- [[open-questions#q-20260627-03]] — what the numeric unit IDs map to

## See also
- [[technical/asset-system-mapping]] — maps each asset folder to the game system it serves (battle screen, tactics, formations, awakening effects)

---
## Backlinks
- [[index]] — catalog entry
- [[overview]] — technical section
- [[technical/asset-system-mapping]] — references this layout
