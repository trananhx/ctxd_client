local var_0_0 = require("res/native/offset").get("layer.kfyz.invest")
local var_0_1 = 9999
local var_0_2 = tool.hexToRgb("#ECDEA7")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = colorQuality[4]
local var_0_6 = colorQuality[2]
local var_0_7 = false
local var_0_8 = class("kfyzInvestLayer", function()
	return createBaseLayer()
end)

var_0_8.layout_att = {
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
			name = "bg_att",
			type = "sprite9",
			x = 480,
			preferedSize = CCSizeMake(915, 532),
			middleRect = CCRectMake(10, 10, 70, 70),
			pic = {
				path = "res/ui/common/panel/comm_view.png"
			},
			children = {
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/invest/kfyz_title_cbjzyztf.png"
					}
				},
				{
					y = 455,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					y = 270,
					type = "sprite",
					x = 180,
					pic = {
						frame = true,
						path = "nationMap.png"
					},
					children = {
						{
							visible = false,
							name = "wei_part",
							y = 137,
							type = "sprite",
							x = 153,
							pic = {
								path = "res/ui/kfyz/invest/yzxms_s_map_wei.png"
							}
						},
						{
							visible = false,
							name = "shu_part",
							y = 137,
							type = "sprite",
							x = 153,
							pic = {
								path = "res/ui/kfyz/invest/yzxms_s_map_shu.png"
							}
						},
						{
							visible = false,
							name = "wu_part",
							y = 137,
							type = "sprite",
							x = 153,
							pic = {
								path = "res/ui/kfyz/invest/yzxms_s_map_wu.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng_icon",
							x = 150,
							type = "sprite",
							y = 120,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng1_icon",
							x = 205,
							type = "sprite",
							y = 140,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng2_icon",
							x = 100,
							type = "sprite",
							y = 160,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng3_icon",
							x = 140,
							type = "sprite",
							y = 80,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "wei_icon",
							x = 190,
							type = "sprite",
							y = 180,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_wei.png"
							}
						},
						{
							visible = false,
							name = "shu_icon",
							x = 80,
							type = "sprite",
							y = 110,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_shu.png"
							}
						},
						{
							visible = false,
							name = "wu_icon",
							x = 200,
							type = "sprite",
							y = 90,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_wu.png"
							}
						},
						{
							visible = false,
							name = "arrow1",
							x = 160,
							type = "sprite",
							y = 130,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow2",
							x = 135,
							type = "sprite",
							y = 120,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow3",
							x = 150,
							type = "sprite",
							y = 110,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow4",
							x = 205,
							type = "sprite",
							y = 140,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow5",
							x = 100,
							type = "sprite",
							y = 160,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow6",
							x = 140,
							type = "sprite",
							y = 80,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "fanrong0",
							x = 150,
							type = "sprite",
							y = 145,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "attFrd0",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine0",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong1",
							x = 190,
							type = "sprite",
							y = 205,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "attFrd1",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine1",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong2",
							x = 80,
							type = "sprite",
							y = 80,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "attFrd2",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine2",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong3",
							x = 200,
							type = "sprite",
							y = 60,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "attFrd3",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine3",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong4",
							x = 205,
							type = "sprite",
							y = 110,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									y = 35,
									x = 122,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine4",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong5",
							x = 100,
							type = "sprite",
							y = 190,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									y = 35,
									x = 122,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine5",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong6",
							x = 140,
							type = "sprite",
							y = 110,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									y = 35,
									x = 122,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine6",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					y = 480,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 675
				},
				{
					y = 90,
					type = "sprite",
					x = 180,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_djs_bg.png"
					},
					children = {
						{
							fontSize = 25,
							name = "name",
							y = 27,
							type = "label",
							x = 180,
							color = var_0_2
						}
					}
				},
				{
					y = 420,
					type = "sprite",
					x = 390,
					anchorPoint = ccp(0, 1),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
					}
				},
				{
					y = 390,
					x = 390,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/invest/kfyz_icon01.png"
					}
				},
				{
					name = "kfyzMoreInfo",
					width = 450,
					type = "label",
					height = 0,
					textId = 390518,
					y = 390,
					x = 430,
					fontSize = 25 + (var_0_0.descSize or 0),
					anchorPoint = ccp(0, 0.5),
					color = var_0_2,
					halign = kCCTextAlignmentLeft
				},
				{
					y = 340,
					type = "sprite",
					x = 390,
					anchorPoint = ccp(0, 1),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
					}
				},
				{
					y = 310,
					x = 390,
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon01.png"
					}
				},
				{
					height = 0,
					width = 450,
					type = "label",
					textId = 390476,
					y = 310,
					x = 430,
					fontSize = 25 + (var_0_0.descSize or 0),
					anchorPoint = ccp(0, 0.5),
					color = var_0_2,
					halign = kCCTextAlignmentLeft
				},
				{
					y = 210,
					name = "icon_type1",
					type = "sprite",
					x = 390,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_view_zhengzhaoling.png"
					},
					children = {
						{
							y = 15,
							name = "bg_progress1",
							type = "sprite",
							x = 65,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/general/jailView/new/lf_pb_bg.png"
							}
						},
						{
							name = "btn_invest1",
							h = 56,
							type = "button",
							w = 140,
							y = 35,
							x = 475,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_03.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_03_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_03_g.png"
							},
							children = {
								{
									style = "label_warlock",
									y = 33,
									type = "label",
									x = 70,
									textId = 390555,
									fontSize = 25 + (var_0_0.investBtnFntSize or 0),
									color = var_0_2
								},
								{
									y = -5,
									name = "icon1",
									scale = 0.8,
									type = "sprite",
									x = 30,
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								},
								{
									fontSize = 25,
									name = "info1",
									y = -5,
									type = "label",
									x = 50,
									anchorPoint = ccp(0, 0.5),
									color = var_0_5
								}
							}
						},
						{
							y = 15,
							name = "progress1",
							type = "progressbar",
							x = 65,
							anchorPoint = ccp(0, 0.5),
							progressType = kCCProgressTimerTypeBar,
							pic = {
								path = "res/ui/kfyz/invest/lf_pb1.png"
							}
						},
						{
							fontSize = 25,
							name = "num1",
							y = 15,
							type = "label",
							x = 235
						},
						{
							fontSize = 25,
							y = 35,
							type = "label",
							x = 80,
							textId = 390558,
							anchorPoint = ccp(0, 0),
							color = var_0_2
						},
						{
							type = "sprite",
							name = "finish1",
							y = 30,
							visible = false,
							x = 475,
							pic = {
								path = "res/ui/task/finish.png"
							}
						}
					}
				},
				{
					y = 110,
					name = "icon_type2",
					type = "sprite",
					x = 390,
					pic = {
						path = "res/ui/kfyz/invest/kfyz_view_yingzi.png"
					},
					children = {
						{
							y = 15,
							name = "bg_progress2",
							type = "sprite",
							x = 65,
							anchorPoint = ccp(0, 0.5),
							pic = {
								path = "res/ui/general/jailView/new/lf_pb_bg.png"
							}
						},
						{
							name = "btn_invest2",
							h = 56,
							type = "button",
							w = 140,
							y = 35,
							x = 475,
							normal = {
								path = "res/ui/common/button/sdyjs_btn_03.png"
							},
							touched = {
								path = "res/ui/common/button/sdyjs_btn_03_c.png"
							},
							disable = {
								path = "res/ui/common/button/sdyjs_btn_03_g.png"
							},
							children = {
								{
									style = "label_warlock",
									y = 33,
									type = "label",
									x = 70,
									textId = 390555,
									fontSize = 25 + (var_0_0.investBtnFntSize or 0),
									color = var_0_2
								},
								{
									y = -5,
									name = "icon2",
									scale = 0.8,
									type = "sprite",
									x = 30,
									pic = {
										path = "res/ui/playerInfo/icon_gold.png"
									}
								},
								{
									name = "info2",
									x = 50,
									type = "label",
									height = 0,
									y = -5,
									width = 120,
									fontSize = 25 + (var_0_0.info2FntSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_5,
									halign = kCCTextAlignmentLeft
								}
							}
						},
						{
							y = 15,
							name = "progress2",
							type = "progressbar",
							x = 65,
							anchorPoint = ccp(0, 0.5),
							progressType = kCCProgressTimerTypeBar,
							pic = {
								path = "res/ui/kfyz/invest/lf_pb2.png"
							}
						},
						{
							fontSize = 25,
							name = "num2",
							y = 15,
							type = "label",
							x = 235
						},
						{
							fontSize = 25,
							y = 35,
							type = "label",
							x = 80,
							textId = 85020,
							anchorPoint = ccp(0, 0),
							color = var_0_2
						},
						{
							type = "sprite",
							name = "finish2",
							y = 30,
							visible = false,
							x = 475,
							pic = {
								path = "res/ui/task/finish.png"
							}
						}
					}
				},
				{
					w = 42,
					name = "btn_ten",
					h = 39,
					type = "button",
					y = 40,
					x = 440,
					normal = {
						path = "res/ui/playerInfo/setting/unite_view_a.png"
					},
					touched = {
						path = "res/ui/playerInfo/setting/unite_view_on.png"
					}
				},
				{
					fontSize = 25,
					y = 40,
					type = "label",
					x = 460,
					textId = 390556,
					anchorPoint = ccp(0, 0.5),
					color = var_0_2
				},
				{
					zoomOnTouchDown = true,
					name = "seeMore",
					h = 24,
					type = "button",
					w = 144,
					y = 480,
					visible = false,
					x = 100,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							fontSize = 24,
							name = "linkLb3",
							y = 12,
							type = "label",
							x = 72,
							textId = 215212,
							color = colorQuality[3]
						}
					}
				},
				{
					type = "node",
					name = "moreList",
					y = 220,
					visible = false,
					x = 45,
					children = {
						{
							y = 185.0001,
							name = "bfslyz_ybm_di",
							type = "sprite",
							x = 157,
							pic = {
								path = "res/ui/kfyz/threeRoad/bfslyz_ybm_di.png"
							}
						},
						{
							y = 188,
							name = "bfslyz_flag",
							type = "sprite",
							x = 45.9998,
							pic = {
								path = "res/ui/kfyz/threeRoad/bfslyz_flag_03.png"
							}
						},
						{
							w = 46,
							name = "downBtn",
							h = 34,
							type = "button",
							y = 185.0002,
							x = 249.9994,
							normal = {
								path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn.png"
							},
							touched = {
								path = "res/ui/kfyz/threeRoad/bfslyz_ybm_btn_c.png"
							}
						},
						{
							fontSize = 20,
							name = "signLb",
							y = 185.0002,
							type = "label",
							x = 157
						},
						{
							y = 152,
							name = "listBg",
							visible = false,
							type = "node",
							x = 157
						}
					}
				},
				{
					y = 475,
					x = 798,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							fontSize = 30,
							y = 35,
							type = "label",
							x = 180,
							textId = 390557,
							anchorPoint = ccp(1, 0.5),
							color = var_0_2
						},
						{
							fontSize = 30,
							name = "time",
							y = 35,
							type = "label",
							x = 195,
							anchorPoint = ccp(0, 0.5),
							color = var_0_4
						}
					}
				},
				{
					y = 40,
					name = "bg_txt3",
					type = "sprite",
					x = 180,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							x = 160,
							name = "iconReward0",
							y = 35,
							type = "sprite",
							scale = 0.7,
							pic = {
								path = "res/ui/task/get_icon_gem.png"
							}
						},
						{
							fontSize = 25,
							name = "maxReward0",
							y = 35,
							type = "label",
							x = 180,
							color = var_0_6,
							anchorPoint = ccp(0, 0.5)
						},
						{
							visible = false,
							name = "iconReward0_2",
							x = 250,
							type = "sprite",
							y = 35,
							scale = 0.6,
							pic = {
								path = "res/ui/task/huangcheng.png"
							}
						},
						{
							fontSize = 25,
							name = "maxReward0_2",
							visible = false,
							type = "label",
							y = 35,
							x = 270,
							color = var_0_6,
							anchorPoint = ccp(0, 0.5)
						},
						{
							visible = false,
							name = "iconReward0_3",
							x = 340,
							type = "sprite",
							y = 35,
							scale = 0.7,
							pic = {
								path = "res/ui/task/get_icon_gxczlsp.png"
							}
						},
						{
							fontSize = 25,
							name = "maxReward0_3",
							visible = false,
							type = "label",
							y = 35,
							x = 360,
							color = var_0_6,
							anchorPoint = ccp(0, 0.5)
						},
						{
							height = 0,
							width = 120,
							type = "label",
							textId = 390516,
							y = 35,
							x = 20,
							fontSize = 25 + (var_0_0.rewardDescSize or 0),
							anchorPoint = ccp(0, 0.5),
							color = var_0_2
						},
						{
							w = 50,
							name = "btn_info",
							h = 50,
							type = "button",
							y = 35,
							x = 300,
							normal = {
								path = "res/ui/common/button/gxb_btn_small.png"
							},
							touched = {
								path = "res/ui/common/button/gxb_btn_small_c.png"
							}
						}
					}
				},
				{
					visible = false,
					name = "bg_info",
					type = "sprite9",
					y = 55,
					x = 320,
					preferedSize = CCSizeMake(260, 150),
					middleRect = CCRectMake(10, 10, 29, 29),
					anchorPoint = ccp(1, 0),
					pic = {
						frame = true,
						path = "common_tip_frame_small.png"
					},
					children = {
						{
							y = 50,
							name = "bar1",
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/gonghe/ghjl_line.png"
							}
						},
						{
							y = 100,
							name = "bar2",
							type = "sprite",
							x = 130,
							pic = {
								path = "res/ui/gonghe/ghjl_line.png"
							}
						},
						{
							y = 124,
							name = "node1",
							type = "node",
							x = 15,
							children = {
								{
									y = 0,
									type = "label",
									x = 0,
									textId = 390506,
									fontSize = 25 + (var_0_0.rewardTipFntSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_2
								},
								{
									x = 180,
									name = "iconReward1",
									y = 0,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/task/get_icon_gem.png"
									}
								},
								{
									fontSize = 25,
									name = "maxReward1",
									y = 0,
									type = "label",
									x = 200,
									color = var_0_6,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 75,
							name = "node2",
							type = "node",
							x = 15,
							children = {
								{
									y = 0,
									type = "label",
									x = 0,
									textId = 390507,
									fontSize = 25 + (var_0_0.rewardTipFntSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_2
								},
								{
									x = 180,
									name = "iconReward2",
									y = 0,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/task/get_icon_gem.png"
									}
								},
								{
									fontSize = 25,
									name = "maxReward2",
									y = 0,
									type = "label",
									x = 200,
									color = var_0_6,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 26,
							name = "node3",
							type = "node",
							x = 15,
							children = {
								{
									y = 0,
									type = "label",
									x = 0,
									textId = 390508,
									fontSize = 25 + (var_0_0.rewardTipFntSize or 0),
									anchorPoint = ccp(0, 0.5),
									color = var_0_2
								},
								{
									x = 180,
									name = "iconReward3",
									y = 0,
									type = "sprite",
									scale = 0.7,
									pic = {
										path = "res/ui/task/get_icon_gem.png"
									}
								},
								{
									fontSize = 25,
									name = "maxReward3",
									y = 0,
									type = "label",
									x = 200,
									color = var_0_6,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				}
			}
		}
	}
}
var_0_8.layout_def = {
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
			name = "bg_def",
			type = "sprite9",
			x = 480,
			preferedSize = CCSizeMake(915, 532),
			middleRect = CCRectMake(10, 10, 70, 70),
			pic = {
				path = "res/ui/common/panel/comm_view.png"
			},
			children = {
				{
					y = 480,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/kfyz/invest/kfyz_title_yzxldcgj.png"
					}
				},
				{
					y = 455,
					x = 458,
					type = "sprite",
					pic = {
						path = "res/ui/general/jailView/comm_list_laofang_3.png"
					}
				},
				{
					y = 270,
					type = "sprite",
					x = 180,
					pic = {
						frame = true,
						path = "nationMap.png"
					},
					children = {
						{
							visible = false,
							name = "wei_part",
							y = 137,
							type = "sprite",
							x = 153,
							pic = {
								path = "res/ui/kfyz/invest/yzxms_s_map_wei.png"
							}
						},
						{
							visible = false,
							name = "shu_part",
							y = 137,
							type = "sprite",
							x = 153,
							pic = {
								path = "res/ui/kfyz/invest/yzxms_s_map_shu.png"
							}
						},
						{
							visible = false,
							name = "wu_part",
							y = 137,
							type = "sprite",
							x = 153,
							pic = {
								path = "res/ui/kfyz/invest/yzxms_s_map_wu.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng_icon",
							x = 150,
							type = "sprite",
							y = 120,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng1_icon",
							x = 205,
							type = "sprite",
							y = 140,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng2_icon",
							x = 100,
							type = "sprite",
							y = 160,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "yuanzheng3_icon",
							x = 140,
							type = "sprite",
							y = 80,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_yuanzheng.png"
							}
						},
						{
							visible = false,
							name = "wei_icon",
							x = 190,
							type = "sprite",
							y = 180,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_wei.png"
							}
						},
						{
							visible = false,
							name = "shu_icon",
							x = 80,
							type = "sprite",
							y = 110,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_shu.png"
							}
						},
						{
							visible = false,
							name = "wu_icon",
							x = 200,
							type = "sprite",
							y = 90,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_icon_wu.png"
							}
						},
						{
							visible = false,
							name = "arrow1",
							x = 160,
							type = "sprite",
							y = 130,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow2",
							x = 135,
							type = "sprite",
							y = 120,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow3",
							x = 150,
							type = "sprite",
							y = 110,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow4",
							x = 205,
							type = "sprite",
							y = 140,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow5",
							x = 100,
							type = "sprite",
							y = 160,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "arrow6",
							x = 140,
							type = "sprite",
							y = 80,
							scale = 0.8,
							anchorPoint = ccp(1, 0.5),
							pic = {
								path = "res/ui/kfyz/invest/kfyz_map_arrows.png"
							}
						},
						{
							visible = false,
							name = "fanrong0",
							x = 150,
							type = "sprite",
							y = 145,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "defFrd0",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine0",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong1",
							x = 190,
							type = "sprite",
							y = 205,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "defFrd1",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine1",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong2",
							x = 80,
							type = "sprite",
							y = 80,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "defFrd2",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine2",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong3",
							x = 200,
							type = "sprite",
							y = 60,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									x = 122,
									name = "defFrd3",
									y = 35,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine3",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong4",
							x = 205,
							type = "sprite",
							y = 110,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									y = 35,
									x = 122,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine4",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong5",
							x = 100,
							type = "sprite",
							y = 190,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									y = 35,
									x = 122,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine5",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							visible = false,
							name = "fanrong6",
							x = 140,
							type = "sprite",
							y = 110,
							scale = 0.5,
							pic = {
								path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
							},
							children = {
								{
									y = 35,
									x = 122,
									type = "sprite",
									scale = 1.4,
									pic = {
										path = "res/ui/kfyz/yuyue/yyyz_word_frd.png"
									}
								},
								{
									x = 192,
									name = "mine6",
									type = "atlaslabel",
									pic = "res/ui/common/number/yyyz_word_frd_digit.png",
									startCharMap = 48,
									text = "0",
									y = 35,
									itemWidth = 18,
									scale = 1.4,
									itemHeight = 26,
									anchorPoint = ccp(0, 0.5)
								}
							}
						}
					}
				},
				{
					y = 480,
					name = "btn_tip",
					style = "button_tip",
					type = "button",
					x = 860
				},
				{
					y = 90,
					type = "sprite",
					x = 180,
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_djs_bg.png"
					},
					children = {
						{
							scale = 0.7,
							y = 27,
							type = "sprite",
							x = 180,
							pic = {
								path = "res/ui/kfyz/wait/kfyz_await_word_yzf.png"
							}
						}
					}
				},
				{
					y = 390,
					x = 190,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							fontSize = 30,
							y = 35,
							type = "label",
							x = 180,
							textId = 390557,
							anchorPoint = ccp(1, 0.5),
							color = var_0_2
						},
						{
							fontSize = 30,
							name = "time",
							y = 35,
							type = "label",
							x = 195,
							anchorPoint = ccp(0, 0.5),
							color = var_0_4
						}
					}
				},
				{
					y = 40,
					type = "sprite",
					x = 180,
					pic = {
						path = "res/ui/kfyz/yuyue/yyyz_zfrd_bg.png"
					},
					children = {
						{
							scale = 0.6,
							y = 35,
							type = "sprite",
							x = 290,
							pic = {
								path = "res/ui/playerInfo/role_nation_view.png"
							}
						},
						{
							fontSize = 30,
							name = "name",
							y = 35,
							type = "label",
							x = 70,
							anchorPoint = ccp(0, 0.5),
							color = var_0_2
						},
						{
							x = 45,
							name = "icon",
							y = 35,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/kfyz/wait/yyyz_frd_icon.png"
							}
						},
						{
							fontSize = 26,
							name = "icon_force",
							y = 35,
							type = "label",
							x = 290
						}
					}
				},
				{
					y = 420,
					type = "sprite9",
					x = 390,
					preferedSize = CCSizeMake(565, 100),
					middleRect = CCRectMake(280, 20, 5, 28),
					anchorPoint = ccp(0, 1),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_small_bg.png"
					}
				},
				{
					y = 330,
					type = "sprite9",
					x = 350,
					preferedSize = CCSizeMake(589, 320),
					middleRect = CCRectMake(290, 50, 9, 112),
					anchorPoint = ccp(0, 1),
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_jl_bg.png"
					}
				},
				{
					height = 0,
					width = 450,
					type = "label",
					y = 375,
					textId = 390462,
					x = 430,
					fontSize = 25 + (var_0_0.descSize or 0),
					anchorPoint = ccp(0, 0.5),
					color = var_0_2,
					halign = kCCTextAlignmentLeft
				},
				{
					y = 390,
					x = 390,
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon01.png"
					}
				},
				{
					y = 300,
					x = 390,
					type = "sprite",
					pic = {
						path = "res/ui/nationTask/newPic/rwyh_icon03.png"
					}
				},
				{
					height = 0,
					width = 130,
					type = "label",
					textId = 390510,
					y = 310,
					x = 430,
					fontSize = 25 + (var_0_0.descSize or 0),
					anchorPoint = ccp(0, 1),
					color = var_0_2,
					halign = kCCTextAlignmentLeft
				},
				{
					height = 0,
					width = 130,
					type = "label",
					textId = 390511,
					y = 215,
					x = 430,
					fontSize = 25 + (var_0_0.descSize or 0),
					anchorPoint = ccp(0, 1),
					color = var_0_2,
					halign = kCCTextAlignmentLeft
				},
				{
					type = "node",
					name = "node_reward"
				}
			}
		}
	}
}
var_0_8.rewardItem = {
	name = "bg",
	type = "sprite",
	anchorPoint = ccp(0.5, 1),
	pic = {
		path = "res/ui/task/get_rewa_icon.jpg"
	},
	children = {
		{
			y = 42,
			name = "icon",
			type = "sprite",
			x = 35,
			pic = {
				path = "res/ui/task/bintie.png"
			}
		},
		{
			y = 22,
			name = "txt",
			type = "sprite",
			x = 35,
			pic = {
				path = "res/ui/task/get_rewa_iron.png"
			}
		},
		{
			fontSize = 23,
			name = "num",
			y = 0,
			type = "label",
			x = 35,
			anchorPoint = ccp(0.5, 1),
			color = var_0_2
		}
	}
}
var_0_8.tipFrame = {
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
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_2
		}
	}
}

local var_0_9

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	var_0_9 = var_0_9 or user.kfRoadId

	if user.preKfRoadId and user.preKfRoadId > 0 then
		var_0_9 = user.preKfRoadId
	end

	cmgr.sendRequest(var_2_0, actions.kfyzGetInvestInfo, var_0_9)

	user.preKfRoadId = 0
end

function var_0_8.onBtnTokenTap(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		arg_4_0:showInvsetEffect(var_5_0, true)
		arg_4_0:refresh()
	end

	messageBox.showChargeWin(language.get(190080), language.get(390537, arg_4_0.info.orderGold), "useGoldOrder", function()
		cmgr.sendRequest(var_4_0, actions.kfyzInvestGoods, 0, 1, var_0_9)
	end)
end

function var_0_8.onBtnPhantomTap(arg_7_0)
	local function var_7_0(arg_8_0)
		local var_8_0 = arg_8_0.action.data

		arg_7_0:showInvsetEffect(var_8_0, false)
		arg_7_0:refresh()
	end

	local var_7_1 = var_0_7 and 10 or 1
	local var_7_2 = math.min(var_7_1, arg_7_0.info.phantomTotal - arg_7_0.info.phantomNum)

	if arg_7_0.info.freePhantomNum > 0 then
		var_7_2 = math.min(var_7_2, arg_7_0.info.freePhantomNum)

		cmgr.sendRequest(var_7_0, actions.kfyzInvestGoods, 1, var_7_2, var_0_9)
	else
		messageBox.showChargeWin(language.get(190080), language.get(390538, var_7_2 * arg_7_0.info.phantomGold), "jiebingGold", function()
			cmgr.sendRequest(var_7_0, actions.kfyzInvestGoods, 1, var_7_2, var_0_9)
		end)
	end
end

function var_0_8.showInvsetEffect(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_1.needRefresh then
		return
	end

	local var_10_0 = arg_10_2 and 10017 or 10018
	local var_10_1 = arg_10_2 and 390481 or 390480
	local var_10_2 = arg_10_2 and "icon_type1" or "icon_type2"
	local var_10_3 = {}
	local var_10_4 = {
		id = var_10_0,
		value = arg_10_1.num
	}

	table.insert(var_10_3, var_10_4)
	globalAction_gotResource(var_10_3)

	if arg_10_1.addExp and arg_10_1.addExp > 0 then
		local var_10_5 = CCLabelTTF:create(language.get(var_10_1, arg_10_1.gold, arg_10_1.addExp), "Thonburi", 25)

		var_10_5:setColor(var_0_3)
		var_10_5:setAnchorPoint(ccp(0, 0))
		var_10_5:setPosition(ccp(170, 40))
		var_10_5:setHorizontalAlignment(kCCTextAlignmentLeft)
		arg_10_0.view.widgets[var_10_2]:addChild(var_10_5)

		local var_10_6 = CCArray:create()

		var_10_6:addObject(CCDelayTime:create(1.5))
		var_10_6:addObject(CCFadeOut:create(0.5))
		var_10_6:addObject(CCCallFuncN:create(function()
			var_10_5:removeFromParentAndCleanup(true)
		end))
		var_10_5:runAction(CCSequence:create(var_10_6))
	end
end

function var_0_8.updatePanelAtt(arg_12_0, arg_12_1)
	if arg_12_1.signNum then
		arg_12_0.view.widgets.signLb:setString(language.get(215205, arg_12_1.signNum))

		if arg_12_1.signNum > 0 then
			arg_12_0.view.widgets.downBtn:setVisible(true)
		else
			arg_12_0.view.widgets.downBtn:setVisible(false)
		end

		local var_12_0 = var_0_9 or 1

		arg_12_0.view.widgets.bfslyz_flag:setDisplayFrame(CCSprite:create("res/ui/kfyz/threeRoad/bfslyz_flag_0" .. var_12_0 .. ".png"):displayFrame())
	end

	if user.isSoldiersThreeRoad and arg_12_1.nationInfos then
		arg_12_0.view.widgets.kfyzMoreInfo:setString(language.get(215222, arg_12_1.nationInfos[1].nationName))
	end

	arg_12_0.view.widgets.time:stopAllActions()
	arg_12_0.view.widgets.time:setString(tool.getFormatTime(arg_12_1.leftTime))

	if arg_12_1.leftTime > 0 then
		local var_12_1 = CCArray:create()

		var_12_1:addObject(CCDelayTime:create(1))
		var_12_1:addObject(CCCallFuncN:create(function()
			arg_12_1.leftTime = arg_12_1.leftTime - 1000

			if arg_12_1.leftTime <= 0 then
				arg_12_0:removeFromParentAndCleanup(true)
				notice.control.enterKfyz()
			else
				arg_12_0.view.widgets.time:setString(tool.getFormatTime(arg_12_1.leftTime))
			end
		end))

		local var_12_2 = CCSequence:create(var_12_1)

		arg_12_0.view.widgets.time:runAction(CCRepeatForever:create(var_12_2))
	end

	if arg_12_1.nationInfos then
		if arg_12_1.isSxZb then
			for iter_12_0, iter_12_1 in pairs(arg_12_1.nationInfos) do
				if iter_12_1.isAtt == false then
					arg_12_0.view.widgets.name:setString(tool.getServerName(iter_12_1.serverName) .. " " .. iter_12_1.nationName .. "")
				end
			end
		else
			for iter_12_2, iter_12_3 in pairs(arg_12_1.nationInfos) do
				if iter_12_3.isAtt == false then
					local var_12_3
					local var_12_4 = type(iter_12_3.serverName) == "userdata" and "NPC" or tool.getServerName(iter_12_3.serverName)

					arg_12_0.view.widgets.name:setString(var_12_4)

					break
				end
			end
		end
	end

	if arg_12_1.nationInfos then
		if arg_12_1.isSxZb then
			local var_12_5 = 0
			local var_12_6 = 0

			for iter_12_4, iter_12_5 in pairs(arg_12_1.nationInfos) do
				if iter_12_5.isAtt == false then
					var_12_5 = tonumber(iter_12_5.nation)

					if var_12_5 == 1 then
						arg_12_0.view.widgets.wei_part:setVisible(true)
						arg_12_0.view.widgets.wei_icon:setVisible(true)
					elseif var_12_5 == 2 then
						arg_12_0.view.widgets.shu_part:setVisible(true)
						arg_12_0.view.widgets.shu_icon:setVisible(true)
					else
						arg_12_0.view.widgets.wu_part:setVisible(true)
						arg_12_0.view.widgets.wu_icon:setVisible(true)
					end

					arg_12_0.view.widgets["yuanzheng" .. var_12_5 .. "_icon"]:setVisible(true)
					arg_12_0.view.widgets["arrow" .. var_12_5 + 3]:setVisible(true)
					arg_12_0.view.widgets["fanrong" .. var_12_5]:setVisible(true)
					arg_12_0.view.widgets["fanrong" .. var_12_5 + 3]:setVisible(true)
					arg_12_0.view.widgets["mine" .. var_12_5]:setString(iter_12_5.mine)
				else
					var_12_6 = iter_12_5.mine
				end
			end

			if var_12_5 > 0 then
				arg_12_0.view.widgets["mine" .. var_12_5 + 3]:setString(var_12_6)
			end
		else
			for iter_12_6, iter_12_7 in pairs(arg_12_1.nationInfos) do
				if iter_12_7.isAtt then
					arg_12_0.view.widgets.mine0:setString(iter_12_7.mine)
				else
					arg_12_0.view.widgets["mine" .. iter_12_7.nation]:setString(iter_12_7.mine)
				end
			end

			arg_12_0.view.widgets.yuanzheng_icon:setVisible(true)
			arg_12_0.view.widgets.wei_icon:setVisible(true)
			arg_12_0.view.widgets.shu_icon:setVisible(true)
			arg_12_0.view.widgets.wu_icon:setVisible(true)
			arg_12_0.view.widgets.arrow1:setVisible(true)
			arg_12_0.view.widgets.arrow2:setVisible(true)
			arg_12_0.view.widgets.arrow3:setVisible(true)
			arg_12_0.view.widgets.fanrong0:setVisible(true)
			arg_12_0.view.widgets.fanrong1:setVisible(true)
			arg_12_0.view.widgets.fanrong2:setVisible(true)
			arg_12_0.view.widgets.fanrong3:setVisible(true)
		end
	end

	if arg_12_1.nationInfos then
		if arg_12_1.isSxZb then
			for iter_12_8, iter_12_9 in pairs(arg_12_1.nationInfos) do
				if iter_12_9.isAtt == false then
					local var_12_7 = string.format("res/ui/task/get_icon_%s.png", arg_12_1.isBlueprint and "zctz" or arg_12_1.isGem and "gem" or "iron")

					arg_12_0.view.widgets.maxReward0:setString(iter_12_9.maxReward)
					arg_12_0.view.widgets.iconReward0:setDisplayFrame(CCSprite:create(var_12_7):displayFrame())
					arg_12_0.view.widgets.maxReward0_2:setString(iter_12_9.maxFeat)
					arg_12_0.view.widgets.maxReward0_2:setVisible(true)
					arg_12_0.view.widgets.iconReward0_2:setVisible(true)
					arg_12_0.view.widgets.maxReward0_3:setString(iter_12_9.maxPiece)
					arg_12_0.view.widgets.maxReward0_3:setVisible(true)
					arg_12_0.view.widgets.iconReward0_3:setVisible(true)
					arg_12_0.view.widgets.btn_info:setVisible(false)
				end
			end
		else
			local var_12_8 = string.format("res/ui/task/get_icon_%s.png", arg_12_1.isBlueprint and "zctz" or arg_12_1.isGem and "gem" or "iron")

			arg_12_0.view.widgets.btn_info:setVisible(true)

			for iter_12_10, iter_12_11 in pairs(arg_12_1.nationInfos) do
				if iter_12_11.isAtt == false then
					if type(iter_12_11.serverName) == "userdata" then
						iter_12_11.nation = iter_12_11.forceId
					end

					arg_12_0.view.widgets["maxReward" .. iter_12_11.nation]:setString(iter_12_11.maxReward)
					arg_12_0.view.widgets["iconReward" .. iter_12_11.nation]:setDisplayFrame(CCSprite:create(var_12_8):displayFrame())
				else
					arg_12_0.view.widgets.maxReward0:setString(arg_12_1.maxReward)
					arg_12_0.view.widgets.iconReward0:setDisplayFrame(CCSprite:create(var_12_8):displayFrame())
				end
			end
		end
	end

	arg_12_0.view.widgets.info1:setString(arg_12_1.orderGold)

	local var_12_9 = arg_12_1.freePhantomNum == 0

	arg_12_0.view.widgets.icon2:setVisible(var_12_9)

	local var_12_10
	local var_12_11
	local var_12_14

	if var_12_9 then
		local var_12_12 = var_0_7 and 10 or 1
		local var_12_13 = math.min(var_12_12, arg_12_0.info.phantomTotal - arg_12_0.info.phantomNum)

		var_12_10 = arg_12_1.phantomGold * var_12_13
		var_12_14 = 50
	else
		var_12_10 = language.get(103009, arg_12_1.freePhantomNum)
		var_12_14 = 20
	end

	arg_12_0.view.widgets.info2:setString(var_12_10)
	arg_12_0.view.widgets.info2:setPositionX(var_12_14)

	local var_12_15 = {
		{
			num = arg_12_1.tokenNum,
			total = arg_12_1.tokenTotal
		},
		{
			num = arg_12_1.phantomNum,
			total = arg_12_1.phantomTotal
		}
	}

	for iter_12_12 = 1, 2 do
		local var_12_16 = var_12_15[iter_12_12].num
		local var_12_17 = var_12_15[iter_12_12].total

		arg_12_0.view.widgets["progress" .. iter_12_12]:setPercentage(100 * var_12_16 / var_12_17)
		arg_12_0.view.widgets["num" .. iter_12_12]:setString(language.get(390478, var_12_16, var_12_17))

		local var_12_18 = var_12_17 <= var_12_16

		arg_12_0.view.widgets["finish" .. iter_12_12]:setVisible(var_12_18)
		arg_12_0.view.widgets["btn_invest" .. iter_12_12]:setVisible(not var_12_18)

		if var_12_18 then
			if not arg_12_0["fire" .. iter_12_12] then
				local var_12_19 = CCParticleSystemQuad:create("res/ui/kfyz/invest/fire_bar.plist")

				var_12_19:setScaleX(0.5)
				var_12_19:setScaleY(0.35)
				var_12_19:setPosition(ccp(235, 15))
				arg_12_0.view.widgets["icon_type" .. iter_12_12]:addChild(var_12_19)

				arg_12_0["fire" .. iter_12_12] = var_12_19
			end
		elseif arg_12_0["fire" .. iter_12_12] then
			arg_12_0["fire" .. iter_12_12]:removeFromParentAndCleanup(true)

			arg_12_0["fire" .. iter_12_12] = nil
		end
	end
end

function var_0_8.updatePanelDef(arg_14_0, arg_14_1)
	arg_14_0.view.widgets.time:stopAllActions()
	arg_14_0.view.widgets.time:setString(tool.getFormatTime(arg_14_1.leftTime))

	if arg_14_1.leftTime > 0 then
		local var_14_0 = CCArray:create()

		var_14_0:addObject(CCDelayTime:create(1))
		var_14_0:addObject(CCCallFuncN:create(function()
			arg_14_1.leftTime = arg_14_1.leftTime - 1000

			if arg_14_1.leftTime <= 0 then
				arg_14_0:removeFromParentAndCleanup(true)
			else
				arg_14_0.view.widgets.time:setString(tool.getFormatTime(arg_14_1.leftTime))
			end
		end))

		local var_14_1 = CCSequence:create(var_14_0)

		arg_14_0.view.widgets.time:runAction(CCRepeatForever:create(var_14_1))
	end

	if arg_14_1.nationInfos then
		for iter_14_0, iter_14_1 in pairs(arg_14_1.nationInfos) do
			if iter_14_1.isAtt then
				if iter_14_1.server == "npc" then
					arg_14_0.view.widgets.name:setString(language.get(390440))
					arg_14_0.view.widgets.icon_force:setString(language.get(190015))
					arg_14_0.view.widgets.icon_force:setColor(ccc3(255, 255, 0))
				else
					arg_14_0.view.widgets.name:setString(tool.getServerName(iter_14_1.serverName))
					arg_14_0.view.widgets.icon_force:setString(iter_14_1.nationName)
					arg_14_0.view.widgets.icon_force:setColor(colorForce[iter_14_1.nation])
				end

				if iter_14_1.attTally then
					rmgr.setTallyPic(iter_14_1.attTally, arg_14_0.view.widgets.icon)
				end
			end
		end
	end

	if arg_14_1.attTally then
		rmgr.setTallyPic(arg_14_1.attTally, arg_14_0.view.widgets.icon)
	end

	if arg_14_1.nationInfos then
		if arg_14_1.isSxZb then
			local var_14_2 = 0
			local var_14_3 = 0

			for iter_14_2, iter_14_3 in pairs(arg_14_1.nationInfos) do
				if iter_14_3.isAtt == false then
					var_14_2 = tonumber(iter_14_3.nation)

					if var_14_2 == 1 then
						arg_14_0.view.widgets.wei_part:setVisible(true)
						arg_14_0.view.widgets.wei_icon:setVisible(true)
					elseif var_14_2 == 2 then
						arg_14_0.view.widgets.shu_part:setVisible(true)
						arg_14_0.view.widgets.shu_icon:setVisible(true)
					else
						arg_14_0.view.widgets.wu_part:setVisible(true)
						arg_14_0.view.widgets.wu_icon:setVisible(true)
					end

					arg_14_0.view.widgets["yuanzheng" .. var_14_2 .. "_icon"]:setVisible(true)
					arg_14_0.view.widgets["arrow" .. var_14_2 + 3]:setVisible(true)
					arg_14_0.view.widgets["fanrong" .. var_14_2]:setVisible(true)
					arg_14_0.view.widgets["fanrong" .. var_14_2 + 3]:setVisible(true)
					arg_14_0.view.widgets["mine" .. var_14_2]:setString(iter_14_3.mine)
				else
					var_14_3 = iter_14_3.mine
				end
			end

			if var_14_2 > 0 then
				arg_14_0.view.widgets["mine" .. var_14_2 + 3]:setString(var_14_3)
			end
		else
			local var_14_4 = user.player.forceId

			arg_14_0.view.widgets["arrow" .. var_14_4]:setVisible(true)
			arg_14_0.view.widgets.yuanzheng_icon:setVisible(true)

			if var_14_4 == 1 then
				arg_14_0.view.widgets.wei_icon:setVisible(true)
			elseif var_14_4 == 2 then
				arg_14_0.view.widgets.shu_icon:setVisible(true)
			else
				arg_14_0.view.widgets.wu_icon:setVisible(true)
			end

			arg_14_0.view.widgets.fanrong0:setVisible(true)
			arg_14_0.view.widgets["fanrong" .. var_14_4]:setVisible(true)

			for iter_14_4, iter_14_5 in pairs(arg_14_1.nationInfos) do
				if iter_14_5.isAtt == false then
					if iter_14_5.nation == var_14_4 then
						arg_14_0.view.widgets["mine" .. var_14_4]:setString(iter_14_5.mine)
					end
				else
					arg_14_0.view.widgets.mine0:setString(iter_14_5.mine)
				end
			end
		end
	end

	arg_14_0.view.widgets.node_reward:removeAllChildrenWithCleanup(true)

	local var_14_5 = {
		[218] = "zctz",
		[10] = "exp",
		[4] = "iron",
		[17] = "gem",
		[146] = "gxczlsp",
		[13] = "gongxun",
		[var_0_1] = "mine"
	}

	local function var_14_6(arg_16_0, arg_16_1)
		return arg_16_0.targetForceId < arg_16_1.targetForceId
	end

	table.sort(arg_14_1.rewards, var_14_6)

	local var_14_7 = 1

	for iter_14_6, iter_14_7 in ipairs(arg_14_1.rewards) do
		if #arg_14_1.rewards ~= 4 or iter_14_7.targetForceId == user.player.forceId or iter_14_7.targetForceId > 1000 then
			local var_14_8 = 310 - 95 * (var_14_7 - 1)

			var_14_7 = var_14_7 + 1

			if iter_14_7.mineRewards and iter_14_7.mineRewards > 0 then
				table.insert(iter_14_7.subRewards, {
					type = var_0_1,
					value = iter_14_7.mineRewards
				})
			end

			for iter_14_8, iter_14_9 in ipairs(iter_14_7.subRewards) do
				local var_14_9 = 590 + 90 * (iter_14_8 - 1)
				local var_14_10 = {}

				uiutil.initWidgets(var_14_10, arg_14_0.rewardItem)
				var_14_10.widgets.bg:setPosition(ccp(var_14_9, var_14_8))
				arg_14_0.view.widgets.node_reward:addChild(var_14_10.widgets.bg)
				log.info(iter_14_9.type)
				var_14_10.widgets.icon:setDisplayFrame(CCSprite:create(string.format("res/ui/task/get_icon_%s.png", var_14_5[iter_14_9.type])):displayFrame())
				var_14_10.widgets.txt:setDisplayFrame(CCSprite:create(string.format("res/ui/task/get_rewa_%s.png", var_14_5[iter_14_9.type])):displayFrame())
				var_14_10.widgets.num:setString(tool.getFormatNum(iter_14_9.value))

				if iter_14_9.type == var_0_1 then
					local var_14_11 = CCSprite:createWithSpriteFrameName("xzymz_jb_gj.png")

					var_14_11:setAnchorPoint(ccp(0, 1))
					var_14_11:setPosition(0, 70)
					var_14_11:setScale(0.8)
					var_14_10.widgets.bg:addChild(var_14_11)
				end
			end
		end
	end
end

function var_0_8.showPanel(arg_17_0, arg_17_1)
	arg_17_0.info = arg_17_1

	if user.invastType == 1 then
		arg_17_0:updatePanelAtt(arg_17_1)
		arg_17_0:refineAttLayout()
	elseif user.invastType == 2 then
		arg_17_0:updatePanelDef(arg_17_1)
		arg_17_0:refineDefLayout()
	end
end

function var_0_8.getAddMoreList(arg_18_0, arg_18_1, arg_18_2)
	cmgr.sendRequest(function(arg_19_0)
		local var_19_0 = arg_19_0.action.data

		arg_18_0:moreList(arg_18_2, var_19_0.players)
		arg_18_2:setVisible(true)
	end, actions.kfyzGetSignInfo, arg_18_1)
end

function var_0_8.moreList(arg_20_0, arg_20_1, arg_20_2)
	local function var_20_0(arg_21_0, arg_21_1)
		return 30, 290
	end

	local function var_20_1(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0:dequeueCell()

		if var_22_0 then
			var_22_0:removeAllChildrenWithCleanup(true)
		else
			var_22_0 = CCTableViewCell:new()
		end

		local var_22_1 = arg_20_2[arg_22_1 + 1]

		if var_22_1 then
			local var_22_2

			if arg_22_1 % 2 == 1 then
				var_22_2 = CCSprite:create("res/ui/kfyz/threeRoad/bfslyz_ybm_list_02.png")
			else
				var_22_2 = CCSprite:create("res/ui/kfyz/threeRoad/bfslyz_ybm_list_01.png")
			end

			var_22_2:setAnchorPoint(ccp(0, 0.5))
			var_22_0:addChild(var_22_2)

			local var_22_3 = CCLabelTTF:create(tonumber(arg_22_1 + 1) .. "·" .. var_22_1.playerName, "", 20)

			var_22_3:setAnchorPoint(ccp(0, 0.5))
			var_22_3:setPosition(ccp(35, 0))
			var_22_0:addChild(var_22_3)

			local var_22_4 = CCLabelTTF:create("Lv·" .. var_22_1.playerLv, "", 20)

			var_22_4:setAnchorPoint(ccp(0, 0.5))
			var_22_4:setPosition(ccp(180, 0))
			var_22_0:addChild(var_22_4)
		end

		return var_22_0
	end

	local function var_20_2()
		local var_23_0 = arg_20_2

		if var_23_0 and #var_23_0 > 0 then
			return #var_23_0
		else
			return 0
		end
	end

	local var_20_3 = CCTableView:create(CCSizeMake(290, 160))

	var_20_3:setPosition(-145, -127)
	var_20_3:setDirection(kCCScrollViewDirectionVertical)
	var_20_3:setVerticalFillOrder(kCCTableViewFillTopDown)
	arg_20_1:addChild(var_20_3)
	var_20_3:registerScriptHandler(var_20_0, CCTableView.kTableCellSizeForIndex)
	var_20_3:registerScriptHandler(var_20_1, CCTableView.kTableCellSizeAtIndex)
	var_20_3:registerScriptHandler(var_20_2, CCTableView.kNumberOfCellsInTableView)
	var_20_3:reloadData()
end

function var_0_8.ctor(arg_24_0, arg_24_1, arg_24_2)
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/nation/nation.plist")

	arg_24_0.view = {}

	swallowTouch(arg_24_0)

	if user.invastType == 1 then
		uiutil.initWidgets(arg_24_0.view, arg_24_0.layout_att)

		if user.isSoldiersThreeRoad then
			arg_24_0.view.widgets.seeMore:setVisible(true)
			arg_24_0.view.widgets.moreList:setVisible(true)

			local function var_24_0(...)
				local var_25_0 = smgr.getLayer("topLayer")

				var_25_0:removeAllChildrenWithCleanup(true)
				require("lua/layer/kfyz/KfyzMorePanel").new(var_25_0)
			end

			local function var_24_1(...)
				local var_26_0 = arg_24_0.view.widgets.downBtn:getScale()

				if var_26_0 < 0 then
					arg_24_0.view.widgets.listBg:setVisible(false)
				else
					arg_24_0:getAddMoreList(var_0_9, arg_24_0.view.widgets.listBg)
				end

				arg_24_0.view.widgets.downBtn:setScale(-1 * var_26_0)
			end

			arg_24_0.view.widgets.seeMore:addHandleOfControlEvent(var_24_0, CCControlEventTouchDown)
			arg_24_0.view.widgets.downBtn:addHandleOfControlEvent(var_24_1, CCControlEventTouchDown)

			if user.isSelfKfRoad then
				arg_24_0.view.widgets.btn_invest1:setEnabled(true)
				arg_24_0.view.widgets.btn_invest2:setEnabled(true)
			else
				arg_24_0.view.widgets.btn_invest1:setEnabled(false)
				arg_24_0.view.widgets.btn_invest2:setEnabled(false)
			end
		end

		for iter_24_0 = 1, 2 do
			local var_24_2 = arg_24_0.view.widgets["bar" .. iter_24_0]

			var_24_2:setScaleX(0.3)
			var_24_2:setScaleY(0.5)
		end

		local var_24_3 = {
			134,
			0,
			-140,
			80,
			-60,
			180
		}

		for iter_24_1 = 1, 6 do
			if arg_24_0.view.widgets["arrow" .. iter_24_1] then
				arg_24_0.view.widgets["arrow" .. iter_24_1]:setRotation(var_24_3[iter_24_1])
			end
		end

		for iter_24_2 = 1, 2 do
			arg_24_0.view.widgets["bg_progress" .. iter_24_2]:setScaleX(0.58)
			arg_24_0.view.widgets["progress" .. iter_24_2]:setScaleX(0.58)
		end

		arg_24_0.view.widgets.btn_info:addHandleOfControlEvent(function()
			local var_27_0 = arg_24_0.view.widgets.bg_info:isVisible()

			arg_24_0.view.widgets.bg_info:setVisible(not var_27_0)
			arg_24_0.view.widgets.btn_info:setScaleY(var_27_0 and 1 or -1)
		end, CCControlEventTouchUpInside)
		arg_24_0.view.widgets.btn_ten:setHighlighted(var_0_7)
		arg_24_0.view.widgets.btn_ten:addHandleOfControlEvent(function()
			var_0_7 = not var_0_7

			arg_24_0.view.widgets.btn_ten:setHighlighted(var_0_7)

			if arg_24_0.info.freePhantomNum == 0 then
				local var_28_0 = var_0_7 and 10 or 1
				local var_28_1 = math.min(var_28_0, arg_24_0.info.phantomTotal - arg_24_0.info.phantomNum)

				arg_24_0.view.widgets.info2:setString(arg_24_0.info.phantomGold * var_28_1)
			end
		end, CCControlEventTouchUpInside)
		arg_24_0.view.widgets.btn_invest1:addHandleOfControlEvent(function()
			arg_24_0:onBtnTokenTap()
		end, CCControlEventTouchUpInside)
		arg_24_0.view.widgets.btn_invest2:addHandleOfControlEvent(function()
			arg_24_0:onBtnPhantomTap()
		end, CCControlEventTouchUpInside)
		arg_24_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
			arg_24_0:showTip(language.get(390479))
		end, CCControlEventTouchUpInside)
	elseif user.invastType == 2 then
		uiutil.initWidgets(arg_24_0.view, arg_24_0.layout_def)

		local var_24_4 = {
			134,
			0,
			-140,
			80,
			-60,
			180
		}

		for iter_24_3 = 1, 6 do
			arg_24_0.view.widgets["arrow" .. iter_24_3]:setRotation(var_24_4[iter_24_3])
			arg_24_0.view.widgets["arrow" .. iter_24_3]:setVisible(false)
		end

		arg_24_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
			arg_24_0:showTip(language.get(390483))
		end, CCControlEventTouchUpInside)
	end

	arg_24_0:addChild(arg_24_0.view.widgets.panel)

	if arg_24_1 then
		arg_24_1:addChild(arg_24_0)
	end

	arg_24_0.view.widgets.btn_close:setScale(2)
	arg_24_0.view.widgets.btn_close:addHandleOfControlEvent(function()
		arg_24_0:removeFromParentAndCleanup(true)
	end, CCControlEventTouchUpInside)

	if arg_24_2 then
		arg_24_0:showPanel(arg_24_2)
	else
		arg_24_0:refresh()
	end
end

function var_0_8.showTip(arg_34_0, arg_34_1)
	log.info("should show tips ")

	local var_34_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_34_0:registerScriptTouchHandler(function(arg_35_0, arg_35_1, arg_35_2)
		if arg_35_0 == CCTOUCHBEGAN then
			return true
		elseif arg_35_0 == CCTOUCHMOVED then
			return true
		elseif arg_35_0 == CCTOUCHENDED then
			pcall(var_34_0.removeFromParentAndCleanup, var_34_0, true)

			return true
		end
	end, false, true)
	var_34_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_34_0, 60000)

	local var_34_1 = 0
	local var_34_2 = 0
	local var_34_3 = {}

	uiutil.initWidgets(var_34_3, arg_34_0.tipFrame)
	var_34_0:addChild(var_34_3.widgets.tipFrame)
	var_34_3.widgets.tipMsg:setString(arg_34_1)

	local var_34_4, var_34_5 = tool.getPositionInScreen(arg_34_0.view.widgets.btn_tip)
	local var_34_6 = var_34_4 + 20
	local var_34_7 = var_34_5 - 20
	local var_34_8 = var_34_3.widgets.tipMsg:getContentSize().width
	local var_34_9 = var_34_3.widgets.tipMsg:getContentSize().height

	var_34_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_34_8 + 30, var_34_9 + 30))
	var_34_3.widgets.tipFrame:setPosition(ccp(var_34_6, var_34_7))
	var_34_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_34_3.widgets.tipFrame:setVisible(true)
end

function var_0_8.onExit(arg_36_0)
	var_0_9 = nil
end

function var_0_8.refineAttLayout(arg_37_0)
	for iter_37_0 = 0, 3 do
		arg_37_0.view.widgets["mine" .. iter_37_0]:setAnchorPoint(ccp(0, 0.5))
		arg_37_0.view.widgets["mine" .. iter_37_0]:setPositionX(arg_37_0.view.widgets["attFrd" .. iter_37_0]:getPositionX() + arg_37_0.view.widgets["attFrd" .. iter_37_0]:getContentSize().width / 2 * arg_37_0.view.widgets["attFrd" .. iter_37_0]:getScale())
	end
end

function var_0_8.refineDefLayout(arg_38_0)
	for iter_38_0 = 0, 3 do
		arg_38_0.view.widgets["mine" .. iter_38_0]:setAnchorPoint(ccp(0, 0.5))
		arg_38_0.view.widgets["mine" .. iter_38_0]:setPositionX(arg_38_0.view.widgets["defFrd" .. iter_38_0]:getPositionX() + arg_38_0.view.widgets["defFrd" .. iter_38_0]:getContentSize().width / 2 * arg_38_0.view.widgets["defFrd" .. iter_38_0]:getScale())
	end
end

return var_0_8
