---
title: Luzart — Content/View (ScriptableObject → Prefab → Spawn ⭐)
category: technical
tags: [luzart, view, prefab, scriptableobject, spawn, data-binding, mvvm]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `Content/View` — lớp View (`ViewT`/`ViewChilding`)

> [!warning] `ViewT` HIỆN KHÔNG dùng được như đang có — và KHÔNG bắt buộc cho triết lý SO→prefab→spawn (xác minh từ code 2026-06-29)
> 1. **Vỡ build player**: [ViewChilding.cs](Assets/Luzart/Content/View/ViewChilding.cs) có **`using UnityEditor;` KHÔNG bọc `#if UNITY_EDITOR`** (dòng 4) — khác mọi file Luzart khác (AssetModifier/Tween đều bọc). `Content/View` nằm trong `Assembly-CSharp` (không asmdef) và `ViewT` tham chiếu `ViewChilding` ⇒ **mọi view kế thừa `ViewT<T>` sẽ lỗi `CS0246` khi build player** (chỉ compile được trong Editor). Sửa = bọc dòng 4 bằng `#if UNITY_EDITOR ... #endif` (1 dòng) — nhưng đây là file framework của chủ dự án, KHÔNG tự sửa khi chưa được đồng ý.
> 2. **KHÔNG nơi nào trong project dùng `ViewT`/`View`** (grep rỗng) → là code thư viện/demo nằm im, chưa từng là cơ chế view thật của game.
> 3. **Reflection mỗi `Setup`** + **`children` null khi AddComponent runtime (NPE)** → còn không phù hợp render cây lớn (hàng trăm lính).
>
> ⇒ **Khuyến nghị: KHÔNG xây kiến trúc trên `ViewT`.** Triết lý "SO giữ ref prefab → spawn prefab → sửa prefab để đổi visual" làm được bằng pattern tối giản dưới đây, không cần `ViewT`/`ViewChilding`.

## Hiện thực visual: LINH HOẠT theo từng component (KHÔNG dựng "khung view")
> [!info] Chủ trương chủ dự án: **không ép visual vào một framework/base chung** (kể cả `Setup(data)` thống nhất). Mỗi component/prefab tự xử lý visual theo cách phù hợp với nó (gán field trực tiếp, Animator, MonoBehaviour riêng…). Đoạn dưới chỉ là **một ví dụ minh hoạ**, KHÔNG phải pattern bắt buộc — tự do viết khác theo từng thành phần.
```csharp
// SO chỉ giữ ref prefab (+ data). KHÔNG phụ thuộc Luzart.View.
[CreateAssetMenu(menuName="Ctxd/Unit Visual")]
public class UnitVisualDefinition : Luzart.AbstractScriptableContent { public GameObject prefab; }

// Prefab có 1 MonoBehaviour THƯỜNG tự cấu hình — sửa visual = mở prefab chỉnh sprite/Animator.
public class UnitView : MonoBehaviour {
    [SerializeField] SpriteRenderer _sr; [SerializeField] Animator _anim;
    public void Setup(UnitRuntime data) {           // method thường, KHÔNG reflection
        _anim.runtimeAnimatorController = data.Controller;
        data.Hp.Changed += _ => _sr.color = ...;    // bind reactive nếu muốn ([[technical/luzart-reactivevalues]])
    }
}

// Spawn:
var go = Object.Instantiate(def.prefab, parent);
go.GetComponent<UnitView>().Setup(unitRuntime);
```
Ví dụ trên: build player OK, không reflection, không NPE, vẫn đúng "sửa visual = sửa prefab". Nhưng **đừng coi `UnitView`/`Setup()` là chuẩn chung** — component khác (hiệu ứng, UI, tướng…) cứ tự cấu hình prefab của nó theo cách riêng. Chỉ phần **data = SO trỏ prefab** là nhất quán; phần điều khiển visual để mở.

---

> [!info] Phần dưới mô tả `ViewT`/`ViewChilding` **như một tham chiếu** (nếu chủ dự án muốn dùng sau khi sửa lỗi build ở trên). Luzart View = Template Method (`OnSetup/OnTeardown/Refresh`) + Composite (`ViewChilding` rót data con bằng reflection) + MVVM-lite (bind thủ công).

## Folder làm gì
`Assets/Luzart/Content/View/` (4 file): `IView`, `View`, `ViewT<T>`, `ViewChilding`. Pattern: **Template Method** (hook `OnSetup/OnTeardown/Refresh`) + **Composite** (cây view cha→con) + **MVVM-lite** (bind thủ công, KHÔNG reactive tự động).

## Các type (chữ ký thật)

### `IView` / `IView<T>` ([IView.cs](Assets/Luzart/Content/View/IView.cs))
```csharp
public interface IView { object DataObj { get; } void Setup(object data); void Teardown(); }
public interface IView<T> : IView { T DataT { get; } void SetupT(T data); }
```

### `View` (abstract MonoBehaviour) ([View.cs](Assets/Luzart/Content/View/View.cs))
`View : MonoBehaviour, IView` — khai báo 3 hook abstract: `DoGetDataObj()`, `DoInternalSetup(object)`, `DoInternalTeardown()`.

### `ViewT<T>` (base bạn KẾ THỪA) ([ViewT.cs](Assets/Luzart/Content/View/ViewT.cs))
```csharp
public abstract class ViewT<T> : View, IView<T> {
    [SerializeField] protected ViewChilding[] children;   // các view con (data routing)
    protected T _data;
    public T Data => _data;
    public void Setup(T data);                            // → DoInternalSetup(data)
    public virtual void Refresh() { }                     // override để vẽ lại
    protected virtual void OnSetup() { }                  // override: bind data → UI (TMP/Image/Animator…)
    protected virtual void OnTeardown() { }
}
```
Luồng `DoInternalSetup(data)` (đọc trong [ViewT.cs](Assets/Luzart/Content/View/ViewT.cs)): kiểm tra `data != null` và `data is T` (ném exception nếu sai) → gán `_data` → gọi **`OnSetup()`** → **lặp `children[i].Setup(this)`**. `DoInternalTeardown()`: teardown children **ngược thứ tự** → `OnTeardown()` → `_data = default`.

### `ViewChilding` — rót data con bằng reflection ([ViewChilding.cs](Assets/Luzart/Content/View/ViewChilding.cs))
```csharp
[SerializeField] string path;   // tên 1 MEMBER public trên KIỂU VIEW CHA (field/prop/method)
[SerializeField] View view;     // view con
public void Setup(IView parentView) {
    var member = parentView.GetType().GetMember(path, Instance|Public).First();
    object childData = (field/prop/method).GetValue(parentView);   // lấy data con từ view cha
    ((IView)view).Setup(childData);                                // truyền xuống view con
}
```
- Trong Editor có **dropdown** liệt kê các **property public** của view cha để chọn `path`.
- Ý: view cha **expose** một member trả về data con (vd `public StatVM Stats => Data.Stats;`), rồi `ViewChilding{ path="Stats", view=statView }` tự rót `Data.Stats` xuống `statView`. Không cần code nối tay.

## Mẫu dùng `ViewT` (tham chiếu — CẦN sửa lỗi build `ViewChilding` ở trên trước)
```csharp
// 1) DATA = ScriptableObject (kế thừa AbstractScriptableContent — xem [[technical/luzart-di-core]])
[CreateAssetMenu(menuName="Game/Unit Visual")]
public class UnitVisualDefinition : AbstractScriptableContent {
    public GameObject prefab;       // ⭐ visual nằm TRONG prefab (sprite + Animator + UnitView)
}

// 2) VIEW = component gốc của prefab, nhận data game khi spawn
public class UnitView : ViewT<UnitRuntime> {
    [SerializeField] SpriteRenderer _sr; [SerializeField] Animator _anim;
    protected override void OnSetup() {
        _anim.runtimeAnimatorController = ...;     // dựng visual từ Data
        Data.Hp.Changed += _ => Refresh();         // tự nối reactive (xem [[technical/luzart-reactivevalues]])
        Refresh();
    }
    protected override void OnTeardown() { Data.Hp.Changed -= OnHp; }
    public override void Refresh() { /* cập nhật thanh máu… */ }
}

// 3) SPAWN = Instantiate(prefab) rồi Setup(data)
var inst = Object.Instantiate(def.prefab, parent);
inst.GetComponent<UnitView>().Setup(unitRuntime);   // prefab "sống dậy" với data
domain.Add(inst);                                   // (tuỳ) đăng ký vào Domain
```
> **Sửa visual = sửa prefab.** SO chỉ trỏ tới prefab. Đổi sprite/animation/bố cục → mở prefab chỉnh, mọi SO trỏ tới nó đều đổi theo. Đúng triết lý.

## Cây render lớn (Composite)
`Setup` lan từ cha xuống con qua `children`. Ví dụ trận đánh:
`BattleFieldView → SideView×2 → GeneralSlotView×5 → RowView×≥4 → GroupView×3 → SoldierView×N`. View cha expose member trả về data con, `ViewChilding` rót xuống. `Teardown` chạy ngược, gọn cây.

## Gotchas (xác minh từ code)
> [!warning]
> - **`children` null khi AddComponent lúc runtime** → `DoInternalSetup` lặp `children.Length` ném **NullReferenceException**. Prefab đã lưu thì `children` là mảng rỗng (an toàn). Nếu tạo view bằng `AddComponent` rồi `Setup`, phải khởi tạo `children = new ViewChilding[0]` trước (vd trong `Awake`).
> - [ViewChilding.cs](Assets/Luzart/Content/View/ViewChilding.cs) có **`using UnityEditor;` ở đầu file KHÔNG bọc `#if UNITY_EDITOR`** (drawer thì có bọc) → **rủi ro vỡ build player**. Nên bọc lại trước khi build thật.
> - **KHÔNG reactive tự động**: `OnSetup` chạy 1 lần; muốn UI tự cập nhật phải tự `subscribe` `INumber.Changed` trong `OnSetup` và `unsubscribe` trong `OnTeardown`.
> - **Reflection mỗi `Setup`** (`ViewChilding`): cây lớn (hàng trăm lính) nên cache `MemberInfo`/pool view. `DoInternalSetup` ném exception nếu data null hoặc sai kiểu.
> - Phân biệt với [[technical/luzart-ui]]: `View/ViewT` lo **bind data + cây con**; `UIBase` (LuzartUI) lo **show/hide/lane/stack**. Dùng song song (một `UIBase` có thể host một `ViewT`).

---
## Backlinks
- [[technical/luzart-framework]] — hub catalog
- [[technical/luzart-di-core]] — data (SO content) mà view nhận
- [[technical/luzart-reactivevalues]] — giá trị reactive view subscribe
- [[technical/luzart-ui]] — lớp UIBase host view
