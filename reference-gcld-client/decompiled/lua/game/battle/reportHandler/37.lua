function doReport37(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.side = var_1_0[2]
	arg_1_0.leftPic = var_1_0[3]
	arg_1_0.rightPic = var_1_0[4]
end
