local var_0_0 = class("KfMapLayer", function()
	return CCScrollView:create(visibleSize)
end)
local var_0_1 = require("lua/layer/kfworld/EffectLayer")
local var_0_2 = require("lua/layer/world/cityWindow2/ui")

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.world = arg_2_1

	arg_2_0:init()
end

function var_0_0.init(arg_3_0)
	local var_3_0 = arg_3_0.world.config:getMap()
	local var_3_1 = var_3_0.column * var_3_0.width
	local var_3_2 = var_3_0.row * var_3_0.height
	local var_3_3 = CCLayer:create()

	var_3_3:registerScriptHandler(function(arg_4_0)
		if arg_4_0 == "enter" then
			arg_3_0:onEnter()
		elseif arg_4_0 == "exit" then
			arg_3_0:onExit()
		end
	end)

	arg_3_0.worldLayer = var_3_3

	arg_3_0:setDirection(kCCScrollViewDirectionBoth)
	arg_3_0:setBounceable(false)
	arg_3_0:setPosition(ccp(0, 0))
	arg_3_0:setContentSize(CCSizeMake(var_3_1, var_3_2))
	var_3_3:setContentSize(CCSizeMake(var_3_1, var_3_2))
	arg_3_0:setContainer(var_3_3)
	arg_3_0.worldLayer:registerScriptTouchHandler(function(arg_5_0, arg_5_1, arg_5_2)
		return arg_3_0:onTouch(arg_5_0, arg_5_1, arg_5_2)
	end)
	arg_3_0.worldLayer:setTouchEnabled(true)

	if kfworld and kfworld.memoryLocation then
		arg_3_0:setContentOffset(kfworld.memoryLocation)
	end

	for iter_3_0 = 1, var_3_0.column do
		for iter_3_1 = 1, var_3_0.row do
			local var_3_4 = var_3_0.row + 1 - iter_3_1
			local var_3_5 = CCSprite:create("res/ui/kfworld/worldMap/" .. user.kfworldId .. "/block" .. iter_3_0 .. "_" .. var_3_4 .. ".jpg")

			var_3_5:setPosition(ccp((iter_3_0 - 1) * var_3_0.width + var_3_0.width / 2, (iter_3_1 - 1) * var_3_0.height + var_3_0.height / 2))
			var_3_3:addChild(var_3_5, 0)
		end
	end

	arg_3_0.cityNameBatchNode = CCSpriteBatchNode:create("res/ui/kfworld/kfWorldName.png")

	var_3_3:addChild(arg_3_0.cityNameBatchNode, 4)

	arg_3_0.cityBatchNode = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png")

	var_3_3:addChild(arg_3_0.cityBatchNode, 2)

	arg_3_0.cityFlagBatchNode = CCSpriteBatchNode:create("res/ui/juben/flag.png")

	var_3_3:addChild(arg_3_0.cityFlagBatchNode, 3)

	arg_3_0.cityTable = {}

	for iter_3_2, iter_3_3 in pairs(arg_3_0.world.config.city.cities) do
		local var_3_6 = arg_3_0.world.config:getCity(iter_3_2)

		if var_3_6 ~= nil then
			arg_3_0.cityTable[iter_3_2] = {}
			arg_3_0.cityTable[iter_3_2].sprite = CCSprite:createWithSpriteFrameName(var_3_6.model)

			local var_3_7 = arg_3_0.cityTable[iter_3_2].sprite
			local var_3_8 = var_3_7:getContentSize()
			local var_3_9 = var_3_6.x + var_3_8.width / 2
			local var_3_10 = var_3_2 - var_3_6.y - var_3_8.height / 2

			var_3_7:setPosition(ccp(var_3_9, var_3_10))
			arg_3_0.cityBatchNode:addChild(var_3_7, 0)

			local var_3_11 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

			var_3_11:setPosition(ccp(var_3_9, var_3_10 - 50))
			arg_3_0.cityBatchNode:addChild(var_3_11, 0)

			local var_3_12 = CCSprite:createWithSpriteFrameName(string.format("kf_%s.png", iter_3_2))

			var_3_12:setPosition(ccp(var_3_9, var_3_10 - 50))
			arg_3_0.cityNameBatchNode:addChild(var_3_12, 1)
		end
	end

	arg_3_0.hiddenRoad = {}

	local var_3_13 = {
		45,
		65
	}

	if user.kfworldId == 2 then
		for iter_3_4, iter_3_5 in pairs(var_3_13) do
			local var_3_14 = CCSprite:create("res/ui/kfworld/worldMap/2/hidden_" .. iter_3_5 .. ".jpg")
			local var_3_15 = arg_3_0.world.config:getHiddenRoad(iter_3_5)

			var_3_14:setPosition(var_3_15.x, var_3_15.y - var_3_14:getContentSize().height)
			arg_3_0:addChild(var_3_14, 1)

			arg_3_0.hiddenRoad[iter_3_5] = {}
			arg_3_0.hiddenRoad[iter_3_5].sprite = var_3_14
		end
	end

	arg_3_0.effectLayer = var_0_1.new(arg_3_0.world)

	arg_3_0:addChild(arg_3_0.effectLayer, 3)
end

local var_0_3 = {
	"jb_flag_shu.png",
	"jb_flag_wei.png",
	nil,
	"jb_flag_manzu.png"
}

function var_0_0.handlerGetWorldMapAction(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.world.matchState ~= 2 then
		return
	end

	arg_6_0.data = arg_6_1.data

	if arg_6_2 and arg_6_2 == true then
		log.info("不需要更新generalMoveLayer")
	else
		if arg_6_0.generalMoveLayer and not tolua.isnull(arg_6_0.generalMoveLayer) then
			arg_6_0:removeChild(arg_6_0.generalMoveLayer, true)
		end

		arg_6_0.generalMoveLayer = require("lua/layer/world/generalMoveLayer").show()

		arg_6_0.worldLayer:addChild(arg_6_0.generalMoveLayer, 5)
	end

	for iter_6_0, iter_6_1 in pairs(arg_6_0.data.city) do
		arg_6_0:changeCity(iter_6_1)
	end

	for iter_6_2, iter_6_3 in pairs(arg_6_1.data.changeRoad) do
		arg_6_0.hiddenRoad[iter_6_3.id].sprite:setVisible(iter_6_3.connect == 0)
	end

	if conf.language ~= "cn" then
		arg_6_0.effectLayer:handlerGetWorldMapActionInt(arg_6_1)
	else
		arg_6_0.effectLayer:handlerGetWorldMapAction(arg_6_1)
	end

	arg_6_0.effectLayer:handlerGetWorldMapAction(arg_6_1)
end

function var_0_0.changeCity(arg_7_0, arg_7_1)
	if arg_7_0.world.matchState ~= 2 then
		return
	end

	if arg_7_0.warOptionTable and not arg_7_0.warOptionTable.isClosed and tonumber(arg_7_0.warOptionTable.cityId) == tonumber(arg_7_1.id) and arg_7_1.cityState and arg_7_1.cityState ~= 1 then
		arg_7_0.warOptionTable.optionClosed()
	end

	local var_7_0 = arg_7_1.id
	local var_7_1 = arg_7_0.cityTable[var_7_0]

	if not var_7_1 then
		return
	end

	if arg_7_1.cityState then
		if var_7_1.fireSprite and not tolua.isnull(var_7_1.fireSprite) then
			var_7_1.fireSprite:removeFromParentAndCleanup(true)

			var_7_1.fireSprite = nil
		end

		if arg_7_1.cityState == 1 then
			var_7_1.fireSprite = CCSprite:createWithSpriteFrameName("worldFire_00000.png")

			local var_7_2, var_7_3 = var_7_1.sprite:getPosition()

			var_7_1.fireSprite:setPosition(ccp(var_7_2, var_7_3 + 40))

			local var_7_4 = CCArray:create()

			for iter_7_0 = 0, 4 do
				var_7_4:addObject(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("worldFire_0000" .. iter_7_0 .. ".png"))
			end

			local var_7_5 = CCAnimation:createWithSpriteFrames(var_7_4, 0.1)
			local var_7_6 = CCAnimate:create(var_7_5)
			local var_7_7 = CCRepeatForever:create(var_7_6)
			local var_7_8 = CCRepeatForever:create(var_7_7)

			var_7_1.fireSprite:runAction(var_7_8)
			arg_7_0.cityBatchNode:addChild(var_7_1.fireSprite, 2)
		end
	end

	if arg_7_1.force then
		if arg_7_0.cityTable[var_7_0].flagSprite and not tolua.isnull(arg_7_0.cityTable[var_7_0].flagSprite) then
			arg_7_0.cityTable[var_7_0].flagSprite:removeFromParentAndCleanup(true)
		end

		local var_7_9 = var_0_3[arg_7_1.force] or var_0_3[0]

		arg_7_0.cityTable[var_7_0].flagSprite = CCSprite:createWithSpriteFrameName(var_7_9)

		local var_7_10 = arg_7_0.cityTable[var_7_0].flagSprite
		local var_7_11 = arg_7_0.cityTable[var_7_0].sprite:getContentSize()
		local var_7_12 = arg_7_0.world.config:getMap()
		local var_7_13 = var_7_12.column * var_7_12.width
		local var_7_14 = var_7_12.row * var_7_12.height
		local var_7_15 = arg_7_0.world.config:getCity(var_7_0)
		local var_7_16 = var_7_15.x + var_7_11.width / 2
		local var_7_17 = var_7_14 - var_7_15.y - var_7_11.height / 2

		var_7_10:setPosition(ccp(var_7_16 - 50, var_7_17 - 50))
		arg_7_0.cityFlagBatchNode:addChild(var_7_10, 1)
	end
end

function var_0_0.onTouch(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_0.world.matchState ~= 2 then
		return true
	end

	if arg_8_1 == CCTOUCHBEGAN then
		log.info("(ox,oy)=(%s,%s)", arg_8_0:getContentOffset().x, arg_8_0:getContentOffset().y)
		log.info("(x,y)=(%s,%s)", arg_8_2, arg_8_3)

		return true
	elseif arg_8_1 == CCTOUCHMOVED then
		-- block empty
	elseif arg_8_1 == CCTOUCHENDED then
		local var_8_0 = eventManager.dispatchEvent("cityWindowIsOpen")

		for iter_8_0, iter_8_1 in pairs(arg_8_0.cityTable) do
			if arg_8_0.warOptionTable and not arg_8_0.warOptionTable.isClosed and tool.checkIfTouch(iter_8_1.sprite, arg_8_2, arg_8_3) then
				arg_8_0.warOptionTable.doWarAction(iter_8_0)

				return
			end

			if not var_8_0 and tool.checkIfTouch(iter_8_1.sprite, arg_8_2, arg_8_3) then
				local var_8_1 = var_0_2.new(iter_8_0)
				local var_8_2, var_8_3 = arg_8_0.cityTable[iter_8_0].sprite:getPosition()

				var_8_1:setPosition(ccp(var_8_2, var_8_3))
				arg_8_0:addChild(var_8_1, 5)

				return
			end
		end

		kfworld.memoryLocation = arg_8_0:getContentOffset()
	end
end

function var_0_0.getCitySprite(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.cityTable[arg_9_1]

	if var_9_0 then
		return var_9_0.sprite
	end
end

function var_0_0.generalMove(arg_10_0, arg_10_1)
	if arg_10_0.world.matchState ~= 2 then
		return
	end

	if arg_10_1.fromCity ~= arg_10_1.toCity then
		eventManager.dispatchEvent("generalMoveFromTo", arg_10_1.gid, arg_10_1.fromCity, arg_10_1.toCity, 4000, false)
	else
		eventManager.dispatchEvent("positionGeneral", arg_10_1.gid, arg_10_1.toCity)
	end
end

function var_0_0.updateTrick(arg_11_0, arg_11_1)
	if arg_11_0.world.matchState ~= 2 then
		return
	end

	arg_11_0.effectLayer:updateTrick(arg_11_1)
end

function var_0_0.handlerKfWorldMoveAction(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if arg_12_0.world.matchState ~= 2 then
		return
	end

	local var_12_0 = {}
	local var_12_1
	local var_12_2 = eventManager.dispatchEvent("KfworldGetGenerals")

	for iter_12_0, iter_12_1 in pairs(var_12_2) do
		if iter_12_1.id == arg_12_1 and iter_12_1.kfCityId then
			var_12_0[#var_12_0 + 1] = iter_12_1.kfCityId

			local var_12_3 = iter_12_1.kfCityId
		end
	end

	if arg_12_3.data.cityList == nil then
		return
	end

	for iter_12_2, iter_12_3 in pairs(arg_12_3.data.cityList) do
		var_12_0[#var_12_0 + 1] = tonumber(iter_12_3.id)
	end

	if smgr.getLayer("generalMoveLayer") ~= nil then
		traceData.createTrace(arg_12_1, var_12_0)
	end
end

function var_0_0.handlerCallGeneralAction(arg_13_0, arg_13_1)
	if arg_13_0.world.matchState ~= 2 then
		return
	end

	for iter_13_0, iter_13_1 in pairs(arg_13_1.data) do
		local var_13_0 = {}
		local var_13_1
		local var_13_2 = eventManager.dispatchEvent("KfworldGetGenerals")

		for iter_13_2, iter_13_3 in pairs(var_13_2) do
			if tonumber(iter_13_3.id) == tonumber(iter_13_0) and iter_13_3.kfCityId then
				var_13_0[#var_13_0 + 1] = iter_13_3.kfCityId

				local var_13_3 = iter_13_3.kfCityId
			end
		end

		if type(iter_13_1) ~= "table" then
			smgr.showTipText(iter_13_1)

			return
		end

		for iter_13_4, iter_13_5 in pairs(iter_13_1) do
			var_13_0[#var_13_0 + 1] = tonumber(iter_13_5.id)
		end

		if smgr.getLayer("generalMoveLayer") ~= nil then
			traceData.createTrace(iter_13_0, var_13_0)
		end
	end
end

function var_0_0.moveTo(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	arg_14_2 = arg_14_2 or false
	arg_14_3 = arg_14_3 or false

	if arg_14_3 and kfworld.memoryLocation then
		arg_14_0:setContentOffset(kfworld.memoryLocation)

		return
	end

	local var_14_0 = arg_14_0.cityTable[arg_14_1]

	if var_14_0 == nil then
		return
	end

	local var_14_1 = var_14_0.sprite
	local var_14_2 = var_14_1:getContentSize()
	local var_14_3, var_14_4 = var_14_1:getPosition()
	local var_14_5 = arg_14_0.world.config:getMap()
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
		arg_14_4 = arg_14_4 or 0.15

		arg_14_0:setContentOffsetInDuration(ccp(-var_14_3 + visibleSize.width / 2, -var_14_4 + visibleSize.height / 2), arg_14_4)
	else
		arg_14_0:setContentOffset(ccp(-var_14_3 + visibleSize.width / 2, -var_14_4 + visibleSize.height / 2), arg_14_2)
	end

	kfworld.memoryLocation = ccp(-var_14_3 + visibleSize.width / 2, -var_14_4 + visibleSize.height / 2)
end

function var_0_0.onBridgeConnectChange(arg_15_0, arg_15_1)
	log.info("MapLayer:onBridgeConnectChange(%s)", arg_15_1)

	for iter_15_0, iter_15_1 in pairs(arg_15_0.hiddenRoad) do
		iter_15_1.sprite:setVisible(arg_15_1 == 0)
	end
end

function var_0_0.onEnter(arg_16_0)
	function arg_16_0.eventRef(arg_17_0)
		return arg_16_0:getCitySprite(arg_17_0)
	end

	function arg_16_0.callGeneralRef(arg_18_0)
		arg_16_0:handlerCallGeneralAction(arg_18_0)
	end

	arg_16_0.bridgeConnectRef = handler(arg_16_0, arg_16_0.onBridgeConnectChange)
	arg_16_0.moveToCityRef = handler(arg_16_0, arg_16_0.moveTo)

	eventManager.registerEvent("handlerCallGeneralAction", arg_16_0.callGeneralRef)
	eventManager.registerEvent("KfworldGetCitySprite", arg_16_0.eventRef)
	eventManager.registerEvent("bridgeConnect", arg_16_0.bridgeConnectRef)
	eventManager.registerEvent("moveToCity", arg_16_0.moveToCityRef)
end

function var_0_0.onExit(arg_19_0)
	eventManager.unregisterEvent("handlerCallGeneralAction", arg_19_0.callGeneralRef)
	eventManager.unregisterEvent("KfworldGetCitySprite", arg_19_0.eventRef)
	eventManager.unregisterEvent("bridgeConnect", arg_19_0.bridgeConnectRef)
	eventManager.unregisterEvent("moveToCity", arg_19_0.moveToCityRef)
end

return var_0_0
