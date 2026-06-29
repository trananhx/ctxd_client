---
title: Bản đồ thế giới & chiến dịch sử thi
category: world
tags: [world-map, quoc-chien, kich-ban, pve, three-kingdoms]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Bản đồ thế giới & chiến dịch sử thi

Bản đồ thế giới của **Công Thành Xưng Đế** (攻城掠地, bản webgame 傲世堂 2013) là sân khấu của hai trụ cột gắn chặt nhau: lớp **Quốc chiến (国战)** — một bản đồ chung tái hiện toàn cõi Tam Quốc nơi ba nước tranh đoạt thành trì — và lớp **kịch bản sử thi (剧本/副本)** đơn người chơi kể lại dòng thời gian lịch sử. Trang này mô tả địa lý, cơ chế chiếm thành trên bản đồ, các thành đặc biệt và chuỗi kịch bản. Cơ chế chiến đấu chi tiết nằm ở [[systems/city-conquest]]; phần đối kháng người chơi và endgame ở [[systems/multiplayer-and-endgame]].

## Quy mô & phân chia bản đồ

Bản đồ quốc chiến gồm **247 thành trì/quan ải (城池关隘) + 3 thành Man tộc (蛮族)**, chia cho ba nước **Ngụy / Thục / Ngô (魏蜀吴)**. Đây là con số "datasheet" chính thức từ trang 国战系统; còn con số marketing lặp lại khắp các nguồn là **"300+ quan ải thành trì" (300多个关隘城池)** — thực cảnh tái hiện bản đồ Tam Quốc. Bản Việt hóa (báo Thanh Niên) ghi đúng "247 thành trì + 3 lãnh thổ Man tộc", còn các trang quảng bá VN dùng "300+".

> [!info] Hai con số không mâu thuẫn: **247 ô đất + 3 thành Man** là số liệu kỹ thuật của bản đồ thực tế, còn **"300+"** là cách làm tròn marketing. Cả Baidu Baike lẫn XY助手 đều ghi đồng thời cả hai trên cùng bài viết. Khi dựng lại, hãy lấy 247+3 làm số ô thật.

Người chơi của ba nước **di chuyển thời gian thực** trên cùng một bản đồ, va chạm và tranh đoạt trực tiếp. Càng giữ nhiều thành thì **Quốc lực (国力)** càng cao và phần thưởng **Quân tư (军资)** càng lớn.

## Sương mù chiến tranh (迷雾)

Bản đồ phủ **sương mù (迷雾)**: vùng chưa thám hiểm bị che, người chơi phải tiến quân mới mở ra tầm nhìn. Đây là cơ chế che thông tin chuẩn của thể loại SLG trên bản đồ chung.

> [!warning] Nguồn nghiên cứu xác nhận chắc các thành đặc biệt, quy tắc chiếm thành và cơ chế 突进, nhưng **chi tiết tham số của sương mù (迷雾)** (bán kính tầm nhìn, tốc độ mở) chưa được nguồn nào nêu số cụ thể. Khi dựng lại cần coi đây là phần phải tự thiết kế/đo lại.

## Cơ chế chiếm thành trên bản đồ

Có **hai đường chiếm thành** khác biệt rõ:

1. **Thành vô chủ (无主)** — di chuyển tới ô chưa có nước nào sở hữu rồi **đánh bại NPC trấn giữ** (击败其中NPC占领城池) để chiếm. Đây là khâu PvE.
2. **Thành của địch** — di chuyển tới thành của nước khác rồi **đánh bại người chơi địch** đang phòng thủ bên trong (击败他国玩家才能占领城池). Đây là khâu PvP.

Chiếm thành và lập công trên **Bảng sát địch (杀敌榜)** đem lại kinh nghiệm và bạc (银币). Vòng lặp sức mạnh lõi: chiếm thành → kinh nghiệm/lương/mảnh tướng/trang bị → quân đội mạnh hơn → chiếm thành khó hơn (xem [[systems/city-conquest]]).

### Đột tiến / Phá vây (突进)

Khi một phe có **số quân trên chiến trường lớn hơn gấp 3 lần** đối phương, phe đông có thể **đột tiến (突进)**: đánh thẳng vào các thành hậu phương của địch cho tới khi tỉ lệ tụt xuống dưới 3:1. Nguyên văn: *"当战场上一方人数大于对方3倍时，人多的一方可以进行突进，直接攻击敌人后方城池，直到人数小于对方3倍"*.

> [!info] 突进 là cơ chế "bóng tuyết" thưởng cho phe áp đảo quân số: thay vì bị chặn ở tiền tuyến, phe đông được phép xuyên thủng vào sâu. Có cơ chế **bao vây (包围)** đi kèm — thành bị bao vây thì người trong đó không thể thả chiến pháp (无法释放战法). Chi tiết PvP ở [[systems/multiplayer-and-endgame]].

## Thành đặc biệt (特殊城池)

Bốn thành đặc biệt nối bản đồ chiếm đất với hệ thống nội chính, định hướng nước nào nên ưu tiên đoạt ô nào:

| Thành | Hiệu ứng |
|------|----------|
| **Lư Giang (庐江)** | Giảm thời gian hồi (CD) cửa hàng + **x2 kinh nghiệm luyện quân** |
| **Trần Lưu (陈留)** | Mở **Hắc thị (黑市)** — giảm CD chợ đen / giao dịch tài nguyên thêm |
| **Bạch Đế (白帝)** | **x2 khối lượng giao dịch** (mua bán) |
| **Tương Dương (襄阳)** | Phần thưởng Quân tư có chứa **Tân thiết / sắt (镔铁)** |

Các hiệu ứng này liên hệ trực tiếp tới [[systems/economy-and-internal-affairs]] và [[systems/equipment-and-gear]] (镔铁 là vật liệu rèn/cường hóa trang bị).

## Chiến dịch sử thi — kịch bản (剧本/副本)

Song song với quốc chiến là chuỗi **kịch bản/phó bản đơn người chơi** tái hiện dòng thời gian Tam Quốc theo lịch sử thật.

### 5 bậc độ khó

Mỗi kịch bản có **năm bậc khó**: **Giản đơn (简单)**, **Phổ thông (普通)**, **Khốn nan (困难)**, **Địa ngục (地狱)**, **Chiến thần (战神 / 5 sao)** — 战神 là bậc cao nhất. Loại phần thưởng đổi theo bậc:

- **简单 + 普通** → tặng **lương thực (粮食/粮草)**.
- **困难 + 地狱 + 战神** → tặng **lượng lớn kinh nghiệm**.

Nguyên văn mẹo người mới: *"每个剧本的简单，普通难度都是送粮食的，而困难，地狱，战神难度则是给大量的经验的"*.

### Lượt chơi & ảo ảnh (幻影)

**Kịch bản thế giới (世界剧本)** giới hạn **~3 lần/ngày**, đo bằng **số lần HOÀN THÀNH** chứ không phải số lần khởi động: thành bị địch chiếm (被敌军攻陷) hoặc nhiệm vụ thất bại (任务失败) sẽ **làm mới lại mà KHÔNG tính vào 3 lần**.

Chiến đấu kịch bản dùng **Ảo ảnh / quân bóng (幻影, 影子)** tích trữ từ **Binh khí tác phường (兵器作坊)**. Bậc càng cao càng ngốn nhiều ảo ảnh (ví dụ Quan Độ-Chiến thần cần ~11 ảo ảnh, hoặc ~8 nếu có cường hóa 突进; Bạch Môn Lâu cho 28 ảo ảnh ở Địa ngục / 35 ở Chiến thần). Xưởng cấp 3 nâng trần ảo ảnh lên 60, cấp 5 cho ~120 ảo ảnh/ngày.

> [!question] Nguồn chưa xác nhận có **thanh thể lực/tinh lực (体力/精力) bằng số** riêng để chặn PvE hay không. Theo dữ kiện hiện có, việc chặn nhịp PvE chỉ gồm giới hạn "~3 lần hoàn thành/ngày" cộng ngân sách ảo ảnh hàng ngày.

### Mở khóa tướng từ phó bản

Đánh bại các **NPC boss có tên** trong phó bản sẽ **mở khóa chính tướng lịch sử đó** để chiêu mộ ở **Tửu quán (酒馆)**; phó bản còn rơi **mảnh tướng (武将碎片)** và **trang bị bộ** (套装: 朱雀 Chu Tước / 玄武 Huyền Vũ / 青龙 Thanh Long — bộ Chu Tước được coi là thiết yếu cho kịch bản thế giới). Xem thêm [[entities/generals]] và [[systems/general-system]].

## Dòng thời gian & các kịch bản

Chuỗi kịch bản neo vào dòng lịch sử Tam Quốc, bắt đầu từ Khởi nghĩa Khăn Vàng.

- **Trấn áp Khăn Vàng (镇压黄巾)** — neo vào Khởi nghĩa Khăn Vàng (黄巾起义, năm 184, do **Trương Giác / 张角** lãnh đạo). Chế độ này có **2 pha**: trước thu phục các thành (宛城 Uyển Thành / 江夏 Giang Hạ / 江陵 Giang Lăng), sau phá hủy **Đàn tế Khăn Vàng (黄巾祭坛)**.
- **Quan Độ (官渡)** — các ô 白马 Bạch Mã / 乌巢 Ô Sào / 官渡 Quan Độ; NPC boss **Nhan Lương (颜良)**, có đồng minh triệu hồi **Quan Vũ (关羽)**. Liên quan kịch bản **Quá ngũ quan trảm lục tướng (过五关斩六将)**.
- **Xích Bích / Hổ Lao** — chiến trường giai đoạn liên minh chống Tào.

Ngoài ra có **~10 kịch bản thế giới (世界剧本)**, mỗi cái cố định một số thành nhỏ và cơ chế sự kiện (một số dùng lựa chọn **Cẩm nang / 锦囊** và mục tiêu chia đường **兵分N路**):

| Kịch bản | Số thành | Điển tích |
|---------|---------|-----------|
| Dược Mã Đàn Khê (跃马檀溪) | 4 | Lưu Bị vượt suối |
| Bạch Y Độ Giang (白衣渡江) | 5 | Lữ Mông đoạt Kinh Châu |
| Kí Châu Khởi Sự (冀州起事) | 5 | chuỗi sự kiện đột tiến |
| Viên Môn Xạ Kích (辕门射戟) | 4 | điển tích Lữ Bố |
| Hỏa Thiêu Liên Doanh (火烧连营) | 4 | Di Lăng, 4 NPC chiến thuật trấn giữ |

Các kịch bản khác được nêu tên: 刺杀董卓 (Thích sát Đổng Trác), 智取荆州 (Trí thủ Kinh Châu), 迁都许昌 (Thiên đô Hứa Xương), 宛城之战 (Uyển Thành chi chiến), 南下江陵 (Nam hạ Giang Lăng — hộ tống 3 hướng), 单骑救主 (Đơn kỵ cứu chủ — điển tích Triệu Vân), 白门楼之战 (Bạch Môn Lâu chi chiến).

> [!tip] Khi dựng lại, hãy mô hình hóa kịch bản như **dữ liệu**: mỗi kịch bản = {danh sách ô thành, NPC boss → tướng mở khóa, đồng minh triệu hồi, số ảo ảnh theo bậc, loại phần thưởng theo bậc, sự kiện 锦囊}. Cấu trúc này lặp lại đồng nhất nên rất hợp với một file cấu hình theo kịch bản.

> [!warning] Danh sách đầy đủ và **thứ tự chính xác** mở khóa các kịch bản theo dòng thời gian chưa được nguồn liệt kê trọn vẹn (mới có ~10 kịch bản thế giới + vài phó bản chiến dịch có tên). Con số kinh nghiệm/lương/mảnh tướng cụ thể theo từng bậc cũng chưa được xác nhận bằng số.

> [!warning] Đừng trộn với hai game cùng tên: **Công Thành Xưng Đế Mobile (NPH VGP, 2019)** và **Loạn Thế Tào Tháo Truyện (乱世曹操传)** là game KHÁC. Mọi cơ chế bản đồ/kịch bản ở trang này thuộc bản webgame 傲世堂 2013 — bản khớp với asset của dự án. Bối cảnh NPH/lịch sử ở [[decisions/game-version-scope]].

## Nguồn

- 国战系统 — datasheet chính thức 攻城掠地 (247 thành, quy tắc chiếm, 突进, thành đặc biệt): https://gc.aoshitang.com/news/ziliao/612012121118034329969.html
- XY助手 国战系统 (xác nhận 247城+3蛮族, đường chiếm thành, 突进): https://m.xyzs.com/news/19833.html
- 攻城掠地 32条新手必备常识 — Gamersky (thưởng theo bậc, 3 lần/ngày, ảo ảnh): https://www.gamersky.com/handbook/201405/359124.shtml
- 攻城掠地世界剧本攻略 — Juxia (10 kịch bản thế giới, số thành): https://www.juxia.com/news/2013-11-21/103733.html
- 官渡剧本简单至战神5星通关攻略 — Juxia (5 bậc, ảo ảnh, Quan Vũ/Nhan Lương): https://www.juxia.com/jxgcld/92119.html
- 镇压黄巾攻略 — 9game (chế độ 2 pha Trấn áp Khăn Vàng): https://www.9game.cn/news/3191207.html
- 攻城掠地 — Baidu Baike (tổng quan, "300+ 关隘城池", 3 nước): https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010
- Công Thành Xưng Đế — Thanh Niên Games (247 thành + 3 Man tộc, bản VN): https://thanhnien.vn/games/cong-thanh-xung-de-6247.htm

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/city-conquest]]
- [[systems/multiplayer-and-endgame]]
- [[systems/general-system]]
