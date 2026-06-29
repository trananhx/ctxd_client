---
title: Hệ chiến đấu (turn-based)
category: systems
tags: [battle, turn-based, stance, rage, tactics, renderer]
sources: []
created: 2026-06-27
updated: 2026-06-27
---

# Hệ chiến đấu (turn-based)

Đây là trang lõi mô tả hệ chiến đấu theo lượt của **Công Thành Xưng Đế** (攻城掠地 — webgame 傲世堂 2013, bản mục tiêu của dự án). Toàn bộ asset chiến trận trong Unity (`warBG`, `warvsicon`, `army/att`, `army/def`, `skill/*`, `eff/*`, `warSkillName`, `warFeatAnger`...) phục vụ chính cho hệ này — xem chi tiết ánh xạ tại [[technical/asset-system-mapping]]. Các con số/cơ chế phụ trợ về binh chủng nằm ở [[systems/troop-types]], thế trận (阵法) ở [[systems/formation-system]], nộ khí và chiến pháp ở [[systems/tactics-and-rage]], và bộ tướng ở [[entities/generals]].

## Tổng quan vòng chiến

Mỗi trận đánh diễn ra giữa hai đạo quân (một phe trên, một phe dưới màn hình). Mỗi phe ra trận **tối đa 5 tướng (武将)** xếp thành **hàng đợi/cột (队列式排布)**. Trước khi đánh, người chơi tự do **bày binh bố trận (排兵布阵)** — đổi thứ tự tướng để tối ưu (xác nhận: `confirmed`). Lính của mỗi tướng dàn thành nhiều hàng, hai bên đối trận và **đánh dồn từng hàng theo kiểu "tiệm tiến kích sát" (递进击杀)**: tướng/đơn vị đầu hàng ra đòn trước, dọn sạch tuyến tiền của địch rồi lượt sóng kế tiếp tràn lên.

Nhà phát hành tự gọi lối đánh này là **"递进式掩杀"** (yểm sát tiệm tiến). Chiến đấu chia thành **nhiều lượt (回合)**; mỗi lượt người chơi điều chỉnh chiến thuật theo tình hình thực địa (`confirmed`).

> [!info] Ý đồ thiết kế
> Trận đánh không phải xem clip thụ động: người chơi **trực tiếp điều khiển** đạo quân của mình bằng lệnh từng lượt và canh thời điểm tung chiêu. Đây là điểm cốt lõi cần giữ khi dựng lại — renderer phải hỗ trợ được vòng "đọc tình huống → ra lệnh → giải đòn".

## Ba thế trận và vòng khắc chế (lớp cơ chế chính)

Mỗi lượt người chơi ra **một trong ba lệnh/thế trận** cho cả đạo quân (`confirmed`):

| Thế trận | Tiếng Trung | Vai trò | Khắc chế | Bị khắc bởi |
|---|---|---|---|---|
| **Đột Kích** | 突击 (cũng gặp 冲锋) | Xung phong | Tấn Công | Phòng Thủ |
| **Tấn Công** | 攻击 | Tấn công tiêu chuẩn | Phòng Thủ | Đột Kích |
| **Phòng Thủ** | 防御 | Phòng thủ | Đột Kích | Tấn Công |

Đây là **kéo-búa-bao chặt chẽ** (`confirmed`, nguồn VN trích nguyên văn):
**Đột Kích > Tấn Công > Phòng Thủ > Đột Kích**.

Chọn đúng thế **khắc chế** thế của đối thủ mang lại **lợi thế lớn cho cục diện** ("战术选择正确，会对战局产生非常重要的影响" — `confirmed`). Vì hai bên ra lệnh đồng thời, trận đánh trở thành một trò **đoán ý đối thủ**: phải dự đoán nước đi của địch (hiểu lối đánh, điểm yếu của họ) trước khi bấm lệnh.

> [!warning] Chưa rõ — quan trọng cho việc tái dựng
> Nhãn tiếng Trung in-game của lệnh "đột kích" là **突击** hay **冲锋** chưa được xác nhận từ ảnh chụp màn hình; "Đột Kích" (VN) ánh xạ về 突击 nhưng marketing cũng dùng 冲锋.

> [!question] Câu hỏi mở (cần làm rõ trước khi code resolver)
> - **Hệ số thiệt hại** khi chọn đúng thế khắc chế là bao nhiêu (+X% sát thương? hay lợi thế tuyệt đối?) — không nguồn nào nêu số.
> - **Luật thứ tự ra đòn**: bên thắng thế có luôn đánh trước, hay thứ tự do tốc độ/vị trí tướng quyết định?
> - Bản webgame 2013 cho chọn thế **mỗi lượt** hay chỉ chọn một lần trước trận? Nguồn lẫn lộn giữa webgame và bản mobile về sau.

## Lớp khắc chế: ai đứng trên ai

Cần phân biệt rõ các lớp tác động để renderer/resolver xếp thứ tự áp dụng cho đúng:

1. **Chiến pháp (战法)** — **đứng TRÊN lớp thế trận**. Nguồn ghi "战法能够克制一切战术" (chiến pháp khắc chế mọi chiến thuật) — tức một chiêu được kích hoạt có thể **vượt/bỏ qua** vòng kéo-búa-bao. Chi tiết tại [[systems/tactics-and-rage]].
   > [!warning] Mức tin: `medium`
   > Câu "战法 khắc chế tất cả chiến thuật" mới thấy trong tóm tắt tìm kiếm, chưa fetch được nguyên văn từ trang gốc. Cần xác nhận chiến pháp có **hoàn toàn** bỏ qua vòng thế trận không, hay chỉ giảm/đảo lợi thế.

2. **Ba thế trận (突击/攻击/防御)** — lớp **cơ chế chính** người chơi điều khiển từng lượt (mục trên).

3. **Khắc chế binh chủng & thế trận đội hình (阵法)** — lớp **phụ trợ**, sửa đổi sát thương song song với vòng thế trận, không thay thế nó. Binh chủng lõi: bộ binh/kỵ binh/cung binh (步兵/骑兵/弓兵). Thế trận đội hình (锋矢阵/雁形阵/方圆阵/云垂阵) mở rất muộn (~lv210) và gắn theo loại binh. Xem [[systems/troop-types]] và [[systems/formation-system]].
   > [!warning] Vòng khắc chế binh chủng đang `disputed`
   > Các nguồn mâu thuẫn về hướng khắc chế (步克弓/弓克骑/骑克步 so với phiên bản khác) và về việc có tồn tại binh chủng "khí giới/器械" hay không (có thể là nhiễm chéo từ game khác). KHÔNG hard-code vòng này; xử lý ở [[systems/troop-types]].

## Sĩ khí / Nộ khí và Chiến pháp (gating)

Trong khi giao tranh, **thanh Nộ khí (怒气)** của tướng tích dần; khi đủ, tướng tung **Chiến pháp (战法)** — chiêu/tuyệt chiêu riêng của từng tướng. Trên màn hình, lúc tung chiêu sẽ bật **biểu ngữ tên chiêu** (`warSkillName`) kèm hiệu ứng nộ khí (`warFeatAnger`, 6 frame) và, với tướng đã giác tỉnh, một màn splash chân dung lớn (`tacticalGeneralPicMax`).

> [!warning] Mô hình gating là hybrid (`partially-confirmed`)
> Không phải đơn thuần "đầy thanh là tự tung". Tài năng `怒焰` (giết lính → hồi nộ nhanh → tung chiêu liên tục) xác nhận nộ khí là tài nguyên định lượng; nhưng nguồn VN mô tả chiêu nổ **~sau mỗi 3 đòn**, và cooldown giảm khi tướng bị đánh (bị 1 đòn = -1, 2 đòn = -2). Tức là **hệ nộ-khí + hồi chiêu kết hợp**, có yếu tố canh thời điểm thủ công. Toàn bộ chi tiết và con số ở [[systems/tactics-and-rage]].

## Tự động chiến thuật (自动战术)

Có công tắc **tự động chiến thuật / tự động đổi trận** giúp tự chọn thế trận theo điều kiện cài sẵn, **mở ~cấp 59** sau khi phá phụ bản quân đoàn Tào Ngụy (`medium`).

> [!info] Bản 2013 đề cao điều khiển thủ công
> Tính năng auto thuộc bản mobile/về sau và bị chê là làm mất chiều sâu canh thế thời gian thực. Khi dựng lại bản 2013, nên coi auto là tùy chọn phụ; lối chơi gốc là người chơi tự ra lệnh từng lượt.

## Điều kiện thắng/thua

Trận kết thúc khi **một phe bị tiêu diệt hết quân/tướng**. Trong PvE công thành (打天下), thắng khi **thành/đơn vị phòng thủ của địch bị diệt sạch**. Xem [[systems/city-conquest]] cho luồng đánh chiếm bản đồ.

> [!question] Chưa rõ
> Câu chữ chính xác của điều kiện thắng/thua cho PvE công thành so với PvP, và liệu có **giới hạn số lượt / luật hòa** hay không — chưa nguồn nào nêu.

## Giao diện chờ (chuẩn bị trước trận) — đặc tả khách ([[sources/customer-battle-ui-spec-2026-06-27]])

- **Chia 2 phe**: **Phe Công (trái)** / **Phe Thủ (phải)**, bảng "**Võ Tướng Đối Đấu**".
- **Sắp xếp đội hình**: người chơi **tự do đổi thứ tự xuất chiến** trước khi đếm ngược kết thúc; thứ tự đánh số **Một → Ngũ (一–五)**.
- **Mỗi ô tướng**: avatar, **Lv**, **tên tướng** (vd Chúc Dung 祝融, Cam Ninh 甘宁, Chu Du 周瑜, Gia Cát Lượng 诸葛亮…), **lực chiến / binh lực**.
- **Đồng hồ đếm ngược** ở giữa màn trước khi vào trận.

> [!tip] Thứ tự xếp ở màn chờ được **áp dụng nghiêm ngặt** vào thứ tự xuất chiến trong trận → resolver phải đọc đúng hàng đợi này.

## Hình học chiến trường (CỜ ĐỎ cho renderer)

> [!info] Bằng chứng gốc — ảnh gameplay (xungde.somo.vn, xem [[sources/screenshot-somo-battle-2026-06-27]])
> Ảnh chụp trực tiếp một trận **Thế Giới Công Thành** xác nhận: chiến trường là **góc nhìn ISOMETRIC chéo** (KHÔNG phải side-view 2 hàng phẳng). Phe **Công (tấn công)** ở **dưới-trái**, phe **Thủ (phòng thủ)** ở **trên-phải**. Mỗi phe là một **đội hình lưới các tốp lính (squad)** — mỗi tốp có thanh máu riêng (vd 16043/13770/11497) — gồm cả **kỵ binh** (ngựa+thương) và **cung/bộ** (tốp nhỏ tuyến sau). Tướng (hero) là một đơn vị lớn cưỡi ngựa có cờ riêng. Quy ước asset **top/down** = phe trên/dưới trục chéo; **att/def** = vai **Công/Thủ** (xem [[technical/asset-system-mapping]]).

> [!info] Đội hình **5 vị trí (一二三四五)** — xác nhận từ màn 武将对决
> Ảnh màn **Võ Tướng Đối Quyết (武将对决)** cho thấy mỗi phe có **5 vị trí đánh số 一/二/三/四/五 (1–5)**, mỗi vị trí một tướng (hoặc **cặp ghép** như 周瑜●诸葛亮), kèm icon binh chủng + chiến lực + cấp. Đây là **đội hình 5 tướng/phe** đã được khẳng định trực quan — khớp con số "5 tướng/phe" từ nguồn chữ. Mỗi tướng dẫn một tốp lính render thành squad trên chiến trường isometric.

> [!info] HÌNH HỌC ĐÃ CHỐT — theo đặc tả khách hàng ([[sources/customer-battle-ui-spec-2026-06-27]])
> Đặc tả khách (ưu tiên cao) **giải quyết dứt điểm** mô hình hình học chiến trường:
> - **Mỗi phe = hàng đợi tối đa 5 tướng (一–五)**, đánh **LẦN LƯỢT** theo thứ tự đã sắp; tại một thời điểm có **1 tướng/phe** đang giao tranh (HP/sĩ khí/avatar ghim 2 góc trên màn). Tướng đầu hàng đợi đánh, ngã thì tướng kế tiến lên.
> - **Mỗi tướng dẫn TỐI THIỂU 4 hàng quân**; các hàng **không tràn cùng lúc** mà **tiến lên tham chiến tuần tự** (từng hàng một). "4" là **sàn** (五排兵 = trạng thái 5 hàng nâng cao; Đào Viên mở rộng tới 6 hàng → đều khớp).
> - **Mỗi hàng = 3 nhóm** đứng theo **đội hình hàng ngang**.
> - **Mỗi nhóm = N lính** (mặc định **6** → **18 lính/hàng ngang**). **N là BIẾN SỐ** đổi theo nâng cấp/trạng thái lính.
>
> ⇒ Cây cấu trúc render: **Phe → 5 Tướng (hàng đợi) → ≥4 Hàng (tuần tự) → 3 Nhóm/hàng → N lính/nhóm (mặc định 6)**.

> [!info] 📋 Đội hình bày binh PHONG PHÚ + hình dạng hàng tùy biến (chủ dự án xác nhận)
> Đội hình KHÔNG cố định 3–4 kiểu, mà là **hệ data-driven phong phú** (xem [[systems/formation-system]]):
> - **Hình dạng hàng = per-hàng theo TÌNH HUỐNG (đáp án B)**: mặc định hàng ngang; nhưng **hàng ĐẦU khi giáp địch** có thể đổi sang hình tùy biến (vd **cánh cung**), **độc lập** với loại trận pháp tổng thể.
> - **Đội hình gắn theo tướng**: có tướng bày quân kiểu riêng (vd **xếp dọc 2 bên đường**); nhiều kiểu đội hình, **mỗi kiểu đặc điểm gameplay khác nhau**.
> - ⇒ Mỗi tướng có một **`FormationLayout`** (data) định vị trí/hình các nhóm; mỗi `Row` có **`shape`** đổi được theo tình huống (front-engaging → cánh cung). Danh mục đội hình + đặc điểm: liệt kê dần ([[open-questions#q-20260627-13]]).

> [!tip] Khuyến nghị khi dựng lại (mô hình data-driven)
> ```
> General → FormationLayout (data, gắn theo tướng; nhiều kiểu, mỗi kiểu có đặc điểm gameplay)
> Side → Queue<General>[≤5] (tuần tự)
>   General → Rows[≥4] (vào trận tuần tự)
>     Row { shape, groups[3] }      // shape đổi theo TÌNH HUỐNG (front-engaging → CanhCung)
>       Group → unitCount (default 6, BIẾN SỐ theo nâng cấp)
> ```
> - `FormationLayout` = ScriptableObject (vị trí/hình các nhóm + modifiers gameplay). KHÔNG hard-code 3–4 trận.
> - `Row.shape` = đường cong/hàm offset (HangNgang | CanhCung | …), set theo tình huống (đáp án B), không cố định.
> - KHÔNG hard-code `unitCount`. Asset tách **att/def** (Công/Thủ) + **top/down**. Tiếp viện (借兵) → **nối cuối** hàng đợi. Xem [[technical/asset-system-mapping]], [[systems/formation-system]].

## Giao diện lệnh trong trận (quan sát từ ảnh gameplay)

Từ ảnh trận **Thế Giới Công Thành** ([[sources/screenshot-somo-battle-2026-06-27]]) — đây là bộ HUD/lệnh cần dựng cho trận quốc chiến:

- **Hai chân dung tướng đầu màn**: trái = tướng phe **Công** (vd Quan Vũ Lv.160) cờ đỏ; phải = tướng phe **Thủ** (vd Triệu Văn Ảo Anh Lv.172) cờ xanh. Dưới mỗi chân dung có **thanh nộ khí/kỹ năng** (cam) + icon kỹ năng.
- **Bánh xe chọn thế trận (XÁC NHẬN từ ảnh)**: mỗi lượt hiện một **vòng tròn 3 thế trận** + đồng hồ đếm ngược ~**3–4 giây** ("Đang Chọn Chiến Thuật"):
  - **Đột Kích (突击)** — trên, mũi tên lên.
  - **Phòng Thủ (防守)** — dưới-trái, biểu tượng khiên.
  - **Tấn Công (攻击)** — dưới-phải, biểu tượng kiếm.
  - **Trung tâm: "Giác" (觉 / Thức Tỉnh 觉醒)** — nút phát động **giác tỉnh/đại chiêu ngay trong trận** (武神附体). Đây là phát hiện mới: người chơi có thể bấm Giác thay vì/cạnh việc chọn thế trận. Xem [[systems/tactics-and-rage]] và [[systems/general-system]].
  - Hết giờ mà không chọn → **Hủy Auto** quyết định (auto chọn thế).
- **Banner sự kiện trận**: thông điệp diễn biến hiện giữa màn (vd "đội quân này bỏ chạy khỏi thành").
- **Menu lệnh bên phải**:
  - **Soái Kỳ (帅旗)** — cờ soái (có số đếm), buff/đội hình.
  - **Mượn Binh (借兵)** ×N — mượn quân tiếp viện (xem VIP3 ở [[systems/progression-and-vip]]).
  - **Lừa Địch (诱敌)** — kế dụ địch (thuộc hệ 计策/kế sách).
  - **Đột Tiến (突进)** — xông thẳng vào tuyến sau (luật >3x quân, xem [[systems/multiplayer-and-endgame]]).
  - **Rút Lui** — rút khỏi trận.
  - **Chiêu Lệnh (诏令)** — chiếu lệnh (có số đếm).
  - **Hủy Auto (自动战术)** — bật/tắt tự động chiến thuật.
- **Số nổi**: phần thưởng **Bạc (银) +N**, **exp +N**; sát thương hiển thị số đỏ (vd `-7577`).
- **Hàng đợi tướng/quân** bên trái với trạng thái ("Rãnh Rỗi", "Đang Huyết…", "Đang Mở…").

> [!warning] Bộ lệnh trên là của chế độ **quốc chiến/Thế Giới Công Thành**. Trận PvE phó bản hoặc PvP đấu trường có thể có HUD khác — cần thêm ảnh để đối chiếu.

## Cơ chế trong trận (đặc tả khách) — [[sources/customer-battle-ui-spec-2026-06-27]]

- **Thứ tự xuất chiến**: tướng dẫn quân ra trận **đúng thứ tự** đã sắp ở màn chờ (tuần tự).
- **2 tướng đang giao tranh**: HP + sĩ khí + avatar ghim **2 góc trên** (trái=Công, phải=Thủ).
- **Tiếp viện (借兵)**: tướng chi viện vào giữa trận **tự động xếp CUỐI hàng đợi** xuất trận.
- **Cutscene kỹ năng**: khi tung chiến pháp đặc biệt (vd **Xích Diễm Mê Trận 赤焰迷阵** của Chu Du), hiện **phân cảnh cắt ngang** với **chân dung tướng + tên kỹ năng** + hiệu ứng cháy nổ/AoE. Dùng asset `warSkillName` + `tacticalGeneralPicMax` + `skill/*` (xem [[technical/asset-system-mapping]]).
- **Vòng tròn sáng dưới chân** (**xanh / vàng**): phân biệt **phe**, trạng thái **nhận buff (Cổ vũ)**, hoặc **đang chọn chiến thuật**. Khả năng ánh xạ `warState` (bw/cw/fs).

> [!info] Địa hình (môi trường)
> Background (đất trống / trại lính / tháp canh / rào chắn — kho `warBG`) **có thể đổi để đa dạng**, nhưng **tĩnh trong suốt trận**; chỉ đặt được **TRƯỚC khi vào trận**. ⇒ resolver coi địa hình là tham số bất biến của phiên trận.

## Thuộc tính giải đòn của tướng

Tướng có **năm thuộc tính công/thủ** chi phối tính sát thương (`high`, nguồn 傲世堂 chính thức): **普通攻击 / 普通防御 / 战法攻击 / 战法防御 / 计策系统** (công thường / thủ thường / công chiến pháp / thủ chiến pháp / hệ kế sách). Cặp **thường** giải đòn đánh cơ bản theo thế trận; cặp **chiến pháp** giải sát thương của 战法; **计策** (kế sách, ví dụ 诱敌 dụ địch) là lựa chọn chiến thuật riêng tách khỏi 3 thế cơ bản. Chi tiết tướng ở [[entities/generals]].

## Nguồn

- https://download.com.vn/cong-thanh-xung-de-128816
- https://www.9gate.net/giai-tri/trong-nuoc/cong-thanh-xung-de-game-chien-thuat-quen-thuoc-nhung-hap-dan-587.html
- https://gamek.vn/cong-thanh-xung-de.htm
- https://baike.baidu.com/item/%E6%94%BB%E5%9F%8E%E6%8E%A0%E5%9C%B0/8917010
- https://gc.aoshitang.com/news/zixun/322013031413222593632.html
- https://www.9game.cn/gcldol/162284.html
- https://m.f166.com/yxzx06/181936.html

Tổng hợp từ [[sources/ctxd-web-research-2026-06-27]]

## Backlinks

- [[overview]]
- [[systems/tactics-and-rage]]
- [[systems/troop-types]]
- [[systems/formation-system]]
- [[systems/general-system]]
- [[systems/city-conquest]]
- [[technical/asset-system-mapping]]
