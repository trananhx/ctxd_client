namespace Luzart.Reactive
{
    // Mở rộng INumber cho kiểu "tổng hợp động": cho phép THÊM/BỚT các INumber con vào nguồn,
    // dùng khi tập hợp đóng góp thay đổi lúc runtime (vd cộng dồn buff theo thời gian).
    public interface INumberWithContribution : INumber
    {
        void Contribute(INumber subNumber);
        void Uncontribute(INumber subNumber);
    }
}
