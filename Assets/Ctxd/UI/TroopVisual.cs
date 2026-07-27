using UnityEngine;
using Ctxd.Battle.Sim;

namespace Ctxd.UI
{
    /// <summary>Ánh xạ binh chủng → nhãn tiếng Việt + màu, dùng chung cho các màn chọn tướng/HUD.
    /// Không dùng ký tự Hán (font TMP mặc định không có glyph CJK).</summary>
    public static class TroopVisual
    {
        public static string Label(TroopType t) => t switch
        {
            TroopType.KyBinh => "Kỵ Binh",
            TroopType.ThuongBinh => "Thương Binh",
            TroopType.CungBinh => "Cung Binh",
            TroopType.ChienXa => "Chiến Xa",
            TroopType.MuuSi => "Mưu Sĩ",
            _ => t.ToString(),
        };

        public static Color Color(TroopType t) => t switch
        {
            TroopType.KyBinh => new Color(0.86f, 0.42f, 0.28f),     // cam-đỏ (cơ động)
            TroopType.ThuongBinh => new Color(0.36f, 0.56f, 0.86f), // xanh dương (tuyến đầu)
            TroopType.CungBinh => new Color(0.42f, 0.74f, 0.42f),   // xanh lá (tầm xa)
            TroopType.ChienXa => new Color(0.78f, 0.66f, 0.36f),    // vàng nâu (công thành)
            TroopType.MuuSi => new Color(0.72f, 0.48f, 0.86f),      // tím (khống chế)
            _ => UnityEngine.Color.gray,
        };
    }
}
