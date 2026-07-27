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
            rt.anchoredPosition = new Vector2(-12, -100); rt.sizeDelta = new Vector2(344, 600);  // top-right box, below the DEF HUD
            var bg = root.AddComponent<Image>(); bg.color = new Color(0f, 0f, 0f, 0.5f);
            var ui = root.AddComponent<TestApiPanelUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -30), new Vector2(340, 46), 24, "API CHIẾN ĐẤU (TEST)", new Color(1f, 0.85f, 0.4f));

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
            float y = -78;
            for (int i = 0; i < defs.Length; i++)
            {
                var d = defs[i];
                Color c = d.side == SideRef.ATT ? new Color(0.20f, 0.42f, 0.72f) : new Color(0.72f, 0.28f, 0.24f);
                var btn = Button(rt, d.label, new Vector2(0.5f, 1f), new Vector2(0, y), new Vector2(330, 44), c);
                arr[i] = new TestApiPanelUI.ApiButton { button = btn, kind = d.kind, side = d.side };
                y -= 50;
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

            // Offense corner (top-left)
            var offName = Text("OffName", rt, new Vector2(0, 1), new Vector2(180, -30), new Vector2(320, 40), 26, "—", new Color(0.7f, 0.85f, 1f), TextAlignmentOptions.Left);
            var offHp = Bar("OffHp", rt, new Vector2(0, 1), new Vector2(180, -64), new Vector2(300, 20), new Color(0.30f, 0.75f, 1f));
            var offMor = Bar("OffMorale", rt, new Vector2(0, 1), new Vector2(170, -86), new Vector2(280, 12), new Color(1f, 0.7f, 0.2f));
            // Defense corner (top-right)
            var defName = Text("DefName", rt, new Vector2(1, 1), new Vector2(-180, -30), new Vector2(320, 40), 26, "—", new Color(1f, 0.7f, 0.7f), TextAlignmentOptions.Right);
            var defHp = Bar("DefHp", rt, new Vector2(1, 1), new Vector2(-180, -64), new Vector2(300, 20), new Color(1f, 0.4f, 0.35f));
            var defMor = Bar("DefMorale", rt, new Vector2(1, 1), new Vector2(-170, -86), new Vector2(280, 12), new Color(1f, 0.7f, 0.2f));

            // Banner (center-top) with a CanvasGroup for fade.
            var bannerGo = NewRect("Banner", rt, new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0, -150), new Vector2(900, 60));
            var bannerGroup = bannerGo.gameObject.AddComponent<CanvasGroup>();
            var banner = bannerGo.gameObject.AddComponent<TextMeshProUGUI>();
            StyleText(banner, 34, new Color(1f, 0.95f, 0.7f), TextAlignmentOptions.Center);

            // Stance wheel (bottom-center): 4 buttons.
            var dot = Button(rt, "Đột Kích", new Vector2(0.5f, 0), new Vector2(0, 150), new Vector2(150, 56), new Color(0.6f, 0.45f, 0.2f));
            var def = Button(rt, "Phòng Thủ", new Vector2(0.5f, 0), new Vector2(-180, 90), new Vector2(150, 56), new Color(0.25f, 0.45f, 0.6f));
            var atk = Button(rt, "Tấn Công", new Vector2(0.5f, 0), new Vector2(180, 90), new Vector2(150, 56), new Color(0.6f, 0.3f, 0.3f));
            var giac = Button(rt, "GIÁC", new Vector2(0.5f, 0), new Vector2(0, 80), new Vector2(110, 56), new Color(0.7f, 0.55f, 0.15f));

            SetField(ui, "_offName", offName); SetField(ui, "_defName", defName);
            SetField(ui, "_offHp", offHp); SetField(ui, "_defHp", defHp);
            SetField(ui, "_offMorale", offMor); SetField(ui, "_defMorale", defMor);
            SetField(ui, "_banner", banner); SetField(ui, "_bannerGroup", bannerGroup);
            SetField(ui, "_dotKich", dot); SetField(ui, "_tanCong", atk); SetField(ui, "_phongThu", def); SetField(ui, "_giac", giac);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, HudPath);
            Object.DestroyImmediate(root);
            return prefab;
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
            var bg = root.AddComponent<Image>(); bg.color = new Color(0.06f, 0.06f, 0.10f, 0.97f); bg.sprite = Builtin(); bg.type = Image.Type.Sliced;
            var ui = root.AddComponent<LineupUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -44), new Vector2(600, 50), 30, "BÀY BINH BỐ TRẬN", new Color(1f, 0.85f, 0.4f));
            Text("Sub", rt, new Vector2(0.5f, 1f), new Vector2(0, -84), new Vector2(600, 30), 18, "Chọn & sắp xếp thứ tự xuất chiến (▲▼)", new Color(0.82f, 0.82f, 0.88f));

            const int slotCount = 6;
            var slots = new LineupUI.Slot[slotCount];
            float y = -130;
            for (int i = 0; i < slotCount; i++)
            {
                var rowRt = NewRect($"Slot{i}", rt, new Vector2(0.5f, 1f), new Vector2(0.5f, 1f), new Vector2(0.5f, 0.5f), new Vector2(0, y), new Vector2(580, 66));
                var rimg = rowRt.gameObject.AddComponent<Image>(); rimg.color = new Color(0.16f, 0.17f, 0.22f, 0.95f); rimg.sprite = Builtin(); rimg.type = Image.Type.Sliced;
                var label = Text($"Name{i}", rowRt, new Vector2(0, 0.5f), Vector2.zero, new Vector2(380, 50), 22, "—", Color.white, TextAlignmentOptions.Left);
                var lrt = (RectTransform)label.transform; lrt.anchorMin = Vector2.zero; lrt.anchorMax = Vector2.one; lrt.offsetMin = new Vector2(24, 0); lrt.offsetMax = new Vector2(-140, 0);
                var up = Button(rowRt, "▲", new Vector2(1, 0.5f), new Vector2(-96, 0), new Vector2(56, 52), new Color(0.30f, 0.42f, 0.58f));
                var down = Button(rowRt, "▼", new Vector2(1, 0.5f), new Vector2(-34, 0), new Vector2(56, 52), new Color(0.30f, 0.42f, 0.58f));
                slots[i] = new LineupUI.Slot { root = rowRt.gameObject, label = label, up = up, down = down };
                y -= 72;
            }
            var confirm = Button(rt, "VÀO TRẬN", new Vector2(0.5f, 0f), new Vector2(0, 44), new Vector2(300, 66), new Color(0.30f, 0.60f, 0.34f));

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
            FullBg(root, new Color(0.10f, 0.13f, 0.11f, 0.98f));
            var ui = root.AddComponent<LobbyUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -90), new Vector2(1400, 80), 56, "CÔNG THÀNH XƯNG ĐẾ", new Color(1f, 0.85f, 0.4f));
            Text("Sub", rt, new Vector2(0.5f, 1f), new Vector2(0, -150), new Vector2(1200, 40), 26, "Chiến thuật Tam Quốc theo lượt", new Color(0.82f, 0.84f, 0.88f));

            var header = Panel("Header", rt, new Vector2(0, 1), new Vector2(0, 1), new Vector2(0, 1), new Vector2(40, -40), new Vector2(640, 150), new Color(0.05f, 0.07f, 0.09f, 0.92f));
            var pName = TextIn("PName", header, new Vector2(24, 86), new Vector2(-24, -16), 34, "Chủ Công", Color.white, TextAlignmentOptions.Left);
            var pLevel = TextIn("PLevel", header, new Vector2(24, 46), new Vector2(-24, -62), 24, "Chủ Công Lv.1", new Color(1f, 0.85f, 0.5f), TextAlignmentOptions.Left);
            var pRes = TextIn("PRes", header, new Vector2(24, 10), new Vector2(-24, -104), 20, "—", new Color(0.8f, 0.86f, 0.8f), TextAlignmentOptions.Left);

            var campaign = Button(rt, "XUẤT CHINH", new Vector2(0.5f, 0.5f), new Vector2(0, 40), new Vector2(440, 100), new Color(0.30f, 0.60f, 0.34f));
            var formation = Button(rt, "ĐỘI HÌNH", new Vector2(0.5f, 0.5f), new Vector2(0, -84), new Vector2(360, 78), new Color(0.30f, 0.42f, 0.58f));

            var stubDefs = new[] { "Chủ Thành", "Trang Bị", "Bản Đồ", "Cửa Hàng" };
            var stubs = new Button[stubDefs.Length];
            float sx = -570;
            for (int i = 0; i < stubDefs.Length; i++) { stubs[i] = Button(rt, stubDefs[i], new Vector2(0.5f, 0f), new Vector2(sx, 90), new Vector2(340, 68), new Color(0.22f, 0.24f, 0.28f)); sx += 380; }

            SetField(ui, "_playerName", pName); SetField(ui, "_level", pLevel); SetField(ui, "_resources", pRes);
            SetField(ui, "_btnCampaign", campaign); SetField(ui, "_btnFormation", formation); SetField(ui, "_stubButtons", stubs);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, LobbyPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        // ── SelectGeneral (chọn tướng / đội hình) ─────────────────────────────────
        static GameObject BuildSelectGeneral()
        {
            var root = UIRoot("SelectGeneralUI");
            var rt = (RectTransform)root.transform; Stretch(rt);
            FullBg(root, new Color(0.09f, 0.11f, 0.13f, 0.98f));
            var ui = root.AddComponent<SelectGeneralUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -56), new Vector2(1400, 60), 40, "CHỌN TƯỚNG — BÀY BINH BỐ TRẬN", new Color(1f, 0.85f, 0.4f));
            var hint = Text("Hint", rt, new Vector2(0.5f, 1f), new Vector2(0, -104), new Vector2(1200, 34), 22, "Đã chọn 0/5 tướng", new Color(0.82f, 0.84f, 0.88f));

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
            Text("LineupTitle", rt, new Vector2(1, 1), new Vector2(slotRight - slotW / 2, -150), new Vector2(slotW, 40), 26, "ĐỘI HÌNH XUẤT CHIẾN (1→5)", new Color(1f, 0.8f, 0.5f));
            for (int i = 0; i < slotCount; i++)
                slots[i] = BuildLineupSlot(rt, i, new Vector2(1, 1), new Vector2(slotRight, slotTop - i * (slotH + slotGap)), new Vector2(slotW, slotH));

            var confirm = Button(rt, "TIẾP TỤC", new Vector2(1, 0), new Vector2(-220, 70), new Vector2(360, 80), new Color(0.30f, 0.60f, 0.34f));
            var back = Button(rt, "QUAY LẠI", new Vector2(0, 0), new Vector2(200, 70), new Vector2(300, 70), new Color(0.42f, 0.30f, 0.30f));

            SetField(ui, "_cards", cards); SetField(ui, "_slots", slots);
            SetField(ui, "_confirm", confirm); SetField(ui, "_back", back); SetField(ui, "_hint", hint);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, SelGenPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        static SelectGeneralUI.Card BuildGeneralCard(Transform parent, int i, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var cardRt = NewRect($"Card{i}", parent, anchor, anchor, new Vector2(0, 1), pos, size);
            var img = cardRt.gameObject.AddComponent<Image>(); img.color = new Color(0.16f, 0.18f, 0.22f, 0.96f); img.sprite = Builtin(); img.type = Image.Type.Sliced;
            var btn = cardRt.gameObject.AddComponent<Button>();
            var name = TextIn("Name", cardRt, new Vector2(16, 84), new Vector2(-16, -8), 26, "—", Color.white, TextAlignmentOptions.Left);
            var troop = TextIn("Troop", cardRt, new Vector2(16, 48), new Vector2(-16, -52), 20, "—", Color.gray, TextAlignmentOptions.Left);
            var level = TextIn("Level", cardRt, new Vector2(16, 10), new Vector2(-224, -88), 18, "Lv.—", new Color(0.85f, 0.85f, 0.9f), TextAlignmentOptions.Left);
            var power = TextIn("Power", cardRt, new Vector2(224, 10), new Vector2(-16, -88), 18, "Lực chiến —", new Color(1f, 0.82f, 0.4f), TextAlignmentOptions.Right);
            var mark = Highlight(cardRt);
            return new SelectGeneralUI.Card { root = cardRt.gameObject, button = btn, name = name, troop = troop, power = power, level = level, selectedMark = mark };
        }

        static SelectGeneralUI.Slot BuildLineupSlot(Transform parent, int i, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var rt = NewRect($"Slot{i}", parent, anchor, anchor, new Vector2(1, 1), pos, size);
            var img = rt.gameObject.AddComponent<Image>(); img.color = new Color(0.13f, 0.15f, 0.20f, 0.95f); img.sprite = Builtin(); img.type = Image.Type.Sliced;
            var label = TextIn("Label", rt, new Vector2(24, 0), new Vector2(-130, 0), 24, $"{i + 1}.  (trống)", Color.white, TextAlignmentOptions.Left);
            var remove = Button(rt, "Bỏ", new Vector2(1, 0.5f), new Vector2(-58, 0), new Vector2(92, 60), new Color(0.5f, 0.3f, 0.3f));
            return new SelectGeneralUI.Slot { root = rt.gameObject, label = label, remove = remove };
        }

        // ── SelectStage (chọn màn / phó bản) ──────────────────────────────────────
        static GameObject BuildSelectStage()
        {
            var root = UIRoot("SelectStageUI");
            var rt = (RectTransform)root.transform; Stretch(rt);
            FullBg(root, new Color(0.11f, 0.10f, 0.09f, 0.98f));
            var ui = root.AddComponent<SelectStageUI>();

            Text("Title", rt, new Vector2(0.5f, 1f), new Vector2(0, -56), new Vector2(1200, 60), 40, "CHỌN MÀN — CHINH CHIẾN", new Color(1f, 0.85f, 0.4f));

            const int cardCount = 6;
            var cards = new SelectStageUI.StageCard[cardCount];
            float cardW = 900, cardH = 120, gap = 18, top = -150, left = 120;
            for (int i = 0; i < cardCount; i++)
                cards[i] = BuildStageCard(rt, i, new Vector2(0, 1), new Vector2(left, top - i * (cardH + gap)), new Vector2(cardW, cardH));

            Text("TierTitle", rt, new Vector2(1, 1), new Vector2(-350, -150), new Vector2(500, 40), 26, "ĐỘ KHÓ", new Color(1f, 0.8f, 0.5f));
            var tierNames = SelectStageUI.TierNames;
            var tiers = new SelectStageUI.TierButton[5];
            float ty = -210;
            for (int i = 0; i < 5; i++) { tiers[i] = BuildTier(rt, i, tierNames[i], new Vector2(1, 1), new Vector2(-350, ty), new Vector2(500, 76)); ty -= 92; }

            var info = Text("Info", rt, new Vector2(1, 1), new Vector2(-350, ty - 4), new Vector2(520, 60), 20, "Chọn một phó bản để xuất chinh", new Color(0.85f, 0.86f, 0.8f));

            var confirm = Button(rt, "VÀO TRẬN", new Vector2(1, 0), new Vector2(-220, 70), new Vector2(360, 86), new Color(0.62f, 0.34f, 0.30f));
            var back = Button(rt, "QUAY LẠI", new Vector2(0, 0), new Vector2(200, 70), new Vector2(300, 70), new Color(0.42f, 0.30f, 0.30f));

            SetField(ui, "_cards", cards); SetField(ui, "_tiers", tiers);
            SetField(ui, "_confirm", confirm); SetField(ui, "_back", back); SetField(ui, "_info", info);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, SelStagePath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        static SelectStageUI.StageCard BuildStageCard(Transform parent, int i, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var cardRt = NewRect($"Stage{i}", parent, anchor, anchor, new Vector2(0, 1), pos, size);
            var img = cardRt.gameObject.AddComponent<Image>(); img.color = new Color(0.18f, 0.16f, 0.14f, 0.96f); img.sprite = Builtin(); img.type = Image.Type.Sliced;
            var btn = cardRt.gameObject.AddComponent<Button>();
            var name = TextIn("Name", cardRt, new Vector2(20, 74), new Vector2(-20, -10), 28, "—", new Color(1f, 0.9f, 0.7f), TextAlignmentOptions.Left);
            var terrain = TextIn("Terrain", cardRt, new Vector2(20, 42), new Vector2(-20, -52), 19, "—", new Color(0.7f, 0.85f, 0.95f), TextAlignmentOptions.Left);
            var desc = TextIn("Desc", cardRt, new Vector2(20, 8), new Vector2(-20, -84), 18, "—", new Color(0.8f, 0.8f, 0.82f), TextAlignmentOptions.Left);
            var mark = Highlight(cardRt);
            return new SelectStageUI.StageCard { root = cardRt.gameObject, button = btn, name = name, terrain = terrain, desc = desc, selectedMark = mark };
        }

        static SelectStageUI.TierButton BuildTier(Transform parent, int i, string label, Vector2 anchor, Vector2 pos, Vector2 size)
        {
            var btn = Button(parent, label, anchor, pos, size, new Color(0.26f, 0.30f, 0.38f));
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

            var panel = Panel("Panel", rt, new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), Vector2.zero, new Vector2(760, 520), new Color(0.10f, 0.12f, 0.15f, 0.98f));
            var title = TextIn("Title", panel, new Vector2(20, 360), new Vector2(-20, -40), 64, "KẾT QUẢ", new Color(1f, 0.85f, 0.35f), TextAlignmentOptions.Center);
            var outcome = TextIn("Outcome", panel, new Vector2(20, 250), new Vector2(-20, -180), 30, "—", Color.white, TextAlignmentOptions.Center);
            var reward = TextIn("Reward", panel, new Vector2(20, 120), new Vector2(-20, -300), 24, "—", new Color(0.85f, 0.9f, 0.85f), TextAlignmentOptions.Center);
            var cont = Button(panel, "VỀ SẢNH", new Vector2(0.5f, 0), new Vector2(0, 60), new Vector2(320, 84), new Color(0.30f, 0.55f, 0.34f));

            SetField(ui, "_title", title); SetField(ui, "_outcome", outcome); SetField(ui, "_reward", reward); SetField(ui, "_continue", cont);

            var prefab = PrefabUtility.SaveAsPrefabAsset(root, ResultPath);
            Object.DestroyImmediate(root);
            return prefab;
        }

        // ── UI builder helpers ───────────────────────────────────────────────────
        static GameObject UIRoot(string name)
        {
            var go = new GameObject(name, typeof(RectTransform));
            return go;
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

        static Image Bar(string name, Transform parent, Vector2 anchor, Vector2 pos, Vector2 size, Color fill)
        {
            // background
            var bgRt = NewRect(name + "Bg", parent, anchor, anchor, new Vector2(anchor.x, 0.5f), pos, size);
            var bg = bgRt.gameObject.AddComponent<Image>(); bg.color = new Color(0, 0, 0, 0.55f); bg.sprite = Builtin(); bg.type = Image.Type.Sliced;
            // fill
            var fillRt = NewRect(name + "Fill", bgRt, new Vector2(0, 0), new Vector2(1, 1), new Vector2(0, 0.5f), Vector2.zero, Vector2.zero);
            fillRt.offsetMin = Vector2.zero; fillRt.offsetMax = Vector2.zero;
            var img = fillRt.gameObject.AddComponent<Image>();
            img.color = fill; img.sprite = Builtin(); img.type = Image.Type.Filled; img.fillMethod = Image.FillMethod.Horizontal;
            img.fillOrigin = (int)Image.OriginHorizontal.Left; img.fillAmount = 1f;
            return img;
        }

        static Button Button(Transform parent, string label, Vector2 anchor, Vector2 pos, Vector2 size, Color bg)
        {
            var rt = NewRect(label, parent, anchor, anchor, new Vector2(0.5f, 0.5f), pos, size);
            var img = rt.gameObject.AddComponent<Image>(); img.color = bg; img.sprite = Builtin(); img.type = Image.Type.Sliced;
            var btn = rt.gameObject.AddComponent<Button>();
            var t = Text(label + "_L", rt, new Vector2(0.5f, 0.5f), Vector2.zero, size, 20, label, Color.white);
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

        static RectTransform Panel(string name, Transform parent, Vector2 aMin, Vector2 aMax, Vector2 pivot, Vector2 pos, Vector2 size, Color c)
        {
            var rt = NewRect(name, parent, aMin, aMax, pivot, pos, size);
            var img = rt.gameObject.AddComponent<Image>(); img.color = c; img.sprite = Builtin(); img.type = Image.Type.Sliced;
            return rt;
        }

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
            var img = go.AddComponent<Image>(); img.color = new Color(1f, 0.85f, 0.3f, 0.30f); img.sprite = Builtin(); img.type = Image.Type.Sliced; img.raycastTarget = false;
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
