---
title: Framework Luzart — catalog module & cách dùng
category: technical
tags: [luzart, framework, scriptableobject, di, reactive, ui, design-patterns]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Framework Luzart — catalog module & cách dùng

**Luzart** (`Assets/Luzart/`, ~130 file C#) là framework Unity cá nhân của chủ dự án, làm nền cho **ScriptableObject Architecture + nhiều design pattern** của client CTXD. Trang này là **catalog tham chiếu**: mỗi module cung cấp gì, thể hiện pattern nào, API, dùng vào đâu, và **cảnh báo đã xác minh từ code thật**. Cách ráp tất cả thành kiến trúc client: xem [[technical/client-architecture-patterns]].

> [!warning] Mức độ hoàn thiện không đồng đều
> Một số phần **đã chạy thật** (DI, EventBus, ReactiveValues, LuzartUI, Tween/Select), một số **là demo/pre-impl chưa xong** (`Content/ThanhDemo` calculators, `IChange.cs`, các file `Singleton`/`UniverseView`/`GameManagerData` được tham chiếu nhưng **chưa tồn tại**). Mỗi module ghi rõ ở "Cảnh báo". Code `.cs` là nguồn sự thật; doc UI (`luzart-ui-base-technical.md`, README) là proposal, **lệch** implementation.

> [!info] Dọn code để compile (2026-06-29)
> Project trước đó **không compile** do nhiều file demo/pre-impl tham chiếu type **chưa tồn tại** (Odin/`Sirenix`, `StatType`, `ItemConfig`, `AssetEquipmentSlot`, `ICost*`, `GameManagerData`, `UIManagerData`, `Singleton<>`, `UniverseView`, `FindItemEditor`). Theo chỉ đạo của chủ dự án ("cái gì không có thì bỏ đi"), đã **gỡ**: `Content/ThanhDemo/` (toàn bộ — đã được `ReactiveValues` thay thế), `Content/DataResources/` (toàn bộ), `Content/Universe/Universe.cs`, `Content/Universe/SceneRootManager.cs`, và 2 nút editor `FindAll*` trong các Bag. Đã **giữ + sửa** (Odin → attribute Luzart tự có `[Button]`/`[ReadOnly]`): `SaveService`, `ServiceBag`, `ContentBag`. Sau dọn: **cả 3 assembly (Assembly-CSharp, -firstpass, -Editor) compile 0 lỗi** (xác minh offline bằng Roslyn của Unity — xem memory `offline-compile-verify`). Pattern/blueprint của phần bị gỡ vẫn giữ trong trang này để hiện thực lại sau. Chi tiết: [[decisions/luzart-compile-cleanup-2026-06-29]].

---

## 1. Content/DI — Domain, EventBus, Content (LÕI)
**Để làm gì:** DI/Service-Locator thủ công (không reflection) + lõi SO Architecture. `Domain` chứa 2 loại đơn vị: **Service** (logic) và **Content** (data/đối tượng), mỗi cái có vòng đời chuẩn hoá **Inject → Initialize → Start → Stop → Terminate**. `BroadcastService` (EventBus) là pub/sub theo Type.

**Pattern:** Service Locator/DI · SO Architecture · Template Method · Observer/Pub-Sub · Lifecycle FSM · Singleton · Composite/Registry.

**Type chính:**
- `IDomain`/`Domain` — container: `Add/Get<T>/GetFirst<T>/Get<T>(id)/GetAll<T>/AddService/GetService/Inject`. Resolve theo **TYPE** (linear, lấy cái đầu khớp).
- `IContent` / `AbstractScriptableContent` (SO) / `AbstractMonoBehaviorContent` (có `DoUpdate`) — đơn vị data; override hook `DoInitialize/DoInject/DoStartContent/DoStopContent/DoTerminate` (Template Method).
- `IService` / `AbstractScriptableService` — đơn vị logic; `DoStartContent`/`DoStopContent`.
- `BroadcastService` — `Publish<T>/Subscribe<T>/Unsubscribe<T>` (Dictionary<Type,List<Delegate>>; `Publish` duyệt `.ToArray()` nên unsubscribe-trong-handler an toàn).
- `IValue<T>`/`Variable<T>` (IChange.cs) — reactive value cấp ô (epsilon comparer). ⚠️ phần lớn IChange.cs bị comment; `Value<T>` không phát `Changed`.

**Dùng:**
```csharp
public class GeneralRosterData : AbstractScriptableContent {
    NetworkService _net;
    protected override void DoInitialize() => _net = _domain.GetService<NetworkService>(); // resolve ở Initialize, KHÔNG ở Inject
}
bus.Subscribe<AttackEvent>(OnAttack); bus.Publish(new AttackEvent{...}); // Observer
```

**Áp dụng CTXD:** khung khởi động client; Service = Network/BattleEventPlayer/Input; Content = GeneralDef/Formation/City; EventBus = luồng `BattleEvent` server → view.

> [!warning] Cảnh báo (xác minh từ code):
> - `GetFirst<T>/GetService<T>` **bỏ qua id** → nhiều instance cùng type PHẢI lấy qua `Get<T>(id)`; **id duy nhất toàn cục**.
> - Service lấy qua `GetService<T>` (kho `_services`), content qua `Get<T>` (kho `_contents`) — KHÔNG lẫn. `AddService` bỏ id → không thể 2 service cùng type.
> - `Remove<T>(id)` overload chỉ-id có **bug** (không xoá `_instances`); dùng `Remove<T>(instance,id)`.
> - `DoInject` chạy ngay khi `Add` (content khác có thể chưa Add) → chỉ resolve ở `DoInitialize`.
> - `BroadcastService` **không thread-safe** + giữ **Delegate mạnh** → bắt buộc `Unsubscribe` khi Stop/Terminate, nếu không leak.

---

## 2. Content/Universe + Saveable — composition root, services, save
**Để làm gì:** `SceneRootManager` (Singleton) dựng `Domain`, nạp `ServiceBag[]`/`ContentBag[]` (SO manifest gom asset), chạy lifecycle. `Universe` = root context tổng hợp data con cho View. `SaveService` lưu/đọc JSON (`persistentDataPath`) các content `ISaveable`.

**Pattern:** Composition Root · Service Locator · Registry/Manifest (Bag) · Lifecycle · Memento (SaveItem) · Singleton.

**Type chính:** `ServiceManager`/`ContentManager` (InstallBags + InitializeAndStart, teardown đảo thứ tự), `ServiceBag`/`ContentBag` (SO list — nút editor auto-find ĐÃ GỠ vì gọi `FindItemEditor` không tồn tại), `ISaveable`/`SaveItem` (union value gọn), `SaveService` (UniTask async, auto-save interval, delta-save theo hash). ⚠️ `SceneRootManager` (composition root) và `Universe` ĐÃ GỠ 2026-06-29 (tham chiếu `Singleton<>`/`UniverseView`/`GameManagerData`/`UIManagerData` chưa tồn tại) — cần viết lại bootstrap khi dựng scene thật.

**Dùng:**
```csharp
// bootstrap (đã có trong SceneRootManager.Start)
var domain = new Domain();
new ServiceManager(domain).InstallBags(_serviceBags); // add+inject services
new ContentManager(domain).InstallBags(_contentBags); // add+inject contents
// → InitializeAndStart() services trước, contents sau
public class PlayerCache : AbstractScriptableContentSaveable {
    protected override IEnumerable<SaveItem> DoSave(){ yield return new SaveItem("lastStance", _stance); }
}
```

**Áp dụng CTXD:** điểm vào mỗi scene (Boot/ChủThành/Battle); `SaveService` chỉ cache client-side (thế trận đã chọn, thiết lập UI) — **KHÔNG lưu vàng/level** (server-authoritative).

> [!warning] - **ĐÃ GỠ (2026-06-29):** `UniverseView`, `GameManagerData`, `UIManagerData`, `Singleton<T>`, `FindItemEditor` chưa bao giờ tồn tại; các file tham chiếu chúng (`Universe.cs`, `SceneRootManager.cs`, 2 nút `FindAll*`) đã bị gỡ để compile được. Khi cần bootstrap thật phải tự hiện thực `Singleton<T>` + composition root mới.
> - `ServiceManager` **không bọc try/catch** quanh `Initialize` (chỉ bọc Start) → service lỗi lúc Initialize làm vỡ chuỗi.
> - `SaveService` chỉ lưu `ISaveable` đồng thời là `IContent`; `OptimizedSaveItem` parse float theo culture mặc định (rủi ro dấu phẩy thập phân → dùng InvariantCulture); `Save()` chạy trên ThreadPool nên không đụng Unity API.

---

## 3. ReactiveValues — observable Number/Bool/String (Observer)
**Để làm gì:** giá trị reactive thuần C# (POCO, IDisposable) — read-only qua `INumber/IBool/IString` (`Value` + `event Changed`), ghi qua `...WithSet`. Các node `Runtime*` compose thành cây phụ thuộc, tự phát `Changed` khi con đổi → bind thẳng UI không polling.

**Pattern:** Observer · Composite (Sum/Combined/Concat) · Decorator (SimpleBoosted/FromNumber/CompareNumber) · Adapter (Number→Bool, Number→String) · Interface Segregation · Strategy (Combine/Comparison mode) · RAII/Disposable.

**Type chính:** `NumberValue/BoolValue/StringValue` (lá), `RuntimeNumber_Variable` (lá ghép cây được), `RuntimeNumber_Sum` (Composite, mượn `ListPool`), `RuntimeNumber_SimpleBoosted` (`((base+add)*mul)^pow`, **có cache**), `RuntimeBool_Combined` (Any/All), `RuntimeBool_CompareNumber` (Number→Bool), `RuntimeString_FromNumber/_Concat`.

**Dùng:**
```csharp
INumberWithSet baseAtk = new NumberValue(100), gear = new RuntimeNumber_Variable(0);
var total = new RuntimeNumber_Sum(new INumber[]{ baseAtk, gear });
INumber atk = new RuntimeNumber_SimpleBoosted(total, null, new NumberValue(1.2)); // ((..)*1.2)
IBool canAwaken = new RuntimeBool_CompareNumber(rage, ComparisonMode.GreaterEqual, cost);
((IBool)canAwaken).Changed += b => giacButton.interactable = ((IBool)b).Value;
((INumberWithSet)gear).Set(50);          // cả cây phát Changed → UI tự update
((IDisposable)atk).Dispose();            // BẮT BUỘC khi hết vòng đời
```

**Áp dụng CTXD:** HP/Nộ/sĩ khí (thanh fill), vàng/lương (text), gating nút Giác/mua/unlock. Server gửi giá trị → `Set` lá → lan lên UI (client không giải đòn).

> [!warning] - **Explicit interface** khắp nơi: phải cast qua `INumber/IBool/...` mới gọi `Value/Changed/Set`.
> - `Dispose` **không đệ quy** — tự dispose từng node; lá `NumberValue` không Dispose.
> - So sánh `double` bằng `==` trong guard `Set`/cache → nhạy sai số float (cân nhắc epsilon/số-nguyên-hoá).
> - `Sum/Concat/Combined` tính lại mỗi lần đọc `Value` (không cache như SimpleBoosted).

---

## 4. Content/ThanhDemo + DataResources — SO Architecture cho chỉ số (HÌNH MẪU — ĐÃ GỠ KHỎI CODE)
> [!warning] Các file `.cs` của `Content/ThanhDemo/` + `Content/DataResources/` đã bị **GỠ 2026-06-29** (không compile: tham chiếu Odin/`StatType`/`ItemConfig`/`AssetEquipmentSlot`/`ICost*` chưa tồn tại; phần reactive đã được [[#3. ReactiveValues — observable Number/Bool/String (Observer)|ReactiveValues]] thay thế). Mục này GIỮ LẠI như **blueprint** để hiện thực lại khi cần (chỉ số tướng, cộng đồ, tài nguyên). Code mẫu bên dưới là tham chiếu lịch sử, KHÔNG còn trong project.

**Để làm gì:** hình mẫu SO Architecture: mỗi "số" là `INumber`, hiện thực qua **2 họ song song** — `Asset*` (ScriptableObject, designer cấu hình, gắn DI) và `Runtime*` (POCO code, IDisposable). `AssetCalculator` = **Strategy** (tính từ stat/trang bị/công thức). `AssetStat` = `AssetStatDefinition` (metadata) + `INumber`. `ResourcePool` = ô số có persistence (vàng/ngọc).

**Pattern:** Strategy (Calculator) · Composite · Observer · Template Method · Adapter (NumberPicker) · Definition/Value split (Flyweight) · Object Pool · Memento.

**Type chính:** `AssetNumber` (+`_Constant/_Aggregation/_SimpleBoosted/_Calculated`), `AssetCalculator(_Stat)` (Strategy: `Add/MultiBase/MultiAll/Custom`), `NumberPicker` (Adapter Constant↔SO ref), `RuntimeNumber_FromUpgradeSkill` (pipeline nền+buff chạy thật), `AssetStat`/`RuntimeStat`/`AssetStatDefinition`, `ResourceDefinition`/`ResourcePool`.

**Dùng:**
```csharp
// nền + buff từ skill (giống RuntimeNumber_FromUpgradeSkill)
var baseAtk = new RuntimeNumber_Constant(100); var flat = new Number(20); var pct = new Number(1.15);
INumber final = new RuntimeNumber_SimpleBoosted(baseAtk, flat, pct);   // 138
ICalculator c = new StatCalculator(atkDef, ModeCalculation.MultiAll, new NumberPicker(NumberMode.Constant, .15)); // +15%
```

**Áp dụng CTXD:** chỉ số tướng 统/勇/智/带兵量 (`AssetStatDefinition` + `AssetNumber_SimpleBoosted`); cộng đồ 6 ô (`AssetCalculator_FromEquippedItems_*`); tài nguyên (`ResourcePool`); **sát thương DỰ ĐOÁN client** (chỉ hiển thị).

> [!warning] - **DEMO/CHƯA XONG:** `AssetNumber_Formula.DoGetValue()` **trả 0**; `AssetBool_Constant` **ném NotImplementedException**; `AssetCalculator_FromEquippedItems_*` **gần như comment hết**. Phải viết nốt.
> - `RuntimeStat.InitStat` dùng **gán `=`** trong vòng lặp → chỉ giữ calculator cuối (**BUG**; sửa thành `+=`/theo Add-MultiAll).
> - Nhiều `Asset*Bool` nuôi `Changed` nhưng **không raise** (reactive Bool chưa khép kín). Cycle-detection trong `AssetNumber` bị bypass (gọi thẳng `DoGetValue`).
> - SO chỉ chạy đúng nếu đi qua `IContent.Initialize/Start`; đọc `.Value` khi chưa Initialize → NRE.

---

## 5. Content/View — View layer (data binding, MVVM-lite)
**Để làm gì:** bind data vào MonoBehaviour qua `Setup(data)/Teardown()`. `ViewT<T>` type-safe; `ViewChilding` rót data con xuống view con bằng **reflection theo tên member** → cây view phân cấp. **KHÔNG reactive tự động** — subclass tự subscribe `INumber.Changed` trong `OnSetup`.

**Pattern:** Template Method · Composite (cây view, Setup xuôi/Teardown ngược) · Bridge (explicit interface) · MVVM-lite (manual pull).

**Type chính:** `IView`/`IView<T>`, `View` (abstract), `ViewT<T>` (giữ `_data`, hook `OnSetup/OnTeardown/Refresh`), `ViewChilding` (path reflection + drawer dropdown).

**Dùng:**
```csharp
public class GeneralView : ViewT<GeneralVM> {
    protected override void OnSetup(){ Data.Hp.Changed += _=>Refresh(); Refresh(); } // tự nối reactive
    protected override void OnTeardown(){ Data.Hp.Changed -= _=>Refresh(); }
    public override void Refresh() => _hpText.text = Data.Hp.Value.ToString();
}
// ViewChilding: path reflect trên KIỂU VIEW cha → expose `public StatVM Stats => Data.Stats;` rồi chọn path="Stats"
```

**Áp dụng CTXD:** panel tướng/trang bị; **cây render trận** `BattleFieldView → SideView×2 → GeneralSlotView×5 → RowView×≥4 → GroupView×3 → Soldier×N` (Composite lan `Setup` từ snapshot server).

> [!warning] - **KHÁC LuzartUI**: `View/ViewT` lo *bind data cây con*; `UIBase` lo *show/hide/lane/stack*. Dùng song song (UIBase host ViewT).
> - **Reflection mỗi Setup** → cây battle lớn cần **cache `MemberInfo`**/pool `Soldier`. `DoInternalSetup` ném exception khi data null/sai kiểu.
> - `using UnityEditor;` ở scope file `ViewChilding.cs` (line 4) **không bọc `#if UNITY_EDITOR`** → rủi ro vỡ build player; nên bọc lại.

---

## 6. UIFramework/LuzartUI — UI framework (async, lane, config-driven)
**Để làm gì:** điều phối mở/đóng UI **async-first** (UniTask), **config-driven** (`UIRegistrySO`), **6 lane** (WorldOverlay/Screen/Hud/Popup/System/Toast) mỗi lane stack riêng (pause/resume LIFO), **state machine** view, cache 3-tier, asset provider ref-counted, popup queue, input blocker, ESC routing. Code chỉ gọi `ShowAsync/HideAsync` + `UIId` + data.

**Pattern:** Facade+DI (`IUIService` mock được) · SO Config-driven · State Machine (`UIState` 10 trạng thái) · Strategy (`IUIAssetProvider`, CachePolicy) · Command/async · Chain of Responsibility (`UIInputRouter`/`IEscapeResponder`) · Object Pool · Observer · Reference Counting · RAII (`PushBlock`) · Producer-Consumer (`UIPopupQueue`) · Composite/Stack (`UILayerStack`).

**Type chính:** `UIManager`(`IUIService`, Singleton+DDOL), `UIBase`/`UIBase<TData>` (hook `OnCreate/OnBeforeShow/OnShown/OnHidden/AnimateShow…`), `UIRegistrySO`+`UIConfig` (Id/StringId/AssetRef/Lane/CachePolicy…), `UIContext` (payload), `UIHandle`, `UIId`/`UILayer`/`UIState`/`UICachePolicy`, `UILayerStack`, `UIPopupQueue`, `UIBlockService`, `IUIAssetProvider`/`DirectPrefabUIAssetProvider`.

**Dùng:**
```csharp
var inv = await UIManager.Instance.ShowAsync<InventoryUI>(UIId.Inventory, new UIContext(data), ct: ...);
await UIManager.Instance.ShowByStringIdAsync(msg.type, new UIContext(msg.data)); // server-driven
UIManager.Instance.EnqueuePopupAsync(UIId.QuestReward, ctx, priority:100).Forget(); // queue
using (UIManager.Instance.PushBlock("sending")) { await Net.SendAsync(cmd); }       // RAII block
```

**Áp dụng CTXD:** màn Screen (CityMain/WorldMap/Battle, KeepLoaded); Popup (Tướng/Trang bị/Shop/Giải đấu, pause/resume); HUD (bánh xe thế trận + Giác, flat); WorldOverlay (`DamageNumberLayer` tự pool, **không** ShowAsync mỗi đòn); System (Loading/Disconnect, PreloadOnBoot); server-driven popup qua `StringId`; `PushBlock` chờ server xác nhận lệnh.

> [!warning] - **DOC LỆCH CODE:** README/docs nói Addressables nhưng default thật là `DirectPrefabUIAssetProvider` (prefab drag-drop, **không** Addressables; preload/download là no-op). `Release` **không giải phóng RAM** → asset nặng (battle art) cần tự viết Addressable provider.
> - `CachePolicy.PoolOnClose` thực chất Destroy (chỉ `KeepLoaded` mới pool thật). UI cần nhiều bản (Toast/DamageNumber) phải `AllowMultiInstance=true`.
> - `UIInputRouter` đọc legacy `Input` → cần adapt nếu bật Input System. `UIId` enum chỉ có System range → **tự thêm** ID + registry entry (2 chỗ). `UIManager` phải ở root GameObject (DDOL).

---

## 7. TweenAnimation + NewBaseSelect + Attributes/Editor — presentation & authoring
**Để làm gì:** (1) **TweenAnimation** = wrap DOTween data-driven (mỗi loại animation 1 worker chọn qua enum, ghép `SequenceTweenAnimation`, auto-trigger `TweenAnimationCaller`). (2) **NewBaseSelect** = Strategy "chọn 1-trong-N" (`SelectSwitch`) / "bật-tắt" (`SelectToggle`) áp lên GameObject/Image/TMP/UnityEvent. (3) **Attributes/Editor** = custom inspector (`ShowIf/Dropdown/Slider/ProgressBar/ReadOnly/Button/ShowInInspector`) cho authoring SO.

**Pattern:** Strategy · Factory Method · Template Method · Composite (Sequence) · Command (`TweenAnimationCaller`, `[Button]`) · Adapter (`DOTweenTMPExtensions` typewriter) · State (`SelectToggle`) · Attribute-driven authoring.

**Type chính:** `TweenAnimation`/`SequenceTweenAnimation`/`TweenAnimationCaller`, `DOTweenTMPExtensions.DOText` (typewriter giữ rich-text, không alloc), `BaseSelect`/`SelectSwitch*`/`SelectToggle*` (`IBaseSwitch.Select(int)`/`IBaseToggle.Select(bool)`), `ConditionalAttributes`/`ExtendedAttributes` + drawers.

**Dùng:**
```csharp
IBaseSwitch stance = GetComponent<SelectSwitchImage>(); stance.Select(1);   // highlight 1/3 thế trận
var giac = giacBtn.GetComponent<SelectToggleImage>(); giac.Select(rageReady);
battleLog.DOText("Quan Vũ tung Xích Diễm Mê Trận!", 1.2f);                   // typewriter
[ShowIf(nameof(isArcher), true)] public RowShape frontShape;                 // authoring SO
```

**Áp dụng CTXD:** bánh xe 3 thế trận + nút Giác (Select); tab UI; map mỗi `BattleEvent` → 1 `SequenceTweenAnimation.Show()`; battle-log typewriter; authoring SO tướng/troop/formation (ShowIf/Dropdown/Slider/Button).

> [!warning] - `ShowInInspectorEditor` là `[CustomEditor(typeof(MonoBehaviour), true)]` **GLOBAL** → xung đột nếu CTXD cần custom editor riêng; thu hẹp trước khi merge.
> - `SelectSwitch/Toggle*` truy cập mảng song song không null-check đầy đủ → điền mảng cẩn thận. Worker tween `new` mỗi `Show()` (alloc) → pool nếu spam.

---

## Tổng kết pattern → module (tra nhanh)
| Pattern | Module Luzart |
|---|---|
| DI / Service Locator / Composition Root | §1 Domain, §2 SceneRootManager/Bag |
| Observer / Broadcast | §1 EventBus, §3 ReactiveValues |
| Strategy | §4 AssetCalculator, §7 Select, FormationLayout |
| State Machine | §6 UIState; (battle-turn FSM = tự viết) |
| Composite | §3 Sum, §4 Aggregation, §5 ViewChilding |
| Command | §6 async, §7 TweenCaller; (CommandBus = tự viết) |
| Template Method | §1/§2 Abstract*, §3 Runtime*, §5 ViewT |
| Object Pool / RefCount / RAII | §6 UIManager/BlockService |
| Memento | §2 SaveService/ISaveable |

→ Cách ráp thành kiến trúc client + lộ trình MVP: [[technical/client-architecture-patterns]].

---
## Backlinks
- [[overview]] · [[GDD]] §14
- [[technical/client-architecture-patterns]] — blueprint dùng Luzart
- [[technical/client-server-architecture]] — server-authoritative
