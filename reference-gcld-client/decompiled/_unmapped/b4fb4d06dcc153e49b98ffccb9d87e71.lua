return {
	show = function(arg_1_0, arg_1_1)
		rmgr.loadResource("res/ui/mainCityEvent/mainCityEvent.plist")

		local var_1_0 = require("res/layout/zhenw/zhenwLayout")

		uiutil.initLayout(arg_1_0, var_1_0)

		local var_1_1 = require("lua/layer/zhenwEvent/zhwControl"):create(arg_1_0)

		var_1_1.buildId = arg_1_1

		arg_1_0.widgets.getRewardButton:addHandleOfControlEvent(var_1_1.getReward, CCControlEventTouchUpInside)
		arg_1_0.widgets.option1:addHandleOfControlEvent(var_1_1.doOption1, CCControlEventTouchUpInside)
		arg_1_0.widgets.option2:addHandleOfControlEvent(var_1_1.doOption2, CCControlEventTouchUpInside)
		arg_1_0.widgets.closeWindowButton:addHandleOfControlEvent(var_1_1.close, CCControlEventTouchUpInside)

		function arg_1_0.widgets.window.onEnter(...)
			var_1_1.getRewardInfo(arg_1_1)
		end

		function arg_1_0.widgets.window.onExit(...)
			return
		end

		initScriptEventNode(arg_1_0.widgets.window)

		local var_1_2 = smgr.getLayer("topLayer")

		var_1_2:removeAllChildrenWithCleanup(true)
		var_1_2:addChild(arg_1_0.widgets.window)
	end
}
