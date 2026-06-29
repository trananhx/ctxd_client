using System.Collections.Generic;
using System.Text;
using UnityEngine.Pool;

namespace Luzart.Reactive
{
    // Composite: nối nhiều IString con (có separator). Bất kỳ con nào đổi -> phát Changed.
    public sealed class RuntimeString_Concat : RuntimeString
    {
        private readonly List<IString> _elements;
        private readonly string _separator;

        public RuntimeString_Concat(IEnumerable<IString> elements, string separator = "")
        {
            _separator = separator;
            _elements = ListPool<IString>.Get();
            _elements.Clear();
            _elements.AddRange(elements);
            foreach (var e in _elements)
                e.Changed += OnElementChanged;
        }

        protected override string DoGetValue()
        {
            var sb = new StringBuilder();
            for (int i = 0; i < _elements.Count; i++)
            {
                if (i > 0) sb.Append(_separator);
                sb.Append(_elements[i].Value);
            }
            return sb.ToString();
        }

        private void OnElementChanged(IString _) => InvokeValueChanged();

        protected override void DoDispose()
        {
            base.DoDispose();
            foreach (var e in _elements)
                e.Changed -= OnElementChanged;
            _elements.Clear();
            ListPool<IString>.Release(_elements);
        }
    }
}
