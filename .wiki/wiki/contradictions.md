---
title: Contradictions
category: meta
created: 2026-06-27
updated: 2026-07-24
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
- **MOBILE EVIDENCE (2026-07-24)**: 4 ảnh màn "Tướng lĩnh" bản MOBILE 攻城掠地 ([[sources/ingame-general-panel-2026-07-24]]) cho thấy **3 binh chủng có cấp + tên riêng**. UNIT B "Nhục Bác **Tử Sĩ** lv4" = 肉搏死士 (死士 = quân cảm tử; 黄金肉搏死士 = binh chủng vàng của 周泰 Chu Thái, thuần cận chiến "không phụ thuộc chiến pháp" → giải thích ô chiến pháp TRỐNG; độ tin MEDIUM, nguồn fansite: <https://www.shiyouhome.com/gcld/wjfx/1999.html>, <https://www.233leyuan.com/post-detail/1991837600193638277>). UNIT A "Công Thành Xa LV4" = ⚠️ 攻城车 (PARTIAL — siege 器械 có thật, nhưng "攻城车" có thể là mô tả loại, không phải tên định danh). UNIT C "H.kim chiến kỳ cấp 4" = ⚠️ 黄金战骑 (UNVERIFIED — không nguồn nào ra đúng chuỗi). Củng cố drift (binh chủng có tên riêng, vượt xa roster 4 loại phẳng). ⚠️ Đây là **bằng chứng mobile, chờ chủ dự án chốt** ([[decisions/game-version-scope]]) — **KHÔNG phủ nhận** kết luận 4-binh-chủng 2013 (c-20260627-09); hai build khác nhau.
- **HỆ CHÍNH THỨC (2026-07-24, V12)**: hệ khắc chế thật của 攻城掠地 là **4 binh chủng 步/弓/骑/器械** (步克弓 / 弓克骑 / 骑克器械 / 器械克步), biểu hiện qua **兵种天赋**; **"binh chủng thứ 5 法师/谋士" là nội dung trộn game khác → BÁC**. Lưu ý app store nêu "12种兵种" (nhiều khả năng 4 hệ × nhiều bậc). NGUỒN: <https://www.9game.cn/news/9969087.html>, <https://apps.apple.com/us/app/id1444310665> ([[sources/ctxd-web-verify-2026-07-24]]).
- **RÀNG BUỘC X1 — GIỮ CẢNH BÁO, KHÔNG gán CTXD**:
  > [!warning] Hệ bậc sao binh chủng (兵种星级) — CHƯA có nguồn 攻城掠地
  > Hệ "bậc sao binh chủng 兵种星级" (战录 50/100/150/200; 4★ nhân đôi thiên phú; 5★ sĩ khí 100) — các con số này **TRUY VỀ GAME KHÁC** (三国志战略版 / 率土之滨 / 乱世曹操传), **KHÔNG có nguồn 攻城掠地 official**. TUYỆT ĐỐI **KHÔNG** viết hệ sao này là cơ chế đã-chốt của CTXD. Nhãn "LV4/cấp4" trên panel là **bậc SAO hay CẤP ĐỘ vẫn CHƯA chốt** (open question) — xem [[open-questions]].
- **CLIENT EVIDENCE (2026-07-24, dịch ngược)**: client 攻城掠地 v8.9.0.6 đặt tên **3 lớp khắc chế binh chủng Bộ(步)/Kỵ(骑)/Cung(弓)** (textId 490729/490727/490728) + **Khí giới/công thành** qua cờ `hasCar` → **4 hệ**, khớp V12 official 步/弓/骑/器械. KHÔNG có class 谋士/法师 trong code. Khắc chế = buff theo cấp (Thức tỉnh/tech), không cố định per-unit. troopType hiển thị 1–9 (battle enum 16–60 = skin đơn vị). Xem [[claims#c-20260724-10]], [[sources/apk-reverse-engineering-2026-07-24]].
- **Status**: open — live game có ≥5 icon binh chủng nhưng hệ khắc chế official + client là **4 hệ** (V12 + dịch ngược); "binh chủng thứ 5 法师/谋士" bị BÁC (không có trong code); hệ bậc sao binh chủng chưa có nguồn CTXD; roster đầy đủ & luật khắc chế per-build còn chờ chủ dự án chốt. See [[systems/troop-types]].

### x-20260627-02 — Rage bar (怒气) vs morale model (士气)
- **Claim A**: Combat uses a "怒气" rage bar that fills and is spent on 战法 (and the project has `warFeatAnger` art). — brief framing, napgamemobile, asset folder
- **Claim B**: The documented mechanic is **morale (士气)**: start 50, fill via combat, cast **skill-2** at 100; 5★ start at 100; 战法 triggers are also condition-based (on-deploy %, on-kill, HP thresholds). — stzb.163.com, taptap.cn, gc.aoshitang.com
- **BỔ SUNG (2026-07-24, V5 — official cast THỦ CÔNG)**: người chơi **BẤM hình tướng** để thả 战法 khi thanh đầy ("点击中间武将头像就会释放该武将的战法") — tức là 战法 có thể **cast bằng tay** (tap portrait), không thuần passive/auto. NGUỒN: <https://gc.aoshitang.com/news/ziliao/152012121118262077467.html> ([[sources/ctxd-web-verify-2026-07-24]]).
  > [!warning] Thuật ngữ 士气 vs 怒气 CHƯA chốt
  > Official (aoshitang) **không dùng** từ 士气 hay 怒气 khi mô tả thanh nạp; gamersky lại có 怒气. ⇒ **ĐỪNG khẳng định 怒气 là sai** — hai tên có thể cùng chỉ một thanh nạp; giữ mở cho tới khi có nguồn official chốt thuật ngữ.
- **CLIENT EVIDENCE (2026-07-24, dịch ngược)**: client dùng `strategy.useAble` (server đẩy số lần dùng được) + nút nộ trên `tacticsLayer` (report 27); bấm → `battleUserStrategy` (**cast thủ công**, khớp V5). Code **không đặt tên** 士气/怒气 (chỉ `strategy`) → thuật ngữ vẫn mở, nhưng cơ chế "server-gate + tap thủ công" được xác nhận trực tiếp. Xem [[claims#c-20260724-09]], [[sources/apk-reverse-engineering-2026-07-24]].
- **Status**: open (likely the same gauge under two names) — treat as a morale/charge gauge driving a skill, cast **thủ công bằng cách bấm hình tướng** (V5, client-confirmed); thuật ngữ 士气/怒气 chưa chốt. See [[claims#c-20260627-07]], [[systems/tactics-and-rage]].

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
- **CLIENT EVIDENCE (2026-07-24, dịch ngược)**: `lua/data/color.lua` `colorQualityName` = White/Blue/Green/Yellow/Red/Violet → phẩm chất client là **白蓝绿黄红紫** (Trắng<Lam<Lục<Vàng<Đỏ<**Tím** cao nhất), 6 bậc; bậc 0=xám (tử trận). Xác nhận Claim A (紫 cao nhất); **bác** Claim B (egame.vn đảo chiều + thêm bậc Cam/Unique/Thiên Mệnh không có ở client v8.9.0.6). Xem [[claims#c-20260724-11]], [[sources/apk-reverse-engineering-2026-07-24]].
- **Status**: ✅ **resolved → A** (client-confirmed 6 bậc 白蓝绿黄红紫; bản VN đời sau có thể thêm bậc, nhưng build này 6 bậc). See [[systems/general-system]].

### x-20260627-06 — Battle geometry (rows)
- **Claim A**: Battlefield is **5 rows (五排)** per side. — baike.baidu.com, f166.com
- **Claim B**: A general commands **4 rows (一个武将有4排部队)**; columns die and advance. — doyo.cn
- **Claim C**: 桃园之誓 joint awakening expands the formation to **6 rows**. — shiyouhome.com
- **PRIMARY EVIDENCE (2026-06-27)**: In-game screenshots ([[sources/screenshot-somo-battle-2026-06-27]]) show isometric diagonal field + **5 numbered positions 一二三四五** per side.
- **RESOLUTION (2026-06-27)** — customer spec ([[sources/customer-battle-ui-spec-2026-06-27]]) settles the model: each side = queue of ≤5 generals fighting **sequentially** (1 active/side at a time); **each general = ≥4 rows** advancing one at a time; **each row = 3 groups**; **each group = N soldiers (default 6, variable)**. The "5 rows / 4 rows / 6 rows" figures were conflating *rows-per-general* (≥4, upgradable) with *generals-per-side* (5). Reconciled.
- **CLIENT EVIDENCE (2026-07-24, dịch ngược)**: reference client dùng `BATTLE_ROW_NUM = 12` (tổng ô-hàng render toàn trường, z-order=12−row); chết-theo-hàng xác nhận (reportHandler 30/46). Con số 12 = ô-hàng-toàn-trường, không mâu thuẫn model "5 tướng × ≥4 hàng/tướng" (customer spec). Xem [[claims#c-20260724-08]], [[sources/apk-reverse-engineering-2026-07-24]].
- **Status**: ✅ **resolved** → see geometry in [[systems/battle-system]]. (Claim A=upgraded row state, B=base rows/general, C=Đào Viên expansion — all consistent; client render dùng 12 ô-hàng-toàn-trường.)

### x-20260627-07 — National-war XP bonus magnitude
- **Claim A**: National war gives ~**+50%** XP vs PvE 副本. — gamersky.com, aoshitang leveling guide
- **Claim B**: The 磨砺 tech (lv72) gives **+30%** national-war KILL XP. — kuwan8.com
- **Status**: open — likely two different bonuses (base mode bonus vs a tech); reconcile. See [[systems/multiplayer-and-endgame]].

## Resolved

### x-20260724-01 — Ánh xạ Thống(统)/Dũng(勇) — 3 khung mâu thuẫn
- **Khung 1** — [[systems/general-system]] từng khẳng định **武力(Vũ Lực) = sát thương**, còn **统(Thống)/勇(Dũng) = phòng thủ / chặn chiến pháp**. ❌ **LOẠI** — sai: 攻城掠地 **KHÔNG có 武力(Vũ Lực) riêng**.
- **Khung 2** — [[claims#c-20260627-08]]: **统 drives normal atk/def**, **勇 drives 战法 (chiến pháp) atk/def**. ✅ Đúng chiều & khớp V1.
- **Khung 3** — model mới (panel in-game + code suy diễn): **Thống → NormalAtk**, **Dũng → TacticAtk**. ✅ Đúng CHIỀU, nhưng **thiếu vế phòng thủ**: mỗi stat chi phối **CẢ atk LẪN def** (Thống → 普通攻击+普通防御; Dũng → 战法攻击+战法防御), không phải chỉ atk.
- **Bằng chứng mới (2026-07-24)**: ảnh panel "Tướng lĩnh" ([[sources/ingame-general-panel-2026-07-24]]) — UNIT A **Thống 171 / Dũng 170**, UNIT B **Thống 159 / Dũng 62** (Dũng rất thấp, không có chiến pháp), UNIT C **Thống 169 / Dũng 169**. "UNIT B Dũng thấp + không chiến pháp" chỉ là **TƯƠNG QUAN**, KHÔNG phải bằng chứng nhân-quả.
- **RESOLUTION (2026-07-24, official V1)** → theo **Khung 2 + Khung 3 (đã bổ sung def)**. 攻城掠地 CHỈ có **2 chỉ số nền 统(Thống) & 勇(Dũng)**, KHÔNG có **武力(Vũ Lực)** riêng. **统** chi phối **普通攻击 + 普通防御** (đòn thường, cả công LẪN thủ); **勇** chi phối **战法攻击 + 战法防御** (chiến pháp, cả công LẪN thủ). 1 điểm ≈ 10 công/thủ. 5 thuộc tính giải đòn: 普通攻击/普通防御/战法攻击/战法防御/计策. NGUỒN: <https://gc.aoshitang.com/news/zixun/322013031413222593632.html>, <http://gcld.49you.com/gonglue/60744.html> ([[sources/ctxd-web-verify-2026-07-24]]).
- **Status**: ✅ **resolved** → Khung 1 LOẠI; Khung 3 đúng chiều nhưng mỗi stat gồm cả atk lẫn def. Xem [[systems/general-system]], [[systems/unit-entity-model]], [[claims#c-20260627-08]].

---
## Backlinks
- [[sources/apk-reverse-engineering-2026-07-24]] — dịch ngược client giải quyết x-05 (phẩm chất), củng cố x-01 (binh chủng), x-02 (nộ), x-06 (12 hàng)
- [[systems/unit-entity-model]] — model Thống/Dũng → NormalAtk/TacticAtk (x-20260724-01, resolved)
- [[systems/general-system]] — 统→普通攻+防, 勇→战法攻+防; KHÔNG có 武力 (x-20260724-01, resolved)
- [[systems/troop-types]] — roster binh chủng, 4 hệ khắc chế & version drift (x-20260627-01)
- [[systems/tactics-and-rage]] — cast thủ công bấm hình tướng; 士气/怒气 (x-20260627-02)
- [[decisions/game-version-scope]] — target build somo vs mobile (x-20260627-01, x-20260724-01)
- [[claims]] — c-20260627-08 (Thống/Dũng), c-20260627-09 (4 binh chủng 2013)
- [[open-questions]] — LV4 = bậc sao hay cấp độ chưa chốt; công thức derive stat
- [[sources/ingame-general-panel-2026-07-24]] — ảnh panel Tướng lĩnh (mobile)
- [[sources/ctxd-web-verify-2026-07-24]] — xác minh web official (V1 统/勇, V5 cast thủ công, V12 4 binh chủng)
