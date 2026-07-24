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
local var_0_14 = {}

var_0_14[3] = 3
var_0_14[4] = 4
var_0_14[5] = 6
var_0_14[81] = 24
var_0_14[100] = 100
var_0_14[101] = 15
var_0_14[102] = 41
var_0_14.freeHuanyin = 41
var_0_14.xinlian = 15

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
			fontSize = 22,
			name = "leftTime",
			visible = false,
			type = "label",
			scale = 1.5909090909090908,
			style = "label_warlock",
			y = 475,
			x = 770,
			anchorPoint = ccp(0.5, 0.5),
			color = var_0_2
		},
		{
			x = 458,
			name = "playerPicM",
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
			x = 0,
			name = "playerPicL",
			y = 165,
			type = "sprite",
			scale = 0.6,
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/common/playerPic/player1.png"
			},
			anchorPoint = ccp(0, 0)
		},
		{
			x = 915,
			name = "playerPicR",
			y = 165,
			type = "sprite",
			scale = 0.6,
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/common/playerPic/player1.png"
			},
			anchorPoint = ccp(1, 0)
		},
		{
			fontSize = 20,
			name = "playerNameM",
			visible = false,
			type = "label",
			style = "label_warlock",
			y = 10,
			x = 458,
			zorder = var_0_6 + 1,
			anchorPoint = ccp(0.5, 0)
		},
		{
			fontSize = 20,
			name = "playerNameL",
			visible = false,
			type = "label",
			y = 120,
			x = 140,
			style = "label_warlock",
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 20,
			name = "playerNameR",
			visible = false,
			type = "label",
			y = 120,
			x = 775,
			style = "label_warlock",
			anchorPoint = ccp(1, 0.5)
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
			x = 0,
			name = "maskLayer1",
			height = 532,
			type = "layerColor",
			visible = false,
			y = 0,
			width = 915,
			color = ccc4(33, 21, 15, 166),
			zorder = var_0_7
		},
		{
			x = 458,
			name = "title1",
			y = 460,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "dwhd_word_zzdsjjks.png"
			},
			zorder = var_0_8
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
			zorder = var_0_8,
			children = {
				{
					y = 230,
					name = "btn_buy1",
					style = "button_yel3",
					type = "button",
					x = 458,
					children = {
						{
							fontSize = 22,
							style = "label_warlock",
							y = 27,
							type = "label",
							x = 70,
							textId = 135362,
							color = var_0_0
						}
					}
				},
				{
					x = 380,
					name = "btn_buy1_info_p1",
					y = 280,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_ndqkc.png"
					}
				},
				{
					name = "btn_buy1_info_p2",
					type = "atlaslabel",
					pic = "res/ui/common/number/yxhd_time_digit.png",
					startCharMap = 47,
					text = "0/0",
					y = 280,
					itemWidth = 35,
					x = 560,
					itemHeight = 34,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					x = 615,
					name = "btn_buy1_info_p3",
					y = 280,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_lun.png"
					}
				}
			}
		},
		{
			y = 50,
			name = "finalEatNum",
			visible = false,
			type = "node",
			x = 458,
			zorder = var_0_8,
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
				(function()
					if conf.language == "vie" then
						return {
							x = -50,
							name = "finalEatNum_p1",
							y = 3,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/native/ui/activity/lantern/yxhd_tit_gc.png"
							}
						}
					else
						return {
							x = -50,
							name = "finalEatNum_p1",
							y = 3,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_gc.png"
							}
						}
					end
				end)(),
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
						path = "dwhd_word_ge.png"
					}
				}
			}
		},
		{
			x = 0,
			name = "maskLayer2",
			height = 532,
			type = "layerColor",
			visible = false,
			y = 0,
			width = 915,
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
					x = 2,
					name = "light_box",
					y = 4,
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
					fontSize = 20,
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
			y = 250,
			name = "node_noNum",
			scale = 3,
			type = "node",
			visible = false,
			x = 458,
			zorder = var_0_10,
			children = {
				{
					x = 0,
					name = "node_noNum_bg1",
					y = 0,
					type = "sprite",
					scale = -1,
					pic = {
						frame = true,
						path = "yxhd_tit_bg2.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					x = 0,
					name = "node_noNum_bg2",
					y = 0,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_bg2.png"
					},
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 0,
					x = 0,
					scale = 0.47,
					type = "sprite",
					pic = {
						frame = true,
						path = "yxhd_tit_ndlcyyw.png"
					}
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
			children = (function()
				if conf.language == "vie" then
					return {
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
							x = -26,
							y = 4,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/native/ui/activity/lantern/yxhd_tit_di_lun.png"
							}
						},
						{
							x = 50,
							name = "round",
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_digit01.png"
							}
						}
					}
				elseif conf.language == "ina" then
					return {
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
							x = -16,
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_lun.png"
							}
						},
						{
							x = 65,
							name = "round",
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_digit01.png"
							}
						}
					}
				elseif conf.language == "tha" then
					return {
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
							x = -16,
							y = 9,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_lun.png"
							}
						},
						{
							x = 65,
							name = "round",
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_digit01.png"
							}
						}
					}
				else
					return {
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
							x = -50,
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_di.png"
							}
						},
						{
							x = 50,
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_lun.png"
							}
						},
						{
							x = 0,
							name = "round",
							y = 2,
							type = "sprite",
							pic = {
								frame = true,
								path = "yxhd_tit_digit01.png"
							}
						}
					}
				end
			end)()
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 25,
			type = "button",
			visible = false,
			x = 890,
			zorder = var_0_10
		},
		{
			y = 0,
			name = "tipsNode",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_10,
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
								path = "dwhd_zy.png"
							},
							children = {
								{
									x = 140,
									y = 65,
									type = "sprite",
									pic = {
										frame = true,
										path = "dwhd_zz.png"
									}
								},
								{
									x = 80,
									y = 50,
									type = "sprite",
									pic = {
										frame = true,
										path = "dwhd_zz.png"
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
							textId = 135371,
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
							x = 80,
							name = "hot_bowl",
							y = 60,
							type = "sprite",
							pic = {
								frame = true,
								path = "dwhd_zy.png"
							},
							children = {
								{
									x = 140,
									y = 65,
									type = "sprite",
									pic = {
										frame = true,
										path = "dwhd_zz.png"
									}
								},
								{
									x = 80,
									y = 50,
									type = "sprite",
									pic = {
										frame = true,
										path = "dwhd_zz.png"
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
							textId = 135372,
							style = "label_warlock",
							width = 200,
							anchorPoint = ccp(0.5, 0.5),
							halign = kCCTextAlignmentLeft,
							color = var_0_0
						}
					}
				}
			}
		}
	}
}

local function var_0_16(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0[arg_4_1]
	local var_4_1 = #arg_4_0
	local var_4_2 = 458 + 180 * (arg_4_1 - 1) - (var_4_1 - 1) * 90
	local var_4_3 = CCSprite:createWithSpriteFrameName("dwhd_word_ge.png")
	local var_4_4 = 35 * #tostring(var_4_0.eatNum)
	local var_4_5 = -var_4_3:getContentSize().width / 2
	local var_4_6 = var_4_4 / 2
	local var_4_7 = CCSprite:createWithSpriteFrameName("yxhd_tit_di.png")
	local var_4_8 = CCSprite:createWithSpriteFrameName("yxhd_tit_ming.png")
	local var_4_9 = var_4_7:getContentSize().width
	local var_4_10 = 35 * #tostring(var_4_0.rank)
	local var_4_11 = var_4_8:getContentSize().width
	local var_4_12 = var_4_9 + var_4_10 + var_4_11
	local var_4_13 = -var_4_12 / 2 + var_4_9 / 2
	local var_4_14 = -var_4_12 / 2 + var_4_9 + var_4_10 / 2
	local var_4_15 = -var_4_12 / 2 + var_4_9 + var_4_10 + var_4_11 / 2

	return {
		y = 70,
		name = "node_rank",
		type = "node",
		x = var_4_2,
		children = {
			{
				scale = 0.8,
				y = 0,
				type = "node",
				x = 0,
				children = (function()
					if conf.language == "vie" then
						return {
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
								x = -10,
								y = 2,
								type = "sprite",
								pic = {
									frame = false,
									path = "res/native/ui/activity/lantern/yxhd_tit_di_ming.png"
								}
							},
							{
								type = "atlaslabel",
								pic = "res/ui/common/number/yxhd_time_digit.png",
								startCharMap = 47,
								y = 2,
								itemWidth = 35,
								x = 50,
								itemHeight = 34,
								text = var_4_0.rank,
								anchorPoint = ccp(0, 0.5)
							}
						}
					elseif conf.language == "ina" then
						return {
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
								x = -20,
								y = 2,
								type = "sprite",
								pic = {
									frame = true,
									path = "yxhd_tit_ming.png"
								}
							},
							{
								type = "atlaslabel",
								pic = "res/ui/common/number/yxhd_time_digit.png",
								startCharMap = 47,
								y = 2,
								itemWidth = 35,
								x = 40,
								itemHeight = 34,
								text = var_4_0.rank,
								anchorPoint = ccp(0, 0.5)
							}
						}
					elseif conf.language == "tha" then
						return {
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
								x = -20,
								scale = 0.8,
								type = "sprite",
								pic = {
									frame = true,
									path = "yxhd_tit_ming.png"
								}
							},
							{
								type = "atlaslabel",
								pic = "res/ui/common/number/yxhd_time_digit.png",
								startCharMap = 47,
								y = 2,
								itemWidth = 35,
								x = 40,
								itemHeight = 34,
								text = var_4_0.rank,
								anchorPoint = ccp(0, 0.5)
							}
						}
					else
						return {
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
								x = var_4_13
							},
							{
								y = 2,
								type = "sprite",
								pic = {
									frame = true,
									path = "yxhd_tit_ming.png"
								},
								x = var_4_15
							},
							{
								type = "atlaslabel",
								pic = "res/ui/common/number/yxhd_time_digit.png",
								startCharMap = 47,
								y = 2,
								itemWidth = 35,
								itemHeight = 34,
								text = var_4_0.rank,
								x = var_4_14,
								anchorPoint = ccp(0.5, 0.5)
							}
						}
					end
				end)()
			},
			{
				style = "label_warlock",
				fontSize = 22,
				type = "label",
				y = 50,
				x = 0,
				text = var_4_0.playerName,
				color = var_0_0
			},
			{
				type = "atlaslabel",
				pic = "res/ui/common/number/yxhd_time_digit.png",
				startCharMap = 47,
				y = 90,
				itemWidth = 35,
				itemHeight = 34,
				text = var_4_0.eatNum,
				x = var_4_5,
				anchorPoint = ccp(0.5, 0.5)
			},
			{
				y = 90,
				type = "sprite",
				pic = {
					frame = true,
					path = "dwhd_word_ge.png"
				},
				x = var_4_6
			}
		}
	}
end

function var_0_15.refresh(arg_6_0)
	local function var_6_0(arg_7_0)
		arg_6_0:showPanel(arg_7_0.action.data)
	end

	cmgr.sendRequest(var_6_0, actions.getLanternActivity)
end

function var_0_15.onBuyLantern(arg_8_0)
	local function var_8_0(arg_9_0)
		arg_8_0:refresh()
	end

	messageBox.confirm(language.get(135364, arg_8_0.info.gold), function()
		cmgr.sendRequest(var_8_0, actions.buyLantern)
	end)
end

function var_0_15.onEatLantern(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		local var_12_0 = tolua.cast(arg_11_0.bowl[arg_11_1].obj, "CCSprite")
		local var_12_1 = CCArray:create()
		local var_12_2 = CCFadeOut:create(0.1)
		local var_12_3 = CCMoveBy:create(0.1, ccp(0, -40))

		var_12_1:addObject(CCSpawn:createWithTwoActions(var_12_2, var_12_3))
		var_12_1:addObject(CCCallFuncN:create(function()
			var_12_0:removeFromParentAndCleanup(true)
			table.remove(arg_11_0.bowl, arg_11_1)
			arg_11_0:refresh()
		end))

		local var_12_4 = CCSequence:create(var_12_1)

		var_12_0:runAction(var_12_4)
	end

	cmgr.sendRequest(var_11_0, actions.eatLantern)
end

function var_0_15.onGetLanternReward(arg_14_0)
	local function var_14_0(arg_15_0)
		local var_15_0 = arg_15_0.action.data
		local var_15_1 = {}

		for iter_15_0 = 1, #var_15_0.rewards do
			local var_15_2 = {
				id = var_0_14[var_15_0.rewards[iter_15_0].type or var_15_0.rewards[iter_15_0].pic]
			}

			var_15_2.id = var_15_2.id or 3
			var_15_2.value = var_15_0.rewards[iter_15_0].value

			table.insert(var_15_1, var_15_2)
		end

		globalAction_gotResource(var_15_1)
		arg_14_0:refresh()
	end

	cmgr.sendRequest(var_14_0, actions.getLanternReward)
end

function var_0_15.onGetLanternBigGift(arg_16_0)
	local function var_16_0(arg_17_0)
		local var_17_0 = arg_17_0.action.data
		local var_17_1 = {}

		for iter_17_0 = 1, #var_17_0.rewards do
			local var_17_2 = {
				id = var_0_14[var_17_0.rewards[iter_17_0].type or var_17_0.rewards[iter_17_0].pic]
			}

			var_17_2.id = var_17_2.id or 3
			var_17_2.value = var_17_0.rewards[iter_17_0].value

			table.insert(var_17_1, var_17_2)
		end

		globalAction_gotResource(var_17_1)
		arg_16_0:refresh()
	end

	cmgr.sendRequest(var_16_0, actions.getLanternBigGift)
end

function var_0_15.showStreamEffect(arg_18_0, arg_18_1)
	local var_18_0 = CCSprite:create()

	arg_18_1:addChild(var_18_0, 0, 111)
	var_18_0:setPosition(ccp(90, 150))

	local var_18_1 = CCArray:create()

	for iter_18_0 = 1, 9 do
		local var_18_2 = CCSprite:createWithSpriteFrameName(string.format("yxhd_rq%02d.png", iter_18_0))

		var_18_1:addObject(var_18_2:displayFrame())
	end

	local var_18_3 = CCAnimation:createWithSpriteFrames(var_18_1, 0.1)
	local var_18_4 = CCAnimate:create(var_18_3)

	var_18_4:retain()
	var_18_0:runAction(CCRepeatForever:create(var_18_4))
end

function var_0_15.addLanternBowl(arg_19_0, arg_19_1)
	arg_19_0.bowl = {}

	if arg_19_0.bowlNode then
		arg_19_0.bowlNode:removeAllChildrenWithCleanup(true)
	else
		arg_19_0.bowlNode = CCNode:create()

		arg_19_0.view.widgets.panel:addChild(arg_19_0.bowlNode, var_0_6)
	end

	if arg_19_1 == 0 then
		return
	end

	local var_19_0 = {
		1,
		2,
		3
	}
	local var_19_1 = 0
	local var_19_2 = false

	if not arg_19_1 then
		arg_19_1 = math.random(1, 3)
		var_19_1 = arg_19_1 >= 2 and math.random(1, arg_19_1) or 0
		var_19_2 = true
	end

	local var_19_3 = {
		ccp(105, 65),
		ccp(140, 65),
		ccp(80, 50)
	}

	for iter_19_0 = 1, arg_19_1 do
		local var_19_4 = CCSprite:createWithSpriteFrameName("dwhd_zy.png")
		local var_19_5 = table.remove(var_19_0, math.random(1, #var_19_0))

		var_19_4:setPosition(ccp(var_19_5 * 300 - 150, 55))
		arg_19_0.bowlNode:addChild(var_19_4)

		for iter_19_1 = 1, 3 do
			local var_19_6 = CCSprite:createWithSpriteFrameName("dwhd_zz.png")

			var_19_6:setPosition(var_19_3[iter_19_1])
			var_19_4:addChild(var_19_6, 0, iter_19_1)
		end

		if iter_19_0 == var_19_1 then
			local var_19_7 = {
				num = 0,
				obj = var_19_4,
				pos = var_19_5,
				cd = var_0_11
			}

			table.insert(arg_19_0.bowl, var_19_7)
			arg_19_0:showStreamEffect(var_19_4)

			local var_19_8 = CCArray:create()

			var_19_8:addObject(CCDelayTime:create(1))
			var_19_8:addObject(CCCallFuncN:create(function()
				var_19_7.cd = var_19_7.cd - 1

				if var_19_7.cd == 0 then
					var_19_4:stopAllActions()
					var_19_4:removeChildByTag(111, true)
				end
			end))

			local var_19_9 = CCSequence:create(var_19_8)

			var_19_4:runAction(CCRepeatForever:create(var_19_9))
		else
			table.insert(arg_19_0.bowl, {
				num = 0,
				cd = 0,
				obj = var_19_4,
				pos = var_19_5
			})
		end

		if var_19_2 then
			var_19_4:setPosition(ccp(var_19_5 * 300 - 150, 15))
			var_19_4:setOpacity(0)

			local var_19_10 = CCArray:create()
			local var_19_11 = CCFadeIn:create(0.1)
			local var_19_12 = CCMoveBy:create(0.1, ccp(0, 40))

			var_19_10:addObject(CCSpawn:createWithTwoActions(var_19_11, var_19_12))

			local var_19_13 = CCSequence:create(var_19_10)

			var_19_4:runAction(var_19_13)
		end
	end

	local var_19_14 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	arg_19_0.bowlNode:addChild(var_19_14)
	var_19_14:registerScriptTouchHandler(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_21_1, arg_21_2)

			if arg_19_0.isHot or arg_19_0.info.currentNum == 0 or arg_19_0.info.state ~= 2 then
				return false
			else
				for iter_21_0 = 1, #arg_19_0.bowl do
					local var_21_0 = tolua.cast(arg_19_0.bowl[iter_21_0].obj, "CCSprite")

					if arg_19_0.bowl[iter_21_0].num < var_0_12 and tool.checkIfTouch(var_21_0, arg_21_1, arg_21_2) then
						arg_19_0:showEatEffect(iter_21_0)

						return true
					end
				end
			end

			return false
		elseif arg_21_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_21_1, arg_21_2)

			return true
		elseif arg_21_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_21_1, arg_21_2)

			return true
		end
	end, false, true)
	var_19_14:setTouchEnabled(true)
end

function var_0_15.showEatEffect(arg_22_0, arg_22_1)
	if arg_22_0.spoonNode then
		arg_22_0.spoonNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.spoonNode = CCNode:create()

		arg_22_0.view.widgets.panel:addChild(arg_22_0.spoonNode, var_0_6 + 10)
	end

	local var_22_0 = arg_22_0.bowl[arg_22_1]
	local var_22_1 = tolua.cast(var_22_0.obj, "CCSprite")

	log.info("touchBowl, idx:%d, pos:%d", arg_22_1, var_22_0.pos)

	if var_22_0.cd > 0 then
		log.info("HOT!!!")

		local var_22_2 = CCArray:create()

		var_22_2:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_22_2:addObject(CCMoveBy:create(0.1, ccp(-10, 0)))

		local var_22_3 = CCSequence:create(var_22_2)

		arg_22_0.view.widgets.playerPicM:runAction(CCRepeatForever:create(var_22_3))

		arg_22_0.isHot = true

		arg_22_0.view.widgets.tipMsg:setString(language.get(135365))
		arg_22_0.view.widgets.tipFrame:setVisible(true)

		local var_22_4 = CCArray:create()

		var_22_4:addObject(CCDelayTime:create(var_0_11))
		var_22_4:addObject(CCCallFuncN:create(function()
			arg_22_0.isHot = false

			arg_22_0.view.widgets.tipMsg:setString(language.get(135369))
			arg_22_0.view.widgets.playerPicM:stopAllActions()
			arg_22_0.view.widgets.playerPicM:setPositionX(458)
			var_22_1:stopAllActions()
			var_22_1:removeChildByTag(111, true)
		end))
		var_22_4:addObject(CCDelayTime:create(1))
		var_22_4:addObject(CCCallFuncN:create(function()
			arg_22_0.view.widgets.tipFrame:setVisible(false)
		end))

		local var_22_5 = CCSequence:create(var_22_4)

		arg_22_0.view.widgets.tipFrame:runAction(var_22_5)

		var_22_0.cd = var_0_11
	else
		var_22_0.num = var_22_0.num + 1

		local var_22_6 = tolua.cast(var_22_0.obj, "CCSprite"):getChildByTag(var_22_0.num)

		if var_22_6 then
			var_22_6:setVisible(false)
		end

		local var_22_7 = CCSprite:createWithSpriteFrameName("dwhd_hand.png")

		var_22_7:setPosition(ccp(var_22_0.pos * 300 - 30, 150))
		arg_22_0.spoonNode:addChild(var_22_7)

		local var_22_8 = CCArray:create()

		var_22_8:addObject(CCMoveBy:create(0.2, ccp(-90, -60)))
		var_22_8:addObject(CCCallFuncN:create(function()
			var_22_7:setDisplayFrame(tool.spriteFrameByName("dwhd_hand_c.png"))
		end))
		var_22_8:addObject(CCMoveBy:create(0.3, ccp(90, 60)))
		var_22_8:addObject(CCCallFuncN:create(function()
			var_22_7:removeFromParentAndCleanup(true)
		end))

		local var_22_9 = CCSequence:create(var_22_8)

		var_22_7:runAction(var_22_9)

		if var_22_0.num >= var_0_12 then
			arg_22_0:onEatLantern(arg_22_1)
		end
	end
end

local function var_0_17(arg_27_0)
	log.info("getEmpytBowlNode")

	local var_27_0 = CCSpriteBatchNode:create("res/ui/activity/lantern/lanternPic2.png")

	for iter_27_0 = 1, arg_27_0 do
		local var_27_1 = CCSprite:createWithSpriteFrameName("dwhd_zy.png")

		var_27_1:setPosition(ccp(0, (iter_27_0 - 1) * 30))
		var_27_0:addChild(var_27_1, 0, iter_27_0)
	end

	var_27_0:setScaleX(0.8)

	return var_27_0
end

function var_0_15.addEmptyBowl(arg_28_0)
	log.info("addEmptyBowl")

	if arg_28_0.emptyNode then
		arg_28_0.emptyNode:removeAllChildrenWithCleanup(true)
	else
		arg_28_0.emptyNode = CCNode:create()

		arg_28_0.view.widgets.panel:addChild(arg_28_0.emptyNode)
	end

	local var_28_0 = {
		ccp(565, 120),
		ccp(90, 170),
		ccp(825, 170)
	}

	for iter_28_0 = 1, #arg_28_0.info.generals do
		local var_28_1 = arg_28_0.info.generals[iter_28_0].eatNum
		local var_28_2 = math.ceil(var_28_1 / 5)
		local var_28_3 = var_0_17(var_28_2)

		var_28_3:setPosition(var_28_0[iter_28_0])
		var_28_3:setScale(0.583)
		arg_28_0.emptyNode:addChild(var_28_3)

		if var_28_1 > 0 then
			local var_28_4 = CCLabelAtlas:create("0", "res/ui/common/number/yxhd_time_digit.png", 35, 34, 47)

			var_28_4:setAnchorPoint(ccp(0.5, 0.5))
			var_28_4:setString(tostring(var_28_1))

			local var_28_5 = CCSprite:createWithSpriteFrameName("dwhd_word_ge.png")
			local var_28_6 = var_28_4:getContentSize().width
			local var_28_7 = var_28_5:getContentSize().width
			local var_28_8 = var_28_6 + var_28_7

			var_28_4:setPosition(ccp(var_28_0[iter_28_0].x - var_28_8 / 2 + var_28_6 / 2, var_28_0[iter_28_0].y - 20))
			var_28_5:setPosition(ccp(var_28_0[iter_28_0].x - var_28_8 / 2 + var_28_6 + var_28_7 / 2, var_28_0[iter_28_0].y - 20))
			arg_28_0.emptyNode:addChild(var_28_4)
			arg_28_0.emptyNode:addChild(var_28_5)
		end
	end
end

function var_0_15.setBtnBoxEnabled(arg_29_0, arg_29_1)
	arg_29_0.view.widgets.btn_box:setVisible(arg_29_1)
	arg_29_0.view.widgets.light_box:stopAllActions()
	arg_29_0.view.widgets.light_box:setVisible(arg_29_1)

	if arg_29_1 then
		local var_29_0 = CCArray:create()

		var_29_0:addObject(CCFadeIn:create(0.3))
		var_29_0:addObject(CCFadeOut:create(0.3))

		local var_29_1 = CCSequence:create(var_29_0)

		arg_29_0.view.widgets.light_box:runAction(CCRepeatForever:create(var_29_1))
		arg_29_0.view.widgets.light_box:setVisible(true)
	end

	local var_29_2 = "res/ui/rankInfo/DailyFeatView/" .. (arg_29_1 and "gxb_bx.png" or "gxb_bx_c.png")

	arg_29_0.view.widgets.pic_box:setDisplayFrame(CCSprite:create(var_29_2):displayFrame())
end

function var_0_15.showRoundResult(arg_30_0)
	if arg_30_0.resultNode then
		arg_30_0.resultNode:removeAllChildrenWithCleanup(true)
	else
		arg_30_0.resultNode = CCNode:create()

		arg_30_0.view.widgets.panel:addChild(arg_30_0.resultNode, var_0_8)
	end

	if arg_30_0.info.haveRankReward == 1 then
		if arg_30_0.info.haveRankReceived == 0 then
			arg_30_0:setBtnBoxEnabled(true)
			arg_30_0.view.widgets.btn_box:addHandleOfControlEvent(function()
				log.info("btn_box，领取本轮奖励")
				arg_30_0:onGetLanternReward()
			end, CCControlEventTouchUpInside)
		else
			arg_30_0:setBtnBoxEnabled(false)
		end

		arg_30_0.view.widgets.node_box:setScale(2.5)
		arg_30_0.view.widgets.node_box:setPosition(ccp(458, 320))
		arg_30_0.view.widgets.node_box:setVisible(true)
	end

	for iter_30_0 = 1, #arg_30_0.info.ranks do
		local var_30_0 = {}

		uiutil.initWidgets(var_30_0, var_0_16(arg_30_0.info.ranks, iter_30_0))
		arg_30_0.resultNode:addChild(var_30_0.widgets.node_rank)

		local var_30_1 = math.ceil(arg_30_0.info.ranks[iter_30_0].eatNum / 5)
		local var_30_2 = var_0_17(var_30_1)

		var_30_2:setPosition(ccp(0, 150))
		var_30_2:setScale(0.583)
		var_30_0.widgets.node_rank:addChild(var_30_2)
	end
end

function var_0_15.showFinalResult(arg_32_0)
	if arg_32_0.resultNode then
		arg_32_0.resultNode:removeAllChildrenWithCleanup(true)
	else
		arg_32_0.resultNode = CCNode:create()

		arg_32_0.view.widgets.panel:addChild(arg_32_0.resultNode, var_0_8)
	end

	if arg_32_0.info.title > 0 then
		if arg_32_0.info.haveTitleReceived == 0 then
			arg_32_0:setBtnBoxEnabled(true)
			arg_32_0.view.widgets.btn_box:addHandleOfControlEvent(function()
				log.info("btn_box，领取最终奖励")
				arg_32_0:onGetLanternBigGift()
			end, CCControlEventTouchUpInside)
		else
			arg_32_0:setBtnBoxEnabled(false)
		end

		arg_32_0.view.widgets.node_box:setScale(1)
		arg_32_0.view.widgets.node_box:setPosition(ccp(710, 150 + (arg_32_0.info.title - 1) * 70))
		arg_32_0.view.widgets.node_box:setVisible(true)
	end

	for iter_32_0 = 1, 5 do
		local var_32_0
		local var_32_1

		if iter_32_0 <= arg_32_0.info.title then
			var_32_0 = "yxhd_tit_bg.png"
			var_32_1 = string.format("%s.png", var_0_5[iter_32_0])
		else
			var_32_0 = "yxhd_tit_bg_g.png"
			var_32_1 = string.format("%s_g.png", var_0_5[iter_32_0])
		end

		local var_32_2 = CCSprite:createWithSpriteFrameName(var_32_0)

		var_32_2:setPosition(ccp(570, iter_32_0 * 70 + 80))
		arg_32_0.resultNode:addChild(var_32_2)

		local var_32_3 = CCSprite:createWithSpriteFrameName(var_32_1)

		var_32_3:setPosition(ccp(130, 36))
		var_32_2:addChild(var_32_3)
	end

	arg_32_0.view.widgets.finalEatNum_p2:setString(arg_32_0.info.eatNum)

	local var_32_4 = arg_32_0.view.widgets.finalEatNum_p1:getContentSize().width
	local var_32_5 = arg_32_0.view.widgets.finalEatNum_p2:getContentSize().width
	local var_32_6 = arg_32_0.view.widgets.finalEatNum_p3:getContentSize().width
	local var_32_7 = var_32_4 + var_32_5 + var_32_6

	arg_32_0.view.widgets.finalEatNum_p1:setPositionX(-var_32_7 / 2 + var_32_4 / 2)
	arg_32_0.view.widgets.finalEatNum_p2:setPositionX(-var_32_7 / 2 + var_32_4 + var_32_5 / 2)
	arg_32_0.view.widgets.finalEatNum_p3:setPositionX(-var_32_7 / 2 + var_32_4 + var_32_5 + var_32_6 / 2)
	arg_32_0.view.widgets.finalEatNum_bg:setPreferredSize(CCSizeMake(var_32_7 + 60, 64))
	arg_32_0.view.widgets.finalEatNum:setVisible(true)

	local var_32_8 = 4 * arg_32_0.info.title
	local var_32_9 = var_0_17(var_32_8)

	var_32_9:setPosition(ccp(330, 125))
	var_32_9:setScale(0.583)
	arg_32_0.resultNode:addChild(var_32_9)

	if arg_32_0.info.haveTitleReceived == 0 then
		for iter_32_1 = 1, var_32_8 do
			local var_32_10 = var_32_9:getChildByTag(iter_32_1)

			var_32_10:setOpacity(0)

			local var_32_11 = CCArray:create()

			var_32_11:addObject(CCDelayTime:create(0.15 * (iter_32_1 - 1)))
			var_32_11:addObject(CCFadeIn:create(0.05))

			local var_32_12 = CCSequence:create(var_32_11)

			var_32_10:runAction(var_32_12)
		end
	end
end

local function var_0_18(arg_34_0)
	local var_34_0 = arg_34_0.cd / 1000
	local var_34_1 = math.floor(var_34_0 / 3600)
	local var_34_2 = var_34_0 % 3600
	local var_34_3 = math.floor(var_34_2 / 60)
	local var_34_4 = var_34_2 % 60
	local var_34_5 = ""

	if var_34_1 == 0 then
		var_34_5 = string.format("%02d:%02d", var_34_3, var_34_4)
	else
		var_34_5 = string.format("%02d:%02d:%02d", var_34_1, var_34_3, var_34_4)
	end

	if arg_34_0.state == 2 then
		var_34_5 = string.sub(var_34_5, -5)
	elseif arg_34_0.state == 3 then
		var_34_5 = language.get(135368, arg_34_0.round + 1, var_34_5)
	end

	return var_34_5
end

function var_0_15.showPanel(arg_35_0, arg_35_1)
	if arg_35_1.state == 5 then
		local var_35_0 = CCArray:create()

		var_35_0:addObject(CCDelayTime:create(0.5))
		var_35_0:addObject(CCCallFuncN:create(function()
			arg_35_0:refresh()
		end))

		local var_35_1 = CCSequence:create(var_35_0)

		arg_35_0.view.widgets.playerPicM:runAction(var_35_1)

		return
	end

	arg_35_0.info = arg_35_1

	if arg_35_0.resultNode then
		arg_35_0.resultNode:removeAllChildrenWithCleanup(true)
	end

	if arg_35_0.emptyNode then
		arg_35_0.emptyNode:removeAllChildrenWithCleanup(true)
	end

	if arg_35_0.view.widgets.timer and not tolua.isnull(arg_35_0.view.widgets.timer) then
		arg_35_0.view.widgets.timer:removeFromParentAndCleanup(true)

		arg_35_0.view.widgets.timer = nil
	end

	arg_35_0.isHot = false

	arg_35_0.view.widgets.time_pic:setVisible(false)
	arg_35_0.view.widgets.node_noNum:setVisible(false)
	arg_35_0.view.widgets.maskLayer1:setVisible(false)
	arg_35_0.view.widgets.maskLayer2:setVisible(false)
	arg_35_0.view.widgets.node_buy1:setVisible(false)
	arg_35_0.view.widgets.btn_buy2_info:setString(language.get(135363, arg_35_1.currentNum, arg_35_1.totalNum))
	arg_35_0.view.widgets.node_buy2:setVisible(arg_35_1.state == 2 or arg_35_1.state == 3)
	arg_35_0.view.widgets.btn_tip:setVisible(false)
	arg_35_0.view.widgets.tipsNode:setVisible(false)
	arg_35_0.view.widgets.playerPicM:stopAllActions()
	arg_35_0.view.widgets.playerPicM:setPositionX(458)
	arg_35_0.view.widgets.node_box:setVisible(false)
	arg_35_0.view.widgets.finalEatNum:setVisible(false)
	arg_35_0.view.widgets.playerPicL:setVisible(false)
	arg_35_0.view.widgets.playerPicR:setVisible(false)
	arg_35_0.view.widgets.playerNameM:setVisible(false)
	arg_35_0.view.widgets.playerNameL:setVisible(false)
	arg_35_0.view.widgets.playerNameR:setVisible(false)
	arg_35_0.view.widgets.title1:setVisible(false)
	arg_35_0.view.widgets.title2:setVisible(false)

	if arg_35_1.state == 1 then
		arg_35_0.view.widgets.title1:setVisible(true)
		arg_35_0.view.widgets.maskLayer1:setVisible(true)

		if arg_35_1.cd > 0 then
			local var_35_2 = CCLabelAtlas:create("", "res/ui/common/number/yxhd_time_digit.png", 35, 34, 47)

			var_35_2:setAnchorPoint(ccp(0.5, 0.5))
			var_35_2:setString(var_0_18(arg_35_1))
			arg_35_0.view.widgets.panel:addChild(var_35_2, var_0_8)
			var_35_2:setPosition(ccp(458, 410))

			arg_35_0.view.widgets.timer = var_35_2
		end

		if arg_35_1.after930 == 1 then
			arg_35_0.view.widgets.btn_buy1_info_p2:setString(arg_35_1.currentNum .. "/" .. arg_35_1.totalNum)

			local var_35_3 = arg_35_0.view.widgets.btn_buy1_info_p1:getContentSize().width
			local var_35_4 = arg_35_0.view.widgets.btn_buy1_info_p2:getContentSize().width
			local var_35_5 = arg_35_0.view.widgets.btn_buy1_info_p3:getContentSize().width
			local var_35_6 = var_35_3 + var_35_4 + var_35_5

			arg_35_0.view.widgets.btn_buy1_info_p1:setPositionX(458 - var_35_6 / 2 + var_35_3 / 2)
			arg_35_0.view.widgets.btn_buy1_info_p2:setPositionX(458 - var_35_6 / 2 + var_35_3 + var_35_4 / 2)
			arg_35_0.view.widgets.btn_buy1_info_p3:setPositionX(458 - var_35_6 / 2 + var_35_3 + var_35_4 + var_35_5 / 2)
			arg_35_0.view.widgets.node_buy1:setVisible(true)
			arg_35_0.view.widgets.btn_buy1:setVisible(arg_35_1.currentNum ~= arg_35_1.totalNum)
		end

		arg_35_0.view.widgets.tipsNode:setVisible(true)
	elseif arg_35_1.state == 2 then
		arg_35_0.view.widgets.round:setDisplayFrame(tool.spriteFrameByName(string.format("yxhd_tit_digit%02d.png", arg_35_1.round)))
		arg_35_0.view.widgets.title2:setVisible(true)
		arg_35_0.view.widgets.time_pic:setVisible(true)

		if arg_35_1.cd > 0 then
			local var_35_7 = CCLabelAtlas:create("", "res/ui/common/number/yxhd_time_digit2.png", 35, 39, 48)

			var_35_7:setAnchorPoint(ccp(0.5, 0.5))
			var_35_7:setString(var_0_18(arg_35_1))
			arg_35_0.view.widgets.panel:addChild(var_35_7, var_0_8)
			var_35_7:setPosition(ccp(512, 445))

			arg_35_0.view.widgets.timer = var_35_7
		end

		if arg_35_1.currentNum == 0 then
			arg_35_0.view.widgets.maskLayer2:setVisible(true)
			arg_35_0.view.widgets.node_noNum:setVisible(true)
		end

		arg_35_0.view.widgets.btn_tip:setVisible(true)

		arg_35_1.generals = arg_35_1.generals or {
			{
				eatNum = 0
			}
		}

		if #arg_35_1.generals >= 2 then
			arg_35_0.view.widgets.playerPicL:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", arg_35_1.generals[2].pic)):displayFrame())
			arg_35_0.view.widgets.playerPicL:setVisible(true)
			arg_35_0.view.widgets.playerNameM:setString(arg_35_1.generals[1].playerName)
			arg_35_0.view.widgets.playerNameM:setVisible(true)
			arg_35_0.view.widgets.playerNameL:setString(arg_35_1.generals[2].playerName)
			arg_35_0.view.widgets.playerNameL:setVisible(true)

			if #arg_35_1.generals == 3 then
				arg_35_0.view.widgets.playerPicR:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", arg_35_1.generals[3].pic)):displayFrame())
				arg_35_0.view.widgets.playerPicR:setVisible(true)
				arg_35_0.view.widgets.playerNameR:setString(arg_35_1.generals[3].playerName)
				arg_35_0.view.widgets.playerNameR:setVisible(true)
			end
		end

		arg_35_0:addEmptyBowl()
	elseif arg_35_1.state == 3 then
		arg_35_0:showRoundResult()
		arg_35_0.view.widgets.round:setDisplayFrame(tool.spriteFrameByName(string.format("yxhd_tit_digit%02d.png", arg_35_1.round)))
		arg_35_0.view.widgets.title2:setVisible(true)
		arg_35_0.view.widgets.maskLayer1:setVisible(true)

		if arg_35_1.currentNum == 0 and arg_35_1.round < var_0_13 then
			arg_35_0.view.widgets.maskLayer2:setVisible(true)
			arg_35_0.view.widgets.node_noNum:setVisible(true)
		end

		if arg_35_1.cd > 0 then
			local var_35_8 = CCStrokeLabelTTF:create(language.get(490057), "Thonburi", 26)

			var_35_8:setColor(var_0_0)
			var_35_8:setString(var_0_18(arg_35_1))
			arg_35_0.view.widgets.panel:addChild(var_35_8, var_0_8)
			var_35_8:setPosition(ccp(458, 25))

			arg_35_0.view.widgets.timer = var_35_8

			if arg_35_1.round == var_0_13 then
				var_35_8:setVisible(false)
			end
		end

		arg_35_0.view.widgets.btn_tip:setVisible(true)
	elseif arg_35_1.state == 4 then
		arg_35_0:showFinalResult()
		arg_35_0.view.widgets.maskLayer1:setVisible(true)
	elseif arg_35_1.state == 5 then
		-- block empty
	end

	if arg_35_1.state == 2 then
		if not arg_35_0.bowl or not (#arg_35_0.bowl > 0) then
			arg_35_0:addLanternBowl()
		end
	elseif arg_35_1.state == 3 or arg_35_1.state == 4 then
		arg_35_0:addLanternBowl(3)
	else
		arg_35_0:addLanternBowl(0)
	end

	if arg_35_1.state == 1 or arg_35_1.state == 2 or arg_35_1.state == 3 then
		local var_35_9 = arg_35_0.view.widgets.timer

		if var_35_9 then
			local var_35_10 = CCArray:create()

			var_35_10:addObject(CCDelayTime:create(1))
			var_35_10:addObject(CCCallFuncN:create(function()
				arg_35_1.cd = arg_35_1.cd - 1000

				if arg_35_1.cd <= 0 or arg_35_1.state == 1 and arg_35_1.after930 == 0 and arg_35_1.cd <= 900000 then
					var_35_9:removeFromParentAndCleanup(true)

					arg_35_0.view.widgets.timer = nil

					arg_35_0:refresh()
				else
					var_35_9:setString(var_0_18(arg_35_1))
				end
			end))

			local var_35_11 = CCSequence:create(var_35_10)

			var_35_9:runAction(CCRepeatForever:create(var_35_11))
		end
	end
end

function var_0_15.ctor(arg_38_0, arg_38_1, arg_38_2)
	log.info("@@ 端午活动")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic.plist")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic2.plist")
	rmgr.loadResource("res/ui/activity/lantern/steam.plist")

	arg_38_0.view = {}

	uiutil.initWidgets(arg_38_0.view, arg_38_0.layout)

	arg_38_0.leftTime = arg_38_0.view.widgets.leftTime

	if arg_38_1 then
		arg_38_0:addChild(arg_38_0.view.widgets.panel)
		arg_38_1:addChild(arg_38_0)
	end

	math.randomseed(os.time())
	arg_38_0.view.widgets.playerPicM:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())
	arg_38_0.view.widgets.btn_box:setOpacity(0)
	arg_38_0:showStreamEffect(arg_38_0.view.widgets.hot_bowl)
	arg_38_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_38_0.view.widgets.tipsNode:setVisible(true)

		local var_39_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_39_0:registerScriptTouchHandler(function(arg_40_0, arg_40_1, arg_40_2)
			if arg_40_0 == CCTOUCHBEGAN then
				return true
			elseif arg_40_0 == CCTOUCHMOVED then
				return true
			elseif arg_40_0 == CCTOUCHENDED then
				pcall(var_39_0.removeFromParentAndCleanup, var_39_0, true)
				arg_38_0.view.widgets.tipsNode:setVisible(false)

				return true
			end
		end, false, true)
		var_39_0:setTouchEnabled(true)
		smgr.rootLayer:addChild(var_39_0, 60000)
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_buy1:addHandleOfControlEvent(function()
		log.info("btn_buy1")
		arg_38_0:onBuyLantern()
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_buy2:addHandleOfControlEvent(function()
		log.info("btn_buy2")
		arg_38_0:onBuyLantern()
	end, CCControlEventTouchUpInside)
	arg_38_0.view.widgets.btn_buy2_bg:setScaleX(-2)
	arg_38_0.view.widgets.btn_buy2_bg:setScaleY(1.4)
	arg_38_0:showPanel(arg_38_2)
end

return var_0_15
