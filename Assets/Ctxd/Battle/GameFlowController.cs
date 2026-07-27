using System.Collections;
using System.Collections.Generic;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Luzart;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;
using Ctxd.Net;
using Ctxd.UI;

namespace Ctxd.Battle
{
    /// <summary>
    /// Điều phối luồng game end-to-end trên MỘT scene, dùng LuzartUI lane Screen (độc quyền):
    ///   Sảnh (Lobby) → Chọn tướng (SelectGeneral) → Chọn màn (SelectStage) → Đánh (ServerBattleDirector) → Kết quả (Result) → Sảnh.
    ///
    /// Server-authoritative: controller chỉ GỬI ý định (ListRoster/ListStages/JoinStage/StartBattle) và ĐIỀU HƯỚNG màn;
    /// mọi số liệu + kết quả do server tính. Không sở hữu BattleRunner. Tham chiếu wire bởi Forge (không Find runtime).
    ///
    /// Phối hợp với <see cref="ServerBattleDirector"/>: director render phần TRONG trận (đặt _externallyDriven=true để
    /// nó không tự JoinBattle và không tự hiện màn lineup); controller nghe Finished của director để hiện Kết quả.
    /// </summary>
    public sealed class GameFlowController : MonoBehaviour
    {
        [Header("Wired by the scene forge (no runtime lookup)")]
        [SerializeField] private NetworkService network;
        [SerializeField] private UIManager uiManager;
        [SerializeField] private ServerBattleDirector director;

        [Header("Connection")]
        public string host = "127.0.0.1";
        public int port = 5005;

        [Header("Player (stub tới khi có hệ tài khoản)")]
        public string playerName = "Chủ Công";
        public int playerLevel = 60;

        private readonly List<GeneralSummary> _roster = new List<GeneralSummary>();
        private readonly List<StageInfo> _stages = new List<StageInfo>();
        private List<string> _chosenGenerals = new List<string>();
        private string _stageId;
        private int _difficulty = 2;
        private bool _connected;

        private void Start()
        {
            if (network == null || uiManager == null)
            {
                Debug.LogError("[Flow] network/uiManager chưa được wire — không thể chạy flow.");
                return;
            }
            if (director != null)
            {
                director.SetExternallyDriven(true);      // director không tự join/hiện lineup
                director.Finished += OnBattleFinished;
            }
            network.ServerMessageReceived += OnServerMsg;
            StartCoroutine(ConnectLoop());
        }

        private void OnDestroy()
        {
            if (network != null) network.ServerMessageReceived -= OnServerMsg;
            if (director != null) director.Finished -= OnBattleFinished;
        }

        private IEnumerator ConnectLoop()
        {
            for (int attempt = 1; attempt <= 30 && !_connected; attempt++)
            {
                if (network.Connect(host, port))
                {
                    _connected = true;
                    network.Send(Command.ListRoster());
                    network.Send(Command.ListStages());
                    ShowLobby();
                    yield break;
                }
                Debug.LogWarning($"[Flow] kết nối lần {attempt} thất bại — thử lại sau 1s (chạy server: dotnet run --project Server -- server).");
                yield return new WaitForSeconds(1f);
            }
            if (!_connected) Debug.LogError("[Flow] không thể kết nối server sau 30s (127.0.0.1:5005).");
        }

        // ── inbound (main thread via NetworkPump) — chỉ xử lý phần pre/post-battle ──
        private void OnServerMsg(ServerMsg msg)
        {
            switch (msg.Type)
            {
                case ServerMsgType.Roster:
                    _roster.Clear();
                    if (msg.RosterList != null) _roster.AddRange(msg.RosterList);
                    if (uiManager.IsVisible(UIId.SelectGeneral)) ShowSelectGeneral().Forget();   // rebind nếu đang mở
                    break;
                case ServerMsgType.Stages:
                    _stages.Clear();
                    if (msg.StageList != null) _stages.AddRange(msg.StageList);
                    if (uiManager.IsVisible(UIId.SelectStage)) ShowSelectStage().Forget();
                    break;
                case ServerMsgType.Lobby:
                    // Server đã dựng session cho màn/đội hình đã chọn → vào trận (giữ thứ tự đã chọn).
                    uiManager.HideAsync(UIId.SelectStage, new UIHideOptions { Instant = true }).Forget();
                    network.Send(Command.StartBattle());
                    break;
                // BattleStart/Events/State/BattleEnd do ServerBattleDirector xử lý.
            }
        }

        // ── screens ───────────────────────────────────────────────────────────────
        private void ShowLobby()
        {
            uiManager.ShowAsync<LobbyUI>(UIId.Lobby, new UIContext(new LobbyData
            {
                PlayerName = playerName,
                Level = playerLevel,
                Resources = "Bạc 1.2M   •   Gỗ 840K   •   Lương 3.6M   •   Sắt 210K",
                OnCampaign = () => { HideThenShow(UIId.Lobby, ShowSelectGeneral); },
                OnFormation = () => { HideThenShow(UIId.Lobby, ShowSelectGeneral); },
            })).Forget();
        }

        private async UniTask ShowSelectGeneral()
        {
            if (_roster.Count == 0 && _connected) network.Send(Command.ListRoster());   // xin lại nếu chưa có
            await uiManager.ShowAsync<SelectGeneralUI>(UIId.SelectGeneral, new UIContext(new SelectGeneralData
            {
                Roster = new List<GeneralSummary>(_roster),
                OnConfirm = OnGeneralsChosen,
                OnBack = () => { HideThenShow(UIId.SelectGeneral, ShowLobbyAsync); },
            }));
        }

        private void OnGeneralsChosen(List<string> ids)
        {
            _chosenGenerals = ids ?? new List<string>();
            HideThenShow(UIId.SelectGeneral, ShowSelectStage);
        }

        private async UniTask ShowSelectStage()
        {
            if (_stages.Count == 0 && _connected) network.Send(Command.ListStages());
            await uiManager.ShowAsync<SelectStageUI>(UIId.SelectStage, new UIContext(new SelectStageData
            {
                Stages = new List<StageInfo>(_stages),
                OnConfirm = OnStageChosen,
                OnBack = () => { HideThenShow(UIId.SelectStage, ShowSelectGeneral); },
            }));
        }

        private void OnStageChosen(string stageId, int difficulty)
        {
            _stageId = stageId;
            _difficulty = difficulty;
            // Gửi ý định vào trận: server dựng session (màn + đội hình đã chọn + độ khó) rồi trả Lobby → OnServerMsg → StartBattle.
            network.Send(Command.JoinStage(stageId, _chosenGenerals, difficulty));
        }

        private void OnBattleFinished(BattleOutcome outcome)
        {
            StartCoroutine(ShowResultAfter(outcome, 2.5f));   // để banner kết trận hiện xong đã
        }

        private IEnumerator ShowResultAfter(BattleOutcome outcome, float delay)
        {
            yield return new WaitForSeconds(delay);
            bool win = outcome == BattleOutcome.OffenseWins;
            uiManager.ShowAsync<ResultUI>(UIId.Result, new UIContext(new ResultData
            {
                Win = win,
                OutcomeText = OutcomeText(outcome),
                RewardText = win
                    ? $"Phần thưởng: +{RewardExp()} EXP   •   +{RewardGrain()} Lương   •   Mảnh tướng ×1"
                    : "Không có phần thưởng — hãy tăng cường đội hình rồi thử lại.",
                OnContinue = OnResultContinue,
            })).Forget();
        }

        private void OnResultContinue()
        {
            uiManager.HideAsync(UIId.Result, new UIHideOptions { Instant = true }).Forget();
            if (director != null) director.ResetForNewBattle();
            ShowLobby();
        }

        // ── helpers ─────────────────────────────────────────────────────────────
        private UniTask ShowLobbyAsync() { ShowLobby(); return UniTask.CompletedTask; }

        private void HideThenShow(UIId toHide, System.Func<UniTask> next)
        {
            HideThenShowAsync(toHide, next).Forget();
        }

        private async UniTaskVoid HideThenShowAsync(UIId toHide, System.Func<UniTask> next)
        {
            await uiManager.HideAsync(toHide, new UIHideOptions { Instant = true });
            await next();
        }

        private int RewardExp() => 1200 + _difficulty * 800;
        private int RewardGrain() => 3000 + _difficulty * 500;

        private static string OutcomeText(BattleOutcome o) => o switch
        {
            BattleOutcome.OffenseWins => "Phe Công chiến thắng!",
            BattleOutcome.DefenseWins => "Phe Thủ chiến thắng — bạn đã thất bại.",
            BattleOutcome.Draw => "Bất phân thắng bại.",
            _ => "",
        };
    }
}
