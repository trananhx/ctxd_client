function doReport47(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.side = var_1_1[2]
	arg_1_0.reportId = tonumber(var_1_1[1])
	arg_1_0.troops = {}

	for iter_1_0 = 2, #var_1_0 do
		if var_1_0[iter_1_0] then
			local var_1_2 = stringSplit(var_1_0[iter_1_0], "|")
			local var_1_3 = {
				row = tonumber(var_1_2[1])
			}

			if var_1_2[2] then
				local var_1_4 = stringSplit(var_1_2[2], ",")
				local var_1_5 = stringSplit(var_1_4[1], "*")

				var_1_3.hp = tonumber(var_1_5[1])
				var_1_3.hpMax = tonumber(var_1_5[2])
				var_1_3.shield = tonumber(var_1_5[3])
				var_1_3.shieldMax = tonumber(var_1_5[4])
				var_1_3.attack = tonumber(var_1_5[5])
				var_1_3.defense = tonumber(var_1_5[6])
				var_1_3.zfShield = tonumber(var_1_5[7])
				var_1_3.carHp = tonumber(var_1_5[8])
				var_1_3.carMaxHp = tonumber(var_1_5[9])
			end

			table.insert(arg_1_0.troops, var_1_3)
		end
	end
end
