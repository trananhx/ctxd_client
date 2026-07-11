---
title: Mô hình hình học trận server-authoritative (Tướng→Hàng→Nhóm)
category: decisions
tags: [battle, geometry, server, formation, row, group, troop-type]
sources: [raw/feedback/customer-battle-ui-spec.md]
created: 2026-06-30
updated: 2026-06-30
---

# Mô hình hình học trận — server-authoritative (Tướng → Hàng → Nhóm)

**Date**: 2026-06-30
**Decided by**: chủ dự án (phân tích ảnh somo gốc) + Claude
**Status**: active

## Context
Bản 2026-06-30 mô hình quân là **1 pool HP đơn** (`Combatant.Troops`) + render lưới lính phẳng 4×5 → SAI so với cơ chế thật. Chủ dự án phân tích ảnh gốc ([[sources/screenshot-somo-battle-2026-06-27]], [[sources/customer-battle-ui-spec-2026-06-27]]): 1 tướng dẫn **nhiều HÀNG nhóm quân**, mỗi hàng nhiều **CỘT nhóm quân**, mỗi **nhóm** = a×b lính của một **binh chủng**; đánh nhau **ăn hàng-nhóm đầu**, hết hàng → hàng sau **tiến lên**; các hàng hiển thị **rời nhau**. (Khớp cây wiki [[systems/battle-system]] §Hình học: Phe→≤5 Tướng→≥4 Hàng→3 Nhóm→N lính.)

## Options considered
1. **Server mô hình đầy đủ (Tướng→Hàng→Nhóm)** — số liệu hàng/nhóm sống ở server; client render từ snapshot. ✅ trung thành, server-authoritative.
2. Lai: server tới HÀNG (mỗi hàng 1 túi HP), nhóm/lính chỉ visual.
3. Server giữ tổng HP, hàng/nhóm chỉ là chia visual ở client.

## Decision
**Chọn (1) — server mô hình đầy đủ.** Binh chủng gắn **per-NHÓM** (1 tướng có thể trộn loại, vd kỵ hàng đầu / cung hàng sau; scenario khai báo từng nhóm). Combat **ăn HÀNG ĐẦU còn sống** rồi tiến hàng. Client render thuần từ `CombatantSnapshot.Rows`.

**Phase 1 (làm ngay):** mô hình sim + đánh-theo-hàng + snapshot + visual hàng-nhóm rời theo binh chủng. Mặc định 4 hàng × 3 nhóm × 6 sprite (2×3), tổng quân chia đều cho các nhóm.

**Phase 2 (sau LuzartUI P4):** Viện binh (Mượn Binh 借兵) = thêm **tướng mạnh nhất** vào cuối hàng đợi; màn **chọn/sắp xếp tướng trước trận**; **Phó tướng** — xác nhận chủ dự án 2026-06-30:
> Phó tướng **biểu hiện BẰNG MỘT HÀNG** của tướng chủ (chiếm 1 hàng — có thể hàng đầu), đánh bằng **stat phó tướng** (sát thương như tướng thường), **máu = tổng/số-hàng** (1 hàng). Phó tướng **KHÔNG** render thành "1 con tướng" đứng riêng. ⇒ **Một tướng chỉ ở dạng "1 con tướng" (không có các hàng) thì KHÔNG thể là phó tướng** (không có hàng để nhập vào). Mô hình: `Combatant.deputy` (1 general) ánh xạ vào 1 `Row` của tướng chủ với stat riêng.

## Data model (shared `Battle/Sim`)
```
Combatant { …, List<Row> Formation; int Troops(=Σ soldiers, cache) }
Row       { RowShape Shape; List<Group> Groups }
Group     { TroopType Troop; int MaxSoldiers, Soldiers; int SpriteCols, SpriteRows }
RowShape  { HangNgang, CanhCung }
```
- Combat: `CombatOps.ApplyDamageToFront(target, amount, round, events)` rải sát thương vào **hàng đầu còn sống** → nhóm hết lính = chết (`GroupKilled`), hết cả hàng = bỏ + tiến hàng (`RowAdvanced`). `Troops` cache = Σ soldiers; tướng chết khi Σ=0.
- Snapshot: `CombatantSnapshot.Rows → RowSnapshot{Shape,Groups} → GroupSnapshot{Troop,MaxSoldiers,Soldiers,SpriteCols,SpriteRows}`.
- Server data: `scenario.json` mỗi tướng có `Formation` (mảng hàng × nhóm binh-chủng) hoặc mặc định `Rows`×3 cùng binh chủng tướng. Tổng quân chia đều.

## Visual (client, render từ snapshot — luật prefab giữ nguyên)
`BattleSideField.Build(CombatantSnapshot, faction, db)`: mỗi **hàng** giãn theo trục iso (rời nhau), mỗi **nhóm** = cụm SpriteCols×SpriteRows prefab theo `group.Troop → TroopTypeDefinition.unitVisual → prefab` ([[prefab-spawn-rule]]/P3). Hàng đầu giáp địch; hàng chết tan + hàng sau trượt lên; sprite/nhóm co theo % lính. Tách khỏi P2.2: presenter cũ build snapshot từ runner để verify; khi P2.2 xong dùng chung Build với snapshot server.

## Consequences
- `Combatant` đổi từ pool đơn → có `Formation`; `CombatOps.ApplyDamageRaw` route qua formation (mọi caller — basic/tactic — tự thành đánh-theo-hàng). TEST API `KillRow` = bỏ nguyên hàng đầu (đúng nghĩa).
- Snapshot nặng hơn (rows/groups) nhưng vẫn nhỏ (≤ ~15 nhóm/tướng).
- Mở đường cho phó tướng (lấy 1 `Row`) + trận pháp đổi `Row.Shape` ([[systems/formation-system]]) sau này.

## Correction 2026-07-10 — hướng chéo & "giết từng cụm HÀNG một"
Chủ dự án đối chiếu ảnh gốc somo (ảnh 1) với bản dựng (`Assets/Screenshots/final_battle.png`, ảnh 2) và chỉ ra bản dựng **SAI 2 điểm**:

1. **Hướng chéo đội hình bị NGƯỢC.** Chiến trường iso: Công (dưới-trái) ↔ Thủ (trên-phải) giáp mặt theo đường chéo **"/"**. Vậy **1 hàng ngang** (3 nhóm đứng cạnh nhau) phải **vuông góc trục giáp mặt** = trải theo đường chéo **"\\"**; các **hàng lùi** dần theo **"/"** ra xa địch. Bản cũ để hàng theo "/" (song song trục giáp mặt) + lùi gần-thẳng-đứng ⇒ nhìn "ngược". **Sửa** (`BattleSideField.cs`): `groupAxis=(0.80,−0.40)` ("\\"), `rowAxis` offense `(−0.62,−0.34)` / defense `(0.62,0.34)` ("/"), `spriteCol=(0.16,−0.08)`.

2. **Đánh phải "giết từng cụm HÀNG một", không giết lẻ từng nhóm.** GDD/[[systems/battle-system]] mô tả **递进击杀 / 递进式掩杀** (đánh dồn từng hàng). Bản cũ `ApplyDamageToFront` dồn sát thương vào **nhóm đầu cho tới chết** rồi mới sang nhóm sau ⇒ thấy **từng cụm** biến mất lẻ tẻ. **Sửa** (`CombatOps.cs`, dùng CHUNG client+server): rải sát thương **ĐỀU theo tỉ lệ máu** trên **cả hàng đầu** ⇒ 3 nhóm hao cùng nhau, **tan nguyên hàng một lượt**, rồi tràn dư sang hàng sau. `KillRow` (bỏ đúng `front.Soldiers`) vẫn xoá đúng 1 hàng — bất biến selftest giữ nguyên.

3. **MÔ HÌNH "DẠNG TƯỚNG" + hàng sống VẪN TIẾN LÊN (phản hồi vòng 2–3).** Sai lầm gốc: coi **"con tướng" là 1 figure TO riêng** luôn thêm vào cạnh các hàng lính. Đúng ra — chủ dự án nêu rõ — **1 tướng được "thể hiện" (dạng) linh hoạt**: *vài hàng quân*, HOẶC *chỉ 1 con tướng* (không hàng), HOẶC *kết hợp*, xếp tùy ý; **phó tướng = hàng thứ "x" của tướng khác**. **Tướng CHẾT khi DẠNG của nó chết hết** (dạng "1 con tướng" → figure hết máu; dạng "vài hàng quân" → **tất cả các hàng** chết). Ngoài ra: **các hàng còn sống VẪN TIẾN LÊN cho tới hết** (nén về trước) — KHÔNG để lại khoảng trống.
   **Sửa** (`BattleSideField.cs`): (a) **BỎ figure tướng to riêng**; dạng "vài hàng quân" ⇒ render **thuần các hàng lính** (tướng chính là các hàng; hết hàng = tướng chết). (b) **Nén hàng sống về trước** (`rowSlot` đếm hàng còn lính) ⇒ hàng đầu (sát địch) chết trước, các hàng sau **tiến lên** chiếm chỗ — "递进" đúng nghĩa. (c) Nhánh dạng **"1 con tướng"** (khi `livingRows==0`, tức không có hàng nào): render **1 đơn vị tướng lớn** — chưa dùng vì scenario hiện toàn dạng "vài hàng quân", nhưng để sẵn cho data-driven sau. ⇒ [[systems/formation-system]] cần `FormationLayout` khai báo dạng/thứ tự hàng + figure per-tướng.

**Verify**: `dotnet run --project Server -- selftest` OK; Play headless server-driven — không còn figure tướng to (units/phe giảm khi bỏ hero), diagonal "\\", KillRow ATT liên tiếp: `r0` 4011→0 rồi `r1`→0, các hàng sống **nén tiến lên** về phía địch (`form_v3_00.png`, `form_v3_01_advance.png`, `form_v3_02_advance.png`). (Ảnh cũ `herofix_*` là bước trung gian SAI — đã bỏ figure + phục hồi tiến hàng.)

> [!warning] Bài học: `final_battle.png` (2026-06-30) từng được ghi là "rất sát ảnh gốc" nhưng **hướng chéo bị ngược** — đối chiếu ảnh gốc kỹ hơn khi khớp hình học.

## Backlinks
- [[systems/battle-system]] — hình học gốc
- [[technical/ctxd-server-client-plan]] — kế hoạch tổng
