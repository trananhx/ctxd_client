---
title: Trang bị, bảo vật, thần binh & chiến mã
category: systems
tags: [equipment, treasures, divine-weapons, mounts, progression, combat-power]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Trang bị, bảo vật, thần binh & chiến mã

Đây là cụm sáu hệ thống tăng **chiến lực (战力)** cho từng tướng (xem [[entities/generals]] và [[systems/general-system]]). Tất cả đều tiêu hao tài nguyên nội chính (xem [[systems/economy-and-internal-affairs]]) và là động lực nuôi tướng dài hạn của bản webgame **攻城掠地 (2013)**.

> [!info] Ý đồ thiết kế: phân tầng theo mốc cấp
> Mỗi hệ mở khóa ở một mốc tiến trình khác nhau (đánh bại 郭汜 → trang bị; Lv36 → trang bị vàng có kỹ năng; Lv110 → bộ "chân"; Lv130 → thần binh; Lv170 → lò Luyện Bảo). Cách giăng mốc này kéo dài đường cong nuôi tướng, ăn khớp với [[systems/progression-and-vip]].

## 1. Trang bị 6 ô (装备)

Mỗi tướng mặc một bộ trang bị gồm **6 ô** (đã xác nhận trên nhiều nguồn Trung):

| Ô | Tên gốc | Vai trò |
|---|---------|---------|
| Vũ khí | 武器 | Tấn công |
| Giáp | 护甲 / 铠甲 | Phòng thủ |
| Binh phù | 兵符 / 军徽 | Ảnh hưởng quân số |
| Ngựa | 马匹 / 战马 | Tốc độ/tấn công |
| Áo choàng | 披风 | Hỗ trợ |
| Cờ | 旗帜 | Hỗ trợ |

Hệ trang bị **mở khóa sau khi đánh bại 郭汜 (Quách Dĩ)** trong chiến dịch — xem [[world/world-map-and-campaign]].

> [!warning] Nhãn ô có nhiều biến thể theo nguồn/phiên bản
> Giáp xuất hiện cả dạng 护甲 và 铠甲; binh phù xuất hiện cả 兵符 và 军徽 — chúng cùng một ô nhưng nhãn dịch khác nhau. Khi dựng lại, nên chốt một tên chuẩn nội bộ.

> [!warning] "Ô ngựa" trong trang bị vs hệ Chiến mã (坐骑) là quan hệ chưa rõ
> Có 马匹/战马 vừa là một ô trang bị, vừa có hẳn hệ Tọa kỵ (坐骑) riêng (mục 6). Nguồn nhắc cả hai nhưng không nói rõ chúng là cùng một đối tượng hay hai hệ tách biệt. Cần kiểm tra trong client thực tế. (`unverifiable`)

**6 phẩm chất tăng dần**: Trắng → Lam → Lục → Vàng → Đỏ → Tím (白/蓝/绿/黄/红/紫). Một nguồn cho biết tím (紫) mở ở Lv70. (`confirmed`)

### Kỹ năng trang bị (技能)

Từ phẩm **Vàng trở lên**, trang bị mang **kỹ năng (技能 cấp 1-5)** tăng tấn công/phòng thủ/quân số/EXP chiến đấu:

- Vàng: tối đa **1** kỹ năng (mở ở Lv36, đồ vàng mua về kèm kỹ năng 1 sao)
- Đỏ: tối đa **2** kỹ năng
- Tím: tối đa **3** kỹ năng

Kỹ năng được **đổi lại (洗练)** qua hai chế độ (`confirmed`):
- **Tẩy luyện thường (普通洗练)**: miễn phí, hồi 1 lượt/giờ, tích tối đa ~12 lượt (kể cả khi offline).
- **Tẩy luyện chí tôn (至尊洗练)**: tốn vàng (~5 vàng/lượt), hiệu ứng/cấp kỹ năng mạnh hơn.

Tẩy luyện **không bao giờ hạ cấp** kỹ năng hiện có và **có thể đổi loại** kỹ năng.

> [!warning] Mốc mở Tẩy luyện chưa chắc gắn với "nhiệm vụ thần binh"
> Tài liệu xác nhận Lv36 là mốc đồ vàng (đồ mang kỹ năng tẩy luyện được), nhưng KHÔNG nguồn nào khẳng định hệ tẩy luyện bị khóa sau một "nhiệm vụ thần binh". (`partially-confirmed`)

## 2. Cường hóa / Tinh luyện / Tẩy luyện (强化 / 精炼 / 洗练)

Trang bị (đặc biệt **bộ Cực phẩm 极套装**, mục 3) nâng cấp qua ba thao tác chính:

- **Cường hóa (强化)**: dùng **Đá cường hóa (强化石) + Kim sản (金铲)**, trần **Lv20**.
- **Tinh luyện (精炼)**: dùng **Đá tinh luyện (精炼石) / Vẫn thiết (陨铁) + Kim sản (金铲)**, trần **Lv20**.
- **Giác tỉnh (觉醒)**: dùng **Đá giác tỉnh (觉醒石) + nguyên liệu riêng + lượng lớn Kim khoáng (金矿)** để mở **thuộc tính ẩn (隐藏属性)**.

> [!info] Phân nhánh nguyên liệu theo ô
> Vũ khí/ngựa cần nhiều **Vẫn thiết (陨铁)** hơn (tăng tấn công/tốc độ); giáp/binh phù dựa vào **Đá tinh luyện (精炼石)** hơn (tăng phòng thủ/sức chứa quân). Tinh luyện bậc cao có **cơ chế tỉ lệ thành công**, giảm rủi ro bằng **Bùa may mắn (幸运符)**. (`confirmed`)

### Bậc đá kỹ năng

Đá nâng kỹ năng có ba bậc trần khác nhau:
- Đá thường: tối đa **Lv5**
- Đá tiến giai: tối đa **Lv40**
- Thần thạch: tối đa **Lv60**

> [!warning] Thông tin bậc đá Lv5/Lv40/Lv60 thuộc tóm tắt focus, chưa khớp đối chiếu trực tiếp
> File nghiên cứu xác nhận trần Cường hóa/Tinh luyện là Lv20 và kỹ năng đồ là Lv1-5, nhưng KHÔNG nêu rõ ba bậc đá Lv5/Lv40/Lv60. Cần đối chiếu thêm trước khi cài số vào hệ thống. (`unverifiable`)

> [!info] Tên trong bản Việt hóa (VN)
> Bản **Công Thành Xưng Đế** giữ ba phương thức: **Cường hóa** (tốn bạc), **Tinh luyện** (dùng đá tinh luyện 4 bậc lục/lam/tím/cam), và **Hợp thành** (ghép trang bị). Đá tinh luyện lấy từ Tế Đàn (Celestial Altar) và phụ bản; nâng phẩm trang bị cần mảnh + bạc (mảnh từ "Mộ Vũ Khí" hoặc cửa hàng trang bị). (`confirmed`, nguồn VGP chính thức)

## 3. Bộ thần thú (套装)

Có **8 bộ gốc** mang tên thần thú, mỗi bộ định vị một vai trò (`confirmed`):

| Bộ | Tên gốc | Tác dụng |
|----|---------|----------|
| Thanh Long | 青龙 | Tăng HP/máu (lên cấp nhanh) |
| Bạch Hổ | 白虎 | Tăng đánh thường (弱砍强 "yếu chém mạnh"); ví dụ ATK175/DEF105/HP440 |
| Chu Tước | 朱雀 | Tăng sát thương Chiến pháp (战法) |
| Huyền Vũ | 玄武 | Phòng thủ vật lý |
| Chúc Long | 烛龙 | Sức mạnh/khống chế/thủ (tướng Chiến pháp) |
| Khu Hổ | 驱虎 | Sức/đánh (tướng Chiến pháp mạnh, vd Hoàng Trung) |
| Lăng Lý | 鲮鲤 | Khống chế/thủ; kháng tướng Chiến pháp cao |
| Bá Hạ | 霸下 | Thủ vật lý + Chiến pháp + khống chế (tướng Thống cao) |

Quan hệ khắc chế giữa bộ liên quan vòng khắc chế thế trận trong [[systems/tactics-and-rage]] (vd 白虎克霸下, 朱雀克白虎).

### Bộ "chân" (真套装) ở Lv110+

Từ **Lv110**, hai bộ ghép thành một bộ "chân" mạnh hơn (`confirmed`):
- **Chân Bá Hạ (真霸下)** = 霸下 + 玄武
- **Chân Khu Hổ (真驱虎)** = 驱虎 + 白虎 → cộng thêm **ATK +375 / DEF +225 / mang quân +840** so với gốc
- **Chân Chúc Long (真烛龙)** = 青龙 + 烛龙

> [!info] Cơ chế "tiêu một bộ"
> Khi ghép, thuộc tính của một bộ được giữ, bộ kia **biến mất** (vd Chân Khu Hổ giữ thuộc tính 驱虎, thuộc tính 白虎 mất). Có nguồn nói bản vẽ Chân Khu Hổ mua ở **Lv115** qua 点券商城. (`confirmed`)

> [!warning] Có nhiều cặp ghép hơn 3 cặp liệt kê
> Nguồn còn nêu **真灵龟 = 灵龟 + 鲮鲤** và **真凤凰 = 凤凰 + 朱雀**, hàm ý có thêm bộ gốc (灵龟, 凤凰) hoặc nội dung bổ sung về sau ngoài 8 bộ. Tổng số bộ có thể nhiều hơn 8 tùy phiên bản. (`disputed`)

Đỉnh cao là **Bộ Cực phẩm (极套装)**, nâng qua 强化/精炼/觉醒 như mục 2.

## 4. Bảo vật (宝物 / 御赐宝物)

Mỗi tướng đeo **tối đa 1 bảo vật**. Mỗi bảo vật cộng hai thuộc tính (`confirmed`):
- **Thống (统)**: ảnh hưởng **tấn công & phòng thủ** của tướng.
- **Dũng (勇)**: ảnh hưởng **kháng Chiến pháp (战法抵挡)**.

Bảo vật cũng có **6 phẩm chất** theo thang Trắng→Tím. Một số bảo vật theo cấp: 万灵石(1-5), 将军令(6-9), 夜光杯(10-14), 和氏璧(15-19), 夜明珠(20-24), 紫珊瑚(25-29). Nguồn lấy: rương công huân (功勋宝箱), sự kiện, **Tiên Phong Lôi Đài Tái (先锋擂台赛)**, **Khoa Phục Tranh Bá (跨服争霸)** — xem [[systems/multiplayer-and-endgame]].

### Lò Luyện Bảo (炼宝炉)

Bảo vật nâng cấp tại **lò Luyện Bảo (炼宝炉)**, **mở khi qua phụ bản cốt truyện Lv170**. Nguyên liệu: 木炭 (mộc thán), 蚕丝 (tàm ti), 百炼钢 (Bách Luyện Cương), 精钢 (tinh cương), 炼宝币 (tiền luyện bảo). Cơ chế **Tôi luyện (淬火)** cho phép khóa thuộc tính.

> [!tip] Ưu tiên khi tôi luyện
> Hướng dẫn khuyên ưu tiên tấn công/phòng thủ/HP và **bỏ thuộc tính 勇 giá trị thấp**. Lò bậc cao mở luyện **bảo thạch (宝石)**: 15+ đá đỏ kích kỹ năng như 斩杀/暴击; thuộc Thống (统) của bảo vật đỏ tăng tấn công vượt xa đồ thường. Bậc trung→cao cần thành tựu "5级王朝". Một nguồn nói trần tôi luyện 统/勇 +30 — cần xác nhận thêm. (`unverifiable`)

## 5. Thần binh (神兵)

Mở khóa bằng **công nghệ 天铸神兵 ở Lv130**. Công nghệ này **phá trần cấp vũ khí**, cho vũ khí lên **Lv180**; sau đó **hai vũ khí max ghép thành một** trong ba thần binh (`confirmed`):
- **Thất Sát Kiếm (七杀剑)** — loại kiếm
- **Tham Lang Giáp (贪狼甲)** — loại giáp
- **Phá Quân Ấn (破军印)** — loại ấn

Thần binh cường hóa bằng **Bách Luyện Cương (百炼钢)**, tinh luyện từ 镔铁 (tân thiết) tại lò rèn; chi phí thép tăng theo cấp thần binh.

> [!info] Thần binh gắn với danh hiệu & quyền lợi
> Có thần binh → danh hiệu **Đô Úy (都尉)** (đánh phế tích lấy lương mỗi ngày). Cường hóa hết toàn bộ thần binh → **Đại Tướng Quân (大将军)** với **Đại Tướng Quân Ấn (大将军印)** để nhận thành đã chiếm lấy thưởng (tơ lụa, 觉醒石, 幻影) — liên hệ [[systems/city-conquest]]. (`confirmed`)

> [!question] Bảng số liệu thần binh đến Lv180/220 chưa lấy được
> Bảng thuộc tính/chi phí 百炼钢 từng cấp nằm trên fan site (84joy) nhưng không tải được (chứng chỉ TLS hết hạn / 403). Cần mirror để trích số chính xác.

## 6. Chiến mã / Tọa kỵ (坐骑 / 战马)

Hệ riêng, **chia sẻ thuộc tính cho TOÀN BỘ tướng ra trận** (`confirmed`):

- **Phẩm chất tăng dần**: Lam → Tím → Cam → Đỏ → Vàng.
- **Tối đa 4 ô** chiến mã (mở dần qua cốt truyện + vàng).
- Cả **thuộc tính lẫn nội tại (passive)** của ngựa được mọi tướng trong đội hình hưởng chung.
- **Hệ số tăng theo cấp chênh lệch lớn theo phẩm**: ngựa vàng **+0.24%/cấp** so với ngựa lam **+0.04%/cấp**.

### Thu thập & kinh tế ngựa

- **Bắt ngựa** hằng ngày tại 塞外马场 bằng **Mã Tiên (马鞭)** (tốt nhất ở khung giờ chẵn).
- **Triệu hồi (召唤)**: ngựa lam miễn phí mỗi ngày; **10 铃铛 (linh đang/chuông) = ngựa đỏ**, **50 铃铛 = ngựa vàng**.
- **Hợp thành (合成)**: ghép hai ngựa cùng cấp thành phẩm cao hơn.
- **Phóng thích (释放)**: thả ngựa dư lấy **马草 (mã thảo/cỏ ngựa)** để nâng ngựa chính.
- **Trùng sinh (重生)**: hoàn lại **100%** nguyên liệu nâng cấp, an toàn để thử nghiệm.

> [!tip] Đầu game nên dồn một con ngựa chính
> Lời khuyên là tập trung tài nguyên vào **một chiến mã chủ lực** thay vì rải đều nhiều con. Đây là lưu ý hữu ích khi cân bằng đường cong tài nguyên lúc dựng lại hệ thống.

## Các điểm cần làm rõ khi dựng lại

> [!question] Mốc cấp ở bản Việt có lệch không?
> Các mốc (郭汜 → trang bị, Lv36 tẩy luyện, Lv110 bộ chân, Lv130 thần binh, Lv170 lò Luyện Bảo) có giữ nguyên trong bản VN hay bị Việt hóa dịch chuyển — chưa rõ.

> [!question] Công thức 战力 (chiến lực) tổng hợp
> Chưa tìm thấy công thức gộp và tỉ trọng đóng góp của từng hệ (trang bị vs bộ vs bảo vật vs thần binh vs ngựa). Sources mô tả định tính chứ không có công thức tổng.

Xem chi tiết phân loại độ tin trong [[claims]], [[contradictions]] và [[open-questions]]. Quyết định phạm vi phiên bản: [[decisions/game-version-scope]].

## Nguồn

- https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010
- https://www.jendow.com.tw/wiki/%E6%94%BB%E5%9F%8E%E7%95%A5%E5%9C%B0
- https://www.3dmgame.com/gl/3531630_9.html
- https://jingyan.baidu.com/article/3aed632e3456f57010809190.html
- https://c.m.163.com/news/a/KHDGNA650526DT3V.html
- https://www.9game.cn/news/11363934.html
- https://m.sohu.com/a/934767513_502356/
- https://congthanh.vgplay.vn/d/trang-bi-33

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/general-system]]
- [[entities/generals]]
- [[systems/economy-and-internal-affairs]]
- [[systems/progression-and-vip]]
