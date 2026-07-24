local var_0_0 = require("res/native/offset").get("layer.rankInfo.dailyFeat")
local var_0_1 = {
	"caocao",
	"liubei",
	"sunquan"
}
local var_0_2 = {
	tieqifang = 1119,
	machang = 1107,
	gaolu = 1120,
	qianzhuang = 1106,
	junyingsi = 1024,
	junyinger = 1022,
	shimofang = 1115,
	ronglianlu = 1116,
	kuangdonger = 1032,
	shuilizhan = 1114,
	yulinchu = 1108,
	tiechengfu = 1121,
	linzhongyin = 1109
}
local var_0_3 = {
	exp = 6,
	iron = 4,
	farmReformDrawing = 30012,
	copper = 1
}
local var_0_4 = {
	1,
	2,
	3,
	4,
	nil,
	6,
	nil,
	nil,
	5,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	7,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	23,
	nil,
	25,
	26,
	27,
	28,
	[113] = 2003,
	[40] = 40,
	[81] = 24,
	[100] = 100,
	[116] = 55,
	[57] = 57,
	[102] = 41,
	[91] = 1701,
	[216] = 216
}
local var_0_5 = {
	[3] = {
		id = 3,
		txt = 10103,
		pic = "res/ui/task/get_icon_food.png"
	},
	[4] = {
		id = 4,
		txt = 10104,
		pic = "res/ui/task/get_icon_iron.png",
		pic1 = "box_iron.png"
	},
	[5] = {
		id = 6,
		txt = 10107,
		pic = "res/ui/task/get_icon_exp.png"
	},
	[21] = {
		id = 7,
		txt = 10106,
		pic = "res/ui/task/get_icon_gem.png"
	},
	[42] = {
		id = 5,
		txt = 10105,
		pic = "res/ui/task/get_icon_mubingling.png"
	},
	[51] = {
		id = 10035,
		scale = 0.5,
		frame = true,
		txt = 111042,
		pic = "dkj.jpg"
	},
	[101] = {
		id = 10003,
		txt = 111040,
		pic = "res/ui/world/nationChallenges/task_challenge_icon_12.png"
	},
	[113] = {
		id = 2003,
		txt = 111041,
		pic = "res/ui/equip/quenching/acti_icon_xidfs.png"
	},
	[116] = {
		pic = "res/ui/task/get_icon_silk.png",
		pic1 = "box_silk.png",
		id = 55,
		txt = 310020,
		scale = 0.8
	},
	[119] = {
		id = 10033,
		txt = 111044,
		pic = "res/ui/weapon/godWeapon/sbxt_icon_blg.png"
	},
	[126] = {
		pic = "res/ui/resource/silkroad/sczldj_jn.png",
		pic1 = "box_tips.png",
		id = 10030,
		txt = 111043,
		scale = 0.7
	},
	[136] = {
		id = 30012,
		txt = "223308_luomu",
		pic = "res/ui/resourceArea2/wood_gaizao/tuzhi.png",
		scale = 0.7
	},
	[143] = {
		id = 30012,
		txt = "223308_luomu",
		pic = "res/ui/resourceArea2/wood_gaizao/tuzhi.png",
		scale = 0.7
	},
	[216] = {
		id = 216,
		txt = 10111,
		pic = "res/ui/task/get_icon_yt.png",
		scale = 1
	},
	[246] = {
		id = 30012,
		txt = "223308_luomu",
		pic = "res/ui/resourceArea2/wood_gaizao/tuzhi.png",
		scale = 1
	}
}
local var_0_6 = {
	"gxb_jx5.png",
	"gxb_jx5.png",
	"gxb_jx4.png",
	"gxb_jx3.png",
	"gxb_jx2.png",
	"gxb_jx1.png"
}

local function var_0_7(arg_1_0)
	if arg_1_0 > 6 then
		arg_1_0 = 6
	end

	return var_0_6[arg_1_0]
end

local function var_0_8(arg_2_0)
	if arg_2_0 > 100000 then
		return language.get(111001, math.floor(arg_2_0 / 10000))
	else
		return tostring(arg_2_0)
	end
end

local var_0_9 = tool.hexToRgb("#D9EDC5")
local var_0_10 = ccc3(0, 180, 0)
local var_0_11 = colorQuality[5]
local var_0_12 = colorQuality[4]
local var_0_13 = colorQuality[2]
local var_0_14 = class("DailyFeat", function()
	return createBaseLayer()
end)

var_0_14.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			height = 523,
			name = "featBg",
			x = 25.5,
			type = "layerColor",
			y = 29,
			width = 909,
			color = ccc4(0, 0, 0, 0),
			children = {
				{
					y = 70,
					name = "bg_feat",
					type = "sprite",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_bg.jpg"
					}
				},
				{
					anchorPointX = 0,
					name = "rich_feat",
					y = 485,
					type = "richLine",
					gap = 3,
					x = 10,
					content = {
						{
							y = 485,
							name = "featTitlePic",
							type = "sprite",
							x = 10,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrgx.png"
							}
						},
						{
							name = "featValueAtlas",
							type = "atlaslabel",
							pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrgx_digit.png",
							startCharMap = 48,
							text = "0",
							y = 485,
							itemWidth = 32,
							x = 230,
							itemHeight = 45,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					w = 43,
					name = "upperRightButton1",
					h = 46,
					type = "button",
					y = 489,
					x = 593,
					normal = {
						frame = true,
						path = "DailyFeatView_kill_icon_normal.png"
					},
					touched = {
						frame = true,
						path = "DailyFeatView_kill_icon_pressed.png"
					}
				},
				{
					text = "x0",
					name = "killNumLabel",
					fontSize = 20,
					type = "label",
					y = 469,
					x = 593,
					color = var_0_9
				},
				{
					w = 55,
					name = "upperRightButton2",
					h = 44,
					type = "button",
					y = 489,
					x = 685,
					normal = {
						frame = true,
						path = "DailyFeatView_city_icon_normal.png"
					},
					touched = {
						frame = true,
						path = "DailyFeatView_city_icon_pressed.png"
					}
				},
				{
					text = "x0",
					name = "stormNumLabel",
					fontSize = 20,
					type = "label",
					y = 468,
					x = 685,
					color = var_0_9
				},
				{
					w = 45,
					name = "upperRightButton3",
					h = 44,
					type = "button",
					y = 489,
					x = 779,
					normal = {
						frame = true,
						path = "DailyFeatView_assist_icon_normal.png"
					},
					touched = {
						frame = true,
						path = "DailyFeatView_assist_icon_pressed.png"
					}
				},
				{
					text = "x0",
					name = "assitNumLabel",
					fontSize = 20,
					type = "label",
					y = 469,
					x = 779,
					color = var_0_9
				},
				{
					w = 47,
					name = "upperRightButton4",
					h = 42,
					type = "button",
					y = 489,
					x = 873,
					normal = {
						frame = true,
						path = "DailyFeatView_flag_icon_normal.png"
					},
					touched = {
						frame = true,
						path = "DailyFeatView_flag_icon_pressed.png"
					}
				},
				{
					text = "x0",
					name = "flagNumLabel",
					fontSize = 20,
					type = "label",
					y = 469,
					x = 873,
					color = var_0_9
				},
				{
					y = 373,
					name = "featIcon",
					type = "sprite",
					x = 50,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_jx5.png"
					}
				},
				{
					type = "node",
					name = "node_flag",
					y = 277,
					visible = false,
					x = 20,
					children = {
						{
							x = 8,
							y = 0,
							type = "sprite",
							scale = 0.8,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxbyh_shuaiqi_di2.png"
							}
						},
						{
							y = 0,
							x = 23,
							type = "sprite",
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxbyh_shuaiqi_di.png"
							}
						},
						{
							y = 8,
							x = 23,
							type = "sprite",
							pic = {
								path = "res/ui/battle/flag/gxb_shuaiqi1.png"
							}
						},
						{
							fontSize = 25,
							name = "flagNum",
							type = "label",
							y = 0,
							x = 50,
							anchorPoint = ccp(0, 0.5),
							color = var_0_9
						}
					}
				},
				{
					type = "node",
					name = "node_hammer",
					y = 277,
					visible = false,
					x = 150,
					children = {
						{
							x = 8,
							y = 0,
							type = "sprite",
							scale = 0.8,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxbyh_shuaiqi_di2.png"
							}
						},
						{
							y = 0,
							x = 23,
							type = "sprite",
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxbyh_shuaiqi_di.png"
							}
						},
						{
							y = 8,
							x = 23,
							type = "sprite",
							pic = {
								path = "res/ui/buildEvent/jzsj_gxb_jzc_icon2.png"
							}
						},
						{
							fontSize = 25,
							name = "hammerNum",
							type = "label",
							y = 0,
							x = 50,
							anchorPoint = ccp(0, 0.5),
							color = var_0_9
						}
					}
				},
				{
					type = "node",
					name = "node_box1",
					y = 205,
					visible = false,
					x = 480,
					children = {
						{
							name = "openBoxButton1",
							h = 230,
							type = "button",
							w = 226,
							y = 0,
							x = 0,
							normal = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_bx.png"
							},
							touched = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_bx_c.png"
							},
							disable = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_bx_g.png"
							}
						},
						{
							type = "sprite",
							name = "light1",
							y = 95,
							visible = false,
							x = -10,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_bxop_h.png"
							}
						},
						{
							anchorPointX = 0,
							name = "rich_boxNum1",
							y = -35,
							type = "richLine",
							gap = 0,
							x = 40,
							content = {
								{
									y = -35,
									name = "mark1",
									type = "sprite",
									x = 40,
									pic = {
										path = "res/ui/rankInfo/DailyFeatView/gxb_bigbx_tit.png"
									}
								},
								{
									name = "boxNumLabel1",
									type = "atlaslabel",
									pic = "res/ui/rankInfo/DailyFeatView/gxb_bigbx_tit_digit.png",
									startCharMap = 48,
									text = "0",
									y = -35,
									itemWidth = 46,
									x = 80,
									itemHeight = 50,
									anchorPoint = ccp(0, 0.5)
								},
								{
									y = -35,
									name = "boxMax1",
									type = "sprite",
									x = 60,
									pic = {
										path = "res/ui/rankInfo/DailyFeatView/gxb_bigbx_tit_man.png"
									}
								}
							}
						}
					}
				},
				{
					fontSize = 22,
					name = "info_reset",
					y = 435,
					type = "label",
					x = 10,
					color = var_0_9,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 0,
					name = "npcBg",
					h = 438,
					type = "button",
					w = 909,
					zorder = 100,
					visible = false,
					x = 0,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					anchorPoint = ccp(0, 0),
					children = {
						{
							y = 0,
							type = "sprite",
							x = 0,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/activity/consumeGift/xfshl_bg.png"
							},
							children = {
								{
									fontSize = 22,
									name = "npcMsg",
									x = 280,
									type = "label",
									height = 0,
									y = 170,
									width = 540,
									color = var_0_9,
									anchorPoint = ccp(0, 1),
									halign = kCCTextAlignmentLeft
								},
								{
									name = "getRewardButton",
									h = 58,
									type = "button",
									w = 140,
									y = 70,
									x = 550,
									normal = {
										frame = true,
										path = "btn3_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn3_gre_c.png"
									},
									children = {
										{
											fontSize = 22,
											name = "btnLb",
											y = 29,
											type = "label",
											x = 70,
											textId = 111020,
											color = var_0_9
										}
									}
								},
								{
									type = "node",
									name = "node_drink",
									y = 110,
									visible = false,
									x = 550,
									children = {
										{
											y = 0,
											name = "light_drink",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_icon_d_h.png"
											}
										},
										{
											w = 108,
											name = "drinkButton",
											h = 108,
											type = "button",
											y = 0,
											x = 0,
											normal = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_icon_d.png"
											},
											touched = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_icon_d_h.png"
											}
										},
										{
											y = 0,
											name = "icon_drink",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_box_purple.jpg"
											}
										},
										{
											fontSize = 22,
											name = "num_drink",
											y = -35,
											type = "label",
											x = 35,
											style = "label_warlock",
											anchorPoint = ccp(1, 0),
											color = var_0_9
										}
									}
								},
								{
									y = 0,
									name = "npcPic",
									type = "sprite",
									x = 0,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/common/halfPic/halfPic_caocao.png"
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
var_0_14.layout_node_rank1 = {
	y = 0,
	name = "node_rank1",
	type = "node",
	x = 0,
	children = {
		{
			type = "sprite",
			name = "lastRankTitlePic",
			y = 220,
			visible = false,
			x = 10,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_word_zrpm.png"
			}
		},
		{
			y = 220,
			name = "lastRankAtlas",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm_digit.png",
			startCharMap = 48,
			text = "0",
			visible = false,
			itemWidth = 24,
			x = 190,
			itemHeight = 36,
			anchorPoint = ccp(0, 0.5)
		},
		{
			type = "sprite",
			name = "todayRankTitlePic1",
			y = 220,
			visible = false,
			x = 10,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm.png"
			}
		},
		{
			y = 220,
			name = "todayRankAtlas1",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm_digit.png",
			startCharMap = 48,
			text = "0",
			visible = false,
			itemWidth = 24,
			x = 190,
			itemHeight = 36,
			anchorPoint = ccp(0, 0.5)
		},
		{
			type = "sprite",
			name = "noRankTitlePic1",
			y = 220,
			visible = false,
			x = 190,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_wsb.png"
			}
		},
		{
			type = "sprite",
			name = "info_noRank",
			y = 140,
			visible = false,
			x = 454,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_word_01.png"
			}
		},
		{
			type = "node",
			name = "node_reward",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 140,
					type = "sprite",
					x = 300,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_icon_di.png"
					},
					children = {
						{
							y = 45,
							name = "firstRewardIcon",
							type = "sprite",
							x = 42,
							pic = {
								frame = true,
								path = "ying.jpg"
							}
						},
						{
							y = 20,
							x = 42,
							type = "sprite",
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_icon_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "copperNum",
							y = 20,
							type = "label",
							x = 42
						}
					}
				},
				{
					y = 140,
					type = "sprite",
					x = 450,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_icon_di.png"
					},
					children = {
						{
							y = 45,
							x = 42,
							type = "sprite",
							pic = {
								path = "res/ui/resource/silkroad/exp.jpg"
							}
						},
						{
							y = 20,
							x = 42,
							type = "sprite",
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_icon_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "expNum",
							y = 20,
							type = "label",
							x = 42
						}
					}
				},
				{
					y = 140,
					type = "sprite",
					x = 600,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_icon_di.png"
					},
					children = {
						{
							y = 45,
							x = 42,
							type = "sprite",
							pic = {
								path = "res/ui/common/ItemsPic/kuang.jpg"
							}
						},
						{
							y = 20,
							x = 42,
							type = "sprite",
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_icon_number_di.png"
							}
						},
						{
							fontSize = 20,
							name = "ironNum",
							y = 20,
							type = "label",
							x = 42
						}
					}
				}
			}
		},
		{
			y = 125,
			name = "btn_reward",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 800,
			normal = {
				path = "res/ui/common/button/public_btn_orange.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_orange_c.png"
			},
			children = {
				{
					fontSize = 25,
					name = "lbl_btnReward",
					y = 34,
					type = "label",
					x = 92
				},
				{
					type = "node",
					name = "node_gold",
					y = -5,
					visible = false,
					x = 0,
					children = {
						{
							y = 0,
							x = 60,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							type = "sprite",
							name = "icon_charge",
							y = 3,
							visible = false,
							x = 60,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/word_chong.png"
							}
						},
						{
							fontSize = 22,
							name = "gold",
							y = 3,
							type = "label",
							x = 100,
							color = var_0_12,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			y = 190,
			name = "btn_giveUp",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 800,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					fontSize = 25,
					y = 34,
					type = "label",
					x = 92,
					textId = 111047
				}
			}
		}
	}
}
var_0_14.layout_node_rank2 = {
	y = 0,
	name = "node_rank2",
	type = "node",
	x = 0,
	children = {
		{
			type = "sprite",
			name = "lastRankTitlePic",
			y = 220,
			visible = false,
			x = 590,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_word_zrpm.png"
			}
		},
		{
			y = 220,
			name = "lastRankAtlas",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm_digit.png",
			startCharMap = 48,
			text = "0",
			visible = false,
			itemWidth = 24,
			x = 770,
			itemHeight = 36,
			anchorPoint = ccp(0, 0.5)
		},
		{
			type = "sprite",
			name = "todayRankTitlePic1",
			y = 220,
			visible = false,
			x = 540,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm.png"
			}
		},
		{
			y = 220,
			name = "todayRankAtlas1",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm_digit.png",
			startCharMap = 48,
			text = "0",
			visible = false,
			itemWidth = 24,
			x = 770,
			itemHeight = 36,
			anchorPoint = ccp(0, 0.5)
		},
		{
			type = "sprite",
			name = "noRankTitlePic1",
			y = 220,
			visible = false,
			x = 770,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_wsb.png"
			}
		},
		{
			y = 170,
			x = 660,
			type = "sprite",
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_word_di_y.png"
			}
		},
		{
			fontSize = 24,
			name = "info_noRank",
			type = "label",
			visible = false,
			y = 170,
			x = 680,
			text = language.get(226303)
		},
		{
			type = "node",
			name = "node_reward",
			y = 30,
			visible = false,
			x = 200,
			children = {
				{
					y = 140,
					name = "firstRewardIcon",
					type = "sprite",
					x = 290,
					pic = {
						frame = true,
						path = "res_icon_1.png"
					},
					children = {
						{
							fontSize = 20,
							name = "copperNum",
							type = "label",
							y = 24,
							x = 55,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 140,
					type = "sprite",
					x = 440,
					pic = {
						frame = true,
						path = "res_icon_6.png"
					},
					children = {
						{
							fontSize = 20,
							name = "expNum",
							type = "label",
							y = 24,
							x = 55,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 140,
					type = "sprite",
					x = 590,
					pic = {
						frame = true,
						path = "res_icon_4.png"
					},
					children = {
						{
							fontSize = 20,
							name = "ironNum",
							type = "label",
							y = 24,
							x = 55,
							halign = kCCTextAlignmentLeft,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			y = 105,
			name = "btn_reward",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 800,
			normal = {
				path = "res/ui/common/button/public_btn_orange.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_orange_c.png"
			},
			children = {
				{
					fontSize = 25,
					name = "lbl_btnReward",
					y = 34,
					type = "label",
					x = 92
				},
				{
					type = "node",
					name = "node_gold",
					y = -5,
					visible = false,
					x = 0,
					children = {
						{
							y = 0,
							x = 60,
							type = "sprite",
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							type = "sprite",
							name = "icon_charge",
							y = 3,
							visible = false,
							x = 60,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/word_chong.png"
							}
						},
						{
							fontSize = 22,
							name = "gold",
							y = 3,
							type = "label",
							x = 100,
							color = var_0_12,
							anchorPoint = ccp(0, 0.5)
						}
					}
				}
			}
		},
		{
			y = 105,
			name = "btn_giveUp",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 590,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			children = {
				{
					fontSize = 25,
					y = 34,
					type = "label",
					x = 92,
					textId = 111047
				}
			}
		},
		{
			y = 219,
			name = "taskTitle",
			type = "sprite",
			x = 215,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_word_ptjw.png"
			}
		},
		{
			y = 170,
			x = 215,
			type = "sprite",
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_word_di_r.png"
			}
		},
		{
			fontSize = 24,
			name = "taskInfoLb",
			y = 170,
			type = "label",
			w = 440,
			text = "",
			x = 220
		},
		{
			fontSize = 24,
			name = "taskProLb",
			y = 217,
			type = "label",
			text = "",
			x = 330
		},
		{
			y = 162,
			x = 450,
			type = "sprite",
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_line.png"
			}
		},
		{
			y = 105,
			name = "jungongBeginButton",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 220,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					fontSize = 26,
					h = 62,
					type = "label",
					w = 195,
					font = "Thonburi",
					y = 34,
					x = 97.5,
					text = language.get(226305),
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			y = 105,
			name = "jungongCancelButton",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 120,
			normal = {
				path = "res/ui/common/button/public_btn_red.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_red_c.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					fontSize = 26,
					h = 62,
					type = "label",
					w = 195,
					font = "Thonburi",
					y = 34,
					x = 97.5,
					text = language.get(226300),
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			y = 105,
			name = "jungongQuickFinishButton",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 320,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					fontSize = 26,
					h = 62,
					type = "label",
					w = 195,
					font = "Thonburi",
					y = 34,
					x = 97.5,
					text = language.get(226302),
					align = kCCTextAlignmentLeft
				},
				{
					y = 0,
					x = 78,
					type = "sprite",
					pic = {
						frame = true,
						path = "icon_gold.png"
					}
				},
				{
					fontSize = 26,
					name = "quickGoldLb",
					h = 50,
					type = "label",
					w = 100,
					text = "",
					font = "Thonburi",
					y = 0,
					x = 116,
					align = kCCTextAlignmentLeft
				}
			}
		},
		{
			y = 105,
			name = "jungongRewardButton",
			h = 62,
			type = "button",
			w = 195,
			visible = false,
			x = 220,
			normal = {
				path = "res/ui/common/button/public_btn_green.png"
			},
			touched = {
				path = "res/ui/common/button/public_btn_green_c.png"
			},
			anchorPoint = ccp(0.5, 0.5),
			children = {
				{
					fontSize = 26,
					h = 62,
					type = "label",
					w = 195,
					font = "Thonburi",
					y = 34,
					x = 97.5,
					text = language.get(226306),
					align = kCCTextAlignmentLeft
				}
			}
		}
	}
}

local function var_0_15()
	local var_4_0

	if user.player.jungong then
		var_4_0 = user.player.jungong.rewardList
	end

	if not var_4_0 then
		return
	end

	local var_4_1 = {}
	local var_4_2 = {}

	var_4_2[1] = "silver"
	var_4_2[2] = "wood"
	var_4_2[3] = "food"
	var_4_2[4] = "iron"
	var_4_2[5] = "exp"
	var_4_2[6] = "exp"
	var_4_2[40] = "huangjinchui"
	var_4_2[42] = "mubingling"
	var_4_2[112] = "gongxun"
	var_4_2[149] = "suipian"
	var_4_2[215] = "doubleling"
	var_4_2[999] = "jinglandao"

	local function var_4_3(arg_5_0, arg_5_1)
		basicIcon = {
			y = 0,
			x = 0,
			scale = 0.8,
			type = "sprite",
			pic = {
				path = "res/ui/task/get_icon_" .. var_4_2[arg_5_0] .. ".png"
			},
			children = {
				{
					fontSize = 26,
					font = "Thonburi",
					type = "label",
					y = 20,
					x = 77,
					text = arg_5_1,
					color = ccc3(255, 255, 207)
				}
			}
		}

		return basicIcon
	end

	local var_4_4 = 1

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		local var_4_5 = var_4_3(iter_4_1.type, iter_4_1.num)

		var_4_5.x = var_4_5.x + 85 * (var_4_4 - 1)
		var_4_1[#var_4_1 + 1] = var_4_5
		var_4_4 = var_4_4 + 1
	end

	return var_4_1
end

function var_0_14.layout_jwReward()
	return {
		y = 217,
		name = "jwRewardNode",
		type = "node",
		x = 374,
		children = var_0_15()
	}
end

var_0_14.layout_node_progress1 = {
	y = 0,
	name = "node_progress",
	type = "node",
	x = 0,
	children = {
		{
			y = 80,
			name = "bg_bar1",
			type = "sprite",
			x = 400,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bg.png"
			},
			children = {
				{
					y = 0,
					name = "bar1",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb.png"
					}
				}
			}
		}
	}
}
var_0_14.layout_node_progress2 = {
	y = 0,
	name = "node_progress",
	type = "node",
	x = 0,
	children = {
		{
			y = 80,
			name = "bg_bar1",
			type = "sprite",
			x = 400,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_pb1_bg.png"
			},
			children = {
				{
					y = 0,
					name = "bar1",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb2.png"
					}
				}
			}
		},
		{
			y = 80,
			name = "bg_bar2",
			type = "sprite",
			x = 1250,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bg.png"
			},
			children = {
				{
					y = 0,
					name = "bar2",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxb_pb1.png"
					}
				}
			}
		},
		{
			y = 80,
			name = "bg_bar3",
			type = "sprite",
			x = 2050,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxbyh_pb_bg.png"
			},
			children = {
				{
					y = 0,
					name = "bar3",
					type = "progressbar",
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxbyh_pb.png"
					}
				},
				{
					w = 160,
					name = "btn_box31",
					h = 160,
					type = "button",
					y = 40,
					x = 710,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					}
				},
				{
					x = 710,
					name = "progressBoxPic31",
					y = 40,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxbyh_box_01.png"
					}
				},
				{
					type = "sprite",
					name = "bg_hammer31",
					y = 30,
					visible = false,
					x = 650,
					pic = {
						path = "res/ui/rankInfo/DailyFeatView/gxbyh_shuaiqi_di.png"
					},
					children = {
						{
							y = 30,
							name = "icon_hammer31",
							type = "sprite",
							x = 25,
							pic = {
								path = "res/ui/buildEvent/jzsj_gxb_jzc_icon2.png"
							}
						}
					}
				}
			}
		}
	}
}

local function var_0_16(arg_7_0, arg_7_1)
	if arg_7_0 >= 3 then
		arg_7_0 = 3

		return {
			y = 0,
			type = "node",
			x = 0,
			name = "node_num" .. arg_7_0 .. arg_7_1,
			children = {
				{
					fontSize = 20,
					y = -10,
					type = "label",
					x = -20,
					color = var_0_9,
					name = "progressLabel" .. arg_7_0 .. arg_7_1,
					anchorPoint = ccp(0, 0.5)
				}
			}
		}
	end

	return {
		y = 0,
		type = "node",
		x = 0,
		name = "node_num" .. arg_7_0 .. arg_7_1,
		children = {
			{
				fontSize = 20,
				y = -10,
				type = "label",
				x = 15,
				color = var_0_9,
				name = "progressLabel" .. arg_7_0 .. arg_7_1,
				anchorPoint = ccp(1, 0.5)
			},
			{
				w = 100,
				h = 100,
				type = "button",
				y = 70,
				x = -30,
				name = "btn_box" .. arg_7_0 .. arg_7_1,
				normal = {
					path = "res/default.png"
				},
				touched = {
					path = "res/default.png"
				}
			},
			{
				x = -30,
				y = 70,
				type = "sprite",
				scale = 0.8,
				name = "progressBoxPic" .. arg_7_0 .. arg_7_1,
				pic = {
					path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bx1.png"
				},
				children = {
					{
						y = 30,
						type = "sprite",
						x = 70,
						name = "icon_multi" .. arg_7_0 .. arg_7_1,
						pic = {
							path = "res/ui/rankInfo/DailyFeatView/icon_numb_multi_gray.png"
						}
					},
					{
						y = 32,
						type = "atlaslabel",
						pic = "res/ui/common/number/up_numb_gray.png",
						startCharMap = 48,
						text = "0",
						visible = false,
						itemWidth = 16,
						x = 75,
						itemHeight = 21,
						name = "boxAtlasGray" .. arg_7_0 .. arg_7_1,
						anchorPoint = ccp(0, 0.5)
					},
					{
						y = 32,
						type = "atlaslabel",
						pic = "res/ui/common/number/up_numb.png",
						startCharMap = 48,
						text = "0",
						visible = false,
						itemWidth = 16,
						x = 75,
						itemHeight = 21,
						name = "boxAtlas" .. arg_7_0 .. arg_7_1,
						anchorPoint = ccp(0, 0.5)
					},
					{
						type = "sprite",
						x = 45,
						visible = false,
						y = 55,
						scale = 0.7,
						name = "icon_hammer" .. arg_7_0 .. arg_7_1,
						pic = {
							path = "res/ui/buildEvent/jzsj_gxb_jzc_icon2.png"
						}
					}
				}
			},
			{
				type = "sprite",
				x = -4,
				visible = false,
				y = 28,
				scale = 0.8,
				name = "icon_drink" .. arg_7_0 .. arg_7_1,
				pic = {
					path = "res/ui/rankInfo/DailyFeatView/gxb_jh_gray.png"
				}
			},
			{
				fontSize = 22,
				style = "label_warlock",
				type = "label",
				x = -4,
				scale = 0.8,
				y = 13,
				color = var_0_9,
				name = "num_flag" .. arg_7_0 .. arg_7_1
			},
			{
				type = "sprite",
				x = 0,
				visible = false,
				y = 50,
				scale = 0.8,
				name = "box_double" .. arg_7_0 .. arg_7_1,
				pic = {
					path = "res/ui/rankInfo/DailyFeatView/gxb_word_shuangbei.png"
				}
			}
		}
	}
end

var_0_14.layout_bg_rank = {
	y = 0,
	name = "bg_rank",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.jpg"
	},
	children = {
		{
			w = 67,
			name = "btn_show",
			h = 46,
			type = "button",
			y = 408,
			x = 872,
			normal = {
				path = "res/ui/common/button/gxb_btn.png"
			},
			touched = {
				path = "res/ui/common/button/gxb_btn_c.png"
			}
		},
		{
			type = "sprite",
			name = "todayRankTitlePic",
			y = 408,
			visible = false,
			x = 10,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm.png"
			}
		},
		{
			y = 408,
			name = "todayRankAtlas",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_tit_jrpm_digit.png",
			startCharMap = 48,
			text = "0",
			visible = false,
			itemWidth = 24,
			x = 180,
			itemHeight = 36,
			anchorPoint = ccp(0, 0.5)
		},
		{
			type = "sprite",
			name = "noRankTitlePic",
			y = 408,
			visible = false,
			x = 180,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_wsb.png"
			}
		},
		{
			fontSize = 22,
			y = 408,
			type = "label",
			x = 789,
			textId = 111017,
			color = var_0_9,
			anchorPoint = ccp(1, 0.5)
		}
	}
}
var_0_14.layout_card = {
	y = 0,
	name = "card",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/rankInfo/DailyFeatView/gxb_ph_bg.png"
	},
	children = {
		{
			y = 57,
			name = "icon",
			type = "sprite",
			x = 59,
			pic = {
				path = "res/ui/common/playerHead/playerHead_icon_0.png"
			}
		},
		{
			x = 145,
			name = "icon_feat",
			y = 80,
			type = "sprite",
			scale = 0.4,
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_jx5.png"
			}
		},
		{
			name = "rank",
			type = "atlaslabel",
			pic = "res/ui/rankInfo/DailyFeatView/gxb_ranking.png",
			startCharMap = 48,
			text = "0",
			y = 80,
			itemWidth = 26,
			x = 417,
			itemHeight = 32,
			anchorPoint = ccp(1, 0.5)
		},
		{
			fontSize = 24,
			name = "feat",
			y = 80,
			type = "label",
			x = 170,
			color = var_0_9,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 24,
			name = "name",
			y = 30,
			type = "label",
			x = 130,
			color = var_0_9,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 24,
			name = "lv",
			y = 30,
			type = "label",
			x = 417,
			color = var_0_9,
			anchorPoint = ccp(1, 0.5)
		}
	}
}
var_0_14.tipFrame = {
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
			height = 0,
			name = "tipMsg",
			type = "label",
			style = "label_warlock",
			width = 300,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_9
		}
	}
}

function var_0_14.refresh(arg_8_0)
	local function var_8_0(arg_9_0)
		arg_8_0:showPanel(arg_9_0.action.data)
	end

	cmgr.sendRequest(var_8_0, actions.featGetRankInfo)
end

function var_0_14.onGetPlayerRank(arg_10_0)
	local function var_10_0(arg_11_0)
		arg_10_0.ranks = arg_11_0.action.data.ranks

		arg_10_0:createRankList()
	end

	cmgr.sendRequest(var_10_0, actions.featGetPlayerRank)
end

function var_0_14.onGetBoxReward(arg_12_0, arg_12_1)
	arg_12_0:showOpenBoxEffect(arg_12_1)

	local function var_12_0(arg_13_0)
		arg_12_0:showFlyText(arg_13_0.action.data, arg_12_1)

		local var_13_0 = arg_12_1 == 1 and "featBoxNum" or "advancedBoxNum"
		local var_13_1 = arg_12_1 == 1 and "maxFeatBoxNum" or "maxAdvancedBoxNum"

		arg_12_0.info[var_13_0] = arg_12_0.info[var_13_0] - 5

		if arg_12_0.info[var_13_0] <= 0 then
			arg_12_0.info[var_13_0] = 0

			arg_12_0.view.widgets["openBoxButton" .. arg_12_1]:setEnabled(false)
		end

		arg_12_0.view.widgets["boxNumLabel" .. arg_12_1]:setString(arg_12_0.info[var_13_0])
		arg_12_0.view.widgets["boxMax" .. arg_12_1]:setVisible(arg_12_0.info[var_13_0] >= arg_12_0.info[var_13_1])
		arg_12_0.view.widgets["rich_boxNum" .. arg_12_1]:reorder()
	end

	cmgr.sendRequest(var_12_0, actions.featGetBoxReward, arg_12_1, 5)
end

function var_0_14.onGetRankReward(arg_14_0)
	local function var_14_0(arg_15_0)
		arg_14_0:showFlyText(arg_15_0.action.data)
		arg_14_0:refresh()
	end

	local function var_14_1()
		cmgr.sendRequest(var_14_0, actions.featGetRankReward, arg_14_0.info.button)
	end

	local var_14_2

	if arg_14_0.info.button == 2 then
		var_14_2 = arg_14_0.info.goldDouble
	elseif arg_14_0.info.button == 3 then
		var_14_2 = arg_14_0.info.goldTriple
	end

	if var_14_2 ~= nil then
		messageBox.showChargeWin("", language.get(111072, var_14_2), "featRankRewardCost", var_14_1)
	else
		var_14_1()
	end
end

function var_0_14.onGiveUpRankReward(arg_17_0)
	local function var_17_0(arg_18_0)
		arg_17_0:refresh()
	end

	local var_17_1

	if arg_17_0.info.button == 2 or arg_17_0.info.button == 3 then
		var_17_1 = -1 * arg_17_0.info.button
	end

	if var_17_1 ~= nil then
		cmgr.sendRequest(var_17_0, actions.featGetRankReward, var_17_1)
	end
end

function var_0_14.onGetDrinkReward(arg_19_0)
	local function var_19_0(arg_20_0)
		arg_19_0.drinkReward = arg_20_0.action.data
		arg_19_0.touchCount = 1

		arg_19_0.view.widgets.npcBg:setVisible(true)
	end

	cmgr.sendRequest(var_19_0, actions.featGetDrinkReward)
end

function var_0_14.onGetChosenReward(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local function var_21_0(arg_22_0)
		local var_22_0 = arg_22_0.action.data
		local var_22_1 = {}
		local var_22_2 = {
			id = var_0_5[var_22_0.type].id,
			value = var_22_0.num
		}

		table.insert(var_22_1, var_22_2)

		if var_22_0.niceWineNum and var_22_0.niceWineNum > 0 then
			local var_22_3 = {}

			var_22_3.id = 57
			var_22_3.value = var_22_0.niceWineNum

			table.insert(var_22_1, var_22_3)
		end

		if var_22_0.cashNum and var_22_0.cashNum > 0 then
			local var_22_4 = {}

			var_22_4.id = 10048
			var_22_4.value = var_22_0.cashNum

			table.insert(var_22_1, var_22_4)
		end

		if var_22_0.freeEmployTimes and var_22_0.freeEmployTimes > 0 then
			local var_22_5 = {}

			var_22_5.id = 20012
			var_22_5.value = var_22_0.freeEmployTimes

			table.insert(var_22_1, var_22_5)
		end

		if var_22_0.warlordIvtNum and var_22_0.warlordIvtNum > 0 then
			local var_22_6 = {}

			var_22_6.id = 10061
			var_22_6.value = var_22_0.warlordIvtNum

			table.insert(var_22_1, var_22_6)
		end

		globalAction_gotResource(var_22_1)
		arg_21_0.view.widgets.npcBg1:removeFromParentAndCleanup(true)
		arg_21_0:refresh()
	end

	if arg_21_3 and arg_21_3 > 0 then
		messageBox.showChargeWin("", language.get(111076, arg_21_3), "featGold", function()
			cmgr.sendRequest(var_21_0, actions.featGetChosenReward, arg_21_1, arg_21_2)
		end)
	else
		cmgr.sendRequest(var_21_0, actions.featGetChosenReward, arg_21_1, arg_21_2)
	end
end

function var_0_14.showFlyText(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = {}

	if arg_24_1.copper or arg_24_1.farmReformDrawing then
		local var_24_1 = 1

		for iter_24_0, iter_24_1 in pairs(arg_24_1) do
			if iter_24_0 ~= "received" and iter_24_0 ~= "button" and iter_24_1 ~= 0 then
				var_24_0[var_24_1] = {}

				if var_0_3[iter_24_0] then
					var_24_0[var_24_1].id = var_0_3[iter_24_0] or 0
				else
					log.error("rank reward didn't recognized")

					var_24_0[var_24_1].id = var_0_3.coppper
				end

				var_24_0[var_24_1].value = iter_24_1
				var_24_1 = var_24_1 + 1
			end
		end
	elseif arg_24_1.type then
		local var_24_2

		if arg_24_1.type == 7 then
			if arg_24_1.pic then
				if var_0_2[arg_24_1.pic] then
					var_24_2 = var_0_2[arg_24_1.pic]
				else
					log.error("box reward didn't recognized", arg_24_1.type, arg_24_1.pic)

					var_24_2 = 5
				end
			end
		elseif var_0_4[arg_24_1.type] then
			var_24_2 = var_0_4[arg_24_1.type]
		else
			log.error("box reward didn't recognized", arg_24_1.type)
			log.info("box reward didn't recognized", arg_24_1.type)

			var_24_2 = 5
		end

		if arg_24_1.type > 1000 and arg_24_1.type < 1130 then
			eventManager.dispatchEvent("resourceAreaDidGetPic")
		end

		var_24_0[1] = {}
		var_24_0[1].id = var_24_2
		var_24_0[1].value = arg_24_1.num

		if arg_24_1.beaf then
			var_24_0[2] = {}
			var_24_0[2].id = 57
			var_24_0[2].value = arg_24_1.beaf
		end

		if arg_24_1.baoji and arg_24_1.baoji > 1 then
			log.info("显示暴击")

			local var_24_3 = arg_24_1.baoji

			if arg_24_0.bjSprite and not tolua.isnull(arg_24_0.bjSprite) then
				arg_24_0.bjSprite:removeFromParentAndCleanup(true)

				arg_24_0.bjSprite = nil
			end

			local var_24_4 = smgr.getLayer("pushLayer")
			local var_24_5 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_24_3 .. ".png")
			local var_24_6 = ccp(visibleSize.width / 2, visibleSize.height * 0.35)

			if arg_24_2 == 1 or arg_24_2 == 2 then
				local var_24_7 = arg_24_0.view.widgets["openBoxButton" .. arg_24_2]
				local var_24_8, var_24_9 = tool.getPositionInScreen(var_24_7)

				var_24_6 = ccp(var_24_8, var_24_9)
			end

			var_24_5:setPosition(var_24_6)
			var_24_4:addChild(var_24_5)

			local var_24_10 = CCArray:create()

			var_24_10:addObject(CCDelayTime:create(0.3))
			var_24_10:addObject(CCFadeOut:create(1))
			var_24_10:addObject(CCCallFunc:create(function()
				var_24_5:removeFromParentAndCleanup(true)

				var_24_5 = nil
			end))
			var_24_5:runAction(CCSequence:create(var_24_10))

			arg_24_0.bjSprite = var_24_5
		end
	elseif arg_24_1.rewards then
		local var_24_11 = 1

		for iter_24_2, iter_24_3 in pairs(arg_24_1.rewards) do
			if iter_24_3.copper then
				for iter_24_4, iter_24_5 in pairs(iter_24_3) do
					if iter_24_5 ~= 0 then
						var_24_0[var_24_11] = {}

						if var_0_3[iter_24_4] then
							var_24_0[var_24_11].id = var_0_3[iter_24_4]
						else
							log.error("rank reward didn't recognized")

							var_24_0[var_24_11].id = var_0_3.coppper
						end

						var_24_0[var_24_11].value = iter_24_5
						var_24_11 = var_24_11 + 1
					end
				end
			elseif iter_24_3.type then
				local var_24_12

				if iter_24_3.type == 7 then
					if iter_24_3.pic then
						if var_0_2[iter_24_3.pic] then
							var_24_12 = var_0_2[iter_24_3.pic]
						else
							log.error("box reward didn't recognized", iter_24_3.type, iter_24_3.pic)

							var_24_12 = 5
						end
					end
				elseif var_0_4[iter_24_3.type] then
					var_24_12 = var_0_4[iter_24_3.type]
				else
					log.error("box reward didn't recognized", iter_24_3.type)
					log.info("box reward didn't recognized", iter_24_3.type)

					var_24_12 = 5
				end

				if iter_24_3.type > 1000 and iter_24_3.type < 1130 then
					eventManager.dispatchEvent("resourceAreaDidGetPic")
				end

				if iter_24_3.type == 136 then
					var_24_12 = 30012
				end

				var_24_0[var_24_11] = {}
				var_24_0[var_24_11].id = var_24_12
				var_24_0[var_24_11].value = iter_24_3.num
				var_24_11 = var_24_11 + 1

				if iter_24_3.beaf then
					var_24_0[var_24_11] = {}
					var_24_0[var_24_11].id = 57
					var_24_0[var_24_11].value = iter_24_3.beaf
					var_24_11 = var_24_11 + 1
				end

				if iter_24_3.baoji and iter_24_3.baoji > 1 then
					log.info("显示暴击")

					local var_24_13 = iter_24_3.baoji

					if arg_24_0.bjSprite and not tolua.isnull(arg_24_0.bjSprite) then
						arg_24_0.bjSprite:removeFromParentAndCleanup(true)

						arg_24_0.bjSprite = nil
					end

					local var_24_14 = smgr.getLayer("pushLayer")
					local var_24_15 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_24_13 .. ".png")
					local var_24_16 = ccp(visibleSize.width / 2, visibleSize.height * 0.35)

					if arg_24_2 == 1 or arg_24_2 == 2 then
						local var_24_17 = arg_24_0.view.widgets["openBoxButton" .. arg_24_2]
						local var_24_18, var_24_19 = tool.getPositionInScreen(var_24_17)

						var_24_16 = ccp(var_24_18, var_24_19)
					end

					var_24_15:setPosition(var_24_16)
					var_24_14:addChild(var_24_15)

					local var_24_20 = CCArray:create()

					var_24_20:addObject(CCDelayTime:create(0.3))
					var_24_20:addObject(CCFadeOut:create(1))
					var_24_20:addObject(CCCallFunc:create(function()
						var_24_15:removeFromParentAndCleanup(true)

						var_24_15 = nil
					end))
					var_24_15:runAction(CCSequence:create(var_24_20))

					arg_24_0.bjSprite = var_24_15
				end
			end
		end
	end

	globalAction_gotResource(var_24_0, ccp(visibleSize.width / 2, visibleSize.height * 0.5))
end

function var_0_14.showOpenBoxEffect(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.view.widgets["openBoxButton" .. arg_27_1]
	local var_27_1 = arg_27_0.view.widgets["light" .. arg_27_1]

	var_27_1:setVisible(true)
	var_27_1:stopAllActions()

	local var_27_2 = CCArray:create()

	var_27_2:addObject(CCCallFuncN:create(function()
		var_27_0:setHighlighted(true)
		var_27_1:setOpacity(120)
	end))
	var_27_2:addObject(CCFadeIn:create(0.6))
	var_27_2:addObject(CCFadeOut:create(1.4))
	var_27_2:addObject(CCCallFuncN:create(function()
		var_27_0:setHighlighted(false)
	end))

	local var_27_3 = CCSequence:create(var_27_2)

	var_27_1:runAction(var_27_3)
end

function var_0_14.createRankList(arg_30_0)
	local function var_30_0(arg_31_0, arg_31_1)
		log.info("cell touched at : ", arg_31_1:getIdx())
	end

	local function var_30_1(arg_32_0, arg_32_1)
		return 120, 899
	end

	local function var_30_2(arg_33_0, arg_33_1)
		local var_33_0 = arg_33_0:dequeueCell()

		if var_33_0 then
			var_33_0:removeAllChildrenWithCleanup(true)
		else
			var_33_0 = CCTableViewCell:new()
		end

		for iter_33_0 = 1, 2 do
			local var_33_1 = arg_30_0.ranks[2 * arg_33_1 + iter_33_0]

			if var_33_1 then
				local var_33_2 = {}

				uiutil.initWidgets(var_33_2, arg_30_0.layout_card)
				var_33_2.widgets.card:setPosition(ccp(iter_33_0 == 1 and 11 or 456, 0))
				var_33_0:addChild(var_33_2.widgets.card)
				var_33_2.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_33_1.pic .. ".png"):displayFrame())
				var_33_2.widgets.icon_feat:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_0_7(var_33_1.featLv)):displayFrame())
				var_33_2.widgets.rank:setString(var_33_1.rank)
				var_33_2.widgets.feat:setString(language.get(111021, var_33_1.feat))
				var_33_2.widgets.name:setString(var_33_1.playerName)
				var_33_2.widgets.lv:setString(language.get(111022, var_33_1.playerLv))
			end
		end

		return var_33_0
	end

	local function var_30_3()
		local var_34_0 = arg_30_0.ranks

		if var_34_0 and #var_34_0 > 0 then
			return math.ceil(#var_34_0 / 2)
		else
			return 0
		end
	end

	local var_30_4 = CCTableView:create(CCSizeMake(899, 375))

	var_30_4:setPosition(5, 5)
	var_30_4:setDirection(kCCScrollViewDirectionVertical)
	var_30_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_30_0.view.widgets.bg_rank:addChild(var_30_4)

	if arg_30_0.rankList then
		arg_30_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_30_0.rankList = var_30_4

	var_30_4:registerScriptHandler(var_30_0, CCTableView.kTableCellTouched)
	var_30_4:registerScriptHandler(var_30_1, CCTableView.kTableCellSizeForIndex)
	var_30_4:registerScriptHandler(var_30_2, CCTableView.kTableCellSizeAtIndex)
	var_30_4:registerScriptHandler(var_30_3, CCTableView.kNumberOfCellsInTableView)
	var_30_4:reloadData()
end

function var_0_14.updateFeatProgressBar(arg_35_0)
	local var_35_0 = arg_35_0.advanced
	local var_35_1 = arg_35_0.info.advanced
	local var_35_2 = false

	if arg_35_0.info.isTechOpen then
		var_35_2 = var_35_0 ~= nil and var_35_0 < var_35_1

		local var_35_3

		if var_35_2 then
			var_35_3 = -850 * (var_35_0 - 1)
		else
			var_35_3 = -850 * (var_35_1 - 1)
		end

		arg_35_0.progressLayer:stopAllActions()
		arg_35_0.progressLayer:setPositionX(var_35_3)
	end

	local var_35_4 = 0
	local var_35_5 = #arg_35_0.info.lvs

	local function var_35_6(arg_36_0, arg_36_1)
		return arg_36_0.index < arg_36_1.index
	end

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.info.lvs) do
		if iter_35_1.boxType == 1 then
			arg_35_0.view.widgets["progressBoxPic" .. var_35_1 .. iter_35_0]:setScale(0.6)
		else
			arg_35_0.view.widgets["progressBoxPic" .. var_35_1 .. iter_35_0]:setScale(0.8)
		end

		if arg_35_0.view.widgets["box_double" .. var_35_1 .. iter_35_0] then
			arg_35_0.view.widgets["box_double" .. var_35_1 .. iter_35_0]:setVisible(arg_35_0.info.ifMultiReward)
		end

		local var_35_7 = arg_35_0.info.feat >= iter_35_1.feat
		local var_35_8 = var_35_7 and "gxb_pb_bx.png" or "gxb_pb_bx1.png"
		local var_35_9 = var_35_7 and "icon_numb_multi.png" or "icon_numb_multi_gray.png"

		if var_35_1 == 1 or var_35_1 == 2 then
			arg_35_0.view.widgets["progressLabel" .. var_35_1 .. iter_35_0]:setString(iter_35_1.feat)
			arg_35_0.view.widgets["progressBoxPic" .. var_35_1 .. iter_35_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_35_8):displayFrame())
			arg_35_0.view.widgets["icon_multi" .. var_35_1 .. iter_35_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_35_9):displayFrame())
		elseif var_35_1 >= 3 and iter_35_0 == 1 then
			arg_35_0.view.widgets.progressLabel30:setString(arg_35_0.info.startFeat)
			arg_35_0.view.widgets.progressLabel31:setString(iter_35_1.feat)
		end

		if not arg_35_0.info.isTechOpen then
			if var_35_1 == 1 and iter_35_1.rewardNum then
				arg_35_0.view.widgets["boxAtlas" .. var_35_1 .. iter_35_0]:setString(iter_35_1.rewardNum)
				arg_35_0.view.widgets["boxAtlasGray" .. var_35_1 .. iter_35_0]:setString(iter_35_1.rewardNum)
				arg_35_0.view.widgets["boxAtlas" .. var_35_1 .. iter_35_0]:setVisible(var_35_7)
				arg_35_0.view.widgets["boxAtlasGray" .. var_35_1 .. iter_35_0]:setVisible(not var_35_7)
			end
		elseif var_35_1 == 1 or var_35_1 == 2 then
			if iter_35_1.chosenReward then
				table.sort(iter_35_1.chosenReward, var_35_6)
			end

			local var_35_10 = arg_35_0.view.widgets["progressBoxPic" .. var_35_1 .. iter_35_0]

			if var_35_7 and iter_35_1.alreadyGot == false then
				var_35_10:setPositionX(0)
				arg_35_0:showEffectShake(var_35_10)
			else
				var_35_10:stopAllActions()
				var_35_10:setPositionX(0)
			end

			local var_35_11 = arg_35_0.view.widgets["icon_hammer" .. var_35_1 .. iter_35_0]
			local var_35_12 = arg_35_0.info.openHammerReward and iter_35_1.hammerNum ~= nil and iter_35_1.hammerNum > 0

			var_35_11:setVisible(var_35_12)

			if var_35_12 then
				local var_35_13

				if iter_35_1.hammerType == 127 then
					var_35_13 = "jzsj_gxb_jzc_icon1.png"
				elseif iter_35_1.hammerType == 128 then
					var_35_13 = "jzsj_gxb_jzc_icon2.png"
				end

				if var_35_13 then
					var_35_11:setDisplayFrame(CCSprite:create("res/ui/buildEvent/" .. var_35_13):displayFrame())
				end
			end
		elseif var_35_1 >= 3 then
			if iter_35_1.chosenReward then
				table.sort(iter_35_1.chosenReward, var_35_6)
			end

			local var_35_14 = arg_35_0.view.widgets.progressBoxPic31

			var_35_14:removeAllChildrenWithCleanup(true)

			if var_35_7 and iter_35_1.alreadyGot == false then
				var_35_14:setPositionX(710)
				arg_35_0:showEffectShake(var_35_14)
			else
				var_35_14:stopAllActions()
				var_35_14:setPositionX(710)

				if not var_35_7 then
					tool.spriteToGray(arg_35_0.view.widgets.progressBoxPic31)
				end
			end

			local var_35_15 = arg_35_0.info.openHammerReward and iter_35_1.hammerNum ~= nil and iter_35_1.hammerNum > 0

			arg_35_0.view.widgets.bg_hammer31:setVisible(var_35_15)

			if var_35_15 then
				local var_35_16

				if iter_35_1.hammerType == 127 then
					var_35_16 = "jzsj_gxb_jzc_icon1.png"
				elseif iter_35_1.hammerType == 128 then
					var_35_16 = "jzsj_gxb_jzc_icon2.png"
				end

				if var_35_16 then
					arg_35_0.view.widgets.icon_hammer31:setDisplayFrame(CCSprite:create("res/ui/buildEvent/" .. var_35_16):displayFrame())
				end
			end
		end

		if var_35_1 == 1 or var_35_1 == 2 then
			arg_35_0.view.widgets["num_flag" .. var_35_1 .. iter_35_0]:setVisible(false)
		end

		local var_35_17
		local var_35_18

		if var_35_1 == 1 then
			if iter_35_1.type == 1 then
				var_35_17 = "gxb_yjh_h.png"
				var_35_18 = "gxb_jh_gray.png"
			elseif iter_35_1.type == 2 then
				var_35_17 = "gxb_jjh_h.png"
				var_35_18 = "gxb_jh_gray.png"
			end
		elseif var_35_1 == 2 and iter_35_1.flag and iter_35_1.flag > 0 then
			var_35_17 = "gxb_sq.png"
			var_35_18 = "gxb_sq_g.png"

			arg_35_0.view.widgets["num_flag" .. var_35_1 .. iter_35_0]:setString(language.get(135039, iter_35_1.flag))
			arg_35_0.view.widgets["num_flag" .. var_35_1 .. iter_35_0]:setVisible(true)
		end

		if var_35_1 == 1 or var_35_1 == 2 then
			if var_35_17 then
				local var_35_19 = var_35_7 and var_35_17 or var_35_18

				arg_35_0.view.widgets["icon_drink" .. var_35_1 .. iter_35_0]:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_35_19):displayFrame())
			end

			arg_35_0.view.widgets["icon_drink" .. var_35_1 .. iter_35_0]:setVisible(var_35_17 ~= nil)
		end

		if var_35_7 then
			var_35_4 = var_35_4 + 100 / var_35_5
		else
			local var_35_20 = iter_35_0 == 1 and arg_35_0.info.startFeat or arg_35_0.info.lvs[iter_35_0 - 1].feat

			if var_35_20 <= arg_35_0.info.feat then
				var_35_4 = var_35_4 + 100 / var_35_5 * (arg_35_0.info.feat - var_35_20) / (iter_35_1.feat - var_35_20)
			end
		end
	end

	arg_35_0.view.widgets["bar" .. var_35_1]:setPercentage(var_35_4)

	if var_35_2 then
		arg_35_0.progressLayer:runAction(CCEaseSineOut:create(CCMoveBy:create(1, ccp(-850, 0))))
	end
end

function var_0_14.onBtnBoxTap(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0

	if arg_37_0.info.advanced == 1 or arg_37_0.info.advanced == 2 then
		var_37_0 = arg_37_0.info.lvs[arg_37_2]
	elseif arg_37_0.info.advanced >= 3 then
		var_37_0 = arg_37_0.info.lvs[1]
	end

	if var_37_0 then
		if arg_37_0.info.feat >= var_37_0.feat and var_37_0.alreadyGot == false then
			arg_37_0:showSelectPanel(var_37_0)
		else
			local var_37_1

			if arg_37_0.info.chosenBoxLv >= 6 then
				var_37_1 = language.get(226310 + var_37_0.boxType)
			elseif arg_37_0.info.advanced == 1 then
				var_37_1 = language.get(111058)
			else
				var_37_1 = language.get(111045, arg_37_0.info.chosenBoxLv)
			end

			local var_37_2 = var_37_1 .. "\n" .. language.get(111046)

			for iter_37_0, iter_37_1 in ipairs(var_37_0.chosenReward) do
				var_37_2 = var_37_2 .. "\n  " .. language.get(var_0_5[iter_37_1.type].txt) .. ":" .. tool.getFormatNum(iter_37_1.num)
			end

			if not arg_37_0.info.yesterday then
				if var_37_0.niceWineNum and var_37_0.niceWineNum > 0 then
					var_37_2 = var_37_2 .. "\n  [" .. language.get(111057, var_37_0.niceWineNum) .. "]"
				end

				if var_37_0.cashNum and var_37_0.cashNum > 0 then
					var_37_2 = var_37_2 .. "\n  [" .. language.get(136146, var_37_0.cashNum) .. "]"
				end

				if var_37_0.freeEmployTimes and var_37_0.freeEmployTimes > 0 then
					var_37_2 = var_37_2 .. "\n  [" .. language.get("222630_seasilk", var_37_0.freeEmployTimes) .. "]"
				end

				if var_37_0.warlordIvtNum and var_37_0.warlordIvtNum > 0 then
					var_37_2 = var_37_2 .. "\n  [" .. language.get(111074, var_37_0.warlordIvtNum) .. "]"
				end
			end

			var_37_0.hammerNum = var_37_0.hammerNum or 0
			var_37_0.flag = var_37_0.flag or 0

			if arg_37_0.info.advanced == 2 and var_37_0.flag > 0 or arg_37_0.info.openHammerReward and var_37_0.hammerNum > 0 then
				var_37_2 = var_37_2 .. "\n" .. language.get(111061)

				if arg_37_0.info.advanced == 2 and var_37_0.flag > 0 then
					var_37_2 = var_37_2 .. "\n  " .. language.get(111062, var_37_0.flag)
				end

				if arg_37_0.info.openHammerReward and var_37_0.hammerNum > 0 then
					var_37_2 = var_37_2 .. "\n  " .. language.get(111063, var_37_0.hammerNum)
				end
			end

			arg_37_0:showUpperRightTip(arg_37_1, var_37_2, 0)
		end
	end
end

function var_0_14.showEffectShake(arg_38_0, arg_38_1)
	if not arg_38_1 or tolua.isnull(arg_38_1) then
		return
	end

	local var_38_0 = CCArray:create()

	var_38_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_38_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_38_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_38_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_38_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_38_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_38_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_38_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_38_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_38_0:addObject(CCDelayTime:create(0.4))

	local var_38_1 = CCSequence:create(var_38_0)

	arg_38_1:stopAllActions()
	arg_38_1:runAction(CCRepeatForever:create(var_38_1))
end

function var_0_14.showSelectPanel(arg_39_0, arg_39_1)
	local var_39_0 = {
		name = "npcBg1",
		h = 438,
		type = "button",
		w = 909,
		zorder = 100,
		y = 0,
		x = 0,
		normal = {
			path = "res/default.png"
		},
		touched = {
			path = "res/default.png"
		},
		anchorPoint = ccp(0, 0),
		children = {
			{
				y = 0,
				type = "sprite",
				x = 0,
				anchorPoint = ccp(0, 0),
				pic = {
					path = "res/ui/rankInfo/DailyFeatView/gxbyh_dhk.png"
				},
				children = {
					{
						fontSize = 22,
						name = "npcMsg1",
						x = 280,
						type = "label",
						height = 0,
						y = 190,
						width = 540,
						color = var_0_9,
						anchorPoint = ccp(0, 1),
						halign = kCCTextAlignmentLeft
					},
					{
						y = 0,
						name = "npcPic1",
						type = "sprite",
						x = 0,
						anchorPoint = ccp(0, 0),
						pic = {
							path = "res/ui/common/halfPic/halfPic_caocao.png"
						}
					}
				}
			}
		}
	}
	local var_39_1 = {
		name = "btn",
		h = 100,
		type = "button",
		w = 100,
		y = 0,
		x = 0,
		normal = {
			path = "res/default.png"
		},
		touched = {
			path = "res/default.png"
		},
		anchorPoint = ccp(0.5, 0.5),
		children = {
			{
				y = 80,
				name = "icon",
				x = 50,
				type = "sprite"
			},
			{
				y = 40,
				x = 50,
				type = "sprite",
				pic = {
					path = "res/ui/juben/jb_wj_lv_d.png"
				}
			},
			{
				fontSize = 22,
				name = "num",
				y = 40,
				type = "label",
				x = 50,
				color = var_0_9
			}
		}
	}

	uiutil.initWidgets(arg_39_0.view, var_39_0)
	arg_39_0.view.widgets.featBg:addChild(arg_39_0.view.widgets.npcBg1, 100)

	local var_39_2 = false

	for iter_39_0, iter_39_1 in ipairs(arg_39_1.chosenReward) do
		if iter_39_1.show == 1 then
			var_39_2 = iter_39_1.index == 0
		end
	end

	arg_39_0.view.widgets.npcMsg1:setString(language.get(var_39_2 and 111073 or 111039, arg_39_1.feat))

	local var_39_3 = string.format("res/ui/common/halfPic/halfPic_%s.png", var_0_1[user.player.forceId])

	if arg_39_0.info.displayLeiZu == 1 then
		var_39_3 = "res/ui/common/halfPic/halfPic_luomu.png"
	elseif arg_39_0.info.displayZhouGong == 1 then
		var_39_3 = "res/ui/common/halfPic/halfPic_zhougong.png"
	end

	arg_39_0.view.widgets.npcPic1:setDisplayFrame(CCSprite:create(var_39_3):displayFrame())

	local var_39_4 = 0

	for iter_39_2, iter_39_3 in ipairs(arg_39_1.chosenReward) do
		if iter_39_3.show == 1 then
			var_39_4 = var_39_4 + 1
		end
	end

	local var_39_5 = 0

	for iter_39_4, iter_39_5 in ipairs(arg_39_1.chosenReward) do
		if iter_39_5.show == 1 then
			var_39_5 = var_39_5 + 1

			local var_39_6 = 570 - (var_39_4 - 1) * 180 / 2 + (var_39_5 - 1) * 180
			local var_39_7 = {}

			uiutil.initWidgets(var_39_7, var_39_1)
			arg_39_0.view.widgets.npcBg1:addChild(var_39_7.widgets.btn)
			var_39_7.widgets.btn:setPosition(ccp(var_39_6, 60))
			var_39_7.widgets.btn:addHandleOfControlEvent(function()
				log.info("reward" .. iter_39_4)
				arg_39_0:onGetChosenReward(arg_39_1.id, iter_39_5.index, iter_39_5.goldCost)
			end, CCControlEventTouchUpInside)

			local var_39_8
			local var_39_9 = var_0_5[iter_39_5.type]
			local var_39_10 = var_39_9.scale

			if var_39_9.frame then
				var_39_8 = tool.spriteFrameByName(var_39_9.pic)
			else
				var_39_8 = CCSprite:create(var_39_9.pic):displayFrame()
			end

			if iter_39_5.goldCost then
				var_39_10 = 0.8

				if var_39_9.pic1 then
					var_39_8 = CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_39_9.pic1):displayFrame()
				end

				local var_39_11 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxbyh_reward_light.png")

				var_39_11:setPosition(50, 80)
				var_39_11:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
				var_39_7.widgets.btn:addChild(var_39_11, -1)

				local var_39_12 = CCSprite:create("res/ui/activity/godSendRed/yuanbao.png")

				var_39_12:setScale(0.8)
				var_39_12:setPosition(40, 6)
				var_39_7.widgets.btn:addChild(var_39_12)

				local var_39_13 = CCSprite:create("res/ui/rankInfo/DailyFeatView/word_chong.png")

				var_39_13:setPosition(25, 17)
				var_39_12:addChild(var_39_13)

				local var_39_14 = CCLabelTTF:create(iter_39_5.goldCost, "Thonburi", 22)

				var_39_14:setColor(var_0_12)
				var_39_14:setPosition(70, 8)
				var_39_7.widgets.btn:addChild(var_39_14)
			end

			var_39_7.widgets.icon:setDisplayFrame(var_39_8)
			arg_39_0:showEffectShake(var_39_7.widgets.icon)

			if var_39_10 then
				var_39_7.widgets.icon:setScale(var_39_10)
			end

			var_39_7.widgets.num:setString(language.get(var_39_9.txt) .. ":" .. tool.getFormatNum(iter_39_5.num))
		end
	end
end

local function var_0_17(arg_41_0)
	local var_41_0 = ""

	if tonumber(arg_41_0) >= 10000 then
		arg_41_0 = tool.toint(arg_41_0 / 10000)
		var_41_0 = "万"
	end

	if tonumber(arg_41_0) >= 10000 then
		arg_41_0 = tool.toint(arg_41_0 / 10000)
		var_41_0 = "亿"
	end

	return arg_41_0 .. var_41_0
end

function var_0_14.handlerPushJungongEventAction(arg_42_0, arg_42_1, arg_42_2)
	if not arg_42_0.initialized then
		return
	end

	local var_42_0
	local var_42_1

	if arg_42_2 then
		var_42_1 = arg_42_1
	else
		var_42_0 = arg_42_1.action.data
		var_42_1 = var_42_0.info
	end

	if var_42_1 == nil and var_42_0 and var_42_0.leftInfo and var_42_0.leftInfo.leftInfoClear then
		print("紧急军务完成刷新")
		arg_42_0:refresh()

		if arg_42_0.view.widgets.jwRewardNode then
			arg_42_0.view.widgets.jwRewardNode:removeFromParentAndCleanup(true)

			arg_42_0.view.widgets.jwRewardNode = nil
		end

		if arg_42_0.view.widgets.jungongRewardButton then
			arg_42_0.view.widgets.jungongRewardButton:setVisible(false)
		end
	end

	if var_42_1 and tonumber(arg_42_0.info.chosenBoxLv) >= 6 then
		local var_42_2
		local var_42_3 = var_42_1.emergency and "res/ui/rankInfo/DailyFeatView/gxb_word_jjjw.png" or "res/ui/rankInfo/DailyFeatView/gxb_word_ptjw.png"

		arg_42_0.view.widgets.taskTitle:setDisplayFrame(CCSprite:create(var_42_3):displayFrame())

		if var_42_1.target == "" then
			arg_42_0.view.widgets.taskTitle:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_word_ptjw.png"):displayFrame())
			arg_42_0.view.widgets.taskInfoLb:setString(language.get(226304))
		else
			local var_42_4 = var_42_1.target .. "  " .. tool.getFormatNum(var_42_1.currProcess) .. "/" .. tool.getFormatNum(var_42_1.targetProcess)

			arg_42_0.view.widgets.taskInfoLb:setString(var_42_4)
		end

		arg_42_0.view.widgets.taskProLb:setString(var_42_1.finishTaskNum .. "/" .. var_42_1.totalTaskNum)

		if arg_42_0.view.widgets.jwRewardNode then
			arg_42_0.view.widgets.jwRewardNode:removeFromParentAndCleanup(true)

			arg_42_0.view.widgets.jwRewardNode = nil
		end

		uiutil.initWidgets(arg_42_0.view, arg_42_0:layout_jwReward())
		arg_42_0.view.widgets.node_rank2:addChild(arg_42_0.view.widgets.jwRewardNode)

		if arg_42_0.timerLayer == nil then
			local function var_42_5()
				local var_43_0 = arg_42_0.view.widgets.node_rank2:getChildByTag(1000)
				local var_43_1 = var_43_0:getTime()

				var_43_0:setTriggerTime(var_43_1 - 1000)

				if var_43_1 == 0 then
					-- block empty
				end
			end

			if var_42_1.cd > 0 then
				arg_42_0.timerLayer = createTimerLabel(var_42_1.cd, "@H:@M:@S", "Thonburi-Bold", 24, var_42_5, nil, nil, colorTips.red)

				arg_42_0.timerLayer:setPosition(ccp(120, 80))
				arg_42_0.view.widgets.node_rank2:addChild(arg_42_0.timerLayer, 999, 1000)
			end
		elseif var_42_1.cd > 0 then
			arg_42_0.timerLayer:setTime(var_42_1.cd)
		end

		if var_42_1.taskState == 0 then
			arg_42_0.view.widgets.jungongBeginButton:setVisible(true)
		else
			arg_42_0.view.widgets.jungongBeginButton:setVisible(false)
		end

		if var_42_1.taskState == 1 then
			if arg_42_0.timerLayer then
				arg_42_0.timerLayer:setPosition(ccp(120, 80))
				arg_42_0.timerLayer:setVisible(true)
			end

			arg_42_0.view.widgets.jungongCancelButton:setVisible(true)
			arg_42_0.view.widgets.jungongQuickFinishButton:setVisible(true)
			arg_42_0.view.widgets.quickGoldLb:setString(user.player.jungong.goldFastForceTask)
		else
			if arg_42_0.timerLayer then
				arg_42_0.timerLayer:setVisible(false)
			end

			arg_42_0.view.widgets.jungongCancelButton:setVisible(false)
			arg_42_0.view.widgets.jungongQuickFinishButton:setVisible(false)
		end

		if var_42_1.taskState == 2 then
			arg_42_0.view.widgets.jungongRewardButton:setVisible(true)
		else
			arg_42_0.view.widgets.jungongRewardButton:setVisible(false)
		end

		if var_42_1.taskState == 3 then
			arg_42_0.view.widgets.taskInfoLb:setString(language.get(226309))
		end

		if var_42_1.taskState == -1 then
			if var_42_1.yesterday then
				arg_42_0.view.widgets.taskInfoLb:setString(language.get(226307))
			elseif var_42_1.advanced == 1 then
				arg_42_0.view.widgets.taskInfoLb:setString(language.get(226308))
			else
				arg_42_0.view.widgets.taskInfoLb:setString(language.get(226304))
			end

			if arg_42_0.timerLayer then
				arg_42_0.timerLayer:setPosition(ccp(350, 168))
				arg_42_0.timerLayer:setVisible(true)
			end
		end
	end
end

function var_0_14.startJungongTask(arg_44_0)
	local function var_44_0(arg_45_0)
		local var_45_0 = arg_45_0.action.data

		if var_45_0 then
			user.player.jungong = var_45_0

			arg_44_0:handlerPushJungongEventAction(user.player.jungong, true)
		end
	end

	cmgr.sendRequest(var_44_0, actions.forceTaskReceiveTask)
end

function var_0_14.cancelJungongTask(arg_46_0)
	local function var_46_0(arg_47_0)
		return
	end

	cmgr.sendRequest(var_46_0, actions.forceTaskCancelTask)
end

function var_0_14.quickFinishJungong(arg_48_0)
	messageBox.showChargeWin(language.get(190080), language.get(226301, user.player.jungong.goldFastForceTask), "goldFastForceTask", function(...)
		user.player.jwQuick = 2

		cmgr.sendRequest(function()
			return
		end, actions.forceTaskQuickFinish)
	end)
end

function var_0_14.getJungongReward(arg_51_0)
	local function var_51_0(arg_52_0)
		local var_52_0 = arg_52_0.action.data

		if var_52_0.rewardList then
			local var_52_1 = {}

			for iter_52_0 = 1, #var_52_0.rewardList do
				var_52_1[iter_52_0] = {}

				if var_52_0.rewardList[iter_52_0].type == 112 then
					var_52_1[iter_52_0].id = 10001
				else
					var_52_1[iter_52_0].id = var_52_0.rewardList[iter_52_0].type
				end

				var_52_1[iter_52_0].value = var_52_0.rewardList[iter_52_0].num
			end

			globalAction_gotResource(var_52_1)
		end

		if user.player.jungong then
			user.player.jungong = nil
		end

		arg_51_0:refresh()
	end

	cmgr.sendRequest(var_51_0, actions.forceTaskFinishTask)
end

function var_0_14.init(arg_53_0, arg_53_1)
	arg_53_0.initialized = true

	if tonumber(arg_53_1.chosenBoxLv) >= 6 then
		arg_53_0.isBigFeat = true

		uiutil.initWidgets(arg_53_0.view, arg_53_0.layout_node_rank2)
		arg_53_0.view.widgets.featBg:addChild(arg_53_0.view.widgets.node_rank2)
		arg_53_0.view.widgets.jungongBeginButton:addHandleOfControlEvent(function()
			arg_53_0:startJungongTask()
		end, CCControlEventTouchUpInside)
		arg_53_0.view.widgets.jungongCancelButton:addHandleOfControlEvent(function()
			arg_53_0:cancelJungongTask()
		end, CCControlEventTouchUpInside)
		arg_53_0.view.widgets.jungongQuickFinishButton:addHandleOfControlEvent(function()
			arg_53_0:quickFinishJungong()
		end, CCControlEventTouchUpInside)
		arg_53_0.view.widgets.jungongRewardButton:addHandleOfControlEvent(function()
			arg_53_0:getJungongReward()
		end, CCControlEventTouchUpInside)
	else
		arg_53_0.isBigFeat = false

		uiutil.initWidgets(arg_53_0.view, arg_53_0.layout_node_rank1)
		arg_53_0.view.widgets.featBg:addChild(arg_53_0.view.widgets.node_rank1)
	end

	local var_53_0 = arg_53_0.view.widgets.lastRankTitlePic:getContentSize().width
	local var_53_1, var_53_2 = arg_53_0.view.widgets.lastRankTitlePic:getPosition()

	arg_53_0.view.widgets.lastRankAtlas:setPositionX(15 + var_53_1 + var_53_0)

	local var_53_3 = arg_53_0.view.widgets.todayRankTitlePic1:getContentSize().width
	local var_53_4, var_53_5 = arg_53_0.view.widgets.todayRankTitlePic1:getPosition()

	arg_53_0.view.widgets.noRankTitlePic1:setPositionX(15 + var_53_4 + var_53_3)
	arg_53_0.view.widgets.todayRankAtlas1:setPositionX(15 + var_53_4 + var_53_3)
	arg_53_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_53_0:onGetRankReward()
	end, CCControlEventTouchUpInside)
	arg_53_0.view.widgets.btn_giveUp:addHandleOfControlEvent(function()
		log.info("btn_giveUp")
		arg_53_0:onGiveUpRankReward()
	end, CCControlEventTouchUpInside)
	arg_53_0.view.widgets.node_box1:setVisible(not arg_53_1.isTechOpen)
	arg_53_0.view.widgets.node_flag:setVisible(arg_53_1.isTechOpen)
	arg_53_0.view.widgets.info_noRank:setVisible(false)
	arg_53_0.view.widgets.node_reward:setVisible(false)
	arg_53_0.view.widgets.btn_reward:setVisible(false)

	if not arg_53_1.isTechOpen then
		arg_53_0.view.widgets.bg_feat:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bg.jpg"):displayFrame())
		arg_53_0.view.widgets.info_reset:setString(language.get(111015))
		uiutil.initWidgets(arg_53_0.view, arg_53_0.layout_node_progress1)
		arg_53_0.view.widgets.featBg:addChild(arg_53_0.view.widgets.node_progress)
		arg_53_0.view.widgets.node_progress:setPosition(ccp(100, 273))

		for iter_53_0 = 1, 5 do
			local var_53_6 = 1

			uiutil.initWidgets(arg_53_0.view, var_0_16(var_53_6, iter_53_0))

			local var_53_7 = arg_53_0.view.widgets["node_num" .. var_53_6 .. iter_53_0]

			arg_53_0.view.widgets.bg_bar1:addChild(var_53_7)
			var_53_7:setPositionX(iter_53_0 * 151 + 7)
		end
	else
		arg_53_0.view.widgets.bg_feat:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bg1.jpg"):displayFrame())
		arg_53_0.view.widgets.info_reset:setString(language.get(111064))
		arg_53_0.view.widgets.info_reset:setAnchorPoint(ccp(1, 0.5))
		arg_53_0.view.widgets.info_reset:setPosition(ccp(890, 277))

		local var_53_8 = CCLayerColor:create(ccc4(0, 0, 0, 0), 2520, 160)
		local var_53_9 = CCScrollView:create(CCSizeMake(820, 160), var_53_8)

		var_53_9:setPosition(ccp(100, 273))
		var_53_9:setTouchEnabled(false)
		arg_53_0.view.widgets.featBg:addChild(var_53_9)
		uiutil.initWidgets(arg_53_0.view, arg_53_0.layout_node_progress2)
		var_53_8:addChild(arg_53_0.view.widgets.node_progress)
		var_53_8:setPosition(ccp(0, 0))

		arg_53_0.progressLayer = var_53_8

		for iter_53_1 = 1, 3 do
			local var_53_10 = 1

			uiutil.initWidgets(arg_53_0.view, var_0_16(var_53_10, iter_53_1))

			local var_53_11 = arg_53_0.view.widgets["node_num" .. var_53_10 .. iter_53_1]

			arg_53_0.view.widgets.bg_bar1:addChild(var_53_11)
			var_53_11:setPositionX(iter_53_1 * 255)
			arg_53_0.view.widgets["progressBoxPic" .. var_53_10 .. iter_53_1]:setPositionX(0)
			arg_53_0.view.widgets["icon_multi" .. var_53_10 .. iter_53_1]:setVisible(false)
			arg_53_0.view.widgets["boxAtlas" .. var_53_10 .. iter_53_1]:setVisible(false)
			arg_53_0.view.widgets["boxAtlasGray" .. var_53_10 .. iter_53_1]:setVisible(false)

			local var_53_12 = arg_53_0.view.widgets["btn_box" .. var_53_10 .. iter_53_1]

			var_53_12:addHandleOfControlEvent(function()
				log.info("btn_box" .. var_53_10 .. iter_53_1)

				local var_60_0

				if arg_53_0.info.advanced == 1 or arg_53_0.info.advanced == 2 then
					var_60_0 = arg_53_0.info.lvs[iter_53_1]
				elseif arg_53_0.info.advanced >= 3 then
					var_60_0 = arg_53_0.info.lvs[1]
				end

				if arg_53_0.info.needTaskNum and arg_53_0.info.needTaskNum > 0 and arg_53_0.info.feat >= var_60_0.feat and var_60_0.alreadyGot == false then
					messageBox.confirm(language.get(226314, arg_53_0.info.needTaskNum), function()
						arg_53_0:onBtnBoxTap(var_53_12, iter_53_1)
					end)
				else
					arg_53_0:onBtnBoxTap(var_53_12, iter_53_1)
				end
			end, CCControlEventTouchUpInside)
		end

		for iter_53_2 = 1, 5 do
			local var_53_13 = 2

			uiutil.initWidgets(arg_53_0.view, var_0_16(var_53_13, iter_53_2))

			local var_53_14 = arg_53_0.view.widgets["node_num" .. var_53_13 .. iter_53_2]

			arg_53_0.view.widgets.bg_bar2:addChild(var_53_14)
			var_53_14:setPositionX(iter_53_2 * 151 + 7)
			arg_53_0.view.widgets["progressBoxPic" .. var_53_13 .. iter_53_2]:setPositionX(0)
			arg_53_0.view.widgets["icon_multi" .. var_53_13 .. iter_53_2]:setVisible(false)
			arg_53_0.view.widgets["boxAtlas" .. var_53_13 .. iter_53_2]:setVisible(false)
			arg_53_0.view.widgets["boxAtlasGray" .. var_53_13 .. iter_53_2]:setVisible(false)

			local var_53_15 = arg_53_0.view.widgets["btn_box" .. var_53_13 .. iter_53_2]

			var_53_15:addHandleOfControlEvent(function()
				log.info("btn_box" .. var_53_13 .. iter_53_2)

				local var_62_0

				if arg_53_0.info.advanced == 1 or arg_53_0.info.advanced == 2 then
					var_62_0 = arg_53_0.info.lvs[iter_53_2]
				elseif arg_53_0.info.advanced >= 3 then
					var_62_0 = arg_53_0.info.lvs[1]
				end

				if arg_53_0.info.needTaskNum and arg_53_0.info.needTaskNum > 0 and arg_53_0.info.feat >= var_62_0.feat and var_62_0.alreadyGot == false then
					messageBox.confirm(language.get(226314, arg_53_0.info.needTaskNum), function()
						arg_53_0:onBtnBoxTap(var_53_15, iter_53_2)
					end)
				else
					arg_53_0:onBtnBoxTap(var_53_15, iter_53_2)
				end
			end, CCControlEventTouchUpInside)
		end

		for iter_53_3 = 0, 1 do
			local var_53_16 = 3

			uiutil.initWidgets(arg_53_0.view, var_0_16(var_53_16, iter_53_3))

			local var_53_17 = arg_53_0.view.widgets["node_num" .. var_53_16 .. iter_53_3]

			arg_53_0.view.widgets.bg_bar3:addChild(var_53_17)
			var_53_17:setPositionX(iter_53_3 * 636 + 7)

			if iter_53_3 == 1 then
				local var_53_18 = arg_53_0.view.widgets["btn_box" .. var_53_16 .. iter_53_3]

				var_53_18:addHandleOfControlEvent(function()
					log.info("btn_box" .. var_53_16 .. iter_53_3)

					local var_64_0

					if arg_53_0.info.advanced == 1 or arg_53_0.info.advanced == 2 then
						var_64_0 = arg_53_0.info.lvs[iter_53_3]
					elseif arg_53_0.info.advanced >= 3 then
						var_64_0 = arg_53_0.info.lvs[1]
					end

					if arg_53_0.info.needTaskNum and arg_53_0.info.needTaskNum > 0 and arg_53_0.info.feat >= var_64_0.feat and var_64_0.alreadyGot == false then
						messageBox.confirm(language.get(226314, arg_53_0.info.needTaskNum), function()
							arg_53_0:onBtnBoxTap(var_53_18, iter_53_3)
						end)
					else
						arg_53_0:onBtnBoxTap(var_53_18, iter_53_3)
					end
				end, CCControlEventTouchUpInside)
			end
		end
	end
end

function var_0_14.showPanel(arg_66_0, arg_66_1)
	arg_66_0.info = arg_66_1

	if not arg_66_0.initialized then
		arg_66_0:init(arg_66_1)
	end

	if user.player.jungong then
		arg_66_0:handlerPushJungongEventAction(user.player.jungong, true)
	elseif tonumber(arg_66_1.chosenBoxLv) >= 6 then
		arg_66_0.view.widgets.taskTitle:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_word_ptjw.png"):displayFrame())
		arg_66_0.view.widgets.taskProLb:setString("")

		if arg_66_1.yesterday then
			arg_66_0.view.widgets.taskInfoLb:setString(language.get(226307))
		elseif tonumber(arg_66_1.advanced) == 1 then
			arg_66_0.view.widgets.taskInfoLb:setString(language.get(226308))
		else
			arg_66_0.view.widgets.taskInfoLb:setString(language.get(226304))
		end
	end

	if not arg_66_1.isTechOpen then
		arg_66_0.view.widgets.openBoxButton1:setEnabled(arg_66_1.featBoxNum > 0)
		arg_66_0.view.widgets.light1:setVisible(false)
		arg_66_0.view.widgets.light1:stopAllActions()
		arg_66_0.view.widgets.boxNumLabel1:setString(arg_66_1.featBoxNum)
		arg_66_0.view.widgets.boxMax1:setVisible(arg_66_1.featBoxNum >= arg_66_1.maxFeatBoxNum)
		arg_66_0.view.widgets.rich_boxNum1:reorder()
		arg_66_0.view.widgets.todayRankTitlePic:setVisible(true)

		local var_66_0 = arg_66_1.rank > 0

		if var_66_0 then
			arg_66_0.view.widgets.todayRankAtlas:setString(arg_66_1.rank)
		end

		arg_66_0.view.widgets.noRankTitlePic:setVisible(not var_66_0)
		arg_66_0.view.widgets.todayRankAtlas:setVisible(var_66_0)

		if arg_66_1.iconType == 0 and arg_66_1.received == 1 then
			arg_66_0.view.widgets.npcBg:setVisible(false)
		else
			local var_66_1 = ""
			local var_66_2 = false

			if arg_66_1.iconType == 0 then
				local var_66_3 = (("" .. arg_66_1.lastCopper .. language.get(10101) .. " ") .. arg_66_1.lastExp .. language.get(10107) .. " ") .. arg_66_1.lastIron .. language.get(10104)

				var_66_1 = language.get(111018, arg_66_1.lastRank, var_66_3)

				arg_66_0.view.widgets.getRewardButton:setVisible(true)
			elseif arg_66_1.iconType == 1 then
				var_66_1 = language.get(111034)
				var_66_2 = true
			elseif arg_66_1.iconType == 2 then
				var_66_1 = language.get(111035)
				var_66_2 = true
			end

			arg_66_0.view.widgets.npcMsg:setString(var_66_1)
			arg_66_0.view.widgets.npcMsg:setVisible(true)

			local var_66_4 = var_66_2 and string.format("res/ui/common/halfPic/halfPic_%s.png", var_0_1[user.player.forceId]) or "res/ui/comment/xiaoqian.png"

			arg_66_0.view.widgets.npcPic:setDisplayFrame(CCSprite:create(var_66_4):displayFrame())
			arg_66_0.view.widgets.npcPic:setScale(var_66_2 and 1 or 0.6)
			arg_66_0.view.widgets.npcPic:setPositionX(var_66_2 and 0 or 60)
			arg_66_0.view.widgets.getRewardButton:setVisible(not var_66_2)
			arg_66_0.view.widgets.node_drink:setVisible(false)

			if var_66_2 then
				arg_66_0.view.widgets.npcBg:setVisible(false)
				arg_66_0:onGetDrinkReward()
			else
				arg_66_0.view.widgets.npcBg:setVisible(true)
			end
		end
	else
		arg_66_0.view.widgets.flagNum:setString(language.get(135039, arg_66_1.flagNum))
		arg_66_0.view.widgets.node_hammer:setVisible(arg_66_1.openHammerReward)

		if arg_66_1.openHammerReward then
			arg_66_0.view.widgets.hammerNum:setString(language.get(135039, arg_66_1.curHammerNum))
		end

		local var_66_5 = arg_66_1.iconType == 0 and arg_66_1.received == 0

		arg_66_0.view.widgets.lastRankTitlePic:setVisible(var_66_5)
		arg_66_0.view.widgets.lastRankAtlas:setVisible(var_66_5)
		arg_66_0.view.widgets.todayRankTitlePic1:setVisible(not var_66_5)
		arg_66_0.view.widgets.btn_reward:setVisible(var_66_5)
		arg_66_0.view.widgets.btn_giveUp:setVisible(var_66_5 and (arg_66_1.button == 2 or arg_66_1.button == 3))
		arg_66_0.view.widgets.node_gold:setVisible(var_66_5 and (arg_66_1.button == 2 or arg_66_1.button == 3))

		if var_66_5 then
			arg_66_0.view.widgets.lastRankAtlas:setString(arg_66_1.lastRank)
			arg_66_0.view.widgets.node_reward:setVisible(true)

			local var_66_6 = {
				92013,
				111048,
				111049
			}

			arg_66_0.view.widgets.lbl_btnReward:setString(language.get(var_66_6[arg_66_1.button]))
			arg_66_0.view.widgets.icon_charge:setVisible(arg_66_1.button == 3)

			local var_66_7

			if arg_66_1.button == 2 then
				var_66_7 = arg_66_1.goldDouble
			elseif arg_66_1.button == 3 then
				var_66_7 = arg_66_1.goldTriple
			end

			if var_66_7 ~= nil then
				arg_66_0.view.widgets.gold:setString(var_66_7)
			end
		else
			local var_66_8 = arg_66_1.rank > 0

			if var_66_8 then
				arg_66_0.view.widgets.todayRankAtlas1:setString(arg_66_1.rank)
			end

			arg_66_0.view.widgets.noRankTitlePic1:setVisible(not var_66_8)
			arg_66_0.view.widgets.todayRankAtlas1:setVisible(var_66_8)
			arg_66_0.view.widgets.node_reward:setVisible(var_66_8)
			arg_66_0.view.widgets.info_noRank:setVisible(not var_66_8)
		end

		if arg_66_0.view.widgets.node_reward:isVisible() then
			if arg_66_1.lastFarmReformDrawing and arg_66_1.lastFarmReformDrawing > 0 or arg_66_1.farmReformDrawing and arg_66_1.farmReformDrawing > 0 then
				if arg_66_0.isBigFeat == true then
					arg_66_0.view.widgets.firstRewardIcon:setDisplayFrame(tool.spriteFrameByName("res_icon_149.png"))
				else
					arg_66_0.view.widgets.firstRewardIcon:setDisplayFrame(CCSprite:create("res/ui/resourceArea2/tuzhi.jpg"):displayFrame())
				end

				arg_66_0.view.widgets.copperNum:setString(var_66_5 and arg_66_1.lastFarmReformDrawing or arg_66_1.farmReformDrawing)
			else
				if arg_66_0.isBigFeat == true then
					arg_66_0.view.widgets.firstRewardIcon:setDisplayFrame(tool.spriteFrameByName("res_icon_1.png"))
				else
					arg_66_0.view.widgets.firstRewardIcon:setDisplayFrame(tool.spriteFrameByName("ying.jpg"))
				end

				arg_66_0.view.widgets.copperNum:setString(var_66_5 and arg_66_1.lastCopper or arg_66_1.copper)
			end

			arg_66_0.view.widgets.expNum:setString(var_66_5 and arg_66_1.lastExp or arg_66_1.exp)
			arg_66_0.view.widgets.ironNum:setString(var_66_5 and arg_66_1.lastIron or arg_66_1.iron)
		end
	end

	arg_66_0:updateFeatProgressBar()
	arg_66_0.view.widgets.killNumLabel:setString(language.get(135039, var_0_8(arg_66_1.killNum)))
	arg_66_0.view.widgets.stormNumLabel:setString(language.get(135039, arg_66_1.occupy))
	arg_66_0.view.widgets.assitNumLabel:setString(language.get(135039, arg_66_1.assist))
	arg_66_0.view.widgets.flagNumLabel:setString(language.get(135039, arg_66_1.cheer))

	if arg_66_1.openCityFeat and arg_66_1.openCityFeat == 1 then
		-- block empty
	else
		for iter_66_0 = 2, 4 do
			arg_66_0.view.widgets["upperRightButton" .. iter_66_0]:setEnabled(false)
		end
	end

	local var_66_9 = arg_66_1.yesterday and "gxb_tit_zrgx.png" or "gxb_tit_jrgx.png"

	arg_66_0.view.widgets.featTitlePic:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_66_9):displayFrame())
	arg_66_0.view.widgets.featValueAtlas:setString(arg_66_1.feat)
	arg_66_0.view.widgets.rich_feat:reorder()
	arg_66_0.view.widgets.featIcon:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_0_7(arg_66_1.lv)):displayFrame())
	arg_66_0.view.widgets.featIcon:setVisible(true)

	arg_66_0.advanced = arg_66_1.advanced

	if arg_66_1.ifMsQian and arg_66_1.yesterday then
		roleDialogue.control.loadSpeak(1574)
	end
end

function var_0_14.showUpperRightTip(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	log.info("should show tips ")
	arg_67_1:setHighlighted(true)

	local var_67_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_67_0:registerScriptTouchHandler(function(arg_68_0, arg_68_1, arg_68_2)
		if arg_68_0 == CCTOUCHBEGAN then
			return true
		elseif arg_68_0 == CCTOUCHMOVED then
			return true
		elseif arg_68_0 == CCTOUCHENDED then
			arg_67_1:setHighlighted(false)
			pcall(var_67_0.removeFromParentAndCleanup, var_67_0, true)

			return true
		end
	end, false, true)
	var_67_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_67_0, 60000)

	local var_67_1 = 0
	local var_67_2 = 0
	local var_67_3 = {}

	uiutil.initWidgets(var_67_3, arg_67_0.tipFrame)
	var_67_0:addChild(var_67_3.widgets.tipFrame)

	if arg_67_3 then
		var_67_3.widgets.tipMsg:setDimensions(CCSizeMake(arg_67_3, 0))
	end

	var_67_3.widgets.tipMsg:setString(arg_67_2)

	local var_67_4, var_67_5 = tool.getPositionInScreen(arg_67_1)
	local var_67_6 = var_67_4 + 20
	local var_67_7 = var_67_5 - 20
	local var_67_8 = var_67_3.widgets.tipMsg:getContentSize().width
	local var_67_9 = var_67_3.widgets.tipMsg:getContentSize().height

	var_67_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_67_8 + 30, var_67_9 + 30))
	var_67_3.widgets.tipFrame:setPosition(ccp(var_67_6, var_67_7))
	var_67_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_67_3.widgets.tipFrame:setVisible(true)
end

function var_0_14.ctor(arg_69_0, arg_69_1, arg_69_2)
	rmgr.loadResource("res/ui/rankInfo/DailyFeatView/DailyFeatView.plist")

	arg_69_0.view = {}

	uiutil.initWidgets(arg_69_0.view, arg_69_0.layout)

	if arg_69_1 then
		arg_69_0:addChild(arg_69_0.view.widgets.root)
		arg_69_1:addChild(arg_69_0)
	end

	for iter_69_0 = 1, 4 do
		local var_69_0 = arg_69_0.view.widgets["upperRightButton" .. iter_69_0]

		var_69_0:addHandleOfControlEvent(function()
			log.info("upperRightButton" .. iter_69_0)

			local var_70_0

			if iter_69_0 == 1 then
				if arg_69_0.info.tips then
					var_70_0 = language.get(111003, var_0_8(arg_69_0.info.needKillNum), arg_69_0.info.needFeat + arg_69_0.info.feat)
				else
					var_70_0 = language.get(111038, var_0_8(arg_69_0.info.needKillNum))
				end
			elseif iter_69_0 == 2 then
				var_70_0 = language.get(111004, arg_69_0.info.occupyFeat)
			elseif iter_69_0 == 3 then
				var_70_0 = language.get(111005, arg_69_0.info.assistFeat)
			elseif iter_69_0 == 4 then
				var_70_0 = language.get(111006, arg_69_0.info.cheerFeat)
			end

			arg_69_0:showUpperRightTip(var_69_0, var_70_0)
		end, CCControlEventTouchUpInside)
	end

	for iter_69_1 = 1, 1 do
		arg_69_0.view.widgets["openBoxButton" .. iter_69_1]:addHandleOfControlEvent(function()
			log.info("openBoxButton" .. iter_69_1)
			arg_69_0:onGetBoxReward(iter_69_1)
		end, CCControlEventTouchUpInside)
	end

	arg_69_0.view.widgets.getRewardButton:addHandleOfControlEvent(function()
		log.info("getRewardButton")
		arg_69_0:onGetRankReward()
	end, CCControlEventTouchUpInside)

	local var_69_1 = CCLayerColor:create(ccc4(0, 0, 0, 0), 910, 438)
	local var_69_2 = CCScrollView:create(CCSizeMake(910, 438), var_69_1)

	var_69_2:setPosition(ccp(0, 0))
	var_69_2:setTouchEnabled(false)
	arg_69_0.view.widgets.featBg:addChild(var_69_2, 10)
	swallowTouch(var_69_1)
	uiutil.initWidgets(arg_69_0.view, arg_69_0.layout_bg_rank)
	var_69_1:addChild(arg_69_0.view.widgets.bg_rank)
	var_69_1:setPosition(ccp(0, -382))

	arg_69_0.rankLayer = var_69_1

	local var_69_3 = arg_69_0.view.widgets.todayRankTitlePic:getContentSize().width
	local var_69_4, var_69_5 = arg_69_0.view.widgets.todayRankTitlePic:getPosition()

	arg_69_0.view.widgets.noRankTitlePic:setPositionX(15 + var_69_4 + var_69_3)
	arg_69_0.view.widgets.todayRankAtlas:setPositionX(15 + var_69_4 + var_69_3)
	arg_69_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		local var_73_0 = arg_69_0.view.widgets.btn_show:getScale()

		if var_73_0 > 0 and arg_69_0.rankList then
			arg_69_0.rankList:setContentOffset(ccp(0, arg_69_0.rankList:minContainerOffset().y))
			arg_69_0.rankList:setVisible(true)
		end

		local var_73_1 = CCArray:create()

		var_73_1:addObject(CCMoveTo:create(0.5, ccp(0, var_73_0 > 0 and 0 or -382)))
		var_73_1:addObject(CCCallFuncN:create(function()
			arg_69_0.view.widgets.btn_show:setScale(-1 * var_73_0)
			arg_69_0.view.widgets.btn_show:setEnabled(true)

			if arg_69_0.rankList then
				arg_69_0.rankList:setVisible(var_73_0 > 0)
			end
		end))

		local var_73_2 = CCSequence:create(var_73_1)

		arg_69_0.rankLayer:runAction(var_73_2)
	end, CCControlEventTouchUpInside)

	local var_69_6 = CCArray:create()

	var_69_6:addObject(CCFadeIn:create(0.3))
	var_69_6:addObject(CCFadeOut:create(0.3))

	local var_69_7 = CCSequence:create(var_69_6)

	arg_69_0.view.widgets.light_drink:runAction(CCRepeatForever:create(var_69_7))

	arg_69_0.initialized = false

	if arg_69_2 then
		arg_69_0:showPanel(arg_69_2)
	else
		arg_69_0:refresh()
	end

	arg_69_0:onGetPlayerRank()
end

function var_0_14.onEnter(arg_75_0)
	arg_75_0.touchCount = 0
	arg_75_0.touchBeganRef = handler(arg_75_0, arg_75_0.onTouchBegan)
	arg_75_0.touchMovedRef = handler(arg_75_0, arg_75_0.onTouchMoved)
	arg_75_0.touchEndedRef = handler(arg_75_0, arg_75_0.onTouchEnded)
	arg_75_0.touchCancelledRef = handler(arg_75_0, arg_75_0.onTouchCancelled)
	arg_75_0.handlerPushJungong = handler(arg_75_0, arg_75_0.handlerPushJungongEventAction)

	eventManager.registerEvent("globalOnTouchBegan", arg_75_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_75_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_75_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_75_0.touchCancelledRef)
	cmgr.registerResponseHandler(actions.pushForceTask, arg_75_0.handlerPushJungong)
end

function var_0_14.onExit(arg_76_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_76_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_76_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_76_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_76_0.touchCancelledRef)
	cmgr.unregisterResponseHandler(actions.pushForceTask, arg_76_0.handlerPushJungong)
end

function var_0_14.onTouchBegan(arg_77_0, arg_77_1, arg_77_2)
	arg_77_0.isTouchOn = true
end

function var_0_14.onTouchMoved(arg_78_0, arg_78_1, arg_78_2)
	return
end

function var_0_14.onTouchEnded(arg_79_0, arg_79_1, arg_79_2)
	if arg_79_0.isTouchOn and arg_79_0.touchCount > 0 then
		arg_79_0.touchCount = arg_79_0.touchCount + 1

		local var_79_0 = false
		local var_79_1 = 0
		local var_79_2

		if arg_79_0.info.iconType == 1 then
			if arg_79_0.touchCount == 2 then
				arg_79_0.touchCount = 0
				var_79_1 = 1

				function var_79_2()
					arg_79_0:refresh()
				end
			end
		elseif arg_79_0.info.iconType == 2 then
			if arg_79_0.touchCount == 2 then
				var_79_1 = 1

				if arg_79_0.drinkReward.battleFlagNum > 0 then
					function var_79_2()
						arg_79_0:onTouchEnded()
					end
				else
					arg_79_0.touchCount = 0

					function var_79_2()
						arg_79_0:refresh()
					end
				end
			elseif arg_79_0.touchCount == 3 then
				var_79_0 = true

				arg_79_0.view.widgets.npcMsg:setString(language.get(111036))
			elseif arg_79_0.touchCount == 4 then
				var_79_1 = 2

				function var_79_2()
					arg_79_0:onTouchEnded()
				end
			elseif arg_79_0.touchCount == 5 then
				var_79_0 = true

				arg_79_0.view.widgets.npcMsg:setString(language.get(111037))
			elseif arg_79_0.touchCount == 6 then
				arg_79_0.touchCount = 0

				arg_79_0.view.widgets.npcBg:setVisible(false)
				arg_79_0:refresh()
			end
		end

		arg_79_0.view.widgets.npcMsg:setVisible(var_79_0)
		arg_79_0.view.widgets.node_drink:setVisible(not var_79_0)

		if not var_79_0 and var_79_1 ~= 0 then
			local var_79_3 = var_79_1 == 1 and "gxb_box_purple.jpg" or "gxb_shuaiqi.jpg"
			local var_79_4 = var_79_1 == 1 and arg_79_0.drinkReward.featBoxNum or arg_79_0.drinkReward.battleFlagNum

			arg_79_0.view.widgets.icon_drink:setDisplayFrame(CCSprite:create("res/ui/rankInfo/DailyFeatView/" .. var_79_3):displayFrame())
			arg_79_0.view.widgets.num_drink:setString(var_79_4)
			arg_79_0.view.widgets.drinkButton:addHandleOfControlEvent(function()
				log.info("drinkButton")

				if var_79_2 then
					var_79_2()
				end

				local var_84_0 = {}
				local var_84_1 = {
					id = var_79_1 == 1 and 10031 or 10032,
					value = var_79_4
				}

				table.insert(var_84_0, var_84_1)
				globalAction_gotResource(var_84_0)
			end, CCControlEventTouchUpInside)
		end
	end

	arg_79_0.isTouchOn = false
end

function var_0_14.onTouchCancelled(arg_85_0, arg_85_1, arg_85_2)
	arg_85_0.isTouchOn = false
end

return var_0_14
