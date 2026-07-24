function doReport51(arg_1_0, arg_1_1)
	log.info("doReport51@@@@@@@", arg_1_1)

	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = stringSplit(var_1_0[2], "*")
	local var_1_2 = var_1_1[1]
	local var_1_3 = var_1_1[2]

	arg_1_0.junLinState = var_1_1[3]

	local var_1_4 = var_1_1[4]

	if var_1_4 == nil or var_1_4 == "null" then
		return
	end

	arg_1_0.stategyShow = {}

	local var_1_5 = {
		side = var_1_2
	}

	var_1_5.type = 1
	var_1_5.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_5.tacticsId = TEN_JUNLINTIANXIA
	var_1_5.beHold = 0
	var_1_5.showTacticsId = TEN_JUNLINTIANXIA
	var_1_5.backgound = 3
	var_1_5.nextTacticName = null
	var_1_5.takeEffect = var_1_5.beHold == 0
	var_1_5.isWorldFightWeaken = 0
	var_1_5.leftPic = ""
	var_1_5.rightPic = ""
	arg_1_0.stategyShow[var_1_5.side] = var_1_5

	local var_1_6 = var_1_2 == "att" and "def" or "att"

	arg_1_0.troops = {}
	arg_1_0.troops[var_1_6] = {}

	local var_1_7 = stringSplit(var_1_4, ";")

	for iter_1_0, iter_1_1 in ipairs(var_1_7) do
		if iter_1_1 ~= "" then
			local var_1_8 = {}
			local var_1_9 = stringSplit(iter_1_1, ",")

			var_1_8.row = tonumber(var_1_9[1])
			var_1_8.deadInfo = {}
			var_1_8.deadInfo[1] = tonumber(var_1_9[2])
			var_1_8.deadInfo[2] = tonumber(var_1_9[2])
			var_1_8.deadInfo[3] = tonumber(var_1_9[2])

			table.insert(arg_1_0.troops[var_1_6], var_1_8)
		end
	end
end
