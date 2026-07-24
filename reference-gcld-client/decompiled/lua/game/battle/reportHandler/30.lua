function doReport30(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = stringSplit(var_1_0[2], ",")
	local var_1_2 = stringSplit(var_1_0[3], ",")

	arg_1_0.attDeadRow = {}
	arg_1_0.defDeadRow = {}
end
