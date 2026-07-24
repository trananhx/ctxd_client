resourceControl = {}

local var_0_0 = resourceControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)

	var_0_0.basePanel = var_0_1
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
end

function var_0_0.onIncenseLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/incense/ui")

	local var_3_0 = incenseUI.show()

	var_0_1:addChild(var_3_0)

	if guide.constant.popui[1][1] == true then
		guide.constant.popui[1][1] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onMarketLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/market/ui")

	local var_4_0 = marketUI.show()

	var_0_1:addChild(var_4_0)

	if guide.constant.popui[1][2] == true then
		guide.constant.popui[1][2] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onBlackMarketLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/blackMarket/ui")

	local var_5_0 = blackMarketUI.show()

	var_0_1:addChild(var_5_0)

	if guide.constant.popui[1][3] == true then
		guide.constant.popui[1][3] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onCCBIncenseLabelClick()
	var_0_0.clearPanel()

	curPanel = require("lua/layer/resource/ccbincense/incenseLayer").getIncenseLayer()

	var_0_1:addChild(curPanel)
end

function var_0_0.onTicketsLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/tickets/ui")

	local var_7_0 = ticketUI.show()

	var_0_1:addChild(var_7_0)

	if guide.constant.popui[1][4] == true then
		guide.constant.popui[1][4] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onBlacksmithsLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/blacksmith/ui")

	local var_8_0 = blacksmithUI.show()

	var_0_1:addChild(var_8_0)

	if guide.constant.popui[1][5] == true then
		guide.constant.popui[1][5] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onSilkSellLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/SilkSell").new(var_0_1)
end

function var_0_0.onSilkBuyLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/resource/SilkBuy").new(var_0_1)
end

function var_0_0.onSilkRoadClick()
	var_0_0.clearPanel()

	local var_11_0 = require("lua/layer/resource/silkRoad/silkRoadLayer").new()

	var_0_1:addChild(var_11_0)

	if guide.constant.popui[1][6] == true then
		guide.constant.popui[1][6] = false

		guide.ui.setVisible(false)
	end
end
