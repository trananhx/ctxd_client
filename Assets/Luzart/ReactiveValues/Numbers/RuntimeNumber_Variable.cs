namespace Luzart.Reactive
{
    // Biến số có thể Set, nhưng đi qua đường RuntimeNumber (dùng InvokeValueChanged của base).
    // Khác NumberValue ở chỗ nó là RuntimeNumber -> có Dispose, ghép được vào cây composite.
    public sealed class RuntimeNumber_Variable : RuntimeNumber, INumberWithSet
    {
        private double _value;

        public RuntimeNumber_Variable(double value = 0)
        {
            _value = value;
        }

        protected override double DoGetValue() => _value;

        void INumberWithSet.Set(double value)
        {
            if (_value == value) return;
            _value = value;
            InvokeValueChanged();
        }
    }
}
