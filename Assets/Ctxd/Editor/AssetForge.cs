using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.Animations;
using UnityEngine;
using TMPro;
using Ctxd.Data;
using Ctxd.Visual;

namespace Ctxd.EditorTools
{
    /// <summary>
    /// Bakes sprite-frame folders into REAL Unity assets — <c>AnimationClip</c> (.anim) + <c>AnimatorController</c>
    /// (.controller) + a <c>.prefab</c> — and assigns each prefab into its ScriptableObject.
    /// <para>OWNER RULE: everything spawned is a prefab asset referenced by an SO; you change a visual by editing
    /// the prefab, never by building GameObjects in code. This tool replaces the old "render fallback from
    /// Resources" shortcut (which left every SO prefab field null).</para>
    /// Source: <c>Assets/Resources/sprite/army/{att,def}/&lt;facing&gt;_&lt;id&gt;/&lt;action 1-5&gt;/&lt;frame&gt;.png</c>,
    /// effects <c>Assets/Resources/sprite/eff/&lt;slug&gt;/&lt;frame&gt;.png</c>.
    /// </summary>
    public static class AssetForge
    {
        const string SpriteRoot = "Assets/Resources/sprite";
        const string ArmyRoot   = SpriteRoot + "/army";
        const string Gen        = "Assets/Ctxd/Generated";
        const string AnimDir    = Gen + "/Anim";
        const string CtrlDir    = Gen + "/Controllers";
        const string PrefabDir  = Gen + "/Prefabs";
        const string FxRoot     = Gen + "/FX";            // mirrors the sprite tree, one prefab per FX
        const string VisualsDir = "Assets/Ctxd/Sample/Visuals";
        const string EffectsDir = "Assets/Ctxd/Sample/Effects";

        const float UnitFps = 12f;
        const float EffFps  = 16f;

        // action subfolder index → (Animator state name, loop)
        static readonly (int idx, string state, bool loop)[] Actions =
        {
            (1, "Idle", true), (2, "Move", true), (3, "Attack", false), (4, "Hurt", false), (5, "Die", false),
        };

        /// <summary>Legacy lookup slug → FX id, so hand-authored SOs under Sample/Effects keep a live prefab.</summary>
        static readonly (string legacySo, string fxId)[] LegacyEffectAliases =
        {
            ("skill_generic", "eff/gjjl"),
            ("wushen",        "eff/WuShenFuTi"),
            ("awaken",        "eff/wujiangjuexing"),
        };

        /// <summary>
        /// Sprite roots that are NOT battle FX and must never become FX prefabs: general portraits, battle
        /// backdrops and window chrome are consumed directly as sprites by the UI, so baking them here would add
        /// hundreds of dead prefabs and bury the real effects.
        /// </summary>
        static readonly string[] NonFxRoots = { "army", "tacticalGeneralPicMax", "warBG", "windowBG" };

        /// <summary>Per-FX scale overrides (id prefix → scale); everything else bakes at 1.</summary>
        static readonly (string prefix, float scale)[] ScaleOverrides =
        {
            ("eff/gjjl", 1.2f), ("eff/WuShenFuTi", 1.5f), ("eff/wujiangjuexing", 1.5f),
        };

        [MenuItem("CTXD/Forge/Bake All Prefabs (.anim + controller + prefab → SO)", priority = 0)]
        public static void BakeAll()
        {
            EnsureFolders();
            var links = new List<(string prefab, string ctrl)>();
            int units = BakeUnits(links);
            int effs  = BakeEffects(links);
            BakeFloatingText();
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            // Second pass: now that every .controller GUID is committed, link it into each prefab's Animator.
            // (Assigning a just-created controller before its GUID is committed serializes as null.)
            int linked = RelinkControllers(links);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
            Debug.Log($"[AssetForge] baked {units} unit prefabs + {effs} FX prefabs (mirrored under {FxRoot}) " +
                      $"+ 1 floating-text prefab, linked {linked} controllers, assigned into SOs under {Gen}.");
        }

        static void EnsureFolders()
        {
            Folder(Gen); Folder(AnimDir); Folder(CtrlDir); Folder(PrefabDir); Folder(FxRoot);
            Folder("Assets/Ctxd/Sample"); Folder(VisualsDir); Folder(EffectsDir);
        }

        // ── UNITS ──────────────────────────────────────────────────────────────
        static int BakeUnits(List<(string, string)> links)
        {
            var ids = UnitIds("att").Intersect(UnitIds("def")).OrderBy(s => s).ToList();
            int count = 0;
            foreach (var id in ids)
            {
                var attPrefab = BakeUnitPrefab("att", id, links);
                var defPrefab = BakeUnitPrefab("def", id, links);
                if (attPrefab == null && defPrefab == null) continue;

                var vis = LoadOrCreate<UnitVisualDefinition>($"{VisualsDir}/unit_{id}.asset");
                vis.unitId = id;
                if (attPrefab != null) vis.attackUnit = attPrefab.GetComponent<UnitVisual>();
                if (defPrefab != null) vis.defenseUnit = defPrefab.GetComponent<UnitVisual>();
                EditorUtility.SetDirty(vis);
                count++;
            }
            return count;
        }

        static List<string> UnitIds(string facing)
        {
            string root = $"{ArmyRoot}/{facing}";
            if (!AssetDatabase.IsValidFolder(root)) return new List<string>();
            return AssetDatabase.GetSubFolders(root)
                .Select(Path.GetFileName)                                                     // att_10
                .Select(n => n.StartsWith(facing + "_") ? n.Substring(facing.Length + 1) : n) // 10
                .ToList();
        }

        static GameObject BakeUnitPrefab(string facing, string id, List<(string, string)> links)
        {
            string unitFolder = $"{ArmyRoot}/{facing}/{facing}_{id}";
            if (!AssetDatabase.IsValidFolder(unitFolder)) return null;

            var clips = new Dictionary<string, AnimationClip>();
            Sprite firstSprite = null, idleSprite = null;
            foreach (var a in Actions)
            {
                var frames = LoadFrames($"{unitFolder}/{a.idx}");
                if (frames.Length == 0) continue;
                firstSprite ??= frames[0];
                if (a.state == "Idle") idleSprite = frames[0];
                var clip = BuildClip(frames, a.loop, UnitFps);
                SaveAsset(clip, $"{AnimDir}/{facing}_{id}_{a.state}.anim");
                clips[a.state] = clip;
            }
            if (clips.Count == 0) return null;

            string ctrlPath = $"{CtrlDir}/{facing}_{id}.controller";
            var controller = BuildController(ctrlPath, clips, defaultState: "Idle");

            string prefabPath = $"{PrefabDir}/unit_{facing}_{id}.prefab";
            var go = new GameObject($"unit_{facing}_{id}");
            GameObject prefab;
            try
            {
                var sr = go.AddComponent<SpriteRenderer>();
                sr.sprite = idleSprite ?? firstSprite;
                var anim = go.AddComponent<Animator>();
                anim.runtimeAnimatorController = controller;   // re-linked authoritatively in RelinkControllers
                var uv = go.AddComponent<UnitVisual>();
                uv.spriteRenderer = sr;
                uv.animator = anim;
                prefab = PrefabUtility.SaveAsPrefabAsset(go, prefabPath);
            }
            finally { Object.DestroyImmediate(go); }   // temp lives in the OPEN scene — must die even on failure

            links.Add((prefabPath, ctrlPath));
            return prefab;
        }

        // ── EFFECTS / FX ───────────────────────────────────────────────────────
        /// <summary>
        /// Bakes EVERY sprite folder under <c>Assets/Resources/sprite</c> (except <c>army</c>, handled as units) into
        /// its own prefab, mirroring the source tree under <see cref="FxRoot"/>.
        /// <para>Classification rule, per folder: sprites named with a bare number (<c>1.png, 2.png…</c>) form ONE
        /// animated sequence; every other sprite becomes its own static prefab. Handling both in the same folder
        /// matters — several extracted FX ship a stray <c>tip.png</c> next to their frames, and an all-or-nothing
        /// rule would demote the whole sequence to loose stills.</para>
        /// The FX id is the source path relative to <c>sprite/</c> (e.g. <c>eff/formation/att/down/1</c>,
        /// <c>warBuff/12</c>) — that id is both the SO lookup key and the on-disk location of the prefab.
        /// </summary>
        static int BakeEffects(List<(string, string)> links)
        {
            var prefabById = new Dictionary<string, GameObject>();
            int count = 0;
            foreach (var folder in AllFolders(SpriteRoot))
            {
                if (IsNonFx(folder)) continue;
                var sprites = LoadSprites(folder);
                if (sprites.Length == 0) continue;

                string folderId = folder.Substring(SpriteRoot.Length + 1);
                var frames = sprites.Where(s => IsBareNumber(s.name)).OrderBy(s => Num(s.name)).Select(s => s.sprite).ToArray();
                if (frames.Length > 0)
                    count += BakeSequenceFx(folderId, frames, links, prefabById) ? 1 : 0;
                foreach (var s in sprites.Where(s => !IsBareNumber(s.name)))
                    count += BakeStaticFx($"{folderId}/{CleanName(s.name)}", s.sprite, prefabById) ? 1 : 0;
            }

            // Hand-authored SOs under Sample/Effects keep working: point them at the newly baked prefabs.
            foreach (var (legacySo, fxId) in LegacyEffectAliases)
            {
                var so = AssetDatabase.LoadAssetAtPath<EffectVisualDefinition>($"{EffectsDir}/{legacySo}.asset");
                if (so == null || !prefabById.TryGetValue(fxId, out var prefab)) continue;
                so.prefab = prefab;
                EditorUtility.SetDirty(so);
            }
            return count;
        }

        static bool IsNonFx(string folder)
        {
            foreach (var root in NonFxRoots)
            {
                string p = $"{SpriteRoot}/{root}";
                if (folder == p || folder.StartsWith(p + "/")) return true;
            }
            return false;
        }

        static bool BakeSequenceFx(string id, Sprite[] frames, List<(string, string)> links, Dictionary<string, GameObject> map)
        {
            if (frames.Length == 0) return false;
            Folder(ParentFolder($"{FxRoot}/{id}"));   // .anim/.controller are written before the prefab exists
            float scale = ScaleFor(id);
            float life = frames.Length / EffFps + 0.15f;

            var clip = BuildClip(frames, loop: false, EffFps);
            SaveAsset(clip, $"{FxRoot}/{id}.anim");
            string ctrlPath = $"{FxRoot}/{id}.controller";
            var controller = BuildController(ctrlPath,
                new Dictionary<string, AnimationClip> { { "Play", clip } }, defaultState: "Play");

            var go = NewFxObject(id, frames[0], scale, out var sr);
            GameObject prefab;
            try
            {
                var anim = go.AddComponent<Animator>();
                anim.runtimeAnimatorController = controller;
                var ev = go.AddComponent<EffectVisual>();
                ev.spriteRenderer = sr; ev.animator = anim; ev.lifetime = life;
                prefab = PrefabUtility.SaveAsPrefabAsset(go, $"{FxRoot}/{id}.prefab");
            }
            finally { Object.DestroyImmediate(go); }   // temp lives in the OPEN scene — must die even on failure

            links.Add(($"{FxRoot}/{id}.prefab", ctrlPath));
            map[id] = prefab;
            WriteFxDefinition(id, prefab, scale, life, animated: true);
            return true;
        }

        static bool BakeStaticFx(string id, Sprite sprite, Dictionary<string, GameObject> map)
        {
            float scale = ScaleFor(id);
            var go = NewFxObject(id, sprite, scale, out var sr);
            GameObject prefab;
            try
            {
                var ev = go.AddComponent<EffectVisual>();
                ev.spriteRenderer = sr; ev.lifetime = 0f;   // static: the caller decides when it goes away
                prefab = PrefabUtility.SaveAsPrefabAsset(go, $"{FxRoot}/{id}.prefab");
            }
            finally { Object.DestroyImmediate(go); }   // temp lives in the OPEN scene — must die even on failure

            map[id] = prefab;
            WriteFxDefinition(id, prefab, scale, 0f, animated: false);
            return true;
        }

        static GameObject NewFxObject(string id, Sprite first, float scale, out SpriteRenderer sr)
        {
            Folder(ParentFolder($"{FxRoot}/{id}"));
            var go = new GameObject("fx_" + id.Replace('/', '_'));
            if (scale > 0f) go.transform.localScale = Vector3.one * scale;
            sr = go.AddComponent<SpriteRenderer>();
            sr.sprite = first;
            sr.sortingOrder = SortingFor(id);
            return go;
        }

        static void WriteFxDefinition(string id, GameObject prefab, float scale, float life, bool animated)
        {
            var so = LoadOrCreate<EffectVisualDefinition>($"{FxRoot}/{id}.asset");
            so.kind = KindFor(id);
            so.sourceId = id;
            so.prefab = prefab;
            so.resourcesPath = $"sprite/{id}";   // documentation only; the prefab is the spawn source
            so.fps = animated ? EffFps : 0f;
            so.scale = scale;
            so.lifetime = life;
            EditorUtility.SetDirty(so);
        }

        // Ground auras must sit UNDER the troops; unit sorting is 500 − y·50 (roughly 350…650), so 100 clears it.
        static int SortingFor(string id) => id.StartsWith("eff/formation/") ? 100 : 600;

        static EffectVisualDefinition.EffectKind KindFor(string id)
        {
            if (id.StartsWith("eff/formation/")) return EffectVisualDefinition.EffectKind.Formation;
            if (id.StartsWith("eff/Arrow/"))     return EffectVisualDefinition.EffectKind.Arrow;
            if (id.StartsWith("eff/wujiangjuexing")) return EffectVisualDefinition.EffectKind.Awaken;
            if (id.StartsWith("warFeatAnger/"))  return EffectVisualDefinition.EffectKind.Anger;
            if (id.StartsWith("skill/"))         return EffectVisualDefinition.EffectKind.Skill;
            return EffectVisualDefinition.EffectKind.Misc;
        }

        static float ScaleFor(string id)
        {
            foreach (var (prefix, scale) in ScaleOverrides) if (id.StartsWith(prefix)) return scale;
            return 1f;
        }

        // ── FLOATING TEXT (damage / EXP popups are spawned too → a prefab) ───────
        static void BakeFloatingText()
        {
            var go = new GameObject("FloatingText");
            GameObject prefab;
            try
            {
                var tmp = go.AddComponent<TextMeshPro>();
                if (TMP_Settings.defaultFontAsset != null) tmp.font = TMP_Settings.defaultFontAsset;
                tmp.text = "0"; tmp.fontSize = 5; tmp.alignment = TextAlignmentOptions.Center;
                tmp.color = Color.white;
                var mr = go.GetComponent<MeshRenderer>();
                if (mr != null) mr.sortingOrder = 1000;
                var ft = go.AddComponent<FloatingText>();
                ft.label = tmp;
                prefab = PrefabUtility.SaveAsPrefabAsset(go, $"{PrefabDir}/FloatingText.prefab");
            }
            finally { Object.DestroyImmediate(go); }   // temp lives in the OPEN scene — must die even on failure

            var db = AssetDatabase.LoadAssetAtPath<CtxdGameDatabase>("Assets/Ctxd/Resources/CtxdGameDatabase.asset");
            if (db != null) { db.floatingText = prefab.GetComponent<FloatingText>(); EditorUtility.SetDirty(db); }
        }

        // ── second pass: assign committed controllers into prefabs ───────────────
        static int RelinkControllers(List<(string prefab, string ctrl)> links)
        {
            int n = 0;
            foreach (var (prefabPath, ctrlPath) in links)
            {
                var ctrl = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(ctrlPath);
                if (ctrl == null) { Debug.LogWarning($"[AssetForge] controller missing: {ctrlPath}"); continue; }
                var root = PrefabUtility.LoadPrefabContents(prefabPath);
                var anim = root.GetComponent<Animator>();
                if (anim != null)
                {
                    anim.runtimeAnimatorController = ctrl;
                    PrefabUtility.SaveAsPrefabAsset(root, prefabPath);
                    n++;
                }
                PrefabUtility.UnloadPrefabContents(root);
            }
            return n;
        }

        // ── baking primitives ────────────────────────────────────────────────────
        static AnimationClip BuildClip(Sprite[] frames, bool loop, float fps)
        {
            var clip = new AnimationClip { frameRate = fps };
            var binding = EditorCurveBinding.PPtrCurve("", typeof(SpriteRenderer), "m_Sprite");
            var keys = new ObjectReferenceKeyframe[frames.Length];
            for (int i = 0; i < frames.Length; i++)
                keys[i] = new ObjectReferenceKeyframe { time = i / fps, value = frames[i] };
            AnimationUtility.SetObjectReferenceCurve(clip, binding, keys);

            var settings = AnimationUtility.GetAnimationClipSettings(clip);
            settings.loopTime = loop;
            AnimationUtility.SetAnimationClipSettings(clip, settings);
            return clip;
        }

        static AnimatorController BuildController(string path, Dictionary<string, AnimationClip> clips, string defaultState)
        {
            AssetDatabase.DeleteAsset(path);
            var controller = AnimatorController.CreateAnimatorControllerAtPath(path);
            var sm = controller.layers[0].stateMachine;
            AnimatorState fallback = null, chosen = null;
            foreach (var kv in clips)
            {
                var st = sm.AddState(kv.Key);
                st.motion = kv.Value;
                fallback ??= st;
                if (kv.Key == defaultState) chosen = st;
            }
            sm.defaultState = chosen ?? fallback;
            EditorUtility.SetDirty(controller);
            return controller;
        }

        static Sprite[] LoadFrames(string folder)
        {
            if (!AssetDatabase.IsValidFolder(folder)) return new Sprite[0];
            var list = new List<(int n, Sprite s)>();
            foreach (var guid in AssetDatabase.FindAssets("t:Sprite", new[] { folder }))
            {
                string p = AssetDatabase.GUIDToAssetPath(guid);
                if (Path.GetDirectoryName(p).Replace('\\', '/') != folder) continue; // direct children only
                var s = AssetDatabase.LoadAssetAtPath<Sprite>(p);
                if (s != null) list.Add((Num(Path.GetFileNameWithoutExtension(p)), s));
            }
            return list.OrderBy(x => x.n).Select(x => x.s).ToArray();
        }

        /// <summary>Direct-child sprites of a folder, with their file names (unsorted).</summary>
        static (string name, Sprite sprite)[] LoadSprites(string folder)
        {
            if (!AssetDatabase.IsValidFolder(folder)) return new (string, Sprite)[0];
            var list = new List<(string, Sprite)>();
            foreach (var guid in AssetDatabase.FindAssets("t:Sprite", new[] { folder }))
            {
                string p = AssetDatabase.GUIDToAssetPath(guid);
                if (Path.GetDirectoryName(p).Replace('\\', '/') != folder) continue; // direct children only
                var s = AssetDatabase.LoadAssetAtPath<Sprite>(p);
                if (s != null) list.Add((Path.GetFileNameWithoutExtension(p), s));
            }
            return list.ToArray();
        }

        /// <summary>The folder and every folder beneath it, depth-first.</summary>
        static IEnumerable<string> AllFolders(string root)
        {
            if (!AssetDatabase.IsValidFolder(root)) yield break;
            yield return root;
            foreach (var sub in AssetDatabase.GetSubFolders(root))
            foreach (var f in AllFolders(sub))
                yield return f;
        }

        static bool IsBareNumber(string n) => !string.IsNullOrEmpty(n) && n.All(char.IsDigit);

        /// <summary>Drops the APK extraction hash suffix: <c>10_467f1de1f02e8638</c> → <c>10</c>.</summary>
        static string CleanName(string n)
            => System.Text.RegularExpressions.Regex.Replace(n ?? "", @"_[0-9a-f]{8,}$", "");

        static string ParentFolder(string assetPath)
        {
            int i = assetPath.LastIndexOf('/');
            return i <= 0 ? assetPath : assetPath.Substring(0, i);
        }

        static int Num(string n)
        {
            var m = System.Text.RegularExpressions.Regex.Match(n ?? "", @"\d+");
            return m.Success ? int.Parse(m.Value) : 0;
        }

        static void SaveAsset(Object asset, string path)
        {
            AssetDatabase.DeleteAsset(path);
            AssetDatabase.CreateAsset(asset, path);
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
