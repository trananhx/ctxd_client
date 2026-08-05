---
title: Tướng đơn cỡ lớn (boss) — cấu hình từ server JSON
category: technical
tags: [battle, server, json, visual, boss, formation]
sources: [Server/ScenarioLoader.cs, Assets/Ctxd/Battle/Sim/Formation.cs, Assets/Ctxd/Battle/BattleSideField.cs]
created: 2026-07-27
updated: 2026-07-27
---

# Tướng đơn cỡ lớn — "1 con to đùng, không có đội quân"

Mặc định một tướng ra trận là **Rows × 3 nhóm × 6 sprite**. Trang này mô tả cách khai một tướng chỉ hiển thị
**MỘT hình duy nhất, phóng to** (boss / trấn thú / đấu tay đôi) hoàn toàn bằng dữ liệu server.

## Cách khai

Thêm vào entry tướng trong `Server/data/stage_*.json`, `scenario.json` hoặc `roster.json`:

```json
{
  "Id": "baihu", "DisplayName": "Bạch Hổ", "Troop": "KyBinh",

  "Rows": 1,
  "Formation": [ [ "KyBinh" ] ],
  "GroupsPerRow": 1,
  "SpriteCols": 1,
  "SpriteRows": 1,
  "UnitScale": 1.2,
  "VisualId": "102",

  "TroopCapacity": 42000,
  "NormalAtk": 980, "NormalDef": 560, "TacticAtk": 940, "TacticDef": 520,
  "Strategy": 96, "Resilience": 0.22, "FiveStar": true,
  "Skill2": { "Id": "baihu_roar", "Name": "Bạch Hổ Nộ Hống", "Kind": "AoeDamage", "RowsHit": 2, "Power": 2.2 }
}
```

Ví dụ chạy được: [`Server/data/stage_bachho.json`](../../../Server/data/stage_bachho.json) (màn "Bạch Hổ Sơn Lâm").

## Năm khoá mới

| Khoá | Bỏ trống | Ý nghĩa |
|---|---|---|
| `GroupsPerRow` | 3 | Số **nhóm** mỗi hàng. Đặt `1` cho tướng đơn. |
| `SpriteCols` / `SpriteRows` | 3 / 2 | Số **sprite** trong một nhóm. Đặt `1`/`1` cho đúng một hình. |
| `UnitScale` | 1× | Hệ số **nhân** lên `unitScale` chung của sân (mặc định 0.7). |
| `VisualId` | theo binh chủng | Chỉ định art theo `UnitVisualDefinition.unitId`. |

Tất cả đều optional; tướng cũ không khai khoá nào thì `Style == null` và giữ nguyên hình cũ 100%.

## Đường đi của dữ liệu

```
GeneralDto (5 khoá)  →  GeneralDto.ToStyle()  →  Combatant.Style
                                                      ↓
              FormationBuilder.Uniform / FromLayout (tham số style)
                                                      ↓
                          Group { SpriteCols, SpriteRows, Scale, VisualId }
                                                      ↓
                              GroupSnapshot (wire, append-only)
                                                      ↓
                    BattleSideField.SpawnCell → chọn art + scale + neo chân
```

> [!info] Vì sao `GroupsPerRow` nằm trên `GroupStyle` chứ không phải trên layout
> Đội hình bị **dựng lại từ đầu** ở 6 chỗ (viện binh, ảo ảnh, phó tướng…) mà những chỗ đó chỉ biết `Combatant`,
> không biết JSON gốc. Nếu số nhóm chỉ nằm trong `Formation`, ảo ảnh của một boss sẽ ra **ba** con boss
> (mỗi con 1/3 máu) vì `ClonePhantom` gọi `Uniform(..., DefaultGroupsPerRow = 3)`.
> Đã khoá bằng test `SingleFigureUnitTests.Phantom_Of_A_Boss_Stays_A_Single_Figure`.

## Art có sẵn

| `VisualId` | Là gì | att (Công) | def (Thủ) |
|---|---|---|---|
| `102` | **Bạch Hổ** (bạch hổ giáp lửa) | 370×275 | 501×421 |
| `43` | Tướng đơn áo choàng xanh, cưỡi ngựa | 593×299 (đòn đánh) | có |

Sprite import ở PPU 100, `filterMode` bilinear → **đừng phóng to sprite lính thường** (95 px) lên chục lần,
sẽ mờ. Dùng bộ art vốn đã lớn rồi chỉ nhân 1.0–1.5.

Vì art `att`/`def` khác kích thước, `UnitScale` nên khác nhau tuỳ phe: bộ 102 ở phe Thủ cỡ `1.2`, ở phe Công
cần khoảng `1.6` mới tương đương.

## Ba cái bẫy

1. **Đừng khai `Deputy` cho boss.** `ScenarioLoader.AddWithDeputy` sẽ `Formation.Clear()` rồi dựng lại đội hình
   đều — mất trắng layout một nhóm.
2. **Đừng đặt boss làm `Offense[0]` của `scenario.json`.** Selftest (`Server/Program.cs`) bắt buộc tướng đó phải
   **trộn binh chủng**; boss một nhóm sẽ làm selftest đỏ. Đặt ở `Defense` hoặc ở `stage_*.json`.
3. **Muốn người chơi CHỌN được boss** thì entry phải nằm trong `roster.json`, không phải `scenario.json` —
   `ScenarioLoader.OverrideOffense` thay nguyên mảng `Offense` bằng bản roster theo `Id`.

> [!warning] `Rows: 1` làm chiến pháp `InstantTo1Hp` thành đòn một-phát
> Công thức là `frac = RowsHit / Rows` (`TacticEffects.cs`), nên với `Rows = 1` thì mọi `RowsHit ≥ 1` đều cho
> `frac = 1.0` → boss tụt còn đúng 1 quân sau một lần cast. Cân bằng lại `RowsHit`, hoặc cho boss nhiều hàng
> (mỗi hàng vẫn 1 nhóm) nếu muốn tránh.

## Hệ quả ở tầng render (đã sửa kèm)

- **Neo chân**: sprite quân đều pivot giữa. Trước đây đặt thẳng vào mốc hàng nên nửa dưới thò xuống — lính
  0.7× chỉ lệch 0.24 nên không ai thấy, boss phóng to sẽ lún mấy hàng. Nay mọi đơn vị được nâng đúng nửa chiều
  cao → **đứng bằng chân** trên mốc hàng bất kể cỡ.
- **Sorting theo chân** (`spriteRenderer.bounds.min.y`) thay vì theo tâm, nếu không boss cao bị vẽ chìm sau quân địch.
- **Thanh máu** bám bao đóng thật của sprite và **dày lên theo cỡ** đơn vị, nếu không thanh máu boss thành sợi chỉ ~78:1.

---
## Backlinks
- [[decisions/battle-visual-grammar-2026-07-27]] — ngữ pháp hình ảnh trận (thanh máu, FX)
- [[systems/battle-system]] — hình học hàng/nhóm
- [[systems/unit-entity-model]] — tướng = lính
