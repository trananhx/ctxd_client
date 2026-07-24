function doReport39(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = stringSplit(var_1_0[2], ";")

	arg_1_0.troops = {}
	arg_1_0.explode = {}

	for iter_1_0 = 1, 2 do
		local var_1_2 = iter_1_0 == 1 and "att" or "def"

		arg_1_0.troops[var_1_2] = {}

		local var_1_3 = stringSplit(var_1_1[iter_1_0], ",")
		local var_1_4 = {
			row = tonumber(var_1_3[1]),
			deadInfo = {}
		}
		local var_1_5 = stringSplit(var_1_3[2], "*")
		local var_1_6 = tonumber(var_1_5[1])

		if var_1_6 > 0 then
			for iter_1_1 = 1, 3 do
				table.insert(var_1_4.deadInfo, var_1_6)
			end
		end

		table.insert(arg_1_0.troops[var_1_2], var_1_4)
	end
end
