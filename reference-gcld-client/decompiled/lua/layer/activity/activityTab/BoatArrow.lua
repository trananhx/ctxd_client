local var_0_0 = class("BoatArrow", function()
	return createBaseLayer()
end)

var_0_0.layout = {
	name = "root",
	type = "node",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			y = 0,
			name = "bg1",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/comment/bg1.jpg"
			}
		},
		{
			y = 220,
			name = "ccjj_title",
			type = "sprite",
			x = 0.0009,
			pic = {
				path = "res/ui/activity/boatArrow/ccjj_title.png"
			}
		},
		{
			fontSize = 24,
			name = "leftTime",
			y = 210,
			type = "label",
			x = 300
		},
		{
			y = 175.0037,
			name = "zjlyx_line",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/activity/generalDrink/zjlyx_line.png"
			}
		},
		{
			y = 203.0014,
			name = "ccjj_icon_arrow_di",
			type = "sprite",
			x = -370.0002,
			pic = {
				path = "res/ui/activity/boatArrow/ccjj_icon_arrow_di.png"
			}
		},
		{
			y = 205.0001,
			name = "ccjj_icon_arrow",
			type = "sprite",
			x = -414.9999,
			pic = {
				path = "res/ui/activity/boatArrow/ccjj_icon_arrow.png"
			}
		},
		{
			fontSize = 22,
			style = "label_warlock",
			name = "numLb",
			type = "label",
			y = 203,
			x = -357.0009,
			color = color_whi
		},
		{
			y = 0,
			name = "buyBoatSp",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = 99,
					name = "boatRender1",
					type = "sprite",
					x = 98.9999,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_long_bg01.png"
					},
					children = {
						{
							y = 93.4684,
							name = "ccjj_word_tzc_di",
							type = "sprite",
							x = 255.182,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_tzc_di.png"
							}
						},
						{
							y = 64.0013,
							name = "ccjj_chuan_icon_di",
							type = "sprite",
							x = 135.0003,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_chuan_icon_di.png"
							}
						},
						{
							y = 93,
							name = "ccjj_word_xzc",
							type = "sprite",
							x = 256,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_xzc.png"
							}
						},
						{
							y = 41.7267,
							name = "ccjj_word_icon_di",
							type = "sprite",
							x = 358.7655,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_icon_di.png"
							}
						},
						{
							y = 41.0001,
							name = "ccjj_icon_arrow_g",
							type = "sprite",
							x = 224.0001,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_icon_arrow_g.png"
							}
						},
						{
							y = 64,
							name = "ccjj_boaticon_01",
							type = "sprite",
							x = 133.9998,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_boaticon_01.png"
							}
						},
						{
							fontSize = 20,
							name = "boatinfo1",
							y = 41.0001,
							type = "label",
							x = 379.9998
						},
						{
							y = 93,
							name = "ccjj_js_numb_di",
							type = "sprite",
							x = 607.0001,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_js_numb_di.png"
							}
						},
						{
							fontSize = 20,
							name = "leftNumLb1",
							y = 93,
							type = "label",
							x = 607.9999
						},
						{
							y = 93.0001,
							name = "icon_gold1",
							type = "sprite",
							x = 578.9998,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 20,
							name = "goldNumLb1",
							y = 93,
							type = "label",
							x = 620
						},
						{
							name = "boatBuyBtn1",
							h = 58,
							type = "button",
							w = 140,
							y = 41.0001,
							x = 607.9999,
							normal = {
								frame = true,
								path = "btn3_yel_a.png"
							},
							touched = {
								frame = true,
								path = "btn3_yel_c.png"
							},
							children = {
								{
									fontSize = 24,
									style = "label_warlock",
									name = "Text_3",
									type = "label",
									y = 29,
									x = 70,
									textId = 215308,
									color = color_whi
								}
							}
						}
					}
				},
				{
					y = -34.0001,
					name = "boatRender2",
					type = "sprite",
					x = 99,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_long_bg02.png"
					},
					children = {
						{
							y = 93.4684,
							name = "ccjj_word_tzc_di_Copy",
							type = "sprite",
							x = 255.182,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_tzc_di.png"
							}
						},
						{
							y = 64.0013,
							name = "ccjj_chuan_icon_di_Copy",
							type = "sprite",
							x = 135.0003,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_chuan_icon_di.png"
							}
						},
						{
							y = 93,
							name = "ccjj_word_xzc_Copy",
							type = "sprite",
							x = 256,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_dzc.png"
							}
						},
						{
							y = 41.7267,
							name = "ccjj_word_icon_di_Copy",
							type = "sprite",
							x = 358.7655,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_icon_di.png"
							}
						},
						{
							y = 41.0001,
							name = "ccjj_icon_arrow_g_Copy",
							type = "sprite",
							x = 224.0001,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_icon_arrow_b.png"
							}
						},
						{
							y = 64,
							name = "ccjj_boaticon_01_Copy",
							type = "sprite",
							x = 133.9998,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_boaticon_02.png"
							}
						},
						{
							fontSize = 20,
							name = "boatinfo2",
							y = 41.0001,
							type = "label",
							x = 379.9998
						},
						{
							y = 93,
							name = "ccjj_js_numb_di_Copy",
							type = "sprite",
							x = 607.0001,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_js_numb_di.png"
							}
						},
						{
							fontSize = 20,
							name = "leftNumLb2",
							y = 93,
							type = "label",
							x = 607.9999
						},
						{
							y = 93.0001,
							name = "icon_gold2",
							type = "sprite",
							x = 578.9998,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 20,
							name = "goldNumLb2",
							y = 93,
							type = "label",
							x = 620
						},
						{
							name = "boatBuyBtn2",
							h = 58,
							type = "button",
							w = 140,
							y = 41.0001,
							x = 607.9999,
							normal = {
								frame = true,
								path = "btn3_yel_a.png"
							},
							touched = {
								frame = true,
								path = "btn3_yel_c.png"
							},
							children = {
								{
									fontSize = 24,
									style = "label_warlock",
									name = "Text_3_Copy",
									type = "label",
									y = 29,
									x = 70,
									textId = 215308,
									color = color_whi
								}
							}
						}
					}
				},
				{
					y = -167,
					name = "boatRender3",
					type = "sprite",
					x = 99,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_long_bg03.png"
					},
					children = {
						{
							y = 93.4684,
							name = "ccjj_word_tzc_di_Copy",
							type = "sprite",
							x = 255.182,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_tzc_di.png"
							}
						},
						{
							y = 64.0013,
							name = "ccjj_chuan_icon_di_Copy",
							type = "sprite",
							x = 135.0003,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_chuan_icon_di.png"
							}
						},
						{
							y = 93,
							name = "ccjj_word_xzc_Copy",
							type = "sprite",
							x = 256,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_tzc.png"
							}
						},
						{
							y = 41.7267,
							name = "ccjj_word_icon_di_Copy",
							type = "sprite",
							x = 358.7655,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_icon_di.png"
							}
						},
						{
							y = 41.0001,
							name = "ccjj_icon_arrow_g_Copy",
							type = "sprite",
							x = 224.0001,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_icon_arrow_p.png"
							}
						},
						{
							y = 64,
							name = "ccjj_boaticon_01_Copy",
							type = "sprite",
							x = 133.9998,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_boaticon_03.png"
							}
						},
						{
							fontSize = 20,
							name = "boatinfo3",
							y = 41.0001,
							type = "label",
							x = 379.9998
						},
						{
							y = 93,
							name = "ccjj_js_numb_di_Copy",
							type = "sprite",
							x = 607.0001,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_js_numb_di.png"
							}
						},
						{
							fontSize = 20,
							name = "leftNumLb3",
							y = 93,
							type = "label",
							x = 607.9999
						},
						{
							y = 93.0001,
							name = "icon_gold3",
							type = "sprite",
							x = 578.9998,
							pic = {
								path = "res/ui/playerInfo/icon_gold.png"
							}
						},
						{
							fontSize = 20,
							name = "goldNumLb3",
							y = 93,
							type = "label",
							x = 620
						},
						{
							name = "boatBuyBtn3",
							h = 58,
							type = "button",
							w = 140,
							y = 41.0001,
							x = 607.9999,
							normal = {
								frame = true,
								path = "btn3_yel_a.png"
							},
							touched = {
								frame = true,
								path = "btn3_yel_c.png"
							},
							children = {
								{
									fontSize = 24,
									style = "label_warlock",
									name = "Text_3_Copy",
									type = "label",
									y = 29,
									x = 70,
									textId = 215308,
									color = color_whi
								}
							}
						},
						{
							fontSize = 22,
							y = 91.999,
							type = "label",
							x = 427.9996,
							textId = 215300,
							color = colorQuality[3]
						}
					}
				},
				{
					y = 0.0014,
					name = "halfPic_zhugeliang",
					type = "sprite",
					x = -321.9993,
					pic = {
						path = "res/ui/common/halfPic/halfPic_zhugeliang.png"
					}
				},
				{
					name = "gotoRewardBtn",
					h = 62,
					type = "button",
					w = 195,
					y = -149.9995,
					x = -311.9995,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_warlock",
							name = "Text_14",
							type = "label",
							y = 36.0001,
							x = 97.5,
							textId = 215307,
							color = color_whi
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "exchangeSp",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = 141.9996,
					name = "ccjj_word_di",
					type = "sprite",
					x = -288.0005,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_word_di.png"
					}
				},
				{
					y = -40.9999,
					name = "ccjj_card_bg",
					type = "sprite",
					x = 30,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_card_bg.png"
					}
				},
				{
					y = 138.0004,
					name = "ccjj_pb_bg",
					type = "sprite",
					x = 155.0001,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_pb_bg.png"
					}
				},
				{
					y = 138,
					name = "proBar",
					type = "progressbar",
					x = 155,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_pb.png"
					}
				},
				{
					name = "lvRewardRenderer1",
					h = 97,
					type = "button",
					w = 97,
					y = 138.9998,
					x = 114.9959,
					normal = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					touched = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					children = {
						{
							y = 48.5,
							name = "picIcon1",
							scale = 0.8,
							type = "sprite",
							x = 48.5,
							pic = {
								frame = true,
								path = "ssys.jpg"
							}
						}
					}
				},
				{
					name = "lvRewardRenderer2",
					h = 97,
					type = "button",
					w = 97,
					y = 139,
					x = 413.9998,
					normal = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					touched = {
						path = "res/ui/activity/generalDrink/zjlyx_jx_icon_d.png"
					},
					children = {
						{
							y = 48.5,
							name = "picIcon2",
							scale = 0.8,
							type = "sprite",
							x = 48.5,
							pic = {
								frame = true,
								path = "ssys.jpg"
							}
						}
					}
				},
				{
					y = 142.9995,
					name = "ccjj_word_jjzs",
					type = "sprite",
					x = -365,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_word_jjzs.png"
					}
				},
				{
					y = 142.9999,
					name = "ccjj_word_wan",
					type = "sprite",
					x = -176.0001,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_word_wan.png"
					}
				},
				{
					name = "jjNum",
					type = "atlaslabel",
					pic = "res/ui/activity/boatArrow/ccjj_word_number.png",
					startCharMap = 48,
					text = "0",
					y = 143,
					itemWidth = 18,
					x = -240,
					itemHeight = 28
				},
				{
					y = -190,
					name = "zjlyx_line_Copy",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_line.png"
					}
				},
				{
					y = -60.0004,
					name = "halfPic_zhouyujx",
					type = "sprite",
					x = -335.0001,
					pic = {
						path = "res/ui/common/halfPic/halfPic_zhouyujx.png"
					}
				},
				{
					name = "gotoBuyViewBtn",
					h = 62,
					type = "button",
					w = 195,
					y = -230.0003,
					x = -0.0004,
					normal = {
						path = "res/ui/common/button/public_btn_orange.png"
					},
					touched = {
						path = "res/ui/common/button/public_btn_orange_c.png"
					},
					children = {
						{
							fontSize = 24,
							name = "Text_15",
							style = "label_warlock",
							type = "label",
							y = 35,
							x = 97.5001,
							textId = 215309,
							color = color_whi
						}
					}
				},
				{
					y = -20,
					name = "exchangeRenderer1",
					type = "sprite",
					x = -100,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_card.png"
					},
					children = {
						{
							y = 125,
							name = "resPic1",
							type = "sprite",
							x = 67,
							pic = {
								path = "res/ui/common/ItemsPic/jingyan.jpg"
							}
						},
						{
							fontSize = 22,
							name = "resNum1",
							y = 76,
							type = "label",
							x = 64.9998
						},
						{
							w = 140,
							name = "exchangeBtn1",
							h = 58,
							type = "button",
							y = 33.4388,
							x = 66.879,
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
							fontSize = 26,
							style = "label_warlock",
							name = "Text_17",
							type = "label",
							y = 33.9995,
							x = 66.88,
							textId = 215310,
							color = color_whi
						},
						{
							y = -25.0006,
							name = "ccjj_river_word_di",
							type = "sprite",
							x = 66.9999,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_river_word_di.png"
							}
						},
						{
							y = -25.0002,
							name = "ccjj_icon_arrow",
							type = "sprite",
							x = 29.9987,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_icon_arrow.png"
							}
						},
						{
							fontSize = 20,
							name = "arrowLb1",
							y = -25.0004,
							type = "label",
							x = 84.9997
						}
					}
				},
				{
					y = -20,
					name = "exchangeRenderer2",
					type = "sprite",
					x = 100,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_card.png"
					},
					children = {
						{
							y = 125,
							name = "resPic2",
							type = "sprite",
							x = 67,
							pic = {
								path = "res/ui/common/ItemsPic/jingyan.jpg"
							}
						},
						{
							fontSize = 22,
							name = "resNum2",
							y = 76,
							type = "label",
							x = 64.9998
						},
						{
							w = 140,
							name = "exchangeBtn2",
							h = 58,
							type = "button",
							y = 33.4388,
							x = 66.879,
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
							fontSize = 26,
							style = "label_warlock",
							name = "Text_17_Copy",
							type = "label",
							y = 33.9995,
							x = 66.88,
							textId = 215310,
							color = color_whi
						},
						{
							y = -25.0006,
							name = "ccjj_river_word_di_Copy",
							type = "sprite",
							x = 66.9999,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_river_word_di.png"
							}
						},
						{
							y = -25.0002,
							name = "ccjj_icon_arrow_Copy",
							type = "sprite",
							x = 29.9987,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_icon_arrow.png"
							}
						},
						{
							fontSize = 20,
							name = "arrowLb2",
							y = -25.0004,
							type = "label",
							x = 84.9997
						}
					}
				},
				{
					y = -20,
					name = "exchangeRenderer3",
					type = "sprite",
					x = 300,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_card.png"
					},
					children = {
						{
							y = 125,
							name = "resPic3",
							type = "sprite",
							x = 67,
							pic = {
								path = "res/ui/common/ItemsPic/jingyan.jpg"
							}
						},
						{
							fontSize = 22,
							name = "resNum3",
							y = 76,
							type = "label",
							x = 64.9998
						},
						{
							w = 140,
							name = "exchangeBtn3",
							h = 58,
							type = "button",
							y = 33.4388,
							x = 66.879,
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
							fontSize = 26,
							style = "label_warlock",
							name = "Text_17_Copy",
							type = "label",
							y = 33.9995,
							x = 66.88,
							textId = 215310,
							color = color_whi
						},
						{
							y = -25.0006,
							name = "ccjj_river_word_di_Copy",
							type = "sprite",
							x = 66.9999,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_river_word_di.png"
							}
						},
						{
							y = -25.0002,
							name = "ccjj_icon_arrow_Copy",
							type = "sprite",
							x = 29.9987,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_icon_arrow.png"
							}
						},
						{
							fontSize = 20,
							name = "arrowLb3",
							y = -25.0004,
							type = "label",
							x = 84.9997
						}
					}
				}
			}
		},
		{
			y = 0,
			name = "boatGameSp",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					y = -24.0031,
					name = "ccjj_river",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/boatArrow/ccjj_river.jpg"
					}
				},
				{
					y = -223.0005,
					name = "zjlyx_line_Copy",
					type = "sprite",
					x = 0,
					pic = {
						path = "res/ui/activity/generalDrink/zjlyx_line.png"
					}
				},
				{
					y = -197,
					name = "animSp",
					visible = false,
					type = "node",
					x = -454,
					children = {
						{
							x = 264.0002,
							name = "river1",
							y = 107.0001,
							type = "sprite",
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_river_area_01.png"
							},
							children = {
								{
									y = 195.0001,
									name = "ccjj_river_word_xy",
									type = "sprite",
									x = 155.0003,
									pic = {
										path = "res/ui/activity/boatArrow/ccjj_river_word_xy.png"
									}
								},
								{
									y = 104,
									name = "hdc1",
									type = "sprite",
									x = 286,
									pic = {
										path = "res/ui/activity/boatArrow/hdc1.png"
									}
								}
							}
						},
						{
							x = 486,
							name = "river2",
							y = 172,
							type = "sprite",
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_river_area_02.png"
							},
							children = {
								{
									y = 244.9999,
									name = "ccjj_river_word_zy",
									type = "sprite",
									x = 169.9997,
									pic = {
										path = "res/ui/activity/boatArrow/ccjj_river_word_zy.png"
									}
								},
								{
									y = 174.7905,
									name = "hdc2",
									type = "sprite",
									x = 266.3604,
									pic = {
										path = "res/ui/activity/boatArrow/hdc1.png"
									}
								}
							}
						},
						{
							x = 655.9999,
							name = "river3",
							y = 243,
							type = "sprite",
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_river_area_03.png"
							},
							children = {
								{
									y = 215,
									name = "ccjj_river_word_sy",
									type = "sprite",
									x = 235.0001,
									pic = {
										path = "res/ui/activity/boatArrow/ccjj_river_word_sy.png"
									}
								},
								{
									y = 147,
									name = "hdc3",
									type = "sprite",
									x = 284,
									pic = {
										path = "res/ui/activity/boatArrow/hdc1.png"
									}
								}
							}
						}
					}
				},
				{
					visible = false,
					name = "moveBoat",
					y = 139,
					type = "sprite",
					x = 402,
					pic = {
						path = "res/ui/activity/boatArrow/hdc1.png"
					}
				},
				{
					name = "cbBtn",
					h = 39,
					type = "button",
					w = 39,
					y = 149.9999,
					x = -425.0001,
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
							textId = 215302
						}
					}
				},
				{
					visible = false,
					name = "rewardSp",
					y = 0,
					type = "node",
					x = 0,
					children = {
						{
							y = -30.0006,
							name = "sczl_jl_d",
							type = "sprite",
							x = -0.0018,
							pic = {
								path = "res/ui/resource/silkroad/sczl_jl_d.png"
							}
						},
						{
							y = -20.0002,
							name = "halfPic_zhugeliang",
							type = "sprite",
							x = -310.0005,
							pic = {
								path = "res/ui/common/halfPic/halfPic_zhugeliang.png"
							}
						},
						{
							y = 68.9992,
							name = "wordArt",
							type = "sprite",
							x = 79.995,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_js_word_1.png"
							}
						},
						{
							y = 0,
							name = "gxb_icon_d",
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/rankInfo/DailyFeatView/gxb_icon_d.png"
							}
						},
						{
							y = 0,
							name = "jsIcon",
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/activity/boatArrow/jsIcon.jpg"
							}
						},
						{
							y = -62.0001,
							name = "ccjj_word_numb_di",
							type = "sprite",
							x = 80,
							pic = {
								path = "res/ui/activity/boatArrow/ccjj_word_numb_di.png"
							}
						},
						{
							fontSize = 24,
							name = "rewardLb",
							y = -60,
							type = "label",
							x = 79.9996
						},
						{
							name = "backBtn",
							h = 62,
							type = "button",
							w = 195,
							y = -119.0001,
							x = 200.9998,
							normal = {
								path = "res/ui/common/button/public_btn_red.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_red_c.png"
							},
							children = {
								{
									fontSize = 24,
									style = "label_warlock",
									name = "Text_27",
									type = "label",
									y = 35,
									x = 97.5,
									textId = 215311,
									color = color_whi
								}
							}
						},
						{
							name = "againBtn",
							h = 62,
							type = "button",
							w = 195,
							y = -119,
							x = -40,
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
									name = "Text_28",
									type = "label",
									y = 35,
									x = 97.5,
									textId = 135992,
									color = color_whi
								}
							}
						},
						{
							name = "againGoldBtn",
							h = 62,
							type = "button",
							w = 195,
							y = -119,
							x = -40,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									y = 33.9993,
									name = "public_btn_gold",
									type = "sprite",
									x = 29.9983,
									pic = {
										path = "res/ui/common/button/public_btn_gold.png"
									}
								},
								{
									y = 40,
									name = "icon_goldA",
									type = "sprite",
									x = 29.9991,
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								},
								{
									fontSize = 20,
									name = "againGoldLb",
									y = 20,
									type = "label",
									x = 30
								},
								{
									fontSize = 24,
									style = "label_warlock",
									name = "Text_30",
									type = "label",
									y = 35,
									x = 118.9996,
									textId = 135992,
									color = color_whi
								}
							}
						}
					}
				}
			}
		}
	}
}

local var_0_1 = {
	[3] = {
		frame = false,
		pic = "res/ui/resource/silkroad/food.jpg",
		type = 3
	},
	[4] = {
		frame = false,
		pic = "res/ui/common/ItemsPic/kuang.jpg",
		type = 4
	},
	[5] = {
		frame = false,
		pic = "res/ui/resource/silkroad/exp.jpg",
		type = 6
	},
	[21] = {
		frame = true,
		pic = "baoshi1.jpg",
		type = 7
	},
	[42] = {
		frame = true,
		pic = "mubingling.jpg",
		type = 5
	},
	[91] = {
		frame = true,
		pic = "tuntianling.jpg",
		type = 1701
	},
	[113] = {
		frame = true,
		pic = "jjl.jpg",
		type = 2003
	},
	[116] = {
		frame = false,
		pic = "res/ui/world/world_silk.jpg",
		type = 55
	},
	[117] = {
		frame = true,
		pic = "ssys.jpg",
		type = 117
	},
	[119] = {
		frame = false,
		pic = "res/ui/activity/ironSell/gt1.jpg",
		type = 10033
	},
	[125] = {
		frame = true,
		pic = "zsl.jpg",
		type = 10041
	},
	[126] = {
		frame = false,
		pic = "res/ui/activity/seaSilk/jinnang.png",
		type = 10030
	},
	[132] = {
		frame = true,
		pic = "huany_hbq.jpg",
		type = 10057
	},
	[151] = {
		frame = true,
		pic = "lbf.jpg",
		type = 151
	},
	[216] = {
		pic = "res/ui/activity/meteorIncense/yuntie2.jpg",
		type = 216
	}
}
local var_0_2 = {
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
			width = 300,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft
		}
	}
}

function var_0_0.showHelpTip(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	log.info("should show tips ")

	local var_2_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			pcall(var_2_0.removeFromParentAndCleanup, var_2_0, true)

			arg_2_0.view.widgets.tipFrame = nil

			return true
		end
	end, false, true)
	var_2_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_2_0, 60000)

	if arg_2_1 then
		local var_2_1 = 0
		local var_2_2 = 0

		if arg_2_0.view == nil then
			arg_2_0.view = {}
		end

		uiutil.initWidgets(arg_2_0.view, var_0_2)
		arg_2_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		var_2_0:addChild(arg_2_0.view.widgets.tipFrame)

		local var_2_3, var_2_4 = tool.getPositionInScreen(arg_2_0.view.widgets[arg_2_2])
		local var_2_5 = var_2_3 + 20
		local var_2_6 = var_2_4 + 20

		if arg_2_4 then
			var_2_5 = var_2_5 + arg_2_4.x
			var_2_6 = var_2_6 + arg_2_4.y
		end

		arg_2_0.view.widgets.tipMsg:setString(arg_2_3)

		local var_2_7 = arg_2_0.view.widgets.tipMsg:getContentSize().width
		local var_2_8 = arg_2_0.view.widgets.tipMsg:getContentSize().height

		arg_2_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_2_7 + 30, var_2_8 + 30))
		arg_2_0.view.widgets.tipFrame:setPosition(ccp(var_2_5, var_2_6))
		arg_2_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_2_0.view.widgets.tipFrame:setVisible(true)
	end
end

function var_0_0.showTips(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	if arg_4_0.view and arg_4_0.view.widgets.tipFrame then
		arg_4_0.view.widgets.tipFrame:removeFromParentAndCleanup(true)

		arg_4_0.view.widgets.tipFrame = nil
	end

	if arg_4_1 then
		local var_4_0 = 0
		local var_4_1 = 0

		if arg_4_0.view == nil then
			arg_4_0.view = {}
		end

		uiutil.initWidgets(arg_4_0.view, var_0_2)
		arg_4_0.view.widgets.tipFrame:setAnchorPoint(ccp(1, 0))
		arg_4_0:addChild(arg_4_0.view.widgets.tipFrame)

		local var_4_2, var_4_3 = tool.getPositionInScreen(arg_4_0.view.widgets[arg_4_2])
		local var_4_4 = var_4_2 + 20
		local var_4_5 = var_4_3 + 20

		if arg_4_4 then
			var_4_4 = var_4_4 + arg_4_4.x
			var_4_5 = var_4_5 + arg_4_4.y
		end

		arg_4_0.view.widgets.tipMsg:setString(arg_4_3)

		local var_4_6 = arg_4_0.view.widgets.tipMsg:getContentSize().width
		local var_4_7 = arg_4_0.view.widgets.tipMsg:getContentSize().height

		arg_4_0.view.widgets.tipFrame:setPreferredSize(CCSizeMake(var_4_6 + 30, var_4_7 + 30))
		arg_4_0.view.widgets.tipFrame:setPosition(ccp(var_4_4, var_4_5))
		arg_4_0.view.widgets.tipMsg:setPosition(ccp(15, 15))
		arg_4_0.view.widgets.tipFrame:setVisible(true)
	end
end

local function var_0_3(arg_5_0)
	if not arg_5_0 or tolua.isnull(arg_5_0) then
		return
	end

	local var_5_0 = CCArray:create()

	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCMoveBy:create(0.1, ccp(10, 0)))
	var_5_0:addObject(CCMoveBy:create(0.05, ccp(-5, 0)))
	var_5_0:addObject(CCDelayTime:create(0.4))

	local var_5_1 = CCSequence:create(var_5_0)

	arg_5_0:stopAllActions()
	arg_5_0:runAction(CCRepeatForever:create(var_5_1))
end

function var_0_0.ctor(arg_6_0, arg_6_1, arg_6_2)
	log.info("@@ 草船借箭")

	arg_6_0.view = {}

	uiutil.initWidgets(arg_6_0.view, arg_6_0.layout)

	arg_6_0.leftTime = arg_6_0.view.widgets.leftTime

	if arg_6_1 then
		arg_6_0:addChild(arg_6_0.view.widgets.root)
		arg_6_1:addChild(arg_6_0)
	end

	user.activityData.boatarrowInfo = arg_6_2
	user.activityData.currentArrow = arg_6_2.arrows

	if arg_6_2.boatId then
		user.activityData.currentBoatId = arg_6_2.boatId
	end

	arg_6_0:update()
end

function var_0_0.update(arg_7_0)
	local var_7_0 = user.activityData.boatarrowInfo

	if var_7_0 then
		arg_7_0:currentArrowUpdate()

		if var_7_0.rewardInfo or user.activityData.currentBoatId and user.activityData.currentBoatId > 0 then
			arg_7_0:showBoatGameSp(true)
		elseif arg_7_0.isShowExchangeSp then
			arg_7_0:showBuyBoatSp(false)
			arg_7_0:showExchangeSp(true)
		else
			arg_7_0:showBuyBoatSp(true)
		end
	end
end

function var_0_0.currentArrowUpdate(arg_8_0)
	arg_8_0.view.widgets.numLb:setString(user.activityData.currentArrow or 0)
end

function var_0_0.showReward(arg_9_0, arg_9_1)
	if user.activityData.boatArrowRewardInfoVo and arg_9_1 ~= user.activityData.boatArrowRewardInfoVo then
		arg_9_1 = user.activityData.boatArrowRewardInfoVo
	end

	if arg_9_1.rewardArrows <= 11 then
		arg_9_0.view.widgets.wordArt:setDisplayFrame(CCSprite:create("res/ui/activity/boatArrow/ccjj_js_word_1.png"):displayFrame())
	elseif arg_9_1.arrowType == 1 then
		arg_9_0.view.widgets.wordArt:setDisplayFrame(CCSprite:create("res/ui/activity/boatArrow/ccjj_js_word_2.png"):displayFrame())
	elseif arg_9_1.arrowType == 2 or arg_9_1.arrowType == 3 then
		arg_9_0.view.widgets.wordArt:setDisplayFrame(CCSprite:create("res/ui/activity/boatArrow/ccjj_js_word_3.png"):displayFrame())
	end

	arg_9_0.view.widgets.rewardLb:setString("x" .. arg_9_1.rewardArrows)
	arg_9_0.view.widgets.againGoldLb:setString(arg_9_1.goldAgain)

	if arg_9_1.goldAgain <= 0 then
		arg_9_0.view.widgets.againGoldBtn:setVisible(false)
		arg_9_0.view.widgets.againBtn:setVisible(true)
	else
		arg_9_0.view.widgets.againGoldBtn:setVisible(true)
		arg_9_0.view.widgets.againBtn:setVisible(false)
	end

	arg_9_0.view.widgets.rewardSp:setVisible(true)
end

function var_0_0.showSelect(arg_10_0)
	log.info("@@@@@@@@showSelect")
	arg_10_0.view.widgets.animSp:setVisible(true)

	for iter_10_0 = 1, 3 do
		arg_10_0.view.widgets["hdc" .. iter_10_0]:setDisplayFrame(CCSprite:create("res/ui/activity/boatArrow/hdc" .. user.activityData.currentBoatId .. ".png"):displayFrame())
	end

	local function var_10_0(arg_11_0)
		user.activityData.selectRiverId = arg_11_0

		cmgr.sendRequest(function(arg_12_0)
			local var_12_0 = arg_12_0.action.data

			user.activityData.boatArrowRewardInfoVo = var_12_0.rewardInfo

			arg_10_0:riverSelectUpdate()
		end, actions.shootMeArrowBoat)
	end

	local var_10_1 = {}

	local function var_10_2(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHBEGAN then
			var_10_1.x = arg_13_1
			var_10_1.y = arg_13_2
		elseif arg_13_0 == CCTOUCHENDED and math.abs(var_10_1.x - arg_13_1) < 20 and math.abs(var_10_1.y - arg_13_2) < 20 then
			local var_13_0 = false
			local var_13_1 = tool.getPosTransparentCheck(arg_10_0.view.widgets.animSp, ccp(arg_13_1, arg_13_2))
			local var_13_2 = not LayerTransparentCheck:ifTransparentSprite(arg_10_0.view.widgets.river1, var_13_1)

			if var_13_2 then
				log.info("river1 click", var_13_2)
				var_10_0(1)
			else
				local var_13_3 = not LayerTransparentCheck:ifTransparentSprite(arg_10_0.view.widgets.river2, var_13_1)

				if var_13_3 then
					log.info("river2 click", var_13_3)
					var_10_0(2)
				else
					local var_13_4 = not LayerTransparentCheck:ifTransparentSprite(arg_10_0.view.widgets.river3, var_13_1)

					if var_13_4 then
						log.info("river3 click", var_13_4)
						var_10_0(3)
					end
				end
			end
		end

		return true
	end

	arg_10_0.view.widgets.animSp:registerScriptTouchHandler(var_10_2)
	arg_10_0.view.widgets.animSp:setTouchEnabled(true)
end

local var_0_4 = {
	ccp(-190, -90),
	ccp(32, -25),
	(ccp(202, 46))
}

function var_0_0.boatMovie(arg_14_0)
	arg_14_0.view.widgets.moveBoat:stopAllActions()
	arg_14_0.view.widgets.moveBoat:setDisplayFrame(CCSprite:create("res/ui/activity/boatArrow/hdc" .. user.activityData.currentBoatId .. ".png"):displayFrame())
	arg_14_0.view.widgets.moveBoat:setPosition(ccp(402, 139))
	arg_14_0.view.widgets.moveBoat:setVisible(true)

	local var_14_0 = CCArray:create()

	var_14_0:addObject(CCMoveTo:create(1, var_0_4[user.activityData.selectRiverId]))
	var_14_0:addObject(CCDelayTime:create(0.5))
	var_14_0:addObject(CCCallFunc:create(function()
		arg_14_0:createArrows()
	end))

	local var_14_1 = CCSequence:create(var_14_0)

	arg_14_0.view.widgets.moveBoat:runAction(var_14_1)
end

local var_0_5 = {
	{
		startP = ccp(124, -165),
		middleP = ccp(-22, -94),
		endP = ccp(-190, -90)
	},
	{
		startP = ccp(250, -85),
		middleP = ccp(122, 0),
		endP = ccp(32, -25)
	},
	{
		startP = ccp(320, 4),
		middleP = ccp(295, 64),
		endP = ccp(202, 46)
	}
}

function var_0_0.flyArrowTypePic(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = CCSprite:create("res/ui/activity/boatArrow/ccjj_word_fly" .. arg_16_1 .. ".png")
	local var_16_1, var_16_2 = tool.getPositionInScreen(arg_16_2)

	var_16_0:setPosition(var_16_1, var_16_2 - 50)
	smgr.showTipSpriteText(var_16_0)
end

local var_0_6 = {
	ccp(0, 20),
	ccp(-50, -20),
	ccp(50, -25),
	ccp(70, 40),
	(ccp(-80, 30))
}

function var_0_0.flyrewardPic(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = CCSprite:create("res/ui/activity/boatArrow/ccjj_river_word_di.png")
	local var_17_1 = CCLabelTTF:create(arg_17_1, "Thonburi", 22)

	var_17_1:setPosition(ccp(77, 18))
	var_17_0:addChild(var_17_1)

	local var_17_2, var_17_3 = tool.getPositionInScreen(arg_17_2)

	var_17_0:setPosition(var_17_2 + var_0_6[arg_17_3].x, var_17_3 + var_0_6[arg_17_3].y - 50)
	smgr.showTipSpriteText(var_17_0)
end

function var_0_0.moveArrow(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = var_0_5[arg_18_1]
	local var_18_1 = {
		"ccjj_arrow.png",
		"ccjj_arrow.png",
		"ccjj_arrow_fire.png"
	}
	local var_18_2 = CCSprite:create("res/ui/activity/boatArrow/" .. var_18_1[arg_18_2])

	var_18_2:setPosition(ccp(var_18_0.startP.x + (10 - math.random(0, 20)), var_18_0.startP.y + (10 - math.random(0, 20))))
	arg_18_0.view.widgets.boatGameSp:addChild(var_18_2)
	var_18_2:setVisible(false)

	if arg_18_3 == 2 then
		arg_18_0:flyArrowTypePic(arg_18_2, var_18_2)

		if user.activityData.selectRiverId == arg_18_1 then
			NewScheduler(3, function()
				arg_18_0:refresh()
			end)
		end
	end

	local var_18_3 = CCArray:create()
	local var_18_4 = CCArray:create()
	local var_18_5 = CCArray:create()

	var_18_3:addObject(CCDelayTime:create(math.random(1, 5) * 0.1))
	var_18_3:addObject(CCShow:create())
	var_18_4:addObject(CCRotateTo:create(0.5, -5))
	var_18_4:addObject(CCMoveTo:create(0.5, var_18_0.middleP))
	var_18_3:addObject(CCSpawn:create(var_18_4))
	var_18_5:addObject(CCRotateTo:create(0.4, -45))
	var_18_5:addObject(CCMoveTo:create(0.4, var_18_0.endP))
	var_18_3:addObject(CCSpawn:create(var_18_5))
	var_18_3:addObject(CCDelayTime:create(0.1))
	var_18_3:addObject(CCCallFunc:create(function()
		var_18_2:removeFromParentAndCleanup(true)

		if user.activityData.selectRiverId == arg_18_1 and arg_18_3 == 4 then
			if arg_18_2 == 3 and user.activityData.currentBoatId ~= 3 then
				arg_18_0:fireUpdate()
			end

			arg_18_0:showArrowReward(user.activityData.boatArrowRewardInfoVo.rewardArrows)
		end
	end))

	local var_18_6 = CCSequence:create(var_18_3)

	var_18_2:runAction(var_18_6)
end

function var_0_0.fireUpdate(arg_21_0)
	local var_21_0 = CCArray:create()

	for iter_21_0 = 0, 4 do
		local var_21_1 = CCSprite:create("res/ui/empire/fire/" .. string.format("worldFire_%05d.png", iter_21_0))

		var_21_0:addObject(var_21_1:displayFrame())
	end

	local var_21_2 = CCAnimation:createWithSpriteFrames(var_21_0, 0.1)
	local var_21_3 = CCAnimate:create(var_21_2)
	local var_21_4 = CCArray:create()

	var_21_4:addObject(var_21_3)

	local var_21_5 = CCSequence:create(var_21_4)
	local var_21_6 = CCRepeatForever:create(tolua.cast(var_21_5, "CCActionInterval"))
	local var_21_7 = CCSprite:create("res/ui/empire/fire/worldFire_00000.png")

	var_21_7:setPosition(ccp(65, 90))
	arg_21_0.view.widgets.moveBoat:addChild(var_21_7)
	var_21_7:runAction(var_21_6)
end

function var_0_0.showArrowReward(arg_22_0, arg_22_1)
	if arg_22_1 <= 11 then
		arg_22_0:flyrewardPic(arg_22_1, arg_22_0.view.widgets.moveBoat, 1)
	else
		local var_22_0 = arg_22_1 % 5
		local var_22_1 = math.floor(arg_22_1 / 5)

		if var_22_0 > 0 then
			for iter_22_0 = 1, 5 do
				local var_22_2 = 0

				if var_22_0 > 0 then
					var_22_2 = math.random(1, var_22_0)
					var_22_0 = var_22_0 - var_22_2
				end

				arg_22_0:flyrewardPic(var_22_1 + var_22_2, arg_22_0.view.widgets.moveBoat, iter_22_0)
			end
		else
			for iter_22_1 = 1, 5 do
				arg_22_0:flyrewardPic(var_22_1, arg_22_0.view.widgets.moveBoat, iter_22_1)
			end
		end
	end
end

function var_0_0.createArrows(arg_23_0)
	local var_23_0 = {
		1,
		2,
		3
	}
	local var_23_1 = {
		1,
		2,
		3
	}

	if user.activityData.boatArrowRewardInfoVo then
		table.remove(var_23_0, user.activityData.boatArrowRewardInfoVo.arrowType)
		table.remove(var_23_1, user.activityData.selectRiverId)

		if user.activityData.boatArrowRewardInfoVo.arrowType == 2 or user.activityData.boatArrowRewardInfoVo.arrowType == 3 then
			for iter_23_0 = 1, 10 do
				arg_23_0:moveArrow(user.activityData.selectRiverId, user.activityData.boatArrowRewardInfoVo.arrowType, iter_23_0)
			end
		else
			for iter_23_1 = 1, 5 do
				arg_23_0:moveArrow(user.activityData.selectRiverId, user.activityData.boatArrowRewardInfoVo.arrowType, iter_23_1)
			end
		end

		for iter_23_2, iter_23_3 in pairs(var_23_1) do
			if #var_23_0 > 0 then
				local var_23_2 = var_23_0[1]

				if var_23_2 == 2 or var_23_2 == 3 then
					for iter_23_4 = 1, 10 do
						arg_23_0:moveArrow(iter_23_3, var_23_2, iter_23_4)
					end
				else
					for iter_23_5 = 1, 5 do
						arg_23_0:moveArrow(iter_23_3, var_23_2, iter_23_5)
					end
				end

				table.remove(var_23_0, 1)
			end
		end
	end
end

function var_0_0.riverSelectUpdate(arg_24_0)
	arg_24_0.view.widgets.animSp:setVisible(false)
	arg_24_0.view.widgets.animSp:setTouchEnabled(false)

	if user.activityData.isArrowBoatCBSelect then
		if user.activityData.boatArrowRewardInfoVo then
			arg_24_0.view.widgets.moveBoat:setVisible(false)
			arg_24_0:showReward(user.activityData.boatArrowRewardInfoVo)

			user.activityData.currentArrow = user.activityData.boatArrowRewardInfoVo.arrows

			arg_24_0:currentArrowUpdate()
		end
	else
		arg_24_0:boatMovie()
	end
end

function var_0_0.showBoatGameSp(arg_25_0, arg_25_1)
	log.info("@@@@@@@@showBoatGameSp")
	showTable(user.activityData.boatarrowInfo)

	if arg_25_1 then
		arg_25_0.isShowBoatGameSp = true

		arg_25_0.view.widgets.boatGameSp:setVisible(true)
		arg_25_0.view.widgets.moveBoat:setVisible(false)
		arg_25_0.view.widgets.moveBoat:removeAllChildrenWithCleanup(true)
		arg_25_0.view.widgets.unite_view_on:setVisible(user.activityData.isArrowBoatCBSelect)

		local var_25_0 = user.activityData.boatarrowInfo

		if var_25_0 then
			arg_25_0.view.widgets.cbBtn:setVisible(var_25_0.showSkipOption)

			if var_25_0.rewardInfo then
				arg_25_0:showReward(var_25_0.rewardInfo)
			elseif user.activityData.currentBoatId > 0 then
				arg_25_0:showSelect()
			end
		end
	else
		arg_25_0.isShowBoatGameSp = false

		arg_25_0.view.widgets.boatGameSp:setVisible(false)
	end
end

local var_0_7 = {
	[1] = 115,
	[2] = 414
}

function var_0_0.showExchangeSp(arg_26_0, arg_26_1)
	if arg_26_1 then
		arg_26_0.isShowExchangeSp = true

		arg_26_0.view.widgets.exchangeSp:setVisible(true)

		local var_26_0 = user.activityData.boatarrowInfo

		if var_26_0 then
			arg_26_0.view.widgets.ccjj_word_wan:setVisible(false)

			local var_26_1 = var_26_0.totalArrows

			if var_26_0.totalArrows >= 10000 then
				var_26_1 = math.floor(var_26_0.totalArrows / 10000)

				arg_26_0.view.widgets.ccjj_word_wan:setVisible(true)
			end

			arg_26_0.view.widgets.jjNum:setString(var_26_1)

			local var_26_2 = var_26_0.totalArrows / var_26_0.spRewardList[2].needArrows * 100

			arg_26_0.view.widgets.proBar:setPercentage(var_26_2)

			for iter_26_0, iter_26_1 in ipairs(var_26_0.spRewardList) do
				local var_26_3 = var_0_1[iter_26_1.type]

				if var_26_3 then
					if var_26_3.frame then
						arg_26_0.view.widgets["picIcon" .. iter_26_0]:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_26_3.pic):displayFrame())
					else
						arg_26_0.view.widgets["picIcon" .. iter_26_0]:setDisplayFrame(CCSprite:create(var_26_3.pic):displayFrame())
					end
				end

				local var_26_4 = false

				arg_26_0.view.widgets["lvRewardRenderer" .. iter_26_0]:stopAllActions()
				arg_26_0.view.widgets["lvRewardRenderer" .. iter_26_0]:setPositionX(var_0_7[iter_26_0])

				if var_26_0.totalArrows >= iter_26_1.needArrows and not iter_26_1.rewarded then
					var_26_4 = true

					var_0_3(arg_26_0.view.widgets["lvRewardRenderer" .. iter_26_0])
				end

				local var_26_5 = ""

				if iter_26_1.type ~= 117 then
					var_26_5 = language.get(215305, iter_26_1.name .. "x" .. tool.getFormatNum(iter_26_1.num), tool.getFormatNum(iter_26_1.needArrows))
				else
					var_26_5 = language.get(215306, iter_26_1.treasureInfo.name, iter_26_1.treasureInfo.lea, iter_26_1.treasureInfo.str, tool.getFormatNum(iter_26_1.needArrows))
				end

				local function var_26_6()
					cmgr.sendRequest(function(arg_28_0)
						local var_28_0 = arg_28_0.action.data

						if var_28_0.rewards then
							local var_28_1 = {}

							for iter_28_0, iter_28_1 in pairs(var_28_0.rewards) do
								if iter_28_1 then
									local var_28_2 = {
										id = iter_28_1.type or iter_28_1.id,
										value = iter_28_1.num or iter_28_1.value
									}

									if var_28_2.value > 0 then
										var_28_2.id = var_0_1[var_28_2.id] and var_0_1[var_28_2.id].type or var_28_2.id

										table.insert(var_28_1, var_28_2)
									end
								end
							end

							globalAction_gotResource(var_28_1)
						end

						arg_26_0:refresh()
					end, actions.getArrowBoatSpReward, iter_26_1.id)
				end

				local function var_26_7(...)
					if var_26_4 then
						var_26_6()
					else
						arg_26_0:showTips(true, "lvRewardRenderer" .. iter_26_0, var_26_5, ccp(0, -0))
					end
				end

				local function var_26_8(...)
					arg_26_0:showTips(false)
				end

				arg_26_0.view.widgets["lvRewardRenderer" .. iter_26_0]:addHandleOfControlEvent(var_26_7, CCControlEventTouchDown)
				arg_26_0.view.widgets["lvRewardRenderer" .. iter_26_0]:addHandleOfControlEvent(var_26_8, CCControlEventTouchUpInside)
				arg_26_0.view.widgets["lvRewardRenderer" .. iter_26_0]:addHandleOfControlEvent(var_26_8, CCControlEventTouchUpOutside)
			end

			for iter_26_2, iter_26_3 in ipairs(var_26_0.rewardList) do
				arg_26_0.view.widgets["resNum" .. iter_26_2]:setString(iter_26_3.num)
				arg_26_0.view.widgets["arrowLb" .. iter_26_2]:setString(iter_26_3.needArrows)

				local var_26_9 = var_0_1[iter_26_3.type]

				if var_26_9 then
					if var_26_9.frame then
						arg_26_0.view.widgets["resPic" .. iter_26_2]:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_26_9.pic):displayFrame())
					else
						arg_26_0.view.widgets["resPic" .. iter_26_2]:setDisplayFrame(CCSprite:create(var_26_9.pic):displayFrame())
					end
				end

				local function var_26_10()
					cmgr.sendRequest(function(arg_32_0)
						local var_32_0 = arg_32_0.action.data

						if var_32_0.rewards then
							local var_32_1 = {}

							for iter_32_0, iter_32_1 in pairs(var_32_0.rewards) do
								if iter_32_1 then
									local var_32_2 = {
										id = iter_32_1.type or iter_32_1.id,
										value = iter_32_1.num or iter_32_1.value
									}

									if var_32_2.value > 0 then
										var_32_2.id = var_0_1[var_32_2.id] and var_0_1[var_32_2.id].type or var_32_2.id

										table.insert(var_32_1, var_32_2)
									end
								end
							end

							globalAction_gotResource(var_32_1)
						end

						user.activityData.currentArrow = var_32_0.arrows

						arg_26_0:currentArrowUpdate()
					end, actions.getArrowBoatReward, iter_26_3.id)
				end

				arg_26_0.view.widgets["exchangeBtn" .. iter_26_2]:addHandleOfControlEvent(var_26_10, CCControlEventTouchDown)
			end
		end
	else
		arg_26_0.isShowExchangeSp = false

		arg_26_0.view.widgets.exchangeSp:setVisible(false)
	end
end

function var_0_0.showBuyBoatSp(arg_33_0, arg_33_1)
	if arg_33_1 then
		arg_33_0.isShowBuyBoatSp = true

		arg_33_0.view.widgets.buyBoatSp:setVisible(true)

		local var_33_0 = user.activityData.boatarrowInfo

		if var_33_0 and var_33_0.boatList then
			for iter_33_0, iter_33_1 in ipairs(var_33_0.boatList) do
				arg_33_0.view.widgets["icon_gold" .. iter_33_0]:setVisible(false)
				arg_33_0.view.widgets["goldNumLb" .. iter_33_0]:setString("")
				arg_33_0.view.widgets["leftNumLb" .. iter_33_0]:setString("")
				arg_33_0.view.widgets["boatinfo" .. iter_33_0]:setString(iter_33_1.tips or "")

				if iter_33_1.freeTimes and iter_33_1.freeTimes > 0 then
					arg_33_0.view.widgets["leftNumLb" .. iter_33_0]:setString(language.get(215301, iter_33_1.freeTimes))
				else
					arg_33_0.view.widgets["icon_gold" .. iter_33_0]:setVisible(true)
					arg_33_0.view.widgets["goldNumLb" .. iter_33_0]:setString(iter_33_1.gold or "")
				end

				local function var_33_1()
					local function var_34_0(arg_35_0)
						local var_35_0 = arg_35_0.action.data

						user.activityData.currentBoatId = var_35_0.boatId

						if user.activityData.boatarrowInfo then
							user.activityData.boatarrowInfo.showSkipOption = var_35_0.showSkipOption
						end

						arg_33_0:showBoatGameSp(true)
						arg_33_0:showBuyBoatSp(false)
						arg_33_0:showExchangeSp(false)
						arg_33_0:boatDispatchUpdate()
					end

					if iter_33_1.gold > 0 then
						messageBox.showChargeWin("", language.get(215304, iter_33_1.gold), "arrowBoatGoldDispatch", function()
							cmgr.sendRequest(var_34_0, actions.dispatchArrowBoat, iter_33_1.id)
						end)
					else
						cmgr.sendRequest(var_34_0, actions.dispatchArrowBoat, iter_33_1.id)
					end
				end

				arg_33_0.view.widgets["boatBuyBtn" .. iter_33_0]:addHandleOfControlEvent(var_33_1, CCControlEventTouchDown)
			end
		end
	else
		arg_33_0.isShowBuyBoatSp = false

		arg_33_0.view.widgets.buyBoatSp:setVisible(false)
	end
end

function var_0_0.boatDispatchUpdate(arg_37_0)
	local var_37_0 = user.activityData.boatarrowInfo

	arg_37_0.view.widgets.cbBtn:setVisible(var_37_0.showSkipOption)
	arg_37_0.view.widgets.rewardSp:setVisible(false)
	arg_37_0:showSelect()
end

function var_0_0.refresh(arg_38_0)
	cmgr.sendRequest(function(arg_39_0)
		local var_39_0 = arg_39_0.action.data

		user.activityData.boatarrowInfo = var_39_0
		user.activityData.currentArrow = var_39_0.arrows

		if var_39_0.boatId then
			user.activityData.currentBoatId = var_39_0.boatId
		end

		arg_38_0:update()
	end, actions.getCCJJ)
end

function var_0_0.gotoRewardBtn(arg_40_0)
	arg_40_0:showBoatGameSp(false)
	arg_40_0:showBuyBoatSp(false)
	arg_40_0:showExchangeSp(true)
end

function var_0_0.gotoBuyViewBtn(arg_41_0)
	arg_41_0:showBoatGameSp(false)
	arg_41_0:showBuyBoatSp(true)
	arg_41_0:showExchangeSp(false)
end

function var_0_0.backBtn(arg_42_0)
	arg_42_0:showBoatGameSp(false)
	arg_42_0:showExchangeSp(false)
	cmgr.sendRequest(nil, actions.restartArrowBoat)

	user.activityData.currentBoatId = 0

	arg_42_0:refresh()
end

function var_0_0.againBtn(arg_43_0)
	local function var_43_0(arg_44_0)
		local var_44_0 = arg_44_0.action.data

		user.activityData.currentBoatId = var_44_0.boatId

		if user.activityData.boatarrowInfo then
			user.activityData.boatarrowInfo.showSkipOption = var_44_0.showSkipOption
		end

		arg_43_0:showBoatGameSp(true)
		arg_43_0:showBuyBoatSp(false)
		arg_43_0:showExchangeSp(false)
		arg_43_0:boatDispatchUpdate()
	end

	local var_43_1 = user.activityData.boatArrowRewardInfoVo

	if var_43_1 and var_43_1.goldAgain > 0 then
		messageBox.showChargeWin("", language.get(215304, var_43_1.goldAgain), "arrowBoatGoldDispatch", function()
			cmgr.sendRequest(var_43_0, actions.dispatchArrowBoat, 0)
		end)
	else
		cmgr.sendRequest(var_43_0, actions.dispatchArrowBoat, 0)
	end
end

function var_0_0.onEnter(arg_46_0)
	arg_46_0.gotoRewardBtnRef = handler(arg_46_0, arg_46_0.gotoRewardBtn)
	arg_46_0.gotoBuyViewBtnRef = handler(arg_46_0, arg_46_0.gotoBuyViewBtn)
	arg_46_0.backBtnRef = handler(arg_46_0, arg_46_0.backBtn)
	arg_46_0.againBtnRef = handler(arg_46_0, arg_46_0.againBtn)

	arg_46_0.view.widgets.gotoRewardBtn:addHandleOfControlEvent(arg_46_0.gotoRewardBtnRef, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.gotoBuyViewBtn:addHandleOfControlEvent(arg_46_0.gotoBuyViewBtnRef, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.backBtn:addHandleOfControlEvent(arg_46_0.backBtnRef, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.againBtn:addHandleOfControlEvent(arg_46_0.againBtnRef, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.againGoldBtn:addHandleOfControlEvent(arg_46_0.againBtnRef, CCControlEventTouchUpInside)
	arg_46_0.view.widgets.cbBtn:addHandleOfControlEvent(function()
		arg_46_0.view.widgets.unite_view_on:setVisible(not user.activityData.isArrowBoatCBSelect)

		user.activityData.isArrowBoatCBSelect = not user.activityData.isArrowBoatCBSelect
	end, CCControlEventTouchUpInside)
end

function var_0_0.onExit(arg_48_0)
	return
end

return var_0_0
