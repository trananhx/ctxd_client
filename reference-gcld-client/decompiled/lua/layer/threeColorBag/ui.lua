threeColorBag = {}

tool.requireRes("threeColorBag")
require("lua/common/tool")

threeColorBag.ui = {}

local var_0_0 = threeColorBag.ui
local var_0_1 = threeColorBag.constant
local var_0_2 = threeColorBag.constant.word

local function var_0_3(arg_1_0)
	local var_1_0 = arg_1_0:getContentSize()
	local var_1_1 = var_1_0.width / 2
	local var_1_2 = var_1_0.height / 2

	return var_1_1, var_1_2
end

local function var_0_4(arg_2_0, arg_2_1)
	if arg_2_0 == 1 or arg_2_0 == "1" and arg_2_1 ~= true then
		return "res/ui/threeColorBag/rxj.png", "res/ui/threeColorBag/hongdi.png"
	elseif arg_2_0 == 2 or arg_2_0 == "2" and arg_2_1 ~= true then
		return "res/ui/threeColorBag/hxj.png", "res/ui/threeColorBag/huangdi.png"
	elseif arg_2_0 == 3 or arg_2_0 == "3" and arg_2_1 ~= true then
		return "res/ui/threeColorBag/lxj.png", "res/ui/threeColorBag/landi.png"
	elseif arg_2_0 == 1 or arg_2_0 == "1" and arg_2_1 == true then
		return "res/ui/threeColorBag/13.png"
	elseif arg_2_0 == 2 or arg_2_0 == "2" and arg_2_1 == true then
		return "res/ui/threeColorBag/12.png"
	elseif arg_2_0 == 3 or arg_2_0 == "3" and arg_2_1 == true then
		return "res/ui/threeColorBag/14.png"
	end
end

local function var_0_5(arg_3_0)
	local var_3_0 = CCArray:create()

	var_3_0:addObject(CCJumpBy:create(var_0_1.jumpTime, arg_3_0, var_0_1.jumpHeight, var_0_1.jumpNum))
	var_3_0:addObject(CCJumpBy:create(var_0_1.jumpTime / 3, ccp(0, 0), var_0_1.jumpHeight / 3, var_0_1.jumpNum))
	var_3_0:addObject(CCJumpBy:create(var_0_1.jumpTime / 6, ccp(0, 0), var_0_1.jumpHeight / 6, var_0_1.jumpNum))

	return var_3_0
end

local function var_0_6(arg_4_0)
	local var_4_0 = CCArray:create()

	var_4_0:addObject(CCFadeOut:create(0.9))
	var_4_0:addObject(CCScaleTo:create(0.7, 0.2))
	var_4_0:addObject(CCMoveTo:create(0.7, ccp(-380, 350)))

	local var_4_1 = CCArray:create()

	var_4_1:addObject(CCDelayTime:create(arg_4_0))
	var_4_1:addObject(CCEaseExponentialOut:create(CCMoveBy:create(0.4, ccp(0, 60))))
	var_4_1:addObject(CCSpawn:create(var_4_0))

	return var_4_1
end

local function var_0_7()
	local var_5_0 = CCMoveBy:create(0.2, ccp(0, 50))
	local var_5_1 = CCDelayTime:create(1.4)
	local var_5_2 = CCFadeOut:create(0.3)
	local var_5_3 = CCArray:create()

	var_5_3:addObject(var_5_0)
	var_5_3:addObject(var_5_1)
	var_5_3:addObject(var_5_2)

	return var_5_3
end

local function var_0_8(arg_6_0)
	local var_6_0 = CCArray:create()

	var_6_0:addObject(CCFadeOut:create(0.4))
	var_6_0:addObject(CCScaleBy:create(0.4, 4))

	local var_6_1 = CCArray:create()

	var_6_1:addObject(CCDelayTime:create(arg_6_0))
	var_6_1:addObject(CCSpawn:create(var_6_0))

	return var_6_1
end

local function var_0_9(arg_7_0)
	local var_7_0 = CCArray:create()

	var_7_0:addObject(CCDelayTime:create(arg_7_0))
	var_7_0:addObject(CCFadeOut:create(0.2))

	return var_7_0
end

local function var_0_10()
	local var_8_0 = CCArray:create()

	var_8_0:addObject(CCMoveBy:create(0.2, ccp(0, -200)))
	var_8_0:addObject(CCJumpBy:create(0.2, ccp(0, 0), 40, 1))
	var_8_0:addObject(CCJumpBy:create(0.2, ccp(0, 0), 20, 1))

	return var_8_0
end

function var_0_0.addCircleExp(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = CCControlPotentiometer:create("res/ui/threeColorBag/jingdudi.png", "res/ui/threeColorBag/jingdu.png", "res/ui/threeColorBag/blank.png")
	local var_9_1, var_9_2 = var_0_3(arg_9_0)

	arg_9_0:addChild(var_9_0, 0)
	var_9_0:setPosition(ccp(var_9_1 + var_0_1.baoshikuang.x, var_9_2 + var_0_1.baoshikuang.y))
	var_9_0:setValue(arg_9_1)
	var_9_0:setEnabled(false)

	if arg_9_2 == true then
		local var_9_3 = CCSprite:create("res/ui/threeColorBag/daj.PNG")

		var_9_3:setScale(0.5)
		var_9_0:addChild(var_9_3)
		var_9_3:setPosition(ccp(var_0_1.centerbag.x, var_0_1.centerbag.y))
	end
end

function var_0_0.addBags(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	local var_10_0, var_10_1 = var_0_4(arg_10_1, arg_10_5)
	local var_10_2
	local var_10_3
	local var_10_4, var_10_5 = var_0_3(arg_10_0)

	if arg_10_5 ~= true then
		local var_10_6 = CCSprite:create(var_10_0)

		var_10_3 = CCSprite:create(var_10_1)

		arg_10_0:addChild(var_10_3)
		var_10_3:addChild(var_10_6)
		var_10_3:setPosition(ccp(var_10_4 + arg_10_2, var_10_5 + arg_10_3))

		local var_10_7, var_10_8 = var_0_3(var_10_3)

		var_10_6:setPosition(ccp(var_10_7, var_10_8))
	else
		var_10_3 = CCSprite:create(var_10_0)

		arg_10_0:addChild(var_10_3)
		var_10_3:setPosition(ccp(var_10_4 + arg_10_2, var_10_5 + arg_10_3))
	end

	local var_10_9, var_10_10 = var_0_3(var_10_3)
	local var_10_11 = CCSprite:create("res/ui/threeColorBag/shuzidi.png")

	var_10_3:addChild(var_10_11)
	var_10_11:setPosition(ccp(var_10_9, -10))
	var_10_11:setScale(0.85)

	local var_10_12 = {}

	if arg_10_4 == true then
		var_10_12.label_0_1 = {
			xcenter = 0,
			fontSize = 18,
			type = "label",
			ycenter = 3,
			text = "1/1",
			font = "Thonburi",
			strokeSize = 2,
			color = ccc3(255, 255, 255),
			strokeColor = ccc3(22, 18, 13)
		}
	elseif arg_10_4 == false then
		var_10_12.label_0_1 = {
			xcenter = 0,
			fontSize = 18,
			type = "label",
			ycenter = 3,
			text = "0/1",
			font = "Thonburi",
			strokeSize = 2,
			color = ccc3(255, 0, 0),
			strokeColor = ccc3(22, 18, 13)
		}
	end

	autoUI.initUI(var_10_11, var_10_12)
end

function var_0_0.addWord1(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	if conf.language == "vie" then
		arg_11_2 = arg_11_2 + 50
	end

	local var_11_0 = {
		word = {
			fontSize = 18,
			type = "label",
			font = "Thonburi",
			strokeSize = 2,
			text = var_0_2[arg_11_1],
			xcenter = arg_11_2,
			ycenter = arg_11_3,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}
	}

	autoUI.initUI(arg_11_0, var_11_0)
end

function var_0_0.addWord2(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	local function var_12_0(arg_13_0)
		if arg_13_0 == 1 then
			return language.get(320313)
		elseif arg_13_0 == 2 then
			return language.get(320314)
		elseif arg_13_0 == 3 then
			return language.get(320315)
		end
	end

	local var_12_1

	if arg_12_2 ~= 1 and arg_12_2 ~= 2 and arg_12_2 ~= 3 then
		var_12_1 = language.get(320302) .. arg_12_1
	else
		var_12_1 = language.get(320302) .. arg_12_1 .. " " .. language.get(320303)
	end

	local var_12_2 = {
		word = {
			fontSize = 18,
			type = "label",
			font = "Thonburi",
			strokeSize = 2,
			text = var_12_1,
			xcenter = arg_12_3,
			ycenter = arg_12_4,
			color = ccc3(0, 255, 0),
			strokeColor = ccc3(22, 18, 13)
		}
	}

	autoUI.initUI(arg_12_0, var_12_2)
end

function var_0_0.addXiaoKuang(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local function var_14_0(arg_15_0)
		if arg_15_0 > 10000 then
			arg_15_0 = arg_15_0 / 10000
			arg_15_0 = tool.toint(arg_15_0)

			return language.get(75021, arg_15_0)
		else
			return arg_15_0
		end
	end

	local var_14_1 = CCSprite:create("res/ui/threeColorBag/xiaolan.png")

	arg_14_0:addChild(var_14_1)

	local var_14_2, var_14_3 = var_0_3(arg_14_0)

	var_14_1:setPosition(var_14_2 + arg_14_1, var_14_3 + arg_14_2)

	local var_14_4 = {
		word = {
			xcenter = 0,
			fontSize = 18,
			type = "label",
			ycenter = 0,
			font = "Thonburi",
			strokeSize = 2,
			text = language.get(320304) .. var_14_0(arg_14_3) .. "/" .. var_14_0(arg_14_4),
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}
	}

	autoUI.initUI(var_14_1, var_14_4)
end

function var_0_0.addGem1(arg_16_0, arg_16_1, arg_16_2)
	rmgr.loadResource(threeColorBag.constant.res)

	local var_16_0 = {}

	for iter_16_0 = 1, arg_16_1 do
		var_16_0[iter_16_0] = CCSprite:createWithSpriteFrameName("res_icon_55.png")

		arg_16_0:addChild(var_16_0[iter_16_0], 200)

		local var_16_1, var_16_2 = var_0_3(arg_16_0)

		var_16_0[iter_16_0]:setPosition(var_16_1, var_16_2)

		local var_16_3 = math.random(1, 18)
		local var_16_4 = var_0_5(var_0_1.gem[var_16_3])

		var_16_0[iter_16_0]:runAction(CCSequence:create(var_16_4))
	end
end

function var_0_0.addGem2(arg_17_0, arg_17_1, arg_17_2)
	rmgr.loadResource(threeColorBag.constant.res)

	local var_17_0 = {}

	for iter_17_0 = 1, arg_17_1 do
		var_17_0[iter_17_0] = CCSprite:createWithSpriteFrameName("res_icon_55.png")

		arg_17_0:addChild(var_17_0[iter_17_0], 200)

		local var_17_1, var_17_2 = var_0_3(arg_17_0)
		local var_17_3 = math.random(1, 18)

		var_17_0[iter_17_0]:setPosition(ccp(var_0_1.gem[var_17_3].x + var_17_1, var_0_1.gem[var_17_3].y + var_17_2))

		local var_17_4 = var_0_6(iter_17_0 * 0.1)

		var_17_0[iter_17_0]:runAction(CCSequence:create(var_17_4))
	end
end

function var_0_0.addEmptyBag(arg_18_0)
	local var_18_0 = CCSprite:create("res/ui/threeColorBag/empty.PNG")
	local var_18_1, var_18_2 = var_0_3(arg_18_0)

	arg_18_0:addChild(var_18_0, 10)
	var_18_0:setScale(0.8)
	var_18_0:setPosition(ccp(var_18_1, var_18_2))
end

function var_0_0.addJinNang1(arg_19_0, arg_19_1)
	local var_19_0 = CCSprite:create("res/ui/threeColorBag/fgj.png")

	arg_19_0:addChild(var_19_0, 300)

	local var_19_1, var_19_2 = var_0_3(arg_19_0)

	var_19_0:setPosition(var_19_1, var_19_2)

	local var_19_3 = var_0_5(var_0_1.bag[arg_19_1])

	var_19_0:runAction(CCSequence:create(var_19_3))
end

function var_0_0.addJinNang2(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = CCSprite:create("res/ui/threeColorBag/fgj.png")

	arg_20_0:addChild(var_20_0, 300)

	local var_20_1, var_20_2 = var_0_3(arg_20_0)

	var_20_0:setPosition(var_20_1 + var_0_1.bag[arg_20_1].x, var_20_2 + var_0_1.bag[arg_20_1].y)

	local var_20_3 = CCArray:create()

	var_20_3:addObject(CCMoveTo:create(0.4, ccp(var_20_1 + var_0_1.kuang[arg_20_2].x, var_20_2 + var_0_1.kuang[arg_20_2].y)))
	var_20_3:addObject(CCDelayTime:create(0.4))
	var_20_3:addObject(CCFadeOut:create(0.6))
	var_20_0:runAction(CCSequence:create(var_20_3))

	local var_20_4 = {}

	for iter_20_0 = 1, 3 do
		var_20_4[iter_20_0] = CCSprite:create("res/ui/threeColorBag/jingdu.png")

		arg_20_0:addChild(var_20_4[iter_20_0])
		var_20_4[iter_20_0]:setPosition(ccp(var_20_1 + var_0_1.kuang[arg_20_2].x, var_20_2 + var_0_1.kuang[arg_20_2].y))
		var_20_4[iter_20_0]:setScale(0.3)

		local var_20_5 = var_0_8(0.3 * iter_20_0)

		var_20_4[iter_20_0]:runAction(CCSequence:create(var_20_5))
	end
end

function var_0_0.getGemTip(arg_21_0, arg_21_1)
	local var_21_0 = CCLabelAtlas:create(tostring(arg_21_1), "res/ui/threeColorBag/09.png", 24.4, 39, 48)
	local var_21_1 = CCSprite:create("res/ui/threeColorBag/11.png")
	local var_21_2 = CCSprite:create("res/ui/common/text/resource/res_title_55.png")

	var_21_0:setAnchorPoint(ccp(0.5, 0.5))
	var_21_1:setAnchorPoint(ccp(0.5, 0.5))
	var_21_2:setAnchorPoint(ccp(0.5, 0.5))

	local var_21_3, var_21_4 = var_0_3(arg_21_0)

	var_21_0:setPosition(ccp(var_21_3 + 80, var_21_4))
	var_21_1:setPosition(ccp(var_21_3 + 12, var_21_4))
	var_21_2:setPosition(ccp(var_21_3 - 60, var_21_4))
	var_21_0:runAction(CCSequence:create(var_0_7()))
	var_21_1:runAction(CCSequence:create(var_0_7()))
	var_21_2:runAction(CCSequence:create(var_0_7()))
	arg_21_0:addChild(var_21_0, 120)
	arg_21_0:addChild(var_21_1, 120)
	arg_21_0:addChild(var_21_2, 120)
end

function var_0_0.getJinNangTip(arg_22_0, arg_22_1)
	local function var_22_0(arg_23_0)
		if arg_23_0 == 1 then
			return "res/ui/threeColorBag/05.png"
		elseif arg_23_0 == 2 then
			return "res/ui/threeColorBag/07.png"
		elseif arg_23_0 == 3 then
			return "res/ui/threeColorBag/06.png"
		end
	end

	local var_22_1 = CCLabelAtlas:create(tostring(1), "res/ui/threeColorBag/09.png", 24.4, 39, 48)
	local var_22_2 = CCSprite:create("res/ui/threeColorBag/11.png")
	local var_22_3 = CCSprite:create("res/ui/threeColorBag/17.png")

	var_22_1:setAnchorPoint(ccp(0.5, 0.5))
	var_22_2:setAnchorPoint(ccp(0.5, 0.5))
	var_22_3:setAnchorPoint(ccp(0.5, 0.5))

	local var_22_4, var_22_5 = var_0_3(arg_22_0)

	var_22_1:setPosition(ccp(var_22_4 + 54, var_22_5 - 38))
	var_22_2:setPosition(ccp(var_22_4 + 20, var_22_5 - 38))
	var_22_3:setPosition(ccp(var_22_4 - 34, var_22_5 - 38))
	var_22_1:runAction(CCSequence:create(var_0_7()))
	var_22_2:runAction(CCSequence:create(var_0_7()))
	var_22_3:runAction(CCSequence:create(var_0_7()))
	arg_22_0:addChild(var_22_1, 120)
	arg_22_0:addChild(var_22_2, 120)
	arg_22_0:addChild(var_22_3, 120)
end

function var_0_0.addxLian(arg_24_0, arg_24_1)
	local var_24_0 = {}

	if conf.language == "vie" then
		var_24_0.lianX = 10
	else
		var_24_0.lianX = 0
	end

	local function var_24_1(arg_25_0)
		if arg_25_0 == 1 then
			return "res/ui/threeColorBag/1.png"
		elseif arg_25_0 == 2 then
			return "res/ui/threeColorBag/2.png"
		elseif arg_25_0 == 3 then
			return "res/ui/threeColorBag/3.png"
		elseif arg_25_0 == 4 then
			return "res/ui/threeColorBag/4.png"
		elseif arg_25_0 == 5 then
			return "res/ui/threeColorBag/5.png"
		elseif arg_25_0 == 6 then
			return "res/ui/threeColorBag/6.png"
		elseif arg_25_0 == 7 then
			return "res/ui/threeColorBag/7.png"
		end
	end

	local var_24_2 = {
		num = {
			xcenter = 10,
			name = "num",
			type = "pic",
			ycenter = -10,
			pic = var_24_1(arg_24_1)
		},
		lian = {
			name = "lian",
			type = "pic",
			ycenter = -10,
			pic = "res/ui/threeColorBag/lian.png",
			xcenter = 27 + var_24_0.lianX
		}
	}

	autoUI.initUI(arg_24_0, var_24_2)
end

function var_0_0.addButton(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = CCScale9Sprite:createWithSpriteFrameName("btn_default_normal.png")
	local var_26_1 = CCScale9Sprite:createWithSpriteFrameName("btn_default_lighted.png")
	local var_26_2 = CCStrokeLabelTTF:create(arg_26_3, "Thonburi", 20, 2, ccc3(17, 22, 14))

	var_26_2:setColor(ccc3(235, 209, 167))

	local var_26_3 = CCControlButton:create(CCLabelTTF:create("", "Thonburi", 20), var_26_0)

	var_26_3:setBackgroundSpriteForState(var_26_1, CCControlStateHighlighted)

	local var_26_4, var_26_5 = var_0_3(arg_26_0)

	var_26_3:setPosition(ccp(var_26_4 + arg_26_1, var_26_5 + arg_26_2))
	var_26_3:setPreferredSize(CCSize(130, 50))
	var_26_3:addHandleOfControlEvent(arg_26_4, CCControlEventTouchUpInside)
	arg_26_0:addChild(var_26_3)
	var_26_2:setPosition(ccp(var_26_4 + arg_26_1, var_26_5 + arg_26_2))
	arg_26_0:addChild(var_26_2)
end

local function var_0_11()
	log.info("kaiqi:kicked")
	threeColorBag.control.request_openKit()
end

local function var_0_12()
	log.info("lingqu:kicked")

	if threeColorBag.data.kitNum == 1 then
		threeColorBag.control.request_recvKit()
	else
		threeColorBag.control.request_recvGem()
	end
end

local function var_0_13()
	log.info("jixu:kicked")

	if threeColorBag.data.onlySendInfo == true then
		threeColorBag.control.request_threeColorBagInfo()

		threeColorBag.data.onlySendInfo = false
	else
		threeColorBag.control.request_continueCollect()
	end
end

local function var_0_14()
	log.info("baoXiangkaiqi:kicked")
	threeColorBag.control.request_openKit()
end

local function var_0_15()
	log.info("baoXiangLingQu:kicked")
	threeColorBag.control.request_recvGem()
end

local function var_0_16()
	log.info("baoXiangJiXu:kicked")
	threeColorBag.control.request_continueCollect()
end

function var_0_0.addLayer5(arg_33_0, arg_33_1)
	local var_33_0
	local var_33_1
	local var_33_2

	if arg_33_1.isSameColor ~= true then
		var_33_0 = "res/ui/threeColorBag/xiang1.png"
		var_33_1 = "res/ui/threeColorBag/04.png"
		var_33_2 = language.get(320305)
		threeColorBag.data.isSpecialBox = false
	else
		var_33_0 = "res/ui/threeColorBag/xiang2.png"
		var_33_1 = "res/ui/threeColorBag/03.png"
		var_33_2 = language.get(320306)
		threeColorBag.data.isSpecialBox = true
	end

	local var_33_3 = {
		baoXiang = {
			xcenter = 5,
			name = "baoXiang",
			type = "pic",
			ycenter = 215,
			pic = var_33_0
		},
		flash = {
			xcenter = 0,
			name = "flash",
			type = "pic",
			ycenter = 80,
			pic = "res/ui/threeColorBag/gx.png"
		},
		zuHe = {
			xcenter = 0,
			name = "zuHe",
			type = "pic",
			ycenter = 80,
			pic = var_33_1
		},
		word = {
			xcenter = 0,
			fontSize = 20,
			type = "label",
			ycenter = -50,
			font = "Thonburi",
			strokeSize = 2,
			text = var_33_2,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}
	}
	local var_33_4 = autoUI.initUI(arg_33_0, var_33_3)

	var_0_0.addButton(arg_33_0, 0, -170, language.get(320312), var_0_14)
	var_33_4.flash:runAction(CCSequence:create(var_0_9(2)))
	var_33_4.zuHe:runAction(CCSequence:create(var_0_9(2)))
	var_33_4.baoXiang:runAction(CCSequence:create(var_0_10()))
end

function var_0_0.addLayer6(arg_34_0, arg_34_1)
	local var_34_0
	local var_34_1

	if threeColorBag.data.isSpecialBox ~= true then
		var_34_0 = "res/ui/threeColorBag/xiang1-1.png"
		var_34_1 = language.get(320305)
	else
		var_34_0 = "res/ui/threeColorBag/xiang2-2.png"
		var_34_1 = language.get(320306)
	end

	local var_34_2 = {
		baoXiang = {
			xcenter = 5,
			name = "baoXiang",
			type = "pic",
			ycenter = 15,
			pic = var_34_0
		},
		word = {
			xcenter = 0,
			fontSize = 20,
			type = "label",
			ycenter = -50,
			font = "Thonburi",
			strokeSize = 2,
			text = var_34_1,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}
	}

	autoUI.initUI(arg_34_0, var_34_2)
	var_0_0.addWord2(arg_34_0, arg_34_1.rewardsInfo[2].rewards[1].num, -1, 0, 110)
	var_0_0.getGemTip(arg_34_0, arg_34_1.rewardsInfo[2].rewards[1].num)
	var_0_0.addButton(arg_34_0, 0, -170, language.get(320309), var_0_15)
	var_0_0.addGem1(arg_34_0, 18, true)
end

function var_0_0.addLayer7(arg_35_0, arg_35_1)
	local var_35_0
	local var_35_1

	if threeColorBag.data.isSpecialBox ~= true then
		var_35_0 = "res/ui/threeColorBag/xiang1-1.png"
		var_35_1 = language.get(320305)
	else
		var_35_0 = "res/ui/threeColorBag/xiang2-2.png"
		var_35_1 = language.get(320306)
	end

	local var_35_2 = {
		baoXiang = {
			xcenter = 5,
			name = "baoXiang",
			type = "pic",
			ycenter = 15,
			pic = var_35_0
		},
		word = {
			xcenter = 0,
			fontSize = 20,
			type = "label",
			ycenter = -50,
			font = "Thonburi",
			strokeSize = 2,
			text = var_35_1,
			color = ccc3(235, 209, 167),
			strokeColor = ccc3(22, 18, 13)
		}
	}

	autoUI.initUI(arg_35_0, var_35_2)
	var_0_0.addButton(arg_35_0, 0, -170, language.get(320307), var_0_16)
	var_0_0.addGem2(arg_35_0, 18, true)
end

function var_0_0.addLayer(arg_36_0, arg_36_1)
	local var_36_0 = var_0_0.table.baoshikuang
	local var_36_1 = arg_36_1.action.data

	var_36_0:removeAllChildrenWithCleanup(true)

	if arg_36_0 == 1 then
		var_0_0.addCircleExp(var_36_0, var_36_1.curExp / var_36_1.fullExp, true)

		for iter_36_0 = 1, 3 do
			var_0_0.addBags(var_36_0, var_36_1.comboList[iter_36_0].color, var_0_1.kuang[iter_36_0].x, var_0_1.kuang[iter_36_0].y, var_36_1.comboList[iter_36_0].isMatch, var_36_1.isSameColor)
		end

		var_0_0.addWord1(var_36_0, 1, -100, -102)
		var_0_0.addXiaoKuang(var_36_0, 0, -170, var_36_1.curExp, var_36_1.fullExp)
	elseif arg_36_0 == 2 then
		var_0_0.addCircleExp(var_36_0, 1, true)
		var_0_0.addxLian(var_36_0, var_36_1.kitSeq)

		for iter_36_1 = 1, 3 do
			var_0_0.addBags(var_36_0, var_36_1.comboList[iter_36_1].color, var_0_1.kuang[iter_36_1].x, var_0_1.kuang[iter_36_1].y, var_36_1.comboList[iter_36_1].isMatch, var_36_1.isSameColor)
		end

		var_0_0.addWord1(var_36_0, 1, -100, -102)
		var_0_0.addButton(var_36_0, 0, -170, language.get(320308), var_0_11)
	elseif arg_36_0 == 3 then
		var_0_0.addCircleExp(var_36_0, 1, false)
		var_0_0.addEmptyBag(var_36_0)

		for iter_36_2 = 1, 3 do
			var_0_0.addBags(var_36_0, var_36_1.comboList[iter_36_2].color, var_0_1.kuang[iter_36_2].x, var_0_1.kuang[iter_36_2].y, var_36_1.comboList[iter_36_2].isMatch, var_36_1.isSameColor)
		end

		var_0_0.addGem1(var_36_0, var_36_1.rewardsInfo[1].rewards[1].num / 5)

		local var_36_2 = 0

		if var_36_1.kitNum ~= 0 then
			threeColorBag.data.kitPos = math.random(1, 5)

			var_0_0.addJinNang1(var_36_0, threeColorBag.data.kitPos)
			var_0_0.getJinNangTip(var_36_0)

			var_36_2 = 1
		end

		var_0_0.addWord1(var_36_0, 1, -100, -102)
		var_0_0.addWord2(var_36_0, var_36_1.rewardsInfo[1].rewards[1].num, var_36_2, 0, 110)
		var_0_0.getGemTip(var_36_0, var_36_1.rewardsInfo[1].rewards[1].num)
		var_0_0.addButton(var_36_0, 0, -170, language.get(320309), var_0_12)
	elseif arg_36_0 == 4 then
		var_0_0.addCircleExp(var_36_0, 1, false)

		for iter_36_3 = 1, 3 do
			var_0_0.addBags(var_36_0, var_36_1.comboList[iter_36_3].color, var_0_1.kuang[iter_36_3].x, var_0_1.kuang[iter_36_3].y, var_36_1.comboList[iter_36_3].isMatch, var_36_1.isSameColor)
		end

		var_0_0.addWord1(var_36_0, 1, -100, -102)
		var_0_0.addEmptyBag(var_36_0)

		if arg_36_1.action.data.comboList[1].isMatch == true and arg_36_1.action.data.comboList[2].isMatch == true and arg_36_1.action.data.comboList[3].isMatch == true then
			var_0_0.addButton(var_36_0, 0, -170, language.get(320310), var_0_13)
		else
			var_0_0.addButton(var_36_0, 0, -170, language.get(320311), var_0_13)
		end

		if threeColorBag.data.num > 0 then
			var_0_0.addGem2(var_36_0, threeColorBag.data.num / 5)

			threeColorBag.data.num = -1
		end

		if threeColorBag.data.kitColor > 0 then
			var_0_0.addJinNang2(var_36_0, threeColorBag.data.kitPos, threeColorBag.data.kitDes)

			threeColorBag.data.kitColor = -1
		end
	elseif arg_36_0 == 5 then
		var_0_0.addLayer5(var_36_0, var_36_1)
	elseif arg_36_0 == 6 then
		var_0_0.addLayer6(var_36_0, var_36_1)
	elseif arg_36_0 == 7 then
		var_0_0.addLayer7(var_36_0, var_36_1)
	end
end

function var_0_0.show()
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	local var_37_0 = createBaseLayer()

	var_0_0.table = autoUI.initUI(var_37_0, getThreeColorData())
	var_0_0.table.layer = var_37_0

	local var_37_1 = var_0_0.table.closeItem

	var_37_1:setScale(2)

	local var_37_2 = var_37_1:getContentSize()
	local var_37_3 = var_0_0.table.bg:getContentSize()
	local var_37_4 = visibleSize.width / 2 + var_37_3.width / 2 - var_37_2.width / 2 - 30
	local var_37_5 = visibleSize.height / 2 + var_37_3.height / 2 + var_37_2.height / 2 - 20

	var_37_1:setPosition(ccp(var_37_4, var_37_5))

	local function var_37_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_37_0, true)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if globalAction_updateSpecialEffect then
			globalAction_updateSpecialEffect()
		end
	end

	threeColorBag.data.kitType = 0
	threeColorBag.data.num = 0
	threeColorBag.data.kitNum = 0
	threeColorBag.data.kitColor = 0
	threeColorBag.data.kitDes = 1
	threeColorBag.data.kitPos = 1
	threeColorBag.data.currentSate = 0
	threeColorBag.data.isSpecialBox = false
	threeColorBag.data.onlySendInfo = false

	threeColorBag.control.request_threeColorBagInfo()
	var_0_0.table.closeItem:registerScriptTapHandler(var_37_6)

	local function var_37_7(arg_39_0, arg_39_1, arg_39_2)
		if arg_39_0 == CCTOUCHBEGAN then
			return true
		elseif arg_39_0 == CCTOUCHMOVED then
			return true
		elseif arg_39_0 == CCTOUCHENDED then
			return true
		end
	end

	var_37_0:setTouchEnabled(true)
	var_37_0:registerScriptTouchHandler(var_37_7, false, true)

	local var_37_8 = smgr.getLayer("topLayer")

	var_37_8:removeAllChildrenWithCleanup(true)
	var_37_8:addChild(var_37_0)
	var_37_0:setVisible(true)
end
