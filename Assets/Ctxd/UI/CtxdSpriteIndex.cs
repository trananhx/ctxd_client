using System.Collections.Generic;
using UnityEngine;

namespace Ctxd.UI
{
    /// <summary>
    /// Chỉ mục "tên logic → đường dẫn Resources" cho kho sprite rip (tên file có hash md5 —
    /// KHÔNG hardcode hash trong code/prefab; forge sinh asset này, runtime tra rồi LoadAll).
    /// Key dạng "warBuff/10" / "tacticalGeneralPicMax/guanyu"; ResPath dạng "sprite/warBuff/10_467f…" (không đuôi).
    /// </summary>
    public sealed class CtxdSpriteIndex : ScriptableObject
    {
        [System.Serializable]
        public struct Entry { public string Key; public string ResPath; }

        [SerializeField] private List<Entry> entries = new List<Entry>();

        private Dictionary<string, string> _lookup;

        public void SetEntries(List<Entry> e) { entries = e; _lookup = null; }
        public int Count => entries?.Count ?? 0;

        public bool TryGet(string key, out string resPath)
        {
            if (_lookup == null)
            {
                _lookup = new Dictionary<string, string>(entries.Count);
                foreach (var en in entries) if (!_lookup.ContainsKey(en.Key)) _lookup.Add(en.Key, en.ResPath);
            }
            return _lookup.TryGetValue(key, out resPath);
        }
    }
}
