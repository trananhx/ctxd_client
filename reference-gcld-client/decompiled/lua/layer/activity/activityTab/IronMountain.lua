local var_0_0 = require("res/native/offset").get("layer.activity.ironMountain")
local var_0_1 = {
	[4] = {
		type = 4
	},
	[21] = {
		type = 7
	},
	[110] = {
		pic = "icon_tj_h.png",
		type = 110
	},
	[5] = {
		pic = "icon_jy_h.png",
		type = 6
	},
	[19] = {
		pic = "icon_jb_h.png",
		type = 19
	},
	[40] = {
		pic = "icon_hjc_h.png",
		type = 40
	},
	[42] = {
		pic = "icon_mbl_h.png",
		type = 5
	},
	[81] = {
		pic = "icon_tj_h.png",
		type = 24
	},
	[102] = {
		pic = "icon_jiebing_h.png",
		type = 41
	},
	[100] = {
		pic = "icon_dq_h.png",
		type = 100
	},
	[119] = {
		type = 10033
	}
}
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = colorQuality[3]
local var_0_4 = colorQuality[2]
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[6]
local var_0_8 = {
	"ksdkc_word_ptkq.png",
	"ksdkc_word_yzkq.png",
	"ksdkc_word_tjkq.png"
}
local var_0_9 = class("IronMountain", function()
	return createBaseLayer()
end)

var_0_9.layout = {
	y = 0,
	name = "Scene",
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
					y = 200,
					name = "bg",
					type = "sprite",
					x = 457.5,
					pic = {
						path = "res/ui/activity/ironMountain/ksdkc_bg.png"
					}
				},
				{
					y = 460,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/ironMountain/ksdkc_title.png"
					}
				},
				{
					y = 415.9998,
					x = 458.0003,
					type = "sprite",
					pic = {
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					fontSize = 24,
					name = "leftTime",
					style = "label_warlock",
					type = "label",
					y = 460,
					x = 730,
					color = var_0_5
				},
				{
					style = "button_tip",
					name = "btn_tip",
					h = 42,
					type = "button",
					w = 42,
					y = 460,
					x = 860
				},
				{
					type = "node",
					name = "node_mountain",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 129,
							type = "sprite",
							x = 783,
							pic = {
								path = "res/ui/activity/ironMountain/ksdkc_d.png"
							},
							children = {
								{
									y = 225,
									name = "type",
									x = 128,
									type = "sprite"
								},
								{
									y = 178,
									x = 24,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									},
									children = {
										{
											y = 43.0003,
											x = 35,
											type = "sprite",
											pic = {
												path = "res/ui/resourceArea2/zcgz_hp_qiufan.png"
											}
										}
									}
								},
								{
									fontSize = 20,
									name = "info_npc",
									y = 178,
									type = "label",
									height = 40,
									x = 40,
									width = 200,
									anchorPoint = ccp(0, 0.5)
								},
								{
									name = "btn_dig",
									h = 62,
									type = "button",
									w = 195,
									y = 28,
									x = 128,
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
											x = 97,
											textId = 380014
										}
									}
								},
								{
									y = 82,
									type = "sprite",
									x = 120 + (var_0_0.rewardOffsetX or 0) + (var_0_0.rewardOffsetXth or 0),
									anchorPoint = ccp(1, 0.5),
									pic = {
										path = "res/ui/activity/ironMountain/ksdkc_word_kkc.png"
									}
								},
								{
									y = 134,
									type = "sprite9",
									x = 82,
									preferedSize = CCSizeMake(100, 42),
									middleRect = CCRectMake(10, 10, 189, 14),
									pic = {
										path = "res/ui/world/manzu/zymz_xjdltxmc_bg.png"
									}
								},
								{
									name = "btn_reduce",
									h = 51,
									type = "button",
									w = 51,
									y = 134,
									x = 25,
									normal = {
										path = "res/ui/common/button/btn_reduce.png"
									},
									touched = {
										path = "res/ui/common/button/btn_reduce_c.png"
									},
									disable = {
										path = "res/ui/common/button/btn_reduce_g.png"
									}
								},
								{
									name = "btn_add",
									h = 51,
									type = "button",
									w = 51,
									y = 134,
									x = 139,
									normal = {
										path = "res/ui/common/button/btn_add.png"
									},
									touched = {
										path = "res/ui/common/button/btn_add_c.png"
									},
									disable = {
										path = "res/ui/common/button/btn_add_g.png"
									}
								},
								{
									name = "btn_full",
									h = 58,
									type = "button",
									w = 97,
									y = 135,
									x = 210,
									normal = {
										frame = true,
										path = "btn1_yel_a.png"
									},
									touched = {
										frame = true,
										path = "btn1_yel_c.png"
									},
									children = {
										{
											fontSize = 25,
											y = 29,
											type = "label",
											x = 49,
											textId = 450075
										}
									}
								},
								{
									y = 78.0001,
									type = "sprite",
									scale = 0.8,
									x = 135 + (var_0_0.rewardOffsetXth or 0),
									pic = {
										path = "res/ui/world/manzu/zymz_xjc_bg.png"
									},
									children = {
										{
											y = 34,
											name = "icon_iron",
											type = "sprite",
											x = 32,
											pic = {
												path = "res/ui/ironMine/get_icon_iron.png"
											}
										}
									}
								},
								{
									fontSize = 20,
									name = "num_prisoner",
									y = 134,
									type = "label",
									x = 79.3342
								},
								{
									fontSize = 20,
									name = "num_iron",
									y = 82,
									type = "label",
									x = 165 + (var_0_0.rewardOffsetXth or 0),
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 290,
							type = "sprite9",
							x = 783,
							preferedSize = CCSizeMake(300, 80),
							middleRect = CCRectMake(80, 20, 15, 9),
							pic = {
								path = "res/ui/juben/jb_wj_lv_d.png"
							},
							children = {
								{
									y = 40,
									x = 50,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/activity/ironMountain/ksdkc_yxssp2.png"
									}
								},
								{
									name = "info_reward",
									height = 0,
									type = "label",
									x = 175,
									y = 40,
									textId = 450071,
									width = 190,
									halign = kCCTextAlignmentLeft,
									color = var_0_2,
									fontSize = 20 + (var_0_0.info_rewardFont or 0)
								}
							}
						},
						{
							y = 364,
							type = "sprite",
							x = 4,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/activity/ironMountain/ksdkc_laogong_d.png"
							},
							children = {
								{
									y = 34,
									x = 0,
									type = "sprite",
									scale = 0.6,
									anchorPoint = ccp(0, 0.5),
									pic = {
										path = "res/ui/resourceArea2/zcgz_btn_round.png"
									},
									children = {
										{
											y = 43,
											x = 35,
											type = "sprite",
											pic = {
												path = "res/ui/resourceArea2/zcgz_hp_qiufan.png"
											}
										},
										{
											y = 15,
											x = 36,
											type = "sprite",
											scale = 1.4,
											pic = {
												path = "res/ui/activity/ironMountain/ksdkc_word_lg.png"
											}
										}
									}
								},
								{
									fontSize = 20,
									name = "prisoner",
									y = 34,
									type = "label",
									x = 45,
									anchorPoint = ccp(0, 0.5)
								},
								{
									name = "btn_buy",
									h = 58,
									type = "button",
									w = 97,
									y = 34,
									x = 150,
									normal = {
										frame = true,
										path = "btn1_yel_a.png"
									},
									touched = {
										frame = true,
										path = "btn1_yel_c.png"
									},
									children = {
										{
											fontSize = 25,
											y = 29,
											type = "label",
											x = 49,
											textId = 450076
										}
									}
								},
								{
									y = 34,
									x = 220,
									type = "sprite",
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								},
								{
									fontSize = 20,
									name = "gold",
									y = 34,
									type = "label",
									x = 240,
									color = var_0_6,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_meteor",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							w = 281,
							name = "btn_meteor",
							h = 231,
							type = "button",
							y = 179.2857,
							x = 458,
							normal = {
								path = "res/ui/activity/ironMountain/ksdkc_yxs.png"
							},
							touched = {
								path = "res/ui/activity/ironMountain/ksdkc_yxs.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_part3",
							h = 100,
							type = "button",
							w = 100,
							visible = false,
							y = 220,
							x = 385,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 50,
									x = 50,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironMountain/ksdkc_yxssp3.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_part2",
							h = 100,
							type = "button",
							w = 100,
							visible = false,
							y = 200,
							x = 525,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 50,
									x = 50,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironMountain/ksdkc_yxssp2.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_part1",
							h = 100,
							type = "button",
							w = 100,
							visible = false,
							y = 150,
							x = 458,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 50,
									x = 50,
									type = "sprite",
									pic = {
										path = "res/ui/activity/ironMountain/ksdkc_yxssp1.png"
									}
								}
							}
						},
						{
							visible = false,
							name = "hammer",
							type = "sprite9",
							y = 230,
							x = 630,
							preferedSize = CCSizeMake(56, 150),
							middleRect = CCRectMake(1, 44, 1, 1),
							anchorPoint = ccp(0.5, 0),
							pic = {
								path = "res/ui/mainCity/chui.png"
							}
						},
						{
							y = 200,
							name = "arrow",
							type = "sprite",
							x = 240,
							pic = {
								path = "res/ui/guide/jiantou-you.png"
							},
							children = {
								{
									fontSize = 20,
									style = "label_warlock",
									y = 30,
									type = "label",
									x = 30,
									textId = 450077,
									color = var_0_6
								}
							}
						},
						{
							visible = false,
							name = "bg_reward",
							type = "sprite9",
							y = 300,
							x = 458,
							preferedSize = CCSizeMake(400, 120),
							middleRect = CCRectMake(45, 13, 3, 1),
							pic = {
								path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
							},
							children = {
								{
									fontSize = 22,
									y = 100,
									type = "label",
									x = 200,
									textId = 450078,
									color = var_0_2
								},
								{
									name = "num_reward",
									type = "atlaslabel",
									pic = "res/ui/common/number/gjms_tit_tong_digit.png",
									startCharMap = 48,
									text = "0",
									y = 60,
									itemWidth = 22,
									x = 200,
									itemHeight = 27
								},
								{
									y = 20,
									type = "sprite",
									scaleX = 0.37,
									x = 200,
									pic = {
										path = "res/ui/rankInfo/twoRankInfo/rank_progress_bar_bg.jpg"
									}
								},
								{
									y = 20,
									name = "bar_reward",
									type = "progressbar",
									scaleX = 0.37,
									x = 200,
									pic = {
										path = "res/ui/general/jailView/laofang_load_con.png"
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
							y = 210,
							name = "bg_finish",
							type = "sprite",
							x = 458,
							pic = {
								path = "res/ui/activity/horseRacing/sm_mp_d.png"
							}
						},
						{
							y = 210,
							x = 448,
							type = "sprite",
							pic = {
								path = "res/ui/activity/ironMountain/ksdkc_word_ksyqbtt.png"
							}
						}
					}
				}
			}
		}
	}
}
var_0_9.layout_mountain = {
	type = "node",
	name = "node_area",
	y = 0,
	visible = false,
	x = 0,
	children = {
		{
			type = "sprite",
			name = "area_finish",
			y = -10,
			visible = false,
			x = 0,
			pic = {
				path = "res/ui/activity/ironMountain/ksdkc_ks1_t.png"
			}
		},
		{
			y = 0,
			name = "area",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/activity/ironMountain/ksdkc_ks1.png"
			},
			children = {
				{
					w = 213,
					name = "btn_area",
					h = 159,
					type = "button",
					y = 76,
					x = 95,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/ui/activity/ironMountain/ksdkc_ks_h.png"
					}
				},
				{
					y = 72,
					name = "chain",
					type = "sprite",
					x = 98,
					pic = {
						path = "res/ui/activity/ironMountain/ksdkc_tl.png"
					}
				},
				{
					y = 72,
					name = "bg_leftTimes",
					type = "sprite",
					x = 98,
					pic = {
						path = "res/ui/silk/market/scpm_word_d.png"
					},
					children = {
						{
							y = 18,
							x = 10,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/world/manzu/zymz_xjc_bg.png"
							}
						},
						{
							y = 20,
							x = 10,
							type = "sprite",
							pic = {
								path = "res/ui/activity/ironMountain/ksdkc_zaozi.png"
							}
						},
						{
							name = "leftTimes",
							y = 20,
							type = "label",
							x = 32,
							fontSize = 20 + (var_0_0.leftTimesFntSize or 0),
							anchorPoint = ccp(0, 0.5)
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
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 600,
			textId = 450064,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_9.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getIronMountainActivity)
end

function var_0_9.onDigIron(arg_4_0, arg_4_1)
	if arg_4_0.mountainId <= 6 then
		arg_4_0.view.widgets.btn_dig:setEnabled(false)
	elseif arg_4_0.mountainId == 7 then
		arg_4_0.view.widgets["btn_part" .. arg_4_1]:setEnabled(false)
	end

	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		var_5_0.lastUsedPrisoner = arg_4_0.prisonerNum

		if arg_4_0.mountainId <= 6 then
			arg_4_0.info.prisoner = var_5_0.prisoner

			arg_4_0.view.widgets.prisoner:setString(language.get(85042, var_5_0.prisoner))
		elseif arg_4_0.mountainId == 7 then
			-- block empty
		end

		arg_4_0:showEffectDig(var_5_0, arg_4_1)
	end

	cmgr.sendRequest(var_4_0, actions.digIron, arg_4_0.prisonerNum, arg_4_0.mountainId)
end

function var_0_9.onBuyIronPrisoner(arg_6_0)
	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		arg_6_0.info.prisoner = var_7_0.prisoner
		arg_6_0.info.buyPrisonerGold = var_7_0.nextCostGold

		arg_6_0.view.widgets.prisoner:setString(language.get(85042, var_7_0.prisoner))
		arg_6_0.view.widgets.gold:setString(var_7_0.nextCostGold)
		arg_6_0:updatePrisonerNumToDig(true)
	end

	local var_6_1 = arg_6_0.info.buyPrisonerNum

	messageBox.showChargeWin("", language.get(450061, arg_6_0.info.buyPrisonerGold, var_6_1), "fstBuyPrisoner", function()
		cmgr.sendRequest(var_6_0, actions.buyIronPrisoner, var_6_1)
	end)
end

function var_0_9.onOpenIronMeteor(arg_9_0)
	arg_9_0.view.widgets.arrow:setVisible(false)
	arg_9_0.view.widgets.btn_meteor:setEnabled(false)

	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.action.data

		arg_9_0:showEffectHammer(var_10_0)
	end

	cmgr.sendRequest(var_9_0, actions.openIronMeteor)
end

function var_0_9.showEffectDig(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0.workNode then
		arg_11_0.workNode:removeAllChildrenWithCleanup(true)
	else
		arg_11_0.workNode = CCNode:create()

		arg_11_0.view.widgets.node_mountain:addChild(arg_11_0.workNode, 100)
	end

	if arg_11_0.mountainId <= 6 then
		arg_11_0.view.widgets["bg_leftTimes" .. arg_11_0.mountainId]:setVisible(false)

		local var_11_0, var_11_1 = arg_11_0.view.widgets["node_area" .. arg_11_0.mountainId]:getPosition()

		arg_11_0.workNode:setPosition(ccp(var_11_0, var_11_1))

		local var_11_2 = {
			ccp(16, 4),
			ccp(95, -6),
			ccp(-102, -6),
			ccp(-57, -26),
			ccp(-15, 46)
		}
		local var_11_3 = 0
		local var_11_4 = arg_11_1.lastUsedPrisoner
		local var_11_5 = var_11_4 <= 7 and 1 or var_11_4 <= 12 and 3 or 5

		for iter_11_0 = 1, var_11_5 do
			local var_11_6 = var_11_2[iter_11_0]
			local var_11_7 = CCNode:create()

			if iter_11_0 >= 3 then
				var_11_7:setScaleX(-1)
			end

			var_11_7:setPosition(var_11_6)
			arg_11_0.workNode:addChild(var_11_7)

			local var_11_8 = CCSprite:create()
			local var_11_9 = 0.8

			var_11_8:setScale(var_11_9)
			var_11_7:addChild(var_11_8)

			local var_11_10 = CCArray:create()

			for iter_11_1 = 1, 10 do
				local var_11_11 = CCSprite:createWithSpriteFrameName(string.format("qqq_r_%d.png", iter_11_1))

				var_11_10:addObject(var_11_11:displayFrame())
			end

			local var_11_12 = CCAnimation:createWithSpriteFrames(var_11_10, 0.05)
			local var_11_13 = CCAnimate:create(var_11_12)
			local var_11_14 = CCArray:create()

			var_11_14:addObject(CCRepeat:create(var_11_13, 3))
			var_11_14:addObject(CCCallFunc:create(function()
				var_11_7:setVisible(false)
			end))

			if iter_11_0 == var_11_5 then
				local var_11_15 = {}
				local var_11_16 = {}

				if arg_11_1.mountains then
					for iter_11_2 = 1, 6 do
						local var_11_17 = arg_11_0.info.mountains[iter_11_2]
						local var_11_18 = arg_11_1.mountains[iter_11_2]

						if not var_11_17.isFinish and var_11_18.isFinish then
							table.insert(var_11_16, var_11_17.id)
						end

						if not var_11_17.isOpen and var_11_18.isOpen then
							table.insert(var_11_15, var_11_17.id)
						end
					end
				else
					table.insert(var_11_16, arg_11_0.mountainId)
				end

				if arg_11_1.multi > 1 then
					var_11_14:addObject(CCCallFunc:create(function()
						arg_11_0:showEffectTxt("res/ui/activity/ironReward/js_bj_" .. arg_11_1.multi .. ".png", ccp(var_11_0, var_11_1), 0)
					end))
					var_11_14:addObject(CCDelayTime:create(0.8))
				end

				var_11_14:addObject(CCCallFunc:create(function()
					arg_11_0:showEffectReward(arg_11_1, function()
						local var_15_0 = CCArray:create()

						if #var_11_16 > 0 then
							var_15_0:addObject(CCCallFunc:create(function()
								arg_11_0:showEffectFinish(var_11_16[1])
							end))
							var_15_0:addObject(CCDelayTime:create(1.8))
						end

						if arg_11_1.meteorOpen then
							var_15_0:addObject(CCCallFunc:create(function()
								local var_17_0, var_17_1 = arg_11_0.view.widgets.btn_meteor:getPosition()

								arg_11_0:showEffectTxt("res/ui/activity/ironMountain/ksdkc_word_cxyxs.png", ccp(var_17_0, var_17_1), 0.5)
							end))
						end

						if #var_11_15 > 0 then
							var_15_0:addObject(CCCallFunc:create(function()
								for iter_18_0, iter_18_1 in pairs(var_11_15) do
									arg_11_0:showEffectOpen(iter_18_1)
								end
							end))
							var_15_0:addObject(CCDelayTime:create(1.8))
						end

						var_15_0:addObject(CCCallFunc:create(function()
							arg_11_0.workNode:removeAllChildrenWithCleanup(true)
							arg_11_0:showPanel(arg_11_1)
						end))

						local var_15_1 = CCSequence:create(var_15_0)

						var_11_8:runAction(var_15_1)
					end)
				end))
			end

			local var_11_19 = CCSequence:create(var_11_14)

			var_11_8:runAction(var_11_19)

			local var_11_20 = CCSprite:create()

			var_11_20:setScale(0.5)
			var_11_20:setPosition(ccp(-25, -20))
			var_11_7:addChild(var_11_20)

			local var_11_21 = CCArray:create()

			for iter_11_3 = 1, 5 do
				local var_11_22 = CCSprite:create(string.format("res/ui/world/manzu/zymz_light%s.png", iter_11_3))

				var_11_21:addObject(var_11_22:displayFrame())
			end

			local var_11_23 = CCAnimation:createWithSpriteFrames(var_11_21, 0.08)
			local var_11_24 = CCAnimate:create(var_11_23)
			local var_11_25 = CCArray:create()

			var_11_25:addObject(CCDelayTime:create(0.3))
			var_11_25:addObject(var_11_24)
			var_11_25:addObject(CCDelayTime:create(0.1))
			var_11_25:addObject(var_11_24)
			var_11_25:addObject(CCDelayTime:create(0.1))
			var_11_25:addObject(var_11_24)

			local var_11_26 = CCSequence:create(var_11_25)

			var_11_20:runAction(var_11_26)
		end
	elseif arg_11_0.mountainId == 7 then
		local var_11_27 = CCArray:create()

		var_11_27:addObject(CCMoveBy:create(0.08, ccp(-15, 0)))
		var_11_27:addObject(CCMoveBy:create(0.08, ccp(15, 0)))

		local var_11_28 = CCSequence:create(var_11_27)
		local var_11_29 = CCArray:create()

		var_11_29:addObject(CCRepeat:create(var_11_28, 3))
		var_11_29:addObject(CCHide:create())

		if arg_11_0.info.openHighWeapon then
			var_11_29:addObject(CCCallFunc:create(function()
				arg_11_0.view.widgets.bg_reward:setVisible(true)
				arg_11_0.view.widgets.num_reward:setString(0)
				arg_11_0.view.widgets.bar_reward:setPercentage(0)

				local var_20_0 = CCArray:create()

				var_20_0:addObject(CCCallFuncN:create(function()
					local var_21_0 = math.random(1, 10 + #arg_11_1.rewards)

					arg_11_0.view.widgets.num_reward:setString(var_21_0)
				end))
				var_20_0:addObject(CCDelayTime:create(0.1))
				arg_11_0.view.widgets.num_reward:runAction(CCRepeatForever:create(CCSequence:create(var_20_0)))

				local var_20_1 = CCArray:create()

				var_20_1:addObject(CCProgressTo:create(1.2, 100))
				var_20_1:addObject(CCCallFuncN:create(function()
					arg_11_0.view.widgets.num_reward:setString(#arg_11_1.rewards)
					arg_11_0.view.widgets.num_reward:stopAllActions()
					arg_11_0:showEffectReward(arg_11_1, function()
						arg_11_0.view.widgets.bg_reward:setVisible(false)

						if arg_11_1.meteor.isFinish then
							arg_11_0:showPanel(arg_11_1)
						end
					end)
				end))
				arg_11_0.view.widgets.bar_reward:runAction(CCSequence:create(var_20_1))
			end))
		else
			arg_11_0:showEffectReward(arg_11_1, function()
				arg_11_0.view.widgets.bg_reward:setVisible(false)

				if arg_11_1.meteor.isFinish then
					arg_11_0:showPanel(arg_11_1)
				end
			end)
		end

		local var_11_30 = CCSequence:create(var_11_29)

		arg_11_0.view.widgets["btn_part" .. arg_11_2]:runAction(var_11_30)
	end
end

function var_0_9.showEffectOpen(arg_25_0, arg_25_1)
	arg_25_0.view.widgets["chain" .. arg_25_1]:setVisible(true)
	arg_25_0.view.widgets["bg_leftTimes" .. arg_25_1]:setVisible(false)

	local var_25_0 = CCArray:create()

	for iter_25_0 = 1, 19 do
		local var_25_1 = CCSprite:createWithSpriteFrameName(string.format("ksdkc_chain_%02d.png", iter_25_0))

		var_25_0:addObject(var_25_1:displayFrame())
	end

	local var_25_2 = CCAnimation:createWithSpriteFrames(var_25_0, 0.08)
	local var_25_3 = CCAnimate:create(var_25_2)

	arg_25_0.view.widgets["chain" .. arg_25_1]:runAction(var_25_3)

	local var_25_4, var_25_5 = arg_25_0.view.widgets["node_area" .. arg_25_1]:getPosition()

	arg_25_0:showEffectTxt("res/ui/activity/ironMountain/ksdkc_word_01.png", ccp(var_25_4, var_25_5), 1)
end

function var_0_9.showEffectFinish(arg_26_0, arg_26_1)
	arg_26_0.view.widgets["area" .. arg_26_1]:setVisible(true)
	arg_26_0.view.widgets["area_finish" .. arg_26_1]:setVisible(false)
	arg_26_0.view.widgets["bg_leftTimes" .. arg_26_1]:setVisible(false)
	arg_26_0.view.widgets["btn_area" .. arg_26_1]:setVisible(false)

	local var_26_0 = CCArray:create()

	var_26_0:addObject(CCBlink:create(0.6, 3))
	var_26_0:addObject(CCCallFunc:create(function()
		local var_27_0 = CCArray:create()

		var_27_0:addObject(CCShow:create())
		var_27_0:addObject(CCDelayTime:create(0.4))
		var_27_0:addObject(CCFadeOut:create(0.4))

		local var_27_1 = CCSequence:create(var_27_0)

		arg_26_0.view.widgets["area_finish" .. arg_26_1]:runAction(var_27_1)
	end))
	var_26_0:addObject(CCFadeOut:create(0.2))

	local var_26_1 = CCSequence:create(var_26_0)

	arg_26_0.view.widgets["area" .. arg_26_1]:runAction(var_26_1)

	local var_26_2, var_26_3 = arg_26_0.view.widgets["node_area" .. arg_26_1]:getPosition()

	arg_26_0:showEffectTxt("res/ui/activity/ironMountain/ksdkc_word_04.png", ccp(var_26_2, var_26_3), 0.7)
end

function var_0_9.showEffectTxt(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = CCSprite:create(arg_28_1)

	var_28_0:setPosition(arg_28_2)
	var_28_0:setVisible(false)
	arg_28_0.view.widgets.panel:addChild(var_28_0, 200)

	local var_28_1 = CCArray:create()

	if arg_28_3 then
		var_28_1:addObject(CCDelayTime:create(arg_28_3))
	end

	var_28_1:addObject(CCShow:create())
	var_28_1:addObject(CCMoveBy:create(0.4, ccp(0, 70)))
	var_28_1:addObject(CCDelayTime:create(0.4))
	var_28_1:addObject(CCFadeOut:create(0.2))
	var_28_1:addObject(CCCallFunc:create(function()
		var_28_0:removeFromParentAndCleanup(true)
	end))

	local var_28_2 = CCSequence:create(var_28_1)

	var_28_0:runAction(var_28_2)
end

function var_0_9.showEffectHammer(arg_30_0, arg_30_1)
	local var_30_0 = CCArray:create()

	var_30_0:addObject(CCRotateTo:create(0.2, 30))
	var_30_0:addObject(CCEaseBounceOut:create(CCRotateTo:create(0.3, -90)))
	var_30_0:addObject(CCRotateTo:create(0.3, 30))
	var_30_0:addObject(CCEaseBounceOut:create(CCRotateTo:create(0.3, -90)))
	var_30_0:addObject(CCRotateTo:create(0.2, -60))
	var_30_0:addObject(CCFadeOut:create(0.2))
	var_30_0:addObject(CCCallFunc:create(function()
		arg_30_0.view.widgets.hammer:setVisible(false)

		local var_31_0 = CCArray:create()

		var_31_0:addObject(CCBlink:create(0.6, 3))
		var_31_0:addObject(CCFadeOut:create(0.4))
		var_31_0:addObject(CCCallFunc:create(function()
			arg_30_0:showPanel(arg_30_1)
		end))

		local var_31_1 = CCSequence:create(var_31_0)

		arg_30_0.view.widgets.btn_meteor:runAction(var_31_1)
	end))
	var_30_0:addObject(CCDelayTime:create(1))

	local var_30_1 = CCSequence:create(var_30_0)

	arg_30_0.view.widgets.hammer:runAction(var_30_1)

	local var_30_2 = CCSprite:create()

	var_30_2:setPosition(ccp(185, 135))
	arg_30_0.view.widgets.btn_meteor:addChild(var_30_2)

	local var_30_3 = CCArray:create()

	for iter_30_0 = 1, 5 do
		local var_30_4 = CCSprite:create(string.format("res/ui/world/manzu/zymz_light%s.png", iter_30_0))

		var_30_3:addObject(var_30_4:displayFrame())
	end

	local var_30_5 = CCAnimation:createWithSpriteFrames(var_30_3, 0.08)
	local var_30_6 = CCAnimate:create(var_30_5)
	local var_30_7 = CCArray:create()

	var_30_7:addObject(CCDelayTime:create(0.4))
	var_30_7:addObject(var_30_6)
	var_30_7:addObject(CCDelayTime:create(0.2))
	var_30_7:addObject(var_30_6)
	var_30_7:addObject(CCCallFunc:create(function()
		var_30_2:removeFromParentAndCleanup(true)
	end))

	local var_30_8 = CCSequence:create(var_30_7)

	var_30_2:runAction(var_30_8)
end

function var_0_9.showEffectReward(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1.rewards[1]
	local var_34_1 = var_34_0.type == 119 and "res/ui/weapon/godWeapon/sbxt_icon_blg.png" or "res/ui/ironMine/get_icon_iron.png"
	local var_34_2 = var_34_0.type
	local var_34_3 = var_34_0.num

	if arg_34_0.rewardNode then
		arg_34_0.rewardNode:stopAllActions()
	else
		arg_34_0.rewardNode = CCSpriteBatchNode:create(var_34_1)

		arg_34_0.view.widgets.panel:addChild(arg_34_0.rewardNode, 100)
	end

	arg_34_0.reward = arg_34_0.reward or {}

	local function var_34_4(arg_35_0)
		local var_35_0 = {}

		for iter_35_0 = 1, arg_35_0 do
			local var_35_1 = {
				id = var_0_1[var_34_2].type,
				value = var_34_3
			}

			table.insert(var_35_0, var_35_1)
		end

		globalAction_gotResource(var_35_0)
	end

	local function var_34_5(arg_36_0)
		arg_34_0.rewardNode:addChild(arg_36_0)

		local var_36_0 = math.random(280, 640)
		local var_36_1 = math.random(60, 120)

		arg_36_0:setPosition(ccp(460, 240))
		arg_36_0:runAction(CCEaseBounceOut:create(CCMoveTo:create(1, ccp(var_36_0, var_36_1))))
	end

	for iter_34_0, iter_34_1 in ipairs(arg_34_1.rewards) do
		local var_34_6 = CCSprite:create(var_34_1)

		table.insert(arg_34_0.reward, {
			obj = var_34_6
		})
		var_34_5(var_34_6)
	end

	local var_34_7 = CCLayerColor:create(ccc4(0, 0, 0, 160), 909, 390)

	var_34_7:setPosition(3, 3)
	var_34_7:registerScriptTouchHandler(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_37_1, arg_37_2)

			if arg_34_0.reward and #arg_34_0.reward > 0 then
				local var_37_0 = 0

				for iter_37_0 = #arg_34_0.reward, 1, -1 do
					local var_37_1 = arg_34_0.reward[iter_37_0]
					local var_37_2 = tolua.cast(arg_34_0.reward[iter_37_0].obj, "CCSprite")

					if tool.checkIfTouch(var_37_2, arg_37_1, arg_37_2) then
						var_37_0 = var_37_0 + 1

						var_37_2:removeFromParentAndCleanup(true)
						table.remove(arg_34_0.reward, iter_37_0)

						if var_37_0 >= 8 then
							break
						end
					end
				end

				if var_37_0 > 0 then
					while var_37_0 < 6 and #arg_34_0.reward > 0 do
						tolua.cast(table.remove(arg_34_0.reward).obj, "CCSprite"):removeFromParentAndCleanup(true)

						var_37_0 = var_37_0 + 1
					end

					var_34_4(var_37_0)

					if #arg_34_0.reward == 0 then
						if arg_34_0.maskLayer then
							arg_34_0.maskLayer:removeFromParentAndCleanup(true)

							arg_34_0.maskLayer = nil
						end

						if arg_34_2 then
							arg_34_2()
						end
					end

					return true
				end
			end

			log.info("touch", tool.checkIfTouch(arg_34_0.view.widgets.bg, arg_37_1, arg_37_2))

			if tool.checkIfTouch(arg_34_0.view.widgets.bg, arg_37_1, arg_37_2) then
				return true
			end

			return false
		elseif arg_37_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_37_1, arg_37_2)

			return true
		elseif arg_37_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_37_1, arg_37_2)

			return true
		end
	end, false, true)
	var_34_7:setTouchEnabled(true)
	arg_34_0.view.widgets.panel:addChild(var_34_7)

	if arg_34_0.maskLayer then
		arg_34_0.maskLayer:removeFromParentAndCleanup(true)
	end

	arg_34_0.maskLayer = var_34_7
end

function var_0_9.addMountains(arg_38_0)
	local var_38_0 = {
		ccp(400, 270),
		ccp(320, 180),
		ccp(470, 180),
		ccp(250, 90),
		ccp(400, 90),
		ccp(550, 90)
	}

	for iter_38_0 = 6, 1, -1 do
		local var_38_1 = {}

		uiutil.initWidgets(var_38_1, arg_38_0.layout_mountain)
		var_38_1.widgets.node_area:setPosition(var_38_0[iter_38_0])

		local var_38_2
		local var_38_3

		if iter_38_0 <= 1 then
			-- block empty
		elseif iter_38_0 <= 3 then
			var_38_2 = "ksdkc_ks2.png"
			var_38_3 = "ksdkc_ks2_t.png"
		else
			var_38_2 = "ksdkc_ks3.png"
			var_38_3 = "ksdkc_ks3_t.png"
		end

		if var_38_2 then
			var_38_1.widgets.area:setDisplayFrame(CCSprite:create("res/ui/activity/ironMountain/" .. var_38_2):displayFrame())
			var_38_1.widgets.area_finish:setDisplayFrame(CCSprite:create("res/ui/activity/ironMountain/" .. var_38_3):displayFrame())
		end

		arg_38_0.view.widgets.node_mountain:addChild(var_38_1.widgets.node_area)

		for iter_38_1, iter_38_2 in pairs(var_38_1.widgets) do
			arg_38_0.view.widgets[iter_38_1 .. iter_38_0] = iter_38_2
		end
	end
end

function var_0_9.updatePrisonerNumToDig(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.info.mountains[arg_39_0.mountainId]

	if not var_39_0 then
		return
	end

	if arg_39_1 and var_39_0.isOpen and not var_39_0.isFinish then
		if arg_39_0.info.prisoner < var_39_0.minNum then
			arg_39_0.prisonerNum = 1
		else
			arg_39_0.prisonerNum = var_39_0.minNum
		end
	end

	if arg_39_0.prisonerNum <= 1 then
		arg_39_0.prisonerNum = 1
	end

	if arg_39_0.prisonerNum >= var_39_0.maxNum then
		arg_39_0.prisonerNum = var_39_0.maxNum
	end

	local var_39_1 = var_0_8[var_39_0.quality]

	if var_39_1 then
		arg_39_0.view.widgets.type:setDisplayFrame(CCSprite:create("res/ui/activity/ironMountain/" .. var_39_1):displayFrame())
	end

	local var_39_2 = var_39_0.baseOutput + var_39_0.perOutput * (arg_39_0.prisonerNum - var_39_0.minNum)

	var_39_2 = var_39_2 < 0 and 0 or var_39_2

	local var_39_3 = var_39_2 < 10000 and var_39_2 or language.get(75021, var_39_2 / 10000)

	arg_39_0.view.widgets.num_iron:setString(var_39_3)
	arg_39_0.view.widgets.num_prisoner:setString(language.get(390478, arg_39_0.prisonerNum, var_39_0.maxNum))
	arg_39_0.view.widgets.info_npc:setString(language.get(450070, var_39_0.minNum))
	arg_39_0.view.widgets.btn_dig:setEnabled(arg_39_0.prisonerNum >= var_39_0.minNum)
end

function var_0_9.showPanel(arg_40_0, arg_40_1)
	arg_40_0.info = arg_40_1

	if arg_40_1.openHighWeapon then
		arg_40_0.view.widgets.icon_iron:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/sbxt_icon_blg.png"):displayFrame())
		arg_40_0.view.widgets.info_reward:setString(language.get(450079))
	end

	local var_40_0 = arg_40_1.meteorOpen
	local var_40_1 = arg_40_1.meteorFinish

	arg_40_0.view.widgets.node_mountain:setVisible(not var_40_0)
	arg_40_0.view.widgets.node_meteor:setVisible(var_40_0 and not var_40_1)
	arg_40_0.view.widgets.node_finish:setVisible(var_40_0 and var_40_1)

	if not var_40_0 then
		arg_40_0.view.widgets.prisoner:setString(language.get(85042, arg_40_1.prisoner))
		arg_40_0.view.widgets.gold:setString(arg_40_1.buyPrisonerGold)

		arg_40_0.mountainId = arg_40_0.mountainId or 0

		local var_40_2 = arg_40_1.mountains[arg_40_0.mountainId]

		if var_40_2 and var_40_2.isOpen and not var_40_2.isFinish then
			-- block empty
		else
			local var_40_3 = arg_40_0.view.widgets["btn_area" .. arg_40_0.mountainId]

			if var_40_3 then
				var_40_3:setHighlighted(false)
			end

			arg_40_0.mountainId = 0
		end

		for iter_40_0, iter_40_1 in ipairs(arg_40_1.mountains) do
			local var_40_4 = iter_40_1.isOpen
			local var_40_5 = iter_40_1.isFinish
			local var_40_6 = var_40_4 and not var_40_5

			arg_40_0.view.widgets["node_area" .. iter_40_0]:setVisible(not var_40_5)
			arg_40_0.view.widgets["chain" .. iter_40_0]:setVisible(not var_40_4)
			arg_40_0.view.widgets["bg_leftTimes" .. iter_40_0]:setVisible(var_40_6)

			local var_40_7 = arg_40_0.view.widgets["btn_area" .. iter_40_0]

			var_40_7:setVisible(var_40_6)

			if not var_40_5 then
				arg_40_0.view.widgets["area" .. iter_40_0]:setVisible(true)
				arg_40_0.view.widgets["area_finish" .. iter_40_0]:setVisible(false)
			end

			if var_40_6 then
				arg_40_0.view.widgets["leftTimes" .. iter_40_0]:setString(language.get(450069, iter_40_1.leftTimes))

				if arg_40_0.mountainId == 0 then
					arg_40_0.mountainId = iter_40_0

					var_40_7:setHighlighted(true)
				end
			end
		end

		arg_40_0:updatePrisonerNumToDig(true)
	elseif not var_40_1 then
		local var_40_8 = arg_40_1.meteor.isMeteorBroken

		arg_40_0.view.widgets.btn_meteor:setVisible(not var_40_8)

		for iter_40_2 = 1, 3 do
			arg_40_0.view.widgets["btn_part" .. iter_40_2]:setVisible(var_40_8 and iter_40_2 <= arg_40_1.meteor.leftTimes)
		end

		arg_40_0.view.widgets.arrow:setVisible(true)

		arg_40_0.prisonerNum = 0
		arg_40_0.mountainId = arg_40_1.meteor.id
	end
end

function var_0_9.ctor(arg_41_0, arg_41_1, arg_41_2)
	log.info("@@ 矿山开采")
	rmgr.loadResource("res/ui/activity/moveMountain/work/right.plist")
	rmgr.loadResource("res/ui/activity/wish/wishLight.plist")
	rmgr.loadResource("res/ui/activity/ironMountain/ksdkc_chain.plist")

	arg_41_0.view = {}

	uiutil.initWidgets(arg_41_0.view, arg_41_0.layout)

	arg_41_0.leftTime = arg_41_0.view.widgets.leftTime

	if arg_41_1 then
		arg_41_0:addChild(arg_41_0.view.widgets.Scene)
		arg_41_1:addChild(arg_41_0)
	end

	arg_41_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_41_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_41_0:addMountains()

	for iter_41_0 = 1, 6 do
		local var_41_0 = arg_41_0.view.widgets["btn_area" .. iter_41_0]

		var_41_0:addHandleOfControlEvent(function()
			log.info("btn_area" .. iter_41_0)
			var_41_0:setHighlighted(true)

			if iter_41_0 == arg_41_0.mountainId then
				return
			end

			local var_43_0 = arg_41_0.view.widgets["btn_area" .. arg_41_0.mountainId]

			if var_43_0 then
				var_43_0:setHighlighted(false)
			end

			arg_41_0.mountainId = iter_41_0

			arg_41_0:updatePrisonerNumToDig(true)
		end, CCControlEventTouchUpInside)
	end

	arg_41_0.view.widgets.btn_buy:addHandleOfControlEvent(function()
		log.info("btn_buy")
		arg_41_0:onBuyIronPrisoner()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_reduce:addHandleOfControlEvent(function()
		log.info("btn_reduce")

		arg_41_0.prisonerNum = arg_41_0.prisonerNum - 1

		arg_41_0:updatePrisonerNumToDig()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_add:addHandleOfControlEvent(function()
		log.info("btn_add")

		arg_41_0.prisonerNum = arg_41_0.prisonerNum + 1

		arg_41_0:updatePrisonerNumToDig()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_full:addHandleOfControlEvent(function()
		log.info("btn_full")

		local var_47_0 = arg_41_0.info.mountains[arg_41_0.mountainId]

		if var_47_0 then
			arg_41_0.prisonerNum = var_47_0.maxNum
		end

		arg_41_0:updatePrisonerNumToDig()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_dig:addHandleOfControlEvent(function()
		log.info("btn_dig")
		arg_41_0:onDigIron()
	end, CCControlEventTouchUpInside)

	local var_41_1 = CCArray:create()

	var_41_1:addObject(CCEaseOut:create(CCMoveBy:create(0.6, ccp(30, 0)), 1))
	var_41_1:addObject(CCEaseIn:create(CCMoveBy:create(0.6, ccp(-30, 0)), 1))

	local var_41_2 = CCSequence:create(var_41_1)

	arg_41_0.view.widgets.arrow:runAction(CCRepeatForever:create(var_41_2))
	arg_41_0.view.widgets.hammer:setRotation(-60)

	local var_41_3 = arg_41_0.view.widgets.btn_meteor

	var_41_3:addHandleOfControlEvent(function()
		log.info("btn_meteor TouchDown")
		arg_41_0.view.widgets.hammer:setVisible(true)
	end, CCControlEventTouchDown)
	var_41_3:addHandleOfControlEvent(function()
		log.info("btn_meteor TouchUpInside")
		arg_41_0:onOpenIronMeteor()
	end, CCControlEventTouchUpInside)
	var_41_3:addHandleOfControlEvent(function()
		log.info("btn_meteor TouchUpOutside")
		arg_41_0.view.widgets.hammer:setVisible(false)
	end, CCControlEventTouchUpOutside)

	for iter_41_1 = 1, 3 do
		arg_41_0.view.widgets["btn_part" .. iter_41_1]:addHandleOfControlEvent(function()
			log.info("btn_part" .. iter_41_1)
			arg_41_0:onDigIron(iter_41_1)
		end, CCControlEventTouchUpInside)
	end

	arg_41_0.view.widgets.bg_finish:setScaleX(2)
	arg_41_0:showPanel(arg_41_2)
end

function var_0_9.showTip(arg_53_0)
	log.info("should show tips ")

	local var_53_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_53_0:registerScriptTouchHandler(function(arg_54_0, arg_54_1, arg_54_2)
		if arg_54_0 == CCTOUCHBEGAN then
			return true
		elseif arg_54_0 == CCTOUCHMOVED then
			return true
		elseif arg_54_0 == CCTOUCHENDED then
			pcall(var_53_0.removeFromParentAndCleanup, var_53_0, true)

			return true
		end
	end, false, true)
	var_53_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_53_0, 60000)

	local var_53_1 = 0
	local var_53_2 = 0
	local var_53_3 = {}

	uiutil.initWidgets(var_53_3, arg_53_0.tipFrame)
	var_53_0:addChild(var_53_3.widgets.tipFrame)

	local var_53_4, var_53_5 = tool.getPositionInScreen(arg_53_0.view.widgets.btn_tip)
	local var_53_6 = var_53_4 + 20
	local var_53_7 = var_53_5 - 20
	local var_53_8 = var_53_3.widgets.tipMsg:getContentSize().width
	local var_53_9 = var_53_3.widgets.tipMsg:getContentSize().height

	var_53_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_53_8 + 30, var_53_9 + 30))
	var_53_3.widgets.tipFrame:setPosition(ccp(var_53_6, var_53_7))
	var_53_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_53_3.widgets.tipFrame:setVisible(true)
end

return var_0_9
