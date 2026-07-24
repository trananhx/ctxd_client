function doReport25(arg_1_0, arg_1_1)
	log.info("##### do report 25 ####")
	log.info(arg_1_1)

	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])
	arg_1_0.playerId = tonumber(var_1_1[2])
	arg_1_0.sidePosition = tonumber(var_1_1[3])
	arg_1_0.amryTactics = {}

	for iter_1_0 = 2, #var_1_0 do
		local var_1_2 = stringSplit(var_1_0[iter_1_0], "|")
		local var_1_3 = tonumber(var_1_2[1])
		local var_1_4 = tonumber(var_1_2[2])

		arg_1_0.amryTactics[var_1_3] = var_1_4
	end
end
