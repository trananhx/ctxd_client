using System;
using System.Collections.Generic;
using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.AddressableAssets;
using UnityEngine.ResourceManagement.AsyncOperations;

namespace Luzart
{
    /// <summary>
    /// IUIAssetProvider dung Unity Addressables. Load prefab UI theo UIConfig.AddressKey (address string).
    ///
    /// PORTABILITY: file nay nam trong assembly LuzartUI.Addressables co
    ///   defineConstraints = ["LUZART_ADDRESSABLES"] + versionDefines map com.unity.addressables.
    /// => Unity TU dat define khi co package; project KHONG co Addressables -> assembly bi loai khoi
    ///    compile hoan toan (khong loi, khong warning). Khong can #if, khong can script editor.
    ///
    /// Load qua address string (khong dung AssetReferenceGameObject) de UIConfig (o core assembly)
    /// khong phai tham chieu type cua Addressables.
    /// </summary>
    public class AddressableUIAssetProvider : IUIAssetProvider
    {
        private class CacheEntry
        {
            public AsyncOperationHandle<GameObject> Handle;
            public int RefCount;
            public bool IsValid => Handle.IsValid();
        }

        private readonly Dictionary<UIId, CacheEntry> cache = new Dictionary<UIId, CacheEntry>();

        public async UniTask<GameObject> LoadAsync(UIConfig config, CancellationToken ct)
        {
            if (config == null)
                throw new ArgumentNullException(nameof(config));
            if (string.IsNullOrEmpty(config.AddressKey))
                throw new InvalidOperationException(
                    $"[LuzartUI] UIConfig {config.Id} chua co AddressKey. Dien Addressable address vao " +
                    "field AddressKey trong UIRegistrySO, hoac tat useAddressables de dung DirectPrefab.");

            ct.ThrowIfCancellationRequested();

            // Cache hit: tang refcount, return prefab da load (khong load lai).
            if (cache.TryGetValue(config.Id, out var entry) && entry.IsValid)
            {
                // Handle dang chay (2 ShowAsync coalesced o tang asset) -> await chung handle.
                if (!entry.Handle.IsDone)
                {
                    await entry.Handle.ToUniTask(cancellationToken: ct);
                    if (entry.Handle.Status == AsyncOperationStatus.Failed)
                    {
                        var ex = entry.Handle.OperationException;
                        ReleaseEntry(config.Id, entry);
                        throw BuildLoadException(config, ex);
                    }
                }
                entry.RefCount++;
                return entry.Handle.Result;
            }

            // Cache miss: tao handle moi.
            var handle = Addressables.LoadAssetAsync<GameObject>(config.AddressKey);
            entry = new CacheEntry { Handle = handle, RefCount = 1 };
            cache[config.Id] = entry;

            try
            {
                await handle.ToUniTask(cancellationToken: ct);
            }
            catch (OperationCanceledException)
            {
                // Cancel giua chung -> dung de cache giu handle leak.
                ReleaseEntry(config.Id, entry);
                throw;
            }

            if (handle.Status != AsyncOperationStatus.Succeeded || handle.Result == null)
            {
                var ex = handle.OperationException;
                ReleaseEntry(config.Id, entry);
                throw BuildLoadException(config, ex);
            }

            return handle.Result;
        }

        public void Release(UIConfig config)
        {
            if (config == null) return;
            if (!cache.TryGetValue(config.Id, out var entry)) return;

            entry.RefCount--;
            if (entry.RefCount > 0) return;

            ReleaseEntry(config.Id, entry);
        }

        public async UniTask<long> GetDownloadSizeAsync(UIConfig config, CancellationToken ct)
        {
            if (config == null || string.IsNullOrEmpty(config.AddressKey)) return 0L;
            ct.ThrowIfCancellationRequested();

            // Handle cua GetDownloadSizeAsync la refcounted -> caller PHAI Release.
            var handle = Addressables.GetDownloadSizeAsync(config.AddressKey);
            try
            {
                return await handle.ToUniTask(cancellationToken: ct);
            }
            finally
            {
                if (handle.IsValid())
                    Addressables.Release(handle);
            }
        }

        public async UniTask PreloadAsync(UIConfig config, IProgress<float> progress, CancellationToken ct)
        {
            if (config == null || string.IsNullOrEmpty(config.AddressKey))
            {
                progress?.Report(1f);
                return;
            }
            ct.ThrowIfCancellationRequested();

            // autoReleaseHandle:true -> download handle tu release sau khi xong (chi tai dependency,
            // khong giu instance; LoadAsync se load asset that sau).
            var handle = Addressables.DownloadDependenciesAsync(config.AddressKey, autoReleaseHandle: true);
            await handle.ToUniTask(progress: progress, cancellationToken: ct);
            // Chot tick cuoi = 1f (khi 0 dependency / hoan thanh truoc poll dau tien cua UniTask).
            progress?.Report(1f);
        }

        public async UniTask PreloadByLabelAsync(string label, IProgress<float> progress, CancellationToken ct)
        {
            if (string.IsNullOrEmpty(label))
            {
                progress?.Report(1f);
                return;
            }
            ct.ThrowIfCancellationRequested();

            var handle = Addressables.DownloadDependenciesAsync((object)label, autoReleaseHandle: true);
            await handle.ToUniTask(progress: progress, cancellationToken: ct);
            progress?.Report(1f);
        }

        /// <summary>Force release toan bo handle dang cache. Goi khi unload scene / game reset / OnDestroy.</summary>
        public void ReleaseAll()
        {
            foreach (var kv in cache)
            {
                if (kv.Value.IsValid)
                    Addressables.Release(kv.Value.Handle);
            }
            cache.Clear();
        }

        private void ReleaseEntry(UIId id, CacheEntry entry)
        {
            if (entry != null && entry.IsValid)
                Addressables.Release(entry.Handle);
            cache.Remove(id);
        }

        private static InvalidOperationException BuildLoadException(UIConfig config, Exception inner)
        {
            return new InvalidOperationException(
                $"[LuzartUI] Addressables load that bai cho UI {config.Id} (address='{config.AddressKey}'). " +
                "Kiem tra entry da duoc mark Addressable va build content chua.", inner);
        }
    }

    /// <summary>
    /// Tu dang ky AddressableUIAssetProvider vao UIManager.AddressableProviderFactory luc khoi dong.
    /// Chay TRUOC moi Awake (BeforeSceneLoad). Vi class nay nam trong assembly LuzartUI.Addressables
    /// (chi ton tai khi co package Addressables), core UIManager khong phai tham chieu truc tiep type
    /// Addressable -> giu core doc lap voi package.
    /// </summary>
    internal static class AddressableUIProviderBootstrap
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        private static void Register()
        {
            UIManager.AddressableProviderFactory = () => new AddressableUIAssetProvider();
        }
    }
}
