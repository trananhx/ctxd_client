using System.Collections;
using System.Collections.Generic;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Luzart;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Data;
using Ctxd.Net;
using Ctxd.UI;
using Ctxd.Visual;

namespace Ctxd.Battle
{
    /// <summary>
    /// Server-driven battle: the client only SENDS commands and RENDERS the events/snapshots it receives — it owns
    /// NO <see cref="BattleRunner"/> and computes no numbers. All collaborators (network, database, UI manager) are
    /// SERIALIZED references wired by the Editor scene forge — no runtime Find / service-locator lookups.
    /// Shows the LuzartUI HUD + TEST panel and drives them via the instances <c>ShowAsync</c> returns.
    /// </summary>
    public sealed class ServerBattleDirector : MonoBehaviour
    {
        [Header("Wired by the scene forge (no runtime lookup)")]
        [SerializeField] private CtxdGameDatabase database;
        [SerializeField] private NetworkService network;
        [SerializeField] private UIManager uiManager;

        [Header("Connection")]
        public string host = "127.0.0.1";
        public int port = 5005;
        [Header("Playback")]
        public float eventPace = 0.28f;
        // RE: nộ cast THỦ CÔNG → tắt auto-stance mặc định để không đè lệnh người chơi (bật lại cho demo/AI nếu cần).
        public bool autoStance = false;

        [Tooltip("Bật (Forge set) khi có GameFlowController điều phối: director KHÔNG tự connect/JoinBattle và KHÔNG tự hiện màn lineup — flow controller lo phần đó.")]
        [SerializeField] private bool _externallyDriven = false;
        public void SetExternallyDriven(bool value) => _externallyDriven = value;

        [Header("Field layout (spacing)")]
        [Tooltip("↑ = các hàng cách xa nhau hơn (sửa dính/đè hàng)")] public float rowSpacing = 1.5f;
        [Tooltip("↑ = các nhóm trong một hàng cách xa nhau hơn")] public float groupSpacing = 1.1f;
        [Tooltip("↑ = các lính TRONG một nhóm cách xa nhau hơn (sửa lính dính nhau)")] public float spriteSpacing = 2.0f;
        [Tooltip("Kích thước mỗi lính")] public float unitScale = 0.7f;
        [Tooltip("Khoảng cách giữa HÀNG ĐẦU của 2 đạo quân (↓ = sát nhau hơn). Đo tâm-đến-tâm theo trục chéo iso.")] public float frontGap = 2.6f;

        // FX id = đường dẫn nguồn dưới Assets/Resources/sprite (AssetForge bake mỗi thư mục thành 1 prefab cùng id).
        // "{f}" được thay bằng att/def theo phe → mỗi phe dùng đúng bản màu của mình.
        [Header("FX chiêu thức — hiển thị bên BỊ ĐÁNH")]
        [Tooltip("Dùng khi chiến pháp không có FX riêng theo TacticId")] public string skillFxFormat = "skill/{f}/skill_01";
        [Tooltip("FX chiến pháp giác tỉnh, hiện thêm ở phe cast")] public string awakenFx = "eff/wujiangjuexing";

        [Header("FX buff & thế trận — hiển thị DƯỚI CHÂN phe được áp dụng")]
        [Tooltip("Buff/hồi quân: hiện dưới chân từng nhóm của phe được buff")] public string buffFxFormat = "eff/formation/{f}/down/1";
        [Tooltip("Thế trận Đột Kích (突击)")] public string stanceDotKichFx = "eff/formation/{f}/top/3";
        [Tooltip("Thế trận Tấn Công (攻击)")] public string stanceTanCongFx = "eff/formation/{f}/top/6";
        [Tooltip("Thế trận Phòng Thủ (防守)")] public string stancePhongThuFx = "eff/formation/{f}/top/2";
        [Tooltip("Độ cao FX dưới chân so với tâm nhóm (âm = thấp hơn)")] public float underFootY = -0.05f;
        [Tooltip("Cỡ FX dưới chân (art gốc vẽ to hơn đội hình hiện tại)")] public float underFootScale = 0.45f;
        [Tooltip("Bật = mỗi NHÓM một vầng sáng; tắt = mỗi HÀNG một vầng (art gốc vẽ theo hàng)")] public bool underFootPerGroup = false;

        [Header("FX BỀN server-driven (client diff từ snapshot ActiveEffects — đo bằng HIỆP)")]
        [Tooltip("FX cho fxId 'buff' (aura giữ liên tục dưới chân). fxId lạ chứa '/' được tra THẲNG làm id — server tự do gửi đường dẫn FX bất kỳ.")]
        public string persistentBuffFx = "eff/formation/{f}/down/1";
        [Tooltip("FX cho fxId 'fire' (lửa cháy qua vài hiệp)")] public string persistentFireFx = "warBuff/fc2";

        [Header("Lớp vẽ FX (B1) — override được per-event qua BattleEvent.Sorting")]
        [Tooltip("Buff: DƯỚI lính (lính ~300-700)")] public int buffSortingOrder = 100;
        [Tooltip("Skill: TRÊN lính, dưới thanh máu (800)")] public int skillSortingOrder = 780;

        [Header("Va chạm đổi hàng (E) — render khi RowAdvanced.Amount > 0")]
        [Tooltip("FX nổ tại điểm giao 2 quân khi hàng sau lao lên va nhau")] public string clashFx = "skill/{f}/skill_01";

        [Header("Thanh máu nhóm (chỉ hiện khi nhóm mất máu)")]
        [Tooltip("Màu thanh máu phe Công — sprite att là giáp XANH")] public Color offenseBarColor = new Color(0.25f, 0.62f, 1f, 0.95f);
        [Tooltip("Màu thanh máu phe Thủ — sprite def là giáp ĐỎ")] public Color defenseBarColor = new Color(0.90f, 0.20f, 0.18f, 0.95f);
        [Tooltip("[C1] Bật = thanh máu CHIA NGĂN từng ngăn; tắt = fill liền như cũ")] public bool barSegmented = false;
        [Tooltip("[C1] Số ngăn khi bật chia ngăn")] public int barSegments = 10;
        [Tooltip("[C2] Giây chờ SAU animation chết rồi hàng sau mới tiến lên (demo pacing; ≥ 0.4 để xác kịp biến mất)")]
        public float advanceDelay = 0.6f;

        [Header("Thế cánh cung (G2) — server khai RowShape:\"CanhCung\" per-tướng")]
        [Tooltip("Độ nhô của TÂM hàng giao tranh về phía địch (0 = tắt cong)")] public float bowDepth = 0.55f;
        [Tooltip("[cánh] Độ lệch ngang (đơn vị groupAxis) của hàng CanhTrai/CanhPhai so với trục giữa")] public float wingOffset = 2.4f;

        [Header("Tướng chờ (G3) — các tướng trong queue chưa ra trận đứng 2 bên đường")]
        [Tooltip("Bật/tắt hiển thị tướng chờ")] public bool benchEnabled = true;
        [Tooltip("Lệch VUÔNG GÓC trục giao tranh, ra rìa đường")] public float benchSideOffset = 3.4f;
        [Tooltip("Khoảng cách giữa các tướng chờ (dọc theo trục)")] public float benchSpacing = 1.1f;
        [Tooltip("Cỡ tướng chờ (nhân với unitScale)")] public float benchScale = 1.15f;

        public event System.Action<CombatantSnapshot, CombatantSnapshot> ActiveGeneralsChanged;
        public event System.Action<BattleOutcome> Finished;

        private BattleSnapshot _state;
        private BattleSideField _offField, _defField;   // field của tướng ACTIVE (mọi anim/FX combat trỏ vào đây)
        private Transform _offRoot, _defRoot;
        private Vector2 _facing;   // trục giao tranh iso (đặt ở Start) — bench + seam dùng chung
        private readonly Dictionary<string, UnitVisual> _offBench = new Dictionary<string, UnitVisual>();
        private readonly Dictionary<string, UnitVisual> _defBench = new Dictionary<string, UnitVisual>();
        // [nối đuôi] MỖI đạo quân trong queue một field, xếp hàng dọc sau lưng đạo quân active
        private readonly Dictionary<string, BattleSideField> _offFields = new Dictionary<string, BattleSideField>();
        private readonly Dictionary<string, BattleSideField> _defFields = new Dictionary<string, BattleSideField>();
        [Tooltip("[nối đuôi] Khoảng đệm (đơn vị HÀNG) giữa đuôi đạo quân trước và đầu đạo quân sau")]
        public float tailGapRows = 1.2f;
        private BattleHudUI _hud;
        private TestApiPanelUI _panel;
        private LineupUI _lineup;
        private readonly Queue<ServerMsg> _pending = new Queue<ServerMsg>();
        private bool _playing, _over;
        private bool _stancePreviewShown;   // FX thế trận phe mình đã vẽ lúc bấm → bỏ qua echo StanceChosen của server

        public BattleSnapshot State => _state;
        public bool IsOver => _over;

        private void Start()
        {
            if (database != null) database.BuildIndex(true);

            // 2 đạo quân đối mặt theo trục chéo iso (công dưới-trái ↔ thủ trên-phải), đối xứng qua tâm.
            // frontGap = khoảng cách giữa HÀNG ĐẦU của 2 bên → mỗi root lùi ra nửa khoảng cách từ tâm.
            _facing = new Vector2(1.9f, 1.25f).normalized;
            Vector2 facing = _facing;
            Vector3 half = facing * (Mathf.Max(0f, frontGap) * 0.5f);
            _offRoot = new GameObject("OffenseRoot").transform; _offRoot.SetParent(transform, false); _offRoot.localPosition = -half;
            _defRoot = new GameObject("DefenseRoot").transform; _defRoot.SetParent(transform, false); _defRoot.localPosition =  half;

            if (network == null) { Debug.LogError("[Director] NetworkService not wired."); return; }
            network.ServerMessageReceived += OnServerMsg;
            network.Disconnected += OnDisconnected;
            network.NetworkError += err => Debug.LogWarning($"[Director] net error: {err}");

            // Có GameFlowController điều phối → nó sở hữu connect + JoinStage/StartBattle. Đứng một mình → tự lo (legacy).
            if (!_externallyDriven)
                StartCoroutine(ConnectAndJoin());
        }

        private IEnumerator ConnectAndJoin()
        {
            for (int attempt = 1; attempt <= 30; attempt++)
            {
                if (network.Connect(host, port)) { network.Send(Command.JoinBattle()); yield break; }
                Debug.LogWarning($"[Director] connect attempt {attempt} failed — retrying in 1s (start the server: dotnet run --project Server -- server).");
                yield return new WaitForSeconds(1f);
            }
            Debug.LogError("[Director] could not reach the server after 30s — is it running on 127.0.0.1:5005?");
        }

        private void OnDestroy()
        {
            if (network == null) return;
            network.ServerMessageReceived -= OnServerMsg;
            network.Disconnected -= OnDisconnected;
        }

        private async UniTaskVoid ShowLineupAsync(BattleSnapshot snap)
        {
            if (uiManager == null) { network.Send(Command.StartBattle()); return; }   // no UI → auto-start
            var names = new List<string>();
            if (snap?.Offense?.Queue != null) foreach (var c in snap.Offense.Queue) names.Add(c.DisplayName);
            try
            {
                _lineup = await uiManager.ShowAsync<LineupUI>(UIId.MainMenu,
                    new UIContext(new LineupData { Names = names, OnConfirm = ConfirmLineup }));
            }
            catch (System.Exception ex) { Debug.LogError($"[Director] show lineup failed: {ex.Message}"); network.Send(Command.StartBattle()); }
        }

        private void ConfirmLineup(List<int> order)
        {
            if (network != null) network.Send(Command.StartBattle(order));
            if (uiManager != null) uiManager.HideAsync(UIId.MainMenu).Forget();
        }

        private async UniTaskVoid ShowBattleUiAsync()
        {
            if (uiManager == null) return;
            try
            {
                _panel = await uiManager.ShowAsync<TestApiPanelUI>(UIId.TestApiPanel,
                    new UIContext(new TestApiPanelData { OnTest = SendTestApi }));
                _hud = await uiManager.ShowAsync<BattleHudUI>(UIId.BattleHud,
                    new UIContext(new BattleHudData { OnStance = SendStance }));
            }
            catch (System.Exception ex) { Debug.LogError($"[Director] show battle UI failed: {ex.Message}"); }
        }

        private void OnDisconnected(string reason) => Say($"Mất kết nối: {reason}", 2f);

        // ── commands (UI → server) ───────────────────────────────────────────────
        /// <summary>Người chơi luôn cầm phe Công. FX thế trận vẽ NGAY lúc bấm (không đợi server) để nút có phản hồi tức thì;
        /// cờ <see cref="_stancePreviewShown"/> nuốt bản echo <c>StanceChosen</c> của server để khỏi vẽ hai lần.</summary>
        public void SendStance(Stance stance, bool awaken, bool cast = false)
        {
            PlayUnderFoot(Faction.Offense, StanceFx(stance));
            _stancePreviewShown = true;
            if (network != null) network.Send(Command.ChooseStance(stance, awaken, cast));
        }
        public void SendTestApi(TestApiKind kind, SideRef side) { if (network != null) network.Send(Command.TestApi(kind, side)); }

        /// <summary>Dọn trận sau khi về sảnh: huỷ field + ẩn HUD/panel + reset trạng thái để trận sau render sạch.
        /// Gọi bởi <see cref="GameFlowController"/> khi người chơi bấm "Về sảnh" ở màn Kết quả.</summary>
        public void ResetForNewBattle()
        {
            StopAllCoroutines();
            _pending.Clear();
            _playing = false; _over = false; _state = null;
            _offField = null; _defField = null;
            foreach (var kv in _offFields) if (kv.Value != null) Destroy(kv.Value.gameObject);
            foreach (var kv in _defFields) if (kv.Value != null) Destroy(kv.Value.gameObject);
            _offFields.Clear(); _defFields.Clear();
            foreach (var kv in _offBench) if (kv.Value != null) Destroy(kv.Value.gameObject);
            foreach (var kv in _defBench) if (kv.Value != null) Destroy(kv.Value.gameObject);
            _offBench.Clear(); _defBench.Clear();
            if (uiManager != null)
            {
                uiManager.HideAsync(UIId.BattleHud, new UIHideOptions { Instant = true }).Forget();
                uiManager.HideAsync(UIId.TestApiPanel, new UIHideOptions { Instant = true }).Forget();
            }
        }

        // ── inbound (main thread via NetworkPump) ────────────────────────────────
        private void OnServerMsg(ServerMsg msg)
        {
            _pending.Enqueue(msg);
            if (!_playing) StartCoroutine(Drain());
        }

        private IEnumerator Drain()
        {
            _playing = true;
            while (_pending.Count > 0) yield return HandleMsg(_pending.Dequeue());
            _playing = false;
        }

        private IEnumerator HandleMsg(ServerMsg msg)
        {
            switch (msg.Type)
            {
                case ServerMsgType.Lobby:
                    _state = msg.Snapshot;
                    // Externally-driven: GameFlowController đã chọn tướng/màn → nó gửi StartBattle. Đứng một mình → tự hiện lineup.
                    if (!_externallyDriven) ShowLineupAsync(msg.Snapshot).Forget();
                    break;
                case ServerMsgType.BattleStart:
                    _state = msg.Snapshot;
                    ShowBattleUiAsync().Forget();
                    RenderFields();
                    Say($"{_state.Offense.Nation} (Công) vs {_state.Defense.Nation} (Thủ)", 1.3f);
                    if (msg.Events != null) foreach (var e in msg.Events) yield return PlayEvent(e);
                    if (autoStance) StartCoroutine(AutoStanceLoop());
                    break;
                case ServerMsgType.Events:
                    if (msg.Events != null) foreach (var e in msg.Events) yield return PlayEvent(e);
                    break;
                case ServerMsgType.State:
                    _state = msg.Snapshot; RenderFields();
                    break;
                case ServerMsgType.BattleEnd:
                    _over = true; Finished?.Invoke(msg.Outcome); Say(OutcomeText(msg.Outcome), 3f);
                    break;
                case ServerMsgType.Error:
                    Debug.LogWarning($"[Director] server: {msg.Text}");
                    break;
            }
        }

        private IEnumerator AutoStanceLoop()
        {
            while (!_over)
            {
                yield return new WaitForSeconds(1.4f);
                if (_over || network == null || !network.IsConnected) yield break;
                SendStance((Stance)(Mathf.Abs(Time.frameCount) % 3), false, false);
            }
        }

        // ── rendering ────────────────────────────────────────────────────────────
        private void RenderFields()
        {
            if (_state == null) return;
            var off = Active(_state.Offense);
            var def = Active(_state.Defense);
            _offField = SyncSideFields(_offRoot, _state.Offense, _offFields, Faction.Offense);
            _defField = SyncSideFields(_defRoot, _state.Defense, _defFields, Faction.Defense);
            // [A] FX bền: diff Ở ĐÂY (seam áp snapshot) chứ KHÔNG trong PlayEvent — buff giữ liên tục, không nhấp nháy.
            SyncPersistentFx(_offField, _state.Offense);
            SyncPersistentFx(_defField, _state.Defense);
            // [G3] Tướng chờ trong queue đứng 2 bên đường quan chiến (diff theo Id — không rebuild mỗi snapshot).
            SyncBench(_offRoot, _state.Offense, _offBench);
            SyncBench(_defRoot, _state.Defense, _defBench);
            ActiveGeneralsChanged?.Invoke(off, def);
            if (_hud != null) _hud.SetActiveGenerals(off, def);
            if (_hud != null) _hud.SyncSideEffects(_state.Offense, _state.Defense);   // [Reskin] dãy icon buff bền trên HUD
        }

        /// <summary>
        /// [G3] Render các tướng CHƯA ra trận (queue, khác ActiveIndex, còn sống) thành hình đại diện đứng dọc
        /// RÌA đường giao tranh — như game gốc: đại quân đánh giữa, chư tướng đứng hai bên chờ tới lượt.
        /// Diff theo Id: tướng vào trận / tử trận thì hình chờ biến mất; đội hình data-driven từ snapshot Queue.
        /// </summary>
        private void SyncBench(Transform root, SideSnapshot side, Dictionary<string, UnitVisual> live)
        {
            if (root == null || side?.Queue == null) return;
            var seen = new HashSet<string>();
            if (benchEnabled && database != null)
            {
                Vector3 perp = new Vector3(-_facing.y, _facing.x, 0f);                     // vuông góc trục giao tranh
                float sideSign = side.Faction == Faction.Offense ? -1f : 1f;               // mỗi phe một bên đường
                Vector3 along = (Vector3)_facing * (side.Faction == Faction.Offense ? -1f : 1f);   // lùi về hậu phương phe mình
                int slot = 0;
                for (int i = 0; i < side.Queue.Count; i++)
                {
                    var c = side.Queue[i];
                    if (c == null || i == side.ActiveIndex || !c.Alive) continue;
                    seen.Add(c.Id);
                    Vector3 pos = root.position + perp * (sideSign * benchSideOffset) + along * (slot * benchSpacing);
                    if (live.TryGetValue(c.Id, out var uv) && uv != null) { uv.transform.position = pos; slot++; continue; }

                    var visual = database.GetVisualForTroop(c.Troop);
                    uv = VisualSpawner.SpawnUnit(visual, side.Faction, root);
                    if (uv == null) { slot++; continue; }
                    float s = unitScale * benchScale;
                    uv.transform.localScale = Vector3.one * s;
                    // đứng bằng CHÂN + sort theo chân — cùng quy tắc với lính trong field
                    Vector3 ext = uv.spriteRenderer != null && uv.spriteRenderer.sprite != null
                        ? uv.spriteRenderer.sprite.bounds.extents * s : Vector3.zero;
                    uv.transform.position = pos + Vector3.up * ext.y;
                    int order = 500 - Mathf.RoundToInt((uv.transform.position.y - ext.y) * 50f);
                    uv.baseSortingOrder = order; uv.SetSortingOrder(order);
                    uv.PlayIdle();
                    live[c.Id] = uv;
                    slot++;
                }
            }
            // huỷ hình chờ của tướng đã ra trận / tử trận / tắt bench
            var stale = new List<string>();
            foreach (var kv in live) if (!seen.Contains(kv.Key) || kv.Value == null) stale.Add(kv.Key);
            foreach (var k in stale)
            {
                var uv = live[k]; live.Remove(k);
                if (uv != null) Destroy(uv.gameObject);
            }
        }

        private void SyncPersistentFx(BattleSideField field, SideSnapshot side)
        {
            if (field == null || side == null) return;
            field.SyncActiveEffects(side.Effects, id => Fx(PersistentFxFormat(id), side.Faction), underFootY, underFootScale);
        }

        /// <summary>fxId ngắn ("buff"/"fire") map qua Inspector; fxId LẠ được coi là id FX trực tiếp (vd server gửi
        /// thẳng "warBuff/12" hay "eff/...{f}...") — client hỗ trợ server tối đa, thêm FX mới không cần sửa client.</summary>
        private string PersistentFxFormat(string fxId) => fxId switch
        {
            "buff" => persistentBuffFx,
            "fire" => persistentFireFx,
            _      => fxId,
        };

        /// <summary>
        /// [nối đuôi] Render MỌI đạo quân còn sống từ ActiveIndex trở đi thành HÀNG DỌC: đạo quân active ở đầu
        /// (offset 0), đạo quân sau đứng ngay sau ĐUÔI đạo quân trước (offset = tổng hàng sống phía trước + đệm).
        /// Quân trước rụng hàng → offset co lại → cả đạo quân sau bước lên (SetHomeOffset tween). Diff theo Id.
        /// </summary>
        private BattleSideField SyncSideFields(Transform root, SideSnapshot side, Dictionary<string, BattleSideField> fields, Faction faction)
        {
            if (root == null || side?.Queue == null) return null;
            var seen = new HashSet<string>();
            BattleSideField active = null;
            float rowsAhead = 0f; int armiesAhead = 0;
            for (int i = side.ActiveIndex; i < side.Queue.Count; i++)
            {
                var c = side.Queue[i];
                if (c == null) continue;
                bool isActive = i == side.ActiveIndex;
                if (!isActive && !c.Alive) continue;   // tướng chết ở sau không render (active thua thì ActiveIndex đã nhảy)
                seen.Add(c.Id);
                fields.TryGetValue(c.Id, out var f);
                bool fresh = f == null;
                if (fresh)
                {
                    var go = new GameObject($"Field_{faction}_{c.Id}"); go.transform.SetParent(root, false);
                    f = go.AddComponent<BattleSideField>();
                    try { f.Build(c, faction, database, Layout()); }
                    catch (System.Exception ex) { Debug.LogError($"[Director] field build: {ex}"); Destroy(go); continue; }
                    fields[c.Id] = f;
                }
                else f.ApplyState(c);
                f.SetHomeOffset(f.RowAxis * (rowsAhead + armiesAhead * tailGapRows), instant: fresh);
                rowsAhead += LivingRows(c);
                armiesAhead++;
                if (isActive) active = f;
            }
            var stale = new List<string>();
            foreach (var kv in fields) if (!seen.Contains(kv.Key) || kv.Value == null) stale.Add(kv.Key);
            foreach (var k in stale) { var f = fields[k]; fields.Remove(k); if (f != null) Destroy(f.gameObject); }
            return active;
        }

        private static float LivingRows(CombatantSnapshot c)
        {
            if (c?.Formation == null) return 0f;
            int n = 0;
            foreach (var r in c.Formation) { int s = 0; foreach (var g in r.Groups) s += g.Soldiers; if (s > 0) n++; }
            return n;
        }

        private FieldLayout Layout() => new FieldLayout { rowSpacing = rowSpacing, groupSpacing = groupSpacing, spriteSpacing = spriteSpacing, unitScale = unitScale, offenseBarColor = offenseBarColor, defenseBarColor = defenseBarColor, barSegmented = barSegmented, barSegments = barSegments, advanceDelay = advanceDelay, bowDepth = bowDepth, wingOffset = wingOffset };

        private IEnumerator PlayEvent(BattleEvent e)
        {
            switch (e.Type)
            {
                case BattleEventType.Attack:
                    AttackerField(e.Side)?.PlayAction(UnitAction.Attack);
                    yield return Wait(eventPace * 0.55f);
                    TargetField(e.Side)?.PlayAction(UnitAction.Hurt);
                    SpawnDamage(TargetField(e.Side), e.Amount, e.Crit, false);
                    yield return Wait(eventPace * 0.45f);
                    break;
                case BattleEventType.SkillCast:
                case BattleEventType.TacticCast:   // FIX: sim phát TacticCast; gộp render như SkillCast (trước đây chiến pháp KHÔNG hiển thị)
                    if (!string.IsNullOrEmpty(e.Text)) Say(e.Text, 1.2f);
                    // [Reskin] pop tên chiến pháp thư pháp giữa màn (ảnh rip nếu map, không thì text TacticName).
                    if (_hud != null && (!string.IsNullOrEmpty(e.TacticId) || !string.IsNullOrEmpty(e.TacticName)))
                        _hud.ShowSkillName(e.TacticId, e.TacticName);
                    AttackerField(e.Side)?.PlayAction(UnitAction.Attack);
                    SpawnSkillEffect(e);
                    yield return Wait(eventPace);
                    break;
                case BattleEventType.Damage:
                    SpawnDamage(TargetField(e.Side), e.Amount, e.Crit, e.Effect == TacticEffectKind.Heal);
                    yield return Wait(eventPace * 0.4f);
                    break;
                case BattleEventType.GroupKilled:   // 1 nhóm lính tan (chết-theo-hàng) — nhịp ngắn
                    yield return Wait(eventPace * 0.15f);
                    break;
                case BattleEventType.RoundBegin:
                    _stancePreviewShown = false;
                    break;
                case BattleEventType.StanceChosen:  // vầng sáng thế trận dưới chân phe đã chọn
                    if (e.Side == Faction.Offense && _stancePreviewShown) _stancePreviewShown = false;   // đã vẽ lúc bấm
                    else PlayUnderFoot(e.Side, StanceFx(e.Stance));
                    yield return Wait(eventPace * 0.2f);
                    break;
                case BattleEventType.Morale:        // đầy nộ / hỗn loạn / đẩy lùi — báo banner nếu có text
                case BattleEventType.Confusion:
                case BattleEventType.Pushback:
                    if (!string.IsNullOrEmpty(e.Text)) Say(e.Text, 1f);
                    yield return Wait(eventPace * 0.35f);
                    break;
                case BattleEventType.UnitKilled:
                    SpawnDamage(FieldOf(e.Side), e.Amount, false, false);
                    break;
                case BattleEventType.ExpPopup:
                    SpawnExp(FieldOf(e.Side), e.Exp);
                    break;
                case BattleEventType.RowAdvanced:
                    if (e.Amount > 0)   // [E] server tính va chạm khi hàng sau lao lên → 2 quân xô nhau + FX + số trừ máu
                    {
                        var adv = FieldOf(e.Side);      // e.Side = phe MẤT hàng (đang tiến lên và chịu va chạm)
                        var foe = TargetField(e.Side);
                        adv?.PlayClash();
                        foe?.PlayClash();
                        if (adv != null && foe != null)
                        {
                            var cfx = Fx(clashFx, e.Side);
                            if (cfx != null) VisualSpawner.SpawnEffect(cfx, (adv.Center + foe.Center) * 0.5f, transform, skillSortingOrder);
                        }
                        SpawnDamage(adv, e.Amount, false, false);
                        yield return Wait(eventPace * 0.5f);
                    }
                    else yield return Wait(eventPace * 0.25f);
                    break;
                case BattleEventType.GeneralDefeated:
                    if (!string.IsNullOrEmpty(e.Text)) Say(e.Text, 1.3f);
                    yield return Wait(eventPace);
                    break;
                case BattleEventType.Banner:
                case BattleEventType.StanceClash:
                case BattleEventType.UnitAdded:
                // [Stage 2A-2E] banner cho sự kiện mới (chuỗi/phản-giữ/biến-thể/phantom/vây/trụ tên).
                case BattleEventType.TacticHeld:
                case BattleEventType.TacticChain:
                case BattleEventType.TacticVariantOffer:
                case BattleEventType.PhantomSpawned:
                case BattleEventType.SurroundBegin:
                case BattleEventType.SurroundSlam:
                case BattleEventType.SurroundEnd:
                case BattleEventType.TowerShoot:
                case BattleEventType.TowerBreak:
                case BattleEventType.TowerCountdown:
                case BattleEventType.Fire:
                    if (!string.IsNullOrEmpty(e.Text)) Say(e.Text, 0.9f);
                    yield return Wait(eventPace * 0.35f);
                    break;
            }
        }

        // ── spawn helpers (prefab-in-SO) ─────────────────────────────────────────
        private void SpawnDamage(BattleSideField at, double amount, bool crit, bool heal)
        {
            if (at == null || database == null || amount <= 0) return;
            Color color = heal ? new Color(0.3f, 1f, 0.4f) : new Color(1f, 0.85f, 0.2f);
            string text = (heal ? "+" : "-") + Mathf.RoundToInt(Mathf.Abs((float)amount));
            VisualSpawner.SpawnFloatingText(database.floatingText,
                at.Center + Vector3.up * Random.Range(0.05f, 0.4f), text, crit ? Color.red : color, crit);
        }

        private void SpawnExp(BattleSideField at, int exp)
        {
            if (at == null || database == null || exp <= 0) return;
            VisualSpawner.SpawnFloatingText(database.floatingText,
                at.Center + Vector3.up * 0.5f, $"+{exp} EXP", new Color(0.5f, 0.9f, 1f), false);
        }

        /// <summary>
        /// Two DIFFERENT visual grammars, chosen by the tactic's effect family:
        /// <list type="bullet">
        /// <item>offensive (Damage/Aoe/Confusion/…) → the VFX plays on the SIDE BEING HIT, at its centre;</item>
        /// <item>supportive (Buff/Heal) → nothing happens on the enemy, so it plays UNDER THE FEET of the caster's
        /// own groups, like a stance aura.</item>
        /// </list>
        /// The <c>att</c>/<c>def</c> art variant always follows the CASTER, since the effect is theirs.
        /// </summary>
        private void SpawnSkillEffect(BattleEvent e)
        {
            if (IsSupportEffect(e.Effect)) { PlayUnderFoot(e.Side, buffFxFormat, e); return; }

            var target = TargetField(e.Side);
            if (target == null || database == null) return;
            var ev = SkillFx(e);
            if (ev != null)
            {
                // [B] Server data điều khiển render: AnchorRows (hàng 1 / tâm N hàng), Sorting (trên/dưới lính),
                // LifetimeSec (FX 1 lượt tự tắt vs cháy lâu). Không set → default Inspector, hành vi cũ giữ nguyên.
                Vector3 pos = e.AnchorRows.HasValue ? target.RowCenter(Mathf.Max(1, e.AnchorRows.Value)) : target.Center;
                VisualSpawner.SpawnEffect(ev, pos, transform,
                    e.Sorting ?? skillSortingOrder, e.LifetimeSec >= 0f ? e.LifetimeSec : (float?)null);
            }
            if (e.Awakened && AttackerField(e.Side) != null)
            {
                var aw = database.GetEffectVisual(awakenFx);
                if (aw != null) VisualSpawner.SpawnEffect(aw, AttackerField(e.Side).Center, transform, skillSortingOrder);
            }
        }

        private static bool IsSupportEffect(TacticEffectKind kind)
            => kind == TacticEffectKind.Buff || kind == TacticEffectKind.Heal;

        /// <summary>Per-tactic art if the forge baked one (<c>skill/&lt;f&gt;/&lt;tacticId&gt;</c>), else the configured default.</summary>
        private EffectVisualDefinition SkillFx(BattleEvent e)
        {
            string f = Facing(e.Side);
            if (!string.IsNullOrEmpty(e.TacticId))
            {
                var byId = database.GetEffectVisual($"skill/{f}/{e.TacticId}");
                if (byId != null) return byId;
            }
            return Fx(skillFxFormat, e.Side);
        }

        /// <summary>Aura dưới chân. Có <paramref name="e"/> (đòn buff từ server) → event data điều khiển:
        /// ôm cả nhóm (B2), giới hạn hàng (4), lớp vẽ (B1, stack không lệch — B3), thời gian sống (4b).</summary>
        private void PlayUnderFoot(Faction side, string format, BattleEvent e = null)
        {
            var field = FieldOf(side);
            var fx = Fx(format, side);
            if (field == null || fx == null) return;
            field.SpawnUnderFootEffect(fx, underFootY, underFootScale, underFootPerGroup,
                wholeGroup: e != null && e.AnchorWholeGroup,
                anchorRows: e?.AnchorRows,
                sortingOverride: e != null ? (e.Sorting ?? buffSortingOrder) : (int?)null,
                lifetimeSec: e != null && e.LifetimeSec >= 0f ? e.LifetimeSec : (float?)null);
        }

        private EffectVisualDefinition Fx(string format, Faction side)
            => (database == null || string.IsNullOrEmpty(format))
                ? null
                : database.GetEffectVisual(format.Replace("{f}", Facing(side)));

        private static string Facing(Faction side) => side == Faction.Offense ? "att" : "def";

        private string StanceFx(Stance stance) => stance switch
        {
            Stance.DotKich => stanceDotKichFx,
            Stance.TanCong => stanceTanCongFx,
            _              => stancePhongThuFx,
        };

        private void Say(string text, float dur)
        {
            if (_hud != null) _hud.ShowBanner(text, dur);
        }

        // ── helpers ──────────────────────────────────────────────────────────────
        private BattleSideField FieldOf(Faction side) => side == Faction.Offense ? _offField : _defField;
        private BattleSideField AttackerField(Faction side) => FieldOf(side);
        private BattleSideField TargetField(Faction side) => side == Faction.Offense ? _defField : _offField;
        private static CombatantSnapshot Active(SideSnapshot s)
            => (s?.Queue != null && s.ActiveIndex >= 0 && s.ActiveIndex < s.Queue.Count) ? s.Queue[s.ActiveIndex] : null;
        private static WaitForSeconds Wait(float s) => new WaitForSeconds(s);
        private static string OutcomeText(BattleOutcome o) => o switch
        {
            BattleOutcome.OffenseWins => "Phe Công chiến thắng!",
            BattleOutcome.DefenseWins => "Phe Thủ chiến thắng!",
            BattleOutcome.Draw => "Bất phân thắng bại",
            _ => "",
        };
    }
}
