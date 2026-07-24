technologyControl = {}

local var_0_0 = technologyControl
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

function var_0_0.onTechnologyLabelClick()
	print("store label clicked")
	var_0_0.clearPanel()
	require("lua/layer/technology/technologyList/ui")

	local var_3_0 = technologyListUI.show()

	print("show technology list ui")
	var_0_1:addChild(var_3_0)

	if guide.constant.popui[5][1] == true then
		guide.constant.popui[5][1] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onDragonTechLabelClick()
	print("DragonTech label clicked")
	var_0_0.clearPanel()
	require("lua/layer/technology/dragonTech/ui")

	local var_4_0 = dragonTechUI.show()

	var_0_1:addChild(var_4_0)

	if guide.constant.popui[5][2] == true then
		guide.constant.popui[5][2] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onTrainingLabelClick()
	var_0_0.clearPanel()
	require("lua/layer/general/training/ui")

	local var_5_0 = trainingUI.show()

	print("show technology list ui")
	var_0_1:addChild(var_5_0)
end

function var_0_0.onBuildingTechClick()
	print("DragonTech label clicked")
	var_0_0.clearPanel()
	require("lua/layer/technology/buildTech/ui")

	local var_6_0 = buildTechUI.show()

	var_0_1:addChild(var_6_0)
end
