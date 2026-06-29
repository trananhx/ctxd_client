using System.Globalization;

namespace Luzart.Reactive
{
    // Cầu nối Number -> String: quan sát 1 INumber, format thành chuỗi.
    // Ví dụ hiển thị HP "120/200" hay vàng "1,250" mà tự cập nhật khi số đổi.
    public sealed class RuntimeString_FromNumber : RuntimeString
    {
        private readonly INumber _number;
        private readonly string _format;

        public RuntimeString_FromNumber(INumber number, string format = null)
        {
            _number = number;
            _format = format;
            _number.Changed += OnNumberChanged;
        }

        protected override string DoGetValue()
        {
            return string.IsNullOrEmpty(_format)
                ? _number.Value.ToString(CultureInfo.InvariantCulture)
                : _number.Value.ToString(_format, CultureInfo.InvariantCulture);
        }

        private void OnNumberChanged(INumber _) => InvokeValueChanged();

        protected override void DoDispose()
        {
            base.DoDispose();
            _number.Changed -= OnNumberChanged;
        }
    }
}
