local var_0_0 = class("RewardGeneral", function()
	return createBaseLayer()
end)
local var_0_1 = 10
local var_0_2 = require("res/native/offset").get("layer.activity.generalReward")

var_0_0.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/comment/bg1.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			x = 458,
			y = 470,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/GeneralReward/kssj_title.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 460,
			type = "label",
			style = "label_warlock",
			x = 730 + (var_0_2.lefttimeOffsetX or 0),
			anchorPoint = ccp(0.5, 0.5),
			color = colorQuality[5]
		},
		{
			x = 458,
			name = "main_background",
			y = 225,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/GeneralReward/kssj_bg.jpg"
			},
			children = {
				{
					y = 374,
					x = 85,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_sys_d.png"
					},
					children = {
						{
							x = 115,
							y = 31,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/GeneralReward/kssj_gift_samll.png"
							}
						},
						{
							text = "1/100",
							name = "num_max",
							y = 31,
							type = "label",
							style = "label_warlock",
							x = 52,
							fontSize = 22,
							color = ccc3(255, 255, 255)
						}
					}
				},
				{
					x = 615,
					name = "rewardBigBox",
					y = 330,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/ancientCastle/big_1.png"
					},
					children = {
						{
							x = 120,
							y = 36,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/GeneralReward/scpm_word_digit_x.png"
							}
						},
						{
							name = "num_bigbox",
							type = "atlaslabel",
							pic = "res/ui/common/number/scpm_word_digit.png",
							startCharMap = 48,
							text = "0",
							y = 35,
							itemWidth = 21,
							x = 150,
							itemHeight = 32,
							anchorPoint = ccp(0.5, 0.5)
						}
					}
				},
				{
					x = 615,
					name = "Allopen",
					y = 330,
					type = "sprite",
					zorder = 100,
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_end_word_01.png"
					}
				},
				{
					name = "btn_buyBeer",
					h = 56,
					type = "button",
					w = 189,
					y = 230,
					x = 500,
					normal = {
						path = "res/ui/common/button/sdyjs_btn_03.png"
					},
					touched = {
						path = "res/ui/common/button/sdyjs_btn_03_c.png"
					},
					disable = {
						path = "res/ui/common/button/sdyjs_btn_03_g.png"
					},
					children = {
						{
							y = 30,
							x = 40,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/GeneralReward/public_btn_gold.png"
							},
							children = {
								{
									x = 42,
									y = 27,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_19_small.png"
									}
								},
								{
									text = "10",
									name = "gold_beer_1",
									y = 16,
									type = "label",
									style = "label_warlock",
									x = 42,
									fontSize = 22,
									color = ccc3(255, 255, 255)
								},
								{
									style = "label_warlock",
									fontSize = 22,
									type = "label",
									y = 27,
									x = 119,
									text = language.get(135988),
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				},
				{
					name = "btn_buyMeat",
					h = 56,
					type = "button",
					w = 189,
					y = 230,
					x = 750,
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
							y = 30,
							x = 40,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/GeneralReward/public_btn_gold.png"
							},
							children = {
								{
									x = 42,
									y = 27,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_19_small.png"
									}
								},
								{
									text = "10",
									name = "gold_meat_1",
									y = 16,
									type = "label",
									style = "label_warlock",
									x = 42,
									fontSize = 22,
									color = ccc3(255, 255, 255)
								},
								{
									style = "label_warlock",
									fontSize = 22,
									type = "label",
									y = 27,
									x = 119,
									text = language.get(135989),
									color = ccc3(255, 255, 255)
								}
							}
						}
					}
				},
				{
					x = 150,
					name = "halfGeneralPic",
					y = 211,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_zhangliang.png"
					},
					children = {
						{
							text = "Lv.100",
							name = "generalLevel",
							y = 15,
							type = "label",
							style = "label_warlock",
							x = 51,
							fontSize = 22,
							color = colorText[10001]
						},
						{
							text = "ZL",
							name = "generalName",
							y = 15,
							type = "label",
							style = "label_warlock",
							x = 131,
							fontSize = 22,
							color = ccc3(255, 255, 255)
						},
						{
							x = 200,
							name = "rewardsmallBox",
							y = 10,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/ancientCastle/tbxz_pb_box.png"
							},
							children = {
								{
									x = 65,
									y = 28,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/GeneralReward/scpm_word_digit_x.png"
									}
								},
								{
									name = "num_smallBox",
									type = "atlaslabel",
									pic = "res/ui/common/number/scpm_word_digit.png",
									startCharMap = 48,
									text = "1",
									y = 28,
									itemWidth = 21,
									x = 95,
									itemHeight = 32,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						}
					}
				},
				{
					y = 48,
					x = 150,
					type = "sprite",
					scaleX = 2,
					scaleY = 1.2,
					pic = {
						frame = false,
						path = "res/ui/silk/market/scpm_word_d.png"
					}
				},
				{
					y = 49,
					x = 153,
					scale = 0.55,
					type = "sprite",
					pic = {
						frame = true,
						path = "zyzh_pb_bg.png"
					},
					children = {
						{
							y = 14,
							name = "progress",
							type = "progressbar",
							x = 211,
							anchorPoint = ccp(0.5, 0.5),
							progressType = kCCProgressTimerTypeBar,
							pic = {
								frame = true,
								path = "zyzh_pb.png"
							}
						}
					}
				},
				{
					text = "0/0",
					name = "expWord",
					y = 49,
					type = "label",
					style = "label_warlock",
					x = 153,
					fontSize = 20,
					color = colorText[10001]
				},
				{
					x = 431,
					y = 122,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_icon_j_big.png"
					}
				},
				{
					y = 41,
					x = 431,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_digit_d.png"
					},
					children = {
						{
							text = "100",
							name = "need_beer",
							y = 21,
							type = "label",
							style = "label_warlock",
							x = 60,
							fontSize = 22,
							color = ccc3(255, 255, 255)
						}
					}
				},
				{
					x = 575,
					y = 116,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_icon_nr_big.png"
					}
				},
				{
					y = 41,
					x = 575,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_digit_d.png"
					},
					children = {
						{
							text = "100",
							name = "need_meat",
							y = 21,
							type = "label",
							style = "label_warlock",
							x = 60,
							fontSize = 22,
							color = ccc3(255, 255, 255)
						}
					}
				},
				{
					y = 90,
					x = 794,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/GeneralReward/kssj_btn_d.png"
					},
					children = {
						{
							name = "btn_kaoshang",
							h = 62,
							type = "button",
							w = 195,
							y = 36,
							x = 103,
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
									y = 33,
									x = 48,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/GeneralReward/public_btn_gold.png"
									},
									children = {
										{
											x = 42,
											y = 27,
											type = "sprite",
											pic = {
												frame = true,
												path = "res_icon_19_small.png"
											}
										},
										{
											text = "10",
											name = "gold_kaoshang_1",
											y = 16,
											type = "label",
											style = "label_warlock",
											x = 42,
											fontSize = 22,
											color = ccc3(255, 255, 255)
										},
										{
											fontSize = 22,
											height = 44,
											x = 115,
											type = "label",
											style = "label_warlock",
											y = 25,
											width = 93,
											text = language.get(135994),
											color = ccc3(255, 255, 255),
											halign = kCCTextAlignmentCenter,
											valign = kCCVerticalTextAlignmentCenter
										}
									}
								}
							}
						},
						{
							y = 55,
							x = 15,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/default.png"
							},
							children = {
								{
									x = 54,
									y = 36,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/GeneralReward/kssj_icon_j.png"
									}
								},
								{
									x = 85,
									y = 36,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/GeneralReward/scpm_word_digit_x.png"
									}
								},
								{
									name = "num_beer",
									type = "atlaslabel",
									pic = "res/ui/common/number/scpm_word_digit.png",
									startCharMap = 48,
									text = "10",
									y = 35,
									itemWidth = 21,
									x = 130,
									itemHeight = 32,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						},
						{
							y = 100,
							x = 15,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/default.png"
							},
							children = {
								{
									x = 49,
									y = 36,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/GeneralReward/kssj_icon_nr.png"
									}
								},
								{
									x = 85,
									y = 36,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/GeneralReward/scpm_word_digit_x.png"
									}
								},
								{
									name = "num_meat",
									type = "atlaslabel",
									pic = "res/ui/common/number/scpm_word_digit.png",
									startCharMap = 48,
									text = "10",
									y = 35,
									itemWidth = 21,
									x = 130,
									itemHeight = 32,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						}
					}
				},
				{
					y = 465,
					name = "btn_tip",
					h = 42,
					type = "button",
					w = 42,
					x = 880,
					normal = {
						frame = true,
						path = "btnTip_a.png"
					},
					touched = {
						frame = true,
						path = "btnTip_c.png"
					}
				}
			}
		}
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	rmgr.loadResource("res/ui/activity/betray/betrayPic.plist")

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.panel)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0.data = arg_2_2

	arg_2_0:setData()

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	arg_2_0:addBigBox()
	arg_2_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("kaochang tips")
		arg_2_0:handleBuyTipsButtonTap()
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_buyMeat:addHandleOfControlEvent(function()
		log.info("btn_buyMeat")
		messageBox.showChargeWinWithData(language.get(10003), language.get(136000, arg_2_0.data.boxInfo.gold5), "generalOpenBox", function()
			arg_2_0:handleopenBox(2)
		end)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_buyBeer:addHandleOfControlEvent(function()
		log.info("btn_buyBeer")
		messageBox.showChargeWinWithData(language.get(10003), language.get(136000, arg_2_0.data.boxInfo.gold2), "generalOpenBox", function()
			arg_2_0:handleopenBox(1)
		end)
	end, CCControlEventTouchUpInside)
	arg_2_0.view.widgets.btn_kaoshang:addHandleOfControlEvent(function()
		log.info("btn_kaoshang")

		if arg_2_0.data.rewardNeedTotalMoney and arg_2_0.data.rewardNeedTotalMoney > 0 then
			messageBox.showChargeWinWithData(language.get(10003), language.get(136020, arg_2_0.data.rewardNeedTotalMoney), "generalRewardBuyAllFood", function()
				arg_2_0:kaoshang()
			end)
		else
			arg_2_0:kaoshang()
		end
	end, CCControlEventTouchUpInside)
end

function var_0_0.setData(arg_10_0)
	arg_10_0.view.widgets.num_max:setString(arg_10_0.data.index .. "/" .. arg_10_0.data.totalGeneralNum)
	arg_10_0.view.widgets.halfGeneralPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/halfPic/halfPic_%s.png", arg_10_0.data.pic)):displayFrame())
	arg_10_0.view.widgets.generalLevel:setString("Lv." .. arg_10_0.data.generalLv)
	arg_10_0.view.widgets.generalName:setString(arg_10_0.data.generalName)
	arg_10_0.view.widgets.progress:setPercentage(100 * arg_10_0.data.generalExp / arg_10_0.data.generalExpMax or 100)

	local var_10_0 = arg_10_0.data.generalExp
	local var_10_1 = arg_10_0.data.generalExpMax
	local var_10_2 = arg_10_0.data.generalExp .. "/" .. arg_10_0.data.generalExpMax

	if var_10_0 > 10000 then
		var_10_0 = math.modf(var_10_0 / 10000)
	end

	if var_10_1 > 10000 then
		local var_10_3 = math.modf(var_10_1 / 10000)

		var_10_2 = var_10_0 .. "W/" .. var_10_3 .. "W"
	end

	arg_10_0.view.widgets.expWord:setString(var_10_2)
	arg_10_0.view.widgets.num_beer:setString(arg_10_0.data.beaf or 0)
	arg_10_0.view.widgets.num_meat:setString(arg_10_0.data.nuts or 0)
	arg_10_0.view.widgets.need_beer:setString(arg_10_0.data.costBeaf or 100)
	arg_10_0.view.widgets.need_meat:setString(arg_10_0.data.costNuts or 100)
	arg_10_0.view.widgets.gold_kaoshang_1:setString(arg_10_0.data.rewardNeedTotalMoney or 0)

	if arg_10_0.data.boxInfo then
		arg_10_0.view.widgets.gold_beer_1:setString(arg_10_0.data.boxInfo.gold2)
		arg_10_0.view.widgets.gold_meat_1:setString(arg_10_0.data.boxInfo.gold5)
		arg_10_0.view.widgets.num_smallBox:setString(arg_10_0.data.boxInfo.rewardBoxNum)
		arg_10_0.view.widgets.num_bigbox:setString(arg_10_0.data.boxInfo.boxNum)

		if arg_10_0.data.boxInfo.rewardBoxNum > 0 then
			arg_10_0.view.widgets.rewardsmallBox:setVisible(true)
		else
			arg_10_0.view.widgets.rewardsmallBox:setVisible(false)
		end

		if arg_10_0.data.boxInfo.boxNum > 0 or arg_10_0.data.boxInfo.rewardBoxNum > 0 then
			arg_10_0.view.widgets.rewardBigBox:setVisible(true)
			arg_10_0.view.widgets.Allopen:setVisible(false)
			arg_10_0.view.widgets.btn_buyBeer:setVisible(true)
			arg_10_0.view.widgets.btn_buyMeat:setVisible(true)
		else
			arg_10_0.view.widgets.rewardBigBox:setVisible(false)
			arg_10_0.view.widgets.Allopen:setVisible(true)
			arg_10_0.view.widgets.Allopen:removeAllChildrenWithCleanup(true)
			table.sort(arg_10_0.data.rewardList, function(arg_11_0, arg_11_1)
				return arg_11_0.type < arg_11_1.type
			end)

			local var_10_4 = CCSprite:create("res/ui/activity/GeneralReward/kssj_end_word_02.png")
			local var_10_5 = CCLabelAtlas:create(arg_10_0.data.rewardList[1].num / 10000, "res/ui/common/number/scpm_word_digit.png", 21, 32, 48)

			var_10_5:setAnchorPoint(ccp(0.5, 0.5))

			local var_10_6 = CCSprite:create("res/ui/activity/GeneralReward/kssj_end_word_03.png")
			local var_10_7 = CCLabelAtlas:create(arg_10_0.data.rewardList[2].num, "res/ui/common/number/scpm_word_digit.png", 21, 32, 48)

			var_10_7:setAnchorPoint(ccp(0.5, 0.5))

			local var_10_8 = CCSprite:create("res/ui/activity/GeneralReward/kssj_end_word_04.png")
			local var_10_9 = createRichNode({
				var_10_4,
				var_10_5,
				var_10_6,
				var_10_7,
				var_10_8
			}, 0.5)

			var_10_9:setPosition(ccp(110, -30))
			arg_10_0.view.widgets.Allopen:addChild(var_10_9)
			arg_10_0.view.widgets.btn_buyBeer:setVisible(false)
			arg_10_0.view.widgets.btn_buyMeat:setVisible(false)
		end
	end

	arg_10_0:addBigBox()
end

function var_0_0.handleBuyTipsButtonTap(arg_12_0)
	local var_12_0 = {}
	local var_12_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_12_1:registerScriptTouchHandler(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHBEGAN then
			return true
		elseif arg_13_0 == CCTOUCHMOVED then
			return true
		elseif arg_13_0 == CCTOUCHENDED then
			pcall(var_12_1.removeFromParentAndCleanup, var_12_1, true)

			return true
		end
	end, false, true)
	var_12_1:setTouchEnabled(true)
	autoUI.createUI(var_12_1, arg_12_0:getTipData(), var_12_0)

	if var_12_0.tipLabel:getContentSize().width > 830 then
		local var_12_2 = 830

		var_12_0.tipLabel:setDimensions(CCSizeMake(830, 0))
	end

	local var_12_3 = tolua.cast(var_12_0.tipLabel:getParent(), "CCScale9Sprite")
	local var_12_4 = CCSizeMake(var_12_0.tipLabel:getContentSize().width + 40, var_12_0.tipLabel:getContentSize().height + 40)
	local var_12_5, var_12_6 = tool.getPositionInScreen(arg_12_0.view.widgets.btn_tip)

	if var_12_3 then
		var_12_3:setPreferredSize(var_12_4)
		var_12_3:setPosition(ccp(var_12_5 - var_12_4.width, var_12_6 - var_12_4.height))
	end

	var_12_0.tipLabel:setPosition(ccp(var_12_4.width * 0.5, var_12_4.height * 0.5))
	smgr.rootLayer:addChild(var_12_1, 60000)
end

function var_0_0.handleBuyFood(arg_14_0, arg_14_1, arg_14_2)
	local function var_14_0(arg_15_0)
		local var_15_0 = {}

		if arg_15_0.action.data.msg then
			if arg_14_1 == 2 then
				var_15_0[1] = {}
				var_15_0[1].id = 56
				var_15_0[1].value = arg_14_2
			elseif arg_14_1 == 1 then
				var_15_0[1] = {}
				var_15_0[1].id = 57
				var_15_0[1].value = arg_14_2
			end

			globalAction_gotResource(var_15_0)

			local function var_15_1(arg_16_0)
				arg_14_0.data = arg_16_0.action.data

				arg_14_0:setData()
			end

			cmgr.sendRequest(var_15_1, actions.getRewardGeneralActivity)
		end
	end

	cmgr.sendRequest(var_14_0, actions.buyFood, arg_14_1, arg_14_2)
end

function var_0_0.handleopenBox(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		local var_18_0 = {}

		if arg_18_0.action.data.reward then
			if arg_18_0.action.data.reward[1].type == 102 then
				arg_18_0.action.data.reward[1].type = 41
			elseif arg_18_0.action.data.reward[1].type == 5 then
				arg_18_0.action.data.reward[1].type = 6
			end

			if arg_17_1 == 2 then
				for iter_18_0 = 1, 5 do
					var_18_0[iter_18_0] = {}
					var_18_0[iter_18_0].id = arg_18_0.action.data.reward[1].type
					var_18_0[iter_18_0].value = arg_18_0.action.data.reward[1].num / 5
				end
			elseif arg_17_1 == 1 then
				for iter_18_1 = 1, 2 do
					var_18_0[iter_18_1] = {}
					var_18_0[iter_18_1].id = arg_18_0.action.data.reward[1].type
					var_18_0[iter_18_1].value = arg_18_0.action.data.reward[1].num / 2
				end
			end

			globalAction_gotResource(var_18_0)

			local function var_18_1(arg_19_0)
				arg_17_0.data = arg_19_0.action.data

				arg_17_0:setData()
			end

			cmgr.sendRequest(var_18_1, actions.getRewardGeneralActivity)
		end
	end

	cmgr.sendRequest(var_17_0, actions.openRewardGeneralBox, arg_17_1)
end

function var_0_0.kaoshang(arg_20_0)
	local function var_20_0(arg_21_0)
		if arg_21_0.action.data then
			arg_20_0.data = arg_21_0.action.data

			arg_20_0:setData()

			local function var_21_0(arg_22_0)
				if arg_22_0.action.data then
					local var_22_0 = arg_22_0.action.data

					arg_20_0.data.generalExp = var_22_0.curExp
					arg_20_0.data.generalExpMax = var_22_0.curExpMax
					arg_20_0.data.generalLv = var_22_0.curLv

					arg_20_0:setData()

					local var_22_1 = {
						{}
					}

					var_22_1[1].id = 20011
					var_22_1[1].value = var_22_0.exp

					if var_22_0.boxNum and var_22_0.boxNum > 0 then
						var_22_1[2] = {}
						var_22_1[2].id = 10031
						var_22_1[2].value = var_22_0.boxNum
					end

					globalAction_gotResource(var_22_1)

					if var_22_0.bingoTimes == 2 or var_22_0.bingoTimes == 4 or var_22_0.bingoTimes == 10 then
						local var_22_2 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_22_0.bingoTimes .. ".png")
						local var_22_3 = ccp(visibleSize.width / 2, visibleSize.height * 0.35)

						var_22_2:setPosition(var_22_3)
						var_22_2:setScale(1.5)
						arg_20_0.view.widgets.panel:addChild(var_22_2, 100)

						local var_22_4 = CCArray:create()

						var_22_4:addObject(CCDelayTime:create(0.3))
						var_22_4:addObject(CCFadeOut:create(1))
						var_22_4:addObject(CCCallFunc:create(function()
							var_22_2:removeFromParentAndCleanup(true)

							var_22_2 = nil
						end))
						var_22_2:runAction(CCSequence:create(var_22_4))
					end

					arg_20_0:addWord()
				end
			end

			cmgr.sendRequest(var_21_0, actions.kaoshang, 0)
		end
	end

	cmgr.sendRequest(var_20_0, actions.getRewardGeneralActivity)
end

function var_0_0.bigReward(arg_24_0)
	local function var_24_0(arg_25_0)
		if arg_25_0.action.data then
			local var_25_0 = arg_25_0.action.data
			local var_25_1 = {}

			for iter_25_0, iter_25_1 in ipairs(var_25_0.reward) do
				if iter_25_1.type == 49 then
					iter_25_1.type = 48
				end

				local var_25_2 = {
					id = iter_25_1.type,
					value = iter_25_1.value
				}

				table.insert(var_25_1, var_25_2)
			end

			globalAction_gotResource(var_25_1)

			local function var_25_3(arg_26_0)
				arg_24_0.data = arg_26_0.action.data

				arg_24_0:setData()
			end

			cmgr.sendRequest(var_25_3, actions.getRewardGeneralActivity)
		end
	end

	cmgr.sendRequest(var_24_0, actions.kaoshangBigReward)
end

function var_0_0.addBigBox(arg_27_0)
	if arg_27_0.view.widgets.finalBigBoxBg then
		arg_27_0.view.widgets.finalBigBoxBg:removeFromParentAndCleanup(true)

		arg_27_0.view.widgets.finalBigBoxBg = nil
		arg_27_0.view.widgets.finalBigBox = nil
	end

	if arg_27_0.data.state == 2 then
		local var_27_0 = {
			tipsBg = {
				xcenter = 0,
				name = "finalBigBoxBg",
				type = "pic_9_tips",
				anchorPointX = 0.5,
				ycenter = 0,
				pic = "frame:common_tip_frame_small.png",
				anchorPointY = 0.5,
				showInCenter = true,
				middleRect = CCRectMake(0, 0, 0, 0),
				preferedSize = CCSizeMake(290, 300),
				content = {
					{
						fontSize = 22,
						height = 50,
						type = "label",
						width = 600,
						text = language.get(136002)
					},
					{
						name = "finalBigBox",
						pic = "res/ui/activity/GeneralReward/kssj_gift.png",
						type = "pic"
					}
				}
			}
		}
		local var_27_1 = {}
		local var_27_2 = autoUI.initUI(arg_27_0.view.widgets.main_background, var_27_0)

		arg_27_0.view.widgets.finalBigBoxBg = var_27_2.finalBigBoxBg
		arg_27_0.view.widgets.finalBigBox = var_27_2.finalBigBox
	end
end

function var_0_0.addWord(arg_28_0)
	if arg_28_0.view.widgets.generalWord then
		arg_28_0.view.widgets.generalWord:removeFromParentAndCleanup(true)

		arg_28_0.view.widgets.generalWord = nil
	end

	local var_28_0 = {
		tipsBg = {
			xcenter = -10,
			name = "generalWordBg",
			type = "pic_9_tips",
			anchorPointX = 0.5,
			ycenter = 60,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			showInCenter = true,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					height = 50,
					type = "label",
					width = 400,
					text = language.get(math.random(0, 3) + 136004)
				}
			}
		}
	}
	local var_28_1 = {}
	local var_28_2 = autoUI.initUI(arg_28_0.view.widgets.main_background, var_28_0)

	arg_28_0.view.widgets.generalWord = var_28_2.generalWordBg

	local var_28_3 = CCArray:create()

	var_28_3:addObject(CCDelayTime:create(1.5))
	var_28_3:addObject(CCCallFunc:create(function()
		var_28_2.generalWordBg:removeFromParentAndCleanup(true)

		var_28_2.generalWordBg = nil
		arg_28_0.view.widgets.generalWord = nil

		local function var_29_0(arg_30_0)
			arg_28_0.data = arg_30_0.action.data

			arg_28_0:setData()
		end

		cmgr.sendRequest(var_29_0, actions.getRewardGeneralActivity)
	end))
	var_28_2.generalWordBg:runAction(CCSequence:create(var_28_3))
end

function var_0_0.getTipData(arg_31_0)
	return {
		xcenter = -50,
		name = "GemKitTipFrame",
		type = "pic_9",
		anchorPointX = 0,
		ycenter = 0,
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0,
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(480, 140),
		children = {
			{
				xcenter = 0,
				name = "tipLabel",
				fontSize = 20,
				anchorPointX = 0.5,
				ycenter = 0,
				z = 10,
				type = "label",
				anchorPointY = 0.5,
				text = language.get(136010),
				color = ccc3(188, 167, 145),
				align = kCCTextAlignmentLeft
			}
		}
	}
end

function var_0_0.onEnter(arg_32_0)
	arg_32_0.touchBeganRef = handler(arg_32_0, arg_32_0.onTouchBegan)
	arg_32_0.touchMovedRef = handler(arg_32_0, arg_32_0.onTouchMoved)
	arg_32_0.touchEndedRef = handler(arg_32_0, arg_32_0.onTouchEnded)
	arg_32_0.touchCancelledRef = handler(arg_32_0, arg_32_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_32_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_32_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_32_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_32_0.touchCancelledRef)

	arg_32_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_32_0, arg_32_0.update), 0, false)
end

function var_0_0.onExit(arg_33_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_33_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_33_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_33_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_33_0.touchCancelledRef)

	if arg_33_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_33_0.updateRef)
	end
end

function var_0_0.update(arg_34_0, arg_34_1)
	return
end

function var_0_0.onTouchBegan(arg_35_0, arg_35_1, arg_35_2)
	return
end

function var_0_0.onTouchMoved(arg_36_0, arg_36_1, arg_36_2)
	return
end

function var_0_0.onTouchEnded(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_0.view.widgets.finalBigBox and tool.checkIfTouch(arg_37_0.view.widgets.finalBigBox, arg_37_1, arg_37_2) then
		arg_37_0:bigReward()
	end

	if arg_37_0.view.widgets.source_beer and tool.checkIfTouch(arg_37_0.view.widgets.source_beer, arg_37_1, arg_37_2) then
		rankInfoUI.show(1)
	end

	if arg_37_0.view.widgets.source_meat and tool.checkIfTouch(arg_37_0.view.widgets.source_meat, arg_37_1, arg_37_2) and smgr.currentSceneTag ~= SCENE_WORLD then
		smgr.changeScene(SCENE_WORLD)
	end
end

function var_0_0.onTouchCancelled(arg_38_0, arg_38_1, arg_38_2)
	return
end

return var_0_0
