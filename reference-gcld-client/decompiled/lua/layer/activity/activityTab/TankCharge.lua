local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = class("TankCharge", function()
	return createBaseLayer()
end)

var_0_7.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					y = 223,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tankCharge/tjcf_bg.jpg"
					}
				},
				{
					y = 414,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tankCharge/tjcf_bar_di.png"
					}
				},
				{
					y = 223,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/changbanSally/cbtw_frame.png"
					}
				},
				{
					y = 417,
					x = 80,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tankCharge/tjcf_word_chzc.png"
					}
				},
				{
					y = 485,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tankCharge/tjcf_title.png"
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 475,
					type = "label",
					x = 705,
					color = var_0_3
				},
				{
					y = 485,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 840
				},
				{
					y = 417,
					type = "sprite",
					x = 496,
					pic = {
						path = "res/ui/activity/gemsActivity/new/sczbsyh_pb_d.png"
					},
					children = {
						{
							y = 12.5,
							name = "bar1",
							type = "progressbar",
							x = 309,
							pic = {
								path = "res/ui/activity/gemsActivity/new/sczbsyh_pb.png"
							}
						},
						{
							fontSize = 25,
							name = "killNum",
							y = 12.5,
							type = "label",
							x = 309
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_buff",
					h = 60,
					type = "button",
					w = 80,
					y = 416,
					x = 856,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							type = "sprite",
							name = "light_buff",
							y = 30,
							visible = false,
							x = 40,
							pic = {
								path = "res/ui/instance/cbhs/light.png"
							}
						},
						{
							x = 44,
							name = "icon_buff",
							y = 32,
							type = "sprite",
							scale = 0.4
						},
						{
							type = "sprite",
							name = "finish_buff",
							y = 30,
							visible = false,
							x = 40,
							pic = {
								path = "res/ui/activity/zongzi/dwsl_seal_ylq.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_tank1",
					h = 140,
					type = "button",
					w = 160,
					y = 316,
					visible = false,
					x = 454,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 70,
							name = "tank1",
							type = "sprite",
							x = 88,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_zhanche_01.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_tank2",
					h = 140,
					type = "button",
					w = 160,
					y = 334,
					visible = false,
					x = 666,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 70,
							name = "tank2",
							type = "sprite",
							x = 88,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_zhanche_01.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_tank3",
					h = 140,
					type = "button",
					w = 160,
					y = 188,
					visible = false,
					x = 556,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 70,
							name = "tank3",
							type = "sprite",
							x = 88,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_zhanche_01.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_tank4",
					h = 140,
					type = "button",
					w = 160,
					y = 250,
					visible = false,
					x = 764,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 70,
							name = "tank4",
							type = "sprite",
							x = 88,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_zhanche_01.png"
							}
						}
					}
				},
				{
					type = "sprite",
					name = "arrow",
					y = 260,
					visible = false,
					x = 556,
					pic = {
						path = "res/ui/activity/gemMine/bskd_arrow.png"
					}
				},
				{
					y = 0,
					name = "scrollview",
					type = "scrollview",
					x = 0,
					viewSize = CCSizeMake(915, 532),
					children = {
						{
							x = 0,
							height = 532,
							y = 0,
							type = "layerColor",
							width = 915,
							color = ccc4(0, 0, 0, 0),
							children = {
								{
									zoomOnTouchDown = true,
									name = "btn_tank5",
									h = 140,
									type = "button",
									w = 160,
									y = 120,
									visible = false,
									x = 724,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 70,
											name = "tank5",
											type = "sprite",
											x = 88,
											pic = {
												path = "res/ui/activity/tankCharge/tjcf_zhanche_02.png"
											}
										}
									}
								},
								{
									type = "sprite",
									name = "bg_tankGold",
									x = 724,
									visible = false,
									y = 50,
									scale = 0.8,
									pic = {
										path = "res/ui/silk/market/scpm_word_d.png"
									},
									children = {
										{
											y = 19,
											x = 50,
											type = "sprite",
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 25,
											name = "tankGold",
											y = 21,
											type = "label",
											x = 100
										}
									}
								},
								{
									type = "sprite",
									name = "myTank1",
									x = 250,
									visible = false,
									y = 176,
									scale = 1.3
								},
								{
									type = "sprite",
									name = "broken",
									y = 234,
									visible = false,
									x = 224,
									pic = {
										path = "res/ui/activity/tankCharge/tjcf_word_ccczzcsh.png"
									}
								},
								{
									type = "sprite",
									name = "special20",
									y = 234,
									visible = false,
									x = 224,
									pic = {
										path = "res/ui/activity/tankCharge/tjcfyh_word_srpzjlyt.png"
									}
								}
							}
						}
					}
				},
				{
					type = "sprite",
					name = "bg_bar2",
					y = 40,
					visible = false,
					x = 130,
					pic = {
						path = "res/ui/activity/tankCharge/tjcf_s_bar_di.png"
					},
					children = {
						{
							y = 12,
							name = "bar2",
							type = "progressbar",
							x = 105,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_s_bar_02.png"
							}
						},
						{
							fontSize = 25,
							name = "rewardNum1",
							y = 12,
							type = "label",
							x = 105
						},
						{
							y = 20,
							type = "sprite",
							x = -10,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_word_cz.png"
							}
						},
						{
							y = 12,
							name = "warning",
							type = "sprite",
							x = 210,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_word_hh.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_attack",
					h = 62,
					type = "button",
					w = 195,
					y = 40,
					visible = false,
					x = 457.5,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					children = {
						{
							y = 34,
							type = "sprite",
							x = 48,
							pic = {
								path = "res/ui/common/button/public_btn_gold.png"
							},
							children = {
								{
									type = "sprite",
									name = "icon_buyTimes",
									y = 35,
									visible = false,
									x = 42,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "buyTimesGold",
									y = 15,
									type = "label",
									x = 42
								}
							}
						},
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 125,
							textId = "217210_zww",
							color = var_0_1
						}
					}
				},
				{
					name = "btn_reward",
					zoomOnTouchDown = true,
					type = "button",
					w = 195,
					h = 62,
					y = 40,
					visible = false,
					x = 457.5,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					disable = {
						path = "res/ui/common/button/public_btn_green_g.png"
					},
					children = {
						{
							fontSize = 25,
							y = 34,
							type = "label",
							x = 95,
							textId = "217211_zww",
							color = var_0_1
						}
					}
				},
				{
					visible = false,
					name = "bg_result",
					type = "sprite9",
					zorder = 10,
					y = 170,
					x = 457.5,
					preferedSize = CCSizeMake(900, 280),
					middleRect = CCRectMake(400, 20, 109, 158),
					pic = {
						path = "res/ui/activity/godPaper/czzyb_longbg2.png"
					},
					children = {
						{
							name = "btn_result",
							h = 532,
							type = "button",
							w = 909,
							zorder = -1,
							y = 236,
							x = 450,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							x = 190,
							name = "myTank2",
							y = 150,
							type = "sprite",
							scale = 1.3
						},
						{
							y = 210,
							name = "bg_bar3",
							type = "sprite",
							x = 530,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_s_bar_di.png"
							},
							children = {
								{
									y = 12,
									name = "bar3",
									type = "progressbar",
									x = 105,
									pic = {
										path = "res/ui/activity/tankCharge/tjcf_s_bar_02.png"
									}
								},
								{
									fontSize = 25,
									name = "rewardNum2",
									y = 12,
									type = "label",
									x = 105
								}
							}
						},
						{
							y = 280,
							name = "title_result",
							type = "sprite",
							x = 530,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_word_zjzl.png"
							}
						},
						{
							y = 140,
							name = "result",
							type = "sprite",
							x = 530,
							pic = {
								path = "res/ui/activity/tankCharge/tjcf_word_dywdjhjz.png"
							}
						},
						{
							type = "sprite",
							name = "noReward",
							y = 70,
							visible = false,
							x = 530,
							pic = {
								path = "res/ui/activity/tankCharge/tjcfyh_word_zdhsgyt.png"
							}
						},
						{
							anchorPointX = 0.5,
							name = "richLine_totalRewards",
							y = 70,
							type = "richLine",
							gap = 0,
							x = 530,
							content = {
								{
									name = "totalRewards_p1",
									type = "sprite",
									pic = {
										path = "res/ui/activity/tankCharge/tjcf_word_hdyt.png"
									}
								},
								{
									name = "totalRewards_p2",
									type = "atlaslabel",
									pic = "res/ui/common/number/clock_lucky_numb.png",
									startCharMap = 48,
									text = "0",
									y = 42,
									itemWidth = 32,
									x = 236,
									itemHeight = 42
								},
								{
									name = "totalRewards_p3",
									type = "sprite",
									pic = {
										path = "res/ui/activity/tankCharge/tjcf_word_ge.png"
									}
								}
							}
						}
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
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_7.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getTankChargeActivity)
end

function var_0_7.onGetTankChargeReward(arg_4_0, arg_4_1, arg_4_2)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		if arg_4_1 == 0 then
			if arg_4_0.info.guide == true then
				arg_4_0.showGuide = true
			end

			arg_4_0:refresh()
		elseif arg_4_1 == 1 then
			if arg_4_0.info.guide == true then
				arg_4_0.view.widgets.arrow:setVisible(false)
			end

			arg_4_0:showEffectAttack(var_5_0, arg_4_2)
		elseif arg_4_1 == 2 then
			arg_4_0:showResult(var_5_0)
		end
	end

	arg_4_2 = arg_4_2 or 0

	local var_4_1 = arg_4_0.info.tanks[arg_4_2]

	if arg_4_1 == 0 and arg_4_0.info.freeTimes == 0 then
		messageBox.showChargeWin("", language.get(217206, arg_4_0.info.buyTimes), "buyTankChargeTimes", function()
			cmgr.sendRequest(var_4_0, actions.getTankChargeReward, arg_4_1, arg_4_2)
		end)
	elseif arg_4_1 == 1 and var_4_1 and var_4_1.gold > 0 then
		messageBox.showChargeWin("", language.get(217208, var_4_1.gold), "buyGoldTank", function()
			cmgr.sendRequest(var_4_0, actions.getTankChargeReward, arg_4_1, arg_4_2)
		end)
	else
		cmgr.sendRequest(var_4_0, actions.getTankChargeReward, arg_4_1, arg_4_2)
	end
end

function var_0_7.onGetFreeTimes(arg_8_0)
	local function var_8_0(arg_9_0)
		local var_9_0 = {}
		local var_9_1 = {}

		var_9_1.id = 10072
		var_9_1.value = arg_9_0.action.data.getFreeTimesReward

		table.insert(var_9_0, var_9_1)
		globalAction_gotResource(var_9_0)
		arg_8_0:refresh()
	end

	cmgr.sendRequest(var_8_0, actions.tankChargeGetFreeTimes)
end

function var_0_7.showResult(arg_10_0, arg_10_1)
	local var_10_0
	local var_10_1
	local var_10_2

	if arg_10_1.win == 0 then
		var_10_0 = "tjcf_word_zjzl.png"
		var_10_2 = "tjcf_word_ccczzchh.png"
	elseif arg_10_1.win == 2 then
		var_10_0 = "tjcf_word_dhqs.png"
		var_10_2 = "tjcfyh_word_ydygsbjl.png"
	elseif arg_10_0.info.special20 then
		var_10_0 = "tjcfyh_word_srpz.png"
		var_10_2 = "tjcfyh_word_ydygewjl.png"
	else
		var_10_0 = "tjcf_word_qkds.png"
		var_10_2 = "tjcf_word_dywdjhjz.png"
	end

	arg_10_0.view.widgets.particle:setVisible(arg_10_1.win == 2)

	local var_10_3 = arg_10_1.win == 0

	arg_10_0.view.widgets.noReward:setVisible(var_10_3)
	arg_10_0.view.widgets.richLine_totalRewards:setVisible(not var_10_3)
	arg_10_0.view.widgets.myTank2:removeAllChildrenWithCleanup(true)

	if var_10_3 then
		tool.spriteToGray(arg_10_0.view.widgets.myTank2)
	else
		arg_10_0.view.widgets.totalRewards_p2:setString(tostring(arg_10_1.totalRewards[1].num))
		arg_10_0.view.widgets.richLine_totalRewards:reorder()
	end

	arg_10_0.view.widgets.title_result:setDisplayFrame(CCSprite:create("res/ui/activity/tankCharge/" .. var_10_0):displayFrame())
	arg_10_0.view.widgets.result:setDisplayFrame(CCSprite:create("res/ui/activity/tankCharge/" .. var_10_2):displayFrame())

	local var_10_4 = CCArray:create()

	if arg_10_1.win then
		var_10_4:addObject(CCDelayTime:create(0.5))
	end

	var_10_4:addObject(CCShow:create())
	var_10_4:addObject(CCDelayTime:create(3))
	var_10_4:addObject(CCCallFunc:create(function()
		arg_10_0:refresh()
	end))

	local var_10_5 = CCSequence:create(var_10_4)

	arg_10_0.view.widgets.bg_result:runAction(var_10_5)
end

function var_0_7.showEffectAttack(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_0.effectNode then
		arg_12_0.effectNode:removeAllChildrenWithCleanup(true)
	else
		arg_12_0.effectNode = CCNode:create()

		arg_12_0.view.widgets.bg:addChild(arg_12_0.effectNode, 100)
	end

	arg_12_0.view.widgets.btn_reward:setEnabled(false)

	for iter_12_0 = 1, 5 do
		arg_12_0.view.widgets["btn_tank" .. iter_12_0]:setEnabled(false)
	end

	local var_12_0, var_12_1 = arg_12_0.view.widgets["btn_tank" .. arg_12_2]:getPosition()
	local var_12_2 = CCSprite:create()

	var_12_2:setScale(0.6)
	var_12_2:setPosition(var_12_0, var_12_1)
	arg_12_0.effectNode:addChild(var_12_2)

	local var_12_3 = CCArray:create()

	for iter_12_1 = 10001, 10011 do
		local var_12_4 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("jb_start_" .. iter_12_1 .. ".png")

		if var_12_4 then
			var_12_3:addObject(var_12_4)
		end
	end

	local var_12_5 = CCAnimation:createWithSpriteFrames(var_12_3, 0.06)
	local var_12_6 = CCAnimate:create(var_12_5)

	var_12_2:runAction(var_12_6)

	local var_12_7

	if arg_12_1.size == 1 then
		var_12_7 = "tjcf_word_xkyt.png"
	elseif arg_12_1.size == 2 then
		var_12_7 = "tjcf_word_zkyt.png"
	elseif arg_12_1.size == 3 then
		var_12_7 = "tjcf_word_dkyt.png"
	elseif arg_12_1.size == 4 then
		var_12_7 = "tjcf_word_ythx.png"
	end

	local var_12_8 = CCSprite:create("res/ui/activity/tankCharge/" .. var_12_7)

	var_12_8:setPosition(var_12_0, var_12_1)
	arg_12_0.effectNode:addChild(var_12_8)

	local var_12_9 = CCArray:create()

	var_12_9:addObject(CCDelayTime:create(1))
	var_12_9:addObject(CCHide:create())

	local var_12_10 = CCSequence:create(var_12_9)

	var_12_8:runAction(var_12_10)

	local var_12_11 = CCSprite:create("res/ui/activity/feteHero/dyqx_icon_216.png")

	var_12_11:setPosition(var_12_0, var_12_1)
	arg_12_0.effectNode:addChild(var_12_11)

	local var_12_12 = CCMoveTo:create(0.5, ccp(var_12_0, var_12_1 + 100))
	local var_12_13, var_12_14 = arg_12_0.view.widgets.myTank1:getPosition()
	local var_12_15 = var_12_13 - 20
	local var_12_16 = CCMoveTo:create(0.5, ccp(var_12_15, var_12_14))
	local var_12_17 = CCFadeOut:create(0.5)
	local var_12_18 = CCFadeIn:create(0.5)
	local var_12_19 = CCArray:create()

	var_12_19:addObject(CCSpawn:createWithTwoActions(var_12_17, var_12_12))
	var_12_19:addObject(CCCallFunc:create(function()
		var_12_11:setPosition(var_12_15, var_12_14 + 100)
	end))
	var_12_19:addObject(CCSpawn:createWithTwoActions(var_12_18, var_12_16))
	var_12_19:addObject(CCHide:create())

	local var_12_20 = CCSequence:create(var_12_19)

	var_12_11:runAction(var_12_20)

	if arg_12_2 ~= 5 then
		local var_12_21 = CCArray:create()

		var_12_21:addObject(CCFadeOut:create(0.6))

		local var_12_22 = CCSequence:create(var_12_21)

		arg_12_0.view.widgets["tank" .. arg_12_2]:runAction(var_12_22)
	end

	arg_12_0.view.widgets.myTank1:stopAllActions()
	arg_12_0.view.widgets.myTank1:setPosition(250, 176)

	local var_12_23 = CCArray:create()

	var_12_23:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_12_23:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_12_23:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))

	local var_12_24 = CCSequence:create(var_12_23)
	local var_12_25 = CCArray:create()

	var_12_25:addObject(CCDelayTime:create(0.8))
	var_12_25:addObject(CCCallFunc:create(function()
		arg_12_0.info.rewardNum = arg_12_0.info.rewardNum + arg_12_1.rewards[1].num

		arg_12_0:setRewardBar()

		if arg_12_1.win == 0 then
			arg_12_0.view.widgets.broken:setVisible(true)
		end
	end))
	var_12_25:addObject(CCRepeat:create(var_12_24, 3))
	var_12_25:addObject(CCCallFunc:create(function()
		if arg_12_1.win == 0 or arg_12_1.win == 2 then
			arg_12_0:showResult(arg_12_1)
		else
			arg_12_0:refresh()
		end
	end))

	local var_12_26 = CCSequence:create(var_12_25)

	arg_12_0.view.widgets.myTank1:runAction(var_12_26)
end

function var_0_7.showTip(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_16_0:registerScriptTouchHandler(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == CCTOUCHBEGAN then
			return true
		elseif arg_17_0 == CCTOUCHMOVED then
			return true
		elseif arg_17_0 == CCTOUCHENDED then
			pcall(var_16_0.removeFromParentAndCleanup, var_16_0, true)

			return true
		end
	end, false, true)
	var_16_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_16_0, 60000)

	local var_16_1 = 0
	local var_16_2 = 0
	local var_16_3 = {}

	uiutil.initWidgets(var_16_3, arg_16_0.tipFrame)
	var_16_0:addChild(var_16_3.widgets.tipFrame)
	var_16_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

	local var_16_4, var_16_5 = tool.getPositionInScreen(arg_16_2)
	local var_16_6 = var_16_4 + 20
	local var_16_7 = var_16_5 - 20
	local var_16_8 = arg_16_1 or ""

	var_16_3.widgets.tipMsg:setString(var_16_8)

	local var_16_9 = var_16_3.widgets.tipMsg:getContentSize().width
	local var_16_10 = var_16_3.widgets.tipMsg:getContentSize().height

	var_16_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_16_9 + 30, var_16_10 + 30))
	var_16_3.widgets.tipFrame:setPosition(ccp(var_16_6, var_16_7))
	var_16_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_16_3.widgets.tipFrame:setVisible(true)
end

function var_0_7.setRewardBar(arg_18_0)
	local var_18_0
	local var_18_1 = arg_18_0.info.rewardNum <= 6 and "tjcf_s_bar_02.png" or arg_18_0.info.rewardNum <= 14 and "tjcf_s_bar_01.png" or "tjcf_s_bar_03.png"
	local var_18_2 = "res/ui/activity/tankCharge/" .. var_18_1

	if arg_18_0.pic_bar ~= var_18_2 then
		arg_18_0.view.widgets.bar2:setSprite(CCSprite:create(var_18_2))
		arg_18_0.view.widgets.bar3:setSprite(CCSprite:create(var_18_2))

		arg_18_0.pic_bar = var_18_2
	end

	local var_18_3 = 100 * arg_18_0.info.rewardNum / arg_18_0.info.rewardMax

	arg_18_0.view.widgets.bar2:setPercentage(var_18_3)
	arg_18_0.view.widgets.bar3:setPercentage(var_18_3)

	local var_18_4 = language.get(213297, arg_18_0.info.rewardNum, arg_18_0.info.rewardMax)

	arg_18_0.view.widgets.rewardNum1:setString(var_18_4)
	arg_18_0.view.widgets.rewardNum2:setString(var_18_4)
end

function var_0_7.showPanel(arg_19_0, arg_19_1)
	arg_19_0.info = arg_19_1

	local var_19_0 = arg_19_1.canAttack
	local var_19_1 = arg_19_1.guide

	arg_19_0.view.widgets.bar1:setPercentage(100 * arg_19_1.killNum / arg_19_1.maxKillNum)
	arg_19_0.view.widgets.killNum:setString(language.get(213297, arg_19_1.killNum, arg_19_1.maxKillNum))

	local var_19_2 = arg_19_1.haveFreeReward == true

	arg_19_0.view.widgets.finish_buff:setVisible(var_19_2)
	arg_19_0.view.widgets.icon_buff:removeAllChildrenWithCleanup(true)
	arg_19_0.view.widgets.light_buff:setVisible(false)
	arg_19_0.view.widgets.btn_buff:setEnabled(not var_19_2)

	if var_19_2 then
		tool.spriteToGray(arg_19_0.view.widgets.icon_buff)
	elseif arg_19_1.killNum < arg_19_1.maxKillNum then
		tool.spriteToGray(arg_19_0.view.widgets.icon_buff)
	else
		arg_19_0.view.widgets.light_buff:setVisible(true)
	end

	arg_19_0.view.widgets.arrow:setVisible(var_19_0 and var_19_1)
	arg_19_0.view.widgets.myTank1:setVisible(not not var_19_0 or not var_19_1)
	arg_19_0.view.widgets.myTank1:stopAllActions()
	arg_19_0.view.widgets.myTank1:setPosition(250, 176)
	arg_19_0.view.widgets.broken:setVisible(false)

	for iter_19_0, iter_19_1 in ipairs(arg_19_1.tanks) do
		arg_19_0.view.widgets["btn_tank" .. iter_19_0]:setVisible(iter_19_1.live)
		arg_19_0.view.widgets["btn_tank" .. iter_19_0]:setEnabled(var_19_0)
		arg_19_0.view.widgets["tank" .. iter_19_0]:stopAllActions()
		arg_19_0.view.widgets["tank" .. iter_19_0]:setOpacity(255)

		if iter_19_1.gold > 0 then
			local var_19_3 = not not var_19_0 or not var_19_1

			arg_19_0.view.widgets["btn_tank" .. iter_19_0]:setVisible(var_19_3)
			arg_19_0.view.widgets.bg_tankGold:setVisible(var_19_3)

			if var_19_3 then
				arg_19_0.view.widgets.tankGold:setString(iter_19_1.gold)
			end
		end
	end

	arg_19_0.view.widgets.bg_bar2:setVisible(var_19_0)
	arg_19_0.view.widgets.btn_reward:setVisible(var_19_0 and arg_19_1.rewardNum > 0)
	arg_19_0.view.widgets.btn_reward:setEnabled(true)
	arg_19_0.view.widgets.btn_attack:setVisible(not var_19_0)
	arg_19_0.view.widgets.special20:setVisible(arg_19_1.special20 == true)

	if var_19_0 then
		arg_19_0:setRewardBar()
		arg_19_0.view.widgets.warning:setVisible(arg_19_1.rewardNum > 6)
	else
		local var_19_4 = arg_19_1.freeTimes > 0

		arg_19_0.view.widgets.icon_buyTimes:setVisible(not var_19_4)
		arg_19_0.view.widgets.buyTimesGold:setString(var_19_4 and language.get(136204, arg_19_1.freeTimes) or arg_19_1.buyTimes)
		arg_19_0.view.widgets.buyTimesGold:setPositionY(var_19_4 and 25 or 15)
	end

	arg_19_0.view.widgets.bg_result:stopAllActions()
	arg_19_0.view.widgets.bg_result:setVisible(false)

	if arg_19_0.showGuide then
		arg_19_0.view.widgets.arrow:setVisible(false)
		arg_19_0.view.widgets.bg_tankGold:setVisible(false)
		arg_19_0.view.widgets.bg_bar2:setVisible(false)

		for iter_19_2 = 1, 5 do
			arg_19_0.view.widgets["btn_tank" .. iter_19_2]:setEnabled(false)
		end

		arg_19_0.view.widgets.myTank1:setPosition(-98, -8)

		local var_19_5 = CCArray:create()

		var_19_5:addObject(CCMoveTo:create(0.8, ccp(250, 176)))
		var_19_5:addObject(CCCallFunc:create(function()
			return
		end))

		local var_19_6 = CCSequence:create(var_19_5)

		arg_19_0.view.widgets.myTank1:runAction(var_19_6)
		arg_19_0.view.widgets.btn_tank5:setPosition(998, 264)

		local var_19_7 = CCArray:create()

		var_19_7:addObject(CCMoveTo:create(0.8, ccp(724, 120)))
		var_19_7:addObject(CCCallFunc:create(function()
			arg_19_0.view.widgets.arrow:setVisible(true)
			arg_19_0.view.widgets.bg_tankGold:setVisible(true)
			arg_19_0.view.widgets.bg_bar2:setVisible(true)

			for iter_21_0 = 1, 5 do
				arg_19_0.view.widgets["btn_tank" .. iter_21_0]:setEnabled(true)
			end
		end))

		local var_19_8 = CCSequence:create(var_19_7)

		arg_19_0.view.widgets.btn_tank5:runAction(var_19_8)
	end

	arg_19_0.showGuide = false
end

function var_0_7.ctor(arg_22_0, arg_22_1, arg_22_2)
	log.info("@@ 铁甲冲锋活动")
	rmgr.loadResource("res/ui/juben/jbStart.plist")

	arg_22_0.view = {}

	uiutil.initWidgets(arg_22_0.view, arg_22_0.layout)

	arg_22_0.leftTime = arg_22_0.view.widgets.leftTime

	if arg_22_1 then
		arg_22_0:addChild(arg_22_0.view.widgets.root)
		arg_22_1:addChild(arg_22_0)
	end

	arg_22_0.view.widgets.scrollview:setTouchEnabled(false)

	local var_22_0 = rmgr.getArmy("att", "51_car").idle
	local var_22_1 = tolua.cast(var_22_0:objectAtIndex(0), "CCSpriteFrame")

	arg_22_0.view.widgets.myTank1:setDisplayFrame(var_22_1)
	arg_22_0.view.widgets.myTank2:setDisplayFrame(var_22_1)
	arg_22_0.view.widgets.icon_buff:setDisplayFrame(var_22_1)

	local var_22_2 = CCParticleSystemQuad:create("res/ui/activity/tankCharge/star.plist")

	arg_22_0.view.widgets.bg_bar3:addChild(var_22_2)

	local var_22_3 = CCArray:create()

	var_22_3:addObject(CCMoveTo:create(0.6, ccp(210, 0)))
	var_22_3:addObject(CCMoveTo:create(0.2, ccp(210, 24)))
	var_22_3:addObject(CCMoveTo:create(0.6, ccp(0, 24)))
	var_22_3:addObject(CCMoveTo:create(0.2, ccp(0, 0)))

	local var_22_4 = CCSequence:create(var_22_3)
	local var_22_5 = CCRepeatForever:create(var_22_4)

	var_22_2:runAction(tolua.cast(var_22_5:copy(), "CCAction"))
	var_22_2:setVisible(false)

	arg_22_0.view.widgets.particle = var_22_2

	local var_22_6 = CCArray:create()

	var_22_6:addObject(CCEaseOut:create(CCMoveBy:create(0.5, ccp(0, 30)), 1))
	var_22_6:addObject(CCEaseIn:create(CCMoveBy:create(0.5, ccp(0, -30)), 1))

	local var_22_7 = CCSequence:create(var_22_6)

	arg_22_0.view.widgets.arrow:runAction(CCRepeatForever:create(var_22_7))

	local var_22_8 = CCArray:create()

	var_22_8:addObject(CCScaleTo:create(0.3, 1.5))
	var_22_8:addObject(CCScaleTo:create(0.7, 1))

	local var_22_9 = CCSequence:create(var_22_8)

	arg_22_0.view.widgets.light_buff:runAction(CCRepeatForever:create(var_22_9))
	arg_22_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_22_0:showTip(language.get(217205), arg_22_0.view.widgets.btn_tip)
	end, CCControlEventTouchUpInside)
	arg_22_0.view.widgets.btn_buff:addHandleOfControlEvent(function()
		log.info("btn_buff")

		if arg_22_0.info.killNum < arg_22_0.info.maxKillNum then
			arg_22_0:showTip(language.get(217203), arg_22_0.view.widgets.btn_buff)
		else
			arg_22_0:onGetFreeTimes()
		end
	end, CCControlEventTouchUpInside)
	arg_22_0.view.widgets.btn_attack:addHandleOfControlEvent(function()
		log.info("btn_attack")
		arg_22_0:onGetTankChargeReward(0)
	end, CCControlEventTouchUpInside)

	for iter_22_0 = 1, 5 do
		arg_22_0.view.widgets["btn_tank" .. iter_22_0]:addHandleOfControlEvent(function()
			log.info("btn_tank" .. iter_22_0)
			arg_22_0:onGetTankChargeReward(1, iter_22_0)
		end, CCControlEventTouchUpInside)
	end

	arg_22_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_22_0:onGetTankChargeReward(2)
	end, CCControlEventTouchUpInside)
	arg_22_0.view.widgets.btn_result:addHandleOfControlEvent(function()
		log.info("btn_result")
		arg_22_0:refresh()
	end, CCControlEventTouchUpInside)
	arg_22_0:showPanel(arg_22_2)
end

return var_0_7
