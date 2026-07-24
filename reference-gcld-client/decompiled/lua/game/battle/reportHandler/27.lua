function doReport27(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, ";")
	local var_1_1 = stringSplit(var_1_0[1], "|")

	arg_1_0.reportId = tonumber(var_1_1[1])
	arg_1_0.side = var_1_1[2]
	arg_1_0.playerId = tonumber(var_1_1[3])
	arg_1_0.pos = tonumber(var_1_1[4])
	arg_1_0.playerName = var_1_1[5]
	arg_1_0.cd = tonumber(var_1_1[6])
	arg_1_0.showPanel = tonumber(var_1_1[7])

	if arg_1_0.showPanel == 1 then
		arg_1_0.panel = {}

		local var_1_2 = stringSplit(var_1_0[2], "|")

		arg_1_0.panel.recommend = tonumber(var_1_2[1])
		arg_1_0.panel.id1 = tonumber(var_1_2[2])
		arg_1_0.panel.pc1 = var_1_2[3]
		arg_1_0.panel.id2 = tonumber(var_1_2[4])
		arg_1_0.panel.pc2 = var_1_2[5]
		arg_1_0.panel.id3 = tonumber(var_1_2[6])
		arg_1_0.panel.pc3 = var_1_2[7]

		local var_1_3 = stringSplit(var_1_0[3], "|")

		arg_1_0.strategy = {}
		arg_1_0.strategy.pos = tonumber(var_1_3[1])
		arg_1_0.strategy.useAble = tonumber(var_1_3[2])
		arg_1_0.strategy.gPic = var_1_3[3]

		local var_1_4 = tonumber(var_1_3[4])

		arg_1_0.strategy.isChaos = var_1_4 == 1
		arg_1_0.strategy.isSurround = var_1_4 == 2
		arg_1_0.strategy.isMelee = var_1_4 == 3
		arg_1_0.strategy.isWoman = var_1_4 == 4

		if var_1_3[6] then
			arg_1_0.strategy.juexing = tonumber(var_1_3[6])
		end
	end
end
