dailyFeatControl = {}

local var_0_0 = dailyFeatControl

function var_0_0.onEnter()
	log.info("dailyFeatControl enter ")
end

function var_0_0.onExit()
	dailyFeatUI.openBoxAnimNode = nil

	log.info("dailyFeatControl exit")
end

function handlerFeatGetRankRewardAction(arg_3_0)
	if arg_3_0.action.state == 1 then
		dailyFeatUI.showFlyText(arg_3_0.action.data)
		var_0_0.featGetRankInfo()
	end
end

function var_0_0.featGetRankReward()
	cmgr.sendRequest(handlerFeatGetRankRewardAction, actions.featGetRankReward)
end

function var_0_0.featGetDrinkReward()
	local function var_5_0(arg_6_0)
		local var_6_0 = dailyFeatUI

		var_6_0.uiTable.arrow:setVisible(false)
		var_6_0.uiTable.btn_drinkBox:setDisabledImage(CCSprite:create("res/ui/rankInfo/DailyFeatView/yq_bx_c.png"))
		var_6_0.uiTable.btn_drinkBox:setEnabled(false)

		local var_6_1 = CCNode:create()
		local var_6_2 = CCSprite:create("res/ui/rankInfo/DailyFeatView/gxb_pb_bx.png")

		var_6_2:setScale(0.5)

		local var_6_3 = CCSprite:createWithSpriteFrameName("res_plus.png")
		local var_6_4 = CCLabelAtlas:create(arg_6_0.action.data.featBoxNum, "res/ui/common/number/get_numb.png", 29, 46, 48)
		local var_6_5 = var_6_2:getContentSize().width
		local var_6_6 = var_6_3:getContentSize().width
		local var_6_7 = var_6_4:getContentSize().width
		local var_6_8 = (var_6_5 + var_6_6 + var_6_7) / 2

		var_6_2:setPositionX(var_6_5 / 2 - var_6_8)
		var_6_4:setPositionX(var_6_5 + var_6_6 + var_6_7 / 2 - var_6_8 - var_6_7 / 2)
		var_6_4:setPositionY(-var_6_4:getContentSize().height / 2)
		var_6_1:addChild(var_6_2)
		var_6_1:addChild(var_6_3)
		var_6_1:addChild(var_6_4)
		var_6_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

		local var_6_9 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
		local var_6_10 = CCDelayTime:create(0.3)
		local var_6_11 = CCMoveTo:create(0.5, ccp(0, visibleSize.height))
		local var_6_12 = CCScaleTo:create(0.5, 0.1)
		local var_6_13 = CCSpawn:createWithTwoActions(var_6_11, var_6_12)
		local var_6_14 = CCCallFuncN:create(function()
			var_6_0.uiTable.npcBg:setVisible(false)
			var_6_0.uiTable.featBackground:setVisible(true)
			var_6_0.uiTable.drinkBg:removeFromParentAndCleanup(true)
			var_0_0.featGetRankInfo()
		end)
		local var_6_15 = CCArray:create()

		var_6_15:addObject(var_6_9)
		var_6_15:addObject(var_6_10)
		var_6_15:addObject(var_6_13)
		var_6_15:addObject(var_6_14)

		local var_6_16 = CCSequence:create(var_6_15)

		var_6_1:runAction(var_6_16)
		smgr.getLayer("pushLayer"):addChild(var_6_1)
	end

	cmgr.sendRequest(var_5_0, actions.featGetDrinkReward)
end

function handlerFeatGetBoxRewardAction(arg_8_0)
	if arg_8_0.action.state == 1 then
		dailyFeatUI.showFlyText(arg_8_0.action.data)

		var_0_0.rankInfo.featBoxNum = var_0_0.rankInfo.featBoxNum - 5

		if var_0_0.rankInfo.featBoxNum < 0 then
			var_0_0.rankInfo.featBoxNum = 0
		end

		if var_0_0.rankInfo.featBoxNum <= 0 then
			var_0_0.featGetRankInfo()
		else
			dailyFeatUI.updateBoxNum(var_0_0.rankInfo)
		end
	end
end

function var_0_0.featGetBoxReward()
	cmgr.sendRequest(handlerFeatGetBoxRewardAction, actions.featGetBoxReward, 0, 5)
end

function handlerFeatGetRankInfoAction(arg_10_0)
	if arg_10_0.action.state == 1 then
		var_0_0.rankInfo = arg_10_0.action.data

		dailyFeatUI.updateFeatPanel(var_0_0.rankInfo)

		if arg_10_0.action.data.featBoxNum <= 0 then
			user.welfare.setWelfare("batReward", false)
		else
			user.welfare.setWelfare("batReward", true)
		end
	end
end

function var_0_0.featGetRankInfo()
	cmgr.sendRequest(handlerFeatGetRankInfoAction, actions.featGetRankInfo)
end

function var_0_0.onTouch(arg_12_0, arg_12_1, arg_12_2)
	log.debug("control onTouch at ", arg_12_1, arg_12_2, arg_12_0)

	if arg_12_0 == CCTOUCHBEGAN then
		if dailyFeatUI.openBoxAnimNode and tool.checkIfTouch(dailyFeatUI.openBoxAnimNode, arg_12_1, arg_12_2) then
			dailyFeatUI.uiTable.openBoxButton:setVisible(true)
			pcall(dailyFeatUI.openBoxAnimNode.removeFromParentAndCleanup, dailyFeatUI.openBoxAnimNode, true)

			dailyFeatUI.openBoxAnimNode = nil
		end

		if dailyFeatUI.bjSprite and not tolua.isnull(dailyFeatUI.bjSprite) then
			dailyFeatUI.bjSprite:removeFromParentAndCleanup(true)

			dailyFeatUI.bjSprite = nil
		end

		return true
	elseif arg_12_0 == CCTOUCHMOVED then
		return true
	elseif arg_12_0 == CCTOUCHENDED then
		return true
	end
end
