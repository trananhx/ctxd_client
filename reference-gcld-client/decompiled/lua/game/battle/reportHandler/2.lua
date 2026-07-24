require("lua/game/battle/army")

function doReport2(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")

	if not arg_1_0.armys then
		arg_1_0.armys = {}
	end

	local var_1_1

	for iter_1_0, iter_1_1 in pairs(var_1_0) do
		if iter_1_1 ~= nil and string.len(iter_1_1) > 0 then
			local var_1_2 = stringSplit(iter_1_1, "|")

			if iter_1_0 == 1 then
				arg_1_0.reportId = tonumber(var_1_2[1])
				var_1_1 = var_1_2[2]
			else
				local var_1_3 = {
					side = var_1_1,
					row = tonumber(var_1_2[1]),
					playerId = tonumber(var_1_2[2]),
					troopSerial = tonumber(var_1_2[3]),
					troopType = tonumber(var_1_2[4])
				}

				if var_1_3.troopType == 0 then
					var_1_3.troopType = var_1_2[4]
				end

				var_1_3.troopName = var_1_2[5]
				var_1_3.resType = tonumber(var_1_2[6])
				var_1_3.tacticsId = tonumber(var_1_2[7])
				var_1_3.isTeamArmy = tonumber(var_1_2[8])

				if #var_1_2 == 9 then
					var_1_3.hpList = var_1_2[9]
				elseif #var_1_2 == 10 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.hpList = var_1_2[10]
				elseif #var_1_2 == 11 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isMain = tonumber(var_1_2[10])
					var_1_3.hpList = var_1_2[11]
				elseif #var_1_2 == 12 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])
					var_1_3.hpList = var_1_2[12]
				elseif #var_1_2 == 13 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_4 = stringSplit(var_1_2[12], "_")

					if #var_1_4 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_4[1])
						var_1_3.xianzhengNum = tonumber(var_1_4[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.hpList = var_1_2[13]
				elseif #var_1_2 == 14 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_5 = stringSplit(var_1_2[12], "_")

					if #var_1_5 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_5[1])
						var_1_3.xianzhengNum = tonumber(var_1_5[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.hpList = var_1_2[14]
				elseif #var_1_2 == 16 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_6 = stringSplit(var_1_2[12], "_")

					if #var_1_6 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_6[1])
						var_1_3.xianzhengNum = tonumber(var_1_6[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.attack = tonumber(var_1_2[14])
					var_1_3.defense = tonumber(var_1_2[15])
					var_1_3.hpList = var_1_2[16]
				elseif #var_1_2 == 17 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_7 = stringSplit(var_1_2[12], "_")

					if #var_1_7 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_7[1])
						var_1_3.xianzhengNum = tonumber(var_1_7[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.attack = tonumber(var_1_2[14])
					var_1_3.defense = tonumber(var_1_2[15])
					var_1_3.zfShield = tonumber(var_1_2[16])
					var_1_3.hpList = var_1_2[17]
				elseif #var_1_2 == 18 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_8 = stringSplit(var_1_2[12], "_")

					if #var_1_8 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_8[1])
						var_1_3.xianzhengNum = tonumber(var_1_8[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.attack = tonumber(var_1_2[14])
					var_1_3.defense = tonumber(var_1_2[15])
					var_1_3.resistPercentage = tonumber(var_1_2[16])
					var_1_3.zfShield = tonumber(var_1_2[17])
					var_1_3.hpList = var_1_2[18]
				elseif #var_1_2 == 20 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_9 = stringSplit(var_1_2[12], "_")

					if #var_1_9 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_9[1])
						var_1_3.xianzhengNum = tonumber(var_1_9[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.attack = tonumber(var_1_2[14])
					var_1_3.defense = tonumber(var_1_2[15])
					var_1_3.resistPercentage = tonumber(var_1_2[16])
					var_1_3.carId = tonumber(var_1_2[17])
					var_1_3.bigGzNum = tonumber(var_1_2[18])
					var_1_3.zfShield = tonumber(var_1_2[19])
					var_1_3.hpList = var_1_2[20]
				elseif #var_1_2 == 21 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_10 = stringSplit(var_1_2[12], "_")

					if #var_1_10 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_10[1])
						var_1_3.xianzhengNum = tonumber(var_1_10[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.attack = tonumber(var_1_2[14])
					var_1_3.defense = tonumber(var_1_2[15])
					var_1_3.resistPercentage = tonumber(var_1_2[16])
					var_1_3.carId = tonumber(var_1_2[17])
					var_1_3.bigGzNum = tonumber(var_1_2[18])
					var_1_3.bsPro = tonumber(var_1_2[19])
					var_1_3.zfShield = tonumber(var_1_2[20])
					var_1_3.hpList = var_1_2[21]
				elseif #var_1_2 == 22 then
					var_1_3.isJuexing = tonumber(var_1_2[9])
					var_1_3.isChongfeng = tonumber(var_1_2[10])
					var_1_3.isMain = tonumber(var_1_2[11])

					local var_1_11 = stringSplit(var_1_2[12], "_")

					if #var_1_11 >= 2 then
						var_1_3.specialPhantom = tonumber(var_1_11[1])
						var_1_3.xianzhengNum = tonumber(var_1_11[2])
					else
						var_1_3.specialPhantom = tonumber(var_1_2[12])
					end

					var_1_3.jueEquip = tonumber(var_1_2[13])
					var_1_3.attack = tonumber(var_1_2[14])
					var_1_3.defense = tonumber(var_1_2[15])
					var_1_3.resistPercentage = tonumber(var_1_2[16])
					var_1_3.carId = tonumber(var_1_2[17])
					var_1_3.bigGzNum = tonumber(var_1_2[18])
					var_1_3.bsPro = tonumber(var_1_2[19])
					var_1_3.zfShield = tonumber(var_1_2[20])
					var_1_3.chaosState = tonumber(var_1_2[21])
					var_1_3.hpList = var_1_2[22]
				end

				table.insert(arg_1_0.armys, var_1_3)
			end
		end
	end
end
