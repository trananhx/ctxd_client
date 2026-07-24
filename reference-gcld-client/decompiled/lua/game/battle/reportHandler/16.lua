function doReport16(arg_1_0, arg_1_1)
	local var_1_0 = rmgr.getSData("battle_buff")
	local var_1_1 = stringSplit(arg_1_1, ";")
	local var_1_2 = stringSplit(var_1_1[1], "|")

	arg_1_0.reportId = tonumber(var_1_2[1])
	arg_1_0.side = var_1_2[2]
	arg_1_0.lv = tonumber(var_1_2[3])
	arg_1_0.hp = tonumber(var_1_2[4])
	arg_1_0.maxHp = tonumber(var_1_2[5])
	arg_1_0.killNum = tonumber(var_1_2[6])
	arg_1_0.zbTimes = tonumber(var_1_2[7])
	arg_1_0.zbAllTimes = tonumber(var_1_2[8])

	local var_1_3 = stringSplit(var_1_1[2], "|")

	arg_1_0.force = tonumber(var_1_3[1])
	arg_1_0.playerName = var_1_3[2]
	arg_1_0.generalname = var_1_3[3]
	arg_1_0.pic = var_1_3[4]
	arg_1_0.quality = tonumber(var_1_3[5])
	arg_1_0.expMode = tonumber(var_1_3[6])

	if #var_1_3 >= 9 then
		arg_1_0.isZhaoyun = tonumber(var_1_3[9])

		if var_1_3[10] and var_1_3[10] ~= "null" then
			arg_1_0.specialNpc = var_1_3[10]
		end
	end

	local var_1_4 = stringSplit(var_1_1[3], "|")
	local var_1_5 = {}

	for iter_1_0, iter_1_1 in pairs(var_1_4) do
		if iter_1_1 and iter_1_1 ~= "null" then
			local var_1_6 = stringSplit(iter_1_1, "*")
			local var_1_7 = var_1_6[1]
			local var_1_8 = ""
			local var_1_9 = stringSplit(var_1_6[2], ",")
			local var_1_10 = var_1_0[var_1_7]

			if var_1_10 then
				var_1_8 = tool.getStringWithParams(var_1_10.msg, unpack(var_1_9))

				if tonumber(var_1_7) >= 70 and tonumber(var_1_7) <= 73 then
					var_1_8 = string.gsub(var_1_8, "&#x000A;", "：")
				end
			end

			table.insert(var_1_5, {
				id = var_1_7,
				tip = var_1_8
			})
		end
	end

	arg_1_0.buffs = var_1_5
end
