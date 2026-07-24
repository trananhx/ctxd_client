welfareNoticeControl = {}

local var_0_0 = welfareNoticeControl
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

function var_0_0.onWelfareNoticeLabelClick()
	print("store label clicked")
	var_0_0.clearPanel()
	require("lua/layer/welfareNotice/welfareDetail/ui")

	local var_3_0 = welfareDetailUI.show()

	print("show welfare detail ui")
	var_0_1:addChild(var_3_0)

	if guide.constant.popui[5][1] == true then
		guide.constant.popui[5][1] = false

		guide.ui.setVisible(false)
	end
end
