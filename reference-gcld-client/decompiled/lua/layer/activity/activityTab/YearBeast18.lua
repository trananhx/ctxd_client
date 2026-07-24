local var_0_0 = {
	{
		pic = "xcdns_word_scns.png",
		txt = 215851
	},
	{
		pic = "xcdns_word_jnns.png",
		txt = 215852
	},
	{
		pic = "xcdns_word_blgns.png",
		txt = 215853
	},
	{
		pic = "xcdns_word_bsns.png",
		txt = 215854
	},
	{
		pic = "xcdns_word_btns.png",
		txt = 215855
	},
	{
		pic = "xcdns_word_jlns.png",
		txt = 215856
	},
	{
		pic = "xcdns_word_jyns.png",
		txt = 215857
	},
	{
		pic = "xcdns_word_ytns.png",
		txt = 215858
	},
	{
		pic = "xcdns_word_mblns.png",
		txt = 215859
	}
}
local var_0_1 = {
	[116] = {
		pic = "res/ui/task/get_icon_silk.png",
		type = 55
	},
	[126] = {
		pic = "res/ui/resource/silkroad/sczldj_jn.png",
		type = 10030
	},
	[119] = {
		pic = "res/ui/weapon/godWeapon/sbxt_icon_blg.png",
		type = 10033
	},
	[21] = {
		pic = "res/ui/task/get_icon_gem.png",
		type = 7
	},
	[4] = {
		pic = "res/ui/task/get_icon_iron.png",
		type = 4
	},
	[113] = {
		pic = "res/ui/equip/quenching/acti_icon_xidfs.png",
		type = 2003
	},
	[5] = {
		pic = "res/ui/task/get_icon_exp.png",
		type = 6
	},
	[216] = {
		pic = "res/ui/weapon/machine/zc_yt_icon.png",
		type = 216
	},
	[42] = {
		pic = "res/ui/task/get_icon_mubingling.png",
		type = 5
	}
}
local var_0_2 = {
	[242] = {
		pic = "nhq.jpg",
		txt = 215834
	},
	[117] = {
		pic = "jinjibaoxi.jpg",
		txt = 215835
	},
	[125] = {
		pic = "zsl.jpg",
		txt = 215836
	},
	[245] = {
		pic = "sljbl.jpg",
		txt = 215837
	},
	[243] = {
		pic = "cjsk.jpg",
		txt = 215838
	},
	[244] = {
		pic = "ytbd.jpg",
		txt = 215839
	},
	[132] = {
		pic = "huany_hbq.jpg",
		txt = 215840
	},
	[151] = {
		pic = "lbf.jpg",
		txt = 215841
	},
	[219] = {
		pic = "jrcn.jpg",
		txt = 215864
	},
	[3] = {
		pic = "liang.jpg",
		txt = 215866
	},
	[139] = {
		pic = "gxl.jpg",
		txt = 215865
	}
}
local var_0_3 = colorQuality[0]
local var_0_4 = tool.hexToRgb("#D9EDC5")
local var_0_5 = ccc3(0, 255, 0)
local var_0_6 = colorQuality[5]
local var_0_7 = colorQuality[4]
local var_0_8 = colorQuality[2]
local var_0_9 = colorQuality[6]
local var_0_10 = {
	"fleeTime"
}
local var_0_11 = class("YearBeast18", function()
	return createBaseLayer()
end)

var_0_11.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 30,
			pic = {
				path = "res/ui/activity/yearBeast17/xcdns_bg.jpg"
			},
			children = {
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/yearBeast17/xcdns_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 470,
					type = "label",
					x = 705,
					color = var_0_6
				},
				{
					name = "btn_tip",
					style = "button_tip",
					y = 480,
					type = "button",
					x = 840
				},
				{
					y = 3,
					name = "ScrollView",
					type = "scrollview",
					x = 3,
					viewSize = CCSizeMake(909, 428),
					children = {
						{
							y = 0,
							x = 0,
							type = "node",
							children = {
								{
									zoomOnTouchDown = true,
									name = "btn_beast1",
									h = 200,
									type = "button",
									w = 280,
									y = 200,
									x = 435,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 120,
											name = "beast1",
											x = 135,
											type = "sprite"
										}
									}
								},
								{
									zoomOnTouchDown = true,
									name = "btn_beast2",
									h = 140,
									type = "button",
									w = 220,
									y = 180,
									x = 620,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 70,
											name = "beast2",
											x = 110,
											type = "sprite"
										}
									}
								},
								{
									type = "sprite",
									name = "bg_city",
									y = 70,
									visible = false,
									x = 454.5,
									pic = {
										path = "res/ui/activity/moonCake/ybds_word_bg.png"
									},
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_city",
											h = 60,
											type = "button",
											w = 300,
											y = 29,
											x = 267,
											normal = {
												path = "res/default.png"
											},
											touched = {
												path = "res/default.png"
											},
											children = {
												{
													fontSize = 24,
													name = "cityName",
													y = 30,
													type = "label",
													x = 150,
													color = var_0_5
												}
											}
										}
									}
								},
								{
									anchorPointX = 0.5,
									name = "richLine_state",
									type = "richLine",
									visible = false,
									y = 380,
									scale = 0.8,
									x = 454.5,
									content = {
										{
											type = "sprite",
											name = "richLine_state_p1"
										},
										{
											type = "sprite",
											name = "richLine_state_p2"
										}
									}
								},
								{
									anchorPointX = 0.5,
									name = "richLine_fleeTime",
									type = "richLine",
									visible = false,
									y = 380,
									x = 454.5,
									content = {
										{
											text = "0",
											name = "richLine_fleeTime_p1",
											startCharMap = 47,
											type = "atlaslabel",
											itemWidth = 35,
											pic = "res/ui/common/number/yxhd_time_digit.png",
											itemHeight = 34,
											anchorPoint = ccp(0.5, 0.5)
										},
										{
											name = "richLine_fleeTime_p2",
											type = "sprite",
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_word_htz.png"
											}
										}
									}
								},
								{
									anchorPointX = 0.5,
									name = "richLine_smBeastTimes",
									type = "richLine",
									visible = false,
									y = 380,
									x = 454.5,
									content = {
										{
											name = "richLine_smBeastTimes_p1",
											type = "sprite",
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_word_zz.png"
											}
										},
										{
											text = "0",
											name = "richLine_smBeastTimes_p2",
											startCharMap = 47,
											type = "atlaslabel",
											itemWidth = 35,
											pic = "res/ui/common/number/yxhd_time_digit.png",
											itemHeight = 34,
											anchorPoint = ccp(0.5, 0.5)
										},
										{
											name = "richLine_smBeastTimes_p3",
											type = "sprite",
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_word_chtz.png"
											}
										}
									}
								},
								{
									y = 380,
									name = "node_spReward",
									type = "node",
									x = 795,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_spReward",
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
													name = "icon_spReward",
													x = 40,
													type = "sprite"
												},
												{
													y = 40,
													x = 40,
													type = "sprite",
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_icon_mask.png"
													}
												},
												{
													type = "sprite",
													name = "recv_spReward",
													y = 40,
													visible = false,
													x = 40,
													pic = {
														path = "res/ui/activity/zongzi/dwsl_seal_ylq.png"
													}
												}
											}
										},
										{
											y = -60,
											x = 6,
											type = "sprite",
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_jrzb_ink.png"
											}
										},
										{
											y = -60,
											x = 0,
											type = "sprite",
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_word_jrzb.png"
											}
										}
									}
								},
								{
									type = "node",
									name = "node_buff",
									y = 220,
									visible = false,
									x = 795,
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_buff",
											h = 88,
											type = "button",
											w = 88,
											y = 0,
											x = 0,
											normal = {
												path = "res/ui/activity/yearBeast17/xcdns_sbjl_bar_bg.png"
											},
											touched = {
												path = "res/ui/activity/yearBeast17/xcdns_sbjl_bar_bg.png"
											},
											children = {
												{
													y = 44,
													x = 44,
													type = "sprite",
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_icon_lantern.png"
													}
												},
												{
													fontSize = 24,
													name = "buffTimes",
													y = 30,
													type = "label",
													x = 44,
													color = var_0_4
												},
												{
													x = 44,
													name = "bar_buff",
													y = 44,
													type = "progressbar",
													progressType = kCCProgressTimerTypeRadial,
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_sbjl_bar.png"
													}
												},
												{
													y = 0,
													name = "light",
													type = "sprite",
													x = 0,
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_sbjl_bar_light.png"
													}
												}
											}
										},
										{
											y = -55,
											x = 0,
											type = "sprite",
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_word_sbjl.png"
											}
										}
									}
								},
								{
									y = 60,
									name = "btn_bomb",
									h = 62,
									type = "button",
									w = 195,
									visible = false,
									x = 760,
									normal = {
										path = "res/ui/common/button/public_btn_green.png"
									},
									touched = {
										path = "res/ui/common/button/public_btn_green_c.png"
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
													y = 25,
													name = "icon_bomb",
													type = "sprite",
													x = 42,
													pic = {
														path = "res/ui/activity/ironRotary/yuanbao.png"
													}
												},
												{
													fontSize = 24,
													name = "bombNum",
													y = 15,
													type = "label",
													x = 42
												}
											}
										},
										{
											fontSize = 25,
											name = "doBtnLb",
											y = 33,
											type = "label",
											x = 125,
											textId = "215861_zww1",
											color = var_0_4
										}
									}
								},
								{
									y = 214,
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
											type = "button",
											name = "btn_pre",
											h = 50,
											rotate = -90,
											w = 50,
											y = 40,
											x = 260,
											normal = {
												path = "res/ui/common/button/gxb_btn_small.png"
											},
											touched = {
												path = "res/ui/common/button/gxb_btn_small_c.png"
											}
										},
										{
											type = "button",
											name = "btn_next",
											h = 50,
											rotate = 90,
											w = 50,
											y = 40,
											x = 380,
											normal = {
												path = "res/ui/common/button/gxb_btn_small.png"
											},
											touched = {
												path = "res/ui/common/button/gxb_btn_small_c.png"
											}
										},
										{
											y = 40,
											type = "sprite9",
											x = 320,
											preferedSize = CCSizeMake(72, 36),
											middleRect = CCRectMake(10, 10, 10, 10),
											pic = {
												path = "res/ui/activity/dragonBoat/sdsxq_jibie_bg.png"
											},
											children = {
												{
													fontSize = 24,
													name = "pageNo",
													y = 18,
													type = "label",
													x = 36
												}
											}
										},
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
											y = 245,
											name = "title_list",
											type = "sprite",
											x = 26,
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_list_title_shphb.png"
											}
										},
										{
											type = "button",
											name = "btn_show",
											h = 50,
											rotate = -90,
											w = 50,
											y = 95,
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
										},
										{
											y = 310,
											type = "sprite9",
											x = 52,
											anchorPoint = ccp(0, 0),
											preferedSize = CCSizeMake(532, 44),
											middleRect = CCRectMake(0, 0, 532, 44),
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_list_01.png"
											}
										},
										{
											y = 264,
											type = "sprite9",
											x = 52,
											anchorPoint = ccp(0, 0),
											preferedSize = CCSizeMake(532, 44),
											middleRect = CCRectMake(0, 0, 532, 44),
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_list_02.png"
											}
										},
										{
											y = 218,
											type = "sprite9",
											x = 52,
											anchorPoint = ccp(0, 0),
											preferedSize = CCSizeMake(532, 44),
											middleRect = CCRectMake(0, 0, 532, 44),
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_list_01.png"
											}
										},
										{
											y = 172,
											type = "sprite9",
											x = 52,
											anchorPoint = ccp(0, 0),
											preferedSize = CCSizeMake(532, 44),
											middleRect = CCRectMake(0, 0, 532, 44),
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_list_02.png"
											}
										},
										{
											y = 126,
											type = "sprite9",
											x = 52,
											anchorPoint = ccp(0, 0),
											preferedSize = CCSizeMake(532, 44),
											middleRect = CCRectMake(0, 0, 532, 44),
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_list_01.png"
											}
										},
										{
											y = 80,
											type = "sprite9",
											x = 52,
											anchorPoint = ccp(0, 0),
											preferedSize = CCSizeMake(532, 44),
											middleRect = CCRectMake(0, 0, 532, 44),
											pic = {
												path = "res/ui/activity/muNiu/mnlm_phb_list_02.png"
											}
										},
										{
											type = "sprite",
											name = "no_beast",
											y = 220,
											visible = false,
											x = 320,
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_word_nsswlx.png"
											}
										},
										{
											y = 0,
											name = "node_list",
											x = 0,
											type = "node"
										}
									}
								}
							}
						}
					}
				},
				{
					y = 217,
					type = "sprite",
					x = 50,
					pic = {
						path = "res/ui/activity/yearBeast17/xcdns_bar_di.png"
					},
					children = {
						{
							y = 193,
							type = "sprite",
							x = 42,
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_bar_bg.png"
							},
							children = {
								{
									y = 165,
									name = "bar",
									type = "progressbar",
									x = 22,
									pic = {
										path = "res/ui/activity/yearBeast17/xcdns_bar.png"
									}
								},
								{
									y = 330,
									x = 22,
									type = "node",
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_bar1",
											h = 80,
											type = "button",
											w = 80,
											y = 5,
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
													name = "sp1",
													type = "sprite",
													x = 40,
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_icon_ns_head.png"
													}
												}
											}
										},
										{
											y = -30,
											name = "bg_time1",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_time_di.png"
											},
											children = {
												{
													fontSize = 22,
													text = "10:00",
													y = 21,
													type = "label",
													x = 43
												}
											}
										}
									}
								},
								{
									y = 165,
									x = 22,
									type = "node",
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_bar2",
											h = 80,
											type = "button",
											w = 80,
											y = 5,
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
													name = "sp2",
													type = "sprite",
													x = 40,
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_icon_ns_head.png"
													}
												}
											}
										},
										{
											y = -30,
											name = "bg_time2",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_time_di.png"
											},
											children = {
												{
													fontSize = 22,
													text = "15:00",
													y = 21,
													type = "label",
													x = 43
												}
											}
										}
									}
								},
								{
									y = 0,
									x = 22,
									type = "node",
									children = {
										{
											zoomOnTouchDown = true,
											name = "btn_bar3",
											h = 80,
											type = "button",
											w = 80,
											y = 5,
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
													name = "sp3",
													type = "sprite",
													x = 44,
													pic = {
														path = "res/ui/activity/yearBeast17/xcdns_icon_ns_head_d.png"
													}
												}
											}
										},
										{
											y = -30,
											name = "bg_time3",
											type = "sprite",
											x = 0,
											pic = {
												path = "res/ui/activity/yearBeast17/xcdns_time_di.png"
											},
											children = {
												{
													fontSize = 22,
													text = "20:00",
													y = 21,
													type = "label",
													x = 43
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
					type = "sprite",
					name = "bg_spReward",
					y = 217,
					visible = false,
					x = 457.5,
					pic = {
						path = "res/ui/activity/yearBeast17/xcdns_word_zb_bg.png"
					},
					children = {
						{
							zoomOnTouchDown = true,
							name = "btn_back",
							h = 50,
							type = "button",
							w = 104,
							y = 396,
							x = 850,
							normal = {
								path = "res/ui/juben/jubenLevelSelect/btn_jb_back_n.png"
							},
							touched = {
								path = "res/ui/juben/jubenLevelSelect/btn_jb_back_h.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "bg_reward",
					type = "sprite9",
					y = 217,
					x = 458,
					preferedSize = CCSizeMake(700, 400),
					middleRect = CCRectMake(220, 30, 6, 7),
					pic = {
						path = "res/ui/saotao/stfx_word_bg.png"
					},
					children = {
						{
							w = 940,
							h = 440,
							zoomOnTouchDown = true,
							type = "button",
							y = 200,
							x = 350,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							}
						},
						{
							y = 215,
							x = 350,
							type = "sprite",
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_word_zb_light.png"
							}
						},
						{
							y = 350,
							x = 350,
							type = "sprite",
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_word_jbnshdhy.png"
							}
						},
						{
							y = 208,
							type = "sprite",
							rotate = 38,
							x = 352,
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_list_icon_pz.png"
							}
						},
						{
							y = 210,
							x = 340,
							type = "sprite",
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_list_icon_pz.png"
							}
						},
						{
							fontSize = 30,
							name = "unrecBomb",
							y = 174,
							type = "label",
							x = 395,
							color = var_0_7
						},
						{
							name = "btn_recBomb",
							h = 62,
							type = "button",
							w = 195,
							y = 60,
							x = 350,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 33,
									type = "label",
									x = 98,
									textId = 92013,
									color = var_0_4
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
	anchorPoint = ccp(0, 1),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			name = "tipMsg",
			height = 0,
			type = "label",
			width = 0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}
var_0_11.layout_btn = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			scale = 0.8,
			y = 0,
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/activity/yearBeast17/xcdns_word_zb_light.png"
			}
		},
		{
			zoomOnTouchDown = true,
			name = "btn",
			h = 104,
			type = "button",
			w = 104,
			y = 0,
			x = 0,
			normal = {
				path = "res/ui/activity/yearBeast17/xcdns_icon_di_round.png"
			},
			touched = {
				path = "res/ui/activity/yearBeast17/xcdns_icon_di_round.png"
			}
		},
		{
			name = "num",
			type = "atlaslabel",
			pic = "res/ui/common/number/gphb_word_digit.png",
			startCharMap = 48,
			text = "0",
			y = 44,
			itemWidth = 28,
			x = -44,
			itemHeight = 33,
			anchorPoint = ccp(0.5, 0.5)
		},
		{
			type = "sprite",
			name = "received",
			y = 0,
			visible = false,
			x = 0,
			pic = {
				path = "res/ui/activity/zongzi/dwsl_seal_ylq.png"
			}
		}
	}
}
var_0_11.layout_list = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			type = "sprite",
			name = "rank1st",
			y = 0,
			visible = false,
			x = 54,
			pic = {
				path = "res/ui/kfyz/yuyue/kfyz_word_bs.png"
			}
		},
		{
			type = "sprite",
			name = "bg_rank",
			y = 0,
			visible = false,
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
					color = var_0_7
				}
			}
		},
		{
			fontSize = 24,
			name = "name",
			y = 0,
			type = "label",
			x = 202,
			color = var_0_4
		},
		{
			y = 0,
			name = "icon1",
			x = 314,
			type = "sprite"
		},
		{
			fontSize = 22,
			name = "num1",
			type = "label",
			y = 0,
			x = 342,
			anchorPoint = ccp(0, 0.5),
			color = var_0_7
		},
		{
			type = "sprite",
			name = "bg_icon2",
			y = 0,
			visible = false,
			x = 476,
			pic = {
				path = "res/ui/activity/muNiu/mnlm_icon_bg.png"
			},
			children = {
				{
					fontSize = 22,
					name = "num2",
					type = "label",
					y = 16,
					x = 40,
					anchorPoint = ccp(0, 0.5),
					color = var_0_4
				}
			}
		}
	}
}

function var_0_11.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getYearBeast17)
end

function var_0_11.onGetSpRewInfo(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		arg_4_0.spRewList = var_5_0.spRewList

		arg_4_0.view.widgets.bg_spReward:setVisible(true)

		for iter_5_0, iter_5_1 in ipairs(var_5_0.spRewList) do
			if arg_4_0.view.widgets["received" .. iter_5_0] then
				local var_5_1 = iter_5_1.reward

				arg_4_0.view.widgets["received" .. iter_5_0]:setVisible(var_5_1.received == 1)

				if not arg_4_0.haveSpRewInfo then
					local var_5_2 = CCSprite:createWithSpriteFrameName(var_0_2[var_5_1.type].pic)
					local var_5_3 = tool.getRoundIcon(var_5_2, 72)

					var_5_3:setPosition(52, 52)
					arg_4_0.view.widgets["btn_spReward" .. iter_5_0]:addChild(var_5_3)
				end
			end
		end

		arg_4_0.haveSpRewInfo = true
	end

	cmgr.sendRequest(var_4_0, actions.getSpRewInfo)
end

function var_0_11.onGetDmgCharts(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0)
		arg_6_0:setList(arg_7_0.action.data)
	end

	cmgr.sendRequest(var_6_0, actions.getDmgCharts, arg_6_1)
end

function var_0_11.onGetRwdCharts(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		arg_8_0:setList(arg_9_0.action.data)
	end

	cmgr.sendRequest(var_8_0, actions.getRwdCharts, arg_8_1)
end

function var_0_11.onGetReward(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0)
		local var_11_0 = arg_11_0.action.data

		if arg_10_1 == 0 then
			arg_10_0:showEffectBomb(var_11_0)
		elseif arg_10_1 == 1 then
			local var_11_1 = {}
			local var_11_2 = {}

			var_11_2.id = 100101
			var_11_2.value = var_11_0.recvBomb

			table.insert(var_11_1, var_11_2)
			globalAction_gotResource(var_11_1)
			arg_10_0:refresh()
		elseif arg_10_1 == 2 then
			-- block empty
		elseif arg_10_1 == 3 then
			local var_11_3 = {}
			local var_11_4 = {}

			var_11_4.id = 10021
			var_11_4.value = 1

			table.insert(var_11_3, var_11_4)
			globalAction_gotResource(var_11_3)
		end
	end

	local var_10_1 = 0

	if arg_10_1 == 0 and arg_10_0.idx_beast == 2 then
		var_10_1 = 1
	end

	if arg_10_1 == 0 then
		if arg_10_0.info.bombNum == 0 and arg_10_0.idx_beast == 1 then
			messageBox.showChargeWin("", language.get(215860, arg_10_0.info.bombCost), "buyFirework", function()
				cmgr.sendRequest(var_10_0, actions.getYearBeast17Reward, arg_10_1, var_10_1)
			end)
		elseif arg_10_0.info.smallBombNum == 0 and arg_10_0.idx_beast == 2 then
			messageBox.showChargeWin("", language.get(215862, arg_10_0.info.smallBombCost), "smallFirework", function()
				cmgr.sendRequest(var_10_0, actions.getYearBeast17Reward, arg_10_1, var_10_1)
			end)
		else
			cmgr.sendRequest(var_10_0, actions.getYearBeast17Reward, arg_10_1, var_10_1)
		end
	else
		cmgr.sendRequest(var_10_0, actions.getYearBeast17Reward, arg_10_1, var_10_1)
	end
end

function var_0_11.showEffectBomb(arg_14_0, arg_14_1)
	if arg_14_0.thunderNode then
		arg_14_0.thunderNode:removeAllChildrenWithCleanup(true)
	else
		arg_14_0.thunderNode = CCNode:create()

		arg_14_0.view.widgets.root:addChild(arg_14_0.thunderNode, 100)
	end

	local var_14_0 = arg_14_0.idx_beast == 1
	local var_14_1, var_14_2 = tool.getPositionInScreen(arg_14_0.view.widgets[var_14_0 and "btn_beast1" or "btn_beast2"])

	local function var_14_3(arg_15_0)
		local var_15_0 = {
			ccc3(255, 255, 255),
			var_0_5,
			var_0_7,
			var_0_6,
			var_0_8
		}
		local var_15_1 = CCSprite:create()
		local var_15_2 = var_14_1 + math.random(-100, 100)
		local var_15_3 = var_14_2 + math.random(-50, 50)

		var_15_1:setPosition(ccp(var_15_2, var_15_3))
		arg_14_0.thunderNode:addChild(var_15_1)

		if arg_15_0 > #var_15_0 then
			arg_15_0 = 1
		end

		var_15_1:setColor(var_15_0[arg_15_0])
		var_15_1:setOpacity(150)

		local var_15_4 = CCArray:create()

		for iter_15_0 = 1, 14 do
			local var_15_5 = CCSprite:createWithSpriteFrameName(string.format("btkd_fire%02d.png", iter_15_0))

			var_15_4:addObject(var_15_5:displayFrame())
		end

		local var_15_6 = CCAnimation:createWithSpriteFrames(var_15_4, 0.1)
		local var_15_7 = CCAnimate:create(var_15_6)
		local var_15_8 = CCArray:create()

		var_15_8:addObject(var_15_7)
		var_15_8:addObject(CCCallFuncN:create(function()
			var_15_1:removeFromParentAndCleanup(true)
		end))

		local var_15_9 = CCSequence:create(var_15_8)

		var_15_1:runAction(var_15_9)
	end

	for iter_14_0 = 1, 6 do
		var_14_3(iter_14_0)
	end

	if arg_14_1.critical == 2 or arg_14_1.critical == 4 or arg_14_1.critical == 10 then
		local var_14_4 = "res/ui/activity/ironReward/js_bj_" .. arg_14_1.critical .. ".png"
		local var_14_5 = CCSprite:create(var_14_4)

		var_14_5:setPosition(var_14_1, var_14_2)
		arg_14_0.thunderNode:addChild(var_14_5, 200)

		local var_14_6 = CCArray:create()

		var_14_6:addObject(CCDelayTime:create(1))
		var_14_6:addObject(CCFadeOut:create(0.4))
		var_14_6:addObject(CCCallFunc:create(function()
			var_14_5:removeFromParentAndCleanup(true)
		end))

		local var_14_7 = CCSequence:create(var_14_6)

		var_14_5:runAction(var_14_7)
	end

	local var_14_8 = {}

	for iter_14_1, iter_14_2 in ipairs(arg_14_1.reward) do
		local var_14_9 = {
			id = var_0_1[iter_14_2.type].type,
			value = iter_14_2.num
		}

		table.insert(var_14_8, var_14_9)
	end

	globalAction_gotResource(var_14_8)

	if arg_14_1.spRewardRecv == 1 then
		arg_14_0:showEffectSpecialReward()
	end

	local var_14_10

	if tonumber(arg_14_0.info.buffTimes) == 0 and tonumber(arg_14_1.buffTimes) > 0 then
		var_14_10 = "xcdns_word_khks.png"
	end

	if tonumber(arg_14_0.info.buffTimes) > 0 and tonumber(arg_14_1.buffTimes) == 0 then
		var_14_10 = "xcdns_word_khjs.png"
	end

	if var_14_10 then
		local var_14_11 = CCSprite:create("res/ui/activity/yearBeast17/" .. var_14_10)
		local var_14_12, var_14_13 = tool.getPositionInScreen(arg_14_0.view.widgets.node_buff)

		var_14_11:setPosition(var_14_12, var_14_13)
		arg_14_0.thunderNode:addChild(var_14_11, 200)

		local var_14_14 = CCArray:create()

		var_14_14:addObject(CCMoveBy:create(0.4, ccp(0, 60)))
		var_14_14:addObject(CCDelayTime:create(0.4))
		var_14_14:addObject(CCFadeOut:create(0.4))
		var_14_14:addObject(CCCallFunc:create(function()
			var_14_11:removeFromParentAndCleanup(true)
		end))

		local var_14_15 = CCSequence:create(var_14_14)

		var_14_11:runAction(var_14_15)
	end

	if tonumber(arg_14_0.info.smBeastTimes) > 0 and arg_14_1.smBeastTimes == 0 then
		arg_14_0:showEffectArmy(arg_14_0.view.widgets.beast2, arg_14_0.animArrays2, "move")

		local var_14_16 = CCArray:create()

		var_14_16:addObject(CCMoveTo:create(1, ccp(1000, 500)))
		var_14_16:addObject(CCCallFunc:create(function()
			arg_14_0:showPanel(arg_14_1)
		end))

		local var_14_17 = CCSequence:create(var_14_16)

		arg_14_0.view.widgets.btn_beast2:runAction(var_14_17)
	else
		arg_14_0:showPanel(arg_14_1)
	end
end

function var_0_11.showEffectSpecialReward(arg_20_0, arg_20_1)
	local var_20_0 = false
	local var_20_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_20_1:registerScriptTouchHandler(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			return true
		elseif arg_21_0 == CCTOUCHMOVED then
			return true
		elseif arg_21_0 == CCTOUCHENDED then
			if not var_20_0 then
				return
			end

			pcall(var_20_1.removeFromParentAndCleanup, var_20_1, true)

			if arg_20_1 then
				arg_20_1()
			end

			return true
		end
	end, false, true)
	var_20_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_20_1, 60000)

	local var_20_2 = rmgr.getAnimation("treasureLight")
	local var_20_3 = CCAnimation:createWithSpriteFrames(var_20_2, 0.1)
	local var_20_4 = CCAnimate:create(var_20_3)
	local var_20_5 = CCSprite:create()

	var_20_5:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	var_20_1:addChild(var_20_5)
	var_20_5:runAction(CCRepeatForever:create(var_20_4))

	local var_20_6 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bx.png")

	var_20_6:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	var_20_1:addChild(var_20_6)

	local var_20_7 = CCSprite:create("res/ui/activity/yearBeast17/xcdns_word_gxhdjrzb.png")

	var_20_7:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60 - 60)
	var_20_1:addChild(var_20_7)
	var_20_7:setScale(0.2)

	local var_20_8 = CCArray:create()

	var_20_8:addObject(CCMoveBy:create(1, ccp(0, 60)))
	var_20_8:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
	var_20_8:addObject(CCScaleTo:create(0.05, 1, 1))
	var_20_8:addObject(CCCallFunc:create(function()
		var_20_0 = true
	end))

	local var_20_9 = CCSequence:create(var_20_8)

	var_20_7:runAction(var_20_9)
	var_20_7:runAction(CCScaleTo:create(0.5, 1, 1))
end

function var_0_11.showEffectArmy(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = arg_23_2[arg_23_3]
	local var_23_1 = CCAnimation:createWithSpriteFrames(var_23_0, 0.1)
	local var_23_2 = CCAnimate:create(var_23_1)

	arg_23_1:stopAllActions()
	arg_23_1:runAction(CCRepeatForever:create(var_23_2))
end

function var_0_11.setList(arg_24_0, arg_24_1)
	arg_24_0.view.widgets.node_list:removeAllChildrenWithCleanup(true)

	for iter_24_0, iter_24_1 in ipairs(arg_24_1.charts) do
		local var_24_0 = {}

		uiutil.initWidgets(var_24_0, arg_24_0.layout_list)
		var_24_0.widgets.node:setPosition(52, 378 - 46 * iter_24_0)
		arg_24_0.view.widgets.node_list:addChild(var_24_0.widgets.node)

		local var_24_1 = iter_24_1.seq == 1

		var_24_0.widgets.rank1st:setVisible(var_24_1)
		var_24_0.widgets.bg_rank:setVisible(not var_24_1)

		if not var_24_1 then
			var_24_0.widgets.rank:setString(iter_24_1.seq)
		end

		var_24_0.widgets.name:setString(iter_24_1.playerName)
		var_24_0.widgets.name:setColor(iter_24_1.playerName == user.player.name and var_0_7 or var_0_4)

		local var_24_2
		local var_24_3

		if iter_24_1.dmg then
			var_24_2 = "res/ui/activity/changbanSally/cbtw_btn_gj.png"
			var_24_3 = iter_24_1.dmg
		else
			var_24_2 = var_0_1[iter_24_1.reward.type].pic
			var_24_3 = iter_24_1.reward.num
		end

		var_24_0.widgets.icon1:setDisplayFrame(CCSprite:create(var_24_2):displayFrame())

		local var_24_4 = var_24_0.widgets.icon1:getContentSize()

		var_24_0.widgets.icon1:setScale(48 / var_24_4.width)
		var_24_0.widgets.num1:setString(tool.getFormatNum(var_24_3))

		local var_24_5
		local var_24_6

		if iter_24_1.dmg then
			var_24_5 = CCSprite:create("res/ui/activity/yearBeast17/xcdns_list_icon_pz2.png")
			var_24_6 = 1

			if iter_24_1.reward and iter_24_1.reward.num > 0 then
				var_24_0.widgets.num2:setString(language.get(135039, iter_24_1.reward.num))

				if iter_24_1.seq <= 3 then
					var_24_0.widgets.num2:setColor(var_0_9)
				end
			end
		elseif iter_24_1.spReward then
			var_24_5 = CCSprite:createWithSpriteFrameName(var_0_2[iter_24_1.spReward.type].pic)
			var_24_6 = 0.5
		end

		if var_24_5 then
			var_24_0.widgets.bg_icon2:setVisible(true)
			var_24_5:setScale(var_24_6)
			var_24_5:setPosition(24, 24)
			var_24_0.widgets.bg_icon2:addChild(var_24_5)
		end
	end

	arg_24_0.view.widgets.pageNo:setString(language.get(213297, arg_24_1.pageNo, arg_24_0.info.totalPage))

	arg_24_0.pageNo = arg_24_1.pageNo

	arg_24_0.view.widgets.btn_pre:setEnabled(arg_24_1.pageNo > 1)
	arg_24_0.view.widgets.btn_next:setEnabled(arg_24_1.pageNo < arg_24_0.info.totalPage)
end

function var_0_11.setBuffBar(arg_25_0)
	local var_25_0
	local var_25_1

	if arg_25_0.info.buffTimes and arg_25_0.info.buffTimes > 0 then
		var_25_0 = 100
		var_25_1 = arg_25_0.info.buffTimes
	else
		var_25_0 = 100 * (arg_25_0.info.totalTimes - arg_25_0.info.timesToBuff) / arg_25_0.info.totalTimes
		var_25_1 = ""
	end

	arg_25_0.view.widgets.buffTimes:setString(var_25_1)
	arg_25_0.view.widgets.bar_buff:setPercentage(var_25_0)

	local var_25_2 = 44 + 34 * math.cos(math.rad(var_25_0 * 3.6 + 90))
	local var_25_3 = 44 + 34 * math.sin(math.rad(var_25_0 * 3.6 + 90))

	arg_25_0.view.widgets.light:setPosition(var_25_2, var_25_3)
end

function var_0_11.setBtnBeast(arg_26_0)
	local var_26_0 = arg_26_0.idx_beast == 1

	arg_26_0.view.widgets.beast1:setColor(var_26_0 and ccc3(255, 255, 255) or var_0_3)
	arg_26_0.view.widgets.richLine_fleeTime:setVisible(var_26_0)
	arg_26_0.view.widgets.beast2:setColor(var_26_0 and var_0_3 or ccc3(255, 255, 255))
	arg_26_0.view.widgets.richLine_smBeastTimes:setVisible(not var_26_0)
	arg_26_0.view.widgets.node_buff:setVisible(var_26_0 and arg_26_0.info.state == 2)

	local var_26_1 = "res/ui/activity/yearBeast17/xcdns_list_icon_pz2.png"
	local var_26_2 = 1
	local var_26_3 = var_0_4

	if var_26_0 then
		arg_26_0.view.widgets.doBtnLb:setString(language.get("215861_zww1"))

		if arg_26_0.info.bombNum and arg_26_0.info.bombNum > 0 then
			var_26_1 = "res/ui/activity/yearBeast17/xcdns_list_icon_pz2.png"
			var_26_2 = arg_26_0.info.bombNum
			var_26_3 = var_0_4
		else
			var_26_1 = "res/ui/activity/ironRotary/yuanbao.png"
			var_26_2 = arg_26_0.info.bombCost
			var_26_3 = var_0_7
		end
	else
		arg_26_0.view.widgets.doBtnLb:setString(language.get("215861_zww2"))

		if arg_26_0.info.smallBombNum and arg_26_0.info.smallBombNum > 0 then
			var_26_1 = "res/ui/activity/yearBeast17/tfdz_icon_hand.png"
			var_26_2 = arg_26_0.info.smallBombNum
			var_26_3 = var_0_4
		else
			var_26_1 = "res/ui/activity/ironRotary/yuanbao.png"
			var_26_2 = arg_26_0.info.smallBombCost
			var_26_3 = var_0_7
		end
	end

	arg_26_0.view.widgets.icon_bomb:setDisplayFrame(CCSprite:create(var_26_1):displayFrame())
	arg_26_0.view.widgets.bombNum:setString(var_26_2)
	arg_26_0.view.widgets.bombNum:setColor(var_26_3)
end

function var_0_11.showTip(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	log.info("should show tips ")

	local var_27_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_27_0:registerScriptTouchHandler(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == CCTOUCHBEGAN then
			return true
		elseif arg_28_0 == CCTOUCHMOVED then
			return true
		elseif arg_28_0 == CCTOUCHENDED then
			pcall(var_27_0.removeFromParentAndCleanup, var_27_0, true)

			return true
		end
	end, false, true)
	var_27_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_27_0, 60000)

	local var_27_1 = 0
	local var_27_2 = 0
	local var_27_3 = {}

	uiutil.initWidgets(var_27_3, arg_27_0.tipFrame)
	var_27_0:addChild(var_27_3.widgets.tipFrame)

	local var_27_4, var_27_5 = tool.getPositionInScreen(arg_27_1)
	local var_27_6 = var_27_4
	local var_27_7 = var_27_5

	for iter_27_0 = 1, 7 do
		if arg_27_1 == arg_27_0.view.widgets["btn_spReward" .. iter_27_0] then
			if iter_27_0 ~= 2 then
				var_27_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
			end

			if iter_27_0 >= 5 then
				var_27_3.widgets.tipFrame:setAnchorPoint(ccp(1, 1))
			end
		end
	end

	if arg_27_1 == arg_27_0.view.widgets.btn_army then
		var_27_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
	end

	if arg_27_1 == arg_27_0.view.widgets.btn_buff then
		var_27_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
	end

	var_27_3.widgets.tipMsg:setString(arg_27_2)

	local var_27_8 = var_27_3.widgets.tipMsg:getContentSize().width
	local var_27_9 = var_27_3.widgets.tipMsg:getContentSize().height

	var_27_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_27_8 + 30, var_27_9 + 30))

	if arg_27_3 and arg_27_3 == 3 then
		var_27_6 = var_27_6 - 80
	end

	var_27_3.widgets.tipFrame:setPosition(ccp(var_27_6, var_27_7))
	var_27_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_27_3.widgets.tipFrame:setVisible(true)

	if arg_27_1 == arg_27_0.view.widgets.btn_tip then
		var_27_3.widgets.tipFrame:setAnchorPoint(ccp(1, 0.5))
		var_27_3.widgets.tipFrame:setPositionY(visibleSize.height / 2)

		if var_27_9 + 30 > visibleSize.height then
			var_27_3.widgets.tipFrame:setScale(visibleSize.height / (var_27_9 + 30))
		end
	end
end

function var_0_11.showPanel(arg_29_0, arg_29_1)
	arg_29_0.info = arg_29_1

	arg_29_0:showEffectArmy(arg_29_0.view.widgets.beast1, arg_29_0.animArrays1, "idle")
	arg_29_0:showEffectArmy(arg_29_0.view.widgets.beast2, arg_29_0.animArrays2, "idle")
	arg_29_0.view.widgets.icon_spReward:setDisplayFrame(tool.spriteFrameByName(var_0_2[arg_29_1.spReward.type].pic))
	arg_29_0.view.widgets.recv_spReward:setVisible(arg_29_1.spReward.recv == 2)
	arg_29_0.view.widgets.richLine_state:setVisible(false)
	arg_29_0.view.widgets.richLine_fleeTime:setVisible(false)
	arg_29_0.view.widgets.richLine_smBeastTimes:setVisible(false)
	arg_29_0.view.widgets.btn_beast1:setVisible(false)
	arg_29_0.view.widgets.btn_beast2:setVisible(false)
	arg_29_0.view.widgets.btn_beast1:setEnabled(false)
	arg_29_0.view.widgets.btn_beast2:setEnabled(false)
	arg_29_0.view.widgets.beast1:setColor(ccc3(255, 255, 255))
	arg_29_0.view.widgets.beast2:setColor(ccc3(255, 255, 255))
	arg_29_0.view.widgets.btn_beast2:stopAllActions()

	local var_29_0 = arg_29_1.state == 0
	local var_29_1 = arg_29_1.state == 1
	local var_29_2 = arg_29_1.state == 2

	arg_29_0.view.widgets.no_beast:setVisible(var_29_0)
	arg_29_0.view.widgets.pageNo:setVisible(not var_29_0)

	local var_29_3 = var_29_2 and "xcdns_list_title_sqphb.png" or "xcdns_list_title_shphb.png"

	arg_29_0.view.widgets.title_list:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/" .. var_29_3):displayFrame())
	arg_29_0.view.widgets.bg_city:setVisible(var_29_1)

	if var_29_0 then
		arg_29_0.view.widgets.btn_beast1:setVisible(true)
		arg_29_0.view.widgets.btn_beast1:setPosition(435, 200)
		arg_29_0.view.widgets.beast1:setColor(var_0_3)
		arg_29_0.view.widgets.richLine_state_p1:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/" .. var_0_0[arg_29_1.beastType].pic):displayFrame())
		arg_29_0.view.widgets.richLine_state_p2:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/xcdns_word_jjxl.png"):displayFrame())
		arg_29_0.view.widgets.richLine_state:setVisible(true)
		arg_29_0.view.widgets.richLine_state:reorder()
	end

	if var_29_1 then
		arg_29_0.view.widgets.btn_beast1:setVisible(true)
		arg_29_0.view.widgets.btn_beast1:setPosition(435, 200)
		arg_29_0.view.widgets.richLine_state_p1:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/" .. var_0_0[arg_29_1.beastType].pic):displayFrame())
		arg_29_0.view.widgets.richLine_state_p2:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/xcdns_word_snz.png"):displayFrame())
		arg_29_0.view.widgets.richLine_state:setVisible(true)
		arg_29_0.view.widgets.richLine_state:reorder()
		arg_29_0.view.widgets.cityName:setString(language.get(215830, arg_29_1.cityName))
	end

	arg_29_0.view.widgets.node_buff:setVisible(var_29_2)
	arg_29_0.view.widgets.btn_bomb:setVisible(var_29_2)

	if var_29_2 then
		if arg_29_1.beastNo == 3 and arg_29_1.smBeastTimes > 0 then
			arg_29_0.view.widgets.btn_beast1:setVisible(true)
			arg_29_0.view.widgets.btn_beast2:setVisible(true)
			arg_29_0.view.widgets.btn_beast1:setEnabled(true)
			arg_29_0.view.widgets.btn_beast2:setEnabled(true)
			arg_29_0.view.widgets.btn_beast1:setPosition(365, 200)
			arg_29_0.view.widgets.btn_beast2:setPosition(620, 180)
		else
			arg_29_0.view.widgets.btn_beast1:setVisible(true)
			arg_29_0.view.widgets.btn_beast1:setPosition(435, 200)
		end

		arg_29_0.view.widgets.richLine_fleeTime_p1:stopAllActions()

		local var_29_4 = CCArray:create()

		var_29_4:addObject(CCCallFuncN:create(function()
			if arg_29_1.fleeTime <= 0 then
				arg_29_0.view.widgets.richLine_fleeTime_p1:stopAllActions()
				arg_29_0:refresh()
			else
				arg_29_0.view.widgets.richLine_fleeTime_p1:setString(tool.formatTime(arg_29_0.info.fleeTime, "@H:@M:@S"))
			end
		end))
		var_29_4:addObject(CCDelayTime:create(0.5))

		local var_29_5 = CCSequence:create(var_29_4)

		arg_29_0.view.widgets.richLine_fleeTime_p1:runAction(CCRepeatForever:create(var_29_5))
		arg_29_0.view.widgets.richLine_fleeTime_p1:setString(tool.formatTime(arg_29_0.info.fleeTime, "@H:@M:@S"))
		arg_29_0.view.widgets.richLine_fleeTime:reorder()
		arg_29_0.view.widgets.richLine_smBeastTimes_p2:setString(tostring(arg_29_1.smBeastTimes))
		arg_29_0.view.widgets.richLine_smBeastTimes:reorder()

		arg_29_0.idx_beast = arg_29_0.idx_beast or 1

		if arg_29_1.smBeastTimes == 0 then
			arg_29_0.idx_beast = 1
		end

		arg_29_0:setBtnBeast()
		arg_29_0:setBuffBar()

		local var_29_6
		local var_29_7
		local var_29_8

		if arg_29_0.idx_beast == 1 then
			if arg_29_1.bombNum > 0 then
				var_29_6 = "res/ui/activity/yearBeast17/xcdns_list_icon_pz2.png"
				var_29_7 = arg_29_1.bombNum or 1
				var_29_8 = var_0_4
			else
				var_29_6 = "res/ui/activity/ironRotary/yuanbao.png"
				var_29_7 = arg_29_1.bombCost or 1
				var_29_8 = var_0_7
			end
		elseif arg_29_1.smallBombNum > 0 then
			var_29_6 = "res/ui/activity/yearBeast17/tfdz_icon_hand.png"
			var_29_7 = arg_29_1.smallBombNum or 1
			var_29_8 = var_0_4
		else
			var_29_6 = "res/ui/activity/ironRotary/yuanbao.png"
			var_29_7 = arg_29_1.smallBombCost or 1
			var_29_8 = var_0_7
		end

		arg_29_0.view.widgets.icon_bomb:setDisplayFrame(CCSprite:create(var_29_6):displayFrame())
		arg_29_0.view.widgets.bombNum:setString(var_29_7)
		arg_29_0.view.widgets.bombNum:setColor(var_29_8)
	end

	local var_29_9 = tonumber(arg_29_1.unrecBomb)

	arg_29_0.view.widgets.bg_reward:setVisible(var_29_9 > 0)

	if var_29_9 > 0 then
		arg_29_0.view.widgets.unrecBomb:setString(language.get(135039, var_29_9))
	end

	arg_29_0.view.widgets.bar:setPercentage(50 * (arg_29_1.beastNo - 1))

	for iter_29_0 = 1, 3 do
		arg_29_0.view.widgets["btn_bar" .. iter_29_0]:setEnabled(false)
		arg_29_0.view.widgets["sp" .. iter_29_0]:removeAllChildrenWithCleanup(true)
		arg_29_0.view.widgets["bg_time" .. iter_29_0]:setVisible(false)

		if iter_29_0 < arg_29_1.beastNo then
			tool.spriteToGray(arg_29_0.view.widgets["sp" .. iter_29_0])
		elseif iter_29_0 == arg_29_1.beastNo then
			if arg_29_1.state ~= 0 then
				-- block empty
			else
				arg_29_0.view.widgets["btn_bar" .. iter_29_0]:setEnabled(true)
				arg_29_0.view.widgets["bg_time" .. iter_29_0]:setVisible(true)
			end
		else
			arg_29_0.view.widgets["btn_bar" .. iter_29_0]:setEnabled(true)
			arg_29_0.view.widgets["bg_time" .. iter_29_0]:setVisible(true)
		end
	end

	if arg_29_1.fullReward == 1 then
		-- block empty
	end
end

function var_0_11.ctor(arg_31_0, arg_31_1, arg_31_2)
	log.info("@@ 新春年兽活动")
	rmgr.loadResource("res/ui/activity/ironMine/btkd_fire.plist")

	arg_31_0.view = {}

	uiutil.initWidgets(arg_31_0.view, arg_31_0.layout)

	arg_31_0.leftTime = arg_31_0.view.widgets.leftTime

	if arg_31_1 then
		arg_31_0:addChild(arg_31_0.view.widgets.root)
		arg_31_1:addChild(arg_31_0)
	end

	arg_31_0.view.widgets.ScrollView:setTouchEnabled(false)
	arg_31_0.view.widgets.bar:setMidpoint(ccp(0.5, 1))
	arg_31_0.view.widgets.bar:setBarChangeRate(ccp(0, 1))
	arg_31_0.view.widgets.bar_buff:setMidpoint(ccp(0.5, 0.5))
	arg_31_0.view.widgets.bar_buff:setBarChangeRate(ccp(0, 1))
	arg_31_0.view.widgets.bar_buff:setReverseProgress(true)

	local var_31_0 = CCArray:create()

	var_31_0:addObject(CCScaleTo:create(0.3, 1.5))
	var_31_0:addObject(CCScaleTo:create(0.3, 1))

	local var_31_1 = CCSequence:create(var_31_0)

	arg_31_0.view.widgets.light:runAction(CCRepeatForever:create(var_31_1))
	arg_31_0.view.widgets.btn_spReward:addHandleOfControlEvent(function()
		log.info("btn_spReward")
		arg_31_0:onGetSpRewInfo()
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		log.info("btn_back")
		arg_31_0.view.widgets.bg_spReward:setVisible(false)
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_31_0.view.widgets.bg_spReward)
	arg_31_0.view.widgets.btn_buff:addHandleOfControlEvent(function()
		log.info("btn_buff")

		local var_34_0

		if arg_31_0.info.buffTimes and arg_31_0.info.buffTimes > 0 then
			var_34_0 = language.get(215832, arg_31_0.info.buffTimes)
		else
			var_34_0 = language.get(215831, arg_31_0.info.totalTimes - arg_31_0.info.timesToBuff, arg_31_0.info.totalTimes)
		end

		arg_31_0:showTip(arg_31_0.view.widgets.btn_buff, var_34_0)
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_bomb:addHandleOfControlEvent(function()
		log.info("btn_bomb")
		arg_31_0:onGetReward(0)
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_31_0:showTip(arg_31_0.view.widgets.btn_tip, language.get(215833))
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		log.info("btn_show")

		local var_37_0 = arg_31_0.view.widgets.btn_show:getScale()

		log.info("scale", var_37_0)

		if var_37_0 > 0 then
			if arg_31_0.info.state == 1 then
				arg_31_0:onGetDmgCharts(1)
			elseif arg_31_0.info.state == 2 then
				arg_31_0:onGetRwdCharts(1)
			end
		end

		local var_37_1 = CCArray:create()

		var_37_1:addObject(CCMoveTo:create(0.5, ccp(var_37_0 > 0 and 613 or 1152, 214)))
		var_37_1:addObject(CCCallFuncN:create(function()
			arg_31_0.view.widgets.btn_show:setScale(-1 * var_37_0)
			arg_31_0.view.widgets.btn_show:setEnabled(true)
		end))

		local var_37_2 = CCSequence:create(var_37_1)

		arg_31_0.view.widgets.bg_list:runAction(var_37_2)
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_pre:addHandleOfControlEvent(function()
		log.info("btn_pre")

		arg_31_0.pageNo = arg_31_0.pageNo or 1

		if arg_31_0.pageNo > 1 then
			arg_31_0.pageNo = arg_31_0.pageNo - 1

			if arg_31_0.info.state == 1 then
				arg_31_0:onGetDmgCharts(arg_31_0.pageNo)
			elseif arg_31_0.info.state == 2 then
				arg_31_0:onGetRwdCharts(arg_31_0.pageNo)
			end
		end
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_next:addHandleOfControlEvent(function()
		log.info("btn_next")

		arg_31_0.pageNo = arg_31_0.pageNo or 1

		if arg_31_0.pageNo < arg_31_0.info.totalPage then
			arg_31_0.pageNo = arg_31_0.pageNo + 1

			if arg_31_0.info.state == 1 then
				arg_31_0:onGetDmgCharts(arg_31_0.pageNo)
			elseif arg_31_0.info.state == 2 then
				arg_31_0:onGetRwdCharts(arg_31_0.pageNo)
			end
		end
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_31_0.view.widgets.bg_list)

	for iter_31_0 = 1, 3 do
		local var_31_2 = arg_31_0.view.widgets["btn_bar" .. iter_31_0]

		var_31_2:addHandleOfControlEvent(function()
			log.info("btn_bar" .. iter_31_0)

			local var_41_0 = {
				215843,
				215844,
				215845
			}
			local var_41_1 = language.get(var_0_0[arg_31_0.info.monsterTypes[iter_31_0]].txt)
			local var_41_2 = language.get(var_0_0[arg_31_0.info.smBeastType].txt)

			arg_31_0:showTip(var_31_2, language.get(var_41_0[iter_31_0], var_41_1, var_41_2))
		end, CCControlEventTouchUpInside)
	end

	local var_31_3 = {
		ccp(192, 240),
		ccp(452, 240),
		ccp(712, 240),
		ccp(270, 120),
		ccp(670, 260),
		ccp(750, 120),
		ccp(830, 240)
	}

	for iter_31_1 = 1, 3 do
		local var_31_4 = {}

		uiutil.initWidgets(var_31_4, arg_31_0.layout_btn)
		var_31_4.widgets.node:setPosition(var_31_3[iter_31_1])
		arg_31_0.view.widgets.bg_spReward:addChild(var_31_4.widgets.node)
		var_31_4.widgets.num:setString(iter_31_1)
		var_31_4.widgets.btn:addHandleOfControlEvent(function()
			log.info("btn_spReward" .. iter_31_1)

			local var_42_0 = arg_31_0.spRewList[iter_31_1].reward

			arg_31_0:showTip(var_31_4.widgets.btn, language.get(var_0_2[var_42_0.type].txt), iter_31_1)
		end, CCControlEventTouchUpInside)

		arg_31_0.view.widgets["received" .. iter_31_1] = var_31_4.widgets.received
		arg_31_0.view.widgets["btn_spReward" .. iter_31_1] = var_31_4.widgets.btn
	end

	arg_31_0.view.widgets.btn_city:addHandleOfControlEvent(function()
		log.info("btn_city")
		loadingLayer.show(SCENE_WORLD, arg_31_0.info.cityId)
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_beast1:addHandleOfControlEvent(function()
		log.info("btn_beast1")

		arg_31_0.idx_beast = 1

		arg_31_0:setBtnBeast()
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_beast2:addHandleOfControlEvent(function()
		log.info("btn_beast2")

		arg_31_0.idx_beast = 2

		arg_31_0:setBtnBeast()
	end, CCControlEventTouchUpInside)
	arg_31_0.view.widgets.btn_recBomb:addHandleOfControlEvent(function()
		log.info("btn_recBomb")
		arg_31_0:onGetReward(1)
	end, CCControlEventTouchUpInside)

	arg_31_0.animArrays1 = rmgr.getArmy("def", 58)
	arg_31_0.animArrays2 = rmgr.getArmy("def", "58_1")

	arg_31_0:showPanel(arg_31_2)
end

function var_0_11.onEnter(arg_47_0)
	arg_47_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_47_0, arg_47_0.update), 0, false)
end

function var_0_11.onExit(arg_48_0)
	if arg_48_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_48_0.updateRef)
	end
end

function var_0_11.update(arg_49_0, arg_49_1)
	if arg_49_0.info then
		for iter_49_0, iter_49_1 in ipairs(var_0_10) do
			if arg_49_0.info[iter_49_1] then
				if arg_49_0.info[iter_49_1] > 0 then
					arg_49_0.info[iter_49_1] = arg_49_0.info[iter_49_1] - 1000 * arg_49_1
				elseif arg_49_0.info[iter_49_1] <= 0 then
					arg_49_0.info[iter_49_1] = 0
				end
			end
		end
	end
end

return var_0_11
