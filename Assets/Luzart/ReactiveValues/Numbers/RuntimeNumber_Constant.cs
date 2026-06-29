namespace Luzart.Reactive
{
    // Số hằng: ôm 1 giá trị bất biến. Không bao giờ phát Changed (vì không đổi),
    // nhưng vẫn là RuntimeNumber nên ghép được vào cây composite như mọi INumber khác.
    public sealed class RuntimeNumber_Constant : RuntimeNumber
    {
        private readonly double _value;

        public RuntimeNumber_Constant(double value)
        {
            _value = value;
        }

        protected override double DoGetValue() => _value;
    }
}
