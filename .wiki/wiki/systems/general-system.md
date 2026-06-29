---
title: Hệ tướng (武将)
category: systems
tags: [general, tuong, awakening, giac-tinh, recruitment, progression]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Hệ tướng (武将)

Hệ tướng (武将, "vũ tướng") là lớp tiến hóa cốt lõi của **Công Thành Xưng Đế** (攻城掠地). Toàn bộ hành trình của người chơi xoay quanh việc thu thập, nuôi dưỡng và giác tỉnh một dàn danh tướng Tam Quốc. Đây là trang anh em với [[entities/generals]] (hồ sơ từng tướng) và liên kết chặt với [[systems/tactics-and-rage]] (chiến pháp & nộ khí), [[systems/equipment-and-gear]] (binh khí) và [[systems/city-conquest]] (công thành).

## Tổng quan đội hình & binh chủng

Dàn tướng có quy mô **200+ tướng**, mỗi tướng gắn cứng với **một binh chủng** duy nhất. Bản Việt hóa thường nêu 5 binh chủng: Thương (枪), Kỵ (骑), Cung (弓), Mưu (谋士/strategist) và một binh chủng thứ năm còn tranh cãi về cách gọi.

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

Mỗi tướng có **Vũ Lực (武力)** quyết định sát thương, và bộ chỉ số phòng thủ **Thống (统御/统, Command)** + **Dũng (勇, Courage/Valor)** quyết định khả năng chặn chiến pháp địch và phòng thủ.

> [!warning] Đính chính chỉ số phòng thủ
> Một số tài liệu ghi "智 (Trí) chống đỡ" — KHÔNG đúng cho bản này. Nguồn CN xác nhận chỉ số phòng thủ/kháng là **统 (Thống)** và **勇 (Dũng)**; Dũng cao tăng xác suất CHẶN chiến pháp địch, không phải 智 (Trí).

Mỗi tướng có **sức chứa quân riêng (带兵量 / 兵力上限)** — tương đương "máu" của đơn vị. Sức chứa tăng theo cấp, theo trang bị và theo **binh khí (兵器)**:

- **Mở binh khí lv50:** 乌蚕鞭 (công), 修罗盾 (thủ), 护军符 (sức chứa quân).
- **Mở binh khí lv80:** 血滴子 (công), 八卦袋 (sức chứa), 禁军令 (sức chứa).
- Mỗi cấp binh khí cộng: công +5 (乌蚕鞭/血滴子), thủ +3, sức chứa/máu +8 (八卦袋/禁军令). Nguồn khuyên **ưu tiên nâng sức chứa quân**. [confirmed]

Chi tiết hệ trang bị/binh khí xem [[systems/equipment-and-gear]].

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

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[entities/generals]]
- [[systems/tactics-and-rage]]
- [[systems/equipment-and-gear]]
- [[systems/city-conquest]]
- [[systems/troop-types]]
- [[systems/battle-system]]
