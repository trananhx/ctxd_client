function doReport53(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = stringSplit(var_1_0[2], "*")

	arg_1_0.surround = tonumber(var_1_1[1])

	local var_1_2 = stringSplit(var_1_1[2], ":")

	arg_1_0.slam = tonumber(var_1_2[1])
	arg_1_0.slamCd = tonumber(var_1_2[2])

	local var_1_3 = var_1_1[3]

	if var_1_3 == nil or var_1_3 == "null" then
		return
	end

	local var_1_4 = "def"

	arg_1_0.troops = {}
	arg_1_0.troops[var_1_4] = {}

	local var_1_5 = stringSplit(var_1_3, ";")

	for iter_1_0, iter_1_1 in ipairs(var_1_5) do
		if iter_1_1 ~= "" then
			local var_1_6 = {}
			local var_1_7 = stringSplit(iter_1_1, ",")

			var_1_6.row = tonumber(var_1_7[1])
			var_1_6.deadInfo = {}
			var_1_6.deadInfo[1] = tonumber(var_1_7[2])
			var_1_6.deadInfo[2] = tonumber(var_1_7[2])
			var_1_6.deadInfo[3] = tonumber(var_1_7[2])

			table.insert(arg_1_0.troops[var_1_4], var_1_6)
		end
	end
end
