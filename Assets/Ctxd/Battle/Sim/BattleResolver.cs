using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Runs a battle to completion with two brains, returning the full event log (PvE / replay / tests).</summary>
    public static class BattleResolver
    {
        public static List<BattleEvent> ResolveAll(BattleSetup setup, IBattleBrain offenseBrain = null, IBattleBrain defenseBrain = null)
        {
            offenseBrain ??= new AutoBrain();
            var runner = new BattleRunner(setup, defenseBrain ?? new AutoBrain());
            var log = new List<BattleEvent>(runner.Begin());
            int safety = (setup.Config?.MaxRounds ?? 80) + 8;
            while (!runner.IsOver && safety-- > 0)
                log.AddRange(runner.StepRound(offenseBrain.Decide(runner.State, Faction.Offense, runner.Rng)));
            return log;
        }

        public static BattleOutcome Quick(BattleSetup setup, IBattleBrain offenseBrain = null, IBattleBrain defenseBrain = null)
        {
            offenseBrain ??= new AutoBrain();
            var runner = new BattleRunner(setup, defenseBrain ?? new AutoBrain());
            runner.Begin();
            int safety = (setup.Config?.MaxRounds ?? 80) + 8;
            while (!runner.IsOver && safety-- > 0)
                runner.StepRound(offenseBrain.Decide(runner.State, Faction.Offense, runner.Rng));
            return runner.Outcome;
        }
    }
}
