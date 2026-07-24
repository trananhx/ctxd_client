function doReport43(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])
	arg_1_0.result = tonumber(var_1_1[2])

	local var_1_2 = stringSplit(var_1_0[2], "|")
	local var_1_3 = stringSplit(var_1_2[1], ",")

	arg_1_0.attackerRow = tonumber(var_1_3[1])
	arg_1_0.attackerId = tonumber(var_1_3[2])

	local var_1_4 = stringSplit(var_1_2[2], ",")

	arg_1_0.defenerRow = tonumber(var_1_4[1])
	arg_1_0.defenerId = tonumber(var_1_4[2])

	local var_1_5 = stringSplit(var_1_0[3], "|")

	arg_1_0.stategyShow = {}

	for iter_1_0 = 1, 2 do
		local var_1_6 = "att"

		if iter_1_0 == 2 then
			var_1_6 = "def"
		end

		local var_1_7 = {}
		local var_1_8 = stringSplit(var_1_5[iter_1_0], ",")

		var_1_7.side = var_1_6
		var_1_7.type = tonumber(var_1_8[1])
		var_1_7.succ = tonumber(var_1_8[2])
		var_1_7.tacticsId = tonumber(var_1_8[3])
		var_1_7.beHold = tonumber(var_1_8[4])
		var_1_7.showTacticsId = tonumber(var_1_8[5])
		var_1_7.backgound = var_1_8[6]
		var_1_7.nextTacticId = tonumber(var_1_8[7])
		var_1_7.nextTacticName = var_1_8[8]
		var_1_7.takeEffect = var_1_7.beHold == 0
		var_1_7.isWorldFightWeaken = tonumber(var_1_8[9])
		var_1_7.leftPic = var_1_8[10]
		var_1_7.rightPic = var_1_8[11]

		if var_1_8[12] then
			var_1_7.luanwu = tonumber(var_1_8[12])
		end

		arg_1_0.stategyShow[var_1_6] = var_1_7
	end

	local var_1_9 = stringSplit(var_1_0[4], "|")

	arg_1_0.troops = {}

	for iter_1_1 = 1, 2 do
		local var_1_10 = stringSplit(var_1_9[iter_1_1], "*")

		if var_1_9[iter_1_1] ~= "null" then
			local var_1_11 = "att"

			if iter_1_1 == 2 then
				var_1_11 = "def"
			end

			arg_1_0.troops[var_1_11] = {}

			for iter_1_2, iter_1_3 in pairs(var_1_10) do
				if iter_1_3 ~= "" then
					local var_1_12 = {}
					local var_1_13 = stringSplit(iter_1_3, ",")

					var_1_12.row = tonumber(var_1_13[1])
					var_1_12.deadInfo = {}
					var_1_12.deadInfo[1] = tonumber(var_1_13[2])
					var_1_12.deadInfo[2] = tonumber(var_1_13[4])
					var_1_12.deadInfo[3] = tonumber(var_1_13[6])

					table.insert(arg_1_0.troops[var_1_11], var_1_12)
				end
			end
		end
	end

	local var_1_14 = stringSplit(var_1_0[5], "|")

	if var_1_14[1] and var_1_14[1] ~= "null" then
		local var_1_15 = stringSplit(var_1_14[1], ":")

		arg_1_0.attMeihuoLine = tonumber(var_1_15[1])
		arg_1_0.attBsPro = tonumber(var_1_15[2])
	end

	if var_1_14[2] and var_1_14[2] ~= "null" then
		local var_1_16 = stringSplit(var_1_14[2], ",")

		arg_1_0.defMeihuoLine = tonumber(var_1_16[1])
		arg_1_0.defBsPro = tonumber(var_1_16[2])
	end
end
