local var_0_0 = require("lua/layer/activity/ancientCastle/EffectLayer")
local var_0_1 = require("lua/layer/activity/ancientCastle/MoveLayer")
local var_0_2 = class("AdventureMapLayer", function()
	return CCScrollView:create(visibleSize)
end)

function var_0_2.ctor(arg_2_0, arg_2_1)
	arg_2_0.ad = arg_2_1

	local var_2_0 = arg_2_1.config:getMap()
	local var_2_1 = var_2_0.column * var_2_0.width
	local var_2_2 = var_2_0.row * var_2_0.height
	local var_2_3 = CCLayer:create()

	var_2_3:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)

	arg_2_0.adWorldLayer = var_2_3

	arg_2_0:setDirection(kCCScrollViewDirectionBoth)
	arg_2_0:setBounceable(false)
	arg_2_0:setPosition(ccp(0, 0))
	arg_2_0:setContentSize(CCSizeMake(var_2_1, var_2_2))
	var_2_3:setContentSize(CCSizeMake(var_2_1, var_2_2))
	arg_2_0:setContainer(var_2_3)

	arg_2_0.effectLayer = var_0_0.new(arg_2_1)

	var_2_3:addChild(arg_2_0.effectLayer, 4)

	arg_2_0.moveLayer = var_0_1.new(arg_2_1)

	var_2_3:addChild(arg_2_0.moveLayer, 5)
	arg_2_0.adWorldLayer:registerScriptTouchHandler(handler(arg_2_0, arg_2_0.onTouch))
	arg_2_0.adWorldLayer:setTouchEnabled(true)

	for iter_2_0 = 1, var_2_0.column do
		for iter_2_1 = 1, var_2_0.row do
			local var_2_4 = var_2_0.row + 1 - iter_2_1
			local var_2_5 = CCSprite:create("res/ui/activity/ancientCastle/map/" .. arg_2_1.mapId .. "/block" .. iter_2_0 .. "_" .. var_2_4 .. ".jpg")

			var_2_5:setPosition(ccp((iter_2_0 - 1) * var_2_0.width + var_2_0.width / 2, (iter_2_1 - 1) * var_2_0.height + var_2_0.height / 2))
			var_2_3:addChild(var_2_5, 0)
		end
	end

	arg_2_0.cityBatchNode = CCSpriteBatchNode:create("res/ui/world/worldBuilding.png")

	var_2_3:addChild(arg_2_0.cityBatchNode, 2)

	arg_2_0.cityNameBatchNode = CCSpriteBatchNode:create("res/ui/activity/ancientCastle/gcName.png")

	var_2_3:addChild(arg_2_0.cityNameBatchNode, 3)

	arg_2_0.cityTable = {}

	for iter_2_2, iter_2_3 in pairs(arg_2_1.config.city.cities) do
		local var_2_6 = arg_2_1.config:getCity(iter_2_2)

		if var_2_6 ~= nil then
			arg_2_0.cityTable[iter_2_2] = {}
			arg_2_0.cityTable[iter_2_2].sprite = CCSprite:createWithSpriteFrameName(var_2_6.model)

			local var_2_7 = arg_2_0.cityTable[iter_2_2].sprite
			local var_2_8 = var_2_7:getContentSize()
			local var_2_9 = var_2_6.x + var_2_8.width / 2
			local var_2_10 = var_2_2 - var_2_6.y - var_2_8.height / 2

			var_2_7:setPosition(ccp(var_2_9, var_2_10))
			arg_2_0.cityBatchNode:addChild(var_2_7, 0)

			local var_2_11 = CCSprite:createWithSpriteFrameName("cc_view_bg.png")

			var_2_11:setPosition(ccp(var_2_9, var_2_10 - 50))
			arg_2_0.cityBatchNode:addChild(var_2_11, 0)

			local var_2_12 = CCSprite:createWithSpriteFrameName(string.format("gc_%s_%s.png", arg_2_0.ad.mapId, iter_2_2))

			var_2_12:setPosition(ccp(var_2_9, var_2_10 - 50))
			arg_2_0.cityNameBatchNode:addChild(var_2_12, 1)
			log.info("", iter_2_2, var_2_7:getPositionX(), var_2_7:getPositionY())
		end
	end
end

function var_0_2.moveTo(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2 = arg_4_2 or false

	local var_4_0 = arg_4_0.cityTable[arg_4_1]

	if var_4_0 == nil then
		return
	end

	local var_4_1 = var_4_0.sprite
	local var_4_2 = var_4_1:getContentSize()
	local var_4_3, var_4_4 = var_4_1:getPosition()
	local var_4_5 = arg_4_0.ad.config:getMap()
	local var_4_6 = var_4_5.column * var_4_5.width
	local var_4_7 = var_4_5.row * var_4_5.height

	if var_4_3 < visibleSize.width / 2 then
		var_4_3 = visibleSize.width / 2
	end

	if var_4_3 > var_4_6 - visibleSize.width / 2 then
		var_4_3 = var_4_6 - visibleSize.width / 2
	end

	if var_4_4 < visibleSize.height / 2 then
		var_4_4 = visibleSize.height / 2
	end

	if var_4_4 > var_4_7 - visibleSize.height / 2 then
		var_4_4 = var_4_7 - visibleSize.height / 2
	end

	if arg_4_2 then
		dt = dt or 0.15

		arg_4_0:setContentOffsetInDuration(ccp(-var_4_3 + visibleSize.width / 2, -var_4_4 + visibleSize.height / 2), dt)
	else
		arg_4_0:setContentOffset(ccp(-var_4_3 + visibleSize.width / 2, -var_4_4 + visibleSize.height / 2), arg_4_2)
	end
end

function var_0_2.handlerStartAdventure(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.action.data

	for iter_5_0, iter_5_1 in pairs(var_5_0.roads) do
		if iter_5_1.rewards ~= nil and iter_5_1.hasPicked == false then
			arg_5_0.effectLayer:updateBox(iter_5_1)
		end
	end

	arg_5_0.moveLayer:initLocation(var_5_0.location)
	arg_5_0:moveTo(var_5_0.location)

	for iter_5_2, iter_5_3 in pairs(var_5_0.cities) do
		if iter_5_3.terminal == 0 then
			local var_5_1 = CCSprite:create("res/ui/activity/ancientCastle/start.png")
			local var_5_2 = CCSprite:create("res/ui/activity/ancientCastle/xiaoren.png")

			var_5_2:setPosition(var_5_1:getContentSize().width / 2, var_5_1:getContentSize().height / 2)
			var_5_1:addChild(var_5_2)

			local var_5_3 = arg_5_0.cityTable[iter_5_3.cityId].sprite

			var_5_1:setPosition(var_5_3:getPositionX() - var_5_1:getContentSize().width / 2, var_5_3:getPositionY() + 40)
			arg_5_0:addChild(var_5_1, 4)
		elseif iter_5_3.terminal == 2 then
			local var_5_4 = CCSprite:create("res/ui/activity/ancientCastle/gaocz.png")
			local var_5_5 = arg_5_0.cityTable[iter_5_3.cityId].sprite

			var_5_4:setPosition(var_5_5:getPositionX() - var_5_4:getContentSize().width / 2, var_5_5:getPositionY() - 40)
			arg_5_0:addChild(var_5_4, 4)
		end
	end
end

function var_0_2.handlerMoveAdventure(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.action.data
	local var_6_1 = var_6_0.leftSteps

	if var_6_1 > 0 then
		arg_6_0.ad.state = arg_6_0.ad.STATE.MOVING_WITH_STEP
	else
		arg_6_0.ad.state = arg_6_0.ad.STATE.MOVING_WITHOUT_STEP
	end

	arg_6_0.ad.infoLayer:updateLeftSteps(var_6_1)
	arg_6_0.ad.infoLayer:updatePercent(var_6_0.percentage)
	arg_6_0.moveLayer:move(var_6_0.path, var_6_0.canPickBox)
	arg_6_0:moveTo(tonumber(tool.split(var_6_0.path, ",")[1]), true)
end

function var_0_2.onTouch(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if arg_7_1 == CCTOUCHBEGAN then
		arg_7_0.touchPoint = ccp(arg_7_2, arg_7_3)

		return true
	elseif arg_7_1 == CCTOUCHMOVED then
		-- block empty
	elseif arg_7_1 == CCTOUCHENDED then
		local var_7_0 = ccp(arg_7_2, arg_7_3)

		if ccpDistance(arg_7_0.touchPoint, var_7_0) > 20 then
			return
		end

		if arg_7_0.ad.state == arg_7_0.ad.STATE.IDLE_WITH_STEP then
			for iter_7_0, iter_7_1 in pairs(arg_7_0.cityTable) do
				if tool.checkIfTouch(iter_7_1.sprite, arg_7_2, arg_7_3) then
					cmgr.sendRequest(handler(arg_7_0, arg_7_0.handlerMoveAdventure), actions.moveAdventure, iter_7_0)
				end
			end
		end
	end
end

function var_0_2.onEnter(arg_8_0)
	return
end

function var_0_2.onExit(arg_9_0)
	return
end

return var_0_2
