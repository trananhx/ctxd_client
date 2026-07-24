local var_0_0 = tool.hexToRgb("#ECDEA7")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = colorQuality[0]
local var_0_6 = class("silkMarket", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	name = "panel",
	type = "sprite9",
	preferedSize = CCSizeMake(916, 532),
	middleRect = CCRectMake(10, 10, 70, 70),
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	pic = {
		path = "res/ui/common/panel/comm_view.png"
	},
	children = {
		{
			y = 420,
			x = 458,
			type = "sprite",
			pic = {
				path = "res/ui/silk/market/scpm_bg.jpg"
			}
		},
		{
			y = 40,
			name = "node1",
			type = "node",
			x = 168,
			children = {
				{
					y = 148,
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/silk/market/scpm_samll_view.png"
					},
					children = {
						{
							y = 95,
							type = "sprite",
							x = 126,
							pic = {
								path = "res/ui/silk/market/scpm_samll_view_icon.png"
							},
							children = {
								{
									y = 39,
									x = 39,
									type = "sprite",
									pic = {
										path = "res/ui/world/world_silk.jpg"
									}
								}
							}
						},
						{
							y = 71,
							name = "bg_num3",
							type = "sprite",
							x = 126,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 25,
							name = "num1",
							y = 71,
							type = "label",
							x = 126,
							color = var_0_0
						},
						{
							fontSize = 20,
							name = "info1",
							y = 35,
							type = "label",
							x = 110,
							color = var_0_0,
							anchorPoint = ccp(1, 0.5)
						},
						{
							y = 32,
							x = 130,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							fontSize = 20,
							name = "gold1",
							y = 35,
							type = "label",
							x = 150,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn1",
					h = 75,
					type = "button",
					w = 258,
					y = 0,
					x = 0,
					normal = {
						frame = true,
						path = "btn4_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn4_yel_c.png"
					},
					anchorPoint = ccp(0.5, 0),
					children = {
						{
							fontSize = 30,
							name = "lbl_btn1",
							y = 37,
							type = "label",
							x = 129,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			y = 40,
			name = "node2",
			type = "node",
			x = 458,
			children = {
				{
					y = 148,
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/silk/market/scpm_samll_view.png"
					},
					children = {
						{
							y = 95,
							type = "sprite",
							x = 126,
							pic = {
								path = "res/ui/silk/market/scpm_samll_view_icon.png"
							},
							children = {
								{
									y = 39,
									x = 39,
									type = "sprite",
									pic = {
										path = "res/ui/world/world_silk.jpg"
									}
								}
							}
						},
						{
							y = 71,
							name = "bg_num4",
							type = "sprite",
							x = 126,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 25,
							name = "num2",
							y = 71,
							type = "label",
							x = 126,
							color = var_0_0
						},
						{
							fontSize = 20,
							name = "info2",
							y = 35,
							type = "label",
							x = 110,
							color = var_0_0,
							anchorPoint = ccp(1, 0.5)
						},
						{
							y = 32,
							x = 130,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							fontSize = 20,
							name = "gold2",
							y = 35,
							type = "label",
							x = 150,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn2",
					h = 75,
					type = "button",
					w = 258,
					y = 0,
					x = 0,
					normal = {
						frame = true,
						path = "btn4_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn4_yel_c.png"
					},
					anchorPoint = ccp(0.5, 0),
					children = {
						{
							fontSize = 30,
							name = "lbl_btn2",
							y = 37,
							type = "label",
							x = 129,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			y = 40,
			name = "node3",
			type = "node",
			x = 748,
			children = {
				{
					y = 148,
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/silk/market/scpm_samll_view.png"
					},
					children = {
						{
							y = 95,
							type = "sprite",
							x = 126,
							pic = {
								path = "res/ui/silk/market/scpm_samll_view_icon.png"
							},
							children = {
								{
									y = 39,
									x = 39,
									type = "sprite",
									pic = {
										path = "res/ui/world/world_silk.jpg"
									}
								}
							}
						},
						{
							y = 71,
							name = "bg_num5",
							type = "sprite",
							x = 126,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 25,
							name = "num3",
							y = 71,
							type = "label",
							x = 126,
							color = var_0_0
						},
						{
							fontSize = 20,
							name = "info3",
							y = 35,
							type = "label",
							x = 110,
							color = var_0_0,
							anchorPoint = ccp(1, 0.5)
						},
						{
							y = 32,
							x = 130,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							fontSize = 20,
							name = "gold3",
							y = 35,
							type = "label",
							x = 150,
							color = var_0_3,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					name = "btn3",
					h = 75,
					type = "button",
					w = 258,
					y = 0,
					x = 0,
					normal = {
						frame = true,
						path = "btn4_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn4_yel_c.png"
					},
					anchorPoint = ccp(0.5, 0),
					children = {
						{
							fontSize = 30,
							name = "lbl_btn3",
							y = 37,
							type = "label",
							x = 129,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			type = "node",
			name = "node_sell",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 440,
					type = "sprite",
					x = 230,
					pic = {
						path = "res/ui/silk/market/scpm_sc_long.png"
					},
					children = {
						{
							w = 318,
							name = "btn_tips_silk1",
							h = 56,
							type = "button",
							y = 28,
							x = 159,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							y = 29,
							x = 28,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/task/get_icon_silk.png"
							}
						},
						{
							fontSize = 25,
							name = "num_total1",
							y = 29,
							type = "label",
							x = 55,
							color = var_0_0,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 400,
					type = "sprite",
					x = 510,
					pic = {
						path = "res/ui/silk/market/scpm_sc_icon_d.png"
					},
					children = {
						{
							y = 108,
							x = 68,
							type = "sprite",
							pic = {
								path = "res/ui/world/world_silk.jpg"
							}
						},
						{
							name = "btn_redeem",
							h = 54,
							type = "button",
							w = 125,
							y = 33,
							x = 68,
							normal = {
								frame = true,
								path = "btn2_gre_a.png"
							},
							touched = {
								frame = true,
								path = "btn2_gre_c.png"
							},
							disable = {
								frame = true,
								path = "btn2_gre_g.png"
							},
							children = {
								{
									fontSize = 25,
									y = 27,
									type = "label",
									x = 62.5,
									textId = 122123,
									color = var_0_0
								}
							}
						},
						{
							y = 84,
							name = "bg_num1",
							type = "sprite",
							x = 68,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 25,
							name = "num_silk_sell1",
							y = 84,
							type = "label",
							x = 68
						},
						{
							y = 186,
							x = 68,
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 25,
							name = "state_silk",
							y = 186,
							type = "label",
							x = 68,
							color = var_0_0
						}
					}
				},
				{
					y = 400,
					type = "sprite",
					x = 790,
					pic = {
						path = "res/ui/silk/market/scpm_sc_icon_d.png"
					},
					children = {
						{
							y = 116,
							x = 68,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19.png"
							}
						},
						{
							name = "btn_gold",
							h = 54,
							type = "button",
							w = 125,
							y = 33,
							x = 68,
							normal = {
								frame = true,
								path = "btn2_yel_a.png"
							},
							touched = {
								frame = true,
								path = "btn2_yel_c.png"
							},
							disable = {
								frame = true,
								path = "btn2_yel_g.png"
							},
							children = {
								{
									fontSize = 25,
									y = 27,
									type = "label",
									x = 62.5,
									textId = 122124,
									color = var_0_0
								}
							}
						},
						{
							y = 84,
							name = "bg_num2",
							type = "sprite",
							x = 68,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							y = 186,
							x = 68,
							type = "sprite",
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							}
						},
						{
							fontSize = 25,
							name = "state_gold",
							y = 186,
							type = "label",
							x = 68,
							color = var_0_0
						},
						{
							fontSize = 25,
							name = "num_gold_sell",
							y = 84,
							type = "label",
							x = 68
						}
					}
				},
				{
					y = 405,
					type = "sprite",
					x = 645,
					pic = {
						path = "res/ui/silk/market/scpm_kdh_d.png"
					},
					children = {
						{
							fontSize = 25,
							y = 44,
							type = "label",
							x = 108,
							textId = 122138,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			type = "node",
			name = "node_buy",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 470,
					type = "sprite",
					x = 230,
					pic = {
						path = "res/ui/silk/market/scpm_sc_long.png"
					},
					children = {
						{
							w = 318,
							name = "btn_tips_gold",
							h = 56,
							type = "button",
							y = 28,
							x = 159,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							y = 25,
							x = 28,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							fontSize = 25,
							name = "num_gold_user",
							y = 29,
							type = "label",
							x = 55,
							color = var_0_0,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 410,
					type = "sprite",
					x = 230,
					pic = {
						path = "res/ui/silk/market/scpm_sc_long.png"
					},
					children = {
						{
							w = 318,
							name = "btn_tips_silk2",
							h = 56,
							type = "button",
							y = 28,
							x = 159,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							y = 29,
							x = 28,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/task/get_icon_silk.png"
							}
						},
						{
							fontSize = 25,
							name = "num_total2",
							y = 29,
							type = "label",
							x = 55,
							color = var_0_0,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 420,
					type = "sprite",
					x = 660,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							name = "num_silk_p1",
							type = "atlaslabel",
							pic = "res/ui/common/number/scpm_word_digit.png",
							startCharMap = 48,
							text = "0",
							y = 35,
							itemWidth = 21,
							x = 90,
							itemHeight = 32,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = 35,
							type = "sprite",
							x = 50,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							},
							children = {
								{
									x = 40,
									name = "icon_silk",
									y = 40,
									type = "sprite",
									scale = 1.3,
									pic = {
										path = "res/ui/task/get_icon_silk.png"
									}
								}
							}
						},
						{
							y = 35,
							name = "num_silk_p2",
							type = "sprite",
							x = 350,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/silk/market/scpm_word_csz1.png"
							}
						}
					}
				}
			}
		},
		{
			y = 340,
			name = "bg_msg",
			type = "sprite",
			x = 215,
			pic = {
				path = "res/ui/silk/market/scpm_prompt.png"
			}
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
	anchorPoint = ccp(0.5, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 220,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_0
		}
	}
}

function var_0_6.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getSilkMarketInfo)
end

function var_0_6.onSellSilk(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		arg_4_0:refresh()

		local var_5_0 = CCSprite:create("res/ui/task/get_icon_silk.png")
		local var_5_1, var_5_2 = tool.getPositionInScreen(arg_4_0.view.widgets["num" .. arg_4_1])
		local var_5_3, var_5_4 = tool.getPositionInScreen(arg_4_0.view.widgets.num_silk_sell1)

		var_5_0:setPosition(ccp(var_5_1, var_5_2))
		var_5_0:setScale(1.3)
		smgr.rootLayer:addChild(var_5_0, 60000)

		local var_5_5 = 0.7
		local var_5_6 = CCMoveTo:create(var_5_5, ccp(var_5_3, var_5_4))
		local var_5_7 = CCScaleTo:create(var_5_5, 0.6)
		local var_5_8 = CCArray:create()

		var_5_8:addObject(CCSpawn:createWithTwoActions(var_5_6, var_5_7))
		var_5_8:addObject(CCCallFuncN:create(function()
			var_5_0:removeFromParentAndCleanup(true)
		end))

		local var_5_9 = CCSequence:create(var_5_8)

		var_5_0:runAction(var_5_9)
	end

	local var_4_1 = arg_4_0.info.toSaleList[arg_4_1].goodsId

	cmgr.sendRequest(var_4_0, actions.sellSilk, var_4_1)
end

function var_0_6.onBuySilk(arg_7_0, arg_7_1)
	local function var_7_0(arg_8_0)
		arg_7_0:refresh()

		local var_8_0 = arg_8_0.action.data.tradeInfo
		local var_8_1 = 0

		for iter_8_0, iter_8_1 in pairs(var_8_0) do
			var_8_1 = var_8_1 + iter_8_1.silkNum

			if type(iter_8_1.sellerName) ~= "string" then
				iter_8_1.sellerName = user.player.name
			end

			table.insert(user.silkTradeInfo, iter_8_1)
			arg_7_0:updateMsg()
		end

		arg_7_0.view.widgets.icon_silk:setVisible(false)

		local var_8_2 = CCSprite:create("res/ui/task/get_icon_silk.png")
		local var_8_3, var_8_4 = tool.getPositionInScreen(arg_7_0.view.widgets.icon_silk)
		local var_8_5, var_8_6 = tool.getPositionInScreen(arg_7_0.view.widgets["num" .. arg_7_1])

		var_8_2:setPosition(ccp(var_8_3, var_8_4))
		var_8_2:setScale(1.3)
		smgr.rootLayer:addChild(var_8_2, 60000)

		local var_8_7 = 0.7
		local var_8_8 = CCMoveTo:create(var_8_7, ccp(var_8_5, var_8_6))
		local var_8_9 = CCFadeOut:create(var_8_7)
		local var_8_10 = CCArray:create()

		var_8_10:addObject(CCSpawn:createWithTwoActions(var_8_8, var_8_9))
		var_8_10:addObject(CCCallFuncN:create(function()
			arg_7_0.view.widgets.icon_silk:setVisible(true)

			local var_9_0 = {}
			local var_9_1 = {}

			var_9_1.id = 55
			var_9_1.value = var_8_1

			table.insert(var_9_0, var_9_1)
			globalAction_gotResource(var_9_0)
			var_8_2:removeFromParentAndCleanup(true)
		end))

		local var_8_11 = CCSequence:create(var_8_10)

		var_8_2:runAction(var_8_11)
	end

	local var_7_1 = arg_7_0.info.canBuyList[arg_7_1]
	local var_7_2 = 0

	messageBox.showChargeWin("", language.get(122133, var_7_1.goldNum, var_7_1.silkNum), "buySilkGold", function()
		cmgr.sendRequest(var_7_0, actions.buySilk, var_7_1.goodsId, var_7_2)
	end)
end

function var_0_6.onRecvSilkGold(arg_11_0)
	local function var_11_0(arg_12_0)
		arg_11_0:refresh()

		local var_12_0 = arg_11_0.info.soldSilkGoldNum
		local var_12_1 = {}
		local var_12_2 = {}

		var_12_2.id = 19
		var_12_2.value = var_12_0

		table.insert(var_12_1, var_12_2)
		globalAction_gotResource(var_12_1)
	end

	cmgr.sendRequest(var_11_0, actions.recvSilkGold)
end

function var_0_6.onRedeemSilk(arg_13_0)
	local function var_13_0(arg_14_0)
		arg_13_0:refresh()

		local var_14_0 = arg_13_0.info.onSaleSilkNum
		local var_14_1 = {}
		local var_14_2 = {}

		var_14_2.id = 55
		var_14_2.value = var_14_0

		table.insert(var_14_1, var_14_2)
		globalAction_gotResource(var_14_1)
	end

	cmgr.sendRequest(var_13_0, actions.redeemSilk)
end

function var_0_6.onBtnCommonTap(arg_15_0, arg_15_1)
	if arg_15_0.info.isFunctionOpen then
		arg_15_0:onBuySilk(arg_15_1)
	else
		arg_15_0:onSellSilk(arg_15_1)
	end
end

function var_0_6.updateMsg(arg_16_0)
	local var_16_0 = 60
	local var_16_1 = 35
	local var_16_2 = 50
	local var_16_3 = 0.7

	local function var_16_4()
		local var_17_0 = user.silkTradeInfo[arg_16_0.msgIdx]

		if type(var_17_0.sellerName) ~= "string" then
			var_17_0.sellerName = user.player.name
		end

		local var_17_1 = CCLabelTTF:create("", "Thonburi", 20)

		var_17_1:setDimensions(CCSizeMake(380, 0))
		var_17_1:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_17_1:setString(language.get(122135, var_17_0.sellerName, var_17_0.silkNum))
		var_17_1:setColor(var_0_0)
		var_17_1:setAnchorPoint(ccp(0, 0.5))
		var_17_1:setPosition(ccp(var_16_0, var_16_1 - var_16_2))
		arg_16_0.msgLayer:addChild(var_17_1)

		local var_17_2 = CCArray:create()

		var_17_2:addObject(CCEaseSineOut:create(CCMoveBy:create(var_16_3, ccp(0, var_16_2))))
		var_17_2:addObject(CCDelayTime:create(3 - var_16_3))
		var_17_2:addObject(CCCallFuncN:create(function()
			arg_16_0:updateMsg()
		end))

		local var_17_3 = CCSequence:create(var_17_2)

		var_17_1:runAction(var_17_3)

		arg_16_0.msg = var_17_1
	end

	arg_16_0.msgIdx = arg_16_0.msgIdx or 1

	local var_16_5 = #user.silkTradeInfo

	if var_16_5 > 0 then
		if arg_16_0.msg then
			if var_16_5 > 1 then
				local var_16_6 = arg_16_0.msg

				arg_16_0.msgIdx = arg_16_0.msgIdx + 1

				if var_16_5 < arg_16_0.msgIdx then
					arg_16_0.msgIdx = 1
				end

				local var_16_7 = CCArray:create()

				var_16_7:addObject(CCEaseSineOut:create(CCMoveBy:create(var_16_3, ccp(0, var_16_2))))
				var_16_7:addObject(CCCallFuncN:create(function()
					var_16_6:removeFromParentAndCleanup(true)
				end))

				local var_16_8 = CCSequence:create(var_16_7)

				var_16_6:runAction(var_16_8)
				var_16_4()
			end
		else
			var_16_4()
		end
	end
end

function var_0_6.showEffect(arg_20_0)
	return
end

function var_0_6.showPanel(arg_21_0, arg_21_1)
	arg_21_0.info = arg_21_1

	local var_21_0 = not arg_21_1.isFunctionOpen

	arg_21_0.view.widgets.node_sell:setVisible(var_21_0)
	arg_21_0.view.widgets.node_buy:setVisible(not var_21_0)

	for iter_21_0 = 1, 3 do
		arg_21_0.view.widgets["info" .. iter_21_0]:setString(language.get(var_21_0 and 122139 or 72001))
		arg_21_0.view.widgets["lbl_btn" .. iter_21_0]:setString(language.get(var_21_0 and 102034 or 101018))
	end

	local var_21_1 = var_21_0 and arg_21_0.view.widgets.num_total1 or arg_21_0.view.widgets.num_total2

	var_21_1:setString(arg_21_1.totalSilkNum)
	var_21_1:setColor(arg_21_1.totalSilkNum < arg_21_1.silkMax and var_0_0 or var_0_2)

	local var_21_2 = var_21_0 and arg_21_1.toSaleList or arg_21_1.canBuyList

	for iter_21_1, iter_21_2 in pairs(var_21_2) do
		arg_21_0.view.widgets["num" .. iter_21_1]:setString(iter_21_2.silkNum)
		arg_21_0.view.widgets["gold" .. iter_21_1]:setString(iter_21_2.goldNum)
	end

	if var_21_0 then
		local var_21_3 = arg_21_1.onSaleSilkNum > 0

		arg_21_0.view.widgets.num_silk_sell1:setString(arg_21_1.onSaleSilkNum)
		arg_21_0.view.widgets.state_silk:setString(language.get(var_21_3 and 122130 or 122136))
		arg_21_0.view.widgets.btn_redeem:setEnabled(var_21_3)

		local var_21_4 = arg_21_1.soldSilkGoldNum > 0

		arg_21_0.view.widgets.num_gold_sell:setString(arg_21_1.soldSilkGoldNum)
		arg_21_0.view.widgets.state_gold:setString(language.get(var_21_4 and 122131 or 122137))
		arg_21_0.view.widgets.btn_gold:setEnabled(var_21_4)
	else
		arg_21_0.view.widgets.num_gold_user:setString(arg_21_1.totalUserGold)
		arg_21_0.view.widgets.num_silk_p1:setString(arg_21_1.totalOnSaleSilkNum)
		arg_21_0.view.widgets.num_silk_p2:setVisible(false)

		local var_21_5 = arg_21_0.view.widgets.num_silk_p1:getPositionX()
		local var_21_6 = arg_21_0.view.widgets.num_silk_p1:getContentSize().width

		arg_21_0.view.widgets.num_silk_p2:setPositionX(var_21_5 + var_21_6)
		arg_21_0.view.widgets.num_silk_p2:setVisible(true)
	end

	arg_21_0:updateMsg()
end

function var_0_6.showTip(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if arg_22_0.view.widgets.tipFrame then
		arg_22_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_22_0.view.widgets.tipFrame = nil
	end

	if arg_22_1 then
		local var_22_0, var_22_1 = tool.getPositionInScreen(arg_22_2)

		uiutil.initWidgets(arg_22_0.view, arg_22_0.tipFrame)
		arg_22_0:addChild(arg_22_0.view.widgets.tipFrame)
		arg_22_0.view.widgets.tipMsg:setDimensions(CCSizeMake(220, 0))

		local var_22_2 = ""

		if arg_22_3 == 1 or arg_22_3 == 2 then
			var_22_2 = language.get(122129, arg_22_0.info.silkMax)
		elseif arg_22_3 == 3 then
			var_22_2 = language.get(122128)
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

function var_0_6.ctor(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.view = {}

	uiutil.initWidgets(arg_23_0.view, arg_23_0.layout)
	arg_23_0:addChild(arg_23_0.view.widgets.panel)

	if arg_23_1 then
		arg_23_1:addChild(arg_23_0)
	end

	for iter_23_0 = 1, 5 do
		local var_23_0 = arg_23_0.view.widgets["bg_num" .. iter_23_0]

		var_23_0:setScaleX(0.6)
		var_23_0:setScaleY(0.8)
	end

	local var_23_1 = CCLayerColor:create(ccc4(0, 0, 0, 0), 500, 55)
	local var_23_2 = CCScrollView:create(CCSizeMake(500, 55), var_23_1)

	var_23_2:setPosition(ccp(0, 0))
	var_23_2:setTouchEnabled(false)
	arg_23_0.view.widgets.bg_msg:addChild(var_23_2)

	arg_23_0.msgLayer = var_23_1

	arg_23_0.view.widgets.btn_redeem:addHandleOfControlEvent(function()
		arg_23_0:onRedeemSilk()
	end, CCControlEventTouchUpInside)
	arg_23_0.view.widgets.btn_gold:addHandleOfControlEvent(function()
		arg_23_0:onRecvSilkGold()
	end, CCControlEventTouchUpInside)

	for iter_23_1 = 1, 3 do
		arg_23_0.view.widgets["btn" .. iter_23_1]:addHandleOfControlEvent(function()
			arg_23_0:onBtnCommonTap(iter_23_1)
		end, CCControlEventTouchUpInside)
	end

	local var_23_3 = {
		"btn_tips_silk1",
		"btn_tips_silk2",
		"btn_tips_gold"
	}

	for iter_23_2 = 1, 3 do
		local var_23_4 = arg_23_0.view.widgets[var_23_3[iter_23_2]]

		var_23_4:addHandleOfControlEvent(function()
			log.info("btn%s: TouchDown", iter_23_2)
			arg_23_0:showTip(true, var_23_4, iter_23_2)
		end, CCControlEventTouchDown)
		var_23_4:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpInside", iter_23_2)
			arg_23_0:showTip(false)
		end, CCControlEventTouchUpInside)
		var_23_4:addHandleOfControlEvent(function()
			log.info("btn%s: TouchUpOutside", iter_23_2)
			arg_23_0:showTip(false)
		end, CCControlEventTouchUpOutside)
	end

	user.silkTradeInfo = user.silkTradeInfo or {}

	if arg_23_2 then
		arg_23_0:showPanel(arg_23_2)
	else
		arg_23_0:refresh()
	end
end

function var_0_6.onEnter(arg_30_0)
	arg_30_0.refreshRef = handler(arg_30_0, arg_30_0.refresh)

	eventManager.registerEvent("refreshSilkMarket", arg_30_0.refreshRef)
end

function var_0_6.onExit(arg_31_0)
	if user.silkMarketIcon then
		user.silkMarketIcon = false

		eventManager.dispatchEvent("refreshActivityNotice")
	end

	eventManager.unregisterEvent("refreshSilkMarket", arg_31_0.refreshRef)
end

return var_0_6
