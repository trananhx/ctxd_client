local var_0_0 = tool.hexToRgb("#D9EDC5")
local var_0_1 = ccc3(0, 180, 0)
local var_0_2 = colorQuality[5]
local var_0_3 = colorQuality[4]
local var_0_4 = colorQuality[2]
local var_0_5 = class("CbhsPower", function()
	return createBaseLayer()
end)

var_0_5.layout = {
	y = 0,
	name = "root",
	type = "node",
	x = 0,
	children = {
		{
			name = "bg",
			type = "sprite",
			x = visibleSize.width * 0.5,
			y = visibleSize.height * 0.5,
			pic = {
				path = "res/ui/farm/farm_background.jpg"
			},
			children = {
				{
					y = 345,
					name = "node1",
					type = "node",
					x = 535,
					children = {
						{
							type = "sprite",
							name = "buff1",
							y = 50,
							visible = false,
							x = -10,
							zorder = -20,
							pic = {
								path = "res/default.png"
							}
						},
						{
							name = "btn_ask1",
							h = 62,
							type = "button",
							w = 140,
							y = 150,
							x = 0,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 70,
									textId = 135645,
									color = var_0_0
								}
							}
						},
						{
							y = 0,
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/common/text/warlock/warlock_state_bg.png"
							},
							children = {
								{
									fontSize = 25,
									y = 22,
									type = "label",
									x = 78,
									textId = 135642,
									color = var_0_2
								}
							}
						}
					}
				},
				{
					y = 185,
					name = "node2",
					type = "node",
					x = 785,
					children = {
						{
							type = "sprite",
							name = "buff2",
							y = 50,
							visible = false,
							x = -10,
							zorder = -20,
							pic = {
								path = "res/default.png"
							}
						},
						{
							name = "btn_ask2",
							h = 60,
							type = "button",
							w = 140,
							y = 150,
							x = 0,
							normal = {
								path = "res/ui/common/button/public_btn_green.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_green_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 70,
									textId = 135645,
									color = var_0_0
								}
							}
						},
						{
							y = 0,
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/common/text/warlock/warlock_state_bg.png"
							},
							children = {
								{
									fontSize = 25,
									y = 22,
									type = "label",
									x = 78,
									textId = 135643,
									color = var_0_2
								}
							}
						}
					}
				},
				{
					y = 445,
					name = "node3",
					type = "node",
					x = 855,
					children = {
						{
							type = "sprite",
							name = "bg_fire1",
							y = 85,
							visible = false,
							x = -40,
							zorder = -20,
							pic = {
								path = "res/ui/instance/cbhs/fire.png"
							},
							children = {
								{
									x = 56,
									name = "fire1",
									y = 81,
									type = "sprite",
									scale = 0.9,
									pic = {
										path = "res/ui/instance/cbhs/fire.png"
									}
								}
							}
						},
						{
							type = "sprite",
							name = "bg_fire2",
							y = 110,
							visible = false,
							x = 10,
							zorder = -20,
							pic = {
								path = "res/ui/instance/cbhs/fire.png"
							},
							children = {
								{
									x = 56,
									name = "fire2",
									y = 81,
									type = "sprite",
									scale = 0.9,
									pic = {
										path = "res/ui/instance/cbhs/fire.png"
									}
								}
							}
						},
						{
							y = 150,
							name = "btn_evoke",
							h = 62,
							type = "button",
							w = 180,
							visible = false,
							x = 0,
							normal = {
								path = "res/ui/common/button/public_btn_red.png"
							},
							touched = {
								path = "res/ui/common/button/public_btn_red_c.png"
							},
							children = {
								{
									fontSize = 25,
									y = 32,
									type = "label",
									x = 90,
									textId = 135646,
									color = var_0_0
								}
							}
						},
						{
							type = "sprite",
							name = "arrow",
							x = -125,
							visible = false,
							y = 152,
							pic = {
								path = "res/ui/guide/jiantou-you.png"
							}
						},
						{
							y = 0,
							type = "sprite",
							x = 0,
							pic = {
								path = "res/ui/common/text/warlock/warlock_state_bg.png"
							},
							children = {
								{
									fontSize = 25,
									y = 22,
									type = "label",
									x = 78,
									textId = 135644,
									color = var_0_1
								}
							}
						}
					}
				}
			}
		},
		{
			w = 143,
			name = "btn_back",
			h = 61,
			type = "button",
			y = 50,
			normal = {
				path = "res/ui/farm/btn_back_a.png"
			},
			touched = {
				path = "res/ui/farm/btn_back_c.png"
			},
			x = visibleSize.width - 90
		}
	}
}

function var_0_5.refresh(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0:showPanel(arg_3_0.action.data)
	end

	cmgr.sendRequest(var_2_0, actions.switchPowerInfo, 13)
end

function var_0_5.onEnterCbhsPower(arg_4_0)
	local function var_4_0(arg_5_0)
		return
	end

	cmgr.sendRequest(var_4_0, actions.enterCbhsPower)
end

function var_0_5.onFinishCbhsPower(arg_6_0)
	local function var_6_0(arg_7_0)
		return
	end

	cmgr.sendRequest(var_6_0, actions.finishCbhsPower)
end

function var_0_5.onBtnAskTap(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.view.widgets["btn_ask" .. arg_8_1]

	if var_8_0 then
		var_8_0:setVisible(false)

		if arg_8_1 == 1 then
			user.cbhs_showBtnAsk1 = false

			arg_8_0:playerAnimation(arg_8_0.batchNode1, arg_8_0.animArrays1)
		else
			user.cbhs_showBtnAsk2 = false

			arg_8_0:playerAnimation(arg_8_0.batchNode2, arg_8_0.animArrays2)
		end

		schedule(arg_8_0, function()
			if arg_8_1 == 1 then
				if arg_8_0.info.isZfJx then
					roleDialogue.control.loadSpeak(1550)
				else
					roleDialogue.control.loadSpeak(1548)
				end
			elseif arg_8_0.info.isGyJx then
				roleDialogue.control.loadSpeak(1551)
			else
				roleDialogue.control.loadSpeak(1549)
			end

			arg_8_0:stopAllActions()
		end, 1.5)
	end
end

function var_0_5.showEffectTeach(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.view.widgets["node" .. arg_10_1]

	if var_10_0 then
		local var_10_1, var_10_2 = var_10_0:getPosition()
		local var_10_3, var_10_4 = arg_10_0.view.widgets.node3:getPosition()
		local var_10_5 = CCSprite:create("res/ui/instance/cbhs/light.png")

		var_10_5:setPosition(ccp(var_10_1, var_10_2 + 50))
		var_10_5:setOpacity(0)
		arg_10_0.view.widgets.bg:addChild(var_10_5, 100)

		local var_10_6 = CCArray:create()

		var_10_6:addObject(CCFadeIn:create(0.3))
		var_10_6:addObject(CCMoveTo:create(0.6, ccp(var_10_3, var_10_4 + 50)))
		var_10_6:addObject(CCFadeOut:create(0.3))
		var_10_6:addObject(CCCallFuncN:create(function()
			var_10_5:removeFromParentAndCleanup(true)

			if arg_10_0.info.isZfJx and arg_10_0.info.isGyJx then
				arg_10_0.view.widgets.bg_fire1:setVisible(true)
				arg_10_0.view.widgets.bg_fire2:setVisible(true)
				arg_10_0.view.widgets.btn_ask1:setVisible(false)
				arg_10_0.view.widgets.btn_ask2:setVisible(false)
				arg_10_0:showEffectStartEvoke()
			else
				arg_10_0.view.widgets["bg_fire" .. arg_10_1]:setVisible(true)
			end
		end))

		local var_10_7 = CCSequence:create(var_10_6)

		var_10_5:runAction(var_10_7)
	end
end

function var_0_5.showEffectStartEvoke(arg_12_0)
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

	local var_12_0 = CCSprite:createWithSpriteFrameName("stategyText_cbhs.png")

	var_12_0:setScale(0.01)
	var_12_0:setOpacity(0)
	arg_12_0.view.widgets.bg:addChild(var_12_0, 200)
	var_12_0:setPosition(ccp(568, 384))

	local var_12_1, var_12_2 = arg_12_0.view.widgets.node3:getPosition()
	local var_12_3 = CCScaleTo:create(0.6, 0.3)
	local var_12_4 = CCMoveTo:create(0.6, ccp(var_12_1, var_12_2 + 50))
	local var_12_5 = CCArray:create()

	var_12_5:addObject(CCFadeIn:create(0.2))
	var_12_5:addObject(CCScaleTo:create(0.3, 1))
	var_12_5:addObject(CCDelayTime:create(0.3))
	var_12_5:addObject(CCSpawn:createWithTwoActions(var_12_3, var_12_4))
	var_12_5:addObject(CCFadeOut:create(0.2))
	var_12_5:addObject(CCCallFuncN:create(function()
		var_12_0:removeFromParentAndCleanup(true)
		arg_12_0.view.widgets.btn_evoke:setVisible(true)
		roleDialogue.control.loadSpeak(1552)
	end))

	local var_12_6 = CCSequence:create(var_12_5)

	var_12_0:runAction(var_12_6)
end

function var_0_5.playerAnimation(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1:getChildren()

	for iter_14_0 = 0, var_14_0:count() - 1 do
		local var_14_1 = var_14_0:objectAtIndex(iter_14_0)
		local var_14_2 = CCAnimation:createWithSpriteFrames(arg_14_2.attack, 0.07)
		local var_14_3 = CCAnimate:create(var_14_2)
		local var_14_4 = CCAnimation:createWithSpriteFrames(arg_14_2.win, 0.07)
		local var_14_5 = CCAnimate:create(var_14_4)
		local var_14_6 = CCArray:create()

		var_14_6:addObject(var_14_3)
		var_14_6:addObject(var_14_5)
		var_14_6:addObject(CCCallFuncN:create(function()
			var_14_1:stopAllActions()
			var_14_1:setDisplayFrame(tolua.cast(arg_14_2.idle:objectAtIndex(0), "CCSpriteFrame"))
		end))

		local var_14_7 = CCSequence:create(var_14_6)

		var_14_1:runAction(var_14_7)
	end
end

local function var_0_6(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = CCSprite:createWithSpriteFrame(tolua.cast(arg_16_0.idle:objectAtIndex(0), "CCSpriteFrame"))

	var_16_0:setPosition(arg_16_2)
	arg_16_1:addChild(var_16_0)
end

local function var_0_7(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = 0
	local var_17_1 = 0
	local var_17_2 = 0
	local var_17_3 = 0

	if arg_17_2 == 5 or arg_17_2 == 33 then
		var_17_2 = -5
		var_17_3 = 60
	elseif arg_17_2 == 10 then
		var_17_2 = -24
		var_17_3 = 45
	end

	local var_17_4 = (arg_17_1 - 1) * 24 + var_17_2
	local var_17_5 = -0.5 * var_17_4 + var_17_3
	local var_17_6 = var_17_4 - (arg_17_0 - 1) * 40
	local var_17_7 = var_17_5 - (arg_17_0 - 1) * 20

	return ccp(var_17_6, var_17_7)
end

function var_0_5.showPanel(arg_18_0, arg_18_1)
	arg_18_0.info = arg_18_1

	if arg_18_1.isFirstEnterCbhs then
		arg_18_0:onEnterCbhsPower()
		roleDialogue.control.loadSpeak(1547)
	end

	arg_18_0.view.widgets.buff1:setVisible(arg_18_1.isZfJx)
	arg_18_0.view.widgets.buff2:setVisible(arg_18_1.isGyJx)

	if user.cbhs_isZfJx == nil then
		user.cbhs_isZfJx = arg_18_1.isZfJx
	end

	if user.cbhs_isGyJx == nil then
		user.cbhs_isGyJx = arg_18_1.isGyJx
	end

	if user.hasCbhsPower or user.cbhs_isZfJx == false and arg_18_1.isZfJx == true or user.cbhs_isGyJx == false and arg_18_1.isGyJx == true then
		user.cbhs_showBtnAsk1 = true
		user.cbhs_showBtnAsk2 = true
		user.cbhs_isZfJx = true
		user.cbhs_isGyJx = true
		user.hasCbhsPower = false

		notice.control.refreshLayer()
	end

	arg_18_0.view.widgets.btn_ask1:setVisible(user.cbhs_showBtnAsk1)
	arg_18_0.view.widgets.btn_ask2:setVisible(user.cbhs_showBtnAsk2)

	if arg_18_1.isZfJx and not user.cbhs_showBtnAsk1 then
		arg_18_0.view.widgets.bg_fire1:setVisible(true)
	end

	if arg_18_1.isGyJx and not user.cbhs_showBtnAsk2 then
		arg_18_0.view.widgets.bg_fire2:setVisible(true)
	end

	local var_18_0 = arg_18_0.view.widgets.node1
	local var_18_1 = "def"
	local var_18_2 = 5
	local var_18_3, var_18_4 = rmgr.getArmy(var_18_1, var_18_2)
	local var_18_5 = CCSpriteBatchNode:create(var_18_4)

	var_18_0:addChild(var_18_5, -10)

	for iter_18_0 = 1, 2 do
		for iter_18_1 = 1, 3 do
			local var_18_6 = var_0_7(iter_18_0, iter_18_1, var_18_2)

			var_0_6(var_18_3, var_18_5, var_18_6, delay)
		end
	end

	arg_18_0.batchNode1 = var_18_5
	arg_18_0.animArrays1 = var_18_3

	local var_18_7 = arg_18_0.view.widgets.node2
	local var_18_8 = "def"
	local var_18_9 = 10
	local var_18_10, var_18_11 = rmgr.getArmy(var_18_8, var_18_9)
	local var_18_12 = CCSpriteBatchNode:create(var_18_11)

	var_18_7:addChild(var_18_12, -10)

	for iter_18_2 = 1, 1 do
		for iter_18_3 = 1, 3 do
			local var_18_13 = var_0_7(iter_18_2, iter_18_3, var_18_9)

			var_0_6(var_18_10, var_18_12, var_18_13, delay)
		end
	end

	arg_18_0.batchNode2 = var_18_12
	arg_18_0.animArrays2 = var_18_10

	local var_18_14 = arg_18_0.view.widgets.node3
	local var_18_15 = "def"
	local var_18_16 = 33
	local var_18_17, var_18_18 = rmgr.getArmy(var_18_15, var_18_16)
	local var_18_19 = CCSpriteBatchNode:create(var_18_18)

	var_18_14:addChild(var_18_19, -10)

	for iter_18_4 = 1, 2 do
		for iter_18_5 = 1, 3 do
			local var_18_20 = var_0_7(iter_18_4, iter_18_5, var_18_16)

			var_0_6(var_18_17, var_18_19, var_18_20, delay)
		end
	end
end

function var_0_5.ctor(arg_19_0, arg_19_1)
	log.info("@@ 赤壁火神副本")

	arg_19_0.view = {}

	uiutil.initWidgets(arg_19_0.view, arg_19_0.layout)
	arg_19_0:addChild(arg_19_0.view.widgets.root)
	arg_19_0.view.widgets.btn_back:addHandleOfControlEvent(function()
		log.info("btn_back")
		smgr.returnLastScene()
	end, CCControlEventTouchUpInside)
	arg_19_0.view.widgets.btn_ask1:addHandleOfControlEvent(function()
		log.info("btn_ask1")
		arg_19_0:onBtnAskTap(1)
	end, CCControlEventTouchUpInside)
	arg_19_0.view.widgets.btn_ask2:addHandleOfControlEvent(function()
		log.info("btn_ask2")
		arg_19_0:onBtnAskTap(2)
	end, CCControlEventTouchUpInside)
	arg_19_0.view.widgets.btn_evoke:addHandleOfControlEvent(function()
		log.info("btn_evoke")
		arg_19_0:onFinishCbhsPower()
		smgr.returnLastScene()
		require("lua/layer/general/ui")
		showGeneralPanel(1)
	end, CCControlEventTouchUpInside)

	for iter_19_0 = 1, 2 do
		local var_19_0 = arg_19_0.view.widgets["buff" .. iter_19_0]
		local var_19_1 = rmgr.getAnimation("thunder")

		if var_19_1 then
			local var_19_2 = CCAnimation:createWithSpriteFrames(var_19_1, 0.08)
			local var_19_3 = CCAnimate:create(var_19_2)
			local var_19_4 = CCRepeatForever:create(var_19_3)
			local var_19_5 = CCSprite:create()

			var_19_0:runAction(var_19_4)
		end
	end

	for iter_19_1 = 1, 2 do
		local var_19_6 = arg_19_0.view.widgets["fire" .. iter_19_1]
		local var_19_7 = CCArray:create()

		var_19_7:addObject(CCFadeIn:create(0.1))
		var_19_7:addObject(CCFadeOut:create(0.3))

		local var_19_8 = CCSequence:create(var_19_7)

		var_19_6:runAction(CCRepeatForever:create(var_19_8))
	end

	local var_19_9 = CCMoveBy:create(0.6, ccp(30, 0))
	local var_19_10 = CCEaseOut:create(var_19_9, 1)
	local var_19_11 = CCMoveBy:create(0.6, ccp(-30, 0))
	local var_19_12 = CCEaseIn:create(var_19_11, 1)
	local var_19_13 = CCArray:create()

	var_19_13:addObject(var_19_10)
	var_19_13:addObject(var_19_12)

	local var_19_14 = CCSequence:create(var_19_13)
	local var_19_15 = CCRepeatForever:create(tolua.cast(var_19_14, "CCActionInterval"))

	arg_19_0.view.widgets.arrow:runAction(var_19_15)

	if user.cbhs_showBtnAsk1 == nil then
		user.cbhs_showBtnAsk1 = true
		user.cbhs_showBtnAsk2 = true
	end

	if arg_19_1 then
		arg_19_0:showPanel(arg_19_1)
	else
		arg_19_0:refresh()
	end
end

function var_0_5.onEnter(arg_24_0)
	playerInfoUI.show()

	function arg_24_0.cbhs_zfRef()
		arg_24_0:showEffectTeach(1)
	end

	function arg_24_0.cbhs_gyRef()
		arg_24_0:showEffectTeach(2)
	end

	function arg_24_0.cbhs_zyRef()
		arg_24_0.view.widgets.arrow:setVisible(true)
	end

	eventManager.registerEvent("cbhs_zf", arg_24_0.cbhs_zfRef)
	eventManager.registerEvent("cbhs_gy", arg_24_0.cbhs_gyRef)
	eventManager.registerEvent("cbhs_zy", arg_24_0.cbhs_zyRef)
end

function var_0_5.onExit(arg_28_0)
	eventManager.unregisterEvent("cbhs_zf", arg_28_0.cbhs_zfRef)
	eventManager.unregisterEvent("cbhs_gy", arg_28_0.cbhs_gyRef)
	eventManager.unregisterEvent("cbhs_zy", arg_28_0.cbhs_zyRef)
end

return var_0_5
