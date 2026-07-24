clockReward = {}

tool.requireRes("clockReward")
require("lua/component/timerLabel")

clockReward.ui = {}

function clockReward.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		local var_1_0 = arg_1_1 - visibleSize.width / 2
		local var_1_1 = arg_1_2 - visibleSize.height / 2

		if var_1_0 > -280 and var_1_0 < 280 and var_1_1 > -177 and var_1_1 < 177 then
			-- block empty
		else
			smgr.getLayer("topLayer"):removeChild(clockReward.ui.table.layer, true)
		end
	end

	return true
end

function clockReward.ui.action_shake_end()
	local var_2_0 = clockReward.ui.table.effect_node

	var_2_0:removeAllChildrenWithCleanup(true)

	local var_2_1 = clockReward.data
	local var_2_2 = CCSprite:create(string.format("res/ui/common/text/clockReward/clock_reward_type_%d.png", var_2_1.type))

	var_2_2:setPosition(ccp(0, 50))
	var_2_0:addChild(var_2_2)

	local var_2_3 = CCSprite:create("res/ui/clockReward/clock_reward_view.png")

	var_2_3:setPosition(ccp(0, -15))
	var_2_0:addChild(var_2_3)

	local var_2_4 = CCLabelTTF:create(language.get(230001), "", 20)

	var_2_4:setPosition(ccp(81, 20))
	var_2_3:addChild(var_2_4)

	local var_2_5 = CCSprite:createWithSpriteFrameName("res_icon_" .. var_2_1.rewardType .. ".png")

	var_2_5:setPosition(ccp(141, 20))
	var_2_3:addChild(var_2_5)

	local var_2_6 = CCLabelTTF:create(var_2_1.rewardNum, "", 20)

	var_2_6:setPosition(ccp(201, 20))
	var_2_3:addChild(var_2_6)

	local var_2_7 = {}

	if var_2_1.addDice and var_2_1.addDice > 0 then
		log.info("shake end", tool.tableToJson(var_2_1))

		local var_2_8 = {}

		var_2_8.id = 50
		var_2_8.value = var_2_1.addDice

		table.insert(var_2_7, var_2_8)
	end

	if var_2_1.addCard and var_2_1.addCard > 0 then
		local var_2_9 = {}

		var_2_9.id = 10012
		var_2_9.value = var_2_1.addCard

		table.insert(var_2_7, var_2_9)
	end

	if var_2_1.addRacingTimes and var_2_1.addRacingTimes > 0 then
		local var_2_10 = {}

		var_2_10.id = 10022
		var_2_10.value = var_2_1.addRacingTimes

		table.insert(var_2_7, var_2_10)
	end

	if var_2_1.addBomb and var_2_1.addBomb > 0 then
		local var_2_11 = {}

		var_2_11.id = 10049
		var_2_11.value = var_2_1.addBomb

		table.insert(var_2_7, var_2_11)
	end

	if #var_2_7 > 0 then
		globalAction_gotResource(var_2_7)
	end

	var_2_0:setScale(0.1)

	local var_2_12 = CCScaleTo:create(0.3, 1)

	var_2_0:runAction(var_2_12)
	clockReward.ui.table.btn_yes:setEnabled(true)
end

function clockReward.ui.action_shake()
	if clockReward.ui.table.effect_node ~= nil then
		clockReward.ui.table.bg:removeChild(clockReward.ui.table.effect_node, true)
	end

	local var_3_0 = CCNode:create()

	var_3_0:setPosition(ccp(280, 190))
	clockReward.ui.table.bg:addChild(var_3_0, 100)

	clockReward.ui.table.effect_node = var_3_0

	local var_3_1 = CCSprite:create("res/ui/clockReward/lucky/lucky0001.png")

	var_3_1:setPosition(ccp(0, 15))
	var_3_0:addChild(var_3_1)

	local var_3_2 = CCArray:create()

	for iter_3_0 = 1, 7 do
		local var_3_3 = CCSprite:create("res/ui/clockReward/lucky/" .. string.format("lucky%04d.png", iter_3_0))

		var_3_2:addObject(var_3_3:displayFrame())
	end

	local var_3_4 = CCAnimation:createWithSpriteFrames(var_3_2, 0.03)
	local var_3_5 = CCAnimate:create(var_3_4)
	local var_3_6 = CCArray:create()

	var_3_6:addObject(var_3_5)

	local var_3_7 = CCSequence:create(var_3_6)
	local var_3_8 = CCRepeat:create(tolua.cast(var_3_7, "CCActionInterval"), 8)
	local var_3_9 = CCArray:create()

	var_3_9:addObject(var_3_8)

	local var_3_10 = CCCallFuncN:create(clockReward.ui.action_shake_end)

	var_3_9:addObject(var_3_10)

	local var_3_11 = CCSequence:create(var_3_9)

	var_3_1:runAction(var_3_11)
	clockReward.ui.table.current_reward_time_title:setVisible(false)
	clockReward.ui.table.current_reward_time_bg:setVisible(false)
	clockReward.ui.table.current_reward_time_left:setVisible(false)
	clockReward.ui.table.current_reward_time_mid:setVisible(false)
	clockReward.ui.table.current_reward_time_right:setVisible(false)
	clockReward.ui.table.btn_linqu:setVisible(false)
	clockReward.ui.table.btn_yes:setVisible(true)
	clockReward.ui.table.btn_yes:setEnabled(false)
	clockReward.ui.table.title_btn:setString(language.get(230002))
end

function clockReward.ui.update_remain_times(arg_4_0, arg_4_1, arg_4_2)
	if clockReward.ui.table.effect_node ~= nil then
		clockReward.ui.table.bg:removeChild(clockReward.ui.table.effect_node, true)
	end

	user.noticeList.onlineNum = arg_4_0

	if tonumber(arg_4_0) > 0 then
		clockReward.ui.table.current_reward_time_title:setString(language.get(230003))
		clockReward.ui.table.current_reward_time_left:setVisible(true)
		clockReward.ui.table.current_reward_time_mid:setVisible(true)
		clockReward.ui.table.current_reward_time_right:setVisible(true)
		clockReward.ui.table.current_reward_time_mid:setString(arg_4_0)
	else
		if tonumber(arg_4_1) > 0 then
			local var_4_0 = language.get(230006, tonumber(arg_4_1))

			clockReward.ui.table.current_reward_time_title:setString(var_4_0)
		else
			clockReward.ui.table.current_reward_time_title:setString(language.get(230004))
		end

		clockReward.ui.table.current_reward_time_left:setVisible(false)
		clockReward.ui.table.current_reward_time_mid:setVisible(false)
		clockReward.ui.table.current_reward_time_right:setVisible(false)
		clockReward.ui.table.btn_linqu:setEnabled(false)

		if clockReward.ui.table.timer_layer ~= nil then
			clockReward.ui.table.bg:removeChild(clockReward.ui.table.timer_layer, true)
		end

		local var_4_1 = math.floor(arg_4_2)
		local var_4_2 = createTimerLabel(var_4_1, "@H:@M:@S", "Thonburi-Bold", 40, clockReward.control.request_onlineGiftNumber)

		var_4_2:setPosition(ccp(280, 190))

		clockReward.ui.table.timer_layer = var_4_2

		clockReward.ui.table.bg:addChild(var_4_2, 100)

		user.noticeList.onlineNum = false

		eventManager.dispatchEvent("replyClockReward")
	end

	clockReward.ui.table.current_reward_time_title:setVisible(true)
	clockReward.ui.table.current_reward_time_bg:setVisible(true)
	clockReward.ui.table.current_reward_time_des:setVisible(true)
	clockReward.ui.table.layer:setVisible(true)
	clockReward.ui.table.title_btn:setString(language.get(230005))
	clockReward.ui.table.btn_linqu:setVisible(true)
	clockReward.ui.table.btn_yes:setVisible(false)
end

function clockReward.ui.init()
	clockReward.ui.table.btn_linqu:registerScriptTapHandler(clockReward.control.request_onlineGift)
	clockReward.ui.table.btn_yes:registerScriptTapHandler(clockReward.control.request_onlineGiftNumber)
	clockReward.ui.table.btn_linqu:setVisible(false)
	clockReward.ui.table.btn_yes:setVisible(false)
end

function clockReward.ui.show()
	local var_6_0 = createBaseLayer()

	clockReward.ui.table = autoUI.initUI(var_6_0, getClockRewardData())
	clockReward.ui.table.layer = var_6_0

	var_6_0:registerScriptTouchHandler(clockReward.ui.onTouch, false, true)
	var_6_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_6_0, 10000)
	clockReward.ui.init()
	clockReward.control.request_onlineGiftNumber()
	var_6_0:setVisible(false)
end
