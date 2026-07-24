tool.requireRes("world/hourRankReward")
require("lua/component/timerLabel")

hourRankUI = {}

local var_0_0 = hourRankControl
local var_0_1 = hourRankConstant
local var_0_2 = hourRankUI

hourRankUI.uiTable = nil

function var_0_2.updateRankLayer(arg_1_0)
	log.info("ui.updateRankLayer(worldControl),worldControl.isWholePointKill:", arg_1_0.isWholePointKill, "worldControl.received: ", arg_1_0.received)

	local var_1_0 = smgr.getLayer("hourRankLayer")

	if tolua.isnull(var_1_0) then
		return
	end

	if arg_1_0.isWholePointKill == 1 or arg_1_0.received == 0 then
		var_1_0:setVisible(true)

		if arg_1_0.received == 1 then
			local var_1_1 = var_0_2.uiTable.rankFlag:getContentSize().width

			var_0_2.uiTable.rankFlag:setVisible(true)
			var_0_2.uiTable.rankRewardButton:setVisible(false)
			var_0_2.uiTable.rankPanel:registerScriptTouchHandler(var_0_2.rankPanelOnTouch, false, false)
			var_0_2.uiTable.rankPanel:setTouchEnabled(true)

			if arg_1_0.rank <= 200 and arg_1_0.rank > 0 then
				var_0_2.uiTable.rankTitlePlus:setVisible(false)
				var_0_2.uiTable.rankValueAtlas:setPositionX(var_1_1 * 0.5)
				var_0_2.uiTable.rankValueAtlas:setString(tostring(arg_1_0.rank))

				local var_1_2, var_1_3 = pcall(CCSprite.create, CCSprite, "res/ui/world/hourRank/" .. arg_1_0.title .. ".png")

				var_1_3 = var_1_2 ~= false and var_1_3 or tool.spriteByName(arg_1_0.title .. ".png")

				var_0_2.uiTable.rankTitlePic:setDisplayFrame(var_1_3:displayFrame())
			else
				var_0_2.uiTable.rankValueAtlas:setPositionX(var_1_1 * 0.5 - 10)
				var_0_2.uiTable.rankTitlePlus:setVisible(true)
				var_0_2.uiTable.rankValueAtlas:setString("40")
				var_0_2.uiTable.rankTitlePic:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/rank_name_none.png"):displayFrame())
			end
		else
			var_0_2.uiTable.rankFlag:setVisible(false)
			var_0_2.uiTable.rankRewardButton:setVisible(true)
		end
	elseif not tolua.isnull(var_1_0) then
		var_1_0:setVisible(false)
	end

	local var_1_4 = smgr.getLayer("nationChallengeLayer")

	if var_1_4 and var_1_4:isVisible() then
		var_0_2.uiTable.rankPanel:setVisible(false)
	end
end

function var_0_2.rankPanelOnTouch(arg_2_0, arg_2_1, arg_2_2)
	if var_0_2.uiTable.rankPanel:isVisible() == false then
		return
	end

	if arg_2_0 == CCTOUCHBEGAN then
		if tool.checkIfTouch(hourRankUI.uiTable.rankFlag, arg_2_1, arg_2_2) then
			log.info("should show tips panel")
			var_0_2.showRankTips()
		end

		return true
	elseif arg_2_0 == CCTOUCHMOVED then
		return true
	elseif arg_2_0 == CCTOUCHENDED then
		log.info("should hide tips panel")
		var_0_2.hideRankTips()

		return true
	end

	return true
end

function var_0_2.showRankTips()
	local var_3_0 = smgr.getLayer("hourRankLayer")

	autoUI.createUI(var_3_0, getRankTipsData(worldControl), var_0_2.uiTable)

	local var_3_1 = createTimerLabel(worldControl.leftTime, "@M:@S", "Thonburi-Bold", 24, nil, nil, nil, colorQuality[5])

	var_0_2.uiTable.rankTipsTimerLabelPanel:addChild(var_3_1)
	var_3_1:setPosition(ccp(50, 15))

	local var_3_2, var_3_3 = var_0_2.uiTable.rankPanel:getPosition()

	log.info("ui.uiTable rankPanel:getPosition()", var_3_2, var_3_3)
	var_0_2.uiTable.hourRankTipFrame:setPosition(ccp(var_3_2 - 60, var_3_3 + 80))
	log.info("next stuffs : ", worldControl.nextKillNum, worldControl.nextTitle, worldControl.rank)
end

function var_0_2.hideRankTips()
	local var_4_0 = var_0_2.uiTable.hourRankTipFrame

	if var_4_0 then
		pcall(var_4_0.removeFromParentAndCleanup, var_4_0, true)

		local var_4_1
	end
end

function var_0_2.showRankLayer(arg_5_0)
	local var_5_0 = createBaseLayer()

	smgr.registerLayer(var_5_0, "hourRankLayer")
	log.info("ui.showRankLayer(worldControl),worldControl.isWholePointKill:", arg_5_0.isWholePointKill)
	log.info("current force id: ", user.player.forceId)
	log.info("on enter on exit")

	var_5_0.onEnter = var_0_0.onEnter
	var_5_0.onExit = var_0_0.onExit

	if var_0_2.uiTable then
		var_0_2.uiTable = nil
	end

	var_0_2.uiTable = autoUI.initUI(var_5_0, getHourRankUiData())

	var_0_2.uiTable.rankFlag:setDisplayFrame(CCSprite:create("res/ui/world/hourRank/rank_view_" .. user.player.forceId .. ".png"):displayFrame())
	var_0_0.getWholeKillState()

	return var_5_0
end

function var_0_2.rankRewardButtonTap()
	var_0_0.getReward()
end

function var_0_2.onTouch(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_0 == CCTOUCHBEGAN then
		return true
	elseif arg_7_0 == CCTOUCHMOVED then
		return true
	elseif arg_7_0 == CCTOUCHENDED then
		return true
	end

	log.info("layer on touched")
end

function var_0_2.setVisible(arg_8_0)
	local var_8_0 = smgr.getLayer("hourRankLayer")

	log.info("hourRankUI set visible : ", arg_8_0, var_8_0)
	var_0_2.uiTable.rankPanel:setVisible(arg_8_0)
end
