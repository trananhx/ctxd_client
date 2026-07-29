---
title: Log
category: log
created: 2026-06-27
updated: 2026-07-27
---

# ctxd_client — Log

Chronological record of all wiki operations.

## [2026-06-27] init | Wiki initialized
- Created `.wiki/` structure inside project folder
- Added to qmd collection: `ctxd-client`
- Detected project: Unity 6.5 (6000.5.1f1), URP 17.5, 2D toolchain (Aseprite/PSD/SpriteShape/Tilemap), new Input System
- Seeded [[overview]] and [[technical/asset-pipeline]] from a read of `Assets/` (sprites, packages, ProjectSettings)
- Ready for first source ingest (GDD → `raw/gdd/`)

## [2026-06-27] research+ingest | Game identified & 攻城掠地 documented
- Identified the game: recreation of **Công Thành Xưng Đế / 攻城掠地** (傲世堂 webgame, 2013) — confirmed by user + asset evidence
- Ran multi-agent web research (12 systems, VN+CN sources, adversarial verification) → [[sources/ctxd-web-research-2026-06-27]]
- Surfaced critical 3-game disambiguation (webgame vs 2019 VGP mobile vs 乱世曹操传) → [[decisions/game-version-scope]]
- Pages created: [[systems/battle-system]], [[systems/tactics-and-rage]], [[systems/troop-types]], [[systems/general-system]], [[systems/formation-system]], [[systems/city-conquest]], [[systems/economy-and-internal-affairs]], [[systems/equipment-and-gear]], [[systems/multiplayer-and-endgame]], [[systems/progression-and-vip]], [[entities/generals]], [[world/world-map-and-campaign]], [[technical/asset-system-mapping]], [[decisions/game-version-scope]]
- Pages updated: [[overview]], [[claims]] (18 claims), [[contradictions]] (7), [[open-questions]] (12), [[technical/asset-pipeline]], [[index]]

## [2026-06-27] ingest | Primary-source screenshot (xungde.somo.vn)
- User provided an in-game screenshot → confirms target game definitively (somo.vn platform, Quan Vũ, Công/Thủ, world city-siege at Bạch Đế, command UI)
- Resolved battle VIEW type: isometric diagonal + squad-grid; att=Công(attacker)/def=Thủ(defender)
- Page created: [[sources/screenshot-somo-battle-2026-06-27]]
- Pages updated: [[systems/battle-system]] (geometry + in-battle command UI), [[technical/asset-system-mapping]] (att/def=Công/Thủ), [[claims]] (c-19), [[contradictions]] (x-06 partially resolved), [[open-questions]] (q-05 partial), [[index]]

## [2026-06-27] ingest | 3 more screenshots (stance wheel + 武将对决 duel)
- Stance WHEEL confirmed: Đột Kích/Phòng Thủ/Tấn Công + center Giác (觉醒 in-battle awaken), ~3-4s timer
- 武将对决 duel: **5 positions 一二三四五/side**, joint pair 周瑜●诸葛亮, per-general troop-type icons (马超=骑/黄忠=弓/周泰=枪/黄月英=战车/周瑜·诸葛亮=谋士) → live game has ≥5 troop types (谋士+战车) → version-drift insight
- 武斗会 (martial tournament 8进4, 平原战) + 击鼓支持 (drum-support spectating)
- Pages updated: [[systems/battle-system]], [[systems/troop-types]], [[systems/multiplayer-and-endgame]], [[entities/generals]], [[claims]] (c-20,c-21), [[contradictions]] (x-01,x-06), [[open-questions]] (q-05,q-08), [[sources/screenshot-somo-battle-2026-06-27]]

## [2026-06-27] synthesize | Master GDD compiled
- Created [[GDD]] — single-document Game Design Document synthesizing all 24 pages + screenshot evidence, in Vietnamese, with confidence markers (✅/⚠️/❓/🎨)
- 16 sections: vision, core loop, combat, generals, troops, formations, PvE, world, economy, equipment, multiplayer, progression, UI, technical, open decisions, build roadmap
- Updated [[index]] to feature GDD as the master doc

## [2026-06-27] design | Client/Server architecture & work split
- Created [[technical/client-server-architecture]] — server-authoritative architecture, responsibility matrix per system, server/client module breakdown, combat turn-flow, anti-cheat, and concrete work division (Client / Server / Shared contracts)
- Adversarial architecture review (red-team agent) launched to verify before finalizing
- Updated [[index]]

## [2026-06-27] ingest | Customer battle-UI spec (resolves battle geometry)
- Customer-provided requirements for pre-battle screen, in-battle UI, troop geometry, terrain → [[sources/customer-battle-ui-spec-2026-06-27]]
- **RESOLVED battle geometry**: side = queue ≤5 generals (sequential) → each general ≥4 rows (sequential) → 3 groups/row → N soldiers/group (default 6, variable). Closed [[contradictions#x-20260627-06]] + [[open-questions#q-20260627-05]]
- Added: pre-battle waiting screen, reinforcement (借兵→queue end), skill cutscenes, under-foot circles (warState), static-terrain rule
- Pages updated: [[systems/battle-system]], [[GDD]] (§3.1/§13/legend 📋), [[technical/asset-system-mapping]], [[claims]] (c-22), [[contradictions]] (x-06 resolved), [[open-questions]] (q-05 answered)

## [2026-06-27] harden | Client/Server architecture revised per red-team
- Incorporated adversarial review findings into [[technical/client-server-architecture]] (§12 hardening): national-war concurrency, disconnect/reconnect, commit-reveal turn protocol, payment/reward idempotency, bot detection, server-side fog & auto-tactic, shared-C# scoping + float determinism

## [2026-06-27] refine | Formation system is rich & data-driven (owner)
- Owner clarified: troop-row shape is per-row situational (answer B); formations are many & varied, tied to generals (e.g. troops along both sides of a path), each with distinct gameplay characteristics — not just the 3–4 web 阵法 (VN "9 formations" now plausible)
- Reframed [[systems/formation-system]] (data-driven FormationLayout), [[systems/battle-system]] (Row.shape situational + data model), [[GDD]] §6, [[claims]] (c-23), [[open-questions]] (q-13: mechanism known, catalog to enumerate)

## [2026-06-29] rules | Owner set mandatory working agreement
- 5 rules: (1) wiki everything, (2) do it yourself autonomously (Unity MCP for hard tasks, manual steps yourself), (3) self-compile & self-verify vs requirements, (4) always re-check GDD, (5) re-read GDD/wiki when context thin
- Recorded in vault `CLAUDE.md` (Working agreement) + memory `working-rules.md`
- NOTE: Unity MCP currently DISCONNECTED → need Editor open + reconnect to compile/run/drive Unity (rules 2-3)

## [2026-06-29] research | Luzart framework deep-analysis → client architecture
- Ran 8-agent workflow deep-reading all ~130 Luzart .cs files (7 module clusters) + synthesis blueprint
- Created [[technical/luzart-framework]] — catalog: Content/DI (Domain+EventBus), Universe/Saveable, ReactiveValues, ThanhDemo/DataResources (SO stat architecture), View, LuzartUI, Tween/Select/Attributes — with patterns, API, and VERIFIED cautions (RuntimeStat.InitStat bug, AssetBool_Constant NotImplemented, AssetNumber_Formula returns 0, EventBus not thread-safe, pre-impl files missing, UI doc≠code)
- Created [[technical/client-architecture-patterns]] — blueprint: 6-layer client (Domain→Services→SO data→Reactive→View/UI→Tween), pattern→Luzart→CTXD map, battle-slice plan (SO data, turn FSM, stance wheel=Command+Strategy, server events→ReactiveValues, composite render 5×≥4×3×N), use-now vs build, P0-P6 MVP roadmap
- Updated [[GDD]] §14, [[index]]; client = SO Architecture + design patterns on Luzart, SERVER-AUTHORITATIVE (client never resolves combat)

## [2026-06-29] cleanup | Gỡ code rác để Luzart compile (0 lỗi)
- Project không compile (41 lỗi CS0246/CS0115): file demo/pre-impl tham chiếu type không tồn tại (Odin `Sirenix`, `StatType`/`ItemConfig`/equipment, `ICost*`, `GameManagerData`/`UIManagerData`, `Singleton<>`/`UniverseView`/`FindItemEditor`). UniTask + DOTween có cài → giữ.
- GỠ: `Content/ThanhDemo/`, `Content/DataResources/`, `Content/Universe/Universe.cs`, `Content/Universe/SceneRootManager.cs`, 2 nút editor `FindAll*` trong Bag. SỬA (Odin→attribute Luzart): `SaveService`/`ServiceBag`/`ContentBag`. GIỮ: Odin trong `#if ODIN_INSPECTOR` (guard hợp lệ).
- **Xác minh: 3 assembly (Assembly-CSharp, -firstpass, -Editor) compile 0 lỗi** — offline bằng Roslyn bundled của Unity + Bee `.rsp` (khớp Editor.log thật). Unity Editor chưa tự recompile (chưa focus).
- Pages created: [[decisions/luzart-compile-cleanup-2026-06-29]]
- Pages updated: [[technical/luzart-framework]] (intro cleanup note, §2 Universe, §4 ThanhDemo/DataResources marked removed)

## [2026-06-29] implement | CTXD battle vertical slice + Task-1 asset generator (Assets/Ctxd)
- Built the first gameplay code (owner's two overnight tasks). Waited for 3 concurrent agents (compile-cleanup, Luzart refactor, framework analysis) to finish first, then built on the cleaned framework.
- **Task 1** — `Ctxd.EditorTools.AssetForge` (Editor): sprite sequences → frame-by-frame Unity `AnimationClip`s + `AnimatorController`s + prefabs (SpriteRenderer+Animator+UnitView/EffectView) + `UnitVisualDefinition`/`EffectVisualDefinition` SOs, all refs wired in code; one-click (CTXD ▸ Forge) + CLI. [[technical/asset-generation-pipeline]]
- **Task 2** — battle vertical slice following the owner's SO→prefab→spawn pattern:
  - `Ctxd.Battle.Sim` — pure-C# deterministic resolver + `BattleEvent` log (stance triangle, morale→skill2, tactics/awakening, terrain, seeded RNG). **Verified by standalone smoke test** (determinism, win/lose, stance advantage 40/40 vs 0/40).
  - `Ctxd.Data` — `GeneralDefinition`/`TroopTypeDefinition`/`TacticDefinition`/`FormationDefinition`/`UnitVisualDefinition`/`EffectVisualDefinition`/`BattleConfigDefinition`/`CtxdGameDatabase` (all `AbstractScriptableContent`).
  - `Ctxd.View`/`Ctxd.Battle` — `UnitView : ViewT<T>`, `UnitFormationView`, `EffectView`, `FloatingText`, `BattlePresenter` (plays the event log) + `SpriteFramePlayer` (renders before baking).
  - `Ctxd.UI` — coded uGUI `BattleHud` (2 portraits+HP/morale, stance wheel 突击/攻击/防守 + 觉, command menu, banners, result).
  - `CtxdBootstrap` (composition root) + `SampleContentForge` (6 generals/6 tactics/5 troops/3 formations + Battle scene). CTXD ▸ Build Everything.
- **Verified**: all code compiles 0 errors (runtime + Editor) offline via bundled Roslyn; sim logic verified by execution. **NOT done** (no Editor access — MCP disconnected, project locked): asset bake + Play-test → one click for owner: focus Editor → CTXD ▸ Build Everything → open Battle.unity → Play.
- Pages created: [[technical/ctxd-code-architecture]], [[technical/asset-generation-pipeline]], [[decisions/ctxd-implementation-2026-06-29]]
- Pages updated: [[log]], [[index]]

## [2026-06-29] cleanup | Port 2 reactive primitive còn thiếu vào ReactiveValues
- Theo yêu cầu chủ dự án (gộp reactive về ReactiveValues, giữ build xanh). `Content/ThanhDemo/` đã bị [[decisions/luzart-compile-cleanup-2026-06-29]] gỡ → trùng lặp Content vs ReactiveValue hết, nhưng 2 primitive THUẦN (chưa có bản trong ReactiveValues) mất theo.
- Đưa lại từ backup vào `Assets/Luzart/ReactiveValues/Numbers/` (namespace `Luzart`→`Luzart.Reactive`, thêm doc + `readonly`/`sealed` cho khớp style): `RuntimeNumber_Constant` (số hằng, không phát Changed) và `INumberWithContribution` (`INumber` + Contribute/Uncontribute). Tạo `.meta` GUID mới.
- KHÔNG đụng content hỏng (Asset*/Stat/Calculator/NumberPicker/ResourcePool vẫn nằm ở backup `…/573e6a91…/scratchpad/Luzart_backup_0218`, cần Odin + type game để compile).
- **Xác minh: compile 0 lỗi** — Roslyn bundled của Unity + Bee `.rsp` (374 ref / 143 define), build trọn bộ ReactiveValues (18 file) thành DLL OK.
- Pages updated: [[log]]

## [2026-06-29] document | Nghiên cứu kỹ Luzart → 9 trang chi tiết từng folder
- Chủ dự án **discard** code build trước (`Assets/Ctxd`) vì chưa ưng; yêu cầu đọc kỹ Luzart, note kỹ từng framework/folder + cách dùng, gắn triết lý **"cái gì cũng là SO; visual spawn = prefab gán trong SO; sửa visual = sửa prefab"**.
- Đọc TRỰC TIẾP code hiện tại (post-cleanup, ~96 file): tự đọc `Content/DI`+`View`+`Saveable`+`Universe`; 6 agent đọc song song `ReactiveValues`/`UIFramework`/`TweenAnimation`/`NewBaseSelect`/`Attributes+Editor`/`AssetModifier` (mọi claim trích chữ ký + cite file:line).
- Pages created: [[technical/luzart-di-core]], [[technical/luzart-view]] ⭐, [[technical/luzart-saveable]], [[technical/luzart-reactivevalues]], [[technical/luzart-ui]], [[technical/luzart-tween]], [[technical/luzart-select]], [[technical/luzart-authoring]], [[technical/luzart-assetmodifier]]
- Pages updated: [[technical/luzart-framework]] (thành hub + callout triết lý + link 9 trang), [[index]]
- Phát hiện chính (đã xác minh từ code): `Domain.InitializeAll/StartAll` chỉ duyệt `_contents` (service do `ServiceManager`); `ViewT.children` null khi AddComponent runtime; `ViewChilding.cs` có `using UnityEditor;` không guard; `UIId` chỉ có dải System (tự thêm); `PoolOnClose` thực ra Destroy; DirectPrefab provider không giải phóng RAM; `UIInputRouter` dùng legacy Input; `ShowInInspectorEditor` là CustomEditor GLOBAL (xung đột); `SaveService.OptimizedSaveItem` parse float theo culture mặc định; `ServiceBag` thiếu `[CreateAssetMenu]`.
- Lưu ý: trang build cũ ([[technical/ctxd-code-architecture]], [[technical/asset-generation-pipeline]], [[decisions/ctxd-implementation-2026-06-29]]) mô tả code ĐÃ BỊ DISCARD — đánh dấu superseded, giữ làm tham khảo khi dựng lại đúng kiểu Luzart.
- **Đính chính (theo phản hồi chủ dự án): `ViewT` KHÔNG dùng được như đang có** — `ViewChilding.cs` có `using UnityEditor;` không bọc `#if` (vỡ build player, CS0246) + KHÔNG nơi nào trong project dùng `ViewT`/`View` (grep rỗng) + reflection/NPE. Triết lý SO→prefab→spawn KHÔNG cần `ViewT`: `Instantiate(so.prefab)` + `Setup()` thường trên MonoBehaviour của prefab. Đã sửa [[technical/luzart-view]] (cảnh báo + pattern khuyến nghị) + callout [[technical/luzart-framework]].

## [2026-06-30] build+verify | Battle slice CHẠY ĐƯỢC trong Unity + đội hình + HUD + bánh xe thế trận
- Tiếp tục bản dựng lại `Assets/Ctxd` (folder Core/Visual/Battle/Data/Editor, KHÔNG khung view, render fallback sprite từ Resources) theo [[technical/ctxd-architecture]]. Session trước viết code (compile sạch) nhưng CHƯA chạy thử lần nào. Unity MCP đã kết nối lại → chạy + xác minh thật.
- **Xác minh chạy (Unity MCP)**: `CTXD ▸ Build Everything` tạo 6 tướng/6 chiến pháp/5 binh chủng + `Battle.unity`; Play → trận tự đấu (AI-vs-AI) render quân từ `Resources/sprite/army/{att,def}/<id>/<action>`, số sát thương nổi, nền chiến trường; chạy hết tới **OffenseWins** (hồi 15), 0 lỗi console. Cách drive/verify headless: `EditorApplication.Step()` (runInBackground KHÔNG đủ giữ editor unfocused tick) — ghi nhớ trong memory.
- **Sửa/Thêm (đều compile 0 lỗi offline + Unity):**
  - `CtxdRoot`/`BattleLauncher`: `Application.runInBackground=true` (để loop chạy khi editor mất focus → verify được).
  - `UnitVisual`/`SpriteFramePlayer`: thiếu sprite 1 action → fallback về Idle → fallback ô màu theo phe (KHÔNG bao giờ vô hình).
  - `BattleSideField`: layout **đội hình isometric** (parallelogram 4×5, sort theo Y, lunge khi đánh) thay cho lưới rời; 2 đạo quân đối mặt giữa màn (roots ±1.4, ortho 2.7) — đọc ra như trận thật.
  - `Ctxd.UI.BattleHud` (MỚI, uGUI thuần, KHÔNG khung view): tên 2 tướng + thanh **máu (lính) + nộ khí**, banner sự kiện/kết quả, đếm hồi; render **ScreenSpaceCamera** (ảnh chụp lấy được HUD tươi). **Bánh xe thế trận** (Đột Kích/Tấn Công/Phòng Thủ + GIÁC) = `ITurnInputSource` → người chơi điều khiển phe Công; EventSystem + `InputSystemUIInputModule` (reflection, không phụ thuộc cứng). Xác minh: 13 lượt chọn thế của người chơi → ra kết quả.
  - `SampleContentForge`: tên hiển thị in-game = TIẾNG VIỆT (font mặc định không có chữ Hán → tránh tofu □□); giữ bilingual trong source.
- **Trạng thái**: trận đánh ĐÃ CHƠI ĐƯỢC (người vs AI, có HUD + thế trận + kết quả). Chưa làm: VFX chiến pháp, main menu/pre-battle/replay loop, pass cân bằng + GDD-align. Theo dõi trong task list phiên.
- Pages updated: [[log]], [[technical/ctxd-architecture]] (sẽ cập nhật trạng thái verified). Memory: [[ctxd-game-build]] (VERIFIED RUNNING), thêm `headless-play-verify`.

## [2026-06-30] build+review | Vòng chơi đầy đủ + review đối nghịch + VFX chiến pháp
- **Vòng chơi (GameFlow)**: Main Menu (“CÔNG THÀNH XƯNG ĐẾ” + Bắt đầu trận/Xem AI/Thoát) → Trận → Kết quả (banner thắng/thua) → Đánh lại (reload scene) / Về Menu. Scene = Camera + CtxdRoot + GameFlow; `BattleLauncher` tách `Run()` (không auto-start), expose `Presenter`; scene đăng ký Build Settings để reload-replay. **Xác minh**: menu→13 lượt người chơi→OffenseWins→post-panel; Đánh lại reload + auto-start trận mới.
- **Review đối nghịch (workflow 26 agent: 23 báo, 16 xác nhận)** → đã sửa các lỗi thật: clamp Resilience≤1 (`CombatOps`), 觉醒 cộng địa hình (`CombatOps`), HUD hết soft-lock khi trận xong lúc đang chờ stance (`BattleHud.OnFinished` reset IsWaiting + ẩn wheel), lunge guard khi field bị destroy (`BattleSideField`), `BattlePresenter.OnDestroy`=StopAllCoroutines, cache `Resources.LoadAll` (`SpriteFramePlayer`), bỏ glyph ⚔ (tofu) → “vs”. **Bác bỏ (đã kiểm) finding “tactic thiếu sĩ khí khi đánh”** — skill2 reset nộ về 0 là thiết kế đúng (tiêu nộ), không phải lỗi.
- **VFX chiến pháp**: `EffectVisualDefinition` thêm `resourcesPath/fps/scale`; `VisualSpawner.SpawnEffect` dựng hiệu ứng từ `Resources/sprite/eff/...` khi không có prefab (mirror unit fallback); forge tạo 3 hiệu ứng (gjjl/WuShenFuTi/wujiangjuexing) + gán `castEffect` cho 6 chiến pháp. **Xác minh**: cast “Giảo Long Cự Lãng” spawn `fx_skill_generic` (99 frame, render trên mục tiêu, tự hủy) + banner + số sát thương.
- Trạng thái: **battle slice CHƠI ĐƯỢC, đã review + hardened**. Follow-up (Skill1, AoE đa mục tiêu, pool, chọn đội hình/địa hình, cân bằng, PvE) ghi ở [[open-questions]].
- Pages updated: [[technical/ctxd-architecture]] (mục “Trạng thái hiện thực”), [[open-questions]], [[log]]. Memory: [[ctxd-game-build]].

## [2026-06-30] re-architect | Server-authoritative: P0 contract + P1 server + P2.1 NetworkService (VERIFIED)
- Bắt đầu sửa 3 điểm sai bản 2026-06-30 theo [[technical/ctxd-server-client-plan]] + memory `ctxd-arch-mandate`. Điểm #3 (server-client) làm xong + xác minh; #1 (LuzartUI) và #2 (.anim/Animator) còn lại.
- **P0 — Hợp đồng chia sẻ (pure C#, dùng chung client↔server):** thêm `Assets/Ctxd/Battle/Sim/Net/` = `Protocol.cs` (`Command{JoinBattle,ChooseStance,TestApi}`, `ServerMsg{BattleStart,Events,State,BattleEnd,Error}`, enum `TestApiKind`/`SideRef`), `Snapshots.cs` (`BattleSnapshot.From(BattleState)` — client render từ snapshot, KHÔNG giữ runner), `Wire.cs` (Newtonsoft), `Framing.cs` (`[4-byte LE len][UTF8 JSON]`, endian-độc-lập). Thêm event `UnitKilled/UnitAdded/SkillCast/ExpPopup` + field `Exp`/`Count` vào `BattleEvent`. Newtonsoft client: `com.unity.nuget.newtonsoft-json` 3.2.2 (đã có sẵn transitively qua Addressables; promote thành direct dep ở `manifest.json`).
- **P1 — Server C# .NET8 console riêng** (`Server/CtxdServer.csproj`, NuGet Newtonsoft 13.0.3 từ cache offline, **link** `..\Assets\Ctxd\Battle\Sim\**\*.cs` = 1 nguồn sự thật). `TcpListener` 127.0.0.1:5005, 1 thread + 1 `BattleSession` / kết nối. **SỐ LIỆU Ở SERVER**: `Server/data/scenario.json` (Ngũ Hổ Tướng vs Ngụy, troop 16043/13770/… như ảnh) → `BattleSetup`. `BattleSession` chạy sim (RNG server), xử lý JoinBattle→BattleStart, ChooseStance→StepRound, và **10 TEST API** (KillRow/KillRandom/UseSkill/AddUnit/Attack × ATT/DEF) mutate state + broadcast event log.
- **P2.1 — `NetworkService : IService`** (`Assets/Ctxd/Net/`, `AbstractScriptableService` + `[CreateAssetMenu]`) — TCP client, thread recv → `ConcurrentQueue` → `Pump()` bơm ra MAIN thread (raise `ServerMessageReceived/Connected/Disconnected/NetworkError`), `Send(Command)`, gen-counter chống thread cũ. `NetworkPump : MonoBehaviour` drain mỗi frame.
- **Xác minh (cả 2 phía, thật):** (a) `dotnet run -- selftest` → P0 round-trip qua framing+wire OK (kể cả diacritics tiếng Việt qua UTF-8), 10 TEST API đều sinh đúng event. (b) `dotnet run -- server` + `-- client` qua **TCP thật**: JoinBattle→BattleStart(5v5), Attack(CRIT 1115), UseSkill→Võ Thần Phụ Thể (Giác Tỉnh), KillRow→−3800 +475EXP, AddUnit→Viện Binh, ChooseStance→AutoBrain đối đáp, snapshot cập nhật. (c) **Unity Editor**: Assembly-CSharp compile 0 lỗi với `Net` namespace + Newtonsoft; `execute_code` `NetworkService.Connect→Send→Pump` nhận đúng BattleStart/SkillCast,Damage/UnitKilled,ExpPopup từ server. Số liệu hoàn toàn ở server, client chỉ gửi lệnh + nhận event.
- **Còn lại**: P2.2 BattlePresenter server-driven (bỏ `BattleRunner` local), P3 .anim/Animator (AssetForge), P4 LuzartUI (4 màn + 10 nút), P5 khớp ảnh, P6 DI bag, P7 dọn code tay. Code cũ (BattleHud/GameFlow/local runner) còn nguyên & chạy được — sẽ thay khi đường mới hoàn tất (additive-first).
- Pages updated: [[technical/ctxd-server-client-plan]] (status), [[log]]. Memory: thêm `ctxd-server`.

## [2026-06-30] fix | Quy tắc PREFAB — bake .anim+controller+prefab thật, gán vào SO (chủ dự án bắt lỗi)
- **Chủ dự án bắt lỗi**: bản 2026-06-30 KHÔNG có 1 file `.prefab` nào — `UnitVisualDefinition.attackPrefab/defensePrefab` + `EffectVisualDefinition.prefab` đều null, `VisualSpawner` dựng quân/hiệu ứng bằng CODE từ Resources. Vi phạm quy tắc lõi: **cái gì sinh ra cũng phải là prefab gán vào SO; sửa visual = sửa prefab**. Memory `prefab-spawn-rule`.
- **Sửa — `Ctxd.EditorTools.AssetForge`** (`Assets/Ctxd/Editor/AssetForge.cs`, menu CTXD ▸ Forge ▸ Bake All Prefabs): bake `sprite/army/{att,def}/<id>/<action 1-5>/` + `sprite/eff/<slug>/` → `AnimationClip`(.anim, key `SpriteRenderer.m_Sprite`, loop Idle/Move) + `AnimatorController`(.controller, state Idle/Move/Attack/Hurt/Die, default Idle) + `.prefab` (SpriteRenderer+Animator+UnitVisual/EffectVisual) → **gán prefab vào SO**. Tạo `Assets/Ctxd/Generated/{Anim,Controllers,Prefabs}`: **20 prefab** (16 quân att/def×8 id + 3 hiệu ứng gjjl/WuShenFuTi/wujiangjuexing + FloatingText), 19 controller, 82 anim. Thêm `CtxdGameDatabase.floatingTextPrefab`.
- **Gotcha đã xử lý**: controller mới tạo chưa commit GUID lúc `SaveAsPrefabAsset` → Animator.controller serialize null. Fix = pass 2 (`LoadPrefabContents`→set `runtimeAnimatorController`→`SaveAsPrefabAsset`) SAU `SaveAssets`+`Refresh`. Bake là op đồng bộ DÀI → MCP `execute_code` timeout nhưng vẫn chạy xong; verify qua filesystem (`m_Controller:.*guid`) + ForceUpdate ImportAsset để làm tươi cache editor.
- **`VisualSpawner` siết theo quy tắc**: chỉ `Instantiate(prefab)`; prefab null = lỗi content (log), KHÔNG fallback dựng code. `SpawnFloatingText` cũng dùng prefab. `SampleContentForge.BuildEverything` giờ gọi `AssetForge.BakeAll()`; bỏ dòng `e.prefab=null`.
- **VERIFY (Play thật, headless Step)**: instantiate `unit_att_10.prefab` → `ctrl=att_10`, sprite chạy `1_0`(idle)→`3_0`(attack) khi step → **Animator phát .anim thật**. Trận AI: **32/32 quân spawn từ prefab, 32/32 có AnimatorController**, ảnh chụp 2 đạo quân (xanh ATT dưới-trái, đỏ DEF trên-phải) + máu/nộ + số sát thương (−340/−308). Đúng quy tắc: spawn = prefab trong SO.
- Còn lại: HUD vẫn là uGUI tay (P4 LuzartUI), presenter server-driven (P2.2). Memory: `prefab-spawn-rule`. Pages updated: [[log]].

## [2026-06-30] feature | Hình học trận server-authoritative — Tướng→Hàng→Nhóm (Phase 1, brainstorm+duyệt)
- Chủ dự án phân tích ảnh gốc: 1 tướng = **nhiều HÀNG nhóm quân**, mỗi hàng nhiều **CỘT nhóm**, mỗi **nhóm** = a×b lính một **binh chủng**; đánh **ăn hàng-nhóm đầu** → hết hàng → hàng sau tiến; hàng hiển thị **rời nhau**. Qua brainstorming + AskUser: chọn **server mô hình đầy đủ** + **binh chủng per-NHÓM** (trộn loại). Spec: [[decisions/battle-geometry-server-model-2026-06-30]].
- **Sim (shared)**: thêm `Group{Troop,MaxSoldiers,Soldiers,SpriteCols,SpriteRows}` / `Row{Shape,Groups}` / `RowShape{HangNgang,CanhCung}` ([Formation.cs]); `Combatant.Formation` + `FrontRow`/`LivingRows`/`SyncTroops`. `CombatOps.ApplyDamageToFront` (rải sát thương hàng đầu → `GroupKilled` khi nhóm tan, `RowAdvanced` khi hết hàng, overkill tràn hàng sau) + `HealFront`; `ApplyDamageRaw` route qua đây ⇒ **mọi đòn (basic/战法/TEST) tự thành đánh-theo-hàng**. `BuildSide` dựng formation mặc định (Rows×3 cùng binh chủng) nếu data không khai báo.
- **Snapshot/protocol**: `CombatantSnapshot.Formation → RowSnapshot{Shape,Groups} → GroupSnapshot{Troop,MaxSoldiers,Soldiers,SpriteCols,SpriteRows}`.
- **Server**: `scenario.json` mỗi tướng có `Formation` (mảng hàng×nhóm binh-chủng) — Quan Vũ [kỵ,kỵ,cung,thương], Tào Tháo [thương,kỵ,kỵ,cung]; `ScenarioLoader`/`FormationBuilder.FromLayout` dựng; TEST `KillRow` = **bỏ nguyên hàng đầu**.
- **Client**: `CtxdGameDatabase.GetVisualForTroop(troop)` → prefab theo binh chủng; `BattleSideField.Build(CombatantSnapshot,faction,db)` render **hàng rời** (giãn iso) × **nhóm** (cụm SpriteCols×Rows prefab theo binh chủng nhóm); sprite/nhóm co theo % lính. Presenter feed snapshot; `UnitVisual.Play` check animator **live** (sửa fallback edit-mode). Vẫn 100% prefab-trong-SO.
- **VERIFY**: server `selftest` → Quan Vũ rows=4/groups=3/**mixedTroopTypes=True**, `KillRow DEF` livingRows **4→3** (đúng 1 hàng), event `[GroupKilled×3,RowAdvanced,UnitKilled,ExpPopup]`; SELFTEST OK. Unity: NetworkService JoinBattle → snapshot server (mixed) → `BattleSideField` render **72 unit/tướng, 4 hàng rời, 3 binh chủng** (KyBinh/CungBinh/ThuongBinh), ảnh `phase1_rows_groups_v3.png` khớp ảnh gốc (ATT xanh dưới-trái, DEF đỏ trên-phải, hàng rời).
- **Hoãn Phase 2** (sau P4): viện binh=tướng mạnh nhất, phó tướng (lấy 1 hàng), màn chọn tướng trước trận. Pages: [[decisions/battle-geometry-server-model-2026-06-30]], [[log]].

## [2026-06-30] feature | P2.2 — Trận chạy END-TO-END từ server (server-driven, bỏ runner local)
- **`ServerBattleDirector`** (`Assets/Ctxd/Battle/`): client KHÔNG còn `BattleRunner` local — connect `NetworkService` → `JoinBattle` → nhận `BattleStart/Events/State/BattleEnd`, **render từ snapshot** (rebuild `BattleSideField` cho tướng đang đánh mỗi side), diễn event log (Attack→lunge+Hurt+số sát thương, SkillCast→hiệu ứng lửa+觉醒, UnitKilled/ExpPopup→số nổi, RowAdvanced→re-render hàng tiến). `autoStance` tự gửi `ChooseStance` để chạy vòng (tới khi HUD bánh xe thay). API cho UI: `SendStance`, `SendTestApi`. Tất cả prefab-trong-SO.
- **Scene `BattleServer.unity`** (`ServerSceneForge`): Camera + `CtxdRoot`(Domain) + **`ServiceBag` chứa `NetworkService`** (Luzart DI) + `NetworkPump` (drain main-thread, lazy-resolve) + `ServerBattleDirector`. NetworkService số liệu KHÔNG ở client.
- **Phó tướng** (Phase 2) chốt + ghi spec: phó tướng = **1 hàng** của tướng chủ; tướng chỉ-là-1-con (không hàng) không thể là phó tướng. [[decisions/battle-geometry-server-model-2026-06-30]].
- **Bug đã sửa**: `ServiceBag` install NRE — `CtxdRoot._serviceBags[0]` serialize null (SerializedObject gán asset vừa tạo → null lúc save); fix = reload bag từ disk + `ApplyModifiedProperties`+`SetDirty`. `NetworkPump` lazy-resolve tránh race Awake-order. `UnitVisual.Play` check animator live (fix fallback edit-mode).
- **VERIFY (Play thật)**: server `dotnet run -- server` + scene Play → server log "client connected / JoinBattle"; client render **37 unit (37 có AnimatorController), round 12**, ATT Quan Vũ troops 16043→5988, DEF Tào Tháo→2076 (combat ở server, client chỉ diễn), số sát thương −1698/−2115 nổi. Ảnh `p22_server_driven.png`. Số liệu hoàn toàn server-authoritative.
- Còn lại: **P4 LuzartUI** (HUD 2 chân dung+máu, bánh xe thế trận+GIÁC, **panel 10 nút TEST** như ảnh → `SendTestApi`), **P5** khớp layout ảnh (nền, vị trí, hero), **P6/P7** dọn. Pages: [[log]]. Memory: cập nhật [[ctxd-server]].

## [2026-06-30] feature | P4 LuzartUI + END-TO-END đầy đủ (HUD + panel 10 nút TEST) — auto-wire, no runtime Find
- **Quy tắc mới (chủ dự án)**: runtime KHÔNG `FindObjectOfType`/`GameObject.Find`/`GetComponent`-search/locator — mọi ref là `[SerializeField]` **forge tự kéo trong Editor**. Memory `no-runtime-find`. Đã refactor: bỏ `CtxdRoot.Instance`/`Resources.Load`/`GetService` ở `ServerBattleDirector`+`NetworkPump`; bỏ `GetComponent` fallback ở `UnitVisual`.
- **LuzartUI (mandate #1)** — `UIId` thêm BattleHud/TestApiPanel; `UI/BattleHudUI : UIBase<BattleHudData>` (2 tên+thanh máu+sĩ khí, banner, bánh xe Đột Kích/Tấn Công/Phòng Thủ/GIÁC) + `UI/TestApiPanelUI : UIBase<TestApiPanelData>` (10 nút). `UIForge` bake **prefab UI + UIRegistrySO** và **tự wire mọi ref con** (reflection vào private serialized: `_buttons[10]`, `_offName`…). Director `ShowAsync<T>()` giữ instance trả về, đẩy state vào (không Find).
- **`ServerSceneForge`** dựng `BattleServer.unity` + `UIManager`(Canvas+6 lane root)+`EventSystem`, **auto-wire toàn bộ** (director db/net/ui, pump svc, UIManager registry/lanes, CtxdRoot db/bags) bằng reflection. Menu `CTXD ▸ Server ▸ Build Server Battle Scene (UI + wiring)`.
- **Bug**: `SerializedObject` gán array-element vào asset vừa tạo → serialize null (CtxdRoot._serviceBags) → chuyển sang reflection `SetValue(wholeArray)` + reload asset. Đã ghi gotcha vào memory.
- **VERIFY (Play thật)**: HUD + panel **đều hiện** (UIManager visible); bấm nút **"Kill hàng 1 — DEF"** → `SendTestApi` → server bỏ hàng đầu (Trương Liêu **rows 3→2**), client re-render. Ảnh `p4_full_end_to_end.png`: panel phải 10 nút (DEF đỏ/ATT xanh), HUD tên+máu+banner "Hòa thế"+bánh xe, 2 đạo quân + số sát thương/exp. **Vòng end-to-end đầy đủ: nút LuzartUI → lệnh → server mutate → event → client diễn.**
- Còn (theo "làm hết"): **P5** khớp ảnh (nền chiến trường, đặt góc không đè, hero cưỡi ngựa, magnifier); **P7** xoá UI tay cũ (`UI/BattleHud.cs`,`GameFlow.cs`) + scene `Battle.unity` local. Memory: `no-runtime-find`, `ctxd-end-to-end`. Pages: [[log]].

## [2026-06-30] complete | P5 khớp ảnh + P7 dọn + refactor no-runtime-GetComponent + Phase 2 (viện binh/phó tướng)
- **P7 dọn**: xoá `BattlePresenter`/`BattleLauncher`/`ITurnInputSource`/`UI/BattleHud.cs`/`UI/GameFlow.cs` + scene `Battle.unity` (đường local-runner + UI tay cũ); `SampleContentForge` bỏ `SetupBattleScene` (menu giờ "Content + Prefabs"). Chỉ còn đường server-driven (`BattleServer.unity`).
- **Refactor no-runtime-Find triệt để**: `UnitVisualDefinition` đổi `attackPrefab/defensePrefab` (GameObject) → `attackUnit/defenseUnit` (`UnitVisual` typed) ⇒ `Instantiate(unit)` trả component, KHÔNG `GetComponent`; `CtxdGameDatabase.floatingText` typed; `VisualSpawner.SpawnUnit/SpawnFloatingText` trả typed; bỏ `GetComponent` fallback ở `UnitVisual.Play`/`EffectVisual.Play`. AssetForge tự wire typed ref (editor). **Verify**: 8/8 unitVisual wired, db.floatingText ok.
- **P5 khớp ảnh** (`p5_polished.png`): nền chiến trường `warBG` (scale full view), **hero cưỡi ngựa** (scale 2.0/phe, ở đầu đội hình) lấy binh chủng tướng, 2 đạo quân vào giữa màn (root ±1.9), panel TEST dời lên góc phải-trên (hết đè HUD tên Thủ), HUD tên+máu+banner+bánh xe. Rất sát ảnh gốc somo.
- **Phase 2 (server)**: **Viện binh = tướng mạnh nhất** — `scenario.json` thêm `OffenseReserve/DefenseReserve`; `AddUnit` chọn reserve mạnh nhất (Power=MaxTroops+atk) vào cuối hàng đợi. **Phó tướng** — `GeneralDto.Deputy`; `AddWithDeputy` cho phó tướng chiếm **1 hàng** của tướng chủ (chủ còn rows-1, phó có 1 hàng máu = tổng/rows, stat phó). **Verify selftest**: "offense lineup has a deputy" ✓, "AddUnit ATT → 'Khương Duy' (strongest)" ✓, SELFTEST OK.
- **Verify Play (cuối)**: scene polished chạy, 45 unit (45 controller), hero scale 2.0, background, HUD+panel visible, 0 lỗi console; số liệu server-authoritative.
- (Phase 2 chọn-tướng làm tiếp ở mục dưới.) Memory: `no-runtime-find`, `ctxd-end-to-end`. Pages: [[log]].

## [2026-06-30] complete | Phase 2 cuối — màn CHỌN & SẮP XẾP TƯỚNG trước trận (lobby) → XONG HẾT
- **Protocol**: thêm `ClientMsgType.StartBattle` + `ServerMsgType.Lobby` + `Command.Order` (hoán vị hàng đợi Công). Server: `JoinBattle` dựng session **chưa Begin** → gửi `Lobby(snapshot)`; `StartBattle(order)` → `BattleSession.ReorderOffense(order)` (validate hoán vị) → `Begin` → `BattleStart`.
- **Client LuzartUI**: `UI/LineupUI : UIBase<LineupData>` — màn "BÀY BINH BỐ TRẬN" 6 ô cố định (forge wire), mỗi ô tên + ▲▼ đổi thứ tự + nút "VÀO TRẬN". `UIForge.BuildLineup` bake prefab + wire `_slots[6]`/`_confirm`; đăng ký `UIId.MainMenu` lane Screen. Director: `Lobby`→ShowLineupAsync (tên tướng từ snapshot, callback Confirm), `BattleStart`→ShowBattleUiAsync (HUD+panel); fallback auto-StartBattle nếu thiếu UI.
- **Bug đã sửa**: lần đầu Lobby không tới client do **state cũ tích lũy qua nhiều lần Play** (NetworkService SO giữ socket/queue cũ) — fix: `Connect` drain `_inbound`/`_mainActions` + recompile sạch. Verify lại fresh: OK.
- **VERIFY (Play thật)**: connect → **màn Lineup hiện** (Quan Vũ/Trương Phi/Triệu Vân/**Quan Bình (Phó)**/Mã Siêu/Hoàng Trung + ▲▼ + VÀO TRẬN, ảnh `p2lineup.png`); bấm ▲ đưa Trương Phi lên đầu → VÀO TRẬN → server reorder → `queue[0]=Trương Phi`; battle hiện HUD+panel, lineup ẩn; bấm nút TEST chạy. Ảnh cuối `final_battle.png`: HUD 2 tên+máu+banner "Thủ thắng thế", panel 10 nút, 2 đạo quân hàng-nhóm rời + **2 hero cưỡi ngựa**, số sát thương −3701, nền chiến trường. Server selftest vẫn OK.
- **HOÀN TẤT TOÀN BỘ**: 3 lỗi mandate (LuzartUI / .anim+Animator / server-client) + geometry hàng-nhóm + đánh-theo-hàng + viện binh-tướng-mạnh + phó tướng + chọn-tướng-trước-trận + khớp ảnh + no-runtime-Find + prefab-trong-SO. Memory: `ctxd-end-to-end` (cập nhật). Pages: [[log]], [[decisions/battle-geometry-server-model-2026-06-30]].

## [2026-07-10] fix | Sửa HƯỚNG CHÉO đội hình + đánh "giết từng cụm HÀNG một" (theo phản hồi chủ dự án + ảnh gốc)
- **Bối cảnh**: chủ dự án đối chiếu ảnh gốc somo (ảnh 1) vs bản dựng `final_battle.png` (ảnh 2) → 2 lỗi: (a) **hướng chéo đội hình bị NGƯỢC** ("chéo ngược lại"); (b) đánh nhau **giết lẻ từng NHÓM (cụm)** thay vì **giết nguyên HÀNG một** (递进击杀 — khớp [[systems/battle-system]] "đánh dồn từng hàng / tiệm tiến kích sát").
- **Fix hình học** (`Assets/Ctxd/Battle/BattleSideField.cs`): 1 **hàng ngang** giờ trải theo đường chéo **"\\"** (vuông góc trục giáp mặt Công↔Thủ), thay vì "/" cũ (đảo dấu `groupAxis.y`/`spriteCol.y`); các **hàng lùi theo đường chéo "/"** ra xa địch (offense về dưới-trái, defense về trên-phải) thay cho kiểu xếp gần-thẳng-đứng cũ. Thêm **nén hàng sống về trước** (`rowSlot` chỉ đếm hàng còn lính) ⇒ hàng đầu tan thì hàng sau **TIẾN LÊN**.
- **Fix cơ chế giết** (`Assets/Ctxd/Battle/Sim/CombatOps.cs` — dùng CHUNG client+server): `ApplyDamageToFront` rải sát thương **ĐỀU theo tỉ lệ** trên cả hàng đầu ⇒ 3 nhóm hao **cùng nhau** và **TAN NGUYÊN HÀNG một lượt**, không còn dồn chết nhóm đầu trước. `KillRow` vẫn "bỏ đúng 1 hàng" (bất biến selftest giữ nguyên).
- **VERIFY**: server `selftest` OK (Attack cơ bản → 0 GroupKilled = chỉ mỏng đi; đòn lớn → 3 GroupKilled+RowAdvanced cùng lúc; KillRow rows 4→3). Play thật (headless, server-driven): sau nhiều đòn, 3 nhóm hàng đầu DEF về [404 406 406] (đều nhau ⇒ rải tỉ lệ), diagonal đã lật "\\", KillRow → DEF rows 4→3 + hàng sau tiến lên. Ảnh: `Assets/Screenshots/diag_fix_clean.png`, `diag_fix_advance.png`.
- **Phản hồi vòng 2 (cùng ngày)**: chủ dự án chỉ thêm — tướng to đùng ở **hàng đầu** + đợt sửa 1 **nén hàng** làm khối co từ sau ⇒ nhìn như "hàng sau chết trước". (Bước trung gian: bỏ nén, tướng ra sau — `herofix_*.png`. SAU ĐÓ bị vòng 3 sửa lại.)
- **Phản hồi vòng 3 (cùng ngày) — chốt mô hình "dạng tướng"**: chủ dự án làm rõ — (a) **các hàng sống VẪN TIẾN LÊN cho tới hết** (mình xoá nén ở vòng 2 là SAI, phục hồi lại); (b) **1 tướng = DẠNG thể hiện** của nó (vài hàng quân / chỉ 1 con tướng / kết hợp; phó tướng = hàng "x" của tướng khác), **chết khi dạng chết hết** — KHÔNG phải 1 figure to riêng gắn kèm. Sửa (`BattleSideField.cs`): **bỏ figure tướng to riêng** (dạng "vài hàng quân" ⇒ render thuần các hàng, tướng chính là các hàng); **phục hồi nén hàng** (`rowSlot`) ⇒ hàng đầu chết trước, hàng sau tiến lên; thêm nhánh dạng **"1 con tướng"** (render 1 đơn vị lớn khi không có hàng — để sẵn cho data-driven). Verify Play: units/phe giảm (hết hero), KillRow ATT `r0`→0 rồi `r1`→0, hàng sống nén tiến lên (`form_v3_00/01/02_advance.png`).
- Pages: [[log]], [[decisions/battle-geometry-server-model-2026-06-30]] (thêm mục Correction).

## [2026-07-15] chore | Hạ phiên bản project → Unity 6000.2.8f1
- **Yêu cầu chủ dự án**: sửa để dùng được ở Unity **6000.2.8f1** (6.2). Trước đó `ProjectVersion.txt = 6000.3.14f1`, cache lẫn vết 6000.5.1f1.
- **Điều tra**: 18 package đọc min-Unity từ `Library/PackageCache` → tất cả ≤ 6000.2 (tương thích). Code không có guard/API riêng 6.3. Revision editor `c9992ac36c34`.
- **Sửa**: `ProjectVersion.txt` → 6000.2.8f1; `manifest.json` hạ ugui 2.5.0→2.0.0, test-framework 1.7.0→1.6.0, multiplayer.center 1.0.1→1.0.0; **xóa** 2 module 6.3-only `modules.adaptiveperformance` + `modules.vectorgraphics` (không code nào dùng) khỏi manifest+lock. `ProjectSettings.asset` được Editor tự chuẩn hóa (bỏ 4 field 6.3-only, giữ define DOTWEEN).
- **VERIFY (headless 6000.2.8f1, `-batchmode -nographics -quit`)**: exit 0, resolve sạch (hết "invalid dependencies"), **0 lỗi CS**, Tundra build success 34.77s, sinh đủ 5 assembly (Assembly-CSharp*, LuzartUI*). `OverflowException` của APIUpdater là lành tính (đọc cache graph bản cũ thất bại rồi tạo lại).
- Pages: [[log]], [[decisions/unity-downgrade-6000.2.8-2026-07-15]].

## [2026-07-15] bugfix | Sprite tím rịm (magenta) — thiếu material dùng chung
- **Triệu chứng**: sau khi mở bằng 6000.2.8f1, mọi sprite tím rịm; chủ dự án yêu cầu built-in, không URP.
- **Root cause (đã chứng minh)**: render pipeline đã là Built-in sẵn (không URP/SRP). Test quét material ref trong `Assets/Ctxd`: đúng **1 guid thiếu** `a97c105638bdf8b4a8650670310a4cd3` — material sprite dùng chung của 19 prefab (`unit_*`,`fx_*`) + `BattleServer.unity`. Là material 2D-default của URP gán tự động khi còn URP, thành tham chiếu chết khi URP bị gỡ ⇒ magenta. Guid chưa từng là `.mat` được commit.
- **Fix**: tạo `Assets/Ctxd/Visual/UnitSprite.mat` (+meta guid khớp) dùng shader built-in `Sprites/Default` (fileID 10753) ⇒ 1 asset resolve cả 20 ref. Verify cấp tham chiếu: 0 material thiếu. Trực quan: chờ focus Editor (Assets→Refresh).
- Memory: `ctxd-sprite-material` (mới). Pages: [[log]], [[bugs/magenta-sprites-missing-material-2026-07-15]].

## [2026-07-24] ingest/decision | Unified Unit Entity Model
- Chốt mô hình **tướng+lính = 1 đối tượng** từ directive chủ dự án + 4 ảnh màn "Tướng lĩnh" (mobile 攻城掠地). Đọc 3 đơn vị (UNIT A nữ áo tím Lv.220 công thành / UNIT B nam giáp vàng Lv.201 Dũng 62 không chiến pháp / UNIT C nam tóc trắng Lv.204 kỵ binh) → gear Công/Thủ/Sức chứa quân, Thống/Dũng, binh chủng có bậc sao, chiến pháp, chiến thuật icon, thiên phú Lực chiến, binh lực/mộ binh.
- Pages created: [[systems/unit-entity-model]], [[decisions/unified-unit-entity-model-2026-07-24]], [[sources/ingame-general-panel-2026-07-24]]
- Pages updated: thêm 5 claims (c-20260724-01..05); reframe [[systems/general-system]] / [[systems/troop-types]] / [[systems/tactics-and-rage]] / [[entities/generals]] + [[GDD]] §4/§5; resolve quan-hệ tướng-lính; mở [[contradictions]] x-20260724-01 (Thống/Dũng ↔ code NormalAtk/TacticAtk chưa chốt) + [[open-questions]] q-20260724-01..03. Chạy qua 2 workflow (reconcile + verify: 13/13 code-gap CONFIRMED).
- Ghi chú FIX: giữ nguyên chữ "Lực chiến (战力)" = chỉ số tổng hợp (không dịch "sát thương", DESIGN INTENT chênh → [[systems/equipment-and-gear]] open-question 战力); Thống/Dũng ↔ NormalAtk/TacticAtk là suy diễn (mâu thuẫn 3 chiều → [[contradictions]]); ảnh bản MOBILE, chờ chốt vs somo webgame ([[decisions/game-version-scope]]); hậu tố LV4/cấp4 = bậc sao binh chủng 4★ (suy luận, tách khỏi cấp tướng).

## [2026-07-24] verify | Đối chiếu web CTXD
- Chạy workflow tìm-kiếm-web + phản biện (URL thật). Xác nhận: 统/勇 (không có 武力) → resolve x-20260724-01; binh lực=HP chết-theo-hàng; 带兵量 3 trụ; số hàng riêng từng 战法; cast thủ công; 战力≠sát thương.
- Sửa: Nhục Bác Tứ Sĩ→Tử Sĩ (binh chủng Chu Thái, giải thích chiến pháp trống); Mã Siêu=铁骑无敌 3 hàng → tách UNIT C.
- GIỮ nghi vấn: bậc sao binh chủng (số liệu game khác, chưa gán CTXD), +60% công thành UNVERIFIED, tên 攻城车/黄金战骑.
- Pages created: [[sources/ctxd-web-verify-2026-07-24]]
- Pages updated: [[log]], [[claims]], [[contradictions]], [[open-questions]], [[systems/general-system]], [[systems/troop-types]], [[systems/tactics-and-rage]], [[entities/generals]], [[GDD]]

## [2026-07-24] ingest | Dịch ngược APK client 攻城掠地 (nguồn sơ cấp)
- **Dịch ngược APK** `Xưng Đế Công Thành_1.apk` (game 8.9.0.6, chính game ctxd_client làm lại): Cocos2d-x + LuaJIT; decompile **1115/1115** file bytecode bằng `luajit-decompiler-v2`; khôi phục tên qua `md5(path.lua)` → cây source 698 file có tên. Bảng bản địa hoá Việt (`res/lang_zh_cn`).
- Chạy **6 subagent song song** bóc tách: battle engine (server-replay, ~47 event type, 12 hàng, phantom, Surround), binh chủng (4 hệ 步/弓/骑/器械), tướng (Thống/Dũng, 6 phẩm chất, Thức tỉnh, roster ~24 tướng), chiến pháp/nộ (mã ID 7 chữ số ×địa hình, cast server-gate+tap), kinh tế (nô lệ, 6 khu thành, cây công nghệ), meta (3 nước, Hội chiến, Phong Địa≠bang hội, cross-server).
- **Kết luận then chốt**: kiến trúc **server-authoritative** (client chỉ replay report) → con số cân bằng ở server; GDD dịch ngược mạnh về cấu trúc/luật/enum.
- Pages created: [[sources/apk-reverse-engineering-2026-07-24]] (+ nguồn bất biến `raw/references/apk-reverse-engineering-gcld-2026-07-24.md`, 618 dòng)
- Pages updated: [[claims]] (+10: c-20260724-07…16 client-confirmed), [[contradictions]] (**giải quyết x-05 phẩm chất→A**; củng cố x-01 binh chủng, x-02 nộ, x-06 12-hàng), [[index]]; cần lan sang [[systems/battle-system]] / [[systems/tactics-and-rage]] / [[systems/troop-types]] / [[systems/general-system]] (callout xác thực client).
- File GDD standalone đầy đủ: `scratchpad/GDD_final.md` (bản deliverable độc lập cho chủ dự án).

## [2026-07-24] decision/impl | Căn chỉnh engine trận theo RE mobile (Stage 1)
- Chủ dự án chốt **target = mobile**, sửa code battle theo reverse-engineering. Chạy workflow Understand+Design (6 agent) → spec compile-safe → implement Stage 1 → review đối nghịch (4 agent) → fix.
- **Đã sửa & verify**: (1) binh chủng 4 hệ + vòng khắc chế 步克弓/弓克骑/骑克器械/器械克步 (data-driven, giữ enum → 0 migration); (2) địa hình = thiên phú % Lực chiến per-tướng (bỏ affinity cũ, City chỉ phe công, thêm City/Pass); (3) nộ cast thủ công (`useAble && Cast`, `CanCast`, nút GIÁC gate); (4) fix bug `TacticCast` không render + 8 enum event mới.
- **Verify**: dotnet build 0/0, selftest OK, 40/40 test (thêm `ReAlignmentTests.cs`), Unity compile 0 lỗi.
- Files: sim `Assets/Ctxd/Battle/Sim/*` + `Server/*` + `scenario.json` + `ServerBattleDirector.cs`/`BattleHudUI.cs`.
- Pages created: [[decisions/re-align-battle-mobile-2026-07-24]]
- Stage 2 backlog (trong decision): khắc chế per-tướng, biến thể chiến pháp theo địa hình, phantom/vây/công thành/chained tactic, drift SO TerrainBonus.

## [2026-07-24] impl | Stage 2 breadth — battle engine RE-alignment (2A-2E)
- Triển khai TOÀN BỘ Stage 2 theo RE mobile: workflow design (6 agent) → implement 5 sub-stage (build/test gate mỗi bước) → review đối nghịch (4 agent) → fix.
- **2A** né(`ms`)/beHold(phản-giữ)/chuỗi(`nextTacticId`)/Loạn Vũ; **2B** khắc chế binh chủng per-tướng (`Combatant.CounterVsTroop`, cộng chồng ring); **2C** biến thể chiến pháp theo địa hình (`TerrainTag`+jiacheng) + report27 (`TacticVariantOffer`); **2D** phantom (`BattleSession.CopyArmy` deep-copy) + surround (≥5× → slam + cấm cast); **2E** trụ tên công thành (`Tower`+`UpdateCityTower`) + hoả + vá drift SO `GeneralDefinition.TerrainBonus`.
- **Review CHẶN đã fix**: beHold không tiêu nộ → kẹt vòng tới MaxRounds; + phân biệt beHold 1(đỡ)/2(phản chiến giáng sát thương ngược); comment ring RE-confirmed-vs-simplification; HUD thanh nộ dùng `MoraleFull`.
- **Verify**: dotnet build 0/0, **72/72 test** (Stage2A-E + fix), selftest OK, Unity compile 0 lỗi/0 warning. Mọi feature gated/neutral-default → **0 drift** trận cũ.
- Pages updated: [[decisions/re-align-battle-mobile-2026-07-24]] (Stage 2 = DONE).

## [2026-07-25] impl | Luồng game end-to-end: Lobby → Chọn tướng → Chọn màn → Đánh → Kết quả
- Chủ dự án yêu cầu dựng luồng hoàn chỉnh. Workflow Understand (5 agent map bootstrap/net/battle-entry/server-data/GDD) → thiết kế → implement 4 layer (server+protocol → UI screens+flow controller → Forge → verify).
- **Kiến trúc**: giữ server-authoritative + pattern Forge; điều hướng qua LuzartUI lane `Screen` (1 scene, không scene-loader). `GameFlowController` điều phối pre/post-battle + connect + `JoinStage/StartBattle`; `ServerBattleDirector` (`_externallyDriven=true`) chỉ render trong trận (dual-subscriber, message rời nhau).
- **Mới**: 4 màn `UIBase<TData>` (Lobby/SelectGeneral/SelectStage/Result) + `TroopVisual` + `GameFlowController`; `UIId` +Lobby/SelectGeneral/SelectStage; Protocol +ListStages/ListRoster/Stages/Roster + `Command.OffenseGeneralIds/Difficulty` + DTO `StageInfo/GeneralSummary`; server `ScenarioLoader` roster/stages + `ScenarioDto.ApplyDifficulty/OverrideOffense`; data `roster.json`/`stages.json`/3× `stage_*.json`; Forge dựng 4 prefab + wire flow controller.
- **Verify**: dotnet build 0/0, **84/84 test** (+12 `CampaignFlowTests`), selftest OK, Unity compile 0 lỗi, **play-test thật đi hết luồng** (8 screenshot, chọn 5 tướng → Quan Độ/Khó → CHIẾN THẮNG thưởng scale → về Lobby dọn trận), 0 exception.
- Pages created: [[decisions/game-flow-end-to-end-2026-07-25]], [[technical/game-flow-navigation]]

## [2026-07-27] impl | Ngữ pháp hình ảnh trận: thanh máu per-nhóm, prefab-hoá toàn bộ FX, tách skill/buff
- Chủ dự án chỉ 3 khiếm khuyết tầng trình diễn. Khảo sát 2 agent (thanh máu + pipeline FX) → sửa 3 hạng mục, mỗi hạng mục compile-check qua Unity MCP.
- **1. Thanh máu**: `RowHealthBar` (per-hàng, click) → `HealthBar` (per-nhóm, tự hiện khi `0 < soldiers < max`), con của group anchor nên bám theo khi hàng tiến. Màu theo phe suy TỪ ART GỐC (`army/att` giáp xanh, `army/def` giáp đỏ) → Công xanh / Thủ đỏ, chỉnh được trên Inspector. Xoá `BattleFieldSelection` + `GroupClickTarget` + collider per-nhóm.
- **2. FX**: `AssetForge` bỏ bảng 3 effect hard-code, **quét toàn bộ** `Resources/sprite` → `Generated/FX/<đường-dẫn-nguồn>.{prefab,anim,controller,asset}` (gương cây sprite; id = đường dẫn = khoá tra DB). Quy tắc: tên **số trần** → 1 chuỗi animation, còn lại → prefab tĩnh riêng (chịu được thư mục lai kiểu `tip.png` lẫn frame). Loại `army/tacticalGeneralPicMax/warBG/windowBG` (không phải FX). Kết quả **303 prefab** (35 anim + 268 tĩnh), 0 SO thiếu prefab.
- **3. Skill vs buff**: `SpawnSkillEffect` rẽ theo `BattleEvent.Effect` — sát thương → tâm phe **BỊ ĐÁNH** (order 600); `Buff`/`Heal` → **dưới chân** phe **CAST** (order 100). Bản màu `att`/`def` theo người cast. Thế trận dùng chung ngữ pháp buff, vẽ **ngay lúc bấm** (cờ `_stancePreviewShown` nuốt echo server). Vầng sáng mặc định per-HÀNG (art vẽ theo bề ngang hàng). Mọi ánh xạ là chuỗi format `{f}` trên Inspector.
- **Bug tự gây & đã vá**: forge tạo GameObject tạm trong scene đang mở; một lần bake hỏng để lại `fx_warBG_1` (ảnh nền full màn, order 600) **che toàn bộ quân**. Dọn object + bọc `try/finally` mọi chỗ bake.
- **Verify**: 84/84 test, Unity compile 0 lỗi, play-test thật (Quan Độ/Chiến Thần): 3/12 nhóm mất máu hiện thanh đúng màu; FX đòn đánh tại tâm phe thủ `(1.09,1.41)`; FX buff 4 cái tại 4 tâm hàng phe công order 100.
- Pages created: [[decisions/battle-visual-grammar-2026-07-27]]
- Pages updated: [[index]]

## [2026-07-27] impl | Tướng đơn cỡ lớn (boss) cấu hình từ server JSON
- Chủ dự án hỏi cách setup "1 con tướng to đùng, không có đội quân". Workflow 5 agent khảo sát chuỗi JSON→sim→snapshot→render, 1 agent thiết kế, 3 agent phản biện đối nghịch (đo THẬT bằng probe test) → bắt được 5 vấn đề CHẶN trước khi code.
- **Kết luận khảo sát**: JSON hiện tại đã đủ cho SIM (`"Formation": [["KyBinh"]]` cho 1 hàng 1 nhóm, không chia-cho-0, không chỗ nào giả định >=2 hàng), nhưng bế tắc ở HIỂN THỊ: số sprite mỗi nhóm là hằng 3×2 trong field-initializer của `Group`, và `unitScale` là một biến Inspector global.
- **Giải pháp**: `GroupStyle { GroupsPerRow, SpriteCols, SpriteRows, Scale, VisualId }` chảy `GeneralDto → Combatant.Style → FormationBuilder (tham số optional) → Group → GroupSnapshot (append 2 field) → BattleSideField`. 5 khoá JSON mới, tất cả optional → tướng cũ giữ nguyên hình.
- **`GroupsPerRow` PHẢI nằm trên style** (phản biện bắt): đội hình bị dựng lại ở 6 chỗ chỉ biết `Combatant`; thiếu nó thì ảo ảnh của boss ra BA con boss mỗi con 1/3 máu.
- **Sửa kèm ở tầng render**: neo CHÂN sprite (pivot giữa làm boss phóng to lún mấy hàng), sorting theo `bounds.min.y` thay vì tâm, thanh máu bám bao đóng thật + dày theo cỡ.
- **Verify**: **90/90 test** (84 cũ + 6 `SingleFigureUnitTests` phủ đúng các ca phản biện bắt được: phantom giữ 1 nhóm, `[[]]` không làm Rows=0, tướng thường không đổi), selftest OK, Unity 0 lỗi, play-test thật màn mới "Bạch Hổ Sơn Lâm" — phe Thủ đúng 1 sprite `unit_def_102` 3.91×3.29 unit ôm 42.000 quân; trận thường không hồi quy.
- Pages created: [[technical/single-figure-unit]]
- Pages updated: [[index]]

## [2026-07-29] implement | Hệ FX trận 6 gói (A-F) từ feedback khách — sim+wire+client end-to-end
- Feedback khách (9 hạng mục) → spec 6 gói (`docs/superpowers/specs/2026-07-29-battle-fx-demo-design.md`) → thực thi trọn trên nhánh `feature/battle-fx-demo` (7 commit).
- **Kiến trúc 2 kênh FX theo vòng đời**: một-phát = event log (4 field render mới trên `BattleEvent`); bền-theo-HIỆP = `ActiveEffect` trên `SideState` → `SideSnapshot.Effects` (null khi rỗng = 0-drift), client `SyncActiveEffects` diff spawn/keep/destroy FX loop tại seam `RenderFields`.
- **Client data-driven tối đa** (chủ dự án chốt hướng): fxId lạ chứa `/` tra thẳng làm id FX; sorting/vị trí/lifetime đều từ server data; thêm FX mới không cần sửa client.
- Gói D (hình giữa hàng cuối) đặt tại `FormationBuilder.FromLayout` — choke point 6 đường rebuild → phantom giữ hình (test khoá).
- Gói E clash deterministic (không RNG — giữ baseline RE), dùng lại `RowAdvanced.Amount`, gate `AdvanceClashPct=0` mặc định.
- **Verify**: dotnet **107/107** + selftest OK; Unity compile 0 lỗi; play thật `stage_fxdemo`: aura buff `3→2→1→GONE` server-driven, client 1 FX loop tự huỷ (0 leak); screenshot xác nhận thanh máu CHIA NGĂN 2 phe + Bạch Hổ 102 hàng cuối.
- Còn mở (ghi trong trang): KillRow chưa thread cfg; ApplyFire chưa có caller; scene chưa serialize field mới; rule server đổi VisualId theo ngưỡng máu.
- Pages created: [[technical/battle-fx-system]]
- Pages updated: [[index]], [[log]]

## [2026-07-29] implement (đợt 2) | G1/G2/G3 + Fire tactic + gãy giáp LowHp — từ ảnh mẫu game gốc
- Feedback ảnh game gốc → 3 hạng mục: chỉ-hàng-đầu-đánh (lunge PER-CELL + EngageRows config), thế CÁNH CUNG (GroupStyle.RowShape, client uốn rowSlot 0, nối dây RowSnapshot.Shape bị bỏ rơi), tướng chờ đứng 2 BÊN ĐƯỜNG (SyncBench diff theo Id từ Queue).
- Đóng nốt backlog: TacticEffectKind.Fire (append cuối, guard wire int) + FX lửa bền trên phe bị đốt; GroupStyle.LowHpVisualId → server đổi hình nhóm dưới 50% máu, client SwapVisual (gãy giáp end-to-end); TEST panel thread _cfg (nút KillRow kích được clash).
- Bẫy ghi lại: TroopType KHÔNG có BoBinh (bộ binh = ThuongBinh — JSON sai sẽ fallback lặng lẽ); enum RowShape trùng tên giữa Ctxd.Data và Ctxd.Battle.Sim (client phải qualify Sim.RowShape).
- **Verify**: dotnet **112/112** + selftest OK; Unity 0 lỗi; playtest: shape/engage/bench/fire/LowHp-swap đều xác nhận sống bằng data + screenshot.
- Pages updated: [[technical/battle-fx-system]], [[log]]

## [2026-07-29] implement (đợt 3) | Đạo quân NỐI ĐUÔI + Triệu Vân single-figure + Quan Vũ cánh cung
- Đính chính từ chủ dự án: bench chỉ là phụ — cái chính là các ĐẠO QUÂN xếp HÀNG DỌC nối đuôi, quân trước rụng hàng thì quân sau DỒN LÊN. Data có sẵn trong Queue → thuần client.
- `ServerBattleDirector.SyncSideFields`: mỗi tướng sống (từ ActiveIndex) 1 `BattleSideField`, offset dọc `RowAxis` = tổng hàng sống phía trước + `tailGapRows`; `BattleSideField.SetHomeOffset` tween cả đạo quân (Move→Idle). Thay hẳn mô hình 1-field Reconcile/Rebuild.
- Config: roster `zhaoyun` thành 1 hình to (VisualId 43, UnitScale 1.5, **bỏ Deputy** — Deputy phá single-figure); `guanyu` RowShape CanhCung ở roster + 3 stage; stage_fxdemo có Triệu Vân nối sau Hoàng Trung.
- **Verify**: 112/112 + selftest OK; Unity 0 lỗi; playtest: 3 đạo quân xếp dọc, giết 2 hàng → dồn lên đúng; screenshot cột quân + Triệu Vân to đứng giữa.
- Pages updated: [[technical/battle-fx-system]] (đợt 3 ghi ở log này), [[log]]

## [2026-07-30] implement (đợt 4) | Cung dàn đều lính + hàng cánh 2 bên (Trương Phi)
- Cung dàn đều: `LayoutSprites` xếp lính hàng CanhCung giao tranh thành MỘT DẢI dọc parabol (offset ngang kín span nhóm + hiệu parabol theo vị trí toàn cục) — phá khối 3×2; `cell.arcMode` tự chuyển khi hàng thành/thôi hàng đầu.
- Hàng cánh: `RowShape` append `CanhTrai/CanhPhai` (guard int 2/3); `GroupStyle.RowShapes` per-hàng (JSON "RowShapes"); client đặt cánh làm CỘT bên hông (`wingOffset`), không chiếm slot sâu, rowSlot=0 → luôn giao tranh. Roster `zhangfei` 4 hàng [3,3,2,2] + shapes.
- **Verify**: 114/114 + selftest OK; Unity 0 lỗi; screenshot: Trương Phi 2 cánh 2 bên, Hoàng Trung dải cung liền mạch như game gốc.
- Pages updated: [[log]]
