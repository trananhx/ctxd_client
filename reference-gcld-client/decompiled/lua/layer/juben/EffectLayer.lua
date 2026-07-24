local var_0_0 = class("JubenEffectLayer", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.juben = arg_2_1
end

function var_0_0.focusOnCities(arg_3_0, arg_3_1)
	arg_3_0:clear()

	for iter_3_0, iter_3_1 in pairs(arg_3_1) do
		local var_3_0 = CCSprite:create("res/ui/guide/jiantou-xia.png")
		local var_3_1 = arg_3_0.juben.mapLayer.cityTable[iter_3_1]

		if var_3_1 ~= nil then
			local var_3_2, var_3_3 = var_3_1.sprite:getPosition()

			var_3_0:setPosition(ccp(var_3_2, var_3_3 + 80))
			arg_3_0:addChild(var_3_0)

			local var_3_4 = CCJumpBy:create(1, ccp(0, 0), 40, 1)

			var_3_0:runAction(CCRepeatForever:create(var_3_4))

			local var_3_5 = CCSprite:create("res/ui/juben/cityLight.png")

			var_3_5:setPosition(ccp(var_3_2, var_3_3 - 20))
			arg_3_0:addChild(var_3_5)

			local var_3_6 = CCFadeOut:create(0.5)
			local var_3_7 = var_3_6:reverse()
			local var_3_8 = CCSequence:createWithTwoActions(var_3_6, var_3_7)

			var_3_5:runAction(CCRepeatForever:create(var_3_8))
		end
	end
end

function var_0_0.yuxiJumpFromWell(arg_4_0)
	local var_4_0 = CCSprite:create("res/ui/juben/yuxi.png")

	var_4_0:setPosition(ccp(365, 867))
	arg_4_0:addChild(var_4_0)

	local var_4_1 = CCMoveBy:create(1, ccp(0, 50))
	local var_4_2 = CCCallFuncN:create(function()
		var_4_0:removeFromParentAndCleanup(true)
	end)

	var_4_0:runAction(CCSequence:createWithTwoActions(var_4_1, var_4_2))
end

function var_0_0.showEventTips(arg_6_0, arg_6_1)
	if arg_6_1.title == nil then
		return
	end

	local var_6_0 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

	var_6_0:setPreferredSize(CCSizeMake(250, 70))

	local var_6_1, var_6_2 = arg_6_0.juben.mapLayer.cityTable[arg_6_1.cityId1].sprite:getPosition()

	var_6_0:setPosition(ccp(var_6_1 + 165, var_6_2 + 85))
	arg_6_0:addChild(var_6_0)

	local var_6_3 = CCStrokeLabelTTF:create(arg_6_1.title, "Thonburi", 20)

	var_6_3:setDimensions(CCSizeMake(250, 0))

	local var_6_4 = CCSizeMake(var_6_3:getContentSize().width + 20, var_6_3:getContentSize().height + 20)

	var_6_3:setPosition(ccp(var_6_4.width / 2, var_6_4.height / 2))
	var_6_3:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_6_0:setPreferredSize(CCSizeMake(var_6_4.width, var_6_4.height))
	var_6_0:addChild(var_6_3)
	performWithDelay(var_6_0, function()
		var_6_0:removeFromParentAndCleanup(true)
	end, 2)
end

function var_0_0.checkEventEffect(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.eventId

	log.info("checkEventEffect=%s", tool.tableToJson(arg_8_1))

	local var_8_1 = arg_8_0.juben.config:getHiddenRoad()
	local var_8_2 = arg_8_0.juben.config:getMap()
	local var_8_3 = var_8_2.column * var_8_2.width
	local var_8_4 = var_8_2.row * var_8_2.height

	for iter_8_0, iter_8_1 in pairs(var_8_1) do
		if iter_8_1.eventId == var_8_0 then
			if iter_8_1.initShow == true then
				local var_8_5 = arg_8_0.juben.mapLayer.hiddenRoadSpriteTable[iter_8_0].sprite

				if var_8_5 and not tolua.isnull(var_8_5) then
					var_8_5:runAction(CCSequence:createWithTwoActions(CCFadeOut:create(1), CCCallFuncN:create(function()
						var_8_5:removeFromParentAndCleanup(true)
					end)))
				end
			else
				local var_8_6 = CCSprite:create("res/jubenMap/" .. arg_8_0.juben.gId .. "/hiddenRoads/jb_pic_" .. iter_8_0 .. ".png")
				local var_8_7 = iter_8_1.x
				local var_8_8 = iter_8_1.y

				arg_8_0.juben.mapLayer.hiddenRoadSpriteTable[iter_8_0] = {}
				arg_8_0.juben.mapLayer.hiddenRoadSpriteTable[iter_8_0].sprite = var_8_6

				local var_8_9 = var_8_7 + var_8_6:getContentSize().width / 2
				local var_8_10 = var_8_4 - (var_8_8 + var_8_6:getContentSize().height / 2)

				var_8_6:setPosition(ccp(var_8_9, var_8_10))
				var_8_6:setOpacity(0)
				arg_8_0.juben.mapLayer.jubenWorldLayer:addChild(var_8_6, 1)
				var_8_6:runAction(CCFadeIn:create(1))
			end

			local var_8_11 = CCSprite:create("res/jubenMap/" .. arg_8_0.juben.gId .. "/hiddenRoads/jb_pic_" .. iter_8_0 .. ".png")
			local var_8_12 = iter_8_1.x
			local var_8_13 = iter_8_1.y
			local var_8_14 = var_8_12 + var_8_11:getContentSize().width / 2
			local var_8_15 = var_8_4 - (var_8_13 + var_8_11:getContentSize().height / 2)

			if iter_8_0 == 1 then
				arg_8_0:flyTextAt(ccp(var_8_14 - 123, var_8_15 - 100), "res/ui/juben/event/jb_blmzz_whkzbml.png")
			elseif iter_8_0 == 2 then
				arg_8_0:flyTextAt(ccp(var_8_14, var_8_15), "res/ui/juben/event/jb_blmzz_gqcx.png")
			elseif iter_8_0 == 3 then
				arg_8_0:flyTextAt(ccp(var_8_14, var_8_15), "res/ui/juben/event/jb_blmzz_cgdqzlcj.png")
			end
		end
	end

	local var_8_16 = arg_8_0.juben.config:getEventsAnim()

	for iter_8_2, iter_8_3 in pairs(var_8_16) do
		if iter_8_3.id == var_8_0 then
			log.info("eventAnim=%s", tool.tableToJson(iter_8_3))

			if iter_8_3.pic and iter_8_3.targetCityId > 0 then
				local var_8_17 = CCSprite:createWithSpriteFrameName("move_por_move_view.png")
				local var_8_18 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", iter_8_3.pic))

				var_8_18:setPosition(ccp(var_8_17:getContentSize().width / 2, var_8_17:getContentSize().height / 2))
				tool.scaleTo(var_8_18, 59, 59)
				var_8_17:addChild(var_8_18)
				arg_8_0:addChild(var_8_17)

				local var_8_19 = arg_8_0.juben.mapLayer:getCitySprite(arg_8_1.cityId1)
				local var_8_20 = arg_8_0.juben.mapLayer:getCitySprite(iter_8_3.targetCityId)

				var_8_17:setPosition(ccp(var_8_19:getPosition()))
				var_8_17:runAction(CCSequence:createWithTwoActions(CCMoveTo:create(1.5, ccp(var_8_20:getPosition())), CCCallFunc:create(function()
					if iter_8_3.resultId == 6 then
						arg_8_0:flyTextAt(ccp(var_8_20:getPosition()), "res/ui/juben/event/jb_blmzz_xjsdjh.png")
					elseif iter_8_3.resultId == 4 then
						arg_8_0:flyTextAt(ccp(var_8_20:getPosition()), "res/ui/juben/event/jb_blmzz_sxscyz.png")
					elseif iter_8_3.resultId == 3 then
						arg_8_0:flyTextAt(ccp(var_8_20:getPosition()), "res/ui/juben/event/jb_blmzz_wxcb.png")
					end

					var_8_17:removeFromParentAndCleanup(true)
				end)))
				arg_8_0.juben.mapLayer:moveTo(iter_8_3.targetCityId, true, false, 1.5)
			end
		end
	end
end

function var_0_0.flyTextAt(arg_11_0, arg_11_1, arg_11_2)
	log.info("pos %s, %s, %s", arg_11_1.x, arg_11_1.y, arg_11_2)

	local var_11_0 = CCSprite:create(arg_11_2)

	var_11_0:setPosition(arg_11_1)
	arg_11_0:addChild(var_11_0)
	var_11_0:runAction(CCSequence:createWithTwoActions(CCMoveBy:create(1, ccp(0, 50)), CCCallFuncN:create(function()
		var_11_0:removeFromParentAndCleanup(true)
	end)))
end

function var_0_0.showNpcTrick(arg_13_0, arg_13_1)
	if arg_13_1.type == "kongcheng" then
		local var_13_0 = arg_13_0.juben.mapLayer.cityTable[arg_13_1.cityId]
		local var_13_1 = CCSprite:create("res/ui/juben/event/jb_dqjz_jzgj.png")

		var_13_1:setPosition(ccp(x, y))
		var_13_1:runAction(CCEaseExponentialOut:create(CCMoveBy:create(1, ccp(0, 30))))
		arg_13_0:addChild(var_13_1)
		performWithDelay(var_13_1, function()
			var_13_1:removeFromParentAndCleanup(true)
		end, 2)
	else
		local var_13_2 = CCSprite:create("res/ui/juben/event/jb_dqjz_bl.png")
		local var_13_3 = CCSprite:create("res/ui/juben/event/blood_ded_subt.png")
		local var_13_4 = CCLabelAtlas:create("20000", "res/ui/common/number/blood_ded_numb.png", 17, 22, 48)

		var_13_2:setPosition(ccp(-36, 14))
		var_13_4:setPosition(ccp(18, 0))
		var_13_3:addChild(var_13_2)
		var_13_3:addChild(var_13_4)

		local var_13_5, var_13_6 = arg_13_0.juben.mapLayer.cityTable[arg_13_1.cityId].sprite:getPosition()

		var_13_3:setPosition(ccp(var_13_5, var_13_6))
		arg_13_0:addChild(var_13_3)
		performWithDelay(var_13_3, function()
			var_13_3:removeFromParentAndCleanup(true)
		end, 2)
	end
end

function var_0_0.clear(arg_16_0)
	arg_16_0:removeAllChildrenWithCleanup(true)
end

return var_0_0
