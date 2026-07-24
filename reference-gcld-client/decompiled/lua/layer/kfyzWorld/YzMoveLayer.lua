local var_0_0 = class("YzMoveLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.kfyn = arg_2_1
	arg_2_0.marchingTable = {}
end

local function var_0_1()
	local var_3_0 = require("lua/layer/kfyzWorld/config/road/yuenanCubePoly")
	local var_3_1 = require("lua/layer/kfyzWorld/config/road/yunanTracePoints")

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

local var_0_4 = {
	[0] = "yuanzhengjun",
	"gaoliputong",
	nil,
	nil,
	nil,
	"jinweijun",
	[20] = "dongyingputong"
}

function var_0_0.getArmyId(arg_6_0, arg_6_1)
	arg_6_1.marchId = arg_6_1.marchId or 100

	return arg_6_1.marchId
end

function var_0_0.initMarchingInfo(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)] then
		local var_7_0 = arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)].sprite

		if var_7_0 then
			pcall(var_7_0.removeFromParentAndCleanup, var_7_0, true)
		end
	end

	arg_7_0.cityTable = arg_7_2

	local var_7_1 = (arg_7_1.preLocation == nil or arg_7_1.preLocation == 0) and arg_7_1.location or arg_7_1.preLocation

	arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)] = arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)] or {}
	arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)].info = arg_7_1
	arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)].moveFrames = var_0_3()

	local var_7_2 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")

	arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)].sprite = var_7_2

	local var_7_3 = arg_7_0.cityTable[var_7_1].sprite

	var_7_2:setPosition(ccp(var_7_3:getPositionX(), var_7_3:getPositionY() + 10))
	arg_7_0:addChild(var_7_2, 1, arg_7_0:getArmyId(arg_7_1))

	local var_7_4 = CCSprite:create("res/ui/common/fightPic/fightPic_" .. var_0_4[arg_7_1.phantomType] .. ".png")

	var_7_4:setPosition(ccp(var_7_2:getContentSize().width / 2, var_7_2:getContentSize().height / 2))
	tool.scaleTo(var_7_4, 59, 59)
	var_7_2:addChild(var_7_4)

	local var_7_5 = CCSprite:create()

	var_7_5:setPosition(ccp(var_7_2:getContentSize().width / 2, var_7_2:getContentSize().height / 2))
	var_7_2:addChild(var_7_5, 1, 101)

	local var_7_6 = CCSprite:create()

	var_7_6:setPosition(ccp(var_7_2:getContentSize().width / 2, var_7_2:getContentSize().height / 2))
	var_7_2:addChild(var_7_6, 1, 102)

	local var_7_7 = CCSprite:create("res/ui/kfworld/swjz_word_di01.png")

	var_7_7:setPosition(ccp(var_7_2:getContentSize().width / 2, 100))
	var_7_2:addChild(var_7_7)

	local var_7_8 = CCSprite:create("res/ui/world/newleague/mzjm_di_round_2.png")

	var_7_8:setPosition(0, 21)
	var_7_7:addChild(var_7_8)

	local var_7_9 = CCSprite:create("res/ui/kfyz/swjz_word_" .. arg_7_1.phantomType .. ".png")

	var_7_9:setPosition(0, 21)
	var_7_7:addChild(var_7_9)

	local var_7_10 = language.get(136828, arg_7_1.nextCity)

	if arg_7_1.state == 4 then
		if arg_7_1.nextMoveTime and arg_7_1.nextMoveTime > 0 then
			local var_7_11 = createTimerLabel(arg_7_1.nextMoveTime, "@M:@S" .. var_7_10, "Thonburi", 18, function()
				return
			end, nil, nil, ccc3(0, 255, 0))

			var_7_11:setAnchorPoint(ccp(0.5, 0.5))
			var_7_11:setPosition(ccp(145, 21))
			var_7_7:addChild(var_7_11)
		end
	else
		local var_7_12 = CCStrokeLabelTTF:create(language.get(136835), "Thonburi", 20, 2)

		var_7_7:addChild(var_7_12)
		var_7_12:setPosition(ccp(145, 21))

		arg_7_1.isMoveOver = true
	end

	if arg_7_1.preLocation then
		arg_7_0:startMove(arg_7_1)
	end

	return arg_7_0.marchingTable[arg_7_0:getArmyId(arg_7_1)]
end

function var_0_0.showTipSpriteText(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	if arg_9_2 then
		arg_9_1:addChild(arg_9_2)
		arg_9_2:setScale(0.2)

		local function var_9_0()
			pcall(arg_9_2.removeFromParentAndCleanup, arg_9_2, true)
		end

		local var_9_1 = CCArray:create()

		var_9_1:addObject(CCMoveBy:create(1, ccp(0, 60)))
		var_9_1:addObject(CCScaleTo:create(0.05, 1.1, 1.1))
		var_9_1:addObject(CCScaleTo:create(0.05, 1, 1))
		var_9_1:addObject(CCDelayTime:create(0.4))

		if type(arg_9_4) == "number" and arg_9_4 > 0 then
			var_9_1:addObject(CCDelayTime:create(arg_9_4))
		end

		var_9_1:addObject(CCCallFuncN:create(var_9_0))

		local var_9_2 = CCSequence:create(var_9_1)

		arg_9_2:runAction(var_9_2)
		arg_9_2:runAction(CCScaleTo:create(0.5, 1, 1))
	end
end

function var_0_0.startMove(arg_11_0, arg_11_1)
	if arg_11_1.preLocation then
		local var_11_0 = false

		if arg_11_1.moveLine[#arg_11_1.moveLine] == arg_11_1.location or arg_11_1.state ~= 4 then
			var_11_0 = true
		end

		if var_11_0 then
			local var_11_1 = CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_0_4[arg_11_1.phantomType] .. ".png")
			local var_11_2 = CCSprite:create("res/ui/world/newleague/mzjm_ink.png")
			local var_11_3 = CCSprite:create("res/ui/kfyz/rqTip_" .. arg_11_1.phantomType .. ".png")

			var_11_2:setPosition(ccp(120, 20))
			var_11_1:addChild(var_11_2)
			var_11_3:setPosition(ccp(120, 20))
			var_11_1:addChild(var_11_3)

			local var_11_4 = arg_11_0.cityTable[arg_11_1.location].sprite
			local var_11_5, var_11_6 = tool.getPositionInScreen(var_11_4)

			var_11_1:setPosition(ccp(var_11_5, var_11_6 + 100))
			smgr.showTipSpriteText(var_11_1, nil, 0.1)
		end

		if arg_11_1.preLocation == 0 then
			-- block empty
		else
			arg_11_0:move(arg_11_0:getArmyId(arg_11_1), arg_11_1.preLocation, arg_11_1.location, nil, arg_11_1)
		end
	end
end

function var_0_0.move(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5)
	arg_12_4 = arg_12_4 or 4000

	local var_12_0 = arg_12_0:getArmyId(arg_12_5)

	log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
	log.info(arg_12_2)
	log.info(arg_12_3)

	if arg_12_2 == 0 then
		return
	end

	local var_12_1 = arg_12_0.cityTable[arg_12_2].sprite
	local var_12_2 = arg_12_0.cityTable[arg_12_3].sprite

	traceData.createTrace(var_12_0, {
		arg_12_2,
		arg_12_3
	})

	local var_12_3, var_12_4 = var_0_1()
	local var_12_5 = ccp(var_12_1:getPosition())
	local var_12_6 = ccp(var_12_2:getPosition())
	local var_12_7 = arg_12_0.marchingTable[arg_12_1].sprite

	var_12_7:stopAllActions()

	local var_12_8 = var_12_7:getChildByTag(101)

	var_12_8:setVisible(true)

	local var_12_9 = var_0_2(arg_12_0.marchingTable[arg_12_1].moveFrames)

	var_12_8:runAction(var_12_9)
	traceData.addMoveData(var_12_0, arg_12_2, arg_12_3, arg_12_4, var_12_7, var_12_8, var_12_6)

	if traceData.marchingInfos == nil then
		traceData.marchingInfos = {}
	end

	table.insert(traceData.marchingInfos, arg_12_5)

	if arg_12_0.updateSchedulerEntry == nil then
		arg_12_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_13_0)
			arg_12_0:update(arg_13_0)
		end, 0, false)
	end
end

function var_0_0.update(arg_14_0, arg_14_1)
	local var_14_0, var_14_1 = var_0_1()
	local var_14_2 = false
	local var_14_3 = true

	if not user.isKfyn then
		var_14_3 = false
	end

	for iter_14_0, iter_14_1 in pairs(traceData.general) do
		if iter_14_1.moveAction == nil or tolua.isnull(iter_14_1.moveAction.sprite) then
			log.warn("sprite is null", tool.tableToJson(iter_14_1))
		elseif iter_14_1.moveAction ~= nil then
			iter_14_1.moveAction.deltTime = iter_14_1.moveAction.deltTime + arg_14_1

			if iter_14_1.moveAction.deltTime > iter_14_1.moveAction.totalTime then
				if var_14_3 == true then
					iter_14_1.moveAction.sprite:setPosition(iter_14_1.moveAction.tagetPos)
					iter_14_1.moveAction.sprite:stopAllActions()
					iter_14_1.moveAction.animation:setVisible(false)
				end

				if traceData.isEndCity(iter_14_1.moveAction.generalId, iter_14_1.moveAction.city2) == true then
					if var_14_3 == true then
						traceData.deleteTrace(iter_14_1.moveAction.generalId)
					end
				else
					if var_14_3 == true then
						traceData.hideTracePoint(iter_14_1.moveAction.generalId, iter_14_1.moveAction.city1, iter_14_1.moveAction.city2)
					end

					var_14_2 = true
				end
			else
				if var_14_3 == true then
					local var_14_4 = iter_14_1.moveAction.deltTime / iter_14_1.moveAction.totalTime
					local var_14_5, var_14_6 = var_14_0.position(iter_14_1.moveAction.data, iter_14_1.moveAction.city1, iter_14_1.moveAction.city2, var_14_4)
					local var_14_7 = tool.getAngle(ccp(iter_14_1.moveAction.sprite:getPosition()), ccp(var_14_5, var_14_6))

					iter_14_1.moveAction.animation:setRotation(var_14_7 + 180)
					iter_14_1.moveAction.sprite:setPosition(ccp(var_14_5, var_14_6))
					traceData.hideSingleTracePoint(iter_14_1.moveAction.generalId, iter_14_1.moveAction.city1, iter_14_1.moveAction.city2, var_14_4)
				end

				var_14_2 = true
			end
		end
	end

	if var_14_2 == false or var_14_3 == false then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_14_0.updateSchedulerEntry)

		arg_14_0.updateSchedulerEntry = nil

		for iter_14_2, iter_14_3 in pairs(traceData.marchingInfos) do
			if iter_14_3 and iter_14_3.isMoveOver == true and arg_14_0.marchingTable[arg_14_0:getArmyId(iter_14_3)] then
				local var_14_8 = arg_14_0.marchingTable[arg_14_0:getArmyId(iter_14_3)].sprite

				if var_14_8 then
					pcall(var_14_8.removeFromParentAndCleanup, var_14_8, true)
				end

				iter_14_3 = nil
			end
		end

		marchingInfos = nil
		traceData.general = {}
	end
end

return var_0_0
