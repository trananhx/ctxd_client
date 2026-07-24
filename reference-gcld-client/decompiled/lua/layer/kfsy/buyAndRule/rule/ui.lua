require("lua/layer/kfsy/buyAndRule/rule/uidata")

kfsyRuleUI = {}
kfsyRuleUI.uiTable = {}

local var_0_0 = kfsyRuleControl
local var_0_1 = kfsyRuleConstant

function kfsyRuleUI.show()
	log.info("kfsyRuleUI.show")

	local var_1_0 = createBaseLayer()

	kfsyRuleUI.uiTable = autoUI.initUI(var_1_0, getkfsyRuleData())

	return var_1_0
end
