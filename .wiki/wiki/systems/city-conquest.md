---
title: Công thành chiếm đất (PvE — 攻城掠地/打天下)
category: systems
tags: [pve, city-conquest, dungeon, scenario, campaign, phantom]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Công thành chiếm đất (PvE — 攻城掠地 / 打天下)

"Công Thành Chiếm Đất" (攻城掠地) chính là cái tên của game, đồng thời là trụ cột PvE cốt lõi. Cơ chế được tổ chức thành **hai lớp lồng nhau**: (1) lớp **bản đồ quốc chiến (国战 / 世界地图)** dùng chung cho cả ba nước Ngụy/Thục/Ngô; và (2) lớp **chiến dịch kịch bản đơn (剧本 / 副本)** tái hiện sử Tam Quốc cho từng người chơi. Trang này tập trung vào CƠ CHẾ PvE; chi tiết địa lý bản đồ xem ở [[world/world-map-and-campaign]].

> [!info] Ý đồ thiết kế cốt lõi
> Toàn bộ PvE là một **vòng lặp sức mạnh** khép kín: chinh phục → nhận EXP/lương thực/mảnh tướng/tướng mới/đồ bộ → quân đội mạnh hơn → đánh được phó bản khó hơn. Mọi hệ thống con (Tửu Quán, Binh Khí Tác Phường, đồ bộ) đều được móc nối vào vòng lặp này.

## Lớp 1 — Bản đồ quốc chiến (国战 / 世界地图)

Bản đồ dùng chung gồm khoảng **247 thành/ô đất (城池/地块)** cộng **3 thành Man tộc (蛮族城)** (con số marketing thường ghi "300+ quan ải thành trì", 300多个关隘城池). Người chơi của ba nước cùng di chuyển quân theo thời gian thực trên bản đồ này. Đây là lớp lai PvE/PvP: chiếm thành vô chủ là PvE, tranh thành của nước khác là PvP.

Có **hai con đường chiếm thành** khác nhau (đều confirmed):
- **Thành vô chủ (无主):** di chuyển quân tới ô đất chưa thuộc về ai rồi **đánh bại NPC trấn giữ** để chiếm.
- **Thành của nước khác:** di chuyển tới và **đánh bại người chơi đối phương** đang phòng thủ trong thành.

Giữ càng nhiều thành thì **quốc lực (国力)** càng cao và thưởng **quân tư (军资)** càng lớn; chiếm thành và lập công trên **Sát Địch Bảng (杀敌榜)** cho EXP và bạc (银币).

> [!info] Cơ chế Đột Tiến (突进)
> Khi một bên có **quân số lớn hơn 3 lần** đối phương trên một chiến trường, bên đông quân được phép **đột tiến** — đánh thẳng vào các thành ở hậu phương địch — cho tới khi tỉ lệ tụt xuống dưới 3:1. Đây là mốc gập ghềnh quan trọng: vượt mốc >3x mở ra đột phá sâu, nên việc dồn quân tập trung là chiến thuật then chốt ở lớp quốc chiến.

Một số **thành đặc biệt** trên bản đồ cấp buff nội chính, định hướng nước nào nên ưu tiên chiếm ô nào (liên hệ [[systems/economy-and-internal-affairs]]):
- **Lư Giang (庐江):** giảm hồi chiêu cửa hàng + nhân đôi EXP huấn luyện.
- **Trần Lưu (陈留):** chợ đen (黑市).
- **Bạch Đế (白帝):** nhân đôi khối lượng giao thương.
- **Tương Dương (襄阳):** thưởng quân tư có thêm **tân thiết (镔铁 / sắt)**.

Lớp quốc chiến này nghiêng nhiều về PvP cuối game; xem thêm [[systems/multiplayer-and-endgame]]. Chi tiết phân bố ô đất, đường tiến quân: [[world/world-map-and-campaign]].

## Lớp 2 — Chiến dịch kịch bản / phó bản (剧本 / 副本)

Lớp PvE đơn người tái hiện các hồi Tam Quốc Diễn Nghĩa. Mỗi kịch bản có **5 bậc độ khó** (confirmed trên kịch bản Quan Độ liệt kê đủ 5 bậc):

| Bậc | Tên gốc | Nghĩa | Thưởng chính |
|-----|---------|-------|--------------|
| 1 | 简单 | Dễ | Lương thực (粮食) |
| 2 | 普通 | Thường | Lương thực (粮食) |
| 3 | 困难 | Khó | EXP lớn |
| 4 | 地狱 | Địa Ngục | EXP lớn |
| 5 | 战神 | Chiến Thần (5 sao) | EXP lớn nhất |

Quy tắc thưởng theo bậc (confirmed): **Dễ/Thường cho lương thực**, còn **Khó/Địa Ngục/Chiến Thần cho lượng EXP lớn**. Đây là cách thiết kế tách nhu cầu kinh tế (lương) khỏi nhu cầu lên cấp (EXP) theo độ khó.

> [!info] Giới hạn lượt theo "số lần hoàn thành"
> **Thế giới kịch bản (世界剧本) giới hạn ~3 lượt/ngày**, nhưng đo theo **số lần HOÀN THÀNH** chứ không phải số lần khởi động. Nếu thành bị địch đánh chiếm (被敌军攻陷) hoặc nhiệm vụ thất bại (任务失败), thành sẽ refresh lại và **không bị tính vào 3 lượt**. Nói cách khác: "3 lượt/ngày" nghĩa là được hoàn thành 3 lần.

### Quân ảo / Huyễn Ảnh (幻影) — tài nguyên tiêu hao của phó bản

Chiến đấu trong phó bản dựa vào **quân ảo / Huyễn Ảnh (幻影, còn gọi 影子 — quân bóng)**, là đơn vị tiêu hao tích lũy từ **Binh Khí Tác Phường (兵器作坊)**:
- Tác phường **cấp 3:** trần tích trữ **60 quân ảo**.
- Tác phường **cấp 5:** sản ra **~120 quân ảo/ngày**.

Phó bản càng khó càng tốn nhiều quân ảo (ví dụ Quan Độ - Chiến Thần cần ~11 quân ảo, hoặc ~8 nếu có **đột tiến cường hóa**; Bạch Môn Lâu cho 28 quân ảo ở Địa Ngục, 35 ở Chiến Thần). Nhìn chung phó bản độ khó cao tốn khoảng **~8–35 quân ảo**.

> [!tip] Lưu ý khi dựng lại
> Khi mô hình hóa kinh tế PvE, hãy coi **quân ảo (幻影)** là một loại "năng lượng tái tạo theo ngày" gắn với cấp Binh Khí Tác Phường, chạy SONG SONG với giới hạn 3-lượt-hoàn-thành/ngày. Đây là hai van điều tiết độc lập, không phải một.

> [!question] Có thanh thể lực/精力 riêng không?
> Nguồn xác nhận hai van điều tiết: cap 3 lượt/ngày của thế giới kịch bản và ngân sách quân ảo theo ngày. Tuy nhiên **không tìm thấy** một thanh thể lực/tinh lực số học (体力/精力) riêng biệt gating PvE. Cần kiểm chứng lại nếu dựng lại theo nguyên bản.

### Phần thưởng khi thắng NPC trong phó bản

Đánh bại các **boss NPC có tên** trong phó bản mang lại ba loại lợi ích cốt lõi (confirmed):
1. **Mở khóa tướng sử để chiêu mộ ở Tửu Quán (酒馆):** tướng lịch sử bị thua trong phó bản sẽ được mở khóa, sau đó người chơi chiêu mộ ở Tửu Quán. Chi tiết hệ tướng: [[entities/generals]] và [[systems/general-system]].
2. **Rơi mảnh tướng (武将碎片):** dùng để gom đủ chiêu mộ tướng lịch sử.
3. **Rơi đồ bộ (套装):** bộ **Chu Tước (朱雀)**, **Huyền Vũ (玄武)**, **Thanh Long (青龙)**. Bộ Chu Tước (朱雀套) được đánh giá là thiết yếu cho thế giới kịch bản. Chi tiết trang bị: [[systems/equipment-and-gear]].

> [!info] Bậc hiếm của tướng
> Thang độ hiếm của tướng: 白 < 蓝 < 绿 < 黄 < 红 < 紫 (Trắng < Lam < Lục < Vàng < Đỏ < Tím). Tướng mở khóa từ phó bản cần được nuôi lên cấp để mở các phó bản về sau — đây là mắt xích nối PvE với [[systems/general-system]].

## Dòng thời gian chiến dịch (sử Tam Quốc)

Các kịch bản tái hiện tuyến lịch sử, neo từ **Khởi nghĩa Khăn Vàng (黄巾起义, năm 184, do Trương Giác 张角 lãnh đạo)**, qua **Quan Độ (官渡)**, tới **Xích Bích (赤壁)**.

- **Trấn Áp Khăn Vàng (镇压黄巾):** chế độ hai pha — pha 1 thu phục các thành (宛城/江夏/江陵), pha 2 phá hủy **Khăn Vàng Tế Đàn (黄巾祭坛)**.
- **Quan Độ (官渡):** ô đất 白马/乌巢/官渡; NPC địch Nhan Lương (颜良); đồng minh triệu hồi Quan Vũ (关羽).
- **Xích Bích / Hổ Lao (赤壁/虎牢):** chiến trường về sau của tuyến.

Ngoài ra có ít nhất **mười thế giới kịch bản (世界剧本)** với số thành nhỏ cố định và cơ chế sự kiện riêng, ví dụ: Dược Mã Đàn Khê (跃马檀溪, 4 thành), Bạch Y Độ Giang (白衣渡江, 5 thành), Ký Châu Khởi Sự (冀州起事, 5 thành), Viên Môn Xạ Kích (辕门射戟, 4 thành), Hỏa Thiêu Liên Doanh (火烧连营, 4 thành). Một số dùng lựa chọn **cẩm nang (锦囊)** và mục tiêu chia đường (兵分N路). Xem tuyến chiến dịch đầy đủ ở [[world/world-map-and-campaign]].

> [!warning] Phân biệt phiên bản
> Cấu trúc trên thuộc **webgame 攻城掠地 (傲世堂, 2013)** — bản gốc của Công Thành Xưng Đế (asset dự án khớp bản này). Bản Việt hóa (~10/2013) được xác nhận giữ cùng khung quốc chiến, 3 nước, 300+ thành và tiến trình tướng qua phó bản, NHƯNG nguồn VN không lộ con số chính xác theo từng kịch bản (chỉ nguồn Trung văn có). KHÔNG trộn với "Công Thành Xưng Đế Mobile (2019, VGP)" hay "Loạn Thế Tào Tháo Truyện" — đó là game khác.

> [!question] Câu hỏi mở
> - Giá trị EXP/lương/mảnh chính xác theo từng bậc khó × từng kịch bản (nguồn xác nhận LOẠI thưởng theo bậc, chưa rõ con số).
> - Danh sách thứ tự đầy đủ của mọi kịch bản và trình tự mở khóa theo dòng thời gian.
> - Bản VN có dùng y hệt giới hạn lượt, số quân ảo và chế độ Trấn Áp Khăn Vàng hai pha hay không (nguồn VN chỉ khớp ở mức cao).

## Nguồn

- 国战系统 — datasheet chính thức 攻城掠地 (247 thành, quy tắc chiếm, 突进, thành đặc biệt): https://gc.aoshitang.com/news/ziliao/612012121118034329969.html
- 攻城掠地 32条新手必备常识 (Gamersky — thưởng theo độ khó, 3 lượt/ngày, quân ảo): https://www.gamersky.com/handbook/201405/359124.shtml
- 攻城掠地世界剧本攻略 (Juxia — mười thế giới kịch bản, số thành): https://www.juxia.com/news/2013-11-21/103733.html
- 攻城掠地官渡剧本简单至战神5星通关攻略 (Juxia — Quan Độ, 5 bậc, số quân ảo): https://www.juxia.com/jxgcld/92119.html
- 《攻城掠地》镇压黄巾攻略 (9game — Trấn Áp Khăn Vàng hai pha): https://www.9game.cn/news/3191207.html
- 《攻城掠地》各核心系统 (GameRes — phó bản → chiêu mộ ở Tửu Quán, thang hiếm): https://www.gameres.com/249586.html
- Hướng Dẫn Chơi Công Thành Xưng Đế (eGame VN — xác nhận phó bản/tiến trình tướng bản VN): https://egame.vn/huong-dan-choi-cong-thanh-xung-de/

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[world/world-map-and-campaign]]
- [[systems/general-system]]
- [[systems/equipment-and-gear]]
- [[systems/multiplayer-and-endgame]]
