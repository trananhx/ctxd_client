---
title: Luzart — UIFramework/LuzartUI (async lane-based UI)
category: technical
tags: [luzart, ui, uimanager, uibase, registry, lane, async, unitask]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `UIFramework/LuzartUI` — UI async, lane-based, config-driven

> [!info] `namespace Luzart`. Khung UI **async-first (UniTask)**, **6 lane** (stack riêng), điều khiển bằng `UIRegistrySO` (map `UIId` → prefab + metadata). Code chỉ gọi `ShowAsync/HideAsync`. Hợp triết lý: visual nằm trong **prefab**, `UIConfig` chỉ giữ metadata khung đọc lúc chạy.
> **Assembly riêng** (KHÁC phần Luzart còn lại nằm trong Assembly-CSharp): `Runtime/LuzartUI.asmdef` (ref **UniTask**) + `Runtime/Loading/Addressables/LuzartUI.Addressables.asmdef` (opt-in, `defineConstraints: ["LUZART_ADDRESSABLES"]`, tự loại khi thiếu package). ⇒ code game gọi LuzartUI phải nằm trong assembly có **tham chiếu `LuzartUI`** (asmdef game ref `LuzartUI`, hoặc dựa Auto-Referenced).
> [!warning] DOC ≠ CODE: `luzart-ui-base-technical.md` là **proposal cũ** (UIView/UIHandle<T>/lane-controller… KHÔNG có thật). README lệch cây file + sai chỗ đặt UIManager. **Code là sự thật.**

## UIManager ([UIManager.cs](Assets/Luzart/UIFramework/LuzartUI/Runtime/Core/UIManager.cs))
`UIManager : MonoBehaviour, IUIService`. **Singleton lazy-find, KHÔNG tự tạo** (`Instance => FindObjectOfType`; thiếu → null). Phải đặt 1 `UIManager` trong scene. `Awake`: DontDestroyOnLoad **chỉ khi là root GameObject** (có parent → skip, vỡ persistence); cần `registry` (null → tắt). Fields: `registry`, `useAddressables`(false), 6 lane root, `inputRouter?`, `blockService?`, `bootPreloadLabels`.
- `ShowAsync(UIId id, UIContext ctx, UIShowOptions opts, CancellationToken ct)` → `UniTask<UIHandle>`; `ShowAsync<T>(...)` → `UniTask<T>` (`handle.View as T`); `ShowByStringIdAsync(string, ...)` (server-driven). Coalesce show trùng UIId; nếu đã hiện & !ForceReload → đưa lên top + nối callback. Thiếu config → ném `KeyNotFoundException`.
- `HideAsync(handle|id)`, `CloseTopPopupAsync`, `CloseAllPopupsAsync`, `HideAllExceptSystemAsync` (gọi trước LoadScene).
- `EnqueuePopupAsync(...priority)` (xếp hàng popup tuần tự), `ShowToastAsync(msg, ToastStyle, dur)`, `PushBlock(reason)` → `IDisposable` (no-op + warning nếu thiếu `blockService`).
- Preload/Release: `PreloadAsync/PreloadByLabelAsync/Release(UIId)` — **chỉ thật khi dùng Addressables provider**.
- Events: `OnShown/OnHidden/OnLoadFailed/OnReleased…`.

## UIBase / UIBase<TData>
`UIBase : MonoBehaviour, IEscapeResponder` — vòng đời async (override hook, mặc định no-op):
`OnCreateAsync(ctx,ct)` (1 lần) → `OnBeforeShowAsync` → **`AnimateShowAsync(instant,ct)`** → `OnShownAsync` → (`OnPauseAsync`/`OnResumeAsync` khi bị/ hết che) → `OnBeforeHideAsync(reason)` → **`AnimateHideAsync`** → `OnHiddenAsync` → `OnRelease()` (**sync void**). Đóng: nút prefab gọi `OnCloseButtonClicked()` → `OnCloseRequested` → manager hide (`UserRequested`). `HandleEscape()` nếu `Config.DismissByEscape`.
`UIBase<TData> : UIBase` ([UIBaseGeneric.cs](Assets/Luzart/UIFramework/LuzartUI/Runtime/Core/UIBaseGeneric.cs)): `protected TData Data`; `sealed override OnBeforeShowAsync(ctx)` cast `Data = ctx.Data as TData` (sai kiểu → **log error + chạy tiếp với null**, không ném) rồi gọi `OnBeforeShowAsync(TData, ct)`. Override các hook typed: `OnBeforeShowAsync(TData,ct)/OnShownAsync(TData,ct)/OnHiddenAsync(TData,reason,ct)`. (Các hook khác override bản non-typed.)
`UIContext` = `readonly struct { object Data; Action OnClosedCallback; }` + `GetData<T>()`. `UIShowOptions {Instant,ForceReload}`, `UIHideOptions {Instant,Reason}`.

## UIRegistrySO + UIConfig
`[CreateAssetMenu("LuzartUI/UI Registry")] UIRegistrySO` — `List<UIConfig> entries`, `BuildLookup()` (Awake gọi). `UIConfig` (9 field): `Id(UIId)`, `StringId`, **`AssetRef(GameObject prefab)`** (DirectPrefab), `AddressKey(string)` (Addressables), `Lane(UILayer=Popup)`, `CachePolicy(UICachePolicy=PoolOnClose)`, `PreloadOnBoot`, `AllowMultiInstance`(Toast/DamageNumber), `DismissByEscape`(true), `PausableWhenOverlaid`. **Visual ở prefab, KHÔNG ở config.**

## Enums
- `UIId` ([UIId.cs](Assets/Luzart/UIFramework/LuzartUI/Runtime/Core/UIId.cs)): **CHỈ có dải System** `None,Loading,Disconnect,Alert,ForceUpdate,Notice,Toast`. Mọi Screen/Popup/HUD id **phải tự thêm**.
- `UILayer`: `WorldOverlay,Screen,Hud,Popup,System,Toast` (thứ tự = sort, cao = trên; pause/resume chỉ ở Popup/Screen).
- `UIState`: None..Released (`Loading` khai báo nhưng không dùng). `UICachePolicy`: `ReleaseOnClose,PoolOnClose,KeepLoaded`. `ToastStyle`: Info/Success/Warning/Error.

## Provider nạp prefab
- `DirectPrefabUIAssetProvider` (DEFAULT): trả `config.AssetRef` đồng bộ; **KHÔNG giải phóng RAM** (prefab thuộc registry); preload/getsize **no-op**. `AddressKey` bị bỏ qua.
- `AddressableUIAssetProvider` (assembly riêng, define `LUZART_ADDRESSABLES`): load theo `AddressKey`, **có** `Addressables.Release` + preload thật. Tự cắm qua `[RuntimeInitializeOnLoadMethod]` khi cài package; `useAddressables=true` mà thiếu package → fallback DirectPrefab (warning).

## Thêm 1 màn mới (quy tắc 2 chỗ)
```csharp
// (a) thêm enum: sửa UIId.cs
public enum UIId { None=0, Loading=1,...,Toast=6, Inventory=2001 /*tự thêm*/ }
// (b) subclass UIBase<TData> (game assembly)
public class InventoryUI : UIBase<InventoryData> {
    [SerializeField] TMP_Text txtGold;
    protected override UniTask OnBeforeShowAsync(InventoryData d, CancellationToken ct){ txtGold.text=d?.Gold.ToString(); return UniTask.CompletedTask; }
    public override async UniTask AnimateShowAsync(bool instant, CancellationToken ct){ /* fade/scale */ }
}
// prefab root mang InventoryUI; nút đóng gọi OnCloseButtonClicked().
// (c) thêm 1 dòng UIConfig vào asset UIRegistrySO: Id=Inventory, AssetRef=prefab, Lane=Popup, CachePolicy=KeepLoaded.
// show:
var inv = await UIManager.Instance.ShowAsync<InventoryUI>(UIId.Inventory, new UIContext(new InventoryData{Gold=1000}), ct: this.GetCancellationTokenOnDestroy());
```

## Gotchas (xác minh từ code)
> [!warning]
> - **`UIId` chỉ có System** → tự thêm id; quên dòng registry → `ShowAsync` ném `KeyNotFoundException`. (2 chỗ: enum + asset.)
> - **`PoolOnClose` THỰC RA Destroy** (pool rỗng) — chỉ `KeepLoaded` mới reuse instance.
> - **DirectPrefab (default) KHÔNG giải phóng RAM**; preload/`bootPreloadLabels` no-op. Art nặng (battle) → dùng Addressable provider.
> - **`UIManager` phải ở root** mới DDOL; không có UIManager → `Instance` null (không tự tạo).
> - **`UIInputRouter` dùng legacy `Input.GetKeyDown`** → project chỉ-new-Input-System sẽ vỡ ESC/back.
> - `AnimateShow/Hide` mặc định **no-op** → không override thì hiện/ẩn tức thì.
> - `UIBase<TData>` **nuốt sai kiểu data** (log error, chạy với null).

## Quan hệ triết lý
`UIRegistrySO` = danh sách `UIConfig`, mỗi dòng trỏ **prefab** (AssetRef/AddressKey). Manager: `UIId → UIConfig → prefab → instance` rồi chạy vòng đời + đẩy vào lane. **Sửa giao diện = sửa prefab**; sửa routing = sửa `UIConfig` + `UIId`. Đúng "visual = prefab tham chiếu trong SO".

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-view]] (UIBase host ViewT) · [[technical/luzart-select]] · [[technical/luzart-di-core]]
