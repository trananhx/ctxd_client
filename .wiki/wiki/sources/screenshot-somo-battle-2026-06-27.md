---
title: Ảnh gameplay gốc — Công Thành Xưng Đế (xungde.somo.vn + bản CN)
category: sources
tags: [screenshot, primary-evidence, battle-ui, stance-wheel, duel, somo]
source_path: raw/assets/
source_type: reference
date: 2016-05-18
authors: [user-provided screenshots]
created: 2026-06-27
ingested: 2026-06-27
updated: 2026-06-27
---

# Ảnh gameplay gốc — Công Thành Xưng Đế

## Abstract
Bộ **ảnh chụp trực tiếp trong game** do chủ dự án cung cấp — **bằng chứng gốc** mạnh hơn nghiên cứu web. Gồm: (A) trận **Thế Giới Công Thành** trên `xungde.somo.vn/game/play/136` (nền tảng somo.vn / VinixCorp, VN); (B) ảnh lộ **bánh xe chọn thế trận**; (C) màn **武将对决 / 武斗会 8进4** (giải đấu tướng, bản CN "第3214大区"). Xác nhận dứt khoát đây đúng game `ctxd_client` đang dựng lại và làm rõ nhiều cơ chế trình bày + đội hình.

> [!tip] Nên lưu ảnh vào `\.wiki/raw/assets/` để giữ tư liệu gốc.

## A. Trận Thế Giới Công Thành (somo.vn) — xác nhận
- **Đúng game & nền tảng**: URL `xungde.somo.vn`, logo SOMO, máy chủ "S136-S14…", địa điểm "**Bạch Đế Bắc**", chế độ "**Thế Giới Công Thành Chiến**". → [[claims#c-20260627-03]]
- **Công vs Thủ**: tướng trái = **Quan Vũ (关羽) Lv.160** cờ đỏ **"Công"**; phải = **Triệu Văn Ảo Anh Lv.172** cờ xanh **"Thủ"**. → giải mã `army/att`=Công / `army/def`=Thủ. → [[technical/asset-system-mapping]]
- **Bố cục isometric chéo**: phe Công dưới-trái, phe Thủ trên-phải; mỗi phe là **lưới các tốp lính (squad)** có thanh máu riêng (kỵ binh + cung/bộ). Tướng hero = đơn vị lớn cưỡi ngựa có cờ, có thanh máu riêng (vd `329283`).
- **Menu lệnh phải**: Soái Kỳ (帅旗)×2, Mượn Binh (借兵)×78, Lừa Địch (诱敌), Đột Tiến (突进), Rút Lui, Chiêu Lệnh (诏令), Hủy Auto.
- **Số nổi**: Bạc (银)+2489, exp+34392, sát thương `-7577`.

## B. Bánh xe chọn thế trận — XÁC NHẬN HỆ THẾ TRẬN (quan trọng)
Ảnh lộ rõ **vòng tròn chọn thế trận** ở góc phải-dưới, là phần "Đang Chọn Chiến Thuật" đang đếm giờ:
- **Đột Kích (突击)** — phía **trên**, mũi tên lên.
- **Phòng Thủ (防守/防御)** — phía **dưới-trái**, biểu tượng khiên.
- **Tấn Công (攻击)** — phía **dưới-phải**, biểu tượng kiếm.
- **Trung tâm: "Giác" (觉 / Thức Tỉnh 觉醒)** — nút phát động giác tỉnh/đại chiêu **ngay trong trận**.
- **Đồng hồ đếm ngược ~3–4 giây** ("4s", "3s") để ra lệnh; kèm nút **Hủy Auto** và **Giác/Thức Tỉnh**.
→ Xác nhận trực quan tam giác 3 thế trận **Đột Kích/Tấn Công/Phòng Thủ** + cơ chế **Giác (觉醒) trong trận**. → [[systems/battle-system]], [[systems/tactics-and-rage]]
- **Banner sự kiện trận**: dòng "Quân địch … đội quân này bỏ chạy khỏi thành" — thông điệp diễn biến trận.

## C. 武将对决 / 武斗会 (Võ Tướng Đối Quyết / Võ Đấu Hội) — đội hình & binh chủng
Màn so kè hai đội hình tướng (giải đấu **8进4**, kiểu trận "**平原战**" — đánh đồng bằng), bản CN "第3214大区":
- **Đội hình 5 vị trí**: đánh số **一 / 二 / 三 / 四 / 五** (1–5), mỗi vị trí một tướng (hoặc **cặp ghép**). → xác nhận **5 slot tướng/phe**. → [[contradictions#x-20260627-06]]
- **Cặp tướng ghép**: vị trí 1 là **周瑜●诸葛亮 (Chu Du ● Gia Cát Lượng)** — bằng chứng **tướng liên hợp/ghép đôi**. → [[entities/generals]]
- **Icon binh chủng từng tướng** (bằng chứng trực quan, vốn là điểm "unverifiable"):
  - 周瑜/诸葛亮 = biểu tượng **gậy/quạt** → **mưu sĩ (谋士)**
  - 黄月英 (Hoàng Nguyệt Anh) = biểu tượng **pháo/xe** → **chiến xa (战车)** / công thành
  - 马超 (Mã Siêu) = biểu tượng **ngựa** → **kỵ binh (骑兵)**
  - 周泰 (Chu Thái) = biểu tượng **thương** → **thương binh (枪兵)**
  - 黄忠 (Hoàng Trung) = biểu tượng **cung** → **cung binh (弓兵)**
  - → Có **≥5 loại icon** (gậy/pháo/ngựa/thương/cung) → game thật (cấp cao, bản về sau/somo) có thể có **>4 binh chủng** gồm mưu sĩ + chiến xa, không chỉ 4 như Baidu ghi cho bản 2013. → [[contradictions#x-20260627-01]], [[systems/troop-types]]
- **Chiến lực (战力) & cấp**: mỗi tướng hiện công lực (~1.3–1.8 triệu) và cấp (Lv182–225) — tướng cuối game.
- **击鼓支持 (đánh trống cổ vũ)**: khán giả "đánh trống" ủng hộ phe Công/phe Thủ, có **số người ủng hộ** (25 / 259). → cơ chế khán chiến PvP. → [[systems/multiplayer-and-endgame]]

## Pages updated from this source
- [[systems/battle-system]] (bánh xe thế trận, 5 vị trí, banner sự kiện)
- [[systems/troop-types]] (icon binh chủng thực tế ≥5 loại)
- [[entities/generals]] (icon binh chủng từng tướng, cặp ghép)
- [[systems/multiplayer-and-endgame]] (武斗会/武将对决 + đánh trống cổ vũ)
- [[technical/asset-system-mapping]] (att/def = Công/Thủ, isometric)
- [[claims]] (c-19, c-20, c-21), [[contradictions]] (x-01, x-06)

## Notes
- Ảnh A/B là bản **somo.vn (VN)**; ảnh C là bản **CN (第3214大区)** — cùng game 攻城掠地, dùng để đối chiếu chéo VN↔CN.
- Đây là các loại trận PvP/quốc chiến cấp cao; trận PvE phó bản đầu game có thể đơn giản hơn. Cần thêm ảnh đầu game để đối chiếu đội hình cơ bản.
