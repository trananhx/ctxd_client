local var_0_0 = colorQuality[1]
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = {}

var_0_4.btn_jdt = 1
var_0_4.btn_tip = 2

local var_0_5 = class("MidAutumn", function()
	return createBaseLayer()
end)
local var_0_6 = 800
local var_0_7 = 33

var_0_5.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/midAutumn/ybjl_di.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 493,
			type = "sprite",
			pic = {
				frame = true,
				path = "ybjl_bt.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 485,
			type = "label",
			x = 730,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_2
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 493,
			type = "button",
			x = 860
		},
		{
			style = "button_tip",
			name = "btn_jdt",
			type = "button",
			y = 356,
			x = 458,
			w = var_0_6,
			h = var_0_7 + 30
		},
		{
			x = 458,
			name = "jdtBg_light",
			type = "sprite9",
			y = 371,
			visible = false,
			pic = {
				frame = true,
				path = "ybjl_jdt_di2.png"
			},
			middleRect = CCRectMake(36, 16, 1, 1),
			preferedSize = CCSizeMake(var_0_6 + 10, var_0_7 + 10)
		},
		{
			x = 458,
			name = "jdtBg",
			type = "sprite9",
			y = 370,
			pic = {
				frame = true,
				path = "ybjl_jdt_di1.png"
			},
			middleRect = CCRectMake(36, 16, 1, 1),
			preferedSize = CCSizeMake(var_0_6, var_0_7),
			children = {
				{
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = (var_0_6 - 40) * 0.2 + 20,
					y = var_0_7 / 2 + 1
				},
				{
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = (var_0_6 - 40) * 0.4 + 20,
					y = var_0_7 / 2 + 1
				},
				{
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = (var_0_6 - 40) * 0.6 + 20,
					y = var_0_7 / 2 + 1
				},
				{
					type = "sprite",
					zorder = 10,
					pic = {
						frame = false,
						path = "res/ui/activity/gemsActivity/jdt_fg.png"
					},
					x = (var_0_6 - 40) * 0.8 + 20,
					y = var_0_7 / 2 + 1
				},
				{
					x = 20,
					name = "jdt1",
					type = "sprite",
					visible = false,
					zorder = 0,
					pic = {
						frame = true,
						path = "ybjl_jdt1.png"
					},
					anchorPoint = ccp(0, 0.5),
					y = var_0_7 / 2 + 1
				},
				{
					style = "button_tip",
					name = "btn_box1",
					h = 60,
					type = "button",
					w = 60,
					y = 60,
					x = (var_0_6 - 40) * 0.2 + 20
				},
				{
					style = "button_tip",
					name = "btn_box2",
					h = 60,
					type = "button",
					w = 60,
					y = 60,
					x = (var_0_6 - 40) * 0.4 + 20
				},
				{
					style = "button_tip",
					name = "btn_box3",
					h = 60,
					type = "button",
					w = 60,
					y = 60,
					x = (var_0_6 - 40) * 0.6 + 20
				},
				{
					style = "button_tip",
					name = "btn_box4",
					h = 60,
					type = "button",
					w = 60,
					y = 60,
					x = (var_0_6 - 40) * 0.8 + 20
				},
				{
					style = "button_tip",
					name = "btn_box5",
					h = 60,
					type = "button",
					w = 60,
					y = 60,
					x = var_0_6 - 40 + 20
				},
				{
					x = 20,
					y = -20,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybjl_yb2.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					visible = false,
					name = "num1",
					type = "atlaslabel",
					pic = "res/ui/common/number/up_numb.png",
					startCharMap = 48,
					text = "0",
					y = -20,
					itemWidth = 16,
					itemHeight = 21,
					x = (var_0_6 - 40) * 0.2 + 20
				},
				{
					visible = false,
					name = "num2",
					type = "atlaslabel",
					pic = "res/ui/common/number/up_numb.png",
					startCharMap = 48,
					text = "0",
					y = -20,
					itemWidth = 16,
					itemHeight = 21,
					x = (var_0_6 - 40) * 0.4 + 20
				},
				{
					visible = false,
					name = "num3",
					type = "atlaslabel",
					pic = "res/ui/common/number/up_numb.png",
					startCharMap = 48,
					text = "0",
					y = -20,
					itemWidth = 16,
					itemHeight = 21,
					x = (var_0_6 - 40) * 0.6 + 20
				},
				{
					visible = false,
					name = "num4",
					type = "atlaslabel",
					pic = "res/ui/common/number/up_numb.png",
					startCharMap = 48,
					text = "0",
					y = -20,
					itemWidth = 16,
					itemHeight = 21,
					x = (var_0_6 - 40) * 0.8 + 20
				},
				{
					visible = false,
					name = "num5",
					type = "atlaslabel",
					pic = "res/ui/common/number/up_numb.png",
					startCharMap = 48,
					text = "0",
					y = -20,
					itemWidth = 16,
					itemHeight = 21,
					x = (var_0_6 - 40) * 1 + 20
				}
			}
		},
		{
			x = 0,
			y = 2,
			scale = 0.9,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/guide/npc_xq.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			x = 185,
			name = "chatBox",
			y = 35,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/guide/npc_chat_view.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			fontSize = 24,
			height = 0,
			name = "chatMsg",
			type = "label",
			width = 235,
			style = "label_warlock",
			y = 0,
			x = 0,
			anchorPoint = ccp(0, 0.5),
			halign = kCCTextAlignmentLeft,
			color = var_0_0
		},
		{
			x = 400,
			name = "pic_army",
			y = 110,
			type = "sprite",
			pic = {
				frame = true,
				path = "ybjl_ybbd.png"
			}
		},
		{
			y = 90,
			name = "btn_city",
			style = "button_yel1",
			type = "button",
			visible = false,
			x = 280,
			children = {
				{
					fontSize = 22,
					style = "label_warlock",
					y = 29,
					type = "label",
					x = 49,
					textId = 420008,
					color = var_0_0
				}
			}
		},
		{
			fontSize = 26,
			name = "Lb_cityName",
			y = 130,
			type = "label",
			style = "label_warlock",
			x = 280,
			visible = false,
			color = ccc3(0, 255, 0)
		},
		{
			x = 500,
			y = 15,
			type = "sprite9",
			pic = {
				frame = false,
				path = "res/ui/general/jailView/comm_view_laofang_1.png"
			},
			anchorPoint = ccp(0, 0),
			middleRect = CCRectMake(51, 51, 1, 1),
			preferedSize = CCSizeMake(380, 230),
			children = {
				{
					y = 250,
					x = 190,
					scale = 0.8,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybjl_yb1.png"
					}
				},
				{
					fontSize = 26,
					name = "Lb_totalNumInfo",
					y = 250,
					type = "label",
					x = 170,
					style = "label_warlock",
					anchorPoint = ccp(1, 0.5),
					color = var_0_2
				},
				{
					fontSize = 26,
					name = "Lb_totalNum",
					y = 250,
					type = "label",
					x = 210,
					style = "label_warlock",
					anchorPoint = ccp(0, 0.5),
					color = var_0_2
				},
				{
					x = 20,
					y = 70,
					type = "sprite9",
					pic = {
						frame = true,
						path = "common_tip_frame_small.png"
					},
					anchorPoint = ccp(0, 0),
					middleRect = CCRectMake(36, 16, 1, 1),
					preferedSize = CCSizeMake(160, 140)
				},
				{
					x = 100,
					y = 140,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybjl_lwh1.png"
					}
				},
				{
					x = 45,
					y = 35,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybjl_yb1.png"
					}
				},
				{
					fontSize = 26,
					name = "Lb_needNum",
					y = 35,
					type = "label",
					x = 75,
					style = "label_warlock",
					anchorPoint = ccp(0, 0.5),
					color = var_0_2
				},
				{
					x = 220,
					y = 190,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_100.png"
					}
				},
				{
					x = 220,
					y = 140,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_3.png"
					}
				},
				{
					x = 220,
					y = 90,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_4.png"
					}
				},
				{
					fontSize = 26,
					name = "Lb_ticket",
					y = 190,
					type = "label",
					x = 250,
					style = "label_warlock",
					anchorPoint = ccp(0, 0.5),
					color = var_0_3
				},
				{
					fontSize = 26,
					name = "Lb_food",
					y = 140,
					type = "label",
					x = 250,
					style = "label_warlock",
					anchorPoint = ccp(0, 0.5),
					color = var_0_3
				},
				{
					fontSize = 26,
					name = "Lb_iron",
					y = 90,
					type = "label",
					x = 250,
					style = "label_warlock",
					anchorPoint = ccp(0, 0.5),
					color = var_0_3
				},
				{
					y = 40,
					name = "btn_reward",
					style = "button_gre3",
					type = "button",
					visible = true,
					x = 270,
					children = {
						{
							fontSize = 22,
							style = "label_warlock",
							y = 27,
							type = "label",
							x = 70,
							textId = 92013,
							color = var_0_0
						}
					}
				}
			}
		}
	}
}
var_0_5.tipFrame = {
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
			color = var_0_0
		}
	}
}

function var_0_5.close(arg_2_0)
	local var_2_0 = smgr.getLayer("topLayer")

	tool.safeRemoveChildByTag(var_2_0, s_windows.tag.activity)
end

function var_0_5.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getMidAutumnActivity)
end

function var_0_5.onGetReward(arg_5_0, arg_5_1)
	log.info("onGetReward" .. arg_5_1)

	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data
		local var_6_1 = {
			{}
		}

		if var_6_0.food then
			var_6_1[1].id = 3
			var_6_1[1].value = var_6_0.food
		elseif var_6_0.dstq then
			var_6_1[1].id = 24
			var_6_1[1].value = var_6_0.dstq
		elseif var_6_0.phantom then
			var_6_1[1].id = 41
			var_6_1[1].value = var_6_0.phantom
		elseif var_6_0.token then
			var_6_1[1].id = 80
			var_6_1[1].value = var_6_0.token
		end

		globalAction_gotResource(var_6_1)
		arg_5_0:refresh()
	end

	cmgr.sendRequest(var_5_0, actions.getMidAutumnReward, arg_5_1)
end

function var_0_5.onGetBigGift(arg_7_0)
	log.info("onGetBigGift")

	local function var_7_0(arg_8_0)
		local var_8_0 = arg_8_0.action.data
		local var_8_1 = {}

		if var_8_0.ticket then
			local var_8_2 = {}

			var_8_2.id = 100
			var_8_2.value = var_8_0.ticket

			table.insert(var_8_1, var_8_2)
		end

		if var_8_0.food then
			local var_8_3 = {}

			var_8_3.id = 3
			var_8_3.value = var_8_0.food

			table.insert(var_8_1, var_8_3)
		end

		if var_8_0.iron then
			local var_8_4 = {}

			var_8_4.id = 4
			var_8_4.value = var_8_0.iron

			table.insert(var_8_1, var_8_4)
		end

		globalAction_gotResource(var_8_1)
		arg_7_0:refresh()
	end

	cmgr.sendRequest(var_7_0, actions.getMidAutumnBigGift)
end

function var_0_5.onGoToCity(arg_9_0, arg_9_1)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	loadingLayer.show(SCENE_WORLD, arg_9_1)
end

function var_0_5.showLightEffect(arg_10_0, arg_10_1)
	local var_10_0 = 12
	local var_10_1 = CCArray:create()

	for iter_10_0 = 1, var_10_0 do
		local var_10_2 = string.format("ybjl_light%02d.png", iter_10_0)
		local var_10_3 = tool.spriteByName(var_10_2):displayFrame()

		var_10_1:addObject(var_10_3)
	end

	local var_10_4 = CCAnimation:createWithSpriteFrames(var_10_1, 0.05)
	local var_10_5 = CCAnimate:create(var_10_4)
	local var_10_6 = CCRepeatForever:create(var_10_5)
	local var_10_7 = CCSprite:create()
	local var_10_8 = arg_10_0.view.widgets.btn_box1:getContentSize()

	var_10_7:setPosition(ccp(var_10_8.width / 2, var_10_8.height / 2))
	arg_10_1:addChild(var_10_7)
	var_10_7:setScale(0.4)
	var_10_7:runAction(var_10_6)
end

function var_0_5.showRotateEffect(arg_11_0, arg_11_1)
	local var_11_0 = CCEaseExponentialOut:create(CCRotateBy:create(0.15, -10))
	local var_11_1 = CCEaseExponentialOut:create(CCRotateBy:create(0.3, 20))
	local var_11_2 = CCEaseExponentialOut:create(CCRotateBy:create(0.15, -10))
	local var_11_3 = CCArray:create()

	var_11_3:addObject(var_11_0)
	var_11_3:addObject(var_11_1)
	var_11_3:addObject(var_11_2)

	local var_11_4 = CCSequence:create(var_11_3)

	arg_11_1:runAction(CCRepeatForever:create(var_11_4))
end

function var_0_5.showPanel(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.view.widgets.btn_box1:getContentSize()

	for iter_12_0 = 1, 5 do
		local var_12_1 = arg_12_1.gifts[iter_12_0]

		arg_12_0.view.widgets["num" .. iter_12_0]:setVisible(true)
		arg_12_0.view.widgets["num" .. iter_12_0]:setString(var_12_1.needNum)
		arg_12_0.view.widgets["btn_box" .. iter_12_0]:stopAllActions()
		arg_12_0.view.widgets["btn_box" .. iter_12_0]:removeAllChildrenWithCleanup(true)

		if var_12_1.state == 0 then
			local var_12_2 = tool.spriteByName("ybjl_lwhbd.png")

			var_12_2:setPosition(ccp(var_12_0.width / 2, var_12_0.height / 2 - 23))
			var_12_2:setAnchorPoint(ccp(0.5, 0))
			arg_12_0.view.widgets["btn_box" .. iter_12_0]:addChild(var_12_2)
			arg_12_0.view.widgets["btn_box" .. iter_12_0]:setEnabled(true)
			arg_12_0:showRotateEffect(var_12_2)
			arg_12_0:showLightEffect(arg_12_0.view.widgets["btn_box" .. iter_12_0])
		elseif var_12_1.state == 1 then
			local var_12_3 = tool.spriteByName("ybjl_lwhdk.png")

			var_12_3:setPosition(ccp(var_12_0.width / 2, var_12_0.height / 2 - 3))
			arg_12_0.view.widgets["btn_box" .. iter_12_0]:addChild(var_12_3)
			arg_12_0.view.widgets["btn_box" .. iter_12_0]:setEnabled(false)
		elseif var_12_1.state == 2 then
			local var_12_4 = tool.spriteByName("ybjl_lwh1.png")

			var_12_4:setPosition(ccp(var_12_0.width / 2, var_12_0.height / 2))
			var_12_4:setScale(0.3)
			arg_12_0.view.widgets["btn_box" .. iter_12_0]:addChild(var_12_4)
			tool.spriteToGray(var_12_4)
			arg_12_0.view.widgets["btn_box" .. iter_12_0]:setEnabled(false)
		end
	end

	local var_12_5 = (var_0_6 - 40) / 5
	local var_12_6 = arg_12_1.num
	local var_12_7 = arg_12_1.gifts[1].needNum
	local var_12_8 = arg_12_1.gifts[2].needNum
	local var_12_9 = arg_12_1.gifts[3].needNum
	local var_12_10 = arg_12_1.gifts[4].needNum
	local var_12_11 = arg_12_1.gifts[5].needNum

	if var_12_11 <= var_12_6 and (arg_12_1.gifts[1].state == 0 or arg_12_1.gifts[2].state == 0 or arg_12_1.gifts[3].state == 0 or arg_12_1.gifts[4].state == 0 or arg_12_1.gifts[5].state == 0) then
		arg_12_0.view.widgets.jdtBg_light:setVisible(true)
	else
		arg_12_0.view.widgets.jdtBg_light:setVisible(false)
	end

	if var_12_6 > 0 then
		local var_12_12 = 0

		if var_12_6 <= var_12_7 then
			var_12_12 = var_12_5 * (var_12_6 / var_12_7)
		elseif var_12_7 < var_12_6 and var_12_6 <= var_12_8 then
			var_12_12 = var_12_5 * (1 + (var_12_6 - var_12_7) / (var_12_8 - var_12_7))
		elseif var_12_8 < var_12_6 and var_12_6 <= var_12_9 then
			var_12_12 = var_12_5 * (2 + (var_12_6 - var_12_8) / (var_12_9 - var_12_8))
		elseif var_12_9 < var_12_6 and var_12_6 <= var_12_10 then
			var_12_12 = var_12_5 * (3 + (var_12_6 - var_12_9) / (var_12_10 - var_12_9))
		elseif var_12_10 < var_12_6 and var_12_6 <= var_12_11 then
			var_12_12 = var_12_5 * (4 + (var_12_6 - var_12_10) / (var_12_11 - var_12_10))
		else
			var_12_12 = var_12_5 * 5
		end

		arg_12_0.view.widgets.jdt1:setVisible(true)
		arg_12_0.view.widgets.jdt1:setScaleX(var_12_12)
	else
		arg_12_0.view.widgets.jdt1:setVisible(false)
	end

	arg_12_0.view.widgets.btn_city:setVisible(false)
	arg_12_0.view.widgets.Lb_cityName:setVisible(false)
	arg_12_0.view.widgets.pic_army:setVisible(false)

	if arg_12_0.armyTimerLabel then
		arg_12_0.armyTimerLabel:removeFromParentAndCleanup(true)

		arg_12_0.armyTimerLabel = nil
	end

	if arg_12_1.totalNum >= arg_12_1.needNum then
		arg_12_0.view.widgets.chatMsg:setString(language.get(135014))
		arg_12_0.view.widgets.chatMsg:setPosition(ccp(225, 140))
	elseif var_12_11 <= arg_12_1.num then
		arg_12_0.view.widgets.chatMsg:setString(language.get(135015))
		arg_12_0.view.widgets.chatMsg:setPosition(ccp(225, 140))
	else
		arg_12_0.view.widgets.chatMsg:setString(language.get(135011))
		arg_12_0.view.widgets.chatMsg:setPosition(ccp(225, 180))

		if arg_12_1.cities and #arg_12_1.cities >= 1 then
			arg_12_0.view.widgets.btn_city:addHandleOfControlEvent(function()
				log.info("btn_city", arg_12_1.cities[1].cityId)
				arg_12_0:onGoToCity(arg_12_1.cities[1].cityId)
			end, CCControlEventTouchUpInside)
			arg_12_0.view.widgets.btn_city:setVisible(true)
			arg_12_0.view.widgets.Lb_cityName:setVisible(true)
			arg_12_0.view.widgets.Lb_cityName:setString(arg_12_1.cities[1].cityName)
			arg_12_0.view.widgets.pic_army:setVisible(true)
		elseif arg_12_1.cd and arg_12_1.cd > 0 then
			local function var_12_13()
				if arg_12_0.armyTimerLabel then
					arg_12_0.armyTimerLabel:removeFromParentAndCleanup(true)

					arg_12_0.armyTimerLabel = nil
				end

				arg_12_0:refresh()
			end

			local var_12_14 = createTimerLabel(arg_12_1.cd, "@M:@S", "Thonburi", 26, var_12_13, nil, nil, ccc3(255, 0, 0))

			arg_12_0.armyTimerLabel = var_12_14

			local var_12_15, var_12_16 = arg_12_0.view.widgets.Lb_cityName:getPosition()

			var_12_14:setPosition(ccp(var_12_15, var_12_16))
			arg_12_0.view.widgets.panel:addChild(var_12_14)
			arg_12_0.view.widgets.pic_army:setVisible(false)
		end
	end

	if var_12_11 <= arg_12_1.num then
		arg_12_0.view.widgets.Lb_totalNumInfo:setString(language.get(135018))
		arg_12_0.view.widgets.Lb_totalNum:setString(language.get(490026, arg_12_1.totalNum))
		arg_12_0.view.widgets.Lb_totalNumInfo:setColor(var_0_2)
		arg_12_0.view.widgets.Lb_totalNum:setColor(var_0_2)
	else
		arg_12_0.view.widgets.Lb_totalNumInfo:setString(language.get(135012))
		arg_12_0.view.widgets.Lb_totalNum:setString(language.get(490026, arg_12_1.totalNum))
		arg_12_0.view.widgets.Lb_totalNumInfo:setColor(var_0_0)
		arg_12_0.view.widgets.Lb_totalNum:setColor(var_0_0)
	end

	arg_12_0.view.widgets.Lb_needNum:setString(language.get(490026, arg_12_1.needNum))
	arg_12_0.view.widgets.Lb_ticket:setString(language.get(490026, arg_12_1.ticket))
	arg_12_0.view.widgets.Lb_food:setString(language.get(490026, arg_12_1.food))
	arg_12_0.view.widgets.Lb_iron:setString(language.get(490026, arg_12_1.iron))
	arg_12_0.view.widgets.btn_reward:setEnabled(arg_12_1.canReceived)
end

function var_0_5.ctor(arg_15_0, arg_15_1, arg_15_2)
	log.info("@@ 中秋活动")
	rmgr.loadResource("res/ui/activity/midAutumn/midAutumn.plist")

	arg_15_0.view = {}

	uiutil.initWidgets(arg_15_0.view, arg_15_0.layout)

	arg_15_0.leftTime = arg_15_0.view.widgets.leftTime

	if arg_15_1 then
		arg_15_0:addChild(arg_15_0.view.widgets.panel)
		arg_15_1:addChild(arg_15_0)
	end

	arg_15_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_15_0:showTip(var_0_4.btn_tip)
	end, CCControlEventTouchUpInside)

	for iter_15_0 = 1, 5 do
		arg_15_0.view.widgets["btn_box" .. iter_15_0]:setOpacity(0)
		arg_15_0.view.widgets["btn_box" .. iter_15_0]:addHandleOfControlEvent(function()
			log.info("btn_box", iter_15_0)
			arg_15_0:onGetReward(iter_15_0)
		end, CCControlEventTouchUpInside)
		arg_15_0.view.widgets["num" .. iter_15_0]:setScale(1.5)
	end

	arg_15_0.view.widgets.btn_jdt:setOpacity(0)
	arg_15_0.view.widgets.btn_jdt:addHandleOfControlEvent(function()
		log.info("btn_jdt")
		arg_15_0:showTip(var_0_4.btn_jdt, arg_15_2)
	end, CCControlEventTouchUpInside)
	arg_15_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_15_0:onGetBigGift()
	end, CCControlEventTouchUpInside)
	arg_15_0.view.widgets.chatBox:setScaleX(0.85)
	arg_15_0:showPanel(arg_15_2)
end

function var_0_5.showTip(arg_20_0, arg_20_1, arg_20_2)
	log.info("should show tips ")

	local var_20_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_20_0:registerScriptTouchHandler(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			return true
		elseif arg_21_0 == CCTOUCHMOVED then
			return true
		elseif arg_21_0 == CCTOUCHENDED then
			pcall(var_20_0.removeFromParentAndCleanup, var_20_0, true)

			return true
		end
	end, false, true)
	var_20_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_20_0, 60000)

	local var_20_1 = 0
	local var_20_2 = 0
	local var_20_3 = {}

	uiutil.initWidgets(var_20_3, var_0_5.tipFrame)
	var_20_0:addChild(var_20_3.widgets.tipFrame)

	if arg_20_1 == var_0_4.btn_tip then
		local var_20_4, var_20_5 = tool.getPositionInScreen(arg_20_0.view.widgets.btn_tip)

		var_20_1 = var_20_4 + 20
		var_20_2 = var_20_5 - 20
	elseif arg_20_1 == var_0_4.btn_jdt then
		var_20_3.widgets.tipFrame:setAnchorPoint(ccp(0.5, 0.5))
		var_20_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

		local var_20_6, var_20_7 = tool.getPositionInScreen(arg_20_0.view.widgets.btn_jdt)

		var_20_1 = var_20_6
		var_20_2 = var_20_7 + 65

		var_20_3.widgets.tipMsg:setString(language.get(135023, arg_20_2.num))
	end

	local var_20_8 = var_20_3.widgets.tipMsg:getContentSize().width
	local var_20_9 = var_20_3.widgets.tipMsg:getContentSize().height

	var_20_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_20_8 + 30, var_20_9 + 30))
	var_20_3.widgets.tipFrame:setPosition(ccp(var_20_1, var_20_2))
	var_20_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_20_3.widgets.tipFrame:setVisible(true)
end

return var_0_5
