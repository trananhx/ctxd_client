local var_0_0 = class("MoveLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.ad = arg_2_1
	arg_2_0.cityPath = require("lua/layer/activity/ancientCastle/config/tanbaoCubePoly_" .. arg_2_0.ad.mapId)
	arg_2_0.tracePoints = require("lua/layer/activity/ancientCastle/config/tracePoints_" .. arg_2_0.ad.mapId)
end

function var_0_0.initLocation(arg_3_0, arg_3_1)
	if arg_3_0.sprite ~= nil then
		arg_3_0.sprite:removeFromParentAndCleanup(true)
	end

	arg_3_0.sprite = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

	local var_3_0 = CCSprite:create("res/ui/activity/ancientCastle/gctb_mc.png")

	var_3_0:setPosition(arg_3_0.sprite:getContentSize().width / 2, arg_3_0.sprite:getContentSize().height / 2)
	tool.scaleTo(var_3_0, 59, 59)
	arg_3_0.sprite:addChild(var_3_0)

	local var_3_1, var_3_2 = arg_3_0.ad.mapLayer.cityTable[arg_3_1].sprite:getPosition()

	arg_3_0.sprite:setPosition(var_3_1, var_3_2)
	arg_3_0:addChild(arg_3_0.sprite)
end

function var_0_0.moveBetween(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local var_4_0 = require("lua/layer/activity/ancientCastle/config/4/city")

	if var_4_0 and var_4_0.timeGap then
		local var_4_1

		if arg_4_2 < arg_4_1 then
			var_4_1 = arg_4_2 .. "-" .. arg_4_1
		else
			var_4_1 = arg_4_1 .. "-" .. arg_4_2
		end

		if var_4_0.timeGap[var_4_1] then
			log.info("current path:" .. var_4_1 .. " time: " .. var_4_0.timeGap[var_4_1])
		else
			log.info("no path time info")
		end
	end

	local var_4_2 = arg_4_0.sprite
	local var_4_3 = arg_4_0.cityPath.curve(arg_4_1, arg_4_2)
	local var_4_4 = {
		count = arg_4_0.tracePoints.elapse(arg_4_1, arg_4_2).count + 1
	}
	local var_4_5 = arg_4_0
	local var_4_6 = 0
	local var_4_7 = arg_4_0.tracePoints.elapse(arg_4_1, arg_4_2)
	local var_4_8 = var_4_6 + var_4_7.count + 1
	local var_4_9 = CCSpriteBatchNode:create("res/ui/world/path_icon.png", var_4_8)

	var_4_9:setPosition(ccp(0, 0))
	var_4_5:addChild(var_4_9)

	if arg_4_1 < arg_4_2 then
		for iter_4_0 = 1, var_4_7.count do
			local var_4_10 = var_4_7.time[iter_4_0]
			local var_4_11, var_4_12 = arg_4_0.cityPath.position(var_4_3, arg_4_1, arg_4_2, var_4_10)
			local var_4_13 = CCSprite:createWithTexture(var_4_9:getTexture())

			var_4_13:setPosition(ccp(var_4_11, var_4_12))
			var_4_9:addChild(var_4_13)

			var_4_4["icon_" .. iter_4_0] = var_4_13
			var_4_4["percent_" .. iter_4_0] = var_4_10

			if ignoreLine then
				var_4_13:setVisible(false)
			end
		end
	else
		for iter_4_1 = 1, var_4_7.count do
			local var_4_14 = var_4_7.time[var_4_7.count + 1 - iter_4_1]
			local var_4_15, var_4_16 = arg_4_0.cityPath.position(var_4_3, arg_4_2, arg_4_1, var_4_14)
			local var_4_17 = CCSprite:createWithTexture(var_4_9:getTexture())

			var_4_17:setPosition(ccp(var_4_15, var_4_16))
			var_4_9:addChild(var_4_17)

			var_4_4["icon_" .. iter_4_1] = var_4_17
			var_4_4["percent_" .. iter_4_1] = 1 - var_4_14

			if ignoreLine then
				var_4_17:setVisible(false)
			end
		end
	end

	local var_4_18 = 0
	local var_4_19 = CCDirector:sharedDirector():getScheduler()
	local var_4_20

	local function var_4_21(arg_5_0)
		if var_4_2 == nil or tolua.isnull(var_4_2) then
			var_4_19:unscheduleScriptEntry(var_4_20)

			return
		end

		var_4_18 = var_4_18 + arg_5_0

		local var_5_0 = var_4_18 / arg_4_3
		local var_5_1, var_5_2 = arg_4_0.cityPath.position(var_4_3, arg_4_1, arg_4_2, var_5_0)

		var_4_2:setPosition(ccp(var_5_1, var_5_2))

		if var_5_0 >= 1 then
			arg_4_4()
			var_4_19:unscheduleScriptEntry(var_4_20)
		end

		for iter_5_0 = 1, var_4_7.count do
			if var_5_0 >= var_4_4["percent_" .. iter_5_0] then
				var_4_4["icon_" .. iter_5_0]:setVisible(false)
			end
		end
	end

	if var_4_20 == nil then
		var_4_20 = var_4_19:scheduleScriptFunc(var_4_21, 0, false)
	end
end

function var_0_0.move(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = tool.split(arg_6_1, ",")
	local var_6_1 = {}
	local var_6_2 = 1

	var_6_1[var_6_2] = function()
		if arg_6_0.ad.state == arg_6_0.ad.STATE.MOVING_WITH_STEP then
			arg_6_0.ad.state = arg_6_0.ad.STATE.IDLE_WITH_STEP
		elseif arg_6_0.ad.state == arg_6_0.ad.STATE.MOVING_WITHOUT_STEP then
			arg_6_0.ad.state = arg_6_0.ad.STATE.IDLE_WITHOUT_STEP
		end

		arg_6_0.ad.infoLayer:updateShaizi()

		if arg_6_2 then
			arg_6_0.ad.infoLayer:showFinalBox()
		end
	end

	local var_6_3 = 1.5

	if conf.debug then
		var_6_3 = 0.3
	end

	for iter_6_0 = #var_6_0 - 1, 1, -1 do
		local var_6_4 = tonumber(var_6_0[iter_6_0])
		local var_6_5 = tonumber(var_6_0[iter_6_0 + 1])

		var_6_1[#var_6_0 - iter_6_0 + 1] = function()
			arg_6_0:moveBetween(var_6_4, var_6_5, var_6_3, var_6_1[#var_6_0 - iter_6_0])
			arg_6_0.ad.mapLayer.effectLayer:chechBoxWillOpen(var_6_4, var_6_5, var_6_3)
		end
		var_6_2 = var_6_2 + 1
	end

	var_6_1[#var_6_1]()

	local var_6_6 = tonumber(var_6_0[#var_6_0])
	local var_6_7 = arg_6_0.ad.mapLayer.cityTable[var_6_6].sprite
	local var_6_8 = CCJumpBy:create(1, ccp(0, 0), 40, 1)
	local var_6_9 = CCSprite:create("res/ui/guide/jiantou-xia.png")
	local var_6_10, var_6_11 = var_6_7:getPosition()

	var_6_9:setPosition(ccp(var_6_10, var_6_11 + 80))
	arg_6_0:addChild(var_6_9, 130)
	var_6_9:runAction(CCRepeatForever:create(var_6_8))

	local var_6_12 = CCSequence:createWithTwoActions(CCDelayTime:create(2), CCCallFuncN:create(function()
		var_6_9:removeFromParentAndCleanup(true)
	end))

	var_6_9:runAction(var_6_12)
end

return var_0_0
