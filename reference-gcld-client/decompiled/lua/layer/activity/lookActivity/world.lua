local var_0_0 = class("LookWorld", function()
	return createBaseLayer()
end)
local var_0_1 = import(".mapLayer")
local var_0_2 = import(".menuLayer")
local var_0_3 = import(".thumbnailLayer")
local var_0_4 = import(".effectLayer")

require("lua/layer/playerInfo/ui")

function var_0_0.ctor(arg_2_0, arg_2_1)
	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/world/thumbnail.plist")
	rmgr.loadResource("res/ui/world/cityWindow.plist")
	rmgr.loadResource("res/ui/world/convene.plist")
	rmgr.loadResource("res/ui/world/generalMove.plist")
	rmgr.loadResource("res/ui/world/generalMove_fast.plist")
	rmgr.loadResource("res/ui/activity/lookActivity/lookActivity.plist")
	rmgr.loadResource("res/ui/activity/ancientCastle/shaizi.plist")

	arg_2_0.control = arg_2_1
	arg_2_0.control.world = arg_2_0
	arg_2_0.effectLayer = var_0_4.new(arg_2_0)
	arg_2_0.mapLayer = var_0_1.new(arg_2_0)
	arg_2_0.menuLayer = var_0_2.new(arg_2_0)
	arg_2_0.thumbnailLayer = var_0_3.new(arg_2_0, arg_2_0.mapLayer)

	arg_2_0:addChild(arg_2_0.mapLayer, 1)
	arg_2_0:addChild(arg_2_0.menuLayer, 2)
	arg_2_0:addChild(arg_2_0.thumbnailLayer, 3)
	arg_2_0:addChild(arg_2_0.effectLayer, 4)
	playerInfoUI.show()
	smgr.hideNotice()
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)

	if user.getFunc(15) then
		local var_2_0 = require("lua/layer/chat/chatWindow")

		var_2_0:showFastChatPanel(arg_2_0, 3)
		var_2_0.widgets.panel:setVisible(true)

		arg_2_0.chat_panel = var_2_0.widgets.panel
	end
end

function var_0_0.playerMove(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.mapLayer:playerMove(arg_3_1, arg_3_2)
end

function var_0_0.updateMapLayer(arg_4_0)
	arg_4_0.mapLayer:updateCityState()
end

function var_0_0.updateMenuLayer(arg_5_0)
	arg_5_0.menuLayer:updateDiceState()
end

function var_0_0.updateThumbnail(arg_6_0)
	arg_6_0.thumbnailLayer:updateThumbnail()
end

function var_0_0.updateThumbnailFrame(arg_7_0)
	arg_7_0.thumbnailLayer:updateFrame()
end

function var_0_0.playShaiziAnim(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.effectLayer:playShaiziAnim(arg_8_1, arg_8_2)
end

function var_0_0.showAreaCompleteReward(arg_9_0, arg_9_1)
	arg_9_0.effectLayer:showAreaCompleteReward(arg_9_1)
end

function var_0_0.showCityRewards(arg_10_0, arg_10_1)
	arg_10_0.mapLayer:showCityRewards(arg_10_1)
end

function var_0_0.openNextArea(arg_11_0, arg_11_1)
	if arg_11_1 >= 5 then
		return
	end

	arg_11_0.mapLayer:openNextArea(arg_11_1)
end

return var_0_0
