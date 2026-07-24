local var_0_0 = class("FamousInfoControl")
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
	[84] = 84,
	[85] = 85,
	[81] = 24,
	[116] = 55,
	[126] = 10030,
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

function var_0_0.getExtraReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}

		for iter_5_0, iter_5_1 in pairs(arg_5_0.action.data.rewards) do
			if var_0_1[iter_5_1.type] then
				var_5_0[iter_5_0] = {}
				var_5_0[iter_5_0].id = var_0_1[iter_5_1.type]
				var_5_0[iter_5_0].value = iter_5_1.value
			else
				var_5_0[iter_5_0] = {}
				var_5_0[iter_5_0].id = 3
				var_5_0[iter_5_0].value = iter_5_1.value
			end
		end

		globalAction_gotResource(var_5_0)

		local var_5_1 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_4_0.ui.cityId]

		pcall(var_5_1.eventSprite.removeFromParentAndCleanup, var_5_1.eventSprite, true)

		var_5_1.eventSprite = nil
		var_5_1.eventInfo = nil
		worldControl.thumbnailIconTable["city_" .. arg_4_0.ui.cityId] = nil

		worldThumbnailUI.updateEventNum()
		arg_4_0.ui:removeFromParentAndCleanup(true)
	end

	cmgr.sendRequest(var_4_0, actions.worldGetExtraReward)
end

function var_0_0.dealPlayerEvent(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0)
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in pairs(arg_7_0.action.data.playerEvent.gain) do
			if var_0_1[iter_7_1.gainType] then
				var_7_0[iter_7_0] = {}
				var_7_0[iter_7_0].id = var_0_1[iter_7_1.gainType]
				var_7_0[iter_7_0].value = iter_7_1.gainNum
			else
				var_7_0[iter_7_0] = {}
				var_7_0[iter_7_0].id = 3
				var_7_0[iter_7_0].value = iter_7_1.value
			end
		end

		globalAction_gotResource(var_7_0)

		if arg_6_1 == 1 then
			local var_7_1 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_6_0.ui.cityId]

			pcall(var_7_1.eventSprite.removeFromParentAndCleanup, var_7_1.eventSprite, true)

			var_7_1.eventSprite = nil
			var_7_1.eventInfo = nil
			worldControl.thumbnailIconTable["city_" .. arg_6_0.ui.cityId] = nil

			worldThumbnailUI.updateEventNum()
			arg_6_0.ui:removeFromParentAndCleanup(true)
		elseif arg_6_1 == 2 then
			arg_6_0.ui.uiTable.button1:setEnabled(false)
			arg_6_0.ui.uiTable.button2:setEnabled(false)

			local var_7_2 = CCLayerColor:create(ccc4(0, 0, 0, 180), 404, 232)

			var_7_2:setPosition(ccp(198, 9))
			arg_6_0.ui.uiTable.board:addChild(var_7_2, 200)

			local var_7_3 = CCSprite:create("res/ui/activity/famous/gjms_hb.png")

			var_7_3:setPosition(ccp(202, 416))
			var_7_2:addChild(var_7_3)

			arg_6_0.ui.uiTable.reward = var_7_3

			local var_7_4 = CCSprite:create("res/ui/activity/famous/gjms_hb_h.png")

			var_7_4:setPosition(ccp(43, 63.5))
			var_7_3:addChild(var_7_4, -1)

			local var_7_5 = CCArray:create()

			var_7_5:addObject(CCFadeIn:create(0.3))
			var_7_5:addObject(CCFadeOut:create(0.3))

			local var_7_6 = CCSequence:create(var_7_5)
			local var_7_7 = CCRepeatForever:create(tolua.cast(var_7_6, "CCActionInterval"))

			var_7_4:runAction(var_7_7)

			local var_7_8 = CCMoveTo:create(1, ccp(202, 116))
			local var_7_9 = CCEaseElasticOut:create(var_7_8, 1)

			var_7_3:runAction(var_7_9)
		end
	end

	cmgr.sendRequest(var_6_0, actions.dealFamousEvent, arg_6_0.ui.cityId, arg_6_1)
end

function var_0_0.onTouch(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_1 == CCTOUCHBEGAN then
		if arg_8_0.ui.uiTable.reward then
			if tool.checkIfTouch(arg_8_0.ui.uiTable.reward, arg_8_2, arg_8_3) then
				arg_8_0:getExtraReward()
			end
		else
			arg_8_0.ui:removeFromParentAndCleanup(true)
		end
	end

	return true
end

return var_0_0
