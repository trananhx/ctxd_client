using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;
using Luzart;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.UI
{
    /// <summary>Payload for the TEST panel: the callback a button invokes (wired to the server-driven director).</summary>
    public sealed class TestApiPanelData
    {
        public System.Action<TestApiKind, SideRef> OnTest;
    }

    /// <summary>
    /// "API CHIẾN ĐẤU (TEST)" — 10 buttons (5 kinds × ATT/DEF). Each button's (kind, side) and Button reference are
    /// SERIALIZED and wired by the Editor forge; on click it forwards to <see cref="TestApiPanelData.OnTest"/>.
    /// No runtime Find/GetComponent.
    /// </summary>
    public sealed class TestApiPanelUI : UIBase<TestApiPanelData>
    {
        [System.Serializable]
        public struct ApiButton
        {
            public Button button;
            public TestApiKind kind;
            public SideRef side;
        }

        [SerializeField] private ApiButton[] _buttons;

        public override UniTask OnCreateAsync(UIContext ctx, CancellationToken ct)
        {
            if (_buttons != null)
                foreach (var entry in _buttons)
                {
                    if (entry.button == null) continue;
                    var kind = entry.kind;
                    var side = entry.side;
                    entry.button.onClick.AddListener(() => Data?.OnTest?.Invoke(kind, side));
                }
            return UniTask.CompletedTask;
        }
    }
}
