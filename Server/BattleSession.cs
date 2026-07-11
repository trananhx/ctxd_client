using System;
using System.Collections.Generic;
using Ctxd.Battle.Sim;
using Ctxd.Battle.Sim.Net;

namespace Ctxd.Server
{
    /// <summary>
    /// One battle, server-authoritative. Owns the <see cref="BattleRunner"/> + RNG; the client never has a copy.
    /// Handles the round FSM (Begin/Step) and the 10 TEST APIs, returning the event log to broadcast.
    /// </summary>
    public sealed class BattleSession
    {
        private readonly BattleConfig _cfg;
        private readonly Terrain _terrain;
        private readonly BattleRunner _runner;
        private readonly List<Combatant> _offReserve, _defReserve;
        private int _reinforcements;

        // Fallback so even a general with no authored tactic can "use skill" for the TEST panel.
        private static readonly TacticSpec DefaultTactic = new TacticSpec
        { Id = "strike", DisplayName = "Cường Kích", Kind = TacticEffectKind.Damage, RowsHit = 2, Power = 1.4 };

        public BattleSession(BattleSetup setup)
        {
            _cfg = setup.Config ?? new BattleConfig();
            _terrain = setup.Terrain;
            _offReserve = setup.OffenseReserve;
            _defReserve = setup.DefenseReserve;
            _runner = new BattleRunner(setup, new AutoBrain());
        }

        private BattleState St => _runner.State;
        public bool IsOver => _runner.IsOver;
        public BattleOutcome Outcome => _runner.Outcome;
        public BattleSnapshot Snapshot() => BattleSnapshot.From(St);

        public List<BattleEvent> Begin() => _runner.Begin();
        public List<BattleEvent> Step(TurnInput input) => _runner.StepRound(input);

        /// <summary>Pre-battle lineup: reorder the offense queue by a permutation. No-op if not a valid full permutation.</summary>
        public void ReorderOffense(IList<int> order)
        {
            if (order == null || order.Count == 0) return;
            var q = St.Offense.Queue;
            if (order.Count != q.Count) return;
            var seen = new bool[q.Count];
            foreach (var i in order) { if (i < 0 || i >= q.Count || seen[i]) return; seen[i] = true; }
            var reordered = new List<Combatant>(q.Count);
            foreach (var i in order) reordered.Add(q[i]);
            q.Clear(); q.AddRange(reordered);
        }

        // ── TEST API (右側 "API CHIẾN ĐẤU (TEST)" — 10 nút) ──────────────────────
        public List<BattleEvent> TestApi(TestApiKind kind, Faction side)
        {
            var ev = new List<BattleEvent>();
            if (_runner.IsOver) { ev.Add(Info("Trận đã kết thúc.")); return ev; }
            St.Offense.AdvanceToNextLiving();
            St.Defense.AdvanceToNextLiving();

            switch (kind)
            {
                case TestApiKind.KillRow:    KillRow(ev, side); break;
                case TestApiKind.KillRandom: KillRandom(ev, side); break;
                case TestApiKind.UseSkill:   UseSkill(ev, side); break;
                case TestApiKind.AddUnit:    AddUnit(ev, side); break;
                case TestApiKind.Attack:     Attack(ev, side); break;
            }
            return ev;
        }

        // ── kill APIs: `side` is the VICTIM side (e.g. "Kill hàng 1 DEF") ─────────
        private void KillRow(List<BattleEvent> ev, Faction side)
        {
            var victim = St.Side(side).Active;
            if (victim == null) return;
            var front = victim.FrontRow;
            int rowSoldiers = front != null ? front.Soldiers : victim.Troops;  // exactly clears the front row
            int killed = CombatOps.ApplyDamageToFront(victim, rowSoldiers, St.Round, ev);
            EmitKill(ev, side, victim, killed, rows: 1);
            PostMutate(ev, side, victim);
        }

        private void KillRandom(List<BattleEvent> ev, Faction side)
        {
            var victim = St.Side(side).Active;
            if (victim == null || victim.Troops <= 0) return;
            int lo = Math.Max(1, victim.Troops / 10);
            int hi = Math.Max(lo + 1, victim.Troops / 2);
            int killed = CombatOps.ApplyDamageToFront(victim, _runner.Rng.Range(lo, hi), St.Round, ev); // [~10%, 50%)
            EmitKill(ev, side, victim, killed, rows: 0);
            PostMutate(ev, side, victim);
        }

        // ── actor APIs: `side` is the ACTOR side (e.g. "Dùng skill DEF") ──────────
        private void UseSkill(List<BattleEvent> ev, Faction side)
        {
            var actor = St.Side(side).Active;
            var target = St.Enemy(side).Active;
            if (actor == null || target == null) return;
            var tactic = actor.Skill2 ?? actor.Skill1 ?? DefaultTactic;
            bool awakened = actor.Awakened && tactic.IsAwakening;

            ev.Add(new BattleEvent
            {
                Round = St.Round, Type = BattleEventType.SkillCast, Side = side,
                ActorId = actor.Id, TargetId = target.Id, TacticId = tactic.Id, TacticName = tactic.DisplayName,
                Effect = tactic.Kind, Awakened = awakened,
                Text = $"{actor.DisplayName} thi triển {tactic.DisplayName}{(awakened ? " (Giác Tỉnh)" : "")}",
            });

            // Resolve through the shared tactic pipeline → Damage(+Confusion/Pushback/…) events. Numbers stay on server.
            TacticEffects.Get(tactic.Kind).Apply(new TacticContext
            {
                Actor = actor, Target = target, Tactic = tactic, Awakened = awakened,
                StanceMult = 1.0, Terrain = _terrain, Round = St.Round, Rng = _runner.Rng, Cfg = _cfg, Events = ev,
            });
            actor.Morale = _cfg.MoraleAfterTacticReset;

            if (!target.Alive) EmitExp(ev, Other(side), target, target.MaxTroops / 6);
            PostMutate(ev, Other(side), target);
        }

        private void Attack(List<BattleEvent> ev, Faction side)
        {
            var actor = St.Side(side).Active;
            var target = St.Enemy(side).Active;
            if (actor == null || target == null) return;
            int dmg = CombatOps.BasicDamage(actor, target, 1.0, _terrain, _cfg, _runner.Rng, out bool crit);
            int killed = CombatOps.ApplyDamageToFront(target, dmg, St.Round, ev);
            CombatOps.GainMorale(actor, _cfg.MoraleOnDealDamage, _cfg, St.Round, ev);
            ev.Add(new BattleEvent
            {
                Round = St.Round, Type = BattleEventType.Attack, Side = side,
                ActorId = actor.Id, TargetId = target.Id, Amount = killed, Crit = crit,
                ActorTroopsAfter = actor.Troops, TargetTroopsAfter = target.Troops, ActorMoraleAfter = actor.Morale,
                Text = $"{actor.DisplayName} đánh {target.DisplayName}",
            });
            if (!target.Alive) EmitExp(ev, Other(side), target, target.MaxTroops / 8);
            PostMutate(ev, Other(side), target);
        }

        private void AddUnit(List<BattleEvent> ev, Faction side)
        {
            var sideState = St.Side(side);
            var reserve = side == Faction.Offense ? _offReserve : _defReserve;
            Combatant c;
            if (reserve != null && reserve.Count > 0)
            {
                // Mượn Binh (借兵): add the STRONGEST reserve general to the queue end.
                int best = 0;
                for (int i = 1; i < reserve.Count; i++) if (Power(reserve[i]) > Power(reserve[best])) best = i;
                c = reserve[best]; reserve.RemoveAt(best);
                c.Faction = side;
                if (c.MaxTroops <= 0) c.MaxTroops = Math.Max(1, c.Troops);
                c.Morale = c.FiveStar ? _cfg.MoraleFull : _cfg.MoraleStart;
                if (!c.HasFormation) c.Formation.AddRange(FormationBuilder.Uniform(c.Rows, _cfg.GroupsPerRow, c.Troop, c.MaxTroops));
                c.SyncTroops();
            }
            else c = MakeReinforcement(side, ++_reinforcements);

            sideState.Queue.Add(c);  // 借兵: reinforcement joins the END of the queue.
            ev.Add(new BattleEvent
            {
                Round = St.Round, Type = BattleEventType.UnitAdded, Side = side,
                ActorId = c.Id, Count = 1, Amount = c.Troops, ActorTroopsAfter = c.Troops,
                Text = $"Viện binh: {c.DisplayName} ({c.Troops} quân)",
            });
        }

        private static double Power(Combatant c) => c.MaxTroops + (c.Stats.NormalAtk + c.Stats.TacticAtk) * 5.0;

        private Combatant MakeReinforcement(Faction side, int n)
        {
            int troops = 4000 + _runner.Rng.Range(0, 4000);
            var c = new Combatant
            {
                Id = $"{(side == Faction.Offense ? "off" : "def")}_reinf_{n}",
                DefId = "reinforcement",
                DisplayName = $"Viện Binh {n}",
                Faction = side,
                Troop = (TroopType)_runner.Rng.Range(0, 5),
                Stats = new GeneralStats(440, 250, 400, 230, 60, 0.05),
                MaxTroops = troops, Troops = troops, Rows = 4,
                Morale = _cfg.MoraleStart,
            };
            c.Formation.AddRange(FormationBuilder.Uniform(4, 3, c.Troop, troops));
            c.SyncTroops();
            return c;
        }

        // ── shared helpers ───────────────────────────────────────────────────────
        private void EmitKill(List<BattleEvent> ev, Faction victimSide, Combatant victim, int killed, int rows)
        {
            int exp = Math.Max(1, killed / 8);
            ev.Add(new BattleEvent
            {
                Round = St.Round, Type = BattleEventType.UnitKilled, Side = victimSide,
                ActorId = victim.Id, Amount = killed, Count = rows, Exp = exp,
                ActorTroopsAfter = victim.Troops, TargetTroopsAfter = victim.Troops,
                Text = $"{victim.DisplayName} −{killed} quân",
            });
            EmitExp(ev, victimSide, victim, exp);
        }

        private void EmitExp(List<BattleEvent> ev, Faction at, Combatant over, int exp)
        {
            exp = Math.Max(1, exp);
            ev.Add(new BattleEvent
            {
                Round = St.Round, Type = BattleEventType.ExpPopup, Side = at,
                ActorId = over.Id, Exp = exp, Amount = exp, Text = $"+{exp} EXP",
            });
        }

        /// <summary>After a TEST mutation, emit defeat/engage/end events the runner would normally produce.</summary>
        private void PostMutate(List<BattleEvent> ev, Faction victimSide, Combatant victim)
        {
            if (victim != null && !victim.Alive)
            {
                ev.Add(new BattleEvent
                {
                    Round = St.Round, Type = BattleEventType.GeneralDefeated, Side = victimSide,
                    ActorId = victim.Id, Text = $"{victim.DisplayName} bị đánh bại",
                });
                St.Side(victimSide).AdvanceToNextLiving();
                var off = St.Offense.Active; var def = St.Defense.Active;
                if (St.Offense.HasLiving && St.Defense.HasLiving && off != null && def != null)
                    ev.Add(new BattleEvent
                    {
                        Round = St.Round, Type = BattleEventType.GeneralEngage,
                        ActorId = off.Id, TargetId = def.Id, Text = $"{off.DisplayName} vs {def.DisplayName}",
                    });
            }
            CheckEnd(ev);
        }

        private void CheckEnd(List<BattleEvent> ev)
        {
            if (St.Outcome != BattleOutcome.Ongoing) return;
            bool o = St.Offense.HasLiving, d = St.Defense.HasLiving;
            BattleOutcome outcome =
                (!o && !d) ? BattleOutcome.Draw :
                (!d) ? BattleOutcome.OffenseWins :
                (!o) ? BattleOutcome.DefenseWins : BattleOutcome.Ongoing;
            if (outcome == BattleOutcome.Ongoing) return;
            St.Outcome = outcome;
            ev.Add(new BattleEvent
            {
                Round = St.Round, Type = BattleEventType.BattleEnd, Outcome = outcome,
                Text = outcome switch
                {
                    BattleOutcome.OffenseWins => "Phe Công chiến thắng!",
                    BattleOutcome.DefenseWins => "Phe Thủ chiến thắng!",
                    _ => "Bất phân thắng bại",
                },
            });
        }

        private BattleEvent Info(string text)
            => new BattleEvent { Round = St.Round, Type = BattleEventType.Banner, Text = text };

        private static Faction Other(Faction f) => f == Faction.Offense ? Faction.Defense : Faction.Offense;
    }
}
