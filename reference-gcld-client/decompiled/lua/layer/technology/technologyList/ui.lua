tool.requireRes("technology/technologyList")
require("lua/component/timerLabel")

technologyListUI = {}

local var_0_0 = technologyListUI

technologyListUI.uiTable = {}

local var_0_1 = technologyListControl
local var_0_2 = technologyListConstant

function technologyListUI.show()
	local var_1_0 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_1_0, "technologyListUILayer")

	if technologyListUI.uiTable then
		technologyListUI.uiTable = nil
	end

	technologyListUI.uiTable = autoUI.initUI(var_1_0, getTechnologyListData())

	var_0_1.initControl(var_1_0)

	technologyListUI.timerLabels = {}

	log.debug("should get tech info ")
	var_0_1.technologyGetInfo(1)
	var_1_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	user.welfare.setWelfare("displayTech", 0)

	return var_1_0
end

function createTechnologyList(arg_2_0)
	local var_2_0 = technologyListUI.uiTable.technologyListBackground
	local var_2_1 = autoUI.renderList(technologyListUI.uiTable, getTechnologyListData().technologyList, arg_2_0)

	pcall(var_2_0.removeAllChildrenWithCleanup, var_2_0, true)

	local var_2_2 = CCSizeMake(var_2_1:getContentSize().width, #var_0_1.techData * 105)
	local var_2_3 = CCLayer:create()

	var_2_3:setAnchorPoint(ccp(0, 1))
	var_2_3:setPosition(ccp(0, 0))
	var_2_3:setContentSize(var_2_2)
	var_2_3:addChild(var_2_1)
	var_2_1:setPosition(ccp(0, var_2_2.height - #arg_2_0 * 105))

	local var_2_4 = CCScrollView:create(CCSizeMake(var_2_0:getContentSize().width, var_2_0:getContentSize().height - 20))

	technologyListUI.scrollView = var_2_4

	var_2_4:setContainer(var_2_3)
	var_2_4:setContentSize(var_2_2)
	var_2_4:setDirection(kCCScrollViewDirectionVertical)
	log.debug("scrollLayer contentSize:", var_2_3:getContentSize().height, "scrollView contentSize:", var_2_4:getContentSize().height, "technologyListLayer contentSize:", var_2_1:getContentSize().height)
	log.debug("scrollView content offset :", var_2_4:getContentOffset().x, var_2_4:getContentOffset().y)
	log.debug("technologyListBackground contentSize: ", var_2_0:getContentSize().height)
	var_2_0:addChild(var_2_4)
	var_2_4:setAnchorPoint(ccp(0, 0))
	var_2_4:setPosition(ccp(0, 10))
	var_2_4:setContentOffset(ccp(0, var_2_4:getViewSize().height - var_2_2.height))

	local var_2_5 = technologyListUI.uiTable.technologyCell1

	log.debug("cell position : ", var_2_5:getPosition(), "technologyListLayer  position : ", var_2_1:getPosition(), "technologyListLayer anchorPoint: ", var_2_1:getAnchorPoint().x, var_2_1:getAnchorPoint().y)

	for iter_2_0 = 1, #arg_2_0 do
		technologySetUpCell(arg_2_0[iter_2_0], iter_2_0)
	end
end

function updateTechnologyCell(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.status

	autoUI.updateListData(technologyListUI.uiTable, "technologyList", getTechnologyListData(), arg_3_1, arg_3_0)
	technologySetUpCell(arg_3_0, arg_3_1)
end

function technologySetUpCell(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.status

	if var_4_0 == technologyListConstant.TECH_STATUS_RESEARCHING then
		local var_4_1 = arg_4_0.cdTotal / 100
		local var_4_2
		local var_4_3 = false

		if var_4_1 >= 1000 then
			log.info("call back time : " .. math.floor(arg_4_0.cd / var_4_1) * var_4_1 .. " current cd: " .. arg_4_0.cd)

			var_4_2 = createTimerLabel(arg_4_0.cd, "@H:@M:@S", "Thonburi-Bold", 20, var_0_0.updateProgressBar, {
				arg_4_1,
				var_4_1,
				var_4_3
			}, math.floor(arg_4_0.cd / var_4_1) * var_4_1)
		else
			local var_4_4 = true
			local var_4_5 = 1000

			log.info("call back time : " .. math.floor(arg_4_0.cd / var_4_5) * var_4_5 .. " current cd: " .. arg_4_0.cd)

			var_4_2 = createTimerLabel(arg_4_0.cd, "@M:@S", "Thonburi-Bold", 20, var_0_0.updateProgressBar, {
				arg_4_1,
				var_4_5,
				var_4_4
			}, math.floor(arg_4_0.cd / var_4_5) * var_4_5)
		end

		technologyListUI.timerLabels[arg_4_1] = var_4_2

		technologyListUI.uiTable["timerProgressBar" .. arg_4_1]:setPercentage((arg_4_0.cdTotal - var_4_2:getTime()) / arg_4_0.cdTotal * 100)
		technologyListUI.uiTable["timerProgressBar" .. arg_4_1]:addChild(var_4_2)
		var_4_2:setPosition(ccp(123, 11))
	end

	if var_4_0 ~= technologyListConstant.TECH_STATUS_RESEARCHING and var_4_0 ~= technologyListConstant.TECH_STATUS_EFFECTED then
		log.info("should add start label")

		local var_4_6 = technologyListUI.uiTable["technologyCell" .. arg_4_1]

		log.info(var_4_6, "at index " .. arg_4_1)

		local var_4_7 = createTechnologyStarLabel(arg_4_0.num, arg_4_0.total)

		var_4_7:setPosition(ccp(357, 58))
		var_4_6:addChild(var_4_7)
	end
end

function var_0_0.updateProgressBar(arg_5_0)
	log.info("update progress bar with args :", arg_5_0)

	local var_5_0 = arg_5_0[1]
	local var_5_1 = arg_5_0[2]
	local var_5_2
	local var_5_3 = var_0_1.techData[var_5_0]
	local var_5_4 = technologyListUI.uiTable["timerProgressBar" .. var_5_0]
	local var_5_5 = technologyListUI.timerLabels[var_5_0]
	local var_5_6 = var_5_5:getTriggerTime() - var_5_1

	log.info("triggerTime: " .. var_5_6 .. " triggerDuration:" .. var_5_1, "timer time :", var_5_5:getTime(), "total cd :", var_5_3.cdTotal)
	var_5_5:setTriggerTime(var_5_6)

	local var_5_7 = var_5_4:getPercentage()

	log.info("tech.cdTotal-timer:getTime()", var_5_3.cdTotal - var_5_5:getTime())
	log.info("(tech.cdTotal-timer:getTime())/tech.cdTotal: ", (var_5_3.cdTotal - var_5_5:getTime()) / var_5_3.cdTotal)
	log.info(" (tech.cdTotal-timer:getTime())/tech.cdTotal*100 :", (var_5_3.cdTotal - var_5_5:getTime()) / var_5_3.cdTotal * 100)
	var_5_4:setPercentage((var_5_3.cdTotal - var_5_5:getTime()) / var_5_3.cdTotal * 100)

	if var_5_5:getTriggerTime() <= 0 or var_5_5:getTime() <= 0 then
		technologyListControl.techData[var_5_0].status = technologyListConstant.TECH_STATUS_EFFECTED

		updateTechnologyCell(technologyListControl.techData[var_5_0], var_5_0)
		pcall(var_5_4.removeAllChildrenWithCleanup, var_5_4, true)
		pcall(var_5_4.removeFromParentAndCleanup, var_5_4, true)
		log.info("timerLabel at index :" .. var_5_0 .. "  timer:", technologyListUI.timerLabels[var_5_0])

		technologyListUI.timerLabels[var_5_0] = nil

		return
	end
end

function flyTextToPositionInScreen(arg_6_0, arg_6_1)
	local var_6_0 = CCMoveTo:create(1, ccp(arg_6_0, arg_6_1))
	local var_6_1 = CCFadeIn:create(0.5)
	local var_6_2 = CCFadeOut:create(0.5)
	local var_6_3 = CCSpawn:createWithTwoActions(var_6_1, var_6_0)
	local var_6_4 = CCArray:create()

	var_6_4:addObject(var_6_3)
	var_6_4:addObject(var_6_2)

	local var_6_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_6_5:registerScriptTouchHandler(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == CCTOUCHBEGAN then
			return true
		elseif arg_7_0 == CCTOUCHMOVED then
			return true
		elseif arg_7_0 == CCTOUCHENDED then
			var_6_5:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_6_5:setTouchEnabled(true)
	var_6_4:addObject(CCCallFuncN:create(function()
		var_6_5:removeFromParentAndCleanup(true)
	end))

	if technologyListUI.uiTable.techReadyForResearchPic then
		technologyListUI.uiTable.techReadyForResearchPic = nil
	end

	autoUI.createUI(var_6_5, getTechnologyListData().techReadyForResearchPic, technologyListUI.uiTable)
	technologyListUI.uiTable.techReadyForResearchPic:setPosition(ccp(arg_6_0, arg_6_1 - 200))
	smgr.rootLayer:addChild(var_6_5, 60000)
	technologyListUI.uiTable.techReadyForResearchPic:runAction(CCSequence:create(var_6_4))
end

function createTechnologyStarLabel(arg_9_0, arg_9_1)
	local var_9_0 = CCLayer:create()
	local var_9_1 = arg_9_1 - arg_9_0

	for iter_9_0 = 1, arg_9_1 do
		local var_9_2 = {}

		if iter_9_0 <= arg_9_0 then
			var_9_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("technology-star-1.png")
		else
			var_9_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("technology-star-2.png")
		end

		local var_9_3 = CCSprite:createWithSpriteFrame(var_9_2)

		var_9_3:setAnchorPoint(ccp(0, 0.5))
		var_9_3:setPosition(ccp(35 * (iter_9_0 - 1), 15))
		var_9_0:addChild(var_9_3)
	end

	return var_9_0
end

function onTechCellButtonTap(arg_10_0)
	local var_10_0 = technologyListUI.uiTable["technologyCell" .. arg_10_0]

	technologyListUI.uiTable["techHighlightPic" .. arg_10_0]:setVisible(true)

	local var_10_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_10_1:registerScriptTouchHandler(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == CCTOUCHBEGAN then
			return true
		elseif arg_11_0 == CCTOUCHMOVED then
			return true
		elseif arg_11_0 == CCTOUCHENDED then
			technologyListUI.uiTable["techHighlightPic" .. arg_10_0]:setVisible(false)
			var_10_1:removeFromParentAndCleanup(true)

			return true
		end
	end, false, true)
	var_10_1:setTouchEnabled(true)

	local var_10_2 = technologyListControl.techData[arg_10_0].resources
	local var_10_3 = ""

	for iter_10_0 = 1, #var_10_2 do
		if var_10_2[iter_10_0].type == 1 then
			var_10_3 = var_10_3 .. " " .. language.get(10101) .. " " .. var_10_2[iter_10_0].value
		elseif var_10_2[iter_10_0].type == 2 then
			var_10_3 = var_10_3 .. "   " .. language.get(10102) .. " " .. var_10_2[iter_10_0].value
		elseif var_10_2[iter_10_0].type == 3 then
			var_10_3 = var_10_3 .. "   " .. language.get(10103) .. " " .. var_10_2[iter_10_0].value
		elseif var_10_2[iter_10_0].type == 4 then
			var_10_3 = var_10_3 .. "   " .. language.get(10104) .. " " .. var_10_2[iter_10_0].value
		end
	end

	if technologyListUI.uiTable.techTipFrame then
		technologyListUI.uiTable.techTipFrame = nil
	end

	log.info("length of tipStr:", #var_10_3)

	local var_10_4 = 5 * (#var_10_3 - 40)
	local var_10_5 = CCSizeMake(494 + var_10_4, 54)

	autoUI.createUI(var_10_1, getTechResTipFrameWithPreferedSize(var_10_5), technologyListUI.uiTable)

	local var_10_6, var_10_7 = tool.getPositionInScreen(var_10_0)

	technologyListUI.uiTable.techTipFrame:setPosition(ccp(var_10_6 + 130, var_10_7 + 55))
	technologyListUI.uiTable.resourcesLabel:setString(var_10_3)
	smgr.getLayer("technologyListUILayer"):addChild(var_10_1, 60000)
end
