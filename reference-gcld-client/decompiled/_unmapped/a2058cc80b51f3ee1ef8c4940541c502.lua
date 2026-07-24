local var_0_0 = {}

var_0_0.leftTimeX = 0
var_0_0.leftTimeY = -28
var_0_0.cityNameX = 0
var_0_0.goBtnX = 0
var_0_0.buyBtnFntSize = 0
var_0_0.beastStateScale = 1

local var_0_1 = {
	[4] = {
		type = 4
	},
	[21] = {
		type = 7
	},
	[110] = {
		pic = "icon_tj_h.png",
		type = 110
	},
	[5] = {
		pic = "icon_jy_h.png",
		type = 6
	},
	[19] = {
		pic = "icon_jb_h.png",
		type = 19
	},
	[40] = {
		pic = "icon_hjc_h.png",
		type = 40
	},
	[42] = {
		pic = "icon_mbl_h.png",
		type = 5
	},
	[81] = {
		pic = "icon_tj_h.png",
		type = 24
	},
	[102] = {
		pic = "icon_jiebing_h.png",
		type = 41
	},
	[100] = {
		pic = "icon_dq_h.png",
		type = 100
	}
}
local var_0_2 = {
	idle1 = {
		frame = "ns_idle1_%d.png",
		num = 4,
		delay = 0.2
	},
	idle2 = {
		frame = "ns_idle2_%d.png",
		num = 14,
		delay = 0.15
	},
	run = {
		frame = "ns_run%d.png",
		num = 8,
		delay = 0.1
	},
	scare = {
		frame = "ns_scare%d.png",
		num = 14,
		delay = 0.15
	},
	scare_shuiqiang = {},
	scare_shuitong = {},
	shuiQiangAnim = {
		frame = "sq00%02d.png",
		num = 20,
		delay = 0.0625
	},
	shuiTongAnim = {
		frame = "st00%02d.png",
		num = 29,
		delay = 0.0625
	}
}
local var_0_3 = ""
local var_0_4 = 0
local var_0_5 = 1
local var_0_6 = 2
local var_0_7 = 100000
local var_0_8 = 200000
local var_0_9 = tool.hexToRgb("#D9EDC5")
local var_0_10 = ccc3(0, 180, 0)
local var_0_11 = colorQuality[5]
local var_0_12 = colorQuality[4]
local var_0_13 = colorQuality[2]
local var_0_14 = class("Beast", function()
	return createBaseLayer()
end)

var_0_14.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = true,
		path = "psj_bg.png"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 470,
			type = "sprite",
			pic = {
				frame = true,
				path = "psj_biaotizi_psj.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			type = "label",
			style = "label_warlock",
			x = 730 + var_0_0.leftTimeX,
			y = 460 + var_0_0.leftTimeY,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_11
		},
		{
			x = 5,
			y = 370,
			type = "sprite",
			pic = {
				frame = true,
				path = "psj_wenzi_jianbiandi_1.png"
			},
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "troopInfoLabel",
			type = "label",
			textId = "135221_psj",
			style = "label_warlock",
			y = 382,
			x = 10,
			anchorPoint = ccp(0, 0.5),
			color = var_0_9
		},
		{
			fontSize = 20,
			name = "infoLb",
			type = "label",
			text = "",
			style = "label_warlock",
			y = 358,
			x = 10,
			anchorPoint = ccp(0, 0.5),
			color = var_0_9
		},
		{
			y = 382,
			name = "btn_city",
			style = "button_yel1",
			type = "button",
			visible = false,
			scale = 0.7,
			x = 250 + var_0_0.cityNameX,
			children = {
				{
					fontSize = 26,
					style = "label_warlock",
					y = 29,
					type = "label",
					x = 49,
					textId = 420008,
					color = var_0_9
				}
			}
		},
		{
			fontSize = 20,
			name = "Lb_cityName",
			visible = false,
			type = "label",
			text = "",
			style = "label_warlock",
			y = 382,
			x = 180 + var_0_0.goBtnX,
			color = var_0_10
		},
		{
			x = 912,
			name = "btn_bg",
			y = 62,
			type = "sprite",
			pic = {
				frame = true,
				path = "psj_btn_jianbiandi.png"
			},
			anchorPoint = ccp(1, 0.5),
			children = {
				{
					x = 145,
					y = 70,
					type = "sprite",
					pic = {
						frame = true,
						path = "psj_btn_bg.png"
					}
				},
				{
					x = 239,
					y = 70,
					type = "sprite",
					pic = {
						frame = true,
						path = "psj_btn_bg.png"
					}
				}
			}
		},
		{
			text = "100",
			name = "crackerLb",
			y = 18,
			type = "label",
			style = "label_warlock",
			x = 773,
			fontSize = 22,
			color = var_0_9
		},
		{
			fontSize = 22,
			name = "goldLb",
			type = "label",
			text = "100",
			style = "label_warlock",
			y = 18,
			x = 882,
			color = var_0_12,
			children = {
				{
					x = -30,
					y = -2,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					}
				}
			}
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 470,
			type = "button",
			x = 860
		},
		{
			y = 160,
			name = "btn_buyBeast",
			style = "button_yel3",
			type = "button",
			visible = true,
			x = 458,
			children = {
				{
					name = "btnBuyLb",
					width = 120,
					type = "label",
					height = 0,
					textId = "135038_psj",
					style = "label_warlock",
					y = 27,
					x = 70,
					fontSize = 22 + var_0_0.buyBtnFntSize,
					color = var_0_9
				},
				{
					x = 55,
					y = 60,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					}
				},
				{
					text = "",
					name = "buyBeastGoldLb",
					y = 60,
					type = "label",
					style = "label_warlock",
					x = 85,
					fontSize = 22,
					color = var_0_12
				},
				{
					x = 70,
					name = "state",
					y = 140,
					type = "sprite",
					pic = {
						frame = true,
						path = "ns_tit_xqyfstlphjhyf.png"
					},
					scale = var_0_0.beastStateScale
				}
			}
		}
	}
}
var_0_14.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = "135238_psj",
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_9
		}
	}
}
var_0_14.tipFrame_talk = {
	name = "tipFrame_talk",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "psj_duihuakuang.png"
	},
	anchorPoint = ccp(0, 0),
	middleRect = CCRectMake(70, 30, 120, 80),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg_talk",
			type = "label",
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 1),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop,
			color = var_0_9
		}
	}
}

function var_0_14.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getBeastActivity)
end

function var_0_14.onGoToCity(arg_4_0, arg_4_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_4_1)
end

function var_0_14.addReward(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.rewardNode then
		arg_5_0.rewardNode:stopAllActions()
	else
		arg_5_0.rewardNode = CCNode:create()

		arg_5_0.view.widgets.panel:addChild(arg_5_0.rewardNode, 100)
	end

	arg_5_0.reward = arg_5_0.reward or {}

	local function var_5_0(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = {}
		local var_6_1 = {
			id = var_0_1[arg_6_0].type,
			value = arg_6_1,
			gemLevel = arg_6_2
		}

		table.insert(var_6_0, var_6_1)
		globalAction_gotResource(var_6_0)
	end

	local function var_5_1(arg_7_0)
		arg_5_0.rewardNode:addChild(arg_7_0)

		local var_7_0 = math.random(280, 640)
		local var_7_1 = math.random(70, 130)

		arg_7_0:setPosition(ccp(460, 310))
		arg_7_0:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_7_0, var_7_1))))
	end

	local var_5_2 = 5
	local var_5_3 = 0.5

	for iter_5_0 = 1, #arg_5_1 do
		local var_5_4 = arg_5_1[iter_5_0]

		if var_5_4.type == 5 then
			for iter_5_1 = 1, 10 do
				local var_5_5 = CCSprite:createWithSpriteFrameName(var_0_1[var_5_4.type].pic)

				table.insert(arg_5_0.reward, {
					obj = var_5_5,
					type = var_5_4.type,
					value = var_5_4.value / 10,
					cd = var_5_2 + var_5_3 * (iter_5_1 - 1)
				})
				var_5_1(var_5_5)
			end
		elseif var_5_4.type == 4 then
			local var_5_6 = arg_5_2 and 25 or 1

			for iter_5_2 = 1, var_5_6 do
				local var_5_7 = CCSprite:create("res/ui/task/get_icon_iron.png")

				table.insert(arg_5_0.reward, {
					obj = var_5_7,
					type = var_5_4.type,
					value = var_5_4.value / var_5_6,
					cd = var_5_2 + var_5_3 * (iter_5_2 - 1)
				})
				var_5_1(var_5_7)
			end
		elseif var_5_4.type == 21 then
			local var_5_8 = 1

			if var_5_4.lv >= 1 and var_5_4.lv <= 16 then
				var_5_8 = math.ceil(var_5_4.lv / 4)
			end

			local var_5_9 = arg_5_2 and var_5_4.value >= 25 and 25 or 1

			for iter_5_3 = 1, var_5_9 do
				local var_5_10 = CCSprite:create(string.format("res/ui/activity/gemsActivity/new/gem_a%d.png", var_5_8))

				table.insert(arg_5_0.reward, {
					obj = var_5_10,
					type = var_5_4.type,
					value = var_5_4.value / var_5_9,
					lv = var_5_4.lv,
					cd = var_5_2 + var_5_3 * (iter_5_3 - 1)
				})
				var_5_1(var_5_10)
			end
		elseif var_0_1[var_5_4.type] then
			local var_5_11 = CCSprite:createWithSpriteFrameName(var_0_1[var_5_4.type].pic)

			table.insert(arg_5_0.reward, {
				obj = var_5_11,
				type = var_5_4.type,
				value = var_5_4.value,
				cd = var_5_2
			})
			var_5_1(var_5_11)
		else
			log.info(string.format("unknown reward type:%s", var_5_4.type))
		end
	end

	local var_5_12 = CCArray:create()

	var_5_12:addObject(CCDelayTime:create(var_5_3))
	var_5_12:addObject(CCCallFuncN:create(function()
		log.info("zhu@@@size", #arg_5_0.reward)

		if #arg_5_0.reward > 0 then
			for iter_8_0 = 1, #arg_5_0.reward do
				local var_8_0 = arg_5_0.reward[iter_8_0]

				var_8_0.cd = var_8_0.cd - var_5_3

				if var_8_0.cd <= 0 then
					tolua.cast(var_8_0.obj, "CCSprite"):removeFromParentAndCleanup(true)
					var_5_0(var_8_0.type, var_8_0.value, var_8_0.lv)
				end
			end

			local var_8_1 = arg_5_0.reward

			arg_5_0.reward = {}

			for iter_8_1 = 1, #var_8_1 do
				local var_8_2 = var_8_1[iter_8_1]

				if var_8_2.cd > 0 then
					table.insert(arg_5_0.reward, var_8_2)
				end
			end
		else
			arg_5_0.rewardNode:stopAllActions()
		end
	end))

	local var_5_13 = CCSequence:create(var_5_12)

	arg_5_0.rewardNode:runAction(CCRepeatForever:create(var_5_13))

	local var_5_14 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_5_14:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_9_1, arg_9_2)

			if arg_5_0.reward and #arg_5_0.reward > 0 then
				for iter_9_0 = 1, #arg_5_0.reward do
					local var_9_0 = arg_5_0.reward[iter_9_0]
					local var_9_1 = tolua.cast(arg_5_0.reward[iter_9_0].obj, "CCSprite")

					if tool.checkIfTouch(var_9_1, arg_9_1, arg_9_2) then
						var_5_0(var_9_0.type, var_9_0.value, var_9_0.lv)
						var_9_1:removeFromParentAndCleanup(true)
						table.remove(arg_5_0.reward, iter_9_0)

						return true
					end
				end
			end

			return false
		elseif arg_9_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_9_1, arg_9_2)

			return true
		elseif arg_9_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_9_1, arg_9_2)

			return true
		end
	end, false, true)
	var_5_14:setTouchEnabled(true)
	arg_5_0.view.widgets.panel:addChild(var_5_14)

	if arg_5_0.maskLayer then
		arg_5_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_5_0.maskLayer = var_5_14
end

function var_0_14.onGetBeastReward(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0)
		if type(arg_11_0) ~= "number" then
			return
		end

		local var_11_0 = CCLabelAtlas:create(arg_11_0, "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

		var_11_0:setAnchorPoint(ccp(0.5, 0.5))

		local var_11_1 = CCSprite:createWithSpriteFrameName("blood_ded_subt.png")
		local var_11_2 = createRichNode({
			var_11_1,
			var_11_0
		}, 0.5)

		arg_10_0.view.widgets.panel:addChild(var_11_2, 100)
		var_11_2:setPosition(ccp(458, 200))
		var_11_0:setOpacity(0)
		var_11_1:setOpacity(0)

		for iter_11_0 = 1, 2 do
			local var_11_3 = CCArray:create()

			var_11_3:addObject(CCFadeIn:create(0.3))
			var_11_3:addObject(CCMoveBy:create(0.3, ccp(0, 20)))

			if iter_11_0 == 1 then
				var_11_3:addObject(CCDelayTime:create(0.3))
				var_11_3:addObject(CCCallFuncN:create(function()
					var_11_2:removeFromParentAndCleanup(true)
				end))
			end

			local var_11_4 = CCSequence:create(var_11_3)

			if iter_11_0 == 1 then
				var_11_0:runAction(var_11_4)
			else
				var_11_1:runAction(var_11_4)
			end
		end
	end

	local function var_10_1(arg_13_0)
		local var_13_0

		if arg_10_1 == 1 then
			var_13_0 = var_0_7

			arg_10_0:showCrackerEffect()
			arg_10_0:showBeastAct("scare_shuiqiang")

			arg_10_0.info.cracker = arg_10_0.info.cracker - 5

			arg_10_0.view.widgets.crackerLb:setString(arg_10_0.info.cracker)
		elseif arg_10_1 == 2 then
			var_13_0 = var_0_8

			arg_10_0:showBombEffect()
			arg_10_0:showBeastAct("scare_shuitong")
		end

		arg_10_0.beastBlood = arg_10_0.beastBlood - var_13_0

		local var_13_1 = arg_13_0.action.data.lastStraw and arg_13_0.action.data.lastStraw == 1

		if var_13_1 then
			arg_10_0:showBeastAct("run")
		else
			var_10_0(var_13_0)
		end

		if arg_13_0.action.data.rewards then
			arg_10_0:addReward(arg_13_0.action.data.rewards, var_13_1)
		end
	end

	local function var_10_2()
		cmgr.sendRequest(var_10_1, actions.getBeastReward, arg_10_1)
	end

	if arg_10_1 == 1 then
		if arg_10_0.info.cracker >= 5 then
			var_10_2()
		else
			arg_10_0:showTip(var_0_6)
		end
	elseif arg_10_1 == 2 then
		messageBox.showChargeWin(language.get(10003), language.get("135224_psj", arg_10_0.info.thunderGold), "buyCrack", var_10_2)
	end
end

function var_0_14.onBuyBeast(arg_15_0)
	local function var_15_0(arg_16_0)
		arg_15_0:refresh()
	end

	messageBox.confirm(language.get("135225_psj", arg_15_0.info.beastGold), function()
		cmgr.sendRequest(var_15_0, actions.buyBeast)
	end)
end

function var_0_14.onRecoverBeastCd(arg_18_0)
	local function var_18_0(arg_19_0)
		arg_18_0:refresh()
	end

	messageBox.confirm(language.get("135225_psj", arg_18_0.info.beastGold), function()
		cmgr.sendRequest(var_18_0, actions.recoverBeastCd)
	end)
end

function var_0_14.getAct(arg_21_0, arg_21_1)
	if arg_21_0.animate[arg_21_1] then
		return arg_21_0.animate[arg_21_1]
	else
		local var_21_0 = var_0_2[arg_21_1]
		local var_21_1 = CCArray:create()

		for iter_21_0 = 1, var_21_0.num do
			local var_21_2 = CCSprite:createWithSpriteFrameName(string.format(var_21_0.frame, iter_21_0))

			var_21_1:addObject(var_21_2:displayFrame())
		end

		local var_21_3 = CCAnimation:createWithSpriteFrames(var_21_1, var_21_0.delay)
		local var_21_4 = CCAnimate:create(var_21_3)

		var_21_4:retain()

		arg_21_0.animate[arg_21_1] = var_21_4

		return var_21_4
	end
end

function var_0_14.showBeastAct(arg_22_0, arg_22_1)
	if var_0_3 == arg_22_1 and var_0_3 ~= "" then
		return
	else
		var_0_3 = arg_22_1
	end

	log.info("showBeastAct:", arg_22_1, var_0_3)

	if not var_0_2[arg_22_1] and arg_22_1 ~= "sleep" then
		return
	end

	if arg_22_0.beastNode then
		arg_22_0.beastNode:stopAllActions()
		arg_22_0.beast:stopAllActions()
	else
		arg_22_0.beastNode = CCNode:create()

		arg_22_0.beastLayer:addChild(arg_22_0.beastNode)

		arg_22_0.beast = CCSprite:createWithSpriteFrameName("psj_xiaoqian.png")

		arg_22_0.beast:setScale(0.9)
		arg_22_0.beast:setAnchorPoint(ccp(0.5, 0))
		arg_22_0.beast:setPosition(ccp(-5, 0))
		arg_22_0.beastNode:addChild(arg_22_0.beast)

		local var_22_0 = CCProgressTimer:create(CCSprite:createWithSpriteFrameName("psj_jindutiao_1.png"))

		arg_22_0.beastNode:addChild(var_22_0)

		arg_22_0.blood = var_22_0

		var_22_0:setType(kCCProgressTimerTypeBar)
		var_22_0:setMidpoint(ccp(0, 0.5))
		var_22_0:setBarChangeRate(ccp(1, 0))
		var_22_0:setPercentage(100 * arg_22_0.beastBlood / arg_22_0.info.totalBlood)
		var_22_0:setPosition(ccp(-18, 320))

		local var_22_1 = CCSprite:createWithSpriteFrameName("psj_jindutiao_2.png")

		var_22_1:setAnchorPoint(ccp(0, 0))
		var_22_0:addChild(var_22_1, -1)

		arg_22_0.tipNode = CCNode:create()

		arg_22_0.beastNode:addChild(arg_22_0.tipNode)
		arg_22_0.tipNode:setVisible(false)
	end

	if arg_22_1 == "sleep" then
		arg_22_0.beastNode:setVisible(false)
	else
		arg_22_0.beastNode:setVisible(true)
		arg_22_0.beastNode:setPosition(ccp(457, 0))

		if arg_22_1 == "idle1" or arg_22_1 == "idle2" then
			arg_22_0.beast:setPosition(ccp(-5, 0))

			local var_22_2 = CCArray:create()

			var_22_2:addObject(CCDelayTime:create(2))
			var_22_2:addObject(CCCallFuncN:create(function()
				local var_23_0 = "idle" .. (math.random(1, 3) > 1 and 1 or 2)

				var_0_3 = ""

				arg_22_0:showBeastAct(var_23_0)
			end))

			local var_22_3 = CCSequence:create(var_22_2)

			arg_22_0.beast:runAction(var_22_3)
		elseif arg_22_1 == "scare_shuiqiang" then
			local var_22_4 = CCArray:create()

			for iter_22_0 = 1, 8 do
				local var_22_5 = math.mod(iter_22_0, 2)
				local var_22_6 = (2 + math.random(1, 3) * var_22_5) * (-1)^var_22_5
				local var_22_7 = -1 * var_22_6

				var_22_4:addObject(CCMoveBy:create(0.1, ccp(var_22_6, var_22_7)))
			end

			var_22_4:addObject(CCMoveTo:create(0.3, ccp(-5, 0)))
			var_22_4:addObject(CCCallFuncN:create(function()
				var_0_3 = ""

				arg_22_0:showBeastAct("idle1")
			end))

			local var_22_8 = CCSequence:create(var_22_4)

			arg_22_0.beast:runAction(var_22_8)
		elseif arg_22_1 == "scare_shuitong" then
			local var_22_9 = CCArray:create()

			var_22_9:addObject(CCDelayTime:create(0.2))
			var_22_9:addObject(CCMoveBy:create(0.1, ccp(0, -10)))
			var_22_9:addObject(CCMoveTo:create(0.3, ccp(-5, 0)))
			var_22_9:addObject(CCCallFuncN:create(function()
				var_0_3 = ""

				arg_22_0:showBeastAct("idle1")
			end))

			local var_22_10 = CCSequence:create(var_22_9)

			arg_22_0.beast:runAction(var_22_10)
		elseif arg_22_1 == "run" then
			arg_22_0:refresh()
		end

		arg_22_0.blood:setPercentage(100 * arg_22_0.beastBlood / arg_22_0.info.totalBlood)

		if arg_22_1 == "idle1" then
			var_0_4 = var_0_4 + 1
		elseif arg_22_1 == "idle2" then
			var_0_4 = var_0_4 + 2
		else
			var_0_4 = 0
		end

		if arg_22_0.tipNode:isVisible() and arg_22_1 ~= "scare_shuiqiang" and arg_22_1 ~= "scare_shuitong" then
			var_0_4 = 0
		else
			arg_22_0.tipNode:removeAllChildrenWithCleanup(true)

			if arg_22_1 ~= "idle1" and arg_22_1 ~= "idle2" or not (var_0_4 <= 10) then
				local var_22_11 = {}

				uiutil.initWidgets(var_22_11, arg_22_0.tipFrame_talk)
				arg_22_0.tipNode:addChild(var_22_11.widgets.tipFrame_talk)
				var_22_11.widgets.tipMsg_talk:setDimensions(CCSizeMake(200, 0))

				local var_22_12 = ""

				if arg_22_1 == "idle1" or arg_22_1 == "idle2" then
					var_0_4 = 0

					local var_22_13 = {
						"135229_psj",
						"135230_psj",
						"135231_psj",
						"135232_psj",
						"135233_psj"
					}

					var_22_12 = language.get(var_22_13[math.random(1, #var_22_13)])
				elseif arg_22_1 == "scare_shuiqiang" or arg_22_1 == "scare_shuitong" then
					local var_22_14 = {
						"135234_psj",
						"135235_psj"
					}

					var_22_12 = language.get(var_22_14[math.random(1, #var_22_14)])
				elseif arg_22_1 == "run" then
					var_22_12 = language.get("135236_psj")
				end

				var_22_11.widgets.tipMsg_talk:setString(var_22_12)

				local var_22_15 = var_22_11.widgets.tipMsg_talk:getContentSize().width
				local var_22_16 = var_22_11.widgets.tipMsg_talk:getContentSize().height

				var_22_11.widgets.tipFrame_talk:setPreferredSize(CCSizeMake(var_22_15 + 30, var_22_16 + 50))
				var_22_11.widgets.tipFrame_talk:setPosition(ccp(30, 280))
				var_22_11.widgets.tipMsg_talk:setPosition(ccp(15, var_22_16 + 40))
				var_22_11.widgets.tipFrame_talk:setVisible(true)

				local var_22_17 = CCArray:create()

				var_22_17:addObject(CCDelayTime:create(5))
				var_22_17:addObject(CCCallFuncN:create(function()
					var_22_11.widgets.tipFrame_talk:removeFromParentAndCleanup(true)
					arg_22_0.tipNode:setVisible(false)
				end))

				local var_22_18 = CCSequence:create(var_22_17)

				arg_22_0.tipNode:setVisible(true)
				var_22_11.widgets.tipFrame_talk:runAction(var_22_18)
			end
		end
	end
end

function var_0_14.showCrackerEffect(arg_27_0)
	if arg_27_0.crackerNode then
		arg_27_0.crackerNode:removeAllChildrenWithCleanup(true)
	else
		arg_27_0.crackerNode = CCNode:create()

		arg_27_0.view.widgets.panel:addChild(arg_27_0.crackerNode, 100)
	end

	local var_27_0 = arg_27_0:getAct("shuiQiangAnim")
	local var_27_1 = CCArray:create()

	var_27_1:addObject(var_27_0)
	var_27_1:addObject(CCCallFuncN:create(function(arg_28_0)
		arg_28_0:removeFromParentAndCleanup(true)
	end))

	local var_27_2 = CCSequence:create(var_27_1)
	local var_27_3 = CCSprite:create()

	arg_27_0.crackerNode:addChild(var_27_3)
	var_27_3:setPosition(480, 170)
	var_27_3:runAction(var_27_2)
end

function var_0_14.showBombEffect(arg_29_0)
	if arg_29_0.bombNode then
		arg_29_0.bombNode:removeAllChildrenWithCleanup(true)
	else
		arg_29_0.bombNode = CCNode:create()

		arg_29_0.view.widgets.panel:addChild(arg_29_0.bombNode, 100)
	end

	local var_29_0 = arg_29_0:getAct("shuiTongAnim")
	local var_29_1 = CCArray:create()

	var_29_1:addObject(var_29_0)
	var_29_1:addObject(CCCallFuncN:create(function(arg_30_0)
		arg_30_0:removeFromParentAndCleanup(true)
	end))

	local var_29_2 = CCSequence:create(var_29_1)
	local var_29_3 = CCSprite:create()

	arg_29_0.bombNode:addChild(var_29_3)
	var_29_3:setPosition(480, 170)
	var_29_3:runAction(var_29_2)
end

local function var_0_15(arg_31_0)
	local var_31_0 = arg_31_0 / 1000
	local var_31_1 = math.floor(var_31_0 / 3600)
	local var_31_2 = var_31_0 % 3600
	local var_31_3 = math.floor(var_31_2 / 60)
	local var_31_4 = var_31_2 % 60

	return string.format("%02d:%02d", var_31_3, var_31_4)
end

function var_0_14.showPanel(arg_32_0, arg_32_1)
	arg_32_0.info = arg_32_1

	local var_32_0 = arg_32_1.totalBlood > 0

	arg_32_0.beastBlood = arg_32_1.totalBlood - arg_32_1.getBlood

	arg_32_0.view.widgets.btn_city:setVisible(false)
	arg_32_0.view.widgets.Lb_cityName:setVisible(false)

	if arg_32_0.armyTimerLabel then
		arg_32_0.armyTimerLabel:removeFromParentAndCleanup(true)

		arg_32_0.armyTimerLabel = nil
	end

	if arg_32_1.cities and #arg_32_1.cities >= 1 then
		arg_32_0.view.widgets.btn_city:addHandleOfControlEvent(function()
			log.info("btn_city", arg_32_1.cities[1].cityId)
			arg_32_0:onGoToCity(arg_32_1.cities[1].cityId)
		end, CCControlEventTouchUpInside)
		arg_32_0.view.widgets.btn_city:setVisible(true)
		arg_32_0.view.widgets.Lb_cityName:setVisible(true)
		arg_32_0.view.widgets.Lb_cityName:setString(arg_32_1.cities[1].cityName)

		local var_32_1 = arg_32_0.view.widgets.troopInfoLabel:getPosition() + arg_32_0.view.widgets.troopInfoLabel:getContentSize().width + arg_32_0.view.widgets.Lb_cityName:getContentSize().width / 2 + 20

		arg_32_0.view.widgets.Lb_cityName:setPositionX(var_32_1)

		local var_32_2 = var_32_1 + arg_32_0.view.widgets.Lb_cityName:getContentSize().width / 2 + arg_32_0.view.widgets.btn_city:getContentSize().width / 2 + 20

		arg_32_0.view.widgets.btn_city:setPositionX(var_32_2)
	elseif arg_32_1.cd and arg_32_1.cd > 0 then
		local function var_32_3()
			if arg_32_0.armyTimerLabel then
				arg_32_0.armyTimerLabel:removeFromParentAndCleanup(true)

				arg_32_0.armyTimerLabel = nil
			end

			arg_32_0:refresh()
		end

		local var_32_4 = createTimerLabel(arg_32_1.cd + 5000, "@M:@S", "Thonburi", 20, var_32_3, nil, nil, ccc3(255, 0, 0))

		arg_32_0.armyTimerLabel = var_32_4

		local var_32_5, var_32_6 = arg_32_0.view.widgets.Lb_cityName:getPosition()

		var_32_4:setPosition(ccp(var_32_5, var_32_6))
		arg_32_0.view.widgets.panel:addChild(var_32_4)

		local var_32_7 = arg_32_0.view.widgets.troopInfoLabel:getPosition() + arg_32_0.view.widgets.troopInfoLabel:getContentSize().width + var_32_4:getSize().width / 2 + 20

		var_32_4:setPositionX(var_32_7)
	end

	if arg_32_1.id >= 3 then
		arg_32_0.view.widgets.infoLb:setString(language.get("135239_psj"))
	else
		arg_32_0.view.widgets.infoLb:setString(language.get("135222_psj", arg_32_1.id .. "/3"))
	end

	arg_32_0.view.widgets.crackerLb:setString(arg_32_1.cracker)
	arg_32_0.view.widgets.goldLb:setString(arg_32_1.thunderGold)
	arg_32_0.btn_cracker:setEnabled(var_32_0)
	arg_32_0.btn_bomb:setEnabled(var_32_0)

	var_0_3 = ""

	if var_32_0 then
		var_0_4 = 0

		arg_32_0:showBeastAct("idle1")
		arg_32_0.view.widgets.btn_buyBeast:setVisible(false)
		arg_32_0.view.widgets.state:removeAllChildrenWithCleanup(true)
	else
		arg_32_0:showBeastAct("sleep")
		arg_32_0.view.widgets.btn_buyBeast:setVisible(true)
		arg_32_0.view.widgets.state:removeAllChildrenWithCleanup(true)
		arg_32_0.view.widgets.buyBeastGoldLb:setString(arg_32_1.beastGold)

		if arg_32_1.id >= 3 then
			arg_32_0.view.widgets.btnBuyLb:setString(language.get("135223_psj"))
			arg_32_0.view.widgets.btn_buyBeast:addHandleOfControlEvent(function()
				log.info("btn_buyBeast")
				arg_32_0:onBuyBeast()
			end, CCControlEventTouchUpInside)
			arg_32_0.view.widgets.state:setDisplayFrame(tool.spriteFrameByName("ns_tit_xqtpl.png"))
			arg_32_0.view.widgets.state:setPosition(ccp(70, 100))
		else
			arg_32_0.view.widgets.btnBuyLb:setString(language.get("135227_psj"))
			arg_32_0.view.widgets.btn_buyBeast:addHandleOfControlEvent(function()
				log.info("btn_recoverBeast")
				arg_32_0:onRecoverBeastCd()
			end, CCControlEventTouchUpInside)
			arg_32_0.view.widgets.state:setDisplayFrame(tool.spriteFrameByName("ns_tit_xqyfstlphjhyf.png"))
			arg_32_0.view.widgets.state:setPosition(ccp(70, 140))

			local var_32_8 = arg_32_1.beastCd / 1000
			local var_32_9 = math.floor(var_32_8 / 3600)
			local var_32_10 = CCLabelAtlas:create("", "res/ui/common/number/ns_tit_digit.png", 26, 26, 48)

			var_32_10:setAnchorPoint(ccp(0.5, 0.5))

			local var_32_11 = CCSprite:create("res/native/ui/activity/beast/ns_tit_xshcx_1.png")
			local var_32_12 = CCSprite:create("res/native/ui/activity/beast/ns_tit_xshcx_2.png")

			if var_32_9 < 1 then
				var_32_10:setString(var_0_15(arg_32_1.beastCd))

				local var_32_13 = CCArray:create()

				var_32_13:addObject(CCDelayTime:create(1))
				var_32_13:addObject(CCCallFuncN:create(function()
					arg_32_1.beastCd = arg_32_1.beastCd - 1000

					if arg_32_1.beastCd <= 0 then
						var_32_10:stopAllActions()
						arg_32_0:refresh()
					else
						var_32_10:setString(var_0_15(arg_32_1.beastCd))
					end
				end))

				local var_32_14 = CCSequence:create(var_32_13)

				var_32_10:runAction(CCRepeatForever:create(var_32_14))

				local var_32_15

				if conf.language == "vie" or conf.language == "tha" then
					var_32_15 = createRichNode({
						var_32_11,
						var_32_10
					}, 0.5)
				elseif conf.language == "kr" then
					var_32_15 = createRichNode({
						var_32_10,
						var_32_11
					}, 0.5)
				end

				arg_32_0.view.widgets.state:addChild(var_32_15)
				var_32_15:setPosition(ccp(219, -25))
			else
				var_32_10:setString(var_32_9)

				local var_32_16

				if conf.language == "vie" or conf.language == "tha" then
					var_32_16 = createRichNode({
						var_32_11,
						var_32_10,
						var_32_12
					}, 0.5)
				elseif conf.language == "kr" then
					var_32_16 = createRichNode({
						var_32_10,
						var_32_11,
						var_32_12
					}, 0.5)
				end

				arg_32_0.view.widgets.state:addChild(var_32_16)
				var_32_16:setPosition(ccp(219, -25))
			end
		end
	end
end

function var_0_14.ctor(arg_38_0, arg_38_1, arg_38_2)
	log.info("@@ 首充豪礼活动")
	rmgr.loadResource("res/ui/activity/poShui/poShui.plist")
	rmgr.loadResource("res/ui/activity/poShui/shuiQiangAnim.plist")
	rmgr.loadResource("res/ui/activity/poShui/shuiTongAnim.plist")

	arg_38_0.view = {}
	arg_38_0.animate = {}

	uiutil.initWidgets(arg_38_0.view, arg_38_0.layout)

	arg_38_0.leftTime = arg_38_0.view.widgets.leftTime

	if arg_38_1 then
		arg_38_0:addChild(arg_38_0.view.widgets.panel)
		arg_38_1:addChild(arg_38_0)
	end

	local var_38_0 = CCMenu:create()

	arg_38_0.view.widgets.btn_bg:addChild(var_38_0)
	var_38_0:setPosition(ccp(192, 70))

	local var_38_1 = CCSprite:createWithSpriteFrameName("psj_btn_shuiqiang_1.png")
	local var_38_2 = CCSprite:createWithSpriteFrameName("psj_btn_shuiqiang_2.png")
	local var_38_3 = CCMenuItemSprite:create(var_38_1, var_38_2)

	arg_38_0.btn_cracker = var_38_3

	var_38_0:addChild(var_38_3)
	var_38_3:setPosition(ccp(-47, 0))
	var_38_3:registerScriptTapHandler(function()
		log.info("btn_cracker")
		arg_38_0:onGetBeastReward(1)
	end)

	local var_38_4 = CCSprite:createWithSpriteFrameName("psj_btn_shuitong_1.png")
	local var_38_5 = CCSprite:createWithSpriteFrameName("psj_btn_shuitong_2.png")
	local var_38_6 = CCMenuItemSprite:create(var_38_4, var_38_5)

	arg_38_0.btn_bomb = var_38_6

	var_38_0:addChild(var_38_6)
	var_38_6:setPosition(ccp(47, 0))
	var_38_6:registerScriptTapHandler(function()
		log.info("btn_bomb")
		arg_38_0:onGetBeastReward(2)
	end)
	arg_38_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_38_0:showTip(var_0_5)
	end, CCControlEventTouchUpInside)

	local var_38_7 = CCLayerColor:create(ccc4(0, 0, 0, 0), 909, 404)
	local var_38_8 = CCScrollView:create(CCSizeMake(909, 404), var_38_7)

	var_38_8:setPosition(ccp(3, 3))
	var_38_8:setTouchEnabled(false)
	arg_38_0.view.widgets.panel:addChild(var_38_8)

	arg_38_0.beastLayer = var_38_7

	arg_38_0:showPanel(arg_38_2)
end

function var_0_14.showTip(arg_42_0, arg_42_1, arg_42_2)
	log.info("should show tips ")

	local var_42_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_42_0:registerScriptTouchHandler(function(arg_43_0, arg_43_1, arg_43_2)
		if arg_43_0 == CCTOUCHBEGAN then
			return true
		elseif arg_43_0 == CCTOUCHMOVED then
			return true
		elseif arg_43_0 == CCTOUCHENDED then
			pcall(var_42_0.removeFromParentAndCleanup, var_42_0, true)

			return true
		end
	end, false, true)
	var_42_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_42_0, 60000)

	local var_42_1 = 0
	local var_42_2 = 0
	local var_42_3 = {}

	uiutil.initWidgets(var_42_3, arg_42_0.tipFrame)
	var_42_0:addChild(var_42_3.widgets.tipFrame)

	if arg_42_1 == var_0_5 then
		local var_42_4, var_42_5 = tool.getPositionInScreen(arg_42_0.view.widgets.btn_tip)

		var_42_1 = var_42_4 + 20
		var_42_2 = var_42_5 - 20

		if user.player.playerLv < 100 then
			var_42_3.widgets.tipMsg:setString(language.get("135242_psj"))
		end
	elseif arg_42_1 == var_0_6 then
		var_42_3.widgets.tipFrame:setAnchorPoint(ccp(1, 0.5))
		var_42_3.widgets.tipMsg:setDimensions(CCSizeMake(300, 0))

		local var_42_6, var_42_7 = tool.getPositionInScreen(arg_42_0.btn_cracker)

		var_42_1 = var_42_6
		var_42_2 = var_42_7 + 65

		var_42_3.widgets.tipMsg:setString(language.get("135240_psj"))
	end

	local var_42_8 = var_42_3.widgets.tipMsg:getContentSize().width
	local var_42_9 = var_42_3.widgets.tipMsg:getContentSize().height

	var_42_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_42_8 + 30, var_42_9 + 30))
	var_42_3.widgets.tipFrame:setPosition(ccp(var_42_1, var_42_2))
	var_42_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_42_3.widgets.tipFrame:setVisible(true)
end

function var_0_14.onExit(arg_44_0)
	for iter_44_0, iter_44_1 in pairs(arg_44_0.animate) do
		iter_44_1:release()
	end
end

return var_0_14
