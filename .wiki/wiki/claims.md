---
title: Claims Ledger
category: meta
created: 2026-06-27
updated: 2026-06-27
---

# Claims Ledger

Cross-page factual claims with citations. Each entry cites a source. Reused by other pages via `(see [[claims#claim-id]])`. Confidence/verdict from the research verification pass is noted.

## Format
```markdown
### c-YYYYMMDD-NN — <one-line claim>
- **Sources**: url / [[page]]
- **Status**: active | disputed | superseded
- **First seen**: YYYY-MM-DD
- **Notes**: confidence / context
```

## Active claims

### c-20260627-01 — Engine is Unity 6.5 (6000.5.1f1) with URP 17.5 and the 2D toolchain
- **Sources**: `ProjectSettings/ProjectVersion.txt`, `Packages/manifest.json`
- **Status**: active — **First seen**: 2026-06-27
- **Notes**: See [[technical/asset-pipeline]].

### c-20260627-02 — Army units are sprite-defined with parallel attack/defense animation sets keyed by unit ID
- **Sources**: `Assets/Resources/sprite/army/att|def/<id>/`
- **Status**: active — **First seen**: 2026-06-27
- **Notes**: 5 action subfolders per unit. See [[technical/asset-system-mapping]].

### c-20260627-03 — `ctxd_client` recreates 攻城掠地 (傲世堂), VN-localized as Công Thành Xưng Đế (launched ~2013-10-31)
- **Sources**: baike.baidu.com/item/攻城掠地, thanhnien.vn/games/cong-thanh-xung-de-6247.htm, user confirmation
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: Dev 上海锐战 (Shanghai Game Reign), brand 傲世堂. CN public beta 2013-04-15. VN publisher Trí Tuệ Việt. NOT the 2019 VGP mobile nor 乱世曹操传. See [[decisions/game-version-scope]].

### c-20260627-04 — Each side deploys up to 5 generals in a queue/column; troops clash row-by-row (递进击杀); order is rearrangeable pre-battle
- **Sources**: baike.baidu.com/item/攻城掠地, gameres.com/249586.html
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: 4th slot tech-gated ~lv66, 5th ~lv68. See [[systems/battle-system]].

### c-20260627-05 — Battle stances form a strict rock-paper-scissors: 突击 (Đột Kích) > 攻击 (Tấn Công) > 防御 (Phòng Thủ) > 突击
- **Sources**: baike.baidu.com/item/攻城掠地, download.com.vn/cong-thanh-xung-de-128816, 9gate.net
- **Status**: active (confirmed, strongest-sourced) — **First seen**: 2026-06-27
- **Notes**: Choosing the countering stance gives a major bonus. See [[systems/battle-system]].

### c-20260627-06 — A general's 战法 (tactic) sits above the stance layer and "克制一切战术" (counters all stances)
- **Sources**: gameres.com/249586.html
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: See [[systems/tactics-and-rage]].

### c-20260627-07 — Morale (士气) model: units start at 50, fill by attacking/being attacked/killing; at 100 they cast skill-2 (战法); 5★ troops start at 100
- **Sources**: stzb.163.com/m/strategy/gcld/2018/04/19/21008_679971.html, taptap.cn/moment/531165787902182783
- **Status**: active — **First seen**: 2026-06-27
- **Notes**: Implies a two-tier skill-1/skill-2 structure. Reconcile with the "怒气 fill-and-cast" framing — see [[contradictions#x-20260627-02]]. See [[systems/tactics-and-rage]].

### c-20260627-08 — General attributes: 统 (Thống) drives normal atk/def, 勇 (Dũng) drives 战法 atk/def, ~1 point = 10; 计策 is the 5th attribute
- **Sources**: gc.aoshitang.com/news/zixun/322013031413222593632.html
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: Combat multipliers: crit 200%, 乱舞 150%, 韧性 halves incoming 战法 dmg. See [[systems/tactics-and-rage]].

### c-20260627-09 — In the 2013 webgame, troop types do not directly counter each other (兵种互不相克); the counter layer is the stance triangle
- **Sources**: baike.baidu.com/item/攻城掠地, gc.aoshitang.com
- **Status**: disputed across versions — **First seen**: 2026-06-27
- **Notes**: Webgame ~4 types (骑/枪/弓/攻城). 2019 mobile = 5 types with counters; 乱世曹操传 = 6 types + talents. See [[contradictions#x-20260627-01]], [[systems/troop-types]].

### c-20260627-10 — General Awakening (觉醒): tech unlocks when the lord reaches lv121 and defeats 张颌 at 五丈原; the general must be lv120
- **Sources**: m.sohu.com/a/884347572_267471, gamedog.cn (awakening)
- **Status**: active — **First seen**: 2026-06-27
- **Notes**: Materials 觉醒丹 (~10% from 觉醒试炼) + 武魂 (~5% from 国战/世界BOSS); per-attempt success ~0.2% (single source). See [[systems/general-system]].

### c-20260627-11 — National-war world map: 247 cities/passes + 3 barbarian cities, split among Wei/Shu/Wu (魏蜀吴)
- **Sources**: gc.aoshitang.com/news/ziliao/61..., gamek.vn/cong-thanh-xung-de.htm
- **Status**: active (confirmed, bilingual) — **First seen**: 2026-06-27
- **Notes**: Marketing figure "300+ 关隘城池". See [[world/world-map-and-campaign]].

### c-20260627-12 — National war (国战) unlocks at main-general lv30 + one green-tier weapon; national tasks run 3×/day in 6 types
- **Sources**: gc.aoshitang.com/news/ziliao/61..., m.18183.com/gcld/gonglue/110916.html
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: Time windows 10:00-11:30 / 15:00-16:30 / 20:00-21:30. See [[systems/multiplayer-and-endgame]].

### c-20260627-13 — Formations (阵法): 3 base (锋矢/雁形/方圆 by troop type) + advanced 云垂阵; level = sum of embedded 兵书; books red=atk/blue=tactic/green=def
- **Sources**: jingyan.baidu.com/article/ce09321b84f6d72bff858fb1.html, hly.com/zixun/z-89726.html
- **Status**: active — **First seen**: 2026-06-27
- **Notes**: Slot unlock 150 gold/formation (450 total). Unlock-level conflict (210 vs 20-activate) → [[contradictions#x-20260627-03]]. See [[systems/formation-system]].

### c-20260627-14 — Economy uses 4 resources: 银币 Bạc, 木材 Gỗ, 粮食 Lương thực, 镔铁 Sắt, each from a dedicated building (民居/木场/农田/矿场)
- **Sources**: u.360.cn/gl/article/53446/, gameres.com/249586.html, download.com.vn
- **Status**: active (confirmed, bilingual) — **First seen**: 2026-06-27
- **Notes**: Iron is the near-exclusive weapon-upgrade resource. See [[systems/economy-and-internal-affairs]].

### c-20260627-15 — Technology (科技) unlocks at lv20 after defeating NPC 宋宪; invest resources to "light stars" then research over time; further branches gated by dungeon NPC kills
- **Sources**: 9game.cn/gcldol/162854.html, gcld.hly.com/ziliao/view-10808.html
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: e.g. 点兵 (+1 troop column), 历练 (+10% EXP). See [[systems/economy-and-internal-affairs]].

### c-20260627-16 — Equipment: 6 slots, 6 quality tiers (白蓝绿黄红紫), unlocks after defeating 郭汜; yellow+ gear carries Lv1-5 skills (yellow≤1/red≤2/purple≤3)
- **Sources**: jendow.com.tw/wiki/攻城略地, gc.chinagames.net, 07073.com
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: 8 mythic-beast sets; treasures (宝物) 1/general giving 统+勇, forge 炼宝炉 at lv170; divine weapons 神兵 via tech 天铸神兵 (lv130). See [[systems/equipment-and-gear]].

### c-20260627-17 — Premium currency is 元宝 (VN: KNB/Vàng), ratio ~1 RMB = 10 元宝; VIP is cumulative-recharge (累计充值, later versions VIP1-14)
- **Sources**: m.7724.com/gcld/news/140598.html, gc.aoshitang.com/news/ziliao/49..., kenhgamez/gamezingmobile (VN naming)
- **Status**: active (VN VND figures unverified) — **First seen**: 2026-06-27
- **Notes**: VIP threshold tables conflict across versions → [[contradictions#x-20260627-04]]. See [[systems/progression-and-vip]].

### c-20260627-18 — There is no stamina/energy bar; throttling is via 粮食 (food) + daily caps (3 scripts/day, 3 national wars/day) + per-action cooldowns
- **Sources**: gamersky.com/handbook/201405/359124.shtml, gc.aoshitang.com (VIP4 halves 出击/诱敌 CD)
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: PvE also gated by 幻影 (phantom) daily budget. See [[systems/progression-and-vip]], [[systems/city-conquest]].

### c-20260627-19 — Primary-source screenshot (xungde.somo.vn) confirms the target game and that battle is isometric with att=Công (attacker) / def=Thủ (defender)
- **Sources**: [[sources/screenshot-somo-battle-2026-06-27]] (user-provided in-game screenshot, somo.vn platform)
- **Status**: active (confirmed, primary evidence) — **First seen**: 2026-06-27
- **Notes**: Isometric diagonal field (Công bottom-left vs Thủ top-right), squad-grid formations, real-time tactic-selection timer, in-battle command menu (帅旗/借兵/诱敌/突进/诏令/auto). Confirms [[claims#c-20260627-03]] and resolves part of [[contradictions#x-20260627-06]]. See [[systems/battle-system]], [[technical/asset-system-mapping]].

### c-20260627-20 — Per-turn stance selection is a 3-stance WHEEL with a central Awaken button and a ~3-4s timer
- **Sources**: [[sources/screenshot-somo-battle-2026-06-27]] (in-game stance wheel)
- **Status**: active (confirmed, primary evidence) — **First seen**: 2026-06-27
- **Notes**: Wheel = Đột Kích (突击, top) / Phòng Thủ (防守, bottom-left) / Tấn Công (攻击, bottom-right); center = **Giác / Thức Tỉnh (觉醒, Awaken)** — an in-battle ultimate trigger. Visually confirms [[claims#c-20260627-05]]. See [[systems/battle-system]], [[systems/tactics-and-rage]].

### c-20260627-21 — Battle lineup is 5 positions (一二三四五) per side; each general carries a troop-type icon, and the live game shows ≥5 troop categories (incl. 谋士 strategist & 战车 chariot)
- **Sources**: [[sources/screenshot-somo-battle-2026-06-27]] (武将对决 duel screen)
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: 5 general slots/side (joint pairs like 周瑜●诸葛亮 occupy one slot). Icon mappings: 马超=骑兵, 黄忠=弓兵, 周泰=枪兵, 黄月英=战车, 周瑜/诸葛亮=谋士. The presence of 谋士/战车 contradicts "4 types only" for the launch build → likely webgame version drift. See [[contradictions#x-20260627-01]], [[contradictions#x-20260627-06]], [[systems/troop-types]], [[entities/generals]].

### c-20260627-22 — Battle geometry (customer spec): side = queue of ≤5 generals fighting sequentially; each general ≥4 rows (sequential); each row = 3 groups × N soldiers (default 6, variable)
- **Sources**: [[sources/customer-battle-ui-spec-2026-06-27]] (customer requirements)
- **Status**: active (customer spec, high priority) — **First seen**: 2026-06-27
- **Notes**: Resolves [[contradictions#x-20260627-06]] and [[open-questions#q-20260627-05]]. Render tree: Side → 5 Generals → ≥4 Rows → 3 Groups → N units. 1 active general/side at a time (HP/morale/avatar pinned top corners). Reinforcement (借兵) appends to queue end. Pre-battle: reorder 一–五 before countdown. Skill cutscenes; under-foot circles (faction/buff/tactic-state). Terrain configurable but static, set pre-battle. See [[systems/battle-system]].

### c-20260627-23 — Formation/troop-layout is a RICH data-driven system (owner): many layouts, per-general, distinct gameplay; row shape is situational (B)
- **Sources**: chủ dự án (owner statement, 2026-06-27)
- **Status**: active (owner spec, high priority) — **First seen**: 2026-06-27
- **Notes**: Not just the 3–4 web 阵法. Many player-arrangeable formations, each with different gameplay characteristics; formations tied to generals (e.g. troops lined up along both sides of a path); **row shape is per-row, situational** — front engaging row morphs (e.g. arc/cánh cung) independent of overall formation. Model as `FormationLayout` (ScriptableObject) + `Row.shape`. Reframes [[systems/formation-system]]; catalog to enumerate in [[open-questions#q-20260627-13]]. The VN "9 formations" figure now plausible. See [[systems/battle-system]].
