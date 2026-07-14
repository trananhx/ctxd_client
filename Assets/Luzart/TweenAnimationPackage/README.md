# Luzart TweenAnimation Package

Tween/animation framework cho Unity dựa trên DOTween — cấu hình toàn bộ bằng Inspector, không cần code. Hỗ trợ tween đơn lẻ (`TweenAnimation`), chuỗi tween (`SequenceTweenAnimation`), auto-trigger (`TweenAnimationCaller`) và **Preview ngay trong Edit Mode**.

## Yêu cầu

- Unity 2021.3+ (C# 9: pattern matching, switch expression, target-typed `new`)
- **DOTween** (hoặc DOTween Pro) — namespace `DG.Tweening`
- **TextMeshPro**
- Attribute drawers `ShowIf`/`ShowIfAll`/`ReadOnly`: trong project này nằm ở `Assets/Luzart/Main/Attributes/` + `Assets/Luzart/Main/Editor/` (KHÔNG nằm trong package — khi copy package sang project khác phải copy kèm 2 folder đó).

## Cấu trúc

```
TweenAnimationPackage/
├── Runtime/
│   ├── TweenAnimationBase.cs          # Base component: Show() / Stop() / GetTotalDuration()
│   ├── TweenAnimation.cs              # Component tween đơn + toàn bộ settings/enums
│   ├── TweenAnimationWorker.cs        # TweenTimeline builder + strategy workers
│   ├── SequenceTweenAnimation.cs      # Composer Append/Join/Insert + validation
│   ├── TweenAnimationCaller.cs        # Auto-trigger Awake/Start/OnEnable
│   └── DOTweenTMPExtensions.cs        # DOText kiểu typewriter (maxVisibleCharacters, zero-alloc per frame)
└── Editor/
    └── TweenAnimationPreviewEditor.cs # Nút ▶ Preview / ■ Stop trong Inspector (Edit Mode)
```

## Công thức timeline (chuẩn cho cả tween đơn và sequence)

```
DelayStart + LoopCount × (TimeDelayPreLoop + Duration + TimeDelayAfterLoop)
```

- `DelayStart` chạy đúng **1 lần** (không lặp theo loop).
- `LoopCount = -1` = vô hạn — **chỉ hợp lệ ở animation ngoài cùng**. Đặt -1 cho child bên trong Sequence sẽ bị DOTween ép về 1 vòng (framework sẽ log warning cả trong OnValidate lẫn runtime).
- `LoopType`: Restart / Yoyo / Incremental như DOTween. Lưu ý Yoyo đảo cả thứ tự delay trong vòng ngược.

## Sử dụng

### 1. Tween đơn lẻ
Gắn `TweenAnimation` (+ `TweenAnimationCaller` nếu muốn auto-play). Chọn `EAnimation`, cấu hình Duration/Ease/Loop/Delay/Target.

```csharp
var tween = GetComponent<TweenAnimation>();
Tween t = tween.Show();   // play (tự kill lần chạy trước nếu còn)
tween.Stop();             // dừng TẠI CHỖ — không snap về cuối, không fire OnComplete
float len = tween.GetTotalDuration();  // float.MaxValue nếu loop vô hạn
```

### 2. Sequence
Gắn `SequenceTweenAnimation` → kéo các `TweenAnimation`/`SequenceTweenAnimation` khác vào list:
- `Append`: nối tiếp sau entry trước
- `Join`: chạy song song với entry Append/Insert gần nhất
- `Insert`: chèn tại `InsertTime` tuyệt đối

Sequence lồng sequence thoải mái — có guard chống tham chiếu vòng (A chứa B chứa A sẽ báo lỗi thay vì treo editor).

### 3. Auto-trigger
`TweenAnimationCaller`: chọn `Awake` / `Start` / `OnEnable`. `OnDisable` tự kill tween — vòng đời tween bám theo GameObject.

### 4. Events
Mục `Events` trên mỗi tween/sequence:
- `OnTweenStart` — fire khi timeline bắt đầu chạy thật (sau DelayStart)
- `OnTweenComplete` — fire khi chạy xong toàn bộ (không fire nếu loop vô hạn hoặc bị Stop)

Callback chỉ được attach khi có wire trong Inspector (zero overhead nếu không dùng). Muốn listen bằng code → subscribe trên `Tween` mà `Show()` trả về.

### 5. Preview trong Edit Mode
Chọn GameObject có `TweenAnimation`/`SequenceTweenAnimation` → bấm **▶ Preview** trong Inspector. Trạng thái target (transform, rect, alpha, text) được snapshot và khôi phục khi **■ Stop**. Giới hạn: UnityEvents không fire trong preview; case "DelayStart + loop vô hạn + pre/after delay" không mô phỏng delay.

## From/To — semantics

| Field | Ý nghĩa |
|---|---|
| `OverrideFrom` | `false` (default): tween chạy từ giá trị hiện tại — DOTween tự capture **đúng lúc tween bắt đầu chạy** (lazy tự nhiên, chuẩn cho cả Sequence). `true`: target bị snap về giá trị From nhập tay. |
| `Timing` | Chỉ có tác dụng khi `OverrideFrom = true` — quyết định **thời điểm snap**: `Eager` = ngay khi `Show()` (trước DelayStart — dùng cho popup cần đứng ở From trong lúc chờ); `Lazy` = đúng lúc tween tới lượt chạy (dùng cho child trong Sequence không được đụng target trước lượt mình). |
| `OverrideTo` | `true` (default): To = giá trị nhập tay. `false`: To = giá trị hiện tại tại thời điểm `Show()` (luôn resolve sớm — DOTween bake end value lúc tạo tween). |

## Các loại animation (EAnimation)

| Enum | Target | Value | Ghi chú |
|---|---|---|---|
| Move / MoveLocal | Transform | Vector3 | world / local position |
| MoveAnchors | RectTransform | Vector3 | anchoredPosition (z bị bỏ qua) |
| Scale | Transform | Vector3 | localScale |
| Euler | Transform | Vector3 | có option `RotateMode` — dùng `FastBeyond360` cho vòng quay 360°/720° |
| SizeDelta / AnchorMin / AnchorMax | RectTransform | Vector3 | |
| FadeByCanvasGroup | CanvasGroup (auto-add) | float | |
| TextMeshProDOText | TextMeshProUGUI | string | typewriter qua maxVisibleCharacters |
| Float | (none) | float + UnityEvent\<float\> | From/To luôn dùng giá trị nhập tay |
| UnityEvent | (none) | UnityEvent | fire sau Duration, **mỗi vòng loop** |

## Ghi chú hiệu năng & hành vi

- Worker được cache theo component — `Show()` lặp lại không cấp phát worker mới, không GetComponent lại.
- Case phổ biến (không delay/loop, hoặc loop không pre/after delay) trả về **Tweener trần** — 1 object DOTween mỗi Show.
- `Stop()` / destroy = `Kill(false)`: dừng tại chỗ. Không snap, không callback.
- Gọi `Show()` khi đang chạy = kill sạch lần trước rồi chạy lần mới (không còn 2 tween đánh nhau trên 1 target).
- Validation tự động (editor): cảnh báo child loop -1 trong sequence, cảnh báo `IsIgnoreTimeScale` của child lệch với sequence (DOTween chỉ áp dụng setting của root cho tween lồng), báo lỗi tham chiếu vòng, báo lỗi một `TweenAnimation` xuất hiện 2 lần trong cùng sequence (DOTween không cho một tween nằm ở 2 vị trí — dùng 2 component riêng).
- Một `TweenAnimation` đang nằm trong sequence chạy dở thì `Stop()` của riêng nó là no-op (quyền sở hữu tween thuộc về sequence cha — stop sequence thay vì stop child).
