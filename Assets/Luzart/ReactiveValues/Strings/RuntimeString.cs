using System;

namespace Luzart.Reactive
{
    // Lớp nền cho các String "tính toán" (composite/decorator).
    public abstract class RuntimeString : IString, IDisposable
    {
        private Action<IString> _onChanged;

        string IString.Value => DoGetValue();

        event Action<IString> IString.Changed
        {
            add => _onChanged += value;
            remove => _onChanged -= value;
        }

        void IDisposable.Dispose() => DoDispose();

        protected abstract string DoGetValue();

        protected virtual void DoDispose() { }

        protected void InvokeValueChanged() => _onChanged?.Invoke(this);
    }
}
