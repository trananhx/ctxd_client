local var_0_0 = string.len
local var_0_1 = string.char
local var_0_2 = string.byte
local var_0_3 = string.sub
local var_0_4 = math.floor
local var_0_5 = bit.bnot
local var_0_6 = bit.band
local var_0_7 = bit.bor
local var_0_8 = bit.bxor
local var_0_9 = bit.lshift
local var_0_10 = bit.rshift
local var_0_11
local var_0_12
local var_0_13
local var_0_14
local var_0_15

local function var_0_16(arg_1_0, arg_1_1)
	return var_0_9(arg_1_0, arg_1_1) + var_0_10(arg_1_0, 32 - arg_1_1)
end

local function var_0_17(arg_2_0)
	local var_2_0
	local var_2_1
	local var_2_2 = ""

	for iter_2_0 = 1, 8 do
		local var_2_3 = var_0_6(arg_2_0, 15)

		if var_2_3 < 10 then
			var_2_2 = var_0_1(var_2_3 + 48) .. var_2_2
		else
			var_2_2 = var_0_1(var_2_3 + 87) .. var_2_2
		end

		arg_2_0 = var_0_4(arg_2_0 / 16)
	end

	return var_2_2
end

local function var_0_18(arg_3_0)
	local var_3_0
	local var_3_1
	local var_3_2 = ""
	local var_3_3 = var_0_0(arg_3_0) * 8

	arg_3_0 = arg_3_0 .. var_0_1(128)

	local var_3_4 = 56 - var_0_6(var_0_0(arg_3_0), 63)

	if var_3_4 < 0 then
		var_3_4 = var_3_4 + 64
	end

	for iter_3_0 = 1, var_3_4 do
		arg_3_0 = arg_3_0 .. var_0_1(0)
	end

	for iter_3_1 = 1, 8 do
		var_3_2 = var_0_1(var_0_6(var_3_3, 255)) .. var_3_2
		var_3_3 = var_0_4(var_3_3 / 256)
	end

	return arg_3_0 .. var_3_2
end

local function var_0_19(arg_4_0)
	local var_4_0
	local var_4_1
	local var_4_2
	local var_4_3
	local var_4_4
	local var_4_5
	local var_4_6
	local var_4_7
	local var_4_8
	local var_4_9
	local var_4_10 = {}

	while arg_4_0 ~= "" do
		for iter_4_0 = 0, 15 do
			var_4_10[iter_4_0] = 0

			for iter_4_1 = 1, 4 do
				var_4_10[iter_4_0] = var_4_10[iter_4_0] * 256 + var_0_2(arg_4_0, iter_4_0 * 4 + iter_4_1)
			end
		end

		for iter_4_2 = 16, 79 do
			var_4_10[iter_4_2] = var_0_16(var_0_8(var_0_8(var_4_10[iter_4_2 - 3], var_4_10[iter_4_2 - 8]), var_0_8(var_4_10[iter_4_2 - 14], var_4_10[iter_4_2 - 16])), 1)
		end

		local var_4_11 = var_0_11
		local var_4_12 = var_0_12
		local var_4_13 = var_0_13
		local var_4_14 = var_0_14
		local var_4_15 = var_0_15

		for iter_4_3 = 0, 79 do
			local var_4_16

			if iter_4_3 < 20 then
				var_4_5 = var_0_7(var_0_6(var_4_12, var_4_13), var_0_6(var_0_5(var_4_12), var_4_14))
				var_4_16 = 1518500249
			elseif iter_4_3 < 40 then
				var_4_5 = var_0_8(var_0_8(var_4_12, var_4_13), var_4_14)
				var_4_16 = 1859775393
			elseif iter_4_3 < 60 then
				var_4_5 = var_0_7(var_0_7(var_0_6(var_4_12, var_4_13), var_0_6(var_4_12, var_4_14)), var_0_6(var_4_13, var_4_14))
				var_4_16 = 2400959708
			else
				var_4_5 = var_0_8(var_0_8(var_4_12, var_4_13), var_4_14)
				var_4_16 = 3395469782
			end

			local var_4_17 = var_0_16(var_4_11, 5) + var_4_5 + var_4_15 + var_4_16 + var_4_10[iter_4_3]

			var_4_15 = var_4_14
			var_4_14 = var_4_13
			var_4_13 = var_0_16(var_4_12, 30)
			var_4_12 = var_4_11
			var_4_11 = var_4_17
		end

		var_0_11 = var_0_6(var_0_11 + var_4_11, 4294967295)
		var_0_12 = var_0_6(var_0_12 + var_4_12, 4294967295)
		var_0_13 = var_0_6(var_0_13 + var_4_13, 4294967295)
		var_0_14 = var_0_6(var_0_14 + var_4_14, 4294967295)
		var_0_15 = var_0_6(var_0_15 + var_4_15, 4294967295)
		arg_4_0 = var_0_3(arg_4_0, 65)
	end
end

function Sha1(arg_5_0)
	arg_5_0 = var_0_18(arg_5_0)
	var_0_11 = 1732584193
	var_0_12 = 4023233417
	var_0_13 = 2562383102
	var_0_14 = 271733878
	var_0_15 = 3285377520

	var_0_19(arg_5_0)

	return var_0_17(var_0_11) .. var_0_17(var_0_12) .. var_0_17(var_0_13) .. var_0_17(var_0_14) .. var_0_17(var_0_15)
end
