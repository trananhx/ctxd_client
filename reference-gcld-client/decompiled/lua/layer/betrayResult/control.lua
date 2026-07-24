betrayResultControl = {}

local var_0_0 = betrayResultControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)

	var_0_0.basePanel = var_0_1
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
end

function var_0_0.onListLabelClick()
	local function var_3_0(arg_4_0)
		var_0_0.clearPanel()

		local var_4_0 = require("lua/layer/betrayResult/betrayList").new(var_0_1, arg_4_0.action.data)
	end

	if user.displayBetrayers then
		cmgr.sendRequest(var_3_0, actions.getBetrayersList)
	else
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("betrayResultLayer"):removeFromParentAndCleanup(true)
	end
end

function var_0_0.onRewardLabelClick()
	local function var_5_0(arg_6_0)
		var_0_0.clearPanel()

		local var_6_0 = require("lua/layer/betrayResult/betrayReward").new(var_0_1, arg_6_0.action.data)
	end

	if user.havaBetrayReward == 1 then
		cmgr.sendRequest(var_5_0, actions.getTenPlayerNamesByForceId, user.player.forceId)
	else
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("betrayResultLayer"):removeFromParentAndCleanup(true)
	end
end
