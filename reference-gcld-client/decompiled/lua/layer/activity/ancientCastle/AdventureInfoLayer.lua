local var_0_0 = require("lua/common/CCBNode")
local var_0_1 = class("AdventureInfoLayer", function()
	return createBaseLayer()
end)
local var_0_2 = false

function var_0_1.ctor(arg_2_0, arg_2_1)
	local var_2_0 = var_0_0:create(arg_2_0)

	arg_2_0.ad = arg_2_1

	if arg_2_0.giveUpBtn ~= nil then
		tool.redefineCCControlButtonText(arg_2_0.giveUpBtn, language.get(400053))

		if conf.language == "kr" then
			tool.redefineCCControlButtenTextSize(arg_2_0.giveUpBtn, 18)
		end
	end

	if conf.language == "vie" then
		arg_2_0.percent:setPosition(ccp(arg_2_0.percent:getPositionX() + 15, arg_2_0.percent:getPositionY()))
		arg_2_0.percent:setScale(0.75)
		arg_2_0.colLabel:setScale(0.75)
		arg_2_0.perSym:setScale(0.75)
	elseif conf.language == "tha" then
		arg_2_0.percent:setPosition(ccp(arg_2_0.percent:getPositionX() + 15, arg_2_0.percent:getPositionY()))
		arg_2_0.percent:setScale(0.75)
		arg_2_0.colLabel:setScale(0.75)
		arg_2_0.perSym:setScale(0.75)
	end
end

function var_0_1.handlerQuitAdventure(arg_3_0, arg_3_1)
	user.inAdventure = arg_3_1.action.data.inAdventure

	if user.inAdventure == false then
		smgr.changeScene(SCENE_MAIN_CITY)
		activityUI.show(activityConstant.TYPES.ACTIVITY_ANCIENT_CASTLE.tag)
	end
end

function var_0_1.giveUp(arg_4_0)
	if user.mapId and user.mapId == 4 then
		cmgr.sendRequest(handler(arg_4_0, arg_4_0.handlerQuitAdventure), actions.quitAdventure)

		if var_0_2 == true then
			user.inAdventure = false

			smgr.changeScene(SCENE_MAIN_CITY)
			activityUI.show(activityConstant.TYPES.ACTIVITY_ANCIENT_CASTLE.tag)
		end
	else
		user.inAdventure = false
		user.inAdventureMiddleGiveup = true

		smgr.changeScene(SCENE_MAIN_CITY)
		activityUI.show(activityConstant.TYPES.ACTIVITY_ANCIENT_CASTLE.tag)
	end
end

function var_0_1.updatePercent(arg_5_0, arg_5_1)
	if arg_5_1 >= 100 then
		var_0_2 = true
	end

	arg_5_0.percent:setString(tostring(arg_5_1))
end

function var_0_1.updateLeftSteps(arg_6_0, arg_6_1)
	arg_6_0.leftSteps = arg_6_1

	if arg_6_0.richNode then
		arg_6_0.richNode:removeFromParentAndCleanup(true)

		arg_6_0.richNode = nil
	end

	if arg_6_1 == 0 then
		return
	end

	local var_6_0 = CCSprite:create("res/ui/activity/ancientCastle/mz-hkz.png")
	local var_6_1 = CCLabelAtlas:create(tostring(arg_6_1), "res/ui/activity/ancientCastle/dz.png", 51, 64, 48)

	var_6_1:setAnchorPoint(ccp(0.5, 0.5))

	local var_6_2 = CCSprite:create("res/ui/activity/ancientCastle/mz_b.png")

	arg_6_0.richNode = createRichNode({
		var_6_0,
		var_6_1,
		var_6_2
	})

	local var_6_3 = var_6_0:getContentSize().width + var_6_1:getContentSize().width + var_6_2:getContentSize().width

	arg_6_0.richNode:setPosition(visibleSize.width / 2 - var_6_3 / 2, visibleSize.height - 30)
	arg_6_0:addChild(arg_6_0.richNode)
end

function var_0_1.updateShaizi(arg_7_0, arg_7_1)
	arg_7_1 = arg_7_1 or arg_7_0.leftSteps

	if arg_7_1 > 0 then
		arg_7_0.shaizi:setEnabled(false)

		arg_7_0.ad.state = arg_7_0.ad.STATE.IDLE_WITH_STEP
	else
		arg_7_0.shaizi:setEnabled(true)

		arg_7_0.ad.state = arg_7_0.ad.STATE.IDLE_WITHOUT_STEP
	end

	if arg_7_0.timesNode then
		arg_7_0.timesNode:removeFromParentAndCleanup(true)

		arg_7_0.timesNode = nil
	end

	if arg_7_0.todayTimes and arg_7_0.todayTimes > 0 then
		arg_7_0.timesNode = CCLabelAtlas:create(tostring(arg_7_0.todayTimes), "res/ui/activity/ancientCastle/mz_djs0.png", 25, 31, 48)

		arg_7_0.timesNode:setPosition(80, 18)
		arg_7_0.shaiziBg:addChild(arg_7_0.timesNode)
	else
		arg_7_0.timesNode = CCSprite:create("res/ui/playerInfo/icon_gold.png")

		local var_7_0 = CCStrokeLabelTTF:create(tostring(arg_7_0.ad.data.mapGold), "Thonburi", 24)

		var_7_0:setPosition(58, 12)
		arg_7_0.timesNode:addChild(var_7_0)
		arg_7_0.timesNode:setPosition(60, 18)
		arg_7_0.shaiziBg:addChild(arg_7_0.timesNode)
	end
end

function var_0_1.handlerStartAdventure(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.action.data

	if arg_8_0.timesNode then
		arg_8_0.timesNode:removeFromParentAndCleanup(true)

		arg_8_0.timesNode = nil
	end

	if arg_8_0.goldNum then
		arg_8_0.goldNum:setString(var_8_0.timeGold)
	end

	if arg_8_0.timeCounter then
		arg_8_0.timeCounter:setTime(var_8_0.leftExploreTime + 400)
	end

	arg_8_0.todayTimes = var_8_0.todayTimes

	if var_8_0.leftSteps then
		arg_8_0:updateLeftSteps(var_8_0.leftSteps)
		arg_8_0:updateShaizi(var_8_0.leftSteps)
	end

	arg_8_0:updatePercent(var_8_0.percentage)

	var_0_2 = false

	if var_8_0.canPickBox == true then
		arg_8_0:showFinalBox()
	end
end

function var_0_1.playShaiziAnim(arg_9_0, arg_9_1)
	arg_9_0.richNode:setVisible(false)

	local var_9_0 = CCSprite:createWithSpriteFrameName("shaizi_m_1.png")
	local var_9_1 = CCArray:create()

	for iter_9_0 = 1, 6 do
		local var_9_2 = tool.spriteFrameByName(string.format("shaizi_m_%s.png", iter_9_0))

		var_9_1:addObject(var_9_2)
	end

	local var_9_3 = CCAnimation:createWithSpriteFrames(var_9_1, 0.03)
	local var_9_4 = CCAnimate:create(var_9_3)
	local var_9_5 = CCRepeatForever:create(var_9_4)

	var_9_0:runAction(var_9_5)
	var_9_0:setPosition(visibleSize.width / 2, visibleSize.height / 2 + 150)
	arg_9_0:addChild(var_9_0)

	local var_9_6 = CCEaseSineIn:create(CCMoveBy:create(0.3, ccp(0, -300)))
	local var_9_7 = CCEaseSineIn:create(CCMoveBy:create(0.15, ccp(-1 * tool.random(50, 100), 0)))
	local var_9_8 = CCEaseSineIn:create(CCMoveBy:create(0.3, ccp(tool.random(150, 200), 0)))
	local var_9_9 = CCEaseSineIn:create(CCMoveBy:create(0.1, ccp(-1 * tool.random(50, 100), 0)))
	local var_9_10 = CCEaseSineIn:create(CCMoveBy:create(0.2, ccp(tool.random(50, 100), 0)))
	local var_9_11 = CCCallFunc:create(function()
		var_9_0:stopAction(var_9_5)
		var_9_0:setDisplayFrame(CCSprite:createWithSpriteFrameName(string.format("shaizi_i_%s.png", arg_9_1)):displayFrame())
		arg_9_0.richNode:setVisible(true)
	end)
	local var_9_12 = CCDelayTime:create(1)
	local var_9_13 = CCCallFunc:create(function()
		var_9_0:removeFromParentAndCleanup(true)
	end)
	local var_9_14 = CCArray:create()

	var_9_14:addObject(var_9_6)
	var_9_14:addObject(var_9_7)
	var_9_14:addObject(var_9_8)
	var_9_14:addObject(var_9_9)
	var_9_14:addObject(var_9_10)
	var_9_14:addObject(var_9_11)
	var_9_14:addObject(var_9_12)
	var_9_14:addObject(var_9_13)

	local var_9_15 = CCSequence:create(var_9_14)

	var_9_0:runAction(var_9_15)
end

function var_0_1.handlerThrowDice(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.action.data
	local var_12_1 = var_12_0.leftSteps

	if var_12_1 then
		arg_12_0:updateLeftSteps(var_12_1)
		arg_12_0:updateShaizi(var_12_1)
	end

	arg_12_0:playShaiziAnim(var_12_0.dice)
end

function var_0_1.dropShaizi(arg_13_0)
	if arg_13_0.todayTimes > 0 then
		cmgr.sendRequest(handler(arg_13_0, arg_13_0.handlerThrowDice), actions.throwDice, 0)

		arg_13_0.todayTimes = arg_13_0.todayTimes - 1
	else
		messageBox.showChargeWin("", language.get("490003_yyl", arg_13_0.ad.data.mapGold), "buyGoldDice", function()
			cmgr.sendRequest(handler(arg_13_0, arg_13_0.handlerThrowDice), actions.throwDice, 1)
		end)
	end
end

function var_0_1.handlerGetMapFinalBoxAction(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.action.data

	user.inAdventure = var_15_0.inAdventure

	arg_15_0.boxSprite:setDisplayFrame(CCSprite:create("res/ui/activity/ancientCastle/xbaox1.png"):displayFrame())

	local var_15_1 = CCArray:create()

	var_15_1:addObject(CCDelayTime:create(0.2))
	var_15_1:addObject(CCCallFunc:create(function()
		local var_16_0 = {
			nil,
			nil,
			3,
			4,
			nil,
			nil,
			nil,
			nil,
			5,
			6,
			nil,
			nil,
			nil,
			100,
			10003,
			2003,
			7,
			41,
			24
		}
		local var_16_1 = {}

		for iter_16_0, iter_16_1 in pairs(var_15_0.rewards) do
			if var_16_0[iter_16_1.type] == null then
				log.info("UNKNOWN TYPE", iter_16_1.type)
			else
				var_16_1[iter_16_0] = {}
				var_16_1[iter_16_0].id = var_16_0[iter_16_1.type]
				var_16_1[iter_16_0].value = iter_16_1.value
			end
		end

		if #var_16_1 > 0 then
			globalAction_gotResource(var_16_1)
		end
	end))
	var_15_1:addObject(CCDelayTime:create(1))
	var_15_1:addObject(CCCallFunc:create(function()
		smgr.changeScene(SCENE_MAIN_CITY)
		activityUI.show(activityConstant.TYPES.ACTIVITY_ANCIENT_CASTLE.tag)
	end))
	arg_15_0:runAction(CCSequence:create(var_15_1))
end

function var_0_1.openFinalBox(arg_18_0)
	arg_18_0.ad.state = arg_18_0.ad.STATE.WIN

	cmgr.sendRequest(handler(arg_18_0, arg_18_0.handlerGetMapFinalBoxAction), actions.getMapFinalBox)
end

function var_0_1.showFinalBox(arg_19_0)
	local var_19_0 = CCLayerColor:create(ccc4(0, 0, 0, 128))

	arg_19_0:addChild(var_19_0)

	arg_19_0.boxSprite = CCSprite:create("res/ui/activity/ancientCastle/xbaoxiang.png")

	arg_19_0.boxSprite:setPosition(visibleSize.width / 2, visibleSize.height / 2)
	var_19_0:addChild(arg_19_0.boxSprite)
	var_19_0:registerScriptTouchHandler(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == CCTOUCHENDED then
			if arg_19_0.ad.state ~= arg_19_0.ad.STATE.WIN then
				arg_19_0:openFinalBox()
			end

			return
		end

		return true
	end, false, true)
	var_19_0:setTouchEnabled(true)
end

return var_0_1
