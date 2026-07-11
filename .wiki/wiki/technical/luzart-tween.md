---
title: Luzart — TweenAnimationPackage (data-driven DOTween)
category: technical
tags: [luzart, tween, dotween, animation, prefab, typewriter]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `TweenAnimationPackage` — animation data-driven trên DOTween

> [!info] `namespace Luzart.Tweener`. Wrap **DOTween** thành component gắn-trên-prefab: chọn loại animation bằng enum trong Inspector, điền settings, gọi `Show()`. Hợp triết lý: component nằm **trên prefab**, sửa animation = sửa prefab. (DOTween đã cài — có `Assets/Resources/DOTweenSettings.asset`.)

## Type chính
- `ITweenAnimation` ([TweenAnimation.cs:338](Assets/Luzart/TweenAnimationPackage/Runtime/TweenAnimation.cs)): `Tween Show()` + `InitSetting(settings)` + `Settings`.
- `TweenAnimationBase : MonoBehaviour, ITweenAnimation` — base gắn lên GameObject (public `Show()`/`Stop()`).
- `TweenAnimation : TweenAnimationBase` — component chính. `[SerializeField] EAnimation typeAnimation` → `Show()` `switch` ra một **worker** (`new TweenAnimationMove()`…) rồi `worker.InitSetting(settings); worker.Show()`.
- `TweenAnimationWorker`/`TweenAnimationWorker<T>`/`Vector3TweenAnimationWorker<T>` — POCO xây tween thật (không Mono).
- `SequenceTweenAnimation : TweenAnimationBase` — ghép nhiều `TweenAnimationBase` theo `Append`/`Join`/`Insert`.
- `TweenAnimationCaller : MonoBehaviour` — tự gọi `Show()` theo `ETypeShow {None,Awake,Start,OnEnable}`; kill tween khi OnEnable/OnDisable.
- `DOTweenTMPExtensions.DOText(this TMP_Text, string, float)` — typewriter (đặt trong `DG.Tweening`).

## `EAnimation` → worker (tham số chính)
| Enum | Worker | Target | DOTween |
|---|---|---|---|
| Move/MoveLocal | Move/MoveLocal | Transform | DOMove/DOLocalMove |
| MoveAnchors/SizeDelta/AnchorMin/AnchorMax | … | RectTransform | DOAnchorPos/DOSizeDelta/… |
| Euler/Scale | Euler/Scale | Transform | DORotate/DOScale |
| FadeByCanvasGroup | Fade | CanvasGroup (get-or-add) | DOFade |
| TextMeshProDOText | TextMeshPro | TextMeshProUGUI | DOText (typewriter) |
| Float | Float | — | DOVirtual.Float → UnityEvent<float> |
| UnityEvent | UnityEvent | — | DOVirtual.DelayedCall → UnityEvent |

Settings (`TweenAnimationSettings`): `General {Target, Duration=1, Easing, IsIgnoreTimeScale}`, `Timing {DelayStart, TimeDelayPreLoop/AfterLoop}`, `Loop {IsLoop, LoopType, LoopCount(<0=∞)}`, `Values {Timing(Eager/Lazy), OverrideFrom=false, OverrideTo=true, Vector3/Float/String From/To, OnFloat/OnUnityEventInvoke}`. Inspector dùng `[ShowIf]` (xem [[technical/luzart-authoring]]) để ẩn/hiện field theo loại.

## `DOText` — typewriter (đáng chú ý)
`DOTweenTMPExtensions.cs:17`: set full text → `ForceMeshUpdate()` (bake layout + rich-text) → tween `maxVisibleCharacters` 0→count. ⇒ **giữ rich-text, KHÔNG alloc mỗi frame** (chỉ tween 1 int). Thay cho DOTween Pro DOTweenModuleTMP.

## Cách dùng
```csharp
// 1) Play từ code
var anim = GetComponent<Luzart.Tweener.TweenAnimation>();
Tween t = anim.Show();        // trả Tween (chain/await/kill); anim.Stop() để huỷ
// 2) Auto-play: thêm TweenAnimationCaller (typeShow=OnEnable), kéo TweenAnimation vào (tự wire khi add)
// 3) Sequence: SequenceTweenAnimation → list các bước Append/Join/Insert; right-click "Init Tween Settings"
// 4) Typewriter:
using DG.Tweening;  battleLog.DOText("Quan Vũ tung <color=red>Xích Diễm Mê Trận</color>!", 1.2f);
```

## Gotchas (xác minh từ code)
> [!warning]
> - **Alloc mỗi `Show()`** cho loại component-based: `GetTweenAnimation()` `new` worker mỗi lần + closure `AppendCallback` + 2 `Sequence`. Đừng spam `Show()` mỗi frame → pool nếu cần.
> - **`To` luôn bake lúc init**, `Lazy` chỉ ảnh hưởng **`From`** (`TweenAnimationWorker.cs:259`).
> - **Loop vô hạn báo `Duration = float.MaxValue`** — đừng schedule/await theo duration đó.
> - **Caller kill tween cả OnEnable lẫn OnDisable** → toggle GameObject giữa chừng sẽ restart/abort.
> - Chọn `FadeByCanvasGroup` sẽ **tự AddComponent<CanvasGroup>** (deferred qua `delayCall` trong OnValidate).
> - Phụ thuộc cứng **DOTween**.

## Quan hệ triết lý
SO trỏ tới prefab; prefab mang các component `TweenAnimation`/`Caller` → animation là một phần của prefab. Sửa chuyển động = mở prefab chỉnh settings, mọi SO trỏ tới đều đổi theo. Data (SO) tách khỏi presentation (prefab + tween).

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-view]] · [[technical/luzart-authoring]]
