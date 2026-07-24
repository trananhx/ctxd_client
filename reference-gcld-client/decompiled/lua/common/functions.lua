local var_0_0 = tonumber

function tonumber(arg_1_0, arg_1_1)
	return var_0_0(arg_1_0, arg_1_1) or 0
end

function toint(arg_2_0)
	return math.round(tonumber(arg_2_0))
end

function tobool(arg_3_0)
	return arg_3_0 ~= nil and arg_3_0 ~= false
end

function totable(arg_4_0)
	if type(arg_4_0) ~= "table" then
		arg_4_0 = {}
	end

	return arg_4_0
end

function format(...)
	return string.format(...)
end

function clone(arg_6_0)
	local var_6_0 = {}

	local function var_6_1(arg_7_0)
		if type(arg_7_0) ~= "table" then
			return arg_7_0
		elseif var_6_0[arg_7_0] then
			return var_6_0[arg_7_0]
		end

		local var_7_0 = {}

		var_6_0[arg_7_0] = var_7_0

		for iter_7_0, iter_7_1 in pairs(arg_7_0) do
			var_7_0[var_6_1(iter_7_0)] = var_6_1(iter_7_1)
		end

		return setmetatable(var_7_0, getmetatable(arg_7_0))
	end

	return var_6_1(arg_6_0)
end

function class(arg_8_0, arg_8_1)
	local var_8_0 = type(arg_8_1)
	local var_8_1

	if var_8_0 ~= "function" and var_8_0 ~= "table" then
		var_8_0 = nil
		arg_8_1 = nil
	end

	if var_8_0 == "function" or arg_8_1 and arg_8_1.__ctype == 1 then
		var_8_1 = {}

		if var_8_0 == "table" then
			for iter_8_0, iter_8_1 in pairs(arg_8_1) do
				var_8_1[iter_8_0] = iter_8_1
			end

			var_8_1.__create = arg_8_1.__create
			var_8_1.super = arg_8_1
		else
			var_8_1.__create = arg_8_1

			function var_8_1.ctor()
				return
			end
		end

		var_8_1.__cname = arg_8_0
		var_8_1.__ctype = 1

		function var_8_1.new(...)
			local var_10_0 = var_8_1.__create(...)

			for iter_10_0, iter_10_1 in pairs(var_8_1) do
				var_10_0[iter_10_0] = iter_10_1
			end

			var_10_0.class = var_8_1

			var_10_0:ctor(...)

			return var_10_0
		end
	else
		if arg_8_1 then
			var_8_1 = clone(arg_8_1)
			var_8_1.super = arg_8_1
		else
			var_8_1 = {
				ctor = function()
					return
				end
			}
		end

		var_8_1.__cname = arg_8_0
		var_8_1.__ctype = 2
		var_8_1.__index = var_8_1

		function var_8_1.new(...)
			local var_12_0 = setmetatable({}, var_8_1)

			var_12_0.class = var_8_1

			var_12_0:ctor(...)

			return var_12_0
		end
	end

	return var_8_1
end

function import(arg_13_0, arg_13_1)
	local var_13_0
	local var_13_1 = arg_13_0
	local var_13_2 = 1

	while true do
		if string.byte(arg_13_0, var_13_2) ~= 46 then
			var_13_1 = string.sub(arg_13_0, var_13_2)

			if var_13_0 and #var_13_0 > 0 then
				var_13_1 = table.concat(var_13_0, ".") .. "." .. var_13_1
			end

			break
		end

		var_13_2 = var_13_2 + 1

		if not var_13_0 then
			if not arg_13_1 then
				local var_13_3, var_13_4 = debug.getlocal(3, 1)

				arg_13_1 = var_13_4
			end

			arg_13_1 = string.gsub(arg_13_1, "/", ".")
			var_13_0 = string.split(arg_13_1, ".")
		end

		table.remove(var_13_0, #var_13_0)
	end

	local var_13_5 = string.gsub(var_13_1, "%.", "/")

	return require(var_13_5)
end

function export(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_1) do
		if type(iter_14_0) == "number" then
			var_14_0[iter_14_1] = arg_14_0[iter_14_1]
		else
			var_14_0[iter_14_0] = arg_14_0[iter_14_0] or iter_14_1
		end
	end

	return var_14_0
end

function isset(arg_15_0, arg_15_1)
	return type(arg_15_0) == "table" and arg_15_0[arg_15_1] ~= nil
end

function math.round(arg_16_0)
	return math.floor(arg_16_0 + 0.5)
end

function io.exists(arg_17_0)
	local var_17_0 = io.open(arg_17_0, "r")

	if var_17_0 then
		io.close(var_17_0)

		return true
	end

	return false
end

function io.readfile(arg_18_0)
	local var_18_0 = io.open(arg_18_0, "r")

	if var_18_0 then
		local var_18_1 = var_18_0:read("*a")

		io.close(var_18_0)

		return var_18_1
	end

	return nil
end

function getLuaParame(arg_19_0)
	local var_19_0 = ""

	for iter_19_0, iter_19_1 in ipairs(arg_19_0) do
		if iter_19_0 ~= 2 then
			var_19_0 = var_19_0 .. iter_19_1
		end
	end

	return var_19_0
end

function io.writefile(arg_20_0, arg_20_1, arg_20_2)
	arg_20_2 = arg_20_2 or "w+"

	local var_20_0 = io.open(arg_20_0, arg_20_2)

	if var_20_0 then
		if var_20_0:write(arg_20_1) == nil then
			return false
		end

		io.close(var_20_0)

		return true
	else
		return false
	end
end

function io.pathinfo(arg_21_0)
	local var_21_0 = string.len(arg_21_0)
	local var_21_1 = var_21_0 + 1

	while var_21_0 > 0 do
		local var_21_2 = string.byte(arg_21_0, var_21_0)

		if var_21_2 == 46 then
			var_21_1 = var_21_0
		elseif var_21_2 == 47 then
			break
		end

		var_21_0 = var_21_0 - 1
	end

	local var_21_3 = string.sub(arg_21_0, 1, var_21_0)
	local var_21_4 = string.sub(arg_21_0, var_21_0 + 1)
	local var_21_5 = var_21_1 - var_21_0
	local var_21_6 = string.sub(var_21_4, 1, var_21_5 - 1)
	local var_21_7 = string.sub(var_21_4, var_21_5)

	return {
		dirname = var_21_3,
		filename = var_21_4,
		basename = var_21_6,
		extname = var_21_7
	}
end

function io.filesize(arg_22_0)
	local var_22_0 = false
	local var_22_1 = io.open(arg_22_0, "r")

	if var_22_1 then
		local var_22_2 = var_22_1:seek()

		var_22_0 = var_22_1:seek("end")

		var_22_1:seek("set", var_22_2)
		io.close(var_22_1)
	end

	return var_22_0
end

function table.nums(arg_23_0)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in pairs(arg_23_0) do
		var_23_0 = var_23_0 + 1
	end

	return var_23_0
end

function table.keys(arg_24_0)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0) do
		var_24_0[#var_24_0 + 1] = iter_24_0
	end

	return var_24_0
end

function table.values(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0) do
		var_25_0[#var_25_0 + 1] = iter_25_1
	end

	return var_25_0
end

function table.merge(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in pairs(arg_26_1) do
		arg_26_0[iter_26_0] = iter_26_1
	end
end

function string.htmlspecialchars(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(string._htmlspecialchars_set) do
		arg_27_0 = string.gsub(arg_27_0, iter_27_0, iter_27_1)
	end

	return arg_27_0
end

string._htmlspecialchars_set = {}
string._htmlspecialchars_set["&"] = "&amp;"
string._htmlspecialchars_set["\""] = "&quot;"
string._htmlspecialchars_set["'"] = "&#039;"
string._htmlspecialchars_set["<"] = "&lt;"
string._htmlspecialchars_set[">"] = "&gt;"

function string.nl2br(arg_28_0)
	return string.gsub(arg_28_0, "\n", "<br />")
end

function string.text2html(arg_29_0)
	arg_29_0 = string.gsub(arg_29_0, "\t", "    ")
	arg_29_0 = string.htmlspecialchars(arg_29_0)
	arg_29_0 = string.gsub(arg_29_0, " ", "&nbsp;")
	arg_29_0 = string.nl2br(arg_29_0)

	return arg_29_0
end

function string.split(arg_30_0, arg_30_1)
	if arg_30_1 == "" then
		return false
	end

	local var_30_0 = 0
	local var_30_1 = {}

	for iter_30_0, iter_30_1 in function()
		return string.find(arg_30_0, arg_30_1, var_30_0, true)
	end do
		table.insert(var_30_1, string.sub(arg_30_0, var_30_0, iter_30_0 - 1))

		var_30_0 = iter_30_1 + 1
	end

	table.insert(var_30_1, string.sub(arg_30_0, var_30_0))

	return var_30_1
end

function string.ltrim(arg_32_0)
	return string.gsub(arg_32_0, "^[ \t\n\r]+", "")
end

function string.rtrim(arg_33_0)
	return string.gsub(arg_33_0, "[ \t\n\r]+$", "")
end

function string.trim(arg_34_0)
	arg_34_0 = string.gsub(arg_34_0, "^[ \t\n\r]+", "")

	return string.gsub(arg_34_0, "[ \t\n\r]+$", "")
end

function string.ucfirst(arg_35_0)
	return string.upper(string.sub(arg_35_0, 1, 1)) .. string.sub(arg_35_0, 2)
end

function string.urlencodeChar(arg_36_0)
	return "%" .. string.format("%02X", string.byte(arg_36_0))
end

function string.urlencode(arg_37_0)
	arg_37_0 = string.gsub(tostring(arg_37_0), "\n", "\r\n")
	arg_37_0 = string.gsub(arg_37_0, "([^%w%.%- ])", string.urlencodeChar)

	return string.gsub(arg_37_0, " ", "+")
end

function string.formatNumberThousands(arg_38_0)
	local var_38_0 = tostring(tonumber(arg_38_0))

	repeat
		var_38_0, k = string.gsub(var_38_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until k == 0

	return var_38_0
end

function string.startWith(arg_39_0, arg_39_1)
	if arg_39_0 == nil or arg_39_1 == nil then
		return nil, "the string or the sub-stirng parameter is nil"
	end

	if string.find(arg_39_0, arg_39_1) ~= 1 then
		return false
	else
		return true
	end
end

function string.endWith(arg_40_0, arg_40_1)
	if arg_40_0 == nil or arg_40_1 == nil then
		return nil, "the string or the sub-string parameter is nil"
	end

	local var_40_0 = string.reverse(arg_40_0)
	local var_40_1 = string.reverse(arg_40_1)

	if string.find(var_40_0, var_40_1) ~= 1 then
		return false
	else
		return true
	end
end
