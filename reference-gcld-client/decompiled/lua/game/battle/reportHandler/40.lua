function doReport40(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])

	if #var_1_1 >= 3 then
		arg_1_0.reportSide = var_1_1[2]
		arg_1_0.reportPlayerPic = var_1_1[3]
	else
		arg_1_0.reportSide = "att"
		arg_1_0.reportPlayerPic = 1
	end

	arg_1_0.stategyShow = {}

	local var_1_2 = {
		side = arg_1_0.reportSide
	}

	var_1_2.type = 1
	var_1_2.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_2.tacticsId = BATTLE_TUCHENGH
	var_1_2.beHold = 0
	var_1_2.showTacticsId = BATTLE_TUCHENGH
	var_1_2.backgound = 1
	var_1_2.nextTacticId = 2000120
	var_1_2.nextTacticName = null
	var_1_2.takeEffect = var_1_2.beHold == 0
	var_1_2.isWorldFightWeaken = 0
	var_1_2.leftPic = "player" .. arg_1_0.reportPlayerPic
	var_1_2.rightPic = "player" .. arg_1_0.reportPlayerPic
	arg_1_0.stategyShow[arg_1_0.reportSide] = var_1_2

	local var_1_3 = "def"

	if arg_1_0.reportSide == "def" then
		var_1_3 = "att"
	end

	arg_1_0.troops = {}
	arg_1_0.troops[var_1_3] = {}

	for iter_1_0 = 2, #var_1_0 do
		if var_1_0[iter_1_0] then
			var_1_0[iter_1_0] = string.gsub(var_1_0[iter_1_0], "|", ",")

			local var_1_4 = stringSplit(var_1_0[iter_1_0], ",")

			if var_1_4 and #var_1_4 >= 4 then
				local var_1_5 = {
					row = tonumber(var_1_4[1]),
					deadInfo = {}
				}

				for iter_1_1 = 1, 3 do
					local var_1_6 = stringSplit(var_1_4[iter_1_1 + 1], "*")

					var_1_5.deadInfo[iter_1_1] = tonumber(var_1_6[1])
				end

				table.insert(arg_1_0.troops[var_1_3], var_1_5)
			end
		end
	end
end
