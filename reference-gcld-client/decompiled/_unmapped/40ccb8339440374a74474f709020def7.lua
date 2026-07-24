local var_0_0 = class("LookEffectLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.control = arg_2_1.control
	arg_2_0.mask = nil
end

function var_0_0.playShaiziAnim(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0:getDiceTableByRandom(arg_3_1, arg_3_2)

	if arg_3_2 == 1 then
		arg_3_0:playShaiziAnimSingle(var_3_0[1], visibleSize.width * 0.5, visibleSize.height * 0.5 + 150)
	elseif arg_3_2 == 2 then
		arg_3_0:playShaiziAnimSingle(var_3_0[1], visibleSize.width * 0.5 - 50, visibleSize.height * 0.5 + 150)
		arg_3_0:playShaiziAnimSingle(var_3_0[2], visibleSize.width * 0.5 + 50, visibleSize.height * 0.5 + 150)
	elseif arg_3_2 == 3 then
		arg_3_0:playShaiziAnimSingle(var_3_0[1], visibleSize.width * 0.5 - 50, visibleSize.height * 0.5 + 150)
		arg_3_0:playShaiziAnimSingle(var_3_0[2], visibleSize.width * 0.5, visibleSize.height * 0.5 + 200)
		arg_3_0:playShaiziAnimSingle(var_3_0[3], visibleSize.width * 0.5 + 50, visibleSize.height * 0.5 + 150)
	else
		log.info("lastHit not in [1,3]!")
	end
end

function var_0_0.getDiceTableByRandom(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}
	local var_4_1 = arg_4_1
	local var_4_2 = 0

	for iter_4_0 = 1, arg_4_2 do
		if var_4_1 >= 6 then
			var_4_2 = math.random(1, 6)
		else
			var_4_2 = math.random(1, var_4_1)
		end

		var_4_0[iter_4_0] = var_4_2
		var_4_1 = var_4_1 - var_4_2
	end

	while var_4_1 > 0 do
		for iter_4_1 = 1, arg_4_2 do
			local var_4_3 = math.random(0, 6 - var_4_0[iter_4_1])

			if var_4_3 > 0 then
				if var_4_1 < var_4_3 then
					var_4_0[iter_4_1] = var_4_0[iter_4_1] + var_4_1
					var_4_1 = 0
				else
					var_4_0[iter_4_1] = var_4_0[iter_4_1] + var_4_3
					var_4_1 = var_4_1 - var_4_3
				end
			end
		end
	end

	return var_4_0
end

function var_0_0.playShaiziAnimSingle(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = CCSprite:createWithSpriteFrameName("shaizi_m_1.png")
	local var_5_1 = CCArray:create()

	for iter_5_0 = 1, 6 do
		local var_5_2 = tool.spriteFrameByName(string.format("shaizi_m_%s.png", iter_5_0))

		var_5_1:addObject(var_5_2)
	end

	local var_5_3 = CCAnimation:createWithSpriteFrames(var_5_1, 0.03)
	local var_5_4 = CCAnimate:create(var_5_3)
	local var_5_5 = CCRepeatForever:create(var_5_4)

	var_5_0:runAction(var_5_5)
	var_5_0:setPosition(arg_5_2 + math.random(0, 50) - 100, arg_5_3 + math.random(0, 50) + 50)
	arg_5_0:addChild(var_5_0)

	local var_5_6 = CCEaseSineIn:create(CCMoveBy:create(0.3, ccp(0, -300)))
	local var_5_7 = CCEaseSineIn:create(CCMoveBy:create(0.15, ccp(-1 * tool.random(50, 100), 0)))
	local var_5_8 = CCEaseSineIn:create(CCMoveBy:create(0.3, ccp(tool.random(150, 200), 0)))
	local var_5_9 = CCEaseSineIn:create(CCMoveBy:create(0.1, ccp(-1 * tool.random(50, 100), 0)))
	local var_5_10 = CCEaseSineIn:create(CCMoveBy:create(0.2, ccp(tool.random(50, 100), 0)))
	local var_5_11 = CCCallFunc:create(function()
		var_5_0:stopAction(var_5_5)
		var_5_0:setDisplayFrame(CCSprite:createWithSpriteFrameName(string.format("shaizi_i_%s.png", arg_5_1)):displayFrame())
	end)
	local var_5_12 = CCDelayTime:create(1)
	local var_5_13 = CCCallFunc:create(function()
		var_5_0:removeFromParentAndCleanup(true)
		arg_5_0.world:updateMenuLayer()
	end)
	local var_5_14 = CCArray:create()

	var_5_14:addObject(var_5_6)
	var_5_14:addObject(var_5_7)
	var_5_14:addObject(var_5_8)
	var_5_14:addObject(var_5_9)
	var_5_14:addObject(var_5_10)
	var_5_14:addObject(var_5_11)
	var_5_14:addObject(var_5_12)
	var_5_14:addObject(var_5_13)

	local var_5_15 = CCSequence:create(var_5_14)

	var_5_0:runAction(var_5_15)
end

function var_0_0.showCityEvent(arg_8_0, arg_8_1)
	if arg_8_0.mask ~= nil then
		return
	end

	local var_8_0 = CCLayerColor:create(ccc4(0, 0, 0, 128))

	arg_8_0.mask = var_8_0

	arg_8_0:addChild(var_8_0)

	local var_8_1 = CCSprite:createWithSpriteFrameName(string.format("cdsh_bg_%sfenghuotai.png", arg_8_1))

	var_8_1:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
	var_8_0:addChild(var_8_1)

	local var_8_2 = CCSprite:create(string.format("res/ui/common/text/activity/lookActivity/cdsh_meishuzi_%sdr.png", arg_8_1))

	var_8_2:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5 + 148)
	var_8_0:addChild(var_8_2)

	local var_8_3 = CCArray:create()

	var_8_3:addObject(CCDelayTime:create(0.8))
	var_8_3:addObject(CCCallFunc:create(function()
		var_8_0:removeFromParentAndCleanup(true)

		arg_8_0.mask = nil

		arg_8_0.control:lookSmallBox()
	end))

	local var_8_4 = CCSequence:create(var_8_3)

	var_8_0:runAction(var_8_4)
	var_8_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
		return true
	end, false, true)
	var_8_0:setTouchEnabled(true)
end

function var_0_0.showAreaCompleteReward(arg_11_0, arg_11_1)
	log.info("showAreaCompleteReward")

	if arg_11_0.mask ~= nil then
		return
	end

	local var_11_0 = CCLayerColor:create(ccc4(0, 0, 0, 128))

	arg_11_0.mask = var_11_0

	arg_11_0:addChild(var_11_0)

	local var_11_1 = CCSprite:createWithSpriteFrameName("cdsh_jnjl_bg.png")

	var_11_1:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
	var_11_0:addChild(var_11_1)

	for iter_11_0 = 1, arg_11_1 do
		local var_11_2 = CCSprite:createWithSpriteFrameName(string.format("cdsh_jnjl_%s.png", iter_11_0))

		if var_11_2 ~= nil then
			var_11_2:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
			var_11_0:addChild(var_11_2)
		end
	end

	local var_11_3 = CCSprite:createWithSpriteFrameName("cdsh_jnjl_frame.png")

	var_11_3:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
	var_11_0:addChild(var_11_3)

	local var_11_4 = CCSprite:create("res/ui/common/text/activity/lookActivity/cdsh_meishuzi_jnjl.png")

	var_11_4:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5 + 185)
	var_11_0:addChild(var_11_4)

	local var_11_5 = CCSprite:createWithSpriteFrameName("cdsh_icon_yinzhang.png")

	var_11_5:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
	var_11_5:setOpacity(0)
	var_11_5:setScale(2)

	local var_11_6 = CCArray:create()

	var_11_6:addObject(CCSpawn:createWithTwoActions(CCFadeIn:create(0.5), CCScaleTo:create(0.5, 1)))
	var_11_6:addObject(CCDelayTime:create(0.8))
	var_11_6:addObject(CCCallFunc:create(function()
		local var_12_0 = CCSprite:createWithSpriteFrameName("cdsh_icon_baoxiang1.png")

		var_12_0:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
		var_12_0:setTag(1001)
		arg_11_0.mask:addChild(var_12_0)
		arg_11_0.mask:setTouchEnabled(true)
	end))

	local var_11_7 = CCSequence:create(var_11_6)

	var_11_5:runAction(var_11_7)
	var_11_0:addChild(var_11_5)
	var_11_0:registerScriptTouchHandler(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHENDED then
			tolua.cast(arg_11_0.mask:getChildByTag(1001), "CCSprite"):setDisplayFrame(CCSprite:createWithSpriteFrameName("cdsh_icon_baoxiang2.png"):displayFrame())
			arg_11_0.control:getRewardLook()

			local var_13_0 = CCArray:create()

			var_13_0:addObject(CCDelayTime:create(1))
			var_13_0:addObject(CCCallFunc:create(function()
				arg_11_0.mask:removeFromParentAndCleanup(true)

				arg_11_0.mask = nil
			end))

			local var_13_1 = CCSequence:create(var_13_0)

			arg_11_0.mask:runAction(var_13_1)

			return
		end

		return true
	end, false, true)
end

return var_0_0
