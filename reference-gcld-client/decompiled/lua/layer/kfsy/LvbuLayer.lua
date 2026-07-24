local var_0_0 = require("res/native/offset").get("layer.kfsy.lvBuLayer")
local var_0_1 = {
	iron = "res_icon_4.png",
	gem = "res_icon_7.png",
	ticket = "res_icon_100.png"
}
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = class("LvbuCard", function()
	return createBaseLayer()
end)

var_0_6.layout = {
	name = "panel",
	type = "sprite",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	pic = {
		path = "res/ui/world/cityCombo/lxzc_bg.png"
	},
	children = {
		{
			y = 180,
			type = "sprite",
			x = 460,
			pic = {
				path = "res/ui/activity/fishing/hjcd_time_line.png"
			},
			children = {
				{
					zoomOnTouchDown = true,
					name = "btn_drink",
					h = 96,
					type = "button",
					w = 73,
					y = 100,
					x = 165,
					normal = {
						path = "res/ui/kfsy/lvbu/lvdqj_btn_gyyb.png"
					},
					touched = {
						path = "res/ui/kfsy/lvbu/lvdqj_btn_gyyb_c.png"
					}
				},
				{
					y = 65,
					x = 165,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_word_gyyb.png"
					}
				},
				{
					y = 155,
					x = 165,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_word_gh.png"
					}
				},
				{
					y = 30,
					type = "label",
					x = 165,
					textId = 320424,
					color = var_0_5,
					fontSize = 30 + (var_0_0.consumeLabelSize or 0)
				}
			}
		},
		{
			y = 180,
			type = "sprite",
			x = 750,
			pic = {
				path = "res/ui/activity/fishing/hjcd_time_line.png"
			},
			children = {
				{
					fontSize = 30,
					name = "num_reward2",
					y = 30,
					type = "label",
					x = 130,
					color = var_0_2,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 30,
					type = "sprite",
					x = 70,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					},
					children = {
						{
							x = 40,
							name = "icon2",
							y = 40,
							type = "sprite",
							scale = 1.3,
							pic = {
								frame = true,
								path = "res_icon_7.png"
							}
						}
					}
				},
				{
					y = 155,
					x = 165,
					type = "sprite",
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_word_jl.png"
					}
				},
				{
					y = 100,
					type = "sprite",
					x = 165,
					pic = {
						path = "res/ui/activity/fishing/hjcd_time_line.png"
					},
					children = {
						{
							y = 30,
							type = "sprite",
							x = 70,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							},
							children = {
								{
									x = 40,
									name = "icon1",
									y = 40,
									type = "sprite",
									scale = 1.3,
									pic = {
										frame = true,
										path = "res_icon_100.png"
									}
								}
							}
						},
						{
							fontSize = 30,
							name = "num_reward1",
							y = 30,
							type = "label",
							x = 130,
							color = var_0_2,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			y = 135,
			name = "npc",
			type = "sprite",
			x = 210,
			pic = {
				path = "res/ui/common/halfPic/halfPic_diaochan.png"
			}
		},
		{
			name = "btn_buy1",
			h = 56,
			type = "button",
			w = 212,
			y = 40,
			x = 460,
			normal = {
				path = "res/ui/common/button/sdyjs_btn_01.png"
			},
			touched = {
				path = "res/ui/common/button/sdyjs_btn_01_c.png"
			},
			children = {
				{
					y = 55,
					type = "sprite",
					x = 85,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_qj.png"
					}
				},
				{
					y = 40,
					x = 40,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					}
				},
				{
					y = 75,
					x = 120,
					type = "sprite",
					pic = {
						path = "res/ui/common/symbol/lvdqj_mul.png"
					}
				},
				{
					name = "num1",
					type = "atlaslabel",
					pic = "res/ui/common/number/lm_tit_num.png",
					startCharMap = 48,
					text = "88",
					y = 77,
					itemWidth = 22,
					x = 130,
					itemHeight = 32,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 32,
					type = "label",
					x = 130,
					textId = 320427,
					color = var_0_2,
					fontSize = 25 + (var_0_0.buyBtnSize or 0)
				},
				{
					fontSize = 22,
					name = "gold1",
					y = 22,
					type = "label",
					x = 40,
					color = var_0_5
				}
			}
		},
		{
			name = "btn_buy2",
			h = 56,
			type = "button",
			w = 212,
			y = 40,
			x = 750,
			normal = {
				path = "res/ui/common/button/sdyjs_btn_02.png"
			},
			touched = {
				path = "res/ui/common/button/sdyjs_btn_02_c.png"
			},
			children = {
				{
					y = 55,
					type = "sprite",
					x = 85,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/kfsy/lvbu/lvdqj_qj.png"
					}
				},
				{
					y = 40,
					x = 40,
					type = "sprite",
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					}
				},
				{
					y = 75,
					x = 120,
					type = "sprite",
					pic = {
						path = "res/ui/common/symbol/lvdqj_mul.png"
					}
				},
				{
					name = "num2",
					type = "atlaslabel",
					pic = "res/ui/common/number/lm_tit_num.png",
					startCharMap = 48,
					text = "88",
					y = 77,
					itemWidth = 22,
					x = 130,
					itemHeight = 32,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 32,
					type = "label",
					x = 130,
					textId = 320427,
					color = var_0_2,
					fontSize = 25 + (var_0_0.buyBtnSize or 0)
				},
				{
					fontSize = 22,
					name = "gold2",
					y = 22,
					type = "label",
					x = 40,
					color = var_0_5
				}
			}
		},
		{
			type = "sprite",
			name = "glass1",
			x = 482,
			visible = false,
			y = 130,
			scale = 1.5,
			pic = {
				path = "res/ui/kfsy/lvbu/lvdqj_jb.png"
			}
		},
		{
			type = "sprite",
			name = "glass2",
			x = 482,
			visible = false,
			y = 130,
			scale = 1.5,
			pic = {
				path = "res/ui/kfsy/lvbu/lvdqj_jb.png"
			}
		},
		{
			x = 880,
			name = "btn_close",
			h = 33,
			type = "button",
			w = 32,
			y = 355,
			scale = 2,
			normal = {
				frame = true,
				path = "btn_close_a.png"
			},
			touched = {
				frame = true,
				path = "btn_close_c.png"
			}
		}
	}
}

function var_0_6.onDrink(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = {
			ccp(332, 130),
			ccp(632, 130)
		}
		local var_3_1 = 90

		for iter_3_0 = 1, 2 do
			local var_3_2 = arg_2_0.view.widgets["glass" .. iter_3_0]

			var_3_2:setVisible(false)
			var_3_2:stopAllActions()
			var_3_2:setOpacity(255)
			var_3_2:setPosition(var_3_0[iter_3_0])
			var_3_2:setVisible(true)

			local var_3_3 = CCEaseElasticOut:create(CCMoveBy:create(0.8, ccp(var_3_1 * (iter_3_0 == 1 and 1 or -1), 0)), 0.8)
			local var_3_4 = CCFadeOut:create(0.5)
			local var_3_5 = CCMoveBy:create(0.5, ccp(var_3_1 * (iter_3_0 == 1 and -1 or 1), 0))
			local var_3_6 = CCArray:create()

			var_3_6:addObject(var_3_3)
			var_3_6:addObject((CCSpawn:createWithTwoActions(var_3_4, var_3_5)))
			var_3_6:addObject(CCCallFuncN:create(function()
				var_3_2:setVisible(false)
			end))

			local var_3_7 = CCSequence:create(var_3_6)

			var_3_2:runAction(var_3_7)
		end

		local var_3_8 = {
			[4] = 4,
			[100] = 100,
			[21] = 7
		}
		local var_3_9 = {}

		for iter_3_1, iter_3_2 in ipairs(arg_3_0.action.data.rewards) do
			local var_3_10 = {
				id = var_3_8[iter_3_2.type] or iter_3_2.type,
				value = iter_3_2.value
			}

			table.insert(var_3_9, var_3_10)
		end

		globalAction_gotResource(var_3_9)
		eventManager.dispatchEvent("kfsyChange")
	end

	local var_2_1 = 1

	cmgr.sendRequest(var_2_0, actions.useLvbuCard, var_2_1)
end

function var_0_6.onBuyCard(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data
		local var_6_1 = {}
		local var_6_2 = {}

		var_6_2.id = 10022
		var_6_2.value = var_6_0.card

		table.insert(var_6_1, var_6_2)
		globalAction_gotResource(var_6_1)
		eventManager.dispatchEvent("kfsyChange")
	end

	local var_5_1 = arg_5_0.info.lvbuCardInfo[arg_5_1]

	messageBox.showChargeWin("", language.get(320425, var_5_1.consumeGold, var_5_1.num), "kfzbFeastLvbuCard", function()
		cmgr.sendRequest(var_5_0, actions.buyLvbuCard, var_5_1.type)
	end)
end

function var_0_6.updateInfo(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.action.data

	arg_8_0.info = var_8_0

	if var_8_0.lvbuCardReward then
		local var_8_1 = tool.split(var_8_0.lvbuCardReward, ";")

		for iter_8_0, iter_8_1 in ipairs(var_8_1) do
			local var_8_2 = tool.split(iter_8_1, ",")

			arg_8_0.view.widgets["icon" .. iter_8_0]:setDisplayFrame(tool.spriteFrameByName(var_0_1[var_8_2[1]]))
			arg_8_0.view.widgets["num_reward" .. iter_8_0]:setString(language.get(135039, var_8_2[#var_8_2]))
		end
	end

	if var_8_0.lvbuCardInfo then
		for iter_8_2, iter_8_3 in ipairs(var_8_0.lvbuCardInfo) do
			arg_8_0.view.widgets["num" .. iter_8_2]:setString(iter_8_3.num)
			arg_8_0.view.widgets["gold" .. iter_8_2]:setString(iter_8_3.consumeGold)
		end
	end
end

function var_0_6.ctor(arg_9_0)
	arg_9_0.view = {}

	swallowTouch(arg_9_0)
	uiutil.initWidgets(arg_9_0.view, arg_9_0.layout)
	arg_9_0:addChild(arg_9_0.view.widgets.panel)
	arg_9_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_9_0:setVisible(false)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_drink:addHandleOfControlEvent(function()
		log.info("btn_drink")
		arg_9_0:onDrink()
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_buy1:addHandleOfControlEvent(function()
		log.info("btn_buy1")
		arg_9_0:onBuyCard(1)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.btn_buy2:addHandleOfControlEvent(function()
		log.info("btn_buy2")
		arg_9_0:onBuyCard(2)
	end, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.glass2:setFlipX(true)
end

return var_0_6
