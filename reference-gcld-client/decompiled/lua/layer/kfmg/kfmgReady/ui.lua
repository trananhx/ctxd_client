local var_0_0 = class("kfmgReady", function()
	return CCLayer:create()
end)

function var_0_0.ctor(arg_2_0, ...)
	arg_2_0.uidata = require("lua/layer/kfmg/kfmgReady/uidata").new()
	arg_2_0.control = require("lua/layer/kfmg/kfmgReady/control").new(arg_2_0)

	arg_2_0:registerScriptHandler(function(arg_3_0)
		if arg_3_0 == "enter" then
			arg_2_0:onEnter()
		elseif arg_3_0 == "exit" then
			arg_2_0:onExit()
		end
	end)
	arg_2_0:setTouchEnabled(true)
	arg_2_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			arg_2_0:onTouchBegan(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			arg_2_0:onTouchMoved(arg_4_1, arg_4_2)

			return true
		elseif arg_4_0 == CCTOUCHENDED then
			arg_2_0:onTouchEnded(arg_4_1, arg_4_2)

			return true
		end
	end, false, true)
	arg_2_0:init()
end

function var_0_0.init(arg_5_0)
	arg_5_0.rewardPicNum = 0
	arg_5_0.uiTable = autoUI.initUI(arg_5_0, arg_5_0.uidata:getData())

	arg_5_0.uiTable.closeButton:registerScriptTapHandler(function()
		arg_5_0:close()
	end)
	arg_5_0.uiTable.tipsBtnMain:registerScriptTapHandler(function()
		tool.createTipsFrame(language.get("hw_kfmg_000001"), arg_5_0, arg_5_0.uiTable.tipsBtnMain, ccp(0, 1), ccp(1, 1))
	end)
	arg_5_0.uiTable.tipsBtnZZ:registerScriptTapHandler(function()
		tool.createTipsFrame(language.get("hw_kfmg_000002"), arg_5_0, arg_5_0.uiTable.tipsBtnZZ, ccp(0, 1), ccp(1, 1))
	end)
	arg_5_0.uiTable.tipsBtnYZ:registerScriptTapHandler(function()
		tool.createTipsFrame(language.get("hw_kfmg_000003"), arg_5_0, arg_5_0.uiTable.tipsBtnYZ, ccp(0, 1), ccp(1, 1))
	end)
	arg_5_0.uiTable.tipsBtnReward:registerScriptTapHandler(function()
		tool.createTipsFrame(language.get("hw_kfmg_000037"), arg_5_0, arg_5_0.uiTable.tipsBtnReward, ccp(0, 1), ccp(1, 1))
	end)
	arg_5_0.uiTable.zhengzhaoButton:registerScriptTapHandler(function()
		messageBox.confirm(language.get("hw_kfmg_000007", arg_5_0.readyData.investInfo.orderGold), function()
			arg_5_0.control:investGoods(0)
		end)
	end)
	arg_5_0.uiTable.phantomButton:addHandleOfControlEvent(function()
		cmgr.stopContinuousRequest()

		if user.chargeItems.jiebingGold ~= nil and user.chargeItems.jiebingGold.noDisturb == true then
			arg_5_0.isContinousRequest = true

			arg_5_0.control:continuousInvestGoods(1, arg_5_0.uiTable.jiebinButton)
		elseif tonumber(arg_5_0.readyData.investInfo.freePhantomNum) > 0 then
			cmgr.setContinuousRequestLimit(tonumber(arg_5_0.readyData.investInfo.freePhantomNum))

			arg_5_0.isContinousRequest = true

			arg_5_0.control:continuousInvestGoods(1, arg_5_0.uiTable.jiebinButton)
		else
			arg_5_0.isContinousRequest = false
		end
	end, CCControlEventTouchDown)
	arg_5_0.uiTable.phantomButton:addHandleOfControlEvent(function()
		if cmgr.continuousRequestState ~= cmgr.continuousRequestStates.WAIT_FOR_TRIGGER and arg_5_0.isContinousRequest then
			cmgr.stopContinuousRequest()
		else
			cmgr.stopContinuousRequest()

			if user.chargeItems.jiebingGold.noDisturb or tonumber(arg_5_0.readyData.investInfo.freePhantomNum) > 0 then
				arg_5_0.control:investGoods(1)
			else
				messageBox.showChargeWin(language.get(190080), language.get("hw_kfmg_000008", arg_5_0.readyData.investInfo.phantomGold), "jiebingGold", function()
					arg_5_0.control:investGoods(1)
				end)
			end
		end
	end, CCControlEventTouchUpInside)
	arg_5_0.uiTable.phantomButton:addHandleOfControlEvent(function()
		cmgr.stopContinuousRequest()
	end, CCControlEventTouchUpOutside)
	arg_5_0.uiTable.phantomButton:addHandleOfControlEvent(function()
		cmgr.stopContinuousRequest()
	end, CCControlEventTouchCancel)

	arg_5_0.readyData = nil

	arg_5_0.control:refreshData()
end

function var_0_0.initData(arg_18_0, arg_18_1)
	arg_18_0.readyData = arg_18_1

	if arg_18_0.readyData.baseInfo.startTime > 0 then
		arg_18_0.startTime = math.floor(arg_18_0.readyData.baseInfo.startTime * 0.001)
	end

	for iter_18_0 = 1, arg_18_0.rewardPicNum do
		if not tolua.isnull(arg_18_0.uiTable["rewardPic_" .. iter_18_0]) then
			arg_18_0.uiTable["rewardPic_" .. iter_18_0]:removeFromParentAndCleanup(true)
		end
	end

	arg_18_0.rewardPicNum = 0

	local var_18_0 = {
		[42] = "res_icon_5.png",
		[5] = "res_icon_6.png"
	}
	local var_18_1 = {
		[1] = 90,
		[2] = 200
	}

	for iter_18_1, iter_18_2 in ipairs(arg_18_0.readyData.notBeCrashed.reward) do
		local var_18_2 = CCSprite:create("res/ui/kfmg/kfmgReady/kfmgz_cbyj_wupin_di.png")

		if #arg_18_0.readyData.notBeCrashed.reward == 2 then
			var_18_2:setPosition(ccp(var_18_1[iter_18_1], 48))
		else
			var_18_2:setPosition(ccp(150, 48))
		end

		local var_18_3 = CCSprite:createWithSpriteFrameName(var_18_0[iter_18_2.type])

		var_18_3:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))

		local var_18_4 = CCStrokeLabelTTF:create(iter_18_2.value, "Thonburi", 22, 2, colorText[10005])

		var_18_4:setPosition(ccp(var_18_2:getContentSize().width / 2, 24))

		local var_18_5 = CCSprite:createWithSpriteFrameName("jianglikuang1.png")

		var_18_5:setScale(0.8)
		var_18_5:setPosition(ccp(var_18_2:getContentSize().width / 2, var_18_2:getContentSize().height / 2))
		var_18_2:addChild(var_18_5, 1)
		var_18_2:addChild(var_18_3, 2)
		var_18_2:addChild(var_18_4, 3)
		arg_18_0.uiTable.maxReward_bg2:addChild(var_18_2)

		arg_18_0.rewardPicNum = arg_18_0.rewardPicNum + 1
		arg_18_0.uiTable["rewardPic_" .. arg_18_0.rewardPicNum] = var_18_2
	end

	for iter_18_3, iter_18_4 in ipairs(arg_18_0.readyData.crashOtherCity.reward) do
		local var_18_6 = CCSprite:create("res/ui/kfmg/kfmgReady/kfmgz_cbyj_wupin_di.png")

		if #arg_18_0.readyData.crashOtherCity.reward == 2 then
			var_18_6:setPosition(ccp(var_18_1[iter_18_3] + 255, 48))
		else
			var_18_6:setPosition(ccp(405, 48))
		end

		local var_18_7 = CCSprite:createWithSpriteFrameName(var_18_0[iter_18_4.type])

		var_18_7:setPosition(ccp(var_18_6:getContentSize().width / 2, var_18_6:getContentSize().height / 2))

		local var_18_8 = iter_18_4.value * 3
		local var_18_9 = CCStrokeLabelTTF:create(var_18_8, "Thonburi", 22, 2, colorText[10005])

		var_18_9:setPosition(ccp(var_18_6:getContentSize().width / 2, 24))

		local var_18_10 = CCSprite:createWithSpriteFrameName("jianglikuang1.png")

		var_18_10:setScale(0.8)
		var_18_10:setPosition(ccp(var_18_6:getContentSize().width / 2, var_18_6:getContentSize().height / 2))
		var_18_6:addChild(var_18_10, 1)
		var_18_6:addChild(var_18_7, 2)
		var_18_6:addChild(var_18_9, 3)
		arg_18_0.uiTable.maxReward_bg2:addChild(var_18_6)

		arg_18_0.rewardPicNum = arg_18_0.rewardPicNum + 1
		arg_18_0.uiTable["rewardPic_" .. arg_18_0.rewardPicNum] = var_18_6
	end

	arg_18_0.uiTable.zhengzhaoGoldNum:setString(arg_18_0.readyData.investInfo.orderGold)
	arg_18_0.uiTable.zhengzhaoNum:setString(arg_18_0.readyData.investInfo.tokenNum .. "/" .. arg_18_0.readyData.investInfo.tokenTotalNum)
	arg_18_0.uiTable.zhengzhaoProcess:setPercentage(arg_18_0.readyData.investInfo.tokenNum / arg_18_0.readyData.investInfo.tokenTotalNum * 100)

	if arg_18_0.readyData.investInfo.tokenNum == arg_18_0.readyData.investInfo.tokenTotalNum then
		arg_18_0.uiTable.zhengzhaoFinish:setVisible(true)
		arg_18_0.uiTable.zhengzhaoButton:setVisible(false)
	else
		arg_18_0.uiTable.zhengzhaoFinish:setVisible(false)
		arg_18_0.uiTable.zhengzhaoButton:setVisible(true)
	end

	if arg_18_0.readyData.investInfo.freePhantomNum > 0 then
		arg_18_0.uiTable.freePhantom:setVisible(true)
		arg_18_0.uiTable.phantomGoldIcon:setVisible(false)
		arg_18_0.uiTable.phantomGoldNum:setVisible(false)
	else
		arg_18_0.uiTable.freePhantom:setVisible(false)
		arg_18_0.uiTable.phantomGoldIcon:setVisible(true)
		arg_18_0.uiTable.phantomGoldNum:setVisible(true)
	end

	arg_18_0.uiTable.freePhantom:setString(language.get("hw_kfmg_000005", arg_18_0.readyData.investInfo.freePhantomNum))
	arg_18_0.uiTable.phantomGoldNum:setString(arg_18_0.readyData.investInfo.phantomGold)
	arg_18_0.uiTable.phantomNum:setString(arg_18_0.readyData.investInfo.phantomNum .. "/" .. arg_18_0.readyData.investInfo.phantomTotalNum)
	arg_18_0.uiTable.phantomProcess:setPercentage(arg_18_0.readyData.investInfo.phantomNum / arg_18_0.readyData.investInfo.phantomTotalNum * 100)

	if arg_18_0.readyData.investInfo.phantomNum == arg_18_0.readyData.investInfo.phantomTotalNum then
		arg_18_0.uiTable.phantomFinish:setVisible(true)
		arg_18_0.uiTable.phantomButton:setVisible(false)
	else
		arg_18_0.uiTable.phantomFinish:setVisible(false)
		arg_18_0.uiTable.phantomButton:setVisible(true)
	end
end

function var_0_0.timerUpdate(arg_19_0, arg_19_1)
	if arg_19_0.startTime > 0 then
		local var_19_0, var_19_1, var_19_2 = tool.getHMS(arg_19_0.startTime)

		arg_19_0.uiTable.cd_h:setString(string.format("%02d", var_19_0))
		arg_19_0.uiTable.cd_m:setString(string.format("%02d", var_19_1))
		arg_19_0.uiTable.cd_s:setString(string.format("%02d", var_19_2))

		arg_19_0.startTime = arg_19_0.startTime - 1
	else
		arg_19_0.uiTable.cd_h:setString("00")
		arg_19_0.uiTable.cd_m:setString("00")
		arg_19_0.uiTable.cd_s:setString("00")
	end
end

function var_0_0.close(arg_20_0)
	arg_20_0:removeFromParentAndCleanup(true)
end

function var_0_0.onEnter(arg_21_0)
	arg_21_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_21_0, arg_21_0.timerUpdate), 1, false)
end

function var_0_0.onExit(arg_22_0)
	if arg_22_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_22_0.updateSchedulerEntry)

		arg_22_0.updateSchedulerEntry = nil
	end
end

function var_0_0.onTouchBegan(arg_23_0, arg_23_1, arg_23_2)
	return true
end

function var_0_0.onTouchMoved(arg_24_0, arg_24_1, arg_24_2)
	return true
end

function var_0_0.onTouchEnded(arg_25_0, arg_25_1, arg_25_2)
	return true
end

return var_0_0
