function doReport35(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.firePlayer = var_1_0[2]
	arg_1_0.paoJiNum = tonumber(var_1_0[3])

	local var_1_1 = stringSplit(var_1_0[4], ";")

	arg_1_0.stategyShow = {}

	local var_1_2 = {}

	var_1_2.side = "def"
	var_1_2.type = 1
	var_1_2.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_2.tacticsId = battleTower.PAOJI
	var_1_2.beHold = 0
	var_1_2.showTacticsId = battleTower.PAOJI
	var_1_2.backgound = 1
	var_1_2.nextTacticId = 2000120
	var_1_2.nextTacticName = null
	var_1_2.takeEffect = var_1_2.beHold == 0
	var_1_2.isWorldFightWeaken = 0
	var_1_2.leftPic = "guosi"
	var_1_2.rightPic = "battletower"
	arg_1_0.stategyShow.def = var_1_2
	arg_1_0.troops = {}

	local var_1_3 = "att"

	arg_1_0.troops[var_1_3] = {}

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		if iter_1_1 ~= nil then
			local var_1_4 = stringSplit(iter_1_1, ",")
			local var_1_5 = {
				row = tonumber(var_1_4[1]),
				deadInfo = {},
				restBlood = {}
			}

			for iter_1_2 = 1, 3 do
				local var_1_6 = stringSplit(var_1_4[iter_1_2 + 1], "*")

				var_1_5.deadInfo[iter_1_2] = tonumber(var_1_6[1])
				var_1_5.restBlood[iter_1_2] = tonumber(var_1_6[2])
			end

			table.insert(arg_1_0.troops[var_1_3], var_1_5)
		end
	end
end
