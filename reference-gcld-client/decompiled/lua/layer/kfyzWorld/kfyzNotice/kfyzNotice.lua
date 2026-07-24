local var_0_0 = {
	layout = require("lua/layer/kfyzWorld/kfyzNotice/kfyzNoticeLayout")
}

var_0_0.startX = 154
var_0_0.startY = visibleSize.height - 110
var_0_0.iconWidth = 120

function var_0_0.clickJiaoZhen()
	eventManager.dispatchEvent("KfSeeChampionCity")
end

function var_0_0.clickYingZhan()
	smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFYZ_JIAOZHEN, {
		teamId = var_0_0.jiaozhen.championBattleId
	})
end

function var_0_0.clickLeiZhu()
	eventManager.dispatchEvent("moveToCity", var_0_0.jiaozhen.chamArenas[1], true, nil, nil, true)
end

function var_0_0.onOfficerTokenClick()
	log.info("@@ 点击官员令")
	showJoinOfficerTokenPanel(true, var_0_0.officerTokenList[1], var_0_0.generalControl.generals)
end

function var_0_0.onOrderTokenClick()
	log.info("@@ 点击征召令")
	showJoinGoldOrderPanel(true, var_0_0.orderTokenList[1], var_0_0.generalControl.generals)
end

function var_0_0.onGroupteamClick()
	log.info("@@ 点击集团军")
	require("lua/game/battle/widget/showJoinTeamPanel")
	showJoinTeamPanel(true, var_0_0.generalControl.generals)
end

function var_0_0.clickCorps()
	local function var_7_0(arg_8_0)
		local var_8_0 = smgr.getLayer("topLayer")

		require("lua/layer/corps/CorpsPanelNew").new(var_8_0, arg_8_0.data, 0)
	end

	kfcmgr.sendRequest(var_7_0, actions.getCorpsInfo, 0, 0)
end

function var_0_0.clickFightBack()
	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.data

		if var_10_0.phantomMp and #var_10_0.phantomMp > 0 then
			var_0_0.currentIndex = var_0_0.currentIndex and var_0_0.currentIndex + 1 or 1

			local var_10_1 = 0

			for iter_10_0, iter_10_1 in pairs(var_10_0.phantomMp) do
				var_10_1 = iter_10_1.cityId
			end

			if var_0_0.currentIndex > #var_10_0.phantomMp then
				var_0_0.currentIndex = 1
			end

			local var_10_2 = var_10_0.phantomMp[var_0_0.currentIndex] and var_10_0.phantomMp[var_0_0.currentIndex].cityId or var_10_1

			eventManager.dispatchEvent("moveToCity", var_10_2, true, false, 0.5)
			eventManager.dispatchEvent("showFightBackPic", var_10_2)
		else
			user.fightBackTokenIcon = false

			var_0_0.updateShow()
			roleDialogue.control.loadSpeak("fightBack")
		end
	end

	kfcmgr.sendRequest(var_9_0, actions.getFBTujinResult)
end

function var_0_0.onOrderTokenJoin(arg_11_0)
	for iter_11_0 = #var_0_0.orderTokenList, 1, -1 do
		if var_0_0.orderTokenList[iter_11_0].cityId == arg_11_0 then
			table.remove(var_0_0.orderTokenList, iter_11_0)
		end
	end

	var_0_0.updateShow()
end

function var_0_0.onOfficerTokenJoin(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(var_0_0.officerTokenList) do
		if iter_12_1.cityId == arg_12_0 then
			table.remove(var_0_0.officerTokenList, iter_12_0)
		end
	end

	var_0_0.updateShow()
end

function var_0_0.updateShow()
	if not var_0_0.view.widgets then
		return
	end

	var_0_0.view.widgets.orderTokenButton:setVisible(#var_0_0.orderTokenList ~= 0)
	var_0_0.view.widgets.officerTokenButton:setVisible(#var_0_0.officerTokenList ~= 0)
	var_0_0.updateIconJiaoZhen(var_0_0.jiaozhen.hasEnemy, var_0_0.jiaozhen.championBattleId ~= nil and var_0_0.jiaozhen.championBattleId ~= "", var_0_0.jiaozhen.chamArenas and #var_0_0.jiaozhen.chamArenas > 0)
	var_0_0.view.widgets.corpsButton:setVisible(user.kfDonationState == true)
	var_0_0.view.widgets.fightBackButton:setVisible(user.fightBackTokenIcon ~= nil and user.fightBackTokenIcon == true)

	if var_0_0.view.widgets then
		local var_13_0 = 1
		local var_13_1 = {
			"groupTeamButton",
			"orderTokenButton",
			"officerTokenButton",
			"jiaozhenButton",
			"yingzhanButton",
			"leizhuButton",
			"corpsButton",
			"fightBackButton"
		}

		for iter_13_0, iter_13_1 in ipairs(var_13_1) do
			local var_13_2 = var_0_0.view.widgets[iter_13_1]

			if var_13_2:isVisible() then
				local var_13_3 = var_0_0.iconWidth * var_13_0

				var_13_2:setPosition(ccp(var_0_0.startX + var_13_3, var_0_0.startY))

				var_13_0 = var_13_0 + 1
			end
		end
	end
end

function var_0_0.update(arg_14_0)
	local var_14_0 = false

	for iter_14_0, iter_14_1 in pairs(var_0_0.officerTokenList) do
		if iter_14_1.cd then
			iter_14_1.cd = iter_14_1.cd - arg_14_0 * 1000

			if iter_14_1.cd <= 0 then
				table.remove(var_0_0.officerTokenList, iter_14_0)

				var_14_0 = true
			end
		end
	end

	for iter_14_2, iter_14_3 in pairs(var_0_0.orderTokenList) do
		if iter_14_3.cd then
			iter_14_3.cd = iter_14_3.cd - arg_14_0 * 1000

			if iter_14_3.cd <= 0 then
				table.remove(var_0_0.orderTokenList, iter_14_2)

				var_14_0 = true
			end
		end
	end

	if var_14_0 then
		var_0_0.updateShow()
	end
end

function var_0_0.handlerFightBack(arg_15_0, arg_15_1)
	if arg_15_1.data.all then
		user.fightBackTokenIcon = true

		var_0_0.updateShow()
	end
end

function var_0_0.fightBackTokenIconUpdate()
	var_0_0.updateShow()
end

function var_0_0.setVisible(arg_17_0)
	local var_17_0 = eventManager.dispatchEvent("kfyzPlayerInfoIsOpen")
	local var_17_1 = eventManager.dispatchEvent("kfyzMapIsOpen")

	if arg_17_0 and (var_17_0 or var_17_1) then
		return
	end

	var_0_0.view.widgets.node_icon:setVisible(arg_17_0)
end

function var_0_0.create(arg_18_0, arg_18_1)
	var_0_0.jiaozhen = {}
	arg_18_0.showIconNum = 0
	arg_18_0.view = {}
	arg_18_0.generalControl = arg_18_1
	arg_18_0.showList = {}
	arg_18_0.officerTokenList = {}
	arg_18_0.orderTokenList = {}

	uiutil.initLayout(arg_18_0.view, arg_18_0.layout.groupTeamIcon)
	arg_18_0.view.widgets.officerTokenButton:addHandleOfControlEvent(var_0_0.onOfficerTokenClick, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.orderTokenButton:addHandleOfControlEvent(var_0_0.onOrderTokenClick, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.groupTeamButton:addHandleOfControlEvent(var_0_0.onGroupteamClick, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.yingzhanButton:addHandleOfControlEvent(var_0_0.clickYingZhan, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.leizhuButton:addHandleOfControlEvent(var_0_0.clickLeiZhu, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.jiaozhenButton:addHandleOfControlEvent(var_0_0.clickJiaoZhen, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.corpsButton:addHandleOfControlEvent(var_0_0.clickCorps, CCControlEventTouchUpInside)
	arg_18_0.view.widgets.fightBackButton:addHandleOfControlEvent(var_0_0.clickFightBack, CCControlEventTouchUpInside)

	arg_18_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_18_0.update, 1, false)

	eventManager.registerEvent("KfgzJoinOrderToken", arg_18_0.onOrderTokenJoin)
	eventManager.registerEvent("KfgzJoinOfficerToken", arg_18_0.onOfficerTokenJoin)
	eventManager.registerEvent("kfyzNoticeSetVisible", arg_18_0.setVisible)
	eventManager.registerEvent("KfPushJiaoZhenIcon", arg_18_0.handleJiaoZhenIcon)
	eventManager.registerEvent("fightBackTokenIconUpdate", arg_18_0.fightBackTokenIconUpdate)

	arg_18_0.handlerFightBackRef = handler(arg_18_0, arg_18_0.handlerFightBack)

	kfcmgr.registerResponseHandler(actions.pushFightBack, arg_18_0.handlerFightBackRef)
end

function var_0_0.clearup(arg_19_0)
	if arg_19_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_19_0.updateSchedulerEntry)

		arg_19_0.updateSchedulerEntry = nil
	end

	eventManager.unregisterEvent("KfgzJoinOrderToken", arg_19_0.onOrderTokenJoin)
	eventManager.unregisterEvent("KfgzJoinOfficerToken", arg_19_0.onOfficerTokenJoin)
	eventManager.unregisterEvent("kfyzNoticeSetVisible", arg_19_0.setVisible)
	eventManager.unregisterEvent("KfPushJiaoZhenIcon", arg_19_0.handleJiaoZhenIcon)
	eventManager.unregisterEvent("fightBackTokenIconUpdate", arg_19_0.fightBackTokenIconUpdate)
	kfcmgr.unregisterResponseHandler(actions.pushFightBack, arg_19_0.handlerFightBackRef)
end

function var_0_0.updateIconJiaoZhen(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_0 then
		var_0_0.view.widgets.jiaozhenButton:setVisible(true)
	else
		var_0_0.view.widgets.jiaozhenButton:setVisible(false)
	end

	if arg_20_1 then
		var_0_0.view.widgets.yingzhanButton:setVisible(true)
	else
		var_0_0.view.widgets.yingzhanButton:setVisible(false)
	end

	if arg_20_2 then
		var_0_0.view.widgets.leizhuButton:setVisible(true)
	else
		var_0_0.view.widgets.leizhuButton:setVisible(false)
	end
end

function var_0_0.handleJiaoZhenIcon(arg_21_0)
	var_0_0.updateIconJiaoZhen(false, false, false)

	local var_21_0

	if arg_21_0.hasEnemy ~= nil then
		var_0_0.jiaozhen.hasEnemy = arg_21_0.hasEnemy
		var_21_0 = true
	end

	if arg_21_0.battleId then
		var_0_0.jiaozhen.championBattleId = arg_21_0.battleId
		var_21_0 = true
	end

	if arg_21_0.chamArenas then
		var_0_0.jiaozhen.chamArenas = arg_21_0.chamArenas
		var_21_0 = true
	end

	if var_21_0 then
		var_0_0.updateShow()
	end
end

function var_0_0.showOfficeToken(arg_22_0, arg_22_1, arg_22_2)
	for iter_22_0, iter_22_1 in pairs(arg_22_2) do
		table.insert(arg_22_0.officerTokenList, 1, iter_22_1)
	end

	arg_22_0.updateShow()
end

function var_0_0.showOrderToken(arg_23_0, arg_23_1, arg_23_2)
	log.info("@@ 显示征召令 ", arg_23_1)

	for iter_23_0, iter_23_1 in pairs(arg_23_2) do
		table.insert(arg_23_0.orderTokenList, 1, iter_23_1)
	end

	arg_23_0.updateShow()
end

function var_0_0.getGroupTeamInfo(arg_24_0)
	local function var_24_0(arg_25_0)
		local var_25_0 = arg_25_0.data.teamList

		if #var_25_0 == 0 or #var_25_0 == 1 and var_25_0[1].isCreator then
			arg_24_0.view.widgets.groupTeamButton:setVisible(false)
		else
			arg_24_0.view.widgets.groupTeamButton:setVisible(true)
		end

		arg_24_0.updateShow()
	end
end

function var_0_0.showGroupTeam(arg_26_0, arg_26_1)
	log.info("@@ 集团军数量 ", arg_26_1)

	if arg_26_1 == 0 then
		arg_26_0.view.widgets.groupTeamButton:setVisible(false)
	else
		arg_26_0:getGroupTeamInfo()
	end

	arg_26_0.updateShow()
end

function var_0_0.showCrops(arg_27_0)
	arg_27_0.updateShow()
end

return var_0_0
