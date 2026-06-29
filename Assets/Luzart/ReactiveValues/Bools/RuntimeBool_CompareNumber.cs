using System;

namespace Luzart.Reactive
{
    public enum ComparisonMode
    {
        Equal = 0,
        NotEqual = 1,
        Less = 2,
        LessEqual = 3,
        Greater = 4,
        GreaterEqual = 5,
    }

    public static class ComparisonModeExtensions
    {
        public static bool IsTrue(this ComparisonMode mode, double a, double b)
        {
            return mode switch
            {
                ComparisonMode.Equal => a == b,
                ComparisonMode.NotEqual => a != b,
                ComparisonMode.Less => a < b,
                ComparisonMode.LessEqual => a <= b,
                ComparisonMode.Greater => a > b,
                ComparisonMode.GreaterEqual => a >= b,
                _ => throw new ArgumentOutOfRangeException(nameof(mode), mode, null),
            };
        }
    }

    // Bool dựng từ phép so sánh 2 INumber. Khi 1 trong 2 số đổi -> bool tự phát Changed.
    public sealed class RuntimeBool_CompareNumber : RuntimeBool
    {
        private readonly INumber _left;
        private readonly INumber _right;
        private readonly ComparisonMode _mode;

        public RuntimeBool_CompareNumber(INumber left, ComparisonMode mode, INumber right)
        {
            _left = left;
            _right = right;
            _mode = mode;
            _left.Changed += OnAnyChanged;
            _right.Changed += OnAnyChanged;
        }

        protected override bool DoGetValue() => _mode.IsTrue(_left.Value, _right.Value);

        private void OnAnyChanged(INumber _) => InvokeValueChanged();

        protected override void DoDispose()
        {
            base.DoDispose();
            _left.Changed -= OnAnyChanged;
            _right.Changed -= OnAnyChanged;
        }
    }
}
