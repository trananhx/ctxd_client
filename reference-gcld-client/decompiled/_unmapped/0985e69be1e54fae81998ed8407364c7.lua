activityControl = {}

local var_0_0 = activityControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)

	var_0_0.basePanel = var_0_1
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
end

function var_0_0.onActivityTabOnClick(arg_3_0)
	return function()
		var_0_0.clearPanel()

		local var_4_0 = require("lua/layer/activity/activityTab/ui").new(arg_3_0)

		var_0_1:addChild(var_4_0)
	end
end
