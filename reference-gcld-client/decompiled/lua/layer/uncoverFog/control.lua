local var_0_0 = class("uncoverFogControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getUncoverFogControlInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		if arg_3_0.action.state == 1 then
			showTable(arg_3_0.action.data)
			arg_2_0.ui:init(arg_3_0.action.data)
		end
	end

	cmgr.sendRequest(var_2_0, actions.getIndivEventInfo)
end

function var_0_0.getReward(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		if arg_5_0.action.state == 1 then
			arg_4_0.ui:showReward(arg_5_0.action.data)
			arg_4_0:getUncoverFogControlInfo()
		end
	end

	cmgr.sendRequest(var_4_0, actions.getIndivEventReward, arg_4_1)
end

return var_0_0
