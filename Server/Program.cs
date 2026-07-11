using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Sockets;
using System.Threading;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.Server
{
    /// <summary>
    /// CTXD fake server. Modes:
    ///   (default) server   — TcpListener 127.0.0.1:5005, server-authoritative battles.
    ///   selftest           — offline round-trip + in-process session smoke (no socket). Exit 0 = OK.
    ///   client             — connect to a running server and drive a scripted battle (manual e2e check).
    /// </summary>
    public static class Program
    {
        public static int Main(string[] args)
        {
            string mode = args.Length > 0 ? args[0].ToLowerInvariant() : "server";
            switch (mode)
            {
                case "selftest": return SelfTest();
                case "client":   return TestClient();
                default:         new TcpServer().Run(); return 0;
            }
        }

        // ── selftest: proves the shared P0 contract + P1 session work offline ────
        private static int _fail;
        private static void Check(string name, bool ok)
        {
            Console.WriteLine($"  [{(ok ? "ok" : "FAIL")}] {name}");
            if (!ok) _fail++;
        }

        private static int SelfTest()
        {
            Console.WriteLine("== P0 framing + wire round-trip ==");
            using (var ms = new MemoryStream())
            {
                Framing.WriteFrame(ms, Wire.Serialize(Command.TestApi(TestApiKind.KillRow, SideRef.DEF)));
                ms.Position = 0;
                var back = Wire.Deserialize<Command>(Framing.ReadFrame(ms));
                Check("Command.Type==TestApi", back.Type == ClientMsgType.TestApi);
                Check("Command.TestKind==KillRow", back.TestKind == TestApiKind.KillRow);
                Check("Command.Side==DEF", back.Side == SideRef.DEF);
                Check("Command.TargetFaction==Defense", back.TargetFaction == Faction.Defense);
            }
            using (var ms = new MemoryStream())
            {
                var events = new List<BattleEvent>
                {
                    new BattleEvent { Type = BattleEventType.UnitKilled, Exp = 42, Amount = 1234, Count = 1 },
                    new BattleEvent { Type = BattleEventType.SkillCast, TacticName = "Võ Thần Phụ Thể", Awakened = true },
                };
                Framing.WriteFrame(ms, Wire.Serialize(ServerMsg.Batch(events)));
                ms.Position = 0;
                var back = Wire.Deserialize<ServerMsg>(Framing.ReadFrame(ms));
                Check("ServerMsg.Type==Events", back.Type == ServerMsgType.Events);
                Check("Event[0].Exp==42", back.Events[0].Exp == 42);
                Check("Event[0].Type==UnitKilled", back.Events[0].Type == BattleEventType.UnitKilled);
                Check("Event[1].Awakened", back.Events[1].Awakened);
                Check("Event[1].TacticName roundtrips CJK/diacritics", back.Events[1].TacticName == "Võ Thần Phụ Thể");
            }

            Console.WriteLine("== P1 session smoke (server-authoritative, in-process) ==");
            var dto = ScenarioLoader.Load();
            var session = new BattleSession(dto.ToSetup());
            var begin = session.Begin();
            var snap = session.Snapshot();
            Console.WriteLine($"  begin: {begin.Count} events; lineup ATT={snap.Offense.Queue.Count} DEF={snap.Defense.Queue.Count}");
            Check("BattleStart emitted", begin.Count > 0);
            Check("lineups non-empty", snap.Offense.Queue.Count > 0 && snap.Defense.Queue.Count > 0);

            // Phase-1 geometry: formation present, per-group troop types, row-by-row KillRow.
            var off0 = snap.Offense.Queue[0];
            Check("formation built (rows>0)", off0.Formation != null && off0.Formation.Count > 0);
            bool mixed = false;
            if (off0.Formation != null && off0.Formation.Count > 0)
            {
                var t0 = off0.Formation[0].Groups.Count > 0 ? off0.Formation[0].Groups[0].Troop : TroopType.ThuongBinh;
                foreach (var r in off0.Formation) foreach (var g in r.Groups) if (g.Troop != t0) mixed = true;
            }
            int gpr = off0.Formation != null && off0.Formation.Count > 0 ? off0.Formation[0].Groups.Count : 0;
            Console.WriteLine($"  {off0.DisplayName}: rows={off0.Formation?.Count}, groups/row={gpr}, mixedTroopTypes={mixed}");
            Check("offense general has mixed troop types", mixed);

            var defA = session.Snapshot().Defense; var dA = defA.Queue[defA.ActiveIndex];
            int rowsBefore = LivingRows(dA);
            session.TestApi(TestApiKind.KillRow, Faction.Defense);
            var defB = session.Snapshot().Defense; var dB = defB.Queue[defB.ActiveIndex];
            int rowsAfter = LivingRows(dB);
            Console.WriteLine($"  KillRow DEF: livingRows {rowsBefore} -> {rowsAfter}");
            Check("KillRow removes exactly 1 front row", rowsBefore - rowsAfter == 1);

            // Phase 2: deputy (phó tướng) in the lineup + reinforcement = strongest reserve.
            bool hasDeputy = false;
            foreach (var c in snap.Offense.Queue) if (c.DisplayName != null && c.DisplayName.Contains("Phó")) hasDeputy = true;
            Check("offense lineup has a deputy (phó tướng)", hasDeputy);
            int qBefore = session.Snapshot().Offense.Queue.Count;
            session.TestApi(TestApiKind.AddUnit, Faction.Offense);
            var oq = session.Snapshot().Offense.Queue;
            string added = oq.Count > qBefore ? oq[oq.Count - 1].DisplayName : "none";
            Console.WriteLine($"  AddUnit ATT → '{added}' (queue {qBefore}→{oq.Count})");
            Check("reinforcement = strongest reserve (Khương Duy)", added != null && added.Contains("Khương Duy"));

            foreach (TestApiKind k in Enum.GetValues(typeof(TestApiKind)))
                foreach (SideRef s in Enum.GetValues(typeof(SideRef)))
                {
                    var ev = session.TestApi(k, s == SideRef.ATT ? Faction.Offense : Faction.Defense);
                    string types = ev.Count > 0 ? string.Join(",", ev.ConvertAll(e => e.Type.ToString())) : "(none)";
                    Console.WriteLine($"  TEST {k}/{s}: {ev.Count} events  [{types}]");
                    Check($"TEST {k}/{s} produced events", ev.Count > 0);
                }

            for (int i = 0; i < 8 && !session.IsOver; i++)
                session.Step(new TurnInput((Stance)(i % 3), i % 2 == 0));
            Console.WriteLine($"  after stance rounds: round={session.Snapshot().Round}, outcome={session.Outcome}");

            Console.WriteLine(_fail == 0 ? "SELFTEST OK" : $"SELFTEST FAILED ({_fail} checks)");
            return _fail == 0 ? 0 : 1;
        }

        // ── client: scripted end-to-end over the real socket ─────────────────────
        private static int TestClient()
        {
            using var client = new TcpClient();
            client.Connect("127.0.0.1", 5005);
            client.NoDelay = true;
            var stream = client.GetStream();

            var reader = new Thread(() =>
            {
                try
                {
                    while (true)
                    {
                        string json = Framing.ReadFrame(stream);
                        if (json == null) break;
                        PrintMsg(Wire.Deserialize<ServerMsg>(json));
                    }
                }
                catch (Exception ex) { Console.WriteLine($"[client] reader stopped: {ex.Message}"); }
            }) { IsBackground = true };
            reader.Start();

            void Send(Command c) { Framing.WriteFrame(stream, Wire.Serialize(c)); Thread.Sleep(250); }

            Send(Command.JoinBattle());
            Send(Command.StartBattle());   // confirm lobby (default order) → battle begins
            Send(Command.TestApi(TestApiKind.Attack, SideRef.ATT));
            Send(Command.TestApi(TestApiKind.UseSkill, SideRef.ATT));
            Send(Command.TestApi(TestApiKind.KillRow, SideRef.DEF));
            Send(Command.TestApi(TestApiKind.KillRandom, SideRef.DEF));
            Send(Command.TestApi(TestApiKind.AddUnit, SideRef.DEF));
            Send(Command.ChooseStance(Stance.DotKich));
            Send(Command.ChooseStance(Stance.TanCong, awaken: true));
            Thread.Sleep(500);
            Console.WriteLine("[client] done.");
            return 0;
        }

        private static void PrintMsg(ServerMsg msg)
        {
            switch (msg.Type)
            {
                case ServerMsgType.Lobby:
                    Console.WriteLine($"[client] Lobby: {msg.Snapshot.Offense.Queue.Count} generals to arrange");
                    break;
                case ServerMsgType.BattleStart:
                    Console.WriteLine($"[client] BattleStart: {msg.Snapshot.Offense.Nation} vs {msg.Snapshot.Defense.Nation}, " +
                                      $"ATT={msg.Snapshot.Offense.Queue.Count} DEF={msg.Snapshot.Defense.Queue.Count}, +{msg.Events.Count} events");
                    break;
                case ServerMsgType.Events:
                    Console.WriteLine($"[client] Events x{msg.Events.Count}: " + string.Join(", ", msg.Events.ConvertAll(e => e.Type.ToString())));
                    foreach (var e in msg.Events) if (!string.IsNullOrEmpty(e.Text)) Console.WriteLine($"           · {e}");
                    break;
                case ServerMsgType.State:
                    Console.WriteLine($"[client] State: round {msg.Snapshot.Round}, ATT troops={Total(msg.Snapshot.Offense)} DEF troops={Total(msg.Snapshot.Defense)}");
                    break;
                case ServerMsgType.BattleEnd:
                    Console.WriteLine($"[client] BattleEnd: {msg.Outcome}");
                    break;
                case ServerMsgType.Error:
                    Console.WriteLine($"[client] Error: {msg.Text}");
                    break;
            }
        }

        private static int Total(SideSnapshot s) { int t = 0; foreach (var c in s.Queue) t += c.Troops; return t; }

        private static int LivingRows(CombatantSnapshot c)
        {
            if (c?.Formation == null) return 0;
            int n = 0;
            foreach (var r in c.Formation) { bool alive = false; foreach (var g in r.Groups) if (g.Soldiers > 0) alive = true; if (alive) n++; }
            return n;
        }
    }
}
