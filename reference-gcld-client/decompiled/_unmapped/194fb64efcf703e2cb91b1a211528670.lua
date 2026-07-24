require("lua/layer/chargeItems/constant")
require("lua/layer/chargeItems/control")

chargeItemsUI = {}

local var_0_0 = chargeItemsControl
local var_0_1 = chargetItemsConstant
local var_0_2

local function var_0_3()
	local var_1_0 = smgr.getLayer("chargeItemsLayer")

	if var_0_2 and var_1_0 then
		var_0_2:removeChild(var_1_0, true)
	end
end

function chargeItemsUI.show(arg_2_0)
	log.debug("chargeItemsUI show")

	var_0_2 = arg_2_0

	local var_2_0 = CCScrollView:create()

	smgr.registerLayer(var_2_0, "chargeItemsLayer")
	var_2_0:registerScriptTouchHandler(var_0_0.onTouch)
	var_2_0:setTouchEnabled(true)

	var_2_0.onEnter = var_0_0.onEnter
	var_2_0.onExit = var_0_0.onExit

	var_2_0:setContentSize(CCSizeMake(2880, 640))

	local var_2_1 = "res/ui/mainCity/background_main_city.jpg"
	local var_2_2 = CCSprite:create(var_2_1)
	local var_2_3 = CCSprite:create(var_2_1)
	local var_2_4 = CCSprite:create(var_2_1)

	var_2_2:setPosition(ccp(480, 320))
	var_2_3:setPosition(ccp(1440, 320))
	var_2_4:setPosition(ccp(2400, 320))
	var_2_0:addChild(var_2_2)
	var_2_0:addChild(var_2_3)
	var_2_0:addChild(var_2_4)
	var_0_2:addChild(var_2_0, 100)
end
