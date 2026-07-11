---
title: Luzart — NewBaseSelect (Switch/Toggle drive prefab visuals)
category: technical
tags: [luzart, ui, select, switch, toggle, prefab]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `NewBaseSelect` — đổi visual prefab bằng `int`/`bool`

> [!info] `namespace Luzart.NewBase`. Đẩy "trạng thái nhìn" của một UI element vào **prefab**, code chỉ gọi một primitive: **Switch** = chọn 1-trong-N (`Select(int)`), **Toggle** = bật/tắt (`Select(bool)`). 4 đích mỗi họ: GameObject / Image / TMP_Text / UnityEvent. Hợp triết lý: đổi cái nhìn = sửa mảng sprite/object trên prefab, code giữ nguyên.

## Base ([BaseSelect.cs](Assets/Luzart/NewBaseSelect/BaseSelect.cs))
```csharp
interface IBaseSelect<T> { void Select(T value); }
interface IBaseSwitch : IBaseSelect<int> {}      interface IBaseToggle : IBaseSelect<bool> {}
interface ISelectBoolCache { bool IsSelect; void SelectInvert(); }
abstract class BaseSelect : MonoBehaviour, IBaseSwitch, IBaseToggle { [Button] virtual Select(bool); [Button] virtual Select(int); }
abstract class SelectSwitch : BaseSelect<int> {}                       // không state
abstract class SelectToggle : BaseSelect<bool>, ISelectBoolCache {}    // nhớ _isSelect (ReadOnly), SelectInvert()
```
Mọi leaf đều satisfy `IBaseSwitch`/`IBaseToggle` → điều khiển đa hình không cần biết đích.

## Switch family (`Select(int index)`)
| Component | Field | Hiệu ứng |
|---|---|---|
| `SelectSwitchGameObject` | `GroupGameObject[] obSelects` (mỗi nhóm = GameObject[]) | tắt hết nhóm, bật nhóm `[index]` |
| `SelectSwitchImage` | `Image[] imSelects`, `GroupSprite[] groupSprite` | `imSelects[i].sprite = groupSprite[index].sp[i]` |
| `SelectSwitchTMP_Text` | `TMP_Text tmpText`, `string[] options` | `tmpText.text = options[index]` |
| `SelectSwitchUnityEvent` | `UnityEvent[] onSelect` | **gọi TẤT CẢ event** (⚠️ bỏ qua index) |

## Toggle family (`Select(bool on)`)
| Component | Field | Hiệu ứng |
|---|---|---|
| `SelectToggleGameObject` | `obSelect[]`, `obUnSelect[]` | bật `obSelect` / tắt `obUnSelect` khi on (đảo khi off) |
| `SelectToggleImage` | `imSelect[]`, `spSelect[]`, `spUnSelect[]` | `imSelect[i].sprite = on ? spSelect[i] : spUnSelect[i]` |
| `SelectToggleTMP_Text` | `tmpText`, `textSelect/textUnSelect` | đổi text theo on |
| `SelectToggleUnityEvent` | `onSelectTrue/onSelectFalse` | gọi event tương ứng |

## Cách dùng
```csharp
// bánh xe 3 thế trận: imSelects[i] ↔ groupSprite[stance].sp[i] (mảng song song, cùng thứ tự)
SelectSwitchImage stance = GetComponent<SelectSwitchImage>();
stance.Select(1);                       // highlight thế trận index 1
IBaseSwitch sw = stance; sw.Select(2);  // hoặc đa hình

// nút bật/tắt
SelectToggleImage giac = GetComponent<SelectToggleImage>();
giac.Select(rageReady);                 // on → spSelect, off → spUnSelect
ISelectBoolCache c = GetComponent<SelectToggleGameObject>(); c.SelectInvert();  // lật trạng thái nhớ
```
Mọi leaf kế thừa `[Button] Select(int)/Select(bool)` → bấm thử ngay trong Inspector.

## Gotchas (xác minh từ code)
> [!warning]
> - **Nhiều mảng không null-check chính mảng**: `SelectSwitchGameObject.obSelects`, `SelectSwitchUnityEvent.onSelect`, `SelectToggleGameObject.obSelect/obUnSelect` → NRE nếu bỏ trống (gán mảng rỗng, đừng để null).
> - **`SelectToggleImage` index `spSelect/spUnSelect` theo độ dài `imSelect` không bound-check** → 3 mảng phải **cùng độ dài, non-null**.
> - **`SelectSwitchUnityEvent` bỏ qua index** — gọi tất cả event, KHÔNG dispatch theo N.
> - **`SelectToggleImage` KHÔNG gọi `base.Select`** → `ISelectBoolCache.IsSelect` lệch trạng thái thật.
> - Switch ngoài-phạm-vi: GameObject → tắt hết; Image/Text → giữ nguyên (không nhất quán).

## Quan hệ triết lý
Logic quyết định **trạng thái nào** (int/bool); prefab định nghĩa **trạng thái đó trông thế nào** (mảng sprite/object/label). Đổi giao diện = sửa prefab; call site `Select(x)` không đổi.

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-ui]] · [[technical/luzart-view]]
