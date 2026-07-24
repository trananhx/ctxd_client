tool.requireRes("general/training")

trainingUI = {}

local var_0_0 = trainingUI
local var_0_1 = trainingControl
local var_0_2 = trainingConstant

var_0_0.currentSelectedMode = 1

function var_0_0.show()
	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "trainingLayer")

	var_0_0.uiTable = {}
	var_0_0.uiTable = autoUI.initUI(var_1_0, getTrainingUiData())
	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	for iter_1_0 = 1, 3 do
		var_0_0.uiTable["tabButton" .. iter_1_0]:unselected()
	end

	var_0_0.uiTable["tabButton" .. 1]:selected()

	var_0_0.currentSelectedMode = 1

	var_0_1.getTrainingInfo()

	return var_1_0
end

function var_0_0.handleTabButtonTap(arg_2_0)
	for iter_2_0 = 1, 3 do
		var_0_0.uiTable["tabButton" .. iter_2_0]:unselected()
	end

	var_0_0.uiTable["tabButton" .. arg_2_0]:selected()

	var_0_0.currentSelectedMode = arg_2_0

	if var_0_1.modeInfo then
		var_0_0.updateDescriptionLayer(var_0_1.modeInfo[arg_2_0])
	else
		var_0_1.getTrainingInfo()
	end
end

function var_0_0.updateGeneralsLayer(arg_3_0)
	if arg_3_0 and #arg_3_0 > 0 then
		for iter_3_0 = 1, #arg_3_0 do
			local var_3_0 = arg_3_0[iter_3_0]

			var_0_0.uiTable["generalQualityFrame" .. iter_3_0]:setDisplayFrame(CCSprite:create(picQualityFrame[var_3_0.generalQuality]):displayFrame())
			var_0_0.uiTable["generalPic" .. iter_3_0]:setDisplayFrame(tool.spriteFrameByName(var_3_0.generalPic .. ".jpg"))
			var_0_0.uiTable["generalLvText" .. iter_3_0]:setString(string.format("Lv.%s", var_3_0.generalLv))
			var_0_0.uiTable["generalLvLayer" .. iter_3_0]:setVisible(true)
			var_0_0.uiTable["generalLvLayer" .. iter_3_0]:setPositionX(36)
		end
	end
end

function var_0_0.updateDescriptionLayer(arg_4_0)
	if var_0_0.trainingTimer then
		pcall(var_0_0.trainingTimer.removeFromParentAndCleanup, var_0_0.trainingTimer, true)

		var_0_0.trainingTimer = nil
	end

	if var_0_0.totalTimer then
		pcall(var_0_0.totalTimer.removeFromParentAndCleanup, var_0_0.totalTimer, true)

		var_0_0.totalTimer = nil
	end

	var_0_0.uiTable.underTrainingLayer:setVisible(false)
	var_0_0.uiTable.descriptionLayer:setVisible(true)
	var_0_0.uiTable.trainingMask:setVisible(false)
	var_0_0.uiTable.trainingMask:unregisterScriptTouchHandler()

	for iter_4_0 = 1, 3 do
		var_0_0.uiTable["tabButton" .. iter_4_0]:unselected()
	end

	var_0_0.uiTable["tabButton" .. arg_4_0.modeId]:selected()

	var_0_0.currentSelectedMode = arg_4_0.modeId

	local var_4_0 = {
		colorQuality[4],
		colorQuality[5],
		colorQuality[6]
	}
	local var_4_1 = CCSprite:create(string.format("res/ui/general/training/train_title_%s.png", arg_4_0.modeId))

	var_0_0.uiTable.modeTitlePic:setDisplayFrame(var_4_1:displayFrame())
	var_0_0.uiTable.trainingEffectLabel:setString(string.format("%s", tostring(arg_4_0.efficiency * 100)) .. "%")
	var_0_0.uiTable.trainingEffectLabel:setColor(var_4_0[arg_4_0.modeId])
	var_0_0.uiTable.trainingCostLabel:setString(language.get(86006, arg_4_0.cost))
end

function var_0_0.updateUnderTrainingLayer(arg_5_0)
	if var_0_0.trainingTimer then
		pcall(var_0_0.trainingTimer.removeFromParentAndCleanup, var_0_0.trainingTimer, true)

		var_0_0.trainingTimer = nil
	end

	if var_0_0.totalTimer then
		pcall(var_0_0.totalTimer.removeFromParentAndCleanup, var_0_0.totalTimer, true)

		var_0_0.totalTimer = nil
	end

	var_0_0.uiTable.underTrainingLayer:setVisible(true)
	var_0_0.uiTable.descriptionLayer:setVisible(false)

	for iter_5_0 = 1, 3 do
		var_0_0.uiTable["tabButton" .. iter_5_0]:unselected()
	end

	var_0_0.uiTable["tabButton" .. arg_5_0.mode]:selected()

	var_0_0.currentSelectedMode = arg_5_0.mode

	local var_5_0 = {
		colorQuality[4],
		colorQuality[5],
		colorQuality[6]
	}
	local var_5_1 = CCSprite:create(string.format("res/ui/general/training/train_ing_title_%s.png", arg_5_0.mode))

	var_0_0.uiTable.modeTrainingTitlePic:setDisplayFrame(var_5_1:displayFrame())

	local var_5_2 = arg_5_0.trainningTime

	log.info("leftTime : ", var_5_2)

	local var_5_3 = (arg_5_0.maxTrainningTime - var_5_2) / arg_5_0.maxTrainningTime * 100

	var_0_0.uiTable.trainingProgressBar:setPercentage(var_5_3)

	local var_5_4 = var_0_0.uiTable.trainingProgressBar:getContentSize().width

	var_0_0.uiTable.progressLight:setPositionX(var_5_4 * var_5_3 / 100)

	local function var_5_5()
		var_0_0.showTrainingWoodCost()
		var_0_0.showTrainingGainsTips()
		var_0_0.trainingTimer:setShouldCallBack(false)
	end

	require("lua/component/timerLabel")

	local var_5_6 = createTimerLabel(var_5_2 * 1000, "@M:@S", "Thonburi-Bold", 22, var_5_5, nil, 0)

	var_0_0.trainingTimer = var_5_6

	var_0_0.uiTable.trainingProgressBar:addChild(var_5_6, 101)
	var_5_6:setPosition(ccp(139, 5.5))

	local var_5_7 = createTimerLabel(arg_5_0.modeLeftTime, "@H:@M:@S", "Thonburi-Bold", 26, nil, nil, nil, var_5_0[arg_5_0.mode])

	var_0_0.totalTimer = var_5_7

	var_0_0.uiTable.underTrainingLayer:addChild(var_5_7)

	local var_5_8, var_5_9 = var_0_0.uiTable.trainingLeftTimeTitle:getPosition()

	var_5_7:setPosition(ccp(var_5_8 + 140, var_5_9))

	if not var_0_0.trainingAnimNode then
		var_0_0.showTrainingEffect()
	end

	local function var_5_10(arg_7_0, arg_7_1, arg_7_2)
		return true
	end

	var_0_0.uiTable.trainingMask:setVisible(true)
	var_0_0.uiTable.trainingMask:registerScriptTouchHandler(var_5_10, false, true)
	var_0_0.uiTable.trainingMask:setTouchEnabled(true)

	local var_5_11, var_5_12 = tool.getPositionInScreen(var_0_0.uiTable.trainingMask)

	log.info("maskX, maskY : ", var_5_11, var_5_12)

	if var_5_11 ~= 0 then
		var_0_0.uiTable.trainingMask:setPositionX(-var_5_11)
	end

	if var_5_12 ~= 0 then
		var_0_0.uiTable.trainingMask:setPositionY(-var_5_12)
	end
end

function var_0_0.onStartTrainingButtonTap()
	var_0_1.startTraining(var_0_0.currentSelectedMode)
end

function var_0_0.onStopTrainingButtonTap()
	var_0_1.stopTraining()
end

function var_0_0.update(arg_10_0)
	if var_0_1.isTrainning and var_0_1.inTrainingInfo then
		var_0_1.inTrainingInfo.trainningTime = math.ceil(var_0_1.inTrainingInfo.trainningTime - arg_10_0)
		var_0_1.inTrainingInfo.modeLeftTime = var_0_1.inTrainingInfo.modeLeftTime - arg_10_0 * 1000

		if var_0_0.uiTable.trainingProgressBar then
			local var_10_0 = var_0_1.inTrainingInfo.trainningTime

			log.info("leftTime : ", var_10_0)

			local var_10_1 = (var_0_1.inTrainingInfo.maxTrainningTime - var_10_0) / var_0_1.inTrainingInfo.maxTrainningTime * 100

			var_0_0.uiTable.trainingProgressBar:setPercentage(var_10_1)

			local var_10_2 = var_0_0.uiTable.trainingProgressBar:getContentSize().width
			local var_10_3 = var_10_2 * var_10_1 / 100

			if var_10_2 < var_10_3 then
				var_10_3 = var_10_2
			end

			var_0_0.uiTable.progressLight:setPositionX(var_10_3)
		end
	end
end

function var_0_0.getTrainingEffectSpriteFrames()
	if var_0_0.trainingAnim then
		return var_0_0.trainingAnim
	else
		local var_11_0 = 12
		local var_11_1 = CCArray:create()

		for iter_11_0 = 1, var_11_0 do
			local var_11_2 = "res/ui/general/training/trainingAnim/train000" .. iter_11_0 .. ".png"
			local var_11_3 = CCSprite:create(var_11_2):displayFrame()

			var_11_1:addObject(var_11_3)
		end

		var_11_1:retain()

		var_0_0.trainingAnim = var_11_1

		return var_11_1
	end
end

function var_0_0.showTrainingEffect()
	local var_12_0 = var_0_0.getTrainingEffectSpriteFrames()
	local var_12_1 = CCAnimation:createWithSpriteFrames(var_12_0, 0.08)
	local var_12_2 = CCAnimate:create(var_12_1)
	local var_12_3 = CCRepeatForever:create(var_12_2)
	local var_12_4 = CCSprite:create()

	var_0_0.trainingAnimNode = var_12_4

	var_0_0.uiTable.underTrainingLayer:addChild(var_12_4)
	var_12_4:setAnchorPoint(ccp(0.5, 0.5))
	var_12_4:setPosition(ccp(170, 280))
	var_12_4:runAction(var_12_3)
end

function var_0_0.showStopTrainingGainTips(arg_13_0)
	arg_13_0 = arg_13_0 or 0

	local var_13_0, var_13_1 = tool.getPositionInScreen(var_0_0.uiTable.startTrainingButton)
	local var_13_2 = CCSprite:create("res/ui/general/training/train_stop_title.png")

	local function var_13_3()
		local var_14_0 = globalAction_gotSingleResource(6, arg_13_0)

		smgr.showTipFloatYSprite(var_14_0, 60, ccp(var_13_0, var_13_1 + 100))
	end

	smgr.showTipFloatYSprite(var_13_2, 60, ccp(var_13_0, var_13_1 + 100), var_13_3)
end

function var_0_0.showTrainingGainsTips()
	local var_15_0 = var_0_1.inTrainingInfo.expGained

	log.info("showTrainingGainsTips", var_0_1.inTrainingInfo.expGained)

	local var_15_1 = var_0_1.generalInfo
	local var_15_2 = {}

	for iter_15_0 = 1, #var_15_1 do
		var_15_2[iter_15_0] = function()
			if iter_15_0 == 1 then
				-- block empty
			end

			local var_16_0, var_16_1 = tool.getPositionInScreen(var_0_0.uiTable["generalQualityFrame" .. iter_15_0])
			local var_16_2 = globalAction_gotSingleResource(6, var_15_0)

			smgr.showTipFloatYSprite(var_16_2, 40, ccp(var_16_0, var_16_1), nil, 0.5, 0.6)
		end
	end

	local var_15_3 = globalAction_gotSingleResource(6, var_15_0)
	local var_15_4, var_15_5 = tool.getPositionInScreen(var_0_0.uiTable.playerHalfPic)

	smgr.showTipFloatYSprite(var_15_3, 30, ccp(var_15_4, var_15_5), nil, 0.6, 0.8)

	local var_15_6 = CCArray:create()

	var_15_6:addObject(CCDelayTime:create(0.2))

	for iter_15_1 = 1, #var_15_2 do
		var_15_6:addObject(CCCallFuncN:create(var_15_2[iter_15_1]))
		var_15_6:addObject(CCDelayTime:create(0.2))
	end

	local var_15_7 = CCSequence:create(var_15_6)

	smgr.getLayer("trainingLayer"):runAction(var_15_7)
end

function var_0_0.showTrainingWoodCost()
	local var_17_0 = CCSprite:create("res/ui/general/training/train_wood_cost.png")
	local var_17_1 = var_17_0:getContentSize()
	local var_17_2 = CCLabelAtlas:create("0", "res/ui/general/training/train_nb_mc.png", 32, 40, 48)

	var_17_2:setString(tostring(var_0_1.inTrainingInfo.woodCost))
	var_17_0:addChild(var_17_2)

	local var_17_3 = var_17_2:getContentSize()

	var_17_2:setPositionX(var_17_1.width)

	local var_17_4 = -var_17_3.width * 0.5
	local var_17_5, var_17_6 = tool.getPositionInScreen(var_0_0.uiTable.startTrainingButton)

	smgr.showTipFloatYSprite(var_17_0, -30, ccp(var_17_5 + var_17_4, var_17_6 + 300), var_0_1.getTrainingInfo, 0.8, 0.8)
end
