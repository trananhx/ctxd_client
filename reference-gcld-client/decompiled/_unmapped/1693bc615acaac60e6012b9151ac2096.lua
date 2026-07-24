require("lua/common/tool")
require("lua/component/messageBox")

storageControl = {}
storageControl.itemsData = {}
storageControl.blocksData = {}

local var_0_0 = storageControl
local var_0_1
local var_0_2 = 0
local var_0_3 = false

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = (arg_1_0 - 1) * 3 + 1
	local var_1_1 = var_1_0 + 2

	if arg_1_0 == math.ceil(#arg_1_1 / 3) then
		var_1_1 = #arg_1_1
	end

	return var_1_0, var_1_1
end

function handlerStorageGetBuyBackItemsAction(arg_2_0)
	if arg_2_0.action.state == 1 then
		var_0_0.itemsData = arg_2_0.action.data.goods
		var_0_0.blocksData = {}

		for iter_2_0 = 1, math.ceil(#var_0_0.itemsData / 3) do
			local var_2_0, var_2_1 = var_0_4(iter_2_0, var_0_0.itemsData)
			local var_2_2 = {}

			for iter_2_1 = var_2_0, var_2_1 do
				var_2_2[#var_2_2 + 1] = var_0_0.itemsData[iter_2_1]
			end

			var_0_0.blocksData[iter_2_0] = var_2_2
		end

		log.debug("get storage buy back items succeed :", var_0_0.itemsData, #var_0_0.itemsData)
		storageUpdateStatus()

		if var_0_2 == 0 then
			updateEquipmentStorageList(var_0_0.itemsData)
		else
			storageUI.updateBlocksFromIndex(var_0_2)
		end

		if var_0_1 then
			log.debug("lastScrollViewOffset: ", var_0_1)
			storageUI.scrollView:setContentOffset(var_0_1)
		else
			log.debug("last scrollView offset is nil ")
		end
	end
end

function handlerStorageBuyBackItemAction(arg_3_0)
	if arg_3_0.action.state == 1 then
		storageFlyTextToPositionInScreen(visibleSize.width * 0.5, visibleSize.height * 0.5, "-" .. arg_3_0.action.data.copper .. "银币", ccc3(255, 0, 0))
		var_0_0.storageGetBuyBackItems()
	end
end

function storageControl.onBuyBackItemButtonTap(arg_4_0)
	var_0_1 = storageUI.scrollView:getContentOffset()
	var_0_2 = arg_4_0

	log.debug("lastScrollViewOffset when button tap :", var_0_1)
	cmgr.sendRequest(handlerStorageBuyBackItemAction, actions.storageBuyBackItem, var_0_0.itemsData[arg_4_0].vId)
end

function var_0_0.storageGetBuyBackItems()
	cmgr.sendRequest(handlerStorageGetBuyBackItemsAction, actions.storageGetBuyBackItems)
end

function var_0_0.onStorageItemButtonTap(arg_6_0)
	log.info("storageGetBuyBackItems")

	var_0_1 = storageUI.scrollView:getContentOffset()
	var_0_2 = arg_6_0

	log.debug("lastScrollViewOffset when button tap :", var_0_1)
	log.info("item index :", arg_6_0, "item vid :", storageControl.itemsData[arg_6_0].vId)

	if var_0_0.itemsData[arg_6_0].kind == 2 then
		cmgr.sendRequest(handlerStorageSellItemAction, actions.storageSellItem, var_0_0.itemsData[arg_6_0].num, var_0_0.itemsData[arg_6_0].vId)
	elseif var_0_0.itemsData[arg_6_0].kind == 4 then
		var_0_0.storageGetCanUseGeneral(arg_6_0)
	else
		cmgr.sendRequest(handlerStorageSellItemAction, actions.storageSellItem, 0, var_0_0.itemsData[arg_6_0].vId)
	end
end

function var_0_0.onEnter()
	var_0_2 = 0

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end
end

function var_0_0.onExit()
	storageControl.itemsData = nil
	storageControl.blocksData = nil
	storageControl.scrollLayer = nil
	storageControl.scrollView = nil
	var_0_1 = nil

	log.debug("control exit")

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end
end
