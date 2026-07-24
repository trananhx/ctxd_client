function doReport34(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.side = var_1_0[2]
	arg_1_0.fireNum = tonumber(var_1_0[3])

	local var_1_1 = stringSplit(var_1_0[4], ";")

	arg_1_0.troops = {}
	arg_1_0.troops[arg_1_0.side] = {}

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		if iter_1_1 ~= nil then
			local var_1_2 = stringSplit(iter_1_1, ",")
			local var_1_3 = {
				row = tonumber(var_1_2[1]),
				deadInfo = {},
				restBlood = {}
			}

			for iter_1_2 = 1, 3 do
				local var_1_4 = stringSplit(var_1_2[iter_1_2 + 1], "*")

				var_1_3.deadInfo[iter_1_2] = tonumber(var_1_4[1])
				var_1_3.restBlood[iter_1_2] = tonumber(var_1_4[2])
			end

			table.insert(arg_1_0.troops[arg_1_0.side], var_1_3)
		end
	end
end
