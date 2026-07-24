local var_0_0 = class("Kfsy", function()
	return createBaseLayer()
end)
local var_0_1 = require("lua/layer/kfsy/BackGroundLayer")
local var_0_2 = require("lua/layer/kfsy/MenuLayer")
local var_0_3 = require("lua/layer/kfsy/LvbuLayer")
local var_0_4 = require("lua/layer/kfsy/ZhaoYunLayer")

function var_0_0.ctor(arg_2_0)
	require("lua/layer/kfsy/control")
	require("lua/layer/kfsy/feastInfo")

	arg_2_0.backGroundLayer = var_0_1.new()
	arg_2_0.menuLayer = var_0_2.new()
	arg_2_0.lvbuLayer = var_0_3.new()

	arg_2_0.lvbuLayer:setVisible(false)

	arg_2_0.zhaoYunLayer = var_0_4.new()

	arg_2_0.zhaoYunLayer:setVisible(false)

	kfsyInfo.ref.backGroundLayer = arg_2_0.backGroundLayer

	arg_2_0:addChild(arg_2_0.backGroundLayer, 1)
	arg_2_0:addChild(arg_2_0.menuLayer, 2)
	arg_2_0:addChild(arg_2_0.lvbuLayer, 3)
	arg_2_0:addChild(arg_2_0.zhaoYunLayer, 3)
	arg_2_0:request_feastInfo()
end

function var_0_0.handler_pushlayer(arg_3_0, arg_3_1)
	log.info("ShenYan:pushlayer()")
	showTable(arg_3_1)

	if arg_3_1.action.state == 3 and arg_3_1.action.data and (arg_3_1.action.data.update.kfzbFeastState == 3 or arg_3_1.action.data.update.kfzbFeastState == 1) then
		arg_3_0:request_feastInfo()
	end
end

function var_0_0.onEnter(arg_4_0)
	local function var_4_0()
		arg_4_0:request_feastInfo()
	end

	arg_4_0.updateSchedulerEntry = arg_4_0.updateSchedulerEntry or nil
	arg_4_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_4_0, 5, false)
	arg_4_0.requestFeastInfoRef = handler(arg_4_0, arg_4_0.request_feastInfo)

	eventManager.registerEvent("kfsyChange", arg_4_0.requestFeastInfoRef)

	function arg_4_0.setLvbuLayerVisibleRef(arg_6_0)
		arg_4_0.lvbuLayer:setVisible(arg_6_0)
	end

	function arg_4_0.showZhaoYunLayer(arg_7_0, arg_7_1)
		if arg_7_0 then
			arg_4_0.zhaoYunLayer:show(arg_7_1)
		else
			arg_4_0.zhaoYunLayer:close()
		end
	end

	eventManager.registerEvent("setLvbuLayerVisible", arg_4_0.setLvbuLayerVisibleRef)
	eventManager.registerEvent("showZhaoYunLayer", arg_4_0.showZhaoYunLayer)
end

function var_0_0.onExit(arg_8_0)
	if arg_8_0.updateSchedulerEntry ~= nil then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_8_0.updateSchedulerEntry)

		arg_8_0.updateSchedulerEntry = nil
	end

	eventManager.unregisterEvent("kfsyChange", arg_8_0.requestFeastInfoRef)
	eventManager.unregisterEvent("setLvbuLayerVisible", arg_8_0.setLvbuLayerVisibleRef)
	eventManager.unregisterEvent("showZhaoYunLayer", arg_8_0.showZhaoYunLayer)
end

function var_0_0.request_feastInfo(arg_9_0)
	local function var_9_0(arg_10_0)
		log.info("ShenYan:receive_feastInfo")

		user.evokeOpen = arg_10_0.action.data.evokeOpen

		if arg_10_0.action.data.rooms then
			local var_10_0 = arg_10_0.action.data.rooms

			for iter_10_0 = 1, #var_10_0 - 1 do
				for iter_10_1 = 1, #var_10_0 - 1 do
					if var_10_0[iter_10_1].haveDrink == 0 and var_10_0[iter_10_1 + 1].haveDrink > 0 then
						local var_10_1 = var_10_0[iter_10_1]

						var_10_0[iter_10_1] = var_10_0[iter_10_1 + 1]
						var_10_0[iter_10_1 + 1] = var_10_1
					end
				end
			end
		end

		require("lua/layer/kfsy/feastInfo")

		kfsyInfo.feastInfo.response = arg_10_0

		if kfsyInfo.feastInfo.response.action.data.inRoom > 0 then
			require("lua/layer/kfsy/buyAndRule/player16/control")
			kfsyPlayerControl.request_kfsyGetRoomInfo(0, 0, 0)

			return
		end

		arg_9_0.backGroundLayer:updateInfo(arg_10_0)
		arg_9_0.lvbuLayer:updateInfo(arg_10_0)
		require("lua/layer/kfsy/buyAndRule/buy/ui")
	end

	cmgr.sendRequest(var_9_0, actions.kfsyFeastInfo)
end

return var_0_0
