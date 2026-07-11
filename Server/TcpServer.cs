using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;

namespace Ctxd.Server
{
    /// <summary>TcpListener on 127.0.0.1:5005. One thread (and one <see cref="BattleSession"/>) per connection.</summary>
    public sealed class TcpServer
    {
        private readonly IPAddress _addr;
        private readonly int _port;

        public TcpServer(string host = "127.0.0.1", int port = 5005)
        {
            _addr = IPAddress.Parse(host);
            _port = port;
        }

        public void Run()
        {
            var listener = new TcpListener(_addr, _port);
            listener.Start();
            Console.WriteLine($"[server] CTXD server listening on {_addr}:{_port}  (Ctrl+C to stop)");
            int id = 0;
            while (true)
            {
                var client = listener.AcceptTcpClient();
                int cid = ++id;
                var t = new Thread(() => Serve(client, cid)) { IsBackground = true, Name = $"client-{cid}" };
                t.Start();
            }
        }

        private static void Serve(TcpClient client, int cid)
        {
            string who = client.Client.RemoteEndPoint?.ToString() ?? "?";
            Console.WriteLine($"[server] client #{cid} connected from {who}");
            try { using (client) new ClientConnection(client, cid).Serve(); }
            catch (Exception ex) { Console.WriteLine($"[server] client #{cid} error: {ex.Message}"); }
            Console.WriteLine($"[server] client #{cid} disconnected");
        }
    }
}
