local var_0_0 = require("lua/common/CCBNode")
local var_0_1 = class("IronRotary", function()
	return createBaseLayer()
end)

function var_0_1.ctor(arg_2_0, arg_2_1, arg_2_2)
	log.info(tool.tableToJson(arg_2_2))

	local var_2_0 = var_0_0:create(arg_2_0)
	local var_2_1, var_2_2 = var_2_0:getPosition()

	var_2_0:setPosition(ccp(var_2_1, var_2_2 - 30))
	arg_2_1:addChild(arg_2_0)

	arg_2_0.isTouchOn = false
	arg_2_0.data = arg_2_2

	arg_2_0.needLabel:setString(language.get("134002_yyl"))
	arg_2_0.rotaryLabel:setString(language.get("134003_yyl"))
	arg_2_0.buyLabel:setString(language.get("134004_yyl"))
	arg_2_0.light:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))
	arg_2_0.nextIron:setString(arg_2_2.ironRotaryEventNeedNum)

	if arg_2_2.ironRotaryEventLeftCount > 0 then
		arg_2_0.remainNum:setString(arg_2_2.ironRotaryEventLeftCount)
	else
		arg_2_0.remainNum:setVisible(false)
	end

	arg_2_0.rewardBg:setVisible(false)

	if arg_2_2.baseNum and arg_2_2.baseNum > 0 then
		arg_2_0.remainNum:setVisible(false)
		arg_2_0.reward:setString(language.get("134001_yyl", arg_2_2.baseNum / 10000))
		arg_2_0.rewardBg:setVisible(true)
	end

	arg_2_0.gold:setString(arg_2_2.ironRotaryEventGold)
	arg_2_0.prog:setType(kCCProgressTimerTypeRadial)
	arg_2_0.prog:setMidpoint(ccp(0.5, 0.5))
	arg_2_0.prog:setBarChangeRate(ccp(1, 0))
	arg_2_0.power:setMidpoint(ccp(0, 1))
	arg_2_0.power:setBarChangeRate(ccp(0, 1))
	arg_2_0.prog:setPercentage(arg_2_2.ironRotaryEventAlreadyCount * 10)

	local var_2_3 = {
		0,
		45,
		90,
		135,
		180,
		225,
		270,
		315
	}

	if arg_2_2.ironRotaryEventAlreadyCount == 10 then
		local var_2_4 = CCFadeIn:create(1)
		local var_2_5 = var_2_4:reverse()
		local var_2_6 = CCSequence:createWithTwoActions(var_2_4, var_2_5)

		arg_2_0.fullProgLight:runAction(CCRepeatForever:create(var_2_6))
	else
		arg_2_0.fullProgLight:setVisible(false)
	end

	for iter_2_0, iter_2_1 in pairs(arg_2_2.allures) do
		if arg_2_0.curAllureId == nil then
			arg_2_0.curAllureId = iter_2_1.id
		end

		local var_2_7 = CCSprite:create("res/ui/activity/ironRotary/bint.png")
		local var_2_8 = 180
		local var_2_9 = 180
		local var_2_10 = 130
		local var_2_11 = math.sin(math.rad(var_2_3[iter_2_0])) * var_2_10 + var_2_8
		local var_2_12 = math.cos(math.rad(var_2_3[iter_2_0])) * var_2_10 + var_2_9

		var_2_7:setPosition(ccp(var_2_11, var_2_12))
		var_2_7:setRotation(var_2_3[iter_2_0])
		arg_2_0.zhuanpan:addChild(var_2_7)

		local var_2_13 = math.sin(math.rad(var_2_3[iter_2_0])) * var_2_10 / 1.4 + var_2_8
		local var_2_14 = math.cos(math.rad(var_2_3[iter_2_0])) * var_2_10 / 1.4 + var_2_9
		local var_2_15 = CCStrokeLabelTTF:create(language.get("134001_yyl", iter_2_1.num / 10000), "Thonburi", 24)

		var_2_15:setPosition(ccp(var_2_13, var_2_14))
		var_2_15:setRotation(var_2_3[iter_2_0])
		arg_2_0.zhuanpan:addChild(var_2_15)
	end

	if arg_2_2.extraType then
		arg_2_0.extraNum = arg_2_2.extraNum
		arg_2_0.extraIron = arg_2_2.extraIron
		arg_2_0.extraType = arg_2_2.extraType
		arg_2_0.extraItemId = arg_2_2.extraItemId

		for iter_2_2 = 1, 10 do
			local var_2_16 = tool.random(-50, 50)
			local var_2_17 = tool.random(-50, -20)
			local var_2_18 = CCSprite:create("res/ui/activity/ironRotary/bint.png")

			var_2_18:setPosition(ccp(157.5, 157))
			arg_2_0.rewardBg:addChild(var_2_18)
			var_2_18:runAction(CCJumpBy:create(0.4, ccp(var_2_16, var_2_17), 20, 1))
		end

		local var_2_19 = {
			{
				scale = 1,
				name = "res/ui/activity/ironRotary/bint.png"
			},
			{
				scale = 1,
				name = "res/ui/activity/gemsActivity/icon_gem.png"
			},
			{
				scale = 0.5,
				name = "res/ui/activity/ironReward/acti_iron_icon_1.jpg"
			},
			{
				scale = 1,
				name = "res/ui/activity/ironRotary/get_icon_zhunpan.png"
			},
			[1501] = {
				scale = 0.5,
				name = "res/ui/activity/ironReward/acti_iron_icon_1.jpg"
			},
			[1502] = {
				scale = 0.5,
				name = "res/ui/activity/ironReward/acti_iron_icon_2.jpg"
			},
			[1503] = {
				scale = 0.5,
				name = "res/ui/activity/ironReward/acti_iron_icon_5.jpg"
			},
			[1504] = {
				scale = 0.5,
				name = "res/ui/activity/ironReward/acti_iron_icon_3.jpg"
			},
			[1505] = {
				scale = 0.5,
				name = "res/ui/activity/ironReward/acti_iron_icon_4.jpg"
			}
		}
		local var_2_20 = tool.random(-50, 50)
		local var_2_21 = tool.random(-50, -20)
		local var_2_22

		if arg_2_2.extraType ~= 3 then
			var_2_22 = CCSprite:create(var_2_19[arg_2_2.extraType].name)

			var_2_22:setScale(var_2_19[arg_2_2.extraType].scale)
		else
			var_2_22 = CCSprite:create(var_2_19[arg_2_2.extraItemId].name)

			var_2_22:setScale(var_2_19[arg_2_2.extraItemId].scale)
		end

		var_2_22:setPosition(ccp(157.5, 157))
		arg_2_0.rewardBg:addChild(var_2_22)
		var_2_22:runAction(CCJumpBy:create(0.4, ccp(var_2_20, var_2_21), 20, 1))
	end

	if conf.language == "vie" then
		arg_2_0.needLabel:setPosition(ccp(arg_2_0.needLabel:getPositionX() - 35, arg_2_0.needLabel:getPositionY()))
		arg_2_0.rotaryLabel:setPosition(ccp(arg_2_0.rotaryLabel:getPositionX() + 35, arg_2_0.rotaryLabel:getPositionY()))
	elseif conf.language == "tha" then
		arg_2_0.rotaryLabel:setPosition(ccp(arg_2_0.rotaryLabel:getPositionX() + 25, arg_2_0.rotaryLabel:getPositionY()))
	end
end

function var_0_1.buyNum(arg_3_0)
	log.info("buy number")

	local function var_3_0(arg_4_0)
		local var_4_0 = {
			{}
		}

		var_4_0[1].id = 10004
		var_4_0[1].value = 1

		globalAction_gotResource(var_4_0)
		eventManager.dispatchEvent("getActivityInfo")
	end

	messageBox.showChargeWinWithData(language.get(10003), language.get("134005_yyl", arg_3_0.data.ironRotaryEventGold), "buyIronRotaryCount", function()
		cmgr.sendRequest(var_3_0, actions.buyIronRotaryCount)
	end)
end

function var_0_1.rotary(arg_6_0)
	if arg_6_0.rotaryState == 1 then
		return
	end

	if arg_6_0.rewardBg:isVisible() == true then
		local var_6_0 = {
			4,
			7,
			10005,
			10004
		}

		var_6_0[1501] = 10005
		var_6_0[1502] = 10007
		var_6_0[1503] = 10006
		var_6_0[1504] = 10006
		var_6_0[1505] = 10006

		local var_6_1 = {
			{}
		}

		var_6_1[1].id = var_6_0[1]
		var_6_1[1].value = arg_6_0.rewardNum or arg_6_0.data.baseNum

		if arg_6_0.extraIron then
			var_6_1[2] = {}
			var_6_1[2].id = var_6_0[1]
			var_6_1[2].value = arg_6_0.extraIron
		end

		if arg_6_0.extraType then
			var_6_1[3] = {}

			if arg_6_0.extraType ~= 3 then
				var_6_1[3].id = var_6_0[arg_6_0.extraType]
			else
				var_6_1[3].id = var_6_0[arg_6_0.extraItemId]
			end

			var_6_1[3].value = arg_6_0.extraNum
		end

		globalAction_gotResource(var_6_1)

		local function var_6_2(arg_7_0)
			eventManager.dispatchEvent("getActivityInfo")
		end

		cmgr.sendRequest(var_6_2, actions.ironRotaryEventReward)
	else
		local function var_6_3(arg_8_0)
			arg_6_0.rotaryState = 1

			local var_8_0 = arg_8_0.action.data.baseNum
			local var_8_1 = arg_8_0.action.data.id

			arg_6_0.rewardNum = var_8_0
			arg_6_0.extraNum = arg_8_0.action.data.extraNum
			arg_6_0.extraIron = arg_8_0.action.data.extraIron
			arg_6_0.extraType = arg_8_0.action.data.extraType
			arg_6_0.extraItemId = arg_8_0.action.data.extraItemId

			local var_8_2
			local var_8_3

			for iter_8_0 = 1, #arg_6_0.data.allures do
				local var_8_4 = arg_6_0.data.allures[iter_8_0]

				if var_8_4.id == arg_6_0.curAllureId then
					var_8_2 = iter_8_0
				end

				if var_8_4.id == var_8_1 then
					var_8_3 = iter_8_0
				end
			end

			local var_8_5 = var_8_2 - var_8_3

			if var_8_5 < 0 then
				var_8_5 = var_8_5 + #arg_6_0.data.allures
			end

			local var_8_6 = tool.toint(arg_6_0.powerNum / 25) + 1
			local var_8_7 = var_8_5 + var_8_6 * 8
			local var_8_8 = var_8_6 + 0.5
			local var_8_9 = var_8_7 * 45
			local var_8_10 = CCEaseExponentialOut:create(CCRotateBy:create(var_8_8, var_8_9))
			local var_8_11 = CCCallFuncN:create(function()
				arg_6_0.reward:setString(language.get("134001_yyl", var_8_0 / 10000))
				arg_6_0.rewardBg:setVisible(true)

				if arg_6_0.extraType then
					for iter_9_0 = 1, 10 do
						local var_9_0 = tool.random(-50, 50)
						local var_9_1 = tool.random(-50, -20)
						local var_9_2 = CCSprite:create("res/ui/activity/ironRotary/bint.png")

						var_9_2:setPosition(ccp(157.5, 157))
						arg_6_0.rewardBg:addChild(var_9_2)
						var_9_2:runAction(CCJumpBy:create(0.4, ccp(var_9_0, var_9_1), 20, 1))
					end

					local var_9_3 = {
						{
							scale = 1,
							name = "res/ui/activity/ironRotary/bint.png"
						},
						{
							scale = 1,
							name = "res/ui/activity/gemsActivity/icon_gem.png"
						},
						{
							scale = 0.5,
							name = "res/ui/activity/ironReward/acti_iron_icon_1.jpg"
						},
						{
							scale = 1,
							name = "res/ui/activity/ironRotary/get_icon_zhunpan.png"
						},
						[1501] = {
							scale = 0.5,
							name = "res/ui/activity/ironReward/acti_iron_icon_1.jpg"
						},
						[1502] = {
							scale = 0.5,
							name = "res/ui/activity/ironReward/acti_iron_icon_2.jpg"
						},
						[1503] = {
							scale = 0.5,
							name = "res/ui/activity/ironReward/acti_iron_icon_5.jpg"
						},
						[1504] = {
							scale = 0.5,
							name = "res/ui/activity/ironReward/acti_iron_icon_3.jpg"
						},
						[1505] = {
							scale = 0.5,
							name = "res/ui/activity/ironReward/acti_iron_icon_4.jpg"
						}
					}
					local var_9_4 = tool.random(-50, 50)
					local var_9_5 = tool.random(-50, -20)
					local var_9_6

					if arg_6_0.extraType ~= 3 then
						var_9_6 = CCSprite:create(var_9_3[arg_6_0.extraType].name)

						var_9_6:setScale(var_9_3[arg_6_0.extraType].scale)
					else
						var_9_6 = CCSprite:create(var_9_3[arg_6_0.extraItemId].name)

						var_9_6:setScale(var_9_3[arg_6_0.extraItemId].scale)
					end

					var_9_6:setPosition(ccp(157.5, 157))
					arg_6_0.rewardBg:addChild(var_9_6)
					var_9_6:runAction(CCJumpBy:create(0.4, ccp(var_9_4, var_9_5), 20, 1))
				end

				arg_6_0.rotaryState = 0
			end)

			arg_6_0.zhuanpan:runAction(CCSequence:createWithTwoActions(var_8_10, var_8_11))
		end

		if arg_6_0.data.ironRotaryEventLeftCount > 0 then
			cmgr.sendRequest(var_6_3, actions.getIronRotaryEventRotate)
		else
			arg_6_0:buyNum()
		end
	end
end

function var_0_1.onEnter(arg_10_0)
	arg_10_0.touchBeganRef = handler(arg_10_0, arg_10_0.onTouchBegan)
	arg_10_0.touchMovedRef = handler(arg_10_0, arg_10_0.onTouchMoved)
	arg_10_0.touchEndedRef = handler(arg_10_0, arg_10_0.onTouchEnded)
	arg_10_0.touchCancelledRef = handler(arg_10_0, arg_10_0.onTouchCancelled)

	eventManager.registerEvent("globalOnTouchBegan", arg_10_0.touchBeganRef)
	eventManager.registerEvent("globalOnTouchMoved", arg_10_0.touchMovedRef)
	eventManager.registerEvent("globalOnTouchEnded", arg_10_0.touchEndedRef)
	eventManager.registerEvent("globalOnTouchCancelled", arg_10_0.touchCancelledRef)

	arg_10_0.updateRef = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_10_0, arg_10_0.update), 0, false)
end

function var_0_1.onExit(arg_11_0)
	eventManager.unregisterEvent("globalOnTouchBegan", arg_11_0.touchBeganRef)
	eventManager.unregisterEvent("globalOnTouchMoved", arg_11_0.touchMovedRef)
	eventManager.unregisterEvent("globalOnTouchEnded", arg_11_0.touchEndedRef)
	eventManager.unregisterEvent("globalOnTouchCancelled", arg_11_0.touchCancelledRef)

	if arg_11_0.updateRef then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_11_0.updateRef)
	end
end

function var_0_1.update(arg_12_0, arg_12_1)
	if arg_12_0.isTouchOn then
		if arg_12_0.powerNum > 120 then
			arg_12_0.powerNum = 0
		end

		arg_12_0.power:setPercentage(arg_12_0.powerNum)

		arg_12_0.powerNum = arg_12_0.powerNum + arg_12_1 * 100
	end
end

function var_0_1.onTouchBegan(arg_13_0, arg_13_1, arg_13_2)
	if tool.checkIfTouch(arg_13_0.zhuanBtn, arg_13_1, arg_13_2) then
		arg_13_0.isTouchOn = true
		arg_13_0.powerNum = 0
	end
end

function var_0_1.onTouchMoved(arg_14_0, arg_14_1, arg_14_2)
	return
end

function var_0_1.onTouchEnded(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.isTouchOn = false
end

function var_0_1.onTouchCancelled(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.isTouchOn = false
end

return var_0_1
