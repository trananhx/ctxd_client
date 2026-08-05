# UI Reskin — Ghép art GCLD vào 5 màn + HUD trận (2026-08-05)

## Mục tiêu

Đưa toàn bộ UI (Lobby, SelectGeneral, SelectStage, BattleHud, Result + TestApiPanel) từ "hộp màu phẳng"
lên chất cổ trang Tam Quốc gần với game tham chiếu GCLD, bằng cách **ghép art thật đã rip sẵn** trong
`Assets/Resources/sprite/`. **KHÔNG sinh ảnh mới** (chỉ đạo chủ dự án); thành phần không có art
(nút, khung 9-slice, rãnh thanh máu) dùng **placeholder composite** — Image màu lồng nhau (viền + nền)
do code dựng, không cần texture.

Chủ trương xuyên suốt (memory `client-first-render-priority`): client tiêu thụ data — mọi mapping
(id tướng → chân dung, stage → nền, skill → tên thư pháp) là bảng tra client-side, server không cần biết.

## Kho art đã xác minh (nhìn tận mắt từng nhóm)

| Nhóm | Đường dẫn (dưới `Assets/Resources/sprite/`) | Số lượng | Nội dung đã xác minh | Dùng cho |
|---|---|---|---|---|
| Chân dung tướng | `tacticalGeneralPicMax/<pinyin>_<hash>.png` | 358 | Chân dung to (~300×330), nền trong suốt, có ĐỦ pinyin mọi tướng roster (`guanyu`, `zhangfei`, `zhaoyun`, `machao`, `huangzhong`, `zhugeliang`, `liubei`, `lvbu`…) | Avatar HUD, thẻ Chọn tướng |
| Nền trận (phong cảnh) | `warBG/<n>_<hash>.jpg` (gốc thư mục, ~30 JPG) | ~30 | 1=đồng cỏ trại lính (Plain), 11=sân thành cờ vàng (Pass/City), 5=phế tích cháy (Mountain), 100=sân đá hoa anh đào… | Thumbnail thẻ Chọn màn, nền màn |
| ~~warBG/images/*.png~~ | `warBG/images/` | 154 | **Bitmap font chữ số** (không phải phong cảnh) — KHÔNG dùng cho UI | — |
| Icon buff | `warBuff/<n>_<hash>.png` | 88 | Icon tròn ~32-48px nhiều màu (lá, lửa, sét, khiên…) | Dãy buff cạnh avatar HUD |
| Sao nộ | `warFeatAnger/featAnger<1..6>_<hash>.png` | 6 | Sao 6 cấp màu (xám→tím) trên nền tròn | Thanh nộ HUD (hàng sao) |
| Tên chiến pháp | `warSkillName/<tacticId>_<hash>.png` | 145 | Chữ thư pháp hồng/tím nằm ngang | Pop tên chiến pháp giữa màn khi ra đòn |
| Trạng thái trận | `warState/bw|cw|fs_<hash>.png` | 3 | Icon tròn đỏ chữ trắng (Bao Vây/…) | Icon `Surrounded` cạnh avatar |
| VS icon / cờ | `warvsicon/<0..7>_<hash>.png` | 7 | Mũi tên xanh, cờ 4 màu, mộc xám | Trang trí giữa 2 HUD (tuỳ chọn) |
| Cuộn giấy | `windowBG/1_<hash>.png` | 1 | Cuộn thư pháp rồng vàng 1024×600, 2 trục gỗ | Panel Result (+ có thể Lineup) |
| Banner thủy mặc | `eff/Recruit/<1|3|5|7|9|11>.png` | 6 | Tranh tướng kỵ binh ngang ~900×250, viền mực rách | Hero banner Lobby |
| ~~eff/ còn lại, skill/~~ | | | FX trận (vòng phép, mũi tên, nổ) — không phải chrome UI | — |

**Không tồn tại trong kho** (đã quét very-thorough + đối chiếu APK chỉ có icon Android):
nút bấm, khung panel 9-slice, rãnh/fill thanh máu, gạch chia. → placeholder composite.

## Mapping dữ liệu → art (bảng tra client, đặt trong `CtxdSkin`)

1. **Chân dung**: `CombatantSnapshot.DefId` / `GeneralSummary.Id` (= id roster, trùng pinyin GCLD)
   → `tacticalGeneralPicMax/<id>`. Id lạ → fallback silhouette (Image màu + chữ cái đầu).
2. **Nền màn**: bảng `stageId → warBG id`: `stage_khanhvang→1`, `stage_fxdemo→1`, `stage_quando→11`,
   `stage_bachho→5`, `stage_xichbich→(chọn lúc code, ưu tiên ảnh nước; không có → 100)`.
   Stage lạ → fallback theo `Terrain` (Plain→1, Pass/City→11, Mountain→5, Water→như xichbich).
3. **Tên chiến pháp**: bảng `Skill2Id (roster string) → tacticId (số, từ bảng Lua gốc
   `reference-gcld-client/decompiled/.../82640e77…lua`)`: `wushen→1102`, `roar→1111` (mieshi),
   `dragonspear→1411` (lqas)… chỉ thêm entry khi ảnh `warSkillName/<id>` TỒN TẠI; skill không map → pop text TMP.
4. **Buff icon**: `ActiveEffectSnapshot.FxId` → bảng `fxId → warBuff id` (vd buff tấn công→lửa,
   fire→lửa, phòng thủ→khiên); FxId lạ → icon mặc định `warBuff/1`. Số hiệp còn lại (`RemainingRounds ≥ 0`)
   in đè góc icon.
5. **Sao nộ**: `Morale/MoraleFull` → 0..6 sao: vẽ 6 Image `featAnger<i>`, sao thứ i sáng khi
   `morale ≥ i/6 * full` (sao mờ = tint xám alpha 0.35). `CanCast` → sao cuối nhấp nháy (Đợt 4).

## Vấn đề kỹ thuật đã biết

- **Sprite import `spriteMode: 2`**: loader phải dùng `Resources.LoadAll<Sprite>(path)[0]`
  (Load<Sprite> có thể trả null với multiple-mode). Cache Dictionary tránh LoadAll lặp.
- **Tên file có hash**: KHÔNG hardcode hash. Editor-time (UIForge/SkinForge) quét
  `AssetDatabase` bằng prefix để GÁN THẲNG Sprite reference vào prefab khi bake (ưu tiên #1);
  runtime-time (khi id chỉ biết lúc chạy: chân dung theo roster, buff, skill name) dùng
  `CtxdSpriteIndex` ScriptableObject — asset sinh bởi forge, map `"thưMục/tênLogic"` →
  đường dẫn Resources đầy đủ (không đuôi) — rồi `Resources.LoadAll<Sprite>`.
- **JPG nền không có alpha** → dùng làm thumbnail phải che bằng overlay gradient tối (Image đen alpha)
  cho chữ nổi.
- Font: giữ Saira SDF (đủ dấu Việt, đã render tốt); "chất cổ" đến từ màu vàng đồng + outline đen đậm.

## Palette placeholder (composite, không texture)

- Nền màn: `#141210F2` (nâu đen ấm). Panel: nền `#1E1A14F5` + viền `#8A6B32` (đồng cũ) 2px
  (Image cha màu viền + Image con màu nền, padding 2 — "khung" không cần sprite).
- Nút chính (hành động): nền `#7A2E22` (son đỏ đất) / hover sáng hơn / pressed tối hơn qua
  `ColorBlock`; nút phụ: `#2E4A66` (lam thép); nút vàng (GIÁC/xác nhận): `#8A6B1F`.
  Chữ nút `#FFE8B0`, outline đen. Viền nút = composite như panel, màu `#C9A34D`.
- Thanh máu: rãnh `#120D0A` viền `#5A4426`; fill máu ta `#37B34A` (xanh lục), địch `#C8342B`
  (đỏ), nộ `#E8A020` (cam vàng); vạch chia ngăn giữ như HealthBar hiện có.
- Chữ tiêu đề: `#FFD25E`; phụ: `#D8CBB0`.

## Thay đổi theo file

### Đợt 1 — bộ khung skin (đổi da cả 7 prefab, layout GIỮ NGUYÊN)
- MỚI `Assets/Ctxd/UI/CtxdSkin.cs` (runtime, không phụ thuộc Editor): palette const + helper màu;
  class `CtxdArt` (tra `CtxdSpriteIndex` + cache + LoadAll) + các bảng map mục trên.
- MỚI `Assets/Ctxd/Editor/SkinIndexForge.cs`: sinh `Assets/Ctxd/Generated/UI/CtxdSpriteIndex.asset`
  (quét 4 thư mục cần runtime-lookup: tacticalGeneralPicMax, warBuff, warSkillName, warBG gốc, warFeatAnger,
  warState) + API editor `FindSprite(folder, prefix)` cho UIForge gán thẳng lúc bake.
- SỬA `UIForge.cs`: helpers `Panel/Button/Bar/FullBg/Highlight/Text` chuyển sang palette + composite
  viền; Button thêm `ColorBlock` 3 trạng thái; Bar thêm viền + rãnh. 5 builder màn đổi tham số màu
  sang palette (vị trí/kích thước GIỮ NGUYÊN để không vỡ flow test cũ).
- Registry, UIId: KHÔNG đổi.

### Đợt 2 — HUD trận
- SỬA `BattleHudUI.cs` + `UIForge.BuildHud()`:
  - Cụm góc mỗi phe: khung avatar 96×96 (composite viền vàng) + Image chân dung (crop đầu bằng
    RectMask2D — ảnh gốc nền trong suốt nên đặt scale/offset là được) + tên + `Lv.` + thanh máu
    (số quân `12.4k/16.0k` in giữa) + hàng 6 sao nộ + dãy buff (HorizontalLayoutGroup, prefab con).
  - `SetActiveGenerals` mở rộng: avatar theo `DefId`, Lv (từ đâu? CombatantSnapshot KHÔNG có Level —
    hiển thị `FiveStar` ★ + tên; Lv chỉ có ở GeneralSummary → HUD bỏ Lv, thay bằng ngôi sao phẩm chất)
    — giữ hợp đồng data hiện có, không sửa protocol.
  - MỚI `SyncSideEffects(SideSnapshot off, SideSnapshot def)` gọi từ `ServerBattleDirector.RenderFields`
    (1 dòng thêm): diff icon buff theo FxId, badge số hiệp.
  - `ShowSkillName(string skillId, string skillName)`: tra map → ảnh warSkillName pop giữa màn
    (scale 0→1 DOTween, giữ 1.2s, fade); không ảnh → banner text như cũ. Gọi tại chỗ Director xử lý
    event skill (điểm gọi xác định lúc code — quanh các `Say(e.Text…)` case skill).
  - Banner `Say`: thêm nền ribbon composite (đen alpha 0.55 + 2 kẻ vàng 2px trên dưới).
- SỬA `ServerBattleDirector.cs`: +2 dòng gọi API HUD mới (giữ nguyên logic).

### Đợt 3 — 4 màn ngoài trận
- `BuildLobby`: nền `#141210`, hero banner `eff/Recruit/1` (Image 900×250 top-center, gán thẳng lúc bake),
  panel Chủ Công composite + avatar `liubei` trang trí, 2 nút lớn palette, 4 stub như cũ.
- `BuildSelectGeneral` + `SelectGeneralUI.Card`: thêm field `icon` (Image) — Forge gán thẳng sprite
  theo thứ tự roster? KHÔNG — roster đến runtime. Card thêm Image `portrait`;
  `OnBeforeShowAsync` gọi `CtxdArt.Portrait(g.Id)`. Slot phải: huy hiệu số thứ tự tròn composite.
  FiveStar → viền thẻ vàng (đổi màu viền composite theo `g` — cần field viền trong Card).
  GeneralSummary không có FiveStar → dùng Power>ngưỡng? KHÔNG bịa: viền vàng khi `Rows>=4` bỏ —
  đơn giản: viền đồng đều, đè `selectedMark` vàng khi chọn (như cũ). (YAGNI)
- `BuildSelectStage` + `SelectStageUI.StageCard`: thêm Image `thumb` trái thẻ (160×90, JPG warBG
  + overlay tối); runtime `CtxdArt.StageBg(s.Id, s.Terrain)`.
- `BuildResult` + `ResultUI`: panel nền = sprite `windowBG/1` (Image nguyên khối, KHÔNG slice —
  ảnh cuộn giấy méo nếu slice), chữ đổi màu nâu mực trên giấy (`#5A3A1A` outcome, tiêu đề đỏ/vàng
  theo thắng thua), nút VỀ SẢNH đặt dưới cuộn.

### Đợt 4 — polish
- `UIBase.AnimateShowAsync` override tại từng màn? KHÔNG — thêm `CanvasGroup` fade-in 0.25s +
  panel scale 0.94→1 trong `OnBeforeShowAsync` bằng DOTween (dự án đã có DOTween) — làm ở 3 màn
  Screen (SelectGeneral, SelectStage, Result) + HUD banner.
- Sao nộ cuối nhấp nháy khi `CanCast`; nút GIÁC đổi màu sáng khi bật.
- TestApiPanel: thu gọn — panel hẹp 300px, nút 36px, chữ 16, đặt DƯỚI cụm HUD phải (y = -210),
  nền composite panel chuẩn (đỡ đè lên HUD mới).
- Screenshot đối chiếu từng màn.

## Verify (mỗi đợt)

1. `refresh_unity` + `read_console` = 0 error mới.
2. Menu `CTXD ▸ Server ▸ Build Server Battle Scene (UI + wiring)` (rebuild 7 prefab + registry + scene).
3. Play-test qua Unity MCP: server `dotnet run --project Server -- server` (nếu chưa chạy);
   flow Lobby→…→Result bằng `Button.onClick.Invoke()`; `ScreenCapture.CaptureScreenshot` từng màn → Read.
4. `dotnet build` + test harness (`Server/`): chỉ chạy ở đợt 2 (đụng Director) — kỳ vọng 114/114 giữ nguyên.

## Ngoài phạm vi

- Không sửa protocol/server data (trừ khi map skill cần — KHÔNG, map nằm client).
- Không đụng chiến trường (UnitVisual/BattleSideField/FX 303 prefab).
- Không làm SpriteAtlas/tối ưu nạp (backlog).
- Không thay font.
