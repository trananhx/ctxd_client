---
title: Binh chủng (兵种)
category: systems
tags: [binh-chủng, kỵ-binh, thương-binh, cung-binh, công-thành, khắc-chế]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Binh chủng (兵种)

Binh chủng (兵种, *bīngzhǒng*) là phân loại quân lính cơ bản trong **攻城掠地** — bản webgame 傲世堂 (2013) mà dự án `ctxd_client` đang dựng lại. Đây là một trong những trang dễ bị "lẫn dữ kiện 3 game" nhất, nên trước hết phải xác lập rõ phạm vi: con số binh chủng, cơ chế khắc chế và hệ nâng sao của ba game gần tên nhau hoàn toàn khác nhau.

> [!warning] Phân biệt 3 game — đọc trước khi dùng bất kỳ con số nào
> Tiêu đề file nghiên cứu ban đầu ghi "5 binh chủng", nhưng **mục Verification verdicts đã đính chính**: bộ 5 binh chủng đó thuộc các bản KHÁC.
> - **攻城掠地 webgame 傲世堂 (2013) — MỤC TIÊU CHÍNH**: theo Baidu Baike và diễn đàn chính chủ 傲世堂, chỉ có **4 binh chủng** (骑兵/枪兵/弓兵/攻城) và "兵种互不相克" — binh chủng KHÔNG tự khắc chế nhau, khắc chế nằm ở lớp **thế trận** (xem [[systems/formation-system]]).
> - **Công Thành Xưng Đế Mobile (2019, NPH VGP)** — game mobile khác: **5 binh chủng** (Thương / Cung / Kỵ / Mưu Sĩ / Chiến Xa), có "tương sinh tương khắc" theo kiểu kéo-búa-bao.
> - **乱世曹操传 (Loạn Thế Tào Tháo Truyện)** — game anh em cùng NPH: **6 binh chủng** + hệ sao + 战录 + 兵种天赋 +25%.

Xem thêm [[decisions/game-version-scope]] để biết tại sao dự án bám bản 2013.

## Bốn binh chủng của bản webgame 2013 (canon)

Theo nguồn có độ tin cao nhất cho đúng bản 攻城掠地 (Baidu Baike + diễn đàn 傲世堂), roster binh chủng gốc gồm bốn loại:

| Binh chủng (中) | Tên Việt gợi ý | Vai trò khái quát |
|---|---|---|
| 骑兵 (Kỵ binh) | Kỵ Binh | Cơ động, đột kích, sát thương dồn |
| 枪兵 (Thương binh) | Thương Binh | Tuyến đầu, chống đỡ, phòng tuyến |
| 弓兵 (Cung binh) | Cung Binh | Tuyến sau, sát thương từ xa |
| 攻城 (Công thành) | Công Thành (xe công thành) | Chuyên đánh tường/thành, sát thương kiến trúc |

> [!info] Ý đồ thiết kế
> Roster 4 binh chủng phản ánh trọng tâm của game là **công thành chiếm đất** (xem [[systems/city-conquest]]). Binh chủng 攻城 (Công thành) tồn tại riêng vì game cần một loại quân chuyên phá tường/thành, chứ không chỉ là một bánh răng trong vòng khắc chế. Đây là khác biệt cốt lõi với các bản mobile sau (vốn thay 攻城 bằng cặp 谋士/战车 thiên về đối kháng tướng).

> [!warning] Đừng đưa 谋士/Mưu Sĩ và 战车/Chiến Xa vào bản 2013
> Bộ "Thương Binh / Cung Binh / Kỵ Binh / Mưu Sĩ / Chiến Xa" được nhiều nguồn tiếng Việt xác nhận, nhưng đó là **Công Thành Xưng Đế Mobile (2019)** — game thời gian thực, NPH VGP — KHÔNG phải webgame turn-based 2013. Nguồn chính chủ của bản 2013 không có 谋士 (Mưu Sĩ); binh chủng thứ tư là 攻城 (Công thành).

## Bằng chứng trực quan: game thật có ≥5 loại icon binh chủng

> [!warning] Ảnh game thật mâu thuẫn với "chỉ 4 binh chủng" — drift theo phiên bản
> Ảnh màn **武将对决** ([[sources/screenshot-somo-battle-2026-06-27]]) cho thấy mỗi tướng có **icon binh chủng riêng**, và xuất hiện **≥5 loại icon khác nhau**: gậy/quạt (**mưu sĩ 谋士** — 周瑜/诸葛亮), pháo/xe (**chiến xa 战车** — 黄月英), ngựa (**kỵ binh 骑兵** — 马超), thương (**thương binh 枪兵** — 周泰), cung (**cung binh 弓兵** — 黄忠).
> → Tức **game thật (cấp cao, bản về sau/somo) có cả 谋士 (mưu sĩ) và 战车 (chiến xa)**, KHÔNG chỉ 4 loại. Nhiều khả năng "4 binh chủng (骑/枪/弓/攻城)" là con số **bản LAUNCH 2013** theo Baidu, còn webgame chạy nhiều năm đã **thêm binh chủng** (谋士/战车). Đây có thể là **drift phiên bản trong chính webgame**, không chỉ là "3 game khác nhau". Cần chốt với chủ dự án: dựng lại theo bản launch 4 loại, hay bản về sau (somo, 5–6 loại). Xem [[contradictions#x-20260627-01]], [[decisions/game-version-scope]].

## Khắc chế nằm ở THẾ TRẬN, không ở binh chủng

Đây là điểm thiết kế quan trọng nhất và cũng dễ làm sai nhất khi dựng lại.

> [!warning] "兵种互不相克" — binh chủng KHÔNG khắc chế lẫn nhau (bản 2013)
> Đối với 攻城掠地 webgame, các nguồn nói rõ "**兵种互不相克**" (binh chủng không khắc chế nhau). Tức là KHÔNG có vòng tròn kiểu "thương khắc kỵ, kỵ khắc cung...". Lớp khắc chế thực sự nằm ở **thế trận / chiến thuật** (阵法/战术) theo tam giác:
> - **攻克守** (Công khắc Thủ) — thế Công thắng thế Thủ
> - **守克突** (Thủ khắc Đột) — thế Thủ thắng thế Đột kích
> - **突克攻** (Đột khắc Công) — thế Đột kích thắng thế Công
>
> Ba thế 突击/攻击/防御 (Đột kích / Công kích / Phòng ngự) khắc nhau theo vòng tròn. Chi tiết xem [[systems/formation-system]] và [[systems/tactics-and-rage]]. Trong [[systems/battle-system]], người chơi chọn binh chủng để phối hợp vai trò, còn ưu thế khắc chế đến từ việc chọn đúng thế trận.

> [!warning] Vòng khắc chế binh chủng 5 bước là DISPUTED — không dùng cho bản 2013
> Verdict nghiên cứu xếp chuỗi "枪兵→骑兵→弓兵→军师→战车→枪兵" vào loại **disputed**: không nguồn nào xác nhận đúng chuỗi này cho bất kỳ game ứng viên nào. Với webgame 2013 nó còn mâu thuẫn trực tiếp ("兵种互不相克"). Với bản Mobile 2019 chỉ xác nhận "có" cơ chế tương khắc, KHÔNG xác nhận chiều của vòng. Đừng triển khai vòng này như sự thật.

## Địa hình ưu tiên binh chủng

Một lớp tương quan riêng (ngoài thế trận) là **địa hình** chiến trường ưu tiên binh chủng phù hợp:

- **Đồng bằng (平原)** — lợi cho **kỵ binh** (không gian rộng để xung phong, đột kích).
- **Núi rừng (山林)** — lợi cho **bộ binh tuyến đầu / thương binh** và cung binh ẩn nấp, kỵ binh bị hạn chế cơ động.
- **Sông nước (河流)** — bất lợi cho kỵ binh; binh chủng tầm xa / công thành đóng vai trò khác.

> [!question] Hệ số địa hình cụ thể chưa rõ
> Nguyên tắc "địa hình ưu tiên binh chủng tương ứng" là hợp lý theo mô-típ Tam Quốc, nhưng **con số phần trăm tăng/giảm theo từng cặp địa hình × binh chủng cho đúng bản 2013 chưa có nguồn xác nhận**. Cần nguồn thời kỳ (2013–2015) để chốt bảng hệ số. Liên quan tới bản đồ và chiến dịch: [[world/world-map-and-campaign]].

## Tướng gắn cứng với một binh chủng

Mỗi võ tướng (武将) gắn cố định với một binh chủng, nên binh chủng của tướng chi phối tương quan khi giao đấu. Nguyên tắc "tướng có binh chủng cố định" là hợp lý; tuy nhiên bảng gán cụ thể cần thận trọng.

> [!warning] Bảng gán tướng ↔ binh chủng là UNVERIFIABLE
> Chỉ có mảnh ghép rời rạc và lẫn giữa các game (vd 吕布 ~ kỵ binh; 诸葛亮 ~ chiến xa trong ngữ cảnh đời sau). Danh sách chi tiết (黄忠/太史慈 = cung; 马超/关羽 = kỵ; 典韦/周泰 = bộ binh; 诸葛亮/周瑜 = mưu sĩ) **không kiểm chứng được** và còn tự mâu thuẫn (诸葛亮 vừa bị xếp 战车 vừa xếp mưu sĩ). Đừng cứng hóa các gán này. Xem [[entities/generals]] và [[systems/general-system]].

## Các hệ thuộc bản KHÁC — để tham chiếu, KHÔNG đưa vào 2013

Nhiều cơ chế "đẹp" trong tài liệu thực ra thuộc **乱世曹操传** hoặc **Mobile 2019**. Liệt kê ở đây để đội ngũ nhận diện và tránh nhầm.

> [!warning] Hệ nâng SAO + 战录 + 兵种天赋 thuộc 乱世曹操传, không phải 攻城掠地 2013
> Các con số dưới đây được xác nhận **verbatim nhưng cho 乱世曹操传** (6 binh chủng: 刀/枪/弓/弩/骑/战车), KHÔNG gán được cho webgame 2013:
> - Nâng sao 1★→5★ tiêu **战录** (chiến lục) đúng binh chủng: **50 / 100 / 150 / 200** cho 1→2 / 2→3 / 3→4 / 4→5. Mỗi sao tăng trần cấp binh chủng **+50**.
> - **4★** nhân đôi hiệu ứng 兵种天赋 (thiên phú binh chủng) — bậc đáng đầu tư nhất.
> - **5★** vào trận với 100 sĩ khí ban đầu (士气), cho phép tung kỹ năng 2 ngay lượt đầu.
> - 兵种天赋: nội tại cho **+25% sát thương** lên một binh chủng mục tiêu (vd 骑兵天赋1 = +25% lên 战车), có hiệu lực ở MỌI loại trận. Nguồn 战录: 演兵将台 (北大营 arena, 6 đài, tới 1000 tầng), 九州攻城/郭嘉商店, 金卡商城.

> [!warning] "Dungeon 攻城略地" với khắc chế ±80% là MODE trong 乱世曹操传
> Cơ chế "trong phụ bản tắt thiên phú, dùng vòng khắc chế mạnh ±80%, buộc nuôi 2+ binh chủng" là tên một **chế độ chơi bên trong 乱世曹操传**, KHÔNG phải game 攻城掠地. Đừng nhầm tên trùng.

> [!info] Vì sao vẫn ghi lại các hệ này
> Khi dựng lại, nếu đội ngũ quyết định "mượn" hệ nâng sao/天赋 cho đẹp, hãy ghi đó là **quyết định mở rộng có chủ đích** (lên [[decisions/game-version-scope]]) chứ không phải phục dựng bản 2013. Bản 2013 dồn chiều sâu vào THẾ TRẬN + nộ khí (xem [[systems/tactics-and-rage]]) và hệ tướng (xem [[systems/general-system]]).

## Lưu ý khi dựng lại trong Unity

> [!tip] Mô hình dữ liệu nên tách 2 trục
> Tách rõ hai trục độc lập: (1) **TroopType** {Kỵ, Thương, Cung, Công thành} — dùng cho vai trò + ưu tiên địa hình; (2) **Tactic/Formation** {突击, 攻击, 防御} — dùng cho vòng khắc chế ±. Vì bản 2013 "binh chủng không khắc chế", trục (1) KHÔNG nên có ma trận khắc chế binh-vs-binh. Đặt khắc chế ở trục (2). Tham chiếu [[systems/battle-system]].

> [!tip] Để ngỏ chỗ cho biến thể
> Thiết kế `enum TroopType` và bảng hệ số địa hình dưới dạng data-driven (ScriptableObject) để dễ chuyển đổi giữa cấu hình 4-binh-chủng (2013) và 5/6-binh-chủng nếu sau này muốn thử nghiệm — đối chiếu asset thực có trong dự án ở [[technical/asset-system-mapping]].

> [!question] Tên tiếng Việt trong client gốc
> Tên in-game tiếng Việt chính thức cho binh chủng 攻城 (Công thành) và cho hệ 战录 (có thể là "Chiến Lục" / "Quân Lục") trong client VN chưa được xác nhận. Cần ảnh chụp client cũ để chốt thuật ngữ. Ghi câu hỏi vào [[open-questions]].

## Nguồn

- 攻城掠地 — 百度百科 (4 binh chủng, "兵种互不相克", tam giác thế trận): https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010
- Diễn đàn / trang chính chủ 傲世堂 (Aoshitang): http://gc.aoshitang.com/
- 《攻城掠地》武将五种攻防属性全揭秘 (傲世堂): https://gc.aoshitang.com/news/zixun/322013031413222593632.html
- 攻城掠地武将选择 / 兵种克制关系: https://www.233leyuan.com/post-detail/1991837600193638277
- 曹操传兵种培养及攻城略地篇 (乱世曹操传 — hệ sao/战录/天赋, dùng để PHÂN BIỆT): https://www.taptap.cn/moment/531165787902182783
- 1001 lý do... Công Thành Xưng Đế Mobile 2019 (bộ 5 binh chủng, để phân biệt): https://2game.vn/1001-ly-chung-minh-cong-thanh-xung-de-mobile-la-chien-thuat-xuat-sac-nhat-2019-post209970.html

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/battle-system]]
- [[systems/formation-system]]
- [[systems/general-system]]
- [[decisions/game-version-scope]]
