require("lua/common/tool")
require("lua/component/messageBox")

local var_0_0 = {}
local var_0_1 = true
local var_0_2 = 0

function var_0_0.initControl(arg_1_0)
	return
end

function handlerStoreBuyItemAction(arg_2_0)
	if arg_2_0.action.state == 1 then
		var_0_0.storeGetItems()
	end
end

function handlerStoreCdRecoverConfirmAction(arg_3_0)
	if arg_3_0.action.state == 1 then
		log.debug("recover successed , get items")
		var_0_0.storeGetItems()
		storeUI.cdTimeLabel:setTime(1)
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
		var_0_0.items = arg_5_0.action.data.items

		var_0_0.list.updateList(var_0_0.items)
	end
end

function buyEquip(arg_6_0)
	log.info("event come!!!")
	var_0_0.storeBuyItem(arg_6_0.data.itemId)
	var_0_0.list:removeEventListener("buyEquip", buyEquip)
end

function clickEquipPicHandler(arg_7_0)
	log.info("event come!!!!!!", arg_7_0.data.name)

	local var_7_0 = {}

	uiutil.initUI(var_7_0, var_0_0.view.config.equipmentTipFrame)
	var_7_0.equipmentTipFrame:setTouchEnabled(true)
	var_7_0.equipmentTipFrame:registerScriptTouchHandler(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			return true
		elseif arg_8_0 == CCTOUCHMOVED then
			return true
		elseif arg_8_0 == CCTOUCHENDED then
			log.info("clear mask")
			var_7_0.equipmentTipFrame:removeFromParentAndCleanup(true)
			arg_7_0.item.equipHightlight:setVisible(false)

			return true
		end
	end, false, true)

	local var_7_1 = 0

	if arg_7_0.data.refreshAttribute then
		var_7_1 = #arg_7_0.data.refreshAttribute
	end

	function var_7_0.equipmentTipFrame.maskRenderHandler(arg_9_0)
		if arg_9_0.name == "TipEquipmentName" then
			arg_9_0.text = arg_7_0.data.name
			arg_9_0.color = storeConstant.equipmentQualityColor[arg_7_0.data.quality]
		elseif arg_9_0.name == "TipEquipmentEffect" then
			if arg_7_0.data.blood then
				arg_9_0.text = "带兵上限+" .. arg_7_0.data.blood .. " 兵力/方阵"
			end

			if arg_7_0.data.def then
				arg_9_0.text = "防御+" .. arg_7_0.data.def
			end

			if arg_7_0.data.att then
				arg_9_0.text = "攻击+" .. arg_7_0.data.att
			end
		elseif arg_9_0.name == "TipEquipmentMaxLv" then
			arg_9_0.text = "洗炼上限: Lv." .. arg_7_0.data.maxLv
		elseif arg_9_0.name == "TipEquipmentPrice" then
			arg_9_0.text = "出售价格: " .. arg_7_0.data.copper .. " 银币"
		elseif arg_9_0.name == "maskSprite" then
			local var_9_0, var_9_1 = arg_7_0.item.equipItem:getPosition()

			if arg_7_0.item.index < 3 then
				arg_9_0.x = var_9_0 + 123
				arg_9_0.y = var_9_1 + 310
				arg_9_0.anchorPoint = {
					x = 0,
					y = 1
				}
			else
				arg_9_0.x = var_9_0 - 13
				arg_9_0.y = var_9_1 + 310
				arg_9_0.anchorPoint = {
					x = 1,
					y = 1
				}
			end

			arg_9_0.preferedSize = CCSizeMake(288 + var_7_1 * 35, 219)
		end
	end

	uiutil.initUI(var_7_0.equipmentTipFrame, var_0_0.view.config.equipmentTipFrame.itemRender, true)

	local var_7_2 = {}
	local var_7_3 = arg_7_0.data.maxSkillNum

	for iter_7_0 = 1, var_7_3 do
		table.insert(var_7_2, {
			solidStarNum = var_7_3
		})
	end

	local var_7_4 = require("lua/layer/equipment/store/sample/EquipStarRender")

	require("lua/common/List").new(var_7_2, var_7_4).renderList(var_7_0.equipmentTipFrame, var_0_0.view.config.starList)

	local var_7_5 = require("lua/layer/equipment/store/sample/EquipAttributeRender")

	require("lua/common/List").new(arg_7_0.data.refreshAttribute, var_7_5).renderList(var_7_0.equipmentTipFrame, var_0_0.view.config.attributeList)
	arg_7_0.item.equipHightlight:setVisible(true)
	smgr.rootLayer:addChild(var_7_0.equipmentTipFrame, 60000)
end

function handlerStoreGetItemsAction(arg_10_0)
	log.debug("updateEquipmentStorePage")

	if arg_10_0.action.state == 1 then
		var_0_2 = arg_10_0.action.data.needTips
		var_0_0.items = arg_10_0.action.data.items

		if var_0_0.list ~= nil then
			var_0_0.list.clear()

			var_0_0.list = nil
		end

		local var_10_0 = require("lua/layer/equipment/store/sample/EquipListRender")
		local var_10_1 = require("lua/common/List").new(var_0_0.items, var_10_0)

		var_10_1.renderList(var_0_0.view, var_0_0.view.config.equipmentList)
		var_10_1:addEventListener("buyEquip", buyEquip)
		var_10_1:addEventListener("clickEquipPic", clickEquipPicHandler)

		var_0_0.list = var_10_1
	end
end

function var_0_0.storeGetItems()
	log.debug("getItems")
	cmgr.sendRequest(handlerStoreGetItemsAction, actions.storeGetItems, 1)
end

function var_0_0.storeBuyItem(arg_12_0)
	cmgr.sendRequest(handlerStoreBuyItemAction, actions.storeBuyItem, arg_12_0)
end

function var_0_0.storeRefreshItem()
	cmgr.sendRequest(handlerStoreRefreshItemAction, actions.storeRefreshItem, 1)
end

return var_0_0
