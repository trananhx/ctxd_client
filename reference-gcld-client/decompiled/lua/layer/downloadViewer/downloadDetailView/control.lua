local var_0_0 = class("downloadDetailViewControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getInstallRewards(arg_2_0)
	local function var_2_0(arg_3_0)
		log.info("get rewards :")
		showTable(arg_3_0)
		showTable(user.installFullPackRewards)

		local var_3_0 = {
			[42] = 5
		}
		local var_3_1 = {}

		for iter_3_0 = 1, #user.installFullPackRewards do
			local var_3_2 = user.installFullPackRewards[iter_3_0]

			var_3_1[iter_3_0] = {}
			var_3_1[iter_3_0].id = var_3_0[var_3_2.type] or var_3_2.type
			var_3_1[iter_3_0].value = var_3_2.value
		end

		globalAction_gotResource(var_3_1)

		user.hasHotSwapGift = 0

		arg_2_0.ui:updatePanel()
	end

	cmgr.sendRequest(var_2_0, actions.getHotSwapGift)
end

return var_0_0
