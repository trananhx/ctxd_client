local var_0_0 = class("QAActivity", function()
	return createBaseLayer()
end)
local var_0_1 = require("res/native/offset").get("layer.activity.qaActivity")
local var_0_2 = ccp(0, 0)

var_0_0.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = true,
		path = "mrdt_bg.png"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			fontSize = 18,
			name = "systemNotice",
			y = 491,
			type = "label",
			style = "label_warlock",
			x = 68,
			anchor = ccp(0, 0.5),
			color = colorText[10002]
		},
		{
			x = 230,
			y = 421,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_biaotidi.png"
			}
		},
		{
			x = 181,
			y = 421,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/common/text/activity/qaActivity/mrdt_meishuzi_question.png"
			}
		},
		{
			name = "nowQuesNum",
			type = "atlaslabel",
			pic = "res/ui/activity/qaActivity/mrdt_shuzi_tishu_1.png",
			startCharMap = 48,
			text = "0",
			y = 421,
			itemWidth = 29,
			x = 303,
			itemHeight = 34,
			ccp(0, 0.5)
		},
		{
			y = 421,
			name = "slash",
			x = 283,
			type = "sprite",
			pic = {
				frame = false,
				path = "res/ui/activity/qaActivity/mrdt_shuzi_tishu_2.png"
			},
			ccp(0, 0.5)
		},
		{
			name = "TotalQuesNum",
			type = "atlaslabel",
			pic = "res/ui/activity/qaActivity/mrdt_shuzi_tishu_1.png",
			startCharMap = 48,
			text = "0",
			y = 421,
			itemWidth = 29,
			x = 283,
			itemHeight = 34,
			ccp(0, 0.5)
		},
		{
			fontSize = 24,
			height = 110,
			name = "Question",
			type = "label",
			width = 720,
			y = 336,
			x = 480,
			color = colorText.GC_INTER_DATI1,
			halign = kCCTextAlignmentLeft,
			valign = kCCVerticalTextAlignmentTop
		},
		{
			x = 281,
			name = "Answer1",
			y = 201,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_xuanxiang_bg_1.png"
			},
			children = {
				{
					text = "A",
					startCharMap = 65,
					x = 45,
					type = "atlaslabel",
					y = 51,
					itemWidth = 41,
					pic = "res/ui/activity/qaActivity/mrdt_meishuzi_abcd.png",
					itemHeight = 34
				},
				{
					fontSize = 24,
					height = 56,
					name = "AnswerContent1",
					type = "label",
					width = 260,
					y = 51,
					x = 210,
					color = colorText.GC_INTER_DATI2,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentCenter
				},
				{
					x = 187.5,
					name = "AnswerFrame1",
					y = 46,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_xuanxiang_bg_2.png"
					}
				},
				{
					x = 315,
					name = "AnswerMark1",
					y = 36,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_yinzhang_shiwu.png"
					}
				}
			}
		},
		{
			x = 679,
			name = "Answer2",
			y = 201,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_xuanxiang_bg_1.png"
			},
			children = {
				{
					text = "B",
					startCharMap = 65,
					x = 45,
					type = "atlaslabel",
					y = 51,
					itemWidth = 41,
					pic = "res/ui/activity/qaActivity/mrdt_meishuzi_abcd.png",
					itemHeight = 34
				},
				{
					fontSize = 24,
					height = 56,
					name = "AnswerContent2",
					type = "label",
					width = 260,
					y = 51,
					x = 210,
					color = colorText.GC_INTER_DATI2,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentCenter
				},
				{
					x = 187.5,
					name = "AnswerFrame2",
					y = 46,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_xuanxiang_bg_2.png"
					}
				},
				{
					x = 315,
					name = "AnswerMark2",
					y = 36,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_yinzhang_shiwu.png"
					}
				}
			}
		},
		{
			x = 281,
			name = "Answer3",
			y = 96,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_xuanxiang_bg_1.png"
			},
			children = {
				{
					text = "C",
					startCharMap = 65,
					x = 45,
					type = "atlaslabel",
					y = 51,
					itemWidth = 41,
					pic = "res/ui/activity/qaActivity/mrdt_meishuzi_abcd.png",
					itemHeight = 34
				},
				{
					fontSize = 24,
					height = 56,
					name = "AnswerContent3",
					type = "label",
					width = 260,
					y = 51,
					x = 210,
					color = colorText.GC_INTER_DATI2,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentCenter
				},
				{
					x = 187.5,
					name = "AnswerFrame3",
					y = 46,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_xuanxiang_bg_2.png"
					}
				},
				{
					x = 315,
					name = "AnswerMark3",
					y = 36,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_yinzhang_shiwu.png"
					}
				}
			}
		},
		{
			x = 679,
			name = "Answer4",
			y = 96,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_xuanxiang_bg_1.png"
			},
			children = {
				{
					text = "D",
					startCharMap = 65,
					x = 45,
					type = "atlaslabel",
					y = 51,
					itemWidth = 41,
					pic = "res/ui/activity/qaActivity/mrdt_meishuzi_abcd.png",
					itemHeight = 34
				},
				{
					fontSize = 24,
					height = 56,
					name = "AnswerContent4",
					type = "label",
					width = 260,
					y = 51,
					x = 210,
					color = colorText.GC_INTER_DATI2,
					halign = kCCTextAlignmentLeft,
					valign = kCCVerticalTextAlignmentCenter
				},
				{
					x = 187.5,
					name = "AnswerFrame4",
					y = 46,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_xuanxiang_bg_2.png"
					}
				},
				{
					x = 315,
					name = "AnswerMark4",
					y = 36,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_yinzhang_shiwu.png"
					}
				}
			}
		},
		{
			fontSize = 18,
			name = "nextQuestionCD",
			type = "label",
			y = 26,
			x = 923,
			text = "0",
			color = colorText.GC_INTER_HONG2,
			anchor = ccp(1, 0.5)
		},
		{
			fontSize = 18,
			name = "nextQuestion",
			type = "label",
			y = 26,
			x = 923,
			textId = "156000_gcldhw",
			color = colorText[10002],
			anchor = ccp(1, 0.5)
		},
		{
			fontSize = 18,
			name = "AnswerResult",
			type = "label",
			y = 26,
			x = 43,
			color = colorText.GC_INTER_DATI3,
			anchor = ccp(0, 0.5)
		},
		{
			x = 480,
			name = "mask",
			y = 261,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_bg_zhezhao.png"
			}
		},
		{
			x = 480,
			name = "playerScorePanel",
			y = 261,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_tanchuang.png"
			},
			children = {
				{
					x = 380,
					y = 261,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_biaotidi.png"
					}
				},
				{
					x = 380,
					name = "scorceTitle",
					y = 261,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_meishuzi_ndcj.png"
					}
				},
				{
					x = 380,
					y = 180,
					type = "sprite",
					pic = {
						frame = true,
						path = "sm_icon_di.png"
					}
				},
				{
					x = 378,
					name = "playerIcon",
					y = 183,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/playerHead/playerHead_icon_2.png"
					}
				},
				{
					fontSize = 24,
					name = "playerName",
					y = 115,
					type = "label",
					x = 380,
					color = colorText.GC_INTER_DATI1
				},
				{
					fontSize = 18,
					y = -10,
					type = "label",
					x = 740,
					textId = "156013_gcldhw",
					color = colorText[10002],
					anchor = ccp(1, 0.5)
				}
			}
		},
		{
			x = 480,
			name = "championPanel",
			y = 261,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_tanchuang.png"
			},
			children = {
				{
					x = 380,
					y = 261,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_biaotidi.png"
					}
				},
				{
					x = 380,
					y = 261,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_meishuzi_jrgj.png"
					}
				},
				{
					fontSize = 24,
					name = "championName",
					y = 213,
					type = "label",
					x = 380,
					color = colorText.GC_INTER_DATI1
				},
				{
					y = 144,
					x = 380,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_canshu_jianbiandi.png"
					},
					children = {
						{
							x = 52,
							y = 52,
							type = "sprite",
							pic = {
								frame = true,
								path = "sm_icon_di.png"
							}
						},
						{
							x = 50,
							name = "championIcon",
							y = 55,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/common/playerHead/playerHead_icon_2.png"
							}
						},
						{
							fontSize = 18,
							name = "championAnswered",
							y = 84,
							type = "label",
							x = 110,
							anchor = ccp(0, 0.5)
						},
						{
							fontSize = 18,
							name = "championSpeed",
							y = 57,
							type = "label",
							x = 110,
							anchor = ccp(0, 0.5)
						}
					}
				},
				{
					x = 100,
					y = 140,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/horseRacing/sm_icon_jiangbei_4.png"
					}
				}
			}
		},
		{
			x = 480,
			name = "beginPanel",
			y = 261,
			type = "sprite",
			pic = {
				frame = true,
				path = "mrdt_tanchuang.png"
			},
			children = {
				{
					x = 380,
					y = 261,
					type = "sprite",
					pic = {
						frame = true,
						path = "mrdt_biaotidi.png"
					}
				},
				{
					x = 380,
					y = 261,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/common/text/activity/qaActivity/mrdt_meishuzi_jrdtjjks.png"
					}
				},
				{
					name = "beginCDH",
					type = "atlaslabel",
					pic = "res/ui/activity/qaActivity/mrdt_shuzi_daojishi_1.png",
					startCharMap = 48,
					text = "00",
					y = 206,
					itemWidth = 29,
					x = 300,
					itemHeight = 40
				},
				{
					x = 340,
					y = 206,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/qaActivity/mrdt_shuzi_daojishi_2.png"
					}
				},
				{
					name = "beginCDM",
					type = "atlaslabel",
					pic = "res/ui/activity/qaActivity/mrdt_shuzi_daojishi_1.png",
					startCharMap = 48,
					text = "00",
					y = 206,
					itemWidth = 29,
					x = 380,
					itemHeight = 40
				},
				{
					x = 420,
					y = 206,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/qaActivity/mrdt_shuzi_daojishi_2.png"
					}
				},
				{
					name = "beginCDS",
					type = "atlaslabel",
					pic = "res/ui/activity/qaActivity/mrdt_shuzi_daojishi_1.png",
					startCharMap = 48,
					text = "00",
					y = 206,
					itemWidth = 29,
					x = 460,
					itemHeight = 40
				},
				{
					name = "gameRule",
					width = 670,
					type = "label",
					height = 131,
					textId = "156005_gcldhw",
					y = 105,
					x = 380,
					fontSize = 24 + (var_0_1.beginPanelFontSize or 0),
					color = colorText.GC_INTER_DATI1,
					halign = kCCTextAlignmentCenter,
					valign = kCCVerticalTextAlignmentCenter
				}
			}
		}
	}
}

local var_0_3 = {
	[3] = 3,
	[42] = 5
}

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	rmgr.loadResource("res/ui/activity/qaActivity/qaActivity.plist")

	arg_2_0.scheduler = CCDirector:sharedDirector():getScheduler()
	arg_2_0.data = arg_2_2
	arg_2_0.quesData = nil
	arg_2_0.nextCD = 0
	arg_2_0.answerCD = 0
	arg_2_0.haveSendBeginAnswer = false
	arg_2_0.localSelect = 0

	showTable(arg_2_0.data)
	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	arg_2_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		return arg_2_0:onTouch(arg_4_0, arg_4_1, arg_4_2)
	end)
	arg_2_0:setTouchEnabled(true)

	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, arg_2_0.layout)
	arg_2_0:uiInit()

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.panel)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0:updateContent()
end

function var_0_0.uiInit(arg_5_0)
	for iter_5_0 = 1, 4 do
		arg_5_0.view.widgets["AnswerMark" .. iter_5_0]:setVisible(false)
	end

	arg_5_0:resetPanel()

	arg_5_0.startCD = math.floor(arg_5_0.data.startCD * 0.001)

	local var_5_0, var_5_1, var_5_2 = tool.getHMS(arg_5_0.startCD)

	arg_5_0.view.widgets.beginCDH:setString(string.format("%02d", var_5_0))
	arg_5_0.view.widgets.beginCDM:setString(string.format("%02d", var_5_1))
	arg_5_0.view.widgets.beginCDS:setString(string.format("%02d", var_5_2))

	if conf.language == "vie" then
		arg_5_0.view.widgets.systemNotice:setString(language.get("156010_gcldhw", arg_5_0.data.timeList[3], arg_5_0.data.timeList[2], arg_5_0.data.timeList[6], arg_5_0.data.timeList[5], arg_5_0.data.timeList[7], arg_5_0.data.timeList[8]))
	else
		arg_5_0.view.widgets.systemNotice:setString(language.get("156010_gcldhw", arg_5_0.data.timeList[2], arg_5_0.data.timeList[3], arg_5_0.data.timeList[5], arg_5_0.data.timeList[6], arg_5_0.data.timeList[7], arg_5_0.data.timeList[8]))
	end

	arg_5_0.view.widgets.playerName:setString(user.player.name)
	arg_5_0.view.widgets.playerIcon:setDisplayFrame(CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. user.player.pic .. ".png"):displayFrame())
	arg_5_0.view.widgets.nextQuestionCD:setPositionX(arg_5_0.view.widgets.nextQuestion:getPositionX() - arg_5_0.view.widgets.nextQuestion:getContentSize().width)
end

function var_0_0.resetPanel(arg_6_0)
	arg_6_0.view.widgets.mask:setVisible(false)
	arg_6_0.view.widgets.beginPanel:setVisible(false)
	arg_6_0.view.widgets.championPanel:setVisible(false)
	arg_6_0.view.widgets.playerScorePanel:setVisible(false)
end

function var_0_0.onEnter(arg_7_0)
	function arg_7_0.pushQuesHandler(arg_8_0)
		arg_7_0:pushQuestionHandler(arg_8_0)
	end

	cmgr.registerResponseHandler(actions.pushQuestion, arg_7_0.pushQuesHandler)

	function arg_7_0.pushAnsHandler(arg_9_0)
		arg_7_0:pushAnswerHandler(arg_9_0)
	end

	cmgr.registerResponseHandler(actions.pushAnswer, arg_7_0.pushAnsHandler)

	arg_7_0.updateSchedulerEntry = arg_7_0.scheduler:scheduleScriptFunc(handler(arg_7_0, arg_7_0.timerUpdate), 1, false)

	arg_7_0:getActivityInfo()
end

function var_0_0.onExit(arg_10_0)
	cmgr.unregisterResponseHandler(actions.pushQuestion, arg_10_0.pushQuesHandler)
	cmgr.unregisterResponseHandler(actions.pushAnswer, arg_10_0.pushAnsHandler)
	arg_10_0.scheduler:unscheduleScriptEntry(arg_10_0.updateSchedulerEntry)

	arg_10_0.updateSchedulerEntry = nil
end

function var_0_0.updateContent(arg_11_0)
	arg_11_0:resetPanel()

	if arg_11_0.data.startCD > 0 then
		arg_11_0.view.widgets.mask:setVisible(true)
		arg_11_0.view.widgets.beginPanel:setVisible(true)
	elseif arg_11_0.data.startCD == 0 then
		if arg_11_0.data.ifStart == 0 then
			arg_11_0.view.widgets.mask:setVisible(true)
			arg_11_0.view.widgets.beginPanel:setVisible(true)
			arg_11_0:beginToAnswer()
		elseif arg_11_0.data.ifStart == 1 then
			arg_11_0:updateQuestion()
		elseif arg_11_0.data.ifStart == 2 then
			arg_11_0:updateResultPanel()
		end
	else
		arg_11_0.view.widgets.mask:setVisible(true)
	end

	arg_11_0.view.widgets.slash:setPositionX(arg_11_0.view.widgets.nowQuesNum:getPositionX() + arg_11_0.view.widgets.nowQuesNum:getContentSize().width)
	arg_11_0.view.widgets.TotalQuesNum:setPositionX(arg_11_0.view.widgets.slash:getPositionX() + arg_11_0.view.widgets.slash:getContentSize().width)
end

function var_0_0.updateQuestion(arg_12_0)
	log.info("updateQuestion")
	showTable(arg_12_0.quesData)

	if arg_12_0.quesData == nil then
		return
	end

	for iter_12_0 = 1, 4 do
		arg_12_0.view.widgets["AnswerFrame" .. iter_12_0]:setVisible(false)
		arg_12_0.view.widgets["AnswerMark" .. iter_12_0]:setVisible(false)
	end

	arg_12_0.view.widgets.nowQuesNum:setString(arg_12_0.quesData.currNum)
	arg_12_0.view.widgets.TotalQuesNum:setString(arg_12_0.quesData.totalNum)
	arg_12_0.view.widgets.Question:setString(arg_12_0.quesData.content)

	for iter_12_1, iter_12_2 in pairs(arg_12_0.quesData.options) do
		arg_12_0.view.widgets["AnswerContent" .. iter_12_2.id]:setString(iter_12_2.content)
	end

	arg_12_0:clearResultReward()

	if arg_12_0.quesData.correctOptionID == nil then
		arg_12_0.view.widgets.AnswerResult:setVisible(false)
	else
		local var_12_0 = {
			"A",
			"B",
			"C",
			"D"
		}

		if arg_12_0.quesData.selectedOptionID == 0 then
			arg_12_0.view.widgets.AnswerResult:setColor(ccc3(141, 141, 141))
			arg_12_0.view.widgets.AnswerResult:setString(language.get("156003_gcldhw", var_12_0[arg_12_0.quesData.correctOptionID]))
			arg_12_0.view.widgets.AnswerResult:setVisible(true)
		elseif arg_12_0.quesData.selectedOptionID == arg_12_0.quesData.correctOptionID then
			arg_12_0.view.widgets.AnswerResult:setColor(ccc3(12, 252, 0))
			arg_12_0:showResultReward(arg_12_0.quesData)
		else
			arg_12_0.view.widgets.AnswerResult:setColor(ccc3(141, 141, 141))
			arg_12_0.view.widgets.AnswerResult:setString(language.get("156002_gcldhw", var_12_0[arg_12_0.quesData.correctOptionID]))
			arg_12_0.view.widgets.AnswerResult:setVisible(true)
			arg_12_0.view.widgets["AnswerFrame" .. arg_12_0.quesData.selectedOptionID]:setDisplayFrame(CCSprite:createWithSpriteFrameName("mrdt_xuanxiang_bg_3.png"):displayFrame())
			arg_12_0.view.widgets["AnswerFrame" .. arg_12_0.quesData.selectedOptionID]:setVisible(true)
			arg_12_0.view.widgets["AnswerMark" .. arg_12_0.quesData.selectedOptionID]:setDisplayFrame(CCSprite:create("res/ui/common/text/activity/qaActivity/mrdt_yinzhang_shiwu.png"):displayFrame())
			arg_12_0.view.widgets["AnswerMark" .. arg_12_0.quesData.selectedOptionID]:setVisible(true)
		end

		arg_12_0.view.widgets["AnswerFrame" .. arg_12_0.quesData.correctOptionID]:setDisplayFrame(CCSprite:createWithSpriteFrameName("mrdt_xuanxiang_bg_2.png"):displayFrame())
		arg_12_0.view.widgets["AnswerFrame" .. arg_12_0.quesData.correctOptionID]:setVisible(true)
		arg_12_0.view.widgets["AnswerMark" .. arg_12_0.quesData.correctOptionID]:setDisplayFrame(CCSprite:create("res/ui/common/text/activity/qaActivity/mrdt_yinzhang_zhengque.png"):displayFrame())
		arg_12_0.view.widgets["AnswerMark" .. arg_12_0.quesData.correctOptionID]:setVisible(true)
	end
end

function var_0_0.updateResultPanel(arg_13_0)
	if arg_13_0.data.rankList and arg_13_0.data.rankList[1] then
		arg_13_0.view.widgets.mask:setVisible(true)
		arg_13_0.view.widgets.championPanel:setVisible(true)
		arg_13_0.view.widgets.championName:setString(arg_13_0.data.rankList[1].name)
		arg_13_0.view.widgets.championIcon:setDisplayFrame((CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. arg_13_0.data.rankList[1].pic .. ".png"):displayFrame()))
		arg_13_0.view.widgets.championAnswered:setString(language.get("156006_gcldhw", arg_13_0.data.rankList[1].trueNum))
		arg_13_0.view.widgets.championSpeed:setString(language.get("156007_gcldhw", string.format("%.2f", arg_13_0.data.rankList[1].useTime * 0.001)))
		arg_13_0.view.widgets.championIcon:removeAllChildrenWithCleanup(true)

		local var_13_0 = {}
		local var_13_1 = CCLabelTTF:create(language.get("156008_gcldhw"), "Thonburi", 18)

		var_13_1:setColor(ccc3(12, 252, 0))
		table.insert(var_13_0, var_13_1)

		for iter_13_0, iter_13_1 in pairs(arg_13_0.data.rankList[1].rewardList) do
			local var_13_2 = CCSprite:createWithSpriteFrameName("res_icon_" .. var_0_3[iter_13_1.rewardID] .. ".png")

			if var_13_2 then
				table.insert(var_13_0, var_13_2)
			end

			local var_13_3 = CCLabelTTF:create(iter_13_1.rewardNum, "Thonburi", 18)

			if var_13_3 then
				table.insert(var_13_0, var_13_3)
			end
		end

		local var_13_4 = createRichNode(var_13_0, 0)

		var_13_4:setPosition(arg_13_0.view.widgets.championIcon:getContentSize().width + 15, arg_13_0.view.widgets.AnswerResult:getContentSize().height * 0.5 + 15)
		arg_13_0.view.widgets.championIcon:addChild(var_13_4)
	else
		arg_13_0.view.widgets.mask:setVisible(true)
		arg_13_0.view.widgets.playerScorePanel:setVisible(true)
		tool.safeRemoveChildByTag(arg_13_0.view.widgets.playerScorePanel, 100)

		if arg_13_0.data.score and arg_13_0.data.score.useTime == 0 or arg_13_0.data.score == nil and arg_13_0.data.rankList == nil then
			arg_13_0.view.widgets.scorceTitle:setDisplayFrame(CCSprite:create("res/ui/common/text/activity/qaActivity/mrdt_meishuzi_nwcjdt.png"):displayFrame())

			local var_13_5 = CCLabelTTF:create(language.get("156011_gcldhw", arg_13_0.data.timeList[7], arg_13_0.data.timeList[8]), "Thonburi", 18)

			if var_13_5 then
				var_13_5:setColor(colorText.GC_INTER_DATI2)
				var_13_5:setPosition(ccp(380, 73))
				var_13_5:setTag(100)
				arg_13_0.view.widgets.playerScorePanel:addChild(var_13_5)
			end
		else
			arg_13_0.view.widgets.scorceTitle:setDisplayFrame(CCSprite:create("res/ui/common/text/activity/qaActivity/mrdt_meishuzi_ndcj.png"):displayFrame())

			local var_13_6 = language.get("156009_gcldhw", arg_13_0.data.score.trueNum)
			local var_13_7 = require("lua/component/HtmlView")
			local var_13_8 = var_13_7:create({
				rowWidth = 540,
				anchorX = 0.5,
				singleLine = true,
				htmlText = var_13_6
			})

			if var_13_8 then
				var_13_8:setAnchorPoint(ccp(0.5, 0.5))
				var_13_8:setPosition(ccp(380, 73))
				var_13_8:setTag(100)
				arg_13_0.view.widgets.playerScorePanel:addChild(var_13_8)
			end

			local var_13_9 = language.get("156012_gcldhw", string.format("%.2f", arg_13_0.data.score.useTime * 0.001))
			local var_13_10 = var_13_7:create({
				rowWidth = 540,
				anchorX = 0.5,
				singleLine = true,
				htmlText = var_13_9
			})

			if var_13_10 then
				var_13_10:setAnchorPoint(ccp(0.5, 0.5))
				var_13_10:setPosition(ccp(380, 53))
				var_13_10:setTag(100)
				arg_13_0.view.widgets.playerScorePanel:addChild(var_13_10)
			end
		end
	end
end

function var_0_0.showResultReward(arg_14_0, arg_14_1)
	arg_14_0.view.widgets.AnswerResult:setString(language.get("156001_gcldhw"))

	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_1.rewardList) do
		local var_14_1 = CCSprite:createWithSpriteFrameName("res_icon_" .. var_0_3[iter_14_1.rewardID] .. ".png")

		if var_14_1 then
			table.insert(var_14_0, var_14_1)
		end

		local var_14_2 = CCLabelTTF:create(iter_14_1.rewardNum, "Thonburi", 18)

		if var_14_2 then
			table.insert(var_14_0, var_14_2)
		end
	end

	local var_14_3 = createRichNode(var_14_0, 0)

	var_14_3:setPosition(arg_14_0.view.widgets.AnswerResult:getContentSize().width + 10, arg_14_0.view.widgets.AnswerResult:getContentSize().height * 0.5)
	arg_14_0.view.widgets.AnswerResult:addChild(var_14_3)
	arg_14_0.view.widgets.AnswerResult:setVisible(true)
end

function var_0_0.clearResultReward(arg_15_0)
	arg_15_0.view.widgets.AnswerResult:setVisible(false)
	arg_15_0.view.widgets.AnswerResult:removeAllChildrenWithCleanup(true)
end

function var_0_0.timerUpdate(arg_16_0, arg_16_1)
	if arg_16_0.startCD > 0 then
		arg_16_0.startCD = arg_16_0.startCD - 1

		if arg_16_0.startCD == 0 then
			arg_16_0:getActivityInfo()
		else
			local var_16_0, var_16_1, var_16_2 = tool.getHMS(arg_16_0.startCD)

			arg_16_0.view.widgets.beginCDH:setString(string.format("%02d", var_16_0))
			arg_16_0.view.widgets.beginCDM:setString(string.format("%02d", var_16_1))
			arg_16_0.view.widgets.beginCDS:setString(string.format("%02d", var_16_2))
		end
	end

	if arg_16_0.answerCD > 0 then
		arg_16_0.view.widgets.nextQuestionCD:setVisible(false)
		arg_16_0.view.widgets.nextQuestion:setString(language.get("156014_gcldhw", arg_16_0.answerCD))

		arg_16_0.answerCD = arg_16_0.answerCD - 1

		if arg_16_0.nextCD > 0 then
			arg_16_0.nextCD = arg_16_0.nextCD - 1
		end
	elseif arg_16_0.nextCD > 0 then
		arg_16_0.view.widgets.nextQuestionCD:setVisible(true)
		arg_16_0.view.widgets.nextQuestionCD:setString(arg_16_0.nextCD)
		arg_16_0.view.widgets.nextQuestion:setString(language.get("156000_gcldhw"))

		arg_16_0.nextCD = arg_16_0.nextCD - 1
	else
		arg_16_0.view.widgets.nextQuestionCD:setVisible(true)
		arg_16_0.view.widgets.nextQuestionCD:setString(arg_16_0.nextCD)
		arg_16_0.view.widgets.nextQuestion:setString(language.get("156000_gcldhw"))
	end
end

function var_0_0.onTouch(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if arg_17_0.view.widgets.mask:isVisible() then
		return
	end

	if arg_17_1 == CCTOUCHBEGAN then
		var_0_2 = ccp(arg_17_2, arg_17_3)

		return true
	elseif arg_17_1 == CCTOUCHMOVED then
		return true
	elseif arg_17_1 == CCTOUCHENDED then
		if ccpDistance(var_0_2, ccp(arg_17_2, arg_17_3)) > 20 then
			return
		end

		for iter_17_0 = 1, 4 do
			if tool.checkIfTouch(arg_17_0.view.widgets["Answer" .. iter_17_0], arg_17_2, arg_17_3) then
				arg_17_0:sendAnswer(iter_17_0)
			end
		end
	end
end

function var_0_0.getActivityInfo(arg_18_0)
	local function var_18_0(arg_19_0)
		arg_18_0.data = arg_19_0.action.data

		arg_18_0:updateContent()
	end

	cmgr.sendRequest(var_18_0, actions.getQAActivity)
end

function var_0_0.beginToAnswer(arg_20_0)
	if arg_20_0.haveSendBeginAnswer then
		return
	end

	arg_20_0.haveSendBeginAnswer = true

	local function var_20_0(arg_21_0)
		return
	end

	cmgr.sendRequest(var_20_0, actions.beginToAnswer)
end

function var_0_0.pushQuestionHandler(arg_22_0, arg_22_1)
	log.info("pushQuestionHandler")

	arg_22_0.localSelect = 0
	arg_22_0.data.ifStart = 1
	arg_22_0.quesData = arg_22_1.action.data.question

	if arg_22_0.quesData ~= nil then
		arg_22_0.nextCD = math.floor(arg_22_0.quesData.nextCD * 0.001)
		arg_22_0.answerCD = math.floor(arg_22_0.quesData.answerCD * 0.001)
	end

	arg_22_0:updateContent()
end

function var_0_0.sendAnswer(arg_23_0, arg_23_1)
	if arg_23_0.localSelect > 0 then
		return
	end

	log.info("sendAnswer = ", arg_23_1)

	arg_23_0.localSelect = arg_23_1

	arg_23_0.view.widgets["AnswerFrame" .. arg_23_1]:setDisplayFrame(CCSprite:createWithSpriteFrameName("mrdt_xuanxiang_bg_2.png"):displayFrame())
	arg_23_0.view.widgets["AnswerFrame" .. arg_23_1]:setVisible(true)

	local function var_23_0(arg_24_0)
		log.info("handlersendAnswer")
		showTable(arg_24_0.action.data)
	end

	cmgr.sendRequest(var_23_0, actions.sendAnswer, arg_23_1)
end

function var_0_0.pushAnswerHandler(arg_25_0, arg_25_1)
	log.info("pushAnswerHandler")
	showTable(arg_25_1.action.data)

	arg_25_0.quesData.correctOptionID = arg_25_1.action.data.answer.correctOptionID
	arg_25_0.quesData.selectedOptionID = arg_25_1.action.data.answer.selectedOptionID
	arg_25_0.quesData.rewardList = arg_25_1.action.data.answer.rewardList

	if arg_25_1.action.data.answer.nextCD then
		arg_25_0.quesData.nextCD = arg_25_1.action.data.answer.nextCD
		arg_25_0.nextCD = math.floor(arg_25_0.quesData.nextCD * 0.001)
	end

	arg_25_0.answerCD = 0

	arg_25_0:updateContent()

	if arg_25_1.action.data.answer.isOver == true then
		arg_25_0:getActivityInfo()
	end
end

return var_0_0
