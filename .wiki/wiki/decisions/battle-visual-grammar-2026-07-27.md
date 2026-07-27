---
title: Ngữ pháp hình ảnh trận đấu — thanh máu per-nhóm, FX prefab-hoá, tách skill/buff
category: decisions
tags: [battle, visual, fx, health-bar, asset-pipeline]
sources: [Assets/Ctxd/Battle/BattleSideField.cs, Assets/Ctxd/Battle/ServerBattleDirector.cs, Assets/Ctxd/Editor/AssetForge.cs]
created: 2026-07-27
updated: 2026-07-27
---

# Ngữ pháp hình ảnh trận đấu (2026-07-27)

**Date**: 2026-07-27
**Decided by**: chủ dự án
**Status**: active

## Context

Ba khiếm khuyết ở tầng trình diễn được chủ dự án chỉ ra:

1. Thanh máu chỉ hiện khi **click** (`BattleFieldSelection`), một thanh duy nhất, luôn **màu đỏ** cho cả hai phe.
2. Chỉ **3/33** chuỗi FX trong `Assets/Resources/sprite` được bake thành prefab + AnimationClip; phần còn lại (FX chiêu thức, vầng sáng đội hình, mũi tên…) chưa dùng được.
3. Mọi chiến pháp — kể cả `Buff`/`Heal` — đều vẽ FX ở **phe địch**, tức buff hiển thị sai chỗ.

## Decision

### 1. Thanh máu thuộc về NHÓM, tự hiện, màu theo phe

`RowHealthBar` (per-hàng, click-driven) → `HealthBar` (per-nhóm, snapshot-driven). Mỗi `Cell` trong
[BattleSideField](../../../Assets/Ctxd/Battle/BattleSideField.cs) sở hữu một thanh, con của group anchor nên tự
bám khi hàng tiến lên. Thanh **chỉ hiện khi `0 < soldiers < maxSoldiers`** — nhóm đầy quân hoặc đã tan thì sạch màn.

Màu suy từ art gốc, không phải quy ước tự đặt: sprite `army/att/**` là **giáp xanh**, `army/def/**` là **giáp đỏ**
→ Công = thanh xanh, Thủ = thanh đỏ. Hai màu là field Inspector trên `ServerBattleDirector`.

`BattleFieldSelection`, `GroupClickTarget` và `BoxCollider2D` per-nhóm bị **xoá** (chủ dự án chọn bỏ hẳn cơ chế click).

### 2. Mọi FX là prefab + AnimationClip riêng, gương cây sprite

`AssetForge` không còn dùng bảng 3 effect hard-code mà **quét toàn bộ** `Assets/Resources/sprite`, sinh ra
`Assets/Ctxd/Generated/FX/<đường-dẫn-nguồn>.{prefab,anim,controller,asset}` — đường dẫn prefab khớp 1-1 đường dẫn
sprite gốc. **Id FX = đường dẫn tương đối** (vd `eff/formation/att/down/1`, `skill/att/skill_07`, `warBuff/12`),
dùng luôn làm khoá tra trong `CtxdGameDatabase`.

Quy tắc phân loại **theo từng thư mục**: sprite tên là **số trần** (`1.png, 2.png…`) gộp thành **một chuỗi
animation**; sprite còn lại thành **prefab tĩnh** riêng. Xử lý được cả hai trong cùng thư mục là bắt buộc — vài FX
trích từ APK có kèm `tip.png` nằm cạnh các frame, quy tắc "tất-cả-hoặc-không" sẽ hạ cả chuỗi thành ảnh rời.

Loại trừ `NonFxRoots` = `army` (đã bake riêng thành unit), `tacticalGeneralPicMax` (chân dung tướng), `warBG`,
`windowBG` — đây là ảnh UI, không phải FX; bake chúng sinh ra hàng trăm prefab chết.

Kết quả: **303 prefab FX** (35 animation + 268 tĩnh), 0 SO thiếu prefab.

> [!bug] Rò GameObject tạm vào scene đang mở
> Forge tạo `new GameObject(...)` (rơi vào scene đang mở) rồi mới `SaveAsPrefabAsset` + `DestroyImmediate`. Một
> lần bake hỏng giữa chừng để lại `fx_warBG_1` — ảnh nền full màn ở **sorting order 600** — nằm lại trong
> `BattleServer.unity` và **che toàn bộ quân**. Đã dọn object và bọc `try/finally` quanh mọi chỗ bake
> (unit / FX chuỗi / FX tĩnh / floating text) để temp luôn bị huỷ kể cả khi lỗi.

### 3. Hai ngữ pháp hình ảnh tách bạch: đòn đánh vs buff

`ServerBattleDirector.SpawnSkillEffect` rẽ theo `BattleEvent.Effect`:

| Nhóm effect | Nơi hiển thị | Lớp |
|---|---|---|
| `Damage / AoeDamage / Confusion / InstantTo1Hp / Pushback` | tâm phe **BỊ ĐÁNH** | 600 (trên lính) |
| `Buff / Heal` | **dưới chân** quân phe **CAST** | 100 (dưới lính) |

Bản màu `att`/`def` của FX luôn theo **người cast** (hiệu ứng là của họ), dù vị trí vẽ ở phe kia.
FX chiêu thức tra theo `skill/{f}/<TacticId>` trước, không có thì rơi về `skillFxFormat` mặc định.

**Thế trận** dùng chung ngữ pháp buff: bấm nút → vẽ vầng sáng dưới chân **ngay lập tức** (không đợi server
round-trip), mỗi thế một FX riêng cấu hình được. Cờ `_stancePreviewShown` nuốt bản echo `StanceChosen` của server
để không vẽ hai lần; reset ở `RoundBegin`.

Vầng sáng mặc định vẽ **mỗi HÀNG một cái**, không phải mỗi nhóm: art `eff/formation/**` vẽ theo bề ngang cả hàng
(ba hình liên kết ứng với ba nhóm), spawn per-nhóm sẽ chồng ba lớp thừa. Có cờ `underFootPerGroup` để đổi.

Toàn bộ ánh xạ FX là **chuỗi format có `{f}`** (thay bằng `att`/`def`) trên Inspector — đổi FX không cần sửa code.

## Consequences

- Cần chạy `CTXD ▸ Forge ▸ Bake All Prefabs` rồi `CTXD ▸ Sample ▸ Rebuild Database` sau khi thêm sprite mới.
- Lần bake đầu tiên có thể để lại vài SO chưa gán prefab do AssetDatabase chưa commit GUID; **chạy lại lần hai**
  là sạch (cùng lý do đã có sẵn hàm `RelinkControllers`).
- Không còn cách xem HP tổng của cả hàng (đã bỏ click) — nếu cần, dựng lại như một lớp UI riêng.
- Con số `underFootScale = 0.45` là canh mắt theo layout hiện tại; đổi `rowSpacing`/`groupSpacing` thì phải canh lại.

## Verify (2026-07-27)

`dotnet test` **84/84**; Unity compile 0 lỗi; play-test thật Lobby → chọn tướng → Quan Độ/Chiến Thần → trận:
thanh máu 3/12 nhóm mất máu hiện đúng (Công xanh `0.25,0.62,1.0` / Thủ đỏ `0.90,0.20,0.18`); FX đòn đánh spawn tại
tâm phe thủ `(1.09, 1.41)`; FX buff spawn 4 cái tại 4 tâm hàng phe công, order 100.

---
## Backlinks
- [[technical/ctxd-architecture]] — tầng trình diễn
- [[systems/battle-system]] — hình học hàng/nhóm
- [[decisions/game-flow-end-to-end-2026-07-25]] — luồng chứa màn đánh
