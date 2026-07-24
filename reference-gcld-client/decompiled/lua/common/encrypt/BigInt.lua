local var_0_0 = string.len
local var_0_1 = string.char
local var_0_2 = string.byte
local var_0_3 = string.sub
local var_0_4 = math.max
local var_0_5 = math.min
local var_0_6 = math.floor
local var_0_7 = math.ceil
local var_0_8 = math.fmod

local function var_0_9(arg_1_0)
	return #arg_1_0
end

local function var_0_10()
	return
end

local var_0_11 = table.insert

local function var_0_12(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0[arg_3_1]

	if var_3_0 == nil then
		return 0
	end

	return var_3_0
end

local function var_0_13(arg_4_0)
	local var_4_0 = var_0_9(arg_4_0)

	while var_4_0 > 1 and arg_4_0[var_4_0] == 0 do
		arg_4_0[var_4_0] = nil
		var_4_0 = var_4_0 - 1
	end

	var_0_10(arg_4_0, var_4_0)
end

local function var_0_14(arg_5_0)
	if arg_5_0 > -1 and arg_5_0 < 10 then
		return var_0_1(48 + arg_5_0)
	end

	if arg_5_0 > 9 and arg_5_0 < 16 then
		return var_0_1(55 + arg_5_0)
	end

	return var_0_1(48)
end

local function var_0_15(arg_6_0)
	if arg_6_0 == nil then
		return 0
	end

	if arg_6_0 > 47 and arg_6_0 < 58 then
		return arg_6_0 - 48
	end

	if arg_6_0 > 64 and arg_6_0 < 71 then
		return arg_6_0 - 55
	end

	if arg_6_0 > 96 and arg_6_0 < 103 then
		return arg_6_0 - 87
	end

	return 0
end

function BigInt_NumToHex(arg_7_0)
	local var_7_0 = ""
	local var_7_1
	local var_7_2
	local var_7_3

	for iter_7_0 = 1, var_0_9(arg_7_0) do
		local var_7_4 = arg_7_0[iter_7_0]

		for iter_7_1 = 1, 6 do
			var_7_0 = var_0_14(var_0_8(var_7_4, 16)) .. var_7_0
			var_7_4 = var_0_6(var_7_4 / 16)
		end
	end

	local var_7_5 = 1

	while var_7_5 < var_0_0(var_7_0) and var_0_2(var_7_0, var_7_5) == 48 do
		var_7_5 = var_7_5 + 1
	end

	return var_0_3(var_7_0, var_7_5)
end

function BigInt_HexToNum(arg_8_0)
	local var_8_0 = {}
	local var_8_1
	local var_8_2

	for iter_8_0 = 1, var_0_7(var_0_0(arg_8_0) / 6) do
		var_8_0[iter_8_0] = 0

		for iter_8_1 = 1, 6 do
			var_8_0[iter_8_0] = 16 * var_8_0[iter_8_0] + var_0_15(var_0_2(arg_8_0, var_0_4(var_0_0(arg_8_0) - 6 * iter_8_0 + iter_8_1, 0)))
		end
	end

	var_0_13(var_8_0)

	return var_8_0
end

function BigInt_Add(arg_9_0, arg_9_1)
	local var_9_0 = {}
	local var_9_1, var_9_2, var_9_3 = var_0_4(var_0_9(arg_9_0), var_0_9(arg_9_1))

	var_9_0[1] = 0

	for iter_9_0 = 1, var_9_1 do
		local var_9_4 = var_0_12(arg_9_0, iter_9_0) + var_0_12(arg_9_1, iter_9_0) + var_9_0[iter_9_0]

		if var_9_4 > 16777215 then
			var_9_0[iter_9_0] = var_9_4 - 16777216
			var_9_0[iter_9_0 + 1] = 1
		else
			var_9_0[iter_9_0] = var_9_4
			var_9_0[iter_9_0 + 1] = 0
		end
	end

	var_0_13(var_9_0)

	return var_9_0
end

function BigInt_Sub(arg_10_0, arg_10_1)
	local var_10_0 = {}
	local var_10_1, var_10_2, var_10_3 = var_0_4(var_0_9(arg_10_0), var_0_9(arg_10_1))

	var_10_0[1] = 0

	for iter_10_0 = 1, var_10_1 do
		local var_10_4 = var_0_12(arg_10_0, iter_10_0) - var_0_12(arg_10_1, iter_10_0) - var_10_0[iter_10_0]

		if var_10_4 < 0 then
			var_10_0[iter_10_0] = var_10_4 + 16777216
			var_10_0[iter_10_0 + 1] = 1
		else
			var_10_0[iter_10_0] = var_10_4
			var_10_0[iter_10_0 + 1] = 0
		end
	end

	if var_10_0[var_10_1 + 1] == 1 then
		return nil
	end

	var_0_13(var_10_0)

	return var_10_0
end

function BigInt_Mul(arg_11_0, arg_11_1)
	local var_11_0 = {}
	local var_11_1 = {}
	local var_11_2
	local var_11_3
	local var_11_4

	for iter_11_0 = var_0_9(arg_11_1), 1, -1 do
		var_11_1[1] = 0

		for iter_11_1 = 1, var_0_9(arg_11_0) do
			local var_11_5 = arg_11_0[iter_11_1] * arg_11_1[iter_11_0] + var_11_1[iter_11_1]

			var_11_1[iter_11_1 + 1] = var_0_6(var_11_5 / 16777216)
			var_11_1[iter_11_1] = var_11_5 - var_11_1[iter_11_1 + 1] * 16777216
		end

		var_0_11(var_11_0, 1, 0)

		var_11_0 = BigInt_Add(var_11_0, var_11_1)
	end

	var_0_13(var_11_0)

	return var_11_0
end

local function var_0_16(arg_12_0)
	local var_12_0 = 0
	local var_12_1
	local var_12_2

	for iter_12_0 = var_0_9(arg_12_0), 1, -1 do
		local var_12_3 = arg_12_0[iter_12_0]

		if var_12_0 == 1 then
			arg_12_0[iter_12_0] = var_0_6(var_12_3 / 2) + 8388608
		else
			arg_12_0[iter_12_0] = var_0_6(var_12_3 / 2)
		end

		var_12_0 = var_0_8(var_12_3, 2)
	end

	var_0_13(arg_12_0)

	return var_12_0
end

local function var_0_17(arg_13_0, arg_13_1)
	local var_13_0 = {}
	local var_13_1 = 0
	local var_13_2
	local var_13_3
	local var_13_4
	local var_13_5 = 16777216

	for iter_13_0 = 1, var_0_9(arg_13_1) do
		var_13_0[iter_13_0 + 1] = arg_13_1[iter_13_0]
	end

	var_13_0[1] = 0

	for iter_13_1 = 23, 0, -1 do
		var_13_5 = var_13_5 / 2

		var_0_16(var_13_0)

		local var_13_6 = BigInt_Sub(arg_13_0, var_13_0)

		if var_13_6 ~= nil then
			var_13_1 = var_13_1 + var_13_5
			arg_13_0 = var_13_6
		end
	end

	return var_13_1, arg_13_0
end

function BigInt_Div(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = {}
	local var_14_2, var_14_3 = var_0_9(arg_14_0)

	for iter_14_0 = 1, var_0_5(var_0_9(arg_14_0), var_0_9(arg_14_1)) - 1 do
		var_0_11(var_14_1, 1, arg_14_0[var_14_2])

		var_14_2 = var_14_2 - 1
	end

	while var_14_2 > 0 do
		var_0_11(var_14_1, 1, arg_14_0[var_14_2])

		var_14_2 = var_14_2 - 1

		local var_14_4

		var_14_4, var_14_1 = var_0_17(var_14_1, arg_14_1)

		var_0_11(var_14_0, 1, var_14_4)
	end

	var_0_13(var_14_0)

	return var_14_0, var_14_1
end

function BigInt_ModPower(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}
	local var_15_1 = {
		1
	}
	local var_15_2

	for iter_15_0 = 1, var_0_9(arg_15_1) do
		var_15_0[iter_15_0] = arg_15_1[iter_15_0]
	end

	repeat
		if var_0_16(var_15_0) == 1 then
			local var_15_3

			var_15_3, var_15_1 = BigInt_Div(BigInt_Mul(var_15_1, arg_15_0), arg_15_2)
		end

		local var_15_4

		var_15_4, arg_15_0 = BigInt_Div(BigInt_Mul(arg_15_0, arg_15_0), arg_15_2)
	until var_0_9(var_15_0) == 1 and var_15_0[1] == 0

	return var_15_1
end

function BigInt_MP_StepInit(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {
		arg_16_0,
		{},
		arg_16_2,
		{
			1
		},
		1
	}
	local var_16_1

	for iter_16_0 = 1, var_0_9(arg_16_1) do
		var_16_0[2][iter_16_0] = arg_16_1[iter_16_0]
	end

	return var_16_0
end

function BigInt_MP_StepExec(arg_17_0)
	local var_17_0

	if arg_17_0[5] == 1 then
		arg_17_0[5] = 2

		if var_0_16(arg_17_0[2]) == 1 then
			local var_17_1

			var_17_1, arg_17_0[4] = BigInt_Div(BigInt_Mul(arg_17_0[4], arg_17_0[1]), arg_17_0[3])
		end

		return nil
	end

	if arg_17_0[5] == 2 then
		arg_17_0[5] = 1

		local var_17_2

		var_17_2, arg_17_0[1] = BigInt_Div(BigInt_Mul(arg_17_0[1], arg_17_0[1]), arg_17_0[3])

		if var_0_9(arg_17_0[2]) == 1 and arg_17_0[2][1] == 0 then
			arg_17_0[5] = 0

			return arg_17_0[4]
		end

		return nil
	end

	return nil
end
