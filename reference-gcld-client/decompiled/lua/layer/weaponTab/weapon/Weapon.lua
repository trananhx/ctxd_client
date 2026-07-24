local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = {
	{
		text = 121007,
		pic = "bqcz_tit_wcb.png"
	},
	{
		text = 121008,
		pic = "bqcz_tit_xld.png"
	},
	{
		text = 121009,
		pic = "bqcz_tit_hjf.png"
	},
	{
		text = 121010,
		pic = "bqcz_tit_xdz.png"
	},
	{
		text = 121011,
		pic = "bqcz_tit_bgd.png"
	},
	{
		text = 121012,
		pic = "bqcz_tit_jjl.png"
	},
	{
		pic = "sbxt_n_word_qsj.png"
	},
	{
		pic = "sbxt_n_word_tlj.png"
	},
	{
		pic = "sbxt_n_word_pjy.png"
	}
}
local var_0_6 = {
	{
		text = 121047,
		pic = "bqcz_tit_zwcb.png"
	},
	{
		text = 121048,
		pic = "bqcz_tit_zxld.png"
	},
	{
		text = 121049,
		pic = "bqcz_tit_zhjf.png"
	},
	{
		text = 121050,
		pic = "bqcz_tit_zxdz.png"
	},
	{
		text = 121051,
		pic = "bqcz_tit_zbgd.png"
	},
	{
		text = 121052,
		pic = "bqcz_tit_zjjl.png"
	}
}
local var_0_7 = {
	{
		text = 121028,
		key = "att",
		txt_value = 121022,
		pic_red = "mz6.png",
		txt_next = 121025,
		pic_gre = "mz3.png",
		pic = "icon_att.png"
	},
	{
		text = 121029,
		key = "def",
		txt_value = 121023,
		pic_red = "mz5.png",
		txt_next = 121026,
		pic_gre = "mz2.png",
		pic = "icon_def.png"
	},
	{
		text = 121030,
		key = "blood",
		txt_value = 121024,
		pic_red = "daibing-red.png",
		txt_next = 121027,
		pic_gre = "daibing-green.png",
		pic = "icon_hp.png"
	}
}
local var_0_8 = 180
local var_0_9 = {
	"ganjiang",
	"moxie",
	"ouyezi",
	"zhuyongzi",
	"zengcongzi"
}

local function var_0_10(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	if arg_1_1 % 3 == 1 then
		var_1_0 = "res/ui/common/text/weapon/reform/bqcz_tit_qtgj.png"
	elseif arg_1_1 % 3 == 2 then
		var_1_0 = "res/ui/common/text/weapon/reform/bqcz_tit_qtfy.png"
	elseif arg_1_1 % 3 == 0 then
		var_1_0 = "res/ui/common/text/weapon/reform/bqcz_tit_dbsx.png"
	end

	local var_1_1 = arg_1_0:getContentSize()
	local var_1_2 = CCSprite:create(var_1_0)
	local var_1_3 = CCSprite:createWithSpriteFrameName("res_plus.png")

	var_1_3:setScale(0.8)

	local var_1_4 = CCLabelAtlas:create(arg_1_2, "res/ui/common/number/icon_numb.png", 19, 23, 48)

	var_1_4:setAnchorPoint(ccp(0.5, 0.5))

	local var_1_5 = createRichNode({
		var_1_2,
		var_1_3,
		var_1_4
	})

	var_1_5:setScale(1.26)
	arg_1_0:addChild(var_1_5, 100)

	local var_1_6 = var_1_2:getContentSize()
	local var_1_7 = var_1_3:getContentSize()
	local var_1_8 = var_1_4:getContentSize()
	local var_1_9 = 1.26 * (var_1_6.width + var_1_7.width + var_1_8.width)

	var_1_5:setPosition(ccp(0.5 * (var_1_1.width - var_1_9), 0.5 * var_1_1.height))

	return var_1_5
end

local var_0_11 = class("Weapon", function()
	return createBaseLayer()
end)

var_0_11.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "panel",
			type = "sprite9",
			preferedSize = CCSizeMake(915, 532),
			middleRect = CCRectMake(10, 10, 70, 70),
			x = visibleSize.width / 2,
			y = visibleSize.height / 2 - 30,
			pic = {
				path = "res/ui/common/panel/comm_view.png"
			},
			children = {
				{
					type = "node",
					name = "node1",
					y = 0,
					visible = false,
					x = 0,
					children = {}
				},
				{
					type = "node",
					name = "node2",
					y = 0,
					visible = false,
					x = 0,
					children = {
						{
							y = 6,
							name = "bg_info",
							type = "sprite",
							x = 454,
							anchorPoint = ccp(0, 0),
							pic = {
								path = "res/ui/weapon/godWeapon/sbxt_bg.jpg"
							},
							children = {
								{
									y = 417,
									x = 228,
									type = "sprite",
									pic = {
										path = "res/ui/weapon/godWeapon/sbxt_title_word_sbsj.png"
									}
								},
								{
									y = 85,
									type = "sprite",
									x = 228,
									pic = {
										path = "res/ui/activity/fishing/hjcd_time_line.png"
									},
									children = {
										{
											fontSize = 25,
											name = "lbl_reward",
											style = "label_warlock",
											type = "label",
											y = 30,
											x = 165,
											color = var_0_0
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_tip",
									h = 120,
									type = "button",
									w = 120,
									y = 210,
									x = 228,
									normal = {
										path = "res/ui/weapon/bq_icon_bg.png"
									},
									touched = {
										path = "res/ui/weapon/bq_icon_bg.png"
									},
									children = {
										{
											y = 60,
											name = "icon_reward",
											type = "sprite",
											x = 60,
											pic = {
												path = "res/ui/weapon/godWeapon/seal.jpg"
											},
											children = {
												{
													x = 62,
													name = "weapon_light_10",
													y = 54,
													type = "sprite",
													scale = 1.18,
													pic = {
														path = "res/ui/weapon/bq_icon_bg.png"
													}
												}
											}
										}
									}
								},
								{
									y = 345,
									type = "sprite",
									x = 228,
									pic = {
										path = "res/ui/weapon/baowu_di.png"
									},
									children = {
										{
											y = 40,
											x = 40,
											type = "sprite",
											scale = 0.68,
											pic = {
												path = "res/ui/weapon/godWeapon/weapon7.jpg"
											},
											children = {
												{
													x = 62,
													name = "weapon_light_7",
													y = 54,
													type = "sprite",
													scale = 1.18,
													pic = {
														path = "res/ui/weapon/bq_icon_bg.png"
													}
												}
											}
										}
									}
								},
								{
									y = 170,
									type = "sprite",
									x = 88,
									pic = {
										path = "res/ui/weapon/baowu_di.png"
									},
									children = {
										{
											y = 40,
											x = 40,
											type = "sprite",
											scale = 0.68,
											pic = {
												path = "res/ui/weapon/godWeapon/weapon8.jpg"
											},
											children = {
												{
													x = 62,
													name = "weapon_light_8",
													y = 54,
													type = "sprite",
													scale = 1.18,
													pic = {
														path = "res/ui/weapon/bq_icon_bg.png"
													}
												}
											}
										}
									}
								},
								{
									y = 170,
									type = "sprite",
									x = 368,
									pic = {
										path = "res/ui/weapon/baowu_di.png"
									},
									children = {
										{
											y = 40,
											x = 40,
											type = "sprite",
											scale = 0.68,
											pic = {
												path = "res/ui/weapon/godWeapon/weapon9.jpg"
											},
											children = {
												{
													x = 62,
													name = "weapon_light_9",
													y = 54,
													type = "sprite",
													scale = 1.18,
													pic = {
														path = "res/ui/weapon/bq_icon_bg.png"
													}
												}
											}
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_seal",
									h = 50,
									type = "button",
									w = 50,
									y = 360,
									x = 375,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 25,
											x = 25,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/weapon/godWeapon/seal_small.jpg"
											}
										},
										{
											fontSize = 20,
											style = "label_warlock",
											name = "leftFeudTimes",
											type = "label",
											y = 47,
											x = 3,
											color = var_0_0,
											anchorPoint = ccp(0, 1)
										},
										{
											fontSize = 20,
											style = "label_warlock",
											y = 0,
											type = "label",
											x = 25,
											textId = 121080,
											color = var_0_0,
											anchorPoint = ccp(0.5, 1)
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_fd",
									h = 50,
									type = "button",
									w = 50,
									y = 280,
									x = 375,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 25,
											x = 25,
											type = "sprite",
											scale = 0.6,
											pic = {
												path = "res/ui/weapon/godWeapon/chuiz01.jpg"
											}
										},
										{
											fontSize = 20,
											style = "label_warlock",
											name = "feudAccNumTimes",
											type = "label",
											y = 47,
											x = 3,
											color = var_0_0,
											anchorPoint = ccp(0, 1)
										}
									}
								},
								{
									y = 435,
									name = "bjNode2",
									visible = false,
									type = "node",
									x = 50,
									children = {
										{
											w = 98,
											name = "bjBtn2",
											h = 48,
											type = "button",
											y = 0,
											x = 0,
											normal = {
												path = "res/ui/kfsy/150150.png"
											},
											touched = {
												path = "res/ui/kfsy/150150.png"
											}
										},
										{
											y = 1.4285,
											name = "gtdcbyh_jzc_word_di",
											type = "sprite",
											x = -0.0001,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_word_di.png"
											}
										},
										{
											y = 2,
											name = "gtdcbyh_jzc_di_2x",
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_di_2x.png"
											}
										},
										{
											y = 2,
											name = "gtdcbyh_jzc",
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc.png"
											}
										},
										{
											fontSize = 20,
											name = "bjLb2",
											y = 0,
											type = "label",
											x = 15
										},
										{
											y = 2,
											name = "bjLight2",
											visible = false,
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_light.png"
											}
										}
									}
								},
								{
									y = 385,
									name = "bjNode4",
									visible = false,
									type = "node",
									x = 50,
									children = {
										{
											w = 98,
											name = "bjBtn4",
											h = 48,
											type = "button",
											y = 0,
											x = 0,
											normal = {
												path = "res/ui/kfsy/150150.png"
											},
											touched = {
												path = "res/ui/kfsy/150150.png"
											}
										},
										{
											y = 0,
											name = "gtdcbyh_jzc_word_di",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_word_di.png"
											}
										},
										{
											y = 2,
											name = "gtdcbyh_jzc_di_4x",
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_di_4x.png"
											}
										},
										{
											y = 2,
											name = "gtdcbyh_jzc",
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc.png"
											}
										},
										{
											fontSize = 20,
											name = "bjLb4",
											y = 0,
											type = "label",
											x = 15
										},
										{
											y = 2,
											name = "bjLight4",
											visible = false,
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_light.png"
											}
										}
									}
								},
								{
									y = 335,
									name = "bjNode10",
									visible = false,
									type = "node",
									x = 50,
									children = {
										{
											w = 98,
											name = "bjBtn10",
											h = 48,
											type = "button",
											y = 0,
											x = 0,
											normal = {
												path = "res/ui/kfsy/150150.png"
											},
											touched = {
												path = "res/ui/kfsy/150150.png"
											}
										},
										{
											y = 0,
											name = "gtdcbyh_jzc_word_di",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_word_di.png"
											}
										},
										{
											y = 2,
											name = "gtdcbyh_jzc_di_10x",
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_di_10x.png"
											}
										},
										{
											y = 2,
											name = "gtdcbyh_jzc",
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc.png"
											}
										},
										{
											fontSize = 20,
											name = "bjLb10",
											y = 0,
											type = "label",
											x = 15
										},
										{
											y = 2,
											name = "bjLight10",
											visible = false,
											type = "sprite",
											x = -25,
											pic = {
												path = "res/ui/weapon/godWeapon/gtdcbyh_jzc_light.png"
											}
										}
									}
								}
							}
						},
						{
							y = 0,
							name = "node_steel",
							type = "node",
							x = 0,
							children = {
								{
									y = 500,
									x = 50,
									type = "sprite",
									scale = 0.6,
									pic = {
										path = "res/ui/playerInfo/role_nation_view.png"
									}
								},
								{
									y = 500,
									x = 50,
									type = "sprite",
									pic = {
										path = "res/ui/weapon/godWeapon/sbxt_icon_blg.png"
									}
								},
								{
									fontSize = 25,
									name = "num",
									style = "label_warlock",
									type = "label",
									y = 500,
									x = 80,
									color = var_0_0,
									anchorPoint = ccp(0, 0.5)
								},
								{
									zoomOnTouchDown = true,
									name = "btn_melt",
									h = 40,
									type = "button",
									w = 300,
									y = 500,
									x = 890,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									anchorPoint = ccp(1, 0.5),
									children = {
										{
											fontSize = 25,
											style = "label_warlock",
											y = 20,
											type = "label",
											x = 300,
											textId = 121062,
											color = var_0_1,
											anchorPoint = ccp(1, 0.5)
										}
									}
								}
							}
						}
					}
				},
				{
					type = "sprite",
					name = "bg_reform",
					y = 0,
					visible = false,
					x = 0,
					anchorPoint = ccp(0, 0),
					pic = {
						path = "res/ui/weapon/reform/bqcz_bg.jpg"
					},
					children = {
						{
							y = 418,
							x = 52,
							type = "sprite",
							pic = {
								path = "res/ui/common/text/weapon/reform/bqcz_title.png"
							}
						},
						{
							y = 316,
							name = "icon",
							type = "sprite",
							x = 466,
							pic = {
								path = "res/ui/weapon/reform/weapon_true_1.jpg"
							}
						},
						{
							y = 216,
							x = 466,
							type = "sprite",
							pic = {
								path = "res/ui/weapon/reform/bqcz_bqname_bg.png"
							}
						},
						{
							y = 216,
							name = "name",
							type = "sprite",
							x = 466,
							pic = {
								path = "res/ui/common/text/weapon/reform/bqcz_tit_zhjf.png"
							}
						},
						{
							type = "sprite",
							name = "info",
							y = 150,
							visible = false,
							x = 466,
							pic = {
								path = "res/ui/weapon/reform/bqcz_small_bg.png"
							}
						},
						{
							x = 435,
							name = "star1",
							y = 345,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = true,
								path = "star_light.png"
							}
						},
						{
							x = 450,
							name = "star2",
							y = 345,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = true,
								path = "star_light.png"
							}
						},
						{
							x = 465,
							name = "star3",
							y = 345,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = true,
								path = "star_light.png"
							}
						},
						{
							x = 480,
							name = "star4",
							y = 345,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = true,
								path = "star_light.png"
							}
						},
						{
							x = 495,
							name = "star5",
							y = 345,
							type = "sprite",
							scale = 0.6,
							pic = {
								frame = true,
								path = "star_light.png"
							}
						},
						{
							type = "sprite",
							name = "fire",
							y = 250,
							visible = false,
							x = 466,
							pic = {
								path = "res/ui/weapon/reform/bqcz_mask.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_start",
							h = 75,
							type = "button",
							w = 188,
							y = 80,
							x = 466,
							normal = {
								path = "res/ui/weapon/reform/bqcz_btn_djzz.png"
							},
							touched = {
								path = "res/ui/weapon/reform/bqcz_btn_djzz.png"
							},
							children = {
								{
									fontSize = 25,
									style = "label_warlock",
									y = 42,
									type = "label",
									x = 94,
									textId = 121055,
									color = var_0_0
								}
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_finish",
							h = 75,
							type = "button",
							w = 188,
							y = 80,
							visible = false,
							x = 466,
							normal = {
								path = "res/ui/weapon/reform/bqcz_btn_zzwc.png"
							},
							touched = {
								path = "res/ui/weapon/reform/bqcz_btn_zzwc.png"
							},
							children = {
								{
									fontSize = 25,
									style = "label_warlock",
									y = 42,
									type = "label",
									x = 94,
									textId = 121056,
									color = var_0_0
								}
							}
						}
					}
				},
				{
					x = 0,
					height = 532,
					visible = false,
					type = "layerColor",
					name = "bg_fuse",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 0, 200),
					children = {
						{
							y = 300,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/weapon/godWeapon/sbxt_word_djhcsb.png"
							}
						},
						{
							name = "btn_fuse",
							h = 56,
							type = "button",
							w = 189,
							y = 180,
							x = 458,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_03.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_03_c.png"
							},
							children = {
								{
									fontSize = 25,
									style = "label_warlock",
									y = 33,
									type = "label",
									x = 90,
									textId = 121060,
									color = var_0_0
								}
							}
						}
					}
				},
				{
					x = 0,
					height = 532,
					visible = false,
					type = "layerColor",
					name = "bg_gem",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 0, 0),
					children = {
						{
							y = 280,
							name = "bg_gemList",
							type = "sprite",
							x = 458,
							pic = {
								path = "res/ui/weapon/cangku.png"
							},
							children = {
								{
									fontSize = 30,
									style = "label_warlock",
									y = 140,
									type = "label",
									x = 267,
									textId = 121006,
									color = var_0_0
								},
								{
									x = 505,
									name = "btn_close",
									h = 33,
									type = "button",
									w = 32,
									y = 138,
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
	}
}
var_0_11.tipFrame = {
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
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 135238,
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_0
		}
	}
}

function var_0_11.getLayout_singleWeapon(arg_3_0, arg_3_1)
	return {
		type = "sprite",
		name = "card" .. arg_3_1,
		x = arg_3_1 <= 3 and 234 or 681,
		y = arg_3_1 <= 3 and 437 - (arg_3_1 - 1) * 170 or 437 - (arg_3_1 - 4) * 170,
		pic = {
			path = "res/ui/weapon/xiaoban1.png"
		},
		children = {
			{
				y = 90,
				type = "sprite",
				x = 75,
				pic = {
					path = "res/ui/weapon/bq_icon_bg.png"
				},
				children = {
					{
						x = 60,
						y = 60,
						type = "sprite",
						scale = 1.48,
						name = "weapon_icon_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/weapon_1.png"
						},
						children = {
							{
								x = 42,
								y = 37,
								type = "sprite",
								scale = 0.8,
								name = "weapon_light_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/bq_icon_bg.png"
								}
							}
						}
					},
					{
						y = 100,
						x = 60,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/bq_digit_bg.png"
						}
					}
				}
			},
			{
				type = "sprite",
				y = 140,
				visible = false,
				x = 140,
				name = "name_" .. arg_3_1,
				anchorPoint = ccp(0, 0.5),
				pic = {
					path = "res/ui/common/text/weapon/reform/bqcz_tit_wcb.png"
				}
			},
			{
				type = "node",
				y = 0,
				visible = false,
				x = 0,
				name = "notOpen_" .. arg_3_1,
				children = {
					{
						fontSize = 25,
						style = "label_warlock",
						type = "label",
						y = 95,
						x = 145,
						textId = 143047,
						anchorPoint = ccp(0, 0.5),
						color = var_0_0
					},
					{
						fontSize = 22,
						height = 0,
						type = "label",
						x = 145,
						y = 70,
						style = "label_warlock",
						width = 260,
						halign = kCCTextAlignmentLeft,
						anchorPoint = ccp(0, 1),
						color = var_0_0,
						name = "introungot_" .. arg_3_1
					}
				}
			},
			{
				type = "sprite",
				y = 95,
				visible = false,
				x = 160,
				name = "quantiIcon_" .. arg_3_1,
				pic = {
					path = "res/ui/weapon/icon_att.png"
				}
			},
			{
				type = "node",
				y = 0,
				visible = false,
				x = 0,
				name = "node2_collect" .. arg_3_1,
				children = {
					{
						fontSize = 20,
						style = "label_warlock",
						y = 140,
						type = "label",
						x = 425,
						textId = 121016,
						color = var_0_0,
						anchorPoint = ccp(1, 0.5)
					},
					{
						y = 95,
						x = 250,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/tuzhi.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 95,
						x = 300,
						color = var_0_0,
						name = "map_percent_" .. arg_3_1
					},
					{
						w = 125,
						h = 54,
						type = "button",
						y = 50,
						x = 240,
						name = "btn_buy_" .. arg_3_1,
						normal = {
							frame = true,
							path = "btn2_gre_a.png"
						},
						touched = {
							frame = true,
							path = "btn2_gre_c.png"
						}
					},
					{
						w = 125,
						h = 54,
						type = "button",
						y = 50,
						x = 370,
						name = "btn_drop_" .. arg_3_1,
						normal = {
							frame = true,
							path = "btn2_gre_a.png"
						},
						touched = {
							frame = true,
							path = "btn2_gre_c.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						y = 50,
						type = "label",
						x = 240,
						textId = 121018,
						color = var_0_0
					},
					{
						fontSize = 20,
						style = "label_warlock",
						y = 50,
						type = "label",
						x = 370,
						textId = 121019,
						color = var_0_0
					}
				}
			},
			{
				type = "node",
				y = 0,
				visible = false,
				x = 0,
				name = "node3_make" .. arg_3_1,
				children = {
					{
						fontSize = 20,
						style = "label_warlock",
						y = 95,
						type = "label",
						x = 180,
						textId = 121015,
						color = var_0_0,
						anchorPoint = ccp(0, 0.5)
					},
					{
						y = 60,
						type = "sprite",
						x = 160,
						name = "cost2_icon1_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/silver.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 60,
						x = 180,
						color = var_0_0,
						name = "cost2_icon1Value_" .. arg_3_1,
						anchorPoint = ccp(0, 0.5)
					},
					{
						y = 30,
						type = "sprite",
						x = 160,
						name = "cost2_icon2_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/mucai.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 30,
						x = 180,
						color = var_0_0,
						name = "cost2_icon2Value_" .. arg_3_1,
						anchorPoint = ccp(0, 0.5)
					},
					{
						h = 54,
						type = "button",
						w = 125,
						y = 50,
						x = 370,
						name = "btn_dazao_" .. arg_3_1,
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
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						y = 50,
						type = "label",
						x = 370,
						textId = 121020,
						color = var_0_0
					}
				}
			},
			{
				type = "node",
				y = 0,
				visible = false,
				x = 0,
				name = "node4_hammer" .. arg_3_1,
				children = {
					{
						y = 95,
						x = 370,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/donghuadi.png"
						}
					},
					{
						y = 95,
						type = "sprite",
						x = 368,
						name = "donghuaValue_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/donghuachui1.png"
						}
					},
					{
						y = 95,
						x = 225,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/jingdudi.png"
						}
					},
					{
						y = 95,
						type = "progressbar",
						x = 225,
						name = "dazaoBar_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/jingdutiao.png"
						}
					}
				}
			},
			{
				type = "node",
				y = 0,
				visible = false,
				x = 0,
				name = "node5_open" .. arg_3_1,
				children = {
					{
						zoomOnTouchDown = true,
						h = 60,
						type = "button",
						w = 60,
						y = 65,
						x = 100,
						name = "btn_gem1_" .. arg_3_1,
						normal = {
							path = "res/default.png"
						},
						touched = {
							path = "res/default.png"
						},
						children = {
							{
								x = 30,
								y = 30,
								type = "sprite",
								scale = 1.5,
								name = "weapon_gem_bg1_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/baoshidi2.png"
								}
							},
							{
								x = 30,
								y = 30,
								type = "sprite",
								scale = 0.6,
								name = "weapon_gem1_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/baoshi1.jpg"
								}
							}
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 130,
						x = 40,
						color = var_0_0,
						name = "lvValue_" .. arg_3_1
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 95,
						x = 180,
						color = var_0_0,
						name = "quantiValue_" .. arg_3_1,
						anchorPoint = ccp(0, 0.5)
					},
					{
						y = 22,
						type = "sprite",
						x = 222,
						pic = {
							path = "res/ui/weapon/bq_pb_bg.png"
						},
						children = {
							{
								y = 6.5,
								type = "progressbar",
								x = 207.5,
								name = "zhuzaoBar_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/bq_pb.png"
								}
							},
							{
								fontSize = 20,
								style = "label_warlock",
								type = "label",
								y = 6.5,
								x = 207.5,
								color = var_0_0,
								name = "zhuzaoPercent_" .. arg_3_1
							}
						}
					},
					{
						y = 50,
						type = "sprite",
						x = 160,
						name = "cost_icon_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/tie.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 50,
						x = 180,
						color = var_0_0,
						name = "cost_value_" .. arg_3_1,
						anchorPoint = ccp(0, 0.5)
					},
					{
						w = 140,
						h = 52,
						type = "button",
						y = 50,
						x = 360,
						name = "btn_zhuzao_" .. arg_3_1,
						normal = {
							frame = true,
							path = "btn3_gre_a.png"
						},
						touched = {
							frame = true,
							path = "btn3_gre_c.png"
						}
					},
					{
						y = 50,
						h = 52,
						type = "button",
						w = 140,
						visible = false,
						x = 360,
						name = "btn_reform_" .. arg_3_1,
						normal = {
							frame = true,
							path = "btn3_yel_a.png"
						},
						touched = {
							frame = true,
							path = "btn3_yel_c.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 50,
						x = 360,
						textId = 121017,
						color = var_0_0,
						name = "btn_name_zhuzao_" .. arg_3_1
					},
					{
						y = 66,
						type = "sprite",
						x = 360,
						name = "fullLv_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/godWeapon/sbxt_seal_mj.png"
						}
					},
					{
						type = "sprite",
						x = 310,
						visible = false,
						y = 140,
						scale = 0.9,
						name = "star1_" .. arg_3_1,
						pic = {
							path = "res/ui/weapon/xing_dark.png"
						},
						children = {
							{
								y = 13.5,
								type = "sprite",
								x = 42,
								name = "star2_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/xing_dark.png"
								}
							},
							{
								y = 13.5,
								type = "sprite",
								x = 70,
								name = "star3_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/xing_dark.png"
								}
							},
							{
								y = 13.5,
								type = "sprite",
								x = 98,
								name = "star4_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/xing_dark.png"
								}
							},
							{
								y = 13.5,
								type = "sprite",
								x = 126,
								name = "star5_" .. arg_3_1,
								pic = {
									path = "res/ui/weapon/xing_dark.png"
								}
							}
						}
					},
					{
						type = "sprite",
						y = 40,
						visible = false,
						x = 222,
						name = "donghuaFire_" .. arg_3_1,
						pic = {
							path = "res/default.png"
						}
					}
				}
			}
		}
	}
end

function var_0_11.getLayout_singleGodWeapon(arg_4_0, arg_4_1)
	return {
		type = "sprite",
		x = 228.5,
		name = "card" .. arg_4_1,
		y = 398.5 - (arg_4_1 - 7) * 158,
		pic = {
			path = "res/ui/weapon/godWeapon/sbxt_d_s.png"
		},
		children = {
			{
				y = 90,
				type = "sprite",
				x = 75,
				pic = {
					path = "res/ui/weapon/bq_icon_bg.png"
				},
				children = {
					{
						y = 60,
						type = "sprite",
						x = 60,
						name = "weapon_icon_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/godWeapon/weapon7.jpg"
						}
					},
					{
						y = 100,
						x = 60,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/bq_digit_bg.png"
						}
					}
				}
			},
			{
				fontSize = 20,
				style = "label_warlock",
				type = "label",
				y = 130,
				x = 40,
				color = var_0_0,
				name = "lvValue_" .. arg_4_1
			},
			{
				y = 22,
				type = "sprite",
				x = 228,
				pic = {
					path = "res/ui/weapon/bq_pb_bg.png"
				},
				children = {
					{
						y = 6.5,
						type = "progressbar",
						x = 207.5,
						name = "zhuzaoBar_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/bq_pb.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 6.5,
						x = 207.5,
						color = var_0_0,
						name = "zhuzaoPercent_" .. arg_4_1
					}
				}
			},
			{
				y = 100,
				type = "sprite",
				x = 160,
				name = "quantiIcon_" .. arg_4_1,
				pic = {
					path = "res/ui/weapon/icon_att.png"
				}
			},
			{
				fontSize = 20,
				style = "label_warlock",
				type = "label",
				y = 100,
				x = 180,
				color = var_0_0,
				name = "quantiValue_" .. arg_4_1,
				anchorPoint = ccp(0, 0.5)
			},
			{
				y = 130,
				type = "sprite",
				x = 270,
				pic = {
					path = "res/ui/weapon/godWeapon/sbxt_word_d.png"
				},
				children = {
					{
						y = 23,
						type = "sprite",
						x = 138,
						name = "name_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/godWeapon/sbxt_n_word_qsj.png"
						}
					}
				}
			},
			{
				zoomOnTouchDown = true,
				h = 60,
				type = "button",
				w = 60,
				y = 57,
				x = 165,
				name = "btn_gem1_" .. arg_4_1,
				normal = {
					path = "res/default.png"
				},
				touched = {
					path = "res/default.png"
				},
				children = {
					{
						x = 30,
						y = 30,
						type = "sprite",
						scale = 1.5,
						name = "weapon_gem_bg1_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/banshidi1.png"
						}
					},
					{
						x = 30,
						y = 30,
						type = "sprite",
						scale = 0.6,
						name = "weapon_gem1_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/baoshi1.jpg"
						}
					}
				}
			},
			{
				zoomOnTouchDown = true,
				h = 60,
				type = "button",
				w = 60,
				y = 57,
				x = 225,
				name = "btn_gem2_" .. arg_4_1,
				normal = {
					path = "res/default.png"
				},
				touched = {
					path = "res/default.png"
				},
				children = {
					{
						x = 30,
						y = 30,
						type = "sprite",
						scale = 1.5,
						name = "weapon_gem_bg2_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/banshidi1.png"
						}
					},
					{
						x = 30,
						y = 30,
						type = "sprite",
						scale = 0.6,
						name = "weapon_gem2_" .. arg_4_1,
						pic = {
							path = "res/ui/weapon/baoshi1.jpg"
						}
					}
				}
			},
			{
				zoomOnTouchDown = true,
				h = 62,
				type = "button",
				w = 195,
				y = 56,
				x = 348,
				name = "btn_zhuzao_" .. arg_4_1,
				normal = {
					path = "res/ui/common/button/public_btn_green.png"
				},
				touched = {
					path = "res/ui/common/button/public_btn_green_c.png"
				},
				children = {
					{
						y = 34,
						x = 48,
						type = "sprite",
						pic = {
							path = "res/ui/common/button/public_btn_gold.png"
						}
					},
					{
						y = 38,
						x = 48,
						type = "sprite",
						pic = {
							path = "res/ui/weapon/godWeapon/sbxt_icon_blg.png"
						}
					},
					{
						fontSize = 20,
						style = "label_warlock",
						type = "label",
						y = 25,
						x = 48,
						color = var_0_0,
						name = "cost_value_" .. arg_4_1
					},
					{
						fontSize = 25,
						style = "label_warlock",
						y = 34,
						type = "label",
						x = 120,
						textId = 121017,
						color = var_0_0
					}
				}
			}
		}
	}
end

function var_0_11.refresh(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0:showPanel(arg_6_0.action.data)
	end

	cmgr.sendRequest(var_5_0, actions.getWeaponInfo)
end

function var_0_11.onBuyItem(arg_7_0, arg_7_1)
	local function var_7_0(arg_8_0)
		arg_7_0:refresh()
	end

	messageBox.showChargeWin("", language.get(121004, arg_7_0.info.buyCost), "buyWeaponItem", function()
		cmgr.sendRequest(var_7_0, actions.buyWeaponItem, arg_7_1)
	end)
end

function var_0_11.onUpgrade(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0)
		local var_11_0 = arg_11_0.action.data

		if var_11_0.updateLv and var_11_0.newLv == 50 and arg_10_0.info.weaponRank == 1 then
			roleDialogue.control.loadSpeak(1507)
		end

		if var_11_0.updateLv and arg_10_0.info.weaponRank == 2 and arg_10_0.info.maxLvNum == 2 then
			if var_11_0.newLv == 100 then
				roleDialogue.control.loadSpeak(1575)
			elseif var_11_0.newLv == 120 then
				roleDialogue.control.loadSpeak(1572)
			elseif var_11_0.newLv == 150 then
				roleDialogue.control.loadSpeak(1576)
			end
		end

		if var_11_0.updateLv and var_11_0.newLv == 1 then
			arg_10_0:showEffectDazao(arg_10_1)
		else
			local var_11_1 = var_11_0.addType
			local var_11_2

			if var_11_1 == 1 then
				var_11_2 = "res/ui/weapon/mz7.png"
			elseif var_11_1 == 2 then
				var_11_2 = "res/ui/weapon/mz8.png"
			elseif var_11_1 == 4 then
				var_11_2 = "res/ui/weapon/mz9.png"
			elseif var_11_1 == 10 then
				var_11_2 = "res/ui/weapon/mz10.png"
			end

			if var_11_2 ~= nil then
				local var_11_3 = CCSprite:create(var_11_2)

				var_11_3:setPosition(ccp(222, 77))
				arg_10_0.view.widgets["card" .. arg_10_1]:addChild(var_11_3, 100)

				local var_11_4 = CCArray:create()

				var_11_4:addObject(CCMoveTo:create(0.5, ccp(222, 107)))
				var_11_4:addObject(CCCallFuncN:create(function(arg_12_0)
					arg_12_0:removeFromParentAndCleanup(true)
				end))

				local var_11_5 = CCSequence:create(var_11_4)

				var_11_3:runAction(var_11_5)
			end

			if var_11_0.reward then
				for iter_11_0 = 7, 9 do
					arg_10_0.view.widgets["btn_zhuzao_" .. iter_11_0]:setEnabled(false)
				end

				arg_10_0:showEffectReward(var_11_0.reward)
			end

			arg_10_0.isZhuzao = true

			arg_10_0:refresh()
		end
	end

	cmgr.sendRequest(var_10_0, actions.weaponUpgrade, arg_10_1, arg_10_0.selectBjType)
end

function var_0_11.startReform(arg_13_0, arg_13_1)
	local function var_13_0(arg_14_0)
		return
	end

	cmgr.sendRequest(var_13_0, actions.weaponStartReform, arg_13_1)
end

function var_0_11.finishReform(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0)
		arg_15_0:refresh()
	end

	cmgr.sendRequest(var_15_0, actions.weaponFinishReform, arg_15_1)
end

function var_0_11.onFuse(arg_17_0)
	local function var_17_0(arg_18_0)
		arg_17_0.shouldShowEffectFuse = true

		arg_17_0:refresh()
	end

	cmgr.sendRequest(var_17_0, actions.fuseWeapon)
end

function var_0_11.onOpenSlot(arg_19_0, arg_19_1)
	local function var_19_0(arg_20_0)
		local var_20_0 = CCSprite:create("res/ui/weapon/mz12.png")

		arg_19_0:action_fly(var_20_0)
		arg_19_0:refresh()
	end

	cmgr.sendRequest(var_19_0, actions.weaponOpenSlot, 1, arg_19_1)
end

function var_0_11.getUnSetGems(arg_21_0, arg_21_1, arg_21_2)
	local function var_21_0(arg_22_0)
		local var_22_0 = arg_22_0.action.data

		if #var_22_0.gem > 0 then
			arg_21_0.unSetGems = var_22_0.gem

			arg_21_0.view.widgets.bg_gem:setVisible(true)
			arg_21_0:createGemList(arg_21_1, arg_21_2)
		else
			smgr.showTipText(language.get(121005))
		end
	end

	cmgr.sendRequest(var_21_0, actions.weaponUnSetGems, arg_21_1, arg_21_2)
end

function var_0_11.onPreUnloadGem(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local function var_23_0(arg_24_0)
		local var_24_0 = arg_24_0.action.data
		local var_24_1 = arg_23_3 <= 6 and arg_23_3 or arg_23_3 - 6
		local var_24_2 = arg_23_0.info.weapons[var_24_1].gems[arg_23_2]

		if var_24_0.gold > 0 then
			messageBox.showChargeWin("", language.get(121084, var_24_0.gold, var_24_2.gemName), "unloadGem", function()
				arg_23_0:onUnloadGem(arg_23_1, arg_23_2, arg_23_3)
			end)
		else
			arg_23_0:onUnloadGem(arg_23_1, arg_23_2, arg_23_3)
		end
	end

	cmgr.sendRequest(var_23_0, actions.weaponPreUnlaodGem, arg_23_1, arg_23_2, arg_23_3)
end

function var_0_11.onUnloadGem(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local function var_26_0(arg_27_0)
		local var_27_0 = arg_27_0.action.data

		arg_26_0:showEffectAttributeChg(var_27_0, false)
		arg_26_0:refresh()
	end

	cmgr.sendRequest(var_26_0, actions.weaponUnLoadGem, arg_26_1, arg_26_2, arg_26_3)
end

function var_0_11.onLoadGem(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
	local function var_28_0(arg_29_0)
		local var_29_0 = arg_29_0.action.data

		arg_28_0.view.widgets.bg_gem:setVisible(false)
		arg_28_0:showEffectAttributeChg(var_29_0, true)
		arg_28_0:refresh()
	end

	cmgr.sendRequest(var_28_0, actions.weaponLoadGem, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
end

function var_0_11.onGaizao(arg_30_0, arg_30_1)
	local function var_30_0()
		arg_30_0.reformData[arg_30_1].num = 1 + arg_30_0.reformData[arg_30_1].num

		if arg_30_0.reformData[arg_30_1].num >= arg_30_0.reformData[arg_30_1].numMax then
			arg_30_0:finishReform(arg_30_1)
		end
	end

	local function var_30_1(arg_32_0)
		local var_32_0 = arg_32_0.action.data

		arg_30_0.reformData[arg_30_1].totalPoint = var_32_0.totalPoint
		arg_30_0.reformData[arg_30_1].basePoint = var_32_0.basePoint
		arg_30_0.reformData[arg_30_1].numMax = var_32_0.totalPoint / var_32_0.basePoint

		arg_30_0:action_text_fly(arg_30_0.view.widgets["card" .. arg_30_1], 1, arg_30_1, var_30_0)
	end

	if arg_30_0.reformData[arg_30_1].num == 0 then
		cmgr.sendRequest(var_30_1, actions.weaponStartReform, arg_30_1)
	elseif arg_30_0.reformData[arg_30_1].num < arg_30_0.reformData[arg_30_1].numMax then
		arg_30_0:action_text_fly(arg_30_0.view.widgets["card" .. arg_30_1], 1, arg_30_1, var_30_0)
	end
end

function var_0_11.onChongzhu(arg_33_0, arg_33_1)
	log.info("兵器重铸")

	local function var_33_0(arg_34_0)
		local var_34_0 = arg_34_0.action.data

		arg_33_0.reformData[arg_33_1].totalPoint = var_34_0.totalPoint
		arg_33_0.reformData[arg_33_1].basePoint = var_34_0.basePoint
		arg_33_0.reformData[arg_33_1].numMax = var_34_0.totalPoint / var_34_0.basePoint

		arg_33_0.view.widgets.node1:setVisible(false)
		arg_33_0.view.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/weapon/weapon_" .. arg_33_1 .. ".png"):displayFrame())
		arg_33_0.view.widgets.name:setDisplayFrame(CCSprite:create("res/ui/common/text/weapon/reform/" .. var_0_5[arg_33_1].pic):displayFrame())
		arg_33_0.view.widgets.btn_start:setVisible(true)
		arg_33_0.view.widgets.btn_finish:setVisible(false)
		arg_33_0.view.widgets.btn_start:setEnabled(true)
		arg_33_0.view.widgets.info:setVisible(false)
		arg_33_0.view.widgets.info:removeAllChildrenWithCleanup(true)
		arg_33_0.view.widgets.icon:removeAllChildrenWithCleanup(true)

		for iter_34_0 = 1, 5 do
			local var_34_1 = arg_33_0.view.widgets["star" .. iter_34_0]

			var_34_1:setVisible(true)
			var_34_1:setPosition(ccp(420 + 15 * iter_34_0, 345))
		end

		arg_33_0.view.widgets.btn_start:addHandleOfControlEvent(function()
			log.info("btn_start")
			arg_33_0:clicked_chongzhuStart(arg_33_1)
		end, CCControlEventTouchUpInside)
		arg_33_0.view.widgets.btn_finish:addHandleOfControlEvent(function()
			log.info("btn_finish")
			arg_33_0.view.widgets.bg_reform:setVisible(false)
			arg_33_0:finishReform(arg_33_1)
		end, CCControlEventTouchUpInside)
		arg_33_0.view.widgets.bg_reform:setVisible(true)
	end

	cmgr.sendRequest(var_33_0, actions.weaponStartReform, arg_33_1)
end

function var_0_11.setIconTexture(arg_37_0, arg_37_1)
	local var_37_0

	if arg_37_1 <= 6 then
		local var_37_1 = arg_37_0.info.weapons[arg_37_1]
		local var_37_2 = arg_37_0.isTrueWeapon[arg_37_1]

		if var_37_1.open == true then
			if var_37_2 then
				var_37_0 = "res/ui/weapon/reform/weapon_true_" .. arg_37_1 .. ".jpg"
			else
				var_37_0 = "res/ui/weapon/weapon_" .. arg_37_1 .. ".png"
			end
		else
			var_37_0 = "res/ui/weapon/weapon_gray_" .. arg_37_1 .. ".png"
		end

		arg_37_0.view.widgets["weapon_light_" .. arg_37_1]:setVisible(var_37_2)
	else
		var_37_0 = "res/ui/weapon/godWeapon/weapon" .. arg_37_1 .. ".jpg"
	end

	if var_37_0 ~= nil then
		local var_37_3 = CCSprite:create(var_37_0)

		arg_37_0.view.widgets["weapon_icon_" .. arg_37_1]:setDisplayFrame(var_37_3:displayFrame())
	end
end

function var_0_11.showEffectFire(arg_38_0, arg_38_1)
	local var_38_0 = CCArray:create()

	for iter_38_0 = 1, 11 do
		local var_38_1 = CCSprite:create(string.format("res/ui/weapon/reform/bqgz_fire/bqgz_fire_%02d.png", iter_38_0)):displayFrame()

		var_38_0:addObject(var_38_1)
	end

	local var_38_2 = CCAnimation:createWithSpriteFrames(var_38_0, 0.1)
	local var_38_3 = CCAnimate:create(var_38_2)
	local var_38_4 = CCArray:create()

	var_38_4:addObject(var_38_3)

	local var_38_5 = CCSequence:create(var_38_4)
	local var_38_6 = CCRepeatForever:create(tolua.cast(var_38_5, "CCActionInterval"))

	arg_38_0.view.widgets["donghuaFire_" .. arg_38_1]:stopAllActions()
	arg_38_0.view.widgets["donghuaFire_" .. arg_38_1]:setVisible(true)
	arg_38_0.view.widgets["donghuaFire_" .. arg_38_1]:runAction(var_38_6)
end

function var_0_11.showEffectDazao(arg_39_0, arg_39_1)
	arg_39_0.view.widgets["node4_hammer" .. arg_39_1]:setVisible(true)
	arg_39_0.view.widgets["notOpen_" .. arg_39_1]:setVisible(false)
	arg_39_0.view.widgets["quantiIcon_" .. arg_39_1]:setVisible(false)
	arg_39_0.view.widgets["node2_collect" .. arg_39_1]:setVisible(false)
	arg_39_0.view.widgets["node3_make" .. arg_39_1]:setVisible(false)
	arg_39_0.view.widgets["node5_open" .. arg_39_1]:setVisible(false)

	local var_39_0 = CCArray:create()

	for iter_39_0 = 1, 4 do
		local var_39_1 = CCSprite:create("res/ui/weapon/donghuachui" .. iter_39_0 .. ".png"):displayFrame()

		var_39_0:addObject(var_39_1)
	end

	local var_39_2 = CCAnimation:createWithSpriteFrames(var_39_0, 0.1)
	local var_39_3 = CCAnimate:create(var_39_2)
	local var_39_4 = CCArray:create()

	var_39_4:addObject(var_39_3)

	local var_39_5 = CCSequence:create(var_39_4)
	local var_39_6 = CCRepeatForever:create(tolua.cast(var_39_5, "CCActionInterval"))

	arg_39_0.view.widgets["donghuaValue_" .. arg_39_1]:stopAllActions()
	arg_39_0.view.widgets["donghuaValue_" .. arg_39_1]:runAction(var_39_6)

	local var_39_7 = CCProgressTo:create(2, 100)
	local var_39_8 = CCCallFuncN:create(function()
		arg_39_0:refresh()
	end)
	local var_39_9 = CCArray:create()

	var_39_9:addObject(var_39_7)
	var_39_9:addObject(var_39_8)

	local var_39_10 = CCSequence:create(var_39_9)

	arg_39_0.view.widgets["dazaoBar_" .. arg_39_1]:stopAllActions()
	arg_39_0.view.widgets["dazaoBar_" .. arg_39_1]:runAction(var_39_10)
end

function var_0_11.showEffectReward(arg_41_0, arg_41_1)
	local var_41_0 = CCSprite:create()

	arg_41_0.view.widgets.btn_tip:addChild(var_41_0, 100)
	var_41_0:setPosition(ccp(60, 60))

	local var_41_1 = CCArray:create()

	for iter_41_0 = 1, 22 do
		local var_41_2 = CCSprite:createWithSpriteFrameName(string.format("light_seal_%02d.png", iter_41_0))

		var_41_1:addObject(var_41_2:displayFrame())
	end

	local var_41_3 = CCAnimation:createWithSpriteFrames(var_41_1, 0.08)
	local var_41_4 = CCAnimate:create(var_41_3)
	local var_41_5 = CCArray:create()

	var_41_5:addObject(var_41_4)
	var_41_5:addObject(CCCallFuncN:create(function(arg_42_0)
		if arg_41_1 then
			local function var_42_0(arg_43_0, arg_43_1)
				return arg_43_0.id > arg_43_1.id
			end

			table.sort(arg_41_1, var_42_0)

			for iter_42_0, iter_42_1 in ipairs(arg_41_1) do
				arg_41_0.lv = iter_42_1.lv

				if iter_42_1.id >= 1 and iter_42_1.id <= 10 then
					arg_41_0.smith = var_0_9[math.ceil(iter_42_1.id / 2)]

					roleDialogue.control.loadSpeak(1556)
				elseif iter_42_1.id == 11 then
					roleDialogue.control.loadSpeak(1557)

					if iter_42_1.lv == 50 then
						roleDialogue.control.loadSpeak(1560)
					end
				elseif iter_42_1.id == 12 then
					roleDialogue.control.loadSpeak(1559)
				end
			end
		end

		for iter_42_2 = 7, 9 do
			arg_41_0.view.widgets["btn_zhuzao_" .. iter_42_2]:setEnabled(true)
		end

		arg_42_0:removeFromParentAndCleanup(true)
	end))
	var_41_0:runAction(CCSequence:create(var_41_5))
end

function var_0_11.clicked_chongzhuStart(arg_44_0, arg_44_1)
	log.info("btn_点击铸造")
	arg_44_0.view.widgets.btn_start:setEnabled(false)

	local var_44_0 = CCArray:create()

	var_44_0:addObject(CCCallFuncN:create(function()
		arg_44_0.view.widgets.star1:runAction(CCMoveBy:create(0.5, ccp(25, -40)))
		arg_44_0.view.widgets.fire:setVisible(true)

		local var_45_0 = CCArray:create()

		var_45_0:addObject(CCScaleTo:create(0.3, 0.95))
		var_45_0:addObject(CCScaleTo:create(0.3, 1))
		arg_44_0.view.widgets.fire:runAction(CCRepeatForever:create(CCSequence:create(var_45_0)))
	end))
	var_44_0:addObject(CCDelayTime:create(0.1))
	var_44_0:addObject(CCCallFuncN:create(function()
		arg_44_0.view.widgets.star2:runAction(CCMoveBy:create(0.5, ccp(20, -40)))
	end))
	var_44_0:addObject(CCDelayTime:create(0.1))
	var_44_0:addObject(CCCallFuncN:create(function()
		arg_44_0.view.widgets.star3:runAction(CCMoveBy:create(0.5, ccp(15, -40)))
	end))
	var_44_0:addObject(CCDelayTime:create(0.1))
	var_44_0:addObject(CCCallFuncN:create(function()
		arg_44_0.view.widgets.star4:runAction(CCMoveBy:create(0.5, ccp(10, -40)))
	end))
	var_44_0:addObject(CCDelayTime:create(0.1))
	var_44_0:addObject(CCCallFuncN:create(function()
		local var_49_0 = CCArray:create()

		var_49_0:addObject(CCMoveBy:create(0.5, ccp(0, -40)))
		var_49_0:addObject(CCDelayTime:create(0.4))
		var_49_0:addObject(CCCallFuncN:create(function()
			arg_44_0.view.widgets.star1:setVisible(false)
			arg_44_0.view.widgets.star2:setVisible(false)
			arg_44_0.view.widgets.star3:setVisible(false)
			arg_44_0.view.widgets.star4:setVisible(false)
			arg_44_0.view.widgets.star5:setVisible(false)
		end))
		arg_44_0.view.widgets.star5:runAction(CCSequence:create(var_49_0))

		local var_49_1 = CCSprite:create()

		arg_44_0.view.widgets.icon:addChild(var_49_1)
		var_49_1:setPosition(ccp(36, 5))

		local var_49_2 = CCArray:create()

		var_49_2:addObject(CCDelayTime:create(0.5))

		local var_49_3 = CCArray:create()

		for iter_49_0 = 1, 7 do
			local var_49_4 = CCSprite:create(string.format("res/ui/weapon/reform/bqcz_casting/casting_%02d.png", iter_49_0)):displayFrame()

			var_49_3:addObject(var_49_4)
		end

		local var_49_5 = CCAnimation:createWithSpriteFrames(var_49_3, 0.15)

		var_49_2:addObject(CCAnimate:create(var_49_5))
		var_49_2:addObject(CCCallFuncN:create(function()
			arg_44_0.view.widgets.btn_start:setVisible(false)
			arg_44_0.view.widgets.btn_finish:setVisible(true)
			arg_44_0.view.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/weapon/reform/weapon_true_" .. arg_44_1 .. ".jpg"):displayFrame())
			arg_44_0.view.widgets.name:setDisplayFrame(CCSprite:create("res/ui/common/text/weapon/reform/" .. var_0_6[arg_44_1].pic):displayFrame())

			local var_51_0 = CCSprite:create()

			var_51_0:setScaleX(-1)
			arg_44_0.view.widgets.icon:addChild(var_51_0)
			var_51_0:setPosition(ccp(36, 36))

			local var_51_1 = CCArray:create()

			for iter_51_0 = 1, 16 do
				local var_51_2 = CCSprite:createWithSpriteFrameName("itemLight_" .. iter_51_0 .. ".png")

				var_51_1:addObject(var_51_2:displayFrame())
			end

			local var_51_3 = CCAnimation:createWithSpriteFrames(var_51_1, 0.08)
			local var_51_4 = CCAnimate:create(var_51_3)

			var_51_0:runAction(CCRepeatForever:create(var_51_4))

			local var_51_5 = CCSprite:create()

			arg_44_0.view.widgets.icon:addChild(var_51_5)
			var_51_5:setPosition(ccp(36, 36))

			local var_51_6 = rmgr.getAnimation("warlockUpgrade")
			local var_51_7 = CCAnimation:createWithSpriteFrames(var_51_6, 0.1)

			var_51_5:runAction(CCAnimate:create(var_51_7))

			local function var_51_8()
				arg_44_0.view.widgets.info:setVisible(true)
				var_0_10(arg_44_0.view.widgets.info, arg_44_1, arg_44_0.reformData[arg_44_1].totalPoint)
				arg_44_0.view.widgets.fire:setVisible(false)
			end

			arg_44_0:action_text_fly(arg_44_0.view.widgets.icon, arg_44_0.reformData[arg_44_1].numMax, arg_44_1, var_51_8)
		end))
		var_49_1:runAction(CCSequence:create(var_49_2))
	end))
	arg_44_0.view.widgets.star1:runAction(CCSequence:create(var_44_0))
end

function var_0_11.showEffectFuse(arg_53_0)
	for iter_53_0 = 1, 6 do
		local var_53_0, var_53_1 = arg_53_0.view.widgets["card" .. iter_53_0]:getPosition()
		local var_53_2 = CCSprite:create("res/ui/weapon/godWeapon/sbxt_white_mask.png")

		var_53_2:setPosition(ccp(var_53_0, var_53_1))
		var_53_2:setOpacity(0)
		var_53_2:setScale(0.8)
		arg_53_0.view.widgets.panel:addChild(var_53_2, 100)

		local var_53_3 = 0.5
		local var_53_4 = iter_53_0 <= 3 and (iter_53_0 - 1) * var_53_3 or (iter_53_0 - 4) * var_53_3
		local var_53_5 = CCFadeIn:create(var_53_3)
		local var_53_6 = CCScaleTo:create(var_53_3, 1)
		local var_53_7 = CCArray:create()

		var_53_7:addObject(CCDelayTime:create(var_53_4))
		var_53_7:addObject(CCEaseBounceOut:create(CCSpawn:createWithTwoActions(var_53_5, var_53_6)))

		if iter_53_0 == 6 then
			var_53_7:addObject(CCCallFuncN:create(function()
				arg_53_0.view.widgets.node1:setVisible(false)
			end))
		end

		var_53_7:addObject(CCDelayTime:create(2 * var_53_3 - var_53_4))
		var_53_7:addObject(CCMoveTo:create(var_53_3, ccp(457.5, var_53_1)))

		if iter_53_0 == 6 then
			var_53_7:addObject(CCCallFuncN:create(function()
				arg_53_0.view.widgets.node_steel:setVisible(false)
				arg_53_0.view.widgets.bg_info:setVisible(false)

				for iter_55_0 = 7, 9 do
					arg_53_0.view.widgets["card" .. iter_55_0]:setPositionX(475.5)
				end

				arg_53_0.view.widgets.node2:setVisible(true)
			end))
		end

		var_53_7:addObject(CCFadeOut:create(var_53_3))

		local var_53_8 = CCSequence:create(var_53_7)

		var_53_2:runAction(var_53_8)
	end

	for iter_53_1 = 7, 9 do
		local var_53_9 = arg_53_0.view.widgets["card" .. iter_53_1]
		local var_53_10, var_53_11 = var_53_9:getPosition()
		local var_53_12 = 0.5
		local var_53_13 = CCArray:create()

		var_53_13:addObject(CCDelayTime:create(5 * var_53_12))
		var_53_13:addObject(CCEaseSineOut:create(CCMoveTo:create(var_53_12, ccp(228.5, var_53_11))))

		if iter_53_1 == 9 then
			var_53_13:addObject(CCCallFuncN:create(function()
				arg_53_0.view.widgets.node_steel:setVisible(true)
				arg_53_0.view.widgets.bg_info:setVisible(true)
			end))
			var_53_13:addObject(CCDelayTime:create(var_53_12))
			var_53_13:addObject(CCCallFuncN:create(function()
				roleDialogue.control.loadSpeak(1558)
				roleDialogue.control.loadSpeak(1555)
			end))
		end

		local var_53_14 = CCSequence:create(var_53_13)

		var_53_9:runAction(var_53_14)
	end
end

function var_0_11.showEffectAttributeChg(arg_58_0, arg_58_1, arg_58_2)
	arg_58_2 = arg_58_2 == true

	local var_58_0 = CCSprite:create("res/ui/weapon/" .. (arg_58_2 and "mz1.png" or "mz4.png"))
	local var_58_1
	local var_58_2
	local var_58_3

	for iter_58_0, iter_58_1 in pairs(var_0_7) do
		if arg_58_1[iter_58_1.key] then
			var_58_2 = arg_58_1[iter_58_1.key]
			var_58_3 = arg_58_2 and iter_58_1.pic_gre or iter_58_1.pic_red

			break
		end
	end

	local var_58_4 = CCSprite:create("res/ui/weapon/" .. var_58_3)
	local var_58_5 = arg_58_2 and "general_attribute_jiahao.png" or "general_attribute_jianhao.png"
	local var_58_6 = CCSprite:create("res/ui/common/text/genealPanel/" .. var_58_5)
	local var_58_7 = arg_58_2 and "addAttributeNum.png" or "decreaseAttributeNum.png"
	local var_58_8 = CCLabelAtlas:create(tostring(var_58_2), "res/ui/common/number/" .. var_58_7, 29, 46, 48)

	var_58_8:setAnchorPoint(ccp(0.5, 0.5))

	local var_58_9 = createRichNode({
		var_58_0,
		var_58_4,
		var_58_6,
		var_58_8
	}, 0.5)

	arg_58_0:action_fly(var_58_9)
end

function var_0_11.action_fly(arg_59_0, arg_59_1)
	arg_59_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

	local var_59_0 = CCArray:create()

	var_59_0:addObject(CCMoveTo:create(0.8, ccp(visibleSize.width / 2, visibleSize.height * 0.6)))
	var_59_0:addObject(CCCallFuncN:create(function(arg_60_0)
		arg_60_0:removeFromParentAndCleanup(true)
	end))

	local var_59_1 = CCSequence:create(var_59_0)

	arg_59_1:runAction(var_59_1)
	arg_59_0.view.widgets.root:addChild(arg_59_1)
end

function var_0_11.action_text_fly(arg_61_0, arg_61_1, arg_61_2, arg_61_3, arg_61_4)
	for iter_61_0 = 1, arg_61_2 do
		local var_61_0 = var_0_10(arg_61_1, arg_61_3, arg_61_0.reformData[arg_61_3].basePoint)

		var_61_0:setVisible(false)

		local var_61_1 = CCArray:create()

		var_61_1:addObject(CCMoveBy:create(0, ccp(0, -15)))
		var_61_1:addObject(CCDelayTime:create(iter_61_0 * 0.4))
		var_61_1:addObject(CCShow:create())
		var_61_1:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
		var_61_1:addObject(CCCallFuncN:create(function(arg_62_0)
			arg_62_0:removeFromParentAndCleanup(true)
		end))
		var_61_1:addObject(CCCallFuncN:create(function()
			if iter_61_0 == arg_61_2 and arg_61_4 then
				arg_61_4()
			end
		end))
		var_61_1:addObject(CCFadeOut:create(1))

		local var_61_2 = CCSequence:create(var_61_1)

		var_61_0:runAction(var_61_2)
	end
end

function var_0_11.showGemPanel(arg_64_0, arg_64_1, arg_64_2)
	local var_64_0 = arg_64_2 <= 6 and arg_64_2 or arg_64_2 - 6
	local var_64_1 = arg_64_0.info.weapons[var_64_0].gems[arg_64_1]

	if var_64_1.gemId > 0 then
		local var_64_2 = arg_64_0.view.widgets[string.format("btn_gem%s_%s", arg_64_1, arg_64_2)]
		local var_64_3, var_64_4 = tool.getPositionInScreen(var_64_2)

		arg_64_0.gemPanel = diamond.ui.showTips_gem(var_64_1, var_64_3 + 220)
	end
end

function var_0_11.onBtnGemTap(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = arg_65_2 <= 6 and arg_65_2 or arg_65_2 - 6
	local var_65_1 = arg_65_0.info.weapons[var_65_0].gems[arg_65_1]

	if var_65_1.gemId == -2 then
		arg_65_0:onOpenSlot(arg_65_2)
	elseif var_65_1.gemId == -1 then
		smgr.showTipText(language.get(121058))
		amgr.playEffect(enumAudioFile.ui_click_error, false, true)
	elseif var_65_1.gemId == 0 then
		arg_65_0:getUnSetGems(arg_65_1, arg_65_2)
	elseif var_65_1.gemId > 0 then
		if var_65_1.gemId <= 5 then
			arg_65_0:onUnloadGem(var_65_1.gemId, arg_65_1, arg_65_2)
		elseif user.activity.haveGemsActivity or user.activity.haveGemRotaryEvent or user.activity.haveNewGemsActivity or user.activity.haveNewGemRotaryActivity or user.activity.haveSuperGemRotaryActivity then
			messageBox.confirm(language.get(135005), function()
				arg_65_0:onUnloadGem(var_65_1.gemId, arg_65_1, arg_65_2)
			end)
		else
			arg_65_0:onPreUnloadGem(var_65_1.gemId, arg_65_1, arg_65_2)
		end
	end
end

function var_0_11.showFdTip(arg_67_0)
	log.info("should show showFdTip ")

	local var_67_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_67_0:registerScriptTouchHandler(function(arg_68_0, arg_68_1, arg_68_2)
		if arg_68_0 == CCTOUCHBEGAN then
			return true
		elseif arg_68_0 == CCTOUCHMOVED then
			return true
		elseif arg_68_0 == CCTOUCHENDED then
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

	local var_67_4 = arg_67_0.view.widgets.btn_fd
	local var_67_5, var_67_6 = tool.getPositionInScreen(var_67_4)
	local var_67_7 = var_67_5
	local var_67_8 = var_67_6
	local var_67_9 = language.get(213403, arg_67_0.info.leftAccFeudNum)

	var_67_3.widgets.tipMsg:setString(var_67_9)

	local var_67_10 = var_67_3.widgets.tipMsg:getContentSize().width
	local var_67_11 = var_67_3.widgets.tipMsg:getContentSize().height

	var_67_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_67_10 + 30, var_67_11 + 30))
	var_67_3.widgets.tipFrame:setPosition(ccp(var_67_7, var_67_8))
	var_67_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_67_3.widgets.tipFrame:setVisible(true)
end

function var_0_11.showTip(arg_69_0, arg_69_1)
	log.info("should show tips ")

	local var_69_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_69_0:registerScriptTouchHandler(function(arg_70_0, arg_70_1, arg_70_2)
		if arg_70_0 == CCTOUCHBEGAN then
			return true
		elseif arg_70_0 == CCTOUCHMOVED then
			return true
		elseif arg_70_0 == CCTOUCHENDED then
			pcall(var_69_0.removeFromParentAndCleanup, var_69_0, true)

			return true
		end
	end, false, true)
	var_69_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_69_0, 60000)

	local var_69_1 = 0
	local var_69_2 = 0
	local var_69_3 = {}

	uiutil.initWidgets(var_69_3, arg_69_0.tipFrame)
	var_69_0:addChild(var_69_3.widgets.tipFrame)

	local var_69_4 = arg_69_1 and arg_69_0.view.widgets.btn_seal or arg_69_0.view.widgets.btn_tip
	local var_69_5, var_69_6 = tool.getPositionInScreen(var_69_4)
	local var_69_7 = var_69_5
	local var_69_8 = var_69_6
	local var_69_9 = arg_69_1 and language.get(75097, arg_69_0.info.leftFeudTimes) or string.gsub(arg_69_0.info.rewardIntro, "<br>", "\n")

	var_69_3.widgets.tipMsg:setString(var_69_9)

	local var_69_10 = var_69_3.widgets.tipMsg:getContentSize().width
	local var_69_11 = var_69_3.widgets.tipMsg:getContentSize().height

	var_69_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_69_10 + 30, var_69_11 + 30))
	var_69_3.widgets.tipFrame:setPosition(ccp(var_69_7, var_69_8))
	var_69_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_69_3.widgets.tipFrame:setVisible(true)
end

function var_0_11.createGemList(arg_71_0, arg_71_1, arg_71_2)
	local function var_71_0(arg_72_0, arg_72_1)
		log.info("cell touched at : ", arg_72_1:getIdx())

		local var_72_0 = arg_71_0.unSetGems[arg_72_1:getIdx() + 1]

		arg_71_0:onLoadGem(var_72_0.gemId, arg_71_1, arg_71_2, var_72_0.vId)
	end

	local function var_71_1(arg_73_0, arg_73_1)
		return 72, 90
	end

	local function var_71_2(arg_74_0, arg_74_1)
		local var_74_0 = arg_74_0:dequeueCell()

		if var_74_0 then
			var_74_0:removeAllChildrenWithCleanup(true)
		else
			var_74_0 = CCTableViewCell:new()
		end

		local var_74_1 = arg_71_0.unSetGems[arg_74_1 + 1]

		if var_74_1 then
			local var_74_2, var_74_3 = rmgr.getBaoshiFilePath(var_74_1.gemPic, var_74_1.gemLv)

			if var_74_2 ~= nil then
				local var_74_4 = CCSprite:create(var_74_2)

				var_74_4:setAnchorPoint(ccp(0, 0))
				var_74_4:setPosition(ccp(0, 0))
				var_74_0:addChild(var_74_4)

				if var_74_1.num > 1 then
					local var_74_5 = CCLabelTTF:create(var_74_1.num, "", 20)

					var_74_5:setAnchorPoint(ccp(1, 0))
					var_74_5:setPosition(ccp(70, 2))
					var_74_4:addChild(var_74_5)
				end

				local var_74_6 = 1 + (var_74_1.gemLv - 1) % 4

				for iter_74_0 = 1, var_74_6 do
					local var_74_7 = CCSprite:create("res/ui/weapon/xing.png")

					var_74_7:setPosition(18 * iter_74_0 - 9, 62)
					var_74_7:setScale(0.7)
					var_74_4:addChild(var_74_7)
				end
			end
		end

		return var_74_0
	end

	local function var_71_3()
		local var_75_0 = arg_71_0.unSetGems

		if var_75_0 and #var_75_0 > 0 then
			return #var_75_0
		else
			return 0
		end
	end

	local var_71_4 = CCTableView:create(CCSizeMake(474, 72))

	var_71_4:setPosition(30, 30)
	var_71_4:setDirection(kCCScrollViewDirectionHorizontal)
	var_71_4:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_71_0.view.widgets.bg_gemList:addChild(var_71_4)

	if arg_71_0.gemList then
		arg_71_0.gemList:removeFromParentAndCleanup(true)
	end

	arg_71_0.gemList = var_71_4

	var_71_4:registerScriptHandler(var_71_0, CCTableView.kTableCellTouched)
	var_71_4:registerScriptHandler(var_71_1, CCTableView.kTableCellSizeForIndex)
	var_71_4:registerScriptHandler(var_71_2, CCTableView.kTableCellSizeAtIndex)
	var_71_4:registerScriptHandler(var_71_3, CCTableView.kNumberOfCellsInTableView)
	var_71_4:reloadData()
end

function var_0_11.updateSingleWeapon(arg_76_0, arg_76_1)
	local var_76_0

	var_76_0 = arg_76_0.info.weaponRank == 2

	local var_76_1 = arg_76_0.info.isOpenTech == 1
	local var_76_2 = arg_76_1.open
	local var_76_3 = arg_76_1.id

	if var_76_1 and var_76_2 and arg_76_1.lv > 0 then
		for iter_76_0, iter_76_1 in ipairs(arg_76_1.gems) do
			local var_76_4 = arg_76_0.view.widgets[string.format("weapon_gem%s_%s", iter_76_1.pos, var_76_3)]
			local var_76_5 = arg_76_0.view.widgets[string.format("weapon_gem_bg%s_%s", iter_76_1.pos, var_76_3)]

			if var_76_4 and var_76_5 then
				var_76_4:removeAllChildrenWithCleanup(true)
				var_76_4:setVisible(false)

				if iter_76_1.gemId > 0 then
					local var_76_6, var_76_7 = rmgr.getBaoshiFilePath(iter_76_1.gemPic, iter_76_1.gemLv)

					if var_76_6 ~= nil then
						local var_76_8 = CCSprite:create(var_76_6)

						var_76_4:setDisplayFrame(var_76_8:displayFrame())
						var_76_4:setVisible(true)

						local var_76_9 = 1 + (iter_76_1.gemLv - 1) % 4

						for iter_76_2 = 1, var_76_9 do
							local var_76_10 = CCSprite:create("res/ui/weapon/xing.png")

							var_76_10:setPosition(18 * iter_76_2 - 9, 62)
							var_76_10:setScale(0.7)
							var_76_4:addChild(var_76_10)
						end
					end
				elseif iter_76_1.gemId == 0 then
					local var_76_11 = "res/ui/weapon/banshidi1.png"
					local var_76_12 = CCSprite:create(var_76_11)

					var_76_5:setDisplayFrame(var_76_12:displayFrame())
				elseif iter_76_1.gemId < 0 then
					local var_76_13 = "res/ui/weapon/baoshidi2.png"
					local var_76_14 = CCSprite:create(var_76_13)

					var_76_5:setDisplayFrame(var_76_14:displayFrame())
				end
			end
		end
	end

	local var_76_15 = language.get(var_0_7[arg_76_1.type].text) .. "+" .. arg_76_1.value + arg_76_1.gemValue

	arg_76_0.view.widgets["quantiValue_" .. var_76_3]:setString(var_76_15)
	arg_76_0:setIconTexture(var_76_3)

	local var_76_16 = var_0_7[arg_76_1.type].pic

	arg_76_0.view.widgets["quantiIcon_" .. var_76_3]:setDisplayFrame(CCSprite:create("res/ui/weapon/" .. var_76_16):displayFrame())
end

function var_0_11.showPanel(arg_77_0, arg_77_1)
	arg_77_0.info = arg_77_1

	if arg_77_1.forgeHammer then
		if arg_77_1.forgeHammer.hammer1 then
			arg_77_0.view.widgets.bjLb2:setString("x" .. arg_77_1.forgeHammer.hammer1)
			arg_77_0.view.widgets.bjNode2:setVisible(true)
		end

		if arg_77_1.forgeHammer.hammer2 then
			arg_77_0.view.widgets.bjLb4:setString("x" .. arg_77_1.forgeHammer.hammer2)
			arg_77_0.view.widgets.bjNode4:setVisible(true)
		end

		if arg_77_1.forgeHammer.hammer3 then
			arg_77_0.view.widgets.bjLb10:setString("x" .. arg_77_1.forgeHammer.hammer3)
			arg_77_0.view.widgets.bjNode10:setVisible(true)
		end
	else
		arg_77_0.view.widgets.bjNode2:setVisible(false)
		arg_77_0.view.widgets.bjNode4:setVisible(false)
		arg_77_0.view.widgets.bjNode10:setVisible(false)
	end

	user.weaponRank = arg_77_1.weaponRank

	local var_77_0 = arg_77_1.weaponRank == 2

	var_0_8 = var_77_0 and MAX_GOD_WEAPON_LV or 180

	if not arg_77_0.shouldShowEffectFuse then
		arg_77_0.view.widgets.node1:setVisible(not var_77_0)
		arg_77_0.view.widgets.node2:setVisible(var_77_0)
	end

	arg_77_0.view.widgets.bg_reform:setVisible(false)
	arg_77_0.view.widgets.bg_fuse:setVisible(false)

	if not var_77_0 then
		local var_77_1 = arg_77_1.isOpenTech == 1

		arg_77_0.isTrueWeapon = {}
		arg_77_0.hasReformBtnState = {}
		arg_77_0.reformData = {}

		for iter_77_0, iter_77_1 in ipairs(arg_77_1.weapons) do
			local var_77_2 = iter_77_1.id

			arg_77_0.isTrueWeapon[var_77_2] = false
			arg_77_0.hasReformBtnState[var_77_2] = 0

			local var_77_3 = arg_77_1.weapons[var_77_2]
			local var_77_4 = var_77_3.open

			arg_77_0.view.widgets["notOpen_" .. var_77_2]:setVisible(not var_77_4)
			arg_77_0.view.widgets["name_" .. var_77_2]:setVisible(var_77_4)
			arg_77_0.view.widgets["quantiIcon_" .. var_77_2]:setVisible(false)
			arg_77_0.view.widgets["node2_collect" .. var_77_2]:setVisible(false)
			arg_77_0.view.widgets["node3_make" .. var_77_2]:setVisible(false)
			arg_77_0.view.widgets["node4_hammer" .. var_77_2]:setVisible(false)
			arg_77_0.view.widgets["node5_open" .. var_77_2]:setVisible(false)

			if var_77_4 then
				if var_77_3.lv <= 0 then
					if var_77_3.num < var_77_3.maxNum then
						arg_77_0.view.widgets["map_percent_" .. var_77_2]:setString(language.get(390478, var_77_3.num, var_77_3.maxNum))
						arg_77_0.view.widgets["node2_collect" .. var_77_2]:setVisible(true)
					else
						arg_77_0.view.widgets["quantiIcon_" .. var_77_2]:setVisible(true)

						local var_77_5 = true

						for iter_77_2, iter_77_3 in ipairs(var_77_3.resources) do
							local var_77_6 = arg_77_0.view.widgets[string.format("cost2_icon%sValue_%s", iter_77_2, var_77_2)]

							var_77_6:setString(var_77_3.resources[1].value)
							var_77_6:setColor(iter_77_3.fulfill and ccc3(255, 255, 255) or ccc3(255, 0, 0))

							var_77_5 = var_77_5 and iter_77_3.fulfill
						end

						arg_77_0.view.widgets["btn_dazao_" .. var_77_2]:setEnabled(var_77_5)
						arg_77_0.view.widgets["node3_make" .. var_77_2]:setVisible(true)
					end
				else
					arg_77_0.view.widgets["quantiIcon_" .. var_77_2]:setVisible(true)
					arg_77_0.view.widgets["donghuaFire_" .. var_77_2]:setVisible(false)

					if var_77_3.hasReformBtn then
						arg_77_0.hasReformBtnState[var_77_2] = var_77_3.reformStars ~= 5 and var_77_3.reformTimes and 1 or 2
					end

					if arg_77_0.hasReformBtnState[var_77_2] ~= 2 and var_77_3.lv >= 100 then
						arg_77_0.isTrueWeapon[var_77_2] = true
					end

					local var_77_7 = var_77_3.lv >= var_0_8

					arg_77_0.view.widgets["lvValue_" .. var_77_2]:setString(var_77_7 and language.get(121074) or var_77_3.lv)

					local var_77_8 = var_0_0

					if var_77_7 or var_77_3.lv >= user.player.playerLv and not arg_77_1.infiniteLv then
						var_77_8 = var_0_2
					end

					arg_77_0.view.widgets["lvValue_" .. var_77_2]:setColor(var_77_8)
					arg_77_0.view.widgets["fullLv_" .. var_77_2]:setVisible(var_77_7)
					arg_77_0.view.widgets["btn_zhuzao_" .. var_77_2]:setVisible(not var_77_7)
					arg_77_0.view.widgets["btn_name_zhuzao_" .. var_77_2]:setVisible(not var_77_7)

					local var_77_9 = math.floor(100 * var_77_3.times / var_77_3.totalTimes)

					if var_77_3.hasReformBtn then
						var_77_9 = 100
					end

					arg_77_0.view.widgets["zhuzaoBar_" .. var_77_2]:setPercentage(var_77_9)
					arg_77_0.view.widgets["zhuzaoPercent_" .. var_77_2]:setString(tostring(var_77_9) .. "%")
					arg_77_0.view.widgets["cost_value_" .. var_77_2]:setString(var_77_3.upgradeCost)

					if user.player.iron < var_77_3.upgradeCost then
						arg_77_0.view.widgets["cost_value_" .. var_77_2]:setColor(ccc3(255, 0, 0))
					else
						arg_77_0.view.widgets["cost_value_" .. var_77_2]:setColor(ccc3(255, 255, 255))
					end

					arg_77_0.view.widgets["btn_gem1_" .. var_77_2]:setVisible(var_77_1)
					arg_77_0:updateSingleWeapon(var_77_3)

					if var_77_3.lv >= 50 and var_77_3.lv <= 100 then
						if not var_77_3.reformStars then
							var_77_3.reformStars = 0
						end

						if var_77_3.reformStars and var_77_3.reformStars >= 0 and not arg_77_0.isTrueWeapon[var_77_2] then
							arg_77_0.view.widgets["star1_" .. var_77_2]:setVisible(true)

							for iter_77_4 = 1, 5 do
								local var_77_10

								if iter_77_4 <= var_77_3.reformStars then
									var_77_10 = CCSprite:create("res/ui/weapon/xing.png")
								else
									var_77_10 = CCSprite:create("res/ui/weapon/xing_dark.png")
								end

								arg_77_0.view.widgets["star" .. iter_77_4 .. "_" .. var_77_2]:setDisplayFrame(var_77_10:displayFrame())
							end
						else
							arg_77_0.view.widgets["star1_" .. var_77_2]:setVisible(false)
						end

						if arg_77_0.hasReformBtnState[var_77_2] == 0 then
							arg_77_0.view.widgets["btn_zhuzao_" .. var_77_2]:setVisible(true)
							arg_77_0.view.widgets["btn_reform_" .. var_77_2]:setVisible(false)
							arg_77_0.view.widgets["btn_name_zhuzao_" .. var_77_2]:setString(language.get(121017))
						else
							arg_77_0:showEffectFire(var_77_2)
							arg_77_0.view.widgets["btn_zhuzao_" .. var_77_2]:setVisible(false)
							arg_77_0.view.widgets["btn_reform_" .. var_77_2]:setVisible(true)
							arg_77_0.view.widgets["cost_icon_" .. var_77_2]:setVisible(false)
							arg_77_0.view.widgets["cost_value_" .. var_77_2]:setVisible(false)

							arg_77_0.reformData[var_77_2] = {
								num = 0
							}

							local var_77_11 = language.get(arg_77_0.hasReformBtnState[var_77_2] == 1 and 121053 or 121054)

							arg_77_0.view.widgets["btn_name_zhuzao_" .. var_77_2]:setString(var_77_11)
						end
					end

					arg_77_0.view.widgets["node5_open" .. var_77_2]:setVisible(true)
				end
			else
				arg_77_0.view.widgets["introungot_" .. var_77_2]:setString(var_77_3.introungot)
			end

			local var_77_12 = arg_77_0.isTrueWeapon[var_77_2] and var_0_6[var_77_2].pic or var_0_5[var_77_2].pic

			arg_77_0.view.widgets["name_" .. var_77_2]:setDisplayFrame(CCSprite:create("res/ui/common/text/weapon/reform/" .. var_77_12):displayFrame())
		end

		if arg_77_1.canFuse and arg_77_1.weapons[1].lv > 0 then
			roleDialogue.control.loadSpeak(1554)
			arg_77_0.view.widgets.bg_fuse:setVisible(true)

			for iter_77_5 = 1, 6 do
				arg_77_0.view.widgets["btn_gem1_" .. iter_77_5]:setEnabled(false)
			end
		end
	else
		local var_77_13
		local var_77_14 = ""
		local var_77_15 = math.min(arg_77_1.weapons[1].lv, arg_77_1.weapons[2].lv, arg_77_1.weapons[3].lv)

		if var_77_15 >= 40 and var_77_15 < 50 then
			var_77_13 = "huany_dt.jpg"
		elseif var_77_15 >= 90 and var_77_15 < 100 then
			var_77_13 = "huany_juli.jpg"
			var_77_14 = language.get(121087)
		elseif var_77_15 >= 100 and var_77_15 < 120 then
			var_77_13 = "huany_hbq.jpg"
			var_77_14 = language.get(121086)
		elseif var_77_15 >= 120 and var_77_15 < 150 then
			var_77_13 = "huany_xz.jpg"
			var_77_14 = language.get(121088)
		elseif var_77_15 >= 150 and var_77_15 < 160 then
			var_77_13 = "seal.jpg"
			var_77_14 = language.get(1210902)
		elseif var_77_15 >= 160 and var_77_15 < 180 then
			var_77_13 = "huany_tj.jpg"
			var_77_14 = language.get(121089)
		elseif var_77_15 >= 180 and var_77_15 < 190 then
			var_77_13 = "seal.jpg"
			var_77_14 = language.get(1210903)
		elseif var_77_15 >= 190 and var_77_15 < 200 then
			var_77_13 = "huany_xz.jpg"
			var_77_14 = language.get(1210901)
		elseif var_77_15 >= 200 and var_77_15 < 220 then
			var_77_13 = "huany_hbq.jpg"
			var_77_14 = language.get(1210904)
		else
			var_77_13 = "seal.jpg"
		end

		arg_77_0.view.widgets.icon_reward:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/" .. var_77_13):displayFrame())

		if var_77_15 >= MAX_GOD_WEAPON_LV then
			arg_77_1.fullLv = true
		end

		if arg_77_1.fullLv then
			var_77_14 = language.get(121081)

			for iter_77_6, iter_77_7 in ipairs(arg_77_1.weapons) do
				arg_77_0.view.widgets["weapon_light_" .. iter_77_7.id]:setVisible(true)
			end
		elseif arg_77_1.reward and #arg_77_1.reward > 0 then
			local function var_77_16(arg_78_0, arg_78_1)
				return arg_78_0.id > arg_78_1.id
			end

			table.sort(arg_77_1.reward, var_77_16)

			local var_77_17 = arg_77_1.reward[1]

			if var_77_17.id == 11 then
				var_77_14 = language.get(121082, var_77_17.lv)
			elseif var_77_17.id == 12 then
				-- block empty
			end
		end

		arg_77_1.maxLvNum = 0

		for iter_77_8, iter_77_9 in ipairs(arg_77_1.weapons) do
			local var_77_18 = iter_77_9.lv > 0 and iter_77_9.lv % 10 == 0

			if not arg_77_1.fullLv then
				local var_77_19 = arg_77_1.reward[1]

				var_77_18 = var_77_18 and var_77_15 < iter_77_9.lv

				if var_77_18 then
					arg_77_1.maxLvNum = 1 + arg_77_1.maxLvNum
				end
			end

			arg_77_0.view.widgets["weapon_light_" .. iter_77_9.id]:setVisible(var_77_18)
		end

		arg_77_0.view.widgets.lbl_reward:setString(var_77_14)
		arg_77_0.view.widgets.weapon_light_10:setVisible(arg_77_1.fullLv)

		local var_77_20 = type(arg_77_1.rewardIntro) == "string" and #arg_77_1.rewardIntro > 0

		if arg_77_1.fullLv then
			var_77_20 = false
		end

		arg_77_0.view.widgets.btn_tip:setEnabled(var_77_20)

		local var_77_21 = var_77_15 >= 100 and type(arg_77_1.leftFeudTimes) == "number"

		arg_77_0.view.widgets.btn_seal:setVisible(var_77_21)

		if var_77_21 then
			arg_77_0.view.widgets.leftFeudTimes:setString(arg_77_1.leftFeudTimes)
		end

		arg_77_0.view.widgets.btn_fd:setVisible(var_77_15 >= 100)
		arg_77_0.view.widgets.feudAccNumTimes:setString(arg_77_1.leftAccFeudNum or 0)

		local var_77_22

		var_77_22 = arg_77_1.isOpenTech == 1

		arg_77_0.view.widgets.num:setString(arg_77_1.gang)

		local var_77_23 = var_0_0

		if arg_77_1.gangMaxNum and arg_77_1.gang >= arg_77_1.gangMaxNum then
			var_77_23 = ccc3(255, 0, 0)
		end

		arg_77_0.view.widgets.num:setColor(var_77_23)

		for iter_77_10, iter_77_11 in ipairs(arg_77_1.weapons) do
			local var_77_24 = iter_77_11.id
			local var_77_25 = iter_77_11.lv >= var_0_8

			arg_77_0.view.widgets["lvValue_" .. var_77_24]:setString(var_77_25 and language.get(121074) or iter_77_11.lv)
			arg_77_0.view.widgets["lvValue_" .. var_77_24]:setColor(var_77_25 and var_0_2 or var_0_0)
			arg_77_0.view.widgets["btn_zhuzao_" .. var_77_24]:setVisible(not var_77_25)

			local var_77_26 = math.floor(100 * iter_77_11.times / iter_77_11.totalTimes)

			if iter_77_11.hasReformBtn then
				var_77_26 = 100
			end

			arg_77_0.view.widgets["zhuzaoBar_" .. var_77_24]:setPercentage(var_77_26)
			arg_77_0.view.widgets["zhuzaoPercent_" .. var_77_24]:setString(tostring(var_77_26) .. "%")
			arg_77_0.view.widgets["cost_value_" .. var_77_24]:setString(iter_77_11.upgradeCost)

			if arg_77_1.gang < iter_77_11.upgradeCost then
				arg_77_0.view.widgets["cost_value_" .. var_77_24]:setColor(ccc3(255, 0, 0))
			else
				arg_77_0.view.widgets["cost_value_" .. var_77_24]:setColor(ccc3(255, 255, 255))
			end

			arg_77_0:updateSingleWeapon(iter_77_11)

			local var_77_27 = var_0_5[var_77_24].pic

			arg_77_0.view.widgets["name_" .. var_77_24]:setDisplayFrame(CCSprite:create("res/ui/weapon/godWeapon/" .. var_77_27):displayFrame())
		end
	end

	if arg_77_0.shouldShowEffectFuse then
		arg_77_0.shouldShowEffectFuse = false

		arg_77_0:showEffectFuse()
	end

	if var_77_0 and (arg_77_1.specialId == 2 or arg_77_1.specialId == 4) then
		arg_77_1.specialLimit = 0
	end

	globalAction_updateSpecialEffect(arg_77_1.specialId, arg_77_1.specialLimit, arg_77_1.specialMulti, arg_77_1.cd)

	if arg_77_1.cd and arg_77_1.cd > 0 then
		if arg_77_0.isZhuzao then
			arg_77_0.isZhuzao = nil
		else
			local var_77_28

			if arg_77_1.cd > 3600000 then
				var_77_28 = language.get(131082, tool.formatTime(arg_77_1.cd, "@H"))
			elseif arg_77_1.cd > 60000 then
				var_77_28 = language.get(131083, tool.formatTime(arg_77_1.cd, "@M"))
			else
				var_77_28 = language.get(131084, tool.formatTime(arg_77_1.cd, "@S"))
			end

			smgr.showTipTextGreen(var_77_28)
		end
	end
end

function var_0_11.ctor(arg_79_0, arg_79_1, arg_79_2)
	log.info("@@ 兵器")
	rmgr.loadResource("res/anim/weapon/itemLightBig.plist")
	rmgr.loadResource("res/anim/sdtj/itemLight.plist")
	rmgr.loadResource("res/ui/weapon/godWeapon/lightSeal.plist")
	require("lua/layer/weaponTab/diamond/ui")
	require("lua/layer/activity/activityTab/ui")

	arg_79_0.view = {}

	uiutil.initWidgets(arg_79_0.view, arg_79_0.layout)

	if arg_79_1 then
		arg_79_0:addChild(arg_79_0.view.widgets.root)
		arg_79_1:addChild(arg_79_0)
	end

	for iter_79_0 = 1, 6 do
		uiutil.initWidgets(arg_79_0.view, arg_79_0:getLayout_singleWeapon(iter_79_0))
		arg_79_0.view.widgets.node1:addChild(arg_79_0.view.widgets["card" .. iter_79_0])
		arg_79_0.view.widgets["btn_buy_" .. iter_79_0]:addHandleOfControlEvent(function()
			log.info("btn_buy_" .. iter_79_0)
			arg_79_0:onBuyItem(iter_79_0)
		end, CCControlEventTouchUpInside)
		arg_79_0.view.widgets["btn_drop_" .. iter_79_0]:addHandleOfControlEvent(function()
			log.info("btn_drop_" .. iter_79_0)

			local var_81_0 = {}

			var_81_0[1] = "instance:4:8"
			var_81_0[2] = "instance:5:1"
			var_81_0[3] = "instance:5:3"
			var_81_0[4] = "instance:8:1"
			var_81_0[5] = "instance:8:3"
			var_81_0[6] = "instance:8:5"

			guide.control.loadGuideByMarkTrace(var_81_0[tonumber(iter_79_0)])
		end, CCControlEventTouchUpInside)
		arg_79_0.view.widgets["btn_dazao_" .. iter_79_0]:addHandleOfControlEvent(function()
			log.info("btn_dazao_" .. iter_79_0)
			arg_79_0:onUpgrade(iter_79_0)
		end, CCControlEventTouchUpInside)
		arg_79_0.view.widgets["btn_zhuzao_" .. iter_79_0]:addHandleOfControlEvent(function()
			log.info("btn_zhuzao_" .. iter_79_0)
			arg_79_0:onUpgrade(iter_79_0)
		end, CCControlEventTouchUpInside)
		arg_79_0.view.widgets["btn_reform_" .. iter_79_0]:addHandleOfControlEvent(function()
			log.info("btn_reform_" .. iter_79_0)

			if arg_79_0.hasReformBtnState[iter_79_0] == 1 then
				arg_79_0:onGaizao(iter_79_0)
			elseif arg_79_0.hasReformBtnState[iter_79_0] == 2 then
				arg_79_0:onChongzhu(iter_79_0)
			end
		end, CCControlEventTouchUpInside)

		local var_79_0 = "btn_gem1_" .. iter_79_0
		local var_79_1 = arg_79_0.view.widgets[var_79_0]

		var_79_1:addHandleOfControlEvent(function()
			log.info("%s TouchDown", var_79_0)
			arg_79_0:showGemPanel(1, iter_79_0)
		end, CCControlEventTouchDown)
		var_79_1:addHandleOfControlEvent(function()
			log.info("%s TouchUpInside", var_79_0)

			if arg_79_0.gemPanel then
				arg_79_0.gemPanel:removeFromParentAndCleanup(true)

				arg_79_0.gemPanel = nil
			end

			arg_79_0:onBtnGemTap(1, iter_79_0)
		end, CCControlEventTouchUpInside)
		var_79_1:addHandleOfControlEvent(function()
			log.info("%s TouchUpOutside", var_79_0)

			if arg_79_0.gemPanel then
				arg_79_0.gemPanel:removeFromParentAndCleanup(true)

				arg_79_0.gemPanel = nil
			end
		end, CCControlEventTouchUpOutside)
	end

	for iter_79_1 = 7, 9 do
		uiutil.initWidgets(arg_79_0.view, arg_79_0:getLayout_singleGodWeapon(iter_79_1))
		arg_79_0.view.widgets.node2:addChild(arg_79_0.view.widgets["card" .. iter_79_1])
		arg_79_0.view.widgets["btn_zhuzao_" .. iter_79_1]:addHandleOfControlEvent(function()
			log.info("btn_zhuzao_" .. iter_79_1)
			arg_79_0:onUpgrade(iter_79_1)
		end, CCControlEventTouchUpInside)

		for iter_79_2 = 1, 2 do
			local var_79_2 = string.format("btn_gem%s_%s", iter_79_2, iter_79_1)
			local var_79_3 = arg_79_0.view.widgets[var_79_2]

			var_79_3:addHandleOfControlEvent(function()
				log.info("%s TouchDown", var_79_2)
				arg_79_0:showGemPanel(iter_79_2, iter_79_1)
			end, CCControlEventTouchDown)
			var_79_3:addHandleOfControlEvent(function()
				log.info("%s TouchUpInside", var_79_2)

				if arg_79_0.gemPanel then
					arg_79_0.gemPanel:removeFromParentAndCleanup(true)

					arg_79_0.gemPanel = nil
				end

				arg_79_0:onBtnGemTap(iter_79_2, iter_79_1)
			end, CCControlEventTouchUpInside)
			var_79_3:addHandleOfControlEvent(function()
				log.info("%s TouchUpOutside", var_79_2)

				if arg_79_0.gemPanel then
					arg_79_0.gemPanel:removeFromParentAndCleanup(true)

					arg_79_0.gemPanel = nil
				end
			end, CCControlEventTouchUpOutside)
		end
	end

	for iter_79_3 = 1, 10 do
		local var_79_4 = arg_79_0.view.widgets["weapon_light_" .. iter_79_3]
		local var_79_5 = CCArray:create()

		for iter_79_4 = 1, 32 do
			local var_79_6 = CCSprite:createWithSpriteFrameName("itemLightBig_" .. iter_79_4 .. ".png")

			var_79_5:addObject(var_79_6:displayFrame())
		end

		local var_79_7 = CCAnimation:createWithSpriteFrames(var_79_5, 0.04)
		local var_79_8 = CCAnimate:create(var_79_7)

		var_79_4:runAction(CCRepeatForever:create(var_79_8))
		var_79_4:setVisible(false)
	end

	arg_79_0.view.widgets.btn_fuse:addHandleOfControlEvent(function()
		log.info("btn_fuse")
		arg_79_0:onFuse()
	end, CCControlEventTouchUpInside)
	arg_79_0.view.widgets.btn_melt:addHandleOfControlEvent(function()
		log.info("btn_melt")
		require("lua/layer/resource/ui")
		resourceUI.show(5)
	end, CCControlEventTouchUpInside)
	arg_79_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_79_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_79_0.view.widgets.btn_seal:addHandleOfControlEvent(function()
		log.info("btn_seal")
		arg_79_0:showTip(true)
	end, CCControlEventTouchUpInside)
	arg_79_0.view.widgets.btn_fd:addHandleOfControlEvent(function()
		log.info("btn_fd")
		arg_79_0:showFdTip()
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_79_0.view.widgets.bg_gem)
	arg_79_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		log.info("btn_close")
		arg_79_0.view.widgets.bg_gem:setVisible(false)
	end, CCControlEventTouchUpInside)

	arg_79_0.selectBjType = 0

	function updateSelectType(arg_98_0)
		if arg_98_0 == 2 then
			arg_79_0.selectBjType = 1
		end

		if arg_98_0 == 4 then
			arg_79_0.selectBjType = 2
		end

		if arg_98_0 == 10 then
			arg_79_0.selectBjType = 3
		end
	end

	function getBjTypeBySelect(arg_99_0)
		if arg_99_0 == 1 then
			return 2
		end

		if arg_99_0 == 2 then
			return 4
		end

		if arg_99_0 == 3 then
			return 10
		end
	end

	function onTouchBJ(arg_100_0)
		log.info("====================onTouchBJ=======================", arg_100_0, arg_79_0.selectBjType)

		local var_100_0 = arg_79_0.view.widgets["bjLight" .. arg_100_0]:isVisible()
		local var_100_1 = false

		arg_79_0.view.widgets.bjLight2:setVisible(false)
		arg_79_0.view.widgets.bjLight4:setVisible(false)
		arg_79_0.view.widgets.bjLight10:setVisible(false)

		if getBjTypeBySelect(arg_79_0.selectBjType) ~= arg_100_0 then
			arg_79_0.view.widgets["bjLight" .. arg_100_0]:setVisible(true)
			updateSelectType(arg_100_0)

			var_100_1 = true
		elseif var_100_0 == false then
			arg_79_0.view.widgets["bjLight" .. arg_100_0]:setVisible(true)
			updateSelectType(arg_100_0)

			var_100_1 = true
		end

		if var_100_1 == false then
			arg_79_0.selectBjType = 0
		end
	end

	function handlerParam(arg_101_0, arg_101_1)
		return function(...)
			return arg_101_0(arg_101_1, ...)
		end
	end

	arg_79_0.view.widgets.bjBtn2:addHandleOfControlEvent(handlerParam(onTouchBJ, 2), CCControlEventTouchUpInside)
	arg_79_0.view.widgets.bjBtn4:addHandleOfControlEvent(handlerParam(onTouchBJ, 4), CCControlEventTouchUpInside)
	arg_79_0.view.widgets.bjBtn10:addHandleOfControlEvent(handlerParam(onTouchBJ, 10), CCControlEventTouchUpInside)
	arg_79_0:refresh()
end

function var_0_11.onEnter(arg_103_0)
	function arg_103_0.godWeaponRewardRef()
		return {
			lv = arg_103_0.lv,
			smith = arg_103_0.smith
		}
	end

	eventManager.registerEvent("godWeaponReward", arg_103_0.godWeaponRewardRef)
end

function var_0_11.onExit(arg_105_0)
	eventManager.unregisterEvent("godWeaponReward", arg_105_0.godWeaponRewardRef)
end

return var_0_11
