function doReport33(arg_1_0, arg_1_1)
	local var_1_0 = stringSplit(arg_1_1, "|")

	arg_1_0.reportId = tonumber(var_1_0[1])
	arg_1_0.towerBloodMinus = tonumber(var_1_0[2])
	arg_1_0.towerBlood = tonumber(var_1_0[3])
	arg_1_0.stategyShow = {}

	local var_1_1 = {}

	var_1_1.side = "att"
	var_1_1.type = 1
	var_1_1.succ = 1

	require("lua/game/battle/uiConstant")

	var_1_1.tacticsId = battleTower.POHUAI
	var_1_1.beHold = 0
	var_1_1.showTacticsId = battleTower.POHUAI
	var_1_1.backgound = 1
	var_1_1.nextTacticId = 2000120
	var_1_1.nextTacticName = null
	var_1_1.takeEffect = var_1_1.beHold == 0
	var_1_1.isWorldFightWeaken = 0
	var_1_1.leftPic = "toushiche"
	var_1_1.rightPic = "guosi"
	arg_1_0.stategyShow.att = var_1_1
end
