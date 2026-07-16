---
title: Hạ phiên bản Unity xuống 6000.2.8f1
category: decisions
tags: [unity, version, packages, downgrade, build]
sources: []
created: 2026-07-15
updated: 2026-07-15
---

# Hạ phiên bản project xuống Unity 6000.2.8f1

**Ngày**: 2026-07-15
**Quyết định bởi**: chủ dự án (yêu cầu trực tiếp)
**Trạng thái**: active

## Bối cảnh
Project đang ở `ProjectVersion.txt = 6000.3.14f1` (Unity 6.3), nhưng cache/lock lẫn lộn với vết của cả 6000.5.1f1. Chủ dự án yêu cầu chỉnh để **dùng được ở Unity 6000.2.8f1** (Unity 6.2) — bản đã cài sẵn qua Hub. Đây là **hạ** một minor version (6.3 → 6.2), rủi ro hơn nâng cấp, nên phải kiểm chứng biên dịch thật.

## Điều tra (đọc thẳng từ máy, không đoán)
- Editor 6000.2.8f1 đã cài; revision `c9992ac36c34` (lấy từ `Unity.exe` ProductVersion `6000.2.8f1_c9992ac36c34`).
- **18 package** trong `manifest.json`: đọc min-Unity từ `Library/PackageCache/*/package.json` (bản đã resolve của chính project). **Tất cả** có min-Unity ≤ 6000.2 → tương thích 6000.2.8. Không package registry/git nào đòi 6000.3+.
  - addressables 2.9.1 (unity 2023.1), addressables.android 1.1.0 (6000.0), inputsystem 1.19.0 (2022.3), timeline 1.8.12 (2022.3), scriptablebuildpipeline 2.6.1 (2023.1), collab-proxy 2.12.4, ide.rider 3.0.38, ide.visualstudio 2.0.26, visualscripting 1.9.11, newtonsoft-json 3.2.2, profiling.core 1.0.2, UniTask 2.5.11, unity-mcp 9.7.3 — đều OK.
- Code `Assets/` **không** có guard `UNITY_6000_3/4/5` hay tham chiếu API riêng của 6.3.

## Thay đổi đã áp dụng
1. `ProjectSettings/ProjectVersion.txt` → `6000.2.8f1 (c9992ac36c34)`.
2. `Packages/manifest.json` — hạ 3 built-in package mà 6000.2.8 không có bản cao đó:
   - `com.unity.ugui` 2.5.0 → **2.0.0**
   - `com.unity.test-framework` 1.7.0 → **1.6.0**
   - `com.unity.multiplayer.center` 1.0.1 → **1.0.0**
3. `Packages/manifest.json` + `packages-lock.json` — **xóa 2 module built-in không tồn tại ở 6000.2.8** (chỉ có từ 6.3): `com.unity.modules.adaptiveperformance`, `com.unity.modules.vectorgraphics`. Không có code nào dùng `AdaptivePerformance`/`VectorGraphics` → xóa an toàn.
4. `ProjectSettings/ProjectSettings.asset` — do Editor tự chuẩn hóa lại khi mở (bỏ 4 field chỉ có ở 6.3: `metalUseMetalDisplayLink`, `AndroidPreferredDataLocation`, `AndroidAllowedArchitectures`, `allowedHttpConnections`; define `DOTWEEN` giữ nguyên trên mọi platform). Không đổi cấu hình gameplay/đồ họa.

> [!info] `packages-lock.json` các bản built-in (ugui 2.0.0, test-framework 1.6.0, multiplayer.center 1.0.0, profiling.core 1.0.2) đã khớp bản 6000.2 sau khi Editor resolve lại.

## Kiểm chứng (authoritative, không đoán)
Chạy **Unity 6000.2.8f1 headless** để import + biên dịch toàn bộ:
`Unity.exe -batchmode -nographics -quit -projectPath <root> -logFile <log>` → exit 0.
- `[Package Manager] Done resolving packages` — **không còn** "invalid dependencies".
- **0 lỗi `error CS`**; `*** Tundra build success` (34.77s).
- Sinh đủ assembly: `Assembly-CSharp.dll`, `Assembly-CSharp-Editor.dll`, `Assembly-CSharp-firstpass.dll`, `LuzartUI.dll`, `LuzartUI.Addressables.dll`.
- Editor tự giữ `ProjectVersion.txt = 6000.2.8f1` → chấp nhận là project native.

> [!tip] `OverflowException` ở `APIUpdater.AssemblyDependencyGraph.LoadFrom` trong log là **lành tính, tự phục hồi**: API Updater không đọc được cache graph của bản Unity cũ (6000.5.1f1) nên ném lỗi rồi **tạo lại** graph; biên dịch vẫn thành công. Không tái diễn sau khi cache đã dựng lại cho 6000.2.8.

## Hệ quả
- Từ giờ **build/verify bằng 6000.2.8f1** (không phải 6.3/6.5). Unity MCP bridge/server 9.7.3 vẫn tương thích.
- `Library/` đã được dựng lại cho 6000.2.8 (gitignored, không commit).
- Nếu sau này nâng lại lên 6.3, cần thêm lại 2 module built-in đó khi có code dùng đến.

---
## Backlinks
- [[technical/luzart-framework]] — assembly LuzartUI/Addressables đã biên dịch ở 6000.2.8
- [[decisions/luzart-compile-cleanup-2026-06-29]] — lần dọn để project 0 lỗi biên dịch
