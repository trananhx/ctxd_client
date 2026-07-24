---
title: Mô hình đơn vị hợp nhất (Tướng = Lính)
category: systems
tags: [unit-entity, tuong-linh, binh-chung, chien-phap, thien-phu, model]
sources: [raw/assets/]
created: 2026-07-24
updated: 2026-07-24
---

# Mô hình đơn vị hợp nhất (Tướng = Lính)

> [!info] Design Intent (chốt 2026-07-24)
> Mô hình này do **chủ dự án chốt ngày 2026-07-24**. Mục tiêu: **hợp nhất ngữ nghĩa** của bốn khái niệm vốn được mô tả rời rạc trong tài liệu — **tướng (general) / lính (troop) / chiến pháp (tactic) / thiên phú (talent)** — về **một đối tượng đại diện duy nhất**. Đây là trang **canonical** cho mô hình đơn vị; xem quyết định gốc tại [[decisions/unified-unit-entity-model-2026-07-24]] và nguồn ảnh in-game tại [[sources/ingame-general-panel-2026-07-24]].

> [!info] Xác thực từ dịch ngược client (2026-07-24) — [[sources/apk-reverse-engineering-2026-07-24]]
> Mã client 攻城掠地 v8.9.0.6 củng cố mô hình **tướng = một phương trận binh**: đối tượng `Army` mang `troopType`, `tacticsId`, và `forces/forcesMax` (**binh lực = HP của đơn vị**). **Chết-theo-hàng** là cơ chế lõi (event 30/46: hàng trước cạn → hàng sau dồn lên; khớp official "部队伤亡以列为单位"). Chiến pháp là **rule-engine data-driven**: mỗi 战法 có tham số **số hàng đánh** (2–5, thấy ở các skill 3/4/5 hàng), **chiến pháp chuỗi** (`nextTacticId`), và có thể **cast N-lần** — server tính, client replay. Đơn vị **có thể KHÔNG mang chiến pháp** (thuần cận chiến). Con số ở server. Xem [[claims#c-20260724-07]], [[claims#c-20260724-08]], [[claims#c-20260724-12]].

## LÕI: "Tướng" và "lính" chỉ là **một** đối tượng

Điểm cốt lõi của mô hình: **"tướng" và "hàng lính" KHÔNG phải hai thực thể tách rời** — chúng là **cùng một đối tượng đơn vị (UnitEntity)** nhìn từ hai góc.

- Một **tướng** = **một đơn vị đại diện cho một binh chủng ra trận**. Nó mang: gear (⚔/🛡/带兵量), chỉ số 统/勇, binh lực / sức chứa quân (带兵量), chiến pháp (战法), và thiên phú (thiên phú buff).
- **"Hàng lính"** không phải thực thể riêng — nó chỉ là **biểu hiện hình học (dạng render)** của chính đối tượng tướng đó trên chiến trường. Tướng "vài hàng quân" và tướng "1 con figure" chỉ là hai *dạng* của cùng một `Combatant`.

Điều này khớp **trực tiếp** với code hiện có. `Combatant.cs` mô tả rõ:

> `A general + their troops in a side's queue. Troops act as HP (GDD: lính = máu tướng).`

Nghĩa là **lính = máu của tướng**: `Combatant.Troops` (Σ soldiers của formation) chính là HP; tướng chết khi Σ soldiers = 0 (`Combatant.Alive => Troops > 0`). Formation là `List<Row>`, combat rút cạn **hàng đầu còn sống** trước rồi tiến hàng.

Khớp với cây render server-authoritative **Phe → ≤5 Tướng → ≥4 Hàng → 3 Nhóm → N lính** đã chốt ở [[systems/battle-system]] (§Hình học) và [[decisions/battle-geometry-server-model-2026-06-30]] ("1 tướng được *thể hiện* linh hoạt: vài hàng quân, hoặc chỉ 1 con tướng, hoặc kết hợp; tướng chết khi *dạng* của nó chết hết").

---

## Các facet của đơn vị (tách 3 tầng — FIX-4)

Mỗi facet dưới đây tách **nghiêm** ba tầng: **Ý đồ (đã chốt)** — **Code hiện tại** — **Đề xuất (chưa có / code gap ❓)**. Đề xuất KHÔNG phải canon; chỉ là gợi ý data-model để lấp code gap.

### (1) Đối tượng hợp nhất

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| Tướng = lính = **1 đối tượng** đại diện binh chủng ra trận. "Hàng lính" chỉ là biểu hiện. | `Combatant` = "a general + their troops"; `Troops` = Σ soldiers = HP; `Formation: List<Row>`. Đã hợp nhất ở mức sim. | Đặt tên tường minh `UnitEntity` bao trọn general + troop + tactic + talent + buff (xem §Data model). ❓ code gap: chưa gom thành một type khai báo. |

### (2) Binh chủng + CẤP

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| Mỗi đơn vị thuộc **một binh chủng** kèm **cấp/bậc sao**. 🎨 UNIT A "Công Thành Xa **LV4**", UNIT B "Nhục Bác Tứ Sĩ **lv4**", UNIT C "H.kim chiến kỳ **cấp 4**". | `Combatant.Troop: TroopType` (enum: KyBinh/ThuongBinh/CungBinh/ChienXa…). Binh chủng gán **per-Group** trong formation → 1 tướng có thể trộn loại ([[decisions/battle-geometry-server-model-2026-06-30]]). | Trường **cấp binh chủng** (bậc sao 4★) riêng. ❓ code gap: `TroopType` chưa mang level. |

> [!warning] ⚠️ Hậu tố "LV4 / lv4 / cấp 4"
> Suy luận: hậu tố này nhiều khả năng là **bậc sao / cấp của binh chủng (兵种星级 4★)**, **TÁCH khỏi cấp tướng** (UNIT A Lv.220 / B Lv.201 / C Lv.204). Chưa chốt — chờ chủ dự án xác nhận. Xem [[systems/troop-types]].

### (3) Chỉ số 统 (Thống) / 勇 (Dũng)

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| 🎨 Panel in-game hiện **统 (Thống)** và **勇 (Dũng)** trên mỗi đơn vị. UNIT A 171/170, UNIT B 159/**62** (Dũng rất thấp), UNIT C 169/169. | `GeneralStats { NormalAtk, NormalDef, TacticAtk, TacticDef, Strategy, Resilience }` — 5 chỉ số GDD §3.5 (普通攻击/普通防御/战法攻击/战法防御/计策 + 韧性). | Ánh xạ 统→NormalAtk?, 勇→TacticAtk? **là SUY DIỄN, chưa chốt**. ❓ |

> [!question] ⚠️ Ánh xạ 统/勇 → code chưa chốt (FIX-2)
> **KHÔNG** khẳng định một ánh xạ duy nhất. Panel hiện 统/勇; ánh xạ sang `NormalAtk`/`TacticAtk` chỉ là **suy diễn**. Tồn tại **mâu thuẫn 3 chiều**: (a) [[systems/general-system]]: 武力=damage & 统/勇=thủ; (b) [[claims]] c-20260627-08: 统/勇 = atk+def; (c) mô hình mới: Thống/Dũng = atk. Xem [[contradictions]].
>
> Lưu ý FIX-2: "UNIT B **Dũng 62** → **không có chiến pháp**" chỉ là **TƯƠNG QUAN**, **không phải bằng chứng nhân-quả**. Không dùng nó để chốt "Dũng thấp ⇒ mất chiến pháp".

### (4) Gear ⚔ Công / 🛡 Thủ / 👤 带兵量 (Sức chứa quân)

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| 🎨 Mỗi đơn vị mang 3 trị gear: **⚔ Công** / **🛡 Thủ** / **👤 Sức chứa quân (带兵量)**. UNIT A +32535/+16516/+63492; B +35034/+18057/+61140; C +31692/+16645/+56470. | Gear cộng vào `GeneralStats` (Atk/Def). Sức chứa quân ~ ánh xạ `MaxTroops` (trần binh lực). | Tách trường **CarryCap (带兵量)** riêng, phân biệt với ⚔/🛡. ❓ code gap: hiện gear/带兵量 chưa mô hình tường minh trong sim. Xem [[systems/equipment-and-gear]]. |

### (5) Binh lực = HP + Mộ binh (meta-layer)

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| **Binh lực = HP của đơn vị** (số lính hiện có / trần). 🎨 UNIT A 0/952380 (cạn — timer 04:22, nút Tăng tốc mộ binh), UNIT B ~x7537/917100, UNIT C 647050/647050 (đầy). **Mộ binh** = hồi binh lực **ngoài trận** (meta-layer, có timer + Mộ Binh Lệnh 126987 dùng chung). | Trong trận: `Combatant.Troops`/`MaxTroops` = HP hiện/trần; `CombatOps.HealFront` hồi lính hàng đầu (chỉ trong trận). | **Mộ binh ngoài trận** (timer hồi binh, tăng tốc, Mộ Binh Lệnh) — ❓ **code gap: CHƯA có**. Code chỉ có `HealFront` trong trận, không có meta-layer mộ binh. |

### (6) Chiến pháp (战法) và điều kiện kích hoạt (castMode)

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| Đơn vị có thể mang **1 chiến pháp** với **castMode** đa dạng: `N-lần` (đánh thường N nhịp rồi xả), hoặc **điều kiện**: đủ nộ 50→100, **giết 1 hàng** (on-kill-row), **mốc HP** bản thân. 🎨 UNIT A "Công thành chiếm đất (4 hàng)", UNIT C "Sư/Thiết Kỵ Vô Song (5 hàng)". | `Combatant.Skill2` (chiến pháp chính) xả khi **đủ nộ**: `moraleReady = actor.Morale >= _cfg.MoraleFull && actor.Skill2 != null` (`BattleRunner.cs:106`), sau xả reset morale. **CHỈ có morale-gate.** | ❓ **code gap**: THIẾU bộ đếm **N-lần**, **on-kill-row**, **self-HP** làm điều kiện xả. Đề xuất `castMode` trong `TacticProgram`. |

> [!question] ❓ `Skill1` là dead field
> `Combatant.Skill1` tồn tại trong code nhưng runner **chỉ đọc `Skill2`** để xả (`BattleRunner.cs:106`, `CastTactic(..., actor.Skill2, ...)`). ⇒ `Skill1` hiện là **dead field**, vai trò chưa xác định (chiến pháp phụ? passive?). Cần chủ dự án làm rõ.

### (7) "Đánh nhiều hàng" — buff hay cứng?

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| "Đánh nhiều hàng" nên là **MỘT effect/buff** cộng thêm (ví dụ chiến pháp/thiên phú cấp "+X hàng bị đánh"). 🎨 "Công thành chiếm đất (**4 hàng**)", "Kỵ Vô Song (**5 hàng**)". | **RowsHit CỨNG** trên tactic: `TacticSpec.RowsHit`; sát thương nhân `rowFactor = 1.0 + 0.35 * (RowsHit - 1)` (`CombatOps.cs:248`). Số hàng đóng vào định nghĩa chiến pháp. | Đề xuất buff **`ExtraRowsHit`** (một `UnitBuff`) cộng dồn vào RowsHit hiệu dụng, thay vì hằng số cứng trong TacticSpec. ❓ code gap. |

### (8) Thiên phú (talent) = buff % "Lực chiến (战力)" theo bối cảnh

| Ý đồ (chốt) | Code hiện tại | Đề xuất (chưa có / code gap) |
|---|---|---|
| Thiên phú = **buff % theo bối cảnh** (địa hình / thành trì), có thể kèm cờ **chỉ-phe-công**. 🎨 UNIT A "Thành trì +60% (**Chỉ phe công**)", UNIT B "Bình nguyên/Sơn địa/Thủy vực +20% (mọi địa hình)", UNIT C "Bình nguyên +25%". | Chỉ có **địa hình cứng**: `TerrainMult` khớp binh chủng↔địa hình → `1.0 + cfg.TerrainAffinityBonus` (mặc định **0.25**, `CombatOps.cs:215-226` / `BattleConfig.cs:14`). Không có khái niệm thiên phú, không có cờ chỉ-phe-công, không có Terrain.Castle. | Đề xuất `TalentDefinition` { context: Terrain/Castle; percent; `OffenseOnly` flag } + thêm `Terrain.Castle`. ❓ **code gap**. |

> [!warning] 🎨/⚠️ FIX-1 — "Lực chiến (战力)" là chỉ số TỔNG HỢP
> In-game các thiên phú buff **"Lực chiến (战力)"** — đây là **CHỈ SỐ TỔNG HỢP**, **KHÔNG dịch thành "sát thương"**. Giữ nguyên chữ **战力**.
>
> Ý đồ chủ dự án ("thiên phú = buff sát thương cho lính") là **DESIGN INTENT**; nó **chênh** với chữ in-game (+Lực chiến 战力, một chỉ số gộp). Đây là điểm cần chốt — xem open-question về công thức 战力 tại [[systems/equipment-and-gear]] (§"Các điểm cần làm rõ", callout "Công thức 战力"). Liên quan [[open-questions]].

---

## Trường hợp "không có chiến pháp" — UNIT B

🎨 UNIT B ("Nhục Bác Tứ Sĩ lv4") có ô **chiến pháp TRỐNG** — minh hoạ một **đơn vị thuần đòn thường** (chỉ đánh basic, không xả 战法). Trong code, tình huống này = `Combatant.Skill2 == null` ⇒ `moraleReady` luôn false ⇒ luôn `BasicAttack` (`BattleRunner.cs:106,113`).

> [!question] FIX-2 — tương quan, không nhân-quả
> UNIT B có **Dũng 62 (rất thấp)** VÀ **không có chiến pháp** — đây là **TƯƠNG QUAN quan sát**, KHÔNG phải bằng chứng "Dũng thấp gây mất chiến pháp". Đừng suy ra quan hệ nhân-quả. Xem [[contradictions]].

---

## Gợi ý data model (ĐỀ XUẤT — chưa có trong code) ❓

> [!question] Code gap — proposal, KHÔNG phải canon
> Cấu trúc dưới đây là **đề xuất** để hợp nhất các facet; **chưa tồn tại** dưới dạng type đơn nhất trong code. Đánh dấu code gap.

```
UnitEntity {
    General;                         // danh tính tướng (tên, cấp Lv.220…)
    TroopType + level;               // binh chủng + bậc sao 4★  (facet 2)
    Formation: List<Row>;            // dạng render = biểu hiện của chính đơn vị (facet 1)
    Stats { 统(Thống); 勇(Dũng); 带兵量(CarryCap) };   // (facet 3,4) — ánh xạ code ❓
    Tactic { program; castMode; effects[] };          // (facet 6) — castMode ❓ dead-Skill1 ❓
    List<Talent>;                    // (facet 8) buff % 战力 theo bối cảnh, OffenseOnly ❓
    List<UnitBuff>;                  // vd ExtraRowsHit (facet 7) ❓
}
```

Trường `Tactic.program` trỏ tới **`TacticDto.Program`** đã được author trong `Server/data/scenario.json` (rule-engine data-driven, commit **cbe1297** — "author rule-engine skills in scenario.json"). Đây là hạ tầng hiện có để đơn vị mang chiến pháp data-driven; xem [[systems/tactics-and-rage]].

---

## Backlinks

- [[systems/battle-system]]
- [[systems/tactics-and-rage]]
- [[systems/troop-types]]
- [[systems/general-system]]
- [[entities/generals]]
- [[decisions/unified-unit-entity-model-2026-07-24]]
- [[sources/ingame-general-panel-2026-07-24]]
- [[sources/apk-reverse-engineering-2026-07-24]] — xác thực từ dịch ngược client (2026-07-24)
