require("lua/common/tool")

technologyListControl = {}
technologyListControl.techData = {}

local var_0_0 = technologyListControl

var_0_0.isLoading = false

local var_0_1
local var_0_2 = false
local var_0_3 = true
local var_0_4 = {}

var_0_0.currentLoadingIndex = 1
var_0_0.totalPage = 1

local var_0_5 = 0
local var_0_6

function var_0_0.initControl(arg_1_0)
	return
end

function getPageByIndex(arg_2_0)
	return var_0_0.techData[var_0_1].page
end

function getUpdateRangeByIndex(arg_3_0)
	local var_3_0
	local var_3_1
	local var_3_2 = (getPageByIndex(arg_3_0) - 1) * 8 + 1

	if var_0_0.totalPage == getPageByIndex(arg_3_0) then
		var_3_0 = #var_0_0.techData
	else
		var_3_0 = getPageByIndex(arg_3_0) * 8
	end

	return var_3_2, var_3_0
end

function handlerTechnologyCdRecoverAction(arg_4_0)
	if arg_4_0.action.state == 1 then
		if user.chargeItems.techCd.noDisturb then
			cmgr.sendRequest(handlerTechnologyCdRecoverConfirmAction, actions.technologyCdRecoverConfirm, var_0_0.techData[var_0_1].techId)
		else
			messageBox.showChargeWin(language.get(10003), language.get(50006, arg_4_0.action.data.gold), "techCd", function()
				cmgr.sendRequest(handlerTechnologyCdRecoverConfirmAction, actions.technologyCdRecoverConfirm, var_0_0.techData[var_0_1].techId)
			end)
		end
	end
end

function handlerTechnologyCdRecoverConfirmAction(arg_6_0)
	if arg_6_0.action.state == 1 then
		technologyListControl.techData[var_0_1].status = technologyListConstant.TECH_STATUS_EFFECTED

		updateTechnologyCell(var_0_0.techData[var_0_1], var_0_1)
	end
end

function handlerTechnologyResearchAction(arg_7_0)
	if arg_7_0.action.state == 1 then
		log.debug("开始研究")
		cmgr.sendRequest(handlerTechnologyGetInfoAction, actions.technologyGetInfo, getPageByIndex(var_0_1))
	end
end

local function var_0_7()
	if var_0_0.currentLoadingIndex < #var_0_0.techData then
		var_0_0.currentLoadingIndex = var_0_0.currentLoadingIndex + 1

		updateTechnologyCell(var_0_0.techData[var_0_0.currentLoadingIndex], var_0_0.currentLoadingIndex)
		log.debug("should load more", var_0_0.currentLoadingIndex)
	elseif var_0_6 then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_6)

		var_0_6 = nil
	end
end

function handlerTechnologyGetInfoAction(arg_9_0)
	if arg_9_0.action.state == 1 then
		local var_9_0 = copy(arg_9_0.action.data.techs)

		arg_9_0.action.data.techs = {}

		for iter_9_0 = 1, #var_9_0 do
			if var_9_0[iter_9_0].pic ~= "juexing" then
				var_9_0[iter_9_0].page = arg_9_0.action.data.currentPage

				table.insert(arg_9_0.action.data.techs, var_9_0[iter_9_0])
			end
		end

		if var_0_3 then
			log.debug("technology get info begin ===>")

			if arg_9_0.action.data.currentPage == 1 then
				local var_9_1 = 5

				var_0_4 = {}

				if var_9_1 > #arg_9_0.action.data.techs then
					var_9_1 = #arg_9_0.action.data.techs
				end

				for iter_9_1 = 1, var_9_1 do
					var_0_4[#var_0_4 + 1] = arg_9_0.action.data.techs[iter_9_1]
				end

				var_0_0.currentLoadingIndex = var_9_1
			end

			var_0_0.totalPage = arg_9_0.action.data.totalPage

			if arg_9_0.action.data.currentPage ~= arg_9_0.action.data.totalPage then
				log.debug("page:", arg_9_0.action.data.currentPage)

				for iter_9_2 = 1, #arg_9_0.action.data.techs do
					technologyListControl.techData[#technologyListControl.techData + 1] = arg_9_0.action.data.techs[iter_9_2]
				end

				log.debug("table page :　" .. arg_9_0.action.data.currentPage .. "  totalPage : " .. arg_9_0.action.data.totalPage)
				var_0_0.technologyGetInfo(arg_9_0.action.data.currentPage + 1)
			else
				log.debug("page:", arg_9_0.action.data.currentPage)

				for iter_9_3 = 1, #arg_9_0.action.data.techs do
					technologyListControl.techData[#technologyListControl.techData + 1] = arg_9_0.action.data.techs[iter_9_3]
				end

				log.debug("render begin...")

				var_0_0.curre = 1

				createTechnologyList(var_0_4)
				log.debug("render end.")

				var_0_3 = false

				log.debug("table length : " .. #technologyListControl.techData)

				var_0_6 = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_7, 0.1, false)
			end

			log.debug("get info action successed")
		else
			local var_9_2 = var_0_0.techData[var_0_1].techId

			for iter_9_4 = 1, #arg_9_0.action.data.techs do
				if var_9_2 == arg_9_0.action.data.techs[iter_9_4].techId then
					var_0_0.techData[var_0_1] = copy(arg_9_0.action.data.techs[iter_9_4])

					updateTechnologyCell(var_0_0.techData[var_0_1], var_0_1)

					break
				end
			end
		end
	end
end

function handlerTechnologyInvestAction(arg_10_0)
	if arg_10_0.action.state == 1 then
		log.debug("注资成功")

		var_0_0.techData[var_0_1].num = arg_10_0.action.data.num

		if var_0_0.techData[var_0_1].num == arg_10_0.action.data.total then
			var_0_0.techData[var_0_1].status = technologyListConstant.TECH_STATUS_READY

			log.debug("ready for research")
			flyTextToPositionInScreen(visibleSize.width * 0.5, visibleSize.height * 0.5)
		end

		updateTechnologyCell(var_0_0.techData[var_0_1], var_0_1)
	end
end

function var_0_0.technologyGetInfo(arg_11_0)
	log.debug("should send network request: get techs")
	cmgr.sendRequest(handlerTechnologyGetInfoAction, actions.technologyGetInfo, arg_11_0)
end

function var_0_0.technologyInvest(arg_12_0, arg_12_1)
	log.debug("should send network request: do inveset")

	var_0_1 = arg_12_1

	cmgr.sendRequest(handlerTechnologyInvestAction, actions.technologyInvest, arg_12_0)
end

function var_0_0.technologyResearch(arg_13_0, arg_13_1)
	log.debug("should send network request: do research")

	var_0_1 = arg_13_1

	cmgr.sendRequest(handlerTechnologyResearchAction, actions.technologyResearch, arg_13_0)
end

function var_0_0.technologyCdRecover(arg_14_0, arg_14_1)
	log.debug("should send network request: do CdRecover")

	var_0_1 = arg_14_1

	if user.chargeItems.techCd.noDisturb then
		cmgr.sendRequest(handlerTechnologyCdRecoverConfirmAction, actions.technologyCdRecoverConfirm, arg_14_0)
	else
		cmgr.sendRequest(handlerTechnologyCdRecoverAction, actions.technologyCdRecover, arg_14_0)
	end
end

function var_0_0.technologyCdRecoverConfirm(arg_15_0, arg_15_1)
	log.debug("should send network request: do technologyCdRecoverConfirm")

	var_0_1 = arg_15_1

	cmgr.sendRequest(handlerTechnologyCdRecoverConfirmAction, actions.technologyCdRecoverConfirm, arg_15_0)
end

local function var_0_8(arg_16_0, arg_16_1)
	log.debug("touch end  at " .. arg_16_0 .. ", " .. arg_16_1)

	if technologyListUI.uiTable.technologyList then
		for iter_16_0 = 1, #technologyListControl.techData do
			if tool.checkIfTouch(technologyListUI.uiTable["technologyCell" .. iter_16_0], arg_16_0, arg_16_1) then
				log.debug("cell " .. iter_16_0 .. "touched")

				if technologyListControl.techData[iter_16_0].status == technologyListConstant.TECH_STATUS_OPENED or technologyListControl.techData[iter_16_0].status == technologyListConstant.TECH_STATUS_INVESTED then
					onTechCellButtonTap(iter_16_0)
				end
			end
		end
	end
end

local function var_0_9(arg_17_0, arg_17_1)
	return
end

local var_0_10 = 0

function var_0_0.onTouch(arg_18_0, arg_18_1, arg_18_2)
	log.debug("touched  at " .. arg_18_1 .. ", " .. arg_18_2)

	if arg_18_0 == CCTOUCHBEGAN then
		var_0_10 = arg_18_2

		return true
	elseif arg_18_0 == CCTOUCHMOVED then
		var_0_2 = true

		return true
	elseif arg_18_0 == CCTOUCHENDED then
		log.debug("touched end ")

		if not var_0_2 or math.abs(var_0_10 - arg_18_2) < 20 then
			var_0_8(arg_18_1, arg_18_2)
		end

		var_0_2 = false

		return true
	end
end

function var_0_0.onEnter()
	var_0_3 = true
	technologyListControl.techData = {}

	eventManager.registerEvent("scrollViewShouldLoadMore", var_0_7)
end

function var_0_0.onExit()
	log.debug("control on exit")
	eventManager.unregisterEvent("scrollViewShouldLoadMore", var_0_7)

	if var_0_6 then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_6)
	end
end
