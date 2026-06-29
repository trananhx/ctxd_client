---
title: Kiến trúc Client — Luzart + SO Architecture + Design Patterns
category: technical
tags: [client, architecture, scriptableobject, design-patterns, luzart, battle, blueprint]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Blueprint Kiến trúc CLIENT — CTXD trên Luzart

Tài liệu kiến trúc client cho bản dựng lại **攻城掠地 / Công Thành Xưng Đế** — SLG Tam Quốc theo lượt, Unity 6.5, **SERVER-AUTHORITATIVE**. Tận dụng tối đa framework **Luzart** ([[technical/luzart-framework]]) + ScriptableObject Architecture + nhiều design pattern. Đối chiếu: [[systems/battle-system]], [[technical/client-server-architecture]], [[GDD]] §16. Mọi API đã xác minh trực tiếp từ code Luzart.

> [!warning] Nguyên tắc bất biến số 1
> **Client KHÔNG bao giờ giải đòn.** Mọi `AssetNumber`/`AssetCalculator`/công thức phía client chỉ để **HIỂN THỊ + DỰ ĐOÁN (advisory)**. Nguồn chân lý là chuỗi `BattleEvent` server gửi về. Cây số client luôn bị snapshot server ghi đè.

---

## 1. Phân lớp client — ai sở hữu gì

Kiến trúc 6 lớp; mỗi lớp **chỉ phụ thuộc xuống**, giao tiếp ngang qua `BroadcastService` (EventBus) và `INumber.Changed` (reactive).

```
6. PRESENTATION/TWEEN   TweenAnimation, SequenceTween, SelectSwitch/Toggle, DOTweenTMP
                        → animation đòn đánh, số bay, typewriter log, highlight thế trận
5. VIEW/UI              LuzartUI (UIManager/UIBase/UIRegistrySO) + View/ViewT/ViewChilding
                        → màn hình + HUD; bind data → cây con; KHÔNG business logic
4. VIEWMODEL/REACTIVE   Runtime* (Number/Bool/String) + Variable<T>; cây Sum/Boosted/Compare
                        → HP/Nộ/tài nguyên/cờ gating; điểm đồng bộ data server ↔ view
3. CONTENT/SO DATA      AbstractScriptableContent(+Saveable), AssetNumber/AssetStat/Definition
                        → GeneralDef, TroopType, FormationLayout, SkillDef, ResourceDefinition
2. SERVICES             AbstractScriptableService (ServiceBag)
                        → NetworkService, BattleEventPlayerService, Input, Audio, Save
1. COMPOSITION ROOT     SceneRootManager → Domain (DI/Service Locator); ServiceBag[]+ContentBag[]
                        → vòng đời Inject→Initialize→Start→Stop→Terminate cho toàn bộ
```

| Lớp | Mảnh Luzart | Loại CTXD | Ai resolve ai |
|---|---|---|---|
| **1. Root** | `SceneRootManager`, `Domain`, `Universe` | `BattleUniverse`, `CityUniverse` | `SceneRootManager.Start()` dựng Domain, install bag, `InitializeAndStart()` (services trước) |
| **2. Services** | `AbstractScriptableService`, `ServiceBag` | `NetworkService`, `BattleEventPlayerService`, `InputService`, `SaveService` | content lấy qua `_domain.GetService<T>()` |
| **3. Content/SO** | `AbstractScriptableContent(Saveable)`, `AssetNumber*`, `AssetStat`, `ResourcePool` | `GeneralDef`, `TroopType`, `FormationLayout`, `SkillDef`, `BattleQueueData` | resolve nhau trong `DoInitialize()` qua `GetFirst<T>`/`Get<T>(id)` |
| **4. ViewModel** | `Runtime*`, `Variable<T>`, `INumber/IBool` | `GeneralVM`, `BattleHudVM` | tạo trong `OnSetup`, **Dispose** trong `OnTeardown` |
| **5. View/UI** | `UIManager/IUIService`, `UIBase<TData>`, `View/ViewT/ViewChilding` | `CityMainUI`, `BattleHudUI`, `BattleFieldView` | `ShowAsync(UIId, UIContext)`; `ViewT.Setup(data)` |
| **6. Presentation** | `TweenAnimation`, `SequenceTween`, `SelectSwitch/Toggle` | `AttackTween`, `DamageNumberLayer`, `StanceWheelSelector` | `BattleEventPlayerService` map 1 event → 1 `Sequence.Show()` |

> [!tip] Ranh giới quan trọng nhất: **View layer** (`ViewT`/`ViewChilding`) lo *bind data cây con*; **LuzartUI** (`UIBase`) lo *show/hide/lane/stack*. Một `UIBase` host một `ViewT` bên trong — đừng nhầm.

---

## 2. Bảng ánh xạ Design Pattern → mảnh Luzart → dùng ở đâu

| Pattern | Mảnh Luzart (code thật) | Dùng ở đâu trong CTXD |
|---|---|---|
| **DI / Service Locator** | `Domain` (không reflection) | Khung khởi động mọi scene; view kéo dependency qua `GetService/GetFirst` |
| **Composition Root** | `SceneRootManager` + `ServiceBag/ContentBag` | 1 điểm dựng object graph/scene; kéo asset vào bag, không `new` tay |
| **Template Method / Lifecycle FSM** | `Abstract*Content/Service` (`Initialize→Start→Stop→Terminate`) | Vòng đời mọi system; vào BattleState `Start`, ra `Stop/Terminate` (đảo thứ tự) |
| **Observer / Pub-Sub** | `BroadcastService` (`Publish/Subscribe<T>` theo Type) | Luồng `BattleEvent` server → view |
| **Observer / Reactive** | `Variable<T>`, `RuntimeNumber/Bool/String` (`Changed`) | Bind HP/Nộ/vàng/lương; chỉ vẽ lại khi đổi |
| **Composite** | `RuntimeNumber_Sum`, `AssetNumber_Aggregation`; `ViewChilding` | Cây stat (base+gear+buff); cây view Phe→5 Tướng→Hàng→Nhóm→Lính |
| **Strategy** | `AssetCalculator`; `IBaseSelect<T>` (Select); `FormationLayout` | Công thức cộng đồ; chọn 1/3 thế trận; layout đội hình theo tướng |
| **State Machine** | `UIState` (10 trạng thái); **battle turn FSM (BỔ SUNG)** | Lifecycle UI; vòng trận theo lượt (§3) |
| **Command** | `TweenAnimationCaller`; `[Button]`; **CommandBus (BỔ SUNG)** | Nút bánh xe/Giác đóng gói lệnh → gửi server |
| **Chain of Responsibility** | `UIInputRouter` + `IEscapeResponder` | ESC/back: đóng popup top trước; Confirm override |
| **Factory Method** | `TweenAnimation.GetTweenAnimation()`; `NumberPicker.PickNumber()` | Tạo worker tween; tạo `INumber` từ hằng/SO |
| **Object Pool** | `pooledInstances` (KeepLoaded); `ListPool` (Sum); pool `DamageNumberLayer` | HUD giữ instance; số sát thương pool trong 1 layer |
| **Memento** | `ISaveable` + `SaveItem` | Cache client: thế trận đã chọn, thiết lập UI (KHÔNG vàng/level) |
| **Decorator (reactive)** | `RuntimeNumber_SimpleBoosted`, `RuntimeBool_CompareNumber`, `RuntimeString_FromNumber` | "Nộ ≥ cost → bật Giác"; "120/200" HP; ((base+add)*mul)^pow ATK |
| **RefCount / RAII** | `IUIAssetProvider.RefCount`; `UIBlockService.PushBlock()` → `IDisposable` | `using(PushBlock("sending"))` chặn double-click chờ server |

---

## 3. BATTLE SLICE — áp dụng cụ thể (GDD §16 bước 1)

Geometry đã chốt ([[systems/battle-system]]): **Phe → 5 Tướng (hàng đợi tuần tự) → ≥4 Hàng (tuần tự) → 3 Nhóm/hàng → N lính/nhóm (mặc định 6, biến số)**.

### 3.1 Dữ liệu trận = ScriptableObject (Lớp 3)
| SO content | Base Luzart | Nội dung |
|---|---|---|
| `GeneralDef` | `AbstractScriptableContent` | id, tên Hán-Việt, `AssetStatDefinition[]` (统/勇/智/带兵量), `SkillDef`, `FormationLayout` mặc định, art |
| `TroopType` | `AbstractScriptableContent` | 步/骑/弓/谋/车, sprite `army/att\|def`, hệ số khắc chế (**chỉ hiển thị**) |
| `FormationLayout` | `AbstractScriptableContent` | **Strategy per-tướng**: vị trí/offset nhóm; `Row { shape, groups[3] }`; `shape = HangNgang\|CanhCung\|…` đổi theo tình huống |
| `SkillDef` | `AbstractScriptableContent` | rage cost, ref `warSkillName`+`tacticalGeneralPicMax` (cutscene), `eff/*` |
| `GeneralStat` (runtime) | `AssetStat`+`INumber` | `AssetNumber_SimpleBoosted(base × (1+Σbuff))` — **advisory preview** |

> [!warning] Cẩn trọng (xác minh trong code):
> - `Domain.Get<T>(id)` theo **id toàn cục** → 5 `GeneralDef` PHẢI lấy qua id, không `GetFirst<T>`.
> - `AssetNumber_Formula` trả **0**; `AssetBool_Constant` **ném NotImplemented**; `AssetCalculator_FromEquippedItems_*` gần như comment → **tự hiện thực** trước khi dùng cho gear.
> - `RuntimeStat.InitStat` dùng **gán `=`** (chỉ giữ calculator cuối — **bug**, sửa `+=`).

### 3.2 Vòng trận theo lượt = State Machine (BỔ SUNG — Luzart chỉ có lifecycle FSM)
Client KHÔNG giải đòn — FSM chỉ điều phối *trình diễn* + *cửa sổ input*:
```
Init → WaitServerTurn → DecisionWindow(~3-4s) → SubmitLocked → PlayingEvents → (TurnAdvanced↩ | BattleEnd)
        (nhận packet)    (mở bánh xe + Giác)     (đã gửi/Auto)   (replay tween)
```
- `DecisionWindow`: bật bánh xe 3 thế trận + Giác, đếm ngược; hết giờ → server Auto.
- `SubmitLocked`: đã gửi `ChooseStanceCommand`/`AwakenCommand`; `using(PushBlock("turn-submit"))` chặn đổi ý.
- `PlayingEvents`: chuỗi `BattleEvent` → `BattleEventPlayerService` phát tween tuần tự. **Không tính số.** (Commit-reveal là việc server — [[technical/client-server-architecture]] §12.3.)

### 3.3 Bánh xe 3 thế trận + Giác = Command + Strategy + UI
```
StanceWheelView : ViewT<BattleHudVM>
  ├─ SelectSwitchImage  (Strategy: Select(0|1|2) đổi sprite 突击/攻击/防御)   ← highlight
  ├─ SelectToggleImage  (nút Giác: Select(true) khi rage đủ → sprite sáng)   ← gating
  └─ onClick → CommandBus.Send(new ChooseStanceCommand(turnId, stance)) → NetworkService.SendAsync
```
- **Gating Giác (reactive):** `RuntimeBool_CompareNumber(rage, GreaterEqual, cost)` AND `RuntimeBool_Combined(All,[đủ rage, không cooldown, đến lượt])` → bind `Button.interactable`.
- Client **chỉ gửi ý định**; server kiểm hợp lệ rồi trả `RageTriggered`/`StanceRejected`.

### 3.4 Sự kiện server → ReactiveValues / EventBus → View
```
Socket packet → NetworkService → BroadcastService.Publish<TBattleEvent>(evt)
   ├─ Subscribe<AttackEvent>  → BattleEventPlayerService → SequenceTween.Show() (đòn, số bay)
   ├─ Subscribe<DamageEvent>  → BattleHudVM.hp.Set(newHp) → thanh máu mượt
   └─ Subscribe<RageTriggered>→ SkillCutsceneView (warSkillName + picMax + DOText)
```
- **EventBus** cho *sự kiện rời rạc*; **ReactiveValues** (`Variable<T>.Set`) cho *giá trị liên tục* (HP/Nộ).
> [!warning] `BroadcastService` không thread-safe + Delegate mạnh → mọi subscriber PHẢI `Unsubscribe` trong `OnTeardown`/`Stop` (leak nếu quên).

### 3.5 Render cây 5×≥4×3×N = Composite (View) + Strategy (Layout)
```
BattleFieldView : ViewT<BattleState>            // snapshot server → Setup
 └ SideView ×2 (Công/Thủ)
    └ GeneralSlotView ×5 (hàng đợi, đánh tuần tự — 1 active/phe)
       └ RowView ×≥4 (vào trận tuần tự) → FormationLayout.Row.shape (HangNgang|CanhCung…)
          └ GroupView ×3 → Soldier ×N (default 6, biến số)
```
- `ViewChilding` lan `Setup`/`Teardown` đệ quy: snapshot server → cả cây cập nhật. Tiếp viện (借兵) → `BattleQueueData` **nối cuối**.
> [!warning] `ViewChilding` dùng **reflection mỗi Setup** → cây lớn cần **cache `MemberInfo`** + pool `Soldier`. Bọc `using UnityEditor;` trong `#if UNITY_EDITOR` (ViewChilding.cs line 4) trước khi ship.

---

## 4. DÙNG NGAY vs CẦN BỔ SUNG

**✅ Dùng ngay (đã chạy thật):** `Domain`+`SceneRootManager`+Bag lifecycle · `BroadcastService` · `Runtime*` reactive · `ViewT/ViewChilding` · **LuzartUI** (default `DirectPrefabUIAssetProvider`, không cần Addressables) · `TweenAnimation`+`Select*`+`DOTweenTMP` · `ResourcePool` · Attributes/Editor.

**🔧 Cần bổ sung / hoàn thiện:**
| Thiếu | Việc |
|---|---|
| **Pre-impl chưa tồn tại** | `SceneRootManager` ref `UniverseView`/`Singleton<T>`/`GameUtil`/`ContentManager`/`UIManagerData` — **tự hiện thực** trước khi compile |
| **Networking** | `NetworkService` (socket trận + REST menu, Protobuf, reconnect/resync) — tự viết toàn bộ |
| **CommandBus** | gửi input lên server — tự viết `ICommand`+`CommandBus.Send → NetworkService` |
| **Battle turn FSM** | `BattleTurnFSM` (§3.2) — tự viết |
| **BattleEvent schema + player** | `BattleEventPlayerService` map event → tween — tự thiết kế mapping |
| **Gear calculators** | `AssetCalculator_FromEquippedItems_*` + `AssetNumber_Formula` + `AssetBool_Constant` — viết nốt |
| **Reactive Bool chưa khép kín** | nhiều `Asset*Bool` không raise — ưu tiên `Variable<T>`/`RuntimeBool_*` |
| **UIId enum CTXD** | thêm ID + registry entry cho city/map/battle/general/equipment/shop/tournament (2 chỗ) |

---

## 5. Lộ trình cắm Luzart vào MVP Battle Slice

| Phase | Mục tiêu | Mảnh Luzart | Bổ sung | Kiểm chứng |
|---|---|---|---|---|
| **P0 Bootstrap** | Scene Battle khởi động qua Domain | `SceneRootManager`, Bag, `Domain` | hiện thực `Singleton`/`Universe`/`ContentManager`/`GameUtil` | log "initialized Universe", 4 pha chạy |
| **P1 Data SO** | GeneralDef/TroopType/Formation/Skill là asset | `AbstractScriptableContent`, `AssetStat`, `FormationLayout` | id toàn cục; sửa `RuntimeStat.InitStat` | 5 `GeneralDef` resolve qua id; stat đúng |
| **P2 Network stub** | packet giả → EventBus | `BroadcastService` | `NetworkService` (mock replay) + `BattleEvent` schema | `Publish<AttackEvent>` → subscriber nhận |
| **P3 Render field** | cây 5×≥4×3×N từ snapshot | `ViewT/ViewChilding` | cache `MemberInfo`; pool `Soldier`; `Row.shape` cánh cung | `Setup(state)` vẽ đúng; teardown sạch |
| **P4 HUD + bánh xe** | 3 thế trận + Giác + đếm ngược | `UIBase`, `Select*`, `Runtime*`, `Tween` | `UIId.BattleHud`+registry; `CommandBus` | bấm thế trận gửi command; nút Giác theo rage |
| **P5 Turn FSM + replay** | vòng lượt + phát sự kiện | `SequenceTween`, `DOTweenTMP`, `UIBlockService` | `BattleTurnFSM`; `BattleEventPlayerService`; `DamageNumberLayer` | 1 trận đủ: decision→submit→replay→next |
| **P6 Polish** | reconnect/resync + cache | `ISaveable/SaveItem` | resync delta; cache thế trận | rớt giữa trận → resync replay lượt lỡ |

**Thứ tự:** P0→P1→P2 (P1/P2 song song); P3‖P4 sau P2; P5 gộp; P6 cuối.

---

## 6. Cảnh báo kiến trúc (xác minh từ code — phải tránh)

1. **Service Locator theo TYPE** bỏ qua id → nhiều instance cùng type lấy qua `Get<T>(id)`, **id duy nhất toàn cục**.
2. **Service ≠ Content store:** `GetService<T>` (kho `_services`) vs `Get<T>` (kho `_contents`); `AddService` bỏ id → không 2 service cùng type.
3. `Domain.Remove<T>(id)` overload chỉ-id **bug** → dùng `Remove<T>(instance, id)`.
4. **Thứ tự lifecycle:** resolve dependency chỉ trong `DoInitialize` (KHÔNG `DoInject`); Service Initialize+Start **trước** Content.
5. `ServiceManager` **không bọc try/catch** quanh `Initialize` (Content có) → service lỗi Initialize vỡ chuỗi.
6. **`Runtime*` là IDisposable + subscribe trong ctor** → `Dispose` khi rời hàng đợi/hết trận; `Dispose` không đệ quy.
7. **Explicit interface** ở ReactiveValues → gọi `.Value/.Changed/.Set` phải qua interface.
8. **So sánh `double` bằng `==`** trong guard `Set`/cache → epsilon/số-nguyên-hoá với giá trị server.
9. **`UIManager` Singleton+DDOL** phải ở root GameObject; đừng gọi `UIManager.Instance` trong `Awake`.
10. **`PoolOnClose` thực chất Destroy** (chỉ `KeepLoaded` pool thật); `DirectPrefab.Release` **không** giải phóng RAM → asset nặng cần Addressable provider tự viết.
11. **`ShowInInspectorEditor`** là CustomEditor **GLOBAL** → thu hẹp phạm vi trước khi merge.
12. **SO giữ state runtime qua phiên Play** trong Editor → reset/Terminate đúng.

---

## Tóm tắt 1 dòng
Dùng **`SceneRootManager`→`Domain`** làm composition root; **services** (Network/BattleEventPlayer/Input) + **SO content** (General/Troop/Formation/Skill) trong bag; **`Runtime*` reactive** đồng bộ HP/Nộ server↔UI; **`ViewT/ViewChilding` composite** render cây 5×≥4×3×N; **LuzartUI** lo HUD bánh xe + Giác; **TweenAnimation** diễn hoạt sự kiện server. **Tự bổ sung:** networking, CommandBus, BattleTurnFSM, BattleEvent schema, hiện thực nốt SO pre-impl. **Client KHÔNG giải đòn — chỉ gửi input + trình diễn event.**

---
## Backlinks
- [[overview]] · [[GDD]] §14
- [[technical/luzart-framework]] — catalog module Luzart
- [[technical/client-server-architecture]] — server-authoritative + §12 gia cố
- [[systems/battle-system]] — geometry trận đã chốt
