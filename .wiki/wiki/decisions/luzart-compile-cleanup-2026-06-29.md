---
title: Dọn code rác để Luzart compile (2026-06-29)
category: decisions
tags: [luzart, framework, compile, cleanup, odin, scriptableobject]
sources: []
created: 2026-06-29
updated: 2026-06-29
---

## Dọn code demo/pre-impl để project compile lại

**Date**: 2026-06-29
**Decided by**: chủ dự án (chỉ đạo "cái gì không có thì bỏ đi") + Claude (thực thi)
**Status**: active

### Context
Project **không compile**: 41 lỗi `Assembly-CSharp` (CS0246/CS0115). Nguyên nhân: nhiều file demo/pre-impl trong `Assets/Luzart/Content/` tham chiếu type **chưa bao giờ tồn tại** trong project — Odin Inspector (`Sirenix.*`, KHÔNG cài, là asset trả phí), và type game chưa dựng (`StatType`, `ItemConfig`, `AssetEquipmentSlot`, `ETypeItem`, `ICost`/`ICostVisualResolver`/`IBroadcastData`/`AssetCostVisualResolver_ResourcePool`, `GameManagerData`, `UIManagerData`, `Singleton<>`, `UniverseView`, `GameUtil`, `FindItemEditor`). UniTask (`Cysharp`) và DOTween thì **có cài** (manifest + Plugins) nên KHÔNG đụng.

### Options considered
1. **Cài thêm dependency thiếu (Odin) + tự viết các type game thiếu** — phục hồi mọi file. Cons: Odin trả phí (không cài được); phải bịa ~10 type game (StatType/ItemConfig/equipment/cost/managers) = tự ý dựng game logic khi chưa có thiết kế → sai phạm vi.
2. **Gỡ phần tham chiếu type không tồn tại, giữ framework lõi** (chọn). Khớp chỉ đạo "bỏ cái không có". Cons: mất code demo (nhưng pattern đã ghi ở [[technical/luzart-framework]]; reactive đã có bản sạch `ReactiveValues`).

### Decision
Chọn (2). Phân loại bằng compile thật + cross-reference grep (mọi type bị gỡ đều **chỉ dùng nội bộ** trong chính folder của nó — an toàn):
- **GỠ HẲN** (demo/glue hỏng, self-contained): `Content/ThanhDemo/` (toàn bộ — đã bị `ReactiveValues` thay thế), `Content/DataResources/` (toàn bộ), `Content/Universe/Universe.cs`, `Content/Universe/SceneRootManager.cs`. Cùng 2 nút editor `FindAllServices`/`FindAllContent` (gọi `FindItemEditor` không tồn tại).
- **GIỮ + SỬA** (framework lõi; Odin → attribute Luzart tự có): `SaveService.cs`, `ServiceBag.cs`, `ContentBag.cs` — đổi `[Sirenix.OdinInspector.Button]`→`[Button]`, `[Sirenix.OdinInspector.ReadOnly]`→`[ReadOnly]` (Luzart `Attributes/` đã có sẵn các attribute này + drawer).
- **GIỮ NGUYÊN** (Odin đã được guard đúng): `AbstractScriptableContent.cs`, `AbstractScriptableService.cs` — tham chiếu Odin nằm trong `#if UNITY_EDITOR && ODIN_INSPECTOR` (không định nghĩa → không lỗi). Đây là optional-dependency hợp lệ, không phải rác.

### Consequences
- **Cả 3 assembly compile 0 lỗi** (Assembly-CSharp, -firstpass, -Editor), xác minh offline bằng Roslyn bundled của Unity (khớp output Editor.log thật) — xem memory `offline-compile-verify`. Lưu ý: Unity Editor đang mở nhưng CHƯA tự recompile (chưa focus); sẽ compile sạch khi focus lại.
- **Mất**: composition root (`SceneRootManager`/`Universe`) và hệ chỉ số demo → khi dựng scene/battle thật phải viết lại bootstrap (`Singleton<T>` + root) và hệ chỉ số (theo blueprint §4 [[technical/luzart-framework]]).
- **Còn**: DI lõi (`Domain`/`EventBus`/Content/Service), `ServiceManager`/`ContentManager` + Bag, `SaveService`, `ReactiveValues`, `View`, `LuzartUI`, Tween/Select/Attributes/Editor — đều nguyên vẹn.
- Backup toàn bộ `Assets/Luzart` trước khi gỡ đã lưu ở scratchpad của session (các file untracked, không có trong git).
- Không scene/prefab/asset nào tham chiếu script đã gỡ (đã kiểm 43 GUID) → không phát sinh "missing script".

---
## Backlinks
- [[technical/luzart-framework]] — module bị gỡ/sửa
