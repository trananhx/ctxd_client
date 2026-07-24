user = {}

function user.clearup()
	for iter_1_0, iter_1_1 in pairs(user) do
		if type(iter_1_1) ~= "function" then
			user[iter_1_0] = nil
		end
	end
end

function user.init()
	log.info("@@@ 初始化用户数据")
	user.clearup()

	user.isLogin = false
	user.haveShareReward = 0
	user.shareRewardWoodNum = 0
	user.shareRewardTask = {}
	user.jiaozhen = {}
	user.player = {}
	user.player.kfGenerals = nil
	user.player.vId = ""
	user.player.chatMessageList = {}
	user.player.id = 0
	user.player.name = ""
	user.player.pkey = nil
	user.player.nowOfficer = language.get(141001)
	user.player.pic = 0
	user.player.vipLv = 0
	user.player.showFirstPayReward = false
	user.player.areaId = 0
	user.player.gold = 0
	user.player.wood = 0
	user.player.copper = 0
	user.player.food = 0
	user.player.iron = 0
	user.player.copperOutput = 0
	user.player.copperMax = 0
	user.player.woodOutput = 0
	user.player.woodMax = 0
	user.player.foodOutput = 0
	user.player.foodMax = 0
	user.player.ironOutput = 0
	user.player.ironMax = 0
	user.player.playerLv = 0
	user.player.forceId = 1
	user.player.exp = 0
	user.player.expNeed = 1
	user.player.gemKit = false
	user.player.gonghe = 0
	user.player.havePayRedBagActivity = false
	user.player.maxKitExp = 1
	user.player.curKitExp = 0
	user.player.isTrainning = false
	user.player.countryRewardNum = 0
	user.player.guideId = 2
	user.player.hasNewMail = false
	user.player.isFirstTimeShowTask = true
	user.player.task = nil
	user.player.inPveBattle = false
	user.player.inOccupyBattle = false
	user.corpsAction = {}
	user.corpsInfo = {}
	user.kfCorpsAction = {}
	user.kfCorpsInfo = {}
	user.hasVipPrivilege = false
	user.shouldShowVipPrivilege = false
	user.curTask = nil
	user.autoBattleTechGain = false
	user.autoBattleCityId = nil
	user.curMainTask = nil
	user.curBranchTask = nil
	user.curNationTask = nil
	user.curTryTask = nil
	user.curProtectTask = nil
	user.NationData = {}
	user.worldData = {}
	user.ywData = {}
	user.activityData = {}
	user.kflqData = {}
	user.kfnzData = {}
	user.mojia = {}
	user.inkfwd = 0
	user.kfRoadId = 0
	user.haveInvite = 0
	user.inbstask = false
	user.bstaskMinLevel = 28
	user.kfyz = {}
	user.welfare = {}
	user.welfare.freeIncenseNum = 0
	user.welfare.dayTrain = false
	user.welfare.marketCanBuyNum = 0
	user.welfare.displayBlack = 0
	user.welfare.hasSalary = false
	user.welfare.countryRewardNum = 0
	user.welfare.onlineNum = 0
	user.welfare.freeQuechingTimes = 0
	user.welfare.dinnerNum = 0
	user.welfare.wizardIconType = 0
	user.welfare.slaveNum = 0
	user.welfare.displayTech = 0
	user.welfare.batReward = false
	user.welfare.challengeReward = false
	user.welfare.stormReward = false
	user.welfare.haveDayGift = false
	user.welfare.topLv = 0
	user.welfare.canGetOfflineBuff = 0

	function user.welfare.setWelfare(arg_3_0, arg_3_1)
		local var_3_0 = {}

		var_3_0.freeIncenseNum = 16
		var_3_0.marketCanBuyNum = 27
		var_3_0.displayBlack = 43
		var_3_0.hasSalary = 14
		var_3_0.countryRewardNum = 53
		var_3_0.onlineNum = 39
		var_3_0.freeQuechingTimes = 51
		var_3_0.dinnerNum = 33
		var_3_0.wizardIconType = 64
		var_3_0.slaveNum = 52
		var_3_0.displayTech = 19
		var_3_0.batReward = 32
		var_3_0.challengeReward = 32
		var_3_0.stormReward = 32
		var_3_0.haveDayGift = 38
		var_3_0.topLv = 0

		local var_3_1 = {}

		var_3_1.hasSalary = true
		var_3_1.batReward = true
		var_3_1.challengeReward = true
		var_3_1.stormReward = true
		var_3_1.haveDayGift = true

		if var_3_0[arg_3_0] then
			if user.getFunc(var_3_0[arg_3_0]) then
				if arg_3_1 then
					user.welfare[arg_3_0] = arg_3_1
				elseif var_3_1[arg_3_0] then
					user.welfare[arg_3_0] = false
				else
					user.welfare[arg_3_0] = 0
				end
			else
				log.info("function ", arg_3_0, "not aviliable")

				if var_3_1[arg_3_0] then
					user.welfare[arg_3_0] = false
				else
					user.welfare[arg_3_0] = 0
				end
			end
		end

		eventManager.dispatchEvent("welfareValueDidChanged")
	end

	function user.welfare.setWelfareSimple(arg_4_0, arg_4_1)
		user.welfare[arg_4_0] = arg_4_1

		eventManager.dispatchEvent("welfareValueDidChanged")
		log.info("set value : ", arg_4_1)
	end

	user.noticeList = {}
	user.noticeList.onlineNum = nil
	user.noticeList.haveDayGift = nil
	user.sesionId = "tool.spriteToGray"
	user.functions = ""
	user.chargeItems = {}
	user.confirmItems = {}
	user.settings = {}
	user.settings.isCharacterLayerDisplayed = false
	user.battleSetting = {}
	user.battleSetting.changeSceneWhenSolo = nil
	user.is_enter_jiuguan_wujiang = true

	if CCUserDefault:sharedUserDefault():getIntegerForKey("SETTTING_NOT_SAVED") == 0 then
		CCUserDefault:sharedUserDefault():setIntegerForKey("SETTTING_NOT_SAVED", 1)
		CCUserDefault:sharedUserDefault():setDoubleForKey("EFFECT_VOLUME", 1)
		CCUserDefault:sharedUserDefault():setDoubleForKey("MUSIC_VOLUME", 1)
		CCUserDefault:sharedUserDefault():setIntegerForKey("EFFECT_MUTE", 1)
		CCUserDefault:sharedUserDefault():setIntegerForKey("MUSIC_MUTE", 1)
		CCUserDefault:sharedUserDefault():setIntegerForKey("SWITCH_SCENE", 0)
	end

	if CCUserDefault:sharedUserDefault():getIntegerForKey("SWITCH_SCENE") == 1 then
		user.battleSetting.changeSceneWhenSolo = true
	else
		user.battleSetting.changeSceneWhenSolo = false
	end

	user.canZhouYuJueXing = true
	user.lookActivityTip = true
	user.dragonBoatFour = true
	user.dragonBoatTen = true
	user.dragonBoatBuySailor = true
	user.dragonBoatHitDrum = true
	user.forceIdToName = {
		language.get(95016),
		language.get(95017),
		language.get(95018),
		[101] = language.get("85037_sunc"),
		[102] = language.get("85038_sunc"),
		[103] = language.get("85039_sunc"),
		[104] = language.get("85040_sunc")
	}
end

function user.getFunc(arg_5_0)
	arg_5_0 = arg_5_0 + 1

	return string.sub(user.functions, arg_5_0, arg_5_0) == "1"
end

function user.isNewFuncOpen(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2 = arg_6_2 + 1

	local var_6_0 = string.sub(arg_6_0, arg_6_2, arg_6_2)
	local var_6_1 = string.sub(arg_6_1, arg_6_2, arg_6_2)

	if var_6_0 == "0" and var_6_1 == "1" then
		return true
	end

	return false
end

function user.isOpenWenguan()
	if user.getFunc(1) == true or user.getFunc(44) or user.getFunc(50) or user.getFunc(55) then
		return true
	end

	return false
end

function user.setFunctionData(arg_8_0)
	if user.functions ~= "" then
		log.debug("luxiaodong function old " .. tostring(user.functions))
		log.debug("luxiaodong function new " .. tostring(arg_8_0))

		local var_8_0 = {}

		var_8_0[3] = 10
		var_8_0[4] = 140
		var_8_0[20] = 70
		var_8_0[21] = 130
		var_8_0[22] = 150
		var_8_0[27] = 290
		var_8_0[29] = 250
		var_8_0[31] = 260
		var_8_0[33] = 220
		var_8_0[34] = 470
		var_8_0[36] = 40
		var_8_0[39] = 270
		var_8_0[43] = 280
		var_8_0[46] = 570
		var_8_0[52] = 1341
		var_8_0[64] = 1342
		var_8_0[80] = 1545
		var_8_0[93] = 10093

		local var_8_1 = -1

		for iter_8_0 = 1, #arg_8_0 do
			if user.isNewFuncOpen(user.functions, arg_8_0, iter_8_0) then
				local var_8_2 = var_8_0[iter_8_0]

				if var_8_2 then
					var_8_1 = var_8_2
				end

				if var_8_1 ~= -1 then
					eventManager.dispatchEvent("role_dialogue_speak", var_8_1)

					if iter_8_0 == 93 then
						require("lua/layer/weaponTab/ui")
						weaponTab.ui.show(4)
					end

					break
				end
			end
		end
	end

	if guide.constant.other[1] == false then
		guide.constant.other[1] = user.isNewFuncOpen(user.functions, arg_8_0, 21)
	end

	if guide.constant.city[2] == false then
		guide.constant.city[2] = user.isNewFuncOpen(user.functions, arg_8_0, 5)
	end

	if guide.constant.city[3] == false then
		guide.constant.city[3] = user.isNewFuncOpen(user.functions, arg_8_0, 6)
	end

	if guide.constant.city[4] == false then
		guide.constant.city[4] = user.isNewFuncOpen(user.functions, arg_8_0, 7)
	end

	if guide.constant.city[5] == false then
		guide.constant.city[5] = user.isNewFuncOpen(user.functions, arg_8_0, 8)
	end

	if guide.constant.city[6] == false then
		guide.constant.city[6] = user.isNewFuncOpen(user.functions, arg_8_0, 14)
	end

	if guide.constant.area[2] == false then
		guide.constant.area[2] = user.isNewFuncOpen(user.functions, arg_8_0, 9)
	end

	if guide.constant.area[3] == false then
		guide.constant.area[3] = user.isNewFuncOpen(user.functions, arg_8_0, 10)
	end

	user.functions = arg_8_0

	menuUI.ui.updateFunc()
end

return user
