dayTrain = {}

tool.requireRes("dayTrain")
require("lua/common/tool")

dayTrain.ui = {}

local var_0_0 = dayTrain.ui
local var_0_1 = dayTrain.constant.army
local var_0_2 = {}
local var_0_3
local var_0_4 = {}
local var_0_5 = 2

function var_0_0.initArmyTimes()
	for iter_1_0 = 1, 4 do
		var_0_4[iter_1_0] = var_0_5
	end

	dayTrain.hasSendMsg = false
end

function var_0_0.addMask()
	var_0_3 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_0_3:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_0_3:setTouchEnabled(true)
	smgr.rootLayer:addChild(var_0_3, 60000)
end

function var_0_0.removeMask()
	if var_0_3 ~= nil then
		var_0_3:removeFromParentAndCleanup(true)
	end
end

function var_0_0.makeArmyNotVisible()
	for iter_5_0 = 1, 4 do
		if var_0_2[iter_5_0] and var_0_4[iter_5_0] <= 0 then
			var_0_2[iter_5_0]:setVisible(false)
		end
	end
end

function var_0_0.showArmy(arg_6_0)
	local var_6_0 = rmgr.getArmy("def", var_0_1.type[arg_6_0]).win
	local var_6_1 = CCAnimation:createWithSpriteFrames(var_6_0, 0.1)
	local var_6_2 = CCAnimate:create(var_6_1)

	var_0_2[arg_6_0] = CCSprite:createWithSpriteFrame(var_6_0:objectAtIndex(1))

	var_0_2[arg_6_0]:setAnchorPoint(ccp(0.5, 0.5))
	var_0_2[arg_6_0]:setPosition(var_0_1.pos[arg_6_0])
	var_0_2[arg_6_0]:setScale(var_0_1.rate[arg_6_0])
	dayTrain.ui.table.bgTrain:addChild(var_0_2[arg_6_0])
end

function var_0_0.getArmyAnimation(arg_7_0)
	local var_7_0 = rmgr.getArmy("def", var_0_1.type[arg_7_0]).win
	local var_7_1 = CCAnimation:createWithSpriteFrames(var_7_0, 0.1)
	local var_7_2 = CCAnimate:create(var_7_1)

	var_0_2[arg_7_0]:runAction(var_7_2)
end

function var_0_0.getExpAnimation(arg_8_0)
	if var_0_3 == nil then
		var_0_0.addMask()
	end

	local var_8_0 = rmgr.getAnimation("farmAddExpEffect")
	local var_8_1 = CCAnimation:createWithSpriteFrames(var_8_0, 0.08)
	local var_8_2 = CCAnimate:create(var_8_1)
	local var_8_3 = CCSprite:create()

	var_8_3:setPosition(var_0_1.exp[arg_8_0])
	var_0_3:addChild(var_8_3)

	local var_8_4 = CCArray:create()

	var_8_4:addObject(var_8_2)

	if arg_8_0 ~= 5 then
		var_8_4:addObject(CCCallFunc:create(var_0_0.showExpAdd))
	end

	var_8_4:addObject(CCCallFunc:create(var_0_0.removeMask))
	var_8_4:addObject(CCCallFunc:create(var_0_0.makeArmyNotVisible))
	var_8_3:runAction(CCSequence:create(var_8_4))
end

function var_0_0.showExpAdd()
	local var_9_0 = {
		{}
	}

	var_9_0[1].id = 6
	var_9_0[1].value = dayTrain.data.exp / 4 / var_0_5

	globalAction_gotResource(var_9_0)
end

function var_0_0.handlerArmyNodeTap(arg_10_0, arg_10_1)
	log.info(" =================>dayTrain:handlerArmyNodeTap begin")

	for iter_10_0 = 1, 4 do
		if tool.checkIfTouch(var_0_2[iter_10_0], arg_10_0, arg_10_1) == true and var_0_4[iter_10_0] > 0 then
			if dayTrain.hasSendMsg == false then
				dayTrain.control.request_dayTrainInfo()
				log.info("dayTrain msg send!")
			end

			var_0_4[iter_10_0] = var_0_4[iter_10_0] - 1

			var_0_0.addMask()
			var_0_0.getArmyAnimation(iter_10_0)
			var_0_0.getExpAnimation(iter_10_0)
			log.info(iter_10_0)

			break
		end
	end

	log.info("<====================dayTrain:handlerArmyNodeTap end")
end

function var_0_0.show()
	amgr.playEffect(enumAudioFile.ui_dialog_open)
	var_0_0.initArmyTimes()

	local var_11_0 = createBaseLayer()

	dayTrain.ui.table = autoUI.initUI(var_11_0, getDayTrainData())
	dayTrain.ui.table.layer = var_11_0

	for iter_11_0 = 1, 4 do
		var_0_0.showArmy(iter_11_0)
	end

	local var_11_1 = dayTrain.ui.table.closeItem

	var_11_1:setScale(2)

	local var_11_2 = var_11_1:getContentSize()
	local var_11_3 = dayTrain.ui.table.bg:getContentSize()
	local var_11_4 = visibleSize.width / 2 + var_11_3.width / 2 - var_11_2.width / 2 - 30
	local var_11_5 = visibleSize.height / 2 + var_11_3.height / 2 + var_11_2.height / 2 - 20

	var_11_1:setPosition(ccp(var_11_4, var_11_5))

	local function var_11_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_11_0, true)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if globalAction_updateSpecialEffect then
			globalAction_updateSpecialEffect()
		end
	end

	dayTrain.ui.table.closeItem:registerScriptTapHandler(var_11_6)

	local function var_11_7(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHBEGAN then
			return true
		elseif arg_13_0 == CCTOUCHMOVED then
			return true
		elseif arg_13_0 == CCTOUCHENDED then
			var_0_0.handlerArmyNodeTap(arg_13_1, arg_13_2)

			return true
		end
	end

	var_11_0:setTouchEnabled(true)
	var_11_0:registerScriptTouchHandler(var_11_7, false, true)

	local var_11_8 = smgr.getLayer("topLayer")

	var_11_8:removeAllChildrenWithCleanup(true)
	var_11_8:addChild(var_11_0)
	var_11_0:setVisible(true)
end
