local var_0_0 = class("KfRewardPanelControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getKfgzEndRewardBoard(arg_2_0)
	local function var_2_0(arg_3_0)
		log.info("rewardPanel:%s", tool.tableToJson(arg_3_0))

		arg_2_0.data = arg_3_0.action.data

		arg_2_0.ui:init()
	end

	cmgr.sendRequest(var_2_0, actions.kfgzGetEndRewardBoard)
end

function var_0_0.openBoxFunc(arg_4_0, arg_4_1)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in pairs(tool.split(arg_4_0.data.gold, ",")) do
		var_4_0[iter_4_0] = tonumber(iter_4_1)
	end

	local var_4_1 = {}

	for iter_4_2, iter_4_3 in pairs(tool.split(arg_4_0.data.reward, ",")) do
		local var_4_2 = tool.split(iter_4_3, ":")

		var_4_1[iter_4_2] = {
			tonumber(var_4_2[1]),
			tonumber(var_4_2[2])
		}
	end

	local var_4_3 = var_4_0[arg_4_1]
	local var_4_4 = var_4_1[arg_4_1][2]

	local function var_4_5(arg_5_0)
		local var_5_0 = {
			{}
		}

		var_5_0[1].id = 100
		var_5_0[1].value = var_4_4

		globalAction_gotResource(var_5_0)
		arg_4_0:getKfgzEndRewardBoard()
	end

	return function()
		if var_4_3 > 0 then
			messageBox.confirm(language.get(430018, var_4_3, var_4_4), function()
				cmgr.sendRequest(var_4_5, actions.kfgzGetEndReward, arg_4_1)
			end)
		else
			cmgr.sendRequest(var_4_5, actions.kfgzGetEndReward, arg_4_1)
		end
	end
end

return var_0_0
