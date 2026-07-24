local var_0_0 = class("CityOrderLayer", function()
	return createBaseLayer()
end)
local var_0_1 = {
	language.get(200401),
	language.get(200402),
	language.get(200403),
	language.get(200404)
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.cityId = arg_2_1

	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end, false, true)

	local var_2_0 = CCScale9Sprite:createWithSpriteFrameName("commanWindow.png", CCRectMake(52, 85, 1, 1))

	var_2_0:setPreferredSize(CCSizeMake(500, 238))
	var_2_0:setPosition(visibleSize.width / 2, visibleSize.height / 2)
	arg_2_0:addChild(var_2_0)

	arg_2_0.background = var_2_0

	local var_2_1 = CCStrokeLabelTTF:create(language.get(200405), "Thonburi", 26)

	var_2_1:setPosition(ccp(256, 206))
	var_2_0:addChild(var_2_1)

	local var_2_2 = 250
	local var_2_3 = 148
	local var_2_4 = 40

	arg_2_0.textRef = {}

	for iter_2_0, iter_2_1 in pairs(var_0_1) do
		local var_2_5 = CCStrokeLabelTTF:create(iter_2_1, "Thonburi", 22)

		var_2_5:setDimensions(CCSizeMake(480, 40))
		var_2_5:setPosition(ccp(240, 20))
		var_2_5:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_2_5:setVerticalAlignment(kCCVerticalTextAlignmentCenter)

		local var_2_6 = CCScale9Sprite:createWithSpriteFrameName("chat_tips_list_bg1.jpg", CCRectMake(10, 10, 69, 42))

		var_2_6:setPreferredSize(CCSizeMake(480, 40))
		var_2_6:setPosition(ccp(var_2_2, var_2_3 - (iter_2_0 - 1) * var_2_4))
		var_2_6:addChild(var_2_5)
		var_2_0:addChild(var_2_6)

		arg_2_0.textRef[iter_2_0] = var_2_5
	end
end

function var_0_0.onTouch(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_1 == CCTOUCHBEGAN then
		arg_4_0.touchPoint = ccp(arg_4_2, arg_4_3)

		for iter_4_0, iter_4_1 in pairs(arg_4_0.textRef) do
			if tool.checkIfTouch(iter_4_1.label, arg_4_2, arg_4_3) then
				arg_4_0.labelRefIdx = iter_4_0

				iter_4_1:setColor(ccc3(0, 255, 0))

				local var_4_0 = CCScale9Sprite:createWithSpriteFrameName("chat_tips_list_on.png", CCRectMake(10, 10, 69, 42))

				var_4_0:setPreferredSize(CCSizeMake(480, 40))
				iter_4_1:addChild(var_4_0)

				arg_4_0.highlight = var_4_0
			end
		end

		if not tool.checkIfTouch(arg_4_0.background, arg_4_2, arg_4_3) then
			arg_4_0.touchOut = true
		else
			arg_4_0.touchOut = false
		end

		return true
	elseif arg_4_1 == CCTOUCHENDED then
		if ccpDistance(ccp(arg_4_2, arg_4_3), arg_4_0.touchPoint) < 40 then
			if arg_4_0.labelRefIdx ~= nil then
				log.info(arg_4_0.cityId, var_0_1[arg_4_0.labelRefIdx])

				local var_4_1

				if user.pin == 0 then
					var_4_1 = language.get(200406)
				elseif user.pin == 1 then
					var_4_1 = language.get(200407)
				end

				local var_4_2 = worldConstant.BUILDING_INFO["world_building_" .. arg_4_0.cityId].name
				local var_4_3 = language.get(200408, var_4_2, var_4_1, var_0_1[arg_4_0.labelRefIdx])

				cmgr.sendRequest(nil, actions.sendChat, chatEnum.type.country, var_4_3, "")
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			elseif arg_4_0.touchOut then
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			end
		end

		if arg_4_0.labelRefIdx ~= nil then
			arg_4_0.textRef[arg_4_0.labelRefIdx]:setColor(ccc3(255, 255, 255))

			arg_4_0.labelRefIdx = nil
		end

		if arg_4_0.highlight ~= nil then
			arg_4_0.highlight:removeFromParentAndCleanup(true)

			arg_4_0.highlight = nil
		end
	end
end

return var_0_0
