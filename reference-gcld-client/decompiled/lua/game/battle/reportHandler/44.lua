function doReport44(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")
	local var_1_1 = {
		stringSplit(var_1_0[2], ";"),
		(stringSplit(var_1_0[3], ";"))
	}

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.attLoseTotal = tonumber(var_1_0[4])
	arg_1_0.defLoseTotal = tonumber(var_1_0[5])
	arg_1_0.troops = {}
	arg_1_0.troops.att = {}
	arg_1_0.troops.def = {}

	for iter_1_0 = 1, 2 do
		for iter_1_1 = 1, #var_1_1[iter_1_0] do
			if var_1_1[iter_1_0][iter_1_1] then
				local var_1_2 = stringSplit(var_1_1[iter_1_0][iter_1_1], ",")

				if var_1_2 then
					local var_1_3 = {
						row = tonumber(var_1_2[1]),
						deadInfo = {}
					}

					for iter_1_2 = 1, 3 do
						local var_1_4 = stringSplit(var_1_2[iter_1_2 + 1], "*")

						var_1_3.deadInfo[iter_1_2] = tonumber(var_1_4[1])
					end

					if iter_1_0 == 1 then
						table.insert(arg_1_0.troops.att, var_1_3)
					else
						table.insert(arg_1_0.troops.def, var_1_3)
					end
				end
			end
		end
	end
end
