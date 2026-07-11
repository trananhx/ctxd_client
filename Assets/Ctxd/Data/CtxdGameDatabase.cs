using System.Collections.Generic;
using UnityEngine;
using Luzart;

namespace Ctxd.Data
{
    /// <summary>
    /// Registry SO of all CTXD definitions (id → def). Populated by the asset generator + designer, indexed at
    /// init, registered in the Domain. Lives under Resources so the bootstrap can Resources.Load it.
    /// </summary>
    [CreateAssetMenu(menuName = "CTXD/Game Database", fileName = "CtxdGameDatabase")]
    public sealed class CtxdGameDatabase : AbstractScriptableContent
    {
        public List<GeneralDefinition> generals = new List<GeneralDefinition>();
        public List<TroopTypeDefinition> troopTypes = new List<TroopTypeDefinition>();
        public List<TacticDefinition> tactics = new List<TacticDefinition>();
        public List<FormationDefinition> formations = new List<FormationDefinition>();
        public List<UnitVisualDefinition> unitVisuals = new List<UnitVisualDefinition>();
        public List<EffectVisualDefinition> effectVisuals = new List<EffectVisualDefinition>();
        public List<BattleBackgroundDefinition> backgrounds = new List<BattleBackgroundDefinition>();
        public BattleConfigDefinition battleConfig;
        public Ctxd.Visual.FloatingText floatingText;   // damage/EXP number prefab (typed → no runtime GetComponent); baked by AssetForge

        private readonly Dictionary<string, GeneralDefinition> _generals = new Dictionary<string, GeneralDefinition>();
        private readonly Dictionary<string, TacticDefinition> _tactics = new Dictionary<string, TacticDefinition>();
        private readonly Dictionary<string, FormationDefinition> _formations = new Dictionary<string, FormationDefinition>();
        private readonly Dictionary<string, UnitVisualDefinition> _unitVisuals = new Dictionary<string, UnitVisualDefinition>();
        private readonly Dictionary<string, EffectVisualDefinition> _effectVisuals = new Dictionary<string, EffectVisualDefinition>();
        private bool _indexed;

        public override string Id => string.IsNullOrEmpty(_id) ? name : _id;
        protected override void DoInitialize() => BuildIndex();

        public void BuildIndex(bool force = false)
        {
            if (_indexed && !force) return;
            Index(_generals, generals, g => g != null ? g.Id : null);
            Index(_tactics, tactics, t => t != null ? t.Id : null);
            Index(_formations, formations, f => f != null ? f.Id : null);
            IndexUnit();
            IndexEffect();
            _indexed = true;
        }

        private static void Index<T>(Dictionary<string, T> map, List<T> list, System.Func<T, string> key)
        {
            map.Clear();
            if (list == null) return;
            foreach (var item in list) { var k = key(item); if (!string.IsNullOrEmpty(k)) map[k] = item; }
        }

        private void IndexUnit()
        {
            _unitVisuals.Clear();
            if (unitVisuals == null) return;
            foreach (var u in unitVisuals)
            {
                if (u == null) continue;
                if (!string.IsNullOrEmpty(u.Id)) _unitVisuals[u.Id] = u;
                if (!string.IsNullOrEmpty(u.unitId)) _unitVisuals[u.unitId] = u;
            }
        }

        private void IndexEffect()
        {
            _effectVisuals.Clear();
            if (effectVisuals == null) return;
            foreach (var e in effectVisuals)
            {
                if (e == null) continue;
                if (!string.IsNullOrEmpty(e.Id)) _effectVisuals[e.Id] = e;
                if (!string.IsNullOrEmpty(e.sourceId)) _effectVisuals[e.sourceId] = e;
            }
        }

        public GeneralDefinition GetGeneral(string id) => Lookup(_generals, id);
        public TacticDefinition GetTactic(string id) => Lookup(_tactics, id);
        public FormationDefinition GetFormation(string id) => Lookup(_formations, id);
        public UnitVisualDefinition GetUnitVisual(string id) => Lookup(_unitVisuals, id);
        public EffectVisualDefinition GetEffectVisual(string id) => Lookup(_effectVisuals, id);

        private T Lookup<T>(Dictionary<string, T> map, string id) where T : class
        {
            if (string.IsNullOrEmpty(id)) return null;
            if (!_indexed) BuildIndex();
            return map.TryGetValue(id, out var v) ? v : null;
        }

        public Battle.Sim.BattleConfig ResolveConfig()
            => battleConfig != null ? battleConfig.ToConfig() : new Battle.Sim.BattleConfig();

        /// <summary>Resolve a troop type → its on-field unit visual (SO holding the prefab). Falls back to the first visual.</summary>
        public UnitVisualDefinition GetVisualForTroop(Battle.Sim.TroopType troop)
        {
            if (troopTypes != null)
                foreach (var tt in troopTypes)
                    if (tt != null && tt.troopType == troop && tt.unitVisual != null) return tt.unitVisual;
            return (unitVisuals != null && unitVisuals.Count > 0) ? unitVisuals[0] : null;
        }
    }
}
