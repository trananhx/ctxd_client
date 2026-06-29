---
title: Trận pháp (阵法)
category: systems
tags: [tran-phap, formation, binh-thu, troop-types, late-game]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Trận pháp (阵法)

Trận pháp (阵法, *zhènfǎ*) là một tầng tăng sức mạnh **hậu kỳ** chồng lên đội hình quân của người chơi. Cơ chế cốt lõi: gán tướng/binh chủng vào các vị trí của một trận, rồi khảm **Binh thư (兵书)** vào trận để nâng cấp trận đó. Trận pháp không thay thế mà **chồng thêm lên** hệ khắc chế binh chủng và hệ địa hình đã có — nó khuếch đại đúng binh chủng mà trận đó định hướng. Xem [[systems/troop-types]] và [[systems/battle-system]] để hiểu nền tảng tính sát thương mà trận pháp tác động lên.

> [!info] 📋 THỰC TẾ: hệ đội hình RẤT PHONG PHÚ & data-driven (theo chủ dự án) — quan trọng
> Tài liệu web chỉ mô tả 3–4 trận pháp như "buff chỉ số". Theo chủ dự án, đội hình bày binh thực tế **phong phú hơn nhiều**:
> - **Nhiều kiểu đội hình** người chơi có thể xếp ra, **mỗi kiểu có ĐẶC ĐIỂM (gameplay) khác nhau** — không chỉ 4 trận cố định. (Khớp nguồn VN "**9 trận pháp**" ở mục dưới.)
> - **Đội hình gắn theo tướng**: có tướng bày quân theo kiểu riêng (vd **xếp dọc 2 bên đường**), tướng khác kiểu khác — mỗi tướng có thể có layout chữ ký.
> - **Hình dạng hàng theo TÌNH HUỐNG (per-hàng — đáp án B)**: hàng mặc định là hàng ngang, nhưng **hàng ĐẦU khi giáp địch** có thể đổi sang hình tùy biến (vd **cánh cung**) — độc lập với loại trận. Xem [[systems/battle-system]] §Hình học.
>
> ⇒ Phải mô hình hóa đội hình như **dữ liệu (data-driven)**: một `FormationLayout` = tập vị trí/hình dạng các nhóm lính + **đặc điểm gameplay** riêng; tướng/người chơi chọn layout; hàng có **shape theo tình huống**. KHÔNG hard-code 3–4 trận. Đây là một **hệ thiết kế lõi**, không phải tính năng phụ. Danh mục đầy đủ các đội hình + đặc điểm cần được liệt kê dần → [[open-questions#q-20260627-13]].

## Điều kiện mở khóa

Theo hai nguồn Trung độc lập (đã `confirmed`), trận pháp xuất hiện khi nhân vật **đạt cấp 210**, sau khi đánh qua **phó bản Hạ Hầu Đôn (夏侯惇) cấp 210** rồi **nghiên cứu công nghệ trận pháp (阵法 科技)** (mất ~1 phút để kích hoạt). Nguồn Baidu nói nguyên văn: 角色满210级之后会出现新的玩法——阵法，前提是要打过210级夏侯惇副本.

> [!warning] Mâu thuẫn về mốc cấp 210
> Trong focus được giao có nêu hai dữ kiện gây nhiễu: (a) một số mô tả nói trận chỉ "**kích hoạt**" ở **cấp 20** (xem mục Cấp trận bên dưới), và (b) nguồn VN nói "**9 trận pháp**". Hai dữ kiện này KHÔNG mâu thuẫn với mốc 210 nếu hiểu đúng:
> - "Cấp 20" là **cấp của bản thân trận pháp** (tổng cấp binh thư khảm vào), KHÔNG phải cấp nhân vật. Trận *雁形阵* chỉ phát huy hiệu lực khi **trận đạt level 20** — đây là ngưỡng kích hoạt nội tại của trận, không phải mốc mở khóa hệ thống.
> - Con số "9 trận pháp" của nguồn VN **chưa kiểm chứng được** trong nguồn Trung (các nguồn Trung chỉ xác nhận **3 trận cơ bản + 1 trận cao cấp 云垂阵 = 4 trận**). Có thể nguồn VN gộp thêm các trận mở ở "tầng" về sau, hoặc bị lẫn với game khác. Cần kiểm lại trực tiếp trong client `ctxd_client`.
>
> => Mốc **cấp nhân vật 210** vẫn là mốc mở hệ thống đáng tin nhất (`confirmed`), nhưng coi nó như "điểm khởi đầu" — số trận tối đa và việc mở "tầng trận" về sau cần xác minh thêm.

## Ba trận cơ bản (gắn binh chủng)

Khi mở khóa, có **3 trận cơ bản**, mỗi trận định hướng cho một binh chủng (xem [[systems/troop-types]]). Nguồn Baidu ghi nguyên văn: 锋矢阵（骑兵）、雁形阵（弓兵）、方圆阵（步兵）.

> [!info] Trận pháp có thể là HÌNH DẠNG ĐỘI HÌNH trực quan, không chỉ buff chỉ số
> Khách cho biết hàng lính không phải lúc nào cũng hàng ngang — có thể **tùy biến hình dạng** (vd **cánh cung**, nhất là hàng đầu khi giáp địch). Tên các trận gợi ý đúng hình học: **锋矢阵 = mũi tên nhọn** (chữ V hướng tới), **雁形阵 = cánh nhạn/chữ V (giống cánh cung)**, **方圆阵 = vuông/hộp**. ⇒ Trận pháp khả năng quyết định **`Row.shape`** ở [[systems/battle-system]] §Hình học, chứ không thuần stat-buff như nguồn web mô tả. Cần khách xác nhận → [[open-questions#q-20260627-13]].

| Trận | Hán-Việt | Binh chủng | Định hướng |
|------|----------|-----------|-----------|
| 锋矢阵 | Phong Thỉ (Mũi Tên Nhọn) | Kỵ binh (骑兵) | **Bạo phát** — tối đa hóa sát thương, hợp tướng đánh dồn |
| 雁形阵 | Nhạn Hành (Hình Nhạn) | Cung binh (弓兵) | **Ổn định** — sát thương đều, chia sát thương, hợp tướng thủ/lì |
| 方圆阵 | Phương Viên (Vuông-Tròn) | Bộ binh (步兵) | **Phòng thủ** — tăng thủ cho bộ binh |

Ban đầu mỗi trận chỉ mở các **vị trí đầu tiên**; muốn mở hết các vị trí của một trận tốn **150 vàng/trận**, tức **450 vàng cho cả 3 trận** (nguồn hly.com: 每个阵法都要支付150金币，三个阵法一共450金币 — `confirmed`). Số ô/vị trí chính xác mỗi trận chưa rõ trong nguồn.

> [!info] Ý đồ thiết kế
> Mỗi trận buộc người chơi dồn vào một binh chủng để "ăn" bonus của trận. Điều này tạo chiều sâu quyết định: chọn trận khớp với đội hình tướng đang có. Hướng dẫn chiến thuật gợi ý: *锋矢阵* cho tướng bạo phát (vd 太史慈 Thái Sử Từ, 黄忠 Hoàng Trung), *雁形阵* cho tướng thủ/bền (vd 周泰 Chu Thái, 典韦 Điển Vi). Đây là lời khuyên, không phải cơ chế cứng. Liên hệ [[entities/generals]] và [[systems/general-system]].

## Trận cao cấp: Vân Thùy (云垂阵)

Trận thứ tư **Vân Thùy (云垂阵, Mây Buông)** là tâm điểm hậu kỳ, dành cho người chơi nạp/đầu tư sâu. Điều kiện mở (`high`, nhiều nguồn đồng thuận):
- **Giác tỉnh (觉醒)** đồng thời **黄月英 (Hoàng Nguyệt Anh)** và **魏延 (Ngụy Diên)**.
- Sở hữu **破甲战车 (Phá Giáp Chiến Xa)** — chiến xa phá giáp (binh chủng/tier giác tỉnh).
- Tốn **8888 vàng/điểm** để mở.

> [!warning] Tiền đề "mở 3 trận cơ bản trước"
> Một số nguồn nói phải mở khóa 3 trận cơ bản trước rồi mới được mở Vân Thùy; trang gamedog chỉ liệt kê 4 điều kiện (giác tỉnh 2 tướng + chiến xa + vàng) mà không nhắc tiền đề này. Coi tiền đề 3-trận là **chưa chắc**.

### Hiệu ứng 变阵 (Biến Trận) ngẫu nhiên

Đặc trưng của Vân Thùy là **变阵 (Biến Trận)**: **hy sinh một quân mai phục (伏兵) của mình** để kích hoạt ngẫu nhiên **một trong ba** hiệu ứng:

| Hiệu ứng | Hán-Việt | Quy mô | Đánh giá |
|----------|----------|--------|----------|
| 火龙在天 | Hỏa Long Tại Thiên | ~1 quân | Tốt (≈ lời 1 quân) |
| 盾甲护体 | Thuẫn Giáp Hộ Thể | ~2 quân | Tốt (≈ lời 1 quân) |
| 水淹七军 | Thủy Yêm Thất Quân | ~5 quân | Giá trị thấp |

Vì kết quả là ngẫu nhiên nên **lợi ích phụ thuộc may rủi**. Phối hợp mạnh nhất khi tướng chủ lực đã giác tỉnh. Cơ chế hy sinh quân mai phục liên quan tới luồng chiến đấu theo lượt — xem [[systems/battle-system]] và [[systems/tactics-and-rage]].

## Cấp trận & Binh thư (兵书)

Trận pháp được nâng cấp bằng cách **khảm Binh thư (兵书)**. Quy tắc cốt lõi (`confirmed`, nguyên văn): 【阵法】等级为已镶嵌的【兵书】等级总和 — **cấp của một trận = tổng cấp của tất cả binh thư đã khảm vào trận đó**.

Binh thư có **3 màu**, mỗi màu cường hóa một thuộc tính khác nhau (nguyên văn: 三种颜色分别强化攻击、战法、防御):

| Màu | Cường hóa | Thuật ngữ |
|-----|-----------|-----------|
| Đỏ | Công kích | 攻击 (Công) |
| Lam | Chiến pháp | 战法 (Chiến pháp) |
| Lục | Phòng thủ | 防御 (Thủ) |

Binh thư chia theo **cấp bậc**: **sơ cấp (初级)** và **cao cấp (高级)**. Một nguồn còn nói có "三个等级" (ba cấp bậc) tổng thể, nên độ phân tầng có thể chi tiết hơn hai mức sơ/cao — coi như nhánh chi tiết chưa chốt.

### Ngưỡng cấp trận (ví dụ qua 雁形阵)

Trận **kích hoạt khi đạt level 20**, rồi nhận thêm bonus % (sát thương và giảm sát thương) tại **level 50** và **level 70**. Sau level 50, *雁形阵* gây sát thương theo hàng mỗi khi địch triển khai quân, và gây sát thương 4 hàng ngẫu nhiên khi **变阵** (`medium`). Các trận khác **có thể** theo cơ chế phân tầng tương tự nhưng chưa xác nhận.

> [!question] Câu hỏi mở
> - Con số % cụ thể tại mỗi ngưỡng (20/50/70) cho từng trận chưa tìm thấy trong nguồn.
> - Số ô/vị trí mỗi trận, và việc đặt tướng/binh cụ thể vào vị trí ánh xạ ra bonus thế nào — chưa rõ.
> - Trận có cấp **hệ số nhân khắc chế** binh chủng hay chỉ cộng chỉ số phẳng cho binh chủng khớp — nguồn không nói rõ.
> - Trận **鱼鳞阵 (Ngư Lân)** xuất hiện trong một tóm tắt như lựa chọn khắc trận — KHÔNG xác nhận được trong nguồn gốc, có thể lẫn từ game Tam Quốc khác. Coi là `unverifiable`.

### Nguồn thu thập Binh thư

Binh thư **sơ cấp** đến từ (`confirmed`):
- **国战诏令 (Quốc Chiến Chiếu Lệnh)** — chiếu lệnh quốc chiến.
- **水镜庵 (Thủy Kính Am)** — đổi bằng bạc/vàng (1-3 cấp ngẫu nhiên, ~5 lượt đổi miễn phí/ngày).
- **神秘商人 (Thần Bí Thương Nhân)** — thương nhân bí ẩn.
- **功勋宝箱 (Công Huân Bảo Rương)** — mở được sau khi đánh phó bản **214** và nghiên cứu công nghệ **重勋厚赏 (Trọng Huân Hậu Thưởng)**.

Cuộn sơ cấp **có xác suất** ra vàng và binh thư; cuộn cao cấp **chắc chắn** ra binh thư (初级的有几率获得金币、兵书等道具、高级的则必定获得兵书).

> [!tip] Lưu ý khi dựng lại
> - Tách bạch **"cấp trận" (level binh thư cộng dồn)** với **"cấp nhân vật"** ngay trong data model — đây là nguồn nhầm lẫn chính của tài liệu hệ thống này.
> - Mô hình hóa Binh thư như item có 2 trục: `color ∈ {red, blue, green}` (ánh xạ attack/战法/defense) và `grade/level`. Trận giữ danh sách ô; `formationLevel = Σ bookLevel`.
> - Hiệu ứng **变阵** của Vân Thùy là **RNG có trọng số** chọn 1 trong 3 — tách bảng trọng số ra config để tinh chỉnh.
> - Mốc kích hoạt 20 / spike 50 / 70 nên là **bảng ngưỡng theo từng trận** (chưa có số liệu thật → để placeholder, gắn `TODO: xác minh % trong client`).
> - Khi dựng kinh tế, gắn chi phí mở vị trí 150 vàng/trận (450 cho 3) và 8888 vàng cho Vân Thùy vào [[systems/economy-and-internal-affairs]].

## Liên kết hệ thống

Trận pháp là tầng cuối chồng lên các hệ nền: hệ khắc chế binh chủng vòng tròn ([[systems/troop-types]]), bố cục hàng đợi tối đa 5 tướng và thế trận ([[systems/battle-system]]), giác tỉnh tướng ([[systems/general-system]], [[entities/generals]]). Vì gating ở cấp 210 + phó bản 214, nó thuộc nội dung hậu kỳ — liên hệ [[systems/multiplayer-and-endgame]] và [[systems/progression-and-vip]]. Phạm vi bản game đang dựng lại: xem [[decisions/game-version-scope]].

## Nguồn

- 攻城掠地阵法系统简介以及兵书来源汇总 (Baidu Jingyan): https://jingyan.baidu.com/article/ce09321b84f6d72bff858fb1.html
- 攻城掠地雁行阵怎么开启 雁行阵有哪些效果 (欢乐园): https://www.hly.com/zixun/z-89726.html
- 攻城掠地80云垂阵变阵效果 适合什么英雄 (欢乐园): https://www.hly.com/zixun/z-71340.html
- 攻城掠地云垂阵开启条件 云垂阵解锁方式 (游戏狗): https://www.gamedog.cn/online/3277780.html
- 攻城掠地云垂阵解锁方式 云垂阵特效效果如何 (8090): https://www.8090.com/gcld/article_293015.html
- 攻城掠地阵法开启条件 攻城掠地阵法攻略 (九游): https://www.9game.cn/news/9965370.html
- 水镜庵 binh thư đổi (84joy): http://www.84joy.com/article/1306.html

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/troop-types]]
- [[systems/battle-system]]
- [[systems/general-system]]
