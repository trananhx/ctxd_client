---
title: Open Questions
category: meta
created: 2026-06-27
updated: 2026-07-24
---

# Open Questions

Game design / tech questions the wiki cannot fully answer yet. Move entries to "Answered" when resolved.

## Open

### q-20260630-01 — Battle-slice implementation follow-ups (deferred from the verified build)
- **Why it matters**: The battle vertical slice is playable & reviewed ([[technical/ctxd-architecture]] §Trạng thái hiện thực), but several GDD rules / quality items are intentionally deferred.
- **Items**:
  1. **Skill1 (kỹ năng sĩ khí thấp)** — GDD §3.4 says generals have a low-morale tactic + the full-morale one. Sim only casts Skill2; `Combatant.Skill1` is loaded but never cast, and sample content never authors it. **Trigger condition is undefined in the GDD** (threshold? auto vs on-demand?) — needs a design decision before implementing in `BattleRunner.PerformAction`. See [[systems/tactics-and-rage]].
  2. **AoE đa mục tiêu** — `AoeDamageEffect` currently only scales damage (rowFactor) onto the single active enemy general (queue is 1v1-active), not multiple entities. True multi-target needs a `TacticContext.Targets` list once more than one enemy is on-field.
  3. **Pushback (đẩy lùi) semantics** — implemented as +PushbackTroops flat bonus damage; GDD describes repositioning rear troops. Decide fixed-vs-scaled-vs-queue-reorder.
  4. **Cân bằng số liệu** — stance/morale/crit/terrain multipliers are placeholders; unverified vs the live game (blocked by [[#q-20260627-04]]).
  5. **Quality**: object-pool floating text / effects (GC), pre-battle lineup + terrain selection UI, formation aura visuals.
- **Status**: open (tracked for the next build pass).

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
- **Partial (2026-07-24)**: 4 ảnh màn "Tướng lĩnh" (MOBILE 攻城掠地) cho **ví dụ % thiên phú per-đơn-vị** kèm địa hình: A "Thành trì Lực chiến +60% (chỉ phe công)", B "Bình nguyên、Sơn địa、Thủy vực Lực chiến +20%", C "Bình nguyên Lực chiến +25%". 🎨 Nhưng đây là **talent per-tướng**, CHƯA phải bảng địa-hình×binh-chủng toàn cục → vẫn open. Trỏ [[claims]] (c-20260724-04).
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

### q-20260724-01 — Ý nghĩa icon chiến thuật (tactic-slot) gắn theo đơn vị?
- **Bối cảnh**: 4 ảnh màn "Tướng lĩnh" (bản MOBILE 攻城掠地) cho thấy mỗi đơn vị có một dãy icon "Chiến thuật" với số lượng khác nhau: UNIT A `[▲ xanh][❌ đỏ]`; UNIT B `[▲×2][tím×2][❌×2]`; UNIT C `[▲×1]`. 🎨
- **Câu hỏi ❓**: ▲ xanh / (tím) / ❌ đỏ nghĩa là gì, và vì sao **số lượng khác nhau** giữa các đơn vị?
- **Giả thuyết ⚠️**: `×N = charge` (số lần/số nấc tích lũy của một hiệu ứng chiến thuật). Chưa xác nhận.
- **Cần**: ảnh màn **Trận pháp / chiến thuật** (tab riêng trong game) để đối chiếu ý nghĩa từng icon.
- **Status**: open. See [[systems/tactics-and-rage]].

### q-20260724-02 — Cấp binh chủng (bậc sao 4★) ảnh hưởng chỉ số/带兵量 theo đường cong nào?
- **Bối cảnh**: Cả 3 đơn vị đều có hậu tố `LV4 / lv4 / cấp 4` trên binh chủng (Công Thành Xa LV4, Nhục Bác **Tử Sĩ** lv4, H.kim chiến kỳ cấp 4). Trước đây suy luận đây là **bậc sao binh chủng (兵种星级 4★)** tách khỏi cấp tướng (Lv.220/201/204). ⚠️
- **Đảo ngược X3 (2026-07-24, phản biện web)**: **"LV4" = bậc SAO hay CẤP ĐỘ vẫn CHƯA xác nhận cho 攻城掠地.** Cả **hệ sao binh chủng (兵种星级)** LẪN **hệ cấp binh chủng** đều CHƯA có nguồn official cho CTXD. Các con số của hệ sao (战录 50/100/150/200, 4★ nhân đôi thiên phú, 5★ sĩ khí 100) truy về **game khác** (三国志战略版 / 率土之滨 / 乱世曹操传) → TUYỆT ĐỐI KHÔNG chốt hệ sao là cơ chế đã-xác-nhận của CTXD. Xem [[contradictions]] (X1/X3-2026-07-24).
- **Câu hỏi ❓**: (a) "LV4" là bậc **sao** hay **cấp** binh chủng? (b) dù là gì, nó nâng chỉ số (Công/Thủ) và **sức chứa quân (带兵量)** theo đường cong nào (tuyến tính / bậc thang / nhân hệ số)?
- **Cần**: ảnh gốc màn nâng cấp/thăng sao binh chủng trong 攻城掠地 (không phải game khác) để xác nhận hệ nào tồn tại + đường cong.
- **Status**: open (X3 — cả hệ sao lẫn hệ cấp đều chưa xác nhận cho CTXD). See [[systems/troop-types]], [[contradictions]].

### q-20260724-03 — "Lực chiến (战力)" là gì — công thức tổng hợp; thiên phú buff % vào con số này?
- **Bối cảnh**: Thiên phú in-game của cả 3 đơn vị đều ghi buff **"Lực chiến (战力) +%"** kèm điều kiện địa hình (A: Thành trì +60% chỉ phe công; B: Bình nguyên/Sơn địa/Thủy vực +20%; C: Bình nguyên +25%). 🎨
- **Câu hỏi ❓**: "Lực chiến (战力)" là **chỉ số TỔNG HỢP** (power rating) tính từ đâu (công thức tổng hợp Công/Thủ/带兵量/...)? Thiên phú % có cộng % trực tiếp vào con số 战力 này không?
- **Lưu ý FIX-1**: KHÔNG dịch 战力 thành "sát thương". Ý đồ chủ dự án ("thiên phú = buff sát thương cho lính") là DESIGN INTENT, chênh với chữ in-game (+Lực chiến 战力) → treo open-question 战力.
- **Củng cố V6 (2026-07-24, web)**: 战力(Lực chiến) = chỉ số **TỔNG HỢP thực lực**, KHÔNG = sát thương; buff "+X% 战力/战斗力" là **hệ số NHÂN** (1+加成) trong công thức. NGUỒN: http://www.07073.com/gcld/gonglue/1145296.html. (Cấu trúc "战力 +X% chỉ phe công 仅攻方" là thật — vd Tư Mã Ý "攻城战斗力+25%".)
- **Status**: open (công thức tổng hợp cụ thể vẫn thiếu). See [[systems/equipment-and-gear]], [[claims]] (c-20260724-04), [[sources/ctxd-web-verify-2026-07-24]].

### q-20260724-04 — Tên định danh chính thức của "攻城车" và "黄金战骑" (cần ảnh gốc)? ⚠️
- **Bối cảnh**: Trên 4 ảnh "Tướng lĩnh" MOBILE, UNIT A gắn binh chủng dịch là **"Công Thành Xa / 攻城车"** và UNIT C dịch là **"H.kim chiến kỳ / 黄金战骑"**. Cần xác nhận đây có phải tên **định danh** binh chủng hay chỉ là mô tả loại.
- **Đảo ngược X2 (2026-07-24, phản biện web)**:
  - **"攻城车" (UNIT A) = PARTIAL/⚠️** — binh chủng khí giới công thành (器械) là có thật, NHƯNG "攻城车" có thể chỉ là **mô tả loại**, chưa chắc là tên định danh trong game.
  - **"黄金战骑" (UNIT C) = UNVERIFIED** — KHÔNG nguồn web nào ra đúng chuỗi "黄金战骑". Giữ ⚠️, KHÔNG chốt tên, KHÔNG đoán tướng sở hữu.
- **Câu hỏi ❓**: Tên tiếng Trung/Việt **định danh** thật của binh chủng UNIT A và UNIT C là gì?
- **Cần**: **ảnh gốc** (nguyên văn tiếng Trung, không qua dịch app) màn binh chủng của 2 đơn vị này để chốt tên.
- **Status**: open (X2 — cả hai tên chưa chốt). See [[systems/troop-types]], [[entities/generals]], [[contradictions]].

### q-20260724-05 — 计策系统 (hệ Kế Sách) do 统 (Thống) hay 勇 (Dũng) chi phối?
- **Bối cảnh**: Web official xác nhận (V1) 攻城掠地 có 5 thuộc tính giải đòn: **普通攻击 / 普通防御 / 战法攻击 / 战法防御 / 计策**. Trong đó 统 chi phối 普通攻击+普通防御 (đòn thường), 勇 chi phối 战法攻击+战法防御 (chiến pháp). NGUỒN: https://gc.aoshitang.com/news/zixun/322013031413222593632.html
- **Câu hỏi ❓**: Thuộc tính thứ 5 — **计策 (Kế Sách)** — do chỉ số nền nào (统 hay 勇) chi phối, hay là một trục độc lập? Chưa nguồn nào nói rõ.
- **Cần**: nguồn official/wiki nêu 计策 gắn với 统 hay 勇.
- **Status**: open (chưa nguồn). See [[systems/tactics-and-rage]], [[contradictions]], [[sources/ctxd-web-verify-2026-07-24]].

### q-20260724-06 — Con số cụ thể của 募兵令 và thiên phú công thành +60% (cần ảnh gốc, UNVERIFIED)? ⚠️
- **Bối cảnh**: Hai nhóm con số đang bị nghi ngờ:
  - **募兵令 (Mộ Binh Lệnh)**: cấu trúc "兵力 hồi theo timer thời gian thực; càng gần thành chính hồi càng nhanh; 募兵令/vàng bổ sung ngay" LÀ THẬT (V11). NHƯNG con số cụ thể — **-5 phút/lệnh, 5000 lính/lệnh, trần tích trữ** — KHÔNG có nguồn. NGUỒN cấu trúc: https://www.gamersky.com/handbook/201405/359124.shtml , https://gc.aoshitang.com/news/ziliao/152012121118262077467.html
  - **Thiên phú công thành +60%** (UNIT A "Thành trì Lực chiến +60% chỉ phe công"): cấu trúc "+X% 战力 仅攻方" LÀ THẬT (V7, vd Tư Mã Ý +25%), NHƯNG con số **+60%** KHÔNG có nguồn — mọi thiên phú công thành có nguồn đều **+25%**; 60% có thể là bonus phối-binh-bình-nguyên, không phải 1 dòng thiên phú tướng. NGUỒN: https://www.shiyouhome.com/gcld/wjfx/2009.html , https://www.602.com/news/33/6396.html
- **Câu hỏi ❓**: Con số thật của (a) 募兵令 (phút giảm / lính bổ sung / trần tích trữ) và (b) thiên phú công thành của UNIT A là bao nhiêu?
- **Cần**: **ảnh gốc** in-game (nguyên văn tiếng Trung) của màn 募兵 và thẻ thiên phú UNIT A. ⚠️ ĐỪNG ghi các con số trên làm fact cho tới khi có ảnh gốc.
- **Status**: open (UNVERIFIED — cấu trúc thật, con số chưa xác nhận). See [[systems/troop-types]], [[systems/economy-and-internal-affairs]], [[claims]], [[sources/ctxd-web-verify-2026-07-24]].

## Answered

### q-20260627-01 — What is the core combat loop? → answered
- **Answer**: Turn-based queue combat, up to 5 generals, 3-stance rock-paper-scissors, 战法 above stances, morale-gated skill-2, win by wiping the enemy. See [[systems/battle-system]], [[systems/tactics-and-rage]].

### q-20260627-03 — What do the numeric unit IDs map to? → partially answered
- **Answer**: They are generals/troops from the Tam Quốc roster (200+ generals). Exact ID→general mapping still needs a data table. See [[entities/generals]], [[systems/general-system]].

### q-20260724-01 — Quan hệ tướng↔lính: 1 hay 2 đối tượng? → ANSWERED
- **Answer (2026-07-24)**: **MỘT đối tượng** — tướng và lính (binh chủng) là cùng một thực thể thống nhất (unified unit-entity model), không tách thành 2 đối tượng riêng. Bằng chứng: 4 ảnh màn "Tướng lĩnh" cho thấy mỗi tướng gắn liền một binh chủng + chỉ số + thiên phú + binh lực trong cùng một thẻ đơn vị. 🎨
- **Trỏ**: [[systems/unit-entity-model]], [[decisions/unified-unit-entity-model-2026-07-24]], [[claims]] (c-20260724-01).
- **Status**: ✅ answered.

### q-20260724-02b — Hai chỉ số nền 统/勇 map thế nào vào 5 thuộc tính đòn (& khớp code)? → ANSWERED
- **Answer (2026-07-24, official web V1)**: 攻城掠地 CHỈ có **2 chỉ số nền**: **统 (Thống)** & **勇 (Dũng)** — **KHÔNG có 武力 (Vũ Lực) riêng**. Ánh xạ:
  - **统** chi phối **普通攻击 + 普通防御** (đòn thường — cả CÔNG lẫn THỦ).
  - **勇** chi phối **战法攻击 + 战法防御** (chiến pháp — cả CÔNG lẫn THỦ).
  - Quy đổi ≈ **1 điểm 统/勇 → 10 công/thủ**. 5 thuộc tính giải đòn: 普通攻击 / 普通防御 / 战法攻击 / 战法防御 / 计策 (thuộc tính 计策 do 统 hay 勇 chi phối vẫn open — xem [[#q-20260724-05]]).
- **NGUỒN (official)**: https://gc.aoshitang.com/news/zixun/322013031413222593632.html , http://gcld.49you.com/gonglue/60744.html
- **Khớp code**: khẳng định này giải mâu thuẫn 统/勇↔code đã ghi ở [[contradictions]] **x-20260724-01** (RESOLVED). Trỏ [[systems/general-system]], [[sources/ctxd-web-verify-2026-07-24]].
- **Status**: ✅ answered (V1). See [[contradictions]] (x-20260724-01).

---
## Backlinks
- [[systems/unit-entity-model]] — mô hình 1-đối-tượng trả lời q-20260724-01
- [[decisions/unified-unit-entity-model-2026-07-24]] — quyết định hợp nhất tướng↔lính
- [[systems/tactics-and-rage]] — icon chiến thuật (q-20260724-01), 计策 (q-20260724-05), Skill1/AoE/pushback
- [[systems/troop-types]] — LV4 sao/cấp (q-20260724-02), tên 攻城车/黄金战骑 (q-20260724-04), 募兵令 (q-20260724-06), talent/counter
- [[systems/equipment-and-gear]] — Lực chiến (战力) (q-20260724-03)
- [[systems/general-system]] — 2 chỉ số nền 统/勇 (q-20260724-02b)
- [[systems/economy-and-internal-affairs]] — 募兵令 (q-20260724-06)
- [[systems/battle-system]] — hình học, đội hình
- [[systems/formation-system]] — catalog đội hình (q-20260627-13)
- [[claims]] — c-20260724-01, c-20260724-04
- [[contradictions]] — 统/勇 (x-20260724-01 RESOLVED), hệ sao (X1/X3), version scope
- [[decisions/game-version-scope]] — build target (q-20260627-06)
- [[sources/ctxd-web-verify-2026-07-24]] — nghiên cứu web xác minh 统/勇, Mã Siêu, số hàng, 战力, chết-theo-hàng…
