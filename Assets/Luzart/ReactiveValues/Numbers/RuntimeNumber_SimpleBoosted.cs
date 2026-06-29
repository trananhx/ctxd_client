using System;

namespace Luzart.Reactive
{
    // Công thức quen thuộc trong game stat: ((base + add) * multiply) ^ pow.
    // Cache _value và chỉ phát Changed khi kết quả thực sự khác -> chống event dội.
    public sealed class RuntimeNumber_SimpleBoosted : RuntimeNumber
    {
        private readonly INumber _base;
        private readonly INumber _add;
        private readonly INumber _multiply;
        private readonly INumber _pow;
        private double _value;

        public RuntimeNumber_SimpleBoosted(
            INumber baseNumber,
            INumber addNumber = null,
            INumber multiplyNumber = null,
            INumber powNumber = null)
        {
            _base = baseNumber;
            _add = addNumber ?? new NumberValue(0);      // mặc định cộng 0
            _multiply = multiplyNumber ?? new NumberValue(1); // mặc định nhân 1
            _pow = powNumber ?? new NumberValue(1);       // mặc định mũ 1

            _base.Changed += OnAnyChanged;
            _add.Changed += OnAnyChanged;
            _multiply.Changed += OnAnyChanged;
            _pow.Changed += OnAnyChanged;
        }

        protected override double DoGetValue()
        {
            Recalculate();
            return _value;
        }

        private void OnAnyChanged(INumber _) => Recalculate();

        private void Recalculate()
        {
            double next = Math.Pow((_base.Value + _add.Value) * _multiply.Value, _pow.Value);
            if (next == _value) return;
            _value = next;
            InvokeValueChanged();
        }

        protected override void DoDispose()
        {
            base.DoDispose();
            _base.Changed -= OnAnyChanged;
            _add.Changed -= OnAnyChanged;
            _multiply.Changed -= OnAnyChanged;
            _pow.Changed -= OnAnyChanged;
        }
    }
}
