local var_0_0 = type
local var_0_1 = table.insert
local var_0_2 = table.concat
local var_0_3 = table.remove
local var_0_4 = table.sort
local var_0_5 = string.char
local var_0_6 = tostring
local var_0_7 = tonumber
local var_0_8 = pairs
local var_0_9 = ipairs
local var_0_10 = next
local var_0_11 = error
local var_0_12 = newproxy
local var_0_13 = getmetatable
local var_0_14 = setmetatable
local var_0_15 = print
local var_0_16 = {}
local var_0_17 = {}
local var_0_18 = var_0_12 and var_0_12(true) or {}

if var_0_13 and var_0_13(var_0_18) then
	var_0_13(var_0_18).__tostring = function()
		return "null"
	end
end

var_0_17.null = var_0_18

local var_0_19 = {
	["\f"] = "\\f",
	["\b"] = "\\b",
	["\n"] = "\\n",
	["\t"] = "\\t",
	["\\"] = "\\\\",
	["\r"] = "\\r",
	["\""] = "\\\""
}
local var_0_20 = {
	b = "\b",
	f = "\f",
	t = "\t",
	r = "\r",
	n = "\n",
	["\\"] = "\\",
	["/"] = "/",
	["\""] = "\""
}

for iter_0_0 = 0, 31 do
	local var_0_21 = var_0_5(iter_0_0)

	if not var_0_19[var_0_21] then
		var_0_19[var_0_21] = ("\\u%.4X"):format(iter_0_0)
	end
end

local function var_0_22(arg_2_0)
	if arg_2_0 < 128 then
		return var_0_5(arg_2_0)
	end

	local var_2_0 = arg_2_0 % 64

	if arg_2_0 < 2048 then
		local var_2_1 = (arg_2_0 - var_2_0) / 64

		return var_0_5(192 + var_2_1, 128 + var_2_0)
	end

	local var_2_2 = arg_2_0 % 4096
	local var_2_3 = (var_2_2 - var_2_0) / 64
	local var_2_4 = (arg_2_0 - var_2_2) / 4096

	return var_0_5(224 + var_2_4, 128 + var_2_3, 128 + var_2_0)
end

local var_0_23 = {
	string = true,
	table = true,
	boolean = true,
	number = true
}
local var_0_24 = {
	__array = true,
	__hash = true
}
local var_0_25
local var_0_26
local var_0_27
local var_0_28

local function var_0_29(arg_3_0, arg_3_1)
	var_0_1(arg_3_1, "\"" .. arg_3_0:gsub(".", var_0_19) .. "\"")
end

local function var_0_30(arg_4_0, arg_4_1)
	var_0_1(arg_4_1, "[")

	if var_0_10(arg_4_0) then
		for iter_4_0, iter_4_1 in var_0_9(arg_4_0) do
			var_0_25(iter_4_1, arg_4_1)
			var_0_1(arg_4_1, ",")
		end

		var_0_3(arg_4_1)
	end

	var_0_1(arg_4_1, "]")
end

local function var_0_31(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = {}
	local var_5_2 = {}

	for iter_5_0, iter_5_1 in var_0_9(arg_5_0) do
		var_5_0[iter_5_0] = iter_5_1
	end

	for iter_5_2, iter_5_3 in var_0_8(arg_5_0) do
		local var_5_3 = var_0_0(iter_5_2)
		local var_5_4 = var_0_0(iter_5_3)

		if var_0_23[var_5_4] or iter_5_3 == var_0_18 then
			if var_5_3 == "string" and not var_0_24[iter_5_2] then
				var_5_2[iter_5_2] = iter_5_3
			elseif (var_0_23[var_5_3] or iter_5_2 == var_0_18) and var_5_0[iter_5_2] == nil then
				var_5_1[iter_5_2] = iter_5_3
			end
		end
	end

	if var_0_10(var_5_1) ~= nil or var_0_10(var_5_2) ~= nil or var_0_10(var_5_0) == nil then
		var_0_1(arg_5_1, "{")

		local var_5_5 = #arg_5_1

		if arg_5_1.ordered then
			local var_5_6 = {}

			for iter_5_4 in var_0_8(var_5_2) do
				var_0_1(var_5_6, iter_5_4)
			end

			var_0_4(var_5_6)

			for iter_5_5, iter_5_6 in var_0_9(var_5_6) do
				var_0_29(iter_5_6, arg_5_1)
				var_0_1(arg_5_1, ":")
				var_0_25(var_5_2[iter_5_6], arg_5_1)
				var_0_1(arg_5_1, ",")
			end
		else
			for iter_5_7, iter_5_8 in var_0_8(var_5_2) do
				var_0_29(iter_5_7, arg_5_1)
				var_0_1(arg_5_1, ":")
				var_0_25(iter_5_8, arg_5_1)
				var_0_1(arg_5_1, ",")
			end
		end

		if var_0_10(var_5_1) ~= nil then
			var_0_1(arg_5_1, "\"__hash\":[")

			for iter_5_9, iter_5_10 in var_0_8(var_5_1) do
				var_0_25(iter_5_9, arg_5_1)
				var_0_1(arg_5_1, ",")
				var_0_25(iter_5_10, arg_5_1)
				var_0_1(arg_5_1, ",")
			end

			var_0_3(arg_5_1)
			var_0_1(arg_5_1, "]")
			var_0_1(arg_5_1, ",")
		end

		if var_0_10(var_5_0) then
			var_0_1(arg_5_1, "\"__array\":")
			var_0_30(var_5_0, arg_5_1)
			var_0_1(arg_5_1, ",")
		end

		if var_5_5 ~= #arg_5_1 then
			var_0_3(arg_5_1)
		end

		var_0_1(arg_5_1, "}")
	else
		var_0_30(var_5_0, arg_5_1)
	end
end

function var_0_25(arg_6_0, arg_6_1)
	local var_6_0 = var_0_0(arg_6_0)

	if var_6_0 == "number" then
		var_0_1(arg_6_1, var_0_6(arg_6_0))
	elseif var_6_0 == "string" then
		var_0_29(arg_6_0, arg_6_1)
	elseif var_6_0 == "table" then
		if var_0_13(arg_6_0) == var_0_16 then
			var_0_30(arg_6_0, arg_6_1)
		else
			var_0_31(arg_6_0, arg_6_1)
		end
	elseif var_6_0 == "boolean" then
		var_0_1(arg_6_1, arg_6_0 and "true" or "false")
	else
		var_0_1(arg_6_1, "null")
	end
end

function var_0_17.encode(arg_7_0)
	local var_7_0 = {}

	var_0_25(arg_7_0, var_7_0)

	return var_0_2(var_7_0)
end

function var_0_17.encode_ordered(arg_8_0)
	local var_8_0 = {
		ordered = true
	}

	var_0_25(arg_8_0, var_8_0)

	return var_0_2(var_8_0)
end

function var_0_17.encode_array(arg_9_0)
	local var_9_0 = {}

	var_0_30(arg_9_0, var_9_0)

	return var_0_2(var_9_0)
end

local function var_0_32(arg_10_0, arg_10_1)
	return arg_10_0:find("[^ \t\r\n]", arg_10_1) or arg_10_1
end

local function var_0_33(arg_11_0)
	local var_11_0 = arg_11_0.__array

	if var_11_0 then
		arg_11_0.__array = nil

		for iter_11_0, iter_11_1 in var_0_9(var_11_0) do
			var_0_1(arg_11_0, iter_11_1)
		end
	end

	local var_11_1 = arg_11_0.__hash

	if var_11_1 then
		arg_11_0.__hash = nil

		local var_11_2

		for iter_11_2, iter_11_3 in var_0_9(var_11_1) do
			if var_11_2 ~= nil then
				arg_11_0[var_11_2] = iter_11_3
				var_11_2 = nil
			else
				var_11_2 = iter_11_3
			end
		end
	end

	return arg_11_0
end

local var_0_34
local var_0_35

local function var_0_36(arg_12_0, arg_12_1)
	local var_12_0 = {}

	while true do
		local var_12_1
		local var_12_2

		arg_12_1 = var_0_32(arg_12_0, arg_12_1 + 1)

		if arg_12_0:byte(arg_12_1) ~= 34 then
			if arg_12_0:byte(arg_12_1) == 125 then
				return var_12_0, arg_12_1 + 1
			end

			return nil, "key expected"
		end

		local var_12_3

		var_12_3, arg_12_1 = var_0_35(arg_12_0, arg_12_1)

		if var_12_3 == nil then
			return nil, arg_12_1
		end

		arg_12_1 = var_0_32(arg_12_0, arg_12_1)

		if arg_12_0:byte(arg_12_1) ~= 58 then
			return nil, "colon expected"
		end

		local var_12_4

		var_12_4, arg_12_1 = var_0_34(arg_12_0, arg_12_1 + 1)

		if var_12_4 == nil then
			return nil, arg_12_1
		end

		var_12_0[var_12_3] = var_12_4
		arg_12_1 = var_0_32(arg_12_0, arg_12_1)

		local var_12_5 = arg_12_0:byte(arg_12_1)

		if var_12_5 == 125 then
			return var_0_33(var_12_0), arg_12_1 + 1
		end

		if var_12_5 ~= 44 then
			return nil, "object eof"
		end
	end
end

local function var_0_37(arg_13_0, arg_13_1)
	local var_13_0 = {}
	local var_13_1 = arg_13_1

	while true do
		local var_13_2
		local var_13_3

		var_13_3, arg_13_1 = var_0_34(arg_13_0, arg_13_1 + 1)

		if var_13_3 == nil then
			if arg_13_0:byte(var_13_1 + 1) == 93 then
				return var_0_14(var_13_0, var_0_16), var_13_1 + 2
			end

			return var_13_3, arg_13_1
		end

		var_0_1(var_13_0, var_13_3)

		arg_13_1 = var_0_32(arg_13_0, arg_13_1)

		local var_13_4 = arg_13_0:byte(arg_13_1)

		if var_13_4 == 93 then
			return var_0_14(var_13_0, var_0_16), arg_13_1 + 1
		end

		if var_13_4 ~= 44 then
			return nil, "array eof"
		end
	end
end

local var_0_38

local function var_0_39(arg_14_0)
	local var_14_0 = var_0_7(arg_14_0:sub(3, 6), 16)
	local var_14_1 = var_0_7(arg_14_0:sub(9, 12), 16)
	local var_14_2 = var_14_0 * 1024 + var_14_1 - 56613888
	local var_14_3 = var_14_2 % 64
	local var_14_4 = (var_14_2 - var_14_3) / 64
	local var_14_5 = var_14_4 % 64
	local var_14_6 = (var_14_4 - var_14_5) / 64
	local var_14_7 = var_14_6 % 64
	local var_14_8 = (var_14_6 - var_14_7) / 64

	return var_0_5(240 + var_14_8, 128 + var_14_7, 128 + var_14_5, 128 + var_14_3)
end

local function var_0_40(arg_15_0)
	arg_15_0 = arg_15_0:match("%x%x%x%x", 3)

	if arg_15_0 then
		return var_0_22(var_0_7(arg_15_0, 16))
	end

	var_0_38 = true
end

function var_0_35(arg_16_0, arg_16_1)
	arg_16_1 = arg_16_1 + 1

	local var_16_0 = arg_16_0:find("\"", arg_16_1, true)

	if var_16_0 then
		local var_16_1 = arg_16_0:sub(arg_16_1, var_16_0 - 1)

		var_0_38 = nil

		local var_16_2 = var_16_1:gsub("\\u.?.?.?.?", var_0_40)

		if var_0_38 then
			return nil, "invalid escape"
		end

		return var_16_2, var_16_0 + 1
	end

	return nil, "string eof"
end

local function var_0_41(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:match("[0-9%.%-eE%+]+", arg_17_1)

	return var_0_7(var_17_0), arg_17_1 + #var_17_0
end

local function var_0_42(arg_18_0, arg_18_1)
	local var_18_0, var_18_1, var_18_2 = arg_18_0:byte(arg_18_1 + 1, arg_18_1 + 3)

	if var_18_0 == 117 and var_18_1 == 108 and var_18_2 == 108 then
		return var_0_18, arg_18_1 + 4
	end

	return nil, "null parse failed"
end

local function var_0_43(arg_19_0, arg_19_1)
	local var_19_0, var_19_1, var_19_2 = arg_19_0:byte(arg_19_1 + 1, arg_19_1 + 3)

	if var_19_0 == 114 and var_19_1 == 117 and var_19_2 == 101 then
		return true, arg_19_1 + 4
	end

	return nil, "true parse failed"
end

local function var_0_44(arg_20_0, arg_20_1)
	local var_20_0, var_20_1, var_20_2, var_20_3 = arg_20_0:byte(arg_20_1 + 1, arg_20_1 + 4)

	if var_20_0 == 97 and var_20_1 == 108 and var_20_2 == 115 and var_20_3 == 101 then
		return false, arg_20_1 + 5
	end

	return nil, "false parse failed"
end

function var_0_34(arg_21_0, arg_21_1)
	arg_21_1 = var_0_32(arg_21_0, arg_21_1)

	local var_21_0 = arg_21_0:byte(arg_21_1)

	if var_21_0 == 123 then
		return var_0_36(arg_21_0, arg_21_1)
	elseif var_21_0 == 91 then
		return var_0_37(arg_21_0, arg_21_1)
	elseif var_21_0 == 34 then
		return var_0_35(arg_21_0, arg_21_1)
	elseif var_21_0 ~= nil and var_21_0 >= 48 and var_21_0 <= 57 or var_21_0 == 45 then
		return var_0_41(arg_21_0, arg_21_1)
	elseif var_21_0 == 110 then
		return var_0_42(arg_21_0, arg_21_1)
	elseif var_21_0 == 116 then
		return var_0_43(arg_21_0, arg_21_1)
	elseif var_21_0 == 102 then
		return var_0_44(arg_21_0, arg_21_1)
	else
		return nil, "value expected"
	end
end

local var_0_45 = {
	["\\b"] = "\\u0008",
	["\\u"] = "\\u",
	["\\f"] = "\\u000C",
	["\\/"] = "\\u002f",
	["\\\\"] = "\\u005c",
	["\\n"] = "\\u000A",
	["\\t"] = "\\u0009",
	["\\r"] = "\\u000D",
	["\\\""] = "\\u0022"
}

function var_0_17.decode(arg_22_0)
	arg_22_0 = arg_22_0:gsub("\\.", var_0_45)

	local var_22_0, var_22_1 = var_0_34(arg_22_0, 1)

	if var_22_0 == nil then
		return var_22_0, var_22_1
	end

	if arg_22_0:find("[^ \t\r\n]", var_22_1) then
		return nil, "garbage at eof"
	end

	return var_22_0
end

function var_0_17.test(arg_23_0)
	local var_23_0 = var_0_17.encode(arg_23_0)
	local var_23_1 = var_0_17.decode(var_23_0)
	local var_23_2 = var_0_17.encode(var_23_1)

	if var_23_0 ~= var_23_2 then
		var_0_15("FAILED")
		var_0_15("encoded:", var_23_0)
		var_0_15("recoded:", var_23_2)
	else
		var_0_15(var_23_0)
	end

	return var_23_0 == var_23_2
end

return var_0_17
