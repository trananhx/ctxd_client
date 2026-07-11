using UnityEngine;
using Luzart;

namespace Ctxd.Data
{
    /// <summary>Base for all CTXD data SOs (Luzart DI lifecycle). Id falls back to the asset name.</summary>
    public abstract class CtxdDefinition : AbstractScriptableContent
    {
        public override string Id => string.IsNullOrEmpty(_id) ? name : _id;
    }

    /// <summary>Row shape used by formations (presentation/data).</summary>
    public enum RowShape { Line, Arc, Wedge, Column, Square }

    /// <summary>General quality tier (品质) — order tunable; see [[decisions/game-version-scope]].</summary>
    public enum GeneralQuality { Vang, Do, Tim, Cam, Unique, ThienMenh }
}
