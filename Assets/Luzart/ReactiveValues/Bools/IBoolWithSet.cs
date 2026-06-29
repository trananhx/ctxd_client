using System;

namespace Luzart.Reactive
{
    // Mở rộng IBool: cho phép GHI.
    public interface IBoolWithSet : IBool
    {
        void Set(bool value);
    }

    // Container đơn giản cho bool, phát Changed khi đổi.
    public sealed class BoolValue : IBoolWithSet
    {
        private bool _value;
        private event Action<IBool> _onChanged;

        public BoolValue(bool value = false)
        {
            _value = value;
        }

        bool IBool.Value => _value;

        event Action<IBool> IBool.Changed
        {
            add => _onChanged += value;
            remove => _onChanged -= value;
        }

        void IBoolWithSet.Set(bool value)
        {
            if (_value == value) return;
            _value = value;
            _onChanged?.Invoke(this);
        }
    }
}
