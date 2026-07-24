BATTLE_STATE_IDLE = 0
BATTLE_STATE_ANIM = 1
uiTag = {}
uiTag.generalListPanel = {}
uiTag.generalListPanel.attacker = 101
uiTag.generalListPanel.defender = 102
uiTag.tacticsPanel = 201
uiTag.generalInfoPanel = {}
uiTag.generalInfoPanel.attacker = 301
uiTag.generalInfoPanel.defender = 302
uiTag.timer = 401
uiTag.fightHelper = 501
uiTag.notice = 601
uiTag.textTip = 701
uiTag.fightButton = 801
uiTag.tujin = 901
uiTag.chetui = 1001
uiTag.jtj = 1101
uiTag.kfwdResultPanel = 1200
uiTag.hbq_att = 1301
uiTag.hbq_def = 1302
uiTag.fission_att = 1311
uiTag.fission_def = 1312
uiTag.diedCastleNpc_att = 1321
uiTag.diedCastleNpc_def = 1322
effectType = {}
effectType.animArray = 1
effectType.lostHp = 2
effectType.reward = 3
tipType = {}
tipType.selfToAuto = 1
tipType.autoToself = 2
tipType.jiebingSucc = 3
tipType.youdiSucc = 4
tipType.tujinSucc = 5
tipType.cheTuiSucc = 6
tipType.createJtj = 7
tipType.joinBattle = 8
troopPatternZOrderAtt = {
	{
		1,
		2,
		4
	},
	{
		3,
		5,
		7
	},
	{
		6,
		8,
		9
	}
}
troopPatternZOrderDef = {
	{
		6,
		8,
		9
	},
	{
		3,
		5,
		7
	},
	{
		1,
		2,
		4
	}
}
troopPattern = {}
troopPattern[1] = {
	{
		1,
		1,
		1
	},
	{
		1,
		1,
		1
	},
	{
		0,
		0,
		0
	}
}
troopPattern[2] = {
	{
		0,
		0,
		0
	},
	{
		1,
		1,
		1
	},
	{
		0,
		0,
		0
	}
}
troopPattern[3] = {
	{
		1,
		0,
		1
	},
	{
		1,
		0,
		1
	},
	{
		0,
		0,
		0
	}
}
troopPattern[4] = {
	{
		0,
		0,
		0
	},
	{
		1,
		0,
		1
	},
	{
		0,
		0,
		0
	}
}
troopPattern[5] = {
	{
		0,
		0,
		0
	},
	{
		0,
		1,
		0
	},
	{
		0,
		0,
		0
	}
}
troopPattern[6] = {
	{
		0,
		0,
		0
	},
	{
		1,
		0,
		1
	},
	{
		1,
		0,
		1
	}
}
troopPattern[7] = {
	{
		0,
		0,
		0
	},
	{
		0,
		1,
		0
	},
	{
		0,
		0,
		0
	}
}
troopPattern.zhoutai1 = {
	{
		1,
		1,
		1
	},
	{
		0,
		1,
		1
	},
	{
		0,
		0,
		0
	}
}
troopPattern.zhoutai2 = {
	{
		1,
		0,
		1
	},
	{
		0,
		1,
		1
	},
	{
		0,
		0,
		0
	}
}
troopPattern.zhoutai3 = {
	{
		1,
		0,
		1
	},
	{
		0,
		1,
		0
	},
	{
		0,
		0,
		0
	}
}
SIMAYI_FANTAN = 1001
ZHUGELIANG_4 = 26
ZHUGELIANG_1 = 27
ZHUGELIANG_WORD_4 = 39
ZHUGELIANG_WORD_1 = 40
ZHUGELIANG_BAGUA = 20001
ZHOUYUJX_FIRE = 31
ZHOUYUJX_FIRE2 = 50001
DIAOCHAN_DANCE = 32
DIAOCHAN_DANCE_STATEGY = 45
MENGHUO_STATEGY = 50
MENGHUO_ANIMATION_STATEGY = 36
CAOCAO_HAOLINGTIANXIA = 35
BATTLE_TUCHENGH = 30001
BATTLE_LVBUZIBAO = 40001
XUNYU_YEHUOPOZHEN = 60001
BATTLE_HUOJI = 70001
TEN_JUNLINTIANXIA = 80001
CARSHILED_EFFECT = 90001
ZHIHENG_EFFECT = 90002
ZHIHENG_EFFECT2 = 90003
LIGNTNING_EFFECT = 90004

local var_0_0 = visibleSize.width / 2 - 568
local var_0_1 = visibleSize.height / 2 - 384

battleTower = {}
battleTower.FANGJIAN = 10001
battleTower.FANGJIAN_1 = battleTower.FANGJIAN + 1
battleTower.FANGJIAN_5 = battleTower.FANGJIAN + 5
battleTower.PAOJI = 10003
battleTower.POHUAI = 10004
battleTower.POHUAI_1 = battleTower.POHUAI + 1
battleTower.SMOKE = 10007
battleTower.BOMB_1 = 10010
battleTower.BOMB_2 = 10011
battleTower.BOMB_3 = 10012
battleTower.BOMB_4 = 10013

local var_0_2 = 40
local var_0_3 = 20

battleTower.towerRight = ccp(950 + var_0_0 + var_0_2, 335 + var_0_1 + var_0_3)
battleTower.towerLeft = ccp(390 + var_0_0 + var_0_2, 650 + var_0_1 + var_0_3)
battleTower.towerRightSmoke = ccp(920 + var_0_0 + var_0_2, 315 + var_0_1 + var_0_3)
battleTower.towerLeftSmoke = ccp(360 + var_0_0 + var_0_2, 630 + var_0_1 + var_0_3)
battleTower.towerNaijiu = ccp(800 + var_0_0 + var_0_2, 228 + var_0_1 + var_0_3)
battleTower.towerHuihe = ccp(800 + var_0_0 + var_0_2, 250 + var_0_1 + var_0_3)
battleTower.bomb1 = ccp(950 + var_0_0 + var_0_2 + 122 - 107, 335 + var_0_1 + var_0_3 + 20 - 133)
battleTower.bomb2 = ccp(950 + var_0_0 + var_0_2 - 188 - 107, 335 + var_0_1 + var_0_3 - 126 - 133)
battleTower.bomb3 = ccp(390 - var_0_0 + var_0_2 - 80 - 107, 650 + var_0_1 + var_0_3 + 60 - 133)
battleTower.bomb4 = ccp(390 + var_0_0 + var_0_2 - 169 - 107, 650 + var_0_1 + var_0_3 - 34 - 133)
battleTower.flag = ccp(780 + var_0_0 + var_0_2, 325 + var_0_1 + var_0_3)
