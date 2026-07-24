require("lua/layer/menu/ui")
require("lua/layer/playerInfo2/ui")

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = 0
	local var_1_1 = 0

	if arg_1_1 <= 3 then
		var_1_0 = -439 + (arg_1_1 - 1) * 27
	elseif arg_1_1 <= 6 then
		var_1_0 = -309 + (arg_1_1 - 4) * 27
	else
		var_1_0 = -179 + (arg_1_1 - 7) * 27
	end

	local var_1_2 = -0.5 * var_1_0 - 306
	local var_1_3 = var_1_0 - (arg_1_0 - 1) * 90
	local var_1_4 = var_1_2 - (arg_1_0 - 1) * 45

	return ccp(var_1_3, var_1_4)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = 0
	local var_2_1 = 0

	if arg_2_1 <= 3 then
		var_2_0 = -86 + (arg_2_1 - 1) * 27
	elseif arg_2_1 <= 6 then
		var_2_0 = 44 + (arg_2_1 - 4) * 27
	else
		var_2_0 = 174 + (arg_2_1 - 7) * 27
	end

	local var_2_2 = -0.5 * var_2_0 + 64
	local var_2_3 = var_2_0 + (arg_2_0 - 1) * 90
	local var_2_4 = var_2_2 + (arg_2_0 - 1) * 45

	return ccp(var_2_3, var_2_4)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = CCSprite:createWithSpriteFrame(tolua.cast(arg_3_0.move:objectAtIndex(0), "CCSpriteFrame"))

	var_3_0:setPosition(arg_3_2)
	arg_3_1:addChild(var_3_0)

	local var_3_1 = CCAnimation:createWithSpriteFrames(arg_3_0.move, 0.07)
	local var_3_2 = CCAnimate:create(var_3_1)

	var_3_0:runAction(CCRepeatForever:create(var_3_2))

	local var_3_3 = CCArray:create()

	var_3_3:addObject(CCDelayTime:create(arg_3_3))
	var_3_3:addObject(CCCallFuncN:create(function()
		var_3_0:stopAllActions()
		var_3_0:setDisplayFrame(tolua.cast(arg_3_0.idle:objectAtIndex(0), "CCSpriteFrame"))
	end))

	local var_3_4 = CCSequence:create(var_3_3)

	var_3_0:runAction(var_3_4)
end

local var_0_3 = class("SilkPower", function()
	return createBaseLayer()
end)

var_0_3.layout = {
	name = "panel",
	type = "node",
	x = visibleSize.width * 0.5,
	y = visibleSize.height * 0.5,
	children = {
		{
			y = 0,
			name = "bg",
			type = "sprite",
			x = 0,
			pic = {
				path = "res/ui/silk/power/sjfb_map.jpg"
			}
		},
		{
			y = -34,
			name = "btn_att",
			h = 112,
			type = "button",
			w = 124,
			visible = false,
			x = -104,
			normal = {
				path = "res/ui/silk/power/kaizhan.png"
			},
			touched = {
				path = "res/ui/silk/power/kaizhan1.png"
			}
		}
	}
}

function var_0_3.refresh(arg_6_0)
	local function var_6_0(arg_7_0)
		arg_6_0:showPanel(arg_7_0.action.data)
	end

	cmgr.sendRequest(var_6_0, actions.getExtraPowerInfo, 1301)
end

function var_0_3.addAttArmy(arg_8_0)
	local var_8_0 = CCNode:create()

	arg_8_0.npcNode:addChild(var_8_0)

	local var_8_1 = "att"
	local var_8_2 = 32
	local var_8_3 = ccp(-180, -110)
	local var_8_4, var_8_5 = rmgr.getArmy(var_8_1, var_8_2)
	local var_8_6 = CCSpriteBatchNode:create(var_8_5)

	var_8_0:addChild(var_8_6)

	local var_8_7 = CCSprite:createWithSpriteFrame(tolua.cast(var_8_4.idle:objectAtIndex(0), "CCSpriteFrame"))

	var_8_6:addChild(var_8_7)
	var_8_7:setPosition(var_8_3)

	local var_8_8 = CCStrokeLabelTTF:create(user.player.name, "Thonburi", 20)

	var_8_8:setPosition(ccp(-180, -45))
	var_8_0:addChild(var_8_8, 100)

	local var_8_9 = "att"
	local var_8_10 = 10
	local var_8_11, var_8_12 = rmgr.getArmy(var_8_9, var_8_10)
	local var_8_13 = CCSpriteBatchNode:create(var_8_12)

	var_8_0:addChild(var_8_13)

	for iter_8_0 = 1, 4 do
		for iter_8_1 = 1, 9 do
			local var_8_14 = CCSprite:createWithSpriteFrame(tolua.cast(var_8_11.idle:objectAtIndex(0), "CCSpriteFrame"))
			local var_8_15 = var_0_0(iter_8_0, iter_8_1)

			var_8_14:setPosition(var_8_15)
			var_8_13:addChild(var_8_14)
		end
	end
end

function var_0_3.addDefArmy1(arg_9_0)
	local var_9_0 = CCNode:create()
	local var_9_1 = visibleSize.width / 2 + 30

	var_9_1 = var_9_1 < 600 and 600 or var_9_1

	local var_9_2 = var_9_1 / 2

	var_9_0:setPosition(ccp(var_9_1, var_9_2))

	local var_9_3 = math.sqrt(var_9_1^2 + var_9_2^2) / 200

	arg_9_0.npcNode:addChild(var_9_0)

	local var_9_4 = CCArray:create()

	var_9_4:addObject(CCMoveTo:create(var_9_3, ccp(0, 0)))
	var_9_4:addObject(CCCallFuncN:create(function()
		if arg_9_0.curIdx == 1 then
			roleDialogue.control.loadSpeak(1540)
		elseif arg_9_0.curIdx == 2 then
			roleDialogue.control.loadSpeak(1541)
		elseif arg_9_0.curIdx == 3 then
			roleDialogue.control.loadSpeak(1542)
		elseif arg_9_0.curIdx == 4 then
			roleDialogue.control.loadSpeak(1543)
		end
	end))

	local var_9_5 = CCSequence:create(var_9_4)

	var_9_0:runAction(var_9_5)

	local var_9_6 = "def"
	local var_9_7 = 32
	local var_9_8 = ccp(-28, -22)
	local var_9_9, var_9_10 = rmgr.getArmy(var_9_6, var_9_7)
	local var_9_11 = CCSpriteBatchNode:create(var_9_10)

	var_9_0:addChild(var_9_11)
	var_0_2(var_9_9, var_9_11, var_9_8, var_9_3)

	local var_9_12 = arg_9_0.info.extraNpcs[arg_9_0.curIdx]
	local var_9_13 = CCStrokeLabelTTF:create(var_9_12.npcName, "Thonburi", 20)

	var_9_13:setPosition(ccp(-28, 43))
	var_9_0:addChild(var_9_13, 100)

	local var_9_14 = "def"
	local var_9_15 = 10
	local var_9_16, var_9_17 = rmgr.getArmy(var_9_14, var_9_15)
	local var_9_18 = CCSpriteBatchNode:create(var_9_17)

	var_9_0:addChild(var_9_18)

	for iter_9_0 = 1, 4 do
		for iter_9_1 = 1, 9 do
			local var_9_19 = var_0_1(iter_9_0, iter_9_1)

			var_0_2(var_9_16, var_9_18, var_9_19, var_9_3)
		end
	end

	if arg_9_0.curIdx == 4 then
		local var_9_20 = {
			ccp(-112, 59),
			ccp(-70, 30),
			ccp(38, -30),
			ccp(112, -59)
		}

		for iter_9_2 = 1, 4 do
			local var_9_21 = var_9_20[iter_9_2]

			var_0_2(var_9_16, var_9_18, var_9_21, var_9_3)
		end

		for iter_9_3 = 5, 5 do
			for iter_9_4 = 1, 9 do
				if iter_9_4 >= 4 and iter_9_4 <= 6 then
					-- block empty
				else
					local var_9_22 = var_0_1(iter_9_3, iter_9_4)

					var_0_2(var_9_16, var_9_18, var_9_22, var_9_3)
				end
			end
		end
	end

	if arg_9_0.curIdx == 4 then
		local var_9_23 = "def"
		local var_9_24 = 40
		local var_9_25, var_9_26 = rmgr.getArmy(var_9_23, var_9_24)
		local var_9_27 = CCSpriteBatchNode:create(var_9_26)

		var_9_0:addChild(var_9_27)

		local var_9_28 = var_0_1(5, 5)
		local var_9_29 = ccp(var_9_28.x + 20, var_9_28.y + 60)

		var_0_2(var_9_25, var_9_27, var_9_29, var_9_3)
	end
end

function var_0_3.addDefArmy2(arg_11_0)
	local var_11_0 = CCNode:create()
	local var_11_1 = visibleSize.width / 2 - 450

	var_11_1 = var_11_1 < 120 and 120 or var_11_1

	local var_11_2 = var_11_1 / 2

	var_11_0:setPosition(ccp(var_11_1, var_11_2))

	local var_11_3 = math.sqrt(var_11_1^2 + var_11_2^2) / 200

	arg_11_0.npcNode:addChild(var_11_0)

	local var_11_4 = CCArray:create()

	var_11_4:addObject(CCMoveTo:create(var_11_3, ccp(0, 0)))
	var_11_4:addObject(CCCallFuncN:create(function()
		if arg_11_0.curIdx == 2 or arg_11_0.curIdx == 3 then
			arg_11_0.view.widgets.btn_att:setVisible(true)
		end
	end))

	local var_11_5 = CCSequence:create(var_11_4)

	var_11_0:runAction(var_11_5)

	local var_11_6 = "def"
	local var_11_7 = 10
	local var_11_8, var_11_9 = rmgr.getArmy(var_11_6, var_11_7)
	local var_11_10 = CCSpriteBatchNode:create(var_11_9)

	var_11_0:addChild(var_11_10)

	for iter_11_0 = 5, 5 do
		for iter_11_1 = 1, 9 do
			if arg_11_0.curIdx == 3 and iter_11_1 >= 4 and iter_11_1 <= 6 then
				-- block empty
			else
				local var_11_11 = var_0_1(iter_11_0, iter_11_1)

				var_0_2(var_11_8, var_11_10, var_11_11, var_11_3)
			end
		end
	end

	if arg_11_0.curIdx == 3 then
		local var_11_12 = "def"
		local var_11_13 = 40
		local var_11_14, var_11_15 = rmgr.getArmy(var_11_12, var_11_13)
		local var_11_16 = CCSpriteBatchNode:create(var_11_15)

		var_11_0:addChild(var_11_16)

		local var_11_17 = var_0_1(5, 5)
		local var_11_18 = ccp(var_11_17.x + 20, var_11_17.y + 60)

		var_0_2(var_11_14, var_11_16, var_11_18, var_11_3)
	end
end

function var_0_3.onBtnAttTap(arg_13_0)
	local var_13_0 = arg_13_0.info.extraNpcs[arg_13_0.curIdx]

	bmgr.tryEnterBattle(battleType.BATTLE_ARMY_EXTRA, {
		targetId = var_13_0.npcId,
		terrain = var_13_0.terrain
	})

	if user.haveWorldFuBen == 2 and arg_13_0.curIdx == 1 then
		user.haveWorldFuBen = 1

		notice.control.refreshLayer()
	end
end

function var_0_3.showPanel(arg_14_0, arg_14_1)
	if not arg_14_1.extraNpcs or not (#arg_14_1.extraNpcs > 0) then
		arg_14_0:refresh()

		return
	end

	arg_14_0.info = arg_14_1
	arg_14_0.curIdx = 0

	arg_14_0.view.widgets.btn_att:setVisible(false)

	for iter_14_0, iter_14_1 in ipairs(arg_14_1.extraNpcs) do
		if iter_14_1.attackable == 1 then
			arg_14_0.curIdx = iter_14_0

			break
		end
	end

	if arg_14_0.npcNode then
		arg_14_0.npcNode:removeAllChildrenWithCleanup(true)
	else
		arg_14_0.npcNode = CCNode:create()

		arg_14_0.view.widgets.panel:addChild(arg_14_0.npcNode)
	end

	arg_14_0:addAttArmy()

	local var_14_0 = arg_14_1.extraNpcs[arg_14_0.curIdx].npcId

	if arg_14_0.curIdx == 1 then
		roleDialogue.control.loadSpeak(1539)
	elseif arg_14_0.curIdx == 2 then
		arg_14_0:addDefArmy1()
	elseif arg_14_0.curIdx == 3 then
		arg_14_0:addDefArmy1()
	elseif arg_14_0.curIdx == 4 then
		arg_14_0:addDefArmy1()
	end
end

function var_0_3.ctor(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.view = {}

	uiutil.initWidgets(arg_15_0.view, arg_15_0.layout)
	arg_15_0:addChild(arg_15_0.view.widgets.panel)

	if arg_15_2 then
		arg_15_2:addChild(arg_15_0)
	end

	swallowTouch(arg_15_0)
	arg_15_0.view.widgets.btn_att:addHandleOfControlEvent(function()
		arg_15_0:onBtnAttTap()
	end, CCControlEventTouchUpInside)

	if arg_15_1 then
		arg_15_0:showPanel(arg_15_1)
	else
		arg_15_0:refresh()
	end
end

function var_0_3.onEnter(arg_17_0)
	menuUI.ui.show()
	playerInfoUI.show()

	function arg_17_0.npcMoveRef()
		if arg_17_0.curIdx == 1 then
			arg_17_0:addDefArmy1()
		elseif arg_17_0.curIdx == 2 then
			arg_17_0:addDefArmy2()
		elseif arg_17_0.curIdx == 3 then
			arg_17_0:addDefArmy2()
		end
	end

	function arg_17_0.btnAttRef()
		arg_17_0.view.widgets.btn_att:setVisible(true)
	end

	eventManager.registerEvent("silk_npc_move", arg_17_0.npcMoveRef)
	eventManager.registerEvent("silk_btn_att", arg_17_0.btnAttRef)
end

function var_0_3.onExit(arg_20_0)
	eventManager.unregisterEvent("silk_npc_move", arg_20_0.npcMoveRef)
	eventManager.unregisterEvent("silk_btn_att", arg_20_0.btnAttRef)
end

return var_0_3
