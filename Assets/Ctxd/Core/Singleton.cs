using UnityEngine;

namespace Ctxd.Core
{
    /// <summary>Generic MonoBehaviour singleton (Luzart's was removed in the 2026-06-29 cleanup).</summary>
    public abstract class Singleton<T> : MonoBehaviour where T : Singleton<T>
    {
        public static T Instance { get; private set; }

        [SerializeField] protected bool _persistAcrossScenes = false;

        protected virtual void Awake()
        {
            if (Instance != null && Instance != this) { Destroy(gameObject); return; }
            Instance = (T)this;
            if (_persistAcrossScenes && transform.parent == null) DontDestroyOnLoad(gameObject);
            OnAwake();
        }

        protected virtual void OnAwake() { }
        protected virtual void OnDestroy() { if (Instance == this) Instance = null; }
    }
}
