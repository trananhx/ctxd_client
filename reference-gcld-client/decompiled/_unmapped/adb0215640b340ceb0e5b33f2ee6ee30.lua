local var_0_0 = tool.hexToRgb("#EADBBB")
local var_0_1 = colorQuality[3]
local var_0_2 = colorQuality[2]
local var_0_3 = colorQuality[5]
local var_0_4 = colorQuality[4]
local var_0_5 = colorQuality[6]
local var_0_6 = {
	[119] = 10033,
	[4] = 4,
	[112] = 10001
}
local var_0_7 = 0
local var_0_8 = 1
local var_0_9 = 2
local var_0_10 = 0
local var_0_11 = 200
local var_0_12 = 800
local var_0_13 = {
	"playStartCd",
	"playEndCd",
	"matchCd",
	"matchEndCd",
	"allMatchEndCd"
}
local var_0_14 = class("DragonBoat", function()
	return createBaseLayer()
end)

var_0_14.layout = {
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
				path = "res/ui/comment/bg1.jpg"
			},
			children = {
				{
					y = 468,
					name = "line",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					y = 490,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/activity/dragonBoat/lzds_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 480,
					type = "label",
					x = 730,
					style = "label_warlock",
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_3
				},
				{
					style = "button_tip",
					name = "btn_tip",
					y = 490,
					type = "button",
					x = 860
				},
				{
					y = 4,
					name = "view_bg",
					type = "scrollview",
					x = 4,
					viewSize = CCSizeMake(907, 440),
					children = {
						{
							y = 0,
							name = "layer_bg",
							type = "layer",
							x = 0,
							children = {
								{
									y = 0,
									name = "bg1",
									type = "sprite",
									scaleX = 1.002,
									x = 0,
									scaleY = 1.07,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/dragonBoat/lzds_bg.jpg"
									}
								},
								{
									y = 0,
									name = "startBg1",
									type = "sprite",
									scaleX = -1,
									x = 250,
									scaleY = 1.07,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/dragonBoat/lzds_bg2.png"
									}
								},
								{
									y = 0,
									name = "bg2",
									type = "sprite",
									scaleX = 1.002,
									x = 907,
									scaleY = 1.07,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/dragonBoat/lzds_bg.jpg"
									}
								},
								{
									y = 0,
									name = "endBg1",
									type = "sprite",
									scaleX = 1,
									x = 657,
									scaleY = 1.07,
									anchorPoint = ccp(0, 0),
									pic = {
										path = "res/ui/activity/dragonBoat/lzds_bg2.png"
									}
								},
								{
									type = "sprite",
									name = "flag_end",
									y = 300,
									visible = false,
									x = 110,
									pic = {
										path = "res/ui/activity/dragonBoat/sdsxq_flag_o.png"
									}
								},
								{
									type = "sprite",
									name = "flag_begin",
									y = 300,
									visible = false,
									x = 360,
									pic = {
										path = "res/ui/activity/dragonBoat/sdsxq_flag_s.png"
									}
								},
								{
									visible = false,
									name = "bg_deerInfo",
									type = "sprite9",
									y = 290,
									x = 220,
									pic = {
										frame = true,
										path = "common_tip_frame_small.png"
									},
									anchorPoint = ccp(0.5, 0.5),
									middleRect = CCRectMake(10, 10, 29, 29),
									preferedSize = CCSizeMake(180, 50),
									children = {
										{
											fontSize = 20,
											height = 0,
											name = "deerInfo",
											type = "label",
											x = 90,
											y = 25,
											width = 0,
											color = var_0_0,
											anchorPoint = ccp(0.5, 0.5),
											halign = kCCTextAlignmentLeft
										}
									}
								},
								{
									zoomOnTouchDown = false,
									name = "btn_buySailor",
									h = 56,
									type = "button",
									w = 212,
									y = 150,
									x = 220,
									normal = {
										frame = false,
										path = "res/ui/common/button/sdyjs_btn_02.png"
									},
									touched = {
										frame = false,
										path = "res/ui/common/button/sdyjs_btn_02_c.png"
									},
									children = {
										{
											fontSize = 25,
											y = 32,
											type = "label",
											x = 130,
											textId = 136304,
											color = var_0_0,
											color = var_0_0
										},
										{
											y = 40,
											x = 40,
											scale = 0.6,
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 22,
											name = "buySailorGold",
											y = 22,
											type = "label",
											x = 40,
											color = var_0_0
										}
									}
								},
								{
									h = 200,
									name = "btn_snowball",
									zoomOnTouchDown = true,
									type = "button",
									w = 200,
									y = 230,
									zorder = 20,
									visible = false,
									x = 860,
									normal = {
										path = "res/default.png"
									},
									touched = {
										path = "res/default.png"
									},
									children = {
										{
											x = 100,
											name = "snowball",
											y = 100,
											type = "sprite",
											scale = 1.5,
											pic = {
												frame = true,
												path = "obstacleA01.png"
											}
										},
										{
											fontSize = 30,
											name = "pos_snowball",
											style = "label_warlock",
											type = "label",
											y = 100,
											x = 100,
											color = var_0_2,
											anchorPoint = ccp(0.5, 0.5)
										}
									}
								},
								{
									h = 200,
									name = "btn_eagle",
									zoomOnTouchDown = true,
									type = "button",
									w = 140,
									y = 380,
									zorder = 100,
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
											y = 38,
											name = "light",
											type = "sprite",
											x = 83,
											pic = {
												path = "res/ui/activity/dragonBoat/gongx1.png"
											}
										},
										{
											y = 38,
											name = "feat",
											type = "sprite",
											x = 83,
											pic = {
												path = "res/ui/activity/dragonBoat/gongx.png"
											}
										},
										{
											y = 100,
											name = "eagle",
											type = "sprite",
											x = 70,
											pic = {
												frame = true,
												path = "eagle_01.png"
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
					name = "bg_info",
					y = 424,
					visible = false,
					x = 458,
					pic = {
						path = "res/ui/activity/dragonBoat/sdsxq_word_long.png"
					},
					children = {
						{
							fontSize = 25,
							name = "round2",
							y = 22,
							type = "label",
							x = 10,
							color = var_0_0,
							anchorPoint = ccp(0, 0.5)
						},
						{
							fontSize = 22,
							name = "timer2",
							y = 22,
							type = "label",
							x = 130
						},
						{
							y = 0,
							type = "scrollview",
							x = 0,
							viewSize = CCSizeMake(907, 43),
							children = {
								{
									y = 0,
									name = "layer_info",
									x = 0,
									type = "layer"
								}
							}
						}
					}
				},
				{
					y = 4,
					name = "bg_down",
					type = "sprite",
					x = 458,
					anchorPoint = ccp(0.5, 0),
					pic = {
						path = "res/ui/activity/dragonBoat/sdsxq_word_long_down.png"
					},
					children = {
						{
							y = 0,
							name = "node_state0",
							type = "node",
							x = 0,
							children = {
								{
									y = 75,
									name = "btn_startMatch",
									h = 62,
									type = "button",
									w = 195,
									visible = false,
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
											y = 33,
											type = "label",
											x = 98,
											textId = 136292,
											color = var_0_0
										}
									}
								},
								{
									fontSize = 35,
									name = "needDeer",
									type = "label",
									visible = false,
									y = 75,
									x = 458,
									textId = 136305,
									color = var_0_0
								},
								{
									zoomOnTouchDown = true,
									name = "btn_city",
									h = 40,
									type = "button",
									w = 200,
									y = 22,
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
											fontSize = 25,
											y = 20,
											type = "label",
											x = 100,
											textId = 136252,
											color = var_0_1
										}
									}
								},
								{
									fontSize = 25,
									name = "freeTimes",
									type = "label",
									visible = false,
									y = 22,
									x = 458,
									color = var_0_0
								}
							}
						},
						{
							y = 0,
							name = "node_state1",
							type = "node",
							x = 0,
							children = {
								{
									zoomOnTouchDown = true,
									name = "btn_hitDrum",
									h = 78,
									type = "button",
									w = 80,
									y = 50,
									visible = false,
									x = 850,
									normal = {
										path = "res/ui/activity/dragonBoat/lzds_btn_gu.png"
									},
									touched = {
										path = "res/ui/activity/dragonBoat/lzds_btn_gu_c.png"
									},
									children = {
										{
											type = "sprite",
											name = "icon_gold",
											x = 12,
											visible = false,
											y = 12,
											scale = 0.8,
											pic = {
												path = "res/ui/activity/ironRotary/yuanbao.png"
											}
										},
										{
											fontSize = 22,
											name = "buyDrumGold",
											y = 12,
											type = "label",
											x = 45,
											color = var_0_0
										}
									}
								},
								{
									y = 50,
									x = 50,
									type = "sprite",
									scale = 0.8,
									pic = {
										frame = true,
										path = "btkd_box.png"
									},
									children = {
										{
											fontSize = 40,
											name = "leftGoldenBox2",
											y = 40,
											type = "label",
											x = 90,
											color = var_0_4,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									y = 50,
									x = 200,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/activity/dragonBoat/btkd_box_r.png"
									},
									children = {
										{
											fontSize = 40,
											name = "leftSilverBox2",
											y = 40,
											type = "label",
											x = 90,
											color = var_0_4,
											anchorPoint = ccp(0, 0.5)
										}
									}
								},
								{
									y = 75,
									x = 458,
									type = "sprite",
									scale = 0.8,
									pic = {
										path = "res/ui/activity/dragonBoat/sdsxq_numb_bg.png"
									},
									children = {
										{
											anchorPointX = 0.5,
											name = "richLine2",
											y = 35,
											type = "richLine",
											gap = 2,
											x = 130,
											content = {
												{
													x = 0,
													y = 0,
													type = "sprite",
													pic = {
														frame = true,
														path = "yxhd_tit_di.png"
													}
												},
												{
													name = "rank2",
													type = "atlaslabel",
													pic = "res/ui/common/number/yxhd_time_digit.png",
													startCharMap = 47,
													text = "0",
													y = 0,
													itemWidth = 35,
													x = 0,
													itemHeight = 34
												},
												{
													x = 0,
													y = 0,
													type = "sprite",
													pic = {
														frame = true,
														path = "yxhd_tit_ming.png"
													}
												}
											}
										}
									}
								},
								{
									y = 22,
									name = "node_reward2",
									x = 458,
									type = "node"
								}
							}
						},
						{
							y = 50,
							name = "btn_goBack",
							h = 62,
							type = "button",
							w = 195,
							visible = false,
							x = 240,
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
									textId = 136293,
									color = var_0_0
								}
							}
						}
					}
				},
				{
					type = "sprite",
					name = "bg_time",
					y = 376,
					visible = false,
					x = 240,
					pic = {
						path = "res/ui/activity/dragonBoat/sdsxq_time_bg.png"
					},
					children = {
						{
							fontSize = 30,
							name = "state_time",
							style = "label_warlock",
							type = "label",
							y = 75,
							x = 184,
							color = var_0_0
						},
						{
							fontSize = 45,
							name = "timer",
							y = 30,
							type = "label",
							x = 184,
							color = var_0_0
						}
					}
				},
				{
					type = "sprite",
					name = "bg_winner",
					y = 320,
					visible = false,
					x = 220,
					pic = {
						path = "res/ui/selectPlayer/vip_port_view.jpg"
					},
					children = {
						{
							y = 50,
							name = "icon_winner",
							type = "sprite",
							x = 50,
							pic = {
								path = "res/ui/common/playerHead/playerHead_icon_0.png"
							}
						},
						{
							y = 78,
							x = 78,
							type = "sprite",
							pic = {
								path = "res/ui/activity/dragonBoat/sdsxq_word_no1.png"
							}
						},
						{
							fontSize = 22,
							name = "winnerName",
							style = "label_warlock",
							type = "label",
							y = -15,
							x = 50,
							color = var_0_0
						}
					}
				},
				{
					y = 4,
					name = "view_rank",
					type = "scrollview",
					x = 4,
					viewSize = CCSizeMake(907, 440),
					children = {
						{
							y = 0,
							name = "layer_rank",
							type = "layer",
							x = 0,
							children = {
								{
									type = "sprite",
									name = "bg_rank",
									y = 220,
									visible = false,
									x = 906,
									anchorPoint = ccp(1, 0.5),
									pic = {
										path = "res/ui/activity/dragonBoat/sdsxq_juesai_bg.png"
									},
									children = {
										{
											y = 212,
											name = "node_btnShow",
											type = "node",
											scaleX = -1,
											x = -23,
											children = {
												{
													zoomOnTouchDown = true,
													name = "btn_show",
													h = 75,
													type = "button",
													w = 75,
													y = 0,
													x = 0,
													normal = {
														path = "res/ui/activity/fishing/hjcd_qd_arrows.png"
													},
													touched = {
														path = "res/ui/activity/fishing/hjcd_qd_arrows.png"
													}
												}
											}
										},
										{
											fontSize = 30,
											name = "round",
											y = 394,
											type = "label",
											x = 216,
											color = var_0_0
										},
										{
											fontSize = 22,
											name = "selfMiles",
											y = 350,
											type = "label",
											x = 25,
											color = var_0_0,
											anchorPoint = ccp(0, 0.5)
										},
										{
											fontSize = 22,
											y = 305,
											type = "label",
											x = 25,
											textId = 136255,
											color = var_0_0,
											anchorPoint = ccp(0, 0.5)
										},
										{
											fontSize = 22,
											y = 250,
											type = "label",
											x = 25,
											textId = 136256,
											color = var_0_0,
											anchorPoint = ccp(0, 0.5)
										},
										{
											name = "btn_silverBox",
											h = 62,
											type = "button",
											w = 195,
											y = 40,
											x = 120,
											normal = {
												path = "res/ui/common/button/public_btn_red.png"
											},
											touched = {
												path = "res/ui/common/button/public_btn_red_c.png"
											},
											disable = {
												path = "res/ui/common/button/public_btn_red_g.png"
											},
											children = {
												{
													fontSize = 25,
													y = 33,
													type = "label",
													x = 98,
													textId = 136294,
													color = var_0_0
												}
											}
										},
										{
											name = "btn_goldenBox",
											h = 62,
											type = "button",
											w = 195,
											y = 40,
											x = 330,
											normal = {
												path = "res/ui/common/button/public_btn_orange.png"
											},
											touched = {
												path = "res/ui/common/button/public_btn_orange_c.png"
											},
											disable = {
												path = "res/ui/common/button/public_btn_orange_g.png"
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
															x = 42,
															type = "sprite",
															pic = {
																path = "res/ui/activity/ironRotary/yuanbao.png"
															}
														},
														{
															fontSize = 22,
															name = "openGoldenBoxGold",
															y = 15,
															type = "label",
															x = 42,
															color = var_0_0
														}
													}
												},
												{
													fontSize = 25,
													y = 33,
													type = "label",
													x = 125,
													textId = 220628,
													color = var_0_0
												}
											}
										},
										{
											y = 130,
											name = "silverBox",
											type = "sprite",
											x = 100,
											pic = {
												path = "res/ui/activity/dragonBoat/btkd_box_r.png"
											},
											children = {
												{
													fontSize = 30,
													name = "leftSilverBox",
													y = 40,
													type = "label",
													x = 90,
													color = var_0_4,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											y = 130,
											name = "goldenBox",
											type = "sprite",
											x = 310,
											pic = {
												frame = true,
												path = "btkd_box.png"
											},
											children = {
												{
													fontSize = 30,
													name = "leftGoldenBox",
													y = 40,
													type = "label",
													x = 90,
													color = var_0_4,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											x = 170,
											name = "icon_reward",
											y = 230,
											type = "sprite",
											scale = 0.8,
											pic = {
												path = "res/ui/activity/dragonBoat/btkd_box_r.png"
											},
											children = {
												{
													fontSize = 30,
													name = "num_reward",
													y = 40,
													type = "label",
													x = 90,
													color = var_0_4,
													anchorPoint = ccp(0, 0.5)
												}
											}
										},
										{
											y = 300,
											x = 310,
											type = "sprite",
											scale = 0.8,
											pic = {
												path = "res/ui/activity/dragonBoat/sdsxq_numb_bg.png"
											},
											children = {
												{
													anchorPointX = 0.5,
													name = "richLine",
													y = 35,
													type = "richLine",
													gap = 2,
													x = 130,
													content = {
														{
															x = 0,
															y = 0,
															type = "sprite",
															pic = {
																frame = true,
																path = "yxhd_tit_di.png"
															}
														},
														{
															name = "rank",
															type = "atlaslabel",
															pic = "res/ui/common/number/yxhd_time_digit.png",
															startCharMap = 47,
															text = "0",
															y = 0,
															itemWidth = 35,
															x = 0,
															itemHeight = 34
														},
														{
															x = 0,
															y = 0,
															type = "sprite",
															pic = {
																frame = true,
																path = "yxhd_tit_ming.png"
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
					}
				},
				{
					x = 0,
					height = 532,
					visible = false,
					type = "layerColor",
					name = "bg_treasure",
					y = 0,
					width = 915,
					color = ccc4(0, 0, 0, 180),
					children = {
						{
							name = "btn_mask",
							h = 532,
							type = "button",
							w = 915,
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
							y = 330,
							x = 458,
							type = "sprite",
							pic = {
								path = "res/ui/activity/dragonBoat/sdsxq_word_gxjjhdbw.png"
							}
						},
						{
							zoomOnTouchDown = true,
							name = "btn_treasure",
							h = 100,
							type = "button",
							w = 100,
							y = 250,
							x = 458,
							normal = {
								path = "res/ui/selectPlayer/vip_port_view.jpg"
							},
							touched = {
								path = "res/ui/selectPlayer/vip_port_view.jpg"
							},
							children = {
								{
									x = 50,
									name = "icon_treasure",
									y = 50,
									type = "sprite",
									scale = 1.25,
									pic = {
										frame = true,
										path = "xuedichuying.jpg"
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
var_0_14.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(1, 1),
	middleRect = CCRectMake(10, 10, 29, 29),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 136289,
			width = 800,
			color = var_0_0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}
var_0_14.layout_reward = {
	y = 0,
	name = "node",
	type = "node",
	x = 0,
	children = {
		{
			fontSize = 22,
			name = "txt",
			y = 0,
			type = "label",
			x = -25,
			anchorPoint = ccp(1, 0.5)
		},
		{
			x = 0,
			name = "box",
			y = 0,
			type = "sprite",
			scale = 0.4,
			pic = {
				path = "res/ui/activity/dragonBoat/btkd_box_r.png"
			}
		},
		{
			fontSize = 22,
			name = "num",
			y = 0,
			type = "label",
			x = 15,
			anchorPoint = ccp(0, 0.5)
		},
		{
			type = "sprite",
			name = "bg_icon",
			y = 0,
			visible = false,
			x = 70,
			pic = {
				path = "res/ui/activity/dragonBoat/sdsxq_jibie_bg.png"
			},
			children = {
				{
					x = 15,
					name = "icon",
					y = 15,
					type = "sprite",
					scale = 0.33,
					pic = {
						frame = true,
						path = "xuedichuying.jpg"
					}
				},
				{
					fontSize = 22,
					name = "name",
					y = 15,
					type = "label",
					x = 35,
					anchorPoint = ccp(0, 0.5)
				}
			}
		}
	}
}

function var_0_14.handlerPushBoatAction(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.action.data.boat

	if var_2_0 ~= nil then
		if var_2_0.state == 2 then
			return
		end

		if var_2_0.hawk == true then
			arg_2_0:showEffectEagleEnter()
		else
			arg_2_0.info.rank = var_2_0.rank
			arg_2_0.info.rewards = var_2_0.rewards
			arg_2_0.info.barriers = var_2_0.barriers
			arg_2_0.info.ranks = var_2_0.ranks
			arg_2_0.info.matchEndCd = var_2_0.matchEndCd + 3000
			arg_2_0.info.boat = var_2_0.boat

			arg_2_0:updateMatch()
		end
	end
end

function var_0_14.refresh(arg_3_0)
	local function var_3_0(arg_4_0)
		arg_3_0:showPanel(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.getDragonBoatActivity)
end

function var_0_14.onBuySailor(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data
		local var_6_1, var_6_2 = tool.getPositionInScreen(arg_5_0.view.widgets.btn_buySailor)

		smgr.showProgramText(language.get(136262) .. "+1", colorTips.green, ccp(var_6_1, var_6_2))
		arg_5_0:refresh()
	end

	messageBox.showChargeWin("", language.get(136272, arg_5_0.info.buySailorGold), "buySailor", function()
		cmgr.sendRequest(var_5_0, actions.boatBuySailor)
	end)
end

function var_0_14.onHitDrum(arg_8_0)
	local function var_8_0(arg_9_0)
		local var_9_0 = arg_9_0.action.data

		arg_8_0:showEffectFast()

		arg_8_0.info.buyDrumGold = var_9_0.buyDrumGold
		arg_8_0.info.leftFreeDrums = var_9_0.leftFreeDrums

		local var_9_1 = var_9_0.leftFreeDrums > 0

		arg_8_0.view.widgets.buyDrumGold:setPositionX(var_9_1 and 35 or 45)
		arg_8_0.view.widgets.buyDrumGold:setString(var_9_1 and language.get(85060) or var_9_0.buyDrumGold)
		arg_8_0.view.widgets.icon_gold:setVisible(not var_9_1)
	end

	if arg_8_0.info.leftFreeDrums > 0 then
		cmgr.sendRequest(var_8_0, actions.boatHitDrum)
	else
		messageBox.showChargeWin("", language.get(136275, arg_8_0.info.buyDrumGold), "hitDrum", function()
			cmgr.sendRequest(var_8_0, actions.boatHitDrum)
		end)
	end
end

function var_0_14.onClearState(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0.action.data

		arg_11_0.info.rank = var_12_0.rank
		arg_11_0.info.rewards = var_12_0.rewards
		arg_11_0.info.barriers = var_12_0.barriers
		arg_11_0.info.ranks = var_12_0.ranks
		arg_11_0.info.matchEndCd = var_12_0.matchEndCd + 3000
		arg_11_0.info.boat = var_12_0.boat

		arg_11_0:updateMatch()
	end

	local var_11_1 = 1

	cmgr.sendRequest(var_11_0, actions.boatClearState, var_11_1, arg_11_1)
end

function var_0_14.onGetReward(arg_13_0, arg_13_1)
	local function var_13_0(arg_14_0)
		local var_14_0 = arg_14_0.action.data

		if arg_13_1 == 0 then
			local var_14_1 = {}
			local var_14_2 = {}

			var_14_2.id = 10021
			var_14_2.value = 1

			table.insert(var_14_1, var_14_2)
			globalAction_gotResource(var_14_1)
		else
			if var_14_0.crit and var_14_0.crit > 1 then
				if arg_13_0.bjSprite and not tolua.isnull(arg_13_0.bjSprite) then
					arg_13_0.bjSprite:removeFromParentAndCleanup(true)

					arg_13_0.bjSprite = nil
				end

				local var_14_3 = smgr.getLayer("pushLayer")
				local var_14_4 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_14_0.crit .. ".png")
				local var_14_5 = ccp(visibleSize.width / 2, visibleSize.height * 0.35)
				local var_14_6 = arg_13_1 == 1 and arg_13_0.view.widgets.goldenBox or arg_13_0.view.widgets.silverBox
				local var_14_7, var_14_8 = tool.getPositionInScreen(var_14_6)

				var_14_4:setPosition(var_14_7, var_14_8)
				var_14_3:addChild(var_14_4)

				local var_14_9 = CCArray:create()

				var_14_9:addObject(CCDelayTime:create(0.3))
				var_14_9:addObject(CCFadeOut:create(1))
				var_14_9:addObject(CCCallFunc:create(function()
					var_14_4:removeFromParentAndCleanup(true)

					var_14_4 = nil
				end))
				var_14_4:runAction(CCSequence:create(var_14_9))

				arg_13_0.bjSprite = var_14_4
			end

			local var_14_10 = {}

			for iter_14_0, iter_14_1 in ipairs(var_14_0.rewards) do
				local var_14_11 = {
					id = var_0_6[iter_14_1.type],
					value = iter_14_1.num
				}

				table.insert(var_14_10, var_14_11)
			end

			globalAction_gotResource(var_14_10)

			arg_13_0.isOpenBox = true
		end

		arg_13_0:refresh()
	end

	if arg_13_1 == 1 and arg_13_0.info.leftGoldenBox == 0 then
		messageBox.showChargeWin("", language.get(136279, arg_13_0.info.openGoldenBoxGold), "christmasOpenGoldenBox", function()
			cmgr.sendRequest(var_13_0, actions.boatGetReward, arg_13_1)
		end)
	else
		cmgr.sendRequest(var_13_0, actions.boatGetReward, arg_13_1)
	end
end

function var_0_14.onStartMatch(arg_17_0)
	local function var_17_0(arg_18_0)
		arg_17_0:refresh()
	end

	cmgr.sendRequest(var_17_0, actions.boatStartMatch)
end

function var_0_14.onAutoFlip(arg_19_0)
	local function var_19_0(arg_20_0)
		return
	end

	cmgr.sendRequest(var_19_0, actions.boatAutoFlip)
end

function var_0_14.onUnwatch(arg_21_0)
	local function var_21_0(arg_22_0)
		return
	end

	cmgr.sendRequest(var_21_0, actions.boatUnwatch)
end

function var_0_14.onGoBack(arg_23_0)
	local function var_23_0(arg_24_0)
		arg_23_0.isOpenBox = false

		arg_23_0:showPanel(arg_24_0.action.data)
	end

	cmgr.sendRequest(var_23_0, actions.boatGoBack)
end

function var_0_14.getHawkFeat(arg_25_0)
	local function var_25_0(arg_26_0)
		local var_26_0 = arg_26_0.action.data

		arg_25_0.view.widgets.light:setVisible(false)
		arg_25_0.view.widgets.feat:setVisible(false)

		local var_26_1 = {}

		for iter_26_0, iter_26_1 in ipairs(var_26_0.rewards) do
			local var_26_2 = {
				id = var_0_6[iter_26_1.type],
				value = iter_26_1.num
			}

			table.insert(var_26_1, var_26_2)
		end

		globalAction_gotResource(var_26_1)
		arg_25_0:showEffectEagleExit()
	end

	cmgr.sendRequest(var_25_0, actions.getHawkFeat)
end

function var_0_14.addAllSantas(arg_27_0)
	arg_27_0.santaTable = {}

	local var_27_0 = {
		[-2] = {
			z = 10,
			pos = ccp(80, 260)
		},
		{
			z = 11,
			pos = ccp(690, 240)
		},
		[0] = {
			z = 12,
			pos = ccp(250, 210)
		},
		{
			z = 30,
			pos = ccp(570, 150)
		},
		[-1] = {
			z = 31,
			pos = ccp(140, 140)
		}
	}

	for iter_27_0 = -2, 2 do
		local var_27_1 = CCNode:create()

		var_27_1:setPosition(var_27_0[iter_27_0].pos)
		arg_27_0.view.widgets.layer_bg:addChild(var_27_1, var_27_0[iter_27_0].z)

		local var_27_2 = CCSpriteBatchNode:create("res/ui/activity/dragonBoat/boatmove.png")

		var_27_1:addChild(var_27_2)

		local var_27_3 = iter_27_0 == 0
		local var_27_4 = var_27_3 and 198 or 166
		local var_27_5 = var_27_3 and 20 or 20
		local var_27_6 = var_27_3 and "lzds_lz_01.png" or "lzds_lz_03.png"
		local var_27_7 = var_27_3 and "shuishouAni0001.png" or "shuishouAni0001.png"
		local var_27_8 = CCSprite:createWithSpriteFrameName(var_27_6)

		var_27_2:addChild(var_27_8)

		local var_27_9 = var_27_3 and 8 or 5
		local var_27_10 = {}

		for iter_27_1 = 1, var_27_9 do
			local var_27_11 = CCSprite:createWithSpriteFrameName(var_27_7)

			var_27_11:setPosition(var_27_4 - 14 * (iter_27_1 - 1), var_27_5)
			var_27_8:addChild(var_27_11)
			table.insert(var_27_10, var_27_11)

			if not var_27_3 then
				local var_27_12 = CCArray:create()

				for iter_27_2 = 1, 14 do
					local var_27_13 = CCSprite:createWithSpriteFrameName(string.format("shuishouAni00%02d.png", iter_27_2))

					var_27_12:addObject(var_27_13:displayFrame())
				end

				local var_27_14 = CCAnimation:createWithSpriteFrames(var_27_12, 0.1)
				local var_27_15 = CCAnimate:create(var_27_14)

				var_27_11:runAction(CCRepeatForever:create(var_27_15))
			end
		end

		local var_27_16 = CCStrokeLabelTTF:create("名字", "Thonburi", 20, 1)

		var_27_16:setPosition(var_27_3 and 30 or 20, 30)
		var_27_1:addChild(var_27_16)

		local var_27_17
		local var_27_18

		if var_27_3 then
			var_27_17 = CCStrokeLabelTTF:create("0/5", "Thonburi", 20, 1)

			var_27_17:setPosition(30, -30)
			var_27_17:setVisible(false)
			var_27_1:addChild(var_27_17)

			local var_27_19 = CCScale9Sprite:create("res/default.png")
			local var_27_20 = CCControlButton:create(var_27_19)

			var_27_20:setPreferredSize(CCSizeMake(440, 110))
			var_27_20:setPosition(134, 0)
			var_27_20:setVisible(false)
			var_27_1:addChild(var_27_20)
			var_27_20:addHandleOfControlEvent(function()
				log.info("btn_num")

				arg_27_0.num_touch = arg_27_0.num_touch or 0
				arg_27_0.num_touch = arg_27_0.num_touch + 1

				if arg_27_0.num_touch >= 5 then
					arg_27_0:onClearState(0)
				else
					var_27_17:setString(string.format("%s/5", arg_27_0.num_touch))
				end
			end, CCControlEventTouchUpInside)

			arg_27_0.node_santa = var_27_1
			arg_27_0.name_santa = var_27_16
			arg_27_0.santa = var_27_8
			arg_27_0.deers = var_27_10
			arg_27_0.lbl_num = var_27_17
			arg_27_0.btn_num = var_27_20
		end

		arg_27_0.santaTable[iter_27_0] = {
			node = var_27_1,
			name = var_27_16
		}
	end
end

function var_0_14.setSantaState(arg_29_0, arg_29_1)
	if arg_29_0.state == arg_29_1 then
		return
	end

	arg_29_0.node_santa:removeChildByTag(888, true)
	arg_29_0.santa:stopAllActions()
	arg_29_0.santa:setDisplayFrame(tool.spriteFrameByName("lzds_lz_01.png"))

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.deers) do
		iter_29_1:stopAllActions()
		iter_29_1:setPosition(198 - 14 * (iter_29_0 - 1), 20)
		iter_29_1:setDisplayFrame(tool.spriteFrameByName("shuishouAni0001.png"))
	end

	if arg_29_1 == var_0_8 or arg_29_1 == var_0_9 then
		local var_29_0 = CCArray:create()

		if arg_29_1 == var_0_9 then
			local var_29_1 = CCSprite:create("res/ui/activity/dragonBoat/lzds_shuicao.png")

			var_29_1:setScale(0.4)
			arg_29_0.node_santa:addChild(var_29_1, 9, 888)
		end

		local var_29_2 = CCAnimation:createWithSpriteFrames(var_29_0, 0.1)
		local var_29_3 = CCAnimate:create(var_29_2)

		arg_29_0.santa:runAction(CCRepeatForever:create(var_29_3))

		for iter_29_2, iter_29_3 in ipairs(arg_29_0.deers) do
			local var_29_4 = CCArray:create()

			for iter_29_4 = 1, 14 do
				local var_29_5 = CCSprite:createWithSpriteFrameName(string.format("shuishouAni00%02d.png", iter_29_4))

				var_29_4:addObject(var_29_5:displayFrame())
			end

			local var_29_6 = CCAnimation:createWithSpriteFrames(var_29_4, 0.1)
			local var_29_7 = CCAnimate:create(var_29_6)

			iter_29_3:runAction(CCRepeatForever:create(var_29_7))
		end
	end

	arg_29_0.node_santa:stopAllActions()

	local var_29_8 = arg_29_0.node_santa:getPositionX()
	local var_29_9

	if arg_29_1 == var_0_9 then
		var_29_9 = 80
	elseif arg_29_1 == var_0_8 then
		var_29_9 = 250
	end

	if var_29_9 then
		local var_29_10 = math.abs(var_29_9 - var_29_8) / 50
		local var_29_11 = CCArray:create()

		var_29_11:addObject(CCMoveBy:create(var_29_10, ccp(var_29_9 - var_29_8, 0)))
		var_29_11:addObject(CCCallFunc:create(function()
			return
		end))

		local var_29_12 = CCSequence:create(var_29_11)

		arg_29_0.node_santa:runAction(var_29_12)
	end

	arg_29_0:showNumTouch(arg_29_1 == var_0_9)

	arg_29_0.state = arg_29_1
end

function var_0_14.getRewardNode(arg_31_0, arg_31_1, arg_31_2)
	table.sort(arg_31_1, function(arg_32_0, arg_32_1)
		return arg_32_0.type < arg_32_1.type
	end)

	local var_31_0 = {}

	uiutil.initWidgets(var_31_0, arg_31_0.layout_reward)
	var_31_0.widgets.txt:setString(language.get(arg_31_2 and 136251 or 136259))

	for iter_31_0, iter_31_1 in ipairs(arg_31_1) do
		if iter_31_1.type ~= 0 then
			local var_31_1

			if iter_31_1.type == 1 then
				var_31_1 = tool.spriteFrameByName("btkd_box.png")
			else
				var_31_1 = CCSprite:create("res/ui/activity/dragonBoat/btkd_box_r.png"):displayFrame()
			end

			var_31_0.widgets.box:setDisplayFrame(var_31_1)
			var_31_0.widgets.num:setString(language.get(135039, iter_31_1.value))
		end
	end

	local var_31_2 = arg_31_1[1]

	if var_31_2.type == 0 then
		var_31_0.widgets.bg_icon:setVisible(true)
		var_31_0.widgets.icon:setDisplayFrame(tool.spriteFrameByName(string.format("%s.jpg", var_31_2.pic)))
		var_31_0.widgets.name:setString(var_31_2.name)
	end

	if arg_31_2 then
		local var_31_3 = var_31_0.widgets.txt:getContentSize().width * 0.5

		if var_31_2.type == 0 then
			var_31_3 = var_31_3 - 30
		end

		var_31_0.widgets.node:setPositionX(var_31_3)
	end

	return var_31_0.widgets.node
end

function var_0_14.showMatchInfo(arg_33_0)
	arg_33_0.view.widgets.layer_info:removeAllChildrenWithCleanup(true)

	arg_33_0.infoIdx = arg_33_0.infoIdx or 1
	arg_33_0.info.ranks = arg_33_0.info.ranks or {}

	if arg_33_0.infoIdx > #arg_33_0.info.ranks then
		arg_33_0.infoIdx = 1
	end

	local var_33_0 = arg_33_0.info.ranks[arg_33_0.infoIdx]

	if var_33_0 then
		local var_33_1 = CCNode:create()

		var_33_1:setPosition(0, 22)
		arg_33_0.view.widgets.layer_info:addChild(var_33_1)

		local var_33_2 = CCLabelTTF:create(language.get(136258), "", 22)

		var_33_2:setAnchorPoint(ccp(0, 0.5))
		var_33_2:setPosition(190, 0)
		var_33_1:addChild(var_33_2)

		local var_33_3 = CCLabelTTF:create(language.get(136260, var_33_0.rank, var_33_0.playerName, var_33_0.miles), "", 22)

		var_33_3:setAnchorPoint(ccp(0, 0.5))
		var_33_3:setPosition(330, 0)
		var_33_1:addChild(var_33_3)

		local var_33_4 = arg_33_0:getRewardNode(var_33_0.rewards)

		var_33_4:setPosition(680, 0)
		var_33_1:addChild(var_33_4)
		var_33_1:setPosition(0, -18)

		local var_33_5 = CCArray:create()

		var_33_5:addObject(CCMoveBy:create(0.3, ccp(0, 40)))
		var_33_5:addObject(CCDelayTime:create(2))
		var_33_5:addObject(CCMoveBy:create(0.3, ccp(0, 40)))
		var_33_5:addObject(CCCallFunc:create(function()
			var_33_1:removeFromParentAndCleanup(true)
			arg_33_0:showMatchInfo()
		end))

		local var_33_6 = CCSequence:create(var_33_5)

		var_33_1:runAction(var_33_6)

		arg_33_0.infoIdx = arg_33_0.infoIdx + 1
	end
end

function var_0_14.showTip(arg_35_0)
	log.info("should show tips ")

	local var_35_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_35_0:registerScriptTouchHandler(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == CCTOUCHBEGAN then
			return true
		elseif arg_36_0 == CCTOUCHMOVED then
			return true
		elseif arg_36_0 == CCTOUCHENDED then
			pcall(var_35_0.removeFromParentAndCleanup, var_35_0, true)

			return true
		end
	end, false, true)
	var_35_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_35_0, 60000)

	local var_35_1 = 0
	local var_35_2 = 0
	local var_35_3 = {}

	uiutil.initWidgets(var_35_3, arg_35_0.tipFrame)
	var_35_0:addChild(var_35_3.widgets.tipFrame)

	local var_35_4 = arg_35_0.view.widgets.btn_tip
	local var_35_5, var_35_6 = tool.getPositionInScreen(var_35_4)
	local var_35_7 = var_35_5 + 20
	local var_35_8 = var_35_6 - 20
	local var_35_9 = var_35_3.widgets.tipMsg:getContentSize().width
	local var_35_10 = var_35_3.widgets.tipMsg:getContentSize().height

	var_35_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_35_9 + 30, var_35_10 + 30))
	var_35_3.widgets.tipFrame:setPosition(ccp(var_35_7, var_35_8))
	var_35_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_35_3.widgets.tipMsg:setString(language.get(136269, arg_35_0.info.intro))
	var_35_3.widgets.tipFrame:setVisible(true)
end

function var_0_14.updateSantas(arg_37_0)
	for iter_37_0, iter_37_1 in pairs(arg_37_0.info.boat) do
		local var_37_0 = iter_37_1.index

		arg_37_0.santaTable[var_37_0].node:setVisible(iter_37_1.hasBoat)

		if iter_37_1.hasBoat then
			arg_37_0.santaTable[var_37_0].name:setString(language.get(136270, iter_37_1.playerName, iter_37_1.miles))
		end

		if var_37_0 == 0 then
			arg_37_0.lbl_num:stopAllActions()

			local var_37_1 = 0

			if iter_37_1.slow[1] and iter_37_1.slow[1].cds and iter_37_1.slow[1].cds[1] and iter_37_1.slow[1].cds[1] > 0 then
				var_37_1 = iter_37_1.slow[1].cds[1]
			end

			if var_37_1 > 0 then
				arg_37_0:setSantaState(var_0_9)

				local var_37_2 = CCArray:create()

				var_37_2:addObject(CCDelayTime:create(var_37_1 / 1000))
				var_37_2:addObject(CCCallFunc:create(function()
					arg_37_0:setSantaState(var_0_8)
				end))

				local var_37_3 = CCSequence:create(var_37_2)

				arg_37_0.lbl_num:runAction(var_37_3)
			else
				arg_37_0:setSantaState(var_0_8)
			end
		end
	end
end

function var_0_14.updateMatch(arg_39_0)
	arg_39_0:updateSantas()
	arg_39_0:updateSnowball()
	arg_39_0:updateRank()
end

function var_0_14.updateSnowball(arg_40_0)
	arg_40_0.info.barriers = arg_40_0.info.barriers or {}

	table.sort(arg_40_0.info.barriers, function(arg_41_0, arg_41_1)
		return arg_41_0.position < arg_41_1.position
	end)

	local var_40_0 = arg_40_0.info.barriers[1]

	if var_40_0 and var_40_0.time <= 2 and arg_40_0.state == var_0_8 and arg_40_0.isRunning == true and arg_40_0.speed == var_0_11 then
		if arg_40_0.view.widgets.btn_snowball:isVisible() then
			if arg_40_0.pos_snowball == var_40_0.position then
				-- block empty
			else
				arg_40_0.pos_snowball = var_40_0.position

				arg_40_0:showEffectSnowball()
			end
		else
			arg_40_0.pos_snowball = var_40_0.position

			arg_40_0:showEffectSnowball()
		end
	else
		arg_40_0.view.widgets.btn_snowball:setVisible(false)
	end
end

function var_0_14.updateRank(arg_42_0)
	arg_42_0.view.widgets.rank2:setString(arg_42_0.info.rank)
	arg_42_0.view.widgets.richLine2:reorder()
	arg_42_0.view.widgets.node_reward2:removeAllChildrenWithCleanup(true)

	local var_42_0 = arg_42_0:getRewardNode(arg_42_0.info.rewards, true)

	arg_42_0.view.widgets.node_reward2:addChild(var_42_0)
end

function var_0_14.showNumTouch(arg_43_0, arg_43_1)
	if arg_43_1 == true then
		arg_43_0.lbl_num:setVisible(true)
		arg_43_0.btn_num:setVisible(true)

		arg_43_0.num_touch = arg_43_0.num_touch or 0

		arg_43_0.lbl_num:setString(string.format("%s/5", arg_43_0.num_touch))
	else
		arg_43_0.num_touch = 0

		arg_43_0.lbl_num:setVisible(false)
		arg_43_0.btn_num:setVisible(false)
	end
end

function var_0_14.showEffectEagleEnter(arg_44_0)
	arg_44_0.view.widgets.btn_eagle:setVisible(true)
	arg_44_0.view.widgets.btn_eagle:stopAllActions()
	arg_44_0.view.widgets.btn_eagle:setPosition(-70, 480)
	arg_44_0.view.widgets.btn_eagle:setEnabled(true)
	arg_44_0.view.widgets.light:setVisible(true)
	arg_44_0.view.widgets.feat:setVisible(true)

	local var_44_0 = CCArray:create()

	var_44_0:addObject(CCEaseSineOut:create(CCMoveTo:create(2, ccp(460, 380))))
	var_44_0:addObject(CCDelayTime:create(2))
	var_44_0:addObject(CCCallFunc:create(function()
		arg_44_0:showEffectEagleExit()
	end))

	local var_44_1 = CCSequence:create(var_44_0)

	arg_44_0.view.widgets.btn_eagle:runAction(var_44_1)
end

function var_0_14.showEffectEagleExit(arg_46_0)
	arg_46_0.view.widgets.btn_eagle:stopAllActions()
	arg_46_0.view.widgets.btn_eagle:runAction(CCEaseSineIn:create(CCMoveTo:create(2, ccp(990, 480))))
end

function var_0_14.showEffectSnowball(arg_47_0)
	arg_47_0.view.widgets.pos_snowball:setString(string.format("%sm", arg_47_0.pos_snowball))
	arg_47_0.view.widgets.btn_snowball:setVisible(true)
	arg_47_0.view.widgets.btn_snowball:stopAllActions()
	arg_47_0.view.widgets.btn_snowball:setPosition(860, 200)

	local var_47_0 = CCArray:create()

	var_47_0:addObject(CCMoveTo:create(4, ccp(150, 200)))
	var_47_0:addObject(CCCallFunc:create(function()
		arg_47_0.view.widgets.btn_snowball:setVisible(false)
	end))

	local var_47_1 = CCSequence:create(var_47_0)

	arg_47_0.view.widgets.btn_snowball:runAction(var_47_1)
end

function var_0_14.showEffectMatchEnd(arg_49_0)
	arg_49_0.isRunning = false
	arg_49_0.speed = var_0_10

	arg_49_0.view.widgets.bg_info:setVisible(false)
	arg_49_0.view.widgets.bg_down:setVisible(false)

	local var_49_0 = CCSprite:create("res/ui/saotao/stfx_long_bg.png")
	local var_49_1 = CCSprite:create("res/ui/activity/dragonBoat/lzds_word_lzdsjs.png")

	var_49_1:setPosition(ccp(454, 85))
	var_49_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 80))
	var_49_0:addChild(var_49_1)
	smgr.showTipSpriteText(var_49_0, function()
		arg_49_0:refresh()
	end)
end

function var_0_14.showEffectFast(arg_51_0)
	arg_51_0.view.widgets.btn_snowball:setVisible(false)

	arg_51_0.isRunning = true
	arg_51_0.speed = var_0_12

	for iter_51_0 = -2, 2 do
		if iter_51_0 ~= 0 then
			arg_51_0.santaTable[iter_51_0].node:setVisible(false)
		end
	end

	arg_51_0.view.widgets.btn_hitDrum:stopAllActions()

	local var_51_0 = CCArray:create()

	var_51_0:addObject(CCDelayTime:create(2))
	var_51_0:addObject(CCCallFunc:create(function()
		arg_51_0.isRunning = true
		arg_51_0.speed = var_0_11
	end))

	local var_51_1 = CCSequence:create(var_51_0)

	arg_51_0.view.widgets.btn_hitDrum:runAction(var_51_1)
end

function var_0_14.showPanel(arg_53_0, arg_53_1)
	arg_53_0.info = arg_53_1

	local var_53_0 = arg_53_1.state == 0
	local var_53_1 = arg_53_1.state == 1
	local var_53_2 = arg_53_1.state == 2

	arg_53_0.view.widgets.startBg1:setVisible(false)
	arg_53_0.view.widgets.endBg1:setVisible(false)
	arg_53_0.view.widgets.bg_deerInfo:setVisible(var_53_0)
	arg_53_0.view.widgets.flag_begin:setVisible(var_53_0)
	arg_53_0.view.widgets.flag_end:setVisible(var_53_2)
	arg_53_0.view.widgets.bg_info:setVisible(var_53_1)
	arg_53_0.view.widgets.btn_hitDrum:setVisible(var_53_1)
	arg_53_0.view.widgets.btn_hitDrum:stopAllActions()
	arg_53_0.view.widgets.node_state0:setVisible(var_53_0)
	arg_53_0.view.widgets.node_state1:setVisible(var_53_1)
	arg_53_0.view.widgets.btn_goBack:setVisible(false)
	arg_53_0.view.widgets.btn_show:setVisible(false)
	arg_53_0.view.widgets.bg_time:setVisible(false)
	arg_53_0.view.widgets.timer:stopAllActions()
	arg_53_0.view.widgets.timer2:stopAllActions()
	arg_53_0.view.widgets.btn_buySailor:setVisible(false)
	arg_53_0.view.widgets.btn_snowball:setVisible(false)
	arg_53_0.view.widgets.btn_eagle:setVisible(false)
	arg_53_0.view.widgets.bg_down:setVisible(true)
	arg_53_0.lbl_num:stopAllActions()

	arg_53_0.isRunning = false
	arg_53_0.speed = var_0_10

	for iter_53_0 = -2, 2 do
		arg_53_0.santaTable[iter_53_0].node:setVisible(false)
	end

	if var_53_0 then
		arg_53_0.view.widgets.startBg1:setVisible(true)
		arg_53_0.view.widgets.btn_startMatch:setVisible(false)
		arg_53_0.view.widgets.needDeer:setString(language.get(136305))
		arg_53_0.view.widgets.needDeer:setVisible(false)
		arg_53_0.view.widgets.btn_city:setVisible(false)
		arg_53_0.view.widgets.freeTimes:setVisible(false)
		arg_53_0.view.widgets.deerInfo:setString(language.get(136261, arg_53_1.speed, arg_53_1.nowNum, arg_53_1.maxNum))

		local var_53_3 = arg_53_1.nowNum >= arg_53_1.maxNum

		arg_53_0.view.widgets.btn_buySailor:setVisible(not var_53_3 and arg_53_1.allMatchEndCd > 0)

		if not var_53_3 then
			arg_53_0.view.widgets.buySailorGold:setString(arg_53_1.buySailorGold)
		end

		local var_53_4 = arg_53_1.nowNum >= arg_53_1.minNum
		local var_53_5 = arg_53_1.maxFreeTimes - arg_53_1.playTimes

		if arg_53_1.allMatchEndCd > 0 then
			arg_53_0.view.widgets.btn_startMatch:setVisible(var_53_4)
			arg_53_0.view.widgets.needDeer:setVisible(not var_53_4)
			arg_53_0.view.widgets.needDeer:setPositionY(75)

			if var_53_4 and arg_53_1.playEndCd <= 0 and arg_53_1.matchCd > 0 then
				arg_53_0.view.widgets.btn_startMatch:setVisible(false)
				arg_53_0.view.widgets.needDeer:setString(language.get(136300))
				arg_53_0.view.widgets.needDeer:setVisible(true)
			end

			if var_53_3 then
				arg_53_0.view.widgets.freeTimes:setString(language.get(136253, var_53_5))
				arg_53_0.view.widgets.freeTimes:setVisible(true)
			elseif type(arg_53_1.cityId) == "number" then
				arg_53_0.view.widgets.btn_city:setVisible(true)
			else
				arg_53_0.view.widgets.freeTimes:setString(language.get(136268))
				arg_53_0.view.widgets.freeTimes:setVisible(true)
			end
		else
			arg_53_0.view.widgets.btn_startMatch:setVisible(false)
			arg_53_0.view.widgets.needDeer:setString(language.get(136301))
			arg_53_0.view.widgets.needDeer:setVisible(true)
			arg_53_0.view.widgets.needDeer:setPositionY(60)
		end

		arg_53_0.view.widgets.btn_show:setVisible(true)

		if arg_53_0.isOpenBox == true then
			arg_53_0.isOpenBox = false
		else
			arg_53_0.view.widgets.node_btnShow:setScaleX(1)
			arg_53_0.view.widgets.bg_rank:setPositionX(1328)
		end
	elseif var_53_1 then
		arg_53_0.view.widgets.node_reward2:removeAllChildrenWithCleanup(true)
		arg_53_0.view.widgets.bg_info:setVisible(true)
		arg_53_0.view.widgets.btn_hitDrum:setVisible(true)
		arg_53_0.view.widgets.leftSilverBox2:setString(language.get(135039, arg_53_1.leftSilverBox))
		arg_53_0.view.widgets.leftGoldenBox2:setString(language.get(135039, arg_53_1.leftGoldenBox))

		local var_53_6 = arg_53_1.leftFreeDrums > 0

		arg_53_0.view.widgets.buyDrumGold:setPositionX(var_53_6 and 35 or 45)
		arg_53_0.view.widgets.buyDrumGold:setString(var_53_6 and language.get(85060) or arg_53_1.buyDrumGold)
		arg_53_0.view.widgets.icon_gold:setVisible(not var_53_6)
		arg_53_0:showMatchInfo()
		arg_53_0.view.widgets.round2:setString(language.get(arg_53_1.matchCd > 0 and 136298 or 136299))
		arg_53_0.view.widgets.round2:setColor(arg_53_1.matchCd > 0 and var_0_1 or var_0_5)

		local var_53_7 = CCArray:create()

		var_53_7:addObject(CCCallFunc:create(function()
			if arg_53_1.matchEndCd <= 0 then
				arg_53_0.view.widgets.timer2:stopAllActions()
				arg_53_0:showEffectMatchEnd()
			else
				arg_53_0.view.widgets.timer2:setString(tool.getFormatTime(arg_53_1.matchEndCd))
			end
		end))
		var_53_7:addObject(CCDelayTime:create(0.5))

		local var_53_8 = CCSequence:create(var_53_7)

		arg_53_0.view.widgets.timer2:runAction(CCRepeatForever:create(var_53_8))
		arg_53_0:updateMatch()

		arg_53_0.isRunning = true
		arg_53_0.speed = var_0_11
	elseif var_53_2 then
		if arg_53_1.matchCd > 0 then
			arg_53_0.view.widgets.btn_goBack:setVisible(true)
		else
			arg_53_0.view.widgets.bg_down:setVisible(false)
			arg_53_0.view.widgets.bg_winner:setVisible(true)
			arg_53_0.view.widgets.icon_winner:setDisplayFrame(CCSprite:create(string.format("res/ui/common/playerHead/playerHead_icon_%s.png", arg_53_1.winnerPic)):displayFrame())
			arg_53_0.view.widgets.winnerName:setString(arg_53_1.winnerName)
		end

		arg_53_0.view.widgets.node_btnShow:setScaleX(-1)
		arg_53_0.view.widgets.bg_rank:setPositionX(906)
		arg_53_0.view.widgets.endBg1:setVisible(true)
	end

	if var_53_0 or var_53_2 then
		arg_53_0:setSantaState(var_0_7)
		arg_53_0.node_santa:setVisible(true)
		arg_53_0.node_santa:setPosition(150, 200)
		arg_53_0.name_santa:setVisible(false)

		local var_53_9 = arg_53_1.nowNum > 4 and 4 or arg_53_1.nowNum

		for iter_53_1 = 1, 4 do
			arg_53_0.deers[iter_53_1]:setVisible(iter_53_1 <= var_53_9)
		end
	else
		arg_53_0.name_santa:setVisible(true)

		for iter_53_2 = 1, 4 do
			arg_53_0.deers[iter_53_2]:setVisible(true)
		end
	end

	if var_53_0 or var_53_2 then
		arg_53_0.view.widgets.bg_time:setPositionX(var_53_0 and 458 or 240)

		local var_53_10
		local var_53_11

		if arg_53_1.playStartCd > 0 then
			var_53_10 = 136278
			var_53_11 = "playStartCd"
		elseif arg_53_1.playEndCd > 0 then
			var_53_10 = 136257
			var_53_11 = "playEndCd"
		elseif arg_53_1.matchCd > 0 then
			arg_53_1.matchCd = arg_53_1.matchCd + 3000
			var_53_10 = 136250
			var_53_11 = "matchCd"
		else
			var_53_10 = arg_53_1.allMatchEndCd > 0 and 136250 or var_53_10
		end

		if var_53_10 then
			arg_53_0.view.widgets.state_time:setString(language.get(var_53_10))
			arg_53_0.view.widgets.bg_time:setVisible(true)
		end

		if var_53_11 and arg_53_1[var_53_11] and arg_53_1[var_53_11] > 0 then
			local var_53_12 = CCArray:create()

			var_53_12:addObject(CCCallFunc:create(function()
				if arg_53_1[var_53_11] <= 0 then
					arg_53_0.view.widgets.timer:stopAllActions()
					arg_53_0:refresh()
				else
					arg_53_0.view.widgets.timer:setString(tool.getFormatTime(arg_53_1[var_53_11]))
				end
			end))
			var_53_12:addObject(CCDelayTime:create(0.5))

			local var_53_13 = CCSequence:create(var_53_12)

			arg_53_0.view.widgets.timer:runAction(CCRepeatForever:create(var_53_13))
		end
	end

	local var_53_14 = arg_53_1.state ~= 1 and arg_53_1.rank ~= nil and arg_53_1.rank > 0

	arg_53_0.view.widgets.bg_rank:setVisible(var_53_14)

	if var_53_14 then
		local var_53_15

		if arg_53_1.matchCd > 0 then
			var_53_15 = language.get(136297, arg_53_1.playTimes)
		else
			var_53_15 = language.get(136299)
		end

		arg_53_0.view.widgets.round:setString(var_53_15)
		arg_53_0.view.widgets.selfMiles:setString(language.get(136254, arg_53_1.selfMiles))
		arg_53_0.view.widgets.rank:setString(arg_53_1.rank)
		arg_53_0.view.widgets.richLine:reorder()
		arg_53_0.view.widgets.leftSilverBox:setString(language.get(135039, arg_53_1.leftSilverBox))
		arg_53_0.view.widgets.leftGoldenBox:setString(language.get(135039, arg_53_1.leftGoldenBox))
		arg_53_0.view.widgets.btn_silverBox:setEnabled(arg_53_1.leftSilverBox > 0)
		arg_53_0.view.widgets.openGoldenBoxGold:setString(arg_53_1.leftGoldenBox > 0 and language.get(85060) or arg_53_1.openGoldenBoxGold)
		table.sort(arg_53_1.rewards, function(arg_56_0, arg_56_1)
			return arg_56_0.type < arg_56_1.type
		end)

		for iter_53_3, iter_53_4 in ipairs(arg_53_1.rewards) do
			if iter_53_4.type ~= 0 then
				local var_53_16

				if iter_53_4.type == 1 then
					var_53_16 = tool.spriteFrameByName("btkd_box.png")
				else
					var_53_16 = CCSprite:create("res/ui/activity/dragonBoat/btkd_box_r.png"):displayFrame()
				end

				arg_53_0.view.widgets.icon_reward:setDisplayFrame(var_53_16)
				arg_53_0.view.widgets.num_reward:setString(language.get(135039, iter_53_4.value))
			end
		end

		local var_53_17 = arg_53_1.rewards[1]
		local var_53_18 = var_53_17.type == 0 and arg_53_1.leftMedal ~= 0

		arg_53_0.view.widgets.bg_treasure:setVisible(var_53_18)

		if var_53_18 then
			arg_53_0.view.widgets.icon_treasure:setDisplayFrame(tool.spriteFrameByName(string.format("%s.jpg", var_53_17.pic)))
		end
	end
end

function var_0_14.ctor(arg_57_0, arg_57_1, arg_57_2)
	log.info("@@ 圣诞雪橇")
	rmgr.loadResource("res/ui/activity/dragonBoat/eagle.plist")
	rmgr.loadResource("res/ui/activity/dragonBoat/santa.plist")
	rmgr.loadResource("res/ui/activity/dragonBoat/snowball.plist")
	rmgr.loadResource("res/ui/activity/dragonBoat/boatmove.plist")
	rmgr.loadResource("res/ui/activity/dragonBoat/obstacle1.plist")
	rmgr.loadResource("res/ui/activity/dragonBoat/obstacle2.plist")
	rmgr.loadResource("res/ui/activity/ironMine/ironMinePic.plist")
	rmgr.loadResource("res/ui/activity/lantern/lanternPic.plist")

	arg_57_0.view = {}

	uiutil.initWidgets(arg_57_0.view, arg_57_0.layout)

	arg_57_0.leftTime = arg_57_0.view.widgets.leftTime

	if arg_57_1 then
		arg_57_0:addChild(arg_57_0.view.widgets.root)
		arg_57_1:addChild(arg_57_0)
	end

	arg_57_0.view.widgets.view_bg:setTouchEnabled(false)
	arg_57_0.view.widgets.view_rank:setTouchEnabled(false)
	arg_57_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_57_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_buySailor:addHandleOfControlEvent(function()
		log.info("btn_buySailor")
		arg_57_0:onBuySailor()
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_startMatch:addHandleOfControlEvent(function()
		log.info("btn_startMatch")
		arg_57_0:onStartMatch()
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_city:addHandleOfControlEvent(function()
		log.info("btn_city")

		local var_61_0 = arg_57_0.info.cityId

		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		loadingLayer.show(SCENE_WORLD, var_61_0)
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_goBack:addHandleOfControlEvent(function()
		log.info("btn_goBack")
		arg_57_0:onGoBack()
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_hitDrum:addHandleOfControlEvent(function()
		log.info("btn_hitDrum")
		arg_57_0:onHitDrum()
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_show:addHandleOfControlEvent(function()
		log.info("btn_show")

		local var_64_0 = arg_57_0.view.widgets.node_btnShow:getScaleX()
		local var_64_1 = arg_57_0.view.widgets.bg_rank:getPositionX()
		local var_64_2 = var_64_0 > 0 and 906 or 1328
		local var_64_3 = math.abs(var_64_2 - var_64_1) / 800

		arg_57_0.view.widgets.bg_rank:stopAllActions()

		local var_64_4 = CCArray:create()

		var_64_4:addObject(CCCallFunc:create(function()
			if var_64_0 > 0 then
				arg_57_0.view.widgets.btn_silverBox:setVisible(true)
				arg_57_0.view.widgets.btn_goldenBox:setVisible(true)
			end
		end))
		var_64_4:addObject(CCMoveBy:create(var_64_3, ccp(var_64_2 - var_64_1, 0)))
		var_64_4:addObject(CCCallFunc:create(function()
			arg_57_0.view.widgets.node_btnShow:setScaleX(-1 * var_64_0)

			if var_64_0 < 0 then
				arg_57_0.view.widgets.btn_silverBox:setVisible(false)
				arg_57_0.view.widgets.btn_goldenBox:setVisible(false)
			end
		end))

		local var_64_5 = CCSequence:create(var_64_4)

		arg_57_0.view.widgets.bg_rank:runAction(var_64_5)
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_silverBox:addHandleOfControlEvent(function()
		log.info("btn_silverBox")
		arg_57_0:onGetReward(2)
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_goldenBox:addHandleOfControlEvent(function()
		log.info("btn_goldenBox")
		arg_57_0:onGetReward(1)
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_snowball:addHandleOfControlEvent(function()
		log.info("btn_snowball")
		arg_57_0:onClearState(arg_57_0.pos_snowball)
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_eagle:addHandleOfControlEvent(function()
		log.info("btn_eagle")
		arg_57_0:getHawkFeat()
	end, CCControlEventTouchUpInside)

	local var_57_0 = CCArray:create()

	for iter_57_0 = 1, 12 do
		local var_57_1 = CCSprite:createWithSpriteFrameName(string.format("eagle_%02d.png", iter_57_0))

		var_57_0:addObject(var_57_1:displayFrame())
	end

	local var_57_2 = CCAnimation:createWithSpriteFrames(var_57_0, 0.1)
	local var_57_3 = CCAnimate:create(var_57_2)

	arg_57_0.view.widgets.eagle:runAction(CCRepeatForever:create(var_57_3))

	local var_57_4 = CCArray:create()

	var_57_4:addObject(CCFadeOut:create(0.3))
	var_57_4:addObject(CCFadeIn:create(0.3))

	local var_57_5 = CCSequence:create(var_57_4)

	arg_57_0.view.widgets.light:runAction(CCRepeatForever:create(var_57_5))

	local var_57_6 = CCArray:create()

	for iter_57_1 = 1, 15 do
		local var_57_7 = CCSprite:createWithSpriteFrameName(string.format("obstacleA%02d.png", iter_57_1))

		var_57_6:addObject(var_57_7:displayFrame())
	end

	local var_57_8 = CCAnimation:createWithSpriteFrames(var_57_6, 0.1)
	local var_57_9 = CCAnimate:create(var_57_8)

	arg_57_0.view.widgets.snowball:runAction(CCRepeatForever:create(var_57_9))
	arg_57_0.view.widgets.btn_mask:addHandleOfControlEvent(function()
		log.info("btn_mask")
	end, CCControlEventTouchUpInside)
	arg_57_0.view.widgets.btn_treasure:addHandleOfControlEvent(function()
		log.info("btn_treasure")
		arg_57_0:onGetReward(0)
	end, CCControlEventTouchUpInside)
	arg_57_0:addAllSantas()

	arg_57_0.state = var_0_7

	arg_57_0:showPanel(arg_57_2)
end

function var_0_14.onEnter(arg_73_0)
	arg_73_0.handlerPushBoatActionRef = handler(arg_73_0, arg_73_0.handlerPushBoatAction)

	cmgr.registerResponseHandler(actions.pushBoat, arg_73_0.handlerPushBoatActionRef)

	arg_73_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_73_0, arg_73_0.update), 0, false)
end

function var_0_14.onExit(arg_74_0)
	arg_74_0:onUnwatch()
	cmgr.unregisterResponseHandler(actions.pushBoat, arg_74_0.handlerPushBoatActionRef)

	if arg_74_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_74_0.updateRef)
	end
end

function var_0_14.update(arg_75_0, arg_75_1)
	if arg_75_0.view and arg_75_0.view.widgets then
		if arg_75_0.isRunning and arg_75_0.speed then
			local var_75_0 = -arg_75_0.speed * arg_75_1

			for iter_75_0 = 1, 2 do
				local var_75_1 = arg_75_0.view.widgets["bg" .. iter_75_0]
				local var_75_2 = var_75_1:getPositionX() + var_75_0

				if var_75_2 <= -907 then
					var_75_2 = var_75_2 + 1814
				end

				var_75_1:setPositionX(var_75_2)
			end
		else
			arg_75_0.view.widgets.bg1:setPositionX(0)
			arg_75_0.view.widgets.bg2:setPositionX(907)
		end
	end

	if arg_75_0.info then
		for iter_75_1, iter_75_2 in ipairs(var_0_13) do
			if arg_75_0.info[iter_75_2] then
				if arg_75_0.info[iter_75_2] > 0 then
					arg_75_0.info[iter_75_2] = arg_75_0.info[iter_75_2] - 1000 * arg_75_1
				elseif arg_75_0.info[iter_75_2] <= 0 then
					arg_75_0.info[iter_75_2] = 0
				end
			end
		end
	end
end

return var_0_14
