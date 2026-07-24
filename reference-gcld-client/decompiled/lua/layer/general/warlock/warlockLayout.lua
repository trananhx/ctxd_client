local var_0_0 = {}

if conf.language == "kr" then
	var_0_0.totoalNumX = 20
	var_0_0.upgradeWarlockFontSize = 16
	var_0_0.warlockConsumedFontSize = -6
	var_0_0.warlockNumFontSize = 0
	var_0_0.warlockTitleScale = 1
elseif conf.language == "vie" then
	var_0_0.totoalNumX = 120
	var_0_0.upgradeWarlockFontSize = 22
	var_0_0.warlockConsumedFontSize = 0
	var_0_0.warlockNumFontSize = -4
	var_0_0.warlockTitleScale = 0.8
elseif conf.language == "tha" then
	var_0_0.totoalNumX = 40
	var_0_0.upgradeWarlockFontSize = 22
	var_0_0.warlockConsumedFontSize = 0
	var_0_0.warlockNumFontSize = -4
	var_0_0.warlockTitleScale = 0.8
else
	var_0_0.totoalNumX = 0
	var_0_0.upgradeWarlockFontSize = 22
	var_0_0.warlockConsumedFontSize = 0
	var_0_0.warlockNumFontSize = 0
	var_0_0.warlockTitleScale = 1
end

local var_0_1 = {
	panel_notBuilt = {
		widgets = {
			{
				y = 0,
				name = "root",
				type = "layer",
				x = 0,
				children = {
					{
						x = 480,
						name = "panel",
						type = "sprite9",
						y = 290,
						pic = {
							path = "res/ui/general/jailView/comm_view_2.png"
						},
						middleRect = CCRectMake(51, 51, 1, 1),
						preferedSize = CCSizeMake(927, 547)
					},
					{
						y = 290,
						x = 480,
						visible = true,
						type = "sprite",
						pic = {
							path = "res/ui/general/jailView/laofang_jianzao_view.jpg"
						}
					},
					{
						y = 445.5,
						x = 73,
						visible = true,
						type = "sprite",
						pic = {
							path = "res/ui/warlock/shushifang_tit_jzssf.png"
						}
					},
					{
						x = 480,
						name = "light",
						y = 305,
						type = "sprite",
						visible = false,
						zorder = 100,
						pic = {
							path = "res/ui/warlock/shushifang_build_lig.png"
						}
					},
					{
						y = 305,
						x = 480,
						visible = true,
						type = "sprite",
						zorder = 100,
						pic = {
							path = "res/ui/warlock/shushifang_build.png"
						}
					},
					{
						zoomOnTouchDown = false,
						name = "btn_building",
						h = 427,
						type = "button",
						w = 500,
						visible = true,
						enable = false,
						y = 304.5,
						x = 480,
						normal = {
							path = "res/ui/warlock/shushifang_build.png"
						},
						touched = {
							path = "res/ui/warlock/shushifang_build_lig.png"
						}
					},
					{
						x = 480,
						name = "pic_djjr",
						y = 161.5,
						type = "sprite",
						visible = false,
						zorder = 100,
						pic = {
							path = "res/ui/general/jailView/laofang_tit_djjr.png"
						}
					},
					{
						x = 480,
						y = 111.5,
						type = "sprite",
						pic = {
							path = "res/ui/general/jailView/comm_list_laofang_3.png"
						}
					},
					{
						x = 480,
						y = 53.5,
						type = "sprite",
						pic = {
							path = "res/ui/rankInfo/twoRankInfo/rank_progress_bar_bg.jpg"
						}
					},
					{
						x = 480,
						name = "bar_progress",
						y = 53.5,
						type = "progressbar",
						pic = {
							path = "res/ui/general/jailView/laofang_load_con.png"
						},
						anchorPoint = ccp(0.5, 0.5),
						progressType = kCCProgressTimerTypeBar
					},
					{
						fontSize = 50,
						name = "value_progress",
						y = 53.5,
						type = "label",
						style = "label_warlock",
						x = 480
					},
					{
						fontSize = 22,
						name = "open_level",
						y = 136.5,
						type = "label",
						style = "label_warlock",
						visible = false,
						x = 816.5
					},
					{
						zoomOnTouchDown = false,
						name = "btn_build_LJ",
						h = 61,
						type = "button",
						w = 197,
						visible = false,
						enable = false,
						y = 276.5,
						x = 816.5,
						normal = {
							path = "res/ui/general/jailView/laofang_btn_ljjc_a.png"
						},
						touched = {
							path = "res/ui/general/jailView/laofang_btn_ljjc_c.png"
						}
					},
					{
						zoomOnTouchDown = false,
						name = "btn_build_KS",
						h = 61,
						type = "button",
						w = 197,
						visible = false,
						enable = false,
						y = 206.5,
						x = 816.5,
						normal = {
							path = "res/ui/general/jailView/laofang_btn_ksjz_a.png"
						},
						touched = {
							path = "res/ui/general/jailView/laofang_btn_ksjz_c.png"
						}
					},
					{
						zoomOnTouchDown = false,
						name = "btn_build_PT",
						h = 61,
						type = "button",
						w = 197,
						visible = false,
						enable = false,
						y = 136.5,
						x = 816.5,
						normal = {
							path = "res/ui/general/jailView/laofang_btn_ptjz_a.png"
						},
						touched = {
							path = "res/ui/general/jailView/laofang_btn_ptjz_c.png"
						}
					},
					{
						fontSize = 24,
						name = "cost_build_KS",
						y = 186.5,
						type = "label",
						style = "label_warlock",
						visible = false,
						x = 756.5,
						zorder = 100
					},
					{
						fontSize = 24,
						name = "cost_build_PT",
						y = 116.5,
						type = "label",
						style = "label_warlock",
						visible = false,
						x = 756.5,
						zorder = 100
					},
					{
						zoomOnTouchDown = false,
						name = "btn_build_TZ",
						h = 61,
						type = "button",
						w = 197,
						visible = false,
						enable = false,
						y = 136.5,
						x = 816.5,
						normal = {
							path = "res/ui/general/jailView/laofang_btn_tzjz_a.png"
						},
						touched = {
							path = "res/ui/general/jailView/laofang_btn_tzjz_c.png"
						}
					}
				}
			}
		}
	},
	panel_alreadyBuilt = {
		widgets = {
			{
				y = 0,
				name = "root",
				type = "layer",
				x = 0,
				children = {
					{
						x = 480,
						name = "panel",
						y = 290,
						type = "sprite",
						pic = {
							frame = false,
							path = "res/ui/warlock/warlock_view.jpg"
						},
						children = {
							{
								x = 457,
								name = "title_no",
								y = 495,
								type = "sprite",
								visible = false,
								pic = {
									frame = false,
									path = "res/ui/common/text/warlock/warlock_build_tit.png"
								},
								scale = var_0_0.warlockTitleScale
							},
							{
								x = 457,
								name = "title_leve_1",
								y = 495,
								type = "sprite",
								visible = false,
								pic = {
									frame = false,
									path = "res/ui/common/text/warlock/warlock_build_grade1.png"
								},
								scale = var_0_0.warlockTitleScale
							},
							{
								x = 457,
								name = "title_leve_2",
								y = 495,
								type = "sprite",
								visible = false,
								pic = {
									frame = false,
									path = "res/ui/common/text/warlock/warlock_build_grade2.png"
								},
								scale = var_0_0.warlockTitleScale
							},
							{
								x = 457,
								name = "title_leve_3",
								y = 495,
								type = "sprite",
								visible = false,
								pic = {
									frame = false,
									path = "res/ui/common/text/warlock/warlock_build_grade3.png"
								},
								scale = var_0_0.warlockTitleScale
							},
							{
								x = 457,
								name = "title_leve_4",
								y = 495,
								type = "sprite",
								visible = false,
								pic = {
									frame = false,
									path = "res/ui/common/text/warlock/warlock_build_grade4.png"
								},
								scale = var_0_0.warlockTitleScale
							},
							{
								x = 457,
								name = "title_leve_5",
								y = 495,
								type = "sprite",
								visible = false,
								pic = {
									frame = false,
									path = "res/ui/common/text/warlock/warlock_build_grade5.png"
								},
								scale = var_0_0.warlockTitleScale
							},
							{
								style = "button_tip",
								name = "tipButton",
								y = 495,
								type = "button",
								x = 850
							},
							{
								style = "button_yel3",
								name = "buyMapButton",
								y = 495,
								type = "button",
								visible = false,
								x = 697,
								label = {
									textId = 20006,
									type = "label"
								}
							},
							{
								style = "button_yel3",
								name = "upgradeButton",
								y = 495,
								type = "button",
								visible = false,
								x = 697,
								label = {
									textId = 20007,
									type = "label",
									fontSize = var_0_0.upgradeWarlockFontSize
								}
							},
							{
								y = 465,
								type = "label",
								x = 17,
								textId = 20035,
								fontSize = 22 + var_0_0.warlockNumFontSize,
								anchorPoint = ccp(0, 0.5)
							},
							{
								fontSize = 22,
								name = "jiebingTotalNumLabel",
								text = "",
								type = "label",
								y = 465,
								x = 165 + var_0_0.totoalNumX,
								anchorPoint = ccp(0, 0.5)
							},
							{
								y = 38,
								name = "btn_start",
								style = "button_gre3",
								type = "button",
								visible = false,
								x = 337,
								label = {
									fontSize = 22,
									textId = 20046,
									type = "label"
								}
							},
							{
								y = 38,
								name = "btn_stop",
								style = "button_gre3",
								type = "button",
								visible = false,
								x = 337,
								label = {
									fontSize = 22,
									textId = 20047,
									type = "label"
								}
							},
							{
								y = 38,
								name = "btn_get",
								style = "button_yel3",
								type = "button",
								x = 577,
								label = {
									fontSize = 22,
									textId = 20048,
									type = "label"
								}
							}
						}
					}
				}
			}
		}
	},
	card_unopen = {
		name = "card_unopen",
		type = "sprite",
		pic = {
			frame = true,
			path = "warlock_view_up_list_1.jpg"
		},
		children = {}
	}
}

function getUpgradeWarlockTipFrame(arg_1_0)
	local var_1_0 = {}

	if conf.language == "kr" then
		var_1_0.goldIconX = 30
		var_1_0.goldCostX = 30
	else
		var_1_0.goldIconX = 0
		var_1_0.goldCostX = 0
	end

	return {
		xcenter = 0,
		name = "upgradeWarlockTipFrame",
		type = "pic_9",
		anchorPointX = 0.5,
		ycenter = 0,
		pic = "frame:common_tip_frame_small.png",
		anchorPointY = 0.5,
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(400, 270),
		children = {
			{
				z = 10,
				fontSize = 26,
				type = "label",
				top = 15,
				left = 15,
				text = arg_1_0.name,
				color = colorQuality[5],
				align = kCCTextAlignmentLeft
			},
			{
				xcenter = 0,
				name = "tip_bar",
				type = "pic",
				top = 50,
				pic = "res/ui/general/jailView/comm_list_laofang_1_up.png"
			},
			{
				z = 10,
				fontSize = 18,
				type = "label",
				top = 70,
				left = 15,
				text = language.get(20049),
				align = kCCTextAlignmentLeft
			},
			{
				z = 10,
				fontSize = 18,
				type = "label",
				top = 100,
				left = 15,
				text = language.get(20050, arg_1_0.todayMax - arg_1_0.todayNum),
				align = kCCTextAlignmentLeft
			},
			{
				z = 10,
				fontSize = 18,
				type = "label",
				top = 130,
				left = 15,
				text = language.get(20051, arg_1_0.nextExtraNum),
				align = kCCTextAlignmentLeft
			},
			{
				z = 10,
				fontSize = 18,
				type = "label",
				top = 160,
				left = 15,
				text = language.get(20052),
				align = kCCTextAlignmentLeft
			},
			{
				scale = 0.9,
				type = "pic",
				top = 158,
				pic = "res/ui/general/jailView/jail_gold_icon.png",
				left = 105 + var_1_0.goldIconX
			},
			{
				z = 10,
				fontSize = 18,
				type = "label",
				top = 160,
				text = arg_1_0.upgradeGold,
				left = 145 + var_1_0.goldCostX,
				color = colorQuality[4],
				align = kCCTextAlignmentLeft
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_gre_c.png",
						name = "btn_upgradeWarlock",
						pic1 = "frame:btn3_gre_a.png",
						down = 10,
						x = 200,
						children = {
							{
								xcenter = 0,
								fontSize = 22,
								type = "label",
								ycenter = 0,
								text = language.get(20003)
							}
						}
					}
				}
			}
		}
	}
end

var_0_1.warlock_card = {
	name = "warlock_card",
	type = "sprite",
	pic = {
		frame = true,
		path = "warlock_view_up_list_2.jpg"
	},
	children = {
		{
			x = 85.5,
			name = "warlock_close_card",
			y = 165.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_3.jpg"
			},
			children = {
				{
					y = 30,
					type = "label",
					x = 85.5,
					textId = 20038,
					fontSize = 22 + var_0_0.warlockConsumedFontSize
				}
			}
		},
		{
			x = 85.5,
			name = "warlock_1",
			y = 165,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_peop_zc.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv0_1",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_zc_red.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv1_1",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_zc_purple.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_2",
			y = 165,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_peop_zj.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv0_2",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_zj_red.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv1_2",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_zj_purple.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_3",
			y = 165,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_peop_yj.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv0_3",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_yj_red.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv1_3",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_yj_purple.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_4",
			y = 165,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_peop_nhlx.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv0_4",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_nhlx_red.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv1_4",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_nhlx_purple.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_5",
			y = 165,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_peop_sjxs.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv0_5",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_sjxs_red.png"
			}
		},
		{
			x = 85.5,
			name = "warlock_name_lv1_5",
			y = 304.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_tit_sjxs_purple.png"
			}
		},
		{
			x = 150.5,
			name = "upgradeLight",
			y = 302.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_btn_sj_lig.png"
			}
		},
		{
			zoomOnTouchDown = false,
			name = "upgradeWarlock",
			h = 52,
			type = "button",
			w = 171,
			visible = false,
			y = 304.5,
			x = 85.5,
			normal = {
				path = "res/ui/warlock/warlock_btn_sj_a.png"
			},
			touched = {
				path = "res/ui/warlock/warlock_btn_sj_c.png"
			}
		},
		{
			x = 150.5,
			name = "getJiebingLight",
			y = 302.5,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_btn_jb_lig.png"
			}
		},
		{
			zoomOnTouchDown = true,
			name = "getJiebing",
			h = 52,
			type = "button",
			w = 171,
			visible = false,
			y = 304.5,
			x = 85.5,
			normal = {
				frame = false,
				path = "res/ui/warlock/warlock_btn_jb_a.png"
			},
			touched = {
				frame = false,
				path = "res/ui/warlock/warlock_btn_jb_c.png"
			}
		},
		{
			x = 80.5,
			name = "warlockInfo",
			y = 30,
			type = "sprite",
			visible = false,
			pic = {
				frame = true,
				path = "warlock_view_up_list_2_up.jpg"
			},
			children = {
				{
					y = 30,
					name = "researchNumNode",
					x = 25,
					type = "node"
				},
				{
					x = 70.5,
					name = "jieBingIcon",
					y = 30,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "warlock_icon_jb_a.png"
					}
				},
				{
					fontSize = 22,
					name = "jiebingNumLabel",
					y = 30,
					type = "label",
					width = 80,
					height = 0,
					text = "",
					visible = false,
					x = 125.5,
					color = ccc3(193, 184, 178)
				},
				{
					x = 70.5,
					name = "clockIcon",
					y = 30,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "warlock_icon_djs.png"
					}
				},
				{
					y = 30,
					name = "timerNode",
					x = 125.5,
					type = "node"
				},
				{
					x = 70.5,
					name = "resIcon",
					y = 30,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "res_icon_2.png"
					}
				},
				{
					text = "",
					name = "reseachConsumeLabel",
					fontSize = 22,
					type = "label",
					y = 30,
					x = 125.5,
					visible = false,
					color = ccc3(193, 184, 178)
				}
			}
		},
		{
			x = 85.5,
			name = "state_bg",
			y = 80,
			type = "sprite",
			visible = false,
			pic = {
				path = "res/ui/common/text/warlock/warlock_state_bg.png"
			}
		},
		{
			x = 85.5,
			name = "state_yanJZ",
			y = 80,
			type = "sprite",
			visible = false,
			pic = {
				path = "res/ui/common/text/warlock/warlock_state_yjz.png"
			}
		},
		{
			x = 85.5,
			name = "state_yiTZ",
			y = 80,
			type = "sprite",
			visible = false,
			pic = {
				path = "res/ui/common/text/warlock/warlock_state_ytz.png"
			}
		},
		{
			x = 85.5,
			name = "state_keLQ",
			y = 80,
			type = "sprite",
			visible = false,
			pic = {
				path = "res/ui/common/text/warlock/warlock_state_klq.png"
			}
		}
	}
}

return var_0_1
