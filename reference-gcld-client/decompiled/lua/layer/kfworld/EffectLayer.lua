local var_0_0 = class("KfEffectLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.effectTable = {}
	arg_2_0.arrowTable = {}

	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end)
	arg_2_0:setTouchEnabled(true)
end

function var_0_0.handlerGetWorldMapAction(arg_4_0, arg_4_1)
	if arg_4_0.world.matchState ~= 2 then
		return
	end

	arg_4_0.data = arg_4_1.data

	if arg_4_1.data.worldstg then
		for iter_4_0, iter_4_1 in pairs(arg_4_1.data.worldstg) do
			local var_4_0 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_npc_bg.png")
			local var_4_1 = CCSprite:create(string.format("res/ui/kfworld/%s.png", iter_4_1.armyPic))

			var_4_1:setPosition(ccp(37, 30))
			var_4_0:addChild(var_4_1)

			local var_4_2 = CCStrokeLabelTTF:create(iter_4_1.stgName, "Thonburi", 24)

			var_4_2:setPosition(ccp(100, 22))
			var_4_0:addChild(var_4_2)

			local var_4_3 = createTimerLabel(iter_4_1.cd, "@M:@S", "Thonburi", 24, nil, nil, nil, ccc3(255, 0, 0))

			var_4_3:setPosition(ccp(170, 22))
			var_4_0:addChild(var_4_3)

			local var_4_4, var_4_5 = arg_4_0.world.mapLayer.cityTable[iter_4_1.cityId].sprite:getPosition()

			var_4_0:setPosition(ccp(var_4_4, var_4_5 + 70))
			arg_4_0:addChild(var_4_0)

			arg_4_0.effectTable[iter_4_1.cityId] = var_4_0
		end
	end

	for iter_4_2, iter_4_3 in pairs(arg_4_1.data.city) do
		if (iter_4_3.iron > 0 or iter_4_3.food > 0 or iter_4_3.exp > 0) and iter_4_3.force == 4 then
			local var_4_6 = CCSprite:create("res/ui/world/worldEventBtn1.png")
			local var_4_7

			if iter_4_3.iron > 0 then
				var_4_7 = CCSprite:create("res/ui/task/get_icon_iron.png")
			elseif iter_4_3.food > 0 then
				var_4_7 = CCSprite:create("res/ui/task/get_icon_food.png")
			elseif iter_4_3.exp > 0 then
				var_4_7 = CCSprite:create("res/ui/task/get_icon_exp.png")
			end

			var_4_7:setPosition(var_4_6:getContentSize().width / 2, var_4_6:getContentSize().height / 2)
			var_4_6:addChild(var_4_7)

			local var_4_8, var_4_9 = arg_4_0.world.mapLayer.cityTable[iter_4_3.id].sprite:getPosition()

			var_4_6:setPosition(ccp(var_4_8, var_4_9 + 90))
			arg_4_0:addChild(var_4_6)
		end
	end

	arg_4_0:getJieBingInfo()

	if arg_4_1.data.choosenpcai then
		arg_4_0:initAlly(arg_4_1.data.choosenpcai)
	end

	if user.kfworldId == 2 then
		-- block empty
	end
end

function var_0_0.handlerGetWorldMapActionInt(arg_5_0, arg_5_1)
	if arg_5_0.world.matchState ~= 2 then
		return
	end

	arg_5_0.data = arg_5_1.data

	if arg_5_1.data.worldstg then
		for iter_5_0, iter_5_1 in pairs(arg_5_1.data.worldstg) do
			local var_5_0 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_npc_bg.png")
			local var_5_1 = CCSprite:create(string.format("res/ui/kfworld/%s.png", iter_5_1.armyPic))

			var_5_1:setPosition(ccp(37, 30))
			var_5_0:addChild(var_5_1)

			local var_5_2 = CCStrokeLabelTTF:create(iter_5_1.stgName, "Thonburi", 24)

			var_5_2:setAnchorPoint(ccp(0, 0.5))
			var_5_2:setPosition(ccp(var_5_1:getPositionX() + var_5_1:getContentSize().width / 2, 22))
			var_5_0:addChild(var_5_2)

			local var_5_3 = createTimerLabel(iter_5_1.cd, "@M:@S", "Thonburi", 24, nil, nil, nil, ccc3(255, 0, 0))

			var_5_3:setPosition(ccp(var_5_2:getPositionX() + var_5_2:getContentSize().width + 40, 22))
			var_5_0:addChild(var_5_3)

			local var_5_4, var_5_5 = arg_5_0.world.mapLayer.cityTable[iter_5_1.cityId].sprite:getPosition()

			var_5_0:setPosition(ccp(var_5_4, var_5_5 + 70))
			arg_5_0:addChild(var_5_0)

			arg_5_0.effectTable[iter_5_1.cityId] = var_5_0
		end
	end

	for iter_5_2, iter_5_3 in pairs(arg_5_1.data.city) do
		if (iter_5_3.iron > 0 or iter_5_3.food > 0 or iter_5_3.exp > 0) and iter_5_3.force == 4 then
			local var_5_6 = CCSprite:create("res/ui/world/worldEventBtn1.png")
			local var_5_7

			if iter_5_3.iron > 0 then
				var_5_7 = CCSprite:create("res/ui/task/get_icon_iron.png")
			elseif iter_5_3.food > 0 then
				var_5_7 = CCSprite:create("res/ui/task/get_icon_food.png")
			elseif iter_5_3.exp > 0 then
				var_5_7 = CCSprite:create("res/ui/task/get_icon_exp.png")
			end

			var_5_7:setPosition(var_5_6:getContentSize().width / 2, var_5_6:getContentSize().height / 2)
			var_5_6:addChild(var_5_7)

			local var_5_8, var_5_9 = arg_5_0.world.mapLayer.cityTable[iter_5_3.id].sprite:getPosition()

			var_5_6:setPosition(ccp(var_5_8, var_5_9 + 90))
			arg_5_0:addChild(var_5_6)
		end
	end

	arg_5_0:getJieBingInfoInt()

	if arg_5_1.data.choosenpcai then
		arg_5_0:initAlly(arg_5_1.data.choosenpcai)
	end

	if user.kfworldId == 2 then
		-- block empty
	end
end

function var_0_0.getJieBingInfo(arg_6_0)
	if arg_6_0.world.matchState ~= 2 then
		return
	end

	local function var_6_0(arg_7_0)
		for iter_7_0, iter_7_1 in pairs(arg_7_0.data.jiebingInfo) do
			if arg_6_0.effectTable[iter_7_1.cityId] and not tolua.isnull(arg_6_0.effectTable[iter_7_1.cityId]) then
				arg_6_0.effectTable[iter_7_1.cityId]:removeFromParentAndCleanup(true)
			end

			local var_7_0 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_npc_bg.png")
			local var_7_1 = CCSprite:create("res/ui/kfworld/kfgz_icon_jbc.png")

			var_7_1:setPosition(ccp(22, 22))
			var_7_0:addChild(var_7_1)

			local var_7_2 = CCStrokeLabelTTF:create(language.get(430003), "Thonburi", 24)

			var_7_2:setPosition(ccp(100, 22))
			var_7_0:addChild(var_7_2)

			if iter_7_1.cd < 0 then
				var_7_2:setString(language.get(430004))
			else
				local var_7_3

				local function var_7_4()
					var_7_2:setString(language.get(430004))

					if var_7_3 then
						var_7_3:removeFromParentAndCleanup(true)
					end

					arg_6_0:getJieBingInfo()
				end

				var_7_3 = createTimerLabel(iter_7_1.cd, "@M:@S", "Thonburi", 24, var_7_4, nil, nil, ccc3(255, 0, 0))

				var_7_3:setPosition(ccp(170, 22))
				var_7_0:addChild(var_7_3)
			end

			local var_7_5, var_7_6 = arg_6_0.world.mapLayer.cityTable[iter_7_1.cityId].sprite:getPosition()

			var_7_0:setPosition(ccp(var_7_5, var_7_6 + 70))
			arg_6_0:addChild(var_7_0)

			arg_6_0.effectTable[iter_7_1.cityId] = var_7_0
		end
	end

	kfcmgr.sendRequest(var_6_0, actions.getJieBingInfo)
end

function var_0_0.getJieBingInfoInt(arg_9_0)
	local var_9_0 = {}

	if conf.language == "tha" then
		var_9_0.trickFontSize = -4
	else
		var_9_0.trickFontSize = 0
	end

	if arg_9_0.world.matchState ~= 2 then
		return
	end

	local function var_9_1(arg_10_0)
		for iter_10_0, iter_10_1 in pairs(arg_10_0.data.jiebingInfo) do
			if arg_9_0.effectTable[iter_10_1.cityId] and not tolua.isnull(arg_9_0.effectTable[iter_10_1.cityId]) then
				arg_9_0.effectTable[iter_10_1.cityId]:removeFromParentAndCleanup(true)
			end

			local var_10_0 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_npc_bg.png")
			local var_10_1 = CCSprite:create("res/ui/kfworld/kfgz_icon_jbc.png")

			var_10_1:setPosition(ccp(22, 22))
			var_10_0:addChild(var_10_1)

			local var_10_2 = CCStrokeLabelTTF:create(language.get(430003), "Thonburi", 24)

			var_10_2:setAnchorPoint(ccp(0, 0.5))
			var_10_2:setPosition(ccp(var_10_1:getPositionX() + var_10_1:getContentSize().width / 2, 22))
			var_10_0:addChild(var_10_2)

			if iter_10_1.cd < 0 then
				var_10_2:setString(language.get(430004))
			else
				local var_10_3

				local function var_10_4()
					var_10_2:setString(language.get(430004))

					if var_10_3 then
						var_10_3:removeFromParentAndCleanup(true)
					end

					arg_9_0:getJieBingInfo()
				end

				var_10_3 = createTimerLabel(iter_10_1.cd, "@M:@S", "Thonburi", 24 + var_9_0.trickFontSize, var_10_4, nil, nil, ccc3(255, 0, 0))

				var_10_3:setPosition(ccp(var_10_2:getPositionX() + var_10_2:getContentSize().width + 40, var_10_2:getPositionY()))
				var_10_0:addChild(var_10_3)
			end

			local var_10_5, var_10_6 = arg_9_0.world.mapLayer.cityTable[iter_10_1.cityId].sprite:getPosition()

			var_10_0:setPosition(ccp(var_10_5, var_10_6 + 70))
			arg_9_0:addChild(var_10_0)

			arg_9_0.effectTable[iter_10_1.cityId] = var_10_0
		end
	end

	kfcmgr.sendRequest(var_9_1, actions.getJieBingInfo)
end

local var_0_1 = {
	luoshi = {
		num = 44,
		name = "ls%04d.png",
		artText = "res/ui/kfworld/city_imp_lszj.png"
	},
	huogong = {
		num = 15,
		name = "hg%04d.png",
		artText = "res/ui/kfworld/city_imp_ggzj.png"
	},
	shuigong = {
		num = 29,
		name = "sg_%05d.png",
		artText = "res/ui/kfworld/city_imp_sgzj.png"
	}
}

function var_0_0.updateTrick(arg_12_0, arg_12_1)
	if arg_12_0.world.matchState ~= 2 then
		return
	end

	for iter_12_0, iter_12_1 in pairs(arg_12_1.worldstg) do
		if arg_12_0.effectTable[iter_12_1.cityId] and not tolua.isnull(arg_12_0.effectTable[iter_12_1.cityId]) then
			arg_12_0.effectTable[iter_12_1.cityId]:removeFromParentAndCleanup(true)
		end

		local var_12_0 = CCSprite:create("res/ui/kfworld/kfgz_jxjd_npc_bg.png")
		local var_12_1 = CCSprite:create(string.format("res/ui/kfworld/%s.png", iter_12_1.armyPic))

		var_12_1:setPosition(ccp(37, 30))
		var_12_0:addChild(var_12_1)

		local var_12_2 = CCStrokeLabelTTF:create(iter_12_1.stgName, "Thonburi", 24)

		var_12_2:setPosition(ccp(100, 22))
		var_12_0:addChild(var_12_2)

		local var_12_3 = createTimerLabel(iter_12_1.cd, "@M:@S", "Thonburi", 24, nil, nil, nil, ccc3(255, 0, 0))

		var_12_3:setPosition(ccp(170, 22))
		var_12_0:addChild(var_12_3)

		local var_12_4, var_12_5 = arg_12_0.world.mapLayer.cityTable[iter_12_1.cityId].sprite:getPosition()

		var_12_0:setPosition(ccp(var_12_4, var_12_5 + 70))
		arg_12_0:addChild(var_12_0)

		arg_12_0.effectTable[iter_12_1.cityId] = var_12_0

		if iter_12_1.wstgResult then
			for iter_12_2, iter_12_3 in pairs(iter_12_1.wstgResult) do
				local var_12_6 = arg_12_0.world.config:getCity(iter_12_3.wsrcity)

				if var_12_6.trick and var_0_1[var_12_6.trick] then
					local var_12_7 = string.format("res/ui/world/operateIcon/animation/%s.plist", var_12_6.trick)

					rmgr.loadResource(var_12_7)

					local var_12_8 = CCSprite:create()
					local var_12_9 = CCSprite:create(var_0_1[var_12_6.trick].artText)

					var_12_8:addChild(var_12_9)

					local var_12_10 = arg_12_0.world.mapLayer.cityTable[iter_12_3.wsrcity].sprite

					var_12_8:setPosition(ccp(var_12_10:getPosition()))
					arg_12_0:addChild(var_12_8)

					local var_12_11 = CCArray:create()

					for iter_12_4 = 1, var_0_1[var_12_6.trick].num do
						local var_12_12 = CCSprite:createWithSpriteFrameName(string.format(var_0_1[var_12_6.trick].name, iter_12_4))

						var_12_11:addObject(var_12_12:displayFrame())
					end

					local var_12_13 = CCAnimation:createWithSpriteFrames(var_12_11, 0.1)
					local var_12_14 = CCAnimate:create(var_12_13)
					local var_12_15 = CCCallFunc:create(function()
						var_12_8:removeFromParentAndCleanup(true)
					end)

					var_12_8:runAction(CCSequence:createWithTwoActions(var_12_14, var_12_15))
					CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_12_7)
				end
			end
		end
	end
end

function var_0_0.initAlly(arg_14_0, arg_14_1)
	for iter_14_0 = 1, 3 do
		if arg_14_0.arrowTable[iter_14_0] then
			return
		end

		local var_14_0 = CCSprite:create()

		for iter_14_1 = 1, 5 do
			local var_14_1 = CCSprite:create("res/ui/kfworld/cro_jr_arrow.png")

			var_14_1:setPosition(12 * (iter_14_1 - 1), 0)
			var_14_0:addChild(var_14_1)

			local var_14_2 = CCSequence:createWithTwoActions(CCDelayTime:create(0.1 * iter_14_1), CCCallFunc:create(function()
				local var_15_0 = CCFadeIn:create(0.3)
				local var_15_1 = var_15_0:reverse()
				local var_15_2 = CCRepeatForever:create(CCSequence:createWithTwoActions(var_15_0, var_15_1))

				var_14_1:stopAllActions()
				var_14_1:runAction(var_15_2)
			end))

			var_14_1:runAction(var_14_2)
		end

		local var_14_3 = arg_14_0.world.config:getPathArrow(iter_14_0)
		local var_14_4 = var_14_3.rx
		local var_14_5 = var_14_3.ry

		var_14_0:setPosition(var_14_3.x, var_14_3.y)
		var_14_0:setRotation(var_14_3.rotation)
		arg_14_0:addChild(var_14_0)

		arg_14_0.arrowTable[iter_14_0] = {}
		arg_14_0.arrowTable[iter_14_0].sprite = var_14_0

		local var_14_6 = CCSprite:create("res/ui/kfworld/kfjrj_yd.png")

		var_14_6:setAnchorPoint(ccp(0.5, 0))
		var_14_6:setPosition(var_14_4, var_14_5)
		arg_14_0:addChild(var_14_6)

		arg_14_0.arrowTable[iter_14_0].red = var_14_6

		if arg_14_1.choosed == iter_14_0 then
			var_14_0:setVisible(true)
			var_14_6:setVisible(false)
		else
			var_14_0:setVisible(false)
			var_14_6:setVisible(true)
		end

		if arg_14_0.data.officeId >= 3 then
			var_14_6:setVisible(false)
		end
	end
end

function var_0_0.handlerPushNpcAI(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.data.choosen.choosenpcai.choosed

	log.info("response", tool.tableToJson(arg_16_1))

	if var_16_0 then
		for iter_16_0 = 1, 3 do
			if arg_16_0.arrowTable[iter_16_0] then
				local var_16_1 = arg_16_0.arrowTable[iter_16_0].sprite
				local var_16_2 = arg_16_0.arrowTable[iter_16_0].red

				if tonumber(var_16_0) == iter_16_0 then
					var_16_1:setVisible(true)
					var_16_2:setVisible(false)
				else
					var_16_1:setVisible(false)
					var_16_2:setVisible(true)
				end

				if arg_16_0.data.officeId >= 3 then
					var_16_2:setVisible(false)
				end
			end
		end
	end
end

function var_0_0.onTouch(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if arg_17_0.data and arg_17_0.data.officeId >= 3 then
		return true
	end

	if user.kfworldId == 2 then
		if arg_17_1 == CCTOUCHBEGAN then
			arg_17_0.touchLocation = ccp(arg_17_2, arg_17_3)
		elseif arg_17_1 == CCTOUCHENDED then
			if ccpDistance(arg_17_0.touchLocation, ccp(arg_17_2, arg_17_3)) < 50 then
				for iter_17_0 = 1, 3 do
					if arg_17_0.arrowTable and arg_17_0.arrowTable[iter_17_0] then
						local var_17_0 = arg_17_0.arrowTable[iter_17_0].red

						if tool.checkIfTouch(var_17_0, arg_17_2, arg_17_3) then
							kfcmgr.sendRequest(function(arg_18_0)
								return
							end, actions.chooseNpcAI, iter_17_0)
						end
					end
				end
			end

			arg_17_0.touchLocation = nil
		end
	end

	return true
end

function var_0_0.onEnter(arg_19_0)
	arg_19_0.handlerPushNpcAIRef = handler(arg_19_0, arg_19_0.handlerPushNpcAI)

	kfcmgr.registerResponseHandler(actions.pushNpcAI, arg_19_0.handlerPushNpcAIRef)
end

function var_0_0.onExit(arg_20_0)
	kfcmgr.registerResponseHandler(actions.pushNpcAI, arg_20_0.handlerPushNpcAIRef)
end

return var_0_0
