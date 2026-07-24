require("lua/game/battle/uiConstant")

function doReport49(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = stringSplit(var_1_0[2], "*")

	arg_1_0.firstFire = tonumber(var_1_1[1])

	local var_1_2 = "player" .. var_1_1[2]

	arg_1_0.stategyShow = {}
	arg_1_0.troops = {}

	local var_1_3 = "def"
	local var_1_4 = {
		side = var_1_3
	}

	var_1_4.type = 1
	var_1_4.succ = 1
	var_1_4.tacticsId = BATTLE_HUOJI
	var_1_4.beHold = 0
	var_1_4.showTacticsId = BATTLE_HUOJI
	var_1_4.backgound = 4
	var_1_4.nextTacticName = "null"
	var_1_4.takeEffect = var_1_4.beHold == 0
	var_1_4.isWorldFightWeaken = 0
	var_1_4.leftPic = var_1_2
	var_1_4.rightPic = var_1_2
	arg_1_0.stategyShow[var_1_3] = var_1_4

	local var_1_5 = "att"

	arg_1_0.troops[var_1_5] = {}

	local var_1_6 = stringSplit(var_1_1[3], ";")

	for iter_1_0, iter_1_1 in pairs(var_1_6) do
		if iter_1_1 ~= "" then
			local var_1_7 = {}
			local var_1_8 = stringSplit(iter_1_1, ",")

			var_1_7.row = tonumber(var_1_8[1])
			var_1_7.deadInfo = {}

			for iter_1_2 = 1, 3 do
				var_1_7.deadInfo[iter_1_2] = tonumber(var_1_8[2])
			end

			table.insert(arg_1_0.troops[var_1_5], var_1_7)
		end
	end
end
