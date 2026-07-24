local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = {
	"yxhd_tit_szdd",
	"yxhd_tit_xmyz",
	"yxhd_tit_lthy",
	"yxhd_tit_fjcy",
	"yxhd_tit_dbkf"
}
local var_0_6 = 100
local var_0_7 = 200
local var_0_8 = 300
local var_0_9 = 400
local var_0_10 = 500
local var_0_11 = 2
local var_0_12 = 3
local var_0_13 = 10
local var_0_14 = {
	nil,
	nil,
	3,
	4,
	6,
	[81] = 24,
	freeHuanyin = 41,
	[42] = 5,
	[102] = 41,
	[116] = 55,
	[101] = 15,
	[21] = 7,
	[100] = 100,
	[119] = 10033,
	xinlian = 15,
	[47] = 10062,
	[126] = 10030
}
local var_0_15 = class("Lantern", function()
	return createBaseLayer()
end)

var_0_15.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/activity/lantern/yxhd_bg.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 25,
			name = "leftTime",
			visible = false,
			type = "label",
			style = "label_warlock",
			y = 480,
			x = 840,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_2,
			zorder = var_0_10
		},
		{
			x = 458,
			name = "playerPic",
			y = 110,
			type = "sprite",
			scale = 0.65,
			pic = {
				frame = false,
				path = "res/ui/common/playerPic/player1.png"
			},
			anchorPoint = ccp(0.5, 0)
		},
		{
			y = 400,
			name = "tipFrame",
			type = "sprite9",
			visible = false,
			x = 270,
			pic = {
				frame = true,
				path = "common_tip_frame_small.png"
			},
			middleRect = CCRectMake(24, 24, 1, 1),
			preferedSize = CCSizeMake(200, 80),
			children = {
				{
					fontSize = 20,
					height = 0,
					name = "tipMsg",
					type = "label",
					y = 40,
					width = 180,
					textId = 135365,
					style = "label_warlock",
					x = 10,
					anchorPoint = ccp(0, 0.5),
					halign = kCCTextAlignmentLeft,
					color = var_0_0
				}
			}
		},
		{
			x = 2,
			name = "maskLayer1",
			height = 528,
			type = "layerColor",
			visible = false,
			y = 2,
			width = 911,
			color = ccc4(33, 21, 15, 166),
			zorder = var_0_7
		},
		{
			y = 480,
			name = "title1",
			frameGapVertical = 15,
			type = "sprite9Tips",
			frameGapHorizontal = 20,
			visible = false,
			x = 458,
			zorder = var_0_8,
			pic = {
				frame = true,
				path = "yxhd_title_bg.png"
			},
			middleRect = CCRectMake(30, 30, 151, 4),
			content = {
				{
					x = 0,
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybds_word_ybdsjjks.png"
					}
				}
			}
		},
		{
			x = 370,
			name = "time_pic",
			y = 445,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "yxhd_tit_time.png"
			},
			zorder = var_0_8
		},
		{
			y = 0,
			name = "node_buy1",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_10,
			children = {
				{
					name = "btn_buy1",
					h = 62,
					type = "button",
					w = 195,
					y = 230,
					x = 458,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							style = "label_warlock",
							y = 34,
							type = "label",
							x = 97,
							textId = 135462,
							color = var_0_0
						}
					}
				},
				{
					name = "btn_start",
					h = 62,
					type = "button",
					w = 195,
					y = 410,
					x = 458,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					children = {
						{
							fontSize = 25,
							style = "label_warlock",
							y = 34,
							type = "label",
							x = 97,
							textId = 136125,
							color = var_0_0
						}
					}
				},
				{
					y = 290,
					type = "sprite9",
					x = 458,
					preferedSize = CCSizeMake(480, 60),
					middleRect = CCRectMake(80, 24, 15, 1),
					pic = {
						path = "res/ui/juben/jb_wj_lv_d.png"
					},
					children = {
						{
							y = 28,
							name = "richLine_num",
							anchorPointX = 0.5,
							type = "richLine",
							gap = 10,
							x = 240,
							content = {
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/yxhd_word_yc.png"
									}
								},
								{
									text = "0",
									name = "alreadyRound",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/xflts_res_numb.png",
									itemHeight = 33
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/yxhd_word_lhkc.png"
									}
								},
								{
									text = "0",
									name = "currentNum",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/xflts_res_numb.png",
									itemHeight = 33
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/yxhd_word_l.png"
									}
								}
							}
						}
					}
				}
			}
		},
		{
			y = 130,
			name = "finalEatNum",
			visible = false,
			type = "node",
			x = 360,
			zorder = var_0_10,
			children = {
				{
					x = 0,
					name = "finalEatNum_bg",
					type = "sprite9",
					y = 0,
					pic = {
						frame = true,
						path = "yxhd_title_bg.png"
					},
					anchorPoint = ccp(0.5, 0.5),
					middleRect = CCRectMake(30, 0, 150, 64),
					preferedSize = CCSizeMake(350, 64)
				},
				{
					x = -50,
					name = "finalEatNum_p1",
					y = 3,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_gc.png"
					}
				},
				{
					name = "finalEatNum_p2",
					type = "atlaslabel",
					pic = "res/ui/common/number/yxhd_time_digit.png",
					startCharMap = 47,
					text = "0",
					y = 3,
					itemWidth = 35,
					x = 0,
					itemHeight = 34,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					x = 50,
					name = "finalEatNum_p3",
					y = 3,
					type = "sprite",
					pic = {
						frame = true,
						path = "ybds_word_fen.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "node_continue",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_10,
			children = {
				{
					name = "btn_continue",
					h = 62,
					type = "button",
					w = 195,
					y = 60,
					x = 328,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					children = {
						{
							fontSize = 25,
							style = "label_warlock",
							y = 34,
							type = "label",
							x = 97,
							textId = 136126,
							color = var_0_0
						}
					}
				},
				{
					name = "btn_rest",
					h = 62,
					type = "button",
					w = 195,
					y = 60,
					x = 588,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 25,
							style = "label_warlock",
							y = 34,
							type = "label",
							x = 97,
							textId = 136369,
							color = var_0_0
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_buy3",
					h = 40,
					type = "button",
					w = 40,
					y = 20,
					x = 440,
					normal = {
						frame = true,
						path = "yxhd_btn_add.png"
					},
					touched = {
						frame = true,
						path = "yxhd_btn_add_c.png"
					}
				},
				{
					fontSize = 22,
					name = "btn_buy3_info",
					y = 20,
					type = "label",
					style = "label_warlock",
					x = 415,
					anchorPoint = ccp(1, 0.5),
					color = var_0_0
				}
			}
		},
		{
			x = 2,
			name = "maskLayer2",
			height = 528,
			type = "layerColor",
			visible = false,
			y = 2,
			width = 911,
			color = ccc4(33, 21, 15, 166),
			zorder = var_0_9
		},
		{
			y = 320,
			name = "node_box",
			scale = 2.5,
			type = "node",
			visible = false,
			x = 458,
			zorder = var_0_10,
			children = {
				{
					style = "button_tip",
					name = "btn_box",
					y = 0,
					type = "button",
					scale = 1.5,
					x = 0
				},
				{
					x = 5,
					name = "light_box",
					y = 10,
					type = "sprite",
					scale = 0.4,
					pic = {
						frame = true,
						path = "yxhd_box_h.png"
					}
				},
				{
					x = 5,
					name = "pic_box",
					y = 10,
					type = "sprite",
					scale = 0.4,
					pic = {
						frame = false,
						path = "res/ui/rankInfo/DailyFeatView/gxb_bx.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "node_buy2",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_10,
			children = {
				{
					x = 915,
					name = "btn_buy2_bg",
					y = 495,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_bg2.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					zoomOnTouchDown = false,
					name = "btn_buy2",
					h = 40,
					type = "button",
					w = 40,
					y = 495,
					x = 885,
					normal = {
						frame = true,
						path = "yxhd_btn_add.png"
					},
					touched = {
						frame = true,
						path = "yxhd_btn_add_c.png"
					}
				},
				{
					fontSize = 22,
					name = "btn_buy2_info",
					y = 495,
					type = "label",
					style = "label_warlock",
					x = 860,
					anchorPoint = ccp(1, 0.5),
					color = var_0_0
				}
			}
		},
		{
			y = 495,
			name = "title2",
			visible = false,
			type = "node",
			x = 458,
			zorder = var_0_10,
			children = {
				{
					x = 0,
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_title_bg.png"
					}
				},
				{
					y = 2,
					name = "richLine_round",
					anchorPointX = 0.5,
					type = "richLine",
					gap = 0,
					x = 0,
					content = {
						{
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_di.png"
							}
						},
						{
							text = "0",
							name = "round",
							startCharMap = 47,
							type = "atlaslabel",
							itemWidth = 35,
							pic = "res/ui/common/number/yxhd_time_digit.png",
							itemHeight = 34
						},
						{
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_lun.png"
							}
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "tipsNode",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_8,
			children = {
				{
					y = 100,
					x = 245,
					type = "sprite9",
					pic = {
						frame = true,
						path = "yxhd_tips_bg.png"
					},
					middleRect = CCRectMake(42, 42, 1, 1),
					preferedSize = CCSizeMake(400, 150),
					children = {
						{
							y = 60,
							x = 80,
							type = "sprite",
							pic = {
								frame = true,
								path = "ybds_panzi.png"
							},
							children = {
								{
									x = 55,
									y = 70,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 125,
									y = 80,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 90,
									y = 100,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								}
							}
						},
						{
							fontSize = 22,
							height = 0,
							x = 280,
							type = "label",
							y = 75,
							textId = 136117,
							style = "label_warlock",
							width = 200,
							anchorPoint = ccp(0.5, 0.5),
							halign = kCCTextAlignmentLeft,
							color = var_0_0
						}
					}
				},
				{
					y = 100,
					x = 670,
					type = "sprite9",
					pic = {
						frame = true,
						path = "yxhd_tips_bg.png"
					},
					middleRect = CCRectMake(42, 42, 1, 1),
					preferedSize = CCSizeMake(400, 150),
					children = {
						{
							y = 60,
							x = 80,
							type = "sprite",
							pic = {
								frame = true,
								path = "ybds_panzi.png"
							},
							children = {
								{
									x = 55,
									y = 70,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 125,
									y = 80,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 90,
									y = 100,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_icon_yuebing.png"
									}
								},
								{
									x = 90,
									y = 70,
									type = "sprite",
									pic = {
										frame = true,
										path = "ybds_lajiao.png"
									}
								}
							}
						},
						{
							fontSize = 22,
							height = 0,
							x = 280,
							type = "label",
							y = 75,
							textId = 136118,
							style = "label_warlock",
							width = 200,
							anchorPoint = ccp(0.5, 0.5),
							halign = kCCTextAlignmentLeft,
							color = var_0_0
						}
					}
				}
			}
		},
		{
			type = "sprite",
			y = 528,
			x = 4,
			zorder = var_0_10,
			anchorPoint = ccp(0, 1),
			pic = {
				path = "res/ui/activity/lantern/yxhd_jty_bg.png"
			},
			children = {
				{
					y = 200.2273,
					x = 77,
					type = "sprite",
					pic = {
						path = "res/ui/activity/lantern/ybds_icon_hjyb.png"
					}
				},
				{
					fontSize = 28,
					name = "godTimes",
					y = 190,
					type = "label",
					x = 140,
					color = var_0_0,
					anchorPoint = ccp(1, 0.5)
				},
				{
					name = "btn_eatGold1",
					h = 54,
					type = "button",
					w = 125,
					y = 150,
					x = 77,
					normal = {
						frame = true,
						path = "btn2_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn2_yel_c.png"
					},
					children = {
						{
							fontSize = 22,
							y = 27,
							type = "label",
							x = 62,
							textId = 136361,
							color = var_0_0
						}
					}
				},
				{
					name = "btn_eatGold5",
					h = 54,
					type = "button",
					w = 125,
					y = 102,
					x = 77,
					normal = {
						frame = true,
						path = "btn2_yel_a.png"
					},
					touched = {
						frame = true,
						path = "btn2_yel_c.png"
					},
					children = {
						{
							fontSize = 22,
							y = 27,
							type = "label",
							x = 62,
							textId = 136362,
							color = var_0_0
						}
					}
				},
				{
					name = "btn_buyGold",
					h = 54,
					type = "button",
					w = 125,
					y = 54,
					x = 77,
					normal = {
						frame = true,
						path = "btn2_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn2_gre_c.png"
					},
					children = {
						{
							fontSize = 22,
							y = 27,
							type = "label",
							x = 62,
							textId = 136363,
							color = var_0_0
						}
					}
				},
				{
					y = 18,
					x = 50,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/activity/ironRotary/yuanbao.png"
					}
				},
				{
					fontSize = 22,
					name = "godGold",
					y = 18,
					type = "label",
					x = 70,
					color = var_0_3,
					anchorPoint = ccp(0, 0.5)
				}
			}
		}
	}
}

local function var_0_16(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0[arg_2_1]
	local var_2_1 = #arg_2_0
	local var_2_2 = 458 + 180 * (arg_2_1 - 1) - (var_2_1 - 1) * 90
	local var_2_3 = CCSprite:createWithSpriteFrameName("ybds_word_fen.png")
	local var_2_4 = 35 * #tostring(var_2_0.eatNum)
	local var_2_5 = -var_2_3:getContentSize().width / 2
	local var_2_6 = var_2_4 / 2
	local var_2_7 = CCSprite:createWithSpriteFrameName("yxhd_tit_di.png")
	local var_2_8 = CCSprite:createWithSpriteFrameName("yxhd_tit_ming.png")
	local var_2_9 = var_2_7:getContentSize().width
	local var_2_10 = 35 * #tostring(var_2_0.rank)
	local var_2_11 = var_2_8:getContentSize().width
	local var_2_12 = var_2_9 + var_2_10 + var_2_11
	local var_2_13 = -var_2_12 / 2 + var_2_9 / 2
	local var_2_14 = -var_2_12 / 2 + var_2_9 + var_2_10 / 2
	local var_2_15 = -var_2_12 / 2 + var_2_9 + var_2_10 + var_2_11 / 2

	return {
		y = 70,
		name = "node_rank",
		type = "node",
		x = var_2_2,
		children = {
			{
				scale = 0.8,
				y = 0,
				type = "node",
				x = 0,
				children = {
					{
						x = 0,
						y = 0,
						type = "sprite",
						pic = {
							frame = true,
							path = "yxhd_title_bg.png"
						}
					},
					{
						y = 2,
						type = "sprite",
						pic = {
							frame = true,
							path = "yxhd_tit_di.png"
						},
						x = var_2_13
					},
					{
						y = 2,
						type = "sprite",
						pic = {
							frame = true,
							path = "yxhd_tit_ming.png"
						},
						x = var_2_15
					},
					{
						type = "atlaslabel",
						pic = "res/ui/common/number/yxhd_time_digit.png",
						startCharMap = 47,
						y = 2,
						itemWidth = 35,
						itemHeight = 34,
						text = var_2_0.rank,
						x = var_2_14,
						anchorPoint = ccp(0.5, 0.5)
					}
				}
			},
			{
				style = "label_warlock",
				fontSize = 22,
				type = "label",
				y = 50,
				x = 0,
				text = var_2_0.playerName,
				color = var_0_0
			},
			{
				type = "atlaslabel",
				pic = "res/ui/common/number/yxhd_time_digit.png",
				startCharMap = 47,
				y = 90,
				itemWidth = 35,
				itemHeight = 34,
				text = var_2_0.eatNum,
				x = var_2_5,
				anchorPoint = ccp(0.5, 0.5)
			},
			{
				y = 90,
				type = "sprite",
				pic = {
					frame = true,
					path = "ybds_word_fen.png"
				},
				x = var_2_6
			}
		}
	}
end

function var_0_15.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getNewLanternActivity)
end

function var_0_15.onBuyLantern(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0:refresh()
	end

	messageBox.confirm(language.get(135364, arg_5_0.info.gold), function()
		cmgr.sendRequest(var_5_0, actions.buyNewLantern)
	end)
end

function var_0_15.onEatLantern(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		if var_9_0.rewards then
			local var_9_1 = {}

			for iter_9_0 = 1, #var_9_0.rewards do
				local var_9_2 = {
					id = var_0_14[var_9_0.rewards[iter_9_0].type or var_9_0.rewards[iter_9_0].pic]
				}

				var_9_2.id = var_9_2.id or 3
				var_9_2.value = var_9_0.rewards[iter_9_0].value

				table.insert(var_9_1, var_9_2)
			end

			globalAction_gotResource(var_9_1)
		end

		local var_9_3 = tolua.cast(arg_8_0.bowl[arg_8_1].obj, "CCSprite")

		var_9_3:setDisplayFrame(tool.spriteFrameByName("yxhd_yx1.png"))

		local var_9_4 = CCArray:create()
		local var_9_5 = CCFadeOut:create(0.1)
		local var_9_6 = CCMoveBy:create(0.1, ccp(0, -40))

		var_9_4:addObject(CCSpawn:createWithTwoActions(var_9_5, var_9_6))
		var_9_4:addObject(CCCallFuncN:create(function()
			var_9_3:removeFromParentAndCleanup(true)
			table.remove(arg_8_0.bowl, arg_8_1)
			arg_8_0:refresh()
		end))

		local var_9_7 = CCSequence:create(var_9_4)

		var_9_3:runAction(var_9_7)
	end

	cmgr.sendRequest(var_8_0, actions.newLanternEat)
end

function var_0_15.onGetLanternReward(arg_11_0)
	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0.action.data
		local var_12_1 = {}

		for iter_12_0 = 1, #var_12_0.rewards do
			local var_12_2 = {
				id = var_0_14[var_12_0.rewards[iter_12_0].type or var_12_0.rewards[iter_12_0].pic]
			}

			var_12_2.id = var_12_2.id or 3
			var_12_2.value = var_12_0.rewards[iter_12_0].value

			table.insert(var_12_1, var_12_2)
		end

		globalAction_gotResource(var_12_1)
		arg_11_0:refresh()
	end

	cmgr.sendRequest(var_11_0, actions.getNewLanternReward)
end

function var_0_15.onGetLanternBigGift(arg_13_0)
	local function var_13_0(arg_14_0)
		local var_14_0 = arg_14_0.action.data
		local var_14_1 = {}

		for iter_14_0 = 1, #var_14_0.rewards do
			local var_14_2 = {
				id = var_0_14[var_14_0.rewards[iter_14_0].type or var_14_0.rewards[iter_14_0].pic]
			}

			var_14_2.id = var_14_2.id or 3
			var_14_2.value = var_14_0.rewards[iter_14_0].value

			table.insert(var_14_1, var_14_2)
		end

		globalAction_gotResource(var_14_1)
		arg_13_0:refresh()
	end

	cmgr.sendRequest(var_13_0, actions.getNewLanternBigGift)
end

function var_0_15.onStartEatLantern(arg_15_0)
	local function var_15_0(arg_16_0)
		arg_15_0:refresh()
	end

	cmgr.sendRequest(var_15_0, actions.startEatNewLantern)
end

function var_0_15.onEatGoldSoupball(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		local var_18_0 = arg_18_0.action.data
		local var_18_1 = {}

		for iter_18_0 = 1, #var_18_0.rewards do
			local var_18_2 = {
				id = var_0_14[var_18_0.rewards[iter_18_0].type or var_18_0.rewards[iter_18_0].pic]
			}

			var_18_2.id = var_18_2.id or 3
			var_18_2.value = var_18_0.rewards[iter_18_0].value

			table.insert(var_18_1, var_18_2)
		end

		globalAction_gotResource(var_18_1)
		arg_17_0:refresh()
	end

	cmgr.sendRequest(var_17_0, actions.eatGoldSoupball, arg_17_1)
end

function var_0_15.onBuyGoldSoupball(arg_19_0)
	local function var_19_0(arg_20_0)
		arg_19_0:refresh()
	end

	messageBox.showChargeWin("", language.get(136365, arg_19_0.info.godGold), "newLanternBuyGodSoupball", function()
		cmgr.sendRequest(var_19_0, actions.buyGoldSoupball)
	end)
end

function var_0_15.addLanternBowl(arg_22_0, arg_22_1)
	arg_22_0.bowl = {}

	if arg_22_0.bowlNode then
		arg_22_0.bowlNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.bowlNode = CCNode:create()

		arg_22_0.view.widgets.panel:addChild(arg_22_0.bowlNode, var_0_6)
	end

	if arg_22_1 == 0 then
		return
	end

	local var_22_0 = {
		1,
		2,
		3
	}
	local var_22_1 = 0
	local var_22_2 = false

	if not arg_22_1 then
		arg_22_1 = math.random(1, 3)
		var_22_1 = arg_22_1 >= 2 and math.random(1, arg_22_1) or 0
		var_22_2 = true
	end

	local var_22_3 = {
		ccp(90, 100),
		ccp(125, 80),
		ccp(55, 70)
	}

	for iter_22_0 = 1, arg_22_1 do
		local var_22_4 = CCSprite:createWithSpriteFrameName("ybds_panzi.png")
		local var_22_5 = table.remove(var_22_0, math.random(1, #var_22_0))

		var_22_4:setPosition(ccp(var_22_5 * 300 - 150, 55))
		arg_22_0.bowlNode:addChild(var_22_4)

		for iter_22_1 = 1, 3 do
			local var_22_6 = CCSprite:createWithSpriteFrameName("ybds_icon_yuebing.png")

			var_22_6:setPosition(var_22_3[iter_22_1])
			var_22_4:addChild(var_22_6, 3 - iter_22_1, iter_22_1)
		end

		if iter_22_0 == var_22_1 then
			local var_22_7 = {
				num = 0,
				obj = var_22_4,
				pos = var_22_5,
				cd = var_0_11
			}

			table.insert(arg_22_0.bowl, var_22_7)

			local var_22_8 = CCSprite:createWithSpriteFrameName("ybds_lajiao.png")

			var_22_4:addChild(var_22_8, 0, 111)
			var_22_8:setPosition(ccp(90, 70))
		else
			table.insert(arg_22_0.bowl, {
				num = 0,
				cd = 0,
				obj = var_22_4,
				pos = var_22_5
			})
		end

		if var_22_2 then
			var_22_4:setPosition(ccp(var_22_5 * 300 - 150, 15))
			var_22_4:setOpacity(0)

			local var_22_9 = CCArray:create()
			local var_22_10 = CCFadeIn:create(0.1)
			local var_22_11 = CCMoveBy:create(0.1, ccp(0, 40))

			var_22_9:addObject(CCSpawn:createWithTwoActions(var_22_10, var_22_11))

			local var_22_12 = CCSequence:create(var_22_9)

			var_22_4:runAction(var_22_12)
		end
	end

	local var_22_13 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	arg_22_0.bowlNode:addChild(var_22_13)
	var_22_13:registerScriptTouchHandler(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_23_1, arg_23_2)

			if arg_22_0.isHot or arg_22_0.info.state ~= 2 then
				return false
			else
				for iter_23_0 = 1, #arg_22_0.bowl do
					local var_23_0 = tolua.cast(arg_22_0.bowl[iter_23_0].obj, "CCSprite")

					if arg_22_0.bowl[iter_23_0].num < var_0_12 and tool.checkIfTouch(var_23_0, arg_23_1, arg_23_2) then
						arg_22_0:showEatEffect(iter_23_0)

						return true
					end
				end
			end

			return false
		elseif arg_23_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_23_1, arg_23_2)

			return true
		elseif arg_23_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_23_1, arg_23_2)

			return true
		end
	end, false, true)
	var_22_13:setTouchEnabled(true)
end

function var_0_15.showEatEffect(arg_24_0, arg_24_1)
	if arg_24_0.spoonNode then
		arg_24_0.spoonNode:removeAllChildrenWithCleanup(true)
	else
		arg_24_0.spoonNode = CCNode:create()

		arg_24_0.view.widgets.panel:addChild(arg_24_0.spoonNode, var_0_6 + 10)
	end

	local var_24_0 = arg_24_0.bowl[arg_24_1]
	local var_24_1 = tolua.cast(var_24_0.obj, "CCSprite")

	log.info("touchBowl, idx:%d, pos:%d", arg_24_1, var_24_0.pos)

	if var_24_0.cd > 0 then
		local var_24_2 = CCArray:create()
		local var_24_3 = CCFadeOut:create(0.1)
		local var_24_4 = CCMoveBy:create(0.1, ccp(0, -40))

		var_24_2:addObject(CCSpawn:createWithTwoActions(var_24_3, var_24_4))
		var_24_2:addObject(CCCallFuncN:create(function()
			var_24_1:removeFromParentAndCleanup(true)
			table.remove(arg_24_0.bowl, arg_24_1)
			arg_24_0:showPanel(arg_24_0.info)
		end))

		local var_24_5 = CCSequence:create(var_24_2)

		var_24_1:runAction(var_24_5)
		log.info("HOT!!!")

		local var_24_6 = CCArray:create()

		var_24_6:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_24_6:addObject(CCMoveBy:create(0.1, ccp(-10, 0)))

		local var_24_7 = CCSequence:create(var_24_6)

		arg_24_0.view.widgets.playerPic:runAction(CCRepeatForever:create(var_24_7))

		arg_24_0.isHot = true

		arg_24_0.view.widgets.tipMsg:setString(language.get(136115))
		arg_24_0.view.widgets.tipFrame:setVisible(true)

		local var_24_8 = CCArray:create()

		var_24_8:addObject(CCDelayTime:create(var_0_11))
		var_24_8:addObject(CCCallFuncN:create(function()
			arg_24_0.isHot = false

			arg_24_0.view.widgets.playerPic:stopAllActions()
			arg_24_0.view.widgets.playerPic:setPositionX(458)
		end))
		var_24_8:addObject(CCDelayTime:create(1))
		var_24_8:addObject(CCCallFuncN:create(function()
			arg_24_0.view.widgets.tipFrame:setVisible(false)
		end))

		local var_24_9 = CCSequence:create(var_24_8)

		arg_24_0.view.widgets.tipFrame:runAction(var_24_9)
	else
		var_24_0.num = var_24_0.num + 1

		local var_24_10 = tolua.cast(var_24_0.obj, "CCSprite"):getChildByTag(var_24_0.num)

		if var_24_10 then
			var_24_10:setVisible(false)
		end

		local var_24_11 = CCSprite:createWithSpriteFrameName("dwhd_hand.png")

		var_24_11:setPosition(ccp(var_24_0.pos * 300 - 30, 150))
		arg_24_0.spoonNode:addChild(var_24_11)

		local var_24_12 = CCArray:create()

		var_24_12:addObject(CCMoveBy:create(0.2, ccp(-90, -60)))
		var_24_12:addObject(CCCallFuncN:create(function()
			local var_28_0 = CCSprite:createWithSpriteFrameName("ybds_icon_yuebing.png")

			var_28_0:setPosition(ccp(55, 25))
			var_24_11:addChild(var_28_0, -1)
		end))
		var_24_12:addObject(CCMoveBy:create(0.3, ccp(90, 60)))
		var_24_12:addObject(CCCallFuncN:create(function()
			var_24_11:removeFromParentAndCleanup(true)
		end))

		local var_24_13 = CCSequence:create(var_24_12)

		var_24_11:runAction(var_24_13)

		if var_24_0.num >= var_0_12 then
			arg_24_0:onEatLantern(arg_24_1)
		end
	end
end

local function var_0_17(arg_30_0)
	log.info("getEmpytBowlNode")

	local var_30_0 = CCSpriteBatchNode:create("res/ui/activity/lantern/lanternPic.png")

	for iter_30_0 = 1, arg_30_0 do
		local var_30_1 = CCSprite:createWithSpriteFrameName("yxhd_bowl1.png")

		if iter_30_0 == 1 then
			var_30_1:setDisplayFrame(tool.spriteFrameByName("yxhd_bowl.png"))
			var_30_1:setPosition(ccp(0, 0))
		else
			var_30_1:setPosition(ccp(0, (iter_30_0 - 2) * 20 + 13))
		end

		var_30_0:addChild(var_30_1, 0, iter_30_0)
	end

	return var_30_0
end

function var_0_15.addEmptyBowl(arg_31_0)
	log.info("addEmptyBowl")

	if arg_31_0.emptyNode then
		arg_31_0.emptyNode:removeAllChildrenWithCleanup(true)
	else
		arg_31_0.emptyNode = CCNode:create()

		arg_31_0.view.widgets.panel:addChild(arg_31_0.emptyNode)
	end

	local var_31_0 = ccp(660, 275)
	local var_31_1 = arg_31_0.info.eatNum
	local var_31_2 = math.ceil(var_31_1 / 5)
	local var_31_3 = var_0_17(var_31_2)

	var_31_3:setPosition(var_31_0)
	var_31_3:setScaleY(0.875)
	arg_31_0.emptyNode:addChild(var_31_3)

	if var_31_1 > 0 then
		local var_31_4 = CCLabelAtlas:create("0", "res/ui/common/number/yxhd_time_digit.png", 35, 34, 47)

		var_31_4:setAnchorPoint(ccp(0.5, 0.5))
		var_31_4:setString(tostring(var_31_1))

		local var_31_5 = CCSprite:createWithSpriteFrameName("ybds_word_fen.png")
		local var_31_6 = var_31_4:getContentSize().width
		local var_31_7 = var_31_5:getContentSize().width
		local var_31_8 = var_31_6 + var_31_7

		var_31_4:setPosition(ccp(var_31_0.x - var_31_8 / 2 + var_31_6 / 2, var_31_0.y - 20))
		var_31_5:setPosition(ccp(var_31_0.x - var_31_8 / 2 + var_31_6 + var_31_7 / 2, var_31_0.y - 20))
		arg_31_0.emptyNode:addChild(var_31_4)
		arg_31_0.emptyNode:addChild(var_31_5)
	end
end

function var_0_15.setBtnBoxEnabled(arg_32_0, arg_32_1)
	arg_32_0.view.widgets.btn_box:setVisible(arg_32_1)
	arg_32_0.view.widgets.light_box:stopAllActions()
	arg_32_0.view.widgets.light_box:setVisible(arg_32_1)

	if arg_32_1 then
		local var_32_0 = CCArray:create()

		var_32_0:addObject(CCFadeIn:create(0.3))
		var_32_0:addObject(CCFadeOut:create(0.3))

		local var_32_1 = CCSequence:create(var_32_0)

		arg_32_0.view.widgets.light_box:runAction(CCRepeatForever:create(var_32_1))
		arg_32_0.view.widgets.light_box:setVisible(true)
	end

	local var_32_2 = "res/ui/rankInfo/DailyFeatView/" .. (arg_32_1 and "gxb_bx.png" or "gxb_bx_c.png")

	arg_32_0.view.widgets.pic_box:setDisplayFrame(CCSprite:create(var_32_2):displayFrame())
end

function var_0_15.showFinalResult(arg_33_0)
	if arg_33_0.resultNode then
		arg_33_0.resultNode:removeAllChildrenWithCleanup(true)
	else
		arg_33_0.resultNode = CCNode:create()

		arg_33_0.view.widgets.panel:addChild(arg_33_0.resultNode, var_0_8)
	end

	if arg_33_0.info.haveRankReward == 1 then
		if arg_33_0.info.haveRankReceived == 0 then
			arg_33_0:setBtnBoxEnabled(true)
			arg_33_0.view.widgets.btn_box:addHandleOfControlEvent(function()
				log.info("btn_box，领取最终奖励")
				arg_33_0:onGetLanternBigGift()
			end, CCControlEventTouchUpInside)
		else
			arg_33_0:setBtnBoxEnabled(false)
		end

		arg_33_0.view.widgets.node_box:setScale(2.5)
		arg_33_0.view.widgets.node_box:setPosition(ccp(458, 320))
		arg_33_0.view.widgets.node_box:setVisible(true)
	end

	for iter_33_0 = 1, #arg_33_0.info.ranks do
		local var_33_0 = {}

		uiutil.initWidgets(var_33_0, var_0_16(arg_33_0.info.ranks, iter_33_0))
		arg_33_0.resultNode:addChild(var_33_0.widgets.node_rank)

		local var_33_1 = math.ceil(arg_33_0.info.ranks[iter_33_0].eatNum / 5)

		if var_33_1 > 20 then
			var_33_1 = 20
		end

		local var_33_2 = var_0_17(var_33_1)

		var_33_2:setPosition(ccp(0, 140))
		var_33_2:setScaleY(0.875)
		var_33_0.widgets.node_rank:addChild(var_33_2)
	end
end

function var_0_15.showRoundResult(arg_35_0)
	if arg_35_0.resultNode then
		arg_35_0.resultNode:removeAllChildrenWithCleanup(true)
	else
		arg_35_0.resultNode = CCNode:create()

		arg_35_0.view.widgets.panel:addChild(arg_35_0.resultNode, var_0_8)
	end

	if arg_35_0.info.title > 0 then
		if arg_35_0.info.haveTitleReceived == 0 then
			arg_35_0:setBtnBoxEnabled(true)
			arg_35_0.view.widgets.btn_box:addHandleOfControlEvent(function()
				log.info("btn_box，领取本轮奖励")
				arg_35_0:onGetLanternReward()
			end, CCControlEventTouchUpInside)
		else
			arg_35_0:setBtnBoxEnabled(false)
		end

		arg_35_0.view.widgets.node_box:setScale(1)
		arg_35_0.view.widgets.node_box:setPosition(ccp(710, 150 + (arg_35_0.info.title - 1) * 70 + 60))
		arg_35_0.view.widgets.node_box:setVisible(true)
	end

	for iter_35_0 = 1, 5 do
		local var_35_0
		local var_35_1

		if iter_35_0 <= arg_35_0.info.title then
			var_35_0 = "yxhd_tit_bg.png"
			var_35_1 = string.format("%s.png", var_0_5[iter_35_0])
		else
			var_35_0 = "yxhd_tit_bg_g.png"
			var_35_1 = string.format("%s_g.png", var_0_5[iter_35_0])
		end

		local var_35_2 = CCSprite:createWithSpriteFrameName(var_35_0)

		var_35_2:setPosition(ccp(570, iter_35_0 * 70 + 80 + 60))
		arg_35_0.resultNode:addChild(var_35_2)

		local var_35_3 = CCSprite:createWithSpriteFrameName(var_35_1)

		var_35_3:setPosition(ccp(130, 36))
		var_35_2:addChild(var_35_3)
	end

	arg_35_0.view.widgets.finalEatNum_p2:setString(arg_35_0.info.eatNum)

	local var_35_4 = arg_35_0.view.widgets.finalEatNum_p1:getContentSize().width
	local var_35_5 = arg_35_0.view.widgets.finalEatNum_p2:getContentSize().width
	local var_35_6 = arg_35_0.view.widgets.finalEatNum_p3:getContentSize().width
	local var_35_7 = var_35_4 + var_35_5 + var_35_6

	arg_35_0.view.widgets.finalEatNum_p1:setPositionX(-var_35_7 / 2 + var_35_4 / 2)
	arg_35_0.view.widgets.finalEatNum_p2:setPositionX(-var_35_7 / 2 + var_35_4 + var_35_5 / 2)
	arg_35_0.view.widgets.finalEatNum_p3:setPositionX(-var_35_7 / 2 + var_35_4 + var_35_5 + var_35_6 / 2)
	arg_35_0.view.widgets.finalEatNum_bg:setPreferredSize(CCSizeMake(var_35_7 + 60, 64))
	arg_35_0.view.widgets.finalEatNum:setVisible(true)
	arg_35_0.view.widgets.node_continue:setVisible(true)

	local var_35_8 = 4 * arg_35_0.info.title
	local var_35_9 = var_0_17(var_35_8)

	var_35_9:setPosition(ccp(330, 185))
	var_35_9:setScaleY(0.875)
	arg_35_0.resultNode:addChild(var_35_9)

	if arg_35_0.info.haveTitleReceived == 0 then
		for iter_35_1 = 1, var_35_8 do
			local var_35_10 = var_35_9:getChildByTag(iter_35_1)

			var_35_10:setOpacity(0)

			local var_35_11 = CCArray:create()

			var_35_11:addObject(CCDelayTime:create(0.15 * (iter_35_1 - 1)))
			var_35_11:addObject(CCFadeIn:create(0.05))

			local var_35_12 = CCSequence:create(var_35_11)

			var_35_10:runAction(var_35_12)
		end
	end
end

local function var_0_18(arg_37_0)
	local var_37_0 = arg_37_0.cd / 1000
	local var_37_1 = math.floor(var_37_0 / 3600)
	local var_37_2 = var_37_0 % 3600
	local var_37_3 = math.floor(var_37_2 / 60)
	local var_37_4 = var_37_2 % 60
	local var_37_5 = ""

	if var_37_1 == 0 then
		var_37_5 = string.format("%02d:%02d", var_37_3, var_37_4)
	else
		var_37_5 = string.format("%02d:%02d:%02d", var_37_1, var_37_3, var_37_4)
	end

	if arg_37_0.state == 2 then
		var_37_5 = string.sub(var_37_5, -5)
	elseif arg_37_0.state == 3 then
		var_37_5 = language.get(135368, arg_37_0.round + 1, var_37_5)
	end

	return var_37_5
end

function var_0_15.showPanel(arg_38_0, arg_38_1)
	arg_38_0.view.widgets.panel:stopAllActions()

	if arg_38_1.state == 3 then
		local var_38_0 = CCArray:create()

		var_38_0:addObject(CCDelayTime:create(0.5))
		var_38_0:addObject(CCCallFuncN:create(function()
			arg_38_0:refresh()
		end))

		local var_38_1 = CCSequence:create(var_38_0)

		arg_38_0.view.widgets.panel:runAction(var_38_1)

		return
	end

	arg_38_0.info = arg_38_1

	if arg_38_0.resultNode then
		arg_38_0.resultNode:removeAllChildrenWithCleanup(true)
	end

	if arg_38_0.emptyNode then
		arg_38_0.emptyNode:removeAllChildrenWithCleanup(true)
	end

	if arg_38_0.view.widgets.timer and not tolua.isnull(arg_38_0.view.widgets.timer) then
		arg_38_0.view.widgets.timer:removeFromParentAndCleanup(true)

		arg_38_0.view.widgets.timer = nil
	end

	arg_38_0.view.widgets.time_pic:setVisible(arg_38_1.state == 2)
	arg_38_0.view.widgets.maskLayer1:setVisible(false)
	arg_38_0.view.widgets.maskLayer2:setVisible(false)
	arg_38_0.view.widgets.node_buy1:setVisible(arg_38_1.state == 1)
	arg_38_0.view.widgets.btn_buy2_info:setString(language.get(135363, arg_38_1.fenzi, arg_38_1.fenmu))
	arg_38_0.view.widgets.node_buy2:setVisible(arg_38_1.state == 2 or arg_38_1.state == 5)
	arg_38_0.view.widgets.tipsNode:setVisible(arg_38_1.state == 1)
	arg_38_0.view.widgets.node_box:setVisible(false)
	arg_38_0.view.widgets.finalEatNum:setVisible(false)
	arg_38_0.view.widgets.node_continue:setVisible(false)
	arg_38_0.view.widgets.title1:setVisible(arg_38_1.state == 1)
	arg_38_0.view.widgets.title2:setVisible(false)

	if arg_38_1.state == 1 then
		arg_38_0.view.widgets.maskLayer1:setVisible(true)
		arg_38_0.view.widgets.alreadyRound:setString(tostring(arg_38_1.alreadyRound))
		arg_38_0.view.widgets.currentNum:setString(tostring(arg_38_1.currentNum))
		arg_38_0.view.widgets.richLine_num:reorder()
		arg_38_0.view.widgets.btn_buy1:setVisible(arg_38_1.fenzi ~= arg_38_1.fenmu)
	elseif arg_38_1.state == 2 then
		arg_38_0.view.widgets.round:setString(tostring(arg_38_1.round))
		arg_38_0.view.widgets.richLine_round:reorder()
		arg_38_0.view.widgets.title2:setVisible(true)

		if arg_38_1.cd > 0 then
			local var_38_2 = CCLabelAtlas:create("", "res/ui/common/number/yxhd_time_digit2.png", 35, 39, 48)

			var_38_2:setAnchorPoint(ccp(0.5, 0.5))
			var_38_2:setString(var_0_18(arg_38_1))
			arg_38_0.view.widgets.panel:addChild(var_38_2, var_0_8)
			var_38_2:setPosition(ccp(512, 445))

			arg_38_0.view.widgets.timer = var_38_2
		end

		arg_38_0:addEmptyBowl()
	elseif arg_38_1.state == 3 then
		-- block empty
	elseif arg_38_1.state == 4 then
		arg_38_0:showFinalResult()
		arg_38_0.view.widgets.maskLayer1:setVisible(true)
	elseif arg_38_1.state == 5 then
		arg_38_0.view.widgets.round:setString(tostring(arg_38_1.round))
		arg_38_0.view.widgets.richLine_round:reorder()
		arg_38_0.view.widgets.title2:setVisible(true)
	elseif arg_38_1.state == 6 then
		arg_38_0:showRoundResult()
		arg_38_0.view.widgets.maskLayer1:setVisible(true)
		arg_38_0.view.widgets.btn_buy3:setVisible(arg_38_1.fenmu ~= 0)

		local var_38_3
		local var_38_4

		if arg_38_1.fenmu == 0 then
			var_38_3 = language.get(136368)
			var_38_4 = ccc3(255, 0, 0)
		elseif arg_38_1.fenzi == 0 then
			var_38_3 = language.get(136367)
			var_38_4 = ccc3(255, 0, 0)
		else
			var_38_3 = language.get(135363, arg_38_1.fenzi, arg_38_1.fenmu)
			var_38_4 = var_0_0
		end

		arg_38_0.view.widgets.btn_buy3_info:setString(var_38_3)
		arg_38_0.view.widgets.btn_buy3_info:setColor(var_38_4)
	end

	if arg_38_1.state == 2 then
		arg_38_0.bowl = arg_38_0.bowl or {}

		local var_38_5 = true

		if #arg_38_0.bowl > 0 then
			for iter_38_0, iter_38_1 in ipairs(arg_38_0.bowl) do
				if iter_38_1.cd == 0 then
					var_38_5 = false

					break
				end
			end
		end

		if var_38_5 then
			arg_38_0:addLanternBowl()
		end
	elseif arg_38_1.state == 4 then
		arg_38_0:addLanternBowl(3)
	else
		arg_38_0:addLanternBowl(0)
	end

	if arg_38_1.state == 2 then
		local var_38_6 = arg_38_0.view.widgets.timer

		if var_38_6 then
			local var_38_7 = CCArray:create()

			var_38_7:addObject(CCDelayTime:create(1))
			var_38_7:addObject(CCCallFuncN:create(function()
				arg_38_1.cd = arg_38_1.cd - 1000

				if arg_38_1.cd <= 0 or arg_38_1.state == 1 and arg_38_1.after930 == 0 and arg_38_1.cd <= 900000 then
					var_38_6:removeFromParentAndCleanup(true)

					arg_38_0.view.widgets.timer = nil

					arg_38_0:refresh()
				else
					var_38_6:setString(var_0_18(arg_38_1))
				end
			end))

			local var_38_8 = CCSequence:create(var_38_7)

			var_38_6:runAction(CCRepeatForever:create(var_38_8))
		end
	end

	arg_38_0.view.widgets.leftTime:setVisible(arg_38_1.state ~= 2)
	arg_38_0.view.widgets.godTimes:setString(language.get(490026, arg_38_1.godTimes))
	arg_38_0.view.widgets.godGold:setString(arg_38_1.godGold)
end

function var_0_15.ctor(arg_41_0, arg_41_1, arg_41_2)
	log.info("@@ 欢庆中秋活动")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic.plist")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic2.plist")
	rmgr.loadResource("res/ui/activity/moonCake/moonCakePic.plist")

	arg_41_0.view = {}

	uiutil.initWidgets(arg_41_0.view, arg_41_0.layout)

	arg_41_0.leftTime = arg_41_0.view.widgets.leftTime

	if arg_41_1 then
		arg_41_0:addChild(arg_41_0.view.widgets.panel)
		arg_41_1:addChild(arg_41_0)
	end

	math.randomseed(os.time())
	arg_41_0.view.widgets.playerPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())
	arg_41_0.view.widgets.btn_box:setOpacity(0)
	arg_41_0.view.widgets.btn_buy1:addHandleOfControlEvent(function()
		log.info("btn_buy1")
		arg_41_0:onBuyLantern()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_buy2:addHandleOfControlEvent(function()
		log.info("btn_buy2")
		arg_41_0:onBuyLantern()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_buy3:addHandleOfControlEvent(function()
		log.info("btn_buy3")
		arg_41_0:onBuyLantern()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_buy2_bg:setScaleX(-2)
	arg_41_0.view.widgets.btn_buy2_bg:setScaleY(1.4)
	arg_41_0.view.widgets.btn_eatGold1:addHandleOfControlEvent(function()
		log.info("btn_eatGold1")
		arg_41_0:onEatGoldSoupball(1)
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_eatGold5:addHandleOfControlEvent(function()
		log.info("btn_eatGold5")
		arg_41_0:onEatGoldSoupball(2)
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_buyGold:addHandleOfControlEvent(function()
		log.info("btn_buyGold")
		arg_41_0:onBuyGoldSoupball()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_start:addHandleOfControlEvent(function()
		log.info("btn_start")
		arg_41_0:onStartEatLantern()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_continue:addHandleOfControlEvent(function()
		log.info("btn_continue")
		arg_41_0:onStartEatLantern()
	end, CCControlEventTouchUpInside)
	arg_41_0.view.widgets.btn_rest:addHandleOfControlEvent(function()
		log.info("btn_rest")
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	end, CCControlEventTouchUpInside)
	arg_41_0:showPanel(arg_41_2)
end

return var_0_15
