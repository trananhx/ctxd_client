local var_0_0 = {
	"sdtj_expbuff_20.png",
	"sdtj_expbuff_30.png",
	"sdtj_expbuff_40.png",
	nil,
	"sdtj_expbuff_60.png",
	"sdtj_expbuff_70.png",
	"sdtj_expbuff_80.png",
	nil,
	"sdtj_expbuff_100.png",
	"sdtj_expbuff_110.png",
	"sdtj_expbuff_120.png"
}
local var_0_1 = require("res/native/offset").get("layer.activity.newSword")
local var_0_2 = {
	tags = {
		npc = 1000
	},
	bossPic = {
		董卓 = "dongzhuo",
		吕布 = "lvbu",
		张角 = "zhangjiao"
	},
	resText = {
		[15] = 15,
		[10] = 6,
		[14] = 100
	},
	layout = {
		name = "panel",
		type = "sprite",
		pic = {
			frame = true,
			path = "sdtj_view.png"
		},
		x = visibleSize.width * 0.5,
		y = visibleSize.height * 0.5 - 30,
		children = {
			{
				style = "button_tip",
				name = "tipButton",
				y = 466,
				type = "button",
				x = 846
			},
			{
				x = 458,
				name = "panel",
				y = 475,
				type = "sprite",
				pic = {
					path = "res/ui/sdtj/tjxypls_title.png"
				}
			},
			{
				fontSize = 22,
				name = "curLevel",
				y = 372,
				type = "label",
				x = 268,
				anchorPoint = ccp(0.5, 0),
				color = ccc3(226, 197, 165)
			},
			{
				fontSize = 24,
				type = "label",
				textId = 450036,
				x = 650 + (var_0_1.tipLabelOffsetX or 0),
				y = 490 + (var_0_1.tipLabelOffsetY or 0),
				anchorPoint = ccp(0, 0),
				color = ccc3(226, 197, 165)
			},
			{
				fontSize = 24,
				name = "leftTime",
				type = "label",
				x = 750,
				y = 450 + (var_0_1.timeLabelOffsetY or 0),
				anchorPoint = ccp(0.5, 0),
				color = ccc3(253, 98, 98)
			},
			{
				y = 360,
				name = "upgradeButton",
				h = 79,
				type = "button",
				w = 76,
				visible = false,
				x = 750,
				normal = {
					frame = true,
					path = "sdtj_btn_speed_a.png"
				},
				touched = {
					frame = true,
					path = "sdtj_btn_speed_c.png"
				}
			},
			{
				zoomOnTouchDown = true,
				name = "sdtjTipButton",
				h = 64,
				type = "button",
				w = 370,
				y = 364,
				x = 492,
				normal = {
					frame = true,
					path = "empty_panel.png"
				},
				touched = {
					frame = true,
					path = "empty_panel.png"
				}
			},
			{
				y = 360,
				x = 500,
				type = "sprite",
				pic = {
					frame = true,
					path = "sdtj_progress_bg2.png"
				},
				children = {
					{
						y = 9.5,
						name = "sdtj_progress_exp",
						type = "progressbar",
						x = 4,
						anchorPoint = ccp(0, 0.5),
						progressType = kCCProgressTimerTypeBar,
						pic = {
							frame = true,
							path = "sdtj_progress_bar2.png"
						}
					},
					{
						fontSize = 18,
						name = "expValue",
						y = 9.5,
						type = "label",
						x = 172
					}
				}
			},
			{
				fontSize = 20,
				y = 319,
				type = "label",
				x = 458,
				textId = 450042,
				color = colorQuality[4]
			},
			{
				style = "button_gre2",
				name = "challengeButton",
				y = 22,
				type = "button",
				visible = false,
				x = 458,
				label = {
					fontSize = 24,
					name = "challengeLabel",
					type = "label",
					textId = 450008,
					color = ccc3(217, 234, 196)
				}
			}
		}
	},
	npcPosition = {
		ccp(178, 168),
		ccp(458, 168),
		ccp(744, 168)
	},
	npcItem = {
		name = "npcNode",
		type = "node",
		children = {
			{
				style = "button_tip",
				name = "tipButton",
				y = 73,
				type = "button",
				x = 98
			},
			{
				y = 0,
				name = "npcButton",
				h = 72,
				type = "button",
				w = 72,
				zoomOnTouchDown = true,
				visible = false,
				x = 0,
				enable = false,
				normal = {
					frame = false,
					path = "res/ui/common/generalPic/generalPic_0.jpg"
				},
				touched = {
					frame = false,
					path = "res/ui/common/generalPic/generalPic_0.jpg"
				},
				children = {
					{
						x = 36,
						name = "npcPic",
						y = 36,
						type = "sprite",
						pic = {
							frame = false,
							path = "res/ui/common/generalPic/generalPic_0.jpg"
						}
					},
					{
						x = 36,
						y = 11,
						type = "sprite",
						pic = {
							frame = true,
							path = "gray_text_background.png"
						}
					},
					{
						fontSize = 22,
						name = "npcName",
						y = 11,
						type = "label",
						x = 36,
						anchorPoint = ccp(0.5, 0.5)
					}
				}
			},
			{
				y = 0,
				name = "buffButton",
				h = 72,
				type = "button",
				w = 72,
				visible = false,
				x = 0,
				enable = false,
				normal = {
					frame = true,
					path = "sdtj_expbuff_20.png"
				},
				touched = {
					frame = true,
					path = "sdtj_expbuff_20.png"
				},
				children = {
					{
						x = 36,
						name = "buffPic",
						y = 36,
						type = "sprite",
						pic = {
							frame = true,
							path = "sdtj_expbuff_20.png"
						}
					}
				}
			},
			{
				x = 0,
				name = "killProgressBarBg",
				y = -100,
				type = "sprite",
				visible = false,
				pic = {
					frame = true,
					path = "sdtj_progress_bg1.png"
				},
				children = {
					{
						y = 9.5,
						name = "killProgressBar",
						type = "progressbar",
						x = 5,
						anchorPoint = ccp(0, 0.5),
						progressType = kCCProgressTimerTypeBar,
						pic = {
							frame = true,
							path = "sdtj_progress_bar1.png"
						}
					},
					{
						fontSize = 18,
						name = "killValue",
						y = 9.5,
						type = "label",
						x = 77
					}
				}
			},
			{
				name = "npcTip",
				y = -100,
				type = "label",
				x = 0,
				anchorPoint = ccp(0.5, 0.5),
				fontSize = 22 + (var_0_1.npcTipFntSize or 0),
				color = ccc3(226, 197, 165)
			},
			{
				fontSize = 22,
				name = "topTip",
				y = 47,
				type = "label",
				x = 0,
				anchorPoint = ccp(0.5, 0.5),
				color = ccc3(114, 223, 55)
			}
		}
	},
	chanllengeNpc = {
		name = "chanllengeNode",
		type = "scrollview",
		bounceable = false,
		y = 50,
		x = 52,
		viewSize = CCSizeMake(813, 225),
		dirction = kCCScrollViewDirectionVertical,
		verticalFill = kCCTableViewFillTopDown,
		layer = {
			name = "containerLayer",
			type = "layerColor",
			color = ccc4(0, 0, 0, 0),
			children = {
				{
					x = 406.5,
					name = "",
					y = 112.5,
					type = "sprite",
					pic = {
						frame = true,
						path = "sdtj_view_up_picture.png"
					}
				},
				{
					opacity = 70,
					name = "chanllengeGeneral1",
					y = 50,
					type = "sprite",
					scale = 1.7,
					x = 150,
					pic = {
						frame = false,
						path = "res/ui/common/halfPic/halfPic_huangzhong.png"
					}
				},
				{
					y = 100,
					name = "killButton",
					h = 255,
					type = "button",
					w = 240,
					zoomOnTouchDown = true,
					visible = false,
					x = 406.5,
					normal = {
						frame = true,
						path = "empty_panel.png"
					},
					touched = {
						frame = true,
						path = "empty_panel.png"
					},
					children = {
						{
							x = 120,
							name = "chanllengeGeneral2",
							y = 127.5,
							type = "sprite",
							pic = {
								frame = false,
								path = "res/ui/common/halfPic/halfPic_huangzhong.png"
							}
						}
					}
				},
				{
					height = 225,
					name = "mask",
					x = 0,
					type = "layerColor",
					y = 0,
					width = 813,
					visible = false,
					color = ccc4(25, 25, 25, 150)
				},
				{
					x = 406.5,
					name = "killProgressBarBg",
					y = 210,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "sdtj_progress_bg1.png"
					},
					children = {
						{
							y = 9.5,
							name = "killProgressBar",
							type = "progressbar",
							x = 5,
							anchorPoint = ccp(0, 0.5),
							progressType = kCCProgressTimerTypeBar,
							pic = {
								frame = true,
								path = "sdtj_progress_bar1.png"
							}
						},
						{
							fontSize = 18,
							name = "killValue",
							y = 9.5,
							type = "label",
							x = 77
						}
					}
				},
				{
					y = 150,
					name = "bossNameSprite",
					visible = false,
					type = "sprite",
					x = 284.5
				},
				{
					name = "bossKilledSprite",
					y = 150,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/common/text/sdtj/tjsd_tit_bdb.png"
					},
					x = 465.5 + (var_0_1.bossKilledOffsetX or 0)
				},
				{
					x = 406.5,
					name = "overSprite",
					y = 90,
					type = "sprite",
					visible = false,
					pic = {
						frame = false,
						path = "res/ui/common/text/sdtj/tjsd_tit_hdjs.png"
					}
				},
				{
					fontSize = 22,
					name = "reChanllengeLabel",
					y = 67,
					type = "label",
					visible = false,
					x = 406.5,
					color = ccc3(253, 98, 98)
				},
				{
					style = "button_gre2",
					name = "reChanllengeButton",
					y = 27,
					type = "button",
					visible = false,
					x = 406.5,
					label = {
						fontSize = 24,
						textId = 450013,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					style = "button_gre2",
					name = "reChanllengeButtonGoon",
					y = 27,
					type = "button",
					visible = false,
					x = 406.5,
					label = {
						fontSize = 24,
						textId = 450018,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				},
				{
					x = 500,
					name = "goldSprite",
					y = 27,
					type = "sprite",
					visible = false,
					pic = {
						frame = true,
						path = "res_icon_19_small.png"
					},
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					text = "",
					name = "goldLabel",
					y = 32,
					type = "label",
					style = "label_yellowish_22",
					x = 532,
					anchorPoint = ccp(0.5, 0.5)
				},
				{
					style = "button_gre2",
					name = "close",
					y = 27,
					type = "button",
					visible = false,
					x = 406.5,
					label = {
						fontSize = 24,
						textId = 450014,
						type = "label",
						color = ccc3(217, 234, 196)
					}
				}
			}
		}
	},
	box = {
		y = 0,
		name = "box",
		h = 118,
		type = "button",
		w = 117,
		x = 0,
		normal = {
			frame = true,
			path = "sdtj_icon_box.png"
		},
		touched = {
			frame = true,
			path = "sdtj_icon_box.png"
		}
	},
	effectLayer = {
		name = "effectNode",
		type = "scrollview",
		bounceable = false,
		y = 50,
		x = 52,
		viewSize = CCSizeMake(813, 225),
		dirction = kCCScrollViewDirectionVertical,
		verticalFill = kCCTableViewFillTopDown,
		layer = {
			name = "containerLayer",
			type = "layerColor",
			color = ccc4(0, 0, 0, 0)
		}
	},
	close = function()
		local var_1_0 = smgr.getLayer("topLayer")

		tool.safeRemoveChildByTag(var_1_0, s_windows.tag.activity)
	end
}

function var_0_2.onGetBuff(arg_2_0)
	local function var_2_0(arg_3_0)
		var_0_2.refresh()
	end

	cmgr.sendRequest(var_2_0, actions.sdtjGetBuff, arg_2_0)
end

function var_0_2.onUpgrade(arg_4_0)
	local function var_4_0(arg_5_0)
		var_0_2.handlerUpgrade(arg_5_0)
	end

	local function var_4_1()
		cmgr.sendRequest(var_4_0, actions.sdtjUpgrade)
	end

	local function var_4_2()
		return
	end

	if arg_4_0 > 0 then
		messageBox.confirm(language.get(450002, arg_4_0), var_4_1, language.get(10001), var_4_2)
	else
		var_4_1()
	end
end

function var_0_2.handlerUpgrade(arg_8_0)
	local var_8_0 = CCSprite:create()
	local var_8_1 = rmgr.getAnimation("sdtj_swordFire")
	local var_8_2 = CCAnimation:createWithSpriteFrames(var_8_1, 0.08)
	local var_8_3 = CCAnimate:create(var_8_2)

	local function var_8_4()
		var_0_2.view.widgets.panel:removeChild(var_8_0, true)
	end

	local var_8_5 = CCArray:create()

	var_8_5:addObject(CCRepeat:create(var_8_3, 3))
	var_8_5:addObject(CCCallFuncN:create(var_8_4))
	var_8_0:runAction(CCSequence:create(var_8_5))
	var_8_0:setPosition(ccp(458, 384))
	var_0_2.view.widgets.panel:addChild(var_8_0)

	local var_8_6 = arg_8_0.action.data.exp

	if var_8_6 and var_8_6 > 0 then
		local var_8_7 = "res_title_6.png"

		if user.player.gemKit then
			var_8_7 = "res_title_jnjy.png"
		end

		local var_8_8 = CCSprite:create("res/ui/common/text/resource/" .. var_8_7)
		local var_8_9 = CCSprite:createWithSpriteFrameName("res_plus.png")
		local var_8_10 = CCLabelAtlas:create(tostring(var_8_6), "res/ui/common/number/get_numb.png", 29, 46, 48)

		var_8_10:setAnchorPoint(ccp(0.5, 0.5))

		local var_8_11 = createRichNode({
			var_8_8,
			var_8_9,
			var_8_10
		}, 0.5)

		var_8_11:setPosition(ccp(458, 384))
		var_0_2.view.widgets.panel:addChild(var_8_11)

		local function var_8_12()
			var_0_2.view.widgets.panel:removeChild(var_8_11, true)
		end

		local var_8_13 = CCArray:create()

		var_8_13:addObject(CCMoveBy:create(1, ccp(0, 10)))
		var_8_13:addObject(CCCallFuncN:create(var_8_12))
		var_8_11:runAction(CCSequence:create(var_8_13))
	end

	var_0_2.refresh()
end

function var_0_2.showEffect()
	var_0_2.needShowChanllengeAnim = false

	local var_11_0 = {}

	uiutil.initWidgets(var_11_0, var_0_2.effectLayer)
	var_0_2.view.widgets.panel:addChild(var_11_0.widgets.effectNode, 1000)

	local var_11_1 = CCSprite:create()

	var_11_1:setPosition(ccp(406.5, 112.5))

	local var_11_2 = CCLayerColor:create(ccc4(22, 16, 13, 100), 813, 112.5)

	var_11_2:setPosition(ccp(0, 112.5))

	local var_11_3 = CCLayerColor:create(ccc4(22, 16, 13, 100), 813, 112.5)

	var_11_3:setPosition(ccp(0, 0))

	local var_11_4 = rmgr.getAnimation("flash_light")
	local var_11_5 = CCAnimation:createWithSpriteFrames(var_11_4, 0.08)
	local var_11_6 = CCAnimate:create(var_11_5)

	local function var_11_7()
		var_11_0.widgets.effectNode:removeFromParentAndCleanup(true)
	end

	local function var_11_8()
		local var_13_0 = rmgr.getSpeedEffectAnimation()
		local var_13_1 = CCAnimation:createWithSpriteFrames(var_13_0, 0.08)
		local var_13_2 = CCAnimate:create(var_13_1)
		local var_13_3 = CCSprite:create()

		var_13_3:runAction(CCSequence:createWithTwoActions(var_13_2, CCCallFuncN:create(var_11_7)))
		var_13_3:setPosition(ccp(406.5, 112.5))
		var_11_0.widgets.containerLayer:addChild(var_13_3)
	end

	local function var_11_9()
		var_11_2:removeFromParentAndCleanup(true)
		var_11_3:removeFromParentAndCleanup(true)
		var_11_8()
	end

	local function var_11_10()
		var_11_1:removeFromParentAndCleanup(true)
		var_11_2:runAction(CCSequence:createWithTwoActions(CCMoveBy:create(1, ccp(0, 112.5)), CCCallFuncN:create(var_11_9)))
		var_11_3:runAction(CCMoveBy:create(1, ccp(0, -112.5)))
	end

	local var_11_11 = CCCallFunc:create(var_11_10)
	local var_11_12 = CCSequence:createWithTwoActions(var_11_6, var_11_11)

	var_11_1:runAction(var_11_12)
	var_11_0.widgets.containerLayer:addChild(var_11_2)
	var_11_0.widgets.containerLayer:addChild(var_11_3)
	var_11_0.widgets.containerLayer:addChild(var_11_1)
end

function var_0_2.refresh()
	local function var_16_0(arg_17_0)
		var_0_2.showPanel(arg_17_0.action.data)
	end

	cmgr.sendRequest(var_16_0, actions.getNewSwordActivity)
end

function var_0_2.handlerKillNpc(arg_18_0, arg_18_1)
	log.info("@@ 斩杀npc", arg_18_1)

	local var_18_0

	if var_0_2.npcPosition[arg_18_1] then
		var_18_0 = var_0_2.npcPosition[arg_18_1]
	else
		var_18_0 = ccp(458, 150)
	end

	local var_18_1 = var_0_2.view.widgets.panel:convertToWorldSpace(var_18_0)

	globalAction_gotResource({
		{
			id = 6,
			value = arg_18_0.action.data.exp
		}
	}, var_18_1)

	local var_18_2 = CCSprite:create()

	var_18_2:setPosition(var_18_0)

	local var_18_3 = rmgr.getAnimation("kill_effect")
	local var_18_4 = CCAnimation:createWithSpriteFrames(var_18_3, 0.03)
	local var_18_5 = CCAnimate:create(var_18_4)

	local function var_18_6()
		var_18_2:removeFromParentAndCleanup(true)
	end

	local var_18_7 = CCCallFunc:create(var_18_6)
	local var_18_8 = CCSequence:createWithTwoActions(var_18_5, var_18_7)

	var_18_2:runAction(var_18_8)
	var_0_2.view.widgets.panel:addChild(var_18_2, 100)
	var_0_2.refresh()
end

function var_0_2.getBuffEffect(arg_20_0)
	if var_0_2.npcPosition[arg_20_0] then
		local var_20_0 = var_0_2.npcPosition[arg_20_0]
		local var_20_1 = CCSprite:create("res/ui/common/text/sdtj/tjsd_tit_hdxbuff.png")

		var_20_1:setPosition(var_20_0)

		local function var_20_2()
			var_20_1:removeFromParentAndCleanup(true)
		end

		local var_20_3 = CCCallFunc:create(var_20_2)
		local var_20_4 = CCSequence:createWithTwoActions(CCMoveBy:create(1, ccp(0, 50)), var_20_3)

		var_20_1:runAction(var_20_4)
		var_0_2.view.widgets.panel:addChild(var_20_1, 100)
	end
end

function var_0_2.killNpc(arg_22_0, arg_22_1)
	local function var_22_0(arg_23_0)
		var_0_2.handlerKillNpc(arg_23_0, arg_22_1)
	end

	cmgr.sendRequest(var_22_0, actions.newSwordKillNpc, arg_22_0, 0)
end

function var_0_2.chanllenge()
	local function var_24_0(arg_25_0)
		var_0_2.needShowChanllengeAnim = true

		var_0_2.refresh()
	end

	cmgr.sendRequest(var_24_0, actions.sdtjChanllenge)
end

function var_0_2.showNpc(arg_26_0)
	local var_26_0 = {}

	uiutil.initWidgets(var_26_0, var_0_2.npcItem)

	local function var_26_1()
		var_0_2.showNpcTip(arg_26_0)
	end

	var_26_0.widgets.tipButton:addHandleOfControlEvent(var_26_1, CCControlEventTouchUpInside)

	if var_0_2.npcPosition[arg_26_0.npcNum] then
		var_26_0.widgets.npcNode:setPosition(var_0_2.npcPosition[arg_26_0.npcNum])
	end

	if arg_26_0.buffIsLight ~= nil then
		var_26_0.widgets.buffButton:setVisible(true)

		local var_26_2 = var_0_0[arg_26_0.npcId]

		var_26_0.widgets.buffPic:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_26_2):displayFrame())

		if arg_26_0.buffIsLight == false then
			local var_26_3 = GraySprite:createWithSpriteFrameName(var_26_2)

			var_26_3:setPosition(ccp(var_26_3:getContentSize().width * 0.5, var_26_3:getContentSize().height * 0.5))
			var_26_0.widgets.buffButton:addChild(var_26_3)
			var_26_0.widgets.npcTip:setString(language.get(450004, arg_26_0.buff))
			var_26_0.widgets.npcTip:setColor(colorQuality[0])
		elseif arg_26_0.canGetBuff then
			local function var_26_4(arg_28_0, arg_28_1)
				local var_28_0 = tolua.cast(arg_28_1, "CCControlButton")
				local var_28_1 = tolua.cast(var_28_0:getUserObject(), "CCString"):getCString()

				var_0_2.getBuffEffect(arg_26_0.npcNum)
				var_0_2.onGetBuff(var_28_1)
			end

			local var_26_5 = CCString:create(tostring(arg_26_0.npcId))

			var_26_0.widgets.buffButton:setUserObject(var_26_5)
			var_26_0.widgets.buffButton:addHandleOfControlEvent(var_26_4, CCControlEventTouchUpInside)
			var_26_0.widgets.buffButton:setEnabled(true)

			local var_26_6 = CCSprite:create()
			local var_26_7 = rmgr.getAnimation("sdtj_itemLight")
			local var_26_8 = CCAnimation:createWithSpriteFrames(var_26_7, 0.08)
			local var_26_9 = CCAnimate:create(var_26_8)

			var_26_6:runAction(CCRepeatForever:create(var_26_9))
			var_26_0.widgets.npcNode:addChild(var_26_6)
			var_26_0.widgets.npcTip:setString(language.get(450006))
			var_26_0.widgets.npcTip:setColor(ccc3(114, 223, 55))
		else
			var_26_0.widgets.npcTip:setString(language.get(450004, arg_26_0.buff))
			var_26_0.widgets.topTip:setString(language.get(450007))
		end
	else
		var_26_0.widgets.npcButton:setVisible(true)

		local var_26_10 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_26_0.pic))

		var_26_0.widgets.npcPic:setDisplayFrame(var_26_10:displayFrame())

		if arg_26_0.canKill then
			local function var_26_11(arg_29_0, arg_29_1)
				local var_29_0 = tolua.cast(arg_29_1, "CCControlButton")
				local var_29_1 = tolua.cast(var_29_0:getUserObject(), "CCString"):getCString()

				var_0_2.killNpc(var_29_1, arg_26_0.npcNum)
			end

			local var_26_12 = CCString:create(tostring(arg_26_0.npcId))

			var_26_0.widgets.npcButton:setUserObject(var_26_12)
			var_26_0.widgets.npcButton:addHandleOfControlEvent(var_26_11, CCControlEventTouchUpInside)
			var_26_0.widgets.npcButton:setEnabled(true)
			var_26_0.widgets.npcName:setString(language.get(450003))
			var_26_0.widgets.killProgressBarBg:setVisible(true)
			var_26_0.widgets.killProgressBar:setPercentage((arg_26_0.npcMaxNum - arg_26_0.npcCurNum) / arg_26_0.npcMaxNum * 100)
			var_26_0.widgets.killValue:setString(string.format("%s/%s", arg_26_0.npcMaxNum - arg_26_0.npcCurNum, arg_26_0.npcMaxNum))
		else
			var_26_0.widgets.npcName:setString(tostring(arg_26_0.npcName))
			var_26_0.widgets.npcTip:setString(language.get(450031, arg_26_0.npcCondition))
		end
	end

	var_0_2.view.widgets.panel:addChild(var_26_0.widgets.npcNode, 0, var_0_2.tags.npc)

	if var_0_2.needShowChanllengeAnim then
		var_0_2.showEffect()
	end
end

function var_0_2.showChanllenge(arg_30_0, arg_30_1)
	local var_30_0 = {}

	uiutil.initWidgets(var_30_0, var_0_2.chanllengeNpc)
	var_0_2.view.widgets.panel:addChild(var_30_0.widgets.chanllengeNode, 0, var_0_2.tags.npc)

	local var_30_1 = var_0_2.bossPic[arg_30_0.npcName]

	if var_30_1 then
		local var_30_2 = CCSprite:create(string.format("res/ui/common/halfPic/halfPic_%s.png", var_30_1))

		var_30_0.widgets.chanllengeGeneral1:setDisplayFrame(var_30_2:displayFrame())
		var_30_0.widgets.chanllengeGeneral2:setDisplayFrame(var_30_2:displayFrame())
	end

	if var_0_2.needShowChanllengeAnim then
		var_0_2.showEffect()
	end

	if arg_30_0.boxes and #arg_30_0.boxes > 0 then
		log.info("@@ 件箱子")
		var_30_0.widgets.mask:setVisible(true)

		for iter_30_0, iter_30_1 in pairs(arg_30_0.boxes) do
			var_0_2.boxNum = var_0_2.boxNum + iter_30_1.boxNum

			for iter_30_2 = 1, iter_30_1.boxNum do
				local var_30_3 = {}

				uiutil.initWidgets(var_30_3, var_0_2.box)
				var_30_0.widgets.containerLayer:addChild(var_30_3.widgets.box)

				local var_30_4 = math.random(60, 750)
				local var_30_5 = math.random(60, 150)

				var_30_3.widgets.box:setPosition(ccp(var_30_4, var_30_5))

				if var_0_2.resText and iter_30_1.rewardType and var_0_2.resText[iter_30_1.rewardType] then
					local var_30_6 = CCSprite:createWithSpriteFrameName(string.format("res_icon_%s.png", var_0_2.resText[iter_30_1.rewardType]))

					var_30_6:setPosition(ccp(58.5, 59))
					var_30_3.widgets.box:addChild(var_30_6)
				end

				local function var_30_7(arg_31_0, arg_31_1)
					local function var_31_0(arg_32_0)
						local var_32_0 = arg_32_0.action.data
						local var_32_1 = var_30_0.widgets.containerLayer:convertToWorldSpace(ccp(var_30_4, var_30_5))

						if var_0_2.resText and var_32_0.rewardType and var_0_2.resText[var_32_0.rewardType] then
							globalAction_gotResource({
								{
									id = var_0_2.resText[var_32_0.rewardType],
									value = var_32_0.rewardNum
								}
							}, var_32_1)
						end

						tolua.cast(arg_31_1, "CCControlButton"):removeFromParentAndCleanup(true)

						var_0_2.boxNum = var_0_2.boxNum - 1

						if var_0_2.boxNum <= 0 then
							var_0_2.refresh()
						end
					end

					cmgr.sendRequest(var_31_0, actions.newSwordKillNpc, iter_30_1.rewardType, 1)
				end

				var_30_3.widgets.box:addHandleOfControlEvent(var_30_7, CCControlEventTouchUpInside)
			end
		end
	end

	if var_0_2.boxNum <= 0 then
		if arg_30_0.canKill then
			log.info("@@  斩杀boss")

			local function var_30_8()
				var_0_2.killNpc(arg_30_0.npcId, arg_30_0.npcNum)
			end

			var_30_0.widgets.killProgressBarBg:setVisible(true)
			var_30_0.widgets.killProgressBar:setPercentage((arg_30_0.npcMaxNum - arg_30_0.npcCurNum) / arg_30_0.npcMaxNum * 100)
			var_30_0.widgets.killValue:setString(string.format("%s/%s", arg_30_0.npcMaxNum - arg_30_0.npcCurNum, arg_30_0.npcMaxNum))
			var_30_0.widgets.killButton:setVisible(true)
			var_30_0.widgets.killButton:addHandleOfControlEvent(var_30_8, CCControlEventTouchUpInside)
			var_30_0.widgets.killButton:setEnabled(true)
		elseif arg_30_1 then
			log.info("@@ 活动结束")
			var_30_0.widgets.bossNameSprite:setVisible(true)
			var_30_0.widgets.bossKilledSprite:setVisible(true)
			var_30_0.widgets.bossNameSprite:setDisplayFrame(CCSprite:create(string.format("res/ui/common/text/sdtj/tjsd_tit_%s.png", var_30_1)):displayFrame())
			var_30_0.widgets.overSprite:setVisible(true)
			tool.fixNodePosByMid({
				var_30_0.widgets.bossNameSprite,
				var_30_0.widgets.bossKilledSprite
			}, 406.5)

			local function var_30_9()
				var_0_2.close()
			end

			var_30_0.widgets.close:setVisible(true)
			var_30_0.widgets.close:addHandleOfControlEvent(var_30_9, CCControlEventTouchUpInside)
		else
			log.info("@@ 挑战结束")
			var_30_0.widgets.bossNameSprite:setVisible(true)
			var_30_0.widgets.bossKilledSprite:setVisible(true)
			var_30_0.widgets.bossNameSprite:setDisplayFrame(CCSprite:create(string.format("res/ui/common/text/sdtj/tjsd_tit_%s.png", var_30_1)):displayFrame())
			var_30_0.widgets.goldLabel:setString(tostring(var_0_2.sword2ChanllengeGold))
			tool.fixNodePosByMid({
				var_30_0.widgets.bossNameSprite,
				var_30_0.widgets.bossKilledSprite
			}, 406.5)

			if tonumber(var_0_2.nextDayLeftTime) < 0 then
				var_30_0.widgets.goldLabel:setVisible(false)
				var_30_0.widgets.reChanllengeLabel:setVisible(false)
				var_30_0.widgets.reChanllengeButtonGoon:setVisible(true)

				local function var_30_10(arg_35_0)
					var_0_2.needShowChanllengeAnim = true

					var_0_2.refresh()
				end

				local function var_30_11()
					cmgr.sendRequest(var_30_10, actions.sdtjChhanllge, 0)
				end

				var_30_0.widgets.reChanllengeButtonGoon:addHandleOfControlEvent(var_30_11, CCControlEventTouchUpInside)
			else
				local var_30_12 = math.floor(var_0_2.nextDayLeftTime / 60000)
				local var_30_13 = math.floor(var_30_12 / 60)
				local var_30_14 = var_30_12 % 60

				var_30_0.widgets.reChanllengeLabel:setString(language.get(450010, var_30_13, var_30_14))
				var_30_0.widgets.reChanllengeLabel:setVisible(true)
				var_30_0.widgets.reChanllengeButton:setVisible(true)

				local function var_30_15()
					var_0_2.reChanllenge(var_0_2.sword2ChanllengeGold)
				end

				var_30_0.widgets.reChanllengeButton:addHandleOfControlEvent(var_30_15, CCControlEventTouchUpInside)
				var_30_0.widgets.goldLabel:setVisible(true)
				var_30_0.widgets.goldSprite:setVisible(true)
			end
		end
	end
end

function var_0_2.reChanllenge(arg_38_0)
	local function var_38_0(arg_39_0)
		var_0_2.needShowChanllengeAnim = true

		var_0_2.refresh()
	end

	local function var_38_1()
		cmgr.sendRequest(var_38_0, actions.sdtjChhanllge, 1)
	end

	local function var_38_2()
		return
	end

	if arg_38_0 > 0 then
		messageBox.confirm(language.get(450011, arg_38_0), var_38_1, language.get(10001), var_38_2)
	else
		var_38_1()
	end
end

function var_0_2.showPanel(arg_42_0)
	var_0_2.nextDayLeftTime = arg_42_0.nextDayLeftTime
	var_0_2.sword2ChanllengeGold = arg_42_0.sword2ChanllengeGold or 0

	var_0_2.view.widgets.sdtj_progress_exp:setPercentage(arg_42_0.curExp / arg_42_0.maxExp * 100)
	var_0_2.view.widgets.expValue:setString(string.format("%s/%s", arg_42_0.curExp, arg_42_0.maxExp))
	var_0_2.view.widgets.curLevel:setString(language.get(450001, arg_42_0.curLv))

	local function var_42_0()
		log.info("@@ 显示tip")
		var_0_2.showUpgradeTip()
	end

	var_0_2.view.widgets.sdtjTipButton:addHandleOfControlEvent(var_42_0, CCControlEventTouchUpInside)

	if arg_42_0.swordGold and arg_42_0.swordGold > 0 then
		local var_42_1 = CCString:create(tostring(arg_42_0.swordGold))

		var_0_2.view.widgets.upgradeButton:setUserObject(var_42_1)
		var_0_2.view.widgets.upgradeButton:setVisible(true)

		local function var_42_2(arg_44_0, arg_44_1)
			local var_44_0 = tolua.cast(arg_44_1, "CCControlButton")
			local var_44_1 = tolua.cast(var_44_0:getUserObject(), "CCString"):getCString()
			local var_44_2 = tonumber(var_44_1)

			var_0_2.onUpgrade(var_44_2)
		end

		var_0_2.view.widgets.upgradeButton:addHandleOfControlEvent(var_42_2, CCControlEventTouchUpInside)
	else
		var_0_2.view.widgets.upgradeButton:setVisible(false)
	end

	tool.safeRemoveChildByTag(var_0_2.view.widgets.panel, var_0_2.tags.npc)

	local var_42_3 = true

	if arg_42_0.npcs and #arg_42_0.npcs == 1 then
		var_0_2.showChanllenge(arg_42_0.npcs[1], arg_42_0.isAllOver)
	else
		for iter_42_0, iter_42_1 in pairs(arg_42_0.npcs) do
			var_42_3 = iter_42_1.canGetBuff or false

			var_0_2.showNpc(iter_42_1)
		end
	end

	if arg_42_0.canChallenge and not var_42_3 then
		local function var_42_4()
			var_0_2.chanllenge()
		end

		var_0_2.view.widgets.challengeButton:setVisible(true)
		var_0_2.view.widgets.challengeButton:addHandleOfControlEvent(var_42_4, CCControlEventTouchUpInside)
	else
		var_0_2.view.widgets.challengeButton:setVisible(false)
	end
end

function var_0_2.ctor(arg_46_0, arg_46_1)
	log.info("@@ 神刀界面")
	rmgr.loadResource("res/ui/sdtj/sdtj.plist")

	var_0_2.needShowChanllengeAnim = false
	var_0_2.boxNum = 0
	var_0_2.nextDayLeftTime = 0
	var_0_2.view = {}

	uiutil.initWidgets(var_0_2.view, var_0_2.layout)

	local function var_46_0()
		var_0_2.showTip()
	end

	var_0_2.view.widgets.tipButton:addHandleOfControlEvent(var_46_0, CCControlEventTouchUpInside)
	var_0_2.showPanel(arg_46_1)
	tool.fixLabelByWidth(var_0_2.view.widgets.challengeLabel, 110)

	if arg_46_0 then
		arg_46_0:addChild(var_0_2.view.widgets.panel)
	end
end

function var_0_2.showTip()
	local var_48_0 = require("lua/component/TipPanel")

	var_48_0:create(var_0_2.view.widgets.panel, {
		language.get(450039),
		language.get(450040),
		language.get(450023),
		language.get(450024),
		language.get(450041)
	})
	var_48_0:setPosition(ccp(846 + (var_0_1.tipFrameOffsetX or 0), 466))
end

function var_0_2.onTouchBegin()
	return
end

function var_0_2.onTouchMove()
	return
end

function var_0_2.onTouchEnd()
	return
end

function var_0_2.showNpcTip(arg_52_0)
	local var_52_0 = require("lua/component/TipPanel")
	local var_52_1 = {
		arg_52_0.npcName,
		language.get(450015, arg_52_0.killExp)
	}

	if arg_52_0.buff then
		table.insert(var_52_1, language.get(450016, arg_52_0.buff))
	end

	var_52_0:create(var_0_2.view.widgets.panel, var_52_1, 290)

	if var_0_2.npcPosition[arg_52_0.npcNum] then
		log.info("@@ npc ", var_0_2.npcPosition[arg_52_0.npcNum].x, var_0_2.npcPosition[arg_52_0.npcNum].y)
		var_52_0:setPosition(ccp(var_0_2.npcPosition[arg_52_0.npcNum].x + 98, var_0_2.npcPosition[arg_52_0.npcNum].y + 73))
	end
end

function var_0_2.showUpgradeTip()
	local var_53_0 = require("lua/component/TipPanel")
	local var_53_1 = {
		language.get(450038)
	}

	var_53_0:create(var_0_2.view.widgets.panel, var_53_1)
	var_53_0:setPosition(ccp(492, 364))
end

return var_0_2
