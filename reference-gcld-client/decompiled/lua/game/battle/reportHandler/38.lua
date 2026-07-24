function doReport38(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.troops = {}
	arg_1_0.piliche = {}
	arg_1_0.explode = {}

	if var_1_0[2] ~= nil and var_1_0[2] ~= "null" and string.len(var_1_0[2]) > 0 then
		arg_1_0.troops.def = {}
		arg_1_0.explode.def = {}
		arg_1_0.explode.def[1] = {}
		arg_1_0.explode.def[1].side = "def"
		arg_1_0.explode.def[1].rowsExplode = {}

		local var_1_1 = stringSplit(var_1_0[2], ";")

		for iter_1_0 = 1, #var_1_1 do
			if iter_1_0 ~= 1 then
				local var_1_2 = var_1_1[iter_1_0]
				local var_1_3 = {}
				local var_1_4 = stringSplit(var_1_2, ",")

				var_1_3.row = tonumber(var_1_4[1])
				arg_1_0.explode.def[1].rowsExplode[iter_1_0] = tonumber(var_1_4[1])
				var_1_3.deadInfo = {}
				var_1_3.restBlood = {}

				for iter_1_1 = 1, 3 do
					local var_1_5 = stringSplit(var_1_4[iter_1_1 + 1], "*")

					var_1_3.deadInfo[iter_1_1] = tonumber(var_1_5[1])
					var_1_3.restBlood[iter_1_1] = tonumber(var_1_5[2])
				end

				table.insert(arg_1_0.troops.def, var_1_3)
			else
				local var_1_6 = stringSplit(var_1_1[iter_1_0], ",")

				arg_1_0.piliche.att = {}
				arg_1_0.piliche.att.startNum = tonumber(var_1_6[1])
				arg_1_0.piliche.att.side = "att"
			end
		end
	end

	if var_1_0[3] ~= nil and var_1_0[3] ~= "null" and string.len(var_1_0[3]) > 0 then
		arg_1_0.troops.att = {}
		arg_1_0.explode.att = {}
		arg_1_0.explode.att[1] = {}
		arg_1_0.explode.att[1].side = "att"
		arg_1_0.explode.att[1].rowsExplode = {}

		local var_1_7 = stringSplit(var_1_0[3], ";")

		for iter_1_2 = 1, #var_1_7 do
			if iter_1_2 ~= 1 then
				local var_1_8 = var_1_7[iter_1_2]
				local var_1_9 = {}
				local var_1_10 = stringSplit(var_1_8, ",")

				var_1_9.row = tonumber(var_1_10[1])
				arg_1_0.explode.att[1].rowsExplode[iter_1_2] = tonumber(var_1_10[1])
				var_1_9.deadInfo = {}
				var_1_9.restBlood = {}

				for iter_1_3 = 1, 3 do
					local var_1_11 = stringSplit(var_1_10[iter_1_3 + 1], "*")

					var_1_9.deadInfo[iter_1_3] = tonumber(var_1_11[1])
					var_1_9.restBlood[iter_1_3] = tonumber(var_1_11[2])
				end

				table.insert(arg_1_0.troops.att, var_1_9)
			else
				local var_1_12 = stringSplit(var_1_7[iter_1_2], ",")

				arg_1_0.piliche.def = {}
				arg_1_0.piliche.def.startNum = tonumber(var_1_12[1])
				arg_1_0.piliche.def.side = "def"
			end
		end
	end

	arg_1_0.stunBuff = {}

	if var_1_0[4] ~= nil and var_1_0[4] ~= "null" and string.len(var_1_0[4]) > 0 then
		local var_1_13 = stringSplit(var_1_0[4], ",")

		arg_1_0.piliche.att.carId = tonumber(var_1_13[1])

		if var_1_13[2] ~= nil and var_1_13[2] ~= "null" and string.len(var_1_13[2]) > 0 then
			arg_1_0.stunBuff.def = {}
			arg_1_0.stunBuff.def[1] = {}
			arg_1_0.stunBuff.def[1].side = "def"
			arg_1_0.stunBuff.def[1].rows = {}

			local var_1_14 = stringSplit(var_1_13[2], "*")

			for iter_1_4 = 1, #var_1_14 do
				if var_1_14[iter_1_4] ~= nil then
					arg_1_0.stunBuff.def[1].rows[iter_1_4] = tonumber(var_1_14[iter_1_4])
				end
			end
		end
	end

	if var_1_0[5] ~= nil and var_1_0[5] ~= "null" and string.len(var_1_0[5]) > 0 then
		local var_1_15 = stringSplit(var_1_0[5], ",")

		arg_1_0.piliche.def.carId = tonumber(var_1_15[1])

		if var_1_15[2] ~= nil and var_1_15[2] ~= "null" and string.len(var_1_15[2]) > 0 then
			arg_1_0.stunBuff.att = {}
			arg_1_0.stunBuff.att[1] = {}
			arg_1_0.stunBuff.att[1].side = "att"
			arg_1_0.stunBuff.att[1].rows = {}

			local var_1_16 = stringSplit(var_1_15[2], "*")

			for iter_1_5 = 1, #var_1_16 do
				if var_1_16[iter_1_5] ~= nil then
					arg_1_0.stunBuff.att[1].rows[iter_1_5] = tonumber(var_1_16[iter_1_5])
				end
			end
		end
	end
end
