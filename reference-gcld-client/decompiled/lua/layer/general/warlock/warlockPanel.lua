function showWarlockPanel(arg_1_0)
	rmgr.loadResource("res/ui/warlock/warlock.plist")
	rmgr.loadResource("res/ui/warlock/warlock_jpg.plist")

	local var_1_0 = {}
	local var_1_1 = require("lua/layer/general/warlock/warlockLayout")
	local var_1_2 = require("lua/layer/general/warlock/warlockControl")
	local var_1_3 = createBaseLayer()

	var_1_3.tag = 100

	var_1_2:init(var_1_3, var_1_0, var_1_1)
	var_1_2:getWarlockInfo()

	return var_1_3
end
