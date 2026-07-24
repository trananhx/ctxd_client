tool.requireRes("equipment/quenching")
require("lua/common/tool")
require("lua/layer/equipment/equipmentTipFrame")

equipmentQuenchingUI = {}
equipmentQuenchingUI.uiTable = {}

local var_0_0 = equipmentQuenchingControl
local var_0_1 = equipmentQuenchingUI
local var_0_2 = equipmentQuenchingConstant
local var_0_3 = 1

function equipmentQuenchingUI.show()
	local var_1_0 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_1_0, "quenchingLayer")

	if var_0_1.uiTable then
		var_0_1.uiTable = nil
	end

	var_0_1.ycelling = 115
	var_0_1.uiTable = autoUI.initUI(var_1_0, getQuenchingUIData())

	if user.needPoint then
		var_0_1.uiTable.kaiguangButton:setVisible(true)
	end

	var_1_0:registerScriptTouchHandler(var_0_0.onTouch)
	var_1_0:setTouchEnabled(true)
	var_0_1.uiTable.autoBuyBtn:registerScriptTapHandler(var_0_0.onAutoBuyBtnTouched)

	if not user.chargeItems.quenchingGold.noDisturb then
		var_0_1.uiTable.checkedBtn:setVisible(false)
	end

	var_0_0.quenchingOpenQuenching()
	var_0_0.quenchingGetEquips()

	var_1_0.onEnter = var_0_0.onEnter
	var_1_0.onExit = var_0_0.onExit

	require("lua/guide/control")

	guide.uiElementsTable[1019] = var_0_1.uiTable.freeQuenchingButton

	return var_1_0
end

local function var_0_4(arg_2_0)
	return math.ceil(arg_2_0 / 2)
end

local function var_0_5(arg_3_0)
	return (arg_3_0 - 1) * 2 + 1
end

function var_0_1.getBlockIndexRangeByPage(arg_4_0, arg_4_1)
	local var_4_0 = (arg_4_0 - 1) * 2 + 1
	local var_4_1 = var_4_0 + 1

	if arg_4_0 == math.ceil(#arg_4_1 / 2) then
		var_4_1 = #arg_4_1
	end

	return var_4_0, var_4_1
end

local function var_0_6(arg_5_0, arg_5_1)
	local var_5_0 = var_0_1.uiTable["quenchingCell" .. arg_5_1]

	if var_5_0 then
		local var_5_1 = 0

		if var_0_0.itemsData then
			if var_0_0.itemsData[arg_5_1].refreshAttribute then
				log.debug(var_0_0.itemsData[arg_5_1].refreshAttribute[1])

				var_5_1 = #var_0_0.itemsData[arg_5_1].refreshAttribute
			end

			local var_5_2 = var_0_1.createEquipmentStarLabel(var_5_1, var_0_0.itemsData[arg_5_1].maxSkillNum)

			var_5_2:setPosition(arg_5_0)
			log.debug("render star to cell at index :", arg_5_1)
			var_5_0:addChild(var_5_2)
		else
			log.debug("nil itemsData : ", itemsData)
		end
	else
		log.debug("nil cell at index :", arg_5_1)
	end
end

function var_0_1.createEquipmentStarLabel(arg_6_0, arg_6_1)
	local var_6_0 = CCLayer:create()
	local var_6_1 = arg_6_1 - arg_6_0

	for iter_6_0 = 1, arg_6_1 do
		local var_6_2 = {}

		if iter_6_0 <= arg_6_0 then
			var_6_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("star_light.png")
		else
			var_6_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("star_dark.png")
		end

		local var_6_3 = CCSprite:createWithSpriteFrame(var_6_2)

		var_6_3:setAnchorPoint(ccp(0, 0.5))
		var_6_3:setPosition(ccp(30 * (iter_6_0 - 1), 15))
		var_6_0:addChild(var_6_3)
	end

	return var_6_0
end

function var_0_1.renderOneBlock(arg_7_0, arg_7_1, arg_7_2)
	if var_0_1.uiTable["quenchingBlock" .. arg_7_2] then
		pcall(var_0_1.uiTable["quenchingBlock" .. arg_7_2].removeFromParentAndCleanup, var_0_1.uiTable["quenchingBlock" .. arg_7_2], true)

		var_0_1.uiTable["quenchingBlock" .. arg_7_2] = nil
	end

	local var_7_0 = CCLayerColor:create(ccc4(255, 255, 0, 0))

	log.debug("render one block render should begin")

	local var_7_1 = autoUI.renderList(var_0_1.uiTable, getQuenchingBlockData(arg_7_2), arg_7_1)

	var_7_0:addChild(var_7_1)
	var_7_0:setContentSize(CCSizeMake(534, 112))

	if arg_7_0 then
		arg_7_0:addChild(var_7_0)
	end

	var_7_0:setPositionY(var_0_1.scrollLayer:getContentSize().height - var_0_1.ycelling * arg_7_2)
	log.debug("block layer anchor point :", var_7_0:getAnchorPoint().y)
	log.debug("set begin at page :", arg_7_2)

	for iter_7_0 = var_0_5(arg_7_2), var_0_5(arg_7_2) + #arg_7_1 - 1 do
		if var_0_0.itemsData[iter_7_0].owner then
			var_0_6(ccp(110, 15), iter_7_0)
		else
			var_0_6(ccp(110, 23), iter_7_0)
		end
	end
end

function var_0_1.updateActivityProgressPanel()
	if var_0_0.totalPoint then
		if not var_0_1.uiTable.quenchingBackground then
			autoUI.createUI(var_0_1.uiTable.quenchingBackground, quenchingGetActivityProgressPanel(leftPanelData), var_0_1.uiTable)
		end

		var_0_1.uiTable.activityProgressBar:setPercentage(var_0_0.currentNum / var_0_0.totalPoint * 100)
		var_0_1.uiTable.quenchingRewardNumberLabel:setString(var_0_0.leftNum)
	end

	if var_0_0.freeNiubiTimes and var_0_0.freeNiubiTimes > 0 then
		log.info("freeNiubiTimes:", var_0_0.freeNiubiTimes)
		var_0_1.uiTable.freeNiubiTimesLabel:setVisible(true)
		var_0_1.uiTable.freeNiubiTimesLabel:setString(language.get(103038, var_0_0.freeNiubiTimes))
	else
		var_0_1.uiTable.freeNiubiTimesLabel:setVisible(false)
	end
end

function var_0_1.updateBlocksAtIndex(arg_9_0)
	log.info("updateBlocksAtIndex : ", arg_9_0)

	local var_9_0 = var_0_4(arg_9_0)

	if arg_9_0 == equipmentQuenchingUI.currentSelectedCellIndex then
		var_0_1.updateLeftPanel(arg_9_0)
	end

	var_0_1.renderOneBlock(var_0_1.scrollLayer, var_0_0.blocksData[var_9_0], var_9_0)
	var_0_1.uiTable["quenchingHighlightCell" .. equipmentQuenchingUI.currentSelectedCellIndex]:setVisible(true)
end

function var_0_1.updateBlocksFromIndex(arg_10_0)
	log.debug("updateBlocksFromIndex : ", arg_10_0)

	var_0_3 = var_0_4(arg_10_0) - 1

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end

	var_0_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(renderMoreBlock, 0, false)

	log.info("updateSchedulerEntry", var_0_0.updateSchedulerEntry)
end

local function var_0_7(arg_11_0, arg_11_1)
	local var_11_0 = CCScrollView:create(arg_11_1)
	local var_11_1 = CCLayerColor:create(ccc4(255, 0, 0, 0))

	var_11_1:setContentSize(CCSizeMake(arg_11_1.width, var_0_1.ycelling * #var_0_0.blocksData))

	for iter_11_0 = 1, #arg_11_0 do
		var_11_1:addChild(arg_11_0[iter_11_0])
		arg_11_0[iter_11_0]:setPositionY(var_11_1:getContentSize().height - var_0_1.ycelling * iter_11_0)
	end

	var_11_0:setContainer(var_11_1)
	var_11_0:setContentSize(var_11_1:getContentSize())
	var_11_0:setDirection(kCCScrollViewDirectionVertical)
	var_11_0:setBounceable(true)

	var_0_1.scrollLayer = var_11_1

	var_11_0:setContentOffset(ccp(0, arg_11_1.height - var_11_1:getContentSize().height))

	return var_11_0
end

function var_0_1.createListBlock(arg_12_0, arg_12_1)
	local var_12_0 = CCLayerColor:create(ccc4(0, 255, 255, 0))

	log.debug("create list block render should begin")

	local var_12_1 = autoUI.renderList(var_0_1.uiTable, getQuenchingBlockData(arg_12_1), arg_12_0)

	var_12_0:setContentSize(CCSizeMake(534, 112))
	var_12_0:addChild(var_12_1)

	for iter_12_0 = var_0_5(arg_12_1), var_0_5(arg_12_1) + #arg_12_0 - 1 do
		if var_0_0.itemsData[iter_12_0].owner then
			var_0_6(ccp(110, 15), iter_12_0)
		else
			var_0_6(ccp(110, 23), iter_12_0)
		end
	end

	return var_12_0
end

function var_0_1.renderMoreBlock()
	log.debug("renderMoreBlock currentRenderBlockIndex : ", var_0_3, ",block data count :", #var_0_0.blocksData)

	if var_0_3 < #var_0_0.blocksData then
		var_0_3 = var_0_3 + 1

		log.info("ui.scrollLayer will render more", var_0_1.scrollLayer)
		var_0_1.renderOneBlock(var_0_1.scrollLayer, var_0_0.blocksData[var_0_3], var_0_3)
	else
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
		log.info("ui.scrollLayer ", var_0_1.scrollLayer)

		if var_0_1.scrollLayer then
			var_0_1.scrollLayer:setContentSize(CCSizeMake(var_0_1.scrollLayer:getContentSize().width, var_0_1.ycelling * #var_0_0.blocksData))
		end

		if var_0_1.uiTable["quenchingBlock" .. var_0_3 + 1] then
			log.debug("should remove last block")
			pcall(var_0_1.uiTable["quenchingBlock" .. var_0_3 + 1].removeFromParentAndCleanup, var_0_1.uiTable["storageList" .. var_0_3 + 1], true)

			var_0_1.uiTable["quenchingBlock" .. var_0_3 + 1] = nil
		end
	end
end

function var_0_1.createItemListWithItems(arg_14_0)
	local var_14_0 = {}
	local var_14_1 = 4

	if var_14_1 > math.ceil(#arg_14_0 * 0.5) then
		var_14_1 = math.ceil(#arg_14_0 * 0.5)
	end

	for iter_14_0 = 1, var_14_1 do
		var_14_0[#var_14_0 + 1] = var_0_1.createListBlock(var_0_0.blocksData[iter_14_0], iter_14_0)
	end

	var_0_3 = var_14_1

	local var_14_2 = CCSizeMake(542, 405)

	var_0_1.scrollView = var_0_7(var_14_0, var_14_2)

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end

	var_0_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_1.renderMoreBlock, 0, false)

	log.info("updateSchedulerEntry", var_0_0.updateSchedulerEntry)
	var_0_1.scrollView:setPosition(ccp(12, 10))
	var_0_1.uiTable.quenchingBackground:addChild(var_0_1.scrollView)
end

function onQuenchingEquipmentButtonTap(arg_15_0)
	multiLangOffset = {}

	if conf.language == "vie" then
		multiLangOffset.frameWidth = 250
	else
		multiLangOffset.frameWidth = 0
	end

	local var_15_0, var_15_1 = tool.getPositionFromUpperNode(var_0_1.uiTable["itemButton" .. arg_15_0], var_0_1.scrollView)
	local var_15_2 = var_0_1.scrollView:getViewSize().height

	if var_15_2 < var_15_1 or var_15_1 < 0 then
		log.info("scrollview not  touched", var_15_0, var_15_1, var_15_2)

		return
	else
		log.info("scrollview not touched", var_15_0, var_15_1, var_15_2)
	end

	local var_15_3 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_15_3:registerScriptTouchHandler(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == CCTOUCHBEGAN then
			return true
		elseif arg_16_0 == CCTOUCHMOVED then
			return true
		elseif arg_16_0 == CCTOUCHENDED then
			var_15_3:removeFromParentAndCleanup(true)
			var_0_1.uiTable["itemHighlight" .. arg_15_0]:setVisible(false)

			return true
		end
	end, false, true)
	var_15_3:setTouchEnabled(true)
	var_0_1.uiTable["itemHighlight" .. arg_15_0]:setVisible(true)

	local var_15_4 = 0

	if var_0_0.itemsData[arg_15_0].refreshAttribute then
		var_15_4 = #var_0_0.itemsData[arg_15_0].refreshAttribute
	end

	local var_15_5 = CCSizeMake(288 + multiLangOffset.frameWidth, 219 + var_15_4 * 35)
	local var_15_6 = getEquipmentTipFrameData(var_15_5)

	autoUI.createUI(var_15_3, var_15_6, var_0_1.uiTable)

	local var_15_7, var_15_8 = tool.getPositionInScreen(var_0_1.uiTable["itemButton" .. arg_15_0])

	log.debug("button pos in screen : x" .. var_15_7 .. " y: " .. var_15_8)
	var_0_1.uiTable.TipEquipmentName:setString(var_0_0.itemsData[arg_15_0].name)

	local var_15_9 = var_0_0.itemsData[arg_15_0].type

	local function var_15_10()
		if var_15_9 == 5 or var_15_9 == 6 then
			return language.get(103003, var_0_0.itemsData[arg_15_0].attr)
		end

		if var_15_9 == 3 or var_15_9 == 4 then
			return language.get(103004, var_0_0.itemsData[arg_15_0].attr)
		end

		if var_15_9 == 1 or var_15_9 == 2 then
			return language.get(103005, var_0_0.itemsData[arg_15_0].attr)
		end

		return ""
	end

	var_0_1.uiTable.TipEquipmentEffect:setString(var_15_10())
	var_0_1.uiTable.TipEquipmentMaxLv:setString(language.get(103006, var_0_0.itemsData[arg_15_0].maxLv))
	var_0_1.uiTable.TipEquipmentPrice:setString(language.get(103007, var_0_0.itemsData[arg_15_0].copper))
	var_0_1.uiTable.TipEquipmentName:setColor(colorQuality[var_0_0.itemsData[arg_15_0].quality])

	local var_15_11 = var_0_1.createEquipmentStarLabel(var_15_4, var_0_0.itemsData[arg_15_0].maxSkillNum)

	var_15_11:setPosition(ccp(10, var_0_1.uiTable.equipmentTipFrame:getContentSize().height - 110))
	var_0_1.uiTable.equipmentTipFrame:addChild(var_15_11)

	local var_15_12

	if var_0_0.itemsData[arg_15_0].refreshAttribute then
		log.debug("render refresh attribute render should begin")

		local var_15_13 = autoUI.renderList(var_0_1.uiTable, getQuenchingUIData().attributeList, var_0_0.itemsData[arg_15_0].refreshAttribute)

		var_15_13:setPosition(ccp(0, var_0_1.uiTable.equipmentTipFrame:getContentSize().height - 160))
		var_0_1.uiTable.equipmentTipFrame:addChild(var_15_13)
	end

	log.debug("equipmentTipFrame:", equipmentTipFrame)

	if var_15_7 <= visibleSize.width * 0.5 and var_15_8 <= visibleSize.height * 0.5 then
		var_0_1.uiTable.equipmentTipFrame:setAnchorPoint(ccp(0, 0))
		var_0_1.uiTable.equipmentTipFrame:setPositionX(var_15_7 + 70)
		var_0_1.uiTable.equipmentTipFrame:setPositionY(var_15_8 - 40)
	elseif var_15_7 <= visibleSize.width * 0.5 and var_15_8 >= visibleSize.height * 0.5 then
		var_0_1.uiTable.equipmentTipFrame:setAnchorPoint(ccp(0, 1))
		var_0_1.uiTable.equipmentTipFrame:setPositionX(var_15_7 + 70)
		var_0_1.uiTable.equipmentTipFrame:setPositionY(var_15_8 + 40)
	elseif var_15_7 >= visibleSize.width * 0.5 and var_15_8 >= visibleSize.height * 0.5 then
		var_0_1.uiTable.equipmentTipFrame:setAnchorPoint(ccp(1, 1))
		var_0_1.uiTable.equipmentTipFrame:setPositionX(var_15_7 - 70)
		var_0_1.uiTable.equipmentTipFrame:setPositionY(var_15_8 + 40)
	elseif var_15_7 >= visibleSize.width * 0.5 and var_15_8 <= visibleSize.height * 0.5 then
		var_0_1.uiTable.equipmentTipFrame:setAnchorPoint(ccp(1, 0))
		var_0_1.uiTable.equipmentTipFrame:setPositionX(var_15_7 - 70)
		var_0_1.uiTable.equipmentTipFrame:setPositionY(var_15_8 - 40)
	end

	smgr.rootLayer:addChild(var_15_3, 60000)
end

function var_0_1.updateLeftPanel(arg_18_0, arg_18_1)
	log.info("should update left panel ")

	local var_18_0

	if arg_18_1 then
		var_18_0 = arg_18_1
	else
		var_18_0 = var_0_0.itemsData[arg_18_0]
	end

	if var_18_0.name == nil then
		return
	end

	log.debug("freeTimes:", var_0_0.freeTimes)
	var_0_1.uiTable.freeCountLabel:setString(language.get(103008, var_0_0.freeTimes))

	if var_0_0.freeNiubiTimes and var_0_0.freeNiubiTimes > 0 then
		log.info("freeNiubiTimes:", var_0_0.freeNiubiTimes)
		var_0_1.uiTable.freeNiubiTimesLabel:setVisible(true)
		var_0_1.uiTable.freeNiubiTimesLabel:setString(language.get(103038, var_0_0.freeNiubiTimes))
	else
		var_0_1.uiTable.freeNiubiTimesLabel:setVisible(false)
	end

	if arg_18_1 and arg_18_1.point then
		autoUI.createUI(var_0_1.uiTable.quenchingBackground, quenchingGetActivityProgressPanel(arg_18_1), var_0_1.uiTable)
		var_0_1.uiTable.activityProgressBar:setPercentage(arg_18_1.currentNum / arg_18_1.point * 100)
		var_0_1.uiTable.quenchingRewardNumberLabel:setString(arg_18_1.leftNum)
	end

	var_0_1.uiTable.equipmentName:setString(var_18_0.name)
	var_0_1.uiTable.equipmentName:setColor(colorQuality[var_18_0.quality])
	var_0_1.uiTable.equimentFrame:setDisplayFrame(CCSprite:create(picQualityFrame[var_18_0.quality]):displayFrame())
	var_0_1.uiTable.equipmentPic:setDisplayFrame(CCSprite:createWithSpriteFrameName(var_18_0.pic .. ".jpg"):displayFrame())

	if var_18_0.quality == 6 and #var_18_0.refreshAttribute == 3 and var_18_0.iron ~= 0 then
		var_0_1.uiTable.equipmentironNum:setVisible(true)
		var_0_1.uiTable.equipmentironNum:setString(language.get(20028, var_18_0.iron))
		var_0_1.uiTable.goldPriceIcon2:setVisible(true)
	else
		var_0_1.uiTable.equipmentironNum:setVisible(false)
		var_0_1.uiTable.goldPriceIcon2:setVisible(false)
	end

	if var_0_1.uiTable.leftPanelStarLabel then
		pcall(var_0_1.uiTable.leftPanelStarLabel.removeFromParentAndCleanup, var_0_1.uiTable.leftPanelStarLabel, true)
	end

	var_0_1.uiTable.leftPanelStarLabel = var_0_1.createEquipmentStarLabel(#var_18_0.refreshAttribute, var_18_0.maxSkillNum)

	var_0_1.uiTable.quenchingBackground:addChild(var_0_1.uiTable.leftPanelStarLabel)
	var_0_1.uiTable.leftPanelStarLabel:setAnchorPoint(ccp(0.5, 0.5))
	var_0_1.uiTable.leftPanelStarLabel:setPosition(ccp(720 - var_18_0.maxSkillNum * 10, 270))
	log.debug("will update skills")

	for iter_18_0 = 1, 4 do
		if iter_18_0 <= #var_18_0.refreshAttribute - 1 then
			var_0_1.uiTable["attributePic" .. iter_18_0]:setNormalImage(CCSprite:createWithSpriteFrameName(var_18_0.refreshAttribute[iter_18_0].skillPic .. ".jpg"))
			var_0_1.uiTable["attributePic" .. iter_18_0]:setSelectedImage(CCSprite:createWithSpriteFrameName(var_18_0.refreshAttribute[iter_18_0].skillPic .. ".jpg"))
			var_0_1.uiTable.recoverText:setVisible(false)

			if var_0_1.uiTable["attributeLabel" .. iter_18_0] and var_18_0.refreshAttribute[iter_18_0] then
				var_0_1.uiTable["attributeLabel" .. iter_18_0]:setVisible(true)
				var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("Lv." .. var_18_0.refreshAttribute[iter_18_0].attValue)

				if conf.language == "kr" and var_18_0.refreshAttribute[iter_18_0].attValue == 5 then
					var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("MAX")
				end
			elseif var_18_0.refreshAttribute[iter_18_0] then
				autoUI.createUI(var_0_1.uiTable.quenchingBackground, getAttributeLvLabel(iter_18_0), var_0_1.uiTable)
				var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("Lv." .. var_18_0.refreshAttribute[iter_18_0].attValue)

				if conf.language == "kr" and var_18_0.refreshAttribute[iter_18_0].attValue == 5 then
					var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("MAX")
				end

				var_0_1.uiTable["attributeLabel" .. iter_18_0]:setPosition(ccp(585 + 78 * (iter_18_0 - 1), 146))
			end
		elseif iter_18_0 == #var_18_0.refreshAttribute then
			if var_18_0.quality == 5 and #var_18_0.refreshAttribute == 3 then
				var_0_1.uiTable["attributePic" .. 4]:setNormalImage(CCSprite:createWithSpriteFrameName(var_18_0.refreshAttribute[iter_18_0].skillPic .. ".jpg"))
				var_0_1.uiTable["attributePic" .. 4]:setSelectedImage(CCSprite:createWithSpriteFrameName(var_18_0.refreshAttribute[iter_18_0].skillPic .. ".jpg"))
				var_0_1.uiTable.recoverText:setVisible(false)
				var_0_1.uiTable["attributePic" .. iter_18_0]:setNormalImage(CCSprite:createWithSpriteFrameName("equipmentQuenchingView_background_skill.png"))
				var_0_1.uiTable["attributePic" .. iter_18_0]:setSelectedImage(CCSprite:createWithSpriteFrameName("equipmentQuenchingView_background_skill.png"))

				if var_0_1.uiTable["attributeLabel" .. iter_18_0] then
					var_0_1.uiTable["attributeLabel" .. iter_18_0]:setVisible(false)
				end

				if var_0_1.uiTable["attributeLabel" .. 4] then
					var_0_1.uiTable["attributeLabel" .. 4]:setVisible(true)
					var_0_1.uiTable["attributeLvLabel" .. 4]:setString("Lv." .. var_18_0.refreshAttribute[iter_18_0].attValue)
					log.info("item.refreshAttribute[i].attValue:", var_18_0.refreshAttribute[iter_18_0].attValue)
				else
					autoUI.createUI(var_0_1.uiTable.quenchingBackground, getAttributeLvLabel(4), var_0_1.uiTable)
					var_0_1.uiTable["attributeLvLabel" .. 4]:setString("Lv." .. var_18_0.refreshAttribute[iter_18_0].attValue)
					var_0_1.uiTable["attributeLabel" .. 4]:setPosition(ccp(844, 146))
				end
			else
				var_0_1.uiTable["attributePic" .. iter_18_0]:setNormalImage(CCSprite:createWithSpriteFrameName(var_18_0.refreshAttribute[iter_18_0].skillPic .. ".jpg"))
				var_0_1.uiTable["attributePic" .. iter_18_0]:setSelectedImage(CCSprite:createWithSpriteFrameName(var_18_0.refreshAttribute[iter_18_0].skillPic .. ".jpg"))
				var_0_1.uiTable.recoverText:setVisible(false)

				if var_0_1.uiTable["attributeLabel" .. iter_18_0] then
					var_0_1.uiTable["attributeLabel" .. iter_18_0]:setVisible(true)
					var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("Lv." .. var_18_0.refreshAttribute[iter_18_0].attValue)

					if conf.language == "kr" and var_18_0.refreshAttribute[iter_18_0].attValue == 5 then
						var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("MAX")
					end
				else
					autoUI.createUI(var_0_1.uiTable.quenchingBackground, getAttributeLvLabel(iter_18_0), var_0_1.uiTable)
					var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("Lv." .. var_18_0.refreshAttribute[iter_18_0].attValue)

					if conf.language == "kr" and var_18_0.refreshAttribute[iter_18_0].attValue == 5 then
						var_0_1.uiTable["attributeLvLabel" .. iter_18_0]:setString("MAX")
					end

					var_0_1.uiTable["attributeLabel" .. iter_18_0]:setPosition(ccp(585 + 78 * (iter_18_0 - 1), 146))

					if iter_18_0 == 4 then
						var_0_1.uiTable["attributeLabel" .. iter_18_0]:setPosition(ccp(585 + 78 * (iter_18_0 - 1) + 25, 146))
					end
				end
			end
		elseif iter_18_0 <= 3 then
			var_0_1.uiTable["attributePic" .. iter_18_0]:setNormalImage(CCSprite:createWithSpriteFrameName("equipmentQuenchingView_background_skill.png"))
			var_0_1.uiTable["attributePic" .. iter_18_0]:setSelectedImage(CCSprite:createWithSpriteFrameName("equipmentQuenchingView_background_skill.png"))

			if var_0_1.uiTable["attributeLabel" .. iter_18_0] then
				var_0_1.uiTable["attributeLabel" .. iter_18_0]:setVisible(false)
			end
		elseif iter_18_0 == 4 and (var_18_0.quality ~= 5 or #var_18_0.refreshAttribute ~= 3) then
			var_0_1.uiTable.recoverText:setVisible(true)
			var_0_1.uiTable["attributePic" .. iter_18_0]:setNormalImage(CCSprite:createWithSpriteFrameName("equipmentQuenchingView_button_recover_normal.png"))
			var_0_1.uiTable["attributePic" .. iter_18_0]:setSelectedImage(CCSprite:createWithSpriteFrameName("equipmentQuenchingView_button_recover_pressed.png"))

			if var_0_1.uiTable["attributeLabel" .. iter_18_0] then
				var_0_1.uiTable["attributeLabel" .. iter_18_0]:setVisible(false)
			end
		end

		log.debug("did update skill " .. iter_18_0, "at index:", arg_18_0)
	end

	showTable(var_18_0.canSuit)

	if var_18_0.canSuit and #var_18_0.canSuit > 0 then
		log.info("can suit ")
		showTable(var_18_0.canSuit)
		var_0_1.uiTable.equipmentCanSuitGrayPic:setVisible(false)
		var_0_1.uiTable.equipmentCanSuitPic:setVisible(true)

		var_0_1.canSuitData = var_18_0.canSuit
	else
		var_0_1.uiTable.equipmentCanSuitGrayPic:setVisible(true)
		var_0_1.uiTable.equipmentCanSuitPic:setVisible(false)

		var_0_1.canSuitData = nil
	end
end

function var_0_1.setEmptyView()
	var_0_1.uiTable.emptyTip:setVisible(true)
end

function var_0_1.getFireEffectSpriteFrames()
	return rmgr.getAnimation("hammer")
end

function var_0_1.getExplodeEffectSpriteFrames()
	if var_0_1.explodeAnim then
		return var_0_1.explodeAnim
	else
		local var_21_0 = 12
		local var_21_1 = CCArray:create()

		for iter_21_0 = 1, var_21_0 do
			local var_21_2 = "equipmentQuenchingView_explodeEffect_" .. iter_21_0 .. ".png"
			local var_21_3 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_21_2)

			log.debug("fire frame :", var_21_2, var_21_3)
			var_21_1:addObject(var_21_3)
		end

		var_21_1:retain()

		var_0_1.explodeAnim = var_21_1

		return var_21_1
	end
end

function var_0_1.showExplodeEffect(arg_22_0)
	local var_22_0 = {}
	local var_22_1 = var_0_0.itemsData[var_0_1.currentSelectedCellIndex]

	for iter_22_0 = 1, #var_22_1.refreshAttribute do
		local var_22_2 = var_0_1.getExplodeEffectSpriteFrames()
		local var_22_3 = CCAnimation:createWithSpriteFrames(var_22_2, 0.1)
		local var_22_4 = CCAnimate:create(var_22_3)
		local var_22_5 = CCRepeat:create(var_22_4, 1)

		var_22_0[iter_22_0] = CCSprite:create()

		var_0_1.uiTable.quenchingBackground:addChild(var_22_0[iter_22_0], 500)
		log.debug("explodeAnimNodes[i] added to background")
		var_22_0[iter_22_0]:setPosition(ccp(609 + 78 * (iter_22_0 - 1), 196))

		if iter_22_0 == 4 or var_22_1.quality == 5 and iter_22_0 == 3 then
			var_22_0[iter_22_0]:setPosition(ccp(868, 196))
		end

		local var_22_6 = CCArray:create()

		var_22_6:addObject(var_22_5)
		var_22_6:addObject(CCCallFuncN:create(function()
			var_0_1.uiTable.quenchingBackground:removeChild(var_22_0[iter_22_0], true)
			log.info("quenching end : at ", iter_22_0)

			if iter_22_0 == #var_22_1.refreshAttribute and arg_22_0 then
				arg_22_0()
			end
		end))
		log.info("explode Effect start at :", iter_22_0)
		var_22_0[iter_22_0]:runAction(CCSequence:create(var_22_6))
	end
end

function var_0_1.showFireEffect(arg_24_0)
	local var_24_0 = rmgr.getAnimation("fireEffect")
	local var_24_1 = CCAnimation:createWithSpriteFrames(var_24_0, 0.1)
	local var_24_2 = CCAnimate:create(var_24_1)
	local var_24_3 = CCRepeat:create(var_24_2, 1)
	local var_24_4 = CCSprite:create()

	var_0_1.fireAnimNode = var_24_4

	var_0_1.uiTable.quenchingBackground:addChild(var_24_4, 500)
	log.info("fireAnimNode added to background")
	var_24_4:setPosition(ccp(732, 358))

	local var_24_5 = CCArray:create()

	var_24_5:addObject(var_24_3)

	local function var_24_6()
		var_0_1.uiTable.quenchingBackground:removeChild(var_24_4, true)
	end

	var_24_5:addObject(CCCallFuncN:create(var_24_6))
	var_24_5:addObject(CCCallFuncN:create(arg_24_0))
	var_24_4:runAction(CCSequence:create(var_24_5))
end

function var_0_1.showAttributeTip(arg_26_0)
	local var_26_0 = {}

	if conf.language == "vie" then
		var_26_0.tipFrameW = 100
	else
		var_26_0.tipFrameW = 0
	end

	local var_26_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_26_1:registerScriptTouchHandler(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == CCTOUCHBEGAN then
			return true
		elseif arg_27_0 == CCTOUCHMOVED then
			return true
		elseif arg_27_0 == CCTOUCHENDED then
			var_26_1:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_26_1:setTouchEnabled(true)
	autoUI.createUI(var_26_1, getAttributeTipFrameData(CCSizeMake(150 + var_26_0.tipFrameW, 70)), var_0_1.uiTable)

	local var_26_2 = var_0_0.itemsData[var_0_1.currentSelectedCellIndex].refreshAttribute[arg_26_0]

	var_0_1.uiTable.attributeTipLabel:setString(var_26_2.attrName .. "\n" .. var_26_2.attIntro)

	local var_26_3, var_26_4 = tool.getPositionInScreen(var_0_1.uiTable["attributePic" .. arg_26_0])

	var_0_1.uiTable.attributeTipFrame:setPosition(ccp(var_26_3 + 50, var_26_4 - 50))
	smgr.rootLayer:addChild(var_26_1, 60000)
end

function var_0_1.showCanSuitTip(arg_28_0)
	local var_28_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_28_0:registerScriptTouchHandler(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == CCTOUCHBEGAN then
			return true
		elseif arg_29_0 == CCTOUCHMOVED then
			return true
		elseif arg_29_0 == CCTOUCHENDED then
			var_28_0:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_28_0:setTouchEnabled(true)
	autoUI.createUI(var_28_0, getCanSuitTipFrameData(arg_28_0), var_0_1.uiTable)

	local var_28_1, var_28_2 = tool.getPositionInScreen(var_0_1.uiTable.equipmentPic)

	var_0_1.uiTable.canSuitTipFrame:setPosition(ccp(var_28_1 - 50, var_28_2))
	smgr.rootLayer:addChild(var_28_0, 60000)
end

function var_0_1.showRestoreTip(arg_30_0)
	local var_30_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_30_0:registerScriptTouchHandler(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == CCTOUCHBEGAN then
			return true
		elseif arg_31_0 == CCTOUCHMOVED then
			return true
		elseif arg_31_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_30_0:setTouchEnabled(true)

	local var_30_1 = messageBox.createMessageBox("", language.get(103010), {
		{
			text = language.get(10001),
			callBack = function()
				var_30_0:removeAllChildrenWithCleanup(true)
				var_30_0:removeFromParentAndCleanup(true)
				var_0_0.quenchingRestoreSpecial()
			end
		},
		{
			text = language.get(10002),
			callBack = function()
				var_30_0:removeAllChildrenWithCleanup(true)
				var_30_0:removeFromParentAndCleanup(true)
			end
		}
	})
	local var_30_2 = {}

	for iter_30_0 = 1, arg_30_0.num do
		var_30_2[iter_30_0] = CCSprite:createWithSpriteFrameName(arg_30_0.skillPic .. ".jpg")

		var_30_1:addChild(var_30_2[iter_30_0])

		if arg_30_0.num == 3 then
			var_30_2[iter_30_0]:setPosition(ccp(83 + iter_30_0 * 93.33, 150))
		else
			var_30_2[iter_30_0]:setPosition(ccp(83 + iter_30_0 * 70, 150))
		end
	end

	var_30_0:addChild(var_30_1)
	smgr.rootLayer:addChild(var_30_0, 60000)
end

function var_0_1.shakeQuenchingIcon(arg_34_0)
	var_0_1.uiTable.quenchingRewardIcon:setPosition(ccp(170, 30))

	if var_0_1.uiTable.quenchingRewardIcon then
		var_0_1.uiTable.quenchingRewardIcon:stopAllActions()

		if arg_34_0 then
			local var_34_0 = CCArray:create()

			var_34_0:addObject(CCMoveBy:create(0.1, ccp(0, 7)))
			var_34_0:addObject(CCMoveBy:create(0.1, ccp(0, -13)))
			var_34_0:addObject(CCMoveBy:create(0.1, ccp(0, 11)))
			var_34_0:addObject(CCMoveBy:create(0.1, ccp(0, -9)))
			var_34_0:addObject(CCMoveBy:create(0.1, ccp(0, 7)))
			var_34_0:addObject(CCMoveBy:create(0.1, ccp(0, -3)))
			var_34_0:addObject(CCDelayTime:create(3))

			local var_34_1 = CCRepeatForever:create(tolua.cast(CCSequence:create(var_34_0), "CCActionInterval"))

			var_0_1.uiTable.quenchingRewardIcon:runAction(var_34_1)
		else
			var_0_1.uiTable.quenchingRewardIcon:stopAllActions()
		end
	end
end

function var_0_1.showNiubiTimesAddEffect()
	local var_35_0 = "res/ui/equip/quenching/niubiTimes_addUp_pic.png"
	local var_35_1 = CCSprite:create(var_35_0)
	local var_35_2 = visibleSize.width * 0.5
	local var_35_3 = visibleSize.height * 0.5

	var_35_1:setPosition(ccp(var_35_2, var_35_3 - 50))
	smgr.showTipSpriteText(var_35_1)
end

function var_0_1.doQuenchingEquipment(arg_36_0)
	var_0_0.quenchingEquipment(arg_36_0, var_0_1.currentSelectedCellIndex)
end
