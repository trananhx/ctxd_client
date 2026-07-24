function doReport13(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.attacker = {}
	arg_1_0.defender = {}

	for iter_1_0 = 2, 3 do
		local var_1_1 = var_1_0[iter_1_0]

		if var_1_1 ~= "null" then
			local var_1_2 = stringSplit(var_1_1, ";")

			for iter_1_1, iter_1_2 in pairs(var_1_2) do
				if string.len(iter_1_2) > 0 then
					local var_1_3 = stringSplit(iter_1_2, ",")
					local var_1_4 = {
						id = tonumber(var_1_3[1]),
						playerId = tonumber(var_1_3[2]),
						playerName = var_1_3[3],
						generalName = var_1_3[4],
						gQuality = tonumber(var_1_3[5]),
						state = tonumber(var_1_3[6]),
						join = tonumber(var_1_3[7]),
						forceId = tonumber(var_1_3[8])
					}

					if iter_1_0 == 2 then
						table.insert(arg_1_0.attacker, var_1_4)
					else
						table.insert(arg_1_0.defender, var_1_4)
					end
				end
			end
		end
	end

	local var_1_5 = var_1_0[4]

	arg_1_0.newJoinList = {}

	if var_1_5 and var_1_5 ~= "null" then
		local var_1_6 = stringSplit(var_1_5, ";")

		for iter_1_3, iter_1_4 in pairs(var_1_6) do
			if string.len(iter_1_4) > 0 then
				local var_1_7 = stringSplit(iter_1_4, ",")
				local var_1_8 = {
					id = tonumber(var_1_7[1]),
					playerId = tonumber(var_1_7[2]),
					playerName = var_1_7[3],
					generalName = var_1_7[4],
					gQuality = tonumber(var_1_7[5])
				}

				if tonumber(var_1_7[8]) == 0 then
					var_1_8.side = "att"
				else
					var_1_8.side = "def"
				end

				var_1_8.forceId = tonumber(var_1_7[9])

				table.insert(arg_1_0.newJoinList, var_1_8)
			end
		end
	end

	arg_1_0.attackerNum = tonumber(var_1_0[5])
	arg_1_0.defenderNum = tonumber(var_1_0[6])
end
