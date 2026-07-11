---
title: Luzart — Content/DI (Domain, EventBus, Content/Service lifecycle, Bags)
category: technical
tags: [luzart, di, scriptableobject, domain, eventbus, lifecycle, bootstrap]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `Content/DI` + `Content/Universe` — the SO/DI core

> [!info] Đọc trực tiếp từ code 2026-06-29 (post-cleanup). Đây là **lõi kiến trúc** của Luzart: một **Service Locator thủ công** + **SO Architecture**. Mọi "data/đối tượng" là **Content**, mọi "logic/hệ thống" là **Service**, gom vào một `Domain`. Khớp triết lý chủ dự án: *cái gì cũng là ScriptableObject* → các SO này được nạp vào `Domain` qua **Bag** (manifest SO).

## Folder làm gì
`Assets/Luzart/Content/DI/` (8 file) + `Assets/Luzart/Content/Universe/` (3 file) cung cấp: container `Domain`, hai vòng đời `IContent`/`IService`, EventBus (`BroadcastService`), 3 lớp base SO/Mono, và cặp **Bag + Manager** để bootstrap.

## Các type chính (chữ ký thật)

### `IDomain` / `Domain` — container ([Domain.cs](Assets/Luzart/Content/DI/Domain.cs))
```csharp
void Add<T>(T instance, string id = null);      // thêm CONTENT: lưu _instances[id] nếu có id, _contents.Add, rồi Inject(instance) NGAY
bool Remove<T>(T instance, string id = null);   // xoá khỏi _contents (+ _instances nếu id)
T   GetFirst<T>();                              // quét tuyến tính _contents, lấy cái đầu khớp T
T   Get<T>(string id = null);                   // id rỗng → GetFirst<T>; có id → _instances[id]; thiếu → LogError + default
bool TryGet<T>(out T result, string id = null);
IReadOnlyList<T> GetAll<T>();                   // _contents.OfType<T>()
void AddService<T>(T service, string id=null);  // thêm SERVICE: _services.Add + service.Inject(this)
T   GetService<T>(string id = null);            // quét _services, lấy cái đầu khớp T
void Inject(object target);                     // nếu target is IContent → target.Inject(this)
void InitializeAll(); StartAll(); StopAll(); TerminateAll(); // CHỈ duyệt _contents (KHÔNG đụng _services)
```
- **Content** lưu ở `_contents` (+ `_instances` cho id). **Service** lưu riêng ở `_services`. Hai kho KHÔNG lẫn nhau.
- **Resolve theo TYPE** (linear, lấy cái đầu). Muốn nhiều instance cùng type → phải dùng id và `Get<T>(id)`.

> [!warning] Bug & bẫy đã xác minh từ code
> - `Domain.InitializeAll/StartAll/StopAll/TerminateAll` chỉ duyệt **`_contents`**, KHÔNG duyệt `_services` → vòng đời service phải do `ServiceManager` chạy (xem dưới), KHÔNG do `Domain`.
> - `Add<T>` gọi `Inject(instance)` **ngay khi Add** → lúc đó content khác có thể chưa được Add. ⇒ **resolve phụ thuộc ở `DoInitialize`, KHÔNG ở `DoInject`**.
> - Overload `Remove<T>(string id)` (chỉ-id) có **bug**: gọi `GetFirst<T>()` (bỏ qua id) và **không** xoá khỏi `_instances`. Dùng `Remove<T>(instance, id)` thay thế.
> - `GetService<T>`/`GetFirst<T>` **bỏ qua id** (id chỉ có tác dụng ở `Get<T>(id)`).

### `IContent` / `AbstractScriptableContent` (SO) / `AbstractMonoBehaviorContent` (Mono)
Vòng đời chuẩn hoá (Template Method) — override các hook `Do*`:
| Interface | Base SO ([AbstractScriptableContent.cs](Assets/Luzart/Content/DI/AbstractScriptableContent.cs)) | Base Mono ([AbstractMonoBehaviorContent.cs](Assets/Luzart/Content/DI/AbstractMonoBehaviorContent.cs)) |
|---|---|---|
| `Inject(domain)` | `DoInject(domain)` (set `_domain`) | `DoInject` |
| `Initialize()` | `DoInitialize()` | `DoInitialize()` (+ set `_isInitialized`) |
| `Start()` | `DoStartContent()` | `DoStart()` |
| `Stop()` | `DoStopContent()` | `DoStop()` |
| `Terminate()` | `DoTerminate()` | `DoTerminate()` |
| — | — | `DoUpdate(dt)` mỗi frame khi đã started+initialized |
- `Id`: SO trả `_id` (chỉ tự sinh khi có `ODIN_INSPECTOR` — KHÔNG có ⇒ tự đặt/đặt theo asset name); Mono `OnValidate` đặt `_id = name`, fallback type name.
- ⚠️ Tên hook KHÁC nhau: SO = `DoStartContent`, Mono = `DoStart`. Đừng nhầm.

### `IService` / `AbstractScriptableService` (SO) ([IService.cs](Assets/Luzart/Content/Saveable/IService.cs))
```csharp
interface IService { string Id; IDomain MyDomain; void Inject(IDomain); void Initialize(); void StartService(); void StopService(); void Terminate(); }
```
- ⚠️ Service dùng **`StartService`/`StopService`** (không phải `Start`/`Stop`). Base SO map sang hook `DoInitialize/DoStartContent/DoStopContent/DoTerminate`.

### `BroadcastService` — EventBus ([EventBus.cs](Assets/Luzart/Content/DI/EventBus.cs))
```csharp
void Publish<T>(T evt);      // duyệt list.ToArray() → unsubscribe-trong-handler an toàn
void Subscribe<T>(Action<T> cb);   // dedup
void Unsubscribe<T>(Action<T> cb);
```
> [!warning] Giữ **Delegate mạnh** + KHÔNG thread-safe → **bắt buộc `Unsubscribe`** ở `Stop/Terminate`, nếu không leak. Tự `new BroadcastService()` và `domain.AddService(bus)` để dùng chung.

### Bootstrap: `ContentBag`/`ServiceBag` + `ContentManager`/`ServiceManager`
- `ContentBag` ([ContentBag.cs](Assets/Luzart/Content/Universe/ContentBag.cs)) — SO `[CreateAssetMenu("Luzart/ContentBag")]` chứa `List<ScriptableObject> allContents`; `AllContents => allContents.OfType<IContent>()`. **Kéo thả các SO content vào list bằng tay** (nút auto-find đã bị gỡ).
- `ServiceBag` ([ServiceBag.cs](Assets/Luzart/Content/Universe/ServiceBag.cs)) — SO chứa `List<AbstractScriptableService> services`. ⚠️ **KHÔNG có `[CreateAssetMenu]`** → tự thêm attribute hoặc tạo asset bằng cách khác.
- `ContentManager`/`ServiceManager` — `InstallBags(bags)` (add + inject vào Domain) rồi `InitializeAndStart()` (Initialize hết → Start hết). `StopAndTerminate()` chạy ngược.

> [!warning] `ServiceManager.InitializeAndStart` chỉ bọc try/catch quanh **Start**, KHÔNG quanh **Initialize** → service lỗi lúc Initialize làm vỡ chuỗi. `ContentManager` bọc cả hai.

## Cách bootstrap một scene (composition root tự viết)
`SceneRootManager`/`Universe` **đã bị gỡ** ([[decisions/luzart-compile-cleanup-2026-06-29]]) → tự viết một MonoBehaviour root:
```csharp
public sealed class GameRoot : MonoBehaviour {
    [SerializeField] ServiceBag[] _serviceBags;
    [SerializeField] ContentBag[] _contentBags;
    void Awake() {
        var domain = new Domain();
        domain.AddService(new BroadcastService());          // EventBus dùng chung
        var sm = new ServiceManager(domain); sm.InstallBags(_serviceBags); sm.InitializeAndStart();
        var cm = new ContentManager(domain); cm.InstallBags(_contentBags); cm.InitializeAndStart();
        // spawn view gốc rồi domain.Add(view) (xem [[technical/luzart-view]])
    }
}
```

## Quan hệ với triết lý "cái gì cũng là ScriptableObject"
- **Data game = SO** kế thừa `AbstractScriptableContent` (tướng, binh chủng, trận pháp, định nghĩa visual…). Gom vào `ContentBag` → `Domain` quản vòng đời + cho mọi nơi resolve qua `domain.Get<T>()`.
- **Hệ thống = SO** kế thừa `AbstractScriptableService` (Network, BattlePlayer, Save…). Gom vào `ServiceBag`.
- **Visual** KHÔNG nằm ở DI — nằm ở [[technical/luzart-view]] (SO ref prefab → spawn). DI chỉ cung cấp data + service cho view đó.

---
## Backlinks
- [[technical/luzart-framework]] — hub catalog
- [[technical/luzart-view]] — lớp View dùng data từ Domain
- [[technical/luzart-saveable]] — Save dùng `_domain.GetAll<ISaveable>()`
- [[decisions/luzart-compile-cleanup-2026-06-29]] — SceneRootManager/Universe bị gỡ
