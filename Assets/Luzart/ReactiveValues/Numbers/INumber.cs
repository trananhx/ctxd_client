using System;

namespace Luzart.Reactive
{
    // Reactive contract cho 1 số: chỉ ĐỌC được Value, và đăng ký Changed để biết khi nào nó đổi.
    public interface INumber
    {
        double Value { get; }
        event Action<INumber> Changed;
    }
}
