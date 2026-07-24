cityWindowControl = {}

local var_0_0 = cityWindowControl

var_0_0.updateSchedulerEntry = nil

function var_0_0.init(arg_1_0)
	var_0_0.inBattle = arg_1_0.inBattle or false
	var_0_0.capitalCityInfo = arg_1_0.capitalCityInfo
	var_0_0.shouMaiInfo = arg_1_0.shouMaiInfo
	var_0_0.battleId = arg_1_0.battleId
	var_0_0.defSide = arg_1_0.defSide
	var_0_0.attSide = arg_1_0.attSide
	var_0_0.cityTrickState = arg_1_0.cityTrickState
end

local function var_0_1(arg_2_0)
	if var_0_0.capitalCityInfo then
		var_0_0.capitalCityInfo.CountDown1 = var_0_0.capitalCityInfo.CountDown1 - 1000
		var_0_0.capitalCityInfo.CountDown2 = var_0_0.capitalCityInfo.CountDown2 - 1000
	end

	if var_0_0.cityTrickState then
		for iter_2_0, iter_2_1 in pairs(var_0_0.cityTrickState) do
			for iter_2_2, iter_2_3 in pairs(iter_2_1.trickState) do
				var_0_0.cityTrickState[iter_2_0].trickState[iter_2_2].protectCd = var_0_0.cityTrickState[iter_2_0].trickState[iter_2_2].protectCd - 1000
				var_0_0.cityTrickState[iter_2_0].trickState[iter_2_2].lastTime = var_0_0.cityTrickState[iter_2_0].trickState[iter_2_2].lastTime - 1000
			end
		end
	end
end

local function var_0_2(arg_3_0)
	require("lua/common/msgTransform")

	arg_3_0 = msgTransform.simpleGeneral2Assemble(arg_3_0, var_0_0.cityId)

	if arg_3_0.action.state ~= 0 then
		var_0_0.gIds = arg_3_0.action.data.gIds

		local var_3_0 = {}
		local var_3_1 = 1

		for iter_3_0, iter_3_1 in pairs(var_0_0.gIds) do
			if tonumber(var_0_0.cityId) ~= generalMoveLayer.generalTable["id_" .. iter_3_1.gId].locationId then
				var_3_0[var_3_1] = iter_3_1
				var_3_1 = var_3_1 + 1
			end
		end

		var_0_0.gIds = var_3_0
	else
		var_0_0.gIds = {}
	end

	cityWindowUI.init()
end

local function var_0_3(arg_4_0)
	if arg_4_0.action.state == 1 then
		var_0_0.init(arg_4_0.action.data)

		if var_0_0.shouMaiInfo and var_0_0.shouMaiInfo.type == 1 then
			smgr.showTipText("国家等级3级才能收买")

			return
		end
	end
end

function var_0_0.getCityDetailInfo(arg_5_0)
	cmgr.sendRequest(var_0_3, actions.cityDetailInfo, arg_5_0)
end

local function var_0_4(arg_6_0)
	if arg_6_0.action.data.msg ~= nil then
		smgr.showTipText(arg_6_0.action.data.msg)
	end

	var_0_0.getCityDetailInfo(var_0_0.cityId)
end

local function var_0_5(arg_7_0, arg_7_1)
	if arg_7_1 ~= nil then
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in pairs(arg_7_1) do
			var_7_0[iter_7_0] = iter_7_1.id
		end

		traceData.createTrace(arg_7_0, var_7_0)
	end
end

local function var_0_6(arg_8_0, arg_8_1)
	local var_8_0 = smgr.getLayer("cityWindowLayer")

	if var_8_0 == nil then
		return true
	end

	if not tool.checkIfTouch(cityWindowUI.uiTable.cityWindowBg, arg_8_0, arg_8_1) then
		var_8_0:removeFromParentAndCleanup(true)
		smgr.unregisterLayer("cityWindowLayer")
	else
		for iter_8_0, iter_8_1 in pairs(var_0_0.gIds) do
			if tool.checkIfTouch(cityWindowUI.uiTable["conveneGeneral_" .. iter_8_0], arg_8_0, arg_8_1) then
				cmgr.sendRequest(function(arg_9_0)
					cmgr.sendRequest(var_0_4, actions.autoMove, var_0_0.cityId, iter_8_1.gId)
				end, actions.autoMoveInfo, var_0_0.cityId, iter_8_1.gId)
			end
		end
	end

	return false
end

local function var_0_7(arg_10_0)
	if arg_10_0.action.state == 1 then
		local var_10_0 = arg_10_0.action.data

		worldControl.manzuInfo = var_10_0.manzuInfo

		var_0_0.getCityDetailInfo(var_0_0.cityId)
		eventManager.dispatchEvent("handlerGetShouMaiInfoAction", arg_10_0)
	end
end

local function var_0_8(arg_11_0)
	if arg_11_0.action.state == 1 then
		cmgr.sendRequest(var_0_7, actions.getManzuShoumaiInfo)
	end
end

function var_0_0.shoumai()
	cmgr.sendRequest(var_0_8, actions.manzuShoumai, var_0_0.cityId)
end

function var_0_0.coverCd()
	if user.chargeItems.coverManzuShoumaiCd.noDisturb then
		cmgr.sendRequest(var_0_8, actions.coverManzuShoumaiCd, var_0_0.cityId)
	else
		cmgr.sendRequest(function(arg_14_0)
			local var_14_0 = arg_14_0.action.data.gold

			require("lua/component/messageBox")
			messageBox.showChargeWin(language.get(200302), language.get(200303, var_14_0), "coverManzuShoumaiCd", function()
				cmgr.sendRequest(var_0_8, actions.coverManzuShoumaiCd, var_0_0.cityId)
			end)
		end, actions.getShoumaiCost)
	end
end

local function var_0_9(arg_16_0)
	cmgr.sendRequest(var_0_8, actions.manzuShoumai, var_0_0.cityId)
end

function var_0_0.fadong()
	cmgr.sendRequest(var_0_9, actions.fadongManzu, var_0_0.cityId)
end

function var_0_0.onEnter()
	eventManager.registerEvent("cityWindowOnTap", var_0_6)

	var_0_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_1, 1, false)
end

function var_0_0.onExit()
	eventManager.unregisterEvent("cityWindowOnTap", var_0_6)

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end
end
