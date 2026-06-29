using System;

namespace Luzart.Reactive
{
    // Reactive contract cho 1 chuỗi: ĐỌC Value + đăng ký Changed.
    public interface IString
    {
        string Value { get; }
        event Action<IString> Changed;
    }
}
