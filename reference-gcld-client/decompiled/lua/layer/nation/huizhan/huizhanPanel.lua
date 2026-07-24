local var_0_0 = class("huizhanPanel", function()
	return createBaseLayer()
end)

var_0_0.taskType = {
	upgrade = 2,
	history = 0,
	mass = 1
}

function var_0_0.ctor(arg_2_0)
	return
end

function var_0_0.onEnter(arg_3_0)
	arg_3_0:refresh()

	arg_3_0.refreshRef = handler(arg_3_0, arg_3_0.refresh)

	eventManager.registerEvent("onRefreshHuizhanPanel", arg_3_0.refreshRef)
end

function var_0_0.onExit(arg_4_0)
	eventManager.unregisterEvent("onRefreshHuizhanPanel", arg_4_0.refreshRef)
end

function var_0_0.refresh(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.data or arg_6_0.action.data
		local var_6_1 = var_6_0.taskType
		local var_6_2

		if var_6_1 == 0 then
			var_6_2 = require("lua/layer/nation/huizhan/HuizhanNotice").new(var_6_0)
		else
			var_6_2 = require("lua/layer/nation/huizhan/HuizhanTask").new(var_6_1, var_6_0)
		end

		if var_6_2 then
			var_6_2:setPositionY(var_6_2:getPositionY() - 30)
			arg_5_0:removeAllChildrenWithCleanup(true)
			arg_5_0:addChild(var_6_2)
		end
	end

	cmgr.sendRequest(var_5_0, actions.huizhanInfo)
end

return var_0_0
