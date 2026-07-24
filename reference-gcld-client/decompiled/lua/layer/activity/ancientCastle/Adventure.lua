local var_0_0 = class("Adventure", function()
	return createBaseLayer()
end)
local var_0_1 = require("lua/layer/activity/ancientCastle/ConfigureLoader")
local var_0_2 = require("lua/layer/activity/ancientCastle/MapLayer")
local var_0_3 = require("lua/layer/activity/ancientCastle/AdventureInfoLayer")

var_0_0.STATE = {
	MOVING_WITH_STEP = 3,
	MOVING_WITHOUT_STEP = 4,
	IDLE_WITHOUT_STEP = 2,
	IDLE_WITH_STEP = 1,
	WIN = 5
}

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.mapId = arg_2_1
	user.mapId = arg_2_1

	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/activity/ancientCastle/gcName.plist")
	rmgr.loadResource("res/ui/activity/ancientCastle/shaizi.plist")
	rmgr.loadResource("res/ui/world/generalMove.plist")

	arg_2_0.config = var_0_1.new(arg_2_0)
	arg_2_0.mapLayer = var_0_2.new(arg_2_0)
	arg_2_0.infoLayer = var_0_3.new(arg_2_0)

	arg_2_0:addChild(arg_2_0.mapLayer)
	arg_2_0:addChild(arg_2_0.infoLayer)
	smgr.hideNotice()
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)
	arg_2_0:startAdventure()
end

function var_0_0.handlerStartAdventure(arg_3_0, arg_3_1)
	arg_3_0.data = arg_3_1.action.data

	arg_3_0.mapLayer:handlerStartAdventure(arg_3_1)
	arg_3_0.infoLayer:handlerStartAdventure(arg_3_1)
end

function var_0_0.startAdventure(arg_4_0)
	cmgr.sendRequest(handler(arg_4_0, arg_4_0.handlerStartAdventure), actions.startAdventure, arg_4_0.mapId)
end

return var_0_0
