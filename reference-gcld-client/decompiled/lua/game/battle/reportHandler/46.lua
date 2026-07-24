function doReport46(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.attDeadRow = {}

	if var_1_0[3] ~= "null" then
		local var_1_1 = stringSplit(var_1_0[3], ",")

		for iter_1_0 = 1, #var_1_1 do
			arg_1_0.attDeadRow[iter_1_0] = tonumber(var_1_1[iter_1_0])
		end
	end

	arg_1_0.defDeadRow = {}

	if var_1_0[4] ~= "null" then
		local var_1_2 = stringSplit(var_1_0[4], ",")

		for iter_1_1 = 1, #var_1_2 do
			arg_1_0.defDeadRow[iter_1_1] = tonumber(var_1_2[iter_1_1])
		end
	end
end
