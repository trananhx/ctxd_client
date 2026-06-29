using System;

namespace Luzart.Reactive
{
    // Lớp nền cho các Number "tính toán" (composite/decorator).
    // Class con chỉ cần override DoGetValue() và gọi InvokeValueChanged() khi nguồn đổi.
    // Cài IDisposable để gỡ subscribe khỏi các Number con (tránh leak).
    public abstract class RuntimeNumber : INumber, IDisposable
    {
        private Action<INumber> _onChanged;

        double INumber.Value => DoGetValue();

        event Action<INumber> INumber.Changed
        {
            add => _onChanged += value;
            remove => _onChanged -= value;
        }

        void IDisposable.Dispose() => DoDispose();

        protected abstract double DoGetValue();

        protected virtual void DoDispose() { }

        protected void InvokeValueChanged() => _onChanged?.Invoke(this);
    }
}
