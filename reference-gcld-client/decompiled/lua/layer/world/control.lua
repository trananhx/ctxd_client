require("lua/layer/world/traceData")

worldControl = {}

local var_0_0 = worldControl

var_0_0.lastCityId = nil
var_0_0.memoryLocaition = nil
var_0_0.maxLockCities = 3

local var_0_1 = 0
local var_0_2 = {}

local function var_0_3(arg_1_0)
	if arg_1_0.action.state == 1 then
		local var_1_0 = arg_1_0.action.data

		var_0_0.manzuInfo = var_1_0.manzuInfo

		worldUI.initManzu()
		loadingLayer.hide()
	end
end

function var_0_0.getShouMaiInfo()
	cmgr.sendRequest(var_0_3, actions.getManzuShoumaiInfo)
end

local function var_0_4(arg_3_0)
	if arg_3_0.action.state == 1 then
		var_0_0.farmInfo = arg_3_0.action.data

		worldUI.initFarm()
	end
end

local function var_0_5(arg_4_0)
	local function var_4_0(arg_5_0)
		if arg_5_0.action.data then
			worldUI.addweichengTask(arg_5_0.action.data)
		end
	end

	if arg_4_0.action.data and arg_4_0.action.data.refresh and arg_4_0.action.data.refresh.taskStart then
		worldUI.removeWeichengTask()
		cmgr.sendRequest(var_4_0, actions.getSpecialSInfo)
	elseif arg_4_0.action.data and arg_4_0.action.data.taskchange then
		worldUI.removeWeichengTask()
		cmgr.sendRequest(var_4_0, actions.getSpecialSInfo)
	end
end

local function var_0_6(arg_6_0)
	if arg_6_0.action.data and arg_6_0.action.data.nextToken and arg_6_0.action.data.nextToken.attToken then
		for iter_6_0 = 1, #arg_6_0.action.data.nextToken.attToken do
			worldUI.addNationTaskzhiyuanling(arg_6_0.action.data.nextToken.attToken[iter_6_0])
		end
	end
end

local function var_0_7(arg_7_0)
	local var_7_0 = arg_7_0.action.data

	if var_7_0.shogun and var_7_0.shogun.cityShogun then
		worldUI.updateShogun(var_7_0.shogun.cityShogun)
	end
end

local function var_0_8(arg_8_0)
	if not checkWorldFeudCd then
		checkWorldFeudCd = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_9_0)
			if user and user.feuds then
				for iter_9_0, iter_9_1 in pairs(user.feuds) do
					for iter_9_2, iter_9_3 in pairs(iter_9_1) do
						if user.player.name == iter_9_3.playerName then
							if iter_9_3.state == 0 then
								if iter_9_3.cd and iter_9_3.cd > 0 then
									iter_9_3.cd = iter_9_3.cd - arg_9_0 * 1000

									if iter_9_3.cd <= 0 then
										worldUI.removeBtnFeud(iter_9_3.cityId)
									end
								else
									worldUI.removeBtnFeud(iter_9_3.cityId)
								end
							elseif iter_9_3.state == 2 and iter_9_3.leftTime > 0 then
								iter_9_3.leftTime = iter_9_3.leftTime - arg_9_0 * 1000
							end
						end
					end
				end
			end
		end, 0.2, false)
	end

	local var_8_0 = arg_8_0.action.data

	if var_8_0.feud then
		if var_8_0.feud.leftFeudTimes then
			user.leftFeudTimes = var_8_0.feud.leftFeudTimes or 0

			eventManager.dispatchEvent("leftFeudTimes")
		end

		if var_8_0.feud.feudAccNum then
			user.feudAccNum = var_8_0.feud.feudAccNum or 0

			eventManager.dispatchEvent("feudAccNum")
		end
	end

	if var_8_0.feud and var_8_0.feud.feuds then
		user.feuds = user.feuds or {}
		user.feudCities = user.feudCities or {}
		user.feudSealCities = user.feudSealCities or {}
		worldUI.feudTable = worldUI.feudTable or {}

		local var_8_1 = smgr.getLayer("worldCamera")

		for iter_8_0, iter_8_1 in pairs(var_8_0.feud.feuds) do
			local var_8_2 = stringSplit(iter_8_1.a, "|")

			iter_8_1.playerName = var_8_2[1]
			iter_8_1.forceId = tonumber(var_8_2[2])
			iter_8_1.cityId = tonumber(var_8_2[3])

			if var_8_2[4] == nil then
				iter_8_1.state = nil
			else
				iter_8_1.state = tonumber(var_8_2[4])
			end

			iter_8_1.index = tonumber(var_8_2[5])

			local var_8_3 = iter_8_1.cityId

			if iter_8_1.state ~= nil then
				if user.player.name ~= iter_8_1.playerName and iter_8_1.state == 0 then
					-- block empty
				else
					user.feuds[var_8_3] = user.feuds[var_8_3] or {}

					for iter_8_2, iter_8_3 in pairs(user.feuds[var_8_3]) do
						if iter_8_3.playerName == iter_8_1.playerName then
							user.feuds[var_8_3][iter_8_3.index] = nil
						end
					end

					user.feuds[var_8_3][iter_8_1.index] = iter_8_1

					if user.player.name == iter_8_1.playerName then
						if iter_8_1.state == 0 then
							user.feudSealCities[var_8_3] = iter_8_1
						elseif iter_8_1.state == 2 or iter_8_1.state == 3 and iter_8_1.canGetRewardNum and iter_8_1.canGetRewardNum > 0 then
							user.feudCities[var_8_3] = iter_8_1
						end
					end
				end
			else
				worldUI.removeBtnFeud(var_8_3)
			end
		end

		worldUI.addBtnFeud()
	end

	if var_8_0.icon and var_8_0.icon.feudCities then
		user.feudCities = user.feudCities or {}
	end

	notice.control.refreshLayer()
end

local function var_0_9(arg_10_0)
	local var_10_0 = arg_10_0.action.data

	if var_10_0.addWorker then
		local var_10_1 = var_10_0.addWorker
		local var_10_2 = var_0_0.castles[var_10_1.cityId]

		var_10_2.cityId = var_10_1.cityId
		var_10_2.forceId = var_10_1.forceId
		var_10_2.preName = var_10_1.preName
		var_10_2.requires = var_10_1.requires
		var_10_2.canBuild = var_10_1.canBuild
		var_10_2.participate = var_10_1.participate

		worldUI.showFortressCity(var_10_2)
	end

	if var_10_0.cityCastle then
		local var_10_3 = var_10_0.cityCastle
		local var_10_4 = var_0_0.castles[var_10_3.cityId]

		var_0_0.castles[var_10_3.cityId] = var_10_3

		worldUI.showFortressCity(var_10_3)

		if var_10_4 and var_10_4.leftLitFireTimes ~= var_10_3.leftLitFireTimes then
			if var_10_3.category == 3 then
				if var_0_0.lockInfo[var_10_3.cityId] and var_10_3.leftLitFireTimes == 0 then
					var_0_0.lockInfo[var_10_3.cityId] = var_10_3.leftLitFireTimes
				end
			elseif var_10_3.category == 2 then
				var_0_0.lockInfo[var_10_3.cityId] = var_10_3.leftLitFireTimes
			end

			eventManager.dispatchEvent("showCityLockIcon", var_10_3.cityId)
		end

		if var_10_0.chain then
			local var_10_5 = var_10_0.chain

			if var_10_5.state == nil then
				var_10_5.state = 0
			end

			smgr.getLayer("worldCamera").lockCityInfo(var_10_5)

			if var_0_0.lockCitiesInfo then
				if var_10_5.state == 1 then
					table.insert(var_0_0.lockCitiesInfo, var_10_5)
				elseif var_10_5.state == 2 then
					local var_10_6 = 0
					local var_10_7 = 0

					for iter_10_0, iter_10_1 in pairs(var_0_0.lockCitiesInfo) do
						var_10_6 = var_10_6 + 1

						if iter_10_1.fromCityId == var_10_5.fromCityId then
							var_10_7 = var_10_6

							break
						end
					end

					if var_10_7 > 0 then
						table.remove(var_0_0.lockCitiesInfo, var_10_7)
					end
				end
			end
		end

		if var_10_3.state == 1 and user.player.forceId == var_10_3.forceId then
			local var_10_8 = os.time()

			if var_0_2[var_10_3.cityId] and var_10_8 - var_0_2[var_10_3.cityId] <= 1800 then
				return
			end

			var_0_2[var_10_3.cityId] = var_10_8

			local var_10_9 = smgr.getLayer("tipLayer")

			if var_10_9 then
				local var_10_10 = CCSprite:create("res/ui/battle/battle_tip_background.png")

				var_10_10:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				var_10_9:addChild(var_10_10)

				local function var_10_11()
					var_10_9:removeChild(var_10_10, true)
				end

				local var_10_12 = CCSprite:create("res/ui/world/buildNation/jgdy_ys_word_jysksjz_0" .. var_10_3.index .. ".png")
				local var_10_13 = "jgdy_ys_word_jysksjz.png"

				if var_10_3.category then
					if var_10_3.category == 2 then
						var_10_13 = "jzd_word_jjslksjz.png"
					elseif var_10_3.category == 3 then
						var_10_13 = "jzd_word_jjhkksjz.png"
					elseif var_10_3.category == 4 then
						var_10_13 = "ssy_word_ssyksjz.png"
					end
				end

				local var_10_14 = CCSprite:create("res/ui/world/buildNation/" .. var_10_13)
				local var_10_15

				if conf.language == "vie" or conf.language == "tha" then
					var_10_15 = createRichNode({
						var_10_14,
						var_10_12
					}, 0.5)
				else
					var_10_15 = createRichNode({
						var_10_12,
						var_10_14
					}, 0.5)
				end

				local var_10_16 = 800

				if var_10_15 then
					var_10_15:setPosition(ccp(var_10_10:getContentSize().width * 0.5 + var_10_16, var_10_10:getContentSize().height * 0.5))
					var_10_10:addChild(var_10_15)

					local var_10_17 = CCArray:create()

					var_10_17:addObject(CCFadeIn:create(0.06))
					var_10_17:addObject(CCMoveBy:create(0.3, ccp(-var_10_16, 0)))
					var_10_17:addObject(CCDelayTime:create(2.5))
					var_10_17:addObject(CCMoveBy:create(0.3, ccp(-var_10_16, 0)))
					var_10_17:addObject(CCFadeOut:create(0.06))
					var_10_17:addObject(CCCallFuncN:create(var_10_11))

					local var_10_18 = CCSequence:create(var_10_17)

					var_10_15:runAction(CCSequence:create(var_10_17))
				end
			end
		elseif var_10_3.state == 4 and user.player.forceId == var_10_3.forceId then
			if var_10_4 ~= nil and var_10_4.state ~= 0 and var_10_4.state ~= 1 then
				return
			end

			local var_10_19 = smgr.getLayer("tipLayer")

			if var_10_19 then
				local var_10_20 = CCSprite:create("res/ui/battle/battle_tip_background.png")

				var_10_20:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
				var_10_19:addChild(var_10_20)

				local function var_10_21()
					var_10_19:removeChild(var_10_20, true)
				end

				local var_10_22 = CCSprite:create("res/ui/world/buildNation/jgdy_ys_word_jz02.png")

				if var_10_3.failType ~= 1 then
					var_10_22 = CCSprite:create("res/ui/world/buildNation/jgdy_ys_word_jz03.png")
				end

				local var_10_23 = 800

				if var_10_22 then
					var_10_22:setPosition(ccp(var_10_20:getContentSize().width * 0.5 + var_10_23, var_10_20:getContentSize().height * 0.5))
					var_10_20:addChild(var_10_22)

					local var_10_24 = CCArray:create()

					var_10_24:addObject(CCFadeIn:create(0.06))
					var_10_24:addObject(CCMoveBy:create(0.3, ccp(-var_10_23, 0)))
					var_10_24:addObject(CCDelayTime:create(2.5))
					var_10_24:addObject(CCMoveBy:create(0.3, ccp(-var_10_23, 0)))
					var_10_24:addObject(CCFadeOut:create(0.06))
					var_10_24:addObject(CCCallFuncN:create(var_10_21))

					local var_10_25 = CCSequence:create(var_10_24)

					var_10_22:runAction(CCSequence:create(var_10_24))
				end
			end
		end
	end
end

local function var_0_10(arg_13_0)
	user.strategyCityId = arg_13_0.targetCity and arg_13_0.targetCity or arg_13_0.fromCityId

	if arg_13_0.strategy == "drawBack" then
		if arg_13_0.selfNation == user.player.forceId then
			roleDialogue.control.loadSpeak("drawBack1")
		elseif arg_13_0.concernNation == user.player.forceId then
			roleDialogue.control.loadSpeak("drawBack2")
		end
	elseif arg_13_0.strategy == "surround" then
		if arg_13_0.selfNation == user.player.forceId then
			roleDialogue.control.loadSpeak("surround1")
		elseif arg_13_0.concernNation == user.player.forceId then
			roleDialogue.control.loadSpeak("surround2")
		end
	elseif arg_13_0.strategy == "killAll" then
		-- block empty
	elseif arg_13_0.strategy == "ysProvoke" then
		roleDialogue.control.loadSpeak("NpcYuanShao1")

		if user.taskDecide2 then
			for iter_13_0, iter_13_1 in ipairs(user.taskDecide2) do
				if iter_13_1.strategy == "ysProvoke" then
					table.remove(user.taskDecide2, iter_13_0)

					break
				end
			end
		end
	elseif arg_13_0.strategy == "hjRebel" then
		roleDialogue.control.loadSpeak("NpcHuangJin1")

		if user.taskDecide2 then
			for iter_13_2, iter_13_3 in ipairs(user.taskDecide2) do
				if iter_13_3.strategy == "hjRebel" then
					table.remove(user.taskDecide2, iter_13_2)

					break
				end
			end
		end
	elseif arg_13_0.strategy == "barInvade" then
		roleDialogue.control.loadSpeak("NpcManZu1")

		if user.taskDecide2 then
			for iter_13_4, iter_13_5 in ipairs(user.taskDecide2) do
				if iter_13_5.strategy == "barInvade" then
					table.remove(user.taskDecide2, iter_13_4)

					break
				end
			end
		end
	end
end

function var_0_0.getFarmInfo()
	cmgr.sendRequest(var_0_4, actions.getFarmCityInfo)
end

local function var_0_11()
	local var_15_0 = {
		163,
		48,
		201
	}

	user.task90_cityId = var_15_0[user.player.forceId]
end

local function var_0_12()
	local var_16_0 = {
		121,
		20,
		210
	}

	user.task91_cityId = var_16_0[user.player.forceId]
end

function var_0_0.worldRepairManzuRoad()
	local function var_17_0(arg_18_0)
		globalAction_gotResource({
			{
				id = 6,
				value = arg_18_0.action.data.exp
			}
		})

		local var_18_0 = smgr.getLayer("worldCamera")
		local var_18_1 = var_18_0.cityTable["world_building_" .. worldConstant.MANZU_CITY[user.player.forceId]]

		if var_18_1.manzuTaskStoneNum then
			var_18_1.manzuTaskStoneNum:setString("/" .. arg_18_0.action.data.myStoneNum)
		end

		local var_18_2 = {
			ccp(4355, 3425),
			ccp(255, 1150),
			ccp(4960, 255)
		}

		if var_18_1.manzuTaskHammer then
			var_18_1.manzuTaskHammer:removeFromParentAndCleanup(true)

			var_18_1.manzuTaskHammer = nil
		end

		local var_18_3 = CCNode:create()

		var_18_3:setPosition(var_18_2[user.player.forceId])
		var_18_0.worldLayer:addChild(var_18_3, 105)

		var_18_1.manzuTaskHammer = var_18_3

		local var_18_4 = CCSprite:create()

		var_18_3:addChild(var_18_4)

		local var_18_5 = CCSprite:create("res/ui/resourceArea2/resou_gra_cz_g.png")

		var_18_5:setPosition(ccp(60, -10))
		var_18_5:setAnchorPoint(ccp(1, 0))
		var_18_5:setRotation(90)
		var_18_3:addChild(var_18_5)

		local var_18_6 = CCArray:create()

		for iter_18_0 = 1, 2 do
			var_18_6:addObject(CCRotateBy:create(0.15, -90))
			var_18_6:addObject(CCCallFuncN:create(function()
				local var_19_0 = CCArray:create()

				for iter_19_0 = 1, 5 do
					local var_19_1 = CCSprite:create(string.format("res/ui/world/manzu/zymz_light%s.png", iter_19_0))

					var_19_0:addObject(var_19_1:displayFrame())
				end

				local var_19_2 = CCAnimation:createWithSpriteFrames(var_19_0, 0.1)
				local var_19_3 = CCAnimate:create(var_19_2)

				var_18_4:runAction(var_19_3)
			end))
			var_18_6:addObject(CCRotateBy:create(0.3, 90))

			if iter_18_0 == 2 then
				var_18_6:addObject(CCCallFuncN:create(function()
					var_18_3:removeFromParentAndCleanup(true)

					var_18_1.manzuTaskHammer = nil
				end))
			end
		end

		var_18_5:runAction(CCSequence:create(var_18_6))
	end

	cmgr.sendRequest(var_17_0, actions.worldRepairManzuRoad)
end

function var_0_0.kfyzRebuild(arg_21_0)
	local function var_21_0(arg_22_0)
		worldUI.addRuinedCitySingle({
			isRuined = true,
			cityId = arg_21_0,
			leftTime = arg_22_0.action.data.leftTime
		})
	end

	cmgr.sendRequest(var_21_0, actions.kfyzRebuilt, arg_21_0)
end

local function var_0_13(arg_23_0)
	if arg_23_0.action.state == 1 then
		local var_23_0 = arg_23_0.action.data

		var_0_0.cities = var_23_0.cities
		var_0_0.league = {}
		var_0_0.league.type = var_23_0.league
		var_0_0.league.first = var_23_0.first
		var_0_0.league.second = var_23_0.second
		var_0_0.league.third = var_23_0.third

		if var_0_0.league.type ~= 0 then
			local function var_23_1(arg_24_0)
				if arg_24_0.action.data then
					var_0_0.league.effect1 = arg_24_0.action.data.effect
					var_0_0.league.effect2 = arg_24_0.action.data.effect2
					var_0_0.league.effect3 = arg_24_0.action.data.effect3
					var_0_0.league.effect4 = arg_24_0.action.data.effect4
					var_0_0.league.effect5 = arg_24_0.action.data.effect5
				end
			end

			cmgr.sendRequest(var_23_1, actions.getLeagueInfo)
		end

		var_0_0.cityNum = var_23_0.cityNum
		var_0_0.CNP = var_23_0.CNP
		var_0_0.maxNum = var_23_0.maxNum
		var_0_0.rewardNum = var_23_0.rewardNum
		var_0_0.quality = var_23_0.quality
		var_0_0.leftTime = var_23_0.leftTime
		var_0_0.rank = var_23_0.rank
		var_0_0.title = var_23_0.title
		var_0_0.titleName = var_23_0.titleName
		var_0_0.killNum = var_23_0.killNum
		var_0_0.killTotal = var_23_0.killTotal
		var_0_0.nextKillNum = var_23_0.nextKillNum
		var_0_0.nextTitle = var_23_0.nextTitle
		var_0_0.received = var_23_0.received
		var_0_0.isWholePointKill = var_23_0.isWholePointKill
		var_0_0.shaDiLingNum = var_23_0.shaDiLingNum
		var_0_0.generalId = var_23_0.generalId
		var_0_0.boxInfo = var_23_0.boxInfo
		var_0_0.curNationTask = var_23_0.curNationTask
		var_0_0.curTryTask = var_23_0.curTryTask
		var_0_0.stratagem = var_23_0.stratagem
		var_0_0.attToken = var_23_0.attToken
		var_0_0.hzAttForce = var_23_0.hzAttForce
		var_0_0.hzAttForce1 = var_23_0.hzAttForce1
		var_0_0.hzAttForce2 = var_23_0.hzAttForce2
		var_0_0.hzAttForceId1 = var_23_0.hzAttForceId1
		var_0_0.hzAttForceId2 = var_23_0.hzAttForceId2
		var_0_0.hzCityId = var_23_0.hzCityId
		var_0_0.hzDefForce = var_23_0.hzDefForce
		var_0_0.hzDefForceId = var_23_0.hzDefForceId
		var_0_0.hzLv = var_23_0.hzLv
		var_0_0.hzLvName = var_23_0.hzLvName
		var_0_0.mistVersion = var_23_0.mistVersion
		var_0_0.showLeagueAni = var_23_0.showLeagueAni
		var_0_0.cityCombo = var_23_0.cityCombo
		var_0_0.invade = var_23_0.invade
		var_0_0.slaughterInfo = var_23_0.slaughterInfo
		var_0_0.showWorker = var_23_0.showWorker

		if var_23_0.ysCityId then
			var_0_0.ysCityId = var_23_0.ysCityId
		end

		var_0_0.hjCountDown = var_23_0.hjCountDown
		var_0_0.phase = var_23_0.phase
		var_0_0.hjCenterCity = var_23_0.hjCenterCity
		var_0_0.hjRemainCities = var_23_0.hjRemainCities
		var_0_0.castles = {}
		var_0_0.lockInfo = {}

		for iter_23_0, iter_23_1 in pairs(var_23_0.castles) do
			var_0_0.castles[iter_23_1.cityId] = iter_23_1

			if iter_23_1.leftLitFireTimes and iter_23_1.leftLitFireTimes > 0 and iter_23_1.category == 2 then
				var_0_0.lockInfo[iter_23_1.cityId] = iter_23_1.leftLitFireTimes

				eventManager.dispatchEvent("showCityLockIcon", iter_23_1.cityId)
			end
		end

		if var_23_0.chains then
			var_0_0.lockCitiesInfo = var_23_0.chains

			smgr.getLayer("worldCamera").cityLockUpdate(var_0_0.lockCitiesInfo)
		end

		var_0_0.gongjiangPaths = var_23_0.workerPaths
		var_0_0.canBuildCastle = var_23_0.canBuildCastle or false
		var_0_0.nextCastleTime = var_23_0.nextCastleTime or 0
		var_0_0.nextAdviceCd = var_23_0.nextAdviceCd or 0
		var_0_0.top3Nations = var_23_0.top3Nations
		var_0_0.nations = var_23_0.nations
		var_0_0.hjInfos = var_23_0.hjInfos
		var_0_0.corpsOpen = var_23_0.corpsOpen
		var_0_0.freeCorpsTimes = var_23_0.freeCorpsTimes
		user.personalCorpsOpen = var_23_0.personalCorpsOpen
		user.freePersonalCorpsTimes = var_23_0.freePersonalCorpsTimes
		var_0_0.needOccupation = var_23_0.needOccupation

		if var_0_0.needOccupation then
			roleDialogue.control.loadSpeak(2010)
		end

		var_0_0.sdManzuAttachedTaskInfo = var_23_0.sdManzuAttachedTaskInfo

		if var_23_0.cityCombo then
			require("lua/layer/world/cityCombo/ui")
			cityComboUI.setCityComboWorld(var_0_0.cityCombo)
		end

		var_0_0.thumbnailIconTable = {}

		worldUI.addBuilding(var_0_0.cities)
		worldUI.addBoxes(var_0_0.boxInfo)
		worldUI.addMoveLayer()
		worldUI.addWishTree(var_23_0.forcastWishEvent)

		for iter_23_2, iter_23_3 in pairs(var_23_0.cityTrickState) do
			require("lua/common/tool")

			if iter_23_3.tower then
				local var_23_2 = iter_23_3.tower

				worldUI.addTower(var_23_2)
			end

			if iter_23_3.cityEvent then
				worldUI.addCityEvent(iter_23_3)
			end

			if iter_23_3.playerEvent then
				worldUI.addPlayerEvent(iter_23_3)
			end

			if iter_23_3.yzjInfo then
				local var_23_3 = {
					yzjRefresh = iter_23_3.yzjInfo
				}

				log.info("进入世界时候增加远征军", tool.tableToJson(var_23_3))
				worldUI.addCityEvent(var_23_3)
			end

			if iter_23_3.trickState then
				for iter_23_4, iter_23_5 in pairs(iter_23_3.trickState) do
					iter_23_5.cityId = iter_23_3.cityId

					worldUI.addTrickState(iter_23_5)
				end
			end
		end

		var_23_0.forceEvents = var_23_0.forceEvents or {}

		for iter_23_6, iter_23_7 in pairs(var_23_0.forceEvents) do
			worldUI.addForceEvent(iter_23_7)
		end

		if var_0_0.curNationTask and var_0_0.curNationTask.tasks then
			for iter_23_8, iter_23_9 in pairs(var_0_0.curNationTask.tasks) do
				if iter_23_9.taskType == 1 and iter_23_9.taskState == 0 then
					worldUI.addNationTask(iter_23_9)
				end

				if iter_23_9.taskType == 0 and iter_23_9.taskState == 0 then
					worldUI.addNationUpgradeTask(iter_23_9)
				end

				if iter_23_9.taskType == 9 and iter_23_9.taskState == 0 then
					worldUI.addNationThiefTask(iter_23_9)
				end

				if iter_23_9.taskType == 10 and iter_23_9.taskState == 0 then
					worldUI.addNationBuildingTask(iter_23_9)
				end

				if iter_23_9.taskType == 12 and iter_23_9.taskState == 0 then
					worldUI.addNationBuildingTask(iter_23_9)
				end

				if iter_23_9.taskType == 13 and iter_23_9.taskState == 0 then
					worldUI.addNationTask(iter_23_9)
				end

				if iter_23_9.taskType == 14 then
					worldUI.addNationTaskNewInvest(iter_23_9)
				end

				if iter_23_9.taskType == 18 then
					var_0_0.monsterTaskUpdate(iter_23_9, false)
				end
			end

			var_0_0.nationNpcUpdate(var_0_0.curNationTask.tasks)
		end

		if var_0_0.curTryTask and var_0_0.curTryTask.tryTasks then
			for iter_23_10, iter_23_11 in pairs(var_0_0.curTryTask.tryTasks) do
				worldUI.addTryTask(iter_23_11)
			end
		end

		if var_0_0.attToken then
			log.info("有结盟支援令")

			for iter_23_12 = 1, #var_0_0.attToken do
				worldUI.addNationTaskzhiyuanling(var_0_0.attToken[iter_23_12])
			end
		end

		if var_0_0.invade then
			for iter_23_13 = 1, #var_0_0.invade do
				log.info("add sougua")
				worldUI.addSougua(var_0_0.invade[iter_23_13])
			end
		end

		if var_0_0.slaughterInfo then
			for iter_23_14 = 1, #var_0_0.slaughterInfo do
				log.info("add tucheng")
				worldUI.addTucheng(var_0_0.slaughterInfo[iter_23_14])
			end
		end

		if var_0_0.sdManzuAttachedTaskInfo then
			worldUI.addManzuTaskStone(var_0_0.sdManzuAttachedTaskInfo)
		end

		if var_0_0.nations then
			for iter_23_15 = 1, #var_0_0.nations do
				log.info("add 新镇压蛮族")

				if user.player.forceId == var_0_0.nations[iter_23_15].nation then
					for iter_23_16, iter_23_17 in pairs(var_0_0.nations[iter_23_15].cities) do
						worldUI.addNewManzu(iter_23_17)
					end
				end
			end
		end

		if var_0_0.hjInfos then
			for iter_23_18 = 1, #var_0_0.hjInfos do
				log.info("add 新张角")
				worldUI.addNewHuangjin(var_0_0.hjInfos[iter_23_18])
			end
		end

		var_0_0.specialNpc = var_23_0.specialNpc

		if var_0_0.specialNpc then
			worldUI.addSpecialNpc(var_0_0.specialNpc)
		end

		var_0_0.ruines = var_23_0.ruines

		if var_0_0.ruines then
			worldUI.addRuinedCity(var_0_0.ruines)
		end

		for iter_23_19, iter_23_20 in pairs(var_0_0.castles) do
			worldUI.showFortressCity(iter_23_20)
		end

		if var_0_0.showWorker then
			log.info("送建筑队的对话")
			roleDialogue.control.loadSpeak(1991)
		end

		var_0_11()
		var_0_12()

		if user.curMainTask.taskId == 90 and user.curMainTask.state == 1 then
			eventManager.dispatchEvent("moveToCity", user.task90_cityId)
		elseif user.curMainTask.taskId == 91 and user.curMainTask.state == 1 then
			eventManager.dispatchEvent("moveToCity", user.task91_cityId)
		elseif var_0_0.targetCityId then
			eventManager.dispatchEvent("moveToCity", var_0_0.targetCityId, var_0_0.needArrow)
		elseif var_0_0.memoryLocaition then
			log.info("使用记忆位置(%s,%s)", var_0_0.memoryLocaition.x, var_0_0.memoryLocaition.y)
			eventManager.dispatchEvent("worldSetOffet", var_0_0.memoryLocaition)
		else
			eventManager.dispatchEvent("moveToCity", var_23_0.initCity)
		end

		worldUI.initHourRank()
		worldUI.checkLeagueInfo()
		worldThumbnailUI.checkLeagueInfo()
		worldUI.checkBetrayResult()

		if var_23_0.winNpc then
			worldUI.maskFog({
				maskCity = var_23_0.maskCity,
				gPic = var_23_0.gPic,
				rewardType = var_23_0.rewardType
			})
		end

		var_0_0.getShouMaiInfo()
		var_0_0.getFarmInfo()

		local var_23_4 = smgr.getLayer("worldCamera")

		worldUI.loadMapWithPosition(var_23_4.scrollLayer:getContentOffset().x, var_23_4.scrollLayer:getContentOffset().y)

		if worldUI.shouldShowThumbnail then
			worldThumbnailControl.thumbnailIsVisible = true

			worldThumbnailUI.setThumbnailVisible(worldThumbnailControl.thumbnailIsVisible)
			eventManager.dispatchEvent("sideGeneralSetVisible", not worldThumbnailControl.thumbnailIsVisible)
			eventManager.dispatchEvent("taskButtonItemSetVisible", not worldThumbnailControl.thumbnailIsVisible)
			eventManager.dispatchEvent("rightMenuSetVisible", not worldThumbnailControl.thumbnailIsVisible)

			worldUI.shouldShowThumbnail = false
		end

		if user.autoBattleCityId ~= nil then
			worldUI.autoBattleEffect(user.autoBattleCityId)
		end

		if worldUI.warOptionTable and not worldUI.warOptionTable.isClosed then
			local var_23_5 = smgr.getLayer("worldCamera")

			require("lua/layer/warOption/warOptionController")

			local var_23_6 = smgr.getLayer("generalMoveLayer")

			warOptionController.updateWarOptionLayer(var_23_5.warOptionLayer, worldUI.warOptionTable, var_23_5.cityTable, "world_building_", var_23_6)
		end

		if user.haveWorldFuBen == 2 then
			worldUI.addBtnSilkPower()

			if not user.showWorldFuBenTalk then
				roleDialogue.control.loadSpeak(1544)

				user.showWorldFuBenTalk = true
			end
		end

		worldUI.addSpecialRoad()
		worldUI.addBtnFarm()
		worldUI.addChampion(var_23_0)
		worldUI.addBtnGoHome(var_23_0)

		var_23_0.fires = var_23_0.fires or {}

		for iter_23_21, iter_23_22 in pairs(var_23_0.fires) do
			worldUI.addBtnExtinguish(iter_23_22)
		end

		var_0_0.championList = var_23_0.championList

		if var_0_0.championList then
			user.championList = {}

			for iter_23_23, iter_23_24 in pairs(var_0_0.championList) do
				worldUI.addArena(iter_23_24)
			end

			if user.seeChampionCity then
				for iter_23_25, iter_23_26 in pairs(var_0_0.championList) do
					if iter_23_26.forceId ~= user.player.forceId then
						eventManager.dispatchEvent("moveToCity", iter_23_26.cityId, true)

						break
					end
				end

				user.seeChampionCity = false
			end
		end

		if var_23_0.ycbwSideBar then
			if user.quickCastingInfo and user.quickCastingInfo.curNum and var_23_0.ycbwSideBar.curNum and user.quickCastingInfo.curNum ~= var_23_0.ycbwSideBar.curNum then
				user.castingAddNum = var_23_0.ycbwSideBar.curNum - user.quickCastingInfo.curNum
			elseif user.castingAddNum and user.castingAddNum > 0 then
				user.castingAddNum = 0
			end

			user.quickCastingInfo = var_23_0.ycbwSideBar

			eventManager.dispatchEvent("quickCastingInfo", user.quickCastingInfo)
		end

		if user.haveBetterPigCityId then
			worldUI.addCock()
			eventManager.dispatchEvent("moveToCity", user.haveBetterPigCityId)
		end

		user.buildFirstEnter = var_23_0.buildFirstEnter
		user.closeFirstEnter = var_23_0.closeFirstEnter

		if user.buildFirstEnter and user.pin < 2 and user.kbLv >= 1 then
			cmgr.sendRequest(function(arg_25_0)
				local var_25_0 = arg_25_0.action.data

				for iter_25_0, iter_25_1 in ipairs(var_25_0.cities) do
					user["repairStartCityName" .. iter_25_0] = iter_25_1.startName
					user["repairEndCityName" .. iter_25_0] = iter_25_1.endName
					user["repairStartCityId" .. iter_25_0] = iter_25_1.start
				end

				roleDialogue.control.loadSpeak("gjgs1")
				roleDialogue.control.loadSpeak("gjgs2")
				roleDialogue.control.loadSpeak("gjgs3")
			end, actions.chooseBuildCity, 0)
		end

		if user.closeFirstEnter and user.pin < 2 and user.kbLv >= 1 then
			cmgr.sendRequest(function(arg_26_0)
				local var_26_0 = arg_26_0.action.data

				for iter_26_0, iter_26_1 in ipairs(var_26_0.cities) do
					user["closeCityName" .. iter_26_0] = iter_26_1.cityName
					user["closeCityId" .. iter_26_0] = iter_26_1.cityId
				end

				roleDialogue.control.loadSpeak("gjgs4")
				roleDialogue.control.loadSpeak("gjgs5")
				roleDialogue.control.loadSpeak("gjgs6")
				roleDialogue.control.loadSpeak("gjgs7")
				roleDialogue.control.loadSpeak("gjgs8")
			end, actions.chooseBuildCity, 1)
		end

		user.buildRoadTimes = var_23_0.buildRoadTimes
		user.lockRoadTimes = var_23_0.lockRoadTimes

		if var_23_0.buildRoads then
			var_0_0.buildRoads = var_23_0.buildRoads

			for iter_23_27, iter_23_28 in ipairs(var_0_0.buildRoads) do
				if iter_23_28.state and iter_23_28.state < 2 then
					var_0_0.updateBuildRoads(iter_23_28)
				end
			end
		end

		if var_23_0.closeRoads then
			var_0_0.closeRoads = var_23_0.closeRoads

			for iter_23_29, iter_23_30 in ipairs(var_0_0.closeRoads) do
				if iter_23_30.state and iter_23_30.state < 2 then
					var_0_0.updateCloseRoads(iter_23_30)
				end
			end
		end

		if var_23_0.roadIcons then
			var_0_0.roadIcons = var_23_0.roadIcons

			if var_0_0.roadIcons then
				user.iconBuildRoads = {}
				user.iconCloseRoads = {}

				for iter_23_31, iter_23_32 in pairs(var_0_0.roadIcons) do
					if iter_23_32.type == 0 then
						table.insert(user.iconBuildRoads, iter_23_32)
					else
						table.insert(user.iconCloseRoads, iter_23_32)
					end
				end
			end

			notice.control.refreshLayer()
		end

		user.taskDecide2 = user.taskDecide2 or {}

		for iter_23_33 = #user.taskDecide2, 1, -1 do
			var_0_10(user.taskDecide2[iter_23_33])
		end
	end
end

function var_0_0.updateBuildRoads(arg_27_0)
	smgr.getLayer("worldCamera").updateBuildRoads(arg_27_0)
end

function var_0_0.removeBuildRoads(arg_28_0)
	smgr.getLayer("worldCamera").removeBuildRoads(arg_28_0)
end

function var_0_0.updateCloseRoads(arg_29_0)
	smgr.getLayer("worldCamera").updateCloseRoads(arg_29_0)
end

function var_0_0.removeCloseRoads(arg_30_0)
	smgr.getLayer("worldCamera").removeCloseRoads(arg_30_0)
end

local function var_0_14(arg_31_0)
	smgr.getLayer("worldCamera").showRoadLine(arg_31_0)
end

function var_0_0.updateWarOptionLayer(...)
	if worldUI.warOptionTable then
		function worldUI.warOptionTable.optionClosed(...)
			log.info("should remove all children of war option layer !!!!!!!!!!")

			local var_33_0 = smgr.getLayer("worldCamera")

			pcall(var_33_0.warOptionLayer.removeAllChildrenWithCleanup, var_33_0.warOptionLayer, true)
			smgr.getLayer("generalMoveLayer"):setVisible(true)

			worldUI.warOptionTable = nil
		end

		function worldUI.warOptionTable.doWarAction(arg_34_0)
			if tonumber(arg_34_0) == tonumber(worldUI.warOptionTable.cityId) then
				return
			end

			local var_34_0 = false

			if worldUI.warOptionTable.data.cityOptions and #worldUI.warOptionTable.data.cityOptions > 0 then
				for iter_34_0, iter_34_1 in pairs(worldUI.warOptionTable.data.cityOptions) do
					if tonumber(iter_34_1.cityId) == tonumber(arg_34_0) then
						var_34_0 = true
					end
				end
			end

			if var_34_0 then
				local var_34_1 = ""

				for iter_34_2, iter_34_3 in pairs(worldUI.warOptionTable.generalButtonsSelectedTable) do
					if iter_34_3 == true then
						if var_34_1 == "" then
							var_34_1 = iter_34_2
						else
							var_34_1 = var_34_1 .. "#" .. iter_34_2
						end
					end
				end

				if worldUI.warOptionTable.option == "retreat" then
					local function var_34_2(arg_35_0)
						require("lua/game/battle/widget/fightTip")
						require("lua/game/battle/uiConstant")

						local var_35_0 = smgr.getLayer("pushLayer")

						showWarOptionTip(var_35_0, tipType.cheTuiSucc, arg_35_0.action.data)
						worldUI.warOptionTable.optionClosed()
					end

					cmgr.sendRequest(var_34_2, actions.quitBattle, worldUI.warOptionTable.battleId, var_34_1, arg_34_0)
				elseif worldUI.warOptionTable.option == "forward" then
					local function var_34_3(arg_36_0)
						require("lua/game/battle/widget/fightTip")
						require("lua/game/battle/uiConstant")

						local var_36_0 = smgr.getLayer("pushLayer")

						worldUI.warOptionTable.optionClosed()
						showWarOptionTip(var_36_0, tipType.tujinSucc, arg_36_0.action.data)

						if arg_36_0.action.data.battleId then
							smgr.changeScene(SCENE_BATTLE, arg_36_0.action.data.battleType, {
								battleId = arg_36_0.action.data.battleId
							})
						end
					end

					cmgr.sendRequest(var_34_3, actions.tujin, var_34_1, worldUI.warOptionTable.battleId, arg_34_0)
				end
			end
		end
	end

	if worldUI.warOptionTable then
		local var_32_0 = smgr.getLayer("worldCamera")

		pcall(var_32_0.warOptionLayer.removeAllChildrenWithCleanup, var_32_0.warOptionLayer, true)

		local var_32_1, var_32_2 = var_32_0.cityTable["world_building_" .. worldUI.warOptionTable.cityId].sprite:getPosition()
		local var_32_3 = {}

		autoUI.createUI(var_32_0.warOptionLayer, getWarOptionLayerData(worldUI.warOptionTable), var_32_3)
		smgr.getLayer("generalMoveLayer"):setVisible(false)
		var_32_3.warOptionBackground:setPosition(ccp(var_32_1, var_32_2))

		worldUI.warOptionTable.generalButtonsSelectedTable = {}

		for iter_32_0, iter_32_1 in pairs(worldUI.warOptionTable.data.gIds) do
			worldUI.warOptionTable.generalButtonsSelectedTable[iter_32_1.gId] = true

			var_32_3["generalPicHightlight" .. iter_32_1.gId]:setVisible(true)
			var_32_3["generalButton" .. iter_32_1.gId]:registerScriptTapHandler(function(arg_37_0)
				worldUI.warOptionTable.generalButtonsSelectedTable[iter_32_1.gId] = not worldUI.warOptionTable.generalButtonsSelectedTable[iter_32_1.gId]

				if worldUI.warOptionTable.generalButtonsSelectedTable[iter_32_1.gId] then
					var_32_3["generalPicHightlight" .. iter_32_1.gId]:setVisible(true)
				else
					var_32_3["generalPicHightlight" .. iter_32_1.gId]:setVisible(false)
				end
			end)
		end

		if worldUI.warOptionTable.data.cityOptions then
			for iter_32_2, iter_32_3 in pairs(worldUI.warOptionTable.data.cityOptions) do
				local var_32_4 = false

				showTable(iter_32_3)

				if worldUI.warOptionTable.option == "retreat" then
					if tonumber(iter_32_3.state) == 1 then
						var_32_4 = true

						local var_32_5 = 15
						local var_32_6
						local var_32_7
						local var_32_8 = CCMoveBy:create(0.3, ccp(0, var_32_5))
						local var_32_9 = CCMoveBy:create(0.3, ccp(0, -var_32_5))
						local var_32_10 = CCArray:create()

						var_32_10:addObject(var_32_8)
						var_32_10:addObject(var_32_9)

						local var_32_11 = CCSequence:create(var_32_10)
						local var_32_12 = CCRepeatForever:create(tolua.cast(var_32_11, "CCActionInterval"))
						local var_32_13 = CCSprite:create("res/ui/world/curl_arrow.png")
						local var_32_14, var_32_15 = var_32_0.cityTable["world_building_" .. iter_32_3.cityId].sprite:getPosition()

						var_32_0.warOptionLayer:addChild(var_32_13)
						var_32_13:runAction(var_32_12)
						var_32_13:setPosition(ccp(var_32_14, var_32_15))
					end
				elseif worldUI.warOptionTable.option == "forward" and tonumber(iter_32_3.state) == 1 then
					var_32_4 = true

					local var_32_16 = rmgr.getAnimation("swordEffect")
					local var_32_17 = CCAnimation:createWithSpriteFrames(var_32_16, 0.08)
					local var_32_18 = CCAnimate:create(var_32_17)
					local var_32_19 = CCRepeatForever:create(var_32_18)
					local var_32_20 = CCSprite:create()
					local var_32_21, var_32_22 = var_32_0.cityTable["world_building_" .. iter_32_3.cityId].sprite:getPosition()

					var_32_0.warOptionLayer:addChild(var_32_20)
					var_32_20:setPosition(ccp(var_32_21, var_32_22))
					var_32_20:runAction(var_32_19)
				end

				if var_32_4 then
					log.info("should draw lines between : ", worldUI.warOptionTable.cityId, iter_32_3.cityId)
					traceData.drawLineBetweenTwoCity(tonumber(worldUI.warOptionTable.cityId), tonumber(iter_32_3.cityId))
				end
			end
		end
	end
end

function var_0_0.enterWorldScene()
	local function var_38_0(arg_39_0)
		var_0_0.arrowTowerStaticInfo = {}

		if arg_39_0.action.state == 1 then
			local var_39_0 = arg_39_0.action.data.arrowTowers

			for iter_39_0, iter_39_1 in ipairs(var_39_0) do
				var_0_0.arrowTowerStaticInfo[iter_39_1.cityId] = iter_39_1
			end
		end

		cmgr.sendRequest(var_0_13, actions.enterWorldScene)

		if user.inbstask and user.inbstask == true then
			log.info("围城进行中")

			local function var_39_1(arg_40_0)
				if arg_40_0.action.data then
					worldUI.addweichengTask(arg_40_0.action.data)
				end
			end

			cmgr.sendRequest(var_39_1, actions.getSpecialSInfo)
		end
	end

	cmgr.sendRequest(var_38_0, actions.getArrowTowerStaticInfo)
end

local function var_0_15(arg_41_0)
	if var_0_0.leftTime then
		var_0_0.leftTime = var_0_0.leftTime - arg_41_0 * 1000
	end

	if var_0_0.stratagem ~= nil then
		if var_0_0.stratagem[1] ~= nil and var_0_0.stratagem[1].cd ~= nil then
			var_0_0.stratagem[1].cd = var_0_0.stratagem[1].cd - arg_41_0 * 1000
		end

		if var_0_0.stratagem[2] ~= nil and var_0_0.stratagem[2].cd ~= nil then
			var_0_0.stratagem[2].cd = var_0_0.stratagem[2].cd - arg_41_0 * 1000
		end
	end
end

local function var_0_16(arg_42_0)
	log.info("@@@@ 箭塔推送消息")
	worldUI.addTower(arg_42_0.action.data.tower)
end

local function var_0_17(arg_43_0)
	if loadingLayer.visible then
		return
	end

	if arg_43_0.action.data.cnpInfo then
		if arg_43_0.action.data.cityNum then
			var_0_0.cityNum = arg_43_0.action.data.cityNum
		end

		if arg_43_0.action.data.CNP then
			var_0_0.CNP = arg_43_0.action.data.CNP
		end
	end

	if arg_43_0.action.data.refresh then
		log.info("刷新世界了")

		if arg_43_0.action.data.refresh.mask == true then
			local var_43_0 = smgr.getLayer("worldCamera")

			for iter_43_0, iter_43_1 in pairs(var_43_0.cityTable) do
				if iter_43_1.prop then
					local var_43_1 = var_43_0.surroundTable["cityId_" .. iter_43_1.prop[1]]

					if var_43_1 then
						pcall(var_43_1.sprite.removeFromParentAndCleanup, var_43_1.sprite, true)

						var_43_0.surroundTable["cityId_" .. iter_43_1.prop[1]] = nil
					end

					local var_43_2 = var_43_0.worldFireTable["cityId_" .. iter_43_1.prop[1]]

					if var_43_2 then
						pcall(var_43_2.sprite.removeFromParentAndCleanup, var_43_2.sprite, true)

						var_43_0.worldFireTable["cityId_" .. iter_43_1.prop[1]] = nil
					end

					local var_43_3 = var_43_0.cityTable["world_building_" .. iter_43_1.prop[1]].flagSprite

					if var_43_3 then
						pcall(var_43_3.removeFromParentAndCleanup, var_43_3, true)
					end

					local var_43_4 = var_43_0.cityTable["world_building_" .. iter_43_1.prop[1]].fogSprite

					if var_43_4 then
						pcall(var_43_4.removeFromParentAndCleanup, var_43_4, true)
					end

					local var_43_5 = var_43_0.cityTable["world_building_" .. iter_43_1.prop[1]].attackSprite

					if var_43_5 then
						pcall(var_43_5.removeFromParentAndCleanup, var_43_5, true)
					end

					local var_43_6 = var_43_0.cityTable["world_building_" .. iter_43_1.prop[1]].progressBg

					if var_43_6 then
						pcall(var_43_6.removeFromParentAndCleanup, var_43_6, true)
					end
				end
			end

			var_0_0.memoryLocaition = var_43_0.scrollLayer:getContentOffset()

			var_0_0.enterWorldScene()
		end
	end

	if arg_43_0.action.data.sdManzuAttachedTaskInfo then
		local var_43_7 = arg_43_0.action.data.sdManzuAttachedTaskInfo

		if var_43_7.myStoneNum then
			if var_0_0.sdManzuAttachedTaskInfo[user.player.forceId].status == 1 then
				var_0_0.sdManzuAttachedTaskInfo[user.player.forceId].myStoneNum = var_43_7.myStoneNum

				worldUI.updateManzuTaskStone(user.player.forceId)
			end
		elseif var_43_7.forceId then
			var_0_0.sdManzuAttachedTaskInfo = var_0_0.sdManzuAttachedTaskInfo or {}
			var_0_0.sdManzuAttachedTaskInfo[var_43_7.forceId] = var_0_0.sdManzuAttachedTaskInfo[var_43_7.forceId] or {}

			for iter_43_2, iter_43_3 in pairs(var_43_7) do
				var_0_0.sdManzuAttachedTaskInfo[var_43_7.forceId][iter_43_2] = iter_43_3
			end

			worldUI.updateManzuTaskStone(var_43_7.forceId, var_43_7.status ~= nil)
		end
	end

	if arg_43_0.action.data.worldBuild then
		local var_43_8 = arg_43_0.action.data.worldBuild

		if var_43_8.buildRoads then
			var_0_0.buildRoads = var_0_0.buildRoads or {}

			for iter_43_4, iter_43_5 in pairs(var_43_8.buildRoads) do
				local var_43_9 = false

				iter_43_5.cityId = iter_43_5.cityId or iter_43_5.start

				for iter_43_6, iter_43_7 in ipairs(var_0_0.buildRoads) do
					iter_43_7.cityId = iter_43_7.cityId or iter_43_7.start

					if iter_43_7.cityId == iter_43_5.cityId then
						var_43_9 = true
						iter_43_7 = iter_43_5

						if iter_43_7.state and iter_43_7.state < 2 then
							var_0_0.updateBuildRoads(iter_43_5)
						else
							var_0_0.removeBuildRoads(iter_43_5)
						end
					end
				end

				if not var_43_9 then
					table.insert(var_0_0.buildRoads, iter_43_5)
					var_0_0.updateBuildRoads(iter_43_5)
				end
			end
		end

		if var_43_8.closeRoads then
			var_0_0.closeRoads = var_0_0.closeRoads or {}

			for iter_43_8, iter_43_9 in pairs(var_43_8.closeRoads) do
				local var_43_10 = false

				for iter_43_10, iter_43_11 in ipairs(var_0_0.closeRoads) do
					if iter_43_11.cityId == iter_43_9.cityId then
						var_43_10 = true
						iter_43_11 = iter_43_9

						if iter_43_11.state and iter_43_11.state < 2 then
							var_0_0.updateCloseRoads(iter_43_9)
						else
							var_0_0.removeCloseRoads(iter_43_9)
						end
					end
				end

				if not var_43_10 then
					table.insert(var_0_0.closeRoads, iter_43_9)
					var_0_0.updateCloseRoads(iter_43_9)
				end
			end
		end
	end

	if arg_43_0.action.data.buildIcon then
		local var_43_11 = arg_43_0.action.data.buildIcon

		if var_43_11 then
			user.iconBuildRoads = user.iconBuildRoads or {}
			user.iconCloseRoads = user.iconCloseRoads or {}

			for iter_43_12, iter_43_13 in pairs(var_43_11) do
				if iter_43_13.type == 0 then
					if iter_43_13.state >= 2 then
						for iter_43_14 = #user.iconBuildRoads, 1 do
							if user.iconBuildRoads[iter_43_14].cityId == iter_43_13.cityId then
								table.remove(user.iconBuildRoads, iter_43_14)
							end
						end
					else
						local var_43_12 = false

						for iter_43_15 = #user.iconBuildRoads, 1 do
							local var_43_13 = user.iconBuildRoads[iter_43_15]

							if var_43_13 and var_43_13.cityId == iter_43_13.cityId then
								var_43_12 = true
								iter_43_13 = var_43_13
							end
						end

						if not var_43_12 then
							table.insert(user.iconBuildRoads, iter_43_13)
						end
					end
				elseif iter_43_13.state >= 2 then
					for iter_43_16 = #user.iconCloseRoads, 1 do
						if user.iconCloseRoads[iter_43_16].cityId == iter_43_13.cityId then
							table.remove(user.iconCloseRoads, iter_43_16)
						end
					end
				else
					local var_43_14 = false

					for iter_43_17 = #user.iconCloseRoads, 1 do
						local var_43_15 = user.iconCloseRoads[iter_43_17]

						if var_43_15 and var_43_15.cityId == iter_43_13.cityId then
							var_43_14 = true
							iter_43_13 = var_43_15
						end
					end

					if not var_43_14 then
						table.insert(user.iconCloseRoads, iter_43_13)
					end
				end
			end
		end

		notice.control.refreshLayer()
	end
end

local function var_0_18(arg_44_0)
	if arg_44_0.action.data.fadong_info.type == 2 then
		log.info("@@@ show team battle effect ")

		local var_44_0 = smgr.getLayer("effectlayer")
		local var_44_1 = CCSprite:create("res/ui/world/smmz_fli_enter.png")

		var_44_1:setPosition(ccp(visibleSize.width + var_44_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
		var_44_0:addChild(var_44_1)

		local var_44_2 = CCSprite:create("res/ui/world/smmz_fli_enter_tit.png")

		var_44_2:setPosition(ccp(var_44_1:getContentSize().width * 0.5, var_44_1:getContentSize().height * 1.2))
		var_44_1:addChild(var_44_2)

		local function var_44_3()
			var_44_0:removeChild(var_44_1, true)
		end

		local var_44_4 = rmgr.getSpeedEffectAnimation()
		local var_44_5 = CCAnimation:createWithSpriteFrames(var_44_4, 0.08)
		local var_44_6 = CCAnimate:create(var_44_5)
		local var_44_7 = CCRepeatForever:create(var_44_6)
		local var_44_8 = CCSprite:create()

		var_44_8:runAction(var_44_7)
		var_44_8:setPosition(ccp(var_44_1:getContentSize().width * 0.5, var_44_1:getContentSize().height * 0.5))
		var_44_1:addChild(var_44_8)

		local var_44_9 = CCArray:create()

		var_44_9:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
		var_44_9:addObject(CCDelayTime:create(2))
		var_44_9:addObject(CCMoveTo:create(0.5, ccp(0 - var_44_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
		var_44_9:addObject(CCCallFuncN:create(var_44_3))

		local var_44_10 = CCSequence:create(var_44_9)

		var_44_1:runAction(var_44_10)
	end
end

local function var_0_19(arg_46_0)
	if loadingLayer.visible then
		return
	end

	local var_46_0 = arg_46_0.action.data

	if var_46_0.cities and var_46_0.cities.cities then
		for iter_46_0, iter_46_1 in pairs(var_46_0.cities.cities) do
			eventManager.dispatchEvent("changeCityState", iter_46_1)
		end
	end

	if var_46_0.expandState then
		user.expandState = var_46_0.expandState.state == 0

		worldUI.updateExpandState()
	end

	if var_46_0.chain then
		local var_46_1 = var_46_0.chain

		if var_46_1.state == nil then
			var_46_1.state = 0
		end

		smgr.getLayer("worldCamera").lockCityInfo(var_46_1)

		if var_0_0.lockCitiesInfo then
			if var_46_1.state == 1 then
				table.insert(var_0_0.lockCitiesInfo, var_46_1)
			elseif var_46_1.state == 2 then
				local var_46_2 = 0
				local var_46_3 = 0

				for iter_46_2, iter_46_3 in pairs(var_0_0.lockCitiesInfo) do
					var_46_2 = var_46_2 + 1

					if iter_46_3.fromCityId == var_46_1.fromCityId then
						var_46_3 = var_46_2

						break
					end
				end

				if var_46_3 > 0 then
					table.remove(var_0_0.lockCitiesInfo, var_46_3)
				end
			end
		end
	end

	if var_46_0.invade and var_46_0.invade.invade then
		for iter_46_4, iter_46_5 in pairs(var_46_0.invade.invade) do
			worldUI.addSougua(iter_46_5)
		end
	end

	if arg_46_0.action.data.slaughter then
		worldUI.addTucheng(var_46_0.slaughter)
	end

	if var_46_0.cities and var_46_0.cities.ysCityId then
		var_0_0.ysCityId = var_46_0.cities.ysCityId

		log.info("袁绍事件开始")
		roleDialogue.control.loadSpeak(1802)
		require("lua/layer/world/yuanshaoEvent")
		yuanshaoEvent.showYuanshao()

		local var_46_4 = {
			yuanshaoCityId = var_46_0.cities.ysCityId
		}

		eventManager.dispatchEvent("changeCityState", var_46_4)
	end

	if var_46_0.cities and var_46_0.cities.winYsForceId then
		showTable(arg_46_0.action.data)
		log.info("袁绍事件结束", var_46_0.cities.winYsForceId)

		if user.player.forceId == var_46_0.cities.winYsForceId then
			roleDialogue.control.loadSpeak(1800)
		else
			roleDialogue.control.loadSpeak(1801)
		end
	end

	if var_46_0.attmov then
		local var_46_5 = var_46_0.attmov

		if var_46_5.path ~= nil and var_46_5.atOnce == false then
			local var_46_6 = {}

			for iter_46_6, iter_46_7 in ipairs(var_46_5.path) do
				var_46_6[iter_46_6] = tonumber(iter_46_7.cityId)
			end

			if smgr.getLayer("generalMoveLayer") ~= nil then
				traceData.createTrace(var_46_5.generalId, var_46_6)
			end
		end

		eventManager.dispatchEvent("generalMoveFromTo", var_46_5.generalId, var_46_5.orgCityId, var_46_5.curCityId, var_46_5.cd, var_46_5.atOnce)

		if arg_46_0.action.data.attmov.curReward then
			local var_46_7 = var_46_0.attmov.orgCityId
			local var_46_8 = var_46_0.attmov.curCityId

			if var_46_8 < var_46_7 then
				var_46_7, var_46_8 = var_46_8, var_46_7
			end

			local var_46_9 = worldConstant.KET_TO_BOX["key_" .. var_46_7 .. "_" .. var_46_8]

			if not var_46_9 then
				log.warn("city[%s-%s]not found boxId", var_46_7, var_46_8)

				return
			end

			eventManager.dispatchEvent("openBox", var_46_9, var_46_0.attmov.curReward, var_46_0.attmov.cd)
		end
	end

	if var_46_0.castlemove then
		local var_46_10 = var_46_0.castlemove
		local var_46_11 = 0

		if var_46_10.path ~= nil and var_46_10.direct == false then
			local var_46_12 = {}

			for iter_46_8, iter_46_9 in ipairs(var_46_10.path) do
				var_46_12[iter_46_8] = tonumber(iter_46_9.cityId)
				var_46_11 = var_46_11 + 1
			end

			if smgr.getLayer("generalMoveLayer") ~= nil then
				traceData.createTrace(var_46_10.vId, var_46_12)
			end
		end

		if var_46_10.orgCityId ~= var_46_10.curCityId then
			eventManager.dispatchEvent("gongjiangMoveFromTo", var_46_10.vId, var_46_10.orgCityId, var_46_10.curCityId, var_46_10.cd, var_46_10.direct)
		end

		eventManager.dispatchEvent("gongjiangInfoChange", var_46_10.vId, var_46_10.state, var_46_10.curCityId)
	end

	if var_46_0.cities and var_46_0.cities.type then
		worldUI.addTrickState(var_46_0.cities)
	end

	local var_46_13 = var_46_0.cities

	if var_46_13 and var_46_13.worldnpcinfo and var_46_13.worldnpcinfo.specialNpc then
		var_0_0.specialNpc = var_46_13.worldnpcinfo.specialNpc

		worldUI.addSpecialNpc(var_0_0.specialNpc)
	end

	if var_46_0.fire then
		worldUI.addBtnExtinguish(var_46_0.fire)
	end
end

local function var_0_20(arg_47_0)
	if loadingLayer.visible then
		return
	end

	local var_47_0 = arg_47_0.action.data
	local var_47_1

	if var_47_0.barleague and (not var_47_0.barleague.newInitForceId or not (var_47_0.barleague.newInitForceId > 0) or var_47_0.barleague.newInitForceId ~= user.player.forceId or true) then
		if var_47_0.barleague.mood then
			if var_0_0.headhunterStateList then
				var_0_0.lastHeadhunterStateList = clone(var_0_0.headhunterStateList)
			end

			for iter_47_0, iter_47_1 in pairs(var_47_0.barleague.mood) do
				if var_0_0.lastHeadhunterStateList then
					for iter_47_2, iter_47_3 in ipairs(var_0_0.lastHeadhunterStateList) do
						print(iter_47_2, iter_47_1)

						if iter_47_1.cityId == iter_47_3.cityId then
							table.remove(var_0_0.lastHeadhunterStateList, iter_47_2)
						end
					end
				end
			end

			var_47_1 = var_47_0.barleague.mood
			var_0_0.headhunterStateList = var_47_1

			worldUI.clearHeadHunterTable(0)
			worldUI.addHeadHunter(var_0_0.headhunterStateList, 0)
		end

		if var_47_0.barleague.overCityId then
			var_0_0.overCityId = var_47_0.barleague.overCityId
		end

		if var_47_0.barleague.league then
			if var_0_0.headhunterStateList then
				var_0_0.lastHeadhunterStateList = clone(var_0_0.headhunterStateList)
			end

			for iter_47_4, iter_47_5 in ipairs(var_47_0.barleague.league) do
				iter_47_5.isMainCity = false

				if var_0_0.lastHeadhunterStateList then
					for iter_47_6, iter_47_7 in ipairs(var_0_0.lastHeadhunterStateList) do
						if iter_47_5.cityId == iter_47_7.cityId then
							table.remove(var_0_0.lastHeadhunterStateList, iter_47_6)
						end
					end
				end

				if iter_47_5.leagueNew then
					if iter_47_5.supportForceId == user.player.forceId then
						user.player.headhunterVO = iter_47_5
						user.player.showFriendHeadhunter = true

						notice.control.refreshLayer()
					else
						user.player.headhunterVO = iter_47_5
						user.player.showHostileHeadhunter = true

						notice.control.refreshLayer()
					end
				end
			end

			var_47_1 = var_47_0.barleague.league

			worldUI.clearHeadHunterTable(1)
			worldUI.addHeadHunter(var_47_1, 1)
		end

		if var_0_0.overCityId and var_0_0.lastHeadhunterList then
			for iter_47_8 = 1, #var_0_0.overCityId do
				for iter_47_9, iter_47_10 in pairs(var_0_0.lastHeadhunterList) do
					if iter_47_9 == var_0_0.overCityId[iter_47_8] then
						iter_47_10.overByTask = true
					end
				end
			end

			var_0_0.overCityId = nil
		end

		var_0_0.headhunterList = var_47_1

		worldUI.addHeadHunter(var_47_1, 2, lastHeadhunterList)
	end
end

local function var_0_21(arg_48_0)
	if loadingLayer.visible then
		return
	end

	if arg_48_0.action.data.worldKill then
		eventManager.dispatchEvent("changeWorldKill", arg_48_0.action.data.worldKill)
	end
end

local function var_0_22(arg_49_0)
	if loadingLayer.visible then
		return
	end

	if arg_49_0.action.data.worldReward then
		local var_49_0 = os.time()

		if var_49_0 - var_0_1 > 1 then
			var_0_1 = var_49_0

			eventManager.dispatchEvent("worldRewardChange", arg_49_0.action.data.worldReward)
		end
	end
end

local function var_0_23(arg_50_0)
	if arg_50_0.action.data.trickInfo ~= nil and arg_50_0.action.data.trickInfo.isTrapvalid ~= nil then
		if arg_50_0.action.data.trickInfo.isTrapvalid == true then
			local var_50_0 = arg_50_0.action.data.trickInfo.forceReduce or 0
			local var_50_1 = CCSprite:create("res/ui/world/operateIcon/city_imp_xianjing_zhongji.png")
			local var_50_2 = CCLabelAtlas:create(tostring(var_50_0), "res/ui/world/operateIcon/city_imp_numb_red.png", 20, 38, 48)

			var_50_2:setAnchorPoint(ccp(0.5, 0.5))

			local var_50_3 = createRichNode({
				var_50_1,
				var_50_2
			})
			local var_50_4 = var_50_1:getContentSize().width
			local var_50_5 = var_50_2:getContentSize().width
			local var_50_6 = ccp(visibleSize.width / 2 - (var_50_4 + var_50_5) / 2, visibleSize.height / 2 - 30)

			smgr.showTipFloatYSprite(var_50_3, 60, var_50_6, nil, 1, 1)
		else
			local var_50_7 = CCSprite:create("res/ui/world/operateIcon/city_imp_xjwx.png")
			local var_50_8 = ccp(visibleSize.width / 2, visibleSize.height / 2 - 30)

			smgr.showTipFloatYSprite(var_50_7, 60, var_50_8, nil, 1, 1)
		end
	end
end

local function var_0_24(arg_51_0)
	var_0_0.stratagem = arg_51_0
end

local function var_0_25()
	log.info("leave world ok")

	smgr.getLayer("worldCamera").cityTable = {}
	worldUI.mapTable = nil
end

local function var_0_26(arg_53_0)
	if loadingLayer.visible then
		return
	end

	local var_53_0 = arg_53_0.action.data.cityEventInfo

	if var_53_0 then
		worldUI.addCityEvent(var_53_0)
	end
end

local function var_0_27(arg_54_0)
	if isExpUpdate(arg_54_0) then
		return
	end

	if loadingLayer.visible then
		return
	end

	local var_54_0 = arg_54_0.action.data.playerEventInfo.playerEvents

	for iter_54_0, iter_54_1 in pairs(var_54_0) do
		worldUI.addPlayerEvent(iter_54_1)
	end
end

local function var_0_28(arg_55_0)
	if loadingLayer.visible then
		return
	end

	local var_55_0 = arg_55_0.action.data.forceEventInfo

	worldUI.addForceEvent(var_55_0)
end

local function var_0_29(arg_56_0)
	if loadingLayer.visible then
		return
	end

	local var_56_0 = arg_56_0.action.data.city

	worldUI.addNewManzu(var_56_0)
end

local function var_0_30(arg_57_0)
	if loadingLayer.visible then
		return
	end

	local var_57_0 = arg_57_0.action.data.hjcity

	worldUI.addNewHuangjin(var_57_0)
end

local function var_0_31(arg_58_0)
	showTable(arg_58_0)

	if loadingLayer.visible then
		return
	end

	local var_58_0 = arg_58_0.action.data.granary

	if var_58_0 then
		worldUI.addJunliangku(var_58_0)
	end

	local var_58_1 = arg_58_0.action.data.help

	if var_58_1 then
		local var_58_2 = smgr.getLayer("tipLayer")

		if var_58_2 then
			local var_58_3 = CCSprite:create("res/ui/battle/battle_tip_background.png")

			var_58_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_58_2:addChild(var_58_3)

			local function var_58_4()
				var_58_2:removeChild(var_58_3, true)
			end

			local var_58_5 = CCStrokeLabelTTF:create(language.get("223103_junliangku", worldConstant.BUILDING_INFO["world_building_" .. var_58_1.nationCityId].name, var_58_1.num, var_58_1.granaryName), "Thonburi-Bold", 32)
			local var_58_6 = 200

			if var_58_5 then
				var_58_5:setPosition(ccp(var_58_3:getContentSize().width * 0.5 + var_58_6, var_58_3:getContentSize().height * 0.5))
				var_58_3:addChild(var_58_5)

				local var_58_7 = CCArray:create()

				var_58_7:addObject(CCFadeIn:create(0.06))
				var_58_7:addObject(CCMoveBy:create(0.3, ccp(-var_58_6, 0)))
				var_58_7:addObject(CCDelayTime:create(3))
				var_58_7:addObject(CCMoveBy:create(0.3, ccp(-var_58_6, 0)))
				var_58_7:addObject(CCFadeOut:create(0.06))
				var_58_7:addObject(CCCallFuncN:create(var_58_4))

				local var_58_8 = CCSequence:create(var_58_7)

				var_58_5:runAction(CCSequence:create(var_58_7))
			end
		end
	end
end

local function var_0_32(arg_60_0)
	local var_60_0 = arg_60_0.action.data

	if var_60_0.corpsAction and var_60_0.corpsAction.forceId then
		user.corpsAction[var_60_0.corpsAction.forceId] = var_60_0.corpsAction

		local var_60_1 = var_60_0.corpsAction
		local var_60_2 = 0

		if var_60_1.path ~= nil then
			local var_60_3 = {}

			for iter_60_0, iter_60_1 in ipairs(var_60_1.path) do
				var_60_3[iter_60_0] = tonumber(iter_60_1.cityId)
				var_60_2 = var_60_2 + 1
			end

			if smgr.getLayer("generalMoveLayer") ~= nil then
				traceData.createTrace(var_60_1.corpsId, var_60_3)

				var_60_1.path = nil
			end
		end

		if var_60_1.orgCityId ~= var_60_1.curCityId and var_60_2 > 0 then
			eventManager.dispatchEvent("juntuanMoveFromTo", var_60_1.corpsId, var_60_1.orgCityId, var_60_1.curCityId, var_60_1.cd, false)
		end

		eventManager.dispatchEvent("juntuanFlag", var_60_1.forceId, var_60_1.curCityId)
	end

	if var_60_0.corpsInfo and var_60_0.corpsInfo.forceId then
		user.corpsInfo[var_60_0.corpsInfo.forceId] = var_60_0.corpsInfo

		log.info("军团改变")
		showTable(var_60_0.corpsInfo)
		eventManager.dispatchEvent("juntuanRefresh")
		eventManager.dispatchEvent("refreshJuntuan")
		eventManager.dispatchEvent("juntuanFlag", var_60_0.corpsInfo.forceId, var_60_0.corpsInfo.locationId)
	end

	if type(var_60_0.state) == "number" then
		eventManager.dispatchEvent("juntuanRefresh")
		eventManager.dispatchEvent("refreshJuntuan")
	elseif var_60_0.state and var_60_0.state.corpsState then
		user.corpsState = var_60_0.state.corpsState

		eventManager.dispatchEvent("juntuanRefresh")
	end

	if var_60_0.corpsNum then
		user.corpsNum = var_60_0.corpsNum

		eventManager.dispatchEvent("juntuanNumChange")
	end
end

local function var_0_33(arg_61_0)
	local var_61_0 = arg_61_0.action.data

	if var_61_0.ycbw and var_61_0.ycbw.ycbwSideBar then
		if user.quickCastingInfo and user.quickCastingInfo.curNum and var_61_0.ycbw.ycbwSideBar.curNum and user.quickCastingInfo.curNum ~= var_61_0.ycbw.ycbwSideBar.curNum then
			user.castingAddNum = var_61_0.ycbw.ycbwSideBar.curNum - user.quickCastingInfo.curNum
		elseif user.castingAddNum and user.castingAddNum > 0 then
			user.castingAddNum = 0
		end

		user.quickCastingInfo = var_61_0.ycbw.ycbwSideBar

		eventManager.dispatchEvent("quickCastingInfo", user.quickCastingInfo)
	end
end

function var_0_0.monsterTaskUpdate(arg_62_0, arg_62_1)
	local var_62_0 = smgr.getLayer("worldCamera")

	user.inActivity = arg_62_0.inActivity

	var_62_0.updateMonster(arg_62_0, arg_62_1)
end

local function var_0_34(arg_63_0)
	local var_63_0 = arg_63_0.action.data.taskMessage
	local var_63_1
	local var_63_2

	for iter_63_0, iter_63_1 in pairs(var_0_0.curNationTask.tasks) do
		var_63_1 = iter_63_1.taskType
		var_63_2 = iter_63_1.serial
	end

	if var_63_1 == 9 and var_63_0.action then
		local var_63_3 = var_63_0.action.recover + 1
		local var_63_4 = smgr.getLayer("worldCamera")

		log.info(var_63_2, var_63_3)

		if var_63_2 == 1 then
			if var_63_3 > 3 or var_63_3 < 1 then
				return
			end
		elseif var_63_3 > 8 or var_63_3 < 6 then
			return
		end

		if var_63_2 > 2 then
			var_63_2 = 2
		end

		local var_63_5 = {
			{
				{
					pic = "res/ui/nationTask/thief/tmzj_city_reco_wc.png",
					cityId = 135
				},
				{
					pic = "res/ui/nationTask/thief/tmzj_city_reco_jl.png",
					cityId = 103
				},
				{
					pic = "res/ui/nationTask/thief/tmzj_city_reco_jx.png",
					cityId = 139
				}
			},
			{
				{
					1
				},
				{
					2
				},
				{
					3
				},
				{
					4
				},
				{
					5
				},
				{
					pic = "res/ui/nationTask/thief/tmzj_city_reco_chlj.png"
				},
				{
					pic = "res/ui/nationTask/thief/tmzj_city_reco_chcl.png"
				},
				{
					pic = "res/ui/nationTask/thief/tmzj_city_reco_chbd.png"
				}
			}
		}

		log.info(tool.tableToJson(arg_63_0))

		if var_63_2 == 1 then
			local var_63_6 = var_63_5[var_63_2][var_63_3].cityId
			local var_63_7 = var_63_4.chainTable[var_63_6]

			log.info("chain", var_63_7)

			if var_63_7 and not tolua.isnull(var_63_7) then
				var_63_7:removeFromParentAndCleanup(true)

				var_63_4.chainTable[var_63_6] = nil
			end
		end

		log.info(var_63_2, var_63_3)

		local var_63_8 = var_63_5[var_63_2][var_63_3].pic
		local var_63_9 = CCSprite:create("res/ui/nationTask/thief/tmzj_city_bg.png")
		local var_63_10 = CCSprite:create(var_63_8)

		var_63_10:setPosition(ccp(var_63_9:getContentSize().width / 2, var_63_9:getContentSize().height / 2))
		var_63_9:addChild(var_63_10)
		var_63_9:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		smgr.getLayer("pushLayer"):addChild(var_63_9)

		local var_63_11 = CCArray:create()

		var_63_11:addObject(CCFadeIn:create(0.5))
		var_63_11:addObject(CCDelayTime:create(2))
		var_63_11:addObject(CCFadeOut:create(0.5))
		var_63_11:addObject(CCCallFunc:create(function()
			var_63_9:removeFromParentAndCleanup(true)
		end))

		local var_63_12 = CCArray:create()

		var_63_12:addObject(CCFadeIn:create(0.5))
		var_63_12:addObject(CCDelayTime:create(2))
		var_63_12:addObject(CCFadeOut:create(0.5))
		var_63_9:runAction(CCSequence:create(var_63_11))
		var_63_10:runAction(CCSequence:create(var_63_12))
	end

	if var_63_0.taskType == 1 and var_63_0.isReverseThird == true and var_63_0.pages and var_0_0.curNationTask and var_0_0.curNationTask.tasks and worldUI.nationTaskTable["idx_" .. var_0_0.curNationTask.tasks[var_63_0.pages].target] then
		worldUI.nationTaskTable["idx_" .. var_0_0.curNationTask.tasks[var_63_0.pages].target]:removeFromParentAndCleanup(true)
	end
end

local function var_0_35(arg_65_0)
	if arg_65_0.action.data.workerInfo then
		eventManager.dispatchEvent("updateWorker", arg_65_0.action.data.workerInfo)
	end

	local var_65_0 = user.curNationTask.tasks[1]

	if not var_65_0 then
		return
	end

	if arg_65_0.action.data.simpleMessage then
		local var_65_1 = arg_65_0.action.data.simpleMessage.tasks

		if var_65_1 then
			for iter_65_0, iter_65_1 in pairs(var_65_1) do
				if iter_65_1.taskType == 1 or iter_65_1.taskType == 13 then
					worldUI.addNationTask(iter_65_1)
				elseif iter_65_1.taskType == 14 then
					worldUI.addNationTaskNewInvest(iter_65_1)
				elseif iter_65_1.taskType == 18 then
					var_0_0.monsterTaskUpdate(iter_65_1, true)
				end
			end

			var_0_0.nationNpcUpdate(var_65_1)
		end
	end

	if arg_65_0.action.data.miracleInfo then
		local var_65_2 = arg_65_0.action.data.miracleInfo.miracle
		local var_65_3

		if worldControl and worldControl.forcePct then
			if worldControl.forcePct[user.player.forceId] then
				var_65_3 = worldControl.forcePct[user.player.forceId].info
			end

			for iter_65_2, iter_65_3 in ipairs(var_65_2) do
				if var_65_0.taskType == 12 and iter_65_3.soil > 100 and iter_65_3.stone > 100 and iter_65_3.lumber > 100 then
					-- block empty
				else
					if worldControl.forcePct and worldControl.forcePct[iter_65_3.forceId].progress and not tolua.isnull(worldControl.forcePct[iter_65_3.forceId].progress) then
						worldControl.forcePct[iter_65_3.forceId].progress:setPercentage(iter_65_3.totalPct)
					end

					if worldControl.forcePct and worldControl.forcePct[iter_65_3.forceId].label and not tolua.isnull(worldControl.forcePct[iter_65_3.forceId].label) then
						worldControl.forcePct[iter_65_3.forceId].label:setString(iter_65_3.totalPct .. "%")
					end

					worldControl.forcePct[iter_65_3.forceId].info = iter_65_3
				end
			end

			if var_65_0.taskType == 12 and var_65_3 then
				local var_65_4 = worldControl.forcePct[user.player.forceId].info
				local var_65_5 = {
					var_65_4.soil - var_65_3.soil,
					var_65_4.stone - var_65_3.stone,
					var_65_4.lumber - var_65_3.lumber
				}
				local var_65_6 = smgr.getLayer("topLayer")

				for iter_65_4 = 1, 3 do
					if var_65_5[iter_65_4] > 0 then
						local var_65_7 = string.format("res/ui/nationTask/lantern/yxhd_tit_res%d%d.png", var_65_4.serial, iter_65_4)
						local var_65_8 = CCNode:create()
						local var_65_9 = CCSprite:create(var_65_7)
						local var_65_10 = CCSprite:createWithSpriteFrameName("res_plus.png")
						local var_65_11 = CCLabelAtlas:create(tostring(var_65_5[iter_65_4]), "res/ui/common/number/get_numb.png", 29, 46, 48)
						local var_65_12 = var_65_9:getContentSize().width
						local var_65_13 = var_65_10:getContentSize().width
						local var_65_14 = var_65_11:getContentSize().width
						local var_65_15 = (var_65_12 + var_65_13 + var_65_14) / 2

						var_65_9:setPositionX(var_65_12 / 2 - var_65_15)
						var_65_10:setPositionX(var_65_12 + var_65_13 / 2 - var_65_15)
						var_65_11:setPositionX(var_65_12 + var_65_13 + var_65_14 / 2 - var_65_15 - var_65_14 / 2)
						var_65_11:setPositionY(-var_65_11:getContentSize().height / 2)
						var_65_8:addChild(var_65_9)
						var_65_8:addChild(var_65_10)
						var_65_8:addChild(var_65_11)
						var_65_8:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

						local var_65_16 = CCArray:create()

						var_65_16:addObject(CCDelayTime:create((iter_65_4 - 1) * 0.8))
						var_65_16:addObject(CCMoveBy:create(0.3, ccp(0, 50)))
						var_65_16:addObject(CCDelayTime:create(0.8))
						var_65_16:addObject(CCFadeOut:create(0.5))
						var_65_16:addObject(CCCallFuncN:create(function()
							var_65_6:removeChild(var_65_8, true)
						end))

						local var_65_17 = CCSequence:create(var_65_16)

						var_65_8:runAction(var_65_17)
						var_65_6:addChild(var_65_8, -1)
					end
				end
			end
		end
	end
end

local function var_0_36(arg_67_0, arg_67_1)
	local var_67_0 = smgr.getLayer("worldCamera")
	local var_67_1 = smgr.getLayer("worldLayer")

	for iter_67_0, iter_67_1 in pairs(var_67_0.cityTable) do
		if not tolua.isnull(iter_67_1.cleanBtn) and tool.checkIfTouch2(iter_67_1.cleanBtn, arg_67_0, arg_67_1) or var_67_0.canTouchCity == false then
			return false
		end

		if iter_67_1.eventSprite and tool.checkIfTouch(iter_67_1.eventSprite, arg_67_0, arg_67_1) then
			if iter_67_1.eventInfo.detail and iter_67_1.eventInfo.detail[1].targetForceId then
				smgr.showTipTextGreen(language.get("480001_yyl"))

				return
			end

			for iter_67_2, iter_67_3 in pairs(generalMoveLayer.generalTable) do
				if iter_67_3.locationId == tonumber(iter_67_1.prop[1]) then
					if iter_67_1.eventInfo.eventType == 1001 or iter_67_1.eventInfo.eventType == 1002 or iter_67_1.eventInfo.eventType == 1003 or iter_67_1.eventInfo.eventType == 1006 or iter_67_1.eventInfo.eventType == 1007 or iter_67_1.eventInfo.eventType == 1008 or iter_67_1.eventInfo.eventType == 1009 or iter_67_1.eventInfo.eventType == 1011 or iter_67_1.eventInfo.eventType == 1012 or iter_67_1.eventInfo.eventType == 1013 or iter_67_1.eventInfo.eventType == 1014 or iter_67_1.eventInfo.eventType == 1016 or iter_67_1.eventInfo.eventType == 1017 then
						local var_67_2 = createPlayerEventWindow(iter_67_1.prop[1])

						var_67_1:addChild(var_67_2, 105)
					elseif iter_67_1.eventInfo.eventType == 1004 then
						require("lua/layer/activity/famousInfo/ui").new(tonumber(iter_67_1.prop[1]))
					elseif iter_67_1.eventInfo.eventType == 1005 then
						require("lua/layer/world/jubenEnter/ui")
						jubenEnter.ui.show(iter_67_1.prop[1])
					elseif iter_67_1.eventInfo.eventType == 1010 then
						require("lua/layer/activity/tiandengInfo/ui").new(tonumber(iter_67_1.prop[1]))
					elseif iter_67_1.eventInfo.eventType == 1014 then
						require("lua/layer/activity/dragonBoatInfo/ui").new(tonumber(iter_67_1.prop[1]))
					elseif iter_67_1.eventInfo.eventType == 1016 then
						require("lua/layer/activity/dragonBoatInfo2/ui").new(tonumber(iter_67_1.prop[1]))
					else
						local var_67_3 = createEventWindow(iter_67_1.prop[1])

						var_67_1:addChild(var_67_3, 105)
					end

					return false
				end
			end

			eventManager.dispatchEvent("normalCityClick", iter_67_1.prop[1])

			return false
		end
	end

	return true
end

local function var_0_37(arg_68_0, arg_68_1)
	if var_0_0.sdManzuAttachedTaskInfo then
		local var_68_0 = smgr.getLayer("worldCamera")

		for iter_68_0 = 1, 3 do
			local var_68_1 = var_68_0.cityTable["world_building_" .. worldConstant.MANZU_CITY[iter_68_0]]

			if var_68_1.manzuTaskBtn and tool.checkIfTouch(var_68_1.manzuTaskBtn, arg_68_0, arg_68_1) then
				return false
			end
		end
	end

	return true
end

local function var_0_38(arg_69_0, arg_69_1)
	if var_0_0.ruines then
		local var_69_0 = smgr.getLayer("worldCamera")

		for iter_69_0, iter_69_1 in ipairs(var_0_0.ruines) do
			local var_69_1 = var_69_0.cityTable["world_building_" .. iter_69_1.cityId]

			if var_69_1.kfyzRebuildBtnBg and tool.checkIfTouch(var_69_1.kfyzRebuildBtnBg, arg_69_0, arg_69_1) then
				return false
			end
		end
	end

	return true
end

local function var_0_39(arg_70_0, arg_70_1)
	if user.haveWorldFuBen == 2 then
		local var_70_0 = {
			123,
			19,
			207
		}
		local var_70_1 = smgr.getLayer("worldCamera").cityTable["world_building_" .. var_70_0[user.player.forceId]]

		if var_70_1.silkPowerBtnBg and tool.checkIfTouch(var_70_1.silkPowerBtnBg, arg_70_0, arg_70_1) then
			return false
		end
	end

	return true
end

local function var_0_40(arg_71_0, arg_71_1)
	local var_71_0 = smgr.getLayer("worldCamera")

	for iter_71_0, iter_71_1 in pairs(worldUI.feudTable) do
		local var_71_1 = var_71_0.cityTable["world_building_" .. iter_71_0]

		if var_71_1.btn_seal and var_71_1.btn_seal:isVisible() and tool.checkIfTouch(var_71_1.btn_seal, arg_71_0, arg_71_1) or var_71_1.node_select and var_71_1.node_select:isVisible() and tool.checkIfTouch(var_71_1.bg_select, arg_71_0, arg_71_1) or var_71_1.node_produce and var_71_1.node_produce:isVisible() and tool.checkIfTouch(var_71_1.bg_produce, arg_71_0, arg_71_1) or var_71_1.btn_reward2 and var_71_1.btn_reward2:isVisible() and tool.checkIfTouch(var_71_1.btn_reward2, arg_71_0, arg_71_1) or var_71_1.btn_flag and var_71_1.btn_flag:isVisible() and tool.checkIfTouch(var_71_1.btn_flag, arg_71_0, arg_71_1) then
			return false
		end
	end

	return true
end

local function var_0_41(arg_72_0, arg_72_1)
	local var_72_0 = smgr.getLayer("worldCamera")

	if worldUI.forceEventTable and #worldUI.forceEventTable > 0 then
		for iter_72_0, iter_72_1 in pairs(worldUI.forceEventTable) do
			local var_72_1 = var_72_0.cityTable["world_building_" .. iter_72_0]

			if var_72_1.btn_event and var_72_1.btn_event:isVisible() and tool.checkIfTouch(var_72_1.btn_event, arg_72_0, arg_72_1) or var_72_1.btn_leave and var_72_1.btn_leave:isVisible() and tool.checkIfTouch(var_72_1.btn_leave, arg_72_0, arg_72_1) then
				return false
			end
		end
	end

	return true
end

local function var_0_42(arg_73_0, arg_73_1)
	local var_73_0 = smgr.getLayer("worldCamera")

	worldUI.investTable = worldUI.investTable or {}

	for iter_73_0, iter_73_1 in pairs(worldUI.investTable) do
		local var_73_1 = var_73_0.cityTable["world_building_" .. iter_73_0]

		if var_73_1.btn_seal and var_73_1.btn_seal:isVisible() and tool.checkIfTouch(var_73_1.btn_seal, arg_73_0, arg_73_1) or var_73_1.bg and tool.checkIfTouch(var_73_1.bg, arg_73_0, arg_73_1) or var_73_1.btn_invest and tool.checkIfTouch(var_73_1.btn_invest, arg_73_0, arg_73_1) or var_73_1.btn_cd and var_73_1.btn_cd:isVisible() and tool.checkIfTouch(var_73_1.btn_cd, arg_73_0, arg_73_1) then
			return false
		end
	end

	return true
end

local function var_0_43(arg_74_0, arg_74_1)
	for iter_74_0, iter_74_1 in pairs(worldUI.castleTable) do
		if iter_74_1.castleTable and tool.checkIfTouch(iter_74_1.castleTable.mainBack, arg_74_0, arg_74_1) then
			return false
		end

		if iter_74_1.castleTable and iter_74_1.castleTable.peopleList:isVisible() and tool.checkIfTouch(iter_74_1.castleTable.peopleList, arg_74_0, arg_74_1) then
			return false
		end
	end

	return true
end

local function var_0_44(arg_75_0, arg_75_1)
	log.info("castleBuildBtnOnTap")

	for iter_75_0, iter_75_1 in pairs(worldUI.castleTable) do
		if iter_75_1.castleTable and tool.checkIfTouch(iter_75_1.castleTable.zhaojiButton, arg_75_0, arg_75_1) then
			if iter_75_1.currentButtonState == 1 then
				for iter_75_2, iter_75_3 in pairs(generalMoveLayer.gongjiangTable) do
					cmgr.sendRequest(nil, actions.castleAutoMove, iter_75_3.vId, iter_75_1.castle.cityId)

					return false
				end
			elseif iter_75_1.currentButtonState == 2 then
				for iter_75_4, iter_75_5 in pairs(generalMoveLayer.gongjiangTable) do
					cmgr.sendRequest(nil, actions.startBuild, iter_75_5.vId, iter_75_1.castle.cityId)

					return false
				end
			elseif iter_75_1.currentButtonState == 3 then
				cmgr.sendRequest(nil, actions.castleCall, iter_75_1.castle.cityId)
			end

			return false
		end
	end

	return true
end

local function var_0_45(arg_76_0, arg_76_1)
	for iter_76_0, iter_76_1 in pairs(worldUI.castleTable) do
		if iter_76_1.castleTable and tool.checkIfTouch(iter_76_1.castleTable.showPeopleButton, arg_76_0, arg_76_1) then
			if iter_76_1.castleTable.peopleList:isVisible() then
				iter_76_1.castleTable.peopleList:setVisible(false)
			else
				iter_76_1.castleTable.peopleList:setVisible(true)

				local function var_76_0(arg_77_0)
					if arg_77_0.action.data.workers then
						worldUI.castleTable[iter_76_1.castle.cityId].castle.workers = arg_77_0.action.data.workers

						worldUI.changeWorkers(iter_76_1.castle.cityId, 0)
					end
				end

				cmgr.sendRequest(var_76_0, actions.getBuildWorkers, iter_76_1.castle.cityId)
			end

			return false
		end
	end

	return true
end

local function var_0_46(arg_78_0, arg_78_1)
	log.info("castle people left...")

	for iter_78_0, iter_78_1 in pairs(worldUI.castleTable) do
		if iter_78_1.castleTable and tool.checkIfTouch(iter_78_1.castleTable.leftArrow, arg_78_0, arg_78_1) then
			log.info("castle people left...")
			worldUI.changeWorkers(iter_78_1.castle.cityId, -1)

			return false
		end
	end

	return true
end

local function var_0_47(arg_79_0, arg_79_1)
	log.info("castle people right...")

	for iter_79_0, iter_79_1 in pairs(worldUI.castleTable) do
		if iter_79_1.castleTable and tool.checkIfTouch(iter_79_1.castleTable.rightArrow, arg_79_0, arg_79_1) then
			log.info("castle people right...")
			worldUI.changeWorkers(iter_79_1.castle.cityId, 1)

			return false
		end
	end

	return true
end

function var_0_0.changeCityEventState(arg_80_0, arg_80_1)
	local var_80_0 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_80_1]

	if var_80_0 and var_80_0.eventSprite then
		var_80_0.eventSprite:setVisible(not arg_80_0)
	end
end

local function var_0_48(arg_81_0)
	local var_81_0 = arg_81_0.action.data

	user.leftChainTimes = var_81_0.leftNum
	var_0_0.lockCities = var_81_0.cities

	local var_81_1 = smgr.getLayer("worldCamera")

	var_81_1.clearLockSelectUI()
	var_81_1.showLockUI()

	for iter_81_0, iter_81_1 in pairs(var_0_0.lockCities) do
		print("--------------lockCities-----------------", iter_81_0, iter_81_1)
		var_81_1.addCanLockCities(iter_81_1)
	end
end

function var_0_0.getChainableCities(arg_82_0)
	var_0_0.lockFromCityId = arg_82_0

	cmgr.sendRequest(var_0_48, actions.getChainableCities, arg_82_0)
end

local function var_0_49(arg_83_0)
	local var_83_0 = arg_83_0.action.data

	smgr.getLayer("worldCamera").clearLockSelectUI()
end

function var_0_0.chainableCities(arg_84_0, arg_84_1)
	cmgr.sendRequest(var_0_49, actions.chainCities, arg_84_0, arg_84_1)
end

local function var_0_50(arg_85_0)
	local var_85_0 = {}

	if arg_85_0 then
		var_85_0.cd = arg_85_0.cd
		var_85_0.taskState = arg_85_0.taskState
		var_85_0.taskType = arg_85_0.taskType
		var_85_0.state = arg_85_0.state

		if arg_85_0.strategies and #arg_85_0.strategies > 0 then
			var_85_0.suc = arg_85_0.strategies[1].suc
			var_85_0.nextManzuTime = arg_85_0.strategies[1].nextManzuTime
		end

		var_85_0.hasReward = arg_85_0.hasReward
		var_85_0.strategy = arg_85_0.strategy
		var_85_0.selfNation = arg_85_0.selfNation
		var_85_0.npcCityId = arg_85_0.targetCity and arg_85_0.targetCity or arg_85_0.fromCityId

		if not var_85_0.npcCityId and arg_85_0.target then
			var_85_0.npcCityId = arg_85_0.target
		end

		var_85_0.toCityIdList = arg_85_0.toCityIdList

		if arg_85_0.path then
			var_85_0.path = stringSplit(arg_85_0.path, ";")
		end
	end

	return var_85_0
end

local function var_0_51()
	local var_86_0 = user.worldData
	local var_86_1 = smgr.getLayer("worldCamera")

	var_86_0.hjLockCityList = var_86_0.hjLockCityList or {}

	worldUI.removeStrategyEvent()
	worldUI.removeBtnNationReward()

	if var_86_0.nationNpcCityList then
		for iter_86_0, iter_86_1 in pairs(var_86_0.nationNpcCityList) do
			if iter_86_1.hasReward then
				worldUI.addBtnNationReward(iter_86_1)
			else
				worldUI.addStrategyEvent(iter_86_1)
			end
		end
	end

	for iter_86_2, iter_86_3 in pairs(var_86_0.hjLockCityList) do
		var_86_1.clearLock(iter_86_2, iter_86_3)

		var_86_0.hjLockCityList[iter_86_2] = nil
	end

	if var_86_0.nationNpcLockCityList then
		for iter_86_4, iter_86_5 in pairs(var_86_0.nationNpcLockCityList) do
			if iter_86_5.path then
				for iter_86_6, iter_86_7 in ipairs(iter_86_5.path) do
					if iter_86_7 and iter_86_7 ~= "" then
						local var_86_2 = stringSplit(iter_86_7, ",")

						if var_86_2 and var_86_2[1] and var_86_2[2] then
							var_86_1.drawLock(var_86_2[1], var_86_2[2])

							var_86_0.hjLockCityList[var_86_2[1]] = var_86_2[2]
						end
					end
				end
			end
		end
	end
end

function var_0_0.nationNpcUpdate(arg_87_0)
	local var_87_0 = user.worldData

	var_87_0.nationNpcCityList = var_87_0.nationNpcCityList or {}

	local var_87_1 = false

	for iter_87_0, iter_87_1 in pairs(arg_87_0) do
		local var_87_2 = iter_87_1.taskType
		local var_87_3 = var_0_50(iter_87_1)

		if var_87_3.taskType == 1000003 or var_87_3.taskType == 1000004 or var_87_3.taskType == 1000005 then
			if var_87_3.taskType == 1000003 then
				var_87_3.strategy = "hjRebel"
			elseif var_87_3.taskType == 1000004 then
				var_87_3.strategy = "ysProvoke"
			elseif var_87_3.taskType == 1000005 then
				var_87_3.strategy = "barInvade"
			end

			var_87_0.nationNpcCityList[var_87_3.npcCityId] = var_87_3

			if var_87_3.taskType == 1000003 then
				var_87_1 = var_87_3.taskState < 2
			end
		end

		if iter_87_1.taskType == 1000003 and iter_87_1.hasReward then
			local var_87_4 = var_0_50(iter_87_1)

			var_87_4.strategy = "hjRebel"
			var_87_0.nationNpcCityList[var_87_4.npcCityId] = var_87_4
		end
	end

	for iter_87_2, iter_87_3 in pairs(arg_87_0) do
		if iter_87_3.taskType == 1 then
			local var_87_5 = var_0_50(iter_87_3)

			if var_87_1 then
				var_87_5.strategy = "hjRebelAtt"
				var_87_0.nationNpcCityList[var_87_5.npcCityId] = var_87_5
			else
				var_87_0.nationNpcCityList[var_87_5.npcCityId] = nil
			end
		end
	end

	var_0_51()
end

function var_0_0.onEnter()
	var_0_0.thumbnailIconTable = {}

	menuUI.ui.show()
	playerInfoUI.show()

	local var_88_0 = smgr.getLayer("uiLayer")

	showSimpleGeneralPanel(var_88_0, nil, true)
	cmgr.registerResponseHandler(actions.pushCastle, var_0_9)
	cmgr.registerResponseHandler(actions.pushWorld, var_0_17)
	cmgr.registerResponseHandler(actions.pushCities, var_0_19)
	cmgr.registerResponseHandler(actions.pushBarleague, var_0_20)
	cmgr.registerResponseHandler(actions.pushTower, var_0_16)
	cmgr.registerResponseHandler(actions.pushWorldKillChange, var_0_21)
	cmgr.registerResponseHandler(actions.pushWorldReward, var_0_22)
	cmgr.registerResponseHandler(actions.pushTrickInfo, var_0_23)
	cmgr.registerResponseHandler(actions.pushCityEvent, var_0_26)
	cmgr.registerResponseHandler(actions.pushPlayerEvent, var_0_27)
	cmgr.registerResponseHandler(actions.pushBarbarainFadong, var_0_18)
	cmgr.registerResponseHandler(actions.nationTaskStateChange, var_0_34)
	cmgr.registerResponseHandler(actions.pushNationTask, var_0_35)
	cmgr.registerResponseHandler(actions.pushBstask, var_0_5)
	cmgr.registerResponseHandler(actions.pushAttToken, var_0_6)
	cmgr.registerResponseHandler(actions.pushFeud, var_0_8)
	cmgr.registerResponseHandler(actions.pushForceEvent, var_0_28)
	cmgr.registerResponseHandler(actions.newsdmz, var_0_29)
	cmgr.registerResponseHandler(actions.newhj, var_0_30)
	cmgr.registerResponseHandler(actions.granary, var_0_31)
	cmgr.registerResponseHandler(actions.pushCorps, var_0_32)
	cmgr.registerResponseHandler(actions.pushYcbw, var_0_33)
	cmgr.registerResponseHandler(actions.pushShogun, var_0_7)
	eventManager.registerEvent("cityClick", cityWindowUI.show)
	eventManager.registerEvent("normalCityClick", require("lua/layer/world/cityWindow2/ui").new)
	eventManager.registerEvent("cityEventOnTap", var_0_36)
	eventManager.registerEvent("manzuTaskBtnOnTap", var_0_37)
	eventManager.registerEvent("kfyzRebuildBtnOnTap", var_0_38)
	eventManager.registerEvent("feudBtnOnTap", var_0_40)
	eventManager.registerEvent("forceEventBtnOnTap", var_0_41)
	eventManager.registerEvent("newInvestBtnOnTap", var_0_42)
	eventManager.registerEvent("castlePanelOnTap", var_0_43)
	eventManager.registerEvent("castleBuildBtnOnTap", var_0_44)
	eventManager.registerEvent("castleShowPeopleBtnOnTap", var_0_45)
	eventManager.registerEvent("castleLeftBtnOnTap", var_0_46)
	eventManager.registerEvent("castleRightBtnOnTap", var_0_47)
	eventManager.registerEvent("silkPowerBtnOnTap", var_0_39)
	eventManager.registerEvent("handlerGetShouMaiInfoAction", var_0_3)
	eventManager.registerEvent("handlerGetFarmInfoAction", var_0_4)
	eventManager.registerEvent("hideWorldElement", var_0_0.changeCityEventState)
	eventManager.registerEvent("stratagemChanged", var_0_24)
	eventManager.registerEvent("autoBattleCityEffect", worldUI.autoBattleEffect)
	eventManager.registerEvent("addPhantomMp", worldUI.addPhantomMp)
	eventManager.registerEvent("PushJiaoZhen", worldUI.addArena)
	eventManager.registerEvent("haveBetterPigCityId", worldUI.addCock)
	eventManager.registerEvent("openBuildWorld", var_0_14)
	eventManager.registerEvent("handlerPredicatePush_strategy", var_0_10)
	eventManager.registerEvent("nationNpcCityListUpdate", var_0_51)

	var_0_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_15, 1, false)
end

function var_0_0.onExit()
	cmgr.unregisterResponseHandler(actions.pushCastle, var_0_9)
	cmgr.unregisterResponseHandler(actions.pushWorld, var_0_17)
	cmgr.unregisterResponseHandler(actions.pushCities, var_0_19)
	cmgr.unregisterResponseHandler(actions.pushBarleague, var_0_20)
	cmgr.unregisterResponseHandler(actions.pushTower, var_0_16)
	cmgr.unregisterResponseHandler(actions.pushWorldKillChange, var_0_21)
	cmgr.unregisterResponseHandler(actions.pushWorldReward, var_0_22)
	cmgr.unregisterResponseHandler(actions.pushTrickInfo, var_0_23)
	cmgr.unregisterResponseHandler(actions.pushCityEvent, var_0_26)
	cmgr.unregisterResponseHandler(actions.pushPlayerEvent, var_0_27)
	cmgr.unregisterResponseHandler(actions.pushBarbarainFadong, var_0_18)
	cmgr.unregisterResponseHandler(actions.nationTaskStateChange, var_0_34)
	cmgr.unregisterResponseHandler(actions.pushNationTask, var_0_35)
	cmgr.unregisterResponseHandler(actions.pushBstask, var_0_5)
	cmgr.unregisterResponseHandler(actions.pushAttToken, var_0_6)
	cmgr.unregisterResponseHandler(actions.pushFeud, var_0_8)
	cmgr.unregisterResponseHandler(actions.pushForceEvent, var_0_28)
	cmgr.unregisterResponseHandler(actions.newsdmz, var_0_29)
	cmgr.unregisterResponseHandler(actions.newhj, var_0_30)
	cmgr.unregisterResponseHandler(actions.granary, var_0_31)
	cmgr.unregisterResponseHandler(actions.pushCorps, var_0_32)
	cmgr.unregisterResponseHandler(actions.pushYcbw, var_0_33)
	cmgr.unregisterResponseHandler(actions.pushShogun, var_0_7)
	eventManager.unregisterEvent("cityClick", cityWindowUI.show)
	eventManager.unregisterEvent("normalCityClick", require("lua/layer/world/cityWindow2/ui").new)
	eventManager.unregisterEvent("cityEventOnTap", var_0_36)
	eventManager.unregisterEvent("manzuTaskBtnOnTap", var_0_37)
	eventManager.unregisterEvent("kfyzRebuildBtnOnTap", var_0_38)
	eventManager.unregisterEvent("feudBtnOnTap", var_0_40)
	eventManager.unregisterEvent("forceEventBtnOnTap", var_0_41)
	eventManager.unregisterEvent("newInvestBtnOnTap", var_0_42)
	eventManager.unregisterEvent("castlePanelOnTap", var_0_43)
	eventManager.unregisterEvent("castleBuildBtnOnTap", var_0_44)
	eventManager.unregisterEvent("castleShowPeopleBtnOnTap", var_0_45)
	eventManager.unregisterEvent("castleLeftBtnOnTap", var_0_46)
	eventManager.unregisterEvent("castleRightBtnOnTap", var_0_47)
	eventManager.unregisterEvent("silkPowerBtnOnTap", var_0_39)
	eventManager.unregisterEvent("handlerGetShouMaiInfoAction", var_0_3)
	eventManager.unregisterEvent("handlerGetFarmInfoAction", var_0_4)
	eventManager.unregisterEvent("hideWorldElement", var_0_0.changeCityEventState)
	eventManager.unregisterEvent("stratagemChanged", var_0_24)
	eventManager.unregisterEvent("autoBattleCityEffect", worldUI.autoBattleEffect)
	eventManager.unregisterEvent("addPhantomMp", worldUI.addPhantomMp)
	eventManager.unregisterEvent("PushJiaoZhen", worldUI.addArena)
	eventManager.unregisterEvent("haveBetterPigCityId", worldUI.addCock)
	eventManager.unregisterEvent("openBuildWorld", var_0_14)
	eventManager.unregisterEvent("handlerPredicatePush_strategy", var_0_10)
	eventManager.unregisterEvent("nationNpcCityListUpdate", var_0_51)

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end

	cmgr.sendRequest(var_0_25, actions.leaveWorldScene, var_0_0.generalId)

	local var_89_0 = smgr.getLayer("worldCamera")

	var_0_0.memoryLocaition = var_89_0.scrollLayer:getContentOffset()

	log.info("保存地点(%s,%s)", var_0_0.memoryLocaition.x, var_0_0.memoryLocaition.y)

	worldControl.lock = false
	worldUI.mapTable = nil
	generalMoveLayer.workerTable = nil
	worldUI.castleTable = {}
	worldUI.feudTable = {}
	worldUI.forceEventTable = {}
	worldUI.litFireTable = {}
	worldUI.extinguishTable = {}
	worldUI.arenaTable = {}
	worldUI.headHunterTable = {}
	user.player.hasMzLeague = {}
	worldUI.diedCastleNpcTable = {}
	worldUI.investTable = {}

	eventManager.dispatchEvent("worldLayerOnExit")
end
