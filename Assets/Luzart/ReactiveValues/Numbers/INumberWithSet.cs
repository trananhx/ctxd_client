using System;

namespace Luzart.Reactive
{
    // Mở rộng INumber: cho phép GHI. Tách quyền đọc/ghi để nơi nhận chỉ thấy INumber (read-only),
    // còn nơi sở hữu giữ tham chiếu INumberWithSet để Set.
    public interface INumberWithSet : INumber
    {
        void Set(double value);
    }

    // Container đơn giản nhất: ôm 1 giá trị, vừa đọc vừa ghi, phát Changed khi đổi.
    public sealed class NumberValue : INumberWithSet
    {
        private double _value;
        private event Action<INumber> _onChanged;

        public NumberValue(double value = 0)
        {
            _value = value;
        }

        // Explicit interface impl: field thật bị ẩn, chỉ lộ qua interface.
        double INumber.Value => _value;

        event Action<INumber> INumber.Changed
        {
            add => _onChanged += value;
            remove => _onChanged -= value;
        }

        void INumberWithSet.Set(double value)
        {
            if (_value == value) return; // bỏ qua nếu không đổi -> tránh phát event thừa
            _value = value;
            _onChanged?.Invoke(this);
        }
    }
}
