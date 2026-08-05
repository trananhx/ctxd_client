using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

namespace Ctxd.UI
{
    /// <summary>Palette cổ trang dùng chung cho mọi màn (placeholder composite — không texture).</summary>
    public static class CtxdPalette
    {
        public static readonly Color BgDark      = Hex("#141210", 0.95f);
        public static readonly Color PanelFill   = Hex("#1E1A14", 0.96f);
        public static readonly Color PanelBorder = Hex("#8A6B32");
        public static readonly Color BtnBorder   = Hex("#C9A34D");
        public static readonly Color BtnCrimson  = Hex("#7A2E22");
        public static readonly Color BtnBlue     = Hex("#2E4A66");
        public static readonly Color BtnGold     = Hex("#8A6B1F");
        public static readonly Color TxtTitle    = Hex("#FFD25E");
        public static readonly Color TxtBody     = Hex("#D8CBB0");
        public static readonly Color TxtButton   = Hex("#FFE8B0");
        public static readonly Color BarBorder   = Hex("#5A4426");
        public static readonly Color BarSlot     = Hex("#120D0A");
        public static readonly Color HpAlly      = Hex("#37B34A");
        public static readonly Color HpEnemy     = Hex("#C8342B");
        public static readonly Color Morale      = Hex("#E8A020");
        public static readonly Color InkOnPaper  = Hex("#4A2E14");   // chữ trên cuộn giấy Result
        public static readonly Color SkillPop    = Hex("#FF9AD0");   // text thư pháp fallback

        public static Color Hex(string hex, float a = 1f)
        { ColorUtility.TryParseHtmlString(hex, out var c); c.a = a; return c; }
    }

    /// <summary>Tra art rip theo tên logic (qua CtxdSpriteIndex) + các bảng map data→art. Cache sprite đã load.</summary>
    public static class CtxdArt
    {
        static CtxdSpriteIndex _index;
        static readonly Dictionary<string, Sprite> _cache = new Dictionary<string, Sprite>();

        static CtxdSpriteIndex Index => _index != null ? _index : (_index = Resources.Load<CtxdSpriteIndex>("CtxdSpriteIndex"));

        public static Sprite Load(string key)
        {
            if (string.IsNullOrEmpty(key)) return null;
            if (_cache.TryGetValue(key, out var s)) return s;
            Sprite result = null;
            if (Index != null && Index.TryGet(key, out var resPath))
            {
                var all = Resources.LoadAll<Sprite>(resPath);        // kho rip import spriteMode 2 → LoadAll, lấy [0]
                if (all != null && all.Length > 0) result = all[0];
            }
            _cache[key] = result;                                     // cache cả miss — tránh LoadAll lặp
            return result;
        }

        public static Sprite Portrait(string generalId)
        {
            var s = Load($"tacticalGeneralPicMax/{generalId}");
            // Nhiều tướng kho rip chỉ có bản đánh số skin (vd huangyueying1) — thử "<id>1" trước khi bó tay.
            return s != null ? s : Load($"tacticalGeneralPicMax/{generalId}1");
        }
        public static Sprite AngerStar(int level1to6) => Load($"warFeatAnger/featAnger{Mathf.Clamp(level1to6, 1, 6)}");

        // Map màn → phong cảnh warBG (đã xem mắt: 1=đồng cỏ trại lính, 3=hẻm núi rừng, 11=sân thành cờ vàng,
        // silkMap=vịnh nước + trận đồ bát quái — hợp thủy chiến Xích Bích).
        static readonly Dictionary<string, string> StageBgMap = new Dictionary<string, string>
        {
            ["stage_khanhvang"] = "warBG/1", ["stage_fxdemo"] = "warBG/1",
            ["stage_quando"] = "warBG/11", ["stage_bachho"] = "warBG/3",
            ["stage_xichbich"] = "warBG/silkMap",
        };
        public static Sprite StageBg(string stageId, string terrain)
        {
            if (stageId != null && StageBgMap.TryGetValue(stageId, out var k)) return Load(k);
            string fb = terrain switch
            {
                "Mountain" => "warBG/3",
                "Pass" or "City" => "warBG/11",
                "Water" => "warBG/silkMap",
                _ => "warBG/1",
            };
            return Load(fb);
        }

        // FxId server → icon warBuff (đã xem mắt: 1=kiếm+khiên vàng, 60=ngọn lửa cam); lạ → warBuff/1.
        static readonly Dictionary<string, string> FxToBuff = new Dictionary<string, string>
        {
            ["buff"] = "warBuff/1",
            ["fire"] = "warBuff/60",
        };
        public static Sprite BuffIcon(string fxId)
        {
            if (fxId != null && FxToBuff.TryGetValue(fxId, out var k)) { var s = Load(k); if (s != null) return s; }
            return Load("warBuff/1");
        }

        // SkillId roster → ảnh thư pháp warSkillName. RỖNG CÓ CHỦ ĐÍCH: OCR thư pháp không đủ tin cậy;
        // các ảnh đã xác minh bằng mắt (5=Phi Vũ, 6=Mãnh Công, 7=Đột Kích, 10=Thương Lâm Tiễn Vũ) đều
        // KHÔNG trùng chiến pháp roster hiện có → pop chạy nhánh text với TacticName server gửi.
        // Khi xác minh thêm ảnh nào, thêm entry ["<skillId>"] = "warSkillName/<n>" là ăn ngay.
        static readonly Dictionary<string, string> SkillNameMap = new Dictionary<string, string>();
        public static Sprite SkillNamePic(string skillId)
            => (skillId != null && SkillNameMap.TryGetValue(skillId, out var k)) ? Load(k) : null;

        public static string FormatTroops(int cur, int max)
        {
            static string K(int v) => v >= 10000 ? $"{v / 1000f:0.#}k" : v.ToString("n0");
            return $"{K(cur)} / {K(max)}";
        }
    }

    /// <summary>Hiệu ứng vào màn dùng chung (DOTween — có sẵn trong dự án qua Demigiant).</summary>
    public static class CtxdUiFx
    {
        /// <summary>Fade-in màn 0.25s (+ scale-pop panel 0.94→1 nếu truyền).</summary>
        public static void Enter(CanvasGroup cg, RectTransform pop = null)
        {
            if (cg != null) { cg.alpha = 0f; cg.DOKill(); cg.DOFade(1f, 0.25f); }
            if (pop != null) { pop.DOKill(); pop.localScale = Vector3.one * 0.94f; pop.DOScale(1f, 0.25f).SetEase(Ease.OutCubic); }
        }
    }
}
