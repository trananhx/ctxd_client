local var_0_0 = {
	{
		num = 7,
		offset = ccp(248, -156)
	},
	{
		num = 3,
		offset = ccp(345, -130)
	},
	{
		num = 7,
		offset = ccp(410, -68)
	},
	{
		num = 4,
		offset = ccp(538, -10)
	},
	{
		num = 7,
		offset = ccp(-266, 147)
	},
	{
		num = 4,
		offset = ccp(-140, 206)
	},
	{
		num = 7,
		offset = ccp(-40, 262)
	}
}
local var_0_1 = tool.hexToRgb("#FFFFCC")
local var_0_2 = tool.hexToRgb("#FD6262")
local var_0_3 = class("Surround", function()
	return CCNode:create()
end)

var_0_3.layout = {
	zoomOnTouchDown = true,
	name = "btn_surround",
	h = 80,
	type = "button",
	w = 80,
	y = 40,
	normal = {
		path = "res/default.png"
	},
	touched = {
		path = "res/default.png"
	},
	x = visibleSize.width / 2,
	children = {
		{
			y = 40,
			name = "icon",
			type = "sprite",
			x = 40,
			pic = {
				path = "res/ui/battle/bwqh_icon_bw.png"
			}
		}
	}
}

function var_0_3.showTip(arg_2_0)
	log.info("should show tips ")

	local var_2_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			pcall(var_2_0.removeFromParentAndCleanup, var_2_0, true)

			return true
		end
	end, false, true)
	var_2_0:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_2_0, 60000)

	local var_2_1 = {
		name = "tipFrame",
		type = "sprite9Tips",
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0.5, 0),
		middleRect = CCRectMake(24, 24, 1, 1),
		content = {}
	}
	local var_2_2 = arg_2_0.control.figthSide == "att"

	if arg_2_0.control.surround ~= 0 then
		table.insert(var_2_1.content, {
			type = "label",
			fontSize = 20,
			color = var_0_1,
			halign = kCCTextAlignmentLeft,
			text = language.get(var_2_2 and 214704 or 214702)
		})
	elseif arg_2_0.control.slam ~= 0 then
		table.insert(var_2_1.content, {
			type = "label",
			fontSize = 20,
			color = var_0_1,
			halign = kCCTextAlignmentLeft,
			text = language.get(var_2_2 and 214705 or 214701)
		})
	elseif arg_2_0.control.slamCd > 0 then
		table.insert(var_2_1.content, {
			type = "label",
			fontSize = 20,
			color = var_0_1,
			halign = kCCTextAlignmentLeft,
			text = language.get(var_2_2 and 214703 or 214706)
		})
		table.insert(var_2_1.content, {
			name = "slamCd",
			type = "label",
			fontSize = 20,
			color = var_0_2,
			halign = kCCTextAlignmentLeft,
			text = language.get(var_2_2 and "214703_1" or "214706_1", "00:00")
		})
	end

	local var_2_3 = 0
	local var_2_4 = 0
	local var_2_5 = {}

	uiutil.initWidgets(var_2_5, var_2_1)
	var_2_0:addChild(var_2_5.widgets.tipFrame)

	local var_2_6, var_2_7 = tool.getPositionInScreen(arg_2_0.view.widgets.btn_surround)
	local var_2_8 = var_2_6
	local var_2_9 = var_2_7

	var_2_5.widgets.tipFrame:setPosition(ccp(var_2_8, var_2_9))

	if var_2_5.widgets.slamCd then
		local var_2_10 = CCArray:create()

		var_2_10:addObject(CCCallFunc:create(function()
			if arg_2_0.control.slamCd <= 0 then
				var_2_5.widgets.slamCd:stopAllActions()
			else
				var_2_5.widgets.slamCd:setString(language.get(var_2_2 and "214703_1" or "214706_1", tool.getFormatTime(arg_2_0.control.slamCd)))
			end
		end))
		var_2_10:addObject(CCDelayTime:create(0.5))

		local var_2_11 = CCSequence:create(var_2_10)

		var_2_5.widgets.slamCd:runAction(CCRepeatForever:create(var_2_11))
	end
end

function var_0_3.addArmy(arg_5_0)
	if arg_5_0.armyNode then
		arg_5_0.armyNode:removeAllChildrenWithCleanup(true)
	else
		arg_5_0.armyNode = CCSpriteBatchNode:create("res/ui/battle/arrow_army.png")

		arg_5_0:addChild(arg_5_0.armyNode)
	end

	if arg_5_0.control.surround == 0 then
		return
	end

	local var_5_0 = arg_5_0.control.fightControl.defPosition[0]

	math.randomseed(1)

	for iter_5_0, iter_5_1 in ipairs(var_0_0) do
		for iter_5_2 = 1, iter_5_1.num do
			local var_5_1 = var_5_0.x + iter_5_1.offset.x + math.random(-30, 30)
			local var_5_2 = var_5_0.y + iter_5_1.offset.y + math.random(-30, 30)
			local var_5_3 = CCSprite:createWithSpriteFrameName("arrow_army0001.png")

			var_5_3:setPosition(var_5_1, var_5_2)
			arg_5_0.armyNode:addChild(var_5_3)
		end
	end
end

function var_0_3.showEffectArmy(arg_6_0)
	if not arg_6_0.armyNode then
		arg_6_0:addArmy()
	end

	local var_6_0 = arg_6_0.armyNode:getChildren()

	for iter_6_0 = 0, var_6_0:count() - 1 do
		local var_6_1 = CCArray:create()

		for iter_6_1 = 1, 10 do
			local var_6_2 = CCSprite:createWithSpriteFrameName(string.format("arrow_army%04d.png", iter_6_1))

			var_6_1:addObject(var_6_2:displayFrame())
		end

		local var_6_3 = CCAnimation:createWithSpriteFrames(var_6_1, 0.1)
		local var_6_4 = CCAnimate:create(var_6_3)
		local var_6_5 = tolua.cast(var_6_0:objectAtIndex(iter_6_0), "CCSprite")

		var_6_5:stopAllActions()
		var_6_5:runAction(var_6_4)
	end
end

function var_0_3.showEffectArrow(arg_7_0, arg_7_1)
	if arg_7_0.arrowNode then
		arg_7_0.arrowNode:removeAllChildrenWithCleanup(true)
	else
		arg_7_0.arrowNode = CCSpriteBatchNode:create("res/ui/battle/arrow_army.png")

		arg_7_0.control.layerTabel.fightLayer:addChild(arg_7_0.arrowNode, 1000)
	end

	local var_7_0 = arg_7_0.control.fightControl.defPosition[0]
	local var_7_1 = 10
	local var_7_2 = 140
	local var_7_3 = 0.6 * var_7_2
	local var_7_4 = {}

	for iter_7_0 = 0, arg_7_1 - 1 do
		local var_7_5 = arg_7_0.control.fightControl.defPosition[iter_7_0]

		for iter_7_1 = -1, 1 do
			table.insert(var_7_4, ccp(var_7_5.x + iter_7_1 * var_7_2, var_7_5.y - iter_7_1 * var_7_3))
		end
	end

	for iter_7_2, iter_7_3 in ipairs(var_0_0) do
		for iter_7_4 = 1, var_7_1 do
			local var_7_6 = var_7_0.x + iter_7_3.offset.x + math.random(-30, 30)
			local var_7_7 = var_7_0.y + iter_7_3.offset.y + math.random(-30, 30)
			local var_7_8 = var_7_4[math.random(1, #var_7_4)]
			local var_7_9 = var_7_8.x + math.random(-30, 30)
			local var_7_10 = var_7_8.y + math.random(-30, 30)
			local var_7_11 = 0.5 * (var_7_10 - var_7_7 + var_7_6 + var_7_9)
			local var_7_12 = 0.5 * (var_7_9 - var_7_6 + var_7_7 + var_7_10)
			local var_7_13 = 0
			local var_7_14 = 0

			if var_7_6 <= var_7_9 then
				if var_7_7 <= var_7_10 then
					local var_7_15 = math.atan((var_7_10 - var_7_7) / (var_7_9 - var_7_6))

					var_7_14 = 0.5 * (math.pi / 2 + var_7_15)
				else
					local var_7_16 = math.atan((var_7_10 - var_7_7) / (var_7_9 - var_7_6))

					var_7_14 = 0.5 * (math.pi / 2 - var_7_16)
				end
			elseif var_7_7 <= var_7_10 then
				local var_7_17 = math.pi + math.atan((var_7_10 - var_7_7) / (var_7_9 - var_7_6))

				var_7_14 = 0.5 * (math.pi / 2 + var_7_17)
			else
				local var_7_18 = math.pi + math.atan((var_7_10 - var_7_7) / (var_7_9 - var_7_6))

				var_7_14 = 0.5 * (math.pi * 2.5 - var_7_18)
			end

			local var_7_19 = 0.5 * (var_7_6 + var_7_9 + (var_7_10 - var_7_7) / math.tan(var_7_14))
			local var_7_20 = 0.5 * (var_7_7 + var_7_10 + (var_7_9 - var_7_6) * math.tan(var_7_14))
			local var_7_21 = CCPointArray:create(30)

			var_7_21:addControlPoint(ccp(var_7_6, var_7_7))
			var_7_21:addControlPoint(ccp(var_7_19, var_7_20))
			var_7_21:addControlPoint(ccp(var_7_9, var_7_10))

			local var_7_22 = CCSprite:createWithSpriteFrameName("arrow_big.png")

			var_7_22:setPosition(var_7_6, var_7_7)
			arg_7_0.arrowNode:addChild(var_7_22)

			local var_7_23 = 1.5
			local var_7_24 = 0.1 * math.random(1, 5)
			local var_7_25 = var_7_23 - var_7_24 / 2
			local var_7_26 = math.deg(var_7_14) + math.random(-20, 20)
			local var_7_27 = 0

			if var_7_6 <= var_7_9 then
				var_7_27 = 2 * var_7_26
			else
				var_7_27 = 2 * var_7_26 - 360
			end

			local var_7_28 = CCArray:create()

			var_7_28:addObject(CCCardinalSplineTo:create(var_7_25, var_7_21, 0))

			local var_7_29 = CCSequence:create(var_7_28)
			local var_7_30 = CCArray:create()

			var_7_30:addObject(CCRotateBy:create(var_7_25, var_7_27))

			local var_7_31 = CCSequence:create(var_7_30)
			local var_7_32 = CCArray:create()

			var_7_32:addObject(var_7_29)
			var_7_32:addObject(var_7_31)

			local var_7_33 = CCEaseSineOut:create(CCSpawn:create(var_7_32))
			local var_7_34 = CCArray:create()

			var_7_34:addObject(CCCallFunc:create(function()
				var_7_22:setPosition(var_7_6, var_7_7)
				var_7_22:setRotation(-var_7_26)
			end))
			var_7_34:addObject(CCFadeIn:create(var_7_24))
			var_7_34:addObject(var_7_33)
			var_7_34:addObject(CCFadeOut:create(0.3 - var_7_24 / 2))
			var_7_34:addObject(CCCallFunc:create(function()
				var_7_22:removeFromParentAndCleanup(true)
			end))

			local var_7_35 = CCSequence:create(var_7_34)

			var_7_22:runAction(var_7_35)
		end
	end
end

function var_0_3.showPanel(arg_10_0, arg_10_1)
	arg_10_0.control = arg_10_1

	arg_10_0.view.widgets.icon:removeAllChildrenWithCleanup(true)

	local var_10_0
	local var_10_1

	if arg_10_1.surround ~= 0 then
		var_10_0 = "bwqh_icon_bw.png"
	elseif arg_10_1.slam ~= 0 then
		var_10_0 = "bwqh_icon_fs.png"
	elseif arg_10_1.slamCd > 0 then
		var_10_0 = "bwqh_icon_fs.png"
		var_10_1 = true
	end

	if var_10_0 then
		arg_10_0.view.widgets.icon:setDisplayFrame(CCSprite:create("res/ui/battle/" .. var_10_0):displayFrame())
	end

	if var_10_1 then
		tool.spriteToGray(arg_10_0.view.widgets.icon)
	end

	arg_10_0:addArmy()
end

function var_0_3.ctor(arg_11_0, arg_11_1, arg_11_2)
	rmgr.loadResource("res/ui/battle/arrow_army.plist")
	initScriptEventNode(arg_11_0)

	arg_11_0.view = {}

	uiutil.initWidgets(arg_11_0.view, arg_11_0.layout)

	if arg_11_1 then
		arg_11_0:addChild(arg_11_0.view.widgets.btn_surround)
		arg_11_1:addChild(arg_11_0)
	end

	arg_11_0.view.widgets.btn_surround:addHandleOfControlEvent(function()
		log.info("btn_surround")
		arg_11_0:showTip()
	end, CCControlEventTouchUpInside)
	arg_11_0:showPanel(arg_11_2)
end

function var_0_3.onEnter(arg_13_0)
	arg_13_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_13_0, arg_13_0.update), 0, false)

	function arg_13_0.showSurroundArrowRef(arg_14_0, arg_14_1)
		arg_13_0:showEffectArmy()
		arg_13_0:showEffectArrow(arg_14_0)
		arg_13_0:stopAllActions()

		local var_14_0 = CCArray:create()

		var_14_0:addObject(CCDelayTime:create(1))
		var_14_0:addObject(CCCallFuncN:create(function()
			if arg_14_1 then
				arg_14_1()
			end
		end))

		local var_14_1 = CCSequence:create(var_14_0)

		arg_13_0:runAction(var_14_1)
	end

	eventManager.registerEvent("showSurroundArrow", arg_13_0.showSurroundArrowRef)
end

function var_0_3.onExit(arg_16_0)
	if arg_16_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_16_0.updateRef)
	end

	eventManager.unregisterEvent("showSurroundArrow", arg_16_0.showSurroundArrowRef)
end

function var_0_3.update(arg_17_0, arg_17_1)
	if arg_17_0.control and arg_17_0.control.slamCd then
		if arg_17_0.control.slamCd > 0 then
			arg_17_0.control.slamCd = arg_17_0.control.slamCd - 1000 * arg_17_1
		elseif arg_17_0.control.slamCd <= 0 then
			arg_17_0.control.slamCd = 0

			if arg_17_0.control.surround == 0 and arg_17_0.control.slam == 0 then
				arg_17_0:removeFromParentAndCleanup(true)
			end
		end
	end
end

return var_0_3
