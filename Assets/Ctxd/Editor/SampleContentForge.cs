using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using Ctxd.Core;
using Ctxd.Battle;
using Ctxd.Battle.Sim;
using Ctxd.Data;
using Ctxd.UI;
using Terrain = Ctxd.Battle.Sim.Terrain;

namespace Ctxd.EditorTools
{
    /// <summary>Authors a playable slice of sample content + the database + a Battle scene. One-click end-to-end.</summary>
    public static class SampleContentForge
    {
        const string Root = "Assets/Ctxd/Sample";
        const string DbPath = "Assets/Ctxd/Resources/CtxdGameDatabase.asset";

        static readonly (TroopType troop, string id, string name)[] Troops =
        {
            (TroopType.KyBinh, "10", "骑兵 / Kỵ binh"),
            (TroopType.ThuongBinh, "31", "枪兵 / Thương binh"),
            (TroopType.CungBinh, "33", "弓兵 / Cung binh"),
            (TroopType.ChienXa, "43", "战车 / Chiến xa"),
            (TroopType.MuuSi, "67", "谋士 / Mưu sĩ"),
        };

        [MenuItem("CTXD/Build Everything (Content + Prefabs)", priority = -10)]
        public static void BuildEverything()
        {
            CreateSampleContent();
            AssetForge.BakeAll();   // bake .anim + .controller + .prefab and assign into the SOs (owner rule: spawn = prefab in SO)
            RebuildDatabase();      // re-aggregate so newly created visual SOs are in the DB
            Debug.Log("[CTXD] Content + prefabs ready. Next: CTXD ▸ Server ▸ Build Server Battle Scene, then Play BattleServer.unity.");
        }

        [MenuItem("CTXD/Sample/Create Sample Content", priority = 40)]
        public static void CreateSampleContent()
        {
            Folder(Root); Folder($"{Root}/Visuals"); Folder($"{Root}/Troops"); Folder($"{Root}/Tactics");
            Folder($"{Root}/Generals"); Folder($"{Root}/Formations"); Folder($"{Root}/Config"); Folder($"{Root}/Backgrounds");
            Folder($"{Root}/Effects");

            var troops = BuildTroops();
            var effects = BuildEffects();
            var tactics = BuildTactics(effects);
            var formations = BuildFormations();
            BuildConfig();
            BuildBackground();
            BuildGenerals(troops, tactics, formations);

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            RebuildDatabase();
            Debug.Log("[CTXD] Sample content created under Assets/Ctxd/Sample.");
        }

        static Dictionary<TroopType, TroopTypeDefinition> BuildTroops()
        {
            var map = new Dictionary<TroopType, TroopTypeDefinition>();
            foreach (var t in Troops)
            {
                var vis = LoadOrCreate<UnitVisualDefinition>($"{Root}/Visuals/unit_{t.id}.asset");
                if (string.IsNullOrEmpty(vis.unitId)) vis.unitId = t.id; // prefab refs (att/def) assigned by AssetForge.BakeAll
                EditorUtility.SetDirty(vis);

                var def = LoadOrCreate<TroopTypeDefinition>($"{Root}/Troops/{t.troop}.asset");
                def.troopType = t.troop; def.displayName = VN(t.name); def.unitVisual = vis;
                EditorUtility.SetDirty(def);
                map[t.troop] = def;
            }
            return map;
        }

        static Dictionary<string, EffectVisualDefinition> BuildEffects()
        {
            // slug → Resources frame folder. The tactic cast effect is looked up by sourceId at runtime; the
            // "wujiangjuexing" one is also spawned on awakening (BattlePresenter). warFeatAnger has no frames → skipped.
            var data = new (string key, string sourceId, string res, EffectVisualDefinition.EffectKind kind, float scale, float life)[]
            {
                ("skill_generic", "skill_generic", "sprite/eff/gjjl",          EffectVisualDefinition.EffectKind.Skill,  1.2f, 1.1f),
                ("wushen",        "wushen",        "sprite/eff/WuShenFuTi",     EffectVisualDefinition.EffectKind.Skill,  1.4f, 1.4f),
                ("awaken",        "wujiangjuexing","sprite/eff/wujiangjuexing", EffectVisualDefinition.EffectKind.Awaken, 1.4f, 1.4f),
            };
            var map = new Dictionary<string, EffectVisualDefinition>();
            foreach (var d in data)
            {
                var e = LoadOrCreate<EffectVisualDefinition>($"{Root}/Effects/{d.key}.asset");
                e.sourceId = d.sourceId; e.resourcesPath = d.res; e.kind = d.kind; e.scale = d.scale; e.lifetime = d.life;
                e.fps = 16f;   // prefab assigned by AssetForge.BakeAll — do NOT null it here.
                EditorUtility.SetDirty(e);
                map[d.key] = e;
            }
            return map;
        }

        static Dictionary<string, TacticDefinition> BuildTactics(Dictionary<string, EffectVisualDefinition> effects)
        {
            var data = new (string key, string name, TacticEffectKind kind, int rows, float power, bool awk, float fix, int conf, int push)[]
            {
                ("wushen", "武神降临 / Vũ Thần Giáng Lâm", TacticEffectKind.InstantTo1Hp, 3, 1.0f, true, 2.5f, 0, 0),
                ("zhanshen", "战神无双 / Chiến Thần Vô Song", TacticEffectKind.AoeDamage, 4, 1.4f, true, 2.2f, 0, 0),
                ("longqiang", "龙枪傲世 / Long Thương Ngạo Thế", TacticEffectKind.Damage, 3, 1.3f, false, 0, 0, 0),
                ("miehou", "灭世咆哮 / Diệt Thế Bào Hao", TacticEffectKind.Pushback, 3, 1.1f, false, 0, 0, 400),
                ("chiyan", "赤焰迷阵 / Xích Diễm Mê Trận", TacticEffectKind.Confusion, 4, 1.0f, false, 0, 1, 0),
                ("jiaolong", "绞龙巨浪 / Giảo Long Cự Lãng", TacticEffectKind.AoeDamage, 5, 1.2f, false, 0, 0, 0),
            };
            var map = new Dictionary<string, TacticDefinition>();
            foreach (var d in data)
            {
                var t = LoadOrCreate<TacticDefinition>($"{Root}/Tactics/{d.key}.asset");
                t.displayName = VN(d.name); t.kind = d.kind; t.rowsHit = d.rows; t.power = d.power;
                t.isAwakening = d.awk; t.fixedPower = d.fix; t.confusionTurns = d.conf; t.pushbackTroops = d.push;
                t.castEffect = (d.key == "wushen" && effects.TryGetValue("wushen", out var we)) ? we
                             : (effects.TryGetValue("skill_generic", out var ge) ? ge : null);
                EditorUtility.SetDirty(t);
                map[d.key] = t;
            }
            return map;
        }

        static List<FormationDefinition> BuildFormations()
        {
            var list = new List<FormationDefinition>();
            list.Add(MakeFormation("phongthi", "锋矢阵 / Phong Thỉ", Ctxd.Data.RowShape.Wedge, 1.05f, 0.95f, TroopType.KyBinh));
            list.Add(MakeFormation("nhanhanh", "雁形阵 / Nhạn Hành", Ctxd.Data.RowShape.Arc, 0.95f, 1.0f, TroopType.CungBinh));
            list.Add(MakeFormation("phuongvien", "方圆阵 / Phương Viên", Ctxd.Data.RowShape.Square, 0.95f, 1.1f, TroopType.ThuongBinh));
            return list;
        }

        static FormationDefinition MakeFormation(string key, string name, Ctxd.Data.RowShape shape, float atk, float def, TroopType fav)
        {
            var f = LoadOrCreate<FormationDefinition>($"{Root}/Formations/{key}.asset");
            f.displayName = VN(name); f.normalAtkMult = atk; f.tacticAtkMult = atk; f.normalDefMult = def; f.tacticDefMult = def;
            f.favouredTroops = new[] { fav };
            f.rows = new FormationDefinition.FormationRow[4];
            for (int i = 0; i < 4; i++) f.rows[i] = new FormationDefinition.FormationRow { defaultShape = shape, engagedShape = Ctxd.Data.RowShape.Arc, anchor = new Vector2(0, -i * 0.5f), groups = 3 };
            EditorUtility.SetDirty(f);
            return f;
        }

        static void BuildConfig() { EditorUtility.SetDirty(LoadOrCreate<BattleConfigDefinition>($"{Root}/Config/BattleConfig.asset")); }

        static void BuildBackground()
        {
            var b = LoadOrCreate<BattleBackgroundDefinition>($"{Root}/Backgrounds/plain.asset");
            b.terrain = Terrain.Plain; b.background = LoadFirstSprite("Assets/Resources/sprite/warBG"); b.note = "Sample plain battlefield";
            EditorUtility.SetDirty(b);
        }

        static void BuildGenerals(Dictionary<TroopType, TroopTypeDefinition> troops, Dictionary<string, TacticDefinition> tactics, List<FormationDefinition> formations)
        {
            var portraits = LoadPortraits(8);
            var data = new (string key, string name, TroopType troop, string skill, GeneralQuality q, int hp, double na, double nd, double ta, double td, double st, double res, bool awk, bool five)[]
            {
                ("guanyu", "关羽 / Quan Vũ", TroopType.KyBinh, "wushen", GeneralQuality.Tim, 4200, 560,300,520,280,90,0.15, true, true),
                ("zhaoyun", "赵云 / Triệu Vân", TroopType.KyBinh, "longqiang", GeneralQuality.Do, 3800, 540,280,500,260,80,0.10, false, false),
                ("zhangfei", "张飞 / Trương Phi", TroopType.ThuongBinh, "miehou", GeneralQuality.Do, 4000, 520,320,460,300,60,0.10, false, false),
                ("lvbu", "吕布 / Lữ Bố", TroopType.KyBinh, "zhanshen", GeneralQuality.Tim, 4500, 600,300,540,270,85,0.10, true, false),
                ("zhouyu", "周瑜 / Chu Du", TroopType.MuuSi, "chiyan", GeneralQuality.Do, 3600, 460,260,560,320,95,0.20, false, false),
                ("ganning", "甘宁 / Cam Ninh", TroopType.CungBinh, "jiaolong", GeneralQuality.Do, 3900, 540,300,470,280,70,0.10, false, false),
            };
            int pi = 0;
            foreach (var d in data)
            {
                var g = LoadOrCreate<GeneralDefinition>($"{Root}/Generals/{d.key}.asset");
                g.displayName = VN(d.name); g.quality = d.q;
                g.troopType = troops.TryGetValue(d.troop, out var tt) ? tt : null;
                g.stats = new GeneralStats(d.na, d.nd, d.ta, d.td, d.st, d.res);
                g.troopCapacity = d.hp;
                g.skill2 = tactics.TryGetValue(d.skill, out var sk) ? sk : null;
                g.canAwaken = d.awk; g.startAwakened = d.awk; g.fiveStar = d.five; g.rows = 4;
                g.defaultFormation = formations.Count > 0 ? formations[pi % formations.Count] : null;
                if (portraits.Length > 0) g.portrait = portraits[pi % portraits.Length];
                EditorUtility.SetDirty(g);
                pi++;
            }
        }

        [MenuItem("CTXD/Sample/Rebuild Database", priority = 41)]
        public static void RebuildDatabase()
        {
            Folder("Assets/Ctxd/Resources");
            var db = LoadOrCreate<CtxdGameDatabase>(DbPath);
            db.generals = LoadAll<GeneralDefinition>("Assets/Ctxd");
            db.troopTypes = LoadAll<TroopTypeDefinition>("Assets/Ctxd");
            db.tactics = LoadAll<TacticDefinition>("Assets/Ctxd");
            db.formations = LoadAll<FormationDefinition>("Assets/Ctxd");
            db.unitVisuals = LoadAll<UnitVisualDefinition>("Assets/Ctxd");
            db.effectVisuals = LoadAll<EffectVisualDefinition>("Assets/Ctxd");
            db.backgrounds = LoadAll<BattleBackgroundDefinition>("Assets/Ctxd");
            var cfgs = LoadAll<BattleConfigDefinition>("Assets/Ctxd");
            if (db.battleConfig == null && cfgs.Count > 0) db.battleConfig = cfgs[0];
            EditorUtility.SetDirty(db);
            AssetDatabase.SaveAssets();
            Debug.Log($"[CTXD] DB rebuilt: {db.generals.Count} generals, {db.tactics.Count} tactics, {db.troopTypes.Count} troops.");
        }

        // ── helpers ──
        static Sprite[] LoadPortraits(int n)
        {
            var sprites = new List<Sprite>();
            const string folder = "Assets/Resources/sprite/tacticalGeneralPicMax";
            if (!AssetDatabase.IsValidFolder(folder)) return sprites.ToArray();
            foreach (var guid in AssetDatabase.FindAssets("t:Texture2D", new[] { folder }))
            {
                var s = AssetDatabase.LoadAllAssetsAtPath(AssetDatabase.GUIDToAssetPath(guid)).OfType<Sprite>().FirstOrDefault();
                if (s != null) sprites.Add(s);
                if (sprites.Count >= n) break;
            }
            return sprites.ToArray();
        }

        static Sprite LoadFirstSprite(string folder)
        {
            if (!AssetDatabase.IsValidFolder(folder)) return null;
            foreach (var guid in AssetDatabase.FindAssets("t:Texture2D", new[] { folder }))
            {
                var s = AssetDatabase.LoadAllAssetsAtPath(AssetDatabase.GUIDToAssetPath(guid)).OfType<Sprite>().FirstOrDefault();
                if (s != null) return s;
            }
            return null;
        }

        static T LoadOrCreate<T>(string path) where T : ScriptableObject
        {
            var e = AssetDatabase.LoadAssetAtPath<T>(path);
            if (e != null) return e;
            var so = ScriptableObject.CreateInstance<T>();
            AssetDatabase.CreateAsset(so, path);
            return so;
        }

        static List<T> LoadAll<T>(string folder) where T : Object
        {
            var list = new List<T>();
            if (!AssetDatabase.IsValidFolder(folder)) return list;
            foreach (var guid in AssetDatabase.FindAssets($"t:{typeof(T).Name}", new[] { folder }))
            {
                var o = AssetDatabase.LoadAssetAtPath<T>(AssetDatabase.GUIDToAssetPath(guid));
                if (o != null) list.Add(o);
            }
            return list;
        }

        // Display names are authored bilingual ("汉字 / Việt") for reference; the somo-era VN game shows the
        // Vietnamese name in-game, and the default font lacks CJK glyphs, so strip to the Vietnamese part.
        static string VN(string s)
        {
            if (string.IsNullOrEmpty(s)) return s;
            int i = s.IndexOf('/');
            return i >= 0 ? s.Substring(i + 1).Trim() : s.Trim();
        }


        static void Folder(string assetFolder)
        {
            assetFolder = assetFolder.Replace('\\', '/').TrimEnd('/');
            if (AssetDatabase.IsValidFolder(assetFolder)) return;
            var parts = assetFolder.Split('/');
            string cur = parts[0];
            for (int i = 1; i < parts.Length; i++) { string next = $"{cur}/{parts[i]}"; if (!AssetDatabase.IsValidFolder(next)) AssetDatabase.CreateFolder(cur, parts[i]); cur = next; }
        }
    }
}
