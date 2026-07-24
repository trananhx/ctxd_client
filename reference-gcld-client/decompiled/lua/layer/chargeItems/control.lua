require("lua/layer/chargeItems/constant")

chargeItemsControl = {}

local var_0_0 = chargeItemsControl
local var_0_1 = chargeItemConstant

local function var_0_2(arg_1_0, arg_1_1)
	return
end

local function var_0_3(arg_2_0, arg_2_1)
	return
end

local function var_0_4(arg_3_0, arg_3_1)
	return
end

function var_0_0.onTouch(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0 == CCTOUCHBEGAN then
		return var_0_2(arg_4_1, arg_4_2)
	elseif arg_4_0 == CCTOUCHMOVED then
		return var_0_3(arg_4_1, arg_4_2)
	elseif arg_4_0 == CCTOUCHENDED then
		return var_0_4(arg_4_1, arg_4_2)
	end
end
