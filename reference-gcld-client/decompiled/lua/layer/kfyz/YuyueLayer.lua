local var_0_0 = require("res/native/offset").get("layer.kfyz.yuyue")
local var_0_1 = tool.hexToRgb("#ECDEA7")
local var_0_2 = tool.hexToRgb("#9FFF97")
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[2]
local var_0_6 = colorQuality[6]
local var_0_7 = tool.hexToRgb("#BCBCBC")
local var_0_8 = tool.hexToRgb("#FDA156")
local var_0_9 = 100
local var_0_10 = 101
local var_0_11 = 102

local function var_0_12(arg_1_0)
	for iter_1_0 = 1, 3 do
		arg_1_0["mine" .. iter_1_0] = arg_1_0["mine" .. iter_1_0] or 0
	end

	local var_1_0 = math.min(arg_1_0.mine1, arg_1_0.mine2, arg_1_0.mine3)
	local var_1_1 = math.min(arg_1_0.mine1, arg_1_0.mine2, arg_1_0.mine3)
	local var_1_2 = 0

	if var_1_0 == 0 then
		for iter_1_1 = 1, 3 do
			if arg_1_0["mine" .. iter_1_1] > 0 then
				var_1_2 = iter_1_1

				break
			end
		end
	end

	arg_1_0.forceType = var_1_2
end

local var_0_13 = class("kfyzYuyueLayer", function()
	return createBaseLayer()
end)

var_0_13.layout = {
	name = "panel",
	type = "sprite9",
	preferedSize = CCSizeMake(960, 580),
	middleRect = CCRectMake(30, 30, 45, 45),
	x = visibleSize.width / 2,
	y = visibleSize.height / 2 - 30,
	pic = {
		frame = true,
		path = "bigPanel.png"
	},
	children = {
		{
			w = 32,
			name = "btn_close",
			h = 33,
			type = "button",
			y = 604,
			x = 924,
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
			y = 290,
			name = "bg",
			type = "sprite9",
			x = 480,
			preferedSize = CCSizeMake(915, 532),
			middleRect = CCRectMake(10, 10, 70, 70),
			pic = {
				path = "res/ui/common/panel/comm_view.png"
			},
			children = {
				{
					y = 455,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_title.png"
					}
				},
				{
					fontSize = 22,
					name = "state1",
					type = "label",
					width = 250,
					height = 0,
					textId = 390534,
					y = 480,
					x = 900,
					anchorPoint = ccp(1, 0.5),
					color = var_0_3,
					halign = kCCTextAlignmentLeft
				},
				{
					type = "sprite",
					name = "bg_state3",
					y = 475,
					visible = false,
					x = 140,
					pic = {
						path = "res/ui/kfyz/kfyz_word_bg.png"
					},
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_protect",
							h = 58,
							type = "button",
							w = 45,
							y = 32,
							x = 50,
							normal = {
								path = "res/ui/kfyz/yuyue/yyyz_hu.png"
							},
							touched = {
								path = "res/ui/kfyz/yuyue/yyyz_hu.png"
							}
						},
						{
							fontSize = 22,
							name = "state3",
							y = 32,
							type = "label",
							x = 80,
							text = "00:00:00",
							anchorPoint = ccp(0, 0.5),
							color = var_0_3
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_yzToken",
					h = 34,
					type = "button",
					w = 105,
					y = 475,
					visible = false,
					x = 56,
					normal = {
						path = "res/ui/nation/gjrk_word_bg.png"
					},
					touched = {
						path = "res/ui/nation/gjrk_word_bg.png"
					},
					children = {
						{
							y = 24,
							x = 20,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/kfyz/yuyue/yzxms_icon_czl.png"
							}
						},
						{
							fontSize = 22,
							name = "yzToken",
							y = 17,
							type = "label",
							x = 40,
							color = var_0_1,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_yzEquip",
					h = 34,
					type = "button",
					w = 105,
					y = 475,
					visible = false,
					x = 166,
					normal = {
						path = "res/ui/nation/gjrk_word_bg.png"
					},
					touched = {
						path = "res/ui/nation/gjrk_word_bg.png"
					},
					children = {
						{
							y = 24,
							x = 20,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/yuyue/frd_icon_zb.png"
							}
						},
						{
							fontSize = 22,
							name = "yzEquip",
							y = 17,
							type = "label",
							x = 40,
							color = var_0_1,
							anchorPoint = ccp(0, 0.5)
						}
					}
				},
				{
					type = "node",
					name = "node_refresh",
					y = 475,
					visible = false,
					x = 246,
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_refresh",
							h = 78,
							type = "button",
							w = 79,
							y = 0,
							x = 0,
							normal = {
								path = "res/ui/kfyz/yuyue/yyyz_btn_arrow.png"
							},
							touched = {
								path = "res/ui/kfyz/yuyue/yyyz_btn_arrow_c.png"
							}
						},
						{
							x = 30,
							y = 6,
							type = "sprite",
							scale = 0.8,
							pic = {
								frame = true,
								path = "res_icon_19_small.png"
							}
						},
						{
							fontSize = 22,
							name = "gold",
							y = -8,
							type = "label",
							x = 30,
							anchorPoint = ccp(0.5, 0.5),
							color = var_0_4
						}
					}
				},
				{
					y = 59,
					name = "bg_server",
					visible = false,
					type = "sprite",
					x = 266,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_server_list_bg.png"
					},
					children = {
						{
							y = 339,
							x = 22,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/yuyue/yzl_flag.png"
							}
						},
						{
							y = 339,
							type = "sprite",
							x = 294,
							pic = {
								path = "res/ui/kfyz/yuyue/yzlxg_pb_bg.png"
							},
							children = {
								{
									y = 16,
									name = "bar",
									type = "progressbar",
									x = 174,
									pic = {
										path = "res/ui/kfyz/yuyue/yzlxg_pb_01.png"
									}
								},
								{
									fontSize = 22,
									name = "selfPer",
									y = 16,
									type = "label",
									x = 174
								}
							}
						},
						{
							fontSize = 26,
							y = 339,
							type = "label",
							x = 37,
							textId = 490169,
							anchorPoint = ccp(0, 0.5),
							color = var_0_1
						},
						{
							zoomOnTouchDown = true,
							name = "btn_medal",
							h = 60,
							type = "button",
							w = 60,
							y = 339,
							x = 495,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 30,
									x = 30,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/resource/silkroad/reward_icon_view_bg.jpg"
									},
									children = {
										{
											y = 40,
											name = "icon_medal",
											x = 40,
											type = "sprite"
										}
									}
								}
							}
						}
					}
				},
				{
					name = "bg_no_server",
					type = "sprite9",
					y = 59,
					x = 457.5,
					preferedSize = CCSizeMake(908, 368),
					middleRect = CCRectMake(10, 10, 504, 338),
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_server_list_bg.png"
					},
					children = {
						{
							y = 340,
							x = 454,
							type = "sprite",
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_fwqlb.png"
							}
						},
						{
							scale = 0.55,
							y = 160,
							type = "sprite",
							x = 454,
							pic = {
								path = "res/ui/nationTask/building/huawen_01.png"
							}
						},
						{
							y = 170,
							x = 454,
							type = "sprite",
							pic = {
								path = "res/ui/world/cityCombo/lxzc_bg4.png"
							}
						},
						{
							type = "sprite",
							name = "txt_p1",
							y = 170,
							visible = false,
							x = 454,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_01.png"
							}
						},
						{
							type = "sprite",
							name = "txt_p2",
							y = 170,
							visible = false,
							x = 454,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_03.png"
							}
						},
						{
							type = "sprite",
							name = "txt_p3",
							y = 170,
							visible = false,
							x = 454,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_word_02.png"
							}
						}
					}
				},
				{
					y = 59,
					name = "bg_server_info",
					visible = false,
					type = "sprite",
					x = 720,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_server_bg.png"
					},
					children = {
						{
							type = "sprite",
							name = "bg_divide",
							y = 0,
							visible = false,
							x = 0,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/kfyz/yuyue/bfslyz_bfsl_bg.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_divide_show",
							h = 62,
							type = "button",
							w = 62,
							y = 340,
							visible = false,
							x = 340,
							normal = {
								path = "res/ui/kfyz/yuyue/bfslyz_btn_add.png"
							},
							touched = {
								path = "res/ui/kfyz/yuyue/bfslyz_btn_add_c.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_divide_hide",
							h = 62,
							type = "button",
							w = 62,
							y = 340,
							visible = false,
							x = 340,
							normal = {
								path = "res/ui/kfyz/yuyue/bfslyz_btn_dropout.png"
							},
							touched = {
								path = "res/ui/kfyz/yuyue/bfslyz_btn_dropout_c.png"
							}
						},
						{
							fontSize = 30,
							name = "name",
							y = 340,
							type = "label",
							x = 191.5,
							color = var_0_1
						},
						{
							fontSize = 22,
							name = "npc1",
							type = "label",
							visible = false,
							y = 290,
							x = 191.5,
							textId = 390553,
							color = var_0_1
						},
						{
							y = 0,
							name = "node_info",
							type = "node",
							x = 0,
							children = {
								{
									zoomOnTouchDown = true,
									name = "btn_reward",
									h = 60,
									type = "button",
									w = 360,
									y = 235,
									x = 191.5,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 25,
											type = "sprite9",
											x = 180,
											preferedSize = CCSizeMake(400, 70),
											middleRect = CCRectMake(0, 10, 365, 20),
											pic = {
												path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
											},
											children = {}
										},
										{
											fontSize = 22,
											y = 30,
											type = "label",
											x = 10,
											textId = 1070233,
											anchorPoint = ccp(0, 0.5),
											color = var_0_1
										},
										{
											y = 0,
											name = "node_reward2",
											x = 0,
											type = "node"
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_addWinPer",
									h = 60,
									type = "button",
									w = 360,
									y = 155,
									x = 191.5,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 25,
											type = "sprite9",
											x = 180,
											preferedSize = CCSizeMake(400, 70),
											middleRect = CCRectMake(0, 10, 365, 20),
											pic = {
												path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
											}
										},
										{
											fontSize = 22,
											name = "addWinPer",
											y = 30,
											type = "label",
											x = 10,
											anchorPoint = ccp(0, 0.5),
											color = var_0_1
										}
									}
								}
							}
						},
						{
							w = 150,
							name = "btn_noDisturb",
							h = 62,
							type = "button",
							y = 30,
							x = 283,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							}
						},
						{
							name = "btn_suggest",
							h = 62,
							type = "button",
							w = 150,
							y = 30,
							visible = false,
							x = 100,
							normal = {
								path = "res/ui/common/button/public_btn_orange.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_orange_c.png"
							},
							disable = {
								path = "res/ui/common/button/public_btn_orange_g.png"
							}
						},
						{
							name = "btn_choose",
							h = 62,
							type = "button",
							w = 150,
							y = 30,
							visible = false,
							x = 100,
							normal = {
								path = "res/ui/common/button/public_btn_orange.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_orange_c.png"
							},
							disable = {
								path = "res/ui/common/button/public_btn_orange_g.png"
							}
						},
						{
							fontSize = 25,
							style = "label_warlock",
							y = 33,
							type = "label",
							x = 283,
							textId = 390567,
							color = var_0_1
						},
						{
							fontSize = 25,
							name = "lbl_btn",
							y = 33,
							type = "label",
							style = "label_warlock",
							x = 100,
							textId = 390554,
							color = var_0_1
						},
						{
							y = 0,
							name = "node_reward",
							x = 0,
							type = "node"
						},
						{
							y = 0,
							name = "node_divide",
							x = 0,
							type = "node"
						},
						{
							fontSize = 22,
							name = "state2",
							y = 75,
							type = "label",
							x = 191.5,
							color = var_0_1
						}
					}
				}
			}
		}
	}
}
var_0_13.layout_divide = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			fontSize = 22,
			name = "name",
			y = 280,
			type = "label",
			width = 120,
			x = 0,
			height = 0,
			color = var_0_1
		},
		{
			fontSize = 22,
			name = "mine",
			y = 180,
			type = "label",
			x = 0,
			color = var_0_1
		},
		{
			y = 220,
			name = "icon",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/kfyz/wait/frd_icon_1.png"
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 58,
			type = "button",
			w = 97,
			y = 130,
			x = 0,
			normal = {
				frame = true,
				path = "btn1_gre_a.png"
			},
			touched = {
				frame = true,
				path = "btn1_gre_c.png"
			},
			children = {
				{
					fontSize = 25,
					y = 29,
					type = "label",
					x = 48,
					textId = 10002,
					color = var_0_1
				}
			}
		}
	}
}
var_0_13.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0, 1),
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
var_0_13.tipFrameNoDisturb = {
	name = "tipFrame",
	type = "sprite9Tips",
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	content = {
		{
			fontSize = 20,
			height = 0,
			type = "label",
			width = 380,
			textId = 390569,
			color = var_0_6,
			halign = kCCTextAlignmentLeft
		},
		{
			fontSize = 20,
			height = 0,
			type = "label",
			width = 380,
			textId = 390570,
			color = var_0_1,
			halign = kCCTextAlignmentLeft
		},
		{
			fontSize = 20,
			name = "disturbCd",
			height = 0,
			type = "label",
			width = 380,
			textId = 390571,
			color = var_0_3,
			halign = kCCTextAlignmentLeft
		}
	}
}
var_0_13.serverCell = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/kfyz/yuyue/yyyz_server_list_01.png"
	},
	children = {
		{
			y = 0,
			name = "light",
			type = "sprite",
			visible = false,
			x = 0,
			anchorPoint = ccp(0, 0),
			tag = var_0_10,
			pic = {
				path = "res/ui/kfyz/yuyue/yyyz_server_list_03.png"
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn_flag",
			h = 40,
			type = "button",
			w = 60,
			y = 25,
			visible = false,
			x = 15,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 20,
					name = "flag",
					type = "sprite",
					x = 30,
					pic = {
						path = "res/ui/kfyz/yuyue/yzl_flag.png"
					}
				}
			}
		},
		{
			name = "name",
			y = 25,
			type = "label",
			x = 10,
			fontSize = 30 + (var_0_0.serverLabelSize or 0),
			anchorPoint = ccp(0, 0.5),
			color = var_0_1
		},
		{
			type = "sprite",
			name = "hook",
			y = 25,
			visible = false,
			x = 310,
			tag = var_0_11,
			pic = {
				path = "res/ui/kfyz/yuyue/bfslyz_checkmark.png"
			}
		},
		{
			type = "node",
			name = "canChoose",
			y = 0,
			visible = false,
			x = 0,
			children = {
				{
					y = 25,
					name = "icon",
					scale = 0.6,
					type = "sprite",
					x = 350,
					pic = {
						path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
					}
				},
				{
					type = "sprite",
					name = "bg_name1",
					y = 25,
					visible = false,
					scale = 0.6,
					x = 395,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 26,
					name = "nation_name1",
					y = 25,
					type = "label",
					x = 395
				},
				{
					type = "sprite",
					name = "bg_name2",
					y = 25,
					visible = false,
					scale = 0.6,
					x = 440,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 26,
					name = "nation_name2",
					y = 25,
					type = "label",
					x = 440
				},
				{
					type = "sprite",
					name = "bg_name3",
					y = 25,
					visible = false,
					scale = 0.6,
					x = 485,
					pic = {
						path = "res/ui/playerInfo/role_nation_view.png"
					}
				},
				{
					fontSize = 26,
					name = "nation_name3",
					y = 25,
					type = "label",
					x = 485
				},
				{
					y = 25,
					name = "tuijian_icon",
					scale = 0.9,
					type = "sprite",
					visible = false,
					x = 240,
					pic = {
						path = "res/ui/kfyz/yuyue/yzxms_seal_tj.png"
					}
				},
				{
					y = 25,
					name = "per",
					type = "atlaslabel",
					pic = "res/ui/common/number/yzl_word_number.png",
					startCharMap = 48,
					text = "",
					visible = false,
					itemWidth = 18,
					x = 465,
					itemHeight = 24,
					anchorPoint = ccp(0.5, 0.5)
				}
			}
		},
		{
			fontSize = 20,
			name = "cannotChoose",
			type = "label",
			visible = false,
			y = 25,
			x = 250,
			textId = 390535,
			color = var_0_7
		},
		{
			fontSize = 25,
			name = "npc",
			visible = false,
			type = "label",
			textId = 390553,
			y = 25,
			x = 500,
			anchorPoint = ccp(1, 0.5),
			color = var_0_1
		}
	}
}
var_0_13.rankBg = {
	name = "bg_rank",
	type = "sprite9",
	y = 0,
	x = 0,
	preferedSize = CCSizeMake(915, 435),
	middleRect = CCRectMake(20, 80, 82, 59),
	anchorPoint = ccp(0, 0),
	pic = {
		path = "res/ui/kfyz/yuyue/yyyz_list_bg.png"
	},
	children = {
		{
			y = 405,
			name = "title",
			type = "sprite",
			x = 430,
			pic = {
				path = "res/ui/kfyz/yuyue/yyyz_word_yzphb.png"
			}
		},
		{
			type = "sprite",
			name = "no_rank",
			y = 405,
			visible = false,
			scale = 0.85,
			x = 530,
			anchorPoint = ccp(0, 0.5),
			pic = {
				path = "res/ui/rankInfo/DailyFeatView/gxb_tit_wsb.png"
			}
		},
		{
			y = 405,
			name = "num_rank",
			type = "atlaslabel",
			pic = "res/ui/common/number/yyyz_word_yzphb_digit.png",
			startCharMap = 48,
			text = "0",
			visible = false,
			itemWidth = 22,
			x = 530,
			itemHeight = 32,
			anchorPoint = ccp(0, 0.5)
		},
		{
			w = 67,
			name = "btn_show",
			h = 46,
			type = "button",
			y = 405,
			x = 860,
			normal = {
				path = "res/ui/common/button/gxb_btn.png"
			},
			touched = {
				path = "res/ui/common/button/gxb_btn_c.png"
			}
		},
		{
			y = 355,
			type = "sprite9",
			x = 458,
			preferedSize = CCSizeMake(905, 44),
			middleRect = CCRectMake(40, 12, 13, 3),
			pic = {
				path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
			},
			children = {
				{
					type = "sprite",
					y = 22,
					x = 130,
					scaleY = 0.3,
					pic = {
						path = "res/ui/general/jailView/comm_tanchu_list_laofang_1.png"
					}
				},
				{
					type = "sprite",
					y = 22,
					x = 392,
					scaleY = 0.3,
					pic = {
						path = "res/ui/general/jailView/comm_tanchu_list_laofang_1.png"
					}
				},
				{
					type = "sprite",
					y = 22,
					x = 550,
					scaleY = 0.3,
					pic = {
						path = "res/ui/general/jailView/comm_tanchu_list_laofang_1.png"
					}
				},
				{
					type = "sprite",
					y = 22,
					x = 650,
					scaleY = 0.3,
					pic = {
						path = "res/ui/general/jailView/comm_tanchu_list_laofang_1.png"
					}
				},
				{
					fontSize = 25,
					y = 22,
					type = "label",
					x = 66,
					textId = 490159,
					color = var_0_1
				},
				{
					fontSize = 25,
					y = 22,
					type = "label",
					x = 260,
					textId = 40001,
					color = var_0_1
				},
				{
					fontSize = 25,
					y = 22,
					type = "label",
					x = 470,
					textId = 490161,
					color = var_0_1
				},
				{
					fontSize = 25,
					y = 22,
					type = "label",
					x = 600,
					textId = 490169,
					color = var_0_1
				},
				{
					fontSize = 25,
					y = 22,
					type = "label",
					x = 780,
					textId = 490163,
					color = var_0_1
				}
			}
		}
	}
}
var_0_13.rankCell = {
	name = "bg",
	type = "sprite9",
	y = 0,
	x = 0,
	preferedSize = CCSizeMake(905, 44),
	middleRect = CCRectMake(40, 12, 13, 3),
	pic = {
		path = "res/ui/activity/gangMine/blgkd_number_bg2.png"
	},
	anchorPoint = ccp(0, 0),
	children = {
		{
			fontSize = 24,
			name = "rank",
			y = 22,
			type = "label",
			x = 66
		},
		{
			fontSize = 24,
			name = "name",
			y = 22,
			type = "label",
			x = 260
		},
		{
			y = 22,
			name = "icon",
			scale = 0.5,
			type = "sprite",
			x = 400,
			pic = {
				path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
			}
		},
		{
			fontSize = 24,
			name = "mine",
			y = 22,
			type = "label",
			x = 470,
			color = var_0_1
		},
		{
			fontSize = 24,
			name = "per",
			y = 22,
			type = "label",
			x = 600
		},
		{
			fontSize = 24,
			name = "info",
			y = 22,
			type = "label",
			x = 780
		}
	}
}

function var_0_13.refresh(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or 0

	local var_3_0 = 0

	if arg_3_1 > 0 then
		var_3_0 = 2
	end

	local var_3_1 = 0

	if arg_3_1 > 0 and arg_3_0.info and arg_3_0.info.isNormal ~= true then
		var_3_1 = 1
	end

	local function var_3_2(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_2, actions.kfyzQueryServerList, arg_3_1, var_3_0, var_3_1)
end

function var_0_13.createServerList(arg_5_0)
	local function var_5_0(arg_6_0, arg_6_1)
		log.info("cell touched at : ", arg_6_1:getIdx())

		local var_6_0 = arg_5_0.info.isNormal == true

		if var_6_0 then
			local var_6_1 = arg_6_0:cellAtIndex(arg_5_0.serverCellTouched)

			if var_6_1 then
				var_6_1:getChildByTag(var_0_9):getChildByTag(var_0_10):setVisible(false)
			end
		end

		local var_6_2 = arg_5_0.nationStoreList[arg_6_1:getIdx() + 1]
		local var_6_3

		var_6_3 = var_6_2.mine1 == 0 or var_6_2.mine2 == 0 or var_6_2.mine3 == 0

		if var_6_0 then
			arg_5_0.serverCellTouched = arg_6_1:getIdx()

			arg_6_1:getChildByTag(var_0_9):getChildByTag(var_0_10):setVisible(true)
			arg_5_0:updateServerInfo(var_6_2)
		else
			local function var_6_4(arg_7_0)
				local var_7_0 = arg_7_0.action.data

				if var_7_0.lockExpire and var_7_0.lockExpire > 0 then
					arg_5_0.info.lockExpire = var_7_0.lockExpire
				end

				var_6_2.locked = not var_6_2.locked

				arg_6_1:getChildByTag(var_0_9):getChildByTag(var_0_11):setVisible(var_6_2.locked == true)

				if var_6_2.locked == true then
					table.insert(arg_5_0.lockNationStoreList, var_6_2)
				else
					for iter_7_0, iter_7_1 in ipairs(arg_5_0.lockNationStoreList) do
						if var_6_2.serverName == iter_7_1.serverName and var_6_2.forceType == iter_7_1.forceType then
							table.remove(arg_5_0.lockNationStoreList, iter_7_0)

							break
						end
					end
				end

				arg_5_0:updateServerInfo()
			end

			if var_6_2.canChoose == 0 then
				if var_6_2.locked == true then
					cmgr.sendRequest(var_6_4, actions.kfyzUnLockNation, var_6_2.server, var_6_2.forceType)
				else
					local var_6_5 = var_6_0 and 0 or 1

					cmgr.sendRequest(var_6_4, actions.kfyzLockNation, var_6_2.server, var_6_2.forceType, var_6_5)
				end
			end
		end

		if var_6_2.canChoose ~= 0 then
			local function var_6_6(arg_8_0)
				arg_5_0:refresh()
			end

			local var_6_7 = 0
			local var_6_8 = var_6_2.mine1 == 0 or var_6_2.mine2 == 0 or var_6_2.mine3 == 0

			if var_6_0 then
				var_6_7 = var_6_8 and 2 or 1
			end

			cmgr.sendRequest(var_6_6, actions.kfyzRefreshAServer, var_6_7, var_6_2.index)
		end
	end

	local function var_5_1(arg_9_0, arg_9_1)
		return 49, 510
	end

	local function var_5_2(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_0:dequeueCell()

		if var_10_0 then
			var_10_0:removeAllChildrenWithCleanup(true)
		else
			var_10_0 = CCTableViewCell:new()
		end

		local var_10_1 = arg_5_0.info.isNormal == true
		local var_10_2 = arg_5_0.nationStoreList[arg_10_1 + 1]

		if var_10_2 then
			local var_10_3 = {}

			uiutil.initWidgets(var_10_3, arg_5_0.serverCell)
			var_10_0:addChild(var_10_3.widgets.bg, 0, var_0_9)

			local var_10_4 = var_10_2.canChoose == 0
			local var_10_5 = var_10_4 and var_0_1 or var_0_7

			var_10_3.widgets.name:setString(tool.getServerName(var_10_2.serverName))
			var_10_3.widgets.name:setColor(var_10_5)
			var_10_3.widgets.canChoose:setVisible(true)
			var_10_3.widgets.cannotChoose:setVisible(not var_10_4)
			var_10_3.widgets.tuijian_icon:setVisible(var_10_2.recommand)
			var_10_3.widgets.hook:setVisible(not var_10_1 and var_10_2.locked == true)

			local var_10_6 = {}

			if var_10_2.mine1 == 0 or var_10_2.mine2 == 0 or var_10_2.mine3 == 0 then
				local var_10_7 = user.getMineIdx(math.max(var_10_2.mine1, var_10_2.mine2, var_10_2.mine3))

				if var_10_7 then
					var_10_3.widgets.name:setColor(mineColor[var_10_7])
				end

				var_10_3.widgets.icon:setVisible(false)
				var_10_3.widgets.bg_name1:setVisible(true)

				local var_10_8 = var_10_2.forceType

				if var_10_8 ~= 0 then
					var_10_3.widgets.nation_name1:setString(var_10_2["nationName" .. var_10_8])
					var_10_3.widgets.nation_name1:setColor(colorForce[var_10_8])

					local var_10_9 = rmgr.setTallyPic(var_10_2["tally" .. var_10_8], var_10_3.widgets.icon)

					var_10_3.widgets.icon:setVisible(var_10_9)
					var_10_3.widgets.btn_flag:setVisible(true)

					local var_10_10 = language.get(136815, tool.getServerName(var_10_2.serverName), var_10_2["nationName" .. var_10_8]) .. language.get(var_10_2["isWin" .. var_10_8] and 136816 or 136817)
					local var_10_11 = var_10_2["isWin" .. var_10_8] and colorForce[var_10_8] or var_0_7

					table.insert(var_10_6, {
						height = 0,
						type = "label",
						fontSize = 20,
						width = 0,
						style = "label_warlock",
						text = var_10_10,
						halign = kCCTextAlignmentLeft,
						color = var_10_11
					})

					if var_10_2["isWin" .. var_10_8] ~= true then
						tool.spriteToGray(var_10_3.widgets.flag)
					end

					local var_10_12 = tonumber(var_10_2["winNationPercentage" .. var_10_8])

					if var_10_12 then
						local var_10_13 = string.format("%s%%", math.floor(var_10_12 * 1000) / 10)
						local var_10_14 = string.gsub(var_10_13, "%.", ":")
						local var_10_15 = string.gsub(var_10_14, "%%", ";")

						var_10_3.widgets.per:setString(var_10_15)
						var_10_3.widgets.per:setVisible(true)
					end
				else
					var_10_3.widgets.btn_flag:setVisible(false)
					var_10_3.widgets.icon:setVisible(false)

					local var_10_16 = ""

					if var_10_2.server == "jps1" or var_10_2.server == "jps2" or var_10_2.server == "jps3" or var_10_2.server == "jps4" then
						var_10_16 = language.get("222416_dongying")
					elseif var_10_2.server == "jps5" or var_10_2.server == "jps6" or var_10_2.server == "jps7" then
						var_10_16 = language.get(136566)
					elseif var_10_2.server == "jps8" or var_10_2.server == "jps9" or var_10_2.server == "jps10" then
						var_10_16 = language.get(136819)
					elseif var_10_2.server == "jps11" or var_10_2.server == "jps12" or var_10_2.server == "jps13" then
						var_10_16 = language.get(136847)
					elseif var_10_2.server == "jps14" or var_10_2.server == "jps15" or var_10_2.server == "jps16" then
						var_10_16 = language.get(218106)
					end

					var_10_3.widgets.nation_name1:setString(var_10_16)
					var_10_3.widgets.nation_name1:setColor(var_0_1)
				end
			else
				var_10_3.widgets.icon:setVisible(true)

				local var_10_17 = var_10_2.isNpc == true

				var_10_3.widgets.npc:setVisible(var_10_17)

				if var_10_17 then
					var_10_3.widgets.name:setString(language.get(390552))
					var_10_3.widgets.name:setColor(var_0_2)
					var_10_3.widgets.canChoose:setVisible(false)
				else
					for iter_10_0 = 1, 3 do
						var_10_3.widgets["bg_name" .. iter_10_0]:setVisible(true)
						var_10_3.widgets["nation_name" .. iter_10_0]:setString(var_10_2["nationName" .. iter_10_0])
						var_10_3.widgets["nation_name" .. iter_10_0]:setColor(colorForce[iter_10_0])

						local var_10_18 = language.get(136815, tool.getServerName(var_10_2.serverName), var_10_2["nationName" .. iter_10_0]) .. language.get(var_10_2["isWin" .. iter_10_0] and 136816 or 136817)
						local var_10_19 = var_10_2["isWin" .. iter_10_0] and colorForce[iter_10_0] or var_0_7

						table.insert(var_10_6, {
							height = 0,
							type = "label",
							fontSize = 20,
							width = 0,
							style = "label_warlock",
							text = var_10_18,
							halign = kCCTextAlignmentLeft,
							color = var_10_19
						})
					end

					rmgr.setTallyPic(var_10_2.tally, var_10_3.widgets.icon)
					var_10_3.widgets.btn_flag:setVisible(true)

					if not var_10_2.isWin1 or not var_10_2.isWin2 or not var_10_2.isWin3 then
						tool.spriteToGray(var_10_3.widgets.flag)
					end
				end
			end

			var_10_3.widgets.btn_flag:addHandleOfControlEvent(function()
				log.info("btn_flag")
				arg_5_0:showTipWinFlag(var_10_6, var_10_3.widgets.btn_flag)
			end, CCControlEventTouchUpInside)

			if not var_10_4 then
				var_10_3.widgets.bg:setDisplayFrame(CCSprite:create("res/ui/kfyz/yuyue/yyyz_server_list_02.png"):displayFrame())
				tool.spriteToGray(var_10_3.widgets.light)
			end

			local var_10_20 = arg_5_0.serverCellTouched == arg_10_1

			var_10_3.widgets.light:setVisible(var_10_1 and var_10_20)

			if var_10_20 then
				arg_5_0:updateServerInfo(var_10_2)
			end
		end

		return var_10_0
	end

	local function var_5_3()
		local var_12_0 = arg_5_0.nationStoreList

		if var_12_0 and #var_12_0 > 0 then
			return #var_12_0
		else
			return 0
		end
	end

	local var_5_4 = CCTableView:create(CCSizeMake(510, 302))

	var_5_4:setPosition(7, 6)
	var_5_4:setDirection(kCCScrollViewDirectionVertical)
	var_5_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_5_0.view.widgets.bg_server:addChild(var_5_4)

	if arg_5_0.serverList then
		arg_5_0.serverList:removeFromParentAndCleanup(true)
	end

	arg_5_0.serverList = var_5_4

	var_5_4:registerScriptHandler(var_5_0, CCTableView.kTableCellTouched)
	var_5_4:registerScriptHandler(var_5_1, CCTableView.kTableCellSizeForIndex)
	var_5_4:registerScriptHandler(var_5_2, CCTableView.kTableCellSizeAtIndex)
	var_5_4:registerScriptHandler(var_5_3, CCTableView.kNumberOfCellsInTableView)
	var_5_4:reloadData()
end

function var_0_13.createRankList(arg_13_0)
	local function var_13_0(arg_14_0, arg_14_1)
		log.info("cell touched at : ", arg_14_1:getIdx())
	end

	local function var_13_1(arg_15_0, arg_15_1)
		return 42, 909
	end

	local function var_13_2(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_0:dequeueCell()

		if var_16_0 then
			var_16_0:removeAllChildrenWithCleanup(true)
		else
			var_16_0 = CCTableViewCell:new()
		end

		local var_16_1 = arg_13_0.info.ranks[arg_16_1 + 1]

		if var_16_1 then
			local var_16_2 = {}

			uiutil.initWidgets(var_16_2, arg_13_0.rankCell)
			var_16_2.widgets.bg:setPosition(ccp(0, -2))
			var_16_0:addChild(var_16_2.widgets.bg)

			if var_16_1.rank == 1 then
				local var_16_3 = CCSprite:create("res/ui/kfyz/yuyue/kfyz_word_bs.png")

				var_16_3:setPosition(ccp(76, 22))
				var_16_2.widgets.bg:addChild(var_16_3)
			else
				var_16_2.widgets.rank:setString(string.format("%s.", var_16_1.rank))
			end

			var_16_2.widgets.name:setString(tool.getServerName(var_16_1.serverName) .. "·" .. language.get(460037, var_16_1.nationName))
			var_16_2.widgets.mine:setString(var_16_1.mine)

			local var_16_4 = user.getMineIdx(var_16_1.mine)

			if var_16_4 then
				var_16_2.widgets.mine:setColor(mineColor[var_16_4])
				var_16_2.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/kfyz/wait/frd_icon_%s.png", var_16_4)):displayFrame())
			end

			if rmgr.setTallyPic(var_16_1.tally, var_16_2.widgets.icon) then
				var_16_2.widgets.icon:setScale(0.5)
			else
				var_16_2.widgets.icon:setScale(0.9)
			end

			if type(var_16_1.winLostInfo) ~= "table" then
				var_16_1.winLostInfo = {
					0,
					0,
					0
				}
			end

			local var_16_5 = tonumber(var_16_1.winNationPercentage)

			if var_16_5 then
				var_16_2.widgets.per:setString(string.format("%s%%", math.floor(var_16_5 * 1000) / 10))
			end

			var_16_2.widgets.info:setString(language.get(490162, var_16_1.winLostInfo[2], var_16_1.winLostInfo[3], var_16_1.winLostInfo[1]))
		end

		return var_16_0
	end

	local function var_13_3()
		local var_17_0 = arg_13_0.info.ranks

		if var_17_0 and #var_17_0 > 0 then
			return #var_17_0
		else
			return 0
		end
	end

	local var_13_4 = CCTableView:create(CCSizeMake(905, 325))

	var_13_4:setPosition(5, 5)
	var_13_4:setDirection(kCCScrollViewDirectionVertical)
	var_13_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_13_0.view.widgets.bg_rank:addChild(var_13_4)

	if arg_13_0.rankList then
		arg_13_0.rankList:removeFromParentAndCleanup(true)
	end

	arg_13_0.rankList = var_13_4

	var_13_4:registerScriptHandler(var_13_0, CCTableView.kTableCellTouched)
	var_13_4:registerScriptHandler(var_13_1, CCTableView.kTableCellSizeForIndex)
	var_13_4:registerScriptHandler(var_13_2, CCTableView.kTableCellSizeAtIndex)
	var_13_4:registerScriptHandler(var_13_3, CCTableView.kNumberOfCellsInTableView)
	var_13_4:reloadData()
end

function var_0_13.updateServerInfo(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.info.isNormal == true

	if var_18_0 and not arg_18_1 then
		return
	end

	arg_18_0.view.widgets.name:setColor(var_0_1)
	arg_18_0.view.widgets.npc1:setVisible(false)
	arg_18_0.view.widgets.btn_divide_show:setVisible(false)
	arg_18_0.view.widgets.btn_divide_hide:setVisible(false)
	arg_18_0.view.widgets.bg_divide:setVisible(false)
	arg_18_0.view.widgets.node_divide:removeAllChildrenWithCleanup(true)
	arg_18_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)
	arg_18_0.view.widgets.node_reward2:removeAllChildrenWithCleanup(true)

	local var_18_1

	if var_18_0 then
		local var_18_2 = arg_18_1.mine1 == 0 or arg_18_1.mine2 == 0 or arg_18_1.mine3 == 0
		local var_18_3 = arg_18_1.isNpc == true
		local var_18_4 = string.find(arg_18_1.server, "jps") ~= nil

		arg_18_0.view.widgets.node_info:setVisible(not var_18_4)

		if var_18_2 then
			if var_18_4 then
				var_18_1 = tool.getServerName(arg_18_1.serverName)

				local var_18_5 = CCSprite:create("res/ui/task/get_rewa_icon.jpg")

				var_18_5:setPosition(191.5, 230)
				arg_18_0.view.widgets.node_reward:addChild(var_18_5)

				if arg_18_1.isMete then
					local var_18_6 = CCSprite:create("res/ui/activity/feteHero/dyqx_icon_216.png")

					var_18_6:setPosition(35, 35)
					var_18_5:addChild(var_18_6)
				else
					local var_18_7 = {
						ccp(33, 40),
						ccp(46, 27),
						ccp(24, 23)
					}

					for iter_18_0 = 1, 3 do
						local var_18_8 = CCSprite:create("res/ui/weapon/godWeapon/sbxt_icon_blg.png")

						var_18_8:setPosition(var_18_7[iter_18_0])
						var_18_5:addChild(var_18_8)
					end
				end

				local var_18_9 = CCLabelTTF:create(arg_18_1.maxReward, "Thonburi", 25)

				var_18_9:setColor(var_0_5)
				var_18_9:setPosition(35, -10)
				var_18_5:addChild(var_18_9)

				local var_18_10
				local var_18_11 = user.jpsStages

				if user.forceExp == var_18_11[#var_18_11] then
					if user.kbLv == 2 then
						var_18_10 = "222412_dongying"
					elseif user.kbLv == 3 then
						var_18_10 = 136567
					elseif user.kbLv == 4 then
						var_18_10 = 136809
					end
				else
					var_18_10 = (user.forceExp == var_18_11[1] or user.forceExp == var_18_11[2]) and "222401_dongying" or 136547
				end

				if arg_18_1.server == "jps4" then
					var_18_10 = nil
				end

				if var_18_10 then
					local var_18_12 = CCLabelTTF:create(language.get(var_18_10), "Thonburi", 22)

					var_18_12:setColor(var_0_1)
					var_18_12:setPosition(191.5, 290)
					arg_18_0.view.widgets.node_reward:addChild(var_18_12)
				end
			else
				var_18_1 = language.get(215200)
			end
		elseif var_18_3 then
			var_18_1 = language.get(390552)

			arg_18_0.view.widgets.name:setColor(var_0_2)
			arg_18_0.view.widgets.npc1:setVisible(true)
		else
			var_18_1 = language.get(215202)
		end

		arg_18_0.view.widgets.btn_divide_show:setVisible(var_18_2 and not var_18_4)

		if not var_18_4 then
			local var_18_13 = math.floor(arg_18_1.addWinPer * 1000) / 10

			arg_18_0.view.widgets.addWinPer:setString(language.get(1070234, var_18_13))

			arg_18_1.extraSlaves = arg_18_1.extraSlaves or {}

			arg_18_0.view.widgets.btn_addWinPer:setEnabled(#arg_18_1.extraSlaves > 0)
			arg_18_0.view.widgets.btn_reward:setEnabled(not var_18_3)

			local var_18_14
			local var_18_15 = arg_18_1.isBlueprint and "zctz" or arg_18_1.isGem and "gem" or "iron"
			local var_18_16 = CCSprite:create(string.format("res/ui/task/get_icon_%s.png", var_18_15))

			var_18_16:setPosition(160, 30)
			var_18_16:setScale(0.8)
			arg_18_0.view.widgets.node_reward2:addChild(var_18_16)

			local var_18_17 = CCLabelTTF:create(tool.getFormatNum(arg_18_1.maxReward), "Thonburi", 25)

			var_18_17:setAnchorPoint(ccp(0, 0.5))
			var_18_17:setPosition(180, 30)
			var_18_17:setColor(tool.hexToRgb("#B1E1FF"))
			arg_18_0.view.widgets.node_reward2:addChild(var_18_17)

			if var_18_3 then
				local var_18_18 = CCSprite:create("res/ui/task/get_icon_gongxun.png")

				var_18_18:setPosition(280, 30)
				var_18_18:setScale(0.8)
				arg_18_0.view.widgets.node_reward2:addChild(var_18_18)

				local var_18_19 = CCLabelTTF:create(arg_18_1.feat, "Thonburi", 25)

				var_18_19:setColor(var_0_8)
				var_18_19:setAnchorPoint(ccp(0, 0.5))
				var_18_19:setPosition(300, 30)
				var_18_19:setColor(tool.hexToRgb("#B1E1FF"))
				arg_18_0.view.widgets.node_reward2:addChild(var_18_19)
			else
				local var_18_20 = CCSprite:create("res/ui/task/get_icon_gxczlsp.png")

				var_18_20:setPosition(280, 30)
				var_18_20:setScale(0.8)
				arg_18_0.view.widgets.node_reward2:addChild(var_18_20)

				local var_18_21 = CCLabelTTF:create(arg_18_1.maxPiece, "Thonburi", 25)

				var_18_21:setAnchorPoint(ccp(0, 0.5))
				var_18_21:setPosition(300, 30)
				var_18_21:setColor(tool.hexToRgb("#B1E1FF"))
				arg_18_0.view.widgets.node_reward2:addChild(var_18_21)
			end
		end
	else
		var_18_1 = language.get(215201)

		arg_18_0.view.widgets.bg_divide:setVisible(true)
		arg_18_0.view.widgets.node_info:setVisible(false)

		for iter_18_1, iter_18_2 in ipairs(arg_18_0.lockNationStoreList) do
			local var_18_22 = {}

			uiutil.initWidgets(var_18_22, arg_18_0.layout_divide)
			var_18_22.widgets.node:setPosition(68 + 124 * (iter_18_1 - 1), 0)
			arg_18_0.view.widgets.node_divide:addChild(var_18_22.widgets.node)

			local var_18_23 = iter_18_2.forceType

			var_18_22.widgets.name:setString(string.format("%s %s", tool.getServerName(iter_18_2.serverName), iter_18_2["nationName" .. var_18_23]))
			var_18_22.widgets.mine:setString(iter_18_2["mine" .. var_18_23])

			local var_18_24 = user.getMineIdx(iter_18_2["mine" .. var_18_23])

			if var_18_24 then
				var_18_22.widgets.name:setColor(mineColor[var_18_24])
				var_18_22.widgets.mine:setColor(mineColor[var_18_24])
				var_18_22.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/kfyz/wait/frd_icon_%s.png", var_18_24)):displayFrame())
			end

			if rmgr.setTallyPic(iter_18_2["tally" .. var_18_23], var_18_22.widgets.icon) then
				var_18_22.widgets.icon:setScale(0.5)
			else
				var_18_22.widgets.icon:setScale(1)
			end

			var_18_22.widgets.btn:addHandleOfControlEvent(function()
				log.info("btn", string.format("%s %s", tool.getServerName(iter_18_2.serverName), iter_18_2["nationName" .. var_18_23]))

				local function var_19_0(arg_20_0)
					local var_20_0 = arg_20_0.action.data

					if var_20_0.lockExpire and var_20_0.lockExpire > 0 then
						arg_18_0.info.lockExpire = var_20_0.lockExpire
					end

					for iter_20_0, iter_20_1 in ipairs(arg_18_0.nationStoreList) do
						if iter_18_2.serverName == iter_20_1.serverName and iter_18_2.forceType == iter_20_1.forceType then
							iter_20_1.locked = false
						end
					end

					arg_18_0:createServerList()
					table.remove(arg_18_0.lockNationStoreList, iter_18_1)
					arg_18_0:updateServerInfo()
				end

				cmgr.sendRequest(var_19_0, actions.kfyzUnLockNation, iter_18_2.server, iter_18_2.forceType)
			end, CCControlEventTouchUpInside)
		end

		arg_18_0.view.widgets.btn_divide_hide:setVisible(true)
	end

	arg_18_0.view.widgets.name:setString(var_18_1)

	if arg_18_0.info.pin == 0 then
		if var_18_0 then
			arg_18_0.view.widgets.btn_choose:setEnabled(arg_18_1.canChoose == 0)
		else
			arg_18_0.view.widgets.btn_choose:setEnabled(true)
		end
	end
end

function var_0_13.showTip(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_21_0:registerScriptTouchHandler(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == CCTOUCHBEGAN then
			return true
		elseif arg_22_0 == CCTOUCHMOVED then
			return true
		elseif arg_22_0 == CCTOUCHENDED then
			pcall(var_21_0.removeFromParentAndCleanup, var_21_0, true)

			return true
		end
	end, false, true)
	var_21_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_21_0, 60000)

	local var_21_1 = 0
	local var_21_2 = 0
	local var_21_3 = {}

	uiutil.initWidgets(var_21_3, arg_21_0.tipFrame)
	var_21_0:addChild(var_21_3.widgets.tipFrame)
	var_21_3.widgets.tipMsg:setDimensions(CCSizeMake(0, 0))

	local var_21_4, var_21_5 = tool.getPositionInScreen(arg_21_2)
	local var_21_6 = var_21_4 - 20
	local var_21_7 = var_21_5 - 20

	if arg_21_2 == arg_21_0.view.widgets.btn_reward or arg_21_2 == arg_21_0.view.widgets.btn_addWinPer then
		var_21_6 = var_21_4 - 160
	end

	local var_21_8 = arg_21_1 or ""

	var_21_3.widgets.tipMsg:setString(var_21_8)

	local var_21_9 = var_21_3.widgets.tipMsg:getContentSize().width
	local var_21_10 = var_21_3.widgets.tipMsg:getContentSize().height

	var_21_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_21_9 + 30, var_21_10 + 30))
	var_21_3.widgets.tipFrame:setPosition(ccp(var_21_6, var_21_7))
	var_21_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_21_3.widgets.tipFrame:setVisible(true)
end

function var_0_13.showTipNoDisturb(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_2 then
		arg_23_2:stopAllActions()
	end

	if arg_23_0.view.widgets.tipFrame then
		arg_23_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_23_0.view.widgets.tipFrame = nil
	end

	if arg_23_1 then
		local function var_23_0(arg_24_0)
			local var_24_0
			local var_24_1 = math.floor(arg_24_0 / 86400000)

			if var_24_1 > 0 then
				var_24_0 = string.format("(%s%s)", language.get(135260, string.format("%02d", var_24_1)), tool.formatTime(arg_24_0 - var_24_1 * 86400000, "@H:@M:@S"))
			else
				var_24_0 = string.format("(%s)", tool.getFormatTime(arg_24_0))
			end

			return language.get(390571) .. var_24_0
		end

		local var_23_1, var_23_2 = tool.getPositionInScreen(arg_23_2)
		local var_23_3
		local var_23_4
		local var_23_5 = var_23_1 + 0
		local var_23_6 = var_23_2 + 20

		uiutil.initWidgets(arg_23_0.view, arg_23_0.tipFrameNoDisturb)
		arg_23_0:addChild(arg_23_0.view.widgets.tipFrame)
		arg_23_0.view.widgets.tipFrame:setPosition(ccp(var_23_5, var_23_6))

		if arg_23_0.info.disturbCd > 0 then
			local var_23_7 = 0.5
			local var_23_8 = CCArray:create()

			var_23_8:addObject(CCCallFunc:create(function()
				if arg_23_0.info.disturbCd <= 0 then
					arg_23_0.view.widgets.disturbCd:stopAllActions()
				else
					arg_23_0.view.widgets.disturbCd:setString(var_23_0(arg_23_0.info.disturbCd))
				end
			end))
			var_23_8:addObject(CCDelayTime:create(var_23_7))

			local var_23_9 = CCSequence:create(var_23_8)

			arg_23_0.view.widgets.disturbCd:runAction(CCRepeatForever:create(var_23_9))
		end
	end
end

function var_0_13.showTipWinFlag(arg_26_0, arg_26_1, arg_26_2)
	log.info("should show tips ")

	local var_26_0 = {
		name = "tipFrame",
		frameGapHorizontal = 20,
		type = "sprite9Tips",
		frameGapVertical = 15,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0, 0),
		middleRect = CCRectMake(24, 24, 1, 1),
		content = arg_26_1
	}
	local var_26_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_26_1:registerScriptTouchHandler(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == CCTOUCHBEGAN then
			return true
		elseif arg_27_0 == CCTOUCHMOVED then
			return true
		elseif arg_27_0 == CCTOUCHENDED then
			pcall(var_26_1.removeFromParentAndCleanup, var_26_1, true)

			return true
		end
	end, false, true)
	var_26_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_26_1, 60000)

	local var_26_2 = 0
	local var_26_3 = 0
	local var_26_4 = {}

	uiutil.initWidgets(var_26_4, var_26_0)
	var_26_1:addChild(var_26_4.widgets.tipFrame)

	local var_26_5, var_26_6 = tool.getPositionInScreen(arg_26_2)
	local var_26_7 = var_26_5 - 20
	local var_26_8 = var_26_6 + 20 - 10

	var_26_4.widgets.tipFrame:setPosition(ccp(var_26_7, var_26_8))
end

function var_0_13.setNoServerTips(arg_28_0)
	arg_28_0.view.widgets.txt_p1:setVisible(false)
	arg_28_0.view.widgets.txt_p2:setVisible(false)
	arg_28_0.view.widgets.txt_p3:setVisible(false)

	local var_28_0 = 454
	local var_28_1 = arg_28_0.info or {}

	var_28_1.tips = var_28_1.tips or 1

	local var_28_2 = {
		"yyyz_word_03.png",
		"yyyz_word_04.png",
		"yyyz_word_05.png"
	}

	arg_28_0.view.widgets.txt_p2:setDisplayFrame(CCSprite:create("res/ui/kfyz/yuyue/" .. var_28_2[var_28_1.tips]):displayFrame())

	local var_28_3 = arg_28_0.view.widgets.txt_p1:getContentSize().width
	local var_28_4 = arg_28_0.view.widgets.txt_p2:getContentSize().width
	local var_28_5 = arg_28_0.view.widgets.txt_p3:getContentSize().width
	local var_28_6 = var_28_3 + var_28_4 + var_28_5

	arg_28_0.view.widgets.txt_p1:setPositionX(var_28_0 - var_28_6 / 2)
	arg_28_0.view.widgets.txt_p2:setPositionX(var_28_0 - var_28_6 / 2 + var_28_3)
	arg_28_0.view.widgets.txt_p3:setPositionX(var_28_0 - var_28_6 / 2 + var_28_3 + var_28_4)
	arg_28_0.view.widgets.txt_p1:setVisible(true)
	arg_28_0.view.widgets.txt_p2:setVisible(true)
	arg_28_0.view.widgets.txt_p3:setVisible(true)
end

function var_0_13.updateServerList(arg_29_0)
	local var_29_0 = #arg_29_0.nationStoreList > 0

	arg_29_0.view.widgets.bg_server:setVisible(var_29_0)
	arg_29_0.view.widgets.bg_server_info:setVisible(var_29_0)
	arg_29_0.view.widgets.bg_no_server:setVisible(not var_29_0)

	if var_29_0 then
		if arg_29_0.info.isNormal ~= true then
			arg_29_0.serverCellTouched = 0
		end

		arg_29_0:createServerList()
	else
		arg_29_0:setNoServerTips()
	end

	if arg_29_0.info.pin == 0 then
		if arg_29_0.info.isNormal then
			local var_29_1 = arg_29_0.currentType == 1 and #arg_29_0.info.nationList == 0 or arg_29_0.currentType == 2 and #arg_29_0.info.lists == 0

			arg_29_0.view.widgets.btn_choose:setEnabled(not var_29_1)
		else
			arg_29_0.view.widgets.btn_choose:setEnabled(true)
		end
	end
end

function var_0_13.showPanel(arg_30_0, arg_30_1)
	arg_30_0.info = arg_30_1

	arg_30_0:createRankList()

	local var_30_0 = arg_30_0.info.selfRank > 0

	arg_30_0.view.widgets.num_rank:setVisible(var_30_0)
	arg_30_0.view.widgets.no_rank:setVisible(not var_30_0)

	if var_30_0 then
		arg_30_0.view.widgets.num_rank:setString(arg_30_0.info.selfRank)
	end

	arg_30_0.view.widgets.btn_show:setVisible(arg_30_0.info.canApply)
	arg_30_0.scrollLayer:setPosition(ccp(0, arg_30_0.info.canApply and -377 or 0))
	arg_30_0.view.widgets.bg_state3:setVisible(false)
	arg_30_0.view.widgets.btn_yzToken:setVisible(false)
	arg_30_0.view.widgets.btn_yzEquip:setVisible(false)
	arg_30_0.view.widgets.node_refresh:setVisible(false)

	if arg_30_0.info.canApply then
		arg_30_0.nationStoreList = {}
		arg_30_0.lockNationStoreList = {}

		if arg_30_1.isServerListOpen and arg_30_1.isNormal and arg_30_1.lists then
			for iter_30_0, iter_30_1 in ipairs(arg_30_1.lists) do
				var_0_12(iter_30_1)
				table.insert(arg_30_0.nationStoreList, iter_30_1)
			end
		end

		if arg_30_1.nationList then
			for iter_30_2, iter_30_3 in ipairs(arg_30_1.nationList) do
				var_0_12(iter_30_3)
				table.insert(arg_30_0.nationStoreList, iter_30_3)
			end
		end

		if arg_30_1.lockNations then
			for iter_30_4, iter_30_5 in ipairs(arg_30_1.lockNations) do
				var_0_12(iter_30_5)
				table.insert(arg_30_0.lockNationStoreList, iter_30_5)
			end
		end

		arg_30_0:updateServerList()

		local var_30_1 = arg_30_0.info.pin == 0

		arg_30_0.view.widgets.lbl_btn:setString(language.get(var_30_1 and 390559 or 390554))
		arg_30_0.view.widgets.btn_choose:setVisible(var_30_1)
		arg_30_0.view.widgets.btn_suggest:setVisible(not var_30_1)

		arg_30_0.canUseNoDisturb = (user.kbLv == 0 or user.kbLv == 1) and user.maxForceExp == user.forceExp

		arg_30_0.view.widgets.btn_noDisturb:setColor(arg_30_0.canUseNoDisturb and colorQuality[1] or colorQuality[0])
		arg_30_0.view.widgets.state1:stopAllActions()
		arg_30_0.view.widgets.node_refresh:setVisible(var_30_1)

		if var_30_1 then
			arg_30_0.view.widgets.gold:setString(arg_30_0.info.refreshGold)
		end

		arg_30_0.view.widgets.state1:setString(language.get(390534))
		arg_30_0.view.widgets.state2:setString(language.get(var_30_1 and 390486 or 390523))
		arg_30_0.view.widgets.state2:setColor(tool.hexToRgb("#C6C600"))

		if arg_30_0.info.cd and arg_30_0.info.cd > 0 then
			local var_30_2 = arg_30_0.info.attType == 1
			local var_30_3 = arg_30_0.info.attType == 2

			if var_30_2 then
				arg_30_0.view.widgets.state1:setString(language.get(390549, tool.getFormatTime(arg_30_0.info.cd)))
				arg_30_0.view.widgets.state2:setString(language.get(390520, tool.getFormatTime(arg_30_0.info.cd)))
				arg_30_0.view.widgets.state2:setColor(var_0_1)
			end

			arg_30_0.view.widgets.bg_state3:setVisible(var_30_3)
			arg_30_0.view.widgets.state3:setString(tool.getFormatTime(arg_30_0.info.cd))

			local var_30_4 = CCArray:create()

			var_30_4:addObject(CCDelayTime:create(1))
			var_30_4:addObject(CCCallFuncN:create(function()
				arg_30_0.info.cd = arg_30_0.info.cd - 1000

				if arg_30_0.info.cd <= 0 then
					arg_30_0:refresh()
				else
					if var_30_2 then
						arg_30_0.view.widgets.state1:setString(language.get(390549, tool.getFormatTime(arg_30_0.info.cd)))
						arg_30_0.view.widgets.state2:setString(language.get(390520, tool.getFormatTime(arg_30_0.info.cd)))
					end

					arg_30_0.view.widgets.state3:setString(tool.getFormatTime(arg_30_0.info.cd))
				end
			end))

			local var_30_5 = CCSequence:create(var_30_4)

			arg_30_0.view.widgets.state1:runAction(CCRepeatForever:create(var_30_5))
		end

		local var_30_6 = tonumber(arg_30_1.currentPer)

		if var_30_6 then
			local var_30_7 = string.format("%s%%", math.floor(var_30_6 * 1000) / 10)

			arg_30_0.view.widgets.selfPer:setString(var_30_7)
		end

		local var_30_8 = arg_30_1.currentPer

		if var_30_8 < 0 then
			var_30_8 = 0
		end

		local var_30_9 = arg_30_1.maxPer
		local var_30_10
		local var_30_11 = var_30_8 == 0 and 0.5 or 100 * var_30_8 / var_30_9

		arg_30_0.view.widgets.bar:setPercentage(var_30_11)
		arg_30_0.view.widgets.icon_medal:setDisplayFrame(tool.spriteFrameByName(string.format("%s.jpg", arg_30_1.medal.pic)))
	else
		arg_30_0.view.widgets.state1:setString(language.get(390521))
	end

	if not arg_30_0.view.widgets.bg_state3:isVisible() then
		arg_30_0.view.widgets.btn_yzToken:setVisible(true)
		arg_30_0.view.widgets.btn_yzEquip:setVisible(true)
		arg_30_0.view.widgets.yzToken:setString(language.get(490026, arg_30_1.yzToken))
		arg_30_0.view.widgets.yzEquip:setString(language.get(490026, arg_30_1.loseTime))
	end

	if arg_30_1.lockExpire and arg_30_1.lockExpire < 0 then
		arg_30_1.lockExpire = nil
	end
end

function var_0_13.ctor(arg_32_0, arg_32_1, arg_32_2)
	rmgr.loadResource("res/ui/tavern/tavern.plist")

	arg_32_0.view = {}

	uiutil.initWidgets(arg_32_0.view, arg_32_0.layout)
	swallowTouch(arg_32_0)
	arg_32_0:addChild(arg_32_0.view.widgets.panel)

	if arg_32_1 then
		arg_32_1:addChild(arg_32_0)
	end

	arg_32_0.serverCellTouched = 0

	local var_32_0 = CCLayerColor:create(ccc4(0, 0, 0, 0), 915, 435)
	local var_32_1 = CCScrollView:create(CCSizeMake(915, 435), var_32_0)

	var_32_1:setPosition(ccp(0, 0))
	var_32_1:setTouchEnabled(false)
	arg_32_0.view.widgets.bg:addChild(var_32_1)
	swallowTouch(var_32_0)
	uiutil.initWidgets(arg_32_0.view, arg_32_0.rankBg)
	var_32_0:addChild(arg_32_0.view.widgets.bg_rank, 100)
	var_32_0:setPosition(ccp(0, -377))

	arg_32_0.scrollLayer = var_32_0

	arg_32_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		local var_33_0 = arg_32_0.view.widgets.btn_show:getScale()

		if var_33_0 > 0 and arg_32_0.rankList then
			arg_32_0.rankList:setContentOffset(ccp(0, arg_32_0.rankList:minContainerOffset().y))
			arg_32_0.rankList:setVisible(true)
		end

		local var_33_1 = CCArray:create()

		var_33_1:addObject(CCMoveTo:create(0.5, ccp(0, var_33_0 > 0 and 0 or -377)))
		var_33_1:addObject(CCCallFuncN:create(function()
			arg_32_0.view.widgets.btn_show:setScale(-1 * var_33_0)
			arg_32_0.view.widgets.btn_show:setEnabled(true)

			if arg_32_0.rankList then
				arg_32_0.rankList:setVisible(var_33_0 > 0)
			end
		end))

		local var_33_2 = CCSequence:create(var_33_1)

		var_32_0:runAction(var_33_2)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_close:setScale(2)
	arg_32_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_32_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	local var_32_2 = arg_32_0.view.widgets.btn_noDisturb

	var_32_2:addHandleOfControlEvent(function()
		log.info("btn: TouchDown")

		if arg_32_0.canUseNoDisturb then
			schedule(var_32_2, function()
				arg_32_0:showTipNoDisturb(true, var_32_2)
			end, 0.1)
		else
			arg_32_0:showTipNoDisturb(true, var_32_2)
		end
	end, CCControlEventTouchDown)
	var_32_2:addHandleOfControlEvent(function()
		log.info("btn: TouchUpInside")
		arg_32_0:showTipNoDisturb(false, var_32_2)

		if arg_32_0.canUseNoDisturb then
			local function var_38_0(arg_39_0)
				smgr.showTipTextGreen(language.get(102059))
			end

			cmgr.sendRequest(var_38_0, actions.kfyzNoDisturb)
		end
	end, CCControlEventTouchUpInside)
	var_32_2:addHandleOfControlEvent(function()
		log.info("btn: TouchUpOutside")
		arg_32_0:showTipNoDisturb(false, var_32_2)
	end, CCControlEventTouchUpOutside)
	arg_32_0.view.widgets.btn_suggest:addHandleOfControlEvent(function()
		log.info("btn_suggest")

		local function var_41_0(arg_42_0)
			arg_32_0.view.widgets.btn_suggest:setEnabled(false)
			smgr.showTipTextGreen(language.get(390536))
		end

		local var_41_1 = "COUNTRY"
		local var_41_2 = language.get(390533)
		local var_41_3 = ""

		cmgr.sendRequest(var_41_0, actions.sendChat, var_41_1, var_41_2, var_41_3)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_choose:addHandleOfControlEvent(function()
		log.info("btn_choose")

		local function var_43_0(arg_44_0)
			arg_32_0.view.widgets.btn_choose:setEnabled(false)

			arg_32_0.info.yzToken = arg_32_0.info.yzToken - 1

			arg_32_0.view.widgets.yzToken:setString(language.get(490026, arg_32_0.info.yzToken))
			smgr.showTipTextGreen(language.get(390502))
		end

		if arg_32_0.info.isNormal == true then
			local var_43_1 = arg_32_0.nationStoreList[1 + arg_32_0.serverCellTouched]

			cmgr.sendRequest(var_43_0, actions.kfyzChooseYzServer, var_43_1.server, var_43_1.forceType)
		elseif #arg_32_0.lockNationStoreList == 3 then
			local var_43_2 = {}

			for iter_43_0, iter_43_1 in ipairs(arg_32_0.lockNationStoreList) do
				table.insert(var_43_2, string.format("%s,%s", iter_43_1.server, iter_43_1.forceType))
			end

			local var_43_3 = table.concat(var_43_2, "#")

			cmgr.sendRequest(var_43_0, actions.kfyzChooseServers, var_43_3)
		else
			smgr.showTipText(language.get(215216))
		end
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_refresh:addHandleOfControlEvent(function()
		messageBox.showChargeWin("", language.get(390530, arg_32_0.info.refreshGold), "refresh_kfyz_list", function()
			arg_32_0:refresh(1)
		end)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_protect:addHandleOfControlEvent(function()
		log.info("btn_protect")
		arg_32_0:showTip(language.get(390550), arg_32_0.view.widgets.btn_protect)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_yzToken:addHandleOfControlEvent(function()
		log.info("btn_yzToken")
		arg_32_0:showTip(language.get(490155), arg_32_0.view.widgets.btn_yzToken)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_yzEquip:addHandleOfControlEvent(function()
		log.info("btn_yzEquip")
		arg_32_0:showTip(language.get(490164, arg_32_0.info.loseTime, arg_32_0.info.bombNum, arg_32_0.info.deliverGoodsRank, arg_32_0.info.trapNum, user.fbTokenNum or 0), arg_32_0.view.widgets.btn_yzEquip)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_divide_show:addHandleOfControlEvent(function()
		log.info("btn_divide_show")

		local var_50_0 = arg_32_0.nationStoreList[1 + arg_32_0.serverCellTouched]

		if arg_32_0.info.mineNum > var_50_0["mine" .. var_50_0.forceType] then
			local function var_50_1(arg_51_0)
				arg_32_0:refresh()
			end

			local var_50_2 = 0

			cmgr.sendRequest(var_50_1, actions.kfyzLockNation, var_50_0.server, var_50_0.forceType, var_50_2)
		else
			smgr.showTipText(language.get(215214))
		end
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_divide_hide:addHandleOfControlEvent(function()
		log.info("btn_divide_hide")

		local var_52_0

		local function var_52_1(arg_53_0)
			table.remove(arg_32_0.lockNationStoreList)
			var_52_0()
		end

		function var_52_0()
			if #arg_32_0.lockNationStoreList > 0 then
				local var_54_0 = arg_32_0.lockNationStoreList[#arg_32_0.lockNationStoreList]

				cmgr.sendRequest(var_52_1, actions.kfyzUnLockNation, var_54_0.server, var_54_0.forceType)
			else
				arg_32_0:refresh()
			end
		end

		var_52_0()
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_medal:addHandleOfControlEvent(function()
		log.info("btn_medal")

		local var_55_0 = {}

		for iter_55_0, iter_55_1 in ipairs(arg_32_0.info.medal.effects) do
			var_55_0[iter_55_1.type] = iter_55_1.value
		end

		local var_55_1 = (((arg_32_0.info.medal.name .. "\n" .. language.get("122098_treasure", var_55_0.Att)) .. "\n" .. language.get("122099_treasure", var_55_0.Def)) .. "\n" .. language.get("122100_treasure", var_55_0.Blood)) .. "\n" .. language.get(1070232, 100 * arg_32_0.info.maxPer)

		arg_32_0:showTip(var_55_1, arg_32_0.view.widgets.btn_medal)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")

		local var_56_0 = arg_32_0.nationStoreList[1 + arg_32_0.serverCellTouched]
		local var_56_1 = language.get(1070236)

		if var_56_0.isBlueprint then
			var_56_1 = var_56_1 .. "\n" .. language.get(189920)
		elseif var_56_0.isGem then
			var_56_1 = var_56_1 .. "\n" .. language.get(10106)
		else
			var_56_1 = var_56_1 .. "\n" .. language.get(10104)
		end

		local var_56_2 = ((var_56_1 .. " " .. language.get(490026, var_56_0.maxReward)) .. "\n" .. language.get(1070237) .. " " .. language.get(490026, var_56_0.maxPiece)) .. "\n" .. language.get(111016) .. " " .. language.get(490026, var_56_0.feat)

		arg_32_0:showTip(var_56_2, arg_32_0.view.widgets.btn_reward)
	end, CCControlEventTouchUpInside)
	arg_32_0.view.widgets.btn_addWinPer:addHandleOfControlEvent(function()
		log.info("btn_addWinPer")

		local var_57_0 = arg_32_0.nationStoreList[1 + arg_32_0.serverCellTouched]

		if var_57_0.extraSlaves and #var_57_0.extraSlaves > 0 then
			local var_57_1 = language.get(1070235)

			for iter_57_0, iter_57_1 in ipairs(var_57_0.extraSlaves) do
				var_57_1 = var_57_1 .. "\n" .. language.get(121066, iter_57_1.server, iter_57_1.nation)
			end

			arg_32_0:showTip(var_57_1, arg_32_0.view.widgets.btn_addWinPer)
		end
	end, CCControlEventTouchUpInside)
	arg_32_0:setNoServerTips()

	if arg_32_2 then
		arg_32_0:showPanel(arg_32_2)
	else
		arg_32_0:refresh()
	end

	arg_32_0:refineLayout()
end

function var_0_13.onEnter(arg_58_0)
	arg_58_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_58_0, arg_58_0.update), 0, false)
end

function var_0_13.onExit(arg_59_0)
	if arg_59_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_59_0.updateRef)
	end
end

function var_0_13.update(arg_60_0, arg_60_1)
	if arg_60_0.info then
		if arg_60_0.info.disturbCd then
			if arg_60_0.info.disturbCd > 0 then
				arg_60_0.info.disturbCd = arg_60_0.info.disturbCd - 1000 * arg_60_1
			elseif arg_60_0.info.disturbCd <= 0 then
				arg_60_0.info.disturbCd = 0
			end
		end

		if arg_60_0.info.lockExpire then
			if arg_60_0.info.lockExpire > 0 then
				arg_60_0.info.lockExpire = arg_60_0.info.lockExpire - 1000 * arg_60_1
			elseif arg_60_0.info.lockExpire <= 0 then
				arg_60_0.info.lockExpire = nil

				messageBox.alert("", language.get(215217), function()
					if not tolua.isnull(arg_60_0) then
						arg_60_0:refresh()
					end
				end)
			end
		end
	end
end

function var_0_13.refineLayout(arg_62_0)
	local var_62_0 = arg_62_0.view.widgets.title:getPositionX()
	local var_62_1 = arg_62_0.view.widgets.title:getContentSize().width / 2

	arg_62_0.view.widgets.no_rank:setPositionX(var_62_0 + var_62_1 + 5)
	arg_62_0.view.widgets.num_rank:setPositionX(var_62_0 + var_62_1 + 5)
end

return var_0_13
