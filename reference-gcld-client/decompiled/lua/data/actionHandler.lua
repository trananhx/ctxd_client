actionHandler = {}

function actionHandler.handlerPlayerInfoAction(arg_1_0)
	local var_1_0 = arg_1_0.action.state
	local var_1_1 = arg_1_0.action.data

	if var_1_1 == nil then
		return
	end

	log.info("@@开始")

	user.haveShareReward = var_1_1.haveShareReward or 0
	user.shareRewardWoodNum = var_1_1.shareRewardWoodNum or 0
	user.shareRewardTask = var_1_1.shareRewardTask or {}

	if conf.language == "vie" or conf.language == "tha" then
		user.playerNewYearFrame = var_1_1.player.headFrame
	else
		user.playerNewYearFrame = 0
	end

	g_quickLogin = false
	user.yx = var_1_1.player.yx or ""
	user.serverName = user.serverName or var_1_1.player.serverName
	user.serverId = user.serverId or var_1_1.player.serverId
	user.player.userId = var_1_1.player.userId or 0
	user.player.playerId = var_1_1.player.playerId or 0
	user.player.id = user.player.playerId
	user.player.vId = var_1_1.player.vId or ""
	user.player.pic = var_1_1.player.pic
	user.player.name = var_1_1.player.playerName or ""
	user.player.playerLv = arg_1_0.action.data.player.playerLv or 0
	user.topLv = var_1_1.topLv or 0

	if var_1_1.player.createTime then
		user.player.createTime = var_1_1.player.createTime / 1000
	else
		user.player.createTime = 1479103100
	end

	if var_1_1.player.yx then
		CCUserDefault:sharedUserDefault():setStringForKey("yx", var_1_1.player.yx)
	end

	local var_1_2 = user.serverId

	if platform.getFlag() == "MOBILE_IPHONE" and conf.language == "kr" then
		var_1_2 = string.format("%03d", var_1_2)

		log.info("##localServerId  ", #var_1_2)

		if #var_1_2 > 3 then
			var_1_2 = "951"
		end
	end

	ChannelManager:getInstance():updatePlayer(tostring(user.player.userId), tostring(user.player.playerId), tostring(user.player.playerLv), tostring(user.player.name), tostring(var_1_2))

	user.haveInvite = var_1_1.haveInvite
	user.player.pkey = var_1_1.player.pkey2
	user.player.gold = var_1_1.player.gold
	user.player.wood = var_1_1.player.wood
	user.player.copper = var_1_1.player.copper
	user.player.food = var_1_1.player.food
	user.player.iron = var_1_1.player.iron
	user.player.woodMax = var_1_1.player.woodMax
	user.player.copperMax = var_1_1.player.copperMax
	user.player.foodMax = var_1_1.player.foodMax
	user.player.ironMax = var_1_1.player.ironMax
	user.player.copperOutput = var_1_1.player.copperOutput
	user.player.woodOutput = var_1_1.player.woodOutput
	user.player.foodOutput = var_1_1.player.foodOutput
	user.player.ironOutput = var_1_1.player.ironOutput
	user.player.exp = var_1_1.player.exp
	user.player.expNeed = var_1_1.player.expNeed
	user.player.maxKitExp = var_1_1.player.maxKitExp or 1
	user.player.curKitExp = var_1_1.player.curKitExp or 0
	user.player.isTrainning = arg_1_0.action.data.isTrainning
	user.player.forceId = arg_1_0.action.data.player.forceId
	user.player.hasOfficialBuildingOthers = arg_1_0.action.data.hasOfficialBuildingOthers
	user.player.gemKit = arg_1_0.action.data.player.hasGemKit or false

	if user.player.gemKit then
		language.expStr = language[10107]
		language[10107] = language[10108]
	else
		language[10107] = language.expStr or language[10107]
	end

	user.player.hasBestSuit = arg_1_0.action.data.player.hasBestSuit or false

	if user.player.hasBestSuit then
		user.player.expInfo = arg_1_0.action.data.player.expInfo
	end

	user.player.havePayRedBagActivity = arg_1_0.action.data.havePayRedBagActivity == 2 or false

	if arg_1_0.action.data.celebrationNum then
		user.player.gonghe = arg_1_0.action.data.celebrationNum
	else
		user.player.gonghe = 0
	end

	user.player.openTrade = arg_1_0.action.data.player.openTrade == 1 and true or false
	user.player.hasSDTJActivity = arg_1_0.action.data.haveSwordActivity or false
	user.player.sdtjMaxExp = arg_1_0.action.data.maxExp or 0
	user.player.sdtjcurExp = arg_1_0.action.data.curExp or 0
	user.player.sdtjLv = arg_1_0.action.data.curLv or 0

	log.info(arg_1_0.action.data.buffId)

	if var_1_1.buffId then
		user.player.hasSdtjBuff = true
		user.player.sdtjBuffLv = var_1_1.buff
		user.player.sdtjBuffId = var_1_1.buffId
	end

	if var_1_1.isNewSword then
		var_1_1.haveNewSwordActivity = var_1_1.haveSwordActivity
		var_1_1.haveSwordActivity = 0
	end

	user.supplyOpen = var_1_1.supplyOpen or false
	user.player.hasOfflineBuff = arg_1_0.action.data.hasOfflineBuff
	user.player.offlineBuffId = arg_1_0.action.data.offlineBuffId

	if not checkOfflineTime then
		checkOfflineTime = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_2_0)
			if user and user.player and user.player.offlineEndTime then
				user.player.offlineEndTime = user.player.offlineEndTime - arg_2_0 * 1000

				if user.player.offlineEndTime <= 0 then
					user.player.offlineEndTime = 0
				end
			end
		end, 0.1, false)
	end

	user.player.offlineEndTime = 0

	if user.player.hasOfflineBuff == 1 then
		user.player.offlineEndTime = arg_1_0.action.data.offlineBuffEndTime
	end

	user.haveMineDayGift = arg_1_0.action.data.haveMineDayGift or 0
	user.kingNotice = arg_1_0.action.data.kingNotice
	user.player.haveGemsActivity = arg_1_0.action.data.haveGemsActivity or 0
	user.player.haveGemRotaryEvent = arg_1_0.action.data.haveGemRotaryEvent or 0
	user.player.haveConsumeGiftActivity = arg_1_0.action.data.haveConsumeGiftActivity or 0
	user.player.haveConsumeGift2Activity = arg_1_0.action.data.haveConsumeGift2Activity or 0
	user.openSilkFunction = arg_1_0.action.data.openSilkFunction or 0

	if user.openSilkFunction == 1 then
		log.info("user.openSilkFunction: ", user.openSilkFunction)
		roleDialogue.control.loadSpeak(1940)
	end

	user.silkTraderChange = arg_1_0.action.data.silkTraderChange or 0

	if user.silkTraderChange == 1 then
		log.info("user.openSilkFunction: ", user.silkTraderChange)
		roleDialogue.control.loadSpeak(1943)
	end

	user.hasCbhsPower = arg_1_0.action.data.hasCbhsPower or false

	if not user.canZhouYuJueXing then
		user.hasCbhsPower = false
	end

	user.signComplete = arg_1_0.action.data.signComplete or -1
	user.kbNeedCall = arg_1_0.action.data.kbNeedCall or false
	user.kbLv = arg_1_0.action.data.kbLv or 0
	user.forceExp = arg_1_0.action.data.forceExp
	user.maxForceExp = arg_1_0.action.data.maxForceExp
	user.disturbState = arg_1_0.action.data.disturbState or 0
	user.jpsStages = var_1_1.jpsStages
	user.jpsWin = var_1_1.jpsWin or 0
	user.isPro = var_1_1.isPro or 0
	user.inkbtask = false

	if user.kbNeedCall == true then
		local function var_1_3(arg_3_0)
			require("lua/layer/task/ui")

			if arg_3_0.action.data then
				local var_3_0 = 0

				for iter_3_0, iter_3_1 in pairs(arg_3_0.action.data) do
					var_3_0 = var_3_0 + 1
				end

				if var_3_0 > 0 then
					user.inkbtask = true

					if arg_3_0.action.data.state ~= 1 and arg_3_0.action.data.state ~= 2 then
						if user.kbLv and user.kbLv >= 1 then
							roleDialogue.control.loadSpeak(2022)
						else
							roleDialogue.control.loadSpeak(1973)
						end
					end

					taskUI.setBuildNationTaskSide(arg_3_0.action.data)
				else
					user.inkbtask = false
				end
			end
		end

		log.info("QQQ:request kbtask info")
		cmgr.sendRequest(var_1_3, actions.getBuildNationSTaskInfo)
	end

	user.player.hasHuizhan = arg_1_0.action.data.hasHuiZhan or false
	user.player.hasHuiZhanGatherIcon = arg_1_0.action.data.hasHuiZhanGatherIcon or false
	user.player.hzState = arg_1_0.action.data.hzState or 0
	user.player.hzCountDown = arg_1_0.action.data.hzCountDown or 0
	user.player.maxNationLv = arg_1_0.action.data.maxNationLv
	user.chargeItems = var_1_1.chargeItems
	user.inkfwd = arg_1_0.action.data.inkfwd or 0
	user.kfgzState = arg_1_0.action.data.kfgzState
	user.kfzbState = arg_1_0.action.data.kfzbState
	user.kfzbZone = arg_1_0.action.data.kfzbZone or 0

	if type(user.kfzbZone) ~= "number" then
		user.kfzbZone = 0
	end

	user.haveFeast = arg_1_0.action.data.haveFeast
	user.feastType = arg_1_0.action.data.feastType or 0
	user.showKfzbCele = arg_1_0.action.data.showKfzbCele or false
	user.moveFaster = arg_1_0.action.data.moveFaster or false
	user.kfyzState = arg_1_0.action.data.kfyzState or 0
	user.invastType = arg_1_0.action.data.invastType or 0
	user.noSchedule = arg_1_0.action.data.noSchedule
	user.startTime = arg_1_0.action.data.startTime or 0
	user.tally = arg_1_0.action.data.tally or 0
	user.hasApplied = arg_1_0.action.data.hasApplied
	user.isInSd = arg_1_0.action.data.isInSd or false
	user.jpsIndex = arg_1_0.action.data.jpsIndex or 0
	user.isSoldiersThreeRoad = arg_1_0.action.data.isDivided and arg_1_0.action.data.isDivided == 1
	user.kfRoadId = arg_1_0.action.data.roadId or 0

	if not checkKfyzStartTime then
		checkKfyzStartTime = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_4_0)
			if user and user.startTime then
				if user.startTime <= 0 then
					user.startTime = 0
				else
					user.startTime = user.startTime - arg_4_0 * 1000
				end
			end
		end, 0.2, false)
	end

	if not rmgr.setTallyPic then
		function rmgr.setTallyPic(arg_5_0, arg_5_1)
			local var_5_0 = type(arg_5_0) == "number" and arg_5_0 >= 1 and arg_5_0 <= 4

			if var_5_0 then
				arg_5_1:setDisplayFrame(CCSprite:create(string.format("res/ui/kfyz/wait/icon_hf%s.png", arg_5_0)):displayFrame())
			end

			return var_5_0
		end
	end

	user.haveGDSMoonFestivalActivity = arg_1_0.action.data.haveGDSMoonFestivalActivity or false
	user.canCatchRabbit = arg_1_0.action.data.canCatchRabbit or false
	user.haveTelFareActivity = arg_1_0.action.data.haveTelFareActivity
	user.kfmgState = arg_1_0.action.data.kfmgShowTipsState
	user.hasDiscountIcon = arg_1_0.action.data.hasDiscountIcon
	user.discountCountDown = arg_1_0.action.data.discountCountDown or 0
	user.noticeList = {}
	user.noticeList.batTeamNum = arg_1_0.action.data.batTeamNum
	user.noticeList.officerToken = arg_1_0.action.data.officialNew
	user.noticeList.onlineNum = arg_1_0.action.data.onlineNum
	user.noticeList.haveDayGift = arg_1_0.action.data.haveDayGift
	user.noticeList.attTokenNum = arg_1_0.action.data.attTokenNum or 0
	user.noticeList.attLeftTime = arg_1_0.action.data.attLeftTime or 0
	user.is2th = var_1_1.is2th or 0
	user.isOpenCountry = true

	if arg_1_0.action.data.officer ~= nil then
		user.player.nowOfficer = arg_1_0.action.data.officer
	end

	user.updateSchedulerEntry = user.updateSchedulerEntry or nil

	if user.is2th and user.is2th > 0 then
		user.isOpenCountry = false

		if user.updateSchedulerEntry == nil then
			local var_1_4

			local function var_1_5(arg_6_0)
				if user.is2th == nil then
					CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_4)

					return
				end

				user.is2th = user.is2th - 1000 * arg_6_0

				if user.is2th < 0 then
					user.isOpenCountry = true

					if user.updateSchedulerEntry ~= nil then
						CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(user.updateSchedulerEntry)

						user.updateSchedulerEntry = nil
					end
				end
			end

			local var_1_6 = CCDirector:sharedDirector():getScheduler()

			user.updateSchedulerEntry = var_1_6:scheduleScriptFunc(var_1_5, 1, false)
			var_1_4 = user.updateSchedulerEntry
		end
	elseif user.updateSchedulerEntry ~= nil then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(user.updateSchedulerEntry)

		user.updateSchedulerEntry = nil
	end

	user.displayTech = arg_1_0.action.data.displayTech or 0
	user.autoBattleTechGain = var_1_1.autoBattleTechGain
	user.autoBattleCityId = var_1_1.autoBattleCityId
	user.proAutoBlood = var_1_1.proAutoBlood == true
	user.mode = var_1_1.mode or 0
	user.district = var_1_1.district or 0
	user.pin = var_1_1.pin

	if user.pin == 0 and arg_1_0.action.data.needChangeName then
		roleDialogue.control.loadSpeak(1990)
	end

	if var_1_1.haveInviteCodeActivity and channelMgr.currentChannel == channels.iosAppstore then
		user.haveInviteCodeActivity = 0
	else
		user.haveInviteCodeActivity = 0
	end

	user.openInviteCode = var_1_1.openInviteCode or 0
	user.haveHghd = var_1_1.haveRecallActivity or 0
	user.haveBigRotaryActivity = var_1_1.haveBigRotaryActivity or 0
	user.haveZhuanPanActivity = var_1_1.haveZhuanPanActivity or 0
	user.haveBaiNianBuff = var_1_1.haveBaiNianBuff
	user.baiNianBuffCd = var_1_1.baiNianBuffCd

	if var_1_1.haveIronRewardActivity == 2 then
		activityConstant.TYPES.ACTIVITY_IRON_REWARD.name = language.get(130058)
	end

	if var_1_1.haveIronGiveActivity == 2 then
		activityConstant.TYPES.ACTIVITY_IRON_GIVE.name = language.get(130059)
	end

	if var_1_1.haveDragonBoatActivity ~= 0 then
		activityConstant.TYPES.ACTIVITY_DRAGON_BOAT.name = language.get(var_1_1.haveDragonBoatActivity == 1 and 130067 or 130068)
		user.haveDragonBoatActivity = var_1_1.haveDragonBoatActivity
	end

	user.pay0805BuffStartCd = var_1_1.pay0805BuffStartCd or 0
	user.pay0805BuffEndCd = var_1_1.pay0805BuffEndCd or 0
	user.haveBetrayActivity = var_1_1.haveBetrayActivity or 0
	user.havaBetrayReward = var_1_1.havaBetrayReward or 0
	user.displayBetrayers = var_1_1.displayBetrayers or 0
	user.originalForceId = var_1_1.originalForceId or 0
	user.havaBetrayChangeNameReward = var_1_1.havaBetrayChangeNameReward or 0

	if user.haveBetrayActivity == 1 then
		roleDialogue.control.loadSpeak(1511)
	end

	if user.havaBetrayReward == 1 then
		roleDialogue.control.loadSpeak(1512)
	end

	user.needShowClean = var_1_1.needShowClean or false
	user.needShowCelebrate = var_1_1.needShowCelebrate or false
	user.sadStoryCities = var_1_1.sadStoryCities or {}

	if channelMgr.getCurrentChannel() == channels.iosAppstore then
		local var_1_7 = versionUpdateConstant.file.version

		reload(var_1_7)

		local var_1_8 = sys_version

		if game.newVersion.appStoreCode == var_1_8.appStoreCode then
			user.openInviteCode = 0
		end
	end

	user.hasNewMail = false

	if var_1_1.hasNewMail ~= nil and var_1_1.hasNewMail == true then
		user.hasNewMail = true
	end

	user.hasGoldOrder = var_1_1.hasGoldOrder
	user.goldOrderNum = var_1_1.goldOrderNum
	user.inJuBen = var_1_1.inJuBen
	user.soId = var_1_1.soId
	user.inAdventure = var_1_1.inAdventure
	user.mapId = var_1_1.mapId

	if var_1_1.player.inPveBattle ~= nil then
		user.player.inPveBattle = var_1_1.player.inPveBattle
	end

	if var_1_1.player.inOccupyBattle then
		user.player.inOccupyBattle = var_1_1.player.inOccupyBattle
	end

	user.uncoverFog = arg_1_0.action.data.activityInfo and arg_1_0.action.data.activityInfo.haveUncoverMistActivity

	if var_1_1.hasVipPrivilege then
		user.hasVipPrivilege = var_1_1.hasVipPrivilege
		user.shouldShowVipPrivilege = true
	end

	if var_1_1.sublimated then
		user.sublimated = var_1_1.sublimated
	end

	if var_1_1.needPoint then
		user.needPoint = var_1_1.needPoint

		if var_1_1.displayLight == false then
			needShowKaiguangAnimationBegin = true
		end
	end

	if var_1_1.currentPoint then
		user.currentPoint = var_1_1.currentPoint
	end

	user.silkIcon = var_1_1.silkIcon or 0
	user.haveWorldFuBen = var_1_1.haveWorldFuBen or 0
	user.haveTreasureFinish = var_1_1.haveTreasureFinish or 0
	user.silkRoadDispatch = var_1_1.silkRoadDispatch or 0
	user.haveSilkFunction = var_1_1.haveSilkFunction or false
	user.silkGoodsNotify = var_1_1.silkGoodsNotify or false
	user.kbtaskCong = var_1_1.kbtaskCong or false

	if var_1_1.weiName then
		user.forceIdToName[1] = var_1_1.weiName
	end

	if var_1_1.shuName then
		user.forceIdToName[2] = var_1_1.shuName
	end

	if var_1_1.wuName then
		user.forceIdToName[3] = var_1_1.wuName
	end

	user.mineStages = var_1_1.mineStages

	function user.getMineIdx(arg_7_0)
		local var_7_0

		if type(arg_7_0) == "number" and user.mineStages and #user.mineStages > 0 then
			var_7_0 = arg_7_0 <= user.mineStages[1] and 0 or arg_7_0 <= user.mineStages[2] and 1 or arg_7_0 <= user.mineStages[3] and 2 or arg_7_0 <= user.mineStages[4] and 3 or 4
		end

		return var_7_0
	end

	user.hasGemBonus = var_1_1.hasGemBonus or false
	user.feudState = var_1_1.feudState or 0
	user.feudCd = var_1_1.feudCd or 0
	user.feudLeftTimes = var_1_1.feudLeftTimes or 0

	if not checkBuffFeudCd then
		checkBuffFeudCd = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(function(arg_8_0)
			if user and user.feudCd and user.feudState == 1 then
				if user.feudCd <= 0 then
					user.feudCd = 0
				else
					user.feudCd = user.feudCd - arg_8_0 * 1000
				end
			end
		end, 0.2, false)
	end

	user.specialPhantom = var_1_1.specialPhantom or false

	if var_1_1.curTask then
		user.curTask = var_1_1.curTask

		for iter_1_0 = 1, #user.curTask.tasks do
			local var_1_9 = user.curTask.tasks[iter_1_0]

			if var_1_9.type == 1 then
				user.curMainTask = var_1_9
			elseif var_1_9.type == 3 then
				user.curBranchTask = var_1_9
			end
		end
	end

	if var_1_1.curNationTask then
		user.curNationTask = var_1_1.curNationTask
		user.noticeList.leagueForce = var_1_1.curNationTask.leagueForce

		for iter_1_1, iter_1_2 in ipairs(user.curNationTask.tasks) do
			if iter_1_2.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
				if iter_1_2.hasReward == true or iter_1_2.endTime > 0 then
					user.hasKillAllTask = true
				end

				break
			end
		end
	end

	if var_1_1.bsNeedCall and var_1_1.bsNeedCall == true then
		user.bsNeedCall = var_1_1.bsNeedCall

		local function var_1_10(arg_9_0)
			user.inbstask = true

			require("lua/layer/task/ui")

			if arg_9_0.action.data then
				taskUI.setWeichengTaskSide(arg_9_0.action.data)
			end
		end

		log.info("QQQ:request weicheng info")
		cmgr.sendRequest(var_1_10, actions.getSpecialSInfo)
	end

	user.displayCatapultIcon = var_1_1.displayCatapultIcon or 0

	if user.displayCatapultIcon == 2 then
		roleDialogue.control.loadSpeak(1950)
	end

	if var_1_1.tryTasks then
		user.curTryTask = var_1_1.tryTasks
	end

	if var_1_1.protectTasks then
		user.curProtectTask = var_1_1.protectTasks
	end

	if var_1_1["function"] then
		user.functions = var_1_1["function"]
	end

	user.player.task = user.player.task or {}
	user.player.task.tasks = user.player.task.tasks or {}

	for iter_1_3, iter_1_4 in pairs(arg_1_0.action.data.curTask.tasks) do
		user.player.task.tasks[iter_1_4.type] = iter_1_4

		if iter_1_4.type == 1 then
			user.player.areaId = iter_1_4.areaId
		end
	end

	user.manWangLing = var_1_1.MWLNext

	local function var_1_11(arg_10_0)
		if type(arg_10_0) == "number" then
			return arg_10_0 > 0
		elseif type(arg_10_0) == "boolean" then
			return arg_10_0
		elseif type(arg_10_0) == "string" then
			return arg_10_0 == "1"
		end
	end

	user.hasGift = var_1_11(var_1_1.hasGift)

	local var_1_12 = {}

	var_1_1.newActivityIds = var_1_1.newActivityIds or ""

	log.info("data.newActivityIds", var_1_1.newActivityIds)

	for iter_1_5, iter_1_6 in pairs(tool.split(var_1_1.newActivityIds, ":")) do
		if #iter_1_6 > 0 then
			var_1_12[#var_1_12 + 1] = tonumber(iter_1_6)
		end
	end

	if rmgr.isNotComplete() then
		var_1_1.haveIronMineActivity = 0
		var_1_1.haveNationalDayActivity = 0
		var_1_1.haveBeastActivity = 0
		var_1_1.haveBaiNianActivity = 0
		var_1_1.haveWishActivity = 0
		var_1_1.haveSevenCatchActivity = 0
		var_1_1.haveGodPaperActivity = 0
		var_1_1.haveGDSMoonFestivalActivity = false
		var_1_1.haveSkyLanternEvent = 0
		var_1_1.haveFishActivity = 0
		var_1_1.haveRewardGeneralActivity = 0
		var_1_1.haveHorseRacingActivity = 0
		var_1_1.haveSuperGemRotaryActivity = 0
		var_1_1.haveGemMineActivity = 0
		var_1_1.haveHeroActivity = 0
		var_1_1.haveNewSwordActivity = 0
		var_1_1.ironMountainEvent = 0
		var_1_1.haveIronGiveActivity = 0
		var_1_1.haveSilkshopActivity = 0
		var_1_1.haveMulNationEvent = 0
		var_1_1.haveKindomBuildSprint = 0
		var_1_1.haveTrialBuildEvent = 0
		var_1_1.haveSeaSilkRoadActivity = 0
		var_1_1.haveMoonCakeActivity = 0
		var_1_1.haveSilkCardEvent = 0
		var_1_1.haveGangMineActivity = 0
		var_1_1.haveGangCardEvent = 0
		var_1_1.haveSeasilkRoad2Activity = 0
		var_1_1.haveDragonBoatActivity = 0
		var_1_1.haveLookActivity = 0
		var_1_1.haveQAActivity = 0
		var_1_1.haveQuizActivity = 0
	end

	user.hasHotSwapGift = var_1_1.hasHotSwapGift or 0
	user.installFullPackRewards = var_1_1.installFullPackRewards or {}
	user.haveLookActivityIcon = var_1_1.haveLookActivity
	user.newActivity = {}

	require("lua/layer/activity/constant")

	user.activity = user.activity or {}

	for iter_1_7, iter_1_8 in pairs(activityConstant.TYPES) do
		user.activity[iter_1_8.key] = var_1_11(var_1_1[iter_1_8.key])

		for iter_1_9, iter_1_10 in pairs(var_1_12) do
			if iter_1_10 == iter_1_8.id then
				user.newActivity[#user.newActivity + 1] = iter_1_10
			end
		end
	end

	eventManager.dispatchEvent("refreshActivityNotice")

	user.player.vipLv = arg_1_0.action.data.player.vipLv

	if user.player.vipLv == 0 then
		if user.player.playerLv >= 10 and user.player.playerLv <= 30 and user.curMainTask.state == 1 then
			user.player.showFirstPayReward = true
		end
	else
		user.player.showFirstPayReward = false
	end

	user.player.showFirstPayReward = false

	local function var_1_13(arg_11_0)
		user.player.firstPayData = arg_11_0.action.data
	end

	cmgr.sendRequest(var_1_13, actions.getFirstPayReward)

	user.hasFirstPayPkg = user.player.vipLv == 0
	user.workerOpen = arg_1_0.action.data.workerOpen or false
	user.harvest = arg_1_0.action.data.harvest or 0
	user.isYw = arg_1_0.action.data.ifYw or false

	if arg_1_0.action.data.catapultRebuilt then
		user.catapultRebuilt = arg_1_0.action.data.catapultRebuilt
	end

	user.activityBulletin = arg_1_0.action.data.activityBulletin or 0

	user.welfare.setWelfare("freeIncenseNum", arg_1_0.action.data.freeIncenseNum or 0)
	user.welfare.setWelfareSimple("dayTrain", arg_1_0.action.data.hasDrillTimes or false)
	user.welfare.setWelfare("marketCanBuyNum", arg_1_0.action.data.marketCanBuyNum or 0)
	user.welfare.setWelfare("displayBlack", arg_1_0.action.data.displayBlack or 0)
	user.welfare.setWelfare("hasSalary", arg_1_0.action.data.hasSalary or false)
	user.welfare.setWelfare("countryRewardNum", arg_1_0.action.data.countryRewardNum or 0)
	user.welfare.setWelfare("onlineNum", arg_1_0.action.data.onlineNum or 0)
	user.welfare.setWelfare("freeQuechingTimes", arg_1_0.action.data.freeQuechingTimes or 0)
	user.welfare.setWelfare("dinnerNum", arg_1_0.action.data.dinnerNum or 0)
	user.welfare.setWelfare("wizardIconType", arg_1_0.action.data.wizardIconType or 0)
	user.welfare.setWelfare("slaveNum", arg_1_0.action.data.slaveNum or 0)
	user.welfare.setWelfare("displayTech", arg_1_0.action.data.displayTech or 0)
	user.welfare.setWelfare("batReward", arg_1_0.action.data.batReward or false)
	user.welfare.setWelfare("challengeReward", arg_1_0.action.data.challengeReward or false)
	user.welfare.setWelfare("stormReward", arg_1_0.action.data.stormReward or false)
	user.welfare.setWelfare("haveDayGift", arg_1_0.action.data.haveDayGift or false)
	user.welfare.setWelfare("topLv", arg_1_0.action.data.topLv or 0)
	user.welfare.setWelfareSimple("canGetOfflineBuff", arg_1_0.action.data.canGetOfflineBuff or 0)
	log.info("response.action.data.challengeReward : ", arg_1_0.action.data.challengeReward)
	log.info("@@结束")
end

return actionHandler
