---
title: Danh sách tướng tiêu biểu (武将)
category: entities
tags: [tuong, vo-tuong, giac-tinh, chien-phap, asset]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Danh sách tướng tiêu biểu (武将)

Tướng (武将 / "võ tướng") là đơn vị nhân vật trung tâm của **Công Thành Xưng Đế** (攻城掠地). Tổng số trong bản webgame 傲世堂 (2013) vào khoảng **200+ tướng**, mỗi tướng gắn với một binh chủng, có chỉ số Sức mạnh/Vũ lực (武力) và Thống/Dũng (统/勇), một **chiến pháp gốc** (战法) đánh theo số hàng quân, và phần lớn tướng tiêu biểu có thể **giác tỉnh (觉醒)** để nâng cấp chiến pháp. Trang này liệt kê các tướng tiêu biểu; cơ chế chung xem [[systems/general-system]], chi tiết chiến pháp và nộ khí xem [[systems/tactics-and-rage]], đối chiếu chân dung xem [[technical/asset-system-mapping]].

> [!info] Ý đồ thiết kế: tướng không lấy theo gacha-first mà bị **khóa theo cấp** (level-gated). Hồng tướng (红将) được chiêu mộ tại **Tửu Quán (酒馆)** khi đạt mốc cấp và thường sau khi đánh bại NPC cùng tên. Có thể **khóa (锁)** tướng để Tửu Quán không xóa khi làm mới.

> [!warning] Việc **gán binh chủng cho từng tướng cụ thể vẫn còn mâu thuẫn**. Bản thân danh sách 5 binh chủng còn lệch giữa các nguồn (Nỏ/弩 so với Chiến Xa/战车 — xem [[systems/troop-types]]). Vì vậy cột "Binh chủng" dưới đây phần lớn **chưa xác nhận**; chỉ ghi khi có suy luận hợp lý và đánh dấu rõ.

## Binh chủng tướng — xác nhận trực quan (từ màn 武将对决)

> [!info] Ảnh game thật giải tỏa một phần điểm "unverifiable"
> Màn **Võ Tướng Đối Quyết (武将对决)** ([[sources/screenshot-somo-battle-2026-06-27]]) hiện **icon binh chủng** cạnh mỗi tướng. Các gán dưới đây **đọc trực tiếp từ icon** (độ tin cao hơn nguồn chữ):

| Tướng (中) | Icon | Binh chủng suy ra |
|---|---|---|
| 马超 (Mã Siêu) | ngựa | **Kỵ binh (骑兵)** |
| 黄忠 (Hoàng Trung) | cung | **Cung binh (弓兵)** |
| 周泰 (Chu Thái) | thương | **Thương binh (枪兵)** |
| 黄月英 (Hoàng Nguyệt Anh) | pháo/xe | **Chiến xa (战车)** / công thành |
| 周瑜 (Chu Du), 诸葛亮 (Gia Cát Lượng) | gậy/quạt | **Mưu sĩ (谋士)** |

> [!warning] Sự xuất hiện của **mưu sĩ (谋士)** và **chiến xa (战车)** trong game thật mâu thuẫn với "chỉ 4 binh chủng" của bản launch 2013 — xem phân tích ở [[systems/troop-types]] và [[contradictions#x-20260627-01]]. Các tướng giác tỉnh khác (Quan Vũ/Lữ Bố/Triệu Vân…) chưa có ảnh icon, vẫn để ngỏ.

> [!info] Tướng ghép đôi (liên hợp)
> Màn đấu hiện vị trí 1 là **周瑜●诸葛亮 (Chu Du ● Gia Cát Lượng)** — một **cặp tướng ghép** chiếm chung một slot. Đây là bằng chứng cơ chế **tướng liên hợp** (khác với Đào Viên Chi Thệ gộp Lưu-Quan-Trương). Cần xác nhận luật ghép cặp và hiệu ứng.

## Nhóm giác tỉnh cốt lõi (觉醒将)

Tập tướng giác tỉnh là một **subset được chọn lọc ~10-15 anh hùng biểu tượng**, không phải toàn roster. Thứ tự khuyến nghị thường là Quan Vũ → Trương Phi → Triệu Vân → Gia Cát Lượng (dễ và giá trị cao nhất), sau đó mở khóa dây chuyền các tướng khác.

### Quan Vũ (关羽)
- **Chiến pháp gốc:** Vũ Thần Phụ Thể (武神附体) — kháng chiến thuật/kế sách, đánh đồng thời **3 hàng** quân địch.
- **Chiến pháp giác tỉnh:** Vũ Thần Giáng Lâm (武神降临) — có xác suất kích hoạt khi lên trận, ép **3 hàng đầu địch còn 1 máu**; không bị kháng (抵挡), sát thương cố định/tất trúng, vô hiệu phản đòn của Tư Mã Ý, không bị phản kích. +25% trên **đồng bằng**.
- **Ghi chú:** mục tiêu giác tỉnh ưu tiên số một; là thành viên của Đào Viên Chi Thệ (xem dưới).
- **Asset:** `guanyu1..4`, `guanyu` cơ bản, `guanyujx` (jx = 觉醒/giác tỉnh).

### Trương Phi (张飞)
- **Chiến pháp giác tỉnh:** Diệt Thế Bào Hao (灭世咆哮) — đánh **3 hàng**, sát thương tăng khi máu thấp, **đẩy lùi ~50** quân hậu phương; +25% trên **núi (山地)**.
- **Ghi chú:** thành viên Đào Viên Chi Thệ.
- **Asset:** `zhangfei1..4`, `zhangfei`, `zhangfeijx`.

### Triệu Vân (赵云)
- **Chiến pháp giác tỉnh:** Long Thương Ngạo Thế (龙枪傲世) — đánh **5 hàng** mỗi lần hạ một tướng địch; kèm Thất Tiến Thất Xuất (七进七出) — đánh **2 hàng** khi máu rơi xuống các mốc 80%/50%/20%. Miễn nhiễm trạng thái bất lợi & hiệu ứng tức tử (instant-kill).
- **Ghi chú:** +25% **mọi địa hình** (trừ trong thành); mục tiêu giác tỉnh sớm giá trị cao.
- **Asset:** `zhaoyun1..4`, `zhaoyun`, `zhaoyunjx`.

### Gia Cát Lượng (诸葛亮)
- **Binh chủng:** Mưu (谋士 / strategist) — *suy luận theo định vị quân sư, chưa xác nhận tuyệt đối*.
- **Chiến pháp giác tỉnh:** Phùng Hung Hóa Cát (逢凶化吉) — xác suất né/hóa giải sát thương kèm hiệu ứng bói toán.
- **Ghi chú:** **giác tỉnh của Gia Cát là điều kiện tiên quyết để mở khóa giác tỉnh Lữ Bố**.
- **Asset:** `zhugeliang1..4`, `zhugeliang`, `zhugeliangjx`.

### Lữ Bố (吕布)
- **Chiến pháp giác tỉnh:** Chiến Thần Vô Song (战神无双) — đánh **4 hàng**, truy kích (追击) liên hoàn khi chí mạng, sau giác tỉnh có xác suất **né chiến pháp** địch; **+35% trên đồng bằng** (cao nhất trong các tướng).
- **Ghi chú:** giác tỉnh **bị chặn sau khi Gia Cát Lượng đã giác tỉnh**.
- **Asset:** `lvbu1..4`, `lvbu`, `lvbujx`, `lvbujx2`, và bộ kết hợp Điêu Thuyền `lvbudiaochanjx`, `lvbudiaochanjx2/3` (gợi ý hệ kết hợp/giác tỉnh phối).

### Lưu Bị (刘备)
- **Vai trò:** chủ tướng của **Đào Viên Chi Thệ (桃园之誓)** — liên hợp giác tỉnh (联合觉醒) gộp Lưu Bị + Quan Vũ + Trương Phi.
- **Cơ chế:** đặt Lưu Bị làm chủ tướng, kích hoạt 桃园结义; **mở rộng đội hình lên 6 hàng**; thêm chủ động 至仁至德 / 灭世龙吼 / 武神再临 và bị động (giảm sát thương, hỗn loạn, hồi/khiên). Yêu cầu **Chu Du và Gia Cát Lượng đã giác tỉnh riêng trước**.
- **Asset:** `liubei`, `liubei2` (số biến thể ít hơn các tướng giác tỉnh đơn).

### Chu Du (周瑜)
- **Chiến pháp giác tỉnh:** Xích Diễm Mê Trận (赤焰迷阵) — đánh **4 hàng** kèm Hỗn Loạn (混乱), kích hoạt Xích Bích Hỏa Thần (赤壁火神); +25% **núi**.
- **Ghi chú:** phải giác tỉnh (cùng Gia Cát Lượng) để mở khóa liên hợp Đào Viên Chi Thệ.
- **Asset:** `zhouyu1..4`, `zhouyu`, `zhouyujx`, và file kết hợp `zhouyujx_zhugeliangjx`, `zhouyujx_zhugeliangjx2` (xác nhận quan hệ giác tỉnh dây chuyền Chu Du + Gia Cát).

### Chu Thái (周泰)
- **Đặc tính:** **không có chiến pháp (没有战法)** nên không bị bao vây; sau giác tỉnh +25% **mọi địa hình**, có hai hiệu ứng giác tỉnh.
- **Asset:** `zhoutai1..4`, `zhoutai`, `zhoutaijx`, `zhoutaijx2`.

### Cam Ninh (甘宁)
- **Mốc chiêu mộ:** lv66 (hồng tướng tại Tửu Quán).
- **Chiến pháp gốc:** Cố Thủ (固守) — đánh **4 hàng**, đỡ đòn (block) rất cao.
- **Chiến pháp giác tỉnh:** Giảo Long Cự Lãng (绞龙巨浪) — đánh **5 hàng**, tối đa **5 lần** sau khi thắng đối kháng chiến thuật; +25% **mặt nước (水)**, vùng nước cho chí mạng + Anh Dũng.
- **Ghi chú:** sức mạnh tỉ lệ theo độ gần thành nhà.
- **Asset:** `ganning` (chỉ 1 biến thể trong thư mục — *chưa thấy file jx riêng*).

### Khương Duy (姜维)
- **Chiến pháp giác tỉnh:** Phong Mang Tất Lộ / Tuyệt Địa Phản Kích / Hóa Giải Khốn Cục (锋芒毕露 / 绝地反击 / 化解困局) — tổng hợp đặc tính của nhiều tướng; thiên về địa hình nước.
- **Asset:** `jiangwei1..4`, `jiangwei`, `jiangweijx`.

## Hồng tướng chiêu mộ theo cấp (红将)

Mốc cấp và chỉ số tham khảo (Sức mạnh 武力 / Dũng-Thống 勇统). Cơ chế: đạt cấp → đánh bại NPC cùng tên → chiêu mộ ở Tửu Quán.

| Tướng (Việt + 中文) | Mốc | Chiến pháp gốc | Hàng | Chỉ số (武力/勇) | Ghi chú |
|---|---|---|---|---|---|
| Bàng Đức 庞德 | **lv46** | Đột Kích (平原突击/突击) | 3 | 65 / 30 | **Hồng tướng đầu tiên**; tướng đầu đánh 3 hàng; địa hình đồng bằng |
| Hạ Hầu Uyên 夏侯渊 | lv54 | — | — | — | (lv54 theo guide chi tiết; "52" là biến thể) |
| Từ Hoảng 徐晃 | lv55 | Bối Thủy (背水) | 3 | 63 / 32 | Sát thương tăng theo số quân địch |
| Hạ Hầu Đôn 夏侯惇 | lv56 | Phi Vũ (飞羽) | 4 | 72 / 23 | **Tướng đầu đánh 4 hàng**; giác tỉnh 箭震山河 +25% nước |
| Tôn Sách 孙策 | ~lv62-63 | Nhập Xâm (入侵) | 2 | 48 / 47 | Kháng chiến pháp mạnh; "thần tướng" cho tân thủ |
| Lữ Mông 吕蒙 | lv68 | Nhập Xâm (入侵) | — | 45 / 57 | Chuyên công thành, +30% sát thương trong thành |

> [!warning] Hạ Hầu Uyên ghi nhận mốc **lv54** (guide 31-60 chi tiết), nhưng có nguồn ghi 52 — chưa thống nhất. Chu Dung (祝融) đôi khi được nêu ~lv73 nhưng **không được nguồn nào xác nhận**.

## Lãnh chúa & tướng khác

### Mã Siêu (马超)
- **Ghi nhận:** **tử tướng (紫将) đầu** giác tỉnh ở lv77, chiến pháp **Thiết Kỵ Vô Địch (铁骑无敌)** — *theo brief; chưa đối chiếu được trong nguồn nghiên cứu, treo cờ dưới*.
- **Asset:** `machao1..4`, `machao`, `machaojx`, `machaojx2` (asset xác nhận có nhánh giác tỉnh).

> [!warning] Mã Siêu lv77 + 铁骑无敌 (Thiết Kỵ Vô Địch) là dữ kiện từ brief, **không xuất hiện trong file nghiên cứu đã kiểm chứng** (general-system / tactics-skills-rage). Coi là **chưa xác minh** cho bản (1). Asset `machaojx*` ủng hộ việc Mã Siêu có giác tỉnh, nhưng tên chiến pháp và mốc cấp cần kiểm lại — xem [[open-questions]].

### Tào Tháo (曹操) — Tôn Quyền (孙权)
- **Vai trò:** lãnh chúa biểu tượng (Tào Ngụy / Đông Ngô), có mặt trong roster.
- **Cơ chế cụ thể:** chiến pháp, chỉ số và việc có giác tỉnh hay không **chưa được xác nhận** trong các nguồn đã rà.
- **Asset:** Tào Tháo có nhiều biến thể `caocao1..4`, `caocao`, `caocaojx`, `caocaozhuanshu` (专属/độc quyền) → gợi ý có nhánh giác tỉnh & trang bị độc quyền. Tôn Quyền: `sunquan`, `sunquan2`.

> [!question] Tào Tháo và Tôn Quyền có giác tỉnh không, và chiến pháp là gì? Asset cho thấy Tào Tháo có `jx` và `zhuanshu`, nhưng nguồn văn bản chưa mô tả — cần kiểm chứng bằng client/footage.

## Đối chiếu asset chân dung (tacticalGeneralPicMax)

Thư mục `Assets/Resources/sprite/tacticalGeneralPicMax/` chứa **358 file PNG** chân dung tướng, đặt tên theo **pinyin + hash**. Quy luật quan sát được:

- Số đếm `1..4` (vd `guanyu1..4`): các **giai đoạn/tiến hóa** chân dung của cùng một tướng.
- Hậu tố `jx` (vd `guanyujx`, `lvbujx`): bản **giác tỉnh (觉醒)**; có `jx2` cho bậc giác tỉnh sâu hơn.
- Hậu tố `zhuanshu` (专属, vd `caocaozhuanshu`, `suncezhuanshu`): bản/khung **độc quyền**.
- File **kết hợp tên** (vd `lvbudiaochanjx`, `zhouyujx_zhugeliangjx`, `xiahoudun_xiahouyuanjx1`): hệ **giác tỉnh phối/liên hợp** — bằng chứng asset cho cơ chế liên hợp giác tỉnh.

> [!tip] Khi dựng lại, ánh xạ tên tướng → asset nên dùng **prefix pinyin** làm khóa và parse hậu tố (`jx`, `2`, `zhuanshu`) thành trạng thái. Hash sau dấu `_` chỉ là định danh build, không mang ngữ nghĩa gameplay. Bảng ánh xạ đầy đủ thuộc về [[technical/asset-system-mapping]].

> [!warning] Một số hồng tướng (vd `ganning`, `pangde`, `xuhuang`, `xiahoudun`, `lvmeng`) chỉ có **1 biến thể** trong thư mục, trong khi các tướng giác tỉnh cốt lõi có 4-6 biến thể + `jx`. Điều này khớp với giả thuyết "tập giác tỉnh là subset chọn lọc", nhưng cũng có thể do asset chưa đủ — cần xác nhận.

## Nguồn
- https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0%E8%A7%89%E9%86%92%E5%85%B3%E7%BE%BD/19271941 — Giác tỉnh Quan Vũ (武神附体→武神降临)
- https://www.hly.com/zixun/z-55319.html — Giới thiệu 10 tướng giác tỉnh
- https://gc.aoshitang.com/news/gonglue/772013041123252111032.html — Đại toàn võ tướng (傲世堂 chính chủ)
- http://www.kuwan8.com/news/20130806/n4240.html — Mốc chiêu mộ & chỉ số hồng tướng
- https://www.shiyouhome.com/gcld/wjfx/2068.html — Lữ Bố & điều kiện giác tỉnh
- https://www.shiyouhome.com/atqxcn/t5o2t186gb4f0mm85.html — Đào Viên Chi Thệ (桃园之誓)
- https://www.gameres.com/249586.html — Phân tích hệ thống lõi chiến đấu

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks
- [[overview]]
- [[systems/general-system]]
- [[systems/tactics-and-rage]]
- [[technical/asset-system-mapping]]
- [[systems/troop-types]]
- [[open-questions]]
