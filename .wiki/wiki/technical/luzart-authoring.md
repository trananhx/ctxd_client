---
title: Luzart — Attributes + Editor (inspector authoring cho SO/Mono)
category: technical
tags: [luzart, attributes, editor, inspector, scriptableobject, authoring]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `Attributes` + `Editor` — tô đẹp Inspector để author SO/Mono

> [!info] Bộ attribute kiểu NaughtyAttributes (`namespace Luzart`) + drawer. Rất quan trọng vì **toàn bộ thiết kế là author ScriptableObject** — các attribute này giúp ẩn/hiện field, dropdown, slider, progress bar, readonly, button… ngay trong Inspector. `Attributes/` (runtime) + `Editor/` (drawer).

## Catalog attribute (đích + renderer)
| Attribute | Dùng | Renderer / ghi chú |
|---|---|---|
| `[ShowIf(path, value)]` / `[HideIf]` / `[EnableIf]` / `[DisableIf]` | ẩn/hiện/enable field theo điều kiện | `ConditionalPropertyDrawer`. `path` hỗ trợ điều hướng: `"sibling"`, `"../prop"`, `"a.b"`, `"arr[0]"`. So enum bằng int OK. Đọc cả private. |
| `[ShowIfAny(path,val, path,val…)]` / `[ShowIfAll(...)]` | OR / AND nhiều điều kiện (cặp path,value) | lẻ cặp → ném ArgumentException |
| `[ReadOnly]` | field hiện nhưng **không sửa được** | `ReadOnlyPropertyDrawer` (mọi kiểu serializable) |
| `[InfoBox("text", InfoBoxType.Warning)]` | HelpBox phía trên field (cho nhiều) | `InfoBoxPropertyDrawer : DecoratorDrawer` |
| `[ProgressBar("HP",0,100,showValue)]` | thanh tiến độ | `ProgressBarPropertyDrawer` — **chỉ float/int** |
| `[Slider(min,max)]` | slider (float hoặc int overload) | `SliderPropertyDrawer` — **chỉ float/int** |
| `[Dropdown(v1,v2,…)]` / `[DropdownNamed("val|Label",…)]` | popup chọn giá trị | `DropdownPropertyDrawer` — **chỉ string/int/float** |
| `[ShowInInspector("Label",readOnly)]` | hiện **private** field/prop/method | chỉ Mono (xem gotcha) |
| `[Button("Text",Size,Style,icon)]` | nút gọi method từ Inspector | chỉ **method** trên Mono (xem gotcha) |
| `[Foldout("Group")]`, `[ColorPicker(...)]` | — | **KHÔNG có drawer → vô hiệu** |

## Cách dùng (author SO)
```csharp
using Luzart;
[CreateAssetMenu(menuName="Ctxd/UnitDef")]
public class UnitDef : ScriptableObject {
    public bool isArcher;
    [ShowIf(nameof(isArcher), true)] public RowShape frontShape;   // hiện khi isArcher
    [HideIf(nameof(isArcher), true)] public float meleeReach;
    public UnitClass cls;
    [EnableIf(nameof(cls), UnitClass.Mage)] public int manaPool;   // chỉ sửa khi Mage
    [InfoBox("Cân bằng cẩn thận", InfoBoxType.Warning)]
    [Slider(0,10)] public float atkSpeed;
    [ProgressBar("HP",0,100)] public float health;                  // "42.0/100.0"
    [ReadOnly] public string computedId;
    [Dropdown(1,2,4,8)] public int tier;
    [DropdownNamed("1|Chậm","10|Thường","50|Nhanh")] public int speed;
}
// [ShowInInspector]/[Button] CHỈ trên MonoBehaviour:
public class Debugger : MonoBehaviour {
    [ShowInInspector] int _counter;
    [Button("Spawn")] void Spawn(){ }    // method có tham số → render ô nhập
}
```

## Editor utilities
- `[CustomMenuLuzart]`: menu **`Luzart/Play`** (mở scene build-index 0 + Play); **`Luzart/LuzartTool/Generate Scene Menus`** (sinh `Luzart/_Scenes/...`); **`Luzart/LuzartTool/Missing Script Finder`** (window xoá missing-script — **destructive, không undo**).
- `[ResetParentKeepScale]`: menu **`Luzart/Reset Parent Scale & Keep Child Size`** — reset `localScale` RectTransform về 1 mà giữ size/anchored/font con (dọn prefab UI lỡ scale ≠ 1).

## Gotchas (xác minh từ code)
> [!warning]
> - **`ShowInInspectorEditor` là `[CustomEditor(typeof(MonoBehaviour), true)]` GLOBAL** → xung đột nếu project có custom editor MonoBehaviour khác (Unity chỉ chạy 1 editor/type). **Thu hẹp trước khi thêm custom editor riêng cho CTXD.**
> - Vì global editor chỉ target **MonoBehaviour**, **`[ShowInInspector]` & `[Button]` KHÔNG chạy trên ScriptableObject** (SO dùng default inspector). Nhưng các PropertyDrawer (`ShowIf/Dropdown/Slider/ReadOnly/InfoBox/ProgressBar`) **vẫn chạy trên SO** (per-property).
> - **`[Button]` chỉ trên method** (field bị bỏ qua dù AttributeUsage cho phép Field).
> - `ShowInInspectorEditor` gọi **`target.GetEntityId()`** — extension ngoài Unity; thiếu/throw → vỡ inspector cho mọi Mono có `[Button]`.
> - `ButtonStyle.Rounded` **chưa implement**. `Dropdown` value lạ → ép về index 0 **và ghi đè** field.
> - `Luzart.ReadOnlyAttribute` trùng tên ngắn `System.ComponentModel.ReadOnly` → qualify nếu import cả hai.

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-assetmodifier]] (author hàng loạt SO) · [[technical/luzart-di-core]]
