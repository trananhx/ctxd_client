# Thiết kế: Rule-Engine cho Combat Targeting + Per-Unit Death Visual (CTXD)

- **Ngày:** 2026-07-23
- **Trạng thái:** Draft (chờ review)
- **Phạm vi mã nguồn:** `Assets/Ctxd/Battle/Sim` (sim thuần C#), `Server/BattleSession.cs`, `Assets/Ctxd/Battle` + `Assets/Ctxd/Visual` (render), `Assets/Ctxd/Data` (authoring SO)
- **Kiến trúc đã chọn:** Hướng 3 — Rule-Engine data-driven (skill = chương trình luật "select → condition → act")

---

## 1. Bối cảnh & Vấn đề

Trận đấu CTXD là **sim deterministic, server-authoritative**: `Server/BattleSession.cs` sở hữu `BattleRunner` + RNG ("the client never has a copy"); client (`ServerBattleDirector`) chỉ nhận `ServerMsg` (snapshot + event log) và **render lại**. Toàn bộ combat math nằm trong `Assets/Ctxd/Battle/Sim` (thuần C#, không `UnityEngine`), dùng chung cho cả server lẫn client-sim.

Mô hình quân: `Combatant` (tướng) → `Formation` = `List<Row>` → `Row` = `List<Group>` → `Group.Soldiers` là HP, `Group.Troop` là `TroopType`. Sprite trên sân là **tượng trưng**: mỗi group vẽ `alive = ceil(SpriteCols*SpriteRows * Soldiers/MaxSoldiers)` sprite.

Có **2 vấn đề** cần giải:

### 1.1. "Visual không có con nào chết" → thêm thanh máu mỗi hàng (bug trình bày)
Hành vi chết-theo-hàng của đòn thường **là đúng mong muốn**: đánh hàng đầu, cả hàng chỉ ngã khi HP hàng đầu về 0, hàng sau tiến lên. Vấn đề chỉ là **thiếu phản hồi thị giác** khi một hàng đang mất máu — người chơi không thấy tiến triển cho tới lúc cả hàng biến mất.

**Giải pháp đã chốt với user: KHÔNG làm sprite thưa dần / chết từng con.** Thay vào đó **dựng sẵn cơ chế thanh máu (HP bar) phía trên mỗi hàng**, fill = tổng `Soldiers`/`MaxSoldiers` của hàng, đọc thẳng từ snapshot. Việc render sprite giữ **nguyên** cách hiện tại (`BattleSideField.Build` rebuild theo snapshot; "pop" khi hàng tan được chấp nhận). `UnitVisual.PlayDie()`, khóa danh tính sprite, và diff `UpdateFrom` **không dùng** ở v1.

### 1.2. Tấn công linh hoạt theo loại quân (tính năng mới)
Cần skill có thể: "chỉ đánh cung binh", "chỉ đánh bộ binh", "ngay lập tức hạ gục **toàn bộ** pháo binh/cung binh trên sân", đánh nhiều hàng, v.v. — "**gì cũng có, không hardcode**". Hiện tại targeting **cứng**: luôn đánh `State.Enemy(f).Active` (tướng đầu hàng đợi địch), luôn vào hàng đầu, **không hề đọc** `Group.Troop`.

Ánh xạ loại quân (chốt): cung binh=`CungBinh`, bộ binh=`ThuongBinh`, pháo binh=`ChienXa`, kỵ binh=`KyBinh`, mưu sĩ=`MuuSi` (5 loại `TroopType` sẵn có, **không thêm loại mới**).

---

## 2. Mục tiêu & Phi mục tiêu

### Mục tiêu
1. Skill mô tả hành vi tấn công **hoàn toàn bằng dữ liệu** — designer thêm skill mới không cần lập trình viên.
2. Biểu diễn được: filter theo loại quân, chọn phạm vi (1 tướng active / toàn đội hình / phe ta), chọn hàng, chọn kiểu tác động (damage / hạ gục thẳng / còn 1 HP / hỗn loạn / đẩy lùi / hồi máu / buff), **và điều kiện** (vd chỉ kích hoạt khi HP mục tiêu < 50%).
3. Client hiển thị **thanh máu trên mỗi hàng** (đọc từ snapshot) làm phản hồi thị giác khi hàng mất máu — cho cả đòn thường lẫn skill. **Không** làm sprite thưa dần.
4. Giữ **determinism** tuyệt đối và **server-authoritative** — rule chạy trong Sim thuần C#, thứ tự tiêu thụ RNG cố định.
5. **Tương thích ngược**: mọi tactic/skill hiện có tiếp tục chạy y nguyên.

### Phi mục tiêu (YAGNI — v1 không làm)
- Không thêm `TroopType` mới, không thêm "role tag" (đã chốt ánh xạ 5 loại).
- Không làm editor window custom phức tạp cho rule (dùng Inspector `[SerializeReference]` native).
- Không hỗ trợ chuỗi điều kiện phân nhánh dạng if/else lồng nhau; v1 chỉ là **danh sách bước tuần tự, mỗi bước có 1 điều kiện gác**.
- Không thay đổi wire/protocol/framing (chỉ thêm field additive).
- Không đổi công thức damage cơ bản (`BasicDamage`/`TacticDamage`) — chỉ đổi **cách chọn mục tiêu và cách rải/áp dụng**.
- **Không** làm sprite chết-từng-con / attrition / `PlayDie` / diff sprite — thay bằng **thanh máu mỗi hàng** (§7). Sprite giữ nguyên đường rebuild hiện tại.

---

## 3. Tổng quan kiến trúc Rule-Engine

Một skill = **một `TacticProgram`**: danh sách `RuleStep` chạy tuần tự. Mỗi bước:

```
RuleStep = SELECT (chọn mục tiêu) + [CONDITION] (điều kiện gác, tùy chọn) + ACTION (tác động)
```

- **SELECT** trả về tập `(Combatant, List<Group>)`: `Scope` chọn tướng nào, `RowSpec` + `TroopFilter` chọn group nào trong mỗi tướng.
- **CONDITION** (tùy chọn): predicate deterministic; nếu false thì bỏ qua bước.
- **ACTION**: tác động lên tập đã chọn (Damage/InstantKill/SetHp/Confuse/Pushback/Heal/Buff…). Action tự khai báo nó tác động cấp **group** hay cấp **combatant**.

Ba sự thật thiết kế:
1. **Bước đơn = Hướng 1.** Một `RuleStep` (Scope + RowSpec + TroopFilter + Action) chính là descriptor trực giao. Rule-engine = tổng quát hoá lên N bước + điều kiện. Skill đơn giản → 1 bước; skill phức tạp → nhiều bước.
2. **Rule sống trong Sim thuần C#**, gắn trên `TacticSpec.Program`. Build từ SO ở mỗi phía (server & client) qua `ToSpec()`. **Không cross wire.**
3. **Một effect strategy duy nhất** `RuleEffect : ITacticEffect` (Kind = `TacticEffectKind.Rule`) thông dịch `Program`. Mọi effect cũ giữ nguyên → additive, rủi ro thấp.

### Sơ đồ luồng

```
[TacticDefinition SO]  --ToSpec()-->  [TacticSpec.Program]  (thuần C#, trên cả server & client)
        │  (Inspector: [SerializeReference] List<RuleStepAuthoring>)
        ▼
Cast site (BattleRunner.CastTactic hoặc BattleSession.UseSkill)
        │  tạo TacticContext { Actor, Target, State, ... }
        ▼
TacticEffects.Get(Kind).Apply(ctx)
        │  Kind == Rule  →  RuleEffect.Apply(ctx)
        ▼
foreach step in Program:
    if EvalCondition(step.Condition, ctx) == false: continue
    targets = TargetResolver.Resolve(step.Select, ctx.State, ctx.Actor.Faction)   // (Combatant, Group[])[]
    foreach (combatant, groups) in targets:
        step.Action.Apply(ctx, combatant, groups)   → CombatOps.ApplyDamageToGroups / KillGroups / ...
        → phát BattleEvent giàu thông tin (RowIndex, GroupIndex, Troop, SoldiersKilled)
        ▼
[event log + snapshot]  --wire-->  [ServerBattleDirector.PlayEvent + BattleSideField.UpdateFrom]  (render per-unit death)
```

---

## 4. Mô hình dữ liệu Rule Program (Sim thuần C#)

Đặt trong `Assets/Ctxd/Battle/Sim/Rules/` (namespace `Ctxd.Battle.Sim`).

### 4.1. Enums (thêm mới; append-safe)

```csharp
// Chọn tướng nào tham gia.
public enum TargetScope { EnemyActive, EnemyAll, AllySelf, AllyActive, AllyAll }

// Chọn hàng nào trong đội hình của tướng đó.
public enum RowMode { FrontRow, FrontNRows, AllRows, RowIndex }

// Thứ tự rải sát thương trong tập group đã chọn.
public enum Distribution { EvenByHp, FocusFrontFirst }

// Loại điều kiện gác.
public enum ConditionKind { Always, TargetHpBelowPct, TargetHpAbovePct, ActorMoraleFull, TerrainIs, TargetTroopPresent, Chance }

// Loại tác động.
public enum ActionKind { Damage, InstantKill, SetToHpPct, Confuse, Pushback, Heal, Buff }
```

`TroopType` (đã có: `KyBinh, ThuongBinh, CungBinh, ChienXa, MuuSi`) dùng nguyên. Filter loại quân dùng **[Flags] tùy chọn** để một bước nhắm nhiều loại; v1 tối thiểu là "một loại hoặc Any".

### 4.2. Cấu trúc bước

```csharp
public sealed class TacticProgram
{
    public List<RuleStep> Steps = new List<RuleStep>();
}

public sealed class RuleStep
{
    public TargetSelect Select = new TargetSelect();
    public RuleCondition Condition = new RuleCondition();   // mặc định Always
    public RuleAction Action = new RuleAction();
}

public sealed class TargetSelect
{
    public TargetScope Scope = TargetScope.EnemyActive;
    public RowMode Rows = RowMode.FrontRow;
    public int RowCount = 1;              // dùng khi Rows==FrontNRows
    public int RowIndexValue = 0;         // dùng khi Rows==RowIndex
    public bool FilterByTroop = false;    // nếu true, chỉ group khớp TroopMask
    public int TroopMask = 0;             // [Flags] bit theo (int)TroopType; 0 == Any khi FilterByTroop=false
    public int MaxGroups = 0;             // 0 == không giới hạn (vd "3 group yếu nhất")
}

public sealed class RuleCondition
{
    public ConditionKind Kind = ConditionKind.Always;
    public double Value;                  // pct / xác suất / v.v.
    public Terrain Terrain;               // dùng khi Kind==TerrainIs
    public TroopType Troop;               // dùng khi Kind==TargetTroopPresent
}

public sealed class RuleAction
{
    public ActionKind Kind = ActionKind.Damage;
    public double PowerScale = 1.0;       // nhân vào TacticDamage (Damage/Pushback)
    public Distribution Dist = Distribution.EvenByHp;
    public double HpPct = 0.0;            // dùng khi SetToHpPct (vd 0.0 == về ~1 HP)
    public int ConfuseTurns = 1;          // Confuse
    public int PushbackTroops = 0;        // Pushback
    public double HealScale = 1.0;        // Heal/Buff
}
```

> Ghi chú granularity: `Damage/InstantKill/SetToHpPct` tác động **cấp group** (lên `groups` đã chọn). `Confuse/Pushback/Heal/Buff` tác động **cấp combatant** (áp một lần cho mỗi tướng trong tập, bỏ qua `groups`). Interpreter phân nhánh theo `ActionKind`.

### 4.3. Gắn vào `TacticSpec`

```csharp
// TacticSpec.cs — thêm:
public TacticProgram Program;   // null nếu tactic dùng Kind legacy
```

`TacticEffectKind` thêm **một** giá trị ở CUỐI enum (giữ ordinal cho JSON int-enum):

```csharp
public enum TacticEffectKind { Damage, AoeDamage, Confusion, InstantTo1Hp, Pushback, Buff, Heal, Rule }
```

---

## 5. Interpreter, Resolver, và các primitive CombatOps

### 5.1. `TargetResolver` (mới, thuần C#)

```csharp
public static class TargetResolver
{
    // actorFaction để biết "địch" là phe nào.
    public static List<(Combatant c, List<Group> groups)> Resolve(TargetSelect s, BattleState state, Faction actorFaction)
    {
        var enemy = state.Enemy(actorFaction);
        var ally  = state.Side(actorFaction);
        var result = new List<(Combatant, List<Group>)>();
        foreach (var c in SelectCombatants(s.Scope, ally, enemy))
        {
            if (c == null || !c.Alive) continue;
            result.Add((c, SelectGroups(s, c)));
        }
        return result;
    }

    static IEnumerable<Combatant> SelectCombatants(TargetScope scope, SideState ally, SideState enemy)
    {
        switch (scope)
        {
            case TargetScope.EnemyActive: return One(enemy.Active);
            case TargetScope.EnemyAll:    return LivingFrom(enemy);      // duyệt enemy.Queue theo THỨ TỰ (determinism)
            case TargetScope.AllySelf:
            case TargetScope.AllyActive:  return One(ally.Active);
            case TargetScope.AllyAll:     return LivingFrom(ally);
            default:                      return One(enemy.Active);
        }
    }

    static List<Group> SelectGroups(TargetSelect s, Combatant c)
    {
        // 1) chọn hàng theo RowMode (chỉ hàng còn sống, giữ thứ tự front→back)
        IEnumerable<Row> rows = LivingRows(c);
        switch (s.Rows)
        {
            case RowMode.FrontRow:   rows = Take(rows, 1); break;
            case RowMode.FrontNRows: rows = Take(rows, Math.Max(1, s.RowCount)); break;
            case RowMode.RowIndex:   rows = AtIndex(c.Formation, s.RowIndexValue); break;
            case RowMode.AllRows:    break;
        }
        // 2) trải group, lọc theo troop + Alive
        var groups = new List<Group>();
        foreach (var r in rows)
            foreach (var g in r.Groups)
                if (g.Alive && (!s.FilterByTroop || MaskHas(s.TroopMask, g.Troop)))
                    groups.Add(g);
        // 3) giới hạn số group (0 == không giới hạn); thứ tự ổn định (front→back) để deterministic
        if (s.MaxGroups > 0 && groups.Count > s.MaxGroups) groups = groups.GetRange(0, s.MaxGroups);
        return groups;
    }
}
```

**Bất biến determinism:** mọi phép duyệt theo thứ tự cố định của `Queue`/`Formation`/`Groups`; không dùng tập không có thứ tự; `MaxGroups` cắt theo thứ tự front→back.

### 5.2. Primitive mới trong `CombatOps`

Tổng quát hoá logic hàng-đầu hiện tại (rải theo tỉ lệ máu) thành hàm áp lên **một tập group bất kỳ**:

```csharp
// Rải `amount` lên tập group theo Distribution; phát GroupKilled (kèm RowIndex/GroupIndex/Troop) khi group tan.
public static int ApplyDamageToGroups(Combatant c, List<Group> groups, int amount, Distribution dist,
                                      int round, List<BattleEvent> ev);

// Hạ gục thẳng: Soldiers -> 0 cho mỗi group; phát GroupKilled từng group; xử lý RowAdvanced nếu 1 hàng sạch.
public static int KillGroups(Combatant c, List<Group> groups, int round, List<BattleEvent> ev);

// Ép nhóm về HpPct*MaxSoldiers (vd 0 → ~1 HP, không bao giờ giết nếu cần giữ mạng — tùy chọn clamp).
public static int SetGroupsToHpPct(Combatant c, List<Group> groups, double pct, int round, List<BattleEvent> ev);
```

`ApplyDamageToFront(target, amount, round, ev)` giữ nguyên signature nhưng **cài lại** bằng:
```csharp
=> ApplyDamageToGroups(target, target.FrontRow?.Groups, amount, Distribution.EvenByHp, round, ev)
   // + spill sang hàng kế khi overkill (giữ đúng hành vi cũ: tan hàng → hàng sau tiến, dư tràn sang)
```
→ **BasicAttack, KillRow, KillRandom, Attack, DealDamage cũ không đổi hành vi.** Sau mỗi mutation gọi `c.SyncTroops()`.

### 5.3. `RuleEffect` (effect strategy mới)

```csharp
public sealed class RuleEffect : ITacticEffect
{
    public TacticEffectKind Kind => TacticEffectKind.Rule;
    public void Apply(TacticContext c)
    {
        var prog = c.Tactic.Program;
        if (prog == null) { new DamageEffect().Apply(c); return; }   // fallback an toàn
        foreach (var step in prog.Steps)
        {
            if (!RuleConditions.Eval(step.Condition, c)) continue;
            var targets = TargetResolver.Resolve(step.Select, c.State, c.Actor.Faction);
            foreach (var (combatant, groups) in targets)
                RuleActions.Apply(step.Action, c, combatant, groups);
        }
    }
}
// Đăng ký: TacticEffects.Register(new RuleEffect());
```

`RuleActions.Apply` phân nhánh theo `ActionKind`:
- `Damage`: `int d = CombatOps.TacticDamage(actor, combatant, tactic, ...) * PowerScale; CombatOps.ApplyDamageToGroups(combatant, groups, d, Dist, ...)` + `GainMorale` + `DamageEvent`.
- `InstantKill`: `CombatOps.KillGroups(combatant, groups, ...)`.
- `SetToHpPct`: `CombatOps.SetGroupsToHpPct(...)`.
- `Confuse/Pushback/Heal/Buff`: áp cấp combatant (tái dùng logic của `ConfusionEffect`/`PushbackEffect`/`HealEffect` hiện có).

**Thứ tự tiêu thụ RNG** = thứ tự Steps → thứ tự targets (Queue order) → trong action. Cố định ⇒ deterministic.

### 5.4. Mở rộng `TacticContext`

Thêm quyền truy cập trạng thái để resolver với tới toàn cục:
```csharp
// ITacticEffect.cs — TacticContext thêm:
public BattleState State;
```
Cập nhật **2 cast site** để set `State`:
- `BattleRunner.CastTactic` (dòng 123): `new TacticContext { ..., State = State }`.
- `BattleSession.UseSkill` (dòng 114): `new TacticContext { ..., State = St }`.

`Target` (single Combatant) vẫn giữ để effect legacy dùng; `RuleEffect` chủ yếu dùng `State` + resolver.

---

## 6. Tầng sự kiện (BattleEvent) — additive, không đổi wire

Wire dùng Newtonsoft `NullValueHandling.Ignore`, enum-as-int, **không có version field** → thêm field public là tương thích cả 2 chiều; thêm enum member phải **append ở cuối**.

Thanh máu mỗi hàng (§7) đọc từ **snapshot** nên **không phụ thuộc** các field event mới. Các field dưới là **TÙY CHỌN**, phục vụ (a) log rõ ràng và (b) nice-to-have: định vị số damage / flash thanh máu đúng hàng–loại quân bị đánh:
```csharp
public int RowIndex = -1;       // hàng bị tác động (-1 == không áp dụng)
public int GroupIndex = -1;     // group trong hàng (-1 == cả hàng / không áp dụng)
public TroopType Troop;         // loại quân của group bị đánh
public int SoldiersKilled;      // số lính chết trong sự kiện này (per-group delta)
```

Nếu cài, sửa nơi phát `GroupKilled`/`RowAdvanced` trong `ApplyDamageToGroups`/`KillGroups` để điền các field này thay vì chỉ nhét `Group` vào chuỗi `Text` như hiện nay (`CombatOps.cs:67`). `BattleEventType` (`Enums.cs`) giữ nguyên `GroupKilled, RowAdvanced` (đã có ở cuối); v1 **chưa cần** enum mới.

---

## 7. Tầng Visual — thanh máu mỗi hàng (dựng sẵn cơ chế)

Phạm vi thu hẹp theo yêu cầu: **KHÔNG** đụng sprite (giữ nguyên rebuild), chỉ **dựng sẵn cơ chế HP bar phía trên mỗi hàng** để có phản hồi thị giác khi hàng mất máu. Thanh máu **snapshot-driven** — không cần event, không cần danh tính sprite, không cần diff.

### 7.1. Component `RowHealthBar` (mới)
Một MonoBehaviour nhẹ: nền + fill co theo `ratio ∈ [0,1]`. API tối thiểu:
```csharp
public void SetRatio(float ratio);      // fill = row Soldiers / row MaxSoldiers
public void SetSortingOrder(int order); // nổi trên sprite của hàng
```
Prefab gắn trong SO như `UnitVisual`, spawn qua `VisualSpawner` (không `Find`/`GetComponent` runtime).

### 7.2. Đặt & cập nhật trong `BattleSideField.Build`
Trong vòng dựng hàng (`BattleSideField.cs:48-83`), với mỗi hàng còn sống (đã có sẵn `rowSlot`, tâm hàng, `rowSoldiers`), spawn **một** `RowHealthBar` phía trên hàng:
- Vị trí = tâm hàng + offset lên trên theo trục màn hình; `SetSortingOrder` cao hơn sprite hàng.
- `ratio` = `rowSoldiers / rowMaxSoldiers` (tính từ `RowSnapshot`; `rowMaxSoldiers` = tổng `MaxSoldiers` các group của hàng).
- Vì `Build()` chạy lại mỗi snapshot, thanh máu tự có giá trị đúng ở mỗi lần render → **không cần diff**.
- Lưu bar cùng vòng đời `_units` (`Clear()` huỷ chung).

### 7.3. `ServerBattleDirector` — không đổi luồng sprite
- Giữ **nguyên** `Rebuild()` destroy-rebuild theo snapshot (đủ để thanh máu cập nhật đúng).
- `PlayEvent`: **không bắt buộc** thêm case per-sprite. *Tùy chọn (nice-to-have):* khi `Damage`/`GroupKilled` tới, flash/nháy thanh máu của đúng hàng (dùng field `RowIndex` §6) — không thuộc lõi v1.

> Kết quả: mỗi hàng có thanh máu tụt khi bị đánh (đòn thường lẫn skill); hàng tan → biến mất kèm sprite như hiện tại; hàng sau tiến lên như cũ. Đơn giản, ít rủi ro, đúng phạm vi "dựng sẵn cơ chế".

*(Tùy chọn polish, để ngỏ §14: tween mượt thanh máu khi ratio giảm giữa 2 snapshot.)*

---

## 8. Authoring trong Unity (SO → Sim)

### 8.1. `TacticDefinition` (SO)
Thêm authoring cho program bằng `[SerializeReference]` (Unity 2019.3+ hỗ trợ đa hình serialize) để designer dựng danh sách bước ngay trong Inspector:
```csharp
[Header("Rule Program (để trống nếu dùng Kind legacy)")]
public bool useRuleProgram = false;
[SerializeReference] public List<RuleStepAuthoring> ruleSteps = new();
```
`RuleStepAuthoring` là bản "author-friendly" (field phẳng: Scope, Rows, RowCount, FilterByTroop, TroopMask (Inspector hiện dạng dropdown/flags), Condition…, Action…). `ToSpec()` khi `useRuleProgram==true` sẽ set `Kind = TacticEffectKind.Rule` và build `Program` từ `ruleSteps`; ngược lại giữ nguyên đường cũ (Kind legacy + các field cũ).

> Nếu `[SerializeReference]` gây vướng UX Inspector, phương án dự phòng: một struct phẳng cho **bước đơn** (đủ cho ~90% skill = Hướng 1) + list cho bước nâng cao. Quyết định chi tiết UI để pha implement.

### 8.2. Tương thích ngược
- Tactic cũ (`Kind != Rule`, `Program == null`): chạy y nguyên qua effect cũ. **Không cần chạm asset nào.**
- `RuleEffect` với `Program == null` fallback về `DamageEffect` (an toàn).
- `DefaultTactic` trong `BattleSession` (Kind=Damage) không đổi.

---

## 9. Ví dụ worked (skill = dữ liệu, 0 dòng code)

| Skill | Steps (Scope / Rows / TroopFilter / Condition / Action) |
|---|---|
| **Đòn thường / tactic Damage cũ** | *(không dùng Program — giữ Kind=Damage)* |
| **"Cung Thủ Tập Kích" — chỉ đánh cung binh (tướng active)** | 1 bước: EnemyActive / AllRows / Troop=CungBinh / Always / Damage(PowerScale=1.2, EvenByHp) |
| **"Phá Xa Lệnh" — hạ gục toàn bộ pháo binh trên sân** | 1 bước: **EnemyAll** / AllRows / Troop=ChienXa / Always / **InstantKill** |
| **"Xuyên Trận" — đánh 2 hàng đầu** | 1 bước: EnemyActive / FrontNRows(2) / Any / Always / Damage(1.0, FocusFrontFirst) |
| **"Kết Liễu" — chỉ kích hoạt khi mục tiêu yếu** | 1 bước: EnemyActive / FrontRow / Any / **TargetHpBelowPct(30)** / InstantKill |
| **"Loạn + Đấm" — combo 2 bước** | Bước1: EnemyActive/FrontRow/Any/Always/Confuse(2). Bước2: EnemyActive/FrontRow/Any/Always/Damage(1.0) |

---

## 10. Determinism & Parity Server/Client

- Rule chạy trong Sim thuần C# dùng chung; server (`BattleSession`) là nguồn chân lý, client-sim (`BattleRunner`) nếu chạy cũng cho kết quả **bit-identical** vì cùng seed + cùng thứ tự RNG.
- **Bất biến bắt buộc:** thứ tự tiêu thụ `ctx.Rng` = (Steps order) × (targets theo Queue order) × (trong action). Không được dùng cấu trúc không thứ tự (HashSet/Dictionary iteration cho mục tiêu). Có test seed cố định để khoá.
- Rule **không** đi qua wire (build từ SO 2 phía). Nếu tương lai server chạy headless từ cùng content, `ToSpec()` phải chạy được **không phụ thuộc UnityEngine runtime** ở phần `Program` (các lớp `TacticProgram/RuleStep/...` thuần C#, chỉ `RuleStepAuthoring` sống ở SO).

---

## 11. Chiến lược Test

Sim thuần C# → test offline được, không cần Unity Play mode.
1. **TargetResolver**: bàn cờ giả (2 SideState, formation nhiều loại quân) → assert đúng tập (Combatant, Group) cho mỗi Scope/RowMode/TroopFilter/MaxGroups.
2. **CombatOps mới**: `ApplyDamageToGroups` (EvenByHp vs FocusFrontFirst), `KillGroups`, `SetGroupsToHpPct` → assert Soldiers, event phát ra (RowIndex/GroupIndex/Troop/SoldiersKilled), `SyncTroops`.
3. **Tương thích**: `ApplyDamageToFront` cài lại phải cho **cùng kết quả** với bộ ca cũ (golden test: seed cố định, so số lính chết & chuỗi event).
4. **RuleEffect end-to-end**: chạy 6 skill ví dụ trên setup cố định → assert trạng thái + event.
5. **Determinism**: chạy 2 lần cùng seed → event log giống hệt.
6. **Visual** (Play mode, thủ công/tối thiểu): 1 scene formation nhiều hàng → xác nhận mỗi hàng có 1 thanh máu, fill đúng `rowSoldiers/rowMaxSoldiers`, tụt khi hàng mất máu, biến mất khi hàng tan.

---

## 12. Danh sách thay đổi theo file

**Sim (thuần C#) — thêm/sửa:**
- `Assets/Ctxd/Battle/Sim/Enums.cs` — thêm `TacticEffectKind.Rule` (cuối); thêm `TargetScope/RowMode/Distribution/ConditionKind/ActionKind`.
- `Assets/Ctxd/Battle/Sim/Rules/TacticProgram.cs` *(mới)* — `TacticProgram/RuleStep/TargetSelect/RuleCondition/RuleAction`.
- `Assets/Ctxd/Battle/Sim/Rules/TargetResolver.cs` *(mới)*.
- `Assets/Ctxd/Battle/Sim/Rules/RuleConditions.cs` *(mới)* — `Eval`.
- `Assets/Ctxd/Battle/Sim/Rules/RuleActions.cs` *(mới)* — `Apply`.
- `Assets/Ctxd/Battle/Sim/Rules/RuleEffect.cs` *(mới)*.
- `Assets/Ctxd/Battle/Sim/TacticSpec.cs` — thêm `TacticProgram Program`.
- `Assets/Ctxd/Battle/Sim/ITacticEffect.cs` — `TacticContext` thêm `BattleState State`.
- `Assets/Ctxd/Battle/Sim/CombatOps.cs` — thêm `ApplyDamageToGroups/KillGroups/SetGroupsToHpPct`; cài lại `ApplyDamageToFront` qua chúng; điền field event mới.
- `Assets/Ctxd/Battle/Sim/BattleEvent.cs` — *(tùy chọn)* thêm `RowIndex/GroupIndex/Troop/SoldiersKilled` (nice-to-have, không thuộc lõi HP bar).
- `Assets/Ctxd/Battle/Sim/TacticEffects.cs` — `Register(new RuleEffect())`.

**Cast sites:**
- `Assets/Ctxd/Battle/Sim/BattleRunner.cs` (`CastTactic:123`) — set `State`.
- `Server/BattleSession.cs` (`UseSkill:114`) — set `State`.

**Authoring:**
- `Assets/Ctxd/Data/TacticDefinition.cs` — thêm `useRuleProgram` + `[SerializeReference] ruleSteps` + build `Program` trong `ToSpec()`.

**Visual (client) — thu hẹp về HP bar:**
- `Assets/Ctxd/Visual/RowHealthBar.cs` *(mới)* — component thanh máu (`SetRatio`/`SetSortingOrder`) + prefab trong SO.
- `Assets/Ctxd/Battle/BattleSideField.cs` — spawn 1 `RowHealthBar`/hàng trong `Build`, set `ratio` từ `RowSnapshot`; huỷ chung `_units`. **Không** đụng sprite/PlayDie/diff.
- `Assets/Ctxd/Battle/VisualSpawner.cs` — thêm đường spawn RowHealthBar prefab.
- `Assets/Ctxd/Battle/ServerBattleDirector.cs` — **không đổi luồng** (tùy chọn: flash thanh máu khi Damage/GroupKilled).

**Test:**
- `Assets/Ctxd/Tests/…` *(mới)* — resolver, combatops, rule end-to-end, determinism, golden compat.

---

## 13. Rủi ro & Giảm thiểu

| Rủi ro | Giảm thiểu |
|---|---|
| Cài lại `ApplyDamageToFront` làm lệch hành vi cũ | Golden test seed cố định so event log trước/sau. |
| `[SerializeReference]` Inspector khó dùng | Phương án dự phòng struct phẳng cho bước đơn; drawer tùy chỉnh nếu cần. |
| Vỡ determinism do iteration không thứ tự | Cấm dùng tập không thứ tự trong resolver/action; test 2-run cùng seed. |
| `EnemyAll` giết tướng chưa active giữa hàng đợi | `AdvanceToNextLiving`/`HasLiving` đã bỏ qua tướng chết; phát `GeneralDefeated` khi cần; ghi rõ ngữ nghĩa. |
| Sự kiện per-group tăng khối lượng event (cap frame 4MB) | Gộp theo group-delta thay vì từng lính; số nổi tổng hợp. |
| Thanh máu lệch với sprite | Cả hai cùng dựng lại từ **một** snapshot trong `Build()` ⇒ luôn đồng bộ; không giữ trạng thái riêng để lệch. |

---

## 14. Quyết định còn mở (đề xuất default)

1. **UI authoring**: `[SerializeReference]` list (đề xuất) vs struct phẳng bước-đơn + list nâng cao. → chốt ở pha implement khi thử Inspector.
2. **`InstantKill` với `Confuse/Pushback`**: có cho phép trộn action cấp-group và cấp-combatant trong nhiều bước của **cùng** skill không? Đề xuất: **có**, vì mỗi bước độc lập.
3. **`TroopMask` [Flags]**: v1 làm luôn multi-troop (đề xuất) hay chỉ single-troop? Đề xuất **[Flags]** — chi phí thêm ~0, mở khoá "đánh cung + pháo".
4. **Điều kiện v1**: tập `ConditionKind` ở §4.1 đủ chưa? Có cần `ActorHpBelow`, `RoundGte`… ngay? Đề xuất giữ tối thiểu, append sau.
5. **`SetToHpPct` vs giữ `InstantTo1Hp` cũ**: gộp về `SetToHpPct(0)` hay giữ song song? Đề xuất **giữ effect cũ** cho tương thích, `SetToHpPct` là đường mới cho rule.
6. **Thanh máu (§7)**: v1 set-thẳng theo snapshot (đề xuất) hay tween mượt khi tụt? Đề xuất **set-thẳng** cho đơn giản; tween là polish sau. Cần chốt vị trí/kích thước bar (trên hàng, theo trục ISO) ở pha implement.

---

## 15. Tóm tắt

Rule-engine biến mỗi skill thành **chương trình luật select→condition→act** thuần dữ liệu, chạy trong Sim deterministic, dispatch qua **một** `RuleEffect` (additive, không phá vỡ effect cũ, không đổi wire). Kết hợp với **thanh máu mỗi hàng** (snapshot-driven, không đụng sprite) để phản hồi thị giác khi hàng mất máu, cho cả đòn thường lẫn skill. "Gì cũng có" đạt được bằng tổ hợp Scope × Rows × TroopFilter × Condition × Action, và mở rộng về sau chỉ là thêm giá trị enum + một nhánh trong `RuleActions`/`RuleConditions`.
