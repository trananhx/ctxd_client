require("lua/common/tool")
require("lua/component/messageBox")

storeHouseControl = {}
storeHouseControl.itemsData = {}

local var_0_0 = storeHouseControl
local var_0_1 = 0
local var_0_2
local var_0_3
local var_0_4 = {}

var_0_0.freeCard = {}
var_0_0.freeCard.copper = 0
var_0_0.freeCard.num = 0
var_0_0.freeCard.kind = -1
var_0_0.freeCard.pic = "ptqj"
var_0_0.freeCard.itemName = language.get(102042)
var_0_0.freeCard.quality = 1
var_0_0.freeCard.intro = language.get(102043)
var_0_0.goldCard = {}
var_0_0.goldCard.copper = 0
var_0_0.goldCard.num = 0
var_0_0.goldCard.kind = -1
var_0_0.goldCard.pic = "vipqj"
var_0_0.goldCard.itemName = language.get(102044)
var_0_0.goldCard.quality = 1
var_0_0.goldCard.intro = language.get(102045)
var_0_0.specialCard = {}
var_0_0.specialCard.copper = 0
var_0_0.specialCard.num = 0
var_0_0.specialCard.kind = -1
var_0_0.specialCard.pic = "specialCard"
var_0_0.specialCard.itemName = language.get(102056)
var_0_0.specialCard.quality = 1
var_0_0.specialCard.intro = language.get(102043)
var_0_0.goldSpecialCard = {}
var_0_0.goldSpecialCard.copper = 0
var_0_0.goldSpecialCard.num = 0
var_0_0.goldSpecialCard.kind = -1
var_0_0.goldSpecialCard.pic = "goldSpecialCard"
var_0_0.goldSpecialCard.itemName = language.get(102057)
var_0_0.goldSpecialCard.quality = 1
var_0_0.goldSpecialCard.intro = language.get(102045)

function var_0_0.storageGetBuyBackItems()
	cmgr.sendRequest(var_0_0.handlerStorageGetBuyBackItemsAction, actions.storageGetBuyBackItems)
end

function var_0_0.handlerStorageGetBuyBackItemsAction(arg_2_0)
	storeHouseControl.itemsData = arg_2_0.action.data.goods

	storeHouseUI.updateStoreHouse(arg_2_0.action.data)

	if var_0_1 > 0 then
		storeHouseUI.flyTextToPositionInScreen(var_0_2, var_0_3, language.get(102001, var_0_1), colorTips.red)

		var_0_1 = 0
	end
end

function var_0_0.storageBuyBackItem(arg_3_0)
	cmgr.sendRequest(var_0_0.handlerStorageBuyBackItemAction, actions.storageBuyBackItem, arg_3_0.vId)
end

function var_0_0.handlerStorageBuyBackItemAction(arg_4_0)
	var_0_1 = arg_4_0.action.data.copper
	var_0_2, var_0_3 = tool.getPositionInScreen(storeHouseUI.uiTable.buyBackButton)

	log.info("posx,y", var_0_2, var_0_3, storeHouseUI.uiTable.buyBackButton)
	var_0_0.storageGetBuyBackItems()
end

function var_0_0.handlerStorageGetItemsAction(arg_5_0)
	if arg_5_0.action.state == 1 then
		var_0_0.goldCard.num = arg_5_0.action.data.goldCard or 0
		var_0_0.freeCard.num = arg_5_0.action.data.freeCard or 0
		var_0_0.specialCard.num = arg_5_0.action.data.specialCard or 0
		var_0_0.goldSpecialCard.num = arg_5_0.action.data.goldSpecialCard or 0

		local var_5_0 = arg_5_0.action.data.goods

		if var_0_0.freeCard.num > 0 then
			table.insert(var_5_0, 1, var_0_0.freeCard)
		end

		if var_0_0.goldCard.num > 0 then
			table.insert(var_5_0, 1, var_0_0.goldCard)
		end

		if var_0_0.specialCard.num > 0 then
			table.insert(var_5_0, 1, var_0_0.specialCard)
		end

		if var_0_0.goldSpecialCard.num > 0 then
			table.insert(var_5_0, 1, var_0_0.goldSpecialCard)
		end

		storeHouseControl.itemsData = arg_5_0.action.data.goods

		log.info("should update scrollview")
		storeHouseUI.updateStoreHouse(arg_5_0.action.data)

		var_0_0.cost_copper = arg_5_0.action.data.copper or 0
		var_0_0.cost_gold = arg_5_0.action.data.cost or 0

		if var_0_1 > 0 then
			storeHouseUI.flyTextToPositionInScreen(var_0_2, var_0_3, language.get(102002, var_0_1), colorTips.green)

			var_0_1 = 0
		end
	end
end

function var_0_0.handlerStorageSellItemAction(arg_6_0)
	if arg_6_0.action.state == 1 then
		var_0_1 = arg_6_0.action.data.copper
		var_0_2, var_0_3 = tool.getPositionInScreen(storeHouseUI.uiTable.sellButton)

		log.info("posx,y", var_0_2, var_0_3, storeHouseUI.uiTable.sellButton)
		var_0_0.storageGetItems()
	end
end

function var_0_0.handlerStorageBuyStorageSize(arg_7_0)
	if arg_7_0.action.state == 1 then
		var_0_0.storageGetItems()
	end
end

function var_0_0.storageBuyStorageSize()
	log.info("shuld add slot")

	local var_8_0 = ""

	if var_0_0.cost_copper > 0 then
		var_8_0 = language.get(102050, var_0_0.cost_copper)
	else
		var_8_0 = language.get(102003, var_0_0.cost_gold)
	end

	messageBox.confirm(var_8_0, function()
		cmgr.sendRequest(var_0_0.handlerStorageBuyStorageSize, actions.storageBuyStorageSize)
	end)
end

function var_0_0.storageGetItems()
	cmgr.sendRequest(var_0_0.handlerStorageGetItemsAction, actions.storageGetItems)
end

function var_0_0.storageGetCanUseGeneral(arg_11_0)
	local function var_11_0(arg_12_0)
		if arg_12_0.action.state == 1 then
			var_0_0.generals = arg_12_0.action.data.generals

			if storeHouseUI.uiTable.storageGeneralList == nil then
				storeHouseUI.showGeneralList(arg_12_0.action.data.generals)
			else
				storeHouseUI.updateGeneralList(var_0_0.generals)
			end
		end
	end

	cmgr.sendRequest(var_11_0, actions.storageGetCanUseGeneral, arg_11_0.vId)
end

function var_0_0.storageSellItem(arg_13_0)
	if arg_13_0.kind == 2 then
		cmgr.sendRequest(var_0_0.handlerStorageSellItemAction, actions.storageSellItem, arg_13_0.num, arg_13_0.vId)
	else
		cmgr.sendRequest(var_0_0.handlerStorageSellItemAction, actions.storageSellItem, 0, arg_13_0.vId)
	end
end

function var_0_0.handlerStorageUseOnGeneralAction(arg_14_0)
	if arg_14_0.action.state == 1 then
		var_0_4 = {}
		var_0_4[1] = {}
		var_0_4[1].id = 6
		var_0_4[1].value = arg_14_0.action.data.exp

		if #var_0_4 > 0 then
			log.info("should fly rewardTable")
			globalAction_gotResource(var_0_4)

			var_0_4 = {}
		end

		if arg_14_0.action.data.haveLeft == true then
			var_0_0.storageGetCanUseGeneral(var_0_0.itemsData[storeHouseUI.currentSelectedCellIndex])
			log.info("should updata certain cell")

			local var_14_0 = storeHouseUI.currentSelectedCellIndex

			storeHouseControl.itemsData[var_14_0].num = storeHouseControl.itemsData[var_14_0].num - arg_14_0.action.data.useTime

			if storeHouseUI.cells[var_14_0].itemNumLabel then
				storeHouseUI.cells[var_14_0].itemNumLabel:setString(storeHouseControl.itemsData[var_14_0].num)
			end
		else
			if storeHouseUI.generalListMask then
				pcall(storeHouseUI.generalListMask.removeFromParentAndCleanup, storeHouseUI.generalListMask, true)
				pcall(storeHouseUI.uiTable.storageGeneralList.removeFromParentAndCleanup, storeHouseUI.uiTable.storageGeneralList, true)

				storeHouseUI.uiTable.storageGeneralList = nil
				storeHouseUI.generalListMask = nil
				storeHouseUI.generals = nil
			end

			var_0_0.storageGetItems()
		end
	end
end

function var_0_0.storageUseOnGeneral(arg_15_0, arg_15_1, arg_15_2)
	log.info("vid general id", arg_15_0.vId, arg_15_1.generalId)
	cmgr.sendRequest(var_0_0.handlerStorageUseOnGeneralAction, actions.storageUseOnGeneral, arg_15_0.vId, arg_15_1.generalId, arg_15_2)
end

function var_0_0.equipCompoundSuit(arg_16_0)
	cmgr.sendRequest(var_0_0.handlerEquipCompoundSuit, actions.equipCompoundSuit, arg_16_0.vId)
end

function var_0_0.handlerEquipCompoundSuit(arg_17_0)
	if arg_17_0.action.state == 1 then
		arg_17_0.action.data.vId = var_0_0.itemsData[storeHouseUI.currentSelectedCellIndex].vId

		storeHouseUI.showSuitCompoundPanel(arg_17_0.action.data)
	end
end

function var_0_0.equipDoCompoundSuit(arg_18_0)
	messageBox.confirm(language.get(102004), function()
		cmgr.sendRequest(var_0_0.handlerEquipDoCompoundSuit, actions.equipDoCompoundSuit, arg_18_0.vId)
	end)
end

function var_0_0.handlerEquipDoCompoundSuit(arg_20_0)
	if arg_20_0.action.state == 1 then
		if storeHouseUI.suitCompoundMask then
			pcall(storeHouseUI.suitCompoundMask.removeFromParentAndCleanup, storeHouseUI.suitCompoundMask, true)
		end

		storeHouseUI.showCompoundEffect("res/ui/equip/storeHouse/suit_synth_succ.png", var_0_0.storageGetItems)
	end
end

function var_0_0.equipDemountSuit(arg_21_0)
	cmgr.sendRequest(var_0_0.handlerEquipDemountSuit, actions.equipDemountSuit, arg_21_0.vId)
end

function var_0_0.handlerEquipDemountSuit(arg_22_0)
	if arg_22_0.action.state == 1 then
		var_0_0.storageGetItems()
	end
end

function var_0_0.equipDemountGold(arg_23_0)
	cmgr.sendRequest(var_0_0.handlerEquipDemountGold, actions.equipDemountGold, arg_23_0.vId)
end

function var_0_0.handlerEquipDemountGold(arg_24_0)
	if arg_24_0.action.state == 1 then
		local var_24_0 = arg_24_0.action.data.gold

		messageBox.confirm(language.get(102005, var_24_0), function()
			var_0_0.equipDemountSuit(var_0_0.itemsData[storeHouseUI.currentSelectedCellIndex])
		end)
	end
end

function var_0_0.equipCompoundProset(arg_26_0)
	cmgr.sendRequest(var_0_0.handlerEquipCompoundProset, actions.equipCompoundProset, arg_26_0.vId)
end

function var_0_0.handlerEquipCompoundProset(arg_27_0)
	if arg_27_0.action.state == 1 then
		arg_27_0.action.data.vId = var_0_0.itemsData[storeHouseUI.currentSelectedCellIndex].vId

		storeHouseUI.showProsetCompoundPanel(arg_27_0.action.data)
	end
end

function var_0_0.equipDoCompoundProset(arg_28_0)
	messageBox.confirm(language.get(102004), function()
		cmgr.sendRequest(var_0_0.handlerEquipDoCompoundProset, actions.equipDoCompoundProset, arg_28_0.vId)
	end)
end

function var_0_0.handlerEquipDoCompoundProset(arg_30_0)
	if arg_30_0.action.state == 1 then
		if storeHouseUI.prosetCompoundMask then
			pcall(storeHouseUI.prosetCompoundMask.removeFromParentAndCleanup, storeHouseUI.prosetCompoundMask, true)
		end

		storeHouseUI.showCompoundEffect("res/ui/equip/storeHouse/suit_inoscu_succ.png", var_0_0.storageGetItems)
	end
end

function var_0_0.equipDemountProset(arg_31_0)
	cmgr.sendRequest(var_0_0.handlerEquipDemountProset, actions.equipDemountProset, arg_31_0.vId)
end

function var_0_0.handlerEquipDemountProset(arg_32_0)
	if arg_32_0.action.state == 1 then
		var_0_0.storageGetItems()
	end
end

function var_0_0.equipDemountProsetGold(arg_33_0)
	cmgr.sendRequest(var_0_0.handlerEquipDemountProsetGold, actions.equipDemountProsetGold, arg_33_0.vId)
end

function var_0_0.handlerEquipDemountProsetGold(arg_34_0)
	if arg_34_0.action.state == 1 then
		local var_34_0 = arg_34_0.action.data.gold

		messageBox.confirm(language.get(102005, var_34_0), function()
			var_0_0.equipDemountProset(var_0_0.itemsData[storeHouseUI.currentSelectedCellIndex])
		end)
	end
end

function var_0_0.equipUseResourceToken(arg_36_0)
	local var_36_0 = {
		"depot_edi_silver",
		"depot_edi_wood",
		"depot_edi_food",
		"depot_edi_iron",
		"depot_edi_troop"
	}

	local function var_36_1(arg_37_0)
		if arg_37_0.action.state == 1 then
			local var_37_0 = string.format("res/ui/equip/storeHouse/%s.png", var_36_0[arg_36_0.effectType])
			local var_37_1 = CCSprite:create(var_37_0)

			storeHouseUI.showTextureTextWithSprite(var_37_1)
			var_0_0.storageGetItems()
			eventManager.dispatchEvent("refreshResourceAreaLayer")
		end
	end

	cmgr.sendRequest(var_36_1, actions.equipUseResourceToken, arg_36_0.vId)
end

function var_0_0.useIronRewardToken(arg_38_0)
	local var_38_0 = {
		[119] = 10033
	}

	local function var_38_1(arg_39_0)
		local var_39_0 = arg_39_0.action.data
		local var_39_1 = {}

		for iter_39_0, iter_39_1 in pairs(var_39_0.rewards) do
			local var_39_2 = {
				id = var_38_0[iter_39_1.type],
				value = iter_39_1.num
			}

			table.insert(var_39_1, var_39_2)
		end

		globalAction_gotResource(var_39_1)
		var_0_0.storageGetItems()
	end

	cmgr.sendRequest(var_38_1, actions.useIronRewardToken, arg_38_0.vId)
end

function var_0_0.useFeatToken()
	local function var_40_0(arg_41_0)
		smgr.showTipTextGreen(language.get(102059))
		var_0_0.storageGetItems()
	end

	cmgr.sendRequest(var_40_0, actions.equipUseFeatToken)
end

function var_0_0.useFeatResetToken()
	local function var_42_0(arg_43_0)
		smgr.showTipTextGreen(language.get(102059))
		var_0_0.storageGetItems()
	end

	cmgr.sendRequest(var_42_0, actions.useFeatResetToken)
end

function var_0_0.useLianBingFu(arg_44_0)
	local function var_44_0(arg_45_0)
		var_0_0.storageGetItems()
	end

	cmgr.sendRequest(var_44_0, actions.useLianBingFu, arg_44_0.vId)
end

function var_0_0.scoutMeteor()
	local function var_46_0(arg_47_0)
		local var_47_0 = arg_47_0.action.data
		local var_47_1 = {}
		local var_47_2 = {}

		var_47_2.id = 216
		var_47_2.value = var_47_0.mNum

		table.insert(var_47_1, var_47_2)
		globalAction_gotResource(var_47_1)
		var_0_0.storageGetItems()
	end

	cmgr.sendRequest(var_46_0, actions.scoutMeteor)
end

function var_0_0.onEnter()
	eventManager.registerEvent("quenchingOrderReady", storeHouseUI.updateQuenchingEquip)
	eventManager.registerEvent("refreshSpecialWindow", var_0_0.storageGetItems)
	eventManager.registerEvent("refreshStoreHouse", var_0_0.storageGetItems)
end

function var_0_0.onExit()
	eventManager.unregisterEvent("quenchingOrderReady", storeHouseUI.updateQuenchingEquip)
	eventManager.unregisterEvent("refreshSpecialWindow", var_0_0.storageGetItems)
	eventManager.unregisterEvent("refreshStoreHouse", var_0_0.storageGetItems)

	if storeHouseUI.scrollView then
		pcall(storeHouseUI.scrollView.removeFromParentAndCleanup, storeHouseUI.scrollView, true)

		storeHouseUI.scrollView = nil
	end

	storeHouseUI.generals = nil
	storeHouseUI.currentSelectedCellIndex = nil
	storeHouseUI.cells = {}
	storeHouseUI.isBuyBack = false
	var_0_0.itemsData = {}

	if storeHouseUI.timer then
		pcall(storeHouseUI.timer.removeFromParentAndCleanup, storeHouseUI.timer, true)
	end
end
