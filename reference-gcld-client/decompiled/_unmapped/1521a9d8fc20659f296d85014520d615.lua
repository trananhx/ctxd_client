kfwdControl = {}

local var_0_0 = kfwdControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	print("init base panel")

	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
	print("clearPanel")
end

function var_0_0.onKfwdLabelClick()
	print("store label clicked")
	var_0_0.clearPanel()
	require("lua/layer/kfwd/kfwdEntrance/ui")

	local var_3_0 = kfwdEntranceUI.show()

	print("show kfwd entrance ui")
	var_0_1:addChild(var_3_0)

	if guide.constant.popui[5][1] == true then
		guide.constant.popui[5][1] = false

		guide.ui.setVisible(false)
	end
end
