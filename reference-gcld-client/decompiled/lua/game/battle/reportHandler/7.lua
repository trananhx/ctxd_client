function doReport7(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])
	arg_1_0.fightResult = tonumber(var_1_1[2])
	arg_1_0.finishedPercent = tonumber(var_1_1[3])

	local var_1_2 = stringSplit(var_1_0[2], "|")

	arg_1_0.killNum = tonumber(var_1_2[1])
	arg_1_0.loseNum = tonumber(var_1_2[2])
	arg_1_0.killGeneralNum = tonumber(var_1_2[3])
	arg_1_0.killedGeneralName = var_1_2[4]

	local var_1_3 = stringSplit(var_1_0[3], "|")

	arg_1_0.res = {}
	arg_1_0.dropItem = {}
	arg_1_0.building = {}

	for iter_1_0, iter_1_1 in pairs(var_1_3) do
		local var_1_4 = stringSplit(iter_1_1, "*")

		log.info("战斗结果面板资源奖励 : ", iter_1_1)

		if var_1_4 then
			local var_1_5 = tonumber(var_1_4[1])
			local var_1_6 = tonumber(var_1_4[2])

			if var_1_5 >= 25 and var_1_5 <= 27 then
				arg_1_0.cityFightHelpe = var_1_5
				arg_1_0.cityFightHelpeNum = var_1_6
			elseif var_1_5 == 106 then
				table.insert(arg_1_0.building, var_1_4[2])
			elseif var_1_5 > 200 and var_1_5 < 1000 then
				table.insert(arg_1_0.dropItem, {
					id = var_1_5,
					num = var_1_6,
					text = var_1_4[3]
				})
			elseif var_1_5 == extraReward.jifeng then
				arg_1_0.hasBiwujifen = true
				arg_1_0.biwujifenNum = var_1_6
			else
				table.insert(arg_1_0.res, {
					id = var_1_5,
					num = var_1_6
				})
			end
		end
	end

	if var_1_0[7] and var_1_0[7] ~= "null" then
		arg_1_0.hasOfficer = true
		arg_1_0.officerName = string.sub(var_1_0[7], 1, string.len(var_1_0[7]) - 1)
	end

	if var_1_0[8] and var_1_0[8] ~= "null" then
		local var_1_7 = stringSplit(var_1_0[8], "|")

		arg_1_0.cityName = var_1_7[1]
		arg_1_0.cityId = tonumber(var_1_7[2])
	end
end

function doKfwdReport7(arg_2_0, arg_2_1)
	local var_2_0 = stringSplit(arg_2_1, "#")
	local var_2_1 = stringSplit(var_2_0[1], "|")

	arg_2_0.reportId = tonumber(var_2_1[1])
	arg_2_0.winState = tonumber(var_2_1[2])
	arg_2_0.score = tonumber(var_2_1[3])
	arg_2_0.TotalScore = tonumber(var_2_1[4])
	arg_2_0.ticket = tonumber(var_2_1[5])
	arg_2_0.kill = tonumber(var_2_1[6])
	arg_2_0.lost = tonumber(var_2_1[7])
	arg_2_0.nextRoundCd = tonumber(var_2_1[8])
end

function doKfzbReport7(arg_3_0, arg_3_1)
	print("zhu@@@:report:" .. arg_3_1)

	local var_3_0 = stringSplit(arg_3_1, "#")
	local var_3_1 = stringSplit(var_3_0[1], "|")

	arg_3_0.reportId = tonumber(var_3_1[1])
	arg_3_0.winState = tonumber(var_3_1[2])
	arg_3_0.kill = tonumber(var_3_1[3])
	arg_3_0.lost = tonumber(var_3_1[4])
	arg_3_0.nextRoundCd = tonumber(var_3_1[5])
	arg_3_0.p1Win = tonumber(var_3_1[6])
	arg_3_0.p2Win = tonumber(var_3_1[7])
	arg_3_0.ticket = tonumber(var_3_1[8])

	if not kfzbControl.kfzbData.nextRoundCD then
		kfzbControl.kfzbData.nextRoundCD = 0
	end

	if kfzbControl.kfzbData.nextRoundCD > 0 then
		arg_3_0.nextRoundCd = kfzbControl.kfzbData.nextRoundCD
	end

	if arg_3_0.nextRoundCd == 0 and kfzbControl.kfzbData.selfState == 1 then
		arg_3_0.nextRoundCd = 20000
	end
end
