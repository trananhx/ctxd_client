local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = {
	{
		pic2 = "xhjy_jiuhu_01_c.png",
		pic1 = "xhjy_jiuhu_01.png",
		color = tool.hexToRgb("#ffffcc")
	},
	{
		pic2 = "xhjy_jiuhu_02_c.png",
		pic1 = "xhjy_jiuhu_02.png",
		color = tool.hexToRgb("#95ffa2")
	},
	{
		pic2 = "xhjy_jiuhu_03_c.png",
		pic1 = "xhjy_jiuhu_03.png",
		color = tool.hexToRgb("#fff461")
	},
	{
		pic2 = "xhjy_jiuhu_04_c.png",
		pic1 = "xhjy_jiuhu_04.png",
		color = tool.hexToRgb("#ff8c7f")
	},
	{
		pic2 = "xhjy_jiuhu_05_c.png",
		pic1 = "xhjy_jiuhu_05.png",
		color = tool.hexToRgb("#e57fff")
	}
}
local var_0_8 = 1

local function var_0_9(arg_1_0)
	local var_1_0 = stringSplit(tostring(arg_1_0), ",")

	return tonumber(var_1_0[2]) or 0
end

local var_0_10 = class("TsDrinking", function()
	return createBaseLayer()
end)

var_0_10.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					y = 232.0836,
					x = 458.0001,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_bg.jpg"
					}
				},
				{
					y = 486,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_title_bg.png"
					}
				},
				{
					y = 0,
					name = "node_npc",
					type = "node",
					x = 0,
					children = {
						{
							x = 458,
							name = "npc",
							y = 70,
							type = "sprite",
							scale = 1.3,
							anchorPoint = ccp(0.5, 0)
						}
					}
				},
				{
					visible = false,
					name = "bg_msg",
					type = "sprite9",
					y = 280,
					x = 720,
					preferedSize = CCSizeMake(300, 100),
					middleRect = CCRectMake(24, 24, 1, 1),
					pic = {
						frame = true,
						path = "common_tip_frame_small.png"
					},
					children = {
						{
							fontSize = 20,
							name = "msg",
							x = 15,
							type = "label",
							height = 0,
							y = 85,
							width = 270,
							color = var_0_1,
							anchorPoint = ccp(0, 1),
							halign = kCCTextAlignmentLeft
						}
					}
				},
				{
					y = 406,
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_zy_pb_bg.png"
					},
					children = {
						{
							y = 52,
							name = "bg_bar",
							type = "sprite",
							x = 150,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/generalDrink/zjlyx_zy_pb_d.png"
							},
							children = {
								{
									y = 0,
									name = "bar_wineNum",
									type = "progressbar",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/generalDrink/zjlyx_zy_pb.png"
									}
								},
								{
									fontSize = 25,
									name = "wineNum",
									y = 16,
									type = "label",
									x = 360
								},
								{
									type = "node",
									name = "node_box",
									y = 0,
									visible = false,
									x = 0,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_box1",
											h = 65,
											type = "button",
											w = 65,
											y = 16,
											x = 240,
											normal = {
												path = "res/ui/activity/tsDrinking/xhjy_pb_icon_bg.png"
											},
											touched = {
												path = "res/ui/activity/tsDrinking/xhjy_pb_icon_bg.png"
											},
											children = {
												{
													y = 32.5,
													name = "box1",
													type = "sprite",
													x = 32.5,
													pic = {
														path = "res/ui/activity/tsDrinking/xhjy_pb_box_01.jpg"
													}
												},
												{
													fontSize = 24,
													name = "target1",
													y = 18,
													type = "label",
													x = 32.5,
													zorder = 100
												}
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_box2",
											h = 65,
											type = "button",
											w = 65,
											y = 16,
											x = 480,
											normal = {
												path = "res/ui/activity/tsDrinking/xhjy_pb_icon_bg.png"
											},
											touched = {
												path = "res/ui/activity/tsDrinking/xhjy_pb_icon_bg.png"
											},
											children = {
												{
													y = 32.5,
													name = "box2",
													type = "sprite",
													x = 32.5,
													pic = {
														path = "res/ui/activity/tsDrinking/xhjy_pb_box_02.jpg"
													}
												},
												{
													fontSize = 24,
													name = "target2",
													y = 18,
													type = "label",
													x = 32.8,
													zorder = 100
												}
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_box3",
											h = 65,
											type = "button",
											w = 65,
											y = 16,
											x = 720,
											normal = {
												path = "res/ui/activity/tsDrinking/xhjy_pb_icon_bg.png"
											},
											touched = {
												path = "res/ui/activity/tsDrinking/xhjy_pb_icon_bg.png"
											},
											children = {
												{
													y = 32.5,
													name = "box3",
													type = "sprite",
													x = 32.5,
													pic = {
														path = "res/ui/activity/tsDrinking/xhjy_pb_box_03.jpg"
													}
												},
												{
													fontSize = 24,
													name = "target3",
													y = 18,
													type = "label",
													x = 32.5,
													zorder = 100
												}
											}
										}
									}
								}
							}
						},
						{
							type = "sprite",
							name = "txt_drunk",
							y = 52,
							visible = false,
							x = 70,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_word_xjsj.png"
							}
						},
						{
							type = "richLine",
							name = "richLine_round",
							y = 52,
							visible = false,
							anchorPointX = 0.5,
							x = 70,
							content = {
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/tsDrinking/xhjy_word_di.png"
									}
								},
								{
									text = "0",
									name = "round1",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 15,
									pic = "res/ui/common/number/xhjy_number.png",
									itemHeight = 18
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/tsDrinking/xhjy_word_lun.png"
									}
								}
							}
						}
					}
				},
				{
					y = 45,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_table.png"
					}
				},
				{
					y = 485,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_title.png"
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
					y = 480,
					type = "label",
					x = 730,
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3
				},
				{
					type = "node",
					name = "node_tea",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_tea",
							h = 90,
							type = "button",
							w = 76,
							y = 100,
							x = 458,
							normal = {
								path = "res/ui/activity/tsDrinking/xhjy_jiubei.png"
							},
							touched = {
								path = "res/ui/activity/tsDrinking/xhjy_jiubei_c.png"
							}
						},
						{
							y = 50,
							name = "bg_teaName",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_lnk_bg.png"
							}
						},
						{
							fontSize = 20,
							name = "freeTeaNum",
							y = 26,
							type = "label",
							x = 470
						},
						{
							y = 50,
							name = "bg_teaGold",
							type = "sprite",
							x = 480,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
							},
							children = {
								{
									y = 30,
									x = 20,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "teaGold",
									y = 14,
									type = "label",
									x = 20,
									color = var_0_4
								}
							}
						},
						{
							y = 50,
							name = "name_tea",
							type = "sprite",
							x = 470,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_word_jiu_xjc.png"
							}
						},
						{
							y = 70,
							name = "icon1",
							type = "sprite",
							x = 70,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_pingguo.png"
							}
						},
						{
							y = 56,
							name = "icon2",
							type = "sprite",
							x = 240,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_niurou.png"
							}
						},
						{
							y = 58.8569,
							name = "icon3",
							type = "sprite",
							x = 676,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_niurou.png"
							}
						},
						{
							y = 70,
							name = "icon4",
							type = "sprite",
							x = 846,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_pingguo.png"
							}
						},
						{
							y = 340,
							name = "bg_round",
							type = "sprite",
							x = 76,
							pic = {
								path = "res/ui/juben/jb_wj_lv_d.png"
							},
							children = {
								{
									fontSize = 25,
									name = "round2",
									y = 25,
									type = "label",
									x = 88
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_wine",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							name = "btn_wine",
							h = 136,
							type = "button",
							w = 158,
							y = 120,
							x = 458,
							normal = {
								path = "res/ui/activity/tsDrinking/xhjy_jiuhu_01.png"
							},
							touched = {
								path = "res/ui/activity/tsDrinking/xhjy_jiuhu_01_c.png"
							},
							children = {
								{
									y = -2,
									name = "bg_wineName",
									type = "sprite",
									x = 101,
									pic = {
										path = "res/ui/activity/tsDrinking/xhjy_lnk_bg.png"
									},
									children = (function()
										if conf.language == "vie" then
											return {
												{
													y = 15,
													name = "richLine_wine",
													anchorPointX = 0,
													type = "richLine",
													gap = 10,
													x = 15,
													content = {
														{
															fontSize = 22,
															name = "wineName",
															type = "label"
														}
													}
												},
												{
													y = -10,
													anchorPointX = 0,
													type = "richLine",
													gap = 10,
													x = 15,
													content = {
														{
															fontSize = 22,
															name = "wineCapacity",
															type = "label"
														}
													}
												}
											}
										else
											return {
												{
													y = 15,
													name = "richLine_wine",
													anchorPointX = 0,
													type = "richLine",
													gap = 10,
													x = 15,
													content = {
														{
															fontSize = 22,
															name = "wineName",
															type = "label"
														},
														{
															fontSize = 22,
															name = "wineCapacity",
															type = "label"
														}
													}
												}
											}
										end
									end)()
								}
							}
						},
						{
							name = "btn_bestWine",
							h = 140,
							type = "button",
							w = 88,
							y = 120,
							x = 740,
							normal = {
								path = "res/ui/activity/tsDrinking/xhjy_jiuhu_06.png"
							},
							touched = {
								path = "res/ui/activity/tsDrinking/xhjy_jiuhu_06_c.png"
							},
							disable = {
								path = "res/ui/activity/tsDrinking/xhjy_jiuhu_06_g.png"
							}
						},
						{
							y = 50,
							name = "bg_bestWineGold",
							type = "sprite",
							x = 780,
							pic = {
								path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
							},
							children = (function()
								if conf.language == "vie" then
									return {
										{
											y = 30,
											x = 20,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 22,
											name = "bestWineGold",
											y = 14,
											type = "label",
											x = 20,
											color = var_0_4
										},
										{
											y = 21,
											name = "richLine_bestWine",
											anchorPointX = 0,
											type = "richLine",
											gap = 10,
											x = 45,
											content = {
												{
													name = "bestWineName",
													fontSize = 22,
													type = "label",
													color = var_0_6
												}
											}
										},
										{
											y = -4,
											anchorPointX = 0,
											type = "richLine",
											gap = 10,
											x = 45,
											content = {
												{
													fontSize = 22,
													name = "bestWineCapacity",
													type = "label"
												}
											}
										}
									}
								else
									return {
										{
											y = 30,
											x = 20,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 22,
											name = "bestWineGold",
											y = 14,
											type = "label",
											x = 20,
											color = var_0_4
										},
										{
											y = 21,
											name = "richLine_bestWine",
											anchorPointX = 0,
											type = "richLine",
											gap = 10,
											x = 45,
											content = {
												{
													name = "bestWineName",
													fontSize = 22,
													type = "label",
													color = var_0_6
												},
												{
													fontSize = 22,
													name = "bestWineCapacity",
													type = "label"
												}
											}
										}
									}
								end
							end)()
						},
						{
							y = 334,
							name = "bg_capacity",
							type = "sprite",
							x = 44,
							pic = {
								path = "res/ui/activity/tsDrinking/xhjy_bar_bg.png"
							},
							children = {
								{
									y = 34,
									name = "bar_capacity",
									type = "progressbar",
									x = 34,
									progressType = kCCProgressTimerTypeRadial,
									pic = {
										path = "res/ui/activity/tsDrinking/xhjy_bar.png"
									}
								},
								{
									name = "capacity",
									type = "atlaslabel",
									pic = "res/ui/common/number/xhjy_number.png",
									startCharMap = 48,
									text = "0",
									y = 34,
									itemWidth = 15,
									x = 34,
									itemHeight = 18
								},
								{
									fontSize = 20,
									y = -8,
									type = "label",
									x = 0,
									textId = 136350,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "bg_drinkTooMuch",
							type = "sprite9",
							y = 280,
							x = 458,
							preferedSize = CCSizeMake(320, 60),
							middleRect = CCRectMake(100, 10, 22, 14),
							pic = {
								path = "res/ui/buildEvent/jzcl_wjm_di.png"
							},
							children = {
								{
									y = 29,
									x = 160,
									type = "sprite",
									pic = {
										path = "res/ui/activity/tsDrinking/xhjy_word_khbxl.png"
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
var_0_10.tipFrame = {
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
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_10.refresh(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0:showPanel(arg_6_0.action.data)
	end

	cmgr.sendRequest(var_5_0, actions.getTsDrinkingEvent)
end

function var_0_10.onStartNewRound(arg_7_0)
	local function var_7_0(arg_8_0)
		arg_7_0:refresh()
		arg_7_0:showEffectGeneral()
	end

	if arg_7_0.info.freeTeaNum and arg_7_0.info.freeTeaNum > 0 then
		cmgr.sendRequest(var_7_0, actions.tsdStartNewRound)
	else
		messageBox.showChargeWin("", language.get(136331, arg_7_0.info.teaGold), "tsdBuySoberTea", function()
			cmgr.sendRequest(var_7_0, actions.tsdStartNewRound)
		end)
	end
end

function var_0_10.onDrink(arg_10_0, arg_10_1)
	arg_10_0.view.widgets.btn_wine:setEnabled(false)
	arg_10_0.view.widgets.btn_bestWine:setEnabled(false)

	local function var_10_0(arg_11_0)
		local var_11_0 = arg_11_0.action.data

		arg_10_0.afterDrinkWine = true

		local var_11_1 = arg_10_0.info
		local var_11_2 = arg_10_1 == 0 and var_11_1.wines[1].capacity or var_11_1.bestWineCapacity

		if var_11_1.capacity < 70 and var_11_2 + var_11_1.capacity >= 70 then
			arg_10_0.drinkTooMuch = true
		end

		if var_11_2 + var_11_1.capacity >= var_11_1.maxCapacity then
			var_11_1.capacity = var_11_1.maxCapacity
			var_11_1.wineNum = var_11_1.wineNum + 1
			arg_10_0.isLastDrink = true
		end

		local var_11_3 = arg_10_0.drinkTooMuch or arg_10_0.isLastDrink or var_0_9(var_11_0.extraReward) > 0

		arg_10_0.view.widgets.btn_bestWine:setEnabled(not var_11_3)
		arg_10_0:showEffectDrink(arg_10_1, var_11_0)

		if arg_10_0.isLastDrink then
			arg_10_0:updateWineNumAndCapacity()
		else
			arg_10_0:refresh()
		end
	end

	local var_10_1 = arg_10_1 == 0 and arg_10_0.info.wines[1].id or 0

	if arg_10_1 == 0 then
		cmgr.sendRequest(var_10_0, actions.tsdDrink, arg_10_1, var_10_1)
	elseif arg_10_1 == 1 then
		messageBox.showChargeWin("", language.get(136333, arg_10_0.info.bestWineGold), "tsdBuyBestWine", function()
			cmgr.sendRequest(var_10_0, actions.tsdDrink, arg_10_1, var_10_1)
		end)
	end
end

function var_0_10.showEffectReward(arg_13_0)
	if arg_13_0.rewardNode then
		arg_13_0.rewardNode:stopAllActions()
	else
		arg_13_0.rewardNode = CCSpriteBatchNode:create("res/ui/activity/generalDrink/jxj_2.png")

		arg_13_0.view.widgets.panel:addChild(arg_13_0.rewardNode, 100)
	end

	if arg_13_0.rewardData == nil then
		return
	end

	arg_13_0.reward = arg_13_0.reward or {}

	local function var_13_0(arg_14_0)
		local var_14_0 = {}

		for iter_14_0 = 1, arg_14_0 do
			local var_14_1 = {}

			var_14_1.id = 114
			var_14_1.value = 1

			table.insert(var_14_0, var_14_1)
		end

		globalAction_gotResource(var_14_0)
	end

	local function var_13_1(arg_15_0)
		arg_13_0.rewardNode:addChild(arg_15_0)

		local var_15_0 = math.random(280, 640)
		local var_15_1 = math.random(60, 120)

		arg_15_0:setPosition(ccp(460, 240))
		arg_15_0:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_15_0, var_15_1))))
	end

	for iter_13_0 = 1, arg_13_0.rewardData.num do
		local var_13_2 = CCSprite:create("res/ui/activity/generalDrink/jxj_2.png")

		table.insert(arg_13_0.reward, {
			obj = var_13_2
		})
		var_13_1(var_13_2)
	end

	local var_13_3 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_13_3:registerScriptTouchHandler(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_16_1, arg_16_2)

			if arg_13_0.reward and #arg_13_0.reward > 0 then
				local var_16_0 = 0

				for iter_16_0 = #arg_13_0.reward, 1, -1 do
					local var_16_1 = arg_13_0.reward[iter_16_0]
					local var_16_2 = tolua.cast(arg_13_0.reward[iter_16_0].obj, "CCSprite")

					if tool.checkIfTouch(var_16_2, arg_16_1, arg_16_2) then
						var_16_0 = var_16_0 + 1

						var_16_2:removeFromParentAndCleanup(true)
						table.remove(arg_13_0.reward, iter_16_0)

						if var_16_0 >= 5 then
							break
						end
					end
				end

				if var_16_0 > 0 then
					while var_16_0 < 3 and #arg_13_0.reward > 0 do
						tolua.cast(table.remove(arg_13_0.reward).obj, "CCSprite"):removeFromParentAndCleanup(true)

						var_16_0 = var_16_0 + 1
					end

					var_13_0(var_16_0)

					if #arg_13_0.reward == 0 then
						if arg_13_0.info.capacity < arg_13_0.info.maxCapacity then
							arg_13_0:showEffectWine()
						else
							arg_13_0.isLastDrink = false

							arg_13_0.view.widgets.btn_bestWine:setEnabled(true)
							arg_13_0:refresh()
						end
					end

					return true
				end
			end

			return false
		elseif arg_16_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_16_1, arg_16_2)

			return true
		elseif arg_16_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_16_1, arg_16_2)

			return true
		end
	end, false, true)
	var_13_3:setTouchEnabled(true)
	arg_13_0.view.widgets.panel:addChild(var_13_3)

	if arg_13_0.maskLayer then
		arg_13_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_13_0.maskLayer = var_13_3
	arg_13_0.rewardData = nil
end

function var_0_10.showEffectDrink(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.bowlNode then
		arg_17_0.bowlNode:removeAllChildrenWithCleanup(true)
	else
		arg_17_0.bowlNode = CCNode:create()

		arg_17_0.view.widgets.panel:addChild(arg_17_0.bowlNode)
	end

	if arg_17_0.rewardData then
		local var_17_0 = {}

		table.insert(var_17_0, {
			id = 114,
			value = arg_17_0.rewardData.num
		})
		table.insert(var_17_0, {
			id = 10053,
			value = -arg_17_0.rewardData.capacity
		})
		globalAction_gotResource(var_17_0)
	elseif arg_17_0.reward and #arg_17_0.reward > 0 then
		local var_17_1 = 0

		for iter_17_0 = #arg_17_0.reward, 1, -1 do
			local var_17_2 = arg_17_0.reward[iter_17_0]
			local var_17_3 = tolua.cast(arg_17_0.reward[iter_17_0].obj, "CCSprite")

			var_17_1 = var_17_1 + 1

			var_17_3:removeFromParentAndCleanup(true)
			table.remove(arg_17_0.reward, iter_17_0)
		end

		local var_17_4 = {}

		table.insert(var_17_4, {
			id = 114,
			value = var_17_1
		})
		globalAction_gotResource(var_17_4)
	end

	local var_17_5 = arg_17_1 == 0 and arg_17_0.info.wines[1].reward or arg_17_0.info.bestWineReward
	local var_17_6 = arg_17_1 == 0 and arg_17_0.info.wines[1].capacity or arg_17_0.info.bestWineCapacity
	local var_17_7 = arg_17_2.extraReward

	arg_17_0.rewardData = {
		num = var_0_9(var_17_5) * arg_17_2.baoji + var_0_9(var_17_7),
		capacity = var_17_6
	}

	arg_17_0.view.widgets.btn_wine:stopAllActions()
	arg_17_0.view.widgets.btn_wine:setPosition(458, 120)
	arg_17_0.view.widgets.btn_wine:setVisible(true)

	local var_17_8 = arg_17_1 == 0 and 0.3 or 0

	if arg_17_1 == 0 then
		local var_17_9 = CCArray:create()

		var_17_9:addObject(CCMoveTo:create(var_17_8, ccp(458, 150)))
		var_17_9:addObject(CCHide:create())

		local var_17_10 = CCSequence:create(var_17_9)

		arg_17_0.view.widgets.btn_wine:runAction(var_17_10)
	else
		arg_17_0.view.widgets.btn_wine:setVisible(false)
	end

	for iter_17_1 = 1, 2 do
		local var_17_11 = CCSprite:create("res/ui/activity/generalDrink/zjlyx_wan.png")

		var_17_11:setVisible(false)
		var_17_11:setPosition(iter_17_1 == 1 and ccp(383, 100) or ccp(533, 100))
		arg_17_0.bowlNode:addChild(var_17_11)

		local var_17_12 = CCArray:create()

		var_17_12:addObject(CCDelayTime:create(var_17_8))
		var_17_12:addObject(CCShow:create())
		var_17_12:addObject(CCDelayTime:create(0.15))
		var_17_12:addObject(CCMoveBy:create(0.3, ccp(0, 30)))
		var_17_12:addObject(CCDelayTime:create(0.15))

		if iter_17_1 == 2 then
			var_17_12:addObject(CCCallFunc:create(function()
				local var_18_0 = CCSprite:create("res/ui/activity/generalDrink/zjlyx_word_sp_gb.png")

				var_18_0:setPosition(458, 280)
				var_18_0:setScale(1.5)
				arg_17_0.bowlNode:addChild(var_18_0)

				local var_18_1 = CCArray:create()

				var_18_1:addObject(CCScaleTo:create(0.3, 1))
				var_18_1:addObject(CCDelayTime:create(0.4))
				var_18_1:addObject(CCFadeOut:create(0.3))
				var_18_1:addObject(CCCallFunc:create(function()
					if arg_17_0.drinkTooMuch then
						local var_19_0 = CCArray:create()

						var_19_0:addObject(CCShow:create())
						var_19_0:addObject(CCDelayTime:create(2))
						var_19_0:addObject(CCHide:create())
						arg_17_0.view.widgets.bg_drinkTooMuch:runAction(CCSequence:create(var_19_0))

						arg_17_0.drinkTooMuch = false

						arg_17_0.view.widgets.btn_bestWine:setEnabled(true)
					end

					if arg_17_2.baoji > 1 then
						local var_19_1 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. arg_17_2.baoji .. ".png")

						var_19_1:setPosition(458, 280)
						arg_17_0.bowlNode:addChild(var_19_1)

						local var_19_2 = CCArray:create()

						var_19_2:addObject(CCDelayTime:create(0.8))
						var_19_2:addObject(CCFadeOut:create(0.2))
						var_19_2:addObject(CCCallFunc:create(function()
							var_19_1:removeFromParentAndCleanup(true)
						end))
						var_19_1:runAction(CCSequence:create(var_19_2))
					end

					arg_17_0:showEffectReward(arg_17_1, arg_17_2)

					if var_0_9(arg_17_2.extraReward) > 0 then
						if not arg_17_0.isLastDrink then
							arg_17_0.view.widgets.btn_bestWine:setEnabled(true)
						end

						arg_17_0.touchCount = 1
						arg_17_0.haveTwoMsg = false

						arg_17_0.view.widgets.bg_msg:setVisible(true)
						arg_17_0.view.widgets.msg:setString(language.get(136342))
					end

					local var_19_3 = {}

					table.insert(var_19_3, {
						id = 10053,
						value = -var_17_6
					})
					globalAction_gotResource(var_19_3)
				end))

				local var_18_2 = CCSequence:create(var_18_1)

				var_18_0:runAction(var_18_2)
			end))
		end

		var_17_12:addObject(CCEaseSineOut:create(CCMoveBy:create(0.3, ccp(iter_17_1 == 1 and 40 or -40, 0))))
		var_17_12:addObject(CCDelayTime:create(0.2))
		var_17_12:addObject(CCFadeOut:create(0.3))

		local var_17_13 = CCSequence:create(var_17_12)

		var_17_11:runAction(var_17_13)
	end
end

function var_0_10.showEffectGeneral(arg_21_0)
	local var_21_0 = arg_21_0.view.widgets.npc

	var_0_8 = var_0_8 + 1
	var_0_8 = 1 + (var_0_8 - 1) % #arg_21_0.military

	local var_21_1 = CCSprite:create(string.format("res/ui/common/halfPic/halfPic_%s.png", arg_21_0.military[var_0_8].pic))

	arg_21_0.view.widgets.node_npc:addChild(var_21_1)
	var_21_1:setAnchorPoint(ccp(0.5, 0))
	var_21_1:setPosition(746, 70)
	var_21_1:setScale(1.3)
	var_21_1:setOpacity(0)

	arg_21_0.view.widgets.npc = var_21_1

	local var_21_2 = CCArray:create()

	var_21_2:addObject(CCSpawn:createWithTwoActions(CCFadeIn:create(0.5), CCMoveTo:create(0.5, ccp(458, 70))))
	var_21_2:addObject(CCTargetedAction:create(arg_21_0.view.widgets.bg_msg, CCCallFunc:create(function()
		arg_21_0.touchCount = 1
		arg_21_0.haveTwoMsg = false

		arg_21_0.view.widgets.bg_msg:setVisible(true)
		arg_21_0.view.widgets.msg:setString(language.get(136336))
	end)))
	var_21_1:runAction(CCSequence:create(var_21_2))

	local var_21_3 = CCArray:create()

	var_21_3:addObject(CCSpawn:createWithTwoActions(CCFadeOut:create(0.3), CCMoveTo:create(0.3, ccp(340, 70))))
	var_21_3:addObject(CCCallFunc:create(function()
		var_21_0:removeFromParentAndCleanup(true)
	end))
	var_21_0:runAction(CCSequence:create(var_21_3))
end

function var_0_10.showEffectWine(arg_24_0)
	local var_24_0 = arg_24_0.info.wines[1]

	arg_24_0.view.widgets.wineName:setString(var_24_0.name)
	arg_24_0.view.widgets.wineName:setColor(var_0_7[var_24_0.id].color)
	arg_24_0.view.widgets.wineCapacity:setString(language.get(136337, var_24_0.capacity))
	arg_24_0.view.widgets.richLine_wine:reorder()

	local var_24_1 = CCScale9Sprite:create("res/ui/activity/tsDrinking/" .. var_0_7[var_24_0.id].pic1)
	local var_24_2 = CCScale9Sprite:create("res/ui/activity/tsDrinking/" .. var_0_7[var_24_0.id].pic2)

	arg_24_0.view.widgets.btn_wine:setBackgroundSpriteForState(var_24_1, CCControlStateNormal)
	arg_24_0.view.widgets.btn_wine:setBackgroundSpriteForState(var_24_2, CCControlStateHighlighted)
	arg_24_0.view.widgets.btn_wine:stopAllActions()
	arg_24_0.view.widgets.btn_wine:setPosition(458, 90)
	arg_24_0.view.widgets.btn_wine:setVisible(true)
	arg_24_0.view.widgets.btn_wine:setEnabled(true)

	local var_24_3 = CCArray:create()

	var_24_3:addObject(CCMoveTo:create(0.3, ccp(458, 120)))

	local var_24_4 = CCSequence:create(var_24_3)

	arg_24_0.view.widgets.btn_wine:runAction(var_24_4)
end

function var_0_10.updateWineNumAndCapacity(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.info
	local var_25_1 = 0
	local var_25_2 = #var_25_0.extraRewards

	for iter_25_0, iter_25_1 in ipairs(var_25_0.extraRewards) do
		local var_25_3 = var_25_0.wineNum >= iter_25_1.num

		arg_25_0.view.widgets["target" .. iter_25_0]:setString(iter_25_1.num)
		arg_25_0.view.widgets["box" .. iter_25_0]:removeAllChildrenWithCleanup(true)

		if not var_25_3 then
			tool.spriteToGray(arg_25_0.view.widgets["box" .. iter_25_0])
		end

		if var_25_3 then
			var_25_1 = var_25_1 + 100 / var_25_2
		else
			local var_25_4 = iter_25_0 == 1 and 0 or arg_25_0.info.extraRewards[iter_25_0 - 1].num

			if var_25_4 <= var_25_0.wineNum then
				var_25_1 = var_25_1 + 100 / var_25_2 * (var_25_0.wineNum - var_25_4) / (iter_25_1.num - var_25_4)
			end
		end
	end

	arg_25_0.view.widgets.bar_wineNum:setPercentage(var_25_1)
	arg_25_0.view.widgets.wineNum:setString(language.get(390478, var_25_0.wineNum, var_25_0.maxWineNum))
	arg_25_0.view.widgets.capacity:setString(tostring(var_25_0.maxCapacity - var_25_0.capacity))
	arg_25_0.view.widgets.bar_capacity:setPercentage(100 * (var_25_0.maxCapacity - var_25_0.capacity) / var_25_0.maxCapacity)
end

function var_0_10.showPanel(arg_26_0, arg_26_1)
	arg_26_0.info = arg_26_1

	arg_26_0.view.widgets.bg_drinkTooMuch:setVisible(false)
	arg_26_0.view.widgets.wineNum:stopAllActions()

	var_0_8 = 1 + (var_0_8 - 1) % #arg_26_0.military

	arg_26_0.view.widgets.npc:setDisplayFrame(CCSprite:create(string.format("res/ui/common/halfPic/halfPic_%s.png", arg_26_0.military[var_0_8].pic)):displayFrame())

	local var_26_0 = arg_26_1.wines ~= nil and #arg_26_1.wines > 0

	arg_26_0.view.widgets.node_wine:setVisible(var_26_0)
	arg_26_0.view.widgets.richLine_round:setVisible(var_26_0)
	arg_26_0.view.widgets.node_box:setVisible(var_26_0)
	arg_26_0.view.widgets.node_tea:setVisible(not var_26_0)
	arg_26_0.view.widgets.txt_drunk:setVisible(not var_26_0)

	if var_26_0 then
		arg_26_0:updateWineNumAndCapacity(arg_26_1)
		arg_26_0.view.widgets.round1:setString(tostring(arg_26_1.curRound))
		arg_26_0.view.widgets.richLine_round:reorder()

		if arg_26_0.afterDrinkWine ~= true then
			arg_26_0:showEffectWine()
		end

		arg_26_0.view.widgets.bestWineGold:setString(arg_26_1.bestWineGold)
		arg_26_0.view.widgets.bestWineName:setString(arg_26_1.bestWineName)
		arg_26_0.view.widgets.bestWineCapacity:setString(language.get(136337, arg_26_1.bestWineCapacity))
		arg_26_0.view.widgets.richLine_bestWine:reorder()
	else
		arg_26_0.view.widgets.round2:setString(language.get(410001, arg_26_1.curRound))

		if arg_26_1.cd and arg_26_1.cd > 0 then
			local var_26_1 = CCArray:create()

			var_26_1:addObject(CCCallFunc:create(function()
				if arg_26_1.cd <= 0 then
					arg_26_0.view.widgets.wineNum:stopAllActions()
					arg_26_0:refresh()
				else
					arg_26_0.view.widgets.wineNum:setString(tool.getFormatTime(arg_26_1.cd))
					arg_26_0.view.widgets.bar_wineNum:setPercentage(100 * (arg_26_1.totalCd - arg_26_1.cd) / arg_26_1.totalCd)
				end
			end))
			var_26_1:addObject(CCDelayTime:create(0.5))

			local var_26_2 = CCSequence:create(var_26_1)

			arg_26_0.view.widgets.wineNum:runAction(CCRepeatForever:create(var_26_2))
		end

		local var_26_3 = arg_26_1.freeTeaNum ~= nil and arg_26_1.freeTeaNum > 0

		arg_26_0.view.widgets.bg_teaName:setVisible(var_26_3)
		arg_26_0.view.widgets.freeTeaNum:setVisible(var_26_3)
		arg_26_0.view.widgets.bg_teaGold:setVisible(not var_26_3)

		if var_26_3 then
			arg_26_0.view.widgets.freeTeaNum:setString(language.get(136339, arg_26_1.freeTeaNum))
		else
			arg_26_0.view.widgets.teaGold:setString(arg_26_1.teaGold)
		end

		if arg_26_0.afterDrinkWine ~= true then
			arg_26_0.touchCount = 1
			arg_26_0.haveTwoMsg = false

			arg_26_0.view.widgets.bg_msg:setVisible(true)
			arg_26_0.view.widgets.msg:setString(language.get(136345))
		else
			arg_26_0.touchCount = 1
			arg_26_0.haveTwoMsg = true

			arg_26_0.view.widgets.bg_msg:setVisible(true)
			arg_26_0.view.widgets.msg:setString(language.get(136335))
		end
	end

	arg_26_0.afterDrinkWine = false
end

function var_0_10.showTipWine(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	if arg_28_2 then
		arg_28_2:stopAllActions()
	end

	if arg_28_0.view.widgets.tipFrame then
		arg_28_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_28_0.view.widgets.tipFrame = nil
	end

	if arg_28_1 then
		local var_28_0, var_28_1 = tool.getPositionInScreen(arg_28_2)
		local var_28_2
		local var_28_3
		local var_28_4 = var_28_0 + 0
		local var_28_5 = var_28_1 + 20

		uiutil.initWidgets(arg_28_0.view, arg_28_0.tipFrame)
		arg_28_0:addChild(arg_28_0.view.widgets.tipFrame)
		arg_28_0.view.widgets.tipFrame:setAnchorPoint(ccp(0, 0))
		arg_28_0.view.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

		local var_28_6 = arg_28_3 == 0 and arg_28_0.info.wines[1].reward or arg_28_0.info.bestWineReward
		local var_28_7 = language.get("222146_juexingJiu", var_0_9(var_28_6))

		arg_28_0.view.widgets.tipMsg:setString(var_28_7)

		local var_28_8 = arg_28_0.view.widgets.tipMsg:getContentSize().width
		local var_28_9 = arg_28_0.view.widgets.tipMsg:getContentSize().height

		arg_28_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_28_8 + 30, var_28_9 + 30))
		arg_28_0.view.widgets.tipFrame:setPosition(ccp(var_28_4, var_28_5))
		arg_28_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_28_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_10.showTip(arg_29_0, arg_29_1)
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
	var_29_0:addChild(var_29_3.widgets.tipFrame)
	var_29_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

	local var_29_4 = ""
	local var_29_5

	if arg_29_1 then
		var_29_5 = arg_29_0.view.widgets["btn_box" .. arg_29_1]

		local var_29_6 = arg_29_0.info.extraRewards[arg_29_1]

		var_29_4 = language.get(136348, var_29_6.num, language.get("222146_juexingJiu", var_0_9(var_29_6.reward)))
	else
		var_29_5 = arg_29_0.view.widgets.btn_tip
		var_29_4 = language.get(136351)
	end

	var_29_3.widgets.tipMsg:setString(var_29_4)

	local var_29_7, var_29_8 = tool.getPositionInScreen(var_29_5)
	local var_29_9 = var_29_7 + 20
	local var_29_10 = var_29_8 - 20
	local var_29_11 = var_29_3.widgets.tipMsg:getContentSize().width
	local var_29_12 = var_29_3.widgets.tipMsg:getContentSize().height

	var_29_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_29_11 + 30, var_29_12 + 30))
	var_29_3.widgets.tipFrame:setPosition(ccp(var_29_9, var_29_10))
	var_29_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_29_3.widgets.tipFrame:setVisible(true)
end

function var_0_10.ctor(arg_31_0, arg_31_1, arg_31_2)
	log.info("@@ 清明酒宴活动")

	arg_31_0.view = {}

	uiutil.initWidgets(arg_31_0.view, arg_31_0.layout)

	arg_31_0.leftTime = arg_31_0.view.widgets.leftTime

	if arg_31_1 then
		arg_31_0:addChild(arg_31_0.view.widgets.root)
		arg_31_1:addChild(arg_31_0)
	end

	arg_31_0.view.widgets.bar_capacity:setMidpoint(ccp(0.5, 0.5))
	arg_31_0.view.widgets.bar_capacity:setReverseProgress(true)
	arg_31_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_31_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_tea:addHandleOfControlEvent(function()
		log.info("btn_tea")
		arg_31_0:onStartNewRound()
	end, CCControlEventTouchUpInside)

	for iter_31_0 = 1, 3 do
		arg_31_0.view.widgets["btn_box" .. iter_31_0]:addHandleOfControlEvent(function()
			log.info("btn_box" .. iter_31_0)
			arg_31_0:showTip(iter_31_0)
		end, CCControlEventTouchUpInside)
	end

	local var_31_0 = arg_31_0.view.widgets.btn_wine

	var_31_0:addHandleOfControlEvent(function()
		log.info("btn_wine TouchDown")
		schedule(var_31_0, function()
			arg_31_0:showTipWine(true, var_31_0, 0)
		end, 0.1)
	end, CCControlEventTouchDown)
	var_31_0:addHandleOfControlEvent(function()
		log.info("btn_wine TouchUpInside")
		arg_31_0:showTipWine(false, var_31_0)
		arg_31_0:onDrink(0)
	end, CCControlEventTouchUpInside)
	var_31_0:addHandleOfControlEvent(function()
		log.info("btn_wine TouchUpOutside")
		arg_31_0:showTipWine(false, var_31_0)
	end, CCControlEventTouchUpOutside)

	local var_31_1 = arg_31_0.view.widgets.btn_bestWine

	var_31_1:addHandleOfControlEvent(function()
		log.info("btn_bestWine TouchDown")
		schedule(var_31_1, function()
			arg_31_0:showTipWine(true, var_31_1, 1)
		end, 0.1)
	end, CCControlEventTouchDown)
	var_31_1:addHandleOfControlEvent(function()
		log.info("btn_bestWine TouchUpInside")
		arg_31_0:showTipWine(false, var_31_1)
		arg_31_0:onDrink(1)
	end, CCControlEventTouchUpInside)
	var_31_1:addHandleOfControlEvent(function()
		log.info("btn_bestWine TouchUpOutside")
		arg_31_0:showTipWine(false, var_31_1)
	end, CCControlEventTouchUpOutside)
	math.randomseed(os.time())

	local function var_31_2(arg_43_0)
		arg_31_0.military = arg_43_0.action.data.military

		arg_31_0:showPanel(arg_31_2)
	end

	cmgr.sendRequest(var_31_2, actions.generalSimpleInfo)
end

function var_0_10.onEnter(arg_44_0)
	arg_44_0.touchCount = 0
	arg_44_0.touchBeganRef = handler(arg_44_0, arg_44_0.onTouchBegan)
	arg_44_0.touchMovedRef = handler(arg_44_0, arg_44_0.onTouchMoved)
	arg_44_0.touchEndedRef = handler(arg_44_0, arg_44_0.onTouchEnded)
	arg_44_0.touchCancelledRef = handler(arg_44_0, arg_44_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_44_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_44_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_44_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_44_0.touchCancelledRef)

	arg_44_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_44_0, arg_44_0.update), 0, false)
end

function var_0_10.onExit(arg_45_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_45_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_45_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_45_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_45_0.touchCancelledRef)

	if arg_45_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_45_0.updateRef)
	end
end

function var_0_10.update(arg_46_0, arg_46_1)
	if arg_46_0.info and arg_46_0.info.cd then
		if arg_46_0.info.cd > 0 then
			arg_46_0.info.cd = arg_46_0.info.cd - 1000 * arg_46_1
		elseif arg_46_0.info.cd <= 0 then
			arg_46_0.info.cd = 0
		end
	end
end

function var_0_10.onTouchBegan(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_0.touchCount > 0 then
		arg_47_0.touchCount = arg_47_0.touchCount + 1

		if arg_47_0.haveTwoMsg == true then
			if arg_47_0.touchCount == 2 then
				arg_47_0.view.widgets.msg:setString(language.get(136345))
			elseif arg_47_0.touchCount == 3 then
				arg_47_0.haveTwoMsg = false
				arg_47_0.touchCount = 0

				arg_47_0.view.widgets.bg_msg:setVisible(false)
			end
		else
			arg_47_0.touchCount = 0

			arg_47_0.view.widgets.bg_msg:setVisible(false)
		end
	end
end

function var_0_10.onTouchMoved(arg_48_0, arg_48_1, arg_48_2)
	return
end

function var_0_10.onTouchEnded(arg_49_0, arg_49_1, arg_49_2)
	return
end

function var_0_10.onTouchCancelled(arg_50_0, arg_50_1, arg_50_2)
	return
end

return var_0_10
