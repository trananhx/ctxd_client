local var_0_0 = class("ZhaoYunLayer", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "zhaoyun_bg",
	type = "sprite9",
	x = visibleSize.width / 2,
	y = visibleSize.height / 2,
	pic = {
		frame = false,
		path = "res/ui/world/cityCombo/lxzc_bg.png"
	},
	preferedSize = CCSizeMake(964, 387),
	middleRect = CCRectMake(10, 30, 944, 276),
	children = {
		{
			x = 900,
			name = "btn_close",
			h = 33,
			type = "button",
			w = 32,
			y = 406,
			scale = 2,
			normal = {
				frame = true,
				path = "btn_close_a.png"
			},
			touched = {
				frame = true,
				path = "btn_close_c.png"
			}
		},
		{
			fontSize = 20,
			name = "Text_9",
			y = 220,
			type = "label",
			textId = -1,
			style = "label_warlock",
			x = 800,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_8",
			y = 255,
			type = "label",
			textId = -1,
			style = "label_warlock",
			x = 800,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_7",
			y = 290,
			type = "label",
			textId = -1,
			style = "label_warlock",
			x = 800,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_6",
			y = 220,
			type = "label",
			textId = -1,
			style = "label_warlock",
			x = 570,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_5",
			y = 255,
			type = "label",
			textId = -1,
			style = "label_warlock",
			x = 570,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_4",
			y = 290,
			type = "label",
			textId = -1,
			style = "label_warlock",
			x = 570,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_3",
			y = 220,
			type = "label",
			textId = 320409,
			style = "label_warlock",
			x = 352,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_2",
			y = 255,
			type = "label",
			textId = 320408,
			style = "label_warlock",
			x = 352,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			fontSize = 20,
			name = "Text_1",
			y = 290,
			type = "label",
			textId = 320407,
			style = "label_warlock",
			x = 352,
			color = ccc3(255, 255, 255),
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			y = 240,
			name = "jxsy_list_line_thin_2_1",
			type = "sprite",
			x = 580,
			pic = {
				frame = false,
				path = "res/ui/kfsy/zhaoyun/jxsy_list_line_thin.png"
			}
		},
		{
			y = 205,
			name = "jxsy_list_line_thin_2_0",
			type = "sprite",
			x = 580,
			pic = {
				frame = false,
				path = "res/ui/kfsy/zhaoyun/jxsy_list_line_thin.png"
			}
		},
		{
			y = 275,
			name = "jxsy_list_line_thin_2",
			type = "sprite",
			x = 580,
			pic = {
				frame = false,
				path = "res/ui/kfsy/zhaoyun/jxsy_list_line_thin.png"
			}
		},
		{
			y = 310,
			name = "jxsy_list_line_top",
			type = "sprite",
			x = 575,
			pic = {
				frame = false,
				path = "res/ui/kfsy/zhaoyun/jxsy_list_line_top.png"
			}
		},
		{
			y = 133.1051,
			name = "juexingzhaoyun",
			type = "sprite",
			x = 113.4847,
			flipX = true,
			pic = {
				frame = false,
				path = "res/ui/common/halfPic/halfPic_lvbujx.png"
			}
		},
		{
			y = 340,
			name = "kfsy_gmytzr",
			type = "sprite",
			x = 800,
			pic = {
				frame = false,
				path = "res/ui/kfsy/kfsy_gmytzr.png"
			}
		},
		{
			y = 340,
			name = "kfsy_gmcj",
			type = "sprite",
			x = 570,
			pic = {
				frame = false,
				path = "res/ui/kfsy/kfsy_gmcj.png"
			}
		},
		{
			y = 340,
			name = "kfsy_gmrqph",
			type = "sprite",
			x = 350,
			pic = {
				frame = false,
				path = "res/ui/kfsy/kfsy_gmrqph.png"
			}
		},
		{
			name = "nJxNode",
			type = "node",
			children = {
				{
					y = 100,
					name = "zbsqgy_word_kqkj",
					type = "sprite",
					x = 480,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zbsqgy_word_kqkj.png"
					}
				},
				{
					y = 142,
					name = "jxsy_icon_vipqj",
					type = "sprite",
					x = 800,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zhaoyun/jxsy_icon_vipqj.png"
					}
				},
				{
					name = "buyBtn",
					h = 56,
					type = "button",
					w = 212,
					y = 70,
					x = 800,
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
							y = 35.6148,
							name = "res_icon_q19",
							type = "sprite",
							x = 40.0404,
							pic = {
								frame = true,
								path = "res_icon_19.png"
							},
							children = {
								{
									fontSize = 16,
									name = "Text_costq1",
									y = 8.7661,
									type = "label",
									textId = -1,
									style = "label_warlock",
									x = 27.0403,
									color = ccc3(255, 255, 255),
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentTop
								}
							}
						},
						{
							fontSize = 20,
							name = "Text_btn_q1",
							y = 33.0282,
							type = "label",
							textId = 320404,
							style = "label_warlock",
							x = 130.1676,
							color = ccc3(255, 255, 255),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentTop
						}
					}
				}
			}
		},
		{
			name = "jxNode",
			type = "node",
			children = {
				{
					y = 142,
					name = "jxsy_icon_jiujue_5",
					type = "sprite",
					x = 343.5608,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zhaoyun/jxsy_icon_jiujue.png"
					}
				},
				{
					y = 120,
					name = "lvdqj_mul_6",
					type = "sprite",
					x = 378.8235,
					pic = {
						frame = false,
						path = "res/ui/common/symbol/lvdqj_mul.png"
					}
				},
				{
					name = "AtlasLabel_1",
					type = "atlaslabel",
					pic = "res/ui/common/number/lm_tit_num.png",
					startCharMap = 48,
					text = "1",
					y = 120,
					itemWidth = 22,
					x = 393.8377,
					itemHeight = 32,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 82,
					name = "jxsy_word_d_1",
					type = "sprite",
					x = 362.2044,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zhaoyun/jxsy_word_d.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							y = 26,
							type = "richLine",
							x = 106.5,
							content = {
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320431,
									color = ccc3(255, 255, 255)
								},
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320432,
									color = colorQuality[6]
								}
							}
						}
					}
				},
				{
					name = "Button_1",
					h = 56,
					type = "button",
					w = 212,
					y = 30,
					x = 362.8187,
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
							y = 35.6148,
							name = "res_icon_19",
							type = "sprite",
							x = 40.0404,
							pic = {
								frame = true,
								path = "res_icon_19.png"
							},
							children = {
								{
									fontSize = 16,
									name = "Text_cost1",
									y = 8.7661,
									type = "label",
									textId = -1,
									style = "label_warlock",
									x = 27.0403,
									color = ccc3(255, 255, 255),
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentTop
								}
							}
						},
						{
							fontSize = 20,
							name = "Text_btn_1",
							y = 33.0282,
							type = "label",
							textId = 320404,
							style = "label_warlock",
							x = 130.1676,
							color = ccc3(255, 255, 255),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentTop
						}
					}
				},
				{
					y = 142,
					name = "jxsy_icon_jxj",
					type = "sprite",
					x = 580,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zhaoyun/jxsy_icon_jxj.png"
					}
				},
				{
					y = 120,
					name = "lvdqj_mul_6_0",
					type = "sprite",
					x = 620,
					pic = {
						frame = false,
						path = "res/ui/common/symbol/lvdqj_mul.png"
					}
				},
				{
					name = "AtlasLabel_2",
					type = "atlaslabel",
					pic = "res/ui/common/number/lm_tit_num.png",
					startCharMap = 48,
					text = "1",
					y = 120,
					itemWidth = 22,
					x = 636,
					itemHeight = 32,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 82,
					name = "jxsy_word_d_2",
					type = "sprite",
					x = 580,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zhaoyun/jxsy_word_d.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							y = 26,
							type = "richLine",
							x = 106.5,
							content = {
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320433,
									color = ccc3(255, 255, 255)
								},
								{
									fontSize = 20,
									style = "label_warlock",
									text = "1",
									type = "label",
									color = colorQuality[7]
								},
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320434,
									color = ccc3(255, 255, 255)
								},
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320432,
									color = colorQuality[6]
								}
							}
						}
					}
				},
				{
					name = "Button_2",
					h = 56,
					type = "button",
					w = 212,
					y = 30,
					x = 580,
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
							y = 35.6148,
							name = "res_icon_19",
							type = "sprite",
							x = 40.0404,
							pic = {
								frame = true,
								path = "res_icon_19.png"
							},
							children = {
								{
									fontSize = 16,
									name = "Text_cost2",
									y = 8.7661,
									type = "label",
									textId = -1,
									style = "label_warlock",
									x = 27.0403,
									color = colorQuality[7],
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentTop
								}
							}
						},
						{
							fontSize = 20,
							name = "Text_btn_2",
							y = 33.0282,
							type = "label",
							textId = 320404,
							style = "label_warlock",
							x = 130.1676,
							color = ccc3(255, 255, 255),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentTop
						}
					}
				},
				{
					y = 145.9487,
					name = "kfsy_jh_13",
					type = "sprite",
					scaleX = 0.8,
					x = 795.9002,
					scaleY = 0.8,
					pic = {
						frame = false,
						path = "res/ui/kfsy/kfsy_jh.png"
					}
				},
				{
					y = 120,
					name = "lvdqj_mul_6_1",
					type = "sprite",
					x = 835,
					pic = {
						frame = false,
						path = "res/ui/common/symbol/lvdqj_mul.png"
					}
				},
				{
					name = "AtlasLabel_3",
					type = "atlaslabel",
					pic = "res/ui/common/number/lm_tit_num.png",
					startCharMap = 48,
					text = "1",
					y = 120,
					itemWidth = 22,
					x = 850,
					itemHeight = 32,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 82,
					name = "jxsy_word_d_3",
					type = "sprite",
					x = 800,
					pic = {
						frame = false,
						path = "res/ui/kfsy/zhaoyun/jxsy_word_d.png"
					},
					children = {
						{
							anchorPointX = 0.5,
							y = 26,
							type = "richLine",
							x = 106.5,
							content = {
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320435,
									color = ccc3(255, 255, 255)
								},
								{
									fontSize = 20,
									style = "label_warlock",
									type = "label",
									textId = 320432,
									color = colorQuality[6]
								}
							}
						}
					}
				},
				{
					name = "Button_3",
					h = 56,
					type = "button",
					w = 212,
					y = 30,
					x = 800,
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
							y = 35.6148,
							name = "res_icon_19",
							type = "sprite",
							x = 40.0404,
							pic = {
								frame = true,
								path = "res_icon_19.png"
							},
							children = {
								{
									fontSize = 16,
									name = "Text_cost3",
									y = 8.7661,
									type = "label",
									textId = -1,
									style = "label_warlock",
									x = 27.0403,
									color = colorQuality[7],
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentTop
								}
							}
						},
						{
							fontSize = 20,
							name = "Text_btn_3",
							y = 33.0282,
							type = "label",
							textId = 320404,
							style = "label_warlock",
							x = 130.1676,
							color = ccc3(255, 255, 255),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentTop
						}
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	if arg_2_1 then
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0:getInfo(handler(arg_2_0, arg_2_0.init))
end

function var_0_0.init(arg_3_0)
	arg_3_0.localData = {}

	arg_3_0:initLayout(arg_3_0, arg_3_0.layout)
	arg_3_0:initHandlers()
end

function var_0_0.initHandlers(arg_4_0)
	arg_4_0.view.widgets.btn_close:addHandleOfControlEvent(handler(arg_4_0, arg_4_0.close), CCControlEventTouchUpInside)
	arg_4_0.view.widgets.Button_1:addHandleOfControlEvent(function()
		local function var_5_0(arg_6_0)
			if arg_6_0.action.state == 1 then
				local var_6_0 = {}

				for iter_6_0, iter_6_1 in ipairs(arg_6_0.action.data.rewards) do
					table.insert(var_6_0, {
						id = tonumber(iter_6_1.type),
						value = tonumber(iter_6_1.value)
					})
				end

				globalAction_gotResource(var_6_0)

				if arg_6_0.action.data.baoji == 2 or arg_6_0.action.data.baoji == 4 or arg_6_0.action.data.baoji == 10 then
					if arg_4_0.view.widgets.jxsy_icon_jiujue_5:getChildByTag(1) then
						arg_4_0.view.widgets.jxsy_icon_jiujue_5:removeChildByTag(1, true)
					end

					local var_6_1 = CCSprite:create(string.format("res/ui/resource/incense/js_word_%d.png", arg_6_0.action.data.baoji))

					var_6_1:setPosition(ccp(28, 53.9))
					var_6_1:setScale(0.5)
					arg_4_0.view.widgets.jxsy_icon_jiujue_5:addChild(var_6_1, 0, 1)

					local var_6_2 = CCArray:create()

					var_6_2:addObject(CCEaseExponentialOut:create(CCScaleBy:create(0.3, 2)))
					var_6_2:addObject(CCEaseExponentialIn:create(CCScaleBy:create(0.4, 0.5)))
					var_6_2:addObject(CCCallFunc:create(function()
						var_6_1:removeFromParentAndCleanup(true)
					end))

					local var_6_3 = CCSequence:create(var_6_2)

					var_6_1:runAction(var_6_3)
				end

				if arg_4_0.localData.freeDrinkTime > 0 then
					arg_4_0.localData.freeDrinkTime = arg_4_0.localData.freeDrinkTime - 1

					arg_4_0.view.widgets.Text_cost1:setString(language.get(320436, arg_4_0.localData.freeDrinkTime))

					if arg_4_0.localData.freeDrinkTime == 0 then
						arg_4_0.view.widgets.Text_cost1:setColor(colorQuality[7])
						arg_4_0.view.widgets.Text_cost1:setString(20)

						arg_4_0.localData.specialDrinkGold = 20
					end
				elseif arg_4_0.localData.specialDrinkGold < 200 then
					arg_4_0.localData.specialDrinkGold = arg_4_0.localData.specialDrinkGold + 2

					arg_4_0.view.widgets.Text_cost1:setString(arg_4_0.localData.specialDrinkGold)
				end
			end
		end

		if arg_4_0.localData.freeDrinkTime > 0 then
			cmgr.sendRequest(var_5_0, actions.sepcialDrink)
		else
			messageBox.showChargeWin(language.get(10003), language.get(320439), "specialDrink", function()
				cmgr.sendRequest(var_5_0, actions.sepcialDrink)
			end)
		end
	end, CCControlEventTouchUpInside)
	arg_4_0.view.widgets.Button_2:addHandleOfControlEvent(function()
		local function var_9_0(arg_10_0)
			if arg_10_0.action.state == 1 then
				local var_10_0 = {}

				table.insert(var_10_0, {
					id = 1213,
					value = arg_10_0.action.data.card
				})
				table.insert(var_10_0, {
					id = 114,
					value = arg_10_0.action.data.drinkNum
				})
				globalAction_gotResource(var_10_0)

				arg_4_0.localData.goldCard1 = arg_4_0.localData.goldCard1 + 2

				arg_4_0.view.widgets.Text_cost2:setString(arg_4_0.localData.goldCard1)
			end
		end

		messageBox.showChargeWin(language.get(10003), language.get(320437, 1), "kfzbFeastLvbuCard", function()
			cmgr.sendRequest(var_9_0, actions.kfsyBuyCard, 1)
		end)
	end, CCControlEventTouchUpInside)
	arg_4_0.view.widgets.Button_3:addHandleOfControlEvent(function()
		local function var_12_0(arg_13_0)
			if arg_13_0.action.state == 1 then
				local var_13_0 = {}

				table.insert(var_13_0, {
					id = 20000,
					value = tonumber(arg_13_0.action.data.drinkNum)
				})
				globalAction_gotResource(var_13_0)
			end
		end

		messageBox.showChargeWin("", language.get(320441, 1), "feastBuyDrink", function()
			cmgr.sendRequest(var_12_0, actions.kfsyBuyDrink)
		end)
	end, CCControlEventTouchUpInside)
	arg_4_0.view.widgets.buyBtn:addHandleOfControlEvent(function()
		local function var_15_0(arg_16_0)
			if arg_16_0.action.state == 1 then
				local var_16_0 = {}

				table.insert(var_16_0, {
					id = 1213,
					value = arg_16_0.action.data.card
				})
				globalAction_gotResource(var_16_0)

				arg_4_0.localData.goldCard1 = arg_4_0.localData.goldCard1 + 2

				arg_4_0.view.widgets.Text_costq1:setString(arg_4_0.localData.goldCard1)
			end
		end

		messageBox.showChargeWin(language.get(10003), language.get(320437, 1), "kfzbFeastLvbuCard", function()
			cmgr.sendRequest(var_15_0, actions.kfsyBuyCard, 1)
		end)
	end, CCControlEventTouchUpInside)
end

function var_0_0.getInfo(arg_18_0, arg_18_1)
	if arg_18_1 then
		arg_18_1()
	end
end

function var_0_0.initLayout(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.view = {}

	uiutil.initWidgets(arg_19_0.view, arg_19_2)
	swallowTouch(arg_19_0)
	arg_19_1:addChild(arg_19_0.view.widgets.zhaoyun_bg)
end

function var_0_0.show(arg_20_0, arg_20_1)
	arg_20_0.data = arg_20_1
	arg_20_0.localData.freeDrinkTime = arg_20_0.localData.freeDrinkTime or arg_20_1.remainFreeDrinkTime
	arg_20_0.localData.specialDrinkGold = arg_20_0.localData.specialDrinkGold or arg_20_1.specialDrinkGold
	arg_20_0.localData.goldCard1 = arg_20_0.localData.goldCard1 or arg_20_1.goldCard1
	arg_20_0.localData.goldDrink = arg_20_1.goldDrink

	arg_20_0:initRankingList(arg_20_0.data)
	arg_20_0:initBtnState(arg_20_0.data)
	arg_20_0:setVisible(true)
end

function var_0_0.initRankingList(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:getFirstThree(arg_21_1)

	arg_21_0.view.widgets.Text_4:setString(tostring(var_21_0[1].pos))
	arg_21_0.view.widgets.Text_5:setString(tostring(var_21_0[2].pos))
	arg_21_0.view.widgets.Text_6:setString(tostring(var_21_0[3].pos))
	arg_21_0.view.widgets.Text_7:setString(tostring(var_21_0[1].playerName))
	arg_21_0.view.widgets.Text_8:setString(tostring(var_21_0[2].playerName))
	arg_21_0.view.widgets.Text_9:setString(tostring(var_21_0[3].playerName))
end

function var_0_0.initBtnState(arg_22_0, arg_22_1)
	if arg_22_1.evokeOpen then
		arg_22_0.view.widgets.jxNode:setVisible(true)
		arg_22_0.view.widgets.nJxNode:setVisible(false)
	else
		arg_22_0.view.widgets.jxNode:setVisible(false)
		arg_22_0.view.widgets.nJxNode:setVisible(true)
	end

	if arg_22_1.remainFreeDrinkTime > 0 then
		arg_22_0.view.widgets.Text_cost1:setColor(ccc3(255, 255, 255))
		arg_22_0.view.widgets.Text_cost1:setString(language.get(320436, arg_22_0.localData.freeDrinkTime))
	else
		arg_22_0.view.widgets.Text_cost1:setColor(colorQuality[7])
		arg_22_0.view.widgets.Text_cost1:setString(arg_22_0.localData.specialDrinkGold)
	end

	arg_22_0.view.widgets.Text_cost2:setString(arg_22_0.localData.goldCard1)
	arg_22_0.view.widgets.Text_cost3:setString(arg_22_0.localData.goldDrink)
	arg_22_0.view.widgets.Text_costq1:setString(arg_22_0.localData.goldCard1)

	if not arg_22_1.isTop16 then
		arg_22_0.view.widgets.Button_3:setEnabled(false)
	end
end

function var_0_0.close(arg_23_0)
	arg_23_0:setVisible(false)
end

function var_0_0.getFirstThree(arg_24_0, arg_24_1)
	local function var_24_0(arg_25_0, arg_25_1, arg_25_2)
		local var_25_0 = arg_25_0[arg_25_2]
		local var_25_1

		for iter_25_0 = arg_25_2, 0, -1 do
			var_25_1 = iter_25_0

			if not arg_25_0[iter_25_0] then
				break
			end

			if arg_25_1.totalNum > arg_25_0[iter_25_0].totalNum then
				var_25_0 = arg_25_1

				if iter_25_0 ~= arg_25_2 then
					arg_25_0[iter_25_0 + 1] = arg_25_0[iter_25_0]
				else
					arg_25_0[iter_25_0] = nil
				end
			else
				break
			end
		end

		if var_25_1 ~= arg_25_2 then
			arg_25_0[var_25_1 + 1] = var_25_0
		end
	end

	local var_24_1 = {
		{
			pos = 0,
			totalNum = -1,
			palyerName = ""
		},
		{
			pos = 0,
			totalNum = -1,
			palyerName = ""
		},
		{
			pos = 0,
			totalNum = -1,
			palyerName = ""
		}
	}

	for iter_24_0, iter_24_1 in ipairs(arg_24_1.rooms) do
		local var_24_2 = iter_24_1.weiNum + iter_24_1.shuNum + iter_24_1.wuNum

		var_24_0(var_24_1, {
			playerName = iter_24_1.playerName,
			totalNum = var_24_2,
			pos = iter_24_1.pos
		}, #var_24_1)
	end

	return var_24_1
end

return var_0_0
