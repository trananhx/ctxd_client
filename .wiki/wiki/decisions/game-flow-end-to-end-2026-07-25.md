---
title: Luồng game end-to-end — Lobby → Chọn tướng → Chọn màn → Đánh → Kết quả
category: decisions
tags: [flow, ui, navigation, luzart, server-authoritative, lobby, campaign]
sources: []
created: 2026-07-25
updated: 2026-07-25
---

# Luồng game end-to-end (Lobby → Chọn tướng → Chọn màn → Đánh → Kết quả)

**Date**: 2026-07-25
**Decided by**: Chủ dự án ("làm hoàn thiện con game từ lobby → chọn tướng → chọn màn → đánh, end-to-end")
**Status**: active

### Context
Trước đó game chỉ có **1 lát dọc**: scene `BattleServer.unity` tự động `JoinBattle` khi Play → hiện màn lineup (reorder) → đánh. Không có sảnh, không có chọn tướng thực sự (chỉ đổi thứ tự đội hình server gửi sẵn), không có chọn màn, không có màn kết quả. `UIId.MainMenu`/`UIId.Result` là **placeholder** chưa có class; `event Finished` của director chưa có subscriber. Cần dựng luồng điều hướng đầy đủ, **giữ nguyên** mô hình server-authoritative (số liệu ở server, client chỉ render) và pattern **Forge** (sinh scene/UI bằng code).

### Options considered
1. **Đa scene + SceneManager.LoadScene** — mỗi màn 1 scene. Cons: codebase chưa có scene-loader, `CtxdRoot` không DontDestroyOnLoad (`_persistAcrossScenes=0`), phải wire lại mọi thứ qua transition → rủi ro cao, lệch pattern hiện có.
2. **Màn hình trên 1 scene qua LuzartUI lane `Screen` (độc quyền)** — mỗi màn = prefab `UIBase<TData>` đăng ký `UIRegistrySO`, show/hide bằng `UIManager`. Pros: đúng precedent (`MainMenu`/lineup đã dùng lane Screen), không cần scene-loader, `UIManager` là DontDestroyOnLoad sẵn. Cons: mọi UI sống chung 1 scene (chấp nhận được).

### Decision
Chọn **Option 2**. Toàn bộ luồng chạy trên `BattleServer.unity`:
- **4 màn mới** (`Ctxd.UI`, kế thừa `UIBase<TData>`): `LobbyUI`, `SelectGeneralUI`, `SelectStageUI`, `ResultUI` — mỗi màn có payload + callback, serialized refs do Forge wire (không `Find`/`GetComponent` runtime), theo đúng mẫu `LineupUI`/`BattleHudUI`.
- **`UIId`** thêm `Lobby=1003, SelectGeneral=1004, SelectStage=1005` (dùng lại `Result=1002`).
- **`GameFlowController`** (MonoBehaviour) điều phối: connect → xin roster/stages → Lobby → Chọn tướng → Chọn màn → `JoinStage` → (server trả Lobby) → `StartBattle` → director render → nghe `director.Finished` → Kết quả → về Lobby.
- **Tách vai trò (dual-subscriber)**: `GameFlowController` lo pre/post-battle + connect + `JoinStage`/`StartBattle`; `ServerBattleDirector` chỉ render **trong** trận. Forge set `director._externallyDriven=true` → director KHÔNG tự connect/JoinBattle và KHÔNG tự hiện lineup. Cả hai cùng subscribe `NetworkService.ServerMessageReceived`, xử lý **tập message rời nhau** (flow: Roster/Stages/Lobby; director: BattleStart/Events/State/BattleEnd) → không xung đột.

**Server-authoritative giữ nguyên**: client gửi **ý định** (ListRoster/ListStages/JoinStage/StartBattle); server dựng session, tính trận, trả về. Roster/stages/độ khó/override đội hình đều xử lý ở tầng data server (test được, không cần Unity).

### Wire protocol (Protocol.cs — source dùng chung client+server)
- `ClientMsgType` +`ListStages, ListRoster`; `ServerMsgType` +`Stages, Roster` (append-only, wire-stable).
- `Command` +`OffenseGeneralIds` (đội hình đã chọn, theo thứ tự) +`Difficulty` (1..5); factory `JoinStage(stageId, ids, difficulty)`, `ListStages()`, `ListRoster()`.
- DTO mới: `StageInfo` (catalog "chọn màn"), `GeneralSummary` (thẻ "chọn tướng", có `Power`=Lực chiến 战力 composite — **KHÔNG phải sát thương**).

### Server data (mới)
- `Server/data/roster.json` — pool 8 tướng khả chọn (đủ 5 binh chủng 骑/步/弓/器械/谋士).
- `Server/data/stages.json` — manifest 3 màn; mỗi `Id` map tới `{Id}.json`.
- `Server/data/stage_khanhvang.json` / `stage_quando.json` / `stage_xichbich.json` — 3 kịch bản (địa hình + phe Thủ khác nhau).
- `ScenarioDto.ApplyDifficulty(tier)` nhân binh lực phe Thủ (Thường=1.0, Khó=1.6, Địa Ngục=2.4, Chiến Thần=3.5); `ScenarioDto.OverrideOffense(ids, roster)` thay offense mặc định bằng đội hình đã chọn.

### Consequences
- **Verify**: `dotnet build` 0 lỗi; **84/84 test** (`Tests/CtxdSim.Tests`, +12 `CampaignFlowTests`); selftest OK; Unity compile 0 lỗi; **play-test thật đi hết luồng** (8 screenshot: Lobby→ChọnTướng→chọn 5 tướng→ChọnMàn→chọn Quan Độ/Khó→Đánh Quan Vũ vs Viên Thiệu→CHIẾN THẮNG thưởng scale→về Lobby dọn trận), 0 exception.
- **Còn nợ (follow-up)**: chân dung tướng thật (`tacticalGeneralPicMax`) thay cho thẻ màu; màn "chờ" (Công vs Thủ + đếm ngược) trước trận; hệ tài khoản thật (hiện Lobby stub tên/cấp/tài nguyên); ghép đôi tướng (周瑜●诸葛亮) 1 slot; gate mở khoá màn/tướng theo tiến trình; `UIId.MainMenu`/`LineupUI` legacy vẫn đăng ký nhưng flow mới không dùng.

Liên quan: [[technical/game-flow-navigation]], [[technical/client-server-architecture]], [[systems/battle-system]], [[systems/unit-entity-model]], [[systems/city-conquest]], [[decisions/re-align-battle-mobile-2026-07-24]].

---
## Backlinks
- [[index]] — mục lục
- [[technical/game-flow-navigation]] — chi tiết kỹ thuật luồng điều hướng
- [[GDD]] — §13 UI/UX, §7 PvE công thành, §4 hệ tướng
