function doReport41(arg_1_0, arg_1_1)
	log.info("doReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\ndoReport41\n")

	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])
	arg_1_0.reportSide = var_1_1[2]
	arg_1_0.reportPlayerPic = var_1_1[3]
	arg_1_0.stategyShow = {}

	local var_1_2 = {}

	if arg_1_0.reportSide == "def" then
		var_1_2.side = "att"
	else
		var_1_2.side = "def"
	end

	var_1_2.type = 1
	var_1_2.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_2.tacticsId = BATTLE_LVBUZIBAO
	var_1_2.beHold = 0
	var_1_2.showTacticsId = BATTLE_LVBUZIBAO
	var_1_2.backgound = 3
	var_1_2.nextTacticName = null
	var_1_2.takeEffect = var_1_2.beHold == 0
	var_1_2.isWorldFightWeaken = 0
	var_1_2.leftPic = "lvbu"
	var_1_2.rightPic = "lvbu"
	arg_1_0.stategyShow[var_1_2.side] = var_1_2

	local var_1_3 = arg_1_0.reportSide

	arg_1_0.troops = {}
	arg_1_0.troops[var_1_3] = {}

	local var_1_4 = stringSplit(var_1_1[3], "*")

	for iter_1_0, iter_1_1 in pairs(var_1_4) do
		if iter_1_1 ~= "" then
			local var_1_5 = {}
			local var_1_6 = stringSplit(iter_1_1, ",")

			var_1_5.row = tonumber(var_1_6[1])
			var_1_5.deadInfo = {}
			var_1_5.deadInfo[1] = tonumber(var_1_6[2])
			var_1_5.deadInfo[2] = tonumber(var_1_6[4])
			var_1_5.deadInfo[3] = tonumber(var_1_6[6])

			table.insert(arg_1_0.troops[var_1_3], var_1_5)
		end
	end
end
