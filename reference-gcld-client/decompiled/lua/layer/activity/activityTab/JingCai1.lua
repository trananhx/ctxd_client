require("lua/layer/equipment/storeHouse/collectionView")

local var_0_0 = colorQuality[5]
local var_0_1 = false
local var_0_2 = false
local var_0_3 = {
	rank = false,
	quiz = true,
	history = false
}
local var_0_4 = {
	pressingState = 0,
	currentBettedNum = 0,
	maxBetsNum = 0,
	currentBettingNum = 0,
	selectId = 1,
	quizData = {},
	historyData = {},
	rankData = {}
}
local var_0_5 = class("JingCai", function()
	return createBaseLayer()
end)

var_0_5.layout = {
	xcenter = 0,
	name = "panel",
	type = "node",
	pic = {
		frame = false,
		path = ""
	},
	xcenter = visibleSize.width * 0.5,
	ycenter = visibleSize.height * 0.5 - 30,
	children = {
		{
			name = "tabButton3",
			z = -1,
			h = 56,
			type = "button",
			w = 134,
			y = 600,
			normal = {
				frame = true,
				path = "labelButton_noraml.png"
			},
			touched = {
				frame = true,
				path = "labelButon_light.png"
			},
			selected = {
				frame = true,
				path = "labelButon_light.png"
			},
			x = 370 + (visibleSize.width - 960) * 0.5,
			children = {
				{
					name = "tabButton3label",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 60,
					text = language.get("156020_ayjc")
				}
			}
		},
		{
			name = "tabButton2",
			z = -1,
			h = 56,
			type = "button",
			w = 134,
			y = 600,
			normal = {
				frame = true,
				path = "labelButton_noraml.png"
			},
			touched = {
				frame = true,
				path = "labelButon_light.png"
			},
			selected = {
				frame = true,
				path = "labelButon_light.png"
			},
			x = 240 + (visibleSize.width - 960) * 0.5,
			children = {
				{
					name = "tabButton2label",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 60,
					text = language.get("156019_ayjc")
				}
			}
		},
		{
			name = "tabButton1",
			h = 56,
			type = "button",
			w = 134,
			y = 600,
			normal = {
				frame = true,
				path = "labelButton_noraml.png"
			},
			touched = {
				frame = true,
				path = "labelButon_light.png"
			},
			selected = {
				frame = true,
				path = "labelButon_light.png"
			},
			x = 110 + (visibleSize.width - 960) * 0.5,
			children = {
				{
					name = "tabButton1label",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 60,
					text = language.get("156018_ayjc")
				}
			}
		},
		{
			name = "closeButton",
			h = 33,
			type = "button",
			w = 32,
			y = 600,
			scale = 2,
			normal = {
				frame = true,
				path = "btn_close_a.png"
			},
			touched = {
				frame = true,
				path = "btn_close_c.png"
			},
			x = 920 + (visibleSize.width - 960) * 0.5
		},
		{
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
					x = 480,
					name = "quiz",
					y = 290,
					type = "sprite",
					visible = true,
					pic = {
						frame = false,
						path = "res/ui/activity/jingcai/zqjc_bg_wxz.png"
					},
					children = {
						{
							fontSize = 20,
							name = "leftTimeLabel",
							scale = 1,
							type = "label",
							style = "label_warlock",
							y = 500,
							x = 830,
							anchorPoint = ccp(1, 0.5),
							color = color_white,
							text = language.get("166001_jc")
						},
						{
							fontSize = 20,
							name = "leftTime",
							scale = 1,
							type = "label",
							style = "label_warlock",
							y = 500,
							x = 830,
							anchorPoint = ccp(0, 0.5),
							color = var_0_0
						},
						{
							x = 480,
							name = "title_text",
							y = 520,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/jingcai/zqjc_title.png"
							}
						},
						{
							style = "button_tip",
							name = "btn_tip",
							y = 515,
							type = "button",
							x = 620
						},
						{
							y = 0,
							name = "flaglist",
							visible = false,
							type = "node",
							x = 0,
							children = {
								{
									x = 100,
									name = "btn_left",
									h = 89,
									type = "button",
									w = 60,
									visible = true,
									y = 335,
									scale = -1,
									normal = {
										frame = false,
										path = "res/ui/nationTask/thunder/lxgs_btn.png"
									},
									touched = {
										frame = false,
										path = "res/ui/nationTask/thunder/lxgs_btn_c.png"
									}
								},
								{
									visible = true,
									name = "btn_right",
									h = 89,
									type = "button",
									w = 60,
									y = 335,
									x = 865,
									normal = {
										frame = false,
										path = "res/ui/nationTask/thunder/lxgs_btn.png"
									},
									touched = {
										frame = false,
										path = "res/ui/nationTask/thunder/lxgs_btn_c.png"
									}
								},
								{
									width = 760,
									height = 76,
									name = "quiz_text",
									type = "label",
									y = 440,
									x = 480,
									text = language.get("156016_ayjc"),
									color = colorText.GC_INTER_DATI1,
									halign = kCCTextAlignmentCenter,
									valign = kCCVerticalTextAlignmentCenter
								},
								{
									x = 490,
									name = "zqjc_vs",
									y = 350,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_vs.png"
									}
								},
								{
									x = 245,
									name = "flag_left",
									y = 340,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/flag_icon/1.png"
									}
								},
								{
									x = 245,
									name = "nation_left",
									y = 275,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_gjmz_jbd.png"
									},
									children = {
										{
											fontSize = 24,
											name = "nation_left_label",
											scale = 1,
											type = "label",
											text = "",
											style = "label_warlock",
											y = 14,
											x = 94,
											anchorPoint = ccp(0.5, 0.5),
											color = colorText.TJ_White
										}
									}
								},
								{
									x = 730,
									name = "flag_right",
									y = 340,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/flag_icon/2.png"
									}
								},
								{
									x = 730,
									name = "nation_right",
									y = 275,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_gjmz_jbd.png"
									},
									children = {
										{
											fontSize = 24,
											name = "nation_right_label",
											scale = 1,
											type = "label",
											text = "",
											style = "label_warlock",
											y = 14,
											x = 94,
											anchorPoint = ccp(0.5, 0.5),
											color = colorText.TJ_White
										}
									}
								},
								{
									name = "btn_other",
									h = 54,
									type = "button",
									w = 224,
									visible = true,
									y = 265,
									x = 490,
									normal = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_1.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_2.png"
									},
									children = {
										{
											fontSize = 24,
											scale = 1,
											type = "label",
											style = "label_warlock",
											y = 27,
											x = 112,
											text = language.get("166002_jc"),
											anchorPoint = ccp(0.5, 0.5),
											color = colorText.TJ_White
										}
									}
								},
								{
									name = "btn_win",
									h = 54,
									type = "button",
									w = 224,
									visible = true,
									y = 210,
									x = 245,
									normal = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_1.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_2.png"
									},
									children = {
										{
											fontSize = 24,
											scale = 1,
											type = "label",
											style = "label_warlock",
											y = 28,
											x = 20,
											text = language.get("166003_jc"),
											anchorPoint = ccp(0, 0.5),
											color = colorText.TJ_White
										},
										{
											fontSize = 24,
											name = "btn_win_label",
											scale = 1,
											type = "label",
											text = "3.6",
											style = "label_warlock",
											y = 28,
											x = 180,
											anchorPoint = ccp(1, 0.5),
											color = colorText.TJ_White
										},
										{
											x = 197,
											name = "win_flag",
											y = 28,
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/jingcai/zqjc_icon_dmz.png"
											}
										}
									}
								},
								{
									name = "btn_lose",
									h = 54,
									type = "button",
									w = 224,
									visible = true,
									y = 210,
									x = 735,
									normal = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_1.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_2.png"
									},
									children = {
										{
											fontSize = 24,
											scale = 1,
											type = "label",
											style = "label_warlock",
											y = 28,
											x = 20,
											text = language.get("166003_jc"),
											anchorPoint = ccp(0, 0.5),
											color = colorText.TJ_White
										},
										{
											fontSize = 24,
											name = "btn_lose_label",
											scale = 1,
											type = "label",
											text = "3.6",
											style = "label_warlock",
											y = 28,
											x = 180,
											anchorPoint = ccp(1, 0.5),
											color = colorText.TJ_White
										},
										{
											x = 197,
											name = "lose_flag",
											y = 28,
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/jingcai/zqjc_icon_dmz.png"
											}
										}
									}
								},
								{
									name = "btn_equal",
									h = 54,
									type = "button",
									w = 224,
									visible = true,
									y = 210,
									x = 490,
									normal = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_1.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_2.png"
									},
									children = {
										{
											fontSize = 24,
											scale = 1,
											type = "label",
											style = "label_warlock",
											y = 28,
											x = 20,
											text = language.get("166004_jc"),
											anchorPoint = ccp(0, 0.5),
											color = colorText.TJ_White
										},
										{
											fontSize = 24,
											name = "btn_equal_label",
											scale = 1,
											type = "label",
											text = "3.6",
											style = "label_warlock",
											y = 28,
											x = 180,
											anchorPoint = ccp(1, 0.5),
											color = colorText.TJ_White
										},
										{
											x = 197,
											name = "equal_flag",
											y = 28,
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/jingcai/zqjc_icon_dmz.png"
											}
										}
									}
								},
								{
									y = 450,
									name = "dot",
									visible = true,
									type = "node",
									x = 910
								}
							}
						},
						{
							width = 960,
							height = 157,
							name = "quizlist",
							type = "layerColor",
							y = 0,
							zorder = 300,
							visible = false,
							x = 0,
							color = ccc4(0, 0, 0, 1),
							children = {
								{
									x = 487,
									name = "quizbg",
									y = 78,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_bg_xz.png"
									}
								},
								{
									fontSize = 20,
									scale = 1,
									type = "label",
									style = "label_warlock",
									y = 80,
									x = 300,
									text = language.get("166008_jc"),
									anchorPoint = ccp(1, 0.5),
									color = colorText.TJ_White
								},
								{
									x = 335,
									name = "jiantou",
									y = 80,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_jiantou.png"
									}
								},
								{
									fontSize = 20,
									scale = 1,
									type = "label",
									style = "label_warlock",
									y = 120,
									x = 440,
									text = language.get("166010_jc"),
									anchorPoint = ccp(1, 0.5),
									color = colorText.TJ_Yellow
								},
								{
									y = 120,
									x = 460,
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_7.png"
									}
								},
								{
									fontSize = 20,
									name = "gem_own",
									scale = 1,
									type = "label",
									text = "0",
									style = "label_warlock",
									y = 120,
									x = 480,
									anchorPoint = ccp(0, 0.5),
									color = colorText.TJ_Green
								},
								{
									fontSize = 20,
									scale = 1,
									type = "label",
									style = "label_warlock",
									y = 120,
									x = 800,
									text = language.get("166011_jc"),
									anchorPoint = ccp(1, 0.5),
									color = colorText.TJ_Yellow
								},
								{
									y = 120,
									x = 820,
									scale = 0.7,
									type = "sprite",
									pic = {
										frame = true,
										path = "res_icon_7.png"
									}
								},
								{
									fontSize = 20,
									name = "gem_down",
									scale = 1,
									type = "label",
									text = "0",
									style = "label_warlock",
									y = 120,
									x = 840,
									anchorPoint = ccp(0, 0.5),
									color = colorText.TJ_Green
								},
								{
									name = "confirm",
									h = 59,
									type = "button",
									w = 182,
									visible = true,
									y = 75,
									x = 800,
									normal = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_lv_1.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_lv_2.png"
									},
									children = {
										{
											x = 91,
											y = 34,
											type = "sprite",
											pic = {
												frame = false,
												path = "res/ui/activity/jingcai/zqjc_btn_msz_qd.png"
											}
										}
									}
								},
								{
									y = 25,
									name = "description",
									anchorX = 0,
									type = "richLabel",
									x = 50,
									anchorPoint = ccp(0, 0.5)
								}
							}
						},
						{
							y = 0,
							name = "selectlist",
							visible = true,
							type = "node",
							x = 0,
							children = {
								{
									x = 487,
									y = 325,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_bg_jgx.png"
									}
								},
								{
									visible = true,
									name = "back",
									h = 55,
									type = "button",
									w = 117,
									y = 530,
									x = 70,
									normal = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_fh_1.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/jingcai/zqjc_btn_fh_2.png"
									}
								},
								{
									x = 110,
									name = "selectFlag1",
									y = 450,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/circle_icon/1.png"
									}
								},
								{
									y = 450,
									fontSize = 24,
									type = "label",
									x = 150,
									text = language.get("166003_jc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.GC_INTER_DATI1
								},
								{
									y = 450,
									fontSize = 24,
									type = "label",
									x = 250,
									text = language.get("166006_jc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.GC_INTER_DATI1
								},
								{
									y = 450,
									fontSize = 24,
									type = "label",
									x = 420,
									text = language.get("166004_jc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.GC_INTER_DATI1
								},
								{
									y = 450,
									fontSize = 24,
									type = "label",
									x = 520,
									text = language.get("166006_jc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.GC_INTER_DATI1
								},
								{
									x = 670,
									name = "selectFlag2",
									y = 450,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/jingcai/circle_icon/1.png"
									}
								},
								{
									y = 450,
									fontSize = 24,
									type = "label",
									x = 710,
									text = language.get("166003_jc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.GC_INTER_DATI1
								},
								{
									y = 450,
									fontSize = 24,
									type = "label",
									x = 810,
									text = language.get("166006_jc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.GC_INTER_DATI1
								}
							}
						}
					}
				}
			}
		},
		{
			name = "history",
			type = "sprite",
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/mrjc_bg_3.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 38,
			children = {
				{
					x = 70,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_sj.png"
					}
				},
				{
					x = 120,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 220,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_gj.png"
					}
				},
				{
					x = 320,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 450,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_qk.png"
					}
				},
				{
					x = 550,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 610,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_pl.png"
					}
				},
				{
					x = 660,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 740,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_tz.png"
					}
				},
				{
					x = 800,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 860,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_jg.png"
					}
				},
				{
					name = "historyList",
					type = "TableView",
					y = 10,
					x = 10,
					viewSize = CCSizeMake(905, 420),
					dirction = kCCScrollViewDirectionVertical,
					verticalFill = kCCTableViewFillTopDown
				}
			}
		},
		{
			name = "rank",
			type = "sprite",
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/mrjc_bg_3.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 38,
			children = {
				{
					x = 80,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_mc.png"
					}
				},
				{
					x = 150,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 270,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_gj.png"
					}
				},
				{
					x = 380,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 480,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_wjm.png"
					}
				},
				{
					x = 580,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 720,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_ljhdbs.png"
					}
				},
				{
					name = "rankList",
					type = "TableView",
					y = 10,
					x = 10,
					viewSize = CCSizeMake(905, 420),
					dirction = kCCScrollViewDirectionVertical,
					verticalFill = kCCTableViewFillTopDown
				}
			}
		}
	}
}

function var_0_5.getJingCaiInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.quizList = arg_3_0.action.data.quizList

		if #arg_2_0.quizList == 0 then
			arg_2_0.view.widgets.tabButton3:setPosition(arg_2_0.view.widgets.tabButton2:getPosition())
			arg_2_0.view.widgets.tabButton2:setPosition(arg_2_0.view.widgets.tabButton1:getPosition())
			arg_2_0.view.widgets.tabButton1:setVisible(false)
			arg_2_0:tabOnTouch("history")

			return
		end

		local var_3_0 = arg_2_0.quizList[arg_2_0.selectedPage]

		if tonumber(var_3_0.endCD) > 0 then
			arg_2_0.view.widgets.quiz:setVisible(true)
			arg_2_0:updateQuiz(var_3_0)
		else
			arg_2_0.view.widgets.tabButton3:setPosition(arg_2_0.view.widgets.tabButton2:getPosition())
			arg_2_0.view.widgets.tabButton2:setPosition(arg_2_0.view.widgets.tabButton1:getPosition())
			arg_2_0.view.widgets.tabButton1:setVisible(false)
			arg_2_0:tabOnTouch("history")
		end
	end

	cmgr.sendRequest(var_2_0, actions.getQuizInfo)
end

function var_0_5.getJinCaiHistoryInfo(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		var_0_4.historyData = var_5_0

		while #var_0_4.historyData.history < 5 do
			table.insert(var_0_4.historyData.history, {})
		end

		arg_4_0:updateHistory(var_5_0)
	end

	cmgr.sendRequest(var_4_0, actions.getQuizHistory)
end

function var_0_5.getJinCaiRankInfo(arg_6_0)
	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		var_0_4.rankData = var_7_0

		while #var_0_4.rankData.ranks < 8 do
			table.insert(var_0_4.rankData.ranks, {})
		end

		arg_6_0:updateRank(var_7_0)
	end

	cmgr.sendRequest(var_6_0, actions.getQuizRank)
end

function var_0_5.showPanel(arg_8_0, arg_8_1)
	arg_8_0.info = arg_8_1
end

function var_0_5.showTip(arg_9_0)
	local var_9_0 = require("lua/component/TipPanel")
	local var_9_1 = {
		fontSize = 22,
		height = 240,
		name = "IntroPanel",
		type = "label",
		x = 460,
		y = 95,
		width = 880,
		text = language.get("166012_jc"),
		anchor = ccp(0.5, 0.5),
		halign = kCCTextAlignmentLeft
	}

	if conf.language == "vie" then
		var_9_1.y = 130
	elseif conf.language == "tha" then
		var_9_1.y = 130
	end

	var_9_0:createWithStyleConf(arg_9_0, var_9_1)
	var_9_0:setPosition(ccp(910 + (visibleSize.width - 960) * 0.5, 500))
end

function var_0_5.createHistoryList(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0, arg_11_1)
		log.info("cell touched at : ", arg_11_1:getIdx())
	end

	local function var_10_1(arg_12_0, arg_12_1)
		return 70, 905
	end

	local function var_10_2(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_0:dequeueCell()

		if var_13_0 then
			var_13_0:removeAllChildrenWithCleanup(true)
		else
			var_13_0 = CCTableViewCell:new()
		end

		arg_13_1 = arg_13_1 + 1

		if arg_13_1 % 2 == 0 then
			local var_13_1 = CCLayerColor:create(ccc4(0, 0, 0, 51))

			log.info(var_13_0:getContentSize().width)
			log.info(var_13_0:getContentSize().height)
			var_13_1:setContentSize(CCSize(905, 70))
			var_13_0:addChild(var_13_1)
		end

		if var_0_4.historyData.history[arg_13_1].time == nil then
			return var_13_0
		end

		local var_13_2 = var_0_4.historyData.history[arg_13_1].time
		local var_13_3 = os.date("%m-%d", var_13_2 / 1000)
		local var_13_4 = CCLabelTTF:create(var_13_3, "Thonburi", 22)

		var_13_4:setContentSize(CCSize(160, 30))
		var_13_4:setPosition(ccp(110, 40))
		var_13_0:addChild(var_13_4)

		local var_13_5 = arg_10_0:getQuizType(var_0_4.historyData.history[arg_13_1])
		local var_13_6 = 0

		if var_13_5 == "zq" then
			local var_13_7 = string.split(var_0_4.historyData.history[arg_13_1].content, ":")[1]
			local var_13_8 = string.split(var_0_4.historyData.history[arg_13_1].content, ":")[2]
			local var_13_9 = var_0_4.historyData.history[arg_13_1].score
			local var_13_10 = string.split(var_0_4.historyData.history[arg_13_1].score, ":")[1]
			local var_13_11 = string.split(var_0_4.historyData.history[arg_13_1].score, ":")[2]

			if var_13_7 == "0" or var_13_8 == "0" then
				local var_13_12 = CCLabelTTF:create(language.get("156021_ayjc"), "Thonburi", 22)

				var_13_12:setColor(ccc3(255, 255, 255))
				var_13_12:setPosition(ccp(202, 36))
				arg_10_0.view.widgets["quizOption" .. arg_13_1]:addChild(var_13_12)
			else
				local var_13_13 = CCSprite:create("res/ui/activity/jingcai/circle_icon/" .. var_13_7 .. ".png")

				var_13_13:setPosition(ccp(158, 36))

				local var_13_14 = CCSprite:create("res/ui/activity/jingcai/circle_icon/" .. var_13_8 .. ".png")

				var_13_14:setPosition(ccp(258, 36))

				local var_13_15 = CCSprite:create("res/ui/common/text/activity/quizActivity/mrjc_meishuzi_vs.png")

				var_13_15:setPosition(ccp(210, 36))
				var_13_15:setScale(0.7)
				var_13_0:addChild(var_13_13)
				var_13_0:addChild(var_13_14)
				var_13_0:addChild(var_13_15)
			end

			local var_13_16 = CCLabelTTF:create(var_13_9, "Thonburi", 22)

			var_13_16:setPosition(ccp(500, 36))

			local var_13_17 = CCLabelTTF:create(language.get("166003_jc"), "Thonburi", 22)

			var_13_17:setPosition(ccp(440, 36))

			if tonumber(var_13_10) > tonumber(var_13_11) then
				var_13_6 = var_13_7
			elseif tonumber(var_13_10) < tonumber(var_13_11) then
				var_13_6 = var_13_8
			else
				var_13_6 = 0

				var_13_17:setString(language.get("166004_jc"))
			end

			if tonumber(var_13_10) < 0 or tonumber(var_13_11) < 0 then
				var_13_17:setString(language.get("166003_jc"))
				var_13_16:setString("")

				if tonumber(var_13_10) == -2 and tonumber(var_13_11) == -2 then
					var_13_6 = var_13_7
				elseif tonumber(var_13_10) == -3 and tonumber(var_13_11) == -3 then
					var_13_6 = var_13_8
				elseif tonumber(var_13_10) == -4 and tonumber(var_13_11) == -4 then
					var_13_17:setString(language.get("166004_jc"))
				elseif tonumber(var_13_10) == -5 and tonumber(var_13_11) == -5 then
					var_13_16:setString(language.get("156021_ayjc"))

					var_13_6 = var_13_7
				elseif tonumber(var_13_10) == -6 and tonumber(var_13_11) == -6 then
					var_13_16:setString(language.get("156021_ayjc"))

					var_13_6 = var_13_8
				elseif tonumber(var_13_10) == -7 and tonumber(var_13_11) == -7 then
					var_13_17:setString(language.get("166004_jc"))
					var_13_16:setString(language.get("156021_ayjc"))
				end
			end

			var_13_0:addChild(var_13_17)
			var_13_0:addChild(var_13_16)
		end

		local var_13_18 = CCSprite:create("res/ui/activity/jingcai/circle_icon/" .. var_13_6 .. ".png")

		var_13_18:setPosition(ccp(370, 36))
		var_13_0:addChild(var_13_18)

		local var_13_19 = var_0_4.historyData.history[arg_13_1].odds
		local var_13_20 = CCLabelTTF:create(var_13_19, "Thonburi", 22)

		var_13_20:setPosition(ccp(600, 36))
		var_13_0:addChild(var_13_20)

		local var_13_21 = var_0_4.historyData.history[arg_13_1].betNum
		local var_13_22 = CCLabelTTF:create(var_13_21, "Thonburi", 22)

		var_13_22:setPosition(ccp(730, 36))
		var_13_0:addChild(var_13_22)

		local var_13_23 = var_0_4.historyData.history[arg_13_1].result
		local var_13_24 = language.get("156025_ayjc")
		local var_13_25 = CCLabelTTF:create(var_13_24, "Thonburi", 22)

		if var_13_23 == 0 then
			var_13_24 = language.get("156025_ayjc")

			var_13_25:setColor(colorText.TJ_White)
		elseif var_13_23 == 1 then
			var_13_24 = language.get("156026_ayjc")

			var_13_25:setColor(colorText.TJ_Green)
		elseif var_13_23 == 2 then
			var_13_24 = language.get("156027_ayjc")

			var_13_25:setColor(colorText.TJ_Red)
		end

		var_13_25:setString(var_13_24)
		var_13_25:setPosition(ccp(845, 36))
		var_13_0:addChild(var_13_25)

		return var_13_0
	end

	local function var_10_3()
		local var_14_0 = var_0_4.historyData.history

		if var_14_0 and #var_14_0 > 0 then
			return math.ceil(#var_14_0)
		else
			return 0
		end
	end

	arg_10_0.view.widgets.historyList:registerScriptHandler(var_10_0, CCTableView.kTableCellTouched)
	arg_10_0.view.widgets.historyList:registerScriptHandler(var_10_1, CCTableView.kTableCellSizeForIndex)
	arg_10_0.view.widgets.historyList:registerScriptHandler(var_10_2, CCTableView.kTableCellSizeAtIndex)
	arg_10_0.view.widgets.historyList:registerScriptHandler(var_10_3, CCTableView.kNumberOfCellsInTableView)
	arg_10_0.view.widgets.historyList:reloadData()

	if #var_0_4.historyData.history <= 6 then
		arg_10_0.view.widgets.historyList:setTouchEnabled(false)
	else
		arg_10_0.view.widgets.historyList:setTouchEnabled(true)
	end
end

function var_0_5.createSelectLayer(arg_15_0, arg_15_1)
	local var_15_0 = 284
	local var_15_1 = 58
	local var_15_2 = 3

	return (SHCollectionView.createCollectionLayer(var_15_0, var_15_1, var_15_2, arg_15_0:createSelectCells(arg_15_1)))
end

function var_0_5.createSelectCells(arg_16_0, arg_16_1)
	log.info("****************")

	if #arg_16_1 < 1 then
		return
	end

	log.info(#arg_16_1)

	local var_16_0 = {}
	local var_16_1 = {}
	local var_16_2 = {
		arg_16_1[#arg_16_1]
	}

	var_16_1[1] = arg_16_1[#arg_16_1 - 1]
	var_16_0[1] = arg_16_1[#arg_16_1 - 2]

	for iter_16_0 = 1, #arg_16_1 - 3 do
		local var_16_3 = arg_16_1[iter_16_0]

		if var_16_3.type == 1 then
			var_16_0[#var_16_0 + 1] = var_16_3
		elseif var_16_3.type == 2 then
			var_16_1[#var_16_1 + 1] = var_16_3
		elseif var_16_3.type == 3 then
			var_16_2[#var_16_2 + 1] = var_16_3
		end
	end

	local var_16_4 = #var_16_0 * 3

	if #var_16_1 > #var_16_0 and #var_16_1 > #var_16_2 then
		var_16_4 = #var_16_1 * 3
	end

	if #var_16_2 > #var_16_0 and #var_16_2 > #var_16_1 then
		var_16_4 = #var_16_2 * 3
	end

	local var_16_5 = {}

	for iter_16_1 = 1, var_16_4 do
		local var_16_6

		if iter_16_1 % 3 == 1 then
			var_16_6 = var_16_0[(iter_16_1 + 2) / 3]
		elseif iter_16_1 % 3 == 2 then
			var_16_6 = var_16_2[(iter_16_1 + 1) / 3]
		elseif iter_16_1 % 3 == 0 then
			var_16_6 = var_16_1[iter_16_1 / 3]
		end

		if var_16_6 == nil then
			var_16_5[iter_16_1] = CCSprite:create()
		else
			local var_16_7 = CCScale9Sprite:create("res/ui/activity/jingcai/zqjc_btn_1.png")
			local var_16_8 = CCControlButton:create(var_16_7)

			var_16_8:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/activity/jingcai/zqjc_btn_2.png"), CCControlStateHighlighted)
			var_16_8:setPreferredSize(CCSizeMake(224, 54))
			var_16_8:setPosition(30, 0)
			var_16_8:setVisible(true)
			var_16_8:addHandleOfControlEvent(function()
				local var_17_0 = var_16_8:convertToWorldSpace(ccp(0, 0))

				if var_17_0.y + 25 < 174 or var_17_0.y - 25 > 427 then
					log.info("****************")
				else
					log.info("btn_num" .. var_16_6.id)
					arg_16_0:showMainQuiz(var_16_6, 4)
				end
			end, CCControlEventTouchUpInside)

			local var_16_9 = CCStrokeLabelTTF:create(language.get("166007_jc"), "Thonburi-Bold", 24, 1, ccc3(13, 13, 13))

			var_16_9:setPosition(ccp(20, 25))
			var_16_9:setAnchorPoint(ccp(0, 0.5))
			var_16_8:addChild(var_16_9)

			if var_16_6.score == nil then
				var_16_9:setString(language.get("166014_jc"))

				var_16_6.score = ""
			end

			local var_16_10 = CCStrokeLabelTTF:create(var_16_6.score, "Thonburi-Bold", 24, 1, ccc3(13, 13, 13))

			var_16_10:setPosition(ccp(var_16_9:getPositionX() + 30 + var_16_9:getContentSize().width, 25))
			var_16_8:addChild(var_16_10)

			local var_16_11 = CCStrokeLabelTTF:create(var_16_6.odds, "Thonburi-Bold", 24, 1, ccc3(13, 13, 13))

			var_16_11:setPosition(ccp(180, 25))
			var_16_11:setAnchorPoint(ccp(1, 0.5))
			var_16_8:addChild(var_16_11)

			if var_16_6.betNum > 0 then
				local var_16_12 = CCSprite:create("res/ui/activity/jingcai/zqjc_icon_dmz.png")

				var_16_12:setPosition(ccp(197, 27))
				var_16_8:addChild(var_16_12)
			end

			var_16_5[iter_16_1] = var_16_8
		end
	end

	return var_16_5
end

function var_0_5.updateScrollView(arg_18_0, arg_18_1)
	if arg_18_0.scrollView then
		pcall(arg_18_0.scrollView.removeFromParentAndCleanup, arg_18_0.scrollView, true)
	end

	local var_18_0 = CCSizeMake(875, 253)

	arg_18_0.scrollView = CCScrollView:create(var_18_0)

	arg_18_0.scrollView:removeAllChildrenWithCleanup(true)

	arg_18_0.collectionViewLayer = arg_18_0:createSelectLayer(arg_18_1)

	local var_18_1 = arg_18_0.collectionViewLayer:getContentSize()

	arg_18_0.scrollView:setContainer(arg_18_0.collectionViewLayer)
	arg_18_0.scrollView:setDirection(kCCScrollViewDirectionVertical)
	arg_18_0.view.widgets.selectlist:addChild(arg_18_0.scrollView)
	arg_18_0.scrollView:setContentSize(var_18_1)
	arg_18_0.scrollView:setAnchorPoint(ccp(0, 0))
	arg_18_0.scrollView:setPosition(ccp(50, 174))
	arg_18_0.scrollView:setContentOffset(ccp(0, arg_18_0.scrollView:getViewSize().height - var_18_1.height))
	log.info("scorllview up to date")
end

function var_0_5.createRankList(arg_19_0, arg_19_1)
	local function var_19_0(arg_20_0, arg_20_1)
		log.info("cell touched at : ", arg_20_1:getIdx())
	end

	local function var_19_1(arg_21_0, arg_21_1)
		return 70, 875
	end

	local function var_19_2(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0:dequeueCell()

		if var_22_0 then
			var_22_0:removeAllChildrenWithCleanup(true)
		else
			var_22_0 = CCTableViewCell:new()
		end

		arg_22_1 = arg_22_1 + 1

		if arg_22_1 % 2 == 0 then
			local var_22_1 = CCLayerColor:create(ccc4(0, 0, 0, 51))

			log.info(var_22_0:getContentSize().width)
			log.info(var_22_0:getContentSize().height)
			var_22_1:setContentSize(CCSize(905, 50))
			var_22_0:addChild(var_22_1)
		end

		local var_22_2 = var_0_4.rankData.ranks[arg_22_1].rank

		if var_22_2 == nil then
			return var_22_0
		end

		if var_22_2 == 1 then
			local var_22_3 = CCSprite:create("res/ui/common/text/activity/quizActivity/mrjc_meishuzi_guanjun.png")

			var_22_3:setPosition(ccp(70, 25))
			var_22_0:addChild(var_22_3)
		else
			local var_22_4 = CCLabelTTF:create(var_22_2, "Thonburi", 24)

			var_22_4:setContentSize(CCSize(160, 30))
			var_22_4:setPosition(ccp(140, 25))
			var_22_0:addChild(var_22_4)
		end

		local var_22_5 = var_0_4.rankData.ranks[arg_22_1].force
		local var_22_6 = "res/ui/common/text/activity/quizActivity/"

		if var_22_5 == 1 then
			var_22_6 = var_22_6 .. "kfsy_pmwei" .. ".png"
		elseif var_22_5 == 2 then
			var_22_6 = var_22_6 .. "kfsy_pmshu" .. ".png"
		elseif var_22_5 == 3 then
			var_22_6 = var_22_6 .. "kfsy_pmwu" .. ".png"
		end

		local var_22_7 = CCSprite:create(var_22_6)

		var_22_7:setPosition(ccp(260, 25))
		var_22_0:addChild(var_22_7)

		local var_22_8 = var_0_4.rankData.ranks[arg_22_1].name
		local var_22_9 = CCLabelTTF:create(var_22_8, "Thonburi", 24)

		var_22_9:setPosition(ccp(470, 20))
		var_22_0:addChild(var_22_9)

		local var_22_10 = var_0_4.rankData.ranks[arg_22_1].rewardNum
		local var_22_11 = CCLabelTTF:create(var_22_10, "Thonburi", 24)

		var_22_11:setPosition(ccp(730, 20))
		var_22_0:addChild(var_22_11)

		return var_22_0
	end

	local function var_19_3()
		local var_23_0 = var_0_4.rankData.ranks

		if var_23_0 and #var_23_0 > 0 then
			return math.ceil(#var_23_0)
		else
			return 0
		end
	end

	arg_19_0.view.widgets.rankList:registerScriptHandler(var_19_0, CCTableView.kTableCellTouched)
	arg_19_0.view.widgets.rankList:registerScriptHandler(var_19_1, CCTableView.kTableCellSizeForIndex)
	arg_19_0.view.widgets.rankList:registerScriptHandler(var_19_2, CCTableView.kTableCellSizeAtIndex)
	arg_19_0.view.widgets.rankList:registerScriptHandler(var_19_3, CCTableView.kNumberOfCellsInTableView)
	arg_19_0.view.widgets.rankList:reloadData()

	if #var_0_4.rankData.ranks <= 8 then
		arg_19_0.view.widgets.rankList:setTouchEnabled(false)
	else
		arg_19_0.view.widgets.rankList:setTouchEnabled(true)
	end
end

function var_0_5.tabOnTouch(arg_24_0, arg_24_1)
	(function()
		var_0_3.quiz = false
		var_0_3.history = false
		var_0_3.rank = false

		arg_24_0.view.widgets.quiz:setVisible(false)
		arg_24_0.view.widgets.history:setVisible(false)
		arg_24_0.view.widgets.rank:setVisible(false)
		arg_24_0.view.widgets.tabButton1label:setColor(colorText[10001])
		arg_24_0.view.widgets.tabButton1label:setScale(1)
		arg_24_0.view.widgets.tabButton2label:setColor(colorText[10001])
		arg_24_0.view.widgets.tabButton2label:setScale(1)
		arg_24_0.view.widgets.tabButton3label:setColor(colorText[10001])
		arg_24_0.view.widgets.tabButton3label:setScale(1)
		arg_24_0.view.widgets.tabButton1:setHighlighted(false)
		arg_24_0.view.widgets.tabButton2:setHighlighted(false)
		arg_24_0.view.widgets.tabButton3:setHighlighted(false)
	end)()

	if arg_24_1 == "quiz" then
		var_0_3.quiz = true

		arg_24_0.view.widgets.quiz:setVisible(true)
		arg_24_0.view.widgets.tabButton1label:setColor(colorText[10003])
		arg_24_0.view.widgets.tabButton1:setHighlighted(true)
		arg_24_0:getJingCaiInfo()
	elseif arg_24_1 == "history" then
		var_0_3.history = true

		arg_24_0.view.widgets.history:setVisible(true)
		arg_24_0.view.widgets.tabButton2label:setColor(colorText[10003])
		arg_24_0.view.widgets.tabButton2:setHighlighted(true)
		arg_24_0:getJinCaiHistoryInfo()
	elseif arg_24_1 == "rank" then
		var_0_3.rank = true

		arg_24_0.view.widgets.rank:setVisible(true)
		arg_24_0.view.widgets.tabButton3label:setColor(colorText[10003])
		arg_24_0.view.widgets.tabButton3:setHighlighted(true)
		arg_24_0:getJinCaiRankInfo()
	end
end

function var_0_5.backView(arg_26_0)
	var_0_2 = false

	arg_26_0:getJingCaiInfo()
end

function var_0_5.goSelectList(arg_27_0)
	var_0_2 = true

	arg_27_0.view.widgets.flaglist:setVisible(false)
	arg_27_0.view.widgets.selectlist:setVisible(true)
	arg_27_0.view.widgets.quizlist:setVisible(false)

	local var_27_0 = arg_27_0.quizList[arg_27_0.selectedPage]
	local var_27_1 = "res/ui/activity/jingcai/circle_icon/" .. var_27_0.host .. ".png"
	local var_27_2 = "res/ui/activity/jingcai/circle_icon/" .. var_27_0.guest .. ".png"

	arg_27_0.view.widgets.selectFlag1:setDisplayFrame(CCSprite:create(var_27_1):displayFrame())
	arg_27_0.view.widgets.selectFlag2:setDisplayFrame(CCSprite:create(var_27_2):displayFrame())

	local var_27_3 = var_27_0.options

	var_27_3[#var_27_3 + 1] = var_27_0.hostWinOthers
	var_27_3[#var_27_3 + 1] = var_27_0.guestWinOthers
	var_27_3[#var_27_3 + 1] = var_27_0.drawOthers

	showTable(var_27_3)

	var_27_3[#var_27_3].type = 7
	var_27_3[#var_27_3 - 1].type = 6
	var_27_3[#var_27_3 - 2].type = 5

	arg_27_0:updateScrollView(var_27_3)
	arg_27_0:showGuide()
end

function var_0_5.showGuide(arg_28_0)
	local var_28_0 = CCSprite:create("res/ui/guide/jiantou-shang.png")

	var_28_0:setPosition(ccp(910, 370))

	local var_28_1 = CCSprite:create("res/ui/empire/off_guide_hand1.PNG")

	var_28_1:setPosition(ccp(910, 190))

	local var_28_2 = CCArray:create()

	var_28_2:addObject(CCFadeIn:create(0.06))
	var_28_2:addObject(CCMoveBy:create(0.8, ccp(0, 50)))
	var_28_2:addObject(CCFadeOut:create(0.06))
	var_28_2:addObject(CCMoveBy:create(0.08, ccp(0, -50)))

	local var_28_3 = CCRepeat:create(CCSequence:create(var_28_2), 4)

	var_28_1:stopAllActions()
	var_28_1:runAction(var_28_3)

	local var_28_4 = CCArray:create()

	var_28_4:addObject(CCFadeIn:create(0.1))
	var_28_4:addObject(CCDelayTime:create(3.8))
	var_28_4:addObject(CCFadeOut:create(0.1))

	local var_28_5 = CCSequence:create(var_28_4)

	var_28_0:stopAllActions()
	var_28_0:runAction(var_28_5)
	arg_28_0.view.widgets.selectlist:addChild(var_28_1)
	arg_28_0.view.widgets.selectlist:addChild(var_28_0)
end

function var_0_5.showFlagList(arg_29_0, arg_29_1)
	var_0_2 = false

	arg_29_0.view.widgets.selectlist:setVisible(false)
	arg_29_0.view.widgets.flaglist:setVisible(true)
	arg_29_0.view.widgets.quizlist:setVisible(false)
	arg_29_0:updateFlagList(arg_29_1)
end

function var_0_5.updateFlagList(arg_30_0, arg_30_1)
	if arg_30_1.hostWin.betNum > 0 then
		arg_30_0.view.widgets.win_flag:setVisible(true)
	else
		arg_30_0.view.widgets.win_flag:setVisible(false)
	end

	if arg_30_1.guestWin.betNum > 0 then
		arg_30_0.view.widgets.lose_flag:setVisible(true)
	else
		arg_30_0.view.widgets.lose_flag:setVisible(false)
	end

	if arg_30_1.draw.betNum > 0 then
		arg_30_0.view.widgets.equal_flag:setVisible(true)
	else
		arg_30_0.view.widgets.equal_flag:setVisible(false)
	end

	local var_30_0 = arg_30_1.host
	local var_30_1 = arg_30_1.guest

	arg_30_0.view.widgets.nation_left_label:setString(language.get(157000 + var_30_0 .. "_ayjc"))
	arg_30_0.view.widgets.nation_right_label:setString(language.get(157000 + var_30_1 .. "_ayjc"))
	arg_30_0.view.widgets.btn_win_label:setString(arg_30_1.hostWin.odds)
	arg_30_0.view.widgets.btn_lose_label:setString(arg_30_1.guestWin.odds)
	arg_30_0.view.widgets.btn_equal_label:setString(arg_30_1.draw.odds)

	local var_30_2 = "res/ui/activity/jingcai/flag_icon/" .. var_30_0 .. ".png"

	arg_30_0.view.widgets.flag_left:setDisplayFrame(CCSprite:create(var_30_2):displayFrame())

	local var_30_3 = "res/ui/activity/jingcai/flag_icon/" .. var_30_1 .. ".png"

	arg_30_0.view.widgets.flag_right:setDisplayFrame(CCSprite:create(var_30_3):displayFrame())
	arg_30_0:updateDot()
end

function var_0_5.updateDot(arg_31_0)
	arg_31_0.view.widgets.dot:removeAllChildrenWithCleanup(true)

	for iter_31_0 = 1, #arg_31_0.quizList do
		local var_31_0 = CCSprite:create("res/ui/activity/jingcai/zqjc_qieyedian_wxz.png")

		var_31_0:setPosition(ccp(20 * iter_31_0, 0))
		arg_31_0.view.widgets.dot:addChild(var_31_0)

		if iter_31_0 == arg_31_0.selectedPage then
			local var_31_1 = CCSprite:create("res/ui/activity/jingcai/zqjc_qieyedian_xz.png")

			var_31_1:setAnchorPoint(ccp(0, 0))
			var_31_0:addChild(var_31_1)
		end
	end

	arg_31_0.view.widgets.dot:setPositionX(910 - #arg_31_0.quizList * 20)
end

function var_0_5.showMainQuiz(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.view.widgets.quizlist:setTouchEnabled(false)
	arg_32_0.view.widgets.quizlist:setVisible(true)
	arg_32_0.view.widgets.gem_own:setString(arg_32_0.quizList[arg_32_0.selectedPage].resources)
	arg_32_0.view.widgets.gem_down:setString(string.format("%s", arg_32_1.betNum))

	var_0_4.selectId = arg_32_1.id
	var_0_4.currentBettedNum = arg_32_1.betNum

	if arg_32_2 == 1 then
		arg_32_0.view.widgets.description:setString(language.get("166009_jc", language.get(157000 + arg_32_0.quizList[arg_32_0.selectedPage].host .. "_ayjc"), arg_32_1.odds))
	elseif arg_32_2 == 2 then
		arg_32_0.view.widgets.description:setString(language.get("166009_jc", language.get(157000 + arg_32_0.quizList[arg_32_0.selectedPage].guest .. "_ayjc"), arg_32_1.odds))
	elseif arg_32_2 == 3 then
		arg_32_0.view.widgets.description:setString(language.get("166015_jc", arg_32_1.odds))
	elseif arg_32_2 == 4 then
		arg_32_0.view.widgets.description:setString(language.get("166016_jc", arg_32_1.score, arg_32_1.odds))

		if arg_32_1.type == 5 then
			arg_32_0.view.widgets.description:setString(language.get("166009_jc", language.get(157000 + arg_32_0.quizList[arg_32_0.selectedPage].host .. "_ayjc"), arg_32_1.odds))
		elseif arg_32_1.type == 6 then
			arg_32_0.view.widgets.description:setString(language.get("166009_jc", language.get(157000 + arg_32_0.quizList[arg_32_0.selectedPage].guest .. "_ayjc"), arg_32_1.odds))
		elseif arg_32_1.type == 7 then
			arg_32_0.view.widgets.description:setString(language.get("166015_jc", arg_32_1.odds))
		end
	end

	arg_32_0.view.widgets.confirm:addHandleOfControlEvent(function()
		local var_33_0 = tolua.cast(arg_32_0.view.widgets.quizlist:getChildByTag(111), "CCEditBox"):getText()

		var_0_4.currentBettingNum = tonumber(var_33_0)

		if var_0_4.currentBettingNum <= 0 then
			messageBox.error(language.get("156029_ayjc"))

			return
		end

		if var_0_4.currentBettingNum + var_0_4.currentBettedNum > var_0_4.maxBetsNum then
			messageBox.error(language.get("156029_ayjc"))

			return
		else
			arg_32_0:sendBet()
		end
	end, CCControlEventTouchUpInside)

	if arg_32_0.view.widgets.quizlist:getChildByTag(111) then
		tolua.cast(arg_32_0.view.widgets.quizlist:getChildByTag(111), "CCEditBox"):setText("")

		return
	end

	local var_32_0 = CCScale9Sprite:create("res/ui/activity/jingcai/zqjc_shurukuang.png")
	local var_32_1 = CCEditBox:create(CCSizeMake(207, 29), var_32_0)

	var_32_1:setPosition(ccp(arg_32_0.view.widgets.jiantou:getPositionX() + 150, arg_32_0.view.widgets.jiantou:getPositionY()))
	var_32_1:setMaxLength(15)
	var_32_1:setPlaceHolder(language.get("166013_jc", arg_32_0.quizList[arg_32_0.selectedPage].maxBetsNum))
	var_32_1:setInputMode(kEditBoxInputModePhoneNumber)
	var_32_1:setReturnType(1)
	arg_32_0.view.widgets.quizlist:addChild(var_32_1, 2, 111)

	local function var_32_2(arg_34_0, arg_34_1)
		local var_34_0 = tolua.cast(arg_34_1, "CCEditBox")

		log.info("editBox", arg_34_0)

		if arg_34_0 == "began" then
			var_34_0:setText("")
		elseif arg_34_0 == "changed" then
			arg_32_0.inviteCode = var_34_0:getText()

			var_34_0:setText(arg_32_0.inviteCode)
			log.info(var_34_0:getText())
		elseif arg_34_0 == "ended" then
			arg_32_0.inviteCode = var_34_0:getText()

			var_34_0:setText(arg_32_0.inviteCode)
			log.info(var_34_0:getText())
		end
	end

	var_32_1:registerScriptEditBoxHandler(var_32_2)
end

function var_0_5.ctor(arg_35_0, arg_35_1, arg_35_2)
	arg_35_0.view = {}

	uiutil.initWidgets(arg_35_0.view, arg_35_0.layout)
	arg_35_0:registerScriptHandler(function(arg_36_0)
		if arg_36_0 == "enter" then
			arg_35_0:onEnter()
		elseif arg_36_0 == "exit" then
			arg_35_0:onExit()
		end
	end)
	arg_35_0:setTouchEnabled(true)
	arg_35_0:registerScriptTouchHandler(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == CCTOUCHBEGAN then
			arg_35_0:onTouchBegan(arg_37_1, arg_37_2)

			return true
		elseif arg_37_0 == CCTOUCHMOVED then
			arg_35_0:onTouchMoved(arg_37_1, arg_37_2)

			return true
		elseif arg_37_0 == CCTOUCHENDED then
			arg_35_0:onTouchEnded(arg_37_1, arg_37_2)

			return true
		end
	end, false, true)
	arg_35_0.view.widgets.quizlist:registerScriptTouchHandler(function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 == CCTOUCHBEGAN then
			return true
		elseif arg_38_0 == CCTOUCHMOVED then
			return true
		elseif arg_38_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	arg_35_0.view.widgets.quizlist:setTouchEnabled(false)
	arg_35_0.view.widgets.tabButton1:addHandleOfControlEvent(function()
		arg_35_0:tabOnTouch("quiz")
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.tabButton2:addHandleOfControlEvent(function()
		arg_35_0:tabOnTouch("history")
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.tabButton3:addHandleOfControlEvent(function()
		arg_35_0:tabOnTouch("rank")
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_35_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_tip:setPositionX(arg_35_0.view.widgets.title_text:getPositionX() + arg_35_0.view.widgets.title_text:getContentSize().width / 2 + 30)
	arg_35_0.view.widgets.back:addHandleOfControlEvent(function()
		arg_35_0:backView()
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_other:addHandleOfControlEvent(function()
		arg_35_0:goSelectList()
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_win:addHandleOfControlEvent(function()
		arg_35_0:showMainQuiz(arg_35_0.quizList[arg_35_0.selectedPage].hostWin, 1)
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_lose:addHandleOfControlEvent(function()
		arg_35_0:showMainQuiz(arg_35_0.quizList[arg_35_0.selectedPage].guestWin, 2)
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_equal:addHandleOfControlEvent(function()
		arg_35_0:showMainQuiz(arg_35_0.quizList[arg_35_0.selectedPage].draw, 3)
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_left:addHandleOfControlEvent(function()
		arg_35_0.selectedPage = arg_35_0.selectedPage - 1

		arg_35_0:updateQuiz(arg_35_0.quizList[arg_35_0.selectedPage])
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.btn_right:addHandleOfControlEvent(function()
		arg_35_0.selectedPage = arg_35_0.selectedPage + 1

		arg_35_0:updateQuiz(arg_35_0.quizList[arg_35_0.selectedPage])
	end, CCControlEventTouchUpInside)
	arg_35_0.view.widgets.closeButton:addHandleOfControlEvent(function()
		arg_35_0:close()
	end, CCControlEventTouchUpInside)

	arg_35_0.leftTime = arg_35_0.view.widgets.leftTime

	if arg_35_1 then
		arg_35_0:addChild(arg_35_0.view.widgets.panel)
		arg_35_1:addChild(arg_35_0)
	end

	arg_35_0.selectedPage = 1

	arg_35_0:tabOnTouch("quiz")
end

function var_0_5.getQuizType(arg_51_0, arg_51_1)
	local var_51_0 = ""

	if arg_51_1.quizType == 1 then
		var_51_0 = "yy"
	elseif arg_51_1.quizType == 2 then
		var_51_0 = "tj"
	elseif arg_51_1.quizType == 3 then
		var_51_0 = "tc"
	elseif arg_51_1.quizType == 4 then
		var_51_0 = "zq"
	end

	return var_51_0
end

local function var_0_6(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1:getChildByTag(100)

	if var_52_0 then
		var_52_0:removeFromParentAndCleanup(true)
	end

	local var_52_1, var_52_2 = arg_52_1:getPosition()

	arg_52_1:setPosition(ccp(var_52_1, var_52_2))

	local var_52_3 = arg_52_0 / 1000

	if var_52_3 < 3600 then
		arg_52_1:setString("")

		local var_52_4 = createTimerLabel(var_52_3 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, var_0_0)

		var_52_4:setAnchorPoint(ccp(0, 0.5))
		arg_52_1:addChild(var_52_4, 0, 100)
	elseif var_52_3 < 86400 then
		local var_52_5 = var_52_3 / 3600

		arg_52_1:setString(language.get(131001, tool.toint(var_52_5)))
	else
		local var_52_6 = var_52_3 / 3600 / 24

		arg_52_1:setString(language.get(131002, tool.toint(var_52_6)))
	end
end

function var_0_5.updateQuiz(arg_53_0, arg_53_1)
	var_0_4.quizData = arg_53_1
	var_0_4.maxBetsNum = arg_53_1.maxBetsNum

	var_0_6(arg_53_1.endCD, arg_53_0.leftTime)
	arg_53_0.view.widgets.btn_left:setVisible(true)
	arg_53_0.view.widgets.btn_right:setVisible(true)

	if arg_53_0.selectedPage == 1 then
		arg_53_0.view.widgets.btn_left:setVisible(false)
	end

	if arg_53_0.selectedPage == #arg_53_0.quizList then
		arg_53_0.view.widgets.btn_right:setVisible(false)
	end

	arg_53_0.view.widgets.quiz_text:setString(arg_53_1.content)

	if var_0_2 then
		arg_53_0:goSelectList()
	else
		arg_53_0:showFlagList(arg_53_1)
	end
end

function var_0_5.updateHistory(arg_54_0, arg_54_1)
	arg_54_0:createHistoryList(arg_54_1)
end

function var_0_5.updateRank(arg_55_0, arg_55_1)
	arg_55_0:createRankList(arg_55_1)
end

function var_0_5.sendBet(arg_56_0)
	local function var_56_0(arg_57_0)
		local var_57_0 = arg_57_0.action.data

		if arg_57_0.action.state == 1 then
			arg_56_0:tipFly()
			arg_56_0:getJingCaiInfo()
		end

		log.info("==== 下注成功 =====")
	end

	local var_56_1 = var_0_4.currentBettingNum

	log.info("increasedBetNum", var_56_1)
	cmgr.sendRequest(var_56_0, actions.sendQuizBet, var_0_4.selectId, var_56_1, var_0_4.quizData.quizId)
end

function var_0_5.tipFly(arg_58_0)
	local var_58_0 = CCSprite:create("res/ui/activity/jingcai/zqjc_tzcg.png")

	var_58_0:setPosition(ccp(visibleSize.width * 0.5, arg_58_0.view.widgets.confirm:getPositionY()))
	var_58_0:setScale(1)

	local var_58_1 = CCArray:create()

	var_58_1:addObject(CCFadeIn:create(0.06))
	var_58_1:addObject(CCMoveBy:create(0.5, ccp(0, 80)))
	var_58_1:addObject(CCDelayTime:create(0.5))
	var_58_1:addObject(CCMoveBy:create(0.3, ccp(0, 20)))
	var_58_1:addObject(CCFadeOut:create(0.06))

	local var_58_2 = CCSequence:create(var_58_1)

	var_58_0:stopAllActions()
	var_58_0:runAction(var_58_2)
	arg_58_0.view.widgets.panel:addChild(var_58_0)
end

function var_0_5.onTouchBegan(arg_59_0, arg_59_1, arg_59_2)
	return
end

function var_0_5.onTouchMoved(arg_60_0, arg_60_1, arg_60_2)
	arg_60_0.isTouchOn = false
end

function var_0_5.onTouchEnded(arg_61_0, arg_61_1, arg_61_2)
	arg_61_0.isTouchOn = false
end

function var_0_5.onTouchCancelled(arg_62_0, arg_62_1, arg_62_2)
	arg_62_0.isTouchOn = false
end

function var_0_5.onEnter(arg_63_0)
	return
end

function var_0_5.onExit(arg_64_0)
	return
end

function var_0_5.close(arg_65_0)
	arg_65_0:removeFromParentAndCleanup(true)
end

return var_0_5
