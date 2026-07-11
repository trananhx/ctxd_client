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
        const string ArmyRoot   = "Assets/Resources/sprite/army";
        const string EffRoot    = "Assets/Resources/sprite/eff";
        const string Gen        = "Assets/Ctxd/Generated";
        const string AnimDir    = Gen + "/Anim";
        const string CtrlDir    = Gen + "/Controllers";
        const string PrefabDir  = Gen + "/Prefabs";
        const string VisualsDir = "Assets/Ctxd/Sample/Visuals";
        const string EffectsDir = "Assets/Ctxd/Sample/Effects";

        const float UnitFps = 12f;
        const float EffFps  = 16f;

        // action subfolder index → (Animator state name, loop)
        static readonly (int idx, string state, bool loop)[] Actions =
        {
            (1, "Idle", true), (2, "Move", true), (3, "Attack", false), (4, "Hurt", false), (5, "Die", false),
        };

        // effect sprite folder → (lookup sourceId, SO asset file name, scale, lifetime)
        static readonly (string res, string sourceId, string assetKey, float scale, float life)[] Effects =
        {
            ("gjjl",           "skill_generic",  "skill_generic", 1.2f, 1.1f),
            ("WuShenFuTi",     "wushen",         "wushen",        1.5f, 1.5f),
            ("wujiangjuexing", "wujiangjuexing", "awaken",        1.5f, 1.5f),
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
            Debug.Log($"[AssetForge] baked {units} unit prefabs + {effs} effect prefabs + 1 floating-text prefab, " +
                      $"linked {linked} controllers, assigned into SOs under {Gen}.");
        }

        static void EnsureFolders()
        {
            Folder(Gen); Folder(AnimDir); Folder(CtrlDir); Folder(PrefabDir);
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

            var go = new GameObject($"unit_{facing}_{id}");
            var sr = go.AddComponent<SpriteRenderer>();
            sr.sprite = idleSprite ?? firstSprite;
            var anim = go.AddComponent<Animator>();
            anim.runtimeAnimatorController = controller;   // re-linked authoritatively in RelinkControllers
            var uv = go.AddComponent<UnitVisual>();
            uv.spriteRenderer = sr;
            uv.animator = anim;

            string prefabPath = $"{PrefabDir}/unit_{facing}_{id}.prefab";
            var prefab = PrefabUtility.SaveAsPrefabAsset(go, prefabPath);
            Object.DestroyImmediate(go);
            links.Add((prefabPath, ctrlPath));
            return prefab;
        }

        // ── EFFECTS ────────────────────────────────────────────────────────────
        static int BakeEffects(List<(string, string)> links)
        {
            int count = 0;
            foreach (var e in Effects)
            {
                var frames = LoadFrames($"{EffRoot}/{e.res}");
                if (frames.Length == 0) { Debug.LogWarning($"[AssetForge] no frames at {EffRoot}/{e.res}"); continue; }

                var clip = BuildClip(frames, loop: false, EffFps);
                SaveAsset(clip, $"{AnimDir}/eff_{e.sourceId}.anim");
                string ctrlPath = $"{CtrlDir}/eff_{e.sourceId}.controller";
                var controller = BuildController(ctrlPath,
                    new Dictionary<string, AnimationClip> { { "Play", clip } }, defaultState: "Play");

                var go = new GameObject($"fx_{e.sourceId}");
                if (e.scale > 0f) go.transform.localScale = Vector3.one * e.scale;
                var sr = go.AddComponent<SpriteRenderer>();
                sr.sprite = frames[0];
                sr.sortingOrder = 600;   // above units (~400), below floating text (1000)
                var anim = go.AddComponent<Animator>();
                anim.runtimeAnimatorController = controller;
                var ev = go.AddComponent<EffectVisual>();
                ev.spriteRenderer = sr; ev.animator = anim; ev.lifetime = e.life;

                string prefabPath = $"{PrefabDir}/fx_{e.sourceId}.prefab";
                var prefab = PrefabUtility.SaveAsPrefabAsset(go, prefabPath);
                Object.DestroyImmediate(go);
                links.Add((prefabPath, ctrlPath));

                var so = LoadOrCreate<EffectVisualDefinition>($"{EffectsDir}/{e.assetKey}.asset");
                so.sourceId = e.sourceId;
                so.prefab = prefab;
                so.resourcesPath = $"sprite/eff/{e.res}"; // documentation only; prefab is the spawn source
                so.fps = EffFps; so.scale = e.scale; so.lifetime = e.life;
                EditorUtility.SetDirty(so);
                count++;
            }
            return count;
        }

        // ── FLOATING TEXT (damage / EXP popups are spawned too → a prefab) ───────
        static void BakeFloatingText()
        {
            var go = new GameObject("FloatingText");
            var tmp = go.AddComponent<TextMeshPro>();
            if (TMP_Settings.defaultFontAsset != null) tmp.font = TMP_Settings.defaultFontAsset;
            tmp.text = "0"; tmp.fontSize = 5; tmp.alignment = TextAlignmentOptions.Center;
            tmp.color = Color.white;
            var mr = go.GetComponent<MeshRenderer>();
            if (mr != null) mr.sortingOrder = 1000;
            var ft = go.AddComponent<FloatingText>();
            ft.label = tmp;

            var prefab = PrefabUtility.SaveAsPrefabAsset(go, $"{PrefabDir}/FloatingText.prefab");
            Object.DestroyImmediate(go);

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
