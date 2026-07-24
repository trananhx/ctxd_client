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
local var_0_11 = class("YearBeast17", function()
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
									h = 300,
									type = "button",
									w = 360,
									y = 200,
									x = 320,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											y = 160,
											name = "beast1",
											x = 190,
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
													y = 35,
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
											y = 33,
											type = "label",
											x = 125,
											textId = "215861_zww",
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
							y = 220,
							x = 453.5,
							type = "sprite",
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_word_zb_light.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_army",
							h = 140,
							type = "button",
							w = 140,
							y = 220,
							x = 453.5,
							normal = {
								path = "res/default.png"
							},
							touched = {
								path = "res/default.png"
							},
							children = {
								{
									y = 90,
									name = "army",
									x = 70,
									type = "sprite"
								},
								{
									y = 120,
									name = "light_army",
									x = 140,
									type = "sprite"
								}
							}
						},
						{
							y = 370,
							x = 453.5,
							type = "sprite",
							pic = {
								path = "res/ui/activity/yearBeast17/xcdns_word_hqrzbljxlvzszb.png"
							}
						},
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
						},
						{
							name = "btn_reward",
							h = 62,
							type = "button",
							w = 195,
							y = 60,
							x = 453.5,
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
									y = 33,
									type = "label",
									x = 98,
									textId = 92013
								}
							}
						},
						{
							w = 104,
							name = "btn1",
							h = 104,
							type = "button",
							y = 280,
							x = 80,
							normal = {
								path = "res/ui/activity/yearBeast17/xcdns_icon_di_round.png"
							},
							touched = {
								path = "res/ui/activity/yearBeast17/xcdns_icon_di_round.png"
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
			local var_5_1 = iter_5_1.reward

			arg_4_0.view.widgets["received" .. iter_5_0]:setVisible(var_5_1.received == 1)

			if not arg_4_0.haveSpRewInfo then
				local var_5_2 = CCSprite:createWithSpriteFrameName(var_0_2[var_5_1.type].pic)
				local var_5_3 = tool.getRoundIcon(var_5_2, 72)

				var_5_3:setPosition(52, 52)
				arg_4_0.view.widgets["btn_spReward" .. iter_5_0]:addChild(var_5_3)
			end
		end

		arg_4_0.haveSpRewInfo = true

		arg_4_0.view.widgets.btn_reward:setVisible(var_5_0.totalRecv ~= 2)
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

			var_11_2.id = 10049
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
			arg_10_0.view.widgets.btn_reward:setVisible(false)
		end
	end

	local var_10_1 = 0

	if arg_10_1 == 0 and arg_10_0.idx_beast == 2 then
		var_10_1 = 1
	end

	if arg_10_1 == 0 and arg_10_0.info.bombNum == 0 then
		messageBox.showChargeWin("", language.get(215860, arg_10_0.info.bombCost), "buyFirework", function()
			cmgr.sendRequest(var_10_0, actions.getYearBeast17Reward, arg_10_1, var_10_1)
		end)
	else
		cmgr.sendRequest(var_10_0, actions.getYearBeast17Reward, arg_10_1, var_10_1)
	end
end

function var_0_11.showEffectBomb(arg_13_0, arg_13_1)
	if arg_13_0.thunderNode then
		arg_13_0.thunderNode:removeAllChildrenWithCleanup(true)
	else
		arg_13_0.thunderNode = CCNode:create()

		arg_13_0.view.widgets.root:addChild(arg_13_0.thunderNode, 100)
	end

	local var_13_0 = arg_13_0.idx_beast == 1
	local var_13_1, var_13_2 = tool.getPositionInScreen(arg_13_0.view.widgets[var_13_0 and "btn_beast1" or "btn_beast2"])

	local function var_13_3(arg_14_0)
		local var_14_0 = {
			ccc3(255, 255, 255),
			var_0_5,
			var_0_7,
			var_0_6,
			var_0_8
		}
		local var_14_1 = CCSprite:create()
		local var_14_2 = var_13_1 + math.random(-100, 100)
		local var_14_3 = var_13_2 + math.random(-50, 50)

		var_14_1:setPosition(ccp(var_14_2, var_14_3))
		arg_13_0.thunderNode:addChild(var_14_1)

		if arg_14_0 > #var_14_0 then
			arg_14_0 = 1
		end

		var_14_1:setColor(var_14_0[arg_14_0])
		var_14_1:setOpacity(150)

		local var_14_4 = CCArray:create()

		for iter_14_0 = 1, 14 do
			local var_14_5 = CCSprite:createWithSpriteFrameName(string.format("btkd_fire%02d.png", iter_14_0))

			var_14_4:addObject(var_14_5:displayFrame())
		end

		local var_14_6 = CCAnimation:createWithSpriteFrames(var_14_4, 0.1)
		local var_14_7 = CCAnimate:create(var_14_6)
		local var_14_8 = CCArray:create()

		var_14_8:addObject(var_14_7)
		var_14_8:addObject(CCCallFuncN:create(function()
			var_14_1:removeFromParentAndCleanup(true)
		end))

		local var_14_9 = CCSequence:create(var_14_8)

		var_14_1:runAction(var_14_9)
	end

	for iter_13_0 = 1, 6 do
		var_13_3(iter_13_0)
	end

	if arg_13_1.critical == 2 or arg_13_1.critical == 4 or arg_13_1.critical == 10 then
		local var_13_4 = "res/ui/activity/ironReward/js_bj_" .. arg_13_1.critical .. ".png"
		local var_13_5 = CCSprite:create(var_13_4)

		var_13_5:setPosition(var_13_1, var_13_2)
		arg_13_0.thunderNode:addChild(var_13_5, 200)

		local var_13_6 = CCArray:create()

		var_13_6:addObject(CCDelayTime:create(1))
		var_13_6:addObject(CCFadeOut:create(0.4))
		var_13_6:addObject(CCCallFunc:create(function()
			var_13_5:removeFromParentAndCleanup(true)
		end))

		local var_13_7 = CCSequence:create(var_13_6)

		var_13_5:runAction(var_13_7)
	end

	local var_13_8 = {}

	for iter_13_1, iter_13_2 in ipairs(arg_13_1.reward) do
		local var_13_9 = {
			id = var_0_1[iter_13_2.type].type,
			value = iter_13_2.num
		}

		table.insert(var_13_8, var_13_9)
	end

	globalAction_gotResource(var_13_8)

	if arg_13_1.spRewardRecv == 1 then
		arg_13_0:showEffectSpecialReward()
	end

	local var_13_10

	if tonumber(arg_13_0.info.buffTimes) == 0 and tonumber(arg_13_1.buffTimes) > 0 then
		var_13_10 = "xcdns_word_khks.png"
	end

	if tonumber(arg_13_0.info.buffTimes) > 0 and tonumber(arg_13_1.buffTimes) == 0 then
		var_13_10 = "xcdns_word_khjs.png"
	end

	if var_13_10 then
		local var_13_11 = CCSprite:create("res/ui/activity/yearBeast17/" .. var_13_10)
		local var_13_12, var_13_13 = tool.getPositionInScreen(arg_13_0.view.widgets.node_buff)

		var_13_11:setPosition(var_13_12, var_13_13)
		arg_13_0.thunderNode:addChild(var_13_11, 200)

		local var_13_14 = CCArray:create()

		var_13_14:addObject(CCMoveBy:create(0.4, ccp(0, 60)))
		var_13_14:addObject(CCDelayTime:create(0.4))
		var_13_14:addObject(CCFadeOut:create(0.4))
		var_13_14:addObject(CCCallFunc:create(function()
			var_13_11:removeFromParentAndCleanup(true)
		end))

		local var_13_15 = CCSequence:create(var_13_14)

		var_13_11:runAction(var_13_15)
	end

	if tonumber(arg_13_0.info.smBeastTimes) > 0 and arg_13_1.smBeastTimes == 0 then
		arg_13_0:showEffectArmy(arg_13_0.view.widgets.beast2, arg_13_0.animArrays2, "move")

		local var_13_16 = CCArray:create()

		var_13_16:addObject(CCMoveTo:create(1, ccp(1000, 500)))
		var_13_16:addObject(CCCallFunc:create(function()
			arg_13_0:showPanel(arg_13_1)
		end))

		local var_13_17 = CCSequence:create(var_13_16)

		arg_13_0.view.widgets.btn_beast2:runAction(var_13_17)
	else
		arg_13_0:showPanel(arg_13_1)
	end
end

function var_0_11.showEffectSpecialReward(arg_19_0, arg_19_1)
	local var_19_0 = false
	local var_19_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_19_1:registerScriptTouchHandler(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == CCTOUCHBEGAN then
			return true
		elseif arg_20_0 == CCTOUCHMOVED then
			return true
		elseif arg_20_0 == CCTOUCHENDED then
			if not var_19_0 then
				return
			end

			pcall(var_19_1.removeFromParentAndCleanup, var_19_1, true)

			if arg_19_1 then
				arg_19_1()
			end

			return true
		end
	end, false, true)
	var_19_1:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_19_1, 60000)

	local var_19_2 = rmgr.getAnimation("treasureLight")
	local var_19_3 = CCAnimation:createWithSpriteFrames(var_19_2, 0.1)
	local var_19_4 = CCAnimate:create(var_19_3)
	local var_19_5 = CCSprite:create()

	var_19_5:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	var_19_1:addChild(var_19_5)
	var_19_5:runAction(CCRepeatForever:create(var_19_4))

	local var_19_6 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_bx.png")

	var_19_6:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60)
	var_19_1:addChild(var_19_6)

	local var_19_7 = CCSprite:create("res/ui/activity/yearBeast17/xcdns_word_gxhdjrzb.png")

	var_19_7:setPosition(visibleSize.width / 2, visibleSize.height / 2 - 60 - 60)
	var_19_1:addChild(var_19_7)
	var_19_7:setScale(0.2)

	local var_19_8 = CCArray:create()

	var_19_8:addObject(CCMoveBy:create(1, ccp(0, 60)))
	var_19_8:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
	var_19_8:addObject(CCScaleTo:create(0.05, 1, 1))
	var_19_8:addObject(CCCallFunc:create(function()
		var_19_0 = true
	end))

	local var_19_9 = CCSequence:create(var_19_8)

	var_19_7:runAction(var_19_9)
	var_19_7:runAction(CCScaleTo:create(0.5, 1, 1))
end

function var_0_11.showEffectArmy(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = arg_22_2[arg_22_3]
	local var_22_1 = CCAnimation:createWithSpriteFrames(var_22_0, 0.1)
	local var_22_2 = CCAnimate:create(var_22_1)

	arg_22_1:stopAllActions()
	arg_22_1:runAction(CCRepeatForever:create(var_22_2))
end

function var_0_11.setList(arg_23_0, arg_23_1)
	arg_23_0.view.widgets.node_list:removeAllChildrenWithCleanup(true)

	for iter_23_0, iter_23_1 in ipairs(arg_23_1.charts) do
		local var_23_0 = {}

		uiutil.initWidgets(var_23_0, arg_23_0.layout_list)
		var_23_0.widgets.node:setPosition(52, 378 - 46 * iter_23_0)
		arg_23_0.view.widgets.node_list:addChild(var_23_0.widgets.node)

		local var_23_1 = iter_23_1.seq == 1

		var_23_0.widgets.rank1st:setVisible(var_23_1)
		var_23_0.widgets.bg_rank:setVisible(not var_23_1)

		if not var_23_1 then
			var_23_0.widgets.rank:setString(iter_23_1.seq)
		end

		var_23_0.widgets.name:setString(iter_23_1.playerName)
		var_23_0.widgets.name:setColor(iter_23_1.playerName == user.player.name and var_0_7 or var_0_4)

		local var_23_2
		local var_23_3

		if iter_23_1.dmg then
			var_23_2 = "res/ui/activity/changbanSally/cbtw_btn_gj.png"
			var_23_3 = iter_23_1.dmg
		else
			var_23_2 = var_0_1[iter_23_1.reward.type].pic
			var_23_3 = iter_23_1.reward.num
		end

		var_23_0.widgets.icon1:setDisplayFrame(CCSprite:create(var_23_2):displayFrame())

		local var_23_4 = var_23_0.widgets.icon1:getContentSize()

		var_23_0.widgets.icon1:setScale(48 / var_23_4.width)
		var_23_0.widgets.num1:setString(tool.getFormatNum(var_23_3))

		local var_23_5
		local var_23_6

		if iter_23_1.dmg then
			var_23_5 = CCSprite:create("res/ui/activity/yearBeast17/xcdns_list_icon_pz.png")
			var_23_6 = 1

			if iter_23_1.reward and iter_23_1.reward.num > 0 then
				var_23_0.widgets.num2:setString(language.get(135039, iter_23_1.reward.num))

				if iter_23_1.seq <= 3 then
					var_23_0.widgets.num2:setColor(var_0_9)
				end
			end
		elseif iter_23_1.spReward then
			var_23_5 = CCSprite:createWithSpriteFrameName(var_0_2[iter_23_1.spReward.type].pic)
			var_23_6 = 0.5
		end

		if var_23_5 then
			var_23_0.widgets.bg_icon2:setVisible(true)
			var_23_5:setScale(var_23_6)
			var_23_5:setPosition(24, 24)
			var_23_0.widgets.bg_icon2:addChild(var_23_5)
		end
	end

	arg_23_0.view.widgets.pageNo:setString(language.get(213297, arg_23_1.pageNo, arg_23_0.info.totalPage))

	arg_23_0.pageNo = arg_23_1.pageNo

	arg_23_0.view.widgets.btn_pre:setEnabled(arg_23_1.pageNo > 1)
	arg_23_0.view.widgets.btn_next:setEnabled(arg_23_1.pageNo < arg_23_0.info.totalPage)
end

function var_0_11.setBuffBar(arg_24_0)
	local var_24_0
	local var_24_1

	if arg_24_0.info.buffTimes and arg_24_0.info.buffTimes > 0 then
		var_24_0 = 100
		var_24_1 = arg_24_0.info.buffTimes
	else
		var_24_0 = 100 * (arg_24_0.info.totalTimes - arg_24_0.info.timesToBuff) / arg_24_0.info.totalTimes
		var_24_1 = ""
	end

	arg_24_0.view.widgets.buffTimes:setString(var_24_1)
	arg_24_0.view.widgets.bar_buff:setPercentage(var_24_0)

	local var_24_2 = 44 + 34 * math.cos(math.rad(var_24_0 * 3.6 + 90))
	local var_24_3 = 44 + 34 * math.sin(math.rad(var_24_0 * 3.6 + 90))

	arg_24_0.view.widgets.light:setPosition(var_24_2, var_24_3)
end

function var_0_11.setBtnBeast(arg_25_0)
	local var_25_0 = arg_25_0.idx_beast == 1

	arg_25_0.view.widgets.beast1:setColor(var_25_0 and ccc3(255, 255, 255) or var_0_3)
	arg_25_0.view.widgets.richLine_fleeTime:setVisible(var_25_0)
	arg_25_0.view.widgets.beast2:setColor(var_25_0 and var_0_3 or ccc3(255, 255, 255))
	arg_25_0.view.widgets.richLine_smBeastTimes:setVisible(not var_25_0)
	arg_25_0.view.widgets.node_buff:setVisible(var_25_0 and arg_25_0.info.state == 2)
end

function var_0_11.showTip(arg_26_0, arg_26_1, arg_26_2)
	log.info("should show tips ")

	local var_26_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_26_0:registerScriptTouchHandler(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == CCTOUCHBEGAN then
			return true
		elseif arg_27_0 == CCTOUCHMOVED then
			return true
		elseif arg_27_0 == CCTOUCHENDED then
			pcall(var_26_0.removeFromParentAndCleanup, var_26_0, true)

			return true
		end
	end, false, true)
	var_26_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_26_0, 60000)

	local var_26_1 = 0
	local var_26_2 = 0
	local var_26_3 = {}

	uiutil.initWidgets(var_26_3, arg_26_0.tipFrame)
	var_26_0:addChild(var_26_3.widgets.tipFrame)

	local var_26_4, var_26_5 = tool.getPositionInScreen(arg_26_1)
	local var_26_6 = var_26_4
	local var_26_7 = var_26_5

	for iter_26_0 = 1, 7 do
		if arg_26_1 == arg_26_0.view.widgets["btn_spReward" .. iter_26_0] then
			if iter_26_0 ~= 2 then
				var_26_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
			end

			if iter_26_0 >= 5 then
				var_26_3.widgets.tipFrame:setAnchorPoint(ccp(1, 1))
			end
		end
	end

	if arg_26_1 == arg_26_0.view.widgets.btn_army then
		var_26_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
	end

	if arg_26_1 == arg_26_0.view.widgets.btn_buff then
		var_26_3.widgets.tipMsg:setDimensions(CCSizeMake(400, 0))
		var_26_3.widgets.tipFrame:setAnchorPoint(ccp(1, 1))
	end

	var_26_3.widgets.tipMsg:setString(arg_26_2)

	local var_26_8 = var_26_3.widgets.tipMsg:getContentSize().width
	local var_26_9 = var_26_3.widgets.tipMsg:getContentSize().height

	var_26_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_26_8 + 30, var_26_9 + 30))
	var_26_3.widgets.tipFrame:setPosition(ccp(var_26_6, var_26_7))
	var_26_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_26_3.widgets.tipFrame:setVisible(true)

	if arg_26_1 == arg_26_0.view.widgets.btn_tip then
		var_26_3.widgets.tipFrame:setAnchorPoint(ccp(1, 0.5))
		var_26_3.widgets.tipFrame:setPositionY(visibleSize.height / 2)

		if var_26_9 + 30 > visibleSize.height then
			var_26_3.widgets.tipFrame:setScale(visibleSize.height / (var_26_9 + 30))
		end
	end
end

function var_0_11.showPanel(arg_28_0, arg_28_1)
	arg_28_0.info = arg_28_1

	arg_28_0:showEffectArmy(arg_28_0.view.widgets.beast1, arg_28_0.animArrays1, "idle")
	arg_28_0:showEffectArmy(arg_28_0.view.widgets.beast2, arg_28_0.animArrays2, "idle")
	arg_28_0.view.widgets.icon_spReward:setDisplayFrame(tool.spriteFrameByName(var_0_2[arg_28_1.spReward.type].pic))
	arg_28_0.view.widgets.recv_spReward:setVisible(arg_28_1.spReward.recv == 2)
	arg_28_0.view.widgets.richLine_state:setVisible(false)
	arg_28_0.view.widgets.richLine_fleeTime:setVisible(false)
	arg_28_0.view.widgets.richLine_smBeastTimes:setVisible(false)
	arg_28_0.view.widgets.btn_beast1:setVisible(false)
	arg_28_0.view.widgets.btn_beast2:setVisible(false)
	arg_28_0.view.widgets.btn_beast1:setEnabled(false)
	arg_28_0.view.widgets.btn_beast2:setEnabled(false)
	arg_28_0.view.widgets.beast1:setColor(ccc3(255, 255, 255))
	arg_28_0.view.widgets.beast2:setColor(ccc3(255, 255, 255))
	arg_28_0.view.widgets.btn_beast2:stopAllActions()

	local var_28_0 = arg_28_1.state == 0
	local var_28_1 = arg_28_1.state == 1
	local var_28_2 = arg_28_1.state == 2

	arg_28_0.view.widgets.no_beast:setVisible(var_28_0)
	arg_28_0.view.widgets.pageNo:setVisible(not var_28_0)

	local var_28_3 = var_28_2 and "xcdns_list_title_sqphb.png" or "xcdns_list_title_shphb.png"

	arg_28_0.view.widgets.title_list:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/" .. var_28_3):displayFrame())
	arg_28_0.view.widgets.bg_city:setVisible(var_28_1)

	if var_28_0 then
		arg_28_0.view.widgets.btn_beast1:setVisible(true)
		arg_28_0.view.widgets.btn_beast1:setPosition(500, 200)
		arg_28_0.view.widgets.beast1:setColor(var_0_3)
		arg_28_0.view.widgets.richLine_state_p1:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/" .. var_0_0[arg_28_1.beastType].pic):displayFrame())
		arg_28_0.view.widgets.richLine_state_p2:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/xcdns_word_jjxl.png"):displayFrame())
		arg_28_0.view.widgets.richLine_state:setVisible(true)
		arg_28_0.view.widgets.richLine_state:reorder()
	end

	if var_28_1 then
		arg_28_0.view.widgets.btn_beast1:setVisible(true)
		arg_28_0.view.widgets.btn_beast1:setPosition(500, 200)
		arg_28_0.view.widgets.richLine_state_p1:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/" .. var_0_0[arg_28_1.beastType].pic):displayFrame())
		arg_28_0.view.widgets.richLine_state_p2:setDisplayFrame(CCSprite:create("res/ui/activity/yearBeast17/xcdns_word_snz.png"):displayFrame())
		arg_28_0.view.widgets.richLine_state:setVisible(true)
		arg_28_0.view.widgets.richLine_state:reorder()
		arg_28_0.view.widgets.cityName:setString(language.get(215830, arg_28_1.cityName))
	end

	arg_28_0.view.widgets.node_buff:setVisible(var_28_2)
	arg_28_0.view.widgets.btn_bomb:setVisible(var_28_2)

	if var_28_2 then
		if arg_28_1.beastNo == 3 and arg_28_1.smBeastTimes > 0 then
			arg_28_0.view.widgets.btn_beast1:setVisible(true)
			arg_28_0.view.widgets.btn_beast2:setVisible(true)
			arg_28_0.view.widgets.btn_beast1:setEnabled(true)
			arg_28_0.view.widgets.btn_beast2:setEnabled(true)
			arg_28_0.view.widgets.btn_beast1:setPosition(320, 200)
			arg_28_0.view.widgets.btn_beast2:setPosition(620, 180)
		else
			arg_28_0.view.widgets.btn_beast1:setVisible(true)
			arg_28_0.view.widgets.btn_beast1:setPosition(500, 200)
		end

		arg_28_0.view.widgets.richLine_fleeTime_p1:stopAllActions()

		local var_28_4 = CCArray:create()

		var_28_4:addObject(CCCallFuncN:create(function()
			if arg_28_1.fleeTime <= 0 then
				arg_28_0.view.widgets.richLine_fleeTime_p1:stopAllActions()
				arg_28_0:refresh()
			else
				arg_28_0.view.widgets.richLine_fleeTime_p1:setString(tool.formatTime(arg_28_0.info.fleeTime, "@H:@M:@S"))
			end
		end))
		var_28_4:addObject(CCDelayTime:create(0.5))

		local var_28_5 = CCSequence:create(var_28_4)

		arg_28_0.view.widgets.richLine_fleeTime_p1:runAction(CCRepeatForever:create(var_28_5))
		arg_28_0.view.widgets.richLine_fleeTime_p1:setString(tool.formatTime(arg_28_0.info.fleeTime, "@H:@M:@S"))
		arg_28_0.view.widgets.richLine_fleeTime:reorder()
		arg_28_0.view.widgets.richLine_smBeastTimes_p2:setString(tostring(arg_28_1.smBeastTimes))
		arg_28_0.view.widgets.richLine_smBeastTimes:reorder()

		arg_28_0.idx_beast = arg_28_0.idx_beast or 1

		if arg_28_1.smBeastTimes == 0 then
			arg_28_0.idx_beast = 1
		end

		arg_28_0:setBtnBeast()
		arg_28_0:setBuffBar()

		local var_28_6
		local var_28_7
		local var_28_8

		if arg_28_1.bombNum > 0 then
			var_28_6 = "res/ui/activity/yearBeast17/xcdns_list_icon_pz.png"
			var_28_7 = arg_28_1.bombNum
			var_28_8 = var_0_4
		else
			var_28_6 = "res/ui/activity/ironRotary/yuanbao.png"
			var_28_7 = arg_28_1.bombCost
			var_28_8 = var_0_7
		end

		arg_28_0.view.widgets.icon_bomb:setDisplayFrame(CCSprite:create(var_28_6):displayFrame())
		arg_28_0.view.widgets.bombNum:setString(var_28_7)
		arg_28_0.view.widgets.bombNum:setColor(var_28_8)
	end

	local var_28_9 = tonumber(arg_28_1.unrecBomb)

	arg_28_0.view.widgets.bg_reward:setVisible(var_28_9 > 0)

	if var_28_9 > 0 then
		arg_28_0.view.widgets.unrecBomb:setString(language.get(135039, var_28_9))
	end

	arg_28_0.view.widgets.bar:setPercentage(50 * (arg_28_1.beastNo - 1))

	for iter_28_0 = 1, 3 do
		arg_28_0.view.widgets["btn_bar" .. iter_28_0]:setEnabled(false)
		arg_28_0.view.widgets["sp" .. iter_28_0]:removeAllChildrenWithCleanup(true)
		arg_28_0.view.widgets["bg_time" .. iter_28_0]:setVisible(false)

		if iter_28_0 < arg_28_1.beastNo then
			tool.spriteToGray(arg_28_0.view.widgets["sp" .. iter_28_0])
		elseif iter_28_0 == arg_28_1.beastNo then
			if arg_28_1.state ~= 0 then
				-- block empty
			else
				arg_28_0.view.widgets["btn_bar" .. iter_28_0]:setEnabled(true)
				arg_28_0.view.widgets["bg_time" .. iter_28_0]:setVisible(true)
			end
		else
			arg_28_0.view.widgets["btn_bar" .. iter_28_0]:setEnabled(true)
			arg_28_0.view.widgets["bg_time" .. iter_28_0]:setVisible(true)
		end
	end

	if arg_28_1.fullReward == 1 then
		-- block empty
	end
end

function var_0_11.ctor(arg_30_0, arg_30_1, arg_30_2)
	log.info("@@ 新春年兽活动")
	rmgr.loadResource("res/ui/activity/ironMine/btkd_fire.plist")

	arg_30_0.view = {}

	uiutil.initWidgets(arg_30_0.view, arg_30_0.layout)

	arg_30_0.leftTime = arg_30_0.view.widgets.leftTime

	if arg_30_1 then
		arg_30_0:addChild(arg_30_0.view.widgets.root)
		arg_30_1:addChild(arg_30_0)
	end

	arg_30_0.view.widgets.ScrollView:setTouchEnabled(false)
	arg_30_0.view.widgets.bar:setMidpoint(ccp(0.5, 1))
	arg_30_0.view.widgets.bar:setBarChangeRate(ccp(0, 1))
	arg_30_0.view.widgets.bar_buff:setMidpoint(ccp(0.5, 0.5))
	arg_30_0.view.widgets.bar_buff:setBarChangeRate(ccp(0, 1))
	arg_30_0.view.widgets.bar_buff:setReverseProgress(true)

	local var_30_0 = CCArray:create()

	var_30_0:addObject(CCScaleTo:create(0.3, 1.5))
	var_30_0:addObject(CCScaleTo:create(0.3, 1))

	local var_30_1 = CCSequence:create(var_30_0)

	arg_30_0.view.widgets.light:runAction(CCRepeatForever:create(var_30_1))
	arg_30_0.view.widgets.btn_spReward:addHandleOfControlEvent(function()
		log.info("btn_spReward")
		arg_30_0:onGetSpRewInfo()
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		log.info("btn_back")
		arg_30_0.view.widgets.bg_spReward:setVisible(false)
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_30_0.view.widgets.bg_spReward)
	arg_30_0.view.widgets.btn_buff:addHandleOfControlEvent(function()
		log.info("btn_buff")

		local var_33_0

		if arg_30_0.info.buffTimes and arg_30_0.info.buffTimes > 0 then
			var_33_0 = language.get(215832, arg_30_0.info.buffTimes)
		else
			var_33_0 = language.get(215831, arg_30_0.info.totalTimes - arg_30_0.info.timesToBuff, arg_30_0.info.totalTimes)
		end

		arg_30_0:showTip(arg_30_0.view.widgets.btn_buff, var_33_0)
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_bomb:addHandleOfControlEvent(function()
		log.info("btn_bomb")
		arg_30_0:onGetReward(0)
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_30_0:showTip(arg_30_0.view.widgets.btn_tip, language.get(215833))
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		log.info("btn_show")

		local var_36_0 = arg_30_0.view.widgets.btn_show:getScale()

		log.info("scale", var_36_0)

		if var_36_0 > 0 then
			if arg_30_0.info.state == 1 then
				arg_30_0:onGetDmgCharts(1)
			elseif arg_30_0.info.state == 2 then
				arg_30_0:onGetRwdCharts(1)
			end
		end

		local var_36_1 = CCArray:create()

		var_36_1:addObject(CCMoveTo:create(0.5, ccp(var_36_0 > 0 and 613 or 1152, 214)))
		var_36_1:addObject(CCCallFuncN:create(function()
			arg_30_0.view.widgets.btn_show:setScale(-1 * var_36_0)
			arg_30_0.view.widgets.btn_show:setEnabled(true)
		end))

		local var_36_2 = CCSequence:create(var_36_1)

		arg_30_0.view.widgets.bg_list:runAction(var_36_2)
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_pre:addHandleOfControlEvent(function()
		log.info("btn_pre")

		arg_30_0.pageNo = arg_30_0.pageNo or 1

		if arg_30_0.pageNo > 1 then
			arg_30_0.pageNo = arg_30_0.pageNo - 1

			if arg_30_0.info.state == 1 then
				arg_30_0:onGetDmgCharts(arg_30_0.pageNo)
			elseif arg_30_0.info.state == 2 then
				arg_30_0:onGetRwdCharts(arg_30_0.pageNo)
			end
		end
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_next:addHandleOfControlEvent(function()
		log.info("btn_next")

		arg_30_0.pageNo = arg_30_0.pageNo or 1

		if arg_30_0.pageNo < arg_30_0.info.totalPage then
			arg_30_0.pageNo = arg_30_0.pageNo + 1

			if arg_30_0.info.state == 1 then
				arg_30_0:onGetDmgCharts(arg_30_0.pageNo)
			elseif arg_30_0.info.state == 2 then
				arg_30_0:onGetRwdCharts(arg_30_0.pageNo)
			end
		end
	end, CCControlEventTouchUpInside)
	swallowTouch(arg_30_0.view.widgets.bg_list)

	for iter_30_0 = 1, 3 do
		local var_30_2 = arg_30_0.view.widgets["btn_bar" .. iter_30_0]

		var_30_2:addHandleOfControlEvent(function()
			log.info("btn_bar" .. iter_30_0)

			local var_40_0 = {
				215843,
				215844,
				215845
			}
			local var_40_1 = language.get(var_0_0[arg_30_0.info.monsterTypes[iter_30_0]].txt)
			local var_40_2 = language.get(var_0_0[arg_30_0.info.smBeastType].txt)

			arg_30_0:showTip(var_30_2, language.get(var_40_0[iter_30_0], var_40_1, var_40_2))
		end, CCControlEventTouchUpInside)
	end

	local var_30_3 = {
		ccp(80, 280),
		ccp(110, 140),
		ccp(240, 260),
		ccp(270, 120),
		ccp(670, 260),
		ccp(750, 120),
		ccp(830, 240)
	}

	for iter_30_1 = 1, 7 do
		local var_30_4 = {}

		uiutil.initWidgets(var_30_4, arg_30_0.layout_btn)
		var_30_4.widgets.node:setPosition(var_30_3[iter_30_1])
		arg_30_0.view.widgets.bg_spReward:addChild(var_30_4.widgets.node)
		var_30_4.widgets.num:setString(iter_30_1)
		var_30_4.widgets.btn:addHandleOfControlEvent(function()
			log.info("btn_spReward" .. iter_30_1)

			local var_41_0 = arg_30_0.spRewList[iter_30_1].reward

			arg_30_0:showTip(var_30_4.widgets.btn, language.get(var_0_2[var_41_0.type].txt))
		end, CCControlEventTouchUpInside)

		arg_30_0.view.widgets["received" .. iter_30_1] = var_30_4.widgets.received
		arg_30_0.view.widgets["btn_spReward" .. iter_30_1] = var_30_4.widgets.btn
	end

	local var_30_5 = rmgr.getArmy("def", "57_1")

	arg_30_0:showEffectArmy(arg_30_0.view.widgets.army, var_30_5, "move")
	arg_30_0:showEffectArmy(arg_30_0.view.widgets.light_army, var_30_5, "light")
	arg_30_0.view.widgets.btn_army:addHandleOfControlEvent(function()
		log.info("btn_army")
		arg_30_0:showTip(arg_30_0.view.widgets.btn_army, language.get(215842))
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_30_0:onGetReward(3)
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_city:addHandleOfControlEvent(function()
		log.info("btn_city")
		loadingLayer.show(SCENE_WORLD, arg_30_0.info.cityId)
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_beast1:addHandleOfControlEvent(function()
		log.info("btn_beast1")

		arg_30_0.idx_beast = 1

		arg_30_0:setBtnBeast()
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_beast2:addHandleOfControlEvent(function()
		log.info("btn_beast2")

		arg_30_0.idx_beast = 2

		arg_30_0:setBtnBeast()
	end, CCControlEventTouchUpInside)
	arg_30_0.view.widgets.btn_recBomb:addHandleOfControlEvent(function()
		log.info("btn_recBomb")
		arg_30_0:onGetReward(1)
	end, CCControlEventTouchUpInside)

	arg_30_0.animArrays1 = rmgr.getArmy("def", 58)
	arg_30_0.animArrays2 = rmgr.getArmy("def", "58_1")

	arg_30_0:showPanel(arg_30_2)
end

function var_0_11.onEnter(arg_48_0)
	arg_48_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_48_0, arg_48_0.update), 0, false)
end

function var_0_11.onExit(arg_49_0)
	if arg_49_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_49_0.updateRef)
	end
end

function var_0_11.update(arg_50_0, arg_50_1)
	if arg_50_0.info then
		for iter_50_0, iter_50_1 in ipairs(var_0_10) do
			if arg_50_0.info[iter_50_1] then
				if arg_50_0.info[iter_50_1] > 0 then
					arg_50_0.info[iter_50_1] = arg_50_0.info[iter_50_1] - 1000 * arg_50_1
				elseif arg_50_0.info[iter_50_1] <= 0 then
					arg_50_0.info[iter_50_1] = 0
				end
			end
		end
	end
end

return var_0_11
