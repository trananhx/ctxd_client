function doReport19(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")

	arg_1_0.side = stringSplit(var_1_0[1], "|")[2]

	local var_1_1 = stringSplit(var_1_0[2], "|")

	arg_1_0.playerId = tonumber(var_1_1[1])
	arg_1_0.generalExp = tonumber(var_1_1[2])
	arg_1_0.lvup = tonumber(var_1_1[3])
	arg_1_0.rewards = {}

	local var_1_2 = stringSplit(var_1_0[3], "|")

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_3 = stringSplit(iter_1_1, "*")
		local var_1_4 = tonumber(var_1_3[1])
		local var_1_5 = tonumber(var_1_3[2])

		table.insert(arg_1_0.rewards, {
			type = ybMaterialTypes[var_1_4] or var_1_4,
			num = var_1_5
		})
	end
end
