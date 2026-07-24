local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = {
	"yxhd_tit_szdd",
	"yxhd_tit_xmyz",
	"yxhd_tit_lthy",
	"yxhd_tit_fjcy",
	"yxhd_tit_dbkf"
}
local var_0_6 = 100
local var_0_7 = 300
local var_0_8 = 500
local var_0_9 = 2
local var_0_10 = 3
local var_0_11 = 10
local var_0_12 = {}

var_0_12[3] = 3
var_0_12[4] = 4
var_0_12[5] = 6
var_0_12[42] = 5
var_0_12[81] = 24
var_0_12[100] = 100
var_0_12[101] = 15
var_0_12[102] = 41

local var_0_13 = class("MoonCake", function()
	return createBaseLayer()
end)

var_0_13.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/lantern/yxhd_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			name = "playerPic",
			y = 110,
			type = "sprite",
			scale = 0.75,
			pic = {
				frame = false,
				path = "res/ui/common/playerPic/player1.png"
			},
			anchorPoint = ccp(0.5, 0)
		},
		{
			y = 400,
			name = "tipFrame",
			type = "sprite9",
			visible = false,
			x = 270,
			pic = {
				frame = true,
				path = "common_tip_frame_small.png"
			},
			middleRect = CCRectMake(24, 24, 1, 1),
			preferedSize = CCSizeMake(200, 80),
			children = {
				{
					fontSize = 20,
					height = 0,
					name = "tipMsg",
					type = "label",
					y = 40,
					width = 180,
					textId = 136115,
					style = "label_warlock",
					x = 10,
					anchorPoint = ccp(0, 0.5),
					halign = kCCTextAlignmentLeft,
					color = var_0_0
				}
			}
		},
		{
			height = 532,
			name = "maskLayer1",
			x = 0,
			type = "layerColor",
			y = 0,
			width = 915,
			visible = false,
			color = ccc4(33, 21, 15, 166)
		},
		{
			fontSize = 25,
			name = "leftTime",
			y = 495,
			type = "label",
			x = 820,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_2
		},
		{
			y = 495,
			name = "title1",
			frameGapVertical = 15,
			type = "sprite9Tips",
			frameGapHorizontal = 20,
			visible = false,
			x = 458,
			zorder = var_0_7,
			pic = {
				frame = true,
				path = "yxhd_title_bg.png"
			},
			middleRect = CCRectMake(30, 30, 151, 4),
			content = {
				{
					x = 0,
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybds_word_ybdsjjks.png"
					}
				}
			}
		},
		{
			x = 458,
			name = "bg_info",
			y = 435,
			type = "sprite",
			visible = false,
			pic = {
				path = "res/ui/activity/moonCake/ybds_word_bg.png"
			},
			zorder = var_0_7,
			children = {
				{
					fontSize = 30,
					name = "info",
					y = 29,
					type = "label",
					style = "label_warlock",
					x = 267,
					color = var_0_3
				}
			}
		},
		{
			x = 370,
			name = "time_pic",
			y = 435,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "yxhd_tit_time.png"
			},
			zorder = var_0_7
		},
		{
			y = 140,
			name = "finalEatNum",
			visible = false,
			type = "node",
			x = 330,
			zorder = var_0_7,
			children = {
				{
					x = 0,
					name = "finalEatNum_bg",
					type = "sprite9",
					y = 0,
					pic = {
						frame = true,
						path = "yxhd_title_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					middleRect = CCRectMake(30, 0, 150, 64),
					preferedSize = CCSizeMake(350, 64)
				},
				{
					x = -50,
					name = "finalEatNum_p1",
					y = 3,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_gc.png"
					}
				},
				{
					name = "finalEatNum_p2",
					type = "atlaslabel",
					pic = "res/ui/common/number/yxhd_time_digit.png",
					startCharMap = 47,
					text = "0",
					y = 3,
					itemWidth = 35,
					x = 0,
					itemHeight = 34,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					x = 50,
					name = "finalEatNum_p3",
					y = 3,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybds_word_fen.png"
					}
				}
			}
		},
		{
			y = 320,
			name = "node_box",
			scale = 2.5,
			type = "node",
			visible = false,
			x = 458,
			zorder = var_0_8,
			children = {
				{
					style = "button_tip",
					name = "btn_box",
					y = 0,
					type = "button",
					scale = 1.5,
					x = 0
				},
				{
					x = 5,
					name = "light_box",
					y = 10,
					type = "sprite",
					scale = 0.4,
					pic = {
						frame = true,
						path = "yxhd_box_h.png"
					}
				},
				{
					x = 5,
					name = "pic_box",
					y = 10,
					type = "sprite",
					scale = 0.4,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "node_buy",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_8,
			children = {
				{
					zoomOnTouchDown = false,
					name = "btn_buy",
					h = 51,
					type = "button",
					w = 51,
					y = 30,
					x = 550,
					normal = {
						frame = true,
						path = "yxhd_btn_add.png"
					},
					touched = {
						frame = true,
						path = "yxhd_btn_add_c.png"
					}
				},
				{
					fontSize = 20,
					name = "btn_buy_info",
					y = 30,
					type = "label",
					style = "label_warlock",
					x = 520,
					anchorPoint = ccp(1, 0.5),
					color = var_0_0
				}
			}
		},
		{
			x = 458,
			name = "title2",
			y = 495,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "yxhd_title_bg.png"
			},
			children = {
				{
					anchorPointX = 0.5,
					name = "richLine",
					y = 34,
					type = "richLine",
					gap = 2,
					x = 105,
					zorder = var_0_8,
					content = {
						{
							x = 0,
							y = 0,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_di.png"
							}
						},
						{
							name = "round",
							type = "atlaslabel",
							pic = "res/ui/common/number/yxhd_time_digit.png",
							startCharMap = 47,
							text = "0",
							y = 0,
							itemWidth = 35,
							x = 0,
							itemHeight = 34
						},
						{
							x = 0,
							y = 0,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_lun.png"
							}
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "tipsNode",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_8,
			children = {
				{
					y = 100,
					x = 245,
					type = "sprite9",
					pic = {
						frame = true,
						path = "yxhd_tips_bg.png"
					},
					middleRect = CCRectMake(42, 42, 1, 1),
					preferedSize = CCSizeMake(400, 150),
					children = {
						{
							y = 60,
							x = 80,
							type = "sprite",
							pic = {
								frame = true,
								path = "ybds_panzi.png"
							},
							children = {
								{
									x = 55,
									y = 70,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 125,
									y = 80,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 90,
									y = 100,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								}
							}
						},
						{
							fontSize = 22,
							height = 0,
							x = 280,
							type = "label",
							y = 75,
							textId = 136117,
							style = "label_warlock",
							width = 200,
							anchorPoint = ccp(0.5, 0.5),
							halign = kCCTextAlignmentLeft,
							color = var_0_0
						}
					}
				},
				{
					y = 100,
					x = 670,
					type = "sprite9",
					pic = {
						frame = true,
						path = "yxhd_tips_bg.png"
					},
					middleRect = CCRectMake(42, 42, 1, 1),
					preferedSize = CCSizeMake(400, 150),
					children = {
						{
							y = 60,
							x = 80,
							type = "sprite",
							pic = {
								frame = true,
								path = "ybds_panzi.png"
							},
							children = {
								{
									x = 55,
									y = 70,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 125,
									y = 80,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 90,
									y = 100,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 90,
									y = 70,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_lajiao.png"
									}
								}
							}
						},
						{
							fontSize = 22,
							height = 0,
							x = 280,
							type = "label",
							y = 75,
							textId = 136118,
							style = "label_warlock",
							width = 200,
							anchorPoint = ccp(0.5, 0.5),
							halign = kCCTextAlignmentLeft,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			y = 280,
			x = 70,
			type = "sprite",
			pic = {
				path = "res/ui/kfsy/jxsy_pb_di.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					name = "bar",
					percentage = 0,
					x = 12.5,
					type = "progressbar",
					rotate = -90,
					y = 124,
					pic = {
						path = "res/ui/kfsy/jxsy_pb.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					progressType = kCCProgressTimerTypeBar
				},
				{
					zoomOnTouchDown = true,
					name = "btn_buff",
					h = 76,
					type = "button",
					w = 76,
					y = 282,
					x = 12.5,
					normal = {
						path = "res/ui/common/quailtyFrames/quality_frame_1.png"
					},
					touched = {
						path = "res/ui/common/quailtyFrames/quality_frame_1.png"
					},
					children = {
						{
							x = 38,
							y = 38,
							type = "sprite",
							pic = {
								frame = true,
								path = "ybds_icon.jpg"
							}
						},
						{
							y = 14,
							x = 38,
							type = "sprite",
							scaleX = 1.2,
							pic = {
								path = "res/ui/activity/MulNation/wblc_number_di.png"
							}
						},
						{
							type = "sprite",
							name = "light",
							y = 38,
							visible = false,
							x = 38
						},
						{
							fontSize = 18,
							name = "num",
							y = 14,
							type = "label",
							x = 38,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			visible = false,
			name = "btn_start1",
			h = 56,
			type = "button",
			w = 189,
			zoomOnTouchDown = false,
			y = 265,
			x = 458,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_03.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_03_c.png"
			},
			children = {
				{
					fontSize = 24,
					style = "label_warlock",
					y = 32,
					type = "label",
					x = 94,
					textId = 136125,
					color = var_0_0
				}
			}
		},
		{
			visible = false,
			name = "btn_start2",
			h = 56,
			type = "button",
			w = 189,
			zoomOnTouchDown = false,
			y = 80,
			x = 458,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_03.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_03_c.png"
			},
			children = {
				{
					fontSize = 24,
					style = "label_warlock",
					y = 32,
					type = "label",
					x = 94,
					textId = 136126,
					color = var_0_0
				}
			}
		}
	}
}
var_0_13.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 300,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_13.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getMoonCakeActivity)
end

function var_0_13.onBuyNewRound(arg_4_0)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()
	end

	messageBox.showChargeWin("", language.get(136111, arg_4_0.info.buyRoundGold), "moonCakeBuyRound", function()
		cmgr.sendRequest(var_4_0, actions.buyNewRound)
	end)
end

function var_0_13.onStartEatMoonCake(arg_7_0)
	local function var_7_0(arg_8_0)
		arg_7_0:showPanel(arg_8_0.action.data)
	end

	cmgr.sendRequest(var_7_0, actions.startEatMoonCake)
end

function var_0_13.onEatMoonCake(arg_9_0, arg_9_1)
	local function var_9_0(arg_10_0)
		local var_10_0 = tolua.cast(arg_9_0.bowl[arg_9_1].obj, "CCSprite")
		local var_10_1 = CCArray:create()
		local var_10_2 = CCFadeOut:create(0.1)
		local var_10_3 = CCMoveBy:create(0.1, ccp(0, -40))

		var_10_1:addObject(CCSpawn:createWithTwoActions(var_10_2, var_10_3))
		var_10_1:addObject(CCCallFuncN:create(function()
			var_10_0:removeFromParentAndCleanup(true)
			table.remove(arg_9_0.bowl, arg_9_1)
			arg_9_0:refresh()
			arg_9_0:showEffectNumAdd()
		end))

		local var_10_4 = CCSequence:create(var_10_1)

		var_10_0:runAction(var_10_4)
	end

	cmgr.sendRequest(var_9_0, actions.overOneBowl)
end

function var_0_13.onGetMoonCakeReward(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0)
		local var_13_0 = arg_13_0.action.data
		local var_13_1 = {}

		for iter_13_0, iter_13_1 in ipairs(var_13_0.rewards) do
			local var_13_2 = {
				id = var_0_12[iter_13_1.type],
				value = iter_13_1.num
			}

			table.insert(var_13_1, var_13_2)
		end

		globalAction_gotResource(var_13_1)
		arg_12_0:showPanel(var_13_0)
	end

	cmgr.sendRequest(var_12_0, actions.getMoonCakeReward, arg_12_1)
end

function var_0_13.addMoonCakeBowl(arg_14_0, arg_14_1)
	arg_14_0.bowl = {}

	if arg_14_0.bowlNode then
		arg_14_0.bowlNode:removeAllChildrenWithCleanup(true)
	else
		arg_14_0.bowlNode = CCNode:create()

		arg_14_0.view.widgets.panel:addChild(arg_14_0.bowlNode, var_0_6)
	end

	if arg_14_1 == 0 then
		return
	end

	local var_14_0 = {
		1,
		2,
		3
	}
	local var_14_1 = 0
	local var_14_2 = false

	if not arg_14_1 then
		arg_14_1 = math.random(1, 3)
		var_14_1 = arg_14_1 >= 2 and math.random(1, arg_14_1) or 0
		var_14_2 = true
	end

	local var_14_3 = {
		ccp(90, 100),
		ccp(125, 80),
		ccp(55, 70)
	}

	for iter_14_0 = 1, arg_14_1 do
		local var_14_4 = CCSprite:createWithSpriteFrameName("ybds_panzi.png")
		local var_14_5 = table.remove(var_14_0, math.random(1, #var_14_0))

		var_14_4:setPosition(ccp(var_14_5 * 300 - 150, 55))
		arg_14_0.bowlNode:addChild(var_14_4)

		for iter_14_1 = 1, 3 do
			local var_14_6 = CCSprite:createWithSpriteFrameName("ybds_icon_yuebing.png")

			var_14_6:setPosition(var_14_3[iter_14_1])
			var_14_4:addChild(var_14_6, 3 - iter_14_1, iter_14_1)
		end

		if iter_14_0 == var_14_1 then
			local var_14_7 = {
				num = 0,
				obj = var_14_4,
				pos = var_14_5,
				cd = var_0_9
			}

			table.insert(arg_14_0.bowl, var_14_7)

			local var_14_8 = CCSprite:createWithSpriteFrameName("ybds_lajiao.png")

			var_14_4:addChild(var_14_8, 0, 111)
			var_14_8:setPosition(ccp(90, 70))
		else
			table.insert(arg_14_0.bowl, {
				num = 0,
				cd = 0,
				obj = var_14_4,
				pos = var_14_5
			})
		end

		if var_14_2 then
			var_14_4:setPosition(ccp(var_14_5 * 300 - 150, 15))
			var_14_4:setOpacity(0)

			local var_14_9 = CCArray:create()
			local var_14_10 = CCFadeIn:create(0.1)
			local var_14_11 = CCMoveBy:create(0.1, ccp(0, 40))

			var_14_9:addObject(CCSpawn:createWithTwoActions(var_14_10, var_14_11))

			local var_14_12 = CCSequence:create(var_14_9)

			var_14_4:runAction(var_14_12)
		end
	end

	local var_14_13 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	arg_14_0.bowlNode:addChild(var_14_13)
	var_14_13:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_15_1, arg_15_2)

			if arg_14_0.isHot or arg_14_0.info.currentNum == 0 or arg_14_0.info.state ~= 2 then
				return false
			else
				for iter_15_0 = 1, #arg_14_0.bowl do
					local var_15_0 = tolua.cast(arg_14_0.bowl[iter_15_0].obj, "CCSprite")

					if arg_14_0.bowl[iter_15_0].num < var_0_10 and tool.checkIfTouch(var_15_0, arg_15_1, arg_15_2) then
						arg_14_0:showEatEffect(iter_15_0)

						return true
					end
				end
			end

			return false
		elseif arg_15_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_15_1, arg_15_2)

			return true
		elseif arg_15_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_15_1, arg_15_2)

			return true
		end
	end, false, true)
	var_14_13:setTouchEnabled(true)
end

function var_0_13.showEatEffect(arg_16_0, arg_16_1)
	if arg_16_0.spoonNode then
		arg_16_0.spoonNode:removeAllChildrenWithCleanup(true)
	else
		arg_16_0.spoonNode = CCNode:create()

		arg_16_0.view.widgets.panel:addChild(arg_16_0.spoonNode, var_0_6 + 10)
	end

	local var_16_0 = arg_16_0.bowl[arg_16_1]
	local var_16_1 = tolua.cast(var_16_0.obj, "CCSprite")

	log.info("touchBowl, idx:%d, pos:%d", arg_16_1, var_16_0.pos)

	if var_16_0.cd > 0 then
		local var_16_2 = CCArray:create()
		local var_16_3 = CCFadeOut:create(0.1)
		local var_16_4 = CCMoveBy:create(0.1, ccp(0, -40))

		var_16_2:addObject(CCSpawn:createWithTwoActions(var_16_3, var_16_4))
		var_16_2:addObject(CCCallFuncN:create(function()
			var_16_1:removeFromParentAndCleanup(true)
			table.remove(arg_16_0.bowl, arg_16_1)
			arg_16_0:showPanel(arg_16_0.info)
		end))

		local var_16_5 = CCSequence:create(var_16_2)

		var_16_1:runAction(var_16_5)
		log.info("HOT!!!")

		local var_16_6 = CCArray:create()

		var_16_6:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_16_6:addObject(CCMoveBy:create(0.1, ccp(-10, 0)))

		local var_16_7 = CCSequence:create(var_16_6)

		arg_16_0.view.widgets.playerPic:runAction(CCRepeatForever:create(var_16_7))

		arg_16_0.isHot = true

		arg_16_0.view.widgets.tipMsg:setString(language.get(136115))
		arg_16_0.view.widgets.tipFrame:setVisible(true)

		local var_16_8 = CCArray:create()

		var_16_8:addObject(CCDelayTime:create(var_0_9))
		var_16_8:addObject(CCCallFuncN:create(function()
			arg_16_0.isHot = false

			arg_16_0.view.widgets.playerPic:stopAllActions()
			arg_16_0.view.widgets.playerPic:setPositionX(458)
		end))
		var_16_8:addObject(CCDelayTime:create(1))
		var_16_8:addObject(CCCallFuncN:create(function()
			arg_16_0.view.widgets.tipFrame:setVisible(false)
		end))

		local var_16_9 = CCSequence:create(var_16_8)

		arg_16_0.view.widgets.tipFrame:runAction(var_16_9)
	else
		var_16_0.num = var_16_0.num + 1

		local var_16_10 = tolua.cast(var_16_0.obj, "CCSprite"):getChildByTag(var_16_0.num)

		if var_16_10 then
			var_16_10:setVisible(false)
		end

		local var_16_11 = CCSprite:createWithSpriteFrameName("dwhd_hand.png")

		var_16_11:setPosition(ccp(var_16_0.pos * 300 - 30, 150))
		arg_16_0.spoonNode:addChild(var_16_11)

		local var_16_12 = CCArray:create()

		var_16_12:addObject(CCMoveBy:create(0.2, ccp(-90, -60)))
		var_16_12:addObject(CCCallFuncN:create(function()
			local var_20_0 = CCSprite:createWithSpriteFrameName("ybds_icon_yuebing.png")

			var_20_0:setPosition(ccp(55, 25))
			var_16_11:addChild(var_20_0, -1)
		end))
		var_16_12:addObject(CCMoveBy:create(0.3, ccp(90, 60)))
		var_16_12:addObject(CCCallFuncN:create(function()
			var_16_11:removeFromParentAndCleanup(true)
		end))

		local var_16_13 = CCSequence:create(var_16_12)

		var_16_11:runAction(var_16_13)

		if var_16_0.num >= var_0_10 then
			arg_16_0:onEatMoonCake(arg_16_1)
		end
	end
end

function var_0_13.showEffectNumAdd(arg_22_0)
	local var_22_0, var_22_1 = tool.getPositionInScreen(arg_22_0.view.widgets.num)
	local var_22_2 = CCStrokeLabelTTF:create(language.get(136128), "Thonburi", 22, 2)

	var_22_2:setColor(colorTips.green)
	var_22_2:setPosition(ccp(var_22_0, var_22_1))
	smgr.rootLayer:addChild(var_22_2, 60000)

	local var_22_3 = CCArray:create()

	var_22_3:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
	var_22_3:addObject(CCDelayTime:create(1.5))
	var_22_3:addObject(CCCallFuncN:create(function()
		var_22_2:removeFromParentAndCleanup(true)
	end))

	local var_22_4 = CCSequence:create(var_22_3)

	var_22_2:runAction(var_22_4)
end

local function var_0_14(arg_24_0)
	log.info("getEmpytBowlNode")

	local var_24_0 = CCSpriteBatchNode:create("res/ui/activity/lantern/lanternPic.png")

	for iter_24_0 = 1, arg_24_0 do
		local var_24_1 = CCSprite:createWithSpriteFrameName("yxhd_bowl1.png")

		if iter_24_0 == 1 then
			var_24_1:setDisplayFrame(tool.spriteFrameByName("yxhd_bowl.png"))
			var_24_1:setPosition(ccp(0, 0))
		else
			var_24_1:setPosition(ccp(0, (iter_24_0 - 2) * 20 + 13))
		end

		var_24_0:addChild(var_24_1, 0, iter_24_0)
	end

	return var_24_0
end

function var_0_13.addEmptyBowl(arg_25_0)
	log.info("addEmptyBowl")

	if arg_25_0.emptyNode then
		arg_25_0.emptyNode:removeAllChildrenWithCleanup(true)
	else
		arg_25_0.emptyNode = CCNode:create()

		arg_25_0.view.widgets.panel:addChild(arg_25_0.emptyNode)
	end

	local var_25_0 = ccp(660, 275)
	local var_25_1 = arg_25_0.info.curBowlNum
	local var_25_2 = math.ceil(var_25_1 / 5)
	local var_25_3 = var_0_14(var_25_2)

	var_25_3:setPosition(var_25_0)
	var_25_3:setScaleY(0.875)
	arg_25_0.emptyNode:addChild(var_25_3)

	if var_25_1 > 0 then
		local var_25_4 = CCLabelAtlas:create("0", "res/ui/common/number/yxhd_time_digit.png", 35, 34, 47)

		var_25_4:setAnchorPoint(ccp(0.5, 0.5))
		var_25_4:setString(tostring(var_25_1))

		local var_25_5 = CCSprite:createWithSpriteFrameName("ybds_word_fen.png")
		local var_25_6 = var_25_4:getContentSize().width
		local var_25_7 = var_25_5:getContentSize().width
		local var_25_8 = var_25_6 + var_25_7

		var_25_4:setPosition(ccp(var_25_0.x - var_25_8 / 2 + var_25_6 / 2, var_25_0.y - 20))
		var_25_5:setPosition(ccp(var_25_0.x - var_25_8 / 2 + var_25_6 + var_25_7 / 2, var_25_0.y - 20))
		arg_25_0.emptyNode:addChild(var_25_4)
		arg_25_0.emptyNode:addChild(var_25_5)
	end
end

function var_0_13.setBtnBoxEnabled(arg_26_0, arg_26_1)
	arg_26_0.view.widgets.btn_box:setVisible(arg_26_1)
	arg_26_0.view.widgets.light_box:stopAllActions()
	arg_26_0.view.widgets.light_box:setVisible(arg_26_1)

	if arg_26_1 then
		local var_26_0 = CCArray:create()

		var_26_0:addObject(CCFadeIn:create(0.3))
		var_26_0:addObject(CCFadeOut:create(0.3))

		local var_26_1 = CCSequence:create(var_26_0)

		arg_26_0.view.widgets.light_box:runAction(CCRepeatForever:create(var_26_1))
		arg_26_0.view.widgets.light_box:setVisible(true)
	end

	local var_26_2 = "res/ui/rankInfo/DailyFeatView/" .. (arg_26_1 and "gxb_bx.png" or "gxb_bx_c.png")

	arg_26_0.view.widgets.pic_box:setDisplayFrame(CCSprite:create(var_26_2):displayFrame())
end

function var_0_13.showFinalResult(arg_27_0)
	if arg_27_0.resultNode then
		arg_27_0.resultNode:removeAllChildrenWithCleanup(true)
	else
		arg_27_0.resultNode = CCNode:create()

		arg_27_0.view.widgets.panel:addChild(arg_27_0.resultNode, var_0_7)
	end

	if arg_27_0.info.titleRewardNo > 0 then
		if arg_27_0.info.received == 0 then
			arg_27_0:setBtnBoxEnabled(true)
			arg_27_0.view.widgets.btn_box:addHandleOfControlEvent(function()
				log.info("btn_box，领取最终奖励")
				arg_27_0:onGetMoonCakeReward(1)
			end, CCControlEventTouchUpInside)
		else
			arg_27_0:setBtnBoxEnabled(false)
		end

		arg_27_0.view.widgets.node_box:setScale(1)
		arg_27_0.view.widgets.node_box:setPosition(ccp(710, 150 + (arg_27_0.info.titleRewardNo - 1) * 70 + 60))
		arg_27_0.view.widgets.node_box:setVisible(true)
	end

	for iter_27_0 = 1, 5 do
		local var_27_0
		local var_27_1

		if iter_27_0 <= arg_27_0.info.titleRewardNo then
			var_27_0 = "yxhd_tit_bg.png"
			var_27_1 = string.format("%s.png", var_0_5[iter_27_0])
		else
			var_27_0 = "yxhd_tit_bg_g.png"
			var_27_1 = string.format("%s_g.png", var_0_5[iter_27_0])
		end

		local var_27_2 = CCSprite:createWithSpriteFrameName(var_27_0)

		var_27_2:setPosition(ccp(570, iter_27_0 * 70 + 80 + 60))
		arg_27_0.resultNode:addChild(var_27_2)

		local var_27_3 = CCSprite:createWithSpriteFrameName(var_27_1)

		var_27_3:setPosition(ccp(130, 36))
		var_27_2:addChild(var_27_3)
	end

	arg_27_0.view.widgets.finalEatNum_p2:setString(arg_27_0.info.curBowlNum)

	local var_27_4 = arg_27_0.view.widgets.finalEatNum_p1:getContentSize().width
	local var_27_5 = arg_27_0.view.widgets.finalEatNum_p2:getContentSize().width
	local var_27_6 = arg_27_0.view.widgets.finalEatNum_p3:getContentSize().width
	local var_27_7 = var_27_4 + var_27_5 + var_27_6

	arg_27_0.view.widgets.finalEatNum_p1:setPositionX(-var_27_7 / 2 + var_27_4 / 2)
	arg_27_0.view.widgets.finalEatNum_p2:setPositionX(-var_27_7 / 2 + var_27_4 + var_27_5 / 2)
	arg_27_0.view.widgets.finalEatNum_p3:setPositionX(-var_27_7 / 2 + var_27_4 + var_27_5 + var_27_6 / 2)
	arg_27_0.view.widgets.finalEatNum_bg:setPreferredSize(CCSizeMake(var_27_7 + 60, 64))

	local var_27_8 = 4 * arg_27_0.info.titleRewardNo
	local var_27_9 = var_0_14(var_27_8)

	var_27_9:setPosition(ccp(330, 195))
	var_27_9:setScaleY(0.875)
	arg_27_0.resultNode:addChild(var_27_9)

	if arg_27_0.info.received == 0 then
		for iter_27_1 = 1, var_27_8 do
			local var_27_10 = tolua.cast(var_27_9:getChildByTag(iter_27_1), "CCSprite")

			var_27_10:setOpacity(0)

			local var_27_11 = CCArray:create()

			var_27_11:addObject(CCDelayTime:create(0.15 * (iter_27_1 - 1)))
			var_27_11:addObject(CCFadeIn:create(0.05))

			local var_27_12 = CCSequence:create(var_27_11)

			var_27_10:runAction(var_27_12)
		end
	end
end

function var_0_13.showTip(arg_29_0)
	log.info("should show tips ")

	local var_29_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_29_0:registerScriptTouchHandler(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == CCTOUCHBEGAN then
			return true
		elseif arg_30_0 == CCTOUCHMOVED then
			return true
		elseif arg_30_0 == CCTOUCHENDED then
			pcall(var_29_0.removeFromParentAndCleanup, var_29_0, true)

			return true
		end
	end, false, true)
	var_29_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_29_0, 60000)

	local var_29_1 = 0
	local var_29_2 = 0
	local var_29_3 = {}

	uiutil.initWidgets(var_29_3, arg_29_0.tipFrame)

	local var_29_4 = language.get(arg_29_0.info.canSilk == 1 and 136120 or 136121)

	var_29_3.widgets.tipMsg:setString(var_29_4)
	var_29_0:addChild(var_29_3.widgets.tipFrame)

	local var_29_5, var_29_6 = tool.getPositionInScreen(arg_29_0.view.widgets.btn_buff)
	local var_29_7 = var_29_5 + 35
	local var_29_8 = var_29_6 + 35
	local var_29_9 = var_29_3.widgets.tipMsg:getContentSize().width
	local var_29_10 = var_29_3.widgets.tipMsg:getContentSize().height

	var_29_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_29_9 + 30, var_29_10 + 30))
	var_29_3.widgets.tipFrame:setPosition(ccp(var_29_7, var_29_8))
	var_29_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_29_3.widgets.tipFrame:setVisible(true)
end

function var_0_13.showPanel(arg_31_0, arg_31_1)
	arg_31_0.info = arg_31_1
	arg_31_1.totalBowlNum = arg_31_1.totalBowlNum or 0
	arg_31_1.maxBuffNum = arg_31_1.maxBuffNum or 0

	if arg_31_0.resultNode then
		arg_31_0.resultNode:removeAllChildrenWithCleanup(true)
	end

	if arg_31_0.emptyNode then
		arg_31_0.emptyNode:removeAllChildrenWithCleanup(true)
	end

	if arg_31_0.view.widgets.timer and not tolua.isnull(arg_31_0.view.widgets.timer) then
		arg_31_0.view.widgets.timer:removeFromParentAndCleanup(true)

		arg_31_0.view.widgets.timer = nil
	end

	local var_31_0 = arg_31_1.state == 1
	local var_31_1 = arg_31_1.state == 2
	local var_31_2 = arg_31_1.state == 3

	arg_31_0.view.widgets.title1:setVisible(var_31_0)
	arg_31_0.view.widgets.tipsNode:setVisible(var_31_0)
	arg_31_0.view.widgets.btn_start1:setVisible(var_31_0)
	arg_31_0.view.widgets.bg_info:setVisible(var_31_0)

	if var_31_0 then
		arg_31_0.view.widgets.info:setString(language.get(136127, arg_31_1.maxBuffNum))
	end

	arg_31_0.view.widgets.title2:setVisible(var_31_1)
	arg_31_0.view.widgets.time_pic:setVisible(var_31_1)

	if var_31_1 then
		arg_31_0.view.widgets.round:setString(arg_31_1.curRound)
		arg_31_0.view.widgets.richLine:reorder()

		if arg_31_1.roundCd > 0 then
			local var_31_3 = CCLabelAtlas:create("", "res/ui/common/number/yxhd_time_digit2.png", 35, 39, 48)

			var_31_3:setAnchorPoint(ccp(0.5, 0.5))
			var_31_3:setString(tool.getFormatTime(arg_31_1.roundCd))
			arg_31_0.view.widgets.panel:addChild(var_31_3, var_0_7)
			var_31_3:setPosition(ccp(512, 435))

			arg_31_0.view.widgets.timer = var_31_3

			local var_31_4 = CCArray:create()

			var_31_4:addObject(CCDelayTime:create(1))
			var_31_4:addObject(CCCallFuncN:create(function()
				arg_31_1.roundCd = arg_31_1.roundCd - 1000

				if arg_31_1.roundCd <= 0 then
					var_31_3:removeFromParentAndCleanup(true)

					arg_31_0.view.widgets.timer = nil

					arg_31_0:refresh()
				else
					var_31_3:setString(tool.getFormatTime(arg_31_1.roundCd))
				end
			end))

			local var_31_5 = CCSequence:create(var_31_4)

			var_31_3:runAction(CCRepeatForever:create(var_31_5))
		end

		arg_31_0:addEmptyBowl()

		arg_31_0.bowl = arg_31_0.bowl or {}

		local var_31_6 = true

		if #arg_31_0.bowl > 0 then
			for iter_31_0, iter_31_1 in ipairs(arg_31_0.bowl) do
				if iter_31_1.cd == 0 then
					var_31_6 = false

					break
				end
			end
		end

		if var_31_6 then
			arg_31_0:addMoonCakeBowl()
		end
	else
		arg_31_0:addMoonCakeBowl(0)
	end

	arg_31_0.view.widgets.btn_start2:setVisible(var_31_2)
	arg_31_0.view.widgets.node_buy:setVisible(var_31_2)
	arg_31_0.view.widgets.maskLayer1:setVisible(var_31_2)
	arg_31_0.view.widgets.finalEatNum:setVisible(var_31_2)
	arg_31_0.view.widgets.node_box:setVisible(false)

	if var_31_2 then
		arg_31_0:showFinalResult()
		arg_31_0.view.widgets.btn_buy_info:setString(language.get(135363, arg_31_1.fenzi, arg_31_1.fenmu))
	end

	local var_31_7 = 0

	if arg_31_1.maxBuffNum > 0 then
		var_31_7 = 100 * arg_31_1.totalBowlNum / arg_31_1.maxBuffNum
	end

	arg_31_0.view.widgets.bar:setPercentage(var_31_7)
	arg_31_0.view.widgets.num:setString(language.get(390478, arg_31_1.totalBowlNum, arg_31_1.maxBuffNum))

	local var_31_8 = arg_31_1.totalBowlNum >= arg_31_1.maxBuffNum

	arg_31_0.view.widgets.light:setVisible(var_31_8)
end

function var_0_13.ctor(arg_33_0, arg_33_1, arg_33_2)
	log.info("@@ 月饼大赛")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic.plist")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic2.plist")
	rmgr.loadResource("res/ui/activity/moonCake/moonCakePic.plist")

	arg_33_0.view = {}

	uiutil.initWidgets(arg_33_0.view, arg_33_0.layout)

	arg_33_0.leftTime = arg_33_0.view.widgets.leftTime

	if arg_33_1 then
		arg_33_0:addChild(arg_33_0.view.widgets.panel)
		arg_33_1:addChild(arg_33_0)
	end

	math.randomseed(os.time())
	arg_33_0.view.widgets.playerPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())

	local var_33_0 = rmgr.getAnimation("sdtj_itemLight")
	local var_33_1 = CCAnimation:createWithSpriteFrames(var_33_0, 0.08)
	local var_33_2 = CCAnimate:create(var_33_1)

	arg_33_0.view.widgets.light:runAction(CCRepeatForever:create(var_33_2))
	arg_33_0.view.widgets.btn_box:setOpacity(0)
	arg_33_0.view.widgets.btn_buff:addHandleOfControlEvent(function()
		log.info("btn_buff")
		arg_33_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_33_0.view.widgets.btn_start1:addHandleOfControlEvent(function()
		log.info("btn_start1")
		arg_33_0:onStartEatMoonCake()
	end, CCControlEventTouchUpInside)
	arg_33_0.view.widgets.btn_start2:addHandleOfControlEvent(function()
		log.info("btn_start2")
		arg_33_0:onStartEatMoonCake()
	end, CCControlEventTouchUpInside)
	arg_33_0.view.widgets.btn_buy:addHandleOfControlEvent(function()
		log.info("btn_buy")
		arg_33_0:onBuyNewRound()
	end, CCControlEventTouchUpInside)
	arg_33_0:showPanel(arg_33_2)
end

return var_0_13
