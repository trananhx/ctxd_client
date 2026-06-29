using System.Collections.Generic;
using UnityEngine.Pool;

namespace Luzart.Reactive
{
    // Composite: tổng của nhiều INumber con. Subscribe Changed của từng con,
    // khi bất kỳ con nào đổi -> phát Changed của chính mình lên trên.
    public sealed class RuntimeNumber_Sum : RuntimeNumber
    {
        private readonly List<INumber> _elements;

        public RuntimeNumber_Sum(IEnumerable<INumber> elements)
        {
            _elements = ListPool<INumber>.Get(); // mượn list từ pool, trả lại khi Dispose
            _elements.Clear();
            _elements.AddRange(elements);
            foreach (var e in _elements)
                e.Changed += OnElementChanged;
        }

        protected override double DoGetValue()
        {
            double sum = 0;
            foreach (var e in _elements)
                sum += e.Value;
            return sum;
        }

        private void OnElementChanged(INumber _) => InvokeValueChanged();

        protected override void DoDispose()
        {
            base.DoDispose();
            foreach (var e in _elements)
                e.Changed -= OnElementChanged;
            _elements.Clear();
            ListPool<INumber>.Release(_elements);
        }
    }
}
