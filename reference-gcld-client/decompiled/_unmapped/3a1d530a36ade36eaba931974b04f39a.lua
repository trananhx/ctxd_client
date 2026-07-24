playerInfo2.control = {}

local var_0_0

function playerInfo2.control.initControl(arg_1_0)
	var_0_0 = CCLayer:create()

	arg_1_0:addChild(var_0_0, 100)

	playerInfo2.control.basePanel = var_0_0
end

function playerInfo2.control.clearPanel()
	var_0_0:removeAllChildrenWithCleanup(true)
end

function playerInfo2.control.onActorInfoClick()
	playerInfo2.control.clearPanel()
	require("lua/layer/playerInfo2/actorInfo/ui")

	local var_3_0 = actorInfo.ui.show()

	var_0_0:addChild(var_3_0)
end

function playerInfo2.control.onRechargeClick()
	playerInfo2.control.clearPanel()
	require("lua/layer/playerInfo2/recharge/ui")

	local var_4_0 = recharge.ui.show()

	var_0_0:addChild(var_4_0)
end

function playerInfo2.control.onSettingClick()
	playerInfo2.control.clearPanel()
	require("lua/layer/playerInfo2/setting/ui")

	local var_5_0 = setting.ui.show()

	var_0_0:addChild(var_5_0)
end

function playerInfo2.control.onInviteClick()
	playerInfo2.control.clearPanel()

	local var_6_0 = require("lua/layer/playerInfo2/invite/ui").new()

	var_0_0:addChild(var_6_0)
end

function playerInfo2.control.onBattleHelpClick()
	playerInfo2.control.clearPanel()
	require("lua/layer/playerInfo2/battleHelp/ui")

	local var_7_0 = battleHelp.ui.show()

	var_0_0:addChild(var_7_0)
end

function playerInfo2.control.onTicketsLabelClick()
	playerInfo2.control.clearPanel()
end
