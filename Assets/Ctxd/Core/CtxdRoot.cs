using UnityEngine;
using Luzart;
using Ctxd.Data;

namespace Ctxd.Core
{
    /// <summary>
    /// Composition root (Service Locator). Builds the Luzart <see cref="Domain"/> + EventBus, installs optional
    /// Service/Content bags, and registers the <see cref="CtxdGameDatabase"/>. Any component reaches shared
    /// systems via <c>CtxdRoot.Instance.Domain</c> / <c>.Database</c> / <c>.Events</c>.
    /// </summary>
    public sealed class CtxdRoot : Singleton<CtxdRoot>
    {
        [SerializeField] private CtxdGameDatabase _database;
        [SerializeField] private ServiceBag[] _serviceBags;
        [SerializeField] private ContentBag[] _contentBags;

        public IDomain Domain { get; private set; }
        public BroadcastService Events { get; private set; }
        public CtxdGameDatabase Database => _database;

        protected override void OnAwake()
        {
            // Keep the loop ticking when the Editor/app is not focused (so battles play through during automation).
            Application.runInBackground = true;

            if (_database == null) _database = Resources.Load<CtxdGameDatabase>("CtxdGameDatabase");

            Domain = new Domain();
            Events = new BroadcastService();
            Domain.AddService(Events);

            if (_serviceBags != null && _serviceBags.Length > 0)
            {
                var sm = new ServiceManager(Domain);
                sm.InstallBags(_serviceBags);
                sm.InitializeAndStart();
            }

            if (_database != null)
            {
                _database.BuildIndex(true);
                Domain.Add(_database);
            }
            else Debug.LogWarning("[CtxdRoot] No CtxdGameDatabase (assign one or place at Resources/CtxdGameDatabase).");

            if (_contentBags != null && _contentBags.Length > 0)
            {
                var cm = new ContentManager(Domain);
                cm.InstallBags(_contentBags);
                cm.InitializeAndStart();
            }
        }
    }
}
