using System;
using System.Net.Sockets;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.Server
{
    /// <summary>
    /// Serves one connected client: reads length-prefixed <see cref="Command"/> frames, dispatches to its
    /// <see cref="BattleSession"/>, and writes back <see cref="ServerMsg"/> frames (events + state snapshots).
    /// </summary>
    public sealed class ClientConnection
    {
        private readonly TcpClient _client;
        private readonly int _cid;
        private readonly object _writeLock = new object();
        private NetworkStream _stream;
        private BattleSession _session;

        public ClientConnection(TcpClient client, int cid) { _client = client; _cid = cid; }

        public void Serve()
        {
            _client.NoDelay = true;
            _stream = _client.GetStream();
            while (true)
            {
                string json = Framing.ReadFrame(_stream);
                if (json == null) break;   // clean EOF
                Command cmd;
                try { cmd = Wire.Deserialize<Command>(json); }
                catch (Exception ex) { Send(ServerMsg.Error($"bad command: {ex.Message}")); continue; }
                Dispatch(cmd);
            }
        }

        private void Dispatch(Command cmd)
        {
            switch (cmd.Type)
            {
                case ClientMsgType.JoinBattle:   JoinBattle(cmd); break;
                case ClientMsgType.StartBattle:  StartBattle(cmd); break;
                case ClientMsgType.ChooseStance: ChooseStance(cmd); break;
                case ClientMsgType.TestApi:      TestApi(cmd); break;
            }
        }

        private void JoinBattle(Command cmd)
        {
            var dto = ScenarioLoader.Load(cmd.ScenarioId);
            if (cmd.Seed != 0) dto.Seed = cmd.Seed;
            _session = new BattleSession(dto.ToSetup());   // built, NOT begun → lobby for pre-battle lineup
            Console.WriteLine($"[server] #{_cid} JoinBattle → lobby ({dto.OffenseNation} (Công) vs {dto.DefenseNation} (Thủ))");
            Send(ServerMsg.Lobby(_session.Snapshot()));
        }

        private void StartBattle(Command cmd)
        {
            if (NoSession()) return;
            _session.ReorderOffense(cmd.Order);
            var begin = _session.Begin();
            Console.WriteLine($"[server] #{_cid} StartBattle (order: {(cmd.Order != null ? string.Join(",", cmd.Order) : "default")})");
            Send(ServerMsg.BattleStart(_session.Snapshot(), begin));
        }

        private void ChooseStance(Command cmd)
        {
            if (NoSession()) return;
            Broadcast(_session.Step(new TurnInput(cmd.Stance, cmd.Awaken)));
        }

        private void TestApi(Command cmd)
        {
            if (NoSession()) return;
            var events = _session.TestApi(cmd.TestKind, cmd.TargetFaction);
            Console.WriteLine($"[server] #{_cid} TEST {cmd.TestKind}/{cmd.Side} → {events.Count} events");
            Broadcast(events);
        }

        private void Broadcast(System.Collections.Generic.List<BattleEvent> events)
        {
            Send(ServerMsg.Batch(events));
            Send(ServerMsg.StateMsg(_session.Snapshot()));
            if (_session.IsOver) Send(ServerMsg.End(_session.Outcome));
        }

        private bool NoSession()
        {
            if (_session != null) return false;
            Send(ServerMsg.Error("no active battle — send JoinBattle first"));
            return true;
        }

        private void Send(ServerMsg msg)
        {
            string json = Wire.Serialize(msg);
            lock (_writeLock) Framing.WriteFrame(_stream, json);
        }
    }
}
