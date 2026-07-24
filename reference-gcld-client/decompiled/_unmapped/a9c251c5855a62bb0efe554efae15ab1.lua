require("lua/common/tool")
require("lua/component/messageBox")

storeControl = {}

local var_0_0 = storeControl
local var_0_1 = true
local var_0_2 = 0
local var_0_3 = false

function var_0_0.initControl(arg_1_0)
	return
end

function handlerStoreBuyItemAction(arg_2_0)
	if arg_2_0.action.state == 1 then
		var_0_3 = true

		if storeUI.isBuyPic then
			storeUI.isBuyPic = false

			eventManager.dispatchEvent("resourceAreaDidGetPic")
		end

		if smgr.currentSceneTag == SCENE_RES_MUCHANG then
			eventManager.dispatchEvent("refreshMuchang")
		end

		var_0_0.storeGetItems()
	end
end

function handlerStoreCdRecoverConfirmAction(arg_3_0)
	if arg_3_0.action.state == 1 then
		log.debug("recover successed , get items")
		storeUI.cdTimeLabel:setTime(1)
		storeUI.cdTimeLabel:setColor(nil)
	else
		log.debug("recover failed")
	end
end

function handlerStoreCdRecoverAction(arg_4_0)
	if arg_4_0.action.state == 1 then
		storeCdRefreshChargeWindow(arg_4_0.action.data.gold)
	end
end

function handlerStoreRefreshItemAction(arg_5_0)
	if arg_5_0.action.state == 1 then
		var_0_2 = arg_5_0.action.data.needTips

		updateEquipmentStorePage(arg_5_0, true)
	end
end

function handlerStoreGetItemsAction(arg_6_0)
	log.info("updateEquipmentStorePage")

	if arg_6_0.action.state == 1 then
		var_0_2 = arg_6_0.action.data.needTips

		updateEquipmentStorePage(arg_6_0, false)
	end
end

function var_0_0.storeGetItems()
	log.debug("getItems")
	cmgr.sendRequest(handlerStoreGetItemsAction, actions.storeGetItems, 1)
end

function var_0_0.storeBuyItem(arg_8_0)
	cmgr.sendRequest(handlerStoreBuyItemAction, actions.storeBuyItem, arg_8_0)
end

function var_0_0.storeRefreshItem()
	if var_0_2 ~= 0 then
		local var_9_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_9_0:setTouchEnabled(true)
		var_9_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
			if arg_10_0 == CCTOUCHBEGAN then
				return true
			elseif arg_10_0 == CCTOUCHMOVED then
				return true
			elseif arg_10_0 == CCTOUCHENDED then
				return true
			end
		end, false, true)

		local var_9_1

		if var_0_2 == 1 then
			var_9_1 = language.get(101001)
		else
			var_9_1 = language.get(101002)
		end

		local var_9_2 = messageBox.createMessageBox(language.get(10003), var_9_1, {
			{
				text = language.get(10001),
				callBack = function()
					var_9_0:removeAllChildrenWithCleanup(true)
					var_9_0:removeFromParentAndCleanup(true)
					cmgr.sendRequest(handlerStoreRefreshItemAction, actions.storeRefreshItem, 1)
				end
			},
			{
				text = language.get(10002),
				callBack = function()
					var_9_0:removeAllChildrenWithCleanup(true)
					var_9_0:removeFromParentAndCleanup(true)
				end
			}
		})

		var_9_0:addChild(var_9_2)
		smgr.rootLayer:addChild(var_9_0, 60000)
	elseif var_0_2 == 0 then
		cmgr.sendRequest(handlerStoreRefreshItemAction, actions.storeRefreshItem, 1)
	end
end

function var_0_0.onTouch(arg_13_0, arg_13_1, arg_13_2)
	log.debug("control onTouch")
end

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	require("lua/guide/control")

	guide.uiElementsTable[1023] = nil
	guide.uiElementsTable[1026] = nil
	guide.callback = nil
end
