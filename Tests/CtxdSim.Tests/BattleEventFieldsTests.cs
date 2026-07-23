using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class BattleEventFieldsTests
    {
        [Fact]
        public void Defaults_Are_NegativeOne_For_Indices()
        {
            var e = new BattleEvent();
            Assert.Equal(-1, e.RowIndex);
            Assert.Equal(-1, e.GroupIndex);
            Assert.Equal(0, e.SoldiersKilled);
        }
    }
}
