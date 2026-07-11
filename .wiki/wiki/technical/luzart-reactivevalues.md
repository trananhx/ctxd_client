---
title: Luzart — ReactiveValues (observable Number/Bool/String)
category: technical
tags: [luzart, reactive, observer, number, bool, string, poco]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `ReactiveValues` — giá trị reactive (POCO)

> [!info] `namespace Luzart.Reactive`. Giá trị scalar **thuần C# (POCO, KHÔNG phải SO/Mono)**: đọc `Value`, subscribe `Changed`, các node composite tự phát `Changed` khi con đổi → bind thẳng UI không polling. 3 họ giống hệt nhau: **Numbers (double) / Bools (bool) / Strings (string)**. Dùng cho HP/nộ khí/vàng… mà view (trên prefab) subscribe để tự cập nhật.

## Bộ interface
```csharp
public interface INumber { double Value { get; } event Action<INumber> Changed; }   // INumber.cs:6
public interface INumberWithSet : INumber { void Set(double value); }                 // INumberWithSet.cs:7
// tương tự: IBool/IBoolWithSet (IBool.cs), IString/IStringWithSet (IString.cs)
// INumberWithContribution (Contribute/Uncontribute) — KHAI BÁO nhưng KHÔNG có impl nào trong folder
```
> ⚠️ `Value`, `Changed`, `Set`, `Dispose` đều là **explicit interface** → muốn đọc/subscribe phải **giữ/cast qua interface** (`INumber`/`IBool`/`IString`), biến kiểu cụ thể KHÔNG thấy `.Value`.

## Lá ghi được — `*Value` (KHÔNG IDisposable)
- `NumberValue(double=0)` / `BoolValue(bool=false)` / `StringValue(string="")` — chứa 1 field; `Set` chỉ phát `Changed` khi **đổi thật** (`if (_value == value) return;`). Số dùng `==` thô (Number/Bool), String dùng `==` (so nội dung, đúng).

## Base composite — `Runtime*` (có IDisposable)
`RuntimeNumber`/`RuntimeBool`/`RuntimeString` (abstract): `Value => DoGetValue()` (KHÔNG cache ở base — đọc là tính lại), `InvokeValueChanged()` cho subclass, `Dispose()` → `DoDispose()` (mặc định rỗng).

## Các node cụ thể (Number)
| Type | Tính | Cache? | Phát `Changed`? |
|---|---|---|---|
| `RuntimeNumber_Variable(v)` | lá ghi được (như NumberValue nhưng là Runtime) | — | chỉ khi đổi thật |
| `RuntimeNumber_Constant(v)` | hằng số | — | **không bao giờ** |
| `RuntimeNumber_Sum(IEnumerable<INumber>)` | tổng các con (mượn `ListPool`) | không (tính lại mỗi đọc) | **vô điều kiện** khi con đổi |
| `RuntimeNumber_SimpleBoosted(base, add?, mul?, pow?)` | `((base+add)*mul)^pow` | **có** (`_value`) | **chỉ khi kết quả đổi** (node duy nhất de-dup) |

Bool: `RuntimeBool_CompareNumber(left, ComparisonMode, right)` (Equal/Less/Greater…), `RuntimeBool_Combined(CombineMode.Any|All, IEnumerable<IBool>)`. String: `RuntimeString_FromNumber(INumber, format?)` (dùng **InvariantCulture**), `RuntimeString_Concat(IEnumerable<IString>, separator)`. Tất cả composite: tính lại mỗi đọc, phát `Changed` vô điều kiện (trừ SimpleBoosted), `DoDispose` huỷ subscribe + trả `ListPool` (KHÔNG đệ quy).

## Cách dùng
```csharp
using Luzart.Reactive;
INumberWithSet baseAtk = new RuntimeNumber_Variable(100);
INumberWithSet gear    = new RuntimeNumber_Variable(0);
INumber total = new RuntimeNumber_Sum(new INumber[]{ baseAtk, gear });
INumber atk   = new RuntimeNumber_SimpleBoosted(total, null, new NumberValue(1.2)); // ((..)*1.2)
((INumber)atk).Changed += n => atkBar.text = n.Value.ToString();   // bind UI (trên prefab)
gear.Set(50);                       // cả cây phát Changed → UI tự update
((IDisposable)atk).Dispose();       // BẮT BUỘC khi entity/view despawn (dispose từng node)

IString hp = new RuntimeString_Concat(new IString[]{
    new RuntimeString_FromNumber(curHp,"0"), new RuntimeString_FromNumber(maxHp,"0") }, "/"); // "120/200"
```

## Gotchas (xác minh từ code)
> [!warning]
> - **Explicit interface** khắp nơi → phải cast `INumber/IBool/IString`/`IDisposable`/`INumberWithSet`.
> - **`RuntimeNumber_Constant` không phát `Changed`** (cố ý).
> - **Chỉ `RuntimeNumber_SimpleBoosted` de-dup `Changed`** + cache. Mọi composite khác phát `Changed` **vô điều kiện** mỗi khi con đổi (dù kết quả không đổi) → subscriber phải idempotent.
> - **So sánh `double ==` thô** (không epsilon) ở các guard `Set`/`Recalculate`/`ComparisonMode.Equal` → trôi số float có thể phát thừa hoặc nuốt event.
> - **Tính lại mỗi đọc** (trừ SimpleBoosted): `Sum` lặp, `Concat` `new StringBuilder()` mỗi đọc → tránh đọc trong vòng lặp nóng.
> - **`Dispose` KHÔNG đệ quy**; node mượn `ListPool` (`Sum/Combined/Concat`) phải dispose **đúng 1 lần**. `*Value` không IDisposable.
> - **`INumberWithContribution` chưa có impl** — đừng dựa vào.

## Quan hệ triết lý
ReactiveValues **cố ý KHÔNG phải SO** — chúng là tầng runtime/observable. Cách dùng: **SO data** giữ số gốc (serialize), runtime dựng cây ReactiveValue từ đó; **view trên prefab** subscribe `Changed` để cập nhật thanh máu/nộ. SO/prefab = tầng authored (sửa visual = sửa prefab); ReactiveValues = tầng giá trị sống per-instance, dispose khi despawn.

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-view]] — view subscribe `Changed` trong `OnSetup`
- [[technical/luzart-di-core]]
