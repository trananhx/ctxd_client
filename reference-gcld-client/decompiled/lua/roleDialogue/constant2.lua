local function var_0_0()
	return ({
		"caocao",
		"liubei",
		"sunquan"
	})[user.player.forceId]
end

local function var_0_1()
	return ({
		"caocao",
		"zhugeliang",
		"zhouyu"
	})[user.player.forceId]
end

local function var_0_2()
	return language.get(460037, user.forceIdToName[user.player.forceId] or "#")
end

local function var_0_3(arg_4_0)
	return user.forceIdToName[arg_4_0] or "#"
end

local function var_0_4()
	return ({
		"caocao",
		"liubei",
		"sunquan"
	})[user.player.headhunterVO.supportForceId]
end

function roleDialogue.constant.dialogueFrame_1400()
	local var_6_0 = {}

	var_6_0.totalStep = 2
	var_6_0.step = {}
	var_6_0.step[1] = {}
	var_6_0.step[1].type = 1
	var_6_0.step[1].pic = "xiaoqian"
	var_6_0.step[1].desc = language.get(220516)
	var_6_0.step[2] = {}
	var_6_0.step[2].type = 2
	var_6_0.step[2].pic = "player"
	var_6_0.step[2].desc = language.get(220517)

	return var_6_0
end

function roleDialogue.constant.dialogueFrame_1401()
	local var_7_0 = {}

	var_7_0.totalStep = 3
	var_7_0.step = {}
	var_7_0.step[1] = {}
	var_7_0.step[1].type = 2
	var_7_0.step[1].pic = "player"
	var_7_0.step[1].desc = language.get(220518)
	var_7_0.step[2] = {}
	var_7_0.step[2].type = 1
	var_7_0.step[2].pic = "xiaoqian"
	var_7_0.step[2].desc = language.get(220519)
	var_7_0.step[3] = {}
	var_7_0.step[3].type = 1
	var_7_0.step[3].pic = "xiaoqian"
	var_7_0.step[3].desc = language.get(220520)

	return var_7_0
end

function roleDialogue.constant.dialogueFrame_1402()
	local var_8_0 = {}

	var_8_0.totalStep = 1
	var_8_0.step = {}
	var_8_0.step[1] = {}
	var_8_0.step[1].type = 1
	var_8_0.step[1].pic = "xiaoqian"
	var_8_0.step[1].desc = language.get(220521)

	return var_8_0
end

function roleDialogue.constant.dialogueFrame_1403()
	local var_9_0 = {}

	var_9_0.totalStep = 2
	var_9_0.step = {}
	var_9_0.step[1] = {}
	var_9_0.step[1].type = 2
	var_9_0.step[1].pic = "player"
	var_9_0.step[1].desc = language.get(220522)
	var_9_0.step[2] = {}
	var_9_0.step[2].type = 1
	var_9_0.step[2].pic = "xiaoqian"
	var_9_0.step[2].desc = language.get(220523)

	return var_9_0
end

function roleDialogue.constant.dialogueFrame_1()
	local var_10_0 = {}

	var_10_0.totalStep = 2
	var_10_0.step = {}
	var_10_0.step[1] = {}
	var_10_0.step[1].type = 1
	var_10_0.step[1].pic = "xiaoqian"
	var_10_0.step[1].desc = language.get(220001)
	var_10_0.step[2] = {}
	var_10_0.step[2].type = 2
	var_10_0.step[2].pic = "zhangliang.png"
	var_10_0.step[2].desc = language.get(220002)
	var_10_0.open = "getGeneral1"

	return var_10_0
end

function roleDialogue.constant.dialogueFrame_10()
	local var_11_0 = {}

	var_11_0.totalStep = 3
	var_11_0.step = {}
	var_11_0.step[1] = {}
	var_11_0.step[1].type = 1
	var_11_0.step[1].pic = "xiaoqian"
	var_11_0.step[1].desc = language.get(220003)
	var_11_0.step[2] = {}
	var_11_0.step[2].type = 1
	var_11_0.step[2].pic = "xiaoqian"
	var_11_0.step[2].desc = language.get(220004)
	var_11_0.step[3] = {}
	var_11_0.step[3].type = 1
	var_11_0.step[3].pic = "xiaoqian"
	var_11_0.step[3].desc = language.get(220005)
	var_11_0.open = "createRole"

	return var_11_0
end

function roleDialogue.constant.dialogueFrame_20()
	local var_12_0 = {}

	var_12_0.totalStep = 3
	var_12_0.step = {}
	var_12_0.step[1] = {}
	var_12_0.step[1].type = 1
	var_12_0.step[1].pic = "xiaoqian"
	var_12_0.step[1].desc = language.get(220006)
	var_12_0.step[2] = {}
	var_12_0.step[2].type = 1
	var_12_0.step[2].pic = "xiaoqian"
	var_12_0.step[2].desc = language.get(220007)
	var_12_0.step[3] = {}
	var_12_0.step[3].type = 1
	var_12_0.step[3].pic = "xiaoqian"
	var_12_0.step[3].desc = language.get(220008)
	var_12_0.open = "getguild"

	return var_12_0
end

function roleDialogue.constant.dialogueFrame_21()
	local var_13_0 = {}

	var_13_0.totalStep = 2
	var_13_0.step = {}
	var_13_0.step[1] = {}
	var_13_0.step[1].type = 1
	var_13_0.step[1].pic = "xiaoqian"
	var_13_0.step[1].desc = language.get(220524)
	var_13_0.step[2] = {}
	var_13_0.step[2].type = 1
	var_13_0.step[2].pic = "xiaoqian"
	var_13_0.step[2].desc = language.get(220525)

	return var_13_0
end

function roleDialogue.constant.dialogueFrame_22()
	local var_14_0 = {}

	var_14_0.totalStep = 4
	var_14_0.step = {}
	var_14_0.step[1] = {}
	var_14_0.step[1].type = 1
	var_14_0.step[1].pic = "xiaoqian"
	var_14_0.step[1].desc = language.get(220583)
	var_14_0.step[2] = {}
	var_14_0.step[2].type = 2
	var_14_0.step[2].pic = "player"
	var_14_0.step[2].desc = language.get(220584)
	var_14_0.step[3] = {}
	var_14_0.step[3].type = 1
	var_14_0.step[3].pic = "xiaoqian"
	var_14_0.step[3].desc = language.get(220526)
	var_14_0.step[4] = {}
	var_14_0.step[4].type = 2
	var_14_0.step[4].pic = "player"
	var_14_0.step[4].desc = language.get(220527)

	return var_14_0
end

function roleDialogue.constant.dialogueFrame_23()
	local var_15_0 = {}

	var_15_0.totalStep = 3
	var_15_0.step = {}
	var_15_0.step[1] = {}
	var_15_0.step[1].type = 2
	var_15_0.step[1].pic = "huaxiong.png"
	var_15_0.step[1].desc = language.get(220528)
	var_15_0.step[2] = {}
	var_15_0.step[2].type = 1
	var_15_0.step[2].pic = "xiaoqian"
	var_15_0.step[2].desc = language.get(220529)
	var_15_0.step[3] = {}
	var_15_0.step[3].type = 2
	var_15_0.step[3].pic = "huaxiong.png"
	var_15_0.step[3].desc = language.get(220530)

	return var_15_0
end

function roleDialogue.constant.dialogueFrame_24()
	local var_16_0 = {}

	var_16_0.totalStep = 4
	var_16_0.step = {}
	var_16_0.step[1] = {}
	var_16_0.step[1].type = 1
	var_16_0.step[1].pic = "xiaoqian"
	var_16_0.step[1].desc = language.get(220531)
	var_16_0.step[2] = {}
	var_16_0.step[2].type = 2
	var_16_0.step[2].pic = "player"
	var_16_0.step[2].desc = language.get(220532)
	var_16_0.step[3] = {}
	var_16_0.step[3].type = 1
	var_16_0.step[3].pic = "xiaoqian"
	var_16_0.step[3].desc = language.get(220533)
	var_16_0.step[4] = {}
	var_16_0.step[4].type = 2
	var_16_0.step[4].pic = "player"
	var_16_0.step[4].desc = language.get(220534)

	return var_16_0
end

function roleDialogue.constant.dialogueFrame_40()
	local var_17_0 = {}

	var_17_0.totalStep = 3
	var_17_0.step = {}
	var_17_0.step[1] = {}
	var_17_0.step[1].type = 1
	var_17_0.step[1].pic = "xiaoqian"
	var_17_0.step[1].desc = language.get(220009)
	var_17_0.step[2] = {}
	var_17_0.step[2].type = 1
	var_17_0.step[2].pic = "xiaoqian"
	var_17_0.step[2].desc = language.get(220010)
	var_17_0.step[3] = {}
	var_17_0.step[3].type = 1
	var_17_0.step[3].pic = "xiaoqian"
	var_17_0.step[3].desc = language.get(220011)
	var_17_0.open = "openbussiness"

	return var_17_0
end

function roleDialogue.constant.dialogueFrame_50()
	local var_18_0 = {}

	var_18_0.totalStep = 3
	var_18_0.step = {}
	var_18_0.step[1] = {}
	var_18_0.step[1].type = 1
	var_18_0.step[1].pic = "xiaoqian"
	var_18_0.step[1].desc = language.get(220012)
	var_18_0.step[2] = {}
	var_18_0.step[2].type = 1
	var_18_0.step[2].pic = "xiaoqian"
	var_18_0.step[2].desc = language.get(220013)
	var_18_0.step[3] = {}
	var_18_0.step[3].type = 1
	var_18_0.step[3].pic = "xiaoqian"
	var_18_0.step[3].desc = language.get(220014)
	var_18_0.open = "opensearch"

	return var_18_0
end

function roleDialogue.constant.dialogueFrame_60()
	local var_19_0 = {}

	var_19_0.totalStep = 3
	var_19_0.step = {}
	var_19_0.step[1] = {}
	var_19_0.step[1].type = 1
	var_19_0.step[1].pic = "xiaoqian"
	var_19_0.step[1].desc = language.get(220015)
	var_19_0.step[2] = {}
	var_19_0.step[2].type = 1
	var_19_0.step[2].pic = "xiaoqian"
	var_19_0.step[2].desc = language.get(220016)
	var_19_0.step[3] = {}
	var_19_0.step[3].type = 1
	var_19_0.step[3].pic = "xiaoqian"
	var_19_0.step[3].desc = language.get(220017)

	return var_19_0
end

function roleDialogue.constant.dialogueFrame_70()
	local var_20_0 = {}

	var_20_0.totalStep = 3
	var_20_0.step = {}
	var_20_0.step[1] = {}
	var_20_0.step[1].type = 1
	var_20_0.step[1].pic = "xiaoqian"
	var_20_0.step[1].desc = language.get(220018)
	var_20_0.step[2] = {}
	var_20_0.step[2].type = 1
	var_20_0.step[2].pic = "xiaoqian"
	var_20_0.step[2].desc = language.get(220019)
	var_20_0.step[3] = {}
	var_20_0.step[3].type = 1
	var_20_0.step[3].pic = "xiaoqian"
	var_20_0.step[3].desc = language.get(220020)

	return var_20_0
end

function roleDialogue.constant.dialogueFrame_80()
	local var_21_0 = {}

	var_21_0.totalStep = 2
	var_21_0.step = {}
	var_21_0.step[1] = {}
	var_21_0.step[1].type = 1
	var_21_0.step[1].pic = "xiaoqian"
	var_21_0.step[1].desc = language.get(220021)
	var_21_0.step[2] = {}
	var_21_0.step[2].type = 1
	var_21_0.step[2].pic = "xiaoqian"
	var_21_0.step[2].desc = language.get(220022)
	var_21_0.open = "openShangdian"

	return var_21_0
end

function roleDialogue.constant.dialogueFrame_81()
	local var_22_0 = {}

	var_22_0.totalStep = 2
	var_22_0.step = {}
	var_22_0.step[1] = {}
	var_22_0.step[1].type = 1
	var_22_0.step[1].pic = "xiaoqian"
	var_22_0.step[1].desc = language.get(220535)
	var_22_0.step[2] = {}
	var_22_0.step[2].type = 1
	var_22_0.step[2].pic = "player"
	var_22_0.step[2].desc = language.get(220536)

	return var_22_0
end

function roleDialogue.constant.dialogueFrame_170()
	local var_23_0 = {}

	var_23_0.totalStep = 2
	var_23_0.step = {}
	var_23_0.step[1] = {}
	var_23_0.step[1].type = 1
	var_23_0.step[1].pic = "xiaoqian"
	var_23_0.step[1].desc = language.get(220056)
	var_23_0.step[2] = {}
	var_23_0.step[2].type = 1
	var_23_0.step[2].pic = "xiaoqian"
	var_23_0.step[2].desc = language.get(220057)
	var_23_0.open = "openincense"

	return var_23_0
end

function roleDialogue.constant.dialogueFrame_180()
	local var_24_0 = {}

	var_24_0.totalStep = 3
	var_24_0.step = {}
	var_24_0.step[1] = {}
	var_24_0.step[1].type = 1
	var_24_0.step[1].pic = "xiaoqian"
	var_24_0.step[1].desc = language.get(220059)
	var_24_0.step[2] = {}
	var_24_0.step[2].type = 1
	var_24_0.step[2].pic = "xiaoqian"
	var_24_0.step[2].desc = language.get(220060)
	var_24_0.step[3] = {}
	var_24_0.step[3].type = 1
	var_24_0.step[3].pic = "xiaoqian"
	var_24_0.step[3].desc = language.get(220061)

	return var_24_0
end

function roleDialogue.constant.dialogueFrame_190()
	local var_25_0 = {}

	var_25_0.totalStep = 3
	var_25_0.step = {}
	var_25_0.step[1] = {}
	var_25_0.step[1].type = 1
	var_25_0.step[1].pic = "xiaoqian"
	var_25_0.step[1].desc = language.get(220062)
	var_25_0.step[2] = {}
	var_25_0.step[2].type = 1
	var_25_0.step[2].pic = "xiaoqian"
	var_25_0.step[2].desc = language.get(220063)
	var_25_0.step[3] = {}
	var_25_0.step[3].type = 1
	var_25_0.step[3].pic = "xiaoqian"
	var_25_0.step[3].desc = language.get(220064)
	var_25_0.open = "openGuide"

	return var_25_0
end

function roleDialogue.constant.dialogueFrame_200()
	local var_26_0 = {}

	var_26_0.totalStep = 5
	var_26_0.step = {}
	var_26_0.step[1] = {}
	var_26_0.step[1].type = 1
	var_26_0.step[1].pic = "xiaoqian"
	var_26_0.step[1].desc = language.get(220065)
	var_26_0.step[2] = {}
	var_26_0.step[2].type = 2
	var_26_0.step[2].pic = "player"
	var_26_0.step[2].desc = language.get(220066)
	var_26_0.step[3] = {}
	var_26_0.step[3].type = 1
	var_26_0.step[3].pic = "xiaoqian"
	var_26_0.step[3].desc = language.get(220067)
	var_26_0.step[4] = {}
	var_26_0.step[4].type = 2
	var_26_0.step[4].pic = "player"
	var_26_0.step[4].desc = language.get(220068)
	var_26_0.step[5] = {}
	var_26_0.step[5].type = 1
	var_26_0.step[5].pic = "xiaoqian"
	var_26_0.step[5].desc = language.get(220069)
	var_26_0.open = "fubenbtn"

	return var_26_0
end

function roleDialogue.constant.dialogueFrame_210()
	local var_27_0 = {}

	var_27_0.totalStep = 3
	var_27_0.step = {}
	var_27_0.step[1] = {}
	var_27_0.step[1].type = 1
	var_27_0.step[1].pic = "xiaoqian"
	var_27_0.step[1].desc = language.get(220070)
	var_27_0.step[2] = {}
	var_27_0.step[2].type = 1
	var_27_0.step[2].pic = "xiaoqian"
	var_27_0.step[2].desc = language.get(220071)
	var_27_0.step[3] = {}
	var_27_0.step[3].type = 1
	var_27_0.step[3].pic = "xiaoqian"
	var_27_0.step[3].desc = language.get(220072)

	return var_27_0
end

function roleDialogue.constant.dialogueFrame_220()
	local var_28_0 = {}

	var_28_0.totalStep = 3
	var_28_0.step = {}
	var_28_0.step[1] = {}
	var_28_0.step[1].type = 1
	var_28_0.step[1].pic = "xiaoqian"
	var_28_0.step[1].desc = language.get(220073)
	var_28_0.step[2] = {}
	var_28_0.step[2].type = 1
	var_28_0.step[2].pic = "xiaoqian"
	var_28_0.step[2].desc = language.get(220074)
	var_28_0.step[3] = {}
	var_28_0.step[3].type = 1
	var_28_0.step[3].pic = "xiaoqian"
	var_28_0.step[3].desc = language.get(220075)
	var_28_0.open = "opendinner"

	return var_28_0
end

function roleDialogue.constant.dialogueFrame_230()
	local var_29_0 = {}

	var_29_0.totalStep = 3
	var_29_0.step = {}
	var_29_0.step[1] = {}
	var_29_0.step[1].type = 1
	var_29_0.step[1].pic = "xiaoqian"
	var_29_0.step[1].desc = language.get(220076)
	var_29_0.step[2] = {}
	var_29_0.step[2].type = 1
	var_29_0.step[2].pic = "xiaoqian"
	var_29_0.step[2].desc = language.get(220077)
	var_29_0.step[3] = {}
	var_29_0.step[3].type = 1
	var_29_0.step[3].pic = "xiaoqian"
	var_29_0.step[3].desc = language.get(220078)
	var_29_0.open = "worldbtn"

	return var_29_0
end

function roleDialogue.constant.dialogueFrame_240()
	local var_30_0 = {}

	var_30_0.totalStep = 3
	var_30_0.step = {}
	var_30_0.step[1] = {}
	var_30_0.step[1].type = 1
	var_30_0.step[1].pic = "xiaoqian"
	var_30_0.step[1].desc = language.get(220079)
	var_30_0.step[2] = {}
	var_30_0.step[2].type = 1
	var_30_0.step[2].pic = "xiaoqian"
	var_30_0.step[2].desc = language.get(220080)
	var_30_0.step[3] = {}
	var_30_0.step[3].type = 1
	var_30_0.step[3].pic = "xiaoqian"
	var_30_0.step[3].desc = language.get(220081)

	return var_30_0
end

function roleDialogue.constant.dialogueFrame_250()
	local var_31_0 = {}

	var_31_0.totalStep = 3
	var_31_0.step = {}
	var_31_0.step[1] = {}
	var_31_0.step[1].type = 1
	var_31_0.step[1].pic = "xiaoqian"
	var_31_0.step[1].desc = language.get(220082)
	var_31_0.step[2] = {}
	var_31_0.step[2].type = 1
	var_31_0.step[2].pic = "xiaoqian"
	var_31_0.step[2].desc = language.get(220083)
	var_31_0.step[3] = {}
	var_31_0.step[3].type = 1
	var_31_0.step[3].pic = "xiaoqian"
	var_31_0.step[3].desc = language.get(220084)
	var_31_0.open = "openWeapon"

	return var_31_0
end

function roleDialogue.constant.dialogueFrame_260()
	local var_32_0 = {}

	var_32_0.totalStep = 3
	var_32_0.step = {}
	var_32_0.step[1] = {}
	var_32_0.step[1].type = 1
	var_32_0.step[1].pic = "xiaoqian"
	var_32_0.step[1].desc = language.get(220085)
	var_32_0.step[2] = {}
	var_32_0.step[2].type = 1
	var_32_0.step[2].pic = "xiaoqian"
	var_32_0.step[2].desc = language.get(220086)
	var_32_0.step[3] = {}
	var_32_0.step[3].type = 1
	var_32_0.step[3].pic = "xiaoqian"
	var_32_0.step[3].desc = language.get(220087)

	return var_32_0
end

function roleDialogue.constant.dialogueFrame_270()
	local var_33_0 = {}

	var_33_0.totalStep = 2
	var_33_0.step = {}
	var_33_0.step[1] = {}
	var_33_0.step[1].type = 1
	var_33_0.step[1].pic = "xiaoqian"
	var_33_0.step[1].desc = language.get(220088)
	var_33_0.step[2] = {}
	var_33_0.step[2].type = 1
	var_33_0.step[2].pic = "xiaoqian"
	var_33_0.step[2].desc = language.get(220089)
	var_33_0.open = "openzeroward"

	return var_33_0
end

function roleDialogue.constant.dialogueFrame_280()
	local var_34_0 = {}

	var_34_0.totalStep = 3
	var_34_0.step = {}
	var_34_0.step[1] = {}
	var_34_0.step[1].type = 1
	var_34_0.step[1].pic = "xiaoqian"
	var_34_0.step[1].desc = language.get(220090)
	var_34_0.step[2] = {}
	var_34_0.step[2].type = 1
	var_34_0.step[2].pic = "xiaoqian"
	var_34_0.step[2].desc = language.get(220091)
	var_34_0.step[3] = {}
	var_34_0.step[3].type = 1
	var_34_0.step[3].pic = "xiaoqian"
	var_34_0.step[3].desc = language.get(220092)
	var_34_0.open = "openBlackMarket"

	return var_34_0
end

function roleDialogue.constant.dialogueFrame_290()
	local var_35_0 = {}

	var_35_0.totalStep = 3
	var_35_0.step = {}
	var_35_0.step[1] = {}
	var_35_0.step[1].type = 1
	var_35_0.step[1].pic = "xiaoqian"
	var_35_0.step[1].desc = language.get(220093)
	var_35_0.step[2] = {}
	var_35_0.step[2].type = 1
	var_35_0.step[2].pic = "xiaoqian"
	var_35_0.step[2].desc = language.get(220094)
	var_35_0.step[3] = {}
	var_35_0.step[3].type = 1
	var_35_0.step[3].pic = "xiaoqian"
	var_35_0.step[3].desc = language.get(220095)
	var_35_0.open = "openmarket"

	return var_35_0
end

function roleDialogue.constant.dialogueFrame_300()
	local var_36_0 = {}

	var_36_0.totalStep = 3
	var_36_0.step = {}
	var_36_0.step[1] = {}
	var_36_0.step[1].type = 1
	var_36_0.step[1].pic = "xiaoqian"
	var_36_0.step[1].desc = language.get(220096)
	var_36_0.step[2] = {}
	var_36_0.step[2].type = 1
	var_36_0.step[2].pic = "xiaoqian"
	var_36_0.step[2].desc = language.get(220097)
	var_36_0.step[3] = {}
	var_36_0.step[3].type = 1
	var_36_0.step[3].pic = "xiaoqian"
	var_36_0.step[3].desc = language.get(220098)
	var_36_0.open = "openkeji"

	return var_36_0
end

function roleDialogue.constant.dialogueFrame_310()
	local var_37_0 = {}

	var_37_0.totalStep = 2
	var_37_0.step = {}
	var_37_0.step[1] = {}
	var_37_0.step[1].type = 1
	var_37_0.step[1].pic = "xiaoqian"
	var_37_0.step[1].desc = language.get(220099)
	var_37_0.step[2] = {}
	var_37_0.step[2].type = 2
	var_37_0.step[2].pic = "zhoucang.png"
	var_37_0.step[2].desc = language.get(220100)
	var_37_0.open = "getGeneral"

	return var_37_0
end

function roleDialogue.constant.dialogueFrame_320()
	local var_38_0 = {}

	var_38_0.totalStep = 2
	var_38_0.step = {}
	var_38_0.step[1] = {}
	var_38_0.step[1].type = 1
	var_38_0.step[1].pic = "xiaoqian"
	var_38_0.step[1].desc = language.get(220101)
	var_38_0.step[2] = {}
	var_38_0.step[2].type = 2
	var_38_0.step[2].pic = "zhangliao.png"
	var_38_0.step[2].desc = language.get(220102)
	var_38_0.open = "getGeneral"

	return var_38_0
end

function roleDialogue.constant.dialogueFrame_330()
	local var_39_0 = {}

	var_39_0.totalStep = 4
	var_39_0.step = {}
	var_39_0.step[1] = {}
	var_39_0.step[1].type = 1
	var_39_0.step[1].pic = "player"
	var_39_0.step[1].desc = language.get(220103)
	var_39_0.step[2] = {}
	var_39_0.step[2].type = 2
	var_39_0.step[2].pic = "zhangliang.png"
	var_39_0.step[2].desc = language.get(220104)
	var_39_0.step[3] = {}
	var_39_0.step[3].type = 1
	var_39_0.step[3].pic = "player"
	var_39_0.step[3].desc = language.get(220105)
	var_39_0.step[4] = {}
	var_39_0.step[4].type = 2
	var_39_0.step[4].pic = "huaxiong.png"
	var_39_0.step[4].desc = language.get(220106)
	var_39_0.open = "getGeneral2"

	return var_39_0
end

function roleDialogue.constant.dialogueFrame_340()
	local var_40_0 = {}

	var_40_0.totalStep = 2
	var_40_0.step = {}
	var_40_0.step[1] = {}
	var_40_0.step[1].type = 1
	var_40_0.step[1].pic = "xiaoqian"
	var_40_0.step[1].desc = language.get(220107)
	var_40_0.step[2] = {}
	var_40_0.step[2].type = 2
	var_40_0.step[2].pic = "diaochan.png"
	var_40_0.step[2].desc = language.get(220108)

	return var_40_0
end

function roleDialogue.constant.dialogueFrame_350()
	local var_41_0 = {}

	var_41_0.totalStep = 3
	var_41_0.step = {}
	var_41_0.step[1] = {}
	var_41_0.step[1].type = 1
	var_41_0.step[1].pic = "xiaoqian"
	var_41_0.step[1].desc = language.get(220109)
	var_41_0.step[2] = {}
	var_41_0.step[2].type = 1
	var_41_0.step[2].pic = "xiaoqian"
	var_41_0.step[2].desc = language.get(220110)
	var_41_0.step[3] = {}
	var_41_0.step[3].type = 1
	var_41_0.step[3].pic = "xiaoqian"
	var_41_0.step[3].desc = language.get(220111)

	return var_41_0
end

function roleDialogue.constant.dialogueFrame_360()
	local var_42_0 = {}

	var_42_0.totalStep = 3
	var_42_0.step = {}
	var_42_0.step[1] = {}
	var_42_0.step[1].type = 1
	var_42_0.step[1].pic = "xiaoqian"
	var_42_0.step[1].desc = language.get(220112)
	var_42_0.step[2] = {}
	var_42_0.step[2].type = 1
	var_42_0.step[2].pic = "xiaoqian"
	var_42_0.step[2].desc = language.get(220113)
	var_42_0.step[3] = {}
	var_42_0.step[3].type = 1
	var_42_0.step[3].pic = "xiaoqian"
	var_42_0.step[3].desc = language.get(220114)

	return var_42_0
end

function roleDialogue.constant.dialogueFrame_361()
	local var_43_0 = {}

	var_43_0.totalStep = 1
	var_43_0.step = {}
	var_43_0.step[1] = {}
	var_43_0.step[1].type = 1
	var_43_0.step[1].pic = "xiaoqian"
	var_43_0.step[1].desc = language.get(220115)

	return var_43_0
end

function roleDialogue.constant.dialogueFrame_362()
	local var_44_0 = {}

	var_44_0.totalStep = 1
	var_44_0.step = {}
	var_44_0.step[1] = {}
	var_44_0.step[1].type = 1
	var_44_0.step[1].pic = "xiaoqian"
	var_44_0.step[1].desc = language.get(220116)

	return var_44_0
end

function roleDialogue.constant.dialogueFrame_363()
	local var_45_0 = {}

	var_45_0.totalStep = 1
	var_45_0.step = {}
	var_45_0.step[1] = {}
	var_45_0.step[1].type = 1
	var_45_0.step[1].pic = "xiaoqian"
	var_45_0.step[1].desc = language.get(220117)

	return var_45_0
end

function roleDialogue.constant.dialogueFrame_364()
	local var_46_0 = {}

	var_46_0.totalStep = 1
	var_46_0.step = {}
	var_46_0.step[1] = {}
	var_46_0.step[1].type = 1
	var_46_0.step[1].pic = "xiaoqian"
	var_46_0.step[1].desc = language.get(220118)

	return var_46_0
end

function roleDialogue.constant.dialogueFrame_365()
	local var_47_0 = {}

	var_47_0.totalStep = 1
	var_47_0.step = {}
	var_47_0.step[1] = {}
	var_47_0.step[1].type = 1
	var_47_0.step[1].pic = "xiaoqian"
	var_47_0.step[1].desc = language.get(220119)

	return var_47_0
end

function roleDialogue.constant.dialogueFrame_366()
	local var_48_0 = {}

	var_48_0.totalStep = 1
	var_48_0.step = {}
	var_48_0.step[1] = {}
	var_48_0.step[1].type = 1
	var_48_0.step[1].pic = "xiaoqian"
	var_48_0.step[1].desc = language.get(220120)

	return var_48_0
end

function roleDialogue.constant.dialogueFrame_367()
	local var_49_0 = {}

	var_49_0.totalStep = 1
	var_49_0.step = {}
	var_49_0.step[1] = {}
	var_49_0.step[1].type = 1
	var_49_0.step[1].pic = "xiaoqian"
	var_49_0.step[1].desc = language.get(220121)

	return var_49_0
end

function roleDialogue.constant.dialogueFrame_368()
	local var_50_0 = {}

	var_50_0.totalStep = 1
	var_50_0.step = {}
	var_50_0.step[1] = {}
	var_50_0.step[1].type = 1
	var_50_0.step[1].pic = "xiaoqian"
	var_50_0.step[1].desc = language.get(220122)

	return var_50_0
end

function roleDialogue.constant.dialogueFrame_380()
	local var_51_0 = {}

	var_51_0.totalStep = 1
	var_51_0.step = {}
	var_51_0.step[1] = {}
	var_51_0.step[1].type = 1
	var_51_0.step[1].pic = "xiaoqian"
	var_51_0.step[1].desc = language.get(220123)

	return var_51_0
end

function roleDialogue.constant.dialogueFrame_430()
	local var_52_0 = {}

	var_52_0.totalStep = 3
	var_52_0.step = {}
	var_52_0.step[1] = {}
	var_52_0.step[1].type = 1
	var_52_0.step[1].pic = "xiaoqian"
	var_52_0.step[1].desc = language.get(220124)
	var_52_0.step[2] = {}
	var_52_0.step[2].type = 1
	var_52_0.step[2].pic = "xiaoqian"
	var_52_0.step[2].desc = language.get(220125)
	var_52_0.step[3] = {}
	var_52_0.step[3].type = 1
	var_52_0.step[3].pic = "xiaoqian"
	var_52_0.step[3].desc = language.get(220126)

	return var_52_0
end

function roleDialogue.constant.dialogueFrame_470()
	local var_53_0 = {}

	var_53_0.totalStep = 3
	var_53_0.step = {}
	var_53_0.step[1] = {}
	var_53_0.step[1].type = 1
	var_53_0.step[1].pic = "xiaoqian"
	var_53_0.step[1].desc = language.get(220127)
	var_53_0.step[2] = {}
	var_53_0.step[2].type = 1
	var_53_0.step[2].pic = "xiaoqian"
	var_53_0.step[2].desc = language.get(220128)
	var_53_0.step[3] = {}
	var_53_0.step[3].type = 1
	var_53_0.step[3].pic = "xiaoqian"
	var_53_0.step[3].desc = language.get(220129)

	return var_53_0
end

function roleDialogue.constant.dialogueFrame_480()
	local var_54_0 = {}

	var_54_0.totalStep = 3
	var_54_0.step = {}
	var_54_0.step[1] = {}
	var_54_0.step[1].type = 1
	var_54_0.step[1].pic = "xiaoqian"
	var_54_0.step[1].desc = language.get(220130)
	var_54_0.step[2] = {}
	var_54_0.step[2].type = 1
	var_54_0.step[2].pic = "xiaoqian"
	var_54_0.step[2].desc = language.get(220131)
	var_54_0.step[3] = {}
	var_54_0.step[3].type = 1
	var_54_0.step[3].pic = "xiaoqian"
	var_54_0.step[3].desc = language.get(220132)

	return var_54_0
end

function roleDialogue.constant.dialogueFrame_490()
	local var_55_0 = {}

	var_55_0.totalStep = 3
	var_55_0.step = {}
	var_55_0.step[1] = {}
	var_55_0.step[1].type = 1
	var_55_0.step[1].pic = "xiaoqian"
	var_55_0.step[1].desc = language.get(220133)
	var_55_0.step[2] = {}
	var_55_0.step[2].type = 1
	var_55_0.step[2].pic = "xiaoqian"
	var_55_0.step[2].desc = language.get(220134)
	var_55_0.step[3] = {}
	var_55_0.step[3].type = 1
	var_55_0.step[3].pic = "xiaoqian"
	var_55_0.step[3].desc = language.get(220135)

	return var_55_0
end

function roleDialogue.constant.dialogueFrame_500()
	local var_56_0 = {}

	var_56_0.totalStep = 3
	var_56_0.step = {}
	var_56_0.step[1] = {}
	var_56_0.step[1].type = 1
	var_56_0.step[1].pic = "xiaoqian"
	var_56_0.step[1].desc = language.get(220136)
	var_56_0.step[2] = {}
	var_56_0.step[2].type = 1
	var_56_0.step[2].pic = "xiaoqian"
	var_56_0.step[2].desc = language.get(220137)
	var_56_0.step[3] = {}
	var_56_0.step[3].type = 1
	var_56_0.step[3].pic = "xiaoqian"
	var_56_0.step[3].desc = language.get(220138)

	return var_56_0
end

function roleDialogue.constant.dialogueFrame_510()
	local var_57_0 = {}

	var_57_0.totalStep = 3
	var_57_0.step = {}
	var_57_0.step[1] = {}
	var_57_0.step[1].type = 1
	var_57_0.step[1].pic = "xiaoqian"
	var_57_0.step[1].desc = language.get(220139)
	var_57_0.step[2] = {}
	var_57_0.step[2].type = 1
	var_57_0.step[2].pic = "xiaoqian"
	var_57_0.step[2].desc = language.get(220140)
	var_57_0.step[3] = {}
	var_57_0.step[3].type = 1
	var_57_0.step[3].pic = "xiaoqian"
	var_57_0.step[3].desc = language.get(220141)

	return var_57_0
end

function roleDialogue.constant.dialogueFrame_511()
	local var_58_0 = {}

	var_58_0.totalStep = 5
	var_58_0.step = {}
	var_58_0.step[1] = {}
	var_58_0.step[1].type = 1
	var_58_0.step[1].pic = "player"
	var_58_0.step[1].desc = language.get(220142)
	var_58_0.step[2] = {}
	var_58_0.step[2].type = 2
	var_58_0.step[2].pic = "zhangliang.png"
	var_58_0.step[2].desc = language.get(220143)
	var_58_0.step[3] = {}
	var_58_0.step[3].type = 1
	var_58_0.step[3].pic = "player"
	var_58_0.step[3].desc = language.get(220144)
	var_58_0.step[4] = {}
	var_58_0.step[4].type = 2
	var_58_0.step[4].pic = "zhangliang.png"
	var_58_0.step[4].desc = language.get(220145)
	var_58_0.step[5] = {}
	var_58_0.step[5].type = 1
	var_58_0.step[5].pic = "player"
	var_58_0.step[5].desc = language.get(220146)

	return var_58_0
end

function roleDialogue.constant.dialogueFrame_520()
	local var_59_0 = {}

	var_59_0.totalStep = 3
	var_59_0.step = {}
	var_59_0.step[1] = {}
	var_59_0.step[1].type = 1
	var_59_0.step[1].pic = "xiaoqian"
	var_59_0.step[1].desc = language.get(220147)
	var_59_0.step[2] = {}
	var_59_0.step[2].type = 1
	var_59_0.step[2].pic = "xiaoqian"
	var_59_0.step[2].desc = language.get(220148)
	var_59_0.step[3] = {}
	var_59_0.step[3].type = 1
	var_59_0.step[3].pic = "xiaoqian"
	var_59_0.step[3].desc = language.get(220149)

	return var_59_0
end

function roleDialogue.constant.dialogueFrame_530()
	local var_60_0 = {}

	var_60_0.totalStep = 2
	var_60_0.step = {}
	var_60_0.step[1] = {}
	var_60_0.step[1].type = 1
	var_60_0.step[1].pic = "xiaoqian"
	var_60_0.step[1].desc = language.get(220150)
	var_60_0.step[2] = {}
	var_60_0.step[2].type = 1
	var_60_0.step[2].pic = "xiaoqian"
	var_60_0.step[2].desc = language.get(220151)

	return var_60_0
end

function roleDialogue.constant.dialogueFrame_540()
	local var_61_0 = {}

	var_61_0.totalStep = 3
	var_61_0.step = {}
	var_61_0.step[1] = {}
	var_61_0.step[1].type = 1
	var_61_0.step[1].pic = "xiaoqian"
	var_61_0.step[1].desc = language.get(220152)
	var_61_0.step[2] = {}
	var_61_0.step[2].type = 1
	var_61_0.step[2].pic = "xiaoqian"
	var_61_0.step[2].desc = language.get(220153)
	var_61_0.step[3] = {}
	var_61_0.step[3].type = 1
	var_61_0.step[3].pic = "xiaoqian"
	var_61_0.step[3].desc = language.get(220154)

	return var_61_0
end

function roleDialogue.constant.dialogueFrame_550()
	local var_62_0 = {}

	var_62_0.totalStep = 2
	var_62_0.step = {}
	var_62_0.step[1] = {}
	var_62_0.step[1].type = 1
	var_62_0.step[1].pic = "xiaoqian"
	var_62_0.step[1].desc = language.get(220155)
	var_62_0.step[2] = {}
	var_62_0.step[2].type = 2
	var_62_0.step[2].pic = "player"
	var_62_0.step[2].desc = language.get(220156)

	return var_62_0
end

function roleDialogue.constant.dialogueFrame_560()
	local var_63_0 = {}

	var_63_0.totalStep = 1
	var_63_0.step = {}
	var_63_0.step[1] = {}
	var_63_0.step[1].type = 1
	var_63_0.step[1].pic = "xiaoqian"
	var_63_0.step[1].desc = language.get(220157)

	return var_63_0
end

function roleDialogue.constant.dialogueFrame_570()
	local var_64_0 = {}

	var_64_0.totalStep = 3
	var_64_0.step = {}
	var_64_0.step[1] = {}
	var_64_0.step[1].type = 1
	var_64_0.step[1].pic = "xiaoqian"
	var_64_0.step[1].desc = language.get(220158)
	var_64_0.step[2] = {}
	var_64_0.step[2].type = 1
	var_64_0.step[2].pic = "xiaoqian"
	var_64_0.step[2].desc = language.get(220159)
	var_64_0.step[3] = {}
	var_64_0.step[3].type = 1
	var_64_0.step[3].pic = "xiaoqian"
	var_64_0.step[3].desc = language.get(220160)
	var_64_0.open = "openqiangying"

	return var_64_0
end

function roleDialogue.constant.dialogueFrame_600()
	local var_65_0 = {}

	var_65_0.totalStep = 3
	var_65_0.step = {}
	var_65_0.step[1] = {}
	var_65_0.step[1].type = 1
	var_65_0.step[1].pic = "player"
	var_65_0.step[1].desc = language.get(220161)
	var_65_0.step[2] = {}
	var_65_0.step[2].type = 2
	var_65_0.step[2].pic = "xiaoqian"
	var_65_0.step[2].desc = language.get(220162)
	var_65_0.step[3] = {}
	var_65_0.step[3].type = 1
	var_65_0.step[3].pic = "zhangliao.png"
	var_65_0.step[3].desc = language.get(220163)

	return var_65_0
end

function roleDialogue.constant.dialogueFrame_620()
	local var_66_0 = {}

	var_66_0.totalStep = 7
	var_66_0.step = {}
	var_66_0.step[1] = {}
	var_66_0.step[1].type = 1
	var_66_0.step[1].pic = "xiaoqian"
	var_66_0.step[1].desc = language.get(220048)
	var_66_0.step[2] = {}
	var_66_0.step[2].type = 2
	var_66_0.step[2].pic = "player"
	var_66_0.step[2].desc = language.get(220049)
	var_66_0.step[3] = {}
	var_66_0.step[3].type = 1
	var_66_0.step[3].pic = "xiaoqian"
	var_66_0.step[3].desc = language.get(220050)
	var_66_0.step[4] = {}
	var_66_0.step[4].type = 1
	var_66_0.step[4].pic = "xiaoqian"
	var_66_0.step[4].desc = language.get("220640_xinshou")
	var_66_0.step[4].special = "zhanshu1"
	var_66_0.step[5] = {}
	var_66_0.step[5].type = 1
	var_66_0.step[5].pic = "xiaoqian"
	var_66_0.step[5].desc = language.get("220641_xinshou")
	var_66_0.step[5].special = "zhanshu2"
	var_66_0.step[6] = {}
	var_66_0.step[6].type = 1
	var_66_0.step[6].pic = "xiaoqian"
	var_66_0.step[6].desc = language.get("220642_xinshou")
	var_66_0.step[6].special = "zhanshu3"
	var_66_0.step[7] = {}
	var_66_0.step[7].type = 1
	var_66_0.step[7].pic = "xiaoqian"
	var_66_0.step[7].desc = language.get(220052)
	var_66_0.step[7].special = "zhanshu_end"

	return var_66_0
end

function roleDialogue.constant.dialogueFrame_162()
	local var_67_0 = {}

	var_67_0.totalStep = 2
	var_67_0.step = {}
	var_67_0.step[1] = {}
	var_67_0.step[1].type = 1
	var_67_0.step[1].pic = "xiaoqian"
	var_67_0.step[1].desc = language.get(220054)
	var_67_0.step[2] = {}
	var_67_0.step[2].type = 1
	var_67_0.step[2].pic = "xiaoqian"
	var_67_0.step[2].desc = language.get(220055)

	return var_67_0
end

function roleDialogue.constant.dialogueFrame_630()
	local var_68_0 = {}

	var_68_0.totalStep = 5
	var_68_0.step = {}
	var_68_0.step[1] = {}
	var_68_0.step[1].type = 2
	var_68_0.step[1].pic = "player"
	var_68_0.step[1].desc = language.get("220620_xinshou")
	var_68_0.step[2] = {}
	var_68_0.step[2].type = 1
	var_68_0.step[2].pic = "xiaoqian"
	var_68_0.step[2].desc = language.get("220621_xinshou")
	var_68_0.step[2].special = "zhanshu4"
	var_68_0.step[3] = {}
	var_68_0.step[3].type = 1
	var_68_0.step[3].pic = "xiaoqian"
	var_68_0.step[3].desc = language.get("220622_xinshou")
	var_68_0.step[4] = {}
	var_68_0.step[4].type = 1
	var_68_0.step[4].pic = "huaxiong.png"
	var_68_0.step[4].desc = language.get(220168)
	var_68_0.step[4].special = "zhanshu_end"
	var_68_0.step[5] = {}
	var_68_0.step[5].type = 2
	var_68_0.step[5].pic = "player"
	var_68_0.step[5].desc = language.get(220169)

	return var_68_0
end

function roleDialogue.constant.dialogueFrame_640()
	local var_69_0 = {}

	var_69_0.totalStep = 2
	var_69_0.step = {}
	var_69_0.step[1] = {}
	var_69_0.step[1].type = 1
	var_69_0.step[1].pic = "xiaoqian"
	var_69_0.step[1].desc = language.get(220171)
	var_69_0.step[2] = {}
	var_69_0.step[2].type = 2
	var_69_0.step[2].pic = "player"
	var_69_0.step[2].desc = language.get(220172)

	return var_69_0
end

function roleDialogue.constant.dialogueFrame_650()
	local var_70_0 = {}

	var_70_0.totalStep = 3
	var_70_0.step = {}
	var_70_0.step[1] = {}
	var_70_0.step[1].type = 1
	var_70_0.step[1].pic = "player"
	var_70_0.step[1].desc = language.get(220173)
	var_70_0.step[2] = {}
	var_70_0.step[2].type = 2
	var_70_0.step[2].pic = "huaxiong.png"
	var_70_0.step[2].desc = language.get(220174)
	var_70_0.step[3] = {}
	var_70_0.step[3].type = 1
	var_70_0.step[3].pic = "player"
	var_70_0.step[3].desc = language.get(220175)

	return var_70_0
end

function roleDialogue.constant.dialogueFrame_610()
	local var_71_0 = {}

	var_71_0.totalStep = 1
	var_71_0.step = {}
	var_71_0.step[1] = {}
	var_71_0.step[1].type = 1
	var_71_0.step[1].pic = "player"
	var_71_0.step[1].desc = language.get(220176)

	return var_71_0
end

function roleDialogue.constant.dialogueFrame_670()
	local var_72_0 = {}

	var_72_0.totalStep = 4
	var_72_0.step = {}
	var_72_0.step[1] = {}
	var_72_0.step[1].type = 1
	var_72_0.step[1].pic = "player"
	var_72_0.step[1].desc = language.get(220177)
	var_72_0.step[2] = {}
	var_72_0.step[2].type = 2
	var_72_0.step[2].pic = "lvbu.png"
	var_72_0.step[2].desc = language.get(220178)
	var_72_0.step[3] = {}
	var_72_0.step[3].type = 1
	var_72_0.step[3].pic = "player"
	var_72_0.step[3].desc = language.get(220179)
	var_72_0.step[4] = {}
	var_72_0.step[4].type = 2
	var_72_0.step[4].pic = "lvbu.png"
	var_72_0.step[4].desc = language.get(220180)

	return var_72_0
end

function roleDialogue.constant.dialogueFrame_690()
	local var_73_0 = {}

	var_73_0.totalStep = 5
	var_73_0.step = {}
	var_73_0.step[1] = {}
	var_73_0.step[1].type = 1
	var_73_0.step[1].pic = "player"
	var_73_0.step[1].desc = language.get(220181)
	var_73_0.step[2] = {}
	var_73_0.step[2].type = 2
	var_73_0.step[2].pic = "lvbu.png"
	var_73_0.step[2].desc = language.get(220182)
	var_73_0.step[3] = {}
	var_73_0.step[3].type = 1
	var_73_0.step[3].pic = "player"
	var_73_0.step[3].desc = language.get(220183)
	var_73_0.step[4] = {}
	var_73_0.step[4].type = 2
	var_73_0.step[4].pic = "lvbu.png"
	var_73_0.step[4].desc = language.get(220184)
	var_73_0.step[5] = {}
	var_73_0.step[5].type = 1
	var_73_0.step[5].pic = "player"
	var_73_0.step[5].desc = language.get(220185)

	return var_73_0
end

function roleDialogue.constant.dialogueFrame_700()
	local var_74_0 = {}

	var_74_0.totalStep = 3
	var_74_0.step = {}
	var_74_0.step[1] = {}
	var_74_0.step[1].type = 1
	var_74_0.step[1].pic = "player"
	var_74_0.step[1].desc = language.get(220186)
	var_74_0.step[2] = {}
	var_74_0.step[2].type = 2
	var_74_0.step[2].pic = "zhangliao.png"
	var_74_0.step[2].desc = language.get(220187)
	var_74_0.step[3] = {}
	var_74_0.step[3].type = 1
	var_74_0.step[3].pic = "player"
	var_74_0.step[3].desc = language.get(220188)

	return var_74_0
end

function roleDialogue.constant.dialogueFrame_720()
	local var_75_0 = {}

	var_75_0.totalStep = 2
	var_75_0.step = {}
	var_75_0.step[1] = {}
	var_75_0.step[1].type = 1
	var_75_0.step[1].pic = "xiaoqian"
	var_75_0.step[1].desc = language.get(220191)
	var_75_0.step[2] = {}
	var_75_0.step[2].type = 1
	var_75_0.step[2].pic = "xiaoqian"
	var_75_0.step[2].desc = language.get(220192)

	return var_75_0
end

function roleDialogue.constant.dialogueFrame_730()
	local var_76_0 = {}

	var_76_0.totalStep = 6
	var_76_0.step = {}
	var_76_0.step[1] = {}
	var_76_0.step[1].type = 1
	var_76_0.step[1].pic = "xiaoqian"
	var_76_0.step[1].desc = language.get(220193)
	var_76_0.step[2] = {}
	var_76_0.step[2].type = 1
	var_76_0.step[2].pic = "xiaoqian"
	var_76_0.step[2].desc = language.get(220194)
	var_76_0.step[3] = {}
	var_76_0.step[3].type = 1
	var_76_0.step[3].pic = "xiaoqian"
	var_76_0.step[3].desc = language.get(220195)
	var_76_0.step[4] = {}
	var_76_0.step[4].type = 1
	var_76_0.step[4].pic = "xiaoqian"
	var_76_0.step[4].desc = language.get(220196)
	var_76_0.step[5] = {}
	var_76_0.step[5].type = 1
	var_76_0.step[5].pic = "xiaoqian"
	var_76_0.step[5].desc = language.get(220197)
	var_76_0.step[6] = {}
	var_76_0.step[6].type = 1
	var_76_0.step[6].pic = "xiaoqian"
	var_76_0.step[6].desc = language.get(220198)
	var_76_0.open = "openGuide"

	return var_76_0
end

function roleDialogue.constant.dialogueFrame_770()
	local var_77_0 = {}

	var_77_0.totalStep = 3
	var_77_0.step = {}
	var_77_0.step[1] = {}
	var_77_0.step[1].type = 1
	var_77_0.step[1].pic = "xiaoqian"
	var_77_0.step[1].desc = language.get(220199)
	var_77_0.step[2] = {}
	var_77_0.step[2].type = 2
	var_77_0.step[2].pic = "player"
	var_77_0.step[2].desc = language.get(220200)
	var_77_0.step[3] = {}
	var_77_0.step[3].type = 1
	var_77_0.step[3].pic = "xiaoqian"
	var_77_0.step[3].desc = language.get(220201)

	return var_77_0
end

function roleDialogue.constant.dialogueFrame_790()
	local var_78_0 = {}

	var_78_0.totalStep = 3
	var_78_0.step = {}
	var_78_0.step[1] = {}
	var_78_0.step[1].type = 1
	var_78_0.step[1].pic = "player"
	var_78_0.step[1].desc = language.get(220202)
	var_78_0.step[2] = {}
	var_78_0.step[2].type = 2
	var_78_0.step[2].pic = "pangde.png"
	var_78_0.step[2].desc = language.get(220203)
	var_78_0.step[3] = {}
	var_78_0.step[3].type = 1
	var_78_0.step[3].pic = "player"
	var_78_0.step[3].desc = language.get(220204)

	return var_78_0
end

function roleDialogue.constant.dialogueFrame_800()
	local var_79_0 = {}

	var_79_0.totalStep = 2
	var_79_0.step = {}
	var_79_0.step[1] = {}
	var_79_0.step[1].type = 1
	var_79_0.step[1].pic = "player"
	var_79_0.step[1].desc = language.get(220205)
	var_79_0.step[2] = {}
	var_79_0.step[2].type = 2
	var_79_0.step[2].pic = "machao.png"
	var_79_0.step[2].desc = language.get(220206)

	return var_79_0
end

function roleDialogue.constant.dialogueFrame_810()
	local var_80_0 = {}

	var_80_0.totalStep = 3
	var_80_0.step = {}
	var_80_0.step[1] = {}
	var_80_0.step[1].type = 1
	var_80_0.step[1].pic = "zhugeliang.png"
	var_80_0.step[1].desc = language.get(320101)
	var_80_0.step[2] = {}
	var_80_0.step[2].type = 1
	var_80_0.step[2].pic = "zhugeliang.png"
	var_80_0.step[2].desc = language.get(320102)
	var_80_0.step[3] = {}
	var_80_0.step[3].type = 2
	var_80_0.step[3].pic = "player"
	var_80_0.step[3].desc = language.get(320103)
	var_80_0.open = "openDayTrain"

	return var_80_0
end

function roleDialogue.constant.dialogueFrame_811()
	local var_81_0 = {}

	var_81_0.totalStep = 3
	var_81_0.step = {}
	var_81_0.step[1] = {}
	var_81_0.step[1].type = 1
	var_81_0.step[1].pic = "zhouyu.png"
	var_81_0.step[1].desc = language.get(320101)
	var_81_0.step[2] = {}
	var_81_0.step[2].type = 1
	var_81_0.step[2].pic = "zhouyu,png"
	var_81_0.step[2].desc = language.get(320102)
	var_81_0.step[3] = {}
	var_81_0.step[3].type = 2
	var_81_0.step[3].pic = "player"
	var_81_0.step[3].desc = language.get(320103)
	var_81_0.open = "openDayTrain"

	return var_81_0
end

function roleDialogue.constant.dialogueFrame_812()
	local var_82_0 = {}

	var_82_0.totalStep = 3
	var_82_0.step = {}
	var_82_0.step[1] = {}
	var_82_0.step[1].type = 1
	var_82_0.step[1].pic = "guojia.png"
	var_82_0.step[1].desc = language.get(320101)
	var_82_0.step[2] = {}
	var_82_0.step[2].type = 1
	var_82_0.step[2].pic = "guojia.png"
	var_82_0.step[2].desc = language.get(320102)
	var_82_0.step[3] = {}
	var_82_0.step[3].type = 2
	var_82_0.step[3].pic = "player"
	var_82_0.step[3].desc = language.get(320103)
	var_82_0.open = "openDayTrain"

	return var_82_0
end

function roleDialogue.constant.dialogueFrame_840()
	local var_83_0 = {}

	var_83_0.totalStep = 2
	var_83_0.step = {}
	var_83_0.step[1] = {}
	var_83_0.step[1].type = 1
	var_83_0.step[1].pic = "zhugeliang.png"
	var_83_0.step[1].desc = language.get(320200)
	var_83_0.step[2] = {}
	var_83_0.step[2].type = 2
	var_83_0.step[2].pic = "xiaoqian"
	var_83_0.step[2].desc = language.get(320201)
	var_83_0.open = "openJinNang"

	return var_83_0
end

function roleDialogue.constant.dialogueFrame_841()
	local var_84_0 = {}

	var_84_0.totalStep = 2
	var_84_0.step = {}
	var_84_0.step[1] = {}
	var_84_0.step[1].type = 1
	var_84_0.step[1].pic = "zhouyu.png"
	var_84_0.step[1].desc = language.get(320200)
	var_84_0.step[2] = {}
	var_84_0.step[2].type = 2
	var_84_0.step[2].pic = "xiaoqian"
	var_84_0.step[2].desc = language.get(320201)
	var_84_0.open = "openJinNang"

	return var_84_0
end

function roleDialogue.constant.dialogueFrame_842()
	local var_85_0 = {}

	var_85_0.totalStep = 2
	var_85_0.step = {}
	var_85_0.step[1] = {}
	var_85_0.step[1].type = 1
	var_85_0.step[1].pic = "guojia.png"
	var_85_0.step[1].desc = language.get(320200)
	var_85_0.step[2] = {}
	var_85_0.step[2].type = 2
	var_85_0.step[2].pic = "xiaoqian"
	var_85_0.step[2].desc = language.get(320201)
	var_85_0.open = "openJinNang"

	return var_85_0
end

function roleDialogue.constant.dialogueFrame_820()
	local var_86_0 = {}

	var_86_0.totalStep = 1
	var_86_0.step = {}
	var_86_0.step[1] = {}
	var_86_0.step[1].type = 1
	var_86_0.step[1].pic = "xiaoqian"
	var_86_0.step[1].desc = language.get(220207)
	var_86_0.open = "openDayily"

	return var_86_0
end

function roleDialogue.constant.dialogueFrame_830()
	local var_87_0 = {}

	var_87_0.totalStep = 2
	var_87_0.step = {}
	var_87_0.step[1] = {}
	var_87_0.step[1].type = 1
	var_87_0.step[1].pic = "xiaoqian"
	var_87_0.step[1].desc = language.get(220208)
	var_87_0.step[2] = {}
	var_87_0.step[2].type = 1
	var_87_0.step[2].pic = "xiaoqian"
	var_87_0.step[2].desc = language.get(220209)

	return var_87_0
end

function roleDialogue.constant.dialogueFrame_850()
	local var_88_0 = {}

	var_88_0.totalStep = 4
	var_88_0.step = {}
	var_88_0.step[1] = {}
	var_88_0.step[1].type = 1
	var_88_0.step[1].pic = "xiaoqian"
	var_88_0.step[1].desc = language.get(220210)
	var_88_0.step[2] = {}
	var_88_0.step[2].type = 2
	var_88_0.step[2].pic = "player"
	var_88_0.step[2].desc = language.get(220211)
	var_88_0.step[3] = {}
	var_88_0.step[3].type = 1
	var_88_0.step[3].pic = "xiaoqian"
	var_88_0.step[3].desc = language.get(220212)
	var_88_0.step[4] = {}
	var_88_0.step[4].type = 1
	var_88_0.step[4].pic = "xiaoqian"
	var_88_0.step[4].desc = language.get(220213)

	return var_88_0
end

function roleDialogue.constant.dialogueFrame_870()
	local var_89_0 = {}

	var_89_0.totalStep = 2
	var_89_0.step = {}
	var_89_0.step[1] = {}
	var_89_0.step[1].type = 1
	var_89_0.step[1].pic = "xiaoqian"
	var_89_0.step[1].desc = language.get(220214)
	var_89_0.step[2] = {}
	var_89_0.step[2].type = 1
	var_89_0.step[2].pic = "xiaoqian"
	var_89_0.step[2].desc = language.get(220215)

	return var_89_0
end

function roleDialogue.constant.dialogueFrame_890()
	local var_90_0 = {}

	var_90_0.totalStep = 3
	var_90_0.step = {}
	var_90_0.step[1] = {}
	var_90_0.step[1].type = 1
	var_90_0.step[1].pic = "player"
	var_90_0.step[1].desc = language.get(220216)
	var_90_0.step[2] = {}
	var_90_0.step[2].type = 2
	var_90_0.step[2].pic = "xiaoqian"
	var_90_0.step[2].desc = language.get(220217)
	var_90_0.step[3] = {}
	var_90_0.step[3].type = 1
	var_90_0.step[3].pic = "player"
	var_90_0.step[3].desc = language.get(220218)

	return var_90_0
end

function roleDialogue.constant.dialogueFrame_900()
	local var_91_0 = {}

	var_91_0.totalStep = 3
	var_91_0.step = {}
	var_91_0.step[1] = {}
	var_91_0.step[1].type = 1
	var_91_0.step[1].pic = "player"
	var_91_0.step[1].desc = language.get(220219)
	var_91_0.step[2] = {}
	var_91_0.step[2].type = 2
	var_91_0.step[2].pic = "xiaoqian"
	var_91_0.step[2].desc = language.get(220220)
	var_91_0.step[3] = {}
	var_91_0.step[3].type = 1
	var_91_0.step[3].pic = "player"
	var_91_0.step[3].desc = language.get(220221)

	return var_91_0
end

function roleDialogue.constant.dialogueFrame_bonus702_1()
	local var_92_0 = {}

	var_92_0.totalStep = 4
	var_92_0.step = {}
	var_92_0.step[1] = {}
	var_92_0.step[1].type = 1
	var_92_0.step[1].pic = "xiaoqian"
	var_92_0.step[1].desc = language.get(220222)
	var_92_0.step[2] = {}
	var_92_0.step[2].type = 2
	var_92_0.step[2].pic = "player"
	var_92_0.step[2].desc = language.get(220223)
	var_92_0.step[3] = {}
	var_92_0.step[3].type = 1
	var_92_0.step[3].pic = "xiaoqian"
	var_92_0.step[3].desc = language.get(220224)
	var_92_0.step[4] = {}
	var_92_0.step[4].type = 2
	var_92_0.step[4].pic = "player"
	var_92_0.step[4].desc = language.get(220225)

	return var_92_0
end

function roleDialogue.constant.dialogueFrame_930()
	local var_93_0 = {}

	var_93_0.totalStep = 3
	var_93_0.step = {}
	var_93_0.step[1] = {}
	var_93_0.step[1].type = 1
	var_93_0.step[1].pic = "player"
	var_93_0.step[1].desc = language.get(220226)
	var_93_0.step[2] = {}
	var_93_0.step[2].type = 2
	var_93_0.step[2].pic = "machao.png"
	var_93_0.step[2].desc = language.get(220227)
	var_93_0.step[3] = {}
	var_93_0.step[3].type = 1
	var_93_0.step[3].pic = "player"
	var_93_0.step[3].desc = language.get(220228)

	return var_93_0
end

function roleDialogue.constant.dialogueFrame_940()
	local var_94_0 = {}

	var_94_0.totalStep = 4
	var_94_0.step = {}
	var_94_0.step[1] = {}
	var_94_0.step[1].type = 1
	var_94_0.step[1].pic = "player"
	var_94_0.step[1].desc = language.get(220229)
	var_94_0.step[2] = {}
	var_94_0.step[2].type = 2
	var_94_0.step[2].pic = "machao.png"
	var_94_0.step[2].desc = language.get(220230)
	var_94_0.step[3] = {}
	var_94_0.step[3].type = 1
	var_94_0.step[3].pic = "player"
	var_94_0.step[3].desc = language.get(220231)
	var_94_0.step[4] = {}
	var_94_0.step[4].type = 2
	var_94_0.step[4].pic = "machao.png"
	var_94_0.step[4].desc = language.get(220232)

	return var_94_0
end

function roleDialogue.constant.dialogueFrame_950()
	local var_95_0 = {}

	var_95_0.totalStep = 5
	var_95_0.step = {}
	var_95_0.step[1] = {}
	var_95_0.step[1].type = 1
	var_95_0.step[1].pic = "player"
	var_95_0.step[1].desc = language.get(220233)
	var_95_0.step[2] = {}
	var_95_0.step[2].type = 2
	var_95_0.step[2].pic = "machao.png"
	var_95_0.step[2].desc = language.get(220234)
	var_95_0.step[3] = {}
	var_95_0.step[3].type = 1
	var_95_0.step[3].pic = "player"
	var_95_0.step[3].desc = language.get(220235)
	var_95_0.step[4] = {}
	var_95_0.step[4].type = 2
	var_95_0.step[4].pic = "machao.png"
	var_95_0.step[4].desc = language.get(220236)
	var_95_0.step[5] = {}
	var_95_0.step[5].type = 1
	var_95_0.step[5].pic = "xiaoqian"
	var_95_0.step[5].desc = language.get(220237)

	return var_95_0
end

function roleDialogue.constant.dialogueFrame_bonus703_1()
	local var_96_0 = {}

	var_96_0.totalStep = 5
	var_96_0.step = {}
	var_96_0.step[1] = {}
	var_96_0.step[1].type = 1
	var_96_0.step[1].pic = "player"
	var_96_0.step[1].desc = language.get(220238)
	var_96_0.step[2] = {}
	var_96_0.step[2].type = 2
	var_96_0.step[2].pic = "mateng.png"
	var_96_0.step[2].desc = language.get(220239)
	var_96_0.step[3] = {}
	var_96_0.step[3].type = 1
	var_96_0.step[3].pic = "player"
	var_96_0.step[3].desc = language.get(220240)
	var_96_0.step[4] = {}
	var_96_0.step[4].type = 2
	var_96_0.step[4].pic = "machao.png"
	var_96_0.step[4].desc = language.get(220241)
	var_96_0.step[5] = {}
	var_96_0.step[5].type = 1
	var_96_0.step[5].pic = "player"
	var_96_0.step[5].desc = language.get(220242)

	return var_96_0
end

function roleDialogue.constant.dialogueFrame_990()
	local var_97_0 = {}

	var_97_0.totalStep = 3
	var_97_0.step = {}
	var_97_0.step[1] = {}
	var_97_0.step[1].type = 1
	var_97_0.step[1].pic = "player"
	var_97_0.step[1].desc = language.get(220243)
	var_97_0.step[2] = {}
	var_97_0.step[2].type = 2
	var_97_0.step[2].pic = "xiaoqian"
	var_97_0.step[2].desc = language.get(220244)
	var_97_0.step[3] = {}
	var_97_0.step[3].type = 1
	var_97_0.step[3].pic = "player"
	var_97_0.step[3].desc = language.get(220245)

	return var_97_0
end

function roleDialogue.constant.dialogueFrame_1000()
	local var_98_0 = {}

	var_98_0.totalStep = 4
	var_98_0.step = {}
	var_98_0.step[1] = {}
	var_98_0.step[1].type = 1
	var_98_0.step[1].pic = "player"
	var_98_0.step[1].desc = language.get(220246)
	var_98_0.step[2] = {}
	var_98_0.step[2].type = 2
	var_98_0.step[2].pic = "xiaoqian"
	var_98_0.step[2].desc = language.get(220247)
	var_98_0.step[3] = {}
	var_98_0.step[3].type = 1
	var_98_0.step[3].pic = "player"
	var_98_0.step[3].desc = language.get(220248)
	var_98_0.step[4] = {}
	var_98_0.step[4].type = 2
	var_98_0.step[4].pic = "xiaoqian"
	var_98_0.step[4].desc = language.get(220249)

	return var_98_0
end

function roleDialogue.constant.dialogueFrame_1010()
	local var_99_0 = {}

	var_99_0.totalStep = 4
	var_99_0.step = {}
	var_99_0.step[1] = {}
	var_99_0.step[1].type = 1
	var_99_0.step[1].pic = "player"
	var_99_0.step[1].desc = language.get(220250)
	var_99_0.step[2] = {}
	var_99_0.step[2].type = 2
	var_99_0.step[2].pic = "guojia.png"
	var_99_0.step[2].desc = language.get(220251)
	var_99_0.step[3] = {}
	var_99_0.step[3].type = 1
	var_99_0.step[3].pic = "player"
	var_99_0.step[3].desc = language.get(220252)
	var_99_0.step[4] = {}
	var_99_0.step[4].type = 2
	var_99_0.step[4].pic = "xiaoqian"
	var_99_0.step[4].desc = language.get(220253)

	return var_99_0
end

function roleDialogue.constant.dialogueFrame_1020()
	local var_100_0 = {}

	var_100_0.totalStep = 3
	var_100_0.step = {}
	var_100_0.step[1] = {}
	var_100_0.step[1].type = 1
	var_100_0.step[1].pic = "player"
	var_100_0.step[1].desc = language.get(220254)
	var_100_0.step[2] = {}
	var_100_0.step[2].type = 2
	var_100_0.step[2].pic = "guojia.png"
	var_100_0.step[2].desc = language.get(220255)
	var_100_0.step[3] = {}
	var_100_0.step[3].type = 1
	var_100_0.step[3].pic = "player"
	var_100_0.step[3].desc = language.get(220256)

	return var_100_0
end

function roleDialogue.constant.dialogueFrame_1030()
	local var_101_0 = {}

	var_101_0.totalStep = 5
	var_101_0.step = {}
	var_101_0.step[1] = {}
	var_101_0.step[1].type = 1
	var_101_0.step[1].pic = "chengyu.png"
	var_101_0.step[1].desc = language.get(220257)
	var_101_0.step[2] = {}
	var_101_0.step[2].type = 2
	var_101_0.step[2].pic = "guojia.png"
	var_101_0.step[2].desc = language.get(220258)
	var_101_0.step[3] = {}
	var_101_0.step[3].type = 1
	var_101_0.step[3].pic = "player"
	var_101_0.step[3].desc = language.get(220259)
	var_101_0.step[4] = {}
	var_101_0.step[4].type = 2
	var_101_0.step[4].pic = "guojia.png"
	var_101_0.step[4].desc = language.get(220260)
	var_101_0.step[5] = {}
	var_101_0.step[5].type = 1
	var_101_0.step[5].pic = "player"
	var_101_0.step[5].desc = language.get(220261)

	return var_101_0
end

function roleDialogue.constant.dialogueFrame_1040()
	local var_102_0 = {}

	var_102_0.totalStep = 4
	var_102_0.step = {}
	var_102_0.step[1] = {}
	var_102_0.step[1].type = 1
	var_102_0.step[1].pic = "player"
	var_102_0.step[1].desc = language.get(220262)
	var_102_0.step[2] = {}
	var_102_0.step[2].type = 2
	var_102_0.step[2].pic = "guojia.png"
	var_102_0.step[2].desc = language.get(220263)
	var_102_0.step[3] = {}
	var_102_0.step[3].type = 1
	var_102_0.step[3].pic = "xiaoqian"
	var_102_0.step[3].desc = language.get(220264)
	var_102_0.step[4] = {}
	var_102_0.step[4].type = 2
	var_102_0.step[4].pic = "player"
	var_102_0.step[4].desc = language.get(220265)

	return var_102_0
end

function roleDialogue.constant.dialogueFrame_1050()
	local var_103_0 = {}

	var_103_0.totalStep = 6
	var_103_0.step = {}
	var_103_0.step[1] = {}
	var_103_0.step[1].type = 1
	var_103_0.step[1].pic = "player"
	var_103_0.step[1].desc = language.get(220266)
	var_103_0.step[2] = {}
	var_103_0.step[2].type = 2
	var_103_0.step[2].pic = "xiaoqian"
	var_103_0.step[2].desc = language.get(220267)
	var_103_0.step[3] = {}
	var_103_0.step[3].type = 1
	var_103_0.step[3].pic = "player"
	var_103_0.step[3].desc = language.get(220268)
	var_103_0.step[4] = {}
	var_103_0.step[4].type = 1
	var_103_0.step[4].pic = "player"
	var_103_0.step[4].desc = language.get(220269)
	var_103_0.step[5] = {}
	var_103_0.step[5].type = 2
	var_103_0.step[5].pic = "dianwei.png"
	var_103_0.step[5].desc = language.get(220270)
	var_103_0.step[6] = {}
	var_103_0.step[6].type = 1
	var_103_0.step[6].pic = "player"
	var_103_0.step[6].desc = language.get(220271)

	return var_103_0
end

function roleDialogue.constant.dialogueFrame_1060()
	local var_104_0 = {}

	var_104_0.totalStep = 5
	var_104_0.step = {}
	var_104_0.step[1] = {}
	var_104_0.step[1].type = 1
	var_104_0.step[1].pic = "player"
	var_104_0.step[1].desc = language.get(220272)
	var_104_0.step[2] = {}
	var_104_0.step[2].type = 2
	var_104_0.step[2].pic = "dianwei.png"
	var_104_0.step[2].desc = language.get(220273)
	var_104_0.step[3] = {}
	var_104_0.step[3].type = 1
	var_104_0.step[3].pic = "player"
	var_104_0.step[3].desc = language.get(220274)
	var_104_0.step[4] = {}
	var_104_0.step[4].type = 2
	var_104_0.step[4].pic = "dianwei.png"
	var_104_0.step[4].desc = language.get(220275)
	var_104_0.step[5] = {}
	var_104_0.step[5].type = 1
	var_104_0.step[5].pic = "player"
	var_104_0.step[5].desc = language.get(220276)

	return var_104_0
end

function roleDialogue.constant.dialogueFrame_1070()
	local var_105_0 = {}

	var_105_0.totalStep = 6
	var_105_0.step = {}
	var_105_0.step[1] = {}
	var_105_0.step[1].type = 1
	var_105_0.step[1].pic = "player"
	var_105_0.step[1].desc = language.get(220277)
	var_105_0.step[2] = {}
	var_105_0.step[2].type = 2
	var_105_0.step[2].pic = "dianwei.png"
	var_105_0.step[2].desc = language.get(220278)
	var_105_0.step[3] = {}
	var_105_0.step[3].type = 1
	var_105_0.step[3].pic = "player"
	var_105_0.step[3].desc = language.get(220279)
	var_105_0.step[4] = {}
	var_105_0.step[4].type = 2
	var_105_0.step[4].pic = "xiaoqian"
	var_105_0.step[4].desc = language.get(220280)
	var_105_0.step[5] = {}
	var_105_0.step[5].type = 2
	var_105_0.step[5].pic = "dianwei.png"
	var_105_0.step[5].desc = language.get(220281)
	var_105_0.step[6] = {}
	var_105_0.step[6].type = 1
	var_105_0.step[6].pic = "player"
	var_105_0.step[6].desc = language.get(220282)

	return var_105_0
end

function roleDialogue.constant.dialogueFrame_1080()
	local var_106_0 = {}

	var_106_0.totalStep = 4
	var_106_0.step = {}
	var_106_0.step[1] = {}
	var_106_0.step[1].type = 1
	var_106_0.step[1].pic = "player"
	var_106_0.step[1].desc = language.get(220283)
	var_106_0.step[2] = {}
	var_106_0.step[2].type = 2
	var_106_0.step[2].pic = "caocao.png"
	var_106_0.step[2].desc = language.get(220284)
	var_106_0.step[3] = {}
	var_106_0.step[3].type = 1
	var_106_0.step[3].pic = "player"
	var_106_0.step[3].desc = language.get(220285)
	var_106_0.step[4] = {}
	var_106_0.step[4].type = 2
	var_106_0.step[4].pic = "caocao.png"
	var_106_0.step[4].desc = language.get(220286)

	return var_106_0
end

function roleDialogue.constant.dialogueFrame_1090()
	local var_107_0 = {}

	var_107_0.totalStep = 4
	var_107_0.step = {}
	var_107_0.step[1] = {}
	var_107_0.step[1].type = 1
	var_107_0.step[1].pic = "player"
	var_107_0.step[1].desc = language.get(220287)
	var_107_0.step[2] = {}
	var_107_0.step[2].type = 2
	var_107_0.step[2].pic = "caocao.png"
	var_107_0.step[2].desc = language.get(220288)
	var_107_0.step[3] = {}
	var_107_0.step[3].type = 1
	var_107_0.step[3].pic = "player"
	var_107_0.step[3].desc = language.get(220289)
	var_107_0.step[4] = {}
	var_107_0.step[4].type = 2
	var_107_0.step[4].pic = "caocao.png"
	var_107_0.step[4].desc = language.get(220290)

	return var_107_0
end

function roleDialogue.constant.dialogueFrame_1111()
	local var_108_0 = {}

	var_108_0.totalStep = 5
	var_108_0.step = {}
	var_108_0.step[1] = {}
	var_108_0.step[1].type = 1
	var_108_0.step[1].pic = "player"
	var_108_0.step[1].desc = language.get(220295)
	var_108_0.step[2] = {}
	var_108_0.step[2].type = 2
	var_108_0.step[2].pic = "xiahouyuan.png"
	var_108_0.step[2].desc = language.get(220296)
	var_108_0.step[3] = {}
	var_108_0.step[3].type = 1
	var_108_0.step[3].pic = "player"
	var_108_0.step[3].desc = language.get(220297)
	var_108_0.step[4] = {}
	var_108_0.step[4].type = 2
	var_108_0.step[4].pic = "xiahouyuan.png"
	var_108_0.step[4].desc = language.get(220298)
	var_108_0.step[5] = {}
	var_108_0.step[5].type = 1
	var_108_0.step[5].pic = "player"
	var_108_0.step[5].desc = language.get(220299)

	return var_108_0
end

function roleDialogue.constant.dialogueFrame_1112()
	local var_109_0 = {}

	var_109_0.totalStep = 5
	var_109_0.step = {}
	var_109_0.step[1] = {}
	var_109_0.step[1].type = 1
	var_109_0.step[1].pic = "player"
	var_109_0.step[1].desc = language.get(220300)
	var_109_0.step[2] = {}
	var_109_0.step[2].type = 2
	var_109_0.step[2].pic = "xuhuang.png"
	var_109_0.step[2].desc = language.get(220301)
	var_109_0.step[3] = {}
	var_109_0.step[3].type = 1
	var_109_0.step[3].pic = "player"
	var_109_0.step[3].desc = language.get(220302)
	var_109_0.step[4] = {}
	var_109_0.step[4].type = 2
	var_109_0.step[4].pic = "xuhuang.png"
	var_109_0.step[4].desc = language.get(220303)
	var_109_0.step[5] = {}
	var_109_0.step[5].type = 1
	var_109_0.step[5].pic = "player"
	var_109_0.step[5].desc = language.get(220304)

	return var_109_0
end

function roleDialogue.constant.dialogueFrame_1113()
	local var_110_0 = {}

	var_110_0.totalStep = 3
	var_110_0.step = {}
	var_110_0.step[1] = {}
	var_110_0.step[1].type = 1
	var_110_0.step[1].pic = "player"
	var_110_0.step[1].desc = language.get(220305)
	var_110_0.step[2] = {}
	var_110_0.step[2].type = 2
	var_110_0.step[2].pic = "xiahoudun.png"
	var_110_0.step[2].desc = language.get(220306)
	var_110_0.step[3] = {}
	var_110_0.step[3].type = 1
	var_110_0.step[3].pic = "player"
	var_110_0.step[3].desc = language.get(220307)

	return var_110_0
end

function roleDialogue.constant.dialogueFrame_1114()
	local var_111_0 = {}

	var_111_0.totalStep = 3
	var_111_0.step = {}
	var_111_0.step[1] = {}
	var_111_0.step[1].type = 1
	var_111_0.step[1].pic = "player"
	var_111_0.step[1].desc = language.get(220308)
	var_111_0.step[2] = {}
	var_111_0.step[2].type = 2
	var_111_0.step[2].pic = "sunce.png"
	var_111_0.step[2].desc = language.get(220309)
	var_111_0.step[3] = {}
	var_111_0.step[3].type = 1
	var_111_0.step[3].pic = "player"
	var_111_0.step[3].desc = language.get(220310)

	return var_111_0
end

function roleDialogue.constant.dialogueFrame_1115()
	local var_112_0 = {}

	var_112_0.totalStep = 4
	var_112_0.step = {}
	var_112_0.step[1] = {}
	var_112_0.step[1].type = 1
	var_112_0.step[1].pic = "player"
	var_112_0.step[1].desc = language.get(220311)
	var_112_0.step[2] = {}
	var_112_0.step[2].type = 2
	var_112_0.step[2].pic = "sunce.png"
	var_112_0.step[2].desc = language.get(220312)
	var_112_0.step[3] = {}
	var_112_0.step[3].type = 1
	var_112_0.step[3].pic = "player"
	var_112_0.step[3].desc = language.get(220313)
	var_112_0.step[4] = {}
	var_112_0.step[4].type = 2
	var_112_0.step[4].pic = "sunce.png"
	var_112_0.step[4].desc = language.get(220314)

	return var_112_0
end

function roleDialogue.constant.dialogueFrame_1116()
	local var_113_0 = {}

	var_113_0.totalStep = 4
	var_113_0.step = {}
	var_113_0.step[1] = {}
	var_113_0.step[1].type = 1
	var_113_0.step[1].pic = "player"
	var_113_0.step[1].desc = language.get(220315)
	var_113_0.step[2] = {}
	var_113_0.step[2].type = 2
	var_113_0.step[2].pic = "xiaoqiao.png"
	var_113_0.step[2].desc = language.get(220316)
	var_113_0.step[3] = {}
	var_113_0.step[3].type = 1
	var_113_0.step[3].pic = "player"
	var_113_0.step[3].desc = language.get(220317)
	var_113_0.step[4] = {}
	var_113_0.step[4].type = 2
	var_113_0.step[4].pic = "xiaoqiao.png"
	var_113_0.step[4].desc = language.get(220318)

	return var_113_0
end

function roleDialogue.constant.dialogueFrame_1117()
	local var_114_0 = {}

	var_114_0.totalStep = 3
	var_114_0.step = {}
	var_114_0.step[1] = {}
	var_114_0.step[1].type = 1
	var_114_0.step[1].pic = "xiaoqian"
	var_114_0.step[1].desc = language.get(220319)
	var_114_0.step[2] = {}
	var_114_0.step[2].type = 1
	var_114_0.step[2].pic = "xiaoqian"
	var_114_0.step[2].desc = language.get(220320)
	var_114_0.step[3] = {}
	var_114_0.step[3].type = 1
	var_114_0.step[3].pic = "xiaoqian"
	var_114_0.step[3].desc = language.get(220321)
	var_114_0.open = "openExp"

	return var_114_0
end

function roleDialogue.constant.dialogueFrame_1118()
	local var_115_0 = {}

	var_115_0.totalStep = 4
	var_115_0.step = {}
	var_115_0.step[1] = {}
	var_115_0.step[1].type = 1
	var_115_0.step[1].pic = "player"
	var_115_0.step[1].desc = language.get(220322)
	var_115_0.step[2] = {}
	var_115_0.step[2].type = 2
	var_115_0.step[2].pic = "xuchu.png"
	var_115_0.step[2].desc = language.get(220323)
	var_115_0.step[3] = {}
	var_115_0.step[3].type = 1
	var_115_0.step[3].pic = "xiaoqian"
	var_115_0.step[3].desc = language.get(220324)
	var_115_0.step[4] = {}
	var_115_0.step[4].type = 2
	var_115_0.step[4].pic = "xuchu.png"
	var_115_0.step[4].desc = language.get(220325)

	return var_115_0
end

function roleDialogue.constant.dialogueFrame_1119()
	local var_116_0 = {}

	var_116_0.totalStep = 4
	var_116_0.step = {}
	var_116_0.step[1] = {}
	var_116_0.step[1].type = 1
	var_116_0.step[1].pic = "player"
	var_116_0.step[1].desc = language.get(220326)
	var_116_0.step[2] = {}
	var_116_0.step[2].type = 2
	var_116_0.step[2].pic = "xuchu.png"
	var_116_0.step[2].desc = language.get(220327)
	var_116_0.step[3] = {}
	var_116_0.step[3].type = 1
	var_116_0.step[3].pic = "player"
	var_116_0.step[3].desc = language.get(220328)
	var_116_0.step[4] = {}
	var_116_0.step[4].type = 2
	var_116_0.step[4].pic = "xuchu.png"
	var_116_0.step[4].desc = language.get(220329)

	return var_116_0
end

function roleDialogue.constant.dialogueFrame_1120()
	local var_117_0 = {}

	var_117_0.totalStep = 3
	var_117_0.step = {}
	var_117_0.step[1] = {}
	var_117_0.step[1].type = 1
	var_117_0.step[1].pic = "player"
	var_117_0.step[1].desc = language.get(220330)
	var_117_0.step[2] = {}
	var_117_0.step[2].type = 2
	var_117_0.step[2].pic = "xuchu.png"
	var_117_0.step[2].desc = language.get(220331)
	var_117_0.step[3] = {}
	var_117_0.step[3].type = 1
	var_117_0.step[3].pic = "player"
	var_117_0.step[3].desc = language.get(220332)

	return var_117_0
end

function roleDialogue.constant.dialogueFrame_1130()
	local var_118_0 = {}

	var_118_0.totalStep = 5
	var_118_0.step = {}
	var_118_0.step[1] = {}
	var_118_0.step[1].type = 1
	var_118_0.step[1].pic = "player"
	var_118_0.step[1].desc = language.get(220333)
	var_118_0.step[2] = {}
	var_118_0.step[2].type = 2
	var_118_0.step[2].pic = "zhurong.png"
	var_118_0.step[2].desc = language.get(220334)
	var_118_0.step[3] = {}
	var_118_0.step[3].type = 1
	var_118_0.step[3].pic = "xiaoqian"
	var_118_0.step[3].desc = language.get(220335)
	var_118_0.step[4] = {}
	var_118_0.step[4].type = 2
	var_118_0.step[4].pic = "zhurong.png"
	var_118_0.step[4].desc = language.get(220336)
	var_118_0.step[5] = {}
	var_118_0.step[5].type = 1
	var_118_0.step[5].pic = "xiaoqian"
	var_118_0.step[5].desc = language.get(220337)

	return var_118_0
end

function roleDialogue.constant.dialogueFrame_1140()
	local var_119_0 = {}

	var_119_0.totalStep = 3
	var_119_0.step = {}
	var_119_0.step[1] = {}
	var_119_0.step[1].type = 1
	var_119_0.step[1].pic = "player"
	var_119_0.step[1].desc = language.get(220338)
	var_119_0.step[2] = {}
	var_119_0.step[2].type = 2
	var_119_0.step[2].pic = "xiaoqian"
	var_119_0.step[2].desc = language.get(220339)
	var_119_0.step[3] = {}
	var_119_0.step[3].type = 1
	var_119_0.step[3].pic = "player"
	var_119_0.step[3].desc = language.get(220340)

	return var_119_0
end

function roleDialogue.constant.dialogueFrame_1150()
	local var_120_0 = {}

	var_120_0.totalStep = 5
	var_120_0.step = {}
	var_120_0.step[1] = {}
	var_120_0.step[1].type = 1
	var_120_0.step[1].pic = "player"
	var_120_0.step[1].desc = language.get(220341)
	var_120_0.step[2] = {}
	var_120_0.step[2].type = 2
	var_120_0.step[2].pic = "xiaoqian"
	var_120_0.step[2].desc = language.get(220342)
	var_120_0.step[3] = {}
	var_120_0.step[3].type = 2
	var_120_0.step[3].pic = "huangzhong.png"
	var_120_0.step[3].desc = language.get(220343)
	var_120_0.step[4] = {}
	var_120_0.step[4].type = 1
	var_120_0.step[4].pic = "player"
	var_120_0.step[4].desc = language.get(220344)
	var_120_0.step[5] = {}
	var_120_0.step[5].type = 2
	var_120_0.step[5].pic = "huangzhong.png"
	var_120_0.step[5].desc = language.get(220345)

	return var_120_0
end

function roleDialogue.constant.dialogueFrame_1160()
	local var_121_0 = {}

	var_121_0.totalStep = 4
	var_121_0.step = {}
	var_121_0.step[1] = {}
	var_121_0.step[1].type = 1
	var_121_0.step[1].pic = "player"
	var_121_0.step[1].desc = language.get(220346)
	var_121_0.step[2] = {}
	var_121_0.step[2].type = 2
	var_121_0.step[2].pic = "huangzhong.png"
	var_121_0.step[2].desc = language.get(220347)
	var_121_0.step[3] = {}
	var_121_0.step[3].type = 1
	var_121_0.step[3].pic = "player"
	var_121_0.step[3].desc = language.get(220348)
	var_121_0.step[4] = {}
	var_121_0.step[4].type = 2
	var_121_0.step[4].pic = "huangzhong.png"
	var_121_0.step[4].desc = language.get(220349)

	return var_121_0
end

function roleDialogue.constant.dialogueFrame_1170()
	local var_122_0 = {}

	var_122_0.totalStep = 3
	var_122_0.step = {}
	var_122_0.step[1] = {}
	var_122_0.step[1].type = 1
	var_122_0.step[1].pic = "player"
	var_122_0.step[1].desc = language.get(220350)
	var_122_0.step[2] = {}
	var_122_0.step[2].type = 2
	var_122_0.step[2].pic = "weiyan.png"
	var_122_0.step[2].desc = language.get(220351)
	var_122_0.step[3] = {}
	var_122_0.step[3].type = 1
	var_122_0.step[3].pic = "player"
	var_122_0.step[3].desc = language.get(220352)

	return var_122_0
end

function roleDialogue.constant.dialogueFrame_1180()
	local var_123_0 = {}

	var_123_0.totalStep = 6
	var_123_0.step = {}
	var_123_0.step[1] = {}
	var_123_0.step[1].type = 1
	var_123_0.step[1].pic = "player"
	var_123_0.step[1].desc = language.get(220353)
	var_123_0.step[2] = {}
	var_123_0.step[2].type = 2
	var_123_0.step[2].pic = "weiyan.png"
	var_123_0.step[2].desc = language.get(220354)
	var_123_0.step[3] = {}
	var_123_0.step[3].type = 1
	var_123_0.step[3].pic = "player"
	var_123_0.step[3].desc = language.get(220355)
	var_123_0.step[4] = {}
	var_123_0.step[4].type = 2
	var_123_0.step[4].pic = "weiyan.png"
	var_123_0.step[4].desc = language.get(220356)
	var_123_0.step[5] = {}
	var_123_0.step[5].type = 1
	var_123_0.step[5].pic = "player"
	var_123_0.step[5].desc = language.get(220357)
	var_123_0.step[6] = {}
	var_123_0.step[6].type = 2
	var_123_0.step[6].pic = "weiyan.png"
	var_123_0.step[6].desc = language.get(220358)

	return var_123_0
end

function roleDialogue.constant.dialogueFrame_1190()
	local var_124_0 = {}

	var_124_0.totalStep = 2
	var_124_0.step = {}
	var_124_0.step[1] = {}
	var_124_0.step[1].type = 1
	var_124_0.step[1].pic = "xiaoqian"
	var_124_0.step[1].desc = language.get(220359)
	var_124_0.step[2] = {}
	var_124_0.step[2].type = 1
	var_124_0.step[2].pic = "xiaoqian"
	var_124_0.step[2].desc = language.get(220360)

	return var_124_0
end

function roleDialogue.constant.dialogueFrame_1200()
	local var_125_0 = {}

	var_125_0.totalStep = 2
	var_125_0.step = {}
	var_125_0.step[1] = {}
	var_125_0.step[1].type = 2
	var_125_0.step[1].pic = "huangzhong.png"
	var_125_0.step[1].desc = language.get(220361)
	var_125_0.step[2] = {}
	var_125_0.step[2].type = 1
	var_125_0.step[2].pic = "player"
	var_125_0.step[2].desc = language.get(220362)

	return var_125_0
end

function roleDialogue.constant.dialogueFrame_1210()
	local var_126_0 = {}

	var_126_0.totalStep = 5
	var_126_0.step = {}
	var_126_0.step[1] = {}
	var_126_0.step[1].type = 1
	var_126_0.step[1].pic = "player"
	var_126_0.step[1].desc = language.get(220363)
	var_126_0.step[2] = {}
	var_126_0.step[2].type = 2
	var_126_0.step[2].pic = "huangzhong.png"
	var_126_0.step[2].desc = language.get(220364)
	var_126_0.step[3] = {}
	var_126_0.step[3].type = 1
	var_126_0.step[3].pic = "player"
	var_126_0.step[3].desc = language.get(220365)
	var_126_0.step[4] = {}
	var_126_0.step[4].type = 2
	var_126_0.step[4].pic = "huangzhong.png"
	var_126_0.step[4].desc = language.get(220366)
	var_126_0.step[5] = {}
	var_126_0.step[5].type = 1
	var_126_0.step[5].pic = "player"
	var_126_0.step[5].desc = language.get(220367)

	return var_126_0
end

function roleDialogue.constant.dialogueFrame_1220()
	local var_127_0 = {}

	var_127_0.totalStep = 3
	var_127_0.step = {}
	var_127_0.step[1] = {}
	var_127_0.step[1].type = 2
	var_127_0.step[1].pic = "zhugeliang.png"
	var_127_0.step[1].desc = language.get(220368)
	var_127_0.step[2] = {}
	var_127_0.step[2].type = 1
	var_127_0.step[2].pic = "player"
	var_127_0.step[2].desc = language.get(220369)
	var_127_0.step[3] = {}
	var_127_0.step[3].type = 2
	var_127_0.step[3].pic = "zhugeliang.png"
	var_127_0.step[3].desc = language.get(220370)

	return var_127_0
end

function roleDialogue.constant.dialogueFrame_1230()
	local var_128_0 = {}

	var_128_0.totalStep = 4
	var_128_0.step = {}
	var_128_0.step[1] = {}
	var_128_0.step[1].type = 1
	var_128_0.step[1].pic = "player"
	var_128_0.step[1].desc = language.get(220371)
	var_128_0.step[2] = {}
	var_128_0.step[2].type = 2
	var_128_0.step[2].pic = "liubei.png"
	var_128_0.step[2].desc = language.get(220372)
	var_128_0.step[3] = {}
	var_128_0.step[3].type = 1
	var_128_0.step[3].pic = "player"
	var_128_0.step[3].desc = language.get(220373)
	var_128_0.step[4] = {}
	var_128_0.step[4].type = 2
	var_128_0.step[4].pic = "huangzhong.png"
	var_128_0.step[4].desc = language.get(220374)

	return var_128_0
end

function roleDialogue.constant.dialogueFrame_1240()
	local var_129_0 = {}

	var_129_0.totalStep = 3
	var_129_0.step = {}
	var_129_0.step[1] = {}
	var_129_0.step[1].type = 1
	var_129_0.step[1].pic = "xiaoqian"
	var_129_0.step[1].desc = language.get(220375)
	var_129_0.step[2] = {}
	var_129_0.step[2].type = 1
	var_129_0.step[2].pic = "xiaoqian"
	var_129_0.step[2].desc = language.get(220376)
	var_129_0.step[3] = {}
	var_129_0.step[3].type = 1
	var_129_0.step[3].pic = "xiaoqian"
	var_129_0.step[3].desc = language.get(220377)

	return var_129_0
end

function roleDialogue.constant.dialogueFrame_1250()
	local var_130_0 = {}

	var_130_0.totalStep = 3
	var_130_0.step = {}
	var_130_0.step[1] = {}
	var_130_0.step[1].type = 1
	var_130_0.step[1].pic = "xiaoqian"
	var_130_0.step[1].desc = language.get(220378)
	var_130_0.step[2] = {}
	var_130_0.step[2].type = 1
	var_130_0.step[2].pic = "xiaoqian"
	var_130_0.step[2].desc = language.get(220379)
	var_130_0.step[3] = {}
	var_130_0.step[3].type = 1
	var_130_0.step[3].pic = "xiaoqian"
	var_130_0.step[3].desc = language.get(220380)

	return var_130_0
end

function roleDialogue.constant.dialogueFrame_1260()
	local var_131_0 = {}

	var_131_0.totalStep = 3
	var_131_0.step = {}
	var_131_0.step[1] = {}
	var_131_0.step[1].type = 1
	var_131_0.step[1].pic = "player"
	var_131_0.step[1].desc = language.get(220381)
	var_131_0.step[2] = {}
	var_131_0.step[2].type = 2
	var_131_0.step[2].pic = "xiaoqian"
	var_131_0.step[2].desc = language.get(220382)
	var_131_0.step[3] = {}
	var_131_0.step[3].type = 1
	var_131_0.step[3].pic = "player"
	var_131_0.step[3].desc = language.get(220383)

	return var_131_0
end

function roleDialogue.constant.dialogueFrame_1270()
	local var_132_0 = {}

	var_132_0.totalStep = 3
	var_132_0.step = {}
	var_132_0.step[1] = {}
	var_132_0.step[1].type = 1
	var_132_0.step[1].pic = "player"
	var_132_0.step[1].desc = language.get(220384)
	var_132_0.step[2] = {}
	var_132_0.step[2].type = 2
	var_132_0.step[2].pic = "xiaoqian"
	var_132_0.step[2].desc = language.get(220385)
	var_132_0.step[3] = {}
	var_132_0.step[3].type = 1
	var_132_0.step[3].pic = "player"
	var_132_0.step[3].desc = language.get(220386)

	return var_132_0
end

function roleDialogue.constant.dialogueFrame_1280()
	local var_133_0 = {}

	var_133_0.totalStep = 3
	var_133_0.step = {}
	var_133_0.step[1] = {}
	var_133_0.step[1].type = 1
	var_133_0.step[1].pic = "player"
	var_133_0.step[1].desc = language.get(220387)
	var_133_0.step[2] = {}
	var_133_0.step[2].type = 2
	var_133_0.step[2].pic = "xiaoqian"
	var_133_0.step[2].desc = language.get(220388)
	var_133_0.step[3] = {}
	var_133_0.step[3].type = 1
	var_133_0.step[3].pic = "player"
	var_133_0.step[3].desc = language.get(220389)

	return var_133_0
end

function roleDialogue.constant.dialogueFrame_1290()
	local var_134_0 = {}

	var_134_0.totalStep = 5
	var_134_0.step = {}
	var_134_0.step[1] = {}
	var_134_0.step[1].type = 1
	var_134_0.step[1].pic = "player"
	var_134_0.step[1].desc = language.get(220390)
	var_134_0.step[2] = {}
	var_134_0.step[2].type = 2
	var_134_0.step[2].pic = "taishici.png"
	var_134_0.step[2].desc = language.get(220391)
	var_134_0.step[3] = {}
	var_134_0.step[3].type = 1
	var_134_0.step[3].pic = "player"
	var_134_0.step[3].desc = language.get(220392)
	var_134_0.step[4] = {}
	var_134_0.step[4].type = 2
	var_134_0.step[4].pic = "taishici.png"
	var_134_0.step[4].desc = language.get(220393)
	var_134_0.step[5] = {}
	var_134_0.step[5].type = 1
	var_134_0.step[5].pic = "player"
	var_134_0.step[5].desc = language.get(220394)

	return var_134_0
end

function roleDialogue.constant.dialogueFrame_1310()
	local var_135_0 = {}

	var_135_0.totalStep = 3
	var_135_0.step = {}
	var_135_0.step[1] = {}
	var_135_0.step[1].type = 1
	var_135_0.step[1].pic = "player"
	var_135_0.step[1].desc = language.get(220395)
	var_135_0.step[2] = {}
	var_135_0.step[2].type = 2
	var_135_0.step[2].pic = "zhoutai.png"
	var_135_0.step[2].desc = language.get(220396)
	var_135_0.step[3] = {}
	var_135_0.step[3].type = 1
	var_135_0.step[3].pic = "player"
	var_135_0.step[3].desc = language.get(220397)

	return var_135_0
end

function roleDialogue.constant.dialogueFrame_1320()
	local var_136_0 = {}

	var_136_0.totalStep = 5
	var_136_0.step = {}
	var_136_0.step[1] = {}
	var_136_0.step[1].type = 1
	var_136_0.step[1].pic = "player"
	var_136_0.step[1].desc = language.get(220398)
	var_136_0.step[2] = {}
	var_136_0.step[2].type = 2
	var_136_0.step[2].pic = "zhoutai.png"
	var_136_0.step[2].desc = language.get(220399)
	var_136_0.step[3] = {}
	var_136_0.step[3].type = 1
	var_136_0.step[3].pic = "player"
	var_136_0.step[3].desc = language.get(220400)
	var_136_0.step[4] = {}
	var_136_0.step[4].type = 2
	var_136_0.step[4].pic = "zhoutai.png"
	var_136_0.step[4].desc = language.get(220401)
	var_136_0.step[5] = {}
	var_136_0.step[5].type = 1
	var_136_0.step[5].pic = "player"
	var_136_0.step[5].desc = language.get(220402)

	return var_136_0
end

function roleDialogue.constant.dialogueFrame_1330()
	local var_137_0 = {}

	var_137_0.totalStep = 4
	var_137_0.step = {}
	var_137_0.step[1] = {}
	var_137_0.step[1].type = 1
	var_137_0.step[1].pic = "xiaoqian"
	var_137_0.step[1].desc = language.get(220403)
	var_137_0.step[2] = {}
	var_137_0.step[2].type = 2
	var_137_0.step[2].pic = "luxun.png"
	var_137_0.step[2].desc = language.get(220404)
	var_137_0.step[3] = {}
	var_137_0.step[3].type = 1
	var_137_0.step[3].pic = "xiaoqian"
	var_137_0.step[3].desc = language.get(220405)
	var_137_0.step[4] = {}
	var_137_0.step[4].type = 2
	var_137_0.step[4].pic = "luxun.png"
	var_137_0.step[4].desc = language.get(220406)

	return var_137_0
end

function roleDialogue.constant.dialogueFrame_1340()
	local var_138_0 = {}

	var_138_0.totalStep = 3
	var_138_0.step = {}
	var_138_0.step[1] = {}
	var_138_0.step[1].type = 1
	var_138_0.step[1].pic = "player"
	var_138_0.step[1].desc = language.get(220407)
	var_138_0.step[2] = {}
	var_138_0.step[2].type = 2
	var_138_0.step[2].pic = "xiaoqian"
	var_138_0.step[2].desc = language.get(220408)
	var_138_0.step[3] = {}
	var_138_0.step[3].type = 1
	var_138_0.step[3].pic = "player"
	var_138_0.step[3].desc = language.get(220409)

	return var_138_0
end

function roleDialogue.constant.dialogueFrame_1341()
	local var_139_0 = {}

	var_139_0.totalStep = 3
	var_139_0.step = {}
	var_139_0.step[1] = {}
	var_139_0.step[1].type = 1
	var_139_0.step[1].pic = "xiaoqian"
	var_139_0.step[1].desc = language.get(220410)
	var_139_0.step[2] = {}
	var_139_0.step[2].type = 1
	var_139_0.step[2].pic = "xiaoqian"
	var_139_0.step[2].desc = language.get(220411)
	var_139_0.step[3] = {}
	var_139_0.step[3].type = 1
	var_139_0.step[3].pic = "xiaoqian"
	var_139_0.step[3].desc = language.get(220412)

	return var_139_0
end

function roleDialogue.constant.dialogueFrame_1342()
	local var_140_0 = {}

	var_140_0.totalStep = 3
	var_140_0.step = {}
	var_140_0.step[1] = {}
	var_140_0.step[1].type = 1
	var_140_0.step[1].pic = "xiaoqian"
	var_140_0.step[1].desc = language.get(220413)
	var_140_0.step[2] = {}
	var_140_0.step[2].type = 1
	var_140_0.step[2].pic = "xiaoqian"
	var_140_0.step[2].desc = language.get(220414)
	var_140_0.step[3] = {}
	var_140_0.step[3].type = 1
	var_140_0.step[3].pic = "xiaoqian"
	var_140_0.step[3].desc = language.get(220415)

	return var_140_0
end

function roleDialogue.constant.dialogueFrame_450()
	local var_141_0 = {}

	var_141_0.totalStep = 3
	var_141_0.step = {}
	var_141_0.step[1] = {}
	var_141_0.step[1].type = 1
	var_141_0.step[1].pic = "xiaoqian"
	var_141_0.step[1].desc = language.get(220416)
	var_141_0.step[2] = {}
	var_141_0.step[2].type = 1
	var_141_0.step[2].pic = "xiaoqian"
	var_141_0.step[2].desc = language.get(220417)
	var_141_0.step[3] = {}
	var_141_0.step[3].type = 1
	var_141_0.step[3].pic = "xiaoqian"
	var_141_0.step[3].desc = language.get(220418)

	return var_141_0
end

function roleDialogue.constant.dialogueFrame_3_7_1()
	local var_142_0 = {}

	var_142_0.totalStep = 4
	var_142_0.step = {}
	var_142_0.step[1] = {}
	var_142_0.step[1].type = 1
	var_142_0.step[1].pic = "player"
	var_142_0.step[1].desc = language.get(220419)
	var_142_0.step[2] = {}
	var_142_0.step[2].type = 2
	var_142_0.step[2].pic = "yanliang.png"
	var_142_0.step[2].desc = language.get(220420)
	var_142_0.step[3] = {}
	var_142_0.step[3].type = 1
	var_142_0.step[3].pic = "player"
	var_142_0.step[3].desc = language.get(220421)
	var_142_0.step[4] = {}
	var_142_0.step[4].type = 2
	var_142_0.step[4].pic = "yanliang.png"
	var_142_0.step[4].desc = language.get(220422)

	return var_142_0
end

function roleDialogue.constant.dialogueFrame_3_1_1()
	local var_143_0 = {}

	var_143_0.totalStep = 3
	var_143_0.step = {}
	var_143_0.step[1] = {}
	var_143_0.step[1].type = 1
	var_143_0.step[1].pic = "xiaoqian"
	var_143_0.step[1].desc = language.get(220423)
	var_143_0.step[2] = {}
	var_143_0.step[2].type = 1
	var_143_0.step[2].pic = "xiaoqian"
	var_143_0.step[2].desc = language.get(220424)
	var_143_0.step[3] = {}
	var_143_0.step[3].type = 1
	var_143_0.step[3].pic = "xiaoqian"
	var_143_0.step[3].desc = language.get(220425)

	return var_143_0
end

function roleDialogue.constant.dialogueFrame_4_0_1()
	local var_144_0 = {}

	var_144_0.totalStep = 2
	var_144_0.step = {}
	var_144_0.step[1] = {}
	var_144_0.step[1].type = 1
	var_144_0.step[1].pic = "player"
	var_144_0.step[1].desc = language.get(220426)
	var_144_0.step[2] = {}
	var_144_0.step[2].type = 2
	var_144_0.step[2].pic = "yanyan.png"
	var_144_0.step[2].desc = language.get(220427)

	return var_144_0
end

function roleDialogue.constant.dialogueFrame_2_1_1()
	local var_145_0 = {}

	var_145_0.totalStep = 5
	var_145_0.step = {}
	var_145_0.step[1] = {}
	var_145_0.step[1].type = 1
	var_145_0.step[1].pic = "xiaoqian"
	var_145_0.step[1].desc = language.get(220428)
	var_145_0.step[2] = {}
	var_145_0.step[2].type = 2
	var_145_0.step[2].pic = "player"
	var_145_0.step[2].desc = language.get(220429)
	var_145_0.step[3] = {}
	var_145_0.step[3].type = 1
	var_145_0.step[3].pic = "zhangliang.png"
	var_145_0.step[3].desc = language.get(220430)
	var_145_0.step[4] = {}
	var_145_0.step[4].type = 2
	var_145_0.step[4].pic = "player"
	var_145_0.step[4].desc = language.get(220431)
	var_145_0.step[5] = {}
	var_145_0.step[5].type = 1
	var_145_0.step[5].pic = "xiaoqian"
	var_145_0.step[5].desc = language.get(220432)

	return var_145_0
end

function roleDialogue.constant.dialogueFrame_2_8_1()
	local var_146_0 = {}

	var_146_0.totalStep = 3
	var_146_0.step = {}
	var_146_0.step[1] = {}
	var_146_0.step[1].type = 1
	var_146_0.step[1].pic = "player"
	var_146_0.step[1].desc = language.get(220433)
	var_146_0.step[2] = {}
	var_146_0.step[2].type = 2
	var_146_0.step[2].pic = "lvbu.png"
	var_146_0.step[2].desc = language.get(220434)
	var_146_0.step[3] = {}
	var_146_0.step[3].type = 1
	var_146_0.step[3].pic = "player"
	var_146_0.step[3].desc = language.get(220435)

	return var_146_0
end

function roleDialogue.constant.dialogueFrame_1_8_1()
	local var_147_0 = {}

	var_147_0.totalStep = 4
	var_147_0.step = {}
	var_147_0.step[1] = {}
	var_147_0.step[1].type = 1
	var_147_0.step[1].pic = "player"
	var_147_0.step[1].desc = language.get(220436)
	var_147_0.step[2] = {}
	var_147_0.step[2].type = 2
	var_147_0.step[2].pic = "huaxiong.png"
	var_147_0.step[2].desc = language.get(220437)
	var_147_0.step[3] = {}
	var_147_0.step[3].type = 1
	var_147_0.step[3].pic = "player"
	var_147_0.step[3].desc = language.get(220438)
	var_147_0.step[4] = {}
	var_147_0.step[4].type = 2
	var_147_0.step[4].pic = "huaxiong.png"
	var_147_0.step[4].desc = language.get(220439)

	return var_147_0
end

function roleDialogue.constant.dialogueFrame_2_7_1()
	local var_148_0 = {}

	var_148_0.totalStep = 4
	var_148_0.step = {}
	var_148_0.step[1] = {}
	var_148_0.step[1].type = 1
	var_148_0.step[1].pic = "player"
	var_148_0.step[1].desc = language.get(220440)
	var_148_0.step[2] = {}
	var_148_0.step[2].type = 2
	var_148_0.step[2].pic = "lvbu.png"
	var_148_0.step[2].desc = language.get(220441)
	var_148_0.step[3] = {}
	var_148_0.step[3].type = 1
	var_148_0.step[3].pic = "player"
	var_148_0.step[3].desc = language.get(220442)
	var_148_0.step[4] = {}
	var_148_0.step[4].type = 2
	var_148_0.step[4].pic = "lvbu.png"
	var_148_0.step[4].desc = language.get(220443)

	return var_148_0
end

function roleDialogue.constant.dialogueFrame_3_0_1()
	local var_149_0 = {}

	var_149_0.totalStep = 3
	var_149_0.step = {}
	var_149_0.step[1] = {}
	var_149_0.step[1].type = 1
	var_149_0.step[1].pic = "xiaoqian"
	var_149_0.step[1].desc = language.get(220444)
	var_149_0.step[2] = {}
	var_149_0.step[2].type = 2
	var_149_0.step[2].pic = "player"
	var_149_0.step[2].desc = language.get(220445)
	var_149_0.step[3] = {}
	var_149_0.step[3].type = 1
	var_149_0.step[3].pic = "xiaoqian"
	var_149_0.step[3].desc = language.get(220446)

	return var_149_0
end

function roleDialogue.constant.dialogueFrame_3_2_1()
	local var_150_0 = {}

	var_150_0.totalStep = 4
	var_150_0.step = {}
	var_150_0.step[1] = {}
	var_150_0.step[1].type = 1
	var_150_0.step[1].pic = "player"
	var_150_0.step[1].desc = language.get(220447)
	var_150_0.step[2] = {}
	var_150_0.step[2].type = 2
	var_150_0.step[2].pic = "yanliang.png"
	var_150_0.step[2].desc = language.get(220448)
	var_150_0.step[3] = {}
	var_150_0.step[3].type = 1
	var_150_0.step[3].pic = "player"
	var_150_0.step[3].desc = language.get(220449)
	var_150_0.step[4] = {}
	var_150_0.step[4].type = 2
	var_150_0.step[4].pic = "yanliang.png"
	var_150_0.step[4].desc = language.get(220450)

	return var_150_0
end

function roleDialogue.constant.dialogueFrame_3_8_1()
	local var_151_0 = {}

	var_151_0.totalStep = 4
	var_151_0.step = {}
	var_151_0.step[1] = {}
	var_151_0.step[1].type = 1
	var_151_0.step[1].pic = "player"
	var_151_0.step[1].desc = language.get(220451)
	var_151_0.step[2] = {}
	var_151_0.step[2].type = 2
	var_151_0.step[2].pic = "yanliang.png"
	var_151_0.step[2].desc = language.get(220452)
	var_151_0.step[3] = {}
	var_151_0.step[3].type = 1
	var_151_0.step[3].pic = "xiaoqian"
	var_151_0.step[3].desc = language.get(220453)
	var_151_0.step[4] = {}
	var_151_0.step[4].type = 1
	var_151_0.step[4].pic = "xiaoqian"
	var_151_0.step[4].desc = language.get(220454)

	return var_151_0
end

function roleDialogue.constant.dialogueFrame_4_2_1()
	local var_152_0 = {}

	var_152_0.totalStep = 3
	var_152_0.step = {}
	var_152_0.step[1] = {}
	var_152_0.step[1].type = 1
	var_152_0.step[1].pic = "xiaoqian"
	var_152_0.step[1].desc = language.get(220455)
	var_152_0.step[2] = {}
	var_152_0.step[2].type = 2
	var_152_0.step[2].pic = "player"
	var_152_0.step[2].desc = language.get(220456)
	var_152_0.step[3] = {}
	var_152_0.step[3].type = 1
	var_152_0.step[3].pic = "xiaoqian"
	var_152_0.step[3].desc = language.get(220457)

	return var_152_0
end

function roleDialogue.constant.dialogueFrame_4_8_1()
	local var_153_0 = {}

	var_153_0.totalStep = 2
	var_153_0.step = {}
	var_153_0.step[1] = {}
	var_153_0.step[1].type = 1
	var_153_0.step[1].pic = "xiaoqian"
	var_153_0.step[1].desc = language.get(220458)
	var_153_0.step[2] = {}
	var_153_0.step[2].type = 2
	var_153_0.step[2].pic = "player"
	var_153_0.step[2].desc = language.get(220459)

	return var_153_0
end

function roleDialogue.constant.dialogueFrame_5_3_1()
	local var_154_0 = {}

	var_154_0.totalStep = 3
	var_154_0.step = {}
	var_154_0.step[1] = {}
	var_154_0.step[1].type = 1
	var_154_0.step[1].pic = "player"
	var_154_0.step[1].desc = language.get(220460)
	var_154_0.step[2] = {}
	var_154_0.step[2].type = 2
	var_154_0.step[2].pic = "pangde.png"
	var_154_0.step[2].desc = language.get(220461)
	var_154_0.step[3] = {}
	var_154_0.step[3].type = 2
	var_154_0.step[3].pic = "pangde.png"
	var_154_0.step[3].desc = language.get(220462)

	return var_154_0
end

function roleDialogue.constant.dialogueFrame_6_8_1()
	local var_155_0 = {}

	var_155_0.totalStep = 5
	var_155_0.step = {}
	var_155_0.step[1] = {}
	var_155_0.step[1].type = 1
	var_155_0.step[1].pic = "player"
	var_155_0.step[1].desc = language.get(220463)
	var_155_0.step[2] = {}
	var_155_0.step[2].type = 2
	var_155_0.step[2].pic = "zhouyu.png"
	var_155_0.step[2].desc = language.get(220464)
	var_155_0.step[3] = {}
	var_155_0.step[3].type = 1
	var_155_0.step[3].pic = "xiaoqian"
	var_155_0.step[3].desc = language.get(220465)
	var_155_0.step[4] = {}
	var_155_0.step[4].type = 1
	var_155_0.step[4].pic = "player"
	var_155_0.step[4].desc = language.get(220466)
	var_155_0.step[5] = {}
	var_155_0.step[5].type = 2
	var_155_0.step[5].pic = "zhouyu.png"
	var_155_0.step[5].desc = language.get(220467)

	return var_155_0
end

function roleDialogue.constant.dialogueFrame_7_4_1()
	local var_156_0 = {}

	var_156_0.totalStep = 7
	var_156_0.step = {}
	var_156_0.step[1] = {}
	var_156_0.step[1].type = 1
	var_156_0.step[1].pic = "player"
	var_156_0.step[1].desc = language.get(220468)
	var_156_0.step[2] = {}
	var_156_0.step[2].type = 2
	var_156_0.step[2].pic = "chengong.png"
	var_156_0.step[2].desc = language.get(220469)
	var_156_0.step[3] = {}
	var_156_0.step[3].type = 1
	var_156_0.step[3].pic = "player"
	var_156_0.step[3].desc = language.get(220470)
	var_156_0.step[4] = {}
	var_156_0.step[4].type = 2
	var_156_0.step[4].pic = "chengong.png"
	var_156_0.step[4].desc = language.get(220471)
	var_156_0.step[5] = {}
	var_156_0.step[5].type = 1
	var_156_0.step[5].pic = "player"
	var_156_0.step[5].desc = language.get(220472)
	var_156_0.step[6] = {}
	var_156_0.step[6].type = 2
	var_156_0.step[6].pic = "chengong.png"
	var_156_0.step[6].desc = language.get(220473)
	var_156_0.step[7] = {}
	var_156_0.step[7].type = 1
	var_156_0.step[7].pic = "player"
	var_156_0.step[7].desc = language.get(220474)

	return var_156_0
end

function roleDialogue.constant.dialogueFrame_7_5_1()
	local var_157_0 = {}

	var_157_0.totalStep = 4
	var_157_0.step = {}
	var_157_0.step[1] = {}
	var_157_0.step[1].type = 1
	var_157_0.step[1].pic = "player"
	var_157_0.step[1].desc = language.get(220475)
	var_157_0.step[2] = {}
	var_157_0.step[2].type = 2
	var_157_0.step[2].pic = "machao.png"
	var_157_0.step[2].desc = language.get(220476)
	var_157_0.step[3] = {}
	var_157_0.step[3].type = 1
	var_157_0.step[3].pic = "xiaoqian"
	var_157_0.step[3].desc = language.get(220477)
	var_157_0.step[4] = {}
	var_157_0.step[4].type = 2
	var_157_0.step[4].pic = "machao.png"
	var_157_0.step[4].desc = language.get(220478)

	return var_157_0
end

function roleDialogue.constant.dialogueFrame_7_7_1()
	local var_158_0 = {}

	var_158_0.totalStep = 4
	var_158_0.step = {}
	var_158_0.step[1] = {}
	var_158_0.step[1].type = 1
	var_158_0.step[1].pic = "player"
	var_158_0.step[1].desc = language.get(220479)
	var_158_0.step[2] = {}
	var_158_0.step[2].type = 2
	var_158_0.step[2].pic = "mateng.png"
	var_158_0.step[2].desc = language.get(220480)
	var_158_0.step[3] = {}
	var_158_0.step[3].type = 1
	var_158_0.step[3].pic = "player"
	var_158_0.step[3].desc = language.get(220481)
	var_158_0.step[4] = {}
	var_158_0.step[4].type = 2
	var_158_0.step[4].pic = "mateng.png"
	var_158_0.step[4].desc = language.get(220482)

	return var_158_0
end

function roleDialogue.constant.dialogueFrame_7_8_1()
	local var_159_0 = {}

	var_159_0.totalStep = 4
	var_159_0.step = {}
	var_159_0.step[1] = {}
	var_159_0.step[1].type = 1
	var_159_0.step[1].pic = "player"
	var_159_0.step[1].desc = language.get(220483)
	var_159_0.step[2] = {}
	var_159_0.step[2].type = 2
	var_159_0.step[2].pic = "xiaoqian"
	var_159_0.step[2].desc = language.get(220484)
	var_159_0.step[3] = {}
	var_159_0.step[3].type = 1
	var_159_0.step[3].pic = "player"
	var_159_0.step[3].desc = language.get(220485)
	var_159_0.step[4] = {}
	var_159_0.step[4].type = 2
	var_159_0.step[4].pic = "xiaoqian"
	var_159_0.step[4].desc = language.get(220486)

	return var_159_0
end

function roleDialogue.constant.dialogueFrame_1343()
	local var_160_0 = {}

	var_160_0.totalStep = 3
	var_160_0.step = {}
	var_160_0.step[1] = {}
	var_160_0.step[1].type = 1
	var_160_0.step[1].pic = "xiaoqian"
	var_160_0.step[1].desc = language.get(220487)
	var_160_0.step[2] = {}
	var_160_0.step[2].type = 2
	var_160_0.step[2].pic = "zhugeliang.png"
	var_160_0.step[2].desc = language.get(220488)
	var_160_0.step[3] = {}
	var_160_0.step[3].type = 1
	var_160_0.step[3].pic = "player"
	var_160_0.step[3].desc = language.get(220489)

	return var_160_0
end

function roleDialogue.constant.dialogueFrame_1344()
	local var_161_0 = {}

	var_161_0.totalStep = 1
	var_161_0.step = {}
	var_161_0.step[1] = {}
	var_161_0.step[1].type = 1
	var_161_0.step[1].pic = "xiaoqian"
	var_161_0.step[1].desc = language.get(220490)
	var_161_0.open = "guild"

	return var_161_0
end

function roleDialogue.constant.dialogueFrame_11_1_1()
	local var_162_0 = {}

	var_162_0.totalStep = 2
	var_162_0.step = {}
	var_162_0.step[1] = {}
	var_162_0.step[1].type = 1
	var_162_0.step[1].pic = "player"
	var_162_0.step[1].desc = language.get(220491)
	var_162_0.step[2] = {}
	var_162_0.step[2].type = 2
	var_162_0.step[2].pic = "zhangfei.png"
	var_162_0.step[2].desc = language.get(220492)

	return var_162_0
end

function roleDialogue.constant.dialogueFrame_11_3_1()
	local var_163_0 = {}

	var_163_0.totalStep = 3
	var_163_0.step = {}
	var_163_0.step[1] = {}
	var_163_0.step[1].type = 1
	var_163_0.step[1].pic = "player"
	var_163_0.step[1].desc = language.get(220493)
	var_163_0.step[2] = {}
	var_163_0.step[2].type = 2
	var_163_0.step[2].pic = "zhangfei.png"
	var_163_0.step[2].desc = language.get(220494)
	var_163_0.step[3] = {}
	var_163_0.step[3].type = 1
	var_163_0.step[3].pic = "player"
	var_163_0.step[3].desc = language.get(220495)

	return var_163_0
end

function roleDialogue.constant.dialogueFrame_bonus1104_1()
	local var_164_0 = {}

	var_164_0.totalStep = 4
	var_164_0.step = {}
	var_164_0.step[1] = {}
	var_164_0.step[1].type = 1
	var_164_0.step[1].pic = "liubei.png"
	var_164_0.step[1].desc = language.get(220496)
	var_164_0.step[2] = {}
	var_164_0.step[2].type = 2
	var_164_0.step[2].pic = "zhangfei.png"
	var_164_0.step[2].desc = language.get(220497)
	var_164_0.step[3] = {}
	var_164_0.step[3].type = 1
	var_164_0.step[3].pic = "player"
	var_164_0.step[3].desc = language.get(220498)
	var_164_0.step[4] = {}
	var_164_0.step[4].type = 2
	var_164_0.step[4].pic = "zhangfei.png"
	var_164_0.step[4].desc = language.get(220499)

	return var_164_0
end

function roleDialogue.constant.dialogueFrame_11_5_1()
	local var_165_0 = {}

	var_165_0.totalStep = 3
	var_165_0.step = {}
	var_165_0.step[1] = {}
	var_165_0.step[1].type = 1
	var_165_0.step[1].pic = "player"
	var_165_0.step[1].desc = language.get(220500)
	var_165_0.step[2] = {}
	var_165_0.step[2].type = 2
	var_165_0.step[2].pic = "jiangwei.png"
	var_165_0.step[2].desc = language.get(220501)
	var_165_0.step[3] = {}
	var_165_0.step[3].type = 1
	var_165_0.step[3].pic = "player"
	var_165_0.step[3].desc = language.get(220502)

	return var_165_0
end

function roleDialogue.constant.dialogueFrame_11_7_1()
	local var_166_0 = {}

	var_166_0.totalStep = 4
	var_166_0.step = {}
	var_166_0.step[1] = {}
	var_166_0.step[1].type = 1
	var_166_0.step[1].pic = "xiaoqian"
	var_166_0.step[1].desc = language.get(220503)
	var_166_0.step[2] = {}
	var_166_0.step[2].type = 2
	var_166_0.step[2].pic = "player"
	var_166_0.step[2].desc = language.get(220504)
	var_166_0.step[3] = {}
	var_166_0.step[3].type = 2
	var_166_0.step[3].pic = "player"
	var_166_0.step[3].desc = language.get(220505)
	var_166_0.step[4] = {}
	var_166_0.step[4].type = 1
	var_166_0.step[4].pic = "guanyu.png"
	var_166_0.step[4].desc = language.get(220506)

	return var_166_0
end

function roleDialogue.constant.dialogueFrame_11_8_1()
	local var_167_0 = {}

	var_167_0.totalStep = 6
	var_167_0.step = {}
	var_167_0.step[1] = {}
	var_167_0.step[1].type = 1
	var_167_0.step[1].pic = "player"
	var_167_0.step[1].desc = language.get(220507)
	var_167_0.step[2] = {}
	var_167_0.step[2].type = 2
	var_167_0.step[2].pic = "zhugeliang.png"
	var_167_0.step[2].desc = language.get(220508)
	var_167_0.step[3] = {}
	var_167_0.step[3].type = 1
	var_167_0.step[3].pic = "player"
	var_167_0.step[3].desc = language.get(220509)
	var_167_0.step[4] = {}
	var_167_0.step[4].type = 2
	var_167_0.step[4].pic = "zhugeliang.png"
	var_167_0.step[4].desc = language.get(220510)
	var_167_0.step[5] = {}
	var_167_0.step[5].type = 1
	var_167_0.step[5].pic = "guanyu.png"
	var_167_0.step[5].desc = language.get(220511)
	var_167_0.step[6] = {}
	var_167_0.step[6].type = 1
	var_167_0.step[6].pic = "guanyu.png"
	var_167_0.step[6].desc = language.get(220512)

	return var_167_0
end

function roleDialogue.constant.dialogueFrame_11()
	local var_168_0 = {}

	var_168_0.totalStep = 4
	var_168_0.step = {}
	var_168_0.step[1] = {}
	var_168_0.step[1].type = 2
	var_168_0.step[1].pic = "zhoucang.png"
	var_168_0.step[1].desc = language.get(220537)
	var_168_0.step[2] = {}
	var_168_0.step[2].type = 1
	var_168_0.step[2].pic = "xiaoqian"
	var_168_0.step[2].desc = language.get(220538)
	var_168_0.step[3] = {}
	var_168_0.step[3].type = 2
	var_168_0.step[3].pic = "player"
	var_168_0.step[3].desc = language.get(220539)
	var_168_0.step[4] = {}
	var_168_0.step[4].type = 1
	var_168_0.step[4].pic = "xiaoqian"
	var_168_0.step[4].desc = language.get(220540)
	var_168_0.open = "openGuide"

	return var_168_0
end

function roleDialogue.constant.dialogueFrame_12()
	local var_169_0 = {}

	var_169_0.totalStep = 2
	var_169_0.step = {}
	var_169_0.step[1] = {}
	var_169_0.step[1].type = 1
	var_169_0.step[1].pic = "xiaoqian"
	var_169_0.step[1].desc = language.get(220541)
	var_169_0.step[2] = {}
	var_169_0.step[2].type = 2
	var_169_0.step[2].pic = "player"
	var_169_0.step[2].desc = language.get(220542)

	return var_169_0
end

function roleDialogue.constant.dialogueFrame_13()
	local var_170_0 = {}

	var_170_0.totalStep = 4
	var_170_0.step = {}
	var_170_0.step[1] = {}
	var_170_0.step[1].type = 1
	var_170_0.step[1].pic = "player"
	var_170_0.step[1].desc = language.get(220543)
	var_170_0.step[2] = {}
	var_170_0.step[2].type = 2
	var_170_0.step[2].pic = "xiaoqian"
	var_170_0.step[2].desc = language.get(220587)
	var_170_0.step[3] = {}
	var_170_0.step[3].type = 1
	var_170_0.step[3].pic = "player"
	var_170_0.step[3].desc = language.get(220588)
	var_170_0.step[4] = {}
	var_170_0.step[4].type = 2
	var_170_0.step[4].pic = "xiaoqian"
	var_170_0.step[4].desc = language.get(220589)

	return var_170_0
end

function roleDialogue.constant.dialogueFrame_14()
	local var_171_0 = {}

	var_171_0.totalStep = 1
	var_171_0.step = {}
	var_171_0.step[1] = {}
	var_171_0.step[1].type = 1
	var_171_0.step[1].pic = "xiaoqian"
	var_171_0.step[1].desc = language.get(220545)

	return var_171_0
end

function roleDialogue.constant.dialogueFrame_15()
	local var_172_0 = {}

	var_172_0.totalStep = 2
	var_172_0.step = {}
	var_172_0.step[1] = {}
	var_172_0.step[1].type = 2
	var_172_0.step[1].pic = "player"
	var_172_0.step[1].desc = language.get(220546)
	var_172_0.step[2] = {}
	var_172_0.step[2].type = 1
	var_172_0.step[2].pic = "xiaoqian"
	var_172_0.step[2].desc = language.get(220547)

	return var_172_0
end

function roleDialogue.constant.dialogueFrame_16()
	local var_173_0 = {}

	var_173_0.totalStep = 4
	var_173_0.step = {}
	var_173_0.step[1] = {}
	var_173_0.step[1].type = 1
	var_173_0.step[1].pic = "xiaoqian"
	var_173_0.step[1].desc = language.get(220548)
	var_173_0.step[2] = {}
	var_173_0.step[2].type = 2
	var_173_0.step[2].pic = "player"
	var_173_0.step[2].desc = language.get(220549)
	var_173_0.step[3] = {}
	var_173_0.step[3].type = 1
	var_173_0.step[3].pic = "xiaoqian"
	var_173_0.step[3].desc = language.get(220550)
	var_173_0.step[4] = {}
	var_173_0.step[4].type = 1
	var_173_0.step[4].pic = "xiaoqian"
	var_173_0.step[4].desc = language.get(220551)
	var_173_0.open = "openGuide"

	return var_173_0
end

function roleDialogue.constant.dialogueFrame_17()
	local var_174_0 = {}

	var_174_0.totalStep = 2
	var_174_0.step = {}
	var_174_0.step[1] = {}
	var_174_0.step[1].type = 2
	var_174_0.step[1].pic = "huaxiong.png"
	var_174_0.step[1].desc = language.get(220552)
	var_174_0.step[2] = {}
	var_174_0.step[2].type = 1
	var_174_0.step[2].pic = "player"
	var_174_0.step[2].desc = language.get(220553)

	return var_174_0
end

function roleDialogue.constant.dialogueFrame_18()
	local var_175_0 = {}

	var_175_0.totalStep = 7
	var_175_0.step = {}
	var_175_0.step[1] = {}
	var_175_0.step[1].type = 2
	var_175_0.step[1].pic = "huaxiong.png"
	var_175_0.step[1].desc = language.get(220554)
	var_175_0.step[2] = {}
	var_175_0.step[2].type = 1
	var_175_0.step[2].pic = "xiaoqian"
	var_175_0.step[2].desc = language.get(220555)
	var_175_0.step[3] = {}
	var_175_0.step[3].type = 1
	var_175_0.step[3].pic = "xiaoqian"
	var_175_0.step[3].desc = language.get(220556)
	var_175_0.step[4] = {}
	var_175_0.step[4].type = 2
	var_175_0.step[4].pic = "player"
	var_175_0.step[4].desc = language.get(220557)
	var_175_0.step[5] = {}
	var_175_0.step[5].type = 1
	var_175_0.step[5].pic = "xiaoqian"
	var_175_0.step[5].desc = language.get(220558)
	var_175_0.step[6] = {}
	var_175_0.step[6].type = 1
	var_175_0.step[6].pic = "xiaoqian"
	var_175_0.step[6].desc = language.get(220559)
	var_175_0.step[7] = {}
	var_175_0.step[7].type = 2
	var_175_0.step[7].pic = "player"
	var_175_0.step[7].desc = language.get(220560)
	var_175_0.step[8] = {}
	var_175_0.step[8].type = 2
	var_175_0.step[8].pic = "xiaoqian"
	var_175_0.step[8].desc = language.get(220590)

	return var_175_0
end

function roleDialogue.constant.dialogueFrame_19()
	local var_176_0 = {}

	var_176_0.totalStep = 5
	var_176_0.step = {}
	var_176_0.step[1] = {}
	var_176_0.step[1].type = 1
	var_176_0.step[1].pic = "xiaoqian"
	var_176_0.step[1].desc = language.get(220561)
	var_176_0.step[2] = {}
	var_176_0.step[2].type = 2
	var_176_0.step[2].pic = "player"
	var_176_0.step[2].desc = language.get(220562)
	var_176_0.step[3] = {}
	var_176_0.step[3].type = 1
	var_176_0.step[3].pic = "xiaoqian"
	var_176_0.step[3].desc = language.get(220563)
	var_176_0.step[4] = {}
	var_176_0.step[4].type = 2
	var_176_0.step[4].pic = "player"
	var_176_0.step[4].desc = language.get(220564)
	var_176_0.step[5] = {}
	var_176_0.step[5].type = 1
	var_176_0.step[5].pic = "xiaoqian"
	var_176_0.step[5].desc = language.get(220565)

	return var_176_0
end

function roleDialogue.constant.dialogueFrame_32()
	local var_177_0 = {}

	var_177_0.totalStep = 2
	var_177_0.step = {}
	var_177_0.step[1] = {}
	var_177_0.step[1].type = 1
	var_177_0.step[1].pic = "xiaoqian"
	var_177_0.step[1].desc = language.get(220566)
	var_177_0.step[2] = {}
	var_177_0.step[2].type = 1
	var_177_0.step[2].pic = "xiaoqian"
	var_177_0.step[2].desc = language.get(220567)
	var_177_0.open = "openPaihang"

	return var_177_0
end

function roleDialogue.constant.dialogueFrame_33()
	local var_178_0 = {}

	var_178_0.totalStep = 4
	var_178_0.step = {}
	var_178_0.step[1] = {}
	var_178_0.step[1].type = 1
	var_178_0.step[1].pic = "xiaoqian"
	var_178_0.step[1].desc = language.get(220568)
	var_178_0.step[2] = {}
	var_178_0.step[2].type = 2
	var_178_0.step[2].pic = "player"
	var_178_0.step[2].desc = language.get(220569)
	var_178_0.step[3] = {}
	var_178_0.step[3].type = 1
	var_178_0.step[3].pic = "xiaoqian"
	var_178_0.step[3].desc = language.get(220570)
	var_178_0.step[4] = {}
	var_178_0.step[4].type = 2
	var_178_0.step[4].pic = "player"
	var_178_0.step[4].desc = language.get(220571)

	return var_178_0
end

function roleDialogue.constant.dialogueFrame_34()
	local var_179_0 = {}

	var_179_0.totalStep = 4
	var_179_0.step = {}
	var_179_0.step[1] = {}
	var_179_0.step[1].type = 1
	var_179_0.step[1].pic = "xiaoqian"
	var_179_0.step[1].desc = language.get(220572)
	var_179_0.step[2] = {}
	var_179_0.step[2].type = 2
	var_179_0.step[2].pic = "player"
	var_179_0.step[2].desc = language.get(220573)
	var_179_0.step[3] = {}
	var_179_0.step[3].type = 1
	var_179_0.step[3].pic = "xiaoqian"
	var_179_0.step[3].desc = language.get(220574)
	var_179_0.step[4] = {}
	var_179_0.step[4].type = 2
	var_179_0.step[4].pic = "player"
	var_179_0.step[4].desc = language.get(220575)

	return var_179_0
end

function roleDialogue.constant.dialogueFrame_25()
	local var_180_0 = {}

	var_180_0.totalStep = 2
	var_180_0.step = {}
	var_180_0.step[1] = {}
	var_180_0.step[1].type = 1
	var_180_0.step[1].pic = "xiaoqian"
	var_180_0.step[1].desc = language.get(220576)
	var_180_0.step[2] = {}
	var_180_0.step[2].type = 2
	var_180_0.step[2].pic = "player"
	var_180_0.step[2].desc = language.get(220577)

	return var_180_0
end

function roleDialogue.constant.dialogueFrame_26()
	local var_181_0 = {}

	var_181_0.totalStep = 3
	var_181_0.step = {}
	var_181_0.step[1] = {}
	var_181_0.step[1].type = 2
	var_181_0.step[1].pic = "lvbu.png"
	var_181_0.step[1].desc = language.get(220578)
	var_181_0.step[2] = {}
	var_181_0.step[2].type = 1
	var_181_0.step[2].pic = "player"
	var_181_0.step[2].desc = language.get(220579)
	var_181_0.step[3] = {}
	var_181_0.step[3].type = 2
	var_181_0.step[3].pic = "xiaoqian"
	var_181_0.step[3].desc = language.get(220580)
	var_181_0.open = "worldbtn"

	return var_181_0
end

function roleDialogue.constant.dialogueFrame_27()
	local var_182_0 = {}

	var_182_0.totalStep = 1
	var_182_0.step = {}
	var_182_0.step[1] = {}
	var_182_0.step[1].type = 1
	var_182_0.step[1].pic = "xiaoqian"
	var_182_0.step[1].desc = language.get(220581)

	return var_182_0
end

function roleDialogue.constant.dialogueFrame_28()
	local var_183_0 = {}

	var_183_0.totalStep = 1
	var_183_0.step = {}
	var_183_0.step[1] = {}
	var_183_0.step[1].type = 1
	var_183_0.step[1].pic = "xiaoqian"
	var_183_0.step[1].desc = language.get(220582)

	return var_183_0
end

function roleDialogue.constant.dialogueFrame_29()
	local var_184_0 = {}

	var_184_0.totalStep = 2
	var_184_0.step = {}
	var_184_0.step[1] = {}
	var_184_0.step[1].type = 2
	var_184_0.step[1].pic = "zhangliao.png"
	var_184_0.step[1].desc = language.get(220585)
	var_184_0.step[2] = {}
	var_184_0.step[2].type = 1
	var_184_0.step[2].pic = "xiaoqian"
	var_184_0.step[2].desc = language.get(220586)

	return var_184_0
end

function roleDialogue.constant.dialogueFrame_30()
	local var_185_0 = {}

	var_185_0.totalStep = 5
	var_185_0.step = {}
	var_185_0.step[1] = {}
	var_185_0.step[1].type = 2
	var_185_0.step[1].pic = "player"
	var_185_0.step[1].desc = language.get(220591)
	var_185_0.step[2] = {}
	var_185_0.step[2].type = 1
	var_185_0.step[2].pic = "xiaoqian"
	var_185_0.step[2].desc = language.get(220592)
	var_185_0.step[3] = {}
	var_185_0.step[3].type = 2
	var_185_0.step[3].pic = "player"
	var_185_0.step[3].desc = language.get(220593)
	var_185_0.step[4] = {}
	var_185_0.step[4].type = 1
	var_185_0.step[4].pic = "xiaoqian"
	var_185_0.step[4].desc = language.get(220594)
	var_185_0.step[5] = {}
	var_185_0.step[5].type = 2
	var_185_0.step[5].pic = "player"
	var_185_0.step[5].desc = language.get(220595)
	var_185_0.open = "openComment"

	return var_185_0
end

function roleDialogue.constant.dialogueFrame_1504()
	local var_186_0 = {}

	var_186_0.totalStep = 2
	var_186_0.step = {}
	var_186_0.step[1] = {}
	var_186_0.step[1].type = 1
	var_186_0.step[1].pic = "xiaoqian"
	var_186_0.step[1].desc = language.get("620015_TJXS")
	var_186_0.step[2] = {}
	var_186_0.step[2].type = 1
	var_186_0.step[2].pic = "xiaoqian"
	var_186_0.step[2].desc = language.get("620016_TJXS")
	var_186_0.open = "downloadDetail"

	return var_186_0
end

function roleDialogue.constant.dialogueFrame_1505()
	local var_187_0 = {
		"caocao",
		"liubei",
		"sunquan"
	}
	local var_187_1 = {}

	var_187_1.totalStep = 3
	var_187_1.step = {}
	var_187_1.step[1] = {}
	var_187_1.step[1].type = 1
	var_187_1.step[1].pic = var_187_0[user.player.forceId]
	var_187_1.step[1].desc = language.get(490101, user.player.name)
	var_187_1.step[2] = {}
	var_187_1.step[2].type = 2
	var_187_1.step[2].pic = "player"
	var_187_1.step[2].desc = language.get(490103)
	var_187_1.step[3] = {}
	var_187_1.step[3].type = 1
	var_187_1.step[3].pic = "xiaoqian"
	var_187_1.step[3].desc = language.get(490104)

	return var_187_1
end

function roleDialogue.constant.dialogueFrame_1506()
	local var_188_0 = {}

	var_188_0.totalStep = 1
	var_188_0.step = {}
	var_188_0.step[1] = {}
	var_188_0.step[1].type = 1
	var_188_0.step[1].pic = "xiaoqian"
	var_188_0.step[1].desc = language.get(490134)

	return var_188_0
end

function roleDialogue.constant.dialogueFrame_1507()
	local var_189_0 = {}

	var_189_0.totalStep = 2
	var_189_0.step = {}
	var_189_0.step[1] = {}
	var_189_0.step[1].type = 1
	var_189_0.step[1].pic = "xiaoqian"
	var_189_0.step[1].desc = language.get(220611)
	var_189_0.step[2] = {}
	var_189_0.step[2].type = 1
	var_189_0.step[2].pic = "xiaoqian"
	var_189_0.step[2].desc = language.get(220612)

	return var_189_0
end

function roleDialogue.constant.dialogueFrame_1508()
	local var_190_0 = {}

	var_190_0.totalStep = 2
	var_190_0.step = {}
	var_190_0.step[1] = {}
	var_190_0.step[1].type = 1
	var_190_0.step[1].pic = "xiaoqian"
	var_190_0.step[1].desc = language.get(220613)
	var_190_0.step[2] = {}
	var_190_0.step[2].type = 2
	var_190_0.step[2].pic = "player"
	var_190_0.step[2].desc = language.get(220614)

	return var_190_0
end

function roleDialogue.constant.dialogueFrame_1509()
	local var_191_0 = {}

	var_191_0.totalStep = 2
	var_191_0.step = {}
	var_191_0.step[1] = {}
	var_191_0.step[1].type = 1
	var_191_0.step[1].pic = "xiaoqian"
	var_191_0.step[1].desc = language.get(220615)
	var_191_0.step[2] = {}
	var_191_0.step[2].type = 2
	var_191_0.step[2].pic = "player"
	var_191_0.step[2].desc = language.get(220616)

	return var_191_0
end

function roleDialogue.constant.dialogueFrame_1510()
	local var_192_0 = {}

	var_192_0.totalStep = 1
	var_192_0.step = {}
	var_192_0.step[1] = {}
	var_192_0.step[1].type = 1
	var_192_0.step[1].pic = "xiaoqian"
	var_192_0.step[1].desc = language.get(131193)

	return var_192_0
end

function roleDialogue.constant.dialogueFrame_1511()
	local var_193_0 = {}

	var_193_0.totalStep = 2
	var_193_0.step = {}
	var_193_0.step[1] = {}
	var_193_0.step[1].type = 1
	var_193_0.step[1].pic = "xiaoqian"
	var_193_0.step[1].desc = language.get(135402)
	var_193_0.step[2] = {}
	var_193_0.step[2].type = 2
	var_193_0.step[2].pic = "player"
	var_193_0.step[2].desc = language.get(135403)
	var_193_0.open = "gotoBetray"

	return var_193_0
end

function roleDialogue.constant.dialogueFrame_1512()
	local var_194_0 = {}

	var_194_0.totalStep = 1
	var_194_0.step = {}
	var_194_0.step[1] = {}
	var_194_0.step[1].type = 1
	var_194_0.step[1].pic = "player"
	var_194_0.step[1].desc = language.get(135407, var_0_2())
	var_194_0.open = "gotoWorld"

	return var_194_0
end

function roleDialogue.constant.dialogueFrame_1513()
	local var_195_0 = var_0_0()
	local var_195_1 = var_0_2()
	local var_195_2 = {}

	var_195_2.totalStep = 2
	var_195_2.step = {}
	var_195_2.step[1] = {}
	var_195_2.step[1].type = 1
	var_195_2.step[1].pic = var_195_0
	var_195_2.step[1].desc = language.get(135409, user.player.name, var_195_1, user.player.name)
	var_195_2.step[2] = {}
	var_195_2.step[2].type = 2
	var_195_2.step[2].pic = "player"
	var_195_2.step[2].desc = language.get(135410, var_195_1)
	var_195_2.open = "showBetrayReward"

	return var_195_2
end

function roleDialogue.constant.dialogueFrame_1514()
	local var_196_0 = var_0_0()
	local var_196_1 = var_0_2()
	local var_196_2 = {}

	var_196_2.totalStep = 6
	var_196_2.step = {}
	var_196_2.step[1] = {}
	var_196_2.step[1].type = 1
	var_196_2.step[1].pic = var_196_0
	var_196_2.step[1].desc = language.get(135418, var_196_1)
	var_196_2.step[2] = {}
	var_196_2.step[2].type = 1
	var_196_2.step[2].pic = var_196_0
	var_196_2.step[2].desc = language.get(135419)
	var_196_2.step[3] = {}
	var_196_2.step[3].type = 1
	var_196_2.step[3].pic = var_196_0
	var_196_2.step[3].desc = language.get(135420, var_196_1)
	var_196_2.step[4] = {}
	var_196_2.step[4].type = 2
	var_196_2.step[4].pic = "wujiang"
	var_196_2.step[4].desc = language.get(135423)
	var_196_2.step[5] = {}
	var_196_2.step[5].type = 1
	var_196_2.step[5].pic = "wenguan"
	var_196_2.step[5].desc = language.get(135424)
	var_196_2.step[6] = {}
	var_196_2.step[6].type = 2
	var_196_2.step[6].pic = "wujiang"
	var_196_2.step[6].desc = language.get(135425)
	var_196_2.open = "getBetrayReward"

	return var_196_2
end

function roleDialogue.constant.dialogueFrame_1515()
	local var_197_0 = var_0_0()
	local var_197_1 = var_0_2()
	local var_197_2 = {}

	var_197_2.totalStep = 5
	var_197_2.step = {}
	var_197_2.step[1] = {}
	var_197_2.step[1].type = 1
	var_197_2.step[1].pic = var_197_0
	var_197_2.step[1].desc = language.get(135421, var_197_1)
	var_197_2.step[2] = {}
	var_197_2.step[2].type = 1
	var_197_2.step[2].pic = var_197_0
	var_197_2.step[2].desc = language.get(135422, var_197_1)
	var_197_2.step[3] = {}
	var_197_2.step[3].type = 2
	var_197_2.step[3].pic = "wujiang"
	var_197_2.step[3].desc = language.get(135426)
	var_197_2.step[4] = {}
	var_197_2.step[4].type = 1
	var_197_2.step[4].pic = "wenguan"
	var_197_2.step[4].desc = language.get(135428)
	var_197_2.step[5] = {}
	var_197_2.step[5].type = 2
	var_197_2.step[5].pic = "wujiang"
	var_197_2.step[5].desc = language.get(135427)
	var_197_2.open = "gotoWorld"

	return var_197_2
end

function roleDialogue.constant.dialogueFrame_1516()
	local var_198_0 = {}

	var_198_0.totalStep = 2
	var_198_0.step = {}
	var_198_0.step[1] = {}
	var_198_0.step[1].type = 1
	var_198_0.step[1].pic = "xiaoqian"
	var_198_0.step[1].desc = language.get(490800)
	var_198_0.step[2] = {}
	var_198_0.step[2].type = 1
	var_198_0.step[2].pic = "xiaoqian"
	var_198_0.step[2].desc = language.get(490801)

	return var_198_0
end

function roleDialogue.constant.dialogueFrame_1517()
	local var_199_0 = {}

	var_199_0.totalStep = 2
	var_199_0.step = {}
	var_199_0.step[1] = {}
	var_199_0.step[1].type = 1
	var_199_0.step[1].pic = "xiaoqian"
	var_199_0.step[1].desc = language.get(490802)
	var_199_0.step[2] = {}
	var_199_0.step[2].type = 1
	var_199_0.step[2].pic = "xiaoqian"
	var_199_0.step[2].desc = language.get(490803)
	var_199_0.open = "gotoXiangYang"

	return var_199_0
end

function roleDialogue.constant.dialogueFrame_1518()
	local var_200_0 = {}

	var_200_0.totalStep = 1
	var_200_0.step = {}
	var_200_0.step[1] = {}
	var_200_0.step[1].type = 1
	var_200_0.step[1].pic = "xiaoqian"
	var_200_0.step[1].desc = language.get(490804)

	return var_200_0
end

function roleDialogue.constant.dialogueFrame_1519()
	local var_201_0 = {}

	var_201_0.totalStep = 3
	var_201_0.step = {}
	var_201_0.step[1] = {}
	var_201_0.step[1].type = 1
	var_201_0.step[1].pic = "xiaoqian"
	var_201_0.step[1].desc = language.get(490805)
	var_201_0.step[2] = {}
	var_201_0.step[2].type = 1
	var_201_0.step[2].pic = "xiaoqian"
	var_201_0.step[2].desc = language.get(490806)
	var_201_0.step[3] = {}
	var_201_0.step[3].type = 1
	var_201_0.step[3].pic = "xiaoqian"
	var_201_0.step[3].desc = language.get(490807)
	var_201_0.open = "gotoManzu"

	return var_201_0
end

function roleDialogue.constant.dialogueFrame_1520()
	local var_202_0 = {}

	var_202_0.totalStep = 1
	var_202_0.step = {}
	var_202_0.step[1] = {}
	var_202_0.step[1].type = 1
	var_202_0.step[1].pic = "xiaoqian"
	var_202_0.step[1].desc = language.get(490808)

	return var_202_0
end

function roleDialogue.constant.dialogueFrame_1521()
	local var_203_0 = {}

	var_203_0.totalStep = 1
	var_203_0.step = {}
	var_203_0.step[1] = {}
	var_203_0.step[1].type = 1
	var_203_0.step[1].pic = "xiaoqian"
	var_203_0.step[1].desc = language.get(490809)

	return var_203_0
end

function roleDialogue.constant.dialogueFrame_1522()
	local var_204_0 = {}

	var_204_0.totalStep = 1
	var_204_0.step = {}
	var_204_0.step[1] = {}
	var_204_0.step[1].type = 1
	var_204_0.step[1].pic = "xiaoqian"
	var_204_0.step[1].desc = language.get(91020)
	var_204_0.open = "kingNotice"

	return var_204_0
end

function roleDialogue.constant.dialogueFrame_1523()
	local var_205_0 = {}

	var_205_0.totalStep = 1
	var_205_0.step = {}
	var_205_0.step[1] = {}
	var_205_0.step[1].type = 1
	var_205_0.step[1].pic = "xiaoqian"
	var_205_0.step[1].desc = language.get(91021)

	return var_205_0
end

function roleDialogue.constant.dialogueFrame_1524()
	local var_206_0 = {}

	var_206_0.totalStep = 6
	var_206_0.step = {}
	var_206_0.step[1] = {}
	var_206_0.step[1].type = 1
	var_206_0.step[1].pic = "xiaoqian"
	var_206_0.step[1].desc = language.get(220660)
	var_206_0.step[2] = {}
	var_206_0.step[2].type = 2
	var_206_0.step[2].pic = "zhugeliang"
	var_206_0.step[2].desc = language.get(220661)
	var_206_0.step[3] = {}
	var_206_0.step[3].type = 1
	var_206_0.step[3].pic = "player"
	var_206_0.step[3].desc = language.get(220662)
	var_206_0.step[4] = {}
	var_206_0.step[4].type = 2
	var_206_0.step[4].pic = "zhugeliang"
	var_206_0.step[4].desc = language.get(220663)
	var_206_0.step[5] = {}
	var_206_0.step[5].type = 2
	var_206_0.step[5].pic = "zhugeliang"
	var_206_0.step[5].desc = language.get(220664)
	var_206_0.step[6] = {}
	var_206_0.step[6].type = 2
	var_206_0.step[6].pic = "zhugeliang"
	var_206_0.step[6].desc = language.get(220665)

	return var_206_0
end

function roleDialogue.constant.dialogueFrame_1525()
	local var_207_0 = {}

	var_207_0.totalStep = 4
	var_207_0.step = {}
	var_207_0.step[1] = {}
	var_207_0.step[1].type = 1
	var_207_0.step[1].pic = "player"
	var_207_0.step[1].desc = language.get(220666)
	var_207_0.step[2] = {}
	var_207_0.step[2].type = 2
	var_207_0.step[2].pic = "xiaoqian"
	var_207_0.step[2].desc = language.get(220667)
	var_207_0.step[3] = {}
	var_207_0.step[3].type = 1
	var_207_0.step[3].pic = "ganning"
	var_207_0.step[3].desc = language.get(220668)
	var_207_0.step[4] = {}
	var_207_0.step[4].type = 2
	var_207_0.step[4].pic = "xiaoqian"
	var_207_0.step[4].desc = language.get(220677)
	var_207_0.open = "gotoTavern"

	return var_207_0
end

function roleDialogue.constant.dialogueFrame_1526()
	local var_208_0 = {}

	var_208_0.totalStep = 4
	var_208_0.step = {}
	var_208_0.step[1] = {}
	var_208_0.step[1].type = 1
	var_208_0.step[1].pic = "player"
	var_208_0.step[1].desc = language.get(220669)
	var_208_0.step[2] = {}
	var_208_0.step[2].type = 2
	var_208_0.step[2].pic = "ganning"
	var_208_0.step[2].desc = language.get(220670)
	var_208_0.step[3] = {}
	var_208_0.step[3].type = 1
	var_208_0.step[3].pic = "player"
	var_208_0.step[3].desc = language.get(220671)
	var_208_0.step[4] = {}
	var_208_0.step[4].type = 2
	var_208_0.step[4].pic = "ganning"
	var_208_0.step[4].desc = language.get(220672)

	return var_208_0
end

function roleDialogue.constant.dialogueFrame_1527()
	local var_209_0 = {}

	var_209_0.totalStep = 2
	var_209_0.step = {}
	var_209_0.step[1] = {}
	var_209_0.step[1].type = 1
	var_209_0.step[1].pic = "xiaoqian"
	var_209_0.step[1].desc = language.get(220673)
	var_209_0.step[2] = {}
	var_209_0.step[2].type = 2
	var_209_0.step[2].pic = "player"
	var_209_0.step[2].desc = language.get(220674)
	var_209_0.open = "ganning1"

	return var_209_0
end

function roleDialogue.constant.dialogueFrame_1528()
	local var_210_0 = {}

	var_210_0.totalStep = 2
	var_210_0.step = {}
	var_210_0.step[1] = {}
	var_210_0.step[1].type = 2
	var_210_0.step[1].pic = "zhenganning"
	var_210_0.step[1].desc = language.get(220675)
	var_210_0.step[2] = {}
	var_210_0.step[2].type = 1
	var_210_0.step[2].pic = "player"
	var_210_0.step[2].desc = language.get(220676)
	var_210_0.open = "ganning2"

	return var_210_0
end

function roleDialogue.constant.dialogueFrame_1529()
	local var_211_0 = {}

	var_211_0.totalStep = 1
	var_211_0.step = {}
	var_211_0.step[1] = {}
	var_211_0.step[1].type = 2
	var_211_0.step[1].pic = "manzu"
	var_211_0.step[1].desc = language.get(135607)
	var_211_0.open = "sevenCatch"

	return var_211_0
end

function roleDialogue.constant.dialogueFrame_1530()
	local var_212_0 = var_0_1()
	local var_212_1 = {}

	var_212_1.totalStep = 2
	var_212_1.step = {}
	var_212_1.step[1] = {}
	var_212_1.step[1].type = 1
	var_212_1.step[1].pic = var_212_0
	var_212_1.step[1].desc = language.get(92031)
	var_212_1.step[2] = {}
	var_212_1.step[2].type = 1
	var_212_1.step[2].pic = var_212_0
	var_212_1.step[2].desc = language.get(92032)
	var_212_1.open = "zhaoLingLayer"

	return var_212_1
end

function roleDialogue.constant.dialogueFrame_1531()
	local var_213_0 = {}

	var_213_0.totalStep = 1
	var_213_0.step = {}
	var_213_0.step[1] = {}
	var_213_0.step[1].type = 1
	var_213_0.step[1].pic = "xiaoqian"
	var_213_0.step[1].desc = language.get(390425)
	var_213_0.open = "kfyz_att_start1"

	return var_213_0
end

function roleDialogue.constant.dialogueFrame_1532()
	local var_214_0 = {}

	var_214_0.totalStep = 1
	var_214_0.step = {}
	var_214_0.step[1] = {}
	var_214_0.step[1].type = 1
	var_214_0.step[1].pic = "xiaoqian"
	var_214_0.step[1].desc = language.get(390420)
	var_214_0.open = "kfyz_att_start2"

	return var_214_0
end

function roleDialogue.constant.dialogueFrame_1533()
	local var_215_0 = {}

	var_215_0.totalStep = 1
	var_215_0.step = {}
	var_215_0.step[1] = {}
	var_215_0.step[1].type = 1
	var_215_0.step[1].pic = "xiaoqian"
	var_215_0.step[1].desc = language.get(390426)
	var_215_0.open = "kfyz_def_start1"

	return var_215_0
end

function roleDialogue.constant.dialogueFrame_1534()
	local var_216_0 = {}

	var_216_0.totalStep = 1
	var_216_0.step = {}
	var_216_0.step[1] = {}
	var_216_0.step[1].type = 1
	var_216_0.step[1].pic = "xiaoqian"
	var_216_0.step[1].desc = language.get(390421)
	var_216_0.open = "kfyz_def_start2"

	return var_216_0
end

function roleDialogue.constant.dialogueFrame_1535()
	local var_217_0 = {}

	var_217_0.totalStep = 1
	var_217_0.step = {}
	var_217_0.step[1] = {}
	var_217_0.step[1].type = 1
	var_217_0.step[1].pic = "xiaoqian"
	var_217_0.step[1].desc = language.get(390435)

	return var_217_0
end

function roleDialogue.constant.dialogueFrame_1536()
	local var_218_0 = {}

	var_218_0.totalStep = 1
	var_218_0.step = {}
	var_218_0.step[1] = {}
	var_218_0.step[1].type = 1
	var_218_0.step[1].pic = "xiaoqian"
	var_218_0.step[1].desc = language.get(390436)
	var_218_0.open = "kfyz_result"

	return var_218_0
end

function roleDialogue.constant.dialogueFrame_1537()
	local var_219_0 = {}

	var_219_0.totalStep = 1
	var_219_0.step = {}
	var_219_0.step[1] = {}
	var_219_0.step[1].type = 1
	var_219_0.step[1].pic = var_0_1()
	var_219_0.step[1].desc = language.get(390437)
	var_219_0.open = "kfyz_result"

	return var_219_0
end

function roleDialogue.constant.dialogueFrame_1538()
	local var_220_0 = {}

	var_220_0.totalStep = 1
	var_220_0.step = {}
	var_220_0.step[1] = {}
	var_220_0.step[1].type = 1
	var_220_0.step[1].pic = var_0_1()
	var_220_0.step[1].desc = language.get(390438)
	var_220_0.open = "kfyz_result"

	return var_220_0
end

function roleDialogue.constant.dialogueFrame_1539()
	local var_221_0 = {}

	var_221_0.totalStep = 1
	var_221_0.step = {}
	var_221_0.step[1] = {}
	var_221_0.step[1].type = 1
	var_221_0.step[1].pic = "player"
	var_221_0.step[1].desc = language.get(135620)
	var_221_0.open = "silk_npc_move"

	return var_221_0
end

function roleDialogue.constant.dialogueFrame_1540()
	local var_222_0 = {}

	var_222_0.totalStep = 1
	var_222_0.step = {}
	var_222_0.step[1] = {}
	var_222_0.step[1].type = 2
	var_222_0.step[1].pic = "lkls"
	var_222_0.step[1].desc = language.get(135621)
	var_222_0.open = "silk_btn_att"

	return var_222_0
end

function roleDialogue.constant.dialogueFrame_1541()
	local var_223_0 = {}

	var_223_0.totalStep = 1
	var_223_0.step = {}
	var_223_0.step[1] = {}
	var_223_0.step[1].type = 2
	var_223_0.step[1].pic = "adn"
	var_223_0.step[1].desc = language.get(135622)
	var_223_0.open = "silk_npc_move"

	return var_223_0
end

function roleDialogue.constant.dialogueFrame_1542()
	local var_224_0 = {}

	var_224_0.totalStep = 1
	var_224_0.step = {}
	var_224_0.step[1] = {}
	var_224_0.step[1].type = 2
	var_224_0.step[1].pic = "wdw"
	var_224_0.step[1].desc = language.get(135623)
	var_224_0.open = "silk_npc_move"

	return var_224_0
end

function roleDialogue.constant.dialogueFrame_1543()
	local var_225_0 = {}

	var_225_0.totalStep = 1
	var_225_0.step = {}
	var_225_0.step[1] = {}
	var_225_0.step[1].type = 2
	var_225_0.step[1].pic = "ksdd"
	var_225_0.step[1].desc = language.get(135624)
	var_225_0.open = "silk_btn_att"

	return var_225_0
end

function roleDialogue.constant.dialogueFrame_1544()
	local var_226_0 = {}

	var_226_0.totalStep = 2
	var_226_0.step = {}
	var_226_0.step[1] = {}
	var_226_0.step[1].type = 1
	var_226_0.step[1].pic = "xiaoqian"
	var_226_0.step[1].desc = language.get(135629)
	var_226_0.step[2] = {}
	var_226_0.step[2].type = 1
	var_226_0.step[2].pic = "xiaoqian"
	var_226_0.step[2].desc = language.get(135630)
	var_226_0.open = "silk_power_begin"

	return var_226_0
end

function roleDialogue.constant.dialogueFrame_1545()
	local var_227_0 = {}

	var_227_0.totalStep = 5
	var_227_0.step = {}
	var_227_0.step[1] = {}
	var_227_0.step[1].type = 1
	var_227_0.step[1].pic = "xiaoqian"
	var_227_0.step[1].desc = language.get(135631)
	var_227_0.step[2] = {}
	var_227_0.step[2].type = 2
	var_227_0.step[2].pic = "player"
	var_227_0.step[2].desc = language.get(135632)
	var_227_0.step[3] = {}
	var_227_0.step[3].type = 1
	var_227_0.step[3].pic = "xiaoqian"
	var_227_0.step[3].desc = language.get(135633)
	var_227_0.step[4] = {}
	var_227_0.step[4].type = 1
	var_227_0.step[4].pic = "xiaoqian"
	var_227_0.step[4].desc = language.get(135634)
	var_227_0.step[5] = {}
	var_227_0.step[5].type = 1
	var_227_0.step[5].pic = "xiaoqian"
	var_227_0.step[5].desc = language.get(135635)
	var_227_0.open = "silkRoad"

	return var_227_0
end

function roleDialogue.constant.dialogueFrame_1546()
	local var_228_0 = {}

	var_228_0.totalStep = 1
	var_228_0.step = {}
	var_228_0.step[1] = {}
	var_228_0.step[1].type = 1
	var_228_0.step[1].pic = "xiaoqian"
	var_228_0.step[1].desc = language.get(135639)
	var_228_0.open = "silkMarket"

	return var_228_0
end

function roleDialogue.constant.dialogueFrame_1547()
	local var_229_0 = {}

	var_229_0.totalStep = 3
	var_229_0.step = {}
	var_229_0.step[1] = {}
	var_229_0.step[1].type = 1
	var_229_0.step[1].pic = "zhouyu"
	var_229_0.step[1].desc = language.get(135651)
	var_229_0.step[2] = {}
	var_229_0.step[2].type = 1
	var_229_0.step[2].pic = "zhouyu"
	var_229_0.step[2].desc = language.get(135652)
	var_229_0.step[3] = {}
	var_229_0.step[3].type = 1
	var_229_0.step[3].pic = "zhouyu"
	var_229_0.step[3].desc = language.get(135653)

	return var_229_0
end

function roleDialogue.constant.dialogueFrame_1548()
	local var_230_0 = {}

	var_230_0.totalStep = 1
	var_230_0.step = {}
	var_230_0.step[1] = {}
	var_230_0.step[1].type = 1
	var_230_0.step[1].pic = "zhangfei"
	var_230_0.step[1].desc = language.get(135654)

	return var_230_0
end

function roleDialogue.constant.dialogueFrame_1549()
	local var_231_0 = {}

	var_231_0.totalStep = 1
	var_231_0.step = {}
	var_231_0.step[1] = {}
	var_231_0.step[1].type = 1
	var_231_0.step[1].pic = "guanyu"
	var_231_0.step[1].desc = language.get(135655)

	return var_231_0
end

function roleDialogue.constant.dialogueFrame_1550()
	local var_232_0 = {}

	var_232_0.totalStep = 2
	var_232_0.step = {}
	var_232_0.step[1] = {}
	var_232_0.step[1].type = 1
	var_232_0.step[1].pic = "zhangfei"
	var_232_0.step[1].desc = language.get(135656)
	var_232_0.step[2] = {}
	var_232_0.step[2].type = 1
	var_232_0.step[2].pic = "zhangfei"
	var_232_0.step[2].desc = language.get(135657)
	var_232_0.open = "cbhs_zf"

	return var_232_0
end

function roleDialogue.constant.dialogueFrame_1551()
	local var_233_0 = {}

	var_233_0.totalStep = 2
	var_233_0.step = {}
	var_233_0.step[1] = {}
	var_233_0.step[1].type = 1
	var_233_0.step[1].pic = "guanyu"
	var_233_0.step[1].desc = language.get(135656)
	var_233_0.step[2] = {}
	var_233_0.step[2].type = 1
	var_233_0.step[2].pic = "guanyu"
	var_233_0.step[2].desc = language.get(135657)
	var_233_0.open = "cbhs_gy"

	return var_233_0
end

function roleDialogue.constant.dialogueFrame_1552()
	local var_234_0 = {}

	var_234_0.totalStep = 2
	var_234_0.step = {}
	var_234_0.step[1] = {}
	var_234_0.step[1].type = 1
	var_234_0.step[1].pic = "zhouyu"
	var_234_0.step[1].desc = language.get(135658)
	var_234_0.step[2] = {}
	var_234_0.step[2].type = 1
	var_234_0.step[2].pic = "zhouyu"
	var_234_0.step[2].desc = language.get(135659)
	var_234_0.open = "cbhs_zy"

	return var_234_0
end

function roleDialogue.constant.dialogueFrame_1553()
	local var_235_0 = {}

	var_235_0.totalStep = 2
	var_235_0.step = {}
	var_235_0.step[1] = {}
	var_235_0.step[1].type = 1
	var_235_0.step[1].pic = "xiaoqian"
	var_235_0.step[1].desc = language.get(111032)
	var_235_0.step[2] = {}
	var_235_0.step[2].type = 1
	var_235_0.step[2].pic = "xiaoqian"
	var_235_0.step[2].desc = language.get(111033)
	var_235_0.open = "dailyFeat"

	return var_235_0
end

function roleDialogue.constant.dialogueFrame_1554()
	local var_236_0 = var_0_0()
	local var_236_1 = {}

	var_236_1.totalStep = 3
	var_236_1.step = {}
	var_236_1.step[1] = {}
	var_236_1.step[1].type = 1
	var_236_1.step[1].pic = var_236_0
	var_236_1.step[1].desc = language.get(121090)
	var_236_1.step[2] = {}
	var_236_1.step[2].type = 1
	var_236_1.step[2].pic = var_236_0
	var_236_1.step[2].desc = language.get(121091)
	var_236_1.step[3] = {}
	var_236_1.step[3].type = 1
	var_236_1.step[3].pic = var_236_0
	var_236_1.step[3].desc = language.get(121092)

	return var_236_1
end

function roleDialogue.constant.dialogueFrame_1555()
	local var_237_0 = {}

	var_237_0.totalStep = 2
	var_237_0.step = {}
	var_237_0.step[1] = {}
	var_237_0.step[1].type = 1
	var_237_0.step[1].pic = "ganjiang"
	var_237_0.step[1].desc = language.get(121093)
	var_237_0.step[2] = {}
	var_237_0.step[2].type = 1
	var_237_0.step[2].pic = "ganjiang"
	var_237_0.step[2].desc = language.get(121094)
	var_237_0.open = "blacksmith"

	return var_237_0
end

function roleDialogue.constant.dialogueFrame_1556()
	local var_238_0 = eventManager.dispatchEvent("godWeaponReward")
	local var_238_1 = {}

	var_238_1.totalStep = 2
	var_238_1.step = {}
	var_238_1.step[1] = {}
	var_238_1.step[1].type = 1
	var_238_1.step[1].pic = var_238_0.smith
	var_238_1.step[1].desc = language.get(121095, var_238_0.lv)
	var_238_1.step[2] = {}
	var_238_1.step[2].type = 1
	var_238_1.step[2].pic = var_238_0.smith
	var_238_1.step[2].desc = language.get(121096)
	var_238_1.open = "blacksmith"

	return var_238_1
end

function roleDialogue.constant.dialogueFrame_1557()
	local var_239_0 = eventManager.dispatchEvent("godWeaponReward")
	local var_239_1 = var_0_0()
	local var_239_2 = {}

	var_239_2.totalStep = 2
	var_239_2.step = {}
	var_239_2.step[1] = {}
	var_239_2.step[1].type = 1
	var_239_2.step[1].pic = var_239_1
	var_239_2.step[1].desc = language.get(121097, var_239_0.lv)
	var_239_2.step[2] = {}
	var_239_2.step[2].type = 1
	var_239_2.step[2].pic = var_239_1
	var_239_2.step[2].desc = language.get(121098)

	return var_239_2
end

function roleDialogue.constant.dialogueFrame_1558()
	local var_240_0 = var_0_0()
	local var_240_1 = {}

	var_240_1.totalStep = 2
	var_240_1.step = {}
	var_240_1.step[1] = {}
	var_240_1.step[1].type = 1
	var_240_1.step[1].pic = var_240_0
	var_240_1.step[1].desc = language.get(121099)
	var_240_1.step[2] = {}
	var_240_1.step[2].type = 1
	var_240_1.step[2].pic = var_240_0
	var_240_1.step[2].desc = language.get(121100)

	return var_240_1
end

function roleDialogue.constant.dialogueFrame_1559()
	local var_241_0 = var_0_0()
	local var_241_1 = {}

	var_241_1.totalStep = 3
	var_241_1.step = {}
	var_241_1.step[1] = {}
	var_241_1.step[1].type = 1
	var_241_1.step[1].pic = var_241_0
	var_241_1.step[1].desc = language.get(121101)
	var_241_1.step[2] = {}
	var_241_1.step[2].type = 1
	var_241_1.step[2].pic = var_241_0
	var_241_1.step[2].desc = language.get(121102)
	var_241_1.step[3] = {}
	var_241_1.step[3].type = 1
	var_241_1.step[3].pic = var_241_0
	var_241_1.step[3].desc = language.get(121103)

	return var_241_1
end

function roleDialogue.constant.dialogueFrame_1560()
	local var_242_0 = eventManager.dispatchEvent("godWeaponReward")
	local var_242_1 = var_0_0()
	local var_242_2 = {}

	var_242_2.totalStep = 1
	var_242_2.step = {}
	var_242_2.step[1] = {}
	var_242_2.step[1].type = 1
	var_242_2.step[1].pic = var_242_1
	var_242_2.step[1].desc = language.get(121104)

	return var_242_2
end

function roleDialogue.constant.dialogueFrame_1561()
	local var_243_0 = {}

	var_243_0.totalStep = 6
	var_243_0.step = {}
	var_243_0.step[1] = {}
	var_243_0.step[1].type = 1
	var_243_0.step[1].pic = "lvbu"
	var_243_0.step[1].desc = language.get(220730)
	var_243_0.step[2] = {}
	var_243_0.step[2].type = 1
	var_243_0.step[2].pic = "lvbu"
	var_243_0.step[2].desc = language.get(220731)
	var_243_0.step[3] = {}
	var_243_0.step[3].type = 1
	var_243_0.step[3].pic = "lvbu"
	var_243_0.step[3].desc = language.get(220732)
	var_243_0.step[4] = {}
	var_243_0.step[4].type = 2
	var_243_0.step[4].pic = "xiaoqian"
	var_243_0.step[4].desc = language.get(220733)
	var_243_0.step[5] = {}
	var_243_0.step[5].type = 1
	var_243_0.step[5].pic = "player"
	var_243_0.step[5].desc = language.get(220734)
	var_243_0.step[6] = {}
	var_243_0.step[6].type = 1
	var_243_0.step[6].pic = "player"
	var_243_0.step[6].desc = language.get(220735)

	return var_243_0
end

function roleDialogue.constant.dialogueFrame_1562()
	local var_244_0 = {}

	var_244_0.totalStep = 3
	var_244_0.step = {}
	var_244_0.step[1] = {}
	var_244_0.step[1].type = 1
	var_244_0.step[1].pic = "xiaoqian"
	var_244_0.step[1].desc = language.get(220736)
	var_244_0.step[2] = {}
	var_244_0.step[2].type = 2
	var_244_0.step[2].pic = "player"
	var_244_0.step[2].desc = language.get(220737)
	var_244_0.step[3] = {}
	var_244_0.step[3].type = 2
	var_244_0.step[3].pic = "jiangwei"
	var_244_0.step[3].desc = language.get(220738)

	return var_244_0
end

function roleDialogue.constant.dialogueFrame_1563()
	local var_245_0 = {}

	var_245_0.totalStep = 3
	var_245_0.step = {}
	var_245_0.step[1] = {}
	var_245_0.step[1].type = 1
	var_245_0.step[1].pic = "xiaoqian"
	var_245_0.step[1].desc = language.get(220739)
	var_245_0.step[2] = {}
	var_245_0.step[2].type = 2
	var_245_0.step[2].pic = "player"
	var_245_0.step[2].desc = language.get(220740)
	var_245_0.step[3] = {}
	var_245_0.step[3].type = 2
	var_245_0.step[3].pic = "taishici"
	var_245_0.step[3].desc = language.get(220741)

	return var_245_0
end

function roleDialogue.constant.dialogueFrame_1564()
	local var_246_0 = {}

	var_246_0.totalStep = 3
	var_246_0.step = {}
	var_246_0.step[1] = {}
	var_246_0.step[1].type = 1
	var_246_0.step[1].pic = "xiaoqian"
	var_246_0.step[1].desc = language.get(220742)
	var_246_0.step[2] = {}
	var_246_0.step[2].type = 2
	var_246_0.step[2].pic = "player"
	var_246_0.step[2].desc = language.get(220743)
	var_246_0.step[3] = {}
	var_246_0.step[3].type = 2
	var_246_0.step[3].pic = "zhaoyun"
	var_246_0.step[3].desc = language.get(220744)

	return var_246_0
end

function roleDialogue.constant.dialogueFrame_1565()
	local var_247_0 = {}

	var_247_0.totalStep = 3
	var_247_0.step = {}
	var_247_0.step[1] = {}
	var_247_0.step[1].type = 1
	var_247_0.step[1].pic = "player"
	var_247_0.step[1].desc = language.get(220745)
	var_247_0.step[2] = {}
	var_247_0.step[2].type = 2
	var_247_0.step[2].pic = "xiaoqian"
	var_247_0.step[2].desc = language.get(220746)
	var_247_0.step[3] = {}
	var_247_0.step[3].type = 2
	var_247_0.step[3].pic = "huangzhong"
	var_247_0.step[3].desc = language.get(220747)

	return var_247_0
end

function roleDialogue.constant.dialogueFrame_1566()
	local var_248_0 = {}

	var_248_0.totalStep = 4
	var_248_0.step = {}
	var_248_0.step[1] = {}
	var_248_0.step[1].type = 2
	var_248_0.step[1].pic = "lvbu"
	var_248_0.step[1].desc = language.get(220748)
	var_248_0.step[2] = {}
	var_248_0.step[2].type = 1
	var_248_0.step[2].pic = "player"
	var_248_0.step[2].desc = language.get(220749)
	var_248_0.step[3] = {}
	var_248_0.step[3].type = 2
	var_248_0.step[3].pic = "xiahoudun"
	var_248_0.step[3].desc = language.get(220750)
	var_248_0.step[4] = {}
	var_248_0.step[4].type = 1
	var_248_0.step[4].pic = "xiaoqian"
	var_248_0.step[4].desc = language.get(220751)

	return var_248_0
end

function roleDialogue.constant.dialogueFrame_1567()
	local var_249_0 = {}

	var_249_0.totalStep = 5
	var_249_0.step = {}
	var_249_0.step[1] = {}
	var_249_0.step[1].type = 2
	var_249_0.step[1].pic = "lvbu"
	var_249_0.step[1].desc = language.get(220752)
	var_249_0.step[2] = {}
	var_249_0.step[2].type = 1
	var_249_0.step[2].pic = "xiahoudun"
	var_249_0.step[2].desc = language.get(220753)
	var_249_0.step[3] = {}
	var_249_0.step[3].type = 2
	var_249_0.step[3].pic = "lvbu"
	var_249_0.step[3].desc = language.get(220754)
	var_249_0.step[4] = {}
	var_249_0.step[4].type = 2
	var_249_0.step[4].pic = "lvbu"
	var_249_0.step[4].desc = language.get(220755)
	var_249_0.step[5] = {}
	var_249_0.step[5].type = 1
	var_249_0.step[5].pic = "xiahoudun"
	var_249_0.step[5].desc = language.get(220756)
	var_249_0.open = "xiahoudun1"

	return var_249_0
end

function roleDialogue.constant.dialogueFrame_1568()
	local var_250_0 = {}

	var_250_0.totalStep = 4
	var_250_0.step = {}
	var_250_0.step[1] = {}
	var_250_0.step[1].type = 2
	var_250_0.step[1].pic = "player"
	var_250_0.step[1].desc = language.get(220757)
	var_250_0.step[2] = {}
	var_250_0.step[2].type = 2
	var_250_0.step[2].pic = "player"
	var_250_0.step[2].desc = language.get(220758)
	var_250_0.step[3] = {}
	var_250_0.step[3].type = 1
	var_250_0.step[3].pic = "xiahoudun"
	var_250_0.step[3].desc = language.get(220759)
	var_250_0.step[4] = {}
	var_250_0.step[4].type = 2
	var_250_0.step[4].pic = "xiaoqian"
	var_250_0.step[4].desc = language.get(220760)

	return var_250_0
end

function roleDialogue.constant.dialogueFrame_1569()
	local var_251_0 = var_0_1()
	local var_251_1 = {}

	var_251_1.totalStep = 2
	var_251_1.step = {}
	var_251_1.step[1] = {}
	var_251_1.step[1].type = 1
	var_251_1.step[1].pic = var_251_0
	var_251_1.step[1].desc = language.get(92119)
	var_251_1.step[2] = {}
	var_251_1.step[2].type = 1
	var_251_1.step[2].pic = var_251_0
	var_251_1.step[2].desc = language.get(92120)

	return var_251_1
end

function roleDialogue.constant.dialogueFrame_1570()
	local var_252_0 = var_0_1()
	local var_252_1 = {}

	var_252_1.totalStep = 2
	var_252_1.step = {}
	var_252_1.step[1] = {}
	var_252_1.step[1].type = 1
	var_252_1.step[1].pic = var_252_0
	var_252_1.step[1].desc = language.get(92122)
	var_252_1.step[2] = {}
	var_252_1.step[2].type = 1
	var_252_1.step[2].pic = var_252_0
	var_252_1.step[2].desc = language.get(92123)
	var_252_1.open = "nationTask"

	return var_252_1
end

function roleDialogue.constant.dialogueFrame_1571()
	local var_253_0 = var_0_1()
	local var_253_1 = {}

	var_253_1.totalStep = 2
	var_253_1.step = {}
	var_253_1.step[1] = {}
	var_253_1.step[1].type = 1
	var_253_1.step[1].pic = var_253_0
	var_253_1.step[1].desc = language.get(92124)
	var_253_1.step[2] = {}
	var_253_1.step[2].type = 1
	var_253_1.step[2].pic = var_253_0
	var_253_1.step[2].desc = language.get(92125)
	var_253_1.open = "nationTask"

	return var_253_1
end

function roleDialogue.constant.dialogueFrame_1572()
	local var_254_0 = var_0_0()
	local var_254_1 = {}

	var_254_1.totalStep = 1
	var_254_1.step = {}
	var_254_1.step[1] = {}
	var_254_1.step[1].type = 1
	var_254_1.step[1].pic = var_254_0
	var_254_1.step[1].desc = language.get(121105)

	return var_254_1
end

function roleDialogue.constant.dialogueFrame_1573()
	local var_255_0 = {}

	var_255_0.totalStep = 1
	var_255_0.step = {}
	var_255_0.step[1] = {}
	var_255_0.step[1].type = 1
	var_255_0.step[1].pic = "xunyu2"
	var_255_0.step[1].desc = language.get(83046)
	var_255_0.open = "gotoTavern"

	return var_255_0
end

function roleDialogue.constant.dialogueFrame_1574()
	local var_256_0 = {}

	var_256_0.totalStep = 1
	var_256_0.step = {}
	var_256_0.step[1] = {}
	var_256_0.step[1].type = 1
	var_256_0.step[1].pic = "xiaoqian"
	var_256_0.step[1].desc = language.get(111067)

	return var_256_0
end

function roleDialogue.constant.dialogueFrame_1575()
	local var_257_0 = var_0_0()
	local var_257_1 = {}

	var_257_1.totalStep = 1
	var_257_1.step = {}
	var_257_1.step[1] = {}
	var_257_1.step[1].type = 1
	var_257_1.step[1].pic = var_257_0
	var_257_1.step[1].desc = language.get(121106)

	return var_257_1
end

function roleDialogue.constant.dialogueFrame_1576()
	local var_258_0 = var_0_0()
	local var_258_1 = {}

	var_258_1.totalStep = 1
	var_258_1.step = {}
	var_258_1.step[1] = {}
	var_258_1.step[1].type = 1
	var_258_1.step[1].pic = var_258_0
	var_258_1.step[1].desc = language.get(121107)

	return var_258_1
end

function roleDialogue.constant.dialogueFrame_1577()
	local var_259_0 = {}

	var_259_0.totalStep = 4
	var_259_0.step = {}
	var_259_0.step[1] = {}
	var_259_0.step[1].type = 1
	var_259_0.step[1].pic = "zhugeliang"
	var_259_0.step[1].desc = language.get(220767)
	var_259_0.step[2] = {}
	var_259_0.step[2].type = 2
	var_259_0.step[2].pic = "player"
	var_259_0.step[2].desc = language.get(220768)
	var_259_0.step[3] = {}
	var_259_0.step[3].type = 2
	var_259_0.step[3].pic = "player"
	var_259_0.step[3].desc = language.get(220769)
	var_259_0.step[4] = {}
	var_259_0.step[4].type = 1
	var_259_0.step[4].pic = "menghuo"
	var_259_0.step[4].desc = language.get(220770)

	return var_259_0
end

function roleDialogue.constant.dialogueFrame_1578()
	local var_260_0 = {}

	var_260_0.totalStep = 3
	var_260_0.step = {}
	var_260_0.step[1] = {}
	var_260_0.step[1].type = 2
	var_260_0.step[1].pic = "menghuo"
	var_260_0.step[1].desc = language.get(220771)
	var_260_0.step[2] = {}
	var_260_0.step[2].type = 1
	var_260_0.step[2].pic = "player"
	var_260_0.step[2].desc = language.get(220772)
	var_260_0.step[3] = {}
	var_260_0.step[3].type = 1
	var_260_0.step[3].pic = "xiaoqian"
	var_260_0.step[3].desc = language.get(220773)

	return var_260_0
end

function roleDialogue.constant.dialogueFrame_1579()
	local var_261_0 = var_0_0()
	local var_261_1 = {}

	var_261_1.totalStep = 2
	var_261_1.step = {}
	var_261_1.step[1] = {}
	var_261_1.step[1].type = 1
	var_261_1.step[1].pic = var_261_0
	var_261_1.step[1].desc = language.get(136240)
	var_261_1.step[2] = {}
	var_261_1.step[2].type = 1
	var_261_1.step[2].pic = var_261_0
	var_261_1.step[2].desc = language.get(136241)

	return var_261_1
end

function roleDialogue.constant.dialogueFrame_1580()
	local var_262_0 = {}

	var_262_0.totalStep = 1
	var_262_0.step = {}
	var_262_0.step[1] = {}
	var_262_0.step[1].type = 1
	var_262_0.step[1].pic = "zhenxiahoudun"
	var_262_0.step[1].desc = language.get("223203_zgljx")

	return var_262_0
end

function roleDialogue.constant.dialogueFrame_1581()
	local var_263_0 = {}

	var_263_0.totalStep = 3
	var_263_0.step = {}
	var_263_0.step[1] = {}
	var_263_0.step[1].type = 2
	var_263_0.step[1].pic = "player"
	var_263_0.step[1].desc = language.get(220774)
	var_263_0.step[2] = {}
	var_263_0.step[2].type = 1
	var_263_0.step[2].pic = "caoren"
	var_263_0.step[2].desc = language.get(220775)
	var_263_0.step[3] = {}
	var_263_0.step[3].type = 2
	var_263_0.step[3].pic = "player"
	var_263_0.step[3].desc = language.get(220776)

	return var_263_0
end

function roleDialogue.constant.dialogueFrame_1582()
	local var_264_0 = {}

	var_264_0.totalStep = 4
	var_264_0.step = {}
	var_264_0.step[1] = {}
	var_264_0.step[1].type = 1
	var_264_0.step[1].pic = "player"
	var_264_0.step[1].desc = language.get(220777)
	var_264_0.step[2] = {}
	var_264_0.step[2].type = 2
	var_264_0.step[2].pic = "caoren"
	var_264_0.step[2].desc = language.get(220778)
	var_264_0.step[3] = {}
	var_264_0.step[3].type = 1
	var_264_0.step[3].pic = "player"
	var_264_0.step[3].desc = language.get(220779)
	var_264_0.step[4] = {}
	var_264_0.step[4].type = 1
	var_264_0.step[4].pic = "xiaoqian"
	var_264_0.step[4].desc = language.get(220780)

	return var_264_0
end

function roleDialogue.constant.dialogueFrame_1583()
	local var_265_0 = {}

	var_265_0.totalStep = 1
	var_265_0.step = {}
	var_265_0.step[1] = {}
	var_265_0.step[1].type = 1
	var_265_0.step[1].pic = "xiaoqian"
	var_265_0.step[1].desc = language.get(136407)
	var_265_0.open = "showmuniu"

	return var_265_0
end

function roleDialogue.constant.dialogueFrame_1584()
	local var_266_0 = {}

	var_266_0.totalStep = 1
	var_266_0.step = {}
	var_266_0.step[1] = {}
	var_266_0.step[1].type = 1
	var_266_0.step[1].pic = "kongrong"
	var_266_0.step[1].desc = language.get(136488)

	return var_266_0
end

function roleDialogue.constant.dialogueFrame_1585()
	local var_267_0 = {}

	var_267_0.totalStep = 1
	var_267_0.step = {}
	var_267_0.step[1] = {}
	var_267_0.step[1].type = 1
	var_267_0.step[1].pic = "xiaoqian"
	var_267_0.step[1].desc = user.halfSilkTokenMsg

	return var_267_0
end

function roleDialogue.constant.dialogueFrame_1586()
	local var_268_0 = {}

	var_268_0.totalStep = 6
	var_268_0.step = {}
	var_268_0.step[1] = {}
	var_268_0.step[1].type = 1
	var_268_0.step[1].pic = "xiaoqian"
	var_268_0.step[1].desc = language.get(220781)
	var_268_0.step[2] = {}
	var_268_0.step[2].type = 2
	var_268_0.step[2].pic = "zhurong"
	var_268_0.step[2].desc = language.get(220782)
	var_268_0.step[3] = {}
	var_268_0.step[3].type = 1
	var_268_0.step[3].pic = "xiaoqian"
	var_268_0.step[3].desc = language.get(220783)
	var_268_0.step[4] = {}
	var_268_0.step[4].type = 2
	var_268_0.step[4].pic = "zhurong"
	var_268_0.step[4].desc = language.get(220784)
	var_268_0.step[5] = {}
	var_268_0.step[5].type = 2
	var_268_0.step[5].pic = "duihr"
	var_268_0.step[5].desc = language.get(220785)
	var_268_0.step[6] = {}
	var_268_0.step[6].type = 1
	var_268_0.step[6].pic = "zhurong"
	var_268_0.step[6].desc = language.get(220786)

	return var_268_0
end

function roleDialogue.constant.dialogueFrame_1587()
	local var_269_0 = {}

	var_269_0.totalStep = 3
	var_269_0.step = {}
	var_269_0.step[1] = {}
	var_269_0.step[1].type = 1
	var_269_0.step[1].pic = "duihr"
	var_269_0.step[1].desc = language.get(220787)
	var_269_0.step[2] = {}
	var_269_0.step[2].type = 2
	var_269_0.step[2].pic = "zhurong"
	var_269_0.step[2].desc = language.get(220788)
	var_269_0.step[3] = {}
	var_269_0.step[3].type = 1
	var_269_0.step[3].pic = "duihr"
	var_269_0.step[3].desc = language.get(220789)
	var_269_0.open = "zhurong1"

	return var_269_0
end

function roleDialogue.constant.dialogueFrame_1588()
	local var_270_0 = {}

	var_270_0.totalStep = 2
	var_270_0.step = {}
	var_270_0.step[1] = {}
	var_270_0.step[1].type = 2
	var_270_0.step[1].pic = "zhurong"
	var_270_0.step[1].desc = language.get(220790)
	var_270_0.step[2] = {}
	var_270_0.step[2].type = 1
	var_270_0.step[2].pic = "xiaoqian"
	var_270_0.step[2].desc = language.get(220791)

	return var_270_0
end

function roleDialogue.constant.dialogueFrame_1589()
	local var_271_0 = {}

	var_271_0.totalStep = 5
	var_271_0.step = {}
	var_271_0.step[1] = {}
	var_271_0.step[1].type = 1
	var_271_0.step[1].pic = "simayi"
	var_271_0.step[1].desc = language.get(220792)
	var_271_0.step[2] = {}
	var_271_0.step[2].type = 2
	var_271_0.step[2].pic = "player"
	var_271_0.step[2].desc = language.get(220793)
	var_271_0.step[3] = {}
	var_271_0.step[3].type = 1
	var_271_0.step[3].pic = "zhugeliang"
	var_271_0.step[3].desc = language.get(220794)
	var_271_0.step[4] = {}
	var_271_0.step[4].type = 2
	var_271_0.step[4].pic = "huangyueying"
	var_271_0.step[4].desc = language.get(220795)
	var_271_0.step[5] = {}
	var_271_0.step[5].type = 1
	var_271_0.step[5].pic = "zhugeliang"
	var_271_0.step[5].desc = language.get(220796)

	return var_271_0
end

function roleDialogue.constant.dialogueFrame_1590()
	local var_272_0 = {}

	var_272_0.totalStep = 7
	var_272_0.step = {}
	var_272_0.step[1] = {}
	var_272_0.step[1].type = 1
	var_272_0.step[1].pic = "player"
	var_272_0.step[1].desc = language.get(220797)
	var_272_0.step[2] = {}
	var_272_0.step[2].type = 2
	var_272_0.step[2].pic = "huangyueying"
	var_272_0.step[2].desc = language.get(220798)
	var_272_0.step[3] = {}
	var_272_0.step[3].type = 1
	var_272_0.step[3].pic = "player"
	var_272_0.step[3].desc = language.get(220799)
	var_272_0.step[4] = {}
	var_272_0.step[4].type = 2
	var_272_0.step[4].pic = "huangyueying"
	var_272_0.step[4].desc = language.get(220800)
	var_272_0.step[5] = {}
	var_272_0.step[5].type = 1
	var_272_0.step[5].pic = "player"
	var_272_0.step[5].desc = language.get(220801)
	var_272_0.step[6] = {}
	var_272_0.step[6].type = 2
	var_272_0.step[6].pic = "huangyueying"
	var_272_0.step[6].desc = language.get(220802)
	var_272_0.step[7] = {}
	var_272_0.step[7].type = 1
	var_272_0.step[7].pic = "xiaoqian"
	var_272_0.step[7].desc = language.get(220803)

	return var_272_0
end

function roleDialogue.constant.dialogueFrame_1591()
	local var_273_0 = {}

	var_273_0.totalStep = 5
	var_273_0.step = {}
	var_273_0.step[1] = {}
	var_273_0.step[1].type = 1
	var_273_0.step[1].pic = "player"
	var_273_0.step[1].desc = language.get(220804)
	var_273_0.step[2] = {}
	var_273_0.step[2].type = 2
	var_273_0.step[2].pic = "sunquan"
	var_273_0.step[2].desc = language.get(220805)
	var_273_0.step[3] = {}
	var_273_0.step[3].type = 1
	var_273_0.step[3].pic = "player"
	var_273_0.step[3].desc = language.get(220806)
	var_273_0.step[4] = {}
	var_273_0.step[4].type = 2
	var_273_0.step[4].pic = "sunquan"
	var_273_0.step[4].desc = language.get(220807)
	var_273_0.step[5] = {}
	var_273_0.step[5].type = 1
	var_273_0.step[5].pic = "player"
	var_273_0.step[5].desc = language.get(220808)

	return var_273_0
end

function roleDialogue.constant.dialogueFrame_1592()
	local var_274_0 = {}

	var_274_0.totalStep = 4
	var_274_0.step = {}
	var_274_0.step[1] = {}
	var_274_0.step[1].type = 1
	var_274_0.step[1].pic = "sunquan"
	var_274_0.step[1].desc = language.get(220809)
	var_274_0.step[2] = {}
	var_274_0.step[2].type = 2
	var_274_0.step[2].pic = "player"
	var_274_0.step[2].desc = language.get(220810)
	var_274_0.step[3] = {}
	var_274_0.step[3].type = 1
	var_274_0.step[3].pic = "sunquan"
	var_274_0.step[3].desc = language.get(220811)
	var_274_0.step[4] = {}
	var_274_0.step[4].type = 2
	var_274_0.step[4].pic = "xiaoqian"
	var_274_0.step[4].desc = language.get(220812)

	return var_274_0
end

function roleDialogue.constant.dialogueFrame_drawBack1()
	local var_275_0 = {}

	for iter_275_0, iter_275_1 in ipairs(user.taskDecide2) do
		if iter_275_1.strategy == "drawBack" and iter_275_1.selfNation == user.player.forceId then
			var_275_0 = iter_275_1

			break
		end
	end

	local var_275_1 = {}

	var_275_1.totalStep = 2
	var_275_1.step = {}
	var_275_1.step[1] = {}
	var_275_1.step[1].type = 1
	var_275_1.step[1].pic = "xiaoqian"
	var_275_1.step[1].desc = language.get(205505)
	var_275_1.step[2] = {}
	var_275_1.step[2].type = 1
	var_275_1.step[2].pic = "xiaoqian"
	var_275_1.step[2].desc = language.get(205506, var_275_0.preCityName, var_275_0.nowCityName)
	var_275_1.open = "drawBack1"

	return var_275_1
end

function roleDialogue.constant.dialogueFrame_drawBack2()
	local var_276_0 = {}

	for iter_276_0, iter_276_1 in ipairs(user.taskDecide2) do
		if iter_276_1.strategy == "drawBack" and iter_276_1.concernNation == user.player.forceId then
			var_276_0 = iter_276_1

			break
		end
	end

	local var_276_1 = {}

	var_276_1.totalStep = 2
	var_276_1.step = {}
	var_276_1.step[1] = {}
	var_276_1.step[1].type = 1
	var_276_1.step[1].pic = "xiaoqian"
	var_276_1.step[1].desc = language.get(205507, user.forceIdToName[var_276_0.selfNation])
	var_276_1.step[2] = {}
	var_276_1.step[2].type = 1
	var_276_1.step[2].pic = "xiaoqian"
	var_276_1.step[2].desc = language.get(205508, var_276_0.preCityName, var_276_0.nowCityName)
	var_276_1.open = "drawBack2"

	return var_276_1
end

function roleDialogue.constant.dialogueFrame_surround1()
	local var_277_0 = {}

	for iter_277_0, iter_277_1 in ipairs(user.taskDecide2) do
		if iter_277_1.strategy == "surround" and iter_277_1.selfNation == user.player.forceId then
			var_277_0 = iter_277_1

			break
		end
	end

	local var_277_1 = {}

	var_277_1.totalStep = 2
	var_277_1.step = {}
	var_277_1.step[1] = {}
	var_277_1.step[1].type = 1
	var_277_1.step[1].pic = "xiaoqian"
	var_277_1.step[1].desc = language.get(205509)
	var_277_1.step[2] = {}
	var_277_1.step[2].type = 1
	var_277_1.step[2].pic = "xiaoqian"
	var_277_1.step[2].desc = language.get(205510, var_277_0.npcNum)
	var_277_1.open = "surround1"

	return var_277_1
end

function roleDialogue.constant.dialogueFrame_surround2()
	local var_278_0 = {}

	for iter_278_0, iter_278_1 in ipairs(user.taskDecide2) do
		if iter_278_1.strategy == "surround" and iter_278_1.concernNation == user.player.forceId then
			var_278_0 = iter_278_1

			break
		end
	end

	local var_278_1 = {}

	var_278_1.totalStep = 2
	var_278_1.step = {}
	var_278_1.step[1] = {}
	var_278_1.step[1].type = 1
	var_278_1.step[1].pic = "xiaoqian"
	var_278_1.step[1].desc = language.get(205511, user.forceIdToName[var_278_0.selfNation])
	var_278_1.step[2] = {}
	var_278_1.step[2].type = 1
	var_278_1.step[2].pic = "xiaoqian"
	var_278_1.step[2].desc = language.get(205512, var_278_0.npcNum)
	var_278_1.open = "surround2"

	return var_278_1
end

function roleDialogue.constant.dialogueFrame_killAll_win()
	local var_279_0 = {}

	var_279_0.totalStep = 1
	var_279_0.step = {}
	var_279_0.step[1] = {}
	var_279_0.step[1].type = 1
	var_279_0.step[1].pic = "xiaoqian"
	var_279_0.step[1].desc = language.get(205522)
	var_279_0.open = "killAll"

	return var_279_0
end

function roleDialogue.constant.dialogueFrame_killAll_lose()
	local var_280_0 = {}

	var_280_0.totalStep = 1
	var_280_0.step = {}
	var_280_0.step[1] = {}
	var_280_0.step[1].type = 1
	var_280_0.step[1].pic = "xiaoqian"
	var_280_0.step[1].desc = language.get(205523)
	var_280_0.open = "killAll"

	return var_280_0
end

function roleDialogue.constant.dialogueFrame_kfyzMedal()
	local var_281_0 = {}

	var_281_0.totalStep = 1
	var_281_0.step = {}
	var_281_0.step[1] = {}
	var_281_0.step[1].type = 1
	var_281_0.step[1].pic = "xiaoqian"
	var_281_0.step[1].desc = language.get(1070231, 100 * tonumber(user.conquestRate))
	var_281_0.open = "kfyzMedal"

	return var_281_0
end

function roleDialogue.constant.dialogueFrame_seasilk2_1()
	local var_282_0 = {}

	var_282_0.totalStep = 1
	var_282_0.step = {}
	var_282_0.step[1] = {}
	var_282_0.step[1].type = 1
	var_282_0.step[1].pic = "duihr"
	var_282_0.step[1].desc = language.get(136205)
	var_282_0.open = "seasilk2_1"

	return var_282_0
end

function roleDialogue.constant.dialogueFrame_seasilk2_2()
	local var_283_0 = {}

	var_283_0.totalStep = 1
	var_283_0.step = {}
	var_283_0.step[1] = {}
	var_283_0.step[1].type = 1
	var_283_0.step[1].pic = "duihr"
	var_283_0.step[1].desc = language.get(136206)
	var_283_0.open = "seasilk2_2"

	return var_283_0
end

function roleDialogue.constant.dialogueFrame_seasilk2_3()
	local var_284_0 = {}

	var_284_0.totalStep = 1
	var_284_0.step = {}
	var_284_0.step[1] = {}
	var_284_0.step[1].type = 1
	var_284_0.step[1].pic = "duihr"
	var_284_0.step[1].desc = language.get(136208)
	var_284_0.open = "seasilk2_3"

	return var_284_0
end

function roleDialogue.constant.dialogueFrame_worldBuild()
	local var_285_0 = {}

	var_285_0.totalStep = 2
	var_285_0.step = {}
	var_285_0.step[1] = {}
	var_285_0.step[1].type = 1
	var_285_0.step[1].pic = "xiaoqian"
	var_285_0.step[1].desc = language.get(136578)
	var_285_0.step[2] = {}
	var_285_0.step[2].type = 1
	var_285_0.step[2].pic = "xiaoqian"
	var_285_0.step[2].desc = language.get(136579)

	return var_285_0
end

function roleDialogue.constant.dialogueFrame_worldBuildFour()
	local var_286_0 = {}

	var_286_0.totalStep = 4
	var_286_0.step = {}
	var_286_0.step[1] = {}
	var_286_0.step[1].type = 1
	var_286_0.step[1].pic = "xiaoqian"
	var_286_0.step[1].desc = language.get(136580)
	var_286_0.step[2] = {}
	var_286_0.step[2].type = 1
	var_286_0.step[2].pic = "xiaoqian"
	var_286_0.step[2].desc = language.get(136581)
	var_286_0.step[3] = {}
	var_286_0.step[3].type = 1
	var_286_0.step[3].pic = "xiaoqian"
	var_286_0.step[3].desc = language.get(136582)
	var_286_0.step[4] = {}
	var_286_0.step[4].type = 1
	var_286_0.step[4].pic = "xiaoqian"
	var_286_0.step[4].desc = language.get(136583)

	return var_286_0
end

function roleDialogue.constant.dialogueFrame_kfglFail()
	local var_287_0 = {}

	var_287_0.totalStep = 1
	var_287_0.step = {}
	var_287_0.step[1] = {}
	var_287_0.step[1].type = 1
	var_287_0.step[1].pic = "xiaoqian"
	var_287_0.step[1].desc = language.get(136584)

	return var_287_0
end

function roleDialogue.constant.dialogueFrame_kfglState1()
	local var_288_0 = {}

	var_288_0.totalStep = 1
	var_288_0.step = {}
	var_288_0.step[1] = {}
	var_288_0.step[1].type = 1
	var_288_0.step[1].pic = "zhugeliang"
	var_288_0.step[1].desc = language.get(136585)
	var_288_0.open = "kfyz_korea1"

	return var_288_0
end

function roleDialogue.constant.dialogueFrame_kfglState2()
	local var_289_0 = {}

	var_289_0.totalStep = 1
	var_289_0.step = {}
	var_289_0.step[1] = {}
	var_289_0.step[1].type = 1
	var_289_0.step[1].pic = "zhugeliang"
	var_289_0.step[1].desc = language.get(136586)

	return var_289_0
end

function roleDialogue.constant.dialogueFrame_kfglState3()
	local var_290_0 = {}

	var_290_0.totalStep = 1
	var_290_0.step = {}
	var_290_0.step[1] = {}
	var_290_0.step[1].type = 1
	var_290_0.step[1].pic = "zhugeliang"
	var_290_0.step[1].desc = language.get(136587)

	return var_290_0
end

function roleDialogue.constant.dialogueFrame_kfglState4()
	local var_291_0 = {}

	var_291_0.totalStep = 1
	var_291_0.step = {}
	var_291_0.step[1] = {}
	var_291_0.step[1].type = 1
	var_291_0.step[1].pic = "zhugeliang"
	var_291_0.step[1].desc = language.get(136588)
	var_291_0.open = "kfyz_korea2"

	return var_291_0
end

function roleDialogue.constant.dialogueFrame_kfglState5()
	local var_292_0 = {}

	var_292_0.totalStep = 2
	var_292_0.step = {}
	var_292_0.step[1] = {}
	var_292_0.step[1].type = 1
	var_292_0.step[1].pic = "zhugeliang"
	var_292_0.step[1].desc = language.get(136589)
	var_292_0.step[2] = {}
	var_292_0.step[2].type = 1
	var_292_0.step[2].pic = "zhugeliang"
	var_292_0.step[2].desc = language.get(136590)
	var_292_0.open = "kfyz_korea3"

	return var_292_0
end

function roleDialogue.constant.dialogueFrame_kfglState6()
	local var_293_0 = {}

	var_293_0.totalStep = 1
	var_293_0.step = {}
	var_293_0.step[1] = {}
	var_293_0.step[1].type = 1
	var_293_0.step[1].pic = "zhugeliang"
	var_293_0.step[1].desc = language.get(136591)

	return var_293_0
end

function roleDialogue.constant.dialogueFrame_kfglChampion5035_1()
	local var_294_0 = {}

	var_294_0.totalStep = 1
	var_294_0.step = {}
	var_294_0.step[1] = {}
	var_294_0.step[1].type = 1
	var_294_0.step[1].pic = "zhoumouwang"
	var_294_0.step[1].desc = language.get(136592)

	return var_294_0
end

function roleDialogue.constant.dialogueFrame_kfglChampion5036_1()
	local var_295_0 = {}

	var_295_0.totalStep = 1
	var_295_0.step = {}
	var_295_0.step[1] = {}
	var_295_0.step[1].type = 1
	var_295_0.step[1].pic = "wangzhongxian"
	var_295_0.step[1].desc = language.get(136593)

	return var_295_0
end

function roleDialogue.constant.dialogueFrame_kfglChampion5039_1()
	local var_296_0 = {}

	var_296_0.totalStep = 1
	var_296_0.step = {}
	var_296_0.step[1] = {}
	var_296_0.step[1].type = 1
	var_296_0.step[1].pic = "lilvshui"
	var_296_0.step[1].desc = language.get(136594)

	return var_296_0
end

function roleDialogue.constant.dialogueFrame_kfglChampion5035_2()
	local var_297_0 = {}

	var_297_0.totalStep = 1
	var_297_0.step = {}
	var_297_0.step[1] = {}
	var_297_0.step[1].type = 1
	var_297_0.step[1].pic = "zhoumouwang"
	var_297_0.step[1].desc = language.get(136595)

	return var_297_0
end

function roleDialogue.constant.dialogueFrame_kfglChampion5036_2()
	local var_298_0 = {}

	var_298_0.totalStep = 1
	var_298_0.step = {}
	var_298_0.step[1] = {}
	var_298_0.step[1].type = 1
	var_298_0.step[1].pic = "wangzhongxian"
	var_298_0.step[1].desc = language.get(136596)

	return var_298_0
end

function roleDialogue.constant.dialogueFrame_kfglChampion5039_2()
	local var_299_0 = {}

	var_299_0.totalStep = 1
	var_299_0.step = {}
	var_299_0.step[1] = {}
	var_299_0.step[1].type = 1
	var_299_0.step[1].pic = "lilvshui"
	var_299_0.step[1].desc = language.get(136597)

	return var_299_0
end

function roleDialogue.constant.dialogueFrame_newInvest0()
	local var_300_0 = {
		137020,
		137021,
		137022
	}
	local var_300_1 = {}

	var_300_1.totalStep = 1
	var_300_1.step = {}
	var_300_1.step[1] = {}
	var_300_1.step[1].type = 1
	var_300_1.step[1].pic = "player"
	var_300_1.step[1].desc = language.get(var_300_0[user.player.forceId], tool.getFormatNum(user.newInvestTarget))

	return var_300_1
end

function roleDialogue.constant.dialogueFrame_newInvest1()
	local var_301_0 = {}

	var_301_0.totalStep = 1
	var_301_0.step = {}
	var_301_0.step[1] = {}
	var_301_0.step[1].type = 1
	var_301_0.step[1].pic = "player"
	var_301_0.step[1].desc = language.get(137027)

	return var_301_0
end

function roleDialogue.constant.dialogueFrame_newInvest2()
	local var_302_0 = {
		137001,
		137002,
		137003
	}
	local var_302_1 = {}

	var_302_1.totalStep = 1
	var_302_1.step = {}
	var_302_1.step[1] = {}
	var_302_1.step[1].type = 1
	var_302_1.step[1].pic = "player"
	var_302_1.step[1].desc = language.get(137023, language.get(var_302_0[user.player.forceId]))

	return var_302_1
end

function roleDialogue.constant.dialogueFrame_newInvest3()
	local var_303_0 = {}

	var_303_0.totalStep = 1
	var_303_0.step = {}
	var_303_0.step[1] = {}
	var_303_0.step[1].type = 1
	var_303_0.step[1].pic = "player"
	var_303_0.step[1].desc = language.get(137028)

	return var_303_0
end

function roleDialogue.constant.dialogueFrame_arenaGoSignUp()
	local var_304_0 = {}

	var_304_0.totalStep = 1
	var_304_0.step = {}
	var_304_0.step[1] = {}
	var_304_0.step[1].type = 1
	var_304_0.step[1].pic = "xiaoqian"
	var_304_0.step[1].desc = language.get(137100)
	var_304_0.open = "nationTask"

	return var_304_0
end

function roleDialogue.constant.dialogueFrame_arenaGoWatch()
	local var_305_0 = {}

	var_305_0.totalStep = 1
	var_305_0.step = {}
	var_305_0.step[1] = {}
	var_305_0.step[1].type = 1
	var_305_0.step[1].pic = "xiaoqian"
	var_305_0.step[1].desc = language.get(137101)
	var_305_0.open = "nationTask"

	return var_305_0
end

function roleDialogue.constant.dialogueFrame_godGemTech1()
	local var_306_0 = {}

	var_306_0.totalStep = 2
	var_306_0.step = {}
	var_306_0.step[1] = {}
	var_306_0.step[1].type = 1
	var_306_0.step[1].pic = "xiaoqian"
	var_306_0.step[1].desc = language.get(137144)
	var_306_0.step[2] = {}
	var_306_0.step[2].type = 1
	var_306_0.step[2].pic = "xiaoqian"
	var_306_0.step[2].desc = language.get(137145)
	var_306_0.open = "openGemShop"

	return var_306_0
end

function roleDialogue.constant.dialogueFrame_godGemTech2()
	local var_307_0 = {}

	var_307_0.totalStep = 1
	var_307_0.step = {}
	var_307_0.step[1] = {}
	var_307_0.step[1].type = 1
	var_307_0.step[1].pic = "xiaoqian"
	var_307_0.step[1].desc = language.get(137146)

	return var_307_0
end

function roleDialogue.constant.dialogueFrame_warShop()
	local var_308_0 = {}

	var_308_0.totalStep = 1
	var_308_0.step = {}
	var_308_0.step[1] = {}
	var_308_0.step[1].type = 1
	var_308_0.step[1].pic = "xiaoqian"
	var_308_0.step[1].desc = language.get(215407)
	var_308_0.open = "openStore"

	return var_308_0
end

function roleDialogue.constant.dialogueFrame_strategyChooseLose()
	local var_309_0 = {}

	var_309_0.totalStep = 1
	var_309_0.step = {}
	var_309_0.step[1] = {}
	var_309_0.step[1].type = 1
	var_309_0.step[1].pic = "xiaoqian"
	var_309_0.step[1].desc = language.get("205530_zww")

	return var_309_0
end

function roleDialogue.constant.dialogueFrame_1600()
	local var_310_0 = {}

	var_310_0.totalStep = 4
	var_310_0.step = {}
	var_310_0.step[1] = {}
	var_310_0.step[1].type = 1
	var_310_0.step[1].pic = "xiaoqian"
	var_310_0.step[1].desc = language.get(190209)
	var_310_0.step[2] = {}
	var_310_0.step[2].type = 1
	var_310_0.step[2].pic = "xiaoqian"
	var_310_0.step[2].desc = language.get(190210)
	var_310_0.step[3] = {}
	var_310_0.step[3].type = 1
	var_310_0.step[3].pic = "xiaoqian"
	var_310_0.step[3].desc = language.get(190211)
	var_310_0.step[4] = {}
	var_310_0.step[4].type = 1
	var_310_0.step[4].pic = "xiaoqian"
	var_310_0.step[4].desc = language.get(190212)

	return var_310_0
end

function roleDialogue.constant.dialogueFrame_1700()
	local var_311_0 = {}

	var_311_0.totalStep = 2
	var_311_0.step = {}
	var_311_0.step[1] = {}
	var_311_0.step[1].type = 1
	var_311_0.step[1].pic = "xiaoqian"

	if celebration.dialogueType == 1 then
		var_311_0.step[1].desc = language.get(320509, celebration.dialogueName)
	elseif celebration.dialogueType == 2 or celebration.dialogueType == 3 or celebration.dialogueType == 4 or celebration.dialogueType == 11 then
		var_311_0.step[1].desc = language.get(320508, celebration.dialogueName)
	elseif celebration.dialogueType == 5 then
		var_311_0.step[1].desc = language.get(320522, celebration.dialogueName)
	elseif celebration.dialogueType == 6 or celebration.dialogueType == 7 then
		var_311_0.step[1].desc = language.get(320523, celebration.dialogueName)
	elseif celebration.dialogueType == 8 then
		var_311_0.step[1].desc = language.get(320524, celebration.dialogueName)
	elseif celebration.dialogueType == 9 then
		var_311_0.step[1].desc = language.get(320525, celebration.dialogueName)
	elseif celebration.dialogueType == 15 then
		var_311_0.step[1].desc = language.get(320526, celebration.dialogueName)
	else
		var_311_0.step[1].desc = language.get(320508, celebration.dialogueName)
	end

	var_311_0.step[2] = {}
	var_311_0.step[2].type = 1
	var_311_0.step[2].pic = "xiaoqian"
	var_311_0.step[2].desc = language.get(320510)

	return var_311_0
end

function roleDialogue.constant.dialogueFrame_1800()
	local var_312_0 = {}

	var_312_0.totalStep = 2
	var_312_0.step = {}
	var_312_0.step[1] = {}
	var_312_0.step[1].type = 1
	var_312_0.step[1].pic = "xiaoqian"
	var_312_0.step[1].desc = language.get(490202)
	var_312_0.step[2] = {}
	var_312_0.step[2].type = 2
	var_312_0.step[2].pic = "sunjian"
	var_312_0.step[2].desc = language.get(490206)

	return var_312_0
end

function roleDialogue.constant.dialogueFrame_1801()
	local var_313_0 = {}

	var_313_0.totalStep = 1
	var_313_0.step = {}
	var_313_0.step[1] = {}
	var_313_0.step[1].type = 2
	var_313_0.step[1].pic = "xiaoqian"
	var_313_0.step[1].desc = language.get(490207)

	return var_313_0
end

function roleDialogue.constant.dialogueFrame_1802()
	local var_314_0 = {}

	var_314_0.totalStep = 2
	var_314_0.step = {}
	var_314_0.step[1] = {}
	var_314_0.step[1].type = 1
	var_314_0.step[1].pic = "sunjian"
	var_314_0.step[1].desc = language.get(490205)
	var_314_0.step[2] = {}
	var_314_0.step[2].type = 2
	var_314_0.step[2].pic = "xiaoqian"
	var_314_0.step[2].desc = language.get(490209)

	return var_314_0
end

function roleDialogue.constant.dialogueFrame_1803()
	require("lua/layer/task/control")

	local var_315_0 = {}

	var_315_0.totalStep = 2
	var_315_0.step = {}
	var_315_0.step[1] = {}
	var_315_0.step[1].type = 1
	var_315_0.step[1].pic = "xiaoqian"
	var_315_0.step[1].desc = language.get(490500, taskControl.bstask.def)
	var_315_0.step[2] = {}
	var_315_0.step[2].type = 1
	var_315_0.step[2].pic = "xiaoqian"
	var_315_0.step[2].desc = language.get(490501, taskControl.bstask.def)
	var_315_0.open = "weichengBegin"

	return var_315_0
end

function roleDialogue.constant.dialogueFrame_1804()
	require("lua/layer/task/control")

	local var_316_0 = {}

	var_316_0.totalStep = 2
	var_316_0.step = {}
	var_316_0.step[1] = {}
	var_316_0.step[1].type = 1
	var_316_0.step[1].pic = "xiaoqian"
	var_316_0.step[1].desc = language.get(490502, taskControl.bstask.att)
	var_316_0.step[2] = {}
	var_316_0.step[2].type = 1
	var_316_0.step[2].pic = "xiaoqian"
	var_316_0.step[2].desc = language.get(490503, taskControl.bstask.sup, taskControl.bstask.att, taskControl.bstask.att)
	var_316_0.open = "weichengBegin"

	return var_316_0
end

function roleDialogue.constant.dialogueFrame_1805()
	require("lua/layer/task/control")

	local var_317_0 = {}

	var_317_0.totalStep = 2
	var_317_0.step = {}
	var_317_0.step[1] = {}
	var_317_0.step[1].type = 1
	var_317_0.step[1].pic = "xiaoqian"
	var_317_0.step[1].desc = language.get(490504, taskControl.bstask.att, taskControl.bstask.def)
	var_317_0.step[2] = {}
	var_317_0.step[2].type = 1
	var_317_0.step[2].pic = "xiaoqian"
	var_317_0.step[2].desc = language.get(490505, taskControl.bstask.att, taskControl.bstask.def, taskControl.bstask.att)
	var_317_0.open = "weichengBegin"

	return var_317_0
end

function roleDialogue.constant.dialogueFrame_1806()
	require("lua/layer/task/control")

	local var_318_0 = {}

	var_318_0.totalStep = 3
	var_318_0.step = {}
	var_318_0.step[1] = {}
	var_318_0.step[1].type = 1
	var_318_0.step[1].pic = "xiaoqian"
	var_318_0.step[1].desc = language.get(490506, taskControl.bstask.def)
	var_318_0.step[2] = {}
	var_318_0.step[2].type = 1
	var_318_0.step[2].pic = "xiaoqian"
	var_318_0.step[2].desc = language.get(490507, taskControl.bstask.def)
	var_318_0.step[3] = {}
	var_318_0.step[3].type = 1
	var_318_0.step[3].pic = "xiaoqian"
	var_318_0.step[3].desc = language.get(490508, taskControl.bstask.sup)

	return var_318_0
end

function roleDialogue.constant.dialogueFrame_1807()
	require("lua/layer/task/control")

	local var_319_0 = {}

	var_319_0.totalStep = 2
	var_319_0.step = {}
	var_319_0.step[1] = {}
	var_319_0.step[1].type = 1
	var_319_0.step[1].pic = "xiaoqian"
	var_319_0.step[1].desc = language.get(490509, taskControl.bstask.def)
	var_319_0.step[2] = {}
	var_319_0.step[2].type = 1
	var_319_0.step[2].pic = "xiaoqian"
	var_319_0.step[2].desc = language.get(490510, taskControl.bstask.def)

	return var_319_0
end

function roleDialogue.constant.dialogueFrame_1808()
	require("lua/layer/task/control")

	local var_320_0 = {}

	var_320_0.totalStep = 2
	var_320_0.step = {}
	var_320_0.step[1] = {}
	var_320_0.step[1].type = 1
	var_320_0.step[1].pic = "xiaoqian"
	var_320_0.step[1].desc = language.get(490511, taskControl.bstask.att, taskControl.bstask.att)
	var_320_0.step[2] = {}
	var_320_0.step[2].type = 1
	var_320_0.step[2].pic = "xiaoqian"
	var_320_0.step[2].desc = language.get(490512)

	return var_320_0
end

function roleDialogue.constant.dialogueFrame_1809()
	require("lua/layer/task/control")

	local var_321_0 = {}

	var_321_0.totalStep = 3
	var_321_0.step = {}
	var_321_0.step[1] = {}
	var_321_0.step[1].type = 1
	var_321_0.step[1].pic = "xiaoqian"
	var_321_0.step[1].desc = language.get(490513)
	var_321_0.step[2] = {}
	var_321_0.step[2].type = 1
	var_321_0.step[2].pic = "xiaoqian"
	var_321_0.step[2].desc = language.get(490514, taskControl.bstask.att)
	var_321_0.step[3] = {}
	var_321_0.step[3].type = 1
	var_321_0.step[3].pic = "xiaoqian"
	var_321_0.step[3].desc = language.get(490515)

	return var_321_0
end

function roleDialogue.constant.dialogueFrame_1810()
	require("lua/layer/task/control")

	local var_322_0 = {}

	var_322_0.totalStep = 2
	var_322_0.step = {}
	var_322_0.step[1] = {}
	var_322_0.step[1].type = 1
	var_322_0.step[1].pic = "xiaoqian"
	var_322_0.step[1].desc = language.get(490516, taskControl.bstask.def, taskControl.bstask.att, taskControl.bstask.def, taskControl.bstask.att)
	var_322_0.step[2] = {}
	var_322_0.step[2].type = 1
	var_322_0.step[2].pic = "xiaoqian"
	var_322_0.step[2].desc = language.get(490517, taskControl.bstask.att, taskControl.bstask.def)

	return var_322_0
end

function roleDialogue.constant.dialogueFrame_1811()
	require("lua/layer/task/control")

	local var_323_0 = {}

	var_323_0.totalStep = 2
	var_323_0.step = {}
	var_323_0.step[1] = {}
	var_323_0.step[1].type = 1
	var_323_0.step[1].pic = "xiaoqian"
	var_323_0.step[1].desc = language.get(490518, taskControl.bstask.att, taskControl.bstask.def)
	var_323_0.step[2] = {}
	var_323_0.step[2].type = 1
	var_323_0.step[2].pic = "xiaoqian"
	var_323_0.step[2].desc = language.get(490519, taskControl.bstask.att, taskControl.bstask.att)

	return var_323_0
end

function roleDialogue.constant.dialogueFrame_1812()
	require("lua/layer/task/control")

	local var_324_0 = {}

	var_324_0.totalStep = 3
	var_324_0.step = {}
	var_324_0.step[1] = {}
	var_324_0.step[1].type = 1
	var_324_0.step[1].pic = "xiaoqian"
	var_324_0.step[1].desc = language.get(490520, taskControl.bstask.def)
	var_324_0.step[2] = {}
	var_324_0.step[2].type = 1
	var_324_0.step[2].pic = "xiaoqian"
	var_324_0.step[2].desc = language.get(490521)
	var_324_0.step[3] = {}
	var_324_0.step[3].type = 1
	var_324_0.step[3].pic = "xiaoqian"
	var_324_0.step[3].desc = language.get(490522)

	return var_324_0
end

function roleDialogue.constant.dialogueFrame_1813()
	require("lua/layer/task/control")

	local var_325_0 = {}

	var_325_0.totalStep = 2
	var_325_0.step = {}
	var_325_0.step[1] = {}
	var_325_0.step[1].type = 1
	var_325_0.step[1].pic = "xiaoqian"
	var_325_0.step[1].desc = language.get(490523)
	var_325_0.step[2] = {}
	var_325_0.step[2].type = 1
	var_325_0.step[2].pic = "xiaoqian"
	var_325_0.step[2].desc = language.get(490524, taskControl.bstask.def)

	return var_325_0
end

function roleDialogue.constant.dialogueFrame_1814()
	require("lua/layer/task/control")

	local var_326_0 = {}

	var_326_0.totalStep = 2
	var_326_0.step = {}
	var_326_0.step[1] = {}
	var_326_0.step[1].type = 1
	var_326_0.step[1].pic = "xiaoqian"
	var_326_0.step[1].desc = language.get(490525, taskControl.bstask.att)
	var_326_0.step[2] = {}
	var_326_0.step[2].type = 1
	var_326_0.step[2].pic = "xiaoqian"
	var_326_0.step[2].desc = language.get(490526, taskControl.bstask.att, taskControl.bstask.sup, taskControl.bstask.att)

	return var_326_0
end

function roleDialogue.constant.dialogueFrame_1815()
	require("lua/layer/task/control")

	local var_327_0 = {}

	var_327_0.totalStep = 3
	var_327_0.step = {}
	var_327_0.step[1] = {}
	var_327_0.step[1].type = 1
	var_327_0.step[1].pic = "xiaoqian"
	var_327_0.step[1].desc = language.get(490527, taskControl.bstask.att)
	var_327_0.step[2] = {}
	var_327_0.step[2].type = 1
	var_327_0.step[2].pic = "xiaoqian"
	var_327_0.step[2].desc = language.get(490528)
	var_327_0.step[3] = {}
	var_327_0.step[3].type = 1
	var_327_0.step[3].pic = "xiaoqian"
	var_327_0.step[3].desc = language.get(490535)

	return var_327_0
end

function roleDialogue.constant.dialogueFrame_1816()
	require("lua/layer/task/control")

	local var_328_0 = {}

	var_328_0.totalStep = 3
	var_328_0.step = {}
	var_328_0.step[1] = {}
	var_328_0.step[1].type = 1
	var_328_0.step[1].pic = "xiaoqian"
	var_328_0.step[1].desc = language.get(490529, taskControl.bstask.def, taskControl.bstask.att)
	var_328_0.step[2] = {}
	var_328_0.step[2].type = 1
	var_328_0.step[2].pic = "xiaoqian"
	var_328_0.step[2].desc = language.get(490530, taskControl.bstask.att, taskControl.bstask.def)
	var_328_0.step[3] = {}
	var_328_0.step[3].type = 1
	var_328_0.step[3].pic = "xiaoqian"
	var_328_0.step[3].desc = language.get(490531, taskControl.bstask.att)

	return var_328_0
end

function roleDialogue.constant.dialogueFrame_1817()
	require("lua/layer/task/control")

	local var_329_0 = {}

	var_329_0.totalStep = 2
	var_329_0.step = {}
	var_329_0.step[1] = {}
	var_329_0.step[1].type = 1
	var_329_0.step[1].pic = "xiaoqian"
	var_329_0.step[1].desc = language.get(490532, taskControl.bstask.att, taskControl.bstask.def)
	var_329_0.step[2] = {}
	var_329_0.step[2].type = 1
	var_329_0.step[2].pic = "xiaoqian"
	var_329_0.step[2].desc = language.get(490533, taskControl.bstask.def, taskControl.bstask.att, taskControl.bstask.att)

	return var_329_0
end

function roleDialogue.constant.dialogueFrame_1818()
	local var_330_0 = {}

	var_330_0.totalStep = 1
	var_330_0.step = {}
	var_330_0.step[1] = {}
	var_330_0.step[1].type = 1
	var_330_0.step[1].pic = "xiaoqian"
	var_330_0.step[1].desc = language.get(490536)

	return var_330_0
end

function roleDialogue.constant.dialogueFrame_1819()
	local var_331_0 = {}

	var_331_0.totalStep = 1
	var_331_0.step = {}
	var_331_0.step[1] = {}
	var_331_0.step[1].type = 1
	var_331_0.step[1].pic = "xiaoqian"
	var_331_0.step[1].desc = language.get(490537)

	return var_331_0
end

function roleDialogue.constant.dialogueFrame_1830()
	require("lua/layer/world/control")

	local var_332_0 = {}

	var_332_0.totalStep = 2
	var_332_0.step = {}
	var_332_0.step[1] = {}
	var_332_0.step[1].type = 1
	var_332_0.step[1].pic = "xiaoqian"
	var_332_0.step[1].desc = language.get(470010, var_0_3(worldControl.league.first), var_0_3(worldControl.league.second))
	var_332_0.step[2] = {}
	var_332_0.step[2].type = 1
	var_332_0.step[2].pic = "xiaoqian"
	var_332_0.step[2].desc = language.get(470011)
	var_332_0.open = "showLeague"

	return var_332_0
end

function roleDialogue.constant.dialogueFrame_1831()
	require("lua/layer/world/control")

	local var_333_0 = {}

	var_333_0.totalStep = 2
	var_333_0.step = {}
	var_333_0.step[1] = {}
	var_333_0.step[1].type = 1
	var_333_0.step[1].pic = "xiaoqian"
	var_333_0.step[1].desc = language.get(470012, var_0_3(worldControl.league.third))
	var_333_0.step[2] = {}
	var_333_0.step[2].type = 1
	var_333_0.step[2].pic = "xiaoqian"

	if user.player.forceId == worldControl.league.first then
		var_333_0.step[2].desc = language.get(470013, var_0_3(worldControl.league.second), var_0_3(worldControl.league.second))
	else
		var_333_0.step[2].desc = language.get(470013, var_0_3(worldControl.league.first), var_0_3(worldControl.league.first))
	end

	var_333_0.open = "showLeague"

	return var_333_0
end

function roleDialogue.constant.dialogueFrame_1832()
	require("lua/layer/world/control")

	local var_334_0 = {}

	var_334_0.totalStep = 2
	var_334_0.step = {}
	var_334_0.step[1] = {}
	var_334_0.step[1].type = 1
	var_334_0.step[1].pic = "xiaoqian"
	var_334_0.step[1].desc = language.get(470014, var_0_3(worldControl.league.second), var_0_3(worldControl.league.third))
	var_334_0.step[2] = {}
	var_334_0.step[2].type = 1
	var_334_0.step[2].pic = "xiaoqian"
	var_334_0.step[2].desc = language.get(470015)
	var_334_0.open = "showLeague"

	return var_334_0
end

function roleDialogue.constant.dialogueFrame_1833()
	require("lua/layer/world/control")

	local var_335_0 = {}

	var_335_0.totalStep = 2
	var_335_0.step = {}
	var_335_0.step[1] = {}
	var_335_0.step[1].type = 1
	var_335_0.step[1].pic = "xiaoqian"
	var_335_0.step[1].desc = language.get(470016, var_0_3(worldControl.league.first))
	var_335_0.step[2] = {}
	var_335_0.step[2].type = 1
	var_335_0.step[2].pic = "xiaoqian"
	var_335_0.step[2].desc = language.get(470017, var_0_3(worldControl.league.second), var_0_3(worldControl.league.third), var_0_3(worldControl.league.first))
	var_335_0.open = "showLeague"

	return var_335_0
end

function roleDialogue.constant.dialogueFrame_1840()
	local var_336_0 = {}

	var_336_0.totalStep = 2
	var_336_0.step = {}
	var_336_0.step[1] = {}
	var_336_0.step[1].type = 1
	var_336_0.step[1].pic = "zhangjiao"
	var_336_0.step[1].desc = language.get(490220)
	var_336_0.step[2] = {}
	var_336_0.step[2].type = 2
	var_336_0.step[2].pic = "xiaoqian"
	var_336_0.step[2].desc = language.get(490221)

	return var_336_0
end

function roleDialogue.constant.dialogueFrame_1841()
	local var_337_0 = {}

	var_337_0.totalStep = 2
	var_337_0.step = {}
	var_337_0.step[1] = {}
	var_337_0.step[1].type = 1
	var_337_0.step[1].pic = "zhangjiao"
	var_337_0.step[1].desc = language.get(490224)
	var_337_0.step[2] = {}
	var_337_0.step[2].type = 2
	var_337_0.step[2].pic = "xiaoqian"
	var_337_0.step[2].desc = language.get(490225)

	return var_337_0
end

function roleDialogue.constant.dialogueFrame_1842()
	local var_338_0 = {}

	var_338_0.totalStep = 2
	var_338_0.step = {}
	var_338_0.step[1] = {}
	var_338_0.step[1].type = 1
	var_338_0.step[1].pic = "zhangjiao"
	var_338_0.step[1].desc = language.get(490222)
	var_338_0.step[2] = {}
	var_338_0.step[2].type = 2
	var_338_0.step[2].pic = "xiaoqian"
	var_338_0.step[2].desc = language.get(490226)

	return var_338_0
end

function roleDialogue.constant.dialogueFrame_1843()
	local var_339_0 = {}

	var_339_0.totalStep = 2
	var_339_0.step = {}
	var_339_0.step[1] = {}
	var_339_0.step[1].type = 1
	var_339_0.step[1].pic = "zhangjiao"
	var_339_0.step[1].desc = language.get(490222)
	var_339_0.step[2] = {}
	var_339_0.step[2].type = 2
	var_339_0.step[2].pic = "xiaoqian"
	var_339_0.step[2].desc = language.get(490223)

	return var_339_0
end

function roleDialogue.constant.dialogueFrame_1900()
	local var_340_0 = var_0_0()
	local var_340_1 = {}

	var_340_1.totalStep = 1
	var_340_1.step = {}
	var_340_1.step[1] = {}
	var_340_1.step[1].type = 1
	var_340_1.step[1].pic = var_340_0
	var_340_1.step[1].desc = language.get(92102)

	return var_340_1
end

function roleDialogue.constant.dialogueFrame_1901()
	local var_341_0 = var_0_0()
	local var_341_1 = {}

	var_341_1.totalStep = 1
	var_341_1.step = {}
	var_341_1.step[1] = {}
	var_341_1.step[1].type = 1
	var_341_1.step[1].pic = var_341_0
	var_341_1.step[1].desc = language.get(92103)

	return var_341_1
end

function roleDialogue.constant.dialogueFrame_1902()
	local var_342_0 = var_0_0()
	local var_342_1 = {}

	var_342_1.totalStep = 1
	var_342_1.step = {}
	var_342_1.step[1] = {}
	var_342_1.step[1].type = 1
	var_342_1.step[1].pic = var_342_0
	var_342_1.step[1].desc = language.get(92104)

	return var_342_1
end

function roleDialogue.constant.dialogueFrame_1903()
	local var_343_0 = var_0_0()
	local var_343_1 = {}

	var_343_1.totalStep = 1
	var_343_1.step = {}
	var_343_1.step[1] = {}
	var_343_1.step[1].type = 1
	var_343_1.step[1].pic = var_343_0
	var_343_1.step[1].desc = language.get(92105)

	return var_343_1
end

function roleDialogue.constant.dialogueFrame_1904()
	local var_344_0 = var_0_0()
	local var_344_1 = {}

	var_344_1.totalStep = 1
	var_344_1.step = {}
	var_344_1.step[1] = {}
	var_344_1.step[1].type = 1
	var_344_1.step[1].pic = var_344_0
	var_344_1.step[1].desc = language.get(92106)

	return var_344_1
end

function roleDialogue.constant.dialogueFrame_1905()
	local var_345_0 = var_0_0()
	local var_345_1 = {}

	var_345_1.totalStep = 1
	var_345_1.step = {}
	var_345_1.step[1] = {}
	var_345_1.step[1].type = 1
	var_345_1.step[1].pic = var_345_0
	var_345_1.step[1].desc = language.get(92107)

	return var_345_1
end

function roleDialogue.constant.dialogueFrame_1906()
	local var_346_0 = {}

	var_346_0.totalStep = 1
	var_346_0.step = {}
	var_346_0.step[1] = {}
	var_346_0.step[1].type = 1
	var_346_0.step[1].pic = "xiaoqian"
	var_346_0.step[1].desc = language.get(92100)

	return var_346_0
end

function roleDialogue.constant.dialogueFrame_1907()
	local var_347_0 = {}

	var_347_0.totalStep = 1
	var_347_0.step = {}
	var_347_0.step[1] = {}
	var_347_0.step[1].type = 1
	var_347_0.step[1].pic = "xiaoqian"
	var_347_0.step[1].desc = language.get(92101)

	return var_347_0
end

function roleDialogue.constant.dialogueFrame_1908()
	local var_348_0 = var_0_0()
	local var_348_1 = var_0_2()
	local var_348_2 = {}

	var_348_2.totalStep = 1
	var_348_2.step = {}
	var_348_2.step[1] = {}
	var_348_2.step[1].type = 1
	var_348_2.step[1].pic = var_348_0
	var_348_2.step[1].desc = language.get(135440, var_348_1)
	var_348_2.open = "showRenameDialog"

	return var_348_2
end

function roleDialogue.constant.dialogueFrame_1909()
	local var_349_0 = var_0_0()
	local var_349_1 = var_0_2()
	local var_349_2 = {}

	var_349_2.totalStep = 1
	var_349_2.step = {}
	var_349_2.step[1] = {}
	var_349_2.step[1].type = 1
	var_349_2.step[1].pic = var_349_0
	var_349_2.step[1].desc = language.get(135443, user.player.name, var_349_1)

	return var_349_2
end

function roleDialogue.constant.dialogueFrame_1910()
	local var_350_0 = var_0_2()
	local var_350_1 = {}

	var_350_1.totalStep = 1
	var_350_1.step = {}
	var_350_1.step[1] = {}
	var_350_1.step[1].type = 1
	var_350_1.step[1].pic = boss
	var_350_1.step[1].desc = language.get(135444, user.player.name, var_350_0)

	return var_350_1
end

function roleDialogue.constant.dialogueFrame_1911()
	local var_351_0 = {}

	var_351_0.totalStep = 1
	var_351_0.step = {}
	var_351_0.step[1] = {}
	var_351_0.step[1].type = 1
	var_351_0.step[1].pic = "xiaoqian"
	var_351_0.step[1].desc = language.get(91030)
	var_351_0.open = "showKingNotice"

	return var_351_0
end

function roleDialogue.constant.dialogueFrame_1912()
	local var_352_0 = {}

	var_352_0.totalStep = 2
	var_352_0.step = {}
	var_352_0.step[1] = {}
	var_352_0.step[1].type = 2
	var_352_0.step[1].pic = "lvbu"
	var_352_0.step[1].desc = language.get(220679)
	var_352_0.step[2] = {}
	var_352_0.step[2].type = 1
	var_352_0.step[2].pic = "xiaoqian"
	var_352_0.step[2].desc = language.get(220678)

	return var_352_0
end

function roleDialogue.constant.dialogueFrame_1913()
	local var_353_0 = {}

	var_353_0.totalStep = 2
	var_353_0.step = {}
	var_353_0.step[1] = {}
	var_353_0.step[1].type = 2
	var_353_0.step[1].pic = "houcheng"
	var_353_0.step[1].desc = language.get(220680)
	var_353_0.step[2] = {}
	var_353_0.step[2].type = 1
	var_353_0.step[2].pic = "xiaoqian"
	var_353_0.step[2].desc = language.get(220681)

	return var_353_0
end

function roleDialogue.constant.dialogueFrame_1914()
	local var_354_0 = {}

	var_354_0.totalStep = 1
	var_354_0.step = {}
	var_354_0.step[1] = {}
	var_354_0.step[1].type = 2
	var_354_0.step[1].pic = "songxian"
	var_354_0.step[1].desc = language.get(220682)

	return var_354_0
end

function roleDialogue.constant.dialogueFrame_1915()
	local var_355_0 = {}

	var_355_0.totalStep = 1
	var_355_0.step = {}
	var_355_0.step[1] = {}
	var_355_0.step[1].type = 2
	var_355_0.step[1].pic = "weixu"
	var_355_0.step[1].desc = language.get(220683)

	return var_355_0
end

function roleDialogue.constant.dialogueFrame_1916()
	local var_356_0 = {}

	var_356_0.totalStep = 2
	var_356_0.step = {}
	var_356_0.step[1] = {}
	var_356_0.step[1].type = 2
	var_356_0.step[1].pic = "chengong"
	var_356_0.step[1].desc = language.get(220684)
	var_356_0.step[2] = {}
	var_356_0.step[2].type = 2
	var_356_0.step[2].pic = "lvbu"
	var_356_0.step[2].desc = language.get(220685)

	return var_356_0
end

function roleDialogue.constant.dialogueFrame_1917()
	local var_357_0 = {}

	var_357_0.totalStep = 4
	var_357_0.step = {}
	var_357_0.step[1] = {}
	var_357_0.step[1].type = 2
	var_357_0.step[1].pic = "caocao"
	var_357_0.step[1].desc = language.get(220686)
	var_357_0.step[2] = {}
	var_357_0.step[2].type = 1
	var_357_0.step[2].pic = "xiaoqian"
	var_357_0.step[2].desc = language.get(220687)
	var_357_0.step[3] = {}
	var_357_0.step[3].type = 1
	var_357_0.step[3].pic = "xiaoqian"
	var_357_0.step[3].desc = language.get(220688)
	var_357_0.step[4] = {}
	var_357_0.step[4].type = 2
	var_357_0.step[4].pic = "lvbu"
	var_357_0.step[4].desc = language.get(220689)

	return var_357_0
end

function roleDialogue.constant.dialogueFrame_1918()
	local var_358_0 = {}

	var_358_0.totalStep = 1
	var_358_0.step = {}
	var_358_0.step[1] = {}
	var_358_0.step[1].type = 2
	var_358_0.step[1].pic = "lubanchuanren"
	var_358_0.step[1].desc = language.get(490901)
	var_358_0.open = "lubanxincheng"

	return var_358_0
end

function roleDialogue.constant.dialogueFrame_1919()
	local var_359_0 = {}

	var_359_0.totalStep = 1
	var_359_0.step = {}
	var_359_0.step[1] = {}
	var_359_0.step[1].type = 2
	var_359_0.step[1].pic = "lubanchuanren"
	var_359_0.step[1].desc = language.get(490905, language.get(102020))
	var_359_0.open = "lubanxincheng"

	return var_359_0
end

function roleDialogue.constant.dialogueFrame_1920()
	local var_360_0 = {}

	var_360_0.totalStep = 1
	var_360_0.step = {}
	var_360_0.step[1] = {}
	var_360_0.step[1].type = 2
	var_360_0.step[1].pic = "lubanchuanren"
	var_360_0.step[1].desc = language.get(490905, language.get(102021))
	var_360_0.open = "lubanxincheng"

	return var_360_0
end

function roleDialogue.constant.dialogueFrame_1921()
	local var_361_0 = {}

	var_361_0.totalStep = 1
	var_361_0.step = {}
	var_361_0.step[1] = {}
	var_361_0.step[1].type = 2
	var_361_0.step[1].pic = "lubanchuanren"
	var_361_0.step[1].desc = language.get(490905, language.get(102022))
	var_361_0.open = "lubanxincheng"

	return var_361_0
end

function roleDialogue.constant.dialogueFrame_1922()
	local var_362_0 = {}

	var_362_0.totalStep = 1
	var_362_0.step = {}
	var_362_0.step[1] = {}
	var_362_0.step[1].type = 2
	var_362_0.step[1].pic = "lubanchuanren"
	var_362_0.step[1].desc = language.get(490905, language.get(102023))
	var_362_0.open = "lubanxincheng"

	return var_362_0
end

function roleDialogue.constant.dialogueFrame_1923()
	local var_363_0 = {}

	var_363_0.totalStep = 1
	var_363_0.step = {}
	var_363_0.step[1] = {}
	var_363_0.step[1].type = 2
	var_363_0.step[1].pic = "lubanchuanren"
	var_363_0.step[1].desc = language.get(490905, language.get(102024))
	var_363_0.open = "lubanxincheng"

	return var_363_0
end

function roleDialogue.constant.dialogueFrame_1924()
	local var_364_0 = {}

	var_364_0.totalStep = 3
	var_364_0.step = {}
	var_364_0.step[1] = {}
	var_364_0.step[1].type = 2
	var_364_0.step[1].pic = "lubanchuanren"
	var_364_0.step[1].desc = language.get(490906)
	var_364_0.step[2] = {}
	var_364_0.step[2].type = 2
	var_364_0.step[2].pic = "lubanchuanren"
	var_364_0.step[2].desc = language.get(490907)
	var_364_0.step[3] = {}
	var_364_0.step[3].type = 2
	var_364_0.step[3].pic = "lubanchuanren"
	var_364_0.step[3].desc = language.get(490908)

	return var_364_0
end

function roleDialogue.constant.dialogueFrame_1925()
	local var_365_0 = {}

	var_365_0.totalStep = 3
	var_365_0.step = {}
	var_365_0.step[1] = {}
	var_365_0.step[1].type = 2
	var_365_0.step[1].pic = "lubanchuanren"
	var_365_0.step[1].desc = language.get(490919)
	var_365_0.step[2] = {}
	var_365_0.step[2].type = 2
	var_365_0.step[2].pic = "lubanchuanren"
	var_365_0.step[2].desc = language.get(490920)
	var_365_0.step[3] = {}
	var_365_0.step[3].type = 2
	var_365_0.step[3].pic = "lubanchuanren"
	var_365_0.step[3].desc = language.get(490921)
	var_365_0.open = "gotoWorld"

	return var_365_0
end

function roleDialogue.constant.dialogueFrame_1926()
	local var_366_0 = {}

	var_366_0.totalStep = 3
	var_366_0.step = {}
	var_366_0.step[1] = {}
	var_366_0.step[1].type = 2
	var_366_0.step[1].pic = "lubanchuanren"
	var_366_0.step[1].desc = language.get(490922)
	var_366_0.step[2] = {}
	var_366_0.step[2].type = 2
	var_366_0.step[2].pic = "lubanchuanren"
	var_366_0.step[2].desc = language.get(490923)
	var_366_0.step[3] = {}
	var_366_0.step[3].type = 2
	var_366_0.step[3].pic = "lubanchuanren"
	var_366_0.step[3].desc = language.get(490924)

	return var_366_0
end

function roleDialogue.constant.dialogueFrame_1927()
	local var_367_0 = {}

	var_367_0.totalStep = 2
	var_367_0.step = {}
	var_367_0.step[1] = {}
	var_367_0.step[1].type = 2
	var_367_0.step[1].pic = "lubanchuanren"
	var_367_0.step[1].desc = language.get(490927)
	var_367_0.step[2] = {}
	var_367_0.step[2].type = 2
	var_367_0.step[2].pic = "lubanchuanren"
	var_367_0.step[2].desc = language.get(490928)

	return var_367_0
end

function roleDialogue.constant.dialogueFrame_1928()
	local var_368_0 = {}

	var_368_0.totalStep = 2
	var_368_0.step = {}
	var_368_0.step[1] = {}
	var_368_0.step[1].type = 2
	var_368_0.step[1].pic = "lubanchuanren"
	var_368_0.step[1].desc = language.get(490925)
	var_368_0.step[2] = {}
	var_368_0.step[2].type = 2
	var_368_0.step[2].pic = "lubanchuanren"
	var_368_0.step[2].desc = language.get(490926)

	return var_368_0
end

function roleDialogue.constant.dialogueFrame_1929()
	local var_369_0 = {}

	var_369_0.totalStep = 4
	var_369_0.step = {}
	var_369_0.step[1] = {}
	var_369_0.step[1].type = 1
	var_369_0.step[1].pic = "xiaoqian"
	var_369_0.step[1].desc = language.get(490937)
	var_369_0.step[2] = {}
	var_369_0.step[2].type = 2
	var_369_0.step[2].pic = "player"
	var_369_0.step[2].desc = language.get(490938)
	var_369_0.step[3] = {}
	var_369_0.step[3].type = 1
	var_369_0.step[3].pic = "xiaoqian"
	var_369_0.step[3].desc = language.get(490939)
	var_369_0.step[4] = {}
	var_369_0.step[4].type = 1
	var_369_0.step[4].pic = "xiaoqian"
	var_369_0.step[4].desc = language.get(490940)
	var_369_0.open = "gotoTavern"

	return var_369_0
end

function roleDialogue.constant.dialogueFrame_1930()
	local var_370_0 = var_0_0()
	local var_370_1 = var_0_2()
	local var_370_2 = {}

	var_370_2.totalStep = 3
	var_370_2.step = {}
	var_370_2.step[1] = {}
	var_370_2.step[1].type = 2
	var_370_2.step[1].pic = "lubanchuanren"
	var_370_2.step[1].desc = language.get(490941)
	var_370_2.step[2] = {}
	var_370_2.step[2].type = 1
	var_370_2.step[2].pic = var_370_0
	var_370_2.step[2].desc = language.get(490942, var_370_1)
	var_370_2.step[3] = {}
	var_370_2.step[3].type = 1
	var_370_2.step[3].pic = var_370_0
	var_370_2.step[3].desc = language.get(490943)
	var_370_2.open = "gotoDinner"

	return var_370_2
end

function roleDialogue.constant.dialogueFrame_1931()
	local var_371_0 = {}

	var_371_0.totalStep = 1
	var_371_0.step = {}
	var_371_0.step[1] = {}
	var_371_0.step[1].type = 1
	var_371_0.step[1].pic = "xiaoqian"
	var_371_0.step[1].desc = language.get(491001)

	return var_371_0
end

function roleDialogue.constant.dialogueFrame_1932()
	local var_372_0 = {}

	var_372_0.totalStep = 2
	var_372_0.step = {}
	var_372_0.step[1] = {}
	var_372_0.step[1].type = 1
	var_372_0.step[1].pic = "xiaoqian"
	var_372_0.step[1].desc = language.get(491002)
	var_372_0.step[2] = {}
	var_372_0.step[2].type = 1
	var_372_0.step[2].pic = "xiaoqian"
	var_372_0.step[2].desc = language.get(491003)

	return var_372_0
end

function roleDialogue.constant.dialogueFrame_1940()
	local var_373_0 = {}

	var_373_0.totalStep = 1
	var_373_0.step = {}
	var_373_0.step[1] = {}
	var_373_0.step[1].type = 1
	var_373_0.step[1].pic = "xiaoqian"
	var_373_0.step[1].desc = language.get("122120_silk_dialogue_qym")

	return var_373_0
end

function roleDialogue.constant.dialogueFrame_1941()
	local var_374_0 = {}

	var_374_0.totalStep = 1
	var_374_0.step = {}
	var_374_0.step[1] = {}
	var_374_0.step[1].type = 1
	var_374_0.step[1].pic = "xiaoqian"
	var_374_0.step[1].desc = language.get("122121_silk_dialogue_qym")

	return var_374_0
end

function roleDialogue.constant.dialogueFrame_1942()
	local var_375_0 = {}

	var_375_0.totalStep = 1
	var_375_0.step = {}
	var_375_0.step[1] = {}
	var_375_0.step[1].type = 1
	var_375_0.step[1].pic = "xiaoqian"
	var_375_0.step[1].desc = language.get("122122_silk_dialogue_qym")

	return var_375_0
end

function roleDialogue.constant.dialogueFrame_1943()
	local var_376_0 = {}

	var_376_0.totalStep = 1
	var_376_0.step = {}
	var_376_0.step[1] = {}
	var_376_0.step[1].type = 1
	var_376_0.step[1].pic = "xiaoqian"
	var_376_0.step[1].desc = language.get("122123_silk_dialogue_qym")

	return var_376_0
end

function roleDialogue.constant.dialogueFrame_1950()
	local var_377_0 = {}

	var_377_0.totalStep = 3
	var_377_0.step = {}
	var_377_0.step[1] = {}
	var_377_0.step[1].type = 1
	var_377_0.step[1].pic = "xiaoqian"
	var_377_0.step[1].desc = language.get("220710_qixie")
	var_377_0.step[2] = {}
	var_377_0.step[2].type = 1
	var_377_0.step[2].pic = "xiaoqian"
	var_377_0.step[2].desc = language.get("220711_qixie")
	var_377_0.step[3] = {}
	var_377_0.step[3].type = 1
	var_377_0.step[3].pic = "xiaoqian"
	var_377_0.step[3].desc = language.get("220712_qixie")
	var_377_0.open = "toushicheDialogue"

	return var_377_0
end

function roleDialogue.constant.dialogueFrame_1951()
	local var_378_0 = {}

	var_378_0.totalStep = 1
	var_378_0.step = {}
	var_378_0.step[1] = {}
	var_378_0.step[1].type = 2
	var_378_0.step[1].pic = "liuye"
	var_378_0.step[1].desc = language.get("220713_qixie")

	return var_378_0
end

function roleDialogue.constant.dialogueFrame_1960()
	local var_379_0 = {}

	var_379_0.totalStep = 2
	var_379_0.step = {}
	var_379_0.step[1] = {}
	var_379_0.step[1].type = 1
	var_379_0.step[1].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_379_0.step[1].desc = language.get("220810_silkBack")
	var_379_0.step[2] = {}
	var_379_0.step[2].type = 1
	var_379_0.step[2].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_379_0.step[2].desc = language.get("220811_silkBack")
	var_379_0.open = "openGeneralSilkPanel"

	return var_379_0
end

function roleDialogue.constant.dialogueFrame_1961()
	local var_380_0 = {}

	var_380_0.totalStep = 2
	var_380_0.step = {}
	var_380_0.step[1] = {}
	var_380_0.step[1].type = 1
	var_380_0.step[1].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_380_0.step[1].desc = language.get("220812_silkBack")
	var_380_0.step[2] = {}
	var_380_0.step[2].type = 1
	var_380_0.step[2].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_380_0.step[2].desc = language.get("220813_silkBack")

	return var_380_0
end

function roleDialogue.constant.dialogueFrame_1962()
	local var_381_0 = {}

	var_381_0.totalStep = 2
	var_381_0.step = {}
	var_381_0.step[1] = {}
	var_381_0.step[1].type = 1
	var_381_0.step[1].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_381_0.step[1].desc = language.get("220816_silkBack")
	var_381_0.step[2] = {}
	var_381_0.step[2].type = 1
	var_381_0.step[2].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_381_0.step[2].desc = language.get("220817_silkBack", user.evokeReward.belongGeneralName or "xiaoqian")

	return var_381_0
end

function roleDialogue.constant.dialogueFrame_1963()
	local var_382_0 = {}

	var_382_0.totalStep = 2
	var_382_0.step = {}
	var_382_0.step[1] = {}
	var_382_0.step[1].type = 1
	var_382_0.step[1].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_382_0.step[1].desc = language.get("220816_silkBack")
	var_382_0.step[2] = {}
	var_382_0.step[2].type = 1
	var_382_0.step[2].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_382_0.step[2].desc = language.get("220818_silkBack")

	return var_382_0
end

function roleDialogue.constant.dialogueFrame_1964()
	local var_383_0 = {}

	var_383_0.totalStep = 1
	var_383_0.step = {}
	var_383_0.step[1] = {}
	var_383_0.step[1].type = 1
	var_383_0.step[1].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_383_0.step[1].desc = language.get("220814_silkBack", user.evokeReward.belongGeneralName or "xiaoqian")

	return var_383_0
end

function roleDialogue.constant.dialogueFrame_1965()
	local var_384_0 = {}

	var_384_0.totalStep = 1
	var_384_0.step = {}
	var_384_0.step[1] = {}
	var_384_0.step[1].type = 1
	var_384_0.step[1].pic = user.evokeReward.evokeGeneralPic or "xiaoqian"
	var_384_0.step[1].desc = language.get("220815_silkBack")

	return var_384_0
end

function roleDialogue.constant.dialogueFrame_1970()
	local var_385_0 = {}

	var_385_0.totalStep = 3
	var_385_0.step = {}
	var_385_0.step[1] = {}
	var_385_0.step[1].type = 1
	var_385_0.step[1].pic = "xiaoqian"
	var_385_0.step[1].desc = language.get("220902_buildNation")
	var_385_0.step[2] = {}
	var_385_0.step[2].type = 1
	var_385_0.step[2].pic = "xiaoqian"
	var_385_0.step[2].desc = language.get("220903_buildNation")
	var_385_0.step[3] = {}
	var_385_0.step[3].type = 1
	var_385_0.step[3].pic = "xiaoqian"
	var_385_0.step[3].desc = language.get("220904_buildNation")

	return var_385_0
end

function roleDialogue.constant.dialogueFrame_1971()
	local var_386_0 = {}

	var_386_0.totalStep = 3
	var_386_0.step = {}
	var_386_0.step[1] = {}
	var_386_0.step[1].type = 1
	var_386_0.step[1].pic = "xiaoqian"
	var_386_0.step[1].desc = language.get("220905_buildNation")
	var_386_0.step[2] = {}
	var_386_0.step[2].type = 1
	var_386_0.step[2].pic = "xiaoqian"
	var_386_0.step[2].desc = language.get("220906_buildNation")
	var_386_0.step[3] = {}
	var_386_0.step[3].type = 1
	var_386_0.step[3].pic = "xiaoqian"
	var_386_0.step[3].desc = language.get("220907_buildNation")

	return var_386_0
end

function roleDialogue.constant.dialogueFrame_1972()
	local var_387_0 = {}

	var_387_0.totalStep = 2
	var_387_0.step = {}
	var_387_0.step[1] = {}
	var_387_0.step[1].type = 1
	var_387_0.step[1].pic = "xiaoqian"
	var_387_0.step[1].desc = language.get("220908_buildNation")
	var_387_0.step[2] = {}
	var_387_0.step[2].type = 1
	var_387_0.step[2].pic = "xiaoqian"
	var_387_0.step[2].desc = language.get("220909_buildNation")

	return var_387_0
end

function roleDialogue.constant.dialogueFrame_1973()
	local var_388_0 = {}

	var_388_0.totalStep = 1
	var_388_0.step = {}
	var_388_0.step[1] = {}
	var_388_0.step[1].type = 1
	var_388_0.step[1].pic = "xiaoqian"
	var_388_0.step[1].desc = language.get("220910_buildNation")

	return var_388_0
end

function roleDialogue.constant.dialogueFrame_1974()
	local var_389_0 = {}

	var_389_0.totalStep = 1
	var_389_0.step = {}
	var_389_0.step[1] = {}
	var_389_0.step[1].type = 1
	var_389_0.step[1].pic = "xiaoqian"
	var_389_0.step[1].desc = language.get("220911_buildNation")

	return var_389_0
end

function roleDialogue.constant.dialogueFrame_1975()
	local var_390_0 = {}

	var_390_0.totalStep = 1
	var_390_0.step = {}
	var_390_0.step[1] = {}
	var_390_0.step[1].type = 1
	var_390_0.step[1].pic = "xiaoqian"
	var_390_0.step[1].desc = language.get("220912_buildNation")

	return var_390_0
end

function roleDialogue.constant.dialogueFrame_1976()
	local var_391_0 = {}

	var_391_0.totalStep = 2
	var_391_0.step = {}
	var_391_0.step[1] = {}
	var_391_0.step[1].type = 1
	var_391_0.step[1].pic = "xiaoqian"
	var_391_0.step[1].desc = language.get("220914_buildNation")
	var_391_0.step[2] = {}
	var_391_0.step[2].type = 1
	var_391_0.step[2].pic = "xiaoqian"
	var_391_0.step[2].desc = language.get("220915_buildNation")

	return var_391_0
end

function roleDialogue.constant.dialogueFrame_1977()
	local var_392_0 = {}

	var_392_0.totalStep = 2
	var_392_0.step = {}
	var_392_0.step[1] = {}
	var_392_0.step[1].type = 1
	var_392_0.step[1].pic = "xiaoqian"
	var_392_0.step[1].desc = language.get("220922_buildNation")
	var_392_0.step[2] = {}
	var_392_0.step[2].type = 1
	var_392_0.step[2].pic = "xiaoqian"
	var_392_0.step[2].desc = language.get("220923_buildNation")

	return var_392_0
end

function roleDialogue.constant.dialogueFrame_1978()
	local var_393_0 = {}

	var_393_0.totalStep = 1
	var_393_0.step = {}
	var_393_0.step[1] = {}
	var_393_0.step[1].type = 1
	var_393_0.step[1].pic = "xiaoqian"
	var_393_0.step[1].desc = language.get("220916_buildNation")

	return var_393_0
end

function roleDialogue.constant.dialogueFrame_1979()
	local var_394_0 = {}

	var_394_0.totalStep = 6
	var_394_0.step = {}
	var_394_0.step[1] = {}
	var_394_0.step[1].type = 1
	var_394_0.step[1].pic = "xiaoqian"
	var_394_0.step[1].desc = language.get("220918_buildNation")
	var_394_0.step[2] = {}
	var_394_0.step[2].type = 1
	var_394_0.step[2].pic = "xiaoqian"
	var_394_0.step[2].desc = language.get("220924_buildNation")
	var_394_0.step[3] = {}
	var_394_0.step[3].type = 1
	var_394_0.step[3].pic = "xiaoqian"
	var_394_0.step[3].desc = language.get("220925_buildNation")
	var_394_0.step[4] = {}
	var_394_0.step[4].type = 1
	var_394_0.step[4].pic = "xiaoqian"
	var_394_0.step[4].desc = language.get("220926_buildNation")
	var_394_0.step[5] = {}
	var_394_0.step[5].type = 1
	var_394_0.step[5].pic = "xiaoqian"
	var_394_0.step[5].desc = language.get("221002_buildNation")
	var_394_0.step[6] = {}
	var_394_0.step[6].type = 1
	var_394_0.step[6].pic = "xiaoqian"
	var_394_0.step[6].desc = language.get("221003_buildNation")

	return var_394_0
end

function roleDialogue.constant.dialogueFrame_1980()
	local var_395_0 = {}

	var_395_0.totalStep = 2
	var_395_0.step = {}
	var_395_0.step[1] = {}
	var_395_0.step[1].type = 1
	var_395_0.step[1].pic = "xiaoqian"
	var_395_0.step[1].desc = language.get("220927_buildNation")
	var_395_0.step[2] = {}
	var_395_0.step[2].type = 1
	var_395_0.step[2].pic = "xiaoqian"
	var_395_0.step[2].desc = language.get("220928_buildNation")

	return var_395_0
end

function roleDialogue.constant.dialogueFrame_1981()
	local var_396_0 = {}

	var_396_0.totalStep = 1
	var_396_0.step = {}
	var_396_0.step[1] = {}
	var_396_0.step[1].type = 1
	var_396_0.step[1].pic = "xiaoqian"
	var_396_0.step[1].desc = language.get("220929_buildNation")

	return var_396_0
end

function roleDialogue.constant.dialogueFrame_1982()
	local var_397_0 = {}

	var_397_0.totalStep = 2
	var_397_0.step = {}
	var_397_0.step[1] = {}
	var_397_0.step[1].type = 1
	var_397_0.step[1].pic = "xiaoqian"
	var_397_0.step[1].desc = language.get("220932_buildNation", user.changedName)
	var_397_0.step[2] = {}
	var_397_0.step[2].type = 1
	var_397_0.step[2].pic = "xiaoqian"
	var_397_0.step[2].desc = language.get("220933_buildNation")

	return var_397_0
end

function roleDialogue.constant.dialogueFrame_1983()
	local var_398_0 = {}

	var_398_0.totalStep = 1
	var_398_0.step = {}
	var_398_0.step[1] = {}
	var_398_0.step[1].type = 1
	var_398_0.step[1].pic = "xiaoqian"
	var_398_0.step[1].desc = language.get("220934_buildNation")

	return var_398_0
end

function roleDialogue.constant.dialogueFrame_1984()
	local var_399_0 = {}

	var_399_0.totalStep = 1
	var_399_0.step = {}
	var_399_0.step[1] = {}
	var_399_0.step[1].type = 1
	var_399_0.step[1].pic = "xiaoqian"
	var_399_0.step[1].desc = language.get("220935_buildNation")

	return var_399_0
end

function roleDialogue.constant.dialogueFrame_1985()
	local var_400_0 = {}

	var_400_0.totalStep = 1
	var_400_0.step = {}
	var_400_0.step[1] = {}
	var_400_0.step[1].type = 1
	var_400_0.step[1].pic = "xiaoqian"
	var_400_0.step[1].desc = language.get("220991_buildNation")

	return var_400_0
end

function roleDialogue.constant.dialogueFrame_1986()
	local var_401_0 = {}

	var_401_0.totalStep = 1
	var_401_0.step = {}
	var_401_0.step[1] = {}
	var_401_0.step[1].type = 1
	var_401_0.step[1].pic = "xiaoqian"
	var_401_0.step[1].desc = language.get("220992_buildNation")

	return var_401_0
end

function roleDialogue.constant.dialogueFrame_1987()
	local var_402_0 = {}

	var_402_0.totalStep = 1
	var_402_0.step = {}
	var_402_0.step[1] = {}
	var_402_0.step[1].type = 1
	var_402_0.step[1].pic = "xiaoqian"
	var_402_0.step[1].desc = language.get("220993_buildNation")

	return var_402_0
end

function roleDialogue.constant.dialogueFrame_1988()
	local var_403_0 = {}

	var_403_0.totalStep = 1
	var_403_0.step = {}
	var_403_0.step[1] = {}
	var_403_0.step[1].type = 1
	var_403_0.step[1].pic = "xiaoqian"
	var_403_0.step[1].desc = language.get("220994_buildNation")

	return var_403_0
end

function roleDialogue.constant.dialogueFrame_1989()
	local var_404_0 = {}

	var_404_0.totalStep = 1
	var_404_0.step = {}
	var_404_0.step[1] = {}
	var_404_0.step[1].type = 1
	var_404_0.step[1].pic = "xiaoqian"
	var_404_0.step[1].desc = language.get("220932_buildNation", user.changedName)

	return var_404_0
end

function roleDialogue.constant.dialogueFrame_1990()
	local var_405_0 = {}

	var_405_0.totalStep = 2
	var_405_0.step = {}
	var_405_0.step[1] = {}
	var_405_0.step[1].type = 1
	var_405_0.step[1].pic = "xiaoqian"
	var_405_0.step[1].desc = language.get("220930_buildNation")
	var_405_0.step[2] = {}
	var_405_0.step[2].type = 1
	var_405_0.step[2].pic = "xiaoqian"
	var_405_0.step[2].desc = language.get("220931_buildNation")
	var_405_0.open = "changeName"

	return var_405_0
end

function roleDialogue.constant.dialogueFrame_1991()
	local var_406_0 = {}

	var_406_0.totalStep = 6
	var_406_0.step = {}
	var_406_0.step[1] = {}
	var_406_0.step[1].type = 1
	var_406_0.step[1].pic = "xiaoqian"
	var_406_0.step[1].desc = language.get("221005_buildNation")
	var_406_0.step[2] = {}
	var_406_0.step[2].type = 2
	var_406_0.step[2].pic = "player"
	var_406_0.step[2].desc = language.get("221006_buildNation")
	var_406_0.step[3] = {}
	var_406_0.step[3].type = 2
	var_406_0.step[3].pic = "player"
	var_406_0.step[3].desc = language.get("221007_buildNation")
	var_406_0.step[4] = {}
	var_406_0.step[4].type = 1
	var_406_0.step[4].pic = "xiaoqian"
	var_406_0.step[4].desc = language.get("221008_buildNation")
	var_406_0.step[5] = {}
	var_406_0.step[5].type = 1
	var_406_0.step[5].pic = "xiaoqian"
	var_406_0.step[5].desc = language.get("221009_buildNation")
	var_406_0.step[6] = {}
	var_406_0.step[6].type = 1
	var_406_0.step[6].pic = "xiaoqian"
	var_406_0.step[6].desc = language.get("221010_buildNation")
	var_406_0.open = "gotoCity"

	return var_406_0
end

function roleDialogue.constant.dialogueFrame_2000()
	local var_407_0 = {}

	var_407_0.totalStep = 3
	var_407_0.step = {}
	var_407_0.step[1] = {}
	var_407_0.step[1].type = 1
	var_407_0.step[1].pic = "xiaoqian"
	var_407_0.step[1].desc = language.get(220700)
	var_407_0.step[2] = {}
	var_407_0.step[2].type = 2
	var_407_0.step[2].pic = "diaochan"
	var_407_0.step[2].desc = language.get(220701)
	var_407_0.step[3] = {}
	var_407_0.step[3].type = 1
	var_407_0.step[3].pic = "xiaoqian"
	var_407_0.step[3].desc = language.get(220702)

	return var_407_0
end

function roleDialogue.constant.dialogueFrame_2001()
	local var_408_0 = {}

	var_408_0.totalStep = 3
	var_408_0.step = {}
	var_408_0.step[1] = {}
	var_408_0.step[1].type = 2
	var_408_0.step[1].pic = "xvzhu"
	var_408_0.step[1].desc = language.get(220704)
	var_408_0.step[2] = {}
	var_408_0.step[2].type = 1
	var_408_0.step[2].pic = "xiaoqian"
	var_408_0.step[2].desc = language.get(220705)
	var_408_0.step[3] = {}
	var_408_0.step[3].type = 2
	var_408_0.step[3].pic = "dianwei"
	var_408_0.step[3].desc = language.get(220706)

	return var_408_0
end

function roleDialogue.constant.dialogueFrame_2002()
	local var_409_0 = {}

	var_409_0.totalStep = 3
	var_409_0.step = {}
	var_409_0.step[1] = {}
	var_409_0.step[1].type = 2
	var_409_0.step[1].pic = "dianwei"
	var_409_0.step[1].desc = language.get(220707)
	var_409_0.step[2] = {}
	var_409_0.step[2].type = 1
	var_409_0.step[2].pic = "xiaoqian"
	var_409_0.step[2].desc = language.get(220708)
	var_409_0.step[3] = {}
	var_409_0.step[3].type = 2
	var_409_0.step[3].pic = "dianwei"
	var_409_0.step[3].desc = language.get(220709)

	return var_409_0
end

function roleDialogue.constant.dialogueFrame_2003()
	local var_410_0 = {}

	var_410_0.totalStep = 1
	var_410_0.step = {}
	var_410_0.step[1] = {}
	var_410_0.step[1].type = 2
	var_410_0.step[1].pic = "guanyu"
	var_410_0.step[1].desc = language.get(220710)

	return var_410_0
end

function roleDialogue.constant.dialogueFrame_2004()
	local var_411_0 = {}

	var_411_0.totalStep = 5
	var_411_0.step = {}
	var_411_0.step[1] = {}
	var_411_0.step[1].type = 2
	var_411_0.step[1].pic = "caocao"
	var_411_0.step[1].desc = language.get(220711)
	var_411_0.step[2] = {}
	var_411_0.step[2].type = 1
	var_411_0.step[2].pic = "diaochan"
	var_411_0.step[2].desc = language.get(220712)
	var_411_0.step[3] = {}
	var_411_0.step[3].type = 2
	var_411_0.step[3].pic = "weixu"
	var_411_0.step[3].desc = language.get(220713)
	var_411_0.step[4] = {}
	var_411_0.step[4].type = 1
	var_411_0.step[4].pic = "xiaoqian"
	var_411_0.step[4].desc = language.get(220714)
	var_411_0.step[5] = {}
	var_411_0.step[5].type = 2
	var_411_0.step[5].pic = "diaochan"
	var_411_0.step[5].desc = language.get(220715)

	return var_411_0
end

function roleDialogue.constant.dialogueFrame_2005()
	local var_412_0 = {}

	var_412_0.totalStep = 5
	var_412_0.step = {}
	var_412_0.step[1] = {}
	var_412_0.step[1].type = 1
	var_412_0.step[1].pic = "player"
	var_412_0.step[1].desc = language.get(220716, user.player.name)
	var_412_0.step[2] = {}
	var_412_0.step[2].type = 2
	var_412_0.step[2].pic = "diaochan"
	var_412_0.step[2].desc = language.get(220717)
	var_412_0.step[3] = {}
	var_412_0.step[3].type = 1
	var_412_0.step[3].pic = "player"
	var_412_0.step[3].desc = language.get(220718)
	var_412_0.step[4] = {}
	var_412_0.step[4].type = 2
	var_412_0.step[4].pic = "diaochan"
	var_412_0.step[4].desc = language.get(220719)
	var_412_0.step[5] = {}
	var_412_0.step[5].type = 1
	var_412_0.step[5].pic = "xiaoqian"
	var_412_0.step[5].desc = language.get(220720)

	return var_412_0
end

function roleDialogue.constant.dialogueFrame_2010()
	local var_413_0 = {}

	var_413_0.totalStep = 1
	var_413_0.step = {}
	var_413_0.step[1] = {}
	var_413_0.step[1].type = 1
	var_413_0.step[1].pic = "xiaoqian"
	var_413_0.step[1].desc = language.get("222018_buildingTech")
	var_413_0.open = "openBuildingTech"

	return var_413_0
end

function roleDialogue.constant.dialogueFrame_2011()
	local var_414_0 = {}

	var_414_0.totalStep = 4
	var_414_0.step = {}
	var_414_0.step[1] = {}
	var_414_0.step[1].type = 1
	var_414_0.step[1].pic = "xiaoqian"
	var_414_0.step[1].desc = language.get("222039_buildingTech")
	var_414_0.step[2] = {}
	var_414_0.step[2].type = 1
	var_414_0.step[2].pic = "xiaoqian"
	var_414_0.step[2].desc = language.get("222040_buildingTech")
	var_414_0.step[3] = {}
	var_414_0.step[3].type = 1
	var_414_0.step[3].pic = "xiaoqian"
	var_414_0.step[3].desc = language.get("222041_buildingTech")
	var_414_0.step[4] = {}
	var_414_0.step[4].type = 1
	var_414_0.step[4].pic = "xiaoqian"
	var_414_0.step[4].desc = language.get("222042_buildingTech")
	var_414_0.open = "learnFirstSkill"

	return var_414_0
end

function roleDialogue.constant.dialogueFrame_2020()
	local var_415_0 = {}

	var_415_0.totalStep = 1
	var_415_0.step = {}
	var_415_0.step[1] = {}
	var_415_0.step[1].type = 1
	var_415_0.step[1].pic = "xiaoqian"
	var_415_0.step[1].desc = language.get("221041_buildNation")
	var_415_0.step[2] = {}
	var_415_0.step[2].type = 1
	var_415_0.step[2].pic = "xiaoqian"
	var_415_0.step[2].desc = language.get("221042_buildNation")
	var_415_0.step[3] = {}
	var_415_0.step[3].type = 1
	var_415_0.step[3].pic = "xiaoqian"
	var_415_0.step[3].desc = language.get("221043_buildNation")

	return var_415_0
end

function roleDialogue.constant.dialogueFrame_2021()
	local var_416_0 = {}

	var_416_0.totalStep = 1
	var_416_0.step = {}
	var_416_0.step[1] = {}
	var_416_0.step[1].type = 1
	var_416_0.step[1].pic = "xiaoqian"
	var_416_0.step[1].desc = language.get("221044_buildNation")

	return var_416_0
end

function roleDialogue.constant.dialogueFrame_2022()
	local var_417_0 = {}

	var_417_0.totalStep = 1
	var_417_0.step = {}
	var_417_0.step[1] = {}
	var_417_0.step[1].type = 1
	var_417_0.step[1].pic = "xiaoqian"
	var_417_0.step[1].desc = language.get("221045_buildNation")

	return var_417_0
end

function roleDialogue.constant.dialogueFrame_2023()
	local var_418_0 = {}

	var_418_0.totalStep = 1
	var_418_0.step = {}
	var_418_0.step[1] = {}
	var_418_0.step[1].type = 1
	var_418_0.step[1].pic = "xiaoqian"
	var_418_0.step[1].desc = language.get("221061_buildNation")

	return var_418_0
end

function roleDialogue.constant.dialogueFrame_2024()
	local var_419_0 = {}

	var_419_0.totalStep = 4
	var_419_0.step = {}
	var_419_0.step[1] = {}
	var_419_0.step[1].type = 1
	var_419_0.step[1].pic = "xiaoqian"
	var_419_0.step[1].desc = language.get("220918_buildNation")
	var_419_0.step[2] = {}
	var_419_0.step[2].type = 1
	var_419_0.step[2].pic = "xiaoqian"
	var_419_0.step[2].desc = language.get("220919_buildNation")
	var_419_0.step[3] = {}
	var_419_0.step[3].type = 1
	var_419_0.step[3].pic = "xiaoqian"
	var_419_0.step[3].desc = language.get("220920_buildNation")
	var_419_0.step[4] = {}
	var_419_0.step[4].type = 1
	var_419_0.step[4].pic = "xiaoqian"
	var_419_0.step[4].desc = language.get("220921_buildNation")

	return var_419_0
end

function roleDialogue.constant.dialogueFrame_2025()
	local var_420_0 = {}

	var_420_0.totalStep = 2
	var_420_0.step = {}
	var_420_0.step[1] = {}
	var_420_0.step[1].type = 1
	var_420_0.step[1].pic = "xiaoqian"
	var_420_0.step[1].desc = language.get("221071_buildNation")
	var_420_0.step[2] = {}
	var_420_0.step[2].type = 1
	var_420_0.step[2].pic = "xiaoqian"
	var_420_0.step[2].desc = language.get("221072_buildNation")

	return var_420_0
end

function roleDialogue.constant.dialogueFrame_2026()
	local var_421_0 = {}

	var_421_0.totalStep = 1
	var_421_0.step = {}
	var_421_0.step[1] = {}
	var_421_0.step[1].type = 1
	var_421_0.step[1].pic = "xiaoqian"
	var_421_0.step[1].desc = language.get("221078_buildNation")

	return var_421_0
end

function roleDialogue.constant.dialogueFrame_2027()
	local var_422_0 = {}

	var_422_0.totalStep = 1
	var_422_0.step = {}
	var_422_0.step[1] = {}
	var_422_0.step[1].type = 1
	var_422_0.step[1].pic = "xiaoqian"
	var_422_0.step[1].desc = language.get("221079_buildNation")

	return var_422_0
end

function roleDialogue.constant.dialogueFrame_2028()
	local var_423_0 = {}

	var_423_0.totalStep = 3
	var_423_0.step = {}
	var_423_0.step[1] = {}
	var_423_0.step[1].type = 1
	var_423_0.step[1].pic = "xiaoqian"
	var_423_0.step[1].desc = language.get("221075_buildNation")
	var_423_0.step[2] = {}
	var_423_0.step[2].type = 1
	var_423_0.step[2].pic = "xiaoqian"
	var_423_0.step[2].desc = language.get("221076_buildNation")
	var_423_0.step[3] = {}
	var_423_0.step[3].type = 1
	var_423_0.step[3].pic = "xiaoqian"
	var_423_0.step[3].desc = language.get("221077_buildNation")

	return var_423_0
end

function roleDialogue.constant.dialogueFrame_2029()
	local var_424_0 = {}

	var_424_0.totalStep = 1
	var_424_0.step = {}
	var_424_0.step[1] = {}
	var_424_0.step[1].type = 1
	var_424_0.step[1].pic = "xiaoqian"
	var_424_0.step[1].desc = language.get("221080_buildNation")

	return var_424_0
end

function roleDialogue.constant.dialogueFrame_2040()
	local var_425_0 = {}

	var_425_0.totalStep = 1
	var_425_0.step = {}
	var_425_0.step[1] = {}
	var_425_0.step[1].type = 1
	var_425_0.step[1].pic = user.phantomGeneral or "xiaoqian"

	if user.phantomAddFeat and user.phantomAddFeat > 0 then
		var_425_0.step[1].desc = language.get("222202_junqinghuibao", user.phantomOccupyNum or 0, user.phantomKillNum or 0, user.phantomAddFeat)
	else
		var_425_0.step[1].desc = language.get("222201_junqinghuibao", user.phantomOccupyNum or 0, user.phantomKillNum or 0)
	end

	return var_425_0
end

function roleDialogue.constant.dialogueFrame_2100()
	local var_426_0 = {}

	var_426_0.totalStep = 1
	var_426_0.step = {}
	var_426_0.step[1] = {}
	var_426_0.step[1].type = 1
	var_426_0.step[1].pic = "caocao2"
	var_426_0.step[1].desc = language.get("222466_dongying", user.caocaoCityName or "")

	return var_426_0
end

function roleDialogue.constant.dialogueFrame_2101()
	local var_427_0 = {}

	var_427_0.totalStep = 1
	var_427_0.step = {}
	var_427_0.step[1] = {}
	var_427_0.step[1].type = 1
	var_427_0.step[1].pic = "suworulu"
	var_427_0.step[1].desc = language.get("222444_dongying")

	return var_427_0
end

function roleDialogue.constant.dialogueFrame_2102()
	local var_428_0 = {}

	var_428_0.totalStep = 1
	var_428_0.step = {}
	var_428_0.step[1] = {}
	var_428_0.step[1].type = 1
	var_428_0.step[1].pic = "xuzuozhinan"
	var_428_0.step[1].desc = language.get("222445_dongying")

	return var_428_0
end

function roleDialogue.constant.dialogueFrame_2103()
	local var_429_0 = {}

	var_429_0.totalStep = 1
	var_429_0.step = {}
	var_429_0.step[1] = {}
	var_429_0.step[1].type = 1
	var_429_0.step[1].pic = "beimihu"
	var_429_0.step[1].desc = language.get("222447_dongying")

	return var_429_0
end

function roleDialogue.constant.dialogueFrame_2104()
	local var_430_0 = {}

	var_430_0.totalStep = 1
	var_430_0.step = {}
	var_430_0.step[1] = {}
	var_430_0.step[1].type = 1
	var_430_0.step[1].pic = "jushimalv"
	var_430_0.step[1].desc = language.get("222446_dongying")

	return var_430_0
end

function roleDialogue.constant.dialogueFrame_2105()
	local var_431_0 = {}

	var_431_0.totalStep = 1
	var_431_0.step = {}
	var_431_0.step[1] = {}
	var_431_0.step[1].type = 1
	var_431_0.step[1].pic = "caocao2"
	var_431_0.step[1].desc = language.get("222459_dongying")
	var_431_0.open = "kfyz_dongying1"

	return var_431_0
end

function roleDialogue.constant.dialogueFrame_2106()
	local var_432_0 = {}

	var_432_0.totalStep = 1
	var_432_0.step = {}
	var_432_0.step[1] = {}
	var_432_0.step[1].type = 1
	var_432_0.step[1].pic = "caocao2"
	var_432_0.step[1].desc = language.get("222461_dongying")
	var_432_0.open = "kfyz_dongying2"

	return var_432_0
end

function roleDialogue.constant.dialogueFrame_2107()
	local var_433_0 = {}

	var_433_0.totalStep = 1
	var_433_0.step = {}
	var_433_0.step[1] = {}
	var_433_0.step[1].type = 1
	var_433_0.step[1].pic = "caocao2"
	var_433_0.step[1].desc = language.get("222462_dongying")
	var_433_0.open = "kfyz_dongying3"

	return var_433_0
end

function roleDialogue.constant.dialogueFrame_2108()
	local var_434_0 = {}

	var_434_0.totalStep = 1
	var_434_0.step = {}
	var_434_0.step[1] = {}
	var_434_0.step[1].type = 1
	var_434_0.step[1].pic = "caocao2"
	var_434_0.step[1].desc = language.get("222463_dongying")
	var_434_0.open = "kfyz_dongying4"

	return var_434_0
end

function roleDialogue.constant.dialogueFrame_2109()
	local var_435_0 = {}

	var_435_0.totalStep = 1
	var_435_0.step = {}
	var_435_0.step[1] = {}
	var_435_0.step[1].type = 1
	var_435_0.step[1].pic = "caocao2"
	var_435_0.step[1].desc = language.get("222464_dongying")
	var_435_0.open = "kfyz_dongying5"

	return var_435_0
end

function roleDialogue.constant.dialogueFrame_2110()
	local var_436_0 = {}

	var_436_0.totalStep = 1
	var_436_0.step = {}
	var_436_0.step[1] = {}
	var_436_0.step[1].type = 1
	var_436_0.step[1].pic = "caocao2"
	var_436_0.step[1].desc = language.get("222465_dongying")
	var_436_0.open = "kfyz_dongying6"

	return var_436_0
end

function roleDialogue.constant.dialogueFrame_2111()
	local var_437_0 = {}

	var_437_0.totalStep = 2
	var_437_0.step = {}
	var_437_0.step[1] = {}
	var_437_0.step[1].type = 1
	var_437_0.step[1].pic = "caocao2"
	var_437_0.step[1].desc = language.get("222500_dongying")
	var_437_0.step[2] = {}
	var_437_0.step[2].type = 1
	var_437_0.step[2].pic = "caocao2"
	var_437_0.step[2].desc = language.get("222501_dongying")

	return var_437_0
end

function roleDialogue.constant.dialogueFrame_2112()
	local var_438_0 = {}

	var_438_0.totalStep = 1
	var_438_0.step = {}
	var_438_0.step[1] = {}
	var_438_0.step[1].type = 1
	var_438_0.step[1].pic = "caocao2"
	var_438_0.step[1].desc = language.get("222502_dongying")

	return var_438_0
end

function roleDialogue.constant.dialogueFrame_2113()
	local var_439_0 = {}

	var_439_0.totalStep = 1
	var_439_0.step = {}
	var_439_0.step[1] = {}
	var_439_0.step[1].type = 1
	var_439_0.step[1].pic = "caocao2"
	var_439_0.step[1].desc = language.get("222503_dongying")

	return var_439_0
end

function roleDialogue.constant.dialogueFrame_2114()
	local var_440_0 = {}

	var_440_0.totalStep = 1
	var_440_0.step = {}
	var_440_0.step[1] = {}
	var_440_0.step[1].type = 1
	var_440_0.step[1].pic = "caocao2"
	var_440_0.step[1].desc = language.get("222504_dongying")

	return var_440_0
end

function roleDialogue.constant.dialogueFrame_2120()
	local var_441_0 = {}

	var_441_0.totalStep = 3
	var_441_0.step = {}
	var_441_0.step[1] = {}
	var_441_0.step[1].type = 1
	var_441_0.step[1].pic = "player"
	var_441_0.step[1].desc = language.get(220761)
	var_441_0.step[2] = {}
	var_441_0.step[2].type = 2
	var_441_0.step[2].pic = "caocao2"
	var_441_0.step[2].desc = language.get(220762)
	var_441_0.step[3] = {}
	var_441_0.step[3].type = 1
	var_441_0.step[3].pic = "xiaoqian"
	var_441_0.step[3].desc = language.get(220763)

	return var_441_0
end

function roleDialogue.constant.dialogueFrame_2130()
	local var_442_0 = {}

	var_442_0.totalStep = 2
	var_442_0.step = {}
	var_442_0.step[1] = {}
	var_442_0.step[1].type = 1
	var_442_0.step[1].pic = "zhangjiao"
	var_442_0.step[1].desc = language.get("223001_huangjin")
	var_442_0.step[2] = {}
	var_442_0.step[2].type = 2
	var_442_0.step[2].pic = "xiaoqian"
	var_442_0.step[2].desc = language.get("223002_huangjin")

	return var_442_0
end

function roleDialogue.constant.dialogueFrame_2140()
	local var_443_0 = {}

	var_443_0.totalStep = 3
	var_443_0.step = {}
	var_443_0.step[1] = {}
	var_443_0.step[1].type = 1
	var_443_0.step[1].pic = "player"
	var_443_0.step[1].desc = language.get(220764)
	var_443_0.step[2] = {}
	var_443_0.step[2].type = 2
	var_443_0.step[2].pic = "caocao2"
	var_443_0.step[2].desc = language.get(220765)
	var_443_0.step[3] = {}
	var_443_0.step[3].type = 2
	var_443_0.step[3].pic = "caocao2"
	var_443_0.step[3].desc = language.get(220766)

	return var_443_0
end

function roleDialogue.constant.dialogueFrame_2150()
	local var_444_0 = {}

	var_444_0.totalStep = 1
	var_444_0.step = {}
	var_444_0.step[1] = {}
	var_444_0.step[1].type = 1
	var_444_0.step[1].pic = "xiaoqian"
	var_444_0.step[1].desc = language.get("223202_zgljx")

	return var_444_0
end

function roleDialogue.constant.dialogueFrame_2160()
	local var_445_0 = {}

	var_445_0.totalStep = 1
	var_445_0.step = {}
	var_445_0.step[1] = {}
	var_445_0.step[1].type = 1
	var_445_0.step[1].pic = "zhugeliang"
	var_445_0.step[1].desc = language.get("223203_zgljx")

	return var_445_0
end

function roleDialogue.constant.dialogueFrame_2170()
	local var_446_0 = {}

	var_446_0.totalStep = 2
	var_446_0.step = {}
	var_446_0.step[1] = {}
	var_446_0.step[1].type = 1
	var_446_0.step[1].pic = "xiaoqian"
	var_446_0.step[1].desc = language.get("223204_zgljx", 8000)
	var_446_0.step[2] = {}
	var_446_0.step[2].type = 1
	var_446_0.step[2].pic = "xiaoqian"
	var_446_0.step[2].desc = language.get("223204_zgljx", 8000)

	return var_446_0
end

function roleDialogue.constant.dialogueFrame_2180()
	local var_447_0 = {}

	var_447_0.totalStep = 1
	var_447_0.step = {}
	var_447_0.step[1] = {}
	var_447_0.step[1].type = 1
	var_447_0.step[1].pic = "luomu"
	var_447_0.step[1].desc = language.get("223300_luomu")

	return var_447_0
end

function roleDialogue.constant.dialogueFrame_2190()
	local var_448_0 = {}

	var_448_0.totalStep = 1
	var_448_0.step = {}
	var_448_0.step[1] = {}
	var_448_0.step[1].type = 1
	var_448_0.step[1].pic = "luomu"
	var_448_0.step[1].desc = language.get("223301_luomu")
	var_448_0.step[2] = {}
	var_448_0.step[2].type = 1
	var_448_0.step[2].pic = "luomu"
	var_448_0.step[2].desc = language.get("223314_luomu")

	return var_448_0
end

function roleDialogue.constant.dialogueFrame_2200()
	local var_449_0 = {}

	var_449_0.totalStep = 1
	var_449_0.step = {}
	var_449_0.step[1] = {}
	var_449_0.step[1].type = 1
	var_449_0.step[1].pic = "luomu"
	var_449_0.step[1].desc = language.get("223302_luomu")

	return var_449_0
end

function roleDialogue.constant.dialogueFrame_2210()
	local var_450_0 = {}

	var_450_0.totalStep = 1
	var_450_0.step = {}
	var_450_0.step[1] = {}
	var_450_0.step[1].type = 1
	var_450_0.step[1].pic = "luomu"
	var_450_0.step[1].desc = language.get("223303_luomu")

	return var_450_0
end

function roleDialogue.constant.dialogueFrame_2220()
	local var_451_0 = {}

	var_451_0.totalStep = 2
	var_451_0.step = {}
	var_451_0.step[1] = {}
	var_451_0.step[1].type = 1
	var_451_0.step[1].pic = "luomu"
	var_451_0.step[1].desc = language.get("223304_luomu")
	var_451_0.step[2] = {}
	var_451_0.step[2].type = 1
	var_451_0.step[2].pic = "luomu"
	var_451_0.step[2].desc = language.get("223305_luomu")

	return var_451_0
end

function roleDialogue.constant.dialogueFrame_2230()
	local var_452_0 = {}

	var_452_0.totalStep = 2
	var_452_0.step = {}
	var_452_0.step[1] = {}
	var_452_0.step[1].type = 1
	var_452_0.step[1].pic = "luomu"
	var_452_0.step[1].desc = language.get("223306_luomu")
	var_452_0.step[2] = {}
	var_452_0.step[2].type = 1
	var_452_0.step[2].pic = "luomu"
	var_452_0.step[2].desc = language.get("223313_luomu")

	return var_452_0
end

function roleDialogue.constant.dialogueFrame_2240()
	local var_453_0 = {}

	var_453_0.totalStep = 1
	var_453_0.step = {}
	var_453_0.step[1] = {}
	var_453_0.step[1].type = 1
	var_453_0.step[1].pic = "xiaoqian"
	var_453_0.step[1].desc = language.get("223401_zhenbao")

	return var_453_0
end

function roleDialogue.constant.dialogueFrame_2250()
	local var_454_0 = {}

	var_454_0.totalStep = 1
	var_454_0.step = {}
	var_454_0.step[1] = {}
	var_454_0.step[1].type = 1
	var_454_0.step[1].pic = "zhougong"
	var_454_0.step[1].desc = language.get("223500_zhougong")

	return var_454_0
end

function roleDialogue.constant.dialogueFrame_2260()
	local var_455_0 = {}

	var_455_0.totalStep = 1
	var_455_0.step = {}
	var_455_0.step[1] = {}
	var_455_0.step[1].type = 1
	var_455_0.step[1].pic = "zhougong"
	var_455_0.step[1].desc = language.get("223501_zhougong")

	return var_455_0
end

function roleDialogue.constant.dialogueFrame_2270()
	local var_456_0 = {}

	var_456_0.totalStep = 4
	var_456_0.step = {}
	var_456_0.step[1] = {}
	var_456_0.step[1].type = 1
	var_456_0.step[1].pic = "zhougong"
	var_456_0.step[1].desc = language.get("223502_zhougong")
	var_456_0.step[2] = {}
	var_456_0.step[2].type = 1
	var_456_0.step[2].pic = "zhougong"
	var_456_0.step[2].desc = language.get("223503_zhougong")
	var_456_0.step[3] = {}
	var_456_0.step[3].type = 1
	var_456_0.step[3].pic = "zhougong"
	var_456_0.step[3].desc = language.get("223504_zhougong")
	var_456_0.step[4] = {}
	var_456_0.step[4].type = 1
	var_456_0.step[4].pic = "zhougong"
	var_456_0.step[4].desc = language.get("223505_zhougong")

	return var_456_0
end

function roleDialogue.constant.dialogueFrame_2280()
	local var_457_0 = {}

	var_457_0.totalStep = 1
	var_457_0.step = {}
	var_457_0.step[1] = {}
	var_457_0.step[1].type = 1
	var_457_0.step[1].pic = "zhougong"
	var_457_0.step[1].desc = language.get("223506_zhougong")

	return var_457_0
end

function roleDialogue.constant.dialogueFrame_2290()
	local var_458_0 = {}

	var_458_0.totalStep = 1
	var_458_0.step = {}
	var_458_0.step[1] = {}
	var_458_0.step[1].type = 1
	var_458_0.step[1].pic = "xiaoqian"
	var_458_0.step[1].desc = language.get("223700_jungong")

	return var_458_0
end

function roleDialogue.constant.dialogueFrame_2300()
	local var_459_0 = {}

	var_459_0.totalStep = 1
	var_459_0.step = {}
	var_459_0.step[1] = {}
	var_459_0.step[1].type = 1
	var_459_0.step[1].pic = "xiaoqian"
	var_459_0.step[1].desc = language.get("223802_jungong")

	return var_459_0
end

function roleDialogue.constant.dialogueFrame_2310()
	local var_460_0 = user.player.lcxxReward.rewards
	local var_460_1 = user.player.lcxxReward.rewardsYday
	local var_460_2 = 0
	local var_460_3 = 0
	local var_460_4 = false

	if var_460_0[1] then
		var_460_2 = var_460_0[1].num
	end

	if var_460_1 and var_460_1[1] then
		var_460_3 = var_460_1[1].num
		var_460_4 = true
	end

	local var_460_5 = {}

	var_460_5.totalStep = 1
	var_460_5.step = {}
	var_460_5.step[1] = {}
	var_460_5.step[1].type = 1
	var_460_5.step[1].pic = "xiaoqian"

	if var_460_4 then
		var_460_5.step[1].desc = language.get("223804_jungong", tool.getFormatNum(var_460_3), tool.getFormatNum(var_460_2))
	else
		var_460_5.step[1].desc = language.get("223801_jungong", tool.getFormatNum(var_460_2))
	end

	return var_460_5
end

function roleDialogue.constant.dialogueFrame_2320()
	local var_461_0 = user.player.lcxxReward.rewards
	local var_461_1 = user.player.lcxxReward.rewardsYday
	local var_461_2 = false
	local var_461_3 = 0
	local var_461_4 = 0
	local var_461_5 = 0
	local var_461_6 = 0

	for iter_461_0 = 1, #var_461_0 do
		if var_461_0[iter_461_0].type == 21 then
			var_461_3 = var_461_0[iter_461_0].num
		else
			var_461_4 = var_461_0[iter_461_0].num
		end
	end

	if var_461_1 then
		for iter_461_1 = 1, #var_461_1 do
			if var_461_1[iter_461_1].type == 21 then
				var_461_5 = var_461_1[iter_461_1].num
			else
				var_461_6 = var_461_1[iter_461_1].num
			end
		end

		var_461_2 = true
	end

	local var_461_7 = {}

	var_461_7.totalStep = 1
	var_461_7.step = {}
	var_461_7.step[1] = {}
	var_461_7.step[1].type = 1
	var_461_7.step[1].pic = "xiaoqian"

	if var_461_2 then
		var_461_7.step[1].desc = language.get("223803_jungong", var_461_5, tool.getFormatNum(var_461_6), var_461_3, tool.getFormatNum(var_461_4))
	else
		var_461_7.step[1].desc = language.get("223800_jungong", var_461_3, tool.getFormatNum(var_461_4))
	end

	return var_461_7
end

function roleDialogue.constant.dialogueFrame_2330()
	local var_462_0 = {}

	var_462_0.totalStep = 1
	var_462_0.step = {}
	var_462_0.step[1] = {}
	var_462_0.step[1].type = 1
	var_462_0.step[1].pic = "xiaoqian"
	var_462_0.step[1].desc = language.get("223402_zhenbao")

	return var_462_0
end

function roleDialogue.constant.dialogueFrame_2340()
	local var_463_0 = {}

	var_463_0.totalStep = 3
	var_463_0.step = {}
	var_463_0.step[1] = {}
	var_463_0.step[1].type = 1
	var_463_0.step[1].pic = "xiaoqian"
	var_463_0.step[1].desc = language.get("224001_hufu")
	var_463_0.step[2] = {}
	var_463_0.step[2].type = 1
	var_463_0.step[2].pic = "xiaoqian"
	var_463_0.step[2].desc = language.get("224003_hufu")
	var_463_0.step[3] = {}
	var_463_0.step[3].type = 1
	var_463_0.step[3].pic = "xiaoqian"
	var_463_0.step[3].desc = language.get("224005_hufu")

	return var_463_0
end

function roleDialogue.constant.dialogueFrame_2350()
	local var_464_0 = {}

	var_464_0.totalStep = 3
	var_464_0.step = {}
	var_464_0.step[1] = {}
	var_464_0.step[1].type = 1
	var_464_0.step[1].pic = "xiaoqian"
	var_464_0.step[1].desc = language.get("224002_hufu")
	var_464_0.step[2] = {}
	var_464_0.step[2].type = 1
	var_464_0.step[2].pic = "xiaoqian"
	var_464_0.step[2].desc = language.get("224004_hufu")
	var_464_0.step[3] = {}
	var_464_0.step[3].type = 1
	var_464_0.step[3].pic = "xiaoqian"
	var_464_0.step[3].desc = language.get("224006_hufu")

	return var_464_0
end

function roleDialogue.constant.dialogueFrame_2360()
	local var_465_0 = {}

	var_465_0.totalStep = 1
	var_465_0.step = {}
	var_465_0.step[1] = {}
	var_465_0.step[1].type = 1
	var_465_0.step[1].pic = "xiaoqian"
	var_465_0.step[1].desc = language.get("224320_jiaotaozhuang", user.player.jiaoshiNum or 0)

	return var_465_0
end

function roleDialogue.constant.dialogueFrame_2370()
	local var_466_0 = {}

	var_466_0.totalStep = 2
	var_466_0.step = {}
	var_466_0.step[1] = {}
	var_466_0.step[1].type = 1
	var_466_0.step[1].pic = "ouyezi2"
	var_466_0.step[1].desc = language.get("224302_jiaotaozhuang")
	var_466_0.step[2] = {}
	var_466_0.step[2].type = 2
	var_466_0.step[2].pic = "player"
	var_466_0.step[2].desc = language.get("224303_jiaotaozhuang")
	var_466_0.open = "openShenjiang"

	return var_466_0
end

function roleDialogue.constant.dialogueFrame_2380()
	local var_467_0 = {}

	var_467_0.totalStep = 1
	var_467_0.step = {}
	var_467_0.step[1] = {}
	var_467_0.step[1].type = 1
	var_467_0.step[1].pic = "xiaoqian"
	var_467_0.step[1].desc = language.get("223403_zhenbao")

	return var_467_0
end

function roleDialogue.constant.dialogueFrame_2381()
	local var_468_0 = {}

	var_468_0.totalStep = 1
	var_468_0.step = {}
	var_468_0.step[1] = {}
	var_468_0.step[1].type = 1
	var_468_0.step[1].pic = "xiaoqian"
	var_468_0.step[1].desc = language.get("223404_zhenbao")

	return var_468_0
end

function roleDialogue.constant.dialogueFrame_2390()
	local var_469_0 = {}

	var_469_0.totalStep = 1
	var_469_0.step = {}
	var_469_0.step[1] = {}
	var_469_0.step[1].type = 1
	var_469_0.step[1].pic = "majun"
	var_469_0.step[1].desc = language.get("224401_majun")

	return var_469_0
end

function roleDialogue.constant.dialogueFrame_2400()
	local var_470_0 = {}

	var_470_0.totalStep = 2
	var_470_0.step = {}
	var_470_0.step[1] = {}
	var_470_0.step[1].type = 1
	var_470_0.step[1].pic = "majun"
	var_470_0.step[1].desc = language.get("224402_majun")
	var_470_0.step[2] = {}
	var_470_0.step[2].type = 1
	var_470_0.step[2].pic = "majun"
	var_470_0.step[2].desc = language.get("224407_majun")

	return var_470_0
end

function roleDialogue.constant.dialogueFrame_2410()
	local var_471_0 = {}

	var_471_0.totalStep = 1
	var_471_0.step = {}
	var_471_0.step[1] = {}
	var_471_0.step[1].type = 1
	var_471_0.step[1].pic = "majun"
	var_471_0.step[1].desc = language.get("224403_majun")

	return var_471_0
end

function roleDialogue.constant.dialogueFrame_2420()
	local var_472_0 = {}

	var_472_0.totalStep = 2
	var_472_0.step = {}
	var_472_0.step[1] = {}
	var_472_0.step[1].type = 1
	var_472_0.step[1].pic = "majun"
	var_472_0.step[1].desc = language.get("224404_majun")
	var_472_0.step[2] = {}
	var_472_0.step[2].type = 1
	var_472_0.step[2].pic = "majun"
	var_472_0.step[2].desc = language.get("224405_majun")

	return var_472_0
end

function roleDialogue.constant.dialogueFrame_2430()
	local var_473_0 = {}

	var_473_0.totalStep = 1
	var_473_0.step = {}
	var_473_0.step[1] = {}
	var_473_0.step[1].type = 1
	var_473_0.step[1].pic = "majun"
	var_473_0.step[1].desc = language.get("224406_majun")

	return var_473_0
end

function roleDialogue.constant.dialogueFrame_2440()
	local var_474_0 = {}

	var_474_0.totalStep = 2
	var_474_0.step = {}
	var_474_0.step[1] = {}
	var_474_0.step[1].type = 1
	var_474_0.step[1].pic = "xiaoqian"
	var_474_0.step[1].desc = language.get(226010, user.player.feudPrivilegeNeedNum)
	var_474_0.step[2] = {}
	var_474_0.step[2].type = 1
	var_474_0.step[2].pic = "xiaoqian"
	var_474_0.step[2].desc = language.get(226011, user.player.feudPrivilegeLv)

	return var_474_0
end

function roleDialogue.constant.dialogueFrame_2441()
	local var_475_0 = {}

	var_475_0.totalStep = 1
	var_475_0.step = {}
	var_475_0.step[1] = {}
	var_475_0.step[1].type = 1
	var_475_0.step[1].pic = "zhenganning"
	var_475_0.step[1].desc = language.get("223203_zgljx")

	return var_475_0
end

function roleDialogue.constant.dialogueFrame_2501()
	local var_476_0 = {}

	var_476_0.totalStep = 2
	var_476_0.step = {}
	var_476_0.step[1] = {}
	var_476_0.step[1].type = 1
	var_476_0.step[1].pic = "manzu"
	var_476_0.step[1].desc = language.get(226202, user.forceIdToName[user.player.headhunterVO.againstForce])
	var_476_0.step[2] = {}
	var_476_0.step[2].type = 1
	var_476_0.step[2].pic = var_0_4()
	var_476_0.step[2].desc = language.get(226203, user.forceIdToName[user.player.headhunterVO.supportForceId + 100], user.forceIdToName[user.player.headhunterVO.againstForce])
	var_476_0.open = "moveToCity"
	var_476_0.cityId = user.player.headhunterVO.cityId

	return var_476_0
end

function roleDialogue.constant.dialogueFrame_2502()
	local var_477_0 = {}

	var_477_0.totalStep = 1
	var_477_0.step = {}
	var_477_0.step[1] = {}
	var_477_0.step[1].type = 1
	var_477_0.step[1].pic = "manzu"
	var_477_0.step[1].desc = language.get(226205, user.forceIdToName[user.player.headhunterVO.againstForce])
	var_477_0.open = "moveToCity"
	var_477_0.cityId = user.player.headhunterVO.cityId

	return var_477_0
end

function roleDialogue.constant.dialogueFrame_2503()
	local var_478_0 = {}

	var_478_0.totalStep = 1
	var_478_0.step = {}
	var_478_0.step[1] = {}
	var_478_0.step[1].type = 1
	var_478_0.step[1].pic = "manzu"
	var_478_0.step[1].desc = language.get(226204, user.forceIdToName[user.player.headhunterVO.againstForce], user.forceIdToName[user.player.headhunterVO.supportForceId])
	var_478_0.open = "moveToCity"
	var_478_0.cityId = user.player.headhunterVO.cityId

	return var_478_0
end

function roleDialogue.constant.dialogueFrame_2504()
	local var_479_0 = {}

	var_479_0.totalStep = 1
	var_479_0.step = {}
	var_479_0.step[1] = {}
	var_479_0.step[1].type = 1
	var_479_0.step[1].pic = "manzu"
	var_479_0.step[1].desc = language.get(226206, user.forceIdToName[user.player.headhunterVO.supportForceId])
	var_479_0.open = "moveToCity"
	var_479_0.cityId = user.player.headhunterVO.cityId

	return var_479_0
end

function roleDialogue.constant.dialogueFrame_2505()
	local var_480_0 = {}

	var_480_0.totalStep = 1
	var_480_0.step = {}
	var_480_0.step[1] = {}
	var_480_0.step[1].type = 1
	var_480_0.step[1].pic = "manzu"
	var_480_0.step[1].desc = language.get(226207, user.forceIdToName[user.player.headhunterVO.againstForce], user.forceIdToName[user.player.headhunterVO.supportForceId])
	var_480_0.open = "moveToCity"
	var_480_0.cityId = user.player.headhunterVO.cityId

	return var_480_0
end

function roleDialogue.constant.dialogueFrame_2506()
	local var_481_0 = {}

	var_481_0.totalStep = 1
	var_481_0.step = {}
	var_481_0.step[1] = {}
	var_481_0.step[1].type = 1
	var_481_0.step[1].pic = "manzu"
	var_481_0.step[1].desc = language.get(226214)

	return var_481_0
end

function roleDialogue.constant.dialogueFrame_2507()
	local var_482_0 = {}

	var_482_0.totalStep = 1
	var_482_0.step = {}
	var_482_0.step[1] = {}
	var_482_0.step[1].type = 1
	var_482_0.step[1].pic = "manzu"
	var_482_0.step[1].desc = language.get(226215)

	return var_482_0
end

function roleDialogue.constant.dialogueFrame_2508()
	local var_483_0 = {}

	var_483_0.totalStep = 1
	var_483_0.step = {}
	var_483_0.step[1] = {}
	var_483_0.step[1].type = 1
	var_483_0.step[1].pic = "xiaoqian"
	var_483_0.step[1].desc = language.get(213408)

	return var_483_0
end

function roleDialogue.constant.dialogueFrame_kfyn1001()
	local var_484_0 = {}

	var_484_0.totalStep = 1
	var_484_0.step = {}
	var_484_0.step[1] = {}
	var_484_0.step[1].type = 1
	var_484_0.step[1].pic = "xiaoqian"
	var_484_0.step[1].desc = language.get("yuenan1001")
	var_484_0.open = "moveToCity"
	var_484_0.cityId = 6001

	return var_484_0
end

function roleDialogue.constant.dialogueFrame_kfyn1002()
	local var_485_0 = {}

	var_485_0.totalStep = 1
	var_485_0.step = {}
	var_485_0.step[1] = {}
	var_485_0.step[1].type = 1
	var_485_0.step[1].pic = "xiaoqian"
	var_485_0.step[1].desc = language.get("yuenan1002")
	var_485_0.open = "moveToCity"
	var_485_0.cityId = 6046

	return var_485_0
end

function roleDialogue.constant.dialogueFrame_kfyn1003()
	local var_486_0 = {}

	var_486_0.totalStep = 1
	var_486_0.step = {}
	var_486_0.step[1] = {}
	var_486_0.step[1].type = 1
	var_486_0.step[1].pic = "xiaoqian"
	var_486_0.step[1].desc = language.get("yuenan1002")

	return var_486_0
end

function roleDialogue.constant.dialogueFrame_kfyn1004()
	local var_487_0 = {}

	var_487_0.totalStep = 1
	var_487_0.step = {}
	var_487_0.step[1] = {}
	var_487_0.step[1].type = 1
	var_487_0.step[1].pic = "xiaoqian"
	var_487_0.step[1].desc = language.get("yuenan1004")

	return var_487_0
end

function roleDialogue.constant.dialogueFrame_kfyn1005()
	local var_488_0 = {}

	var_488_0.totalStep = 1
	var_488_0.step = {}
	var_488_0.step[1] = {}
	var_488_0.step[1].type = 1
	var_488_0.step[1].pic = "xiaoqian"
	var_488_0.step[1].desc = language.get("yuenan1005")

	return var_488_0
end

function roleDialogue.constant.dialogueFrame_worldBuildFive()
	local var_489_0 = {}

	var_489_0.totalStep = 6
	var_489_0.step = {}
	var_489_0.step[1] = {}
	var_489_0.step[1].type = 1
	var_489_0.step[1].pic = "xiaoqian"
	var_489_0.step[1].desc = language.get(136598)
	var_489_0.step[2] = {}
	var_489_0.step[2].type = 1
	var_489_0.step[2].pic = "xiaoqian"
	var_489_0.step[2].desc = language.get(136599)
	var_489_0.step[3] = {}
	var_489_0.step[3].type = 1
	var_489_0.step[3].pic = "xiaoqian"
	var_489_0.step[3].desc = language.get(136600)
	var_489_0.step[4] = {}
	var_489_0.step[4].type = 1
	var_489_0.step[4].pic = "xiaoqian"
	var_489_0.step[4].desc = language.get(136600)
	var_489_0.step[5] = {}
	var_489_0.step[5].type = 1
	var_489_0.step[5].pic = "xiaoqian"
	var_489_0.step[5].desc = language.get(136601)
	var_489_0.step[6] = {}
	var_489_0.step[6].type = 1
	var_489_0.step[6].pic = "xiaoqian"
	var_489_0.step[6].desc = language.get(136602)

	return var_489_0
end

function roleDialogue.constant.dialogueFrame_kfbfsl1001()
	local var_490_0 = {}

	var_490_0.totalStep = 2
	var_490_0.step = {}
	var_490_0.step[1] = {}
	var_490_0.step[1].type = 1
	var_490_0.step[1].pic = "xiaoqian"
	var_490_0.step[1].desc = language.get("kfbfsl1000")
	var_490_0.step[2].type = 1
	var_490_0.step[2].pic = "xiaoqian"
	var_490_0.step[2].desc = language.get("kfbfsl1001")
	var_490_0.open = "moveToCity"
	var_490_0.cityId = 188

	return var_490_0
end

function roleDialogue.constant.dialogueFrame_kfbfsl1002()
	local var_491_0 = {}

	var_491_0.totalStep = 2
	var_491_0.step = {}
	var_491_0.step[1] = {}
	var_491_0.step[1].type = 1
	var_491_0.step[1].pic = "xiaoqian"
	var_491_0.step[1].desc = language.get("kfbfsl1004")
	var_491_0.step[2].type = 1
	var_491_0.step[2].pic = "xiaoqian"
	var_491_0.step[2].desc = language.get("kfbfsl1005")
	var_491_0.open = "moveToCity"
	var_491_0.cityId = 123

	return var_491_0
end

function roleDialogue.constant.dialogueFrame_kfbfsl2001()
	local var_492_0 = {}

	var_492_0.totalStep = 2
	var_492_0.step = {}
	var_492_0.step[1] = {}
	var_492_0.step[1].type = 1
	var_492_0.step[1].pic = "xiaoqian"
	var_492_0.step[1].desc = language.get("kfbfsl1000")
	var_492_0.step[2].type = 1
	var_492_0.step[2].pic = "xiaoqian"
	var_492_0.step[2].desc = language.get("kfbfsl1002")
	var_492_0.open = "moveToCity"
	var_492_0.cityId = 34

	return var_492_0
end

function roleDialogue.constant.dialogueFrame_kfbfsl2002()
	local var_493_0 = {}

	var_493_0.totalStep = 2
	var_493_0.step = {}
	var_493_0.step[1] = {}
	var_493_0.step[1].type = 1
	var_493_0.step[1].pic = "xiaoqian"
	var_493_0.step[1].desc = language.get("kfbfsl1004")
	var_493_0.step[2].type = 1
	var_493_0.step[2].pic = "xiaoqian"
	var_493_0.step[2].desc = language.get("kfbfsl1005")
	var_493_0.open = "moveToCity"
	var_493_0.cityId = 19

	return var_493_0
end

function roleDialogue.constant.dialogueFrame_kfbfsl3001()
	local var_494_0 = {}

	var_494_0.totalStep = 2
	var_494_0.step = {}
	var_494_0.step[1] = {}
	var_494_0.step[1].type = 1
	var_494_0.step[1].pic = "xiaoqian"
	var_494_0.step[1].desc = language.get("kfbfsl1000")
	var_494_0.step[2].type = 1
	var_494_0.step[2].pic = "xiaoqian"
	var_494_0.step[2].desc = language.get("kfbfsl1003")
	var_494_0.open = "moveToCity"
	var_494_0.cityId = 113

	return var_494_0
end

function roleDialogue.constant.dialogueFrame_kfbfsl3002()
	local var_495_0 = {}

	var_495_0.totalStep = 2
	var_495_0.step = {}
	var_495_0.step[1] = {}
	var_495_0.step[1].type = 1
	var_495_0.step[1].pic = "xiaoqian"
	var_495_0.step[1].desc = language.get("kfbfsl1004")
	var_495_0.step[2].type = 1
	var_495_0.step[2].pic = "xiaoqian"
	var_495_0.step[2].desc = language.get("kfbfsl1005")
	var_495_0.open = "moveToCity"
	var_495_0.cityId = 207

	return var_495_0
end

function roleDialogue.constant.dialogueFrame_yw215158()
	local var_496_0 = {}

	var_496_0.totalStep = 1
	var_496_0.step = {}
	var_496_0.step[1] = {}
	var_496_0.step[1].type = 1
	var_496_0.step[1].pic = "xiaoqian"
	var_496_0.step[1].desc = language.get(215158)

	return var_496_0
end

function roleDialogue.constant.dialogueFrame_yw215157()
	local var_497_0 = {}

	var_497_0.totalStep = 1
	var_497_0.step = {}
	var_497_0.step[1] = {}
	var_497_0.step[1].type = 1
	var_497_0.step[1].pic = "xiaoqian"
	var_497_0.step[1].desc = language.get(215157)

	return var_497_0
end

function roleDialogue.constant.dialogueFrame_yw215136()
	local var_498_0 = {}

	var_498_0.totalStep = 1
	var_498_0.step = {}
	var_498_0.step[1] = {}
	var_498_0.step[1].type = 1
	var_498_0.step[1].pic = "machao"
	var_498_0.step[1].desc = language.get(215136, user.ywData.cityName)

	return var_498_0
end

function roleDialogue.constant.dialogueFrame_yw215137()
	local var_499_0 = {}

	var_499_0.totalStep = 1
	var_499_0.step = {}
	var_499_0.step[1] = {}
	var_499_0.step[1].type = 1
	var_499_0.step[1].pic = "caocao2"
	var_499_0.step[1].desc = language.get(215137, user.ywData.cityName)

	return var_499_0
end

function roleDialogue.constant.dialogueFrame_yw215124()
	local var_500_0 = {}

	var_500_0.totalStep = 1
	var_500_0.step = {}
	var_500_0.step[1] = {}
	var_500_0.step[1].type = 1
	var_500_0.step[1].pic = "xiaoqian"
	var_500_0.step[1].desc = language.get(215124, user.ywData.tjCityName)

	return var_500_0
end

function roleDialogue.constant.dialogueFrame_expandStart()
	local var_501_0 = {}

	var_501_0.totalStep = 1
	var_501_0.step = {}
	var_501_0.step[1] = {}
	var_501_0.step[1].type = 1
	var_501_0.step[1].pic = "xiaoqian"
	var_501_0.step[1].desc = language.get("expandStart")

	return var_501_0
end

function roleDialogue.constant.dialogueFrame_expand1()
	local var_502_0 = {}

	var_502_0.totalStep = 1
	var_502_0.step = {}
	var_502_0.step[1] = {}
	var_502_0.step[1].type = 1
	var_502_0.step[1].pic = "xiaoqian"
	var_502_0.step[1].desc = language.get("expand1")

	return var_502_0
end

function roleDialogue.constant.dialogueFrame_expand2()
	local var_503_0 = {}

	var_503_0.totalStep = 1
	var_503_0.step = {}
	var_503_0.step[1] = {}
	var_503_0.step[1].type = 1
	var_503_0.step[1].pic = "xiaoqian"
	var_503_0.step[1].desc = language.get("expand2")

	return var_503_0
end

function roleDialogue.constant.dialogueFrame_worldBuildSix()
	local var_504_0 = {}

	var_504_0.totalStep = 5
	var_504_0.step = {}
	var_504_0.step[1] = {}
	var_504_0.step[1].type = 1
	var_504_0.step[1].pic = "xiaoqian"
	var_504_0.step[1].desc = language.get(136870)
	var_504_0.step[2] = {}
	var_504_0.step[2].type = 1
	var_504_0.step[2].pic = "xiaoqian"
	var_504_0.step[2].desc = language.get(136871)
	var_504_0.step[3] = {}
	var_504_0.step[3].type = 1
	var_504_0.step[3].pic = "xiaoqian"
	var_504_0.step[3].desc = language.get(136872)
	var_504_0.step[4] = {}
	var_504_0.step[4].type = 1
	var_504_0.step[4].pic = "xiaoqian"
	var_504_0.step[4].desc = language.get(136873)
	var_504_0.step[5] = {}
	var_504_0.step[5].type = 1
	var_504_0.step[5].pic = "xiaoqian"
	var_504_0.step[5].desc = language.get(136874)

	return var_504_0
end

function roleDialogue.constant.dialogueFrame_kflq1001()
	local var_505_0 = {}

	var_505_0.totalStep = 1
	var_505_0.step = {}
	var_505_0.step[1] = {}
	var_505_0.step[1].type = 1
	var_505_0.step[1].pic = "xiaoqian"
	var_505_0.step[1].desc = language.get(215600)
	var_505_0.open = "moveToCity"
	var_505_0.cityId = 7001

	return var_505_0
end

function roleDialogue.constant.dialogueFrame_kflq1002()
	local var_506_0 = {}

	var_506_0.totalStep = 1
	var_506_0.step = {}
	var_506_0.step[1] = {}
	var_506_0.step[1].type = 1
	var_506_0.step[1].pic = "xiaoqian"
	var_506_0.step[1].desc = language.get(215601)
	var_506_0.open = "moveToCity"
	var_506_0.cityId = user.kflqData.curKingCityId or 7001

	return var_506_0
end

function roleDialogue.constant.dialogueFrame_kflq1003()
	local var_507_0 = {}

	var_507_0.totalStep = 1
	var_507_0.step = {}
	var_507_0.step[1] = {}
	var_507_0.step[1].type = 1
	var_507_0.step[1].pic = "xiaoqian"
	var_507_0.step[1].desc = language.get(215602)

	return var_507_0
end

function roleDialogue.constant.dialogueFrame_kflq1004()
	local var_508_0 = {}

	var_508_0.totalStep = 1
	var_508_0.step = {}
	var_508_0.step[1] = {}
	var_508_0.step[1].type = 1
	var_508_0.step[1].pic = "xiaoqian"
	var_508_0.step[1].desc = language.get(215603)

	return var_508_0
end

function roleDialogue.constant.dialogueFrame_kflq1005()
	local var_509_0 = {}

	var_509_0.totalStep = 1
	var_509_0.step = {}
	var_509_0.step[1] = {}
	var_509_0.step[1].type = 1
	var_509_0.step[1].pic = "xiaoqian"
	var_509_0.step[1].desc = language.get(215604)
	var_509_0.open = "moveToCity"
	var_509_0.cityId = 7056

	return var_509_0
end

function roleDialogue.constant.dialogueFrame_kflq1006()
	local var_510_0 = {}

	var_510_0.totalStep = 2
	var_510_0.step = {}
	var_510_0.step[1] = {}
	var_510_0.step[1].type = 1
	var_510_0.step[1].pic = "lqw"
	var_510_0.step[1].desc = language.get(215607)
	var_510_0.step[2] = {}
	var_510_0.step[2].type = 1
	var_510_0.step[2].pic = "lqw"
	var_510_0.step[2].desc = language.get(215608)
	var_510_0.open = "moveToCity"
	var_510_0.cityId = 7001

	return var_510_0
end

function roleDialogue.constant.dialogueFrame_kflq1007()
	local var_511_0 = {}

	var_511_0.totalStep = 2
	var_511_0.step = {}
	var_511_0.step[1] = {}
	var_511_0.step[1].type = 1
	var_511_0.step[1].pic = "lqw"
	var_511_0.step[1].desc = language.get(215609)
	var_511_0.step[2] = {}
	var_511_0.step[2].type = 1
	var_511_0.step[2].pic = "lqw"
	var_511_0.step[2].desc = language.get(215612)
	var_511_0.open = "moveToCity"
	var_511_0.cityId = user.kflqData.curKingCityId or 7001

	return var_511_0
end

function roleDialogue.constant.dialogueFrame_tenSilk10()
	local var_512_0 = {}

	var_512_0.totalStep = 2
	var_512_0.step = {}
	var_512_0.step[1] = {}
	var_512_0.step[1].type = 1
	var_512_0.step[1].pic = "xiaoqian"
	var_512_0.step[1].desc = language.get(215901)
	var_512_0.step[2] = {}
	var_512_0.step[2].type = 1
	var_512_0.step[2].pic = "xiaoqian"
	var_512_0.step[2].desc = language.get(215902)

	return var_512_0
end

function roleDialogue.constant.dialogueFrame_tenSilk101()
	local var_513_0 = {}

	var_513_0.totalStep = 2
	var_513_0.step = {}
	var_513_0.step[1] = {}
	var_513_0.step[1].type = 1
	var_513_0.step[1].pic = "tzgw"
	var_513_0.step[1].desc = language.get(215903)
	var_513_0.step[2] = {}
	var_513_0.step[2].type = 1
	var_513_0.step[2].pic = "tzgw"
	var_513_0.step[2].desc = language.get(215904)

	return var_513_0
end

function roleDialogue.constant.dialogueFrame_tenSilkOpen()
	local var_514_0 = {}

	var_514_0.totalStep = 3
	var_514_0.step = {}
	var_514_0.step[1] = {}
	var_514_0.step[1].type = 1
	var_514_0.step[1].pic = "tzgw"
	var_514_0.step[1].desc = language.get(215905)
	var_514_0.step[2] = {}
	var_514_0.step[2].type = 1
	var_514_0.step[2].pic = "tzgw"
	var_514_0.step[2].desc = language.get(215906)
	var_514_0.step[3] = {}
	var_514_0.step[3].type = 1
	var_514_0.step[3].pic = "tzgw"
	var_514_0.step[3].desc = language.get(215907)

	return var_514_0
end

function roleDialogue.constant.dialogueFrame_lvbu1001()
	local var_515_0 = {}

	var_515_0.totalStep = 1
	var_515_0.step = {}
	var_515_0.step[1] = {}
	var_515_0.step[1].type = 1
	var_515_0.step[1].pic = "lvbujx"
	var_515_0.step[1].desc = language.get(216001)

	return var_515_0
end

function roleDialogue.constant.dialogueFrame_10093()
	local var_516_0 = {}

	var_516_0.totalStep = 2
	var_516_0.step = {}
	var_516_0.step[1] = {}
	var_516_0.step[1].type = 1
	var_516_0.step[1].pic = "xiaoqian"
	var_516_0.step[1].desc = language.get(216101)
	var_516_0.step[2] = {}
	var_516_0.step[2].type = 1
	var_516_0.step[2].pic = "xiaoqian"
	var_516_0.step[2].desc = language.get(216102)

	return var_516_0
end

function roleDialogue.constant.dialogueFrame_chariot1()
	local var_517_0 = {}

	var_517_0.totalStep = 1
	var_517_0.step = {}
	var_517_0.step[1] = {}
	var_517_0.step[1].type = 1
	var_517_0.step[1].pic = "xiaoqian"
	var_517_0.step[1].desc = language.get(216103)

	return var_517_0
end

function roleDialogue.constant.dialogueFrame_chariot2()
	local var_518_0 = {}

	var_518_0.totalStep = 2
	var_518_0.step = {}
	var_518_0.step[1] = {}
	var_518_0.step[1].type = 1
	var_518_0.step[1].pic = "xiaoqian"
	var_518_0.step[1].desc = language.get(216104)
	var_518_0.step[2] = {}
	var_518_0.step[2].type = 1
	var_518_0.step[2].pic = "xiaoqian"
	var_518_0.step[2].desc = language.get(216105)

	return var_518_0
end

function roleDialogue.constant.dialogueFrame_chariot3()
	local var_519_0 = {}

	var_519_0.totalStep = 3
	var_519_0.step = {}
	var_519_0.step[1] = {}
	var_519_0.step[1].type = 1
	var_519_0.step[1].pic = "xiaoqian"
	var_519_0.step[1].desc = language.get(216106)
	var_519_0.step[2] = {}
	var_519_0.step[2].type = 1
	var_519_0.step[2].pic = "xiaoqian"
	var_519_0.step[2].desc = language.get(216107)
	var_519_0.step[3] = {}
	var_519_0.step[3].type = 1
	var_519_0.step[3].pic = "xiaoqian"
	var_519_0.step[3].desc = language.get(216108)

	return var_519_0
end

function roleDialogue.constant.dialogueFrame_chariot4()
	local var_520_0 = {}

	var_520_0.totalStep = 3
	var_520_0.step = {}
	var_520_0.step[1] = {}
	var_520_0.step[1].type = 1
	var_520_0.step[1].pic = "xiaoqian"
	var_520_0.step[1].desc = language.get(216109)
	var_520_0.step[2] = {}
	var_520_0.step[2].type = 1
	var_520_0.step[2].pic = "xiaoqian"
	var_520_0.step[2].desc = language.get(216110)
	var_520_0.step[3] = {}
	var_520_0.step[3].type = 1
	var_520_0.step[3].pic = "xiaoqian"
	var_520_0.step[3].desc = language.get(216111)

	return var_520_0
end

function roleDialogue.constant.dialogueFrame_gjgs1()
	local var_521_0 = {}

	var_521_0.totalStep = 1
	var_521_0.step = {}
	var_521_0.step[1] = {}
	var_521_0.step[1].type = 1
	var_521_0.step[1].pic = "xiaoqian"
	var_521_0.step[1].desc = language.get(216319)
	var_521_0.open = "moveToCity"
	var_521_0.cityId = user.repairStartCityId1

	return var_521_0
end

function roleDialogue.constant.dialogueFrame_gjgs2()
	local var_522_0 = {}

	var_522_0.totalStep = 1
	var_522_0.step = {}
	var_522_0.step[1] = {}
	var_522_0.step[1].type = 1
	var_522_0.step[1].pic = "xiaoqian"
	var_522_0.step[1].desc = language.get(216320, user.repairStartCityName1, user.repairEndCityName1)
	var_522_0.open = "moveToCity"
	var_522_0.cityId = user.repairStartCityId2

	return var_522_0
end

function roleDialogue.constant.dialogueFrame_gjgs3()
	local var_523_0 = {}

	var_523_0.totalStep = 1
	var_523_0.step = {}
	var_523_0.step[1] = {}
	var_523_0.step[1].type = 1
	var_523_0.step[1].pic = "xiaoqian"
	var_523_0.step[1].desc = language.get(216320, user.repairStartCityName2, user.repairEndCityName2)

	return var_523_0
end

function roleDialogue.constant.dialogueFrame_gjgs4()
	local var_524_0 = {}

	var_524_0.totalStep = 1
	var_524_0.step = {}
	var_524_0.step[1] = {}
	var_524_0.step[1].type = 1
	var_524_0.step[1].pic = "xiaoqian"
	var_524_0.step[1].desc = language.get(216321)
	var_524_0.open = "moveToCity"
	var_524_0.cityId = user.closeCityId1

	return var_524_0
end

function roleDialogue.constant.dialogueFrame_gjgs5()
	local var_525_0 = {}

	var_525_0.totalStep = 1
	var_525_0.step = {}
	var_525_0.step[1] = {}
	var_525_0.step[1].type = 1
	var_525_0.step[1].pic = "xiaoqian"
	var_525_0.step[1].desc = language.get(216322, user.closeCityName1)
	var_525_0.open = "moveToCity"
	var_525_0.cityId = user.closeCityId2

	return var_525_0
end

function roleDialogue.constant.dialogueFrame_gjgs6()
	local var_526_0 = {}

	var_526_0.totalStep = 1
	var_526_0.step = {}
	var_526_0.step[1] = {}
	var_526_0.step[1].type = 1
	var_526_0.step[1].pic = "xiaoqian"
	var_526_0.step[1].desc = language.get(216323, user.closeCityName2)
	var_526_0.open = "moveToCity"
	var_526_0.cityId = user.closeCityId3

	return var_526_0
end

function roleDialogue.constant.dialogueFrame_gjgs7()
	local var_527_0 = {}

	var_527_0.totalStep = 1
	var_527_0.step = {}
	var_527_0.step[1] = {}
	var_527_0.step[1].type = 1
	var_527_0.step[1].pic = "xiaoqian"
	var_527_0.step[1].desc = language.get(216324, user.closeCityName3)

	return var_527_0
end

function roleDialogue.constant.dialogueFrame_gjgs8()
	local var_528_0 = {}

	var_528_0.totalStep = 2
	var_528_0.step = {}
	var_528_0.step[1] = {}
	var_528_0.step[1].type = 1
	var_528_0.step[1].pic = "xiaoqian"
	var_528_0.step[1].desc = language.get(216325)
	var_528_0.step[2] = {}
	var_528_0.step[2].type = 1
	var_528_0.step[2].pic = "xiaoqian"
	var_528_0.step[2].desc = language.get(216326)

	return var_528_0
end

function roleDialogue.constant.dialogueFrame_monsterStart()
	local var_529_0 = {}

	var_529_0.totalStep = 1
	var_529_0.step = {}
	var_529_0.step[1] = {}
	var_529_0.step[1].type = 1
	var_529_0.step[1].pic = "xiaoqian"
	var_529_0.step[1].desc = language.get(216350)
	var_529_0.open = "moveToCity"
	var_529_0.cityId = user.monsterCityId or 0

	return var_529_0
end

function roleDialogue.constant.dialogueFrame_monsterOver()
	local var_530_0 = {}

	var_530_0.totalStep = 1
	var_530_0.step = {}
	var_530_0.step[1] = {}
	var_530_0.step[1].type = 1
	var_530_0.step[1].pic = "xiaoqian"
	var_530_0.step[1].desc = language.get(216351)
	var_530_0.open = "yearBeast17"

	return var_530_0
end

function roleDialogue.constant.dialogueFrame_fightBack()
	local var_531_0 = {}

	var_531_0.totalStep = 1
	var_531_0.step = {}
	var_531_0.step[1] = {}
	var_531_0.step[1].type = 1
	var_531_0.step[1].pic = "xiaoqian"
	var_531_0.step[1].desc = language.get(216361)

	return var_531_0
end

function roleDialogue.constant.dialogueFrame_fightBackAtt()
	local var_532_0 = {}

	var_532_0.totalStep = 1
	var_532_0.step = {}
	var_532_0.step[1] = {}
	var_532_0.step[1].type = 1
	var_532_0.step[1].pic = "xiaoqian"
	var_532_0.step[1].desc = language.get(216363)
	var_532_0.open = "moveToCity"
	var_532_0.cityId = user.fightBackCityId or 0

	return var_532_0
end

function roleDialogue.constant.dialogueFrame_fightBackDef()
	local var_533_0 = {}

	var_533_0.totalStep = 1
	var_533_0.step = {}
	var_533_0.step[1] = {}
	var_533_0.step[1].type = 1
	var_533_0.step[1].pic = "xiaoqian"
	var_533_0.step[1].desc = language.get(216364)
	var_533_0.open = "moveToCity"
	var_533_0.cityId = user.fightBackCityId or 0

	return var_533_0
end

function roleDialogue.constant.dialogueFrame_worldBuildSeven()
	local var_534_0 = {}

	var_534_0.totalStep = 5
	var_534_0.step = {}
	var_534_0.step[1] = {}
	var_534_0.step[1].type = 1
	var_534_0.step[1].pic = "xiaoqian"
	var_534_0.step[1].desc = language.get(218120)
	var_534_0.step[2] = {}
	var_534_0.step[2].type = 1
	var_534_0.step[2].pic = "xiaoqian"
	var_534_0.step[2].desc = language.get(218121)
	var_534_0.step[3] = {}
	var_534_0.step[3].type = 1
	var_534_0.step[3].pic = "xiaoqian"
	var_534_0.step[3].desc = language.get(218122)
	var_534_0.step[4] = {}
	var_534_0.step[4].type = 1
	var_534_0.step[4].pic = "xiaoqian"
	var_534_0.step[4].desc = language.get(218123)
	var_534_0.step[5] = {}
	var_534_0.step[5].type = 1
	var_534_0.step[5].pic = "xiaoqian"
	var_534_0.step[5].desc = language.get(218124)

	return var_534_0
end

function roleDialogue.constant.dialogueFrame_kfnzState1()
	local var_535_0 = {}

	var_535_0.totalStep = 1
	var_535_0.step = {}
	var_535_0.step[1] = {}
	var_535_0.step[1].type = 1
	var_535_0.step[1].pic = "xiaoqian"
	var_535_0.step[1].desc = language.get(218125)
	var_535_0.open = "moveToCity"
	var_535_0.cityId = 8050

	return var_535_0
end

function roleDialogue.constant.dialogueFrame_kfnzState2()
	local var_536_0 = {}

	var_536_0.totalStep = 1
	var_536_0.step = {}
	var_536_0.step[1] = {}
	var_536_0.step[1].type = 1
	var_536_0.step[1].pic = "xiaoqian"
	var_536_0.step[1].desc = language.get(218126)
	var_536_0.open = "moveToCity"
	var_536_0.cityId = 8023

	return var_536_0
end

function roleDialogue.constant.dialogueFrame_kfnzState2_1()
	local var_537_0 = {}

	var_537_0.totalStep = 1
	var_537_0.step = {}
	var_537_0.step[1] = {}
	var_537_0.step[1].type = 1
	var_537_0.step[1].pic = "xiaoqian"
	var_537_0.step[1].desc = language.get(218127)
	var_537_0.open = "moveToCity"
	var_537_0.cityId = 8024

	return var_537_0
end

function roleDialogue.constant.dialogueFrame_kfnzState2_2()
	local var_538_0 = {}

	var_538_0.totalStep = 1
	var_538_0.step = {}
	var_538_0.step[1] = {}
	var_538_0.step[1].type = 1
	var_538_0.step[1].pic = "xiaoqian"
	var_538_0.step[1].desc = language.get(218127)
	var_538_0.open = "moveToCity"
	var_538_0.cityId = 8025

	return var_538_0
end

function roleDialogue.constant.dialogueFrame_kfnzState3()
	local var_539_0 = {}

	var_539_0.totalStep = 1
	var_539_0.step = {}
	var_539_0.step[1] = {}
	var_539_0.step[1].type = 1
	var_539_0.step[1].pic = "xiaoqian"
	var_539_0.step[1].desc = language.get(218128)

	return var_539_0
end

function roleDialogue.constant.dialogueFrame_kfnzState3_1()
	local var_540_0 = {}

	var_540_0.totalStep = 1
	var_540_0.step = {}
	var_540_0.step[1] = {}
	var_540_0.step[1].type = 1
	var_540_0.step[1].pic = "xiaoqian"
	var_540_0.step[1].desc = language.get(218129)
	var_540_0.open = "moveToCity"
	var_540_0.cityId = 8001

	return var_540_0
end

function roleDialogue.constant.dialogueFrame_kfnzState3_2()
	local var_541_0 = {}

	var_541_0.totalStep = 1
	var_541_0.step = {}
	var_541_0.step[1] = {}
	var_541_0.step[1].type = 1
	var_541_0.step[1].pic = "xiaoqian"
	var_541_0.step[1].desc = language.get(218130)

	return var_541_0
end

function roleDialogue.constant.dialogueFrame_kfnzEvent1()
	local var_542_0 = {}

	var_542_0.totalStep = 1
	var_542_0.step = {}
	var_542_0.step[1] = {}
	var_542_0.step[1].type = 1
	var_542_0.step[1].pic = "nzjl"
	var_542_0.step[1].desc = language.get(218131)

	return var_542_0
end

function roleDialogue.constant.dialogueFrame_kfnzEvent2()
	local var_543_0 = {}

	var_543_0.totalStep = 1
	var_543_0.step = {}
	var_543_0.step[1] = {}
	var_543_0.step[1].type = 1
	var_543_0.step[1].pic = "nzjl"
	var_543_0.step[1].desc = language.get(218132)

	return var_543_0
end

function roleDialogue.constant.dialogueFrame_kfnzEvent3()
	local var_544_0 = {}

	var_544_0.totalStep = 1
	var_544_0.step = {}
	var_544_0.step[1] = {}
	var_544_0.step[1].type = 1
	var_544_0.step[1].pic = "nzjl"
	var_544_0.step[1].desc = language.get(218133)

	return var_544_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild2()
	local var_545_0 = {}

	var_545_0.totalStep = 1
	var_545_0.step = {}
	var_545_0.step[1] = {}
	var_545_0.step[1].type = 1
	var_545_0.step[1].pic = "mojia"
	var_545_0.step[1].desc = language.get("moJiaBuild21", user.mojia.regionalName or "")

	return var_545_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild3()
	local var_546_0 = {}

	var_546_0.totalStep = 7
	var_546_0.step = {}
	var_546_0.step[1] = {}
	var_546_0.step[1].type = 1
	var_546_0.step[1].pic = "mojia"
	var_546_0.step[1].desc = language.get("moJiaBuild31")
	var_546_0.step[2] = {}
	var_546_0.step[2].type = 1
	var_546_0.step[2].pic = "player"
	var_546_0.step[2].desc = language.get("moJiaBuild32")
	var_546_0.step[3] = {}
	var_546_0.step[3].type = 1
	var_546_0.step[3].pic = "mojia"
	var_546_0.step[3].desc = language.get("moJiaBuild33")
	var_546_0.step[4] = {}
	var_546_0.step[4].type = 1
	var_546_0.step[4].pic = "player"
	var_546_0.step[4].desc = language.get("moJiaBuild34")
	var_546_0.step[5] = {}
	var_546_0.step[5].type = 1
	var_546_0.step[5].pic = "mojia"
	var_546_0.step[5].desc = language.get("moJiaBuild35")
	var_546_0.step[6] = {}
	var_546_0.step[6].type = 1
	var_546_0.step[6].pic = "mojia"
	var_546_0.step[6].desc = language.get("moJiaBuild36")
	var_546_0.step[7] = {}
	var_546_0.step[7].type = 1
	var_546_0.step[7].pic = "mojia"
	var_546_0.step[7].desc = language.get("moJiaBuild37")

	return var_546_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild5()
	local var_547_0 = {}

	var_547_0.totalStep = 3
	var_547_0.step = {}
	var_547_0.step[1] = {}
	var_547_0.step[1].type = 1
	var_547_0.step[1].pic = "mojia"
	var_547_0.step[1].desc = language.get("moJiaBuild51")
	var_547_0.step[2] = {}
	var_547_0.step[2].type = 1
	var_547_0.step[2].pic = "player"
	var_547_0.step[2].desc = language.get("moJiaBuild52")
	var_547_0.step[3] = {}
	var_547_0.step[3].type = 1
	var_547_0.step[3].pic = "mojia"
	var_547_0.step[3].desc = language.get("moJiaBuild53")
	var_547_0.open = "moveToMainCityRegional"

	return var_547_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild6()
	local var_548_0 = {}

	var_548_0.totalStep = 1
	var_548_0.step = {}
	var_548_0.step[1] = {}
	var_548_0.step[1].type = 1
	var_548_0.step[1].pic = "mojia"
	var_548_0.step[1].desc = language.get("moJiaBuild61")

	return var_548_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild7()
	local var_549_0 = {}

	var_549_0.totalStep = 1
	var_549_0.step = {}
	var_549_0.step[1] = {}
	var_549_0.step[1].type = 1
	var_549_0.step[1].pic = "mojia"
	var_549_0.step[1].desc = language.get("moJiaBuild71")

	return var_549_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild8()
	local var_550_0 = {}

	var_550_0.totalStep = 1
	var_550_0.step = {}
	var_550_0.step[1] = {}
	var_550_0.step[1].type = 1
	var_550_0.step[1].pic = "mojia"
	var_550_0.step[1].desc = language.get("moJiaBuild81")

	return var_550_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild9()
	local var_551_0 = {}

	var_551_0.totalStep = 3
	var_551_0.step = {}
	var_551_0.step[1] = {}
	var_551_0.step[1].type = 1
	var_551_0.step[1].pic = "mojia"
	var_551_0.step[1].desc = language.get("moJiaBuild91")
	var_551_0.step[2] = {}
	var_551_0.step[2].type = 1
	var_551_0.step[2].pic = "mojia"
	var_551_0.step[2].desc = language.get("moJiaBuild92")
	var_551_0.step[3] = {}
	var_551_0.step[3].type = 1
	var_551_0.step[3].pic = "mojia"
	var_551_0.step[3].desc = language.get("moJiaBuild93")

	return var_551_0
end

function roleDialogue.constant.dialogueFrame_moJiaBuild10()
	local var_552_0 = {}

	var_552_0.totalStep = 3
	var_552_0.step = {}
	var_552_0.step[1] = {}
	var_552_0.step[1].type = 1
	var_552_0.step[1].pic = "mojia"
	var_552_0.step[1].desc = language.get("moJiaBuild101")
	var_552_0.step[2] = {}
	var_552_0.step[2].type = 1
	var_552_0.step[2].pic = "player"
	var_552_0.step[2].desc = language.get("moJiaBuild102")
	var_552_0.step[3] = {}
	var_552_0.step[3].type = 1
	var_552_0.step[3].pic = "mojia"
	var_552_0.step[3].desc = language.get("moJiaBuild103")

	return var_552_0
end

function roleDialogue.constant.dialogueFrame_hyyjx1()
	local var_553_0 = {}

	var_553_0.totalStep = 1
	var_553_0.step = {}
	var_553_0.step[1] = {}
	var_553_0.step[1].type = 1
	var_553_0.step[1].pic = "huangyueying"
	var_553_0.step[1].desc = language.get(216001)
	var_553_0.open = "gotoGeneralPanel"

	return var_553_0
end

function roleDialogue.constant.dialogueFrame_NpcManZu1()
	local var_554_0 = {}

	var_554_0.totalStep = 2
	var_554_0.step = {}
	var_554_0.step[1] = {}
	var_554_0.step[1].type = 1
	var_554_0.step[1].pic = "manzu"
	var_554_0.step[1].desc = language.get("NpcManZu1_1")
	var_554_0.step[2] = {}
	var_554_0.step[2].type = 1
	var_554_0.step[2].pic = "player"
	var_554_0.step[2].desc = language.get("NpcManZu1_2")
	var_554_0.open = "moveToCity"
	var_554_0.cityId = user.strategyCityId or 0

	return var_554_0
end

function roleDialogue.constant.dialogueFrame_NpcManZu2()
	local var_555_0 = {}

	var_555_0.totalStep = 2
	var_555_0.step = {}
	var_555_0.step[1] = {}
	var_555_0.step[1].type = 1
	var_555_0.step[1].pic = "manzu"
	var_555_0.step[1].desc = language.get("NpcManZu2_1")
	var_555_0.step[2] = {}
	var_555_0.step[2].type = 1
	var_555_0.step[2].pic = "player"
	var_555_0.step[2].desc = language.get("NpcManZu2_2")

	return var_555_0
end

function roleDialogue.constant.dialogueFrame_NpcManZu3()
	local var_556_0 = {}

	var_556_0.totalStep = 1
	var_556_0.step = {}
	var_556_0.step[1] = {}
	var_556_0.step[1].type = 1
	var_556_0.step[1].pic = "manzu"
	var_556_0.step[1].desc = language.get("NpcManZu3_1")

	return var_556_0
end

function roleDialogue.constant.dialogueFrame_NpcYuanShao1()
	local var_557_0 = {}

	var_557_0.totalStep = 2
	var_557_0.step = {}
	var_557_0.step[1] = {}
	var_557_0.step[1].type = 1
	var_557_0.step[1].pic = "yuanshao"
	var_557_0.step[1].desc = language.get("NpcYuanShao1_1")
	var_557_0.step[2] = {}
	var_557_0.step[2].type = 1
	var_557_0.step[2].pic = "player"
	var_557_0.step[2].desc = language.get("NpcYuanShao1_2")
	var_557_0.open = "moveToCity"
	var_557_0.cityId = user.strategyCityId or 0

	return var_557_0
end

function roleDialogue.constant.dialogueFrame_NpcYuanShao2()
	local var_558_0 = {}

	var_558_0.totalStep = 1
	var_558_0.step = {}
	var_558_0.step[1] = {}
	var_558_0.step[1].type = 1
	var_558_0.step[1].pic = "yuanshao"
	var_558_0.step[1].desc = language.get("NpcYuanShao2_1")

	return var_558_0
end

function roleDialogue.constant.dialogueFrame_NpcHuangJin1()
	local var_559_0 = {}

	var_559_0.totalStep = 3
	var_559_0.step = {}
	var_559_0.step[1] = {}
	var_559_0.step[1].type = 1
	var_559_0.step[1].pic = "zhangjiao"
	var_559_0.step[1].desc = language.get("NpcHuangJin1_1")
	var_559_0.step[2] = {}
	var_559_0.step[2].type = 1
	var_559_0.step[2].pic = "player"
	var_559_0.step[2].desc = language.get("NpcHuangJin1_2")
	var_559_0.step[3] = {}
	var_559_0.step[3].type = 1
	var_559_0.step[3].pic = "player"
	var_559_0.step[3].desc = language.get("NpcHuangJin1_3")
	var_559_0.open = "moveToCity"
	var_559_0.cityId = user.strategyCityId or 0

	return var_559_0
end

function roleDialogue.constant.dialogueFrame_NpcHuangJin2()
	local var_560_0 = {}

	var_560_0.totalStep = 1
	var_560_0.step = {}
	var_560_0.step[1] = {}
	var_560_0.step[1].type = 1
	var_560_0.step[1].pic = "zhangjiao"
	var_560_0.step[1].desc = language.get("NpcHuangJin2_1")

	return var_560_0
end

function roleDialogue.constant.dialogueFrame_NpcHuangJin3()
	local var_561_0 = {}

	var_561_0.totalStep = 2
	var_561_0.step = {}
	var_561_0.step[1] = {}
	var_561_0.step[1].type = 1
	var_561_0.step[1].pic = "zhangjiao"
	var_561_0.step[1].desc = language.get("NpcHuangJin3_1")
	var_561_0.step[2] = {}
	var_561_0.step[2].type = 1
	var_561_0.step[2].pic = "player"
	var_561_0.step[2].desc = language.get("NpcHuangJin3_2")

	return var_561_0
end
