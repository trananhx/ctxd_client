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

    /// <summary>Client → server message kinds. APPEND-ONLY (int values are wire-stable).</summary>
    public enum ClientMsgType { JoinBattle, ChooseStance, TestApi, StartBattle, CopyArmy, ListStages, ListRoster }

    /// <summary>Server → client message kinds. APPEND-ONLY (int values are wire-stable).</summary>
    public enum ServerMsgType { BattleStart, Events, State, BattleEnd, Error, Lobby, Stages, Roster }

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
        public bool Cast;   // RE: bấm hình tướng thả 战法 (cast thủ công) — server chỉ cast khi CanCast/useAble.

        // TestApi
        public TestApiKind TestKind;
        public SideRef Side;

        // JoinBattle
        public string ScenarioId;
        public ulong Seed;   // 0 → server default

        // JoinBattle (campaign flow): chosen offense roster + difficulty tier.
        // OffenseGeneralIds non-empty → server replaces the stage's default offense with these (in this order).
        // Difficulty: 1..5 (Dễ/Thường/Khó/Địa Ngục/Chiến Thần); 0/1 → Thường (no enemy scaling).
        public List<string> OffenseGeneralIds;
        public int Difficulty;

        // StartBattle: chosen offense queue order (permutation of indices); null/empty → keep server order
        public List<int> Order;

        // [2D] CopyArmy (幻影)
        public PhantomKind Phantom;
        public int PhantomCount = 1;

        public static Command JoinBattle(string scenarioId = null, ulong seed = 0)
            => new Command { Type = ClientMsgType.JoinBattle, ScenarioId = scenarioId, Seed = seed };

        /// <summary>Campaign flow: join a chosen stage with a chosen offense roster + difficulty.</summary>
        public static Command JoinStage(string stageId, List<string> offenseGeneralIds, int difficulty = 1, ulong seed = 0)
            => new Command { Type = ClientMsgType.JoinBattle, ScenarioId = stageId, OffenseGeneralIds = offenseGeneralIds, Difficulty = difficulty, Seed = seed };

        public static Command ListStages() => new Command { Type = ClientMsgType.ListStages };
        public static Command ListRoster() => new Command { Type = ClientMsgType.ListRoster };

        public static Command StartBattle(List<int> order = null)
            => new Command { Type = ClientMsgType.StartBattle, Order = order };

        public static Command ChooseStance(Stance stance, bool awaken = false, bool cast = false)
            => new Command { Type = ClientMsgType.ChooseStance, Stance = stance, Awaken = awaken, Cast = cast };

        public static Command TestApi(TestApiKind kind, SideRef side)
            => new Command { Type = ClientMsgType.TestApi, TestKind = kind, Side = side };

        public static Command CopyArmy(PhantomKind kind = PhantomKind.Normal, int count = 1, SideRef side = SideRef.ATT)
            => new Command { Type = ClientMsgType.CopyArmy, Phantom = kind, PhantomCount = count, Side = side };

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
        public List<StageInfo> StageList;    // Stages (campaign stage catalog)
        public List<GeneralSummary> RosterList; // Roster (selectable generals)

        public static ServerMsg Lobby(BattleSnapshot snap)
            => new ServerMsg { Type = ServerMsgType.Lobby, Snapshot = snap };

        public static ServerMsg Stages(List<StageInfo> stages)
            => new ServerMsg { Type = ServerMsgType.Stages, StageList = stages };

        public static ServerMsg Roster(List<GeneralSummary> roster)
            => new ServerMsg { Type = ServerMsgType.Roster, RosterList = roster };

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

    /// <summary>Campaign-stage catalog entry (server → client, for the "Chọn màn" screen). Display metadata only —
    /// the actual battle numbers live in the matching Server/data/{Id}.json scenario.</summary>
    public sealed class StageInfo
    {
        public string Id;               // maps to Server/data/{Id}.json
        public string Name;             // "Trấn Áp Khăn Vàng"
        public string Terrain;          // Plain / Mountain / Forest / Water / City / Pass
        public string DefenseNation;    // enemy nation label ("Khăn Vàng")
        public string Desc;             // one-line flavour
        public int EnemyCount;          // number of defending generals (for the card)
        public bool Locked;             // gated stage (client greys it out)
    }

    /// <summary>One selectable general (server → client, for the "Chọn tướng" screen). Composite Power = Lực chiến (战力),
    /// NOT damage. The real stats stay server-side; the client only shows these for the picker.</summary>
    public sealed class GeneralSummary
    {
        public string Id;
        public string DisplayName;
        public TroopType Troop;         // binh chủng (client maps to colour + label)
        public int Power;               // Lực chiến (战力) — composite stat
        public int Level;               // cấp tướng
        public int Rows;                // số hàng quân
        public string Skill2Name;       // chiến pháp chính (may be null)
    }
}
