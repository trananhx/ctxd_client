local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.leftTime = 60
elseif conf.language == "kr" then
	var_0_0.leftTime = 60
else
	var_0_0.leftTime = 0
end

local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 255, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = ccc3(50, 50, 50)
local var_0_6 = ccc3(255, 255, 255)
local var_0_7 = ccc3(22, 18, 13)
local var_0_8 = {
	language.get(135092),
	language.get(135093),
	language.get(135094)
}
local var_0_9 = {
	0,
	0,
	0
}
local var_0_10 = {
	"res/ui/activity/christmasDay/sdhd_zslwh.png",
	"res/ui/activity/christmasDay/sdhd_zscq.png",
	"res/ui/activity/christmasDay/sdhd_zsxh.png"
}
local var_0_11 = {
	"res/ui/activity/christmasDay/sdhd_zslwh_light.png",
	"res/ui/activity/christmasDay/sdhd_zscq_light.png",
	"res/ui/activity/christmasDay/sdhd_zsxh_light.png"
}
local var_0_12 = {
	"res/ui/activity/christmasDay/sdhd_gift01.png",
	"res/ui/activity/christmasDay/sdhd_gift02.png",
	"res/ui/activity/christmasDay/sdhd_gift03.png"
}
local var_0_13 = "res/ui/activity/christmasDay/sdhd_gift_light.png"
local var_0_14 = {
	language.get(75027),
	language.get(75028),
	language.get(75029)
}
local var_0_15 = {}

var_0_15[3] = 3
var_0_15[4] = 4
var_0_15[5] = 6
var_0_15[81] = 24
var_0_15[100] = 100
var_0_15[101] = 15
var_0_15[102] = 41

local var_0_16 = class("ChristmasDay", function()
	return createBaseLayer()
end)

var_0_16.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/christmasDay/sdhd_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 473,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/christmasDay/sdhd_title.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 465,
			type = "label",
			style = "label_warlock",
			x = 770 + var_0_0.leftTime,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_3
		},
		{
			fontSize = 22,
			style = "label_warlock",
			y = 405,
			type = "label",
			x = 15,
			textId = 135098,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 270,
			name = "btn_city",
			style = "button_yel1",
			type = "button",
			x = 250,
			zorder = 200,
			children = {
				{
					fontSize = 22,
					style = "label_warlock",
					y = 29,
					type = "label",
					x = 49,
					textId = 420008,
					color = var_0_1
				},
				{
					fontSize = 26,
					name = "Lb_cityName",
					y = 69,
					type = "label",
					style = "label_warlock",
					x = 49,
					zorder = 200,
					color = var_0_2
				}
			}
		},
		{
			fontSize = 22,
			style = "label_warlock",
			y = 225,
			type = "label",
			x = 15,
			textId = 135099,
			anchorPoint = ccp(0, 0.5)
		},
		{
			x = 706,
			name = "tree",
			y = 65,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/christmasDay/sdhd_tree.png"
			},
			anchorPoint = ccp(0.5, 0)
		},
		{
			fontSize = 40,
			name = "Lb_info",
			y = 60,
			type = "label",
			style = "label_warlock",
			x = 706
		},
		{
			y = 60,
			name = "btn_shake",
			style = "button_gre3",
			type = "button",
			x = 706,
			children = {
				{
					fontSize = 22,
					name = "Lb_shake",
					y = 29,
					type = "label",
					style = "label_warlock",
					x = 70,
					color = var_0_1
				},
				{
					fontSize = 22,
					name = "goldLb",
					type = "label",
					style = "label_warlock",
					y = -7,
					x = 75,
					anchorPoint = ccp(0, 0.5),
					color = var_0_4,
					children = {
						{
							x = -25,
							y = -3,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						}
					}
				}
			}
		}
	}
}

function var_0_16.getShiPinCard(arg_2_0, arg_2_1)
	return {
		y = 0,
		type = "node",
		name = "shiPinNode" .. arg_2_1,
		x = arg_2_1 * 160 - 70,
		children = {
			{
				y = 340,
				x = 0,
				scale = 0.9,
				type = "sprite",
				pic = {
					frame = false,
					path = "res/ui/activity/christmasDay/sdhd_ysd.png"
				},
				children = {
					{
						y = 108,
						x = 77,
						scale = 0.42857142857142855,
						type = "sprite",
						pic = {
							frame = false,
							path = var_0_10[arg_2_1]
						}
					}
				}
			},
			{
				x = 0,
				y = 145,
				type = "sprite",
				name = "shiPinPic" .. arg_2_1,
				pic = {
					frame = false,
					path = var_0_10[arg_2_1]
				}
			},
			{
				y = 75,
				style = "button_yel2",
				type = "button",
				x = 0,
				name = "btn_ZS" .. arg_2_1,
				children = {
					{
						fontSize = 22,
						style = "label_warlock",
						y = 27,
						type = "label",
						x = 63,
						textId = 135097,
						color = var_0_1
					}
				}
			},
			{
				y = 30,
				x = -35,
				scale = 0.35714285714285715,
				type = "sprite",
				pic = {
					frame = false,
					path = var_0_10[arg_2_1]
				}
			},
			{
				fontSize = 22,
				y = 35,
				type = "label",
				x = -15,
				name = "shiPinNum" .. arg_2_1,
				anchorPoint = ccp(0, 0.5),
				color = var_0_1
			}
		}
	}
end

var_0_16.tipFrame = {
	visible = false,
	name = "tipFrame",
	type = "sprite9",
	y = 0,
	x = 0,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(36, 16, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 22,
			height = 0,
			name = "tipMsg",
			type = "label",
			width = 500,
			textId = 135013,
			style = "label_warlock",
			y = 0,
			x = 0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_16.close(arg_3_0)
	local var_3_0 = smgr.getLayer("topLayer")

	tool.safeRemoveChildByTag(var_3_0, s_windows.tag.activity)
end

function var_0_16.refresh(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:showPanel(arg_5_0.action.data)
	end

	cmgr.sendRequest(var_4_0, actions.getChristmasDayActivity)
end

function var_0_16.onDecorateTree(arg_6_0, arg_6_1)
	log.info("onDecorateTree", arg_6_1)

	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data
		local var_7_1 = CCSprite:create(var_0_10[arg_6_1])

		var_7_1:setScale(0.35714285714285715)
		arg_6_0.view.widgets.panel:addChild(var_7_1, 100)

		local var_7_2, var_7_3 = arg_6_0["shiPinNode" .. arg_6_1]:getPosition()
		local var_7_4, var_7_5 = arg_6_0["shiPinPic" .. arg_6_1]:getPosition()
		local var_7_6 = var_7_2 + var_7_4
		local var_7_7 = var_7_3 + var_7_5
		local var_7_8, var_7_9 = arg_6_0.view.widgets.tree:getPosition()
		local var_7_10, var_7_11 = arg_6_0["shiPinItem" .. arg_6_1 .. tostring(1 + var_0_9[arg_6_1])]:getPosition()
		local var_7_12 = arg_6_0.view.widgets.tree:getContentSize()
		local var_7_13 = var_7_8 + var_7_10 - var_7_12.width / 2
		local var_7_14 = var_7_9 + var_7_11

		var_7_1:setPosition(ccp(var_7_6, var_7_7))

		local var_7_15 = CCArray:create()

		var_7_15:addObject(CCMoveTo:create(1, ccp(var_7_13, var_7_14)))
		var_7_15:addObject(CCCallFuncN:create(function()
			var_7_1:removeFromParentAndCleanup(true)
			arg_6_0:refresh()

			local var_8_0 = arg_6_0:addShineSprite(var_0_11[arg_6_1], var_0_10[arg_6_1], arg_6_0.view.widgets.panel, ccp(var_7_13, var_7_14), 0.35714285714285715)
			local var_8_1 = CCArray:create()

			var_8_1:addObject(CCDelayTime:create(2))
			var_8_1:addObject(CCCallFuncN:create(function()
				var_8_0:removeFromParentAndCleanup(true)
			end))
			var_8_0:runAction(CCSequence:create(var_8_1))
		end))

		local var_7_16 = CCSequence:create(var_7_15)

		var_7_1:runAction(var_7_16)

		if var_7_0.finishId >= 1 and var_7_0.finishId <= 3 then
			local var_7_17 = CCStrokeLabelTTF:create(language.get(135106, var_0_14[var_7_0.finishId]), "Thonburi", 40, 2, var_0_7)

			var_7_17:setColor(var_0_4)
			var_7_17:setPosition(ccp(var_7_8, var_7_9 + var_7_12.height / 2 - 50))
			arg_6_0.view.widgets.panel:addChild(var_7_17, 200)

			local var_7_18 = CCArray:create()

			var_7_18:addObject(CCMoveBy:create(1, ccp(0, 100)))
			var_7_18:addObject(CCDelayTime:create(0.5))
			var_7_18:addObject(CCCallFuncN:create(function()
				var_7_17:removeFromParentAndCleanup(true)
			end))

			local var_7_19 = CCSequence:create(var_7_18)

			var_7_17:runAction(var_7_19)
		end

		local var_7_20 = {}

		for iter_7_0 = 1, #var_7_0.rewards do
			local var_7_21 = {
				id = var_0_15[var_7_0.rewards[iter_7_0].type],
				value = var_7_0.rewards[iter_7_0].value
			}

			table.insert(var_7_20, var_7_21)
		end

		globalAction_gotResource(var_7_20)
	end

	cmgr.sendRequest(var_6_0, actions.decorateChristmasTree, arg_6_1)
end

function var_0_16.onGetReward(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0.action.data
		local var_12_1 = {}

		for iter_12_0 = 1, #var_12_0.rewards do
			local var_12_2 = {
				id = var_0_15[var_12_0.rewards[iter_12_0].type],
				value = var_12_0.rewards[iter_12_0].value
			}

			table.insert(var_12_1, var_12_2)
		end

		globalAction_gotResource(var_12_1)
		arg_11_0:refresh()
	end

	cmgr.sendRequest(var_11_0, actions.getChristmasReward, arg_11_1)
end

function var_0_16.onShakeTree(arg_13_0)
	local function var_13_0(arg_14_0)
		arg_13_0:showShakeTreeEffect()
		arg_13_0:showSnowEffect()
	end

	local function var_13_1()
		cmgr.sendRequest(var_13_0, actions.shakeChristmasTree)
		arg_13_0.view.widgets.btn_shake:setVisible(false)
	end

	if arg_13_0.info.gold > 0 then
		messageBox.confirm(language.get(135102, arg_13_0.info.gold), var_13_1)
	else
		var_13_1()
	end
end

function var_0_16.onGetBigGift(arg_16_0)
	log.info("onGetBigGift")

	local function var_16_0(arg_17_0)
		local var_17_0 = arg_17_0.action.data
		local var_17_1 = {}

		for iter_17_0 = 1, #var_17_0.rewards do
			local var_17_2 = {
				id = var_0_15[var_17_0.rewards[iter_17_0].type],
				value = var_17_0.rewards[iter_17_0].value
			}

			table.insert(var_17_1, var_17_2)
		end

		globalAction_gotResource(var_17_1)
		arg_16_0:refresh()
	end

	cmgr.sendRequest(var_16_0, actions.getChristmasBigGift)
end

function var_0_16.onGoToCity(arg_18_0, arg_18_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_18_1)
end

function var_0_16.showTreeEffect(arg_19_0)
	local var_19_0 = CCArray:create()

	var_19_0:addObject(CCRotateBy:create(0.05, -2))
	var_19_0:addObject(CCRotateBy:create(0.1, 4))
	var_19_0:addObject(CCRotateBy:create(0.05, -2))

	local var_19_1 = CCSequence:create(var_19_0)
	local var_19_2 = CCArray:create()

	var_19_2:addObject(CCRepeat:create(var_19_1, 3))
	var_19_2:addObject(CCDelayTime:create(0.5))

	local var_19_3 = CCSequence:create(var_19_2)

	arg_19_0.view.widgets.tree:runAction(CCRepeatForever:create(var_19_3))
end

function var_0_16.addTouchLayer(arg_20_0)
	if not arg_20_0.maskLayer then
		local var_20_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_20_0:registerScriptTouchHandler(function(arg_21_0, arg_21_1, arg_21_2)
			if arg_21_0 == CCTOUCHBEGAN then
				log.info("CCTOUCH_BEGAN", arg_21_1, arg_21_2)

				for iter_21_0 = 1, 3 do
					local var_21_0 = tolua.cast(arg_20_0["shiPinPic" .. iter_21_0], "CCSprite")

					if tool.checkIfTouch(var_21_0, arg_21_1, arg_21_2) then
						local var_21_1 = language.get(135096, var_0_8[iter_21_0])

						if arg_20_0.info.goods[iter_21_0].needNum > 0 then
							var_21_1 = var_21_1 .. language.get(135095, var_0_8[iter_21_0], arg_20_0.info.goods[iter_21_0].needNum)
						end

						arg_20_0:showTip(var_21_0, var_21_1)

						return true
					end
				end

				if arg_20_0.boxReward and #arg_20_0.boxReward > 0 then
					for iter_21_1 = 1, #arg_20_0.boxReward do
						local var_21_2 = tolua.cast(arg_20_0.boxReward[iter_21_1].obj, "CCSprite")

						if tool.checkIfTouch(var_21_2, arg_21_1, arg_21_2) then
							log.info("触摸到普通礼盒了", arg_20_0.boxReward[iter_21_1].step)
							arg_20_0:onGetReward(arg_20_0.boxReward[iter_21_1].step)

							return true
						end
					end
				end

				if arg_20_0.bigGift and #arg_20_0.bigGift > 0 then
					for iter_21_2 = 1, #arg_20_0.bigGift do
						local var_21_3 = tolua.cast(arg_20_0.bigGift[iter_21_2].obj, "CCSprite")

						if tool.checkIfTouch(var_21_3, arg_21_1, arg_21_2) then
							log.info("触摸到大礼盒了")
							arg_20_0:onGetBigGift()

							return true
						end
					end
				end

				if tool.checkIfTouch(arg_20_0.view.widgets.tree, arg_21_1, arg_21_2) then
					local var_21_4, var_21_5 = tool.getPositionInScreen(arg_20_0.view.widgets.tree)

					if arg_21_2 >= 150 + var_21_5 and arg_21_2 < 230 + var_21_5 then
						if arg_20_0.info.currentId == 1 then
							arg_20_0:showTip(arg_20_0.view.widgets.tree, language.get(135103), ccp(var_21_4, 265))
						end
					elseif arg_21_2 >= 230 + var_21_5 and arg_21_2 <= 340 + var_21_5 and (arg_20_0.info.currentId == 1 or arg_20_0.info.currentId == 2) then
						arg_20_0:showTip(arg_20_0.view.widgets.tree, language.get(135104), ccp(var_21_4, 350))
					end

					return true
				end

				return false
			elseif arg_21_0 == CCTOUCHMOVED then
				log.info("CCTOUCH_MOVED", arg_21_1, arg_21_2)

				return true
			elseif arg_21_0 == CCTOUCHENDED then
				log.info("CCTOUCH_ENDED", arg_21_1, arg_21_2)

				return true
			end
		end, false, true)
		var_20_0:setTouchEnabled(true)
		arg_20_0.view.widgets.panel:addChild(var_20_0)

		arg_20_0.maskLayer = var_20_0
	end
end

function var_0_16.addArrow(arg_22_0)
	if arg_22_0.arrowNode then
		arg_22_0.arrowNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.arrowNode = CCNode:create()

		arg_22_0.arrowNode:setRotation(90)
		arg_22_0.view.widgets.panel:addChild(arg_22_0.arrowNode)
	end

	if arg_22_0.info.currentId >= 1 and arg_22_0.info.currentId <= 3 then
		local var_22_0 = {
			ccp(845, 180),
			ccp(825, 265),
			ccp(805, 350)
		}
		local var_22_1 = CCSprite:create("res/ui/guide/jiantou-xia.png")

		arg_22_0.arrowNode:addChild(var_22_1)
		arg_22_0.arrowNode:setPosition(var_22_0[arg_22_0.info.currentId])

		local var_22_2 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

		var_22_1:runAction(CCRepeatForever:create(var_22_2))
	end
end

function var_0_16.addShiPin(arg_23_0)
	if arg_23_0.boxNode then
		arg_23_0.boxNode:removeAllChildrenWithCleanup(true)
	else
		arg_23_0.boxNode = CCNode:create()

		arg_23_0.view.widgets.panel:addChild(arg_23_0.boxNode)
	end

	if arg_23_0.shiPinNode then
		arg_23_0.shiPinNode:setVisible(true)
	else
		arg_23_0.shiPinNode = CCNode:create()

		arg_23_0.view.widgets.tree:addChild(arg_23_0.shiPinNode)

		local var_23_0 = {
			{
				ccp(78, 133),
				ccp(166, 131),
				ccp(65, 100),
				ccp(141, 97),
				ccp(87, 167),
				ccp(89, 211),
				ccp(136, 201),
				ccp(111, 325),
				ccp(137, 288)
			},
			{
				ccp(204, 124),
				ccp(124, 138),
				ccp(37, 133),
				ccp(87, 73),
				ccp(151, 170),
				ccp(39, 168),
				ccp(174, 220),
				ccp(119, 251),
				ccp(69, 260)
			},
			{
				ccp(209, 85),
				ccp(16, 112),
				ccp(36, 80),
				ccp(170, 83),
				ccp(56, 212),
				ccp(189, 187),
				ccp(121, 166),
				ccp(86, 300),
				ccp(160, 262)
			}
		}

		for iter_23_0 = 1, 3 do
			local var_23_1 = CCSpriteBatchNode:create(var_0_10[iter_23_0])

			arg_23_0.shiPinNode:addChild(var_23_1)

			for iter_23_1 = 1, 9 do
				local var_23_2 = CCSprite:create(var_0_10[iter_23_0])

				var_23_2:setScale(0.35714285714285715)
				var_23_1:addChild(var_23_2)
				var_23_2:setPosition(var_23_0[iter_23_0][iter_23_1])

				arg_23_0["shiPinItem" .. iter_23_0 .. iter_23_1] = var_23_2
			end
		end
	end

	var_0_9 = {
		0,
		0,
		0
	}

	local var_23_3 = {
		ccp(706, 180),
		ccp(706, 265),
		ccp(706, 350)
	}

	arg_23_0.boxReward = {}

	for iter_23_2 = 1, 3 do
		local var_23_4 = arg_23_0.info.layers[iter_23_2]

		if var_23_4.haveReward then
			local var_23_5 = arg_23_0:addShineSprite(var_0_11[1], var_0_10[1], arg_23_0.boxNode, var_23_3[iter_23_2], 1)

			table.insert(arg_23_0.boxReward, {
				obj = var_23_5,
				step = iter_23_2
			})
		end

		for iter_23_3 = 1, 3 do
			local var_23_6 = var_23_4.obejects[iter_23_3]

			var_0_9[iter_23_3] = var_0_9[iter_23_3] + var_23_6.num
		end
	end

	for iter_23_4 = 1, 3 do
		for iter_23_5 = 1, 9 do
			arg_23_0["shiPinItem" .. iter_23_4 .. iter_23_5]:setColor(iter_23_5 <= var_0_9[iter_23_4] and var_0_6 or var_0_5)
		end
	end
end

function var_0_16.showSnowEffect(arg_24_0)
	if arg_24_0.snow then
		arg_24_0.snow:stopSystem()
		arg_24_0.snow:removeFromParentAndCleanup(true)

		arg_24_0.snow = nil
	end

	local var_24_0 = CCParticleSnow:create()

	arg_24_0.snow = var_24_0

	arg_24_0.view.widgets.panel:addChild(var_24_0, 1000)
	var_24_0:setPosition(706, 300)
	var_24_0:setLife(0.5)
	var_24_0:setLifeVar(0.5)
	var_24_0:setGravity(CCPointMake(0, -10))
	var_24_0:setSpeed(50)
	var_24_0:setSpeedVar(30)
	var_24_0:setEmissionRate(100)
	var_24_0:setTexture(CCTextureCache:sharedTextureCache():addImage("res/ui/activity/christmasDay/sdhd_xh.png"))
	var_24_0:setPosVar(CCPointMake(205, 120))
	var_24_0:setStartSize(15)
end

function var_0_16.showShakeTreeEffect(arg_25_0)
	if arg_25_0.effectNode then
		arg_25_0.effectNode:stopAllActions()

		local var_25_0 = arg_25_0.effectNode:getChildren()

		if var_25_0 and var_25_0:count() > 0 then
			for iter_25_0 = 1, var_25_0:count() do
				tolua.cast(var_25_0:objectAtIndex(iter_25_0 - 1), "CCParticleSystem"):stopSystem()
			end
		end

		arg_25_0.effectNode:removeAllChildrenWithCleanup(true)
	else
		arg_25_0.effectNode = CCNode:create()

		arg_25_0.view.widgets.panel:addChild(arg_25_0.effectNode, 200)
	end

	for iter_25_1 = 1, 2 do
		local var_25_1 = CCParticleSnow:create()

		arg_25_0.effectNode:addChild(var_25_1)
		var_25_1:setPosition(706, 300)
		var_25_1:setLife(0.25)
		var_25_1:setLifeVar(0.25)
		var_25_1:setGravity(CCPointMake(0, -10))
		var_25_1:setSpeed(100)
		var_25_1:setSpeedVar(30)
		var_25_1:setEmissionRate(60)
		var_25_1:setTexture(CCTextureCache:sharedTextureCache():addImage(string.format("res/ui/activity/christmasDay/sdhd_shake%02d.png", iter_25_1)))
		var_25_1:setPosVar(CCPointMake(115, 120))
		var_25_1:setStartSize(25)
		var_25_1:setStartSizeVar(15)
		var_25_1:setStartSpin(0)
		var_25_1:setStartSpinVar(2000)
	end

	for iter_25_2 = 1, 3 do
		local var_25_2 = CCParticleSnow:create()

		arg_25_0.effectNode:addChild(var_25_2)
		var_25_2:setPosition(706, 300)
		var_25_2:setLife(0.5)
		var_25_2:setLifeVar(0.25)
		var_25_2:setGravity(CCPointMake(0, -10))
		var_25_2:setSpeed(100)
		var_25_2:setSpeedVar(30)
		var_25_2:setEmissionRate(5)
		var_25_2:setTexture(CCTextureCache:sharedTextureCache():addImage(var_0_12[iter_25_2]))
		var_25_2:setPosVar(CCPointMake(90, 120))
		var_25_2:setStartSize(40)
		var_25_2:setStartSizeVar(15)
	end

	local var_25_3 = CCArray:create()

	var_25_3:addObject(CCDelayTime:create(2))
	var_25_3:addObject(CCCallFuncN:create(function()
		local var_26_0 = arg_25_0.effectNode:getChildren()

		if var_26_0 and var_26_0:count() > 0 then
			for iter_26_0 = 1, var_26_0:count() do
				tolua.cast(var_26_0:objectAtIndex(iter_26_0 - 1), "CCParticleSystem"):stopSystem()
			end
		end

		arg_25_0.effectNode:removeAllChildrenWithCleanup(true)
		arg_25_0:refresh()
	end))
	arg_25_0.effectNode:runAction(CCSequence:create(var_25_3))
end

function var_0_16.showLampEffect(arg_27_0)
	if arg_27_0.lampNode then
		arg_27_0.lampNode:setVisible(true)
	else
		arg_27_0.lampNode = CCNode:create()

		arg_27_0.view.widgets.tree:addChild(arg_27_0.lampNode)

		local var_27_0 = "res/ui/activity/christmasDay/sdhd_dg.png"
		local var_27_1 = {}
		local var_27_2 = {
			{
				ccp(81, 107),
				ccp(90, 266),
				ccp(109, 187),
				ccp(65, 179),
				ccp(151, 218)
			},
			{
				ccp(88, 107),
				ccp(97, 266),
				ccp(115, 187),
				ccp(50, 118),
				ccp(130, 112)
			}
		}

		for iter_27_0 = 1, 2 do
			local var_27_3 = CCSpriteBatchNode:create(var_27_0)

			var_27_1[iter_27_0] = var_27_3

			arg_27_0.lampNode:addChild(var_27_3)

			for iter_27_1 = 1, #var_27_2[1] do
				local var_27_4 = CCSprite:create(var_27_0)

				var_27_4:setScale(0.7)
				var_27_3:addChild(var_27_4)
				var_27_4:setPosition(var_27_2[iter_27_0][iter_27_1])
			end
		end

		local var_27_5 = CCArray:create()

		var_27_5:addObject(CCCallFuncN:create(function()
			var_27_1[1]:setVisible(not var_27_1[1]:isVisible())
			var_27_1[2]:setVisible(not var_27_1[1]:isVisible())
		end))
		var_27_5:addObject(CCDelayTime:create(0.3))

		local var_27_6 = CCSequence:create(var_27_5)

		arg_27_0.lampNode:runAction(CCRepeatForever:create(var_27_6))
	end
end

function var_0_16.addShineSprite(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5)
	local var_29_0 = CCSprite:create(arg_29_1)

	if arg_29_3 then
		arg_29_3:addChild(var_29_0, 100)
	else
		arg_29_0.view.widgets.panel:addChild(var_29_0, 100)
	end

	var_29_0:setPosition(arg_29_4)
	var_29_0:setScale(arg_29_5 or 1)

	local var_29_1 = CCSprite:create(arg_29_2)

	var_29_0:addChild(var_29_1)
	var_29_1:setAnchorPoint(ccp(0, 0))

	local var_29_2 = CCArray:create()

	var_29_2:addObject(CCFadeIn:create(0.5))
	var_29_2:addObject(CCFadeOut:create(0.5))
	var_29_2:addObject(CCFadeIn:create(0.5))
	var_29_2:addObject(CCFadeOut:create(0.5))
	var_29_2:addObject(CCDelayTime:create(0.5))

	local var_29_3 = CCSequence:create(var_29_2)

	var_29_0:runAction(CCRepeatForever:create(var_29_3))

	return var_29_0
end

function var_0_16.showPanel(arg_30_0, arg_30_1)
	arg_30_0.info = arg_30_1

	if arg_30_0.cityNode then
		arg_30_0.cityNode:removeAllChildrenWithCleanup(true)
	else
		arg_30_0.cityNode = CCNode:create()

		arg_30_0.cityNode:setPosition(ccp(250, 260))
		arg_30_0.view.widgets.panel:addChild(arg_30_0.cityNode)
	end

	arg_30_0.view.widgets.btn_city:setVisible(false)

	if arg_30_1.cities and #arg_30_1.cities >= 1 then
		arg_30_0.view.widgets.btn_city:setPosition(ccp((arg_30_1.cities[1].dropType - 34) * 160 - 70, 270))
		arg_30_0.view.widgets.btn_city:addHandleOfControlEvent(function()
			log.info("btn_city", arg_30_1.cities[1].cityId)
			arg_30_0:onGoToCity(arg_30_1.cities[1].cityId)
		end, CCControlEventTouchUpInside)
		arg_30_0.view.widgets.btn_city:setVisible(true)
		arg_30_0.view.widgets.Lb_cityName:setString(arg_30_1.cities[1].cityName)
	elseif arg_30_1.cd and arg_30_1.cd > 0 then
		local function var_30_0()
			arg_30_0:refresh()
		end

		for iter_30_0 = 1, 3 do
			local var_30_1 = createTimerLabel(arg_30_1.cd + 5000, arg_30_1.cd > 3600000 and "@H:@M:@S" or "@M:@S", "Thonburi", 26, iter_30_0 == 1 and var_30_0 or nil, nil, nil, var_0_3)

			arg_30_0.cityNode:addChild(var_30_1)
			var_30_1:setPosition(ccp((iter_30_0 - 2) * 160, 0))
		end
	end

	for iter_30_1 = 1, 3 do
		local var_30_2 = arg_30_1.goods[iter_30_1]

		arg_30_0["shiPinNum" .. iter_30_1]:setString(language.get(135039, var_30_2.num))
		arg_30_0["btn_ZS" .. iter_30_1]:setEnabled(var_30_2.num >= var_30_2.needNum)
	end

	arg_30_0.view.widgets.tree:stopAllActions()
	arg_30_0:addShiPin()
	arg_30_0:addArrow()

	if var_0_9[1] > 0 or var_0_9[2] > 0 or var_0_9[3] > 0 then
		arg_30_0:showLampEffect()
		arg_30_0:showSnowEffect()
	end

	arg_30_0.bigGift = {}

	if arg_30_0.bigGiftNode then
		arg_30_0.bigGiftNode:removeAllChildrenWithCleanup(true)
	else
		arg_30_0.bigGiftNode = CCNode:create()

		arg_30_0.view.widgets.panel:addChild(arg_30_0.bigGiftNode)
	end

	if arg_30_1.giftNum >= 1 then
		arg_30_0.view.widgets.btn_shake:setVisible(false)

		local var_30_3 = {
			ccp(740, 80),
			ccp(670, 60),
			ccp(690, 105)
		}

		if arg_30_1.giftNum > 3 then
			arg_30_1.giftNum = 3
		end

		for iter_30_2 = 1, arg_30_1.giftNum do
			local var_30_4 = arg_30_0:addShineSprite(var_0_13, var_0_12[iter_30_2], arg_30_0.bigGiftNode, var_30_3[iter_30_2], 1.78)

			table.insert(arg_30_0.bigGift, {
				obj = var_30_4
			})
		end
	else
		arg_30_0.view.widgets.btn_shake:setVisible(arg_30_1.display)

		if arg_30_1.display then
			if arg_30_1.yyyNum > 0 then
				arg_30_0.view.widgets.Lb_shake:setString(language.get(135101))
				arg_30_0.view.widgets.goldLb:setVisible(true)
				arg_30_0.view.widgets.goldLb:setString(language.get(135039, arg_30_1.gold))
			else
				arg_30_0.view.widgets.Lb_shake:setString(language.get(135100))
				arg_30_0.view.widgets.goldLb:setVisible(false)
			end

			arg_30_0.shiPinNode:setVisible(false)
			arg_30_0.lampNode:setVisible(false)

			if arg_30_0.snow then
				arg_30_0.snow:stopSystem()
				arg_30_0.snow:removeFromParentAndCleanup(true)

				arg_30_0.snow = nil
			end

			arg_30_0:showTreeEffect()
		end

		if not arg_30_1.display and arg_30_1.currentId >= 1 and arg_30_1.currentId <= 3 then
			arg_30_0.view.widgets.Lb_info:setString(language.get(135105, var_0_14[arg_30_1.currentId]))
			arg_30_0.view.widgets.Lb_info:setVisible(true)
		else
			arg_30_0.view.widgets.Lb_info:setVisible(false)
		end
	end

	if arg_30_1.yyyNum > 0 and not arg_30_1.display and arg_30_1.giftNum == 0 then
		arg_30_0.view.widgets.Lb_info:setString(language.get(135107))
		arg_30_0.view.widgets.Lb_info:setVisible(true)
	end
end

function var_0_16.ctor(arg_33_0, arg_33_1, arg_33_2)
	log.info("@@ 圣诞活动")

	arg_33_0.view = {}

	uiutil.initWidgets(arg_33_0.view, arg_33_0.layout)

	arg_33_0.leftTime = arg_33_0.view.widgets.leftTime

	if arg_33_1 then
		arg_33_0:addChild(arg_33_0.view.widgets.panel)
		arg_33_1:addChild(arg_33_0)
	end

	for iter_33_0 = 1, 3 do
		local var_33_0 = {}

		uiutil.initWidgets(var_33_0, arg_33_0:getShiPinCard(iter_33_0))
		arg_33_0.view.widgets.panel:addChild(var_33_0.widgets["shiPinNode" .. iter_33_0], 10)

		arg_33_0["shiPinNode" .. iter_33_0] = var_33_0.widgets["shiPinNode" .. iter_33_0]
		arg_33_0["btn_ZS" .. iter_33_0] = var_33_0.widgets["btn_ZS" .. iter_33_0]

		arg_33_0["btn_ZS" .. iter_33_0]:addHandleOfControlEvent(function()
			log.info("装饰按钮，btn_ZS" .. iter_33_0)
			arg_33_0:onDecorateTree(iter_33_0)
		end, CCControlEventTouchUpInside)

		arg_33_0["shiPinNum" .. iter_33_0] = var_33_0.widgets["shiPinNum" .. iter_33_0]
		arg_33_0["shiPinPic" .. iter_33_0] = var_33_0.widgets["shiPinPic" .. iter_33_0]
	end

	arg_33_0.view.widgets.btn_shake:addHandleOfControlEvent(function()
		log.info("btn摇一摇")
		arg_33_0:onShakeTree()
	end, CCControlEventTouchUpInside)
	arg_33_0:addTouchLayer()
	arg_33_0:showPanel(arg_33_2)
end

function var_0_16.showTip(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	log.info("should show tips ")

	local var_36_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_36_0:registerScriptTouchHandler(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == CCTOUCHBEGAN then
			return true
		elseif arg_37_0 == CCTOUCHMOVED then
			return true
		elseif arg_37_0 == CCTOUCHENDED then
			pcall(var_36_0.removeFromParentAndCleanup, var_36_0, true)

			return true
		end
	end, false, true)
	var_36_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_36_0, 60000)

	local var_36_1 = 0
	local var_36_2 = 0
	local var_36_3 = {}

	uiutil.initWidgets(var_36_3, var_0_16.tipFrame)
	var_36_0:addChild(var_36_3.widgets.tipFrame)
	var_36_3.widgets.tipFrame:setAnchorPoint(ccp(0.5, 0.5))
	var_36_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

	local var_36_4, var_36_5 = tool.getPositionInScreen(arg_36_1)
	local var_36_6 = var_36_4 + 40
	local var_36_7 = var_36_5 + 65

	var_36_3.widgets.tipMsg:setString(arg_36_2)

	local var_36_8 = var_36_3.widgets.tipMsg:getContentSize().width
	local var_36_9 = var_36_3.widgets.tipMsg:getContentSize().height

	var_36_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_36_8 + 30, var_36_9 + 30))
	var_36_3.widgets.tipFrame:setPosition(arg_36_3 or ccp(var_36_6, var_36_7))
	var_36_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_36_3.widgets.tipFrame:setVisible(true)
end

return var_0_16
