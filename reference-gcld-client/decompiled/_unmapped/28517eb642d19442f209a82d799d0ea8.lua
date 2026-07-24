weaponTab.control = {}

local var_0_0

function weaponTab.control.initControl(arg_1_0)
	var_0_0 = CCLayer:create()

	arg_1_0:addChild(var_0_0, 100)

	weaponTab.control.basePanel = var_0_0
end

function weaponTab.control.clearPanel()
	var_0_0:removeAllChildrenWithCleanup(true)
end

function weaponTab.control.onWeaponClick()
	weaponTab.control.clearPanel()
	require("lua/layer/weaponTab/weapon/Weapon").new(var_0_0)

	if guide.constant.popui[7][1] == true then
		guide.constant.popui[7][1] = false

		guide.ui.setVisible(false)
	end
end

function weaponTab.control.onGemClick()
	weaponTab.control.clearPanel()
	require("lua/layer/weaponTab/diamond/ui")

	local var_4_0 = diamond.ui.show()

	var_0_0:addChild(var_4_0)

	if guide.constant.popui[7][2] == true then
		guide.constant.popui[7][2] = false

		guide.ui.setVisible(false)
	end
end

function weaponTab.control.onDiamondClick()
	weaponTab.control.clearPanel()
	require("lua/layer/weaponTab/diamondShop/ui")

	local var_5_0 = diamondShop.ui.show()

	var_0_0:addChild(var_5_0)

	if guide.constant.popui[7][3] == true then
		guide.constant.popui[7][3] = false

		guide.ui.setVisible(false)
	end
end

function weaponTab.control.onMachineClick()
	weaponTab.control.clearPanel()

	local var_6_0

	if user.catapultRebuilt then
		var_6_0 = require("lua/layer/weaponTab/catapult/Catapult").new()
	else
		require("lua/layer/weaponTab/machine/ui")

		var_6_0 = machine.ui.show()
	end

	var_0_0:addChild(var_6_0)

	if guide.constant.popui[7][4] == true then
		guide.constant.popui[7][4] = false

		guide.ui.setVisible(false)
	end
end

function weaponTab.control.onSilkTreasureClick()
	weaponTab.control.clearPanel()
	require("lua/layer/weaponTab/silkTreasure/ui")

	local var_7_0 = silkTreasure.ui.show()

	var_0_0:addChild(var_7_0)

	if guide.constant.popui[7][5] == true then
		guide.constant.popui[7][5] = false

		guide.ui.setVisible(false)
	end
end

function weaponTab.control.onCastingClick()
	weaponTab.control.clearPanel()
	require("lua/layer/weaponTab/casting/CastingPanel").new(var_0_0)

	if guide.constant.popui[7][6] == true then
		guide.constant.popui[7][6] = false

		guide.ui.setVisible(false)
	end
end
