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
        public bool autoStance = true;

        [Header("Field layout (spacing)")]
        [Tooltip("↑ = các hàng cách xa nhau hơn (sửa dính/đè hàng)")] public float rowSpacing = 1.5f;
        [Tooltip("↑ = các nhóm trong một hàng cách xa nhau hơn")] public float groupSpacing = 1.1f;
        [Tooltip("Kích thước mỗi lính")] public float unitScale = 0.7f;

        public event System.Action<CombatantSnapshot, CombatantSnapshot> ActiveGeneralsChanged;
        public event System.Action<BattleOutcome> Finished;

        private BattleSnapshot _state;
        private BattleSideField _offField, _defField;
        private Transform _offRoot, _defRoot;
        private BattleHudUI _hud;
        private TestApiPanelUI _panel;
        private LineupUI _lineup;
        private readonly Queue<ServerMsg> _pending = new Queue<ServerMsg>();
        private bool _playing, _over;

        public BattleSnapshot State => _state;
        public bool IsOver => _over;

        private void Start()
        {
            if (database != null) database.BuildIndex(true);
            gameObject.AddComponent<BattleFieldSelection>();   // click a row/group → on-demand HP bar

            _offRoot = new GameObject("OffenseRoot").transform; _offRoot.SetParent(transform, false); _offRoot.localPosition = new Vector3(-1.9f, -1.25f, 0f);
            _defRoot = new GameObject("DefenseRoot").transform; _defRoot.SetParent(transform, false); _defRoot.localPosition = new Vector3(1.9f, 1.25f, 0f);

            if (network == null) { Debug.LogError("[Director] NetworkService not wired."); return; }
            network.ServerMessageReceived += OnServerMsg;
            network.Disconnected += OnDisconnected;
            network.NetworkError += err => Debug.LogWarning($"[Director] net error: {err}");

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
        public void SendStance(Stance stance, bool awaken) { if (network != null) network.Send(Command.ChooseStance(stance, awaken)); }
        public void SendTestApi(TestApiKind kind, SideRef side) { if (network != null) network.Send(Command.TestApi(kind, side)); }

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
                    ShowLineupAsync(msg.Snapshot).Forget();
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
                SendStance((Stance)(Mathf.Abs(Time.frameCount) % 3), false);
            }
        }

        // ── rendering ────────────────────────────────────────────────────────────
        private void RenderFields()
        {
            if (_state == null) return;
            var off = Active(_state.Offense);
            var def = Active(_state.Defense);
            _offField = Reconcile(_offField, _offRoot, off, Faction.Offense);
            _defField = Reconcile(_defField, _defRoot, def, Faction.Defense);
            ActiveGeneralsChanged?.Invoke(off, def);
            if (_hud != null) _hud.SetActiveGenerals(off, def);
        }

        /// <summary>Same active general → diff/animate in place; different general (or first) → hard rebuild.</summary>
        private BattleSideField Reconcile(BattleSideField existing, Transform root, CombatantSnapshot c, Faction faction)
        {
            if (c == null) { if (existing != null) Destroy(existing.gameObject); return null; }
            if (existing != null && existing.CombatantId == c.Id) { existing.ApplyState(c); return existing; }
            return Rebuild(existing, root, c, faction);
        }

        private BattleSideField Rebuild(BattleSideField existing, Transform root, CombatantSnapshot c, Faction faction)
        {
            if (existing != null) Destroy(existing.gameObject);
            if (c == null) return null;
            var go = new GameObject($"Field_{faction}"); go.transform.SetParent(root, false);
            var fv = go.AddComponent<BattleSideField>();
            try { fv.Build(c, faction, database, new FieldLayout { rowSpacing = rowSpacing, groupSpacing = groupSpacing, unitScale = unitScale }); }
            catch (System.Exception ex) { Debug.LogError($"[Director] field build: {ex}"); Destroy(go); return null; }
            return fv;
        }

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
                    if (!string.IsNullOrEmpty(e.Text)) Say(e.Text, 1.2f);
                    AttackerField(e.Side)?.PlayAction(UnitAction.Attack);
                    SpawnSkillEffect(e);
                    yield return Wait(eventPace);
                    break;
                case BattleEventType.Damage:
                    SpawnDamage(TargetField(e.Side), e.Amount, e.Crit, e.Effect == TacticEffectKind.Heal);
                    yield return Wait(eventPace * 0.4f);
                    break;
                case BattleEventType.UnitKilled:
                    SpawnDamage(FieldOf(e.Side), e.Amount, false, false);
                    break;
                case BattleEventType.ExpPopup:
                    SpawnExp(FieldOf(e.Side), e.Exp);
                    break;
                case BattleEventType.RowAdvanced:
                    yield return Wait(eventPace * 0.25f);
                    break;
                case BattleEventType.GeneralDefeated:
                    if (!string.IsNullOrEmpty(e.Text)) Say(e.Text, 1.3f);
                    yield return Wait(eventPace);
                    break;
                case BattleEventType.Banner:
                case BattleEventType.StanceClash:
                case BattleEventType.UnitAdded:
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

        private void SpawnSkillEffect(BattleEvent e)
        {
            var target = TargetField(e.Side);
            if (target == null || database == null) return;
            var ev = database.GetEffectVisual(e.Awakened ? "wushen" : "skill_generic") ?? database.GetEffectVisual("skill_generic");
            if (ev != null) VisualSpawner.SpawnEffect(ev, target.Center, transform);
            if (e.Awakened && AttackerField(e.Side) != null)
            {
                var aw = database.GetEffectVisual("wujiangjuexing");
                if (aw != null) VisualSpawner.SpawnEffect(aw, AttackerField(e.Side).Center, transform);
            }
        }

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
