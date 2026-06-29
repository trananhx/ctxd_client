using System;

namespace Luzart.Reactive
{
    // Mở rộng IString: cho phép GHI.
    public interface IStringWithSet : IString
    {
        void Set(string value);
    }

    // Container đơn giản cho chuỗi, phát Changed khi đổi.
    public sealed class StringValue : IStringWithSet
    {
        private string _value;
        private event Action<IString> _onChanged;

        public StringValue(string value = "")
        {
            _value = value;
        }

        string IString.Value => _value;

        event Action<IString> IString.Changed
        {
            add => _onChanged += value;
            remove => _onChanged -= value;
        }

        void IStringWithSet.Set(string value)
        {
            if (_value == value) return; // string == so sánh nội dung -> an toàn
            _value = value;
            _onChanged?.Invoke(this);
        }
    }
}
