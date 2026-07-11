---
title: CTXD — Kế hoạch tái kiến trúc Server-Client (LuzartUI + .anim + TCP server)
category: technical
tags: [ctxd, plan, server-client, luzartui, animation, tcp, spec]
created: 2026-06-30
updated: 2026-06-30
---

# CTXD — Kế hoạch tái kiến trúc (paste được sang session mới)

> Tài liệu này tự chứa: một session mới đọc nó + [[technical/ctxd-architecture]] + [[technical/luzart-ui]] + [[technical/luzart-di-core]] + memory `ctxd-arch-mandate` là đủ để triển khai. GDD: [[GDD]]. Battle geometry: [[systems/battle-system]].

> [!info] TRẠNG THÁI TRIỂN KHAI (cập nhật 2026-06-30) — server-authoritative xong
> - ✅ **P0** (contract chia sẻ): `Assets/Ctxd/Battle/Sim/Net/` = `Protocol.cs`/`Snapshots.cs`/`Wire.cs`(Newtonsoft)/`Framing.cs`. Event mới `UnitKilled/UnitAdded/SkillCast/ExpPopup`+`Exp/Count`. Newtonsoft client = `com.unity.nuget.newtonsoft-json` (manifest). **Verified** cả Unity compile lẫn .NET build.
> - ✅ **P1** (server): `Server/CtxdServer.csproj` (.NET8, port 5005, link sim, NuGet Newtonsoft), `Server/data/scenario.json` (số ở server), `BattleSession` = JoinBattle/ChooseStance/BattleEnd + **10 TEST API**. **Verified**: `dotnet run -- selftest` + `-- server`/`-- client` qua TCP thật. Memory `ctxd-server`.
> - ✅ **P2.1** (`NetworkService : IService` + `NetworkPump`): TCP client, recv-thread→main-thread `Pump()`, `Send(Command)`. **Verified** Unity↔server qua `execute_code`.
> - ⏳ Còn lại: **P2.2** `BattlePresenter` server-driven (bỏ `BattleRunner` local), **P3** `.anim`/Animator (AssetForge), **P4** LuzartUI (MainMenu/BattleHud/Result/TestApiPanel 10 nút), **P5** khớp ảnh, **P6** DI bag, **P7** dọn code tay. Code cũ còn chạy được (additive-first).

## 0. Bối cảnh — 3 điểm bản dựng 2026-06-30 làm SAI (chủ dự án chỉ ra)
1. **UI** code tay uGUI (`Assets/Ctxd/UI/BattleHud.cs`, `GameFlow.cs`) → phải dùng **LuzartUI** (`UIBase<T>` + `UIRegistrySO` + `UIManager`, UI prefab).
2. **Animation** tự code `SpriteFramePlayer` step frame → phải bake **`.anim` (AnimationClip) + AnimatorController** của Unity, prefab dùng **Animator**.
3. **Server-client**: client tự giải đòn → phải **fake server C# (TCP socket), số liệu ở SERVER**, server chạy sim, client **chỉ gửi lệnh + render** event nhận về.

Mục tiêu trực quan = ảnh chủ dự án: scene “Thế Giới Công Thành Chiến” + panel phải **“API CHIẾN ĐẤU (TEST)”** (10 nút), chân dung tướng + thanh máu 2 góc, badge số quân, list tướng (trái), exp pop-up khi chết, số sát thương, chat (dưới), ATT xanh / DEF đỏ, hero cưỡi ngựa + skill lửa.

## 1. Kiến trúc đích (server-authoritative)
```
[SERVER  (C# .NET console, TCP)] — GIỮ SỐ LIỆU + CHẠY SIM
  TcpListener → mỗi client 1 session trận
  Data số (tướng/binh/chiến pháp stats) load từ JSON server-side
  BattleRunner (sim thuần) resolve; RNG ở server
  Nhận Command → mutate state → broadcast List<BattleEvent>
        │  TCP (length-prefix + JSON)
        ▼
[CLIENT (Unity)] — CHỈ RENDER, KHÔNG resolve
  NetworkService (IService) ── TCP client, recv loop → marshal main thread
  BattlePresenter đọc event log → spawn prefab (Animator) + VFX + exp + số
  LuzartUI: MainMenu / BattleHud / Result / TEST-API panel  (gửi Command qua NetworkService)
  Data SO client = VISUAL refs (prefab/.anim/portrait), nạp vào Domain qua ContentBag
```

## 2. Chia sẻ code client↔server
- **Shared sources** (1 nguồn, compile vào CẢ hai): `Assets/Ctxd/Battle/Sim/*.cs` (đã thuần C#, không UnityEngine) + DTO contract (Command/Event/protocol). Server `.csproj` link bằng `<Compile Include="..\ctxd_client\Assets\Ctxd\Battle\Sim\**\*.cs" />` và file contract chung.
- **JSON = Newtonsoft (Json.NET)** — CHỐT (chủ dự án 2026-06-30). Client Unity: `com.unity.nuget.newtonsoft-json` (kiểm `Packages/manifest.json`, thêm nếu thiếu); Server .NET: NuGet `Newtonsoft.Json`. Dùng cùng DTO + cùng lib 2 phía.
- Client VẪN có sim trong Assets nhưng KHÔNG gọi `BattleRunner` để resolve (chỉ server gọi). Enforce: không reference BattleRunner trong client runtime.

## 3. Tái sử dụng vs viết lại (từ bản 2026-06-30)
| Giữ (tái dùng) | Sửa nhiều | Bỏ/Thay |
|---|---|---|
| `Battle/Sim/*` (chuyển thành shared, chạy ở server) | `BattlePresenter` (server-driven thay vì local runner; spawn prefab Animator) | `UI/BattleHud.cs`, `UI/GameFlow.cs` (→ LuzartUI) |
| `Data/*Definition.cs` (tách visual vs stat) | `BattleSideField`/`VisualSpawner` (Animator thay SpriteFramePlayer) | `Visual/SpriteFramePlayer.cs` (hạ xuống chỉ preview, không phải primary) |
| `Core/CtxdRoot`, `Singleton` | `CtxdRoot` cài ContentBag/ServiceBag (NetworkService) | client-side resolution (mọi nơi gọi BattleRunner trong client) |
| Sprite nguồn `Resources/sprite/*` | `Editor/SampleContentForge` (bake .anim + export server data) | |

## 4. TASK BREAKDOWN (theo thứ tự phụ thuộc)

### P0 — Contract & nền chia sẻ
- **T0.1** Định nghĩa protocol DTO (shared): `enum MsgType`; `Command` { JoinBattle; ChooseStance(stance,awaken); TestApi(kind, side) với kind ∈ {KillRow,KillRandom,UseSkill,AddUnit,Attack}, side ∈ {ATT,DEF} }; `ServerMsg` { BattleStart(setup snapshot), Events(List<BattleEvent>), State(snapshot) }. Khung tin = `[4-byte int length][UTF8 JSON]`. *Verify*: round-trip serialize/deserialize 1 message hai chiều.
- **T0.2** (ĐÃ CHỐT: Newtonsoft Json.NET) — thêm package Newtonsoft cho client nếu thiếu + NuGet `Newtonsoft.Json` cho server; viết helper `Framing` (read/write length-prefixed) + `Wire` (serialize/deserialize Newtonsoft) dùng chung. *Verify*: compile cả 2 phía.
- **T0.3** Tách `BattleEvent`/enums/Command vào namespace shared rõ ràng (đã có BattleEvent trong Sim). Thêm event mới cần cho ảnh: `UnitKilled`(exp), `UnitAdded`, `SkillCast`(hero), `ExpPopup`.

### P1 — Fake Server C# (TCP)
- **T1.1** (ĐÃ CHỐT: project .NET console RIÊNG) Project `Server/CtxdServer.csproj` (.NET 8 console, NuGet Newtonsoft.Json, link `..\Assets\Ctxd\Battle\Sim\**\*.cs`). `TcpListener` 127.0.0.1:5005, accept nhiều client, mỗi connection 1 vòng đọc khung tin. Chạy bằng `dotnet run` tách biệt Unity. *Verify*: client connect thấy log 2 phía.
- **T1.2** Server load **số liệu** (generals/troops/tactics stats) từ `Server/data/*.json` (nguồn sự thật cho số). Map sang `BattleSetup` của sim. *Verify*: in ra lineup + stats khi start.
- **T1.3** Session trận: client `JoinBattle` → server dựng trận mẫu (ATT vs DEF nhiều hàng như ảnh) → gửi `BattleStart` + `Events(Begin())`. `ChooseStance` → `StepRound` → broadcast events. *Verify*: chạy hết trận ra outcome, gửi BattleEnd.
- **T1.4** **TEST API** xử lý ở server: KillRow/KillRandom (giết lính hàng/ngẫu nhiên 1 phe → sinh UnitKilled+exp), UseSkill (ép cast skill phe đó → SkillCast+Damage), AddUnit (thêm đơn vị → UnitAdded), Attack (ép 1 đòn). Mỗi cái mutate state + broadcast. *Verify*: gửi từng lệnh, nhận đúng event.
- **T1.5** RNG + state hoàn toàn ở server (tất định, seed server). Client không có bản sao resolve.

### P2 — Client networking (Luzart service)
- **T2.1** `NetworkService : IService` (trong ServiceBag, nạp bởi `CtxdRoot`/`ServiceManager`). TCP client connect server; thread đọc → hàng đợi → bơm ra main thread (Update drain). API: `Send(Command)`, event `OnServerMsg`. *Verify*: connect + nhận BattleStart.
- **T2.2** `BattlePresenter` đổi nguồn: bỏ `BattleRunner` local; subscribe `NetworkService` → render `BattleStart`/`Events`. Giữ map combatant→visual. *Verify*: trận chạy bằng data server, client chỉ diễn.
- **T2.3** Disconnect/reconnect cơ bản + log lỗi.

### P3 — Animation Unity (.anim) — AssetForge (Editor)
- **T3.1** Tool `Ctxd.EditorTools.AssetForge`: với mỗi `sprite/army/{att,def}/<id>/<action 1..5>/` → tạo `AnimationClip` (.anim) key `SpriteRenderer.sprite` theo frame (fps cấu hình), loop cho Idle/Move. Lưu `Assets/Ctxd/Generated/Anim/...`. *Verify*: mở .anim thấy keyframe.
- **T3.2** Tạo `AnimatorController` (.controller) mỗi unit: state Idle/Move/Attack/Hurt/Die + param (Trigger/int), default Idle, transition. Dùng `UnityEditor.Animations.AnimatorController` API.
- **T3.3** Tạo prefab unit: `SpriteRenderer` + `Animator(controller)` + component mỏng `UnitView` (map `UnitAction`→`animator.Play/SetTrigger`). `UnitVisualDefinition` trỏ prefab theo phe. Hiệu ứng (skill lửa, exp, 觉醒) → prefab + .anim one-shot + `EffectVisualDefinition`.
- **T3.4** `BattleSideField`/`VisualSpawner` spawn prefab + drive **Animator** (bỏ SpriteFramePlayer làm primary). Hero unit có skill anim lớn. *Verify*: Play → unit chạy AnimationClip thật (không phải code tay).

### P4 — UI bằng LuzartUI (thay toàn bộ uGUI tay)
- **T4.1** Đọc kỹ [[technical/luzart-ui]]: `UIBase<TData>`, `UIRegistrySO`, `UIManager`, `UIId` (chỉ có dải System → **tự thêm UIId game**), `UIConfig` + `DirectPrefabUIAssetProvider` (default). Gotcha: `PoolOnClose` thực ra Destroy; provider không free RAM; `UIInputRouter` legacy Input (cân nhắc InputSystem/uGUI button trong prefab).
- **T4.2** Tạo UI prefab + `UIBase<T>` cho: **MainMenuUI**, **BattleHudUI** (2 chân dung+thanh máu, badge số quân, list tướng trái, bánh xe thế trận+GIÁC, chat dưới), **ResultUI**, **TestApiPanelUI** (10 nút như ảnh). Đăng ký `UIId` vào `UIRegistrySO`, show qua `UIManager`.
- **T4.3** Bỏ `Assets/Ctxd/UI/BattleHud.cs` + `GameFlow.cs`; làm `GameFlowUI`/state bằng LuzartUI. HUD subscribe NetworkService; TestApiPanel nút → `NetworkService.Send(TestApi(...))`.
- **T4.4** Verify: mở từng UI qua UIManager; nút TEST gửi lệnh; HUD cập nhật từ event server.

### P5 — Khớp tính năng theo ảnh
- **T5.1** Layout scene: ATT (xanh) nhiều hàng dưới-trái, DEF (đỏ) nhiều hàng trên-phải; hero cưỡi ngựa + skill lửa giữa; title + cờ phe; chat. (geometry: [[systems/battle-system]] — hàng đợi ≤5 tướng × ≥4 hàng × 3 nhóm × N lính).
- **T5.2** exp pop-up khi lính/đơn vị chết; số sát thương; badge số quân; magnifier ở list tướng.
- **T5.3** 10 nút TEST API hoạt động đúng (P1.4 + P4.2).

### P6 — Data theo Luzart SO (DI)
- **T6.1** `ContentBag` chứa definitions → `ContentManager.InstallBags` vào `Domain`; services (`GameDatabaseService`, `NetworkService`, `BattleService`) qua `ServiceBag`. `CtxdRoot` là composition root. (xem [[technical/luzart-di-core]]).
- **T6.2** Tách dữ liệu: **client SO = visual** (prefab/.anim/portrait); **server JSON = số** (stats). Đảm bảo client không chứa nguồn-sự-thật của số.

### P7 — Dọn code sai
- Gỡ resolution phía client; hạ `SpriteFramePlayer` xuống preview-only; xoá UI code tay; cập nhật wiki/memory.

## 5. Verify (mỗi task)
- Compile offline: memory `offline-compile-verify` (Roslyn + Bee .rsp; file mới → thêm vào source list của rsp).
- Chạy/nhìn: memory `headless-play-verify` (Unity MCP: `EditorApplication.Step()` drive frame; screenshot là camera render tươi; `execute_code` đọc state thật).
- Server: chạy `dotnet run` ở `Server/`, client Unity connect; kiểm bằng nút TEST + đọc console 2 phía.

## 6. Con trỏ context (đọc trước khi code)
- Mandate: memory `ctxd-arch-mandate`. Khung Luzart: [[technical/luzart-framework]] (hub) + [[technical/luzart-ui]] + [[technical/luzart-di-core]] + [[technical/luzart-view]] (cảnh báo ViewT). Build cũ (tái dùng sim/sprite): [[technical/ctxd-architecture]] §Trạng thái hiện thực, [[ctxd-game-build]]. Quy tắc: [[working-rules]]. Số liệu/cân bằng còn mở: [[open-questions]] (q-20260627-04 công thức damage, q-20260630-01 follow-ups).
