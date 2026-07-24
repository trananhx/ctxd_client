function doReport42(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])

	local var_1_1 = var_1_0[2]

	arg_1_0.side = var_1_1
	arg_1_0.stategySide = "att"

	if arg_1_0.side == "att" then
		arg_1_0.stategySide = "def"
	end

	local var_1_2 = tonumber(var_1_0[3])

	arg_1_0.isHuoShen = var_1_2 == 1313
	arg_1_0.isZhurong = var_1_2 == 2302 or var_1_2 == 2303
	arg_1_0.firstFire = tonumber(var_1_0[4])
	arg_1_0.stategyShow = {}

	local var_1_3 = {
		side = arg_1_0.stategySide
	}

	var_1_3.type = 1
	var_1_3.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_3.tacticsId = ZHOUYUJX_FIRE2
	var_1_3.beHold = 0
	var_1_3.showTacticsId = ZHOUYUJX_FIRE2
	var_1_3.backgound = 1
	var_1_3.nextTacticId = 2000120
	var_1_3.nextTacticName = null
	var_1_3.takeEffect = var_1_3.beHold == 0
	var_1_3.isWorldFightWeaken = 0
	var_1_3.leftPic = "zhouyu"
	var_1_3.rightPic = "zhouyu"
	arg_1_0.stategyShow[arg_1_0.stategySide] = var_1_3

	local var_1_4 = stringSplit(var_1_0[5], "*")

	arg_1_0.troops = {}
	arg_1_0.troops[var_1_1] = {}

	for iter_1_0 = 1, #var_1_4 do
		local var_1_5 = stringSplit(var_1_4[iter_1_0], ",")
		local var_1_6 = {
			deadInfo = {},
			restBlood = {},
			row = tonumber(var_1_5[1])
		}

		for iter_1_1 = 1, 3 do
			var_1_6.deadInfo[iter_1_1] = tonumber(var_1_5[2 * iter_1_1])
			var_1_6.restBlood[iter_1_1] = tonumber(var_1_5[2 * iter_1_1 + 1])
		end

		table.insert(arg_1_0.troops[var_1_1], var_1_6)
	end

	arg_1_0.stunBuff = {}

	if var_1_0[6] ~= nil and var_1_0[6] ~= "null" then
		local var_1_7 = stringSplit(var_1_0[6], ",")
		local var_1_8 = {
			side = var_1_1,
			rows = {}
		}

		for iter_1_2, iter_1_3 in pairs(var_1_7) do
			table.insert(var_1_8.rows, tonumber(iter_1_3))
		end

		table.insert(arg_1_0.stunBuff, var_1_8)
	end
end
