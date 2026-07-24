local var_0_0 = require("res/native/offset").get("layer.activity.card.cardTab")
local var_0_1 = {
	food = {
		txt = 10103,
		pic = "cjfp_jl_hs.png",
		type = 3
	},
	mfhy = {
		txt = 85020,
		pic = "cjfp_jl_hy.png",
		type = 41
	},
	chief_exp = {
		txt = 10107,
		pic = "cjfp_jl_exp.png",
		type = 6
	},
	fortune = {
		txt = 135535,
		pic = "cjfp_jl_fd.png",
		type = 10013
	},
	iron = {
		txt = 10104,
		pic = "cjfp_jl_bt.png",
		type = 4
	},
	gem = {
		txt = 10106,
		pic = "cjfp_jl_bs.png",
		type = 7
	}
}
local var_0_2 = {
	"cjfp_zp_02.png",
	"cjfp_zp_03.png",
	"cjfp_zp_04.png",
	nil,
	"cjfp_zp_05.png"
}
local var_0_3 = colorQuality[0]
local var_0_4 = tool.hexToRgb("#D9EDC5")
local var_0_5 = ccc3(0, 180, 0)
local var_0_6 = colorQuality[5]
local var_0_7 = colorQuality[4]
local var_0_8 = colorQuality[2]
local var_0_9 = class("Card", function()
	return createBaseLayer()
end)
local var_0_10 = 580
local var_0_11 = 6
local var_0_12 = var_0_11 + (var_0_10 - 2 * var_0_11) / 3
local var_0_13 = var_0_11 + (var_0_10 - 2 * var_0_11) * 2 / 3

var_0_9.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/card/cjfp_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 25,
			name = "leftTime",
			y = 480,
			type = "label",
			x = 705,
			style = "label_warlock",
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_6
		},
		{
			x = 458,
			name = "title",
			y = 490,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/card/cjfp_title.png"
			}
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 490,
			type = "button",
			x = 840
		},
		{
			x = 80,
			y = 390,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/card/cjfp_fq.png"
			}
		},
		{
			text = "",
			name = "totalFortune",
			y = 350,
			type = "label",
			style = "label_warlock",
			x = 80,
			fontSize = 25,
			color = var_0_4
		},
		{
			y = 385,
			x = 500,
			scale = 1.2,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/moveMountain/ygys_pb_b.png"
			},
			children = {
				{
					y = 13.5,
					name = "progress",
					type = "progressbar",
					x = 290,
					anchorPoint = ccp(0.5, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = false,
						path = "res/ui/activity/moveMountain/ygys_pb.png"
					}
				},
				{
					y = 13.5,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/moveMountain/ygys_pb_bar.png"
					},
					x = var_0_12
				},
				{
					y = 13.5,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/moveMountain/ygys_pb_bar.png"
					},
					x = var_0_13
				},
				{
					y = -12,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/card/cjfp_word_2xjl.png"
					},
					x = var_0_12
				},
				{
					y = -12,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/card/cjfp_word_3xjl.png"
					},
					x = var_0_13
				},
				{
					y = -12,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/card/cjfp_word_5xjl.png"
					},
					x = var_0_10
				},
				{
					text = "11",
					name = "value1",
					y = 14,
					type = "label",
					style = "label_warlock",
					fontSize = 20,
					x = var_0_12,
					anchorPoint = ccp(1, 0.5)
				},
				{
					text = "22",
					name = "value2",
					y = 14,
					type = "label",
					style = "label_warlock",
					fontSize = 20,
					x = var_0_13,
					anchorPoint = ccp(1, 0.5)
				},
				{
					text = "33",
					name = "value3",
					y = 14,
					type = "label",
					style = "label_warlock",
					fontSize = 20,
					x = var_0_10,
					anchorPoint = ccp(1, 0.5)
				},
				{
					zoomOnTouchDown = false,
					name = "btn_ticket1",
					h = 60,
					type = "button",
					w = 60,
					y = 40,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					x = var_0_12,
					children = {
						{
							x = 30,
							name = "ticket1",
							y = 30,
							type = "sprite",
							scale = 0.4,
							pic = {
								path = "res/default.png"
							}
						},
						{
							x = 30,
							name = "light1",
							y = 30,
							type = "sprite",
							scale = 0.4,
							visible = false,
							pic = {
								path = "res/ui/silk/market/scsp_yhj_light.png"
							}
						},
						{
							fontSize = 18,
							name = "num1",
							y = 25,
							type = "label",
							x = 45,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_ticket2",
					h = 60,
					type = "button",
					w = 60,
					y = 40,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					x = var_0_13,
					children = {
						{
							x = 30,
							name = "ticket2",
							y = 30,
							type = "sprite",
							scale = 0.4,
							pic = {
								path = "res/default.png"
							}
						},
						{
							x = 30,
							name = "light2",
							y = 30,
							type = "sprite",
							scale = 0.4,
							visible = false,
							pic = {
								path = "res/ui/silk/market/scsp_yhj_light.png"
							}
						},
						{
							fontSize = 18,
							name = "num2",
							y = 25,
							type = "label",
							x = 45,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_ticket3",
					h = 60,
					type = "button",
					w = 60,
					y = 40,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					x = var_0_10,
					children = {
						{
							x = 30,
							name = "ticket3",
							y = 30,
							type = "sprite",
							scale = 0.4,
							pic = {
								path = "res/default.png"
							}
						},
						{
							x = 30,
							name = "light3",
							y = 30,
							type = "sprite",
							scale = 0.4,
							visible = false,
							pic = {
								path = "res/ui/silk/market/scsp_yhj_light.png"
							}
						},
						{
							fontSize = 18,
							name = "num3",
							y = 25,
							type = "label",
							x = 45,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			text = "",
			name = "leftCardCount",
			y = 45,
			type = "label",
			fontSize = 25,
			x = 240,
			style = "label_warlock",
			anchorPoint = ccp(1, 0.5)
		},
		{
			fontSize = 35,
			name = "info",
			type = "label",
			textId = 135534,
			style = "label_warlock",
			y = 45,
			x = 300,
			anchorPoint = ccp(0, 0.5),
			color = var_0_4
		},
		{
			y = 0,
			name = "cardNode",
			x = 0,
			type = "node"
		},
		{
			y = 0,
			name = "btnNode",
			type = "node",
			x = 0,
			zorder = 100
		},
		{
			name = "btn_buy",
			h = 60,
			type = "button",
			w = 60,
			zoomOnTouchDown = false,
			y = 45,
			x = 260,
			normal = {
				frame = false,
				path = "res/ui/activity/card/yxhd_btn_add.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/card/yxhd_btn_add_c.png"
			},
			disable = {
				frame = false,
				path = "res/ui/activity/card/yxhd_btn_add_g.png"
			}
		},
		{
			zoomOnTouchDown = false,
			name = "btn_buybig",
			h = 56,
			type = "button",
			w = 212,
			y = 40,
			x = 670,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02_c.png"
			},
			children = {
				{
					fontSize = 24,
					style = "label_warlock",
					y = 32,
					type = "label",
					x = 130,
					textId = 135462,
					color = var_0_4
				},
				{
					y = 40,
					x = 40,
					scale = 0.6,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/yuanbao.png"
					}
				},
				{
					text = "",
					name = "nextGold",
					y = 22,
					type = "label",
					style = "label_warlock",
					x = 40,
					fontSize = 22,
					color = var_0_7
				}
			}
		},
		{
			name = "btn_begin",
			h = 56,
			type = "button",
			w = 189,
			zoomOnTouchDown = false,
			y = 40,
			x = 430,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04_c.png"
			},
			disable = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_04_g.png"
			},
			children = {
				{
					fontSize = 24,
					style = "label_warlock",
					y = 32,
					type = "label",
					x = 94,
					textId = 135532,
					color = var_0_4
				}
			}
		},
		{
			name = "btn_openall",
			h = 56,
			type = "button",
			w = 212,
			zoomOnTouchDown = false,
			y = 40,
			x = 670,
			normal = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02.png"
			},
			touched = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02_c.png"
			},
			disable = {
				frame = false,
				path = "res/ui/common/button/sdyjs_btn_02_g.png"
			},
			children = {
				{
					fontSize = 24,
					style = "label_warlock",
					y = 32,
					type = "label",
					x = 130,
					textId = 135533,
					color = var_0_4
				},
				{
					y = 40,
					x = 40,
					scale = 0.6,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ironRotary/yuanbao.png"
					}
				},
				{
					text = "",
					name = "allOpenGold",
					y = 22,
					type = "label",
					style = "label_warlock",
					x = 40,
					fontSize = 22,
					color = var_0_7
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
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 600,
			textId = 135536,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_9.getSingleCard(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.info.cards[arg_2_1]
	local var_2_1 = var_0_2[arg_2_0.info.rewardTimes]
	local var_2_2 = "cjfp_zp_01.png"

	if var_2_0.subType == 1 then
		var_2_1 = "cjfp_zp_dj_02.png"
	elseif var_2_0.subType == 2 then
		var_2_1 = "cjfp_zp_dj_02.png"
		var_2_2 = "cjfp_zp_dj_01.png"
	end

	return {
		y = 0,
		type = "node",
		x = 0,
		name = "card" .. arg_2_1,
		zorder = 10 - arg_2_1,
		children = {
			{
				type = "sprite",
				zorder = 10,
				name = "cardA" .. arg_2_1,
				pic = {
					frame = false,
					path = "res/ui/activity/card/" .. var_2_1
				},
				children = {
					{
						y = 128,
						x = 111,
						type = "sprite",
						zorder = 20,
						pic = {
							frame = false,
							path = "res/ui/activity/card/" .. var_0_1[var_2_0.type].pic
						}
					},
					{
						x = 111,
						name = "",
						y = 205,
						type = "sprite",
						scale = 0.8,
						zorder = 30,
						pic = {
							frame = false,
							path = "res/ui/world/flight_place_view.png"
						}
					},
					{
						y = 210,
						x = 46,
						type = "sprite",
						zorder = 40,
						pic = {
							path = "res/ui/activity/card/cjfp_jb_hongyun.png"
						},
						visible = var_2_0.subType == 1
					},
					{
						fontSize = 25,
						style = "label_warlock",
						y = 205,
						type = "label",
						zorder = 40,
						x = 111,
						textId = var_0_1[var_2_0.type].txt,
						color = var_0_4
					},
					{
						style = "label_warlock",
						fontSize = 25,
						type = "label",
						y = 50,
						x = 111,
						zorder = 50,
						text = language.get(135039, var_2_0.number),
						color = var_0_4
					}
				}
			},
			{
				zorder = 10,
				type = "sprite",
				name = "cardB" .. arg_2_1,
				pic = {
					frame = false,
					path = "res/ui/activity/card/" .. var_2_2
				}
			}
		}
	}
end

function var_0_9.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getCardActivity)
end

function var_0_9.onChooseTurn(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		arg_5_0.info.state = var_6_0.state
		arg_5_0.info.leftCardCount = var_6_0.leftCardCount

		arg_5_0:showPanel(arg_5_0.info)
		arg_5_0:showTurnEffect(true, function()
			arg_5_0:showBeginTurnEffect()
		end)
	end

	cmgr.sendRequest(var_5_0, actions.chooseTurn)
end

function var_0_9.onOpenAllCards(arg_8_0)
	local function var_8_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		arg_8_0.info.leftCardCount = var_9_0.leftCardCount

		arg_8_0.view.widgets.leftCardCount:setString(language.get(135523, var_9_0.leftCardCount))

		local function var_9_1()
			local var_10_0 = false

			for iter_10_0 = 1, 3 do
				local var_10_1 = {}
				local var_10_2 = var_9_0.cards[iter_10_0]

				var_10_0 = var_10_0 or var_10_2.subType == 1

				for iter_10_1 = 1, arg_8_0.info.rewardTimes do
					local var_10_3 = {
						id = var_0_1[var_10_2.type].type,
						value = var_10_2.number
					}

					table.insert(var_10_1, var_10_3)
				end

				arg_8_0:gotResourceEffect(var_10_1, ccp(visibleSize.width / 2 + 305 * (iter_10_0 - 2), visibleSize.height * 0.4))
			end

			local var_10_4 = CCArray:create()

			if var_10_0 then
				var_10_4:addObject(CCDelayTime:create(1.5))
				var_10_4:addObject(CCCallFuncN:create(function()
					local var_11_0 = CCSprite:create("res/ui/activity/card/cjfp_word_hydt.png")
					local var_11_1 = visibleSize.width * 0.5
					local var_11_2 = visibleSize.height * 0.5

					var_11_0:setPosition(ccp(var_11_1, var_11_2 - 50))
					smgr.showTipSpriteText(var_11_0)
				end))
			end

			var_10_4:addObject(CCDelayTime:create(1))
			var_10_4:addObject(CCCallFuncN:create(function()
				arg_8_0:showTurnEffect(true, function()
					if arg_8_0.info.leftCardCount > 0 then
						arg_8_0:onGetShowCards(var_9_0.isFortuneLevelUp)
					else
						arg_8_0:showPanel(arg_8_0.info)
					end
				end)
			end))
			arg_8_0.view.widgets.panel:runAction(CCSequence:create(var_10_4))
		end

		if arg_8_0.info.rewardTimes == 1 then
			var_9_1()
		else
			local var_9_2 = string.format("res/ui/activity/card/cjfp_word_%dx.png", arg_8_0.info.rewardTimes)
			local var_9_3 = CCSprite:create(var_9_2)
			local var_9_4 = visibleSize.width * 0.5
			local var_9_5 = visibleSize.height * 0.5

			var_9_3:setPosition(ccp(var_9_4, var_9_5 - 50))
			smgr.showTipSpriteText(var_9_3, var_9_1)
		end
	end

	messageBox.showChargeWinWithData(language.get(10003), language.get(135525, arg_8_0.info.allOpenGold), "cardAllOpenGold", function()
		arg_8_0.view.widgets.btn_begin:setEnabled(false)
		arg_8_0.view.widgets.btn_openall:setEnabled(false)
		cmgr.sendRequest(var_8_0, actions.openAllCards)
	end)
end

function var_0_9.onChooseCard(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0)
		arg_15_0.view.widgets.btnNode:setVisible(false)

		arg_15_0.info.state = 0

		local var_16_0 = arg_16_0.action.data
		local var_16_1 = {
			1,
			2,
			3
		}

		table.remove(var_16_1, arg_15_1)

		for iter_16_0 = 1, 3 do
			local var_16_2 = var_16_0.cards[iter_16_0]

			if var_16_2.beChosen then
				arg_15_0.info.cards[arg_15_1] = var_16_2
			else
				arg_15_0.info.cards[table.remove(var_16_1, 1)] = var_16_2
			end
		end

		local function var_16_3()
			local var_17_0 = arg_15_0.info.cards[arg_15_1]
			local var_17_1 = {}

			for iter_17_0 = 1, arg_15_0.info.rewardTimes do
				local var_17_2 = {
					id = var_0_1[var_17_0.type].type,
					value = var_17_0.number
				}

				table.insert(var_17_1, var_17_2)
			end

			arg_15_0:gotResourceEffect(var_17_1, ccp(visibleSize.width / 2 + 305 * (arg_15_1 - 2), visibleSize.height * 0.4))

			local var_17_3 = CCArray:create()

			if var_17_0.subType == 1 then
				var_17_3:addObject(CCDelayTime:create(1.5))
				var_17_3:addObject(CCCallFuncN:create(function()
					local var_18_0 = CCSprite:create("res/ui/activity/card/cjfp_word_hydt.png")
					local var_18_1 = visibleSize.width * 0.5
					local var_18_2 = visibleSize.height * 0.5

					var_18_0:setPosition(ccp(var_18_1, var_18_2 - 50))
					smgr.showTipSpriteText(var_18_0)
				end))
			end

			var_17_3:addObject(CCDelayTime:create(1))
			var_17_3:addObject(CCCallFuncN:create(function()
				arg_15_0:showTurnEffect(true, function()
					if arg_15_0.info.leftCardCount > 0 then
						arg_15_0:onGetShowCards(var_16_0.isFortuneLevelUp)
					else
						arg_15_0:showPanel(arg_15_0.info)
					end
				end)
			end))
			arg_15_0.view.widgets.panel:runAction(CCSequence:create(var_17_3))
		end

		if arg_15_0.info.rewardTimes == 1 then
			var_16_3()
		else
			local var_16_4 = string.format("res/ui/activity/card/cjfp_word_%dx.png", arg_15_0.info.rewardTimes)
			local var_16_5 = CCSprite:create(var_16_4)
			local var_16_6 = visibleSize.width * 0.5
			local var_16_7 = visibleSize.height * 0.5

			var_16_5:setPosition(ccp(var_16_6, var_16_7 - 50))
			smgr.showTipSpriteText(var_16_5, var_16_3)
		end

		arg_15_0:addCard(false)
		arg_15_0:showTurnEffect(false)
	end

	cmgr.sendRequest(var_15_0, actions.chooseCard)
end

function var_0_9.onGetShowCards(arg_21_0, arg_21_1)
	local function var_21_0(arg_22_0)
		if arg_21_1 then
			arg_21_0:showRateUpEffect()
		end

		arg_21_0.info = arg_22_0.action.data

		arg_21_0:addCard(false)
		arg_21_0:showTurnEffect(false, function()
			arg_21_0:showPanel(arg_21_0.info)
		end)
	end

	cmgr.sendRequest(var_21_0, actions.getCardActivity)
end

function var_0_9.onGoldBuyTimes(arg_24_0)
	local function var_24_0(arg_25_0)
		local var_25_0 = {}
		local var_25_1 = {}

		var_25_1.id = 10012
		var_25_1.value = 1

		table.insert(var_25_0, var_25_1)
		globalAction_gotResource(var_25_0)
		arg_24_0:refresh()
	end

	messageBox.showChargeWinWithData(language.get(10003), language.get(135526, arg_24_0.info.nextGold), "cardBuyTimesGold", function()
		cmgr.sendRequest(var_24_0, actions.goldBuyTimes)
	end)
end

function var_0_9.onGetTicket(arg_27_0, arg_27_1)
	local function var_27_0(arg_28_0)
		arg_27_0.info.ticketList[arg_27_1].canReceived = 0

		arg_27_0.view.widgets["light" .. arg_27_1]:setVisible(false)

		local var_28_0 = {
			10027,
			10028,
			10029
		}
		local var_28_1 = arg_28_0.action.data
		local var_28_2 = {}
		local var_28_3 = {
			id = var_28_0[var_28_1.type],
			value = var_28_1.value
		}

		table.insert(var_28_2, var_28_3)
		globalAction_gotResource(var_28_2)
	end

	cmgr.sendRequest(var_27_0, actions.receivedCardTickets, arg_27_1)
end

function var_0_9.showBeginTurnEffect(arg_29_0)
	local var_29_0 = {}

	for iter_29_0 = 1, 2 do
		local var_29_1 = iter_29_0 == 1 and 1 or -1
		local var_29_2 = CCMoveBy:create(0.3, ccp(270 * var_29_1, 0))
		local var_29_3
		local var_29_4 = CCArray:create()
		local var_29_5 = CCMoveBy:create(0.05, ccp(-20 * var_29_1, 0))

		var_29_4:addObject(var_29_5)
		var_29_4:addObject(var_29_5:reverse())

		local var_29_6 = CCRepeat:create(CCSequence:create(var_29_4), 3)
		local var_29_7 = CCArray:create()

		var_29_7:addObject(var_29_2)
		var_29_7:addObject(var_29_6)
		var_29_7:addObject(var_29_2:reverse())

		var_29_0[iter_29_0] = CCSequence:create(var_29_7)
	end

	arg_29_0.view.widgets.card1:runAction(var_29_0[1])
	arg_29_0.view.widgets.card3:runAction(var_29_0[2])
end

function var_0_9.showTurnEffect(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_2 then
		arg_30_0.view.widgets.panel:stopAllActions()
	end

	for iter_30_0 = 1, 3 do
		local var_30_0 = arg_30_1 and arg_30_0.view.widgets["cardA" .. iter_30_0] or arg_30_0.view.widgets["cardB" .. iter_30_0]
		local var_30_1 = arg_30_1 and arg_30_0.view.widgets["cardB" .. iter_30_0] or arg_30_0.view.widgets["cardA" .. iter_30_0]

		var_30_0:setVisible(true)
		var_30_1:setVisible(false)
		var_30_0:stopAllActions()
		var_30_1:stopAllActions()

		local var_30_2 = CCArray:create()

		var_30_2:addObject(CCOrbitCamera:create(0.2, 1, 0, 0, 90, 0, 0))
		var_30_2:addObject(CCHide:create())
		var_30_0:runAction(CCSequence:create(var_30_2))

		local var_30_3 = CCArray:create()

		var_30_3:addObject(CCDelayTime:create(0.2))
		var_30_3:addObject(CCShow:create())
		var_30_3:addObject(CCOrbitCamera:create(0.2, 1, 0, 270, 90, 0, 0))

		if iter_30_0 == 3 and arg_30_2 then
			var_30_3:addObject(CCCallFuncN:create(arg_30_2))
		end

		var_30_1:runAction(CCSequence:create(var_30_3))
	end
end

function var_0_9.showRateUpEffect(arg_31_0)
	local var_31_0 = rmgr.getAnimation("warlockUpgrade")
	local var_31_1 = CCAnimation:createWithSpriteFrames(var_31_0, 0.08)
	local var_31_2 = CCAnimate:create(var_31_1)
	local var_31_3 = CCSprite:create()

	arg_31_0.view.widgets.panel:addChild(var_31_3, 500)
	var_31_3:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_31_4 = CCArray:create()

	var_31_4:addObject(var_31_2)
	var_31_4:addObject(CCCallFuncN:create(function()
		var_31_3:removeFromParentAndCleanup(true)
	end))
	var_31_3:runAction(CCSequence:create(var_31_4))

	local var_31_5 = "res/ui/activity/card/cjfp_word_jlts.png"
	local var_31_6 = CCSprite:create(var_31_5)

	var_31_6:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
	smgr.showTipSpriteText(var_31_6)

	local var_31_7 = "res/anim/stategyEffect/att_jitui/att_jitui.plist"

	rmgr.loadResource(var_31_7)

	for iter_31_0 = 1, 3 do
		local var_31_8 = CCArray:create()

		for iter_31_1 = 1, 10 do
			iter_31_1 = iter_31_1 == 10 and 15 or iter_31_1

			local var_31_9 = CCSprite:createWithSpriteFrameName(string.format("%d.png", iter_31_1))

			var_31_8:addObject(var_31_9:displayFrame())
		end

		local var_31_10 = CCAnimation:createWithSpriteFrames(var_31_8, 0.08)
		local var_31_11 = CCAnimate:create(var_31_10)
		local var_31_12 = CCSprite:create()

		var_31_12:setPosition(ccp(190 + (iter_31_0 - 1) * 270, 205))
		arg_31_0.view.widgets.panel:addChild(var_31_12, 2)
		var_31_12:runAction(var_31_11)
	end

	CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_31_7)
end

function var_0_9.gotResourceEffect(arg_33_0, arg_33_1, arg_33_2)
	amgr.playEffect(enumAudioFile.ui_get_award, false)

	local var_33_0 = smgr.getLayer("pushLayer")
	local var_33_1
	local var_33_2 = #arg_33_1

	if var_33_2 > 0 then
		local var_33_3 = false
		local var_33_4 = CCNode:create()

		for iter_33_0, iter_33_1 in pairs(arg_33_1) do
			if user.phantomLimit and iter_33_1.id == 41 then
				var_33_3 = true
			end

			local var_33_5 = globalAction_gotSingleResource(iter_33_1.id, iter_33_1.value, iter_33_1.gemLevel)

			if var_33_5 == nil then
				var_33_4:removeAllChildrenWithCleanup(true)
				log.info("push layer , unknow id ", iter_33_1.id)

				return
			end

			var_33_5:setPosition(0, (var_33_2 - 1) * 25 - (iter_33_0 - 1) * 50)
			var_33_4:addChild(var_33_5)
			var_33_5:setScale(var_0_0.resEffScale or 1)
		end

		if arg_33_2 then
			var_33_4:setPosition(arg_33_2)
		else
			var_33_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))
		end

		local function var_33_6(arg_34_0)
			arg_34_0:setVisible(false)
			var_33_0:removeChild(arg_34_0, true)
		end

		local var_33_7, var_33_8 = var_33_4:getPosition()
		local var_33_9 = CCDelayTime:create(0.5)
		local var_33_10 = CCMoveTo:create(0.3, ccp(var_33_7, visibleSize.height * 0.6))
		local var_33_11 = CCDelayTime:create(0.3)
		local var_33_12 = CCMoveTo:create(0.5, ccp(0, visibleSize.height))
		local var_33_13 = CCScaleTo:create(0.5, 0.1)
		local var_33_14 = CCSpawn:createWithTwoActions(var_33_12, var_33_13)
		local var_33_15 = CCCallFuncN:create(var_33_6)
		local var_33_16 = CCArray:create()

		var_33_16:addObject(var_33_9)
		var_33_16:addObject(var_33_10)
		var_33_16:addObject(var_33_11)
		var_33_16:addObject(var_33_14)

		if var_33_3 then
			var_33_16:addObject(CCCallFunc:create(function()
				user.phantomLimit = false

				smgr.showTipText(language.get(20054))
				amgr.playEffect(enumAudioFile.ui_click_error, false, true)
			end))
		end

		var_33_16:addObject(var_33_15)

		local var_33_17 = CCSequence:create(var_33_16)

		var_33_4:runAction(var_33_17)
		var_33_0:addChild(var_33_4)
	end
end

function var_0_9.addCard(arg_36_0, arg_36_1)
	arg_36_0.view.widgets.cardNode:removeAllChildrenWithCleanup(true)

	for iter_36_0 = 1, 3 do
		uiutil.initWidgets(arg_36_0.view, arg_36_0:getSingleCard(iter_36_0))
		arg_36_0.view.widgets.cardNode:addChild(arg_36_0.view.widgets["card" .. iter_36_0])
		arg_36_0.view.widgets["card" .. iter_36_0]:setPosition(ccp(190 + (iter_36_0 - 1) * 270, 205))
		arg_36_0.view.widgets["cardA" .. iter_36_0]:setVisible(arg_36_1)
		arg_36_0.view.widgets["cardB" .. iter_36_0]:setVisible(not arg_36_1)

		if arg_36_0.info.cards[iter_36_0].beChosen == false then
			tool.spriteToGray(arg_36_0.view.widgets["cardA" .. iter_36_0], true)
		end
	end
end

function var_0_9.showPanel(arg_37_0, arg_37_1)
	arg_37_0.info = arg_37_1

	arg_37_0.view.widgets.leftCardCount:setString(language.get(135523, arg_37_1.leftCardCount))

	local var_37_0 = 0

	if arg_37_1.totalFortune <= arg_37_0.value[1] then
		var_37_0 = 33.3 * arg_37_1.totalFortune / arg_37_0.value[1]
	elseif arg_37_1.totalFortune <= arg_37_0.value[2] then
		var_37_0 = 33.33 + 33.3 * (arg_37_1.totalFortune - arg_37_0.value[1]) / (arg_37_0.value[2] - arg_37_0.value[1])
	elseif arg_37_1.totalFortune <= arg_37_0.value[3] then
		var_37_0 = 66.67 + 33.3 * (arg_37_1.totalFortune - arg_37_0.value[2]) / (arg_37_0.value[3] - arg_37_0.value[2])
	else
		var_37_0 = 100
	end

	arg_37_0.view.widgets.progress:setPercentage(math.ceil(var_37_0))
	arg_37_0.view.widgets.totalFortune:setString(language.get(135039, arg_37_1.totalFortune))

	local var_37_1 = arg_37_1.state == 0

	arg_37_0.view.widgets.btn_buy:setEnabled(var_37_1)
	arg_37_0.view.widgets.info:setVisible(not var_37_1)
	arg_37_0.view.widgets.btnNode:setVisible(not var_37_1)

	if var_37_1 then
		arg_37_0.view.widgets.allOpenGold:setString(language.get(142003, arg_37_1.allOpenGold))
	end

	local var_37_2 = var_37_1 and arg_37_1.leftCardCount > 0

	arg_37_0.view.widgets.btn_begin:setVisible(var_37_2)
	arg_37_0.view.widgets.btn_begin:setEnabled(var_37_2)
	arg_37_0.view.widgets.btn_openall:setVisible(var_37_2)
	arg_37_0.view.widgets.btn_openall:setEnabled(var_37_2)
	arg_37_0:addCard(var_37_2)
	arg_37_0.view.widgets.btn_buybig:setVisible(var_37_1 and arg_37_1.leftCardCount == 0)

	if not var_37_2 then
		arg_37_0.view.widgets.nextGold:setString(language.get(142003, arg_37_1.nextGold))
	end

	if arg_37_1.ticketList then
		for iter_37_0 = 1, 3 do
			arg_37_0.view.widgets["light" .. iter_37_0]:setVisible(arg_37_1.ticketList[iter_37_0].canReceived == 1)
		end
	end
end

function var_0_9.ctor(arg_38_0, arg_38_1, arg_38_2)
	log.info("@@__ 超级翻牌活动")

	arg_38_0.view = {}

	uiutil.initWidgets(arg_38_0.view, arg_38_0.layout)

	arg_38_0.leftTime = arg_38_0.view.widgets.leftTime

	if arg_38_1 then
		arg_38_0:addChild(arg_38_0.view.widgets.panel)
		arg_38_1:addChild(arg_38_0)
	end

	local var_38_0 = arg_38_0.view.widgets.title
	local var_38_1 = var_38_0:getContentSize()
	local var_38_2 = CCSprite:create("res/ui/activity/ironSell/word_xin.png")

	var_38_2:setPosition(ccp(20, 0.5 * var_38_1.height))
	var_38_2:setAnchorPoint(ccp(1, 0.5))
	var_38_0:addChild(var_38_2)

	arg_38_0.value = tool.split(arg_38_2.fortuneShow[1].value, "#")

	for iter_38_0, iter_38_1 in pairs(arg_38_0.value) do
		arg_38_0.value[iter_38_0] = tonumber(iter_38_1)
	end

	for iter_38_2 = 1, 3 do
		arg_38_0.view.widgets["value" .. iter_38_2]:setString(arg_38_0.value[iter_38_2])
	end

	if arg_38_2.ticketList then
		local var_38_3 = {
			"scsp_yhj_dh.png",
			"scsp_yhj_sb.png",
			"scsp_yhj_3b.png"
		}

		for iter_38_3 = 1, 3 do
			local var_38_4 = arg_38_2.ticketList[iter_38_3]
			local var_38_5 = CCArray:create()

			var_38_5:addObject(CCFadeIn:create(0.3))
			var_38_5:addObject(CCFadeOut:create(0.3))

			local var_38_6 = CCSequence:create(var_38_5)

			arg_38_0.view.widgets["light" .. iter_38_3]:runAction(CCRepeatForever:create(var_38_6))
			arg_38_0.view.widgets["ticket" .. iter_38_3]:setDisplayFrame(CCSprite:create("res/ui/silk/market/" .. var_38_3[var_38_4.type]):displayFrame())
			arg_38_0.view.widgets["num" .. iter_38_3]:setString(language.get(135039, var_38_4.value))
			arg_38_0.view.widgets["btn_ticket" .. iter_38_3]:addHandleOfControlEvent(function()
				log.info("btn_ticket" .. iter_38_3)

				if arg_38_0.info.ticketList[iter_38_3].canReceived == 1 then
					arg_38_0:onGetTicket(iter_38_3)
				else
					arg_38_0:showTip(iter_38_3)
				end
			end, CCControlEventTouchUpInside)
		end
	end

	local var_38_7 = CCMenu:create()

	arg_38_0.view.widgets.btnNode:addChild(var_38_7)
	var_38_7:setPosition(ccp(0, 0))

	for iter_38_4 = 1, 3 do
		local var_38_8 = CCSprite:create("res/ui/activity/card/default.png")
		local var_38_9 = CCSprite:create("res/ui/activity/card/cjfp_zp_c.png")
		local var_38_10 = CCMenuItemSprite:create(var_38_8, var_38_9)

		var_38_7:addChild(var_38_10)
		var_38_10:setPosition(ccp(190 + (iter_38_4 - 1) * 270, 205))
		var_38_10:registerScriptTapHandler(function()
			log.info("btn_card", iter_38_4)
			arg_38_0:onChooseCard(iter_38_4)
		end)
	end

	arg_38_0.view.widgets.btn_buy:addHandleOfControlEvent(function()
		log.info("btn_buy")
		arg_38_0:onGoldBuyTimes()
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_buybig:addHandleOfControlEvent(function()
		log.info("btn_buybig")
		arg_38_0:onGoldBuyTimes()
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_begin:addHandleOfControlEvent(function()
		log.info("btn_begin")
		arg_38_0:onChooseTurn()
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_openall:addHandleOfControlEvent(function()
		log.info("btn_openall")
		arg_38_0:onOpenAllCards()
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_38_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_38_0:showPanel(arg_38_2)
end

function var_0_9.showTip(arg_46_0, arg_46_1)
	log.info("should show tips ")

	local var_46_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_46_0:registerScriptTouchHandler(function(arg_47_0, arg_47_1, arg_47_2)
		if arg_47_0 == CCTOUCHBEGAN then
			return true
		elseif arg_47_0 == CCTOUCHMOVED then
			return true
		elseif arg_47_0 == CCTOUCHENDED then
			pcall(var_46_0.removeFromParentAndCleanup, var_46_0, true)

			return true
		end
	end, false, true)
	var_46_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_46_0, 60000)

	local var_46_1 = 0
	local var_46_2 = 0
	local var_46_3 = {}

	uiutil.initWidgets(var_46_3, arg_46_0.tipFrame)
	var_46_0:addChild(var_46_3.widgets.tipFrame)

	local var_46_4 = arg_46_0.view.widgets.btn_tip

	if arg_46_1 then
		var_46_4 = arg_46_0.view.widgets["btn_ticket" .. arg_46_1]

		local var_46_5 = arg_46_0.info.ticketList[arg_46_1]
		local var_46_6 = {
			122149,
			122148,
			122147
		}

		var_46_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))
		var_46_3.widgets.tipMsg:setString(language.get(var_46_6[var_46_5.type]))
	end

	local var_46_7, var_46_8 = tool.getPositionInScreen(var_46_4)
	local var_46_9 = var_46_7 + 20
	local var_46_10 = var_46_8 - 20

	if arg_46_1 then
		var_46_9 = var_46_9 + 36 * (arg_46_1 - 1)
	end

	local var_46_11 = var_46_3.widgets.tipMsg:getContentSize().width
	local var_46_12 = var_46_3.widgets.tipMsg:getContentSize().height

	var_46_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_46_11 + 30, var_46_12 + 30))
	var_46_3.widgets.tipFrame:setPosition(ccp(var_46_9, var_46_10))
	var_46_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_46_3.widgets.tipFrame:setVisible(true)
end

function var_0_9.onEnter(arg_48_0)
	CCDirector:sharedDirector():setProjection(kCCDirectorProjection2D)
end

function var_0_9.onExit(arg_49_0)
	CCDirector:sharedDirector():setProjection(kCCDirectorProjection3D)
end

return var_0_9
