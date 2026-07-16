---
title: Sprite tím rịm (magenta) — thiếu material dùng chung
category: bugs
tags: [rendering, sprite, material, urp, builtin, magenta]
sources: []
created: 2026-07-15
updated: 2026-07-15
---

# Bug: mọi sprite hiện màu tím (magenta)

**Ngày**: 2026-07-15
**Trạng thái**: đã áp dụng fix — chờ xác nhận trực quan trong Editor

> [!bug] Triệu chứng
> Chủ dự án báo "lỗi shader, mọi thứ tím rịm" sau khi mở project bằng Unity 6000.2.8f1 (xem [[decisions/unity-downgrade-6000.2.8-2026-07-15]]). Yêu cầu: dùng **built-in**, không dùng URP.

## Điều tra (root cause, không đoán)
- Render pipeline **đã là Built-in** rồi: `GraphicsSettings.m_CustomRenderPipeline: {fileID: 0}`, map global rỗng, QualitySettings không có `renderPipeline`. URP **không** có trong manifest/lock/PackageCache. → Không phải lỗi cấu hình URP-vs-builtin.
- Editor.log (session GUI 23:04) **không** có lỗi biên dịch shader (chỉ noise mạng Curl/403).
- Test quét mọi tham chiếu material (`type: 2`) trong prefab/scene của `Assets/Ctxd`: **25 guid, đúng 1 guid THIẾU** = `a97c105638bdf8b4a8650670310a4cd3`. 24 cái còn lại (controller, SO, TMP font) đều resolve.
- Guid thiếu này được **19 prefab** (`unit_*`, `fx_*`) + scene `BattleServer.unity` tham chiếu qua `SpriteRenderer.m_Materials[0]`. Git history: guid CHỈ từng nằm trong prefab, **chưa bao giờ** là file `.mat` được commit → không phải do commit/downgrade xoá; nó là **material mặc định 2D của URP** được gán tự động khi project còn URP, thành tham chiếu chết khi URP bị gỡ.

**Root cause**: renderer trỏ tới material thiếu ⇒ Unity render magenta. "Mọi thứ" tím vì material đó dùng chung cho mọi unit + FX.

## Fix
Tạo material thiếu bằng **shader built-in `Sprites/Default`** (đúng ý "built-in, không URP), 1 asset resolve cả 20 tham chiếu:
- `Assets/Ctxd/Visual/UnitSprite.mat` — `m_Shader: {fileID: 10753, guid: 0000000000000000f000000000000000}`
- `Assets/Ctxd/Visual/UnitSprite.mat.meta` — `guid: a97c105638bdf8b4a8650670310a4cd3`, `mainObjectFileID: 2100000`
- Đặt ở `Visual/` (ngoài `Generated/`) để re-bake không xoá. URP đã gỡ nên lần bake sau AssetForge tự gán material sprite built-in ⇒ không tái phát.

## Verify
- ✅ Cấp tham chiếu: quét lại → **0 material thiếu**; `a97c…cd3` → `UnitSprite.mat`.
- ⏳ Trực quan: cần focus Editor (Assets → Refresh, Ctrl+R) để Unity import material mới → magenta biến mất. (Không tự chụp được: Editor là session của chủ dự án, MCP bridge chưa nối.)

## Ghi chú
- Các material `... - URP.mat` / HDRP trong `Assets/TextMesh Pro/Examples & Extras/` là asset MẪU của TMP, không dùng trong game — bỏ qua (có thể xoá cả thư mục Examples nếu muốn gọn).

---
## Backlinks
- [[decisions/unity-downgrade-6000.2.8-2026-07-15]] — magenta lộ ra sau khi Library dựng lại cho 6000.2.8
