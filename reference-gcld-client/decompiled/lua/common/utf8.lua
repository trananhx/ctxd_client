local function var_0_0(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or 1

	if type(arg_1_0) ~= "string" then
		error("bad argument #1 to 'utf8charbytes' (string expected, got " .. type(arg_1_0) .. ")")
	end

	if type(arg_1_1) ~= "number" then
		error("bad argument #2 to 'utf8charbytes' (number expected, got " .. type(arg_1_1) .. ")")
	end

	local var_1_0 = arg_1_0:byte(arg_1_1)

	if var_1_0 > 0 and var_1_0 <= 127 then
		return 1
	elseif var_1_0 >= 194 and var_1_0 <= 223 then
		local var_1_1 = arg_1_0:byte(arg_1_1 + 1)

		if not var_1_1 then
			error("UTF-8 string terminated early")
		end

		if var_1_1 < 128 or var_1_1 > 191 then
			error("Invalid UTF-8 character")
		end

		return 2
	elseif var_1_0 >= 224 and var_1_0 <= 239 then
		local var_1_2 = arg_1_0:byte(arg_1_1 + 1)
		local var_1_3 = arg_1_0:byte(arg_1_1 + 2)

		if not var_1_2 or not var_1_3 then
			error("UTF-8 string terminated early")
		end

		if var_1_0 == 224 and (var_1_2 < 160 or var_1_2 > 191) then
			error("Invalid UTF-8 character")
		elseif var_1_0 == 237 and (var_1_2 < 128 or var_1_2 > 159) then
			error("Invalid UTF-8 character")
		elseif var_1_2 < 128 or var_1_2 > 191 then
			error("Invalid UTF-8 character")
		end

		if var_1_3 < 128 or var_1_3 > 191 then
			error("Invalid UTF-8 character")
		end

		return 3
	elseif var_1_0 >= 240 and var_1_0 <= 244 then
		local var_1_4 = arg_1_0:byte(arg_1_1 + 1)
		local var_1_5 = arg_1_0:byte(arg_1_1 + 2)
		local var_1_6 = arg_1_0:byte(arg_1_1 + 3)

		if not var_1_4 or not var_1_5 or not var_1_6 then
			error("UTF-8 string terminated early")
		end

		if var_1_0 == 240 and (var_1_4 < 144 or var_1_4 > 191) then
			error("Invalid UTF-8 character")
		elseif var_1_0 == 244 and (var_1_4 < 128 or var_1_4 > 143) then
			error("Invalid UTF-8 character")
		elseif var_1_4 < 128 or var_1_4 > 191 then
			error("Invalid UTF-8 character")
		end

		if var_1_5 < 128 or var_1_5 > 191 then
			error("Invalid UTF-8 character")
		end

		if var_1_6 < 128 or var_1_6 > 191 then
			error("Invalid UTF-8 character")
		end

		return 4
	else
		error("Invalid UTF-8 character")
	end
end

local function var_0_1(arg_2_0)
	if type(arg_2_0) ~= "string" then
		error("bad argument #1 to 'utf8len' (string expected, got " .. type(arg_2_0) .. ")")
	end

	local var_2_0 = 1
	local var_2_1 = arg_2_0:len()
	local var_2_2 = 0

	while var_2_0 <= var_2_1 and var_2_2 ~= chars do
		local var_2_3 = arg_2_0:byte(var_2_0)

		var_2_2 = var_2_2 + 1
		var_2_0 = var_2_0 + var_0_0(arg_2_0, var_2_0)
	end

	if chars ~= nil then
		return var_2_0 - 1
	end

	return var_2_2
end

if not string.utf8len then
	string.utf8len = var_0_1
end

function playerPkey(arg_3_0, arg_3_1)
	local var_3_0 = os.time()
	local var_3_1 = arg_3_1
	local var_3_2 = {}

	table.insert(var_3_2, arg_3_1)
	table.insert(var_3_2, "6F7b9b91acd1504fdeff1071586")
	table.insert(var_3_2, userId())

	local var_3_3 = var_3_1 .. getLuaParame(var_3_2)
	local var_3_4 = Utils:md5ToLua(arg_3_0 .. var_3_0 .. Utils:md5ToLua(var_3_3))

	return var_3_0, var_3_4
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2 = arg_4_2 or -1

	if type(arg_4_0) ~= "string" then
		error("bad argument #1 to 'utf8sub' (string expected, got " .. type(arg_4_0) .. ")")
	end

	if type(arg_4_1) ~= "number" then
		error("bad argument #2 to 'utf8sub' (number expected, got " .. type(arg_4_1) .. ")")
	end

	if type(arg_4_2) ~= "number" then
		error("bad argument #3 to 'utf8sub' (number expected, got " .. type(arg_4_2) .. ")")
	end

	local var_4_0 = 1
	local var_4_1 = arg_4_0:len()
	local var_4_2 = 0
	local var_4_3 = arg_4_1 >= 0 and arg_4_2 >= 0 or var_0_1(arg_4_0)
	local var_4_4 = arg_4_1 >= 0 and arg_4_1 or var_4_3 + arg_4_1 + 1
	local var_4_5 = arg_4_2 >= 0 and arg_4_2 or var_4_3 + arg_4_2 + 1

	if var_4_5 < var_4_4 then
		return ""
	end

	local var_4_6 = 1
	local var_4_7 = var_4_1

	while var_4_0 <= var_4_1 do
		var_4_2 = var_4_2 + 1

		if var_4_2 == var_4_4 then
			var_4_6 = var_4_0
		end

		var_4_0 = var_4_0 + var_0_0(arg_4_0, var_4_0)

		if var_4_2 == var_4_5 then
			var_4_7 = var_4_0 - 1

			break
		end
	end

	return arg_4_0:sub(var_4_6, var_4_7)
end

if not string.utf8sub then
	string.utf8sub = var_0_2
end

local function var_0_3(arg_5_0, arg_5_1)
	if type(arg_5_0) ~= "string" then
		error("bad argument #1 to 'utf8replace' (string expected, got " .. type(arg_5_0) .. ")")
	end

	if type(arg_5_1) ~= "table" then
		error("bad argument #2 to 'utf8replace' (table expected, got " .. type(arg_5_1) .. ")")
	end

	local var_5_0 = 1
	local var_5_1 = arg_5_0:len()
	local var_5_2
	local var_5_3 = ""

	while var_5_0 <= var_5_1 do
		local var_5_4 = var_0_0(arg_5_0, var_5_0)
		local var_5_5 = arg_5_0:sub(var_5_0, var_5_0 + var_5_4 - 1)

		var_5_3 = var_5_3 .. (arg_5_1[var_5_5] or var_5_5)
		var_5_0 = var_5_0 + var_5_4
	end

	return var_5_3
end

local function var_0_4(arg_6_0)
	return var_0_3(arg_6_0, utf8_lc_uc)
end

if not string.utf8upper and utf8_lc_uc then
	string.utf8upper = var_0_4
end

local function var_0_5(arg_7_0)
	return var_0_3(arg_7_0, utf8_uc_lc)
end

if not string.utf8lower and utf8_uc_lc then
	string.utf8lower = var_0_5
end

local function var_0_6(arg_8_0)
	if type(arg_8_0) ~= "string" then
		error("bad argument #1 to 'utf8reverse' (string expected, got " .. type(arg_8_0) .. ")")
	end

	local var_8_0 = arg_8_0:len()
	local var_8_1
	local var_8_2 = ""

	while var_8_0 > 0 do
		c = arg_8_0:byte(var_8_0)

		while c >= 128 and c <= 191 do
			var_8_0 = var_8_0 - 1
			c = arg_8_0:byte(var_8_0)
		end

		local var_8_3 = var_0_0(arg_8_0, var_8_0)

		var_8_2 = var_8_2 .. arg_8_0:sub(var_8_0, var_8_0 + var_8_3 - 1)
		var_8_0 = var_8_0 - 1
	end

	return var_8_2
end

if not string.utf8reverse then
	string.utf8reverse = var_0_6
end
