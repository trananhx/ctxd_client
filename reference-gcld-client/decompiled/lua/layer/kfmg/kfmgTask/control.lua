local var_0_0 = class("kfmgTaskControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.refreshData(arg_2_0)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.data or arg_3_0.action.data

		log.info("任务界面")
		showTable(var_3_0)
		arg_2_0.ui:initData(var_3_0)
	end

	kfcmgr.sendRequest(var_2_0, actions.kfyzGetIndivTaskInfo)
end

function var_0_0.getReward(arg_4_0, arg_4_1, arg_4_2)
	local function var_4_0(arg_5_0)
		if not arg_5_0.data then
			local var_5_0 = arg_5_0.action.data
		end

		local var_5_1 = {}

		for iter_5_0 = 1, #arg_4_2 do
			local var_5_2 = arg_4_2[iter_5_0]
			local var_5_3 = 4

			if var_5_2.type == "gem" then
				var_5_3 = 7
			elseif var_5_2.type == "exp" then
				var_5_3 = 6
			end

			var_5_1[iter_5_0] = {}
			var_5_1[iter_5_0].id = var_5_3
			var_5_1[iter_5_0].value = var_5_2.value
		end

		globalAction_gotResource(var_5_1)
		arg_4_0:refreshData()
		arg_4_0.world:getSIndivTask()
	end

	kfcmgr.sendRequest(var_4_0, actions.kfyzGetIndivTaskReward, arg_4_1)
end

return var_0_0
