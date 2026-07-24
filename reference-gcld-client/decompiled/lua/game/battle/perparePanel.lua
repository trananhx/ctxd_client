TAG_CARD_ATTACKER = BATTLE_SIDE_ATTACK
TAG_CARD_DEFENDER = BATTLE_SIDE_DEFENDER
CARD_DEPTH = 35
attCardPosition = nil
defCardPositon = nil
fightButtonPos = nil

local var_0_0 = {}
local var_0_1

function createPerparePanel(arg_1_0, arg_1_1, arg_1_2)
	rmgr.loadResource("res/ui/battle/battlePrepare/battlePrepare.plist")

	local var_1_0 = CCLayerColor:create(ccc4(0, 0, 0, 114), visibleSize.width, visibleSize.height)

	local function var_1_1(arg_2_0)
		if arg_2_0 == "enter" then
			if var_1_0.onEnter then
				var_1_0:onEnter()
			end
		elseif arg_2_0 == "exit" and var_1_0.onExit then
			var_1_0:onExit()
		end
	end

	var_1_0:registerScriptHandler(var_1_1)
	var_1_0:setPosition(ccp(0, 0))

	var_0_0 = {}

	local var_1_2 = false
	local var_1_3 = {
		x = 0,
		y = 0
	}
	local var_1_4 = {
		x = 0,
		y = 0
	}
	local var_1_5 = {
		x = 0,
		y = 0
	}
	local var_1_6 = false
	local var_1_7 = false
	local var_1_8

	local function var_1_9()
		local var_3_0 = ""
		local var_3_1 = false
		local var_3_2 = false
		local var_3_3 = {}

		for iter_3_0, iter_3_1 in pairs(var_0_0) do
			local var_3_4 = 1

			while var_3_3[var_3_4] ~= nil and iter_3_0 > var_3_3[var_3_4].pos do
				var_3_4 = var_3_4 + 1
			end

			table.insert(var_3_3, var_3_4, {
				card = iter_3_1,
				pos = iter_3_0
			})
		end

		for iter_3_2, iter_3_3 in ipairs(var_3_3) do
			if iter_3_3.card then
				local var_3_5 = iter_3_3.card

				if var_3_5.state == STATE_CARD_NORLMAL or var_3_5.state == STATE_CARD_NOT_FULL then
					var_3_0 = var_3_0 .. tostring(var_3_5.userData.generalId) .. "#"
					var_3_1 = true

					if var_3_5.userData.troopId ~= 0 and var_3_5.userData.armyHp < var_3_5.userData.armyHpMax then
						var_3_2 = true
					end
				end
			end
		end

		log.info("武将排序：", var_3_0)

		local function var_3_6()
			if arg_1_0.battleType == battleType.BATTLE_DEMO then
				arg_1_0.startDemoFight()
			elseif var_3_1 then
				if arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
					kfcmgr.sendRequest(arg_1_0.handlerBattleStart, actions.kfbattleStart, arg_1_0.targetId, var_3_0)
				else
					cmgr.sendRequest(arg_1_0.handlerBattleStart, actions.battleStart, arg_1_0.terrain, arg_1_0.battleType, 0, var_3_0, 1, arg_1_0.targetId)
				end
			else
				messageBox.alert(language.get(190080), language.get(190106))
			end
		end

		local function var_3_7()
			if user.player.playerLv <= 30 then
				for iter_5_0, iter_5_1 in pairs(var_0_0) do
					if iter_5_1.userData.armyHpMax ~= iter_5_1.userData.armyHp then
						local var_5_0, var_5_1 = tool.getPositionInScreen(iter_5_1:getCardSprite())

						guide.control.loadGuide2(5, var_5_0, var_5_1 - 100, true, language.get(190203))

						return
					end
				end
			end
		end

		if var_3_2 then
			if user.player.playerLv <= 29 then
				var_3_7()
			else
				messageBox.confirm(language.get(190200), var_3_6, language.get(10001), var_3_7)
			end
		elseif arg_1_0.noEquip ~= nil and arg_1_0.noEquip ~= "" and user.curMainTask.taskId > 45 then
			messageBox.confirm(language.get(190205, arg_1_0.noEquip), var_3_6, language.get(10001), var_3_7)
		else
			var_3_6()
		end
	end

	local function var_1_10(arg_6_0)
		local var_6_0 = arg_6_0:getCardNode():getPositionX()
		local var_6_1 = 67
		local var_6_2
		local var_6_3

		for iter_6_0 = 0, 4 do
			local var_6_4 = var_0_0[iter_6_0]

			if arg_6_0.userData and arg_6_0.userData.index and arg_6_0.userData.index ~= iter_6_0 and var_6_4 then
				local var_6_5 = var_0_1[iter_6_0]
				local var_6_6 = math.abs(var_6_0 - var_6_5.x)

				if not var_6_3 then
					var_6_3 = var_6_6
					var_6_2 = iter_6_0
				elseif var_6_6 < var_6_3 then
					var_6_3 = var_6_6
					var_6_2 = iter_6_0
				end
			end
		end

		return var_6_2
	end

	local function var_1_11(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0
		local var_7_1
		local var_7_2 = 5

		if arg_7_2 == "att" then
			var_7_0 = TAG_CARD_ATTACKER
			var_7_1 = attCardPosition
		else
			var_7_0 = TAG_CARD_DEFENDER
			var_7_1 = defCardPositon
		end

		for iter_7_0 = 1, var_7_2 do
			local var_7_3 = arg_7_1[iter_7_0]
			local var_7_4 = require("lua/game/battle/widget/generalCard")

			if var_7_3 then
				local var_7_5 = var_7_4.createGeneralCard()

				var_7_3.side = arg_7_2
				var_7_3.index = iter_7_0 - 1

				local var_7_6 = var_7_5:create(arg_1_0, var_7_3, arg_1_0.figthSide == arg_7_2)

				if var_7_6 then
					local var_7_7 = var_7_3.index

					if var_7_7 then
						local var_7_8 = var_7_1[var_7_7]

						var_7_6:setPosition(var_7_8)
						arg_7_0:addChild(var_7_6, 1, var_7_0)

						if arg_1_0.figthSide == arg_7_2 then
							var_0_0[var_7_7] = var_7_5
							var_0_1 = var_7_1
						end
					end
				end
			else
				local var_7_9 = var_7_4.createEmptyCard()
				local var_7_10 = var_7_1[iter_7_0 - 1]

				var_7_9:setPosition(var_7_10)
				arg_7_0:addChild(var_7_9, 1, var_7_0)
			end
		end
	end

	local function var_1_12(arg_8_0)
		if arg_1_0.terrain then
			local var_8_0 = terrainType[arg_1_0.terrain]
			local var_8_1 = CCStrokeLabelTTF:create(var_8_0, "Thonburi", 24)

			var_8_1:setPosition(ccp(531, 33))
			arg_8_0:addChild(var_8_1)
		end
	end

	local function var_1_13(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = CCSprite:createWithSpriteFrameName("battle_pre_gen_prep_vs.png")

		var_9_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		arg_9_0:addChild(var_9_0)
		var_1_12(var_9_0)

		if not attCardPosition or not defCardPositon then
			local var_9_1 = 155
			local var_9_2 = 216

			attCardPosition = {}
			defCardPositon = {}

			local var_9_3 = visibleSize.width * 0.5
			local var_9_4 = visibleSize.height * 0.5
			local var_9_5 = var_9_3 + var_9_1 * 2.5
			local var_9_6 = var_9_4 + 180
			local var_9_7 = var_9_3 - var_9_1 * 2.5
			local var_9_8 = var_9_4 - 180

			fightButtonPos = ccp(var_9_3 + var_9_1 * 2.5, var_9_4)

			for iter_9_0 = 0, 4 do
				local var_9_9 = var_9_5 - (var_9_1 * 0.5 + var_9_1 * iter_9_0)
				local var_9_10 = var_9_7 + (var_9_1 * 0.5 + var_9_1 * iter_9_0)

				attCardPosition[iter_9_0] = ccp(var_9_9, var_9_6)
				defCardPositon[iter_9_0] = ccp(var_9_10, var_9_8)
			end
		end

		var_1_11(arg_9_0, arg_9_1, "att")
		var_1_11(arg_9_0, arg_9_2, "def")
		log.info(" attackers : ", #arg_9_1)

		guide.shouldShowPrepareGuide = false

		if arg_9_2[2] and arg_9_2[2].generalId == 10008 and arg_9_1[2] and arg_9_1[2].generalId == 225 then
			guide.shouldShowPrepareGuide = true

			log.info("开始提示")
			log.info("general name , id ", arg_9_1[2].generalName, arg_9_1[2].generalId)
			log.info("card position :", tool.getPositionInScreen(var_0_0[1]:getCardSprite()))

			local var_9_11, var_9_12 = tool.getPositionInScreen(var_0_0[1]:getCardSprite())

			guide.control.loadGuide2(5, var_9_11, var_9_12 - 150, false, language.get(190201))

			local var_9_13 = var_0_0[1]:getCardSprite():getChildByTag(TAG_CARD_LIGHT)

			var_9_13:setVisible(true)

			local var_9_14 = CCArray:create()

			var_9_14:addObject(CCFadeIn:create(0.3))
			var_9_14:addObject(CCFadeOut:create(0.3))

			local var_9_15 = CCSequence:create(var_9_14)
			local var_9_16 = CCRepeatForever:create(tolua.cast(var_9_15, "CCActionInterval"))

			var_9_13:runAction(var_9_16)
			rmgr.loadResource("res/ui/instance/instanceMap.plist")

			local var_9_17 = tool.spriteByName("fubenDituShouzhi.PNG")

			var_9_17:setPosition(ccp(var_9_11, var_9_12))
			arg_9_0:addChild(var_9_17, 101)

			local var_9_18 = CCArray:create()

			var_9_18:addObject(CCFadeIn:create(0.3))
			var_9_18:addObject(CCCallFuncN:create(function(arg_10_0)
				var_9_17:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi1.PNG"))
			end))
			var_9_18:addObject(CCMoveBy:create(0.8, ccp(175, 0)))
			var_9_18:addObject(CCDelayTime:create(0.3))
			var_9_18:addObject(CCCallFuncN:create(function(arg_11_0)
				var_9_17:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi.PNG"))
				var_9_17:setPosition(ccp(var_9_11, var_9_12))
			end))
			var_9_18:addObject(CCDelayTime:create(0.3))
			var_9_18:addObject(CCCallFuncN:create(function(arg_12_0)
				var_9_17:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi1.PNG"))
			end))
			var_9_18:addObject(CCMoveBy:create(0.8, ccp(175, 0)))
			var_9_18:addObject(CCDelayTime:create(0.3))
			var_9_18:addObject(CCCallFuncN:create(function(arg_13_0)
				var_9_17:removeFromParentAndCleanup(true)
			end))

			local var_9_19 = CCSequence:create(var_9_18)

			var_9_17:runAction(var_9_19)
		end

		local var_9_20 = CCSprite:createWithSpriteFrameName("battle_pre_btn_atta_lig.png")

		var_9_20:setPosition(fightButtonPos)

		local var_9_21 = CCArray:create()

		var_9_21:addObject(CCFadeOut:create(0.3))
		var_9_21:addObject(CCFadeIn:create(0.3))

		local var_9_22 = CCSequence:create(var_9_21)

		var_9_20:runAction(CCRepeatForever:create(var_9_22))
		arg_9_0:addChild(var_9_20, 2)

		local var_9_23 = CCMenu:create()

		var_9_23:setPosition(ccp(0, 0))

		local var_9_24 = CCSprite:createWithSpriteFrameName("battle_pre_btn_atta.png")
		local var_9_25 = CCSprite:createWithSpriteFrameName("battle_pre_btn_atta_lig.png")
		local var_9_26 = CCMenuItemSprite:create(var_9_24, var_9_25)

		var_9_26:registerScriptTapHandler(var_1_9)
		var_9_26:setPosition(fightButtonPos)
		var_9_23:addChild(var_9_26)
		arg_9_0:addChild(var_9_23, 2)

		if arg_9_2[1] and arg_9_2[1].generalId == 10001 and arg_9_1[1] and arg_9_1[1].generalId == 259 then
			log.info("第一个副本")

			local var_9_27, var_9_28 = tool.getPositionInScreen(var_9_20)

			guide.control.loadGuide2(5, var_9_27, var_9_28 - 120, false, language.get(200129))
		end

		showMubingTips()
	end

	local function var_1_14(arg_14_0)
		local var_14_0

		if arg_1_0.fightTitle == 401 or arg_1_0.fightTitle == 10000 or arg_1_0.fightTitle == 160001 then
			rmgr.loadResource("res/ui/battle/fightTitle/fightTitle.plist")

			var_14_0 = "fight_title_" .. arg_1_0.fightTitle .. ".png"
		end

		if var_14_0 then
			local var_14_1 = CCSprite:createWithSpriteFrameName("battle_flag.png")

			var_14_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.83))
			arg_14_0:addChild(var_14_1)

			local var_14_2 = CCSprite:createWithSpriteFrameName(var_14_0)

			var_14_2:setPosition(ccp(var_14_1:getContentSize().width * 0.5, var_14_1:getContentSize().height * 0.5))
			var_14_1:addChild(var_14_2)
		end
	end

	local function var_1_15(arg_15_0, arg_15_1)
		var_1_3.x = arg_15_0
		var_1_3.y = arg_15_1
		var_1_5.x = arg_15_0
		var_1_5.y = arg_15_1
		var_1_2 = true

		if var_1_7 then
			return true
		end

		if var_1_8 then
			var_1_8:loseForce()
		end

		for iter_15_0, iter_15_1 in pairs(var_0_0) do
			local var_15_0 = iter_15_1:getCardSprite()

			if tool.checkIfTouch(var_15_0, arg_15_0, arg_15_1) and iter_15_1.isSelf then
				var_1_8 = iter_15_1

				var_1_0:reorderChild(iter_15_1:getCardNode(), 1)
				var_1_8:getForce()

				break
			end
		end

		return true
	end

	local function var_1_16(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_0 - var_1_5.x

		var_1_5.x = arg_16_0
		var_1_5.y = arg_16_1

		if var_1_8 and var_16_0 ~= 0 and math.abs(var_1_3.x - var_1_5.x) > 50 then
			log.info(" selectCard.userData.generalId :", var_1_8.userData.generalId)

			if var_1_8.userData.generalId == 225 and var_1_8.userData.index ~= 0 and guide.shouldShowPrepareGuide then
				guide.shouldShowPrepareGuide = false

				log.info("添加提示：开始拖动")

				local var_16_1, var_16_2 = tool.getPositionInScreen(var_0_0[0]:getCardSprite())

				guide.control.loadGuide2(5, var_16_1, var_16_2 - 150, true, language.get(190202))
			end

			local var_16_3 = var_1_8:getCardNode()
			local var_16_4 = var_16_3:getPositionX()
			local var_16_5 = var_16_3:getPositionY()
			local var_16_6 = var_16_4 + var_16_0

			var_16_3:setPosition(ccp(var_16_6, var_16_5))
		end

		return true
	end

	local function var_1_17(arg_17_0, arg_17_1)
		var_1_4.x = arg_17_0
		var_1_4.y = arg_17_1
		var_1_2 = false

		if var_1_8 then
			log.info("结束提示")
			guide.ui.setVisible(false)

			var_1_7 = true

			local function var_17_0()
				var_1_7 = false

				if var_1_8 then
					var_1_8:loseForce()

					var_1_8 = nil
				end

				if arg_1_0.battleType == battleType.BATTLE_JIAOZHEN then
					local var_18_0 = ""
					local var_18_1 = false
					local var_18_2 = false
					local var_18_3 = {}

					for iter_18_0, iter_18_1 in pairs(var_0_0) do
						local var_18_4 = 1

						while var_18_3[var_18_4] ~= nil and iter_18_0 > var_18_3[var_18_4].pos do
							var_18_4 = var_18_4 + 1
						end

						table.insert(var_18_3, var_18_4, {
							card = iter_18_1,
							pos = iter_18_0
						})
					end

					for iter_18_2, iter_18_3 in ipairs(var_18_3) do
						if iter_18_3.card then
							local var_18_5 = iter_18_3.card

							if var_18_5.state == STATE_CARD_NORLMAL or var_18_5.state == STATE_CARD_NOT_FULL then
								var_18_0 = var_18_0 .. tostring(var_18_5.userData.generalId) .. "#"
								var_18_1 = true

								if var_18_5.userData.troopId ~= 0 and var_18_5.userData.armyHp < var_18_5.userData.armyHpMax then
									local var_18_6 = true
								end
							end
						end
					end

					if var_18_1 then
						cmgr.sendRequest(function()
							log.info("应战保存阵型成功！")
						end, actions.arenaSaveGids, var_18_0)
					else
						messageBox.alert(language.get(190080), language.get(190106))
					end
				end
			end

			local function var_17_1()
				var_1_6 = false
				var_1_7 = false

				if var_1_8 then
					var_1_8:setVertexZ(0)
					var_1_8:clicked()

					var_1_8 = nil
				end
			end

			if math.abs(var_1_3.x - var_1_4.x) < 10 and math.abs(var_1_3.y - var_1_4.y) < 10 and var_1_6 == false then
				var_17_1()
			else
				local var_17_2 = var_1_10(var_1_8)

				log.info("@@@ move to index ", var_17_2)

				if var_17_2 then
					local var_17_3 = var_0_0[var_17_2]
					local var_17_4 = var_0_1[var_1_8.userData.index]
					local var_17_5 = CCMoveTo:create(0.3, var_17_4)

					var_17_3:runAction(var_17_5)

					local var_17_6 = var_0_1[var_17_3.userData.index]
					local var_17_7 = CCMoveTo:create(0.3, var_17_6)
					local var_17_8 = CCCallFuncN:create(var_17_0)
					local var_17_9 = CCArray:create()

					var_17_9:addObject(var_17_7)
					var_17_9:addObject(var_17_8)

					local var_17_10 = CCSequence:create(var_17_9)

					var_1_8:runAction(var_17_10)

					var_0_0[var_17_3.userData.index] = var_1_8
					var_0_0[var_1_8.userData.index] = var_17_3

					local var_17_11 = var_1_8.userData.index

					var_1_8.userData.index = var_17_3.userData.index
					var_17_3.userData.index = var_17_11

					var_1_8:resetIndex()
					var_17_3:resetIndex()
				else
					local var_17_12 = var_0_1[var_1_8.userData.index]
					local var_17_13 = CCMoveTo:create(0.3, var_17_12)
					local var_17_14 = CCArray:create()

					var_17_14:addObject(var_17_13)
					var_17_14:addObject(CCCallFuncN:create(var_17_0))

					local var_17_15 = CCSequence:create(var_17_14)

					var_1_8:runAction(var_17_15)
				end
			end
		end

		return true
	end

	local function var_1_18(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == CCTOUCHBEGAN then
			return var_1_15(arg_21_1, arg_21_2)
		elseif arg_21_0 == CCTOUCHMOVED then
			return var_1_16(arg_21_1, arg_21_2)
		elseif arg_21_0 == CCTOUCHENDED then
			return var_1_17(arg_21_1, arg_21_2)
		end
	end

	function var_1_0.onEnter(arg_22_0)
		return
	end

	function var_1_0.onExit(arg_23_0)
		guide.ui.setVisible(false)
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_18)
	var_1_13(var_1_0, arg_1_1, arg_1_2)
	var_1_14(var_1_0)

	return var_1_0
end

function showMubingTips()
	if user.player.playerLv <= 30 and var_0_0 then
		for iter_24_0, iter_24_1 in pairs(var_0_0) do
			log.info(iter_24_1.userData.armyHp .. "/" .. iter_24_1.userData.armyHpMax)

			if iter_24_1.userData.armyHpMax ~= iter_24_1.userData.armyHp then
				local var_24_0, var_24_1 = tool.getPositionInScreen(iter_24_1:getCardSprite())

				guide.control.loadGuide2(5, var_24_0, var_24_1 - 100, true, language.get(190203))

				return
			end
		end
	end
end
