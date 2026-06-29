using System;

namespace Luzart.Reactive
{
    // Reactive contract cho 1 bool: ĐỌC Value + đăng ký Changed.
    public interface IBool
    {
        bool Value { get; }
        event Action<IBool> Changed;
    }
}
