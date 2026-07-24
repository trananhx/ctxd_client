local var_0_0 = require("res/native/offset").get("layer.activity.silkCard")
local var_0_1 = {
	[2] = {
		rate = "xscdcb_jb_2x.png",
		txt = 136141,
		pic = "xscdcb_lingpai_01.png"
	},
	[3] = {
		rate = "xscdcb_jb_3x.png",
		txt = 136142,
		pic = "xscdcb_lingpai_03.png"
	},
	[5] = {
		rate = "xscdcb_jb_5x.png",
		txt = 136143,
		pic = "xscdcb_lingpai_02.png"
	}
}
local var_0_2 = {
	{
		pic = "xscdcb_gift_02.png",
		color = tool.hexToRgb("#FFA95B")
	},
	{
		pic = "xscdcb_gift_01.png",
		color = tool.hexToRgb("#F07C63")
	},
	{
		pic = "xscdcb_gift_03.png",
		color = tool.hexToRgb("#F885FC")
	}
}
local var_0_3 = {
	[50] = {
		txt = 213404,
		type = 10034
	},
	[116] = {
		txt = 310020,
		type = 55
	},
	[126] = {
		txt = 111043,
		type = 10030
	},
	[119] = {
		txt = 111044,
		type = 10033
	},
	[1001] = {
		txt = 226005,
		type = 91001
	},
	[1002] = {
		txt = 226006,
		type = 91002
	},
	[1003] = {
		txt = 226007,
		type = 91003
	}
}
local var_0_4 = colorQuality[0]
local var_0_5 = tool.hexToRgb("#D9EDC5")
local var_0_6 = ccc3(0, 180, 0)
local var_0_7 = colorQuality[5]
local var_0_8 = colorQuality[4]
local var_0_9 = colorQuality[2]
local var_0_10 = class("SilkCard", function()
	return createBaseLayer()
end)

var_0_10.layout = {
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
			x = 780,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_7
		},
		{
			y = 80,
			name = "line",
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/general/jailView/comm_list_laofang_3.png"
			}
		},
		{
			y = 485,
			name = "title",
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/activity/silkshop/scdcb_title.png"
			}
		},
		{
			y = 465,
			type = "sprite",
			scaleX = 2,
			x = 0,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/activity/silkCard/xscdcb_number_bg.png"
			}
		},
		{
			fontSize = 20,
			name = "remainPickNum",
			y = 465,
			type = "label",
			x = 10,
			color = var_0_5,
			anchorPoint = ccp(0, 0.5)
		},
		{
			y = 410,
			type = "sprite",
			x = 458,
			pic = {
				path = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png"
			},
			children = {
				{
					y = 55,
					name = "bg_bar",
					type = "sprite",
					x = 510,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png"
					},
					children = {
						{
							y = 0,
							name = "bar",
							type = "progressbar",
							x = 0,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
							}
						},
						{
							fontSize = 25,
							name = "num",
							y = 15,
							type = "label",
							x = 360,
							color = var_0_5
						}
					}
				},
				{
					anchorPointX = 0,
					name = "richLine",
					y = 55,
					type = "richLine",
					gap = -5,
					x = 5,
					content = {
						{
							y = 0,
							name = "round_p1",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/activity/silkCard/xscdcb_word_di.png"
							}
						},
						{
							name = "round_p2",
							type = "atlaslabel",
							pic = "res/ui/common/number/gphb_word_digit.png",
							startCharMap = 48,
							text = "0",
							y = 0,
							itemWidth = 28,
							x = 0,
							itemHeight = 33
						},
						{
							y = 0,
							name = "round_p3",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/activity/silkCard/xscdcb_slash.png"
							}
						},
						{
							name = "round_p4",
							type = "atlaslabel",
							pic = "res/ui/common/number/gphb_word_digit.png",
							startCharMap = 48,
							text = "0",
							y = 0,
							itemWidth = 28,
							x = 0,
							itemHeight = 33
						},
						{
							y = 0,
							name = "round_p5",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/activity/silkCard/xscdcb_word_lun.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_token",
					h = 80,
					type = "button",
					w = 80,
					y = 55,
					x = 880,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 40,
							name = "token",
							type = "sprite",
							x = 40,
							pic = {
								path = "res/ui/activity/silkCard/xscdcb_lingpai_01.png"
							}
						}
					}
				}
			}
		},
		{
			y = 210,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/activity/silkCard/xscdcb_bg.png"
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_cash",
			h = 80,
			type = "button",
			w = 80,
			y = 40,
			x = 40,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 40,
					x = 40,
					type = "sprite",
					pic = {
						path = "res/ui/activity/silkCard/xscdcb_icon_djj.png"
					}
				}
			}
		},
		{
			fontSize = 25,
			name = "cash",
			y = 30,
			type = "label",
			x = 60,
			color = var_0_8,
			anchorPoint = ccp(0, 0.5)
		},
		{
			x = 0,
			height = 447,
			name = "maskLayer",
			type = "layerColor",
			y = 0,
			zorder = 100,
			visible = false,
			width = 915,
			color = ccc4(0, 0, 0, 180),
			children = {
				{
					name = "btn_mask",
					h = 447,
					type = "button",
					w = 915,
					y = 0,
					x = 0,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					anchorPoint = ccp(0, 0)
				}
			}
		},
		{
			visible = false,
			name = "info_end",
			y = 220,
			type = "sprite",
			x = 458,
			zorder = 100,
			pic = {
				path = "res/ui/activity/gemsActivity/new/xsczbs_word_bchdyjs.png"
			}
		}
	}
}

function var_0_10.getSingleCard(arg_2_0, arg_2_1)
	return {
		y = 0,
		type = "node",
		x = 0,
		name = "card" .. arg_2_1,
		children = {
			{
				y = 0,
				type = "sprite",
				x = 0,
				name = "cardA" .. arg_2_1,
				pic = {
					path = "res/ui/activity/silkCard/xscdcb_s_frame.png"
				},
				children = {
					{
						y = 180,
						type = "sprite",
						x = 115,
						name = "icon" .. arg_2_1,
						pic = {
							path = "res/ui/activity/silkCard/" .. var_0_2[arg_2_1].pic
						}
					},
					{
						type = "sprite",
						y = 295,
						visible = false,
						x = 0,
						name = "rate" .. arg_2_1,
						anchorPoint = ccp(0, 1),
						pic = {
							path = "res/ui/activity/silkCard/xscdcb_jb_2x.png"
						}
					},
					{
						y = 91,
						type = "sprite",
						x = 115,
						name = "bg_num" .. arg_2_1,
						pic = {
							path = "res/ui/activity/silkCard/xscdcb_word_bg.png"
						},
						children = {
							{
								y = 21,
								type = "label",
								x = 110,
								color = var_0_2[arg_2_1].color,
								name = "num" .. arg_2_1,
								fontSize = 25 + (var_0_0.cardNumFntSize or 0)
							}
						}
					},
					{
						h = 56,
						type = "button",
						w = 212,
						y = 35,
						x = 115,
						name = "btn_buy" .. arg_2_1,
						normal = {
							path = "res/ui/common/button/sdyjs_btn_02.png"
						},
						touched = {
							path = "res/ui/common/button/sdyjs_btn_02_c.png"
						},
						disable = {
							path = "res/ui/common/button/sdyjs_btn_02_g.png"
						},
						children = {
							{
								y = 40,
								x = 40,
								type = "sprite",
								scale = 0.6,
								pic = {
									path = "res/ui/activity/ironRotary/yuanbao.png"
								}
							},
							{
								fontSize = 22,
								y = 22,
								type = "label",
								x = 40,
								color = var_0_8,
								name = "gold" .. arg_2_1
							},
							{
								fontSize = 24,
								y = 32,
								type = "label",
								x = 130,
								textId = 101018,
								color = var_0_5
							}
						}
					},
					{
						type = "sprite",
						y = 35,
						visible = false,
						x = 115,
						name = "bg_bar" .. arg_2_1,
						pic = {
							path = "res/ui/world/manzu/zymz_pb_bg.png"
						},
						children = {
							{
								y = 0,
								type = "progressbar",
								x = 0,
								name = "bar" .. arg_2_1,
								anchorPoint = ccp(0, 0),
								pic = {
									path = "res/ui/kfyz/zymz_pb_zheng.png"
								}
							}
						}
					}
				}
			},
			{
				type = "sprite",
				y = 0,
				visible = false,
				x = 0,
				name = "cardB" .. arg_2_1,
				pic = {
					path = "res/ui/activity/silkCard/xscdcb_s_frame.png"
				}
			}
		}
	}
end

var_0_10.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 0,
			textId = 136144,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_10.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getSilkCardActivity)
end

function var_0_10.onPickSilkCard(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.info.cards[arg_5_1]

	local function var_5_1(arg_6_0)
		arg_5_0:showEffectPickCard(arg_5_1, arg_6_0.action.data.reward)
	end

	local function var_5_2()
		cmgr.sendRequest(var_5_1, actions.pickSilkCard, var_5_0.pos)
	end

	if var_5_0.gold > 0 then
		local var_5_3

		if var_5_0.cash > 0 then
			var_5_3 = language.get(136138, var_5_0.cash, var_5_0.gold)
		else
			var_5_3 = language.get(136137, var_5_0.gold)
		end

		messageBox.showChargeWin("", var_5_3, "buySilkCard", var_5_2)
	else
		var_5_2()
	end
end

function var_0_10.onUseSilkCardToken(arg_8_0)
	local function var_8_0(arg_9_0)
		arg_8_0:showRateUpEffect()
	end

	cmgr.sendRequest(var_8_0, actions.useSilkCardToken)
end

function var_0_10.showEffectShake(arg_10_0, arg_10_1)
	if not arg_10_1 or tolua.isnull(arg_10_1) then
		return
	end

	local var_10_0 = CCArray:create()

	var_10_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_10_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_10_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_10_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_10_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_10_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_10_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_10_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_10_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_10_0:addObject(CCDelayTime:create(0.4))

	local var_10_1 = CCSequence:create(var_10_0)

	arg_10_1:stopAllActions()
	arg_10_1:runAction(CCRepeatForever:create(var_10_1))
end

function var_0_10.showTurnEffect(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_2 then
		arg_11_0.view.widgets.panel:stopAllActions()
	end

	for iter_11_0 = 1, 3 do
		local var_11_0 = arg_11_1 and arg_11_0.view.widgets["cardA" .. iter_11_0] or arg_11_0.view.widgets["cardB" .. iter_11_0]
		local var_11_1 = arg_11_1 and arg_11_0.view.widgets["cardB" .. iter_11_0] or arg_11_0.view.widgets["cardA" .. iter_11_0]

		var_11_0:setVisible(true)
		var_11_1:setVisible(false)
		var_11_0:stopAllActions()
		var_11_1:stopAllActions()

		local var_11_2 = CCArray:create()

		var_11_2:addObject(CCOrbitCamera:create(0.2, 1, 0, 0, 90, 0, 0))
		var_11_2:addObject(CCHide:create())

		if iter_11_0 == 3 then
			var_11_2:addObject(CCCallFuncN:create(function()
				arg_11_0:UpdateCard()
			end))
		end

		var_11_0:runAction(CCSequence:create(var_11_2))

		local var_11_3 = CCArray:create()

		var_11_3:addObject(CCDelayTime:create(0.2))
		var_11_3:addObject(CCShow:create())
		var_11_3:addObject(CCOrbitCamera:create(0.2, 1, 0, 270, 90, 0, 0))

		if iter_11_0 == 3 and arg_11_2 then
			var_11_3:addObject(CCCallFuncN:create(arg_11_2))
		end

		var_11_1:runAction(CCSequence:create(var_11_3))
	end
end

function var_0_10.showRateUpEffect(arg_13_0)
	local var_13_0 = "res/anim/stategyEffect/att_jitui/att_jitui.plist"

	rmgr.loadResource(var_13_0)

	for iter_13_0 = 1, 3 do
		local var_13_1 = CCArray:create()

		for iter_13_1 = 1, 10 do
			iter_13_1 = iter_13_1 == 10 and 15 or iter_13_1

			local var_13_2 = CCSprite:createWithSpriteFrameName(string.format("%d.png", iter_13_1))

			var_13_1:addObject(var_13_2:displayFrame())
		end

		local var_13_3 = CCAnimation:createWithSpriteFrames(var_13_1, 0.08)
		local var_13_4 = CCAnimate:create(var_13_3)
		local var_13_5 = CCSprite:create()

		var_13_5:setPosition(ccp(160 + (iter_13_0 - 1) * 300, 220))
		arg_13_0.view.widgets.panel:addChild(var_13_5, 100)

		local var_13_6 = CCArray:create()

		var_13_6:addObject(var_13_4)

		if iter_13_0 == 3 then
			var_13_6:addObject(CCCallFuncN:create(function()
				arg_13_0.needUpdateCard = true

				arg_13_0:refresh()
			end))
		end

		var_13_6:addObject(CCCallFuncN:create(function()
			var_13_5:removeFromParentAndCleanup(true)
		end))

		local var_13_7 = CCSequence:create(var_13_6)

		var_13_5:runAction(var_13_7)
	end

	CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_13_0)
end

function var_0_10.showEffectPickCard(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.info.cards[arg_16_1]

	if var_16_0.num then
		local var_16_1 = {}
		local var_16_2 = {
			id = var_0_3[arg_16_2.type].type,
			value = math.floor(arg_16_2.num / arg_16_0.info.tokenEffect)
		}

		for iter_16_0 = 1, arg_16_0.info.tokenEffect do
			table.insert(var_16_1, var_16_2)
		end

		globalAction_gotResource(var_16_1)

		arg_16_0.needUpdateCard = false

		arg_16_0:refresh()
	else
		local var_16_3 = language.get(var_0_3[var_16_0.type].txt)

		arg_16_0.view.widgets.maskLayer:setVisible(true)
		arg_16_0.view.widgets["btn_buy" .. arg_16_1]:setVisible(false)
		arg_16_0.view.widgets["bg_bar" .. arg_16_1]:setVisible(true)
		arg_16_0.view.widgets["card" .. arg_16_1]:retain()
		arg_16_0.view.widgets["card" .. arg_16_1]:removeFromParentAndCleanup(false)
		arg_16_0.view.widgets.panel:addChild(arg_16_0.view.widgets["card" .. arg_16_1], 200)

		local var_16_4 = CCArray:create()

		var_16_4:addObject(CCProgressTo:create(1, 100))
		var_16_4:addObject(CCCallFuncN:create(function()
			arg_16_0.view.widgets["num" .. arg_16_1]:stopAllActions()
			arg_16_0.view.widgets["num" .. arg_16_1]:setString(language.get(136130, var_16_3, math.floor(arg_16_2.num / arg_16_0.info.tokenEffect)))

			local var_17_0 = {}
			local var_17_1 = {
				id = var_0_3[arg_16_2.type].type,
				value = math.floor(arg_16_2.num / arg_16_0.info.tokenEffect)
			}

			for iter_17_0 = 1, arg_16_0.info.tokenEffect do
				table.insert(var_17_0, var_17_1)
			end

			globalAction_gotResource(var_17_0)
		end))
		var_16_4:addObject(CCDelayTime:create(0.5))
		var_16_4:addObject(CCCallFuncN:create(function()
			arg_16_0.view.widgets.maskLayer:setVisible(false)
			arg_16_0.view.widgets["card" .. arg_16_1]:retain()
			arg_16_0.view.widgets["card" .. arg_16_1]:removeFromParentAndCleanup(false)
			arg_16_0.view.widgets.panel:addChild(arg_16_0.view.widgets["card" .. arg_16_1], 0)

			arg_16_0.needUpdateCard = false

			arg_16_0:refresh()
		end))

		local var_16_5 = CCSequence:create(var_16_4)

		arg_16_0.view.widgets["bar" .. arg_16_1]:runAction(var_16_5)

		local var_16_6 = CCArray:create()

		var_16_6:addObject(CCDelayTime:create(0.1))
		var_16_6:addObject(CCCallFunc:create(function()
			arg_16_0.view.widgets["num" .. arg_16_1]:setString(language.get(136130, var_16_3, math.random(var_16_0.minNum, var_16_0.maxNum)))
		end))

		local var_16_7 = CCSequence:create(var_16_6)

		arg_16_0.view.widgets["num" .. arg_16_1]:runAction(CCRepeatForever:create(var_16_7))
	end
end

function var_0_10.UpdateCard(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.info.cards) do
		arg_20_0.view.widgets["gold" .. iter_20_0]:setString(language.get(131102, iter_20_1.rawGold))

		if conf.language == "vie" or conf.language == "tha" then
			arg_20_0.view.widgets["gold" .. iter_20_0]:setString(iter_20_1.rawGold)
		end

		local var_20_0 = language.get(var_0_3[iter_20_1.type].txt)
		local var_20_1

		if iter_20_1.num then
			var_20_1 = language.get(136130, var_20_0, iter_20_1.num)
		else
			var_20_1 = language.get(136131, var_20_0, iter_20_1.minNum, iter_20_1.maxNum)
		end

		arg_20_0.view.widgets["num" .. iter_20_0]:setString(var_20_1)
		arg_20_0.view.widgets["btn_buy" .. iter_20_0]:setVisible(true)
		arg_20_0.view.widgets["bg_bar" .. iter_20_0]:setVisible(false)

		local var_20_2 = var_0_1[arg_20_0.info.tokenEffect] ~= nil

		arg_20_0.view.widgets["rate" .. iter_20_0]:setVisible(var_20_2)

		if var_20_2 then
			arg_20_0.view.widgets["rate" .. iter_20_0]:setDisplayFrame(CCSprite:create("res/ui/activity/silkCard/" .. var_0_1[arg_20_0.info.tokenEffect].rate):displayFrame())
		end
	end
end

function var_0_10.showTip(arg_21_0, arg_21_1)
	log.info("should show tips ")

	if arg_21_1 and not var_0_1[arg_21_1] then
		return
	end

	local var_21_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_21_0:registerScriptTouchHandler(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == CCTOUCHBEGAN then
			return true
		elseif arg_22_0 == CCTOUCHMOVED then
			return true
		elseif arg_22_0 == CCTOUCHENDED then
			pcall(var_21_0.removeFromParentAndCleanup, var_21_0, true)

			return true
		end
	end, false, true)
	var_21_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_21_0, 60000)

	local var_21_1 = 0
	local var_21_2 = 0
	local var_21_3 = {}

	uiutil.initWidgets(var_21_3, arg_21_0.tipFrame)
	var_21_0:addChild(var_21_3.widgets.tipFrame)

	local var_21_4 = arg_21_0.view.widgets.btn_cash

	if arg_21_1 then
		var_21_3.widgets.tipFrame:setAnchorPoint(ccp(1, 1))

		var_21_4 = arg_21_0.view.widgets.btn_token

		var_21_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))
		var_21_3.widgets.tipMsg:setString(language.get(var_0_1[arg_21_1].txt))
	end

	local var_21_5, var_21_6 = tool.getPositionInScreen(var_21_4)
	local var_21_7 = var_21_5 + 20
	local var_21_8 = var_21_6 - 20
	local var_21_9 = var_21_3.widgets.tipMsg:getContentSize().width
	local var_21_10 = var_21_3.widgets.tipMsg:getContentSize().height

	var_21_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_21_9 + 30, var_21_10 + 30))
	var_21_3.widgets.tipFrame:setPosition(ccp(var_21_7, var_21_8))
	var_21_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_21_3.widgets.tipFrame:setVisible(true)
end

function var_0_10.showPanel(arg_23_0, arg_23_1)
	arg_23_0.info = arg_23_1

	table.sort(arg_23_1.cards, function(arg_24_0, arg_24_1)
		return arg_24_0.pos < arg_24_1.pos
	end)
	arg_23_0.view.widgets.cash:setString(language.get(490026, arg_23_1.cash))
	arg_23_0.view.widgets.remainPickNum:setString(language.get(136145, arg_23_1.remainPickNum))

	local var_23_0 = arg_23_1.remainPickNum == 0

	arg_23_0.view.widgets.maskLayer:setVisible(var_23_0)
	arg_23_0.view.widgets.info_end:setVisible(var_23_0)
	arg_23_0.view.widgets.card1:setVisible(not var_23_0)
	arg_23_0.view.widgets.card2:setVisible(not var_23_0)
	arg_23_0.view.widgets.card3:setVisible(not var_23_0)

	if not var_23_0 then
		if arg_23_0.needUpdateCard then
			arg_23_0:UpdateCard()
		else
			arg_23_0:showTurnEffect(false)
		end
	end

	arg_23_0.view.widgets.round_p2:setString(tostring(arg_23_1.roundInfo.current))
	arg_23_0.view.widgets.round_p4:setString(tostring(arg_23_1.roundInfo.max))
	arg_23_0.view.widgets.richLine:reorder()

	local var_23_1 = 100 * arg_23_1.progressBar.current / arg_23_1.progressBar.max

	arg_23_0.view.widgets.bar:setPercentage(var_23_1)
	arg_23_0.view.widgets.num:setString(language.get(390478, arg_23_1.progressBar.current, arg_23_1.progressBar.max))

	local var_23_2 = arg_23_1.useFinalToken ~= true

	arg_23_0.view.widgets.btn_token:stopAllActions()

	if conf.language == "tha" then
		arg_23_0.view.widgets.btn_token:setPosition(ccp(840, 55))
	else
		arg_23_0.view.widgets.btn_token:setPosition(ccp(880, 55))
	end

	arg_23_0.view.widgets.btn_token:setVisible(var_23_2)

	if var_23_2 then
		arg_23_0.view.widgets.token:setDisplayFrame(CCSprite:create("res/ui/activity/silkCard/" .. var_0_1[arg_23_1.progressBar.tokenEffect].pic):displayFrame())

		if var_23_1 >= 100 then
			arg_23_0:showEffectShake(arg_23_0.view.widgets.btn_token)
		end
	end
end

function var_0_10.ctor(arg_25_0, arg_25_1, arg_25_2)
	log.info("@@ 新丝绸酬宾")

	arg_25_0.view = {}

	uiutil.initWidgets(arg_25_0.view, arg_25_0.layout)

	arg_25_0.leftTime = arg_25_0.view.widgets.leftTime

	if arg_25_1 then
		arg_25_0:addChild(arg_25_0.view.widgets.panel)
		arg_25_1:addChild(arg_25_0)
	end

	if arg_25_2.eventType == 2 then
		arg_25_0.view.widgets.title:setDisplayFrame(CCSprite:create("res/ui/activity/silkCard/gtdcb_title.png"):displayFrame())
	end

	arg_25_0.view.widgets.btn_token:addHandleOfControlEvent(function()
		log.info("btn_token")

		local var_26_0 = arg_25_0.info.progressBar

		if not var_26_0 then
			return
		end

		if var_26_0.current >= var_26_0.max then
			arg_25_0:onUseSilkCardToken()
		else
			arg_25_0:showTip(var_26_0.tokenEffect)
		end
	end, CCControlEventTouchUpInside)
	arg_25_0.view.widgets.btn_cash:addHandleOfControlEvent(function()
		log.info("btn_cash")
		arg_25_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_25_0.view.widgets.btn_mask:addHandleOfControlEvent(function()
		log.info("btn_mask")
	end, CCControlEventTouchUpInside)

	for iter_25_0 = 1, 3 do
		uiutil.initWidgets(arg_25_0.view, arg_25_0:getSingleCard(iter_25_0))
		arg_25_0.view.widgets.panel:addChild(arg_25_0.view.widgets["card" .. iter_25_0])
		arg_25_0.view.widgets["card" .. iter_25_0]:setPosition(ccp(160 + (iter_25_0 - 1) * 300, 220))
		arg_25_0.view.widgets["btn_buy" .. iter_25_0]:addHandleOfControlEvent(function()
			log.info("btn_buy" .. iter_25_0)
			arg_25_0:onPickSilkCard(iter_25_0)
		end, CCControlEventTouchUpInside)
	end

	arg_25_0.needUpdateCard = true

	arg_25_0:showPanel(arg_25_2)

	if conf.language == "vie" then
		arg_25_0.view.widgets.round_p5:setVisible(false)
	end

	if conf.language == "tha" then
		arg_25_0.view.widgets.bg_bar:setScaleX(0.9)
		arg_25_0.view.widgets.btn_token:setPositionX(840)
	end
end

function var_0_10.onEnter(arg_30_0)
	CCDirector:sharedDirector():setProjection(kCCDirectorProjection2D)
end

function var_0_10.onExit(arg_31_0)
	CCDirector:sharedDirector():setProjection(kCCDirectorProjection3D)
end

return var_0_10
