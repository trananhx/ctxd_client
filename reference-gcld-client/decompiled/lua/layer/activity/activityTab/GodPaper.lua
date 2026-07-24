local var_0_0 = {
	[4] = {
		type = 4
	},
	[21] = {
		type = 7
	},
	[110] = {
		type = 110
	},
	[5] = {
		type = 6
	},
	[19] = {
		type = 19
	},
	[40] = {
		type = 40
	},
	[42] = {
		type = 5
	},
	[81] = {
		type = 24
	},
	[102] = {
		type = 41
	},
	[100] = {
		type = 100
	},
	[116] = {
		type = 55
	},
	[119] = {
		type = 10033
	},
	[126] = {
		type = 10030
	},
	[113] = {
		type = 2003
	},
	[125] = {
		type = 10041
	},
	[216] = {
		type = 216
	}
}
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = {}

if conf.language == "vie" then
	var_0_6.titleX = 20
	var_0_6.titlescale = 0.7
else
	var_0_6.titleX = 0
	var_0_6.titlescale = 1
end

local var_0_7 = class("GodPaper", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					anchorPointX = 0.5,
					type = "richLine",
					gap = -25,
					x = 458,
					y = 480 + var_0_6.titleX,
					scale = var_0_6.titlescale,
					content = {
						{
							y = 480,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/activity/ironSell/word_xin.png"
							}
						},
						{
							y = 480,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/activity/godPaper/czzyb_title.png"
							}
						}
					}
				},
				{
					style = "button_tip",
					name = "btn_tip",
					y = 480,
					type = "button",
					x = 860
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 470,
					type = "label",
					x = 740,
					color = var_0_3
				},
				{
					y = 360,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/godPaper/czzyb_longbg.png"
					}
				},
				{
					y = 140,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/godPaper/czzyb_longbg2.png"
					}
				},
				{
					y = 3,
					type = "sprite",
					x = 3,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/activity/godPaper/czzyb_caishen.png"
					}
				},
				{
					y = 460,
					type = "sprite",
					x = 3,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/activity/fishing/hjcd_top_line.png"
					},
					children = {
						{
							anchorPointX = 0,
							name = "richLine_gold",
							y = 30,
							type = "richLine",
							gap = 0,
							x = 5,
							content = {
								{
									fontSize = 25,
									type = "label",
									textId = 131101,
									color = var_0_1,
									anchorPoint = ccp(0, 0.5)
								},
								{
									fontSize = 25,
									name = "gold",
									type = "label",
									color = var_0_4,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					y = 355,
					name = "bg_bar",
					type = "sprite",
					x = 610,
					pic = {
						path = "res/ui/activity/godPaper/czzyb_pb_bg.png"
					},
					children = {
						{
							y = 0,
							name = "bar",
							type = "progressbar",
							x = 0,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/activity/godPaper/czzyb_pb.png"
							}
						},
						{
							y = 20,
							type = "sprite",
							x = -20,
							pic = {
								path = "res/ui/activity/godSendRed/yuanbao.png"
							},
							children = {
								{
									y = 17,
									x = 25,
									type = "sprite",
									pic = {
										path = "res/ui/rankInfo/DailyFeatView/word_chong.png"
									}
								}
							}
						},
						{
							fontSize = 25,
							name = "Text_7",
							y = -10,
							type = "label",
							x = 85
						},
						{
							fontSize = 25,
							name = "Text_7_Copy",
							y = 50,
							type = "label",
							x = 85
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_city",
					h = 50,
					type = "button",
					w = 500,
					y = 265,
					visible = false,
					x = 610,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							name = "richLine_city",
							y = 25,
							type = "richLine",
							gap = 0,
							x = 250,
							content = {
								{
									fontSize = 25,
									type = "label",
									textId = 135612
								},
								{
									name = "city",
									fontSize = 25,
									type = "label",
									color = var_0_2
								},
								{
									fontSize = 25,
									type = "label",
									textId = 135614
								}
							}
						}
					}
				},
				{
					anchorPointX = 0.5,
					name = "richLine_time",
					type = "richLine",
					visible = false,
					y = 265,
					gap = 0,
					x = 610,
					content = {
						{
							text = "00:00",
							name = "time",
							fontSize = 25,
							type = "label",
							color = var_0_3,
							anchorPoint = ccp(1, 0.5)
						},
						{
							fontSize = 25,
							type = "label",
							textId = 135613,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					fontSize = 25,
					name = "duringTask",
					y = 265,
					visible = false,
					type = "label",
					x = 610,
					textId = 200910,
					color = tool.hexToRgb("#FFCC00")
				},
				{
					zoomOnTouchDown = true,
					name = "btn1",
					h = 100,
					type = "button",
					w = 160,
					y = 145,
					x = 540,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 20,
							name = "shadow1",
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/activity/godPaper/czzyb_jyb_shadow.png"
							},
							children = {
								{
									y = 5,
									name = "icon1",
									type = "sprite",
									x = 73,
									anchorPoint = ccp(0.5, 0),
									pic = {
										path = "res/ui/activity/godPaper/czzyb_icon_jyb.png"
									}
								},
								{
									fontSize = 25,
									name = "num1",
									y = 0,
									type = "label",
									x = 110,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn2",
					h = 100,
					type = "button",
					w = 160,
					y = 145,
					x = 760,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 20,
							name = "shadow2",
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/activity/godPaper/czzyb_jyb_shadow.png"
							},
							children = {
								{
									y = 5,
									name = "icon2",
									type = "sprite",
									x = 73,
									anchorPoint = ccp(0.5, 0),
									pic = {
										path = "res/ui/activity/godPaper/czzyb_icon_yyb.png"
									}
								},
								{
									fontSize = 25,
									name = "num2",
									y = 0,
									type = "label",
									x = 110,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					visible = false,
					name = "hammer",
					type = "sprite9",
					y = 180,
					x = 570,
					preferedSize = CCSizeMake(56, 150),
					middleRect = CCRectMake(1, 44, 1, 1),
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/mainCity/chui.png"
					}
				}
			}
		}
	}
}
var_0_7.layout_barNum = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			y = 20,
			x = 0,
			type = "sprite",
			scale = 0.6,
			pic = {
				path = "res/ui/resourceArea2/zcgz_btn_round.png"
			}
		},
		{
			y = 20,
			x = 0,
			type = "sprite",
			pic = {
				path = "res/ui/activity/godPaper/czzyb_icon_yb.png"
			}
		},
		{
			fontSize = 25,
			name = "num",
			y = 10,
			type = "label",
			x = 0,
			color = var_0_1
		},
		{
			fontSize = 25,
			name = "gold",
			y = -20,
			type = "label",
			x = 0,
			color = var_0_4
		},
		{
			zoomOnTouchDown = true,
			name = "btn_reward",
			h = 80,
			type = "button",
			w = 80,
			y = 65,
			visible = false,
			x = 0,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 40,
					name = "icon_reward",
					type = "sprite",
					x = 40,
					pic = {
						path = "res/ui/activity/godPaper/xczzyb_icon_hb.png"
					}
				}
			}
		}
	}
}
var_0_7.tipFrame = {
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
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_7.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.godSendRedInfo)
end

function var_0_7.onGetReward(arg_4_0, arg_4_1, arg_4_2)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		if arg_4_1 == 1 then
			arg_4_0.info.num = arg_4_0.info.num - 1

			arg_4_0.view.widgets.num1:setString(language.get(490026, arg_4_0.info.num))
		elseif arg_4_1 == 2 then
			arg_4_0.info.normalNum = arg_4_0.info.normalNum - 1

			arg_4_0.view.widgets.num2:setString(language.get(490026, arg_4_0.info.normalNum))
		elseif arg_4_1 == 3 then
			arg_4_0.view.widgets["btn_reward" .. arg_4_2]:setVisible(false)
		end

		arg_4_0:showEffectHammer(arg_4_1, var_5_0.rewards)
	end

	if arg_4_1 == 1 and arg_4_0.info.num <= 0 then
		smgr.showTipText(language.get(136172))
	elseif arg_4_1 == 2 and arg_4_0.info.normalNum <= 0 then
		smgr.showTipText(language.get(136173))
	else
		arg_4_2 = arg_4_2 or 0

		cmgr.sendRequest(var_4_0, actions.getRedReward, arg_4_1, arg_4_2)
	end
end

function var_0_7.showEffectHammer(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_2) do
		local var_6_1 = {
			id = var_0_0[iter_6_1.type].type,
			value = iter_6_1.value
		}

		table.insert(var_6_0, var_6_1)
	end

	globalAction_gotResource(var_6_0)

	if arg_6_1 == 3 then
		return
	end

	local var_6_2, var_6_3 = arg_6_0.view.widgets["btn" .. arg_6_1]:getPosition()
	local var_6_4 = arg_6_0.view.widgets.hammer

	var_6_4:stopAllActions()
	var_6_4:setPosition(var_6_2 + 120, var_6_3 - 45)
	var_6_4:setOpacity(255)
	var_6_4:setRotation(-50)
	var_6_4:setVisible(true)

	local var_6_5 = CCArray:create()

	var_6_5:addObject(CCRotateTo:create(0.1, -35))
	var_6_5:addObject(CCEaseBounceOut:create(CCRotateTo:create(0.1, -50)))

	local var_6_6 = CCSequence:create(var_6_5)

	var_6_4:runAction(var_6_6)

	for iter_6_2 = 1, 2 do
		local var_6_7 = arg_6_0.view.widgets["icon" .. iter_6_2]

		var_6_7:stopAllActions()
		var_6_7:setOpacity(255)
		var_6_7:setVisible(true)
	end

	local var_6_8 = arg_6_0.view.widgets["icon" .. arg_6_1]
	local var_6_9 = CCArray:create()

	var_6_9:addObject(CCDelayTime:create(0.1))
	var_6_9:addObject(CCBlink:create(0.4, 2))
	var_6_9:addObject(CCHide:create())
	var_6_9:addObject(CCTargetedAction:create(arg_6_0.view.widgets.hammer, CCFadeOut:create(0.2)))
	var_6_9:addObject(CCDelayTime:create(0.1))
	var_6_9:addObject(CCShow:create())
	var_6_9:addObject(CCCallFunc:create(function()
		arg_6_0:refresh()
	end))
	var_6_8:runAction(CCSequence:create(var_6_9))
end

function var_0_7.showEffectShake(arg_8_0, arg_8_1)
	if not arg_8_1 or tolua.isnull(arg_8_1) then
		return
	end

	local var_8_0 = CCArray:create()

	var_8_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_8_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_8_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_8_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_8_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_8_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_8_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_8_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_8_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_8_0:addObject(CCDelayTime:create(0.4))

	local var_8_1 = CCSequence:create(var_8_0)

	arg_8_1:stopAllActions()
	arg_8_1:runAction(CCRepeatForever:create(var_8_1))
end

function var_0_7.showPanel(arg_9_0, arg_9_1)
	arg_9_0.info = arg_9_1

	table.sort(arg_9_1.godPapers, function(arg_10_0, arg_10_1)
		return arg_10_0.id < arg_10_1.id
	end)

	local var_9_0 = 0
	local var_9_1 = 100 / #arg_9_1.godPapers

	for iter_9_0, iter_9_1 in ipairs(arg_9_1.godPapers) do
		if arg_9_1.gold >= iter_9_1.gold then
			var_9_0 = var_9_0 + var_9_1
		else
			local var_9_2 = iter_9_0 == 1 and 0 or arg_9_1.godPapers[iter_9_0 - 1].gold

			if var_9_2 < arg_9_1.gold then
				var_9_0 = var_9_0 + var_9_1 * (arg_9_1.gold - var_9_2) / (iter_9_1.gold - var_9_2)
			end
		end

		local var_9_3 = iter_9_1.receivedExt == false and iter_9_1.rewards ~= nil and #iter_9_1.rewards > 0
		local var_9_4 = arg_9_0.view.widgets["btn_reward" .. iter_9_0]

		var_9_4:setVisible(var_9_3)

		if var_9_3 then
			var_9_4:stopAllActions()
			var_9_4:setPositionX(0)

			local var_9_5

			if arg_9_0.info.gold >= iter_9_1.gold then
				var_9_5 = "xczzyb_icon_hb_l.png"

				arg_9_0:showEffectShake(var_9_4)
			else
				var_9_5 = "xczzyb_icon_hb_g.png"
			end

			arg_9_0.view.widgets["icon_reward" .. iter_9_0]:setDisplayFrame(CCSprite:create("res/ui/activity/godPaper/" .. var_9_5):displayFrame())
		end
	end

	local var_9_6 = 1.4414414414414414 + var_9_0 * 539 / 555

	arg_9_0.view.widgets.bar:setPercentage(var_9_6)
	arg_9_0.view.widgets.gold:setString(language.get(131102, arg_9_1.gold))
	arg_9_0.view.widgets.num1:setString(language.get(490026, arg_9_1.num))
	arg_9_0.view.widgets.num2:setString(language.get(490026, arg_9_1.normalNum))

	local var_9_7 = arg_9_1.duringTask == true
	local var_9_8 = arg_9_0.info.cd > 0
	local var_9_9 = not var_9_8 and #arg_9_0.info.cities > 0

	if var_9_7 then
		var_9_8 = false
		var_9_9 = false
	end

	arg_9_0.view.widgets.richLine_time:setVisible(var_9_8)
	arg_9_0.view.widgets.btn_city:setVisible(var_9_9)
	arg_9_0.view.widgets.time:stopAllActions()

	if var_9_8 then
		arg_9_0.view.widgets.time:setString(tool.getFormatTime(arg_9_1.cd))

		local var_9_10 = 0.5
		local var_9_11 = CCArray:create()

		var_9_11:addObject(CCDelayTime:create(var_9_10))
		var_9_11:addObject(CCCallFunc:create(function()
			arg_9_1.cd = arg_9_1.cd - var_9_10 * 1000

			if arg_9_1.cd <= 0 then
				arg_9_0.view.widgets.time:stopAllActions()
				arg_9_0:refresh()
			else
				arg_9_0.view.widgets.time:setString(tool.getFormatTime(arg_9_1.cd))
			end
		end))

		local var_9_12 = CCSequence:create(var_9_11)

		arg_9_0.view.widgets.time:runAction(CCRepeatForever:create(var_9_12))
	end

	if var_9_9 then
		arg_9_0.view.widgets.city:setString(arg_9_0.info.cities[1].cityName)
		arg_9_0.view.widgets.richLine_city:reorder()
	end

	arg_9_0.view.widgets.duringTask:setVisible(var_9_7)

	if not var_9_8 and not var_9_9 and not var_9_7 then
		local var_9_13 = CCArray:create()

		var_9_13:addObject(CCDelayTime:create(1))
		var_9_13:addObject(CCCallFunc:create(function()
			arg_9_0:refresh()
		end))

		local var_9_14 = CCSequence:create(var_9_13)

		arg_9_0.view.widgets.time:runAction(var_9_14)
	end
end

function var_0_7.ctor(arg_13_0, arg_13_1, arg_13_2)
	log.info("@@ 充值砸元宝")

	arg_13_0.view = {}

	uiutil.initWidgets(arg_13_0.view, arg_13_0.layout)

	arg_13_0.leftTime = arg_13_0.view.widgets.leftTime

	if arg_13_1 then
		arg_13_0:addChild(arg_13_0.view.widgets.root)
		arg_13_1:addChild(arg_13_0)
	end

	table.sort(arg_13_2.godPapers, function(arg_14_0, arg_14_1)
		return arg_14_0.id < arg_14_1.id
	end)

	local var_13_0 = CCSpriteBatchNode:create("res/ui/activity/godPaper/czzyb_icon_yb.png")

	var_13_0:setPosition(0, 70)
	arg_13_0.view.widgets.bg_bar:addChild(var_13_0)

	for iter_13_0, iter_13_1 in ipairs(arg_13_2.godPapers) do
		local var_13_1 = 85 + 77 * (iter_13_0 - 1)
		local var_13_2 = {}

		uiutil.initWidgets(var_13_2, arg_13_0.layout_barNum)
		var_13_2.widgets.node:setPositionX(var_13_1)
		arg_13_0.view.widgets.bg_bar:addChild(var_13_2.widgets.node)
		var_13_2.widgets.num:setString(language.get(490026, iter_13_1.num))
		var_13_2.widgets.gold:setString(iter_13_1.gold)

		arg_13_0.view.widgets["icon_reward" .. iter_13_0] = var_13_2.widgets.icon_reward
		arg_13_0.view.widgets["btn_reward" .. iter_13_0] = var_13_2.widgets.btn_reward

		var_13_2.widgets.btn_reward:addHandleOfControlEvent(function()
			log.info("btn_reward" .. iter_13_0)

			local var_15_0 = arg_13_0.info.godPapers[iter_13_0]

			if var_15_0.rewards and #var_15_0.rewards > 0 and var_15_0.receivedExt == false then
				if arg_13_0.info.gold >= var_15_0.gold then
					arg_13_0:onGetReward(3, iter_13_0)
				else
					arg_13_0:showTip(iter_13_0)
				end
			end
		end, CCControlEventTouchUpInside)
	end

	arg_13_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_13_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_13_0.view.widgets.btn_city:addHandleOfControlEvent(function()
		log.info("btn_city")

		local var_17_0 = arg_13_0.info.cities[1].cityId

		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		loadingLayer.show(SCENE_WORLD, var_17_0)
	end, CCControlEventTouchUpInside)

	for iter_13_2 = 1, 2 do
		local var_13_3 = arg_13_0.view.widgets["btn" .. iter_13_2]

		var_13_3:addHandleOfControlEvent(function()
			log.info("btn%s: TouchDown", iter_13_2)
			schedule(arg_13_0.view.widgets.root, function()
				arg_13_0:showTipNum(true, iter_13_2)
			end, 0.1)
		end, CCControlEventTouchDown)
		var_13_3:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpInside", iter_13_2)
			arg_13_0:showTipNum(false, iter_13_2)
			arg_13_0:onGetReward(iter_13_2)
		end, CCControlEventTouchUpInside)
		var_13_3:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpOutside", iter_13_2)
			arg_13_0:showTipNum(false, iter_13_2)
		end, CCControlEventTouchUpOutside)
	end

	arg_13_0:showPanel(arg_13_2)
end

function var_0_7.showTipNum(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.view.widgets.root:stopAllActions()

	if arg_22_0.view.widgets.tipFrame then
		arg_22_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_22_0.view.widgets.tipFrame = nil
	end

	if arg_22_1 then
		local var_22_0, var_22_1 = tool.getPositionInScreen(arg_22_0.view.widgets["btn" .. arg_22_2])

		uiutil.initWidgets(arg_22_0.view, arg_22_0.tipFrame)
		arg_22_0:addChild(arg_22_0.view.widgets.tipFrame)
		arg_22_0.view.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

		local var_22_2 = ""

		if arg_22_2 == 1 then
			var_22_2 = language.get(135616, arg_22_0.info.num)
		elseif arg_22_2 == 2 then
			var_22_2 = language.get(135618, arg_22_0.info.normalNum, arg_22_0.info.totalNormalNum, arg_22_0.info.currentNormalNum)
		end

		arg_22_0.view.widgets.tipMsg:setString(var_22_2)

		local var_22_3 = arg_22_0.view.widgets.tipMsg:getContentSize().width
		local var_22_4 = arg_22_0.view.widgets.tipMsg:getContentSize().height

		arg_22_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_22_3 + 30, var_22_4 + 30))
		arg_22_0.view.widgets.tipFrame:setPosition(ccp(var_22_0 + 30, var_22_1 - 20))
		arg_22_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_22_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_7.showTip(arg_23_0, arg_23_1)
	log.info("should show tips ")

	local var_23_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_23_0:registerScriptTouchHandler(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == CCTOUCHBEGAN then
			return true
		elseif arg_24_0 == CCTOUCHMOVED then
			return true
		elseif arg_24_0 == CCTOUCHENDED then
			pcall(var_23_0.removeFromParentAndCleanup, var_23_0, true)

			return true
		end
	end, false, true)
	var_23_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_23_0, 60000)

	local var_23_1 = 0
	local var_23_2 = 0
	local var_23_3 = {}

	uiutil.initWidgets(var_23_3, arg_23_0.tipFrame)
	var_23_0:addChild(var_23_3.widgets.tipFrame)

	local var_23_4
	local var_23_5

	if arg_23_1 then
		local var_23_6 = arg_23_0.info.godPapers[arg_23_1].rewards[1]

		var_23_4 = language.get(136174, var_23_6.type .. language.get(490026, var_23_6.value))
		var_23_5 = arg_23_0.view.widgets["btn_reward" .. arg_23_1]

		var_23_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))
	else
		var_23_4 = language.get(136171, arg_23_0.info.totalNormalNum)
		var_23_5 = arg_23_0.view.widgets.btn_tip
	end

	var_23_3.widgets.tipMsg:setString(var_23_4)

	local var_23_7, var_23_8 = tool.getPositionInScreen(var_23_5)
	local var_23_9 = var_23_7 + 20
	local var_23_10 = var_23_8 - 20
	local var_23_11 = var_23_3.widgets.tipMsg:getContentSize().width
	local var_23_12 = var_23_3.widgets.tipMsg:getContentSize().height

	var_23_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_23_11 + 30, var_23_12 + 30))
	var_23_3.widgets.tipFrame:setPosition(ccp(var_23_9, var_23_10))
	var_23_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_23_3.widgets.tipFrame:setVisible(true)
end

return var_0_7
