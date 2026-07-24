local var_0_0 = {
	layout = require("lua/layer/kfworld/kfgzNotice/kfgzNoticeLayout")
}

var_0_0.startX = 200
var_0_0.startY = visibleSize.height - 120
var_0_0.iconWidth = 120

function var_0_0.onOfficerTokenClick()
	log.info("@@ 点击官员令")
	showJoinOfficerTokenPanel(false, var_0_0.officerTokenList[1], var_0_0.generalControl.generals)
end

function var_0_0.onOrderTokenClick()
	log.info("@@ 点击征召令")
	showJoinGoldOrderPanel(false, var_0_0.orderTokenList[1], var_0_0.generalControl.generals)
end

function var_0_0.onOrderTokenJoin(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(var_0_0.orderTokenList) do
		if iter_3_1.cityId == arg_3_0 then
			table.remove(var_0_0.orderTokenList, iter_3_0)
		end
	end

	var_0_0.updateShow()
end

function var_0_0.onOfficerTokenJoin(arg_4_0)
	log.info("@@ 加入官员令 ", arg_4_0)

	for iter_4_0, iter_4_1 in pairs(var_0_0.officerTokenList) do
		if iter_4_1.cityId == arg_4_0 then
			table.remove(var_0_0.officerTokenList, iter_4_0)
		end
	end

	var_0_0.updateShow()
end

function var_0_0.resetOrderToken()
	if var_0_0.view then
		var_0_0.view.widgets.orderTokenButton:setVisible(false)
	end
end

function var_0_0.resetOfficerToken()
	if var_0_0.view then
		var_0_0.view.widgets.officerTokenButton:setVisible(false)
	end
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
		local var_7_0 = 1

		for iter_7_0, iter_7_1 in pairs(var_0_0.view.widgets) do
			if iter_7_1:isVisible() then
				local var_7_1 = var_0_0.iconWidth * var_7_0

				iter_7_1:setPosition(ccp(var_0_0.startX + var_7_1, var_0_0.startY))

				var_7_0 = var_7_0 + 1
			end
		end
	end
end

function var_0_0.update(arg_8_0)
	local var_8_0 = false

	for iter_8_0, iter_8_1 in pairs(var_0_0.officerTokenList) do
		local var_8_1 = iter_8_1.action.data

		if var_8_1.time then
			var_8_1.time = var_8_1.time - arg_8_0 * 1000

			if var_8_1.time <= 0 then
				table.remove(var_0_0.officerTokenList, iter_8_0)

				var_8_0 = true
			end
		end
	end

	for iter_8_2, iter_8_3 in pairs(var_0_0.orderTokenList) do
		local var_8_2 = iter_8_3.action.data

		if var_8_2.time then
			var_8_2.time = var_8_2.time - arg_8_0 * 1000

			if var_8_2.time <= 0 then
				table.remove(var_0_0.orderTokenList, iter_8_2)

				var_8_0 = true
			end
		end
	end

	if var_8_0 then
		var_0_0.updateShow()
	end
end

function var_0_0.create(arg_9_0, arg_9_1)
	arg_9_0.showIconNum = 0
	arg_9_0.view = {}
	arg_9_0.generalControl = arg_9_1
	arg_9_0.showList = {}
	arg_9_0.officerTokenList = {}
	arg_9_0.orderTokenList = {}

	uiutil.initLayout(arg_9_0.view, arg_9_0.layout.orderTokenIcon)
	uiutil.initLayout(arg_9_0.view, arg_9_0.layout.officerTokenIcon)
	arg_9_0.view.widgets.officerTokenButton:addHandleOfControlEvent(var_0_0.onOfficerTokenClick, CCControlEventTouchUpInside)
	arg_9_0.view.widgets.orderTokenButton:addHandleOfControlEvent(var_0_0.onOrderTokenClick, CCControlEventTouchUpInside)

	arg_9_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_9_0.update, 1, false)

	eventManager.registerEvent("YwJoinOrderToken", arg_9_0.onOrderTokenJoin)
	eventManager.registerEvent("YwJoinOfficerToken", arg_9_0.onOfficerTokenJoin)
end

function var_0_0.clearup(arg_10_0)
	if arg_10_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_10_0.updateSchedulerEntry)

		arg_10_0.updateSchedulerEntry = nil
	end

	eventManager.unregisterEvent("YwJoinOrderToken", arg_10_0.onOrderTokenJoin)
	eventManager.unregisterEvent("YwJoinOfficerToken", arg_10_0.onOfficerTokenJoin)
end

function var_0_0.showOfficeToken(arg_11_0, arg_11_1, arg_11_2)
	showTable(arg_11_2)

	for iter_11_0, iter_11_1 in pairs(arg_11_2) do
		table.insert(arg_11_0.officerTokenList, 1, iter_11_1)
	end

	arg_11_0.updateShow()
end

function var_0_0.showOrderToken(arg_12_0, arg_12_1, arg_12_2)
	log.info("@@ 显示征召令 ", arg_12_1)

	for iter_12_0, iter_12_1 in pairs(arg_12_2) do
		table.insert(arg_12_0.orderTokenList, 1, iter_12_1)
	end

	arg_12_0.updateShow()
end

return var_0_0
