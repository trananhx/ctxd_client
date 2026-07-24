function doReport12(arg_1_0, arg_1_1)
	log.info("doReport12", arg_1_1)

	local var_1_0 = stringSplit(arg_1_1, ";")

	if not arg_1_0.armys then
		arg_1_0.armys = {}
	end

	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])

	local var_1_2

	for iter_1_0 = 2, 3 do
		local var_1_3 = var_1_0[iter_1_0]
		local var_1_4 = "att"

		if iter_1_0 == 3 then
			var_1_4 = "def"
		end

		print("&&&&&&&&&&&&&&&:", var_1_3, "-----------", var_1_0)

		if var_1_3 ~= nil and var_1_3 ~= "null" and string.len(var_1_3) > 0 then
			local var_1_5 = stringSplit(var_1_3, "|")
			local var_1_6 = {
				side = var_1_4,
				row = tonumber(var_1_5[1]),
				playerId = tonumber(var_1_5[2]),
				troopSerial = tonumber(var_1_5[3]),
				troopType = tonumber(var_1_5[4])
			}

			if var_1_6.troopType == 0 then
				var_1_6.troopType = var_1_5[4]
			end

			var_1_6.troopName = var_1_5[5]
			var_1_6.resType = tonumber(var_1_5[6])
			var_1_6.tacticsId = tonumber(var_1_5[7])
			var_1_6.teamEffect = tonumber(var_1_5[8])

			if #var_1_5 == 9 then
				var_1_6.hpList = var_1_5[9]
			elseif #var_1_5 == 10 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.hpList = var_1_5[10]
			elseif #var_1_5 == 11 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isMain = tonumber(var_1_5[10])
				var_1_6.hpList = var_1_5[11]
			elseif #var_1_5 == 12 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])
				var_1_6.hpList = var_1_5[12]
			elseif #var_1_5 == 13 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_7 = stringSplit(var_1_5[12], "_")

				if #var_1_7 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_7[1])
					var_1_6.xianzhengNum = tonumber(var_1_7[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.hpList = var_1_5[13]
			elseif #var_1_5 == 14 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_8 = stringSplit(var_1_5[12], "_")

				if #var_1_8 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_8[1])
					var_1_6.xianzhengNum = tonumber(var_1_8[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.hpList = var_1_5[14]
			elseif #var_1_5 == 16 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_9 = stringSplit(var_1_5[12], "_")

				if #var_1_9 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_9[1])
					var_1_6.xianzhengNum = tonumber(var_1_9[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.attack = tonumber(var_1_5[14])
				var_1_6.defense = tonumber(var_1_5[15])
				var_1_6.hpList = var_1_5[16]
			elseif #var_1_5 == 17 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_10 = stringSplit(var_1_5[12], "_")

				if #var_1_10 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_10[1])
					var_1_6.xianzhengNum = tonumber(var_1_10[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.attack = tonumber(var_1_5[14])
				var_1_6.defense = tonumber(var_1_5[15])
				var_1_6.zfShield = tonumber(var_1_5[16])
				var_1_6.hpList = var_1_5[17]
			elseif #var_1_5 == 18 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_11 = stringSplit(var_1_5[12], "_")

				if #var_1_11 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_11[1])
					var_1_6.xianzhengNum = tonumber(var_1_11[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.attack = tonumber(var_1_5[14])
				var_1_6.defense = tonumber(var_1_5[15])
				var_1_6.resistPercentage = tonumber(var_1_5[16])
				var_1_6.zfShield = tonumber(var_1_5[17])
				var_1_6.hpList = var_1_5[18]
			elseif #var_1_5 == 20 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_12 = stringSplit(var_1_5[12], "_")

				if #var_1_12 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_12[1])
					var_1_6.xianzhengNum = tonumber(var_1_12[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.attack = tonumber(var_1_5[14])
				var_1_6.defense = tonumber(var_1_5[15])
				var_1_6.resistPercentage = tonumber(var_1_5[16])
				var_1_6.carId = tonumber(var_1_5[17])
				var_1_6.bigGzNum = tonumber(var_1_5[18])
				var_1_6.zfShield = tonumber(var_1_5[19])
				var_1_6.hpList = var_1_5[20]
			elseif #var_1_5 == 21 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_13 = stringSplit(var_1_5[12], "_")

				if #var_1_13 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_13[1])
					var_1_6.xianzhengNum = tonumber(var_1_13[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.attack = tonumber(var_1_5[14])
				var_1_6.defense = tonumber(var_1_5[15])
				var_1_6.resistPercentage = tonumber(var_1_5[16])
				var_1_6.carId = tonumber(var_1_5[17])
				var_1_6.bigGzNum = tonumber(var_1_5[18])
				var_1_6.bsPro = tonumber(var_1_5[19])
				var_1_6.zfShield = tonumber(var_1_5[20])
				var_1_6.hpList = var_1_5[21]
			elseif #var_1_5 == 22 then
				var_1_6.isJuexing = tonumber(var_1_5[9])
				var_1_6.isChongfeng = tonumber(var_1_5[10])
				var_1_6.isMain = tonumber(var_1_5[11])

				local var_1_14 = stringSplit(var_1_5[12], "_")

				if #var_1_14 >= 2 then
					var_1_6.specialPhantom = tonumber(var_1_14[1])
					var_1_6.xianzhengNum = tonumber(var_1_14[2])
				else
					var_1_6.specialPhantom = tonumber(var_1_5[12])
				end

				var_1_6.jueEquip = tonumber(var_1_5[13])
				var_1_6.attack = tonumber(var_1_5[14])
				var_1_6.defense = tonumber(var_1_5[15])
				var_1_6.resistPercentage = tonumber(var_1_5[16])
				var_1_6.carId = tonumber(var_1_5[17])
				var_1_6.bigGzNum = tonumber(var_1_5[18])
				var_1_6.bsPro = tonumber(var_1_5[19])
				var_1_6.zfShield = tonumber(var_1_5[20])
				var_1_6.chaosState = tonumber(var_1_5[21])
				var_1_6.hpList = var_1_5[22]
			end

			arg_1_0.armys[var_1_4] = var_1_6

			local var_1_15 = stringSplit(var_1_6.hpList, ",")

			for iter_1_1, iter_1_2 in pairs(var_1_15) do
				local var_1_16 = stringSplit(iter_1_2, "*")

				if tonumber(var_1_16[1]) <= 0 then
					arg_1_0.armys[var_1_4] = nil
				end
			end
		end
	end

	local var_1_17 = stringSplit(var_1_0[4], ",")
	local var_1_18 = stringSplit(var_1_17[1], "|")

	arg_1_0.result = tonumber(var_1_18[2])
end
