local var_0_0 = class("WaterGauge", function()
	return CCSprite:create("res/ui/kfworld/water/kfjrj_kdb_di.png")
end)

function var_0_0.ctor(arg_2_0)
	local var_2_0 = CCSprite:create("res/ui/kfworld/water/kfjrj_hx.png")

	var_2_0:setPosition(29, 92)
	arg_2_0:addChild(var_2_0, 2)

	local var_2_1 = CCSprite:create("res/ui/kfworld/water/kfjrj_hxh.png")

	var_2_1:setPosition(30.5, 8.5)
	var_2_0:addChild(var_2_1, -1)

	local var_2_2 = CCFadeIn:create(0.5)
	local var_2_3 = var_2_2:reverse()
	local var_2_4 = CCRepeatForever:create(CCSequence:createWithTwoActions(var_2_2, var_2_3))

	var_2_1:runAction(var_2_4)

	local var_2_5 = CCSprite:create("res/ui/kfworld/water/kfjrj_gq.png")

	var_2_5:setPosition(29, 50)
	arg_2_0:addChild(var_2_5, 1)
	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)

	local var_2_6 = CCArray:create()
	local var_2_7 = CCSprite:create()

	for iter_2_0 = 1, 5 do
		local var_2_8 = CCSprite:create("res/ui/kfworld/water/" .. iter_2_0 .. ".png"):displayFrame()

		var_2_6:addObject(var_2_8)
	end

	local var_2_9 = CCAnimation:createWithSpriteFrames(var_2_6, 0.1)
	local var_2_10 = CCAnimate:create(var_2_9)
	local var_2_11 = CCRepeatForever:create(var_2_10)

	var_2_7:runAction(var_2_11)
	var_2_7:setAnchorPoint(ccp(0.5, 0))
	var_2_7:setPosition(29, 10)
	arg_2_0:addChild(var_2_7)

	local var_2_12 = CCSprite:create("res/ui/kfworld/water/w.png")

	var_2_12:setAnchorPoint(ccp(0.5, 0))
	var_2_12:setPosition(29, 10)
	arg_2_0:addChild(var_2_12)

	arg_2_0.wave = var_2_7
	arg_2_0.water = var_2_12

	arg_2_0:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onTouch), false, false)
	arg_2_0:setTouchEnabled(true)
end

function var_0_0.updateChangeRoadInfo(arg_4_0, arg_4_1)
	arg_4_0.info = arg_4_1
end

function var_0_0.update(arg_5_0, arg_5_1)
	if arg_5_0.info then
		if arg_5_0.info.nextChangeSeconds > 0 then
			arg_5_0.info.nextChangeSeconds = arg_5_0.info.nextChangeSeconds - arg_5_1

			local var_5_0 = 0

			if arg_5_0.info.connect == 1 then
				var_5_0 = 1 - math.abs(arg_5_0.info.connectSeconds / 2 - arg_5_0.info.nextChangeSeconds) / arg_5_0.info.connectSeconds
			else
				var_5_0 = math.abs(arg_5_0.info.disconnectSeconds / 2 - arg_5_0.info.nextChangeSeconds) / arg_5_0.info.disconnectSeconds
			end

			local var_5_1 = (1 - var_5_0) * 164

			arg_5_0.wave:setPosition(29, 10 + var_5_1)
			tool.scaleTo(arg_5_0.water, 40, var_5_1)
		else
			if arg_5_0.info.connect == 1 then
				arg_5_0.info.connect = 0
				arg_5_0.info.nextChangeSeconds = arg_5_0.info.disconnectSeconds
			else
				arg_5_0.info.connect = 1
				arg_5_0.info.nextChangeSeconds = arg_5_0.info.connectSeconds
			end

			eventManager.dispatchEvent("bridgeConnect", arg_5_0.info.connect)
		end
	end
end

function var_0_0.onTouch(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if arg_6_1 == CCTOUCHENDED then
		if arg_6_0.tips then
			arg_6_0.tips:removeFromParentAndCleanup(true)

			arg_6_0.tips = nil
		end

		if tool.checkIfTouch(arg_6_0, arg_6_2, arg_6_3) then
			local var_6_0 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

			var_6_0:setPreferredSize(CCSizeMake(235, 60))
			var_6_0:setAnchorPoint(ccp(1, 1))
			var_6_0:setPosition(0, arg_6_0:getContentSize().height / 2)
			arg_6_0:addChild(var_6_0, 10)

			local var_6_1 = language.get("410501_yyl")
			local var_6_2 = CCStrokeLabelTTF:create(var_6_1, "Thonburi", 20)

			var_6_2:setDimensions(CCSizeMake(230, 0))
			var_6_2:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_6_2:setAnchorPoint(ccp(0, 0))
			var_6_0:addChild(var_6_2)

			local var_6_3 = var_6_2:getContentSize()

			var_6_0:setPreferredSize(CCSizeMake(var_6_3.width + 20, var_6_3.height + 20))
			var_6_2:setPosition(ccp(10, 10))

			arg_6_0.tips = var_6_0

			performWithDelay(var_6_0, function()
				arg_6_0.tips:removeFromParentAndCleanup(true)

				arg_6_0.tips = nil
			end, 2)
		end
	end

	return true
end

function var_0_0.onEnter(arg_8_0)
	arg_8_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_8_0, arg_8_0.update), 0.1, false)
end

function var_0_0.onExit(arg_9_0)
	if arg_9_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_9_0.updateSchedulerEntry)

		arg_9_0.updateSchedulerEntry = nil
	end
end

return var_0_0
