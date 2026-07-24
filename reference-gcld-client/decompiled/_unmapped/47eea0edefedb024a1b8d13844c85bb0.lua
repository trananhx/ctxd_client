local var_0_0 = class("LookMapLayer", function()
	return CCScrollView:create(visibleSize)
end)
local var_0_1 = {
	{
		"block1_1.jpg",
		"block1_2.jpg",
		"block1_3.jpg",
		"block1_4.jpg",
		"block1_5.jpg",
		"block1_6.jpg"
	},
	{
		"block2_1.jpg",
		"block2_2.jpg",
		"block2_3.jpg",
		"block2_4.jpg",
		"block2_5.jpg",
		"block2_6.jpg"
	},
	{
		"block3_1.jpg",
		"block3_2.jpg",
		"block3_3.jpg",
		"block3_4.jpg",
		"block3_5.jpg",
		"block3_6.jpg"
	},
	{
		"block4_1.jpg",
		"block4_2.jpg",
		"block4_3.jpg",
		"block4_4.jpg",
		"block4_5.jpg",
		"block4_6.jpg"
	},
	{
		"block5_1.jpg",
		"block5_2.jpg",
		"block5_3.jpg",
		"block5_4.jpg",
		"block5_5.jpg",
		"block5_6.jpg"
	},
	{
		"block6_1.jpg",
		"block6_2.jpg",
		"block6_3.jpg",
		"block6_4.jpg",
		"block6_5.jpg",
		"block6_6.jpg"
	}
}

var_0_0.areaFog = {
	{
		4,
		8,
		12,
		16,
		19,
		20,
		22,
		26,
		30,
		32,
		34,
		37,
		42,
		48,
		51,
		57,
		60,
		63,
		64,
		68,
		74,
		84
	},
	{
		79,
		89,
		95,
		119,
		122,
		123,
		125,
		132,
		163,
		164,
		169,
		177,
		184,
		214,
		216,
		221,
		227
	},
	{
		107,
		111,
		116,
		150,
		153,
		159,
		190,
		191,
		197,
		201,
		205,
		207,
		208,
		209,
		232,
		237,
		242,
		245,
		246
	}
}

local var_0_2 = {
	nil,
	102,
	78,
	189
}
local var_0_3 = import(".cubePoly")
local var_0_4 = import(".tracePoints")
local var_0_5 = ccp(0, 0)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1
	arg_2_0.control = arg_2_1.control
	arg_2_0.updateSchedulerEntry = nil
	arg_2_0.animationName = nil
	arg_2_0.animationFlip = false
	arg_2_0.angle = 0

	arg_2_0:init()
end

function var_0_0.init(arg_3_0)
	arg_3_0.cityPath = var_0_3
	arg_3_0.tracePoints = var_0_4

	local var_3_0 = {}

	var_3_0.width = 1000
	var_3_0.height = 600
	var_3_0.row = 6
	var_3_0.column = 6
	arg_3_0.mapInfo = var_3_0

	local var_3_1 = var_3_0.column * var_3_0.width
	local var_3_2 = var_3_0.row * var_3_0.height

	arg_3_0.mapInfo.mapWidth = var_3_1
	arg_3_0.mapInfo.mapHeight = var_3_2

	local var_3_3 = CCLayer:create()

	var_3_3:registerScriptHandler(function(arg_4_0)
		if arg_4_0 == "enter" then
			arg_3_0:onEnter()
		elseif arg_4_0 == "exit" then
			arg_3_0:onExit()
		end
	end)
	arg_3_0:registerScriptHandler(function(arg_5_0)
		arg_3_0:loadMapWithPosition(arg_3_0:getContentOffset().x, arg_3_0:getContentOffset().y)
	end, 0)

	arg_3_0.worldLayer = var_3_3

	arg_3_0:setDirection(kCCScrollViewDirectionBoth)
	arg_3_0:setBounceable(false)
	arg_3_0:setPosition(ccp(0, 0))
	arg_3_0:setContentSize(CCSizeMake(var_3_1, var_3_2))
	var_3_3:setContentSize(CCSizeMake(var_3_1, var_3_2))
	arg_3_0:setContainer(var_3_3)
	arg_3_0.worldLayer:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		return arg_3_0:onTouch(arg_6_0, arg_6_1, arg_6_2)
	end)
	arg_3_0.worldLayer:setTouchEnabled(true)

	local var_3_4 = ccp(0, 0)

	arg_3_0:worldSetOffset(var_3_4)

	arg_3_0.cityBatchNode = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png")

	var_3_3:addChild(arg_3_0.cityBatchNode, 2)

	arg_3_0.cityTable = {}

	local var_3_5 = "world_building_"

	for iter_3_0, iter_3_1 in pairs(worldConstant.BUILDING_INFO) do
		local var_3_6 = string.sub(iter_3_0, #var_3_5 + 1, -1)
		local var_3_7 = tonumber(var_3_6)
		local var_3_8 = CCSprite:createWithSpriteFrameName(iter_3_1.model)

		arg_3_0.cityTable[var_3_7] = arg_3_0.cityTable[var_3_7] or {}
		arg_3_0.cityTable[var_3_7].sprite = var_3_8

		local var_3_9 = var_3_8:getContentSize()
		local var_3_10 = iter_3_1.x + var_3_9.width / 2
		local var_3_11 = var_3_2 - iter_3_1.y - var_3_9.height / 2

		var_3_8:setPosition(ccp(var_3_10, var_3_11))
		arg_3_0.cityBatchNode:addChild(var_3_8, 110)

		local var_3_12 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

		var_3_12:setPosition(ccp(var_3_10, var_3_11 - 50))
		arg_3_0.cityBatchNode:addChild(var_3_12, 111)

		local var_3_13 = CCSprite:createWithSpriteFrameName("cc_" .. var_3_7 .. ".png")

		var_3_13:setPosition(ccp(var_3_10, var_3_11 - 50))
		arg_3_0.cityBatchNode:addChild(var_3_13, 112)

		if conf.language == "vie" then
			if var_3_13:getContentSize().width >= var_3_12:getContentSize().width then
				var_3_13:setAnchorPoint(ccp(0, 0.5))
				var_3_13:setPosition(ccp(var_3_12:getPositionX() - var_3_12:getContentSize().width / 2, var_3_11 - 50))
			else
				var_3_13:setPosition(ccp(var_3_12:getPositionX(), var_3_11 - 50))
			end
		end
	end

	local var_3_14 = CCSprite:createWithSpriteFrameName("thumbnailXiaoditu.jpg")

	tool.scaleTo(var_3_14, 6000, 3600)
	var_3_14:setAnchorPoint(ccp(0, 0))
	var_3_14:setPosition(ccp(0, 0))
	arg_3_0.worldLayer:addChild(var_3_14, -1)

	arg_3_0.playerLayer = CCLayer:create()

	arg_3_0.worldLayer:addChild(arg_3_0.playerLayer, 3)
	arg_3_0:initPlayer()

	arg_3_0.rewardLayer = CCLayer:create()

	arg_3_0.worldLayer:addChild(arg_3_0.rewardLayer, 4)
	arg_3_0:updateCityState()

	arg_3_0.fogLayer = CCLayer:create()

	arg_3_0.worldLayer:addChild(arg_3_0.fogLayer, 5)
	arg_3_0:addCityFog()
	arg_3_0:moveTo(arg_3_0.control.data.location)
end

function var_0_0.openNextArea(arg_7_0, arg_7_1)
	log.info("openNextArea areaId = ", arg_7_1)

	if var_0_2[arg_7_1] ~= nil then
		showTable(arg_7_0.fogBatchNode)
		arg_7_0:moveTo(var_0_2[arg_7_1])

		if arg_7_1 < 5 and arg_7_1 > 1 then
			local var_7_0 = arg_7_0.fogBatchNode[arg_7_1 - 1]:getChildren()

			if var_7_0 and var_7_0:count() > 0 then
				for iter_7_0 = 1, var_7_0:count() do
					local var_7_1 = CCArray:create()

					var_7_1:addObject(CCDelayTime:create(1))
					var_7_1:addObject(CCFadeOut:create(0.8))

					local var_7_2 = CCSequence:create(var_7_1)

					tolua.cast(var_7_0:objectAtIndex(iter_7_0 - 1), "CCSprite"):runAction(var_7_2)
				end
			end
		end

		local var_7_3 = CCArray:create()

		var_7_3:addObject(CCDelayTime:create(1))
		var_7_3:addObject(CCFadeOut:create(0.8))
		var_7_3:addObject(CCCallFunc:create(function()
			arg_7_0.control:getActivityInfo()
		end))

		local var_7_4 = CCSequence:create(var_7_3)

		arg_7_0.areaLockCitySp[arg_7_1].sprite:runAction(var_7_4)
	end
end

function var_0_0.addCityFog(arg_9_0)
	arg_9_0.fogBatchNode = arg_9_0.fogBatchNode or {}

	for iter_9_0 = 1, 3 do
		arg_9_0.fogBatchNode[iter_9_0] = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png", 100)

		arg_9_0.fogLayer:addChild(arg_9_0.fogBatchNode[iter_9_0], 800)

		for iter_9_1, iter_9_2 in pairs(arg_9_0.areaFog[iter_9_0]) do
			local var_9_0 = CCSprite:createWithSpriteFrameName("worldForg.png")

			var_9_0:setPosition(arg_9_0.cityTable[iter_9_2].sprite:getPosition())
			arg_9_0.fogBatchNode[iter_9_0]:addChild(var_9_0)
		end

		if iter_9_0 < arg_9_0.control.data.areaId then
			arg_9_0.fogBatchNode[iter_9_0]:setVisible(false)
		end
	end
end

function var_0_0.worldSetOffset(arg_10_0, arg_10_1)
	arg_10_0:setContentOffset(arg_10_1)
end

function var_0_0.loadMapWithPosition(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:stopAllActions()
	performWithDelay(arg_11_0, function()
		arg_11_0.mapTable = arg_11_0.mapTable or {}
		arg_11_1 = -arg_11_1
		arg_11_2 = -arg_11_2

		local var_12_0 = CCRectMake(arg_11_1, arg_11_2, visibleSize.width, visibleSize.height)

		for iter_12_0 = 1, 6 do
			for iter_12_1 = 1, 6 do
				local var_12_1 = 7 - iter_12_1

				if arg_11_0.mapTable[string.format("block%s_%s", iter_12_0, var_12_1)] == nil then
					local var_12_2 = CCRectMake((iter_12_0 - 1) * 1000, (iter_12_1 - 1) * 600, 1000, 600)

					if var_12_0:intersectsRect(var_12_2) then
						local var_12_3 = CCSprite:create("res/tiledmap/" .. var_0_1[iter_12_0][var_12_1])

						var_12_3:setPosition(ccp((iter_12_0 - 1) * 1000 + 500, (iter_12_1 - 1) * 600 + 300))
						arg_11_0.worldLayer:addChild(var_12_3)

						arg_11_0.mapTable[string.format("block%s_%s", iter_12_0, var_12_1)] = var_12_3

						local function var_12_4(arg_13_0)
							local var_13_0 = 0

							for iter_13_0, iter_13_1 in pairs(arg_13_0) do
								var_13_0 = var_13_0 + 1
							end

							return var_13_0
						end

						log.info("载入地图 %s %s #length#%s", iter_12_0, var_12_1, var_12_4(arg_11_0.mapTable))
					end
				end
			end
		end
	end, 0.02)
end

function var_0_0.moveTo(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	arg_14_2 = arg_14_2 or false

	local var_14_0 = arg_14_0.cityTable[arg_14_1]

	if var_14_0 == nil then
		return
	end

	local var_14_1 = var_14_0.sprite
	local var_14_2 = var_14_1:getContentSize()
	local var_14_3, var_14_4 = var_14_1:getPosition()
	local var_14_5 = arg_14_0.mapInfo
	local var_14_6 = var_14_5.column * var_14_5.width
	local var_14_7 = var_14_5.row * var_14_5.height

	if var_14_3 < visibleSize.width / 2 then
		var_14_3 = visibleSize.width / 2
	end

	if var_14_3 > var_14_6 - visibleSize.width / 2 then
		var_14_3 = var_14_6 - visibleSize.width / 2
	end

	if var_14_4 < visibleSize.height / 2 then
		var_14_4 = visibleSize.height / 2
	end

	if var_14_4 > var_14_7 - visibleSize.height / 2 then
		var_14_4 = var_14_7 - visibleSize.height / 2
	end

	if arg_14_2 then
		arg_14_3 = arg_14_3 or 0.15

		arg_14_0:setContentOffsetInDuration(ccp(-var_14_3 + visibleSize.width / 2, -var_14_4 + visibleSize.height / 2), arg_14_3)
	else
		arg_14_0:setContentOffset(ccp(-var_14_3 + visibleSize.width / 2, -var_14_4 + visibleSize.height / 2), arg_14_2)
	end
end

function var_0_0.updateCityState(arg_15_0)
	arg_15_0.rewardLayer:removeAllChildrenWithCleanup(true)

	arg_15_0.eventIconTable = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_0.control.data.cities) do
		if arg_15_0.cityTable and arg_15_0.cityTable[iter_15_1.cityId] then
			arg_15_0.cityTable[iter_15_1.cityId].sprite:removeAllChildrenWithCleanup(true)

			local var_15_0, var_15_1 = arg_15_0.cityTable[iter_15_1.cityId].sprite:getPosition()

			if iter_15_1.status == 0 then
				-- block empty
			elseif iter_15_1.status == 1 then
				local var_15_2 = CCSprite:create("res/ui/world/worldEventBtn1.png")

				var_15_2:setPosition(ccp(var_15_0, var_15_1 + 100))
				arg_15_0.rewardLayer:addChild(var_15_2)

				arg_15_0.eventIconTable[iter_15_1.cityId] = arg_15_0.eventIconTable[iter_15_1.cityId] or {}
				arg_15_0.eventIconTable[iter_15_1.cityId].sprite = var_15_2
				arg_15_0.eventIconTable[iter_15_1.cityId].boxlevel = iter_15_1.boxLv

				local var_15_3 = CCSprite:createWithSpriteFrameName("cdsh_sjsj_icon_shenghuo.png")

				var_15_3:setScale(0.9)
				var_15_3:setPosition(ccp(var_15_2:getContentSize().width * 0.5, var_15_2:getContentSize().height * 0.5))
				var_15_2:addChild(var_15_3)
			elseif iter_15_1.status == 2 then
				local var_15_4 = CCSprite:createWithSpriteFrameName("shijie_icon_huoba.png")

				var_15_4:setPosition(ccp(var_15_0, var_15_1))
				arg_15_0.rewardLayer:addChild(var_15_4)
			end

			arg_15_0.areaLockCitySp = arg_15_0.areaLockCitySp or {}

			if iter_15_1.lock == 1 then
				local var_15_5 = CCSprite:createWithSpriteFrameName("cdsh_btn_suo2.png")

				var_15_5:setPosition(ccp(var_15_0, var_15_1))
				arg_15_0.rewardLayer:addChild(var_15_5, 1000)

				for iter_15_2, iter_15_3 in pairs(var_0_2) do
					if iter_15_1.cityId == iter_15_3 then
						arg_15_0.areaLockCitySp[iter_15_2] = {}
						arg_15_0.areaLockCitySp[iter_15_2].sprite = var_15_5
					end
				end
			end
		end
	end

	if arg_15_0.control.data.canReceiveBigBox == 1 then
		arg_15_0.world:showAreaCompleteReward(arg_15_0.control.data.areaId)
	end
end

function var_0_0.LoadPlayerAnimation(arg_16_0)
	rmgr.loadResource("res/ui/activity/lookActivity/lookPlayer.plist")

	arg_16_0.playerFrames = {}
	arg_16_0.playerFrames.lk_idle_lb = rmgr.createFrameArray("lk_idle_lb", 1)
	arg_16_0.playerFrames.lk_idle_rt = rmgr.createFrameArray("lk_idle_rt", 1)
	arg_16_0.playerFrames.lk_move_lb = rmgr.createFrameArray("lk_move_lb", 6)
	arg_16_0.playerFrames.lk_move_rt = rmgr.createFrameArray("lk_move_rt", 6)
end

function var_0_0.setPlayerAnimation(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 == arg_17_0.animationName and arg_17_2 == arg_17_0.animationFlip then
		return
	end

	log.info("name = ", arg_17_1)

	arg_17_0.animationName = arg_17_1
	arg_17_0.animationFlip = arg_17_2

	arg_17_0.playerSprite:stopAllActions()

	if arg_17_2 then
		if arg_17_0.playerSprite:isFlipX() then
			-- block empty
		else
			arg_17_0.playerSprite:setFlipX(true)
		end
	else
		arg_17_0.playerSprite:setFlipX(false)
	end

	local var_17_0 = CCAnimation:createWithSpriteFrames(arg_17_0.playerFrames[arg_17_1], 0.05)
	local var_17_1 = CCAnimate:create(var_17_0)
	local var_17_2 = CCRepeatForever:create(var_17_1)

	arg_17_0.playerSprite:runAction(var_17_2)
end

function var_0_0.initPlayer(arg_18_0)
	local var_18_0 = arg_18_0.cityTable[arg_18_0.control.data.location]

	if var_18_0 == nil then
		return
	end

	local var_18_1, var_18_2 = var_18_0.sprite:getPosition()

	arg_18_0:LoadPlayerAnimation()

	arg_18_0.playerSprite = CCSprite:create()

	arg_18_0.playerLayer:addChild(arg_18_0.playerSprite, 100)
	arg_18_0.playerSprite:setPosition(ccp(var_18_1, var_18_2))
	arg_18_0:setPlayerAnimation("lk_idle_lb", true)
end

function var_0_0.movePlayerFromTo(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	log.info("move fromCityId = ", arg_19_1, "toCityId = ", arg_19_2)

	arg_19_0.tracePointData = arg_19_0.tracePointData or {}
	arg_19_0.data = arg_19_0.tracePoints.elapse(arg_19_1, arg_19_2)
	arg_19_0.tracePointData.count = arg_19_0.data.count + 1
	arg_19_0.pointCount = arg_19_0.data.count + 1
	arg_19_0.pathData = arg_19_0.cityPath.curve(arg_19_1, arg_19_2)

	if arg_19_0.batchNode ~= nil then
		arg_19_0.batchNode:removeFromParentAndCleanup(true)

		arg_19_0.batchNode = nil
	end

	arg_19_0.batchNode = CCSpriteBatchNode:create("res/ui/world/path_icon.png", arg_19_0.pointCount)

	arg_19_0.batchNode:setPosition(ccp(0, 0))
	arg_19_0:addChild(arg_19_0.batchNode)

	if arg_19_1 < arg_19_2 then
		for iter_19_0 = 1, arg_19_0.data.count do
			log.info("i = ", iter_19_0)

			local var_19_0 = arg_19_0.data.time[iter_19_0]
			local var_19_1, var_19_2 = arg_19_0.cityPath.position(arg_19_0.pathData, arg_19_1, arg_19_2, var_19_0)
			local var_19_3 = CCSprite:createWithTexture(arg_19_0.batchNode:getTexture())

			var_19_3:setPosition(ccp(var_19_1, var_19_2))
			arg_19_0.batchNode:addChild(var_19_3)

			arg_19_0.tracePointData["icon_" .. iter_19_0] = var_19_3
			arg_19_0.tracePointData["percent_" .. iter_19_0] = var_19_0

			if ignoreLine then
				var_19_3:setVisible(false)
			end
		end
	else
		for iter_19_1 = 1, arg_19_0.data.count do
			log.info("i = ", iter_19_1)

			local var_19_4 = arg_19_0.data.time[arg_19_0.data.count + 1 - iter_19_1]
			local var_19_5, var_19_6 = arg_19_0.cityPath.position(arg_19_0.pathData, arg_19_2, arg_19_1, var_19_4)
			local var_19_7 = CCSprite:createWithTexture(arg_19_0.batchNode:getTexture())

			var_19_7:setPosition(ccp(var_19_5, var_19_6))
			arg_19_0.batchNode:addChild(var_19_7)

			arg_19_0.tracePointData["icon_" .. iter_19_1] = var_19_7
			arg_19_0.tracePointData["percent_" .. iter_19_1] = 1 - var_19_4

			if ignoreLine then
				var_19_7:setVisible(false)
			end
		end
	end

	local var_19_8 = ccp(arg_19_0.cityTable[arg_19_1].sprite:getPosition())
	local var_19_9 = ccp(arg_19_0.cityTable[arg_19_2].sprite:getPosition())

	arg_19_0.playerSprite:stopAllActions()

	arg_19_0.deltaTime = 0
	arg_19_0.fromCityId = arg_19_1
	arg_19_0.toCityId = arg_19_2
	arg_19_0.callBack = arg_19_3

	if arg_19_0.updateSchedulerEntry == nil then
		arg_19_0.scheduler = CCDirector:sharedDirector():getScheduler()
		arg_19_0.updateSchedulerEntry = arg_19_0.scheduler:scheduleScriptFunc(handler(arg_19_0, arg_19_0.playerUpdate), 0, false)
	end
end

function var_0_0.playerUpdate(arg_20_0, arg_20_1)
	if arg_20_0.playerSprite == nil or tolua.isnull(arg_20_0.playerSprite) then
		arg_20_0.scheduler:unscheduleScriptEntry(arg_20_0.updateSchedulerEntry)

		arg_20_0.updateSchedulerEntry = nil

		return
	end

	arg_20_0.deltaTime = arg_20_0.deltaTime + arg_20_1
	arg_20_0.percent = arg_20_0.deltaTime / 1

	local var_20_0, var_20_1 = arg_20_0.cityPath.position(arg_20_0.pathData, arg_20_0.fromCityId, arg_20_0.toCityId, arg_20_0.percent)

	arg_20_0.angle = tool.getAngle(ccp(arg_20_0.playerSprite:getPosition()), ccp(var_20_0, var_20_1))

	if arg_20_0.angle >= 0 and arg_20_0.angle < 90 then
		arg_20_0:setPlayerAnimation("lk_move_rt", false)
	elseif arg_20_0.angle >= 90 and arg_20_0.angle < 180 then
		arg_20_0:setPlayerAnimation("lk_move_lb", true)
	elseif arg_20_0.angle >= 180 and arg_20_0.angle < 270 then
		arg_20_0:setPlayerAnimation("lk_move_lb", false)
	elseif arg_20_0.angle >= 270 and arg_20_0.angle < 360 then
		arg_20_0:setPlayerAnimation("lk_move_rt", true)
	else
		log.info("angle something wrong!")
	end

	arg_20_0.playerSprite:setPosition(ccp(var_20_0, var_20_1))

	for iter_20_0 = 1, arg_20_0.data.count do
		if arg_20_0.tracePointData["percent_" .. iter_20_0] <= arg_20_0.percent then
			arg_20_0.tracePointData["icon_" .. iter_20_0]:setVisible(false)
		end
	end

	if arg_20_0.percent >= 1 then
		arg_20_0.scheduler:unscheduleScriptEntry(arg_20_0.updateSchedulerEntry)

		arg_20_0.updateSchedulerEntry = nil

		arg_20_0.callBack()
	end
end

function var_0_0.playerMove(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {}
	local var_21_1 = 1

	var_21_0[var_21_1] = function()
		if arg_21_0.angle >= 0 and arg_21_0.angle < 90 then
			arg_21_0:setPlayerAnimation("lk_idle_rt", false)
		elseif arg_21_0.angle >= 90 and arg_21_0.angle < 180 then
			arg_21_0:setPlayerAnimation("lk_idle_lb", true)
		elseif arg_21_0.angle >= 180 and arg_21_0.angle < 270 then
			arg_21_0:setPlayerAnimation("lk_idle_lb", false)
		elseif arg_21_0.angle >= 270 and arg_21_0.angle < 360 then
			arg_21_0:setPlayerAnimation("lk_idle_rt", true)
		else
			log.info("angle something wrong!")
		end

		if arg_21_2 == 1 then
			arg_21_0.world:showAreaCompleteReward(arg_21_0.control.data.areaId)
		end

		arg_21_0.world.thumbnailLayer:updateThumbnail()

		arg_21_0.control.ismoving = false
	end

	for iter_21_0 = #arg_21_1 - 1, 1, -1 do
		local var_21_2 = tonumber(arg_21_1[iter_21_0].cityId)
		local var_21_3 = tonumber(arg_21_1[iter_21_0 + 1].cityId)

		var_21_0[#arg_21_1 - iter_21_0 + 1] = function()
			if arg_21_0.angle >= 0 and arg_21_0.angle < 90 then
				arg_21_0:setPlayerAnimation("lk_idle_rt", false)
			elseif arg_21_0.angle >= 90 and arg_21_0.angle < 180 then
				arg_21_0:setPlayerAnimation("lk_idle_lb", true)
			elseif arg_21_0.angle >= 180 and arg_21_0.angle < 270 then
				arg_21_0:setPlayerAnimation("lk_idle_lb", false)
			elseif arg_21_0.angle >= 270 and arg_21_0.angle < 360 then
				arg_21_0:setPlayerAnimation("lk_idle_rt", true)
			else
				log.info("angle something wrong!")
			end

			arg_21_0:checkOpenBox(var_21_2)
			arg_21_0.world.thumbnailLayer:updateThumbnail()
			arg_21_0:movePlayerFromTo(var_21_2, var_21_3, var_21_0[#arg_21_1 - iter_21_0])
		end
		var_21_1 = var_21_1 + 1
	end

	var_21_0[#var_21_0]()

	local var_21_4 = tonumber(arg_21_1[#arg_21_1].cityId)
	local var_21_5 = arg_21_0.cityTable[var_21_4].sprite
	local var_21_6 = CCJumpBy:create(1, ccp(0, 0), 40, 1)
	local var_21_7 = CCSprite:create("res/ui/guide/jiantou-xia.png")
	local var_21_8, var_21_9 = var_21_5:getPosition()

	var_21_7:setPosition(ccp(var_21_8 - 35, var_21_9 + 50))
	arg_21_0:addChild(var_21_7, 130)
	var_21_7:runAction(CCRepeatForever:create(var_21_6))

	local var_21_10 = CCSequence:createWithTwoActions(CCDelayTime:create(2), CCCallFuncN:create(function()
		var_21_7:removeFromParentAndCleanup(true)
	end))

	var_21_7:runAction(var_21_10)
end

function var_0_0.checkOpenBox(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.control.data.cities) do
		if iter_25_1.cityId == arg_25_1 then
			if iter_25_1.status == 1 then
				arg_25_0:showCityRewards(iter_25_1.rewards)

				iter_25_1.status = 2

				arg_25_0:updateCityState()
			end

			break
		end
	end
end

function var_0_0.showCityRewards(arg_26_0, arg_26_1)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_1) do
		if arg_26_0.control.idmap[iter_26_1.type] == null then
			log.info("UNKNOWN TYPE", iter_26_1.type)
		else
			var_26_0[iter_26_0] = {}
			var_26_0[iter_26_0].id = arg_26_0.control.idmap[iter_26_1.type]
			var_26_0[iter_26_0].value = iter_26_1.value
		end
	end

	if #var_26_0 > 0 then
		globalAction_gotResource(var_26_0)
	end
end

function var_0_0.onTouch(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	if arg_27_1 == CCTOUCHBEGAN then
		var_0_5 = ccp(arg_27_2, arg_27_3)

		return true
	elseif arg_27_1 == CCTOUCHMOVED then
		arg_27_0.world:updateThumbnailFrame()

		return true
	elseif arg_27_1 == CCTOUCHENDED then
		arg_27_0.world:updateThumbnailFrame()

		if ccpDistance(var_0_5, ccp(arg_27_2, arg_27_3)) > 20 then
			return
		end

		for iter_27_0, iter_27_1 in pairs(arg_27_0.eventIconTable) do
			if tool.checkIfTouch(iter_27_1.sprite, arg_27_2, arg_27_3) then
				if arg_27_0.control.data.location == iter_27_0 then
					arg_27_0.world.effectLayer:showCityEvent(iter_27_1.boxlevel)
				end

				return
			end
		end

		for iter_27_2, iter_27_3 in pairs(arg_27_0.cityTable) do
			if tool.checkIfTouch(iter_27_3.sprite, arg_27_2, arg_27_3) then
				arg_27_0.control:lookWalk(iter_27_2)

				return
			end
		end
	end
end

function var_0_0.onEnter(arg_28_0)
	return
end

function var_0_0.onExit(arg_29_0)
	return
end

return var_0_0
