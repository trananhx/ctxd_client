---
title: Luzart — Content/Saveable (ISaveable, SaveItem, SaveService)
category: technical
tags: [luzart, save, persistence, scriptableobject, json, unitask]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `Content/Saveable` — lưu/đọc state

> [!info] Hệ persistence: content nào cần lưu thì implement `ISaveable` (trả/đọc danh sách `SaveItem`); `SaveService` (một **ScriptableObject service**) gom mọi `ISaveable` trong `Domain`, serialize JSON ra `persistentDataPath`. Khớp triết lý: SaveService cũng là **một SO** (đặt trong `ServiceBag`).

## Type chính (chữ ký thật)

### `ISaveable` + `SaveItem` ([ISaveable.cs](Assets/Luzart/Content/Saveable/ISaveable.cs))
```csharp
public interface ISaveable { IEnumerable<SaveItem> Save(); void Load(IEnumerable<SaveItem> items); }
public readonly struct SaveItem {           // union value gọn
    public readonly string key; public readonly ValueSaveType valueType;
    public readonly bool boolValue; int intValue; float floatValue; double doubleValue; string stringValue;
    // ctor riêng cho mỗi kiểu: new SaveItem("gold", 1000); new SaveItem("name", "abc"); ...
}
public enum ValueSaveType { Int, Float, String, Bool, Double }
```

### `AbstractScriptableContentSaveable` ([AbstractScriptableObject.cs](Assets/Luzart/Content/DI/AbstractScriptableObject.cs))
SO base tiện lợi: `AbstractScriptableContent` + `ISaveable`. Override `DoSave()` / `DoLoad(items)`:
```csharp
public class PlayerCache : AbstractScriptableContentSaveable {
    int _lastStance;
    protected override IEnumerable<SaveItem> DoSave() { yield return new SaveItem("lastStance", _lastStance); }
    protected override void DoLoad(IEnumerable<SaveItem> items) {
        foreach (var it in items) if (it.key=="lastStance") _lastStance = it.intValue;
    }
}
```

### `SaveService : AbstractScriptableService` ([SaveService.cs](Assets/Luzart/Content/Saveable/SaveService.cs))
`[CreateAssetMenu("Luzart/System/SaveService")]`. Field: autoSave on/off, interval (60s), file `GameSave.json`, deltaSave (chỉ lưu khi đổi — so hash), prettyPrint.
- `DoStartContent()` → `LoadAllData()`; `DoStopContent()` → `SaveAllData()`.
- `SaveAllData()`/`LoadAllData()` (UniTask, chạy `SwitchToThreadPool` → `File.WriteAllText`/`ReadAllText` → `SwitchToMainThread`).
- Save: `_domain.GetAll<ISaveable>()`, mỗi cái **phải đồng thời là `IContent`** (lấy `Id` làm khoá). Serialize qua `JsonUtility` (giá trị lưu dạng **string** trong `OptimizedSaveItem`).
- Load: đọc json → khớp `contentId == IContent.Id` → `saveable.Load(items)`.
- Nút `[Button]`: ForceSave / ForceLoad / ClearCache / ShowSaveInfo.

## Cách dùng
1. Tạo asset `SaveService` (menu Luzart/System/SaveService), cho vào một `ServiceBag`.
2. Các SO content cần lưu → kế thừa `AbstractScriptableContentSaveable`, override DoSave/DoLoad, cho vào `ContentBag`.
3. Bootstrap (xem [[technical/luzart-di-core]]) chạy ServiceManager + ContentManager → `SaveService.DoStartContent` tự load; thoát game `DoStopContent` tự save.

## Gotchas (xác minh từ code)
> [!warning]
> - **`OptimizedSaveItem.v` parse float/double bằng culture mặc định** (`float.Parse(value)` / `double.Parse`) — máy dùng dấu phẩy thập phân (vi-VN) có thể **hỏng số**. Nên ép `InvariantCulture` khi dựng lại.
> - `SaveService` là **ScriptableObject → KHÔNG có `Update`**. Timer auto-save (`UpdateAutoSave(dt)`) phải được gọi từ bên ngoài (một MonoBehaviour driver), nếu không auto-save theo interval không chạy (chỉ save lúc Stop).
> - Chỉ lưu `ISaveable` đồng thời là `IContent` (cần `Id`). `Id` phải **duy nhất & ổn định** giữa các lần chạy, nếu không load không khớp.
> - `Save()` chạy trên ThreadPool → **không đụng Unity API** trong `DoSave`/`DoLoad` nếu nặng (giữ thuần data).
> - Server-authoritative: chỉ nên cache **client-side** (thế trận đã chọn, thiết lập UI). KHÔNG lưu vàng/level ở client ([[technical/client-server-architecture]]).

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-di-core]] — Domain/Service/Bag mà SaveService dựa vào
