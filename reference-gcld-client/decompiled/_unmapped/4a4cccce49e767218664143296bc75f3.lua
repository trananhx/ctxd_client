equipmentControl = {}

local var_0_0 = equipmentControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
	print("clearPanel")
end

function var_0_0.onStoreLabelClick()
	print("store label clicked")
	var_0_0.clearPanel()

	if user.supplyOpen then
		local var_3_0 = require("lua/layer/equipment/SupplyTab").new()

		var_0_1:addChild(var_3_0)
	else
		require("lua/layer/equipment/store/ui")

		local var_3_1 = storeUI.show()

		var_0_1:addChild(var_3_1)
	end

	if guide.constant.popui[4][1] == true then
		guide.constant.popui[4][1] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onStoreHouseLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/equipment/storeHouse/ui")

	local var_4_0 = false
	local var_4_1 = storeHouseUI.show(var_4_0)

	var_0_1:addChild(var_4_1)

	if guide.constant.popui[4][2] == true then
		guide.constant.popui[4][2] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onSTBackLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/equipment/storeHouse/ui")

	local var_5_0 = true
	local var_5_1 = storeHouseUI.show(var_5_0)

	var_0_1:addChild(var_5_1)

	if guide.constant.popui[4][3] == true then
		guide.constant.popui[4][3] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onQuenchingLabelClick()
	var_0_0.clearPanel()

	if user.sublimated then
		require("lua/layer/equipment/kaiguang/ui")

		local var_6_0 = equipmentKaiguangUI.showFinal()

		var_0_1:addChild(var_6_0)
	else
		require("lua/layer/equipment/quenching/ui")

		local var_6_1 = equipmentQuenchingUI.show()

		var_0_1:addChild(var_6_1)

		if guide.constant.popui[4][4] == true then
			guide.constant.popui[4][4] = false

			guide.ui.setVisible(false)
		end
	end
end

function var_0_0.onJiaoSuitLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/equipment/shenjiang/ui")

	local var_7_0 = shenjiangUI.show()

	var_0_1:addChild(var_7_0)
end

function var_0_0.onTradeLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/equipment/trade/ui")

	local var_8_0 = tradeUI.show()

	var_0_1:addChild(var_8_0)

	if guide.constant.popui[4][5] == true then
		guide.constant.popui[4][5] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onKaiguangLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/equipment/kaiguang/ui")

	local var_9_0 = equipmentKaiguangUI.show()

	var_0_1:addChild(var_9_0)

	if guide.constant.popui[4][5] == true then
		guide.constant.popui[4][5] = false

		guide.ui.setVisible(false)
	end
end
