---
title: Tiến trình người chơi, VIP & thương mại hóa
category: systems
tags: [progression, vip, monetization, leveling, free-to-play]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Tiến trình người chơi, VIP & thương mại hóa

Trang này mô tả trục thăng tiến của người chơi trong **攻城掠地 (Gōngchéng lüèdì)** — bản webgame của 傲世堂 (Aoshitang, 2013) mà bộ asset của dự án khớp với — cũng như hệ thống điều tiết nhịp chơi, đồng KNB nạp tiền và đặc quyền VIP. Trục tiến trình ở đây gắn chặt với [[systems/economy-and-internal-affairs]] (Lương thực điều tiết), [[systems/city-conquest]] (nguồn EXP từ cướp thành) và [[systems/multiplayer-and-endgame]] (Quốc chiến, Viễn Chinh).

## 1. Cấp Chủ Công (主公) — một đường thẳng liên tục

Người chơi thăng cấp theo **một cấp Chủ Công (主公) duy nhất**, lên liên tục theo kinh nghiệm tích lũy (EXP). Đây KHÔNG phải cây class/title (lớp nhân vật): hệ thống tự động nâng cấp khi đủ EXP, không cần đánh bại một NPC mốc nào để "lên cấp" (升级方式不是打某个NPC，而是靠主公经验积累自动升级).

Cấp Chủ Công đóng vai trò **cổng mở tính năng (level gate)**:

| Mốc cấp | Mở khóa |
| --- | --- |
| ~lv28 | Bản đồ thế giới (xem [[world/world-map-and-campaign]]) |
| trước lv30 | Giai đoạn hướng dẫn (tutorial) toàn phần |
| lv31 | Bắt đầu giai đoạn "khai hoang" (开荒) — mở biên cương |
| lv90 | Hệ ngọc/bảo thạch (宝石) mở khóa |
| lv170 | Viễn Chinh (远征) — nội dung/EXP cuối game |

> [!info] Ý đồ thiết kế: dùng cấp Chủ Công làm trục đo tiến độ duy nhất giúp người chơi luôn có một con số tăng đều, đồng thời mọi tính năng lớn được "rải" dọc trục cấp để giữ cảm giác mở khóa liên tục. Khi dựng lại, nên tách biệt rõ EXP/cấp với các điều kiện mở tính năng (config dạng `unlockLevel`).

> [!warning] Về danh hiệu (称号): nguồn xác nhận game CÓ danh hiệu như 扬名九州, 平定天下 (quanh lv100/105), NHƯNG chúng được trao theo **số thành đã chiếm**, không phải theo cây class. Vì vậy trục tiến trình vẫn đúng là "một cấp liên tục, không có cây class".

## 2. Nguồn kinh nghiệm (EXP)

Nguồn EXP đã được nhiều nguồn xác nhận (confirmed):

- **Phó bản/Kịch bản PvE (剧本/副本) theo độ khó**: Dễ/Thường (简单/普通) cho **Lương thực**; Khó/Địa Ngục/Chiến Thần (困难/地狱/战神) cho **EXP lớn**. Giới hạn 3 lượt phá đảo/ngày.
- **Quốc chiến (国战) 3 lần/ngày**: nguồn EXP lớn nhất ngoài phó bản (一般国战是除了剧本以外获得大量经验的最主要方式).
- **Nhiệm vụ quốc gia (国家任务)**.
- **EXP "tử binh" khi cướp thành lặp lại**: EXP tỉ lệ thuận với số quân tử trận (死兵越多经验越多) — cơ chế đổi Lương/quân lấy EXP. Xem chi tiết ở [[systems/city-conquest]].
- **Sau lv170**: phần lớn EXP đến từ phó bản và Viễn Chinh (远征).

> [!tip] Khi dựng lại bảng EXP: nguồn KHÔNG cung cấp công thức EXP-theo-cấp cụ thể (chỉ có lời khuyên định tính). Cần tự thiết kế đường cong EXP và đánh dấu là suy luận, không phải dữ kiện gốc.

## 3. Không có thanh thể lực — điều tiết bằng 3 cơ chế

Game **KHÔNG có thanh thể lực/năng lượng (stamina/energy)** riêng. Không tìm thấy pool điểm hành động (action-point) tách biệt. Thay vào đó nhịp chơi bị điều tiết bằng ba lớp:

1. **Lương thực (粮食)** — "thanh thể lực ngầm": tiêu hao khi chiêu mộ quân, di chuyển trên bản đồ thế giới, tiến chiến dịch và chiến đấu (粮食 là 行军打仗的必备物资). Chi tiết sản xuất/tiêu thụ ở [[systems/economy-and-internal-affairs]].
2. **Trần ngày (daily cap)**: 3 phó bản/ngày + 3 quốc chiến/ngày.
3. **Hồi chiêu theo hành động (cooldown)**: Xuất Chinh/Dụ Địch (出征/诱敌) có CD riêng; **VIP4 giảm nửa CD này** (xem mục VIP).

> [!info] Mô hình "Lương thực + trần ngày + CD" thay cho thanh thể lực là điểm thiết kế đặc trưng: nó gắn nhịp chơi vào kinh tế nội chính thay vì một tài nguyên trừu tượng, khuyến khích người chơi đầu tư vào sản xuất Lương. Khi dựng lại, nên triển khai 3 lớp này độc lập thay vì một thanh energy đơn.

## 4. Đồng nạp tiền: 元宝 (KNB/Vàng)

- Tiền cao cấp gốc là **元宝 (yuanbao)**, bản Việt hóa là **Kim Nguyên Bảo (KNB) / Vàng**.
- Tỉ lệ nạp chuẩn phía Trung: **1 RMB = 10 元宝** (1:10) — đã xác nhận từ nhiều nguồn TQ.
- 元宝/KNB dùng để mua vật phẩm, trang bị (xem [[systems/equipment-and-gear]]), tăng tốc (rút ngắn CD/thời gian chờ), và **gián tiếp nuôi hệ VIP累计充值 (lũy kế nạp)**.

> [!warning] Con số quy đổi VND của bản VN (vd "~10.000 VND ≈ 10.000 KNB", thưởng đăng ký 10.000 + 20.000 KNB) KHÔNG kiểm chứng được: hầu hết nguồn VN tìm được đều là **server lậu/private** với kinh tế thổi phồng (VIP15/VIP27 miễn phí, hàng triệu KNB). Chỉ chắc chắn: tên gọi KNB/Vàng và tỉ lệ gốc TQ 1:10. Khi dựng lại nên dùng một tỉ lệ tự định và đánh dấu rõ.

## 5. Hệ VIP (lũy kế nạp)

VIP được kích theo **tổng nạp lũy kế (累计充值)**. Bản về sau công bố **VIP1–VIP14**, mỗi bậc cho đặc quyền cơ chế cụ thể (không chỉ tăng chỉ số):

| VIP | Đặc quyền tiêu biểu |
| --- | --- |
| VIP1 | Tiếp tục dùng tự nâng cấp công trình sau lv30 |
| VIP2 | 50 Búa Vàng (黄金锤) + lệnh bài gỗ (sản lượng 300%) |
| VIP3 | 30 lượt mượn quân (借兵) miễn phí + lệnh bài bạc |
| VIP4 | Giảm nửa CD Xuất Kích/Dụ Địch (出击/诱敌) + lệnh bài lương |
| VIP5 | Mở phó bản "EXP khủng" (海量经验副本, ~lv50) + lệnh bài doanh trại |
| VIP6 | 3 món trang bị tím 3 sao (3星紫装, ~lv60) + lệnh bài khoáng |
| VIP7 | 2 lượt Tập Đoàn Quân (集团军) miễn phí (sau công nghệ lv70) |

Trang dữ liệu chính thống (gc.aoshitang.com) ghi rõ tại thời điểm viết "hiện mở tới VIP7" (目前开放到VIP7).

> [!warning] BẢNG NGƯỠNG NẠP MÂU THUẪN GIỮA NGUỒN — phải chọn 1 bản chuẩn khi dựng lại:
> - **Bản A (đầy đủ, 7724.com)**: VIP1=60, VIP2=666, VIP3=889, VIP4=1000, VIP5=2000, VIP6=3000, VIP7=4000, VIP8=5000, VIP9=6000, VIP10=7000, VIP11=8800, VIP12=12000, VIP13=36000, VIP14=48000 (元 RMB, lũy kế).
> - **Bản B (cũ/rẻ hơn)**: VIP2=30, VIP3=100, VIP4=200...
> Chênh lệch do phiên bản/server. Khuyến nghị: chọn **Bản A** làm chuẩn dựng lại (khớp nguồn verbatim) và đánh dấu là cấu hình tham chiếu, có thể tinh chỉnh.

Lưu ý: các "lệnh bài 300%" (木场令/银币令/粮食令/兵营令/镔铁令) là token tăng sản lượng có thời hạn — liên quan trực tiếp [[systems/economy-and-internal-affairs]]. "Tập Đoàn Quân" (集团军) là cơ chế đại quân endgame, xem [[systems/multiplayer-and-endgame]].

## 6. Cách kiếm 元宝 miễn phí & tranh luận F2P

Người chơi không nạp vẫn kiếm được 元宝 qua: gói quà mở server (开服礼包) + thẻ tân thủ (~50 vàng + tài nguyên), điểm danh hằng ngày, sự kiện diễn đàn 5-7 lần/tháng (300-1000 mỗi lần), chương trình sáng tạo nội dung trả thưởng. Lời khuyên non-R: để dành Búa Vàng (黄金锤) cho giai đoạn cuối game thay vì tiêu sớm.

> [!warning] Hai luồng quan điểm trái nhau về mức "hút máu":
> - **Nguồn VN** (vietgiaitri.com) nhấn mạnh game **rất thân thiện F2P**: phần lớn tính năng "không đòi hỏi nạp vàng", VIP đạt được với "vài nghìn nạp thẻ", thu thập tài nguyên/nâng công trình "hoàn toàn miễn phí", người không nạp vẫn "đạt được cấp độ cao", mức "hút máu" thấp.
> - **Nguồn TQ hardcore** (gamersky) phản biện: cấp rất cao thực tế cần nạp — dẫn boss lv94 (张宝) làm "tường chắn" cho người không nạp và khẳng định "不花钱这游戏是玩不下去的", hiếm ai không nạp lên được 100+.

> [!question] Cần xác định bản VN gốc (TTV Online/somo.vn, phát hành 31/10/2013) dùng đúng trần VIP14 và bảng đặc quyền của TQ, hay một bảng VIP/quy đổi đã bản địa hóa riêng?

## Nguồn
- https://gc.aoshitang.com/news/ziliao/492013022813493640830.html (VIP特权 chính thống, VIP1-7)
- http://m.7724.com/gcld/news/140598.html (bảng giá VIP1-14 lũy kế)
- https://www.gamersky.com/handbook/201405/359124.shtml (32 thường thức tân thủ: cấp, EXP, trần ngày)
- https://www.gamersky.com/handbook/201405/359129.shtml (tâm đắc người chơi non-R: kiếm 元宝 miễn phí)
- https://www.xyzs.com/news/19765.html (FAQ: tiêu hao Lương thực, lên cấp trước lv30)
- https://vietgiaitri.com/nhung-diem-nhan-thu-vi-cua-cong-thanh-xung-de-20131101i1019299/ (góc nhìn F2P, VIP, NPH TTV Online)
- https://thanhnien.vn/games/cong-thanh-xung-de-6247.htm (ra mắt VN 31/10/2013)

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks
- [[overview]]
- [[systems/economy-and-internal-affairs]]
- [[systems/multiplayer-and-endgame]]
- [[systems/city-conquest]]
