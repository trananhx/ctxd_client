local var_0_0 = require("res/native/offset").get("layer.resource.silkRoad")
local var_0_1 = {
	"mulNationBuff",
	"dwxzBuff"
}
local var_0_2 = {
	[4] = {
		type = 4
	},
	[21] = {
		type = 7
	},
	[110] = {
		type = 110
	},
	[5] = {
		type = 6
	},
	[19] = {
		type = 19
	},
	[40] = {
		type = 40
	},
	[42] = {
		type = 5
	},
	[81] = {
		type = 24
	},
	[102] = {
		type = 41
	},
	[100] = {
		type = 100
	},
	[116] = {
		type = 55
	},
	[119] = {
		type = 10033
	},
	[126] = {
		type = 10030
	},
	[113] = {
		type = 2003
	}
}
local var_0_3 = {
	[0] = tool.hexToRgb("#D7D7D6"),
	tool.hexToRgb("#85C8FF"),
	tool.hexToRgb("#95FFA2"),
	tool.hexToRgb("#FFF461"),
	tool.hexToRgb("#FF8C7F"),
	(tool.hexToRgb("#E57FFF"))
}

local function var_0_4(arg_1_0)
	local var_1_0

	if arg_1_0 >= 1 and arg_1_0 <= 5 then
		var_1_0 = var_0_3[0]
	elseif arg_1_0 == 6 then
		var_1_0 = var_0_3[1]
	elseif arg_1_0 == 7 then
		var_1_0 = var_0_3[2]
	elseif arg_1_0 == 8 then
		var_1_0 = var_0_3[3]
	elseif arg_1_0 == 9 then
		var_1_0 = var_0_3[4]
	elseif arg_1_0 == 10 then
		var_1_0 = var_0_3[5]
	else
		var_1_0 = var_0_3[0]
	end

	return var_1_0
end

local var_0_5 = {
	y = 0,
	name = "Layer",
	type = "layer",
	x = 0,
	children = {
		{
			name = "sczl_bg",
			type = "sprite",
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/resource/silkroad/sczl_bg.png"
			},
			children = {
				{
					y = 475.0211,
					name = "sczl_title",
					type = "sprite",
					x = 458.3758,
					pic = {
						path = "res/ui/resource/silkroad/sczl_title.png"
					}
				},
				{
					y = 248.8575,
					name = "map",
					type = "sprite",
					x = 456.4286,
					pic = {
						path = "res/ui/resource/silkroad/sczl_map1.png"
					},
					children = {
						{
							y = 279,
							name = "startPos",
							type = "sprite",
							x = 124,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 153,
							name = "pos1",
							type = "sprite",
							x = 151,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 150,
							name = "pos2",
							type = "sprite",
							x = 361,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 226,
							name = "pos3",
							type = "sprite",
							x = 541,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 257,
							name = "pos4",
							type = "sprite",
							x = 705,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 122,
							name = "pos5",
							type = "sprite",
							x = 772,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 88,
							name = "pos6",
							type = "sprite",
							x = 782,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 78,
							name = "pos7",
							type = "sprite",
							x = 791.9999,
							pic = {
								path = "res/ui/resource/silkroad/sczl_map_o.png"
							}
						},
						{
							y = 155.3333,
							name = "car",
							type = "sprite",
							scaleX = 0.8,
							x = 158.916,
							scaleY = 0.8,
							pic = {
								path = "res/ui/resource/silkroad/car1.png"
							},
							children = {
								{
									y = 30,
									name = "car1",
									type = "sprite",
									x = 5,
									pic = {
										path = "res/ui/resource/silkroad/car_red1.png"
									}
								},
								{
									y = 101.3028,
									name = "event",
									type = "sprite",
									scaleX = 1.25,
									x = 79.4356,
									scaleY = 1.25,
									pic = {
										path = "res/ui/resource/silkroad/sczl_map_bubble_03.png"
									},
									children = {
										{
											y = 55,
											name = "eventIcon",
											visible = false,
											type = "sprite",
											x = 47.5
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "startCarpoolBtn",
									h = 44,
									type = "button",
									w = 44,
									visible = false,
									y = 30,
									x = 80,
									normal = {
										path = "res/ui/resource/silkroad/didi/pcts_btn_add.png"
									},
									touched = {
										path = "res/ui/resource/silkroad/didi/pcts_btn_c.png"
									}
								},
								{
									x = 80,
									name = "chengkeBtn",
									h = 70,
									type = "button",
									w = 70,
									y = 30,
									visible = false,
									scale = 0.8,
									normal = {
										path = "res/ui/resource/silkroad/tsbw_btn.png"
									},
									touched = {
										path = "res/ui/resource/silkroad/tsbw_btn_c.png"
									},
									children = {
										{
											y = 35,
											name = "chengkePic",
											scale = 0.8,
											type = "sprite",
											x = 34,
											pic = {
												path = "res/ui/common/playerHead/playerHead_icon_11.png"
											}
										}
									}
								}
							}
						}
					}
				},
				{
					type = "sprite",
					name = "bg_halfSilkToken",
					y = 35,
					visible = false,
					x = 230,
					pic = {
						path = "res/ui/buildEvent/jzcl_wjm_di.png"
					},
					children = {
						{
							y = 17,
							x = 40,
							type = "sprite",
							pic = {
								path = "res/ui/activity/muNiu/mnlm_icon_ban_s.png"
							}
						},
						{
							fontSize = 22,
							name = "timer_halfSilkToken",
							y = 17,
							type = "label",
							x = 60,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					type = "node",
					name = "node_mulNationBuff",
					y = 150,
					visible = false,
					x = 65,
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_mulNationBuff",
							h = 80,
							type = "button",
							w = 80,
							y = 0,
							x = 0,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 40,
									x = 40,
									type = "sprite",
									pic = {
										path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
									}
								},
								{
									y = 40,
									name = "icon_mulNationBuff",
									x = 40,
									type = "sprite"
								}
							}
						},
						{
							y = 0,
							name = "light_mulNationBuff",
							x = 0,
							type = "sprite"
						},
						{
							y = -50,
							x = 0,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/juben/jb_wj_lv_d.png"
							}
						},
						{
							fontSize = 22,
							name = "num_mulNationBuff",
							y = -50,
							type = "label",
							x = 0
						}
					}
				},
				{
					type = "node",
					name = "node_dwxzBuff",
					y = 130,
					visible = false,
					x = 65,
					children = {
						{
							x = 80,
							type = "sprite9",
							y = 0,
							pic = {
								path = "res/ui/silk/market/scpm_word_d.png"
							},
							anchorPoint = ccp(0.5, 0.5),
							middleRect = CCRectMake(77, 19, 1, 1),
							preferedSize = CCSizeMake(160, 50)
						},
						{
							zoomOnTouchDown = true,
							name = "btn_dwxzBuff",
							h = 80,
							type = "button",
							w = 80,
							y = 0,
							x = 0,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 40,
									x = 40,
									type = "sprite",
									scale = 0.75,
									pic = {
										path = "res/ui/activity/zongzi/dwsl_btn.png"
									}
								},
								{
									y = 40,
									x = 40,
									type = "sprite",
									scale = 0.75,
									pic = {
										path = "res/ui/activity/zongzi/sdsl_r_icon_ld.png"
									}
								}
							}
						},
						{
							fontSize = 22,
							name = "num_dwxzBuff",
							y = 0,
							type = "label",
							x = 40,
							anchorPoint = ccp(0, 0.5)
						},
						{
							x = 0,
							name = "light_dwxzBuff",
							y = 0,
							type = "sprite",
							scale = 1.1
						}
					}
				},
				{
					y = 280,
					name = "start",
					type = "sprite",
					visible = false,
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_tsks_bg.png"
					},
					children = {
						{
							y = 41.5,
							name = "Sprite_9",
							type = "sprite",
							x = 353.5,
							pic = {
								path = "res/ui/resource/silkroad/sczl_word_tsks.png"
							}
						}
					}
				},
				{
					y = 280,
					name = "end",
					type = "sprite",
					visible = false,
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_tsks_bg.png"
					},
					children = {
						{
							y = 41.5,
							name = "Sprite_9_Copy",
							type = "sprite",
							x = 353.5,
							pic = {
								path = "res/ui/resource/silkroad/sczl_word_tsjs.png"
							}
						}
					}
				},
				{
					y = 280,
					name = "fail",
					type = "sprite",
					visible = false,
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_tsks_bg.png"
					},
					children = {
						{
							y = 41.5,
							name = "Sprite_9_Copy_Copy",
							type = "sprite",
							x = 353.5,
							pic = {
								path = "res/ui/resource/silkroad/sczl_word_tssb.png"
							}
						}
					}
				},
				{
					y = 280,
					name = "success",
					type = "sprite",
					visible = false,
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_tsks_bg.png"
					},
					children = {
						{
							y = 41.5,
							name = "Sprite_9_Copy_Copy_Copy",
							type = "sprite",
							x = 353.5,
							pic = {
								path = "res/ui/resource/silkroad/sczl_word_tscg.png"
							}
						}
					}
				},
				{
					y = 399.1031,
					name = "sczl_statename_bg",
					type = "sprite",
					x = 788,
					pic = {
						path = "res/ui/resource/silkroad/sczl_statename_bg.png"
					},
					children = {
						{
							y = 33.3332,
							name = "mapName",
							type = "sprite",
							x = 145.832,
							pic = {
								path = "res/ui/resource/silkroad/sczl_word_gjm_1.png"
							}
						},
						{
							y = 33.3332,
							name = "noUnrestSp",
							h = 52,
							type = "button",
							w = 52,
							visible = false,
							x = 20,
							normal = {
								path = "res/ui/resource/silkroad/newRes/sczl_icon_sse.png"
							},
							touched = {
								path = "res/ui/resource/silkroad/newRes/sczl_icon_sse.png"
							},
							children = {
								{
									fontSize = 24,
									name = "noUnrestTimesLb",
									type = "label",
									text = "2",
									y = 10,
									x = 25,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "medalSp",
							h = 32,
							type = "button",
							w = 134,
							y = 95,
							x = -580,
							normal = {
								path = "res/ui/weapon/casting/zz_word_di.png"
							},
							touched = {
								path = "res/ui/weapon/casting/zz_word_di.png"
							},
							children = {
								{
									y = 16,
									name = "medalIcon",
									type = "sprite",
									x = 5,
									pic = {
										path = "res/ui/resource/silkroad/newRes/jiangzhang.png"
									}
								},
								{
									fontSize = 22,
									name = "medalInfoLb",
									type = "label",
									text = "0",
									y = 18,
									x = 30,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							name = "cbBtn",
							h = 39,
							type = "button",
							w = 39,
							y = 40,
							x = -220,
							normal = {
								path = "res/ui/messagebox/unite_view_a.png"
							},
							touched = {
								path = "res/ui/messagebox/unite_view_a.png"
							},
							children = {
								{
									y = 19.5,
									name = "unite_view_on",
									visible = false,
									type = "sprite",
									x = 19.5,
									pic = {
										path = "res/ui/messagebox/unite_view_on.png"
									}
								},
								{
									fontSize = 22,
									name = "Text_25",
									y = 19.5,
									type = "label",
									x = 85.0007,
									textId = 215312
								}
							}
						},
						{
							y = 40,
							name = "autoSetBtn",
							h = 58,
							type = "button",
							w = 97,
							visible = true,
							x = -50,
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
									fontSize = 24,
									name = "Text_222",
									y = 30,
									type = "label",
									x = 48,
									textId = 140003
								}
							}
						}
					}
				},
				{
					y = 350,
					name = "didiInfoSp",
					type = "sprite",
					visible = false,
					x = 788,
					pic = {
						path = "res/ui/resource/silkroad/didi/pcts_head_di01.png"
					},
					children = {
						{
							x = 30,
							name = "didiHead",
							y = 35,
							type = "sprite",
							scale = 0.6,
							pic = {
								path = "res/ui/common/playerHead/playerHead_icon_11.png"
							}
						},
						{
							fontSize = 20,
							name = "cityInfoLb",
							y = 36,
							type = "label",
							text = "",
							x = 60,
							anchorPoint = ccp(0, 0.5),
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom
						},
						{
							w = 27,
							name = "cancelInviteBtn",
							h = 27,
							type = "button",
							y = 36,
							x = 200,
							normal = {
								path = "res/ui/common/symbol/lvdqj_mul.png"
							},
							touched = {
								path = "res/ui/common/symbol/lvdqj_mul.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "getDiDiRewardBtn",
					h = 62,
					type = "button",
					w = 195,
					y = 340,
					x = 810,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 20,
							y = 32,
							type = "label",
							x = 97.5,
							textId = 216213
						}
					}
				},
				{
					visible = false,
					name = "trustNode",
					y = 115,
					type = "node",
					x = 800,
					children = {
						{
							w = 214,
							name = "gwyqBtn",
							h = 84,
							type = "button",
							y = 0,
							x = 0,
							normal = {
								path = "res/ui/resource/silkroad/newRes/sczl_xr_bar_tx_bg.png"
							},
							touched = {
								path = "res/ui/resource/silkroad/newRes/sczl_xr_bar_tx_bg.png"
							}
						},
						{
							y = -13,
							name = "sczl_xr_bar_bg",
							type = "sprite",
							x = -35,
							pic = {
								path = "res/ui/resource/silkroad/newRes/sczl_xr_bar_bg.png"
							}
						},
						{
							y = -13,
							name = "gwPro",
							type = "progressbar",
							x = -35,
							pic = {
								path = "res/ui/resource/silkroad/newRes/sczl_xr_bar.png"
							}
						},
						{
							y = -0.0001,
							name = "head_tzgw",
							type = "sprite",
							x = 64.9999,
							pic = {
								path = "res/ui/resource/silkroad/newRes/head_tzgw.png"
							}
						},
						{
							fontSize = 20,
							name = "gwName",
							y = 9.9999,
							type = "label",
							x = -35,
							textId = 215910
						},
						{
							fontSize = 20,
							name = "gwProNum",
							text = "0/10",
							type = "label",
							y = -13,
							x = -35
						}
					}
				},
				{
					y = 405,
					name = "sczl_sj_icon",
					type = "sprite",
					x = 51.857,
					pic = {
						path = "res/ui/resource/silkroad/sczl_sj_icon.png"
					}
				},
				{
					fontSize = 24,
					name = "silkNum",
					type = "label",
					text = "0",
					y = 405,
					x = 82.4992,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentBottom,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 405,
					x = 250,
					type = "sprite",
					scale = 0.7,
					pic = {
						path = "res/ui/resource/silkroad/sczldj_jn.png"
					}
				},
				{
					fontSize = 24,
					name = "tipsNum",
					text = "0/0",
					type = "label",
					y = 405,
					x = 280,
					anchorPoint = ccp(0, 0.5)
				},
				{
					zoomOnTouchDown = true,
					name = "btn_gift",
					h = 60,
					type = "button",
					w = 60,
					y = 105,
					visible = false,
					x = 458,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 30,
							name = "icon_gift",
							type = "sprite",
							x = 30,
							pic = {
								path = "res/ui/resource/silkroad/xzts_xieli_icon.png"
							}
						},
						{
							y = 10,
							x = 30,
							type = "sprite",
							pic = {
								path = "res/ui/resource/silkroad/xzts_word_xieli.png"
							}
						},
						{
							y = 50,
							x = 50,
							type = "sprite",
							pic = {
								path = "res/ui/resource/silkroad/xzts_xieli_point.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "bg_giftName",
					type = "sprite9",
					y = 130,
					x = 480,
					pic = {
						frame = true,
						path = "common_tip_frame_small.png"
					},
					anchorPoint = ccp(0, 0),
					middleRect = CCRectMake(24, 24, 1, 1),
					preferedSize = CCSizeMake(180, 60),
					children = {
						{
							fontSize = 20,
							height = 0,
							name = "giftName",
							type = "label",
							width = 150,
							y = 30,
							x = 90,
							anchorPoint = ccp(0.5, 0.5),
							halign = kCCTextAlignmentLeft
						}
					}
				},
				{
					name = "btnToken",
					h = 72,
					type = "button",
					w = 73,
					y = 40,
					x = 50,
					normal = {
						path = "res/ui/resourceArea2/zcgz_btn_round.png"
					},
					touched = {
						path = "res/ui/resourceArea2/zcgz_btn_round_c.png"
					},
					children = {
						{
							y = 36,
							x = 36,
							type = "sprite",
							pic = {
								path = "res/ui/world/feud/sbxt_btn_zs.png"
							}
						},
						{
							fontSize = 30,
							name = "tokenNum",
							y = 25,
							type = "label",
							x = 60,
							anchorPoint = ccp(0, 0.5),
							color = colorQuality[4]
						}
					}
				},
				{
					style = "button_tip",
					name = "btnTip",
					y = 475,
					type = "button",
					x = 880
				},
				{
					name = "btn_treasure",
					h = 62,
					type = "button",
					w = 195,
					y = 470,
					x = 750,
					normal = {
						path = "res/ui/kfsy/150150.png"
					},
					touched = {
						path = "res/ui/kfsy/150150.png"
					},
					children = {
						{
							fontSize = 20,
							name = "Text_treasure",
							y = 30,
							type = "label",
							textId = 491008,
							style = "label_yellowish_24",
							x = 100,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom,
							color = ccc3(0, 255, 0)
						}
					}
				},
				{
					y = 34.8588,
					name = "scIcon",
					type = "sprite",
					x = 583.8213,
					pic = {
						path = "res/ui/resource/silkroad/sczl_sj_icon.png"
					}
				},
				{
					name = "btn_silk_tip",
					h = 150,
					type = "button",
					w = 150,
					y = 85,
					x = 611,
					normal = {
						path = "res/ui/kfsy/150150.png"
					},
					touched = {
						path = "res/ui/kfsy/150150.png"
					},
					children = {
						{
							y = 30,
							name = "downArrow",
							scale = 0.5,
							type = "sprite",
							x = 30,
							pic = {
								path = "res/ui/world/cityCombo/cclp_arrowhead.png"
							}
						}
					}
				},
				{
					y = 240.5932,
					name = "rewardListLayer",
					type = "sprite",
					visible = false,
					x = 456.9999,
					pic = {
						path = "res/ui/resource/silkroad/sczl_jl_d.png"
					},
					children = {
						{
							name = "ok",
							h = 62,
							type = "button",
							w = 195,
							y = 41,
							x = 437.5,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 20,
									name = "Text_3",
									y = 34,
									type = "label",
									textId = 10001,
									style = "label_yellowish_24",
									x = 97.5,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentBottom
								}
							}
						}
					}
				},
				{
					name = "btnStart",
					h = 62,
					type = "button",
					w = 195,
					y = 32,
					x = 457,
					normal = {
						path = "res/ui/common/button/public_btn_green.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_green_c.png"
					},
					children = {
						{
							fontSize = 20,
							name = "Text_2",
							y = 33,
							type = "label",
							textId = 491004,
							style = "label_yellowish_24",
							x = 97.5,
							halign = kCCTextAlignmentLeft,
							valign = kCCVerticalTextAlignmentBottom
						}
					}
				},
				{
					name = "SilkTreasure1",
					h = 70,
					type = "button",
					w = 70,
					y = 36,
					x = 720,
					normal = {
						path = "res/ui/resource/silkroad/tsbw_btn.png"
					},
					touched = {
						path = "res/ui/resource/silkroad/tsbw_btn_c.png"
					},
					children = {
						{
							y = 36,
							name = "TreasureIcon1",
							type = "sprite",
							x = 35,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_btn_icon_wenhao.png"
							}
						},
						{
							fontSize = 20,
							name = "TreasureLb1",
							h = 30,
							type = "label",
							w = 70,
							y = 15,
							visible = false,
							style = "label_yellowish_24",
							x = 35,
							color = colorQuality[1],
							halign = kCCVerticalTextAlignmentCenter,
							valign = kCCVerticalTextAlignmentBottom
						}
					}
				},
				{
					name = "SilkTreasure2",
					h = 70,
					type = "button",
					w = 70,
					y = 36,
					x = 795,
					normal = {
						path = "res/ui/resource/silkroad/tsbw_btn.png"
					},
					touched = {
						path = "res/ui/resource/silkroad/tsbw_btn_c.png"
					},
					children = {
						{
							y = 36,
							name = "TreasureIcon2",
							type = "sprite",
							x = 35,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_btn_icon_wenhao.png"
							}
						},
						{
							fontSize = 20,
							name = "TreasureLb2",
							h = 30,
							type = "label",
							w = 70,
							y = 15,
							visible = false,
							style = "label_yellowish_24",
							x = 35,
							color = colorQuality[1],
							halign = kCCVerticalTextAlignmentCenter,
							valign = kCCVerticalTextAlignmentBottom
						}
					}
				},
				{
					name = "SilkTreasure3",
					h = 70,
					type = "button",
					w = 70,
					y = 36,
					x = 870,
					normal = {
						path = "res/ui/resource/silkroad/tsbw_btn.png"
					},
					touched = {
						path = "res/ui/resource/silkroad/tsbw_btn_c.png"
					},
					children = {
						{
							y = 36,
							name = "TreasureIcon3",
							type = "sprite",
							x = 35,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_btn_icon_wenhao.png"
							}
						},
						{
							fontSize = 20,
							name = "TreasureLb3",
							h = 30,
							type = "label",
							w = 70,
							y = 15,
							visible = false,
							style = "label_yellowish_24",
							x = 35,
							color = colorQuality[1],
							halign = kCCVerticalTextAlignmentCenter,
							valign = kCCVerticalTextAlignmentBottom
						}
					}
				},
				{
					fontSize = 20,
					name = "needNum",
					type = "label",
					text = "Text Label",
					y = 33.4998,
					x = 611.9957,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentBottom,
					anchorPoint = ccp(0, 0.5)
				},
				{
					y = 245.1267,
					name = "tsbw_tsz_bg",
					visible = false,
					type = "sprite",
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/tsbw_tsz_bg.png"
					},
					children = {
						{
							y = 240,
							name = "tsbw_title_word_bwtsz",
							type = "sprite",
							x = 313.5,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_title_word_bwtsz.png"
							}
						},
						{
							y = 120,
							name = "bwSp",
							type = "sprite",
							x = 313.5,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_tjhj_pb_bg.png"
							},
							children = {
								{
									y = 70,
									name = "tsbw_sp",
									type = "sprite",
									x = 70,
									pic = {
										path = "res/ui/resource/silkroad/tsbw_s_baoshijiezhi.png"
									}
								},
								{
									fontSize = 30,
									name = "countDownText",
									y = 35,
									type = "label",
									visible = false,
									text = "Text Label",
									style = "label_yellowish_24",
									x = 70,
									halign = kCCTextAlignmentLeft,
									valign = kCCVerticalTextAlignmentCenter,
									anchorPoint = ccp(0.5, 0.5)
								},
								{
									y = 78,
									name = "tsbw_prompt_lxdj",
									type = "sprite",
									x = -90,
									pic = {
										path = "res/ui/resource/silkroad/tsbw_prompt_lxdj.png"
									}
								}
							}
						}
					}
				},
				{
					y = 245.1267,
					name = "tsbw_bw_bg",
					visible = false,
					type = "sprite",
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/tsbw_bw_bg.png"
					},
					children = {
						{
							y = 242,
							name = "tsbw_statename_bg_red",
							type = "sprite",
							x = 292,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_statename_bg_red.png"
							}
						},
						{
							y = 243,
							name = "tsbw_titleSp",
							type = "sprite",
							x = 292,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_word_bw_hdcpd.png"
							}
						},
						{
							y = 159,
							name = "bwIconSp",
							type = "sprite",
							x = 292,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_baoshijiezhi.png"
							}
						}
					}
				},
				{
					y = 245.1267,
					name = "tsbwKZSp",
					visible = false,
					type = "sprite",
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/tsbw_word_bg.png"
					},
					children = {
						{
							y = 69,
							name = "tsbw_word_sdgmykz",
							type = "sprite",
							x = 455,
							pic = {
								path = "res/ui/resource/silkroad/tsbw_word_sdgmykz.png"
							}
						}
					}
				},
				{
					y = 245.1267,
					name = "dialog",
					type = "sprite",
					visible = false,
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_jz.png"
					},
					children = {
						{
							y = 337.44,
							name = "sczl_zj_title_d",
							type = "sprite",
							x = 293,
							pic = {
								path = "res/ui/resource/silkroad/sczl_zj_title_d.png"
							},
							children = {
								{
									y = 24.5,
									name = "title",
									type = "sprite",
									x = 148,
									pic = {
										path = "res/ui/resource/silkroad/sczl_word_sj18.png"
									}
								}
							}
						},
						{
							y = 0,
							name = "choiceLayer",
							visible = false,
							type = "layer",
							x = 0,
							children = {
								{
									y = 240.67,
									name = "sczl_jz_nd",
									type = "sprite",
									x = 293,
									pic = {
										path = "res/ui/resource/silkroad/sczl_jz_nd.png"
									},
									children = {
										{
											y = 72.7267,
											name = "Sprite_74",
											type = "sprite",
											x = 64.5451,
											pic = {
												path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
											},
											children = {
												{
													y = 40.0002,
													name = "head",
													type = "sprite",
													x = 40,
													pic = {
														path = "res/ui/common/generalPic/generalPic_beiyong1.jpg"
													}
												}
											}
										},
										{
											name = "dialogInfo",
											y = 71.5,
											type = "label",
											width = 315,
											height = 0,
											text = "Text Label",
											style = "label_yellowish_24",
											x = 125.82,
											fontSize = 20 + (var_0_0.dialogFntSize or 0),
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentCenter,
											anchorPoint = ccp(0, 0.5)
										}
									}
								}
							}
						},
						{
							y = 0,
							name = "rewardLayer",
							visible = false,
							type = "layer",
							x = 0,
							children = {
								{
									y = 219.14,
									name = "Sprite_76",
									type = "sprite",
									x = 293,
									pic = {
										path = "res/ui/resource/silkroad/sczl_jz_huawen.png"
									},
									children = {
										{
											y = 70.17,
											name = "rewardBg",
											type = "sprite",
											x = 157,
											pic = {
												path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
											}
										}
									}
								},
								{
									y = 102.13,
									name = "zymz_pb_bg",
									type = "sprite",
									x = 293,
									pic = {
										path = "res/ui/world/manzu/zymz_pb_bg.png"
									},
									children = {
										{
											y = 12.5,
											name = "loadingbar",
											type = "progressbar",
											x = 97,
											pic = {
												path = "res/ui/world/manzu/zymz_pb.png"
											}
										}
									}
								}
							}
						},
						{
							y = 0,
							name = "selectItemLayer",
							type = "layer",
							x = 0,
							children = {
								{
									y = 189.9999,
									name = "reward1",
									type = "sprite",
									x = 163.33,
									pic = {
										path = "res/ui/resource/silkroad/sczl_bigbox_open.png"
									}
								},
								{
									y = 189.9999,
									name = "reward2",
									type = "sprite",
									x = 423.33,
									pic = {
										path = "res/ui/resource/silkroad/sczl_bigbox_open.png"
									}
								}
							}
						}
					}
				},
				{
					y = 255.5,
					name = "endRewardLayer",
					type = "sprite",
					visible = false,
					x = 457,
					pic = {
						path = "res/ui/resource/silkroad/sczl_tsz_bg.png"
					},
					children = {
						{
							y = 78.4935,
							name = "zymz_pb_bg_Copy",
							type = "sprite",
							x = 228.5,
							pic = {
								path = "res/ui/world/manzu/zymz_pb_bg.png"
							},
							children = {
								{
									y = 12.5,
									name = "loadingbar2",
									type = "progressbar",
									x = 97,
									pic = {
										path = "res/ui/world/manzu/zymz_pb.png"
									}
								}
							}
						},
						{
							y = 160.7144,
							name = "node2",
							type = "sprite",
							scaleX = 0.8,
							x = 132.0649,
							scaleY = 0.8,
							pic = {
								path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
							}
						},
						{
							y = 160.714,
							name = "node1",
							type = "sprite",
							x = 225.2473,
							pic = {
								path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
							}
						},
						{
							y = 160.7144,
							name = "node3",
							type = "sprite",
							scaleX = 0.8,
							x = 318.4296,
							scaleY = 0.8,
							pic = {
								path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
							}
						}
					}
				},
				{
					type = "sprite",
					name = "node_assist",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							name = "btn_assistDialog",
							h = 511,
							type = "button",
							w = 914,
							y = 0,
							x = 0,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							anchorPoint = ccp(0, 0)
						},
						{
							y = 245,
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/resource/silkroad/sczl_jz.png"
							},
							children = {
								{
									y = 337,
									type = "sprite",
									x = 293,
									pic = {
										path = "res/ui/resource/silkroad/sczl_zj_title_d.png"
									},
									children = {
										{
											y = 25,
											x = 148,
											type = "sprite",
											pic = {
												path = "res/ui/resource/silkroad/xzts_word_xzts.png"
											}
										}
									}
								},
								{
									type = "sprite",
									name = "assist_step1",
									y = 241,
									visible = false,
									x = 293,
									pic = {
										path = "res/ui/resource/silkroad/sczl_jz_nd.png"
									},
									children = {
										{
											y = 73,
											type = "sprite",
											x = 65,
											pic = {
												path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
											},
											children = {
												{
													y = 40,
													x = 40,
													type = "sprite",
													pic = {
														path = "res/ui/common/generalPic/generalPic_masu.jpg"
													}
												}
											}
										},
										{
											fontSize = 20,
											height = 0,
											width = 315,
											type = "label",
											textId = 491032,
											style = "label_yellowish_24",
											y = 72,
											x = 126,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentCenter,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									type = "node",
									name = "assist_step2",
									y = 0,
									visible = false,
									x = 0,
									children = {
										{
											y = 220,
											type = "sprite",
											x = 293,
											pic = {
												path = "res/ui/resource/silkroad/sczl_jz_nd.png"
											},
											children = {
												{
													type = "node",
													name = "node_assistList",
													y = 0,
													visible = false,
													x = 0,
													children = {
														{
															type = "node",
															name = "node_player1",
															y = 0,
															visible = false,
															x = 0,
															children = {
																{
																	zoomOnTouchDown = true,
																	name = "btn_player1",
																	h = 80,
																	type = "button",
																	w = 80,
																	y = 0,
																	x = 0,
																	normal = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	touched = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	children = {
																		{
																			x = 40,
																			name = "pic_player1",
																			y = 40,
																			type = "sprite",
																			scale = 0.8,
																			pic = {
																				path = "res/ui/common/playerHead/playerHead_icon_1.png"
																			}
																		},
																		{
																			fontSize = 20,
																			name = "silkRoadLv1",
																			style = "label_yellowish_24",
																			type = "label",
																			y = 73,
																			x = 73,
																			anchorPoint = ccp(1, 1)
																		},
																		{
																			type = "layerColor",
																			name = "btn_player_disable1",
																			height = 74,
																			visible = false,
																			x = 3,
																			width = 74,
																			y = 3,
																			color = ccc4(0, 0, 0, 150)
																		}
																	}
																},
																{
																	y = -32,
																	type = "sprite",
																	x = -32,
																	pic = {
																		path = "res/ui/resource/silkroad/xzts_head_tick_di.png"
																	},
																	children = {
																		{
																			y = 18,
																			name = "check1",
																			type = "sprite",
																			x = 18,
																			pic = {
																				path = "res/ui/resource/silkroad/xzts_head_tick.png"
																			}
																		}
																	}
																},
																{
																	fontSize = 20,
																	name = "name1",
																	style = "label_yellowish_24",
																	type = "label",
																	y = -58,
																	x = 0
																}
															}
														},
														{
															type = "node",
															name = "node_player2",
															y = 0,
															visible = false,
															x = 0,
															children = {
																{
																	zoomOnTouchDown = true,
																	name = "btn_player2",
																	h = 80,
																	type = "button",
																	w = 80,
																	y = 0,
																	x = 0,
																	normal = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	touched = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	children = {
																		{
																			x = 40,
																			name = "pic_player2",
																			y = 40,
																			type = "sprite",
																			scale = 0.8,
																			pic = {
																				path = "res/ui/common/playerHead/playerHead_icon_1.png"
																			}
																		},
																		{
																			fontSize = 20,
																			name = "silkRoadLv2",
																			style = "label_yellowish_24",
																			type = "label",
																			y = 73,
																			x = 73,
																			anchorPoint = ccp(1, 1)
																		},
																		{
																			type = "layerColor",
																			name = "btn_player_disable2",
																			height = 74,
																			visible = false,
																			x = 3,
																			width = 74,
																			y = 3,
																			color = ccc4(0, 0, 0, 150)
																		}
																	}
																},
																{
																	y = -32,
																	type = "sprite",
																	x = -32,
																	pic = {
																		path = "res/ui/resource/silkroad/xzts_head_tick_di.png"
																	},
																	children = {
																		{
																			y = 18,
																			name = "check2",
																			type = "sprite",
																			x = 18,
																			pic = {
																				path = "res/ui/resource/silkroad/xzts_head_tick.png"
																			}
																		}
																	}
																},
																{
																	fontSize = 20,
																	name = "name2",
																	style = "label_yellowish_24",
																	type = "label",
																	y = -58,
																	x = 0
																}
															}
														},
														{
															type = "node",
															name = "node_player3",
															y = 0,
															visible = false,
															x = 0,
															children = {
																{
																	zoomOnTouchDown = true,
																	name = "btn_player3",
																	h = 80,
																	type = "button",
																	w = 80,
																	y = 0,
																	x = 0,
																	normal = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	touched = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	children = {
																		{
																			x = 40,
																			name = "pic_player3",
																			y = 40,
																			type = "sprite",
																			scale = 0.8,
																			pic = {
																				path = "res/ui/common/playerHead/playerHead_icon_1.png"
																			}
																		},
																		{
																			fontSize = 20,
																			name = "silkRoadLv3",
																			style = "label_yellowish_24",
																			type = "label",
																			y = 73,
																			x = 73,
																			anchorPoint = ccp(1, 1)
																		},
																		{
																			type = "layerColor",
																			name = "btn_player_disable3",
																			height = 74,
																			visible = false,
																			x = 3,
																			width = 74,
																			y = 3,
																			color = ccc4(0, 0, 0, 150)
																		}
																	}
																},
																{
																	y = -32,
																	type = "sprite",
																	x = -32,
																	pic = {
																		path = "res/ui/resource/silkroad/xzts_head_tick_di.png"
																	},
																	children = {
																		{
																			y = 18,
																			name = "check3",
																			type = "sprite",
																			x = 18,
																			pic = {
																				path = "res/ui/resource/silkroad/xzts_head_tick.png"
																			}
																		}
																	}
																},
																{
																	fontSize = 20,
																	name = "name3",
																	style = "label_yellowish_24",
																	type = "label",
																	y = -58,
																	x = 0
																}
															}
														},
														{
															type = "node",
															name = "node_player4",
															y = 0,
															visible = false,
															x = 0,
															children = {
																{
																	zoomOnTouchDown = true,
																	name = "btn_player4",
																	h = 80,
																	type = "button",
																	w = 80,
																	y = 0,
																	x = 0,
																	normal = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	touched = {
																		path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
																	},
																	children = {
																		{
																			x = 40,
																			name = "pic_player4",
																			y = 40,
																			type = "sprite",
																			scale = 0.8,
																			pic = {
																				path = "res/ui/common/playerHead/playerHead_icon_1.png"
																			}
																		},
																		{
																			fontSize = 20,
																			name = "silkRoadLv4",
																			style = "label_yellowish_24",
																			type = "label",
																			y = 73,
																			x = 73,
																			anchorPoint = ccp(1, 1)
																		},
																		{
																			type = "layerColor",
																			name = "btn_player_disable4",
																			height = 74,
																			visible = false,
																			x = 3,
																			width = 74,
																			y = 3,
																			color = ccc4(0, 0, 0, 150)
																		}
																	}
																},
																{
																	y = -32,
																	type = "sprite",
																	x = -32,
																	pic = {
																		path = "res/ui/resource/silkroad/xzts_head_tick_di.png"
																	},
																	children = {
																		{
																			y = 18,
																			name = "check4",
																			type = "sprite",
																			x = 18,
																			pic = {
																				path = "res/ui/resource/silkroad/xzts_head_tick.png"
																			}
																		}
																	}
																},
																{
																	fontSize = 20,
																	name = "name4",
																	style = "label_yellowish_24",
																	type = "label",
																	y = -58,
																	x = 0
																}
															}
														}
													}
												},
												{
													fontSize = 20,
													name = "no_assist",
													visible = false,
													type = "label",
													y = 72,
													width = 420,
													textId = 491039,
													height = 0,
													style = "label_yellowish_24",
													x = 233,
													halign = kCCTextAlignmentLeft,
													valign = kCCVerticalTextAlignmentCenter,
													anchorPoint = ccp(0.5, 0.5)
												}
											}
										},
										{
											fontSize = 22,
											name = "assistNum",
											style = "label_yellowish_24",
											type = "label",
											y = 305,
											x = 65,
											color = tool.hexToRgb("#FFFFCC"),
											anchorPoint = ccp(0, 0.5)
										},
										{
											y = 290,
											name = "btn_refresh",
											h = 54,
											type = "button",
											w = 54,
											visible = false,
											x = 525,
											normal = {
												path = "res/ui/resource/silkroad/xzts_btn_refresh.png"
											},
											touched = {
												path = "res/ui/resource/silkroad/xzts_btn_refresh_c.png"
											}
										},
										{
											y = 122,
											type = "sprite",
											x = 293,
											pic = {
												path = "res/ui/resource/silkroad/xzts_word_di.png"
											},
											children = {
												{
													y = 12,
													x = 185,
													type = "sprite",
													scale = 0.8,
													pic = {
														path = "res/ui/resource/silkroad/sczl_sj_icon.png"
													}
												},
												{
													fontSize = 22,
													style = "label_yellowish_24",
													y = 12,
													type = "label",
													x = 150,
													textId = 491035,
													color = tool.hexToRgb("#FFFFCC"),
													anchorPoint = ccp(1, 0.5)
												},
												{
													fontSize = 22,
													name = "reduceSilk",
													style = "label_yellowish_24",
													type = "label",
													y = 12,
													x = 220,
													color = tool.hexToRgb("#FFFFCC"),
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											name = "btn_assist",
											h = 58,
											type = "button",
											w = 140,
											y = 70,
											x = 293,
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
													fontSize = 20,
													style = "label_yellowish_24",
													name = "lbl_btn_assist",
													type = "label",
													y = 29,
													x = 70,
													textId = 491033
												}
											}
										}
									}
								}
							}
						}
					}
				},
				{
					type = "node",
					name = "node_gift",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 0,
							h = 511,
							type = "button",
							w = 914,
							x = 0,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							anchorPoint = ccp(0, 0)
						},
						{
							y = 245,
							type = "sprite",
							x = 457.5,
							pic = {
								path = "res/ui/resource/silkroad/sczl_jz.png"
							},
							children = {
								{
									y = 337,
									type = "sprite",
									x = 293,
									pic = {
										path = "res/ui/resource/silkroad/sczl_zj_title_d.png"
									},
									children = {
										{
											y = 25,
											x = 148,
											type = "sprite",
											pic = {
												path = "res/ui/resource/silkroad/xzts_word_xzxl.png"
											}
										}
									}
								},
								{
									y = 241,
									type = "sprite",
									x = 293,
									pic = {
										path = "res/ui/resource/silkroad/sczl_jz_nd.png"
									},
									children = {
										{
											y = 73,
											type = "sprite",
											x = 65,
											pic = {
												path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
											},
											children = {
												{
													y = 40,
													x = 40,
													type = "sprite",
													pic = {
														path = "res/ui/common/generalPic/generalPic_masu.jpg"
													}
												}
											}
										},
										{
											fontSize = 20,
											name = "giftInfo",
											type = "label",
											width = 315,
											height = 0,
											style = "label_yellowish_24",
											y = 72,
											x = 126,
											halign = kCCTextAlignmentLeft,
											valign = kCCVerticalTextAlignmentCenter,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									name = "btn_getGift",
									h = 58,
									type = "button",
									w = 140,
									y = 100,
									x = 293,
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
											fontSize = 20,
											style = "label_yellowish_24",
											y = 29,
											type = "label",
											x = 70,
											textId = 491038
										}
									}
								}
							}
						}
					}
				},
				{
					y = 0,
					name = "autoLayer",
					visible = false,
					type = "layer",
					x = 32,
					children = {
						{
							y = 215,
							name = "autoSetBg",
							type = "sprite9",
							x = 425,
							preferedSize = CCSizeMake(850, 430),
							middleRect = CCRectMake(40, 35, 25, 35),
							pic = {
								path = "res/ui/activity/goldActivity/bigPanel.png"
							}
						},
						{
							y = 232,
							name = "autoMode1",
							type = "sprite",
							x = 150,
							pic = {
								path = "res/ui/resource/silkroad/auto/sczltg_pic_bg.png"
							},
							children = {
								{
									y = 180,
									name = "sczltg_pic_01",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_pic_01.png"
									}
								},
								{
									y = 308.7082,
									name = "sczltg_word_gjtg",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_word_gjtg.png"
									}
								},
								{
									y = 109.9996,
									name = "sczltg_word_di",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_word_di.png"
									}
								},
								{
									fontSize = 22,
									name = "autoInfoLb1",
									y = 110,
									type = "label",
									x = 132,
									textId = 216371
								},
								{
									name = "selectedBtn1",
									h = 75,
									type = "button",
									w = 258,
									y = 41,
									x = 132,
									normal = {
										frame = true,
										path = "btn4_yel_a.png"
									},
									touched = {
										frame = true,
										path = "btn4_yel_c.png"
									},
									children = {
										{
											fontSize = 24,
											name = "selectedBtnLb1",
											y = 39.0005,
											type = "label",
											x = 129.0001,
											textId = 216374
										}
									}
								},
								{
									name = "selectModeBtn1",
									h = 75,
									type = "button",
									w = 258,
									y = 41,
									x = 132,
									normal = {
										frame = true,
										path = "btn4_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn4_gre_c.png"
									},
									children = {
										{
											fontSize = 24,
											name = "selectModeBtnLb1",
											y = 38.0001,
											type = "label",
											x = 155.0003
										},
										{
											y = 37,
											name = "icon_gold",
											type = "sprite",
											x = 70,
											pic = {
												path = "res/ui/playerInfo/icon_gold.png"
											}
										}
									}
								},
								{
									y = 171,
									name = "autoModeLight1",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_pic_bg_light.png"
									}
								}
							}
						},
						{
							y = 232,
							name = "autoMode2",
							type = "sprite",
							x = 425,
							pic = {
								path = "res/ui/resource/silkroad/auto/sczltg_pic_bg.png"
							},
							children = {
								{
									y = 180,
									name = "sczltg_pic_01_Copy",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_pic_02.png"
									}
								},
								{
									y = 308.7082,
									name = "sczltg_word_gjtg_Copy",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_word_tg.png"
									}
								},
								{
									y = 109.9996,
									name = "sczltg_word_di_Copy",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_word_di.png"
									}
								},
								{
									fontSize = 22,
									name = "autoInfoLb2",
									y = 110,
									type = "label",
									x = 132,
									textId = 216372
								},
								{
									name = "selectedBtn2",
									h = 75,
									type = "button",
									w = 258,
									y = 41,
									x = 132,
									normal = {
										frame = true,
										path = "btn4_yel_a.png"
									},
									touched = {
										frame = true,
										path = "btn4_yel_c.png"
									},
									children = {
										{
											fontSize = 24,
											name = "selectedBtnLb1_Copy",
											y = 39.0005,
											type = "label",
											x = 129.0001,
											textId = 216374
										}
									}
								},
								{
									name = "selectModeBtn2",
									h = 75,
									type = "button",
									w = 258,
									y = 41,
									x = 132,
									normal = {
										frame = true,
										path = "btn4_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn4_gre_c.png"
									},
									children = {
										{
											fontSize = 24,
											name = "selectModeBtnLb2",
											y = 38.0001,
											type = "label",
											x = 155.0003
										},
										{
											y = 37,
											name = "icon_gold_Copy",
											type = "sprite",
											x = 70,
											pic = {
												path = "res/ui/playerInfo/icon_gold.png"
											}
										}
									}
								},
								{
									y = 171,
									name = "autoModeLight2",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_pic_bg_light.png"
									}
								}
							}
						},
						{
							y = 232,
							name = "autoMode3",
							type = "sprite",
							x = 700,
							pic = {
								path = "res/ui/resource/silkroad/auto/sczltg_pic_bg.png"
							},
							children = {
								{
									y = 180,
									name = "sczltg_pic_01_Copy",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_pic_03.png"
									}
								},
								{
									y = 308.7082,
									name = "sczltg_word_gjtg_Copy",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_word_sd.png"
									}
								},
								{
									y = 109.9996,
									name = "sczltg_word_di_Copy",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_word_di.png"
									}
								},
								{
									fontSize = 22,
									name = "autoInfoLb3",
									y = 110,
									type = "label",
									x = 132,
									textId = 216373
								},
								{
									name = "selectedBtn3",
									h = 75,
									type = "button",
									w = 258,
									y = 41,
									x = 132,
									normal = {
										frame = true,
										path = "btn4_yel_a.png"
									},
									touched = {
										frame = true,
										path = "btn4_yel_c.png"
									},
									children = {
										{
											fontSize = 24,
											name = "selectedBtnLb1_Copy",
											y = 39.0005,
											type = "label",
											x = 129.0001,
											textId = 216374
										}
									}
								},
								{
									name = "selectModeBtn3",
									h = 75,
									type = "button",
									w = 258,
									y = 41,
									x = 132,
									normal = {
										frame = true,
										path = "btn4_gre_a.png"
									},
									touched = {
										frame = true,
										path = "btn4_gre_c.png"
									},
									children = {
										{
											fontSize = 24,
											name = "selectModeBtnLb3",
											y = 38.0001,
											type = "label",
											x = 131.9999,
											textId = 216383
										}
									}
								},
								{
									y = 171,
									name = "autoModeLight3",
									type = "sprite",
									x = 132,
									pic = {
										path = "res/ui/resource/silkroad/auto/sczltg_pic_bg_light.png"
									}
								}
							}
						},
						{
							y = 32,
							name = "autoMoreBtn",
							h = 39,
							type = "button",
							w = 39,
							visible = false,
							x = 85,
							normal = {
								path = "res/ui/messagebox/unite_view_a.png"
							},
							touched = {
								path = "res/ui/messagebox/unite_view_a.png"
							},
							children = {
								{
									y = 19.5,
									name = "autoMoreOn",
									visible = false,
									type = "sprite",
									x = 19.5,
									pic = {
										path = "res/ui/messagebox/unite_view_on.png"
									}
								},
								{
									fontSize = 22,
									name = "autoMoreLb",
									y = 19,
									type = "label",
									x = 105,
									textId = 216370
								}
							}
						},
						{
							x = 801.2504,
							name = "modeCloseBtn",
							h = 33,
							type = "button",
							w = 32,
							y = 458.1431,
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
			}
		}
	}
}
local var_0_6 = {
	y = 240,
	name = "node",
	type = "node",
	x = 458,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			x = 2.5,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_bg.png"
			}
		},
		{
			y = 150,
			name = "sczl_ryb_title_jrryb",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_title_jrryb.png"
			}
		},
		{
			y = 110.9999,
			name = "sczl_ryb_word_pm",
			type = "sprite",
			x = -216.9998,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_word_pm.png"
			}
		},
		{
			y = 111,
			name = "sczl_ryb_word_qf",
			type = "sprite",
			x = -29.0001,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_word_qf.png"
			}
		},
		{
			y = 111,
			name = "sczl_ryb_word_jz",
			type = "sprite",
			x = 114.9998,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_word_jz.png"
			}
		},
		{
			y = 111,
			name = "sczl_ryb_word_jl",
			type = "sprite",
			x = 250.0003,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_word_jl.png"
			}
		},
		{
			visible = false,
			name = "xwydBg",
			y = 0,
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_word_xwyd.png"
			}
		},
		{
			fontSize = 20,
			name = "tips",
			y = 151,
			type = "label",
			x = -228.9999,
			textId = 215908,
			color = colorQuality[5]
		},
		{
			x = 295,
			name = "btn_close",
			h = 33,
			type = "button",
			w = 32,
			y = 155,
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
local var_0_7 = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			x = 320,
			anchorPoint = ccp(0.5, 0),
			pic = {
				path = "res/ui/resource/silkroad/newRes/sczl_ryb_list01.png"
			}
		},
		{
			fontSize = 22,
			name = "playerLb",
			y = 25,
			type = "label",
			x = 30,
			anchorPoint = ccp(0, 0.5)
		},
		{
			fontSize = 22,
			name = "serverLb",
			y = 25,
			type = "label",
			x = 230,
			anchorPoint = ccp(0, 0.5)
		},
		{
			zoomOnTouchDown = true,
			name = "medalIcon",
			h = 42,
			type = "button",
			w = 42,
			y = 25,
			x = 410,
			normal = {
				path = "res/ui/resource/silkroad/newRes/jiangzhang.png"
			},
			touched = {
				path = "res/ui/resource/silkroad/newRes/jiangzhang.png"
			}
		},
		{
			fontSize = 22,
			name = "medalNum",
			y = 25,
			type = "label",
			x = 430,
			anchorPoint = ccp(0, 0.5)
		},
		{
			zoomOnTouchDown = true,
			name = "rewardIcon",
			h = 42,
			type = "button",
			w = 42,
			y = 25,
			x = 545,
			normal = {
				path = "res/ui/resource/silkroad/newRes/ten1.png"
			},
			touched = {
				path = "res/ui/resource/silkroad/newRes/ten1.png"
			}
		},
		{
			zoomOnTouchDown = true,
			name = "rewardIcon2",
			h = 42,
			type = "button",
			w = 42,
			y = 25,
			x = 545,
			normal = {
				path = "res/ui/resource/silkroad/newRes/ten2.png"
			},
			touched = {
				path = "res/ui/resource/silkroad/newRes/ten2.png"
			}
		},
		{
			fontSize = 22,
			name = "rewardNum",
			y = 25,
			type = "label",
			x = 565,
			anchorPoint = ccp(0, 0.5)
		}
	}
}
local var_0_8 = {
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
			width = 400,
			textId = 135238,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}
local var_0_9 = {
	y = 225,
	name = "pcNode",
	type = "node",
	x = 457,
	children = {
		{
			y = 0,
			name = "bgNode",
			type = "node",
			x = 0,
			children = {
				{
					y = 0,
					name = "sczl_jz",
					type = "sprite",
					x = -1,
					pic = {
						path = "res/ui/resource/silkroad/sczl_jz.png"
					}
				},
				{
					y = 130,
					name = "sczl_zj_title_d",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/resource/silkroad/sczl_zj_title_d.png"
					}
				},
				{
					y = 134,
					name = "pcTitle",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/resource/silkroad/didi/pcts_word_qcts.png"
					}
				}
			}
		},
		{
			y = 0,
			name = "CarpoolTradeNode",
			type = "node",
			x = 0,
			children = {
				{
					y = 0,
					name = "pcEvent1",
					type = "node",
					x = 0,
					children = {
						{
							y = 3,
							name = "carpoolItemRenderer1",
							type = "sprite",
							x = -120,
							pic = {
								path = "res/ui/resource/silkroad/didi/pcts_pc_di01.png"
							},
							children = {
								{
									y = 160,
									name = "pcts_head1",
									type = "sprite",
									x = 105,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_head_di01.png"
									}
								},
								{
									y = 90,
									name = "car1",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/car1.png"
									}
								},
								{
									y = 25,
									name = "pcts_pcword_di1",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_pcword_di01.png"
									}
								},
								{
									fontSize = 20,
									name = "pcts_RoleName1",
									y = 160,
									type = "label",
									x = 109,
									textId = 216201
								},
								{
									x = 89.9999,
									name = "icon_gold1",
									y = 24.9996,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								},
								{
									fontSize = 20,
									name = "pcGoldLb1",
									y = 25,
									type = "label",
									x = 125
								},
								{
									y = 95,
									name = "pcts_word_yqpc",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_word_yqpc.png"
									}
								}
							}
						},
						{
							w = 218,
							name = "carpoolItemRendererBtn1",
							h = 190,
							type = "button",
							y = 3,
							x = -120,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							y = 3,
							name = "carpoolItemRenderer2",
							type = "sprite",
							x = 120,
							pic = {
								path = "res/ui/resource/silkroad/didi/pcts_pc_di01.png"
							},
							children = {
								{
									y = 160,
									name = "pcts_head2",
									type = "sprite",
									x = 105,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_head_di01.png"
									}
								},
								{
									y = 90,
									name = "car2",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/car1.png"
									}
								},
								{
									y = 25,
									name = "pcts_pcword_di2",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_pcword_di02.png"
									}
								},
								{
									fontSize = 20,
									name = "pcts_RoleName2",
									y = 160,
									type = "label",
									x = 109,
									textId = 216202,
									color = colorQuality[4]
								},
								{
									x = 49.9995,
									name = "icon_gold2",
									y = 24.9987,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								},
								{
									fontSize = 20,
									name = "pcGoldLb2",
									y = 25,
									type = "label",
									x = 90
								},
								{
									x = 130.9998,
									name = "sczl_sj_icon",
									y = 25,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/resource/silkroad/sczl_sj_icon.png"
									}
								},
								{
									fontSize = 20,
									name = "pcSilkLb2",
									y = 25,
									type = "label",
									x = 175
								},
								{
									x = 32.9999,
									name = "xysr_fightPic",
									y = 159.9998,
									type = "sprite",
									scale = 0.4,
									pic = {
										path = "res/ui/common/fightPic/fightPic_xiyushangren.png"
									}
								}
							}
						},
						{
							w = 218,
							name = "carpoolItemRendererBtn2",
							h = 190,
							type = "button",
							y = 3,
							x = 120,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							name = "pctsEventBtn",
							h = 54,
							type = "button",
							w = 125,
							y = -119.9999,
							x = 0,
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
									fontSize = 20,
									name = "Text_6",
									y = 27,
									type = "label",
									x = 62.5,
									textId = 216203
								}
							}
						},
						{
							fontSize = 20,
							name = "pcLeftNum",
							y = -155,
							type = "label",
							x = 0
						}
					}
				},
				{
					y = 0,
					name = "pcEvent2",
					visible = false,
					type = "node",
					x = 0,
					children = {
						{
							y = -7,
							name = "carpoolItemRenderer3",
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/resource/silkroad/didi/pcts_pc_di01.png"
							},
							children = {
								{
									y = 90,
									name = "car3",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/car1.png"
									}
								},
								{
									y = 25,
									name = "pcts_pcword_di3",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_pcword_di01.png"
									}
								},
								{
									y = 160,
									name = "pcts_word_yqpc",
									type = "sprite",
									x = 109,
									pic = {
										path = "res/ui/resource/silkroad/didi/pcts_word_yqpc.png"
									}
								},
								{
									fontSize = 20,
									name = "pcWaitTimeLb",
									y = 25,
									type = "label",
									x = 109.0001
								},
								{
									name = "pctsCancelBtn",
									h = 54,
									type = "button",
									w = 125,
									y = -28,
									x = 109.0002,
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
											fontSize = 20,
											name = "Text_7",
											y = 27,
											type = "label",
											x = 62.5,
											textId = 216209
										}
									}
								}
							}
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "CarpoolInviteNode",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = 7,
					name = "pcts_pc_di01",
					type = "sprite",
					scaleX = 2,
					x = 0,
					scaleY = 0.7,
					pic = {
						path = "res/ui/resource/silkroad/didi/pcts_pc_di01.png"
					}
				},
				{
					y = 8,
					name = "get_rewa_icon",
					type = "sprite",
					x = -157,
					pic = {
						path = "res/ui/task/get_rewa_icon.jpg"
					},
					children = {
						{
							y = 35,
							name = "pcPlayerHead_icon",
							scale = 0.7,
							type = "sprite",
							x = 34,
							pic = {
								path = "res/ui/common/playerHead/playerHead_icon_1.png"
							}
						}
					}
				},
				{
					name = "pcInviteBtn",
					h = 54,
					type = "button",
					w = 125,
					y = -134.9995,
					x = 10,
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
							fontSize = 20,
							name = "Text_8",
							y = 27,
							type = "label",
							x = 62.5,
							textId = 216210
						}
					}
				},
				{
					fontSize = 20,
					name = "pcInviteInfo",
					type = "label",
					y = 27.6666,
					x = 41.9445,
					halign = kCCTextAlignmentLeft
				},
				{
					fontSize = 20,
					name = "signName",
					y = -29.5556,
					type = "label",
					x = 132.6112,
					color = colorQuality[4]
				},
				{
					fontSize = 20,
					name = "pcLeftNum2",
					y = 91.6665,
					type = "label",
					x = -145.5555
				},
				{
					y = -89,
					name = "sczl_sj_icon2",
					type = "sprite",
					x = -20,
					pic = {
						path = "res/ui/resource/silkroad/sczl_sj_icon.png"
					}
				},
				{
					fontSize = 20,
					name = "costPcLb",
					y = -89,
					type = "label",
					x = 24.0557
				},
				{
					w = 42,
					name = "leftBtn",
					h = 100,
					type = "button",
					y = 7,
					x = -240,
					normal = {
						path = "res/ui/resource/silkroad/didi/pcts_btn_arrow.png"
					},
					touched = {
						path = "res/ui/resource/silkroad/didi/pcts_btn_arrow_c.png"
					}
				},
				{
					name = "rightBtn",
					h = 100,
					type = "button",
					w = 42,
					y = 7,
					scaleX = -1,
					x = 240,
					normal = {
						path = "res/ui/resource/silkroad/didi/pcts_btn_arrow.png"
					},
					touched = {
						path = "res/ui/resource/silkroad/didi/pcts_btn_arrow_c.png"
					}
				}
			}
		},
		{
			x = 235,
			name = "invitePctsBtnClose",
			h = 33,
			type = "button",
			w = 32,
			y = 155,
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
local var_0_10 = {
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(128, 144),
	ccp(113, 258),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(124, 279),
	ccp(128, 144),
	ccp(113, 258),
	ccp(124, 279)
}
local var_0_11 = {
	ccp(172, 144),
	ccp(355, 149),
	ccp(532, 224),
	ccp(717, 250),
	ccp(769, 121)
}
local var_0_12 = {
	ccp(192, 190),
	ccp(347, 219),
	ccp(553, 201),
	ccp(745, 209),
	ccp(818, 128)
}
local var_0_13 = {
	ccp(181, 201),
	ccp(288, 176),
	ccp(404, 232),
	ccp(538, 188),
	ccp(639, 120),
	ccp(782, 88)
}
local var_0_14 = {
	ccp(149, 196),
	ccp(285, 255),
	ccp(396, 182),
	ccp(524, 140),
	ccp(654, 150),
	ccp(774, 110)
}
local var_0_15 = {
	ccp(205, 192),
	ccp(295, 127),
	ccp(416, 99),
	ccp(512, 139),
	ccp(603, 222),
	ccp(707, 273),
	ccp(769, 120)
}
local var_0_16 = {
	ccp(210, 204),
	ccp(312, 139),
	ccp(411, 240),
	ccp(519, 211),
	ccp(605, 174),
	ccp(732, 169),
	ccp(831, 124)
}
local var_0_17 = {
	ccp(218, 206),
	ccp(310, 147),
	ccp(408, 124),
	ccp(511, 189),
	ccp(625, 263),
	ccp(712, 259),
	ccp(813, 214)
}
local var_0_18 = {
	ccp(192, 170),
	ccp(286, 121),
	ccp(382, 166),
	ccp(506, 274),
	ccp(619, 228),
	ccp(709, 110),
	ccp(804, 147)
}
local var_0_19 = {
	ccp(182, 220),
	ccp(310, 205),
	ccp(390, 100),
	ccp(499, 137),
	ccp(608, 97),
	ccp(738, 45),
	ccp(840, 120)
}
local var_0_20 = {
	ccp(200, 241),
	ccp(305, 170),
	ccp(442, 127),
	ccp(540, 173),
	ccp(611, 243),
	ccp(691, 163),
	ccp(786, 110)
}
local var_0_21 = {
	var_0_11,
	var_0_12,
	var_0_13,
	var_0_14,
	var_0_15,
	var_0_16,
	var_0_17,
	var_0_18,
	var_0_19,
	var_0_20,
	var_0_11,
	var_0_12,
	var_0_13,
	var_0_14,
	var_0_15,
	var_0_16,
	var_0_17,
	var_0_18,
	var_0_19
}
local var_0_22 = {
	{
		pic = "res/ui/resource/silkroad/food.jpg",
		type = 3
	},
	{
		pic = "res/ui/common/ItemsPic/kuang.jpg",
		type = 4
	},
	{
		pic = "res/ui/resource/silkroad/exp.jpg",
		type = 5
	},
	{
		pic = "res/ui/weapon/baoshi1.jpg",
		type = 21
	},
	{
		pic = "res/ui/resource/silkroad/gjdstj.jpg",
		type = 81
	}
}
local var_0_23 = {
	{
		pic = "res/ui/resource/silkroad/gjcb.jpg",
		type = 10000001
	},
	{
		pic = "res/ui/resource/silkroad/gj1.jpg",
		type = 10000002
	},
	{
		pic = "res/ui/resource/silkroad/gj2.jpg",
		type = 10000003
	},
	{
		pic = "res/ui/resource/silkroad/gj3.jpg",
		type = 10000004
	},
	{
		pic = "res/ui/resource/silkroad/gj4.jpg",
		type = 10000005
	},
	{
		pic = "res/ui/resource/silkroad/gj5.jpg",
		type = 10000006
	}
}
local var_0_24 = {
	{
		pic = "res/ui/resource/silkroad/cqdkj.jpg",
		type = 10000007
	},
	{
		pic = "res/ui/resource/silkroad/kj1.jpg",
		type = 10000008
	},
	{
		pic = "res/ui/resource/silkroad/kj2.jpg",
		type = 10000009
	},
	{
		pic = "res/ui/resource/silkroad/kj3.jpg",
		type = 10000010
	},
	{
		pic = "res/ui/resource/silkroad/kj4.jpg",
		type = 10000011
	},
	{
		pic = "res/ui/resource/silkroad/kj5.jpg",
		type = 10000012
	}
}
local var_0_25 = {
	{
		pic = "res/ui/resource/silkroad/cpddd.jpg",
		type = 10000013
	},
	{
		pic = "res/ui/resource/silkroad/dd1.jpg",
		type = 10000014
	},
	{
		pic = "res/ui/resource/silkroad/dd2.jpg",
		type = 10000015
	},
	{
		pic = "res/ui/resource/silkroad/dd3.jpg",
		type = 10000016
	},
	{
		pic = "res/ui/resource/silkroad/dd4.jpg",
		type = 10000017
	},
	{
		pic = "res/ui/resource/silkroad/dd5.jpg",
		type = 10000018
	}
}
local var_0_26 = {
	{
		pic = "res/ui/resource/silkroad/psdbd.jpg",
		type = 10000019
	},
	{
		pic = "res/ui/resource/silkroad/bd1.jpg",
		type = 10000020
	},
	{
		pic = "res/ui/resource/silkroad/bd2.jpg",
		type = 10000021
	},
	{
		pic = "res/ui/resource/silkroad/bd3.jpg",
		type = 10000022
	},
	{
		pic = "res/ui/resource/silkroad/bd4.jpg",
		type = 10000023
	},
	{
		pic = "res/ui/resource/silkroad/bd5.jpg",
		type = 10000024
	}
}
local var_0_27 = {
	{
		pic = "res/ui/resource/silkroad/ssdhg.jpg",
		type = 10000025
	},
	{
		pic = "res/ui/resource/silkroad/hg1.jpg",
		type = 10000026
	},
	{
		pic = "res/ui/resource/silkroad/hg2.jpg",
		type = 10000027
	},
	{
		pic = "res/ui/resource/silkroad/hg3.jpg",
		type = 10000028
	},
	{
		pic = "res/ui/resource/silkroad/hg4.jpg",
		type = 10000029
	},
	{
		pic = "res/ui/resource/silkroad/hg5.jpg",
		type = 10000030
	}
}
local var_0_28 = {
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/pifengtu.png",
		type = 10000036
	},
	{
		pic = "res/ui/resource/silkroad/pf1.jpg",
		type = 10000037
	},
	{
		pic = "res/ui/resource/silkroad/pf2.jpg",
		type = 10000038
	},
	{
		pic = "res/ui/resource/silkroad/pf3.jpg",
		type = 10000039
	},
	{
		pic = "res/ui/resource/silkroad/pf4.jpg",
		type = 10000040
	},
	{
		pic = "res/ui/resource/silkroad/pf5.jpg",
		type = 10000041
	}
}
local var_0_29 = {
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/qiangtu.png",
		type = 10000043
	},
	{
		pic = "res/ui/resource/silkroad/cq1.jpg",
		type = 10000044
	},
	{
		pic = "res/ui/resource/silkroad/cq2.jpg",
		type = 10000045
	},
	{
		pic = "res/ui/resource/silkroad/cq3.jpg",
		type = 10000046
	},
	{
		pic = "res/ui/resource/silkroad/cq4.jpg",
		type = 10000047
	},
	{
		pic = "res/ui/resource/silkroad/cq5.jpg",
		type = 10000048
	}
}
local var_0_30 = {
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/kuitu.png",
		type = 10000050
	},
	{
		pic = "res/ui/resource/silkroad/tk1.jpg",
		type = 10000051
	},
	{
		pic = "res/ui/resource/silkroad/tk2.jpg",
		type = 10000052
	},
	{
		pic = "res/ui/resource/silkroad/tk3.jpg",
		type = 10000053
	},
	{
		pic = "res/ui/resource/silkroad/tk4.jpg",
		type = 10000054
	},
	{
		pic = "res/ui/resource/silkroad/tk5.jpg",
		type = 10000055
	}
}
local var_0_31 = {
	{
		pic = "res/ui/weapon/silkTreasure/treasure_icon/jinduntu.png",
		type = 10000057
	},
	{
		pic = "res/ui/resource/silkroad/yd1.jpg",
		type = 10000058
	},
	{
		pic = "res/ui/resource/silkroad/yd2.jpg",
		type = 10000059
	},
	{
		pic = "res/ui/resource/silkroad/yd3.jpg",
		type = 10000060
	},
	{
		pic = "res/ui/resource/silkroad/yd4.jpg",
		type = 10000061
	},
	{
		pic = "res/ui/resource/silkroad/yd5.jpg",
		type = 10000062
	}
}
local var_0_32 = {
	{
		pic = "res/ui/resource/silkroad/gjzb1.jpg",
		type = 10000064
	},
	{
		pic = "res/ui/resource/silkroad/gjzb2.jpg",
		type = 10000065
	}
}
local var_0_33 = {
	{
		pic = "res/ui/resource/silkroad/kjzb1.jpg",
		type = 10000066
	},
	{
		pic = "res/ui/resource/silkroad/kjzb2.jpg",
		type = 10000067
	}
}
local var_0_34 = {
	{
		pic = "res/ui/resource/silkroad/ddzb1.jpg",
		type = 10000068
	},
	{
		pic = "res/ui/resource/silkroad/ddzb2.jpg",
		type = 10000069
	}
}
local var_0_35 = {
	{
		pic = "res/ui/resource/silkroad/bdzb1.jpg",
		type = 10000070
	},
	{
		pic = "res/ui/resource/silkroad/bdzb2.jpg",
		type = 10000071
	}
}
local var_0_36 = {
	{
		pic = "res/ui/resource/silkroad/hgzb1.jpg",
		type = 10000072
	},
	{
		pic = "res/ui/resource/silkroad/hgzb2.jpg",
		type = 10000073
	}
}
local var_0_37 = {
	{
		pic = "res/ui/resource/silkroad/pfzb1.jpg",
		type = 10000074
	},
	{
		pic = "res/ui/resource/silkroad/pfzb2.jpg",
		type = 10000075
	}
}
local var_0_38 = {
	{
		pic = "res/ui/resource/silkroad/cqzb1.jpg",
		type = 10000076
	},
	{
		pic = "res/ui/resource/silkroad/cqzb2.jpg",
		type = 10000077
	}
}
local var_0_39 = {
	{
		pic = "res/ui/resource/silkroad/tkzb1.jpg",
		type = 10000078
	},
	{
		pic = "res/ui/resource/silkroad/tkzb2.jpg",
		type = 10000079
	}
}
local var_0_40 = {
	{
		pic = "res/ui/resource/silkroad/ydzb1.jpg",
		type = 10000080
	},
	{
		pic = "res/ui/resource/silkroad/ydzb2.jpg",
		type = 10000081
	}
}
local var_0_41 = {
	var_0_23,
	var_0_24,
	var_0_25,
	var_0_26,
	var_0_27,
	var_0_28,
	var_0_29,
	var_0_30,
	var_0_31,
	map10Items,
	var_0_32,
	var_0_33,
	var_0_34,
	var_0_35,
	var_0_36,
	var_0_37,
	var_0_38,
	var_0_39,
	var_0_40
}
local var_0_42 = {}

var_0_42.gj1 = "zb_s1"
var_0_42.gj2 = "zb_s2"
var_0_42.gj3 = "zb_s3"
var_0_42.gj4 = "zb_s4"
var_0_42.gj5 = "zb_s5"
var_0_42.kj1 = "zb_y1"
var_0_42.kj2 = "zb_y2"
var_0_42.kj3 = "zb_y3"
var_0_42.kj4 = "zb_y4"
var_0_42.kj5 = "zb_y5"
var_0_42.dd1 = "zb_dun1"
var_0_42.dd2 = "zb_dun2"
var_0_42.dd3 = "zb_dun3"
var_0_42.dd4 = "zb_dun4"
var_0_42.dd5 = "zb_dun5"
var_0_42.bd1 = "zb_d1"
var_0_42.bd2 = "zb_d2"
var_0_42.bd3 = "zb_d3"
var_0_42.bd4 = "zb_d4"
var_0_42.bd5 = "zb_d5"
var_0_42.hg1 = "zb_g1"
var_0_42.hg2 = "zb_g2"
var_0_42.hg3 = "zb_g3"
var_0_42.hg4 = "zb_g4"
var_0_42.hg5 = "zb_g5"
var_0_42.pf1 = "zb_pf1"
var_0_42.pf2 = "zb_pf2"
var_0_42.pf3 = "zb_pf3"
var_0_42.pf4 = "zb_pf4"
var_0_42.pf5 = "zb_pf5"
var_0_42.cq1 = "zb_cq1"
var_0_42.cq2 = "zb_cq2"
var_0_42.cq3 = "zb_cq3"
var_0_42.cq4 = "zb_cq4"
var_0_42.cq5 = "zb_cq5"
var_0_42.tk1 = "zb_tk1"
var_0_42.tk2 = "zb_tk2"
var_0_42.tk3 = "zb_tk3"
var_0_42.tk4 = "zb_tk4"
var_0_42.tk5 = "zb_tk5"
var_0_42.yd1 = "zb_yd1"
var_0_42.yd2 = "zb_yd2"
var_0_42.yd3 = "zb_yd3"
var_0_42.yd4 = "zb_yd4"
var_0_42.yd5 = "zb_yd5"
var_0_42.zhanbuxingpan = 1
var_0_42.baoshijiezhi = 2
var_0_42.xiyutuoling = 3
var_0_42.dengta = 1
var_0_42.mingzhuxianglian = 2
var_0_42.hailuohao = 3

local function var_0_43(arg_2_0)
	if not arg_2_0 or tolua.isnull(arg_2_0) then
		return
	end

	local var_2_0 = CCArray:create()

	var_2_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_2_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_2_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_2_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_2_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_2_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_2_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_2_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_2_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_2_0:addObject(CCDelayTime:create(0.4))

	local var_2_1 = CCSequence:create(var_2_0)

	arg_2_0:stopAllActions()
	arg_2_0:runAction(CCRepeatForever:create(var_2_1))
end

local var_0_44 = class("silkRoadLayer", function()
	return createBaseLayer()
end)

function var_0_44.ctor(arg_4_0)
	rmgr.loadResource("res/ui/activity/gangMine/light.plist")
	math.randomseed(os.time())
	arg_4_0:init()
end

function var_0_44.init(arg_5_0)
	arg_5_0._layoutNode = LayoutNode.new()

	arg_5_0:addChild(arg_5_0._layoutNode)
	arg_5_0._layoutNode:setLoadFunc(handler(arg_5_0, arg_5_0.initLayout))
	arg_5_0._layoutNode:reload(var_0_5)

	arg_5_0._canShowNextDialog = true

	cmgr.sendRequest(handler(arg_5_0, arg_5_0.getSilkInfoResponse), actions.getSilkInfo)
end

function var_0_44.onEnter(arg_6_0)
	arg_6_0.autoSilkTime = os.clock()

	function arg_6_0.handlePushDiDiRef(arg_7_0)
		arg_6_0:handlePushDiDi(arg_7_0)
	end

	arg_6_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_6_0, arg_6_0.update), 0, false)

	cmgr.registerResponseHandler(actions.didiPush, arg_6_0.handlePushDiDiRef)
end

function var_0_44.onExit(arg_8_0)
	if arg_8_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_8_0.updateRef)
	end

	cmgr.unregisterResponseHandler(actions.didiPush, arg_8_0.handlePushDiDiRef)
end

function var_0_44.update(arg_9_0, arg_9_1)
	if arg_9_0._data then
		for iter_9_0, iter_9_1 in ipairs(var_0_1) do
			local var_9_0 = arg_9_0._data[iter_9_1]

			if type(var_9_0) == "table" then
				if var_9_0.leftMs > 0 then
					var_9_0.leftMs = var_9_0.leftMs - 1000 * arg_9_1
				elseif var_9_0.leftMs <= 0 then
					var_9_0.leftMs = 0
				end
			end
		end
	end

	if os.clock() - arg_9_0.autoSilkTime > 0.3 and arg_9_0.isAutoStart then
		arg_9_0.autoSilkTime = os.clock()

		if user.autoSilkMode == 1 and user.selectAutoMoreSilk and user.selectAutoMoreSilkNum > 0 then
			arg_9_0._layoutNode:getWidget("rewardListLayer"):setVisible(false)
			cmgr.sendRequest(handler(arg_9_0, arg_9_0.fastSilkRoadResponse), actions.fastSilkRoad, 1, 0)
		end
	end
end

function var_0_44.openAutoSilkMode(arg_10_0)
	if arg_10_0._data and arg_10_0._data.fastSilkRoadInfo then
		local var_10_0 = arg_10_0._data.fastSilkRoadInfo

		arg_10_0._layoutNode:getWidget("selectModeBtnLb1"):setString(language.get(216381, var_10_0.seniorModeGold))
		arg_10_0._layoutNode:getWidget("selectModeBtn1"):setVisible(true)
		arg_10_0._layoutNode:getWidget("autoModeLight1"):setVisible(false)
		arg_10_0._layoutNode:getWidget("selectModeBtnLb2"):setString(language.get(216381, var_10_0.juniorModeGold))
		arg_10_0._layoutNode:getWidget("selectModeBtn2"):setVisible(true)
		arg_10_0._layoutNode:getWidget("autoModeLight2"):setVisible(false)
		arg_10_0._layoutNode:getWidget("selectModeBtn3"):setVisible(true)
		arg_10_0._layoutNode:getWidget("autoModeLight3"):setVisible(false)

		if var_10_0.curMode > 0 then
			arg_10_0._layoutNode:getWidget("selectModeBtn" .. var_10_0.curMode):setVisible(false)
			arg_10_0._layoutNode:getWidget("autoModeLight" .. var_10_0.curMode):setVisible(true)
		end
	end

	arg_10_0._layoutNode:getWidget("autoLayer"):setVisible(true)
end

function var_0_44.selectFastSilkModeResponse(arg_11_0, arg_11_1)
	cmgr.sendRequest(handler(arg_11_0, arg_11_0.getSilkInfoResponse), actions.getSilkInfo)
end

function var_0_44.initLayout(arg_12_0)
	swallowTouch(arg_12_0._layoutNode:getWidget("autoSetBg"))

	user.selectAutoMoreSilk = user.selectAutoMoreSilk or false

	arg_12_0._layoutNode:getWidget("autoMoreOn"):setVisible(user.selectAutoMoreSilk)
	arg_12_0._layoutNode:getWidget("autoMoreBtn"):addHandleOfControlEvent(function()
		arg_12_0._layoutNode:getWidget("autoMoreOn"):setVisible(not arg_12_0._layoutNode:getWidget("autoMoreOn"):isVisible())

		user.selectAutoMoreSilk = arg_12_0._layoutNode:getWidget("autoMoreOn"):isVisible()

		if user.selectAutoMoreSilk then
			user.selectAutoMoreSilkNum = 5
		else
			user.selectAutoMoreSilkNum = 0
		end
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("modeCloseBtn"):addHandleOfControlEvent(function()
		arg_12_0._layoutNode:getWidget("autoLayer"):setVisible(false)
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("autoSetBtn"):addHandleOfControlEvent(function()
		if arg_12_0._pos and arg_12_0._pos == 0 then
			arg_12_0:openAutoSilkMode()
		else
			smgr.showTipTextGreen(language.get(216385))
		end
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("selectModeBtn1"):addHandleOfControlEvent(function()
		cmgr.sendRequest(handler(arg_12_0, arg_12_0.selectFastSilkModeResponse), actions.selectFastSilkMode, 1)
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("selectModeBtn2"):addHandleOfControlEvent(function()
		cmgr.sendRequest(handler(arg_12_0, arg_12_0.selectFastSilkModeResponse), actions.selectFastSilkMode, 2)
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("selectModeBtn3"):addHandleOfControlEvent(function()
		cmgr.sendRequest(handler(arg_12_0, arg_12_0.selectFastSilkModeResponse), actions.selectFastSilkMode, 3)
	end, CCControlEventTouchUpInside)

	user.isNotPlayEffect = true

	arg_12_0._layoutNode:getWidget("unite_view_on"):setVisible(user.isNotPlayEffect or false)
	arg_12_0._layoutNode:getWidget("cbBtn"):addHandleOfControlEvent(function()
		user.isNotPlayEffect = not user.isNotPlayEffect

		arg_12_0._layoutNode:getWidget("unite_view_on"):setVisible(user.isNotPlayEffect)
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btnStart"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.onBtnStartTap), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btn_treasure"):addHandleOfControlEvent(function()
		require("lua/layer/weaponTab/ui")
		weaponTab.ui.show(5)
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btn_silk_tip"):addHandleOfControlEvent(function()
		local var_21_0 = language.get("223507_zhougong", arg_12_0._leftReduceTimes or 0)

		arg_12_0:showTips2(arg_12_0._layoutNode:getWidget("btn_silk_tip"), var_21_0)
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("event"):setTouchEnabled(true)

	local var_12_0 = rmgr.getAnimation("sdtj_itemLight")
	local var_12_1 = CCAnimation:createWithSpriteFrames(var_12_0, 0.04)
	local var_12_2 = CCAnimate:create(var_12_1)

	arg_12_0._layoutNode:getWidget("light_mulNationBuff"):runAction(CCRepeatForever:create(var_12_2))

	local var_12_3 = arg_12_0._layoutNode:getWidget("btn_mulNationBuff")

	var_12_3:addHandleOfControlEvent(function()
		local var_22_0 = arg_12_0._data.mulNationBuff

		if type(var_22_0) == "table" then
			local var_22_1 = var_22_0.name .. "\n" .. var_22_0.tips .. "\n" .. language.get(136103, var_22_0.num) .. "\n" .. tool.getFormatTime(var_22_0.leftMs)

			arg_12_0:showTips2(var_12_3, var_22_1, 1)
		end
	end, CCControlEventTouchUpInside)

	local var_12_4 = CCArray:create()

	for iter_12_0 = 1, 25 do
		local var_12_5 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_12_0))

		var_12_4:addObject(var_12_5:displayFrame())
	end

	local var_12_6 = CCAnimation:createWithSpriteFrames(var_12_4, 0.04)
	local var_12_7 = CCAnimate:create(var_12_6)

	arg_12_0._layoutNode:getWidget("light_dwxzBuff"):runAction(CCRepeatForever:create(var_12_7))

	local var_12_8 = arg_12_0._layoutNode:getWidget("btn_dwxzBuff")

	var_12_8:addHandleOfControlEvent(function()
		local var_23_0 = arg_12_0._data.dwxzBuff

		if type(var_23_0) == "table" then
			local var_23_1 = var_23_0.name .. "\n" .. var_23_0.tips .. "\n" .. language.get(136103, var_23_0.num) .. "\n" .. tool.getFormatTime(var_23_0.leftMs)

			arg_12_0:showTips2(var_12_8, var_23_1, 2)
		end
	end, CCControlEventTouchUpInside)

	local var_12_9 = CCArray:create()

	var_12_9:addObject(CCRotateBy:create(0.1, 10))
	var_12_9:addObject(CCRotateBy:create(0.2, -20))
	var_12_9:addObject(CCRotateBy:create(0.1, 10))

	local var_12_10 = CCRepeat:create(CCSequence:create(var_12_9), 2)
	local var_12_11 = CCArray:create()

	var_12_11:addObject(var_12_10)
	var_12_11:addObject(CCDelayTime:create(0.5))

	local var_12_12 = CCSequence:create(var_12_11)

	arg_12_0._layoutNode:getWidget("icon_gift"):runAction(CCRepeatForever:create(var_12_12))
	arg_12_0._layoutNode:getWidget("btn_gift"):addHandleOfControlEvent(function()
		log.info("btn_gift")
		arg_12_0._layoutNode:getWidget("node_gift"):setVisible(true)
		arg_12_0._layoutNode:getWidget("giftInfo"):setString(language.get(491037, arg_12_0._data.giftNum))
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btn_getGift"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.onGetGift), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btn_assistDialog"):addHandleOfControlEvent(function()
		log.info("btn_assistDialog")
		arg_12_0._layoutNode:getWidget("assist_step1"):setVisible(false)
		arg_12_0._layoutNode:getWidget("assist_step2"):setVisible(true)
	end, CCControlEventTouchUpInside)

	for iter_12_1 = 1, 4 do
		arg_12_0._layoutNode:getWidget("btn_player" .. iter_12_1):addHandleOfControlEvent(function()
			log.info("btn_player" .. iter_12_1)

			local var_26_0 = arg_12_0._assistArray[iter_12_1]

			arg_12_0._layoutNode:getWidget("check" .. iter_12_1):setVisible(not arg_12_0._layoutNode:getWidget("check" .. iter_12_1):isVisible())

			if arg_12_0._layoutNode:getWidget("check" .. iter_12_1):isVisible() then
				local var_26_1, var_26_2 = tool.getPositionInScreen(arg_12_0._layoutNode:getWidget("node_player" .. iter_12_1))
				local var_26_3 = smgr.getLayer("tipLayer")
				local var_26_4 = CCNode:create()

				var_26_4:setPosition(var_26_1, var_26_2)
				var_26_3:addChild(var_26_4)

				local var_26_5 = CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png")

				var_26_5:setScale(0.7)
				var_26_5:setPosition(-15, 0)
				var_26_4:addChild(var_26_5)

				local var_26_6 = CCStrokeLabelTTF:create(string.format("-%d", var_26_0.reduceSilk), "Thonburi-Bold", 22)

				var_26_6:setAnchorPoint(ccp(0, 0.5))
				var_26_6:setPosition(-5, 0)
				var_26_4:addChild(var_26_6)

				local var_26_7 = CCArray:create()

				var_26_7:addObject(CCEaseSineOut:create(CCMoveBy:create(0.6, ccp(0, 60))))
				var_26_7:addObject(CCDelayTime:create(0.4))
				var_26_7:addObject(CCCallFuncN:create(function()
					var_26_4:removeFromParentAndCleanup(true)
				end))
				var_26_4:runAction(CCSequence:create(var_26_7))
			end

			local var_26_8 = 0

			for iter_26_0 = 1, 4 do
				if arg_12_0._layoutNode:getWidget("node_player" .. iter_26_0):isVisible() and arg_12_0._layoutNode:getWidget("check" .. iter_26_0):isVisible() then
					var_26_8 = var_26_8 + 1
				end
			end

			arg_12_0._layoutNode:getWidget("assistNum"):setString(language.get(491034, var_26_8, arg_12_0._data_assist.maxAssistNum))

			local var_26_9 = var_26_8 >= arg_12_0._data_assist.maxAssistNum and colorQuality[5] or tool.hexToRgb("#FFFFCC")

			arg_12_0._layoutNode:getWidget("assistNum"):setColor(var_26_9)

			local var_26_10 = {}
			local var_26_11 = 0

			for iter_26_1 = 1, 4 do
				local var_26_12 = arg_12_0._assistArray[iter_26_1]

				if var_26_12 and arg_12_0._layoutNode:getWidget("node_player" .. iter_26_1):isVisible() then
					local var_26_13 = true

					if var_26_8 >= arg_12_0._data_assist.maxAssistNum and not arg_12_0._layoutNode:getWidget("check" .. iter_26_1):isVisible() then
						var_26_13 = false
					end

					arg_12_0:updateSinglePlayer(iter_26_1, var_26_13)

					if arg_12_0._layoutNode:getWidget("check" .. iter_26_1):isVisible() then
						table.insert(var_26_10, var_26_12.playerId)

						var_26_11 = var_26_11 + var_26_12.reduceSilk
					end
				end
			end

			arg_12_0._layoutNode:getWidget("reduceSilk"):setString(string.format("-%d", var_26_11))
		end, CCControlEventTouchUpInside)
	end

	arg_12_0._layoutNode:getWidget("btn_refresh"):addHandleOfControlEvent(function()
		log.info("btn_refresh")

		local var_28_0 = deepcopy(arg_12_0._data_assist.arrays)

		for iter_28_0 = 1, 4 do
			local var_28_1 = arg_12_0._assistArray[iter_28_0]

			if var_28_1 and arg_12_0._layoutNode:getWidget("check" .. iter_28_0):isVisible() then
				for iter_28_1, iter_28_2 in ipairs(var_28_0) do
					if var_28_1.playerId == iter_28_2.playerId then
						table.remove(var_28_0, iter_28_1)

						break
					end
				end
			end
		end

		for iter_28_3 = 1, 4 do
			if not arg_12_0._layoutNode:getWidget("check" .. iter_28_3):isVisible() then
				local var_28_2 = math.random(#var_28_0)

				arg_12_0._assistArray[iter_28_3] = table.remove(var_28_0, var_28_2)

				arg_12_0:updateSinglePlayer(iter_28_3, arg_12_0._layoutNode:getWidget("btn_player" .. iter_28_3):isEnabled())
			end
		end
	end, CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btn_assist"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.onAsssist), CCControlEventTouchUpInside)

	local function var_12_13(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == CCTOUCHBEGAN then
			if not arg_12_0._layoutNode:getWidget("event"):isVisible() or not tool.checkIfTouch2(arg_12_0._layoutNode:getWidget("event"), arg_29_1, arg_29_2) then
				return false
			end

			arg_12_0:onEventClicked("began", arg_12_0._layoutNode:getWidget("event"))

			return true
		end
	end

	arg_12_0._layoutNode:getWidget("bwSp"):setTouchEnabled(false)
	arg_12_0._layoutNode:getWidget("bwSp"):registerScriptTouchHandler(handler(arg_12_0, arg_12_0.onTouchbwSp), false, true)
	arg_12_0._layoutNode:getWidget("event"):registerScriptTouchHandler(var_12_13, false, true)
	arg_12_0._layoutNode:getWidget("dialog"):setTouchEnabled(true)
	arg_12_0._layoutNode:getWidget("dialog"):registerScriptTouchHandler(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == CCTOUCHBEGAN and arg_12_0._layoutNode:getWidget("dialog"):isVisible() and tool.checkIfTouch2(arg_12_0._layoutNode:getWidget("dialog"), arg_30_1, arg_30_2) then
			arg_12_0:showNextDialog()

			return true
		end

		return false
	end, false, true)
	arg_12_0._layoutNode:getWidget("dialog"):setVisible(false)
	arg_12_0._layoutNode:getWidget("dialogInfo"):setDimensions(CCSizeMake(315, 0))
	arg_12_0._layoutNode:getWidget("dialogInfo"):setString("打卡机弗拉德科夫就爱上了的空间发了卡上的放假了刷卡的房间看了撒绝地反击奥斯卡房间")
	arg_12_0._layoutNode:getWidget("choiceLayer"):setVisible(false)
	arg_12_0._layoutNode:getWidget("selectItemLayer"):setVisible(false)
	arg_12_0._layoutNode:getWidget("rewardLayer"):setVisible(false)
	arg_12_0._layoutNode:getWidget("loadingbar"):setPercentage(0)
	arg_12_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/car1.png"):displayFrame())
	arg_12_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/car_red1.png"):displayFrame())
	arg_12_0._layoutNode:getWidget("btnToken"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.useMerchantToken), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("btnTip"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.showTip), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("ok"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.onOkClick), CCControlEventTouchUpInside)
	arg_12_0:setVisible(false)
	arg_12_0._layoutNode:getWidget("SilkTreasure1"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchDownSilkTreasure, 1), CCControlEventTouchDown)
	arg_12_0._layoutNode:getWidget("SilkTreasure2"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchDownSilkTreasure, 2), CCControlEventTouchDown)
	arg_12_0._layoutNode:getWidget("SilkTreasure3"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchDownSilkTreasure, 3), CCControlEventTouchDown)
	arg_12_0._layoutNode:getWidget("SilkTreasure1"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchUpInSilkTreasure, 1), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("SilkTreasure2"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchUpInSilkTreasure, 2), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("SilkTreasure3"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchUpInSilkTreasure, 3), CCControlEventTouchUpInside)
	arg_12_0._layoutNode:getWidget("SilkTreasure1"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchUpInSilkTreasure, 1), CCControlEventTouchUpOutside)
	arg_12_0._layoutNode:getWidget("SilkTreasure2"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchUpInSilkTreasure, 2), CCControlEventTouchUpOutside)
	arg_12_0._layoutNode:getWidget("SilkTreasure3"):addHandleOfControlEvent(handlerA(arg_12_0, arg_12_0.touchUpInSilkTreasure, 3), CCControlEventTouchUpOutside)
	arg_12_0._layoutNode:getWidget("startCarpoolBtn"):addHandleOfControlEvent(handler(arg_12_0, arg_12_0.startCarpoolClick), CCControlEventTouchUpInside)
end

function var_0_44.handlePushDiDi(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1.action.data.update

	if var_31_0.didiInfo then
		arg_31_0:updateDiDiInfoSp(var_31_0.didiInfo)
	end

	if var_31_0.didiFail then
		smgr.showTipTextGreen2(language.get(216219))
		arg_31_0._layoutNode:getWidget("chengkeBtn"):setVisible(false)
	end

	if var_31_0.playerName and var_31_0.pic then
		arg_31_0.haschengke = true

		if arg_31_0.carpoolView then
			arg_31_0.carpoolView:removeFromParentAndCleanup(true)

			arg_31_0.carpoolView = nil
			arg_31_0.diView = nil
		end

		arg_31_0:updateDiDiSjSp(var_31_0)

		local var_31_1 = CCSprite:create("res/ui/resource/silkroad/didi/pcts_word_zdpchb.png")

		var_31_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 50))
		smgr.showTipSpriteText(var_31_1)
	end
end

function var_0_44.updateDiDiSjSp(arg_32_0, arg_32_1)
	arg_32_0._layoutNode:getWidget("chengkePic"):setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_1" .. arg_32_1.pic .. ".png"):displayFrame())
	arg_32_0._layoutNode:getWidget("chengkeBtn"):setVisible(true)
	arg_32_0._layoutNode:getWidget("chengkeBtn"):addHandleOfControlEvent(function()
		local var_33_0 = language.get(216218, arg_32_1.playerName or "")

		arg_32_0:showTips2(arg_32_0._layoutNode:getWidget("chengkeBtn"), var_33_0)
	end, CCControlEventTouchUpInside)
end

function var_0_44.updateDiDiInfoSp(arg_34_0, arg_34_1)
	if arg_34_1 and arg_34_1.posInfo then
		if arg_34_1.posInfo.needReward then
			arg_34_0._layoutNode:getWidget("didiInfoSp"):setVisible(false)
			arg_34_0._layoutNode:getWidget("getDiDiRewardBtn"):setVisible(true)

			local function var_34_0()
				cmgr.sendRequest(function(arg_36_0)
					local var_36_0 = arg_36_0.action.data

					if var_36_0.rewards then
						local var_36_1 = {}

						for iter_36_0, iter_36_1 in ipairs(var_36_0.rewards) do
							local var_36_2 = {
								id = var_0_2[iter_36_1.type].type,
								value = iter_36_1.num
							}

							table.insert(var_36_1, var_36_2)
						end

						globalAction_gotResource(var_36_1)
						cmgr.sendRequest(handler(arg_34_0, arg_34_0.getSilkInfoResponse), actions.getSilkInfo)
					end

					if var_36_0.havePiece then
						arg_34_0.isDiDiReward = true

						cmgr.sendRequest(handler(arg_34_0, arg_34_0.getSilkRewardListResponse), actions.getSilkRewardList, 1)
					end
				end, actions.getDidiReward)
			end

			arg_34_0._layoutNode:getWidget("getDiDiRewardBtn"):addHandleOfControlEvent(var_34_0, CCControlEventTouchDown)
		else
			if arg_34_1.posInfo.terminal then
				arg_34_0._layoutNode:getWidget("cityInfoLb"):setString(language.get(216216))
			elseif arg_34_1.posInfo.position == 0 then
				arg_34_0._layoutNode:getWidget("cityInfoLb"):setString(language.get(216214))
			else
				arg_34_0._layoutNode:getWidget("cityInfoLb"):setString(language.get(216215, arg_34_1.posInfo.position))
			end

			arg_34_0._layoutNode:getWidget("didiHead"):setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_1" .. arg_34_1.posInfo.pic .. ".png"):displayFrame())
			arg_34_0._layoutNode:getWidget("didiInfoSp"):setVisible(true)

			local function var_34_1()
				messageBox.confirm(language.get(216217), function()
					cmgr.sendRequest(function(arg_39_0)
						if arg_39_0.action.data.cost then
							smgr.showTipTextGreen2(language.get(216207))
						end

						cmgr.sendRequest(handler(arg_34_0, arg_34_0.getSilkInfoResponse), actions.getSilkInfo)
					end, actions.getOffDidi)
				end)
			end

			arg_34_0._layoutNode:getWidget("cancelInviteBtn"):addHandleOfControlEvent(var_34_1, CCControlEventTouchDown)
		end
	end
end

function var_0_44.getDiDiHandlerAction(arg_40_0, arg_40_1)
	arg_40_0.carpoolInfoVO = arg_40_1.action.data

	arg_40_0:updateCarpoolView(arg_40_0.diView)
end

function var_0_44.startCarpoolClick(arg_41_0)
	if arg_41_0.carpoolView then
		arg_41_0.carpoolView:removeFromParentAndCleanup(true)

		arg_41_0.carpoolView = nil
	end

	local var_41_0 = {}

	uiutil.initWidgets(var_41_0, var_0_9)
	swallowTouch(var_41_0.widgets.sczl_jz)
	arg_41_0._layoutNode:getWidget("sczl_bg"):addChild(var_41_0.widgets.pcNode)

	arg_41_0.carpoolView = var_41_0.widgets.pcNode

	var_41_0.widgets.invitePctsBtnClose:addHandleOfControlEvent(function()
		if arg_41_0.carpoolView then
			arg_41_0.carpoolView:removeFromParentAndCleanup(true)

			arg_41_0.carpoolView = nil
			arg_41_0.diView = nil
			var_41_0 = nil
		end
	end, CCControlEventTouchUpInside)

	arg_41_0.diView = var_41_0

	cmgr.sendRequest(handler(arg_41_0, arg_41_0.getDiDiHandlerAction), actions.getDidiInfo)
end

function var_0_44.updateCarpoolView(arg_43_0, arg_43_1)
	local var_43_0 = 0

	local function var_43_1(arg_44_0)
		if arg_44_0 == 1 then
			arg_43_1.widgets.carpoolItemRenderer2:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_pc_di01.png"):displayFrame())
			arg_43_1.widgets.pcts_head2:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_head_di01.png"):displayFrame())
			arg_43_1.widgets.carpoolItemRenderer1:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_pc_di02.png"):displayFrame())
			arg_43_1.widgets.pcts_head1:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_head_di02.png"):displayFrame())
		else
			arg_43_1.widgets.carpoolItemRenderer1:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_pc_di01.png"):displayFrame())
			arg_43_1.widgets.pcts_head1:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_head_di01.png"):displayFrame())
			arg_43_1.widgets.carpoolItemRenderer2:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_pc_di02.png"):displayFrame())
			arg_43_1.widgets.pcts_head2:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_head_di02.png"):displayFrame())
		end

		arg_43_0.selectPlayerId = arg_44_0
	end

	var_43_1(1)
	arg_43_1.widgets.CarpoolTradeNode:setVisible(false)
	arg_43_1.widgets.CarpoolInviteNode:setVisible(false)

	if user.isReciveInvitePcts then
		arg_43_1.widgets.pcTitle:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_word_pcyq.png"):displayFrame())
		arg_43_1.widgets.CarpoolInviteNode:setVisible(true)

		user.isReciveInvitePcts = false

		local function var_43_2(arg_45_0)
			local var_45_0 = arg_45_0.action.data
			local var_45_1 = 1
			local var_45_2 = 1

			arg_43_0.didiDriversVO = var_45_0

			arg_43_1.widgets.pcInviteInfo:setString(language.get(216211))
			arg_43_1.widgets.costPcLb:setString(arg_43_0.didiDriversVO.cost[1].num)
			arg_43_1.widgets.pcLeftNum2:setString(language.get(216204, arg_43_0.didiDriversVO.takeTimes, arg_43_0.didiDriversVO.maxTakeTimes))

			local function var_45_3(arg_46_0)
				local var_46_0 = var_45_0.didiDrivers[arg_46_0]

				var_45_2 = var_46_0.driverId or 1

				arg_43_1.widgets.signName:setString(language.get(216212, var_46_0.playerName))
				arg_43_1.widgets.pcPlayerHead_icon:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_46_0.pic .. ".png"):displayFrame())
			end

			var_45_3(var_45_1)

			local function var_45_4()
				if var_45_1 > 1 then
					var_45_1 = var_45_1 - 1
				end

				var_45_3(var_45_1)
			end

			local function var_45_5()
				if var_45_1 < #var_45_0.didiDrivers then
					var_45_1 = var_45_1 + 1
				end

				var_45_3(var_45_1)
			end

			local function var_45_6()
				cmgr.sendRequest(function(arg_50_0)
					if arg_43_0.carpoolView then
						arg_43_0.carpoolView:removeFromParentAndCleanup(true)

						arg_43_0.carpoolView = nil
						arg_43_0.diView = nil
					end

					cmgr.sendRequest(handler(arg_43_0, arg_43_0.getSilkInfoResponse), actions.getSilkInfo)
				end, actions.getOnDidi, var_45_2)
			end

			arg_43_1.widgets.leftBtn:addHandleOfControlEvent(var_45_4, CCControlEventTouchDown)
			arg_43_1.widgets.rightBtn:addHandleOfControlEvent(var_45_5, CCControlEventTouchDown)
			arg_43_1.widgets.pcInviteBtn:addHandleOfControlEvent(var_45_6, CCControlEventTouchDown)
		end

		cmgr.sendRequest(var_43_2, actions.getDidiDrivers)
	else
		arg_43_1.widgets.pcTitle:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/didi/pcts_word_qcts.png"):displayFrame())
		arg_43_1.widgets.pcEvent1:setVisible(false)
		arg_43_1.widgets.pcEvent2:setVisible(false)

		if arg_43_0.carpoolInfoVO.waitTime and arg_43_0.carpoolInfoVO.waitTime > 0 then
			arg_43_0.carpoolInfoVO.state = 2

			arg_43_1.widgets.pcEvent2:setVisible(true)
			arg_43_1.widgets.invitePctsBtnClose:setVisible(false)
			arg_43_1.widgets.pcWaitTimeLb:stopAllActions()

			if arg_43_0.carpoolInfoVO.waitTime > 0 then
				local var_43_3 = CCArray:create()

				var_43_3:addObject(CCCallFunc:create(function()
					arg_43_0.carpoolInfoVO.waitTime = arg_43_0.carpoolInfoVO.waitTime - 1000

					if arg_43_0.carpoolInfoVO.waitTime <= 0 then
						cmgr.sendRequest(handler(arg_43_0, arg_43_0.getDiDiHandlerAction), actions.getDidiInfo)
					else
						arg_43_1.widgets.pcWaitTimeLb:setString(language.get(216208, tool.getFormatTime(arg_43_0.carpoolInfoVO.waitTime)))
					end
				end))
				var_43_3:addObject(CCDelayTime:create(1))

				local var_43_4 = CCSequence:create(var_43_3)

				arg_43_1.widgets.pcWaitTimeLb:runAction(CCRepeatForever:create(var_43_4))
			end

			local function var_43_5()
				cmgr.sendRequest(function(arg_53_0)
					if arg_53_0.action.data.cost then
						smgr.showTipTextGreen2(language.get(216207))
					end

					local var_53_0 = CCSprite:create("res/ui/resource/silkroad/didi/pcts_word_qxpc.png")

					var_53_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 50))
					smgr.showTipSpriteText(var_53_0)
					cmgr.sendRequest(handler(arg_43_0, arg_43_0.getDiDiHandlerAction), actions.getDidiInfo)
				end, actions.cancelDidi)
			end

			arg_43_1.widgets.pctsCancelBtn:addHandleOfControlEvent(var_43_5, CCControlEventTouchDown)
		else
			arg_43_0.carpoolInfoVO.state = 1

			arg_43_1.widgets.pcEvent1:setVisible(true)
			arg_43_1.widgets.invitePctsBtnClose:setVisible(true)
			arg_43_1.widgets.pcLeftNum:setString(language.get(216204, arg_43_0.carpoolInfoVO.driverTimes, arg_43_0.carpoolInfoVO.maxDriverTimes) or "")

			if arg_43_0.carpoolInfoVO.passengers then
				if arg_43_0.carpoolInfoVO.passengers[1] and arg_43_0.carpoolInfoVO.passengers[1].cost and arg_43_0.carpoolInfoVO.passengers[1].cost[1] then
					arg_43_1.widgets.pcGoldLb1:setString(arg_43_0.carpoolInfoVO.passengers[1].cost[1].num or 0)

					var_43_0 = arg_43_0.carpoolInfoVO.passengers[1].cost[1].num or 0
				end

				if arg_43_0.carpoolInfoVO.passengers[2] and arg_43_0.carpoolInfoVO.passengers[2].cost then
					if arg_43_0.carpoolInfoVO.passengers[2].cost[1] then
						arg_43_1.widgets.pcGoldLb2:setString(arg_43_0.carpoolInfoVO.passengers[2].cost[1].num or 0)
					end

					if arg_43_0.carpoolInfoVO.passengers[2].cost[2] then
						arg_43_1.widgets.pcSilkLb2:setString(arg_43_0.carpoolInfoVO.passengers[2].cost[2].num or 0)
					end
				end
			end

			local function var_43_6()
				var_43_1(1)
			end

			local function var_43_7()
				var_43_1(2)
			end

			local function var_43_8()
				if arg_43_0.carpoolInfoVO.state == 1 then
					messageBox.showChargeWin(language.get(190080), language.get(216206, var_43_0), "silkDidiGold", function()
						cmgr.sendRequest(function()
							cmgr.sendRequest(handler(arg_43_0, arg_43_0.getSilkInfoResponse), actions.getSilkInfo)
						end, actions.startDidi, arg_43_0.selectPlayerId or 1)
					end)
				end
			end

			arg_43_1.widgets.carpoolItemRendererBtn1:addHandleOfControlEvent(var_43_6, CCControlEventTouchDown)
			arg_43_1.widgets.carpoolItemRendererBtn2:addHandleOfControlEvent(var_43_7, CCControlEventTouchDown)
			arg_43_1.widgets.pctsEventBtn:addHandleOfControlEvent(var_43_8, CCControlEventTouchDown)
		end

		arg_43_1.widgets.CarpoolTradeNode:setVisible(true)
	end
end

function var_0_44.onTouchbwSp(arg_59_0)
	cmgr.sendRequest(function(arg_60_0)
		arg_59_0:silkHandleEventResponse(arg_60_0, 1)

		local var_60_0 = arg_60_0.action.data
		local var_60_1 = var_60_0.id

		if var_60_1 > 3 then
			var_60_1 = var_60_1 - 3
		end

		if var_60_0.ifLast then
			arg_59_0._layoutNode:getWidget("bwIconSp"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_" .. arg_59_0._curTradeTreasurePic .. ".png"):displayFrame())
			arg_59_0._layoutNode:getWidget("tsbw_titleSp"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_word_bw_xfcg.png"):displayFrame())
			arg_59_0._layoutNode:getWidget("tsbw_bw_bg"):setVisible(true)

			local var_60_2 = CCArray:create()
			local var_60_3, var_60_4 = tool.getPositionInScreen(arg_59_0._layoutNode:getWidget("SilkTreasure" .. var_0_42[arg_59_0._curTradeTreasurePic]))
			local var_60_5 = smgr.getLayer("topLayer")
			local var_60_6 = CCSprite:create("res/ui/resource/silkroad/tsbw_" .. arg_59_0._curTradeTreasurePic .. ".png")
			local var_60_7, var_60_8 = tool.getPositionInScreen(arg_59_0._layoutNode:getWidget("bwIconSp"))

			var_60_6:setPosition(var_60_7, var_60_8)
			var_60_5:addChild(var_60_6)
			var_60_2:addObject(CCDelayTime:create(1))
			var_60_2:addObject(CCMoveTo:create(0.5, ccp(var_60_3, var_60_4)))
			var_60_2:addObject(CCDelayTime:create(0.2))
			var_60_2:addObject(CCCallFuncN:create(function()
				var_60_6:removeFromParentAndCleanup(true)
				arg_59_0._layoutNode:getWidget("tsbw_bw_bg"):setVisible(false)
			end))

			local var_60_9 = CCSequence:create(var_60_2)

			var_60_6:runAction(var_60_9)
			arg_59_0._layoutNode:getWidget("TreasureLb" .. var_60_1):setVisible(false)
			arg_59_0._layoutNode:getWidget("TreasureIcon" .. var_60_1):removeAllChildrenWithCleanup(true)
		else
			local var_60_10 = arg_59_0._tradeTreasureArrs[var_60_1]

			var_60_10.curNum = var_60_10.curNum + var_60_0.num

			arg_59_0._layoutNode:getWidget("TreasureLb" .. var_60_1):setString(var_60_10.curNum .. "/" .. var_60_10.maxNum)

			if var_60_10.remainHugeTradeTimes and var_60_10.remainHugeTradeTimes > 0 and (var_60_10.id and var_60_10.id == 3 or var_60_10.id == 6) then
				arg_59_0._layoutNode:getWidget("TreasureLb" .. var_60_1):setString("x" .. var_60_10.remainHugeTradeTimes)
			end
		end

		if var_60_0.remainPickTimes == 0 or var_60_0.ifLast then
			arg_59_0._layoutNode:getWidget("bwSp"):setTouchEnabled(false)
			arg_59_0._layoutNode:getWidget("tsbw_tsz_bg"):setVisible(false)
			cmgr.sendRequest(handler(arg_59_0, arg_59_0.getSilkInfoResponse), actions.getSilkInfo)
		end
	end, actions.silkPickTradePiece)
end

function handlerA(arg_62_0, arg_62_1, arg_62_2)
	return function(...)
		return arg_62_1(arg_62_0, arg_62_2, ...)
	end
end

function var_0_44.touchDownSilkTreasure(arg_64_0, arg_64_1)
	arg_64_0:showSilkTreasureTip(true, arg_64_1)
end

function var_0_44.touchUpInSilkTreasure(arg_65_0, arg_65_1)
	arg_65_0:showSilkTreasureTip(false, arg_65_1)

	if arg_65_1 == 3 or arg_65_1 == 6 then
		cmgr.sendRequest(function(arg_66_0)
			if arg_65_0.mapResId >= 6 then
				arg_65_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame())
				arg_65_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame())
			else
				arg_65_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame())
				arg_65_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame())
			end

			arg_65_0._ifHugeTrade = true
			arg_65_0._suffix = "suffix_dts"

			arg_65_0._layoutNode:getWidget("TreasureLb3"):setString("0/" .. arg_65_0._maxTradeNum)

			if arg_65_0.light then
				arg_65_0.light:removeFromParentAndCleanup(true)

				arg_65_0.light = nil
			end

			arg_65_0._layoutNode:getWidget("needNum"):setString(arg_66_0.action.data.needSilk or 0)

			if user.autoSilkMode ~= 1 and user.autoSilkMode ~= 2 then
				arg_65_0._layoutNode:getWidget("Text_2"):setString(language.get(491010))
			end

			arg_65_0._layoutNode:getWidget("tsbwKZSp"):setVisible(true)

			local var_66_0 = CCArray:create()

			var_66_0:addObject(CCFadeIn:create(0.2))
			var_66_0:addObject(CCDelayTime:create(1))
			var_66_0:addObject(CCFadeOut:create(0.2))
			var_66_0:addObject(CCCallFuncN:create(function()
				arg_65_0._layoutNode:getWidget("tsbwKZSp"):setVisible(false)
			end))
			arg_65_0._layoutNode:getWidget("tsbwKZSp"):runAction(CCSequence:create(var_66_0))
		end, actions.silkCamelBell)
	end
end

function var_0_44.updateSinglePlayer(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = arg_68_0._assistArray[arg_68_1]

	arg_68_0._layoutNode:getWidget("pic_player" .. arg_68_1):setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", var_68_0.pic)):displayFrame())
	arg_68_0._layoutNode:getWidget("btn_player_disable" .. arg_68_1):setVisible(not arg_68_2)
	arg_68_0._layoutNode:getWidget("btn_player" .. arg_68_1):setEnabled(arg_68_2)
	arg_68_0._layoutNode:getWidget("name" .. arg_68_1):setString(var_68_0.name)
	arg_68_0._layoutNode:getWidget("silkRoadLv" .. arg_68_1):setString(var_68_0.silkRoadLv)

	local var_68_1 = arg_68_2 and var_0_4(var_68_0.silkRoadLv) or tool.hexToRgb("#717173")

	arg_68_0._layoutNode:getWidget("name" .. arg_68_1):setColor(var_68_1)
	arg_68_0._layoutNode:getWidget("silkRoadLv" .. arg_68_1):setColor(var_68_1)
end

function var_0_44.showSilkTreasureTip(arg_69_0, arg_69_1, arg_69_2)
	if arg_69_0.view and arg_69_0.view.widgets.tipFrame then
		arg_69_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_69_0.view.widgets.tipFrame = nil
	end

	if arg_69_1 then
		local var_69_0 = 0
		local var_69_1 = 0

		if arg_69_0.view == nil then
			arg_69_0.view = {}
		end

		uiutil.initWidgets(arg_69_0.view, var_0_8)
		arg_69_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		arg_69_0:addChild(arg_69_0.view.widgets.tipFrame)

		local var_69_2, var_69_3 = tool.getPositionInScreen(arg_69_0._layoutNode:getWidget("SilkTreasure" .. arg_69_2))
		local var_69_4 = var_69_2 + 20
		local var_69_5 = var_69_3 + 20
		local var_69_6 = arg_69_0._tradeTreasureArrs[arg_69_2].tips

		arg_69_0.view.widgets.tipMsg:setString(var_69_6)

		local var_69_7 = arg_69_0.view.widgets.tipMsg:getContentSize().width
		local var_69_8 = arg_69_0.view.widgets.tipMsg:getContentSize().height

		arg_69_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_69_7 + 30, var_69_8 + 30))
		arg_69_0.view.widgets.tipFrame:setPosition(ccp(var_69_4, var_69_5))
		arg_69_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_69_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_44.startSilkRoad(arg_70_0, ...)
	cmgr.sendRequest(function(...)
		if arg_70_0.carpoolView then
			arg_70_0.carpoolView:removeFromParentAndCleanup(true)

			arg_70_0.carpoolView = nil
		end

		local var_71_0

		if arg_70_0.haschengke then
			var_71_0 = CCSprite:create("res/ui/resource/silkroad/didi/pcts_word_kspctsxhjb.png")
			arg_70_0.haschengke = false
		else
			var_71_0 = CCSprite:create("res/ui/resource/silkroad/sczl_word_tsks.png")
		end

		var_71_0:setScale(3)
		var_71_0:setPosition(ccp(arg_70_0:getContentSize().width / 2, arg_70_0:getContentSize().height / 2))
		arg_70_0:addChild(var_71_0)
		var_71_0:runAction(CCSequence:createWithTwoActions(CCSpawn:createWithTwoActions(CCScaleTo:create(0.2, 1), CCFadeIn:create(0.2)), CCCallFunc:create(function(...)
			var_71_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), CCCallFunc:create(function(...)
				var_71_0:removeFromParentAndCleanup(true)
			end)))
			cmgr.sendRequest(handler(arg_70_0, arg_70_0.getSilkInfoResponse), actions.getSilkInfo)
		end)))
	end, actions.silkDispatch)
end

function var_0_44.onGetAssistInfo(arg_74_0)
	local function var_74_0(arg_75_0)
		local var_75_0 = arg_75_0.action.data

		arg_74_0._data_assist = var_75_0

		arg_74_0._layoutNode:getWidget("node_assist"):setVisible(true)
		arg_74_0._layoutNode:getWidget("assist_step1"):setVisible(true)
		arg_74_0._layoutNode:getWidget("assist_step2"):setVisible(false)

		local var_75_1 = #var_75_0.arrays > 0
		local var_75_2 = #var_75_0.arrays > 4

		arg_74_0._layoutNode:getWidget("node_assistList"):setVisible(var_75_1)
		arg_74_0._layoutNode:getWidget("no_assist"):setVisible(not var_75_1)
		arg_74_0._layoutNode:getWidget("btn_refresh"):setVisible(var_75_2)

		for iter_75_0 = 1, 4 do
			arg_74_0._layoutNode:getWidget("node_player" .. iter_75_0):setVisible(false)
		end

		arg_74_0._assistArray = {}

		if var_75_1 then
			local var_75_3 = var_75_2 and 4 or #var_75_0.arrays

			for iter_75_1 = 1, var_75_3 do
				local var_75_4 = var_75_0.arrays[iter_75_1]

				arg_74_0._assistArray[iter_75_1] = var_75_4

				arg_74_0._layoutNode:getWidget("node_player" .. iter_75_1):setVisible(true)
				arg_74_0._layoutNode:getWidget("node_player" .. iter_75_1):setPosition(233 + 108 * (iter_75_1 - 0.5 * var_75_3 - 0.5), 84)
				arg_74_0._layoutNode:getWidget("check" .. iter_75_1):setVisible(false)
				arg_74_0:updateSinglePlayer(iter_75_1, true)
			end
		end

		arg_74_0._layoutNode:getWidget("lbl_btn_assist"):setString(language.get(var_75_1 and 491033 or 390008))
		arg_74_0._layoutNode:getWidget("assistNum"):setString(language.get(491034, 0, var_75_0.maxAssistNum))
		arg_74_0._layoutNode:getWidget("reduceSilk"):setString("-0")
	end

	cmgr.sendRequest(var_74_0, actions.getAssistInfo)
end

function var_0_44.onAsssist(arg_76_0)
	log.info("btn_assist")

	local function var_76_0(arg_77_0)
		arg_76_0._layoutNode:getWidget("node_assist"):setVisible(false)
		arg_76_0:startSilkRoad()
	end

	local var_76_1 = {}

	for iter_76_0 = 1, 4 do
		local var_76_2 = arg_76_0._assistArray[iter_76_0]

		if var_76_2 and arg_76_0._layoutNode:getWidget("check" .. iter_76_0):isVisible() then
			table.insert(var_76_1, var_76_2.playerId)
		end
	end

	local var_76_3 = table.concat(var_76_1, "#")

	cmgr.sendRequest(var_76_0, actions.silkAsssist, var_76_3)
end

function var_0_44.fastSilkRoadResponse(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_1.action.data
	local var_78_1 = var_78_0.maxPos
	local var_78_2 = 1
	local var_78_3 = {}

	for iter_78_0, iter_78_1 in ipairs(var_78_0.totalRewards) do
		local var_78_4 = iter_78_1.pos

		if var_78_1 <= iter_78_1.pos then
			var_78_4 = var_78_1
		end

		local var_78_5 = tostring(var_78_4)

		if not var_78_3[var_78_5] then
			var_78_3[var_78_5] = {}
		end

		var_78_3[var_78_5].pos = tonumber(var_78_5)

		if not var_78_3[var_78_5].rewards then
			var_78_3[var_78_5].rewards = {}
		end

		if iter_78_1.rewards then
			for iter_78_2, iter_78_3 in ipairs(iter_78_1.rewards) do
				var_78_3[var_78_5].rewards[#var_78_3[var_78_5].rewards + 1] = iter_78_3
			end
		end

		if iter_78_1.extRewards then
			for iter_78_4, iter_78_5 in ipairs(iter_78_1.extRewards) do
				var_78_3[var_78_5].rewards[#var_78_3[var_78_5].rewards + 1] = iter_78_5
			end
		end

		if iter_78_1.remainPickTimes then
			var_78_3[var_78_5] = iter_78_1
			var_78_3[var_78_5].rewards = {}
			var_78_3[var_78_5].isTradeTreasure = true
		end

		if var_78_2 < iter_78_1.pos then
			var_78_2 = iter_78_1.pos
		end
	end

	local var_78_6 = {}

	if var_78_1 < var_78_2 then
		var_78_2 = var_78_1
	end

	for iter_78_6 = arg_78_0._pos, var_78_2 do
		if iter_78_6 > 0 then
			local var_78_7 = var_78_3[tostring(iter_78_6)] or {
				isEmpty = true,
				pos = iter_78_6
			}

			if var_78_0.stop and iter_78_6 == var_78_2 then
				var_78_7.stop = true
			end

			if isManual and iter_78_6 == arg_78_0._pos then
				var_78_7.isManual = true
			end

			table.insert(var_78_6, var_78_7)
		end
	end

	if var_78_0.stop and var_78_0.errorMsg and var_78_0.errorMsg ~= "" then
		arg_78_0:onEventClicked("began", arg_78_0._layoutNode:getWidget("event"))
		smgr.showTipTextGreen(var_78_0.errorMsg)
		arg_78_0:runToPos(var_78_0.pos)
	end

	local var_78_8 = false

	if not var_78_0.stop and var_78_6[#var_78_6].pos == var_78_1 then
		arg_78_0:removeCreateNodes()
		arg_78_0._layoutNode:getWidget("dialog"):setVisible(false)

		arg_78_0._canShowNextDialog = true

		cmgr.sendRequest(handler(arg_78_0, arg_78_0.getSilkRewardListResponse), actions.getSilkRewardList, 0)
		cmgr.sendRequest(handler(arg_78_0, arg_78_0.getSilkInfoResponse), actions.getSilkInfo)

		if user.autoSilkMode == 1 then
			if user.selectAutoMoreSilk and user.selectAutoMoreSilkNum > 0 then
				user.selectAutoMoreSilkNum = user.selectAutoMoreSilkNum - 1

				arg_78_0._layoutNode:getWidget("Text_2"):setString(language.get(216386, user.selectAutoMoreSilkNum))
			else
				arg_78_0.isAutoStart = false

				arg_78_0._layoutNode:getWidget("Text_2"):setString(language.get(216391))
			end
		end

		var_78_8 = true
	end

	if var_78_0.pos and var_78_0.pos == 0 and not var_78_8 then
		arg_78_0:removeCreateNodes()
		arg_78_0._layoutNode:getWidget("dialog"):setVisible(false)

		arg_78_0._canShowNextDialog = true

		cmgr.sendRequest(handler(arg_78_0, arg_78_0.getSilkRewardListResponse), actions.getSilkRewardList, 0)
		cmgr.sendRequest(handler(arg_78_0, arg_78_0.getSilkInfoResponse), actions.getSilkInfo)
	end

	if var_78_0.pos then
		arg_78_0._layoutNode:getWidget("btnStart"):setVisible(var_78_0.pos == 0)
	end
end

function var_0_44.onBtnStartTap(arg_79_0)
	if arg_79_0._data and arg_79_0._data.fastSilkRoadInfo and arg_79_0._data.fastSilkRoadInfo.curMode == 0 then
		arg_79_0:openAutoSilkMode()
		smgr.showTipTextGreen(language.get(216384))

		return
	end

	if user.autoSilkMode == 1 then
		if user.selectAutoMoreSilk then
			user.selectAutoMoreSilkNum = 5
		end

		arg_79_0.isAutoStart = true

		cmgr.sendRequest(handler(arg_79_0, arg_79_0.fastSilkRoadResponse), actions.fastSilkRoad, 0, 0)
	elseif user.autoSilkMode == 2 then
		cmgr.sendRequest(handler(arg_79_0, arg_79_0.fastSilkRoadResponse), actions.fastSilkRoad, 0, 0)
	elseif arg_79_0._data.assistTechOpen == true and arg_79_0._data.leftAssistSize > 0 then
		arg_79_0:onGetAssistInfo()
	else
		arg_79_0:startSilkRoad()
	end
end

function var_0_44.onGetGift(arg_80_0)
	local function var_80_0(arg_81_0)
		arg_80_0._layoutNode:getWidget("node_gift"):setVisible(false)
		arg_80_0._layoutNode:getWidget("btn_gift"):setVisible(false)
		arg_80_0._layoutNode:getWidget("bg_giftName"):setVisible(false)

		local var_81_0 = arg_81_0.action.data
		local var_81_1 = {}

		for iter_81_0, iter_81_1 in ipairs(var_81_0.rewards) do
			local var_81_2 = {
				id = var_0_2[iter_81_1.type].type,
				value = iter_81_1.num
			}

			table.insert(var_81_1, var_81_2)
		end

		globalAction_gotResource(var_81_1)
	end

	cmgr.sendRequest(var_80_0, actions.silkGetGift)
end

function var_0_44.useMerchantToken(arg_82_0)
	local function var_82_0(arg_83_0)
		cmgr.sendRequest(handler(arg_82_0, arg_82_0.getSilkInfoResponse), actions.getSilkInfo)

		local var_83_0 = CCSprite:create("res/ui/resource/silkroad/sbxt_word_zjsdcg.png")

		var_83_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 50))
		smgr.showTipSpriteText(var_83_0)
	end

	cmgr.sendRequest(var_82_0, actions.useMerchantToken)
end

function var_0_44.showTip(arg_84_0)
	log.info("should show tips ")

	local var_84_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_84_0:registerScriptTouchHandler(function(arg_85_0, arg_85_1, arg_85_2)
		if arg_85_0 == CCTOUCHBEGAN then
			return true
		elseif arg_85_0 == CCTOUCHMOVED then
			return true
		elseif arg_85_0 == CCTOUCHENDED then
			pcall(var_84_0.removeFromParentAndCleanup, var_84_0, true)

			return true
		end
	end, false, true)
	var_84_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_84_0, 60000)

	local var_84_1 = 0
	local var_84_2 = 0
	local var_84_3 = {}

	uiutil.initWidgets(var_84_3, var_0_8)
	var_84_0:addChild(var_84_3.widgets.tipFrame)

	local var_84_4, var_84_5 = tool.getPositionInScreen(arg_84_0._layoutNode:getWidget("btnTip"))
	local var_84_6 = var_84_4 + 20
	local var_84_7 = var_84_5 - 20
	local var_84_8 = language.get(122129, arg_84_0._silkMax) .. "\n\n" .. language.get(121078) .. "\n\n      "

	var_84_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
	var_84_3.widgets.tipMsg:setString(var_84_8)

	local var_84_9 = var_84_3.widgets.tipMsg:getContentSize().width
	local var_84_10 = var_84_3.widgets.tipMsg:getContentSize().height

	var_84_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_84_9 + 30, var_84_10 + 30))
	var_84_3.widgets.tipFrame:setPosition(ccp(var_84_6, var_84_7))
	var_84_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_84_3.widgets.tipFrame:setVisible(true)
end

function var_0_44.showTips2(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	local var_86_0 = createBaseLayer()

	local function var_86_1(arg_87_0, arg_87_1, arg_87_2)
		if arg_87_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_86_0, true)
		end

		return true
	end

	var_86_0:registerScriptTouchHandler(var_86_1, false, true)
	var_86_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_86_0, 10002)

	local var_86_2 = {
		name = "tipFrame",
		type = "sprite9",
		visible = false,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0, 0),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		children = {
			{
				fontSize = 20,
				name = "tipMsg",
				height = 0,
				type = "label",
				width = 200,
				textId = 135238,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft
			}
		}
	}
	local var_86_3 = 0
	local var_86_4 = 0
	local var_86_5 = {}

	uiutil.initWidgets(var_86_5, var_86_2)
	var_86_0:addChild(var_86_5.widgets.tipFrame)

	local var_86_6, var_86_7 = tool.getPositionInScreen(arg_86_1)
	local var_86_8 = var_86_6
	local var_86_9 = var_86_7

	var_86_5.widgets.tipMsg:setString(arg_86_2)

	local var_86_10 = var_86_5.widgets.tipMsg:getContentSize().width
	local var_86_11 = var_86_5.widgets.tipMsg:getContentSize().height

	var_86_5.widgets.tipFrame:setPreferredSize(CCSizeMake(var_86_10 + 30, var_86_11 + 30))
	var_86_5.widgets.tipFrame:setPosition(ccp(var_86_8, var_86_9))
	var_86_5.widgets.tipMsg:setPosition(ccp(15, 15))
	var_86_5.widgets.tipFrame:setVisible(true)

	if arg_86_3 == 1 or arg_86_3 == 2 then
		local var_86_12 = CCArray:create()

		var_86_12:addObject(CCDelayTime:create(0.5))
		var_86_12:addObject(CCCallFuncN:create(function()
			local var_88_0 = arg_86_3 == 1 and arg_86_0._data.mulNationBuff or arg_86_0._data.dwxzBuff

			if var_88_0.leftMs <= 0 then
				var_86_5.widgets.tipMsg:stopAllActions()
			else
				local var_88_1 = var_88_0.name .. "\n" .. var_88_0.tips .. "\n" .. language.get(136103, var_88_0.num) .. "\n" .. tool.getFormatTime(var_88_0.leftMs)

				var_86_5.widgets.tipMsg:setString(var_88_1)
			end
		end))

		local var_86_13 = CCSequence:create(var_86_12)

		var_86_5.widgets.tipMsg:runAction(CCRepeatForever:create(var_86_13))
	end
end

function var_0_44.showTipFun(arg_89_0, arg_89_1, arg_89_2)
	local var_89_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_89_0:registerScriptTouchHandler(function(arg_90_0, arg_90_1, arg_90_2)
		if arg_90_0 == CCTOUCHBEGAN then
			return true
		elseif arg_90_0 == CCTOUCHMOVED then
			return true
		elseif arg_90_0 == CCTOUCHENDED then
			pcall(var_89_0.removeFromParentAndCleanup, var_89_0, true)

			return true
		end
	end, false, true)
	var_89_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_89_0, 60000)

	local var_89_1 = 0
	local var_89_2 = 0
	local var_89_3 = {}

	uiutil.initWidgets(var_89_3, var_0_8)
	var_89_0:addChild(var_89_3.widgets.tipFrame)

	local var_89_4, var_89_5 = tool.getPositionInScreen(arg_89_1)
	local var_89_6 = var_89_4 + 20
	local var_89_7 = var_89_5 - 20

	var_89_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
	var_89_3.widgets.tipMsg:setString(arg_89_2)

	local var_89_8 = var_89_3.widgets.tipMsg:getContentSize().width
	local var_89_9 = var_89_3.widgets.tipMsg:getContentSize().height

	var_89_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_89_8 + 30, var_89_9 + 30))
	var_89_3.widgets.tipFrame:setPosition(ccp(var_89_6, var_89_7))
	var_89_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_89_3.widgets.tipFrame:setVisible(true)
end

function var_0_44.createMedalList(arg_91_0, arg_91_1, arg_91_2)
	local function var_91_0(arg_92_0, arg_92_1)
		log.info("cell touched at : ", arg_92_1:getIdx())
	end

	local function var_91_1(arg_93_0, arg_93_1)
		return 48, 640
	end

	local function var_91_2(arg_94_0, arg_94_1)
		local var_94_0 = arg_94_0:dequeueCell()

		if var_94_0 then
			var_94_0:removeAllChildrenWithCleanup(true)
		else
			var_94_0 = CCTableViewCell:new()
		end

		local var_94_1 = arg_91_1[arg_94_1 + 1]

		if var_94_1 then
			local var_94_2 = {}

			uiutil.initWidgets(var_94_2, var_0_7)
			var_94_0:addChild(var_94_2.widgets.node)

			if arg_94_1 % 2 == 1 then
				var_94_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/newRes/sczl_ryb_list01.png"):displayFrame())
			else
				var_94_2.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/newRes/sczl_ryb_list02.png"):displayFrame())
			end

			var_94_2.widgets.playerLb:setString(var_94_1.rank .. "." .. var_94_1.playerName)
			var_94_2.widgets.serverLb:setString(var_94_1.serverName)
			var_94_2.widgets.medalNum:setString(var_94_1.medalNum)
			var_94_2.widgets.rewardNum:setString(var_94_1.rewardPieceNum)

			if var_94_1.index == 1 then
				var_94_2.widgets.rewardIcon:setVisible(true)
				var_94_2.widgets.rewardIcon2:setVisible(false)
			else
				var_94_2.widgets.rewardIcon:setVisible(false)
				var_94_2.widgets.rewardIcon2:setVisible(true)
			end

			var_94_2.widgets.medalIcon:addHandleOfControlEvent(function()
				arg_91_0:showTipFun(var_94_2.widgets.medalIcon, language.get(215919))
			end, CCControlEventTouchUpInside)
			var_94_2.widgets.rewardIcon:addHandleOfControlEvent(function()
				arg_91_0:showTipFun(var_94_2.widgets.rewardIcon, language.get(215921))
			end, CCControlEventTouchUpInside)
			var_94_2.widgets.rewardIcon2:addHandleOfControlEvent(function()
				arg_91_0:showTipFun(var_94_2.widgets.rewardIcon2, language.get(215920))
			end, CCControlEventTouchUpInside)
		end

		return var_94_0
	end

	local function var_91_3()
		if arg_91_1 and #arg_91_1 > 0 then
			return #arg_91_1
		else
			return 0
		end
	end

	local var_91_4 = CCTableView:create(CCSizeMake(656, 269))

	var_91_4:setPosition(-318, -178)
	var_91_4:setDirection(kCCScrollViewDirectionVertical)
	var_91_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_91_2:addChild(var_91_4)

	if arg_91_0.medallist then
		arg_91_0.medallist:removeFromParentAndCleanup(true)

		arg_91_0.medallist = nil
	end

	arg_91_0.medallist = var_91_4

	var_91_4:registerScriptHandler(var_91_0, CCTableView.kTableCellTouched)
	var_91_4:registerScriptHandler(var_91_1, CCTableView.kTableCellSizeForIndex)
	var_91_4:registerScriptHandler(var_91_2, CCTableView.kTableCellSizeAtIndex)
	var_91_4:registerScriptHandler(var_91_3, CCTableView.kNumberOfCellsInTableView)
	var_91_4:reloadData()
end

function var_0_44.openMedal(arg_99_0)
	if arg_99_0.medalView then
		arg_99_0.medalView:removeFromParentAndCleanup(true)

		arg_99_0.medalView = nil
		arg_99_0.medallist = nil
	end

	local var_99_0 = {}

	uiutil.initWidgets(var_99_0, var_0_6)
	swallowTouch(var_99_0.widgets.bg)
	arg_99_0._layoutNode:getWidget("sczl_bg"):addChild(var_99_0.widgets.node)

	arg_99_0.medalView = var_99_0.widgets.node

	var_99_0.widgets.btn_close:addHandleOfControlEvent(function()
		if arg_99_0.medalView then
			arg_99_0.medalView:removeFromParentAndCleanup(true)

			arg_99_0.medalView = nil
			arg_99_0.medallist = nil
			var_99_0 = nil
		end
	end, CCControlEventTouchUpInside)
	cmgr.sendRequest(function(arg_101_0)
		local var_101_0 = arg_101_0.action.data

		if var_101_0.rankList and #var_101_0.rankList > 0 then
			var_99_0.widgets.xwydBg:setVisible(false)
			arg_99_0:createMedalList(var_101_0.rankList, var_99_0.widgets.node)
		else
			var_99_0.widgets.xwydBg:setVisible(true)
		end
	end, actions.getSilkMedalRankList)
end

function var_0_44.getSilkInfoResponse(arg_102_0, arg_102_1)
	if arg_102_1.action.state == 1 then
		dump(arg_102_1)

		local var_102_0 = arg_102_1.action.data

		arg_102_0._data = var_102_0

		if var_0_21[var_102_0.mapId] then
			arg_102_0:setVisible(true)
		else
			return
		end

		arg_102_0._layoutNode:getWidget("didiInfoSp"):setVisible(false)
		arg_102_0._layoutNode:getWidget("getDiDiRewardBtn"):setVisible(false)
		arg_102_0._layoutNode:getWidget("chengkeBtn"):setVisible(false)

		if var_102_0 and var_102_0.fastSilkRoadInfo then
			user.autoSilkMode = var_102_0.fastSilkRoadInfo.curMode
		end

		if user.autoSilkMode then
			if user.autoSilkMode == 1 then
				arg_102_0._layoutNode:getWidget("Text_2"):setString(language.get(216391))
			elseif user.autoSilkMode == 2 then
				arg_102_0._layoutNode:getWidget("Text_2"):setString(language.get(216392))
			else
				arg_102_0._layoutNode:getWidget("Text_2"):setString(language.get(491004))
			end
		end

		if arg_102_0._layoutNode:getWidget("autoLayer"):isVisible() then
			arg_102_0:openAutoSilkMode()
		end

		arg_102_0.waitTime = nil
		arg_102_0.waitTime = var_102_0.waitTime

		if user.isReciveInvitePcts or arg_102_0.waitTime and arg_102_0.waitTime > 0 then
			arg_102_0:startCarpoolClick()
		end

		if var_102_0.didiInfo then
			if var_102_0.didiInfo then
				arg_102_0:updateDiDiInfoSp(var_102_0.didiInfo)
			end

			if var_102_0.didiInfo.passengers and #var_102_0.didiInfo.passengers == 0 then
				table.insert(var_102_0.didiInfo.passengers, {
					pic = "xiyushangren",
					playerName = language.get(216202)
				})

				if arg_102_0.carpoolView then
					arg_102_0.carpoolView:removeFromParentAndCleanup(true)

					arg_102_0.carpoolView = nil
					arg_102_0.diView = nil
				end
			end

			if var_102_0.didiInfo.passengers and var_102_0.didiInfo.passengers[1] then
				arg_102_0.haschengke = true

				arg_102_0:updateDiDiSjSp(var_102_0.didiInfo.passengers[1])
			else
				arg_102_0.haschengke = false
			end

			if not var_102_0.didiInfo.passengers and not var_102_0.didiInfo.posInfo and var_102_0.pos == 0 then
				arg_102_0._layoutNode:getWidget("startCarpoolBtn"):setVisible(true)
			else
				arg_102_0._layoutNode:getWidget("startCarpoolBtn"):setVisible(false)
			end
		else
			arg_102_0.haschengke = false

			arg_102_0._layoutNode:getWidget("startCarpoolBtn"):setVisible(false)
		end

		if var_102_0.medal and var_102_0.medal.canSee then
			arg_102_0._layoutNode:getWidget("medalSp"):setVisible(true)

			if var_102_0.medal.state and var_102_0.medal.state == 1 then
				if var_102_0.mapId >= 10 then
					if var_102_0.medal.rank <= 0 then
						arg_102_0._layoutNode:getWidget("medalInfoLb"):setString(language.get(215914, var_102_0.medal.num, language.get(215915)))
					else
						arg_102_0._layoutNode:getWidget("medalInfoLb"):setString(language.get(215914, var_102_0.medal.num, language.get(215916, var_102_0.medal.rank)))
					end
				else
					arg_102_0._layoutNode:getWidget("medalInfoLb"):setString(language.get(215912))
				end

				local function var_102_1()
					arg_102_0:openMedal()
				end

				arg_102_0._layoutNode:getWidget("medalSp"):addHandleOfControlEvent(var_102_1, CCControlEventTouchUpInside)
			else
				arg_102_0._layoutNode:getWidget("medalInfoLb"):setString(language.get(215918))
			end
		else
			arg_102_0._layoutNode:getWidget("medalSp"):setVisible(false)
		end

		if var_102_0.noUnrestTimes and var_102_0.noUnrestTimes > 0 then
			arg_102_0._layoutNode:getWidget("noUnrestTimesLb"):setString(var_102_0.noUnrestTimes)
			arg_102_0._layoutNode:getWidget("noUnrestSp"):setVisible(true)
			arg_102_0._layoutNode:getWidget("noUnrestSp"):addHandleOfControlEvent(function()
				arg_102_0:showTipFun(arg_102_0._layoutNode:getWidget("noUnrestSp"), language.get(215911, var_102_0.noUnrestTimes))
			end, CCControlEventTouchUpInside)

			if arg_102_0.noUnrestTimes and arg_102_0.noUnrestTimes == 0 then
				smgr.showProgramText(language.get(215922), colorQuality[3], ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))
			end

			arg_102_0.noUnrestTimes = var_102_0.noUnrestTimes
		else
			arg_102_0.noUnrestTimes = 0

			arg_102_0._layoutNode:getWidget("noUnrestSp"):setVisible(false)
		end

		if var_102_0.mapId > 10 then
			arg_102_0._layoutNode:getWidget("trustNode"):setVisible(true)

			local var_102_2 = var_102_0.trustLevel / var_102_0.trustMax * 100

			arg_102_0._layoutNode:getWidget("gwPro"):setPercentage(var_102_2)
			arg_102_0._layoutNode:getWidget("gwProNum"):setString(var_102_0.trustLevel .. "/" .. var_102_0.trustMax)

			if arg_102_0.gwlight then
				arg_102_0.gwlight:removeFromParentAndCleanup(true)

				arg_102_0.gwlight = nil
			end

			if var_102_0.trustLevel >= var_102_0.trustMax then
				arg_102_0.gwlight = CCSprite:create()

				arg_102_0.gwlight:setPosition(34, 34)
				arg_102_0._layoutNode:getWidget("head_tzgw"):addChild(arg_102_0.gwlight)

				local var_102_3 = CCArray:create()

				for iter_102_0 = 1, 25 do
					local var_102_4 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_102_0))

					var_102_3:addObject(var_102_4:displayFrame())
				end

				local var_102_5 = CCAnimation:createWithSpriteFrames(var_102_3, 0.04)
				local var_102_6 = CCAnimate:create(var_102_5)

				arg_102_0.gwlight:runAction(CCRepeatForever:create(var_102_6))
			end

			arg_102_0._layoutNode:getWidget("gwyqBtn"):addHandleOfControlEvent(function()
				if var_102_0.trustLevel >= var_102_0.trustMax then
					cmgr.sendRequest(function(arg_106_0)
						arg_102_0._eventType = 20

						arg_102_0:ShowEvent(arg_106_0.action.data)
					end, actions.goToDreamNation, 1)
				else
					arg_102_0:showTipFun(arg_102_0._layoutNode:getWidget("gwyqBtn"), language.get(215913))
				end
			end, CCControlEventTouchUpInside)
		else
			arg_102_0._layoutNode:getWidget("trustNode"):setVisible(false)
		end

		arg_102_0._lastHit = var_102_0.lastHit
		arg_102_0._leftReduceTimes = var_102_0.leftReduceTimes or 0
		arg_102_0._mapId = var_102_0.mapId
		arg_102_0.oldMapId = var_102_0.oldMapId
		arg_102_0.firstTimes = var_102_0.firstTimes
		arg_102_0.mapResId = var_102_0.mapId > 10 and var_102_0.mapId - 10 or var_102_0.mapId

		arg_102_0._layoutNode:getWidget("map"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_map" .. arg_102_0.mapResId .. ".png"):displayFrame())
		arg_102_0._layoutNode:getWidget("mapName"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_word_gjm_" .. arg_102_0.mapResId .. ".png"):displayFrame())
		arg_102_0:setPosesPosition()

		arg_102_0._ifHugeTrade = var_102_0.ifHugeTrade

		if arg_102_0.mapResId >= 6 then
			if arg_102_0._ifHugeTrade then
				arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame())
				arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame())
			else
				arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/boat1.png"):displayFrame())
				arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/boat1.png"):displayFrame())
			end
		elseif arg_102_0._ifHugeTrade then
			arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame())
			arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame())
		else
			arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/car1.png"):displayFrame())
			arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/car_red1.png"):displayFrame())
		end

		if var_102_0.mapId == 10 then
			if arg_102_0.gwlight then
				arg_102_0.gwlight:removeFromParentAndCleanup(true)

				arg_102_0.gwlight = nil
			end

			if var_102_0.pos < 4 then
				if arg_102_0._ifHugeTrade then
					arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame())
					arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame())
				else
					arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/boat1.png"):displayFrame())
					arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/boat1.png"):displayFrame())
				end
			elseif arg_102_0._ifHugeTrade then
				arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame())
				arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame())
			else
				arg_102_0._layoutNode:getWidget("car"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/car1.png"):displayFrame())
				arg_102_0._layoutNode:getWidget("car1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/car_red1.png"):displayFrame())
			end
		end

		arg_102_0._eventType = var_102_0.eventType
		arg_102_0._extraPiecePic = var_102_0.extraPiecePic

		if arg_102_0._ifHugeTrade then
			arg_102_0._suffix = "suffix_dts"
		else
			arg_102_0._suffix = nil
		end

		if var_102_0.newMap == 1 and var_102_0.pos == 0 then
			if var_102_0.mapId == 1 then
				roleDialogue.control.loadSpeak(1932)
			elseif var_102_0.mapId ~= 10 and var_102_0.mapId ~= 11 then
				roleDialogue.control.loadSpeak(1931)
			elseif var_102_0.firstTimes and var_102_0.firstTimes == 1 and var_102_0.mapId == 10 then
				roleDialogue.control.loadSpeak("tenSilk10")
			end
		end

		arg_102_0._layoutNode:getWidget("event"):setVisible(false)

		if arg_102_0._pos == nil or var_102_0.pos == 0 or var_102_0.pos == arg_102_0._pos then
			arg_102_0._pos = var_102_0.pos

			arg_102_0:setPos(arg_102_0._pos)

			if arg_102_0._eventType then
				arg_102_0:ShowEventImage()
			end
		else
			arg_102_0:runToPos(var_102_0.pos)
		end

		if user.autoSilkMode ~= 1 and user.autoSilkMode ~= 2 then
			if arg_102_0._ifHugeTrade then
				arg_102_0._layoutNode:getWidget("Text_2"):setString(language.get(491010))
			else
				arg_102_0._layoutNode:getWidget("Text_2"):setString(language.get(491004))
			end
		end

		arg_102_0._layoutNode:getWidget("btnStart"):setVisible(arg_102_0._pos == 0)
		arg_102_0._layoutNode:getWidget("needNum"):setVisible(arg_102_0._pos == 0)
		arg_102_0._layoutNode:getWidget("scIcon"):setVisible(arg_102_0._pos == 0)
		arg_102_0._layoutNode:getWidget("needNum"):setString(var_102_0.needSilk or 0)
		arg_102_0._layoutNode:getWidget("silkNum"):setString(var_102_0.totalSilk)
		arg_102_0._layoutNode:getWidget("tipsNum"):setString(language.get(390478, var_102_0.tips, var_102_0.maxTips))
		arg_102_0._layoutNode:getWidget("silkNum"):setColor(var_102_0.totalSilk >= var_102_0.silkMax and ccc3(255, 0, 0) or colorQuality[1])

		arg_102_0._silkMax = var_102_0.silkMax
		arg_102_0._isMerchantTokenUsed = var_102_0.isMerchantTokenUsed

		arg_102_0._layoutNode:getWidget("car1"):setVisible(var_102_0.isMerchantTokenUsed)
		arg_102_0._layoutNode:getWidget("tokenNum"):setString(language.get(135039, var_102_0.merchantToken))

		if var_102_0.needSilk and var_102_0.needSilk <= var_102_0.totalSilk then
			arg_102_0.isAutoStart = false
			user.selectAutoMoreSilkNum = 0
		end

		if arg_102_0._eventType == 6 then
			-- block empty
		elseif arg_102_0._eventType == 7 then
			-- block empty
		end

		if var_102_0.lastHit > 0 then
			arg_102_0:showEndPosEventRewards()
		end

		arg_102_0:checkMulNationBuff(var_102_0)
		arg_102_0:checkHalfSilkToken(var_102_0)
		arg_102_0:checkDwxzBuff(var_102_0)
		arg_102_0._layoutNode:getWidget("btn_gift"):setVisible(false)
		arg_102_0._layoutNode:getWidget("bg_giftName"):stopAllActions()
		arg_102_0._layoutNode:getWidget("bg_giftName"):setVisible(false)

		if var_102_0.assistTechOpen == true then
			if var_102_0.giftNum ~= nil and var_102_0.giftNum > 0 then
				arg_102_0._layoutNode:getWidget("btn_gift"):setVisible(true)
			end

			if var_102_0.giftName ~= nil then
				arg_102_0._layoutNode:getWidget("bg_giftName"):setVisible(true)
				arg_102_0._layoutNode:getWidget("giftName"):setString(language.get(491041, var_102_0.giftName))

				local var_102_7 = CCArray:create()

				var_102_7:addObject(CCDelayTime:create(3))
				var_102_7:addObject(CCHide:create())
				arg_102_0._layoutNode:getWidget("bg_giftName"):runAction(CCSequence:create(var_102_7))
			end
		end

		arg_102_0._layoutNode:getWidget("btn_silk_tip"):setVisible(arg_102_0._leftReduceTimes > 0)

		arg_102_0._tradeTreasureArrs = var_102_0.tradeTreasureArrs
		arg_102_0.remainHugeTradeTimes = 0

		if var_102_0.tradeTreasureArrs then
			local var_102_8 = 1
			local var_102_9

			for iter_102_1, iter_102_2 in ipairs(var_102_0.tradeTreasureArrs) do
				local var_102_10 = iter_102_2.id

				if var_102_10 > 3 then
					var_102_10 = var_102_10 - 3
				end

				local var_102_11 = arg_102_0._layoutNode:getWidget("SilkTreasure" .. var_102_10)

				if var_102_11 then
					if iter_102_2.hidden then
						arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_btn_icon_wenhao.png"):displayFrame())
					else
						arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_btn_icon_" .. iter_102_2.id .. ".png"):displayFrame())
					end

					if iter_102_2.remainHugeTradeTimes and iter_102_2.remainHugeTradeTimes > 0 and (iter_102_2.id == 3 or iter_102_2.id == 6) then
						if iter_102_2.id == 3 then
							iter_102_2.tips = language.get(215007, iter_102_2.rewardRatio, iter_102_2.endTime)
						else
							iter_102_2.tips = language.get(215008, iter_102_2.rewardRatio, iter_102_2.endTime)
						end

						arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10):setDisplayFrame(CCSprite:create("res/ui/activity/feteHero/super" .. iter_102_2.id .. ".png"):displayFrame())
					end

					if not iter_102_2.hidden and iter_102_2.curNum < iter_102_2.maxNum then
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setString(iter_102_2.curNum .. "/" .. iter_102_2.maxNum)
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setVisible(true)
						tool.spriteToGray(arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10))
					else
						arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10):removeAllChildrenWithCleanup(true)
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setVisible(false)
					end

					if iter_102_1 == 2 and not iter_102_2.hidden and iter_102_2.curNum >= iter_102_2.maxNum then
						arg_102_0._hasJieZiBuff = true
					end

					if iter_102_1 == 3 and iter_102_2.curNum >= iter_102_2.maxNum then
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setString(iter_102_2.tradeNum .. "/" .. iter_102_2.maxTradeNum)
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setVisible(true)

						arg_102_0._maxTradeNum = iter_102_2.maxTradeNum

						if iter_102_2.tradeNum >= iter_102_2.maxTradeNum or hasBigTrade then
							arg_102_0.light = CCSprite:create()

							arg_102_0.light:setPosition(27, 27)
							arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10):addChild(arg_102_0.light)

							local var_102_12 = CCArray:create()

							for iter_102_3 = 1, 25 do
								local var_102_13 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_102_3))

								var_102_12:addObject(var_102_13:displayFrame())
							end

							local var_102_14 = CCAnimation:createWithSpriteFrames(var_102_12, 0.04)
							local var_102_15 = CCAnimate:create(var_102_14)

							arg_102_0.light:runAction(CCRepeatForever:create(var_102_15))
						elseif arg_102_0.light then
							arg_102_0.light:removeFromParentAndCleanup(true)

							arg_102_0.light = nil
						end
					end

					if iter_102_2.remainHugeTradeTimes and iter_102_2.remainHugeTradeTimes > 0 and (iter_102_2.id == 3 or iter_102_2.id == 6) then
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setString("x" .. iter_102_2.remainHugeTradeTimes)
						arg_102_0._layoutNode:getWidget("Text_2"):setString(language.get(491010))
						arg_102_0._layoutNode:getWidget("TreasureLb" .. var_102_10):setVisible(true)

						arg_102_0.light = CCSprite:create()

						arg_102_0.light:setPosition(27, 27)
						arg_102_0._layoutNode:getWidget("TreasureIcon" .. var_102_10):addChild(arg_102_0.light)

						local var_102_16 = CCArray:create()

						for iter_102_4 = 1, 25 do
							local var_102_17 = CCSprite:createWithSpriteFrameName(string.format("gang_mine_light_%d.png", iter_102_4))

							var_102_16:addObject(var_102_17:displayFrame())
						end

						local var_102_18 = CCAnimation:createWithSpriteFrames(var_102_16, 0.04)
						local var_102_19 = CCAnimate:create(var_102_18)

						arg_102_0.light:runAction(CCRepeatForever:create(var_102_19))
					end

					var_102_11:setVisible(true)
				end
			end
		end
	end
end

function var_0_44.setPosesPosition(arg_107_0, ...)
	if var_0_21[arg_107_0._mapId] then
		for iter_107_0 = 1, 7 do
			if iter_107_0 <= #var_0_21[arg_107_0._mapId] then
				arg_107_0._layoutNode:getWidget("pos" .. iter_107_0):setPosition(var_0_21[arg_107_0._mapId][iter_107_0])
				arg_107_0._layoutNode:getWidget("pos" .. iter_107_0):setVisible(true)
			else
				arg_107_0._layoutNode:getWidget("pos" .. iter_107_0):setVisible(false)
			end
		end

		arg_107_0._layoutNode:getWidget("startPos"):setPosition(var_0_10[arg_107_0._mapId] or ccp(0, 0))
	end
end

function var_0_44.runToPos(arg_108_0, arg_108_1)
	if arg_108_1 > arg_108_0._pos and arg_108_0:checkPos(arg_108_1) then
		local var_108_0 = CCArray:create()

		for iter_108_0 = arg_108_0._pos, arg_108_1 - 1 do
			if user.isNotPlayEffect then
				var_108_0:addObject(CCMoveTo:create(0.1, arg_108_0:getPosPosition(iter_108_0 + 1)))
			else
				var_108_0:addObject(CCMoveTo:create(1, arg_108_0:getPosPosition(iter_108_0 + 1)))
			end
		end

		var_108_0:addObject(CCTargetedAction:create(arg_108_0, CCCallFunc:create(handler(arg_108_0, arg_108_0.ShowEventImage))))
		arg_108_0._layoutNode:getWidget("car"):runAction(CCSequence:create(var_108_0))

		local var_108_1 = CCArray:create()

		for iter_108_1 = 1, 6 do
			local var_108_2

			if arg_108_0._ifHugeTrade then
				var_108_2 = CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame()
			else
				var_108_2 = CCSprite:create("res/ui/resource/silkroad/car" .. iter_108_1 .. ".png"):displayFrame()
			end

			if arg_108_0.mapResId >= 6 then
				if arg_108_0._ifHugeTrade then
					var_108_2 = CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame()
				else
					var_108_2 = CCSprite:create("res/ui/resource/silkroad/boat" .. iter_108_1 .. ".png"):displayFrame()
				end
			end

			if arg_108_0._mapId == 10 then
				if arg_108_1 < 4 then
					if arg_108_0._ifHugeTrade then
						var_108_2 = CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame()
					else
						var_108_2 = CCSprite:create("res/ui/resource/silkroad/boat" .. iter_108_1 .. ".png"):displayFrame()
					end
				elseif arg_108_0._ifHugeTrade then
					var_108_2 = CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame()
				else
					var_108_2 = CCSprite:create("res/ui/resource/silkroad/car" .. iter_108_1 .. ".png"):displayFrame()
				end
			end

			var_108_1:addObject(var_108_2)
		end

		local var_108_3 = CCAnimation:createWithSpriteFrames(var_108_1, 0.06)
		local var_108_4 = CCAnimate:create(var_108_3)
		local var_108_5 = CCRepeatForever:create(var_108_4)

		arg_108_0._layoutNode:getWidget("car"):runAction(var_108_5)

		local var_108_6 = CCArray:create()

		for iter_108_2 = 1, 6 do
			local var_108_7

			if arg_108_0._ifHugeTrade then
				var_108_7 = CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame()
			else
				var_108_7 = CCSprite:create("res/ui/resource/silkroad/car_red" .. iter_108_2 .. ".png"):displayFrame()
			end

			if arg_108_0.mapResId >= 6 then
				if arg_108_0._ifHugeTrade then
					var_108_7 = CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame()
				else
					var_108_7 = CCSprite:create("res/ui/resource/silkroad/boat" .. iter_108_2 .. ".png"):displayFrame()
				end
			end

			if arg_108_0._mapId == 10 then
				if arg_108_1 < 4 then
					if arg_108_0._ifHugeTrade then
						var_108_7 = CCSprite:create("res/ui/resource/silkroad/bigBoat1.png"):displayFrame()
					else
						var_108_7 = CCSprite:create("res/ui/resource/silkroad/boat" .. iter_108_2 .. ".png"):displayFrame()
					end
				elseif arg_108_0._ifHugeTrade then
					var_108_7 = CCSprite:create("res/ui/resource/silkroad/bigCar1.png"):displayFrame()
				else
					var_108_7 = CCSprite:create("res/ui/resource/silkroad/car" .. iter_108_2 .. ".png"):displayFrame()
				end
			end

			var_108_6:addObject(var_108_7)
		end

		local var_108_8 = CCAnimation:createWithSpriteFrames(var_108_6, 0.06)
		local var_108_9 = CCAnimate:create(var_108_8)
		local var_108_10 = CCRepeatForever:create(var_108_9)

		arg_108_0._layoutNode:getWidget("car1"):runAction(var_108_10)

		arg_108_0._pos = arg_108_1
	end
end

function var_0_44.checkPos(arg_109_0, arg_109_1)
	if var_0_21[arg_109_0._mapId] and var_0_21[arg_109_0._mapId][arg_109_1] then
		return true
	else
		return false
	end
end

function var_0_44.setPos(arg_110_0, arg_110_1)
	local var_110_0

	if arg_110_1 == 0 then
		var_110_0 = var_0_10[arg_110_0._mapId or 1]
	else
		var_110_0 = arg_110_0:getPosPosition(arg_110_1)
	end

	if var_110_0 then
		arg_110_0._layoutNode:getWidget("car"):setPosition(var_110_0)
	end
end

function var_0_44.getPosPosition(arg_111_0, arg_111_1)
	if var_0_21[arg_111_0._mapId] then
		return var_0_21[arg_111_0._mapId][arg_111_1]
	else
		return nil
	end
end

function var_0_44.onEventClicked(arg_112_0, arg_112_1, arg_112_2)
	if arg_112_0._extraPiecePic then
		arg_112_0:getCompassPieceFun()

		return
	end

	cmgr.sendRequest(function(arg_113_0)
		if user.autoSilkMode == 1 or user.autoSilkMode == 2 then
			arg_112_0._eventType = arg_113_0.action.data.eventType
		end

		arg_112_2:setVisible(false)
		arg_112_0:ShowEvent(arg_113_0.action.data)
	end, actions.getSilkEventInfo)
end

function var_0_44.getCompassPieceFun(arg_114_0)
	cmgr.sendRequest(function(arg_115_0)
		arg_114_0._layoutNode:getWidget("eventIcon"):setVisible(false)
		arg_114_0._layoutNode:getWidget("event"):setVisible(false)
		arg_114_0:silkHandleEventResponse(arg_115_0)
	end, actions.getCompassPiece)
end

function var_0_44.ShowEventImage(arg_116_0)
	arg_116_0._layoutNode:getWidget("car"):stopAllActions()
	arg_116_0._layoutNode:getWidget("car1"):stopAllActions()
	arg_116_0._layoutNode:getWidget("eventIcon"):setVisible(false)

	if arg_116_0._extraPiecePic then
		arg_116_0._layoutNode:getWidget("event"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_map_bubble_purple.png"):displayFrame())

		local var_116_0 = var_0_42[arg_116_0._extraPiecePic] or arg_116_0._extraPiecePic

		arg_116_0._layoutNode:getWidget("eventIcon"):setDisplayFrame(CCSprite:create("res/ui/weapon/silkTreasure/treasure_piece/" .. var_116_0 .. ".png"):displayFrame())
		arg_116_0._layoutNode:getWidget("eventIcon"):setVisible(true)
		arg_116_0._layoutNode:getWidget("event"):setVisible(true)

		return
	end

	if not arg_116_0._eventType or arg_116_0._eventType == 6 then
		-- block empty
	elseif arg_116_0._eventType == 7 then
		-- block empty
	elseif arg_116_0._eventType == 2 then
		arg_116_0._layoutNode:getWidget("event"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_map_bubble_02.png"):displayFrame())
		arg_116_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.5), CCCallFunc:create(function(...)
			arg_116_0:onEventClicked("began", arg_116_0._layoutNode:getWidget("event"))
		end)))
		arg_116_0._layoutNode:getWidget("event"):setVisible(true)
	else
		local var_116_1 = "res/ui/resource/silkroad/sczl_bubble01.png"

		if arg_116_0._eventType == 4 or arg_116_0._eventType == 5 or arg_116_0._eventType == 8 or arg_116_0._eventType == 9 or arg_116_0._eventType == 10 or arg_116_0._eventType == 11 then
			var_116_1 = "res/ui/resource/silkroad/sczl_map_bubble_01.png"
		elseif arg_116_0._eventType == 12 then
			var_116_1 = "res/ui/resource/silkroad/sczl_map_bubble_03.png"
		elseif arg_116_0._eventType == 16 then
			var_116_1 = "res/ui/resource/silkroad/tsbw_map_bubble_01_purple.png"
		elseif arg_116_0._eventType == 17 then
			var_116_1 = "res/ui/resource/silkroad/tsbw_map_bubble_purple.png"

			if arg_116_0._mapId > 5 then
				arg_116_0._layoutNode:getWidget("eventIcon"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_mingzhuxianglian.png"):displayFrame())
			else
				arg_116_0._layoutNode:getWidget("eventIcon"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_baoshijiezhi.png"):displayFrame())
			end

			arg_116_0._layoutNode:getWidget("eventIcon"):setVisible(true)
		else
			var_116_1 = arg_116_0._eventType == 18 and "res/ui/resource/silkroad/sczl_map_bubble_01.png" or arg_116_0._eventType == 19 and "res/ui/resource/silkroad/sczl_map_bubble_01.png" or arg_116_0._eventType == 21 and "res/ui/resource/silkroad/sczl_map_bubble_01.png" or "res/ui/resource/silkroad/sczl_map_bubble_02.png"
		end

		arg_116_0._layoutNode:getWidget("event"):setDisplayFrame(CCSprite:create(var_116_1):displayFrame())
		arg_116_0._layoutNode:getWidget("event"):setVisible(true)
	end
end

function var_0_44.ShowEvent(arg_118_0, arg_118_1)
	dump(arg_118_1, "", 10)

	arg_118_0._intros = arg_118_1.intros
	arg_118_0._pics = arg_118_1.pics
	arg_118_0._choices = arg_118_1.choices
	arg_118_0._tips = arg_118_1.tips or 0

	if arg_118_1.pickCd then
		arg_118_0._pickCd = arg_118_1.pickCd
	end

	if arg_118_1.curTradeTreasurePic then
		arg_118_0._curTradeTreasurePic = arg_118_1.curTradeTreasurePic
	else
		arg_118_0._curTradeTreasurePic = nil
	end

	if arg_118_1.firstPic then
		arg_118_0._firstPic = arg_118_1.firstPic
	else
		arg_118_0._firstPic = nil
	end

	arg_118_0._reduceTimes = arg_118_1.reduceTimes
	arg_118_0._canReduce = arg_118_1.canReduce
	arg_118_0._nextDialog = 1

	arg_118_0._layoutNode:getWidget("dialog"):setVisible(true)
	arg_118_0:showNextDialog()
	arg_118_0._layoutNode:getWidget("title"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/" .. arg_118_1.eventPic .. ".png"):displayFrame())

	local var_118_0 = 1

	if arg_118_0._choices[2] and string.len(arg_118_0._choices[2].intro) > 1 then
		local var_118_1 = 2
	end
end

function var_0_44.silkHandleEventResponse(arg_119_0, arg_119_1, arg_119_2)
	local var_119_0 = arg_119_1.action.data

	dump(arg_119_1, "奖励", 10)

	if arg_119_2 == 1 then
		local var_119_1 = {}
		local var_119_2 = {
			id = getIdByPic(var_119_0.pic),
			value = var_119_0.num
		}

		table.insert(var_119_1, var_119_2)
		globalAction_gotResource(var_119_1)
		arg_119_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), CCCallFunc:create(function(...)
			arg_119_0._layoutNode:getWidget("dialog"):setVisible(false)

			arg_119_0._canShowNextDialog = true

			cmgr.sendRequest(handler(arg_119_0, arg_119_0.getSilkInfoResponse), actions.getSilkInfo)
		end)))
	end

	if var_119_0.rewards then
		if arg_119_0._eventType == 11 or arg_119_0._extraPiecePic then
			arg_119_0._extraPiecePic = nil

			local var_119_3 = {}

			for iter_119_0, iter_119_1 in ipairs(var_119_0.rewards) do
				local var_119_4 = {}

				if iter_119_1.type == 21 then
					var_119_4.id = 7
				elseif iter_119_1.type == 5 then
					var_119_4.id = 6
				elseif iter_119_1.type == 81 then
					var_119_4.id = 24
				elseif iter_119_1.type >= 10000001 and iter_119_1.type <= 10000030 then
					var_119_4.id = 1000000
				elseif iter_119_1.type >= 10000036 and iter_119_1.type <= 10000041 then
					var_119_4.id = 1000000
				elseif iter_119_1.type >= 10000043 and iter_119_1.type <= 10000048 then
					var_119_4.id = 1000000
				elseif iter_119_1.type >= 10000050 and iter_119_1.type <= 10000055 then
					var_119_4.id = 1000000
				elseif iter_119_1.type >= 10000057 and iter_119_1.type <= 10000062 then
					var_119_4.id = 1000000
				elseif iter_119_1.type >= 10000064 and iter_119_1.type <= 10000081 then
					var_119_4.id = 1000000
				else
					var_119_4.id = iter_119_1.type
				end

				var_119_4.value = iter_119_1.value
				var_119_4.suffix = arg_119_0._suffix

				table.insert(var_119_3, var_119_4)
			end

			globalAction_gotResource(var_119_3)
			arg_119_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), CCCallFunc:create(function(...)
				arg_119_0._layoutNode:getWidget("dialog"):setVisible(false)

				arg_119_0._canShowNextDialog = true

				cmgr.sendRequest(handler(arg_119_0, arg_119_0.getSilkInfoResponse), actions.getSilkInfo)
			end)))
		else
			local var_119_5 = {}

			for iter_119_2, iter_119_3 in pairs(var_0_22) do
				table.insert(var_119_5, iter_119_3)
			end

			local var_119_6 = arg_119_0._mapId == 10 and arg_119_0.oldMapId or arg_119_0._mapId

			for iter_119_4, iter_119_5 in pairs(var_0_41[var_119_6]) do
				table.insert(var_119_5, iter_119_5)
			end

			local var_119_7 = 1

			for iter_119_6, iter_119_7 in pairs(var_119_5) do
				if iter_119_7.type == var_119_0.rewards[1].type then
					var_119_7 = iter_119_6
				end
			end

			if user.isNotPlayEffect then
				local var_119_8 = {}

				for iter_119_8, iter_119_9 in ipairs(var_119_0.rewards) do
					local var_119_9 = {}

					if iter_119_9.type == 21 then
						var_119_9.id = 7
					elseif iter_119_9.type == 5 then
						var_119_9.id = 6
					elseif iter_119_9.type == 81 then
						var_119_9.id = 24
					elseif iter_119_9.type >= 10000001 and iter_119_9.type <= 10000030 then
						var_119_9.id = 1000000
					elseif iter_119_9.type >= 10000036 and iter_119_9.type <= 10000041 then
						var_119_9.id = 1000000
					elseif iter_119_9.type >= 10000043 and iter_119_9.type <= 10000048 then
						var_119_9.id = 1000000
					elseif iter_119_9.type >= 10000050 and iter_119_9.type <= 10000055 then
						var_119_9.id = 1000000
					elseif iter_119_9.type >= 10000057 and iter_119_9.type <= 10000062 then
						var_119_9.id = 1000000
					elseif iter_119_9.type >= 10000064 and iter_119_9.type <= 10000081 then
						var_119_9.id = 1000000
					else
						var_119_9.id = iter_119_9.type
					end

					var_119_9.value = iter_119_9.value
					var_119_9.suffix = arg_119_0._suffix

					table.insert(var_119_8, var_119_9)
				end

				globalAction_gotResource(var_119_8)
				arg_119_0._layoutNode:getWidget("dialog"):setVisible(false)
				arg_119_0._layoutNode:getWidget("choiceLayer"):setVisible(false)
				arg_119_0._layoutNode:getWidget("selectItemLayer"):setVisible(false)

				arg_119_0._canShowNextDialog = true

				cmgr.sendRequest(handler(arg_119_0, arg_119_0.getSilkInfoResponse), actions.getSilkInfo)
			else
				local var_119_10 = require("lua/layer/resource/silkRoad/circleListNode").new(72, 72)
				local var_119_11 = {}

				for iter_119_10, iter_119_11 in pairs(var_119_5) do
					table.insert(var_119_11, CCSprite:create(iter_119_11.pic))
				end

				var_119_10:setItems(var_119_11)
				var_119_10:runCircleAction(var_119_7, 3, function(...)
					local var_122_0 = {}

					for iter_122_0, iter_122_1 in ipairs(var_119_0.rewards) do
						local var_122_1 = {}

						if iter_122_1.type == 21 then
							var_122_1.id = 7
						elseif iter_122_1.type == 5 then
							var_122_1.id = 6
						elseif iter_122_1.type == 81 then
							var_122_1.id = 24
						elseif iter_122_1.type >= 10000001 and iter_122_1.type <= 10000030 then
							var_122_1.id = 1000000
						elseif iter_122_1.type >= 10000036 and iter_122_1.type <= 10000041 then
							var_122_1.id = 1000000
						elseif iter_122_1.type >= 10000043 and iter_122_1.type <= 10000048 then
							var_122_1.id = 1000000
						elseif iter_122_1.type >= 10000050 and iter_122_1.type <= 10000055 then
							var_122_1.id = 1000000
						elseif iter_122_1.type >= 10000057 and iter_122_1.type <= 10000062 then
							var_122_1.id = 1000000
						elseif iter_122_1.type >= 10000064 and iter_122_1.type <= 10000081 then
							var_122_1.id = 1000000
						else
							var_122_1.id = iter_122_1.type
						end

						var_122_1.value = iter_122_1.value
						var_122_1.suffix = arg_119_0._suffix

						table.insert(var_122_0, var_122_1)
					end

					globalAction_gotResource(var_122_0)
					var_119_10:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), CCCallFunc:create(function(...)
						arg_119_0._layoutNode:getWidget("dialog"):setVisible(false)

						arg_119_0._canShowNextDialog = true

						cmgr.sendRequest(handler(arg_119_0, arg_119_0.getSilkInfoResponse), actions.getSilkInfo)
					end)))
				end)
				var_119_10:setPosition(ccp(4, 4))
				arg_119_0._layoutNode:getWidget("loadingbar"):runAction(CCProgressTo:create(3, 100))
				arg_119_0:removeCreateNodes()
				arg_119_0._layoutNode:getWidget("title"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_word_sj17.png"):displayFrame())
				arg_119_0._layoutNode:getWidget("rewardBg"):addChild(var_119_10)
				arg_119_0._layoutNode:getWidget("dialog"):setVisible(true)
				arg_119_0._layoutNode:getWidget("rewardLayer"):setVisible(true)

				arg_119_0._canShowNextDialog = false

				arg_119_0._layoutNode:getWidget("choiceLayer"):setVisible(false)
				arg_119_0._layoutNode:getWidget("selectItemLayer"):setVisible(false)
			end
		end
	else
		arg_119_0._layoutNode:getWidget("dialog"):setVisible(false)
		cmgr.sendRequest(handler(arg_119_0, arg_119_0.getSilkInfoResponse), actions.getSilkInfo)
	end
end

function var_0_44.showNextDialog(arg_124_0)
	if arg_124_0._canShowNextDialog == false then
		return
	end

	arg_124_0._layoutNode:getWidget("choiceLayer"):setVisible(true)
	arg_124_0._layoutNode:getWidget("selectItemLayer"):setVisible(false)
	arg_124_0._layoutNode:getWidget("rewardLayer"):setVisible(false)
	arg_124_0:removeCreateNodes()

	if arg_124_0._eventType == 18 then
		arg_124_0._layoutNode:getWidget("dialog"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_sj_bg_red.png"):displayFrame())
	else
		arg_124_0._layoutNode:getWidget("dialog"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_jz.png"):displayFrame())
	end

	if arg_124_0._nextDialog <= #arg_124_0._intros and arg_124_0._eventType ~= 11 then
		local var_124_0

		if arg_124_0._eventType == 21 then
			if arg_124_0._pics[arg_124_0._nextDialog] then
				var_124_0 = arg_124_0._pics[arg_124_0._nextDialog].pic
			else
				var_124_0 = arg_124_0._pics[arg_124_0._nextDialog - 1].pic
			end
		else
			var_124_0 = arg_124_0._pics[arg_124_0._nextDialog].pic
		end

		local var_124_1 = arg_124_0._intros[arg_124_0._nextDialog].intro

		arg_124_0._layoutNode:getWidget("dialogInfo"):setString(var_124_1)

		if var_124_0 == "player" then
			arg_124_0._layoutNode:getWidget("head"):setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. tostring(user.player.pic) .. ".png"):displayFrame())
			arg_124_0._layoutNode:getWidget("head"):setScale(0.8)
		else
			arg_124_0._layoutNode:getWidget("head"):setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_124_0 .. ".jpg"):displayFrame())
			arg_124_0._layoutNode:getWidget("head"):setScale(1)
		end

		arg_124_0._nextDialog = arg_124_0._nextDialog + 1
	elseif arg_124_0._eventType == 11 and arg_124_0._nextDialog == 1 then
		local var_124_2 = arg_124_0._pics[1].pic
		local var_124_3

		if arg_124_0._canReduce == 1 and arg_124_0._reduceTimes == 0 then
			var_124_3 = language.get(491000, arg_124_0._choices[2].rewards[1].name, arg_124_0._choices[2].rewards[1].value, arg_124_0._choices[2].costs[1].value)
		elseif arg_124_0._canReduce == 1 and arg_124_0._reduceTimes > 0 then
			var_124_3 = arg_124_0._intros[math.random(2, 4)].intro
		else
			var_124_3 = arg_124_0._intros[#arg_124_0._intros].intro
		end

		arg_124_0._layoutNode:getWidget("dialogInfo"):setString(var_124_3)
		arg_124_0._layoutNode:getWidget("head"):setDisplayFrame(CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_124_2 .. ".jpg"):displayFrame())
		arg_124_0._layoutNode:getWidget("head"):setScale(1)

		arg_124_0._nextDialog = 100

		arg_124_0:showChoices()
	else
		arg_124_0:showChoices()
	end
end

function var_0_44.removeCreateNodes(arg_125_0)
	arg_125_0._createdNodes = arg_125_0._createdNodes or {}

	for iter_125_0, iter_125_1 in pairs(arg_125_0._createdNodes) do
		if not tolua.isnull(iter_125_1) then
			iter_125_1:removeFromParentAndCleanup(true)
		end
	end

	log.info("removeAllCreateNode")

	arg_125_0._createdNodes = {}
end

function var_0_44.addCreateNode(arg_126_0, arg_126_1)
	arg_126_0._createdNodes = arg_126_0._createdNodes or {}

	table.insert(arg_126_0._createdNodes, arg_126_1)
end

function var_0_44.showChoices(arg_127_0)
	arg_127_0:removeCreateNodes()

	local var_127_0 = arg_127_0._layoutNode:getWidget("dialog"):getContentSize().width / 2

	if arg_127_0._eventType == 14 then
		for iter_127_0, iter_127_1 in pairs(arg_127_0._choices) do
			local var_127_1 = CCScale9Sprite:create("res/ui/resource/silkroad/sczl_answer_btn.png")
			local var_127_2 = CCControlButton:create(var_127_1)

			var_127_2:setAdjustBackgroundImage(false)
			var_127_2:setZoomOnTouchDown(false)
			var_127_2:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/resource/silkroad/sczl_answer_btn_c.png"), CCControlStateHighlighted)
			var_127_2:setPosition(ccp(var_127_0, 200 - 50 * iter_127_0))
			arg_127_0:addCreateNode(var_127_2)
			arg_127_0._layoutNode:getWidget("choiceLayer"):addChild(var_127_2)

			local var_127_3 = CCStrokeLabelTTF:create(arg_127_0._choices[iter_127_0].intro, "Thonburi-Bold", 20)

			var_127_3:setPosition(ccp(20, var_127_2:getContentSize().height / 2))
			var_127_3:setAnchorPoint(ccp(0, 0.5))
			var_127_2:addChild(var_127_3)
			var_127_2:addHandleOfControlEvent(function(...)
				if user.autoSilkMode == 1 or user.autoSilkMode == 2 then
					cmgr.sendRequest(handler(arg_127_0, arg_127_0.fastSilkRoadResponse), actions.fastSilkRoad, iter_127_0, 0)
				else
					cmgr.sendRequest(handler(arg_127_0, arg_127_0.silkHandleEventResponse), actions.silkHandleEvent, iter_127_0, 0)
				end
			end, CCControlEventTouchUpInside)
		end

		return
	elseif arg_127_0._eventType == 11 or arg_127_0._eventType == 17 then
		arg_127_0._choices[3] = {
			intro = language.get(135442)
		}
	end

	if arg_127_0._eventType == 10 then
		arg_127_0._layoutNode:getWidget("reward1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_bigbox_open.png"):displayFrame())
		arg_127_0._layoutNode:getWidget("reward2"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_bigbox_open.png"):displayFrame())

		local var_127_4 = {}

		for iter_127_2, iter_127_3 in pairs(var_0_22) do
			table.insert(var_127_4, iter_127_3)
		end

		local var_127_5 = arg_127_0._mapId == 10 and arg_127_0.oldMapId or arg_127_0._mapId

		for iter_127_4, iter_127_5 in pairs(var_0_41[var_127_5]) do
			table.insert(var_127_4, iter_127_5)
		end

		local var_127_6
		local var_127_7

		for iter_127_6, iter_127_7 in pairs(var_127_4) do
			if iter_127_7.type == arg_127_0._choices[1].rewards[1].type then
				var_127_6 = CCSprite:create(iter_127_7.pic)
			end

			if iter_127_7.type == arg_127_0._choices[2].rewards[1].type then
				var_127_7 = CCSprite:create(iter_127_7.pic)
			end
		end

		if var_127_6 then
			local var_127_8 = CCSprite:create("res/ui/resource/silkroad/reward_icon_view_bg.jpg")

			var_127_6:setPosition(ccp(40, 40))
			var_127_8:addChild(var_127_6)
			var_127_8:setPosition(50, 120)

			local var_127_9 = CCSprite:create("res/ui/resource/silkroad/sczl_jl_samll_d.png")

			var_127_9:setPosition(ccp(40, -20))
			var_127_8:addChild(var_127_9)

			local var_127_10 = CCStrokeLabelTTF:create(arg_127_0._choices[1].rewards[1].value, "Thonburi-Bold", 20)

			var_127_10:setPosition(ccp(40, -20))
			var_127_8:addChild(var_127_10)
			arg_127_0._layoutNode:getWidget("reward1"):addChild(var_127_8)
			arg_127_0:addCreateNode(var_127_8)
		end

		if var_127_7 then
			local var_127_11 = CCSprite:create("res/ui/resource/silkroad/reward_icon_view_bg.jpg")

			var_127_7:setPosition(ccp(40, 40))
			var_127_11:addChild(var_127_7)
			var_127_11:setPosition(50, 120)

			local var_127_12 = CCSprite:create("res/ui/resource/silkroad/sczl_jl_samll_d.png")

			var_127_12:setPosition(ccp(40, -20))
			var_127_11:addChild(var_127_12)

			local var_127_13 = CCStrokeLabelTTF:create(arg_127_0._choices[2].rewards[1].value, "Thonburi-Bold", 20)

			var_127_13:setPosition(ccp(40, -20))
			var_127_11:addChild(var_127_13)
			arg_127_0._layoutNode:getWidget("reward2"):addChild(var_127_11)
			arg_127_0:addCreateNode(var_127_11)
		end
	end

	log.info("------------" .. var_127_0)

	local var_127_14 = CCLayerColor:create(ccc4(255, 0, 0, 0), 0, 0)

	var_127_14:setAnchorPoint(ccp(0.5, 0.5))
	var_127_14:ignoreAnchorPointForPosition(false)

	local var_127_15 = 5

	for iter_127_8 = #arg_127_0._choices, 1, -1 do
		if string.len(arg_127_0._choices[iter_127_8].intro) <= 2 and arg_127_0._eventType ~= 10 then
			table.remove(arg_127_0._choices, iter_127_8)
		end
	end

	for iter_127_9, iter_127_10 in pairs(arg_127_0._choices) do
		if arg_127_0._eventType == 10 and iter_127_9 == 2 then
			-- block empty
		else
			if iter_127_10.tips and iter_127_10.tips > 0 then
				local var_127_16 = CCScale9Sprite:createWithSpriteFrameName("btn3_yel_a.png")
				local var_127_17 = CCControlButton:create(var_127_16)

				var_127_17:setAdjustBackgroundImage(false)
				var_127_17:setZoomOnTouchDown(false)
				var_127_17:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrameName("btn3_yel_c.png"), CCControlStateHighlighted)
				var_127_17:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrameName("btn3_yel_g.png"), CCControlStateDisabled)

				local var_127_18 = var_127_14:getContentSize().width

				var_127_14:setContentSize(CCSizeMake(var_127_18 + (var_127_17:getContentSize().width / 2 + var_127_15) * 2, 50))

				local var_127_19 = var_127_18 + (var_127_17:getContentSize().width / 2 + var_127_15)

				var_127_17:setPosition(ccp(var_127_19, 25))
				var_127_14:addChild(var_127_17)
				var_127_17:addHandleOfControlEvent(function()
					if user.autoSilkMode == 1 or user.autoSilkMode == 2 then
						cmgr.sendRequest(handler(arg_127_0, arg_127_0.fastSilkRoadResponse), actions.fastSilkRoad, iter_127_9, 1)
					else
						cmgr.sendRequest(handler(arg_127_0, arg_127_0.silkHandleEventResponse), actions.silkHandleEvent, iter_127_9, 1)
					end
				end, CCControlEventTouchUpInside)

				local var_127_20 = CCStrokeLabelTTF:create(language.get(491007), "Thonburi-Bold", 20 + (var_0_0.chioceBtnFntSize or 0))

				var_127_20:setPosition(ccp(var_127_17:getContentSize().width / 2, var_127_17:getContentSize().height / 2))
				var_127_17:addChild(var_127_20)

				local var_127_21 = CCSprite:create("res/ui/resource/silkroad/sczldj_pbjn.png")

				var_127_21:setContentSize(CCSizeMake(48, 60))

				local var_127_22 = CCStrokeLabelTTF:create(iter_127_10.tips, "Thonburi-Bold", 20)

				if iter_127_10.tips > arg_127_0._tips then
					var_127_22:setColor(colorQuality[5])
					var_127_17:setEnabled(false)
				end

				local var_127_23 = createRichNode({
					var_127_21,
					var_127_22
				}, 0.5)

				var_127_23:setPosition(var_127_17:getContentSize().width / 2, 70)
				var_127_17:addChild(var_127_23)
			end

			local var_127_24 = CCScale9Sprite:createWithSpriteFrameName("btn3_gre_a.png")
			local var_127_25 = CCControlButton:create(var_127_24)

			var_127_25:setAdjustBackgroundImage(false)
			var_127_25:setZoomOnTouchDown(false)
			var_127_25:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrameName("btn3_gre_c.png"), CCControlStateHighlighted)
			var_127_25:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrameName("btn3_yel_g.png"), CCControlStateDisabled)

			local var_127_26 = var_127_14:getContentSize().width

			var_127_14:setContentSize(CCSizeMake(var_127_26 + (var_127_25:getContentSize().width / 2 + var_127_15) * 2, 50))

			local var_127_27 = var_127_26 + (var_127_25:getContentSize().width / 2 + var_127_15)

			var_127_25:setPosition(ccp(var_127_27, 25))
			var_127_14:addChild(var_127_25)
			var_127_25:addHandleOfControlEvent(function(...)
				if arg_127_0._eventType == 11 and iter_127_9 == 1 then
					var_127_25:setTouchEnabled(false)

					if user.isNotPlayEffect then
						cmgr.sendRequest(function(...)
							cmgr.sendRequest(function(arg_132_0)
								local var_132_0

								if arg_132_0.action.data.canReduce == 1 then
									var_132_0 = CCSprite:create("res/ui/resource/silkroad/sczl_word_hjcg.png")
								else
									var_132_0 = CCSprite:create("res/ui/resource/silkroad/sczl_word_hjsb.png")
								end

								var_132_0:setScale(3)
								var_132_0:setPosition(ccp(arg_127_0._layoutNode:getWidget("dialog"):getContentSize().width / 2, arg_127_0._layoutNode:getWidget("dialog"):getContentSize().height / 2))
								arg_127_0._layoutNode:getWidget("choiceLayer"):addChild(var_132_0)
								var_132_0:runAction(CCSequence:createWithTwoActions(CCSpawn:createWithTwoActions(CCScaleTo:create(0.2, 1), CCFadeIn:create(0.2)), CCCallFunc:create(function(...)
									var_132_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(2), CCCallFunc:create(function(...)
										var_132_0:removeFromParentAndCleanup(true)
									end)))
									arg_127_0:ShowEvent(arg_132_0.action.data)
								end)))
							end, actions.getSilkEventInfo)
						end, actions.silkHandleEvent, iter_127_9, 0)
					else
						local var_130_0 = CCSprite:create("res/ui/resource/silkroad/sczl_tjhj_pb_bg.png")
						local var_130_1 = CCProgressTimer:create(CCSprite:create("res/ui/resource/silkroad/sczl_tjhj_pb.png"))

						var_130_1:setReverseProgress(true)
						var_130_1:setType(kCCProgressTimerTypeRadial)
						var_130_1:setPercentage(0)
						var_130_1:setPosition(ccp(var_130_0:getContentSize().width / 2, var_130_0:getContentSize().height / 2))
						var_130_1:runAction(CCSequence:createWithTwoActions(CCProgressTo:create(1, 100), CCCallFunc:create(function(...)
							var_130_0:removeFromParentAndCleanup(true)
							cmgr.sendRequest(function(...)
								cmgr.sendRequest(function(arg_137_0)
									local var_137_0

									if arg_137_0.action.data.canReduce == 1 then
										var_137_0 = CCSprite:create("res/ui/resource/silkroad/sczl_word_hjcg.png")
									else
										var_137_0 = CCSprite:create("res/ui/resource/silkroad/sczl_word_hjsb.png")
									end

									var_137_0:setScale(3)
									var_137_0:setPosition(ccp(arg_127_0._layoutNode:getWidget("dialog"):getContentSize().width / 2, arg_127_0._layoutNode:getWidget("dialog"):getContentSize().height / 2))
									arg_127_0._layoutNode:getWidget("choiceLayer"):addChild(var_137_0)
									var_137_0:runAction(CCSequence:createWithTwoActions(CCSpawn:createWithTwoActions(CCScaleTo:create(0.2, 1), CCFadeIn:create(0.2)), CCCallFunc:create(function(...)
										var_137_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(2), CCCallFunc:create(function(...)
											var_137_0:removeFromParentAndCleanup(true)
										end)))
										arg_127_0:ShowEvent(arg_137_0.action.data)
									end)))
								end, actions.getSilkEventInfo)
							end, actions.silkHandleEvent, iter_127_9, 0)
						end)))
						var_130_0:addChild(var_130_1)
						var_130_0:setPosition(ccp(arg_127_0._layoutNode:getWidget("dialog"):getContentSize().width / 2, arg_127_0._layoutNode:getWidget("dialog"):getContentSize().height / 2))
						arg_127_0._layoutNode:getWidget("choiceLayer"):addChild(var_130_0)
					end
				elseif arg_127_0._eventType == 10 then
					log.info("二选一")
					arg_127_0._layoutNode:getWidget("selectItemLayer"):setVisible(true)
					arg_127_0._layoutNode:getWidget("choiceLayer"):setVisible(false)
					arg_127_0._layoutNode:getWidget("rewardLayer"):setVisible(false)

					arg_127_0._canShowNextDialog = false

					arg_127_0:runSelectRewardsAction()
				elseif arg_127_0._eventType == 16 then
					arg_127_0._layoutNode:getWidget("choiceLayer"):setVisible(false)
					arg_127_0._layoutNode:getWidget("dialog"):setVisible(false)
					cmgr.sendRequest(function(arg_140_0)
						if arg_140_0.action.data.firstPic then
							arg_127_0._firstPic = arg_140_0.action.data.firstPic
						end

						if arg_127_0._firstPic then
							arg_127_0._layoutNode:getWidget("bwIconSp"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_" .. arg_127_0._firstPic .. ".png"):displayFrame())
							arg_127_0._layoutNode:getWidget("tsbw_titleSp"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_word_bw_hdcpd.png"):displayFrame())
							arg_127_0._layoutNode:getWidget("tsbw_bw_bg"):setVisible(true)

							local var_140_0 = CCArray:create()
							local var_140_1, var_140_2 = tool.getPositionInScreen(arg_127_0._layoutNode:getWidget("SilkTreasure" .. var_0_42[arg_127_0._firstPic]))
							local var_140_3 = smgr.getLayer("topLayer")
							local var_140_4 = GraySprite:createWithSpriteFrame(arg_127_0._layoutNode:getWidget("bwIconSp"):displayFrame())
							local var_140_5, var_140_6 = tool.getPositionInScreen(arg_127_0._layoutNode:getWidget("bwIconSp"))

							var_140_4:setPosition(var_140_5, var_140_6)
							var_140_3:addChild(var_140_4)
							var_140_0:addObject(CCDelayTime:create(1))
							var_140_0:addObject(CCMoveTo:create(0.5, ccp(var_140_1, var_140_2)))
							var_140_0:addObject(CCDelayTime:create(0.2))
							var_140_0:addObject(CCCallFuncN:create(function()
								var_140_4:removeFromParentAndCleanup(true)
								arg_127_0._layoutNode:getWidget("tsbw_bw_bg"):setVisible(false)
								cmgr.sendRequest(handler(arg_127_0, arg_127_0.getSilkInfoResponse), actions.getSilkInfo)
							end))

							local var_140_7 = CCSequence:create(var_140_0)

							var_140_4:runAction(var_140_7)
						else
							var_0_43(arg_127_0._layoutNode:getWidget("tsbw_prompt_lxdj"))
							arg_127_0._layoutNode:getWidget("tsbw_sp"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/tsbw_s_" .. arg_127_0._curTradeTreasurePic .. ".png"):displayFrame())
							swallowTouch(arg_127_0._layoutNode:getWidget("tsbw_tsz_bg"))
							arg_127_0._layoutNode:getWidget("tsbw_tsz_bg"):setVisible(true)
							arg_127_0._layoutNode:getWidget("bwSp"):setTouchEnabled(true)

							local var_140_8 = arg_140_0.action.data
							local var_140_9 = arg_127_0._pickCd

							arg_127_0._layoutNode:getWidget("countDownText"):setVisible(true)
							arg_127_0._layoutNode:getWidget("countDownText"):setColor(colorQuality[5])
							arg_127_0._layoutNode:getWidget("countDownText"):setString(tool.getFormatTime(var_140_9))

							local var_140_10 = CCArray:create()

							var_140_10:addObject(CCDelayTime:create(0.5))
							var_140_10:addObject(CCCallFuncN:create(function()
								var_140_9 = var_140_9 - 500

								if var_140_9 <= 0 then
									arg_127_0._layoutNode:getWidget("countDownText"):stopAllActions()
									arg_127_0._layoutNode:getWidget("bwSp"):setTouchEnabled(false)
									arg_127_0._layoutNode:getWidget("tsbw_tsz_bg"):setVisible(false)
									cmgr.sendRequest(handler(arg_127_0, arg_127_0.getSilkInfoResponse), actions.getSilkInfo)
								else
									arg_127_0._layoutNode:getWidget("countDownText"):setString(tool.getFormatTime(var_140_9))
								end
							end))

							local var_140_11 = CCSequence:create(var_140_10)

							arg_127_0._layoutNode:getWidget("countDownText"):runAction(CCRepeatForever:create(var_140_11))
						end
					end, actions.silkHandleEvent, 1, 0)
				elseif iter_127_10.costs then
					if iter_127_10.costs[1].type == 19 then
						messageBox.showChargeWin(language.get(190080), language.get(491005, iter_127_10.costs[1].value, arg_127_0._choices[iter_127_9].intro), "silkEvent", function(...)
							if user.autoSilkMode == 1 or user.autoSilkMode == 2 then
								cmgr.sendRequest(handler(arg_127_0, arg_127_0.fastSilkRoadResponse), actions.fastSilkRoad, iter_127_9, 0)
							else
								cmgr.sendRequest(handler(arg_127_0, arg_127_0.silkHandleEventResponse), actions.silkHandleEvent, iter_127_9, 0)
							end
						end)
					elseif user.autoSilkMode == 1 or user.autoSilkMode == 2 then
						cmgr.sendRequest(handler(arg_127_0, arg_127_0.fastSilkRoadResponse), actions.fastSilkRoad, iter_127_9, 0)
					else
						cmgr.sendRequest(handler(arg_127_0, arg_127_0.silkHandleEventResponse), actions.silkHandleEvent, iter_127_9, 0)
					end
				elseif arg_127_0._eventType == 20 then
					arg_127_0._layoutNode:getWidget("dialog"):setVisible(false)

					if iter_127_9 == 2 then
						cmgr.sendRequest(function(arg_144_0)
							cmgr.sendRequest(handler(arg_127_0, arg_127_0.getSilkInfoResponse), actions.getSilkInfo)
						end, actions.goToDreamNation, 2)
					end
				elseif arg_127_0._eventType == 19 then
					arg_127_0:playAttEffect()

					if user.autoSilkMode == 1 or user.autoSilkMode == 2 then
						cmgr.sendRequest(handler(arg_127_0, arg_127_0.fastSilkRoadResponse), actions.fastSilkRoad, iter_127_9, 0)
					else
						cmgr.sendRequest(handler(arg_127_0, arg_127_0.silkHandleEventResponse), actions.silkHandleEvent, iter_127_9, 0)
					end
				elseif user.autoSilkMode == 1 or user.autoSilkMode == 2 then
					cmgr.sendRequest(handler(arg_127_0, arg_127_0.fastSilkRoadResponse), actions.fastSilkRoad, iter_127_9, 0)
				else
					cmgr.sendRequest(handler(arg_127_0, arg_127_0.silkHandleEventResponse), actions.silkHandleEvent, iter_127_9, 0)
				end
			end, CCControlEventTouchUpInside)

			if arg_127_0._eventType == 11 and iter_127_9 == 1 and arg_127_0._canReduce == 0 then
				var_127_25:setEnabled(false)
			end

			local var_127_28 = CCStrokeLabelTTF:create(arg_127_0._choices[iter_127_9].intro, "Thonburi-Bold", 20 + (var_0_0.chioceBtnFntSize or 0))

			var_127_28:setPosition(ccp(var_127_25:getContentSize().width / 2, var_127_25:getContentSize().height / 2))
			var_127_28:setDimensions(CCSizeMake(130, 0))
			var_127_25:addChild(var_127_28)

			if iter_127_10.costs then
				local var_127_29 = true
				local var_127_30 = CCSprite:createWithSpriteFrameName("icon_gold.png")

				if iter_127_10.costs[1].type == 2 then
					var_127_30 = CCSprite:createWithSpriteFrameName("res_icon_2.png")
					var_127_29 = false
				elseif iter_127_10.costs[1].type == 116 then
					var_127_30 = CCSprite:create("res/ui/resource/silkroad/sczl_sj_icon.png")
					var_127_29 = false
				elseif iter_127_10.costs[1].type == 126 then
					var_127_30 = CCSprite:create("res/ui/resource/silkroad/sczldj_pbjn.png")
					var_127_29 = false
				end

				local var_127_31 = CCStrokeLabelTTF:create(iter_127_10.costs[1].value, "Thonburi-Bold", 20)
				local var_127_32

				if var_127_29 then
					var_127_32 = CCStrokeLabelTTF:create(language.get(226068), "Thonburi-Bold", 20)
				end

				if conf.language == "vie" then
					local var_127_33 = createRichNode({
						var_127_30,
						var_127_31
					}, 0.5)

					var_127_33:setPosition(var_127_25:getContentSize().width / 2, 70)
					var_127_25:addChild(var_127_33)
				else
					local var_127_34 = createRichNode({
						var_127_30,
						var_127_31,
						var_127_32
					}, 0.5)

					var_127_34:setPosition(var_127_25:getContentSize().width / 2, 70)
					var_127_25:addChild(var_127_34)
				end
			end
		end
	end

	var_127_14:setPosition(var_127_0, 75)
	arg_127_0._layoutNode:getWidget("choiceLayer"):addChild(var_127_14)
	arg_127_0:addCreateNode(var_127_14)
end

function var_0_44.runSelectRewardsAction(arg_145_0, ...)
	local var_145_0 = CCArray:create()

	if not user.isNotPlayEffect then
		var_145_0:addObject(CCDelayTime:create(0.5))
	end

	var_145_0:addObject(CCCallFunc:create(function(...)
		arg_145_0._layoutNode:getWidget("reward1"):removeAllChildrenWithCleanup(true)
		arg_145_0._layoutNode:getWidget("reward1"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_bigbox.png"):displayFrame())
	end))

	if not user.isNotPlayEffect then
		var_145_0:addObject(CCMoveTo:create(0.5, ccp(293, 190)))
		var_145_0:addObject(CCDelayTime:create(0.2))
		var_145_0:addObject(CCMoveTo:create(0.5, ccp(163.33, 190)))
	end

	var_145_0:addObject(CCCallFunc:create(function(...)
		local function var_147_0(arg_148_0, arg_148_1, arg_148_2)
			if arg_148_0 == CCTOUCHBEGAN then
				if not arg_145_0._layoutNode:getWidget("reward1"):isVisible() or not tool.checkIfTouch2(arg_145_0._layoutNode:getWidget("reward1"), arg_148_1, arg_148_2) then
					return false
				end

				log.info("click1")
				arg_145_0:selectReward(1)

				return true
			end
		end

		arg_145_0._layoutNode:getWidget("reward1"):registerScriptTouchHandler(var_147_0, false, true)
		arg_145_0._layoutNode:getWidget("reward1"):setTouchEnabled(true)
	end))
	arg_145_0._layoutNode:getWidget("reward1"):runAction(CCSequence:create(var_145_0))

	local var_145_1 = CCArray:create()

	if not user.isNotPlayEffect then
		var_145_1:addObject(CCDelayTime:create(0.5))
	end

	var_145_1:addObject(CCCallFunc:create(function(...)
		arg_145_0._layoutNode:getWidget("reward2"):removeAllChildrenWithCleanup(true)
		arg_145_0._layoutNode:getWidget("reward2"):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_bigbox.png"):displayFrame())
	end))

	if not user.isNotPlayEffect then
		var_145_1:addObject(CCMoveTo:create(0.5, ccp(293, 190)))
		var_145_1:addObject(CCDelayTime:create(0.2))
		var_145_1:addObject(CCMoveTo:create(0.5, ccp(423.33, 190)))
	end

	var_145_1:addObject(CCCallFunc:create(function(...)
		local function var_150_0(arg_151_0, arg_151_1, arg_151_2)
			if arg_151_0 == CCTOUCHBEGAN then
				if not arg_145_0._layoutNode:getWidget("reward2"):isVisible() or not tool.checkIfTouch2(arg_145_0._layoutNode:getWidget("reward2"), arg_151_1, arg_151_2) then
					return false
				end

				log.info("click2")
				arg_145_0:selectReward(2)

				return true
			end
		end

		arg_145_0._layoutNode:getWidget("reward2"):registerScriptTouchHandler(var_150_0, false, true)
		arg_145_0._layoutNode:getWidget("reward2"):setTouchEnabled(true)
	end))
	arg_145_0._layoutNode:getWidget("reward2"):runAction(CCSequence:create(var_145_1))
end

function var_0_44.selectReward(arg_152_0, arg_152_1)
	cmgr.sendRequest(function(arg_153_0)
		arg_152_0._layoutNode:getWidget("reward1"):setTouchEnabled(false)
		arg_152_0._layoutNode:getWidget("reward2"):setTouchEnabled(false)
		arg_152_0._layoutNode:getWidget("reward" .. arg_152_1):setDisplayFrame(CCSprite:create("res/ui/resource/silkroad/sczl_bigbox_open.png"):displayFrame())

		local var_153_0 = {}

		for iter_153_0, iter_153_1 in pairs(var_0_22) do
			table.insert(var_153_0, iter_153_1)
		end

		local var_153_1 = arg_152_0._mapId == 10 and arg_152_0.oldMapId or arg_152_0._mapId

		for iter_153_2, iter_153_3 in pairs(var_0_41[var_153_1]) do
			table.insert(var_153_0, iter_153_3)
		end

		local var_153_2

		for iter_153_4, iter_153_5 in pairs(var_153_0) do
			if arg_153_0.action.data.rewards and iter_153_5.type == arg_153_0.action.data.rewards[1].type then
				var_153_2 = CCSprite:create(iter_153_5.pic)

				break
			end
		end

		local var_153_3 = CCSprite:create("res/ui/resource/silkroad/reward_icon_view_bg.jpg")

		var_153_2:setPosition(ccp(40, 40))
		var_153_3:addChild(var_153_2)
		var_153_3:setPosition(50, 120)

		local var_153_4 = CCSprite:create("res/ui/resource/silkroad/sczl_jl_samll_d.png")

		var_153_4:setPosition(ccp(40, -20))
		var_153_3:addChild(var_153_4)

		local var_153_5 = CCStrokeLabelTTF:create(arg_153_0.action.data.rewards[1].value, "Thonburi-Bold", 20)

		var_153_5:setPosition(ccp(40, -20))
		var_153_3:addChild(var_153_5)
		arg_152_0._layoutNode:getWidget("reward" .. arg_152_1):addChild(var_153_3)
		arg_152_0:addCreateNode(var_153_3)

		local var_153_6 = arg_153_0.action.data
		local var_153_7 = {}

		for iter_153_6, iter_153_7 in ipairs(var_153_6.rewards) do
			local var_153_8 = {}

			if iter_153_7.type == 21 then
				var_153_8.id = 7
			elseif iter_153_7.type == 5 then
				var_153_8.id = 6
			elseif iter_153_7.type == 81 then
				var_153_8.id = 24
			elseif iter_153_7.type >= 10000001 and iter_153_7.type <= 10000030 then
				var_153_8.id = 1000000
			elseif iter_153_7.type >= 10000036 and iter_153_7.type <= 10000041 then
				var_153_8.id = 1000000
			elseif iter_153_7.type >= 10000043 and iter_153_7.type <= 10000048 then
				var_153_8.id = 1000000
			elseif iter_153_7.type >= 10000050 and iter_153_7.type <= 10000055 then
				var_153_8.id = 1000000
			elseif iter_153_7.type >= 10000057 and iter_153_7.type <= 10000062 then
				var_153_8.id = 1000000
			elseif iter_153_7.type >= 10000064 and iter_153_7.type <= 10000081 then
				var_153_8.id = 1000000
			else
				var_153_8.id = iter_153_7.type
			end

			var_153_8.value = iter_153_7.value
			var_153_8.suffix = arg_152_0._suffix

			table.insert(var_153_7, var_153_8)
		end

		globalAction_gotResource(var_153_7)
		arg_152_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), CCCallFunc:create(function(...)
			arg_152_0._layoutNode:getWidget("dialog"):setVisible(false)

			arg_152_0._canShowNextDialog = true

			cmgr.sendRequest(handler(arg_152_0, arg_152_0.getSilkInfoResponse), actions.getSilkInfo)
		end)))
	end, actions.silkHandleEvent, math.random(1, 2), 0)
end

function var_0_44.showEndPosEventRewards(arg_155_0)
	arg_155_0._rewards = {}

	if arg_155_0._eventType == 6 or arg_155_0._eventType == 7 then
		for iter_155_0 = 1, arg_155_0._lastHit do
			cmgr.sendRequest(handler(arg_155_0, arg_155_0.silkEndPosEventResponse), actions.silkHandleEvent, 1, 0)
		end
	end
end

function var_0_44.silkEndPosEventResponse(arg_156_0, arg_156_1)
	arg_156_0._finalAgain = arg_156_1.action.data.finalAgain

	if arg_156_1.action.data.rewards then
		table.insert(arg_156_0._rewards, arg_156_1.action.data.rewards[1])

		for iter_156_0, iter_156_1 in pairs(arg_156_1.action.data.rewards) do
			arg_156_0:setShowTreasureType(iter_156_1)
		end
	end

	if arg_156_1.action.data.lastHit == 1 then
		dump(arg_156_0._rewards, "奖励", 10)

		if not user.isNotPlayEffect then
			arg_156_0._layoutNode:getWidget("endRewardLayer"):setVisible(true)
		end

		local var_156_0 = {}

		for iter_156_2, iter_156_3 in pairs(var_0_22) do
			table.insert(var_156_0, iter_156_3)
		end

		local var_156_1 = arg_156_0._mapId == 10 and arg_156_0.oldMapId or arg_156_0._mapId

		for iter_156_4, iter_156_5 in pairs(var_0_41[var_156_1]) do
			table.insert(var_156_0, iter_156_5)
		end

		for iter_156_6, iter_156_7 in ipairs(arg_156_0._rewards) do
			if user.isNotPlayEffect then
				local var_156_2 = {
					{}
				}

				if iter_156_7.type == 21 then
					var_156_2[1].id = 7
				elseif iter_156_7.type == 5 then
					var_156_2[1].id = 6
				elseif iter_156_7.type == 81 then
					var_156_2[1].id = 24
				elseif iter_156_7.type >= 10000001 and iter_156_7.type <= 10000030 then
					var_156_2[1].id = 1000000
				elseif iter_156_7.type >= 10000036 and iter_156_7.type <= 10000041 then
					var_156_2[1].id = 1000000
				elseif iter_156_7.type >= 10000043 and iter_156_7.type <= 10000048 then
					var_156_2[1].id = 1000000
				elseif iter_156_7.type >= 10000050 and iter_156_7.type <= 10000055 then
					var_156_2[1].id = 1000000
				elseif iter_156_7.type >= 10000057 and iter_156_7.type <= 10000062 then
					var_156_2[1].id = 1000000
				elseif iter_156_7.type >= 10000064 and iter_156_7.type <= 10000081 then
					var_156_2[1].id = 1000000
				else
					var_156_2[1].id = iter_156_7.type
				end

				var_156_2[1].value = iter_156_7.value
				var_156_2[1].suffix = arg_156_0._suffix

				if arg_156_0._isMerchantTokenUsed then
					var_156_2[2] = var_156_2[1]
				end

				globalAction_gotResource(var_156_2)

				if iter_156_6 == #arg_156_0._rewards then
					if arg_156_0._treasure then
						arg_156_0:showGetTreasureAnimation()
					else
						cmgr.sendRequest(handler(arg_156_0, arg_156_0.getSilkRewardListResponse), actions.getSilkRewardList, 0)
					end
				end
			else
				local var_156_3 = {}

				for iter_156_8, iter_156_9 in pairs(var_156_0) do
					table.insert(var_156_3, CCSprite:create(iter_156_9.pic))
				end

				local var_156_4 = require("lua/layer/resource/silkRoad/circleListNode").new(72, 72)

				var_156_4:setItems(var_156_3)

				local var_156_5 = 1

				for iter_156_10, iter_156_11 in pairs(var_156_0) do
					if iter_156_7.type == iter_156_11.type then
						var_156_5 = iter_156_10
					end
				end

				var_156_4:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.3 * iter_156_6), CCCallFunc:create(function(...)
					var_156_4:runCircleAction(var_156_5, 3, function(...)
						local var_158_0 = {
							{}
						}

						if iter_156_7.type == 21 then
							var_158_0[1].id = 7
						elseif iter_156_7.type == 5 then
							var_158_0[1].id = 6
						elseif iter_156_7.type == 81 then
							var_158_0[1].id = 24
						elseif iter_156_7.type >= 10000001 and iter_156_7.type <= 10000030 then
							var_158_0[1].id = 1000000
						elseif iter_156_7.type >= 10000036 and iter_156_7.type <= 10000041 then
							var_158_0[1].id = 1000000
						elseif iter_156_7.type >= 10000043 and iter_156_7.type <= 10000048 then
							var_158_0[1].id = 1000000
						elseif iter_156_7.type >= 10000050 and iter_156_7.type <= 10000055 then
							var_158_0[1].id = 1000000
						elseif iter_156_7.type >= 10000057 and iter_156_7.type <= 10000062 then
							var_158_0[1].id = 1000000
						elseif iter_156_7.type >= 10000064 and iter_156_7.type <= 10000081 then
							var_158_0[1].id = 1000000
						else
							var_158_0[1].id = iter_156_7.type
						end

						var_158_0[1].value = iter_156_7.value
						var_158_0[1].suffix = arg_156_0._suffix

						if arg_156_0._isMerchantTokenUsed then
							var_158_0[2] = var_158_0[1]
						end

						globalAction_gotResource(var_158_0)
					end)
				end)))
				var_156_4:setPosition(ccp(4, 4))
				arg_156_0._layoutNode:getWidget("loadingbar2"):runAction(CCProgressTo:create(3 + 0.3 * #arg_156_0._rewards, 100))

				if iter_156_6 == #arg_156_0._rewards then
					arg_156_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(5), CCCallFunc:create(function(...)
						arg_156_0._layoutNode:getWidget("endRewardLayer"):setVisible(false)

						if arg_156_0._treasure then
							arg_156_0:showGetTreasureAnimation()
						else
							cmgr.sendRequest(handler(arg_156_0, arg_156_0.getSilkRewardListResponse), actions.getSilkRewardList, 0)
						end
					end)))
				end

				arg_156_0._layoutNode:getWidget("node" .. iter_156_6):addChild(var_156_4)
				arg_156_0:addCreateNode(var_156_4)
			end
		end
	end
end

function var_0_44.getSilkRewardListResponse(arg_160_0, arg_160_1)
	local function var_160_0(arg_161_0, arg_161_1, arg_161_2)
		if arg_161_1 == arg_161_2 and arg_161_1 == arg_161_0 then
			return colorQuality[7]
		elseif arg_161_0 < arg_161_1 then
			return colorQuality[3]
		else
			return colorQuality[1]
		end
	end

	local function var_160_1(arg_162_0, arg_162_1, arg_162_2)
		if arg_162_1 == arg_162_2 and arg_162_1 == arg_162_0 then
			return colorQuality[7]
		else
			return colorQuality[1]
		end
	end

	local function var_160_2(arg_163_0, arg_163_1, arg_163_2)
		local var_163_0 = CCCallFunc:create(function()
			arg_163_0:setVisible(true)
		end)
		local var_163_1 = CCFadeIn:create(0.5)
		local var_163_2 = CCSpawn:createWithTwoActions(CCEaseExponentialIn:create(CCMoveBy:create(1, ccp(arg_163_1, arg_163_2))), CCEaseExponentialIn:create(CCScaleBy:create(1, 0.5)))
		local var_163_3 = CCArray:create()

		var_163_3:addObject(var_163_0)
		var_163_3:addObject(var_163_1)
		var_163_3:addObject(var_163_2)

		local var_163_4 = CCSequence:create(var_163_3)

		arg_163_0:runAction(var_163_4)
	end

	local function var_160_3(arg_165_0)
		local var_165_0 = CCArray:create()

		var_165_0:addObject(CCCallFunc:create(function()
			arg_165_0:setVisible(true)
		end))
		var_165_0:addObject(CCFadeIn:create(0.2))
		var_165_0:addObject(CCMoveBy:create(1, ccp(0, 80)))
		var_165_0:addObject(CCFadeOut:create(0.2))
		var_165_0:addObject(CCCallFunc:create(function()
			arg_165_0:removeFromParentAndCleanup(true)
		end))
		arg_165_0:runAction(CCSequence:create(var_165_0))
	end

	local function var_160_4(arg_168_0, arg_168_1, arg_168_2)
		local function var_168_0()
			local var_169_0 = arg_168_0:getContentSize().width
			local var_169_1 = arg_168_0:getString()

			arg_168_0:setString(var_169_1 + 1)

			local var_169_2 = arg_168_0:getContentSize().width

			if var_169_0 < var_169_2 then
				arg_168_0:setPositionX(arg_168_0:getPositionX() - (var_169_2 - var_169_0))
			end

			if var_169_1 + 1 == arg_168_2.needNum then
				arg_168_0:setColor(colorQuality[7])
				arg_168_1:setColor(colorQuality[7])
			end
		end

		local var_168_1 = CCArray:create()
		local var_168_2 = 0.2

		for iter_168_0 = 1, arg_168_2.haveNum - arg_168_2.beforeNum do
			local var_168_3 = var_168_2 - 0.01

			var_168_2 = var_168_3 > 0.05 and var_168_3 or 0.05

			var_168_1:addObject(CCSequence:createWithTwoActions(CCDelayTime:create(var_168_2), CCCallFunc:create(var_168_0)))
		end

		arg_168_0:runAction(CCSequence:create(var_168_1))
	end

	if arg_160_0._finalAgain then
		cmgr.sendRequest(handler(arg_160_0, arg_160_0.getSilkInfoResponse), actions.getSilkInfo)
	else
		arg_160_0._layoutNode:getWidget("rewardListLayer"):setVisible(true)
	end

	local var_160_5 = CCLayerColor:create(ccc4(255, 0, 0, 0), 0, 0)

	var_160_5:setAnchorPoint(ccp(0.5, 0.5))
	var_160_5:ignoreAnchorPointForPosition(false)

	local var_160_6 = 30

	for iter_160_0, iter_160_1 in ipairs(arg_160_1.action.data.components) do
		local var_160_7 = CCSprite:create("res/ui/resource/silkroad/" .. iter_160_1.pic .. ".jpg")
		local var_160_8 = CCSprite:create("res/ui/resource/silkroad/reward_icon_view_bg.jpg")

		var_160_7:setPosition(ccp(40, 40))
		var_160_8:addChild(var_160_7)
		var_160_8:setPosition(50, 120)

		local var_160_9 = CCSprite:create("res/ui/resource/silkroad/sczl_jl_samll_d.png")

		var_160_9:setPosition(ccp(40, -20))
		var_160_8:addChild(var_160_9)

		if iter_160_1.haveNum == iter_160_1.needNum and iter_160_1.haveNum == iter_160_1.beforeNum then
			local var_160_10 = CCSprite:create("res/ui/resource/silkroad/sczl_js_man.png")

			var_160_10:setPosition(ccp(76, 76))
			var_160_8:addChild(var_160_10)
		elseif iter_160_1.haveNum == iter_160_1.needNum then
			local var_160_11 = CCSprite:create("res/ui/resource/silkroad/sczl_js_man.png")

			var_160_11:setScale(2)
			var_160_11:setPosition(ccp(76, 156))
			var_160_11:setVisible(false)
			var_160_8:addChild(var_160_11)
			var_160_2(var_160_11, 0, -80)
		end

		local var_160_12 = 22
		local var_160_13 = iter_160_1.beforeNum
		local var_160_14 = CCStrokeLabelTTF:create(var_160_13, "Thonburi-Bold", var_160_12)

		var_160_14:setColor(var_160_0(iter_160_1.beforeNum, iter_160_1.haveNum, iter_160_1.needNum))

		local var_160_15 = "/" .. iter_160_1.needNum
		local var_160_16 = CCStrokeLabelTTF:create(var_160_15, "Thonburi-Bold", var_160_12)

		var_160_16:setColor(var_160_1(iter_160_1.beforeNum, iter_160_1.haveNum, iter_160_1.needNum))

		local var_160_17 = createRichNode({
			var_160_14,
			var_160_16
		}, 0.5)

		var_160_17:setPosition(ccp(40, -20))
		var_160_8:addChild(var_160_17)

		if iter_160_1.haveNum > iter_160_1.beforeNum then
			local var_160_18 = CCStrokeLabelTTF:create("+" .. iter_160_1.haveNum - iter_160_1.beforeNum, "Thonburi-Bold", var_160_12)

			var_160_18:setColor(colorQuality[3])
			var_160_18:setPosition(ccp(var_160_17:getPositionX() + var_160_14:getPositionX(), var_160_17:getPositionY() + var_160_14:getPositionY() + var_160_12))
			var_160_18:setVisible(false)
			var_160_8:addChild(var_160_18)
			var_160_4(var_160_14, var_160_16, {
				beforeNum = iter_160_1.beforeNum,
				haveNum = iter_160_1.haveNum,
				needNum = iter_160_1.needNum
			})
			var_160_3(var_160_18)
		end

		local var_160_19 = var_160_5:getContentSize().width

		var_160_5:setContentSize(CCSizeMake(var_160_19 + (var_160_8:getContentSize().width / 2 + var_160_6) * 2, 50))

		local var_160_20 = var_160_19 + (var_160_8:getContentSize().width / 2 + var_160_6)

		var_160_8:setPosition(ccp(var_160_20, 25))
		var_160_5:addChild(var_160_8)
	end

	if arg_160_1.action.data.medalNum and arg_160_1.action.data.medalNum > 0 then
		local var_160_21 = CCSprite:create("res/ui/resource/silkroad/" .. arg_160_1.action.data.pic .. ".jpg")
		local var_160_22 = CCSprite:create("res/ui/resource/silkroad/reward_icon_view_bg.jpg")

		var_160_21:setPosition(ccp(40, 40))
		var_160_22:addChild(var_160_21)
		var_160_22:setPosition(50, 120)

		local var_160_23 = CCSprite:create("res/ui/resource/silkroad/sczl_jl_samll_d.png")

		var_160_23:setPosition(ccp(40, -20))
		var_160_22:addChild(var_160_23)

		local var_160_24 = CCStrokeLabelTTF:create(arg_160_1.action.data.medalNum, "Thonburi-Bold", 22)

		var_160_24:setPosition(ccp(40, -20))
		var_160_22:addChild(var_160_24)

		local var_160_25 = var_160_5:getContentSize().width

		var_160_5:setContentSize(CCSizeMake(var_160_25 + (var_160_22:getContentSize().width / 2 + var_160_6) * 2, 50))

		local var_160_26 = var_160_25 + (var_160_22:getContentSize().width / 2 + var_160_6)

		var_160_22:setPosition(ccp(var_160_26, 25))
		var_160_5:addChild(var_160_22)
	end

	local var_160_27 = arg_160_0._layoutNode:getWidget("rewardListLayer"):getContentSize().width / 2

	var_160_5:setPosition(var_160_27, 180)
	arg_160_0._layoutNode:getWidget("rewardListLayer"):addChild(var_160_5)
	arg_160_0:addCreateNode(var_160_5)

	if arg_160_0.isDiDiReward then
		arg_160_0.isDiDiReward = false
	end
end

function var_0_44.setShowTreasureType(arg_170_0, arg_170_1)
	if (arg_170_1.type == 10000001 or arg_170_1.type == 10000007 or arg_170_1.type == 10000013 or arg_170_1.type == 10000019 or arg_170_1.type == 10000025 or arg_170_1.type == 10000036 or arg_170_1.type == 10000043 or arg_170_1.type == 10000050 or arg_170_1.type == 10000057 or arg_170_1.type == 10000064) and not arg_170_0._finalAgain and arg_170_0.firstTimes and arg_170_0.firstTimes == 1 then
		arg_170_0._treasure = arg_170_1.type
	end
end

function var_0_44.onOkClick(arg_171_0, ...)
	cmgr.sendRequest(function(arg_172_0)
		if arg_171_0.canGoWeapon then
			arg_171_0:gotoTreasure()

			arg_171_0.canGoWeapon = false

			return
		end

		arg_171_0._layoutNode:getWidget("rewardListLayer"):setVisible(false)
		arg_171_0:getSilkInfoResponse(arg_172_0)
	end, actions.getSilkInfo)
end

function var_0_44.showGetTreasureAnimation(arg_173_0)
	if arg_173_0._treasure then
		log.info("播放动画")

		local var_173_0 = CCSprite:create()
		local var_173_1 = {
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_1_p.png",
				type = 10000001
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_2_p.png",
				type = 10000007
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_3_p.png",
				type = 10000013
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_4_p.png",
				type = 10000019
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_5_p.png",
				type = 10000025
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_6_p.png",
				type = 10000036
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_7_p.png",
				type = 10000043
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_8_p.png",
				type = 10000050
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_9_p.png",
				type = 10000057
			},
			{
				pic = "res/ui/weapon/silkTreasure/treasure/zb_10_p.png",
				type = 10000064
			}
		}

		for iter_173_0, iter_173_1 in pairs(var_173_1) do
			if iter_173_1.type == arg_173_0._treasure then
				var_173_0 = CCSprite:create(iter_173_1.pic)

				break
			end
		end

		local var_173_2 = CCSprite:create("res/ui/resource/silkroad/sczl_word_02_hdzb.png")

		var_173_2:setPosition(var_173_0:getContentSize().width / 2, 50)
		var_173_0:addChild(var_173_2)
		var_173_0:setScale(0.2)
		var_173_0:runAction(CCScaleTo:create(0.5, 1))
		var_173_2:runAction(CCMoveBy:create(0.6, ccp(0, 100)))
		var_173_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1.5), CCCallFunc:create(function(...)
			var_173_0:removeFromParentAndCleanup(true)
			cmgr.sendRequest(handler(arg_173_0, arg_173_0.getSilkRewardListResponse), actions.getSilkRewardList, 0)
		end)))
		var_173_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		arg_173_0:addChild(var_173_0)

		arg_173_0._treasure = nil
		arg_173_0.canGoWeapon = true
	end
end

function var_0_44.gotoTreasure(arg_175_0, ...)
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(5)

	if arg_175_0._mapId >= 10 then
		roleDialogue.control.loadSpeak("tenSilkOpen")
	end
end

function var_0_44.checkMulNationBuff(arg_176_0, arg_176_1)
	local var_176_0 = arg_176_0._layoutNode:getWidget("node_mulNationBuff")

	var_176_0:setVisible(false)

	local var_176_1 = arg_176_1.mulNationBuff

	if type(var_176_1) == "table" then
		var_176_0:setVisible(true)
		arg_176_0._layoutNode:getWidget("num_mulNationBuff"):setString(language.get(136105, var_176_1.num))
		arg_176_0._layoutNode:getWidget("icon_mulNationBuff"):setDisplayFrame(CCSprite:create("res/ui/activity/MulNation/wblc_icon_sf0" .. var_176_1.id .. ".jpg"):displayFrame())
	end
end

function var_0_44.checkHalfSilkToken(arg_177_0, arg_177_1)
	local var_177_0 = arg_177_0._layoutNode:getWidget("bg_halfSilkToken")
	local var_177_1 = arg_177_0._layoutNode:getWidget("timer_halfSilkToken")

	var_177_0:setVisible(false)
	var_177_1:stopAllActions()

	if arg_177_1.halfSilkToken ~= nil and type(arg_177_1.halfSilkToken) == "table" then
		local var_177_2 = arg_177_1.halfSilkToken.cd

		if var_177_2 > 0 then
			var_177_0:setVisible(true)

			local var_177_3 = string.format("%s %s", language.get(20036, arg_177_1.halfSilkToken.times), tool.getFormatTime(var_177_2))

			var_177_1:setString(var_177_3)

			local var_177_4 = CCArray:create()

			var_177_4:addObject(CCDelayTime:create(0.5))
			var_177_4:addObject(CCCallFunc:create(function()
				var_177_2 = var_177_2 - 500

				if var_177_2 <= 0 then
					cmgr.sendRequest(handler(arg_177_0, arg_177_0.getSilkInfoResponse), actions.getSilkInfo)
				else
					local var_178_0 = string.format("%s %s", language.get(20036, arg_177_1.halfSilkToken.times), tool.getFormatTime(var_177_2))

					var_177_1:setString(var_178_0)
				end
			end))

			local var_177_5 = CCSequence:create(var_177_4)

			var_177_1:runAction(CCRepeatForever:create(var_177_5))
		end
	end
end

function var_0_44.checkDwxzBuff(arg_179_0, arg_179_1)
	local var_179_0 = arg_179_0._layoutNode:getWidget("node_dwxzBuff")

	var_179_0:setVisible(false)

	local var_179_1 = arg_179_1.dwxzBuff

	if type(var_179_1) == "table" then
		var_179_0:setVisible(true)
		arg_179_0._layoutNode:getWidget("num_dwxzBuff"):setString(language.get(136105, var_179_1.num))
	end
end

function var_0_44.playAttEffect(arg_180_0)
	for iter_180_0 = 1, 7 do
		local function var_180_0()
			tool.safeRemoveChildByTag(arg_180_0._layoutNode:getWidget("pos" .. iter_180_0), 999 + iter_180_0)
		end

		local var_180_1 = rmgr.getAnimation("specialAttWin")
		local var_180_2 = CCAnimation:createWithSpriteFrames(var_180_1, 0.08)
		local var_180_3 = CCAnimate:create(var_180_2)
		local var_180_4 = CCRepeat:create(var_180_3, 1)
		local var_180_5 = CCCallFuncN:create(var_180_0)
		local var_180_6 = CCArray:create()

		var_180_6:addObject(CCDelayTime:create(0.2 * iter_180_0))
		var_180_6:addObject(var_180_4)
		var_180_6:addObject(var_180_5)

		local var_180_7 = CCSequence:create(var_180_6)

		sp = CCSprite:create()

		sp:runAction(var_180_7)
		sp:setPosition(ccp(0, 0))
		sp:setScale(0.5)
		arg_180_0._layoutNode:getWidget("pos" .. iter_180_0):addChild(sp, 0, 999 + iter_180_0)
	end
end

return var_0_44
