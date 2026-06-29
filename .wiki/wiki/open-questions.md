---
title: Open Questions
category: meta
created: 2026-06-27
updated: 2026-06-27
---

# Open Questions

Game design / tech questions the wiki cannot fully answer yet. Move entries to "Answered" when resolved.

## Open

### q-20260627-04 — What is the exact combat damage formula and how do bonuses stack?
- **Why it matters**: Single biggest hole for a faithful recreation — combat cannot be tuned without it.
- **What we have**: 统/勇 ~1pt=10 atk/def; crit 200%, 乱舞 150%, 韧性 halves 战法 dmg. Missing: end-to-end equation, the stance-counter bonus magnitude, and additive-vs-multiplicative stacking of stance/troop/formation/terrain.
- **Where to look**: 傲世堂 forum thread (login-gated): bbs.aoshitang.com/thread-1041365-1.html (战法篇); gameres.com/249586.html.
- **Status**: open. See [[systems/tactics-and-rage]].

### q-20260627-05 — Canonical battle geometry → ANSWERED
- **Answer (2026-06-27)**: Customer spec ([[sources/customer-battle-ui-spec-2026-06-27]]) fully specifies it: isometric; each side a **queue of ≤5 generals** fighting **sequentially**; **each general ≥4 rows** (advancing one at a time); **each row = 3 groups**; **each group = N soldiers (default 6, variable)**. Reinforcements append to queue end. See [[systems/battle-system]] §Hình học. Moved to Answered.
- **Status**: ✅ answered (only exact per-group upgrade curve for N remains a tuning detail).

### q-20260627-06 — Which game version is the build target?
- **Why it matters**: Changes troop-type count, counter system, and combat presentation.
- **Status**: open — proposed answer in [[decisions/game-version-scope]] (the 2013 webgame). Needs owner confirmation.

### q-20260627-07 — Per-building production/cost/time numbers and the full 科技 tree?
- **Why it matters**: Cannot build the economy loop without at least one level of production/cost/timer data per building.
- **Status**: open. See [[systems/economy-and-internal-affairs]].

### q-20260627-08 — Per-troop talent table and exact counter percentages?
- **Why it matters**: Needed to model troop balance; only "cavalry talent-1 = +25% vs chariot" confirmed (and that's from 乱世曹操传).
- **Partial (2026-06-27)**: Screenshot icons confirm general→troop-type for several generals (马超=骑, 黄忠=弓, 周泰=枪, 黄月英=战车, 周瑜/诸葛亮=谋士) and that the live game has ≥5 troop types. Talent %/counter tables still open.
- **Status**: open (mappings partially confirmed). See [[systems/troop-types]], [[entities/generals]].

### q-20260627-09 — Canonical VIP threshold table and the official VN KNB recharge rate?
- **Why it matters**: Monetization economy; sources conflict and findable VN figures are from pirate servers.
- **Status**: open. See [[contradictions#x-20260627-04]], [[systems/progression-and-vip]].

### q-20260627-10 — Vietnamese in-client names for tactics, systems, formations, troops?
- **Why it matters**: For a faithful VN localization; web searches drifted to historical content. Sino-Vietnamese readings used in the wiki are inferred.
- **Where to look**: congthanh.vgplay.vn (note: that is the 2019 mobile, may differ). 
- **Status**: open.

### q-20260627-11 — Where will runtime gameplay code live, and is there a server component?
- **Why it matters**: Project named `_client` implies a backend; none present in repo (only TMP examples). Original is a webgame (authoritative server).
- **Status**: open (carried from init).

### q-20260627-12 — Awakening RNG model (per-attempt %, pity?) and exact per-tier stat tables (sets/treasures/mounts/divine weapons)?
- **Why it matters**: Power-curve tuning. ~0.2%/attempt awakening is single-sourced; per-tier stat grids mostly absent.
- **Status**: open. See [[systems/general-system]], [[systems/equipment-and-gear]].

### q-20260627-13 — Danh mục đội hình bày binh & đặc điểm từng kiểu
- **Đã rõ (chủ dự án, 2026-06-27)**: Hình dạng hàng = **per-hàng theo tình huống (đáp án B)** — hàng đầu giáp địch đổi sang hình tùy biến (cánh cung…), độc lập trận pháp tổng thể. Hệ đội hình **phong phú & data-driven**, gắn theo tướng (vd xếp dọc 2 bên đường), nhiều kiểu, mỗi kiểu đặc điểm gameplay khác nhau.
- **Còn cần liệt kê dần**: **danh mục đầy đủ** các kiểu đội hình + **đặc điểm gameplay** từng kiểu (tăng thủ/công/tầm/khống chế, điều kiện áp dụng, tướng nào có layout chữ ký nào). Mô hình: `FormationLayout` (ScriptableObject) + `Row.shape` theo tình huống.
- **Status**: open (cơ chế đã rõ; cần khách kể dần từng đội hình để điền catalog). See [[systems/formation-system]], [[systems/battle-system]].

## Answered

### q-20260627-01 — What is the core combat loop? → answered
- **Answer**: Turn-based queue combat, up to 5 generals, 3-stance rock-paper-scissors, 战法 above stances, morale-gated skill-2, win by wiping the enemy. See [[systems/battle-system]], [[systems/tactics-and-rage]].

### q-20260627-03 — What do the numeric unit IDs map to? → partially answered
- **Answer**: They are generals/troops from the Tam Quốc roster (200+ generals). Exact ID→general mapping still needs a data table. See [[entities/generals]], [[systems/general-system]].
