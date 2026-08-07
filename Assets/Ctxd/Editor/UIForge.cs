using System.Collections.Generic;
using System.Reflection;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Luzart;
using Ctxd.UI;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.EditorTools
{
    /// <summary>
    /// Bakes the LuzartUI prefabs (BattleHud + the 10-button "API CHIẾN ĐẤU (TEST)" panel) with EVERY child
    /// reference auto-wired in the Editor (via reflection on the private serialized fields), plus a UIRegistrySO.
    /// The runtime UI code never does Find/GetComponent — it uses these wired refs.
    /// </summary>
    public static class UIForge
    {
        const string UiDir = "Assets/Ctxd/Generated/UI";
        const string RegPath = UiDir + "/CtxdUIRegistry.asset";
        const string HudPath = UiDir + "/BattleHudUI.prefab";
        const string PanelPath = UiDir + "/TestApiPanelUI.prefab";
        const string LineupPath = UiDir + "/LineupUI.prefab";
        const string LobbyPath = UiDir + "/LobbyUI.prefab";
        const string SelGenPath = UiDir + "/SelectGeneralUI.prefab";
        const string SelStagePath = UiDir + "/SelectStageUI.prefab";
        const string ResultPath = UiDir + "/ResultUI.prefab";

        public static UIRegistrySO BuildAll()
        {
            Folder(UiDir);
            var hud = BuildHud();
            var panel = BuildPanel();
            var lineup = BuildLineup();
            var lobby = BuildLobby();
            var selGen = BuildSelectGeneral();
            var selStage = BuildSelectStage();
            var result = BuildResult();
            var reg = BuildRegistry(hud, panel, lineup, lobby, selGen, selStage, result);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            Debug.Log("[UIForge] Built HUD + TestPanel + Lineup + Lobby + SelectGeneral + SelectStage + Result prefabs + UIRegistry (refs auto-wired).");
            return reg;
        }

        // ── TEST panel (10 buttons) ──────────────────────────────────────────────
        static GameObject BuildPanel()
        {
            var root = UIRoot("TestApiPanelUI");
            var rt = (RectTransform)root.transform;
            rt.anchorMin = new Vector2(1, 1); rt.anchorMax = new Vector2(1, 1); rt.pivot = new Vector2(1, 1);
            // Gọn dưới cụm HUD phải (tránh đè avatar/sao nộ/buff mới).
            rt.anchoredPosition = new Vector2(-12, -240); rt.sizeDelta = new Vector2(300, 470);
            var bg = root.AddComponent<Image>(); bg.color = CtxdPalette.PanelBorder;
            var bgFill = NewRect("Fill", rt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            bgFill.offsetMin = new Vector2(2, 2); bgFill.offsetMax = new Vector2(-2, -2);
            var bgFillImg = bgFill.gameObject.AddComponent<Image>(); bgFillImg.color = new Color(0f, 0f, 0f, 0.62f); bgFillImg.raycastTarget = false;
            var ui = root.AddComponent<TestApiPanelUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -22), new Vector2(290, 32), 18, "API CHIẾN ĐẤU (TEST)", CtxdPalette.TxtTitle);

            var defs = new (string label, TestApiKind kind, SideRef side)[]
            {
                ("Kill hàng 1 — DEF", TestApiKind.KillRow, SideRef.DEF),
                ("Kill hàng 1 — ATT", TestApiKind.KillRow, SideRef.ATT),
                ("Kill ngẫu nhiên — DEF", TestApiKind.KillRandom, SideRef.DEF),
                ("Kill ngẫu nhiên — ATT", TestApiKind.KillRandom, SideRef.ATT),
                ("Dùng skill — DEF", TestApiKind.UseSkill, SideRef.DEF),
                ("Dùng skill — ATT", TestApiKind.UseSkill, SideRef.ATT),
                ("Thêm đơn vị — DEF", TestApiKind.AddUnit, SideRef.DEF),
                ("Thêm đơn vị — ATT", TestApiKind.AddUnit, SideRef.ATT),
                ("Tấn công — DEF", TestApiKind.Attack, SideRef.DEF),
                ("Tấn công — ATT", TestApiKind.Attack, SideRef.ATT),
            };
            var arr = new TestApiPanelUI.ApiButton[defs.Length];
            float y = -56;
            for (int i = 0; i < defs.Length; i++)
            {
                var d = defs[i];
                Color c = d.side == SideRef.ATT ? CtxdPalette.BtnBlue : CtxdPalette.BtnCrimson;
                var btn = Button(rt, d.label, new Vector2(0.5f, 1f), new Vector2(0, y), new Vector2(280, 36), c, 15);
                arr[i] = new TestApiPanelUI.ApiButton { button = btn, kind = d.kind, side = d.side };
                y -= 40;
            }
            SetField(ui, "_buttons", arr);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, PanelPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        // ── battle HUD ───────────────────────────────────────────────────────────
        static GameObject BuildHud()
        {
            var root = UIRoot("BattleHudUI");
            var rt = (RectTransform)root.transform;
            Stretch(rt);
            var ui = root.AddComponent<BattleHudUI>();

            // Cụm tướng mỗi góc: khung avatar (chân dung rip gán runtime theo DefId) + tên + máu/số quân + 6 sao nộ + dãy buff.
            var offC = BuildGeneralCorner(rt, ui, left: true);
            var defC = BuildGeneralCorner(rt, ui, left: false);

            // Banner ribbon (center-top): nền đen mờ + 2 kẻ vàng, CanvasGroup fade.
            var bannerGo = NewRect("Banner", rt, new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0, -150), new Vector2(900, 60));
            var bannerGroup = bannerGo.gameObject.AddComponent<CanvasGroup>();
            var bBg = NewRect("BannerBg", bannerGo, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            var bBgImg = bBg.gameObject.AddComponent<Image>(); bBgImg.color = new Color(0f, 0f, 0f, 0.55f); bBgImg.raycastTarget = false;
            var lineT = NewRect("LineT", bannerGo, new Vector2(0, 1), new Vector2(1, 1), new Vector2(0.5f, 1f), Vector2.zero, new Vector2(0, 2));
            lineT.gameObject.AddComponent<Image>().color = CtxdPalette.BtnBorder;
            var lineB = NewRect("LineB", bannerGo, new Vector2(0, 0), new Vector2(1, 0), new Vector2(0.5f, 0f), Vector2.zero, new Vector2(0, 2));
            lineB.gameObject.AddComponent<Image>().color = CtxdPalette.BtnBorder;
            var bTxtRt = NewRect("BannerTxt", bannerGo, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            var banner = bTxtRt.gameObject.AddComponent<TextMeshProUGUI>();
            StyleText(banner, 34, new Color(1f, 0.95f, 0.7f), TextAlignmentOptions.Center);

            // Pop tên chiến pháp (giữa màn, hơi cao): ảnh thư pháp map được → ảnh; không → text thư pháp hồng.
            var popRt = NewRect("SkillPop", rt, new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0, 60), new Vector2(620, 150));
            var popGroup = popRt.gameObject.AddComponent<CanvasGroup>();
            popGroup.blocksRaycasts = false; popGroup.interactable = false;
            var popPicRt = NewRect("Pic", popRt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            var popPic = popPicRt.gameObject.AddComponent<Image>(); popPic.raycastTarget = false; popPic.enabled = false;
            var popTxt = Text("Txt", popRt, new Vector2(0.5f, 0.5f), Vector2.zero, new Vector2(620, 150), 60, "", CtxdPalette.SkillPop);
            var ptRt = (RectTransform)popTxt.transform; ptRt.anchorMin = Vector2.zero; ptRt.anchorMax = Vector2.one; ptRt.offsetMin = Vector2.zero; ptRt.offsetMax = Vector2.zero;

            // Stance wheel (bottom-center): 4 buttons.
            var dot = Button(rt, "Đột Kích", new Vector2(0.5f, 0), new Vector2(0, 150), new Vector2(150, 56), CtxdPalette.BtnGold);
            var def = Button(rt, "Phòng Thủ", new Vector2(0.5f, 0), new Vector2(-180, 90), new Vector2(150, 56), CtxdPalette.BtnBlue);
            var atk = Button(rt, "Tấn Công", new Vector2(0.5f, 0), new Vector2(180, 90), new Vector2(150, 56), CtxdPalette.BtnCrimson);
            var giac = Button(rt, "GIÁC", new Vector2(0.5f, 0), new Vector2(0, 80), new Vector2(110, 56), CtxdPalette.BtnGold);

            SetField(ui, "_offName", offC.name); SetField(ui, "_defName", defC.name);
            SetField(ui, "_offHp", offC.hp); SetField(ui, "_defHp", defC.hp);
            // _offSegRow/_defSegRow/_segTemplate KHÔNG wire — SetSegmentBar tự skip (đốt chỉ ở thanh world).
            SetField(ui, "_offTroops", offC.troops); SetField(ui, "_defTroops", defC.troops);
            SetField(ui, "_offPortrait", offC.portrait); SetField(ui, "_defPortrait", defC.portrait);
            SetField(ui, "_offStars", offC.stars); SetField(ui, "_defStars", defC.stars);
            SetField(ui, "_offBuffRow", offC.buffRow); SetField(ui, "_defBuffRow", defC.buffRow);
            SetField(ui, "_buffTemplate", offC.buffTemplate);
            SetField(ui, "_banner", banner); SetField(ui, "_bannerGroup", bannerGroup);
            SetField(ui, "_skillPopGroup", popGroup); SetField(ui, "_skillPopImage", popPic); SetField(ui, "_skillPopText", popTxt);
            SetField(ui, "_dotKich", dot); SetField(ui, "_tanCong", atk); SetField(ui, "_phongThu", def); SetField(ui, "_giac", giac);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, HudPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        struct GeneralCorner
        {
            public TextMeshProUGUI name, troops;
            public Image hp, portrait;
            public Image[] stars;
            public RectTransform buffRow;
            public GameObject buffTemplate;   // chỉ phe trái tạo template (dùng chung)
        }

        /// <summary>Cụm HUD 1 tướng: khung avatar 96×96 + tên + BarLabeled máu + 6 sao nộ + hàng buff. Phe phải đối xứng.</summary>
        static GeneralCorner BuildGeneralCorner(RectTransform rt, BattleHudUI ui, bool left)
        {
            string p = left ? "Off" : "Def";
            float sx = left ? 1f : -1f;
            Vector2 anchor = left ? new Vector2(0, 1) : new Vector2(1, 1);
            var c = new GeneralCorner();

            // Khung avatar: viền vàng đồng, nền tối; chân dung inset 4 (ảnh rip nền trong suốt).
            var frame = Frame(p + "Avatar", rt, anchor, anchor, anchor, new Vector2(sx * 24, -24), new Vector2(96, 96), CtxdPalette.BtnBorder, CtxdPalette.BarSlot);
            var portRt = NewRect("Portrait", frame, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            portRt.offsetMin = new Vector2(4, 4); portRt.offsetMax = new Vector2(-4, -4);
            portRt.gameObject.AddComponent<RectMask2D>();
            var portImgRt = NewRect("Img", portRt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            c.portrait = portImgRt.gameObject.AddComponent<Image>(); c.portrait.raycastTarget = false; c.portrait.enabled = false;

            c.name = Text(p + "Name", rt, anchor, new Vector2(sx * 132, -30), new Vector2(250, 34), 22, "—",
                left ? new Color(0.7f, 0.85f, 1f) : new Color(1f, 0.7f, 0.7f), left ? TextAlignmentOptions.Left : TextAlignmentOptions.Right);
            ((RectTransform)c.name.transform).pivot = new Vector2(left ? 0f : 1f, 0.5f);

            // Thanh máu HUD: FILL LIỀN (chỉ đạo 2026-08-07 — ĐỐT chỉ dùng cho thanh world trên chiến trường).
            c.hp = BarLabeled(p + "Hp", rt, anchor, new Vector2(sx * 132, -62), new Vector2(240, 20),
                left ? CtxdPalette.HpAlly : CtxdPalette.HpEnemy, out c.troops, "—");

            // 6 sao nộ (sprite featAnger gán runtime — SetStars).
            c.stars = new Image[6];
            for (int i = 0; i < 6; i++)
            {
                var sRt = NewRect(p + "Star" + i, rt, anchor, anchor, new Vector2(0.5f, 0.5f), new Vector2(sx * (132 + 13 + i * 27), -94), new Vector2(24, 24));
                c.stars[i] = sRt.gameObject.AddComponent<Image>();
                c.stars[i].raycastTarget = false; c.stars[i].enabled = false;
                c.stars[i].color = new Color(1f, 1f, 1f, 0.28f);
            }

            // Hàng buff: layout ngang, template icon 40×40 + badge số hiệp.
            c.buffRow = NewRect(p + "Buffs", rt, anchor, anchor, anchor, new Vector2(sx * 24, -128), new Vector2(420, 44));
            var lay = c.buffRow.gameObject.AddComponent<HorizontalLayoutGroup>();
            lay.spacing = 6; lay.childControlWidth = false; lay.childControlHeight = false;
            lay.childForceExpandWidth = false; lay.childForceExpandHeight = false;
            lay.childAlignment = left ? TextAnchor.UpperLeft : TextAnchor.UpperRight;
            if (left)
            {
                var tmpl = NewRect("BuffIcon", c.buffRow, new Vector2(0, 1), new Vector2(0, 1), new Vector2(0, 1), Vector2.zero, new Vector2(40, 40));
                var timg = tmpl.gameObject.AddComponent<Image>(); timg.raycastTarget = false;
                var badge = Text("N", tmpl, new Vector2(1, 0), new Vector2(-2, 8), new Vector2(22, 16), 14, "", CtxdPalette.TxtTitle);
                ((RectTransform)badge.transform).pivot = new Vector2(1f, 0f);
                tmpl.gameObject.SetActive(false);
                c.buffTemplate = tmpl.gameObject;
            }
            return c;
        }

        // ── registry ─────────────────────────────────────────────────────────────
        static UIRegistrySO BuildRegistry(GameObject hud, GameObject panel, GameObject lineup,
            GameObject lobby, GameObject selGen, GameObject selStage, GameObject result)
        {
            var reg = LoadOrCreate<UIRegistrySO>(RegPath);
            UIConfig Screen(UIId id, GameObject go) => new UIConfig { Id = id, AssetRef = go, Lane = UILayer.Screen, CachePolicy = UICachePolicy.KeepLoaded, DismissByEscape = false, PausableWhenOverlaid = false };
            UIConfig Hud(UIId id, GameObject go) => new UIConfig { Id = id, AssetRef = go, Lane = UILayer.Hud, CachePolicy = UICachePolicy.KeepLoaded, DismissByEscape = false, PausableWhenOverlaid = false };
            var entries = new List<UIConfig>
            {
                Screen(UIId.MainMenu, lineup),          // legacy pre-battle lineup (không dùng trong flow mới)
                Screen(UIId.Lobby, lobby),
                Screen(UIId.SelectGeneral, selGen),
                Screen(UIId.SelectStage, selStage),
                Screen(UIId.Result, result),
                Hud(UIId.TestApiPanel, panel),
                Hud(UIId.BattleHud, hud),
            };
            typeof(UIRegistrySO).GetField("entries", BindingFlags.NonPublic | BindingFlags.Instance).SetValue(reg, entries);
            EditorUtility.SetDirty(reg);
            return reg;
        }

        // ── pre-battle lineup (6 fixed reorderable slots) ────────────────────────
        static GameObject BuildLineup()
        {
            var root = UIRoot("LineupUI");
            var rt = (RectTransform)root.transform;
            rt.anchorMin = new Vector2(0.5f, 0.5f); rt.anchorMax = new Vector2(0.5f, 0.5f); rt.pivot = new Vector2(0.5f, 0.5f);
            rt.anchoredPosition = Vector2.zero; rt.sizeDelta = new Vector2(640, 760);
            var bg = root.AddComponent<Image>(); bg.color = CtxdPalette.PanelFill; bg.sprite = Builtin(); bg.type = Image.Type.Sliced;
            var ui = root.AddComponent<LineupUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -44), new Vector2(600, 50), 30, "BÀY BINH BỐ TRẬN", CtxdPalette.TxtTitle);
            Text("Sub", rt, new Vector2(0.5f, 1f), new Vector2(0, -84), new Vector2(600, 30), 18, "Chọn & sắp xếp thứ tự xuất chiến (▲▼)", CtxdPalette.TxtBody);

            const int slotCount = 6;
            var slots = new LineupUI.Slot[slotCount];
            float y = -130;
            for (int i = 0; i < slotCount; i++)
            {
                var rowRt = Frame($"Slot{i}", rt, new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0.5f, 0.5f), new Vector2(0, y), new Vector2(580, 66));
                var label = Text($"Name{i}", rowRt, new Vector2(0, 0.5f), Vector2.zero, new Vector2(380, 50), 22, "—", Color.white, TextAlignmentOptions.Left);
                var lrt = (RectTransform)label.transform; lrt.anchorMin = Vector2.zero; lrt.anchorMax = Vector2.one; lrt.offsetMin = new Vector2(24, 0); lrt.offsetMax = new Vector2(-140, 0);
                var up = Button(rowRt, "▲", new Vector2(1, 0.5f), new Vector2(-96, 0), new Vector2(56, 52), CtxdPalette.BtnBlue);
                var down = Button(rowRt, "▼", new Vector2(1, 0.5f), new Vector2(-34, 0), new Vector2(56, 52), CtxdPalette.BtnBlue);
                slots[i] = new LineupUI.Slot { root = rowRt.gameObject, label = label, up = up, down = down };
                y -= 72;
            }
            var confirm = Button(rt, "VÀO TRẬN", new Vector2(0.5f, 0f), new Vector2(0, 44), new Vector2(300, 66), CtxdPalette.BtnCrimson);

            SetField(ui, "_slots", slots);
            SetField(ui, "_confirm", confirm);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, LineupPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        // ── Lobby (sảnh chính) ────────────────────────────────────────────────────
        static GameObject BuildLobby()
        {
            var root = UIRoot("LobbyUI");
            var rt = (RectTransform)root.transform; Stretch(rt);
            FullBg(root, CtxdPalette.BgDark);
            var ui = root.AddComponent<LobbyUI>();
            var lobbyCg = root.AddComponent<CanvasGroup>();

            // Hero banner: tranh thủy mặc kỵ binh rip (eff/Recruit/1) trải ngang đỉnh màn.
            var heroRt = NewRect("Hero", rt, new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0, -30), new Vector2(900, 250));
            var hero = heroRt.gameObject.AddComponent<Image>();
            hero.sprite = SkinIndexForge.FindSprite("eff/Recruit", "1");
            hero.preserveAspect = true; hero.raycastTarget = false;
            hero.enabled = hero.sprite != null;

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -300), new Vector2(1400, 80), 56, "CÔNG THÀNH XƯNG ĐẾ", CtxdPalette.TxtTitle);
            Text("Sub", rt, new Vector2(0.5f, 1f), new Vector2(0, -358), new Vector2(1200, 40), 26, "Chiến thuật Tam Quốc theo lượt", CtxdPalette.TxtBody);

            var header = Panel("Header", rt, new Vector2(0, 1), new Vector2(0, 1), new Vector2(0, 1), new Vector2(40, -40), new Vector2(640, 150), CtxdPalette.PanelFill);
            // Chân dung Lưu Bị (chúa công phe Thục) trang trí góc header.
            var faceRt = NewRect("Face", header, new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(10, 0), new Vector2(120, 132));
            var face = faceRt.gameObject.AddComponent<Image>();
            face.sprite = SkinIndexForge.FindSprite("tacticalGeneralPicMax", "liubei");
            face.preserveAspect = true; face.raycastTarget = false;
            face.enabled = face.sprite != null;
            var pName = TextIn("PName", header, new Vector2(150, 86), new Vector2(-24, -16), 34, "Chủ Công", Color.white, TextAlignmentOptions.Left);
            var pLevel = TextIn("PLevel", header, new Vector2(150, 46), new Vector2(-24, -62), 24, "Chủ Công Lv.1", new Color(1f, 0.85f, 0.5f), TextAlignmentOptions.Left);
            var pRes = TextIn("PRes", header, new Vector2(150, 10), new Vector2(-24, -104), 20, "—", new Color(0.8f, 0.86f, 0.8f), TextAlignmentOptions.Left);

            var campaign = Button(rt, "XUẤT CHINH", new Vector2(0.5f, 0.5f), new Vector2(0, 40), new Vector2(440, 100), CtxdPalette.BtnCrimson, 26);
            var formation = Button(rt, "ĐỘI HÌNH", new Vector2(0.5f, 0.5f), new Vector2(0, -84), new Vector2(360, 78), CtxdPalette.BtnBlue, 22);

            var stubDefs = new[] { "Chủ Thành", "Trang Bị", "Bản Đồ", "Cửa Hàng" };
            var stubs = new Button[stubDefs.Length];
            float sx = -570;
            for (int i = 0; i < stubDefs.Length; i++) { stubs[i] = Button(rt, stubDefs[i], new Vector2(0.5f, 0f), new Vector2(sx, 90), new Vector2(340, 68), CtxdPalette.BtnBlue); sx += 380; }

            SetField(ui, "_playerName", pName); SetField(ui, "_level", pLevel); SetField(ui, "_resources", pRes);
            SetField(ui, "_btnCampaign", campaign); SetField(ui, "_btnFormation", formation); SetField(ui, "_stubButtons", stubs);
            SetField(ui, "_screenGroup", lobbyCg);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, LobbyPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        // ── SelectGeneral (chọn tướng / đội hình) ─────────────────────────────────
        static GameObject BuildSelectGeneral()
        {
            var root = UIRoot("SelectGeneralUI");
            var rt = (RectTransform)root.transform; Stretch(rt);
            FullBg(root, CtxdPalette.BgDark);
            var ui = root.AddComponent<SelectGeneralUI>();
            var selGenCg = root.AddComponent<CanvasGroup>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -56), new Vector2(1400, 60), 40, "CHỌN TƯỚNG — BÀY BINH BỐ TRẬN", CtxdPalette.TxtTitle);
            var hint = Text("Hint", rt, new Vector2(0.5f, 1f), new Vector2(0, -104), new Vector2(1200, 34), 22, "Đã chọn 0/5 tướng", CtxdPalette.TxtBody);

            const int cardCount = 8;
            var cards = new SelectGeneralUI.Card[cardCount];
            float cardW = 440, cardH = 128, gapX = 24, gapY = 20, gridLeft = 120, gridTop = -180;
            for (int i = 0; i < cardCount; i++)
            {
                int col = i % 2, row = i / 2;
                cards[i] = BuildGeneralCard(rt, i, new Vector2(0, 1), new Vector2(gridLeft + col * (cardW + gapX), gridTop - row * (cardH + gapY)), new Vector2(cardW, cardH));
            }

            const int slotCount = 5;
            var slots = new SelectGeneralUI.Slot[slotCount];
            float slotW = 560, slotH = 92, slotGap = 16, slotRight = -80, slotTop = -200;
            Text("LineupTitle", rt, new Vector2(1, 1), new Vector2(slotRight - slotW / 2, -150), new Vector2(slotW, 40), 26, "ĐỘI HÌNH XUẤT CHIẾN (1→5)", CtxdPalette.TxtTitle);
            for (int i = 0; i < slotCount; i++)
                slots[i] = BuildLineupSlot(rt, i, new Vector2(1, 1), new Vector2(slotRight, slotTop - i * (slotH + slotGap)), new Vector2(slotW, slotH));

            var confirm = Button(rt, "TIẾP TỤC", new Vector2(1, 0), new Vector2(-220, 70), new Vector2(360, 80), CtxdPalette.BtnGold, 24);
            var back = Button(rt, "QUAY LẠI", new Vector2(0, 0), new Vector2(200, 70), new Vector2(300, 70), CtxdPalette.BtnBlue);

            SetField(ui, "_cards", cards); SetField(ui, "_slots", slots);
            SetField(ui, "_confirm", confirm); SetField(ui, "_back", back); SetField(ui, "_hint", hint);
            SetField(ui, "_screenGroup", selGenCg);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, SelGenPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        static SelectGeneralUI.Card BuildGeneralCard(Transform parent, int i, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var cardRt = Frame($"Card{i}", parent, anchor, anchor, new Vector2(0, 1), pos, size);
            var btn = AddCardButton(cardRt);
            // Chân dung rip bên trái thẻ (sprite gán runtime theo roster — SelectGeneralUI.OnBeforeShowAsync).
            var portRt = NewRect("Portrait", cardRt, new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(10, 0), new Vector2(108, 116));
            var portrait = portRt.gameObject.AddComponent<Image>();
            portrait.preserveAspect = true; portrait.raycastTarget = false; portrait.enabled = false;
            var name = TextIn("Name", cardRt, new Vector2(128, 84), new Vector2(-16, -8), 26, "—", Color.white, TextAlignmentOptions.Left);
            var troop = TextIn("Troop", cardRt, new Vector2(128, 48), new Vector2(-16, -52), 20, "—", Color.gray, TextAlignmentOptions.Left);
            var level = TextIn("Level", cardRt, new Vector2(128, 10), new Vector2(-224, -88), 18, "Lv.—", new Color(0.85f, 0.85f, 0.9f), TextAlignmentOptions.Left);
            var power = TextIn("Power", cardRt, new Vector2(224, 10), new Vector2(-16, -88), 18, "Lực chiến —", new Color(1f, 0.82f, 0.4f), TextAlignmentOptions.Right);
            var mark = Highlight(cardRt);
            return new SelectGeneralUI.Card { root = cardRt.gameObject, button = btn, portrait = portrait, name = name, troop = troop, power = power, level = level, selectedMark = mark };
        }

        static SelectGeneralUI.Slot BuildLineupSlot(Transform parent, int i, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var rt = Frame($"Slot{i}", parent, anchor, anchor, new Vector2(1, 1), pos, size);
            var label = TextIn("Label", rt, new Vector2(24, 0), new Vector2(-130, 0), 24, $"{i + 1}.  (trống)", Color.white, TextAlignmentOptions.Left);
            var remove = Button(rt, "Bỏ", new Vector2(1, 0.5f), new Vector2(-58, 0), new Vector2(92, 60), CtxdPalette.BtnCrimson);
            return new SelectGeneralUI.Slot { root = rt.gameObject, label = label, remove = remove };
        }

        /// <summary>Button phủ lên Frame card: targetGraphic = Fill (hover sáng nhẹ, không che content).</summary>
        static Button AddCardButton(RectTransform frameRoot)
        {
            var fill = frameRoot.Find("Fill").GetComponent<Image>();
            fill.raycastTarget = true;
            var btn = frameRoot.gameObject.AddComponent<Button>();
            btn.targetGraphic = fill;
            Color baseC = fill.color;
            var cb = btn.colors;
            cb.normalColor = baseC; cb.highlightedColor = baseC * 1.25f; cb.pressedColor = baseC * 0.85f;
            cb.selectedColor = baseC; cb.disabledColor = baseC; cb.colorMultiplier = 1f;
            btn.colors = cb;
            return btn;
        }

        // ── SelectStage (chọn màn / phó bản) ──────────────────────────────────────
        static GameObject BuildSelectStage()
        {
            var root = UIRoot("SelectStageUI");
            var rt = (RectTransform)root.transform; Stretch(rt);
            FullBg(root, CtxdPalette.BgDark);
            var ui = root.AddComponent<SelectStageUI>();
            var selStageCg = root.AddComponent<CanvasGroup>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -56), new Vector2(1200, 60), 40, "CHỌN MÀN — CHINH CHIẾN", CtxdPalette.TxtTitle);

            const int cardCount = 6;
            var cards = new SelectStageUI.StageCard[cardCount];
            float cardW = 900, cardH = 120, gap = 18, top = -150, left = 120;
            for (int i = 0; i < cardCount; i++)
                cards[i] = BuildStageCard(rt, i, new Vector2(0, 1), new Vector2(left, top - i * (cardH + gap)), new Vector2(cardW, cardH));

            Text("TierTitle", rt, new Vector2(1, 1), new Vector2(-350, -150), new Vector2(500, 40), 26, "ĐỘ KHÓ", CtxdPalette.TxtTitle);
            var tierNames = SelectStageUI.TierNames;
            var tiers = new SelectStageUI.TierButton[5];
            float ty = -210;
            for (int i = 0; i < 5; i++) { tiers[i] = BuildTier(rt, i, tierNames[i], new Vector2(1, 1), new Vector2(-350, ty), new Vector2(500, 76)); ty -= 92; }

            var info = Text("Info", rt, new Vector2(1, 1), new Vector2(-350, ty - 4), new Vector2(520, 60), 20, "Chọn một phó bản để xuất chinh", CtxdPalette.TxtBody);

            var confirm = Button(rt, "VÀO TRẬN", new Vector2(1, 0), new Vector2(-220, 70), new Vector2(360, 86), CtxdPalette.BtnCrimson, 24);
            var back = Button(rt, "QUAY LẠI", new Vector2(0, 0), new Vector2(200, 70), new Vector2(300, 70), CtxdPalette.BtnBlue);

            SetField(ui, "_cards", cards); SetField(ui, "_tiers", tiers);
            SetField(ui, "_confirm", confirm); SetField(ui, "_back", back); SetField(ui, "_info", info);
            SetField(ui, "_screenGroup", selStageCg);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, SelStagePath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        static SelectStageUI.StageCard BuildStageCard(Transform parent, int i, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var cardRt = Frame($"Stage{i}", parent, anchor, anchor, new Vector2(0, 1), pos, size);
            var btn = AddCardButton(cardRt);
            // Thumbnail phong cảnh warBG (JPG rip, gán runtime) trong khung viền tối + overlay trầm màu.
            var thumbFrame = Frame("ThumbFrame", cardRt, new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(12, 0), new Vector2(172, 96), CtxdPalette.BarBorder, CtxdPalette.BarSlot);
            var thumbRt = NewRect("Thumb", thumbFrame, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            thumbRt.offsetMin = new Vector2(2, 2); thumbRt.offsetMax = new Vector2(-2, -2);
            var thumb = thumbRt.gameObject.AddComponent<Image>();
            thumb.raycastTarget = false; thumb.enabled = false;
            var shade = NewRect("Shade", thumbRt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            var shadeImg = shade.gameObject.AddComponent<Image>(); shadeImg.color = new Color(0f, 0f, 0f, 0.22f); shadeImg.raycastTarget = false;
            var name = TextIn("Name", cardRt, new Vector2(200, 74), new Vector2(-20, -10), 28, "—", new Color(1f, 0.9f, 0.7f), TextAlignmentOptions.Left);
            var terrain = TextIn("Terrain", cardRt, new Vector2(200, 42), new Vector2(-20, -52), 19, "—", new Color(0.7f, 0.85f, 0.95f), TextAlignmentOptions.Left);
            var desc = TextIn("Desc", cardRt, new Vector2(200, 8), new Vector2(-20, -84), 18, "—", new Color(0.8f, 0.8f, 0.82f), TextAlignmentOptions.Left);
            var mark = Highlight(cardRt);
            return new SelectStageUI.StageCard { root = cardRt.gameObject, button = btn, thumb = thumb, name = name, terrain = terrain, desc = desc, selectedMark = mark };
        }

        static SelectStageUI.TierButton BuildTier(Transform parent, int i, string label, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var btn = Button(parent, label, anchor, pos, size, CtxdPalette.BtnBlue);
            var mark = Highlight(btn.transform);
            return new SelectStageUI.TierButton { button = btn, selectedMark = mark };
        }

        // ── Result (kết quả trận) ─────────────────────────────────────────────────
        static GameObject BuildResult()
        {
            var root = UIRoot("ResultUI");
            var rt = (RectTransform)root.transform; Stretch(rt);
            FullBg(root, new Color(0.05f, 0.06f, 0.08f, 0.92f));
            var ui = root.AddComponent<ResultUI>();
            var resultCg = root.AddComponent<CanvasGroup>();

            // Cuộn thư pháp rồng vàng (windowBG rip) làm nền kết quả — Image nguyên khối, KHÔNG slice (méo trục gỗ).
            var panel = NewRect("Panel", rt, new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0, 30), new Vector2(900, 527));
            var scroll = panel.gameObject.AddComponent<Image>();
            scroll.sprite = SkinIndexForge.FindSprite("windowBG", "1");
            scroll.preserveAspect = true;
            if (scroll.sprite == null) { scroll.color = CtxdPalette.PanelFill; }   // placeholder nếu thiếu art
            var title = TextIn("Title", panel, new Vector2(120, 355), new Vector2(-120, -70), 60, "KẾT QUẢ", CtxdPalette.TxtTitle, TextAlignmentOptions.Center);
            var outcome = TextIn("Outcome", panel, new Vector2(140, 235), new Vector2(-140, -200), 28, "—", CtxdPalette.InkOnPaper, TextAlignmentOptions.Center);
            var reward = TextIn("Reward", panel, new Vector2(150, 115), new Vector2(-150, -320), 22, "—", CtxdPalette.InkOnPaper, TextAlignmentOptions.Center);
            var cont = Button(rt, "VỀ SẢNH", new Vector2(0.5f, 0.5f), new Vector2(0, -320), new Vector2(320, 80), CtxdPalette.BtnCrimson, 24);

            SetField(ui, "_title", title); SetField(ui, "_outcome", outcome); SetField(ui, "_reward", reward); SetField(ui, "_continue", cont);
            SetField(ui, "_screenGroup", resultCg); SetField(ui, "_panelRt", panel);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, ResultPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        // ── UI builder helpers ───────────────────────────────────────────────────
        // Skin: KHÔNG có UI-kit 9-slice trong kho rip → "chrome" là composite Image màu lồng nhau
        // (viền + nền, palette CtxdPalette). Art thật (chân dung/nền/icon) gán ở builder từng màn.
        static GameObject UIRoot(string name)
        {
            var go = new GameObject(name, typeof(RectTransform));
            return go;
        }

        /// <summary>Khung composite: Image cha = viền, con "Fill" inset 2px = nền. Content add vào CHA (vẽ trên Fill).</summary>
        static RectTransform Frame(string name, Transform parent, Vector2 aMin, Vector2 aMax, Vector2 pivot,
            Vector2 pos, Vector2 size, Color? border = null, Color? fill = null)
        {
            var rt = NewRect(name, parent, aMin, aMax, pivot, pos, size);
            var b = rt.gameObject.AddComponent<Image>(); b.color = border ?? CtxdPalette.PanelBorder; b.raycastTarget = false;
            var fillRt = NewRect("Fill", rt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            fillRt.offsetMin = new Vector2(2, 2); fillRt.offsetMax = new Vector2(-2, -2);
            var f = fillRt.gameObject.AddComponent<Image>(); f.color = fill ?? CtxdPalette.PanelFill; f.raycastTarget = false;
            return rt;
        }

        static void Stretch(RectTransform rt)
        {
            rt.anchorMin = Vector2.zero; rt.anchorMax = Vector2.one; rt.pivot = new Vector2(0.5f, 0.5f);
            rt.offsetMin = Vector2.zero; rt.offsetMax = Vector2.zero;
        }

        static RectTransform NewRect(string name, Transform parent, Vector2 aMin, Vector2 aMax, Vector2 pivot, Vector2 pos, Vector2 size)
        {
            var go = new GameObject(name, typeof(RectTransform));
            var rt = (RectTransform)go.transform;
            rt.SetParent(parent, false);
            rt.anchorMin = aMin; rt.anchorMax = aMax; rt.pivot = pivot;
            rt.anchoredPosition = pos; rt.sizeDelta = size;
            return rt;
        }

        static TextMeshProUGUI Text(string name, Transform parent, Vector2 anchor, Vector2 pos, Vector2 size, float fontSize, string text, Color color, TextAlignmentOptions align = TextAlignmentOptions.Center)
        {
            var rt = NewRect(name, parent, anchor, anchor, new Vector2(0.5f, 0.5f), pos, size);
            var t = rt.gameObject.AddComponent<TextMeshProUGUI>();
            StyleText(t, fontSize, color, align);
            t.text = text;
            return t;
        }

        static void StyleText(TMP_Text t, float fontSize, Color color, TextAlignmentOptions align)
        {
            if (TMP_Settings.defaultFontAsset != null) t.font = TMP_Settings.defaultFontAsset;
            t.fontSize = fontSize; t.color = color; t.alignment = align;
            t.enableWordWrapping = false; t.raycastTarget = false;
            t.outlineWidth = 0.18f; t.outlineColor = new Color(0, 0, 0, 0.9f);
        }

        /// <summary>Thanh máu/nộ composite: viền → rãnh tối → Fill (Filled/Horizontal). Trả Image Fill (code set .fillAmount).</summary>
        static Image Bar(string name, Transform parent, Vector2 anchor, Vector2 pos, Vector2 size, Color fill)
            => BarLabeled(name, parent, anchor, pos, size, fill, out _, null);

        /// <summary>Bar + TMP label căn giữa đè trên (số quân "12,4k / 16k"). initText null → không tạo label.</summary>
        static Image BarLabeled(string name, Transform parent, Vector2 anchor, Vector2 pos, Vector2 size, Color fill,
            out TextMeshProUGUI label, string initText = "")
        {
            var borderRt = NewRect(name + "Bg", parent, anchor, anchor, new Vector2(anchor.x, 0.5f), pos, size);
            var border = borderRt.gameObject.AddComponent<Image>(); border.color = CtxdPalette.BarBorder;
            var slotRt = NewRect("Slot", borderRt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            slotRt.offsetMin = new Vector2(1, 1); slotRt.offsetMax = new Vector2(-1, -1);
            var slot = slotRt.gameObject.AddComponent<Image>(); slot.color = CtxdPalette.BarSlot;
            var fillRt = NewRect(name + "Fill", slotRt, Vector2.zero, Vector2.one, new Vector2(0, 0.5f), Vector2.zero, Vector2.zero);
            fillRt.offsetMin = new Vector2(1, 1); fillRt.offsetMax = new Vector2(-1, -1);
            var img = fillRt.gameObject.AddComponent<Image>();
            img.color = fill; img.sprite = Builtin(); img.type = Image.Type.Filled; img.fillMethod = Image.FillMethod.Horizontal;
            img.fillOrigin = (int)Image.OriginHorizontal.Left; img.fillAmount = 1f;
            label = null;
            if (initText != null)
            {
                label = Text(name + "Num", borderRt, new Vector2(0.5f, 0.5f), Vector2.zero, size, Mathf.Max(12f, size.y * 0.62f), initText, Color.white);
                var lrt = (RectTransform)label.transform; lrt.anchorMin = Vector2.zero; lrt.anchorMax = Vector2.one; lrt.offsetMin = Vector2.zero; lrt.offsetMax = Vector2.zero;
            }
            return img;
        }

        /// <summary>Nút composite: viền vàng đồng + nền ColorBlock 3 trạng thái. Tên GO = label (flow test tìm theo tên).</summary>
        static Button Button(Transform parent, string label, Vector2 anchor, Vector2 pos, Vector2 size, Color bg, float fontSize = 20)
        {
            var rt = NewRect(label, parent, anchor, anchor, new Vector2(0.5f, 0.5f), pos, size);
            var borderImg = rt.gameObject.AddComponent<Image>(); borderImg.color = CtxdPalette.BtnBorder;
            var bgRt = NewRect("Bg", rt, Vector2.zero, Vector2.one, new Vector2(0.5f, 0.5f), Vector2.zero, Vector2.zero);
            bgRt.offsetMin = new Vector2(2, 2); bgRt.offsetMax = new Vector2(-2, -2);
            var bgImg = bgRt.gameObject.AddComponent<Image>(); bgImg.color = Color.white;
            var btn = rt.gameObject.AddComponent<Button>();
            btn.targetGraphic = bgImg;
            var cb = btn.colors;
            cb.normalColor = bg; cb.highlightedColor = bg * 1.18f; cb.pressedColor = bg * 0.8f;
            cb.selectedColor = bg; cb.disabledColor = new Color(bg.r, bg.g, bg.b, 0.45f); cb.colorMultiplier = 1f;
            btn.colors = cb;
            var t = Text(label + "_L", rt, new Vector2(0.5f, 0.5f), Vector2.zero, size, fontSize, label, CtxdPalette.TxtButton);
            var trt = (RectTransform)t.transform; trt.anchorMin = Vector2.zero; trt.anchorMax = Vector2.one; trt.offsetMin = Vector2.zero; trt.offsetMax = Vector2.zero;
            return btn;
        }

        // Text that stretches to fill its parent minus (offMin, offMax) — handy for card/panel internals.
        static TextMeshProUGUI TextIn(string name, Transform parent, Vector2 offMin, Vector2 offMax, float fontSize, string text, Color color, TextAlignmentOptions align)
        {
            var go = new GameObject(name, typeof(RectTransform));
            var rt = (RectTransform)go.transform; rt.SetParent(parent, false);
            rt.anchorMin = Vector2.zero; rt.anchorMax = Vector2.one; rt.offsetMin = offMin; rt.offsetMax = offMax;
            var t = go.AddComponent<TextMeshProUGUI>();
            StyleText(t, fontSize, color, align);
            t.text = text;
            return t;
        }

        /// <summary>Panel = Frame với viền đồng mặc định (giữ chữ ký cũ — c là màu NỀN).</summary>
        static RectTransform Panel(string name, Transform parent, Vector2 aMin, Vector2 aMax, Vector2 pivot, Vector2 pos, Vector2 size, Color c)
            => Frame(name, parent, aMin, aMax, pivot, pos, size, CtxdPalette.PanelBorder, c);

        static Image FullBg(GameObject root, Color c)
        {
            var img = root.AddComponent<Image>(); img.color = c; img.sprite = Builtin(); img.type = Image.Type.Sliced;
            return img;
        }

        // Gold overlay toggled on selection — raycastTarget off so it never blocks the card's own Button.
        static GameObject Highlight(Transform card)
        {
            var go = new GameObject("Sel", typeof(RectTransform));
            var rt = (RectTransform)go.transform; rt.SetParent(card, false);
            rt.anchorMin = Vector2.zero; rt.anchorMax = Vector2.one; rt.offsetMin = Vector2.zero; rt.offsetMax = Vector2.zero;
            var img = go.AddComponent<Image>(); img.color = new Color(1f, 0.82f, 0.37f, 0.28f); img.sprite = Builtin(); img.type = Image.Type.Sliced; img.raycastTarget = false;
            go.SetActive(false);
            return go;
        }

        static Sprite _builtin;
        static Sprite Builtin()
        {
            if (_builtin == null) _builtin = AssetDatabase.GetBuiltinExtraResource<Sprite>("UI/Skin/UISprite.psd");
            return _builtin;
        }

        static void SetField(object target, string field, object value)
        {
            var f = target.GetType().GetField(field, BindingFlags.NonPublic | BindingFlags.Instance);
            if (f == null) { Debug.LogError($"[UIForge] field '{field}' not found on {target.GetType().Name}"); return; }
            f.SetValue(target, value);
        }

        static T LoadOrCreate<T>(string path) where T : ScriptableObject
        {
            var e = AssetDatabase.LoadAssetAtPath<T>(path);
            if (e != null) return e;
            var so = ScriptableObject.CreateInstance<T>();
            AssetDatabase.CreateAsset(so, path);
            return so;
        }

        static void Folder(string assetFolder)
        {
            assetFolder = assetFolder.Replace('\\', '/').TrimEnd('/');
            if (AssetDatabase.IsValidFolder(assetFolder)) return;
            var parts = assetFolder.Split('/');
            string cur = parts[0];
            for (int i = 1; i < parts.Length; i++)
            {
                string next = $"{cur}/{parts[i]}";
                if (!AssetDatabase.IsValidFolder(next)) AssetDatabase.CreateFolder(cur, parts[i]);
                cur = next;
            }
        }
    }
}
