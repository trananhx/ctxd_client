buyAndRuleControl = {}

local var_0_0 = buyAndRuleControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)

	var_0_0.basePanel = var_0_1
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
end

function var_0_0.onBuyLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/kfsy/buyAndRule/buy/ui")

	local var_3_0 = kfsyBuyUI.show()

	var_0_1:addChild(var_3_0)
end

function var_0_0.onRuleLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/kfsy/buyAndRule/rule/ui")

	local var_4_0 = kfsyRuleUI.show()

	var_0_1:addChild(var_4_0)
end

function var_0_0.onPlayerLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/kfsy/buyAndRule/player16/ui")

	local var_5_0 = kfsyPlayer.show()

	var_0_1:addChild(var_5_0)
end
