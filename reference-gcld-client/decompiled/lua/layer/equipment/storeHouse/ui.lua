tool.requireRes("equipment/storeHouse")
require("lua/common/tool")
require("lua/layer/equipment/storeHouse/collectionView")

storeHouseUI = {}
storeHouseUI.uiTable = {}
storeHouseUI.timerLabels = {}
storeHouseUI.cells = {}
storeHouseUI.isBuyBack = false

local var_0_0 = storeHouseUI
local var_0_1 = storeHouseControl

var_0_0.currentSelectedCellIndex = 1

local var_0_2 = false
local var_0_3

function var_0_0.show(arg_1_0)
	var_0_0.isBuyBack = arg_1_0
	var_0_0.currentSelectedCellIndex = 1
	var_0_3 = nil
	storeHouseUI.cells = {}
	storeHouseUI.uiTable = {}

	local var_1_0

	rmgr.loadTable(storeHouseConstant.RES)

	local var_1_1 = createBaseLayer()

	storeHouseUI.uiTable = autoUI.initUI(var_1_1, getStoreHouseData())

	if arg_1_0 then
		smgr.registerLayer(var_1_1, "buyBackLayer")
		var_0_1.storageGetBuyBackItems()
	else
		smgr.registerLayer(var_1_1, "storeHouseLayer")
		var_0_1.storageGetItems()
	end

	var_1_1:registerScriptTouchHandler(var_0_0.onTouch)
	var_1_1:setTouchEnabled(true)

	var_1_1.onEnter = var_0_1.onEnter
	var_1_1.onExit = var_0_1.onExit

	if not arg_1_0 then
		guide.control.setCurrentMarkTrace("panel:4:2")
	end

	return var_1_1
end

function var_0_0.addEquipmentStarLabelToBackground(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2
	local var_2_1 = arg_2_1 - arg_2_0

	for iter_2_0 = 1, arg_2_1 do
		local var_2_2

		if iter_2_0 <= arg_2_0 then
			var_2_2 = CCSprite:create("res/ui/equip/storeHouse/wareh_equi_star.png")
		else
			var_2_2 = CCSprite:create("res/ui/equip/storeHouse/wareh_equi_star_emp.png")
		end

		var_2_2:setAnchorPoint(ccp(0.5, 0.5))
		var_2_2:setPosition(ccp(18 * iter_2_0 - 9, 11))
		var_2_0:addChild(var_2_2)
	end
end

function var_0_0.createEquipmentStarLabel(arg_3_0, arg_3_1)
	local var_3_0 = CCLayer:create()
	local var_3_1 = arg_3_1 - arg_3_0

	for iter_3_0 = 1, arg_3_1 do
		local var_3_2 = {}

		if iter_3_0 <= arg_3_0 then
			var_3_2 = CCSprite:createWithSpriteFrameName("star_light.png"):displayFrame()
		else
			var_3_2 = CCSprite:createWithSpriteFrameName("star_dark.png"):displayFrame()
		end

		local var_3_3 = CCSprite:createWithSpriteFrame(var_3_2)

		var_3_3:setAnchorPoint(ccp(0, 0.5))
		var_3_3:setPosition(ccp(30 * (iter_3_0 - 1), 15))
		var_3_0:addChild(var_3_3)
	end

	return var_3_0
end

function var_0_0.getCells(arg_4_0, arg_4_1)
	var_0_0.cells = {}

	for iter_4_0 = 1, #arg_4_0 do
		local var_4_0 = arg_4_0[iter_4_0]

		var_0_0.cells[iter_4_0] = CCSprite:create("res/ui/equip/storeHouse/wareh_grid_view.jpg")

		local var_4_1 = CCSprite:create("res/ui/equip/storeHouse/wareh_list_emp.jpg")

		var_0_0.cells[iter_4_0]:addChild(var_4_1)

		if var_0_0.isBuyBack and var_4_0.iron > 0 then
			local var_4_2 = CCSprite:create("res/ui/equip/storeHouse/bingtie_title.png")

			var_4_2:setPosition(54, 51)
			var_0_0.cells[iter_4_0]:addChild(var_4_2)
		end

		var_4_1:setPosition(ccp(54, 51))

		local var_4_3 = CCSprite:createWithSpriteFrameName("faguangkuang.png")

		var_4_1:addChild(var_4_3)
		var_4_3:setPosition(ccp(38, 38))
		var_4_3:setVisible(false)

		var_0_0.cells[iter_4_0].highlightFrame = var_4_3

		local var_4_4 = CCSprite:create(picQualityFrame[var_4_0.quality or 1])
		local var_4_5, var_4_6 = pcall(CCSprite.createWithSpriteFrameName, CCSprite, var_4_0.pic .. ".jpg")

		log.info("result,itemPic:", var_4_5, var_4_6)

		var_4_6 = var_4_5 ~= false and var_4_6 or CCSprite:createWithSpriteFrameName("ying.jpg")

		if var_4_0.kind == 1 and var_4_0.refreshAttribute then
			local var_4_7 = CCSprite:createWithSpriteFrameName("gray_text_background.png")

			var_4_6:addChild(var_4_7)
			var_4_7:setPosition(ccp(36, 11))

			if #var_4_0.refreshAttribute > 0 then
				var_0_0.addEquipmentStarLabelToBackground(#var_4_0.refreshAttribute, var_4_0.maxSkillNum, var_4_7)
			end
		elseif var_4_0.num then
			if var_4_0.kind == 2 then
				local var_4_8 = (var_4_0.gemLv - 1) % 4 + 1
				local var_4_9 = CCLayerColor:create(ccc4(0, 0, 0, 0), 72, 22)

				var_4_6:addChild(var_4_9)
				var_4_9:setPosition(ccp(0, 50))
				var_0_0.addEquipmentStarLabelToBackground(var_4_8, var_4_8, var_4_9)
			end

			local var_4_10 = CCStrokeLabelTTF:create(tostring(var_4_0.num == 1 and "" or var_4_0.num), "Thonburi-Bold", 21)

			var_4_10:setAnchorPoint(ccp(1, 0.5))
			var_4_10:setHorizontalAlignment(kCCTextAlignmentRight)
			var_4_6:addChild(var_4_10)
			var_4_10:setPosition(ccp(68, 11))

			var_0_0.cells[iter_4_0].itemNumLabel = var_4_10
		end

		if var_0_0.isBuyBack and var_4_0.limitTime > 0 and var_4_0.limitTime < 86400000 then
			local var_4_11 = CCSprite:create("res/ui/equip/storeHouse/buyback_timer.png")

			var_4_6:addChild(var_4_11)
			var_4_11:setPosition(ccp(15, 55))
		end

		var_4_4:addChild(var_4_6)
		var_4_6:setPosition(ccp(38, 38))
		var_4_1:addChild(var_4_4)
		var_4_4:setPosition(ccp(38, 38))
		var_4_6:setTouchEnabled(true)
		var_4_1:setTouchEnabled(true)
		var_0_0.cells[iter_4_0]:setTouchEnabled(true)
	end

	if arg_4_1 >= #arg_4_0 then
		log.info("fill up empyt cell")

		for iter_4_1 = #arg_4_0 + 1, arg_4_1 do
			var_0_0.cells[iter_4_1] = CCSprite:create("res/ui/equip/storeHouse/wareh_grid_view.jpg")

			local var_4_12 = CCSprite:create("res/ui/equip/storeHouse/wareh_list_emp.jpg")

			var_0_0.cells[iter_4_1]:addChild(var_4_12)
			var_4_12:setPosition(ccp(54, 51))
		end

		if not var_0_0.isBuyBack then
			var_0_0.cells[arg_4_1 + 1] = CCSprite:create("res/ui/equip/storeHouse/wareh_grid_view.jpg")

			local var_4_13 = CCSprite:create("res/ui/equip/storeHouse/wareh_list_add.png")
			local var_4_14 = CCSprite:create("res/ui/equip/storeHouse/wareh_list_add_c.png")
			local var_4_15 = CCMenuItemSprite:create(var_4_13, var_4_14, nil)
			local var_4_16 = CCMenu:createWithItem(var_4_15)

			var_4_15:registerScriptTapHandler(var_0_0.buyStorageSizeButtonTap)
			var_0_0.cells[arg_4_1 + 1]:addChild(var_4_16)
			var_4_15:setEnabled(true)
			var_4_16:setPosition(ccp(54, 51))
		end
	end

	return var_0_0.cells
end

function var_0_0.buyStorageSizeButtonTap()
	var_0_3 = var_0_0.scrollView:getContentOffset()

	var_0_1.storageBuyStorageSize()
end

function var_0_0.getCollectionLayer(arg_6_0)
	local var_6_0 = 111
	local var_6_1 = 105
	local var_6_2 = 4

	if var_0_0.isBuyBack then
		local var_6_3 = #arg_6_0.goods
		local var_6_4 = var_6_3 % 4 ~= 0 and 4 - var_6_3 % 4 + var_6_3 or var_6_3

		if var_6_4 < 20 then
			var_6_4 = 20
		end

		log.info("itemNum ,maxSize:", #arg_6_0.goods, var_6_4)

		var_0_0.collectionViewLayer = SHCollectionView.createCollectionLayer(var_6_0, var_6_1, var_6_2, var_0_0.getCells(arg_6_0.goods, var_6_4))
	else
		log.info("is storage")

		local var_6_5 = arg_6_0.maxSize
		local var_6_6 = arg_6_0.goods

		if var_0_1.freeCard.num > 0 then
			var_6_5 = var_6_5 + 1
		end

		if var_0_1.goldCard.num > 0 then
			var_6_5 = var_6_5 + 1
		end

		if var_0_1.specialCard.num > 0 then
			var_6_5 = var_6_5 + 1
		end

		if var_0_1.goldSpecialCard.num > 0 then
			var_6_5 = var_6_5 + 1
		end

		var_0_0.collectionViewLayer = SHCollectionView.createCollectionLayer(var_6_0, var_6_1, var_6_2, var_0_0.getCells(var_6_6, var_6_5))
	end

	return var_0_0.collectionViewLayer
end

function var_0_0.updateScrollView(arg_7_0)
	if var_0_0.scrollView then
		pcall(var_0_0.scrollView.removeFromParentAndCleanup, var_0_0.scrollView, true)
	end

	local var_7_0 = CCSizeMake(450, 465)

	var_0_0.scrollView = CCScrollView:create(var_7_0)

	var_0_0.scrollView:removeAllChildrenWithCleanup(true)

	var_0_0.collectionViewLayer = var_0_0.getCollectionLayer(arg_7_0)

	local var_7_1 = var_0_0.collectionViewLayer:getContentSize()

	var_0_0.scrollView:setContainer(var_0_0.collectionViewLayer)
	var_0_0.scrollView:setDirection(kCCScrollViewDirectionVertical)
	var_0_0.uiTable.storeHouseBackground:addChild(var_0_0.scrollView)
	var_0_0.scrollView:setContentSize(var_7_1)
	var_0_0.scrollView:setAnchorPoint(ccp(0, 0))
	var_0_0.scrollView:setPosition(ccp(5, 5))
	var_0_0.scrollView:setContentOffset(ccp(0, var_0_0.scrollView:getViewSize().height - var_7_1.height))
	log.info("scorllview up to date")
end

function var_0_0.updateStoreHouse(arg_8_0)
	log.info("should update right panel")

	if var_0_1.itemsData == nil or #var_0_1.itemsData == nil or var_0_0.currentSelectedCellIndex == nil then
		return
	end

	if #var_0_1.itemsData < var_0_0.currentSelectedCellIndex then
		var_0_0.currentSelectedCellIndex = 1
	end

	if #var_0_1.itemsData == 0 then
		var_0_0.currentSelectedCellIndex = 0

		var_0_0.updateRightPanel(nil)
	else
		var_0_0.updateRightPanel(var_0_1.itemsData[var_0_0.currentSelectedCellIndex])
	end

	local var_8_0

	if var_0_0.isBuyBack then
		var_8_0 = language.get(102006, #arg_8_0.goods)
	else
		local var_8_1 = #arg_8_0.goods

		if var_0_1.freeCard.num > 0 then
			var_8_1 = var_8_1 - 1
		end

		if var_0_1.goldCard.num > 0 then
			var_8_1 = var_8_1 - 1
		end

		if var_0_1.specialCard.num > 0 then
			var_8_1 = var_8_1 - 1
		end

		if var_0_1.goldSpecialCard.num > 0 then
			var_8_1 = var_8_1 - 1
		end

		var_8_0 = language.get(102007, var_8_1, arg_8_0.maxSize)
	end

	var_0_0.uiTable.storageContentNum:setString(var_8_0)
	log.info("should update left panel")
	var_0_0.updateScrollView(arg_8_0)

	if var_0_0.currentSelectedCellIndex ~= 0 then
		var_0_0.cells[var_0_0.currentSelectedCellIndex].highlightFrame:setVisible(true)

		if var_0_3 then
			log.info("lastScollviewOffset:", var_0_3.x, var_0_3.y)
			var_0_0.scrollView:setContentOffset(var_0_3)
		end
	end

	require("lua/guide/control")

	if not var_0_0.isBuyBack then
		log.info("sellbutton : ", var_0_0.uiTable.sellButton)

		guide.uiElementsTable[1010] = storeHouseUI.uiTable.sellButton

		if guide.callback then
			guide.callback()

			guide.callback = nil
		end
	end
end

function var_0_0.updateRightPanel(arg_9_0)
	if var_0_0.rightPanelStarLabel then
		pcall(var_0_0.rightPanelStarLabel.removeFromParentAndCleanup, var_0_0.rightPanelStarLabel, true)

		var_0_0.rightPanelStarLabel = nil
	end

	if var_0_0.uiTable.descriptionLayer then
		pcall(var_0_0.uiTable.descriptionLayer.removeFromParentAndCleanup, var_0_0.uiTable.descriptionLayer, true)

		var_0_0.uiTable.descriptionLayer = nil
	end

	if var_0_0.uiTable.itemButtons then
		pcall(var_0_0.uiTable.itemButtons.removeFromParentAndCleanup, var_0_0.uiTable.itemButtons, true)

		var_0_0.uiTable.itemButtons = nil
	end

	if var_0_0.uiTable.useExpPanel then
		pcall(var_0_0.uiTable.useExpPanel.removeFromParentAndCleanup, var_0_0.uiTable.useExpPanel, true)

		var_0_0.uiTable.useExpPanel = nil
	end

	if var_0_0.timer then
		pcall(var_0_0.timer.removeFromParentAndCleanup, var_0_0.timer, true)

		var_0_0.timer = nil
	end

	if arg_9_0 then
		var_0_0.uiTable.itemNameLabel:setString(arg_9_0.itemName)
		var_0_0.uiTable.itemNameLabel:setColor(colorQuality[arg_9_0.quality or 1])

		if arg_9_0.quality == 0 then
			var_0_0.uiTable.itemNameLabel:setColor(colorQuality[1])
		end

		var_0_0.uiTable.rightQuailtyFrame:setDisplayFrame(CCSprite:create(picQualityFrame[arg_9_0.quality or 1]):displayFrame())

		local var_9_0, var_9_1 = pcall(CCSprite.createWithSpriteFrameName, CCSprite, arg_9_0.pic .. ".jpg")

		log.info("result,rightItemSprite:", var_9_0, var_9_1)

		var_9_1 = var_9_0 ~= false and var_9_1 or CCSprite:createWithSpriteFrameName("ying.jpg")

		var_0_0.uiTable.rightItemPic:setDisplayFrame(var_9_1:displayFrame())
		log.info("should add buttons1")

		if var_0_0.isBuyBack and arg_9_0.kind ~= 2 and arg_9_0.limitTime > 0 then
			if var_0_0.timer then
				var_0_0.timer:removeFromParentAndCleanup(true)

				var_0_0.timer = nil
			end

			local var_9_2 = createTimerLabel(arg_9_0.limitTime, "@H:@M:@S", "Thonburi-Bold", 23, var_0_1.storageGetBuyBackItems)

			var_0_0.timer = var_9_2

			var_0_0.uiTable.storeHouseBackground:addChild(var_9_2)
			var_9_2:setPosition(684, 295)
		elseif arg_9_0.maxSkillNum and arg_9_0.maxSkillNum > 0 then
			local var_9_3 = arg_9_0.refreshAttribute and #arg_9_0.refreshAttribute or 0
			local var_9_4 = var_0_0.createEquipmentStarLabel(var_9_3, arg_9_0.maxSkillNum)

			var_0_0.rightPanelStarLabel = var_9_4

			var_0_0.uiTable.storeHouseBackground:addChild(var_9_4)
			var_9_4:setPosition(ccp(625, 283))
		end

		if arg_9_0.kind == 2 then
			local var_9_5 = (arg_9_0.gemLv - 1) % 4 + 1
			local var_9_6 = var_0_0.createEquipmentStarLabel(var_9_5, var_9_5)

			var_0_0.rightPanelStarLabel = var_9_6

			var_0_0.uiTable.storeHouseBackground:addChild(var_9_6)
			var_9_6:setPosition(ccp(625, 283))
		end

		if (arg_9_0.kind == 42 or arg_9_0.kind == 47) and arg_9_0.cd and arg_9_0.cd > 0 then
			local var_9_7 = createTimerLabel(arg_9_0.cd, "@H:@M:@S", "Thonburi-Bold", 23, var_0_1.storageGetBuyBackItems)

			var_0_0.timer = var_9_7

			var_0_0.uiTable.storeHouseBackground:addChild(var_9_7)
			var_9_7:setPosition(684, 295)
		end

		autoUI.createUI(var_0_0.uiTable.storeHouseBackground, getDescriptionWithItem(arg_9_0), var_0_0.uiTable)
		log.info("should add buttons2 ")
		autoUI.createUI(var_0_0.uiTable.storeHouseBackground, getStorageButtonWithItem(copy(arg_9_0)), var_0_0.uiTable)
	else
		var_0_0.uiTable.itemNameLabel:setString("")
		var_0_0.uiTable.rightQuailtyFrame:setDisplayFrame(CCSprite:create(picQualityFrame[1]):displayFrame())
		var_0_0.uiTable.rightItemPic:setDisplayFrame(CCSprite:create(picQualityFrame[1]):displayFrame())
	end
end

local var_0_4 = 0

function var_0_0.onTouch(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0 == CCTOUCHBEGAN then
		log.info("touch begin : ", arg_10_1, arg_10_2)

		var_0_4 = arg_10_2

		return true
	elseif arg_10_0 == CCTOUCHMOVED then
		log.info("touch moved : ", arg_10_1, arg_10_2)

		var_0_2 = true

		return true
	elseif arg_10_0 == CCTOUCHENDED then
		log.info("isTouchMoved", var_0_2, arg_10_1, arg_10_2)
		log.info("touch move offset Y : ", math.abs(var_0_4 - arg_10_2))

		if not var_0_2 or math.abs(var_0_4 - arg_10_2) < 20 then
			for iter_10_0 = 1, #var_0_1.itemsData do
				if tool.checkIfTouch(var_0_0.cells[iter_10_0], arg_10_1, arg_10_2) then
					local var_10_0 = var_0_0.scrollView:getViewSize().height
					local var_10_1, var_10_2 = tool.getPositionFromUpperNode(var_0_0.cells[iter_10_0], var_0_0.scrollView)

					if var_10_0 < var_10_2 or var_10_2 < 0 then
						log.info("scrollview not  touched", var_10_1, var_10_2, var_10_0)

						break
					else
						log.info("scrollview not touched", var_10_1, var_10_2, var_10_0)
					end

					log.info("select at ", var_0_0.currentSelectedCellIndex, iter_10_0, var_0_1.itemsData[iter_10_0].itemName)

					if var_0_0.currentSelectedCellIndex ~= iter_10_0 then
						var_0_0.cells[var_0_0.currentSelectedCellIndex].highlightFrame:setVisible(false)
						log.info("should update right panel")

						var_0_3 = var_0_0.scrollView:getContentOffset()

						log.info("lastScollviewOffse:", var_0_3.y)
						var_0_0.updateRightPanel(var_0_1.itemsData[iter_10_0])
					end

					var_0_0.cells[iter_10_0].highlightFrame:setVisible(true)

					var_0_0.currentSelectedCellIndex = iter_10_0
				end
			end
		end

		var_0_2 = false

		return true
	end
end

function var_0_0.buyBackItemButtonTap(arg_11_0)
	var_0_3 = var_0_0.scrollView:getContentOffset()

	var_0_1.storageBuyBackItem(arg_11_0)
end

function var_0_0.sellItemButtonTap(arg_12_0)
	var_0_3 = var_0_0.scrollView:getContentOffset()

	var_0_1.storageSellItem(arg_12_0)
end

function var_0_0.gemComposeButtonTap(arg_13_0)
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show(2)
end

function var_0_0.getEquippedButtonTap(arg_14_0)
	require("lua/layer/general/ui")
	showGeneralPanel(1)
end

function var_0_0.showTipText(arg_15_0)
	smgr.showTipText(arg_15_0)
	amgr.playEffect(enumAudioFile.ui_click_error, false, true)
end

function var_0_0.useJailPicButtonTap(arg_16_0)
	if not user.getFunc(52) then
		var_0_0.showTipText(language.get("102046_lxr"))
	else
		require("lua/layer/general/ui")
		showGeneralPanel(5)
	end
end

function var_0_0.useWarlockPicButtonTap(arg_17_0)
	if not user.getFunc(64) then
		var_0_0.showTipText(language.get("102047_lxr"))
	else
		require("lua/layer/general/ui")
		showGeneralPanel(6)
	end
end

function var_0_0.useBlackSmithPicButtonTap(arg_18_0)
	if not user.getFunc(66) then
		var_0_0.showTipText(language.get("102048_lxr"))
	else
		require("lua/layer/resource/ui")
		resourceUI.show(5)
	end
end

function var_0_0.flyTextToPositionInScreen(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	log.info("fly text begin")

	local var_19_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_19_0:registerScriptTouchHandler(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == CCTOUCHBEGAN then
			return true
		elseif arg_20_0 == CCTOUCHMOVED then
			return true
		elseif arg_20_0 == CCTOUCHENDED then
			pcall(var_19_0.removeFromParentAndCleanup, var_19_0, true)

			return true
		end
	end, false, true)
	var_19_0:setTouchEnabled(true)
	log.debug("add mask")

	local var_19_1 = CCMoveBy:create(0.6, ccp(0, 30))
	local var_19_2 = CCFadeOut:create(0.5)
	local var_19_3 = CCArray:create()

	var_19_3:addObject(var_19_1)
	var_19_3:addObject(var_19_2)
	var_19_3:addObject(CCCallFuncN:create(function()
		var_19_0:removeFromParentAndCleanup(true)
	end))

	local var_19_4 = CCStrokeLabelTTF:create(arg_19_2, "Thonburi", 25)

	var_19_0:addChild(var_19_4)
	var_19_4:setPosition(ccp(arg_19_0, arg_19_1 - 30))
	var_19_4:setColor(arg_19_3)
	var_19_4:runActionCopy(CCSequence:create(var_19_3))
	smgr.rootLayer:addChild(var_19_0, 60000)
end

function var_0_0.updateGeneralList(arg_22_0)
	for iter_22_0 = 1, #arg_22_0 do
		local var_22_0 = var_0_0.generals[iter_22_0]

		if var_0_0.generals[iter_22_0].exp ~= arg_22_0[iter_22_0].exp then
			var_0_0.uiTable["generalExpProgressBar" .. var_22_0.generalId]:setPercentage(var_22_0.exp / var_22_0.expMax * 100)
			var_0_0.uiTable["generalExpText" .. var_22_0.generalId]:setString(var_22_0.exp .. "/" .. var_22_0.expMax)
			var_0_0.uiTable["generalLvText" .. var_22_0.generalId]:setString("Lv." .. var_22_0.lv)
			autoUI.updateListDataWithListUiData(var_0_0.uiTable, "storageGeneralList", getStorageGeneralListPanelData(), iter_22_0, arg_22_0[iter_22_0])
		end
	end

	log.info("update general list completed")

	var_0_0.generals = arg_22_0
end

function var_0_0.showGeneralList(arg_23_0)
	showTable(arg_23_0)

	local var_23_0 = var_0_1.itemsData[var_0_0.currentSelectedCellIndex]

	var_0_0.generals = arg_23_0

	if var_0_0.generalListMask then
		pcall(var_0_0.generalListMask.removeFromParentAndCleanup, var_0_0.generalListMask, true)
	end

	local var_23_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_0_0.generalListMask = var_23_1

	var_23_1:registerScriptTouchHandler(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == CCTOUCHBEGAN then
			return true
		elseif arg_24_0 == CCTOUCHMOVED then
			return true
		elseif arg_24_0 == CCTOUCHENDED then
			if tool.checkIfTouch(var_0_0.uiTable.generalListBackground, arg_24_1, arg_24_2) then
				-- block empty
			else
				var_0_0.uiTable.storageGeneralList = nil
				var_0_0.generals = nil

				var_23_1:removeFromParentAndCleanup(true)
			end

			return true
		end
	end, false, true)
	var_23_1:setTouchEnabled(true)

	if var_0_0.uiTable.generalListBackground then
		var_0_0.uiTable.generalListBackground = nil
	end

	autoUI.createUI(var_23_1, getGeneralListBackground(), var_0_0.uiTable)

	local var_23_2 = var_0_0.uiTable.generalListBackground
	local var_23_3 = autoUI.renderList(var_0_0.uiTable, getStorageGeneralListPanelData(), arg_23_0)
	local var_23_4 = CCSizeMake(var_23_2:getContentSize().width, var_23_2:getContentSize().height - 80)
	local var_23_5 = CCScrollView:create(var_23_4)

	var_23_5:setContentSize(var_23_3:getContentSize())
	var_23_5:setContainer(var_23_3)
	var_23_5:setDirection(kCCScrollViewDirectionVertical)
	var_23_5:setPosition(ccp(10, 5))
	var_23_5:setContentOffset(ccp(0, var_23_5:getViewSize().height - var_23_3:getContentSize().height))
	var_23_2:setPosition(ccp(473, 315))
	var_23_2:addChild(var_23_5)
	smgr.getLayer("storeHouseLayer"):addChild(var_23_1, 60000)
end

function var_0_0.useExpCardButtonTap(arg_25_0)
	var_0_1.storageGetCanUseGeneral(arg_25_0)
end

function var_0_0.showExpCardUsePanel(arg_26_0)
	local var_26_0 = var_0_1.itemsData[var_0_0.currentSelectedCellIndex]

	if var_0_0.rightPanelStarLabel then
		pcall(var_0_0.rightPanelStarLabel.removeFromParentAndCleanup, var_0_0.rightPanelStarLabel, true)

		var_0_0.rightPanelStarLabel = nil
	end

	if var_0_0.uiTable.descriptionLayer then
		pcall(var_0_0.uiTable.descriptionLayer.removeFromParentAndCleanup, var_0_0.uiTable.descriptionLayer, true)

		var_0_0.uiTable.descriptionLayer = nil
	end

	if var_0_0.uiTable.itemButtons then
		pcall(var_0_0.uiTable.itemButtons.removeFromParentAndCleanup, var_0_0.uiTable.itemButtons, true)

		var_0_0.uiTable.itemButtons = nil
	end

	if var_0_0.uiTable.useExpPanel then
		pcall(var_0_0.uiTable.useExpPanel.removeFromParentAndCleanup, var_0_0.uiTable.useExpPanel, true)

		var_0_0.uiTable.useExpPanel = nil
	end

	if var_0_0.timer then
		pcall(var_0_0.timer.removeFromParentAndCleanup, var_0_0.timer, true)

		var_0_0.timer = nil
	end

	var_0_0.uiTable.itemNameLabel:setString("")
	var_0_0.uiTable.rightQuailtyFrame:setDisplayFrame(CCSprite:create(picQualityFrame[1]):displayFrame())
	var_0_0.uiTable.rightItemPic:setDisplayFrame(CCSprite:create(picQualityFrame[1]):displayFrame())

	local var_26_1 = getUseExpPanelLayout()
	local var_26_2 = {}

	uiutil.initWidgets(var_26_2, var_26_1)

	var_0_0.uiTable.useExpPanel = var_26_2.widgets.root

	var_26_2.widgets.root:setPosition(ccp(455, 0))
	var_0_0.uiTable.storeHouseBackground:addChild(var_26_2.widgets.root, 201)

	local var_26_3 = CCEditBox:create(CCSizeMake(100, 30), CCScale9Sprite:createWithSpriteFrameName("btn_check_1_a.png"))

	var_26_3:setInputMode(kEditBoxInputModeNumeric)

	var_0_0.useNum = var_0_0.useNum or 1

	if var_26_0.num < var_0_0.useNum then
		var_0_0.useNum = var_26_0.num
	end

	var_26_3:setText(var_0_0.useNum)
	var_26_3:setMaxLength(4)
	var_26_2.widgets.input:addChild(var_26_3)

	local function var_26_4(arg_27_0)
		if arg_27_0.action.state == 1 then
			local var_27_0 = arg_27_0.action.data

			if arg_26_0.lv ~= var_27_0.lv then
				var_26_2.widgets.level:setString("lv." .. arg_26_0.lv .. " -> lv." .. var_27_0.lv)
				var_26_2.widgets.currentProcess:setPercentage(0)
				var_26_2.widgets.nextProcess:setPercentage(var_27_0.exp / var_27_0.expMax * 100)
			else
				var_26_2.widgets.level:setString("lv." .. arg_26_0.lv)
				var_26_2.widgets.currentProcess:setPercentage(arg_26_0.exp / arg_26_0.expMax * 100)
				var_26_2.widgets.nextProcess:setPercentage(var_27_0.exp / var_27_0.expMax * 100)
			end
		end
	end

	var_26_2.widgets.btnUse:addHandleOfControlEvent(function(...)
		cmgr.sendRequest(function(arg_29_0)
			if arg_29_0.action.state == 1 then
				local var_29_0 = {
					{}
				}

				var_29_0[1].id = 6
				var_29_0[1].value = arg_29_0.action.data.expAdd

				if #var_29_0 > 0 then
					log.info("should fly rewardTable")

					local var_29_1 = user.player.gemKit

					user.player.gemKit = false

					globalAction_gotResource(var_29_0)

					user.player.gemKit = var_29_1
				end

				if arg_29_0.action.data.haveLeft == true then
					log.info("should updata certain cell")

					local var_29_2 = storeHouseUI.currentSelectedCellIndex

					var_26_0.num = var_26_0.num - arg_29_0.action.data.useTime

					if storeHouseUI.cells[var_29_2].itemNumLabel then
						storeHouseUI.cells[var_29_2].itemNumLabel:setString(var_26_0.num)
					end

					arg_26_0.lv = arg_29_0.action.data.lv
					arg_26_0.exp = arg_29_0.action.data.exp
					arg_26_0.expMax = arg_29_0.action.data.expMax

					if var_26_0.num < var_0_0.useNum then
						var_0_0.useNum = var_26_0.num
					end

					var_26_3:setText(var_0_0.useNum)
					var_26_2.widgets.level:setString("lv." .. arg_26_0.lv)
					var_26_2.widgets.currentProcess:setPercentage(arg_26_0.exp / arg_26_0.expMax * 100)
					cmgr.sendRequest(var_26_4, actions.storageUseOnGeneral, var_26_0.vId, arg_26_0.generalId, var_0_0.useNum, 0)
				else
					var_0_1.storageGetItems()
				end
			end
		end, actions.storageUseOnGeneral, var_26_0.vId, arg_26_0.generalId, var_0_0.useNum, 1)
	end, CCControlEventTouchUpInside)
	var_26_2.widgets.btnCancel:addHandleOfControlEvent(function(...)
		var_0_0.updateRightPanel(var_26_0)
	end, CCControlEventTouchUpInside)

	local var_26_5, var_26_6 = pcall(CCSprite.createWithSpriteFrameName, CCSprite, var_26_0.pic .. ".jpg")

	log.info("result,rightItemSprite:", var_26_5, var_26_6)

	var_26_6 = var_26_5 ~= false and var_26_6 or CCSprite:createWithSpriteFrameName("ying.jpg")

	var_26_2.widgets.item:addChild(var_26_6)

	local var_26_7 = CCSprite:create(rmgr.getGeneralBust(arg_26_0.pic))

	if arg_26_0.evoke == 2 then
		if arg_26_0.generalId == 202 then
			if arg_26_0.evokeSkillFinal and arg_26_0.evokeSkillFinal > 0 then
				var_26_7 = CCSprite:create("res/ui/common/halfPic/halfPic_zhangfeijx.png")
			elseif arg_26_0.evokeSkill1 > 0 or arg_26_0.evokeSkill2 > 0 or arg_26_0.evokeSkill3 > 0 or arg_26_0.evokeSkill4 > 0 then
				var_26_7 = CCSprite:create("res/ui/general/juexing/halfPic/zhangfei2.png")
			end
		elseif arg_26_0.evokeSkillFinal and arg_26_0.evokeSkillFinal > 0 then
			var_26_7 = CCSprite:create("res/ui/common/halfPic/halfPic_guanyujx.png")
		elseif arg_26_0.evokeSkill1 > 0 or arg_26_0.evokeSkill2 > 0 or arg_26_0.evokeSkill3 > 0 or arg_26_0.evokeSkill4 > 0 then
			var_26_7 = CCSprite:create("res/ui/general/juexing/halfPic/guanyu2.png")
		end
	end

	var_26_2.widgets.halfPic:setDisplayFrame(var_26_7:displayFrame())
	var_26_3:registerScriptEditBoxHandler(function(arg_31_0, arg_31_1)
		local var_31_0 = tolua.cast(arg_31_1, "CCEditBox")

		if arg_31_0 == "began" then
			log.info("editbox began")
		elseif arg_31_0 == "changed" then
			log.info("editbox changed")

			local var_31_1 = tonumber(var_31_0:getText())

			if not var_31_1 or var_31_1 <= 0 then
				var_0_0.useNum = 1
			else
				var_0_0.useNum = var_31_1

				if var_26_0.num < var_0_0.useNum then
					var_0_0.useNum = var_26_0.num
				end

				var_31_0:setText(var_0_0.useNum)
			end

			cmgr.sendRequest(var_26_4, actions.storageUseOnGeneral, var_26_0.vId, arg_26_0.generalId, var_0_0.useNum, 0)
		elseif arg_31_0 == "return" then
			log.info("editbox return")
			var_31_0:setText(var_0_0.useNum)
		elseif arg_31_0 == "ended" then
			log.info("editbox ended")
			var_31_0:setText(var_0_0.useNum)
		end
	end)
	var_26_2.widgets.level:setString("lv." .. arg_26_0.lv)
	var_26_2.widgets.currentProcess:setPercentage(arg_26_0.exp / arg_26_0.expMax * 100)
	cmgr.sendRequest(var_26_4, actions.storageUseOnGeneral, var_26_0.vId, arg_26_0.generalId, var_0_0.useNum, 0)
end

function var_0_0.useExpCard(arg_32_0)
	local var_32_0 = storeHouseUI.currentSelectedCellIndex
	local var_32_1 = storeHouseControl.itemsData[var_32_0].num
	local var_32_2 = 10

	if var_32_1 < 10 then
		var_32_2 = var_32_1
	end

	var_0_1.storageUseOnGeneral(var_0_1.itemsData[var_0_0.currentSelectedCellIndex], arg_32_0, var_32_2)
end

function var_0_0.useEquipOrder(arg_33_0)
	local var_33_0 = require("lua/layer/activity/activityTab/ChooseEquipPanel").new(arg_33_0)
	local var_33_1 = smgr.getLayer("storeHouseLayer")

	var_0_0.chooesEquipPanel = var_33_0

	var_33_1:addChild(var_33_0, 201)
end

function var_0_0.useMedal(arg_34_0)
	local function var_34_0(arg_35_0)
		local var_35_0 = arg_35_0.action.data
		local var_35_1

		var_35_1 = require("lua/layer/activity/activityTab/ChooseEquipPanel").new(11, var_35_0.lightEquips, {
			selectedCallback = function(arg_36_0, arg_36_1)
				log.info("zhu@@@", arg_36_0, arg_36_1)

				local function var_36_0(arg_37_0)
					if arg_36_0.effects then
						local var_37_0 = CCSprite:create("res/ui/nation/buildNation/dongying/ljwc_word_xzthcg.png")

						var_37_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
						smgr.showTipFloatYSprite(var_37_0)
					else
						smgr.showTipTextGreen(language.get(136051))
					end

					pcall(var_35_1.removeFromParentAndCleanup, var_35_1, true)
					var_0_1.storageGetItems()
				end

				if arg_36_0.effects then
					messageBox.confirm(language.get(136864), function()
						cmgr.sendRequest(var_36_0, actions.useMedal, arg_34_0, arg_36_0.vId)
					end)
				else
					messageBox.confirm(language.get(136050), function()
						cmgr.sendRequest(var_36_0, actions.useMedal, arg_34_0, arg_36_0.vId)
					end)
				end
			end
		})

		local var_35_2 = smgr.getLayer("storeHouseLayer")

		var_0_0.chooesEquipPanel = var_35_1

		var_35_2:addChild(var_35_1, 201)
	end

	cmgr.sendRequest(var_34_0, actions.medalEquips)
end

local var_0_5 = class("UseJingLianLayer", BaseLayOutLayer)

function var_0_5.ctor(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0.__listData = {}
	arg_40_0.__useitem = arg_40_2

	local var_40_0 = {
		y = 290.5,
		name = "root",
		type = "sprite",
		x = 480,
		pic = {
			path = "res/ui/weapon/cangku.png"
		},
		children = {
			{
				y = 9.9999,
				name = "list",
				type = "TableView",
				x = 10.7614,
				viewSize = CCSizeMake(514, 147),
				dirction = kCCScrollViewDirectionHorizontal
			},
			{
				name = "btnUse",
				h = 54,
				type = "button",
				w = 125,
				y = 30,
				x = 267,
				normal = {
					frame = true,
					path = "btn2_gre_a.png"
				},
				touched = {
					frame = true,
					path = "btn2_gre_c.png"
				},
				disable = {
					frame = true,
					path = "btn2_gre_g.png"
				},
				children = {
					{
						fontSize = 20,
						name = "Text_25",
						y = 27,
						type = "label",
						textId = 135851,
						style = "label_yellowish_22",
						x = 62,
						halign = kCCTextAlignmentLeft,
						valign = kCCVerticalTextAlignmentBottom
					}
				}
			}
		}
	}

	local function var_40_1(arg_41_0, arg_41_1, arg_41_2)
		if arg_40_0.initCCSFinished ~= true then
			return false
		end

		if arg_41_0 == CCTOUCHBEGAN then
			return true
		elseif arg_41_0 == CCTOUCHMOVED then
			return true
		elseif arg_41_0 == CCTOUCHENDED then
			if not tool.checkIfTouch2(arg_40_0.widgets.root, arg_41_1, arg_41_2) then
				arg_40_0:removeFromParentAndCleanup(true)
			end

			return true
		end
	end

	arg_40_0:setTouchEnabled(true)
	arg_40_0:registerScriptTouchHandler(var_40_1, false, true)
	var_0_5.super.ctor(arg_40_0, var_40_0, handler(arg_40_0, arg_40_0.initLayout))
	arg_40_0:init(arg_40_1)
end

function var_0_5.initLayout(arg_42_0)
	arg_42_0.widgets.list:registerScriptHandler(handler(arg_42_0, arg_42_0.tableCellTouched), CCTableView.kTableCellTouched)
	arg_42_0.widgets.list:registerScriptHandler(handler(arg_42_0, arg_42_0.cellSizeForTable), CCTableView.kTableCellSizeForIndex)
	arg_42_0.widgets.list:registerScriptHandler(handler(arg_42_0, arg_42_0.tableCellAtIndex), CCTableView.kTableCellSizeAtIndex)
	arg_42_0.widgets.list:registerScriptHandler(handler(arg_42_0, arg_42_0.numberOfCellsInTableView), CCTableView.kNumberOfCellsInTableView)
	arg_42_0.widgets.btnUse:addHandleOfControlEvent(handler(arg_42_0, arg_42_0.onCommitClicked), CCControlEventTouchUpInside)
	arg_42_0.widgets.btnUse:setVisible(false)
end

function var_0_5.onCommitClicked(arg_43_0, ...)
	cmgr.sendRequest(handler(arg_43_0, arg_43_0.useJinLianTokenHandler), actions.useJinLianToken, arg_43_0.__useitem.vId, arg_43_0.__gemData.vId, arg_43_0.__selectedIndex)
end

function var_0_5.useJinLianTokenHandler(arg_44_0, arg_44_1)
	if arg_44_1.action.state == 1 then
		eventManager.dispatchEvent("refreshStoreHouse")

		local var_44_0 = CCSprite:create("res/ui/activity/xilian/acti_text_jnsj.png")

		var_44_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

		local var_44_1 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_44_2 = CCDelayTime:create(0.3)
		local var_44_3 = CCMoveTo:create(0.5, ccp(visibleSize.width / 2, visibleSize.height))
		local var_44_4 = CCCallFuncN:create(function(arg_45_0)
			arg_45_0:removeFromParentAndCleanup(true)
		end)
		local var_44_5 = CCArray:create()

		var_44_5:addObject(var_44_1)
		var_44_5:addObject(var_44_2)
		var_44_5:addObject(var_44_3)
		var_44_5:addObject(var_44_4)

		local var_44_6 = CCSequence:create(var_44_5)

		var_44_0:runAction(var_44_6)
		smgr.getLayer("pushLayer"):addChild(var_44_0)
		arg_44_0:removeFromParentAndCleanup(true)
	end
end

function var_0_5.init(arg_46_0, arg_46_1)
	if arg_46_1 then
		arg_46_0.__listData = arg_46_1
		arg_46_0.__showType = 1

		arg_46_0.widgets.btnUse:setVisible(false)
		arg_46_0.widgets.list:reloadData()
	end
end

function var_0_5.tableCellTouched(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = arg_47_2:getIdx()

	if arg_47_0.__showType == 1 then
		arg_47_0.__gemData = arg_47_0.__listData[var_47_0 + 1]
		arg_47_0.__showType = 2

		arg_47_0.widgets.btnUse:setVisible(true)
		arg_47_0.widgets.btnUse:setEnabled(false)
		arg_47_0.widgets.list:reloadData()
	elseif arg_47_0.__showType == 2 then
		if arg_47_0.__selectedIndex then
			local var_47_1 = arg_47_1:cellAtIndex(arg_47_0.__selectedIndex - 1)

			if var_47_1 then
				var_47_1:getChildByTag(60):getChildByTag(60):setVisible(false)
			end
		end

		if tonumber(arg_47_0.__gemData.skills[var_47_0 + 1].lv) < 5 then
			arg_47_0.__selectedIndex = var_47_0 + 1

			arg_47_0.widgets.btnUse:setEnabled(true)
			arg_47_2:getChildByTag(60):getChildByTag(60):setVisible(true)
		else
			arg_47_0.__selectedIndex = nil

			arg_47_0.widgets.btnUse:setEnabled(false)
		end
	end
end

function var_0_5.cellSizeForTable(arg_48_0, arg_48_1, arg_48_2)
	return 147, 80
end

function var_0_5.createTabelCellContent(arg_49_0, arg_49_1)
	require("lua/layer/weaponTab/diamond/ui")

	return diamond.ui.create_single_dimond(arg_49_1, false)
end

function var_0_5.tableCellAtIndex(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_1:dequeueCell()

	if var_50_0 then
		var_50_0:removeAllChildrenWithCleanup(true)
	else
		var_50_0 = CCTableViewCell:new()
	end

	local var_50_1 = CCNode:create()

	if arg_50_0.__showType == 1 then
		var_50_1 = arg_50_0:createTabelCellContent(arg_50_0.__listData[arg_50_2 + 1])
	elseif arg_50_0.__showType == 2 then
		var_50_1 = CCSprite:create("res/ui/weapon/diamond/warlock_tit_" .. arg_50_0.__gemData.skills[arg_50_2 + 1].pic .. "_red.png")

		local var_50_2 = CCSprite:create("res/ui/weapon/gem_now_view_lig.png")

		var_50_2:setVisible(arg_50_0.__selectedIndex == arg_50_2 + 1)
		var_50_2:setTag(60)
		var_50_2:setScale(0.8)
		var_50_2:setPosition(ccp(var_50_1:getContentSize().width / 2, var_50_1:getContentSize().height / 2))
		var_50_1:addChild(var_50_2)

		local var_50_3 = CCStrokeLabelTTF:create("Lv." .. arg_50_0.__gemData.skills[arg_50_2 + 1].lv, styles.label_yellowish_22.font, 22, 1, styles.label_yellowish_22.strokeColor)

		var_50_3:setPosition(ccp(30, 10))
		var_50_1:addChild(var_50_3)
	end

	var_50_1:setPosition(40, 73.5)
	var_50_0:addChild(var_50_1, 1, 60)

	return var_50_0
end

function var_0_5.numberOfCellsInTableView(arg_51_0)
	if arg_51_0.__showType == 1 then
		return #arg_51_0.__listData
	elseif arg_51_0.__showType == 2 then
		return #arg_51_0.__gemData.skills
	else
		return 0
	end
end

function var_0_5.onEnter(arg_52_0)
	log.info("onEnter")
end

function var_0_5.onExit(arg_53_0)
	log.info("onExit")
end

function var_0_0.useJingLian(arg_54_0)
	local var_54_0 = arg_54_0.itemId - 2500

	local function var_54_1(arg_55_0)
		if arg_55_0.action.state == 1 then
			local var_55_0 = var_0_5.new(arg_55_0.action.data.gem or {}, arg_54_0)

			smgr.getLayer("storeHouseLayer"):addChild(var_55_0, 201)
		end
	end

	cmgr.sendRequest(var_54_1, actions.getEquipForUseRefineItem, var_54_0)
end

function var_0_0.updateQuenchingEquip(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	log.info("should updateQuenchingEquip", arg_56_0, arg_56_1, arg_56_2, arg_56_3)
	pcall(var_0_0.chooesEquipPanel.removeFromParentAndCleanup, var_0_0.chooesEquipPanel, true)

	local var_56_0 = ""

	if arg_56_2 == 1 then
		var_56_0 = language.get(103020, arg_56_0.name)
	elseif arg_56_2 == 2 then
		var_56_0 = language.get(103021, arg_56_0.name)
	elseif arg_56_2 == 3 then
		local var_56_1 = {
			103031,
			103032,
			103033,
			103034,
			103035,
			103036,
			103037
		}

		var_56_0 = language.get(103022, arg_56_0.name, language.get(var_56_1[arg_56_1]))
	end

	messageBox.confirm(var_56_0, function()
		arg_56_3(var_0_1.itemsData[var_0_0.currentSelectedCellIndex].vId)
		var_0_1.storageGetItems()
	end)
end

function var_0_0.useResourceTokenButtonTap(arg_58_0)
	var_0_1.equipUseResourceToken(arg_58_0)
end

function var_0_0.useIronRewardToken(arg_59_0)
	var_0_1.useIronRewardToken(arg_59_0)
end

function var_0_0.useFeatTokenButtonTap()
	var_0_1.useFeatToken()
end

function var_0_0.useFeatResetTokenButtonTap()
	var_0_1.useFeatResetToken()
end

function var_0_0.useLianBingFuButtonTap(arg_62_0)
	var_0_1.useLianBingFu(arg_62_0)
end

function var_0_0.scoutMeteor()
	var_0_1.scoutMeteor()
end

function var_0_0.doCompoundSuitButtonTap(arg_64_0)
	var_0_1.equipDoCompoundSuit(arg_64_0)
end

function var_0_0.doCompoundProsetButtonTap(arg_65_0)
	var_0_1.equipDoCompoundProset(arg_65_0)
end

function var_0_0.demountSuitButtonTap(arg_66_0)
	var_0_1.equipDemountGold(arg_66_0)
end

function var_0_0.demountProsetButtonTap(arg_67_0)
	var_0_1.equipDemountProsetGold(arg_67_0)
end

function var_0_0.showSuitCompoundPanelButtonTap(arg_68_0)
	var_0_1.equipCompoundSuit(arg_68_0)
end

function var_0_0.showProsetCompoundPanelButtonTap(arg_69_0)
	var_0_1.equipCompoundProset(arg_69_0)
end

function var_0_0.showProsetCompoundPanel(arg_70_0)
	local var_70_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_0_0.prosetCompoundMask = var_70_0

	var_70_0:registerScriptTouchHandler(function(arg_71_0, arg_71_1, arg_71_2)
		if arg_71_0 == CCTOUCHBEGAN then
			return true
		elseif arg_71_0 == CCTOUCHMOVED then
			return true
		elseif arg_71_0 == CCTOUCHENDED then
			if tool.checkIfTouch(var_0_0.uiTable.prosetCompoundBackground, arg_71_1, arg_71_2) then
				-- block empty
			else
				var_70_0:removeFromParentAndCleanup(true)
			end

			return true
		end
	end, false, true)
	var_70_0:setTouchEnabled(true)
	autoUI.createUI(var_70_0, getProsetCompoundBackground(arg_70_0), var_0_0.uiTable)
	var_0_0.uiTable.prosetCompoundBackground:setPosition(ccp(473, 315))
	smgr.getLayer("storeHouseLayer"):addChild(var_70_0, 60000)
end

function var_0_0.showSuitCompoundPanel(arg_72_0)
	local var_72_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_0_0.suitCompoundMask = var_72_0

	var_72_0:registerScriptTouchHandler(function(arg_73_0, arg_73_1, arg_73_2)
		if arg_73_0 == CCTOUCHBEGAN then
			return true
		elseif arg_73_0 == CCTOUCHMOVED then
			return true
		elseif arg_73_0 == CCTOUCHENDED then
			if tool.checkIfTouch(var_0_0.uiTable.suitCompoundBackground, arg_73_1, arg_73_2) then
				-- block empty
			else
				var_72_0:removeFromParentAndCleanup(true)
			end

			return true
		end
	end, false, true)
	var_72_0:setTouchEnabled(true)

	if var_0_0.uiTable.suitCompoundBackground then
		var_0_0.uiTable.suitCompoundBackground = nil
	end

	autoUI.createUI(var_72_0, getSuitCompoundBackground(arg_72_0), var_0_0.uiTable)

	local var_72_1 = var_0_0.uiTable.suitCompoundBackground
	local var_72_2 = var_0_0.createRequiredEquipLayer(arg_72_0)

	var_0_0.uiTable.suitCompoundLayer:addChild(var_72_2)
	var_72_1:setPosition(ccp(473, 315))
	smgr.getLayer("storeHouseLayer"):addChild(var_72_0, 60000)
end

function var_0_0.createRequiredEquipLayer(arg_74_0)
	local var_74_0 = {}

	for iter_74_0 = 1, #arg_74_0.suits do
		local var_74_1 = arg_74_0.suits[iter_74_0]

		var_74_0[iter_74_0] = autoUI.createUI(nil, getSuitEquipmentCell(var_74_1, iter_74_0), {})
	end

	local var_74_2 = 347
	local var_74_3 = 105
	local var_74_4 = 2

	return (SHCollectionView.createCollectionLayer(var_74_2, var_74_3, var_74_4, var_74_0))
end

function var_0_0.showTextureTextWithSprite(arg_75_0)
	local var_75_0 = arg_75_0
	local var_75_1 = visibleSize.width * 0.5
	local var_75_2 = visibleSize.height * 0.5

	var_75_0:setPosition(ccp(var_75_1, var_75_2 - 50))
	smgr.showTipSpriteText(var_75_0)
end

function var_0_0.showCompoundEffect(arg_76_0, arg_76_1)
	if var_0_0.upgradeAnimNode then
		pcall(var_0_0.upgradeAnimNode.removeFromParentAndCleanup, var_0_0.upgradeAnimNode, true)

		var_0_0.upgradeAnimNode = nil
	end

	local var_76_0 = rmgr.getAnimation("warlockUpgrade")
	local var_76_1 = CCAnimation:createWithSpriteFrames(var_76_0, 0.08)
	local var_76_2 = CCAnimate:create(var_76_1)
	local var_76_3 = CCRepeat:create(var_76_2, 1)
	local var_76_4 = CCSprite:create()

	var_0_0.upgradeAnimNode = var_76_4

	local var_76_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_76_5:registerScriptTouchHandler(function(arg_77_0, arg_77_1, arg_77_2)
		if arg_77_0 == CCTOUCHBEGAN then
			return true
		elseif arg_77_0 == CCTOUCHMOVED then
			return true
		elseif arg_77_0 == CCTOUCHENDED then
			arg_76_1()
			var_76_5:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_76_5:setTouchEnabled(true)
	var_76_5:addChild(var_76_4, 500)
	log.info("upgradeAnimNode added to background")

	local var_76_6 = visibleSize.width * 0.5
	local var_76_7 = visibleSize.height * 0.5

	var_76_4:setPosition(ccp(var_76_6, var_76_7))

	local var_76_8 = CCArray:create()

	local function var_76_9()
		if arg_76_1 then
			arg_76_1()
		end

		pcall(var_76_4.removeFromParentAndCleanup, var_76_4, true)

		var_76_4 = nil

		var_76_5:removeFromParentAndCleanup(true)
	end

	local function var_76_10()
		arg_76_0 = arg_76_0 or "res/ui/general/jailView/jail_upgr.png"

		local var_79_0 = CCSprite:create(arg_76_0)
		local var_79_1, var_79_2 = tool.getPositionInScreen(var_76_4)

		var_79_0:setPosition(ccp(var_79_1, var_79_2 - 50))
		smgr.showTipSpriteText(var_79_0)
	end

	smgr.rootLayer:addChild(var_76_5, 60000)
	var_76_8:addObject(var_76_3)
	var_76_8:addObject(CCCallFuncN:create(var_76_9))
	var_76_4:runAction(CCSequence:create(var_76_8))
	var_76_10()
end
