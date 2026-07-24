local var_0_0 = class("kfmgRewardControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.refreshData(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data

		log.info("奖励界面")
		showTable(var_3_0)
		arg_2_0.ui:initData(var_3_0)
	end

	cmgr.sendRequest(var_2_0, actions.getKfmgShowTipsInfo)
end

function var_0_0.getReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = arg_5_0.data or arg_5_0.action.data

		log.info("领取奖励")
		showTable(var_5_0)

		local var_5_1 = {}

		for iter_5_0 = 1, #var_5_0.reward do
			local var_5_2 = var_5_0.reward[iter_5_0]
			local var_5_3 = var_5_2.type

			if var_5_2.type == 5 then
				var_5_3 = 6
			elseif var_5_2.type == 42 then
				var_5_3 = 5
			end

			var_5_1[iter_5_0] = {}
			var_5_1[iter_5_0].id = var_5_3
			var_5_1[iter_5_0].value = var_5_2.value
		end

		globalAction_gotResource(var_5_1)
		arg_4_0.ui:refreshUi()
	end

	cmgr.sendRequest(var_4_0, actions.getFinalReward)
end

return var_0_0
