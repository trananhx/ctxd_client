local var_0_0 = {
	layout = require("lua/layer/kfmg/kfmgNotice/kfmgNoticeLayout")
}

var_0_0.startX = -60
var_0_0.startY = visibleSize.height - 120
var_0_0.iconWidth = 120

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

function var_0_0.onOrderTokenJoin(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(var_0_0.orderTokenList) do
		if iter_4_1.cityId == arg_4_0 then
			table.remove(var_0_0.orderTokenList, iter_4_0)
		end
	end

	var_0_0.updateShow()
	bmgr.enterKfgz(arg_4_0)
end

function var_0_0.onOfficerTokenJoin(arg_5_0)
	log.info("@@ 加入官员令 ", arg_5_0)

	for iter_5_0, iter_5_1 in pairs(var_0_0.officerTokenList) do
		if iter_5_1.cityId == arg_5_0 then
			table.remove(var_0_0.officerTokenList, iter_5_0)
		end
	end

	var_0_0.updateShow()
	bmgr.enterKfgz(arg_5_0)
end

function var_0_0.updateShow()
	if not var_0_0.view.widgets then
		return
	end

	if #var_0_0.orderTokenList == 0 then
		var_0_0.view.widgets.orderTokenButton:setVisible(false)
	else
		var_0_0.view.widgets.orderTokenButton:setVisible(true)
	end

	if #var_0_0.officerTokenList == 0 then
		var_0_0.view.widgets.officerTokenButton:setVisible(false)
	else
		var_0_0.view.widgets.officerTokenButton:setVisible(true)
	end

	if var_0_0.view.widgets then
		local var_6_0 = 1

		for iter_6_0, iter_6_1 in pairs(var_0_0.view.widgets) do
			if iter_6_1:isVisible() then
				local var_6_1 = var_0_0.iconWidth * var_6_0

				iter_6_1:setPosition(ccp(var_0_0.startX + var_6_1, var_0_0.startY))

				var_6_0 = var_6_0 + 1
			end
		end
	end
end

function var_0_0.update(arg_7_0)
	local var_7_0 = false

	for iter_7_0, iter_7_1 in pairs(var_0_0.officerTokenList) do
		if iter_7_1.cd then
			iter_7_1.cd = iter_7_1.cd - arg_7_0 * 1000

			if iter_7_1.cd <= 0 then
				table.remove(var_0_0.officerTokenList, iter_7_0)

				var_7_0 = true
			end
		end
	end

	for iter_7_2, iter_7_3 in pairs(var_0_0.orderTokenList) do
		if iter_7_3.cd then
			iter_7_3.cd = iter_7_3.cd - arg_7_0 * 1000

			if iter_7_3.cd <= 0 then
				table.remove(var_0_0.orderTokenList, iter_7_2)

				var_7_0 = true
			end
		end
	end

	if var_7_0 then
		var_0_0.updateShow()
	end
end

function var_0_0.create(arg_8_0, arg_8_1)
	arg_8_0.showIconNum = 0
	arg_8_0.view = {}
	arg_8_0.generalControl = arg_8_1
	arg_8_0.showList = {}
	arg_8_0.officerTokenList = {}
	arg_8_0.orderTokenList = {}

	uiutil.initLayout(arg_8_0.view, arg_8_0.layout.groupTeamIcon)
	uiutil.initLayout(arg_8_0.view, arg_8_0.layout.orderTokenIcon)
	uiutil.initLayout(arg_8_0.view, arg_8_0.layout.officerTokenIcon)
	arg_8_0.view.widgets.officerTokenButton:addHandleOfControlEvent(var_0_0.onOfficerTokenClick, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.orderTokenButton:addHandleOfControlEvent(var_0_0.onOrderTokenClick, CCControlEventTouchUpInside)
	arg_8_0.view.widgets.groupTeamButton:addHandleOfControlEvent(var_0_0.onGroupteamClick, CCControlEventTouchUpInside)

	arg_8_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_8_0.update, 1, false)

	eventManager.registerEvent("KfgzJoinOrderToken", arg_8_0.onOrderTokenJoin)
	eventManager.registerEvent("KfgzJoinOfficerToken", arg_8_0.onOfficerTokenJoin)
end

function var_0_0.clearup(arg_9_0)
	if arg_9_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_9_0.updateSchedulerEntry)

		arg_9_0.updateSchedulerEntry = nil
	end

	eventManager.unregisterEvent("KfgzJoinOrderToken", arg_9_0.onOrderTokenJoin)
	eventManager.unregisterEvent("KfgzJoinOfficerToken", arg_9_0.onOfficerTokenJoin)
end

function var_0_0.showOfficeToken(arg_10_0, arg_10_1, arg_10_2)
	showTable(arg_10_2)

	for iter_10_0, iter_10_1 in pairs(arg_10_2) do
		table.insert(arg_10_0.officerTokenList, 1, iter_10_1)
	end

	arg_10_0.updateShow()
end

function var_0_0.showOrderToken(arg_11_0, arg_11_1, arg_11_2)
	log.info("@@ 显示征召令 ", arg_11_1)

	for iter_11_0, iter_11_1 in pairs(arg_11_2) do
		table.insert(arg_11_0.orderTokenList, 1, iter_11_1)
	end

	arg_11_0.updateShow()
end

function var_0_0.getGroupTeamInfo(arg_12_0)
	local function var_12_0(arg_13_0)
		local var_13_0 = arg_13_0.data.teamList

		if #var_13_0 == 0 or #var_13_0 == 1 and var_13_0[1].isCreator then
			arg_12_0.view.widgets.groupTeamButton:setVisible(false)
		else
			arg_12_0.view.widgets.groupTeamButton:setVisible(true)
		end

		arg_12_0.updateShow()
	end

	kfcmgr.sendRequest(var_12_0, actions.kfgzGroupTeamInfo)
end

function var_0_0.showGroupTeam(arg_14_0, arg_14_1)
	log.info("@@ 集团军数量 ", arg_14_1)

	if arg_14_1 == 0 then
		arg_14_0.view.widgets.groupTeamButton:setVisible(false)
	else
		arg_14_0:getGroupTeamInfo()
	end

	arg_14_0.updateShow()
end

function var_0_0.setTokenVisible(arg_15_0, arg_15_1)
	if arg_15_1 then
		var_0_0.updateShow()
	else
		if not tolua.isnull(arg_15_0.view.widgets.officerTokenButton) then
			arg_15_0.view.widgets.officerTokenButton:setVisible(arg_15_1)
		end

		if not tolua.isnull(arg_15_0.view.widgets.orderTokenButton) then
			arg_15_0.view.widgets.orderTokenButton:setVisible(arg_15_1)
		end
	end
end

return var_0_0
