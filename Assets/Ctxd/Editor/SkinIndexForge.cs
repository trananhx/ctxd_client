using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;
using Ctxd.UI;

namespace Ctxd.EditorTools
{
    /// <summary>
    /// Sinh CtxdSpriteIndex.asset (tên logic → path Resources, giải hash md5 trong tên file rip)
    /// + tra Sprite bake-time cho UIForge (gán thẳng reference vào prefab, không cần index lúc chạy).
    /// </summary>
    public static class SkinIndexForge
    {
        const string SpriteRoot = "Assets/Resources/sprite";
        const string AssetPath = "Assets/Ctxd/Resources/CtxdSpriteIndex.asset";
        static readonly Regex Hash = new Regex("_[0-9a-f]{16}$");
        // warBG: chỉ file phẳng (images/ là bitmap font chữ số, không phải phong cảnh). Mục khác quét đệ quy.
        static readonly (string folder, bool recurse)[] Folders =
        {
            ("tacticalGeneralPicMax", true), ("warBuff", true), ("warSkillName", true),
            ("warFeatAnger", true), ("warState", true), ("warvsicon", true),
            ("windowBG", true), ("warBG", false),
        };

        [MenuItem("CTXD/Forge/Build Sprite Index")]
        public static void BuildMenu() { var so = Build(); Debug.Log($"[SkinIndexForge] {so.Count} entries → {AssetPath}"); }

        public static CtxdSpriteIndex Build()
        {
            var entries = new List<CtxdSpriteIndex.Entry>();
            foreach (var (folder, recurse) in Folders)
            {
                string abs = SpriteRoot + "/" + folder;
                if (!AssetDatabase.IsValidFolder(abs)) { Debug.LogWarning($"[SkinIndexForge] thiếu {abs}"); continue; }
                var files = Directory.EnumerateFiles(abs, "*.*", recurse ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly)
                    .Where(p => p.EndsWith(".png") || p.EndsWith(".jpg"))
                    .Select(p => p.Replace('\\', '/'))
                    .OrderBy(p => p, System.StringComparer.Ordinal);
                foreach (var f in files)
                {
                    string noExt = f.Substring(0, f.LastIndexOf('.'));
                    string key = folder + "/" + Hash.Replace(Path.GetFileName(noExt), "");
                    string resPath = noExt.Substring(noExt.IndexOf("Resources/") + "Resources/".Length);
                    entries.Add(new CtxdSpriteIndex.Entry { Key = key, ResPath = resPath });
                }
            }
            var so = AssetDatabase.LoadAssetAtPath<CtxdSpriteIndex>(AssetPath);
            if (so == null) { so = ScriptableObject.CreateInstance<CtxdSpriteIndex>(); AssetDatabase.CreateAsset(so, AssetPath); }
            so.SetEntries(entries);
            EditorUtility.SetDirty(so);
            AssetDatabase.SaveAssets();
            return so;
        }

        /// <summary>Bake-time: tìm Sprite theo prefix tên file trong 1 thư mục dưới sprite/ (vd ("eff/Recruit","1")).</summary>
        public static Sprite FindSprite(string folderUnderSprite, string prefix)
        {
            string dir = SpriteRoot + "/" + folderUnderSprite;
            foreach (var guid in AssetDatabase.FindAssets("t:Sprite", new[] { dir }))
            {
                string p = AssetDatabase.GUIDToAssetPath(guid);
                string name = Path.GetFileNameWithoutExtension(p);
                if (name == prefix || name.StartsWith(prefix + "_"))
                    return AssetDatabase.LoadAssetAtPath<Sprite>(p);
            }
            Debug.LogWarning($"[SkinIndexForge] không thấy sprite {folderUnderSprite}/{prefix}");
            return null;
        }
    }
}
