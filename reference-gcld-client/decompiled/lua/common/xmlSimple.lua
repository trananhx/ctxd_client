module(..., package.seeall)

function newParser()
	XmlParser = {}

	function XmlParser.ToXmlString(arg_2_0, arg_2_1)
		arg_2_1 = string.gsub(arg_2_1, "&", "&amp;")
		arg_2_1 = string.gsub(arg_2_1, "<", "&lt;")
		arg_2_1 = string.gsub(arg_2_1, ">", "&gt;")
		arg_2_1 = string.gsub(arg_2_1, "\"", "&quot;")
		arg_2_1 = string.gsub(arg_2_1, "([^%w%&%;%p%\t% ])", function(arg_3_0)
			return string.format("&#x%X;", string.byte(arg_3_0))
		end)

		return arg_2_1
	end

	function XmlParser.FromXmlString(arg_4_0, arg_4_1)
		arg_4_1 = string.gsub(arg_4_1, "&#x([%x]+)%;", function(arg_5_0)
			return string.char(tonumber(arg_5_0, 16))
		end)
		arg_4_1 = string.gsub(arg_4_1, "&#([0-9]+)%;", function(arg_6_0)
			return string.char(tonumber(arg_6_0, 10))
		end)
		arg_4_1 = string.gsub(arg_4_1, "&quot;", "\"")
		arg_4_1 = string.gsub(arg_4_1, "&apos;", "'")
		arg_4_1 = string.gsub(arg_4_1, "&gt;", ">")
		arg_4_1 = string.gsub(arg_4_1, "&lt;", "<")
		arg_4_1 = string.gsub(arg_4_1, "&amp;", "&")

		return arg_4_1
	end

	function XmlParser.ParseArgs(arg_7_0, arg_7_1, arg_7_2)
		string.gsub(arg_7_2, "(%w+)=([\"'])(.-)%2", function(arg_8_0, arg_8_1, arg_8_2)
			arg_7_1:addProperty(arg_8_0, arg_7_0:FromXmlString(arg_8_2))
		end)
	end

	function XmlParser.ParseXmlText(arg_9_0, arg_9_1)
		local var_9_0 = {}
		local var_9_1 = newNode()

		table.insert(var_9_0, var_9_1)

		local var_9_2
		local var_9_3
		local var_9_4
		local var_9_5
		local var_9_6
		local var_9_7 = 1
		local var_9_8 = 1

		while true do
			local var_9_9, var_9_10, var_9_11, var_9_12, var_9_13, var_9_14 = string.find(arg_9_1, "<(%/?)([%w_:]+)(.-)(%/?)>", var_9_7)

			if not var_9_9 then
				break
			end

			local var_9_15 = string.sub(arg_9_1, var_9_7, var_9_9 - 1)

			if not string.find(var_9_15, "^%s*$") then
				local var_9_16 = (var_9_1:value() or "") .. arg_9_0:FromXmlString(var_9_15)

				var_9_0[#var_9_0]:setValue(var_9_16)
			end

			if var_9_14 == "/" then
				local var_9_17 = newNode(var_9_12)

				arg_9_0:ParseArgs(var_9_17, var_9_13)
				var_9_1:addChild(var_9_17)
			elseif var_9_11 == "" then
				local var_9_18 = newNode(var_9_12)

				arg_9_0:ParseArgs(var_9_18, var_9_13)
				table.insert(var_9_0, var_9_18)

				var_9_1 = var_9_18
			else
				local var_9_19 = table.remove(var_9_0)

				var_9_1 = var_9_0[#var_9_0]

				if #var_9_0 < 1 then
					error("XmlParser: nothing to close with " .. var_9_12)
				end

				if var_9_19:name() ~= var_9_12 then
					error("XmlParser: trying to close " .. var_9_19:name() .. " with " .. var_9_12)
				end

				var_9_1:addChild(var_9_19)
			end

			var_9_7 = var_9_10 + 1
		end

		local var_9_20 = string.sub(arg_9_1, var_9_7)

		if #var_9_0 > 1 then
			error("XmlParser: unclosed " .. var_9_0[#var_9_0]:name())
		end

		return var_9_1
	end

	function XmlParser.loadFile(arg_10_0, arg_10_1)
		local var_10_0, var_10_1 = io.open(arg_10_1, "r")

		if var_10_0 and not var_10_1 then
			local var_10_2 = var_10_0:read("*a")
			local var_10_3 = string.gsub(var_10_2, "<!%[CDATA%[", "")
			local var_10_4 = string.gsub(var_10_3, "]]>", "")
			local var_10_5 = string.gsub(var_10_4, "<br>", "[br]")

			io.close(var_10_0)

			return arg_10_0:ParseXmlText(var_10_5), nil
		else
			print(var_10_1)

			return nil
		end
	end

	return XmlParser
end

function newNode(arg_11_0)
	local var_11_0 = {}

	var_11_0.___value = nil
	var_11_0.___name = arg_11_0
	var_11_0.___children = {}
	var_11_0.___props = {}

	function var_11_0.value(arg_12_0)
		return arg_12_0.___value
	end

	function var_11_0.setValue(arg_13_0, arg_13_1)
		arg_13_0.___value = arg_13_1
	end

	function var_11_0.name(arg_14_0)
		return arg_14_0.___name
	end

	function var_11_0.setName(arg_15_0, arg_15_1)
		arg_15_0.___name = arg_15_1
	end

	function var_11_0.children(arg_16_0)
		return arg_16_0.___children
	end

	function var_11_0.numChildren(arg_17_0)
		return #arg_17_0.___children
	end

	function var_11_0.addChild(arg_18_0, arg_18_1)
		if arg_18_0[arg_18_1:name()] ~= nil then
			if type(arg_18_0[arg_18_1:name()].name) == "function" then
				local var_18_0 = {}

				table.insert(var_18_0, arg_18_0[arg_18_1:name()])

				arg_18_0[arg_18_1:name()] = var_18_0
			end

			table.insert(arg_18_0[arg_18_1:name()], arg_18_1)
		else
			arg_18_0[arg_18_1:name()] = arg_18_1
		end

		table.insert(arg_18_0.___children, arg_18_1)
	end

	function var_11_0.properties(arg_19_0)
		return arg_19_0.___props
	end

	function var_11_0.numProperties(arg_20_0)
		return #arg_20_0.___props
	end

	function var_11_0.addProperty(arg_21_0, arg_21_1, arg_21_2)
		local var_21_0 = "@" .. arg_21_1

		if arg_21_0[var_21_0] ~= nil then
			if type(arg_21_0[var_21_0]) == "string" then
				local var_21_1 = {}

				table.insert(var_21_1, arg_21_0[var_21_0])

				arg_21_0[var_21_0] = var_21_1
			end

			table.insert(arg_21_0[var_21_0], arg_21_2)
		else
			arg_21_0[var_21_0] = arg_21_2
		end

		table.insert(arg_21_0.___props, {
			name = arg_21_1,
			value = arg_21_0[arg_21_1]
		})
	end

	return var_11_0
end
