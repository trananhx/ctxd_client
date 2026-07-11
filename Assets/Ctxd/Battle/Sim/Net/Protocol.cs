using System.Collections.Generic;

namespace Ctxd.Battle.Sim.Net
{
    // ─────────────────────────────────────────────────────────────────────────
    //  Wire protocol shared by the Unity client and the C# TCP server.
    //  Single-envelope design (a Type discriminator + optional payload fields)
    //  so every message stays a plain POCO — no Newtonsoft TypeNameHandling,
    //  which is fragile across the Unity ↔ .NET assembly boundary.
    //  Framing: [4-byte little-endian length][UTF8 JSON]  (see Framing.cs).
    // ─────────────────────────────────────────────────────────────────────────

    /// <summary>Client → server message kinds.</summary>
    public enum ClientMsgType { JoinBattle, ChooseStance, TestApi, StartBattle }

    /// <summary>Server → client message kinds.</summary>
    public enum ServerMsgType { BattleStart, Events, State, BattleEnd, Error, Lobby }

    /// <summary>The 5 TEST-API actions; ×2 sides = the 10 buttons on the "API CHIẾN ĐẤU (TEST)" panel.</summary>
    public enum TestApiKind { KillRow, KillRandom, UseSkill, AddUnit, Attack }

    /// <summary>Which side a command targets. ATT = Offense (攻/Công, blue), DEF = Defense (防/Thủ, red).</summary>
    public enum SideRef { ATT, DEF }

    /// <summary>One client → server command.</summary>
    public sealed class Command
    {
        public ClientMsgType Type;

        // ChooseStance
        public Stance Stance;
        public bool Awaken;

        // TestApi
        public TestApiKind TestKind;
        public SideRef Side;

        // JoinBattle
        public string ScenarioId;
        public ulong Seed;   // 0 → server default

        // StartBattle: chosen offense queue order (permutation of indices); null/empty → keep server order
        public List<int> Order;

        public static Command JoinBattle(string scenarioId = null, ulong seed = 0)
            => new Command { Type = ClientMsgType.JoinBattle, ScenarioId = scenarioId, Seed = seed };

        public static Command StartBattle(List<int> order = null)
            => new Command { Type = ClientMsgType.StartBattle, Order = order };

        public static Command ChooseStance(Stance stance, bool awaken = false)
            => new Command { Type = ClientMsgType.ChooseStance, Stance = stance, Awaken = awaken };

        public static Command TestApi(TestApiKind kind, SideRef side)
            => new Command { Type = ClientMsgType.TestApi, TestKind = kind, Side = side };

        public Faction TargetFaction => Side == SideRef.ATT ? Faction.Offense : Faction.Defense;
    }

    /// <summary>One server → client message.</summary>
    public sealed class ServerMsg
    {
        public ServerMsgType Type;
        public BattleSnapshot Snapshot;      // BattleStart / State
        public List<BattleEvent> Events;     // BattleStart / Events
        public BattleOutcome Outcome;        // BattleEnd
        public string Text;                  // Error

        public static ServerMsg Lobby(BattleSnapshot snap)
            => new ServerMsg { Type = ServerMsgType.Lobby, Snapshot = snap };

        public static ServerMsg BattleStart(BattleSnapshot snap, List<BattleEvent> events)
            => new ServerMsg { Type = ServerMsgType.BattleStart, Snapshot = snap, Events = events };

        public static ServerMsg Batch(List<BattleEvent> events)
            => new ServerMsg { Type = ServerMsgType.Events, Events = events };

        public static ServerMsg StateMsg(BattleSnapshot snap)
            => new ServerMsg { Type = ServerMsgType.State, Snapshot = snap };

        public static ServerMsg End(BattleOutcome outcome)
            => new ServerMsg { Type = ServerMsgType.BattleEnd, Outcome = outcome };

        public static ServerMsg Error(string text)
            => new ServerMsg { Type = ServerMsgType.Error, Text = text };
    }
}
