local var_0_0 = class("kfmgMapLayer", function()
	return CCScrollView:create(visibleSize)
end)
local var_0_1 = require("lua/layer/kfyzWorld/EffectLayer")
local var_0_2 = require("lua/layer/world/cityWindow2/ui")
local var_0_3 = {
	[206] = true,
	[252] = true,
	[254] = true,
	[251] = true,
	[250] = true,
	[253] = true
}
local var_0_4 = {
	123,
	19,
	207,
	[6002] = 105
}
local var_0_5 = {
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

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1

	arg_2_0:init()
end

function var_0_0.createCitiesMatrix(arg_3_0, arg_3_1)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in pairs(arg_3_1) do
		local var_3_1 = string.split(iter_3_0, "_")
		local var_3_2 = tonumber(var_3_1[1])
		local var_3_3 = tonumber(var_3_1[2])

		var_3_0[var_3_2] = var_3_0[var_3_2] or {}
		var_3_0[var_3_3] = var_3_0[var_3_3] or {}
		var_3_0[var_3_2][var_3_3] = true
		var_3_0[var_3_3][var_3_2] = true
	end

	arg_3_0.citiesMatrix = var_3_0
end

function var_0_0.init(arg_4_0)
	local var_4_0 = {}

	var_4_0.width = 1000
	var_4_0.height = 600
	var_4_0.row = 6
	var_4_0.column = 6
	MAP_ROW = 6
	MAP_COLUMN = 6
	arg_4_0.mapInfo = var_4_0

	local var_4_1 = var_4_0.column * var_4_0.width
	local var_4_2 = var_4_0.row * var_4_0.height

	arg_4_0.mapInfo.mapWidth = var_4_1
	arg_4_0.mapInfo.mapHeight = var_4_2

	local var_4_3 = CCLayer:create()

	var_4_3:registerScriptHandler(function(arg_5_0)
		if arg_5_0 == "enter" then
			arg_4_0:onEnter()
		elseif arg_5_0 == "exit" then
			arg_4_0:onExit()
		end
	end)

	arg_4_0.worldLayer = var_4_3

	arg_4_0:setDirection(kCCScrollViewDirectionBoth)
	arg_4_0:setBounceable(false)
	arg_4_0:setPosition(ccp(0, 0))
	arg_4_0:setContentSize(CCSizeMake(var_4_1, var_4_2))
	var_4_3:setContentSize(CCSizeMake(var_4_1, var_4_2))
	arg_4_0:setContainer(var_4_3)
	arg_4_0.worldLayer:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		return arg_4_0:onTouch(arg_6_0, arg_6_1, arg_6_2)
	end)
	arg_4_0.worldLayer:setTouchEnabled(true)

	if kfworld and kfworld.memoryLocation then
		arg_4_0:setContentOffset(kfworld.memoryLocation)
	end

	arg_4_0:loadMapWithPosition(arg_4_0:getContentOffset().x, arg_4_0:getContentOffset().y)

	local var_4_4 = CCLayer:create()

	arg_4_0.worldLayer:addChild(var_4_4, 10)

	arg_4_0.minBloodLayer = var_4_4

	local var_4_5 = CCLayer:create()

	arg_4_0.worldLayer:addChild(var_4_5, 5)

	arg_4_0.enduranceStateLayer = var_4_5
	arg_4_0.enduranceStateLayer.armsTab = {}

	local var_4_6 = CCSprite:createWithSpriteFrameName("thumbnailXiaoditu.jpg")

	var_4_6:setScaleX(var_4_1 / var_4_6:getContentSize().width)
	var_4_6:setScaleY(var_4_2 / var_4_6:getContentSize().height)
	var_4_6:setAnchorPoint(ccp(0, 0))
	var_4_6:setPosition(ccp(0, 0))
	var_4_3:addChild(var_4_6, 0)

	local var_4_7

	arg_4_0:registerScriptHandler(function()
		local function var_7_0()
			arg_4_0:loadMapWithPosition(arg_4_0:getContentOffset().x, arg_4_0:getContentOffset().y)
		end

		if var_4_7 then
			arg_4_0:stopAction(var_4_7)
		end

		var_4_7 = performWithDelay(arg_4_0, var_7_0, 0.1)
	end, 0)

	arg_4_0.cityBatchNode = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png")

	var_4_3:addChild(arg_4_0.cityBatchNode, 2)

	arg_4_0.cityTable = {}
	arg_4_0.cityEventTable = {}

	local var_4_8 = "world_building_"

	for iter_4_0, iter_4_1 in pairs(worldConstant.BUILDING_INFO) do
		local var_4_9 = string.sub(iter_4_0, #var_4_8 + 1, -1)
		local var_4_10 = tonumber(var_4_9)
		local var_4_11 = CCSprite:createWithSpriteFrameName(iter_4_1.model)

		arg_4_0.cityTable[var_4_10] = arg_4_0.cityTable[var_4_10] or {}
		arg_4_0.cityTable[var_4_10].sprite = var_4_11

		local var_4_12 = var_4_11:getContentSize()
		local var_4_13 = iter_4_1.x + var_4_12.width / 2
		local var_4_14 = var_4_2 - iter_4_1.y - var_4_12.height / 2

		var_4_11:setPosition(ccp(var_4_13, var_4_14))
		arg_4_0.cityBatchNode:addChild(var_4_11, 110)

		local var_4_15 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

		var_4_15:setPosition(ccp(var_4_13, var_4_14 - 50))
		arg_4_0.cityBatchNode:addChild(var_4_15, 111)

		local var_4_16 = CCSprite:createWithSpriteFrameName("cc_" .. var_4_10 .. ".png")

		var_4_16:setPosition(ccp(var_4_13, var_4_14 - 50))
		arg_4_0.cityBatchNode:addChild(var_4_16, 112)

		if user.kfyzWorldId == 9 and worldMianzhanConstant.BUILDING_INFO["world_building_" .. var_4_10] then
			local var_4_17 = worldMianzhanConstant.BUILDING_INFO["world_building_" .. var_4_10].model

			if var_4_17 == "worldBuildingGuanqia1.png" then
				local var_4_18 = CCSprite:createWithSpriteFrameName("word_lock_old_02.png")

				var_4_18:setPosition(ccp(var_4_13, var_4_14))
				arg_4_0.cityBatchNode:addChild(var_4_18, 115)
			elseif var_4_17 == "worldBuildingGuanqia2.png" then
				local var_4_19 = CCSprite:createWithSpriteFrameName("word_lock_old_03.png")

				var_4_19:setPosition(ccp(var_4_13, var_4_14))
				arg_4_0.cityBatchNode:addChild(var_4_19, 115)
			elseif var_4_17 == "worldBuildingGuanqia3.png" then
				local var_4_20 = CCSprite:createWithSpriteFrameName("word_lock_old_01.png")

				var_4_20:setPosition(ccp(var_4_13, var_4_14))
				arg_4_0.cityBatchNode:addChild(var_4_20, 115)
			end

			local var_4_21 = CCSprite:createWithSpriteFrameName("yzxms_icon_mz_c.png")

			var_4_21:setPosition(ccp(var_4_13, var_4_14 + 50))
			arg_4_0.cityBatchNode:addChild(var_4_21, 116)

			local var_4_22 = CCSprite:createWithSpriteFrameName("yzxms_word_yzmz.png")

			var_4_22:setPosition(ccp(var_4_13, var_4_14 + 20))
			arg_4_0.cityBatchNode:addChild(var_4_22, 117)

			local var_4_23 = CCArray:create()

			var_4_23:addObject(CCFadeIn:create(0.5))
			var_4_23:addObject(CCFadeOut:create(0.5))

			local var_4_24 = CCSequence:create(var_4_23)

			var_4_21:runAction(CCRepeatForever:create(var_4_24))
		end
	end

	arg_4_0.effectLayer = var_0_1.new(arg_4_0.world, arg_4_0)

	arg_4_0:addChild(arg_4_0.effectLayer, 100)
	arg_4_0:handlerMinBlood()

	if user.kfworldCityId then
		performWithDelay(arg_4_0, function()
			arg_4_0:moveTo(user.kfworldCityId, true)

			user.kfworldCityId = nil
		end, 0.3)
	end
end

local var_0_6 = {
	"flag_wei.png",
	"flag_shu.png",
	"flag_wu.png",
	"flag_yuan.png",
	[1003] = "flag_yuan.png",
	[1001] = "flag_yuan.png",
	[1002] = "flag_yuan.png"
}

function var_0_0.handlerGetWorldMapAction(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.data = arg_10_1.data

	if arg_10_2 and arg_10_2 == true then
		log.info("不需要更新generalMoveLayer")
	else
		if arg_10_0.generalMoveLayer and not tolua.isnull(arg_10_0.generalMoveLayer) then
			arg_10_0:removeChild(arg_10_0.generalMoveLayer, true)
		end

		arg_10_0.generalMoveLayer = require("lua/layer/world/generalMoveLayer").show()

		arg_10_0.worldLayer:addChild(arg_10_0.generalMoveLayer, 5)
	end

	arg_10_0.mainCityForce = {}

	arg_10_0:handlerMainCity()

	arg_10_0.world.cityTable = {}
	arg_10_0.world.cityForceTable = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.data.city) do
		arg_10_0:changeCity(iter_10_1)
	end

	if arg_10_0.data.sdCities and #arg_10_0.data.sdCities > 0 then
		for iter_10_2, iter_10_3 in ipairs(arg_10_0.data.sdCities) do
			arg_10_0:changeCity({
				isInSd = 1,
				id = iter_10_3
			})
		end
	end

	for iter_10_4, iter_10_5 in pairs(arg_10_1.data.changeRoad) do
		arg_10_0.hiddenRoad[iter_10_5.id].sprite:setVisible(iter_10_5.connect == 0)
	end

	arg_10_0.effectLayer:handlerGetWorldMapAction(arg_10_1)
end

function var_0_0.handlerGetSTaskInfoAction(arg_11_0, arg_11_1)
	arg_11_0.effectLayer:handlerGetSTaskInfoAction(arg_11_1, true)
end

function var_0_0.changeCity(arg_12_0, arg_12_1)
	if arg_12_0.world.cityTable then
		arg_12_0.world.cityTable[arg_12_1.id] = arg_12_1
	end

	if arg_12_0.warOptionTable and not arg_12_0.warOptionTable.isClosed and tonumber(arg_12_0.warOptionTable.cityId) == tonumber(arg_12_1.id) and arg_12_1.cityState and arg_12_1.cityState ~= 1 then
		arg_12_0.warOptionTable.optionClosed()
	end

	if not tolua.isnull(arg_12_0.cityWindow) and tonumber(arg_12_0.cityWindow:getCityId()) == tonumber(arg_12_1.id) then
		arg_12_0.cityWindow:changeCityState(arg_12_1.cityState)
	end

	local var_12_0 = arg_12_1.id
	local var_12_1 = arg_12_0.cityTable[var_12_0]

	if not var_12_1 then
		return
	end

	local var_12_2, var_12_3 = var_12_1.sprite:getPosition()

	if arg_12_1.cityState then
		var_12_1.cityState = arg_12_1.cityState

		if var_12_1.fireSprite and not tolua.isnull(var_12_1.fireSprite) then
			var_12_1.fireSprite:removeFromParentAndCleanup(true)

			var_12_1.fireSprite = nil
		end

		if arg_12_1.cityState == 1 then
			var_12_1.fireSprite = CCSprite:createWithSpriteFrameName("worldFire_00000.png")

			var_12_1.fireSprite:setPosition(ccp(var_12_2, var_12_3 + 40))

			local var_12_4 = CCArray:create()

			for iter_12_0 = 0, 4 do
				var_12_4:addObject(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("worldFire_0000" .. iter_12_0 .. ".png"))
			end

			local var_12_5 = CCAnimation:createWithSpriteFrames(var_12_4, 0.1)
			local var_12_6 = CCAnimate:create(var_12_5)
			local var_12_7 = CCRepeatForever:create(var_12_6)
			local var_12_8 = CCRepeatForever:create(var_12_7)

			var_12_1.fireSprite:runAction(var_12_8)
			arg_12_0.cityBatchNode:addChild(var_12_1.fireSprite, 113)
		end
	end

	if arg_12_1.force then
		local var_12_9 = var_12_1.flagSprite
		local var_12_10 = var_0_6[arg_12_1.force] or var_0_6[4]

		if MAP_DONGYING and arg_12_1.force ~= 1001 then
			var_12_10 = var_0_6[4]
		end

		if var_12_9 and not tolua.isnull(var_12_9) then
			var_12_9:setDisplayFrame(tool.spriteFrameByName(var_12_10))
		else
			local var_12_11 = CCSprite:createWithSpriteFrameName(var_12_10)

			var_12_11:setAnchorPoint(ccp(0.5, 0))
			var_12_11:setPosition(ccp(var_12_2 - 50, var_12_3 - 50 - 13))
			arg_12_0.cityBatchNode:addChild(var_12_11, 113)

			var_12_1.flagSprite = var_12_11
		end
	end

	if arg_12_1.enduranceState then
		arg_12_0:showEnduranceStatePic(arg_12_1.id, arg_12_1.enduranceState)
	end

	if arg_12_1.ruined then
		local var_12_12 = arg_12_0.cityTable[var_12_0].sprite
		local var_12_13
		local var_12_14 = worldConstant.BUILDING_INFO["world_building_" .. var_12_0].model

		var_12_14 = var_12_14 == "worldBuildingGuanqia1.png" and "worldBuildingTuCheng1.png" or var_12_14 == "worldBuildingGuanqia2.png" and "worldBuildingTuCheng2.png" or var_12_14 == "worldBuildingGuanqia3.png" and "worldBuildingTuCheng3.png" or "worldBuildingTuCheng4.png"

		var_12_12:setDisplayFrame(tool.spriteFrameByName(var_12_14))
	end
end

function var_0_0.worldSetOffset(arg_13_0, arg_13_1)
	arg_13_0:setContentOffset(arg_13_1)
end

function var_0_0.handlerMainCity(arg_14_0)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.data.crashedInfo) do
		if iter_14_1.crashedBy ~= 0 then
			local var_14_0 = var_0_4[iter_14_1.forceId]

			arg_14_0.mainCityForce[var_14_0] = iter_14_1.crashedBy
		end
	end
end

function var_0_0.handlerMinBlood(arg_15_0, arg_15_1)
	local var_15_0 = {
		123,
		19,
		207,
		105
	}

	local function var_15_1(arg_16_0)
		log.info("------------------")
		showTable(arg_16_0)

		local var_16_0 = arg_16_0.data

		arg_15_0.world.bloodTab = {}

		arg_15_0.minBloodLayer:removeAllChildrenWithCleanup(true)

		for iter_16_0 = 1, 4 do
			local var_16_1 = var_15_0[iter_16_0]
			local var_16_2, var_16_3 = arg_15_0.cityTable[var_16_1].sprite:getPosition()
			local var_16_4 = var_16_0["endurance" .. iter_16_0]

			arg_15_0.world.bloodTab[iter_16_0] = var_16_4

			if var_16_4 > 0 then
				local var_16_5 = CCSprite:create("ui/kfyz/jdtdi.png")

				var_16_5:setPosition(ccp(var_16_2, var_16_3 + 115))
				arg_15_0.minBloodLayer:addChild(var_16_5)

				local var_16_6 = CCProgressTimer:create(CCSprite:create("ui/kfyz/jdtdi_105.png"))

				var_16_6:setType(kCCProgressTimerTypeBar)
				var_16_6:setMidpoint(ccp(0, 0))
				var_16_6:setBarChangeRate(ccp(1, 0))
				var_16_6:setPercentage(var_16_4)
				var_16_6:setPosition(ccp(var_16_5:getContentSize().width / 2, var_16_5:getContentSize().height / 2))
				var_16_5:addChild(var_16_6)

				local var_16_7 = CCStrokeLabelTTF:create(language.get("hw_kfmg_000034", var_16_4, 100), "Thonburi", 20, 2, colorText[10005])

				var_16_7:setPosition(ccp(var_16_5:getContentSize().width / 2, var_16_5:getContentSize().height + 12))
				var_16_5:addChild(var_16_7)

				arg_15_0.minBloodLayer["process_" .. iter_16_0] = var_16_6
				arg_15_0.minBloodLayer["processLabel_" .. iter_16_0] = var_16_7
				arg_15_0.minBloodLayer["processBg_" .. iter_16_0] = var_16_5
			end

			local var_16_8 = var_16_0["jmlLastTime" .. iter_16_0]

			if var_16_8 > 0 then
				arg_15_0:showJmlPic(iter_16_0, var_16_8, var_16_2, var_16_3)
			end
		end
	end

	if arg_15_1 then
		local var_15_2 = arg_15_1.data.minChange

		for iter_15_0 = 1, 4 do
			local var_15_3 = var_15_2["endurance" .. iter_15_0]

			if not var_15_3 then
				break
			end

			local var_15_4 = arg_15_0.world.bloodTab[iter_15_0]

			if tonumber(var_15_3) < tonumber(var_15_4) then
				arg_15_0.minBloodLayer["process_" .. iter_15_0]:setPercentage(var_15_3)
				arg_15_0.minBloodLayer["processLabel_" .. iter_15_0]:setString(language.get("hw_kfmg_000034", var_15_3, 100))

				arg_15_0.world.bloodTab[iter_15_0] = var_15_3

				eventManager.dispatchEvent("updataEndurance")

				local var_15_5 = var_15_0[iter_15_0]
				local var_15_6, var_15_7 = arg_15_0.cityTable[var_15_5].sprite:getPosition()

				arg_15_0:bloodNumAction(var_15_6, var_15_7, var_15_4 - var_15_3)

				if var_15_3 <= 0 then
					performWithDelay(arg_15_0, function()
						arg_15_0.world:getWorldMap(true)
						arg_15_0:handlerMinBlood()
					end, 1.3)
				end
			end
		end

		for iter_15_1 = 1, 4 do
			if var_15_2["jmlLastTime" .. iter_15_1] then
				local var_15_8 = var_15_0[iter_15_1]
				local var_15_9, var_15_10 = arg_15_0.cityTable[var_15_8].sprite:getPosition()

				arg_15_0:showJmlPic(iter_15_1, var_15_2["jmlLastTime" .. iter_15_1], var_15_9, var_15_10)
			end
		end

		if var_15_2.damageForceId == kfworld.kfForceId then
			arg_15_0:showAttackInfo(var_15_2)
		end

		if var_15_2.showEnduranceState then
			if var_15_2.needPushCities then
				for iter_15_2, iter_15_3 in ipairs(var_15_2.needPushCities) do
					arg_15_0:showEnduranceStatePic(iter_15_3, var_15_2.showEnduranceState)
				end
			end

			if var_15_2.showEnduranceState == 4 then
				-- block empty
			end
		end
	else
		kfcmgr.sendRequest(var_15_1, actions.getSTaskInfo)
	end
end

function var_0_0.showFailure(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.failForce
	local var_18_1

	if var_18_0 < 4 and var_18_0 == kfworld.kfForceId then
		if var_18_0 == 1001 then
			var_18_1 = 180
		else
			var_18_1 = 181
		end
	elseif kfworld.kfForceId == 1001 then
		var_18_1 = 182
	elseif var_18_0 == 1001 then
		var_18_1 = 183
	elseif var_18_0 == 1 then
		var_18_1 = 184
	elseif var_18_0 == 2 then
		var_18_1 = 185
	elseif var_18_0 == 3 then
		var_18_1 = 186
	end

	local var_18_2 = var_0_4[var_18_0]

	performWithDelay(arg_18_0.minBloodLayer, function()
		roleDialogue.control.insert_loadSpeak(var_18_1)
	end, 0.5)
	arg_18_0.minBloodLayer["processBg_" .. forceId]:setVisible(false)
end

function var_0_0.showEnduranceStatePic(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = ({
		nil,
		"hufen",
		"jinweijun",
		"liubi"
	})[arg_20_2]
	local var_20_1 = arg_20_0.cityTable[arg_20_1]

	if var_20_0 and var_20_1 then
		if not tolua.isnull(arg_20_0.enduranceStateLayer.armsTab[arg_20_1]) then
			arg_20_0.enduranceStateLayer.armsTab[arg_20_1]:removeFromParentAndCleanup(true)
		end

		local var_20_2, var_20_3 = var_20_1.sprite:getPosition()
		local var_20_4 = CCSprite:create("ui/world/move_por_move_view.png")

		var_20_4:setPosition(ccp(var_20_2, var_20_3 + 100))

		local var_20_5 = require("lua/component/CircleSprite").new(var_20_0)

		var_20_5:setPosition(ccp(var_20_4:getContentSize().width / 2, var_20_4:getContentSize().height / 2))

		local var_20_6
		local var_20_7 = 35

		if arg_20_2 == 2 then
			var_20_6 = CCSprite:createWithSpriteFrameName("res_icon_exp.png")
		elseif arg_20_2 == 3 then
			var_20_6 = CCSprite:createWithSpriteFrameName("res_icon_exp.png")
		end

		if var_20_6 then
			var_20_6:setScale(0.6)
			var_20_6:setPosition(var_20_4:getContentSize().width - var_20_6:getContentSize().width / 2 + 25, var_20_6:getContentSize().height / 2 - var_20_7)
			var_20_4:addChild(var_20_6, 2)
		end

		var_20_4:addChild(var_20_5, 1)
		arg_20_0.enduranceStateLayer:addChild(var_20_4)

		arg_20_0.enduranceStateLayer.armsTab[arg_20_1] = var_20_4
	end
end

function var_0_0.showKfAutoBattleEffect(arg_21_0)
	if not tolua.isnull(arg_21_0.enduranceStateLayer.kfAutoBattleEffect) then
		arg_21_0.enduranceStateLayer.kfAutoBattleEffect:removeFromParentAndCleanup(true)
	end

	if kfworld.inDeadFight and kfworld.kfAutoBattleCityId then
		local var_21_0, var_21_1 = arg_21_0.world.config:getCityPosition(kfworld.kfAutoBattleCityId)
		local var_21_2 = CCSprite:create("ui/world/autoBattle/zdgz_city_xz.png")

		var_21_2:setPosition(ccp(var_21_0, var_21_1))
		arg_21_0.enduranceStateLayer:addChild(var_21_2, 1)

		arg_21_0.enduranceStateLayer.kfAutoBattleEffect = var_21_2
	end
end

function var_0_0.showAttackInfo(arg_22_0, arg_22_1)
	local var_22_0 = {
		name = "sequence",
		actions = {
			{
				isEaseBackInOut = true,
				name = "moveTo",
				duration = 0.8,
				position = ccp(120, visibleSize.height - 185)
			}
		}
	}
	local var_22_1 = tool.loadActionByTable(var_22_0)
	local var_22_2 = CCLayerColor:create(ccc4(255, 255, 255, 0))
	local var_22_3 = {}
	local var_22_4 = CCSprite:create("ui/kfyz/showInfo.png")

	var_22_4:setPosition(ccp(-240, visibleSize.height - 185))
	var_22_2:addChild(var_22_4)

	local var_22_5 = {
		language.get(91009),
		language.get(91010),
		language.get(91011),
		language.get(420002),
		[1001] = language.get(420002)
	}
	local var_22_6 = CCStrokeLabelTTF:create(var_22_5[arg_22_1.attackForce], "Thonburi", 20, 2, colorText[10005])

	var_22_6:setColor(colorForce[arg_22_1.attackForce])

	local var_22_7 = CCStrokeLabelTTF:create(arg_22_1.attackPlayerName .. language.get("hw_kfmg_000035"), "Thonburi", 20, 2, colorText[10005])
	local var_22_8 = CCStrokeLabelTTF:create(arg_22_1.GName, "Thonburi", 20, 2, colorText[10005])

	var_22_8:setColor(colorQuality[arg_22_1.GQuality])

	local var_22_9 = createRichNode({
		var_22_6,
		var_22_7,
		var_22_8
	}, 0.5)

	var_22_9:setPosition(ccp(113, 43))
	var_22_4:addChild(var_22_9)

	local var_22_10 = CCStrokeLabelTTF:create(language.get("hw_kfmg_000036"), "Thonburi", 20, 2, colorText[10005])

	var_22_10:setPosition(ccp(116, 17))
	var_22_10:setColor(colorText.TJ_Yellow)
	var_22_4:addChild(var_22_10)
	var_22_4:runAction(var_22_1)
	var_22_2:registerScriptTouchHandler(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			return true
		elseif arg_23_0 == CCTOUCHMOVED then
			return true
		elseif arg_23_0 == CCTOUCHENDED then
			return true
		end
	end, false, false)
	var_22_2:setTouchEnabled(true)
	smgr.getLayer("pushLayer"):addChild(var_22_2, 100)

	arg_22_0.mask = var_22_2

	local var_22_11 = {
		name = "sequence",
		actions = {
			{
				duration = 2,
				name = "delay"
			},
			{
				isEaseBackInOut = true,
				name = "moveTo",
				duration = 0.5,
				position = ccp(-130, visibleSize.height - 185)
			},
			{
				name = "callFunc",
				func = function()
					var_22_2:removeFromParentAndCleanup(true)
				end
			}
		}
	}
	local var_22_12 = tool.loadActionByTable(var_22_11)

	var_22_4:runAction(var_22_12)
end

function var_0_0.bloodNumAction(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = CCStrokeLabelTTF:create(-arg_25_3, "Thonburi", 24, 2, colorText[10005])

	var_25_0:setColor(colorText.TJ_Red)
	var_25_0:setPosition(ccp(arg_25_1 + 90, arg_25_2 + 115))
	arg_25_0.minBloodLayer:addChild(var_25_0, 10)

	local var_25_1 = CCArray:create()

	var_25_1:addObject(CCMoveTo:create(0.5, ccp(arg_25_1 + 90, arg_25_2 + 115 - 45)))
	var_25_1:addObject(CCCallFuncN:create(function()
		var_25_0:removeFromParentAndCleanup(true)
	end))
	var_25_0:runAction(CCSequence:create(var_25_1))
end

function var_0_0.showJmlPic(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	local function var_27_0()
		if not tolua.isnull(arg_27_0.minBloodLayer["jmlPicBg_" .. arg_27_1]) then
			arg_27_0.minBloodLayer["jmlPicBg_" .. arg_27_1]:removeFromParentAndCleanup(true)
		end
	end

	var_27_0()

	local var_27_1 = CCSprite:create(picQualityFrame[7])

	var_27_1:setPosition(ccp(arg_27_3 - 100, arg_27_4 + 125))
	var_27_1:setScale(0.45)
	arg_27_0.minBloodLayer:addChild(var_27_1)

	local var_27_2 = var_27_1:getContentSize()
	local var_27_3 = CCSprite:create("ui/kfyz/junku/icon_fhd.png")

	var_27_3:setPosition(ccp(var_27_2.width / 2, var_27_2.height / 2))
	var_27_1:addChild(var_27_3)

	local var_27_4 = createTimerLabel(arg_27_2, "@M:@S", "Thonburi", 40, var_27_0, nil, nil, colorText.TJ_Green)

	var_27_4:setPosition(ccp(var_27_3:getContentSize().width / 2, -20))
	var_27_3:addChild(var_27_4)

	arg_27_0.minBloodLayer["jmlPicBg_" .. arg_27_1] = var_27_1
end

function var_0_0.showTipSpriteText(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_1 then
		arg_29_0.minBloodLayer:addChild(arg_29_1)
		arg_29_1:setScale(0.5)

		local function var_29_0()
			arg_29_0.minBloodLayer:removeChild(arg_29_1, true)

			if arg_29_2 then
				arg_29_2()
			end
		end

		local var_29_1 = {
			name = "sequence",
			actions = {
				{
					name = "spawn",
					actions = {
						{
							isEaseBackOut = true,
							name = "moveBy",
							duration = 0.4,
							position = ccp(0, 85)
						},
						{
							isEaseBackOut = true,
							name = "scaleTo",
							scale = 1,
							duration = 0.3
						}
					}
				},
				{
					duration = 0.8,
					name = "delay"
				},
				{
					name = "callFunc",
					func = var_29_0
				}
			}
		}
		local var_29_2 = tool.loadActionByTable(var_29_1)

		arg_29_1:runAction(var_29_2)
	end
end

function var_0_0.setUiElementVisible(arg_31_0, arg_31_1)
	smgr.getLayer("uiLayer"):setVisible(arg_31_1)
	arg_31_0.world.menuLayer:setVisible(arg_31_1)
	arg_31_0.world.playerInfoLayer:setVisible(arg_31_1)
	arg_31_0.world.thumbnail:setVisible(arg_31_1)
end

function var_0_0.getCitiesInScreen(arg_32_0)
	local var_32_0 = {}
	local var_32_1 = CCRect:new(0, 0, visibleSize.width, visibleSize.height)

	for iter_32_0, iter_32_1 in pairs(arg_32_0.cityTable) do
		local var_32_2, var_32_3 = tool.getPositionInScreen(iter_32_1.sprite)

		if var_32_1:containsPoint(ccp(var_32_2, var_32_3)) then
			var_32_0[#var_32_0 + 1] = iter_32_1
		end
	end

	return var_32_0
end

function var_0_0.checkIfOnCity(arg_33_0, arg_33_1, arg_33_2)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.cityTable) do
		if tool.checkIfTouch(iter_33_1.sprite, arg_33_1, arg_33_2) then
			if smgr.currentSceneTag == SCENE_KFEXPEDITION and (iter_33_0 == 250 or iter_33_0 == 251 or iter_33_0 == 252) then
				return false
			end

			return iter_33_1
		end
	end

	return false
end

function var_0_0.getNeighborCities(arg_34_0, arg_34_1)
	local var_34_0 = {}

	if arg_34_0.citiesMatrix[tonumber(arg_34_1)] then
		for iter_34_0, iter_34_1 in pairs(arg_34_0.citiesMatrix[tonumber(arg_34_1)]) do
			local var_34_1 = arg_34_0.cityTable[iter_34_0]

			if var_34_1 and iter_34_1 then
				var_34_0[tonumber(iter_34_0)] = var_34_1
			end
		end
	end

	return var_34_0
end

function var_0_0.isCityOnFire(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.cityTable[arg_35_1]

	if var_35_0 and not tolua.isnull(var_35_0.fireSprite) and tonumber(var_35_0.cityState) == 1 then
		return true
	else
		return false
	end
end

function var_0_0.getCityInfo(arg_36_0, arg_36_1)
	return arg_36_0.cityTable[arg_36_1]
end

function var_0_0.onTouch(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if arg_37_1 == CCTOUCHBEGAN then
		arg_37_0.isMoved = false
		arg_37_0.moveBeginOffset = ccp(arg_37_2, arg_37_3)
		arg_37_0.currentTouchedCity = nil
		arg_37_0.currentTouchedCityId = nil

		if not eventManager.dispatchEvent("cityWindowIsTouchOn", arg_37_2, arg_37_3) then
			arg_37_0:setUiElementVisible(true)
		end

		for iter_37_0, iter_37_1 in pairs(arg_37_0.cityTable) do
			if tool.checkIfTouch(iter_37_1.sprite, arg_37_2, arg_37_3) then
				amgr.playEffect(enumAudioFile.ui_click_building)

				arg_37_0.currentTouchedCity = iter_37_1
				arg_37_0.currentTouchedCityId = iter_37_0
			end
		end

		return true
	elseif arg_37_1 == CCTOUCHMOVED then
		if not arg_37_0.isMoved and arg_37_0.moveBeginOffset and (math.abs(arg_37_0.moveBeginOffset.x - arg_37_2) > 30 or math.abs(arg_37_0.moveBeginOffset.y - arg_37_3) > 30) then
			arg_37_0.isMoved = true

			local var_37_0 = arg_37_0.currentTouchedCity

			if var_37_0 then
				var_37_0.sprite:setScale(1)

				arg_37_0.currentTouchedCity = nil
				arg_37_0.currentTouchedCityId = nil
			end

			arg_37_0:setUiElementVisible(false)
		end
	elseif arg_37_1 == CCTOUCHENDED then
		local var_37_1 = ccpDistance(arg_37_0.moveBeginOffset, ccp(arg_37_2, arg_37_3))

		if not eventManager.dispatchEvent("cityWindowIsTouchOn", arg_37_2, arg_37_3) then
			arg_37_0:setUiElementVisible(true)
		end

		if var_37_1 > 20 then
			kfworld.memoryLocation = arg_37_0:getContentOffset()

			return
		end

		local var_37_2 = eventManager.dispatchEvent("cityWindowIsOpen")

		for iter_37_2, iter_37_3 in pairs(arg_37_0.cityTable) do
			if arg_37_0.warOptionTable and not arg_37_0.warOptionTable.isClosed and tool.checkIfTouch(iter_37_3.sprite, arg_37_2, arg_37_3) then
				arg_37_0.warOptionTable.doWarAction(iter_37_2)

				return
			end

			if not var_37_2 and tool.checkIfTouch(iter_37_3.sprite, arg_37_2, arg_37_3) and not var_0_3[iter_37_2] then
				local var_37_3 = var_0_2.new(iter_37_2)
				local var_37_4, var_37_5 = arg_37_0.cityTable[iter_37_2].sprite:getPosition()

				var_37_3:setPosition(ccp(var_37_4, var_37_5))
				arg_37_0:addChild(var_37_3, 101)

				return
			end

			if not tolua.isnull(iter_37_3.eventSprite) and tool.checkIfTouch(iter_37_3.eventSprite, arg_37_2, arg_37_3) and arg_37_0.cityEventTable[iter_37_2] then
				arg_37_0:showEvent(arg_37_0.cityEventTable[iter_37_2], iter_37_2)

				return
			end
		end
	end
end

function var_0_0.getCitySprite(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.cityTable[arg_38_1]

	if var_38_0 then
		return var_38_0.sprite
	end
end

function var_0_0.generalMove(arg_39_0, arg_39_1)
	if arg_39_1.cityList then
		if not kfworld.tempCityList then
			kfworld.tempCityList = {}
		end

		kfworld.tempCityList["id_" .. tostring(arg_39_1.gid)] = arg_39_1.cityList
	end

	if arg_39_1.fromCity ~= arg_39_1.toCity then
		if not arg_39_1.path and kfworld and kfworld.tempCityList and kfworld.tempCityList["id_" .. arg_39_1.gid] then
			local var_39_0 = {}

			for iter_39_0 = #kfworld.tempCityList["id_" .. arg_39_1.gid], 1, -1 do
				local var_39_1 = kfworld.tempCityList["id_" .. arg_39_1.gid][iter_39_0]

				table.insert(var_39_0, 1, var_39_1)

				if tostring(var_39_1.id) == tostring(arg_39_1.fromCity) then
					break
				end
			end

			arg_39_1.path = var_39_0
		end

		if arg_39_1.path ~= nil and not arg_39_1.atOnce then
			local var_39_2 = {}

			if eventManager.dispatchEvent("KfworldGetGenerals")[arg_39_1.gid] then
				var_39_2[#var_39_2 + 1] = arg_39_1.fromCity
			end

			for iter_39_1, iter_39_2 in ipairs(arg_39_1.path) do
				var_39_2[#var_39_2 + 1] = tonumber(iter_39_2.id)
			end

			local var_39_3 = smgr.getLayer("generalMoveLayer")

			if var_39_3 and not tolua.isnull(var_39_3) then
				traceData.createTrace(arg_39_1.gid, var_39_2)
			end
		end

		eventManager.dispatchEvent("generalMoveFromTo", arg_39_1.gid, arg_39_1.fromCity, arg_39_1.toCity, 2600, false)
	else
		eventManager.dispatchEvent("positionGeneral", arg_39_1.gid, arg_39_1.toCity)
	end
end

function var_0_0.handlerKfWorldMoveAction(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	local var_40_0 = {}
	local var_40_1
	local var_40_2 = eventManager.dispatchEvent("KfworldGetGenerals")

	log.info("==================generals==")
	showTable(var_40_2)

	for iter_40_0, iter_40_1 in pairs(var_40_2) do
		if iter_40_1.id == arg_40_1 and iter_40_1.kfCityId then
			var_40_0[#var_40_0 + 1] = iter_40_1.kfCityId

			local var_40_3 = iter_40_1.kfCityId
		end
	end

	if arg_40_3.data.cityList == nil then
		return
	end

	for iter_40_2, iter_40_3 in pairs(arg_40_3.data.cityList) do
		var_40_0[#var_40_0 + 1] = tonumber(iter_40_3.id)
	end

	if smgr.getLayer("generalMoveLayer") ~= nil then
		traceData.createTrace(arg_40_1, var_40_0)
	end

	log.info("general move from to  :", arg_40_1, var_40_0[1], var_40_0[2])
	eventManager.dispatchEvent("generalMoveFromTo", arg_40_1, var_40_0[1], var_40_0[2], 2600, false)
end

function var_0_0.handlerCallGeneralAction(arg_41_0, arg_41_1)
	for iter_41_0, iter_41_1 in pairs(arg_41_1.data) do
		local var_41_0 = {}
		local var_41_1
		local var_41_2 = eventManager.dispatchEvent("KfworldGetGenerals")

		for iter_41_2, iter_41_3 in pairs(var_41_2) do
			if tonumber(iter_41_3.id) == tonumber(iter_41_0) and iter_41_3.kfCityId then
				var_41_0[#var_41_0 + 1] = iter_41_3.kfCityId

				local var_41_3 = iter_41_3.kfCityId
			end
		end

		if type(iter_41_1) ~= "table" then
			smgr.showTipText(iter_41_1)

			return
		end

		for iter_41_4, iter_41_5 in pairs(iter_41_1) do
			var_41_0[#var_41_0 + 1] = tonumber(iter_41_5.id)
		end

		if smgr.getLayer("generalMoveLayer") ~= nil then
			traceData.createTrace(iter_41_0, var_41_0)
		end

		log.info("general move from to  :", iter_41_0, var_41_0[1], var_41_0[2])
		eventManager.dispatchEvent("generalMoveFromTo", iter_41_0, var_41_0[1], var_41_0[2], 2600, false)
	end
end

function var_0_0.moveTo(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	arg_42_1 = tonumber(arg_42_1)
	arg_42_2 = arg_42_2 or false
	arg_42_3 = arg_42_3 or false

	if arg_42_3 and kfworld.memoryLocation then
		arg_42_0:setContentOffset(kfworld.memoryLocation)

		return
	end

	local var_42_0 = arg_42_0.cityTable[arg_42_1]

	if var_42_0 == nil then
		return
	end

	local var_42_1 = var_42_0.sprite
	local var_42_2 = var_42_1:getContentSize()
	local var_42_3, var_42_4 = var_42_1:getPosition()
	local var_42_5 = arg_42_0.mapInfo
	local var_42_6 = var_42_5.column * var_42_5.width
	local var_42_7 = var_42_5.row * var_42_5.height

	if var_42_3 < visibleSize.width / 2 then
		var_42_3 = visibleSize.width / 2
	end

	if var_42_3 > var_42_6 - visibleSize.width / 2 then
		var_42_3 = var_42_6 - visibleSize.width / 2
	end

	if var_42_4 < visibleSize.height / 2 then
		var_42_4 = visibleSize.height / 2
	end

	if var_42_4 > var_42_7 - visibleSize.height / 2 then
		var_42_4 = var_42_7 - visibleSize.height / 2
	end

	if arg_42_2 then
		arg_42_4 = arg_42_4 or 0.15

		arg_42_0:setContentOffsetInDuration(ccp(-var_42_3 + visibleSize.width / 2, -var_42_4 + visibleSize.height / 2), arg_42_4)
	else
		arg_42_0:setContentOffset(ccp(-var_42_3 + visibleSize.width / 2, -var_42_4 + visibleSize.height / 2), arg_42_2)
	end

	kfworld.memoryLocation = ccp(-var_42_3 + visibleSize.width / 2, -var_42_4 + visibleSize.height / 2)
end

function var_0_0.moveWorldMapTo(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	log.info("moveWorldMapTo x = %s,y = %s", arg_43_1, arg_43_2)

	local var_43_0 = -arg_43_1 + visibleSize.width / 2
	local var_43_1 = -arg_43_2 + visibleSize.height / 2
	local var_43_2 = -6000 + visibleSize.width
	local var_43_3 = -3600 + visibleSize.height
	local var_43_4 = 0
	local var_43_5 = 0

	if var_43_0 < var_43_2 then
		var_43_0 = var_43_2
	end

	if var_43_4 < var_43_0 then
		var_43_0 = var_43_4
	end

	if var_43_1 < var_43_3 then
		var_43_1 = var_43_3
	end

	if var_43_5 < var_43_1 then
		var_43_1 = var_43_5
	end

	arg_43_0:unscheduleAllSelectors()

	if arg_43_3 then
		arg_43_0:setContentOffsetInDuration(ccp(var_43_0, var_43_1), 0.2)
	else
		arg_43_0:setContentOffset(ccp(var_43_0, var_43_1), false)
	end
end

function var_0_0.loadMapWithPosition(arg_44_0, arg_44_1, arg_44_2)
	log.info("call kfyzWorld loadMapWithPosition x0 = %s,y0 = %s", arg_44_1, arg_44_2)
	arg_44_0:stopAllActions()
	performWithDelay(arg_44_0, function()
		log.info("kfmgMapLayer:loadMapWithPosition begin")

		arg_44_0.mapTable = arg_44_0.mapTable or {}
		arg_44_1 = -arg_44_1
		arg_44_2 = -arg_44_2

		local var_45_0 = CCRectMake(arg_44_1, arg_44_2, visibleSize.width, visibleSize.height)

		for iter_45_0 = 1, 6 do
			for iter_45_1 = 1, 6 do
				local var_45_1 = 7 - iter_45_1
				local var_45_2 = CCRectMake((iter_45_0 - 1) * 1000, (iter_45_1 - 1) * 600, 1000, 600)

				if var_45_0:intersectsRect(var_45_2) and tolua.isnull(arg_44_0.mapTable[string.format("block%s_%s", iter_45_0, var_45_1)]) then
					log.info("CCSprite create x = %s,ly = %s", iter_45_0, var_45_1)

					local var_45_3 = CCSprite:create("res/tiledmap/" .. var_0_5[iter_45_0][var_45_1])

					var_45_3:setPosition(ccp((iter_45_0 - 1) * 1000 + 500, (iter_45_1 - 1) * 600 + 300))
					arg_44_0.worldLayer:addChild(var_45_3)

					arg_44_0.mapTable[string.format("block%s_%s", iter_45_0, var_45_1)] = var_45_3

					local function var_45_4(arg_46_0)
						local var_46_0 = 0

						for iter_46_0, iter_46_1 in pairs(arg_46_0) do
							var_46_0 = var_46_0 + 1
						end

						return var_46_0
					end

					log.info("载入地图 %s %s #length#%s", iter_45_0, var_45_1, var_45_4(arg_44_0.mapTable))
				end
			end
		end

		log.info("kfmgMapLayer:loadMapWithPosition finish")
	end, 0.02)
end

function var_0_0.showGroupCommand(arg_47_0)
	local function var_47_0(arg_48_0)
		log.info("===========showGroupCommand")
		showTable(arg_48_0)

		if arg_48_0.action.state == 1 then
			eventManager.dispatchEvent("addKfWorldGroup", arg_48_0.action.data.groupInfo)
		end
	end

	cmgr.sendRequest(var_47_0, actions.getKCInfo, 1)
end

function var_0_0.addKfWorldGroup(arg_49_0, arg_49_1)
	for iter_49_0, iter_49_1 in pairs(arg_49_0.cityGroupCommand) do
		if not tolua.isnull(iter_49_1) then
			iter_49_1:removeFromParentAndCleanup(true)
		end
	end

	arg_49_0.cityGroupCommand = {}
	arg_49_0.world.thumbnailGroupIconTable = {}

	local var_49_0 = {}

	for iter_49_2, iter_49_3 in ipairs(arg_49_1) do
		if iter_49_3.cityId then
			if not var_49_0[iter_49_3.cityId] then
				var_49_0[iter_49_3.cityId] = {}
			end

			table.insert(var_49_0[iter_49_3.cityId], iter_49_3.groupId)
		end
	end

	local var_49_1 = user.groupInfo.belongTeam

	for iter_49_4, iter_49_5 in pairs(var_49_0) do
		local var_49_2 = iter_49_4
		local var_49_3, var_49_4 = arg_49_0.cityTable[var_49_2].sprite:getPosition()
		local var_49_5 = tool.getTableSize(iter_49_5)
		local var_49_6
		local var_49_7 = {}
		local var_49_8 = false

		for iter_49_6, iter_49_7 in ipairs(iter_49_5) do
			if var_49_1 > 0 and iter_49_7 == var_49_1 then
				var_49_8 = true
			else
				table.insert(var_49_7, iter_49_7)
			end
		end

		if var_49_8 and var_49_1 > 0 then
			var_49_6 = tool.toint(#var_49_7 / 2) + 1

			table.insert(var_49_7, var_49_6, var_49_1)

			arg_49_0.world.thumbnailGroupIconTable["city_" .. var_49_2] = 101
		end

		local var_49_9 = 100
		local var_49_10 = 64 * var_49_5 - (var_49_5 - 1) * 20 * 1.5
		local var_49_11 = var_49_6 and 70 or 55
		local var_49_12 = CCScale9Sprite:createWithSpriteFrameName("groupCommandBg.png", CCRectMake(20, 5, 99, 24))

		var_49_12:setPreferredSize(CCSizeMake(var_49_10, var_49_11))
		var_49_12:setPosition(ccp(var_49_3, var_49_4 + var_49_9))
		var_49_12:setVertexZ(50)
		arg_49_0.groupLayer:addChild(var_49_12, 109)

		arg_49_0.cityGroupCommand["groupCommandBg_" .. iter_49_4] = var_49_12

		local var_49_13 = CCSprite:createWithSpriteFrameName("jiantou.png")

		var_49_13:setAnchorPoint(ccp(0.5, 1))
		var_49_13:setPosition(ccp(var_49_12:getContentSize().width / 2, 2.5))
		var_49_12:addChild(var_49_13)

		local var_49_14 = {}
		local var_49_15 = {}

		for iter_49_8, iter_49_9 in ipairs(var_49_7) do
			local var_49_16 = CCSprite:createWithSpriteFrameName("groupCommandIcon.png")

			table.insert(var_49_14, var_49_16)

			var_49_15["di_" .. iter_49_8] = var_49_16

			local var_49_17 = var_49_16:getContentSize()
			local var_49_18 = CCLabelAtlas:create(iter_49_9, "ui/common/number/juntuan_number_plus.png", 20, 22, 48)

			var_49_18:setAnchorPoint(ccp(0.5, 0.5))
			var_49_18:setPosition(ccp(var_49_17.width / 2, var_49_17.height / 2 + 4))
			var_49_16:addChild(var_49_18)
		end

		local var_49_19 = createSizeRichNode(var_49_14, 0.5, nil, -20)

		var_49_19:setAnchorPoint(ccp(0.5, 0))
		var_49_19:setPosition(ccp(var_49_12:getContentSize().width / 2, 25))
		var_49_19:setScale(0.65)
		var_49_12:addChild(var_49_19)

		if var_49_6 then
			for iter_49_10, iter_49_11 in ipairs(var_49_7) do
				if iter_49_10 == var_49_6 then
					var_49_15["di_" .. iter_49_10]:setScale(1.6)
					var_49_15["di_" .. iter_49_10]:setPositionY(7)
					var_49_15["di_" .. iter_49_10]:setZOrder(2)
				else
					var_49_15["di_" .. iter_49_10]:setZOrder(1)

					if iter_49_10 < var_49_6 then
						local var_49_20, var_49_21 = var_49_15["di_" .. iter_49_10]:getPosition()

						var_49_15["di_" .. iter_49_10]:setPositionX(var_49_20 - 10)
					elseif var_49_6 < iter_49_10 then
						local var_49_22, var_49_23 = var_49_15["di_" .. iter_49_10]:getPosition()

						var_49_15["di_" .. iter_49_10]:setPositionX(var_49_22 + 10)
					end
				end
			end
		end
	end
end

function var_0_0.onEnter(arg_50_0)
	smgr.registerLayer(arg_50_0, "mapLayer")

	function arg_50_0.eventRef(arg_51_0)
		return arg_50_0:getCitySprite(arg_51_0)
	end

	function arg_50_0.callGeneralRef(arg_52_0)
		arg_50_0:handlerCallGeneralAction(arg_52_0)
	end

	function arg_50_0.moveWorldMapToRef(arg_53_0, arg_53_1, arg_53_2)
		arg_50_0:moveWorldMapTo(arg_53_0, arg_53_1, arg_53_2)
	end

	arg_50_0.moveToCityRef = handler(arg_50_0, arg_50_0.moveTo)

	eventManager.registerEvent("handlerCallGeneralAction", arg_50_0.callGeneralRef)
	eventManager.registerEvent("KfworldGetCitySprite", arg_50_0.eventRef)
	eventManager.registerEvent("moveToCity", arg_50_0.moveToCityRef)

	arg_50_0.showKfWorldUiElement = handler(arg_50_0, arg_50_0.setUiElementVisible)

	eventManager.registerEvent("showKfWorldUiElement", arg_50_0.showKfWorldUiElement)
	eventManager.registerEvent("moveWorldMapTo", arg_50_0.moveWorldMapToRef)

	arg_50_0.checkIfOnCityRef = handler(arg_50_0, arg_50_0.checkIfOnCity)

	eventManager.registerEvent("checkIfOnCity", arg_50_0.checkIfOnCityRef)

	arg_50_0.getCitiesInScreenRef = handler(arg_50_0, arg_50_0.getCitiesInScreen)

	eventManager.registerEvent("getCitiesInScreen", arg_50_0.getCitiesInScreenRef)

	arg_50_0.getNeighborCitiesRef = handler(arg_50_0, arg_50_0.getNeighborCities)

	eventManager.registerEvent("getNeighborCities", arg_50_0.getNeighborCitiesRef)

	arg_50_0.isCityOnFireRef = handler(arg_50_0, arg_50_0.isCityOnFire)

	eventManager.registerEvent("isCityOnFire", arg_50_0.isCityOnFireRef)

	arg_50_0.getCityInfoRef = handler(arg_50_0, arg_50_0.getCityInfo)

	eventManager.registerEvent("getCityInfo", arg_50_0.getCityInfoRef)

	arg_50_0.addKfWorldGroupRef = handler(arg_50_0, arg_50_0.addKfWorldGroup)

	eventManager.registerEvent("addKfWorldGroup", arg_50_0.addKfWorldGroupRef)

	arg_50_0.worldSetOffsetRef = handler(arg_50_0, arg_50_0.worldSetOffset)

	eventManager.registerEvent("worldSetOffet", arg_50_0.worldSetOffsetRef)
end

function var_0_0.onExit(arg_54_0)
	smgr.unregisterLayer("mapLayer")
	smgr.getLayer("uiLayer"):setVisible(true)
	eventManager.unregisterEvent("handlerCallGeneralAction", arg_54_0.callGeneralRef)
	eventManager.unregisterEvent("KfworldGetCitySprite", arg_54_0.eventRef)
	eventManager.unregisterEvent("moveToCity", arg_54_0.moveToCityRef)
	eventManager.unregisterEvent("showKfWorldUiElement", arg_54_0.showKfWorldUiElement)
	eventManager.unregisterEvent("checkIfOnCity", arg_54_0.checkIfOnCityRef)
	eventManager.unregisterEvent("getCitiesInScreen", arg_54_0.getCitiesInScreenRef)
	eventManager.unregisterEvent("getNeighborCities", arg_54_0.getNeighborCitiesRef)
	eventManager.unregisterEvent("isCityOnFire", arg_54_0.isCityOnFireRef)
	eventManager.unregisterEvent("getCityInfo", arg_54_0.getCityInfoRef)
	eventManager.unregisterEvent("moveWorldMapTo", arg_54_0.moveWorldMapToRef)
	eventManager.unregisterEvent("addKfWorldGroup", arg_54_0.addKfWorldGroupRef)
	eventManager.unregisterEvent("worldSetOffet", arg_54_0.worldSetOffsetRef)

	for iter_54_0, iter_54_1 in pairs(tolua.getpeer(arg_54_0)) do
		arg_54_0[iter_54_0] = nil
	end
end

return var_0_0
