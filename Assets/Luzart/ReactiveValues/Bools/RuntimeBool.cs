using System;

namespace Luzart.Reactive
{
    // Lớp nền cho các Bool "tính toán" (composite/decorator).
    public abstract class RuntimeBool : IBool, IDisposable
    {
        private Action<IBool> _onChanged;

        bool IBool.Value => DoGetValue();

        event Action<IBool> IBool.Changed
        {
            add => _onChanged += value;
            remove => _onChanged -= value;
        }

        void IDisposable.Dispose() => DoDispose();

        protected abstract bool DoGetValue();

        protected virtual void DoDispose() { }

        protected void InvokeValueChanged() => _onChanged?.Invoke(this);
    }
}
