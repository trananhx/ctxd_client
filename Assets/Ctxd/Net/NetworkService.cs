using System;
using System.Collections.Concurrent;
using System.Net.Sockets;
using System.Threading;
using UnityEngine;
using Luzart;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.Net
{
    /// <summary>
    /// Client-side TCP link to the authoritative CTXD server, as a Luzart <see cref="IService"/>.
    /// A background thread reads length-prefixed <see cref="ServerMsg"/> frames into a thread-safe queue;
    /// <see cref="Pump"/> drains it on the MAIN thread (call from <see cref="NetworkPump"/>.Update) and raises
    /// events. The client only SENDS <see cref="Command"/>s and RENDERS events — it never resolves combat.
    /// </summary>
    [CreateAssetMenu(menuName = "CTXD/Network Service", fileName = "NetworkService")]
    public sealed class NetworkService : AbstractScriptableService
    {
        [SerializeField] private string _host = "127.0.0.1";
        [SerializeField] private int _port = 5005;
        [SerializeField] private bool _connectOnStart = false;

        private TcpClient _client;
        private NetworkStream _stream;
        private Thread _recvThread;
        private volatile bool _running;
        private int _generation;   // bumped on connect/disconnect so a stale recv thread stops enqueuing
        private readonly ConcurrentQueue<ServerMsg> _inbound = new ConcurrentQueue<ServerMsg>();
        private readonly ConcurrentQueue<Action> _mainActions = new ConcurrentQueue<Action>();
        private readonly object _writeLock = new object();

        public string Host { get => _host; set => _host = value; }
        public int Port { get => _port; set => _port = value; }
        public bool IsConnected => _running && _client != null && _client.Connected;
        public int QueuedCount => _inbound.Count;

        // All raised on the MAIN thread during Pump().
        public event Action<ServerMsg> ServerMessageReceived;
        public event Action Connected;
        public event Action<string> Disconnected;
        public event Action<string> NetworkError;

        // ── Luzart service lifecycle ─────────────────────────────────────────────
        protected override void DoStartContent() { if (_connectOnStart) Connect(); }
        protected override void DoStopContent() => Disconnect();
        protected override void DoTerminate() => Disconnect();
        private void OnDisable() => Disconnect();   // safety net on domain reload / play stop

        // ── connection ───────────────────────────────────────────────────────────
        public bool Connect() => Connect(_host, _port);

        public bool Connect(string host, int port)
        {
            Disconnect();
            while (_inbound.TryDequeue(out _)) { }       // drop stale messages from a prior session/connection
            while (_mainActions.TryDequeue(out _)) { }
            _host = host; _port = port;
            try
            {
                _client = new TcpClient { NoDelay = true };
                _client.Connect(host, port);
                _stream = _client.GetStream();
                _running = true;
                int gen = ++_generation;
                _recvThread = new Thread(() => RecvLoop(gen)) { IsBackground = true, Name = "ctxd-recv" };
                _recvThread.Start();
                _mainActions.Enqueue(() => Connected?.Invoke());
                return true;
            }
            catch (Exception ex)
            {
                _running = false;
                _mainActions.Enqueue(() => NetworkError?.Invoke($"connect failed: {ex.Message}"));
                return false;
            }
        }

        public void Disconnect()
        {
            _running = false;
            _generation++;            // invalidate the running recv loop
            try { _stream?.Close(); } catch { /* ignore */ }
            try { _client?.Close(); } catch { /* ignore */ }
            _stream = null; _client = null;
            // recv thread is background + guards on _running/gen; don't Join (it may block in Read).
        }

        // ── send (client → server) ────────────────────────────────────────────────
        public void Send(Command cmd)
        {
            if (!IsConnected) { _mainActions.Enqueue(() => NetworkError?.Invoke("send while disconnected")); return; }
            try
            {
                string json = Wire.Serialize(cmd);
                lock (_writeLock) Framing.WriteFrame(_stream, json);
            }
            catch (Exception ex)
            {
                HandleDrop($"send failed: {ex.Message}");
            }
        }

        public void Send(ClientMsgType type) => Send(new Command { Type = type });

        // ── main-thread pump ───────────────────────────────────────────────────────
        /// <summary>Drain main-thread callbacks + inbound messages. Call once per frame on the MAIN thread.</summary>
        public void Pump()
        {
            while (_mainActions.TryDequeue(out var a))
            {
                try { a(); } catch (Exception ex) { Debug.LogError($"[NetworkService] action: {ex}"); }
            }
            while (_inbound.TryDequeue(out var msg))
            {
                try { ServerMessageReceived?.Invoke(msg); } catch (Exception ex) { Debug.LogError($"[NetworkService] handler: {ex}"); }
            }
        }

        // ── background receive loop ──────────────────────────────────────────────
        private void RecvLoop(int gen)
        {
            try
            {
                while (_running && gen == _generation)
                {
                    string json = Framing.ReadFrame(_stream);
                    if (json == null) break;          // clean EOF
                    if (gen != _generation) return;   // superseded by a newer connection
                    try { _inbound.Enqueue(Wire.Deserialize<ServerMsg>(json)); }
                    catch (Exception ex) { _mainActions.Enqueue(() => NetworkError?.Invoke($"bad frame: {ex.Message}")); }
                }
                if (gen == _generation) HandleDrop("server closed");
            }
            catch (Exception ex)
            {
                if (gen == _generation) HandleDrop(ex.Message);
            }
        }

        private void HandleDrop(string reason)
        {
            if (!_running) return;
            _running = false;
            _mainActions.Enqueue(() => Disconnected?.Invoke(reason));
        }
    }
}
