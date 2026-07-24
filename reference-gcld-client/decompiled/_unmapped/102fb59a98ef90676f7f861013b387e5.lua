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
	selectId = 1,
	maxBetsNum = 0,
	currentBettingNum = 0,
	quizData = {},
	historyData = {},
	rankData = {}
}
local var_0_5 = class("JingCai", function()
	return createBaseLayer()
end)

var_0_5.layout = {
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
			name = "baoshi_sp",
			y = 543,
			type = "sprite",
			pic = {
				frame = true,
				path = "res_icon_7.png"
			},
			x = 760 + (visibleSize.width - 960) * 0.5
		},
		{
			text = "0",
			name = "count_bale",
			y = 545,
			type = "label",
			x = 810 + (visibleSize.width - 960) * 0.5
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 545,
			type = "button",
			x = 880 + (visibleSize.width - 960) * 0.5
		},
		{
			name = "quiz",
			type = "sprite",
			visible = false,
			pic = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/mrjc_bg_1.png"
			},
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5 - 18,
			children = {
				{
					x = 500,
					name = "title_sp",
					y = 400,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrdt_biaotidi.png"
					}
				},
				{
					x = 480,
					name = "title_text",
					y = 400,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_zqjc.png"
					}
				},
				{
					x = 100,
					name = "btn_left",
					h = 89,
					type = "button",
					w = 60,
					visible = false,
					y = 365,
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
					visible = false,
					name = "btn_right",
					h = 89,
					type = "button",
					w = 60,
					y = 365,
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
					y = 328,
					x = 480,
					text = language.get("156016_ayjc"),
					color = colorText.GC_INTER_DATI1,
					halign = kCCTextAlignmentCenter,
					valign = kCCVerticalTextAlignmentCenter
				},
				{
					y = 115,
					name = "quizlist",
					type = "node",
					x = 480,
					children = {
						{
							x = -325,
							name = "quizOption1",
							y = 86,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = -108,
							name = "quizOption2",
							y = 86,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = 108,
							name = "quizOption3",
							y = 86,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = 325,
							name = "quizOption4",
							y = 86,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = -325,
							name = "quizOption5",
							y = -14,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = -108,
							name = "quizOption6",
							y = -14,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = 108,
							name = "quizOption7",
							y = -14,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						},
						{
							x = 325,
							name = "quizOption8",
							y = -14,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_1.png"
							}
						}
					}
				},
				{
					fontSize = 22,
					name = "leftTimeLabel",
					scale = 1,
					type = "label",
					style = "label_warlock",
					y = 30,
					x = 420,
					anchorPoint = ccp(0.5, 0.5),
					color = color_white,
					text = language.get("156017_ayjc")
				},
				{
					fontSize = 22,
					name = "leftTime",
					scale = 1,
					type = "label",
					style = "label_warlock",
					y = 30,
					x = 600,
					anchorPoint = ccp(0.5, 0.5),
					color = var_0_0
				}
			}
		},
		{
			name = "betMask",
			type = "layerColor",
			y = 0,
			zorder = 300,
			visible = false,
			x = 0,
			color = ccc4(0, 0, 0, 180),
			width = visibleSize.width,
			height = visibleSize.height,
			children = {
				{
					name = "betPanel",
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrdt_tanchuang.png"
					},
					x = visibleSize.width * 0.5,
					y = visibleSize.height * 0.5,
					children = {
						{
							y = 220,
							x = 380,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrdt_neirong_jianbiandi.png"
							},
							children = {
								{
									fontSize = 22,
									name = "betInfo",
									y = 18,
									type = "richLabel",
									scale = 1,
									x = 240,
									anchorPoint = ccp(0.5, 0.5)
								}
							}
						},
						{
							y = 100,
							x = 380,
							scale = 1,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/mrdt_jingyan_1.png"
							},
							children = {
								{
									x = 28,
									name = "bubble",
									y = 70,
									type = "sprite",
									pic = {
										frame = false,
										path = "res/ui/activity/aoyunjingcai/mrdt_qipao.png"
									},
									children = {
										{
											text = 0,
											name = "bubbleLabel",
											y = 55,
											type = "label",
											fontSize = 24,
											x = 38
										}
									}
								},
								{
									y = 11,
									name = "progress",
									type = "progressbar",
									x = 15,
									anchorPoint = ccp(0, 0),
									progressType = kCCProgressTimerTypeBar,
									pic = {
										frame = false,
										path = "res/ui/activity/aoyunjingcai/mrdt_jingyan_2.png"
									}
								},
								{
									y = 10,
									name = "betDragButton",
									h = 49,
									type = "button",
									w = 34,
									x = 17,
									normal = {
										frame = false,
										path = "res/ui/activity/aoyunjingcai/mrdt_jingyan_btn_a.png"
									},
									touched = {
										frame = false,
										path = "res/ui/activity/aoyunjingcai/mrdt_jingyan_btn_c.png"
									}
								}
							}
						},
						{
							y = 100,
							name = "downBet",
							h = 42,
							type = "button",
							w = 42,
							x = 80,
							normal = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/btn_-_a.png"
							},
							touched = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/btn_-_c.png"
							}
						},
						{
							y = 100,
							name = "upBet",
							h = 42,
							type = "button",
							w = 42,
							x = 680,
							normal = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/btn_+_a.png"
							},
							touched = {
								frame = false,
								path = "res/ui/activity/aoyunjingcai/btn_+_c.png"
							}
						},
						{
							name = "cancel",
							h = 58,
							type = "button",
							w = 140,
							y = -30,
							x = 230,
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
									fontSize = 22,
									scale = 1,
									type = "label",
									style = "label_warlock",
									y = 30,
									x = 70,
									text = language.get(10002),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.TJ_White
								}
							}
						},
						{
							name = "confirm",
							h = 58,
							type = "button",
							w = 140,
							y = -30,
							x = 530,
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
									fontSize = 22,
									scale = 1,
									type = "label",
									style = "label_warlock",
									y = 30,
									x = 70,
									text = language.get("156018_ayjc"),
									anchorPoint = ccp(0.5, 0.5),
									color = colorText.TJ_White
								}
							}
						},
						{
							fontSize = 22,
							name = "minBetNumLabel",
							text = 0,
							type = "label",
							style = "label_warlock",
							x = 120,
							y = 65,
							color = color_white
						},
						{
							fontSize = 22,
							name = "maxBetNumLabel",
							text = 0,
							type = "label",
							style = "label_warlock",
							x = 630,
							y = 65,
							color = color_white
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
					x = 420,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_qk.png"
					}
				},
				{
					x = 500,
					y = 445,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/aoyunjingcai/mrjc_bg_4.png"
					}
				},
				{
					x = 580,
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
		},
		{
			name = "tabButton3",
			h = 56,
			type = "button",
			w = 188,
			y = 540,
			normal = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_a.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_c.png"
			},
			selected = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_c.png"
			},
			x = 410 + (visibleSize.width - 960) * 0.5,
			children = {
				{
					name = "tabButton3label",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 90,
					text = language.get("156020_ayjc")
				}
			}
		},
		{
			name = "tabButton2",
			h = 56,
			type = "button",
			w = 188,
			y = 540,
			normal = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_a.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_c.png"
			},
			selected = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_c.png"
			},
			x = 260 + (visibleSize.width - 960) * 0.5,
			children = {
				{
					name = "tabButton2label",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 90,
					text = language.get("156019_ayjc")
				}
			}
		},
		{
			name = "tabButton1",
			h = 56,
			type = "button",
			w = 188,
			y = 540,
			normal = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_a.png"
			},
			touched = {
				frame = false,
				path = "res/ui/activity/aoyunjingcai/btn_yeqian_c.png"
			},
			x = 110 + (visibleSize.width - 960) * 0.5,
			children = {
				{
					name = "tabButton1label",
					y = 25,
					type = "label",
					style = "label_yellowish_24",
					x = 90,
					text = language.get("156018_ayjc")
				}
			}
		}
	}
}

function var_0_5.getJingCaiInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.quizList = arg_3_0.action.data.quizList

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
		height = 280,
		name = "IntroPanel",
		type = "label",
		x = 460,
		y = 115,
		width = 880,
		text = language.get("156028_ayjc"),
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
		return 85, 905
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
			var_13_1:setContentSize(CCSize(905, 85))
			var_13_0:addChild(var_13_1)
		end

		if var_0_4.historyData.history[arg_13_1].time == nil then
			return var_13_0
		end

		local var_13_2 = var_0_4.historyData.history[arg_13_1].time
		local var_13_3 = os.date("%m-%d", var_13_2 / 1000)
		local var_13_4 = CCLabelTTF:create(var_13_3, "Thonburi", 24)

		var_13_4:setContentSize(CCSize(160, 30))
		var_13_4:setPosition(ccp(110, 50))
		var_13_0:addChild(var_13_4)

		local var_13_5 = arg_10_0:getQuizType(var_0_4.historyData.history[arg_13_1])

		if var_13_5 == "zq" then
			local var_13_6 = string.split(var_0_4.historyData.history[arg_13_1].content, ":")[1]
			local var_13_7 = string.split(var_0_4.historyData.history[arg_13_1].content, ":")[2]
			local var_13_8 = var_0_4.historyData.history[arg_13_1].score
			local var_13_9 = string.split(var_0_4.historyData.history[arg_13_1].score, ":")[1]
			local var_13_10 = string.split(var_0_4.historyData.history[arg_13_1].score, ":")[2]

			if var_13_6 == "0" or var_13_7 == "0" then
				local var_13_11 = CCLabelTTF:create(language.get("156021_ayjc"), "Thonburi", 24)

				var_13_11:setColor(ccc3(255, 255, 255))
				var_13_11:setPosition(ccp(202, 41))
				arg_10_0.view.widgets["quizOption" .. arg_13_1]:addChild(var_13_11)
			else
				local var_13_12 = CCSprite:create("res/ui/activity/aoyunjingcai/flag_icon/" .. var_13_6 .. ".png")

				var_13_12:setPosition(ccp(158, 41))

				local var_13_13 = CCSprite:create("res/ui/activity/aoyunjingcai/flag_icon/" .. var_13_7 .. ".png")

				var_13_13:setPosition(ccp(258, 41))

				local var_13_14 = CCSprite:create("res/ui/common/text/activity/quizActivity/mrjc_meishuzi_vs.png")

				var_13_14:setPosition(ccp(210, 41))
				var_13_0:addChild(var_13_12)
				var_13_0:addChild(var_13_13)
				var_13_0:addChild(var_13_14)
			end

			local var_13_15 = CCLabelTTF:create(var_13_8, "Thonburi", 24)

			var_13_15:setPosition(ccp(440, 41))

			if tonumber(var_13_9) < 0 or tonumber(var_13_10) < 0 then
				var_13_15:setString(language.get("156021_ayjc"))
			end

			var_13_0:addChild(var_13_15)
		else
			local var_13_16 = var_0_4.historyData.history[arg_13_1].content
			local var_13_17 = var_0_4.historyData.history[arg_13_1].score

			if tonumber(var_13_16) <= 0 then
				local var_13_18 = CCLabelTTF:create(language.get("156021_ayjc"), "Thonburi", 24)

				var_13_18:setColor(ccc3(255, 255, 255))
				var_13_18:setPosition(ccp(202, 41))
				var_13_0:addChild(var_13_18)
			else
				log.info("country:", var_13_16)

				local var_13_19 = CCSprite:create("res/ui/activity/aoyunjingcai/flag_icon/" .. var_13_16 .. ".png")

				var_13_19:setPosition(ccp(208, 41))
				var_13_0:addChild(var_13_19)
			end

			local var_13_20 = CCLabelTTF:create(var_13_17, "Thonburi", 24)

			var_13_20:setPosition(ccp(440, 41))

			if tonumber(var_13_17) < 0 then
				var_13_20:setString(language.get("156021_ayjc"))
			end

			var_13_0:addChild(var_13_20)
		end

		local var_13_21 = CCSprite:create("res/ui/activity/aoyunjingcai/jj_icon/" .. var_13_5 .. ".png")

		var_13_21:setPosition(ccp(370, 41))
		var_13_0:addChild(var_13_21)

		local var_13_22 = var_0_4.historyData.history[arg_13_1].odds
		local var_13_23 = CCLabelTTF:create(var_13_22, "Thonburi", 24)

		var_13_23:setPosition(ccp(570, 41))
		var_13_0:addChild(var_13_23)

		local var_13_24 = var_0_4.historyData.history[arg_13_1].betNum
		local var_13_25 = CCLabelTTF:create(var_13_24, "Thonburi", 24)

		var_13_25:setPosition(ccp(730, 41))
		var_13_0:addChild(var_13_25)

		local var_13_26 = var_0_4.historyData.history[arg_13_1].result
		local var_13_27 = language.get("156025_ayjc")
		local var_13_28 = CCLabelTTF:create(var_13_27, "Thonburi", 24)

		if var_13_26 == 0 then
			var_13_27 = language.get("156025_ayjc")

			var_13_28:setColor(colorText.TJ_White)
		elseif var_13_26 == 1 then
			var_13_27 = language.get("156026_ayjc")

			var_13_28:setColor(colorText.TJ_Green)
		elseif var_13_26 == 2 then
			var_13_27 = language.get("156027_ayjc")

			var_13_28:setColor(colorText.TJ_Red)
		end

		var_13_28:setString(var_13_27)
		var_13_28:setPosition(ccp(845, 41))
		var_13_0:addChild(var_13_28)

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

	if #var_0_4.historyData.history <= 5 then
		arg_10_0.view.widgets.historyList:setTouchEnabled(false)
	else
		arg_10_0.view.widgets.historyList:setTouchEnabled(true)
	end
end

function var_0_5.createRankList(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0, arg_16_1)
		log.info("cell touched at : ", arg_16_1:getIdx())
	end

	local function var_15_1(arg_17_0, arg_17_1)
		return 50, 905
	end

	local function var_15_2(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_0:dequeueCell()

		if var_18_0 then
			var_18_0:removeAllChildrenWithCleanup(true)
		else
			var_18_0 = CCTableViewCell:new()
		end

		arg_18_1 = arg_18_1 + 1

		if arg_18_1 % 2 == 0 then
			local var_18_1 = CCLayerColor:create(ccc4(0, 0, 0, 51))

			log.info(var_18_0:getContentSize().width)
			log.info(var_18_0:getContentSize().height)
			var_18_1:setContentSize(CCSize(905, 50))
			var_18_0:addChild(var_18_1)
		end

		local var_18_2 = var_0_4.rankData.ranks[arg_18_1].rank

		if var_18_2 == nil then
			return var_18_0
		end

		if var_18_2 == 1 then
			local var_18_3 = CCSprite:create("res/ui/common/text/activity/quizActivity/mrjc_meishuzi_guanjun.png")

			var_18_3:setPosition(ccp(70, 25))
			var_18_0:addChild(var_18_3)
		else
			local var_18_4 = CCLabelTTF:create(var_18_2, "Thonburi", 24)

			var_18_4:setContentSize(CCSize(160, 30))
			var_18_4:setPosition(ccp(140, 25))
			var_18_0:addChild(var_18_4)
		end

		local var_18_5 = var_0_4.rankData.ranks[arg_18_1].force
		local var_18_6 = "res/ui/common/text/activity/quizActivity/"

		if var_18_5 == 1 then
			var_18_6 = var_18_6 .. "kfsy_pmwei" .. ".png"
		elseif var_18_5 == 2 then
			var_18_6 = var_18_6 .. "kfsy_pmshu" .. ".png"
		elseif var_18_5 == 3 then
			var_18_6 = var_18_6 .. "kfsy_pmwu" .. ".png"
		end

		local var_18_7 = CCSprite:create(var_18_6)

		var_18_7:setPosition(ccp(260, 25))
		var_18_0:addChild(var_18_7)

		local var_18_8 = var_0_4.rankData.ranks[arg_18_1].name
		local var_18_9 = CCLabelTTF:create(var_18_8, "Thonburi", 24)

		var_18_9:setPosition(ccp(470, 20))
		var_18_0:addChild(var_18_9)

		local var_18_10 = var_0_4.rankData.ranks[arg_18_1].rewardNum
		local var_18_11 = CCLabelTTF:create(var_18_10, "Thonburi", 24)

		var_18_11:setPosition(ccp(730, 20))
		var_18_0:addChild(var_18_11)

		return var_18_0
	end

	local function var_15_3()
		local var_19_0 = var_0_4.rankData.ranks

		if var_19_0 and #var_19_0 > 0 then
			return math.ceil(#var_19_0)
		else
			return 0
		end
	end

	arg_15_0.view.widgets.rankList:registerScriptHandler(var_15_0, CCTableView.kTableCellTouched)
	arg_15_0.view.widgets.rankList:registerScriptHandler(var_15_1, CCTableView.kTableCellSizeForIndex)
	arg_15_0.view.widgets.rankList:registerScriptHandler(var_15_2, CCTableView.kTableCellSizeAtIndex)
	arg_15_0.view.widgets.rankList:registerScriptHandler(var_15_3, CCTableView.kNumberOfCellsInTableView)
	arg_15_0.view.widgets.rankList:reloadData()

	if #var_0_4.rankData.ranks <= 8 then
		arg_15_0.view.widgets.rankList:setTouchEnabled(false)
	else
		arg_15_0.view.widgets.rankList:setTouchEnabled(true)
	end
end

function var_0_5.upBet(arg_20_0)
	local var_20_0 = var_0_4.quizData.options[var_0_4.selectId].betNum
	local var_20_1 = var_0_4.quizData.options[var_0_4.selectId].maxBetsNum

	if var_20_1 > var_0_4.maxBetsNum + var_20_0 then
		var_20_1 = var_0_4.maxBetsNum + var_20_0
	end

	var_0_4.currentBettingNum = var_0_4.currentBettingNum + 1

	if var_20_0 <= var_0_4.currentBettingNum and var_20_1 >= var_0_4.currentBettingNum then
		arg_20_0:updateAccordingBetNum(var_0_4.currentBettingNum, var_20_1)
	else
		var_0_4.currentBettingNum = var_0_4.currentBettingNum - 1
	end
end

function var_0_5.downBet(arg_21_0)
	local var_21_0 = var_0_4.quizData.options[var_0_4.selectId].betNum
	local var_21_1 = var_0_4.quizData.options[var_0_4.selectId].maxBetsNum

	if var_21_1 > var_0_4.maxBetsNum + var_21_0 then
		var_21_1 = var_0_4.maxBetsNum + var_21_0
	end

	var_0_4.currentBettingNum = var_0_4.currentBettingNum - 1

	if var_21_0 <= var_0_4.currentBettingNum and var_21_1 >= var_0_4.currentBettingNum then
		arg_21_0:updateAccordingBetNum(var_0_4.currentBettingNum, var_21_1)
	else
		var_0_4.currentBettingNum = var_0_4.currentBettingNum + 1
	end
end

function var_0_5.tabOnTouch(arg_22_0, arg_22_1)
	(function()
		var_0_3.quiz = false
		var_0_3.history = false
		var_0_3.rank = false

		arg_22_0.view.widgets.quiz:setVisible(false)
		arg_22_0.view.widgets.history:setVisible(false)
		arg_22_0.view.widgets.rank:setVisible(false)
		arg_22_0.view.widgets.tabButton1label:setColor(colorText[10001])
		arg_22_0.view.widgets.tabButton1label:setScale(1)
		arg_22_0.view.widgets.tabButton2label:setColor(colorText[10001])
		arg_22_0.view.widgets.tabButton2label:setScale(1)
		arg_22_0.view.widgets.tabButton3label:setColor(colorText[10001])
		arg_22_0.view.widgets.tabButton3label:setScale(1)
		arg_22_0.view.widgets.tabButton1:setHighlighted(false)
		arg_22_0.view.widgets.tabButton2:setHighlighted(false)
		arg_22_0.view.widgets.tabButton3:setHighlighted(false)
		arg_22_0.view.widgets.panel:reorderChild(arg_22_0.view.widgets.tabButton1, 202)
		arg_22_0.view.widgets.panel:reorderChild(arg_22_0.view.widgets.tabButton2, 201)
		arg_22_0.view.widgets.panel:reorderChild(arg_22_0.view.widgets.tabButton3, 200)
	end)()

	if arg_22_1 == "quiz" then
		var_0_3.quiz = true

		arg_22_0.view.widgets.quiz:setVisible(true)
		arg_22_0.view.widgets.tabButton1label:setColor(colorText[10003])
		arg_22_0.view.widgets.tabButton1label:setScale(1.3)
		arg_22_0.view.widgets.tabButton1:setHighlighted(true)
		arg_22_0.view.widgets.panel:reorderChild(arg_22_0.view.widgets.tabButton1, 203)
		arg_22_0:getJingCaiInfo()
	elseif arg_22_1 == "history" then
		var_0_3.history = true

		arg_22_0.view.widgets.history:setVisible(true)
		arg_22_0.view.widgets.tabButton2label:setColor(colorText[10003])
		arg_22_0.view.widgets.tabButton2label:setScale(1.3)
		arg_22_0.view.widgets.tabButton2:setHighlighted(true)
		arg_22_0.view.widgets.panel:reorderChild(arg_22_0.view.widgets.tabButton2, 203)
		arg_22_0:getJinCaiHistoryInfo()
	elseif arg_22_1 == "rank" then
		var_0_3.rank = true

		arg_22_0.view.widgets.rank:setVisible(true)
		arg_22_0.view.widgets.tabButton3label:setColor(colorText[10003])
		arg_22_0.view.widgets.tabButton3label:setScale(1.3)
		arg_22_0.view.widgets.tabButton3:setHighlighted(true)
		arg_22_0.view.widgets.panel:reorderChild(arg_22_0.view.widgets.tabButton3, 203)
		arg_22_0:getJinCaiRankInfo()
	end
end

function var_0_5.ctor(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.view = {}
	var_0_1 = false

	uiutil.initWidgets(arg_24_0.view, arg_24_0.layout)
	arg_24_0.view.widgets.tabButton1:addHandleOfControlEvent(function()
		arg_24_0:tabOnTouch("quiz")
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.tabButton2:addHandleOfControlEvent(function()
		arg_24_0:tabOnTouch("history")
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.tabButton3:addHandleOfControlEvent(function()
		arg_24_0:tabOnTouch("rank")
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		log.info("btn_tip")
		arg_24_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.cancel:addHandleOfControlEvent(function()
		log.info("取消按钮点击！！！")

		if var_0_2 then
			arg_24_0.view.widgets.betMask:setVisible(false)
			arg_24_0.view.widgets.betMask:setTouchEnabled(false)

			var_0_2 = false
		end
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.confirm:addHandleOfControlEvent(function()
		if var_0_2 then
			if var_0_4.currentBettingNum <= var_0_4.quizData.options[var_0_4.selectId].betNum then
				messageBox.error(language.get("156029_ayjc"))

				return
			else
				arg_24_0:sendBet()
			end
		end
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.upBet:addHandleOfControlEvent(function()
		log.info("upBet 1")

		if var_0_2 then
			log.info("upBet 2")
			arg_24_0:upBet()
		end
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.downBet:addHandleOfControlEvent(function()
		if var_0_2 then
			arg_24_0:downBet()
		end
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_left:addHandleOfControlEvent(function()
		arg_24_0.selectedPage = arg_24_0.selectedPage - 1

		arg_24_0:updateQuiz(arg_24_0.quizList[arg_24_0.selectedPage])
	end, CCControlEventTouchUpInside)
	arg_24_0.view.widgets.btn_right:addHandleOfControlEvent(function()
		arg_24_0.selectedPage = arg_24_0.selectedPage + 1

		arg_24_0:updateQuiz(arg_24_0.quizList[arg_24_0.selectedPage])
	end, CCControlEventTouchUpInside)

	arg_24_0.leftTime = arg_24_0.view.widgets.leftTime

	if arg_24_1 then
		arg_24_0:addChild(arg_24_0.view.widgets.panel)
		arg_24_1:addChild(arg_24_0)
	end

	local function var_24_0(arg_35_0, arg_35_1)
		var_0_1 = true
	end

	arg_24_0.view.widgets.betDragButton:addHandleOfControlEvent(var_24_0, CCControlEventTouchDragInside)

	if arg_24_2.quizType == 0 then
		arg_24_0.view.widgets.count_bale:setVisible(false)
		arg_24_0.view.widgets.baoshi_sp:setVisible(false)
		arg_24_0.view.widgets.tabButton3:setPosition(arg_24_0.view.widgets.tabButton2:getPosition())
		arg_24_0.view.widgets.tabButton2:setPosition(arg_24_0.view.widgets.tabButton1:getPosition())
		arg_24_0.view.widgets.tabButton1:setVisible(false)
		arg_24_0:tabOnTouch("history")
	else
		arg_24_0.view.widgets.count_bale:setVisible(true)
		arg_24_0.view.widgets.baoshi_sp:setVisible(true)
		arg_24_0:tabOnTouch("quiz")
	end

	arg_24_0.view.widgets.betMask:registerScriptTouchHandler(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == CCTOUCHBEGAN then
			return true
		elseif arg_36_0 == CCTOUCHMOVED then
			return true
		elseif arg_36_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	arg_24_0.view.widgets.betMask:setTouchEnabled(false)

	arg_24_0.selectedPage = 1
end

function var_0_5.getQuizType(arg_37_0, arg_37_1)
	local var_37_0 = ""

	if arg_37_1.quizType == 1 then
		var_37_0 = "yy"
	elseif arg_37_1.quizType == 2 then
		var_37_0 = "tj"
	elseif arg_37_1.quizType == 3 then
		var_37_0 = "tc"
	elseif arg_37_1.quizType == 4 then
		var_37_0 = "zq"
	end

	return var_37_0
end

local function var_0_6(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1:getChildByTag(100)

	if var_38_0 then
		var_38_0:removeFromParentAndCleanup(true)
	end

	local var_38_1, var_38_2 = arg_38_1:getPosition()

	arg_38_1:setPosition(ccp(var_38_1, var_38_2))

	local var_38_3 = arg_38_0 / 1000

	if var_38_3 < 3600 then
		arg_38_1:setString("")

		local var_38_4 = createTimerLabel(var_38_3 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, var_0_0)

		arg_38_1:addChild(var_38_4, 0, 100)
	elseif var_38_3 < 86400 then
		local var_38_5 = var_38_3 / 3600

		arg_38_1:setString(language.get(131001, tool.toint(var_38_5)))
	else
		local var_38_6 = var_38_3 / 3600 / 24

		arg_38_1:setString(language.get(131002, tool.toint(var_38_6)))
	end
end

function var_0_5.updateQuiz(arg_39_0, arg_39_1)
	var_0_4.quizData = arg_39_1
	var_0_4.maxBetsNum = arg_39_1.resources

	arg_39_0.view.widgets.count_bale:setString(arg_39_1.resources)
	var_0_6(arg_39_1.endCD, arg_39_0.leftTime)
	arg_39_0.view.widgets.btn_left:setVisible(true)
	arg_39_0.view.widgets.btn_right:setVisible(true)

	if arg_39_0.selectedPage == 1 then
		arg_39_0.view.widgets.btn_left:setVisible(false)
	end

	if arg_39_0.selectedPage == #arg_39_0.quizList then
		arg_39_0.view.widgets.btn_right:setVisible(false)
	end

	local var_39_0 = arg_39_0:getQuizType(arg_39_1)

	titlePicPath = "res/ui/common/text/activity/quizActivity/mrjc_meishuzi_" .. var_39_0 .. "jc.png"

	arg_39_0.view.widgets.title_text:setDisplayFrame(CCSprite:create(titlePicPath):displayFrame())
	arg_39_0.view.widgets.quiz_text:setString(arg_39_1.content)

	for iter_39_0 = 1, 8 do
		arg_39_0.view.widgets["quizOption" .. iter_39_0]:removeAllChildrenWithCleanup(true)

		local var_39_1 = arg_39_1.options[iter_39_0].odds
		local var_39_2 = CCLabelAtlas:create(var_39_1, "res/ui/common/text/activity/quizActivity/mrjc_shuzi_2.png", 19, 30, 46)

		var_39_2:setAnchorPoint(ccp(0.5, 0))

		if arg_39_1.quizType == 4 then
			local var_39_3 = string.split(arg_39_1.options[iter_39_0].content, ":")[1]
			local var_39_4 = string.split(arg_39_1.options[iter_39_0].content, ":")[2]
			local var_39_5 = string.split(arg_39_1.options[iter_39_0].score, ":")[1]
			local var_39_6 = string.split(arg_39_1.options[iter_39_0].score, ":")[2]

			log.info(var_39_5, var_39_6)

			if var_39_3 == "0" or var_39_4 == "0" or tonumber(var_39_5) < 0 or tonumber(var_39_6) < 0 then
				local var_39_7 = CCLabelTTF:create(language.get("156021_ayjc"), "Thonburi", 24)

				var_39_7:setColor(ccc3(10, 10, 10))
				var_39_7:setPosition(ccp(73, 41))
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_7)
				var_39_2:setPosition(ccp(155, 27))
			else
				local var_39_8 = CCSprite:create("res/ui/activity/aoyunjingcai/flag_icon/" .. var_39_3 .. ".png")

				var_39_8:setPosition(ccp(38, 41))

				local var_39_9 = CCSprite:create("res/ui/activity/aoyunjingcai/flag_icon/" .. var_39_4 .. ".png")

				var_39_9:setPosition(ccp(138, 41))

				local var_39_10 = CCSprite:create("res/ui/common/text/activity/quizActivity/mrjc_meishuzi_vs.png")

				var_39_10:setPosition(ccp(90, 41))

				local var_39_11 = CCLabelAtlas:create(var_39_5, "res/ui/common/text/activity/quizActivity/mrjc_shuzi_1.png", 24, 34, 48)

				var_39_11:setPosition(ccp(50, 10))
				var_39_11:setAnchorPoint(ccp(0.5, 0))

				local var_39_12 = CCLabelAtlas:create(var_39_6, "res/ui/common/text/activity/quizActivity/mrjc_shuzi_1.png", 24, 34, 48)

				var_39_12:setPosition(ccp(150, 10))
				var_39_12:setAnchorPoint(ccp(0.5, 0))
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_8)
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_9)
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_10)
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_11)
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_12)
				var_39_2:setPosition(ccp(190, 27))
			end
		else
			local var_39_13 = arg_39_1.options[iter_39_0].content
			local var_39_14 = arg_39_1.options[iter_39_0].score

			if tonumber(var_39_13) <= 0 then
				local var_39_15 = CCLabelTTF:create(language.get("156021_ayjc"), "Thonburi", 24)

				var_39_15:setColor(ccc3(10, 10, 10))
				var_39_15:setPosition(ccp(73, 41))
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_15)
			else
				local var_39_16 = CCSprite:create("res/ui/activity/aoyunjingcai/flag_icon/" .. var_39_13 .. ".png")

				var_39_16:setPosition(ccp(73, 41))

				local var_39_17 = CCLabelAtlas:create(var_39_14, "res/ui/common/text/activity/quizActivity/mrjc_shuzi_1.png", 24, 34, 48)

				var_39_17:setPosition(ccp(75, 10))
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_16)
				arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_17)

				if tonumber(var_39_14) == 0 then
					var_39_17:setVisible(false)
				end
			end

			var_39_2:setPosition(ccp(155, 27))
		end

		var_39_2:setScale(0.8)
		arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_2)

		if var_0_4.quizData.options[iter_39_0].betNum > 0 then
			local var_39_18 = CCSprite:create("res/ui/activity/aoyunjingcai/mrjc_xuanxiang_bg_2.png")

			var_39_18:setPosition(ccp(0, 0))
			var_39_18:setAnchorPoint(ccp(0, 0))
			arg_39_0.view.widgets["quizOption" .. iter_39_0]:addChild(var_39_18)
		end
	end
end

function var_0_5.updateHistory(arg_40_0, arg_40_1)
	arg_40_0:createHistoryList(arg_40_1)
end

function var_0_5.updateRank(arg_41_0, arg_41_1)
	arg_41_0:createRankList(arg_41_1)
end

function var_0_5.updateBettingCount(arg_42_0, arg_42_1)
	local var_42_0 = var_0_4.quizData.options[arg_42_1].maxBetsNum

	if var_42_0 > var_0_4.quizData.options[arg_42_1].betNum + var_0_4.maxBetsNum then
		var_42_0 = var_0_4.quizData.options[arg_42_1].betNum + var_0_4.maxBetsNum
	end

	local var_42_1 = var_0_4.quizData.options[arg_42_1].betNum / var_42_0

	arg_42_0.view.widgets.betDragButton:setPositionX(var_42_1 * 484 + 17)
	arg_42_0.view.widgets.bubble:setPositionX(28 + var_42_1 * 484)
	arg_42_0.view.widgets.bubbleLabel:setString(var_0_4.quizData.options[arg_42_1].betNum)
	arg_42_0.view.widgets.progress:setPercentage(100 * var_42_1)

	var_0_4.currentBettingNum = var_0_4.quizData.options[arg_42_1].betNum
end

function var_0_5.updateAccordingBetNum(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = 484 * arg_43_1 / arg_43_2 + 17

	arg_43_0.view.widgets.betDragButton:setPositionX(var_43_0)
	arg_43_0.view.widgets.bubble:setPositionX(var_43_0 + 11)
	arg_43_0.view.widgets.bubbleLabel:setString(arg_43_1)
	arg_43_0.view.widgets.progress:setPercentage(100 * arg_43_1 / arg_43_2)
end

function var_0_5.sendBet(arg_44_0)
	local function var_44_0(arg_45_0)
		arg_44_0.view.widgets.betMask:setVisible(false)
		arg_44_0.view.widgets.betMask:setTouchEnabled(false)

		var_0_2 = false

		local var_45_0 = arg_45_0.action.data

		if arg_45_0.action.state == 1 then
			arg_44_0:getJingCaiInfo()
		end

		log.info("==== 下注成功 =====")
		showTable(arg_45_0)
	end

	local var_44_1 = var_0_4.currentBettingNum - var_0_4.quizData.options[var_0_4.selectId].betNum

	log.info("increasedBetNum", var_44_1)
	cmgr.sendRequest(var_44_0, actions.sendQuizBet, var_0_4.selectId, var_44_1, var_0_4.quizData.quizId)
end

function var_0_5.showBetPanel(arg_46_0, arg_46_1)
	log.info("showBetPanel optionIndex:", arg_46_1)

	var_0_2 = true

	arg_46_0.view.widgets.minBetNumLabel:setString(var_0_4.quizData.options[arg_46_1].betNum)

	local var_46_0 = var_0_4.quizData.options[arg_46_1].maxBetsNum

	if var_46_0 > var_0_4.quizData.options[arg_46_1].betNum + var_0_4.maxBetsNum then
		var_46_0 = var_0_4.quizData.options[arg_46_1].betNum + var_0_4.maxBetsNum
	end

	arg_46_0.view.widgets.maxBetNumLabel:setString(var_46_0)

	if var_0_4.quizData.quizType == 4 then
		local var_46_1 = string.split(var_0_4.quizData.options[arg_46_1].content, ":")[1]
		local var_46_2 = string.split(var_0_4.quizData.options[arg_46_1].content, ":")[2]
		local var_46_3 = string.split(var_0_4.quizData.options[arg_46_1].score, ":")[1]
		local var_46_4 = string.split(var_0_4.quizData.options[arg_46_1].score, ":")[2]
		local var_46_5 = var_0_4.quizData.options[arg_46_1].odds

		if var_46_1 == 0 or var_46_2 == 0 or tonumber(var_46_3) < 0 or tonumber(var_46_4) < 0 then
			arg_46_0.view.widgets.betInfo:setString(language.get("156030_ayjc", language.get("156021_ayjc"), var_46_5))
		else
			arg_46_0.view.widgets.betInfo:setString(language.get("156024_ayjc", language.get(157000 + var_46_1 .. "_ayjc"), language.get(157000 + var_46_2 .. "_ayjc"), var_46_3, var_46_4, var_46_5))
		end
	else
		local var_46_6 = var_0_4.quizData.options[arg_46_1].content
		local var_46_7 = var_0_4.quizData.options[arg_46_1].score
		local var_46_8 = var_0_4.quizData.options[arg_46_1].odds

		if tonumber(var_46_6) <= 0 or tonumber(var_46_7) < 0 then
			arg_46_0.view.widgets.betInfo:setString(language.get("156030_ayjc", language.get("156021_ayjc"), var_46_8))
			log.info(444)
		else
			arg_46_0.view.widgets.betInfo:setString(language.get("156023_ayjc", language.get(157000 + var_46_6 .. "_ayjc"), var_46_7, var_46_8))
		end
	end

	arg_46_0:updateBettingCount(arg_46_1)
	arg_46_0.view.widgets.betMask:setVisible(true)
	arg_46_0.view.widgets.betMask:setTouchEnabled(true)
end

function var_0_5.continuous(arg_47_0)
	local function var_47_0()
		NewTimer(0.1, function()
			var_47_0()
		end)
	end

	var_47_0()
end

function var_0_5.startContinuous(arg_50_0)
	local function var_50_0()
		arg_50_0.schedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function()
			log.info("长按执行")
			log.info(var_0_4.pressingState)

			if var_0_4.pressingState == 1 then
				log.info("+")
				arg_50_0:upBet()
			elseif var_0_4.pressingState == 2 then
				log.info("-")
				arg_50_0:downBet()
			end
		end, 0.2, false)
	end

	arg_50_0.timer = NewTimer(0.5, var_50_0)
end

function var_0_5.endContinuous(arg_53_0)
	if arg_53_0.timer then
		arg_53_0.timer:over()
	end

	if arg_53_0.schedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_53_0.schedulerEntry)
	end

	var_0_4.pressingState = 0
end

function var_0_5.onTouchBegan(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0, var_54_1 = tool.getPositionInScreen(arg_54_0.view.widgets.upBet)
	local var_54_2, var_54_3 = tool.getPositionInScreen(arg_54_0.view.widgets.downBet)

	if arg_54_1 >= var_54_0 - arg_54_0.view.widgets.upBet:getContentSize().width / 2 and arg_54_1 <= var_54_0 + arg_54_0.view.widgets.upBet:getContentSize().width / 2 and arg_54_2 >= var_54_1 - arg_54_0.view.widgets.upBet:getContentSize().height / 2 and arg_54_2 <= var_54_1 + arg_54_0.view.widgets.upBet:getContentSize().height / 2 then
		log.info("ready for long press upbet")

		var_0_4.pressingState = 1

		arg_54_0:startContinuous()
	elseif arg_54_1 >= var_54_2 - arg_54_0.view.widgets.downBet:getContentSize().width / 2 and arg_54_1 <= var_54_2 + arg_54_0.view.widgets.downBet:getContentSize().width / 2 and arg_54_2 >= var_54_3 - arg_54_0.view.widgets.downBet:getContentSize().height / 2 and arg_54_2 <= var_54_3 + arg_54_0.view.widgets.downBet:getContentSize().height / 2 then
		log.info("ready for long press downbet")

		var_0_4.pressingState = 2

		arg_54_0:startContinuous()
	else
		var_0_4.pressingState = 0
	end
end

function var_0_5.onTouchMoved(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_1 - tool.getPositionInScreen(arg_55_0.view.widgets.betDragButton) + arg_55_0.view.widgets.betDragButton:getPositionX()

	if var_55_0 < 17 then
		var_55_0 = 17
	end

	if var_55_0 > 501 then
		var_55_0 = 501
	end

	local var_55_1 = arg_55_0.view.widgets.betDragButton:getPositionX()

	if var_0_1 and var_55_0 >= 17 and var_55_0 <= 501 then
		local var_55_2 = var_0_4.quizData.options[var_0_4.selectId].betNum
		local var_55_3 = var_0_4.quizData.options[var_0_4.selectId].maxBetsNum

		if var_55_3 > var_0_4.maxBetsNum + var_55_2 then
			var_55_3 = var_0_4.maxBetsNum + var_55_2
		end

		if var_55_2 > math.floor(var_55_3 * ((var_55_0 - 17) / 484)) then
			arg_55_0:updateAccordingBetNum(var_55_2, var_55_3)

			var_0_4.currentBettingNum = var_55_2

			return
		end

		var_0_4.currentBettingNum = math.floor(var_55_3 * ((var_55_0 - 17) / 484))

		arg_55_0.view.widgets.betDragButton:setPositionX(var_55_0)
		arg_55_0.view.widgets.bubble:setPositionX(var_55_0 + 11)
		arg_55_0.view.widgets.bubbleLabel:setString(var_0_4.currentBettingNum)
		arg_55_0.view.widgets.progress:setPercentage(100 * (var_55_0 - 17) / 484)
	end
end

function var_0_5.onTouchEnded(arg_56_0, arg_56_1, arg_56_2)
	if not var_0_1 and not var_0_2 then
		for iter_56_0 = 1, 8 do
			local var_56_0, var_56_1 = tool.getPositionInScreen(arg_56_0.view.widgets["quizOption" .. iter_56_0])
			local var_56_2 = arg_56_0.view.widgets["quizOption" .. iter_56_0]:getContentSize().width
			local var_56_3 = arg_56_0.view.widgets["quizOption" .. iter_56_0]:getContentSize().height

			if arg_56_1 >= var_56_0 - var_56_2 / 2 and arg_56_1 <= var_56_0 + var_56_2 / 2 and arg_56_2 >= var_56_1 - var_56_3 / 2 and arg_56_2 <= var_56_1 + var_56_3 / 2 then
				if arg_56_0.view.widgets.quiz:isVisible() then
					arg_56_0:showBetPanel(iter_56_0)

					var_0_4.selectId = iter_56_0
				end

				break
			end

			log.info("itemX:", var_56_0)
			log.info("itemY:", var_56_1)
			log.info("itemWidth:", var_56_2)
			log.info("itemHeight:", var_56_3)
		end
	end

	arg_56_0:endContinuous()

	var_0_1 = false
end

function var_0_5.onTouchCancelled(arg_57_0, arg_57_1, arg_57_2)
	var_0_1 = false
end

function var_0_5.onEnter(arg_58_0)
	arg_58_0.touchBeganRef = handler(arg_58_0, arg_58_0.onTouchBegan)
	arg_58_0.touchMovedRef = handler(arg_58_0, arg_58_0.onTouchMoved)
	arg_58_0.touchEndedRef = handler(arg_58_0, arg_58_0.onTouchEnded)
	arg_58_0.touchCancelledRef = handler(arg_58_0, arg_58_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_58_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_58_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_58_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_58_0.touchCancelledRef)
end

function var_0_5.onExit(arg_59_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_59_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_59_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_59_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_59_0.touchCancelledRef)

	var_0_1 = false
	var_0_2 = false
end

return var_0_5
