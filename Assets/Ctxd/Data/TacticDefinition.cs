using System.Collections.Generic;
using UnityEngine;
using Ctxd.Battle.Sim;

namespace Ctxd.Data
{
    /// <summary>A tactic / 战法. Authored once; consumed by the sim (<see cref="ToSpec"/>) + presentation. GDD §3.4/§8.</summary>
    [CreateAssetMenu(menuName = "CTXD/Tactic", fileName = "Tactic")]
    public sealed class TacticDefinition : CtxdDefinition
    {
        public string displayName;
        public TacticEffectKind kind = TacticEffectKind.Damage;
        [Range(1, 6)] public int rowsHit = 1;
        public float power = 1.0f;

        [Header("Awakening (觉醒)")]
        public bool isAwakening;
        public float fixedPower;

        [Header("Effect params")]
        public int confusionTurns = 1;
        public int pushbackTroops;

        [Header("Rule Program (bật để dùng rule-engine data-driven; tắt = giữ Kind legacy)")]
        public bool useRuleProgram = false;
        public List<RuleStepAuthoring> ruleSteps = new List<RuleStepAuthoring>();

        [Header("Presentation")]
        public EffectVisualDefinition castEffect; // skill/att|def VFX
        public Sprite nameBanner;                 // warSkillName
        public Sprite casterPortrait;

        public TacticSpec ToSpec()
        {
            var spec = new TacticSpec
            {
                Id = Id,
                DisplayName = string.IsNullOrEmpty(displayName) ? name : displayName,
                Kind = useRuleProgram ? TacticEffectKind.Rule : kind,
                RowsHit = rowsHit,
                Power = power,
                IsAwakening = isAwakening,
                FixedPower = fixedPower,
                ConfusionTurns = confusionTurns,
                PushbackTroops = pushbackTroops,
                SkillAnimId = castEffect != null ? castEffect.sourceId : null,
                NameBannerId = nameBanner != null ? nameBanner.name : null,
            };
            if (useRuleProgram && ruleSteps != null && ruleSteps.Count > 0)
            {
                spec.Program = new TacticProgram();
                foreach (var s in ruleSteps) if (s != null) spec.Program.Steps.Add(s.ToRuleStep());
            }
            return spec;
        }
    }
}
