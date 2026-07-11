---
title: CTXD — Kiến trúc client (Luzart patterns, SO-driven, extensible)
category: technical
tags: [ctxd, architecture, scriptableobject, design-patterns, luzart, battle, spec]
sources: []
created: 2026-06-29
updated: 2026-06-30
---

# CTXD — Kiến trúc client (SPEC)

Kiến trúc dựng lại **Công Thành Xưng Đế** trên Luzart, áp nhiều **design pattern** để **dễ mở rộng / thêm thắt / custom**. Gameplay mục tiêu = trận đánh isometric ([screenshot](.wiki/wiki/sources/screenshot-somo-battle-2026-06-27.md), [customer UI spec](.wiki/wiki/sources/customer-battle-ui-spec-2026-06-27.md)): 2 tướng đấu + HP góc trên, đội hình quân theo lưới, trận pháp (八卦阵), 战法/hiệu ứng, hàng đợi tướng, banner sự kiện.

## Nguyên tắc (ràng buộc bắt buộc)
1. **Data = ScriptableObject** (`AbstractScriptableContent`), nạp vào `Domain` qua `ContentBag` ([[technical/luzart-di-core]]).
2. **Visual = SO trỏ `GameObject prefab`; spawn = `Instantiate(prefab)`; sửa visual = sửa prefab.** **KHÔNG dựng "khung view"** — code điều khiển prefab **linh hoạt theo từng component** ([[technical/luzart-view]] cảnh báo; nguyên tắc `visuals-no-view-framework`).
3. **UI = LuzartUI** (`UIBase<TData>` + `UIRegistrySO` + `UIManager`) ([[technical/luzart-ui]]).
4. **Server-authoritative**: client KHÔNG giải đòn — chạy/nhận **event log** rồi diễn lại ([[technical/client-server-architecture]]). Hiện tại `BattleService` mô phỏng local (chỗ ghép server sau).
5. **Battle sim = C# thuần** (không UnityEngine) → tất định, test được offline.

## Bản đồ tầng & luồng
```
[Bootstrap] CtxdRoot → Domain (DI) ── installs ServiceBag/ContentBag, BroadcastService(EventBus)
   │
   ├─ [Data SO]  GeneralDef / TroopTypeDef / TacticDef / FormationDef / UnitVisualDef(→prefab) /
   │             EffectVisualDef(→prefab) / BattleConfigDef / BattleBackgroundDef   (ContentBag)
   │
   ├─ [Services (IService)]  GameDatabaseService(id→def) · BattleService(chạy trận) ·
   │             NetworkService(stub→server) · InputService
   │
   ├─ [Battle.Sim (C# thuần)]  BattleResolver → List<BattleEvent>   (FSM lượt + Strategy hiệu ứng/AI)
   │
   ├─ [Presentation (linh hoạt, KHÔNG base view)]  BattlePresenter đọc event log →
   │             spawn prefab (UnitVisualDef/EffectVisualDef) + diễn anim/VFX/số nổi/banner.
   │             Mỗi prefab có MonoBehaviour RIÊNG của nó (UnitVisual, FormationFieldVisual, EffectVisual…)
   │
   └─ [UI (LuzartUI)]  BattleHudUI/PreBattleUI/MainMenuUI/SkillCutsceneUI/ResultUI = UIBase<TData>
```

## Chi tiết tầng + pattern

### 1. Bootstrap / DI (Composition Root, Service Locator, Singleton)
`CtxdRoot : MonoBehaviour` mỗi scene: `new Domain()` → `ServiceManager.InstallBags(serviceBags)` + `ContentManager.InstallBags(contentBags)` → InitializeAndStart; đăng ký `BroadcastService`. Tự viết `Singleton<T>` (Luzart đã gỡ). Patterns: **Composition Root, Service Locator, Singleton, Registry/Manifest (Bag)**.

### 2. Data (ScriptableObject) — Definition/Value split (Flyweight), Data-driven
Mọi định nghĩa là SO `AbstractScriptableContent`, author bằng attribute Luzart ([[technical/luzart-authoring]] `[ShowIf]/[Dropdown]/[Slider]`). `UnitVisualDefinition`/`EffectVisualDefinition` chỉ giữ **ref prefab** (visual nằm trong prefab). `GameDatabaseService` index `id→def` (**Registry**). Patterns: **Flyweight (SO chia sẻ), Registry, Builder (Def→runtime)**.

### 3. Battle simulation (C# thuần) — State Machine, Strategy, Command, Observer
- `BattleResolver`/`BattleState`: FSM lượt **ChọnThế → GiảiĐòn → Sinh event → KếTiếp** (GDD §3).
- `ITacticEffect` (mỗi loại 战法: dmg/AoE/混乱/về-1-máu/đẩy-lùi/buff…) = **Strategy** → thêm 战法 mới = thêm 1 class.
- `IBattleBrain` (AI chọn thế) = **Strategy**. `IDamageFormula` = **Strategy** (công thức còn ❓ → thay được).
- `ITurnAction` (Đột Kích/Tấn Công/Phòng Thủ/Giác/借兵/退却) = **Command**.
- Output `List<BattleEvent>` (Attack/TacticCast/Damage/Morale/Defeat/Banner…) = **Observer/event-sourcing** cho client diễn lại.

### 4. Presentation — LINH HOẠT (Factory, Object Pool, Strategy-per-event; KHÔNG base view)
`BattlePresenter` đọc event log, dùng **bảng `Dictionary<BattleEventType, IBattleEventPlayer>`** (**Strategy** + **Chain**) → mỗi loại event 1 handler diễn (anim/VFX/số/banner). Thêm kiểu diễn = thêm 1 handler. Spawn prefab qua `VisualSpawner` (**Factory**, đọc `UnitVisualDef.prefab`), **Object Pool** cho lính/số nổi/hiệu ứng. **Mỗi prefab tự xử lý visual bằng MonoBehaviour riêng** (vd `UnitVisual` chạy Animator frame-by-frame; `FormationFieldVisual` vẽ lưới 八卦; `EffectVisual` auto-destroy) — **không** ép chung 1 base/`Setup()`. Animation = AnimationClip frame-by-frame của Unity gắn trên prefab. Tween/Select của Luzart ([[technical/luzart-tween]]/[[technical/luzart-select]]) dùng cho bánh xe thế trận + chuyển động.

### 5. UI (LuzartUI) — State Machine, Config-driven, Command
Mỗi màn = `UIBase<TData>` đăng ký trong `UIRegistrySO` (thêm `UIId`). `BattleHudUI` (2 chân dung+HP/nộ, bánh xe thế trận `SelectSwitch`, menu lệnh, banner), `PreBattleLineupUI`, `MainMenuUI`, `SkillCutsceneUI`, `ResultUI`. Thêm màn = subclass + 1 `UIId` + 1 dòng registry. ⚠️ Lưu ý `UIId` chỉ có dải System, `PoolOnClose` thực ra Destroy, provider mặc định không free RAM ([[technical/luzart-ui]]).

### 6. Asset pipeline (Editor) — Task 1
Editor generator bake sprite sequence → **AnimationClip frame-by-frame + AnimatorController + prefab + `UnitVisualDef`/`EffectVisualDef`**. Prefab mang MonoBehaviour **riêng theo loại** (không base view). Chạy 1 click (menu CTXD) + verify trong Editor.

## Bản đồ Design Pattern → chỗ dùng
| Pattern | Dùng ở |
|---|---|
| Service Locator / Composition Root / Singleton | Domain, CtxdRoot |
| Observer / Event-sourcing | BroadcastService, BattleEvent log |
| Strategy | ITacticEffect, IBattleBrain, IDamageFormula, IBattleEventPlayer |
| Command | ITurnAction, CommandBus (player→battle) |
| State Machine | BattleTurnFSM, UIState |
| Factory | VisualSpawner, CombatantFactory |
| Object Pool | lính/số nổi/hiệu ứng |
| Flyweight / Registry | SO definitions, GameDatabaseService, UIRegistrySO |
| Config-driven | UIConfig, BattleConfigDef |
| Composite | CHỈ trong DATA (formation = rows/groups), KHÔNG ép cây view |

## Cookbook mở rộng (mục tiêu "dễ thêm thắt")
- **Thêm tướng** → tạo `GeneralDefinition` SO (portrait + stats + troop + tactic refs) → tự vào DB.
- **Thêm binh chủng** → drop sprite → generator ra `UnitVisualDef` → tạo `TroopTypeDefinition`.
- **Thêm 战法** → tạo `TacticDefinition` (chọn loại hiệu ứng). Loại hiệu ứng MỚI = thêm 1 `ITacticEffect`.
- **Thêm trận pháp (vd 八卦阵)** → `FormationDefinition` + prefab hiệu ứng trận.
- **Thêm màn UI** → `UIBase<T>` + `UIId` + 1 dòng `UIRegistrySO`.
- **Thêm kiểu diễn event** → 1 `IBattleEventPlayer` đăng ký vào bảng.

## Cấu trúc thư mục / namespace (`Assets/Ctxd/`, ns `Ctxd`)
```
Ctxd/Core        (Singleton, CtxdRoot bootstrap)
Ctxd/Data        (SO definitions + GameDatabaseService)
Ctxd/Battle/Sim  (C# thuần: resolver, FSM, Strategy hiệu ứng/AI, BattleEvent)
Ctxd/Battle      (BattleService, BattlePresenter, IBattleEventPlayer + handlers, VisualSpawner, pool)
Ctxd/Visual      (MonoBehaviour riêng từng loại prefab: UnitVisual, EffectVisual, FormationFieldVisual…)
Ctxd/UI          (UIBase<T> screens + UIRegistry entries)  ← LuzartUI
Ctxd/Net         (NetworkService stub → server)
Ctxd/Editor      (asset generator Task 1, sample content)
```

## Lộ trình (PLAN tóm tắt — chi tiết khi vào code)
- **M0** Bootstrap + Singleton + Data SO skeleton + GameDatabaseService (compile xanh).
- **M1** Battle.Sim thuần + EditMode/console test (tất định, thế trận, 战法).
- **M2** Asset generator (Task 1) → prefab + anim + visual SO; verify trong Editor.
- **M3** Presentation: BattlePresenter + IBattleEventPlayer handlers + VisualSpawner + pool; spawn quân/hiệu ứng.
- **M4** LuzartUI: BattleHudUI (bánh xe thế trận + HP) + ResultUI; nối turn loop.
- **M5** Scene Battle + sample content (tướng/binh/战法/trận) → Play end-to-end; verify (computer-use click menu + Play).
- **M6** Review kỹ (workflow đối nghịch) + wiki + (sau) mở rộng PvE/nội chính/bản đồ.

## Trạng thái hiện thực (2026-06-30) — ĐÃ CHẠY & XÁC MINH

> [!info] Battle vertical slice VERIFIED PLAYABLE trong Unity (Editor 6000.5.1f1), 0 lỗi console.
> Chạy/verify headless qua Unity MCP bằng `EditorApplication.Step()` để drive frame (xem memory `headless-play-verify`).

**Vòng chơi đầy đủ**: `GameFlow` (Main Menu → Trận → Kết quả → Đánh lại/Về Menu) trong scene `Assets/Ctxd/Scenes/Battle.unity`. Một click: **CTXD ▸ Build Everything (Sample + Scene)** → Play.

Thành phần đã có (đều compile sạch runtime + Editor):
- **Sim** (`Battle/Sim`) — `BattleRunner` FSM lượt, 3 thế khắc chế, sĩ khí→skill2, 觉醒, địa hình, 7 `ITacticEffect`, RNG tất định. Đánh ra kết quả (vd OffenseWins hồi 15).
- **Presentation** (`Battle` + `Visual`) — `BattlePresenter` diễn event log; `BattleSideField` = đội hình **isometric parallelogram** (4×5, sort theo Y, lunge khi đánh); `UnitVisual`/`SpriteFramePlayer` render frame từ `Resources/sprite/army/...` (cache tĩnh; fallback Idle→ô màu, KHÔNG bao giờ vô hình); VFX chiến pháp + 觉醒 spawn từ `Resources/sprite/eff/...` qua `EffectVisualDefinition.resourcesPath` (fallback không cần prefab).
- **UI** (`UI`, uGUI thuần — KHÔNG khung view): `BattleHud` (tên tướng + thanh **lính/nộ khí**, banner sự kiện/kết quả, đếm hồi, **bánh xe thế trận** Đột Kích/Tấn Công/Phòng Thủ + GIÁC = `ITurnInputSource` cho người chơi); `GameFlow` (menu/kết quả). EventSystem + `InputSystemUIInputModule` (reflection). Canvas **ScreenSpaceCamera**. Hiển thị tên TIẾNG VIỆT (font mặc định không có chữ Hán).
- **Bootstrap** (`Core`) — `CtxdRoot` (Domain+EventBus+DB), `Singleton<T>`; `BattleLauncher` (dựng trận, `runOnStart`/`Run()`).
- **Editor** (`Editor/SampleContentForge`) — author 6 tướng/6 chiến pháp/5 binh chủng/3 trận/3 hiệu ứng + DB + scene + đăng ký Build Settings. Một click.

**Đã review đối nghịch (workflow 26 agent, 16 lỗi xác nhận) + sửa**: clamp Resilience≤1; 觉醒 cộng địa hình; HUD hết soft-lock khi trận kết thúc lúc chờ input; lunge guard khi field bị destroy; `BattlePresenter.OnDestroy` StopAllCoroutines; cache `Resources.LoadAll`.

**Chưa làm (follow-up)** → [[open-questions]]: Skill1 (kỹ năng sĩ khí thấp) chưa cast; AoE thật sự nhiều mục tiêu (hiện 1v1 tướng nên chỉ scale damage); object pool cho số nổi/hiệu ứng; chọn đội hình/địa hình trước trận; cân bằng số liệu vs game gốc; PvE/bản đồ/nội chính.

---
## Backlinks
- [[technical/luzart-framework]] · [[technical/luzart-di-core]] · [[technical/luzart-view]] · [[technical/luzart-ui]]
- [[systems/battle-system]] · [[technical/client-server-architecture]] · [[GDD]]
