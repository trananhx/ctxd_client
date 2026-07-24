local var_0_0 = false
local var_0_1 = tool.hexToRgb("#D9EDC5")
local var_0_2 = ccc3(0, 180, 0)
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = {
	"yxhd_tit_szdd",
	"yxhd_tit_xmyz",
	"yxhd_tit_lthy",
	"yxhd_tit_fjcy",
	"yxhd_tit_dbkf"
}
local var_0_7 = 100
local var_0_8 = 200
local var_0_9 = 300
local var_0_10 = 400
local var_0_11 = 500
local var_0_12 = 2
local var_0_13 = 3
local var_0_14 = 10
local var_0_15 = {
	nil,
	nil,
	3,
	4,
	6,
	[113] = 2003,
	freeHuanyin = 41,
	[42] = 5,
	[102] = 41,
	[116] = 55,
	[101] = 15,
	[21] = 7,
	[100] = 100,
	[119] = 10033,
	xinlian = 15,
	[81] = 24,
	[47] = 10069,
	[126] = 10030,
	[216] = 216
}
local var_0_16 = class("Lantern", function()
	return createBaseLayer()
end)

var_0_16.layout = {
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
			color = var_0_3,
			zorder = var_0_11
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
					color = var_0_1
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
			zorder = var_0_8
		},
		{
			y = 0,
			name = "node_main",
			visible = false,
			type = "node",
			x = 0,
			zorder = var_0_8,
			children = {
				{
					x = 457.5,
					y = 266,
					type = "sprite",
					pic = {
						path = "res/ui/activity/lantern/xbcty_bg.jpg"
					}
				},
				{
					y = 350,
					x = 240,
					type = "node",
					children = {
						{
							x = 0,
							y = 80,
							type = "sprite",
							pic = {
								path = "res/ui/activity/lantern/xbcty_word_ffjl.png"
							}
						},
						{
							x = 0,
							y = 0,
							type = "sprite",
							pic = {
								path = "res/ui/activity/lantern/dwhd_zz_j.png"
							}
						},
						{
							fontSize = 30,
							name = "godTimes",
							y = -15,
							type = "label",
							x = 60,
							color = var_0_1,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = -65,
							name = "richLine1",
							anchorPointX = 0.5,
							type = "richLine",
							gap = 0,
							x = 0,
							content = {
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_yc.png"
									}
								},
								{
									text = "0",
									name = "alreadyGoldBowl",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/gjms_tit_yong_digit.png",
									itemHeight = 27
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_wan.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_eat1",
							h = 62,
							type = "button",
							w = 195,
							y = -125,
							x = 0,
							normal = {
								path = "res/ui/common/button/public_btn_orange.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_orange_c.png"
							},
							children = {
								{
									y = 34,
									type = "sprite",
									x = 48,
									pic = {
										path = "res/ui/common/button/public_btn_gold.png"
									},
									children = {
										{
											y = 35,
											name = "icon_godGold",
											type = "sprite",
											scale = 0.6,
											x = 42,
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 22,
											name = "godGold",
											y = 15,
											type = "label",
											style = "label_warlock",
											x = 42,
											color = var_0_4
										}
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									y = 34,
									type = "label",
									x = 125,
									textId = 136125,
									color = var_0_1,
									color = var_0_1
								}
							}
						},
						{
							w = 42,
							name = "btn_ten",
							h = 39,
							type = "button",
							y = -175,
							x = -60,
							normal = {
								path = "res/ui/playerInfo/setting/unite_view_a.png"
							},
							touched = {
								path = "res/ui/playerInfo/setting/unite_view_on.png"
							}
						},
						{
							fontSize = 24,
							y = -175,
							type = "label",
							x = -40,
							textId = "202107_zww",
							color = var_0_1,
							color = var_0_1,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					y = 350,
					x = 675,
					type = "node",
					children = {
						{
							x = 0,
							y = 80,
							type = "sprite",
							pic = {
								path = "res/ui/activity/lantern/xbcty_word_xsbp.png"
							}
						},
						{
							x = 0,
							y = 0,
							type = "sprite",
							pic = {
								path = "res/ui/activity/lantern/dwhd_zz_gj.png"
							}
						},
						{
							fontSize = 30,
							name = "freeRound",
							y = -15,
							type = "label",
							x = 60,
							color = var_0_1,
							anchorPoint = ccp(0, 0.5)
						},
						{
							y = -65,
							name = "richLine2",
							anchorPointX = 0.5,
							type = "richLine",
							gap = 0,
							x = 0,
							content = {
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_yc.png"
									}
								},
								{
									text = "0",
									name = "alreadyRound",
									startCharMap = 48,
									type = "atlaslabel",
									itemWidth = 22,
									pic = "res/ui/common/number/gjms_tit_yong_digit.png",
									itemHeight = 27
								},
								{
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_lun.png"
									}
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_eat2",
							h = 62,
							type = "button",
							w = 195,
							y = -125,
							x = 0,
							normal = {
								path = "res/ui/common/button/public_btn_orange.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_orange_c.png"
							},
							children = {
								{
									y = 34,
									type = "sprite",
									x = 48,
									pic = {
										path = "res/ui/common/button/public_btn_gold.png"
									},
									children = {
										{
											y = 35,
											name = "icon_gold",
											type = "sprite",
											scale = 0.6,
											x = 42,
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 22,
											name = "gold",
											y = 15,
											type = "label",
											style = "label_warlock",
											x = 42,
											color = var_0_4
										}
									}
								},
								{
									fontSize = 24,
									style = "label_warlock",
									y = 34,
									type = "label",
									x = 125,
									textId = 136125,
									color = var_0_1,
									color = var_0_1
								}
							}
						}
					}
				},
				{
					y = 80,
					type = "sprite",
					x = 457.8,
					pic = {
						path = "res/ui/activity/lantern/xbcty_bar_di.png"
					},
					children = {
						{
							y = 15,
							name = "bar",
							type = "progressbar",
							x = 392,
							pic = {
								path = "res/ui/activity/lantern/xbcty_bar.png"
							}
						},
						{
							y = 0,
							x = 264,
							type = "node",
							children = {
								{
									name = "num1",
									type = "atlaslabel",
									pic = "res/ui/common/number/lm_tit_num.png",
									startCharMap = 48,
									text = "0",
									y = 54,
									itemWidth = 22,
									x = 6,
									itemHeight = 32,
									anchorPoint = ccp(1, 0.5)
								},
								{
									h = 100,
									name = "btn_box1",
									zoomOnTouchDown = true,
									type = "button",
									w = 100,
									y = 50,
									x = 32,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											x = 50,
											name = "box1",
											y = 50,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png"
											}
										}
									}
								},
								{
									x = 0,
									y = -26,
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_jjyw.png"
									}
								}
							}
						},
						{
							y = 0,
							x = 520,
							type = "node",
							children = {
								{
									name = "num2",
									type = "atlaslabel",
									pic = "res/ui/common/number/lm_tit_num.png",
									startCharMap = 48,
									text = "0",
									y = 54,
									itemWidth = 22,
									x = 6,
									itemHeight = 32,
									anchorPoint = ccp(1, 0.5)
								},
								{
									h = 100,
									name = "btn_box2",
									zoomOnTouchDown = true,
									type = "button",
									w = 100,
									y = 50,
									x = 32,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											x = 50,
											name = "box2",
											y = 50,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png"
											}
										}
									}
								},
								{
									x = 0,
									y = -26,
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_dkdy.png"
									}
								}
							}
						},
						{
							y = 0,
							x = 776,
							type = "node",
							children = {
								{
									name = "num3",
									type = "atlaslabel",
									pic = "res/ui/common/number/lm_tit_num.png",
									startCharMap = 48,
									text = "0",
									y = 54,
									itemWidth = 22,
									x = -42,
									itemHeight = 32,
									anchorPoint = ccp(1, 0.5)
								},
								{
									h = 100,
									name = "btn_box3",
									zoomOnTouchDown = true,
									type = "button",
									w = 100,
									y = 50,
									x = -16,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											x = 50,
											name = "box3",
											y = 50,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png"
											}
										}
									}
								},
								{
									x = 0,
									y = -26,
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_word_jzfb.png"
									}
								}
							}
						}
					}
				},
				{
					x = 100,
					y = 120,
					type = "sprite",
					pic = {
						path = "res/ui/activity/lantern/xbcty_word_jrxq.png"
					}
				},
				{
					name = "totalBowl",
					type = "atlaslabel",
					pic = "res/ui/common/number/gphb_word_digit.png",
					startCharMap = 48,
					text = "0",
					y = 40,
					itemWidth = 28,
					x = 100,
					itemHeight = 33,
					anchorPoint = ccp(0.5, 0.5)
				}
			}
		},
		{
			y = 490,
			name = "title1",
			frameGapVertical = 15,
			type = "sprite9Tips",
			frameGapHorizontal = 20,
			visible = false,
			x = 458,
			zorder = var_0_9,
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
						path = "res/ui/activity/lantern/qmhd_word_dwczzds.png"
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
			zorder = var_0_9
		},
		{
			y = 130,
			name = "finalEatNum",
			visible = false,
			type = "node",
			x = 360,
			zorder = var_0_11,
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
						path = "yxhd_tit_w.png"
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
			zorder = var_0_11,
			children = {
				{
					zoomOnTouchDown = true,
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
							y = 34,
							type = "sprite",
							x = 48,
							pic = {
								path = "res/ui/common/button/public_btn_gold.png"
							},
							children = {
								{
									y = 35,
									name = "icon_gold2",
									type = "sprite",
									scale = 0.6,
									x = 42,
									pic = {
										path = "res/ui/activity/ironRotary/yuanbao.png"
									}
								},
								{
									fontSize = 22,
									name = "gold2",
									y = 15,
									type = "label",
									style = "label_warlock",
									x = 42,
									color = var_0_4
								}
							}
						},
						{
							fontSize = 24,
							style = "label_warlock",
							y = 34,
							type = "label",
							x = 125,
							textId = 136126,
							color = var_0_1,
							color = var_0_1
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
							fontSize = 24,
							style = "label_warlock",
							y = 34,
							type = "label",
							x = 97,
							textId = 136369,
							color = var_0_1
						}
					}
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
			zorder = var_0_10
		},
		{
			y = 320,
			name = "node_box",
			scale = 2.5,
			type = "node",
			visible = false,
			x = 458,
			zorder = var_0_11,
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
			y = 495,
			name = "title2",
			visible = false,
			type = "node",
			x = 458,
			zorder = var_0_11,
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
			type = "sprite",
			name = "info_end",
			x = 457.5,
			visible = false,
			y = 266,
			pic = {
				path = "res/ui/activity/lantern/xbcty_word_jrdsyjs.png"
			}
		},
		{
			y = 3,
			name = "ScrollView",
			type = "scrollview",
			x = 3,
			zorder = var_0_11,
			viewSize = CCSizeMake(909, 480),
			children = {
				{
					y = 0,
					x = 0,
					type = "node",
					children = {
						{
							y = 256,
							name = "bg_list",
							type = "sprite9",
							x = 1152,
							preferedSize = CCSizeMake(590, 400),
							middleRect = CCRectMake(50, 50, 320, 362),
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_list_bg.png"
							},
							children = {
								{
									y = 376,
									x = 104,
									type = "sprite",
									pic = {
										path = "res/ui/activity/muNiu/mnlm_phb_word_pm.png"
									}
								},
								{
									y = 376,
									x = 252,
									type = "sprite",
									pic = {
										path = "res/ui/activity/muNiu/mnlm_phb_word_mh.png"
									}
								},
								{
									y = 376,
									x = 466,
									type = "sprite",
									pic = {
										path = "res/ui/activity/muNiu/mnlm_phb_word_jl.png"
									}
								},
								{
									y = 232,
									x = 26,
									type = "sprite",
									pic = {
										path = "res/ui/activity/lantern/xbcty_ranking_title_dwwphb.png"
									}
								},
								{
									type = "button",
									name = "btn_show",
									h = 50,
									rotate = -90,
									w = 50,
									y = 50,
									x = 26,
									normal = {
										path = "res/ui/common/button/gxb_btn_small.png"
									},
									touched = {
										path = "res/ui/common/button/gxb_btn_small_c.png"
									}
								},
								{
									type = "sprite",
									y = 376,
									x = 160,
									scaleY = 0.28,
									pic = {
										path = "res/ui/general/jailView/comm_tanchu_list_laofang_1.png"
									}
								},
								{
									type = "sprite",
									y = 376,
									x = 344,
									scaleY = 0.28,
									pic = {
										path = "res/ui/general/jailView/comm_tanchu_list_laofang_1.png"
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
var_0_16.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}
var_0_16.rankCell = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/activity/muNiu/mnlm_phb_list_01.png"
	},
	children = {
		{
			y = 22,
			name = "rank1st",
			type = "sprite",
			x = 54,
			pic = {
				path = "res/ui/kfyz/yuyue/kfyz_word_bs.png"
			}
		},
		{
			y = 22,
			name = "bg_rank",
			type = "sprite",
			x = 54,
			pic = {
				path = "res/ui/activity/muNiu/mnlm_phb_numb_bg.png"
			},
			children = {
				{
					fontSize = 22,
					name = "rank",
					y = 14,
					type = "label",
					x = 24,
					color = var_0_1
				}
			}
		},
		{
			fontSize = 22,
			name = "force",
			y = 22,
			type = "label",
			x = 140,
			anchorPoint = ccp(1, 0.5)
		},
		{
			fontSize = 22,
			name = "name",
			type = "label",
			y = 22,
			x = 140,
			zorder = 100,
			anchorPoint = ccp(0, 0.5),
			color = var_0_1
		},
		{
			x = 355,
			y = 22,
			type = "sprite",
			scale = 0.3,
			color = var_0_1,
			pic = {
				path = "res/ui/activity/lantern/dwhd_zz_j.png"
			}
		},
		{
			fontSize = 22,
			name = "goldBowl",
			type = "label",
			y = 22,
			x = 385,
			anchorPoint = ccp(0, 0.5),
			color = var_0_1
		},
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 50,
			type = "button",
			w = 50,
			y = 22,
			visible = false,
			x = 470,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					type = "sprite",
					name = "light",
					y = 25,
					visible = false,
					x = 25,
					pic = {
						path = "res/ui/activity/muNiu/mnlm_icon_bg.png"
					}
				},
				{
					y = 25,
					x = 25,
					type = "sprite",
					scale = 0.5,
					pic = {
						frame = true,
						path = "nianfengrenshou.jpg"
					}
				}
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn1",
			h = 50,
			type = "button",
			w = 50,
			y = 22,
			visible = false,
			x = 510,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					type = "sprite",
					name = "light1",
					y = 25,
					visible = false,
					x = 25,
					pic = {
						path = "res/ui/activity/muNiu/mnlm_icon_bg.png"
					}
				},
				{
					y = 25,
					x = 25,
					type = "sprite",
					scale = 0.5,
					pic = {
						frame = true,
						path = "ytbd.jpg"
					}
				}
			}
		}
	}
}

local function var_0_17(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0[arg_2_1]
	local var_2_1 = #arg_2_0
	local var_2_2 = 458 + 180 * (arg_2_1 - 1) - (var_2_1 - 1) * 90
	local var_2_3 = CCSprite:createWithSpriteFrameName("yxhd_tit_w.png")
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
				color = var_0_1
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
					path = "yxhd_tit_w.png"
				},
				x = var_2_6
			}
		}
	}
end

function var_0_16.refresh(arg_3_0, arg_3_1)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)

		if arg_3_1 then
			arg_3_1()
		end
	end

	cmgr.sendRequest(var_3_0, actions.getNewLanternActivity)
end

function var_0_16.onEatLantern(arg_5_0, arg_5_1)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		if var_6_0.rewards then
			local var_6_1 = {}

			for iter_6_0 = 1, #var_6_0.rewards do
				local var_6_2 = {
					id = var_0_15[var_6_0.rewards[iter_6_0].type or var_6_0.rewards[iter_6_0].pic]
				}

				var_6_2.id = var_6_2.id or 3
				var_6_2.value = var_6_0.rewards[iter_6_0].value

				table.insert(var_6_1, var_6_2)
			end

			globalAction_gotResource(var_6_1)
		end

		local var_6_3 = tolua.cast(arg_5_0.bowl[arg_5_1].obj, "CCSprite")

		var_6_3:setDisplayFrame(tool.spriteFrameByName("dwhd_zy.png"))

		local var_6_4 = CCArray:create()
		local var_6_5 = CCFadeOut:create(0.1)
		local var_6_6 = CCMoveBy:create(0.1, ccp(0, -40))

		var_6_4:addObject(CCSpawn:createWithTwoActions(var_6_5, var_6_6))
		var_6_4:addObject(CCCallFuncN:create(function()
			var_6_3:removeFromParentAndCleanup(true)
			table.remove(arg_5_0.bowl, arg_5_1)
			arg_5_0:refresh()
		end))

		local var_6_7 = CCSequence:create(var_6_4)

		var_6_3:runAction(var_6_7)
	end

	cmgr.sendRequest(var_5_0, actions.newLanternEat2017)
end

function var_0_16.onGetLanternReward(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data
		local var_9_1 = {}

		for iter_9_0 = 1, #var_9_0.rewards do
			local var_9_2 = {
				id = var_0_15[var_9_0.rewards[iter_9_0].type or var_9_0.rewards[iter_9_0].pic]
			}

			var_9_2.id = var_9_2.id or 3
			var_9_2.value = var_9_0.rewards[iter_9_0].value

			table.insert(var_9_1, var_9_2)
		end

		globalAction_gotResource(var_9_1)

		arg_8_0.info.state = 1

		if arg_8_1 then
			arg_8_0:refresh()
		end

		arg_8_0:setBtnBoxEnabled(false)
	end

	cmgr.sendRequest(var_8_0, actions.getNewLanternReward)
end

function var_0_16.onGetLanternBigGift(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0)
		local var_11_0 = {}
		local var_11_1 = {
			id = arg_10_1 == 0 and 10021 or 10070
		}

		var_11_1.value = 1

		table.insert(var_11_0, var_11_1)
		globalAction_gotResource(var_11_0)
		arg_10_0:onGetNewLanternRankInfo()
	end

	cmgr.sendRequest(var_10_0, actions.getNewLanternBigGift, arg_10_1)
end

function var_0_16.onStartEatLantern(arg_12_0)
	local function var_12_0(arg_13_0)
		arg_12_0:refresh()
	end

	if arg_12_0.info.freeRound > 0 then
		cmgr.sendRequest(var_12_0, actions.startEatNewLantern)
	else
		messageBox.showChargeWin("", language.get(160216, arg_12_0.info.gold), "newLanternEatRound", function()
			cmgr.sendRequest(var_12_0, actions.startEatNewLantern)
		end)
	end
end

function var_0_16.onEatGoldSoupball(arg_15_0)
	local var_15_0 = var_0_0 and 10 or 1
	local var_15_1

	local function var_15_2(arg_16_0)
		local var_16_0 = arg_16_0.action.data
		local var_16_1 = {}

		for iter_16_0 = 1, #var_16_0.rewards do
			local var_16_2 = {
				id = var_0_15[var_16_0.rewards[iter_16_0].type or var_16_0.rewards[iter_16_0].pic]
			}

			var_16_2.id = var_16_2.id or 3
			var_16_2.value = var_16_0.rewards[iter_16_0].value

			table.insert(var_16_1, var_16_2)
		end

		globalAction_gotResource(var_16_1)

		if var_16_0.critical == 2 or var_16_0.critical == 4 or var_16_0.critical == 10 then
			local var_16_3 = CCSprite:create(string.format("res/ui/activity/ironReward/js_bj_%d.png", var_16_0.critical))
			local var_16_4, var_16_5 = tool.getPositionInScreen(arg_15_0.view.widgets.btn_eat1)

			var_16_3:setPosition(var_16_4, var_16_5 + 130)
			arg_15_0:showEffectBaoji(var_16_3)
		end

		var_15_0 = var_15_0 - 1

		if var_15_0 > 0 then
			arg_15_0:refresh(var_15_1)
		else
			arg_15_0:refresh()
		end
	end

	function var_15_1()
		if arg_15_0.info.godTimes > 0 then
			cmgr.sendRequest(var_15_2, actions.eatGoldSoupball)
		else
			messageBox.showChargeWin("", language.get(202105, arg_15_0.info.godGold), "newLanternBuyGodSoupball", function()
				cmgr.sendRequest(var_15_2, actions.eatGoldSoupball)
			end)
		end
	end

	if var_15_0 > 0 then
		var_15_1()
	end
end

function var_0_16.onGetNewLanternRankInfo(arg_19_0)
	local function var_19_0(arg_20_0)
		arg_19_0:createRankList(arg_20_0.action.data)
	end

	cmgr.sendRequest(var_19_0, actions.getNewLanternRankInfo)
end

function var_0_16.showStreamEffect(arg_21_0, arg_21_1)
	local var_21_0 = CCSprite:create()

	arg_21_1:addChild(var_21_0)
	var_21_0:setTag(888)
	var_21_0:setPosition(ccp(90, 150))

	local var_21_1 = CCArray:create()

	for iter_21_0 = 1, 9 do
		local var_21_2 = CCSprite:createWithSpriteFrameName(string.format("yxhd_rq%02d.png", iter_21_0))

		var_21_1:addObject(var_21_2:displayFrame())
	end

	local var_21_3 = CCAnimation:createWithSpriteFrames(var_21_1, 0.1)
	local var_21_4 = CCAnimate:create(var_21_3)

	var_21_4:retain()
	var_21_0:runAction(CCRepeatForever:create(var_21_4))
end

function var_0_16.addLanternBowl(arg_22_0, arg_22_1)
	arg_22_0.bowl = {}

	if arg_22_0.bowlNode then
		arg_22_0.bowlNode:removeAllChildrenWithCleanup(true)
	else
		arg_22_0.bowlNode = CCNode:create()

		arg_22_0.view.widgets.panel:addChild(arg_22_0.bowlNode, var_0_7)
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

	for iter_22_0 = 1, arg_22_1 do
		local var_22_3 = CCSprite:createWithSpriteFrameName("dwhd_zy.png")
		local var_22_4 = table.remove(var_22_0, math.random(1, #var_22_0))

		var_22_3:setPosition(ccp(var_22_4 * 300 - 150, 55))
		arg_22_0.bowlNode:addChild(var_22_3)

		local var_22_5 = CCSprite:createWithSpriteFrameName("dwhd_zz.png")
		local var_22_6 = CCSprite:createWithSpriteFrameName("dwhd_zz.png")
		local var_22_7 = CCSprite:createWithSpriteFrameName("dwhd_zz.png")

		var_22_3:addChild(var_22_5, 1, 10003)
		var_22_5:setPosition(ccp(152, 71))
		var_22_3:addChild(var_22_6, 2, 10002)
		var_22_6:setPosition(ccp(110, 60))
		var_22_3:addChild(var_22_7, 3, 10001)
		var_22_7:setPosition(ccp(60, 50))

		if iter_22_0 == var_22_1 then
			local var_22_8 = {
				num = 0,
				obj = var_22_3,
				pos = var_22_4,
				cd = var_0_12
			}

			table.insert(arg_22_0.bowl, var_22_8)
			arg_22_0:showStreamEffect(var_22_3)

			local var_22_9 = CCArray:create()

			var_22_9:addObject(CCDelayTime:create(1))
			var_22_9:addObject(CCCallFuncN:create(function()
				var_22_8.cd = var_22_8.cd - 1

				if var_22_8.cd == 0 then
					var_22_3:stopAllActions()
					var_22_3:removeChildByTag(888, true)
				end
			end))

			local var_22_10 = CCSequence:create(var_22_9)

			var_22_3:runAction(CCRepeatForever:create(var_22_10))
		else
			table.insert(arg_22_0.bowl, {
				num = 0,
				cd = 0,
				obj = var_22_3,
				pos = var_22_4
			})
		end

		if var_22_2 then
			var_22_3:setPosition(ccp(var_22_4 * 300 - 150, 15))
			var_22_3:setOpacity(0)

			local var_22_11 = CCArray:create()
			local var_22_12 = CCFadeIn:create(0.1)
			local var_22_13 = CCMoveBy:create(0.1, ccp(0, 40))

			var_22_11:addObject(CCSpawn:createWithTwoActions(var_22_12, var_22_13))

			local var_22_14 = CCSequence:create(var_22_11)

			var_22_3:runAction(var_22_14)
		end
	end

	local var_22_15 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	arg_22_0.bowlNode:addChild(var_22_15)
	var_22_15:registerScriptTouchHandler(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == CCTOUCHBEGAN then
			log.info("CCTOUCH_BEGAN", arg_24_1, arg_24_2)

			if arg_22_0.isHot or arg_22_0.info.state ~= 2 then
				return false
			else
				for iter_24_0 = 1, #arg_22_0.bowl do
					local var_24_0 = tolua.cast(arg_22_0.bowl[iter_24_0].obj, "CCSprite")

					if arg_22_0.bowl[iter_24_0].num < var_0_13 and tool.checkIfTouch(var_24_0, arg_24_1, arg_24_2) then
						arg_22_0:showEatEffect(iter_24_0)

						return true
					end
				end
			end

			return false
		elseif arg_24_0 == CCTOUCHMOVED then
			log.info("CCTOUCH_MOVED", arg_24_1, arg_24_2)

			return true
		elseif arg_24_0 == CCTOUCHENDED then
			log.info("CCTOUCH_ENDED", arg_24_1, arg_24_2)

			return true
		end
	end, false, true)
	var_22_15:setTouchEnabled(true)
end

function var_0_16.showEatEffect(arg_25_0, arg_25_1)
	if arg_25_0.spoonNode then
		arg_25_0.spoonNode:removeAllChildrenWithCleanup(true)
	else
		arg_25_0.spoonNode = CCNode:create()

		arg_25_0.view.widgets.panel:addChild(arg_25_0.spoonNode, var_0_7 + 10)
	end

	local var_25_0 = arg_25_0.bowl[arg_25_1]
	local var_25_1 = tolua.cast(var_25_0.obj, "CCSprite")

	log.info("touchBowl, idx:%d, pos:%d", arg_25_1, var_25_0.pos)

	if var_25_0.cd > 0 then
		log.info("HOT!!!")

		local var_25_2 = CCArray:create()

		var_25_2:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
		var_25_2:addObject(CCMoveBy:create(0.1, ccp(-10, 0)))

		local var_25_3 = CCSequence:create(var_25_2)

		arg_25_0.view.widgets.playerPic:runAction(CCRepeatForever:create(var_25_3))

		arg_25_0.isHot = true

		arg_25_0.view.widgets.tipMsg:setString(language.get(135365))
		arg_25_0.view.widgets.tipFrame:setVisible(true)

		local var_25_4 = CCArray:create()

		var_25_4:addObject(CCDelayTime:create(var_0_12))
		var_25_4:addObject(CCCallFuncN:create(function()
			arg_25_0.isHot = false

			arg_25_0.view.widgets.tipMsg:setString(language.get(135369))
			arg_25_0.view.widgets.playerPic:stopAllActions()
			arg_25_0.view.widgets.playerPic:setPositionX(458)
			var_25_1:stopAllActions()
			var_25_1:removeChildByTag(888, true)
		end))
		var_25_4:addObject(CCDelayTime:create(1))
		var_25_4:addObject(CCCallFuncN:create(function()
			arg_25_0.view.widgets.tipFrame:setVisible(false)
		end))

		local var_25_5 = CCSequence:create(var_25_4)

		arg_25_0.view.widgets.tipFrame:runAction(var_25_5)

		var_25_0.cd = var_0_12
	else
		var_25_0.num = var_25_0.num + 1

		local var_25_6 = CCSprite:createWithSpriteFrameName("dwhd_hand.png")

		var_25_6:setPosition(ccp(var_25_0.pos * 300 - 30, 150))
		arg_25_0.spoonNode:addChild(var_25_6)

		local var_25_7 = CCArray:create()

		var_25_7:addObject(CCMoveBy:create(0.2, ccp(-90, -60)))
		var_25_7:addObject(CCCallFuncN:create(function()
			var_25_6:setDisplayFrame(tool.spriteFrameByName("dwhd_hand_c.png"))
		end))
		var_25_7:addObject(CCMoveBy:create(0.3, ccp(90, 60)))
		var_25_7:addObject(CCCallFuncN:create(function()
			var_25_6:removeFromParentAndCleanup(true)
		end))

		local var_25_8 = CCSequence:create(var_25_7)

		var_25_6:runAction(var_25_8)

		for iter_25_0 = 1, var_25_0.num do
			local var_25_9 = var_25_1:getChildByTag(10000 + iter_25_0)

			if var_25_9 then
				var_25_9:setVisible(false)
			end
		end

		if var_25_0.num >= var_0_13 then
			arg_25_0:onEatLantern(arg_25_1)
		end
	end
end

local function var_0_18(arg_30_0)
	log.info("getEmpytBowlNode")

	local var_30_0 = CCSpriteBatchNode:create("res/ui/activity/lantern/lanternPic2.png")

	for iter_30_0 = 1, arg_30_0 do
		local var_30_1 = CCSprite:createWithSpriteFrameName("dwhd_zy.png")

		if iter_30_0 == 1 then
			var_30_1:setDisplayFrame(tool.spriteFrameByName("dwhd_zy.png"))
			var_30_1:setPosition(ccp(0, 0))
		else
			var_30_1:setPosition(ccp(0, (iter_30_0 - 2) * 20 + 13))
		end

		var_30_1:setScale(0.8)
		var_30_0:addChild(var_30_1, 0, iter_30_0)
	end

	return var_30_0
end

function var_0_16.addEmptyBowl(arg_31_0)
	log.info("addEmptyBowl")

	if arg_31_0.emptyNode then
		arg_31_0.emptyNode:removeAllChildrenWithCleanup(true)
	else
		arg_31_0.emptyNode = CCNode:create()

		arg_31_0.view.widgets.panel:addChild(arg_31_0.emptyNode)
	end

	local var_31_0 = ccp(565, 120)
	local var_31_1 = arg_31_0.info.eatNum
	local var_31_2 = math.ceil(var_31_1 / 5)
	local var_31_3 = var_0_18(var_31_2)

	var_31_3:setPosition(var_31_0)
	var_31_3:setScaleY(0.875)
	arg_31_0.emptyNode:addChild(var_31_3)

	if var_31_1 > 0 then
		local var_31_4 = CCLabelAtlas:create("0", "res/ui/common/number/yxhd_time_digit.png", 35, 34, 47)

		var_31_4:setAnchorPoint(ccp(0.5, 0.5))
		var_31_4:setString(tostring(var_31_1))

		local var_31_5 = CCSprite:createWithSpriteFrameName("dwhd_word_ge.png")
		local var_31_6 = var_31_4:getContentSize().width
		local var_31_7 = var_31_5:getContentSize().width
		local var_31_8 = var_31_6 + var_31_7

		var_31_4:setPosition(ccp(var_31_0.x - var_31_8 / 2 + var_31_6 / 2, var_31_0.y - 20))
		var_31_5:setPosition(ccp(var_31_0.x - var_31_8 / 2 + var_31_6 + var_31_7 / 2, var_31_0.y - 20))
		arg_31_0.emptyNode:addChild(var_31_4)
		arg_31_0.emptyNode:addChild(var_31_5)
	end
end

function var_0_16.setBtnBoxEnabled(arg_32_0, arg_32_1)
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

function var_0_16.showRoundResult(arg_33_0)
	if arg_33_0.resultNode then
		arg_33_0.resultNode:removeAllChildrenWithCleanup(true)
	else
		arg_33_0.resultNode = CCNode:create()

		arg_33_0.view.widgets.panel:addChild(arg_33_0.resultNode, var_0_9)
	end

	if arg_33_0.info.title > 0 then
		if arg_33_0.info.rewardGoldBowl > 0 then
			arg_33_0:setBtnBoxEnabled(true)
			arg_33_0.view.widgets.btn_box:addHandleOfControlEvent(function()
				log.info("btn_box，领取本轮奖励")
				arg_33_0:onGetLanternReward()
			end, CCControlEventTouchUpInside)
		else
			arg_33_0:setBtnBoxEnabled(false)
		end

		arg_33_0.view.widgets.node_box:setScale(1)
		arg_33_0.view.widgets.node_box:setPosition(ccp(710, 150 + (arg_33_0.info.title - 1) * 70 + 60))
		arg_33_0.view.widgets.node_box:setVisible(true)
	end

	for iter_33_0 = 1, 5 do
		local var_33_0
		local var_33_1

		if iter_33_0 <= arg_33_0.info.title then
			var_33_0 = "yxhd_tit_bg.png"
			var_33_1 = string.format("%s.png", var_0_6[iter_33_0])
		else
			var_33_0 = "yxhd_tit_bg_g.png"
			var_33_1 = string.format("%s_g.png", var_0_6[iter_33_0])
		end

		local var_33_2 = CCSprite:createWithSpriteFrameName(var_33_0)

		var_33_2:setPosition(ccp(570, iter_33_0 * 70 + 80 + 60))
		arg_33_0.resultNode:addChild(var_33_2)

		local var_33_3 = CCSprite:createWithSpriteFrameName(var_33_1)

		var_33_3:setPosition(ccp(130, 36))
		var_33_2:addChild(var_33_3)
	end

	arg_33_0.view.widgets.finalEatNum_p2:setString(arg_33_0.info.eatNum)

	local var_33_4 = arg_33_0.view.widgets.finalEatNum_p1:getContentSize().width
	local var_33_5 = arg_33_0.view.widgets.finalEatNum_p2:getContentSize().width
	local var_33_6 = arg_33_0.view.widgets.finalEatNum_p3:getContentSize().width
	local var_33_7 = var_33_4 + var_33_5 + var_33_6

	arg_33_0.view.widgets.finalEatNum_p1:setPositionX(-var_33_7 / 2 + var_33_4 / 2)
	arg_33_0.view.widgets.finalEatNum_p2:setPositionX(-var_33_7 / 2 + var_33_4 + var_33_5 / 2)
	arg_33_0.view.widgets.finalEatNum_p3:setPositionX(-var_33_7 / 2 + var_33_4 + var_33_5 + var_33_6 / 2)
	arg_33_0.view.widgets.finalEatNum_bg:setPreferredSize(CCSizeMake(var_33_7 + 60, 64))
	arg_33_0.view.widgets.finalEatNum:setVisible(true)
	arg_33_0.view.widgets.node_continue:setVisible(true)

	local var_33_8 = 4 * arg_33_0.info.title
	local var_33_9 = var_0_18(var_33_8)

	var_33_9:setPosition(ccp(330, 185))
	var_33_9:setScaleY(0.875)
	arg_33_0.resultNode:addChild(var_33_9)

	if arg_33_0.info.haveTitleReceived == 0 then
		for iter_33_1 = 1, var_33_8 do
			local var_33_10 = var_33_9:getChildByTag(iter_33_1)

			var_33_10:setOpacity(0)

			local var_33_11 = CCArray:create()

			var_33_11:addObject(CCDelayTime:create(0.15 * (iter_33_1 - 1)))
			var_33_11:addObject(CCFadeIn:create(0.05))

			local var_33_12 = CCSequence:create(var_33_11)

			var_33_10:runAction(var_33_12)
		end
	end
end

local function var_0_19(arg_35_0)
	local var_35_0 = arg_35_0.cd / 1000
	local var_35_1 = math.floor(var_35_0 / 3600)
	local var_35_2 = var_35_0 % 3600
	local var_35_3 = math.floor(var_35_2 / 60)
	local var_35_4 = var_35_2 % 60
	local var_35_5 = ""

	if var_35_1 == 0 then
		var_35_5 = string.format("%02d:%02d", var_35_3, var_35_4)
	else
		var_35_5 = string.format("%02d:%02d:%02d", var_35_1, var_35_3, var_35_4)
	end

	if arg_35_0.state == 2 then
		var_35_5 = string.sub(var_35_5, -5)
	elseif arg_35_0.state == 3 then
		var_35_5 = language.get(135368, arg_35_0.round + 1, var_35_5)
	end

	return var_35_5
end

function var_0_16.createRankList(arg_36_0, arg_36_1)
	local function var_36_0(arg_37_0, arg_37_1)
		log.info("cell touched at : ", arg_37_1:getIdx())
	end

	local function var_36_1(arg_38_0, arg_38_1)
		return 46, 532
	end

	local function var_36_2(arg_39_0, arg_39_1)
		local var_39_0 = arg_39_0:dequeueCell()

		if var_39_0 then
			var_39_0:removeAllChildrenWithCleanup(true)
		else
			var_39_0 = CCTableViewCell:new()
		end

		local var_39_1 = arg_36_1.rankArrs[arg_39_1 + 1]

		if var_39_1 then
			local var_39_2 = {}

			uiutil.initWidgets(var_39_2, arg_36_0.rankCell)
			var_39_2.widgets.bg:setPosition(ccp(0, 2))

			if arg_39_1 % 2 == 1 then
				var_39_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/activity/muNiu/mnlm_phb_list_02.png"):displayFrame())
			end

			var_39_0:addChild(var_39_2.widgets.bg)

			local var_39_3 = var_39_1.rank == 1

			var_39_2.widgets.rank1st:setVisible(var_39_3)
			var_39_2.widgets.bg_rank:setVisible(not var_39_3)

			if not var_39_3 then
				var_39_2.widgets.rank:setString(var_39_1.rank)
			end

			var_39_2.widgets.force:setString(language.get(460037, user.forceIdToName[var_39_1.forceId]))
			var_39_2.widgets.force:setColor(colorForce[var_39_1.forceId])
			var_39_2.widgets.name:setString(language.get(121066, "", var_39_1.playerName))
			var_39_2.widgets.goldBowl:setString(var_39_1.goldBowl)

			if var_39_1.treasureInfo then
				local var_39_4 = arg_36_1.hasReward and var_39_1.playerId == user.player.playerId

				var_39_2.widgets.light:setVisible(var_39_4)

				if var_39_4 then
					arg_36_0:showEffectShake(var_39_2.widgets.btn)
				end

				local var_39_5 = var_39_1.treasureInfo

				var_39_2.widgets.btn:setVisible(true)
				var_39_2.widgets.btn:addHandleOfControlEvent(function()
					log.info("btn" .. arg_39_1)

					if var_39_4 then
						arg_36_0:onGetLanternBigGift(0)
					else
						arg_36_0:showTip(language.get(160215, var_39_5.name, var_39_5.lea, var_39_5.str), var_39_2.widgets.btn)
					end
				end, CCControlEventTouchUpInside)
			end

			if var_39_1.rank <= 5 then
				local var_39_6 = arg_36_1.hasReward1 and var_39_1.playerId == user.player.playerId

				var_39_2.widgets.light1:setVisible(var_39_6)

				if var_39_6 then
					arg_36_0:showEffectShake(var_39_2.widgets.btn1)
				end

				var_39_2.widgets.btn1:setVisible(true)
				var_39_2.widgets.btn1:addHandleOfControlEvent(function()
					log.info("btn1" .. arg_39_1)

					if var_39_6 then
						arg_36_0:onGetLanternBigGift(1)
					else
						arg_36_0:showTip(language.get(217314), var_39_2.widgets.btn1)
					end
				end, CCControlEventTouchUpInside)
			end
		end

		return var_39_0
	end

	local function var_36_3()
		local var_42_0 = arg_36_1.rankArrs

		if var_42_0 and #var_42_0 > 0 then
			return #var_42_0
		else
			return 0
		end
	end

	local var_36_4 = CCTableView:create(CCSizeMake(536, 350))

	var_36_4:setPosition(54, 4)
	var_36_4:setDirection(kCCScrollViewDirectionVertical)
	var_36_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_36_0.view.widgets.bg_list:addChild(var_36_4)

	if arg_36_0.rankList then
		arg_36_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_36_0.rankList = var_36_4

	var_36_4:registerScriptHandler(var_36_0, CCTableView.kTableCellTouched)
	var_36_4:registerScriptHandler(var_36_1, CCTableView.kTableCellSizeForIndex)
	var_36_4:registerScriptHandler(var_36_2, CCTableView.kTableCellSizeAtIndex)
	var_36_4:registerScriptHandler(var_36_3, CCTableView.kNumberOfCellsInTableView)
	var_36_4:reloadData()
end

function var_0_16.showTip(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_43_0:registerScriptTouchHandler(function(arg_44_0, arg_44_1, arg_44_2)
		if arg_44_0 == CCTOUCHBEGAN then
			return true
		elseif arg_44_0 == CCTOUCHMOVED then
			return true
		elseif arg_44_0 == CCTOUCHENDED then
			pcall(var_43_0.removeFromParentAndCleanup, var_43_0, true)

			return true
		end
	end, false, true)
	var_43_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_43_0, 60000)

	local var_43_1 = 0
	local var_43_2 = 0
	local var_43_3 = {}

	uiutil.initWidgets(var_43_3, arg_43_0.tipFrame)
	var_43_0:addChild(var_43_3.widgets.tipFrame)
	var_43_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

	local var_43_4, var_43_5 = tool.getPositionInScreen(arg_43_2)
	local var_43_6 = var_43_4 + 20
	local var_43_7 = var_43_5 + 20
	local var_43_8 = arg_43_1 or ""

	var_43_3.widgets.tipMsg:setString(var_43_8)

	local var_43_9 = var_43_3.widgets.tipMsg:getContentSize().width
	local var_43_10 = var_43_3.widgets.tipMsg:getContentSize().height

	var_43_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_43_9 + 30, var_43_10 + 30))
	var_43_3.widgets.tipFrame:setPosition(ccp(var_43_6, var_43_7))
	var_43_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_43_3.widgets.tipFrame:setVisible(true)
end

function var_0_16.showEffectShake(arg_45_0, arg_45_1)
	if not arg_45_1 or tolua.isnull(arg_45_1) then
		return
	end

	local var_45_0 = CCArray:create()

	var_45_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_45_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_45_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_45_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_45_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_45_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_45_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_45_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_45_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_45_0:addObject(CCDelayTime:create(0.4))

	local var_45_1 = CCSequence:create(var_45_0)

	arg_45_1:stopAllActions()
	arg_45_1:runAction(CCRepeatForever:create(var_45_1))
end

function var_0_16.showEffectBaoji(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	if arg_46_1 then
		arg_46_0:addChild(arg_46_1)
		arg_46_1:setScale(0.2)

		local function var_46_0()
			arg_46_0:removeChild(arg_46_1, true)

			if arg_46_2 then
				arg_46_2()
			end
		end

		local var_46_1 = CCArray:create()

		var_46_1:addObject(CCMoveBy:create(1, ccp(0, 60)))
		var_46_1:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
		var_46_1:addObject(CCScaleTo:create(0.05, 1, 1))
		var_46_1:addObject(CCDelayTime:create(0.4))

		if type(arg_46_3) == "number" and arg_46_3 > 0 then
			var_46_1:addObject(CCDelayTime:create(arg_46_3))
		end

		var_46_1:addObject(CCCallFuncN:create(var_46_0))

		local var_46_2 = CCSequence:create(var_46_1)

		arg_46_1:runAction(var_46_2)
		arg_46_1:runAction(CCScaleTo:create(0.5, 1, 1))
	end
end

function var_0_16.showPanel(arg_48_0, arg_48_1)
	arg_48_0.info = arg_48_1

	if arg_48_0.resultNode then
		arg_48_0.resultNode:removeAllChildrenWithCleanup(true)
	end

	if arg_48_0.emptyNode then
		arg_48_0.emptyNode:removeAllChildrenWithCleanup(true)
	end

	if arg_48_0.view.widgets.timer and not tolua.isnull(arg_48_0.view.widgets.timer) then
		arg_48_0.view.widgets.timer:removeFromParentAndCleanup(true)

		arg_48_0.view.widgets.timer = nil
	end

	arg_48_0.isHot = false

	arg_48_0.view.widgets.time_pic:setVisible(arg_48_1.state == 2)
	arg_48_0.view.widgets.maskLayer1:setVisible(false)
	arg_48_0.view.widgets.maskLayer2:setVisible(false)
	arg_48_0.view.widgets.playerPic:stopAllActions()
	arg_48_0.view.widgets.playerPic:setPositionX(458)
	arg_48_0.view.widgets.node_box:setVisible(false)
	arg_48_0.view.widgets.finalEatNum:setVisible(false)
	arg_48_0.view.widgets.node_continue:setVisible(false)
	arg_48_0.view.widgets.title1:setVisible(arg_48_1.state == 1)
	arg_48_0.view.widgets.title2:setVisible(false)
	arg_48_0.view.widgets.node_main:setVisible(arg_48_1.state == 1)
	arg_48_0.view.widgets.ScrollView:setVisible(arg_48_1.state ~= 2)
	arg_48_0.view.widgets.info_end:setVisible(arg_48_1.state == 4)

	if arg_48_1.state == 1 then
		arg_48_0.view.widgets.maskLayer1:setVisible(true)
		arg_48_0.view.widgets.godTimes:setString(language.get(490026, arg_48_1.godTimes))
		arg_48_0.view.widgets.alreadyGoldBowl:setString(tostring(arg_48_1.alreadyGoldBowl))
		arg_48_0.view.widgets.richLine1:reorder()

		local var_48_0 = arg_48_1.godTimes > 0

		arg_48_0.view.widgets.icon_godGold:setVisible(not var_48_0)
		arg_48_0.view.widgets.godGold:setString(var_48_0 and language.get(85060) or arg_48_1.godGold)
		arg_48_0.view.widgets.godGold:setPosition(40, var_48_0 and 25 or 15)
		arg_48_0.view.widgets.freeRound:setString(language.get(490026, arg_48_1.freeRound))
		arg_48_0.view.widgets.alreadyRound:setString(tostring(arg_48_1.alreadyRound))
		arg_48_0.view.widgets.richLine2:reorder()

		local var_48_1 = arg_48_1.freeRound > 0

		arg_48_0.view.widgets.icon_gold:setVisible(not var_48_1)
		arg_48_0.view.widgets.gold:setString(var_48_1 and language.get(136204, arg_48_1.freeRound) or arg_48_1.gold)
		arg_48_0.view.widgets.gold:setPosition(40, var_48_1 and 25 or 15)

		local var_48_2 = 0
		local var_48_3 = #arg_48_1.progressBar

		for iter_48_0, iter_48_1 in ipairs(arg_48_1.progressBar) do
			arg_48_0.view.widgets["num" .. iter_48_0]:setString(tostring(iter_48_1.num))

			local var_48_4 = arg_48_0.view.widgets["btn_box" .. iter_48_0]
			local var_48_5 = arg_48_0.view.widgets["box" .. iter_48_0]

			var_48_4:setEnabled(false)
			var_48_5:removeAllChildrenWithCleanup(true)

			if arg_48_1.totalBowl >= iter_48_1.num then
				tool.spriteToGray(var_48_5)

				var_48_2 = var_48_2 + 100 / var_48_3
			else
				var_48_4:setEnabled(true)

				local var_48_6 = iter_48_0 == 1 and 0 or arg_48_1.progressBar[iter_48_0 - 1].num

				if var_48_6 < arg_48_1.totalBowl then
					var_48_2 = var_48_2 + 100 / var_48_3 * (arg_48_1.totalBowl - var_48_6) / (iter_48_1.num - var_48_6)
				end
			end
		end

		arg_48_0.view.widgets.bar:setPercentage(var_48_2)
		arg_48_0.view.widgets.totalBowl:setString(tostring(arg_48_1.totalBowl))
	elseif arg_48_1.state == 2 then
		arg_48_0.view.widgets.round:setString(tostring(arg_48_1.round))
		arg_48_0.view.widgets.richLine_round:reorder()
		arg_48_0.view.widgets.title2:setVisible(true)

		if arg_48_1.cd > 0 then
			local var_48_7 = CCLabelAtlas:create("", "res/ui/common/number/yxhd_time_digit2.png", 35, 39, 48)

			var_48_7:setAnchorPoint(ccp(0.5, 0.5))
			var_48_7:setString(var_0_19(arg_48_1))
			arg_48_0.view.widgets.panel:addChild(var_48_7, var_0_9)
			var_48_7:setPosition(ccp(512, 445))

			arg_48_0.view.widgets.timer = var_48_7
		end

		arg_48_0:addEmptyBowl()
	elseif arg_48_1.state == 3 then
		arg_48_0:showRoundResult()
		arg_48_0.view.widgets.maskLayer1:setVisible(true)

		local var_48_8 = arg_48_1.freeRound > 0

		arg_48_0.view.widgets.icon_gold2:setVisible(not var_48_8)
		arg_48_0.view.widgets.gold2:setString(var_48_8 and language.get(136204, arg_48_1.freeRound) or arg_48_1.gold)
		arg_48_0.view.widgets.gold2:setPosition(40, var_48_8 and 25 or 15)
	elseif arg_48_1.state == 4 then
		-- block empty
	end

	if arg_48_1.state == 2 then
		if not arg_48_0.bowl or not (#arg_48_0.bowl > 0) then
			arg_48_0:addLanternBowl()
		end
	else
		arg_48_0:addLanternBowl(0)
	end

	if arg_48_1.state == 2 then
		local var_48_9 = arg_48_0.view.widgets.timer

		if var_48_9 then
			local var_48_10 = CCArray:create()

			var_48_10:addObject(CCDelayTime:create(1))
			var_48_10:addObject(CCCallFuncN:create(function()
				arg_48_1.cd = arg_48_1.cd - 1000

				if arg_48_1.cd <= 0 or arg_48_1.state == 1 and arg_48_1.after930 == 0 and arg_48_1.cd <= 900000 then
					var_48_9:removeFromParentAndCleanup(true)

					arg_48_0.view.widgets.timer = nil

					arg_48_0:refresh()
				else
					var_48_9:setString(var_0_19(arg_48_1))
				end
			end))

			local var_48_11 = CCSequence:create(var_48_10)

			var_48_9:runAction(CCRepeatForever:create(var_48_11))
		end
	end

	arg_48_0.view.widgets.leftTime:setVisible(arg_48_1.state ~= 2)
end

function var_0_16.ctor(arg_50_0, arg_50_1, arg_50_2)
	log.info("@@ 青团活动")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic.plist")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic2.plist")
	rmgr.loadResource("res/ui/activity/lantern/steam.plist")

	arg_50_0.view = {}

	uiutil.initWidgets(arg_50_0.view, arg_50_0.layout)

	arg_50_0.leftTime = arg_50_0.view.widgets.leftTime

	if arg_50_1 then
		arg_50_0:addChild(arg_50_0.view.widgets.panel)
		arg_50_1:addChild(arg_50_0)
	end

	math.randomseed(os.time())
	arg_50_0.view.widgets.ScrollView:setTouchEnabled(false)
	swallowTouch(arg_50_0.view.widgets.bg_list)
	arg_50_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		log.info("btn_show")

		local var_51_0 = arg_50_0.view.widgets.btn_show:getScale()

		log.info("scale", var_51_0)

		if var_51_0 > 0 then
			arg_50_0:onGetNewLanternRankInfo()
		end

		local var_51_1 = CCArray:create()

		var_51_1:addObject(CCMoveTo:create(0.5, ccp(var_51_0 > 0 and 613 or 1152, 256)))
		var_51_1:addObject(CCCallFuncN:create(function()
			arg_50_0.view.widgets.btn_show:setScale(-1 * var_51_0)
			arg_50_0.view.widgets.btn_show:setEnabled(true)
		end))

		local var_51_2 = CCSequence:create(var_51_1)

		arg_50_0.view.widgets.bg_list:runAction(var_51_2)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.playerPic:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerPic/player%d.png", user.player.pic)):displayFrame())
	arg_50_0.view.widgets.btn_box:setOpacity(0)

	for iter_50_0 = 1, 3 do
		local var_50_0 = arg_50_0.view.widgets["btn_box" .. iter_50_0]

		var_50_0:addHandleOfControlEvent(function()
			log.info("btn_box" .. iter_50_0)

			local var_53_0 = arg_50_0.info.progressBar[iter_50_0]

			if var_53_0 then
				arg_50_0:showTip(var_53_0.tips, var_50_0)
			end
		end, CCControlEventTouchUpInside)
	end

	var_0_0 = false

	arg_50_0.view.widgets.btn_ten:setHighlighted(var_0_0)
	arg_50_0.view.widgets.btn_ten:addHandleOfControlEvent(function()
		var_0_0 = not var_0_0

		arg_50_0.view.widgets.btn_ten:setHighlighted(var_0_0)
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_eat1:addHandleOfControlEvent(function()
		log.info("btn_eat1")
		arg_50_0:onEatGoldSoupball()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_eat2:addHandleOfControlEvent(function()
		log.info("btn_eat2")
		arg_50_0:onStartEatLantern()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_continue:addHandleOfControlEvent(function()
		log.info("btn_continue")
		arg_50_0:onStartEatLantern()
	end, CCControlEventTouchUpInside)
	arg_50_0.view.widgets.btn_rest:addHandleOfControlEvent(function()
		log.info("btn_rest")

		if arg_50_0.info.state == 3 then
			if arg_50_0.info.title == 0 then
				arg_50_0:onGetLanternReward(true)
			else
				cmgr.sendRequest(function()
					arg_50_0:refresh()
				end, actions.startEatNewLantern)
			end
		else
			arg_50_0:refresh()
		end
	end, CCControlEventTouchUpInside)
	arg_50_0:showPanel(arg_50_2)
end

return var_0_16
