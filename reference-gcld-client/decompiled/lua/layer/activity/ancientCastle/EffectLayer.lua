local var_0_0 = class("AdventureEffectLayer", function()
	return createBaseLayer()
end)
local var_0_1 = {
	{
		"res/ui/activity/ancientCastle/dicz.png",
		"res/ui/activity/ancientCastle/dickai.png"
	},
	{
		"res/ui/activity/ancientCastle/zhongcz.png",
		"res/ui/activity/ancientCastle/zhongckai.png"
	},
	{
		"res/ui/activity/ancientCastle/gaocz.png",
		"res/ui/activity/ancientCastle/gaockai.png"
	},
	{
		"res/ui/activity/ancientCastle/big_1.png",
		"res/ui/activity/ancientCastle/big_2.png"
	}
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.ad = arg_2_1
	arg_2_0.cityPath = require("lua/layer/activity/ancientCastle/config/tanbaoCubePoly_" .. arg_2_0.ad.mapId)
	arg_2_0.tracePoints = require("lua/layer/activity/ancientCastle/config/tracePoints_" .. arg_2_0.ad.mapId)
	arg_2_0.boxTable = {}
end

function var_0_0.getBoxPosByTwoCity(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0.cityPath.curve(arg_3_1, arg_3_2)
	local var_3_1, var_3_2 = arg_3_0.cityPath.position(var_3_0, arg_3_1, arg_3_2, 0.5)

	return ccp(var_3_1, var_3_2)
end

function var_0_0.chechBoxWillOpen(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_3 = arg_4_3 / 2

	for iter_4_0, iter_4_1 in pairs(arg_4_0.boxTable) do
		if iter_4_1.info.startId == arg_4_1 and iter_4_1.info.endId == arg_4_2 or iter_4_1.info.startId == arg_4_2 and iter_4_1.info.endId == arg_4_1 then
			local var_4_0 = CCArray:create()

			var_4_0:addObject(CCDelayTime:create(arg_4_3))
			var_4_0:addObject(CCCallFunc:create(function()
				iter_4_1.sprite:setDisplayFrame(CCSprite:create(var_0_1[iter_4_1.info.type][2]):displayFrame())

				local var_5_0 = {}
				local var_5_1 = {
					nil,
					nil,
					3,
					4,
					nil,
					nil,
					nil,
					nil,
					5,
					6,
					nil,
					nil,
					nil,
					100,
					10003,
					2003,
					7,
					41,
					24,
					[2002] = 2002,
					[2001] = 2001
				}

				for iter_5_0, iter_5_1 in pairs(iter_4_1.info.rewards) do
					if var_5_1[iter_5_1.type] == null then
						log.info("UNKNOWN TYPE", iter_5_1.type)
					else
						var_5_0[iter_5_0] = {}
						var_5_0[iter_5_0].id = var_5_1[iter_5_1.type]
						var_5_0[iter_5_0].value = iter_5_1.value
					end
				end

				if #var_5_0 > 0 then
					globalAction_gotResource(var_5_0)
				end
			end))
			var_4_0:addObject(CCDelayTime:create(arg_4_3))
			var_4_0:addObject(CCCallFunc:create(function()
				iter_4_1.sprite:removeFromParentAndCleanup(true)

				arg_4_0.boxTable[iter_4_0] = nil
			end))
			iter_4_1.sprite:runAction(CCSequence:create(var_4_0))
		end
	end
end

function var_0_0.updateBox(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.boxTable[arg_7_1.boxId]

	if var_7_0 ~= nil then
		var_7_0.sprite:removeFromParentAndCleanup(true)
	end

	local var_7_1 = {}
	local var_7_2 = CCSprite:create(var_0_1[arg_7_1.type][1])
	local var_7_3 = arg_7_0:getBoxPosByTwoCity(arg_7_1.startId, arg_7_1.endId)

	var_7_2:setPosition(var_7_3)
	arg_7_0:addChild(var_7_2)

	var_7_1.sprite = var_7_2
	var_7_1.info = arg_7_1
	arg_7_0.boxTable[arg_7_1.boxId] = var_7_1
end

return var_0_0
