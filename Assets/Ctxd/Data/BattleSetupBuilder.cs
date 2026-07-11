using System.Collections.Generic;
using Ctxd.Battle.Sim;
using Terrain = Ctxd.Battle.Sim.Terrain;

namespace Ctxd.Data
{
    /// <summary>Bridges authored lineups (<see cref="GeneralDefinition"/>) into a sim <see cref="BattleSetup"/>.</summary>
    public static class BattleSetupBuilder
    {
        public static BattleSetup Build(
            IList<GeneralDefinition> offense, IList<GeneralDefinition> defense,
            Terrain terrain, ulong seed, BattleConfig config = null,
            string offenseNation = "Thục", string defenseNation = "Ngụy")
        {
            var setup = new BattleSetup
            {
                Terrain = terrain, Seed = seed, Config = config ?? new BattleConfig(),
                OffenseNation = offenseNation, DefenseNation = defenseNation,
            };
            AddLineup(setup.OffenseLineup, offense, Faction.Offense);
            AddLineup(setup.DefenseLineup, defense, Faction.Defense);
            return setup;
        }

        private static void AddLineup(List<Combatant> dst, IList<GeneralDefinition> src, Faction faction)
        {
            if (src == null) return;
            for (int i = 0; i < src.Count; i++)
            {
                var g = src[i];
                if (g == null) continue;
                dst.Add(g.ToCombatant(faction, $"{(faction == Faction.Offense ? "off" : "def")}_{i}_{g.Id}"));
            }
        }
    }
}
