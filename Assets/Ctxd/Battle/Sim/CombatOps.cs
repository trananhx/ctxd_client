using System;
using System.Collections.Generic;

namespace Ctxd.Battle.Sim
{
    /// <summary>Shared combat math + mutations, used by both the resolver (basic attacks) and tactic effects.</summary>
    public static class CombatOps
    {
        public static int Clamp(int v, int lo, int hi) => v < lo ? lo : (v > hi ? hi : v);

        /// <summary>Apply damage to a combatant. Routes through the formation (front-row depletion) when present.</summary>
        public static int ApplyDamageRaw(Combatant target, int amount) => ApplyDamageToFront(target, amount, 0, null);

        /// <summary>
        /// Deal <paramref name="amount"/> damage to the target's FRONT living row (spread across its living groups,
        /// front group first). A group at 0 soldiers dies (<see cref="BattleEventType.GroupKilled"/>); when the whole
        /// front row is cleared it is removed and the next advances (<see cref="BattleEventType.RowAdvanced"/>) — any
        /// overkill spills into the new front row. Returns total soldiers killed. Falls back to a flat pool if the
        /// combatant has no formation. <paramref name="ev"/> may be null (no events emitted).
        /// </summary>
        public static int ApplyDamageToFront(Combatant target, int amount, int round, List<BattleEvent> ev)
        {
            if (amount < 0) amount = 0;
            if (!target.HasFormation)
            {
                if (amount > target.Troops) amount = target.Troops;
                target.Troops -= amount;
                return amount;
            }

            int remaining = amount, killed = 0;
            while (remaining > 0)
            {
                var row = target.FrontRow;
                if (row == null) break;
                int rowIndex = target.Formation.IndexOf(row);

                // 递进击杀 ("giết từng cụm HÀNG một"): sát thương rải ĐỀU theo tỉ lệ trên CẢ hàng đầu, nên
                // các nhóm trong hàng hao cùng nhau và TAN NGUYÊN HÀNG một lượt — KHÔNG chết lẻ từng nhóm rồi mới tới nhóm sau.
                int rowSoldiers = row.Soldiers;                                    // > 0 (FrontRow luôn còn sống)
                int hitRow = remaining < rowSoldiers ? remaining : rowSoldiers;    // không vượt máu hàng
                SpreadEven(row.Groups, hitRow);                                    // rải ĐỀU theo tỉ lệ máu (đã tách hàm dùng chung)
                remaining -= hitRow; killed += hitRow;

                if (!row.Alive)
                {
                    if (ev != null)
                    {
                        foreach (var g in row.Groups)                              // cả hàng tan cùng lúc
                            ev.Add(new BattleEvent { Round = round, Type = BattleEventType.GroupKilled, Side = target.Faction,
                                ActorId = target.Id, Amount = g.MaxSoldiers, Text = $"{target.DisplayName}: 1 nhóm {g.Troop} tan" });
                        ev.Add(new BattleEvent { Round = round, Type = BattleEventType.RowAdvanced, Side = target.Faction,
                            ActorId = target.Id, Count = target.LivingRows, Text = $"{target.DisplayName}: hàng {rowIndex + 1} tan, hàng sau tiến lên" });
                    }
                    // loop: sát thương dư tràn sang hàng mới
                }
                else break; // hàng đầu hấp thụ hết sát thương còn lại
            }
            target.SyncTroops();
            return killed;
        }

        /// <summary>Locate a group's (rowIndex, groupIndex) inside a combatant's formation (-1,-1 if absent).</summary>
        private static (int row, int grp) Locate(Combatant c, Group g)
        {
            for (int r = 0; r < c.Formation.Count; r++)
            {
                var row = c.Formation[r];
                for (int i = 0; i < row.Groups.Count; i++)
                    if (ReferenceEquals(row.Groups[i], g)) return (r, i);
            }
            return (-1, -1);
        }

        private static BattleEvent GroupKilledEvent(Combatant c, Group g, int round, int killedInGroup)
        {
            var (row, grp) = Locate(c, g);
            return new BattleEvent
            {
                Round = round, Type = BattleEventType.GroupKilled, Side = c.Faction, ActorId = c.Id,
                Amount = g.MaxSoldiers, RowIndex = row, GroupIndex = grp, Troop = g.Troop, SoldiersKilled = killedInGroup,
                Text = $"{c.DisplayName}: 1 nhóm {g.Troop} tan",
            };
        }

        /// <summary>Proportional even spread of <paramref name="hit"/> across living groups; returns actually removed.</summary>
        private static int SpreadEven(List<Group> groups, int hit)
        {
            int total = 0; foreach (var g in groups) if (g.Alive) total += g.Soldiers;
            if (total <= 0 || hit <= 0) return 0;
            if (hit > total) hit = total;
            int distributed = 0;
            foreach (var g in groups)
            {
                if (!g.Alive) continue;
                int share = (int)((long)hit * g.Soldiers / total);
                if (share > g.Soldiers) share = g.Soldiers;
                g.Soldiers -= share; distributed += share;
            }
            for (int i = 0; i < groups.Count && distributed < hit; i++)
            {
                var g = groups[i];
                if (g.Soldiers <= 0) continue;
                int take = hit - distributed;
                if (take > g.Soldiers) take = g.Soldiers;
                g.Soldiers -= take; distributed += take;
            }
            return distributed;
        }

        /// <summary>
        /// Apply <paramref name="amount"/> to an arbitrary set of groups (capped at their living total).
        /// EvenByHp = proportional; FocusFrontFirst = deplete list order. Emits one GroupKilled per group that dies.
        /// Does NOT emit RowAdvanced (front-row-only concept) and does NOT spill beyond the given groups.
        /// </summary>
        public static int ApplyDamageToGroups(Combatant c, List<Group> groups, int amount, Distribution dist,
                                              int round, List<BattleEvent> ev)
        {
            if (groups == null || groups.Count == 0 || amount <= 0) return 0;
            var before = new int[groups.Count];
            for (int i = 0; i < groups.Count; i++) before[i] = groups[i].Soldiers;

            int killed;
            if (dist == Distribution.FocusFrontFirst)
            {
                int remaining = amount, done = 0;
                foreach (var g in groups)
                {
                    if (remaining <= 0) break;
                    if (!g.Alive) continue;
                    int take = remaining < g.Soldiers ? remaining : g.Soldiers;
                    g.Soldiers -= take; remaining -= take; done += take;
                }
                killed = done;
            }
            else killed = SpreadEven(groups, amount);

            if (ev != null)
                for (int i = 0; i < groups.Count; i++)
                {
                    var g = groups[i];
                    int lost = before[i] - g.Soldiers;
                    if (lost > 0 && !g.Alive) ev.Add(GroupKilledEvent(c, g, round, lost));
                }
            c.SyncTroops();
            return killed;
        }

        /// <summary>Instantly zero each group (soldiers→0); one GroupKilled per group. Returns soldiers removed.</summary>
        public static int KillGroups(Combatant c, List<Group> groups, int round, List<BattleEvent> ev)
        {
            if (groups == null || groups.Count == 0) return 0;
            int killed = 0;
            foreach (var g in groups)
            {
                if (g.Soldiers <= 0) continue;
                int lost = g.Soldiers; g.Soldiers = 0; killed += lost;
                if (ev != null) ev.Add(GroupKilledEvent(c, g, round, lost));
            }
            c.SyncTroops();
            return killed;
        }

        /// <summary>Set each group to max(1, round(MaxSoldiers*pct)), never above current. Returns soldiers removed.</summary>
        public static int SetGroupsToHpPct(Combatant c, List<Group> groups, double pct, int round, List<BattleEvent> ev)
        {
            if (groups == null || groups.Count == 0) return 0;
            if (pct < 0) pct = 0; if (pct > 1) pct = 1;
            int removed = 0;
            foreach (var g in groups)
            {
                int target = (int)System.Math.Round(g.MaxSoldiers * pct);
                if (target < 1) target = 1;
                if (target >= g.Soldiers) continue;
                removed += g.Soldiers - target; g.Soldiers = target;
            }
            c.SyncTroops();
            return removed;
        }

        /// <summary>Refill soldiers across the formation (heal), front-most damaged group first, capped at MaxSoldiers.</summary>
        public static void HealFront(Combatant c, int amount)
        {
            if (amount <= 0) return;
            if (!c.HasFormation) { c.Troops = Clamp(c.Troops + amount, 0, c.MaxTroops); return; }
            int remaining = amount;
            foreach (var r in c.Formation)
            {
                foreach (var g in r.Groups)
                {
                    if (remaining <= 0) break;
                    int room = g.MaxSoldiers - g.Soldiers;
                    if (room <= 0) continue;
                    int add = remaining < room ? remaining : room;
                    g.Soldiers += add; remaining -= add;
                }
                if (remaining <= 0) break;
            }
            c.SyncTroops();
        }

        public static void GainMorale(Combatant c, int amount, BattleConfig cfg, int round, List<BattleEvent> ev)
        {
            if (c == null || amount == 0 || c.Troops <= 0) return; // dead units don't gain rage
            int before = c.Morale;
            c.Morale = Clamp(c.Morale + amount, 0, cfg.MoraleFull);
            if (before < cfg.MoraleFull && c.Morale >= cfg.MoraleFull)
                ev.Add(new BattleEvent { Round = round, Type = BattleEventType.Morale, Side = c.Faction,
                    ActorId = c.Id, Amount = c.Morale, ActorMoraleAfter = c.Morale, Text = $"{c.DisplayName} đầy nộ khí!" });
        }

        // [2E] Trụ tên bắn: sát thương cố định vào hàng đầu phe Công (KHÔNG tiêu RNG → determinism-safe).
        public static int TowerShoot(Combatant target, int power, int round, List<BattleEvent> ev)
            => target == null ? 0 : ApplyDamageToFront(target, System.Math.Max(0, power), round, ev);

        // [2E] Hoả công: rải sát thương lên N hàng đầu của target (KHÔNG tiêu RNG).
        public static int ApplyFire(Combatant target, int rows, double perRowScale, int round, List<BattleEvent> ev)
        {
            if (target == null || !target.HasFormation || rows <= 0) return 0;
            var groups = new List<Group>();
            int taken = 0;
            foreach (var r in target.Formation)
            {
                if (taken >= rows) break;
                if (!r.Alive) continue;
                foreach (var g in r.Groups) if (g.Alive) groups.Add(g);
                taken++;
            }
            int dmg = System.Math.Max(1, (int)System.Math.Round(perRowScale * rows * 10.0));
            return ApplyDamageToGroups(target, groups, dmg, Distribution.EvenByHp, round, ev);
        }

        public static double StanceMult(int sign, BattleConfig cfg)
            => sign > 0 ? cfg.StanceAdvantageMult : (sign < 0 ? cfg.StanceDisadvantageMult : 1.0);

        // RE (mobile): địa hình = thiên phú % Lực chiến (战力) PER-TƯỚNG, KHÔNG phải affinity theo binh chủng.
        // c.TerrainBonus[(int)terrain] = % (data từ server). City (Thành trì) chỉ áp phe Công (城池战力仅攻方).
        public static double TerrainMult(Combatant c, Terrain terrain, BattleConfig cfg)
        {
            if (c == null || c.TerrainBonus == null) return 1.0;
            if (terrain == Terrain.City && c.Faction != Faction.Offense) return 1.0; // 城池战力仅攻方
            return c.TerrainBonus.TryGetValue((int)terrain, out var pct) ? 1.0 + pct : 1.0;
        }

        // Khắc chế binh chủng: [2B] bonus PER-TƯỚNG (Thức tỉnh/tech) CỘNG CHỒNG lên [Stage1] vòng ring universal.
        // ring null + CounterVsTroop null → neutral (webgame 2013: 兵种互不相克).
        public static double TroopMult(Combatant a, Combatant b, BattleConfig cfg)
        {
            if (a == null || b == null) return 1.0;
            double bonus = 0.0;
            if (a.CounterVsTroop != null && a.CounterVsTroop.TryGetValue((int)b.Troop, out var pg)) bonus += pg;   // per-tướng
            if (cfg?.TroopCounterRing != null && cfg.TroopCounterRing.TryGetValue((int)a.Troop, out var beats) && beats == (int)b.Troop)
                bonus += cfg.TroopCounterBonus;   // ring universal
            return 1.0 + bonus;
        }

        // Overload cũ (out crit) → delegate xuống overload có 'miss'. Callsite cũ không đổi.
        public static int BasicDamage(Combatant actor, Combatant target, double stanceMult, Terrain terrain,
                                      BattleConfig cfg, DeterministicRng rng, out bool crit)
            => BasicDamage(actor, target, stanceMult, terrain, cfg, rng, out crit, out _);

        public static int BasicDamage(Combatant actor, Combatant target, double stanceMult, Terrain terrain,
                                      BattleConfig cfg, DeterministicRng rng, out bool crit, out bool miss)
        {
            miss = RollDodge(cfg, rng, dodgeable: true);   // đòn thường có thể bị né (report3 'ms')
            if (miss) { crit = false; return 0; }
            double raw = actor.Stats.NormalAtk - target.Stats.NormalDef * 0.5;
            if (raw < 1) raw = 1;
            double mult = stanceMult * TerrainMult(actor, terrain, cfg) * TroopMult(actor, target, cfg);
            crit = rng.Chance(cfg.CritChance);
            if (crit) mult *= cfg.CritMult;
            mult *= rng.Range(1 - cfg.DamageVariance, 1 + cfg.DamageVariance);
            return Math.Max(1, (int)Math.Round(raw * mult * cfg.BaseDamageScale));
        }

        /// <summary>Né đòn (report3 'ms'). CHỈ tốn RNG khi DodgeChance>0 (mặc định 0 → không drift determinism baseline).</summary>
        public static bool RollDodge(BattleConfig cfg, DeterministicRng rng, bool dodgeable)
            => dodgeable && cfg != null && cfg.DodgeChance > 0.0 && rng.Chance(cfg.DodgeChance);

        // [2C] "gia thành": biến thể chiến pháp khớp địa hình hiện tại → nhân JiachengMult (>1).
        static double Jiacheng(TacticSpec t, Terrain terrain)
            => (t != null && t.TerrainTag.HasValue && t.TerrainTag.Value == terrain) ? t.JiachengMult : 1.0;

        // Overload cũ (out crit) → delegate. Callsite cũ (RuleActions) không đổi.
        public static int TacticDamage(Combatant actor, Combatant target, TacticSpec tactic, double stanceMult,
                                       bool awakened, Terrain terrain, BattleConfig cfg, DeterministicRng rng, out bool crit)
            => TacticDamage(actor, target, tactic, stanceMult, awakened, terrain, cfg, rng, out crit, out _);

        public static int TacticDamage(Combatant actor, Combatant target, TacticSpec tactic, double stanceMult,
                                       bool awakened, Terrain terrain, BattleConfig cfg, DeterministicRng rng, out bool crit, out bool miss)
        {
            // awakened / undodgeable KHÔNG bị né (必中).
            miss = RollDodge(cfg, rng, dodgeable: !awakened && !(tactic != null && tactic.Undodgeable));
            if (miss) { crit = false; return 0; }
            crit = false;
            double rowFactor = 1.0 + 0.35 * (Math.Max(1, tactic.RowsHit) - 1);
            double jc = Jiacheng(tactic, terrain);   // [2C] gia thành khi dùng đúng biến thể địa hình
            if (awakened)
            {
                double fixedPow = tactic.FixedPower > 0 ? tactic.FixedPower : tactic.Power * 2.0;
                // Awakened: ignore def/variance/resist but keep terrain affinity + jiacheng (GDD §4.2).
                return Math.Max(1, (int)Math.Round(actor.Stats.TacticAtk * fixedPow * rowFactor * TerrainMult(actor, terrain, cfg) * jc));
            }
            double raw = actor.Stats.TacticAtk * tactic.Power - target.Stats.TacticDef * 0.5;
            if (raw < 1) raw = 1;
            double mult = stanceMult * rowFactor * TerrainMult(actor, terrain, cfg) * jc;
            crit = rng.Chance(cfg.CritChance);
            if (crit) mult *= cfg.CritMult;
            else if (rng.Chance(cfg.FrenzyChance)) mult *= cfg.FrenzyMult; // 乱舞
            if (target.Stats.Resilience > 0 && rng.Chance(Math.Min(1.0, target.Stats.Resilience))) mult *= cfg.ResilienceTacticMult; // 韧性 (clamp prob ≤1)
            mult *= rng.Range(1 - cfg.DamageVariance, 1 + cfg.DamageVariance);
            return Math.Max(1, (int)Math.Round(raw * mult * cfg.BaseDamageScale));
        }

        public static BattleEvent DamageEvent(int round, Combatant actor, Combatant target, int amount, bool crit, TacticEffectKind effect, bool miss = false)
            => new BattleEvent { Round = round, Type = BattleEventType.Damage, Side = actor.Faction,
                ActorId = actor.Id, TargetId = target.Id, Amount = amount, Crit = crit, Miss = miss, Effect = effect,
                ActorTroopsAfter = actor.Troops, TargetTroopsAfter = target.Troops, ActorMoraleAfter = actor.Morale };
    }
}
