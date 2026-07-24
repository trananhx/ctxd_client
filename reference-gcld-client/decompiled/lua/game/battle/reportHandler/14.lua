function doReport14(arg_1_0, arg_1_1)
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

	arg_1_0.stunBuff = {}

	local var_1_14 = stringSplit(var_1_0[6], "|")

	for iter_1_4 = 1, 2 do
		if var_1_14[iter_1_4] ~= "null" then
			local var_1_15 = stringSplit(var_1_14[iter_1_4], ",")
			local var_1_16 = {}

			if iter_1_4 == 1 then
				var_1_16.side = "att"
			else
				var_1_16.side = "def"
			end

			var_1_16.rows = {}

			for iter_1_5, iter_1_6 in pairs(var_1_15) do
				table.insert(var_1_16.rows, tonumber(iter_1_6))
			end

			table.insert(arg_1_0.stunBuff, var_1_16)
		end
	end

	if #var_1_0 >= 8 then
		local var_1_17 = stringSplit(var_1_0[8], "|")
		local var_1_18 = stringSplit(var_1_17[1], ",")
		local var_1_19 = stringSplit(var_1_17[2], ",")

		arg_1_0.attZhuge = tonumber(var_1_18[1])
		arg_1_0.attRetry = tonumber(var_1_18[2])

		if var_1_18[3] then
			arg_1_0.attZhugeXR = tonumber(var_1_18[3])
		end

		arg_1_0.defZhuge = tonumber(var_1_19[1])
		arg_1_0.defRetry = tonumber(var_1_19[2])

		if var_1_19[3] then
			arg_1_0.defZhugeXR = tonumber(var_1_19[3])
		end
	end

	if #var_1_0 >= 9 then
		local var_1_20 = stringSplit(var_1_0[9], "|")

		arg_1_0.zhouAttFire = tonumber(var_1_20[1])
		arg_1_0.zhouDefFire = tonumber(var_1_20[2])
	end

	arg_1_0.shieldInfo = {}

	if #var_1_0 >= 10 then
		local var_1_21 = stringSplit(var_1_0[10], "|")

		for iter_1_7 = 1, 2 do
			if var_1_21[iter_1_7] ~= "null" then
				local var_1_22 = stringSplit(var_1_21[iter_1_7], ",")
				local var_1_23 = {}

				if iter_1_7 == 1 then
					var_1_23.side = "att"
				else
					var_1_23.side = "def"
				end

				var_1_23.rows = {}

				for iter_1_8, iter_1_9 in pairs(var_1_22) do
					local var_1_24 = stringSplit(iter_1_9, ":")
					local var_1_25 = {
						tonumber(var_1_24[1]),
						(tonumber(var_1_24[2]))
					}

					table.insert(var_1_23.rows, var_1_25)
				end

				table.insert(arg_1_0.shieldInfo, var_1_23)
			end
		end
	end
end
