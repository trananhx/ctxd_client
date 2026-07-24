local var_0_0 = math.fmod
local var_0_1 = math.floor

bit = {}

local function var_0_2(arg_1_0)
	return var_0_0(arg_1_0, 4294967296)
end

function bit.bnot(arg_2_0)
	return 4294967295 - var_0_2(arg_2_0)
end

function bit.lshift(arg_3_0, arg_3_1)
	return var_0_2(var_0_2(arg_3_0) * 2^arg_3_1)
end

function bit.rshift(arg_4_0, arg_4_1)
	return var_0_1(var_0_2(arg_4_0) / 2^arg_4_1)
end

function bit.band(arg_5_0, arg_5_1)
	local var_5_0 = 0
	local var_5_1 = 1
	local var_5_2

	for iter_5_0 = 0, 31 do
		if var_0_0(arg_5_0, 2) == 1 and var_0_0(arg_5_1, 2) == 1 then
			var_5_0 = var_5_0 + var_5_1
		end

		arg_5_0 = bit.rshift(arg_5_0, 1)
		arg_5_1 = bit.rshift(arg_5_1, 1)
		var_5_1 = var_5_1 * 2
	end

	return var_5_0
end

function bit.bor(arg_6_0, arg_6_1)
	local var_6_0 = 0
	local var_6_1 = 1
	local var_6_2

	for iter_6_0 = 0, 31 do
		if var_0_0(arg_6_0, 2) == 1 or var_0_0(arg_6_1, 2) == 1 then
			var_6_0 = var_6_0 + var_6_1
		end

		arg_6_0 = bit.rshift(arg_6_0, 1)
		arg_6_1 = bit.rshift(arg_6_1, 1)
		var_6_1 = var_6_1 * 2
	end

	return var_6_0
end

function bit.bxor(arg_7_0, arg_7_1)
	local var_7_0 = 0
	local var_7_1 = 1
	local var_7_2

	for iter_7_0 = 0, 31 do
		if var_0_0(arg_7_0, 2) ~= var_0_0(arg_7_1, 2) then
			var_7_0 = var_7_0 + var_7_1
		end

		arg_7_0 = bit.rshift(arg_7_0, 1)
		arg_7_1 = bit.rshift(arg_7_1, 1)
		var_7_1 = var_7_1 * 2
	end

	return var_7_0
end
