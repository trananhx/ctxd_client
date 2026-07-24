activityConstant = {}
activityConstant.TYPES = {
	ACTIVITY_IRON = {
		key = "haveIronActivity",
		id = 5,
		tag = 10001,
		name = language.get(130001),
		action = actions.getIronActivityInfo
	},
	ACTIVITY_PAY = {
		key = "havePayActivity",
		id = 2,
		tag = 10002,
		name = language.get(130002),
		action = actions.getPayActivityInfo
	},
	ACTIVITY_TICKET = {
		key = "haveTicketActivity",
		id = 7,
		tag = 10003,
		name = language.get(130003),
		action = actions.getTicketActivityInfo
	},
	ACTIVITY_LV_EXP = {
		key = "activityLvExp",
		id = 3,
		tag = 10004,
		name = language.get(130004),
		action = actions.getLvExpActivity
	},
	ACTIVITY_DSTQ = {
		key = "haveDstqActivity",
		id = 8,
		tag = 10005,
		name = language.get(130005),
		action = actions.getDstqInfo
	},
	ACTIVITY_QUENCHING = {
		key = "haveQuenchingActivity",
		id = 6,
		tag = 10006,
		name = language.get(130006),
		action = actions.getQuenchingActivityInfo
	},
	ACTIVITY_51 = {
		key = "activity51",
		id = 1,
		tag = 10007,
		name = language.get(130007),
		action = actions.getActivity51
	},
	ACTIVITY_DRAGON = {
		key = "haveDragonActivity",
		id = 4,
		tag = 10008,
		name = language.get(130008),
		action = actions.getDragonActivityInfo
	},
	ACTIVITY_7DAY_LOGIN = {
		key = "haveLoginRewardActivity",
		id = 100,
		tag = 10009,
		name = language.get(130009),
		action = actions.getWeekLoginRewardInfo
	},
	ACTIVITY_NOVICEWANTED = {
		key = "endTime",
		id = 101,
		tag = 10010,
		name = language.get(130010),
		action = actions.getNoviceWantedInfo
	},
	ACTIVITY_XILIAN = {
		key = "haveXiLianActivity",
		id = 14,
		tag = 10011,
		name = language.get(130011),
		action = actions.getXilianActivityInfo
	},
	ACTIVITY_ZIYUAN = {
		key = "haveResourceAddittionActivity",
		id = 12,
		tag = 10012,
		name = language.get(130012),
		action = actions.getResourceActivity
	},
	ACTIVITY_IRON_REWARD = {
		key = "haveIronRewardActivity",
		id = 13,
		tag = 10013,
		name = language.get(130013),
		action = actions.getIronRewardActivityInfo
	},
	ACTIVITY_FAMOUS = {
		key = "haveNationalDayActivity",
		id = 11,
		tag = 10014,
		name = language.get(130014),
		action = actions.getFamousActivity
	},
	ACTIVITY_REDBOMB = {
		key = "haveRedPaperActivity",
		id = 20,
		tag = 10015,
		name = language.get(130015),
		action = actions.getRedBombActivity
	},
	ACTIVITY_SDTJ = {
		key = "haveSwordActivity",
		id = 22,
		tag = 10016,
		name = language.get(130016),
		action = actions.getSDTJActivity
	},
	ACTIVITY_IRON_ROTARY = {
		key = "haveIronRotaryEvent",
		id = 23,
		tag = 10017,
		name = language.get(130017),
		action = actions.ironRotaryInfo
	},
	ACTIVITY_ANCIENT_CASTLE = {
		key = "haveAncientAdventureActivity",
		id = 24,
		tag = 10018,
		name = language.get(130037),
		action = actions.ancientCastleInfo
	},
	ACTIVITY_WUSEGEM = {
		key = "haveGemsActivity",
		id = 25,
		tag = 10019,
		name = language.get(130019),
		action = actions.getWuSeBaoShiActivity
	},
	ACTIVITY_MID_AUTUMN = {
		key = "haveMidAutumnActivity",
		id = 10,
		tag = 10020,
		name = language.get(130020),
		action = actions.getMidAutumnActivity
	},
	ACTIVITY_IRON_MINE = {
		key = "haveIronMineActivity",
		id = 27,
		tag = 10021,
		name = language.get(130021),
		action = actions.getIronMineActivity
	},
	ACTIVITY_MOVE_MOUNTAIN = {
		key = "haveMrFoolActivity",
		id = 26,
		tag = 10022,
		name = language.get(130022),
		action = actions.getMoveMountainActivity
	},
	ACTIVITY_TEL_FARE = {
		key = "haveTelFareActivity",
		id = 201,
		tag = 10023,
		name = language.get(130023),
		action = actions.getTelFareActivity
	},
	ACTIVITY_CHRISTMAS_DAY = {
		key = "haveChristmasDayActivity",
		id = 16,
		tag = 10024,
		name = language.get(130024),
		action = actions.getChristmasDayActivity
	},
	ACTIVITY_GEM_ROTARY = {
		key = "haveGemRotaryEvent",
		id = 29,
		tag = 10025,
		name = language.get(130025),
		action = actions.getGemRotaryActivity
	},
	ACTIVITY_CONSUME_GIFT = {
		key = "haveConsumeGiftActivity",
		id = 30,
		tag = 10026,
		name = language.get(130026),
		action = actions.consumeGiftActivity
	},
	ACTIVITY_BIG_ROTARY = {
		key = "haveBigRotaryActivity",
		id = 203,
		tag = 10027,
		name = language.get(130027),
		action = actions.getBigRotaryActivity
	},
	ACTIVITY_FIRST_PAY = {
		key = "haveFirstPayActivity",
		id = 204,
		tag = 10028,
		name = language.get(130028),
		action = actions.getFirstPayActivity
	},
	ACTIVITY_BEAST = {
		key = "haveBeastActivity",
		id = 18,
		tag = 10029,
		name = language.get(130029),
		action = actions.getBeastActivity
	},
	ACTIVITY_WISH = {
		key = "haveWishActivity",
		id = 17,
		tag = 10030,
		name = language.get(130030),
		action = actions.getWishActivity
	},
	ACTIVITY_BAI_NIAN = {
		key = "haveBaiNianActivity",
		id = 19,
		tag = 10031,
		name = language.get(130031),
		action = actions.getBaiNianActivity
	},
	ACTIVITY_LANTERN = {
		key = "haveNewDragonActivity",
		id = 21,
		tag = 10032,
		name = language.get(130038),
		action = actions.getLanternActivity
	},
	ACTIVITY_BETRAY = {
		key = "haveBetrayActivity",
		id = 33,
		tag = 10033,
		name = language.get(130033),
		action = actions.getBetrayActivity
	},
	ACTIVITY_ZHUAN_PAN = {
		key = "haveZhuanPanActivity",
		id = 205,
		tag = 10034,
		name = language.get(130027),
		action = actions.getZhuanPanActivity
	},
	ACTIVITY_KAIGUANG_GIFT = {
		key = "haveLightActivity",
		id = 35,
		tag = 10035,
		name = language.get(130034),
		action = actions.getKaiguangActivity
	},
	ACTIVITY_CARD = {
		key = "hasCardActivity",
		id = 36,
		tag = 10036,
		name = language.get(130035),
		action = actions.getCardActivity
	},
	ACTIVITY_NEW_GEMS = {
		key = "haveNewGemsActivity",
		id = 37,
		tag = 10037,
		name = language.get(130019),
		action = actions.getNewGemsActivity
	},
	ACTIVITY_NEW_GEM_ROTARY = {
		key = "haveNewGemRotaryActivity",
		id = 38,
		tag = 10038,
		name = language.get(130025),
		action = actions.getNewGemRotaryActivity
	},
	ACTIVITY_FURNACE = {
		key = "haveFurnaceActivity",
		id = 39,
		tag = 10039,
		name = language.get(130036),
		action = actions.getFurnaceActivity
	},
	ACTIVITY_TAXI = {
		key = "haveDidiActivity",
		id = 206,
		tag = 10040,
		name = language.get(130039),
		action = actions.getTaxiActivity
	},
	ACTIVITY_SEVEN_CATCH = {
		key = "haveSevenCatchActivity",
		id = 28,
		tag = 10041,
		name = language.get(130040),
		action = actions.getSevenCatchActivity
	},
	ACTIVITY_GOLD = {
		key = "havePayRedBagActivity",
		id = 50,
		tag = 10042,
		name = language.get(130041),
		action = actions.getGoldActivityInfo
	},
	ACTIVITY_DATA_REWARD = {
		key = "haveDataRewardEvent",
		id = 207,
		tag = 10043,
		name = language.get(130042),
		action = actions.getDataRewardActivity
	},
	ACTIVITY_GODRED = {
		key = "haveGodPaperActivity",
		id = 45,
		tag = 10044,
		name = language.get(130064),
		action = actions.godSendRedInfo
	},
	ACTIVITY_JINLIAN = {
		key = "haveJinLianActivity",
		id = 42,
		tag = 10045,
		name = language.get(130044),
		action = actions.getJinLianActivityInfo
	},
	ACTIVITY_NEW_MID_AUTUMN = {
		key = "haveGDSMoonFestivalActivity",
		id = 32,
		tag = 10046,
		name = language.get(130020),
		action = actions.getNewMidAutumnActivity
	},
	ACTIVITY_TIANDENG = {
		key = "haveSkyLanternEvent",
		id = 40,
		tag = 10047,
		name = language.get(130045),
		action = actions.getTianDengInfo
	},
	ACTIVITY_FISHING = {
		key = "haveFishActivity",
		id = 44,
		tag = 10048,
		name = language.get(130046),
		action = actions.getFishingInfo
	},
	ACTIVITY_REWARD_GENERAL = {
		key = "haveRewardGeneralActivity",
		id = 43,
		tag = 10049,
		name = language.get(130047),
		action = actions.getRewardGeneralActivity
	},
	ACTIVITY_HORSE_RACING = {
		key = "haveHorseRacingActivity",
		id = 52,
		tag = 10050,
		name = language.get(130048),
		action = actions.getHorseRacingActivity
	},
	ACTIVITY_SUPER_GEM_ROTARY = {
		key = "haveSuperGemRotaryActivity",
		id = 41,
		tag = 10051,
		name = language.get(130025),
		action = actions.getSuperGemRotaryActivity
	},
	ACTIVITY_GEM_MINE = {
		key = "haveGemMineActivity",
		id = 56,
		tag = 10052,
		name = language.get(130049),
		action = actions.getGemMineActivity
	},
	ACTIVITY_HERO_DRINK = {
		key = "haveHeroActivity",
		id = 48,
		tag = 10053,
		name = language.get(130050),
		action = actions.getHeroDrinkInfo
	},
	ACTIVITY_NEW_SWORD = {
		key = "haveNewSwordActivity",
		id = 57,
		tag = 10054,
		name = language.get(130051),
		action = actions.getNewSwordActivity
	},
	ACTIVITY_IRON_MOUNTAIN = {
		key = "ironMountainEvent",
		id = 59,
		tag = 10055,
		name = language.get(130053),
		action = actions.getIronMountainActivity
	},
	ACTIVITY_IRON_GIVE = {
		key = "haveIronGiveActivity",
		id = 15,
		tag = 10056,
		name = language.get(130054),
		action = actions.getIronSellActivity
	},
	ACTIVITY_SILK_SHOP = {
		key = "haveSilkshopActivity",
		id = 58,
		tag = 10057,
		name = language.get(130055),
		action = actions.getSilkShopActivity
	},
	ACTIVITY_MUL_NATION = {
		key = "haveMulNationEvent",
		id = 64,
		tag = 10058,
		name = language.get(130056),
		action = actions.getMulNationActivity
	},
	ACTIVITY_BUILDNATION_PUSH = {
		key = "haveKindomBuildSprint",
		id = 63,
		tag = 10059,
		name = language.get(130057),
		action = actions.getGiftInfo
	},
	ACTIVITY_TRIAL_BUILD = {
		key = "haveTrialBuildEvent",
		id = 66,
		tag = 10060,
		name = language.get(130060),
		action = actions.getTrialBuildEvent
	},
	ACTIVITY_SEA_SILK = {
		key = "haveSeaSilkRoadActivity",
		id = 67,
		tag = 10061,
		name = language.get(130061),
		action = actions.seaSilkActivity
	},
	ACTIVITY_MOON_CAKE = {
		key = "haveMoonCakeActivity",
		id = 61,
		tag = 10062,
		name = language.get(130062),
		action = actions.getMoonCakeActivity
	},
	ACTIVITY_SILK_CARD = {
		key = "haveSilkCardEvent",
		id = 65,
		tag = 10063,
		name = language.get(130055),
		action = actions.getSilkCardActivity
	},
	ACTIVITY_GANG_MINE = {
		key = "haveGangMineActivity",
		id = 69,
		tag = 10064,
		name = language.get(130063),
		action = actions.getGangMineActivity
	},
	ACTIVITY_GANG_CARD = {
		key = "haveGangCardEvent",
		id = 65,
		tag = 10065,
		name = language.get(130065),
		action = actions.getSilkCardActivity
	},
	ACTIVITY_SEA_SILK2 = {
		key = "haveSeasilkRoad2Activity",
		id = 72,
		tag = 10066,
		name = language.get(130066),
		action = actions.seaSilk2Activity
	},
	ACTIVITY_DRAGON_BOAT = {
		key = "haveDragonBoatActivity",
		id = 55,
		tag = 10067,
		name = language.get(130067),
		action = actions.getDragonBoatActivity
	},
	ACTIVITY_TS_DRINKING = {
		key = "haveTsDrinkingEvent",
		id = 73,
		tag = 10068,
		name = language.get(130069),
		action = actions.getTsDrinkingEvent
	},
	ACTIVITY_JUE_STONE = {
		key = "haveJueStoneActivity",
		id = 68,
		tag = 10069,
		name = language.get(130070),
		action = actions.getJueStoneActivity
	},
	ACTIVITY_NEW_LANTERN = {
		key = "haveNewLanternActivity",
		id = 46,
		tag = 10070,
		name = language.get(130088),
		action = actions.getNewLanternActivity
	},
	ACTIVITY_MU_NIU = {
		key = "haveNewYearRedPaperActivity",
		id = 70,
		tag = 10071,
		name = language.get(130072),
		action = actions.getNewYearRedPaperActivity
	},
	ACTIVITY_TOMB = {
		key = "haveTombActivity",
		id = 47,
		tag = 10072,
		name = language.get(130073),
		action = actions.getTombActivity
	},
	ACTIVITY_OUTLINE = {
		key = "haveSpecialOfftime",
		id = 10001,
		tag = 10073,
		name = language.get(130074),
		action = actions.getOutLine
	},
	ACTIVITY_HERO_DRINK2 = {
		key = "haveHeroActivity2",
		id = 74,
		tag = 10074,
		name = language.get(130050),
		action = actions.getHeroDrinkInfo2
	},
	ACTIVITY_DWXZ = {
		key = "haveDwxzActivity",
		id = 75,
		tag = 10075,
		name = language.get(130076),
		action = actions.getDWXZ
	},
	ACTIVITY_LOOK = {
		key = "haveLookActivity",
		id = 53,
		tag = 10076,
		name = language.get("130056_gcldhw"),
		action = actions.getLookActivity
	},
	ACTIVITY_QA = {
		key = "haveQAActivity",
		id = 304,
		tag = 10077,
		name = language.get("156004_gcldhw"),
		action = actions.getQAActivity
	},
	ACTIVITY_DYQX = {
		key = "hasEntertainWarlordAct",
		id = 78,
		tag = 10079,
		name = language.get(130078),
		action = actions.getDYQX
	},
	ACTIVITY_CCJJ = {
		key = "arrowBoatEvent",
		id = 80,
		tag = 10080,
		name = language.get(130080),
		action = actions.getCCJJ
	},
	ACTIVITY_CHANG_BAN_SALLY = {
		key = "hasChangbanSally",
		id = 83,
		tag = 10081,
		name = language.get(130081),
		action = actions.getChangbanActivity
	},
	ACTIVITY_METEOR_INCENSE = {
		key = "meteorIncenseEvent",
		id = 79,
		tag = 10082,
		name = language.get(130083),
		action = actions.getMeteorIncenseActivity
	},
	ACTIVITY_PAY0805 = {
		key = "hasPay0805",
		id = 85,
		tag = 10083,
		name = language.get(130085),
		action = actions.getPay0805Activity
	},
	ACTIVITY_YEAR_BEAST17 = {
		key = "yearBeast17",
		id = 84,
		tag = 10084,
		name = language.get(130086),
		action = actions.getYearBeast17
	},
	ACTIVITY_METEORITE = {
		key = "MeteoriteEvent",
		id = 82,
		tag = 10085,
		name = language.get(130087),
		action = actions.getMeteorite
	},
	ACTIVITY_TANK_CHARGE = {
		key = "hasTankCharge",
		id = 86,
		tag = 10086,
		name = language.get(130089),
		action = actions.getTankChargeActivity
	},
	ACTIVITY_QING_MEI = {
		key = "qingmeiEvent",
		id = 87,
		tag = 10087,
		name = language.get(130090),
		action = actions.getQingmeiEvent
	},
	ACTIVITY_DEFEND_XIANGYANG = {
		key = "defendXiangYang",
		id = 88,
		tag = 10088,
		name = language.get(130091),
		action = actions.getXiangYangActivity
	},
	ACTIVITY_CONSUME_GIFT2 = {
		key = "haveConsumeGift2Activity",
		id = 500,
		tag = 10089,
		name = language.get(130026),
		action = actions.consumeGift2Activity
	},
	ACTIVITY_OUTLINE2 = {
		key = "haveSpecialOfftime2",
		id = 10002,
		tag = 10090,
		name = language.get(130074),
		action = actions.getOutLine2
	},
	ACTIVITY_OUTLINE3 = {
		key = "haveSpecialOfftime3",
		id = 10003,
		tag = 10091,
		name = language.get(130074),
		action = actions.getOutLine3
	},
	ACTIVITY_OUTLINE4 = {
		key = "haveSpecialOfftime4",
		id = 10004,
		tag = 10092,
		name = language.get(130074),
		action = actions.getOutLine4
	}
}
