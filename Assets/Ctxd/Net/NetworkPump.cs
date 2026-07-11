using UnityEngine;

namespace Ctxd.Net
{
    /// <summary>
    /// Drains the <see cref="NetworkService"/> inbound queue on the main thread every frame, so server messages
    /// are delivered to subscribers on Unity's thread. The service reference is WIRED IN THE EDITOR (by the scene
    /// forge) — no runtime lookup (no FindObjectOfType / service locator).
    /// </summary>
    [DisallowMultipleComponent]
    public sealed class NetworkPump : MonoBehaviour
    {
        [SerializeField] private NetworkService _service;
        public NetworkService Service { get => _service; set => _service = value; }

        private void Update()
        {
            if (_service != null) _service.Pump();
        }
    }
}
