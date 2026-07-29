using Xunit;
using Ctxd.Battle.Sim;

namespace Ctxd.Tests
{
    public class RuleModelTests
    {
        [Fact]
        public void Defaults_Are_SingleTarget_FrontRow_Damage()
        {
            var step = new RuleStep();
            Assert.Equal(TargetScope.EnemyActive, step.Select.Scope);
            Assert.Equal(RowMode.FrontRow, step.Select.Rows);
            Assert.Equal(ConditionKind.Always, step.Condition.Kind);
            Assert.Equal(ActionKind.Damage, step.Action.Kind);
            Assert.Equal(Distribution.EvenByHp, step.Action.Dist);
        }

        [Fact]
        public void TacticEffectKind_Wire_Values_Are_Stable()
        {
            // Guard append-only của wire (enum serialize = int): giá trị các member CŨ không bao giờ đổi;
            // member mới chỉ được THÊM VÀO CUỐI (Fire=8 append 2026-07-29 cho FX lửa bền).
            Assert.Equal(7, (int)TacticEffectKind.Rule);
            Assert.Equal(8, (int)TacticEffectKind.Fire);
            var values = System.Enum.GetValues(typeof(TacticEffectKind));
            Assert.Equal(TacticEffectKind.Fire, (TacticEffectKind)values.GetValue(values.Length - 1));
        }

        [Fact]
        public void TroopMask_Roundtrips()
        {
            int mask = TroopMasks.Of(TroopType.CungBinh, TroopType.ChienXa);
            Assert.True(TroopMasks.Has(mask, TroopType.CungBinh));
            Assert.True(TroopMasks.Has(mask, TroopType.ChienXa));
            Assert.False(TroopMasks.Has(mask, TroopType.KyBinh));
        }

        [Fact]
        public void TacticSpec_Can_Hold_A_Program()
        {
            var spec = new TacticSpec { Kind = TacticEffectKind.Rule, Program = new TacticProgram() };
            spec.Program.Steps.Add(new RuleStep());
            Assert.Single(spec.Program.Steps);
        }
    }
}
