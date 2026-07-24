function doReport26(arg_1_0, arg_1_1)
	log.info("doReport26: " .. arg_1_1)

	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.roundTimeCost = tonumber(var_1_0[2])
	arg_1_0.towerNextAttackRound = tonumber(var_1_0[3])
	arg_1_0.towerBlood = tonumber(var_1_0[4])
	arg_1_0.towerMaxAttackRound = tonumber(var_1_0[5])

	if var_1_0[6] then
		arg_1_0.ligntningNum = tonumber(var_1_0[6])
	end
end
