local var_0_0 = class("HCBizer", function(arg_1_0)
	return CCActionInterval:create(arg_1_0)
end)

local function var_0_1(arg_2_0)
	local var_2_0 = 1

	for iter_2_0 = 1, arg_2_0 do
		var_2_0 = var_2_0 * arg_2_0
	end

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1)
	return var_0_1(arg_3_0) / (var_0_1(arg_3_1) * var_0_1(arg_3_0 - arg_3_1))
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = 1

	for iter_4_0 = 1, arg_4_1 do
		var_4_0 = var_4_0 * arg_4_0
	end

	return var_4_0
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = 0
	local var_5_1 = 0
	local var_5_2 = 0

	for iter_5_0 = var_5_2, arg_5_1 do
		var_5_0 = var_5_0 + var_0_2(arg_5_1, var_5_2) * arg_5_0[var_5_2].x * var_0_3(arg_5_2, var_5_2) * var_0_3(1 - arg_5_2, arg_5_1 - var_5_2)
		var_5_1 = var_5_1 + var_0_2(arg_5_1, var_5_2) * arg_5_0[var_5_2].y * var_0_3(arg_5_2, var_5_2) * var_0_3(1 - arg_5_2, arg_5_1 - var_5_2)
	end

	return ccp(var_5_0, var_5_1)
end

function var_0_0.ctor(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.number = #arg_6_2
	arg_6_0.array = arg_6_2
end

function var_0_0.update(arg_7_0, arg_7_1)
	return
end

return var_0_0
