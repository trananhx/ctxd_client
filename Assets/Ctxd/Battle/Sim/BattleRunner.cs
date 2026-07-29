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
        // [2A] registry chiến pháp id→spec cho chuỗi nextTacticId (per-battle, không global).
        private readonly System.Collections.Generic.Dictionary<string, TacticSpec> _tactics = new System.Collections.Generic.Dictionary<string, TacticSpec>();
        public bool IsOver => State.Outcome != BattleOutcome.Ongoing;
        public BattleOutcome Outcome => State.Outcome;

        public BattleRunner(BattleSetup setup, IBattleBrain defenseBrain = null)
        {
            _cfg = setup.Config ?? new BattleConfig();
            Rng = new DeterministicRng(setup.Seed);
            DefenseBrain = defenseBrain ?? new AutoBrain();
            State.Terrain = setup.Terrain;
            State.MoraleFull = _cfg.MoraleFull;   // luồng ngưỡng nộ tunable xuống snapshot/AI (không hardcode 100).
            State.Offense = BuildSide(Faction.Offense, setup.OffenseLineup, setup.OffenseNation);
            State.Defense = BuildSide(Faction.Defense, setup.DefenseLineup, setup.DefenseNation);
            if (State.Terrain == Terrain.City && _cfg.EnableCityTower)   // [2E] trụ tên phe Thủ (gated City)
                State.Defense.Tower = setup.DefenseTower ?? new Tower
                {
                    Blood = _cfg.CityTowerBlood, MaxBlood = _cfg.CityTowerBlood,
                    AttackPeriod = _cfg.CityTowerPeriod, NextAttackRound = _cfg.CityTowerPeriod, ShootPower = _cfg.CityTowerShootPower,
                };
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
                    c.Formation.AddRange(FormationBuilder.Uniform(c.Rows, _cfg.GroupsPerRow, c.Troop, c.MaxTroops, c.Style));
                c.SyncTroops();
                side.Queue.Add(c);
                RegisterTactic(c.Skill1); RegisterTactic(c.Skill2);   // [2A] cho chuỗi nextTacticId
                if (c.Skill2Variants != null) foreach (var v in c.Skill2Variants) RegisterTactic(v);   // [2C]
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
            UpdateSurround(ev);                                 // [2D] vây + phong toả TRƯỚC hành động
            HandleDefeats(ev); if (CheckEnd(ev)) return ev;     // slam có thể giết tướng / kết thúc trận
            UpdateCityTower(ev);                                // [2E] trụ tên bắn + phá trụ (gated City)
            HandleDefeats(ev); if (CheckEnd(ev)) return ev;
            var off = State.Offense.Active;
            var def = State.Defense.Active;
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.RoundBegin });
            EmitVariantOffer(ev, Faction.Offense, off);   // [2C] report27 stub (chỉ khi tướng có biến thể địa hình)

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

            // [2A] beHold: nếu CẢ HAI cùng thả chiến pháp lượt này, bên 计策 cao hơn hoá giải bên kia (trừ awakened).
            int firstHold = 0, secondHold = 0;
            if (WantsCast(first, firstInput) && WantsCast(second, secondInput))
                ResolveBeHold(first, firstInput, second, secondInput, out firstHold, out secondHold);

            PerformAction(first, second, firstInput, firstMult, firstHold, ev);
            if (first.Alive && second.Alive) PerformAction(second, first, secondInput, secondMult, secondHold, ev);

            Decrement(off); Decrement(def);
            DecrementEffects(State.Offense); DecrementEffects(State.Defense);   // [FX] FX bền: giảm hiệp, bỏ hết hạn
            HandleDefeats(ev);
            CheckEnd(ev);
            return ev;
        }

        private void PerformAction(Combatant actor, Combatant target, TurnInput input, double stanceMult, int beHold, List<BattleEvent> ev)
        {
            if (!actor.Alive || !target.Alive) return;
            // RE: nộ cast THỦ CÔNG — chỉ thả khi useAble (đủ nộ + có skill2 + không hỗn loạn) VÀ người chơi bấm (input.Cast).
            bool useAble = actor.UseAble(_cfg.MoraleFull) && !(_cfg.SurroundBlocksCast && State.Side(actor.Faction).Surrounded);   // [2D] bị vây → cấm cast
            if (useAble && input.Cast)
            {
                if (beHold != 0)   // [2A] chiến pháp bị hoá giải (report14 beHold)
                {
                    ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.TacticHeld, Side = actor.Faction,
                        ActorId = actor.Id, TargetId = target.Id, BeHold = beHold,
                        Text = $"Chiến pháp của {actor.DisplayName} bị hoá giải" });
                    if (beHold >= 2)   // phản chiến (2/3): chiến pháp bị bật NGƯỢC lên chính actor (không đánh thường)
                    {
                        int refl = System.Math.Max(1, (int)System.Math.Round(actor.Stats.TacticAtk * (actor.Skill2 != null ? actor.Skill2.Power : 1.0) * 0.5));
                        CombatOps.ApplyDamageToFront(actor, refl, State.Round, ev);
                        ev.Add(CombatOps.DamageEvent(State.Round, target, actor, refl, false, TacticEffectKind.Damage));
                    }
                    else BasicAttack(actor, target, stanceMult, ev);   // đỡ/didang (1): vẫn đánh thường
                    actor.Morale = _cfg.MoraleAfterTacticReset;         // [FIX review] lượt nộ BỊ TIÊU dù bị hoá giải → không kẹt vòng
                    return;
                }
                bool awakened = input.Awaken && actor.Awakened;
                var variant = actor.Skill2ForTerrain(State.Terrain);   // [2C] biến thể khớp địa hình (fallback Skill2)
                bool luanwu = actor.LuanwuTurns > 0;
                CastTacticChain(actor, target, variant, stanceMult, awakened, luanwu, ev);
                actor.Morale = _cfg.MoraleAfterTacticReset;
            }
            else BasicAttack(actor, target, stanceMult, ev);
        }

        private bool WantsCast(Combatant c, TurnInput input) => c != null && c.Alive && c.UseAble(_cfg.MoraleFull) && input.Cast
            && !(_cfg.SurroundBlocksCast && State.Side(c.Faction).Surrounded);

        // [2D] Cập nhật trạng thái bao vây + sát thương phong toả định kỳ (không tiêu RNG → determinism-safe).
        private void UpdateSurround(List<BattleEvent> ev)
        {
            UpdateSideSurround(State.Offense, State.Defense, ev);
            UpdateSideSurround(State.Defense, State.Offense, ev);
        }

        private void UpdateSideSurround(SideState me, SideState enemy, List<BattleEvent> ev)
        {
            if (_cfg.SurroundRatio <= 0.0) return;
            int myT = me.TotalTroops, enT = enemy.TotalTroops;
            bool shouldSurround = myT > 0 && enT >= _cfg.SurroundRatio * myT;
            if (shouldSurround && !me.Surrounded)
            {
                me.Surrounded = true; me.SurroundSince = State.Round; me.SlamCd = _cfg.SurroundSlamPeriod;
                ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.SurroundBegin, Side = me.Faction, Text = $"{me.Nation} bị bao vây!" });
            }
            else if (!shouldSurround && me.Surrounded)
            {
                me.Surrounded = false; me.SlamCd = 0;
                ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.SurroundEnd, Side = me.Faction, Text = $"{me.Nation} thoát vòng vây" });
            }
            if (!me.Surrounded) return;
            if (--me.SlamCd > 0) return;
            me.SlamCd = _cfg.SurroundSlamPeriod;
            var active = me.Active;
            if (active == null || !active.Alive) return;
            int dmg = System.Math.Max(1, (int)System.Math.Round(active.Troops * _cfg.SurroundSlamPct));
            int killed = CombatOps.ApplyDamageToFront(active, dmg, State.Round, ev);
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.SurroundSlam, Side = me.Faction, ActorId = active.Id,
                Amount = killed, TargetTroopsAfter = active.Troops, Text = $"{active.DisplayName} chịu sát thương bao vây (-{killed})" });
        }

        // [2E] Trụ tên: phe Công phá độ bền mỗi hiệp; trụ bắn phe Công active định kỳ (không tiêu RNG).
        private void UpdateCityTower(List<BattleEvent> ev)
        {
            var tower = State.Defense.Tower;
            if (tower == null || !tower.Alive) return;
            int before = tower.Blood;
            tower.Blood = System.Math.Max(0, tower.Blood - _cfg.CityTowerBreakPerRound);
            if (before != tower.Blood)
                ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.TowerBreak, Side = Faction.Offense,
                    Amount = before - tower.Blood, Count = tower.Blood, Text = $"Phá trụ tên (-{before - tower.Blood}, còn {tower.Blood})" });
            if (!tower.Alive)
            {
                ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.TowerBreak, Side = Faction.Offense, Count = 0, Text = "Trụ tên bị phá huỷ!" });
                return;
            }
            if (State.Round >= tower.NextAttackRound)
            {
                tower.NextAttackRound = State.Round + System.Math.Max(1, tower.AttackPeriod);
                var target = State.Offense.Active;
                if (target != null && target.Alive)
                {
                    int killed = CombatOps.TowerShoot(target, tower.ShootPower, State.Round, ev);
                    ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.TowerShoot, Side = Faction.Defense,
                        ActorId = target.Id, Amount = killed, TargetTroopsAfter = target.Troops, Text = $"Trụ tên bắn {target.DisplayName} (-{killed})" });
                }
            }
            else
                ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.TowerCountdown, Side = Faction.Defense,
                    Count = tower.NextAttackRound - State.Round, Text = $"Trụ tên: {tower.NextAttackRound - State.Round} hiệp nữa" });
        }

        // [2A] Bên 计策 (Strategy) cao hơn hoá giải chiến pháp bên kia khi CẢ HAI cùng cast. Awakened không thể bị giữ.
        private void ResolveBeHold(Combatant a, TurnInput ai, Combatant b, TurnInput bi, out int aHold, out int bHold)
        {
            aHold = 0; bHold = 0;
            bool aAwak = ai.Awaken && a.Awakened;
            bool bAwak = bi.Awaken && b.Awakened;
            double gap = a.Stats.Strategy - b.Stats.Strategy;
            if (gap >= _cfg.BeHoldReflectStrategyGap && !bAwak) bHold = gap >= 2 * _cfg.BeHoldReflectStrategyGap ? 2 : 1;
            else if (-gap >= _cfg.BeHoldReflectStrategyGap && !aAwak) aHold = -gap >= 2 * _cfg.BeHoldReflectStrategyGap ? 2 : 1;
        }

        private void RegisterTactic(TacticSpec t) { if (t != null && !string.IsNullOrEmpty(t.Id)) _tactics[t.Id] = t; }
        private TacticSpec LookupTactic(string id) => id != null && _tactics.TryGetValue(id, out var t) ? t : null;

        // [2A] Chuỗi chiến pháp: cast gốc rồi lần theo NextTacticId (suy giảm sát thương mỗi mắt xích; chống vòng lặp).
        private void CastTacticChain(Combatant actor, Combatant target, TacticSpec tactic, double stanceMult, bool awakened, bool luanwu, List<BattleEvent> ev)
        {
            var t = tactic;
            int depth = 0;
            var seen = new HashSet<string>();
            while (t != null && depth < _cfg.MaxTacticChain && actor.Alive && target.Alive)
            {
                if (!string.IsNullOrEmpty(t.Id) && !seen.Add(t.Id)) break;   // đã cast id này trong chuỗi → dừng
                double chainMult = depth == 0 ? 1.0 : System.Math.Pow(_cfg.ChainPowerDecay, depth);
                CastOne(actor, target, t, stanceMult, awakened, luanwu, chainMult, depth, ev);
                if (t.GrantsLuanwu) actor.LuanwuTurns = System.Math.Max(actor.LuanwuTurns, 2);
                if (string.IsNullOrEmpty(t.NextTacticId)) break;
                t = LookupTactic(t.NextTacticId);
                depth++;
            }
        }

        private void CastOne(Combatant actor, Combatant target, TacticSpec tactic, double stanceMult, bool awakened, bool luanwu, double chainMult, int depth, List<BattleEvent> ev)
        {
            ev.Add(new BattleEvent
            {
                Round = State.Round, Type = depth == 0 ? BattleEventType.TacticCast : BattleEventType.TacticChain, Side = actor.Faction,
                ActorId = actor.Id, TargetId = target.Id, TacticId = tactic.Id, TacticName = tactic.DisplayName,
                Effect = tactic.Kind, Awakened = awakened, ChainDepth = depth,
                NextTacticId = tactic.NextTacticId, NextTacticName = LookupTactic(tactic.NextTacticId)?.DisplayName,
                Text = depth == 0 ? $"{actor.DisplayName} thi triển {tactic.DisplayName}{(awakened ? " (Giác Tỉnh)" : "")}"
                                  : $"→ liên hoàn: {tactic.DisplayName}",
            });
            TacticEffects.Get(tactic.Kind).Apply(new TacticContext
            {
                Actor = actor, Target = target, Tactic = tactic, Awakened = awakened, StanceMult = stanceMult,
                Terrain = State.Terrain, Round = State.Round, Rng = Rng, Cfg = _cfg, Events = ev, State = State,
                ChainMult = chainMult, LuanwuActive = luanwu,
            });
        }

        private void BasicAttack(Combatant actor, Combatant target, double stanceMult, List<BattleEvent> ev)
        {
            int dmg = CombatOps.BasicDamage(actor, target, stanceMult, State.Terrain, _cfg, Rng, out bool crit, out bool miss);
            int killed = miss ? 0 : CombatOps.ApplyDamageToFront(target, dmg, State.Round, ev, _cfg);
            if (!miss)   // [2A] né → không sát thương, không tích nộ đòn đó
            {
                CombatOps.GainMorale(actor, _cfg.MoraleOnDealDamage, _cfg, State.Round, ev);
                CombatOps.GainMorale(target, _cfg.MoraleOnTakeDamage, _cfg, State.Round, ev);
            }
            ev.Add(new BattleEvent { Round = State.Round, Type = BattleEventType.Attack, Side = actor.Faction,
                ActorId = actor.Id, TargetId = target.Id, Amount = killed, Crit = crit, Miss = miss,
                ActorTroopsAfter = actor.Troops, TargetTroopsAfter = target.Troops, ActorMoraleAfter = actor.Morale,
                Text = miss ? $"{target.DisplayName} NÉ đòn của {actor.DisplayName}" : $"{actor.DisplayName} đánh {target.DisplayName}" });
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

        // [2C] report27 stub: chào bảng biến thể chiến pháp theo địa hình cho tướng active — CHỈ khi tướng CÓ biến thể (0 drift).
        private void EmitVariantOffer(List<BattleEvent> ev, Faction side, Combatant c)
        {
            if (c == null || c.Skill2 == null || c.Skill2Variants == null || c.Skill2Variants.Count == 0) return;
            var opts = new List<TacticSpec> { c.Skill2 };
            foreach (var v in c.Skill2Variants) { if (opts.Count >= 3) break; if (v != null) opts.Add(v); }
            int recommend = -1;
            for (int i = 0; i < opts.Count; i++)
                if (opts[i].TerrainTag.HasValue && opts[i].TerrainTag.Value == State.Terrain) { recommend = i + 1; break; }
            ev.Add(new BattleEvent
            {
                Round = State.Round, Type = BattleEventType.TacticVariantOffer, Side = side, ActorId = c.Id,
                VariantId1 = opts.Count > 0 ? opts[0].Id : null,
                VariantId2 = opts.Count > 1 ? opts[1].Id : null,
                VariantId3 = opts.Count > 2 ? opts[2].Id : null,
                VariantRecommend = recommend, StrategyUseAble = c.UseAble(_cfg.MoraleFull),
                Text = $"Chọn chiến pháp theo địa hình {State.Terrain}",
            });
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
        private static void Decrement(Combatant c) { if (c == null) return; if (c.ConfusedTurns > 0) c.ConfusedTurns--; if (c.LuanwuTurns > 0) c.LuanwuTurns--; }

        /// <summary>[FX] Giảm hiệp mọi FX bền của phe, gỡ khi về 0; UntilRemoved (&lt;0) sống tới khi server chủ động gỡ.</summary>
        private static void DecrementEffects(SideState s)
        {
            if (s == null) return;
            for (int i = s.Effects.Count - 1; i >= 0; i--)
            {
                var e = s.Effects[i];
                if (e.UntilRemoved) continue;
                if (--e.RemainingRounds <= 0) s.Effects.RemoveAt(i);
            }
        }
    }
}
