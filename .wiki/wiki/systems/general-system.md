---
title: Hệ tướng (武将)
category: systems
tags: [general, tuong, awakening, giac-tinh, recruitment, progression, unit-entity, thien-phu]
sources: []
created: 2026-06-27
updated: 2026-07-24
---

# Hệ tướng (武将)

Hệ tướng (武将, "vũ tướng") là lớp tiến hóa cốt lõi của **Công Thành Xưng Đế** (攻城掠地). Toàn bộ hành trình của người chơi xoay quanh việc thu thập, nuôi dưỡng và giác tỉnh một dàn danh tướng Tam Quốc. Đây là trang anh em với [[entities/generals]] (hồ sơ từng tướng) và liên kết chặt với [[systems/tactics-and-rage]] (chiến pháp & nộ khí), [[systems/equipment-and-gear]] (binh khí) và [[systems/city-conquest]] (công thành).

> [!info] Xác thực từ dịch ngược client (2026-07-24) — [[sources/apk-reverse-engineering-2026-07-24]]
> Chỉ số nền client = **leader (Thống, 统) + strength (Dũng, 勇)** + att/def + `fMax` (HP tướng) + `forces/forcesMax` (quân số = máu phương trận, tách khỏi fMax); **KHÔNG có 武力 riêng** (củng cố [[claims#c-20260627-08]], resolve [[contradictions#x-20260724-01]]). **6 phẩm chất**: Trắng < Lam < Lục < Vàng < Đỏ < **Tím** (`lua/data/color.lua`, `colorQualityName`; bậc 0 = xám/tử trận) → **giải quyết** mâu thuẫn thứ tự phẩm chất (CN 紫 cao nhất; bác thứ tự VN egame). **Thức tỉnh (觉醒)** là trục tiến hoá chính: `general.evoke` 0/1/2; vật liệu theo `evokeType` 0-6 (Vàng/Gem/Đá/Rượu 2302/Đỗ Khang/Rượu Gia Cát); sinh **4 kỹ năng nhỏ + 1 đại** (`GENERAL_JUEXING_SKILL_MAX=5`) + chỉ số vĩnh viễn + buff khắc chế binh chủng + thiên phú địa hình. Trang bị **8 loại** (vũ khí/ngựa/giáp/áo choàng/binh phù/cờ/bảo vật/bộ). Chiêu mộ Quán rượu (5 thẻ, làm mới, toggle "chỉ mộ Tím"). Số liệu (chỉ số gốc, tỉ lệ rơi, đường cong EXP, điều kiện thức tỉnh lv120/121) ở server. Xem [[claims#c-20260724-11]], [[claims#c-20260724-12]], [[claims#c-20260724-13]].

## Tổng quan đội hình & binh chủng

Dàn tướng có quy mô **200+ tướng**, mỗi tướng gắn cứng với **một binh chủng** duy nhất. Bản Việt hóa thường nêu 5 binh chủng: Thương (枪), Kỵ (骑), Cung (弓), Mưu (谋士/strategist) và một binh chủng thứ năm còn tranh cãi về cách gọi.

> [!info] Mỗi tướng LÀ một đơn vị mang binh chủng ra trận
> Mô hình đã chốt: **tướng + lính = MỘT đối tượng duy nhất** — tướng không đứng tách khỏi quân của mình, mà chính là đơn vị mang binh chủng (và toàn bộ đám lính của binh chủng đó) ra chiến trường. Panel "Tướng lĩnh" (bản mobile 攻城掠地) hiển thị binh chủng **KÈM CẤP** ngay dưới chân dung tướng — ví dụ UNIT A "Công Thành Xa **LV4**", UNIT B "Nhục Bác Tứ Sĩ **lv4**", UNIT C "H.kim chiến kỳ **cấp 4**" 🎨. Hậu tố LV4/lv4/cấp4 nhiều khả năng là **bậc sao/cấp của binh chủng (兵种星级 4★)**, TÁCH khỏi cấp tướng (Lv.220/201/204) — đây là suy luận ⚠️. Xem mô hình dữ liệu thống nhất ở [[systems/unit-entity-model]] và quyết định chốt tại [[decisions/unified-unit-entity-model-2026-07-24]].

> [!warning] Binh chủng thứ năm: Nỏ hay Chiến Xa?
> Một số mô tả tiếng Việt ghi binh chủng thứ năm là **Nỏ (弩)**, nhưng nguồn gốc Trung Quốc và nguồn bản mobile 2019 lại ghi là **Chiến Xa (战车 / Chiến Xa)**: "枪兵、骑兵、战车、弓手、谋士". Số lượng 200+ tướng và cấu trúc 5 binh chủng là [partially-confirmed]; tên gọi Nỏ vs Chiến Xa phụ thuộc phiên bản/nguồn. Khi dựng lại, xem [[systems/troop-types]] để chốt danh sách binh chủng cho bản 2013.

Khắc chế binh chủng và 3 thế trận 突击/攻击/防御 được mô tả ở [[systems/troop-types]] và [[systems/tactics-and-rage]].

## Phẩm chất / độ hiếm

Phẩm chất tướng phân theo màu. Đây là điểm dễ nhầm nhất giữa các phiên bản:

- **Bản gốc Trung Quốc (傲世堂):** thứ tự CHẤT LƯỢNG tăng dần là **黄 (vàng) < 红 (đỏ) < 紫 (tím)** — tức **Tím (紫) là CAO NHẤT**. Nguồn CN nêu giới hạn chỉ số tổng (统/勇): Tím 115+, Đỏ 95, Vàng 80; tướng tím mạnh hơn ~40% so với tướng trắng.

> [!warning] Bản VN có thứ tự đảo + thêm bậc
> Một nguồn Việt hóa liệt kê thứ tự tăng dần là **Tím (purple) → Cam (orange) → Đỏ (red) → Vàng (yellow) → Unique (Vô Song) → Thiên Mệnh (Heavenly Order/Divine Prophecy)** — ĐẢO NGƯỢC so với quy ước CN (nơi tím là đỉnh) và CHÈN THÊM bậc Cam, cùng các bậc cao Unique/Thiên Mệnh. Verdict: [partially-confirmed]. Việc có nhiều bậc và các bậc cao thêm sau (tương đương tướng giác tỉnh) được xác nhận, nhưng thứ tự chính xác và sự tồn tại của bậc Cam thì không đồng nhất. Khi dựng lại PHẢI chọn một quy ước nhất quán và ghi rõ trong [[decisions/game-version-scope]].

> [!question] Hệ sao riêng?
> Nguồn mô tả số ô kỹ năng của trang bị theo màu (vàng=1, đỏ=2, tím=3 kỹ năng) nhưng KHÔNG xác nhận một hệ sao (星级) riêng cho tướng tách khỏi bậc phẩm chất. Cần kiểm chứng thêm trước khi đưa hệ sao vào thiết kế.

## Chiêu mộ tại Tửu Quán (酒馆)

Khác với gacha hiện đại, việc sở hữu tướng đỏ (红将, "Hồng tướng") ở bản này **bị khóa theo cấp** và thường yêu cầu **thắng NPC tương ứng** trước. Người chơi vào **Tửu Quán (酒馆)** để chiêu mộ khi đạt mốc cấp. Các mốc đã xác nhận [partially-confirmed]:

| Tướng | Cấp chiêu mộ | Ghi chú |
|---|---|---|
| Bàng Đức (庞德) | lv46 | Hồng tướng ĐẦU TIÊN, sau khi đánh bại NPC Bàng Đức |
| Hạ Hầu Uyên (夏侯渊) | lv54 | Một nguồn ghi 52; bản chi tiết ghi 54 |
| Từ Hoảng (徐晃) | lv55 | |
| Hạ Hầu Đôn (夏侯惇) | lv56 | |
| Tôn Sách (孙策) | lv63 | Có nguồn ghi ~62 |
| Cam Ninh (甘宁) | lv66 | |
| Lữ Mông (吕蒙) | lv68 | |
| Chúc Dung (祝融) | ~lv73 | Mốc 73 CHƯA xác nhận trong nguồn lấy được |

> [!warning] Mốc Chúc Dung & Hạ Hầu Uyên
> Chúc Dung (祝融) được mô tả là hồng tướng (chiêu 3 hàng, sở trường đồng bằng) nhưng mốc lv73 là [unverifiable] từ nguồn hiện có. Hạ Hầu Uyên: 52 hay 54 còn lệch giữa các nguồn. Coi như "plausible nhưng cần kiểm chứng".

**Khóa tướng (锁):** tướng có thể được **khóa (锁)** tại Tửu Quán để KHÔNG bị mất khi danh sách bị làm mới (refresh). Quy tắc gốc: "武将如果锁起来，就不用担心被刷新掉了" — khóa giữ tướng mong muốn khỏi bị cuốn ra khỏi pool refresh. [confirmed]

Ngoài Tửu Quán, tướng còn đến từ rương tướng, sự kiện và chiêu mộ bằng kim cương/vàng.

## Chỉ số, sức chứa quân & binh khí

攻城掠地 **KHÔNG có chỉ số 武力 (Vũ Lực) riêng**. Toàn hệ chỉ số nền chỉ gồm **HAI** thuộc tính: **Thống (统)** và **Dũng (勇)** — và mỗi chỉ số chi phối **CẢ công LẪN thủ** trong đúng miền của nó (official ✅):

- **统 (Thống)** chi phối **đòn thường** — cả **普通攻击 (công thường)** LẪN **普通防御 (thủ thường)**.
- **勇 (Dũng)** chi phối **chiến pháp** — cả **战法攻击 (công chiến pháp)** LẪN **战法防御 (thủ chiến pháp)**.
- Quy đổi: **1 điểm 统/勇 ≈ 10 điểm công/thủ** tương ứng.
- 5 thuộc tính phái sinh khi giải một đòn: **普通攻击 / 普通防御 / 战法攻击 / 战法防御 / 计策**.

Nguồn: https://gc.aoshitang.com/news/zixun/322013031413222593632.html , http://gcld.49you.com/gonglue/60744.html

> [!info] Mâu thuẫn ánh xạ Thống/Dũng đã GỠ — x-20260724-01 RESOLVED
> Trang này TRƯỚC ĐÂY khẳng định "**武力(Vũ Lực) = sát thương** và **统/勇 = chỉ phòng thủ / chặn chiến pháp**" — điều đó **SAI**. Web đã xác minh: 攻城掠地 không có 武力 riêng; **统 = đòn thường (công + thủ)**, **勇 = chiến pháp (công + thủ)**, mỗi điểm ≈ 10. Điều này **GỠ mâu thuẫn 3 khung** [[contradictions#x-20260724-01]] (nay **RESOLVED**): khung "武力=damage" bị bác bỏ; khung [[claims#c-20260627-08]] ("统 drives normal atk/def, 勇 drives 战法 atk/def") được xác nhận là ĐÚNG; ánh xạ sang code chỉ cần **统→NormalAtk/NormalDef, 勇→TacticAtk/TacticDef**. Lưu ý cũ "UNIT B Dũng 62 → không có chiến pháp" chỉ là **TƯƠNG QUAN** (Dũng thấp → công/thủ chiến pháp yếu), phù hợp với việc UNIT B thuần cận chiến, không phải bằng chứng nhân-quả tuyệt đối.

> [!info] Panel in-game khớp mô hình 2-chỉ-số
> Panel "Tướng lĩnh" (bản mobile 🎨) hiển thị đúng **HAI** chỉ số 统/勇 cho từng tướng: UNIT A **Thống 171 / Dũng 170**, UNIT C **Thống 169 / Dũng 169** (cân — vừa mạnh đòn thường vừa mạnh chiến pháp), UNIT B **Thống 159 / Dũng 62** (Dũng thấp → yếu về chiến pháp, hợp với binh chủng thuần cận chiến). Không có ô 武力 nào trên panel — khớp official.

> [!warning] Đính chính chỉ số kháng chiến pháp
> Một số tài liệu ghi "智 (Trí) chống đỡ chiến pháp" — KHÔNG đúng cho bản này. Kháng chiến pháp thuộc **战法防御** do **勇 (Dũng)** chi phối (không phải 智/Trí). Dũng cao → 战法攻击 lẫn 战法防御 đều cao.

Mỗi tướng có **sức chứa quân riêng (带兵量 / 兵力上限)** — tương đương "máu" của đơn vị. Sức chứa tăng theo cấp, theo trang bị và theo **binh khí (兵器)**:

- **Mở binh khí lv50:** 乌蚕鞭 (công), 修罗盾 (thủ), 护军符 (sức chứa quân).
- **Mở binh khí lv80:** 血滴子 (công), 八卦袋 (sức chứa), 禁军令 (sức chứa).
- Mỗi cấp binh khí cộng: công +5 (乌蚕鞭/血滴子), thủ +3, sức chứa/máu +8 (八卦袋/禁军令). Nguồn khuyên **ưu tiên nâng sức chứa quân**. [confirmed]

Panel mobile hiển thị **带兵量 (sức chứa quân)** như một dòng gear riêng cạnh Công/Thủ: UNIT A **+63492**, UNIT B **+61140**, UNIT C **+56470** 🎨. Con số này là **trần binh lực** của đơn vị; **binh lực hiện tại** hồi dần theo cơ chế **Mộ binh (募兵)**:

- Binh lực hiển thị dạng `hiện tại / trần`: UNIT A **0/952380** (cạn, timer 04:22, có nút **Tăng tốc mộ binh**), UNIT B **~7537/917100** (timer 05:02), UNIT C **647050/647050** (đầy) 🎨. Khi cạn quân, đơn vị mất sức chiến đấu cho tới khi mộ đủ.
- Mộ binh **hồi theo timer**, có thể **tiêu Mộ Binh Lệnh** để đẩy nhanh / **Tăng tốc mộ binh**. Panel cho thấy **Mộ Binh Lệnh dùng chung 126987** cho cả ba tướng 🎨.
- Vòng lặp tài nguyên (Lương thực, Mộ Binh Lệnh, timer, tăng tốc) chi tiết ở [[systems/economy-and-internal-affairs]] §Mộ binh (募兵).

Chi tiết hệ trang bị/binh khí xem [[systems/equipment-and-gear]].

## Thiên phú (thiên phú địa hình)

🎨 Mỗi tướng có một dòng **thiên phú** riêng trên panel "Tướng lĩnh" (bản mobile). Thiên phú là **buff phần trăm** áp lên **Lực chiến (战力)** của đơn vị, kích hoạt theo **bối cảnh** — chủ yếu là **địa hình** chiến đấu, hoặc trạng thái công/thủ. Các ví dụ đọc trực tiếp từ panel:

| Tướng | Thiên phú (đọc từ ảnh 🎨) | Điều kiện |
|---|---|---|
| UNIT A | Thành trì **+60% ❓ Lực chiến (战力)** | **Chỉ phe công** (công thành) |
| UNIT B | Bình nguyên、Sơn địa、Thủy vực **+20% Lực chiến (战力)** | **Mọi địa hình** |
| UNIT C | Bình nguyên **+25% Lực chiến (战力)** | Chỉ đồng bằng |

> [!warning] "Lực chiến (战力)" là chỉ số TỔNG HỢP — không phải "sát thương"
> Chữ in-game ghi buff **+Lực chiến (战力)**, tức tăng **chỉ số tổng hợp** của đơn vị, KHÔNG dịch thẳng thành "sát thương". 战力 (Lực chiến) = chỉ số **thực lực tổng hợp**, KHÔNG bằng sát thương; buff "+X% 战力/战斗力" là **hệ số NHÂN (1+加成)** trong công thức, không phải cộng thẳng damage (nguồn: http://www.07073.com/gcld/gonglue/1145296.html). Chủ dự án có **design intent** rằng "thiên phú = buff sát thương cho lính", nhưng điều này **chênh** với chữ in-game. Giữ nguyên chữ **Lực chiến (战力)** khi dựng lại và trỏ open-question công thức 战力 tại [[systems/equipment-and-gear]] (§"Công thức 战力 (chiến lực) tổng hợp").

> [!warning] Con số +60% (công thành) của UNIT A ❓ UNVERIFIED
> **Cấu trúc** "thiên phú 城池/攻城 战力 +X% chỉ áp cho phe công (仅攻方)" LÀ THẬT — ví dụ chốt được là Tư Mã Ý "攻城战斗力+25%（若非副将，守城无15%加成）" (nguồn: https://www.shiyouhome.com/gcld/wjfx/2009.html , https://www.602.com/news/33/6396.html). NHƯNG **con số cụ thể +60%** đọc từ panel UNIT A **KHÔNG có nguồn xác nhận**: mọi thiên phú công thành có nguồn đều **+25%**. +60% có thể là hiệu ứng phối binh/địa hình bình nguyên gộp lại, KHÔNG phải một dòng thiên phú tướng đơn lẻ. Đánh dấu ❓ và chờ kiểm chứng trước khi dùng làm hằng số cân bằng.

Thiên phú địa hình gắn chặt với binh chủng (binh chủng công thành như UNIT A → thiên phú công thành chỉ-phe-công rất hợp lý). Xem thêm [[systems/troop-types]] (khắc chế + địa hình) và hồ sơ từng tướng ở [[entities/generals]].

## Lên cấp bằng EXP

Tướng lên cấp bằng EXP và phần lớn **tự động khi đạt ngưỡng**. Mỗi cấp cộng chỉ số nền (theo nguồn: Công +3, Thủ +1, Quân +8 mỗi cấp). Nguồn EXP:

- **Quốc Chiến (国战)** là nguồn EXP hiệu quả nhất — **+50% EXP** so với phó bản chiến dịch; trở thành cách lên cấp chính sau lv40 (nhiệm vụ quốc chiến 3 lần/ngày). [confirmed]
- Tổn thất khi công thành (siege casualties) quy đổi thành EXP; **công thành sát kinh đô địch có thể +50% EXP**.
- Bổ sung: "quân kinh nghiệm", phân thân (shadows), và phó bản độ khó cao (hard/hell/god).

> [!info] Ý đồ thiết kế
> Việc gắn EXP tốt nhất vào Quốc Chiến đẩy người chơi vào hoạt động đa người chơi/chiếm đất thay vì cày phó bản lặp. Đây là vòng lặp tăng trưởng cốt lõi — xem [[systems/city-conquest]] và [[systems/multiplayer-and-endgame]].

## Chiến pháp (战法) & Nộ khí

Cơ chế định danh của mỗi tướng là **chiến pháp (战法)** — đòn đánh trúng một số HÀNG quân địch nhất định, mở khóa bằng **Nộ khí (怒气)**. Ví dụ trước giác tỉnh:

- Tôn Sách (孙策) 入侵: 2 hàng, kháng chiến pháp mạnh.
- Cam Ninh (甘宁) 固守: 4 hàng, chặn rất cao.
- Hạ Hầu Đôn (夏侯惇) 飞羽: tướng ĐẦU TIÊN đánh 4 hàng.
- Bàng Đức (庞德) 突击/平原突击: 3 hàng (tướng đầu tiên đánh 3 hàng).
- Quan Vũ (关羽) 武神附体 (Vũ Thần Phụ Thể): 3 hàng trước trận.

Nộ khí được **mang sang giữa các trận liên tiếp**; thành bị bao vây thì quân thủ KHÔNG thể tung chiến pháp. Cơ chế nộ khí đầy đủ xem [[systems/tactics-and-rage]].

> [!question] Ngưỡng nộ khí cụ thể
> Ngưỡng nộ khí để kích mỗi chiến pháp và lượng nộ sinh ra mỗi lượt CHƯA được lượng hóa riêng cho hệ tướng. [unverifiable]

## Giác Tỉnh (觉醒)

**Giác Tỉnh (觉醒)** là nội dung cuối game, nâng cấp chiến pháp của tướng lên phiên bản mạnh hơn hẳn.

**Điều kiện mở (theo focus đề bài):** tech mở khi **chủ tướng (người chơi) đạt lv121 + thắng Trương Cáp (张颌) tại Ngũ Trượng Nguyên (五丰原/五丈原)**; tướng cần đạt **lv120** (một số nội dung gate ở lv100).

> [!warning] Ngưỡng cấp giác tỉnh
> Nguồn lệch nhau giữa lv100 và lv120 — nhiều khả năng tùy phiên bản. Verdict [high] cho yêu cầu lv100+ với một số nội dung gate lv120; ngưỡng chính xác của bản Việt hóa CHƯA xác nhận. Thường còn cần quan chức **Đại Tướng Quân (大将军)** làm tiền đề.

**Nguyên liệu:**

- **Giác Tỉnh Đan (觉醒丹):** nguyên liệu chính, rơi **~10%** từ phó bản **Giác Tỉnh Thí Luyện (觉醒试炼)**; cũng từ sự kiện/cash shop. Một mẫu chi phí: Giác Tỉnh Đan ×50 + 2.000.000 vàng.
- **Vũ Hồn (武魂):** nguyên liệu phụ, rơi **~5%** từ Thế Giới BOSS / Quốc Chiến (国战) / sự kiện giới hạn.

> [!warning] Xác suất mỗi lần giác tỉnh ~0.2%
> Có 1 nguồn nêu xác suất thành công mỗi lần giác tỉnh chỉ **~0.2%**, khiến giác tỉnh cực kỳ tốn nguyên liệu. Chỉ 1 nguồn nêu con số này — coi là [disputed/unverifiable], cần kiểm chứng trước khi cân bằng kinh tế.

**Chiến pháp sau giác tỉnh mạnh hơn hẳn:**

- Quan Vũ: 武神附体 → **武神降临** (Vũ Thần Giáng Lâm) — có xác suất khi xuất trận đưa 3 hàng đầu địch về 1 HP (gần như one-shot); +25% đồng bằng.
- Lữ Bố: → **战神无双** (Chiến Thần Vô Song) — 4 hàng, truy kích (追击) bạo kích nối chuỗi, có xác suất né chiêu sau giác tỉnh, **+35% đồng bằng**.
- Trương Phi: → **灭世咆哮** (Diệt Thế Bào Hao) — 3 hàng, đẩy lùi 50 quân, +25% địa hình núi.
- Chu Du: → **赤焰迷阵** (Xích Diệm Mê Trận) — 4 hàng + loạn (赤壁火神), +25% núi.

> [!info] Thứ tự giác tỉnh đề xuất
> Khuyến nghị: **Quan Vũ → Trương Phi → Triệu Vân → Gia Cát Lượng** trước (dễ và giá trị cao). Một số tướng bị gate: giác tỉnh **Lữ Bố** đòi **Gia Cát Lượng** đã giác tỉnh; Quan Vũ + Trương Phi đã giác tỉnh nuôi Chu Du; Triệu Vân + Gia Cát Lượng nuôi Lữ Bố (chuỗi giác tỉnh / phụ thuộc nguyên liệu).

Tập tướng giác tỉnh được là một **subset ~10-15 anh hùng tiêu biểu**, không phải toàn bộ dàn: Quan Vũ, Trương Phi, Triệu Vân, Gia Cát Lượng, Chu Du, Chu Thái, Hạ Hầu Đôn, Cam Ninh, Lữ Bố, Khương Duy (và Lưu Bị qua liên hợp). Nhiều tướng nhận thêm bonus địa hình (đồng bằng/núi/nước/toàn năng +25%, Lữ Bố +35% đồng bằng). Hồ sơ chi tiết xem [[entities/generals]].

## Liên Hợp Giác Tỉnh — Đào Viên Chi Thệ (桃园之誓)

**Liên Hợp Giác Tỉnh (联合觉醒)** là tầng cao hơn. Bộ nổi bật là **Đào Viên Chi Thệ (桃园之誓, "Peach Garden Oath")** ghép **Lưu Bị + Quan Vũ + Trương Phi** vào một đội hình chủ tướng:

- Yêu cầu **Chu Du và Gia Cát Lượng** đã giác tỉnh riêng trước.
- Đặt **Lưu Bị làm chủ tướng** rồi kích **Đào Viên Kết Nghĩa (桃园结义)**.
- **Mở rộng đội hình lên 6 hàng**; thêm kỹ năng chủ động 至仁至德 / 灭世龙吼 / 武神再临 và bị động (giảm sát thương, gây loạn, hồi máu/khiên).
- Giác tỉnh kỹ năng đến qua ngẫu nhiên hoặc thanh tiến độ qua 3 bậc.

> [!tip] Lưu ý khi dựng lại
> Đội hình mặc định ~5 hàng/5 tướng (xem [[systems/battle-system]]); Liên Hợp Giác Tỉnh là ngoại lệ nâng lên 6 hàng. Khi thiết kế hệ đội hình, hãy để số hàng là tham số mở rộng được thay vì hard-code 5, để hỗ trợ Đào Viên Chi Thệ và các bộ ghép tương lai.

## Câu hỏi mở

> [!question] Dữ kiện chưa chốt
> - Con số sức chứa quân (带兵量) từng tướng và mức cộng của mỗi bậc binh khí/trang bị: chưa có dạng số.
> - Đường cong EXP/EXP-mỗi-cấp và tỉ lệ quy đổi tổn thất công thành sang EXP: chưa xác nhận.
> - Cơ chế của Tào Tháo (曹操) và Tôn Quyền (孙权) — chiến pháp, chỉ số, có giác tỉnh được không: chưa xác nhận trong nguồn.
> - Thang phẩm chất đầy đủ và ánh xạ sang tên Việt (Tím/Cam/Đỏ/Vàng/Unique/Thiên Mệnh): chưa pin chặt.

## Nguồn

- 武将大全，选用宝典-攻城掠地 (傲世堂) https://gc.aoshitang.com/news/gonglue/772013041123252111032.html
- 攻城掠地 32条新手必备常识 (游民星空) https://www.gamersky.com/handbook/201405/359124.shtml
- 攻城掠地觉醒关羽 (百度百科) https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0%E8%A7%89%E9%86%92%E5%85%B3%E7%BE%BD/19271941
- 攻城掠地10个觉醒将介绍 https://www.hly.com/zixun/z-55319.html
- 攻城掠地新联合觉醒桃园之誓详解 https://www.shiyouhome.com/atqxcn/t5o2t186gb4f0mm85.html
- 攻城掠地武将觉醒攻略 https://m.sohu.com/a/884347572_267471/
- Hướng Dẫn Chơi Công Thành Xưng Đế https://egame.vn/huong-dan-choi-cong-thanh-xung-de/

Xác minh web 2026-07-24 (V1 统/勇, V6 战力, V7 thiên phú công thành):

- V1 — 统/勇 chi phối đòn thường / chiến pháp (official) https://gc.aoshitang.com/news/zixun/322013031413222593632.html
- V1 — 攻城掠地 chỉ có 统/勇, 1 điểm≈10 công/thủ http://gcld.49you.com/gonglue/60744.html
- V6 — 战力 (Lực chiến) = chỉ số tổng hợp, buff là hệ số nhân http://www.07073.com/gcld/gonglue/1145296.html
- V7 — thiên phú 攻城战斗力 +25% (仅攻方), Tư Mã Ý https://www.shiyouhome.com/gcld/wjfx/2009.html
- V7 — thiên phú công thành chỉ phe công https://www.602.com/news/33/6396.html

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]] và [[sources/ctxd-web-verify-2026-07-24]]

## Backlinks

- [[overview]]
- [[entities/generals]]
- [[systems/tactics-and-rage]]
- [[systems/equipment-and-gear]]
- [[systems/city-conquest]]
- [[systems/troop-types]]
- [[systems/battle-system]]
- [[systems/unit-entity-model]]
- [[systems/economy-and-internal-affairs]]
- [[decisions/unified-unit-entity-model-2026-07-24]]
- [[sources/ingame-general-panel-2026-07-24]]
- [[sources/ctxd-web-verify-2026-07-24]]
- [[sources/apk-reverse-engineering-2026-07-24]] — xác thực từ dịch ngược client (2026-07-24)
