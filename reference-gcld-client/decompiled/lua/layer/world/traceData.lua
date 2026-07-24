traceData = {}
traceData.general = {}

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

function traceData.init()
	return
end

function traceData.createTrace(arg_3_0, arg_3_1)
	arg_3_0 = tonumber(arg_3_0)

	local var_3_0, var_3_1 = var_0_0()
	local var_3_2 = #arg_3_1

	if var_3_2 < 2 then
		return
	end

	local var_3_3 = smgr.getLayer("generalMoveLayer")

	if traceData.general[arg_3_0] == nil then
		traceData.general[arg_3_0] = {}
	else
		if #arg_3_1 == 2 and traceData.general[arg_3_0].cities then
			local var_3_4 = #traceData.general[arg_3_0].cities

			if var_3_4 >= 2 then
				for iter_3_0 = 1, var_3_4 - 1 do
					if traceData.general[arg_3_0].cities[iter_3_0] == arg_3_1[1] and traceData.general[arg_3_0].cities[iter_3_0 + 1] == arg_3_1[2] then
						log.info("已经有的路线，不需要再画")

						if smgr.currentSceneTag == SCENE_KFYZ_WORLD and iter_3_0 >= 2 then
							local var_3_5 = traceData.general[arg_3_0].cities[iter_3_0 - 1]
							local var_3_6 = traceData.general[arg_3_0].cities[iter_3_0]

							traceData.hideTracePoint(arg_3_0, var_3_5, var_3_6)
							log.info("kfyz, old trace", arg_3_0, var_3_5, var_3_6)
						end

						return
					end
				end
			end
		end

		if var_3_3 and not tolua.isnull(var_3_3) then
			var_3_3:removeChild(traceData.general[arg_3_0].batchNode, true)

			traceData.general[arg_3_0] = {}
		end
	end

	traceData.general[arg_3_0].cities = arg_3_1
	traceData.general[arg_3_0].cityCount = var_3_2

	local var_3_7 = 0

	for iter_3_1 = 1, var_3_2 - 1 do
		local var_3_8 = arg_3_1[iter_3_1]
		local var_3_9 = arg_3_1[iter_3_1 + 1]
		local var_3_10 = var_3_1.elapse(var_3_8, var_3_9)

		if var_3_10 then
			var_3_7 = var_3_7 + var_3_10.count + 1
		else
			return
		end
	end

	local var_3_11 = CCSpriteBatchNode:create("res/ui/world/path_icon.png", var_3_7)

	var_3_11:setPosition(ccp(0, 0))

	if var_3_3 and not tolua.isnull(var_3_3) then
		var_3_3:addChild(var_3_11)
	end

	traceData.general[arg_3_0].batchNode = var_3_11
	traceData.general[arg_3_0].points = {}

	for iter_3_2 = 1, var_3_2 - 1 do
		local var_3_12 = arg_3_1[iter_3_2]
		local var_3_13 = arg_3_1[iter_3_2 + 1]
		local var_3_14 = "" .. var_3_12 .. "_" .. var_3_13

		traceData.general[arg_3_0].points[var_3_14] = traceData.createTraceByNeighborCity(var_3_11, var_3_12, var_3_13)
	end
end

function traceData.createTraceByNeighborCity(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0, var_4_1 = var_0_0()
	local var_4_2 = var_4_0.curve(arg_4_1, arg_4_2)
	local var_4_3 = {}
	local var_4_4 = var_4_1.elapse(arg_4_1, arg_4_2)

	var_4_3.count = var_4_4.count + 1

	if arg_4_1 < arg_4_2 then
		for iter_4_0 = 1, var_4_4.count do
			local var_4_5 = var_4_4.time[iter_4_0]
			local var_4_6, var_4_7 = var_4_0.position(var_4_2, arg_4_1, arg_4_2, var_4_5)
			local var_4_8 = CCSprite:createWithTexture(arg_4_0:getTexture())

			var_4_8:setPosition(ccp(var_4_6, var_4_7))
			arg_4_0:addChild(var_4_8)

			var_4_3["icon_" .. iter_4_0] = var_4_8
			var_4_3["percent_" .. iter_4_0] = var_4_5
		end
	else
		for iter_4_1 = 1, var_4_4.count do
			local var_4_9 = var_4_4.time[var_4_4.count + 1 - iter_4_1]
			local var_4_10, var_4_11 = var_4_0.position(var_4_2, arg_4_2, arg_4_1, var_4_9)
			local var_4_12 = CCSprite:createWithTexture(arg_4_0:getTexture())

			var_4_12:setPosition(ccp(var_4_10, var_4_11))
			arg_4_0:addChild(var_4_12)

			var_4_3["icon_" .. iter_4_1] = var_4_12
			var_4_3["percent_" .. iter_4_1] = 1 - var_4_9
		end
	end

	local var_4_13

	if smgr.currentSceneTag == SCENE_JUBEN then
		var_4_13 = eventManager.dispatchEvent("JubenGetCitySprite", arg_4_2)
	elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		var_4_13 = eventManager.dispatchEvent("KfworldGetCitySprite", arg_4_2)
	else
		var_4_13 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_4_2].sprite
	end

	local var_4_14 = ccp(var_4_13:getPosition())
	local var_4_15 = CCSprite:createWithTexture(arg_4_0:getTexture())

	var_4_15:setPosition(var_4_14)
	arg_4_0:addChild(var_4_15)

	var_4_3["icon_" .. var_4_4.count + 1] = var_4_15
	var_4_3["percent_" .. var_4_4.count + 1] = 1

	return var_4_3
end

function traceData.hideSingleTracePoint(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0, var_5_1 = var_0_0()

	if traceData.general[arg_5_0] ~= nil then
		local var_5_2 = "" .. arg_5_1 .. "_" .. arg_5_2
		local var_5_3 = traceData.general[arg_5_0].points[var_5_2]

		if var_5_3 ~= nil then
			traceData.general[arg_5_0].nextCity = arg_5_2

			for iter_5_0 = 1, var_5_3.count do
				if arg_5_3 >= var_5_3["percent_" .. iter_5_0] and var_5_3["icon_" .. iter_5_0] and not tolua.isnull(var_5_3["icon_" .. iter_5_0]) then
					var_5_3["icon_" .. iter_5_0]:setVisible(false)
				end
			end
		end
	end
end

function traceData.hideTracePoint(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0, var_6_1 = var_0_0()

	if traceData.general[arg_6_0] ~= nil and traceData.general[arg_6_0].points ~= nil then
		local var_6_2 = "" .. arg_6_1 .. "_" .. arg_6_2
		local var_6_3 = traceData.general[arg_6_0].points[var_6_2]

		if var_6_3 ~= nil then
			for iter_6_0 = 1, var_6_3.count do
				var_6_3["icon_" .. iter_6_0]:setVisible(false)
			end
		end
	end
end

function traceData.stopTrace(arg_7_0)
	local var_7_0, var_7_1 = var_0_0()

	print("traceData.stopTrace -> ", arg_7_0)

	if traceData.general[arg_7_0] ~= nil then
		local var_7_2 = false

		for iter_7_0 = 1, traceData.general[arg_7_0].cityCount - 1 do
			local var_7_3 = traceData.general[arg_7_0].cities[iter_7_0]

			if var_7_2 == false and var_7_3 == traceData.general[arg_7_0].nextCity then
				var_7_2 = true
			end

			if var_7_2 == true then
				local var_7_4 = traceData.general[arg_7_0].cities[iter_7_0 + 1]

				traceData.hideTracePoint(arg_7_0, var_7_3, var_7_4)
			end
		end
	end
end

function traceData.deleteTrace(arg_8_0)
	local var_8_0, var_8_1 = var_0_0()

	if traceData.general[arg_8_0] ~= nil then
		local var_8_2 = smgr.getLayer("generalMoveLayer")

		log.info("deleteTrace")

		if var_8_2 and traceData and traceData.general and traceData.general[arg_8_0] and traceData.general[arg_8_0].batchNode then
			var_8_2:removeChild(traceData.general[arg_8_0].batchNode, true)

			traceData.general[arg_8_0] = nil
		end
	end
end

function traceData.deleteAllTrace()
	for iter_9_0, iter_9_1 in pairs(traceData.general) do
		traceData.deleteTrace(iter_9_0)
	end
end

function traceData.isEndCity(arg_10_0, arg_10_1)
	local var_10_0, var_10_1 = var_0_0()

	if traceData.general[arg_10_0] ~= nil and traceData.general[arg_10_0].cities[traceData.general[arg_10_0].cityCount] == arg_10_1 then
		return true
	end

	return false
end

function traceData.addMoveData(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6)
	local var_11_0, var_11_1 = var_0_0()

	if traceData.general[arg_11_0] ~= nil then
		traceData.general[arg_11_0].moveAction = {}
		traceData.general[arg_11_0].moveAction.generalId = arg_11_0
		traceData.general[arg_11_0].moveAction.deltTime = 0
		traceData.general[arg_11_0].moveAction.totalTime = arg_11_3 / 1000
		traceData.general[arg_11_0].moveAction.sprite = arg_11_4
		traceData.general[arg_11_0].moveAction.city1 = arg_11_1
		traceData.general[arg_11_0].moveAction.city2 = arg_11_2
		traceData.general[arg_11_0].moveAction.tagetPos = arg_11_6
		traceData.general[arg_11_0].moveAction.animation = arg_11_5
		traceData.general[arg_11_0].moveAction.data = var_11_0.curve(arg_11_1, arg_11_2)
	end
end

function traceData.moveBetweenTwoCity(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5)
	arg_12_5 = arg_12_5 or false

	if arg_12_1 == nil or arg_12_2 == nil then
		return
	end

	arg_12_3 = arg_12_3 / 1000

	local var_12_0, var_12_1 = var_0_0()
	local var_12_2 = var_12_0.curve(arg_12_1, arg_12_2)
	local var_12_3 = {
		count = var_12_1.elapse(arg_12_1, arg_12_2).count + 1
	}
	local var_12_4 = smgr.getLayer("generalMoveLayer")
	local var_12_5 = 0
	local var_12_6 = var_12_1.elapse(arg_12_1, arg_12_2)
	local var_12_7 = var_12_5 + var_12_6.count + 1
	local var_12_8 = CCSpriteBatchNode:create("res/ui/world/path_icon.png", var_12_7)

	var_12_8:setPosition(ccp(0, 0))
	var_12_4:addChild(var_12_8)

	if arg_12_1 < arg_12_2 then
		for iter_12_0 = 1, var_12_6.count do
			local var_12_9 = var_12_6.time[iter_12_0]
			local var_12_10, var_12_11 = var_12_0.position(var_12_2, arg_12_1, arg_12_2, var_12_9)
			local var_12_12 = CCSprite:createWithTexture(var_12_8:getTexture())

			var_12_12:setPosition(ccp(var_12_10, var_12_11))
			var_12_8:addChild(var_12_12)

			var_12_3["icon_" .. iter_12_0] = var_12_12
			var_12_3["percent_" .. iter_12_0] = var_12_9

			if arg_12_5 then
				var_12_12:setVisible(false)
			end
		end
	else
		for iter_12_1 = 1, var_12_6.count do
			local var_12_13 = var_12_6.time[var_12_6.count + 1 - iter_12_1]
			local var_12_14, var_12_15 = var_12_0.position(var_12_2, arg_12_2, arg_12_1, var_12_13)
			local var_12_16 = CCSprite:createWithTexture(var_12_8:getTexture())

			var_12_16:setPosition(ccp(var_12_14, var_12_15))
			var_12_8:addChild(var_12_16)

			var_12_3["icon_" .. iter_12_1] = var_12_16
			var_12_3["percent_" .. iter_12_1] = 1 - var_12_13

			if arg_12_5 then
				var_12_16:setVisible(false)
			end
		end
	end

	local var_12_17 = 0
	local var_12_18 = CCDirector:sharedDirector():getScheduler()
	local var_12_19

	local function var_12_20(arg_13_0)
		if arg_12_0 == nil or tolua.isnull(arg_12_0) then
			var_12_18:unscheduleScriptEntry(var_12_19)

			return
		end

		var_12_17 = var_12_17 + arg_13_0

		local var_13_0 = var_12_17 / arg_12_3
		local var_13_1, var_13_2 = var_12_0.position(var_12_2, arg_12_1, arg_12_2, var_13_0)

		arg_12_0:setPosition(ccp(var_13_1, var_13_2))

		if var_13_0 >= 1 then
			arg_12_4()
			var_12_18:unscheduleScriptEntry(var_12_19)
		end

		for iter_13_0 = 1, var_12_6.count do
			if var_13_0 >= var_12_3["percent_" .. iter_13_0] then
				var_12_3["icon_" .. iter_13_0]:setVisible(false)
			end
		end
	end

	if var_12_19 == nil then
		var_12_19 = var_12_18:scheduleScriptFunc(var_12_20, 0, false)
	end
end

function traceData.drawLineBetweenTwoCity(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0 == nil or arg_14_1 == nil then
		return
	end

	arg_14_2 = arg_14_2 or smgr.getLayer("worldCamera").warOptionLayer

	local var_14_0, var_14_1 = var_0_0()
	local var_14_2 = var_14_0.curve(arg_14_0, arg_14_1)
	local var_14_3 = {
		count = var_14_1.elapse(arg_14_0, arg_14_1).count + 1
	}
	local var_14_4 = arg_14_2
	local var_14_5 = 0
	local var_14_6 = var_14_1.elapse(arg_14_0, arg_14_1)
	local var_14_7 = var_14_5 + var_14_6.count + 1
	local var_14_8 = CCSpriteBatchNode:create("res/ui/world/path_icon.png", var_14_7)

	var_14_8:setPosition(ccp(0, 0))
	var_14_4:addChild(var_14_8)

	if arg_14_0 < arg_14_1 then
		for iter_14_0 = 1, var_14_6.count do
			local var_14_9 = var_14_6.time[iter_14_0]
			local var_14_10, var_14_11 = var_14_0.position(var_14_2, arg_14_0, arg_14_1, var_14_9)
			local var_14_12 = CCSprite:createWithTexture(var_14_8:getTexture())

			var_14_12:setPosition(ccp(var_14_10, var_14_11))
			var_14_8:addChild(var_14_12)

			var_14_3["icon_" .. iter_14_0] = var_14_12
			var_14_3["percent_" .. iter_14_0] = var_14_9
		end
	else
		for iter_14_1 = 1, var_14_6.count do
			local var_14_13 = var_14_6.time[var_14_6.count + 1 - iter_14_1]
			local var_14_14, var_14_15 = var_14_0.position(var_14_2, arg_14_1, arg_14_0, var_14_13)
			local var_14_16 = CCSprite:createWithTexture(var_14_8:getTexture())

			var_14_16:setPosition(ccp(var_14_14, var_14_15))
			var_14_8:addChild(var_14_16)

			var_14_3["icon_" .. iter_14_1] = var_14_16
			var_14_3["percent_" .. iter_14_1] = 1 - var_14_13
		end
	end

	local var_14_17 = 0
	local var_14_18 = CCDirector:sharedDirector():getScheduler()
	local var_14_19
end
