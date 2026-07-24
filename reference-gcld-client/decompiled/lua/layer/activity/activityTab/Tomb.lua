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
	}
}
local var_0_1 = colorQuality[0]
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = colorQuality[3]
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = colorQuality[6]
local var_0_8 = {
	{
		txt = 136481,
		pic = "qmjb_chicken_01.png",
		color = var_0_6
	},
	{
		txt = 136482,
		pic = "qmjb_chicken_02.png",
		color = var_0_3
	},
	{
		txt = 136483,
		pic = "qmjb_chicken_03.png",
		color = var_0_5
	},
	{
		txt = 136484,
		pic = "qmjb_chicken_04.png",
		color = var_0_4
	},
	{
		txt = 136485,
		pic = "qmjb_chicken_05.png",
		color = var_0_7
	}
}
local var_0_9 = class("Tomb", function()
	return createBaseLayer()
end)

var_0_9.layout = {
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
					y = 485,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/tomb/qmjb_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 480,
					type = "label",
					x = 710,
					color = var_0_4
				},
				{
					name = "btn_tip",
					style = "button_tip",
					h = 42,
					type = "button",
					w = 42,
					y = 485,
					x = 860
				},
				{
					type = "sprite",
					name = "bg_feed",
					y = 238,
					visible = false,
					x = 457.5,
					pic = {
						path = "res/ui/activity/tomb/qmjb_bg1.jpg"
					}
				},
				{
					type = "sprite",
					name = "bg_worship",
					y = 238,
					visible = false,
					x = 457.5,
					pic = {
						path = "res/ui/activity/tomb/qmjb_bg2.jpg"
					}
				},
				{
					y = 442,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_line.png"
					}
				},
				{
					y = 34,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_line.png"
					}
				},
				{
					type = "node",
					name = "node_feed",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							fontSize = 50,
							name = "wait",
							type = "label",
							visible = false,
							y = 238,
							x = 458,
							textId = 136463,
							color = var_0_4
						},
						{
							zoomOnTouchDown = true,
							name = "btn_treasure",
							h = 118,
							type = "button",
							w = 82,
							y = 383,
							visible = false,
							x = 874,
							normal = {
								path = "res/ui/activity/tomb/qmjb_icon_di.png"
							},
							touched = {
								path = "res/ui/activity/tomb/qmjb_icon_di.png"
							},
							children = {
								{
									y = 78,
									x = 40,
									type = "sprite",
									pic = {
										frame = true,
										path = "longdechuanren.jpg"
									}
								},
								{
									fontSize = 28,
									name = "finishTimes",
									y = 22,
									type = "label",
									x = 40,
									color = var_0_5
								}
							}
						},
						{
							type = "node",
							name = "node_cock",
							y = 0,
							visible = false,
							x = 0,
							children = {}
						},
						{
							y = 420,
							name = "bg_info",
							type = "sprite",
							x = 3,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/tomb/qmjb_word_di.png"
							},
							children = {
								{
									type = "richLine",
									name = "richLine_info",
									y = 27,
									visible = false,
									anchorPointX = 0,
									gap = -20,
									x = 5,
									content = {
										{
											fontSize = 25,
											name = "info1",
											y = 0,
											type = "label",
											x = 0,
											color = var_0_2,
											anchorPoint = ccp(0, 0.5)
										},
										{
											zoomOnTouchDown = true,
											name = "btn_goWorship",
											h = 62,
											type = "button",
											w = 195,
											y = 0,
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
													fontSize = 25,
													name = "lbl_goWorship",
													y = 0,
													type = "label",
													x = 0,
													textId = 136486,
													color = ccc3(0, 255, 0)
												}
											}
										}
									}
								},
								{
									fontSize = 25,
									name = "info2",
									y = -12,
									type = "label",
									x = 5,
									textId = 136487,
									color = var_0_2,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_worship",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 343,
							name = "npc1",
							type = "sprite",
							x = 331,
							pic = {
								path = "res/ui/activity/tomb/qmjb_rx_01.jpg"
							}
						},
						{
							y = 343,
							name = "npc2",
							type = "sprite",
							x = 459,
							pic = {
								path = "res/ui/activity/tomb/qmjb_rx_02.jpg"
							}
						},
						{
							y = 343,
							name = "npc3",
							type = "sprite",
							x = 587,
							pic = {
								path = "res/ui/activity/tomb/qmjb_rx_03.jpg"
							}
						},
						{
							y = 343,
							name = "light",
							type = "sprite",
							x = 331,
							pic = {
								path = "res/ui/activity/tomb/qmjb_rx_light.png"
							}
						},
						{
							type = "sprite9",
							y = 110,
							rotate = 90,
							x = 460,
							preferedSize = CCSizeMake(220, 260),
							middleRect = CCRectMake(110, 16, 2, 2),
							pic = {
								path = "res/ui/buildEvent/jzcl_wjm_di.png"
							}
						},
						{
							name = "btn_worship",
							h = 62,
							type = "button",
							w = 195,
							y = 64,
							x = 460,
							normal = {
								path = "res/ui/common/button/public_btn_red.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_red_c.png"
							},
							disable = {
								path = "res/ui/common/button/public_btn_red_g.png"
							},
							children = {
								{
									fontSize = 25,
									y = 34,
									type = "label",
									x = 97,
									textId = 136491,
									color = var_0_2
								},
								{
									fontSize = 22,
									name = "curr_name",
									type = "label",
									visible = false,
									y = 60,
									x = 97
								},
								{
									fontSize = 22,
									name = "worshipTimes",
									type = "label",
									visible = false,
									y = 56,
									x = 150,
									color = var_0_5,
									anchorPoint = ccp(0, 0.5)
								},
								{
									type = "sprite",
									name = "icon_gold",
									x = 204,
									visible = false,
									y = 46,
									scale = 0.7,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "worshipGold",
									type = "label",
									visible = false,
									y = 22,
									x = 204,
									color = var_0_5
								}
							}
						},
						{
							fontSize = 30,
							name = "curr_weight",
							y = 130,
							type = "label",
							x = 460,
							color = var_0_5
						},
						{
							x = 0,
							height = 440,
							name = "layer_box",
							type = "layerColor",
							y = 0,
							zorder = 100,
							visible = false,
							width = 915,
							color = ccc4(0, 0, 0, 0),
							children = {
								{
									type = "sprite",
									name = "light_box",
									x = 458,
									visible = false,
									y = 360,
									scale = 1.3,
									pic = {
										path = "res/ui/activity/fishing/hjcd_box_02.png"
									}
								},
								{
									name = "btn_box",
									h = 201,
									type = "button",
									w = 187,
									x = 0,
									y = 0,
									visible = false,
									scale = 1.3,
									normal = {
										path = "res/ui/activity/fishing/hjcd_box_02.png"
									},
									touched = {
										path = "res/ui/activity/fishing/hjcd_box_02.png"
									},
									disable = {
										path = "res/ui/activity/fishing/hjcd_box_02_c.png"
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
var_0_9.tipFrame = {
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
			textId = 136462,
			width = 600,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_2
		}
	}
}

function var_0_9.getSingleCock(arg_2_0, arg_2_1)
	local var_2_0 = {
		{
			140,
			130
		},
		{
			300,
			240
		},
		{
			460,
			130
		},
		{
			620,
			240
		},
		{
			780,
			130
		}
	}

	return {
		type = "node",
		name = "node" .. arg_2_1,
		x = var_2_0[arg_2_1][1],
		y = var_2_0[arg_2_1][2],
		children = {
			{
				type = "sprite",
				y = 80,
				visible = false,
				x = 0,
				name = "cockGray" .. arg_2_1,
				pic = {
					path = "res/ui/activity/tomb/qmjb_chicken_s.png"
				}
			},
			{
				type = "sprite",
				y = 81,
				visible = false,
				x = -3,
				name = "cock" .. arg_2_1,
				pic = {
					path = "res/ui/activity/tomb/" .. var_0_8[arg_2_1].pic
				}
			},
			{
				y = 0,
				h = 62,
				type = "button",
				w = 195,
				visible = false,
				x = 0,
				name = "btn_feed" .. arg_2_1,
				normal = {
					path = "res/ui/common/button/public_btn_green.png"
				},
				touched = {
					path = "res/ui/common/button/public_btn_green_c.png"
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
								y = 50,
								x = 42,
								type = "sprite",
								scale = 0.8,
								pic = {
									path = "res/ui/task/get_icon_food.png"
								}
							},
							{
								fontSize = 22,
								y = 40,
								type = "label",
								x = 42,
								color = var_0_2,
								name = "food" .. arg_2_1
							},
							{
								fontSize = 22,
								y = 12,
								type = "label",
								x = 42,
								color = var_0_8[arg_2_1].color,
								textId = var_0_8[arg_2_1].txt
							}
						}
					},
					{
						fontSize = 25,
						y = 34,
						type = "label",
						x = 125,
						textId = 136489,
						color = var_0_2
					}
				}
			},
			{
				h = 62,
				type = "button",
				w = 195,
				y = 0,
				visible = false,
				x = 0,
				name = "btn_att" .. arg_2_1,
				normal = {
					path = "res/ui/common/button/public_btn_orange.png"
				},
				touched = {
					path = "res/ui/common/button/public_btn_orange_c.png"
				},
				disable = {
					path = "res/ui/common/button/public_btn_orange.png"
				},
				children = {
					{
						y = 82,
						x = 150,
						type = "node",
						scale = 1.2,
						children = {
							{
								zoomOnTouchDown = true,
								h = 48,
								type = "button",
								w = 42,
								y = 0,
								x = 0,
								name = "btn_lock" .. arg_2_1,
								normal = {
									path = "res/ui/activity/tomb/qmjb_lock_c.png"
								},
								touched = {
									path = "res/ui/activity/tomb/qmjb_lock.png"
								},
								disable = {
									path = "res/ui/activity/tomb/qmjb_lock_g.png"
								}
							}
						}
					},
					{
						fontSize = 25,
						y = 34,
						type = "label",
						x = 97,
						color = var_0_8[arg_2_1].color,
						textId = var_0_8[arg_2_1].txt,
						name = "name" .. arg_2_1
					}
				}
			},
			{
				y = -55,
				type = "sprite",
				x = 0,
				pic = {
					path = "res/ui/activity/tomb/qmjb_word_di2.png"
				},
				children = {
					{
						fontSize = 22,
						y = 50,
						type = "label",
						x = 70,
						color = var_0_2,
						name = "infoA" .. arg_2_1
					},
					{
						fontSize = 22,
						y = 21,
						type = "label",
						x = 70,
						color = var_0_2,
						name = "infoB" .. arg_2_1
					}
				}
			},
			{
				fontSize = 22,
				type = "label",
				visible = false,
				y = 80,
				x = 0,
				color = ccc3(255, 0, 0),
				name = "timer" .. arg_2_1
			}
		}
	}
end

function var_0_9.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getTombActivity)
end

function var_0_9.onUpgradePig(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		arg_5_0:showEffectGrow(arg_5_1)
	end

	local var_5_1 = arg_5_0.info.pigs[arg_5_1].gold

	messageBox.confirm(language.get(136473, var_5_1), function()
		cmgr.sendRequest(var_5_0, actions.upgradePig)
	end)
end

function var_0_9.onFeedPig(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		arg_8_0:showEffectFeed(arg_8_1)
	end

	cmgr.sendRequest(var_8_0, actions.feedPig, arg_8_1)
end

function var_0_9.onBtnWorshipTap(arg_10_0)
	local function var_10_0(arg_11_0)
		local var_11_0 = arg_11_0.action.data

		if var_11_0.type == 1 or var_11_0.type == 2 or var_11_0.type == 3 then
			arg_10_0:showEffectBox(var_11_0)
		else
			local var_11_1 = {}

			for iter_11_0, iter_11_1 in ipairs(var_11_0.rewards) do
				local var_11_2 = {
					id = var_0_0[iter_11_1.type].type,
					value = iter_11_1.value
				}

				table.insert(var_11_1, var_11_2)
			end

			if var_11_0.id then
				local var_11_3 = {}

				var_11_3.id = 10021
				var_11_3.value = 1

				table.insert(var_11_1, var_11_3)
			end

			globalAction_gotResource(var_11_1)
			arg_10_0:refresh()
		end
	end

	local var_10_1
	local var_10_2 = arg_10_0.info.worshipTimes > 0 and 1 or 2

	local function var_10_3()
		cmgr.sendRequest(var_10_0, actions.getTombReward, var_10_2)
	end

	if var_10_2 == 2 and arg_10_0.info.freeTimes == 0 then
		messageBox.confirm(language.get(136466, arg_10_0.info.worshipGold), function()
			var_10_3()
		end)
	else
		var_10_3()
	end
end

function var_0_9.goWorship(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0:refresh()
	end

	cmgr.sendRequest(var_14_0, actions.goWorship)
end

function var_0_9.showEffectGrow(arg_16_0, arg_16_1)
	arg_16_0.view.widgets["cockGray" .. arg_16_1]:setVisible(false)
	arg_16_0.view.widgets["cock" .. arg_16_1]:setVisible(true)
	arg_16_0.view.widgets["cock" .. arg_16_1]:setScale(0.7)
	arg_16_0.view.widgets["cock" .. arg_16_1]:stopAllActions()

	local var_16_0 = CCArray:create()

	var_16_0:addObject(CCEaseSineOut:create(CCScaleTo:create(0.5, 1)))
	var_16_0:addObject(CCCallFunc:create(function()
		arg_16_0:refresh()
	end))

	local var_16_1 = CCSequence:create(var_16_0)

	arg_16_0.view.widgets["cock" .. arg_16_1]:runAction(var_16_1)
end

function var_0_9.showEffectFeed(arg_18_0, arg_18_1)
	if arg_18_0.foodNode then
		arg_18_0.foodNode:removeAllChildrenWithCleanup(true)
	else
		arg_18_0.foodNode = CCSpriteBatchNode:create("res/ui/task/get_icon_food.png")

		arg_18_0.view.widgets.node_feed:addChild(arg_18_0.foodNode)
	end

	local var_18_0, var_18_1 = arg_18_0.view.widgets["node" .. arg_18_1]:getPosition()
	local var_18_2 = {
		{
			-70,
			150
		},
		{
			70,
			150
		},
		{
			-120,
			90
		},
		{
			120,
			90
		},
		{
			-140,
			0
		},
		{
			140,
			0
		}
	}

	for iter_18_0 = 1, 6 do
		local var_18_3 = CCSprite:create("res/ui/task/get_icon_food.png")

		var_18_3:setScale(0.8)
		var_18_3:setPosition(var_18_0 + var_18_2[iter_18_0][1], var_18_1 + var_18_2[iter_18_0][2])
		arg_18_0.foodNode:addChild(var_18_3)

		local var_18_4 = CCArray:create()
		local var_18_5 = CCEaseSineOut:create(CCMoveTo:create(0.5, ccp(var_18_0, var_18_1)))
		local var_18_6 = CCFadeOut:create(0.6)

		var_18_4:addObject(CCSpawn:createWithTwoActions(var_18_5, var_18_6))

		if iter_18_0 == 6 then
			var_18_4:addObject(CCCallFunc:create(function()
				arg_18_0:refresh()
			end))
		end

		local var_18_7 = CCSequence:create(var_18_4)

		var_18_3:runAction(var_18_7)
	end
end

function var_0_9.showEffectBox(arg_20_0, arg_20_1)
	arg_20_0.view.widgets.layer_box:setVisible(true)
	roleDialogue.control.loadSpeak(1584)

	local var_20_0

	if arg_20_1.type == 1 then
		var_20_0 = "qmjb_reward_word_xycy.png"
	elseif arg_20_1.type == 2 then
		var_20_0 = "qmjb_reward_word_ybqc.png"
	elseif arg_20_1.type == 3 then
		var_20_0 = "qmjb_reward_word_gtdd.png"
	end

	local var_20_1 = CCSprite:create("res/ui/activity/tomb/" .. var_20_0)

	var_20_1:setScale(1.3)
	var_20_1:setPosition(458, 310)
	arg_20_0.view.widgets.layer_box:addChild(var_20_1)

	local var_20_2 = CCArray:create()
	local var_20_3 = CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(0, 100)))
	local var_20_4 = CCFadeOut:create(0.6)

	var_20_2:addObject(CCDelayTime:create(0.5))
	var_20_2:addObject(CCSpawn:createWithTwoActions(var_20_3, var_20_4))
	var_20_2:addObject(CCCallFunc:create(function()
		var_20_1:removeFromParentAndCleanup(true)
	end))

	local var_20_5 = CCSequence:create(var_20_2)

	var_20_1:runAction(var_20_5)
	arg_20_0.view.widgets.light_box:setVisible(false)
	arg_20_0.view.widgets.btn_box:setEnabled(true)
	arg_20_0.view.widgets.btn_box:setVisible(false)
	arg_20_0.view.widgets.btn_box:setPosition(458, 230)
	arg_20_0.view.widgets.btn_box:stopAllActions()

	local var_20_6 = CCArray:create()

	var_20_6:addObject(CCDelayTime:create(1.2))
	var_20_6:addObject(CCShow:create())
	var_20_6:addObject(CCEaseSineOut:create(CCMoveBy:create(0.5, ccp(0, 130))))
	var_20_6:addObject(CCCallFunc:create(function()
		arg_20_0.view.widgets.light_box:setVisible(true)
	end))

	local var_20_7 = CCSequence:create(var_20_6)

	arg_20_0.view.widgets.btn_box:runAction(var_20_7)
	arg_20_0.view.widgets.btn_box:addHandleOfControlEvent(function()
		log.info("btn_box")
		arg_20_0.view.widgets.light_box:setVisible(false)
		arg_20_0.view.widgets.btn_box:setEnabled(false)

		local var_23_0 = {}

		for iter_23_0, iter_23_1 in ipairs(arg_20_1.rewards) do
			local var_23_1 = {
				id = var_0_0[iter_23_1.type].type,
				value = iter_23_1.value
			}

			table.insert(var_23_0, var_23_1)
		end

		if arg_20_1.id then
			local var_23_2 = {}

			var_23_2.id = 10021
			var_23_2.value = 1

			table.insert(var_23_0, var_23_2)
		end

		globalAction_gotResource(var_23_0)
		schedule(arg_20_0.view.widgets.btn_box, function()
			arg_20_0:refresh()
		end, 0.8)
	end, CCControlEventTouchUpInside)
end

function var_0_9.showTip(arg_25_0)
	log.info("should show tips ")

	local var_25_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_25_0:registerScriptTouchHandler(function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 == CCTOUCHBEGAN then
			return true
		elseif arg_26_0 == CCTOUCHMOVED then
			return true
		elseif arg_26_0 == CCTOUCHENDED then
			pcall(var_25_0.removeFromParentAndCleanup, var_25_0, true)

			return true
		end
	end, false, true)
	var_25_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_25_0, 60000)

	local var_25_1 = 0
	local var_25_2 = 0
	local var_25_3 = {}

	uiutil.initWidgets(var_25_3, arg_25_0.tipFrame)
	var_25_0:addChild(var_25_3.widgets.tipFrame)

	local var_25_4 = arg_25_0.view.widgets.btn_tip
	local var_25_5, var_25_6 = tool.getPositionInScreen(var_25_4)
	local var_25_7 = var_25_5 + 20
	local var_25_8 = var_25_6 - 20
	local var_25_9 = var_25_3.widgets.tipMsg:getContentSize().width
	local var_25_10 = var_25_3.widgets.tipMsg:getContentSize().height

	var_25_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_25_9 + 30, var_25_10 + 30))
	var_25_3.widgets.tipFrame:setPosition(ccp(var_25_7, var_25_8))
	var_25_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_25_3.widgets.tipFrame:setVisible(true)
end

function var_0_9.showTipTreasure(arg_27_0)
	log.info("should show tips ")

	local var_27_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_27_0:registerScriptTouchHandler(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == CCTOUCHBEGAN then
			return true
		elseif arg_28_0 == CCTOUCHMOVED then
			return true
		elseif arg_28_0 == CCTOUCHENDED then
			pcall(var_27_0.removeFromParentAndCleanup, var_27_0, true)

			return true
		end
	end, false, true)
	var_27_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_27_0, 60000)

	local var_27_1 = 0
	local var_27_2 = 0
	local var_27_3 = {}
	local var_27_4 = {
		name = "tipFrame",
		frameGapVertical = 15,
		type = "sprite9Tips",
		frameGapHorizontal = 15,
		lineGap = 5,
		visible = false,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(1, 0.5),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		content = {
			{
				fontSize = 25,
				style = "label_warlock",
				type = "label",
				textId = 136455,
				color = var_0_7
			},
			{
				fontSize = 20,
				style = "label_warlock",
				type = "label",
				text = language.get(75041, 28, 28),
				color = var_0_2
			},
			{
				y = 224,
				name = "plate1",
				type = "sprite",
				x = 460,
				pic = {
					path = "res/ui/playerInfo/vip_tequan_line.png"
				}
			},
			{
				fontSize = 20,
				style = "label_warlock",
				type = "label",
				text = language.get(136456, arg_27_0.info.finishTimes),
				color = var_0_2,
				halign = kCCTextAlignmentLeft
			}
		}
	}

	uiutil.initWidgets(var_27_3, var_27_4)
	var_27_0:addChild(var_27_3.widgets.tipFrame)

	local var_27_5 = arg_27_0.view.widgets.btn_treasure
	local var_27_6, var_27_7 = tool.getPositionInScreen(var_27_5)
	local var_27_8 = var_27_6 - 50
	local var_27_9 = var_27_7

	var_27_3.widgets.tipFrame:setPosition(ccp(var_27_8, var_27_9))
	var_27_3.widgets.tipFrame:setVisible(true)
end

function var_0_9.addPlate(arg_29_0, arg_29_1)
	if arg_29_0.plateNode then
		arg_29_0.plateNode:removeAllChildrenWithCleanup(true)
	else
		arg_29_0.plateNode = CCSpriteBatchNode:create("res/ui/activity/tomb/qmjb_chicken_cooked.png")

		arg_29_0.plateNode:setPosition(460, 224)
		arg_29_0.view.widgets.node_worship:addChild(arg_29_0.plateNode)
	end

	local var_29_0 = {
		{
			{
				0,
				0
			}
		},
		{
			{
				-50,
				0
			},
			{
				50,
				0
			}
		},
		{
			{
				-105,
				0
			},
			{
				105,
				0
			},
			{
				0,
				0
			}
		},
		{
			{
				-105,
				0
			},
			{
				105,
				0
			},
			{
				35,
				0
			},
			{
				-35,
				0
			}
		},
		{
			{
				-105,
				0
			},
			{
				105,
				0
			},
			{
				0,
				0
			},
			{
				-50,
				15
			},
			{
				50,
				15
			}
		}
	}

	for iter_29_0 = 1, arg_29_1 do
		local var_29_1 = CCSprite:create("res/ui/activity/tomb/qmjb_chicken_cooked.png")

		var_29_1:setPosition(var_29_0[arg_29_1][iter_29_0][1], var_29_0[arg_29_1][iter_29_0][2])
		arg_29_0.plateNode:addChild(var_29_1)
	end
end

function var_0_9.showPanel(arg_30_0, arg_30_1)
	arg_30_0.info = arg_30_1

	table.sort(arg_30_1.pigs, function(arg_31_0, arg_31_1)
		return arg_31_0.id < arg_31_1.id
	end)
	table.sort(arg_30_1.fathers, function(arg_32_0, arg_32_1)
		return arg_32_0.id < arg_32_1.id
	end)

	for iter_30_0, iter_30_1 in ipairs(arg_30_1.pigs) do
		iter_30_1.weight = iter_30_1.weight / 10
		iter_30_1.maxWeight = iter_30_1.maxWeight / 10
	end

	local var_30_0 = arg_30_1.status == 0
	local var_30_1 = arg_30_1.status == 1
	local var_30_2 = arg_30_1.status == 2

	arg_30_0.view.widgets.bg_feed:setVisible(var_30_0 or var_30_1)
	arg_30_0.view.widgets.node_feed:setVisible(var_30_0 or var_30_1)
	arg_30_0.view.widgets.bg_worship:setVisible(var_30_2)
	arg_30_0.view.widgets.node_worship:setVisible(var_30_2)

	if var_30_0 or var_30_1 then
		arg_30_0.view.widgets.wait:setVisible(var_30_0)
		arg_30_0.view.widgets.richLine_info:setVisible(var_30_1)
		arg_30_0.view.widgets.info2:setVisible(false)
		arg_30_0.view.widgets.node_cock:setVisible(var_30_1)
		arg_30_0.view.widgets.btn_treasure:setVisible(var_30_1)

		if var_30_1 then
			local var_30_3 = arg_30_1.canWorship == 1

			arg_30_0.view.widgets.btn_goWorship:setVisible(var_30_3)
			arg_30_0.view.widgets.info2:setVisible(var_30_3)

			local var_30_4
			local var_30_5 = var_30_3 and (arg_30_1.totalWorshipTimes > 0 and 136480 or 136478) or 136472

			arg_30_0.view.widgets.info1:setString(language.get(var_30_5))
			arg_30_0.view.widgets.richLine_info:reorder()
			arg_30_0.view.widgets.finishTimes:setString(language.get(136454, arg_30_1.finishTimes))

			local var_30_6 = 0

			for iter_30_2, iter_30_3 in ipairs(arg_30_1.pigs) do
				arg_30_0.view.widgets["btn_feed" .. iter_30_2]:setVisible(false)
				arg_30_0.view.widgets["btn_att" .. iter_30_2]:setVisible(false)
				arg_30_0.view.widgets["btn_lock" .. iter_30_2]:setVisible(false)
				arg_30_0.view.widgets["cockGray" .. iter_30_2]:setVisible(false)
				arg_30_0.view.widgets["cock" .. iter_30_2]:setVisible(false)
				arg_30_0.view.widgets["timer" .. iter_30_2]:setVisible(false)
				arg_30_0.view.widgets["timer" .. iter_30_2]:stopAllActions()

				if var_30_6 == 0 and iter_30_3.state == 0 then
					var_30_6 = iter_30_2
				end

				local var_30_7
				local var_30_8

				if iter_30_3.state == 0 then
					arg_30_0.view.widgets["btn_att" .. iter_30_2]:setVisible(true)
					arg_30_0.view.widgets["btn_att" .. iter_30_2]:setEnabled(true)
					arg_30_0.view.widgets["btn_lock" .. iter_30_2]:setVisible(true)
					arg_30_0.view.widgets["btn_lock" .. iter_30_2]:setEnabled(var_30_6 == iter_30_2)
					arg_30_0.view.widgets["cockGray" .. iter_30_2]:setVisible(true)

					var_30_7 = language.get(136475)
					var_30_8 = language.get(136469, iter_30_3.addTimes)
				elseif iter_30_3.state == 1 then
					arg_30_0.view.widgets["cock" .. iter_30_2]:setVisible(true)
					arg_30_0.view.widgets["cock" .. iter_30_2]:setScale(iter_30_3.weight >= iter_30_3.maxWeight and 1 or 0.7)

					if iter_30_3.ifFeed == 0 then
						arg_30_0.view.widgets["btn_feed" .. iter_30_2]:setVisible(true)
						arg_30_0.view.widgets["food" .. iter_30_2]:setString(tool.getFormatNum(iter_30_3.food))
					elseif iter_30_3.ifFeed == 1 then
						arg_30_0.view.widgets["btn_att" .. iter_30_2]:setVisible(true)
						arg_30_0.view.widgets["btn_att" .. iter_30_2]:setEnabled(false)
					end

					if iter_30_3.weight >= iter_30_3.maxWeight then
						var_30_7 = language.get(136451)
						var_30_8 = language.get(136452, iter_30_3.maxWeight)
					else
						var_30_7 = language.get(136476, iter_30_3.weight)
						var_30_8 = language.get(136477, iter_30_3.maxWeight)
					end

					if iter_30_3.growCd > 0 then
						local var_30_9 = CCArray:create()

						var_30_9:addObject(CCCallFuncN:create(function()
							if iter_30_3.growCd <= 0 then
								arg_30_0.view.widgets["timer" .. iter_30_2]:stopAllActions()
								arg_30_0.view.widgets["timer" .. iter_30_2]:setVisible(false)
								arg_30_0:showEffectGrow(iter_30_2)
							else
								arg_30_0.view.widgets["timer" .. iter_30_2]:setString(tool.getFormatTime(iter_30_3.growCd))
							end

							iter_30_3.growCd = iter_30_3.growCd - 500
						end))
						var_30_9:addObject(CCDelayTime:create(0.5))

						local var_30_10 = CCSequence:create(var_30_9)

						arg_30_0.view.widgets["timer" .. iter_30_2]:runAction(CCRepeatForever:create(var_30_10))
						arg_30_0.view.widgets["timer" .. iter_30_2]:setVisible(true)
					end

					if iter_30_3.ifShow == 1 then
						local var_30_11 = CCSprite:create("res/ui/activity/tomb/qmjb_world_icon_xiaoji.jpg")
						local var_30_12, var_30_13 = tool.getPositionInScreen(arg_30_0.view.widgets["cock" .. iter_30_2])

						var_30_11:setPosition(var_30_12, var_30_13 - 30)
						smgr.showTipSpriteText(var_30_11)
					end
				elseif iter_30_3.state == 2 then
					arg_30_0.view.widgets["btn_att" .. iter_30_2]:setVisible(true)
					arg_30_0.view.widgets["btn_att" .. iter_30_2]:setEnabled(false)
					arg_30_0.view.widgets["cock" .. iter_30_2]:setVisible(true)
					arg_30_0.view.widgets["cock" .. iter_30_2]:setScale(1)

					var_30_7 = language.get(136451)
					var_30_8 = language.get(136452, iter_30_3.maxWeight)
				end

				arg_30_0.view.widgets["infoA" .. iter_30_2]:setString(var_30_7)
				arg_30_0.view.widgets["infoB" .. iter_30_2]:setString(var_30_8)
			end
		end
	elseif var_30_2 then
		arg_30_0.view.widgets.layer_box:setVisible(false)

		for iter_30_4, iter_30_5 in pairs(arg_30_0.info.fathers) do
			if iter_30_5.ifShow == 1 then
				local var_30_14, var_30_15 = arg_30_0.view.widgets["npc" .. iter_30_4]:getPosition()

				arg_30_0.view.widgets.light:setPosition(var_30_14, var_30_15)

				break
			end
		end

		arg_30_0:addPlate(arg_30_1.totalWorshipTimes)
		arg_30_0.view.widgets.curr_name:setVisible(false)
		arg_30_0.view.widgets.icon_gold:setVisible(false)
		arg_30_0.view.widgets.worshipGold:setVisible(false)
		arg_30_0.view.widgets.worshipTimes:setVisible(false)

		arg_30_1.nextSheepId = arg_30_1.nextSheepId or 0

		if arg_30_1.worshipTimes > 0 then
			arg_30_0.view.widgets.curr_weight:setString(language.get(136492, arg_30_1.pigs[arg_30_1.nextSheepId].weight))
			arg_30_0.view.widgets.worshipTimes:setVisible(true)
			arg_30_0.view.widgets.worshipTimes:setString(language.get(490026, arg_30_1.worshipTimes))

			if arg_30_1.nextSheepId > 0 then
				arg_30_0.view.widgets.curr_name:setVisible(true)
				arg_30_0.view.widgets.curr_name:setString(language.get(var_0_8[arg_30_1.nextSheepId].txt))
				arg_30_0.view.widgets.curr_name:setColor(var_0_8[arg_30_1.nextSheepId].color)
			end
		else
			arg_30_0.view.widgets.curr_weight:setString(language.get(136467))

			if arg_30_1.freeTimes > 0 then
				arg_30_0.view.widgets.worshipTimes:setVisible(true)
				arg_30_0.view.widgets.worshipTimes:setString(language.get(136453, arg_30_1.freeTimes))
			else
				arg_30_0.view.widgets.icon_gold:setVisible(true)
				arg_30_0.view.widgets.worshipGold:setVisible(true)
				arg_30_0.view.widgets.worshipGold:setString(arg_30_1.worshipGold)
			end
		end
	end
end

function var_0_9.ctor(arg_34_0, arg_34_1, arg_34_2)
	log.info("@@ 清明祭拜活动")

	arg_34_0.view = {}

	uiutil.initWidgets(arg_34_0.view, arg_34_0.layout)

	arg_34_0.leftTime = arg_34_0.view.widgets.leftTime

	if arg_34_1 then
		arg_34_0:addChild(arg_34_0.view.widgets.root)
		arg_34_1:addChild(arg_34_0)
	end

	for iter_34_0 = 1, 5 do
		uiutil.initWidgets(arg_34_0.view, arg_34_0:getSingleCock(iter_34_0))
		arg_34_0.view.widgets.node_cock:addChild(arg_34_0.view.widgets["node" .. iter_34_0])

		local var_34_0 = arg_34_0.view.widgets["btn_att" .. iter_34_0]
		local var_34_1 = arg_34_0.view.widgets["name" .. iter_34_0]

		var_34_0:addHandleOfControlEvent(function()
			log.info("btn%s: TouchDown", iter_34_0)
			var_34_1:setString(language.get(136490))
			var_34_1:setColor(var_0_2)
		end, CCControlEventTouchDown)
		var_34_0:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpInside", iter_34_0)
			var_34_1:setString(language.get(var_0_8[iter_34_0].txt))
			var_34_1:setColor(var_0_8[iter_34_0].color)
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD)
		end, CCControlEventTouchUpInside)
		var_34_0:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpOutside", iter_34_0)
			var_34_1:setString(language.get(var_0_8[iter_34_0].txt))
			var_34_1:setColor(var_0_8[iter_34_0].color)
		end, CCControlEventTouchUpOutside)
		arg_34_0.view.widgets["btn_lock" .. iter_34_0]:addHandleOfControlEvent(function()
			log.info("btn_lock" .. iter_34_0)
			arg_34_0:onUpgradePig(iter_34_0)
		end, CCControlEventTouchUpInside)
		arg_34_0.view.widgets["btn_feed" .. iter_34_0]:addHandleOfControlEvent(function()
			log.info("btn_feed" .. iter_34_0)
			arg_34_0:onFeedPig(iter_34_0)
		end, CCControlEventTouchUpInside)
	end

	local var_34_2 = arg_34_0.view.widgets.lbl_goWorship:getContentSize()

	arg_34_0.view.widgets.lbl_goWorship:setPosition(var_34_2.width / 2 + 20, var_34_2.height / 2 + 20)
	arg_34_0.view.widgets.btn_goWorship:setPreferredSize(CCSizeMake(var_34_2.width + 40, var_34_2.height + 40))
	arg_34_0.view.widgets.btn_goWorship:addHandleOfControlEvent(function()
		log.info("btn_goWorship")
		arg_34_0:goWorship()
	end, CCControlEventTouchUpInside)
	arg_34_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_34_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_34_0.view.widgets.btn_treasure:addHandleOfControlEvent(function()
		log.info("btn_treasure")
		arg_34_0:showTipTreasure()
	end, CCControlEventTouchUpInside)
	arg_34_0.view.widgets.btn_worship:addHandleOfControlEvent(function()
		log.info("btn_worship")
		arg_34_0:onBtnWorshipTap()
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_34_0.view.widgets.layer_box)

	local var_34_3 = CCArray:create()

	var_34_3:addObject(CCFadeOut:create(0.3))
	var_34_3:addObject(CCFadeIn:create(0.3))

	local var_34_4 = CCSequence:create(var_34_3)

	arg_34_0.view.widgets.light_box:runAction(CCRepeatForever:create(var_34_4))
	arg_34_0:showPanel(arg_34_2)
end

return var_0_9
