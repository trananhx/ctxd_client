require("lua/game/battle/reportHandler/2")
require("lua/game/battle/reportHandler/3")
require("lua/game/battle/reportHandler/7")
require("lua/game/battle/reportHandler/8")
require("lua/game/battle/reportHandler/10")
require("lua/game/battle/reportHandler/11")
require("lua/game/battle/reportHandler/12")
require("lua/game/battle/reportHandler/13")
require("lua/game/battle/reportHandler/14")
require("lua/game/battle/reportHandler/15")
require("lua/game/battle/reportHandler/16")
require("lua/game/battle/reportHandler/18")
require("lua/game/battle/reportHandler/19")
require("lua/game/battle/reportHandler/20")
require("lua/game/battle/reportHandler/25")
require("lua/game/battle/reportHandler/26")
require("lua/game/battle/reportHandler/27")
require("lua/game/battle/reportHandler/28")
require("lua/game/battle/reportHandler/29")
require("lua/game/battle/reportHandler/30")
require("lua/game/battle/reportHandler/31")
require("lua/game/battle/reportHandler/32")
require("lua/game/battle/reportHandler/33")
require("lua/game/battle/reportHandler/34")
require("lua/game/battle/reportHandler/35")
require("lua/game/battle/reportHandler/36")
require("lua/game/battle/reportHandler/37")
require("lua/game/battle/reportHandler/38")
require("lua/game/battle/reportHandler/39")
require("lua/game/battle/reportHandler/40")
require("lua/game/battle/reportHandler/41")
require("lua/game/battle/reportHandler/42")
require("lua/game/battle/reportHandler/43")
require("lua/game/battle/reportHandler/44")
require("lua/game/battle/reportHandler/45")
require("lua/game/battle/reportHandler/46")
require("lua/game/battle/reportHandler/47")
require("lua/game/battle/reportHandler/48")
require("lua/game/battle/reportHandler/49")
require("lua/game/battle/reportHandler/50")
require("lua/game/battle/reportHandler/51")
require("lua/game/battle/reportHandler/52")
require("lua/game/battle/reportHandler/53")
require("lua/game/battle/reportHandler/54")
require("lua/game/battle/reportHandler/55")
require("lua/game/battle/reportHandler/57")
require("lua/game/battle/reportHandler/59")
require("lua/game/battle/fightController")
require("lua/game/battle/tacticsLayer")
require("lua/game/battle/widget/playerInfoPanel")
require("lua/game/battle/widget/countDownPanel")
require("lua/game/battle/widget/fightNotice")
require("lua/game/battle/widget/armyInfo")
require("lua/game/battle/stategyEffect")

local var_0_0 = CCDirector:sharedDirector():getScheduler()

function createFightLayer(arg_1_0)
	local var_1_0 = createBaseLayer()
	local var_1_1 = {}

	arg_1_0.fightControl = var_1_1
	var_1_1.updateSchedulerEntry = nil

	function var_1_1.init(arg_2_0)
		log.info("@@ 初始化战斗数据")

		var_1_1.timerControl = nil
		var_1_1.defPosition = {}
		var_1_1.attPosition = {}
		var_1_1.state = BATTLE_STATE_IDLE
		var_1_1.waitForDemo = 0
		var_1_1.lastTime = 0
		var_1_1.reportFrame = 0
		var_1_1.lastResult = 3
		var_1_1.battleData = {}
		var_1_1.battleData.battleId = nil
		var_1_1.battleData.type = 0
		var_1_1.battleData.attArmyInfo = {}
		var_1_1.battleData.defArmyInfo = {}
		var_1_1.firstGetTimer = true
		var_1_1.inFastBattleState = false

		initPosition(var_1_1.attPosition, var_1_1.defPosition)

		var_1_1.currentGapX = math.abs(var_1_1.attPosition[1].x - var_1_1.attPosition[0].x)
		var_1_1.currentGapY = math.abs(var_1_1.attPosition[1].y - var_1_1.attPosition[0].y)
	end

	function var_1_1.clearup(arg_3_0)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.tacticsPanel)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.generalListPanel.attacker)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.generalListPanel.defender)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.generalInfoPanel.attacker)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.generalInfoPanel.defender)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.fightHelper)
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.timer)
		arg_1_0.layerTabel.fightLayer:removeAllChildrenWithCleanup(true)
	end

	function var_1_1.endAnimation()
		var_1_1.changeState(BATTLE_STATE_IDLE)
	end

	function var_1_1.doNothing()
		return
	end

	function var_1_1.countCurrent(arg_6_0, arg_6_1)
		local var_6_0 = 0

		if arg_6_0 == "att" then
			for iter_6_0 = 0, arg_6_1 - 1 do
				if var_1_1.battleData.attArmyInfo[iter_6_0] and var_1_1.battleData.attArmyInfo[iter_6_0].data.troopType == 43 then
					var_6_0 = var_6_0 + 1
				end
			end

			if var_1_1.battleData.attArmyInfo[arg_6_1] and var_1_1.battleData.attArmyInfo[arg_6_1].data.troopType == 43 then
				var_6_0 = var_6_0 + 0.5
			end

			local var_6_1 = var_1_1.attPosition[0].x - var_1_1.currentGapX * (arg_6_1 + var_6_0 * 1.4)
			local var_6_2 = var_1_1.attPosition[0].y - var_1_1.currentGapY * (arg_6_1 + var_6_0 * 1.4)

			return ccp(var_6_1, var_6_2)
		elseif arg_6_0 == "def" then
			for iter_6_1 = 0, arg_6_1 - 1 do
				if var_1_1.battleData.defArmyInfo[iter_6_1] and var_1_1.battleData.defArmyInfo[iter_6_1].data.troopType == 43 then
					var_6_0 = var_6_0 + 1
				end
			end

			if var_1_1.battleData.defArmyInfo[arg_6_1] and var_1_1.battleData.defArmyInfo[arg_6_1].data.troopType == 43 then
				var_6_0 = var_6_0 + 0.5
			end

			local var_6_3 = var_1_1.defPosition[0].x + var_1_1.currentGapX * (arg_6_1 + var_6_0 * 1.4)
			local var_6_4 = var_1_1.defPosition[0].y + var_1_1.currentGapY * (arg_6_1 + var_6_0 * 1.4)

			return ccp(var_6_3, var_6_4)
		end
	end

	function var_1_1.stategyShow(arg_7_0)
		if arg_7_0 then
			local var_7_0 = 0

			if arg_7_0.side == "att" then
				var_7_0 = arg_1_0.currentAttacker.quality
			else
				var_7_0 = arg_1_0.currentDefender.quality
			end

			createStategyAnimation(arg_1_0.layerTabel.effectLayer, arg_7_0, var_7_0, var_1_1)
		end
	end

	function var_1_1.doTactics(arg_8_0)
		local var_8_0 = var_1_1.battleData.attArmyInfo[0]
		local var_8_1 = var_1_1.battleData.defArmyInfo[0]

		if var_8_0 and var_8_1 then
			var_8_0:doTactics(arg_8_0, var_1_1.endAnimation)
			var_8_1:doTactics(arg_8_0, var_1_1.endAnimation)
		end
	end

	function var_1_1.loseTroops(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		if arg_9_0 then
			local var_9_0 = false
			local var_9_1

			if arg_9_1 == "att" then
				var_9_1 = var_1_1.battleData.attArmyInfo
			else
				var_9_1 = var_1_1.battleData.defArmyInfo
			end

			if var_9_1 then
				for iter_9_0, iter_9_1 in pairs(arg_9_0) do
					for iter_9_2, iter_9_3 in pairs(var_9_1) do
						if iter_9_3 and iter_9_3.data.row == iter_9_1.row then
							iter_9_3:hitted(var_1_1.endAnimation)
							iter_9_3:loseTroops(iter_9_1, arg_9_2, arg_9_3)

							var_9_0 = true
						end
					end
				end
			end

			if var_9_0 == false then
				var_1_1.endAnimation()
			end
		else
			var_1_1.endAnimation()
		end
	end

	function var_1_1.fight(arg_10_0)
		local var_10_0 = var_1_1.battleData.attArmyInfo[0]
		local var_10_1 = var_1_1.battleData.defArmyInfo[0]

		if var_10_0 and var_10_1 then
			var_10_0:fight(arg_10_0.attDead, arg_1_0.tacticsIcon.att, var_1_1.endAnimation)
			var_10_1:fight(arg_10_0.defDead, arg_1_0.tacticsIcon.def, var_1_1.endAnimation)

			if var_10_0.data.troopType == 43 then
				local var_10_2 = CCSprite:create()

				var_10_2:setPosition(var_1_1.attPosition[0])

				local var_10_3 = rmgr.getAnimation("juexingZhaoyun")
				local var_10_4 = CCAnimation:createWithSpriteFrames(var_10_3, 0.06)
				local var_10_5 = CCAnimate:create(var_10_4)
				local var_10_6 = CCArray:create()

				var_10_6:addObject(CCRepeat:create(var_10_5, #arg_10_0.attDead))
				var_10_6:addObject(CCCallFuncN:create(function()
					var_10_2:removeFromParentAndCleanup(true)
				end))
				var_10_2:runAction(CCSequence:create(var_10_6))
				arg_1_0.layerTabel.effectLayer:addChild(var_10_2, 1)
			end

			if var_10_1.data.troopType == 43 then
				local var_10_7 = CCSprite:create()

				var_10_7:setPosition(var_1_1.defPosition[0])
				var_10_7:setScale(-1)

				local var_10_8 = rmgr.getAnimation("juexingZhaoyun")
				local var_10_9 = CCAnimation:createWithSpriteFrames(var_10_8, 0.06)
				local var_10_10 = CCAnimate:create(var_10_9)
				local var_10_11 = CCArray:create()

				var_10_11:addObject(CCRepeat:create(var_10_10, #arg_10_0.defDead))
				var_10_11:addObject(CCCallFuncN:create(function()
					var_10_7:removeFromParentAndCleanup(true)
				end))
				var_10_7:runAction(CCSequence:create(var_10_11))
				arg_1_0.layerTabel.effectLayer:addChild(var_10_7, 1)
			end

			if arg_10_0.troops then
				local var_10_12 = false
				local var_10_13 = false
				local var_10_14 = false
				local var_10_15 = false

				for iter_10_0, iter_10_1 in ipairs(arg_10_0.troops) do
					if iter_10_1.att then
						local var_10_16 = var_1_1.battleData.attArmyInfo

						for iter_10_2, iter_10_3 in pairs(var_10_16) do
							if iter_10_1.att[iter_10_3.data.row] then
								local var_10_17 = CCArray:create()

								var_10_17:addObject(CCDelayTime:create(iter_10_0 * 0.5))

								local function var_10_18()
									iter_10_3:loseTroops(iter_10_1.att[iter_10_3.data.row])

									if var_10_1.data.troopType == 56 then
										iter_10_3:showZhurongHurt()
									end
								end

								var_10_17:addObject(CCCallFuncN:create(var_10_18))

								local var_10_19 = CCSequence:create(var_10_17)
								local var_10_20 = CCNode:create()

								var_10_20:runAction(var_10_19)
								iter_10_3:addChild(var_10_20)
							end
						end

						if var_10_1.data.troopType == 44 and var_10_12 == false then
							var_10_12 = true

							local var_10_21 = CCSprite:create()

							var_10_21:setPosition(var_1_1.attPosition[1])

							local var_10_22 = rmgr.getAnimation("xiahouDef")
							local var_10_23 = CCAnimation:createWithSpriteFrames(var_10_22, 0.05)
							local var_10_24 = CCAnimate:create(var_10_23)
							local var_10_25 = CCArray:create()

							var_10_25:addObject(CCDelayTime:create(0.5))
							var_10_25:addObject(CCRepeat:create(var_10_24, #arg_10_0.attDead))
							var_10_25:addObject(CCCallFuncN:create(function()
								var_10_21:removeFromParentAndCleanup(true)
							end))
							var_10_21:runAction(CCSequence:create(var_10_25))
							arg_1_0.layerTabel.effectLayer:addChild(var_10_21, 1)
						end

						if var_10_1.data.hasCar and var_10_14 == false and var_10_1.data.carId == 51 then
							var_10_14 = true

							local var_10_26 = CCSprite:create()

							var_10_26:setPosition(var_1_1.attPosition[1])

							local var_10_27 = rmgr.getAnimation("carFireDef")
							local var_10_28 = CCAnimation:createWithSpriteFrames(var_10_27, 0.05)
							local var_10_29 = CCAnimate:create(var_10_28)
							local var_10_30 = CCArray:create()

							var_10_30:addObject(CCDelayTime:create(0.5))
							var_10_30:addObject(CCRepeat:create(var_10_29, #arg_10_0.attDead))
							var_10_30:addObject(CCCallFuncN:create(function()
								var_10_26:removeFromParentAndCleanup(true)
							end))
							var_10_26:runAction(CCSequence:create(var_10_30))
							arg_1_0.layerTabel.effectLayer:addChild(var_10_26, 1)
						end
					end

					if iter_10_1.def then
						local var_10_31 = var_1_1.battleData.defArmyInfo

						for iter_10_4, iter_10_5 in pairs(var_10_31) do
							if iter_10_1.def[iter_10_5.data.row] then
								local var_10_32 = CCArray:create()

								var_10_32:addObject(CCDelayTime:create(iter_10_0 * 0.5))

								local function var_10_33()
									iter_10_5:loseTroops(iter_10_1.def[iter_10_5.data.row])

									if var_10_0.data.troopType == 56 then
										iter_10_5:showZhurongHurt()
									end
								end

								var_10_32:addObject(CCCallFuncN:create(var_10_33))

								local var_10_34 = CCSequence:create(var_10_32)
								local var_10_35 = CCNode:create()

								var_10_35:runAction(var_10_34)
								iter_10_5:addChild(var_10_35)
							end
						end

						if var_10_0.data.troopType == 44 and var_10_13 == false then
							var_10_13 = true

							local var_10_36 = CCSprite:create()

							var_10_36:setPosition(var_1_1.defPosition[1])

							local var_10_37 = rmgr.getAnimation("xiahouAtt")
							local var_10_38 = CCAnimation:createWithSpriteFrames(var_10_37, 0.05)
							local var_10_39 = CCAnimate:create(var_10_38)
							local var_10_40 = CCArray:create()

							var_10_40:addObject(CCDelayTime:create(0.5))
							var_10_40:addObject(CCRepeat:create(var_10_39, #arg_10_0.defDead))
							var_10_40:addObject(CCCallFuncN:create(function()
								var_10_36:removeFromParentAndCleanup(true)
							end))
							var_10_36:runAction(CCSequence:create(var_10_40))
							arg_1_0.layerTabel.effectLayer:addChild(var_10_36, 1)
						end

						if var_10_0.data.hasCar and var_10_15 == false and var_10_0.data.carId == 51 then
							var_10_15 = true

							local var_10_41 = CCSprite:create()

							var_10_41:setPosition(var_1_1.defPosition[1])

							local var_10_42 = rmgr.getAnimation("carFireAtt")
							local var_10_43 = CCAnimation:createWithSpriteFrames(var_10_42, 0.05)
							local var_10_44 = CCAnimate:create(var_10_43)
							local var_10_45 = CCArray:create()

							var_10_45:addObject(CCDelayTime:create(0.5))
							var_10_45:addObject(CCRepeat:create(var_10_44, #arg_10_0.defDead))
							var_10_45:addObject(CCCallFuncN:create(function()
								var_10_41:removeFromParentAndCleanup(true)
							end))
							var_10_41:runAction(CCSequence:create(var_10_45))
							arg_1_0.layerTabel.effectLayer:addChild(var_10_41, 1)
						end
					end
				end
			end

			if arg_10_0.attack then
				if arg_10_0.attack.att then
					local var_10_46 = CCArray:create()

					for iter_10_6, iter_10_7 in ipairs(arg_10_0.attack.att) do
						var_10_46:addObject(CCDelayTime:create(0.5))
						var_10_46:addObject(CCCallFunc:create(function()
							var_10_0:showAttack(iter_10_7)
						end))
					end

					local var_10_47 = CCSequence:create(var_10_46)

					var_10_0:runAction(var_10_47)
				end

				if arg_10_0.attack.def then
					local var_10_48 = CCArray:create()

					for iter_10_8, iter_10_9 in ipairs(arg_10_0.attack.def) do
						var_10_48:addObject(CCDelayTime:create(0.5))
						var_10_48:addObject(CCCallFunc:create(function()
							var_10_1:showAttack(iter_10_9)
						end))
					end

					local var_10_49 = CCSequence:create(var_10_48)

					var_10_1:runAction(var_10_49)
				end
			end
		else
			if var_10_0 then
				var_10_0:fight(arg_10_0.attDead, arg_1_0.tacticsIcon.att, var_1_1.endAnimation)
			end

			if var_10_1 then
				var_10_1:fight(arg_10_0.defDead, arg_1_0.tacticsIcon.def, var_1_1.endAnimation)
			end

			if not var_10_0 and not var_10_1 then
				var_1_1.changeState(BATTLE_STATE_IDLE)
			end
		end
	end

	function var_1_1.destoryCallBack(arg_21_0, arg_21_1)
		local var_21_0

		if arg_21_0 == "att" then
			var_21_0 = var_1_1.battleData.attArmyInfo
		else
			var_21_0 = var_1_1.battleData.defArmyInfo
		end

		if var_21_0 then
			for iter_21_0, iter_21_1 in pairs(var_21_0) do
				if iter_21_1 and iter_21_1.data.row == arg_21_1 then
					var_21_0[iter_21_0] = nil
				end
			end
		end

		eventManager.dispatchEvent(battleEvent.armyUpdate)
	end

	function var_1_1.showPlayerInfo(arg_22_0)
		if arg_22_0 then
			local var_22_0 = createPlayerInfoPanel(arg_22_0, arg_1_0)
			local var_22_1 = uiTag.generalInfoPanel.attacker

			if arg_22_0.side == "att" then
				var_22_1 = uiTag.generalInfoPanel.attacker
				arg_1_0.currentAttacker = arg_22_0

				local var_22_2 = 0

				for iter_22_0 = 0, BATTLE_ROW_NUM do
					if var_1_1.battleData.attArmyInfo[iter_22_0] then
						if var_22_2 == 0 then
							var_22_2 = 1

							var_1_1.battleData.attArmyInfo[iter_22_0]:updateTactics(arg_1_0.currentAttacker.pic)
						elseif var_22_2 == 1 then
							var_22_2 = 2

							var_1_1.battleData.attArmyInfo[iter_22_0]:removeTactics()
						else
							break
						end
					end
				end
			else
				var_22_1 = uiTag.generalInfoPanel.defender
				arg_1_0.currentDefender = arg_22_0

				local var_22_3 = 0

				for iter_22_1 = 0, BATTLE_ROW_NUM do
					if var_1_1.battleData.defArmyInfo[iter_22_1] then
						if var_22_3 == 0 then
							var_22_3 = 1

							var_1_1.battleData.defArmyInfo[iter_22_1]:updateTactics(arg_1_0.currentDefender.pic)
						elseif var_22_3 == 1 then
							var_22_3 = 2

							var_1_1.battleData.defArmyInfo[iter_22_1]:removeTactics()
						else
							break
						end
					end
				end
			end

			tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, var_22_1)
			arg_1_0.layerTabel.uiLayer:addChild(var_22_0, 0, var_22_1)
		end
	end

	function var_1_1.removeRow(arg_23_0, arg_23_1)
		if arg_23_0 == "att" then
			for iter_23_0, iter_23_1 in pairs(var_1_1.battleData.attArmyInfo) do
				if iter_23_1 and iter_23_1.data.row == arg_23_1 then
					iter_23_1:destory(var_1_0, var_1_1.destoryCallBack)
				end
			end
		else
			for iter_23_2, iter_23_3 in pairs(var_1_1.battleData.defArmyInfo) do
				if iter_23_3 and iter_23_3.data.row == arg_23_1 then
					iter_23_3:destory(var_1_0, var_1_1.destoryCallBack)
				end
			end
		end
	end

	function var_1_1.checkRemoveRow(arg_24_0)
		if arg_24_0 == "att" then
			for iter_24_0, iter_24_1 in pairs(var_1_1.battleData.attArmyInfo) do
				if iter_24_1 and iter_24_1.hpInfo and iter_24_1.hpInfo[1] and iter_24_1.hpInfo[1].hp <= 0 then
					iter_24_1:destory(var_1_0, var_1_1.destoryCallBack)
				end
			end
		else
			for iter_24_2, iter_24_3 in pairs(var_1_1.battleData.defArmyInfo) do
				if iter_24_3 and iter_24_3.hpInfo and iter_24_3.hpInfo[1] and iter_24_3.hpInfo[1].hp <= 0 then
					iter_24_3:destory(var_1_0, var_1_1.destoryCallBack)
				end
			end
		end
	end

	function var_1_1.showTimer(arg_25_0)
		var_1_1.timerControl = createCountDownPanel(arg_1_0, math.ceil(arg_1_0.countDown / 1000))

		if arg_25_0 then
			var_1_1.timerControl:setTime(arg_25_0)
		end
	end

	function var_1_1.hideTimer()
		if var_1_1.timerControl then
			var_1_1.timerControl:destory()

			var_1_1.timerControl = nil
		end
	end

	function var_1_1.showTacticsPanel(arg_27_0)
		if arg_27_0.showPanel == 1 then
			var_1_1.clearTacticsSelectPanel()

			local var_27_0 = createTacticsLayer(arg_1_0, arg_27_0)

			arg_1_0.layerTabel.uiLayer:addChild(var_27_0, 0, uiTag.tacticsPanel)
		end
	end

	function var_1_1.clearTacticsSelectPanel()
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.tacticsPanel)
	end

	function var_1_1.formatNotice(arg_29_0)
		local var_29_0 = ""
		local var_29_1 = arg_1_0.currentAttacker

		if arg_29_0.side == "def" then
			var_29_1 = arg_1_0.currentDefender
		end

		local var_29_2 = var_29_1.generalname

		if var_29_1.playerName == user.player.name then
			if arg_1_0.autoSt == 1 then
				var_29_0 = language.get(190102)
			else
				var_29_0 = language.get(190103)
			end
		else
			var_29_0 = string.format("%s(%s)", var_29_2, var_29_1.playerName)
		end

		if arg_29_0.type == 1 then
			var_29_0 = var_29_0 .. language.get(190104)
		else
			local var_29_3 = getTacticsName(arg_29_0.tacticsId)

			var_29_0 = var_29_0 .. language.get(190105, var_29_3)
		end

		return var_29_0
	end

	function var_1_1.showTacticsNotice(arg_30_0)
		local var_30_0 = arg_30_0.stategyShow.att
		local var_30_1 = arg_30_0.stategyShow.def
		local var_30_2 = var_1_1.formatNotice(var_30_1)
		local var_30_3 = var_1_1.formatNotice(var_30_0)
		local var_30_4 = {}

		if var_1_1.lastResult == 1 then
			table.insert(var_30_4, {
				side = "def",
				text = var_30_2
			})
		elseif var_1_1.lastResult == 2 then
			table.insert(var_30_4, {
				side = "att",
				text = var_30_3
			})
		else
			table.insert(var_30_4, {
				side = "att",
				text = var_30_3
			})
			table.insert(var_30_4, {
				side = "def",
				text = var_30_2
			})
		end

		showFightNotice(arg_1_0, var_30_4)
	end

	function var_1_1.hideTacticsNotice()
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.notice)
	end

	function var_1_1.updateTacticsIcon()
		log.info("@@ 更新NPC战术")

		for iter_32_0 = 0, BATTLE_ROW_NUM do
			local var_32_0 = var_1_1.battleData.defArmyInfo[iter_32_0]

			if var_32_0 ~= nil then
				if var_32_0.data.playerId == -1 then
					var_32_0:showTactics(2, var_32_0.data.tacticsId)
				end

				return
			end
		end
	end

	function var_1_1.countDown(arg_33_0)
		arg_1_0.countDown = arg_1_0.countDown - arg_33_0 * 1000
		arg_1_0.roundTimeCost = arg_1_0.roundTimeCost - arg_33_0 * 1000

		if arg_1_0.countDown <= 0 then
			arg_1_0.countDown = 0
		end

		if arg_1_0.canShowTimer then
			local var_33_0 = math.ceil(arg_1_0.countDown / 1000)

			if var_33_0 ~= lastTime then
				var_1_1.lastTime = var_33_0

				var_1_1.showTimer(math.ceil(arg_1_0.countDown / 1000))
			end
		else
			var_1_1.hideTimer()
		end

		if arg_1_0.countDown == 0 then
			arg_1_0.canShowTimer = false
		end
	end

	function var_1_1.addArmy(arg_34_0)
		local var_34_0 = getFightPosition(arg_34_0.data.row, arg_34_0.data.side, var_1_1.battleData)

		log.info("army.data.row: ", arg_34_0.data.row)

		local var_34_1
		local var_34_2 = false

		if arg_34_0.data.side == "att" then
			for iter_34_0, iter_34_1 in pairs(var_1_1.battleData.attArmyInfo) do
				if iter_34_1.data.row == arg_34_0.data.row then
					var_34_2 = true

					break
				end
			end

			if var_34_2 == false then
				var_1_1.battleData.attArmyInfo[var_34_0] = arg_34_0
				var_34_1 = var_1_1.countCurrent("att", var_34_0)
			end
		else
			for iter_34_2, iter_34_3 in pairs(var_1_1.battleData.defArmyInfo) do
				if iter_34_3.data.row == arg_34_0.data.row then
					var_34_2 = true

					break
				end
			end

			if var_34_2 == false then
				var_1_1.battleData.defArmyInfo[var_34_0] = arg_34_0
				var_34_1 = var_1_1.countCurrent("def", var_34_0)
			end
		end

		if var_34_1 and var_34_2 == false then
			arg_34_0:setPosition(var_34_1)
			var_1_0:addChild(arg_34_0)
		end

		eventManager.dispatchEvent(battleEvent.armyUpdate)
	end

	function var_1_1.reorderArmy(arg_35_0)
		for iter_35_0, iter_35_1 in pairs(arg_35_0) do
			if iter_35_1 then
				var_1_0:reorderChild(iter_35_1, BATTLE_ROW_NUM - iter_35_0)
			end
		end
	end

	function var_1_1.startFight(arg_36_0, arg_36_1, arg_36_2)
		local var_36_0 = 0
		local var_36_1 = arg_36_1 or 0
		local var_36_2 = 0.8

		if arg_36_2 then
			var_36_2 = 0.12
		end

		for iter_36_0 = var_36_1, BATTLE_ROW_NUM do
			if var_1_1.battleData.attArmyInfo[iter_36_0] and arg_36_0 ~= "def" then
				local var_36_3 = getMovePosition("att", var_1_1.battleData, var_36_1)

				if var_36_3 and var_36_3 < iter_36_0 then
					var_1_1.battleData.attArmyInfo[var_36_3] = var_1_1.battleData.attArmyInfo[iter_36_0]
					var_1_1.battleData.attArmyInfo[iter_36_0] = nil

					if var_36_0 == 0 then
						var_1_1.battleData.attArmyInfo[var_36_3]:moveTo(var_36_2, var_1_1.countCurrent("att", var_36_3), var_1_1.endAnimation)
					else
						var_1_1.battleData.attArmyInfo[var_36_3]:moveTo(var_36_2, var_1_1.countCurrent("att", var_36_3), var_1_1.doNothing)
					end

					var_36_0 = var_36_0 + 1
				end
			end

			if var_1_1.battleData.defArmyInfo[iter_36_0] and arg_36_0 ~= "att" then
				local var_36_4 = getMovePosition("def", var_1_1.battleData, var_36_1)

				if var_36_4 and var_36_4 < iter_36_0 then
					var_1_1.battleData.defArmyInfo[var_36_4] = var_1_1.battleData.defArmyInfo[iter_36_0]
					var_1_1.battleData.defArmyInfo[iter_36_0] = nil

					if var_36_0 == 0 then
						var_1_1.battleData.defArmyInfo[var_36_4]:moveTo(var_36_2, var_1_1.countCurrent("def", var_36_4), var_1_1.endAnimation)
					else
						var_1_1.battleData.defArmyInfo[var_36_4]:moveTo(var_36_2, var_1_1.countCurrent("def", var_36_4), var_1_1.doNothing)
					end

					var_36_0 = var_36_0 + 1
				end
			end
		end

		if var_36_0 == 0 then
			var_1_1.endAnimation()
		end
	end

	function var_1_1.moveForDiaochan(arg_37_0, arg_37_1)
		local var_37_0 = 0
		local var_37_1 = 0.8

		if arg_37_1 then
			var_37_1 = 0.03
		end

		local var_37_2 = getMovePosition(arg_37_0, var_1_1.battleData)

		if var_37_2 == nil then
			var_37_2 = BATTLE_ROW_NUM
		end

		if var_37_2 > 0 then
			for iter_37_0 = var_37_2 - 1, 0, -1 do
				if var_1_1.battleData.attArmyInfo[iter_37_0] and arg_37_0 == "att" then
					var_1_1.battleData.attArmyInfo[iter_37_0 + 1] = var_1_1.battleData.attArmyInfo[iter_37_0]
					var_1_1.battleData.attArmyInfo[iter_37_0] = nil

					if var_37_0 == 0 then
						var_1_1.battleData.attArmyInfo[iter_37_0 + 1]:moveTo(var_37_1, var_1_1.countCurrent("att", iter_37_0 + 1), var_1_1.endAnimation)
					else
						var_1_1.battleData.attArmyInfo[iter_37_0 + 1]:moveTo(var_37_1, var_1_1.countCurrent("att", iter_37_0 + 1), var_1_1.doNothing)
					end

					var_37_0 = var_37_0 + 1
				end

				if var_1_1.battleData.defArmyInfo[iter_37_0] and arg_37_0 == "def" then
					var_1_1.battleData.defArmyInfo[iter_37_0 + 1] = var_1_1.battleData.defArmyInfo[iter_37_0]
					var_1_1.battleData.defArmyInfo[iter_37_0] = nil

					if var_37_0 == 0 then
						var_1_1.battleData.defArmyInfo[iter_37_0 + 1]:moveTo(var_37_1, var_1_1.countCurrent("def", iter_37_0 + 1), var_1_1.endAnimation)
					else
						var_1_1.battleData.defArmyInfo[iter_37_0 + 1]:moveTo(var_37_1, var_1_1.countCurrent("def", iter_37_0 + 1), var_1_1.doNothing)
					end

					var_37_0 = var_37_0 + 1
				end
			end
		end

		for iter_37_1 = 0, BATTLE_ROW_NUM do
			if var_1_1.battleData.attArmyInfo[iter_37_1] then
				local var_37_3 = getMovePosition("att", var_1_1.battleData, 0)

				if arg_37_0 == "att" then
					var_37_3 = getMovePosition("att", var_1_1.battleData, var_37_2 + 1)
				end

				if var_37_3 and var_37_3 < iter_37_1 then
					var_1_1.battleData.attArmyInfo[var_37_3] = var_1_1.battleData.attArmyInfo[iter_37_1]
					var_1_1.battleData.attArmyInfo[iter_37_1] = nil

					if var_37_0 == 0 then
						var_1_1.battleData.attArmyInfo[var_37_3]:moveTo(var_37_1, var_1_1.countCurrent("att", var_37_3), var_1_1.endAnimation)
					else
						var_1_1.battleData.attArmyInfo[var_37_3]:moveTo(var_37_1, var_1_1.countCurrent("att", var_37_3), var_1_1.doNothing)
					end

					var_37_0 = var_37_0 + 1
				end
			end

			if var_1_1.battleData.defArmyInfo[iter_37_1] then
				local var_37_4 = getMovePosition("def", var_1_1.battleData, 0)

				if arg_37_0 == "def" then
					var_37_4 = getMovePosition("def", var_1_1.battleData, var_37_2 + 1)
				end

				if var_37_4 and var_37_4 < iter_37_1 then
					var_1_1.battleData.defArmyInfo[var_37_4] = var_1_1.battleData.defArmyInfo[iter_37_1]
					var_1_1.battleData.defArmyInfo[iter_37_1] = nil

					if var_37_0 == 0 then
						var_1_1.battleData.defArmyInfo[var_37_4]:moveTo(var_37_1, var_1_1.countCurrent("def", var_37_4), var_1_1.endAnimation)
					else
						var_1_1.battleData.defArmyInfo[var_37_4]:moveTo(var_37_1, var_1_1.countCurrent("def", var_37_4), var_1_1.doNothing)
					end

					var_37_0 = var_37_0 + 1
				end
			end
		end

		if var_37_0 == 0 then
			var_1_1.endAnimation()
		end
	end

	function var_1_1.diaochanStategy(arg_38_0)
		rmgr.loadResource("res/ui/battle/stategyFont/stategyFont.plist")
		rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

		local var_38_0 = CCSprite:create()
		local var_38_1 = CCSprite:createWithSpriteFrameName("stategyText_qgqc.png")
		local var_38_2 = 0

		if arg_38_0.side == "att" then
			var_38_2 = arg_1_0.currentAttacker.quality
		else
			var_38_2 = arg_1_0.currentDefender.quality
		end

		local var_38_3 = CCArray:create()

		if var_38_2 >= 4 then
			local var_38_4 = CCSprite:create("res/ui/battle/stategyPic/6.png")

			var_38_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

			if arg_38_0.side == "def" then
				var_38_4:setFlipX(true)
			end

			var_38_4:setVisible(false)
			var_38_0:addChild(var_38_4)
			var_38_4:setVisible(true)
			var_38_1:setPosition(ccp(var_38_4:getContentSize().width * 0.5, var_38_4:getContentSize().height * 0.3))
			var_38_4:addChild(var_38_1, 0, TAG_STATEPY_TEXT)

			if arg_38_0.isWorldFightWeaken and type(arg_38_0.isWorldFightWeaken) == "number" then
				local var_38_5 = CCSprite:createWithSpriteFrameName(string.format("stategyText_weak%d.png", arg_38_0.isWorldFightWeaken))

				var_38_5:setPosition(ccp(620, 90))
				var_38_4:addChild(var_38_5, 1, TAG_WEAK_TEXT)
			end

			local function var_38_6()
				local var_39_0 = rmgr.getSpeedEffectAnimation()
				local var_39_1 = CCAnimation:createWithSpriteFrames(var_39_0, 0.08)
				local var_39_2 = CCAnimate:create(var_39_1)
				local var_39_3 = CCRepeatForever:create(var_39_2)
				local var_39_4 = CCSprite:create()

				var_39_4:runAction(var_39_3)
				var_39_4:setPosition(ccp(var_38_4:getContentSize().width * 0.5, var_38_4:getContentSize().height * 0.5))
				var_38_4:addChild(var_39_4, 0, TAG_SPEED_EFFECT)

				local var_39_5 = arg_38_0.leftPic

				if arg_38_0.side == "def" then
					var_39_5 = arg_38_0.rightPic
				end

				local var_39_6 = CCSprite:create(rmgr.getGeneralBust(var_39_5))
				local var_39_7 = ccp(var_39_6:getContentSize().width * 0.5 - 50, var_39_6:getContentSize().height * 0.5 + 10)
				local var_39_8 = ccp(50, 0)

				if arg_38_0.side == "def" then
					var_39_7 = ccp(var_38_4:getContentSize().width - var_39_6:getContentSize().width * 0.5 + 50, var_39_6:getContentSize().height * 0.5 + 10)
					var_39_8 = ccp(-50, 0)
				end

				local var_39_9, var_39_10 = string.find(var_39_5, "player")

				if var_39_9 and var_39_10 then
					var_39_6 = CCSprite:create("res/ui/common/playerPic/" .. var_39_5 .. ".png")

					var_39_6:setScale(0.7)

					if arg_38_0.side == "att" then
						var_39_7 = ccp(var_39_6:getContentSize().width * 0.5 - 50, var_39_6:getContentSize().height * 0.5 * 0.7)
					else
						var_39_7 = ccp(var_38_4:getContentSize().width - var_39_6:getContentSize().width * 0.5 + 50, var_39_6:getContentSize().height * 0.5 * 0.7)
					end
				end

				var_39_6:setPosition(var_39_7)
				var_38_4:addChild(var_39_6)

				local var_39_11 = CCMoveBy:create(0.5, var_39_8)

				if var_39_5 == "zhugeliang" then
					var_39_11 = CCMoveBy:create(0.3, var_39_8)
				end

				var_39_6:runAction(var_39_11)
			end

			var_38_3:addObject(CCCallFuncN:create(var_38_6))
			var_38_3:addObject(CCDelayTime:create(1.3))
			var_38_3:addObject(CCCallFuncN:create(function()
				var_38_4:setVisible(false)
				var_1_1.endAnimation()
				var_38_0:removeFromParentAndCleanup(true)
			end))
		else
			var_38_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.3))
			var_38_0:addChild(var_38_1)

			local var_38_7 = CCMoveBy:create(0.5, ccp(-10, 0))
			local var_38_8 = CCFadeOut:create(0.5)
			local var_38_9 = CCSequence:createWithTwoActions(var_38_7, var_38_8)
			local var_38_10 = CCTargetedAction:create(var_38_1, var_38_9)

			var_38_3:addObject(var_38_10)
			var_38_3:addObject(CCCallFuncN:create(function()
				var_1_1.endAnimation()
				var_38_0:removeFromParentAndCleanup(true)
			end))
		end

		local var_38_11 = CCSequence:create(var_38_3)

		var_38_0:runAction(var_38_11)
		arg_1_0.layerTabel.effectLayer:addChild(var_38_0, 1)
	end

	function var_1_1.nitiangaiming(arg_42_0)
		rmgr.loadResource("res/ui/battle/stategyFont/stategyFont.plist")
		rmgr.loadResource("res/ui/battle/stategyFont/stategyFont1.plist")

		local var_42_0 = CCSprite:create()
		local var_42_1 = CCSprite:createWithSpriteFrameName("baguazhen_wswxg.png")
		local var_42_2 = CCSprite:createWithSpriteFrameName("baguazhen_bgz.png")
		local var_42_3 = CCArray:create()
		local var_42_4 = CCSprite:create("res/ui/battle/stategyPic/3.png")

		var_42_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_42_0:addChild(var_42_4)
		var_42_4:setVisible(true)

		if arg_42_0.side == "def" then
			var_42_4:setFlipX(true)
		end

		var_42_1:setScale(0.8)
		var_42_1:setPosition(ccp(var_42_4:getContentSize().width * 0.5, var_42_4:getContentSize().height * 0.3))
		var_42_4:addChild(var_42_1, 0, TAG_STATEPY_TEXT)
		var_42_2:setPosition(ccp(var_42_4:getContentSize().width * 0.5, var_42_4:getContentSize().height * 0.6))
		var_42_4:addChild(var_42_2, 0)

		local function var_42_5()
			local var_43_0 = rmgr.getSpeedEffectAnimation()
			local var_43_1 = CCAnimation:createWithSpriteFrames(var_43_0, 0.08)
			local var_43_2 = CCAnimate:create(var_43_1)
			local var_43_3 = CCRepeatForever:create(var_43_2)
			local var_43_4 = CCSprite:create()

			var_43_4:runAction(var_43_3)
			var_43_4:setPosition(ccp(var_42_4:getContentSize().width * 0.5, var_42_4:getContentSize().height * 0.5))
			var_42_4:addChild(var_43_4, 0, TAG_SPEED_EFFECT)

			local var_43_5 = CCSprite:create("res/ui/common/halfPic/halfPic_zhugeliangjx.png")
			local var_43_6 = ccp(var_43_5:getContentSize().width * 0.5 - 50, var_43_5:getContentSize().height * 0.5 + 10)
			local var_43_7 = ccp(50, 0)

			if arg_42_0.side == "def" then
				var_43_6 = ccp(var_42_4:getContentSize().width - var_43_5:getContentSize().width * 0.5 + 50, var_43_5:getContentSize().height * 0.5 + 10)
				var_43_7 = ccp(-50, 0)
			end

			local var_43_8 = CCMoveBy:create(0.3, var_43_7)

			var_43_5:runAction(var_43_8)
			var_43_5:setPosition(var_43_6)
			var_42_4:addChild(var_43_5)
		end

		local function var_42_6()
			local var_44_0 = CCSprite:createWithSpriteFrameName("zf_word_fxhj.png")

			var_44_0:setPosition(ccp(var_42_4:getContentSize().width * 0.5, var_42_4:getContentSize().height * 0.3))
			var_42_4:addChild(var_44_0, 0, TAG_STATEPY_TEXT)
			var_42_1:setVisible(false)
			var_42_2:setVisible(false)
		end

		local function var_42_7()
			var_42_4:setVisible(false)
		end

		var_42_3:addObject(CCCallFuncN:create(var_42_5))
		var_42_3:addObject(CCDelayTime:create(1.3))
		var_42_3:addObject(CCCallFuncN:create(var_42_6))
		var_42_3:addObject(CCDelayTime:create(1.3))
		var_42_3:addObject(CCCallFuncN:create(var_42_7))
		var_42_3:addObject(CCDelayTime:create(0.2))
		var_42_3:addObject(CCCallFuncN:create(function()
			var_1_1.endAnimation()
			var_42_0:removeFromParentAndCleanup(true)
		end))

		local var_42_8 = CCSequence:create(var_42_3)

		var_42_0:runAction(var_42_8)
		arg_1_0.layerTabel.effectLayer:addChild(var_42_0, 1)
	end

	function var_1_1.junhuokuBomb(arg_47_0)
		local var_47_0 = CCSprite:create()
		local var_47_1 = 20
		local var_47_2 = 50
		local var_47_3 = 150
		local var_47_4 = -90

		for iter_47_0 = 1, 10 do
			for iter_47_1 = -1, 1 do
				local var_47_5 = CCSprite:create()

				if iter_47_0 <= 5 then
					var_47_5:setPosition(ccp(var_1_1.attPosition[iter_47_0 - 1].x + var_47_3 * iter_47_1 + var_47_1, var_1_1.attPosition[iter_47_0 - 1].y + var_47_4 * iter_47_1 + var_47_2))
				else
					var_47_5:setPosition(ccp(var_1_1.defPosition[iter_47_0 - 6].x + var_47_3 * iter_47_1 + var_47_1, var_1_1.defPosition[iter_47_0 - 6].y + var_47_4 * iter_47_1 + var_47_2))
				end

				local var_47_6 = rmgr.getAnimation("junhuokuExplode")
				local var_47_7 = CCAnimation:createWithSpriteFrames(var_47_6, 0.08)
				local var_47_8 = CCAnimate:create(var_47_7)
				local var_47_9 = CCArray:create()

				if iter_47_0 <= 5 then
					var_47_9:addObject(CCDelayTime:create(0.45 - 0.1 * math.abs(iter_47_0 - 5.5)))
				else
					var_47_9:addObject(CCDelayTime:create(0.1 * math.abs(iter_47_0 - 6)))
				end

				var_47_9:addObject(CCRepeat:create(var_47_8, 1))
				var_47_5:runAction(CCSequence:create(var_47_9))
				var_47_0:addChild(var_47_5)
			end
		end

		local var_47_10 = arg_47_0.attLoseTotal or 1000000
		local var_47_11 = arg_47_0.defLoseTotal or 1000000
		local var_47_12 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_gfsb.png")
		local var_47_13 = CCLabelAtlas:create(tostring(math.modf(var_47_10 / 10000)), "res/ui/common/number/gjms_tit_tong_digit.png", 22, 27, 48)

		var_47_13:setAnchorPoint(ccp(0.5, 0.5))

		local var_47_14 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_gf_w.png")
		local var_47_15 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_sfsb.png")
		local var_47_16 = CCLabelAtlas:create(tostring(math.modf(var_47_11 / 10000)), "res/ui/common/number/gjms_tit_yong_digit.png", 22, 27, 48)

		var_47_16:setAnchorPoint(ccp(0.5, 0.5))

		local var_47_17 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_sf_w.png")
		local var_47_18 = createRichNode({
			var_47_12,
			var_47_13,
			var_47_14
		}, 0.5)
		local var_47_19 = createRichNode({
			var_47_15,
			var_47_16,
			var_47_17
		}, 0.5)

		var_47_18:setPosition(var_1_1.attPosition[1])
		var_47_19:setPosition(var_1_1.defPosition[1])
		var_47_0:addChild(var_47_18, 100)
		var_47_0:addChild(var_47_19, 100)

		local var_47_20 = CCArray:create()

		var_47_20:addObject(CCDelayTime:create(2.5))
		var_47_20:addObject(CCCallFuncN:create(function()
			var_47_0:removeFromParentAndCleanup(true)
		end))

		local var_47_21 = CCSequence:create(var_47_20)

		var_47_0:runAction(var_47_21)
		arg_1_0.layerTabel.effectLayer:addChild(var_47_0, 1)
	end

	function var_1_1.winFight(arg_49_0)
		if arg_49_0.fightResult then
			local var_49_0

			if arg_49_0.fightResult == 1 then
				var_49_0 = var_1_1.battleData.attArmyInfo[0]
			elseif arg_49_0.fightResult == 2 then
				var_49_0 = var_1_1.battleData.defArmyInfo[0]
			end

			if var_49_0 then
				var_49_0:win()

				return
			end
		end
	end

	function var_1_1.showBattleResultPanle(arg_50_0)
		arg_1_0.showFightResult(arg_50_0)
	end

	function var_1_1.doReport12(arg_51_0)
		if arg_51_0.result == 3 then
			return
		elseif arg_51_0.result == 2 then
			local var_51_0 = arg_51_0.armys.def

			if var_51_0 then
				local var_51_1 = Army.create(arg_1_0, var_51_0)

				var_51_1:updataHp()
				var_51_1:showTactics(2, var_51_1.data.tacticsId)
				var_1_0:addChild(var_51_1)

				var_1_1.battleData.defArmyInfo[0] = var_51_1

				local var_51_2 = var_1_1.countCurrent("def", 0)

				var_51_1:setPosition(var_51_2)
				var_1_1.reorderArmy(var_1_1.battleData.defArmyInfo)
			else
				log.info("0血行")
			end
		elseif arg_51_0.result == 1 then
			local var_51_3 = arg_51_0.armys.att

			if var_51_3 then
				local var_51_4 = Army.create(arg_1_0, var_51_3)

				var_51_4:updataHp()
				var_51_4:showTactics(2, var_51_4.data.tacticsId)
				var_1_0:addChild(var_51_4)

				var_1_1.battleData.attArmyInfo[0] = var_51_4

				local var_51_5 = var_1_1.countCurrent("att", 0)

				var_51_4:setPosition(var_51_5)
			else
				log.info("0血行")
			end
		end
	end

	function var_1_1.showFightReward(arg_52_0)
		if user.player.id ~= arg_52_0.playerId and user.player.kfgzCompetitorId ~= arg_52_0.playerId then
			return
		end

		local var_52_0 = CCNode:create()

		for iter_52_0, iter_52_1 in pairs(arg_52_0.rewards) do
			if iter_52_1.num > 0 then
				local var_52_1
				local var_52_2

				if iter_52_1.type == 1 then
					var_52_1 = "res_icon_1.png"
					var_52_2 = "res_title_1.png"
				elseif iter_52_1.type == 2 then
					var_52_1 = "res_icon_2.png"
					var_52_2 = "res_title_2.png"
				elseif iter_52_1.type == 3 then
					var_52_1 = "res_icon_3.png"
					var_52_2 = "res_title_3.png"
				elseif iter_52_1.type == 4 then
					var_52_1 = "res_icon_4.png"
					var_52_2 = "res_title_4.png"
				elseif iter_52_1.type == 5 then
					var_52_1 = "res_icon_6.png"

					if user.player.gemKit then
						var_52_2 = "res_title_jnjy.png"
					else
						var_52_2 = "res_title_6.png"
					end
				elseif iter_52_1.type > 1000 and ybMaterialTypes[iter_52_1.type] then
					local var_52_3 = ybMaterialTypes[iter_52_1.type]

					var_52_2 = "res_title_" .. var_52_3 .. ".png"
				end

				if var_52_1 then
					local var_52_4 = CCSprite:createWithSpriteFrameName(var_52_1)
					local var_52_5 = CCSprite:create(string.format("res/ui/common/text/resource/%s", var_52_2))
					local var_52_6 = CCSprite:createWithSpriteFrameName("res_plus.png")
					local var_52_7 = CCLabelAtlas:create(tostring(iter_52_1.num), "res/ui/common/number/get_numb.png", 29, 46, 48)

					var_52_7:setAnchorPoint(ccp(0.5, 0.5))

					local var_52_8 = createRichNode({
						var_52_4,
						var_52_5,
						var_52_6,
						var_52_7
					})

					var_52_8:setPosition(ccp(0, var_52_5:getContentSize().height * (iter_52_0 - 1)))
					var_52_0:addChild(var_52_8)
				end
			end
		end

		arg_1_0.showEffect(effectType.reward, var_52_0, ccp(visibleSize.width * 0.5, visibleSize.height * 0.4))
	end

	function var_1_1.doReport25(arg_53_0)
		return
	end

	function var_1_1.showBuff(arg_54_0)
		for iter_54_0, iter_54_1 in pairs(arg_54_0) do
			local var_54_0 = var_1_1.battleData.attArmyInfo

			if iter_54_1.side == "def" then
				var_54_0 = var_1_1.battleData.defArmyInfo
			end

			local var_54_1 = iter_54_1.pos or {
				x = 0,
				y = 0
			}

			if iter_54_1.rows then
				for iter_54_2, iter_54_3 in pairs(iter_54_1.rows) do
					for iter_54_4, iter_54_5 in pairs(var_54_0) do
						if iter_54_5 and iter_54_5.data.row == iter_54_3 then
							iter_54_5:showBuff("buffStun", var_54_1)
						end
					end
				end
			elseif iter_54_1.rowCount then
				for iter_54_6, iter_54_7 in pairs(var_54_0) do
					if iter_54_7 and iter_54_1.rowCount > 0 then
						iter_54_7:showBuff("buffWusheng", var_54_1)

						iter_54_1.rowCount = iter_54_1.rowCount - 1
					end
				end
			elseif iter_54_1.rowsExplode then
				for iter_54_8, iter_54_9 in pairs(iter_54_1.rowsExplode) do
					for iter_54_10, iter_54_11 in pairs(var_54_0) do
						if iter_54_11 and iter_54_11.data.row == iter_54_9 then
							iter_54_11:showBuff("explodeEffect", var_54_1)
						end
					end
				end
			elseif iter_54_1.rowsSlopeFire then
				for iter_54_12, iter_54_13 in pairs(iter_54_1.rowsSlopeFire) do
					for iter_54_14, iter_54_15 in pairs(var_54_0) do
						if iter_54_15 and iter_54_15.data.row == iter_54_13 then
							iter_54_15:showBuff("slope_fire", {
								remove = true
							})
						end
					end
				end
			elseif iter_54_1.rowsSlopeSkill then
				for iter_54_16, iter_54_17 in pairs(iter_54_1.rowsSlopeSkill) do
					for iter_54_18, iter_54_19 in pairs(var_54_0) do
						if iter_54_19 and iter_54_19.data.row == iter_54_17 then
							iter_54_19:showBuff("slope_skill", var_54_1)
						end
					end
				end
			end
		end
	end

	function var_1_1.showZhugeXuruoBuff(arg_55_0)
		local var_55_0 = var_1_1.battleData.attArmyInfo

		if arg_55_0 == "def" then
			var_55_0 = var_1_1.battleData.defArmyInfo
		end

		local var_55_1 = {
			scale = 0.6,
			x = 0,
			y = 0
		}
		local var_55_2 = false

		for iter_55_0, iter_55_1 in pairs(var_55_0) do
			if iter_55_1 and iter_55_1.data.row and var_55_2 == false then
				iter_55_1:showBuff("zhuge_weak", var_55_1)

				var_55_2 = true
			end
		end
	end

	function var_1_1.showzhShield(arg_56_0, arg_56_1)
		local var_56_0 = var_1_1.battleData.attArmyInfo

		if arg_56_1 == "def" then
			var_56_0 = var_1_1.battleData.defArmyInfo
		end

		local var_56_1 = {
			x = 0,
			y = 0
		}

		for iter_56_0, iter_56_1 in pairs(arg_56_0.zhShileds[arg_56_1]) do
			for iter_56_2, iter_56_3 in pairs(var_56_0) do
				if iter_56_3 and iter_56_1.shiled and iter_56_3.data.row == iter_56_1.row then
					iter_56_3:addShield(var_56_1, iter_56_1.shiled, iter_56_1.shiled)
				end
			end
		end
	end

	function var_1_1.showshield(arg_57_0)
		for iter_57_0, iter_57_1 in pairs(arg_57_0) do
			local var_57_0 = var_1_1.battleData.attArmyInfo

			if iter_57_1.side == "def" then
				var_57_0 = var_1_1.battleData.defArmyInfo
			end

			local var_57_1 = {
				x = 0,
				y = 0
			}

			if iter_57_1.rows then
				for iter_57_2, iter_57_3 in pairs(iter_57_1.rows) do
					for iter_57_4, iter_57_5 in pairs(var_57_0) do
						if iter_57_5 and iter_57_5.data.row == iter_57_3[1] then
							iter_57_5:addShield(var_57_1, iter_57_3[2], iter_57_3[2])
						end
					end
				end
			end
		end
	end

	function var_1_1.showCarAttAnimation(arg_58_0)
		local var_58_0

		if arg_58_0.carId == 101003 then
			var_58_0 = rmgr.getArmy(arg_58_0.side, 36, "_fire")
		elseif arg_58_0.carId == 101005 then
			var_58_0 = rmgr.getArmy(arg_58_0.side, 38, "_fire")
		else
			var_58_0 = rmgr.getArmy(arg_58_0.side, 39, "_fire")
		end

		local var_58_1 = 0
		local var_58_2 = 0
		local var_58_3 = -84
		local var_58_4 = 140
		local var_58_5 = 0
		local var_58_6 = 0
		local var_58_7 = var_1_1.battleData.attArmyInfo

		if arg_58_0.side == "def" then
			var_58_7 = var_1_1.battleData.defArmyInfo
		end

		for iter_58_0, iter_58_1 in pairs(var_58_7) do
			if iter_58_1 and iter_58_1.data.row == arg_58_0.startNum then
				var_58_5, var_58_6 = tool.getPositionInScreen(iter_58_1.nodes[ARMY_TAG_CENTER])

				for iter_58_2, iter_58_3 in pairs(iter_58_1.nodes) do
					if iter_58_3:getChildByTag(ARMY_TAG_ANIM) then
						iter_58_3:removeChildByTag(ARMY_TAG_ANIM, true)
					end
				end
			end
		end

		for iter_58_4 = -1, 1 do
			local var_58_8 = var_58_0.move
			local var_58_9 = CCAnimation:createWithSpriteFrames(var_58_8, 0.05)
			local var_58_10 = CCAnimate:create(var_58_9)
			local var_58_11 = CCRepeatForever:create(var_58_10)
			local var_58_12 = CCSprite:create()

			var_58_12:runAction(var_58_11)

			local var_58_13 = CCSprite:create()

			local function var_58_14()
				var_1_1.endAnimation()
				var_58_13:removeFromParentAndCleanup(true)

				if arg_58_0.side == "att" then
					var_1_1.removeRow("att", arg_58_0.startNum)
				else
					var_1_1.removeRow("def", arg_58_0.startNum)
				end
			end

			var_58_13:setPosition(ccp(var_58_5 + var_58_4 * iter_58_4, var_58_6 + var_58_3 * iter_58_4))

			local var_58_15 = var_1_1[arg_58_0.side .. "Position"][0]
			local var_58_16 = CCArray:create()

			var_58_16:addObject(CCDelayTime:create(0.2))
			var_58_16:addObject(CCMoveTo:create(0.2, ccp(var_58_15.x + var_58_1 + var_58_4 * iter_58_4, var_58_15.y + var_58_2 + var_58_3 * iter_58_4)))
			var_58_16:addObject(CCDelayTime:create(0.2))
			var_58_16:addObject(CCCallFuncN:create(var_58_14))

			local var_58_17 = CCSequence:create(var_58_16)

			var_58_13:runAction(var_58_17)
			var_58_13:setScale(1.4)
			var_58_13:addChild(var_58_12)
			var_1_0:addChild(var_58_13)
		end
	end

	function var_1_1.showMenghuoAnimation(arg_60_0)
		local var_60_0 = rmgr.getArmy(arg_60_0.side, arg_60_0.armyId)
		local var_60_1 = 0
		local var_60_2 = 0
		local var_60_3 = -84
		local var_60_4 = 140
		local var_60_5 = 0
		local var_60_6 = 0
		local var_60_7 = var_1_1.battleData.attArmyInfo

		if arg_60_0.side == "def" then
			var_60_7 = var_1_1.battleData.defArmyInfo
		end

		local var_60_8 = var_60_7[0]

		if var_60_8 then
			var_60_5, var_60_6 = tool.getPositionInScreen(var_60_8.nodes[ARMY_TAG_CENTER])

			for iter_60_0, iter_60_1 in pairs(var_60_8.nodes) do
				if iter_60_1:getChildByTag(ARMY_TAG_ANIM) then
					iter_60_1:removeChildByTag(ARMY_TAG_ANIM, true)
				end
			end
		end

		for iter_60_2 = -1, 1 do
			local var_60_9 = var_60_0.move
			local var_60_10 = CCAnimation:createWithSpriteFrames(var_60_9, 0.05)
			local var_60_11 = CCAnimate:create(var_60_10)
			local var_60_12 = CCRepeatForever:create(var_60_11)
			local var_60_13 = CCSprite:create()

			var_60_13:runAction(var_60_12)

			if arg_60_0.armyId == 23 then
				var_60_13:setScale(1.4)
			end

			local var_60_14 = CCSprite:create()

			local function var_60_15()
				var_1_1.endAnimation()
				var_60_14:removeFromParentAndCleanup(true)
			end

			var_60_14:setPosition(ccp(var_60_5 + var_60_4 * iter_60_2, var_60_6 + var_60_3 * iter_60_2))

			local var_60_16 = var_1_1.defPosition[6]

			if arg_60_0.side == "def" then
				var_60_16 = var_1_1.attPosition[6]
			end

			local var_60_17 = CCArray:create()

			var_60_17:addObject(CCDelayTime:create(0.2))
			var_60_17:addObject(CCMoveTo:create(0.5, ccp(var_60_16.x + var_60_1 + var_60_4 * iter_60_2, var_60_16.y + var_60_2 + var_60_3 * iter_60_2)))
			var_60_17:addObject(CCDelayTime:create(0.2))
			var_60_17:addObject(CCCallFuncN:create(var_60_15))

			local var_60_18 = CCSequence:create(var_60_17)

			var_60_14:runAction(var_60_18)
			var_60_14:addChild(var_60_13)
			var_1_0:addChild(var_60_14, 100)
		end

		local var_60_19 = 0
		local var_60_20 = 20
		local var_60_21 = 150
		local var_60_22 = -90
		local var_60_23 = 1
		local var_60_24 = 10
		local var_60_25

		if arg_60_0.side == "def" then
			var_60_23 = 1
			var_60_25 = 5
		else
			var_60_23 = 6
			var_60_25 = 10
		end

		for iter_60_3 = var_60_23, var_60_25 do
			for iter_60_4 = -1, 1 do
				local var_60_26 = CCSprite:create()

				if iter_60_3 <= 5 then
					var_60_26:setPosition(ccp(var_1_1.attPosition[iter_60_3 - 1].x + var_60_21 * iter_60_4 + var_60_19, var_1_1.attPosition[iter_60_3 - 1].y + var_60_22 * iter_60_4 + var_60_20))
				else
					var_60_26:setPosition(ccp(var_1_1.defPosition[iter_60_3 - 6].x + var_60_21 * iter_60_4 + var_60_19, var_1_1.defPosition[iter_60_3 - 6].y + var_60_22 * iter_60_4 + var_60_20))
				end

				local var_60_27 = rmgr.getAnimation("menghuoFire")
				local var_60_28 = CCAnimation:createWithSpriteFrames(var_60_27, 0.1)
				local var_60_29 = CCAnimate:create(var_60_28)
				local var_60_30 = CCArray:create()

				if iter_60_3 <= 5 then
					var_60_30:addObject(CCDelayTime:create(0.8 - 0.1 * math.abs(iter_60_3 - 5.5)))
				else
					var_60_30:addObject(CCDelayTime:create(0.35 + 0.1 * math.abs(iter_60_3 - 6)))
				end

				local function var_60_31()
					var_60_26:removeFromParentAndCleanup(true)
				end

				var_60_30:addObject(CCRepeat:create(var_60_29, 1))
				var_60_30:addObject(CCCallFunc:create(var_60_31))
				var_60_26:runAction(CCSequence:create(var_60_30))
				var_1_0:addChild(var_60_26, 99)
			end
		end
	end

	function var_1_1.showFire(arg_63_0, arg_63_1)
		local var_63_0 = var_1_1[arg_63_1 .. "Fire"]

		if var_63_0 then
			var_63_0:removeAllChildrenWithCleanup(true)
		else
			var_63_0 = CCNode:create()
			var_1_1[arg_63_1 .. "Fire"] = var_63_0

			var_1_0:addChild(var_63_0, -1)
		end

		local var_63_1 = var_1_1[arg_63_1 .. "Position"][0]
		local var_63_2 = 130
		local var_63_3 = 0.6 * var_63_2
		local var_63_4

		for iter_63_0 = -1, 1 do
			local var_63_5 = CCSprite:create()

			var_63_0:addChild(var_63_5)

			local var_63_6 = ccp(var_63_1.x + iter_63_0 * var_63_2, var_63_1.y - iter_63_0 * var_63_3 + 50)

			var_63_5:setPosition(var_63_6)

			if arg_63_0 > 1 then
				local var_63_7 = rmgr.getAnimation("big_fire")
				local var_63_8 = CCAnimation:createWithSpriteFrames(var_63_7, 0.1)
				local var_63_9 = CCAnimate:create(var_63_8)

				var_63_5:runAction(CCRepeatForever:create(var_63_9))
			elseif arg_63_0 == 1 then
				local var_63_10 = rmgr.getAnimation("small_fire")
				local var_63_11 = CCAnimation:createWithSpriteFrames(var_63_10, 0.1)
				local var_63_12 = CCAnimate:create(var_63_11)
				local var_63_13 = CCArray:create()

				var_63_13:addObject(CCRepeat:create(var_63_12, 2))
				var_63_13:addObject(CCCallFuncN:create(function()
					var_63_5:removeFromParentAndCleanup(true)
				end))
				var_63_5:runAction(CCSequence:create(var_63_13))
				var_63_5:setPosition(ccp(var_63_6.x, var_63_6.y - 90))
			end
		end
	end

	function var_1_1.showZhurongHurt(arg_65_0, arg_65_1)
		local var_65_0 = var_1_1.battleData.attArmyInfo[0]
		local var_65_1 = var_1_1.battleData.defArmyInfo[0]

		if arg_65_1 == "att" then
			var_65_1:playerAnimation("attack")
			var_65_0:showZhurongHurt()
		else
			var_65_0:playerAnimation("attack")
			var_65_1:showZhurongHurt()
		end
	end

	function var_1_1.showZhouyuFire2(arg_66_0, arg_66_1)
		local var_66_0 = var_1_1[arg_66_1 .. "ZhouyuFire2"]

		if var_66_0 then
			local var_66_1 = var_66_0:getChildren()

			if var_66_1 and var_66_1:count() > 0 then
				return
			end
		else
			var_66_0 = CCNode:create()
			var_1_1[arg_66_1 .. "ZhouyuFire2"] = var_66_0

			var_1_0:addChild(var_66_0, -2)
		end

		local var_66_2 = 140
		local var_66_3 = 0.6 * var_66_2
		local var_66_4

		for iter_66_0 = 0, 3 do
			local var_66_5 = var_1_1[arg_66_1 .. "Position"][iter_66_0]

			for iter_66_1 = -1, 1 do
				local var_66_6 = CCSprite:create()

				var_66_6:setScale(1.2)
				var_66_0:addChild(var_66_6)

				local var_66_7 = ccp(var_66_5.x + iter_66_1 * var_66_2, var_66_5.y - iter_66_1 * var_66_3)

				var_66_6:setPosition(var_66_7)

				local var_66_8 = rmgr.getAnimation("zhouyu_fire2")
				local var_66_9 = CCAnimation:createWithSpriteFrames(var_66_8, 0.1)
				local var_66_10 = CCAnimate:create(var_66_9)

				var_66_6:runAction(CCRepeatForever:create(var_66_10))
			end
		end
	end

	function var_1_1.zhouyuNoFire(arg_67_0)
		local var_67_0 = var_1_1[arg_67_0 .. "ZhouyuFire2"]

		if var_67_0 then
			var_67_0:removeAllChildrenWithCleanup(true)
		end
	end

	function var_1_1.showHuojiFire()
		rmgr.loadResource("res/ui/world/fire/litFire.plist")

		if not var_1_1.huojiFire1 then
			local var_68_0 = CCNode:create()

			var_1_1.huojiFire1 = var_68_0

			var_1_0:addChild(var_68_0, -1)

			local var_68_1 = var_1_1.attPosition[0]
			local var_68_2 = {
				ccp(-252, 114),
				ccp(-472, -16),
				ccp(188, -196),
				ccp(-32, -326)
			}

			for iter_68_0 = 1, 4 do
				local var_68_3 = ccp(var_68_1.x + var_68_2[iter_68_0].x, var_68_1.y + var_68_2[iter_68_0].y)
				local var_68_4 = CCParticleSystemQuad:create("res/ui/world/fire/fire_long.plist")

				var_68_4:setScale(0.5)
				var_68_4:setRotation(-30)
				var_68_4:setPosition(var_68_3)
				var_68_0:addChild(var_68_4)
			end
		end

		local var_68_5 = var_1_1.huojiFire2

		if var_68_5 then
			var_68_5:removeAllChildrenWithCleanup(true)
		else
			var_68_5 = CCSpriteBatchNode:create("res/ui/world/fire/litFire.png")
			var_1_1.huojiFire2 = var_68_5

			var_1_0:addChild(var_68_5, 1000)
		end

		for iter_68_1 = 1, 10 do
			local var_68_6 = CCSprite:createWithSpriteFrameName("huoji_fire_1.png")
			local var_68_7 = var_1_1.countCurrent("att", math.floor((iter_68_1 - 1) / 2))

			if iter_68_1 % 2 == 1 then
				var_68_7 = ccp(var_68_7.x - 85, var_68_7.y + 50)

				var_68_6:setRotation(180)
			else
				var_68_7 = ccp(var_68_7.x + 85, var_68_7.y - 50)
			end

			var_68_6:setPosition(var_68_7)
			var_68_5:addChild(var_68_6)

			local var_68_8 = CCArray:create()

			for iter_68_2 = 1, 24 do
				local var_68_9 = CCSprite:createWithSpriteFrameName(string.format("huoji_fire_%d.png", iter_68_2))

				var_68_8:addObject(var_68_9:displayFrame())
			end

			local var_68_10 = CCAnimation:createWithSpriteFrames(var_68_8, 0.04)
			local var_68_11 = CCAnimate:create(var_68_10)
			local var_68_12 = CCArray:create()

			var_68_12:addObject(var_68_11)
			var_68_12:addObject(CCCallFunc:create(function()
				var_68_6:removeFromParentAndCleanup(true)
			end))

			if iter_68_1 == 1 then
				var_68_12:addObject(CCCallFunc:create(function()
					var_1_1.changeState(BATTLE_STATE_IDLE)
				end))
			end

			local var_68_13 = CCSequence:create(var_68_12)

			var_68_6:runAction(var_68_13)
		end
	end

	function var_1_1.removeHuojiFire()
		local var_71_0 = var_1_1.huojiFire1

		if var_71_0 then
			var_71_0:removeFromParentAndCleanup(true)

			var_1_1.huojiFire1 = nil
		end
	end

	function var_1_1.showSurroundArrow(arg_72_0)
		eventManager.dispatchEvent("showSurroundArrow", arg_72_0, function()
			var_1_1.changeState(BATTLE_STATE_IDLE)
		end)
	end

	function var_1_1.showBuQu(arg_74_0, arg_74_1)
		local var_74_0 = var_1_1.battleData.attArmyInfo[0]
		local var_74_1 = var_1_1.battleData.defArmyInfo[0]

		if var_74_0 == nil or var_74_1 == nil then
			return
		end

		local var_74_2 = -1
		local var_74_3

		if arg_74_1 == "att" then
			var_74_3 = var_1_1.battleData.attArmyInfo
			var_74_2 = var_74_0.data.row
		else
			var_74_3 = var_1_1.battleData.defArmyInfo
			var_74_2 = var_74_1.data.row
		end

		if var_74_3 then
			for iter_74_0, iter_74_1 in ipairs(arg_74_0) do
				for iter_74_2, iter_74_3 in pairs(var_74_3) do
					if iter_74_3 and iter_74_3.data.row == iter_74_1.row then
						iter_74_3:showBuQu(iter_74_1.lv, var_74_2 == iter_74_1.row)
					end
				end
			end
		end
	end

	function var_1_1.showSlopeSkill(arg_75_0)
		local var_75_0 = arg_75_0[1].side
		local var_75_1 = arg_75_0[1].rowsSlopeSkill[1]
		local var_75_2 = var_1_1.battleData.attArmyInfo

		if var_75_0 == "def" then
			var_75_2 = var_1_1.battleData.defArmyInfo
		end

		for iter_75_0, iter_75_1 in pairs(var_75_2) do
			if iter_75_1 and iter_75_1.data.row == var_75_1 then
				for iter_75_2, iter_75_3 in pairs(iter_75_1.nodes) do
					local var_75_3 = CCSprite:create()

					iter_75_3:addChild(var_75_3, armyZorder.slope)

					local var_75_4 = rmgr.getAnimation("slope_skill")
					local var_75_5 = CCAnimation:createWithSpriteFrames(var_75_4, 0.08)
					local var_75_6 = CCAnimate:create(var_75_5)
					local var_75_7 = CCArray:create()

					var_75_7:addObject(var_75_6)
					var_75_7:addObject(CCCallFuncN:create(function()
						var_1_1.endAnimation()
						var_75_3:removeFromParentAndCleanup(true)
					end))
					var_75_3:runAction(CCSequence:create(var_75_7))
				end
			end
		end
	end

	function var_1_1.diaochanHeart(arg_77_0)
		local var_77_0 = CCNode:create()

		var_1_0:addChild(var_77_0, 1000)
		var_77_0:setPosition(ccp(0, 0))

		local var_77_1 = var_1_1[arg_77_0 .. "Position"][0]

		log.info(var_77_1.x .. " " .. var_77_1.y)

		local var_77_2 = 130
		local var_77_3 = 0.6 * var_77_2
		local var_77_4

		for iter_77_0 = -1, 1 do
			local var_77_5 = CCSprite:create()

			var_77_0:addChild(var_77_5)

			if arg_77_0 == "att" then
				var_77_4 = ccp(var_77_1.x + iter_77_0 * var_77_2 - 85, var_77_1.y - iter_77_0 * var_77_3 - 5)
			else
				var_77_4 = ccp(var_77_1.x + iter_77_0 * var_77_2 + 85, var_77_1.y - iter_77_0 * var_77_3 + 105)
			end

			var_77_5:setPosition(var_77_4)

			local var_77_6 = rmgr.getAnimation("diaochanHeart")
			local var_77_7 = CCAnimation:createWithSpriteFrames(var_77_6, 0.08)
			local var_77_8 = CCAnimate:create(var_77_7)
			local var_77_9 = CCArray:create()

			var_77_9:addObject(CCRepeat:create(var_77_8, 1))

			if iter_77_0 == 0 then
				var_77_9:addObject(CCCallFuncN:create(function()
					var_77_0:removeFromParentAndCleanup(true)
					var_1_1.endAnimation()
				end))
			end

			var_77_5:runAction(CCSequence:create(var_77_9))
		end
	end

	function var_1_1.checkIfShowStategy(arg_79_0, arg_79_1, arg_79_2)
		local var_79_0 = false

		if arg_79_1 == "att" and arg_79_0.attRetry and arg_79_0.attRetry == 1 then
			table.insert(arg_1_0.animData, {
				anim = "zhugeRetry",
				data = {
					side = "att"
				}
			})
		end

		if arg_79_1 == "def" and arg_79_0.defRetry and arg_79_0.defRetry == 1 then
			table.insert(arg_1_0.animData, {
				anim = "zhugeRetry",
				data = {
					side = "def"
				}
			})
		end

		if arg_79_1 == "att" and arg_79_0.attZhuge and (arg_79_0.attZhuge == 1 or arg_79_0.attZhuge == 2) then
			log.info("attzhuge" .. arg_79_0.attZhuge)

			local var_79_1 = {}

			var_79_1.side = "att"
			var_79_1.num = arg_79_0.attZhuge

			table.insert(arg_1_0.animData, {
				anim = "zhugePanding",
				data = var_79_1
			})
		end

		if arg_79_1 == "def" and arg_79_0.defZhuge and (arg_79_0.defZhuge == 1 or arg_79_0.defZhuge == 2) then
			log.info("defZhuge" .. arg_79_0.defZhuge)

			local var_79_2 = {}

			var_79_2.side = "def"
			var_79_2.num = arg_79_0.defZhuge

			table.insert(arg_1_0.animData, {
				anim = "zhugePanding",
				data = var_79_2
			})
		end

		if arg_79_2 and arg_79_2.type == 1 then
			if arg_79_2.succ == 0 then
				return
			end

			if arg_79_2.side == "att" then
				if arg_79_0.stategyShow.def.beHold == 2 or arg_79_0.stategyShow.def.beHold == 3 then
					var_79_0 = true
				end
			elseif arg_79_0.stategyShow.att.beHold == 2 or arg_79_0.stategyShow.att.beHold == 3 then
				var_79_0 = true
			end

			table.insert(arg_1_0.animData, {
				anim = "strategy",
				data = arg_79_2
			})

			if arg_79_2.showTacticsId == MENGHUO_ANIMATION_STATEGY then
				local var_79_3 = 46

				if arg_79_2.side == "att" then
					for iter_79_0 = 0, 6 do
						if var_1_1.battleData.attArmyInfo[iter_79_0] and var_1_1.battleData.attArmyInfo[iter_79_0].data.troopType then
							var_79_3 = var_1_1.battleData.attArmyInfo[iter_79_0].data.troopType

							break
						end
					end
				else
					for iter_79_1 = 0, 6 do
						if var_1_1.battleData.defArmyInfo[iter_79_1] and var_1_1.battleData.defArmyInfo[iter_79_1].data.troopType then
							var_79_3 = var_1_1.battleData.defArmyInfo[iter_79_1].data.troopType

							break
						end
					end
				end

				table.insert(arg_1_0.animData, {
					anim = "menghuoStrategy",
					data = {
						side = arg_79_2.side,
						armyId = var_79_3
					}
				})
			end

			if var_79_0 then
				require("lua/game/battle/uiConstant")
				require("lua/common/tool")

				local var_79_4 = deepcopy(arg_79_2)

				var_79_4.showTacticsId = SIMAYI_FANTAN

				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_79_4
				})
			end

			local var_79_5 = arg_79_0.attackerRow

			if arg_79_1 == "def" then
				var_79_5 = arg_79_0.defenerRow
			end

			arg_1_0.tacticsIcon[arg_79_1] = {
				row = var_79_5,
				tacticsId = arg_79_2.nextTacticId,
				result = arg_79_0.result
			}
		end

		if arg_79_2.showTacticsId ~= CAOCAO_HAOLINGTIANXIA then
			if arg_79_2.side == "att" then
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = arg_79_0.troops.def,
					luanwu = arg_79_0.stategyShow.att.luanwu
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = arg_79_0.troops.att,
					luanwu = arg_79_0.stategyShow.def.luanwu
				})
			end
		else
			table.insert(arg_1_0.animData, {
				anim = "shield",
				data = arg_79_0.shieldInfo
			})
		end

		if (arg_79_2.tacticsId == 32 or arg_79_2.tacticsId == 37) and arg_79_2.behold ~= 1 and arg_79_2.behold ~= 3 and not var_79_0 then
			table.insert(arg_1_0.animData, {
				anim = "buff",
				data = {
					{
						rowCount = 4,
						side = arg_79_1,
						pos = {
							x = 5,
							y = 40
						}
					}
				}
			})
		end

		if arg_79_2.tacticsId == 34 and arg_79_2.takeEffect then
			table.insert(arg_1_0.animData, {
				data = 4,
				anim = "fire",
				side = arg_79_1 == "att" and "def" or "att"
			})
		end
	end

	function var_1_1.animation()
		local var_80_0 = arg_1_0.animData[1]

		if not var_80_0 then
			return false
		end

		var_1_1.changeState(BATTLE_STATE_ANIM)

		if var_80_0.anim == "notice" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showTacticsNotice(var_80_0.data)
		elseif var_80_0.anim == "move" then
			arg_1_0.hideFightHelper()
			var_1_1.clearTacticsSelectPanel()

			if var_80_0.data.veryFastMove then
				var_1_1.startFight(nil, nil, true)
			else
				var_1_1.startFight()
			end

			arg_1_0.canShowTimer = false
		elseif var_80_0.anim == "move2" then
			arg_1_0.hideFightHelper()
			var_1_1.clearTacticsSelectPanel()

			if var_80_0.data.stategyShow.att and var_80_0.data.stategyShow.att.type ~= 2 then
				if var_80_0.data.inFastBattleState43 then
					var_1_1.moveForDiaochan("att", true)
				else
					var_1_1.moveForDiaochan("att")
				end
			end

			if var_80_0.data.stategyShow.def and var_80_0.data.stategyShow.def.type ~= 2 then
				if var_80_0.data.inFastBattleState43 then
					var_1_1.moveForDiaochan("def", true)
				else
					var_1_1.moveForDiaochan("def")
				end
			end

			arg_1_0.canShowTimer = false
		elseif var_80_0.anim == "timer" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "showTactics" then
			var_1_1.changeState(BATTLE_STATE_IDLE)

			if var_80_0.data.playerId == user.player.id or (arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN) and var_80_0.data.playerId == user.player.kfgzCompetitorId then
				var_1_1.showTacticsPanel(var_80_0.data)
			end
		elseif var_80_0.anim == "tactics" then
			var_1_1.doTactics(var_80_0.data)
		elseif var_80_0.anim == "strategy" then
			if var_80_0.data.isSputter then
				var_1_1.changeState(BATTLE_STATE_IDLE)
			end

			var_1_1.stategyShow(var_80_0.data)
		elseif var_80_0.anim == "buff" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showBuff(var_80_0.data)
		elseif var_80_0.anim == "shield" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showshield(var_80_0.data)
		elseif var_80_0.anim == "fire" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showFire(var_80_0.data, var_80_0.side)
		elseif var_80_0.anim == "slope" then
			var_1_1.showSlopeSkill(var_80_0.data)
		elseif var_80_0.anim == "fight" then
			var_1_1.fight(var_80_0.data)
		elseif var_80_0.anim == "troops" then
			var_1_1.loseTroops(var_80_0.data, var_80_0.side, var_80_0.luanwu)
		elseif var_80_0.anim == "fire_troops" then
			var_1_1.loseTroops(var_80_0.data, var_80_0.side, var_80_0.luanwu, loseTroopType.fire)
		elseif var_80_0.anim == "zhurong_hurt" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showZhurongHurt(var_80_0.data, var_80_0.side)
		elseif var_80_0.anim == "updatePlayer" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showPlayerInfo(var_80_0.data)
		elseif var_80_0.anim == "win" then
			var_1_1.winFight(var_80_0.data)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "dead" then
			var_1_1.changeState(BATTLE_STATE_IDLE)

			for iter_80_0, iter_80_1 in pairs(var_80_0.data.attDeadRow) do
				var_1_1.removeRow("att", iter_80_1)
			end

			local var_80_1 = false

			for iter_80_2, iter_80_3 in pairs(var_80_0.data.defDeadRow) do
				if iter_80_3 ~= -1 then
					var_80_1 = true

					var_1_1.removeRow("def", iter_80_3)
				end
			end

			var_1_1.checkRemoveRow("att")
			var_1_1.checkRemoveRow("def")

			if var_80_1 then
				var_1_1.updateTacticsIcon()
			end
		elseif var_80_0.anim == "reward" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showFightReward(var_80_0.data)
		elseif var_80_0.anim == "over" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.hideTacticsNotice()
			arg_1_0.showFightHelper()

			arg_1_0.canShowTimer = true
			arg_1_0.countDown = arg_1_0.roundTimeCost
		elseif var_80_0.anim == "result" then
			var_1_1.hideTacticsNotice()
			arg_1_0.hideFightHelper()

			arg_1_0.canShowTimer = false

			var_1_1.showBattleResultPanle(var_80_0.data)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "GeneralJuexing" then
			createJuexingStategyInfo(var_80_0.data)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "zhugePanding" then
			createZhugeAnimation(arg_1_0.layerTabel.effectLayer, var_80_0.data.side, var_80_0.data.num, var_1_1)
		elseif var_80_0.anim == "Zhugebuff" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showZhugeXuruoBuff(var_80_0.data)
		elseif var_80_0.anim == "jiTui" then
			createJiTuiDiJiangAnimation(arg_1_0.layerTabel.effectLayer, var_80_0.data, var_1_1)
		elseif var_80_0.anim == "pilicheAtt" then
			var_1_1.showCarAttAnimation(var_80_0.data)
		elseif var_80_0.anim == "menghuoStrategy" then
			var_1_1.showMenghuoAnimation(var_80_0.data)
		elseif var_80_0.anim == "zhouyu_fire2" then
			var_1_1.showZhouyuFire2(var_80_0.data, var_80_0.side)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "zhouyuNofire" then
			var_1_1.zhouyuNoFire(var_80_0.data)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "huoji_fire" then
			var_1_1.showHuojiFire()
		elseif var_80_0.anim == "buqu" then
			var_1_1.showBuQu(var_80_0.data, var_80_0.side)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "surround_arrow" then
			var_1_1.showSurroundArrow(#var_80_0.data)
		elseif var_80_0.anim == "heart" then
			local var_80_2 = false

			if var_80_0.data.stategyShow.att and var_80_0.data.stategyShow.att.showTacticsId == DIAOCHAN_DANCE then
				var_1_1.diaochanHeart("att")

				var_80_2 = true
			end

			if var_80_0.data.stategyShow.def and var_80_0.data.stategyShow.def.showTacticsId == DIAOCHAN_DANCE then
				var_1_1.diaochanHeart("def")

				var_80_2 = true
			end

			if var_80_2 ~= true then
				var_1_1.changeState(BATTLE_STATE_IDLE)
			end
		elseif var_80_0.anim == "meihuo" then
			if var_80_0.data.attMeihuoLine then
				local var_80_3

				for iter_80_4 = 0, BATTLE_ROW_NUM do
					local var_80_4 = var_1_1.battleData.attArmyInfo[iter_80_4]

					if var_80_4 and var_80_3 == nil then
						var_80_3 = deepcopy(var_80_4.data)

						if var_80_4.armySpriteRecord then
							for iter_80_5 = 1, #var_80_4.armySpriteRecord do
								local var_80_5 = CCArray:create()

								if var_80_0.data.inFastBattleState43 ~= true then
									var_80_5:addObject(CCFadeOut:create(1.3))
								end

								var_80_5:addObject(CCCallFuncN:create(function()
									var_80_4:setVisible(false)
									var_1_1.removeRow("att", var_80_4.data.row)
								end))

								local var_80_6 = CCSequence:create(var_80_5)

								var_80_4.armySpriteRecord[iter_80_5]:runAction(var_80_6)
							end
						end

						break
					end
				end

				local var_80_7 = var_1_1.defPosition[0]

				if var_80_7 and var_80_3 then
					var_80_3.side = "def"

					for iter_80_6 = 0, BATTLE_ROW_NUM do
						local var_80_8 = var_1_1.battleData.defArmyInfo[iter_80_6]

						if var_80_8 then
							var_80_3.row = var_80_8.data.row - 1

							break
						end
					end

					local var_80_9 = Army.create(arg_1_0, var_80_3)

					var_80_9:setPosition(var_80_7)
					var_1_0:addChild(var_80_9)

					var_1_1.battleData.defArmyInfo[0] = var_80_9

					if var_80_9.armySpriteRecord then
						for iter_80_7 = 1, #var_80_9.armySpriteRecord do
							var_80_9:setVisible(false)

							local var_80_10 = CCArray:create()

							if var_80_0.data.inFastBattleState43 ~= true then
								var_80_10:addObject(CCDelayTime:create(0.8))
							end

							var_80_10:addObject(CCCallFuncN:create(function()
								var_80_9:setVisible(true)
							end))

							if var_80_0.data.inFastBattleState43 ~= true then
								var_80_10:addObject(CCFadeIn:create(1.3))
								var_80_10:addObject(CCDelayTime:create(0.1))
							end

							var_80_10:addObject(CCCallFuncN:create(function()
								if iter_80_7 == 1 then
									var_1_1.changeState(BATTLE_STATE_IDLE)
								end
							end))

							local var_80_11 = CCSequence:create(var_80_10)

							var_80_9.armySpriteRecord[iter_80_7]:runAction(var_80_11)
						end
					end
				end
			elseif var_80_0.data.defMeihuoLine then
				local var_80_12

				for iter_80_8 = 0, BATTLE_ROW_NUM do
					local var_80_13 = var_1_1.battleData.defArmyInfo[iter_80_8]

					if var_80_13 and var_80_12 == nil then
						var_80_12 = deepcopy(var_80_13.data)

						if var_80_13.armySpriteRecord then
							for iter_80_9 = 1, #var_80_13.armySpriteRecord do
								local var_80_14 = CCArray:create()

								if var_80_0.data.inFastBattleState43 ~= true then
									var_80_14:addObject(CCFadeOut:create(1.3))
								end

								var_80_14:addObject(CCCallFuncN:create(function()
									var_80_13:setVisible(false)
									var_1_1.removeRow("def", var_80_13.data.row)
								end))

								local var_80_15 = CCSequence:create(var_80_14)

								var_80_13.armySpriteRecord[iter_80_9]:runAction(var_80_15)
							end
						end

						break
					end
				end

				local var_80_16 = var_1_1.attPosition[0]

				if var_80_16 and var_80_12 then
					var_80_12.side = "att"

					for iter_80_10 = 0, BATTLE_ROW_NUM do
						local var_80_17 = var_1_1.battleData.attArmyInfo[iter_80_10]

						if var_80_17 then
							var_80_12.row = var_80_17.data.row - 1

							break
						end
					end

					local var_80_18 = Army.create(arg_1_0, var_80_12)

					var_80_18:setPosition(var_80_16)
					var_1_0:addChild(var_80_18)

					var_1_1.battleData.attArmyInfo[0] = var_80_18

					if var_80_18.armySpriteRecord then
						for iter_80_11 = 1, #var_80_18.armySpriteRecord do
							var_80_18:setVisible(false)

							local var_80_19 = CCArray:create()

							if var_80_0.data.inFastBattleState43 ~= true then
								var_80_19:addObject(CCDelayTime:create(0.8))
							end

							var_80_19:addObject(CCCallFuncN:create(function()
								var_80_18:setVisible(true)
							end))

							if var_80_0.data.inFastBattleState43 ~= true then
								var_80_19:addObject(CCFadeIn:create(1.3))
								var_80_19:addObject(CCDelayTime:create(0.1))
							end

							var_80_19:addObject(CCCallFuncN:create(function()
								var_1_1.changeState(BATTLE_STATE_IDLE)
							end))

							local var_80_20 = CCSequence:create(var_80_19)

							var_80_18.armySpriteRecord[iter_80_11]:runAction(var_80_20)
						end
					end
				end
			end
		elseif var_80_0.anim == "diaochanStategy_P1" then
			local var_80_21 = false

			if var_80_0.data.stategyShow.att and var_80_0.data.stategyShow.att.showTacticsId == DIAOCHAN_DANCE then
				var_1_1.diaochanStategy(var_80_0.data.stategyShow.att)

				var_80_21 = true
			end

			if var_80_0.data.stategyShow.def and var_80_0.data.stategyShow.def.showTacticsId == DIAOCHAN_DANCE then
				var_1_1.diaochanStategy(var_80_0.data.stategyShow.def)

				var_80_21 = true
			end

			if var_80_21 == false then
				var_1_1.changeState(BATTLE_STATE_IDLE)
			end
		elseif var_80_0.anim == "junhuokuBomb" then
			var_1_1.junhuokuBomb(var_80_0.data)
			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "setHpShield" then
			local var_80_22

			if var_80_0.data.side == "att" then
				var_80_22 = var_1_1.battleData.attArmyInfo
			else
				var_80_22 = var_1_1.battleData.defArmyInfo
			end

			if var_80_22 then
				for iter_80_12, iter_80_13 in pairs(var_80_0.data.troops) do
					for iter_80_14, iter_80_15 in pairs(var_80_22) do
						if iter_80_15 and iter_80_13.hp and iter_80_15.data.row == iter_80_13.row then
							iter_80_15:updataHp2(iter_80_13.hp or 0, iter_80_13.hpMax or 1, iter_80_13.shield or 0, iter_80_13.shieldMax or 1, iter_80_13.carHp or 0, iter_80_13.carMaxHp or 1)
						end
					end
				end
			end

			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "setCarShield" then
			local var_80_23

			if var_80_0.data.side == "att" then
				var_80_23 = var_1_1.battleData.attArmyInfo
			else
				var_80_23 = var_1_1.battleData.defArmyInfo
			end

			if var_80_23 then
				for iter_80_16, iter_80_17 in pairs(var_80_0.data.carShileds[var_80_0.data.side]) do
					for iter_80_18, iter_80_19 in pairs(var_80_23) do
						if var_80_0.data.shiledType == 1 then
							if iter_80_19 and iter_80_17.shiled and iter_80_19.data.row == iter_80_17.row then
								iter_80_19:updataCarShiled(iter_80_17.shiled or 0, iter_80_17.shiled or 1)
							end
						elseif iter_80_19 and iter_80_17.bigGzNum and iter_80_17.carHp and iter_80_19.data.row == iter_80_17.row then
							iter_80_19:updataJxShiled(iter_80_17.carHp, iter_80_17.carMaxHp, iter_80_17.bigGzNum)
						end
					end
				end
			end

			var_1_1.changeState(BATTLE_STATE_IDLE)
		elseif var_80_0.anim == "zhShileds" then
			var_1_1.changeState(BATTLE_STATE_IDLE)
			var_1_1.showzhShield(var_80_0.data, var_80_0.side)
		elseif var_80_0.anim == "zhugeRetry" then
			var_1_1.nitiangaiming(var_80_0.data)
		else
			var_1_1.changeState(BATTLE_STATE_IDLE)
		end

		table.remove(arg_1_0.animData, 1)

		return true
	end

	function var_1_1.doRound()
		local var_87_0 = arg_1_0.reportData[1]

		if not var_87_0 then
			return
		end

		local var_87_1 = var_87_0.reportId

		if var_87_1 == 2 then
			for iter_87_0, iter_87_1 in pairs(var_87_0.armys) do
				local var_87_2 = Army.create(arg_1_0, iter_87_1)

				var_1_1.addArmy(var_87_2)
			end

			var_1_1.reorderArmy(var_1_1.battleData.defArmyInfo)
		elseif var_87_1 == 3 then
			table.insert(arg_1_0.animData, {
				anim = "fight",
				data = var_87_0
			})
			table.insert(arg_1_0.animData, {
				anim = "win",
				data = var_87_0
			})
		elseif var_87_1 == 7 then
			table.insert(arg_1_0.animData, {
				anim = "result",
				data = var_87_0
			})
		elseif var_87_1 == 8 then
			-- block empty
		elseif var_87_1 == 10 then
			for iter_87_2, iter_87_3 in pairs(var_87_0.armys) do
				local var_87_3 = Army.create(arg_1_0, iter_87_3)

				var_1_1.addArmy(var_87_3)
			end

			var_1_1.reorderArmy(var_1_1.battleData.defArmyInfo)
		elseif var_87_1 == 11 then
			-- block empty
		elseif var_87_1 == 12 then
			var_1_1.doReport12(var_87_0)
		elseif var_87_1 == 13 then
			arg_1_0.updateGenerelList(var_87_0)
		elseif var_87_1 == 14 then
			if var_87_0.zhouAttFire ~= 1 then
				table.insert(arg_1_0.animData, {
					data = "def",
					anim = "zhouyuNofire"
				})
			end

			if var_87_0.zhouDefFire ~= 1 then
				table.insert(arg_1_0.animData, {
					data = "att",
					anim = "zhouyuNofire"
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "notice",
				data = var_87_0
			})
			showTable(var_1_1.battleData.attArmyInfo)

			for iter_87_4, iter_87_5 in pairs(var_1_1.battleData.attArmyInfo) do
				if iter_87_5.data.row == var_87_0.attackerRow then
					iter_87_5:showTactics(var_87_0.stategyShow.att.type, var_87_0.stategyShow.att.tacticsId, arg_1_0.currentAttacker.pic)
				end
			end

			for iter_87_6, iter_87_7 in pairs(var_1_1.battleData.defArmyInfo) do
				if iter_87_7.data.row == var_87_0.defenerRow then
					iter_87_7:showTactics(var_87_0.stategyShow.def.type, var_87_0.stategyShow.def.tacticsId, arg_1_0.currentDefender.pic)
				end
			end

			if var_87_0.stategyShow.att.tacticsId == DIAOCHAN_DANCE_STATEGY then
				table.insert(arg_1_0.animData, {
					anim = "move2",
					data = var_87_0
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "move",
					data = var_87_0
				})
				table.insert(arg_1_0.animData, {
					anim = "tactics",
					data = var_87_0
				})
			end

			if var_87_0.stategyShow.att.beHold == 2 or var_87_0.stategyShow.att.beHold == 3 then
				var_1_1.checkIfShowStategy(var_87_0, "def", var_87_0.stategyShow.def)
				var_1_1.checkIfShowStategy(var_87_0, "att", var_87_0.stategyShow.att)
			else
				var_1_1.checkIfShowStategy(var_87_0, "att", var_87_0.stategyShow.att)
				var_1_1.checkIfShowStategy(var_87_0, "def", var_87_0.stategyShow.def)
			end

			if var_87_0.stategyShow.att.tacticsId == DIAOCHAN_DANCE_STATEGY then
				table.insert(arg_1_0.animData, {
					anim = "move",
					data = var_87_0
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "buff",
				data = var_87_0.stunBuff
			})

			if var_87_0.attZhuge and var_87_0.attZhuge == 1 then
				table.insert(arg_1_0.animData, {
					data = "def",
					anim = "Zhugebuff"
				})
			end

			if var_87_0.defZhuge and var_87_0.defZhuge == 1 then
				table.insert(arg_1_0.animData, {
					data = "att",
					anim = "Zhugebuff"
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "over",
				data = var_87_0
			})
		elseif var_87_1 == 15 then
			-- block empty
		elseif var_87_1 == 16 then
			table.insert(arg_1_0.animData, {
				anim = "updatePlayer",
				data = var_87_0
			})
		elseif var_87_1 == 18 then
			-- block empty
		elseif var_87_1 == 19 then
			table.insert(arg_1_0.animData, {
				anim = "reward",
				data = var_87_0
			})
		elseif var_87_1 == 20 then
			-- block empty
		elseif var_87_1 == 25 then
			var_1_1.doReport25(var_87_0)
		elseif var_87_1 == 26 then
			log.info("@@ 战斗倒计时 ", var_87_0.roundTimeCost)

			arg_1_0.roundTimeCost = var_87_0.roundTimeCost

			if var_87_0.towerMaxAttackRound > 0 then
				arg_1_0.battleTowerDurability = var_87_0.towerBlood
				arg_1_0.battleTowerCD = var_87_0.towerNextAttackRound
				arg_1_0.battleTowerMax = var_87_0.towerMaxAttackRound

				arg_1_0.updateBattleTower()
			end

			var_1_1.waitForDemo = arg_1_0.roundTimeCost

			if var_1_1.firstGetTimer then
				var_1_1.firstGetTimer = false
				arg_1_0.canShowTimer = true
				arg_1_0.countDown = arg_1_0.roundTimeCost

				arg_1_0.showFightHelper()
			end

			if var_87_0.ligntningNum and var_87_0.ligntningNum > 0 then
				arg_1_0.addLigntningInfo(var_87_0.ligntningNum)
			else
				arg_1_0.removeLigntningInfo()
			end
		elseif var_87_1 == 27 then
			table.insert(arg_1_0.animData, {
				anim = "showTactics",
				data = var_87_0
			})
		elseif var_87_1 == 28 then
			-- block empty
		elseif var_87_1 == 29 then
			-- block empty
		elseif var_87_1 == 30 then
			table.insert(arg_1_0.animData, {
				anim = "dead",
				data = var_87_0
			})
		elseif var_87_1 == 31 then
			var_1_1.lastResult = var_87_0.result

			table.insert(arg_1_0.animData, {
				anim = "over",
				data = var_87_0
			})
		elseif var_87_1 == 32 then
			arg_1_0.battleTowerCD = var_87_0.battleTowerCD
			arg_1_0.battleTowerMax = var_87_0.battleTowerMax

			if arg_1_0.battleTowerDurability <= 1 then
				arg_1_0.battleTowerDurability = 0
			end

			arg_1_0.updateBattleTower()
			log.info("箭塔放箭!!!")
			table.insert(arg_1_0.animData, {
				anim = "strategy",
				data = var_87_0.stategyShow.def
			})
			table.insert(arg_1_0.animData, {
				anim = "troops",
				side = "att",
				data = var_87_0.troops.att
			})
		elseif var_87_1 == 33 then
			log.info("投石车破坏箭塔!!!")

			arg_1_0.battleTowerDurability = var_87_0.towerBlood

			arg_1_0.updateBattleTower()
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})
			table.insert(arg_1_0.animData, {
				anim = "strategy",
				data = var_87_0.stategyShow.att
			})
		elseif var_87_1 == 34 then
			if var_87_0.side == "att" and var_1_1.battleData.attArmyInfo[0] == nil then
				table.insert(arg_1_0.animData, {
					anim = "move",
					data = var_87_0
				})
			elseif var_87_0.side == "def" and var_1_1.battleData.defArmyInfo[0] == nil then
				table.insert(arg_1_0.animData, {
					anim = "move",
					data = var_87_0
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "fire",
				data = var_87_0.fireNum,
				side = var_87_0.side
			})
			table.insert(arg_1_0.animData, {
				anim = "fire_troops",
				data = var_87_0.troops[var_87_0.side],
				side = var_87_0.side
			})
		elseif var_87_1 == 35 then
			log.info("箭塔炮击!!!")
			table.insert(arg_1_0.animData, {
				anim = "strategy",
				data = var_87_0.stategyShow.def
			})
			table.insert(arg_1_0.animData, {
				anim = "troops",
				side = "att",
				data = var_87_0.troops.att
			})

			local var_87_4 = {}

			table.insert(var_87_4, {
				side = "def",
				text = var_87_0.firePlayer .. language.get(190208)
			})
			showFightNotice(arg_1_0, var_87_4)
		elseif var_87_1 == 36 then
			table.insert(arg_1_0.animData, {
				anim = "GeneralJuexing",
				data = var_87_0
			})
		elseif var_87_1 == 37 then
			table.insert(arg_1_0.animData, {
				anim = "jiTui",
				data = var_87_0
			})
		elseif var_87_1 == 38 then
			if var_87_0.troops.def then
				table.insert(arg_1_0.animData, {
					anim = "pilicheAtt",
					data = var_87_0.piliche.att
				})
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = var_87_0.explode.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			end

			if var_87_0.stunBuff.def then
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = var_87_0.stunBuff.def
				})
			end

			if var_87_0.troops.att then
				table.insert(arg_1_0.animData, {
					anim = "pilicheAtt",
					data = var_87_0.piliche.def
				})
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = var_87_0.explode.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			end

			if var_87_0.stunBuff.att then
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = var_87_0.stunBuff.att
				})
			end
		elseif var_87_1 == 39 then
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if #var_87_0.troops.att[1].deadInfo > 0 then
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = {
						{
							side = "def",
							rowsSlopeFire = {
								var_87_0.troops.def[1].row
							}
						}
					}
				})
				table.insert(arg_1_0.animData, {
					anim = "slope",
					data = {
						{
							side = "att",
							rowsSlopeSkill = {
								var_87_0.troops.att[1].row
							}
						}
					}
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = {
						{
							side = "att",
							rowsSlopeFire = {
								var_87_0.troops.att[1].row
							}
						}
					}
				})
				table.insert(arg_1_0.animData, {
					anim = "slope",
					data = {
						{
							side = "def",
							rowsSlopeSkill = {
								var_87_0.troops.def[1].row
							}
						}
					}
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			end
		elseif var_87_1 == 40 then
			log.info("战法屠城!!!")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.stategyShow.def then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			end
		elseif var_87_1 == 41 then
			log.info("吕布自爆")

			if var_87_0.stategyShow.def then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			end
		elseif var_87_1 == 42 then
			log.info("觉醒周瑜火烧")

			if var_87_0.isHuoShen then
				if var_87_0.firstFire == 1 then
					table.insert(arg_1_0.animData, {
						anim = "strategy",
						data = var_87_0.stategyShow[var_87_0.stategySide]
					})
				end

				table.insert(arg_1_0.animData, {
					anim = "zhouyu_fire2",
					data = var_87_0.firstFire,
					side = var_87_0.side
				})
				table.insert(arg_1_0.animData, {
					anim = "fire_troops",
					data = var_87_0.troops[var_87_0.side],
					side = var_87_0.side
				})
			end

			if var_87_0.isZhurong then
				table.insert(arg_1_0.animData, {
					anim = "move",
					data = var_87_0
				})
				table.insert(arg_1_0.animData, {
					anim = "zhurong_hurt",
					data = var_87_0.troops[var_87_0.side],
					side = var_87_0.side
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					data = var_87_0.troops[var_87_0.side],
					side = var_87_0.side
				})
				table.insert(arg_1_0.animData, {
					anim = "buff",
					data = var_87_0.stunBuff
				})
				table.insert(arg_1_0.animData, {
					anim = "dead",
					data = {
						attDeadRow = {},
						defDeadRow = {}
					}
				})
			end
		elseif var_87_1 == 43 then
			if var_87_0.inFastBattleState43 ~= true then
				table.insert(arg_1_0.animData, {
					anim = "notice",
					data = var_87_0
				})

				for iter_87_8, iter_87_9 in pairs(var_1_1.battleData.attArmyInfo) do
					if iter_87_9.data.row == var_87_0.attackerRow then
						iter_87_9:showTactics(var_87_0.stategyShow.att.type, var_87_0.stategyShow.att.tacticsId, arg_1_0.currentAttacker.pic)
					end
				end

				for iter_87_10, iter_87_11 in pairs(var_1_1.battleData.defArmyInfo) do
					if iter_87_11.data.row == var_87_0.defenerRow then
						iter_87_11:showTactics(var_87_0.stategyShow.def.type, var_87_0.stategyShow.def.tacticsId, arg_1_0.currentDefender.pic)
					end
				end
			end

			table.insert(arg_1_0.animData, {
				anim = "move2",
				data = var_87_0
			})

			if var_87_0.inFastBattleState43 ~= true then
				table.insert(arg_1_0.animData, {
					anim = "diaochanStategy_P1",
					data = var_87_0
				})
				table.insert(arg_1_0.animData, {
					anim = "heart",
					data = var_87_0
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "meihuo",
				data = var_87_0
			})

			if var_87_0.inFastBattleState43 ~= true then
				if var_87_0.stategyShow.att.beHold == 2 or var_87_0.stategyShow.att.beHold == 3 then
					var_1_1.checkIfShowStategy(var_87_0, "def", var_87_0.stategyShow.def)
					var_1_1.checkIfShowStategy(var_87_0, "att", var_87_0.stategyShow.att)
				else
					var_1_1.checkIfShowStategy(var_87_0, "att", var_87_0.stategyShow.att)
					var_1_1.checkIfShowStategy(var_87_0, "def", var_87_0.stategyShow.def)
				end
			end
		elseif var_87_1 == 44 then
			log.info("军火库爆炸!!!")
			table.insert(arg_1_0.animData, {
				anim = "junhuokuBomb",
				data = var_87_0
			})
			table.insert(arg_1_0.animData, {
				anim = "troops",
				side = "att",
				data = var_87_0.troops.att
			})
			table.insert(arg_1_0.animData, {
				anim = "troops",
				side = "def",
				data = var_87_0.troops.def
			})
		elseif var_87_1 == 46 then
			table.insert(arg_1_0.animData, {
				anim = "dead",
				data = var_87_0
			})

			var_87_0.veryFastMove = true

			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})
		elseif var_87_1 == 47 then
			table.insert(arg_1_0.animData, {
				anim = "setHpShield",
				data = var_87_0
			})
		elseif var_87_1 == 48 then
			log.info("紫荀彧，业火破阵")

			if var_87_0.stategyShow.def then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			end
		elseif var_87_1 == 49 then
			log.info("国战计策_火计")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.firstFire == 1 then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "huoji_fire"
			})
			table.insert(arg_1_0.animData, {
				anim = "troops",
				side = "att",
				data = var_87_0.troops.att
			})
		elseif var_87_1 == 51 then
			log.info("君临天下")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.stategyShow.att then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "dead",
				data = {
					attDeadRow = {},
					defDeadRow = {}
				}
			})
		elseif var_87_1 == 52 then
			log.info("觉醒周泰_不屈")

			if var_87_0.attBuQuArray then
				table.insert(arg_1_0.animData, {
					anim = "buqu",
					side = "att",
					data = var_87_0.attBuQuArray[1]
				})
			elseif var_87_0.defBuQuArray then
				table.insert(arg_1_0.animData, {
					anim = "buqu",
					side = "def",
					data = var_87_0.defBuQuArray[1]
				})
			end
		elseif var_87_1 == 53 then
			log.info("包围_弓箭兵")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			arg_1_0.surround = var_87_0.surround
			arg_1_0.slam = var_87_0.slam
			arg_1_0.slamCd = var_87_0.slamCd

			arg_1_0.updateSurround()

			if var_87_0.troops and var_87_0.troops.def then
				table.insert(arg_1_0.animData, {
					anim = "surround_arrow",
					data = var_87_0.troops.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			end
		elseif var_87_1 == 54 then
			log.info("追击")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.stategyShow.att then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "dead",
				data = {
					attDeadRow = {},
					defDeadRow = {}
				}
			})
			table.insert(arg_1_0.animData, {
				anim = "over",
				data = var_87_0
			})
		elseif var_87_1 == 55 then
			log.info("战车释放盾")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.stategyShow.att then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "setCarShield",
				data = var_87_0
			})
		elseif var_87_1 == 57 then
			log.info("孙权被动-制衡")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.side == "att" then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "zhShileds",
					side = "att",
					data = var_87_0
				})
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "zhShileds",
					side = "def",
					data = var_87_0
				})
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "dead",
				data = {
					attDeadRow = {},
					defDeadRow = {}
				}
			})
			table.insert(arg_1_0.animData, {
				anim = "over",
				data = var_87_0
			})
		elseif var_87_1 == 59 then
			log.info("张角雷击")
			table.insert(arg_1_0.animData, {
				anim = "move",
				data = var_87_0
			})

			if var_87_0.stategyShow.att then
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.att
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "def",
					data = var_87_0.troops.def
				})
			else
				table.insert(arg_1_0.animData, {
					anim = "strategy",
					data = var_87_0.stategyShow.def
				})
				table.insert(arg_1_0.animData, {
					anim = "troops",
					side = "att",
					data = var_87_0.troops.att
				})
			end

			table.insert(arg_1_0.animData, {
				anim = "dead",
				data = {
					attDeadRow = {},
					defDeadRow = {}
				}
			})
			table.insert(arg_1_0.animData, {
				anim = "over",
				data = var_87_0
			})
		end

		table.remove(arg_1_0.reportData, 1)
	end

	function var_1_1.changeState(arg_88_0)
		var_1_1.state = arg_88_0
	end

	function var_1_1.update(arg_89_0)
		var_1_1.countDown(arg_89_0)

		if arg_1_0.battleType ~= battleType.BATTLE_DEMO then
			var_1_1.doRound()
		else
			var_1_1.waitForDemo = var_1_1.waitForDemo - arg_89_0 * 1000

			if var_1_1.waitForDemo < 0 then
				var_1_1.waitForDemo = 0
			end

			if var_1_1.waitForDemo == 0 then
				var_1_1.doRound()
			end
		end

		if var_1_1.state == BATTLE_STATE_IDLE and not var_1_1.animation() then
			-- block empty
		end
	end

	function var_1_1.doBattleReport(arg_90_0)
		var_1_1.myReport = var_1_1.myReport or ""
		var_1_1.myReport = var_1_1.myReport .. arg_90_0

		log.info("@@ 解析战报")

		local var_90_0 = stringSplit(arg_90_0, "#")

		var_1_1.inFastBattleState = false

		arg_1_0.removeFlag()

		for iter_90_0, iter_90_1 in pairs(var_90_0) do
			if iter_90_0 ~= 1 and iter_90_1 ~= nil and string.len(iter_90_1) > 0 then
				local var_90_1 = stringSplit(iter_90_1, "|")

				if tonumber(var_90_1[1]) == 45 then
					var_1_1.inFastBattleState = true

					arg_1_0.addFlag()
				end
			end
		end

		local var_90_2 = {}

		for iter_90_2, iter_90_3 in pairs(var_90_0) do
			if iter_90_2 == 1 then
				local var_90_3 = stringSplit(iter_90_3, "|")
				local var_90_4 = tonumber(var_90_3[1])
				local var_90_5 = var_90_3[2]

				arg_1_0.battleId = arg_1_0.battleId or var_90_5

				if var_90_5 ~= arg_1_0.battleId then
					return
				end
			elseif iter_90_3 ~= nil and string.len(iter_90_3) > 0 then
				local var_90_6 = stringSplit(iter_90_3, "|")
				local var_90_7 = tonumber(var_90_6[1])

				log.info("@@@@@@@@@@@@@@@@@reportType: " .. var_90_7)

				local var_90_8

				if var_90_7 == 2 then
					var_90_8 = doReport2
				elseif var_90_7 == 3 then
					var_90_8 = doReport3
				elseif var_90_7 == 7 then
					if arg_1_0.battleType == battleType.BATTLE_KFWD then
						var_90_8 = doKfwdReport7
					elseif arg_1_0.battleType == battleType.BATTLE_KFZB then
						var_90_8 = doKfzbReport7
					else
						var_90_8 = doReport7
					end
				elseif var_90_7 == 8 then
					var_90_8 = doReport8
				elseif var_90_7 == 10 then
					var_90_8 = doReport10
				elseif var_90_7 == 11 then
					var_90_8 = doReport11
				elseif var_90_7 == 12 then
					var_90_8 = doReport12
				elseif var_90_7 == 13 then
					var_90_8 = doReport13
				elseif var_90_7 == 14 then
					var_90_8 = doReport14
				elseif var_90_7 == 15 then
					var_90_8 = doReport15
				elseif var_90_7 == 16 then
					var_90_8 = doReport16
				elseif var_90_7 == 18 then
					var_90_8 = doReport18
				elseif var_90_7 == 19 then
					var_90_8 = doReport19
				elseif var_90_7 == 20 then
					var_90_8 = doReport20
				elseif var_90_7 == 25 then
					var_90_8 = doReport25
				elseif var_90_7 == 26 then
					var_90_8 = doReport26
				elseif var_90_7 == 27 then
					var_90_8 = doReport27
				elseif var_90_7 == 28 then
					var_90_8 = doReport28
				elseif var_90_7 == 29 then
					var_90_8 = doReport29
				elseif var_90_7 == 30 then
					var_90_8 = doReport30
				elseif var_90_7 == 31 then
					var_90_8 = doReport31
				elseif var_90_7 == 32 then
					var_90_8 = doReport32
				elseif var_90_7 == 33 then
					var_90_8 = doReport33
				elseif var_90_7 == 34 then
					var_90_8 = doReport34
				elseif var_90_7 == 35 then
					var_90_8 = doReport35
				elseif var_90_7 == 36 then
					var_90_8 = doReport36
				elseif var_90_7 == 37 then
					var_90_8 = doReport37
				elseif var_90_7 == 38 then
					var_90_8 = doReport38
				elseif var_90_7 == 39 then
					var_90_8 = doReport39
				elseif var_90_7 == 40 then
					var_90_8 = doReport40
				elseif var_90_7 == 41 then
					var_90_8 = doReport41
				elseif var_90_7 == 42 then
					var_90_8 = doReport42
				elseif var_90_7 == 43 then
					var_90_8 = doReport43
				elseif var_90_7 == 44 then
					var_90_8 = doReport44
				elseif var_90_7 == 46 then
					var_90_8 = doReport46
				elseif var_90_7 == 47 then
					var_90_8 = doReport47
				elseif var_90_7 == 48 then
					var_90_8 = doReport48
				elseif var_90_7 == 49 then
					var_90_8 = doReport49
				elseif var_90_7 == 50 then
					var_90_8 = doReport50
				elseif var_90_7 == 51 then
					var_90_8 = doReport51
				elseif var_90_7 == 52 then
					var_90_8 = doReport52
				elseif var_90_7 == 53 then
					var_90_8 = doReport53
				elseif var_90_7 == 54 then
					var_90_8 = doReport54
				elseif var_90_7 == 55 then
					var_90_8 = doReport55
				elseif var_90_7 == 57 then
					var_90_8 = doReport57
				elseif var_90_7 == 59 then
					var_90_8 = doReport59
				else
					log.error("unknow report type ", var_90_7)
				end

				if var_90_8 then
					log.info("handlerFunc: " .. var_90_7)

					local var_90_9 = {}

					var_90_8(var_90_9, iter_90_3)

					if var_90_7 == 43 and var_1_1.inFastBattleState then
						var_90_9.inFastBattleState43 = true
					end

					var_90_9.reportId = var_90_7

					if not var_90_9.reportId then
						log.warn("###### unknow report ##########")
						log.warn(iter_90_3)
					elseif var_1_1.inFastBattleState then
						if var_90_7 == 2 or var_90_7 == 46 or var_90_7 == 10 or var_90_7 == 43 or var_90_7 == 16 then
							table.insert(arg_1_0.reportData, var_90_9)
						end
					elseif var_90_7 ~= 46 then
						table.insert(arg_1_0.reportData, var_90_9)
					end
				end
			end
		end
	end

	function var_1_1.handlerflagPush(arg_91_0)
		if arg_91_0.action.data and arg_91_0.action.data.battleFlag then
			local var_91_0 = arg_91_0.action.data.battleFlag

			if var_91_0.battleId == arg_1_0.battleId then
				if var_91_0.flagType and var_91_0.flagType == 1 then
					arg_1_0.showFlagTip(0)
				elseif var_91_0.forceId then
					if user.player.forceId == var_91_0.forceId then
						arg_1_0.showFlagTip(1)
					else
						arg_1_0.showFlagTip(0)
					end
				end
			end

			if var_91_0.isOpen then
				arg_1_0.addFlag(true, var_91_0.flagType)
			else
				arg_1_0.removeFlag()
			end
		end
	end

	function var_1_1.handlerCastlePush(arg_92_0)
		if arg_92_0.action.data and arg_92_0.action.data.cityCastle then
			local var_92_0 = arg_92_0.action.data.cityCastle

			if var_92_0.battleId and var_92_0.battleId == arg_1_0.battleId and var_92_0.armyLeftTime and var_92_0.armyLeftTime > 0 then
				local var_92_1 = math.modf(var_92_0.armyLeftTime / 1000) + 1

				if var_92_1 > 20 then
					var_92_1 = 20
				end

				arg_1_0.showBombTip(var_92_1)
			end
		end
	end

	function var_1_1.handlerBattleInnerPush(arg_93_0)
		local var_93_0 = arg_93_0.data or arg_93_0.action.data

		if var_93_0.hbqKills then
			if var_93_0.hbqKills.att then
				arg_1_0.showHbqTip("att", var_93_0.hbqKills.att.playerName, var_93_0.hbqKills.att.kills)
			end

			if var_93_0.hbqKills.def then
				arg_1_0.showHbqTip("def", var_93_0.hbqKills.def.playerName, var_93_0.hbqKills.def.kills)
			end
		end

		if var_93_0.fission then
			if var_93_0.fission.att then
				arg_1_0.showFissionTip("att", var_93_0.fission.att.playerName, var_93_0.fission.att.dants)
			end

			if var_93_0.fission.def then
				arg_1_0.showFissionTip("def", var_93_0.fission.def.playerName, var_93_0.fission.def.dants)
			end
		end

		if var_93_0.diedCastleNpc then
			if var_93_0.diedCastleNpc.att then
				arg_1_0.showDiedCastleNpcTip("att", var_93_0.diedCastleNpc.att.diedNum)
			end

			if var_93_0.diedCastleNpc.def then
				arg_1_0.showDiedCastleNpcTip("def", var_93_0.diedCastleNpc.def.diedNum)
			end
		end

		if var_93_0.chain then
			arg_1_0.cityLockInfo = var_93_0.chain

			if arg_1_0.cityLockInfo.state == nil then
				arg_1_0.cityLockInfo.state = 0
			end

			eventManager.dispatchEvent("cityLockInfo", arg_1_0.cityLockInfo)
		end
	end

	function var_1_1.handlerKfyzBombPush(arg_94_0)
		showTable(arg_94_0)

		local var_94_0 = arg_94_0.data

		if var_94_0.bomb then
			local var_94_1 = smgr.getLayer("effectlayer")
			local var_94_2 = CCSprite:create("res/ui/saotao/stfx_word_bg.png")

			var_94_1:addChild(var_94_2)

			local var_94_3

			if var_94_0.bomb.isAtt then
				var_94_3 = CCLabelTTF:create(language.get("224201_bomb", var_94_0.bomb.bomber, var_94_0.bomb.killNum), "Thonburi", 24)
			else
				var_94_3 = CCLabelTTF:create(language.get("224202_bomb", var_94_0.bomb.bomber, var_94_0.bomb.killNum), "Thonburi", 24)
			end

			var_94_3:setPosition(ccp(var_94_2:getContentSize().width / 2, var_94_2:getContentSize().height / 2 + 5))
			var_94_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_94_2:addChild(var_94_3)

			local function var_94_4()
				var_94_1:removeChild(var_94_2, true)
			end

			local var_94_5 = CCArray:create()

			var_94_5:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
			var_94_5:addObject(CCDelayTime:create(2.5))
			var_94_5:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_94_2:getContentSize().width * 0.5, visibleSize.height * 0.5)))
			var_94_5:addObject(CCCallFuncN:create(var_94_4))

			local var_94_6 = CCSequence:create(var_94_5)

			var_94_2:runAction(var_94_6)
		end
	end

	function var_1_1.handlerBattlePush(arg_96_0)
		log.info("@@ 战斗推送 ", arg_1_0.isBattleStart)

		if arg_1_0.isBattleStart then
			local var_96_0

			if arg_1_0.battleType == battleType.BATTLE_KFWD then
				var_96_0 = arg_96_0.data.dokfwdBattle
			elseif arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
				var_96_0 = arg_96_0.data.kfgzbattle
			elseif arg_1_0.battleType == battleType.BATTLE_KFZB then
				log.info("跨服争霸战报:")

				if arg_96_0.data and arg_96_0.data.dokfzbBattle then
					log.info("跨服争霸战报:response.data.dokfzbBattle")

					var_96_0 = arg_96_0.data.dokfzbBattle
				end

				if arg_96_0.action then
					if arg_96_0.action.data.report then
						local var_96_1 = arg_96_0.action.data.report

						log.info("跨服争霸战报:response.data.report")

						if var_96_1.refresh then
							smgr.changeScene(SCENE_KFZB_TABLE)
						end

						if var_96_1.report and arg_1_0.kfzbInfo.kfzbState ~= kfzbState.support then
							var_96_0 = var_96_1.report
							kfzbControl.kfzbData.nextRoundCD = 0
						end

						if var_96_1.zhichi then
							arg_1_0.kfzbInfo.supported = var_96_1.zhichi.supported
							arg_1_0.kfzbInfo.sup1 = var_96_1.zhichi.sup1
							arg_1_0.kfzbInfo.sup2 = var_96_1.zhichi.sup2
							arg_1_0.kfzbInfo.leftNum = var_96_1.zhichi.leftNum

							arg_1_0.kfzbInfo.prepareView:updateView()
						end
					end

					if arg_96_0.action.data.kfzbbaseInfo then
						log.info("@@ fightLayer.lua,跨服争霸")
						bmgr.enterKfzb()
					end
				end

				if var_96_0 then
					log.info("跨服争霸战报:", var_96_0)
				end
			else
				var_96_0 = arg_96_0.action.data.doBattle
			end

			if var_96_0 then
				var_1_1.doBattleReport(var_96_0)
			end
		end
	end

	function var_1_1.handlerFirePush(arg_97_0)
		local var_97_0 = arg_97_0.action.data.fire

		arg_1_0.fire = var_97_0

		if arg_1_0.rightButtonControl then
			arg_1_0.rightButtonControl:update()
		end

		if var_97_0.cityId == arg_1_0.cityId and var_97_0.hp <= 0 then
			var_1_1.removeHuojiFire()
		end
	end

	function var_1_0.onEnter(arg_98_0)
		log.info("@@ 进入战斗层")

		if arg_1_0.battleType == battleType.BATTLE_KFWD then
			log.info("@@ 注册武斗战斗推送")
			kfcmgr.registerResponseHandler(actions.kfwdpushbattle, var_1_1.handlerBattlePush)
		elseif arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			log.info("@@ 注册跨服国战推送")
			kfcmgr.registerResponseHandler(actions.kfgzPushBattle, var_1_1.handlerBattlePush)
			kfcmgr.registerResponseHandler(actions.pushKfBattleInner, var_1_1.handlerBattleInnerPush)
			kfcmgr.registerResponseHandler(actions.pushKfyzBomb, var_1_1.handlerKfyzBombPush)
		elseif arg_1_0.battleType == battleType.BATTLE_KFZB then
			log.info("@@ 注册跨服争霸战斗推送")
			cmgr.registerResponseHandler(actions.kfzbPush, var_1_1.handlerBattlePush)
			kfcmgr.registerResponseHandler(actions.kfzbBattlePush, var_1_1.handlerBattlePush)
		else
			cmgr.registerResponseHandler(actions.battlePush, var_1_1.handlerBattlePush)
			cmgr.registerResponseHandler(actions.pushCastle, var_1_1.handlerCastlePush)
			cmgr.registerResponseHandler(actions.pushBattleFlag, var_1_1.handlerflagPush)
			cmgr.registerResponseHandler(actions.pushBattleInner, var_1_1.handlerBattleInnerPush)
			cmgr.registerResponseHandler(actions.pushFire, var_1_1.handlerFirePush)
		end

		var_1_1.updateSchedulerEntry = var_0_0:scheduleScriptFunc(var_1_1.update, 0, false)
	end

	function var_1_0.onExit(arg_99_0)
		log.info("@@ 退出战斗层")

		if arg_1_0.battleType == battleType.BATTLE_KFWD then
			kfcmgr.unregisterResponseHandler(actions.kfwdpushbattle, var_1_1.handlerBattlePush)
		elseif arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			kfcmgr.unregisterResponseHandler(actions.kfgzPushBattle, var_1_1.handlerBattlePush)
			kfcmgr.unregisterResponseHandler(actions.pushKfBattleInner, var_1_1.handlerBattleInnerPush)
			kfcmgr.unregisterResponseHandler(actions.pushKfyzBomb, var_1_1.handlerKfyzBombPush)
		elseif arg_1_0.battleType == battleType.BATTLE_KFZB then
			cmgr.unregisterResponseHandler(actions.kfzbPush, var_1_1.handlerBattlePush)
			kfcmgr.unregisterResponseHandler(actions.kfzbBattlePush, var_1_1.handlerBattlePush)
		else
			cmgr.unregisterResponseHandler(actions.battlePush, var_1_1.handlerBattlePush)
			cmgr.unregisterResponseHandler(actions.pushCastle, var_1_1.handlerCastlePush)
			cmgr.unregisterResponseHandler(actions.pushBattleFlag, var_1_1.handlerflagPush)
			cmgr.unregisterResponseHandler(actions.pushBattleInner, var_1_1.handlerBattleInnerPush)
			cmgr.unregisterResponseHandler(actions.pushFire, var_1_1.handlerFirePush)
		end

		if var_1_1.updateSchedulerEntry then
			log.info("@@ 删除战斗回调")
			var_0_0:unscheduleScriptEntry(var_1_1.updateSchedulerEntry)

			var_1_1.updateSchedulerEntry = nil
		end
	end

	return var_1_0
end
