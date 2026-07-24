local var_0_0 = class("circleListNode", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2, ...)
	arg_2_0._items = {}
	arg_2_0._width = arg_2_1
	arg_2_0._height = arg_2_2
	arg_2_0._circleLayer = createBaseLayer()

	local var_2_0 = CCScrollView:create(CCSizeMake(arg_2_1, arg_2_2))

	var_2_0:setContainer(arg_2_0._circleLayer)
	var_2_0:setContentSize(CCSizeMake(arg_2_1, arg_2_2))
	var_2_0:setDirection(kCCScrollViewDirectionVertical)
	var_2_0:setContentOffset(ccp(0, 0))
	var_2_0:setTouchEnabled(false)
	arg_2_0:addChild(var_2_0)
	arg_2_0:setContentSize(CCSizeMake(arg_2_1, arg_2_2))
end

function var_0_0.setItems(arg_3_0, arg_3_1)
	arg_3_0._items = arg_3_1

	for iter_3_0, iter_3_1 in pairs(arg_3_0._items) do
		iter_3_1:ignoreAnchorPointForPosition(true)
		iter_3_1:setPosition(0, arg_3_0._height * (iter_3_0 - 1))
		arg_3_0._circleLayer:addChild(iter_3_1)
	end
end

function var_0_0.runCircleAction(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_1 + 10 * #arg_4_0._items - 1
	local var_4_1 = arg_4_0._height * var_4_0
	local var_4_2 = arg_4_2

	for iter_4_0, iter_4_1 in pairs(arg_4_0._items) do
		local var_4_3 = CCMoveBy:create(var_4_2, ccp(0, -var_4_1))
		local var_4_4 = CCEaseSineInOut:create(var_4_3)

		iter_4_1:runAction(var_4_4)
	end

	arg_4_0:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(var_4_2), CCCallFunc:create(arg_4_3 or function()
		return
	end)))
end

function var_0_0.stopCircleAction(arg_6_0, ...)
	return
end

function var_0_0.update(arg_7_0, ...)
	for iter_7_0, iter_7_1 in pairs(arg_7_0._items) do
		local var_7_0, var_7_1 = iter_7_1:getPosition()

		while var_7_1 < -1 * arg_7_0._height do
			var_7_1 = var_7_1 + arg_7_0._height * #arg_7_0._items
		end

		iter_7_1:setPosition(ccp(var_7_0, var_7_1))
	end
end

function var_0_0.onEnter(arg_8_0)
	log.info("onEnter")

	arg_8_0.updateTextRunHandler = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_8_0, arg_8_0.update), 0, false)
end

function var_0_0.onExit(arg_9_0)
	log.info("onExit")

	if arg_9_0.updateTextRunHandler then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_9_0.updateTextRunHandler)

		arg_9_0.updateTextRunHandler = nil
	end
end

return var_0_0
