---
title: Ảnh màn Tướng lĩnh in-game (general panel) 2026-07-24
category: sources
source_path: raw/assets/
tags: [screenshot, primary-evidence, general-panel, troop-types, tactics, terrain-talent, mobile]
created: 2026-07-24
updated: 2026-07-24
---

# Ảnh màn Tướng lĩnh in-game (general panel) 2026-07-24

> [!tip] Lưu file gốc
> 4 file PNG của màn "Tướng lĩnh" hiện **chỉ tồn tại trong hội thoại** — chúng chưa nằm trong vault. **Bước thủ công cho chủ dự án**: copy 4 PNG vào `\.wiki/raw/assets/` để giữ tư liệu gốc (nguồn primary mạnh hơn nghiên cứu web). Sau khi lưu, cập nhật `source_path` nếu đổi tên file.

## Abstract
Bộ **4 ảnh chụp trực tiếp** màn **"Tướng lĩnh"** (general panel) của bản **MOBILE 攻城掠地**. 4 ảnh hiển thị **đúng 3 đơn vị** riêng biệt (A/B/C). Mỗi đơn vị = **1 binh chủng CÓ CẤP** + **(0–1) chiến pháp** + **icon chiến thuật** + **thiên phú Lực chiến (战力)** theo địa hình + **binh lực/timer mộ binh** dùng chung Mộ Binh Lệnh. Đây là **bằng chứng gốc** cho model "**tướng + lính = 1 đối tượng**" → [[systems/unit-entity-model]], [[decisions/unified-unit-entity-model-2026-07-24]].

## Bảng 3 đơn vị (🎨 đọc trực tiếp từ ảnh)

| Đơn vị | Binh chủng (+cấp) | Chiến pháp (+số hàng) | Chiến thuật (icon) | Thiên phú (giữ chữ **Lực chiến 战力**) | Gear ⚔Công / 🛡Thủ / 👤带兵量 | Thống / Dũng | Binh lực |
|---|---|---|---|---|---|---|---|
| **A** — nữ áo tím, tướng Lv.220 | Công Thành Xa **LV4** | Công thành chiếm đất (**4 hàng**) | [▲ xanh] [❌ đỏ] | Thành trì **Lực chiến (战力) +60%** (Chỉ phe công) | +32535 / +16516 / +63492 | 171 / 170 | 0 / 952380 (cạn, timer 04:22, nút Tăng tốc mộ binh) |
| **B** — nam giáp vàng râu, Lv.201 | Nhục Bác Tứ Sĩ **lv4** | **TRỐNG** (không có) | [▲×2] [tím×2] [❌×2] | Bình nguyên、Sơn địa、Thủy vực **Lực chiến (战力) +20%** (mọi địa hình) | +35034 / +18057 / +61140 | 159 / **62** (rất thấp) | ~7537 / 917100 (timer 05:02) |
| **C** — nam tóc trắng cầm thương, Lv.204 | H.kim chiến kỳ **cấp 4** | Sư/Thiết Kỵ Vô Song (**5 hàng**) | [▲×1] | Bình nguyên **Lực chiến (战力) +25%** | +31692 / +16645 / +56470 | 169 / 169 | ~647050 / 647050 (đầy) |

**UI chung (🎨):** tabs Tướng lĩnh / Quán rượu / Yến hội / Trận pháp / Tàng Thư Các; nút Phó (副) / Đổi nhanh; cặp nút **Mộ binh** vs **Tăng tốc mộ binh**; **Mộ Binh Lệnh dùng chung = 126987** cho cả 3 đơn vị.

> [!warning] FIX-1 — "Lực chiến (战力)" KHÔNG phải "sát thương"
> Thiên phú in-game buff **"Lực chiến (战力)"** là **chỉ số tổng hợp**, giữ nguyên chữ Hán 战力 — **không dịch thành "sát thương"**. Ý đồ chủ dự án ("thiên phú = buff sát thương cho lính") là **DESIGN INTENT**, chênh với chữ in-game (+Lực chiến 战力). Xem open-question 战力 tại [[systems/equipment-and-gear]].

## Suy luận & độ tin (áp IDENT)

- **A — "Công Thành Xa"** = ⚠️ 攻城车 (siege chariot) → họ 攻城/战车 (code `ChienXa`). Tướng khả dĩ ⚠️ 黄月英 (Hoàng Nguyệt Anh, *medium*). Chiến pháp **"Công thành chiếm đất"** = 攻城掠地 (trùng tên game, *high*). Thiên phú công thành **chỉ-phe-công** rất hợp binh chủng công thành.
- **B — "Nhục Bác Tứ Sĩ"** = ⚠️ 肉搏死士 (cảm tử cận chiến) → bộ binh/枪兵 tuyến đầu (code `ThuongBinh`, *medium* — không phải tên canon). Tướng khả dĩ ⚠️ 周泰 (Chu Thái, *medium* — khớp "không có 战法" + "buff mọi địa hình"). Chiến pháp: **KHÔNG CÓ**.
- **C — "H.kim chiến kỳ"** = ⚠️ 黄金战骑 (kỵ binh giáp vàng) → 骑兵 (code `KyBinh`, *high*). Tướng khả dĩ ⚠️ 马超 (Mã Siêu) hoặc 赵云 (Triệu Vân) (*low-medium*). Chiến pháp "Sư/Thiết Kỵ Vô Song" ❓ có thể 铁骑无双 (**chưa chắc**; wiki treo 马超 铁骑无敌).

> [!warning] FIX-3 — version scope (bản mobile, chờ chốt)
> 4 ảnh là bản **MOBILE 攻城掠地**; target dựng lại = **somo webgame**. **Binh-chủng-có-cấp** + **3 tên Hán tự** là **"bằng chứng mobile, chờ chủ dự án chốt"** → [[decisions/game-version-scope]], [[contradictions]]. **KHÔNG đè** claim "4 binh chủng 2013" (c-20260627-09). Tên chiến pháp UNIT C (铁骑无双) để ❓.
> Hậu tố **LV4 / lv4 / cấp4** nhiều khả năng là **bậc sao binh chủng (兵种星级 4★)** — **TÁCH** khỏi cấp tướng (Lv.220…) — ghi là **suy luận**.

> [!question] FIX-2 — Thống / Dũng chưa chốt ánh xạ
> Panel hiện 统(Thống) / 勇(Dũng); ánh xạ sang code NormalAtk/TacticAtk là **SUY DIỄN, chưa chốt**. Tồn tại **mâu thuẫn 3 chiều**: (general-system: 武力=damage & 统/勇=thủ) vs (claims c-20260627-08: 统/勇=atk+def) vs (model mới: Thống/Dũng=atk). Xem [[contradictions]].
> "**UNIT B Dũng 62 → không chiến pháp**" chỉ là **TƯƠNG QUAN**, **không phải** bằng chứng nhân-quả.

> [!question] FIX-4 — tách tầng: proposal = code gap
> Phân biệt (1) **DESIGN INTENT đã chốt** vs (2) **ĐỀ XUẤT data-model + CODE GAP** (chưa có trong code). Các proposal `ActiveBuff` / `TalentDefinition` / `OffenseOnly` / `Terrain.Castle` / charge-counter là **code gap — KHÔNG phải canon**.

## Key claims
- [[claims#c-20260724-01]] — mỗi đơn vị = 1 binh chủng CÓ CẤP + (0–1) chiến pháp + thiên phú + binh lực (bằng chứng model unit-entity hợp nhất).
- [[claims#c-20260724-02]] — chiến pháp có **số hàng** đi kèm (A=4 hàng, C=5 hàng); một số đơn vị **không có** chiến pháp (B).
- [[claims#c-20260724-03]] — thiên phú buff **Lực chiến (战力)** theo **địa hình** (thành trì / bình nguyên / sơn địa / thủy vực), có điều kiện "chỉ phe công" (A).
- [[claims#c-20260724-04]] — binh lực tiêu hao + **timer mộ binh**, dùng chung tài nguyên **Mộ Binh Lệnh** (126987) giữa các đơn vị.
- [[claims#c-20260724-05]] — hậu tố cấp binh chủng (LV4) tách khỏi cấp tướng (Lv.220) — suy luận bậc sao 4★.

## Câu hỏi
- [[open-questions#q-20260724-01]] — ý nghĩa **icon chiến thuật** ([▲ xanh]/[❌ đỏ]/[tím]) và cách đọc số lượng của chúng.
- [[open-questions#q-20260724-02]] — **cấp binh chủng** (LV4) là bậc sao 4★ hay hệ cấp khác, và trần cấp là bao nhiêu.

## Trang cập nhật từ nguồn này
- [[GDD]]
- [[systems/unit-entity-model]]
- [[systems/troop-types]]
- [[systems/tactics-and-rage]]
- [[systems/general-system]]
- [[entities/generals]]

## Notes
- 4 ảnh = **đúng 3 đơn vị** (một số đơn vị xuất hiện ở nhiều ảnh khi cuộn/đổi tab). Số liệu trong bảng lấy ở **SCREEN** (đọc trực tiếp), không nội suy.
- Mọi tên Hán tự (攻城车 / 肉搏死士 / 黄金战骑 / 铁骑无双) đánh ⚠️ vì là **suy diễn định danh**, chưa xác nhận với chủ dự án.

---

## Backlinks
- [[systems/unit-entity-model]] — nguồn primary cho model tướng+lính hợp nhất
- [[decisions/unified-unit-entity-model-2026-07-24]] — quyết định dựa trên nguồn này
- [[GDD]] — tài liệu thiết kế tổng
