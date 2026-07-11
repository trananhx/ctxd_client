---
title: Luzart — AssetModifier (batch editor cho ScriptableObject)
category: technical
tags: [luzart, editor, asset, batch, scriptableobject, tool]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

# Luzart · `AssetModifier` — EditorWindow thao tác hàng loạt asset

> [!info] Một `EditorWindow` tự chứa (chỉ dùng API Unity thuần) để **làm hàng loạt trên asset đang chọn ở Project window** — đặc biệt hợp khi author **nhiều ScriptableObject** (tạo hàng loạt, đổi tên hàng loạt, find-replace 1 field string trên cả bộ, copy giá trị từ 1 SO sang nhiều). `namespace AssetModifier(.Tools/.Internal)`.

## Mở
Menu **`Window ▸ Asset Modifier`** hoặc **`Ctrl+Alt+Shift+J`** ([AssetModifierWindow.cs:21](Assets/Luzart/AssetModifier/AssetModifier/AssetModifierWindow.cs)). Window theo dõi **selection ở Project window** (chỉ giữ object qua `AssetDatabase.Contains` — asset thật, không object scene). Body có try/catch (lỗi tool hiện HelpBox, không crash window).

## 8 tab (theo thứ tự)
| Tab | Làm gì |
|---|---|
| **Create** | Tạo SO vào **folder** đang chọn (`.asset`) hoặc làm **sub-asset** của SO đang chọn. Duyệt type qua `TypeCache.GetTypesDerivedFrom<ScriptableObject>()`; lọc tên/namespace; đặt tên Auto/Smart/Custom. |
| **Rename** | Đổi tên main + sub-asset, **staged (preview rồi Apply)**: Set to / Replace / Add Before-After / Trim / Beautify sub-asset. |
| **Delete** | Xoá main + sub-asset; **trước khi xoá tự null hoá tham chiếu** tới chúng trong asset khác (tránh dangling). |
| **Copy** | Copy **structure / sub-asset refs / serialized values** từ 1 **Source** SO sang nhiều Destination (khớp sub-asset theo **tên**). |
| **Select** | Dựng/biến đổi tập selection (Add/Remove/Intersect/Difference, regex theo name/path/class, Go to Parent/child, Transform→main/sub) + undo/redo nội bộ. |
| **Edit string** | **Find & batch-edit** mọi SerializedProperty kiểu **String** khớp **regex theo property path**, trên toàn selection (staged → Apply). |
| **Modify** | Tự nối field object-ref đang null tới sub-asset tên gần nhất (Levenshtein ≤ 2). |
| **Saved Selects** | Lưu/đặt tên/khôi phục các tập selection (EditorPrefs, GlobalObjectId). |

## Workflow ví dụ
- **Tạo hàng loạt SO**: chọn folder → tab Create → lọc type → bấm type (tạo 1 file path-duy-nhất; chọn nhiều folder → mỗi folder 1 cái). Chọn 1 SO cha thay vì folder → tạo sub-asset.
- **Đổi tên hàng loạt**: chọn asset → Rename → Replace/Add/Trim/Beautify (row đổi tô cyan) → Apply all.
- **Sửa 1 field string trên nhiều SO**: chọn các SO → Edit string → nhập `Path regex` khớp tên field → Reload properties → Set to/Replace → Apply all.
- **Clone giá trị 1 SO sang nhiều**: chọn đích (+ source) → Copy → set Source → **Copy serialized values**.

## Gotchas (xác minh từ code)
> [!warning]
> - **Delete KHÔNG hoàn tác được** (dialog ghi rõ "cannot be undone"); cleanup ref dùng `ApplyModifiedPropertiesWithoutUndo`.
> - **Không thao tác nào dùng Unity Undo** (Rename/EditString/Copy/Modify ghi thẳng đĩa). "Reset" chỉ bỏ **edit chưa Apply**. → Backup/commit git trước khi chạy bộ lớn.
> - Chỉ nhận **asset thật** (không object scene); selection rỗng → phần lớn tool không làm gì.
> - Copy/Modify khớp theo **tên** (Copy: trùng tên; Modify: Levenshtein≤2) → trùng tên sub-asset hoặc tên field giống nhau dễ map nhầm.
> - Lưu (Saved Selects, Copy source) trong **EditorPrefs per-user** (không theo project).

## Quan hệ triết lý
Vì thiết kế = **rất nhiều ScriptableObject**, AssetModifier là công cụ "author hàng loạt": tạo/đổi tên/sửa-field/clone nhiều SO cùng lúc → tăng tốc dựng data game (tướng/binh chủng/trận pháp/định nghĩa visual). Đi đôi với [[technical/luzart-authoring]] (attribute để mỗi SO đẹp & dễ điền).

---
## Backlinks
- [[technical/luzart-framework]] — hub
- [[technical/luzart-authoring]] · [[technical/luzart-di-core]]
