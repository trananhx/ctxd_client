local var_0_0 = class("donateControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getInvestInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.data = arg_3_0.action.data

		arg_2_0.ui:init()
	end

	cmgr.sendRequest(var_2_0, actions.getInvestmentInfo)
end

function var_0_0.investCopper(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}

		if arg_5_0.action.data.exp > 0 then
			var_5_0[#var_5_0 + 1] = {}
			var_5_0[#var_5_0].id = 6
			var_5_0[#var_5_0].value = arg_5_0.action.data.exp
		end

		if arg_5_0.action.data.expExtra > 0 then
			var_5_0[#var_5_0 + 1] = {}
			var_5_0[#var_5_0].id = 6
			var_5_0[#var_5_0].value = arg_5_0.action.data.expExtra
		end

		globalAction_gotResource(var_5_0)
		arg_4_0:getInvestInfo()
	end

	cmgr.sendRequest(var_4_0, actions.investCopper)
end

function var_0_0.cdRecover(arg_6_0)
	local function var_6_0(arg_7_0)
		arg_6_0:getInvestInfo()
	end

	local function var_6_1(arg_8_0)
		local var_8_0 = arg_8_0.action.data.gold

		messageBox.showChargeWin("", language.get(94001, var_8_0), "copperInvest", function()
			cmgr.sendRequest(var_6_0, actions.investCdConfirm)
		end)
	end

	if not user.chargeItems.copperInvest.noDisturb then
		cmgr.sendRequest(var_6_1, actions.investCdRecover)
	else
		cmgr.sendRequest(var_6_0, actions.investCdConfirm)
	end
end

return var_0_0
