local var_0_0 = require("res/native/offset").get("layer.activity.newMidAutumn.newMidAutumnTab")
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = class("MidAutumn", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	name = "panel",
	type = "sprite",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	pic = {
		path = "res/ui/comment/bg1.jpg"
	},
	children = {
		{
			fontSize = 25,
			name = "leftTime",
			y = 480,
			type = "label",
			color = var_0_3,
			x = 700 + (var_0_0.timeLeftX or 0)
		},
		{
			y = 490,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_title.png"
			}
		},
		{
			y = 442,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_line_top.png"
			}
		},
		{
			y = 442,
			type = "label",
			x = 458,
			textId = 135874,
			color = var_0_1,
			fontSize = 25 + (var_0_0.descLabelFntSize or 0)
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 480,
			type = "button",
			x = 860
		},
		{
			y = 59,
			type = "sprite",
			x = 457.4971,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_bg.jpg"
			}
		},
		{
			y = 335,
			name = "rabbit",
			type = "sprite",
			x = 45,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_rabbit.png"
			}
		},
		{
			fontSize = 25,
			name = "num",
			type = "label",
			y = 295,
			x = 50,
			anchorPoint = ccp(0, 0.5),
			color = var_0_1
		},
		{
			y = 325,
			name = "bg_bar",
			type = "sprite",
			x = 490,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bg.png"
			},
			children = {
				{
					y = 0,
					name = "bar1",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb_single.png"
					},
					children = {
						{
							name = "btn1",
							h = 90,
							type = "button",
							w = 90,
							y = 75,
							x = 158,
							normal = {
								path = "res/ui/activity/midAutumn/ytqne_moon_01.png"
							},
							touched = {
								path = "res/ui/activity/midAutumn/ytqne_moon_01_g.png"
							},
							disable = {
								path = "res/ui/activity/midAutumn/ytqne_moon_01_g.png"
							}
						},
						{
							type = "sprite",
							name = "light1",
							y = 75,
							visible = false,
							x = 158,
							pic = {
								path = "res/ui/activity/midAutumn/ytqne_moon_01_c.png"
							}
						},
						{
							fontSize = 25,
							name = "num1",
							y = -10,
							type = "label",
							x = 158,
							color = var_0_1
						}
					}
				},
				{
					y = 0,
					name = "bar2",
					type = "progressbar",
					x = 152,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb_single.png"
					},
					children = {
						{
							name = "btn2",
							h = 90,
							type = "button",
							w = 90,
							y = 75,
							x = 158,
							normal = {
								path = "res/ui/activity/midAutumn/ytqne_moon_02.png"
							},
							touched = {
								path = "res/ui/activity/midAutumn/ytqne_moon_02_g.png"
							},
							disable = {
								path = "res/ui/activity/midAutumn/ytqne_moon_02_g.png"
							}
						},
						{
							type = "sprite",
							name = "light2",
							y = 75,
							visible = false,
							x = 158,
							pic = {
								path = "res/ui/activity/midAutumn/ytqne_moon_02_c.png"
							}
						},
						{
							fontSize = 25,
							name = "num2",
							y = -10,
							type = "label",
							x = 158,
							color = var_0_1
						}
					}
				},
				{
					y = 0,
					name = "bar3",
					type = "progressbar",
					x = 304,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb_single.png"
					},
					children = {
						{
							name = "btn3",
							h = 90,
							type = "button",
							w = 90,
							y = 75,
							x = 158,
							normal = {
								path = "res/ui/activity/midAutumn/ytqne_moon_03.png"
							},
							touched = {
								path = "res/ui/activity/midAutumn/ytqne_moon_03_g.png"
							},
							disable = {
								path = "res/ui/activity/midAutumn/ytqne_moon_03_g.png"
							}
						},
						{
							type = "sprite",
							name = "light3",
							y = 75,
							visible = false,
							x = 158,
							pic = {
								path = "res/ui/activity/midAutumn/ytqne_moon_03_c.png"
							}
						},
						{
							fontSize = 25,
							name = "num3",
							y = -10,
							type = "label",
							x = 158,
							color = var_0_1
						}
					}
				},
				{
					y = 0,
					name = "bar4",
					type = "progressbar",
					x = 456,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb_single.png"
					},
					children = {
						{
							name = "btn4",
							h = 90,
							type = "button",
							w = 90,
							y = 75,
							x = 158,
							normal = {
								path = "res/ui/activity/midAutumn/ytqne_moon_04.png"
							},
							touched = {
								path = "res/ui/activity/midAutumn/ytqne_moon_04_g.png"
							},
							disable = {
								path = "res/ui/activity/midAutumn/ytqne_moon_04_g.png"
							}
						},
						{
							type = "sprite",
							name = "light4",
							y = 75,
							visible = false,
							x = 158,
							pic = {
								path = "res/ui/activity/midAutumn/ytqne_moon_04_c.png"
							}
						},
						{
							fontSize = 25,
							name = "num4",
							y = -10,
							type = "label",
							x = 158,
							color = var_0_1
						}
					}
				},
				{
					y = 0,
					name = "bar5",
					type = "progressbar",
					x = 608,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb_single.png"
					},
					children = {
						{
							name = "btn5",
							h = 90,
							type = "button",
							w = 90,
							y = 75,
							x = 158,
							normal = {
								path = "res/ui/activity/midAutumn/ytqne_moon_05.png"
							},
							touched = {
								path = "res/ui/activity/midAutumn/ytqne_moon_05_g.png"
							},
							disable = {
								path = "res/ui/activity/midAutumn/ytqne_moon_05_g.png"
							}
						},
						{
							type = "sprite",
							name = "light5",
							y = 75,
							visible = false,
							x = 158,
							pic = {
								path = "res/ui/activity/midAutumn/ytqne_moon_05_c.png"
							}
						},
						{
							fontSize = 25,
							name = "num5",
							y = -10,
							type = "label",
							x = 158,
							color = var_0_1
						}
					}
				}
			}
		},
		{
			y = 175,
			name = "moon",
			type = "sprite",
			x = 95,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_moon_big.png"
			}
		},
		{
			type = "sprite",
			name = "rabbit1",
			x = 240,
			visible = false,
			y = 125,
			scale = 1.1,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_rabbit.png"
			}
		},
		{
			type = "sprite",
			name = "rabbit2",
			x = 290,
			visible = false,
			y = 125,
			scale = 1.1,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_rabbit.png"
			}
		},
		{
			type = "sprite",
			name = "rabbit3",
			x = 355,
			visible = false,
			y = 125,
			scale = 1.1,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_rabbit.png"
			}
		},
		{
			type = "sprite",
			name = "rabbit4",
			x = 450,
			visible = false,
			y = 125,
			scale = 1.1,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_rabbit.png"
			}
		},
		{
			type = "node",
			name = "node_box",
			y = 175,
			visible = false,
			x = 460,
			children = {
				{
					name = "btn_box",
					h = 230,
					type = "button",
					w = 226,
					y = 0,
					x = 0,
					normal = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx.png"
					},
					touched = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"
					},
					disable = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"
					}
				},
				{
					type = "sprite",
					name = "light_box",
					x = -10,
					visible = false,
					y = 95,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_bxop_h.png"
					}
				}
			}
		},
		{
			type = "node",
			name = "node_cake",
			y = 175,
			visible = false,
			x = 95,
			children = {
				{
					y = 0,
					name = "cake",
					type = "sprite",
					x = 15,
					pic = {
						path = "res/ui/activity/midAutumn/moon_cake_11.png"
					}
				},
				{
					y = 0,
					name = "light_cake",
					type = "sprite",
					x = 15,
					pic = {
						path = "res/ui/activity/midAutumn/moon_cake_11.png"
					}
				},
				{
					w = 200,
					name = "btn_cake",
					h = 180,
					type = "button",
					y = 0,
					x = 0,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					}
				}
			}
		},
		{
			name = "btn_buy",
			h = 90,
			type = "button",
			w = 75,
			y = 135,
			x = 845,
			normal = {
				path = "res/ui/activity/midAutumn/ytqne_radish.png"
			},
			touched = {
				path = "res/ui/activity/midAutumn/ytqne_radish_c.png"
			},
			children = {
				{
					y = -10,
					x = 30,
					type = "sprite",
					scale = 0.7,
					pic = {
						path = "res/ui/activity/midAutumn/ytqne_radish_bg.png"
					}
				},
				{
					y = -9,
					x = 10,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					}
				},
				{
					fontSize = 25,
					name = "gold",
					y = -7,
					type = "label",
					x = 25,
					color = var_0_4,
					anchorPoint = ccp(0, 0.5)
				}
			}
		}
	}
}
var_0_6.rankBg = {
	name = "bg_rank",
	type = "sprite9",
	y = 0,
	x = 0,
	preferedSize = CCSizeMake(915, 421),
	middleRect = CCRectMake(20, 80, 82, 59),
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/kfyz/yuyue/yyyz_list_bg.png"
	},
	children = {
		{
			y = 391,
			name = "title",
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_word_ytpm.png"
			}
		},
		{
			w = 67,
			name = "btn_show",
			h = 46,
			type = "button",
			y = 391,
			x = 860,
			normal = {
				path = "res/ui/common/button/gxb_btn.png"
			},
			touched = {
				path = "res/ui/common/button/gxb_btn_c.png"
			}
		}
	}
}
var_0_6.rankCell = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.png"
	},
	children = {
		{
			y = 30,
			x = 274,
			type = "sprite",
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg2.png"
			}
		},
		{
			y = 57,
			name = "icon",
			type = "sprite",
			x = 59,
			pic = {
				path = "res/ui/common/playerHead/playerHead_icon_0.png"
			}
		},
		{
			y = 30,
			x = 145,
			type = "sprite",
			scale = 0.5,
			pic = {
				path = "res/ui/activity/midAutumn/ytqne_rabbit.png"
			}
		},
		{
			fontSize = 30,
			name = "name",
			y = 85,
			type = "label",
			x = 130,
			anchorPoint = ccp(0, 0.5),
			color = var_0_1
		},
		{
			fontSize = 30,
			name = "lv",
			y = 85,
			type = "label",
			x = 420,
			anchorPoint = ccp(1, 0.5),
			color = var_0_1
		},
		{
			fontSize = 30,
			name = "num",
			y = 30,
			type = "label",
			x = 175,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 10,
			type = "sprite9",
			x = 59,
			preferedSize = CCSizeMake(90, 30),
			middleRect = CCRectMake(10, 10, 29, 29),
			anchorPoint = ccp(0.5, 0),
			pic = {
				frame = true,
				path = "common_tip_frame_small.png"
			}
		},
		{
			scale = 0.8,
			name = "rank",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_ranking.png",
			startCharMap = 48,
			text = "0",
			y = 25,
			itemWidth = 26,
			x = 59,
			itemHeight = 32
		}
	}
}
var_0_6.tipFrame = {
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
			textId = 135877,
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getNewMidAutumnActivity)
end

function var_0_6.onBuyRadish(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}
		local var_5_1 = {}

		var_5_1.id = 10020
		var_5_1.value = arg_5_0.action.data.rabbit

		table.insert(var_5_0, var_5_1)
		globalAction_gotResource(var_5_0)
		arg_4_0:refresh()
	end

	messageBox.showChargeWin("", language.get(135878, arg_4_0.info.radisGold), "buyRadish", function()
		cmgr.sendRequest(var_4_0, actions.buyRabbits)
	end)
end

function var_0_6.onGetReward(arg_7_0, arg_7_1)
	local function var_7_0(arg_8_0)
		local var_8_0 = {
			nil,
			nil,
			3,
			4,
			[18] = 41,
			[9] = 5,
			[19] = 24,
			[17] = 7
		}
		local var_8_1 = {}

		for iter_8_0, iter_8_1 in ipairs(arg_8_0.action.data.rewards) do
			local var_8_2 = {
				id = var_8_0[iter_8_1.type] or iter_8_1.type,
				value = iter_8_1.value
			}

			table.insert(var_8_1, var_8_2)
		end

		globalAction_gotResource(var_8_1)
		arg_7_0:refresh()
	end

	local var_7_1 = arg_7_0.info.moons[arg_7_1].id

	cmgr.sendRequest(var_7_0, actions.getMoonReward, var_7_1)
end

function var_0_6.showEffectOpenBox(arg_9_0)
	arg_9_0.view.widgets.btn_box:setEnabled(false)

	local function var_9_0(arg_10_0)
		arg_9_0.view.widgets.light_box:setVisible(true)
		arg_9_0.view.widgets.light_box:setOpacity(120)

		local var_10_0 = CCArray:create()

		var_10_0:addObject(CCFadeIn:create(0.6))
		var_10_0:addObject(CCFadeOut:create(1.4))
		var_10_0:addObject(CCCallFuncN:create(function()
			arg_9_0:refresh()
		end))

		local var_10_1 = CCSequence:create(var_10_0)

		arg_9_0.view.widgets.light_box:runAction(var_10_1)

		local var_10_2 = {}
		local var_10_3 = {}

		var_10_3.id = 10021
		var_10_3.value = 1

		table.insert(var_10_2, var_10_3)
		globalAction_gotResource(var_10_2)
	end

	cmgr.sendRequest(var_9_0, actions.getFinalMoonReward)
end

function var_0_6.showEffectMoonCake(arg_12_0, arg_12_1)
	local var_12_0 = ccp(95, 175)
	local var_12_1 = ccp(460, 175)

	for iter_12_0 = 1, 5 do
		arg_12_0.view.widgets["btn" .. iter_12_0]:setEnabled(false)
		arg_12_0.view.widgets["light" .. iter_12_0]:setVisible(false)
	end

	for iter_12_1 = 1, 4 do
		local var_12_2 = CCArray:create()
		local var_12_3 = CCEaseSineOut:create(CCMoveTo:create(0.5, var_12_0))
		local var_12_4 = CCFadeOut:create(0.5)

		var_12_2:addObject(CCSpawn:createWithTwoActions(var_12_3, var_12_4))

		local var_12_5 = CCSequence:create(var_12_2)

		arg_12_0.view.widgets["rabbit" .. iter_12_1]:runAction(var_12_5)
	end

	local var_12_6 = CCArray:create()

	var_12_6:addObject(CCDelayTime:create(0.7))
	var_12_6:addObject(CCFadeOut:create(0.5))
	var_12_6:addObject(CCCallFuncN:create(function()
		arg_12_0.view.widgets.moon:setVisible(false)
		arg_12_0.view.widgets.moon:setOpacity(255)
	end))

	local var_12_7 = CCSequence:create(var_12_6)

	arg_12_0.view.widgets.moon:runAction(var_12_7)

	local var_12_8 = CCSprite:create(string.format("res/ui/activity/midAutumn/moon_cake_%s1.png", arg_12_1)):displayFrame()

	arg_12_0.view.widgets.cake:setDisplayFrame(var_12_8)
	arg_12_0.view.widgets.cake:setOpacity(0)
	arg_12_0.view.widgets.cake:setColor(ccc3(255, 255, 255))
	arg_12_0.view.widgets.light_cake:setDisplayFrame(var_12_8)
	arg_12_0.view.widgets.light_cake:setOpacity(0)
	arg_12_0.view.widgets.light_cake:stopAllActions()
	arg_12_0.view.widgets.node_cake:setPosition(var_12_0)

	local var_12_9 = CCArray:create()
	local var_12_10 = CCEaseSineOut:create(CCMoveTo:create(0.6, var_12_1))

	var_12_9:addObject(CCDelayTime:create(0.7))
	var_12_9:addObject(CCCallFuncN:create(function()
		arg_12_0.view.widgets.node_cake:setVisible(true)
	end))
	var_12_9:addObject(CCFadeIn:create(0.5))
	var_12_9:addObject(CCDelayTime:create(0.2))
	var_12_9:addObject(CCTargetedAction:create(arg_12_0.view.widgets.node_cake, var_12_10))
	var_12_9:addObject(CCCallFuncN:create(function()
		arg_12_0.view.widgets.cake:setColor(ccc3(200, 200, 200))
		arg_12_0.view.widgets.light_cake:setOpacity(0)

		local var_15_0 = CCArray:create()

		var_15_0:addObject(CCFadeIn:create(0.15))
		var_15_0:addObject(CCFadeOut:create(0.15))

		local var_15_1 = CCSequence:create(var_15_0)

		arg_12_0.view.widgets.light_cake:runAction(CCRepeatForever:create(var_15_1))
	end))

	local var_12_11 = CCSequence:create(var_12_9)

	arg_12_0.view.widgets.cake:runAction(var_12_11)
	arg_12_0.view.widgets.btn_cake:addHandleOfControlEvent(function()
		log.info("btn_cake" .. arg_12_1)
		arg_12_0:onGetReward(arg_12_1)
	end, CCControlEventTouchUpInside)
	arg_12_0.view.widgets.btn_cake:setEnabled(true)
end

function var_0_6.createRankList(arg_17_0)
	local function var_17_0(arg_18_0, arg_18_1)
		log.info("cell touched at : ", arg_18_1:getIdx())
	end

	local function var_17_1(arg_19_0, arg_19_1)
		return 120, 905
	end

	local function var_17_2(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_0:dequeueCell()

		if var_20_0 then
			var_20_0:removeAllChildrenWithCleanup(true)
		else
			var_20_0 = CCTableViewCell:new()
		end

		for iter_20_0 = 1, 2 do
			local var_20_1 = arg_17_0.info.ranks[2 * arg_20_1 + iter_20_0]

			if var_20_1 then
				local var_20_2 = {}

				uiutil.initWidgets(var_20_2, arg_17_0.rankCell)
				var_20_2.widgets.bg:setPosition(ccp(iter_20_0 == 1 and 11 or 462, 0))
				var_20_0:addChild(var_20_2.widgets.bg)
				var_20_2.widgets.name:setString(var_20_1.playerName)
				var_20_2.widgets.lv:setString(language.get(111022, var_20_1.lv))
				var_20_2.widgets.rank:setString(var_20_1.rank)
				var_20_2.widgets.num:setString(language.get(135872, var_20_1.num))
				var_20_2.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_20_1.pic)):displayFrame())
			end
		end

		return var_20_0
	end

	local function var_17_3()
		local var_21_0 = arg_17_0.info.ranks

		if var_21_0 and #var_21_0 > 0 then
			return math.ceil(#var_21_0 / 2)
		else
			return 0
		end
	end

	local var_17_4 = CCTableView:create(CCSizeMake(905, 362))

	var_17_4:setPosition(5, 5)
	var_17_4:setDirection(kCCScrollViewDirectionVertical)
	var_17_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_17_0.view.widgets.bg_rank:addChild(var_17_4)

	if arg_17_0.rankList then
		arg_17_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_17_0.rankList = var_17_4

	var_17_4:registerScriptHandler(var_17_0, CCTableView.kTableCellTouched)
	var_17_4:registerScriptHandler(var_17_1, CCTableView.kTableCellSizeForIndex)
	var_17_4:registerScriptHandler(var_17_2, CCTableView.kTableCellSizeAtIndex)
	var_17_4:registerScriptHandler(var_17_3, CCTableView.kNumberOfCellsInTableView)
	var_17_4:reloadData()
end

function var_0_6.showPanel(arg_22_0, arg_22_1)
	arg_22_0.info = arg_22_1

	arg_22_0:createRankList()
	arg_22_0.view.widgets.gold:setString(arg_22_1.radisGold)
	arg_22_0.view.widgets.num:setString(language.get(135039, arg_22_1.rabbitNum))

	local var_22_0 = 0

	for iter_22_0 = 1, 5 do
		local var_22_1 = arg_22_1.moons[iter_22_0]

		arg_22_0.view.widgets["num" .. iter_22_0]:setString(var_22_1.num)

		local var_22_2 = var_22_1.state == 1

		if var_22_2 then
			var_22_0 = var_22_0 + 1
		end

		arg_22_0.view.widgets["btn" .. iter_22_0]:setEnabled(var_22_2)
		arg_22_0.view.widgets["light" .. iter_22_0]:setVisible(var_22_2)

		local var_22_3

		if iter_22_0 == 1 then
			var_22_3 = 100 * arg_22_1.rabbitNum / var_22_1.num
		else
			local var_22_4 = arg_22_1.moons[iter_22_0 - 1]

			var_22_3 = 100 * (arg_22_1.rabbitNum - var_22_4.num) / (var_22_1.num - var_22_4.num)
		end

		arg_22_0.view.widgets["bar" .. iter_22_0]:setPercentage(var_22_3)
	end

	local var_22_5 = arg_22_1.rabbitNum < arg_22_1.moons[5].num

	arg_22_0.view.widgets.btn_buy:setVisible(var_22_5)

	local var_22_6 = {
		ccp(240, 125),
		ccp(290, 125),
		ccp(355, 125),
		ccp(450, 125)
	}

	for iter_22_1 = 1, 4 do
		local var_22_7 = arg_22_0.view.widgets["rabbit" .. iter_22_1]

		var_22_7:setPosition(var_22_6[iter_22_1])
		var_22_7:setVisible(var_22_0 > 0)
		var_22_7:setOpacity(255)
	end

	arg_22_0.view.widgets.moon:setVisible(true)
	arg_22_0.view.widgets.node_cake:setVisible(false)
	arg_22_0.view.widgets.btn_cake:setEnabled(false)

	local var_22_8 = arg_22_1.finalReward == 1

	arg_22_0.view.widgets.node_box:setVisible(var_22_8)
end

function var_0_6.ctor(arg_23_0, arg_23_1, arg_23_2)
	log.info("@@ 中秋活动")

	arg_23_0.view = {}

	uiutil.initWidgets(arg_23_0.view, arg_23_0.layout)

	arg_23_0.leftTime = arg_23_0.view.widgets.leftTime

	if arg_23_1 then
		arg_23_0:addChild(arg_23_0.view.widgets.panel)
		arg_23_1:addChild(arg_23_0)
	end

	arg_23_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_23_0:showTip()
	end, CCControlEventTouchUpInside)

	for iter_23_0 = 1, 5 do
		local var_23_0 = arg_23_0.view.widgets["light" .. iter_23_0]

		var_23_0:setOpacity(0)

		local var_23_1 = CCArray:create()

		var_23_1:addObject(CCFadeIn:create(0.25))
		var_23_1:addObject(CCFadeOut:create(0.25))

		local var_23_2 = CCSequence:create(var_23_1)

		var_23_0:runAction(CCRepeatForever:create(var_23_2))
		arg_23_0.view.widgets["btn" .. iter_23_0]:addHandleOfControlEvent(function()
			log.info("btn" .. iter_23_0)
			arg_23_0:showEffectMoonCake(iter_23_0)
		end, CCControlEventTouchUpInside)
	end

	arg_23_0.view.widgets.rabbit1:setFlipX(true)
	arg_23_0.view.widgets.rabbit4:setFlipX(true)
	arg_23_0.view.widgets.btn_buy:addHandleOfControlEvent(function()
		log.info("btn_buy")
		arg_23_0:onBuyRadish()
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_box:addHandleOfControlEvent(function()
		log.info("btn_box")
		arg_23_0:showEffectOpenBox()
	end, CCControlEventTouchUpInside)

	local var_23_3 = CCLayerColor:create(ccc4(0, 0, 0, 0), 915, 427)
	local var_23_4 = CCScrollView:create(CCSizeMake(915, 427), var_23_3)

	var_23_4:setPosition(ccp(0, 0))
	var_23_4:setTouchEnabled(false)
	arg_23_0.view.widgets.panel:addChild(var_23_4)
	swallowTouch(var_23_3)
	uiutil.initWidgets(arg_23_0.view, arg_23_0.rankBg)
	var_23_3:addChild(arg_23_0.view.widgets.bg_rank, 100)
	var_23_3:setPosition(ccp(0, -363))

	arg_23_0.scrollLayer = var_23_3

	arg_23_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		local var_28_0 = arg_23_0.view.widgets.btn_show:getScale()

		if var_28_0 > 0 and arg_23_0.rankList then
			arg_23_0.rankList:setContentOffset(ccp(0, arg_23_0.rankList:minContainerOffset().y))
			arg_23_0.rankList:setVisible(true)
		end

		local var_28_1 = CCArray:create()

		var_28_1:addObject(CCEaseSineOut:create(CCMoveTo:create(0.5, ccp(0, var_28_0 > 0 and 0 or -363))))
		var_28_1:addObject(CCCallFuncN:create(function()
			arg_23_0.view.widgets.btn_show:setScale(-1 * var_28_0)
			arg_23_0.view.widgets.btn_show:setEnabled(true)

			if arg_23_0.rankList then
				arg_23_0.rankList:setVisible(var_28_0 > 0)
			end
		end))

		local var_28_2 = CCSequence:create(var_28_1)

		var_23_3:runAction(var_28_2)
	end, CCControlEventTouchUpInside)
	arg_23_0:showPanel(arg_23_2)
end

function var_0_6.showTip(arg_30_0)
	log.info("should show tips ")

	local var_30_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_30_0:registerScriptTouchHandler(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == CCTOUCHBEGAN then
			return true
		elseif arg_31_0 == CCTOUCHMOVED then
			return true
		elseif arg_31_0 == CCTOUCHENDED then
			pcall(var_30_0.removeFromParentAndCleanup, var_30_0, true)

			return true
		end
	end, false, true)
	var_30_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_30_0, 60000)

	local var_30_1 = 0
	local var_30_2 = 0
	local var_30_3 = {}

	uiutil.initWidgets(var_30_3, arg_30_0.tipFrame)
	var_30_0:addChild(var_30_3.widgets.tipFrame)

	local var_30_4, var_30_5 = tool.getPositionInScreen(arg_30_0.view.widgets.btn_tip)
	local var_30_6 = var_30_4 + 20
	local var_30_7 = var_30_5 - 20
	local var_30_8 = var_30_3.widgets.tipMsg:getContentSize().width
	local var_30_9 = var_30_3.widgets.tipMsg:getContentSize().height

	var_30_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_30_8 + 30, var_30_9 + 30))
	var_30_3.widgets.tipFrame:setPosition(ccp(var_30_6, var_30_7))
	var_30_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_30_3.widgets.tipFrame:setVisible(true)
end

return var_0_6
