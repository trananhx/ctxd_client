local var_0_0 = require("res/native/offset").get("layer.activity.newGemRotary.newGemRotaryTab")
local var_0_1 = {
	[0] = "res/ui/activity/gemsActivity/icon_gem.png",
	"res/ui/activity/gemRotary/new/tcjbl.png",
	"res/ui/activity/gemRotary/new/hfjbl.png"
}
local var_0_2 = {
	[0] = "xbszp_zphw_06.png",
	"xbszp_zphw_04.png",
	"xbszp_zphw_02.png"
}
local var_0_3 = {
	[0] = "xbszp_zphw_05.png",
	"xbszp_zphw_03.png",
	"xbszp_zphw_01.png"
}
local var_0_4 = {
	[0] = 7,
	2201,
	2202
}
local var_0_5 = 8
local var_0_6 = tool.hexToRgb("#D9EDC5")
local var_0_7 = ccc3(0, 180, 0)
local var_0_8 = colorQuality[5]
local var_0_9 = colorQuality[4]
local var_0_10 = colorQuality[2]
local var_0_11 = class("NewGemRotary", function()
	return createBaseLayer()
end)

var_0_11.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/gemRotary/di.png"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 25,
			name = "leftTime",
			type = "label",
			x = 820,
			style = "label_warlock",
			y = 480 + (var_0_0.timeLeftY or 0),
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_8
		},
		{
			x = 540,
			y = 490,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/gemRotary/bszzp_title.png"
			}
		},
		{
			scale = 0.95,
			x = 0,
			y = 8,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/comment/xiaoqian.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			fontSize = 25,
			style = "label_warlock",
			y = 408,
			type = "label",
			x = 310,
			textId = 135450,
			anchorPoint = ccp(1, 0.5)
		},
		{
			x = 340,
			y = 408,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/gemsActivity/icon_gem.png"
			}
		},
		{
			fontSize = 25,
			name = "nextIron",
			type = "label",
			text = 9999,
			style = "label_warlock",
			y = 408,
			x = 365,
			anchorPoint = ccp(0, 0.5),
			color = var_0_10
		},
		{
			x = 460,
			y = 408,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/ironRotary/huode.png"
			}
		},
		{
			height = 0,
			width = 300,
			type = "label",
			textId = 135451,
			style = "label_warlock",
			y = 408,
			x = 510,
			anchorPoint = ccp(0, 0.5),
			fontSize = 25 + (var_0_0.freeDescFntSize or 0),
			align = kCCTextAlignmentLeft
		},
		{
			x = 320,
			y = 200,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/ironRotary/btdzp_load_di.png"
			}
		},
		{
			y = 200,
			name = "power",
			type = "progressbar",
			x = 320,
			anchorPoint = ccp(0.5, 0.5),
			progressType = kCCProgressTimerTypeBar,
			pic = {
				frame = false,
				path = "res/ui/activity/ironRotary/btdzp_load_con.png"
			}
		},
		{
			y = 187,
			name = "plateNode",
			type = "node",
			x = 520,
			children = {
				{
					x = 0,
					y = 0,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/xbszp_zp_bg.png"
					}
				},
				{
					x = 0,
					name = "outerPlate",
					y = 0,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/xbszp_zp_01.png"
					}
				},
				{
					x = 1,
					name = "innerPlate",
					y = -2,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/xbszp_zp_02.png"
					}
				},
				{
					x = 0,
					y = 0,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/xbszp_zp_mask.png"
					}
				},
				{
					x = 0,
					y = 83,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/zhizhen.png"
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_rotate",
					h = 85,
					type = "button",
					w = 85,
					y = 0,
					x = -1,
					normal = {
						frame = false,
						path = "res/ui/activity/ironRotary/zan01.png"
					},
					touched = {
						frame = false,
						path = "res/ui/activity/ironRotary/zan02.png"
					}
				},
				{
					x = -1,
					y = 0,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/btdzp_btn_lig.png"
					}
				},
				{
					x = 0,
					y = 0,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/zhuan.png"
					}
				},
				{
					fontSize = 22,
					name = "remainNum",
					y = -20,
					type = "label",
					style = "label_warlock",
					x = 0,
					color = var_0_9
				},
				{
					y = 0,
					name = "rewardBg",
					scale = 1.1,
					type = "node",
					x = 0,
					children = {
						{
							x = 0,
							y = 0,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/ironRotary/btdzp_zhuanpanbn_up.png"
							}
						},
						{
							x = 0,
							name = "light",
							y = 0,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/ironRotary/btdzp_lig.png"
							}
						},
						{
							x = 0,
							name = "rewardIcon",
							y = 0,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/gemsActivity/icon_gem.png"
							}
						},
						{
							text = 0,
							name = "rewardNum",
							y = -20,
							type = "label",
							fontSize = 22,
							x = 0,
							style = "label_warlock",
							color = var_0_6
						}
					}
				}
			}
		},
		{
			visible = false,
			name = "btn_rate",
			h = 56,
			type = "button",
			w = 212,
			zoomOnTouchDown = false,
			y = 140,
			x = 810,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02_c.png"
			},
			children = {
				{
					x = 130,
					y = 32,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/btn_word_tsbl.png"
					}
				},
				{
					text = "",
					name = "freeRateTimes",
					y = 32,
					type = "label",
					style = "label_warlock",
					x = 40,
					fontSize = 22,
					color = var_0_9
				},
				{
					x = 40,
					name = "rateGoldIcon",
					y = 40,
					type = "sprite",
					scale = 0.6,
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/yuanbao.png"
					}
				},
				{
					text = "",
					name = "rateGold",
					y = 22,
					type = "label",
					style = "label_warlock",
					x = 40,
					fontSize = 22,
					color = var_0_9
				}
			}
		},
		{
			visible = false,
			name = "btn_cancel",
			h = 56,
			type = "button",
			w = 189,
			zoomOnTouchDown = false,
			y = 140,
			x = 798,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04_c.png"
			},
			children = {
				{
					x = 94,
					y = 32,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/word_qxts.png"
					}
				}
			}
		},
		{
			zoomOnTouchDown = false,
			name = "btn_buy",
			h = 56,
			type = "button",
			w = 212,
			y = 60,
			x = 810,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_01.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_01_c.png"
			},
			children = {
				{
					x = 130,
					y = 32,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/gemRotary/new/btn_word_gmcs.png"
					}
				},
				{
					y = 40,
					x = 40,
					scale = 0.6,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/yuanbao.png"
					}
				},
				{
					text = "",
					name = "buyGold",
					y = 22,
					type = "label",
					style = "label_warlock",
					x = 40,
					fontSize = 22,
					color = var_0_9
				}
			}
		}
	}
}

function var_0_11.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getNewGemRotaryActivity)
end

function var_0_11.onTurnGemRotary(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data
		local var_5_1

		arg_4_0.last_innerId = arg_4_0.last_innerId or 1

		local var_5_2 = arg_4_0.last_innerId - var_5_0.innerId
		local var_5_3 = tool.toint(arg_4_0.powerNum / 25) + 1
		local var_5_4 = var_5_2 + var_5_3 * var_0_5
		local var_5_5 = var_5_3
		local var_5_6 = var_5_4 * 360 / var_0_5

		arg_4_0.view.widgets.innerPlate:runAction(CCEaseSineOut:create(CCRotateBy:create(var_5_5, var_5_6)))

		arg_4_0.last_outerId = arg_4_0.last_outerId or 1

		local var_5_7 = arg_4_0.last_outerId - var_5_0.outerId - (tool.toint(arg_4_0.powerNum / 25) + 1) * 8
		local var_5_8 = var_5_5 + 0.5
		local var_5_9 = var_5_7 * 45
		local var_5_10 = CCEaseSineOut:create(CCRotateBy:create(var_5_8, var_5_9))
		local var_5_11 = CCCallFuncN:create(function()
			arg_4_0.info.type = var_5_0.type
			arg_4_0.info.num = var_5_0.num
			arg_4_0.last_innerId = var_5_0.innerId
			arg_4_0.last_outerId = var_5_0.outerId

			arg_4_0:showPanel(arg_4_0.info)
			arg_4_0:addTokenInfo(var_5_0.type, true)
		end)

		arg_4_0.view.widgets.outerPlate:runAction(CCSequence:createWithTwoActions(var_5_10, var_5_11))
	end

	cmgr.sendRequest(var_4_0, actions.turnGemRotary)
end

function var_0_11.onGetGemReward(arg_7_0)
	local function var_7_0(arg_8_0)
		local var_8_0 = {
			{}
		}

		var_8_0[1].id = var_0_4[arg_8_0.action.data.type]
		var_8_0[1].value = arg_8_0.action.data.num

		globalAction_gotResource(var_8_0)
		arg_7_0:refresh()
	end

	cmgr.sendRequest(var_7_0, actions.getGemReward)
end

function var_0_11.onBuyTurnRotaryTimes(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = {
			{}
		}

		var_10_0[1].id = 10004
		var_10_0[1].value = 1

		globalAction_gotResource(var_10_0)
		arg_9_0:refresh()
	end

	messageBox.showChargeWinWithData(language.get(10003), language.get(135454, arg_9_0.info.buyGold), "newRotaryBuyTime", function()
		cmgr.sendRequest(var_9_0, actions.buyTurnRotaryTimes)
	end)
end

function var_0_11.onMarkUpRateRotary(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0)
		arg_12_0:refresh()

		local var_13_0 = CCSprite:create("res/ui/activity/gemRotary/new/xbszp_blts_se.png")

		var_13_0:setOpacity(0)
		arg_12_0.view.widgets.plateNode:addChild(var_13_0)

		local var_13_1 = CCArray:create()

		var_13_1:addObject(CCFadeIn:create(0.05))
		var_13_1:addObject(CCFadeOut:create(0.3))
		var_13_1:addObject(CCCallFuncN:create(function()
			var_13_0:removeFromParentAndCleanup(true)
		end))

		local var_13_2 = CCSequence:create(var_13_1)

		var_13_0:runAction(var_13_2)
	end

	cmgr.sendRequest(var_12_0, actions.markUpRateRotary, arg_12_1)
end

function var_0_11.onBtnRotateTap(arg_15_0)
	if arg_15_0.info.num > 0 then
		arg_15_0:onGetGemReward()
	elseif arg_15_0.info.rotaryTimes > 0 then
		if arg_15_0.info.markUp == 1 and arg_15_0.info.freeRateTimes == 0 then
			messageBox.showChargeWinWithData(language.get(10003), language.get(135455, arg_15_0.info.rateGold), "newRotaryMarkUp", function()
				arg_15_0:onTurnGemRotary()
			end)
		else
			arg_15_0:onTurnGemRotary()
		end
	else
		arg_15_0:onBuyTurnRotaryTimes()
	end
end

function var_0_11.addTokenInfo(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.tokenNode then
		arg_17_0.tokenNode:removeAllChildrenWithCleanup(true)
	else
		arg_17_0.tokenNode = CCNode:create()

		arg_17_0.view.widgets.panel:addChild(arg_17_0.tokenNode, 300)
	end

	local var_17_0 = 520
	local var_17_1 = 360

	arg_17_0.tokenNode:setPosition(ccp(var_17_0, var_17_1))

	local var_17_2

	if arg_17_1 == 1 then
		var_17_2 = "xbszp_word_tcjbl.png"
	elseif arg_17_1 == 2 then
		var_17_2 = "xbszp_word_hfjbl.png"
	end

	if var_17_2 then
		local var_17_3 = CCSprite:create("res/ui/activity/gemRotary/new/xbszp_hd_bg.png")

		arg_17_0.tokenNode:addChild(var_17_3)

		local var_17_4 = CCSprite:create("res/ui/activity/gemRotary/new/xbszp_word_gxnhd.png")
		local var_17_5 = CCSprite:create("res/ui/activity/gemRotary/new/" .. var_17_2)
		local var_17_6 = var_17_4:getContentSize().width
		local var_17_7 = var_17_5:getContentSize().width

		var_17_4:setPositionX(-var_17_7 / 2)
		var_17_5:setPositionX(var_17_6 / 2)
		arg_17_0.tokenNode:addChild(var_17_4)
		arg_17_0.tokenNode:addChild(var_17_5)

		if arg_17_2 then
			local var_17_8 = 80

			arg_17_0.tokenNode:setPosition(ccp(var_17_0, var_17_1 - var_17_8))
			arg_17_0.tokenNode:runAction(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(0, var_17_8))))
		end
	end
end

function var_0_11.addReward(arg_18_0, arg_18_1)
	if arg_18_0.innerNode then
		if arg_18_1 then
			arg_18_0.innerNode:removeAllChildrenWithCleanup(true)
		end

		arg_18_0.outerNode:removeAllChildrenWithCleanup(true)
	else
		arg_18_0.innerNode = CCNode:create()

		arg_18_0.view.widgets.innerPlate:addChild(arg_18_0.innerNode)
		arg_18_0.innerNode:setPosition(ccp(116.5, 116.5))

		arg_18_0.outerNode = CCNode:create()

		arg_18_0.view.widgets.outerPlate:addChild(arg_18_0.outerNode)
		arg_18_0.outerNode:setPosition(ccp(171, 171))
	end

	if arg_18_1 then
		for iter_18_0 = 1, var_0_5 do
			local var_18_0 = arg_18_0.info.inners[iter_18_0]
			local var_18_1 = (iter_18_0 - 1) * 360 / var_0_5

			if var_18_0.type == 1 then
				local var_18_2 = CCSprite:create("res/ui/activity/gemsActivity/icon_gem.png")
				local var_18_3 = math.sin(math.rad(var_18_1 + 3.013)) * 65
				local var_18_4 = math.cos(math.rad(var_18_1 + 3.013)) * 65

				var_18_2:setPosition(ccp(var_18_3, var_18_4))
				var_18_2:setRotation(var_18_1)
				var_18_2:setScale(0.8)
				arg_18_0.innerNode:addChild(var_18_2)

				local var_18_5 = CCStrokeLabelTTF:create(var_18_0.num, "Thonburi", 24)
				local var_18_6 = var_18_3 * 95 / 65
				local var_18_7 = var_18_4 * 95 / 65

				var_18_5:setPosition(ccp(var_18_6, var_18_7))
				var_18_5:setRotation(var_18_1)
				arg_18_0.innerNode:addChild(var_18_5)
			else
				local var_18_8 = CCSprite:create("res/ui/activity/gemRotary/new/" .. var_0_2[arg_18_0.info.gemTokenNum])
				local var_18_9 = math.sin(math.rad(3.715 + var_18_1)) * 77.2
				local var_18_10 = math.cos(math.rad(3.715 + var_18_1)) * 77.2

				var_18_8:setPosition(ccp(var_18_9, var_18_10))
				var_18_8:setRotation(var_18_1)
				arg_18_0.innerNode:addChild(var_18_8)
			end
		end
	end

	for iter_18_1 = 1, var_0_5 do
		local var_18_11 = arg_18_0.info.outers[iter_18_1]
		local var_18_12 = (iter_18_1 - 1) * 360 / var_0_5

		if var_18_11.type == 1 then
			local var_18_13 = CCNode:create()
			local var_18_14 = math.sin(math.rad(var_18_12 + 3.013)) * 140
			local var_18_15 = math.cos(math.rad(var_18_12 + 3.013)) * 140

			var_18_13:setPosition(ccp(var_18_14, var_18_15))
			var_18_13:setRotation(var_18_12)
			arg_18_0.outerNode:addChild(var_18_13)

			local var_18_16 = CCLabelAtlas:create(var_18_11.num, "res/ui/common/number/xbszp_digit.png", 34, 39, 48)
			local var_18_17 = CCSprite:create("res/ui/activity/gemRotary/new/xbszp_word_b.png")

			var_18_16:setAnchorPoint(ccp(0.5, 0.5))

			local var_18_18 = var_18_16:getContentSize().width
			local var_18_19 = var_18_17:getContentSize().width

			var_18_16:setPositionX(-var_18_19 / 2 + 5)
			var_18_17:setPositionX(var_18_18 / 2 - 5)
			var_18_13:addChild(var_18_16)
			var_18_13:addChild(var_18_17)
		else
			local var_18_20 = CCSprite:create("res/ui/activity/gemRotary/new/" .. var_0_3[arg_18_0.info.gemTokenNum])
			local var_18_21 = math.sin(math.rad(4.643 + var_18_12)) * 135.45
			local var_18_22 = math.cos(math.rad(4.643 + var_18_12)) * 135.45

			var_18_20:setPosition(ccp(var_18_21, var_18_22))
			var_18_20:setRotation(var_18_12)
			arg_18_0.outerNode:addChild(var_18_20)
		end
	end
end

function var_0_11.showPanel(arg_19_0, arg_19_1)
	arg_19_0.info = arg_19_1

	arg_19_0.view.widgets.light:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
	arg_19_0.view.widgets.nextIron:setString(arg_19_1.nextNum)

	local var_19_0 = arg_19_1.num > 0

	arg_19_0.view.widgets.rewardBg:setVisible(var_19_0)
	arg_19_0:addTokenInfo(arg_19_1.type)

	if var_19_0 then
		arg_19_0.view.widgets.rewardNum:setString(arg_19_1.num)
		arg_19_0.view.widgets.rewardIcon:setDisplayFrame(CCSprite:create(var_0_1[arg_19_1.type]):displayFrame())
	end

	arg_19_0:addReward(true)

	local var_19_1 = arg_19_1.rotaryTimes > 0 and arg_19_1.rotaryTimes or language.get(142003, arg_19_1.buyGold)

	arg_19_0.view.widgets.remainNum:setString(var_19_1)

	local var_19_2 = arg_19_1.markUp == 0

	arg_19_0.view.widgets.btn_rate:setVisible(var_19_2)
	arg_19_0.view.widgets.btn_cancel:setVisible(not var_19_2)

	if var_19_2 then
		local var_19_3 = arg_19_1.freeRateTimes > 0

		arg_19_0.view.widgets.freeRateTimes:setVisible(var_19_3)
		arg_19_0.view.widgets.rateGoldIcon:setVisible(not var_19_3)
		arg_19_0.view.widgets.rateGold:setVisible(not var_19_3)

		if var_19_3 then
			arg_19_0.view.widgets.freeRateTimes:setString(language.get(20036, arg_19_1.freeRateTimes))
		else
			arg_19_0.view.widgets.rateGold:setString(language.get(142003, arg_19_1.rateGold))
		end
	end

	arg_19_0.view.widgets.buyGold:setString(language.get(142003, arg_19_1.buyGold))
end

function var_0_11.ctor(arg_20_0, arg_20_1, arg_20_2)
	log.info("@@ 新宝石转盘活动")

	arg_20_0.view = {}

	uiutil.initWidgets(arg_20_0.view, arg_20_0.layout)

	arg_20_0.leftTime = arg_20_0.view.widgets.leftTime

	if arg_20_1 then
		arg_20_0:addChild(arg_20_0.view.widgets.panel)
		arg_20_1:addChild(arg_20_0)
	end

	arg_20_0.view.widgets.power:setMidpoint(ccp(0, 1))
	arg_20_0.view.widgets.power:setBarChangeRate(ccp(0, 1))
	arg_20_0.view.widgets.btn_rotate:addHandleOfControlEvent(function()
		log.info("btn_rotate")
		arg_20_0:onBtnRotateTap()
	end, CCControlEventTouchUpInside)
	arg_20_0.view.widgets.btn_rate:addHandleOfControlEvent(function()
		log.info("btn_rate")
		arg_20_0:onMarkUpRateRotary(1)
	end, CCControlEventTouchUpInside)
	arg_20_0.view.widgets.btn_cancel:addHandleOfControlEvent(function()
		log.info("btn_cancel")
		arg_20_0:onMarkUpRateRotary(0)
	end, CCControlEventTouchUpInside)
	arg_20_0.view.widgets.btn_buy:addHandleOfControlEvent(function()
		log.info("btn_buy")
		arg_20_0:onBuyTurnRotaryTimes()
	end, CCControlEventTouchUpInside)
	arg_20_0:showPanel(arg_20_2)
end

function var_0_11.onEnter(arg_25_0)
	arg_25_0.touchBeganRef = handler(arg_25_0, arg_25_0.onTouchBegan)
	arg_25_0.touchMovedRef = handler(arg_25_0, arg_25_0.onTouchMoved)
	arg_25_0.touchEndedRef = handler(arg_25_0, arg_25_0.onTouchEnded)
	arg_25_0.touchCancelledRef = handler(arg_25_0, arg_25_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_25_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_25_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_25_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_25_0.touchCancelledRef)

	arg_25_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_25_0, arg_25_0.update), 0, false)
end

function var_0_11.onExit(arg_26_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_26_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_26_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_26_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_26_0.touchCancelledRef)

	if arg_26_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_26_0.updateRef)
	end
end

function var_0_11.update(arg_27_0, arg_27_1)
	if arg_27_0.isTouchOn then
		if arg_27_0.powerNum > 120 then
			arg_27_0.powerNum = 0
		end

		arg_27_0.view.widgets.power:setPercentage(arg_27_0.powerNum)

		arg_27_0.powerNum = arg_27_0.powerNum + arg_27_1 * 100
	end
end

function var_0_11.onTouchBegan(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_0.info.rotaryTimes > 0 and tool.checkIfTouch(arg_28_0.view.widgets.btn_rotate, arg_28_1, arg_28_2) then
		arg_28_0.isTouchOn = true
		arg_28_0.powerNum = 0
	end
end

function var_0_11.onTouchMoved(arg_29_0, arg_29_1, arg_29_2)
	return
end

function var_0_11.onTouchEnded(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.isTouchOn = false
end

function var_0_11.onTouchCancelled(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.isTouchOn = false
end

return var_0_11
