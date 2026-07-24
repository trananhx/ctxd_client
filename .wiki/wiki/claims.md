---
title: Claims Ledger
category: meta
created: 2026-06-27
updated: 2026-07-24
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
- **Sources**: gc.aoshitang.com/news/zixun/322013031413222593632.html, http://gcld.49you.com/gonglue/60744.html
- **Status**: active (confirmed) — **First seen**: 2026-06-27
- **Notes**: Combat multipliers: crit 200%, 乱舞 150%, 韧性 halves incoming 战法 dmg. ✅ Xác nhận V1 (official, 2026-07-24): 攻城掠地 CHỈ có 2 chỉ số nền 统/勇, **KHÔNG có 武力 (Vũ Lực) riêng**. 统 chi phối 普通攻击 + 普通防御 (đòn thường, cả công LẪN thủ); 勇 chi phối 战法攻击 + 战法防御 (chiến pháp, cả công LẪN thủ); 1 điểm ≈ 10 công/thủ; 5 thuộc tính giải đòn: 普通攻击/普通防御/战法攻击/战法防御/计策. Nguồn thêm: https://gc.aoshitang.com/news/zixun/322013031413222593632.html , http://gcld.49you.com/gonglue/60744.html . Xem [[sources/ctxd-web-verify-2026-07-24]]. See [[systems/tactics-and-rage]].

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

### c-20260724-01 — Tướng và lính là MỘT đối tượng (một đơn vị đại diện cho binh chủng của tướng)
- **Sources**: chủ dự án directive (2026-07-24), [[sources/ingame-general-panel-2026-07-24]]
- **Status**: active — **First seen**: 2026-07-24
- **Notes**: Mỗi tướng = một đơn vị chiến đấu mang binh chủng riêng; không tách "tướng" và "lính" thành hai thực thể độc lập. Xem [[systems/unit-entity-model]]; khớp với [[decisions/battle-geometry-server-model-2026-06-30]].

### c-20260724-02 — Binh chủng có CẤP + tên riêng: Công Thành Xa / Nhục Bác TỬ SĨ / Hoàng Kim Chiến Kỵ (LV4/cấp 4)
- **Sources**: [[sources/ingame-general-panel-2026-07-24]], [[sources/ctxd-web-verify-2026-07-24]]
- **Status**: active (một phần UNVERIFIED, mobile-only — xem [[decisions/game-version-scope]], FIX-3) — **First seen**: 2026-07-24
- **Notes**: 🎨 3 binh chủng đọc từ panel "Tướng lĩnh" bản mobile 攻城掠地: "Công Thành Xa LV4" (⚠️ 攻城车), "Nhục Bác TỬ SĨ lv4" (⚠️ 肉搏死士), "H.kim chiến kỳ cấp 4" (⚠️ 黄金战骑). Áp X1/X2/E1 (web-verify 2026-07-24):
  - **E1 — 肉搏死士 XÁC NHẬN (medium)**: 死士 = quân cảm tử; sửa "Nhục Bác Tứ Sĩ" → "Nhục Bác **TỬ SĨ**". 肉搏死士 LÀ binh chủng thật; 黄金肉搏死士 = binh chủng vàng của 周泰 Chu Thái, thuần cận chiến "không phụ thuộc chiến pháp" → giải thích UNIT B ô chiến pháp TRỐNG. Độ tin MEDIUM (nguồn fansite, trang gốc ruiel 404): https://www.shiyouhome.com/gcld/wjfx/1999.html , https://www.233leyuan.com/post-detail/1991837600193638277
  - **X2 — 攻城车 PARTIAL**: siege 器械 có thật, nhưng "攻城车" có thể là mô tả loại, KHÔNG chắc là tên định danh. Giữ ⚠️, không chốt tên.
  - **X2 — 黄金战骑 UNVERIFIED**: không nguồn nào ra đúng chuỗi. Giữ ⚠️, KHÔNG đoán tướng sở hữu.
  - **X1/X3 — hệ bậc sao CHƯA xác nhận cho CTXD**: hậu tố LV4/cấp4 ⚠️ — hệ "兵种星级" (战录 50/100/150/200, 4★ nhân đôi thiên phú…) TRUY VỀ GAME KHÁC (三国志战略版/率土之滨/乱世曹操传), KHÔNG có nguồn 攻城掠地 official. "LV4 = bậc SAO hay CẤP ĐỘ" vẫn là open-question. TUYỆT ĐỐI KHÔNG viết hệ sao này là cơ chế đã-chốt của CTXD.
  Bằng chứng mobile, chờ chủ dự án chốt scope. Xem [[systems/troop-types]]; đối chiếu [[contradictions#x-20260627-01]]. KHÔNG đè [[claims#c-20260627-09]] (webgame ~4 binh chủng 2013).

### c-20260724-03 — Chiến pháp dùng N-lần/lượt HOẶC theo điều kiện; số hàng đánh (2–5) là MỘT effect; đơn vị có thể KHÔNG có chiến pháp
- **Sources**: chủ dự án directive (2026-07-24), [[sources/ingame-general-panel-2026-07-24]], [[sources/ctxd-web-verify-2026-07-24]]
- **Status**: active (củng cố web-verify) — **First seen**: 2026-07-24
- **Notes**: 🎨 UNIT A "Công thành chiếm đất (4 hàng)", UNIT C "Sư/Thiết Kỵ Vô Song (5 hàng)" (⚠️ tên Hán tự chưa chắc, có thể 铁骑无双), UNIT B TRỐNG (không có chiến pháp) → chứng minh đơn vị có thể không mang chiến pháp. "Số hàng đánh" là một tham số effect của chiến pháp. **V3/V4 củng cố (official 武将大全, 2026-07-24)**: số hàng (排) là thuộc tính RIÊNG mỗi 战法 (2–5) — vd 庞德冲锋=3排, 甘宁固守=4排, 夏侯惇飞羽=穿4排, 徐晃背水=3排, 吕蒙入侵=2排, 祝融突击=3排 ( https://gc.aoshitang.com/news/gonglue/772013041123252111032.html ); một 战法 có thể có SỐ LẦN phát (次数) — vd 太史慈乘胜追击 "4排 + phát 2 lần" (medium: https://www.shiyouhome.com/gcld/wjfx/1995.html , https://www.9game.cn/news/9767095.html ) → củng cố castMode N-lần. **V5 (cast THỦ CÔNG, official)**: người chơi BẤM hình tướng để thả 战法 khi thanh đầy ("点击中间武将头像就会释放该武将的战法"): https://gc.aoshitang.com/news/ziliao/152012121118262077467.html . (Thuật ngữ 士气 vs 怒气 CHƯA chốt — official không dùng từ nào; ĐỪNG khẳng định 怒气 sai.) Model rule-engine data-driven: xem scenario.json `TacticDto.Program`, [[systems/tactics-and-rage]], [[systems/unit-entity-model]], [[sources/ctxd-web-verify-2026-07-24]].

### c-20260724-04 — Thiên phú là buff % Lực chiến (战力) theo bối cảnh (Bình nguyên +25%, mọi địa hình +20%, Thành trì +60% chỉ-phe-công)
- **Sources**: [[sources/ingame-general-panel-2026-07-24]], [[sources/ctxd-web-verify-2026-07-24]]
- **Status**: active (cấu trúc CHỐT; con số +60% UNVERIFIED) — **First seen**: 2026-07-24
- **Notes**: 🎨 UNIT A "Thành trì Lực chiến (战力) +60% (Chỉ phe công)", UNIT B "Bình nguyên、Sơn địa、Thủy vực Lực chiến (战力) +20%" (mọi địa hình), UNIT C "Bình nguyên Lực chiến (战力) +25%". Áp FIX-1: giữ nguyên chữ "Lực chiến (战力)", KHÔNG dịch thành "sát thương" — đây là chỉ số tổng hợp. **V7 (web-verify 2026-07-24)**: cấu trúc "城池/攻城 战力 +X% **chỉ phe công (仅攻方)**" LÀ THẬT — xác nhận qua Tư Mã Ý "攻城战斗力+25%（若非副将，守城无15%加成）" ( https://www.shiyouhome.com/gcld/wjfx/2009.html , https://www.602.com/news/33/6396.html ). ⚠️ NHƯNG con số **+60% của UNIT A KHÔNG có nguồn** (mọi thiên phú công thành có nguồn đều +25%; 60% có thể là bonus phối-binh-bình-nguyên, không phải 1 dòng thiên phú tướng) → UNVERIFIED. > [!warning] Ý đồ chủ dự án ("thiên phú = buff sát thương cho lính") là DESIGN INTENT, chênh với chữ in-game (+Lực chiến 战力); xem open-question 战力 tại [[systems/equipment-and-gear]]. Xem [[systems/general-system]], [[sources/ctxd-web-verify-2026-07-24]].

### c-20260724-05 — Binh lực (lính) hồi theo timer bằng Mộ binh, tiêu Mộ Binh Lệnh (126987), có Tăng tốc; 带兵量 = trần binh lực
- **Sources**: [[sources/ingame-general-panel-2026-07-24]]
- **Status**: active — **First seen**: 2026-07-24
- **Notes**: 🎨 Binh lực hiển thị hiện-tại/trần (UNIT A 0/952380 cạn, timer 04:22; UNIT C đầy 647050/647050). Nút "Mộ binh" (hồi thường) vs "Tăng tốc mộ binh" (đẩy nhanh); tài nguyên "Mộ Binh Lệnh" dùng chung = 126987. 👤 带兵量 (Sức chứa quân) = trần binh lực của đơn vị (UNIT A +63492). Xem [[systems/general-system]], [[systems/economy-and-internal-affairs]].

### c-20260724-06 — Binh lực = HP tướng, chết-theo-hàng (official 逐字); 带兵量 = cấp + trang bị + 科技; mộ binh hồi theo timer, gần thành chính hồi nhanh hơn
- **Sources**: [[sources/ctxd-web-verify-2026-07-24]]
- **Status**: active (cấu trúc CHỐT official; con số mộ binh UNVERIFIED) — **First seen**: 2026-07-24
- **Notes**: Củng cố web-verify (2026-07-24):
  - **V9 — Binh lực = HP, chết-theo-hàng (CHỐT, official逐字)**: "部队伤亡以列为单位，一列部队兵力降至零则后一列补上，直至一方兵力均消耗完毕则战斗结束" → binh lực (兵力) là HP của đơn vị, thương vong tính THEO LIỆT (列/hàng), một hàng cạn thì hàng sau bù lên, đến khi một phe cạn sạch thì trận kết thúc. Nguồn: https://gc.aoshitang.com/news/ziliao/152012121118262077467.html . Khớp "chết-theo-hàng" (递进击杀) tại [[claims#c-20260627-04]].
  - **V10 — 带兵量 (trần binh lực, CHỐT)**: = 3 trụ **cấp tướng + trang bị/兵器 + 科技**. Nguồn: https://www.gameres.com/249586.html , https://gc.aoshitang.com/news/ziliao/152012121118262077467.html . Củng cố [[claims#c-20260724-05]].
  - **V11 — Mộ binh (cấu trúc CHỐT, con số UNVERIFIED)**: 兵力 hồi theo timer thời gian thực; càng gần thành chính hồi càng nhanh ("武将离主城越近，兵力恢复越快"); 募兵令/vàng bổ sung ngay. ⚠️ Con số cụ thể (-5 phút/lệnh, 5000 lính/lệnh, trần tích trữ) KHÔNG có nguồn → ĐỪNG ghi làm fact. Nguồn: https://www.gamersky.com/handbook/201405/359124.shtml , https://gc.aoshitang.com/news/ziliao/152012121118262077467.html
  Xem [[systems/general-system]], [[systems/battle-system]], [[systems/unit-entity-model]], [[sources/ctxd-web-verify-2026-07-24]].

### c-20260724-07 — Client server-authoritative: server tính toàn bộ trận → stream "báo cáo trận" đánh số; client chỉ replay
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (client Lua `lua/game/battle/fightLayer.lua:3413` `doBattleReport`, `reportHandler/<n>.lua`)
- **Status**: active (confirmed, primary/client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 Không có logic tính sát thương/né/bạo kích/targeting nào ở client. ~47 loại event (2=nạp đội hình, 3=cận chiến, 14=chiến pháp, 30/46=chết-theo-hàng, 7/31=kết quả…). Khớp [[technical/client-server-architecture]]. Củng cố [[claims#c-20260724-06]].

### c-20260724-08 — Chiến trường render `BATTLE_ROW_NUM = 12` ô-hàng; z-order = 12−row; chết-theo-hàng xác nhận ở code
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`battleConstants.lua:3`, `fightLayer.lua:472,493`; reportHandler 30/46)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 DỮ LIỆU MỚI — reference client vẽ **12 ô-hàng** trên trường (khác con số "≥4 hàng/tướng" của customer spec [[claims#c-20260627-22]]: 12 nhiều khả năng là tổng ô-hàng toàn trường). Xếp lính trong 1 nhóm dùng `troopPattern[1..7]` (3×3). Xem [[systems/battle-system]], [[systems/formation-system]]; đối chiếu [[contradictions#x-20260627-06]].

### c-20260724-09 — Mã ID chiến pháp 7 chữ số (loại×địa hình); nộ cast = server-gate (`useAble`) + tap thủ công
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`battleConstants.lua:156-340`; reportHandler/27, /14; `tacticsLayer.lua`)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: Chữ số đầu = loại (1=Đột kích/2=Phòng thủ/3=Công kích); chữ 2-3 = địa hình (11 bình nguyên/12 sơn địa/13 thuỷ vực/14 thành trì). "jiacheng"=biến thể khớp địa hình. Nút nộ chỉ hiện khi server đẩy `strategy.useAble>0`, bấm → `battleUserStrategy` (cast thủ công). Củng cố [[claims#c-20260724-03]], [[contradictions#x-20260627-02]] (client dùng `strategy`, không đặt tên 士气/怒气). `beHold` (0-3)=phản/giữ; `nextTacticId`=chiến pháp chuỗi. See [[systems/tactics-and-rage]].

### c-20260724-10 — 4 hệ khắc chế binh chủng: Bộ(步)/Kỵ(骑)/Cung(弓) đặt tên trong client + Khí giới (siege via `hasCar`); troopType hiển thị 1–9
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (textId 490727 Kỵ/490728 Cung/490729 Bộ; `army.lua:62-170`, `generalCard.lua:298-303`)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 Xác nhận hệ **4 binh chủng** (khớp V12 official 步/弓/骑/器械), **BÁC "hệ thứ 5 谋士/法师"**. Khắc chế binh chủng là **buff theo cấp** (Thức tỉnh + tech), không cố định per-unit → khớp [[claims#c-20260627-09]]. Tam giác chiến thuật (Đột kích→Công kích→Phòng thủ→Đột kích) là lớp riêng, khớp [[claims#c-20260627-05]]. Giải quyết hướng [[contradictions#x-20260627-01]]. troopType battle enum 16–60 → 7 rig; card kẹp 1–9. See [[systems/troop-types]].

### c-20260724-11 — 6 phẩm chất: Trắng < Lam < Lục < Vàng < Đỏ < **Tím** (color.lua `colorQualityName`)
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`lua/data/color.lua:1-16`; toggle "Chỉ mộ tướng Tím" 83045)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 Thứ tự client = **白蓝绿黄红紫** (Tím cao nhất) → **giải quyết [[contradictions#x-20260627-05]]**: xác nhận Claim A (CN, 紫 cao nhất), **bác** thứ tự VN egame.vn. Bậc 0 = xám (tử trận). Áp cho cả tướng lẫn trang bị. See [[systems/general-system]], [[systems/equipment-and-gear]].

### c-20260724-12 — Chỉ số nền client tướng = leader(Thống)+strength(Dũng)+att+def+fMax(HP tướng)+forces(quân số); KHÔNG có 武力
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`generalPanel.lua`; textId 82011 Thống/82013 Dũng)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 Xác nhận trực tiếp bằng code: 2 chỉ số nền Thống/Dũng, không field 武力 → củng cố [[claims#c-20260627-08]] và resolution [[contradictions#x-20260724-01]]. `forces/forcesMax` (quân số = máu phương trận) tách khỏi `fMax` (HP tướng). See [[systems/general-system]], [[systems/unit-entity-model]].

### c-20260724-13 — Thức tỉnh (觉醒) là trục tiến hoá tướng: `evoke` 0/1/2; vật liệu theo evokeType 0-6; sinh 4 kỹ năng nhỏ + 1 đại (max 5) + chỉ số vĩnh viễn + buff khắc chế binh chủng
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`generalPanel.lua:2063-3460`, `general/constant.lua:8` GENERAL_JUEXING_SKILL_MAX=5)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: KHÔNG có hệ nâng-sao cổ điển ở client; Thức tỉnh là cơ chế evolve. Vật liệu: Vàng/Gem/Đá/Rượu 2302/Đỗ Khang/Rượu Gia Cát (riêng tướng 269). Số liệu (đường cong, tỉ lệ) ở server → làm giàu [[claims#c-20260627-10]] (lv120/121 là cổng server). See [[systems/general-system]].

### c-20260724-14 — Hệ nô lệ/tù nhân: bắt tướng địch vào Nhà lao → lao dịch; nô lệ tiêu hao để cải tạo công trình (Lỗ Ban); resource enum slave(8)/enslave(9)/slave_owner(10)
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`battleConstants.lua:83-85`, `general/jail/ui.lua`, `resourceArea2/ui.lua:726`)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 DỮ LIỆU MỚI — cơ chế kinh tế/PvP chưa có trong wiki. Mua thêm lượt cướp nô bằng Vàng (`buyGrabCost`). See [[systems/economy-and-internal-affairs]], [[systems/city-conquest]].

### c-20260724-15 — `feud` = Phong Địa (fief) sản xuất tài nguyên, KHÔNG phải bang hội; không có guild kiểu MMO — cộng đồng = Quốc gia + Quân Đoàn (corps)
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`feud/FeudPanel.lua` textId 121067/121068/75097; `corps/CorpsPanelNew.lua`)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: 🔑 ĐÍNH CHÍNH — nạp cứ điểm đã chiếm thành phong địa để sản xuất; bị chiếm thì ngừng. "Liên minh" = ngoại giao 2-đánh-1 giữa 3 nước (`world/ShowLeague.lua`). See [[systems/multiplayer-and-endgame]].

### c-20260724-16 — Viễn chinh cross-server mở rộng ngoài Trung Nguyên: Cao Ly, Nhật (Đông Doanh), Lưu Cầu, Nam Chiếu, Việt Nam (Giao Chỉ)
- **Sources**: [[sources/apk-reverse-engineering-2026-07-24]] (`lua/layer/kfyzWorld/config/road/{gaoli,japan,liuqiu,nanzhao,yuenan}CubePoly`)
- **Status**: active (confirmed, client code) — **First seen**: 2026-07-24
- **Notes**: Bản đồ liên máy chủ. Chế độ kf*: kfmg (Diệt Quốc), kfwd (Giải Tiên Phong), kfzb (Giải Tranh Bá), kfyz (Viễn chinh Đông Doanh). See [[systems/multiplayer-and-endgame]], [[world/world-map-and-campaign]].

---
## Backlinks
- [[sources/apk-reverse-engineering-2026-07-24]] — nguồn dịch ngược client (c-20260724-07…16)
- [[systems/unit-entity-model]] — mô hình tướng-lính hợp nhất (c-20260724-01/03)
- [[systems/troop-types]] — binh chủng có cấp + tên riêng (c-20260724-02)
- [[systems/tactics-and-rage]] — chiến pháp N-lần/điều kiện, số hàng (c-20260724-03)
- [[systems/general-system]] — thiên phú buff Lực chiến, mộ binh, 带兵量, binh lực=HP (c-20260724-04/05/06)
- [[systems/economy-and-internal-affairs]] — Mộ Binh Lệnh, timer mộ binh (c-20260724-05/06)
- [[systems/equipment-and-gear]] — open-question 战力 / Lực chiến (c-20260724-04)
- [[systems/battle-system]] — chết-theo-hàng, binh lực=HP (c-20260724-06)
- [[sources/ingame-general-panel-2026-07-24]] — nguồn ảnh panel Tướng lĩnh
- [[sources/ctxd-web-verify-2026-07-24]] — xác minh web nguồn thật 2026-07-24 (V1–V12, X1–X3, E1)
- [[decisions/game-version-scope]] — bằng chứng mobile chờ chốt scope (c-20260724-02)
- [[decisions/battle-geometry-server-model-2026-06-30]] — model đơn vị/hàng (c-20260724-01)
- [[contradictions]] — mâu thuẫn binh chủng theo version (c-20260724-02)
