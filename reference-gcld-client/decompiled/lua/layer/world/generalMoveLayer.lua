generalMoveLayer = {}
generalMoveLayer.generalTable = {}
generalMoveLayer.gongjiangTable = {}
generalMoveLayer.juntuanTable = {}

local function var_0_0()
	if smgr.currentSceneTag == SCENE_JUBEN then
		local var_1_0 = require("lua/layer/juben/config/road/jubenCubePoly_" .. user.soId)
		local var_1_1 = require("lua/layer/juben/config/road/tracePoints_" .. user.soId)

		return var_1_0, var_1_1
	elseif smgr.currentSceneTag == SCENE_KFWORLD then
		local var_1_2 = require("lua/layer/kfworld/config/road/kfWorldCubePoly_" .. user.kfworldId)
		local var_1_3 = require("lua/layer/kfworld/config/road/tracePoints_" .. user.kfworldId)

		return var_1_2, var_1_3
	elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD and user.jpsIndex ~= 0 then
		local var_1_4
		local var_1_5

		if user.isKfdy then
			var_1_4 = require("lua/layer/kfyzWorld/config/road/japanCubePoly_1")
			var_1_5 = require("lua/layer/kfyzWorld/config/road/tracePoints_1")
		elseif user.isKfgl then
			var_1_4 = require("lua/layer/kfyzWorld/config/road/gaoliCubePoly_1")
			var_1_5 = require("lua/layer/kfyzWorld/config/road/tracePoints_2")
		elseif user.isKfyn then
			var_1_4 = require("lua/layer/kfyzWorld/config/road/yuenanCubePoly")
			var_1_5 = require("lua/layer/kfyzWorld/config/road/yunanTracePoints")
		elseif user.isKflq then
			var_1_4 = require("lua/layer/kfyzWorld/config/road/liuqiuCubePoly")
			var_1_5 = require("lua/layer/kfyzWorld/config/road/liuqiuTracePoints")
		elseif user.isKfnz then
			var_1_4 = require("lua/layer/kfyzWorld/config/road/nanzhaoCubePoly")
			var_1_5 = require("lua/layer/kfyzWorld/config/road/nanzhaoTracePoints")
		end

		return var_1_4, var_1_5
	else
		local var_1_6 = require("lua/layer/world/cubePoly")
		local var_1_7 = require("lua/layer/world/tracePoints")

		return var_1_6, var_1_7
	end
end

local function var_0_1(arg_2_0)
	if not arg_2_0 then
		return
	end

	local var_2_0 = CCAnimation:createWithSpriteFrames(arg_2_0, 0.1)
	local var_2_1 = CCAnimate:create(var_2_0)

	return (CCRepeatForever:create(var_2_1))
end

function generalMoveLayer.update(arg_3_0)
	local var_3_0, var_3_1 = var_0_0()
	local var_3_2 = false
	local var_3_3 = true

	if smgr.currentSceneTag == SCENE_WORLD then
		-- block empty
	elseif smgr.currentSceneTag == SCENE_JUBEN then
		if user.inJuBen or user.isYw then
			-- block empty
		else
			var_3_3 = false
		end
	elseif smgr.currentSceneTag == SCENE_KFWORLD then
		-- block empty
	elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		-- block empty
	elseif smgr.currentSceneTag == SCENE_KFEXPEDITION then
		-- block empty
	else
		var_3_3 = false
	end

	if var_3_3 == true then
		for iter_3_0, iter_3_1 in pairs(traceData.general) do
			if iter_3_1.moveAction ~= nil and not tolua.isnull(iter_3_1.moveAction.sprite) then
				iter_3_1.moveAction.deltTime = iter_3_1.moveAction.deltTime + arg_3_0

				if iter_3_1.moveAction.deltTime > iter_3_1.moveAction.totalTime then
					iter_3_1.moveAction.sprite:setPosition(iter_3_1.moveAction.tagetPos)
					iter_3_1.moveAction.sprite:stopAllActions()
					iter_3_1.moveAction.animation:setVisible(false)

					if traceData.isEndCity(iter_3_1.moveAction.generalId, iter_3_1.moveAction.city2) == true then
						traceData.deleteTrace(iter_3_1.moveAction.generalId)
					else
						traceData.hideTracePoint(iter_3_1.moveAction.generalId, iter_3_1.moveAction.city1, iter_3_1.moveAction.city2)

						var_3_2 = true
					end
				else
					local var_3_4 = iter_3_1.moveAction.deltTime / iter_3_1.moveAction.totalTime
					local var_3_5, var_3_6 = var_3_0.position(iter_3_1.moveAction.data, iter_3_1.moveAction.city1, iter_3_1.moveAction.city2, var_3_4)
					local var_3_7 = tool.getAngle(ccp(iter_3_1.moveAction.sprite:getPosition()), ccp(var_3_5, var_3_6))

					iter_3_1.moveAction.animation:setRotation(var_3_7 + 180)
					iter_3_1.moveAction.sprite:setPosition(ccp(var_3_5, var_3_6))
					traceData.hideSingleTracePoint(iter_3_1.moveAction.generalId, iter_3_1.moveAction.city1, iter_3_1.moveAction.city2, var_3_4)

					var_3_2 = true
				end
			end
		end
	end

	if var_3_2 == false or var_3_3 == false then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(generalMoveLayer.updateSchedulerEntry)

		generalMoveLayer.updateSchedulerEntry = nil

		for iter_3_2, iter_3_3 in pairs(traceData.general) do
			if iter_3_3.moveAction and iter_3_3.moveAction.sprite then
				iter_3_3.moveAction.sprite:stopAllActions()
			end

			if iter_3_3.moveAction and iter_3_3.moveAction.animation then
				iter_3_3.moveAction.animation:setVisible(false)
			end
		end

		traceData.general = {}
	end
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	arg_4_0 = tonumber(arg_4_0)

	local var_4_0, var_4_1 = var_0_0()

	if generalMoveLayer.generalTable["id_" .. arg_4_0] == nil then
		return
	end

	generalMoveLayer.generalTable["id_" .. arg_4_0].locationId = arg_4_2

	local var_4_2 = smgr.getLayer("worldCamera")
	local var_4_3
	local var_4_4

	if smgr.currentSceneTag == SCENE_JUBEN then
		var_4_3 = eventManager.dispatchEvent("JubenGetCitySprite", arg_4_1)
		var_4_4 = eventManager.dispatchEvent("JubenGetCitySprite", arg_4_2)
	elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		var_4_3 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_4_1)
		var_4_4 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_4_2)
	else
		var_4_3 = var_4_2.cityTable["world_building_" .. arg_4_1].sprite
		var_4_4 = var_4_2.cityTable["world_building_" .. arg_4_2].sprite
	end

	local var_4_5 = ccp(var_4_3:getPosition())
	local var_4_6 = ccp(var_4_4:getPosition())
	local var_4_7 = generalMoveLayer.generalTable["id_" .. arg_4_0].sprite

	var_4_7:stopAllActions()

	if arg_4_4 or tonumber(arg_4_3) <= 0 then
		if traceData.general then
			for iter_4_0, iter_4_1 in pairs(traceData.general) do
				if iter_4_1 and iter_4_1.moveAction and iter_4_1.moveAction.generalId and iter_4_1.moveAction.generalId == arg_4_0 then
					if iter_4_1.moveAction and iter_4_1.moveAction.generalId then
						traceData.deleteTrace(iter_4_1.moveAction.generalId)
					end

					if iter_4_1.moveAction and iter_4_1.moveAction.sprite then
						iter_4_1.moveAction.sprite:stopAllActions()
					end

					if iter_4_1.moveAction and iter_4_1.moveAction.animation then
						iter_4_1.moveAction.animation:setVisible(false)
					end

					break
				end
			end
		end

		var_4_7:setPosition(var_4_6)
	else
		local var_4_8 = var_4_7:getChildByTag(101)

		var_4_8:setVisible(true)

		local var_4_9 = var_0_1(generalMoveLayer.generalTable["id_" .. arg_4_0].moveFrames)

		var_4_8:runAction(var_4_9)
		traceData.addMoveData(arg_4_0, arg_4_1, arg_4_2, arg_4_3, var_4_7, var_4_8, var_4_6)

		if generalMoveLayer.updateSchedulerEntry == nil then
			local var_4_10 = CCDirector:sharedDirector():getScheduler()

			generalMoveLayer.updateSchedulerEntry = var_4_10:scheduleScriptFunc(generalMoveLayer.update, 0, false)
		end
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	arg_5_0 = tonumber(arg_5_0)

	local var_5_0, var_5_1 = var_0_0()

	if generalMoveLayer.gongjiangTable["id_" .. arg_5_0] == nil then
		return
	end

	generalMoveLayer.gongjiangTable["id_" .. arg_5_0].locationId = arg_5_2

	local var_5_2 = smgr.getLayer("worldCamera")
	local var_5_3 = var_5_2.cityTable["world_building_" .. arg_5_1].sprite
	local var_5_4 = var_5_2.cityTable["world_building_" .. arg_5_2].sprite
	local var_5_5 = ccp(var_5_3:getPosition())
	local var_5_6 = ccp(var_5_4:getPosition())
	local var_5_7 = generalMoveLayer.gongjiangTable["id_" .. arg_5_0].sprite

	var_5_7:stopAllActions()

	if arg_5_4 or tonumber(arg_5_3) <= 0 then
		var_5_7:setPosition(var_5_6)
	else
		local var_5_8 = var_5_7:getChildByTag(101)

		var_5_8:setVisible(true)

		local var_5_9 = var_0_1(generalMoveLayer.gongjiangTable["id_" .. arg_5_0].moveFrames)

		var_5_8:runAction(var_5_9)
		traceData.addMoveData(arg_5_0, arg_5_1, arg_5_2, arg_5_3, var_5_7, var_5_8, var_5_6)

		if generalMoveLayer.updateSchedulerEntry == nil then
			local var_5_10 = CCDirector:sharedDirector():getScheduler()

			generalMoveLayer.updateSchedulerEntry = var_5_10:scheduleScriptFunc(generalMoveLayer.update, 0, false)
		end
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	arg_6_0 = tonumber(arg_6_0)

	local var_6_0, var_6_1 = var_0_0()

	if generalMoveLayer.juntuanTable["id_" .. arg_6_0] == nil then
		return
	end

	generalMoveLayer.juntuanTable["id_" .. arg_6_0].locationId = arg_6_2

	local var_6_2 = smgr.getLayer("worldCamera")
	local var_6_3
	local var_6_4

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		var_6_3 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_6_1)
		var_6_4 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_6_2)
	else
		var_6_3 = var_6_2.cityTable["world_building_" .. arg_6_1].sprite
		var_6_4 = var_6_2.cityTable["world_building_" .. arg_6_2].sprite
	end

	local var_6_5 = ccp(var_6_3:getPosition())
	local var_6_6 = ccp(var_6_4:getPosition())
	local var_6_7 = generalMoveLayer.juntuanTable["id_" .. arg_6_0].sprite

	var_6_7:stopAllActions()

	if arg_6_4 or tonumber(arg_6_3) <= 0 then
		var_6_7:setPosition(var_6_6)
	else
		local var_6_8 = var_6_7:getChildByTag(101)

		var_6_8:setVisible(true)

		local var_6_9 = var_0_1(generalMoveLayer.juntuanTable["id_" .. arg_6_0].moveFrames)

		var_6_8:runAction(var_6_9)
		traceData.addMoveData(arg_6_0, arg_6_1, arg_6_2, arg_6_3, var_6_7, var_6_8, var_6_6)

		if generalMoveLayer.updateSchedulerEntry == nil then
			local var_6_10 = CCDirector:sharedDirector():getScheduler()

			generalMoveLayer.updateSchedulerEntry = var_6_10:scheduleScriptFunc(generalMoveLayer.update, 0, false)
		end
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	if generalMoveLayer.generalTable["id_" .. arg_7_0] == nil then
		return
	end

	generalMoveLayer.generalTable["id_" .. arg_7_0].locationId = arg_7_2

	local var_7_0 = smgr.getLayer("worldCamera")
	local var_7_1 = var_7_0.cityTable["world_building_" .. arg_7_1].sprite
	local var_7_2 = var_7_0.cityTable["world_building_" .. arg_7_2].sprite
	local var_7_3 = ccp(var_7_1:getPosition())
	local var_7_4 = ccp(var_7_2:getPosition())
	local var_7_5 = generalMoveLayer.generalTable["id_" .. arg_7_0].sprite

	var_7_5:stopAllActions()

	if not arg_7_4 then
		local var_7_6 = var_7_5:getChildByTag(101)

		var_7_6:setVisible(true)

		local var_7_7 = var_0_1(generalMoveLayer.generalTable["id_" .. arg_7_0].moveFrames)

		var_7_6:runAction(var_7_7)

		local var_7_8 = cityRoad.cityRoad(arg_7_1, arg_7_2)

		if var_7_8 == nil then
			var_7_5:setPosition(var_7_4)

			return
		end

		if arg_7_1 < arg_7_2 then
			var_7_8.x[var_7_8.rank] = var_7_4.x
			var_7_8.y[var_7_8.rank] = var_7_4.y
		else
			var_7_8.x[0] = var_7_4.x
			var_7_8.y[0] = var_7_4.y
		end

		local var_7_9 = var_7_5:getChildByTag(101)

		var_7_9:setVisible(true)

		local var_7_10 = var_0_1(generalMoveLayer.generalTable["id_" .. arg_7_0].moveFrames)

		var_7_9:runAction(var_7_10)

		local var_7_11 = {}
		local var_7_12 = 0

		for iter_7_0 = 1, var_7_8.rank do
			local var_7_13 = var_7_8.x[iter_7_0] - var_7_8.x[iter_7_0 - 1]
			local var_7_14 = var_7_8.y[iter_7_0] - var_7_8.y[iter_7_0 - 1]

			var_7_11[iter_7_0] = math.sqrt(var_7_13 * var_7_13 + var_7_14 * var_7_14)
			var_7_12 = var_7_12 + var_7_11[iter_7_0]
		end

		local var_7_15 = CCArray:create()
		local var_7_16 = {}

		if arg_7_1 < arg_7_2 then
			for iter_7_1 = 1, var_7_8.rank do
				local var_7_17 = ccp(var_7_8.x[iter_7_1], var_7_8.y[iter_7_1])
				local var_7_18 = tool.getAngle(ccp(var_7_8.x[iter_7_1 - 1], var_7_8.y[iter_7_1 - 1]), var_7_17)
				local var_7_19 = CCCallFuncN:create(function()
					var_7_9:setRotation(var_7_18 + 180)
				end)
				local var_7_20 = var_7_11[iter_7_1] * arg_7_3 / (var_7_12 * 1000)
				local var_7_21 = CCMoveTo:create(var_7_20, var_7_17)

				var_7_15:addObject(var_7_19)
				var_7_15:addObject(var_7_21)
			end
		else
			for iter_7_2 = var_7_8.rank, 1, -1 do
				local var_7_22 = ccp(var_7_8.x[iter_7_2 - 1], var_7_8.y[iter_7_2 - 1])
				local var_7_23 = tool.getAngle(ccp(var_7_8.x[iter_7_2], var_7_8.y[iter_7_2]), var_7_22)
				local var_7_24 = CCCallFuncN:create(function()
					var_7_9:setRotation(var_7_23 + 180)
				end)
				local var_7_25 = var_7_11[iter_7_2] * arg_7_3 / (var_7_12 * 1000)
				local var_7_26 = CCMoveTo:create(var_7_25, var_7_22)

				var_7_15:addObject(var_7_24)
				var_7_15:addObject(var_7_26)
			end
		end

		local var_7_27 = CCCallFuncN:create(function()
			var_7_5:stopAllActions()
			var_7_9:setVisible(false)
		end)

		var_7_15:addObject(var_7_27)
		var_7_5:runAction(CCSequence:create(var_7_15))
	else
		var_7_5:setPosition(var_7_4)
	end
end

local function var_0_6(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	var_0_2(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)

	return
end

local function var_0_7()
	local var_12_0 = CCArray:create()

	require("lua/layer/world/control")

	for iter_12_0 = 1, 16 do
		local var_12_1 = string.format("00001%04d.png", iter_12_0)

		if user.moveFaster and (smgr.currentSceneTag == SCENE_WORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION) then
			var_12_1 = string.format("00001%04d_fast.png", iter_12_0)
		end

		var_12_0:addObject(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_12_1))
	end

	var_12_0:retain()

	return var_12_0
end

local function var_0_8(arg_13_0)
	local var_13_0 = smgr.getLayer("generalMoveLayer")
	local var_13_1 = smgr.getLayer("worldCamera")

	for iter_13_0, iter_13_1 in pairs(generalMoveLayer.generalTable) do
		pcall(iter_13_1.sprite.removeFromParentAndCleanup, iter_13_1.sprite, true)

		generalMoveLayer.generalTable[iter_13_0] = {}
	end

	generalMoveLayer.generalTable = {}

	local var_13_2
	local var_13_3

	if smgr.currentSceneTag == SCENE_JUBEN then
		var_13_3 = eventManager.dispatchEvent("JubenFollowGeneral")
	elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		var_13_2 = eventManager.dispatchEvent("KfworldGetGenerals")
	end

	for iter_13_2, iter_13_3 in pairs(arg_13_0.action.data.military) do
		generalMoveLayer.generalTable["id_" .. iter_13_3.generalId] = {}

		if smgr.currentSceneTag == SCENE_JUBEN then
			generalMoveLayer.generalTable["id_" .. iter_13_3.generalId].locationId = iter_13_3.juBenLoId
		elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			for iter_13_4, iter_13_5 in pairs(var_13_2) do
				if iter_13_3.generalId == iter_13_5.id then
					generalMoveLayer.generalTable["id_" .. iter_13_3.generalId].locationId = iter_13_5.kfCityId
				end
			end
		else
			generalMoveLayer.generalTable["id_" .. iter_13_3.generalId].locationId = iter_13_3.generalLocationId
		end

		generalMoveLayer.generalTable["id_" .. iter_13_3.generalId].moveFrames = var_0_7()

		local var_13_4 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
		local var_13_5

		if smgr.currentSceneTag == SCENE_JUBEN then
			var_13_5 = eventManager.dispatchEvent("JubenGetCitySprite", iter_13_3.juBenLoId)
		elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			for iter_13_6, iter_13_7 in pairs(var_13_2) do
				if iter_13_3.generalId == iter_13_7.id then
					var_13_5 = eventManager.dispatchEvent("KfworldGetCitySprite", iter_13_7.kfCityId)
				end
			end
		else
			var_13_5 = var_13_1.cityTable["world_building_" .. iter_13_3.generalLocationId].sprite
		end

		if var_13_5 then
			var_13_4:setPosition(ccp(var_13_5:getPosition()))
		else
			var_13_4:setPosition(ccp(-100, -100))
			log.info("generalMoveLayer: buildingSprite nil 玩家可能在跨服国战中出现解雇，重新招募操作")
		end

		generalMoveLayer.generalTable["id_" .. iter_13_3.generalId].sprite = var_13_4

		var_13_0:addChild(var_13_4, 100)

		local var_13_6 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", iter_13_3.pic))

		var_13_6:setPosition(ccp(var_13_4:getContentSize().width / 2, var_13_4:getContentSize().height / 2))
		tool.scaleTo(var_13_6, 59, 59)
		var_13_4:addChild(var_13_6)

		local var_13_7 = CCSprite:create()

		var_13_7:setPosition(ccp(var_13_4:getContentSize().width / 2, var_13_4:getContentSize().height / 2))
		var_13_4:addChild(var_13_7, 1, 101)

		if var_13_3 and var_13_3 == iter_13_3.generalId then
			local var_13_8 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
			local var_13_9 = CCSprite:create("res/ui/common/fightPic/fightPic_adou.png")

			var_13_9:setPosition(ccp(var_13_8:getContentSize().width / 2, var_13_8:getContentSize().height / 2))
			tool.scaleTo(var_13_9, 59, 59)
			var_13_8:addChild(var_13_9)
			var_13_8:setPosition(ccp(var_13_4:getContentSize().width / 2, var_13_4:getContentSize().height * 1.5))
			var_13_8:setScale(0.8)
			var_13_4:addChild(var_13_8, 10)
		end
	end
end

local function var_0_9()
	local var_14_0 = smgr.getLayer("generalMoveLayer")
	local var_14_1 = smgr.getLayer("worldCamera")

	for iter_14_0, iter_14_1 in pairs(generalMoveLayer.gongjiangTable) do
		pcall(iter_14_1.sprite.removeFromParentAndCleanup, iter_14_1.sprite, true)

		generalMoveLayer.gongjiangTable[iter_14_0] = {}
	end

	generalMoveLayer.gongjiangTable = {}

	if worldControl.gongjiangPaths == nil or smgr.currentSceneTag ~= SCENE_WORLD then
		return
	end

	for iter_14_2, iter_14_3 in pairs(worldControl.gongjiangPaths) do
		local var_14_2 = iter_14_3.locationId or iter_14_3.startCityId

		if iter_14_3.state == 0 or iter_14_3.state == 1 or iter_14_3.state == 2 then
			generalMoveLayer.gongjiangTable["id_" .. iter_14_3.vId] = {}
			generalMoveLayer.gongjiangTable["id_" .. iter_14_3.vId].locationId = var_14_2
			generalMoveLayer.gongjiangTable["id_" .. iter_14_3.vId].vId = iter_14_3.vId
			generalMoveLayer.gongjiangTable["id_" .. iter_14_3.vId].state = iter_14_3.state
			generalMoveLayer.gongjiangTable["id_" .. iter_14_3.vId].moveFrames = var_0_7()

			local var_14_3 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
			local var_14_4 = var_14_1.cityTable["world_building_" .. var_14_2].sprite

			if var_14_4 then
				var_14_3:setPosition(ccp(var_14_4:getPosition()))
			end

			generalMoveLayer.gongjiangTable["id_" .. iter_14_3.vId].sprite = var_14_3

			var_14_0:addChild(var_14_3, 99)

			local var_14_5 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_jianzaodui.png"))

			var_14_5:setPosition(ccp(var_14_3:getContentSize().width / 2, var_14_3:getContentSize().height / 2))
			tool.scaleTo(var_14_5, 59, 59)
			var_14_3:addChild(var_14_5)

			local var_14_6 = CCSprite:create()

			var_14_6:setPosition(ccp(var_14_3:getContentSize().width / 2, var_14_3:getContentSize().height / 2))
			var_14_3:addChild(var_14_6, 1, 101)

			if iter_14_3.path then
				local var_14_7 = {}

				for iter_14_4 = 1, #iter_14_3.path do
					var_14_7[iter_14_4] = tonumber(iter_14_3.path[iter_14_4].cityId)
				end

				traceData.createTrace(iter_14_3.vId, var_14_7)
			end
		end
	end
end

local function var_0_10()
	local var_15_0 = smgr.getLayer("generalMoveLayer")
	local var_15_1 = smgr.getLayer("worldCamera")

	for iter_15_0, iter_15_1 in pairs(generalMoveLayer.juntuanTable) do
		pcall(iter_15_1.sprite.removeFromParentAndCleanup, iter_15_1.sprite, true)

		generalMoveLayer.juntuanTable[iter_15_0] = {}
	end

	generalMoveLayer.juntuanTable = {}

	if smgr.currentSceneTag ~= SCENE_WORLD and smgr.currentSceneTag ~= SCENE_KFYZ_WORLD then
		return
	end

	local var_15_2
	local var_15_3
	local var_15_4

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		var_15_2 = user.kfCorpsInfo[user.player.kfgzForceId]
		var_15_3 = user.kfCorpsAction[user.player.kfgzForceId]
		var_15_4 = user.kfCorpsNum
	else
		var_15_2 = user.corpsInfo[user.player.forceId]
		var_15_3 = user.corpsAction[user.player.forceId]
		var_15_4 = user.corpsNum
	end

	if var_15_2 and var_15_2.state == 2 then
		local var_15_5 = var_15_2.locationId

		generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId] = {}
		generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].locationId = var_15_5
		generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].corpsId = var_15_2.corpsId
		generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].state = var_15_2.state
		generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].moveFrames = var_0_7()

		local var_15_6 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
		local var_15_7

		if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
			var_15_7 = eventManager.dispatchEvent("KfworldGetCitySprite", var_15_5)
		else
			var_15_7 = var_15_1.cityTable["world_building_" .. var_15_5].sprite
		end

		if var_15_7 then
			var_15_6:setPosition(ccp(var_15_7:getPosition()))
		end

		generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].sprite = var_15_6

		var_15_0:addChild(var_15_6, 102)

		local var_15_8 = CCSprite:create(string.format("res/ui/world/juntuan/fightPic_juntuan.png"))

		var_15_8:setPosition(ccp(var_15_6:getContentSize().width / 2, var_15_6:getContentSize().height / 2))
		tool.scaleTo(var_15_8, 59, 59)
		var_15_6:addChild(var_15_8)

		local var_15_9 = CCSprite:create()

		var_15_9:setPosition(ccp(var_15_6:getContentSize().width / 2, var_15_6:getContentSize().height / 2))
		var_15_6:addChild(var_15_9, 1, 101)

		local var_15_10 = CCSprite:create("res/ui/world/juntuan/jtsj_word_bg2.png")

		if var_15_2.forceId == user.player.forceId then
			local var_15_11 = CCSprite:create("res/ui/world/juntuan/jtsj_word_wo.png")

			if var_15_2.type and var_15_2.type == 1 then
				var_15_11 = CCStrokeLabelTTF:create(user.player.name, "Thonburi-Bold", 22)
			end

			var_15_10:addChild(var_15_11)
			var_15_11:setPosition(ccp(68, 18))

			if var_15_2.playerId == user.player.playerId and var_15_4 and var_15_4.idleNum then
				var_15_10:setPosition(43, 125)

				local var_15_12 = CCSprite:create("res/ui/world/juntuan/jtsj_word_bg.png")
				local var_15_13 = CCSprite:create("res/ui/world/juntuan/jtsj_word_bg.png")

				var_15_10:addChild(var_15_12)
				var_15_12:setPosition(ccp(10, -17))
				var_15_10:addChild(var_15_13)
				var_15_13:setPosition(ccp(125, -17))

				local var_15_14 = CCSprite:create("res/ui/world/juntuan/jtsj_word_kx.png")

				var_15_14:setPosition(ccp(40, 17))
				var_15_12:addChild(var_15_14)

				local var_15_15 = CCSprite:create("res/ui/world/juntuan/jtsj_word_ml.png")

				var_15_15:setPosition(ccp(40, 17))
				var_15_13:addChild(var_15_15)

				local var_15_16 = CCStrokeLabelTTF:create(var_15_4.idleNum, "Thonburi-Bold", 22)
				local var_15_17 = CCStrokeLabelTTF:create(var_15_4.busyNum, "Thonburi-Bold", 22)

				var_15_16:setColor(ccc3(0, 255, 0))
				var_15_17:setColor(ccc3(255, 0, 0))
				var_15_16:setPosition(ccp(80, 17))
				var_15_17:setPosition(ccp(80, 17))
				var_15_12:addChild(var_15_16)
				var_15_13:addChild(var_15_17)

				generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].kongxian = var_15_16
				generalMoveLayer.juntuanTable["id_" .. var_15_2.corpsId].manglu = var_15_17
				generalMoveLayer.jtGo = true
			else
				var_15_10:setPosition(43, 90)

				local var_15_18 = CCStrokeLabelTTF:create(var_15_2.remainNum .. "/" .. var_15_2.maxNum, "Thonburi-Bold", 18)

				var_15_18:setColor(ccc3(255, 255, 0))
				var_15_18:setPosition(73, -55)
				var_15_10:addChild(var_15_18)
			end
		else
			local var_15_19
			local var_15_20

			if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
				var_15_19 = user.forceIdToName[user.player.forceId] .. "·" .. var_15_2.playerName
				var_15_20 = tool.hexToRgb("#F49429")
			else
				var_15_19 = user.forceIdToName[var_15_2.forceId] .. "·" .. var_15_2.playerName
				var_15_20 = colorForce[var_15_2.forceId]
			end

			local var_15_21 = CCLabelTTF:create(var_15_19, "Thonburi", 22)

			var_15_21:setColor(var_15_20)
			var_15_10:addChild(var_15_21)
			var_15_21:setPosition(ccp(68, 18))
			var_15_10:setPosition(43, 90)
		end

		var_15_6:addChild(var_15_10)

		if var_15_3 and var_15_3.path then
			local var_15_22 = {}

			for iter_15_2 = 1, #var_15_3.path do
				var_15_22[iter_15_2] = tonumber(var_15_3.path[iter_15_2].cityId)
			end

			traceData.createTrace(var_15_3.corpsId, var_15_22)
		end
	end
end

local function var_0_11()
	local var_16_0

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		var_16_0 = user.kfCorpsNum
	else
		var_16_0 = user.corpsNum
	end

	if generalMoveLayer.juntuanTable then
		if generalMoveLayer.jtGo then
			for iter_16_0, iter_16_1 in pairs(generalMoveLayer.juntuanTable) do
				if iter_16_1.kongxian then
					iter_16_1.kongxian:setString(var_16_0.idleNum)
				end

				if iter_16_1.manglu then
					iter_16_1.manglu:setString(var_16_0.busyNum)
				end
			end
		else
			var_0_10()
		end
	end
end

local function var_0_12()
	cmgr.sendRequest(var_0_8, actions.generalSimpleInfo)
end

local function var_0_13(arg_18_0)
	if not arg_18_0.transportType then
		return
	end

	local var_18_0 = user.curNationTask.tasks[1]

	if not var_18_0 then
		return
	end

	if var_18_0 and (var_18_0.taskType == 10 or var_18_0.taskType == 12) then
		-- block empty
	else
		return
	end

	generalMoveLayer.workerTable = generalMoveLayer.workerTable or {}

	local function var_18_1(arg_19_0)
		return "key_" .. arg_19_0.key
	end

	local var_18_2 = smgr.getLayer("generalMoveLayer")
	local var_18_3 = smgr.getLayer("worldCamera")
	local var_18_4 = var_18_1(arg_18_0)
	local var_18_5 = generalMoveLayer.workerTable[var_18_4]

	if var_18_5 then
		if var_18_5.info.workerState == 0 then
			if arg_18_0.workerState == 0 and var_18_5.info.nextCityId == arg_18_0.nextCityId then
				return
			end
		else
			return
		end
	elseif arg_18_0.workerState == 1 then
		return
	end

	local var_18_6 = {
		"res/ui/nationTask/building/jzqj_ji_view.png",
		"res/ui/nationTask/building/jzqj_kuai_view.png",
		"res/ui/nationTask/building/jzqj_huan_view.png",
		"res/ui/nationTask/building/jzqj_man_view.png"
	}
	local var_18_7
	local var_18_8
	local var_18_9

	if var_18_5 == nil then
		generalMoveLayer.workerTable[var_18_4] = {}
		generalMoveLayer.workerTable[var_18_4].info = arg_18_0

		local var_18_10 = CCSprite:create("res/ui/world/jb_round.png")
		local var_18_11 = var_18_3.cityTable["world_building_" .. arg_18_0.curCityId].sprite

		var_18_10:setPosition(ccp(var_18_11:getPosition()))

		generalMoveLayer.workerTable[var_18_4].sprite = var_18_10

		var_18_2:addChild(var_18_10, 101)

		local var_18_12 = {
			{
				name = language.get(91009),
				color = colorForce[1]
			},
			{
				name = language.get(91010),
				color = colorForce[2]
			},
			{
				name = language.get(91011),
				color = colorForce[3]
			}
		}
		local var_18_13 = {
			{
				pic = "res/ui/nationTask/building/jzqj_carr_nt.png",
				name = language.get(95092)
			},
			{
				pic = "res/ui/nationTask/building/jzqj_carr_sc.png",
				name = language.get(95093)
			},
			{
				pic = "res/ui/nationTask/building/jzqj_carr_mc.png",
				name = language.get(95094)
			}
		}
		local var_18_14 = CCSprite:create("res/ui/nationTask/building/jzqj_qi_name_bg.png")
		local var_18_15 = CCSprite:create(var_18_6[arg_18_0.marchingState])

		var_18_14:setPosition(ccp(54.5, 0))
		var_18_10:addChild(var_18_14, 1, 101)
		var_18_15:setPosition(ccp(54.5, 150))
		var_18_10:addChild(var_18_15, 1, 102)

		local var_18_16 = CCStrokeLabelTTF:create(var_18_12[arg_18_0.forceId].name, "Thonburi", 24)

		var_18_16:setColor(var_18_12[arg_18_0.forceId].color)

		if var_18_0.taskType == 10 then
			var_18_7 = var_18_13[arg_18_0.transportType].pic
			var_18_8 = var_18_13[arg_18_0.transportType].name
		elseif var_18_0.taskType == 12 then
			require("lua/layer/nation/taskTab/constant")

			local var_18_17 = var_18_0.miracle[arg_18_0.forceId].serial

			var_18_7 = "res/ui/nationTask/lantern/yxhd_mache.png"
			var_18_8 = language.get(135335, language.get(taskTabConstant.LANTERN_RES[var_18_17][arg_18_0.transportType]))
		end

		local var_18_18 = CCSprite:create(var_18_7)

		var_18_18:setPosition(ccp(54.5, 54.5))
		var_18_10:addChild(var_18_18, 1)

		local var_18_19 = CCStrokeLabelTTF:create(var_18_8, "Thonburi", 24)

		var_18_16:setPosition(ccp(34, 21))
		var_18_19:setAnchorPoint(ccp(0, 0.5))
		var_18_19:setPosition(ccp(var_18_16:getPositionX() + var_18_16.getContentSize().width / 2 + 6, var_18_16:getPositionY()))
		var_18_14:addChild(var_18_16)
		var_18_14:addChild(var_18_19)

		local var_18_20 = createTimerLabel(arg_18_0.nextAheadTime, "@M:@S", "Thonburi", 24, nil, nil, nil, colorQuality[5])

		var_18_20:setPosition(ccp(115, 38.5))
		var_18_15:addChild(var_18_20, 1, 103)

		local var_18_21 = CCStrokeLabelTTF:create(language.get(95095, arg_18_0.nextCityName), "Thonburi", 24)

		var_18_21:setAnchorPoint(ccp(0, 0.5))
		var_18_21:setPosition(ccp(150, 38.5))
		var_18_15:addChild(var_18_21, 1, 104)
	else
		local var_18_22 = 3000

		local function var_18_23()
			local var_20_0 = var_18_5.info.nextCityId

			var_18_5.info = arg_18_0

			if var_18_5.info.nextCityName == nil then
				log.info("w.info", tool.tableToJson(var_18_5.info))

				return
			end

			if var_18_5.info.workerState == 1 or var_20_0 ~= arg_18_0.curCityId then
				var_18_5.sprite:removeFromParentAndCleanup(true)

				generalMoveLayer.workerTable[var_18_4] = nil
			else
				local var_20_1 = var_18_5.sprite
				local var_20_2 = tolua.cast(var_20_1:getChildByTag(102), "CCSprite")

				log.info("stateBg", tolua.type(var_20_2))
				var_20_2:setDisplayFrame(CCSprite:create(var_18_6[arg_18_0.marchingState]):displayFrame())
				var_20_2:removeAllChildrenWithCleanup(true)

				local var_20_3 = createTimerLabel(var_18_5.info.nextAheadTime - var_18_22, "@M:@S", "Thonburi", 24, nil, nil, nil, colorQuality[5])

				var_20_3:setPosition(ccp(115, 38.5))
				var_20_2:addChild(var_20_3, 1, 103)

				local var_20_4 = CCStrokeLabelTTF:create(language.get(95095, var_18_5.info.nextCityName), "Thonburi", 24)

				var_20_4:setAnchorPoint(ccp(0, 0.5))
				var_20_4:setPosition(ccp(150, 38.5))
				var_20_2:addChild(var_20_4, 1, 104)

				generalMoveLayer.workerTable[var_18_4] = var_18_5
			end
		end

		traceData.moveBetweenTwoCity(var_18_5.sprite, var_18_5.info.curCityId, var_18_5.info.nextCityId, var_18_22, var_18_23)
	end
end

local function var_0_14(arg_21_0)
	return
end

local function var_0_15(arg_22_0, arg_22_1)
	local var_22_0 = smgr.getLayer("worldCamera")
	local var_22_1

	if smgr.currentSceneTag == SCENE_JUBEN then
		var_22_1 = eventManager.dispatchEvent("JubenGetCitySprite", arg_22_1)
	elseif smgr.currentSceneTag == SCENE_KFWORLD then
		var_22_1 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_22_1)
	elseif smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		var_22_1 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_22_1)

		local var_22_2 = traceData.general[arg_22_0]

		if var_22_2 and var_22_2.moveAction then
			var_22_2.moveAction.animation:setVisible(false)
		end

		traceData.deleteTrace(arg_22_0)

		generalMoveLayer.generalTable["id_" .. arg_22_0].locationId = arg_22_1
	else
		var_22_1 = var_22_0.cityTable["world_building_" .. arg_22_1].sprite
	end

	local var_22_3 = ccp(var_22_1:getPosition())

	if generalMoveLayer.generalTable["id_" .. arg_22_0] then
		local var_22_4 = generalMoveLayer.generalTable["id_" .. arg_22_0].sprite

		var_22_4:stopAllActions()
		var_22_4:setPosition(var_22_3)

		local var_22_5 = var_22_4:getChildByTag(101)

		if var_22_5 then
			var_22_5:setVisible(false)
		end
	end
end

local function var_0_16()
	eventManager.registerEvent("generalMoveFromTo", var_0_6)
	eventManager.registerEvent("fireGeneral", var_0_12)
	eventManager.registerEvent("recruitGeneral", var_0_12)
	eventManager.registerEvent("refreshGeneralMoveLayer", var_0_12)
	eventManager.registerEvent("hideWorldElement", var_0_14)
	eventManager.registerEvent("updateWorker", var_0_13)
	eventManager.registerEvent("positionGeneral", var_0_15)
	eventManager.registerEvent("gongjiangMoveFromTo", var_0_3)
	eventManager.registerEvent("juntuanMoveFromTo", var_0_4)
	eventManager.registerEvent("refreshJuntuan", var_0_10)
	eventManager.registerEvent("juntuanNumChange", var_0_11)
end

local function var_0_17()
	eventManager.unregisterEvent("generalMoveFromTo", var_0_6)
	eventManager.unregisterEvent("fireGeneral", var_0_12)
	eventManager.unregisterEvent("recruitGeneral", var_0_12)
	eventManager.unregisterEvent("refreshGeneralMoveLayer", var_0_12)
	eventManager.unregisterEvent("hideWorldElement", var_0_14)
	eventManager.unregisterEvent("updateWorker", var_0_13)
	eventManager.unregisterEvent("positionGeneral", var_0_15)
	eventManager.unregisterEvent("gongjiangMoveFromTo", var_0_3)
	eventManager.unregisterEvent("juntuanMoveFromTo", var_0_4)
	eventManager.unregisterEvent("refreshJuntuan", var_0_10)
	eventManager.unregisterEvent("juntuanNumChange", var_0_11)

	generalMoveLayer.generalTable = {}

	smgr.unregisterLayer("generalMoveLayer")

	local var_24_0 = CCDirector:sharedDirector():getScheduler()

	if generalMoveLayer.updateSchedulerEntry ~= nil then
		var_24_0:unscheduleScriptEntry(generalMoveLayer.updateSchedulerEntry)
	end

	generalMoveLayer.updateSchedulerEntry = nil

	traceData.deleteAllTrace()

	traceData.general = {}
end

function generalMoveLayer.show()
	local var_25_0 = createBaseLayer()

	smgr.registerLayer(var_25_0, "generalMoveLayer")

	var_25_0.onEnter = var_0_16
	var_25_0.onExit = var_0_17

	cmgr.sendRequest(var_0_8, actions.generalSimpleInfo)
	var_0_9()
	var_0_10()

	return var_25_0
end

return generalMoveLayer
