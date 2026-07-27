---
title: Luồng điều hướng game (GameFlowController + LuzartUI screens)
category: technical
tags: [flow, navigation, luzart, ui, gameflowcontroller, protocol, server]
sources: []
created: 2026-07-25
updated: 2026-07-25
---

# Luồng điều hướng game — kiến trúc kỹ thuật

Điều phối bởi **`GameFlowController`** (`Assets/Ctxd/Battle/GameFlowController.cs`) trên 1 scene (`BattleServer.unity`), dùng LuzartUI lane `Screen` (độc quyền). Xem quyết định: [[decisions/game-flow-end-to-end-2026-07-25]].

## Sơ đồ luồng

```
Start → Connect(127.0.0.1:5005) → ListRoster + ListStages → ShowLobby
Lobby ──[XUẤT CHINH]──▶ SelectGeneral ──[TIẾP TỤC: ids]──▶ SelectStage
SelectStage ──[VÀO TRẬN: stageId, difficulty]──▶ JoinStage(stageId, ids, diff)
   server dựng session (override offense + scale difficulty) → ServerMsg.Lobby
   GameFlowController nhận Lobby → StartBattle → server BattleStart
   ServerBattleDirector render trận (HUD + fields + events)
Battle kết thúc → server BattleEnd → director.Finished(outcome)
   GameFlowController → (chờ 2.5s) ShowResult(win, reward theo difficulty)
Result ──[VỀ SẢNH]──▶ director.ResetForNewBattle() → ShowLobby
```

## Các màn (LuzartUI `UIBase<TData>`, `Assets/Ctxd/UI/`)

| Màn | UIId | Payload | Nội dung |
|---|---|---|---|
| `LobbyUI` | Lobby=1003 | `LobbyData` | Header Chủ Công (tên/cấp/tài nguyên stub), nút XUẤT CHINH / ĐỘI HÌNH, 4 nút stub khoá |
| `SelectGeneralUI` | SelectGeneral=1004 | `SelectGeneralData` | 8 thẻ tướng (tên/binh chủng màu/Lực chiến/cấp) + 5 vị trí 1→5; bấm thẻ thêm/bỏ (≤5), highlight vàng; TIẾP TỤC → `List<string> ids` |
| `SelectStageUI` | SelectStage=1005 | `SelectStageData` | 6 thẻ màn (tên/địa hình VN/địch) + 5 nút độ khó (Dễ/Thường/Khó/Địa Ngục/Chiến Thần); VÀO TRẬN → `(stageId, difficulty 1..5)` |
| `ResultUI` | Result=1002 | `ResultData` | CHIẾN THẮNG/THẤT BẠI + phần thưởng (EXP/Lương/mảnh tướng, scale theo độ khó) + VỀ SẢNH |
| `BattleHudUI` | BattleHud=3001 | (đã có) | 2 góc tướng + bánh xe 3 thế trận + GIÁC |

Binh chủng → nhãn+màu: `Ctxd.UI.TroopVisual` (Kỵ=cam-đỏ, Thương=xanh dương, Cung=xanh lá, Chiến Xa=vàng nâu, Mưu Sĩ=tím). **Không dùng ký tự Hán** (font TMP mặc định không có glyph CJK).

## Tách vai trò (dual-subscriber, không xung đột)

Cả `GameFlowController` và `ServerBattleDirector` cùng subscribe `NetworkService.ServerMessageReceived` (raise trên main thread qua `NetworkPump.Pump()`), xử lý **tập message rời nhau**:

| Message | Ai xử lý |
|---|---|
| `Roster`, `Stages` | GameFlowController (cache + rebind màn nếu đang mở) |
| `Lobby` | GameFlowController (→ `StartBattle`) |
| `BattleStart`, `Events`, `State`, `BattleEnd` | ServerBattleDirector (render) |

`ServerBattleDirector._externallyDriven` (Forge set `true`): director **không** tự `ConnectAndJoin` và **không** tự hiện `LineupUI` khi nhận `Lobby`. `GameFlowController` nghe `director.Finished` (không tự xử lý `BattleEnd`) để tránh trùng. `director.ResetForNewBattle()` dọn field + ẩn HUD/panel + reset trạng thái khi về sảnh.

> Race an toàn: `_externallyDriven` là serialized field do **Forge** set lúc author (không phụ thuộc thứ tự `Start()` giữa 2 MonoBehaviour). Connect do 1 mình flow controller sở hữu; director chỉ cần connection tồn tại trước `BattleStart` (đảm bảo vì cả hai subscribe trong `Start()`).

## Protocol (Protocol.cs — dùng chung client + server)

- `ClientMsgType`: … +`ListStages, ListRoster` (append-only).
- `ServerMsgType`: … +`Stages, Roster`.
- `Command`: +`OffenseGeneralIds` (đội hình theo thứ tự), +`Difficulty` (1..5); factory `JoinStage/ListStages/ListRoster`.
- `ServerMsg`: +`StageList` (`List<StageInfo>`), +`RosterList` (`List<GeneralSummary>`).
- `StageInfo{Id,Name,Terrain,DefenseNation,Desc,EnemyCount,Locked}`; `GeneralSummary{Id,DisplayName,Troop,Power,Level,Rows,Skill2Name}`. `Power` = Lực chiến (战力) composite, **KHÔNG phải sát thương** (xem [[systems/unit-entity-model]]).

## Server (Server/)

- Dispatch (`ClientConnection.cs`): `ListStages`/`ListRoster` xử lý **không cần session** (trước JoinBattle); `JoinBattle` gọi `dto.OverrideOffense(ids, roster)` + `dto.ApplyDifficulty(diff)` trước `ToSetup()`.
- Data layer (`ScenarioLoader.cs` — test được): `LoadRosterDtos()`, `RosterSummaries()`, `ListStages()`, `ScenarioDto.ApplyDifficulty(tier)`, `ScenarioDto.OverrideOffense(ids, roster)`, `GeneralDto.Power()/ToSummary()`.
- Files data: `roster.json`, `stages.json`, `stage_{khanhvang,quando,xichbich}.json`.

## Forge (Editor)

- `UIForge.BuildAll()`: +`BuildLobby/BuildSelectGeneral/BuildSelectStage/BuildResult` (+ helper `BuildGeneralCard/BuildLineupSlot/BuildStageCard/BuildTier`, `TextIn/Panel/FullBg/Highlight`); registry đăng ký 4 màn mới lane `Screen`.
- `ServerSceneForge.Build()`: thêm GameObject `GameFlowController` (wire `network/uiManager/director`) + set `director._externallyDriven=true`.
- Menu: `CTXD ▸ Server ▸ Build Server Battle Scene (UI + wiring)` → dựng lại toàn bộ.

## Verify (đã chạy 2026-07-25)
`dotnet build` 0 lỗi · **84/84 test** (+12 `CampaignFlowTests`) · selftest OK · Unity compile 0 lỗi · play-test thật đi hết luồng, 0 exception (8 screenshot).

---
## Backlinks
- [[decisions/game-flow-end-to-end-2026-07-25]] — quyết định + lý do
- [[technical/client-server-architecture]] — mô hình server-authoritative
- [[systems/battle-system]] — phần trận đánh mà luồng dẫn tới
- [[systems/city-conquest]] — PvE phó bản (nguồn "chọn màn")
