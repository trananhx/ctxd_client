using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>
    /// Deterministic battle engine (turn FSM). Build from a <see cref="BattleSetup"/>, then drive one round
    /// at a time with <see cref="StepRound"/> (offense input from player, defense from a brain). Each call
    /// returns the events to play back. Unity-free; tactic effects resolved via the <see cref="TacticEffects"/>
    /// Strategy registry, combat math via <see cref="CombatOps"/>.
    /// </summary>
    public sealed class BattleRunner
    {
        public readonly BattleState State = new BattleState();
        public readonly DeterministicRng Rng;
        public IBattleBrain DefenseBrain;

        private readonly BattleConfig _cfg;
        public bool IsOver => State.Outcome != BattleOutcome.Ongoing;
        public BattleOutcome Outcome => State.Outcome;

        public BattleRunner(BattleSetup setup, IBattleBrain defenseBrain = null)
        {
            _cfg = setup.Config ?? new BattleConfig();
            Rng = new DeterministicRng(setup.Seed);
            DefenseBrain = defenseBrain ?? new AutoBrain();
            State.Terrain = setup.Terrain;
            State.Offense = BuildSide(Faction.Offense, setup.OffenseLineup, setup.OffenseNation);
            State.Defense = BuildSide(Faction.Defense, setup.DefenseLineup, setup.DefenseNation);
        }

        private SideState BuildSide(Faction f, List<Combatant> lineup, string nation)
        {
            var side = new SideState { Faction = f, Nation = nation };
            foreach (var c in lineup)
            {
                c.Faction = f;
                if (c.MaxTroops <= 0) c.MaxTroops = System.Math.Max(1, c.Troops);
                if (c.Troops <= 0) c.Troops = c.MaxTroops;
                c.Morale = c.FiveStar ? _cfg.MoraleFull : _cfg.MoraleStart;
                if (!c.HasFormation)
                    c.Formation.AddRange(FormationBuilder.Uniform(c.Rows, _cfg.GroupsPerRow, c.Troop, c.MaxTroops));
                c.SyncTroops();
                side.Queue.Add(c);
            }
            return side;
        }

        public List<BattleEvent> Begin()
        {
            var ev = new List<BattleEvent>();
            State.Offense.AdvanceToNextLiving();
            State.Defense.AdvanceToNextLiving();
            ev.Add(new BattleEvent { Round = 0, Type = BattleEventType.BattleStart,
                Text = $"{State.Offense.Nation} (Công) vs {State.Defense.Nation} (Thủ) — {State.Terrain}" });
            EmitEngage(ev, State.Offense.Active, State.Defense.Active);
            return ev;
        }

        public List<BattleEvent> StepRound(TurnInput offenseInput)
        {
            var ev = new List<BattleEvent>();
            if (IsOver) return ev;
            State.Offense.AdvanceToNextLiving();
            State.Defense.AdvanceToNextLiving();
            if (CheckEnd(ev)) return ev;

            State.Round++;
            var off = State.Offense.Active;
            var def = State.Defense.Active;
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.RoundBegin });

            var defInput = DefenseBrain.Decide(State, Faction.Defense, Rng);
            RecordStance(off, offenseInput.Stance);
            RecordStance(def, defInput.Stance);
            ev.Add(StanceEvent(Faction.Offense, off, offenseInput.Stance));
            ev.Add(StanceEvent(Faction.Defense, def, defInput.Stance));

            int clash = StanceRules.Compare(offenseInput.Stance, defInput.Stance);
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.StanceClash, Side = Faction.Offense,
                Stance = offenseInput.Stance, TargetStance = defInput.Stance, Amount = clash,
                Text = clash == 0 ? "Hòa thế" : (clash > 0 ? "Công thắng thế" : "Thủ thắng thế") });

            double offMult = CombatOps.StanceMult(clash, _cfg);
            double defMult = CombatOps.StanceMult(-clash, _cfg);
            bool offenseFirst = clash > 0 || (clash == 0 && off.Stats.Strategy >= def.Stats.Strategy);

            var first = offenseFirst ? off : def;
            var second = offenseFirst ? def : off;
            var firstInput = offenseFirst ? offenseInput : defInput;
            var secondInput = offenseFirst ? defInput : offenseInput;
            double firstMult = offenseFirst ? offMult : defMult;
            double secondMult = offenseFirst ? defMult : offMult;

            PerformAction(first, second, firstInput, firstMult, ev);
            if (first.Alive && second.Alive) PerformAction(second, first, secondInput, secondMult, ev);

            Decrement(off); Decrement(def);
            HandleDefeats(ev);
            CheckEnd(ev);
            return ev;
        }

        private void PerformAction(Combatant actor, Combatant target, TurnInput input, double stanceMult, List<BattleEvent> ev)
        {
            if (!actor.Alive || !target.Alive) return;
            bool moraleReady = actor.Morale >= _cfg.MoraleFull && actor.Skill2 != null;
            if (moraleReady && !actor.Confused)
            {
                bool awakened = input.Awaken && actor.Awakened;
                CastTactic(actor, target, actor.Skill2, stanceMult, awakened, ev);
                actor.Morale = _cfg.MoraleAfterTacticReset;
            }
            else BasicAttack(actor, target, stanceMult, ev);
        }

        private void CastTactic(Combatant actor, Combatant target, TacticSpec tactic, double stanceMult, bool awakened, List<BattleEvent> ev)
        {
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.TacticCast, Side = actor.Faction,
                ActorId = actor.Id, TargetId = target.Id, TacticId = tactic.Id, TacticName = tactic.DisplayName,
                Effect = tactic.Kind, Awakened = awakened,
                Text = $"{actor.DisplayName} thi triển {tactic.DisplayName}{(awakened ? " (Giác Tỉnh)" : "")}" });

            TacticEffects.Get(tactic.Kind).Apply(new TacticContext
            {
                Actor = actor, Target = target, Tactic = tactic, Awakened = awakened, StanceMult = stanceMult,
                Terrain = State.Terrain, Round = State.Round, Rng = Rng, Cfg = _cfg, Events = ev,
            });
        }

        private void BasicAttack(Combatant actor, Combatant target, double stanceMult, List<BattleEvent> ev)
        {
            int dmg = CombatOps.BasicDamage(actor, target, stanceMult, State.Terrain, _cfg, Rng, out bool crit);
            int killed = CombatOps.ApplyDamageToFront(target, dmg, State.Round, ev);
            CombatOps.GainMorale(actor, _cfg.MoraleOnDealDamage, _cfg, State.Round, ev);
            CombatOps.GainMorale(target, _cfg.MoraleOnTakeDamage, _cfg, State.Round, ev);
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.Attack, Side = actor.Faction,
                ActorId = actor.Id, TargetId = target.Id, Amount = killed, Crit = crit,
                ActorTroopsAfter = actor.Troops, TargetTroopsAfter = target.Troops, ActorMoraleAfter = actor.Morale,
                Text = $"{actor.DisplayName} đánh {target.DisplayName}" });
        }

        private void HandleDefeats(List<BattleEvent> ev)
        {
            var off = State.Offense.Active;
            var def = State.Defense.Active;
            bool offDead = off != null && !off.Alive;
            bool defDead = def != null && !def.Alive;
            if (!offDead && !defDead) return;

            if (offDead && def != null && def.Alive) CombatOps.GainMorale(def, _cfg.MoraleOnKillGeneral, _cfg, State.Round, ev);
            if (defDead && off != null && off.Alive) CombatOps.GainMorale(off, _cfg.MoraleOnKillGeneral, _cfg, State.Round, ev);

            if (offDead) { ev.Add(Defeated(Faction.Offense, off)); State.Offense.AdvanceToNextLiving(); }
            if (defDead) { ev.Add(Defeated(Faction.Defense, def)); State.Defense.AdvanceToNextLiving(); }

            var no = State.Offense.Active; var nd = State.Defense.Active;
            if (no != null && nd != null && State.Offense.HasLiving && State.Defense.HasLiving) EmitEngage(ev, no, nd);
        }

        private BattleEvent Defeated(Faction side, Combatant c) => new BattleEvent
        {
            Round = State.Round, Type = BattleEventType.GeneralDefeated, Side = side, ActorId = c.Id,
            Text = $"{c.DisplayName} bị đánh bại",
        };

        private void EmitEngage(List<BattleEvent> ev, Combatant off, Combatant def)
        {
            if (off == null || def == null) return;
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.GeneralEngage,
                ActorId = off.Id, TargetId = def.Id, Text = $"{off.DisplayName} vs {def.DisplayName}" });
        }

        private bool CheckEnd(List<BattleEvent> ev)
        {
            if (State.Outcome != BattleOutcome.Ongoing) return true;
            bool o = State.Offense.HasLiving, d = State.Defense.HasLiving;
            if (!o && !d) State.Outcome = BattleOutcome.Draw;
            else if (!d) State.Outcome = BattleOutcome.OffenseWins;
            else if (!o) State.Outcome = BattleOutcome.DefenseWins;
            else if (State.Round >= _cfg.MaxRounds)
            {
                int to = State.Offense.TotalTroops, td = State.Defense.TotalTroops;
                State.Outcome = to > td ? BattleOutcome.OffenseWins : (td > to ? BattleOutcome.DefenseWins : BattleOutcome.Draw);
            }
            else return false;
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.BattleEnd, Outcome = State.Outcome, Text = OutcomeText(State.Outcome) });
            return true;
        }

        private static string OutcomeText(BattleOutcome o) => o switch
        {
            BattleOutcome.OffenseWins => "Phe Công chiến thắng!",
            BattleOutcome.DefenseWins => "Phe Thủ chiến thắng!",
            BattleOutcome.Draw => "Bất phân thắng bại",
            _ => "",
        };

        private void RecordStance(Combatant c, Stance s) { if (c != null) { c.LastStance = s; c.HasLastStance = true; } }
        private BattleEvent StanceEvent(Faction side, Combatant c, Stance s) => new BattleEvent
            { Round = State.Round, Type = BattleEventType.StanceChosen, Side = side, ActorId = c?.Id, Stance = s };
        private static void Decrement(Combatant c) { if (c != null && c.ConfusedTurns > 0) c.ConfusedTurns--; }
    }
}
