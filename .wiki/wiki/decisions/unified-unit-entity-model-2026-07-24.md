---
title: Chốt mô hình đơn vị hợp nhất (Tướng+Lính = 1 đối tượng)
category: decisions
tags: [unit-entity, model, tactics, talent, canonical]
sources: [raw/assets/]
created: 2026-07-24
updated: 2026-07-24
---

# Chốt mô hình đơn vị hợp nhất (Tướng + Lính = 1 đối tượng)

**Date**: 2026-07-24
**Decided by**: chủ dự án (directive) + Claude
**Status**: active

## Context
Cây wiki cũ ngầm mô tả quan hệ **"tướng DẪN lính"** theo 2 lớp tách biệt (tướng là 1 thực thể, lính là 1 pool/đội hình do tướng chỉ huy). Chủ dự án **chốt directive**: tướng + lính là **MỘT đối tượng duy nhất** — không phải 2 thực thể lồng nhau. Cần hợp nhất mô hình này cho cả **renderer/sim** (dựng hình + mô phỏng trận) lẫn **data** (đầu vào `scenario.json`, `TacticDto.Program` — luật rule-engine của chiến pháp).

4 ảnh màn **"Tướng lĩnh"** (bản mobile 攻城掠地) xác nhận: mỗi đơn vị là **một gói khép kín** gồm binh-chủng (có cấp/bậc sao), chiến-pháp, thiên-phú, và binh-lực — tất cả gắn trực tiếp lên cùng một đơn vị, không tách "tướng" khỏi "đám lính".

> [!warning] Phạm vi phiên bản (FIX-3)
> Bằng chứng đến từ ảnh **bản MOBILE 攻城掠地**; target dựng lại là **somo webgame**. Binh-chủng-có-cấp + 3 tên Hán tự là **bằng chứng mobile, chờ chủ dự án chốt** có áp cho somo hay không. Xem [[decisions/game-version-scope]] và [[contradictions]]. KHÔNG đè claim "4 binh chủng 2013".

## Options considered
1. **Tách 2 entity (tướng ↔ lính)** — giữ nguyên wording cũ "tướng dẫn lính".
   - Con: nhân đôi state (2 lớp đời sống, 2 nơi giữ HP/stat), **lệch directive** của chủ dự án; mơ hồ khi tướng "chỉ là 1 con" (không có lính) vs "vài hàng lính".
2. **HỢP NHẤT thành 1 `UnitEntity`** (tướng + lính = một đối tượng).
   - Pro: **khớp directive**; khớp sim đã chốt (**tướng chết khi DẠNG của nó chết hết** — dạng "1 con tướng" hết máu, hoặc "vài hàng quân" chết hết hàng — xem [[decisions/battle-geometry-server-model-2026-06-30]]); **phó tướng = 1 hàng** của tướng chủ (ánh xạ tự nhiên vào cùng một đối tượng).
   - Con: phải **sửa wording** ở nhiều trang wiki đang mô tả 2 lớp.
3. **Hợp nhất data, tách view** (data 1 đối tượng nhưng renderer vẫn dựng 2 lớp).
   - Con: **mơ hồ** — ranh giới data/view không rõ, dễ tái sinh mô hình 2 lớp ở tầng render.

## Decision
**Chọn (2) — hợp nhất thành một `UnitEntity`.** Tướng + lính là **một đối tượng**; "tướng" không phải figure riêng mà là chính (các) dạng của đơn vị.

- **Chiến pháp** có `castMode` = **{N-lần | điều kiện}** (thi triển đúng N lần, hoặc kích theo điều kiện) — dữ liệu-hoá qua `TacticDto.Program` (rule-engine, xem [[systems/tactics-and-rage]]).
- **Multi-row** (chiến pháp nhiều hàng, vd "4 hàng"/"5 hàng") và **thiên phú** = **effect/buff** áp lên đơn vị — đây là **DESIGN INTENT** đã chốt.
- **Binh chủng có cấp** (hậu tố LV4/lv4/cấp4 nhiều khả năng là **bậc sao binh chủng 4★**, TÁCH khỏi cấp tướng Lv.220 — suy luận).

> [!info] Thiên phú (design intent) vs chữ in-game (FIX-1)
> Ý đồ chủ dự án: **thiên phú = buff (sát thương) cho lính** của đơn vị. Chữ in-game ghi **"+Lực chiến (战力)"** — là **CHỈ SỐ TỔNG HỢP, KHÔNG dịch thành "sát thương"**. Chênh giữa design intent và chữ in-game → xem open-question 战力 ở [[systems/equipment-and-gear]].

> [!question] Thống (统) / Dũng (勇) — chưa chốt ánh xạ (FIX-2)
> Panel hiện **统(Thống) / 勇(Dũng)**; ánh xạ sang code (NormalAtk/TacticAtk) là **SUY DIỄN, chưa chốt**. Tồn tại **mâu thuẫn 3 chiều** (general-system: 武力=damage & 统/勇=thủ; claims c-20260627-08: 统/勇=atk+def; model mới: Thống/Dũng=atk). Xem [[contradictions]] + [[systems/general-system]]. Lưu ý "UNIT B Dũng 62 → không chiến pháp" chỉ là **TƯƠNG QUAN**, không phải bằng chứng nhân-quả.

Chi tiết mô hình dữ liệu (schema `UnitEntity`, castMode, effect/buff, dạng/thứ-tự hàng) ở [[systems/unit-entity-model]].

## Consequences
- **Reframe wording** (từ "tướng dẫn lính" → "một đơn vị") ở: [[systems/general-system]], [[systems/troop-types]], [[systems/tactics-and-rage]], [[entities/generals]].
- **Resolve** open-question "quan hệ tướng–lính" (nay là một đối tượng, không còn 2 lớp).
- **Khớp** [[decisions/battle-geometry-server-model-2026-06-30]] (tướng chết khi dạng chết hết; phó tướng = 1 hàng).
- **Đầu vào cho `scenario.json`** — mỗi đơn vị khai báo binh-chủng+cấp, chiến-pháp (`TacticDto.Program` + castMode), thiên-phú (effect/buff), binh-lực.
- Áp **FIX-3**: đây là **mobile-evidence**; phạm vi áp dụng cho somo **chờ chủ dự án chốt** — link [[decisions/game-version-scope]].

> [!question] Code gap (FIX-4)
> Phân biệt rõ (1) **DESIGN INTENT đã chốt** (đơn vị hợp nhất; multi-row & thiên phú = effect/buff) vs (2) **ĐỀ XUẤT data-model + CODE GAP** chưa có trong code (ví dụ `ActiveBuff`/`TalentDefinition`/`OffenseOnly`/`Terrain.Castle`/charge-counter). Các đề xuất này là **code gap, KHÔNG phải canon**.

## Backlinks
- [[systems/unit-entity-model]] — chi tiết schema đơn vị hợp nhất
- [[GDD]] — tài liệu thiết kế tổng
- [[sources/ingame-general-panel-2026-07-24]] — nguồn ảnh màn "Tướng lĩnh" (mobile)
