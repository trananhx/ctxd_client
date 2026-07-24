local var_0_0 = class("LookActivity", function()
	return createBaseLayer()
end)
local var_0_1 = import(".constant")
local var_0_2 = import(".control")
local var_0_3 = import(".uidata")

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2)
	rmgr.loadResource("res/ui/activity/lookActivity/lookActivity.plist")

	arg_2_0.control = var_0_2.new(arg_2_2)
	arg_2_0.view = {}

	uiutil.initWidgets(arg_2_0.view, var_0_3.new():getLayout())

	arg_2_0.leftTime = arg_2_0.view.widgets.leftTime

	if arg_2_1 then
		arg_2_0:addChild(arg_2_0.view.widgets.panel)
		arg_2_1:addChild(arg_2_0)
	end

	arg_2_0.view.widgets.start_btn:addHandleOfControlEvent(function()
		arg_2_0.control:clickLookButton()
	end, CCControlEventTouchUpInside)
end

return var_0_0
