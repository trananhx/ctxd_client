function doReport57(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = var_1_0[2]
	local var_1_2 = var_1_0[3]
	local var_1_3 = var_1_0[4]

	arg_1_0.side = var_1_1

	if var_1_2 == nil or var_1_2 == "null" or var_1_3 == nil or var_1_3 == "null" then
		return
	end

	local var_1_4 = ZHIHENG_EFFECT

	arg_1_0.stategyShow = {}

	local var_1_5 = {
		side = var_1_1
	}

	var_1_5.type = 1
	var_1_5.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_5.tacticsId = var_1_4
	var_1_5.beHold = 0
	var_1_5.showTacticsId = var_1_4
	var_1_5.backgound = 3
	var_1_5.nextTacticName = null
	var_1_5.takeEffect = var_1_5.beHold == 0
	var_1_5.isWorldFightWeaken = 0
	var_1_5.leftPic = ""
	var_1_5.rightPic = ""
	arg_1_0.stategyShow[var_1_5.side] = var_1_5
	arg_1_0.zhShileds = {}
	arg_1_0.zhShileds[var_1_1] = {}

	local var_1_6 = stringSplit(var_1_2, ",")

	if var_1_6[1] and var_1_6[2] then
		local var_1_7 = {
			row = tonumber(var_1_6[1]),
			shiled = tonumber(var_1_6[2])
		}

		table.insert(arg_1_0.zhShileds[var_1_1], var_1_7)
	end

	local var_1_8 = ZHIHENG_EFFECT2
	local var_1_9 = {}
	local var_1_10 = var_1_1 == "att" and "def" or "att"

	var_1_9.side = var_1_10
	var_1_9.type = 1
	var_1_9.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_9.tacticsId = var_1_8
	var_1_9.beHold = 0
	var_1_9.showTacticsId = var_1_8
	var_1_9.backgound = 3
	var_1_9.nextTacticName = null
	var_1_9.takeEffect = var_1_9.beHold == 0
	var_1_9.isWorldFightWeaken = 0
	var_1_9.leftPic = ""
	var_1_9.rightPic = ""
	arg_1_0.stategyShow[var_1_9.side] = var_1_9
	arg_1_0.troops = {}
	arg_1_0.troops[var_1_10] = {}

	local var_1_11 = stringSplit(var_1_3, "*")

	for iter_1_0, iter_1_1 in ipairs(var_1_11) do
		if iter_1_1 ~= "" then
			local var_1_12 = {}
			local var_1_13 = stringSplit(iter_1_1, ",")

			var_1_12.row = tonumber(var_1_13[1])
			var_1_12.deadInfo = {}
			var_1_12.deadInfo[1] = tonumber(var_1_13[2])
			var_1_12.deadInfo[2] = tonumber(var_1_13[2])
			var_1_12.deadInfo[3] = tonumber(var_1_13[2])

			table.insert(arg_1_0.troops[var_1_10], var_1_12)
		end
	end
end
