tool.requireRes("equipment/storage")
require("lua/component/timerLabel")
require("lua/common/tool")
require("lua/layer/equipment/equipmentTipFrame")

storageUI = {}
storageUI.uiTable = {}
storageUI.timerLabels = {}

local var_0_0 = storageUI
local var_0_1 = storageControl
local var_0_2 = {}
local var_0_3 = 1
local var_0_4 = 265

function storageUI.show(arg_1_0)
	local var_1_0

	rmgr.loadTable(storageConstant.RES)

	if storageUI.uiTable then
		storageUI.uiTable = nil
	end

	var_0_3 = 1

	if var_0_1.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_1.updateSchedulerEntry)
	end

	var_0_2 = arg_1_0

	if arg_1_0 then
		var_1_0 = createBaseLayer()

		smgr.registerLayer(var_1_0, "buyBackLayer")

		storageUI.uiTable = autoUI.initUI(var_1_0, getStorageData())

		log.info("ui.uiTable[storageBackground]", var_0_0.uiTable.storageBackground)
		var_0_1.storageGetBuyBackItems()
	else
		log.debug("init when not buyback")

		var_1_0 = createBaseLayer()

		smgr.registerLayer(var_1_0, "storageLayer")

		storageUI.uiTable = autoUI.initUI(var_1_0, getStorageData())

		log.info("ui.uiTable[storageBackground]", var_0_0.uiTable.storageBackground)
		autoUI.createUI(storageUI.uiTable.storageBackground, getStorageButtonData(), storageUI.uiTable)
		var_0_1.storageGetItems()
		log.debug("control.storageGetItems: ", var_0_2)
	end

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	return var_1_0
end

local function var_0_5(arg_2_0)
	return math.ceil(arg_2_0 / 3)
end

local function var_0_6(arg_3_0)
	return (arg_3_0 - 1) * 3 + 1
end

local function var_0_7(arg_4_0, arg_4_1)
	local var_4_0 = (arg_4_0 - 1) * 3 + 1
	local var_4_1 = var_4_0 + 2

	if arg_4_0 == math.ceil(#arg_4_1 / 3) then
		var_4_1 = #arg_4_1
	end

	return var_4_0, var_4_1
end

function var_0_0.createEquipmentStarLabel(arg_5_0, arg_5_1)
	local var_5_0 = CCLayer:create()
	local var_5_1 = arg_5_1 - arg_5_0

	for iter_5_0 = 1, arg_5_1 do
		local var_5_2 = {}

		if iter_5_0 <= arg_5_0 then
			var_5_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("star_light.png")
		else
			var_5_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("star_dark.png")
		end

		local var_5_3 = CCSprite:createWithSpriteFrame(var_5_2)

		var_5_3:setAnchorPoint(ccp(0, 0.5))
		var_5_3:setPosition(ccp(30 * (iter_5_0 - 1), 15))
		var_5_0:addChild(var_5_3)
	end

	return var_5_0
end

function createEquipmentStorageListBlock(arg_6_0, arg_6_1)
	log.debug("items number: ", #arg_6_0)

	local var_6_0 = CCSprite:createWithSpriteFrameName("equipmentStorageView-h-cell-background.png")

	log.debug("createEquipmentStorageListBlock isBuyBack:", var_0_2)

	local var_6_1 = autoUI.renderList(storageUI.uiTable, getSotrageListData(arg_6_1, var_0_2), arg_6_0)

	var_6_0:setContentSize(CCSizeMake(261, 450))

	local var_6_2 = 450 - #arg_6_0 * 150

	var_6_1:setPositionY(var_6_2)
	var_6_0:addChild(var_6_1)
	log.debug("storageListBlock position :", var_6_1:getPositionX(), var_6_1:getPositionY(), " anchorPoint:", var_6_1:getAnchorPoint().x, var_6_1:getAnchorPoint().y)

	return var_6_0
end

function storageUI.renderOneBlock(arg_7_0, arg_7_1, arg_7_2)
	if storageUI.uiTable["storageList" .. arg_7_2] then
		pcall(storageUI.uiTable["storageList" .. arg_7_2].removeFromParentAndCleanup, storageUI.uiTable["storageList" .. arg_7_2], true)

		storageUI.uiTable["storageList" .. arg_7_2] = nil
	end

	local var_7_0

	if var_0_0.uiTable["storageList" .. arg_7_2] then
		var_7_0 = CCSprite:create()
	else
		var_7_0 = CCSprite:createWithSpriteFrameName("equipmentStorageView-h-cell-background.png")
	end

	local var_7_1 = autoUI.renderList(storageUI.uiTable, getSotrageListData(arg_7_2, var_0_2), arg_7_1)

	var_7_0:setContentSize(CCSizeMake(261, 450))

	local var_7_2 = 450 - #arg_7_1 * 150

	var_7_1:setPositionY(var_7_2)
	var_7_0:addChild(var_7_1)

	local var_7_3 = 265

	arg_7_0:addChild(var_7_0)
	var_7_0:setAnchorPoint(ccp(0, 0))
	var_7_0:setPositionX(var_7_3 * (arg_7_2 - 1))

	if var_0_2 then
		storageUI.uiTable.storageStatus:setString("回购: " .. #var_0_1.itemsData)

		for iter_7_0 = var_0_6(arg_7_2), var_0_6(arg_7_2) + #arg_7_1 - 1 do
			local var_7_4 = storageUI.uiTable["storageCell" .. iter_7_0]

			storageUI.addTimerLabelToCell(var_7_4, iter_7_0, var_0_1.itemsData[iter_7_0].limitTime)
		end
	else
		log.debug("set storageStatus begin at page :", arg_7_2)
		storageUI.uiTable.storageStatus:setString(#var_0_1.itemsData .. "/" .. var_0_1.maxSize)

		for iter_7_1 = var_0_6(arg_7_2), var_0_6(arg_7_2) + #arg_7_1 - 1 do
			if var_0_1.itemsData[iter_7_1].kind == 1 then
				addStarsToCell(ccp(103, 53), iter_7_1)
			end
		end
	end
end

local function var_0_8()
	if var_0_3 < #var_0_1.blocksData then
		var_0_3 = var_0_3 + 1

		storageUI.renderOneBlock(storageUI.scrollLayer, var_0_1.blocksData[var_0_3], var_0_3)
	else
		if var_0_1.updateSchedulerEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_1.updateSchedulerEntry)

			var_0_1.updateSchedulerEntry = nil
		end

		storageUI.scrollLayer:setContentSize(CCSizeMake(var_0_4 * #var_0_1.blocksData, storageUI.scrollLayer:getContentSize().height))

		if storageUI.uiTable["storageList" .. var_0_3 + 1] then
			log.info("should remove last block")
			pcall(storageUI.uiTable["storageList" .. var_0_3 + 1].removeFromParentAndCleanup, storageUI.uiTable["storageList" .. var_0_3 + 1], true)

			storageUI.uiTable["storageList" .. var_0_3 + 1] = nil
		end
	end
end

local function var_0_9(arg_9_0, arg_9_1)
	log.debug("blocks number: ", #arg_9_0)

	local var_9_0 = CCScrollView:create(arg_9_1)
	local var_9_1 = CCLayerColor:create(ccc4(255, 0, 0, 0))
	local var_9_2 = 0

	var_9_1:setContentSize(CCSizeMake(var_0_4 * #var_0_1.blocksData + var_9_2, arg_9_1.height))

	for iter_9_0 = 1, #arg_9_0 do
		var_9_1:addChild(arg_9_0[iter_9_0])
		arg_9_0[iter_9_0]:setAnchorPoint(ccp(0, 0))
		arg_9_0[iter_9_0]:setPositionX(var_9_2)

		var_9_2 = var_9_2 + var_0_4
	end

	var_9_0:setContentSize(var_9_1:getContentSize())
	var_9_0:setContainer(var_9_1)
	var_9_0:setDirection(kCCScrollViewDirectionHorizontal)

	storageUI.scrollLayer = var_9_1

	return var_9_0
end

function var_0_0.updateBlocksAtIndex(arg_10_0)
	log.info("updateBlocksAtIndex : ", var_0_0.currentSelectedCellIndex)

	local var_10_0 = var_0_5(arg_10_0)

	var_0_0.renderOneBlock(var_0_0.scrollLayer, var_0_1.blocksData[var_10_0], var_10_0)
end

function storageUI.updateBlocksFromIndex(arg_11_0)
	log.debug("updateBlocksFromIndex : ", arg_11_0)

	var_0_3 = var_0_5(arg_11_0) - 1

	if var_0_1.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_1.updateSchedulerEntry)
	end

	var_0_1.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_8, 0, false)
end

function storageUI.addTimerLabelToCell(arg_12_0, arg_12_1, arg_12_2)
	log.debug("timer label limitTime : ", arg_12_2)

	local var_12_0 = createTimerLabel(arg_12_2, "@H:@M:@S", "Thonburi-Bold", 18, var_0_1.storageGetBuyBackItems)

	storageUI.timerLabels[arg_12_1] = var_12_0

	arg_12_0:addChild(var_12_0)
	var_12_0:setPosition(170, 85)
end

function equipmentStorageShowTips(arg_13_0, arg_13_1)
	local var_13_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_13_0:registerScriptTouchHandler(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == CCTOUCHBEGAN then
			return true
		elseif arg_14_0 == CCTOUCHMOVED then
			return true
		elseif arg_14_0 == CCTOUCHENDED then
			var_13_0:removeFromParentAndCleanup(true)
			storageUI.uiTable["itemHighlight" .. arg_13_0]:setVisible(false)

			return true
		end
	end, false, true)
	var_13_0:setTouchEnabled(true)
	storageUI.uiTable["itemHighlight" .. arg_13_0]:setVisible(true)

	local var_13_1
	local var_13_2
	local var_13_3
	local var_13_4, var_13_5 = tool.getPositionInScreen(storageUI.uiTable["itemButton" .. arg_13_0])

	if arg_13_1 == 1 then
		local var_13_6 = 0

		if var_0_1.itemsData[arg_13_0].refreshAttribute then
			var_13_6 = #var_0_1.itemsData[arg_13_0].refreshAttribute
		end

		local var_13_7 = CCSizeMake(288, 219 + var_13_6 * 35)
		local var_13_8 = getEquipmentTipFrameData(var_13_7)

		autoUI.createUI(var_13_0, var_13_8, storageUI.uiTable)

		var_13_3 = storageUI.uiTable.equipmentTipFrame

		storageUI.uiTable.TipEquipmentName:setString(var_0_1.itemsData[arg_13_0].itemName)

		local var_13_9 = var_0_1.itemsData[arg_13_0].type

		local function var_13_10()
			if var_13_9 == 5 or var_13_9 == 6 then
				return "带兵上限+" .. var_0_1.itemsData[arg_13_0].attribute
			end

			if var_13_9 == 3 or var_13_9 == 4 then
				return "防御+" .. var_0_1.itemsData[arg_13_0].attribute
			end

			if var_13_9 == 1 or var_13_9 == 2 then
				return "攻击+" .. var_0_1.itemsData[arg_13_0].attribute
			end

			return ""
		end

		storageUI.uiTable.TipEquipmentEffect:setString(var_13_10())
		storageUI.uiTable.TipEquipmentMaxLv:setString("洗炼上限: Lv." .. var_0_1.itemsData[arg_13_0].maxLv)
		storageUI.uiTable.TipEquipmentPrice:setString("出售价格: " .. var_0_1.itemsData[arg_13_0].copper .. " 银币")
		storageUI.uiTable.TipEquipmentName:setColor(colorQuality[var_0_1.itemsData[arg_13_0].quality])

		local var_13_11 = var_0_0.createEquipmentStarLabel(var_13_6, var_0_1.itemsData[arg_13_0].maxSkillNum)

		var_13_11:setPosition(ccp(10, var_13_3:getContentSize().height - 110))
		var_13_3:addChild(var_13_11)

		local var_13_12

		if var_0_1.itemsData[arg_13_0].refreshAttribute then
			local var_13_13 = autoUI.renderList(storageUI.uiTable, getStoreData().attributeList, var_0_1.itemsData[arg_13_0].refreshAttribute)

			var_13_13:setPosition(ccp(0, var_13_3:getContentSize().height - 160))
			var_13_3:addChild(var_13_13)
		end
	elseif arg_13_1 == 3 then
		local var_13_14 = CCSizeMake(350, 150)
		local var_13_15 = getItemTipFrameData(var_13_14)

		autoUI.createUI(var_13_0, var_13_15, storageUI.uiTable)

		var_13_3 = storageUI.uiTable.itemTipFrame

		storageUI.uiTable.TipItemName:setString(var_0_1.itemsData[arg_13_0].itemName)
		storageUI.uiTable.TipItemIntro:setString("统+" .. var_0_1.itemsData[arg_13_0].att1 .. " 勇+" .. var_0_1.itemsData[arg_13_0].att2)
		storageUI.uiTable.TipItemPrice:setString("出售价格: " .. var_0_1.itemsData[arg_13_0].copper .. " 银币")

		local var_13_16 = storageUI.uiTable.TipItemPrice:getContentSize().width + 20

		storageUI.uiTable.TipItemName:setContentSize(CCSizeMake(var_13_16 - 40, storageUI.uiTable.TipItemName:getContentSize().height))

		if var_0_1.itemsData[arg_13_0].quality then
			storageUI.uiTable.TipItemName:setColor(colorQuality[var_0_1.itemsData[arg_13_0].quality])
		end

		local var_13_17 = CCSizeMake(var_13_16 + 20, var_13_14.height)

		var_13_3:setPreferredSize(var_13_17)
		storageUI.uiTable.TipItemName:setPositionX(var_13_17.width * 0.5)
		storageUI.uiTable.TipItemName:setPositionY(var_13_17.height - 25)
	elseif arg_13_1 == 2 then
		local var_13_18 = var_0_1.itemsData[arg_13_0]
		local var_13_19 = CCSizeMake(280, 280)
		local var_13_20 = getGemTipFrameData(var_13_18, var_13_19)

		autoUI.createUI(var_13_0, var_13_20, storageUI.uiTable)

		var_13_3 = storageUI.uiTable.gemTipFrame
	elseif arg_13_1 == 10 then
		local var_13_21 = var_0_1.itemsData[arg_13_0]
		local var_13_22 = CCSizeMake(280, 180)
		local var_13_23 = getSuitTipFrameData(var_13_21, var_13_22)

		autoUI.createUI(var_13_0, var_13_23, storageUI.uiTable)

		var_13_3 = storageUI.uiTable.suitTipFrame
	else
		local var_13_24 = CCSizeMake(350, 150)
		local var_13_25 = getItemTipFrameData(var_13_24)

		autoUI.createUI(var_13_0, var_13_25, storageUI.uiTable)

		var_13_3 = storageUI.uiTable.itemTipFrame

		storageUI.uiTable.TipItemName:setString(var_0_1.itemsData[arg_13_0].itemName)
		storageUI.uiTable.TipItemIntro:setString(var_0_1.itemsData[arg_13_0].intro)
		storageUI.uiTable.TipItemPrice:setString("出售价格: " .. var_0_1.itemsData[arg_13_0].copper .. " 银币")

		local var_13_26 = storageUI.uiTable.TipItemIntro:getContentSize().width + 20
		local var_13_27 = CCSizeMake(var_13_26 + 20, var_13_24.height)

		var_13_3:setPreferredSize(var_13_27)
		storageUI.uiTable.TipItemName:setContentSize(CCSizeMake(var_13_26 - 20, storageUI.uiTable.TipItemName:getContentSize().height))
		storageUI.uiTable.TipItemName:setPositionX(var_13_27.width * 0.5)
		storageUI.uiTable.TipItemName:setPositionY(var_13_27.height - 25)

		if var_0_1.itemsData[arg_13_0].quality then
			storageUI.uiTable.TipItemName:setColor(colorQuality[var_0_1.itemsData[arg_13_0].quality])
		end
	end

	if var_13_4 <= visibleSize.width * 0.5 and var_13_5 <= visibleSize.height * 0.5 then
		var_13_3:setAnchorPoint(ccp(0, 0))
		var_13_3:setPositionX(var_13_4 + 70)
		var_13_3:setPositionY(var_13_5 - 40)
	elseif var_13_4 <= visibleSize.width * 0.5 and var_13_5 >= visibleSize.height * 0.5 then
		var_13_3:setAnchorPoint(ccp(0, 1))
		var_13_3:setPositionX(var_13_4 + 70)
		var_13_3:setPositionY(var_13_5 + 40)
	elseif var_13_4 >= visibleSize.width * 0.5 and var_13_5 >= visibleSize.height * 0.5 then
		var_13_3:setAnchorPoint(ccp(1, 1))
		var_13_3:setPositionX(var_13_4 - 70)
		var_13_3:setPositionY(var_13_5 + 40)
	elseif var_13_4 >= visibleSize.width * 0.5 and var_13_5 <= visibleSize.height * 0.5 then
		var_13_3:setAnchorPoint(ccp(1, 0))
		var_13_3:setPositionX(var_13_4 - 70)
		var_13_3:setPositionY(var_13_5 - 40)
	end

	smgr.rootLayer:addChild(var_13_0, 60000)
end

function updateEquipmentStorageList(arg_16_0)
	local var_16_0 = storageUI.uiTable.storageBackground

	if var_0_0.scrollLayer then
		pcall(var_0_0.scrollLayer.removeFromParentAndCleanup, var_0_0.scrollLayer, true)
	end

	log.debug("set storageStatus begin ")
	log.info("set storageStatus begin :", storageUI.uiTable.storageStatus)

	if var_0_2 then
		storageUI.uiTable.storageStatus:setString("回购: " .. #arg_16_0)
	else
		storageUI.uiTable.storageStatus:setString(#arg_16_0 .. "/" .. var_0_1.maxSize)
	end

	local var_16_1 = {}
	local var_16_2 = {}
	local var_16_3 = math.ceil(#arg_16_0 / 3)
	local var_16_4 = 4

	if var_16_3 < var_16_4 then
		var_16_4 = var_16_3
	end

	for iter_16_0 = 1, var_16_4 do
		local var_16_5 = {}
		local var_16_6, var_16_7 = var_0_7(iter_16_0, arg_16_0)

		for iter_16_1 = var_16_6, var_16_7 do
			log.info("index : ", iter_16_1, "items count :", #arg_16_0)

			arg_16_0[iter_16_1].page = iter_16_0
			var_16_5[#var_16_5 + 1] = arg_16_0[iter_16_1]
		end

		var_16_1[#var_16_1 + 1] = createEquipmentStorageListBlock(var_16_5, iter_16_0)
		var_0_3 = iter_16_0

		for iter_16_2 = var_16_6, var_16_7 do
			if var_0_2 then
				local var_16_8 = storageUI.uiTable["storageCell" .. iter_16_2]

				storageUI.addTimerLabelToCell(var_16_8, iter_16_2, arg_16_0[iter_16_2].limitTime)
			elseif arg_16_0[iter_16_2].kind == 1 then
				addStarsToCell(ccp(103, 53), iter_16_2)
			end
		end
	end

	local var_16_9 = var_0_9(var_16_1, CCSizeMake(902, 452))

	storageUI.scrollView = var_16_9

	if var_0_1.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_1.updateSchedulerEntry)
	end

	var_0_1.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_8, 0, false)

	var_16_9:setPosition(ccp(13, 15))
	log.debug("should add scrollView  ", var_16_9)
	var_16_0:addChild(var_16_9)
	log.debug("did add scrollView  ,isBuyBack: ", var_0_2)
end

function storageUpdateStatus()
	if var_0_2 then
		storageUI.uiTable.storageStatus:setString("回购: " .. #var_0_1.itemsData)
	else
		storageUI.uiTable.storageStatus:setString(#var_0_1.itemsData .. "/" .. var_0_1.maxSize)
	end
end

function storageFlyTextToPositionInScreen(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_18_0:registerScriptTouchHandler(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == CCTOUCHBEGAN then
			return true
		elseif arg_19_0 == CCTOUCHMOVED then
			return true
		elseif arg_19_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_18_0:setTouchEnabled(true)
	var_18_0:setVisible(false)

	local var_18_1 = CCMoveBy:create(0.6, ccp(0, 30))
	local var_18_2 = CCFadeIn:create(0.6)
	local var_18_3 = CCFadeOut:create(0.5)
	local var_18_4 = CCArray:create()

	var_18_4:addObject(CCCallFuncN:create(function()
		var_18_0:setVisible(true)
	end))
	var_18_4:addObject(var_18_2)
	var_18_4:addObject(var_18_1)

	local var_18_5 = CCSpawn:create(var_18_4)
	local var_18_6 = CCArray:create()

	var_18_6:addObject(var_18_5)
	var_18_6:addObject(var_18_3)
	var_18_6:addObject(CCCallFuncN:create(function()
		var_18_0:removeFromParentAndCleanup(true)
	end))
	autoUI.createUI(var_18_0, getFlyText(arg_18_2), storageUI.uiTable)
	storageUI.uiTable.storageFlyText:setPosition(ccp(arg_18_0, arg_18_1 - 30))
	storageUI.uiTable.storageFlyText:setColor(arg_18_3)
	storageUI.uiTable.storageFlyText:runActionCopy(CCSequence:create(var_18_6))
	smgr.rootLayer:addChild(var_18_0, 60000)
end
