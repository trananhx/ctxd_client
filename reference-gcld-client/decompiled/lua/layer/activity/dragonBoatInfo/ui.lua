local var_0_0 = class("DragonBoatInfo", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.cityId = arg_2_1
	arg_2_0.control = require("lua/layer/activity/dragonBoatInfo/control").new(arg_2_0)

	arg_2_0:registerScriptTouchHandler(handler(arg_2_0.control, arg_2_0.control.onTouch), false, true)
	arg_2_0:setTouchEnabled(true)
	arg_2_0.control:getPanelInfo()
	smgr.getLayer("topLayer"):addChild(arg_2_0, 10001)
end

function var_0_0.init(arg_3_0)
	local var_3_0 = arg_3_0.control.data.playerEvent

	log.info("PE", tool.tableToJson(var_3_0))
	arg_3_0:removeAllChildrenWithCleanup(true)

	arg_3_0.uiTable = autoUI.initUI(arg_3_0, require("lua/layer/activity/dragonBoatInfo/uidata"))

	arg_3_0.uiTable.general:setDisplayFrame(CCSprite:create("res/ui/comment/xiaoqian.png"):displayFrame())
	arg_3_0.uiTable.general:setScale(0.7)

	local var_3_1 = {
		[61] = language.get("155012_gcldhw")
	}
	local var_3_2 = var_3_0.gain
	local var_3_3 = ""

	for iter_3_0, iter_3_1 in pairs(var_3_2) do
		var_3_3 = var_3_3 .. var_3_1[iter_3_1.gainType] .. "X" .. iter_3_1.gainNum .. " "
	end

	local var_3_4 = language.get(135908, var_3_3)

	arg_3_0.uiTable.reward1:setString(var_3_4)
	arg_3_0.uiTable.button1:registerScriptTapHandler(function()
		arg_3_0.control:dealPlayerEvent(1)
	end)
end

return var_0_0
