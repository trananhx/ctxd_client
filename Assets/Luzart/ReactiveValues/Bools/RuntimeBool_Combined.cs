using System.Collections.Generic;
using UnityEngine.Pool;

namespace Luzart.Reactive
{
    public enum CombineMode
    {
        Any = 0, // OR  - đúng nếu CÓ ÍT NHẤT 1 con đúng
        All = 1, // AND - đúng nếu TẤT CẢ con đều đúng
    }

    // Composite gộp nhiều IBool theo AND/OR. Bất kỳ con nào đổi -> phát Changed.
    public sealed class RuntimeBool_Combined : RuntimeBool
    {
        private readonly CombineMode _mode;
        private readonly List<IBool> _elements;

        public RuntimeBool_Combined(CombineMode mode, IEnumerable<IBool> elements)
        {
            _mode = mode;
            _elements = ListPool<IBool>.Get();
            _elements.Clear();
            _elements.AddRange(elements);
            foreach (var e in _elements)
                e.Changed += OnElementChanged;
        }

        protected override bool DoGetValue()
        {
            return _mode == CombineMode.All ? IsAll() : IsAny();
        }

        private bool IsAny()
        {
            foreach (var e in _elements)
                if (e.Value) return true;
            return false;
        }

        private bool IsAll()
        {
            foreach (var e in _elements)
                if (!e.Value) return false;
            return true;
        }

        private void OnElementChanged(IBool _) => InvokeValueChanged();

        protected override void DoDispose()
        {
            base.DoDispose();
            foreach (var e in _elements)
                e.Changed -= OnElementChanged;
            _elements.Clear();
            ListPool<IBool>.Release(_elements);
        }
    }
}
