require("lua/game/battle/battleConstants")

fightPriority = {
	nil,
	1,
	6,
	nil,
	nil,
	nil,
	22,
	7,
	nil,
	2,
	8,
	3,
	4,
	5,
	9,
	10,
	11,
	12,
	13,
	14,
	nil,
	nil,
	nil,
	nil,
	15,
	16,
	17,
	18,
	19,
	20,
	21
}

function initPosition(arg_1_0, arg_1_1)
	local var_1_0 = 0.11
	local var_1_1 = 0.5
	local var_1_2 = 30 + (visibleSize.height - visibleSize.width * var_1_1) / 2
	local var_1_3 = 0.45 * visibleSize.width
	local var_1_4 = var_1_3 * var_1_1 + var_1_2
	local var_1_5 = 0.55 * visibleSize.width
	local var_1_6 = var_1_5 * var_1_1 + var_1_2

	arg_1_0[0] = ccp(var_1_3, var_1_4)
	arg_1_1[0] = ccp(var_1_5, var_1_6)

	for iter_1_0 = 1, BATTLE_ROW_NUM do
		local var_1_7 = 0.45 - iter_1_0 * var_1_0
		local var_1_8 = 0.55 + iter_1_0 * var_1_0
		local var_1_9 = var_1_7 * visibleSize.width
		local var_1_10 = var_1_1 * var_1_9 + var_1_2
		local var_1_11 = var_1_8 * visibleSize.width
		local var_1_12 = var_1_1 * var_1_11 + var_1_2

		arg_1_0[iter_1_0] = ccp(var_1_9, var_1_10)
		arg_1_1[iter_1_0] = ccp(var_1_11, var_1_12)
	end
end

function getFightPosition(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0

	if arg_2_1 == "att" then
		var_2_0 = arg_2_2.attArmyInfo
	else
		var_2_0 = arg_2_2.defArmyInfo
	end

	if var_2_0 then
		local var_2_1 = BATTLE_ROW_NUM

		for iter_2_0 = BATTLE_ROW_NUM, 1, -1 do
			if var_2_0[iter_2_0] then
				break
			else
				var_2_1 = iter_2_0
			end
		end

		return var_2_1
	end
end

function getMovePosition(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0
	local var_3_1 = arg_3_2 or 0

	if arg_3_0 == "att" then
		var_3_0 = arg_3_1.attArmyInfo
	else
		var_3_0 = arg_3_1.defArmyInfo
	end

	if var_3_0 then
		for iter_3_0 = var_3_1, BATTLE_ROW_NUM do
			if var_3_0[iter_3_0] == nil then
				return iter_3_0
			end
		end
	end

	return nil
end

function getTacticsName(arg_4_0)
	local var_4_0 = language.get(400022)

	if arg_4_0 == 1000130 then
		var_4_0 = language.get(400024)
	elseif arg_4_0 == 1110131 or arg_4_0 == 1110231 or arg_4_0 == 1110331 or arg_4_0 == 1110431 or arg_4_0 == 1110531 or arg_4_0 == 1210133 or arg_4_0 == 1210233 or arg_4_0 == 1210333 or arg_4_0 == 1210433 or arg_4_0 == 1210533 or arg_4_0 == 1410132 or arg_4_0 == 1410232 or arg_4_0 == 1410332 or arg_4_0 == 1410432 or arg_4_0 == 1410532 then
		var_4_0 = language.get(400025)
	elseif arg_4_0 == 2000120 then
		var_4_0 = language.get(400026)
	elseif arg_4_0 == 2210121 or arg_4_0 == 2210221 or arg_4_0 == 2210321 or arg_4_0 == 2210421 or arg_4_0 == 2210521 or arg_4_0 == 2310122 or arg_4_0 == 2310222 or arg_4_0 == 2310322 or arg_4_0 == 2310422 or arg_4_0 == 2310522 then
		var_4_0 = language.get(400027)
	elseif arg_4_0 == 3000110 then
		var_4_0 = language.get(400022)
	elseif arg_4_0 == 3110113 or arg_4_0 == 3110213 or arg_4_0 == 3110313 or arg_4_0 == 3110413 or arg_4_0 == 3110513 or arg_4_0 == 3310111 or arg_4_0 == 3310211 or arg_4_0 == 3310311 or arg_4_0 == 3310411 or arg_4_0 == 3310511 or arg_4_0 == 3410112 or arg_4_0 == 3410212 or arg_4_0 == 3410312 or arg_4_0 == 3410412 or arg_4_0 == 3410512 then
		var_4_0 = language.get(400023)
	end

	return var_4_0
end
