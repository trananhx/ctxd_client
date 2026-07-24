local var_0_0 = class("TianDengInfoControl")
local var_0_1 = {
	1,
	2,
	3,
	4,
	6,
	nil,
	nil,
	nil,
	nil,
	nil,
	7,
	[85] = 85,
	[81] = 24,
	[84] = 84,
	[21] = 7
}

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getPanelInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.data = arg_3_0.action.data

		arg_2_0.ui:init()
	end

	cmgr.sendRequest(var_2_0, actions.getWorldJubenInfo, arg_2_0.ui.cityId)
end

function var_0_0.dealPlayerEvent(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}
		local var_5_1 = 0

		for iter_5_0, iter_5_1 in pairs(arg_5_0.action.data.playerEvent.gain) do
			if var_0_1[iter_5_1.gainType] then
				var_5_0[iter_5_0] = {}
				var_5_0[iter_5_0].id = var_0_1[iter_5_1.gainType]
				var_5_0[iter_5_0].value = iter_5_1.gainNum
			elseif iter_5_1.gainType == 1000 then
				local var_5_2 = iter_5_1.gainNum
			end
		end

		globalAction_gotResource(var_5_0)

		local var_5_3 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_4_0.ui.cityId]

		pcall(var_5_3.eventSprite.removeFromParentAndCleanup, var_5_3.eventSprite, true)

		var_5_3.eventSprite = nil
		var_5_3.eventInfo = nil
		worldControl.thumbnailIconTable["city_" .. arg_4_0.ui.cityId] = nil

		worldThumbnailUI.updateEventNum()

		local var_5_4 = 0

		if #var_5_0 > 0 then
			var_5_4 = 1
		end

		smgr.getLayer("topLayer"):runAction(CCSequence:createWithTwoActions(CCDelayTime:create(var_5_4), CCCallFunc:create(function(...)
			globalAction_flyNode(CCSprite:create("res/ui/activity/tiandeng/tdxy_word_kmdfdggl.png"))
		end)))
		arg_4_0.ui:removeFromParentAndCleanup(true)
	end

	cmgr.sendRequest(var_4_0, actions.dealTianDengEvent, arg_4_0.ui.cityId, arg_4_1)
end

function var_0_0.onTouch(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.ui:removeFromParentAndCleanup(true)

	return true
end

return var_0_0
