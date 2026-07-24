tool.requireRes("equipment/store")
require("lua/component/timerLabel")
require("lua/common/tool")
require("lua/layer/equipment/equipmentTipFrame")

storeUI = {}
storeUI.uiTable = {}

local var_0_0 = storeUI
local var_0_1 = storeControl
local var_0_2 = storeConstant
local var_0_3 = true

storeUI.cdTimeLabel = {}

local var_0_4

local function var_0_5()
	local var_1_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_1_0:registerScriptTouchHandler(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN then
			return true
		elseif arg_2_0 == CCTOUCHMOVED then
			return true
		elseif arg_2_0 == CCTOUCHENDED then
			var_1_0:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_1_0:setTouchEnabled(true)
	log.info("user.player.playerLv : ", user.player.playerLv)
	autoUI.createUI(var_1_0, getStoreTipFrameDataByLevel(user.player.playerLv), {})
	smgr.rootLayer:addChild(var_1_0, 60000)
end

function storeUI.show()
	rmgr.loadTable(storeConstant.RES)

	local var_3_0 = createBaseLayer()

	smgr.registerLayer(var_3_0, "storeLayer")

	if storeUI.uiTable then
		storeUI.uiTable = nil
	end

	storeUI.uiTable = autoUI.initUI(var_3_0, getStoreData())

	var_0_1.initControl(var_3_0)
	storeUI.uiTable.tipItem:registerScriptTapHandler(var_0_5)
	storeUI.uiTable.equipmentRefreshItem:registerScriptTapHandler(onRefreshButtonTap)
	var_0_1.storeGetItems()

	storeUI.cdTimeLabel = createTimerLabel(0, "CD:  @M:@S", "Thonburi-Bold", 20, changeRefreshButtonTextBack, nil)

	storeUI.uiTable.intimacyBackground:addChild(storeUI.cdTimeLabel)
	storeUI.cdTimeLabel:setPosition(ccp(426, 80))

	var_3_0.onEnter = var_0_1.onEnter
	var_3_0.onExit = var_0_1.onExit

	var_3_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_3_0:setTouchEnabled(true)
	log.debug("return layer")
	require("lua/guide/control")

	guide.uiElementsTable[1009] = storeUI.uiTable.equipmentRefreshItem

	return var_3_0
end

local function var_0_6(arg_4_0, arg_4_1)
	local var_4_0 = storeUI.uiTable["equipment" .. arg_4_0]

	var_4_0:removeChildByTag(1234, true)

	if arg_4_1 and arg_4_1 == true then
		local var_4_1 = CCSprite:create("res/ui/equip/store/sd_tit_jp.png")

		var_4_1:setPosition(ccp(75, 213))
		var_4_0:addChild(var_4_1, 800, 1234)
	end
end

local function var_0_7(arg_5_0, arg_5_1)
	local var_5_0 = storeUI.uiTable["equipment" .. arg_5_1]
	local var_5_1 = 0

	log.debug("star label : ", var_5_0.starLabel, "at", arg_5_1)

	if var_5_0.starLabel then
		pcall(var_5_0.starLabel.removeFromParentAndCleanup, var_5_0.starLabel, true)
	end

	if var_0_1.items then
		if var_0_1.items[arg_5_1].refreshAttribute then
			log.debug(var_0_1.items[arg_5_1].refreshAttribute[1])

			var_5_1 = #var_0_1.items[arg_5_1].refreshAttribute
		end

		local var_5_2 = var_0_0.createEquipmentStarLabel(var_5_1, var_0_1.items[arg_5_1].maxSkillNum)

		var_5_2:setPosition(arg_5_0)
		var_5_0:addChild(var_5_2)

		var_5_0.starLabel = var_5_2
	else
		log.debug("nil items : ", items)
	end

	if var_0_1.items[arg_5_1].quality == 6 and var_5_1 == 3 then
		var_0_6(arg_5_1, true)
	else
		var_0_6(arg_5_1, false)
	end
end

local function var_0_8(arg_6_0)
	local var_6_0 = CCScale9Sprite:create(CCRectMake(0, 57, 135, 288), "res/ui/equip/store/equipmentStore-tips-zhuangbei.png")
	local var_6_1 = 34 * (arg_6_0 + 1)

	var_6_0:setPreferredSize(CCSizeMake(288, var_6_1 + 179))

	return var_6_0
end

function updateEquipmentsStoreListData(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0

	if var_7_0.type ~= 0 then
		var_0_7(ccp(15, 110), arg_7_1)
	end

	storeUI.uiTable["equipmentName" .. arg_7_1]:setString(var_7_0.name)
	storeUI.uiTable["equipmentName" .. arg_7_1]:setColor(colorQuality[var_7_0.quality or 1])
	storeUI.uiTable["equimentFrame" .. arg_7_1]:setDisplayFrame(CCSprite:create(picQualityFrame[var_7_0.quality or 1]):displayFrame())
	storeUI.uiTable["equimentPriceLabel" .. arg_7_1]:setString(var_7_0.price)

	local var_7_1 = ""

	if var_7_0.rewardNum then
		var_7_1 = language.get(213401, var_7_0.rewardNum)
	else
		var_7_1 = ""
	end

	storeUI.uiTable["equimentNumLabel" .. arg_7_1]:setString(var_7_1)

	if var_7_0.itemType and (var_7_0.itemType == "forge_hammer_2" or var_7_0.itemType == "accel_hammer") then
		local var_7_2 = language.get(213402)

		storeUI.uiTable["equimentNumLabel" .. arg_7_1]:setString(var_7_2)
	end

	storeUI.uiTable["silverPic" .. arg_7_1]:setVisible(true)

	if var_7_0.isGold and var_7_0.isGold == 1 then
		storeUI.uiTable["silverPic" .. arg_7_1]:setDisplayFrame(tool.spriteFrameByName("res_icon_19_small.png"))
	else
		storeUI.uiTable["silverPic" .. arg_7_1]:setDisplayFrame(tool.spriteFrameByName("res_icon_1_small.png"))
	end

	if var_7_0.silkOutPut and var_7_0.silkOutPut > 0 then
		storeUI.uiTable["silkPic" .. arg_7_1]:setVisible(true)
		storeUI.uiTable["silkOutputLabel" .. arg_7_1]:setString(language.get("122106_silk_qym", var_7_0.silkOutPut))
		storeUI.uiTable["silkOutputLabel" .. arg_7_1]:setVisible(true)
	else
		storeUI.uiTable["silkPic" .. arg_7_1]:setVisible(false)
		storeUI.uiTable["silkOutputLabel" .. arg_7_1]:setVisible(false)
	end

	storeUI.uiTable["equimentPriceLabel" .. arg_7_1]:setVisible(true)
	storeUI.uiTable["eqpuipmentBuyButton" .. arg_7_1]:setVisible(true)
	storeUI.uiTable["equipmentBuyLabel" .. arg_7_1]:setVisible(true)
	storeUI.uiTable["equipmentButton" .. arg_7_1]:setNormalImage(CCSprite:createWithSpriteFrameName(var_7_0.pic .. ".jpg"))
	storeUI.uiTable["equipmentButton" .. arg_7_1]:setSelectedImage(CCSprite:createWithSpriteFrameName(var_7_0.pic .. ".jpg"))
	storeUI.uiTable["curItemNum" .. arg_7_1]:setString((not var_7_0.curItemNum and "" or var_7_0.curItemNum .. "/") .. (var_7_0.maxGeneralNum or ""))

	local var_7_3 = var_7_0.notice or false

	storeUI.uiTable["noticePic" .. arg_7_1]:setVisible(var_7_3)

	if storeUI.uiTable["itemBoughtPic" .. arg_7_1] then
		local var_7_4 = storeUI.uiTable["itemBoughtPic" .. arg_7_1]

		pcall(var_7_4.removeFromParentAndCleanup, var_7_4, true)
	end
end

function updateEquipmentsStoreList(arg_8_0, arg_8_1)
	local var_8_0 = storeUI.uiTable.equipStoreMenu

	if arg_8_1 then
		log.info("equipmentListItems:", #arg_8_0)

		for iter_8_0 = 1, #arg_8_0 do
			local var_8_1 = storeUI.uiTable["equipment" .. iter_8_0]

			showTable(var_8_1)

			if var_8_1 == nil then
				autoUI.updateListDataWithListUiData(var_0_0.uiTable, "equipmentList", getStoreData().equipmentList, iter_8_0, arg_8_0[iter_8_0])
			end

			local var_8_2 = storeUI.uiTable["equipment" .. iter_8_0]
			local var_8_3 = CCArray:create()

			CCDirector:sharedDirector():setProjection(kCCDirectorProjection2D)

			local var_8_4 = CCOrbitCamera:create(0.3, 1, 0, 0, 90, 0, 0)
			local var_8_5 = CCCallFuncN:create(function()
				updateEquipmentsStoreListData(arg_8_0[iter_8_0], iter_8_0)
			end)

			var_8_3:addObject(var_8_4)
			var_8_3:addObject(var_8_5)
			var_8_3:addObject(var_8_4:reverse())
			var_8_2:runAction(CCSequence:create(var_8_3))
		end
	else
		if var_0_0.equipmentListlayer then
			pcall(var_0_0.equipmentListlayer.removeFromParentAndCleanup, var_0_0.equipmentListlayer, true)
		end

		var_0_0.equipmentListlayer = autoUI.renderList(storeUI.uiTable, getStoreData().equipmentList, arg_8_0)

		var_8_0:addChild(var_0_0.equipmentListlayer)

		for iter_8_1 = 1, #arg_8_0 do
			if arg_8_0[iter_8_1].type ~= 0 then
				var_0_7(ccp(15, 110), iter_8_1)
			end

			if arg_8_0[iter_8_1].isGold and arg_8_0[iter_8_1].isGold == 1 then
				storeUI.uiTable["silverPic" .. iter_8_1]:setDisplayFrame(tool.spriteFrameByName("res_icon_19_small.png"))
			else
				storeUI.uiTable["silverPic" .. iter_8_1]:setDisplayFrame(tool.spriteFrameByName("res_icon_1_small.png"))
			end

			if arg_8_0[iter_8_1].silkOutPut and arg_8_0[iter_8_1].silkOutPut > 0 then
				storeUI.uiTable["silkPic" .. iter_8_1]:setVisible(true)
				storeUI.uiTable["silkOutputLabel" .. iter_8_1]:setString(language.get("122106_silk_qym", arg_8_0[iter_8_1].silkOutPut))
				storeUI.uiTable["silkOutputLabel" .. iter_8_1]:setVisible(true)
			else
				storeUI.uiTable["silkPic" .. iter_8_1]:setVisible(false)
				storeUI.uiTable["silkOutputLabel" .. iter_8_1]:setVisible(false)
			end
		end
	end
end

function var_0_0.gotoSpecialCity()
	if user.getFunc(10) then
		var_0_0.uiTable.gotoSpecialCity:setEnabled(true)

		local var_10_0 = smgr.getLayer("equipmentTabLayer")

		smgr.getLayer("topLayer"):removeChild(var_10_0, true)
		loadingLayer.show(SCENE_WORLD, var_0_1.specialCities[1].cityId)
	else
		var_0_0.uiTable.gotoSpecialCity:setEnabled(false)
	end
end

function updateEquipmentStorePage(arg_11_0, arg_11_1)
	if arg_11_0.action.state == 1 then
		var_0_1.items = arg_11_0.action.data.items
		var_0_1.specialCities = arg_11_0.action.data.specialCities
		var_0_1.intimacyLv = arg_11_0.action.data.intimacyLv
		var_0_1.curIntimacy = arg_11_0.action.data.curIntimacy
		var_0_1.maxIntimacy = arg_11_0.action.data.maxIntimacy
		var_0_1.isIntiLimit = arg_11_0.action.data.isIntiLimit
		var_0_1.cdInRedMinutes = arg_11_0.action.data.cdInRedMinutes
		var_0_1.refreshCD = arg_11_0.action.data.refreshCD

		updateEquipmentsStoreList(var_0_1.items, arg_11_1)
		require("lua/guide/control")

		if storeUI.uiTable["equipmentBuyLabel" .. 1]:isVisible() then
			guide.uiElementsTable[1023] = storeUI.uiTable["equipmentBuyLabel" .. 1]
		elseif storeUI.uiTable["equipmentBuyLabel" .. 2]:isVisible() then
			guide.uiElementsTable[1023] = storeUI.uiTable["equipmentBuyLabel" .. 2]
		elseif storeUI.uiTable["equipmentBuyLabel" .. 3]:isVisible() then
			guide.uiElementsTable[1023] = storeUI.uiTable["equipmentBuyLabel" .. 3]
		elseif storeUI.uiTable["equipmentBuyLabel" .. 4] and storeUI.uiTable["equipmentBuyLabel" .. 4]:isVisible() then
			guide.uiElementsTable[1023] = storeUI.uiTable["equipmentBuyLabel" .. 4]
		elseif storeUI.uiTable["equipmentBuyLabel" .. 5] and storeUI.uiTable["equipmentBuyLabel" .. 5]:isVisible() then
			guide.uiElementsTable[1023] = storeUI.uiTable["equipmentBuyLabel" .. 5]
		elseif storeUI.uiTable["equipmentBuyLabel" .. 6] and storeUI.uiTable["equipmentBuyLabel" .. 6]:isVisible() then
			guide.uiElementsTable[1023] = storeUI.uiTable["equipmentBuyLabel" .. 6]
		end

		if storeUI.uiTable["equipmentBuyLabel" .. 4] then
			if storeUI.uiTable["equipmentBuyLabel" .. 4]:isVisible() then
				log.info("equipmentBuyLabel ", 4)

				guide.uiElementsTable[1026] = storeUI.uiTable["equipmentBuyLabel" .. 4]
			elseif storeUI.uiTable["equipmentBuyLabel" .. 5]:isVisible() then
				log.info("equipmentBuyLabel ", 5)

				guide.uiElementsTable[1026] = storeUI.uiTable["equipmentBuyLabel" .. 5]
			elseif storeUI.uiTable["equipmentBuyLabel" .. 6]:isVisible() then
				log.info("equipmentBuyLabel ", 6)

				guide.uiElementsTable[1026] = storeUI.uiTable["equipmentBuyLabel" .. 6]
			end
		end

		if user.curMainTask and (user.curMainTask.taskId == 29 or user.curMainTask.taskId == 46) then
			for iter_11_0 = 1, 3 do
				storeUI.uiTable["eqpuipmentBuyButton" .. iter_11_0]:setVisible(false)
				storeUI.uiTable["equipmentBuyLabel" .. iter_11_0]:setVisible(false)
				storeUI.uiTable["itemBoughtPic" .. iter_11_0]:setVisible(true)
				storeUI.uiTable["silverPic" .. iter_11_0]:setVisible(false)
				storeUI.uiTable["equimentPriceLabel" .. iter_11_0]:setVisible(false)
			end
		end

		if guide.callback then
			guide.callback()
		end

		storeUI.uiTable.equipmentRefreshItem:setEnabled(user.curMainTask.taskId >= 46)
		storeUI.uiTable.intimacyProgressBar:setPercentage(var_0_1.curIntimacy / var_0_1.maxIntimacy * 100)
		storeUI.uiTable.intimacyValueLabel:setString("Lv" .. var_0_1.intimacyLv)
		storeUI.uiTable.intimacyProgressLabel:setString(var_0_1.curIntimacy .. "/" .. var_0_1.maxIntimacy .. (var_0_1.isIntiLimit and language.get(101003) or ""))
		storeUI.cdTimeLabel:setTime(var_0_1.refreshCD)
		log.debug("time set to " .. var_0_1.refreshCD)

		if var_0_1.refreshCD > var_0_1.cdInRedMinutes * 60 then
			var_0_3 = false

			storeUI.uiTable.refreshButton:setString(language.get(101004))
			storeUI.cdTimeLabel:setColor(colorTips.red)
			storeUI.cdTimeLabel:setTriggerTime(var_0_1.cdInRedMinutes * 60)
		else
			var_0_3 = true

			storeUI.cdTimeLabel:setColor(nil)
			storeUI.uiTable.refreshButton:setString(language.get(101005))
			storeUI.cdTimeLabel:setTriggerTime(0)
		end

		log.debug(var_0_1.specialCities[1])

		if var_0_1.specialCities[1].hasSpecialCity == 0 then
			storeUI.uiTable.specialCitieyNameLabel:setString(var_0_1.specialCities[1].cityName)

			if conf.language == "vie" then
				storeUI.uiTable.noSpecialCityLabel:setString(language.get("vn_101012"))
			end

			storeUI.uiTable.noSpecialCityLabel:setVisible(true)
			storeUI.uiTable.hasSpecialCityLabel:setVisible(false)
			storeUI.uiTable.cityHighlight:setVisible(false)
		else
			storeUI.uiTable.hasSpecialCityLabel:setVisible(true)
			storeUI.uiTable.noSpecialCityLabel:setVisible(false)
			storeUI.uiTable.cityHighlight:setVisible(true)
		end

		if user.getFunc(10) then
			var_0_0.uiTable.gotoSpecialCity:setEnabled(true)
		else
			var_0_0.uiTable.gotoSpecialCity:setEnabled(false)
		end

		if user.kbLv >= 1 then
			storeUI.uiTable.cityHighlight:setVisible(true)
			var_0_0.uiTable.gotoSpecialCity:setVisible(false)
			storeUI.uiTable.noSpecialCityLabel:setVisible(false)
			storeUI.uiTable.hasSpecialCityLabel:setVisible(true)
			storeUI.uiTable.hasSpecialCityLabel:setString(language.get("speicalBuffInfo1"))
			storeUI.uiTable.gotoSpecialCityLb:setString(language.get("speicalBuffInfo2"))
			storeUI.uiTable.gotoSpecialCityLb:setPositionX(270)
		end
	end
end

function onRefreshButtonTap()
	if var_0_3 then
		var_0_1.storeRefreshItem()
		log.debug(storeConstant.TAG_STORE_CITY_NORMAL)
	elseif user.chargeItems.refreshStoreCd.noDisturb then
		cmgr.sendRequest(handlerStoreCdRecoverConfirmAction, actions.storeCdRecoverConfirm, "1")
	else
		cmgr.sendRequest(handlerStoreCdRecoverAction, actions.storeCdRecover, "1")
	end
end

function storeCdRefreshChargeWindow(arg_13_0)
	if user.chargeItems.refreshStoreCd.noDisturb then
		cmgr.sendRequest(handlerStoreCdRecoverConfirmAction, actions.storeCdRecoverConfirm, "1")
	else
		messageBox.showChargeWin(language.get(10003), language.get(101006, arg_13_0), "refreshStoreCd", function()
			cmgr.sendRequest(handlerStoreCdRecoverConfirmAction, actions.storeCdRecoverConfirm, "1")
		end)
	end
end

function onEquipmentButtonTap(arg_15_0)
	if var_0_1.items[arg_15_0].type == 0 then
		return
	end

	local var_15_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_15_0:registerScriptTouchHandler(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == CCTOUCHBEGAN then
			return true
		elseif arg_16_0 == CCTOUCHMOVED then
			return true
		elseif arg_16_0 == CCTOUCHENDED then
			var_15_0:removeFromParentAndCleanup(true)
			storeUI.uiTable["equipmentHighlight" .. arg_15_0]:setVisible(false)

			return true
		end
	end, false, true)
	var_15_0:setTouchEnabled(true)
	storeUI.uiTable["equipmentHighlight" .. arg_15_0]:setVisible(true)

	local var_15_1 = 0

	if var_0_1.items[arg_15_0].refreshAttribute then
		var_15_1 = #var_0_1.items[arg_15_0].refreshAttribute
	end

	local var_15_2 = CCSizeMake(288, 219 + var_15_1 * 35)
	local var_15_3 = getEquipmentTipFrameData(var_15_2)

	if storeUI.uiTable.TipEquipmentName then
		storeUI.uiTable.TipEquipmentName = nil
	end

	autoUI.createUI(var_15_0, var_15_3, storeUI.uiTable)

	local var_15_4, var_15_5 = tool.getPositionInScreen(storeUI.uiTable["equipmentButton" .. arg_15_0])

	if arg_15_0 <= 3 then
		storeUI.uiTable.equipmentTipFrame:setAnchorPoint(ccp(0, 1))
		storeUI.uiTable.equipmentTipFrame:setPosition(ccp(var_15_4 + 70, var_15_5 + 40))
	else
		storeUI.uiTable.equipmentTipFrame:setAnchorPoint(ccp(1, 1))
		storeUI.uiTable.equipmentTipFrame:setPosition(ccp(var_15_4 - 70, var_15_5 + 40))
	end

	log.debug("button pos in screen : x" .. var_15_4 .. " y: " .. var_15_5)
	storeUI.uiTable.TipEquipmentName:setString(var_0_1.items[arg_15_0].name)

	local function var_15_6()
		if var_0_1.items[arg_15_0].blood then
			return language.get(101007, var_0_1.items[arg_15_0].blood)
		end

		if var_0_1.items[arg_15_0].def then
			return language.get(101008, var_0_1.items[arg_15_0].def)
		end

		if var_0_1.items[arg_15_0].att then
			return language.get(101009, var_0_1.items[arg_15_0].att)
		end

		return ""
	end

	storeUI.uiTable.TipEquipmentEffect:setString(var_15_6())

	if var_0_1.items[arg_15_0].tips then
		storeUI.uiTable.TipEquipmentEffect2:setString(var_0_1.items[arg_15_0].tips)
	end

	if var_0_1.items[arg_15_0].maxLv then
		storeUI.uiTable.TipEquipmentMaxLv:setString(language.get(101010, var_0_1.items[arg_15_0].maxLv))
	elseif var_0_1.items[arg_15_0].silkOutPut then
		storeUI.uiTable.TipEquipmentMaxLv:setString(language.get("122107_silk_qym", var_0_1.items[arg_15_0].silkOutPut))
	else
		storeUI.uiTable.TipEquipmentMaxLv:setString("")
	end

	if var_0_1.items[arg_15_0].copper then
		storeUI.uiTable.TipEquipmentPrice:setString(language.get(101011, var_0_1.items[arg_15_0].copper))
	else
		storeUI.uiTable.TipEquipmentPrice:setString("")
	end

	storeUI.uiTable.TipEquipmentName:setColor(colorQuality[var_0_1.items[arg_15_0].quality or 1])

	local var_15_7 = var_0_0.createEquipmentStarLabel(var_15_1, var_0_1.items[arg_15_0].maxSkillNum)

	var_15_7:setPosition(ccp(10, storeUI.uiTable.equipmentTipFrame:getContentSize().height - 110))
	storeUI.uiTable.equipmentTipFrame:addChild(var_15_7)

	local var_15_8

	if var_0_1.items[arg_15_0].refreshAttribute then
		local var_15_9 = autoUI.renderList(storeUI.uiTable, getStoreData().attributeList, var_0_1.items[arg_15_0].refreshAttribute)

		var_15_9:setPosition(ccp(0, storeUI.uiTable.equipmentTipFrame:getContentSize().height - 160))
		storeUI.uiTable.equipmentTipFrame:addChild(var_15_9)
	end

	smgr.rootLayer:addChild(var_15_0, 60000)
end

function onBuyEquipmentButtonTap(arg_18_0)
	var_0_0.isBuyPic = false

	log.debug("but button tap at index: " .. arg_18_0 .. "  itemID :" .. var_0_1.items[arg_18_0].itemId)

	if var_0_1.items[arg_18_0].type == 0 then
		var_0_0.isBuyPic = true
	end

	if var_0_1.items[arg_18_0].isGold and var_0_1.items[arg_18_0].isGold == 1 then
		messageBox.confirm(language.get("122108_silk_qym", var_0_1.items[arg_18_0].price), function()
			var_0_1.storeBuyItem(var_0_1.items[arg_18_0].itemId)
		end)
	else
		var_0_1.storeBuyItem(var_0_1.items[arg_18_0].itemId)
	end
end

function changeRefreshButtonTextBack()
	var_0_3 = true

	storeUI.cdTimeLabel:setTriggerTime(0)
	storeUI.cdTimeLabel:setColor(nil)
	storeUI.uiTable.refreshButton:setString(language.get(101005))
	log.debug("refresh button changed !")
end

function var_0_0.createEquipmentStarLabel(arg_21_0, arg_21_1)
	local var_21_0 = CCLayer:create()

	if arg_21_0 and arg_21_1 then
		local var_21_1 = arg_21_1 - arg_21_0

		for iter_21_0 = 1, arg_21_1 do
			local var_21_2 = {}

			if iter_21_0 <= arg_21_0 then
				var_21_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("star_light.png")
			else
				var_21_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("star_dark.png")
			end

			local var_21_3 = CCSprite:createWithSpriteFrame(var_21_2)

			var_21_3:setAnchorPoint(ccp(0, 0.5))
			var_21_3:setPosition(ccp(30 * (iter_21_0 - 1), 15))
			var_21_0:addChild(var_21_3)
		end
	end

	return var_21_0
end

function storeUI.click(arg_22_0)
	log.debug("click", arg_22_0)
end
