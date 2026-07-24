local var_0_0 = require("res/native/offset").get("layer.activity.sevenCatch.sevenCatchTab")
local var_0_1 = {
	[0] = 135590,
	135591,
	135592,
	135593,
	135594,
	135595,
	135596
}
local var_0_2 = colorQuality[0]
local var_0_3 = tool.hexToRgb("#D9EDC5")
local var_0_4 = ccc3(0, 180, 0)
local var_0_5 = colorQuality[5]
local var_0_6 = colorQuality[4]
local var_0_7 = colorQuality[2]
local var_0_8 = class("SevenCatch", function()
	return createBaseLayer()
end)

var_0_8.layout = {
	name = "panel",
	type = "sprite",
	pic = {
		frame = false,
		path = "res/ui/comment/bg1.jpg"
	},
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5 - 30,
	children = {
		{
			name = "leftTime",
			type = "label",
			style = "label_warlock",
			x = 760 + (var_0_0.timeLeftX or 0),
			y = 485 + (var_0_0.timeLeftY or 0),
			anchorPoint = ccp(0.5, 0.5),
			fontSize = 25 + (var_0_0.lefttimeFntSize or 0),
			color = var_0_5
		},
		{
			style = "button_tip",
			name = "btn_tip",
			y = 490,
			type = "button",
			x = 880
		},
		{
			fontSize = 20,
			name = "spPhantomTips",
			width = 220,
			type = "label",
			height = 0,
			textId = 135608,
			zorder = 200,
			style = "label_warlock",
			x = 10 + (var_0_0.tipOffsetX or 0),
			y = 485 + (var_0_0.tipOffsetY or 0),
			anchorPoint = ccp(0, 0.5),
			color = var_0_6,
			halign = kCCTextAlignmentLeft
		},
		{
			y = 450,
			x = 458,
			type = "sprite",
			zorder = 100,
			pic = {
				frame = false,
				path = "res/ui/activity/sevenCatch/qtmh_up_line.png"
			}
		},
		{
			y = 0,
			name = "node_catch",
			type = "node",
			x = 0,
			children = {
				{
					x = 458,
					y = 490,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_title.png"
					}
				},
				{
					x = 457.5,
					name = "bg_catch",
					y = 3,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qqmh_bg.jpg"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					x = 158,
					y = 395,
					type = "sprite9",
					middleRect = CCRectMake(75, 0, 183, 75),
					preferedSize = CCSizeMake(300, 75),
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_head_bg.png"
					},
					children = {
						{
							y = 37.5,
							x = 37.5,
							scale = 0.75,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/common/fightPic/fightPic_xuchu.png"
							}
						},
						{
							x = 37.5,
							y = 5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/sevenCatch/qtmh_word_xl.png"
							}
						},
						{
							name = "btn_att1",
							h = 56,
							type = "button",
							w = 189,
							zoomOnTouchDown = false,
							y = 35,
							x = 225,
							normal = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04.png"
							},
							touched = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04_c.png"
							},
							disable = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04_g.png"
							}
						},
						{
							name = "lbl_att1",
							y = 35,
							type = "label",
							style = "label_warlock",
							x = 225,
							textId = 135604,
							fontSize = 22 + (var_0_0.tipsBtnFntSize or 0),
							color = var_0_3
						},
						{
							name = "lbl_11",
							width = 100,
							type = "label",
							height = 0,
							textId = 135582,
							y = 37.5,
							x = 75,
							anchorPoint = ccp(0, 0.5),
							fontSize = 24 + (var_0_0.tipsFntSize or 0),
							color = var_0_4
						},
						{
							name = "lbl_12",
							scale = 0.8,
							type = "label",
							textId = 135583,
							y = 50,
							x = 75,
							anchorPoint = ccp(0, 0.5),
							fontSize = 24 + (var_0_0.tipsFntSize or 0),
							color = var_0_5
						},
						{
							y = 25,
							name = "lbl_13",
							anchorX = 0,
							type = "richLabel",
							x = 75
						}
					}
				},
				{
					x = 458,
					y = 395,
					type = "sprite9",
					middleRect = CCRectMake(75, 0, 183, 75),
					preferedSize = CCSizeMake(300, 75),
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_head_bg.png"
					},
					children = {
						{
							y = 37.5,
							x = 37.5,
							scale = 0.75,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/common/fightPic/fightPic_yuanzhengjun.png"
							}
						},
						{
							x = 37.5,
							y = 5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/sevenCatch/qtmh_word_zl.png"
							}
						},
						{
							name = "btn_att2",
							h = 56,
							type = "button",
							w = 189,
							zoomOnTouchDown = false,
							y = 35,
							x = 225,
							normal = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04.png"
							},
							touched = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04_c.png"
							},
							disable = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04_g.png"
							}
						},
						{
							name = "lbl_att2",
							y = 35,
							type = "label",
							style = "label_warlock",
							x = 225,
							textId = 135604,
							fontSize = 22 + (var_0_0.tipsBtnFntSize or 0),
							color = var_0_3
						},
						{
							name = "lbl_21",
							width = 100,
							type = "label",
							height = 0,
							textId = 135582,
							y = 37.5,
							x = 75,
							anchorPoint = ccp(0, 0.5),
							fontSize = 24 + (var_0_0.tipsFntSize or 0),
							color = var_0_4
						},
						{
							name = "lbl_22",
							scale = 0.8,
							type = "label",
							textId = 135583,
							y = 50,
							x = 75,
							anchorPoint = ccp(0, 0.5),
							fontSize = 24 + (var_0_0.tipsFntSize or 0),
							color = var_0_5
						},
						{
							y = 25,
							name = "lbl_23",
							anchorX = 0,
							type = "richLabel",
							x = 75
						}
					}
				},
				{
					x = 758,
					y = 395,
					type = "sprite9",
					middleRect = CCRectMake(75, 0, 183, 75),
					preferedSize = CCSizeMake(300, 75),
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_head_bg.png"
					},
					children = {
						{
							y = 37.5,
							x = 37.5,
							scale = 0.75,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/common/fightPic/fightPic_lvmeng.png"
							}
						},
						{
							x = 37.5,
							y = 5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/activity/sevenCatch/qtmh_word_dl.png"
							}
						},
						{
							name = "btn_att3",
							h = 56,
							type = "button",
							w = 189,
							zoomOnTouchDown = false,
							y = 35,
							x = 225,
							normal = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04.png"
							},
							touched = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04_c.png"
							},
							disable = {
								frame = false,
								path = "res/ui/common/button/sdyjs_btn_04_g.png"
							}
						},
						{
							name = "lbl_att3",
							y = 35,
							type = "label",
							style = "label_warlock",
							x = 225,
							textId = 135604,
							fontSize = 22 + (var_0_0.tipsBtnFntSize or 0),
							color = var_0_3
						},
						{
							name = "lbl_31",
							width = 100,
							type = "label",
							height = 0,
							textId = 135582,
							y = 37.5,
							x = 75,
							anchorPoint = ccp(0, 0.5),
							fontSize = 24 + (var_0_0.tipsFntSize or 0),
							color = var_0_4
						},
						{
							name = "lbl_32",
							scale = 0.8,
							type = "label",
							textId = 135583,
							y = 50,
							x = 75,
							anchorPoint = ccp(0, 0.5),
							fontSize = 24 + (var_0_0.tipsFntSize or 0),
							color = var_0_5
						},
						{
							y = 25,
							name = "lbl_33",
							anchorX = 0,
							type = "richLabel",
							x = 75
						}
					}
				},
				{
					zoomOnTouchDown = false,
					name = "btn_npc",
					h = 360,
					type = "button",
					w = 600,
					y = 180,
					x = 460,
					normal = {
						frame = false,
						path = "res/default.png"
					},
					touched = {
						frame = false,
						path = "res/default.png"
					}
				},
				{
					x = 458,
					name = "npc",
					y = 140,
					type = "sprite",
					pic = {
						frame = true,
						path = "hitted40001.png"
					}
				},
				{
					x = 335,
					name = "arrow1",
					y = 140,
					type = "sprite",
					zorder = 300,
					pic = {
						frame = false,
						path = "res/ui/guide/jiantou-you.png"
					},
					children = {
						{
							fontSize = 20,
							style = "label_warlock",
							y = 30,
							type = "label",
							x = 30,
							textId = 135605,
							color = var_0_6
						}
					}
				},
				{
					visible = false,
					name = "npcTipFrame1",
					type = "sprite9",
					zorder = 300,
					y = 275,
					x = 455,
					pic = {
						frame = true,
						path = "common_tip_frame_small.png"
					},
					anchorPoint = ccp(1, 1),
					middleRect = CCRectMake(24, 24, 1, 1),
					preferedSize = CCSizeMake(220, 100),
					children = {
						{
							fontSize = 20,
							height = 70,
							name = "npcMsg1",
							type = "label",
							y = 85,
							width = 190,
							textId = 135586,
							style = "label_warlock",
							x = 15,
							anchorPoint = ccp(0, 1),
							halign = kCCTextAlignmentLeft,
							color = var_0_3
						}
					}
				},
				{
					x = 190,
					name = "num1",
					y = 63,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_word_qmh_01.png"
					},
					anchorPoint = ccp(1, 0.5)
				},
				{
					x = 300,
					name = "catchLabel",
					y = 63,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_word_qmh.png"
					},
					anchorPoint = ccp(1, 0.5)
				},
				{
					x = 458,
					name = "bg_info",
					y = 60,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_pb_bg.png"
					}
				},
				{
					y = 60,
					name = "progress",
					type = "progressbar",
					x = 458,
					anchorPoint = ccp(0.5, 0.5),
					progressType = kCCProgressTimerTypeBar,
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_pb.png"
					}
				},
				{
					x = 458,
					name = "bg_info",
					y = 30,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/world/flight_place_view.png"
					}
				},
				{
					y = 30,
					name = "info",
					x = 458,
					type = "richLabel"
				}
			}
		},
		{
			y = 0,
			name = "node_box",
			visible = false,
			type = "node",
			x = 0,
			children = {
				{
					x = 458,
					name = "catchTitle",
					y = 490,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_title_2.png"
					}
				},
				{
					x = 337,
					name = "num2",
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qtmh_title_digit_1.png"
					},
					y = 490 + (var_0_0.num2OffsetY or 0)
				},
				{
					y = 0,
					x = 457.5,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/general/jailView/new/lf_bg.jpg"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					x = 712,
					name = "bg_box",
					y = 56,
					type = "sprite",
					scale = 0.98,
					zorder = 200,
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/qqmh_prison_bg.jpg"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					x = 480,
					name = "arrow2",
					y = 265,
					type = "sprite",
					zorder = 300,
					pic = {
						frame = false,
						path = "res/ui/guide/jiantou-you.png"
					},
					children = {
						{
							fontSize = 20,
							style = "label_warlock",
							y = 30,
							type = "label",
							x = 30,
							textId = 135606,
							color = var_0_6
						}
					}
				},
				{
					y = 56,
					x = 250,
					type = "sprite",
					pic = {
						frame = false,
						path = "res/ui/activity/sevenCatch/menghuo.png"
					},
					anchorPoint = ccp(0.5, 0)
				},
				{
					visible = false,
					name = "npcTipFrame2",
					type = "sprite9",
					zorder = 300,
					y = 445,
					x = 260,
					pic = {
						frame = true,
						path = "common_tip_frame_small.png"
					},
					anchorPoint = ccp(1, 1),
					middleRect = CCRectMake(24, 24, 1, 1),
					preferedSize = CCSizeMake(250, 130),
					children = {
						{
							fontSize = 20,
							height = 100,
							name = "npcMsg2",
							type = "label",
							y = 115,
							width = 220,
							textId = 135590,
							style = "label_warlock",
							x = 15,
							anchorPoint = ccp(0, 1),
							halign = kCCTextAlignmentLeft,
							color = var_0_3
						}
					}
				},
				{
					name = "btn_again",
					h = 58,
					type = "button",
					w = 140,
					zoomOnTouchDown = false,
					y = 28,
					x = 310,
					normal = {
						frame = true,
						path = "btn3_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn3_gre_c.png"
					},
					disable = {
						frame = true,
						path = "btn3_gre_g.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_warlock",
							y = 29,
							type = "label",
							x = 70,
							textId = 135587,
							color = var_0_3
						}
					}
				},
				{
					name = "btn_cancel",
					h = 58,
					type = "button",
					w = 140,
					zoomOnTouchDown = false,
					y = 28,
					x = 610,
					normal = {
						frame = true,
						path = "btn3_gre_a.png"
					},
					touched = {
						frame = true,
						path = "btn3_gre_c.png"
					},
					disable = {
						frame = true,
						path = "btn3_gre_g.png"
					},
					children = {
						{
							fontSize = 24,
							style = "label_warlock",
							y = 29,
							type = "label",
							x = 70,
							textId = 135588,
							color = var_0_3
						}
					}
				}
			}
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
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 135603,
			style = "label_warlock",
			width = 400,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_3
		}
	}
}

function var_0_8.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getSevenCatchActivity)
end

function var_0_8.updateNpcBlood(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.action.data

		arg_4_0.info = var_5_0

		arg_4_0.view.widgets.progress:setPercentage(100 * (var_5_0.totalBlood - var_5_0.haveBlood) / var_5_0.totalBlood)
		arg_4_0:addPhantom()
	end

	cmgr.sendRequest(var_4_0, actions.getSevenCatchActivity)
end

function var_0_8.updateBoxGold(arg_6_0)
	local function var_6_0(arg_7_0)
		local var_7_0 = arg_7_0.action.data

		if var_7_0.canOpenBox == 0 or var_7_0.receivedBoxNum == 1 or var_7_0.round == 7 then
			arg_6_0:showPanel(var_7_0)
		else
			arg_6_0.info = var_7_0
		end
	end

	cmgr.sendRequest(var_6_0, actions.getSevenCatchActivity)
end

function var_0_8.onGetSevenCatchReward(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		local var_9_0 = arg_8_0.boxTable[arg_8_1]

		if var_9_0 then
			local var_9_1 = tolua.cast(var_9_0.obj, "CCSprite")

			var_9_0.notOpen = false

			local var_9_2 = CCSprite:create(string.format("res/ui/activity/sevenCatch/qtmh_key_%d.png", arg_8_0.info.round + 1))

			arg_8_0.boxNode:addChild(var_9_2)
			var_9_2:setPosition(ccp(-460, -40))

			local var_9_3, var_9_4 = var_9_1:getPosition()
			local var_9_5 = CCArray:create()

			var_9_5:addObject(CCEaseSineOut:create(CCMoveTo:create(0.6, ccp(var_9_3, var_9_4))))
			var_9_5:addObject(CCCallFuncN:create(function()
				var_9_1:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/sevenCatch/qtmh_box_open_%d.png", arg_8_0.info.round + 1)):displayFrame())
				var_9_2:removeFromParentAndCleanup(true)

				arg_8_0.canTouch = true

				if arg_8_0.info.boxId == 0 then
					arg_8_0.boxPos = arg_8_1
				end

				arg_8_0:updateBoxGold()

				local var_10_0 = {}
				local var_10_1 = {}

				var_10_1.id = 100
				var_10_1.value = arg_9_0.action.data.tickets

				table.insert(var_10_0, var_10_1)
				globalAction_gotResource(var_10_0)
			end))

			local var_9_6 = CCSequence:create(var_9_5)

			var_9_2:runAction(var_9_6)
		end
	end

	if arg_8_0.info.boxId == 0 then
		cmgr.sendRequest(var_8_0, actions.getSevenCatchReward)

		arg_8_0.canTouch = false
	elseif arg_8_0.canOpenAgain then
		if not arg_8_0.boxTable[arg_8_1].notOpen then
			smgr.showTipTextGreen(language.get(135598))
		else
			messageBox.confirm(language.get(135599, arg_8_0.info.gold), function()
				cmgr.sendRequest(var_8_0, actions.getSevenCatchReward)

				arg_8_0.canTouch = false
			end)
		end
	else
		smgr.showTipTextGreen(language.get(135597))
	end
end

function var_0_8.onSevenCatchImpact(arg_12_0, arg_12_1)
	local function var_12_0(arg_13_0)
		if arg_12_0.armyTable[arg_12_1] and #arg_12_0.armyTable[arg_12_1] > 0 then
			arg_12_0:updateNpcBlood()
			arg_12_0:onBtnAttTap(arg_12_1)
		else
			arg_12_0.view.widgets["btn_att" .. arg_12_1]:setEnabled(false)

			arg_12_0.isImpacting[arg_12_1] = false

			if arg_12_0.isImpacting[1] == false and arg_12_0.isImpacting[2] == false and arg_12_0.isImpacting[3] == false then
				arg_12_0.showTalk = false

				arg_12_0:refresh()
			end
		end
	end

	cmgr.sendRequest(var_12_0, actions.sevenCatchImpact, arg_12_1)
end

function var_0_8.onPickUpPhantom(arg_14_0)
	local var_14_0 = arg_14_0.info.phantom

	local function var_14_1(arg_15_0)
		if var_14_0 > 0 then
			local var_15_0 = {}
			local var_15_1 = {}

			var_15_1.id = 41
			var_15_1.value = arg_14_0.info.phantom

			table.insert(var_15_0, var_15_1)
			globalAction_gotResource(var_15_0)

			arg_14_0.showTalk = true

			arg_14_0:refresh()
		end
	end

	if var_14_0 > 0 then
		cmgr.sendRequest(var_14_1, actions.pickUpPhantom, var_14_0)
	end
end

function var_0_8.onGiveUpGainAgain(arg_16_0)
	local function var_16_0(arg_17_0)
		arg_16_0:refresh()
	end

	messageBox.confirm(language.get(135589), function()
		cmgr.sendRequest(var_16_0, actions.giveUpGainAgain)
	end)
end

function var_0_8.onBtnAttTap(arg_19_0, arg_19_1)
	if arg_19_0.armyTable[arg_19_1] and #arg_19_0.armyTable[arg_19_1] > 0 then
		local var_19_0 = tolua.cast(table.remove(arg_19_0.armyTable[arg_19_1]), "CCSprite")

		if var_19_0 then
			arg_19_0.isImpacting[arg_19_1] = true

			var_19_0:stopAllActions()
			var_19_0:setDisplayFrame(tool.spriteFrameByName("army_1.png"))
			var_19_0:setScale(1.5)

			local var_19_1 = CCArray:create()

			var_19_1:addObject(CCMoveTo:create(0.15, ccp(458, 140)))
			var_19_1:addObject(CCCallFuncN:create(function()
				arg_19_0:showAttackEffect()

				if arg_19_0.info.npcs[arg_19_1].status == 1 then
					arg_19_0:onSevenCatchImpact(arg_19_1)
				else
					arg_19_0.view.widgets["btn_att" .. arg_19_1]:setEnabled(false)
				end

				var_19_0:removeFromParentAndCleanup(true)
			end))

			local var_19_2 = CCSequence:create(var_19_1)

			var_19_0:runAction(var_19_2)
		end
	end
end

function var_0_8.onBtnNpcTap(arg_21_0)
	if arg_21_0.info.phantom > 0 then
		arg_21_0:onPickUpPhantom()
	else
		local var_21_0 = arg_21_0.info.canOpenBox == 1 and arg_21_0.info.receivedBoxNum == 0

		arg_21_0.view.widgets.node_box:setVisible(var_21_0)

		if conf.language == "vie" then
			arg_21_0.view.widgets.spPhantomTips:setVisible(not var_21_0)
		end

		arg_21_0.view.widgets.node_catch:setVisible(not var_21_0)

		if var_21_0 then
			arg_21_0:showJailEffect()
		end
	end
end

function var_0_8.onBtnAgainTap(arg_22_0)
	arg_22_0.canOpenAgain = true

	arg_22_0.view.widgets.btn_again:setEnabled(false)

	for iter_22_0 = 1, #arg_22_0.boxTable do
		tolua.cast(arg_22_0.boxTable[iter_22_0].obj, "CCSprite"):removeAllChildrenWithCleanup(true)
	end

	CCDirector:sharedDirector():getScheduler():setTimeScale(2)
	arg_22_0:showBoxRotateEffect()
end

function var_0_8.addArmy(arg_23_0)
	if arg_23_0.armyNode then
		arg_23_0.armyNode:removeAllChildrenWithCleanup(true)
	else
		arg_23_0.armyNode = CCSpriteBatchNode:create("res/ui/activity/sevenCatch/army.png")

		arg_23_0.view.widgets.node_catch:addChild(arg_23_0.armyNode, 100)
	end

	arg_23_0.armyTable = {}

	if arg_23_0.info.npcs and #arg_23_0.info.npcs > 0 then
		for iter_23_0 = 1, 3 do
			arg_23_0.armyTable[iter_23_0] = {}

			local var_23_0 = 300 * iter_23_0 - 190
			local var_23_1 = 335
			local var_23_2 = arg_23_0.info.npcs[iter_23_0]
			local var_23_3 = math.floor(12 * var_23_2.haveNum / var_23_2.needNum)
			local var_23_4 = var_23_2.totalImpactTimes - var_23_2.haveImpactTimes

			for iter_23_1 = 1, var_23_4 do
				local var_23_5 = CCSprite:createWithSpriteFrameName("army_g.png")
				local var_23_6 = var_23_0 + (iter_23_1 - 1) % 4 * 40
				local var_23_7 = var_23_1 - math.floor((iter_23_1 - 1) / 4) * 45

				var_23_5:setPosition(ccp(var_23_6, var_23_7))
				arg_23_0.armyNode:addChild(var_23_5)
				table.insert(arg_23_0.armyTable[iter_23_0], var_23_5)

				if iter_23_1 <= var_23_3 then
					local var_23_8 = CCArray:create()

					for iter_23_2 = 1, 6 do
						local var_23_9 = CCSprite:createWithSpriteFrameName(string.format("army_%d.png", iter_23_2))

						var_23_8:addObject(var_23_9:displayFrame())
					end

					local var_23_10 = CCAnimation:createWithSpriteFrames(var_23_8, 0.1)
					local var_23_11 = CCAnimate:create(var_23_10)

					var_23_5:runAction(CCRepeatForever:create(var_23_11))
				end
			end
		end
	end
end

function var_0_8.addPhantom(arg_24_0)
	local var_24_0 = "res/ui/activity/sevenCatch/qqmh_bingfu.png"

	if arg_24_0.phantomNode then
		if #arg_24_0.phantomTable > arg_24_0.info.phantom then
			arg_24_0.phantomNode:removeAllChildrenWithCleanup(true)

			arg_24_0.phantomTable = {}
		end
	else
		arg_24_0.phantomNode = CCSpriteBatchNode:create(var_24_0)

		arg_24_0.view.widgets.node_catch:addChild(arg_24_0.phantomNode, 100)
	end

	arg_24_0.phantomTable = arg_24_0.phantomTable or {}

	local var_24_1 = arg_24_0.info.phantom - #arg_24_0.phantomTable

	for iter_24_0 = 1, var_24_1 do
		local var_24_2 = CCSprite:create(var_24_0)

		var_24_2:setScale(0.8)
		arg_24_0.phantomNode:addChild(var_24_2)
		table.insert(arg_24_0.phantomTable, var_24_2)

		local var_24_3 = math.random(260, 660)
		local var_24_4 = math.random(40, 140)

		var_24_2:setPosition(ccp(460, 200))
		var_24_2:runAction(CCEaseBounceOut:create(CCMoveTo:create(0.6, ccp(var_24_3, var_24_4))))
	end
end

function var_0_8.addBox(arg_25_0)
	if arg_25_0.boxNode then
		arg_25_0.boxNode:removeAllChildrenWithCleanup(true)
		arg_25_0.boxNode:stopAllActions()
		arg_25_0.boxNode:setRotation(0)
	else
		arg_25_0.boxNode = CCNode:create()

		arg_25_0.view.widgets.node_box:addChild(arg_25_0.boxNode, 200)
		arg_25_0.boxNode:setPosition(ccp(725, 265))
	end

	arg_25_0.boxTable = {}

	if arg_25_0.info.round == 6 then
		local var_25_0 = CCSprite:create(string.format("res/ui/activity/sevenCatch/qtmh_box_7.png"))

		var_25_0:setPosition(ccp(0, 0))
		arg_25_0.boxNode:addChild(var_25_0)
		table.insert(arg_25_0.boxTable, {
			notOpen = true,
			obj = var_25_0
		})
	else
		if arg_25_0.info.boxes and #arg_25_0.info.boxes > 0 then
			local function var_25_1(arg_26_0, arg_26_1)
				if arg_26_0.received == arg_26_1.received then
					return arg_26_0.id < arg_26_1.id
				else
					return arg_26_0.received > arg_26_1.received
				end
			end

			table.sort(arg_25_0.info.boxes, var_25_1)
		end

		local var_25_2 = arg_25_0.info.boxes and #arg_25_0.info.boxes or 6
		local var_25_3 = arg_25_0.info.receivedBoxNum == 1

		for iter_25_0 = 1, var_25_2 do
			local var_25_4
			local var_25_5 = true

			if arg_25_0.info.boxes then
				var_25_4 = arg_25_0.info.boxes[iter_25_0]
				var_25_5 = var_25_4.received == 0
			end

			local var_25_6 = 135 - (iter_25_0 - 1) * 60

			if arg_25_0.boxPos > 0 then
				var_25_6 = var_25_6 - (arg_25_0.boxPos - 1) * 60
			end

			local var_25_7 = var_25_5 and "qtmh_box_%d.png" or "qtmh_box_open_%d.png"
			local var_25_8 = CCSprite:create(string.format("res/ui/activity/sevenCatch/" .. var_25_7, 1 + arg_25_0.info.round))
			local var_25_9 = math.cos(math.rad(var_25_6)) * 120
			local var_25_10 = math.sin(math.rad(var_25_6)) * 120

			var_25_8:setPosition(ccp(var_25_9, var_25_10))
			arg_25_0.boxNode:addChild(var_25_8)
			table.insert(arg_25_0.boxTable, {
				obj = var_25_8,
				notOpen = var_25_5
			})

			if var_25_3 and var_25_5 and var_25_4 then
				local var_25_11 = CCStrokeLabelTTF:create(language.get(135601, var_25_4.tickets), "Thonburi-Bold", 20, 2)

				var_25_11:setColor(var_0_6)
				var_25_8:addChild(var_25_11)
				var_25_11:setPosition(ccp(47, 0))
			end
		end
	end
end

function var_0_8.showBoxRotateEffect(arg_27_0, arg_27_1)
	if arg_27_0.boxTable and #arg_27_0.boxTable == 6 then
		for iter_27_0 = 1, #arg_27_0.boxTable do
			local var_27_0 = tolua.cast(arg_27_0.boxTable[iter_27_0].obj, "CCSprite")
			local var_27_1 = CCEaseSineOut:create(CCRotateBy:create(2, -720))
			local var_27_2 = CCArray:create()

			var_27_2:addObject(CCScaleTo:create(0.5, 1.25))
			var_27_2:addObject(CCScaleTo:create(0.5, 1))

			local var_27_3 = CCRepeat:create(CCSequence:create(var_27_2), 2)
			local var_27_4 = CCArray:create()

			if arg_27_1 then
				var_27_0:setOpacity(0)
				var_27_4:addObject(CCFadeIn:create(0.5))
			end

			var_27_4:addObject(CCSpawn:createWithTwoActions(var_27_1, var_27_3))

			local var_27_5 = CCSequence:create(var_27_4)

			var_27_0:runAction(var_27_5)
		end

		local var_27_6 = CCEaseSineOut:create(CCRotateBy:create(2, 720))
		local var_27_7 = CCArray:create()

		var_27_7:addObject(CCScaleTo:create(0.5, 0.8))
		var_27_7:addObject(CCScaleTo:create(0.5, 1))

		local var_27_8 = CCRepeat:create(CCSequence:create(var_27_7), 2)
		local var_27_9 = CCArray:create()

		if arg_27_1 then
			var_27_9:addObject(CCDelayTime:create(0.5))
		end

		var_27_9:addObject(CCSpawn:createWithTwoActions(var_27_6, var_27_8))
		var_27_9:addObject(CCCallFuncN:create(function()
			arg_27_0.view.widgets.arrow2:setVisible(true)

			arg_27_0.canTouch = true

			CCDirector:sharedDirector():getScheduler():setTimeScale(1)
		end))

		local var_27_10 = CCSequence:create(var_27_9)

		arg_27_0.boxNode:runAction(var_27_10)
	end
end

function var_0_8.showAttackEffect(arg_29_0)
	local var_29_0 = CCArray:create()

	for iter_29_0 = 1, 5 do
		local var_29_1 = CCSprite:createWithSpriteFrameName(string.format("hitted4000%d.png", iter_29_0))

		var_29_0:addObject(var_29_1:displayFrame())
	end

	local var_29_2 = CCAnimation:createWithSpriteFrames(var_29_0, 0.1)
	local var_29_3 = CCAnimate:create(var_29_2)

	arg_29_0.view.widgets.npc:runAction(var_29_3)

	local var_29_4 = CCSprite:create()

	var_29_4:setPosition(ccp(458, 140))
	arg_29_0.view.widgets.panel:addChild(var_29_4, 200)

	local var_29_5 = CCArray:create()

	for iter_29_1 = 1, 8 do
		local var_29_6 = CCSprite:createWithSpriteFrameName(string.format("att_%d.png", iter_29_1))

		var_29_5:addObject(var_29_6:displayFrame())
	end

	local var_29_7 = CCAnimation:createWithSpriteFrames(var_29_5, 0.08)
	local var_29_8 = CCAnimate:create(var_29_7)

	var_29_4:runAction(var_29_8)
end

function var_0_8.showJailEffect(arg_30_0)
	arg_30_0.doorLayer:setPosition(ccp(0, 410))
	arg_30_0.doorLayer:setVisible(true)
	arg_30_0.doorLayer:stopAllActions()

	local var_30_0 = CCArray:create()

	var_30_0:addObject(CCEaseBounceOut:create(CCMoveTo:create(0.6, ccp(0, 0))))
	var_30_0:addObject(CCCallFuncN:create(function()
		arg_30_0.view.widgets.npcTipFrame2:setVisible(true)
	end))
	var_30_0:addObject(CCDelayTime:create(0.6))
	var_30_0:addObject(CCCallFuncN:create(function()
		roleDialogue.control.loadSpeak(1529)
	end))

	local var_30_1 = CCSequence:create(var_30_0)

	arg_30_0.doorLayer:runAction(var_30_1)
end

function var_0_8.showBoxEffect(arg_33_0)
	arg_33_0:addBox()

	if arg_33_0.info.round == 6 then
		arg_33_0.view.widgets.arrow2:setVisible(true)

		arg_33_0.canTouch = true
	else
		arg_33_0:showBoxRotateEffect(true)
	end
end

function var_0_8.showPanel(arg_34_0, arg_34_1)
	arg_34_0.info = arg_34_1

	if arg_34_1.round == 7 then
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

		user.activity.haveSevenCatchActivity = false

		return
	end

	local var_34_0 = arg_34_1.canOpenBox == 1
	local var_34_1 = var_34_0 and arg_34_1.receivedBoxNum > 0

	arg_34_0.view.widgets.node_box:setVisible(var_34_1)

	if conf.language == "vie" then
		arg_34_0.view.widgets.spPhantomTips:setVisible(not var_34_1)
	end

	arg_34_0.view.widgets.node_catch:setVisible(not var_34_1)
	arg_34_0.view.widgets.arrow1:setVisible(false)
	arg_34_0.view.widgets.arrow2:setVisible(false)

	if var_34_1 then
		arg_34_0.showTalk = true
	else
		if arg_34_0.boxNode then
			arg_34_0.boxNode:removeAllChildrenWithCleanup(true)
		end

		arg_34_0.canTouch = false
		arg_34_0.boxPos = 0

		arg_34_0.view.widgets.num1:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/sevenCatch/qtmh_word_qmh_%02d.png", arg_34_1.round + 1)):displayFrame())
		arg_34_0.view.widgets.info:setString(language.get(135585, arg_34_1.maxTickets))
		arg_34_0.view.widgets.progress:setPercentage(100 * (arg_34_1.totalBlood - arg_34_1.haveBlood) / arg_34_1.totalBlood)
		arg_34_0:addArmy()
		arg_34_0:addPhantom()

		local var_34_2 = arg_34_1.canOpenBox == 1 and arg_34_1.receivedBoxNum == 0 and arg_34_1.phantom == 0

		arg_34_0.view.widgets.arrow1:setVisible(var_34_2)
		arg_34_0.view.widgets.npcTipFrame1:setVisible(false)

		if arg_34_0.showTalk then
			local var_34_3 = var_34_2 and 135602 or 135586
			local var_34_4 = var_34_2 and 3 or 1

			arg_34_0.view.widgets.npcMsg1:setString(language.get(var_34_3))
			arg_34_0.view.widgets.npcTipFrame1:setVisible(true)
			arg_34_0.view.widgets.npcTipFrame1:stopAllActions()

			local var_34_5 = CCArray:create()

			var_34_5:addObject(CCDelayTime:create(var_34_4))
			var_34_5:addObject(CCCallFuncN:create(function()
				arg_34_0.view.widgets.npcTipFrame1:setVisible(false)
			end))
			arg_34_0.view.widgets.npcTipFrame1:runAction(CCSequence:create(var_34_5))
		end

		if arg_34_1.npcs and #arg_34_1.npcs > 0 then
			for iter_34_0 = 1, 3 do
				arg_34_0.view.widgets["btn_att" .. iter_34_0]:setVisible(false)
				arg_34_0.view.widgets["lbl_att" .. iter_34_0]:setVisible(false)
				arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 1]:setVisible(false)
				arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 2]:setVisible(false)
				arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 3]:setVisible(false)

				local var_34_6 = arg_34_1.npcs[iter_34_0]

				if var_34_6.status == 0 then
					arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 2]:setVisible(true)
					arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 3]:setVisible(true)
					arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 3]:setString(language.get(135584, var_34_6.needNum - var_34_6.haveNum))
				elseif var_34_6.status == 1 then
					arg_34_0.view.widgets["btn_att" .. iter_34_0]:setVisible(true)
					arg_34_0.view.widgets["btn_att" .. iter_34_0]:setEnabled(true)
					arg_34_0.view.widgets["lbl_att" .. iter_34_0]:setVisible(true)
					arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 1]:setVisible(true)
				elseif var_34_6.status == 2 then
					arg_34_0.view.widgets["btn_att" .. iter_34_0]:setVisible(true)
					arg_34_0.view.widgets["btn_att" .. iter_34_0]:setEnabled(false)
					arg_34_0.view.widgets["lbl_att" .. iter_34_0]:setVisible(true)
					arg_34_0.view.widgets["lbl_" .. iter_34_0 .. 1]:setVisible(true)
				end
			end
		end
	end

	if var_34_0 then
		arg_34_0.canOpenAgain = arg_34_1.receivedBoxNum > 1

		arg_34_0.view.widgets.num2:setDisplayFrame(CCSprite:create(string.format("res/ui/activity/sevenCatch/qtmh_title_digit_%d.png", arg_34_1.round + 1)):displayFrame())
		tool.fixNodePosByMid({
			arg_34_0.view.widgets.num2,
			arg_34_0.view.widgets.catchTitle
		}, 458)

		local var_34_7 = arg_34_1.boxId > 0

		arg_34_0.view.widgets.btn_again:setVisible(var_34_7)
		arg_34_0.view.widgets.btn_again:setEnabled(arg_34_1.receivedBoxNum == 1)
		arg_34_0.view.widgets.btn_cancel:setVisible(var_34_7)
		arg_34_0.view.widgets.npcMsg2:setString(language.get(var_0_1[arg_34_0.info.round]))
		arg_34_0.view.widgets.npcTipFrame2:setVisible(var_34_7)
		arg_34_0.doorLayer:setPosition(ccp(0, 0))
		arg_34_0.doorLayer:setVisible(var_34_7)

		if arg_34_1.boxes and #arg_34_1.boxes > 0 then
			arg_34_0:addBox()

			arg_34_0.canTouch = true
		end

		arg_34_0.view.widgets.arrow2:setVisible(arg_34_0.canOpenAgain)
	end

	arg_34_0.isImpacting = {
		false,
		false,
		false
	}
end

function var_0_8.ctor(arg_36_0, arg_36_1, arg_36_2)
	log.info("@@ 七擒孟获活动")
	rmgr.loadResource("res/ui/activity/sevenCatch/att.plist")
	rmgr.loadResource("res/ui/activity/sevenCatch/army.plist")
	rmgr.loadResource("res/ui/activity/sevenCatch/hitted.plist")

	arg_36_0.view = {}

	uiutil.initWidgets(arg_36_0.view, arg_36_0.layout)

	arg_36_0.leftTime = arg_36_0.view.widgets.leftTime

	if arg_36_1 then
		arg_36_0:addChild(arg_36_0.view.widgets.panel)
		arg_36_1:addChild(arg_36_0)
	end

	arg_36_0.view.widgets.bg_catch:setScaleY(1.09)
	arg_36_0.view.widgets.bg_info:setScaleX(2)
	arg_36_0.view.widgets.info:setScale(1.3)

	for iter_36_0 = 1, 3 do
		arg_36_0.view.widgets["lbl_" .. iter_36_0 .. 3]:setScale(0.8)
		arg_36_0.view.widgets["btn_att" .. iter_36_0]:setScaleX(0.45)
		arg_36_0.view.widgets["btn_att" .. iter_36_0]:setScaleY(0.75)
		arg_36_0.view.widgets["btn_att" .. iter_36_0]:addHandleOfControlEvent(function()
			log.info("btn_att" .. iter_36_0)
			arg_36_0:onBtnAttTap(iter_36_0)
		end, CCControlEventTouchUpInside)
	end

	arg_36_0.view.widgets.btn_tip:addHandleOfControlEvent(function()
		arg_36_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_36_0.view.widgets.btn_npc:addHandleOfControlEvent(function()
		log.info("btn_npc")
		arg_36_0:onBtnNpcTap()
	end, CCControlEventTouchUpInside)

	local var_36_0 = CCMoveBy:create(0.6, ccp(30, 0))
	local var_36_1 = CCEaseOut:create(var_36_0, 1)
	local var_36_2 = CCMoveBy:create(0.6, ccp(-30, 0))
	local var_36_3 = CCEaseIn:create(var_36_2, 1)
	local var_36_4 = CCArray:create()

	var_36_4:addObject(var_36_1)
	var_36_4:addObject(var_36_3)

	local var_36_5 = CCSequence:create(var_36_4)
	local var_36_6 = CCRepeatForever:create(tolua.cast(var_36_5, "CCActionInterval"))
	local var_36_7 = tolua.cast(var_36_6:copy(), "CCAction")

	arg_36_0.view.widgets.arrow1:runAction(var_36_6)
	arg_36_0.view.widgets.arrow2:runAction(var_36_7)
	arg_36_0.view.widgets.arrow1:setVisible(false)
	arg_36_0.view.widgets.arrow2:setVisible(false)

	local var_36_8 = CCLayerColor:create(ccc4(0, 255, 0, 0), 600, 395)
	local var_36_9 = CCScrollView:create(CCSizeMake(600, 395), var_36_8)

	var_36_9:setPosition(ccp(-3, 53))
	var_36_9:setTouchEnabled(false)
	arg_36_0.view.widgets.node_box:addChild(var_36_9, 100)

	arg_36_0.doorLayer = var_36_8

	local var_36_10 = CCSprite:create("res/ui/general/jailView/laofang_laofang_list.png")

	var_36_10:setScale(0.88)
	var_36_10:setAnchorPoint(ccp(0, 0))
	var_36_8:addChild(var_36_10)
	var_36_8:setVisible(false)
	arg_36_0.view.widgets.btn_again:addHandleOfControlEvent(function()
		log.info("btn_again")
		arg_36_0:onBtnAgainTap()
	end, CCControlEventTouchUpInside)
	arg_36_0.view.widgets.btn_cancel:addHandleOfControlEvent(function()
		log.info("btn_cancel")
		arg_36_0:onGiveUpGainAgain()
	end, CCControlEventTouchUpInside)
	arg_36_0:showPanel(arg_36_2)
	arg_36_0:refineLayout(arg_36_0.view.widgets)
end

function var_0_8.onEnter(arg_42_0)
	log.info("onEnter")

	arg_42_0.canTouch = false
	arg_42_0.showTalk = true
	arg_42_0.canOpenAgain = false
	arg_42_0.boxPos = 0
	arg_42_0.showBoxEffectRef = handler(arg_42_0, arg_42_0.showBoxEffect)

	eventManager.registerEvent("sevenCatch", arg_42_0.showBoxEffectRef)

	arg_42_0.touchBeganRef = handler(arg_42_0, arg_42_0.onTouchBegan)

	eventManager.registerEvent("globalOnTouchBegan", arg_42_0.touchBeganRef)
end

function var_0_8.onExit(arg_43_0)
	log.info("onExit")
	eventManager.unregisterEvent("sevenCatch", arg_43_0.showBoxEffectRef)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_43_0.touchBeganRef)
end

function var_0_8.onTouchBegan(arg_44_0, arg_44_1, arg_44_2)
	log.info("onTouchBegan", arg_44_1, arg_44_2)

	if arg_44_0.canTouch and arg_44_0.boxTable and #arg_44_0.boxTable > 0 then
		for iter_44_0 = 1, #arg_44_0.boxTable do
			local var_44_0 = tolua.cast(arg_44_0.boxTable[iter_44_0].obj, "CCSprite")

			if tool.checkIfTouch(var_44_0, arg_44_1, arg_44_2) then
				log.info("touch box", iter_44_0)
				arg_44_0:onGetSevenCatchReward(iter_44_0)

				return
			end
		end
	end
end

function var_0_8.showTip(arg_45_0, arg_45_1, arg_45_2)
	log.info("should show tips ")

	local var_45_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_45_0:registerScriptTouchHandler(function(arg_46_0, arg_46_1, arg_46_2)
		if arg_46_0 == CCTOUCHBEGAN then
			return true
		elseif arg_46_0 == CCTOUCHMOVED then
			return true
		elseif arg_46_0 == CCTOUCHENDED then
			pcall(var_45_0.removeFromParentAndCleanup, var_45_0, true)

			return true
		end
	end, false, true)
	var_45_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_45_0, 60000)

	local var_45_1 = 0
	local var_45_2 = 0
	local var_45_3 = {}

	uiutil.initWidgets(var_45_3, arg_45_0.tipFrame)
	var_45_0:addChild(var_45_3.widgets.tipFrame)

	local var_45_4, var_45_5 = tool.getPositionInScreen(arg_45_0.view.widgets.btn_tip)
	local var_45_6 = var_45_4 + 20
	local var_45_7 = var_45_5 - 20
	local var_45_8 = var_45_3.widgets.tipMsg:getContentSize().width
	local var_45_9 = var_45_3.widgets.tipMsg:getContentSize().height

	var_45_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_45_8 + 30, var_45_9 + 30))
	var_45_3.widgets.tipFrame:setPosition(ccp(var_45_6, var_45_7))
	var_45_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_45_3.widgets.tipFrame:setVisible(true)
end

function var_0_8.refineLayout(arg_47_0, arg_47_1)
	arg_47_1.num1:setPositionX(arg_47_1.catchLabel:getPositionX() - arg_47_1.catchLabel:getContentSize().width - 4)
end

return var_0_8
