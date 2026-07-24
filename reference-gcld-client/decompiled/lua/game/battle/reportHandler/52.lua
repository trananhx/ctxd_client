function doReport52(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = stringSplit(var_1_0[2], "*")
	local var_1_2 = var_1_1[1]
	local var_1_3 = stringSplit(var_1_1[2], ";")
	local var_1_4 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_3) do
		local var_1_5 = {}
		local var_1_6 = stringSplit(iter_1_1, ",")

		for iter_1_2, iter_1_3 in ipairs(var_1_6) do
			local var_1_7 = stringSplit(iter_1_3, ":")
			local var_1_8 = tonumber(var_1_7[1])
			local var_1_9 = tonumber(var_1_7[2])

			table.insert(var_1_5, {
				row = var_1_8,
				lv = var_1_9
			})
		end

		table.insert(var_1_4, var_1_5)
	end

	if var_1_2 == "att" then
		arg_1_0.attBuQuArray = var_1_4
	else
		arg_1_0.defBuQuArray = var_1_4
	end
end
