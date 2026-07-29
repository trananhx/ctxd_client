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

## Đợt 2 cùng ngày (feedback ảnh mẫu game gốc) — G1/G2/G3 + Fire + LowHp

- **G1 — chỉ hàng đầu diễn đánh**: lunge đổi từ dịch-cả-field-root sang **PER-CELL** (chỉ hàng giao tranh lao lên).
  Config `EngageRows` per-tướng (JSON, wire `CombatantSnapshot.EngageRows`) — vd 2 = cung binh hàng 2 cùng bắn.
- **G2 — thế cánh cung**: `GroupStyle.RowShape="CanhCung"` (JSON `RowShape`, sống qua 6 đường rebuild — phantom giữ thế);
  client uốn **CHỈ hàng rowSlot 0** thành cung parabol nhô về địch (`bowDepth` Inspector). Nối dây `RowSnapshot.Shape`
  vốn ride wire từ đầu mà không ai set/đọc.
- **G3 — tướng chờ 2 bên đường**: `SyncBench` render các tướng queue chưa ra trận (khác ActiveIndex, còn sống) thành
  hình đại diện đứng dọc rìa (diff theo Id; đứng bằng chân + sort theo chân; dọn khi vào trận/chết/reset).
  Knob: `benchEnabled/benchSideOffset/benchSpacing/benchScale`.
- **Fire tactic**: `TacticEffectKind.Fire` (append CUỐI enum; guard test khoá Rule=7/Fire=8) → damage `ApplyFire`
  theo hàng + FX bền `"fire"` (`FireDurationRounds` hiệp, sort 750) trên phe **bị đốt** — nguồn kích thật cho lửa.
- **Gãy giáp end-to-end**: `GroupStyle.LowHpVisualId/LowHpPct` (JSON) — cuối mỗi round server đổi `VisualId` nhóm
  dưới ngưỡng (mặc định 50%), client `SwapVisual` dựng lại tại chỗ. Một chiều, không hồi.
- Nút TEST `KillRow/KillRandom/Attack` đã thread `_cfg` → panel test kích được va chạm đổi hàng.
- ⚠️ `TroopType` KHÔNG có `BoBinh` — bộ binh là `ThuongBinh`; JSON ghi "BoBinh" sẽ fallback lặng lẽ.

**Verify đợt 2**: dotnet **112/112** + selftest OK; Unity 0 lỗi; playtest `stage_fxdemo`: shape=CanhCung/engageRows=2/bench=2
tới client; fire `r=2 sort=750` trên phe công + 1 FX loop; 3/6 nhóm thủ đổi hình "43" sau khi tụt dưới 50%;
screenshot hàng đầu cong hình cung + hổ 102 hàng cuối.

## Màn demo & việc còn lại

- `Server/data/stage_fxdemo.json` ("Thao Trường FX"): Hoàng Trung (3 hàng **cánh cung**, EngageRows 2, skill Buff)
  + 2 tướng chờ (Ngụy Diên, Mã Đại) vs Trấn Quan Tướng (FiveStar cast **Hỏa công**, hình giữa hàng cuối 102,
  **LowHpVisualId 43**), `AdvanceClashPct=0.05`.
- > [!question] Còn mở
>   1. Field mới (`barSegmented/advanceDelay/bowDepth/bench*`) là default script — scene CHƯA serialize; demo bật qua Inspector/runtime.
>   2. Art fire (`persistentFireFx="warBuff/fc2"`) + clash (`clashFx`) là placeholder — chọn art đẹp hơn trong 303 prefab baked.
>   3. Vị trí bench có thể đè UI dưới màn — tinh chỉnh `benchSideOffset` theo camera.

---
## Backlinks
- [[decisions/battle-visual-grammar-2026-07-27]] (supersedes một phần — thêm kênh FX bền)
- [[technical/single-figure-unit]] (mở rộng xuống per-group)
- [[systems/battle-system]] — hình học hàng/nhóm
