rankInfoControl = {}

local var_0_0 = rankInfoControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
	print("clearPanel")
end

function var_0_0.onFeatRankLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/rankInfo/dailyFeat/DailyFeat").new(var_0_1)

	if guide.constant.popui[6][2] == true then
		guide.constant.popui[6][2] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onOfficerLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/rankInfo/officer/ui")

	local var_4_0 = officer.ui.show()

	var_0_1:addChild(var_4_0)

	if guide.constant.popui[6][1] == true then
		guide.constant.popui[6][1] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onSuppliesLabelClick()
	var_0_0.clearPanel()

	if guide.constant.popui[6][3] == true then
		guide.constant.popui[6][3] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onChallengeRankLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/rankInfo/twoRankInfo/ui")

	local var_6_0 = twoRankInfoUI.show(1)

	var_0_1:addChild(var_6_0)

	if guide.constant.popui[6][4] == true then
		guide.constant.popui[6][4] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onStormRankLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/rankInfo/twoRankInfo/ui")

	local var_7_0 = twoRankInfoUI.show(2)

	var_0_1:addChild(var_7_0)

	if guide.constant.popui[6][5] == true then
		guide.constant.popui[6][5] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onWorkListLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/rankInfo/workerList/ui")

	local var_8_0 = workerListUI.show()

	var_0_1:addChild(var_8_0)
end
