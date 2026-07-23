using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class SmokeTest
    {
        [Fact]
        public void Sim_Types_Are_Reachable()
        {
            var c = new Combatant { Troops = 5, MaxTroops = 5 };
            Assert.True(c.Alive);
        }
    }
}
