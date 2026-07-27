---
title: Căn chỉnh engine trận theo RE bản mobile (Stage 1)
category: decisions
tags: [battle, reverse-engineering, mobile, troop-counter, terrain, rage, sim]
sources: [raw/references/apk-reverse-engineering-gcld-2026-07-24.md]
created: 2026-07-24
updated: 2026-07-24
---

## Căn chỉnh engine trận CTXD theo reverse-engineering bản MOBILE 攻城掠地 v8.9 — Stage 1
**Date**: 2026-07-24
**Decided by**: chủ dự án (chọn "target = Mobile", "sửa theo RE")
**Status**: active

### Context
Sau khi dịch ngược client thật ([[sources/apk-reverse-engineering-2026-07-24]]), đối chiếu code Unity hiện có phát hiện 4 chỗ lệch ground-truth. Chủ dự án chốt **target = bản mobile** và yêu cầu sửa code cho khớp RE. Sim là C# thuần, **Server (`CtxdServer.csproj`) compile-include `Assets/Ctxd/Battle/Sim/**`** → verify bằng `dotnet build Server` + `selftest` + `dotnet test` (không cần Unity); phần presentation verify bằng Unity Editor.

### Decision (Stage 1 — đã implement & verify)
1. **Binh chủng 4 hệ + khắc chế** (item 1): giữ nguyên `enum TroopType` (KyBinh骑/ThuongBinh步/CungBinh弓/ChienXa器械/MuuSi谋士) → **migration = 0** (int trong `.asset`, string trong `scenario.json` không đổi). Khắc chế data-driven qua `BattleConfig.TroopCounterRing`, mặc định vòng mobile **步克弓/弓克骑/骑克器械/器械克步** (`{1:2,2:0,0:3,3:1}`); MuuSi ngoài vòng. Đặt `null` → về webgame 2013 (兵种互不相克). Khớp [[claims#c-20260724-10]].
2. **Địa hình đúng cơ chế** (item 3): **BỎ** affinity-theo-binh-chủng cũ (`TerrainMult` switch) → **thiên phú % Lực chiến (战力) per-tướng** (`Combatant.TerrainBonus`), hệ số NHÂN `(1+pct)`; **City (Thành trì) chỉ áp phe Công** (城池战力仅攻方). Thêm `Terrain.City/Pass` (append). `TerrainAffinityBonus` → deprecated.
3. **Nộ cast thủ công** (item 4): thay auto-fire bằng `useAble && input.Cast`; `Combatant.UseAble(moraleFull)` là nguồn-sự-thật-duy-nhất (sim/AI/snapshot); `CombatantSnapshot.CanCast` + `Command.Cast`; nút GIÁC HUD gate theo `CanCast`, gửi `(stance, awaken:true, cast:true)`; `autoStance=false`. AI phe Thủ giữ auto-cast. Khớp [[claims#c-20260724-09]].
4. **Từ vựng event** (item 2): fix bug **`TacticCast` không render** (director chỉ render `SkillCast`); append 8 `BattleEventType` (`ArmyLoaded/…/TacticHeld/TacticChain`) làm stub cho reportHandler map.

### Verification
- `dotnet build Server` = 0/0 · `selftest` = OK · `dotnet test` = **40/40** (thêm `ReAlignmentTests.cs` khoá hành vi RE) · Unity Editor compile = 0 lỗi.
- **Review đối nghịch** (workflow 4 agent): không lỗi chặn; 2 điểm NÊN-SỬA đã fix (comment Hán tự `枪/战车`→`步/器械`; `CanCast` bỏ hardcode 100 → dùng `MoraleFull`); Clone() deep-copy ring.

### Consequences / còn nợ (Stage 2 backlog)
- **Khắc chế binh chủng** hiện là ring cấp-config (universal). RE thật: buff **theo cấp per-tướng** (Thức tỉnh/tech "Khắc chế lv%") → Stage 2 nâng thành per-general.
- **Biến thể chiến pháp theo địa hình** (mã ID 7 số, report 27 chọn 3 biến thể + `recommend`): chưa làm.
- **Số cân bằng** (hệ số khắc chế, % thiên phú, ngưỡng nộ): ở SERVER — hiện là placeholder tunable (`TroopCounterBonus=0.2`, TerrainBonus author trong `scenario.json`).
- **Drift đường SO**: `GeneralDefinition.ToCombatant` chưa gán `TerrainBonus` (preview offline mất thiên phú) → Stage 2.
- **Breadth**: phantom/ảo ảnh, Surround/vây, công thành/trụ tên, chained tactic (`nextTacticId`), beHold (phản/giữ), miss/né (`ms`/`bj`) — Stage 2, mỗi mục = append enum + field snapshot + logic sim + render.

---
## Backlinks
- [[sources/apk-reverse-engineering-2026-07-24]] — ground-truth cho đợt căn chỉnh
- [[systems/battle-system]] · [[systems/tactics-and-rage]] · [[systems/troop-types]] · [[technical/ctxd-architecture]]
- [[claims#c-20260724-09]] (nộ cast thủ công) · [[claims#c-20260724-10]] (4 hệ khắc chế)
