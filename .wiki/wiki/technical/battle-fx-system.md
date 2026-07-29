---
title: Hệ FX trận — 2 kênh vòng đời, client data-driven
category: technical
tags: [battle, fx, visual, server-authoritative, wire, health-bar]
sources: [Assets/Ctxd/Battle/Sim/ActiveEffect.cs, Assets/Ctxd/Battle/BattleSideField.cs, Assets/Ctxd/Battle/ServerBattleDirector.cs, Assets/Ctxd/Visual/EffectVisual.cs, docs/superpowers/specs/2026-07-29-battle-fx-demo-design.md]
created: 2026-07-29
updated: 2026-07-29
---

# Hệ FX trận (2026-07-29) — feedback khách gom 9 hạng mục

Triết lý: **client là "máy render" data-driven, server chỉ gửi DATA** — thêm FX/đổi hành vi không cần sửa client.
Spec đầy đủ: `docs/superpowers/specs/2026-07-29-battle-fx-demo-design.md`. Nhánh `feature/battle-fx-demo`.

## Hai kênh FX theo vòng đời

| Vòng đời | Kênh | Latch tại | Ví dụ |
|---|---|---|---|
| **Một-phát** | event log — `BattleEvent` + 4 field mới `Sorting`/`AnchorRows`/`AnchorWholeGroup`/`LifetimeSec` (nullable → wire omit) | `PlayEvent` | đòn skill chớp 1 lần |
| **Bền (theo HIỆP)** | snapshot — `SideState.Effects` (List `ActiveEffect`) → `SideSnapshot.Effects` (null khi rỗng = 0-drift) | `RenderFields` → `BattleSideField.SyncActiveEffects` (diff spawn/keep/destroy, FX **loop**) | buff giữ liên tục, lửa cháy N hiệp |

- Server: `SideState.AddOrRefreshEffect(fxId, rounds, anchor, rowIndex, sorting)`; `BattleRunner.StepRound` giảm mỗi hiệp, `<0 = UntilRemoved`. `BuffEffect` tự đăng ký aura `"buff"` (config `BuffAuraRounds=3`).
- Client: key diff = `fxId#rowIndex`; aura **bám theo hàng** khi tiến lên; huỷ qua `EffectVisual.StopAndDestroy`.
- **fxId lạ chứa `/` được tra THẲNG làm id FX** (`ServerBattleDirector.PersistentFxFormat`) → server gửi `"warBuff/12"` là client hiện luôn, không cần sửa client.
- `EffectVisual`: tự huỷ bằng `Invoke` (huỷ được) thay `Destroy` trễ (không huỷ được) → `Configure(loop, lifetime)` sau Instantiate hoạt động.

## Các năng lực client mới (gói A–F)

1. **A** — FX bền theo hiệp như trên. Diff Ở `RenderFields` (seam áp snapshot), **không** trong `PlayEvent` → không nhấp nháy.
2. **B** — skill FX: `AnchorRows` (hàng 1 / tâm N hàng), `Sorting` (trên/dưới lính; mặc định buff 100 / skill 780, Inspector), `LifetimeSec`; buff `AnchorWholeGroup` = 1 aura ôm cả đội; **stack không lệch** = gọi N lần cùng vị trí khác sorting.
3. **C1** — `HealthBar` mode **chia ngăn** (`barSegmented`/`barSegments` trên director, N-1 vạch đè fill).
4. **C2** — `advanceDelay` (0.6s): hàng sau đợi anim chết xong mới tiến (hoãn riêng `MoveCell`, không chặn `Drain`).
5. **D** — `LastRowMiddleSingle`/`LastRowMiddleVisualId`/`LastRowMiddleScale` (JSON per-tướng): nhóm `floor(n/2)` hàng cuối = 1 sprite ×1.3. Đặt trong `FormationBuilder.FromLayout` (choke point) → **phantom/viện binh giữ được hình**. "1 con" = 1 SPRITE, HP giữ nguyên.
6. **E** — `AdvanceClashPct` (per-màn qua `ScenarioDto`, mặc định 0): hàng sau lên chịu va nhẹ deterministic (không RNG), truyền qua `RowAdvanced.Amount` (field sẵn có); client `PlayClash` 2 phía + FX seam + số nổi.
7. **F** — server đổi `VisualId`/`Scale` của nhóm **đang sống** giữa trận → `SwapVisual` dựng lại sprite+bar tại chỗ (giữ anchor/slot/máu). Wire không đổi.

## Verify (2026-07-29)

- dotnet: **107/107** (90 gốc + 17 mới), selftest OK, 0-drift.
- Unity compile 0 lỗi. Play thật màn `stage_fxdemo`: aura buff server đăng ký `rounds=3` → client 1 FX loop → đếm `2→1→GONE`, client tự huỷ (leak = 0). Screenshot xác nhận thanh máu chia ngăn 2 phe + Bạch Hổ 102 to ở hàng cuối.

## Màn demo & việc còn lại

- `Server/data/stage_fxdemo.json` ("Thao Trường FX"): Hoàng Trung (FiveStar, skill Buff) vs Trấn Quan Tướng (3 hàng, hình giữa hàng cuối = 102), `AdvanceClashPct=0.05`.
- > [!question] Còn mở
>   1. Nút TEST `KillRow` (BattleSession) chưa thread `cfg` → không kích clash qua panel test (đường combat thật thì có). Thread 3 call site nếu muốn demo nhanh bằng nút.
>   2. `ApplyFire` chưa có caller trong `BattleRunner` → FX `"fire"` bền đã sẵn cơ chế nhưng chưa có nguồn kích trong trận thật.
>   3. Field `barSegmented/advanceDelay` là default script — scene chưa serialize; demo phải bật qua Inspector/runtime.
>   4. FX gãy giáp (F) cần server đổi VisualId theo ngưỡng máu — cơ chế client xong, thiếu rule server + art 2 trạng thái.

---
## Backlinks
- [[decisions/battle-visual-grammar-2026-07-27]] (supersedes một phần — thêm kênh FX bền)
- [[technical/single-figure-unit]] (mở rộng xuống per-group)
- [[systems/battle-system]] — hình học hàng/nhóm
