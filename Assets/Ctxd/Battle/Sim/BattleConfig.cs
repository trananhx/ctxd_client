namespace Ctxd.Battle.Sim
{
    /// <summary>All battle tuning knobs (many GDD values are ❓ → designer-tunable here / mirrored by an SO).</summary>
    [System.Serializable]
    public sealed class BattleConfig
    {
        public double StanceAdvantageMult = 1.5, StanceDisadvantageMult = 0.7;
        public int MoraleStart = 50, MoraleFull = 100;
        public int MoraleOnDealDamage = 12, MoraleOnTakeDamage = 8, MoraleOnKillGeneral = 30, MoraleAfterTacticReset = 0;
        public double CritMult = 2.0, FrenzyMult = 1.5;
        public double CritChance = 0.15, FrenzyChance = 0.20, ResilienceTacticMult = 0.5;
        public int SoldiersPerGroup = 6, GroupsPerRow = 3, RowsMin = 4;
        public double DamageVariance = 0.1, BaseDamageScale = 1.0;
        public double TerrainAffinityBonus = 0.25;   // DEPRECATED: thay bằng Combatant.TerrainBonus per-tướng (RE). Giữ để SO không vỡ.
        public double TroopCounterBonus = 0.20;
        public int MaxRounds = 80;

        // Vòng khắc chế binh chủng: CHIỀU 步克弓/弓克骑/骑克器械/器械克步 là RE-CONFIRMED (V12, biểu hiện qua 兵种天赋).
        // ⚠️ NHƯNG RE nói khắc chế là "buff theo cấp PER-TƯỚNG (Thức tỉnh/tech), KHÔNG cố định theo đơn vị" → ring universal ở đây
        //    là ĐƠN GIẢN HOÁ mức-config cho bản mobile; cơ chế RE-đúng là per-tướng qua Combatant.CounterVsTroop [2B] (cộng chồng).
        //    Đặt null để tắt hoàn toàn (webgame 2013 兵种互不相克). Hệ số +TroopCounterBonus là placeholder (số thật ở server).
        // key = (int)TroopType kẻ khắc, value = bị khắc. Enum: 骑=0, 步=1, 弓=2, 器械=3 (谋士=4 ngoài vòng).
        public System.Collections.Generic.Dictionary<int, int> TroopCounterRing =
            new System.Collections.Generic.Dictionary<int, int> { { 1, 2 }, { 2, 0 }, { 0, 3 }, { 3, 1 } };

        // [Stage 2A] né / chuỗi / phản-giữ / Loạn Vũ. Số ở SERVER → placeholder tunable.
        // DodgeChance MẶC ĐỊNH 0 để KHÔNG drift determinism baseline; bản mobile bật ~0.05-0.1.
        public double DodgeChance = 0.0;                 // xác suất né đòn thường + chiến pháp thường (không né awakened/undodgeable)
        public double DodgeStrategyStat = 0.0;           // (dự phòng) né theo chênh 计策 — chưa dùng
        public int MaxTacticChain = 3;                   // số mắt xích tối đa của chuỗi nextTacticId
        public double ChainPowerDecay = 0.6;             // hệ số suy giảm sát thương mỗi mắt xích sau gốc
        public double LuanwuMult = 1.6;                  // Loạn Vũ: nhân sát thương chiến pháp khi LuanwuTurns>0
        public double BeHoldReflectStrategyGap = 30;     // chênh 计策 tối thiểu để hoá giải (phản/giữ) chiến pháp địch

        // [Stage 2D] phantom (幻影) + surround (包围). Số ở server → tunable.
        public double PhantomTroopScale = 1.0;           // quân của ảo ảnh = MaxTroops × scale
        public int PhantomMax = 3;                       // trần số ảo ảnh mỗi phe
        public int PhantomStartMorale = 0;               // nộ khởi đầu của ảo ảnh
        public double SurroundRatio = 5.0;               // binh lực địch ≥ 5× → bị bao vây (0 = tắt)
        public int SurroundSlamPeriod = 5;               // mỗi 5 hiệp chịu 1 đòn phong toả
        public double SurroundSlamPct = 0.08;            // % binh lực tướng active mất mỗi đòn
        public bool SurroundBlocksCast = true;           // bị vây → không thả được chiến pháp

        // [Stage 2E] công thành / trụ tên / hoả. Gated: chỉ áp ở Terrain.City & EnableCityTower → 0 drift.
        public bool EnableCityTower = false;             // bật trụ tên ở trận địa hình City
        public int CityTowerBlood = 5000;                // độ bền trụ
        public int CityTowerPeriod = 3;                  // trụ bắn mỗi N hiệp
        public int CityTowerShootPower = 400;            // sát thương mỗi phát trụ
        public int CityTowerBreakPerRound = 300;         // phe công phá trụ mỗi hiệp
        public double FirePerRowScale = 50.0;            // hệ số sát thương hoả công theo hàng

        // [FX bền] số hiệp tồn tại của FX chiếu xuống client (server-driven; A: đo bằng HIỆP).
        public int FireDurationRounds = 3;               // FX lửa cháy sống mấy hiệp
        public int BuffAuraRounds = 3;                   // aura buff dưới chân giữ mấy hiệp (<0 = UntilRemoved, 0 = tắt)

        public BattleConfig Clone()
        {
            var c = (BattleConfig)MemberwiseClone();   // shallow: Dictionary chia sẻ tham chiếu → deep-copy ring dưới đây.
            if (TroopCounterRing != null) c.TroopCounterRing = new System.Collections.Generic.Dictionary<int, int>(TroopCounterRing);
            return c;
        }
    }
}
