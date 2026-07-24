function doReport3(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "=")
	local var_1_1 = stringSplit(var_1_0[1], ";")

	arg_1_0.fight = {}

	local var_1_2 = stringSplit(var_1_1[1], "|")

	arg_1_0.reportId = tonumber(var_1_2[1])
	arg_1_0.fightRoundId = tonumber(var_1_2[2])
	arg_1_0.fightResult = tonumber(var_1_2[3])

	local var_1_3 = stringSplit(var_1_1[2], "|")

	arg_1_0.fight.attRow = tonumber(var_1_3[1])
	arg_1_0.fight.defRow = tonumber(var_1_3[2])

	local var_1_4 = stringSplit(var_1_1[3], "*")
	local var_1_5 = {}
	local var_1_6 = {}

	for iter_1_0, iter_1_1 in pairs(var_1_4) do
		if iter_1_1 ~= nil then
			local var_1_7 = stringSplit(iter_1_1, ",")

			for iter_1_2, iter_1_3 in pairs(var_1_7) do
				if iter_1_2 == #var_1_7 then
					break
				end

				if iter_1_3 ~= nil then
					local var_1_8 = stringSplit(iter_1_3, "|")
					local var_1_9 = tonumber(var_1_8[1])
					local var_1_10 = tonumber(var_1_8[2])
					local var_1_11 = tonumber(var_1_8[3])
					local var_1_12 = stringSplit(var_1_8[2], ":")

					if var_1_12[1] == "ms" then
						var_1_10 = -100000000
					elseif var_1_12[1] == "bj" then
						if tonumber(var_1_12[2]) >= 0 then
							var_1_10 = 0 - tonumber(var_1_12[2]) - 200000000
						else
							var_1_10 = tonumber(var_1_12[2])
						end
					end

					local var_1_13 = stringSplit(var_1_8[3], ":")

					if var_1_13[1] == "ms" then
						var_1_11 = -100000000
					elseif var_1_13[1] == "bj" then
						if tonumber(var_1_13[2]) >= 0 then
							var_1_11 = 0 - tonumber(var_1_13[2]) - 200000000
						else
							var_1_11 = tonumber(var_1_13[2])
						end
					end

					var_1_5[var_1_9] = var_1_5[var_1_9] or {}
					var_1_5[var_1_9][iter_1_0] = var_1_5[var_1_9][iter_1_0] or {}
					var_1_5[var_1_9][iter_1_0] = var_1_10
					var_1_6[var_1_9] = var_1_6[var_1_9] or {}
					var_1_6[var_1_9][iter_1_0] = var_1_6[var_1_9][iter_1_0] or {}
					var_1_6[var_1_9][iter_1_0] = var_1_11
				end
			end
		end
	end

	arg_1_0.attDead = var_1_5
	arg_1_0.defDead = var_1_6
	arg_1_0.troops = {}

	local var_1_14 = var_1_0[2]

	if var_1_14 then
		local var_1_15 = false
		local var_1_16 = stringSplit(var_1_14, ":")

		for iter_1_4 = 1, 2 do
			local var_1_17 = var_1_16[iter_1_4]

			if var_1_17 ~= "null" then
				local var_1_18 = "att"

				if iter_1_4 == 2 then
					var_1_18 = "def"
				end

				local var_1_19 = stringSplit(var_1_17, "*")

				for iter_1_5, iter_1_6 in ipairs(var_1_19) do
					local var_1_20
					local var_1_21 = stringSplit(iter_1_6, ";")

					for iter_1_7, iter_1_8 in ipairs(var_1_21) do
						local var_1_22 = stringSplit(iter_1_8, "|")

						for iter_1_9, iter_1_10 in ipairs(var_1_22) do
							local var_1_23 = stringSplit(iter_1_10, ",")

							if #var_1_23 == 3 then
								var_1_20 = tonumber(var_1_23[1])
							end

							arg_1_0.troops[iter_1_9] = arg_1_0.troops[iter_1_9] or {}
							arg_1_0.troops[iter_1_9][var_1_18] = arg_1_0.troops[iter_1_9][var_1_18] or {}
							arg_1_0.troops[iter_1_9][var_1_18][var_1_20] = arg_1_0.troops[iter_1_9][var_1_18][var_1_20] or {}
							arg_1_0.troops[iter_1_9][var_1_18][var_1_20].deadInfo = arg_1_0.troops[iter_1_9][var_1_18][var_1_20].deadInfo or {}

							if #var_1_23 == 3 then
								var_1_20 = tonumber(var_1_23[1])
								arg_1_0.troops[iter_1_9][var_1_18][var_1_20].deadInfo[iter_1_7] = tonumber(var_1_23[2])
							else
								arg_1_0.troops[iter_1_9][var_1_18][var_1_20].deadInfo[iter_1_7] = tonumber(var_1_23[1])
							end

							if iter_1_7 == 1 then
								arg_1_0.troops[iter_1_9][var_1_18][var_1_20].row = var_1_20
							end

							if var_1_18 == "att" and var_1_20 == arg_1_0.fight.attRow or var_1_18 == "def" and var_1_20 == arg_1_0.fight.defRow then
								var_1_15 = true
							end
						end
					end
				end
			end
		end

		if var_1_15 then
			arg_1_0.troops = {}
		end
	end

	arg_1_0.attack = {}

	local var_1_24 = var_1_0[3]

	if var_1_24 then
		local var_1_25 = stringSplit(var_1_24, ":")

		for iter_1_11 = 1, 2 do
			local var_1_26 = var_1_25[iter_1_11]

			if var_1_26 ~= "null" then
				local var_1_27 = "att"

				if iter_1_11 == 2 then
					var_1_27 = "def"
				end

				arg_1_0.attack[var_1_27] = {}

				local var_1_28 = stringSplit(var_1_26, "*")

				for iter_1_12, iter_1_13 in ipairs(var_1_28) do
					table.insert(arg_1_0.attack[var_1_27], tonumber(iter_1_13))
				end
			end
		end
	end
end
