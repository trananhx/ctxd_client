---
title: Danh sách tướng tiêu biểu (武将)
category: entities
tags: [tuong, vo-tuong, giac-tinh, chien-phap, asset]
sources: []
created: 2026-06-27
updated: 2026-07-24
---

# Danh sách tướng tiêu biểu (武将)

Tướng (武将 / "võ tướng") là đơn vị nhân vật trung tâm của **Công Thành Xưng Đế** (攻城掠地). Tổng số trong bản webgame 傲世堂 (2013) vào khoảng **200+ tướng**, mỗi tướng gắn với một binh chủng, có **2 chỉ số nền Thống/Dũng (统/勇)** (nguồn official xác nhận 攻城掠地 **KHÔNG có 武力 riêng** — 统 chi phối đòn thường, 勇 chi phối chiến pháp; xem [[contradictions]] x-20260724-01 · [[sources/ctxd-web-verify-2026-07-24]]), một **chiến pháp gốc** (战法) đánh theo số hàng quân, và phần lớn tướng tiêu biểu có thể **giác tỉnh (觉醒)** để nâng cấp chiến pháp. Trang này liệt kê các tướng tiêu biểu; cơ chế chung xem [[systems/general-system]], chi tiết chiến pháp và nộ khí xem [[systems/tactics-and-rage]], đối chiếu chân dung xem [[technical/asset-system-mapping]].

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

## Thiên phú địa hình quan sát (ảnh general-panel 2026-07-24)

> [!info] 🎨 Đọc trực tiếp từ 4 ảnh màn "Tướng lĩnh" (bản MOBILE 攻城掠地)
> Ba đơn vị end-game (cấp tướng Lv.201-220) hiện **thiên phú (天赋) buff theo địa hình**, đo bằng chỉ số **Lực chiến (战力)** — CHỈ SỐ TỔNG HỢP, không phải "sát thương" (FIX-1). Nguồn: [[sources/ingame-general-panel-2026-07-24]]; mô hình đơn vị hợp nhất: [[systems/unit-entity-model]].

| Đơn vị | Binh chủng (Hán tự ⚠️) | Cấp tướng | Thiên phú địa hình (战力) |
|---|---|---|---|
| A — nữ áo tím | Công Thành Xa LV4 (⚠️ 攻城车) | Lv.220 | **Thành trì Lực chiến (战力) +60%** — *chỉ phe công* |
| B — nam giáp vàng | Nhục Bác Tử Sĩ lv4 (肉搏死士 — XÁC NHẬN binh chủng thật) | Lv.201 | **Mọi địa hình (Bình nguyên/Sơn địa/Thủy vực) Lực chiến (战力) +20%** |
| C — nam tóc trắng | Hoàng Kim Chiến Kỵ cấp4 (⚠️ 黄金战骑) | Lv.204 | **Bình nguyên Lực chiến (战力) +25%** |

> [!warning] ⚠️ Hán tự binh chủng: 肉搏死士 (Nhục Bác Tử Sĩ) đã **XÁC NHẬN là binh chủng thật** (nguồn fansite, độ tin MEDIUM — xem callout dưới); còn **攻城车** (A, PARTIAL — có thể là mô tả loại, không phải tên định danh) và **黄金战骑** (C, UNVERIFIED — không nguồn nào ra đúng chuỗi) VẪN GIỮ ⚠️, là SUY DIỄN từ tên hiển thị, chưa chốt. Chênh giữa design intent ("thiên phú = buff sát thương cho lính") và chữ in-game (+Lực chiến 战力, chỉ số tổng hợp) — xem open-question 战力 ở [[systems/equipment-and-gear]].

> [!info] Thiên phú địa hình là cơ chế CHUNG per-đơn-vị (không riêng tướng giác tỉnh)
> Bonus địa hình trước nay ghi nhận ở các **tướng giác tỉnh** (Quan Vũ +25% đồng bằng; Lữ Bố +35% đồng bằng; Chu Thái / Triệu Vân +25% mọi địa hình — xem các mục dưới). Ba ảnh 2026-07-24 cho thấy **mọi đơn vị đều có ô "Thiên phú" địa hình riêng**, không chỉ tướng giác tỉnh. Vậy buff địa hình là thuộc-tính-đơn-vị phổ quát, tướng giác tỉnh chỉ là một trường hợp có sẵn giá trị cao.

> [!info] 🎨 Ba binh chủng có cấp — bằng chứng đơn vị end-game
> Cả ba đơn vị đều là binh chủng **có hậu tố cấp** ("LV4"/"lv4"/"cấp 4"), gắn với tướng Lv.201-220. Suy luận: hậu tố này là **bậc sao binh chủng (兵种星级 4★)**, TÁCH khỏi cấp tướng (Lv.220). Ba tên Hán tự binh-chủng-có-cấp là **bằng chứng bản mobile 攻城掠地** — chờ chủ dự án chốt version scope, KHÔNG đè claim "4 binh chủng 2013" ([[decisions/game-version-scope]], [[contradictions]]).

> [!question] ❓ Đơn vị "không có chiến pháp" — nay có lời giải binh-chủng (FIX-2)
> Đơn vị B (Nhục Bác Tử Sĩ, **Dũng 62 rất thấp**) là đơn vị DUY NHẤT trong ba ảnh **không có ô chiến pháp**. Trước đây chỉ ghi là TƯƠNG QUAN "Dũng thấp ↔ không chiến pháp". Nay có lời giải theo **binh chủng**: 肉搏死士 (Nhục Bác Tử Sĩ, 死士 = quân cảm tử) là binh chủng thật; biến thể vàng **黄金肉搏死士** là binh chủng vàng của **周泰 (Chu Thái)**, **thuần cận chiến, "không phụ thuộc chiến pháp"** → giải thích trực tiếp vì sao ô chiến pháp của B TRỐNG. Khớp luôn với đặc tính **Chu Thái (周泰) "không có chiến pháp (没有战法)"** đã ghi bên dưới. Độ tin **MEDIUM** (nguồn fansite, trang gốc ruiel 404). Nguồn: https://www.shiyouhome.com/gcld/wjfx/1999.html , https://www.233leyuan.com/post-detail/1991837600193638277

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

Mốc cấp và chỉ số tham khảo. Cơ chế: đạt cấp → đánh bại NPC cùng tên → chiêu mộ ở Tửu Quán.

> [!warning] Nhãn chỉ số cũ
> Cột chỉ số dưới đây do nguồn cũ (2026-06-27) ghi nhãn "武力/勇". Nhưng nguồn official xác nhận 攻城掠地 **chỉ có 统/勇, KHÔNG có 武力 riêng** ([[contradictions]] x-20260724-01 · [[sources/ctxd-web-verify-2026-07-24]]) → nhiều khả năng "武力" là **nhãn lệch** của một trong hai chỉ số. Giữ số làm tham khảo, ❓ nhãn.

| Tướng (Việt + 中文) | Mốc | Chiến pháp gốc | Hàng | Chỉ số tham khảo (nhãn cũ 武力/勇) ⚠️ | Ghi chú |
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
- **Ghi nhận:** **tử tướng (紫将) đầu** giác tỉnh ở lv77, chiến pháp **Thiết Kỵ Vô Địch (铁骑无敌)** — nay **CHỐT qua web** (V2): đánh **前3排 (3 hàng đầu)**, sát thương không né được. **KHÔNG phải 铁骑无双 (Vô Song)**, **KHÔNG phải 5 hàng**.
- **Asset:** `machao1..4`, `machao`, `machaojx`, `machaojx2` (asset xác nhận có nhánh giác tỉnh).

> [!info] ✅ Mã Siêu = 铁骑无敌 (Thiết Kỵ VÔ ĐỊCH), 3 hàng — CHỐT (V2, có nguồn web)
> Chiến pháp Mã Siêu là **铁骑无敌** (Vô Địch), đánh **前3排 (3 hàng đầu)**, sát thương **không né được**. Đây KHÔNG phải 铁骑无双 (Vô Song) và KHÔNG phải 5 hàng ⇒ **UNIT C ("5 hàng") KHÔNG phải Mã Siêu** (xem callout dưới). Asset `machaojx*` ủng hộ việc Mã Siêu có giác tỉnh. Nguồn: http://m.ouwan.com/news/gcld20150604dw11.html , https://m.iask.sina.com.cn/b/wtVedLAeXm.html

> [!warning] ❌ UNIT C ("5 hàng") KHÔNG phải Mã Siêu — LIÊN KẾT ĐÃ HẠ (V2)
> Trước đây treo ❓ "UNIT C có thể là Mã Siêu". Nay **HẠ liên kết đó**: chiến pháp Mã Siêu đã chốt là 铁骑无敌 đánh **3 hàng** (không phải 5 hàng), nên đơn vị C ([[sources/ingame-general-panel-2026-07-24]], "Sư/Thiết Kỵ Vô Song (5 hàng)", binh chủng kỵ "Hoàng Kim Chiến Kỵ cấp4" ⚠️ 黄金战骑, code KyBinh) **KHÔNG phải Mã Siêu**. 黄金战骑 vẫn **UNVERIFIED** (không nguồn nào ra đúng chuỗi); KHÔNG chốt tên, KHÔNG đoán tướng sở hữu (X2). Xem [[decisions/game-version-scope]], [[contradictions]].

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
- http://m.ouwan.com/news/gcld20150604dw11.html — **V2**: Mã Siêu 铁骑无敌 (Vô Địch) đánh 前3排 (3 hàng), không né được
- https://m.iask.sina.com.cn/b/wtVedLAeXm.html — **V2**: chốt chiến pháp Mã Siêu = 铁骑无敌 (không phải 铁骑无双)
- https://www.shiyouhome.com/gcld/wjfx/1999.html — **E1**: 肉搏死士 / 黄金肉搏死士 (binh chủng vàng của 周泰 Chu Thái), thuần cận chiến (MEDIUM)
- https://www.233leyuan.com/post-detail/1991837600193638277 — **E1**: 黄金肉搏死士 của Chu Thái, không phụ thuộc chiến pháp (MEDIUM, trang gốc ruiel 404)

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]] và [[sources/ctxd-web-verify-2026-07-24]]

## Backlinks
- [[overview]]
- [[systems/general-system]]
- [[systems/tactics-and-rage]]
- [[technical/asset-system-mapping]]
- [[systems/troop-types]]
- [[open-questions]]
- [[systems/unit-entity-model]]
- [[sources/ingame-general-panel-2026-07-24]]
- [[sources/ctxd-web-verify-2026-07-24]]
