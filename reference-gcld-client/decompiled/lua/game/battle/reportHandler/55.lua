function doReport55(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = var_1_0[2]
	local var_1_2 = var_1_0[3]

	arg_1_0.side = var_1_1

	if var_1_2 == nil or var_1_2 == "null" then
		return
	end

	local var_1_3 = CARSHILED_EFFECT

	arg_1_0.stategyShow = {}

	local var_1_4 = {
		side = var_1_1
	}

	var_1_4.type = 1
	var_1_4.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_4.tacticsId = var_1_3
	var_1_4.beHold = 0
	var_1_4.showTacticsId = var_1_3
	var_1_4.backgound = 3
	var_1_4.nextTacticName = null
	var_1_4.takeEffect = var_1_4.beHold == 0
	var_1_4.isWorldFightWeaken = 0
	var_1_4.leftPic = ""
	var_1_4.rightPic = ""
	arg_1_0.stategyShow[var_1_4.side] = var_1_4
	arg_1_0.carShileds = {}
	arg_1_0.carShileds[var_1_1] = {}

	local var_1_5 = stringSplit(var_1_2, ",")

	for iter_1_0, iter_1_1 in ipairs(var_1_5) do
		if iter_1_1 ~= "" then
			local var_1_6 = {}
			local var_1_7 = stringSplit(iter_1_1, ":")

			var_1_6.row = tonumber(var_1_7[1])
			var_1_6.shiledType = tonumber(var_1_7[2])
			arg_1_0.shiledType = var_1_6.shiledType

			if var_1_6.shiledType == 1 then
				var_1_6.shiled = tonumber(var_1_7[3])
			elseif var_1_6.shiledType == 2 then
				var_1_6.bigGzNum = tonumber(var_1_7[3])
				var_1_6.carHp = tonumber(var_1_7[4]) * var_1_6.bigGzNum
				var_1_6.carMaxHp = tonumber(var_1_7[4]) * var_1_6.bigGzNum
			end

			table.insert(arg_1_0.carShileds[var_1_1], var_1_6)
		end
	end
end
