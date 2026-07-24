function doReport59(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = var_1_0[2]
	local var_1_2 = var_1_0[3]

	if var_1_2 == nil or var_1_2 == "null" then
		return
	end

	local var_1_3 = var_1_1 == "att" and "def" or "att"

	taticId = LIGNTNING_EFFECT
	arg_1_0.stategyShow = {}

	local var_1_4 = {
		side = var_1_3
	}

	var_1_4.type = 1
	var_1_4.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_4.tacticsId = taticId
	var_1_4.beHold = 0
	var_1_4.showTacticsId = taticId
	var_1_4.backgound = 3
	var_1_4.nextTacticName = null
	var_1_4.takeEffect = var_1_4.beHold == 0
	var_1_4.isWorldFightWeaken = 0
	var_1_4.leftPic = ""
	var_1_4.rightPic = ""
	arg_1_0.stategyShow[var_1_4.side] = var_1_4

	local var_1_5 = var_1_3 == "att" and "def" or "att"

	arg_1_0.troops = {}
	arg_1_0.troops[var_1_5] = {}

	local var_1_6 = stringSplit(var_1_2, ";")

	for iter_1_0, iter_1_1 in ipairs(var_1_6) do
		if iter_1_1 ~= "" then
			local var_1_7 = {}
			local var_1_8 = stringSplit(iter_1_1, ",")

			var_1_7.row = tonumber(var_1_8[1])
			var_1_7.deadInfo = {}
			var_1_7.deadInfo[1] = tonumber(var_1_8[2])
			var_1_7.deadInfo[2] = tonumber(var_1_8[2])
			var_1_7.deadInfo[3] = tonumber(var_1_8[2])

			table.insert(arg_1_0.troops[var_1_5], var_1_7)
		end
	end
end
