TAG_STATEPY_EFFECT = 2
TAG_SPEED_EFFECT = 3
TAG_STATEPY_EFFECT_ADD = 4
TAG_STATEPY_TEXT = 6
TAG_WEAK_TEXT = 7

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0

	require("lua/game/battle/uiConstant")

	if arg_1_0 == SIMAYI_FANTAN then
		var_1_0 = rmgr.getAnimation("tacticsBack")
	elseif arg_1_0 == ZHUGELIANG_4 then
		var_1_0 = rmgr.getAnimation("zhuge_thunder")
	elseif arg_1_0 == ZHUGELIANG_1 then
		var_1_0 = rmgr.getAnimation("zhuge_thunder")
	elseif arg_1_0 == BATTLE_TUCHENGH then
		var_1_0 = rmgr.getAnimation("tucheng")
	elseif arg_1_0 == ZHOUYUJX_FIRE then
		var_1_0 = rmgr.getAnimation("zhouyu_fire")
	elseif arg_1_0 == DIAOCHAN_DANCE then
		var_1_0 = rmgr.getAnimation("diaochanDance")
	elseif arg_1_0 == CAOCAO_HAOLINGTIANXIA then
		var_1_0 = rmgr.getAnimation("haolingtianxia")
	elseif arg_1_0 == CARSHILED_EFFECT then
		var_1_0 = rmgr.getAnimation("car_shiled")
	elseif arg_1_0 == ZHIHENG_EFFECT then
		var_1_0 = rmgr.getAnimation("sqzhAtt")
	elseif arg_1_0 == ZHIHENG_EFFECT2 then
		var_1_0 = rmgr.getAnimation("sqzhDef")
	elseif arg_1_0 == LIGNTNING_EFFECT then
		var_1_0 = rmgr.getAnimation("zhuge_thunder")
	else
		var_1_0 = rmgr.getStategyEffect(arg_1_1, arg_1_0)
	end

	local var_1_1 = CCAnimation:createWithSpriteFrames(var_1_0)

	var_1_1:setDelayPerUnit(0.08)

	if arg_1_0 == ZHUGELIANG_4 or arg_1_0 == ZHUGELIANG_1 then
		var_1_1:setDelayPerUnit(0.12)
	end

	if arg_1_0 == DIAOCHAN_DANCE then
		var_1_1:setDelayPerUnit(0.12)
	end

	if arg_1_0 == ZHIHENG_EFFECT then
		var_1_1:setDelayPerUnit(0.04)
	elseif arg_1_0 == ZHIHENG_EFFECT2 then
		var_1_1:setDelayPerUnit(0.04)
	elseif arg_1_0 == LIGNTNING_EFFECT then
		var_1_1:setDelayPerUnit(0.12)
	end

	var_1_1:setRestoreOriginalFrame(true)

	return var_1_1
end

function createStategyAnimation(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont.plist")
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

	local var_2_0 = CCSprite:create()
	local var_2_1
	local var_2_2 = CCArray:create()
	local var_2_3 = CCLayerColor:create(ccc4(0, 0, 0, 170))

	var_2_3:setTouchEnabled(false)

	if arg_2_1.tacticsId == 36 or arg_2_1.tacticsId == 37 or arg_2_1.tacticsId == 44 or arg_2_1.tacticsId == ZHOUYUJX_FIRE2 then
		arg_2_0:addChild(var_2_3, 0)
	end

	local function var_2_4()
		arg_2_0:removeChild(var_2_0, true)
		arg_2_0:removeChild(var_2_3, true)

		if arg_2_3.endAnimation then
			arg_2_3.endAnimation()
		end
	end

	local function var_2_5()
		local var_4_0 = 0.11
		local var_4_1 = 0.5
		local var_4_2 = 110
		local var_4_3 = 0.44 * visibleSize.width * var_4_1 + var_4_2
		local var_4_4 = 130
		local var_4_5 = -140

		attPosition = {}
		attPosition[-1] = {}
		attPosition[0] = {}
		attPosition[1] = {}

		for iter_4_0 = -1, 1 do
			for iter_4_1 = 1, 4 do
				local var_4_6 = (0.45 - iter_4_1 * var_4_0) * visibleSize.width + var_4_4 * iter_4_0 + 30
				local var_4_7 = var_4_1 * var_4_6 + var_4_2 + var_4_5 * iter_4_0 - 100

				attPosition[iter_4_0][iter_4_1] = ccp(var_4_6, var_4_7 + (visibleSize.height - visibleSize.width * var_4_1) / 2)
			end
		end

		return attPosition
	end

	local function var_2_6(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
		local var_5_0 = var_0_0(arg_5_1, arg_5_2)
		local var_5_1 = CCAnimate:create(var_5_0)
		local var_5_2 = CCSprite:create()

		var_5_2:setPosition(arg_5_3)

		if arg_5_4 ~= nil then
			var_5_2:setRotation(arg_5_4)
		end

		if arg_5_5 ~= nil then
			var_5_2:setScale(arg_5_5)
		end

		ta = CCTargetedAction:create(var_5_2, var_5_1)

		arg_5_0:addChild(var_5_2, 1, TAG_STATEPY_EFFECT_ADD)

		return ta
	end

	local function var_2_7()
		local var_6_0 = arg_2_3.defPosition[0]

		if arg_2_1.side == "att" then
			if arg_2_1.showTacticsId == BATTLE_TUCHENGH and arg_2_3.defPosition[2] then
				var_6_0 = arg_2_3.defPosition[2]
			elseif arg_2_1.showTacticsId == DIAOCHAN_DANCE and arg_2_3.defPosition[2] then
				var_6_0 = ccp(arg_2_3.defPosition[2].x - 50, arg_2_3.defPosition[2].y + 25)
			elseif arg_2_1.showTacticsId == CAOCAO_HAOLINGTIANXIA and arg_2_3.attPosition[2] then
				var_6_0 = arg_2_3.attPosition[1]
			elseif arg_2_1.showTacticsId == CARSHILED_EFFECT and arg_2_3.attPosition[2] then
				var_6_0 = arg_2_3.attPosition[1]
			end
		else
			var_6_0 = arg_2_3.attPosition[0]

			if arg_2_1.showTacticsId == BATTLE_TUCHENGH and arg_2_3.attPosition[2] then
				var_6_0 = arg_2_3.attPosition[2]
			elseif arg_2_1.showTacticsId == DIAOCHAN_DANCE and arg_2_3.attPosition[2] then
				var_6_0 = ccp(arg_2_3.attPosition[2].x + 50, arg_2_3.attPosition[2].y + 75)
			elseif arg_2_1.showTacticsId == CAOCAO_HAOLINGTIANXIA and arg_2_3.defPosition[2] then
				var_6_0 = arg_2_3.defPosition[1]
			elseif arg_2_1.showTacticsId == CARSHILED_EFFECT and arg_2_3.defPosition[2] then
				var_6_0 = arg_2_3.defPosition[1]
			end
		end

		if rmgr.stategyEffectInfo[arg_2_1.showTacticsId] and rmgr.stategyEffectInfo[arg_2_1.showTacticsId][arg_2_1.side .. "Pos"] then
			local var_6_1 = rmgr.stategyEffectInfo[arg_2_1.showTacticsId][arg_2_1.side .. "Pos"]

			var_6_0 = ccp(var_6_0.x + var_6_1.x, var_6_0.y + var_6_1.y)
		end

		if arg_2_1.showTacticsId == ZHIHENG_EFFECT then
			if arg_2_1.side == "att" then
				var_6_0 = ccp(var_6_0.x - 100, var_6_0.y + 50)
			else
				var_6_0 = ccp(var_6_0.x + 100, var_6_0.y + 100)
			end
		elseif arg_2_1.showTacticsId == ZHIHENG_EFFECT2 then
			if arg_2_1.side == "att" then
				var_6_0 = ccp(var_6_0.x - 90, var_6_0.y + 65)
			else
				var_6_0 = ccp(var_6_0.x + 100, var_6_0.y + 155)
			end
		end

		log.info("stategy.showTacticsId: " .. arg_2_1.showTacticsId)

		local var_6_2 = var_0_0(arg_2_1.showTacticsId, arg_2_1.side)
		local var_6_3 = CCAnimate:create(var_6_2)
		local var_6_4 = CCSprite:create()

		var_6_4:setPosition(var_6_0)

		if arg_2_1.showTacticsId == BATTLE_TUCHENGH then
			var_6_4:setScale(4)
		elseif arg_2_1.showTacticsId == 46 then
			var_6_4:setScale(2)
		end

		local var_6_5 = CCTargetedAction:create(var_6_4, var_6_3)

		arg_2_0:addChild(var_6_4, 1, TAG_STATEPY_EFFECT)

		local var_6_6 = CCArray:create()
		local var_6_7 = 6
		local var_6_8 = 145
		local var_6_9 = 150
		local var_6_10 = -90

		if arg_2_1.showTacticsId == ZHUGELIANG_1 then
			for iter_6_0 = -1, 1 do
				local var_6_11 = var_0_0(arg_2_1.showTacticsId, arg_2_1.side)
				local var_6_12 = CCAnimate:create(var_6_11)
				local var_6_13 = CCSprite:create()

				if arg_2_1.side == "def" then
					var_6_13:setPosition(ccp(arg_2_3.attPosition[0].x + var_6_7 + var_6_9 * iter_6_0, arg_2_3.attPosition[0].y + var_6_8 + var_6_10 * iter_6_0))
				else
					var_6_13:setPosition(ccp(arg_2_3.defPosition[0].x + var_6_7 + var_6_9 * iter_6_0, arg_2_3.defPosition[0].y + var_6_8 + var_6_10 * iter_6_0))
				end

				var_6_13:setScale(2)

				local var_6_14 = CCTargetedAction:create(var_6_13, var_6_12)

				arg_2_0:addChild(var_6_13, 1, TAG_STATEPY_EFFECT + iter_6_0)
				var_6_6:addObject(var_6_14)
			end
		elseif arg_2_1.showTacticsId == ZHUGELIANG_4 then
			for iter_6_1 = -1, 1 do
				for iter_6_2 = 0, 3 do
					local var_6_15 = var_0_0(arg_2_1.showTacticsId, arg_2_1.side)
					local var_6_16 = CCAnimate:create(var_6_15)
					local var_6_17 = CCSprite:create()

					if arg_2_1.side == "def" then
						if arg_2_3.attPosition[iter_6_2] then
							var_6_17:setPosition(ccp(arg_2_3.attPosition[iter_6_2].x + var_6_7 + var_6_9 * iter_6_1, arg_2_3.attPosition[iter_6_2].y + var_6_8 + var_6_10 * iter_6_1))
						end
					elseif arg_2_3.defPosition[iter_6_2] then
						var_6_17:setPosition(ccp(arg_2_3.defPosition[iter_6_2].x + var_6_7 + var_6_9 * iter_6_1, arg_2_3.defPosition[iter_6_2].y + var_6_8 + var_6_10 * iter_6_1))
					end

					var_6_17:setScale(2)

					local var_6_18 = CCTargetedAction:create(var_6_17, var_6_16)

					arg_2_0:addChild(var_6_17, 1, TAG_STATEPY_EFFECT + iter_6_1)
					var_6_6:addObject(var_6_18)
				end
			end
		elseif arg_2_1.showTacticsId == ZHOUYUJX_FIRE then
			for iter_6_3 = -1, 1 do
				for iter_6_4 = 0, 3 do
					local var_6_19 = var_0_0(arg_2_1.showTacticsId, arg_2_1.side)
					local var_6_20 = CCAnimate:create(var_6_19)
					local var_6_21 = CCSprite:create()

					if arg_2_1.side == "def" then
						if arg_2_3.attPosition[iter_6_4] then
							var_6_21:setPosition(ccp(arg_2_3.attPosition[iter_6_4].x + var_6_9 * iter_6_3, arg_2_3.attPosition[iter_6_4].y + var_6_10 * iter_6_3))
						end
					elseif arg_2_3.defPosition[iter_6_4] then
						var_6_21:setPosition(ccp(arg_2_3.defPosition[iter_6_4].x + var_6_9 * iter_6_3, arg_2_3.defPosition[iter_6_4].y + var_6_10 * iter_6_3))
					end

					var_6_21:setScale(0.8)

					local var_6_22 = CCTargetedAction:create(var_6_21, var_6_20)

					arg_2_0:addChild(var_6_21, 1, TAG_STATEPY_EFFECT + iter_6_3)
					var_6_6:addObject(var_6_22)
				end
			end
		elseif arg_2_1.showTacticsId == LIGNTNING_EFFECT then
			for iter_6_5 = -1, 1 do
				for iter_6_6 = 0, 3 do
					local var_6_23 = var_0_0(arg_2_1.showTacticsId, arg_2_1.side)
					local var_6_24 = CCAnimate:create(var_6_23)
					local var_6_25 = CCSprite:create()

					if arg_2_1.side == "def" then
						if arg_2_3.attPosition[iter_6_6] then
							var_6_25:setPosition(ccp(arg_2_3.attPosition[iter_6_6].x + var_6_7 + var_6_9 * iter_6_5, arg_2_3.attPosition[iter_6_6].y + var_6_8 + var_6_10 * iter_6_5))
						end
					elseif arg_2_3.defPosition[iter_6_6] then
						var_6_25:setPosition(ccp(arg_2_3.defPosition[iter_6_6].x + var_6_7 + var_6_9 * iter_6_5, arg_2_3.defPosition[iter_6_6].y + var_6_8 + var_6_10 * iter_6_5))
					end

					var_6_25:setScale(2)

					local var_6_26 = CCTargetedAction:create(var_6_25, var_6_24)

					arg_2_0:addChild(var_6_25, 1, TAG_STATEPY_EFFECT + iter_6_5)
					var_6_6:addObject(var_6_26)
				end
			end
		end

		local var_6_27
		local var_6_28
		local var_6_29
		local var_6_30 = CCArray:create()

		require("lua/game/battle/uiConstant")

		if arg_2_1.showTacticsId == battleTower.FANGJIAN then
			var_6_4:setPosition(ccp(battleTower.towerLeft.x - 65, battleTower.towerLeft.y))
			var_6_4:setScale(2)

			var_6_27 = var_2_6(arg_2_0, battleTower.FANGJIAN_1, arg_2_1.side, ccp(battleTower.towerRight.x - 100, battleTower.towerRight.y + 15), 0, 2)

			local var_6_31 = var_2_5()

			for iter_6_7 = -1, 1 do
				for iter_6_8 = 1, 4 do
					local var_6_32 = var_2_6(arg_2_0, battleTower.FANGJIAN_5, arg_2_1.side, attPosition[iter_6_7][iter_6_8])

					var_6_30:addObject(var_6_32)
				end
			end
		elseif arg_2_1.showTacticsId == battleTower.PAOJI then
			var_6_4:setPosition(ccp(battleTower.towerLeft.x - 170, battleTower.towerLeft.y + 80))
			var_6_4:setScale(1.5)
			var_6_4:setRotation(-20)

			var_6_27 = var_2_6(arg_2_0, battleTower.PAOJI, arg_2_1.side, ccp(battleTower.towerRight.x - 200, battleTower.towerRight.y + 100), 20, 1.5)

			local var_6_33 = var_2_5()

			for iter_6_9 = -1, 1 do
				for iter_6_10 = 1, 4 do
					local var_6_34 = var_2_6(arg_2_0, battleTower.FANGJIAN_5, arg_2_1.side, attPosition[iter_6_9][iter_6_10])

					var_6_30:addObject(var_6_34)
				end
			end
		elseif arg_2_1.showTacticsId == battleTower.POHUAI then
			var_6_4:setRotation(0)
			var_6_4:setPosition(ccp(var_6_0.x + 50, var_6_0.y - 150))

			var_6_27 = var_2_6(arg_2_0, battleTower.POHUAI, arg_2_1.side, var_6_0, 240)
			var_6_28 = var_2_6(arg_2_0, battleTower.POHUAI_1, arg_2_1.side, ccp(battleTower.towerLeft.x - 25, battleTower.towerLeft.y - 80))
			var_6_29 = var_2_6(arg_2_0, battleTower.POHUAI_1, arg_2_1.side, ccp(battleTower.towerRight.x - 25, battleTower.towerRight.y - 80))
		elseif arg_2_1.showTacticsId == MENGHUO_ANIMATION_STATEGY then
			-- block empty
		end

		local function var_6_35()
			amgr.playEffect(enumAudioFile.battle_wujiang_skill)
		end

		local var_6_36 = CCArray:create()

		var_6_36:addObject(CCCallFuncN:create(var_6_35))

		if arg_2_1.showTacticsId == battleTower.FANGJIAN then
			var_6_36:addObject(CCSpawn:createWithTwoActions(var_6_5, var_6_27))
			var_6_36:addObject(CCSpawn:create(var_6_30))
		elseif arg_2_1.showTacticsId == battleTower.PAOJI then
			var_6_36:addObject(CCSpawn:createWithTwoActions(var_6_5, var_6_27))
			var_6_36:addObject(CCSpawn:create(var_6_30))
		elseif arg_2_1.showTacticsId == battleTower.POHUAI then
			var_6_36:addObject(CCSpawn:createWithTwoActions(var_6_5, var_6_27))
			var_6_36:addObject(CCSpawn:createWithTwoActions(var_6_28, var_6_29))
		elseif arg_2_1.showTacticsId == ZHUGELIANG_4 or arg_2_1.showTacticsId == ZHUGELIANG_1 or arg_2_1.showTacticsId == ZHOUYUJX_FIRE or arg_2_1.showTacticsId == LIGNTNING_EFFECT then
			var_6_36:addObject(CCSpawn:create(var_6_6))
		else
			var_6_36:addObject(var_6_5)
		end

		var_6_36:addObject(CCCallFuncN:create(var_2_4))
		var_2_0:runAction(CCSequence:create(var_6_36))
	end

	local function var_2_8()
		local var_8_0 = rmgr.getSpeedEffectAnimation()
		local var_8_1 = CCAnimation:createWithSpriteFrames(var_8_0, 0.08)
		local var_8_2 = CCAnimate:create(var_8_1)
		local var_8_3 = CCRepeatForever:create(var_8_2)
		local var_8_4 = CCSprite:create()

		var_8_4:runAction(var_8_3)
		var_8_4:setPosition(ccp(var_2_1:getContentSize().width * 0.5, var_2_1:getContentSize().height * 0.5))
		var_2_1:addChild(var_8_4, 0, TAG_SPEED_EFFECT)

		local var_8_5 = arg_2_1.leftPic

		if arg_2_1.side == "def" then
			var_8_5 = arg_2_1.rightPic
		end

		local var_8_6 = CCSprite:create(rmgr.getGeneralBust(var_8_5))
		local var_8_7 = ccp(var_8_6:getContentSize().width * 0.5 - 50, var_8_6:getContentSize().height * 0.5 + 10)
		local var_8_8 = ccp(50, 0)

		if arg_2_1.side == "def" then
			var_8_7 = ccp(var_2_1:getContentSize().width - var_8_6:getContentSize().width * 0.5 + 50, var_8_6:getContentSize().height * 0.5 + 10)
			var_8_8 = ccp(-50, 0)
		end

		local var_8_9, var_8_10 = string.find(var_8_5, "player")

		if var_8_9 and var_8_10 then
			var_8_6 = CCSprite:create("res/ui/common/playerPic/" .. var_8_5 .. ".png")

			var_8_6:setScale(0.7)

			if arg_2_1.side == "att" then
				var_8_7 = ccp(var_8_6:getContentSize().width * 0.5 - 50, var_8_6:getContentSize().height * 0.5 * 0.7)
			else
				var_8_7 = ccp(var_2_1:getContentSize().width - var_8_6:getContentSize().width * 0.5 + 50, var_8_6:getContentSize().height * 0.5 * 0.7)
			end
		end

		var_8_6:setPosition(var_8_7)
		var_2_1:addChild(var_8_6)

		local var_8_11 = CCMoveBy:create(0.5, var_8_8)

		if var_8_5 == "zhugeliang" or var_8_5 == "zhugeliangjx" then
			var_8_11 = CCMoveBy:create(0.3, var_8_8)
		end

		var_8_6:runAction(var_8_11)
	end

	local function var_2_9()
		if var_2_1 then
			local var_9_0 = arg_2_1.rightPic

			if arg_2_1.side == "def" then
				var_9_0 = arg_2_1.leftPic
			end

			local var_9_1 = CCSprite:create(rmgr.getGeneralBust(var_9_0))
			local var_9_2 = CCSprite:createWithSpriteFrameName("stategyText_hold.png")
			local var_9_3 = ccp(var_2_1:getContentSize().width - var_9_1:getContentSize().width * 0.2, var_9_1:getContentSize().height * 0.5)
			local var_9_4 = ccp(-var_9_1:getContentSize().width * 0.3, 0)
			local var_9_5 = ccp(0, var_9_1:getContentSize().height * 0.7)

			if arg_2_1.side == "def" then
				var_9_3 = ccp(var_9_1:getContentSize().width * 0.2, var_9_1:getContentSize().height * 0.5)
				var_9_4 = ccp(var_9_1:getContentSize().width * 0.3, 0)
				var_9_5 = ccp(var_9_1:getContentSize().width, var_9_1:getContentSize().height * 0.7)
			end

			var_9_1:setPosition(var_9_3)
			var_9_2:setPosition(var_9_5)
			var_9_1:addChild(var_9_2)
			var_2_1:addChild(var_9_1)
			var_9_1:setVisible(false)

			local var_9_6 = CCMoveBy:create(0.3, var_9_4)
			local var_9_7 = CCTargetedAction:create(var_9_1, var_9_6)

			local function var_9_8()
				amgr.playEffect(enumAudioFile.battle_wujiang_didang)
			end

			local function var_9_9()
				var_9_1:setVisible(true)
			end

			local function var_9_10()
				var_2_1:removeChildByTag(TAG_SPEED_EFFECT, true)
			end

			local var_9_11 = CCArray:create()

			var_9_11:addObject(CCCallFuncN:create(var_2_8))
			var_9_11:addObject(CCDelayTime:create(1.5))
			var_9_11:addObject(CCCallFuncN:create(var_9_10))
			var_9_11:addObject(CCCallFuncN:create(var_9_8))
			var_9_11:addObject(CCCallFuncN:create(var_9_9))
			var_9_11:addObject(var_9_7)
			var_9_11:addObject(CCDelayTime:create(0.5))
			var_9_11:addObject(CCCallFuncN:create(var_2_4))
			var_2_0:runAction(CCSequence:create(var_9_11))
		end
	end

	if arg_2_1.type and arg_2_1.showTacticsId ~= SIMAYI_FANTAN and (arg_2_1.tacticsId ~= DIAOCHAN_DANCE_STATEGY or arg_2_1.beHold ~= 0) and not arg_2_1.isSputter then
		local var_2_10
		local var_2_11

		if arg_2_1.tacticsId == battleTower.FANGJIAN then
			var_2_10 = CCSprite:create("res/ui/battle/battleTower/cfjt_zf_fj.png")
		elseif arg_2_1.tacticsId == battleTower.PAOJI then
			var_2_10 = CCSprite:create("res/ui/battle/battleTower/cfjt_zf_pj.png")
		elseif arg_2_1.tacticsId == battleTower.POHUAI then
			var_2_10 = CCSprite:create("res/ui/battle/battleTower/cfjt_zf_ph.png")
		elseif arg_2_1.tacticsId == BATTLE_TUCHENGH then
			var_2_10 = CCSprite:create("res/ui/weapon/tcxg_word_tczf.png")
		elseif arg_2_1.tacticsId == ZHUGELIANG_WORD_4 then
			var_2_10 = CCSprite:createWithSpriteFrameName("baguazhen_qghls.png")
			var_2_11 = CCSprite:createWithSpriteFrameName("baguazhen_bgz.png")
		elseif arg_2_1.tacticsId == ZHUGELIANG_WORD_1 then
			var_2_10 = CCSprite:createWithSpriteFrameName("baguazhen_kglls.png")
			var_2_11 = CCSprite:createWithSpriteFrameName("baguazhen_bgz.png")

			if arg_2_1.side == "def" and arg_2_3.battleData.attArmyInfo[0] and arg_2_3.battleData.attArmyInfo[0].data.troopType == 43 then
				var_2_10 = CCSprite:createWithSpriteFrameName("zf_word_sghy.png")
			end

			if arg_2_1.side == "att" and arg_2_3.battleData.defArmyInfo[0] and arg_2_3.battleData.defArmyInfo[0].data.troopType == 43 then
				var_2_10 = CCSprite:createWithSpriteFrameName("zf_word_sghy.png")
			end
		elseif arg_2_1.tacticsId == BATTLE_LVBUZIBAO then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_ctbx.png")
		elseif arg_2_1.showTacticsId == 29 then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_txws.png")
		elseif arg_2_1.showTacticsId == 31 then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_cymz.png")

			var_2_10:setScale(0.8)
		elseif arg_2_1.tacticsId == ZHOUYUJX_FIRE2 then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_cbhs.png")

			var_2_10:setScale(0.8)
		elseif arg_2_1.tacticsId == DIAOCHAN_DANCE_STATEGY then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_qgqc.png")
		elseif arg_2_1.tacticsId == XUNYU_YEHUOPOZHEN then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_yhpz.png")
		elseif arg_2_1.tacticsId == BATTLE_HUOJI then
			var_2_10 = CCSprite:createWithSpriteFrameName("gzjc_word_hj.png")
		elseif arg_2_1.tacticsId == MENGHUO_STATEGY then
			var_2_10 = CCSprite:createWithSpriteFrameName("zf_word_ymcz.png")
		elseif arg_2_1.tacticsId == TEN_JUNLINTIANXIA then
			var_2_10 = CCSprite:createWithSpriteFrameName("stategyText_jltx.png")
		elseif arg_2_1.tacticsId == CARSHILED_EFFECT or arg_2_1.tacticsId == ZHIHENG_EFFECT or arg_2_1.tacticsId == ZHIHENG_EFFECT2 or arg_2_1.tacticsId == LIGNTNING_EFFECT then
			var_2_10 = CCSprite:create("res/default.png")
		else
			var_2_10 = CCSprite:createWithSpriteFrameName(string.format("stategyText_%s.png", arg_2_1.tacticsId))
		end

		if arg_2_2 >= 4 and arg_2_1.showTacticsId ~= CARSHILED_EFFECT and arg_2_1.showTacticsId ~= TEN_JUNLINTIANXIA and arg_2_1.showTacticsId ~= 8044 and arg_2_1.showTacticsId ~= 8045 and arg_2_1.showTacticsId ~= ZHIHENG_EFFECT and arg_2_1.showTacticsId ~= ZHIHENG_EFFECT2 and arg_2_1.tacticsId ~= LIGNTNING_EFFECT then
			if tonumber(arg_2_1.backgound) > 6 then
				arg_2_1.backgound = "6"
			end

			var_2_1 = CCSprite:create(string.format("res/ui/battle/stategyPic/%s.png", arg_2_1.backgound))

			var_2_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

			if arg_2_1.side == "def" then
				var_2_1:setFlipX(true)
			end

			var_2_1:setVisible(false)
			var_2_0:addChild(var_2_1)

			if arg_2_1.tacticsId == ZHUGELIANG_WORD_4 or arg_2_1.tacticsId == ZHUGELIANG_WORD_1 then
				var_2_10:setPosition(ccp(var_2_1:getContentSize().width * 0.5, var_2_1:getContentSize().height * 0.3))
				var_2_1:addChild(var_2_10, 0, TAG_STATEPY_TEXT)
				var_2_10:setScale(0.8)
				var_2_11:setPosition(ccp(var_2_1:getContentSize().width * 0.5, var_2_1:getContentSize().height * 0.6))
				var_2_1:addChild(var_2_11, 0)

				local function var_2_12()
					var_2_1:setVisible(true)
				end

				var_2_2:addObject(CCCallFuncN:create(var_2_12))
			else
				var_2_1:setVisible(true)
				var_2_10:setPosition(ccp(var_2_1:getContentSize().width * 0.5, var_2_1:getContentSize().height * 0.3))
				var_2_1:addChild(var_2_10, 0, TAG_STATEPY_TEXT)

				if arg_2_1.isWorldFightWeaken and type(arg_2_1.isWorldFightWeaken) == "number" then
					local var_2_13 = CCSprite:createWithSpriteFrameName(string.format("stategyText_weak%d.png", arg_2_1.isWorldFightWeaken))

					var_2_13:setPosition(ccp(620, 90))
					var_2_1:addChild(var_2_13, 1, TAG_WEAK_TEXT)
				end
			end

			log.info("stategy.beHold: " .. arg_2_1.beHold)

			if arg_2_1.beHold == 1 or arg_2_1.beHold == 3 then
				var_2_2:addObject(CCCallFuncN:create(var_2_9))
			else
				var_2_2:addObject(CCCallFuncN:create(var_2_8))

				if arg_2_1.tacticsId == ZHUGELIANG_WORD_4 or arg_2_1.tacticsId == ZHUGELIANG_WORD_1 then
					var_2_2:addObject(CCDelayTime:create(0.6))
				else
					var_2_2:addObject(CCDelayTime:create(1.3))
				end

				var_2_2:addObject(CCCallFuncN:create(function()
					var_2_0:removeAllChildrenWithCleanup(true)

					if arg_2_1.tacticsId == BATTLE_HUOJI then
						var_2_4()
					else
						var_2_7()
					end
				end))
			end
		else
			var_2_10:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.3))
			var_2_0:addChild(var_2_10)

			local var_2_14 = CCMoveBy:create(0.5, ccp(-10, 0))
			local var_2_15 = CCFadeOut:create(0.5)
			local var_2_16 = CCSequence:createWithTwoActions(var_2_14, var_2_15)
			local var_2_17 = CCTargetedAction:create(var_2_10, var_2_16)

			var_2_2:addObject(var_2_17)
			var_2_2:addObject(CCCallFuncN:create(var_2_7))
		end
	end

	if arg_2_1.type and arg_2_1.showTacticsId == SIMAYI_FANTAN then
		var_2_2:addObject(CCCallFuncN:create(function()
			var_2_7()
		end))
	end

	if arg_2_1.type and arg_2_1.tacticsId == DIAOCHAN_DANCE_STATEGY and arg_2_1.beHold == 0 then
		var_2_2:addObject(CCCallFuncN:create(function()
			var_2_7()
		end))
	end

	if arg_2_1.type and arg_2_1.isSputter then
		var_2_2:addObject(CCCallFuncN:create(function()
			var_2_7()
		end))
	end

	local var_2_18 = CCSequence:create(var_2_2)

	var_2_0:runAction(var_2_18)
	arg_2_0:addChild(var_2_0, 1)
end

function createJuexingStategyInfo(arg_18_0)
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont.plist")
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

	local var_18_0
	local var_18_1 = CCLayerColor:create(ccc4(0, 0, 0, 170))

	var_18_1:setTouchEnabled(false)

	local var_18_2 = smgr.getLayer("tipLayer")

	if arg_18_0.juexingGeneral == "guanyujx" then
		var_18_0 = CCSprite:create("res/ui/battle/stategyPic/1.png")

		local var_18_3 = CCSprite:create("res/ui/common/halfPic/halfPic_guanyujx.png")
		local var_18_4 = CCSprite:create("res/ui/general/juexing/zf_shhy.png")
		local var_18_5 = CCSprite:create("res/ui/general/juexing/zf_wjjx.png")

		var_18_0:addChild(var_18_3)
		var_18_0:addChild(var_18_4)
		var_18_0:addChild(var_18_5)
		var_18_3:setPosition(ccp(var_18_0:getContentSize().width * 0.1, var_18_0:getContentSize().height * 0.6))
		var_18_4:setPosition(ccp(var_18_0:getContentSize().width * 0.5, var_18_0:getContentSize().height * 0.6))
		var_18_5:setPosition(ccp(var_18_0:getContentSize().width * 0.8, var_18_0:getContentSize().height * 0.2))
		var_18_2:addChild(var_18_0, 10)
		var_18_0:setPosition(ccp(0 - var_18_0:getContentSize().width * 0.5, visibleSize.height * 0.5))
		var_18_2:addChild(var_18_1, 0)
	end

	local function var_18_6()
		if var_18_0 then
			var_18_2:removeChild(var_18_0, true)
			var_18_2:removeChild(var_18_1, true)
		end
	end

	local var_18_7 = CCArray:create()

	var_18_7:addObject(CCMoveTo:create(0.2, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_18_7:addObject(CCDelayTime:create(2))
	var_18_7:addObject(CCMoveTo:create(0.2, ccp(visibleSize.width + var_18_0:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_18_7:addObject(CCCallFuncN:create(var_18_6))

	local var_18_8 = CCSequence:create(var_18_7)

	if var_18_0 then
		var_18_0:runAction(var_18_8)
	end
end

function createZhugeAnimation(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont.plist")
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

	local var_20_0 = CCSprite:create()
	local var_20_1 = CCArray:create()
	local var_20_2 = CCSprite:create("res/ui/battle/stategyPic/3.png")

	var_20_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

	if arg_20_1 == "def" then
		var_20_2:setFlipX(true)
	end

	var_20_2:setVisible(false)
	var_20_0:addChild(var_20_2)

	local var_20_3

	if arg_20_2 == 1 then
		var_20_3 = CCSprite:createWithSpriteFrameName("baguazhen_zgxrs.png")
	else
		var_20_3 = CCSprite:createWithSpriteFrameName("baguazhen_wswxg.png")
	end

	local var_20_4 = CCSprite:createWithSpriteFrameName("baguazhen_bgz.png")

	var_20_3:setScale(0.8)
	var_20_3:setPosition(ccp(var_20_2:getContentSize().width * 0.5, var_20_2:getContentSize().height * 0.3))
	var_20_4:setPosition(ccp(var_20_2:getContentSize().width * 0.5, var_20_2:getContentSize().height * 0.6))
	var_20_2:addChild(var_20_3, 0, TAG_STATEPY_TEXT)
	var_20_2:addChild(var_20_4, 0)

	local function var_20_5()
		arg_20_0:removeChild(var_20_0, true)

		if arg_20_3.endAnimation then
			arg_20_3.endAnimation()
		end
	end

	local function var_20_6()
		local var_22_0 = rmgr.getSpeedEffectAnimation()
		local var_22_1 = CCAnimation:createWithSpriteFrames(var_22_0, 0.08)
		local var_22_2 = CCAnimate:create(var_22_1)
		local var_22_3 = CCRepeatForever:create(var_22_2)
		local var_22_4 = CCSprite:create()

		var_22_4:runAction(var_22_3)
		var_22_4:setPosition(ccp(var_20_2:getContentSize().width * 0.5, var_20_2:getContentSize().height * 0.5))
		var_20_2:addChild(var_22_4, 0, TAG_SPEED_EFFECT)

		local var_22_5 = CCSprite:create(rmgr.getGeneralBust("zhugeliang"))

		if arg_20_1 == "def" and arg_20_3.battleData.defArmyInfo[0] and arg_20_3.battleData.defArmyInfo[0].data.troopType == 47 then
			var_22_5 = CCSprite:create(rmgr.getGeneralBust("zhugeliangjx"))
		end

		if arg_20_1 == "att" and arg_20_3.battleData.attArmyInfo[0] and arg_20_3.battleData.attArmyInfo[0].data.troopType == 47 then
			var_22_5 = CCSprite:create(rmgr.getGeneralBust("zhugeliangjx"))
		end

		local var_22_6 = ccp(var_22_5:getContentSize().width * 0.5 - 50, var_22_5:getContentSize().height * 0.5 + 10)
		local var_22_7 = ccp(50, 0)

		if arg_20_1 == "def" then
			var_22_6 = ccp(var_20_2:getContentSize().width - var_22_5:getContentSize().width * 0.5 + 50, var_22_5:getContentSize().height * 0.5 + 10)
			var_22_7 = ccp(-50, 0)
		end

		var_22_5:setPosition(var_22_6)
		var_20_2:addChild(var_22_5)

		local var_22_8 = CCMoveBy:create(0.5, var_22_7)

		var_22_5:runAction(var_22_8)
	end

	local function var_20_7()
		var_20_2:setVisible(true)
	end

	var_20_1:addObject(CCCallFuncN:create(var_20_7))
	var_20_1:addObject(CCCallFuncN:create(var_20_6))
	var_20_1:addObject(CCDelayTime:create(0.6))
	var_20_1:addObject(CCCallFuncN:create(var_20_5))

	local var_20_8 = CCSequence:create(var_20_1)

	var_20_0:runAction(var_20_8)
	arg_20_0:addChild(var_20_0, 1)
end

function createJiTuiDiJiangAnimation(arg_24_0, arg_24_1, arg_24_2)
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont.plist")
	rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

	local var_24_0 = CCSprite:create()
	local var_24_1
	local var_24_2 = CCArray:create()
	local var_24_3 = CCSprite:create(string.format("res/ui/battle/stategyPic/1.png"))

	var_24_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	var_24_0:addChild(var_24_3)

	local function var_24_4()
		arg_24_0:removeChild(var_24_0, true)

		if arg_24_2.endAnimation then
			arg_24_2.endAnimation()
		end
	end

	local function var_24_5()
		local var_26_0 = arg_24_1.leftPic

		if arg_24_1.side == "def" then
			var_26_0 = arg_24_1.rightPic
		end

		local var_26_1 = CCSprite:create(rmgr.getGeneralBust(var_26_0))
		local var_26_2 = ccp(var_26_1:getContentSize().width * 0.5 - 50, var_26_1:getContentSize().height * 0.5 + 10)
		local var_26_3 = ccp(200, 0)

		if arg_24_1.side == "def" then
			var_26_2 = ccp(var_24_3:getContentSize().width - var_26_1:getContentSize().width * 0.5 + 50, var_26_1:getContentSize().height * 0.5 + 10)
			var_26_3 = ccp(-200, 0)
		end

		var_26_1:setPosition(var_26_2)
		var_24_3:addChild(var_26_1)

		local var_26_4 = CCMoveBy:create(0.5, var_26_3)

		var_26_1:runAction(var_26_4)
	end

	local function var_24_6()
		local var_27_0 = arg_24_1.leftPic

		if arg_24_1.side == "att" then
			var_27_0 = arg_24_1.rightPic
		end

		local var_27_1 = CCSprite:create(rmgr.getGeneralBust(var_27_0))
		local var_27_2 = ccp(var_27_1:getContentSize().width * 0.5 - 50, var_27_1:getContentSize().height * 0.5 + 10)
		local var_27_3 = ccp(200, 0)

		if arg_24_1.side == "att" then
			var_27_2 = ccp(var_24_3:getContentSize().width - var_27_1:getContentSize().width * 0.5 + 50, var_27_1:getContentSize().height * 0.5 + 10)
			var_27_3 = ccp(-200, 0)
		end

		var_27_1:setPosition(var_27_2)
		var_24_3:addChild(var_27_1)

		local var_27_4 = CCMoveBy:create(0.5, var_27_3)

		var_27_1:runAction(var_27_4)

		local var_27_5 = rmgr.getAnimation("att_jitui")
		local var_27_6 = CCAnimation:createWithSpriteFrames(var_27_5, 0.08)
		local var_27_7 = CCAnimate:create(var_27_6)
		local var_27_8 = CCSprite:create()

		if arg_24_1.side == "def" then
			var_27_8:setFlipX(true)
		end

		var_27_8:setPosition(ccp(var_24_3:getContentSize().width / 2, var_24_3:getContentSize().height / 2))
		var_24_3:addChild(var_27_8, 2)

		local var_27_9 = CCTargetedAction:create(var_27_8, var_27_7)
		local var_27_10 = CCMoveBy:create(0.5, ccp(-var_27_3.x, 0))
		local var_27_11 = CCFadeOut:create(0.5)
		local var_27_12 = CCSpawn:createWithTwoActions(var_27_10, var_27_11)
		local var_27_13 = CCTargetedAction:create(var_27_1, var_27_12)

		local function var_27_14()
			amgr.playEffect(enumAudioFile.battle_wujiang_didang)
		end

		local var_27_15 = CCSprite:createWithSpriteFrameName("stategyText_jtdj.png")
		local var_27_16 = ccp(var_27_2.x + var_27_3.x, var_24_3:getContentSize().height * 0.3)

		var_27_15:setPosition(var_27_16)
		var_24_3:addChild(var_27_15)
		var_27_15:setVisible(false)

		local function var_27_17()
			var_27_15:setVisible(true)
		end

		local var_27_18 = CCArray:create()

		var_27_18:addObject(CCCallFuncN:create(var_24_5))
		var_27_18:addObject(CCCallFuncN:create(var_27_14))
		var_27_18:addObject(CCDelayTime:create(0.5))
		var_27_18:addObject(var_27_9)
		var_27_18:addObject(var_27_13)
		var_27_18:addObject(CCCallFuncN:create(var_27_17))
		var_27_18:addObject(CCDelayTime:create(1.5))
		var_27_18:addObject(CCCallFuncN:create(var_24_4))
		var_27_1:runAction(CCSequence:create(var_27_18))
	end

	var_24_2:addObject(CCCallFuncN:create(var_24_6))

	local var_24_7 = CCSequence:create(var_24_2)

	var_24_0:runAction(var_24_7)
	arg_24_0:addChild(var_24_0, 1)
end
