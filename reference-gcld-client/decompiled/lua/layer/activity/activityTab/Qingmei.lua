local var_0_0 = colorQuality[0]
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = {
	"qmjy_word_djbz.png",
	"qmjy_word_jlls.png",
	"qmjy_word_qbbz.png"
}
local var_0_8 = class("Qingmei", function()
	return createBaseLayer()
end)

var_0_8.layout = {
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
					y = 486,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/tsDrinking/xhjy_title_bg.png"
					}
				},
				{
					y = 255,
					x = 457.5,
					type = "sprite",
					pic = {
						path = "res/ui/activity/qingmei/qmjy_bg.jpg"
					}
				},
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/qingmei/qmjy_title.png"
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					y = 470,
					type = "label",
					x = 705,
					color = var_0_3
				},
				{
					y = 480,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 840
				},
				{
					type = "sprite",
					name = "allFinish",
					y = 230,
					visible = false,
					x = 458,
					pic = {
						path = "res/ui/activity/qingmei/qmjy_word_zzdx.png"
					}
				},
				{
					type = "node",
					name = "node_npc",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							x = 3,
							name = "playerPic",
							y = 86,
							type = "sprite",
							scale = 0.6,
							anchorPoint = ccp(0, 0)
						},
						{
							y = 86,
							name = "npcPic",
							type = "sprite",
							x = 912,
							anchorPoint = ccp(1, 0)
						},
						{
							zoomOnTouchDown = true,
							name = "btn_nextGeneral",
							h = 62,
							type = "button",
							w = 195,
							y = 110,
							visible = false,
							x = 800,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 34,
									type = "label",
									x = 97,
									textId = "217318_zww",
									color = var_0_1
								}
							}
						},
						{
							type = "sprite",
							name = "bg_bar",
							y = 392,
							visible = false,
							x = 778,
							pic = {
								path = "res/ui/activity/qingmei/qmjy_pb_di.png"
							},
							children = {
								{
									y = 14,
									type = "sprite",
									x = 155,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_pb_bg.png"
									},
									children = {
										{
											y = 13,
											name = "bar",
											type = "progressbar",
											x = 108,
											pic = {
												path = "res/ui/activity/qingmei/qmjy_pb.png"
											}
										},
										{
											fontSize = 20,
											name = "curProgress",
											y = 13,
											type = "label",
											x = 108
										}
									}
								},
								{
									y = 42,
									name = "drinkLv",
									type = "sprite",
									x = 110,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_word_djbz.png"
									}
								},
								{
									y = 42,
									x = 200,
									type = "sprite",
									scale = 0.55,
									pic = {
										path = "res/ui/activity/generalDrink/jxj_2.png"
									}
								},
								{
									name = "rewardNum",
									type = "atlaslabel",
									pic = "res/ui/common/number/mnlm_word_time_numb.png",
									startCharMap = 48,
									text = "0",
									y = 42,
									itemWidth = 20,
									x = 236,
									itemHeight = 30
								}
							}
						}
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
									type = "node",
									name = "node_drink",
									y = 0,
									visible = false,
									x = 0,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_drink1",
											h = 102,
											type = "button",
											w = 108,
											y = 124,
											x = 278,
											normal = {
												path = "res/ui/activity/qingmei/qmjy_btn_xhj.png"
											},
											touched = {
												path = "res/ui/activity/qingmei/qmjy_btn_xhj_c.png"
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_drink2",
											h = 102,
											type = "button",
											w = 108,
											y = 124,
											x = 458,
											normal = {
												path = "res/ui/activity/qingmei/qmjy_btn_ptj.png"
											},
											touched = {
												path = "res/ui/activity/qingmei/qmjy_btn_ptj_c.png"
											}
										},
										{
											zoomOnTouchDown = true,
											name = "btn_drink3",
											h = 102,
											type = "button",
											w = 108,
											y = 124,
											x = 638,
											normal = {
												path = "res/ui/activity/qingmei/qmjy_btn_qmj.png"
											},
											touched = {
												path = "res/ui/activity/qingmei/qmjy_btn_qmj_c.png"
											}
										},
										{
											y = 46,
											type = "sprite",
											x = 318,
											pic = {
												path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
											},
											children = {
												{
													type = "sprite",
													name = "icon1",
													x = 20,
													visible = false,
													y = 30,
													scale = 0.6,
													pic = {
														path = "res/ui/activity/ironRotary/yuanbao.png"
													}
												},
												{
													fontSize = 22,
													name = "cost1",
													y = 14,
													type = "label",
													x = 20
												},
												{
													fontSize = 25,
													y = 21,
													type = "label",
													x = 45,
													textId = "217315_zww",
													color = var_0_1,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											y = 46,
											type = "sprite",
											x = 498,
											pic = {
												path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
											},
											children = {
												{
													type = "sprite",
													name = "icon2",
													x = 20,
													visible = false,
													y = 30,
													scale = 0.6,
													pic = {
														path = "res/ui/activity/ironRotary/yuanbao.png"
													}
												},
												{
													fontSize = 22,
													name = "cost2",
													y = 14,
													type = "label",
													x = 20
												},
												{
													fontSize = 25,
													y = 21,
													type = "label",
													x = 45,
													textId = "217316_zww",
													color = var_0_3,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											y = 46,
											type = "sprite",
											x = 678,
											pic = {
												path = "res/ui/activity/beast/dnsnjl_word_bg_a.png"
											},
											children = {
												{
													type = "sprite",
													name = "icon3",
													x = 20,
													visible = false,
													y = 30,
													scale = 0.6,
													pic = {
														path = "res/ui/activity/ironRotary/yuanbao.png"
													}
												},
												{
													fontSize = 22,
													name = "cost3",
													y = 14,
													type = "label",
													x = 20
												},
												{
													fontSize = 25,
													y = 21,
													type = "label",
													x = 45,
													textId = "217317_zww",
													color = var_0_6,
													anchorPoint = ccp(0, 0.5)
												}
											}
										}
									}
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_general",
					y = 0,
					visible = false,
					x = 0,
					zorder = 10,
					children = {
						{
							y = 300,
							name = "bg1",
							type = "sprite",
							x = 218,
							pic = {
								path = "res/ui/activity/qingmei/qmjy_head_di.png"
							},
							children = {
								{
									y = 44,
									name = "pic1",
									x = 44,
									type = "sprite"
								},
								{
									type = "sprite",
									name = "light1",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_head_di_light.png"
									}
								},
								{
									type = "sprite",
									name = "finish1",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_seal_zuidao.png"
									}
								}
							}
						},
						{
							y = 330,
							name = "bg2",
							type = "sprite",
							x = 338,
							pic = {
								path = "res/ui/activity/qingmei/qmjy_head_di.png"
							},
							children = {
								{
									y = 44,
									name = "pic2",
									x = 44,
									type = "sprite"
								},
								{
									type = "sprite",
									name = "light2",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_head_di_light.png"
									}
								},
								{
									type = "sprite",
									name = "finish2",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_seal_zuidao.png"
									}
								}
							}
						},
						{
							y = 360,
							name = "bg3",
							type = "sprite",
							x = 458,
							pic = {
								path = "res/ui/activity/qingmei/qmjy_head_di.png"
							},
							children = {
								{
									y = 44,
									name = "pic3",
									x = 44,
									type = "sprite"
								},
								{
									type = "sprite",
									name = "light3",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_head_di_light.png"
									}
								},
								{
									type = "sprite",
									name = "finish3",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_seal_zuidao.png"
									}
								}
							}
						},
						{
							y = 330,
							name = "bg4",
							type = "sprite",
							x = 578,
							pic = {
								path = "res/ui/activity/qingmei/qmjy_head_di.png"
							},
							children = {
								{
									y = 44,
									name = "pic4",
									x = 44,
									type = "sprite"
								},
								{
									type = "sprite",
									name = "light4",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_head_di_light.png"
									}
								},
								{
									type = "sprite",
									name = "finish4",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_seal_zuidao.png"
									}
								}
							}
						},
						{
							y = 300,
							name = "bg5",
							type = "sprite",
							x = 698,
							pic = {
								path = "res/ui/activity/qingmei/qmjy_head_di.png"
							},
							children = {
								{
									y = 44,
									name = "pic5",
									x = 44,
									type = "sprite"
								},
								{
									type = "sprite",
									name = "light5",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_head_di_light.png"
									}
								},
								{
									type = "sprite",
									name = "finish5",
									y = 44,
									visible = false,
									x = 44,
									pic = {
										path = "res/ui/activity/qingmei/qmjy_seal_zuidao.png"
									}
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_finish",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = -15.0003,
							type = "sprite",
							x = 457.7467,
							anchorPoint = ccp(0.5, 0),
							pic = {
								path = "res/ui/activity/godPaper/czzyb_longbg2.png"
							}
						},
						{
							x = 3,
							name = "playerPic1",
							y = 0,
							type = "sprite",
							scale = 0.6,
							anchorPoint = ccp(0, 0)
						},
						{
							zoomOnTouchDown = true,
							name = "btn_nextRound",
							h = 56,
							type = "button",
							w = 212,
							y = 35,
							x = 457.5,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_02.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_02_c.png"
							},
							children = {
								{
									y = 40,
									name = "icon_nextRoundGold",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "nextRoundGold",
									y = 22,
									type = "label",
									x = 40
								},
								{
									fontSize = 25,
									name = "",
									y = 32,
									type = "label",
									x = 130,
									textId = "217319_zww",
									color = var_0_1
								}
							}
						},
						{
							fontSize = 35,
							name = "result",
							y = 150,
							type = "label",
							x = 457.5,
							color = var_0_1
						},
						{
							anchorPointX = 0.5,
							name = "richLine_totalReward",
							y = 100,
							type = "richLine",
							x = 457.5,
							content = {
								{
									type = "label",
									fontSize = 35,
									textId = "217322_zww",
									color = var_0_1
								},
								{
									scale = 0.55,
									type = "sprite",
									pic = {
										path = "res/ui/activity/generalDrink/jxj_2.png"
									}
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/GeneralReward/scpm_word_digit_x.png"
									}
								},
								{
									text = "0",
									name = "totalReward",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 28,
									pic = "res/ui/common/number/gphb_word_digit.png",
									itemHeight = 33
								}
							}
						}
					}
				}
			}
		}
	}
}
var_0_8.tipFrame = {
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
			width = 0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_1
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getQingmeiEvent)
end

function var_0_8.onDrink(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		arg_4_0:showEffectDrink(arg_5_0.action.data, arg_4_1)
	end

	local var_4_1 = arg_4_0.info["drink" .. arg_4_1 .. "Free"]
	local var_4_2 = arg_4_0.info["drink" .. arg_4_1 .. "Cost"]

	if var_4_1 > 0 then
		cmgr.sendRequest(var_4_0, actions.qingmeiDrink, arg_4_1)
	else
		messageBox.showChargeWin("", language.get(217302, var_4_2), "qingmeiDrink", function()
			cmgr.sendRequest(var_4_0, actions.qingmeiDrink, arg_4_1)
		end)
	end
end

function var_0_8.onNextGeneral(arg_7_0)
	local function var_7_0(arg_8_0)
		arg_7_0.newNpc2 = true

		arg_7_0:showPanel(arg_8_0.action.data)
	end

	cmgr.sendRequest(var_7_0, actions.qingmeiNextGeneral)
end

function var_0_8.onNextRound(arg_9_0)
	local function var_9_0(arg_10_0)
		arg_9_0.firstOpen = true

		arg_9_0:showPanel(arg_10_0.action.data)
	end

	if arg_9_0.info.freeRoundTimes > 0 then
		cmgr.sendRequest(var_9_0, actions.qingmeiNextRound)
	else
		messageBox.showChargeWin("", language.get(217303, arg_9_0.info.nextRoundGold), "qingmeiRound", function()
			cmgr.sendRequest(var_9_0, actions.qingmeiNextRound)
		end)
	end
end

function var_0_8.showEffectReward(arg_12_0, arg_12_1)
	if arg_12_0.wineNode then
		arg_12_0.wineNode:removeAllChildrenWithCleanup(true)
	else
		arg_12_0.wineNode = CCSpriteBatchNode:create("res/ui/activity/generalDrink/jxj_2.png")

		arg_12_0.view.widgets.bg:addChild(arg_12_0.wineNode, 100)
	end

	math.randomseed(os.time())

	arg_12_0.wine = {}

	if arg_12_1.rewardWine then
		local var_12_0, var_12_1 = arg_12_0.view.widgets["bg" .. arg_12_0.curr]:getPosition()

		for iter_12_0 = 1, arg_12_1.rewardWine do
			local var_12_2 = var_12_0 + math.random(-40, 40)
			local var_12_3 = var_12_1 + math.random(-20, 20)
			local var_12_4 = var_12_2
			local var_12_5 = var_12_3 - 100 + 1 * (var_12_3 - var_12_1)
			local var_12_6 = CCSprite:create("res/ui/activity/generalDrink/jxj_2.png")

			arg_12_0.wineNode:addChild(var_12_6)
			var_12_6:setScale(0.55)
			var_12_6:setPosition(var_12_2, var_12_3)
			var_12_6:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_12_4, var_12_5))))
			table.insert(arg_12_0.wine, var_12_6)
		end
	elseif arg_12_1.clearReward then
		local var_12_7 = CCSprite:create("res/ui/activity/qingmei/qmjy_word_zzdx.png")
		local var_12_8, var_12_9 = tool.getPositionInScreen(arg_12_0.view.widgets.allFinish)

		var_12_7:setPosition(var_12_8, var_12_9 - 60)
		smgr.showTipSpriteText(var_12_7, function()
			if tolua.isnull(arg_12_0) then
				return
			end

			arg_12_0.view.widgets.allFinish:removeFromParentAndCleanup(true)

			local var_13_0 = CCSprite:create("res/ui/activity/qingmei/qmjy_word_zzdx.png")

			var_13_0:setPosition(458, 230)
			arg_12_0.view.widgets.bg:addChild(var_13_0)

			arg_12_0.view.widgets.allFinish = var_13_0

			for iter_13_0 = 1, 5 do
				local var_13_1, var_13_2 = arg_12_0.view.widgets["bg" .. iter_13_0]:getPosition()

				for iter_13_1 = 1, arg_12_1.clearReward / 5 do
					local var_13_3 = var_13_1 + math.random(-30, 30)
					local var_13_4 = var_13_2 + math.random(-15, 15)
					local var_13_5 = var_13_3
					local var_13_6 = var_13_4 - 100 + 1 * (var_13_4 - var_13_2)
					local var_13_7 = CCSprite:create("res/ui/activity/generalDrink/jxj_2.png")

					arg_12_0.wineNode:addChild(var_13_7)
					var_13_7:setScale(0.55)
					var_13_7:setPosition(var_13_3, var_13_4)
					var_13_7:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_13_5, var_13_6))))
					table.insert(arg_12_0.wine, var_13_7)
				end
			end
		end)
	end

	local var_12_10 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_12_10:registerScriptTouchHandler(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_14_1, arg_14_2)

			if arg_12_0.wine and #arg_12_0.wine > 0 then
				for iter_14_0 = 1, #arg_12_0.wine do
					local var_14_0 = tolua.cast(arg_12_0.wine[iter_14_0], "CCSprite")

					if tool.checkIfTouch(var_14_0, arg_14_1, arg_14_2) then
						arg_12_0.wineNode:removeAllChildrenWithCleanup(true)

						if arg_12_0.maskLayer then
							arg_12_0.maskLayer:removeFromParentAndCleanup(true)

							arg_12_0.maskLayer = nil
						end

						local var_14_1 = {}
						local var_14_2 = {}

						var_14_2.id = 114
						var_14_2.value = #arg_12_0.wine

						table.insert(var_14_1, var_14_2)
						globalAction_gotResource(var_14_1)

						if not arg_12_1.rewardWine and arg_12_1.clearReward then
							arg_12_0:showPanel(arg_12_1)
						end

						if arg_12_1.rewardWine and not arg_12_1.clearReward then
							arg_12_0.newNpc1 = true

							arg_12_0:showPanel(arg_12_1)
						end

						if arg_12_1.rewardWine and arg_12_1.clearReward then
							arg_12_1.rewardWine = nil

							arg_12_0:showEffectReward(arg_12_1)
						end

						return true
					end
				end

				if tool.checkIfTouch(arg_12_0.view.widgets.bg, arg_14_1, arg_14_2) then
					return true
				end
			end

			return false
		elseif arg_14_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_14_1, arg_14_2)

			return true
		elseif arg_14_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_14_1, arg_14_2)

			return true
		end
	end, false, true)
	var_12_10:setTouchEnabled(true)
	arg_12_0.view.widgets.bg:addChild(var_12_10)

	if arg_12_0.maskLayer then
		arg_12_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_12_0.maskLayer = var_12_10
end

function var_0_8.showEffectDrink(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_0.bowlNode then
		arg_15_0.bowlNode:removeAllChildrenWithCleanup(true)
	else
		arg_15_0.bowlNode = CCNode:create()

		arg_15_0.view.widgets.bg:addChild(arg_15_0.bowlNode, 100)
	end

	if arg_15_1.rewardWine or arg_15_1.clearReward then
		for iter_15_0 = 1, 3 do
			arg_15_0.view.widgets["btn_drink" .. iter_15_0]:setEnabled(false)
		end
	end

	arg_15_0.view.widgets.node_general:setVisible(false)
	arg_15_0.view.widgets.btn_nextGeneral:setVisible(false)
	arg_15_0.view.widgets.allFinish:setVisible(false)

	local var_15_0 = arg_15_1.gList[arg_15_0.curr]
	local var_15_1 = CCArray:create()

	var_15_1:addObject(CCProgressTo:create(0.3, var_15_0.curProgress))
	var_15_1:addObject(CCCallFuncN:create(function()
		arg_15_0.view.widgets.curProgress:setString(var_15_0.curProgress .. "%")
	end))

	local var_15_2 = CCSequence:create(var_15_1)

	arg_15_0.view.widgets.bar:runAction(var_15_2)

	local var_15_3 = arg_15_1["drink" .. arg_15_2 .. "Free"]
	local var_15_4 = arg_15_1["drink" .. arg_15_2 .. "Cost"]

	arg_15_0.info["drink" .. arg_15_2 .. "Free"] = var_15_3
	arg_15_0.info["drink" .. arg_15_2 .. "Cost"] = var_15_4

	local var_15_5 = var_15_3 > 0

	arg_15_0.view.widgets["icon" .. arg_15_2]:setVisible(not var_15_5)
	arg_15_0.view.widgets["cost" .. arg_15_2]:setString(var_15_5 and language.get(217305, var_15_3) or var_15_4)
	arg_15_0.view.widgets["cost" .. arg_15_2]:setColor(var_15_5 and var_0_1 or var_0_4)
	arg_15_0.view.widgets["cost" .. arg_15_2]:setPositionY(var_15_5 and 21 or 14)

	for iter_15_1 = 1, 2 do
		local var_15_6 = CCSprite:create("res/ui/activity/generalDrink/zjlyx_wan.png")

		var_15_6:setVisible(false)
		var_15_6:setPosition(iter_15_1 == 1 and 383 or 533, 230)
		arg_15_0.bowlNode:addChild(var_15_6)

		local var_15_7 = CCArray:create()

		var_15_7:addObject(CCShow:create())
		var_15_7:addObject(CCDelayTime:create(0.15))
		var_15_7:addObject(CCMoveBy:create(0.3, ccp(0, 30)))
		var_15_7:addObject(CCDelayTime:create(0.15))

		if iter_15_1 == 2 then
			var_15_7:addObject(CCCallFunc:create(function()
				local var_17_0 = CCSprite:create("res/ui/activity/qingmei/qmjy_word_jfzjqbs.png")

				var_17_0:setPosition(458, 330)
				var_17_0:setScale(1.5)
				arg_15_0.bowlNode:addChild(var_17_0)

				local var_17_1 = CCArray:create()

				var_17_1:addObject(CCScaleTo:create(0.3, 1))
				var_17_1:addObject(CCDelayTime:create(0.4))
				var_17_1:addObject(CCFadeOut:create(0.3))
				var_17_1:addObject(CCCallFunc:create(function()
					if arg_15_1.rewardWine then
						arg_15_0.view.widgets.node_general:setVisible(true)
						arg_15_0.view.widgets["finish" .. arg_15_0.curr]:setVisible(true)
						arg_15_0:showEffectReward(arg_15_1)
					elseif arg_15_1.clearReward then
						-- block empty
					else
						arg_15_0:showPanel(arg_15_1)
					end
				end))

				local var_17_2 = CCSequence:create(var_17_1)

				var_17_0:runAction(var_17_2)
			end))
		end

		var_15_7:addObject(CCEaseSineOut:create(CCMoveBy:create(0.3, ccp(iter_15_1 == 1 and 40 or -40, 0))))
		var_15_7:addObject(CCDelayTime:create(0.2))
		var_15_7:addObject(CCFadeOut:create(0.3))

		local var_15_8 = CCSequence:create(var_15_7)

		var_15_6:runAction(var_15_8)
	end

	if arg_15_1.rewardWine then
		arg_15_0.view.widgets.npcPic:stopAllActions()
		arg_15_0.view.widgets.npcPic:setPositionX(912)
		arg_15_0.view.widgets.npcPic:setColor(var_0_3)

		local var_15_9 = CCArray:create()

		var_15_9:addObject(CCMoveBy:create(0.07, ccp(10, 0)))
		var_15_9:addObject(CCMoveBy:create(0.07, ccp(-10, 0)))

		local var_15_10 = CCSequence:create(var_15_9)

		arg_15_0.view.widgets.npcPic:runAction(CCRepeatForever:create(var_15_10))

		local var_15_11 = CCArray:create()

		var_15_11:addObject(CCDelayTime:create(0.6))
		var_15_11:addObject(CCCallFunc:create(function()
			arg_15_0.view.widgets.npcPic:stopAllActions()
			arg_15_0.view.widgets.npcPic:setPositionX(912)
			arg_15_0.view.widgets.npcPic:setColor(ccc3(255, 255, 255))
		end))

		local var_15_12 = CCSequence:create(var_15_11)

		arg_15_0.view.widgets.npcPic:runAction(var_15_12)
	end
end

function var_0_8.showTip(arg_20_0)
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

	uiutil.initWidgets(var_20_3, arg_20_0.tipFrame)
	var_20_0:addChild(var_20_3.widgets.tipFrame)

	local var_20_4 = arg_20_0.view.widgets.btn_tip
	local var_20_5 = ((((((language.get("217315_zww") .. "\n" .. language.get(217308) .. "\n") .. language.get("217316_zww") .. "\n" .. language.get(217309) .. "\n") .. language.get("217317_zww") .. "\n" .. language.get(217310) .. "\n") .. "\n" .. language.get(217311) .. "\n") .. language.get(217312) .. "\n") .. language.get(217313) .. "\n") .. "\n" .. language.get(217307)

	var_20_3.widgets.tipMsg:setString(var_20_5)

	local var_20_6, var_20_7 = tool.getPositionInScreen(var_20_4)
	local var_20_8 = var_20_6 + 20
	local var_20_9 = var_20_7 - 20
	local var_20_10 = var_20_3.widgets.tipMsg:getContentSize().width
	local var_20_11 = var_20_3.widgets.tipMsg:getContentSize().height

	var_20_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_20_10 + 30, var_20_11 + 30))
	var_20_3.widgets.tipFrame:setPosition(ccp(var_20_8, var_20_9))
	var_20_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_20_3.widgets.tipFrame:setVisible(true)
end

function var_0_8.showPanel(arg_22_0, arg_22_1)
	arg_22_0.info = arg_22_1

	arg_22_0.view.widgets.node_general:setVisible(true)

	local var_22_0 = arg_22_1.roundFinish == 1

	arg_22_0.view.widgets.node_finish:setVisible(var_22_0)
	arg_22_0.view.widgets.node_npc:setVisible(not var_22_0)
	arg_22_0.view.widgets.node_drink:setVisible(not var_22_0)

	local var_22_1 = true

	arg_22_0.curr = 0

	for iter_22_0, iter_22_1 in ipairs(arg_22_1.gList) do
		local var_22_2 = iter_22_1.isCurr == 1
		local var_22_3 = iter_22_1.finish == true

		iter_22_1.pic = string.match(iter_22_1.pic, "(%a+)")

		arg_22_0.view.widgets["pic" .. iter_22_0]:setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. iter_22_1.pic .. ".jpg"):displayFrame())
		arg_22_0.view.widgets["light" .. iter_22_0]:setVisible(var_22_2)
		arg_22_0.view.widgets["finish" .. iter_22_0]:setVisible(var_22_3)

		if var_22_1 and not var_22_3 then
			var_22_1 = false
		end

		if var_22_2 then
			arg_22_0.curr = iter_22_0
		end

		if not var_22_0 and var_22_2 then
			arg_22_0.view.widgets.bar:setPercentage(iter_22_1.curProgress)
			arg_22_0.view.widgets.curProgress:setString(iter_22_1.curProgress .. "%")
			arg_22_0.view.widgets.drinkLv:setDisplayFrame(CCSprite:create("res/ui/activity/qingmei/" .. var_0_7[iter_22_1.drinkLv]):displayFrame())
			arg_22_0.view.widgets.rewardNum:setString(tostring(iter_22_1.rewardNum))
			arg_22_0.view.widgets.npcPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/halfPic/halfPic_%s.png", iter_22_1.pic)):displayFrame())
		end
	end

	for iter_22_2 = 1, 3 do
		arg_22_0.view.widgets["btn_drink" .. iter_22_2]:setEnabled(true)
	end

	arg_22_0.view.widgets.npcPic:stopAllActions()
	arg_22_0.view.widgets.npcPic:setPositionX(912)
	arg_22_0.view.widgets.npcPic:setColor(ccc3(255, 255, 255))
	arg_22_0.view.widgets.allFinish:removeFromParentAndCleanup(true)

	local var_22_4

	if var_22_1 then
		var_22_4 = CCSprite:create("res/ui/activity/qingmei/qmjy_word_zzdx.png")
	else
		var_22_4 = GraySprite:create("res/ui/activity/qingmei/qmjy_word_zzdx.png")
	end

	var_22_4:setPosition(458, 230)
	arg_22_0.view.widgets.bg:addChild(var_22_4)

	arg_22_0.view.widgets.allFinish = var_22_4

	if arg_22_0.firstOpen then
		if arg_22_0.curr > 0 then
			arg_22_0.view.widgets["light" .. arg_22_0.curr]:setVisible(false)
		end

		for iter_22_3 = 1, 5 do
			arg_22_0.view.widgets["bg" .. iter_22_3]:setScaleX(0)
			arg_22_0.view.widgets["bg" .. iter_22_3]:stopAllActions()

			local var_22_5 = CCArray:create()

			var_22_5:addObject(CCScaleTo:create(0.3, 1, 1))

			if arg_22_0.curr == iter_22_3 then
				var_22_5:addObject(CCCallFunc:create(function()
					arg_22_0.view.widgets["light" .. iter_22_3]:setVisible(true)
				end))
			end

			arg_22_0.view.widgets["bg" .. iter_22_3]:runAction(CCSequence:create(var_22_5))
		end
	end

	if var_22_0 then
		arg_22_0.view.widgets.result:setString(language.get(var_22_1 and "217321_zww" or "217320_zww"))
		arg_22_0.view.widgets.totalReward:setString(tostring(arg_22_1.totalReward))
		arg_22_0.view.widgets.richLine_totalReward:reorder()

		local var_22_6 = arg_22_1.freeRoundTimes > 0

		arg_22_0.view.widgets.icon_nextRoundGold:setVisible(not var_22_6)
		arg_22_0.view.widgets.nextRoundGold:setString(var_22_6 and language.get(136204, arg_22_1.freeRoundTimes) or arg_22_1.nextRoundGold)
		arg_22_0.view.widgets.nextRoundGold:setColor(var_22_6 and var_0_1 or var_0_4)
		arg_22_0.view.widgets.nextRoundGold:setPositionY(var_22_6 and 32 or 22)

		if arg_22_0.firstOpen then
			local var_22_7 = CCArray:create()

			var_22_7:addObject(CCHide:create())
			var_22_7:addObject(CCDelayTime:create(0.3))
			var_22_7:addObject(CCShow:create())
			arg_22_0.view.widgets.allFinish:runAction(CCSequence:create(var_22_7))
		end
	else
		for iter_22_4 = 1, 3 do
			local var_22_8 = arg_22_1["drink" .. iter_22_4 .. "Free"]
			local var_22_9 = arg_22_1["drink" .. iter_22_4 .. "Cost"]
			local var_22_10 = var_22_8 > 0

			arg_22_0.view.widgets["icon" .. iter_22_4]:setVisible(not var_22_10)
			arg_22_0.view.widgets["cost" .. iter_22_4]:setString(var_22_10 and language.get(217305, var_22_8) or var_22_9)
			arg_22_0.view.widgets["cost" .. iter_22_4]:setColor(var_22_10 and var_0_1 or var_0_4)
			arg_22_0.view.widgets["cost" .. iter_22_4]:setPositionY(var_22_10 and 21 or 14)
		end

		if arg_22_0.firstOpen then
			arg_22_0.view.widgets.node_drink:setPositionY(-166)
			arg_22_0.view.widgets.node_drink:stopAllActions()

			local var_22_11 = CCArray:create()

			var_22_11:addObject(CCDelayTime:create(0.3))
			var_22_11:addObject(CCMoveTo:create(0.3, ccp(0, 0)))
			arg_22_0.view.widgets.node_drink:runAction(CCSequence:create(var_22_11))
		end

		arg_22_0.view.widgets.btn_nextGeneral:setVisible(true)

		if arg_22_0.firstOpen or arg_22_0.newNpc1 or arg_22_0.newNpc2 then
			if arg_22_0.firstOpen or arg_22_0.newNpc1 then
				arg_22_0.view.widgets.btn_nextGeneral:setVisible(false)
				arg_22_0.view.widgets.bg_bar:setVisible(false)
				arg_22_0.view.widgets.allFinish:setVisible(false)
			end

			arg_22_0.view.widgets.npcPic:setOpacity(0)
			arg_22_0.view.widgets.npcPic:setPositionX(1152)
			arg_22_0.view.widgets.npcPic:stopAllActions()

			local var_22_12 = CCFadeIn:create(0.3)
			local var_22_13 = CCMoveTo:create(0.3, ccp(912, 86))
			local var_22_14 = CCArray:create()

			if arg_22_0.firstOpen then
				var_22_14:addObject(CCDelayTime:create(0.3))
			end

			var_22_14:addObject(CCSpawn:createWithTwoActions(var_22_12, var_22_13))
			var_22_14:addObject(CCDelayTime:create(0.1))
			var_22_14:addObject(CCCallFunc:create(function()
				arg_22_0.view.widgets.btn_nextGeneral:setVisible(true)
				arg_22_0.view.widgets.bg_bar:setVisible(true)
				arg_22_0.view.widgets.allFinish:setVisible(true)
			end))
			arg_22_0.view.widgets.npcPic:runAction(CCSequence:create(var_22_14))
		end
	end

	arg_22_0.firstOpen = false
	arg_22_0.newNpc1 = false
	arg_22_0.newNpc2 = false
end

function var_0_8.ctor(arg_25_0, arg_25_1, arg_25_2)
	log.info("@@ 青梅酒宴活动")

	arg_25_0.view = {}

	uiutil.initWidgets(arg_25_0.view, arg_25_0.layout)

	arg_25_0.leftTime = arg_25_0.view.widgets.leftTime

	if arg_25_1 then
		arg_25_0:addChild(arg_25_0.view.widgets.root)
		arg_25_1:addChild(arg_25_0)
	end

	arg_25_0.view.widgets.scrollview:setTouchEnabled(false)
	arg_25_0.view.widgets.playerPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())
	arg_25_0.view.widgets.playerPic1:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())
	arg_25_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_25_0:showTip()
	end, CCControlEventTouchUpInside)

	for iter_25_0 = 1, 3 do
		arg_25_0.view.widgets["btn_drink" .. iter_25_0]:addHandleOfControlEvent(function()
			log.info("btn_drink" .. iter_25_0)
			arg_25_0:onDrink(iter_25_0)
		end, CCControlEventTouchUpInside)
	end

	arg_25_0.view.widgets.btn_nextGeneral:addHandleOfControlEvent(function()
		log.info("btn_nextGeneral")
		arg_25_0:onNextGeneral()
	end, CCControlEventTouchUpInside)
	arg_25_0.view.widgets.btn_nextRound:addHandleOfControlEvent(function()
		log.info("btn_nextRound")
		arg_25_0:onNextRound()
	end, CCControlEventTouchUpInside)

	arg_25_0.firstOpen = true

	arg_25_0:showPanel(arg_25_2)
end

return var_0_8
