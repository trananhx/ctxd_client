require("lua/game/battle/uiConstant")

function doReport48(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.stategyShow = {}
	arg_1_0.troops = {}

	for iter_1_0 = 4, #var_1_0 do
		if var_1_0[iter_1_0] ~= "null" then
			local var_1_1 = iter_1_0 == 4 and "def" or "att"
			local var_1_2 = {
				side = var_1_1
			}

			var_1_2.type = 1
			var_1_2.succ = 1
			var_1_2.tacticsId = XUNYU_YEHUOPOZHEN
			var_1_2.beHold = 0
			var_1_2.showTacticsId = XUNYU_YEHUOPOZHEN
			var_1_2.backgound = 4
			var_1_2.nextTacticName = "null"
			var_1_2.takeEffect = var_1_2.beHold == 0
			var_1_2.isWorldFightWeaken = 0
			var_1_2.leftPic = "xunyu2"
			var_1_2.rightPic = "xunyu2"
			arg_1_0.stategyShow[var_1_1] = var_1_2

			local var_1_3 = iter_1_0 == 4 and "att" or "def"

			arg_1_0.troops[var_1_3] = {}

			local var_1_4 = stringSplit(var_1_0[iter_1_0], "*")

			for iter_1_1, iter_1_2 in pairs(var_1_4) do
				if iter_1_2 ~= "" then
					local var_1_5 = {}
					local var_1_6 = stringSplit(iter_1_2, ",")

					var_1_5.row = tonumber(var_1_6[1])
					var_1_5.deadInfo = {}
					var_1_5.deadInfo[1] = tonumber(var_1_6[2])
					var_1_5.deadInfo[2] = tonumber(var_1_6[4])
					var_1_5.deadInfo[3] = tonumber(var_1_6[6])

					table.insert(arg_1_0.troops[var_1_3], var_1_5)
				end
			end
		end
	end
end
