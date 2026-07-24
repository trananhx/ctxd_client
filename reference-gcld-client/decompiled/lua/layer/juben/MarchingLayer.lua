local var_0_0 = class("MarchingLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.juben = arg_2_1
	arg_2_0.marchingTable = {}
	arg_2_0.eventTable = {}
end

local function var_0_1()
	local var_3_0 = require("lua/layer/juben/config/road/jubenCubePoly_" .. user.soId)
	local var_3_1 = require("lua/layer/juben/config/road/tracePoints_" .. user.soId)

	return var_3_0, var_3_1
end

local function var_0_2(arg_4_0)
	if not arg_4_0 then
		return
	end

	local var_4_0 = CCAnimation:createWithSpriteFrames(arg_4_0, 0.1)
	local var_4_1 = CCAnimate:create(var_4_0)

	return (CCRepeatForever:create(var_4_1))
end

local function var_0_3()
	local var_5_0 = CCArray:create()

	for iter_5_0 = 1, 16 do
		local var_5_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(string.format("0000100%02.f.png", iter_5_0))

		if var_5_1 then
			var_5_0:addObject(var_5_1)
		end
	end

	var_5_0:retain()

	return var_5_0
end

function var_0_0.getArmyId(arg_6_0, arg_6_1)
	arg_6_1.forceId = arg_6_1.forceId or 100
	arg_6_1.serial = arg_6_1.serial or 0

	return arg_6_1.forceId * 10 + arg_6_1.serial
end

function var_0_0.changeMarchingInfo(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = eventManager.dispatchEvent("JubenGetCitySprite", arg_7_1.curCityId)
	local var_7_1 = eventManager.dispatchEvent("JubenGetCitySprite", arg_7_1.nextCityId)

	if not var_7_0 or not var_7_1 then
		return
	end

	local var_7_2 = arg_7_0:getArmyId(arg_7_1)
	local var_7_3 = arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)]

	if var_7_3 == nil then
		var_7_3 = arg_7_0:initMarchingInfo(arg_7_1)
		arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)] = var_7_3
	end

	if not user.isYw then
		local var_7_4 = var_7_3.sprite:getChildByTag(102)

		arg_7_0:changeMarchingState(var_7_4, arg_7_1)
	end

	if var_7_3.tempSprite then
		var_7_3.tempSprite:stopAllActions()
		var_7_3.tempSprite:removeFromParentAndCleanup(true)

		var_7_3.tempSprite = nil
	end

	if var_7_3.info.nextCityId == arg_7_1.curCityId and var_7_3.info.curCityId ~= var_7_3.info.nextCityId then
		arg_7_0:move(arg_7_0:getArmyId(var_7_3.info), var_7_3.info.curCityId, var_7_3.info.nextCityId)

		var_7_3.info = arg_7_1
		var_7_3.isMoving = true
		arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)] = var_7_3
	end

	if arg_7_1.immediately == true then
		local var_7_5 = var_7_3.sprite
		local var_7_6 = eventManager.dispatchEvent("JubenGetCitySprite", arg_7_1.curCityId)
		local var_7_7 = ccp(var_7_6:getPosition())

		var_7_5:setPosition(var_7_7)
	end

	if arg_7_1.marchState and arg_7_1.marchState <= 0 and arg_7_1.nextExcutedTime then
		local var_7_8 = CCSprite:create()

		var_7_3.tempSprite = var_7_8

		arg_7_0:addChild(var_7_8)
		performWithDelay(var_7_8, function()
			if arg_7_1.curCityId ~= arg_7_1.nextCityId then
				arg_7_0:move(arg_7_0:getArmyId(arg_7_1), arg_7_1.curCityId, arg_7_1.nextCityId)

				var_7_3.info = arg_7_1
				var_7_3.isMoving = true
				arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)] = var_7_3

				var_7_8:removeFromParentAndCleanup(true)

				var_7_3.tempSprite = nil
			end
		end, arg_7_1.nextExcutedTime * 1 / 1000)
	end

	if arg_7_2 then
		arg_7_0.eventTable[arg_7_2] = var_7_3
	end
end

function var_0_0.changeMarchingState(arg_9_0, arg_9_1, arg_9_2)
	arg_9_1:removeAllChildrenWithCleanup(true)

	local var_9_0 = arg_9_2.marchState

	if arg_9_2.curCityId and arg_9_2.nextExcutedTime and not arg_9_2.nextCityId then
		var_9_0 = 3
	end

	if var_9_0 <= 0 then
		if arg_9_2.nextExcutedTime and arg_9_2.nextExcutedTime > 0 then
			local var_9_1 = arg_9_2.nextExcutedTime
			local var_9_2 = arg_9_2.nextCityId
			local var_9_3 = arg_9_0.juben.mapLayer:getCityName(var_9_2)
			local var_9_4 = createTimerLabel(var_9_1, language.get(1449919) .. var_9_3, "Thonburi", 16)

			var_9_4:setPosition(ccp(0, 64))
			arg_9_1:addChild(var_9_4)
		end
	elseif var_9_0 == 1 then
		local var_9_5 = CCStrokeLabelTTF:create(language.get(1449920), "Thonburi", 16)

		var_9_5:setPosition(ccp(0, 64))
		arg_9_1:addChild(var_9_5)
	elseif var_9_0 == 3 then
		arg_9_0.marchingTable[arg_9_0:getArmyId(arg_9_2)].moveFrames:release()
		arg_9_0.marchingTable[arg_9_0:getArmyId(arg_9_2)].sprite:removeFromParentAndCleanup(true)

		arg_9_0.marchingTable[arg_9_0:getArmyId(arg_9_2)] = nil

		traceData.deleteTrace(arg_9_0:getArmyId(arg_9_2) + 10000)
	end

	if arg_9_0.juben.gId == 9 then
		local var_9_6 = CCStrokeLabelTTF:create(language.get(1449922, arg_9_2.serial), "Thonburi", 16)

		var_9_6:setPosition(ccp(-77, 84))
		arg_9_1:addChild(var_9_6)
	end

	if arg_9_2.blood and var_9_0 ~= 3 then
		local var_9_7 = CCSprite:create("res/ui/juben/event/jb_head_load_di.png")

		var_9_7:setScale(0.6)
		var_9_7:setPosition(ccp(10, 53))
		arg_9_1:addChild(var_9_7)

		for iter_9_0 = 1, arg_9_2.blood do
			local var_9_8 = CCSprite:create("res/ui/juben/event/jb_head_load_con.png")

			var_9_8:setPosition(ccp(-26 + 61 * iter_9_0, 6))
			var_9_7:addChild(var_9_8)
		end
	end

	if arg_9_0.juben.gId == 11 and arg_9_2.pic == "caocao" then
		local var_9_9 = CCStrokeLabelTTF:create(language.get(1449923), "Thonburi", 16)

		var_9_9:setPosition(ccp(6, 64))
		arg_9_1:addChild(var_9_9)

		if arg_9_2.isSafe then
			var_9_9:setString(language.get(1449924))
		end
	end
end

function var_0_0.initMarchingInfo(arg_10_0, arg_10_1)
	arg_10_0.marchingTable[arg_10_0:getArmyId(arg_10_1)] = {}
	arg_10_0.marchingTable[arg_10_0:getArmyId(arg_10_1)].info = arg_10_1
	arg_10_0.marchingTable[arg_10_0:getArmyId(arg_10_1)].moveFrames = var_0_3()

	local var_10_0 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

	arg_10_0.marchingTable[arg_10_0:getArmyId(arg_10_1)].sprite = var_10_0

	local var_10_1 = eventManager.dispatchEvent("JubenGetCitySprite", arg_10_1.curCityId)

	var_10_0:setPosition(ccp(var_10_1:getPosition()))
	arg_10_0:addChild(var_10_0)

	if arg_10_1.pic == nil and arg_10_0.juben.gId == 9 then
		arg_10_1.pic = "caocao"
	end

	local var_10_2 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_10_1.pic))

	var_10_2:setPosition(ccp(var_10_0:getContentSize().width / 2, var_10_0:getContentSize().height / 2))
	tool.scaleTo(var_10_2, 59, 59)
	var_10_0:addChild(var_10_2)

	local var_10_3 = CCSprite:create()

	var_10_3:setPosition(ccp(var_10_0:getContentSize().width / 2, var_10_0:getContentSize().height / 2))
	var_10_0:addChild(var_10_3, 1, 101)

	local var_10_4 = CCSprite:create()

	var_10_4:setPosition(ccp(var_10_0:getContentSize().width / 2, var_10_0:getContentSize().height / 2))
	var_10_0:addChild(var_10_4, 1, 102)

	if user.isYw then
		var_10_4:setVisible(false)
	end

	local var_10_5 = CCSprite:create("res/ui/juben/event/jb_head_set.png")

	var_10_5:setPosition(ccp(var_10_0:getContentSize().width / 2, 100))
	var_10_0:addChild(var_10_5)

	if user.isYw then
		var_10_5:setVisible(false)
	end

	local var_10_6 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_10_1.pic))

	tool.scaleTo(var_10_6, 59, 59)
	var_10_6:setPosition(ccp(38.5, 38.5))
	var_10_5:addChild(var_10_6)
	var_10_5:setScale(0.6)

	return arg_10_0.marchingTable[arg_10_0:getArmyId(arg_10_1)]
end

function var_0_0.move(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	arg_11_4 = arg_11_4 or 4000

	local var_11_0 = 10000 + arg_11_1

	traceData.createTrace(var_11_0, {
		arg_11_2,
		arg_11_3
	})

	local var_11_1, var_11_2 = var_0_1()
	local var_11_3 = eventManager.dispatchEvent("JubenGetCitySprite", arg_11_2)
	local var_11_4 = eventManager.dispatchEvent("JubenGetCitySprite", arg_11_3)
	local var_11_5 = ccp(var_11_3:getPosition())
	local var_11_6 = ccp(var_11_4:getPosition())
	local var_11_7 = arg_11_0.marchingTable[arg_11_1].sprite

	var_11_7:stopAllActions()

	local var_11_8 = var_11_7:getChildByTag(101)

	var_11_8:setVisible(true)

	local var_11_9 = var_0_2(arg_11_0.marchingTable[arg_11_1].moveFrames)

	var_11_8:runAction(var_11_9)
	traceData.addMoveData(var_11_0, arg_11_2, arg_11_3, arg_11_4, var_11_7, var_11_8, var_11_6)

	if arg_11_0.updateSchedulerEntry == nil then
		arg_11_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_12_0)
			arg_11_0:update(arg_12_0)
		end, 0, false)
	end
end

function var_0_0.eventRemove(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.eventTable[arg_13_1]

	if var_13_0 then
		pcall(function()
			var_13_0.moveFrames:release()
			var_13_0.sprite:removeFromParentAndCleanup(true)
			traceData.deleteTrace(arg_13_0:getArmyId(var_13_0.info) + 10000)

			var_13_0 = nil
		end)
	end
end

function var_0_0.update(arg_15_0, arg_15_1)
	local var_15_0, var_15_1 = var_0_1()
	local var_15_2 = false
	local var_15_3 = true

	if smgr.currentSceneTag ~= SCENE_JUBEN then
		var_15_3 = false
	end

	for iter_15_0, iter_15_1 in pairs(traceData.general) do
		if iter_15_1.moveAction == nil or tolua.isnull(iter_15_1.moveAction.sprite) then
			log.warn("sprite is null", tool.tableToJson(iter_15_1))
		elseif iter_15_1.moveAction ~= nil then
			iter_15_1.moveAction.deltTime = iter_15_1.moveAction.deltTime + arg_15_1

			if iter_15_1.moveAction.deltTime > iter_15_1.moveAction.totalTime then
				if var_15_3 == true then
					iter_15_1.moveAction.sprite:setPosition(iter_15_1.moveAction.tagetPos)
					iter_15_1.moveAction.sprite:stopAllActions()
					iter_15_1.moveAction.animation:setVisible(false)
				end

				if traceData.isEndCity(iter_15_1.moveAction.generalId, iter_15_1.moveAction.city2) == true then
					if var_15_3 == true then
						traceData.deleteTrace(iter_15_1.moveAction.generalId)
					end
				else
					if var_15_3 == true then
						traceData.hideTracePoint(iter_15_1.moveAction.generalId, iter_15_1.moveAction.city1, iter_15_1.moveAction.city2)
					end

					var_15_2 = true
				end
			else
				if var_15_3 == true then
					local var_15_4 = iter_15_1.moveAction.deltTime / iter_15_1.moveAction.totalTime
					local var_15_5, var_15_6 = var_15_0.position(iter_15_1.moveAction.data, iter_15_1.moveAction.city1, iter_15_1.moveAction.city2, var_15_4)
					local var_15_7 = tool.getAngle(ccp(iter_15_1.moveAction.sprite:getPosition()), ccp(var_15_5, var_15_6))

					iter_15_1.moveAction.animation:setRotation(var_15_7 + 180)
					iter_15_1.moveAction.sprite:setPosition(ccp(var_15_5, var_15_6))
					traceData.hideSingleTracePoint(iter_15_1.moveAction.generalId, iter_15_1.moveAction.city1, iter_15_1.moveAction.city2, var_15_4)
				end

				var_15_2 = true
			end
		end
	end

	if var_15_2 == false or var_15_3 == false then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_15_0.updateSchedulerEntry)

		arg_15_0.updateSchedulerEntry = nil
		traceData.general = {}
	end
end

return var_0_0
