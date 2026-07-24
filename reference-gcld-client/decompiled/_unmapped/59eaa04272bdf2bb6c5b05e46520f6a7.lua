require("lua/common/tool")
require("lua/component/messageBox")

tradeControl = {}

local var_0_0 = tradeControl

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	return
end

function var_0_0.tradeGetTradeInfo()
	var_0_0.isChangeImediate = {}

	for iter_3_0 = 1, 5 do
		var_0_0.isChangeImediate[iter_3_0] = 0
	end

	local function var_3_0(arg_4_0)
		local var_4_0 = {}

		for iter_4_0 = 1, #arg_4_0.action.data.myTrades do
			var_4_0[tonumber(arg_4_0.action.data.myTrades[iter_4_0].id)] = arg_4_0.action.data.myTrades[iter_4_0]
		end

		arg_4_0.action.data.myTrades = var_4_0

		tradeUI.updateTradeUi(arg_4_0.action.data)
	end

	cmgr.sendRequest(var_3_0, actions.tradeGetTradeInfo)
end

function var_0_0.tradeInvest(arg_5_0)
	local function var_5_0(arg_6_0)
		var_0_0.tradeGetTradeInfo()
	end

	if var_0_0.isChangeImediate[arg_5_0] ~= 1 then
		cmgr.sendRequest(var_5_0, actions.tradeInvest, arg_5_0)
	else
		var_0_0.silkTrade(arg_5_0)
	end
end

function var_0_0.tradeGetReward(arg_7_0)
	local function var_7_0(arg_8_0)
		tradeUI.afterGetRewardEffect(arg_7_0, arg_8_0.action.data.pic)
	end

	cmgr.sendRequest(var_7_0, actions.tradeGetReward, arg_7_0)
end

function var_0_0.silkTrade(arg_9_0)
	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0.action.data
		local var_10_1 = {}
		local var_10_2 = {}

		if var_10_0.gainType == 7 then
			var_10_2.id = 55
		elseif var_10_0.gainType == 10 then
			var_10_2.id = 216
		end

		var_10_2.value = var_10_0.gainValue

		table.insert(var_10_1, var_10_2)
		globalAction_gotResource(var_10_1)
		var_0_0.tradeGetTradeInfo()
	end

	cmgr.sendRequest(var_9_0, actions.silkTrade, arg_9_0)
end
