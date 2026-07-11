using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using Luzart;
using Ctxd.Core;
using Ctxd.Data;
using Ctxd.Net;
using Ctxd.Battle;

namespace Ctxd.EditorTools
{
    /// <summary>
    /// Builds the complete server-driven battle scene and AUTO-WIRES every reference in the Editor (reflection on the
    /// real serialized fields). Runtime code does no Find/locator lookups. One menu = full end-to-end.
    /// </summary>
    public static class ServerSceneForge
    {
        const string NetDir = "Assets/Ctxd/Sample/Net";
        const string NsPath = NetDir + "/NetworkService.asset";
        const string BagPath = NetDir + "/CtxdServiceBag.asset";
        const string DbPath = "Assets/Ctxd/Resources/CtxdGameDatabase.asset";
        const string ScenePath = "Assets/Ctxd/Scenes/BattleServer.unity";

        [MenuItem("CTXD/Server/Build Server Battle Scene (UI + wiring)", priority = 50)]
        public static void Build()
        {
            Folder(NetDir);
            var ns = LoadOrCreate<NetworkService>(NsPath);
            var bag = LoadOrCreate<ServiceBag>(BagPath);
            Set(bag, "services", new List<AbstractScriptableService> { ns });
            EditorUtility.SetDirty(bag);

            var db = AssetDatabase.LoadAssetAtPath<CtxdGameDatabase>(DbPath);
            if (db == null) { Debug.LogError("[ServerSceneForge] No CtxdGameDatabase — run CTXD ▸ Build Everything first."); return; }

            var registry = UIForge.BuildAll();
            AssetDatabase.SaveAssets();

            var scene = EditorSceneManager.NewScene(NewSceneSetup.EmptyScene, NewSceneMode.Single);

            // Camera
            var camGo = new GameObject("Main Camera", typeof(Camera)); camGo.tag = "MainCamera";
            var cam = camGo.GetComponent<Camera>();
            cam.orthographic = true; cam.orthographicSize = 4.2f; cam.transform.position = new Vector3(0, 0, -10);
            cam.clearFlags = CameraClearFlags.SolidColor; cam.backgroundColor = new Color(0.13f, 0.27f, 0.16f);

            // Battlefield background (warBG), scaled to fill the camera view.
            var bgSprite = LoadFirstSprite("Assets/Resources/sprite/warBG");
            if (bgSprite != null)
            {
                var bgGo = new GameObject("Background", typeof(SpriteRenderer));
                var bsr = bgGo.GetComponent<SpriteRenderer>();
                bsr.sprite = bgSprite; bsr.sortingOrder = -200;
                float viewH = cam.orthographicSize * 2f, viewW = viewH * 16f / 9f;
                var sz = bgSprite.bounds.size;
                if (sz.x > 0 && sz.y > 0) bgGo.transform.localScale = new Vector3(viewW / sz.x, viewH / sz.y, 1f) * 1.05f;
                bgGo.transform.position = new Vector3(0, 0, 5);
            }

            // EventSystem (new Input System if present, else legacy)
            var esGo = new GameObject("EventSystem", typeof(EventSystem));
            var moduleType = Type.GetType("UnityEngine.InputSystem.UI.InputSystemUIInputModule, Unity.InputSystem");
            if (moduleType != null) esGo.AddComponent(moduleType); else esGo.AddComponent<StandaloneInputModule>();

            // UIManager canvas + 6 lane roots
            var uiManager = BuildUIManager(registry);

            // CtxdRoot (Domain + ServiceBag lifecycle)
            var root = new GameObject("CtxdRoot").AddComponent<CtxdRoot>();
            Set(root, "_database", db);
            Set(root, "_serviceBags", new[] { bag });
            EditorUtility.SetDirty(root);

            // NetworkPump (drains the SAME NetworkService instance, wired directly)
            var pump = new GameObject("NetworkPump").AddComponent<NetworkPump>();
            Set(pump, "_service", ns);
            EditorUtility.SetDirty(pump);

            // ServerBattleDirector — all collaborators wired (no runtime lookup)
            var dir = new GameObject("ServerBattleDirector").AddComponent<ServerBattleDirector>();
            Set(dir, "database", db);
            Set(dir, "network", ns);
            Set(dir, "uiManager", uiManager);
            EditorUtility.SetDirty(dir);

            Folder("Assets/Ctxd/Scenes");
            EditorSceneManager.MarkSceneDirty(scene);
            EditorSceneManager.SaveScene(scene, ScenePath);
            RegisterScene(ScenePath);
            Debug.Log($"[ServerSceneForge] {ScenePath} built + fully wired. Start the server, then Play.");
        }

        static UIManager BuildUIManager(UIRegistrySO registry)
        {
            var go = new GameObject("UICanvas", typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
            var canvas = go.GetComponent<Canvas>();
            canvas.renderMode = RenderMode.ScreenSpaceOverlay; canvas.sortingOrder = 100;
            var scaler = go.GetComponent<CanvasScaler>();
            scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(1920, 1080); scaler.matchWidthOrHeight = 0.5f;

            var mgr = go.AddComponent<UIManager>();

            RectTransform Lane(string n)
            {
                var l = new GameObject(n, typeof(RectTransform));
                var rt = (RectTransform)l.transform;
                rt.SetParent(go.transform, false);
                rt.anchorMin = Vector2.zero; rt.anchorMax = Vector2.one; rt.offsetMin = Vector2.zero; rt.offsetMax = Vector2.zero;
                return rt;
            }
            var wo = Lane("WorldOverlay"); var sc = Lane("Screen"); var hud = Lane("Hud");
            var pop = Lane("Popup"); var sys = Lane("System"); var toast = Lane("Toast");

            Set(mgr, "registry", registry);
            Set(mgr, "worldOverlayRoot", wo); Set(mgr, "screenRoot", sc); Set(mgr, "hudRoot", hud);
            Set(mgr, "popupRoot", pop); Set(mgr, "systemRoot", sys); Set(mgr, "toastRoot", toast);
            Set(mgr, "preloadOnStart", false);
            EditorUtility.SetDirty(mgr);
            return mgr;
        }

        // ── reflection wiring (Editor only) ──────────────────────────────────────
        static void Set(object target, string field, object value)
        {
            var t = target.GetType();
            FieldInfo f = null;
            while (t != null && f == null)
            {
                f = t.GetField(field, BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
                t = t.BaseType;
            }
            if (f == null) { Debug.LogError($"[ServerSceneForge] field '{field}' not found on {target.GetType().Name}"); return; }
            f.SetValue(target, value);
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

        static void RegisterScene(string scenePath)
        {
            var list = EditorBuildSettings.scenes.ToList();
            if (list.Any(s => s.path == scenePath)) return;
            list.Add(new EditorBuildSettingsScene(scenePath, true));
            EditorBuildSettings.scenes = list.ToArray();
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
