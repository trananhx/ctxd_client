local var_0_0 = {
	[125] = {
		txt = 491047,
		type = 10041
	},
	[216] = {
		txt = 10111,
		type = 216
	}
}
local var_0_1 = colorQuality[0]
local var_0_2 = tool.hexToRgb("#D9EDC5")
local var_0_3 = ccc3(0, 180, 0)
local var_0_4 = colorQuality[5]
local var_0_5 = tool.hexToRgb("#FFCC00")
local var_0_6 = colorQuality[2]
local var_0_7 = class("Pay0805", function()
	return createBaseLayer()
end)

var_0_7.layout = {
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
				path = "res/ui/activity/pay0805/csd_bg.jpg"
			},
			children = {
				{
					y = 480,
					name = "title",
					type = "sprite",
					x = 458,
					pic = {
						path = "res/ui/activity/pay0805/csd_title.png"
					}
				},
				{
					fontSize = 25,
					name = "leftTime",
					y = 470,
					type = "label",
					x = 780,
					color = var_0_4
				},
				{
					y = 412,
					type = "sprite",
					x = 3,
					anchorPoint = ccp(0, 0.5),
					pic = {
						path = "res/ui/activity/pay0805/csd_word_di.png"
					},
					children = {
						{
							fontSize = 20,
							name = "gold",
							y = 23,
							type = "label",
							x = 3,
							color = var_0_2,
							anchorPoint = ccp(0, 0.5)
						},
						{
							zoomOnTouchDown = true,
							name = "btn_pay",
							h = 34,
							type = "button",
							w = 34,
							y = 23,
							x = 270,
							normal = {
								path = "res/ui/activity/pay0805/csd_btn_add.png"
							},
							touched = {
								path = "res/ui/activity/pay0805/csd_btn_add_c.png"
							}
						}
					}
				},
				{
					y = 190,
					x = 180,
					type = "sprite",
					scale = 0.8,
					pic = {
						path = "res/ui/activity/godPaper/czzyb_caishen.png"
					}
				},
				{
					y = 142,
					x = 562,
					type = "sprite",
					pic = {
						path = "res/ui/activity/pay0805/csd_icon_luzi.png"
					}
				},
				{
					y = 165,
					name = "bg_needGold",
					type = "sprite",
					x = 65,
					pic = {
						path = "res/ui/activity/pay0805/csd_word_di_2.png"
					},
					children = {
						{
							fontSize = 20,
							name = "needGold",
							y = 25,
							type = "label",
							x = 98,
							color = var_0_2
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_reward",
					h = 200,
					type = "button",
					w = 200,
					y = 260,
					visible = false,
					x = 575,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 100,
							name = "icon",
							type = "sprite",
							x = 100,
							pic = {
								path = "res/ui/activity/pay0805/csd_icon_yuanbao.png"
							}
						}
					}
				},
				{
					type = "node",
					name = "node_arrow",
					y = 270,
					visible = false,
					x = 770,
					children = {
						{
							y = 0,
							name = "arrow",
							type = "sprite",
							scaleX = -1,
							x = 0,
							pic = {
								path = "res/ui/activity/goldActivity/myRedBag/wdhb_arrows.png"
							}
						},
						{
							y = 0,
							x = 0,
							type = "sprite",
							pic = {
								path = "res/ui/activity/pay0805/csd_word_lqfl.png"
							}
						}
					}
				},
				{
					zoomOnTouchDown = true,
					name = "btn_buff",
					h = 50,
					type = "button",
					w = 140,
					y = 204,
					x = 216,
					normal = {
						path = "res/default.png"
					},
					touched = {
						path = "res/default.png"
					},
					children = {
						{
							y = 25,
							x = 78,
							type = "sprite",
							pic = {
								path = "res/ui/activity/pay0805/csd_di_ink.png"
							}
						},
						{
							x = 70,
							name = "txt_buff",
							y = 25,
							type = "sprite",
							scale = 0.8,
							pic = {
								path = "res/ui/activity/pay0805/csd_word_csjl.png"
							}
						}
					}
				}
			}
		}
	}
}
var_0_7.layout_lv = {
	y = 0,
	name = "bg",
	type = "sprite",
	x = 0,
	pic = {
		path = "res/ui/activity/pay0805/csd_di_square1.png"
	},
	children = {
		{
			y = 67,
			x = 19,
			type = "sprite",
			pic = {
				path = "res/ui/activity/pay0805/csd_word_ink.png"
			}
		},
		{
			y = 95,
			x = 22,
			type = "sprite",
			pic = {
				path = "res/ui/activity/pay0805/csd_word_man.png"
			}
		},
		{
			y = 65,
			x = 22,
			type = "sprite",
			pic = {
				path = "res/ui/activity/pay0805/csd_word_song.png"
			}
		},
		{
			fontSize = 20,
			name = "needGold",
			y = 95,
			type = "label",
			x = 73,
			color = var_0_5
		},
		{
			fontSize = 20,
			name = "returnGold",
			y = 65,
			type = "label",
			x = 73,
			color = var_0_5
		},
		{
			zoomOnTouchDown = true,
			name = "btn_icon",
			h = 60,
			type = "button",
			w = 80,
			y = 24,
			visible = false,
			x = 57,
			normal = {
				path = "res/default.png"
			},
			touched = {
				path = "res/default.png"
			},
			children = {
				{
					y = 30,
					name = "icon",
					type = "sprite",
					x = 40,
					pic = {
						path = "res/ui/activity/pay0805/csd_icon_yuanbao_s.png"
					}
				}
			}
		},
		{
			type = "sprite",
			name = "received",
			y = 28,
			visible = false,
			x = 57,
			pic = {
				path = "res/ui/playerInfo/yihuode.png"
			}
		}
	}
}
var_0_7.tipFrame = {
	name = "tipFrame",
	type = "sprite9",
	visible = false,
	pic = {
		frame = true,
		path = "common_tip_frame_small.png"
	},
	anchorPoint = ccp(0.5, 0),
	middleRect = CCRectMake(24, 24, 1, 1),
	preferedSize = CCSizeMake(160, 140),
	children = {
		{
			fontSize = 20,
			height = 0,
			name = "tipMsg",
			type = "label",
			textId = 135238,
			style = "label_warlock",
			width = 0,
			anchorPoint = ccp(0, 0),
			halign = kCCTextAlignmentLeft,
			color = var_0_2
		}
	}
}

function var_0_7.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.getPay0805Activity)
end

function var_0_7.onGetReward(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}
		local var_5_1 = arg_4_0.info.lvs[arg_4_1]
		local var_5_2 = {}

		var_5_2.id = 19
		var_5_2.value = var_5_1.returnGold

		table.insert(var_5_0, var_5_2)

		if var_5_1.rewards and #var_5_1.rewards > 0 then
			local var_5_3 = var_0_0[var_5_1.rewards[1].type]

			if var_5_3 then
				local var_5_4 = {
					id = var_5_3.type,
					value = var_5_1.rewards[1].num
				}

				table.insert(var_5_0, var_5_4)
			end
		end

		globalAction_gotResource(var_5_0)
		arg_4_0:refresh()
	end

	cmgr.sendRequest(var_4_0, actions.getPay0805Reward, arg_4_1)
end

function var_0_7.showEffectReward(arg_6_0)
	arg_6_0.view.widgets.btn_reward:setVisible(true)
	arg_6_0.view.widgets.icon:stopAllActions()
	arg_6_0.view.widgets.icon:setPosition(100, 200)
	arg_6_0.view.widgets.icon:setRotation(0)

	local var_6_0 = CCArray:create()

	var_6_0:addObject(CCEaseBounceOut:create(CCMoveTo:create(0.2, ccp(100, 100))))

	local var_6_1 = CCSequence:create(var_6_0)

	arg_6_0.view.widgets.icon:runAction(var_6_1)

	local var_6_2 = CCArray:create()

	var_6_2:addObject(CCRotateBy:create(0.1, -20))
	var_6_2:addObject(CCRotateBy:create(0.2, 40))
	var_6_2:addObject(CCRotateBy:create(0.2, -40))
	var_6_2:addObject(CCRotateBy:create(0.2, 40))
	var_6_2:addObject(CCRotateBy:create(0.1, -20))
	var_6_2:addObject(CCDelayTime:create(1.2))

	local var_6_3 = CCSequence:create(var_6_2)

	arg_6_0.view.widgets.icon:runAction(CCRepeatForever:create(var_6_3))
	arg_6_0.view.widgets.node_arrow:setVisible(true)
	arg_6_0.view.widgets.node_arrow:stopAllActions()
	arg_6_0.view.widgets.node_arrow:setPosition(770, 270)

	local var_6_4 = CCArray:create()

	var_6_4:addObject(CCMoveBy:create(0.75, ccp(30, 0)))
	var_6_4:addObject(CCMoveBy:create(0.75, ccp(-30, 0)))

	local var_6_5 = CCSequence:create(var_6_4)

	arg_6_0.view.widgets.node_arrow:runAction(CCRepeatForever:create(var_6_5))
end

function var_0_7.showEffectBuff(arg_7_0)
	arg_7_0.view.widgets.txt_buff:stopAllActions()
	arg_7_0.view.widgets.txt_buff:setScale(0.8)

	local var_7_0 = CCArray:create()

	var_7_0:addObject(CCScaleTo:create(0.4, 1))
	var_7_0:addObject(CCScaleTo:create(0.3, 0.8))
	var_7_0:addObject(CCDelayTime:create(0.3))

	local var_7_1 = CCSequence:create(var_7_0)

	arg_7_0.view.widgets.txt_buff:runAction(CCRepeatForever:create(var_7_1))
end

function var_0_7.showTip(arg_8_0, arg_8_1, arg_8_2)
	log.info("should show tips ")

	local var_8_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_8_0:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			return true
		elseif arg_9_0 == CCTOUCHMOVED then
			return true
		elseif arg_9_0 == CCTOUCHENDED then
			pcall(var_8_0.removeFromParentAndCleanup, var_8_0, true)

			return true
		end
	end, false, true)
	var_8_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_8_0, 60000)

	local var_8_1 = 0
	local var_8_2 = 0
	local var_8_3 = {}

	uiutil.initWidgets(var_8_3, arg_8_0.tipFrame)
	var_8_0:addChild(var_8_3.widgets.tipFrame)

	local var_8_4, var_8_5 = tool.getPositionInScreen(arg_8_1)
	local var_8_6 = var_8_4
	local var_8_7 = var_8_5

	var_8_3.widgets.tipMsg:setString(arg_8_2)

	local var_8_8 = var_8_3.widgets.tipMsg:getContentSize().width
	local var_8_9 = var_8_3.widgets.tipMsg:getContentSize().height

	var_8_3.widgets.tipFrame:setPreferredSize(CCSizeMake(var_8_8 + 30, var_8_9 + 30))
	var_8_3.widgets.tipFrame:setPosition(ccp(var_8_6, var_8_7))
	var_8_3.widgets.tipMsg:setPosition(ccp(15, 15))
	var_8_3.widgets.tipFrame:setVisible(true)
end

function var_0_7.showPanel(arg_10_0, arg_10_1)
	arg_10_0.info = arg_10_1

	arg_10_0.view.widgets.btn_reward:setVisible(false)
	arg_10_0.view.widgets.node_arrow:setVisible(false)
	arg_10_0.view.widgets.gold:setString(language.get(214801, arg_10_1.gold))
	arg_10_0.view.widgets.txt_buff:stopAllActions()
	arg_10_0.view.widgets.txt_buff:setScale(0.8)

	local var_10_0 = #arg_10_1.lvs

	arg_10_0.idx_reward = 0

	local var_10_1 = 0

	for iter_10_0, iter_10_1 in ipairs(arg_10_1.lvs) do
		arg_10_0.view.widgets["received" .. iter_10_0]:setVisible(iter_10_1.received)
		arg_10_0.view.widgets["btn_icon" .. iter_10_0]:setVisible(not iter_10_1.received and iter_10_1.rewards and #iter_10_1.rewards > 0)

		local var_10_2 = "csd_di_square1.png"

		if arg_10_1.gold >= iter_10_1.needGold and iter_10_1.received == false then
			var_10_2 = "csd_di_square2.png"

			if arg_10_0.idx_reward == 0 then
				arg_10_0.idx_reward = iter_10_0
			end
		end

		arg_10_0.view.widgets["bg_lv" .. iter_10_0]:setDisplayFrame(CCSprite:create("res/ui/activity/pay0805/" .. var_10_2):displayFrame())

		if arg_10_1.gold < iter_10_1.needGold and var_10_1 == 0 then
			var_10_1 = iter_10_0
		end

		if iter_10_1.buff == 1 then
			local var_10_3, var_10_4 = arg_10_0.view.widgets.txt_buff:getPosition()
			local var_10_5 = arg_10_0.view.widgets.txt_buff:getParent()

			arg_10_0.view.widgets.txt_buff:removeFromParentAndCleanup(true)

			if arg_10_1.gold >= iter_10_1.needGold then
				arg_10_0.view.widgets.txt_buff = CCSprite:create("res/ui/activity/pay0805/csd_word_csjl.png")

				arg_10_0:showEffectBuff()
			else
				arg_10_0.view.widgets.txt_buff = GraySprite:create("res/ui/activity/pay0805/csd_word_csjl.png")
			end

			var_10_5:addChild(arg_10_0.view.widgets.txt_buff)
			arg_10_0.view.widgets.txt_buff:setPosition(var_10_3, var_10_4)
		end
	end

	if arg_10_0.idx_reward ~= 0 then
		arg_10_0:showEffectReward()
	end

	arg_10_0.view.widgets.bg_needGold:setVisible(var_10_1 > 0)

	if var_10_1 > 0 then
		arg_10_0.view.widgets.needGold:setString(language.get(214802, arg_10_1.lvs[var_10_1].needGold - arg_10_1.gold))
		arg_10_0.view.widgets.bg_needGold:setPositionX(arg_10_0.view.widgets["bg_lv" .. var_10_1]:getPositionX())
	end
end

function var_0_7.ctor(arg_11_0, arg_11_1, arg_11_2)
	log.info("@@ 财神到活动")

	arg_11_0.view = {}

	uiutil.initWidgets(arg_11_0.view, arg_11_0.layout)

	arg_11_0.leftTime = arg_11_0.view.widgets.leftTime

	if arg_11_1 then
		arg_11_0:addChild(arg_11_0.view.widgets.root)
		arg_11_1:addChild(arg_11_0)
	end

	local var_11_0 = #arg_11_2.lvs
	local var_11_1 = 0

	for iter_11_0, iter_11_1 in ipairs(arg_11_2.lvs) do
		local var_11_2 = 68 + (iter_11_0 - 1) * (780 / (var_11_0 - 1))
		local var_11_3 = {}

		uiutil.initWidgets(var_11_3, arg_11_0.layout_lv)
		var_11_3.widgets.bg:setPosition(var_11_2, 85)
		arg_11_0.view.widgets.bg:addChild(var_11_3.widgets.bg)
		var_11_3.widgets.needGold:setString(language.get(320411, tool.getFormatNum(iter_11_1.needGold)))
		var_11_3.widgets.returnGold:setString(language.get(320411, tool.getFormatNum(iter_11_1.returnGold)))
		var_11_3.widgets.btn_icon:addHandleOfControlEvent(function()
			log.info("btn_icon" .. iter_11_0)

			local var_12_0 = ""
			local var_12_1 = arg_11_0.info.lvs[iter_11_0]

			if var_12_1 and var_12_1.rewards and #var_12_1.rewards > 0 then
				local var_12_2 = var_0_0[var_12_1.rewards[1].type]

				if var_12_2 then
					var_12_0 = language.get(var_12_2.txt) .. language.get(490026, var_12_1.rewards[1].num)
				end
			end

			arg_11_0:showTip(var_11_3.widgets.btn_icon, var_12_0)
		end, CCControlEventTouchUpInside)

		if iter_11_1.buff == 1 then
			var_11_3.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/activity/pay0805/csd_icon_yuanbao_s_l.png"):displayFrame())

			var_11_1 = iter_11_1.needGold
		end

		arg_11_0.view.widgets["bg_lv" .. iter_11_0] = var_11_3.widgets.bg
		arg_11_0.view.widgets["btn_icon" .. iter_11_0] = var_11_3.widgets.btn_icon
		arg_11_0.view.widgets["received" .. iter_11_0] = var_11_3.widgets.received
	end

	arg_11_0.view.widgets.btn_buff:addHandleOfControlEvent(function()
		log.info("btn_buff")

		local var_13_0 = language.get(214803, var_11_1)

		arg_11_0:showTip(arg_11_0.view.widgets.btn_buff, var_13_0)
	end, CCControlEventTouchUpInside)
	arg_11_0.view.widgets.btn_pay:addHandleOfControlEvent(function()
		log.info("btn_pay")
		playerInfo2.ui.show(2)
	end, CCControlEventTouchUpInside)
	arg_11_0.view.widgets.btn_reward:addHandleOfControlEvent(function()
		log.info("btn_reward")
		arg_11_0:onGetReward(arg_11_0.idx_reward)
	end, CCControlEventTouchUpInside)
	arg_11_0:showPanel(arg_11_2)
end

return var_0_7
