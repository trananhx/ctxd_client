# Thiết kế: Demo FX trận hình (buff / skill / thanh máu / single-figure / va chạm / đổi hình)

- **Ngày**: 2026-07-29
- **Nguồn**: feedback khách về bản demo FX trận (gom 9 hạng mục → 6 gói A–F + cross-cutting X)
- **Trạng thái**: active — đã duyệt thiết kế tổng, chờ thực thi
- **Kiến trúc nền**: server-authoritative. Server (`Server/*` + `Assets/Ctxd/Battle/Sim/*`) tính tất cả; client (`ServerBattleDirector`, `BattleSideField`, `Assets/Ctxd/Visual/*`) chỉ **render** snapshot + event log. Snapshot **append-only** (Protocol trong `Snapshots.cs`). Sim dotnet-test được qua `Tests/CtxdSim.Tests` (không cần Unity); tầng render là Unity-only.

---

## 1. Bối cảnh & 9 hạng mục feedback

| # | Hạng mục | Gói |
|---|---|---|
| 1 | Buff giữ **hết lượt** dưới chân hàng 1 (không nháy 1 lần) | A |
| 2 | Demo đủ 2 FX: skill lớn đánh nhiều hàng + tia buff xanh ôm nhóm | B |
| 3 | 1 hàng nhiều buff (stack, không giới hạn) | B |
| 4 | Skill chỉnh vị trí: hàng 1 / giữa nhiều hàng | B |
| 4b | Skill: **sorting** trên/dưới lính + set thời gian tồn tại | B |
| 5 | 2 loại vòng đời FX: 1 lượt tự tắt vs lửa sống **qua vài hiệp** | A |
| 6 | Thanh máu 2 mode: **chia ngăn** vs liền; giãn nhịp giữa lượt | C |
| 7 | Nhóm giữa hàng cuối → 1 hình lớn, số lượng 1, +30%, bool | D |
| 8 | Va chạm khi hàng đầu chết → hàng 2 lao lên (va nhẹ + trừ máu) | E |
| 9 | Đổi hình lính **đang sống** giữa trận theo state server (có giáp → mất giáp) | F |

## 2. Quyết định đã chốt (với khách)

- **A1**: FX đo bằng **hiệp**; server **gửi thông tin FX xuống**, client chỉ hiển thị.
- **A2**: buff **giữ liên tục**, server quyết định bắt đầu/kết thúc.
- **B1**: "trên/dưới lính" = **sorting order** (độ sâu vẽ).
- **B2**: buff **ôm cả nhóm** (1 FX/nhóm).
- **B3**: **không giới hạn** số buff; phân biệt bằng **lớp sorting**, **không xếp lệch** vị trí.
- **C1**: thanh máu thêm mode **chia ngăn** (N ngăn), song song mode liền hiện tại; cờ chọn.
- **C2**: delay chỉnh được **sau animation chết** rồi hàng sau mới lên.
- **D**: cờ bool + `VisualId` trên nhóm (khai JSON); nhóm giữa = `floor(n/2)`, chỉ hàng cuối; count 1 (nghĩa là **1 sprite**, không phải 1 HP), scale ×1.3.
- **E/F/X**: Claude tự quyết theo khuyến nghị.

## 3. Kiến trúc: HAI kênh FX theo vòng đời

Client xử lý **tuần tự 1 hàng đợi** (`_pending` → `Drain` → `HandleMsg`); server gửi **Events rồi State** trong mỗi `Broadcast`. Không có đua snapshot/event. Từ đó tách bạch:

| Vòng đời | Kênh | Latch tại | Ví dụ |
|---|---|---|---|
| **Transient** (một-phát) | **event log** `BattleEvent` | `PlayEvent` (theo `eventPace`) | đòn skill chớp 1 cái |
| **Persistent** (bền) | **snapshot** — list `ActiveEffect` | `RenderFields()` (áp snapshot), **KHÔNG** trong `PlayEvent` | buff giữ liên tục, lửa cháy N hiệp |

> [!warning] Buff sẽ nhấp nháy nếu diff persistent-FX trong `PlayEvent`. Bắt buộc diff ở seam `RenderFields()` (đúng nhịp áp snapshot).

**Kỷ luật wire (bắt buộc)**: chỉ **append**; không đổi thứ tự/không xoá field enum (`Wire.cs` serialize enum = int); mọi field mới default = hành vi cũ; dùng `null`/nullable để `NullValueHandling.Ignore` **bỏ qua khi rỗng** → wire byte-identical với scenario cũ. `BattleSnapshot.From` là builder **duy nhất** — điền field mới từ state server, không tích luỹ ở client.

---

## 4. Gói A — FX vòng đời (persistent, server-driven, theo hiệp)

**Mục tiêu**: buff giữ liên tục (#1) + lửa sống N hiệp (#5) bằng danh sách `ActiveEffect` bền do server sở hữu, client diff spawn/keep/destroy, FX **loop**.

**Type mới (sim, thuần C#, không UnityEngine):** `Assets/Ctxd/Battle/Sim/ActiveEffect.cs`
```csharp
public enum FxAnchorKind { SideCenter, RowCenter, UnderFoot }
public sealed class ActiveEffect {
    public string FxId;
    public FxAnchorKind Anchor = FxAnchorKind.UnderFoot;
    public int RowIndex = -1;          // -1 = cả phe
    public int SortingOrder = 100;     // buff dưới lính mặc định
    public int RemainingRounds = -1;   // <0 = UntilRemoved (server tự gỡ)
}
```

**Sim state:** `SideState.Effects` (`List<ActiveEffect>`) + helper `AddOrRefreshEffect(fxId, rounds, anchor, rowIndex, sorting)` (bump nếu trùng `fxId+rowIndex`, không nhân đôi). Giảm mỗi hiệp trong `BattleRunner.StepRound` cạnh `Decrement(off/def)` (~L118) qua `DecrementEffects(side, ev)`; bỏ entry về 0, giữ `UntilRemoved`.

**Đăng ký effect (nơi trigger):**
- **Buff** (`BuffEffect.Apply`): đăng ký `ActiveEffect("buff…", UntilRemoved, UnderFoot, rowIndex, sorting=100)` trên phe **cast**; server gỡ khi buff hết hạn.
- **Lửa**: dùng lại `CombatOps.ApplyFire` (damage giữ nguyên) + đăng ký `ActiveEffect("fire", FireDurationRounds, …)` trên phe **bị đánh**. Thêm `BattleConfig.FireDurationRounds = 3`.
- ⚠️ `ApplyFire` hiện **chưa được gọi trong `BattleRunner`** (chỉ test dùng). Phần thực thi A phải wire trigger lửa vào một nguồn thật (địa hình hoả công / chiến pháp) — hoặc tối thiểu một scenario demo — để có cái mà quay.

**Wire:** `ActiveEffectSnapshot` (POCO) + `SideSnapshot.Effects` (`List`, null khi rỗng). `BattleSnapshot.SideFrom` gọi `EffectsFrom(side.Effects)` (trả null nếu rỗng → 0-drift).

**Client render (Unity):**
- `EffectVisualDefinition.loopUntilRemoved = false` (opt-in). `EffectVisual.loop` + `StopAndDestroy()`; khi `loop`, `Play()` **không** `Destroy` (client sở hữu vòng đời). `VisualSpawner.SpawnEffect` set `loop` từ definition.
- `BattleSideField._activeFx` (`Dictionary<string,GameObject>`, key = **`fxId + rowIndex`**) + `SyncActiveEffects(list, resolver)`: spawn looping cho key mới (đặt theo `Anchor`, tái dùng math của `SpawnUnderFootEffect`), giữ cái còn, `StopAndDestroy` cái mất.
- `ServerBattleDirector.RenderFields()` gọi `SyncActiveEffects` cho cả 2 phe (map `fxId`→`EffectVisualDefinition` qua `database.GetEffectVisual` + thay `{f}` att/def). Sau `Reconcile` (rebuild khi đổi tướng) list tự spawn lại từ snapshot.

**Files:** `Sim/ActiveEffect.cs` (new), `Sim/SideState.cs`, `Sim/BattleRunner.cs`, `Sim/BattleConfig.cs`, `Sim/TacticEffects.cs` (BuffEffect), `Sim/Net/Snapshots.cs`, `Data/EffectVisualDefinition.cs`, `Visual/EffectVisual.cs`, `Battle/VisualSpawner.cs`, `Battle/BattleSideField.cs`, `Battle/ServerBattleDirector.cs`.

**Tests:** (dotnet) Fire đăng ký 1 entry; re-trigger **refresh** không nhân đôi; `DecrementEffects` đúng nhịp (còn sau 1 hiệp, mất sau 2; `UntilRemoved` sống mãi); `From` project đúng, rỗng→null (0-drift); round-trip Wire; 90 test cũ giữ nguyên. (Unity) `loop=true` không auto-destroy; `SyncActiveEffects` spawn/keep/destroy đúng (no leak, no double).

**Rủi ro:** default `Effects=null` bắt buộc (0-drift); key phải gồm `rowIndex` (tránh đụng); loop phải qua `StopAndDestroy` (tránh entry treo); FX bền chỉ hiện sau State snapshot kế (trễ 1 message — chấp nhận).

---

## 5. Gói B — Buff & Skill demo (vị trí, sorting, thời gian, stack)

**Mục tiêu**: skill transient chỉnh được **sorting** (#4b/B1), **vị trí hàng/giữa nhiều hàng** (#4), **lifetime** (#4b); buff **ôm nhóm** (#2/B2); stack **không giới hạn theo lớp, không lệch** (#3/B3).

**Wire (append-only, nullable):** `BattleEvent` thêm
```csharp
public int?   Sorting;            // B1: null = default theo loại
public int?   AnchorRows;         // #4: null = hiện tại; 0/1 = hàng trước; N = tâm N hàng trước
public bool   AnchorWholeGroup;   // B2
public float  LifetimeSec = -1f;  // 4b: <0 = dùng lifetime baked
```
(dùng `int?` để wire thật sự bỏ qua khi null — không lặp wart `RowIndex=-1` luôn serialize).

**Client:**
- `VisualSpawner.SpawnEffect(eff, pos, parent, int? sortingOrder=null, float? lifetimeSec=null)` — set `spriteRenderer.sortingOrder` + `EffectVisual.lifetime` **trước** OnEnable.
- `BattleSideField.SpawnUnderFootEffect(..., bool wholeGroup=false, int? anchorRows=null, int? sortingOverride=null, float? lifetimeSec=null)`: `wholeGroup` → 1 aura tại centroid mọi nhóm sống; `anchorRows` → giới hạn hàng trước N; forward sorting/lifetime vào `Place`. Gọi N lần cùng vị trí, khác `sorting` = **stack không lệch** (B3). Thêm `RowCenter(int n)` (tâm N hàng sống) dùng chung với gói A.
- `ServerBattleDirector`: field inspector `buffSortingOrder=100`, `skillSortingOrder=780` (dưới bar 800, trên lính động ~300–700). `SpawnSkillEffect` forward `e.Sorting/AnchorRows/AnchorWholeGroup/LifetimeSec` vào `PlayUnderFoot` (buff, phe cast) hoặc placement mục tiêu (skill, phe địch, `RowCenter`).

**Sim (tuỳ chọn):** `BattleRunner.CastOne` điền các field từ `TacticSpec` nếu authoring có; chưa có thì để director dùng default.

**Files:** `Sim/BattleEvent.cs`, `Battle/VisualSpawner.cs`, `Battle/BattleSideField.cs`, `Battle/ServerBattleDirector.cs`, (tuỳ chọn) `Sim/BattleRunner.cs`.

**Tests:** (dotnet) default nullable = omit trên wire; round-trip populated. (Unity) sorting override đúng; lifetime override huỷ đúng hạn; stack 3 aura cùng vị trí khác sorting; `wholeGroup` ra đúng 1 aura tại centroid; `anchorRows` đặt đúng tâm N hàng.

**Chốt (Claude quyết):** `skillSortingOrder` mặc định **780**; `AnchorRows` diễn giải trên **field mà FX đặt lên** (địch cho damage, cast cho buff); dùng **nullable int?**.

---

## 6. Gói F — Đổi hình lính đang sống (client-only)

**Mục tiêu**: snapshot đổi `VisualId` của nhóm **đang sống** → client swap sprite tại chỗ, giữ anchor/slot/máu (#9). **Wire không đổi** (`GroupSnapshot.VisualId` đã có). **Không đụng sim.**

**Client (`BattleSideField.cs`):**
- `Cell` thêm `string visualId; float scale = 1f;` (SpawnCell ghi lại sau khi resolve).
- Nhánh `else` của `ApplyStateInternal` (~L137, cell sống): so `g.VisualId != cell.visualId` **hoặc** scale đổi → `SwapVisual(cell, g, target)`.
- `SwapVisual`: guard `!cell.dying`; despawn `UnitVisual` cũ, respawn hình B vào **cùng anchor/offset/scale/foot-anchor/sorting** (lift math từ `SpawnCell`); `RebuildBar` (huỷ bar cũ, dựng lại theo bounds B); giữ `soldiers/maxSoldiers/slot/rowSlot`; gọi lại `UpdateSorting`. Mặc định **snap**; hook FX chuyển tuỳ chọn (puff / `PlayHurt` chớp).

**Files:** chỉ `Battle/BattleSideField.cs`.

**Tests:** (dotnet) `GroupSnapshot` round-trip `VisualId` đổi (armored→broken) — xác nhận wire tải swap không cần sim. (Unity) swap thay prefab, anchor/soldiers/slot giữ nguyên; swap sang cỡ khác → bar dựng lại đúng; nhóm damaged giữ ratio; no-op khi VisualId không đổi (không churn mỗi snapshot).

**Rủi ro:** guard `!cell.dying`; B thiếu prefab → theo guard của SpawnCell; huỷ bar cũ trước khi dựng mới; so cả scale (foot-anchor + bar phụ thuộc scale).

---

## 7. Gói C — Thanh máu chia ngăn + delay hàng sau lên

**Mục tiêu**: mode thanh máu **chia ngăn** (#6/C1); **delay** sau death anim rồi hàng sau mới lên (#6/C2).

**C1 — `HealthBar.cs`:** thêm `_segmented`, `_segments`, `_dividers`. `Create(..., bool segmented=false, int segments=1)` (append-only). `BuildDividers()` vẽ **N-1 vạch tối mỏng** đè lên `_fill` (localOrder 2); `_fill` liên tục giữ nguyên → `SetRatio` không đổi. `SetSortingOrder` cho divider = `order+2`. (Mặc định fill liền dưới vạch; **không** quantize.)

**Chọn mode:** field inspector `ServerBattleDirector.barSegmented/barSegments` → thread qua `FieldLayout` → `SpawnCell` call `HealthBar.Create` (giống hệt cách `offense/defenseBarColor` đang thread).

**C2 — seam đã trace chính xác:** hàng sau lên ở `ApplyStateInternal` (áp snapshot `State`) qua `MoveCell` — **cùng vòng lặp** với `KillCell` (death anim). Chèn delay bằng cách **hoãn riêng MoveCell**, để death chạy ngay:
- `ServerBattleDirector.advanceDelay = 0.6f` (near `eventPace`) → thread qua `FieldLayout`.
- Nhánh advance (~L141) gọi `MoveCellDelayed(cell, target, _layout.advanceDelay)`: **claim `slotPos=target` ngay** (tránh double-move), `StartCoroutine(MoveDelayedCo)` = `WaitForSeconds(delay)` rồi `MoveCo`. Coroutine chạy độc lập, **không** chặn `Drain`.
- `advanceDelay >= DieDuration(0.4)` để xác chết biến mất trước khi hàng sau chiếm chỗ. **Không** dùng Option B (hoãn cả `State` case) vì sẽ hoãn luôn death anim.

**Files:** `Visual/HealthBar.cs`, `Battle/BattleSideField.cs` (FieldLayout + SpawnCell + MoveCellDelayed/MoveDelayedCo), `Battle/ServerBattleDirector.cs`.

**Tests:** (Unity, vì HealthBar/BattleSideField là UnityEngine) segmented tạo N-1 divider, default không có; vị trí divider đúng; `advanceDelay` → hàng sau đứng yên tới `delay+MoveDuration`; `advanceDelay=0` = hành vi cũ. (dotnet) test RowAdvanced cũ vẫn xanh.

**Chốt (Claude quyết):** fill **liền dưới vạch** (không quantize); `barSegments` **chung 2 phe**, mặc định **10**; `advanceDelay` mặc định **0.6f**; delay **mọi cell tiến** đồng đều.

---

## 8. Gói D — Single-figure nhóm giữa hàng cuối

**Mục tiêu**: cờ bool + `VisualId` (khai JSON) biến **nhóm giữa hàng cuối** thành 1 hình lớn: **1 sprite** (SpriteCols=SpriteRows=1), scale ×1.3, giữa = `floor(n/2)`, chỉ hàng cuối (#7). Mở rộng single-figure hiện có. **Không đụng client/wire** (Group.SpriteCols/Scale/VisualId đã ride wire + `SpawnCell` đã đọc per-group).

**Điểm đặt logic — `FormationBuilder.FromLayout` (`Formation.cs`):** đây là **choke point** của cả 6 site rebuild (JSON/uniform/mượn binh/ảo ảnh/phó tướng×2) → đặt ở đây thì phantom/reinforcement **giữ được** hình giữa. **Không** đặt ở `ScenarioLoader`.

`GroupStyle` thêm: `bool LastRowMiddleSingle; string LastRowMiddleVisualId; float LastRowMiddleScale;` + `const DefaultLastRowMiddleScale = 1.3f`. Sau vòng dựng row, trước `return rows`:
```csharp
if (style?.LastRowMiddleSingle == true && rows.Count > 0) {
    var last = rows[rows.Count - 1];              // hàng ĐÃ dựng (bỏ qua row null)
    int gc = last.Groups.Count;
    if (gc > 0) {
        var g = last.Groups[gc / 2];              // floor(n/2), upper-middle khi chẵn
        g.SpriteCols = 1; g.SpriteRows = 1;
        g.Scale = style.LastRowMiddleScale > 0f ? style.LastRowMiddleScale : DefaultLastRowMiddleScale;
        if (!string.IsNullOrEmpty(style.LastRowMiddleVisualId)) g.VisualId = style.LastRowMiddleVisualId;
        // KHÔNG set Soldiers=1 — "1 con" = 1 sprite, HP giữ nguyên (như boss single-figure hiện tại)
    }
}
```

**JSON (per-general, append-only):** `GeneralDto` thêm `LastRowMiddleSingle` (bool), `LastRowMiddleVisualId` (string), `LastRowMiddleScale` (double, 0→1.3). `ToStyle()` nới null-guard thêm `|| LastRowMiddleSingle` và điền 3 field.

**Files:** `Sim/Formation.cs`, `Server/ScenarioLoader.cs`, (demo) 1 `Server/data/stage_*.json` + đăng ký `stages.json`, `Tests/CtxdSim.Tests/SingleFigureUnitTests.cs` (thêm test).

**Tests (dotnet):** middle group hàng cuối có SpriteCols=1/Scale=1.3/VisualId=B, nhóm khác nguyên; tổng HP nguyên (chứng minh không set Soldiers=1); ra tới wire + round-trip; **phantom giữ hình giữa**; chẵn → `floor(n/2)`; flag off → `Style==null`, formation byte-identical.

**Chốt (Claude quyết, theo khuyến nghị):** "1 con" = **1 sprite** (HP giữ); scale **tuyệt đối 1.3** (nhân `_unitScale` sau, = +30% so lính thường); giữa chẵn = **upper-middle** `floor(n/2)`; **per-general keys** (không đổi schema Formation); chỉ đổi `VisualId` (render), **giữ Troop** (combat).

> [!warning] Nếu general đặt `Rows=1` + `LastRowMiddleSingle`, dính bẫy `frac=RowsHit/Rows` (single-figure-unit.md). Demo nên dùng `Rows≥2`.

---

## 9. Gói E — Va chạm + trừ máu khi hàng sau lên

**Mục tiêu**: hàng đầu chết → hàng 2 lao lên có **va chạm + trừ máu** (#8); server tính damage (authoritative), client render. Chỉ khi đổi hàng.

> [!info] Đính chính so với blueprint gốc: **bỏ enum `RowClearBehavior` / loại trừ E-F**. F là "đổi hình lúc sống", không liên quan cái chết → E độc lập hoàn toàn. E chỉ cần 1 knob bật/tắt.

**Sim (`CombatOps.ApplyDamageToFront`):** `RowAdvanced` hiện chỉ mang `Count/Text`, **chưa có damage**. Khi hàng trước bị dọn và có hàng sau: tính **clash damage deterministic** (KHÔNG RNG — giữ baseline RE Stage-1) = `BattleConfig.AdvanceClashPct × soldiers hàng vừa lên`, apply qua `SpreadEven` (sinh `GroupKilled` nếu cần) và **stamp `Amount`** lên event `RowAdvanced` (dùng lại field `double Amount` sẵn có → **wire không thêm field**). `BattleConfig.AdvanceClashPct = 0` (mặc định → giữ 90 test + scenario cũ byte-identical); scenario demo set >0. Thread `BattleConfig cfg` optional vào `ApplyDamageToFront` (null → không clash).

**Client (`ServerBattleDirector.PlayEvent` case `RowAdvanced`):** khi `e.Amount>0`: `PlayClash()` trên **cả 2 field** (`FieldOf(e.Side)` = phe mất hàng đang tiến, `TargetField(e.Side)` = địch) → 2 quân lao vào nhau; spawn `clashFx` tại **seam** `(FieldOf.Center + TargetField.Center)*0.5`; `SpawnDamage(FieldOf(e.Side), e.Amount)` nổi số. `Amount==0` → giữ Wait ngắn cũ. `BattleSideField.PlayClash()` = `LungeCo` mạnh hơn về phía địch (`_lungeDir`).

**Files:** `Sim/CombatOps.cs`, `Sim/BattleConfig.cs`, `Sim/BattleSession.cs` (thread cfg), `Battle/ServerBattleDirector.cs` (+field `clashFx`), `Battle/BattleSideField.cs` (`PlayClash`).

**Tests (dotnet):** `AdvanceClashPct>0` → 1 `RowAdvanced` với `Amount>0`, hàng mới tụt đúng; `=0` → `Amount==0`, không mất quân thừa (regression); **deterministic** (không tăng con trỏ RNG); overkill vẫn spill; hàng cuối (không có hàng sau) → `Amount==0`; round-trip `Amount`. (Unity/manual) 2 field lao vào seam + FX + số nổi đúng phe tiến (`e.Side = target.Faction`).

**Chốt (Claude quyết):** `AdvanceClashPct` mặc định **0.05** ở scenario demo (**0** ở config gốc để giữ test); công thức deterministic theo `%` quân hàng vừa lên; **e.Side = phe mất hàng** (nổi số đúng phe đang tiến); thread `BattleConfig` optional.

---

## 10. Cross-cutting (X): đồng bộ, protocol, harness, thứ tự

- **Seam diff persistent-FX = `RenderFields()`** (áp snapshot), tuyệt đối không `PlayEvent`. Client tuần tự (1 `_pending` + 1 `Drain`) → không có đua; chỉ cần đúng chỗ latch: transient=event, persistent=snapshot.
- **Ranh giới test:** dotnet-only (không UnityEngine) = mọi thứ dưới `Assets/Ctxd/Battle/Sim/**` + `Server/BattleSession.cs` + `Server/ScenarioLoader.cs`. Unity-only = `ServerBattleDirector`, `BattleSideField`, `VisualSpawner`, `HealthBar`, `EffectVisual`, UI.
- **Lệnh (đã verify session này):**
  - `dotnet build Server/CtxdServer.csproj` → exit 0
  - `dotnet run --project Server/CtxdServer.csproj -- selftest` → `SELFTEST OK`
  - `dotnet test Tests/CtxdSim.Tests/CtxdSim.Tests.csproj` → 90 pass (`--filter <Class>` để lọc)
  - Unity compile/playmode: **chỉ qua Unity MCP** (Editor mở + MCP nối).
- **Mở rộng selftest** (`Server/Program.cs`) round-trip cho field wire mới.

## 11. Thứ tự thực thi (checkpoint an toàn)

Nguyên tắc: **khoá contract wire xanh bằng dotnet TRƯỚC khi đụng file Unity-only.** Thứ tự tổng **A → B → F → C → D → E**, mỗi gói theo lát:

1. **Wire + sim** (append-only field, sim fill, `BattleConfig` knob) → CHECKPOINT: `dotnet build` + `selftest OK` + `dotnet test` 90 xanh + test mới xanh.
2. **Selftest/xUnit** cho field mới (default = hành vi cũ; round-trip) → CHECKPOINT dotnet xanh.
3. **Client render** (Unity-only: EffectVisual/VisualSpawner/BattleSideField/ServerBattleDirector/HealthBar) → CHECKPOINT: Unity MCP compile sạch (`read_console` 0 error).
4. **Playmode** verify: buff không nhấp nháy; stack; swap không churn; segmented; advanceDelay; clash; single-figure.

Gói **D** và **F** rẻ + độc lập (D: sim+test dotnet thuần; F: client thuần) → có thể làm sớm để có thắng lợi nhanh. Gói **A** là nền chặn phần persistent của B.

## 12. Quyết định còn để mở (đã chọn default, khách có thể phủ quyết)

Tất cả đã có default để **không chặn thực thi**; liệt kê để minh bạch:
- **A**: `FireDurationRounds=3`; buff = `UntilRemoved`; cần 1 nguồn trigger lửa thật (hoặc scenario demo) vì `ApplyFire` chưa được gọi trong `BattleRunner`.
- **B**: `skillSortingOrder=780`, `buffSortingOrder=100`; field wire dùng `int?`.
- **C**: fill liền dưới vạch (không quantize); `barSegments=10` chung 2 phe; `advanceDelay=0.6`.
- **D**: "1 con" = 1 sprite (HP giữ); scale tuyệt đối 1.3; per-general keys.
- **E**: `AdvanceClashPct` (config gốc 0, demo 0.05); công thức % deterministic.
- **F**: mặc định snap (FX chuyển tuỳ chọn, chưa wire asset puff).

---

## Backlinks
- [[decisions/battle-visual-grammar-2026-07-27]] — ngữ pháp FX skill vs buff (nền của gói A/B)
- [[technical/single-figure-unit]] — cơ chế tướng đơn (nền của gói D)
- [[systems/battle-system]] — hình học hàng/nhóm
- [[technical/ctxd-architecture]] — tầng trình diễn, server-authoritative
