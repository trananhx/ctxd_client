require("lua/game/battle/perparePanel")
require("lua/game/battle/fightLayer")
require("lua/game/battle/widget/generalListPanel")
require("lua/game/battle/widget/fightHelper")
require("lua/game/battle/widget/fightTip")
require("lua/game/battle/widget/fightRightButton")
require("lua/game/battle/widget/fightTujinPanel")
require("lua/game/battle/widget/simpleGeneralPanel")
require("lua/game/battle/widget/showTeamCostPanel")
require("lua/game/battle/widget/showTeamInfo")

function createBattleControl()
	local var_1_0 = {
		layerTabel = {},
		arenaData = require("lua/game/battle/arenaData")
	}

	var_1_0.effectTag = 1
	var_1_0.battleType = 1
	var_1_0.isBattleStart = false
	var_1_0.autoSt = -1
	var_1_0.terrain = nil
	var_1_0.battleId = nil
	var_1_0.battleType = nil
	var_1_0.viewType = nil
	var_1_0.freePhantomCount = 0
	var_1_0.juBenLeftJieBing = nil
	var_1_0.curFrame = 0
	var_1_0.lastFrame = 0
	var_1_0.roundTimeCost = 0
	var_1_0.countDown = 0
	var_1_0.canShowTimer = false
	var_1_0.battleData = {}
	var_1_0.figthSide = PLAYER_SIDE_OB
	var_1_0.currentAttacker = nil
	var_1_0.currentDefender = nil
	var_1_0.tacticsIcon = {}
	var_1_0.cost = {}
	var_1_0.reportData = {}
	var_1_0.animData = {}
	var_1_0.animState = ANIM_STATE_IDLE
	var_1_0.team = {}
	var_1_0.teamTimes = 0
	var_1_0.inspireCost = 0
	var_1_0.orderGold = 0
	var_1_0.kfwdInfo = {}
	var_1_0.kfzbInfo = {}
	var_1_0.arenaInfo = {}
	var_1_0.arenaInfo.arenaType = 0
	var_1_0.arenaInfo.arenaTimes = 0
	var_1_0.arenaInfo.champion = nil
	var_1_0.battleTowerId = 1
	var_1_0.battleTowerForceId = 0
	var_1_0.battleTowerDurability = 0
	var_1_0.battleTowerCD = 0
	var_1_0.battleTowerMax = 0

	function var_1_0.onEventDead()
		if var_1_0.battleType == battleType.BATTLE_KFWD then
			local var_2_0 = var_1_0.fightControl.battleData.attArmyInfo
			local var_2_1 = var_1_0.fightControl.battleData.defArmyInfo

			if (#var_2_0 < 7 or #var_2_1 < 7) and var_1_0.kfwdInfo.kfwdView then
				var_1_0.kfwdInfo.kfwdView.widgets.doubleButton:setVisible(false)
				var_1_0.kfwdInfo.kfwdView.widgets.needGoldLabel:setVisible(false)
			else
				var_1_0.kfwdInfo.kfwdView:updateDoubleInfo()
			end
		end
	end

	function var_1_0.checkSide(arg_3_0)
		if arg_3_0 == 1 then
			return "att"
		elseif arg_3_0 == 0 then
			return "def"
		else
			return "ob"
		end
	end

	function var_1_0.drawBackground(arg_4_0)
		if arg_4_0 == 1004 then
			arg_4_0 = 1003
		end

		if arg_4_0 == nil then
			arg_4_0 = 1
		end

		if arg_4_0 == 6 and var_1_0.isYz then
			if user.isKfdy then
				arg_4_0 = 100
			elseif user.isKfgl then
				arg_4_0 = 101
			end
		end

		log.info("@@ 地形 ", arg_4_0)

		local var_4_0 = "res/ui/battle/battleBackground/" .. arg_4_0 .. ".jpg"
		local var_4_1 = CCSprite:create(var_4_0)

		var_4_1:setAnchorPoint(ccp(0.5, 0.5))

		if arg_4_0 == 1001 or arg_4_0 == 1002 or arg_4_0 == 1003 then
			var_4_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 + 40))
		else
			var_4_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 + 15))
		end

		pcall(var_1_0.layerTabel.backgroundLayer.removeAllChildrenWithCleanup, var_1_0.layerTabel.backgroundLayer, true)
		var_1_0.layerTabel.backgroundLayer:addChild(var_4_1)
	end

	function var_1_0.returnToLastScene()
		if var_1_0.battleType == battleType.BATTLE_KFWD then
			smgr.changeScene(SCENE_MAIN_CITY)
			kfcmgr.disconnectFromServer()

			return
		elseif var_1_0.battleType == battleType.BATTLE_KFZB then
			smgr.changeScene(SCENE_KFZB_TABLE)
			kfcmgr.disconnectFromServer()

			return
		elseif var_1_0.battleType == battleType.BATTLE_SCENARIO or var_1_0.battleType == battleType.BATTLE_SCENARIO_ONE2ONE or var_1_0.battleType == battleType.BATTLE_SCENARIO_EVENT then
			if user.inJuBen or user.isYw and var_1_0.battleType == battleType.BATTLE_JBYW then
				smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
			else
				jubenSelect.ui.show()
			end

			return
		end

		if not var_1_0.isBattleStart then
			smgr.returnLastScene()
		else
			if var_1_0.battleType == battleType.BATTLE_KFGZ and kfcmgr.isConnected() then
				kfcmgr.sendRequest(function()
					return
				end, actions.kfgzLeaveBattleTeam, var_1_0.cityId)
			end

			cmgr.sendRequest(var_1_0.handlerBattleLeave, actions.battleLeave, var_1_0.battleId, var_1_0.battleType)
		end
	end

	function var_1_0.handlerBattleLeave(arg_7_0)
		if var_1_0.battleType == battleType.BATTLE_CITY_ONE2ONE or var_1_0.battleType == battleType.BATTLE_CITY or var_1_0.battleType == battleType.BATTLE_CITY_NPC or var_1_0.battleType == battleType.BATTLE_CITY_EVENT or var_1_0.battleType == battleType.BATTLE_BARBARAIN or var_1_0.battleType == battleType.BATTLE_BARBARAIN_ONE2ONE then
			smgr.changeScene(SCENE_WORLD)
		elseif var_1_0.battleType == battleType.BATTLE_ARMY or var_1_0.battleType == battleType.BATTLE_ARMY_REWARD or var_1_0.battleType == battleType.BATTLE_ARMIES or var_1_0.battleType == battleType.BATTLE_OCCUPY then
			smgr.changeScene(SCENE_MAIN_CITY)
		else
			smgr.returnLastScene()
		end
	end

	function var_1_0.watchDemo(arg_8_0)
		var_1_0.terrain = 1
		var_1_0.terrainPic = 1
		var_1_0.demoReport = arg_8_0.report

		var_1_0.drawBackground(var_1_0.terrainPic)
		var_1_0.showPerparePanel(arg_8_0.att, arg_8_0.def)
	end

	function var_1_0.startDemoFight()
		var_1_0.battleId = "-1"

		var_1_0.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)
		var_1_0.enterFigth(var_1_0.demoReport)
	end

	function var_1_0.updateKfzbInfo(arg_10_0)
		log.info("@@ 跨服争霸,updateKfzbInfo")

		if var_1_0.kfzbInfo.kfzbState == kfzbState.support or var_1_0.kfzbInfo.kfzbState == kfzbState.fightWatch then
			local var_10_0 = arg_10_0.action.data

			var_1_0.terrain = var_10_0.terrain
			var_1_0.kfzbInfo = var_1_0.kfzbInfo or {}
			var_1_0.kfzbInfo.battleCD = var_10_0.nextCd
			var_1_0.kfzbInfo.competitorId1 = var_10_0.cId1
			var_1_0.kfzbInfo.competitorId2 = var_10_0.cId2
			var_1_0.kfzbInfo.buySupGold = var_10_0.buySupGold
			var_1_0.kfzbInfo.winTicket = var_10_0.tickets
			var_1_0.kfzbInfo.supported = var_10_0.supported
			var_1_0.kfzbInfo.leftNum = var_10_0.leftNum
			var_1_0.kfzbInfo.sup1 = var_10_0.sup1
			var_1_0.kfzbInfo.sup2 = var_10_0.sup2
			var_1_0.kfzbInfo.matchId = var_10_0.matchId
			var_1_0.kfzbInfo.round = var_10_0.round
			var_1_0.kfzbInfo.nextSRoundCD = var_10_0.nextCd
			var_1_0.kfzbInfo.p1Info = {
				serverName = var_10_0.serverName1,
				serverId = var_10_0.serverId1,
				playerName = var_10_0.name1,
				playerLevel = var_10_0.Lv1
			}
			var_1_0.kfzbInfo.p2Info = {
				serverName = var_10_0.serverName2,
				serverId = var_10_0.serverId2,
				playerName = var_10_0.name2,
				playerLevel = var_10_0.Lv2
			}
			var_1_0.kfzbInfo.p1gInfo = {
				list = var_10_0.generals1
			}
			var_1_0.kfzbInfo.p2gInfo = {
				list = var_10_0.generals2
			}
			var_1_0.kfzbInfo.pic1 = var_10_0.pic1
			var_1_0.kfzbInfo.pic2 = var_10_0.pic2
			var_1_0.kfzbInfo.win1 = var_10_0.win1
			var_1_0.kfzbInfo.win2 = var_10_0.win2
			var_1_0.kfzbInfo.reward = var_10_0.reward

			if type(var_10_0.p1GivewayGIds) ~= "table" then
				var_10_0.p1GivewayGIds = {}
			end

			if type(var_10_0.p2GivewayGIds) ~= "table" then
				var_10_0.p2GivewayGIds = {}
			end

			var_1_0.kfzbInfo.p1GivewayGIds = var_10_0.p1GivewayGIds
			var_1_0.kfzbInfo.p2GivewayGIds = var_10_0.p2GivewayGIds
			var_1_0.kfzbInfo.p1NoUseTactic = var_10_0.p1NoUseTactic
			var_1_0.kfzbInfo.p2NoUseTactic = var_10_0.p2NoUseTactic
			var_1_0.kfzbInfo.p1BuffNum = var_10_0.p1BuffNum
			var_1_0.kfzbInfo.p2BuffNum = var_10_0.p2BuffNum
		else
			local var_10_1 = arg_10_0.data.bInfo

			var_1_0.terrain = var_10_1.terrain
			var_1_0.kfzbInfo = var_1_0.kfzbInfo or {}
			var_1_0.kfzbInfo.battleCD = var_10_1.battleCd
			var_1_0.kfzbInfo.competitorId = var_10_1.competitorId

			if var_10_1.p1 then
				var_1_0.kfzbInfo.p1Info = var_10_1.p1
				var_1_0.kfzbInfo.p1gInfo = var_10_1.g1
				var_1_0.kfzbInfo.competitorId1 = var_10_1.p1.competitorId
				var_1_0.kfzbInfo.isAttacker = var_1_0.kfzbInfo.competitorId == var_1_0.kfzbInfo.competitorId1
			else
				var_1_0.kfzbInfo.competitorId1 = 0
				var_1_0.kfzbInfo.isAttacker = false
			end

			if var_10_1.p2 then
				var_1_0.kfzbInfo.p2Info = var_10_1.p2
				var_1_0.kfzbInfo.p2gInfo = var_10_1.g2
				var_1_0.kfzbInfo.competitorId2 = var_10_1.p2.competitorId
				var_1_0.kfzbInfo.enemyId = var_1_0.kfzbInfo.isAttacker and var_10_1.p2.competitorId or var_10_1.p1.competitorId
			else
				var_1_0.kfzbInfo.competitorId2 = 0
				var_1_0.kfzbInfo.enemyId = 0
			end

			var_1_0.kfzbInfo.winTicket = var_10_1.winTicket
			var_1_0.kfzbInfo.matchId = var_10_1.matchId
			var_1_0.kfzbInfo.nextSRoundCD = var_10_1.battleCd
			var_1_0.kfzbInfo.round = var_10_1.round
			var_1_0.kfzbInfo.nextStateCD = arg_10_0.data.kfzbbaseInfo.nextStateCD
			var_1_0.kfzbInfo.layerNum = arg_10_0.data.layerNum
			var_1_0.kfzbInfo.strataXy = arg_10_0.data.strataXy

			if type(var_10_1.p1GivewayGIds) ~= "table" then
				var_10_1.p1GivewayGIds = {}
			end

			if type(var_10_1.p2GivewayGIds) ~= "table" then
				var_10_1.p2GivewayGIds = {}
			end

			var_1_0.kfzbInfo.canGiveway = arg_10_0.data.canGiveway
			var_1_0.kfzbInfo.p1GivewayGIds = var_10_1.p1GivewayGIds
			var_1_0.kfzbInfo.p2GivewayGIds = var_10_1.p2GivewayGIds
			var_1_0.kfzbInfo.p1NoUseTactic = var_10_1.p1NoUseTactic
			var_1_0.kfzbInfo.p2NoUseTactic = var_10_1.p2NoUseTactic
			var_1_0.kfzbInfo.p1BuffNum = var_10_1.p1BuffNum
			var_1_0.kfzbInfo.p2BuffNum = var_10_1.p2BuffNum
		end

		var_1_0.drawBackground(var_1_0.terrain)

		local var_10_2 = require("lua/game/battle/widget/kfzbCommonUi")

		if var_1_0.kfzbInfo.kfzbView then
			var_1_0.kfzbInfo.kfzbView:clearup()

			var_1_0.kfzbInfo.kfzbView = nil
		end

		var_1_0.kfzbInfo.kfzbView = var_10_2:create(var_1_0)
	end

	function var_1_0.watchKfzb(arg_11_0, arg_11_1)
		log.info("@@ 跨服争霸,battleControl.watchKfzb", arg_11_0, arg_11_1)

		var_1_0.kfzbInfo = var_1_0.kfzbInfo or {}
		var_1_0.kfzbInfo.kfzbState = arg_11_0

		local function var_11_0()
			log.info("@@ 跨服争霸,enterFight")

			var_1_0.battleId = nil

			if arg_11_0 == kfzbState.fight then
				log.info("@@ 进入跨服争霸战斗流程")
				var_1_0.enterFigth(arg_11_1)
			elseif arg_11_0 == kfzbState.result then
				log.info("@@ 进入跨服争霸结果")
				var_1_0.showKfzbResult(arg_11_1)
			elseif arg_11_0 == kfzbState.prepare then
				log.info("@@ 进入跨服争霸准备")
				var_1_0.showKfzbPrepare()

				if arg_11_1.dice then
					var_1_0.kfwdDice = var_1_0.kfwdDice or require("lua/game/battle/widget/kfwdDice")

					var_1_0.kfwdDice:create(var_1_0, arg_11_1)
				elseif var_1_0.kfwdDice then
					var_1_0.kfwdDice:clear()
					var_1_0.kfwdDice:removeFromParentAndCleanup(true)

					var_1_0.kfwdDice = nil
				end
			elseif arg_11_0 == kfzbState.support then
				log.info("@@ 进入跨服争霸支持界面")
				var_1_0.showKfzbPrepare()
			elseif arg_11_0 == kfzbState.fightWatch then
				log.info("@@ 进入跨服争霸,观看战斗流程")
				var_1_0.enterFigth(arg_11_1)
			end
		end

		local function var_11_1(arg_13_0)
			log.info("@@ 跨服争霸,matchInfoCallback")
			var_1_0.updateKfzbInfo(arg_13_0)
			var_11_0()
		end

		if arg_11_0 == kfzbState.support or arg_11_0 == kfzbState.fightWatch then
			log.info("@@ 跨服争霸,actions.kfzbGetSupportPanel")
			cmgr.sendRequest(var_11_1, actions.kfzbGetSupportPanel, kfzbControl.supportData.matchId)
		else
			kfcmgr.sendRequest(var_11_1, actions.kfzbGetMatchRTInfo)
		end
	end

	function var_1_0.showKfzbResult(arg_14_0)
		log.info("battleControl.showKfzbResult,跨服争霸结果面板")

		var_1_0.kfzbInfo.kfzbState = kfzbState.result

		if var_1_0.kfzbInfo.kfzbView then
			var_1_0.kfzbInfo.kfzbView:updateVisible()
		end

		require("lua/game/battle/widget/kfzbResultPanel"):create(var_1_0, arg_14_0)
	end

	function var_1_0.showKfzbPrepare()
		log.info("battleControl.showKfzbPrepare,跨服争霸准备界面")

		var_1_0.isBattleStart = true

		var_1_0.fightControl:clearup()
		var_1_0.fightControl:init()

		local var_15_0 = require("lua/game/battle/widget/kfzbPrepare")

		var_1_0.kfzbInfo.prepareView = var_15_0

		var_15_0:create(var_1_0)
	end

	function var_1_0.kfzbInit()
		local function var_16_0(arg_17_0)
			local var_17_0 = arg_17_0.data

			if var_17_0.battleIni then
				log.info("@@ 跨服争霸，进入战斗")

				var_1_0.kfzbInfo.kfzbState = kfzbState.fight

				var_1_0.enterFigth(var_17_0.battleIni)
			elseif var_17_0.battleRes then
				log.info("@@ 跨服争霸，结果面板")

				var_1_0.kfzbInfo.kfzbState = kfzbState.result

				var_1_0.showKfzbResult(var_17_0.battleRes)
			end
		end

		kfcmgr.sendRequest(var_16_0, actions.kfzbGetBattleIniInfo)
	end

	function var_1_0.showKfzbWaitLb()
		log.info("showKfzbWaitLb")

		local var_18_0 = CCStrokeLabelTTF:create(language.get(490057), "Thonburi", 26, 2)

		var_18_0:setColor(colorQuality[3])
		var_18_0:setAnchorPoint(ccp(0, 0.5))
		var_18_0:setPosition(visibleSize.width / 2 + 100, visibleSize.height / 2)
		var_1_0.layerTabel.uiLayer:addChild(var_18_0, 100)

		local var_18_1 = CCArray:create()

		var_18_1:addObject(CCDelayTime:create(2))
		var_18_1:addObject(CCCallFunc:create(function()
			kfzbControl.kfzbGetSupportPanel(var_1_0.kfzbInfo.matchId)
			var_18_0:removeFromParentAndCleanup(true)
		end))
		var_18_0:runAction(CCSequence:create(var_18_1))
	end

	function var_1_0.updateKfwdInfo(arg_20_0)
		local var_20_0 = arg_20_0.bInfo

		var_1_0.terrain = var_20_0.terrain
		var_1_0.kfwdInfo = var_1_0.kfwdInfo or {}
		var_1_0.kfwdInfo.battleCD = var_20_0.battleCD
		var_1_0.kfwdInfo.competitorId = var_20_0.competitorId
		var_1_0.kfwdInfo.competitorId1 = var_20_0.competitorId1
		var_1_0.kfwdInfo.competitorId2 = var_20_0.competitorId2
		var_1_0.kfwdInfo.isAttacker = var_1_0.kfwdInfo.competitorId == var_1_0.kfwdInfo.competitorId1
		var_1_0.kfwdInfo.enemyId = var_1_0.kfwdInfo.isAttacker and var_20_0.competitorId2 or var_20_0.competitorId1
		var_1_0.kfwdInfo.doubleCoef = var_20_0.doubleCoef
		var_1_0.kfwdInfo.doubleCost = var_20_0.doubleCost
		var_1_0.kfwdInfo.inspire1 = var_20_0.inspire1
		var_1_0.kfwdInfo.inspire2 = var_20_0.inspire2
		var_1_0.kfwdInfo.lastScore = var_20_0.lastScore
		var_1_0.kfwdInfo.lastTicket = var_20_0.lastTicket
		var_1_0.kfwdInfo.matchId = var_20_0.matchId
		var_1_0.kfwdInfo.nextSRoundCD = var_20_0.nextSRoundCD
		var_1_0.kfwdInfo.round = var_20_0.round
		var_1_0.kfwdInfo.score = var_20_0.score
		var_1_0.kfwdInfo.ticket = var_20_0.ticket
		var_1_0.kfwdInfo.p1Info = var_20_0.p1Info
		var_1_0.kfwdInfo.p2Info = var_20_0.p2Info
		var_1_0.kfwdInfo.p1gInfo = var_20_0.p1gInfo
		var_1_0.kfwdInfo.p2gInfo = var_20_0.p2gInfo
		var_1_0.kfwdInfo.nextStateCD = arg_20_0.kfwdbaseInfo.nextStateCD

		var_1_0.drawBackground(var_1_0.terrain)

		local var_20_1 = require("lua/game/battle/widget/kfwdCommonUi")

		if var_1_0.kfwdInfo.kfwdView then
			var_1_0.kfwdInfo.kfwdView:clearup()

			var_1_0.kfwdInfo.kfwdView = nil
		end

		var_1_0.kfwdInfo.kfwdView = var_20_1:create(var_1_0)
	end

	function var_1_0.watchKfwd(arg_21_0, arg_21_1)
		var_1_0.kfwdInfo = var_1_0.kfwdInfo or {}
		var_1_0.kfwdInfo.kfwdState = arg_21_0

		local function var_21_0()
			var_1_0.battleId = nil

			if arg_21_0 == kfwdState.fight then
				log.info("@@ 进入跨服武斗战斗流程")
				var_1_0.enterFigth(arg_21_1)
			elseif arg_21_0 == kfwdState.result then
				var_1_0.showKfwdResult(arg_21_1)
			elseif arg_21_0 == kfwdState.over then
				var_1_0.drawBackground(0)
				var_1_0.showKfwdJifenbang()
			elseif arg_21_0 == kfwdState.prepare then
				var_1_0.showKfwdPrepare()
			end
		end

		local function var_21_1(arg_23_0)
			var_1_0.updateKfwdInfo(arg_23_0.data)
			var_21_0()
		end

		kfcmgr.sendRequest(var_21_1, actions.kfwdMatchRTInfo)
	end

	function var_1_0.showKfwdResult(arg_24_0)
		var_1_0.kfwdInfo.kfwdState = kfwdState.result

		if var_1_0.kfwdInfo.kfwdView then
			var_1_0.kfwdInfo.kfwdView:updateVisible()
		end

		require("lua/game/battle/widget/kfwdResultPanel"):create(var_1_0, arg_24_0)
	end

	function var_1_0.showKfwdJifenbang(arg_25_0)
		require("lua/game/battle/widget/kfwdJifengbang"):create(var_1_0, arg_25_0)
	end

	function var_1_0.showKfwdPrepare()
		var_1_0.isBattleStart = true

		var_1_0.fightControl:clearup()
		var_1_0.fightControl:init()
		require("lua/game/battle/widget/kfwdPrepare"):create(var_1_0)
	end

	function var_1_0.kfwdInit()
		local function var_27_0(arg_28_0)
			local var_28_0 = arg_28_0.data

			if var_28_0.battleIni then
				log.info("@@ 跨服武斗，进入战斗")

				var_1_0.kfwdInfo.kfwdState = kfwdState.fight

				var_1_0.enterFigth(var_28_0.battleIni)
			elseif var_28_0.battleRes then
				log.info("@@ 跨服武斗，结果面板")

				var_1_0.kfwdInfo.kfwdState = kfwdState.result

				var_1_0.showKfwdResult(var_28_0.battleRes)
			end
		end

		kfcmgr.sendRequest(var_27_0, actions.kfwdInit)
	end

	function var_1_0.getKfwdInfo()
		local function var_29_0(arg_30_0)
			local var_30_0 = arg_30_0.data.bInfo
			local var_30_1 = var_30_0.round

			var_1_0.updateKfwdInfo(arg_30_0.data)

			local var_30_2 = var_30_0.nextSRoundCD

			var_1_0.updateKfwdInfo(arg_30_0.data)

			if var_30_2 / 3600000 > 1 or var_30_1 > 15 then
				log.info("@@ 比赛结束，显示积分榜")
				var_1_0.watchKfwd(kfwdState.over)
			elseif var_30_2 > 0 then
				log.info("@@ 比赛准备界面")
				var_1_0.watchKfwd(kfwdState.prepare)
			else
				var_1_0.kfwdInit()
			end
		end

		kfcmgr.sendRequest(var_29_0, actions.kfwdMatchRTInfo)
	end

	function var_1_0.handlerPushKfwdRtInfo(arg_31_0)
		log.info("@@ 跨服武斗实时更新推送，停止当前都的战斗")

		var_1_0.isBattleStart = false

		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.kfwdResultPanel)
		var_1_0.getKfwdInfo()
	end

	function var_1_0.showPerparePanel(arg_32_0, arg_32_1)
		if var_1_0.battleType == battleType.BATTLE_LTZB then
			require("lua/game/battle/widget/ltzbPrepare"):create(var_1_0, arg_32_0, arg_32_1)
		else
			local var_32_0 = createPerparePanel(var_1_0, arg_32_0, arg_32_1)

			var_1_0.layerTabel.prepareLayer:addChild(var_32_0)
		end
	end

	function var_1_0.prepare(arg_33_0, arg_33_1, arg_33_2)
		var_1_0.terrain = arg_33_1
		var_1_0.targetId = arg_33_0

		cmgr.sendRequest(var_1_0.handlerBattlePrepare, actions.battlePrepare, arg_33_1, arg_33_2, var_1_0.battleType, arg_33_0)
	end

	function var_1_0.handlerBattlePrepare(arg_34_0)
		log.info("-----------bctr.battlePrepare------------")

		local var_34_0 = arg_34_0.data or arg_34_0.action.data

		var_1_0.battleId = var_1_0.battleId or var_34_0.battleId
		var_1_0.targetId = var_34_0.targetId
		var_1_0.terrain = var_34_0.terrain
		var_1_0.terrainPic = var_34_0.terrainPic or 1
		var_1_0.figthSide = var_1_0.checkSide(var_34_0.side)

		var_1_0.drawBackground(var_1_0.terrainPic)

		var_1_0.arenaType = var_34_0.arenaType
		var_1_0.battleType = var_34_0.battleType
		var_1_0.autoSt = var_34_0.autoSt
		var_1_0.noEquip = var_34_0.noEquip

		if var_34_0.food then
			var_1_0.cost.food = var_34_0.food
		end

		var_1_0.battleData = {}
		var_1_0.fightTitle = var_34_0.bat
		var_1_0.ownSide = var_34_0.ownSide
		var_1_0.attTeam = var_34_0.attTeam
		var_1_0.defTeam = var_34_0.defTeam
		var_1_0.autoCd = var_34_0.autoCd
		var_1_0.colosseumRound = var_34_0.colosseumRound
		var_1_0.colosseumFinish = var_34_0.colosseumFinish

		if var_34_0.inBattle and (var_34_0.battleId or var_34_0.teamId) then
			var_1_0.battleType = var_34_0.battleType
			var_1_0.battleId = var_34_0.battleId

			if var_34_0.teamId then
				var_1_0.watchKfgz(var_34_0.teamId)
			else
				var_1_0.watchBattle(var_34_0)
			end
		else
			local var_34_1 = var_34_0.attGenerals
			local var_34_2 = var_34_0.defGenerals

			var_1_0.checkIndex(var_34_1)
			var_1_0.checkIndex(var_34_2)
			var_1_0.showPerparePanel(var_34_1, var_34_2)
		end

		var_1_0.arenaInfo.arenaType = var_34_0.arenaType
		var_1_0.arenaInfo.arenaTimes = var_34_0.arenaTimes
		var_1_0.arenaInfo.champion = var_34_0.champion

		var_1_0.championChange()
	end

	function var_1_0.checkIndex(arg_35_0)
		local var_35_0 = {}
		local var_35_1 = -1

		for iter_35_0 = 0, 4 do
			var_35_0[iter_35_0] = false
		end

		for iter_35_1 = 1, 5 do
			if arg_35_0[iter_35_1] and arg_35_0[iter_35_1].index then
				var_35_0[arg_35_0[iter_35_1].index] = true
			end
		end

		for iter_35_2 = 0, 4 do
			if var_35_0[iter_35_2] == false and var_35_0[iter_35_2 + 1] == true then
				var_35_1 = iter_35_2

				log.info("skip num : " .. var_35_1)

				break
			end
		end

		if var_35_1 >= 0 then
			for iter_35_3 = 1, 5 do
				if arg_35_0[iter_35_3] and var_35_1 < arg_35_0[iter_35_3].index then
					arg_35_0[iter_35_3].index = arg_35_0[iter_35_3].index - 1
				end
			end
		end
	end

	function var_1_0.addCityName(arg_36_0)
		if smgr.lastSceneTag and smgr.lastSceneTag == SCENE_INSTANCE then
			return
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ and arg_36_0 == 8023 or arg_36_0 == 8024 or arg_36_0 == 8025 then
			local var_36_0 = CCStrokeLabelTTF:create(language.get(218019), "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

			var_36_0:setColor(ccc3(255, 255, 204))
			var_36_0:setPosition(visibleSize.width * 0.5 - 40, visibleSize.height * 0.93 - 7)
			var_36_0:setAnchorPoint(ccp(0, 0.5))
			var_1_0.layerTabel.uiLayer:addChild(var_36_0)
		end
	end

	function var_1_0.addSpecialCityName(arg_37_0)
		if smgr.lastSceneTag and smgr.lastSceneTag == SCENE_INSTANCE then
			return
		end

		local var_37_0
		local var_37_1

		if arg_37_0 == 38 or arg_37_0 == 109 or arg_37_0 == 227 or arg_37_0 == 5031 or arg_37_0 == 5032 or arg_37_0 == 5040 then
			var_37_0 = CCSprite:create("res/ui/world/tscc_tit_canyon.png")
			var_37_1 = CCStrokeLabelTTF:create(language.get(113027), "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

			var_37_1:setColor(ccc3(255, 255, 204))
		elseif not var_1_0.battleType == battleType.BATTLE_JBYW and arg_37_0 == 45 or arg_37_0 == 110 or arg_37_0 == 181 then
			var_37_0 = CCSprite:create("res/ui/world/tscc_tit_alp.png")
			var_37_1 = CCStrokeLabelTTF:create(language.get(113031), "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

			var_37_1:setColor(ccc3(255, 255, 204))
		elseif arg_37_0 == 40 or arg_37_0 == 116 or arg_37_0 == 224 then
			var_37_0 = CCSprite:create("res/ui/world/tscc_tit_jungle.png")
			var_37_1 = CCStrokeLabelTTF:create(language.get(113030), "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

			var_37_1:setColor(ccc3(255, 255, 204))
		elseif arg_37_0 == 134 or arg_37_0 == 137 or arg_37_0 == 101 or arg_37_0 == 104 or arg_37_0 == 56 or arg_37_0 == 142 then
			var_37_0 = CCSprite:create("res/ui/world/tscc_tit_slope.png")
			var_37_1 = CCStrokeLabelTTF:create(language.get(113035), "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

			var_37_1:setColor(ccc3(255, 255, 204))
		end

		if not var_37_0 then
			return
		end

		var_37_0:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.93)
		var_37_0:setScale(1.3)
		var_37_1:setPosition(visibleSize.width * 0.5 + 65, visibleSize.height * 0.93 - 7)
		var_37_1:setAnchorPoint(ccp(0, 0.5))
		var_1_0.layerTabel.uiLayer:addChild(var_37_0)
		var_1_0.layerTabel.uiLayer:addChild(var_37_1)
	end

	function var_1_0.addLigntningInfo(arg_38_0)
		if smgr.lastSceneTag and smgr.lastSceneTag == SCENE_INSTANCE then
			return
		end

		var_1_0.removeLigntningInfo()

		local var_38_0 = CCStrokeLabelTTF:create(language.get(188112, arg_38_0), "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

		var_38_0:setColor(ccc3(255, 255, 204))
		var_38_0:setPosition(visibleSize.width * 0.5 - 50, visibleSize.height * 0.93 - 100)
		var_38_0:setAnchorPoint(ccp(0, 0.5))
		var_1_0.layerTabel.uiLayer:addChild(var_38_0)

		var_1_0.LigntningInfoUI = var_38_0
	end

	function var_1_0.removeLigntningInfo()
		if var_1_0.LigntningInfoUI and not tolua.isnull(var_1_0.LigntningInfoUI) then
			var_1_0.LigntningInfoUI:removeFromParentAndCleanup(true)
		end
	end

	function var_1_0.addZhengxing(arg_40_0, arg_40_1, arg_40_2)
		local var_40_0 = "Thonburi"
		local var_40_1 = 25
		local var_40_2 = {}

		var_40_2[1] = "bs"
		var_40_2[2] = "hy"
		var_40_2[3] = "yl"
		var_40_2[4] = "cs"
		var_40_2[5] = "bg"

		local var_40_3 = CCSprite:create("res/ui/instance/zhenxing/zx_" .. var_40_2[arg_40_0] .. ".png")
		local var_40_4 = CCStrokeLabelTTF:create(arg_40_1, var_40_0, 22, 1, ccc3(13, 13, 13))

		var_40_4:setColor(ccc3(255, 255, 255))
		var_40_3:setPosition(visibleSize.width * 0.62, visibleSize.height * 0.93)
		var_40_3:setScale(0.7)
		var_40_4:setPosition(visibleSize.width * 0.62, visibleSize.height * 0.93 - 40)
		var_1_0.layerTabel.uiLayer:addChild(var_40_3)
		var_1_0.layerTabel.uiLayer:addChild(var_40_4)
	end

	function var_1_0.handlerGeneralRecover(arg_41_0)
		return
	end

	function var_1_0.showFightResult(arg_42_0)
		var_1_0.fightControl:clearup()
		var_1_0.fightControl:init()

		if var_1_0.battleType == battleType.BATTLE_KFWD then
			var_1_0.showKfwdResult(arg_42_0)
		elseif var_1_0.battleType == battleType.BATTLE_KFZB then
			var_1_0.showKfzbResult(arg_42_0)
		else
			require("lua/game/battle/widget/battleResultPanel")
			createBattleResultPanle(var_1_0, arg_42_0)
		end
	end

	function var_1_0.handlerBattleStart(arg_43_0)
		local var_43_0 = arg_43_0.data or arg_43_0.action.data

		var_1_0.battleType = var_43_0.battleType
		var_1_0.battleId = var_43_0.battleId

		var_1_0.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)

		if var_43_0.teamId then
			var_1_0.watchKfgz(var_43_0.teamId)
		else
			var_1_0.watch()
		end
	end

	function var_1_0.enterFigth(arg_44_0)
		var_1_0.layerTabel.prepareLayer:removeAllChildrenWithCleanup(true)

		if var_1_0.fightControl then
			var_1_0.fightControl:clearup()
			var_1_0.fightControl:init()

			var_1_0.isBattleStart = true

			log.info("@@ 进入战斗")
			var_1_0.fightControl.doBattleReport(arg_44_0)
		end
	end

	function var_1_0.showEffect(arg_45_0, arg_45_1, arg_45_2)
		local var_45_0 = var_1_0.effectTag

		var_1_0.effectTag = var_1_0.effectTag + 1

		local function var_45_1()
			tool.safeRemoveChildByTag(var_1_0.layerTabel.effectLayer, var_45_0)
		end

		if arg_45_1 == nil then
			return
		end

		local var_45_2

		if arg_45_0 == effectType.animArray then
			local var_45_3 = CCCallFuncN:create(var_45_1)
			local var_45_4 = CCArray:create()

			var_45_4:addObject(arg_45_1)
			var_45_4:addObject(var_45_3)

			local var_45_5 = CCSequence:create(var_45_4)

			var_45_2 = CCSprite:create()

			var_45_2:runAction(var_45_5)
		elseif arg_45_0 == effectType.lostHp then
			var_45_2 = arg_45_1

			local var_45_6 = CCMoveBy:create(0.7, ccp(0, 30))
			local var_45_7 = CCCallFuncN:create(var_45_1)
			local var_45_8 = CCArray:create()

			var_45_8:addObject(var_45_6)
			var_45_8:addObject(var_45_7)

			local var_45_9 = CCSequence:create(var_45_8)

			var_45_2:runAction(var_45_9)
		elseif arg_45_0 == effectType.reward then
			var_45_2 = arg_45_1

			local var_45_10 = CCMoveBy:create(0.7, ccp(0, 60))
			local var_45_11 = CCCallFuncN:create(var_45_1)
			local var_45_12 = CCArray:create()

			var_45_12:addObject(var_45_10)
			var_45_12:addObject(var_45_11)

			local var_45_13 = CCSequence:create(var_45_12)

			var_45_2:runAction(var_45_13)
		end

		var_45_2:setPosition(arg_45_2)
		var_1_0.layerTabel.effectLayer:addChild(var_45_2, 0, var_45_0)
	end

	function var_1_0.updateGenerelList(arg_47_0)
		if var_1_0.layerTabel.uiLayer and arg_47_0 then
			if arg_47_0.attacker then
				if not var_1_0.attGenerlListControl then
					var_1_0.attGenerlListControl = showGeneralListPanel(var_1_0, var_1_0.layerTabel.uiLayer, "att", arg_47_0.attackerNum, var_1_0.battleId)
				end

				var_1_0.attGenerlListControl:updateData(arg_47_0.newJoinList, arg_47_0.attackerNum)
			end

			if arg_47_0.defender then
				if not var_1_0.defGenerlListControl then
					var_1_0.defGenerlListControl = showGeneralListPanel(var_1_0, var_1_0.layerTabel.uiLayer, "def", arg_47_0.defenderNum, var_1_0.battleId)
				end

				var_1_0.defGenerlListControl:updateData(arg_47_0.newJoinList, arg_47_0.defenderNum)
			end
		end
	end

	function var_1_0.handlerAutoUseStrategy(arg_48_0)
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_1_0.autoSt = arg_48_0.data.autoAtt
		else
			var_1_0.autoSt = 1
		end

		var_1_0.showFightHelper()
		showFightTip(var_1_0, tipType.selfToAuto)
	end

	function var_1_0.handlerCancelAutoStrategy(arg_49_0)
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_1_0.autoSt = arg_49_0.data.autoAtt
		else
			var_1_0.autoSt = 0
		end

		var_1_0.showFightHelper()
		showFightTip(var_1_0, tipType.autoToself)
	end

	function var_1_0.autoUseStrategy()
		if var_1_0.battleType == battleType.BATTLE_KFGZ or var_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			kfcmgr.sendRequest(var_1_0.handlerAutoUseStrategy, actions.kfgzAutoAttack)
		else
			cmgr.sendRequest(var_1_0.handlerAutoUseStrategy, actions.autoStategy)
		end
	end

	function var_1_0.cancelAutoStrategy()
		if var_1_0.battleType == battleType.BATTLE_KFGZ or var_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			kfcmgr.sendRequest(var_1_0.handlerCancelAutoStrategy, actions.kfgzAutoAttack)
		else
			cmgr.sendRequest(var_1_0.handlerCancelAutoStrategy, actions.canselAutoStategy)
		end
	end

	function var_1_0.handlerUseStrategy(arg_52_0)
		log.info("@@  使用战术")
		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.tacticsPanel)
	end

	function var_1_0.showFightHelper()
		createFightHelper(var_1_0)
	end

	function var_1_0.hideFightHelper()
		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.fightHelper)

		if var_1_0.fightControl then
			var_1_0.fightControl.hideTimer()
		end
	end

	function var_1_0.handlerJoinBattle(arg_55_0)
		showFightTip(var_1_0, tipType.joinBattle)
	end

	function var_1_0.helpFight()
		cmgr.sendRequest(var_1_0.handlerJoinBattle, actions.joinBattle, var_1_0.battleId)
	end

	function var_1_0.showHelpFightButton()
		log.info("@@ 显示出手相助按钮")

		local var_57_0 = CCMenu:create()
		local var_57_1 = CCSprite:createWithSpriteFrameName("btn3_gre_a.png")
		local var_57_2 = CCSprite:createWithSpriteFrameName("btn3_gre_c.png")
		local var_57_3 = CCMenuItemSprite:create(var_57_1, var_57_2)
		local var_57_4 = CCStrokeLabelTTF:create(language.get(400046), "Thonburi-Bold", 26)

		var_57_4:setPosition(ccp(70, 29))
		var_57_3:addChild(var_57_4)
		var_57_3:registerScriptTapHandler(var_1_0.helpFight)
		var_57_3:setPosition(ccp(visibleSize.width * 0.5, 45))
		var_57_0:addChild(var_57_3)
		var_57_0:setPosition(ccp(0, 0))
		var_1_0.layerTabel.uiLayer:addChild(var_57_0)
	end

	function var_1_0.watchBattle(arg_58_0)
		var_1_0.battleType = arg_58_0.battleType
		var_1_0.npcId = arg_58_0.npcId
		var_1_0.figthSide = var_1_0.checkSide(arg_58_0.side)
		var_1_0.terrain = arg_58_0.terrain
		var_1_0.terrainPic = arg_58_0.terrainPic
		var_1_0.autoSt = arg_58_0.autoSt
		var_1_0.cityId = var_1_0.cityId or arg_58_0.cityId or arg_58_0.targetId
		var_1_0.team.id = arg_58_0.teamId
		var_1_0.hasOfficerToken = arg_58_0.hasOfficerToken
		var_1_0.officerTokenNum = arg_58_0.num
		var_1_0.leftLitTimes = arg_58_0.leftLitTimes
		var_1_0.fire = arg_58_0.fire
		user.leftChainTimes = arg_58_0.leftChainTimes
		var_1_0.battleId = arg_58_0.battleId or arg_58_0.teamId
		var_1_0.targetName = arg_58_0.targetName
		var_1_0.slaughterCd = arg_58_0.slaughterCd
		var_1_0.slaughterLimit = arg_58_0.slaughterLimit
		var_1_0.leftSTimes = arg_58_0.leftSTimes
		var_1_0.castleIndex = arg_58_0.castleIndex
		var_1_0.category = arg_58_0.category

		if var_1_0.castleIndex then
			var_1_0.isCastle(var_1_0.castleIndex, var_1_0.category)
		end

		var_1_0.canDetonate = arg_58_0.canDetonate
		var_1_0.battleFlag = arg_58_0.battleFlag
		var_1_0.availablePhantoms = arg_58_0.availablePhantoms
		var_1_0.leftSoloNum = arg_58_0.leftSoloNum
		var_1_0.leftTujinNum = arg_58_0.leftTujinNum
		var_1_0.leftFusion = arg_58_0.leftFusion
		var_1_0.leftFision = arg_58_0.leftFision
		var_1_0.leftHbqNum = arg_58_0.leftHbqNum
		var_1_0.openHbq = arg_58_0.openHbq
		var_1_0.hbqKills = arg_58_0.hbqKills
		var_1_0.fission = arg_58_0.fission
		var_1_0.diedCastleNpc = arg_58_0.diedCastleNpc
		var_1_0.corpsInfo = arg_58_0.corpsInfo

		if var_1_0.hbqKills then
			if var_1_0.hbqKills.att then
				var_1_0.showHbqTip("att", var_1_0.hbqKills.att.playerName, var_1_0.hbqKills.att.kills)
			end

			if var_1_0.hbqKills.def then
				var_1_0.showHbqTip("def", var_1_0.hbqKills.def.playerName, var_1_0.hbqKills.def.kills)
			end
		end

		if var_1_0.fission then
			if var_1_0.fission.att then
				var_1_0.showFissionTip("att", var_1_0.fission.att.playerName, var_1_0.fission.att.dants)
			end

			if var_1_0.fission.def then
				var_1_0.showFissionTip("def", var_1_0.fission.def.playerName, var_1_0.fission.def.dants)
			end
		end

		if var_1_0.diedCastleNpc then
			if var_1_0.diedCastleNpc.att then
				var_1_0.showDiedCastleNpcTip("att", var_1_0.diedCastleNpc.att.diedNum)
			end

			if var_1_0.diedCastleNpc.def then
				var_1_0.showDiedCastleNpcTip("def", var_1_0.diedCastleNpc.def.diedNum)
			end
		end

		var_1_0.currentPhantomType = BATTLE_PHANTOM_NORMAL
		var_1_0.freePhantomCount = arg_58_0.freePhantomCount
		var_1_0.phantomMax = arg_58_0.phantomMax

		if var_1_0.battleType == battleType.BATTLE_SCENARIO or var_1_0.battleType == battleType.BATTLE_SCENARIO_ONE2ONE then
			var_1_0.juBenLeftJieBing = arg_58_0.juBenLeftJieBing
		end

		var_1_0.isInNationTryOrUpgrade = arg_58_0.isInNationTryOrUpgrade

		if arg_58_0.firstEnter == true then
			var_1_0.firstEnterSpecialCity(var_1_0.cityId)
		end

		if arg_58_0.matrixId then
			log.info("有阵型！！！！！！！！！！！！！！！！！")
			var_1_0.addZhengxing(arg_58_0.matrixId, arg_58_0.matrixName, arg_58_0.matrixIntro)
		end

		var_1_0.addSpecialCityName(var_1_0.cityId)
		var_1_0.addCityName(var_1_0.cityId)

		if arg_58_0.battleTowerId ~= nil then
			log.info("battleData.battleTowerId: " .. arg_58_0.battleTowerId)

			var_1_0.battleTowerId = arg_58_0.battleTowerId
			var_1_0.battleTowerForceId = arg_58_0.battleTowerForceId
			var_1_0.battleTowerDurability = arg_58_0.battleTowerDurability

			var_1_0.updateBattleTower()
		end

		var_1_0.paoJiNum = nil
		var_1_0.paojiAlreadyCount = nil

		if arg_58_0.paoJiNum ~= nil then
			log.info("battleData.paoJiNum: " .. arg_58_0.paoJiNum)

			var_1_0.paoJiNum = arg_58_0.paoJiNum
			var_1_0.paojiAlreadyCount = arg_58_0.paojiAlreadyCount
		end

		if arg_58_0.quickGold then
			log.info("battleData.quickGold: " .. arg_58_0.quickGold)

			var_1_0.quickGold = arg_58_0.quickGold

			local var_58_0 = {
				sp1 = CCSprite:create("res/ui/battle/quickBattle/btn_tg.png"),
				sp2 = CCSprite:create("res/ui/battle/quickBattle/btn_tg_c.png")
			}

			local function var_58_1()
				local function var_59_0()
					log.info("quickBattle success!")
					showFightTip(var_1_0, nil)
				end

				cmgr.sendRequest(var_59_0, actions.quickBattle, var_1_0.battleId)
			end

			local function var_58_2()
				messageBox.showChargeWinWithData(language.get(10003), language.get(490300, arg_58_0.quickGold), "quickBattle", var_58_1)
			end

			local var_58_3 = CCMenuItemSprite:create(var_58_0.sp1, var_58_0.sp2)

			var_58_3:registerScriptTapHandler(var_58_2)
			var_58_3:setPosition(ccp(visibleSize.width - var_58_3:getContentSize().width / 2 * 3 - 30, visibleSize.height - var_58_3:getContentSize().height / 2 - 10))

			local var_58_4 = CCMenu:create()

			var_58_4:setPosition(ccp(0, 0))
			var_58_4:addChild(var_58_3)
			var_1_0.layerTabel.uiLayer:addChild(var_58_4, -1, 1001)

			local var_58_5 = CCSprite:createWithSpriteFrameName("res_icon_19_small.png")

			var_58_5:setScale(0.9)

			local var_58_6 = CCLabelAtlas:create(tostring(arg_58_0.quickGold), "res/ui/common/number/up_numb.png", 16, 21, 48)

			var_58_6:setAnchorPoint(ccp(0.5, 0.5))

			local var_58_7 = createRichNode({
				var_58_5,
				var_58_6
			}, 0.5)

			var_58_7:setPosition(ccp(-10, 40))
			var_58_3:addChild(var_58_7, 2)
		end

		var_1_0.showCorpsNum()

		var_1_0.isBattleStart = true

		var_1_0.drawBackground(var_1_0.terrainPic)

		var_1_0.teamCost = 0

		var_1_0.getTeamInfo()

		if var_1_0.autoSt ~= -1 then
			var_1_0.showFightHelper()
		end

		if var_1_0.battleType == battleType.BATTLE_CITY or var_1_0.battleType == battleType.BATTLE_BARBARAIN or var_1_0.battleType == battleType.BATTLE_SCENARIO or var_1_0.battleType == battleType.BATTLE_SCENARIO_ONE2ONE or var_1_0.battleType == battleType.BATTLE_GROUP_MINE or var_1_0.battleType == battleType.BATTLE_OCCUPY or user.isYw then
			var_1_0.rightButtonControl = showFightRightButton(var_1_0)
		end

		if var_1_0.battleType == battleType.BATTLE_CITY or var_1_0.battleType == battleType.BATTLE_BARBARAIN or var_1_0.battleType == battleType.BATTLE_CITY_ONE2ONE or var_1_0.battleType == battleType.BATTLE_BARBARAIN_ONE2ONE or var_1_0.battleType == battleType.BATTLE_SCENARIO or var_1_0.battleType == battleType.BATTLE_SCENARIO_ONE2ONE or var_1_0.battleType == battleType.BATTLE_SCENARIO_EVENT or var_1_0.battleType == battleType.BATTLE_JBYW then
			showSimpleGeneralPanel(var_1_0.layerTabel.uiLayer, var_1_0.battleId)
		end

		if arg_58_0.hzState and arg_58_0.hzState == 1 then
			var_1_0.huizhanUI = require("lua/layer/nation/huizhan/HuizhanPrepareInBattle").new(arg_58_0)

			var_1_0.huizhanUI:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_1_0.layerTabel.uiLayer:addChild(var_1_0.huizhanUI)
		end

		var_1_0.viewType = arg_58_0.viewType

		if var_1_0.viewType and var_1_0.viewType == 1 then
			var_1_0.showHelpFightButton()
		end

		if arg_58_0.inBattle and arg_58_0.battleReport then
			var_1_0.enterFigth(arg_58_0.battleReport)
		end

		if arg_58_0.chain then
			var_1_0.cityLockInfo = arg_58_0.chain

			if var_1_0.cityLockInfo.state == nil then
				var_1_0.cityLockInfo.state = 0
			end

			eventManager.dispatchEvent("cityLockInfo", var_1_0.cityLockInfo)
		end

		var_1_0.surround = arg_58_0.surround or 0
		var_1_0.slam = arg_58_0.slam or 0
		var_1_0.slamCd = arg_58_0.slamCd or 0

		var_1_0.updateSurround()

		var_1_0.arenaInfo.arenaType = arg_58_0.arenaType
		var_1_0.arenaInfo.arenaTimes = arg_58_0.arenaTimes
		var_1_0.arenaInfo.champion = arg_58_0.champion
		var_1_0.arenaInfo.tauntTimes = arg_58_0.tauntTimes
		var_1_0.arenaInfo.tauntBuff = arg_58_0.tauntBuff

		var_1_0.championChange()
	end

	function var_1_0.handleWatchBattle(arg_62_0)
		var_1_0.watchBattle(arg_62_0.action.data)
	end

	function var_1_0.watch(arg_63_0)
		arg_63_0 = arg_63_0 or 0

		cmgr.sendRequest(var_1_0.handleWatchBattle, actions.watch, var_1_0.battleId, arg_63_0)
	end

	function var_1_0.handlerJiebing(arg_64_0)
		local var_64_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_64_0 = arg_64_0.data
			var_1_0.freePhantomCount = var_64_0.freeBuyPhantom
			var_1_0.remainBuyPhantom = var_64_0.remainBuyPhantom
			var_1_0.leftTujinNum = var_64_0.leftTujinNum or 0
			var_1_0.leftSoloNum = var_64_0.leftSoloNum or 0
			var_1_0.leftFusion = var_64_0.leftFusion or 0
			var_1_0.leftFision = var_64_0.leftFision or 0
			var_1_0.leftHbqNum = var_64_0.leftHbqNum or 0
		else
			var_64_0 = arg_64_0.action.data
			var_1_0.freePhantomCount = var_64_0.freePhantomCount
			var_1_0.leftTujinNum = var_64_0.leftTujinNum or 0
			var_1_0.leftSoloNum = var_64_0.leftSoloNum or 0
			var_1_0.leftFusion = var_64_0.leftFusion or 0
			var_1_0.leftFision = var_64_0.leftFision or 0
			var_1_0.leftHbqNum = var_64_0.leftHbqNum or 0
		end

		if var_1_0.freePhantomCount < 0 then
			var_1_0.freePhantomCount = 0
		end

		if var_1_0.leftTujinNum < 0 then
			var_1_0.leftTujinNum = 0
		end

		if var_1_0.leftSoloNum < 0 then
			var_1_0.leftSoloNum = 0
		end

		if var_1_0.leftFusion < 0 then
			var_1_0.leftFusion = 0
		end

		if var_1_0.leftFision < 0 then
			var_1_0.leftFision = 0
		end

		if var_1_0.leftHbqNum < 0 then
			var_1_0.leftHbqNum = 0
		end

		if (var_1_0.battleType == battleType.BATTLE_SCENARIO or var_1_0.battleType == battleType.BATTLE_SCENARIO_ONE2ONE) and var_64_0.juBenLeftJieBing then
			var_1_0.juBenLeftJieBing = var_64_0.juBenLeftJieBing
		end

		if var_1_0.rightButtonControl then
			var_1_0.rightButtonControl:update()
		end

		showFightTip(var_1_0, tipType.jiebingSucc, var_64_0)
	end

	function var_1_0.jiebing()
		local function var_65_0()
			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				kfcmgr.sendRequest(var_1_0.handlerJiebing, actions.kfgzBuyPhantom, 1, var_1_0.cityId, var_1_0.currentPhantomType or 0)
			else
				cmgr.sendRequest(var_1_0.handlerJiebing, actions.copyArmy, 1, var_1_0.battleId, var_1_0.currentPhantomType or 0)
			end
		end

		if var_1_0.copyGold > 0 then
			messageBox.showChargeWin("", language.get(190306, var_1_0.copyGold, 1), "jiebingGold", var_65_0)
		else
			var_65_0()
		end
	end

	function var_1_0.jiebingX10()
		local var_67_0 = var_1_0.copyNum10

		local function var_67_1()
			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				kfcmgr.sendRequest(var_1_0.handlerJiebing, actions.kfgzBuyPhantom, var_67_0, var_1_0.cityId, var_1_0.currentPhantomType or 0)
			else
				cmgr.sendRequest(var_1_0.handlerJiebing, actions.copyArmy, var_67_0, var_1_0.battleId, var_1_0.currentPhantomType or 0)
			end
		end

		if var_1_0.copyGold10 > 0 then
			messageBox.showChargeWin("", language.get(190306, var_1_0.copyGold10, var_67_0), "jiebingGold", var_67_1)
		else
			var_67_1()
		end
	end

	function var_1_0.juntuanDantiao()
		log.info("battleControl.juntuanDantiao")

		local function var_69_0(arg_70_0)
			local var_70_0 = arg_70_0.data or arg_70_0.action.data
			local var_70_1 = smgr.getLayer("tipLayer")

			if var_70_1 then
				local var_70_2 = CCSprite:create("res/ui/battle/battle_tip_background.png")

				var_70_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				var_70_1:addChild(var_70_2)

				local function var_70_3()
					var_70_1:removeChild(var_70_2, true)
				end

				local var_70_4 = CCSprite:create("res/ui/world/juntuan/jt_word_wgjtxdj.png")
				local var_70_5 = CCSprite:create("res/ui/world/juntuan/jt_word_bdfqdt.png")
				local var_70_6 = createRichNode({
					var_70_4,
					var_70_5
				}, 0.5)

				var_70_6:setScale(0.7)

				local var_70_7 = 200

				if var_70_6 then
					var_70_6:setPosition(ccp(var_70_2:getContentSize().width * 0.5 + var_70_7, var_70_2:getContentSize().height * 0.5))
					var_70_2:addChild(var_70_6)

					local var_70_8 = CCArray:create()

					var_70_8:addObject(CCFadeIn:create(0.06))
					var_70_8:addObject(CCMoveBy:create(0.3, ccp(-var_70_7, 0)))
					var_70_8:addObject(CCDelayTime:create(2.5))
					var_70_8:addObject(CCMoveBy:create(0.3, ccp(-var_70_7, 0)))
					var_70_8:addObject(CCFadeOut:create(0.06))
					var_70_8:addObject(CCCallFuncN:create(var_70_3))

					local var_70_9 = CCSequence:create(var_70_8)

					var_70_6:runAction(CCSequence:create(var_70_8))
				end
			end

			if var_70_0.soloCd and var_1_0.corpsInfo then
				var_1_0.corpsInfo.soloCd = var_70_0.soloCd

				if var_1_0.rightButtonControl then
					var_1_0.rightButtonControl:update()
				end
			end
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_69_0, actions.corpsSolo, var_1_0.battleId)
		else
			cmgr.sendRequest(var_69_0, actions.corpsSolo, var_1_0.battleId)
		end
	end

	function var_1_0.juntuanTujin()
		log.info("battleControl.juntuanTujin")

		local function var_72_0(arg_73_0)
			local var_73_0 = arg_73_0.data or arg_73_0.action.data
			local var_73_1 = string.split(var_1_0.battleId, "_")
			local var_73_2

			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				var_73_2 = var_73_1[2]
			else
				var_73_2 = var_73_1[3]
			end

			if var_73_0.cityOptions and table.getn(var_73_0.cityOptions) <= 0 then
				messageBox.alert(language.get(190080), language.get(190093))
			else
				local var_73_3 = {}

				var_73_3.option = "forward"
				var_73_3.cityId = var_73_2
				var_73_3.corpsId = var_73_0.corpsId
				var_73_3.data = var_73_0
				var_73_3.battleId = var_1_0.battleId

				if var_1_0.battleType == battleType.BATTLE_KFGZ then
					var_73_3.isKFWorld = true

					smgr.changeScene(SCENE_KFYZ_WORLD, 2, var_73_3, var_73_2)
				else
					smgr.changeScene(SCENE_WORLD, var_73_2, nil, var_73_3)
				end
			end
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_72_0, actions.corpsCheckDashAndWithdraw, var_1_0.teamId, true)
		else
			cmgr.sendRequest(var_72_0, actions.corpsCheckDashAndWithdraw, var_1_0.battleId, true)
		end
	end

	function var_1_0.juntuanChetui()
		local function var_74_0(arg_75_0)
			local var_75_0 = arg_75_0.data or arg_75_0.action.data
			local var_75_1 = string.split(var_1_0.battleId, "_")
			local var_75_2

			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				var_75_2 = var_75_1[2]
			else
				var_75_2 = var_75_1[3]
			end

			if var_75_0.cityOptions and table.getn(var_75_0.cityOptions) <= 0 then
				messageBox.alert(language.get(190080), language.get(190093))
			else
				local var_75_3 = {}

				var_75_3.option = "retreat"
				var_75_3.cityId = var_75_2
				var_75_3.corpsId = var_75_0.corpsId
				var_75_3.data = var_75_0
				var_75_3.battleId = var_1_0.battleId

				if var_1_0.battleType == battleType.BATTLE_KFGZ then
					var_75_3.isKFWorld = true

					smgr.changeScene(SCENE_KFYZ_WORLD, 2, var_75_3, var_75_2)
				else
					smgr.changeScene(SCENE_WORLD, var_75_2, nil, var_75_3)
				end
			end
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_74_0, actions.corpsCheckDashAndWithdraw, var_1_0.teamId, false)
		else
			cmgr.sendRequest(var_74_0, actions.corpsCheckDashAndWithdraw, var_1_0.battleId, false)
		end
	end

	function var_1_0.handlerYoudi(arg_76_0)
		local var_76_0 = arg_76_0.data or arg_76_0.action.data

		if var_76_0.youjun then
			var_1_0.milingDantiao(var_76_0.youjun.selfGeneral, var_76_0.youjun.youjunPlayer, var_76_0.youjun.youjunGeneral)
		end

		if var_76_0.battleId and user.battleSetting.changeSceneWhenSolo then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_CITY_ONE2ONE, {
				terrain = 0,
				target = 0,
				prepare = true,
				battleId = var_76_0.battleId,
				generalId = var_76_0.generalId
			})
		elseif var_76_0.soloTeamId and user.battleSetting.changeSceneWhenSolo then
			smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFGZ_SOLO, {
				teamId = var_76_0.soloTeamId
			})
		end

		showFightTip(var_1_0, tipType.youdiSucc, var_76_0)
	end

	function var_1_0.youdi()
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_1_0.handlerYoudi, actions.kfgzSolo, var_1_0.cityId)
		elseif var_1_0.figthSide == "att" then
			cmgr.sendRequest(var_1_0.handlerYoudi, actions.youdi, var_1_0.battleId)
		else
			cmgr.sendRequest(var_1_0.handlerYoudi, actions.chuji, var_1_0.battleId)
		end
	end

	function var_1_0.huoji()
		local function var_78_0(arg_79_0)
			var_1_0.leftLitTimes = var_1_0.leftLitTimes - 1

			if var_1_0.leftLitTimes < 0 then
				var_1_0.leftLitTimes = 0
			end

			if var_1_0.rightButtonControl then
				var_1_0.rightButtonControl:update()
			end
		end

		cmgr.sendRequest(var_78_0, actions.battleLitFire, var_1_0.battleId)
	end

	function var_1_0.miehuo()
		local function var_80_0(arg_81_0)
			return
		end

		cmgr.sendRequest(var_80_0, actions.battleExtinguish, var_1_0.battleId)
	end

	function var_1_0.tucheng()
		log.info("kick tucheng")

		local function var_82_0(arg_83_0)
			local var_83_0 = arg_83_0.data or arg_83_0.action.data

			showTable(var_83_0)

			local var_83_1 = {}

			for iter_83_0 = 1, #var_83_0.rewards do
				var_83_1[iter_83_0] = {}

				if var_83_0.rewards[iter_83_0].type == 17 then
					var_83_1[iter_83_0].id = 7
				else
					var_83_1[iter_83_0].id = var_83_0.rewards[iter_83_0].type
				end

				var_83_1[iter_83_0].value = var_83_0.rewards[iter_83_0].value
				var_83_1[iter_83_0].gemLevel = 1
			end

			globalAction_gotResource(var_83_1)
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_82_0, actions.gameserverSlaughter, var_1_0.teamId)
		else
			cmgr.sendRequest(var_82_0, actions.citySlaughter, var_1_0.battleId)
		end
	end

	function var_1_0.yuanzhengBomb()
		local function var_84_0(arg_85_0)
			local var_85_0 = arg_85_0.data

			user.bombNum = user.bombNum - 1

			if var_1_0.rightButtonControl then
				var_1_0.rightButtonControl:update()
			end
		end

		kfcmgr.sendRequest(var_84_0, actions.useTool, var_1_0.teamId, 3)
	end

	function var_1_0.trap()
		local function var_86_0(arg_87_0)
			local var_87_0 = arg_87_0.data

			if var_1_0.wana and var_1_0.wana.num then
				var_1_0.wana.num = var_1_0.wana.num - 1
			end

			if var_1_0.rightButtonControl then
				var_1_0.rightButtonControl:update()
			end
		end

		kfcmgr.sendRequest(var_86_0, actions.useTool, var_1_0.teamId, 1)
	end

	function var_1_0.handlerTujinInfo(arg_88_0)
		local var_88_0
		local var_88_1

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_88_0 = arg_88_0.data
			var_88_1 = var_1_0.cityId
		else
			var_88_0 = arg_88_0.action.data
			var_88_1 = string.split(var_1_0.battleId, "_")[3]
		end

		if var_88_0.cityOptions and table.getn(var_88_0.cityOptions) <= 0 then
			messageBox.alert(language.get(190080), language.get(190093))
		elseif table.getn(var_88_0.gIds) <= 0 then
			messageBox.alert(language.get(190080), language.get(190094))
		else
			local var_88_2 = {}

			var_88_2.option = "forward"
			var_88_2.cityId = var_88_1
			var_88_2.data = var_88_0
			var_88_2.battleId = var_1_0.battleId

			log.info("handlerRetreatInfo response：")

			if user.inJuBen or user.isYw and var_1_0.battleType == battleType.BATTLE_JBYW then
				smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0, var_88_2)
			elseif var_1_0.battleType == battleType.BATTLE_KFGZ then
				local var_88_3 = {
					gIds = {}
				}

				for iter_88_0, iter_88_1 in pairs(var_88_0.cityOptions) do
					iter_88_1.state = 1
				end

				var_88_3.cityOptions = var_88_0.cityOptions

				for iter_88_2, iter_88_3 in pairs(var_88_0.gIds) do
					local var_88_4 = {}

					if user.player.kfGenerals and user.player.kfGenerals[iter_88_3] then
						var_88_4.gId = iter_88_3
						var_88_4.gPic = user.player.kfGenerals[iter_88_3].pic

						table.insert(var_88_3.gIds, var_88_4)
					end
				end

				var_88_2.data = var_88_3
				var_88_2.isKFWorld = true

				log.info("should change to KfWorld")

				if var_1_0.isYz then
					var_88_2.isYz = true

					smgr.changeScene(SCENE_KFYZ_WORLD, 2, var_88_2, var_88_1)
				elseif smgr.lastSafeScene == SCENE_KFEXPEDITION then
					var_88_2.isYz = true

					smgr.changeScene(SCENE_KFEXPEDITION, 2, var_88_2, var_88_1)
				else
					smgr.changeScene(SCENE_KFWORLD, nil, 2, var_88_2, var_88_1)
				end
			else
				smgr.changeScene(SCENE_WORLD, var_88_1, nil, var_88_2)
			end
		end
	end

	function var_1_0.handlerDoTujin(arg_89_0)
		if arg_89_0.action.data.battleId then
			smgr.changeScene(SCENE_BATTLE, arg_89_0.action.data.battleType, {
				battleId = arg_89_0.action.data.battleId
			})
		else
			showFightTip(var_1_0, tipType.tujinSucc, arg_89_0.action.data)
		end
	end

	function var_1_0.getTujinInfo()
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_1_0.handlerTujinInfo, actions.kfgzGetForwardInfo, var_1_0.cityId)
		else
			cmgr.sendRequest(var_1_0.handlerTujinInfo, actions.getTujinInfo, var_1_0.battleId)
		end
	end

	function var_1_0.doTujin(arg_91_0, arg_91_1)
		cmgr.sendRequest(var_1_0.handlerDoTujin, actions.tujin, arg_91_1, var_1_0.battleId, arg_91_0)
	end

	function var_1_0.handlerCheTuiInfo(arg_92_0)
		local var_92_0
		local var_92_1

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_92_0 = arg_92_0.data
			var_92_1 = var_1_0.cityId
		else
			var_92_0 = arg_92_0.action.data
			var_92_1 = string.split(var_1_0.battleId, "_")[3]
		end

		if var_92_0.cityOptions and table.getn(var_92_0.cityOptions) <= 0 then
			messageBox.alert(language.get(190080), language.get(190095))
		elseif table.getn(var_92_0.gIds) <= 0 then
			messageBox.alert(language.get(190080), language.get(190096))
		else
			local var_92_2 = {}

			var_92_2.option = "retreat"
			var_92_2.cityId = var_92_1
			var_92_2.data = var_92_0
			var_92_2.battleId = var_1_0.battleId

			log.info("handlerRetreatInfo response：")

			if user.inJuBen or user.isYw and var_1_0.battleType == battleType.BATTLE_JBYW then
				smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0, var_92_2)
			elseif var_1_0.battleType == battleType.BATTLE_KFGZ then
				local var_92_3 = {
					cityOptions = {},
					gIds = {}
				}

				for iter_92_0, iter_92_1 in pairs(var_92_0.citys) do
					local var_92_4 = {
						cityId = iter_92_1
					}

					var_92_4.state = 1

					table.insert(var_92_3.cityOptions, var_92_4)
				end

				for iter_92_2, iter_92_3 in pairs(var_92_0.gIds) do
					local var_92_5 = {}

					if user.player.kfGenerals and user.player.kfGenerals[iter_92_3] then
						var_92_5.gId = iter_92_3
						var_92_5.gPic = user.player.kfGenerals[iter_92_3].pic

						table.insert(var_92_3.gIds, var_92_5)
					end
				end

				var_92_2.data = var_92_3
				var_92_2.isKFWorld = true

				log.info("should change to KfWorld")

				if var_1_0.isYz then
					var_92_2.isYz = true

					smgr.changeScene(SCENE_KFYZ_WORLD, 2, var_92_2, var_92_1)
				elseif smgr.lastSafeScene == SCENE_KFEXPEDITION then
					smgr.changeScene(SCENE_KFEXPEDITION, 2, var_92_2, var_92_1)
				else
					smgr.changeScene(SCENE_KFWORLD, nil, 2, var_92_2, var_92_1)
				end
			else
				smgr.changeScene(SCENE_WORLD, var_92_1, nil, var_92_2)
			end
		end
	end

	function var_1_0.handlerCheTui(arg_93_0)
		showFightTip(var_1_0, tipType.cheTuiSucc, arg_93_0.action.data)
	end

	function var_1_0.handlerChetuiInfo2(arg_94_0)
		if arg_94_0.action.data.gIds and table.getn(arg_94_0.action.data.gIds) > 0 then
			require("lua/game/battle/widget/showChetui"):create(var_1_0, arg_94_0.action.data)
		else
			smgr.showTipText(language.get(190303))
		end
	end

	function var_1_0.getChetuiInfo()
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			if var_1_0.corpsInfo and var_1_0.corpsInfo.corpsId then
				var_1_0.juntuanChetui()
			else
				kfcmgr.sendRequest(var_1_0.handlerCheTuiInfo, actions.kfgzQuiteBattle, var_1_0.cityId)
			end
		elseif var_1_0.battleType == battleType.BATTLE_GROUP_MINE or var_1_0.battleType == battleType.BATTLE_OCCUPY then
			cmgr.sendRequest(var_1_0.handlerChetuiInfo2, actions.getChetuiInfo, var_1_0.battleId)
		elseif var_1_0.corpsInfo and var_1_0.corpsInfo.corpsId then
			var_1_0.juntuanChetui()
		else
			cmgr.sendRequest(var_1_0.handlerCheTuiInfo, actions.getChetuiInfo, var_1_0.battleId)
		end
	end

	function var_1_0.cheTui(arg_96_0, arg_96_1)
		cmgr.sendRequest(var_1_0.handlerCheTui, actions.quitBattle, var_1_0.battleId, arg_96_1, arg_96_0)
	end

	function var_1_0.handlerCheTui2(arg_97_0)
		return
	end

	function var_1_0.cheTui2(arg_98_0)
		cmgr.sendRequest(var_1_0.handlerCheTui2, actions.quitBattle2, var_1_0.battleId, arg_98_0)
	end

	function var_1_0.handleCreateTeam(arg_99_0)
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_1_0.hasGroupArmy = 1

			showFightTip(var_1_0, tipType.createJtj, nil)
		else
			var_1_0.team.id = arg_99_0.action.data.teamId

			var_1_0.getTeamInfo()
			showFightTip(var_1_0, tipType.createJtj, nil)
		end
	end

	function var_1_0.handlePushTeam(arg_100_0)
		local var_100_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_100_0 = arg_100_0.data
		else
			var_100_0 = arg_100_0.action.data
		end

		if (var_1_0.team.show and var_1_0.team.willClose == nil or var_1_0.team.willClose == false) and (var_100_0.info and var_100_0.info.change or var_100_0.teamchange) then
			var_1_0.getTeamCost()
		end

		if var_100_0.joinInfo then
			showTeamJoinInfo(var_1_0, var_100_0.joinInfo)
		end
	end

	function var_1_0.createTeam()
		log.info("@@ 是否有集团军", var_1_0.hasGroupArmy)

		if var_1_0.team.id == nil and (not var_1_0.hasGroupArmy or var_1_0.hasGroupArmy ~= 1) then
			local function var_101_0()
				if var_1_0.battleType == battleType.BATTLE_KFGZ then
					kfcmgr.sendRequest(var_1_0.handleCreateTeam, actions.kfgzCreateGroupTeam)
				else
					cmgr.sendRequest(var_1_0.handleCreateTeam, actions.createTeam)
				end
			end

			if var_1_0.teamTimes and var_1_0.teamTimes > 0 then
				messageBox.showChargeWin(language.get(190080), language.get(190097), "createBattleTeam", var_101_0)
			else
				messageBox.showChargeWin(language.get(190080), language.get(190098, var_1_0.teamCost), "createBattleTeam", var_101_0)
			end
		else
			var_1_0.getTeamCost()
		end
	end

	function var_1_0.handleTeamCost(arg_103_0)
		local var_103_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_103_0 = arg_103_0.data
		else
			var_103_0 = arg_103_0.action.data
		end

		var_1_0.team.num = var_103_0.curNum
		var_1_0.team.teamId = var_103_0.teamId

		showTeamCostPanel(var_1_0, var_103_0)

		var_1_0.team.show = true
	end

	function var_1_0.getTeamCost()
		if var_1_0.battleType == battleType.BATTLE_KFGZ and var_1_0.hasGroupArmy then
			kfcmgr.sendRequest(var_1_0.handleTeamCost, actions.kfgzGroupTeamCost)
		elseif var_1_0.team.id then
			cmgr.sendRequest(var_1_0.handleTeamCost, actions.getTeamCost)
		end
	end

	function var_1_0.handleTeamInfo(arg_105_0)
		local var_105_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_105_0 = arg_105_0.data
		else
			var_105_0 = arg_105_0.action.data
		end

		if var_105_0.types then
			var_1_0.teamCost = var_105_0.types[1].cost
		else
			var_1_0.teamCost = 30
		end

		var_1_0.teamTimes = var_105_0.teamTimes or 0

		if var_1_0.rightButtonControl then
			var_1_0.rightButtonControl:update()
		end
	end

	function var_1_0.getTeamInfo()
		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			-- block empty
		else
			cmgr.sendRequest(var_1_0.handleTeamInfo, actions.getTeamInfo)
		end
	end

	function var_1_0.handleInspire(arg_107_0)
		local var_107_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_107_0 = arg_107_0.data
		else
			var_107_0 = arg_107_0.action.data
		end

		showInsperOrOrderTip(var_1_0, "inspire", var_107_0.addExp)
		var_1_0.getTeamCost()
	end

	function var_1_0.handleOrder(arg_108_0)
		local var_108_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_108_0 = arg_108_0.data
		else
			var_108_0 = arg_108_0.action.data
		end

		showInsperOrOrderTip(var_1_0, "order", var_108_0.addOrderExp)
		var_1_0.getTeamCost()
	end

	function var_1_0.inspire()
		local function var_109_0()
			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				kfcmgr.sendRequest(var_1_0.handleInspire, actions.kfgzGroupTeamInspire)
			else
				cmgr.sendRequest(var_1_0.handleInspire, actions.teamInspire, var_1_0.team.id)
			end
		end

		if user.chargeItems.battleTeamInspire.noDisturb or var_1_0.inspireCost == 0 then
			var_109_0()
		else
			require("lua/component/messageBox")
			messageBox.showChargeWin(language.get(190080), language.get(190098, var_1_0.inspireCost), "battleTeamInspire", var_109_0)
		end
	end

	function var_1_0.order()
		local function var_111_0()
			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				kfcmgr.sendRequest(var_1_0.handleOrder, actions.kfgzGroupTeamOrder)
			else
				cmgr.sendRequest(var_1_0.handleOrder, actions.teamOrder, var_1_0.team.id)
			end
		end

		if user.chargeItems.teamOrder.noDisturb or var_1_0.orderGold == 0 then
			var_111_0()
		else
			require("lua/component/messageBox")
			messageBox.showChargeWin(language.get(190080), language.get(190100, var_1_0.orderGold), "teamOrder", var_111_0)
		end
	end

	function var_1_0.handleTeamBattle(arg_113_0)
		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.jtj)

		var_1_0.team.id = nil
		var_1_0.hasGroupArmy = nil

		var_1_0.getTeamInfo()
		bmgr.showTeamBattleEffect()
	end

	function var_1_0.blitzkrieg()
		if var_1_0.battleType == battleType.BATTLE_KFGZ and var_1_0.cityId then
			kfcmgr.sendRequest(var_1_0.handleTeamBattle, actions.kfgzGroupTeamFight, var_1_0.cityId, 2)

			var_1_0.team.willClose = true
		elseif var_1_0.battleId and var_1_0.team.num then
			cmgr.sendRequest(var_1_0.handleTeamBattle, actions.teamBattle, var_1_0.battleId, var_1_0.team.num, teamBattleType.att)

			var_1_0.team.willClose = true
		end
	end

	function var_1_0.defensiveWar()
		if var_1_0.battleType == battleType.BATTLE_KFGZ and var_1_0.cityId then
			kfcmgr.sendRequest(var_1_0.handleTeamBattle, actions.kfgzGroupTeamFight, var_1_0.cityId, 1)

			var_1_0.team.willClose = true
		elseif var_1_0.battleId and var_1_0.team.num then
			cmgr.sendRequest(var_1_0.handleTeamBattle, actions.teamBattle, var_1_0.battleId, var_1_0.team.num, teamBattleType.def)

			var_1_0.team.willClose = true
		end
	end

	function var_1_0.handleDismissTeam(arg_116_0)
		var_1_0.team.id = nil
		var_1_0.hasGroupArmy = nil

		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.jtj)
	end

	function var_1_0.dismiss()
		if var_1_0.battleType == battleType.BATTLE_KFGZ and var_1_0.team.teamId then
			kfcmgr.sendRequest(var_1_0.handleDismissTeam, actions.kfgzGroupTeamDismiss, var_1_0.team.teamId)

			var_1_0.team.willClose = true
		elseif var_1_0.team and var_1_0.team.id then
			cmgr.sendRequest(var_1_0.handleDismissTeam, actions.dismissTeam, var_1_0.team.id)

			var_1_0.team.willClose = true
		end
	end

	function var_1_0.handleUseOfficerToken(arg_118_0)
		showOfficerTokenTip(var_1_0)

		var_1_0.officerTokenNum = var_1_0.officerTokenNum - 1

		var_1_0.rightButtonControl:update()
	end

	function var_1_0.useOfficeToken()
		log.info("使用官员令: ", var_1_0.cityId, var_1_0.battleType)

		if var_1_0.battleType == battleType.BATTLE_KFGZ and var_1_0.cityId then
			kfcmgr.sendRequest(var_1_0.handleUseOfficerToken, actions.kfgzOfficerTokenUse, var_1_0.cityId)
		elseif var_1_0.cityId and (var_1_0.battleType == battleType.BATTLE_CITY or var_1_0.battleType == battleType.BATTLE_BARBARAIN or var_1_0.battleType == battleType.BATTLE_JBYW) then
			cmgr.sendRequest(var_1_0.handleUseOfficerToken, actions.useOfficerToken, var_1_0.battleId, var_1_0.cityId)
		end
	end

	function var_1_0.handleUseGoldOrder(arg_120_0)
		log.info("征召令发布成功")
		showGoldOrderTip(var_1_0)

		local var_120_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_120_0 = arg_120_0.data.goldOrderExp
		else
			var_120_0 = arg_120_0.action.data.goldOrderExp
		end

		globalAction_gotResource({
			{
				id = 6,
				value = var_120_0
			}
		})
	end

	function var_1_0.useGoldOrder()
		local function var_121_0()
			if var_1_0.battleType == battleType.BATTLE_KFGZ then
				kfcmgr.sendRequest(var_1_0.handleUseGoldOrder, actions.kfgzOrderToken, var_1_0.cityId)
			elseif var_1_0.battleType == battleType.BATTLE_CITY or var_1_0.battleType == battleType.BATTLE_BARBARAIN or var_1_0.battleType == battleType.BATTLE_JBYW then
				cmgr.sendRequest(var_1_0.handleUseGoldOrder, actions.useGoldOrder, var_1_0.battleId)
			end
		end

		log.info("使用征召令: ", var_1_0.cityId, var_1_0.battleType)

		if var_1_0.cityId then
			if user.chargeItems.useGoldOrder.noDisturb then
				var_121_0()
			else
				require("lua/component/messageBox")
				messageBox.showChargeWin(language.get(190080), language.get(190101), "useGoldOrder", var_121_0)
			end
		end
	end

	function var_1_0.handlerKfgzIniInfo(arg_123_0)
		local var_123_0 = arg_123_0.data.battleInfo

		var_1_0.isYz = arg_123_0.data.isYz
		var_1_0.battleType = var_123_0.battleType
		var_1_0.battleId = var_123_0.battleId
		var_1_0.figthSide = var_123_0.isAtt and "att" or "def"
		var_1_0.terrain = var_123_0.terrain
		var_1_0.targetName = var_123_0.targetName
		var_1_0.autoSt = arg_123_0.data.autoAtt
		var_1_0.cityId = var_1_0.cityId or var_123_0.cityId or var_123_0.targetId
		var_1_0.hasGroupArmy = arg_123_0.data.hasGroupArmy
		var_1_0.hasOfficerToken = var_123_0.officeId ~= nil
		var_1_0.officerTokenNum = var_123_0.officeTokenNum
		var_1_0.freePhantomCount = var_123_0.freeBuyPhantom
		var_1_0.remainBuyPhantom = var_123_0.remainBuyPhantom
		var_1_0.availablePhantoms = var_123_0.availablePhantoms
		var_1_0.leftSoloNum = var_123_0.leftSoloNum
		var_1_0.leftTujinNum = var_123_0.leftTujinNum
		var_1_0.leftFusion = var_123_0.leftFusion
		var_1_0.leftFision = var_123_0.leftFision
		var_1_0.openHbq = var_123_0.openHbq
		var_1_0.leftHbqNum = var_123_0.leftHbqNum
		var_1_0.hbqKills = var_123_0.hbqKills
		var_1_0.fission = var_123_0.fission
		var_1_0.corpsInfo = arg_123_0.data.corpsInfo
		var_1_0.leftSTimes = arg_123_0.data.slaughterLeftTimes
		var_1_0.slaughterLimit = arg_123_0.data.slaughterLimit
		var_1_0.slaughterCd = arg_123_0.data.slaughterCd
		var_1_0.wana = arg_123_0.data.wana
		var_1_0.wanaInfo = arg_123_0.data.wanaInfo

		if var_1_0.hbqKills then
			if var_1_0.hbqKills.att then
				var_1_0.showHbqTip("att", var_1_0.hbqKills.att.playerName, var_1_0.hbqKills.att.kills)
			end

			if var_1_0.hbqKills.def then
				var_1_0.showHbqTip("def", var_1_0.hbqKills.def.playerName, var_1_0.hbqKills.def.kills)
			end
		end

		if var_1_0.fission then
			if var_1_0.fission.att then
				var_1_0.showFissionTip("att", var_1_0.fission.att.playerName, var_1_0.fission.att.dants)
			end

			if var_1_0.fission.def then
				var_1_0.showFissionTip("def", var_1_0.fission.def.playerName, var_1_0.fission.def.dants)
			end
		end

		var_1_0.currentPhantomType = BATTLE_PHANTOM_NORMAL

		var_1_0.drawBackground(var_1_0.terrain)

		if var_123_0.firstEnter == true then
			var_1_0.firstEnterSpecialCity(var_1_0.cityId)
		end

		var_1_0.addSpecialCityName(var_1_0.cityId)
		var_1_0.addCityName(var_1_0.cityId)

		var_1_0.teamCost = 0

		var_1_0.getTeamInfo()

		if var_1_0.autoSt ~= -1 then
			var_1_0.showFightHelper()
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_1_0.rightButtonControl = showFightRightButton(var_1_0)

			var_1_0.addTrap()
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or var_1_0.battleType == battleType.BATTLE_KFGZ or var_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			var_1_0.generalPanel = showSimpleGeneralPanel(var_1_0.layerTabel.uiLayer, var_1_0.battleId, false, true, var_1_0.cityId)
		end

		var_1_0.showKfgzTimeLeft()

		if arg_123_0.data.battleReport then
			var_1_0.enterFigth(arg_123_0.data.battleReport)
		end

		var_1_0.arenaInfo.arenaType = arg_123_0.data.arenaType
		var_1_0.arenaInfo.arenaTimes = arg_123_0.data.arenaTimes
		var_1_0.arenaInfo.champion = arg_123_0.data.champion
		var_1_0.arenaInfo.tauntTimes = arg_123_0.data.tauntTimes
		var_1_0.arenaInfo.tauntBuff = arg_123_0.data.tauntBuff

		var_1_0.championChange()
		var_1_0.showCorpsNum()
	end

	function var_1_0.showKfgzTimeLeft()
		return
	end

	function var_1_0.handlerPushKfWorld(arg_125_0)
		local var_125_0 = arg_125_0.data

		if var_125_0.generalMove and var_1_0.generalPanel then
			var_1_0.generalPanel.updateGeneralState(var_125_0.generalMove.gid, var_125_0.generalMove.generalState)
		end
	end

	function var_1_0.watchKfgz(arg_126_0)
		var_1_0.teamId = arg_126_0

		kfcmgr.sendRequest(var_1_0.handlerKfgzIniInfo, actions.kfgzBattleInfo, arg_126_0)
	end

	function var_1_0.returnToKfgz(arg_127_0)
		smgr.changeScene(SCENE_KFWORLD, nil, arg_127_0, nil, nil, true)
	end

	function var_1_0.changeHuizhanForceNum(arg_128_0)
		if arg_128_0.attForceNum and arg_128_0.defForceNum and var_1_0.huizhanUI then
			var_1_0.huizhanUI:update({
				hzAttForce = arg_128_0.attForceNum,
				hzDefForce = arg_128_0.defForceNum
			})
		end

		if arg_128_0.state and arg_128_0.state ~= 1 and var_1_0.huizhanUI then
			var_1_0.huizhanUI:removeFromParentAndCleanup(true)

			var_1_0.huizhanUI = nil
		end
	end

	function var_1_0.addTrap()
		log.info("陷阱的面板")

		local var_129_0 = createBaseLayer()
		local var_129_1 = CCSprite:create("res/ui/battle/trap/yzzb_lock_mask.png")

		var_129_1:setPosition(ccp(visibleSize.width - 65, visibleSize.height * 0.5))
		var_129_0:addChild(var_129_1)

		local var_129_2 = CCSprite:create("res/ui/battle/trap/yzzb_lock.png")

		var_129_2:setPosition(ccp(var_129_1:getContentSize().width / 2, var_129_1:getContentSize().height / 2))
		var_129_1:addChild(var_129_2)
		swallowTouch(var_129_1)
		var_129_1:setVisible(false)

		local function var_129_3(arg_130_0)
			local function var_130_0()
				var_129_1:removeChildByTag(123, true)
				var_129_1:setVisible(false)
			end

			local var_130_1 = createTimerLabel(arg_130_0, language.get("224102_trap"), "Thonburi", 18, var_130_0, nil, nil, colorTips.red)

			var_130_1:setPosition(ccp(var_129_1:getContentSize().width / 2, var_129_1:getContentSize().height - 40))
			var_129_1:removeChildByTag(123, true)
			var_129_1:addChild(var_130_1, 0, 123)
		end

		local function var_129_4(arg_132_0, arg_132_1)
			arg_132_1 = tool.toint(arg_132_1 / 1000)

			tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)

			local var_132_0 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_d.png")

			var_132_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_1_0.layerTabel.uiLayer:addChild(var_132_0, 0, uiTag.textTip)

			local var_132_1 = CCSprite:create("res/ui/battle/trap/yzzb_word_wfxjjz.png")

			if user.player.kfgzForceId ~= arg_132_0 then
				var_132_1 = CCSprite:create("res/ui/battle/trap/yzzb_word_dfxjjz.png")
			end

			local var_132_2 = CCLabelAtlas:create(tostring(arg_132_1), "res/ui/levelup/update_att_numb.png", 55, 76, 48)

			var_132_2:setAnchorPoint(ccp(0.5, 0.5))

			local var_132_3 = CCSprite:create("res/ui/battle/trap/yzzb_word_mhkq.png")
			local var_132_4 = createRichNode({
				var_132_1,
				var_132_2,
				var_132_3
			}, 0.5)

			if conf.language == "tha" then
				local var_132_5 = CCSprite:create("res/ui/battle/trap/yzzb_word_mhkq_1.png")
				local var_132_6 = CCSprite:create("res/ui/battle/trap/yzzb_word_mhkq_2.png")

				if var_132_5 ~= nil and var_132_6 ~= nil then
					var_132_4 = createRichNode({
						var_132_1,
						var_132_5,
						var_132_2,
						var_132_6
					}, 0.5)
				end
			end

			var_132_4:setPosition(ccp(var_132_0:getContentSize().width * 0.5, var_132_0:getContentSize().height * 0.5))
			var_132_0:addChild(var_132_4)

			local function var_132_7()
				arg_132_1 = arg_132_1 - 1

				if arg_132_1 > 0 then
					var_132_2:setString(arg_132_1)
				elseif arg_132_1 == 0 then
					var_132_4:removeFromParentAndCleanup(true)

					local var_133_0 = CCSprite:create("res/ui/battle/trap/yzzb_word_xdzsqd.png")

					var_133_0:setPosition(ccp(var_132_0:getContentSize().width * 0.5, var_132_0:getContentSize().height * 0.5))
					var_132_0:addChild(var_133_0)
				else
					tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)

					local var_133_1 = var_1_0.wanaInfo

					if var_133_1.teamId == var_1_0.teamId and var_133_1.state == 1 and var_133_1.endCd and var_133_1.endCd > 0 and user.player.kfgzForceId ~= var_133_1.forceId then
						var_129_1:setVisible(true)
						var_129_3(var_133_1.endCd)
					end
				end
			end

			local var_132_8 = CCArray:create()

			for iter_132_0 = 1, arg_132_1 + 1 do
				var_132_8:addObject(CCFadeIn:create(0.2))
				var_132_8:addObject(CCDelayTime:create(0.6))
				var_132_8:addObject(CCFadeOut:create(0.2))
				var_132_8:addObject(CCCallFuncN:create(var_132_7))
			end

			local var_132_9 = CCSequence:create(var_132_8)

			var_132_0:runAction(CCSequence:create(var_132_8))
		end

		if var_1_0.wanaInfo then
			local var_129_5 = var_1_0.wanaInfo

			if var_129_5.teamId == var_1_0.teamId and var_129_5.startCd and var_129_5.startCd > 0 then
				var_129_4(var_129_5.forceId, var_129_5.startCd)
			elseif var_129_5.teamId == var_1_0.teamId and var_129_5.state == 1 and var_129_5.endCd and var_129_5.endCd > 0 and user.player.kfgzForceId ~= var_129_5.forceId then
				var_129_1:setVisible(true)
				var_129_3(var_129_5.endCd)
			end
		end

		local function var_129_6(arg_134_0)
			local var_134_0 = arg_134_0.data

			showTable(var_134_0)

			if var_134_0.wana then
				local var_134_1 = var_134_0.wana

				if var_134_1.teamId == var_1_0.teamId and var_134_1.startCd and var_134_1.startCd > 0 then
					var_129_4(var_134_1.forceId, var_134_1.startCd)
				elseif var_134_1.teamId == var_1_0.teamId and var_134_1.state == 1 and var_134_1.endCd and var_134_1.endCd > 0 and user.player.kfgzForceId ~= var_134_1.forceId then
					var_129_1:setVisible(true)
					var_129_3(var_134_1.endCd)
				end
			end
		end

		function var_129_0.onEnter(arg_135_0)
			kfcmgr.registerResponseHandler(actions.pushKfyzWana, var_129_6)
		end

		function var_129_0.onExit(arg_136_0)
			kfcmgr.unregisterResponseHandler(actions.pushKfyzWana, var_129_6)
		end

		var_1_0.layerTabel.uiLayer:addChild(var_129_0, 10)
	end

	function var_1_0.updateSurround()
		local var_137_0 = var_1_0.layerTabel.node_surround

		if tolua.isnull(var_137_0) then
			var_1_0.layerTabel.node_surround = nil
			var_137_0 = nil
		end

		if var_1_0.surround ~= 0 or var_1_0.slam ~= 0 or var_1_0.slamCd > 0 then
			if var_137_0 then
				var_137_0:showPanel(var_1_0)
			else
				var_137_0 = require("lua/game/battle/Surround").new(var_1_0.layerTabel.fightLayer, var_1_0)
				var_1_0.layerTabel.node_surround = var_137_0
			end
		elseif var_137_0 then
			var_137_0:removeFromParentAndCleanup(true)

			var_1_0.layerTabel.node_surround = nil
		end
	end

	function var_1_0.updateBattleTower()
		log.info("@@ 箭塔血量: " .. var_1_0.battleTowerDurability)

		local function var_138_0(arg_139_0, arg_139_1)
			local var_139_0 = rmgr.getStategyEffect("def", battleTower.SMOKE)
			local var_139_1 = CCAnimation:createWithSpriteFrames(var_139_0)

			var_139_1:setDelayPerUnit(0.08)
			var_139_1:setRestoreOriginalFrame(true)

			local var_139_2 = CCAnimate:create(var_139_1)
			local var_139_3 = CCRepeatForever:create(var_139_2)
			local var_139_4 = CCSprite:create()

			var_139_4:runAction(var_139_3)
			var_139_4:setPosition(arg_139_1)
			var_139_4:setAnchorPoint(ccp(0.5, 0.5))
			arg_139_0:addChild(var_139_4, 5)
		end

		local var_138_1

		if var_1_0.battleTowerDurability > 0 then
			var_138_1 = "res/ui/battle/battleTower/tower" .. var_1_0.battleTowerId .. "_01.png"
		else
			var_138_1 = "res/ui/battle/battleTower/tower" .. var_1_0.battleTowerId .. "_02.png"
		end

		local var_138_2 = CCSprite:create(var_138_1)

		var_138_2:setAnchorPoint(ccp(0.5, 0.5))
		var_138_2:setScale(0.8)
		var_138_2:setPosition(battleTower.towerLeft)

		local var_138_3 = CCSprite:create(var_138_1)

		var_138_3:setAnchorPoint(ccp(0.5, 0.5))
		var_138_3:setScale(0.8)
		var_138_3:setPosition(battleTower.towerRight)

		if var_1_0.battleTowerCD > var_1_0.battleTowerMax then
			var_1_0.battleTowerCD = var_1_0.battleTowerMax
		end

		if var_1_0.battleTowerCD < 0 then
			var_1_0.battleTowerCD = 0
		end

		if var_1_0.battleTowerMax <= 0 then
			var_1_0.battleTowerMax = 10
		end

		local var_138_4 = 800
		local var_138_5 = 250
		local var_138_6 = CCSprite:create("res/ui/battle/battleTower/xiaoheidi.png")
		local var_138_7 = CCSprite:create("res/ui/battle/battleTower/xiaoheidi.png")

		var_138_6:setPosition(battleTower.towerHuihe)
		var_138_7:setPosition(battleTower.towerNaijiu)
		var_138_6:setScale(1.1)
		var_138_7:setScale(1.1)

		local var_138_8 = CCSprite:create("res/ui/battle/battleTower/cfjt_jdt_di.png")
		local var_138_9 = CCSprite:create("res/ui/battle/battleTower/cfjt_jdt_dih.png")

		var_138_8:setPosition(ccp(110, 14))
		var_138_9:setPosition(ccp(110, 14))
		var_138_6:addChild(var_138_8)
		var_138_7:addChild(var_138_9)

		local var_138_10 = CCSprite:create("res/ui/battle/battleTower/cfjt_jdth.png", CCRectMake(0, 0, 114 * var_1_0.battleTowerDurability / 100, 19))
		local var_138_11 = CCSprite:create("res/ui/battle/battleTower/cfjt_jdt.png", CCRectMake(0, 0, 114 * var_1_0.battleTowerCD / var_1_0.battleTowerMax, 19))

		var_138_10:setAnchorPoint(ccp(0, 0.5))
		var_138_11:setAnchorPoint(ccp(0, 0.5))
		var_138_10:setPosition(ccp(0, 9.5))
		var_138_11:setPosition(ccp(0, 9.5))
		var_138_8:addChild(var_138_11)
		var_138_9:addChild(var_138_10)

		local var_138_12 = CCSprite:create("res/ui/battle/battleTower/huihe.png")
		local var_138_13 = CCSprite:create("res/ui/battle/battleTower/naijiu.png")

		var_138_12:setPosition(ccp(-20, 9.5))
		var_138_13:setPosition(ccp(-20, 9.5))
		var_138_8:addChild(var_138_12, 10)
		var_138_9:addChild(var_138_13, 10)

		local var_138_14 = CCLabelTTF:create(var_1_0.battleTowerDurability .. "/" .. 100, "Thonburi", 16)
		local var_138_15 = CCLabelTTF:create(var_1_0.battleTowerCD .. "/" .. var_1_0.battleTowerMax, "Thonburi", 16)

		var_138_14:setPosition(ccp(57, 9.5))
		var_138_15:setPosition(ccp(57, 9.5))
		var_138_8:addChild(var_138_15)
		var_138_9:addChild(var_138_14)
		var_1_0.layerTabel.towerLayer1:removeAllChildrenWithCleanup(true)
		var_1_0.layerTabel.towerLayer2:removeAllChildrenWithCleanup(true)

		if var_1_0.battleTowerDurability < 26 then
			var_138_0(var_1_0.layerTabel.towerLayer1, battleTower.towerLeftSmoke)
			var_138_0(var_1_0.layerTabel.towerLayer2, battleTower.towerRightSmoke)
		end

		var_1_0.layerTabel.towerLayer1:addChild(var_138_2, 0)
		var_1_0.layerTabel.towerLayer2:addChild(var_138_3, 0)
		var_1_0.layerTabel.towerLayer2:addChild(var_138_6, 10)
		var_1_0.layerTabel.towerLayer2:addChild(var_138_7, 10)
	end

	function var_1_0.paoji()
		log.info("@@@@@ 发送炮击命令...")
		cmgr.sendRequest(var_1_0.handlerPaoji, actions.paoji, var_1_0.battleId)
	end

	function var_1_0.bomb()
		log.info("@@@@@ 发送引爆命令...")
		cmgr.sendRequest(var_1_0.handlerBomb, actions.detonate, var_1_0.battleId)
	end

	function var_1_0.shuaiqi()
		log.info("@@@@@ 发送插旗命令...")

		local function var_142_0()
			cmgr.sendRequest(var_1_0.handlerShuaiqi, actions.useFlag, var_1_0.battleId)
		end

		if var_1_0.battleFlag.num > 0 then
			var_142_0()
		else
			messageBox.showChargeWin("", language.get(490122, var_1_0.battleFlag.battleFlagGold), "buyBattleFlag", var_142_0)
		end
	end

	function var_1_0.handlerShuaiqi(arg_144_0)
		if arg_144_0.action.data.cd then
			var_1_0.battleFlag.cd = arg_144_0.action.data.cd
			var_1_0.battleFlag.num = var_1_0.battleFlag.num - 1
		end

		if var_1_0.rightButtonControl then
			var_1_0.rightButtonControl:update()
		end
	end

	function var_1_0.handlerBomb(arg_145_0)
		var_1_0.canDetonate = nil

		if var_1_0.rightButtonControl then
			var_1_0.rightButtonControl:update()
		end
	end

	function var_1_0.showBombTip(arg_146_0)
		local var_146_0 = arg_146_0

		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)

		local var_146_1 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_d.png")

		var_146_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_0.layerTabel.uiLayer:addChild(var_146_1, 0, uiTag.textTip)

		local function var_146_2()
			tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)
		end

		local var_146_3 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_jhkjjbz.png")

		local function var_146_4()
			var_146_0 = var_146_0 - 1

			if var_146_0 > 0 then
				var_146_1:removeAllChildrenWithCleanup(true)
				var_146_1:setDisplayFrame(CCSprite:create("res/ui/battle/junhuoku/jhk_word_d_s.png"):displayFrame())

				local var_148_0 = CCLabelAtlas:create(tostring(var_146_0), "res/ui/battle/junhuoku/jhk_word_djs_digit.png", 36, 54, 48)

				var_148_0:setPosition(ccp(var_146_1:getContentSize().width * 0.5, 3))
				var_146_1:addChild(var_148_0)
			else
				tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)
			end
		end

		if var_146_3 then
			var_146_3:setPosition(ccp(var_146_1:getContentSize().width * 0.5, var_146_1:getContentSize().height * 0.5))
			var_146_1:addChild(var_146_3)

			local var_146_5 = CCArray:create()

			for iter_146_0 = 1, arg_146_0 + 1 do
				var_146_5:addObject(CCFadeIn:create(0.2))
				var_146_5:addObject(CCDelayTime:create(0.6))
				var_146_5:addObject(CCFadeOut:create(0.2))
				var_146_5:addObject(CCCallFuncN:create(var_146_4))
			end

			local var_146_6 = CCSequence:create(var_146_5)

			var_146_1:runAction(CCSequence:create(var_146_5))
		end
	end

	function var_1_0.showHbqTip(arg_149_0, arg_149_1, arg_149_2)
		local var_149_0 = CCSprite:create()

		if arg_149_0 == "att" then
			var_1_0.layerTabel.uiLayer:removeChildByTag(uiTag.hbq_att, true)
			var_1_0.layerTabel.uiLayer:addChild(var_149_0, 1000, uiTag.hbq_att)
		else
			var_1_0.layerTabel.uiLayer:removeChildByTag(uiTag.hbq_def, true)
			var_1_0.layerTabel.uiLayer:addChild(var_149_0, 1000, uiTag.hbq_def)
		end

		local var_149_1 = CCStrokeLabelTTF:create(arg_149_1, "Thonburi-Bold", 30)
		local var_149_2 = CCStrokeLabelTTF:create(language.get("222530_dongying"), "Thonburi-Bold", 26)
		local var_149_3 = CCStrokeLabelTTF:create(arg_149_2, "Thonburi-Bold", 36)

		var_149_1:setColor(ccc3(255, 212, 38))
		var_149_3:setColor(ccc3(255, 212, 38))
		var_149_2:setColor(ccc3(237, 209, 169))

		local var_149_4 = CCSprite:createWithSpriteFrameName("battle_tip_background.png")

		var_149_4:setScale(0.6)
		var_149_4:setAnchorPoint(ccp(0, 0.5))
		var_149_0:addChild(var_149_4)

		if arg_149_0 == "att" then
			var_149_0:setPosition(ccp(40 + platform.getSafeDistance(), visibleSize.height - 250))

			local var_149_5 = createRichNode({
				var_149_1,
				var_149_2,
				var_149_3
			}, 0)

			var_149_0:addChild(var_149_5)
		else
			var_149_4:setAnchorPoint(ccp(1, 0.5))
			var_149_0:setPosition(ccp(visibleSize.width - 130 - platform.getSafeDistance(), 280))

			local var_149_6 = createRichNode({
				var_149_1,
				var_149_2,
				var_149_3
			}, 1)

			var_149_0:addChild(var_149_6)
		end
	end

	function var_1_0.showFissionTip(arg_150_0, arg_150_1, arg_150_2)
		local var_150_0 = CCSprite:create()

		if arg_150_0 == "att" then
			var_1_0.layerTabel.uiLayer:removeChildByTag(uiTag.fission_att, true)
			var_1_0.layerTabel.uiLayer:addChild(var_150_0, 1000, uiTag.fission_att)
		else
			var_1_0.layerTabel.uiLayer:removeChildByTag(uiTag.fission_def, true)
			var_1_0.layerTabel.uiLayer:addChild(var_150_0, 1000, uiTag.fission_def)
		end

		local var_150_1 = CCStrokeLabelTTF:create(arg_150_1, "Thonburi-Bold", 30)
		local var_150_2 = CCStrokeLabelTTF:create(language.get("222900_xianjing"), "Thonburi-Bold", 26)
		local var_150_3 = CCStrokeLabelTTF:create(arg_150_2, "Thonburi-Bold", 36)

		var_150_1:setColor(ccc3(255, 212, 38))
		var_150_3:setColor(ccc3(255, 212, 38))
		var_150_2:setColor(ccc3(237, 209, 169))

		local var_150_4 = CCSprite:createWithSpriteFrameName("battle_tip_background.png")

		var_150_4:setAnchorPoint(ccp(0, 0.5))
		var_150_4:setScale(0.6)
		var_150_0:addChild(var_150_4)

		if arg_150_0 == "att" then
			var_150_0:setPosition(ccp(40 + platform.getSafeDistance(), visibleSize.height - 290))

			local var_150_5 = createRichNode({
				var_150_1,
				var_150_2,
				var_150_3
			}, 0)

			var_150_0:addChild(var_150_5)
		else
			var_150_4:setAnchorPoint(ccp(1, 0.5))
			var_150_0:setPosition(ccp(visibleSize.width - 130 - platform.getSafeDistance(), 240))

			local var_150_6 = createRichNode({
				var_150_1,
				var_150_2,
				var_150_3
			}, 1)

			var_150_0:addChild(var_150_6)
		end
	end

	function var_1_0.showDiedCastleNpcTip(arg_151_0, arg_151_1)
		local var_151_0 = CCSprite:create()

		if arg_151_0 == "att" then
			var_1_0.layerTabel.uiLayer:removeChildByTag(uiTag.diedCastleNpc_att, true)
			var_1_0.layerTabel.uiLayer:addChild(var_151_0, 1000, uiTag.diedCastleNpc_att)
		else
			var_1_0.layerTabel.uiLayer:removeChildByTag(uiTag.diedCastleNpc_def, true)
			var_1_0.layerTabel.uiLayer:addChild(var_151_0, 1000, uiTag.diedCastleNpc_def)
		end

		local var_151_1 = CCStrokeLabelTTF:create(language.get(491066), "Thonburi-Bold", 26)
		local var_151_2 = CCStrokeLabelTTF:create(arg_151_1, "Thonburi-Bold", 36)

		var_151_2:setColor(ccc3(255, 212, 38))
		var_151_1:setColor(ccc3(237, 209, 169))

		local var_151_3 = CCSprite:createWithSpriteFrameName("battle_tip_background.png")

		var_151_3:setAnchorPoint(ccp(0, 0.5))
		var_151_3:setScale(0.6)
		var_151_0:addChild(var_151_3)

		if arg_151_0 == "att" then
			var_151_0:setPosition(ccp(40 + platform.getSafeDistance(), visibleSize.height - 330))

			local var_151_4 = createRichNode({
				var_151_1,
				var_151_2
			}, 0)

			var_151_0:addChild(var_151_4)
		else
			var_151_3:setAnchorPoint(ccp(1, 0.5))
			var_151_0:setPosition(ccp(visibleSize.width - 130 - platform.getSafeDistance(), 200))

			local var_151_5 = createRichNode({
				var_151_1,
				var_151_2
			}, 1)

			var_151_0:addChild(var_151_5)
		end
	end

	function var_1_0.handlerPaoji(arg_152_0)
		log.info("@@@@ 炮击成功...")
		log.info("@@@@ response.paoJiNum..." .. arg_152_0.action.data.paoJiNum)
		log.info("@@@@ response.paoJiCD..." .. arg_152_0.action.data.paoJiCD)

		var_1_0.paoJiNum = arg_152_0.action.data.paoJiNum
		var_1_0.paoJiCD = arg_152_0.action.data.paoJiCD

		if var_1_0.rightButtonControl then
			var_1_0.rightButtonControl:update()
		end

		showPaoJiTip(var_1_0.paoJiCD)
	end

	function showPaoJiTip(arg_153_0)
		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)

		local var_153_0 = CCSprite:createWithSpriteFrameName("battle_tip_background.png")

		var_153_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_0.layerTabel.uiLayer:addChild(var_153_0, 0, uiTag.textTip)

		local function var_153_1()
			tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)
		end

		local var_153_2 = CCStrokeLabelTTF:create(language.get(190207, arg_153_0), "Thonburi", 28)
		local var_153_3 = 200

		if var_153_2 then
			var_153_2:setPosition(ccp(var_153_0:getContentSize().width * 0.5 + var_153_3, var_153_0:getContentSize().height * 0.5))
			var_153_0:addChild(var_153_2)

			local var_153_4 = CCArray:create()

			var_153_4:addObject(CCFadeIn:create(0.06))
			var_153_4:addObject(CCMoveBy:create(0.15, ccp(-var_153_3, 0)))
			var_153_4:addObject(CCDelayTime:create(1))
			var_153_4:addObject(CCMoveBy:create(0.15, ccp(-var_153_3, 0)))
			var_153_4:addObject(CCFadeOut:create(0.06))
			var_153_4:addObject(CCCallFuncN:create(var_153_1))

			local var_153_5 = CCSequence:create(var_153_4)

			var_153_2:runAction(CCSequence:create(var_153_4))
		end
	end

	function var_1_0.showFlagTip(arg_155_0)
		tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)

		local var_155_0 = CCSprite:create("res/ui/battle/junhuoku/jhk_word_d.png")

		var_155_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_0.layerTabel.uiLayer:addChild(var_155_0, 0, uiTag.textTip)

		local function var_155_1()
			tool.safeRemoveChildByTag(var_1_0.layerTabel.uiLayer, uiTag.textTip)
		end

		local var_155_2 = CCSprite:create("res/ui/battle/flag/gxb_word_wfsqyl.png")

		if arg_155_0 == 0 then
			var_155_2 = CCSprite:create("res/ui/battle/flag/gxb_word_dfsqyl.png")
		end

		local var_155_3 = 200

		if var_155_2 then
			var_155_2:setPosition(ccp(var_155_0:getContentSize().width * 0.5 + var_155_3, var_155_0:getContentSize().height * 0.5))
			var_155_0:addChild(var_155_2)

			local var_155_4 = CCArray:create()

			var_155_4:addObject(CCFadeIn:create(0.06))
			var_155_4:addObject(CCMoveBy:create(0.15, ccp(-var_155_3, 0)))
			var_155_4:addObject(CCDelayTime:create(1))
			var_155_4:addObject(CCMoveBy:create(0.15, ccp(-var_155_3, 0)))
			var_155_4:addObject(CCFadeOut:create(0.06))
			var_155_4:addObject(CCCallFuncN:create(var_155_1))

			local var_155_5 = CCSequence:create(var_155_4)

			var_155_2:runAction(CCSequence:create(var_155_4))
		end
	end

	function var_1_0.firstEnterSpecialCity(arg_157_0)
		local var_157_0 = smgr.getLayer("effectlayer")
		local var_157_1
		local var_157_2

		if arg_157_0 == 38 or arg_157_0 == 109 or arg_157_0 == 227 or arg_157_0 == 5031 or arg_157_0 == 5032 or arg_157_0 == 5040 then
			var_157_1 = CCSprite:create("res/ui/battle/stategyPic/c3.png")
			var_157_2 = CCSprite:create("res/ui/world/tscc_tit_canyon.png")

			var_157_2:setPosition(ccp(var_157_1:getContentSize().width * 0.5, var_157_1:getContentSize().height * 0.85))
			var_157_1:addChild(var_157_2)
		elseif arg_157_0 == 45 or arg_157_0 == 110 or arg_157_0 == 181 then
			var_157_1 = CCSprite:create("res/ui/battle/stategyPic/c1.png")
			var_157_2 = CCSprite:create("res/ui/world/tscc_tit_alp.png")

			var_157_2:setPosition(ccp(var_157_1:getContentSize().width * 0.5, var_157_1:getContentSize().height * 0.85))
			var_157_1:addChild(var_157_2)
		elseif arg_157_0 == 40 or arg_157_0 == 116 or arg_157_0 == 224 then
			var_157_1 = CCSprite:create("res/ui/battle/stategyPic/c2.png")
			var_157_2 = CCSprite:create("res/ui/world/tscc_tit_jungle.png")

			var_157_2:setPosition(ccp(var_157_1:getContentSize().width * 0.5, var_157_1:getContentSize().height * 0.85))
			var_157_1:addChild(var_157_2)
		end

		if not var_157_2 then
			return
		end

		var_157_1:setPosition(ccp(0 - var_157_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
		var_157_0:addChild(var_157_1)

		local function var_157_3()
			var_157_0:removeChild(var_157_1, true)
		end

		local var_157_4 = CCArray:create()

		var_157_4:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
		var_157_4:addObject(CCDelayTime:create(1.5))
		var_157_4:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_157_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
		var_157_4:addObject(CCCallFuncN:create(var_157_3))

		local var_157_5 = CCSequence:create(var_157_4)

		var_157_1:runAction(var_157_5)
	end

	function var_1_0.isCastle(arg_159_0, arg_159_1)
		if arg_159_0 and arg_159_0 >= 1 and arg_159_0 <= 3 then
			local var_159_0
			local var_159_1

			if arg_159_1 == 2 then
				var_159_0 = CCSprite:create("res/ui/world/buildNation/jsl_word_lv" .. arg_159_0 .. ".png")
				var_159_1 = CCStrokeLabelTTF:create(language.get("222028_buildingTech"), "Thonburi", 20)

				if arg_159_0 == 2 then
					var_159_1 = CCStrokeLabelTTF:create(language.get("222029_buildingTech"), "Thonburi", 20)
				elseif arg_159_0 == 3 then
					var_159_1 = CCStrokeLabelTTF:create(language.get("222030_buildingTech"), "Thonburi", 20)
				end
			elseif arg_159_1 == 3 then
				var_159_0 = CCSprite:create("res/ui/world/buildNation/jhk_word_lv" .. arg_159_0 .. ".png")
				var_159_1 = CCStrokeLabelTTF:create(language.get("222031_buildingTech"), "Thonburi", 20)

				if arg_159_0 == 2 then
					var_159_1 = CCStrokeLabelTTF:create(language.get("222032_buildingTech"), "Thonburi", 20)
				elseif arg_159_0 == 3 then
					var_159_1 = CCStrokeLabelTTF:create(language.get("222033_buildingTech"), "Thonburi", 20)
				end

				local var_159_2 = CCSprite:create("res/ui/battle/junhuoku/bomb_1.png")
				local var_159_3 = CCSprite:create("res/ui/battle/junhuoku/bomb_2.png")
				local var_159_4 = CCSprite:create("res/ui/battle/junhuoku/bomb_3.png")
				local var_159_5 = CCSprite:create("res/ui/battle/junhuoku/bomb_4.png")

				var_159_2:setPosition(battleTower.bomb1)
				var_159_3:setPosition(battleTower.bomb2)
				var_159_5:setPosition(battleTower.bomb4)
				var_1_0.layerTabel.bombLayer2:addChild(var_159_2, battleTower.BOMB_1)
				var_1_0.layerTabel.bombLayer2:addChild(var_159_3, battleTower.BOMB_2)
				var_1_0.layerTabel.bombLayer1:addChild(var_159_5, battleTower.BOMB_4)
			elseif arg_159_1 == 4 then
				var_159_0 = CCSprite:create("res/ui/world/buildNation/ssy_word_name_lv" .. arg_159_0 .. ".png")
				var_159_1 = CCStrokeLabelTTF:create(language.get(491064), "Thonburi", 20)
			else
				var_159_0 = CCSprite:create("res/ui/world/buildNation/jgdy_ys_word_lv" .. arg_159_0 .. ".png")
				var_159_1 = CCStrokeLabelTTF:create(language.get("220980_buildNation"), "Thonburi", 20)

				if arg_159_0 == 2 then
					var_159_1 = CCStrokeLabelTTF:create(language.get("220981_buildNation"), "Thonburi", 20)
				elseif arg_159_0 == 3 then
					var_159_1 = CCStrokeLabelTTF:create(language.get("220982_buildNation"), "Thonburi", 20)
				end
			end

			var_159_0:setScale(1.2)
			var_159_1:setColor(ccc3(255, 255, 255))
			var_159_0:setPosition(visibleSize.width * 0.62, visibleSize.height * 0.93)
			var_159_1:setPosition(visibleSize.width * 0.62, visibleSize.height * 0.93 - 40)
			var_1_0.layerTabel.uiLayer:addChild(var_159_0)
			var_1_0.layerTabel.uiLayer:addChild(var_159_1)
		end
	end

	function var_1_0.addFlag(arg_160_0, arg_160_1)
		var_1_0.layerTabel.flagLayer:removeAllChildrenWithCleanup(true)

		local var_160_0 = arg_160_1 and arg_160_1 == 1 and CCSprite:create("res/ui/battle/flag/jzqz.png") or CCSprite:create("res/ui/battle/flag/shuaiqi.png")

		var_160_0:setPosition(battleTower.flag)
		var_1_0.layerTabel.flagLayer:addChild(var_160_0, 100)

		if arg_160_0 then
			local var_160_1 = CCSprite:create()

			var_160_1:setPosition(ccp(battleTower.flag.x - 63, battleTower.flag.y - 85))

			local var_160_2 = rmgr.getAnimation("flagDown")
			local var_160_3 = CCAnimation:createWithSpriteFrames(var_160_2, 0.05)
			local var_160_4 = CCAnimate:create(var_160_3)
			local var_160_5 = CCArray:create()

			var_160_5:addObject(CCDelayTime:create(0.25))
			var_160_5:addObject(CCRepeat:create(var_160_4, 1))
			var_160_1:runAction(CCSequence:create(var_160_5))
			var_1_0.layerTabel.flagLayer:addChild(var_160_1, 0)
			var_160_0:setPosition(ccp(battleTower.flag.x, battleTower.flag.y + 300))

			local var_160_6 = CCArray:create()

			var_160_6:addObject(CCFadeIn:create(0.06))
			var_160_6:addObject(CCMoveBy:create(0.2, ccp(0, -300)))
			var_160_0:runAction(CCSequence:create(var_160_6))
		end
	end

	function var_1_0.removeFlag()
		pcall(var_1_0.layerTabel.flagLayer.removeAllChildrenWithCleanup, var_1_0.layerTabel.flagLayer, true)
	end

	function var_1_0.milingDantiao(arg_162_0, arg_162_1, arg_162_2)
		local var_162_0 = smgr.getLayer("effectlayer")
		local var_162_1 = CCSprite:create("res/ui/battle/stategyPic/c4.png")
		local var_162_2 = CCSprite:create("res/ui/world/tscc_tit_mlsj.png")

		var_162_2:setPosition(ccp(var_162_1:getContentSize().width * 0.5, var_162_1:getContentSize().height * 0.4))
		var_162_1:addChild(var_162_2)

		local var_162_3 = CCStrokeLabelTTF:create(language.get(113032, arg_162_0, arg_162_1, arg_162_2), "Thonburi-Bold", 22, 2, ccc3(13, 13, 13))

		var_162_3:setPosition(ccp(var_162_1:getContentSize().width * 0.5, var_162_1:getContentSize().height * 0.2))
		var_162_1:addChild(var_162_3)
		var_162_1:setPosition(ccp(0 - var_162_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
		var_162_0:addChild(var_162_1, 1000)

		local function var_162_4()
			var_162_0:removeChild(var_162_1, true)
		end

		local var_162_5 = CCArray:create()

		var_162_5:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
		var_162_5:addObject(CCDelayTime:create(2.5))
		var_162_5:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_162_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
		var_162_5:addObject(CCCallFuncN:create(var_162_4))

		local var_162_6 = CCSequence:create(var_162_5)

		var_162_1:runAction(var_162_6)
	end

	function var_1_0.onPushArena(arg_164_0)
		if arg_164_0.champion then
			var_1_0.arenaInfo.champion = arg_164_0.champion
		end

		if arg_164_0.arenaType then
			var_1_0.arenaInfo.arenaType = arg_164_0.arenaType
		end

		if arg_164_0.result then
			if smgr.currentSceneTag == SCENE_BATTLE and var_1_0.battleId == arg_164_0.result.battleId then
				log.info("===================斩杀马下=====================")

				local var_164_0 = var_1_0.arenaData.addYinzhanResult(arg_164_0.result.challenger.forceName, arg_164_0.result.challenger.name, arg_164_0.result.challenger.forceId, arg_164_0.result.champion.forceName, arg_164_0.result.champion.name, arg_164_0.result.champion.forceId)

				smgr.showTipSpriteText(var_164_0, nil, 3)
			end

			local var_164_1 = arg_164_0.result

			if (var_164_1.challenger.playerId or var_164_1.challenger.id) == user.player.playerId then
				log.info("===================叫阵比武结果=====================")

				local var_164_2 = var_1_0.arenaData.addDuelResultBanner(var_164_1.challengeWin)

				smgr.showTipSpriteText(var_164_2, nil, 2)

				if var_1_0.isYz then
					roleDialogue.control.loadSpeak(var_164_1.challengeWin and "kfglChampion" .. var_164_1.battleId .. "_2" or "kfglChampion" .. var_164_1.battleId .. "_1")
				end
			end
		end

		var_1_0.championChange()
	end

	function var_1_0.deterUpdateChange(arg_165_0)
		local function var_165_0()
			if var_1_0.shadowSurrender then
				var_1_0.shadowSurrender:removeFromParentAndCleanup(true)

				var_1_0.shadowSurrender = nil
			end
		end

		if var_1_0.shadowSurrender ~= nil then
			var_165_0()
		end

		var_1_0.shadowSurrender = var_1_0.arenaData.addShadowSurrender(var_1_0.layerTabel.uiLayer, var_1_0, arg_165_0, var_165_0)
	end

	function var_1_0.jiaozhen()
		if var_1_0.arenaInfo.arenaTimes == 0 then
			smgr.showTipText(language.get(225006))

			return
		end

		if var_1_0.candidateList == nil then
			var_1_0.candidateList = var_1_0.arenaData.addCandidateList(var_1_0.layerTabel.uiLayer, function()
				var_1_0.candidateList:removeFromParentAndCleanup(true)

				var_1_0.candidateList = nil
			end, var_1_0)
		else
			var_1_0.candidateList:removeFromParentAndCleanup(true)

			var_1_0.candidateList = nil
		end
	end

	function var_1_0.weishe()
		log.info("================点击威慑====================")

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_1_0.handlerActivateArena, actions.activateKfArena, var_1_0.cityId)
		else
			cmgr.sendRequest(var_1_0.handlerActivateArena, actions.activateArena, var_1_0.cityId)
		end
	end

	function var_1_0.handlerActivateArena(arg_170_0)
		log.info("================威慑响应====================")
	end

	function var_1_0.chaofeng()
		local function var_171_0(arg_172_0)
			return
		end

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_171_0, actions.kfArenaTaunt, var_1_0.cityId)
		else
			cmgr.sendRequest(var_171_0, actions.arenaTaunt, var_1_0.cityId)
		end
	end

	function var_1_0.yinzhan()
		log.info("================点击应战====================")

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_1_0.handlerArenaChallenge, actions.arenaKfChallenge, var_1_0.cityId)
		else
			cmgr.sendRequest(var_1_0.handlerArenaChallenge, actions.arenaChallenge, var_1_0.cityId)
		end
	end

	function var_1_0.handlerArenaChallenge(arg_174_0)
		log.info("================应战响应====================")

		var_1_0.lastBattleId = var_1_0.battleId

		smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_JIAOZHEN, {
			yinzhanData = arg_174_0
		})
	end

	function var_1_0.handlerchooseChampion(arg_175_0)
		log.info("----------响应选择擂主---------------")

		var_1_0.arenaInfo.arenaType = 2
		var_1_0.arenaInfo.arenaTimes = var_1_0.arenaInfo.arenaTimes - 1

		var_1_0.championChange()

		if var_1_0.candidateList then
			var_1_0.candidateList:removeFromParentAndCleanup(true)

			var_1_0.candidateList = nil
		end
	end

	function var_1_0.championChange()
		if var_1_0.battleType == battleType.BATTLE_JIAOZHEN then
			if var_1_0.arenaInfo.tauntTimes and var_1_0.arenaInfo.tauntBuff then
				var_1_0.arenaData.addTauntBuff(var_1_0.layerTabel.uiLayer, var_1_0.arenaInfo)
			end

			return
		end

		if var_1_0.battleType ~= battleType.BATTLE_CITY and var_1_0.battleType ~= battleType.BATTLE_KFGZ then
			return
		end

		if var_1_0.arenaInfo.champion and var_1_0.cityId and var_1_0.cityId ~= var_1_0.arenaInfo.champion.cityId then
			return
		end

		var_1_0.rightButtonControl.updateArena(var_1_0.battleType, var_1_0.arenaInfo.arenaType, var_1_0.arenaInfo.champion)

		local var_176_0 = false
		local var_176_1 = 1

		if var_1_0.arenaInfo.arenaType ~= 0 then
			if var_1_0.arenaInfo.champion then
				if var_1_0.arenaInfo.champion.activated then
					local var_176_2 = true

					var_176_1 = 12
					var_1_0.arenaInfo.champion.activated = false
				end

				local function var_176_3(arg_177_0)
					local var_177_0 = tool.formatTime(arg_177_0, "@H:@M:@S")
					local var_177_1 = stringSplit(var_177_0, ":")[2]

					if var_1_0.arenaInfo.timeUpdate == nil then
						var_1_0.arenaInfo.timeUpdate = tonumber(var_177_1)
					elseif var_1_0.arenaInfo.timeUpdate ~= tonumber(var_177_1) then
						if var_1_0.arenaInfo.champion.leftTimes and var_1_0.arenaInfo.champion.leftTimes < var_1_0.arenaInfo.champion.maxLeftTimes then
							var_1_0.arenaInfo.champion.leftTimes = var_1_0.arenaInfo.champion.leftTimes + 1

							var_1_0.rightButtonControl.updateArena(var_1_0.battleType, var_1_0.arenaInfo.arenaType, var_1_0.arenaInfo.champion)
						end

						var_1_0.arenaInfo.timeUpdate = tonumber(var_177_1)
					end
				end

				local function var_176_4()
					if var_1_0.addChallengingList == nil then
						var_1_0.addChallengingList = var_1_0.arenaData.addChallengingList(var_1_0.layerTabel.uiLayer, var_1_0)
					end
				end

				if var_1_0.addBaseJiaozhen then
					var_1_0.addBaseJiaozhen:removeFromParentAndCleanup(true)

					var_1_0.addBaseJiaozhen = nil
				end

				if var_1_0.arenaInfo.champion.name then
					var_1_0.addBaseJiaozhen = var_1_0.arenaData.addBaseJiaozhen(var_1_0.arenaInfo.champion, var_1_0.layerTabel.uiLayer, var_176_4)
				end

				if var_1_0.arenaTimebar == nil and tonumber(var_1_0.arenaInfo.champion.cd) > 0 then
					var_1_0.arenaTimebar = var_1_0.arenaData.addTimeBar(var_1_0.arenaInfo.champion.cd, var_1_0.layerTabel.uiLayer, var_176_3)
				elseif var_1_0.arenaTimebar and tonumber(var_1_0.arenaInfo.champion.cd) <= 0 then
					var_1_0.arenaTimebar:removeFromParentAndCleanup(true)

					var_1_0.arenaTimebar = nil
				end
			end

			if var_1_0.arenaAni == nil then
				var_1_0.arenaAni = var_1_0.arenaData.createArenaAni(var_1_0.layerTabel.bombLayer1, var_176_1, var_1_0.figthSide == PLAYER_SIDE_ATT)
			else
				var_1_0.arenaAni:removeFromParentAndCleanup(true)

				var_1_0.arenaAni = nil
				var_1_0.arenaAni = var_1_0.arenaData.createArenaAni(var_1_0.layerTabel.bombLayer1, var_176_1, var_1_0.figthSide == PLAYER_SIDE_ATT)
			end
		end

		if var_1_0.arenaInfo.champion and (var_1_0.arenaInfo.champion.newlyCreate or var_1_0.arenaInfo.champion.isOver) then
			local var_176_5 = 1

			if var_1_0.arenaInfo.champion.newlyCreate then
				var_1_0.arenaInfo.champion.newlyCreate = false
				var_176_5 = (var_1_0.arenaInfo.champion.forceId == user.player.forceId or var_1_0.arenaInfo.champion.forceId == user.player.kfgzForceId) and 1 or 2
			end

			if var_1_0.arenaInfo.champion.isOver then
				var_1_0.arenaInfo.champion.isOver = false
				var_176_5 = 3
			end

			local var_176_6 = var_1_0.arenaData.addJiaozhenState(var_176_5)

			smgr.showTipSpriteText(var_176_6)
		end

		if var_1_0.arenaInfo.arenaType == 0 then
			if var_1_0.addBaseJiaozhen then
				var_1_0.addBaseJiaozhen:removeFromParentAndCleanup(true)

				var_1_0.addBaseJiaozhen = nil
			end

			if var_1_0.arenaTimebar then
				var_1_0.arenaTimebar:removeFromParentAndCleanup(true)

				var_1_0.arenaTimebar = nil
			end

			if var_1_0.arenaAni then
				var_1_0.arenaAni:removeFromParentAndCleanup(true)

				var_1_0.arenaAni = nil
			end
		end
	end

	function var_1_0.showCorpsNum()
		local var_179_0

		if var_1_0.battleType == battleType.BATTLE_KFGZ then
			var_179_0 = user.kfCorpsNum
		else
			var_179_0 = user.corpsNum
		end

		if var_179_0 and var_179_0.idleNum then
			log.info("军团信息")

			local var_179_1 = createBaseLayer()
			local var_179_2 = CCSprite:create("res/ui/battle/juntuan/jt_word_bg.png")

			var_179_2:setPosition(ccp(visibleSize.width - 65, visibleSize.height * 0.5 + 212))
			var_179_1:addChild(var_179_2)

			local var_179_3 = CCStrokeLabelTTF:create(language.get("223604_juntuan", var_179_0.idleNum), "Thonburi-Bold", 22)
			local var_179_4 = CCStrokeLabelTTF:create(language.get("223605_juntuan", var_179_0.busyNum), "Thonburi-Bold", 22)

			var_179_3:setAnchorPoint(ccp(0, 0.5))
			var_179_4:setAnchorPoint(ccp(0, 0.5))
			var_179_3:setPosition(ccp(10, 17))
			var_179_4:setPosition(ccp(10, 44))
			var_179_3:setColor(ccc3(0, 255, 0))
			var_179_4:setColor(ccc3(255, 0, 0))
			var_179_2:addChild(var_179_3)
			var_179_2:addChild(var_179_4)

			local function var_179_5(arg_180_0)
				local var_180_0 = arg_180_0.data or arg_180_0.action.data

				if var_180_0.corpsNum and var_180_0.corpsNum.idleNum then
					if var_1_0.battleType == battleType.BATTLE_KFGZ then
						user.kfCorpsNum = var_180_0.corpsNum
					else
						user.corpsNum = var_180_0.corpsNum
					end

					var_179_3:setString(language.get("223604_juntuan", var_180_0.corpsNum.idleNum))
					var_179_4:setString(language.get("223605_juntuan", var_180_0.corpsNum.busyNum))
				end

				if var_1_0.battleType == battleType.BATTLE_KFGZ then
					if var_180_0.corpsAction and var_180_0.corpsAction.forceId then
						user.kfCorpsAction[var_180_0.corpsAction.forceId] = var_180_0.corpsAction
					end

					if var_180_0.corpsInfo and var_180_0.corpsInfo.forceId then
						user.kfCorpsInfo[var_180_0.corpsInfo.forceId] = var_180_0.corpsInfo
					end

					if var_180_0.state and type(var_180_0.state) ~= "number" and var_180_0.state.corpsState then
						user.kfCorpsState = var_180_0.state.corpsState
					end

					if var_180_0.corpsNum then
						user.kfCorpsNum = var_180_0.corpsNum
					end
				end
			end

			function var_179_1.onEnter(arg_181_0)
				if var_1_0.battleType == battleType.BATTLE_KFGZ then
					kfcmgr.registerResponseHandler(actions.pushCorps, var_179_5)
				else
					cmgr.registerResponseHandler(actions.pushCorps, var_179_5)
				end
			end

			function var_179_1.onExit(arg_182_0)
				if var_1_0.battleType == battleType.BATTLE_KFGZ then
					kfcmgr.unregisterResponseHandler(actions.pushCorps, var_179_5)
				else
					cmgr.unregisterResponseHandler(actions.pushCorps, var_179_5)
				end
			end

			var_1_0.layerTabel.uiLayer:addChild(var_179_1, 10)
		end
	end

	function var_1_0.handlerKfzbPush(arg_183_0)
		if arg_183_0.data and arg_183_0.data.kfzbbaseInfo then
			bmgr.enterKfzb()
		end
	end

	function var_1_0.useLockCity()
		log.info("@@发动连锁", var_1_0.cityId)
		loadingLayer.show(SCENE_WORLD, var_1_0.cityId, nil, nil, nil, true)
	end

	function var_1_0.isKfWar()
		return var_1_0.battleType == battleType.BATTLE_KFGZ or var_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or var_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN
	end

	function var_1_0.cityLockInfoUpdate(arg_186_0)
		if var_1_0.isKfWar() or arg_186_0 == nil then
			return
		end

		if smgr.currentSceneTag == SCENE_BATTLE then
			if arg_186_0.state == 1 then
				if lockCityInfo.forceId == user.player.forceId then
					notice.control.lockNotice(2)
				else
					notice.control.lockNotice(4)
				end
			elseif arg_186_0.state == 2 then
				notice.control.lockNotice(5)
			end
		end

		if var_1_0.defGenerlListControl then
			var_1_0.defGenerlListControl.updateLockInfo(arg_186_0)
		end
	end

	return var_1_0
end
