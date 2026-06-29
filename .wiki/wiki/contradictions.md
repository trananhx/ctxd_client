---
title: Contradictions
category: meta
created: 2026-06-27
updated: 2026-06-27
---

# Contradictions

Conflicting claims kept until resolved. Most stem from **three different games sharing the name** (see [[decisions/game-version-scope]]) or from version drift between the 2013 webgame and later mobile builds.

## Format
```markdown
### x-YYYYMMDD-NN — <topic>
- **Claim A**: "..." — Source
- **Claim B**: "..." — Source
- **Status**: open | resolved → A/B | superseded by [[decisions/...]]
```

## Open contradictions

### x-20260627-01 — Number of troop types (兵种) and how they counter
- **Claim A**: Webgame 攻城掠地 (2013) has **4** types (骑/枪/弓/攻城) and 兵种互不相克 — counters live in the stance triangle. — baike.baidu.com, gc.aoshitang.com
- **Claim B**: "Công Thành Xưng Đế Mobile" (2019, VGP) has **5** types (Thương/Cung/Kỵ/Mưu Sĩ/Chiến Xa) with mutual counters. — 2game.vn, thegioididong.com
- **Claim C**: 乱世曹操传 has **6** types (刀/枪/弓/弩/骑/战车) + 兵种天赋 +25% + star system. — taptap.cn/moment/531165787902182783
- **PRIMARY EVIDENCE (2026-06-27)**: An in-game 武将对决 screenshot ([[sources/screenshot-somo-battle-2026-06-27]]) shows **≥5 distinct troop-type icons** in the live game — incl. **谋士 (strategist, 周瑜/诸葛亮)** and **战车 (chariot, 黄月英)** alongside 骑/枪/弓. So the live game the project mirrors is NOT 4-types-only.
- **Reframe**: The 4-vs-5-vs-6 split is not purely "3 different games" — it is also **version drift within the webgame itself** (launch 2013 ≈ 4 types per Baidu; later/somo builds add 谋士/战车). Decision needed: target the launch build or a later build. See [[decisions/game-version-scope]].
- **Status**: open — live game has ≥5 types; exact full roster & counter rules per build still unconfirmed. See [[systems/troop-types]].

### x-20260627-02 — Rage bar (怒气) vs morale model (士气)
- **Claim A**: Combat uses a "怒气" rage bar that fills and is spent on 战法 (and the project has `warFeatAnger` art). — brief framing, napgamemobile, asset folder
- **Claim B**: The documented mechanic is **morale (士气)**: start 50, fill via combat, cast **skill-2** at 100; 5★ start at 100; 战法 triggers are also condition-based (on-deploy %, on-kill, HP thresholds). — stzb.163.com, taptap.cn, gc.aoshitang.com
- **Status**: open (likely the same gauge under two names) — treat as a morale/charge gauge driving a 2-tier skill. See [[claims#c-20260627-07]], [[systems/tactics-and-rage]].

### x-20260627-03 — Formation system unlock level
- **Claim A**: 阵法 unlocks at **lv210** after the Xiahou Dun dungeon + formation tech. — jingyan.baidu.com, hly.com
- **Claim B**: Formations only **activate at lv20** (= summed 兵书 level), with lv50 specials; a VN source cites "**9 trận pháp**". — gcld.84joy.com/article/6075.html, 2game.vn
- **Status**: open — lv210 may be a later formation TIER, not the base system. Re-verify. See [[systems/formation-system]].

### x-20260627-04 — VIP recharge threshold table
- **Claim A**: VIP1=60 … VIP14=48000 元 (cumulative). — m.7724.com/gcld/news/140598.html
- **Claim B**: Cheaper alternate table VIP2=30, VIP3=100, VIP4=200 元. — alternate 7724 source
- **Status**: open — clearly version/server-dependent; choose one canonical table when building. Per-tier PERKS are consistent and sourced. See [[systems/progression-and-vip]].

### x-20260627-05 — General rarity ordering
- **Claim A** (CN): 紫 (purple, highest) > 红 (red) > 黄 (yellow), with stat caps 115+/95/80. — gc.aoshitang.com, hongwen777.com
- **Claim B** (VN): Tím (purple) → Cam (orange) → Đỏ (red) → Vàng (yellow) → Unique → Thiên Mệnh (ascending). — egame.vn
- **Status**: open — VN list reverses CN order and adds tiers; reconcile against the actual VN client. See [[systems/general-system]].

### x-20260627-06 — Battle geometry (rows)
- **Claim A**: Battlefield is **5 rows (五排)** per side. — baike.baidu.com, f166.com
- **Claim B**: A general commands **4 rows (一个武将有4排部队)**; columns die and advance. — doyo.cn
- **Claim C**: 桃园之誓 joint awakening expands the formation to **6 rows**. — shiyouhome.com
- **PRIMARY EVIDENCE (2026-06-27)**: In-game screenshots ([[sources/screenshot-somo-battle-2026-06-27]]) show isometric diagonal field + **5 numbered positions 一二三四五** per side.
- **RESOLUTION (2026-06-27)** — customer spec ([[sources/customer-battle-ui-spec-2026-06-27]]) settles the model: each side = queue of ≤5 generals fighting **sequentially** (1 active/side at a time); **each general = ≥4 rows** advancing one at a time; **each row = 3 groups**; **each group = N soldiers (default 6, variable)**. The "5 rows / 4 rows / 6 rows" figures were conflating *rows-per-general* (≥4, upgradable) with *generals-per-side* (5). Reconciled.
- **Status**: ✅ **resolved** → see geometry in [[systems/battle-system]]. (Claim A=upgraded row state, B=base rows/general, C=Đào Viên expansion — all consistent.)

### x-20260627-07 — National-war XP bonus magnitude
- **Claim A**: National war gives ~**+50%** XP vs PvE 副本. — gamersky.com, aoshitang leveling guide
- **Claim B**: The 磨砺 tech (lv72) gives **+30%** national-war KILL XP. — kuwan8.com
- **Status**: open — likely two different bonuses (base mode bonus vs a tech); reconcile. See [[systems/multiplayer-and-endgame]].

## Resolved
