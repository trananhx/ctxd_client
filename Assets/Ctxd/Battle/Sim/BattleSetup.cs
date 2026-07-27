using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Input describing a battle to resolve. Built from data SOs by the game layer.</summary>
    public sealed class BattleSetup
    {
        public readonly List<Combatant> OffenseLineup = new List<Combatant>();
        public readonly List<Combatant> DefenseLineup = new List<Combatant>();
        // Reserve pools (借兵 Mượn Binh): the server adds the STRONGEST reserve to a side's queue end on demand.
        public readonly List<Combatant> OffenseReserve = new List<Combatant>();
        public readonly List<Combatant> DefenseReserve = new List<Combatant>();
        public Terrain Terrain = Terrain.Plain;
        public ulong Seed = 12345UL;
        public BattleConfig Config = new BattleConfig();
        public string OffenseNation = "", DefenseNation = "";
        public Tower DefenseTower = null;   // [2E] trụ tên phe Thủ (dùng khi Terrain.City & EnableCityTower); null → mặc định từ config.
    }
}
