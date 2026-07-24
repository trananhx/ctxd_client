equipmentQuenchingControl = {}

local var_0_0 = equipmentQuenchingControl
local var_0_1 = false

var_0_0.items = {}
var_0_0.itemsData = {}
var_0_0.blocksData = {}
var_0_0.freeTimes = 0
var_0_0.freeNiubiTimes = 0

local var_0_2 = 0
local var_0_3 = 0

local function var_0_4(arg_1_0, arg_1_1)
	if equipmentQuenchingUI.uiTable.quenchingRewardIcon and tool.checkIfTouch(equipmentQuenchingUI.uiTable.quenchingRewardIcon, arg_1_0, arg_1_1) then
		log.info("should get reward !!!!!")

		local function var_1_0(arg_2_0)
			var_0_0.leftNum = 0

			equipmentQuenchingUI.shakeQuenchingIcon(false)

			var_0_0.freeNiubiTimes = arg_2_0.action.data.num + var_0_0.freeNiubiTimes

			equipmentQuenchingUI.updateActivityProgressPanel()
		end

		cmgr.sendRequest(var_1_0, actions.getQuenchingActivityReward)
	else
		log.info("should show tips !!!!")
	end

	if equipmentQuenchingUI.uiTable["quenchingBlock" .. 1] and tool.checkIfTouch(equipmentQuenchingUI.scrollLayer, arg_1_0, arg_1_1) then
		for iter_1_0 = 1, #var_0_0.itemsData do
			log.debug("check if touch at: index ", iter_1_0)

			if equipmentQuenchingUI.uiTable["quenchingHighlightCell" .. iter_1_0] then
				equipmentQuenchingUI.uiTable["quenchingHighlightCell" .. iter_1_0]:setVisible(false)

				if tool.checkIfTouch(equipmentQuenchingUI.uiTable["quenchingCell" .. iter_1_0], arg_1_0, arg_1_1) then
					log.debug("cell " .. iter_1_0 .. "touched and visible index: ", equipmentQuenchingUI.currentSelectedCellIndex)
					equipmentQuenchingUI.uiTable["quenchingHighlightCell" .. iter_1_0]:setVisible(true)

					if equipmentQuenchingUI.currentSelectedCellIndex == iter_1_0 then
						-- block empty
					else
						equipmentQuenchingUI.currentSelectedCellIndex = iter_1_0

						equipmentQuenchingUI.updateLeftPanel(iter_1_0)
					end
				end
			end
		end
	end

	if equipmentQuenchingUI.canSuitData and equipmentQuenchingUI.canSuitData and #equipmentQuenchingUI.canSuitData > 0 and equipmentQuenchingUI.uiTable.equipmentPic and tool.checkIfTouch(equipmentQuenchingUI.uiTable.equipmentPic, arg_1_0, arg_1_1) then
		equipmentQuenchingUI.showCanSuitTip(equipmentQuenchingUI.canSuitData)
	end

	if tool.checkIfTouch(equipmentQuenchingUI.uiTable.kaiguangButton, arg_1_0, arg_1_1) and equipmentQuenchingUI.uiTable.kaiguangButton:isVisible() then
		log.info("kaiguang")
		equipmentControl.onKaiguangLabelClick()
	end
end

function var_0_0.onTouch(arg_3_0, arg_3_1, arg_3_2)
	log.info("touched  at " .. arg_3_1 .. ", " .. arg_3_2)

	if arg_3_0 == CCTOUCHBEGAN then
		var_0_3 = arg_3_2

		return true
	elseif arg_3_0 == CCTOUCHMOVED then
		var_0_1 = true

		return true
	elseif arg_3_0 == CCTOUCHENDED then
		log.debug("touched end , moved distance :", math.abs(arg_3_2 - var_0_3))

		if not var_0_1 or math.abs(arg_3_2 - var_0_3) < 20 then
			var_0_4(arg_3_1, arg_3_2)
		end

		var_0_1 = false

		return true
	end
end

function var_0_0.onAutoBuyBtnTouched()
	local var_4_0 = equipmentQuenchingUI.uiTable.checkedBtn:isVisible()
	local var_4_1 = 1

	if var_4_0 then
		var_4_1 = 0
	end

	cmgr.sendRequest(function(...)
		if var_4_0 then
			user.chargeItems.quenchingGold.noDisturb = nil
		else
			user.chargeItems.quenchingGold.noDisturb = true
		end

		equipmentQuenchingUI.uiTable.checkedBtn:setVisible(not var_4_0)
	end, actions.noDisturb, var_4_1, "quenchingGold")
end

function handlerQuenchingGetEquipsAction(arg_6_0)
	if arg_6_0.action.state == 1 then
		if var_0_0.isPerformAction then
			var_0_0.isPerformAction = false

			log.info("@@@ is restore special id :", var_0_0.lastUpdateItemId)

			for iter_6_0, iter_6_1 in pairs(arg_6_0.action.data.equips) do
				if iter_6_1.id == var_0_0.lastUpdateItemId then
					log.info("@@@ is restore special, ", var_0_2, iter_6_1.id)

					var_0_0.itemsData[var_0_2] = iter_6_1
				end
			end
		else
			var_0_0.itemsData = arg_6_0.action.data.equips
		end

		if #var_0_0.itemsData == 0 then
			equipmentQuenchingUI.setEmptyView()

			return
		end

		var_0_0.blocksData = {}

		for iter_6_2 = 1, math.ceil(#var_0_0.itemsData / 2) do
			local var_6_0, var_6_1 = equipmentQuenchingUI.getBlockIndexRangeByPage(iter_6_2, var_0_0.itemsData)
			local var_6_2 = {}

			for iter_6_3 = var_6_0, var_6_1 do
				var_6_2[#var_6_2 + 1] = var_0_0.itemsData[iter_6_3]
			end

			var_0_0.blocksData[iter_6_2] = var_6_2
		end

		log.info(var_0_2, equipmentQuenchingUI.scrollView, equipmentQuenchingUI.uiTable["quenchingBlock" .. 1])

		if var_0_2 == 0 or equipmentQuenchingUI.scrollView == nil or equipmentQuenchingUI.uiTable["quenchingBlock" .. 1] == nil then
			log.info("shold update total list")

			equipmentQuenchingUI.currentSelectedCellIndex = 1
			var_0_2 = 1

			equipmentQuenchingUI.createItemListWithItems(var_0_0.itemsData)
			equipmentQuenchingUI.uiTable["quenchingHighlightCell" .. 1]:setVisible(true)

			var_0_0.leftPanelData = var_0_0.itemsData[1]

			equipmentQuenchingUI.updateLeftPanel(1, var_0_0.leftPanelData)
		else
			log.info("should update one cell", var_0_2)
			equipmentQuenchingUI.updateBlocksAtIndex(var_0_2)
		end
	end
end

function handlerQuenchingOpenQuenchingAction(arg_7_0)
	if arg_7_0.action.state == 1 then
		var_0_0.leftPanelData = arg_7_0.action.data
		var_0_0.freeTimes = arg_7_0.action.data.freeTimes
		var_0_0.freeNiubiTimes = arg_7_0.action.data.freeNiubiTimes
		var_0_0.totalPoint = arg_7_0.action.data.point
		var_0_0.currentNum = arg_7_0.action.data.currentNum
		var_0_0.leftNum = arg_7_0.action.data.leftNum

		log.debug("should update left panel, freeTimes:", arg_7_0.action.data.freeTimes)

		equipmentQuenchingUI.currentSelectedCellIndex = 1

		equipmentQuenchingUI.updateLeftPanel(0, var_0_0.leftPanelData)
	end
end

function var_0_0.quenchingOpenQuenching()
	cmgr.sendRequest(handlerQuenchingOpenQuenchingAction, actions.quenchingOpenQuenching, 0)
end

function var_0_0.quenchingGetEquips()
	cmgr.sendRequest(handlerQuenchingGetEquipsAction, actions.quenchingGetEquips)
end

function handlerQuenchingRestoreSpecialAction(arg_10_0)
	if arg_10_0.action.state == 1 then
		var_0_0.isPerformAction = true

		var_0_0.quenchingGetEquips()
	end
end

function handlerGetRestoreInfoAction(arg_11_0)
	if arg_11_0.action.state == 1 then
		equipmentQuenchingUI.showRestoreTip(arg_11_0.action.data)
	end
end

function var_0_0.getRestoreInfo()
	if #var_0_0.itemsData == 0 then
		return
	end

	var_0_2 = equipmentQuenchingUI.currentSelectedCellIndex

	cmgr.sendRequest(handlerGetRestoreInfoAction, actions.quenchingGetRestoreInfo, var_0_0.itemsData[equipmentQuenchingUI.currentSelectedCellIndex].id)
end

function var_0_0.quenchingRestoreSpecial()
	if #var_0_0.itemsData == 0 then
		return
	end

	var_0_2 = equipmentQuenchingUI.currentSelectedCellIndex

	cmgr.sendRequest(handlerQuenchingRestoreSpecialAction, actions.quenchingRestoreSpecial, var_0_0.itemsData[equipmentQuenchingUI.currentSelectedCellIndex].id)

	var_0_0.lastUpdateItemId = var_0_0.itemsData[equipmentQuenchingUI.currentSelectedCellIndex].id
end

function var_0_0.quenchingEquipment(arg_14_0, arg_14_1)
	local function var_14_0(arg_15_0)
		if arg_15_0.action.state == 1 then
			user.welfare.setWelfare("freeQuechingTimes", arg_15_0.action.data.freeTimes)

			if arg_15_0.action.data.xiLianActivityExtEffect then
				local var_15_0 = "res/ui/equip/quenching/acti_text_hdshjxl.png"

				if arg_15_0.action.data.xiLianActivityExtEffect == 1 then
					log.info(" show get cool stuffs !!!!!")

					var_15_0 = "res/ui/equip/quenching/acti_text_hdshjxl.png"
				elseif arg_15_0.action.data.xiLianActivityExtEffect == 2 then
					log.info(" show get cool stuffs   2 !!!!!")

					var_15_0 = "res/ui/equip/quenching/acti_text_hdmjxl.png"
				elseif arg_15_0.action.data.xiLianActivityExtEffect == 3 then
					log.info(" show get cool stuffs   3 !!!!!")

					var_15_0 = "res/ui/equip/quenching/acti_text_hdsjxl.png"
				end

				local var_15_1 = CCSprite:create(var_15_0)
				local var_15_2 = visibleSize.width * 0.5
				local var_15_3 = visibleSize.height * 0.5

				var_15_1:setPosition(ccp(var_15_2, var_15_3 - 50))
				smgr.showTipSpriteText(var_15_1)
			end

			var_0_0.totalPoint = arg_15_0.action.data.point
			var_0_0.currentNum = arg_15_0.action.data.currentNum
			var_0_0.leftNum = arg_15_0.action.data.leftNum

			if var_0_0.leftNum then
				if var_0_0.leftNum > 0 then
					equipmentQuenchingUI.shakeQuenchingIcon(true)
				else
					equipmentQuenchingUI.shakeQuenchingIcon(false)
				end
			end

			var_0_0.itemsData[arg_14_1].refreshAttribute = arg_15_0.action.data.refreshAttribute
			var_0_0.itemsData[arg_14_1].maxSkillNum = arg_15_0.action.data.maxSkillNum

			local var_15_4 = math.ceil(arg_14_1 / 2)
			local var_15_5, var_15_6 = equipmentQuenchingUI.getBlockIndexRangeByPage(var_15_4, var_0_0.itemsData)
			local var_15_7 = {}

			for iter_15_0 = var_15_5, var_15_6 do
				var_15_7[#var_15_7 + 1] = var_0_0.itemsData[iter_15_0]
			end

			var_0_0.blocksData[var_15_4] = var_15_7
			var_0_0.freeTimes = arg_15_0.action.data.freeTimes

			if var_0_0.freeNiubiTimes < arg_15_0.action.data.freeNiubiTimes then
				equipmentQuenchingUI.showNiubiTimesAddEffect()
			end

			var_0_0.freeNiubiTimes = arg_15_0.action.data.freeNiubiTimes

			local function var_15_8()
				var_0_0.isPerformAction = true
				var_0_0.lastUpdateItemId = var_0_0.itemsData[arg_14_1].id
				var_0_2 = arg_14_1

				equipmentQuenchingUI.showExplodeEffect(var_0_0.quenchingGetEquips)
				equipmentQuenchingUI.updateLeftPanel(equipmentQuenchingUI.currentSelectedCellIndex)
				equipmentQuenchingUI.updateActivityProgressPanel()
			end

			equipmentQuenchingUI.showFireEffect(var_15_8)
		end
	end

	local function var_14_1(arg_17_0)
		cmgr.sendRequest(var_14_0, actions.quenchingEquip, var_0_0.itemsData[arg_14_1].id, arg_17_0)
	end

	if #var_0_0.itemsData == 0 then
		return
	end

	local var_14_2 = var_0_0.itemsData[arg_14_1]

	if #var_14_2.refreshAttribute == 4 or var_14_2.quality == 5 and #var_14_2.refreshAttribute == 3 then
		local var_14_3 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_14_3:setTouchEnabled(true)
		var_14_3:registerScriptTouchHandler(function(arg_18_0, arg_18_1, arg_18_2)
			if arg_18_0 == CCTOUCHBEGAN then
				return true
			elseif arg_18_0 == CCTOUCHMOVED then
				return true
			elseif arg_18_0 == CCTOUCHENDED then
				return true
			end
		end, false, true)

		local var_14_4 = messageBox.createMessageBox(language.get(10003), language.get(103001), {
			{
				text = language.get(10001),
				callBack = function()
					var_14_3:removeAllChildrenWithCleanup(true)
					var_14_3:removeFromParentAndCleanup(true)
					log.debug("user.chargeItems.quenchingGold.noDisturb :", user.chargeItems.quenchingGold.noDisturb)

					if arg_14_0 == 1 and not user.chargeItems.quenchingGold.noDisturb and var_0_0.freeNiubiTimes < 1 then
						messageBox.showChargeWin(language.get(10003), language.get(103002), "quenchingGold", function()
							var_14_1(arg_14_0)
						end)
					else
						var_14_1(arg_14_0)
					end
				end
			},
			{
				text = language.get(10002),
				callBack = function()
					var_14_3:removeAllChildrenWithCleanup(true)
					var_14_3:removeFromParentAndCleanup(true)
				end
			}
		})

		var_14_3:addChild(var_14_4)
		smgr.rootLayer:addChild(var_14_3, 60000)
	else
		log.debug("user.chargeItems.quenchingGold.noDisturb :", user.chargeItems.quenchingGold.noDisturb)

		if arg_14_0 == 1 and not user.chargeItems.quenchingGold.noDisturb and var_0_0.freeNiubiTimes < 1 then
			messageBox.showChargeWin(language.get(10003), language.get(103002), "quenchingGold", function()
				var_14_1(arg_14_0)
			end)
		else
			var_14_1(arg_14_0)
		end
	end
end

function var_0_0.onEnter()
	var_0_2 = 0

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end
end

function var_0_0.onExit()
	var_0_0.itemsData = nil
	var_0_0.blocksData = nil
	var_0_0.scrollLayer = nil
	var_0_0.scrollView = nil
	lastScrollViewOffset = nil

	log.info("control exit and updateSchedulerEntry:", var_0_0.updateSchedulerEntry)

	if var_0_0.updateSchedulerEntry then
		log.info("should rmove updateSchedulerEntry", var_0_0.updateSchedulerEntry)
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end
end
