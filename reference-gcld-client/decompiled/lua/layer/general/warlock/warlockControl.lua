local var_0_0 = {
	cardPosition = {
		ccp(459, 250),
		ccp(276, 250),
		ccp(638, 250),
		ccp(95, 250),
		(ccp(819, 250))
	}
}
local var_0_1 = -1
local var_0_2 = false
local var_0_3 = {}
local var_0_4 = {}
local var_0_5 = {}
local var_0_6 = false
local var_0_7 = true
local var_0_8 = false

function var_0_0.init(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.view = arg_1_2
	arg_1_0.layout = arg_1_3
	arg_1_0.root = arg_1_1
	arg_1_0.selectedWarlock = 0
	arg_1_0.canLevelUp = false
	arg_1_0.state = nil
	arg_1_0.currentWarlock = nil
	arg_1_0.warlocklist = nil

	log.info("术士工坊，resetFlag")

	var_0_1 = -1
	var_0_2 = false
	var_0_0.openTip = {
		language.get(20011),
		language.get(20012),
		language.get(20013),
		language.get(20014),
		language.get(20015)
	}
	var_0_0.pic = {
		"zc",
		"zj",
		"yj",
		"nhlx",
		"sjxs"
	}
end

function var_0_0.createResearchNumLabel(arg_2_0, arg_2_1)
	arg_2_1 = arg_2_1 or 0

	local var_2_0 = CCNode:create()
	local var_2_1
	local var_2_2

	log.info("@@ num ", arg_2_1)

	if arg_2_1 > 10 then
		local var_2_3 = math.floor(arg_2_1 / 10)

		if var_2_3 == 1 then
			var_2_3 = 10
		end

		local var_2_4 = math.fmod(arg_2_1, 10)
		local var_2_5 = CCRectMake((var_2_3 - 1) * 34, 0, 34, 28)
		local var_2_6 = CCRectMake((var_2_4 - 1) * 34, 0, 34, 28)

		var_2_1 = CCSprite:create("res/ui/warlock/warlock_tit_nb.png", var_2_5)
		var_2_2 = CCSprite:create("res/ui/warlock/warlock_tit_nb.png", var_2_6)
	elseif arg_2_1 <= 10 and arg_2_1 > 0 then
		var_2_1 = CCSprite:create("res/ui/warlock/warlock_tit_nb.png", CCRectMake((arg_2_1 - 1) * 34, 0, 34, 28))
		var_2_2 = CCSprite:createWithSpriteFrameName("warlock_tit_ci.png")
	elseif arg_2_1 == 0 then
		var_2_1 = CCSprite:createWithSpriteFrameName("warlock_tit_wu.png")
	end

	if var_2_1 and var_2_2 then
		var_2_1:setPosition(ccp(0, 14))
		var_2_2:setPosition(ccp(0, -14))
		var_2_0:addChild(var_2_1)
		var_2_0:addChild(var_2_2)
	elseif var_2_1 then
		var_2_0:addChild(var_2_1)
	end

	return var_2_0
end

function var_0_0.createResearchDigitalNumLabel(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or 0

	local var_3_0 = CCNode:create()

	if arg_3_1 > 0 then
		local var_3_1 = CCLabelAtlas:create(tostring(arg_3_1), "res/ui/warlock/warlock_tit_nb.png", 22, 28, 48)

		if arg_3_1 < 10 then
			var_3_1:setPosition(ccp(-8, 4))
		else
			var_3_1:setPosition(ccp(-16, 4))
		end

		var_3_0:addChild(var_3_1)

		local var_3_2 = CCSprite:createWithSpriteFrameName("warlock_tit_ci.png")

		var_3_2:setPosition(ccp(4, -10))
		var_3_0:addChild(var_3_2)
	else
		local var_3_3 = CCSprite:createWithSpriteFrameName("warlock_tit_wu.png")

		var_3_3:setPosition(ccp(4, 4))
		var_3_0:addChild(var_3_3)
	end

	return var_3_0
end

function var_0_0.showWarlockAnim(arg_4_0)
	if var_0_0.animSmokeNode then
		var_0_0.view.widgets.root:removeChild(var_0_0.animSmokeNode, true)
	end

	if var_0_0.animWarlockNode then
		var_0_0.view.widgets.root:removeChild(var_0_0.animWarlockNode, true)
	end

	local var_4_0 = rmgr.getAnimation("warlock")
	local var_4_1 = CCAnimation:createWithSpriteFrames(var_4_0, 0.08)
	local var_4_2 = CCAnimate:create(var_4_1)
	local var_4_3 = CCRepeatForever:create(var_4_2)

	var_0_0.animWarlockNode = CCSprite:create()

	var_0_0.animWarlockNode:runAction(var_4_3)
	var_0_0.animWarlockNode:setPosition(ccp(205, 250))
	var_0_0.view.widgets.root:addChild(var_0_0.animWarlockNode)

	local var_4_4 = rmgr.getAnimation("warlockSmoke")
	local var_4_5 = CCAnimation:createWithSpriteFrames(var_4_4, 0.08)
	local var_4_6 = CCAnimate:create(var_4_5)
	local var_4_7 = CCRepeatForever:create(var_4_6)

	var_0_0.animSmokeNode = CCSprite:create()

	var_0_0.animSmokeNode:runAction(var_4_7)
	var_0_0.animSmokeNode:setPosition(ccp(200, 420))
	var_0_0.view.widgets.root:addChild(var_0_0.animSmokeNode)
end

function var_0_0.showUpgradeEffect(arg_5_0, arg_5_1)
	if var_0_0.upgradeAnimNode then
		pcall(var_0_0.upgradeAnimNode.removeFromParentAndCleanup, var_0_0.upgradeAnimNode, true)

		var_0_0.upgradeAnimNode = nil
	end

	local var_5_0 = rmgr.getAnimation("warlockUpgrade")
	local var_5_1 = CCAnimation:createWithSpriteFrames(var_5_0, 0.08)
	local var_5_2 = CCAnimate:create(var_5_1)
	local var_5_3 = CCRepeat:create(var_5_2, 1)
	local var_5_4 = CCSprite:create()

	var_0_0.upgradeAnimNode = var_5_4

	local var_5_5 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_5_5:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			return true
		elseif arg_6_0 == CCTOUCHMOVED then
			return true
		elseif arg_6_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	log.debug("add mask")
	var_5_5:setTouchEnabled(true)
	var_5_5:addChild(var_5_4, 500)
	log.info("upgradeAnimNode added to background")
	var_5_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_5_6 = CCArray:create()

	var_5_6:addObject(var_5_3)

	local function var_5_7()
		if arg_5_1 then
			arg_5_1()
		end

		pcall(var_5_4.removeFromParentAndCleanup, var_5_4, true)

		var_5_4 = nil

		var_5_5:removeFromParentAndCleanup(true)
	end

	smgr.rootLayer:addChild(var_5_5, 60000)
	var_5_6:addObject(CCCallFuncN:create(var_5_7))
	var_5_4:runAction(CCSequence:create(var_5_6))

	arg_5_0 = arg_5_0 or "res/ui/common/text/warlock/warlock_build_upgr.png"

	local var_5_8 = CCSprite:create(arg_5_0)

	var_5_8:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
	smgr.showTipSpriteText(var_5_8)
end

function var_0_0.showBuildFinishAnim(arg_8_0, arg_8_1)
	local var_8_0 = "res/ui/common/text/warlock/warlock_build_upgr.png"

	if not arg_8_0 then
		var_8_0 = "res/ui/common/text/warlock/warlock_build_esta.png"
	end

	local var_8_1 = CCSprite:create(var_8_0)

	var_8_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	smgr.showTipSpriteText(var_8_1, arg_8_1)
end

function var_0_0.handlerBuildFactory(arg_9_0)
	var_0_0.state = arg_9_0.action.data.state

	if var_0_0.state > 1 then
		var_0_0.showUpgradeEffect()
	end

	var_0_0:refresh()
end

function var_0_0.buyDrawings()
	require("lua/layer/resource/ui")
	resourceUI.show(4)
end

function var_0_0.buildFactory()
	log.info("btn工坊")
	cmgr.sendRequest(var_0_0.handlerBuildFactory, actions.buildWarlockfactory)
end

function var_0_0.allStartResearch()
	log.info("btn一键开始")

	local var_12_0 = 1
	local var_12_1 = 0
	local var_12_2 = var_0_3

	local function var_12_3(arg_13_0)
		var_12_0 = var_12_0 + 1

		if var_12_0 <= #var_12_2 then
			var_12_1 = var_12_2[var_12_0]

			cmgr.sendRequest(var_12_3, actions.researchWarlock, var_12_1)
		else
			local var_13_0 = CCSprite:create("res/ui/common/text/warlock/warlock_research_start.png")
			local var_13_1 = visibleSize.width * 0.5
			local var_13_2 = visibleSize.height * 0.5

			var_13_0:setPosition(ccp(var_13_1, var_13_2 - 50))
			smgr.showTipSpriteText(var_13_0)
			var_0_0:refresh()
		end
	end

	if #var_12_2 > 0 then
		var_12_1 = var_12_2[var_12_0]

		cmgr.sendRequest(var_12_3, actions.researchWarlock, var_12_1)
	end
end

function var_0_0.allStopResearch()
	log.info("btn一键停止")

	local var_14_0 = 1
	local var_14_1 = 0
	local var_14_2 = var_0_4

	local function var_14_3(arg_15_0)
		var_14_0 = var_14_0 + 1

		if var_14_0 <= #var_14_2 then
			var_14_1 = var_14_2[var_14_0]

			cmgr.sendRequest(var_14_3, actions.phantomStopWizard, var_14_1)
		else
			local var_15_0 = CCSprite:create("res/ui/common/text/warlock/warlock_research_stop.png")
			local var_15_1 = visibleSize.width * 0.5
			local var_15_2 = visibleSize.height * 0.5

			var_15_0:setPosition(ccp(var_15_1, var_15_2 - 50))
			smgr.showTipSpriteText(var_15_0)
			var_0_0:refresh()
		end
	end

	if #var_14_2 > 0 then
		var_14_1 = var_14_2[var_14_0]

		cmgr.sendRequest(var_14_3, actions.phantomStopWizard, var_14_1)
	end
end

function var_0_0.allGetResearchResult()
	log.info("btn一键领取")

	local var_16_0 = var_0_5

	local function var_16_1(arg_17_0)
		var_0_0.getJiebingAllTip(arg_17_0.action.data.gainInfo)
		var_0_0:refresh()
	end

	if #var_16_0 > 0 then
		cmgr.sendRequest(var_16_1, actions.warlockTotalGainDone)
	end
end

function var_0_0.handlerGetResearchResult(arg_18_0)
	var_0_0:refresh()

	if arg_18_0.action.data.num == 0 then
		user.welfare.setWelfare("wizardIconType", 0)
	end

	var_0_0.getJiebingTip(arg_18_0.action.data.num)
	var_0_0:refresh()
end

function var_0_0.getResearchResult(arg_19_0, arg_19_1)
	local var_19_0 = tolua.cast(arg_19_1, "CCControlButton")
	local var_19_1 = tolua.cast(var_19_0:getUserObject(), "CCString"):getCString()

	cmgr.sendRequest(var_0_0.handlerGetResearchResult, actions.warlockGainDoneNum, var_19_1)
end

function var_0_0.handlerResearch(arg_20_0)
	local var_20_0 = CCSprite:create("res/ui/common/text/warlock/warlock_research.png")
	local var_20_1 = visibleSize.width * 0.5
	local var_20_2 = visibleSize.height * 0.5

	var_20_0:setPosition(ccp(var_20_1, var_20_2 - 50))
	smgr.showTipSpriteText(var_20_0)
	var_0_0:refresh()
end

function var_0_0.research(arg_21_0, arg_21_1)
	local var_21_0 = tolua.cast(arg_21_1, "CCControlButton")
	local var_21_1 = tolua.cast(var_21_0:getUserObject(), "CCString"):getCString()

	cmgr.sendRequest(var_0_0.handlerResearch, actions.researchWarlock, var_21_1)
end

function var_0_0.handlerUpgradeWarlock(arg_22_0)
	local var_22_0 = CCSprite:create("res/ui/common/text/warlock/warlock_upgr.png")
	local var_22_1 = visibleSize.width * 0.5
	local var_22_2 = visibleSize.height * 0.5

	var_22_0:setPosition(ccp(var_22_1, var_22_2 - 50))
	smgr.showTipSpriteText(var_22_0)
	var_0_0:refresh()
end

function var_0_0.upgradeWarlock(arg_23_0, arg_23_1)
	local var_23_0 = tolua.cast(arg_23_1, "CCControlButton")
	local var_23_1 = tolua.cast(var_23_0:getUserObject(), "CCString"):getCString()
	local var_23_2 = tonumber(var_23_1)

	local function var_23_3()
		cmgr.sendRequest(var_0_0.handlerUpgradeWarlock, actions.upgradeWarlock, var_23_2)
	end

	if var_0_0.warlocklist then
		for iter_23_0, iter_23_1 in pairs(var_0_0.warlocklist) do
			if iter_23_1.wizardId == var_23_2 then
				log.info("should show tips ")

				local var_23_4 = CCLayerColor:create(ccc4(255, 255, 255, 0))

				var_23_4:registerScriptTouchHandler(function(arg_25_0, arg_25_1, arg_25_2)
					if arg_25_0 == CCTOUCHBEGAN then
						return true
					elseif arg_25_0 == CCTOUCHMOVED then
						return true
					elseif arg_25_0 == CCTOUCHENDED then
						pcall(var_23_4.removeFromParentAndCleanup, var_23_4, true)

						return true
					end
				end, false, true)
				var_23_4:setTouchEnabled(true)
				smgr.rootLayer:addChild(var_23_4, 60000)
				autoUI.createUI(var_23_4, getUpgradeWarlockTipFrame(iter_23_1), var_0_0.view.widgets)
				var_0_0.view.widgets.tip_bar:setScaleX(1.8)
				var_0_0.view.widgets.btn_upgradeWarlock:registerScriptTapHandler(function()
					log.info("btn升级")
					pcall(var_23_4.removeFromParentAndCleanup, var_23_4, true)
					messageBox.confirm(language.get(20039, iter_23_1.upgradeGold), var_23_3)
				end)

				break
			end
		end
	end
end

function var_0_0.handlerGetExtraNum(arg_27_0)
	var_0_0.getJiebingTip(arg_27_0.action.data.num)
	var_0_0:refresh()
end

function var_0_0.getExtraNum(arg_28_0, arg_28_1)
	local var_28_0 = tolua.cast(arg_28_1, "CCControlButton")
	local var_28_1 = tolua.cast(var_28_0:getUserObject(), "CCString"):getCString()

	cmgr.sendRequest(var_0_0.handlerGetExtraNum, actions.getFreeNumFromWarlock, var_28_1)
end

function var_0_0.upgradeButtonLight(arg_29_0)
	local var_29_0 = CCArray:create()

	var_29_0:addObject(CCFadeOut:create(0.4))
	var_29_0:addObject(CCFadeIn:create(0.4))

	local var_29_1 = CCSequence:create(var_29_0)

	arg_29_0:runAction(CCRepeatForever:create(var_29_1))
end

function var_0_0.showWarlockTab(arg_30_0, arg_30_1)
	var_0_6 = false
	var_0_7 = true
	var_0_8 = false

	for iter_30_0, iter_30_1 in pairs(arg_30_1) do
		local var_30_0 = iter_30_1.wizardId
		local var_30_1 = var_0_0.cardPosition[var_30_0]
		local var_30_2 = {}

		if iter_30_1.level then
			uiutil.initWidgets(var_30_2, var_0_0.layout.warlock_card)

			var_0_0.view.widgets["card_" .. var_30_0] = var_30_2.widgets.warlock_card

			var_0_0.view.widgets.panel:addChild(var_30_2.widgets.warlock_card)
			var_30_2.widgets.warlock_card:setPosition(var_30_1)
			var_30_2.widgets["warlock_name_lv" .. iter_30_1.level .. "_" .. var_30_0]:setVisible(true)

			local var_30_3 = CCString:create(var_30_0)

			var_30_2.widgets.upgradeWarlock:setUserObject(var_30_3)
			var_30_2.widgets.getJiebing:setUserObject(var_30_3)

			if iter_30_1.flag == 0 and iter_30_1.todayMax == iter_30_1.todayNum and iter_30_1.todayMax ~= 0 then
				var_30_2.widgets.warlock_close_card:setVisible(true)

				if iter_30_1.extraNum > 0 then
					table.insert(var_0_5, iter_30_1.wizardId)

					var_0_8 = true

					var_30_2.widgets.getJiebingLight:setVisible(true)
					var_30_2.widgets.getJiebing:setVisible(true)
					var_30_2.widgets.getJiebing:addHandleOfControlEvent(var_0_0.getExtraNum, CCControlEventTouchUpInside)
					var_0_0.upgradeButtonLight(var_30_2.widgets.getJiebingLight)
				end

				if iter_30_1.level == 0 then
					var_30_2.widgets.upgradeLight:setVisible(true)
					var_30_2.widgets.upgradeWarlock:setVisible(true)
					var_30_2.widgets.upgradeWarlock:addHandleOfControlEvent(var_0_0.upgradeWarlock, CCControlEventTouchUpInside)
					var_0_0.upgradeButtonLight(var_30_2.widgets.upgradeLight)
				end
			else
				var_0_7 = false

				var_30_2.widgets["warlock_" .. var_30_0]:setVisible(true)
				var_30_2.widgets.warlockInfo:setVisible(true)

				local var_30_4

				if conf.language == "kr" or conf.language == "vie" or conf.language == "tha" then
					var_30_4 = var_0_0:createResearchDigitalNumLabel(iter_30_1.todayMax - iter_30_1.todayNum)
				else
					var_30_4 = var_0_0:createResearchNumLabel(iter_30_1.todayMax - iter_30_1.todayNum)
				end

				var_30_2.widgets.researchNumNode:addChild(var_30_4)

				if iter_30_1.level == 0 then
					var_30_2.widgets.upgradeLight:setVisible(true)
					var_30_2.widgets.upgradeWarlock:setVisible(true)
					var_30_2.widgets.upgradeWarlock:addHandleOfControlEvent(var_0_0.upgradeWarlock, CCControlEventTouchUpInside)
					var_0_0.upgradeButtonLight(var_30_2.widgets.upgradeLight)
				elseif iter_30_1.extraNum > 0 then
					var_30_2.widgets.getJiebingLight:setVisible(true)
					var_30_2.widgets.getJiebing:setVisible(true)
					var_30_2.widgets.getJiebing:addHandleOfControlEvent(var_0_0.getExtraNum, CCControlEventTouchUpInside)
					var_0_0.upgradeButtonLight(var_30_2.widgets.getJiebingLight)
					var_30_2.widgets.state_bg:setVisible(true)
					var_30_2.widgets.state_keLQ:setVisible(true)
					table.insert(var_0_5, iter_30_1.wizardId)

					var_0_8 = true
				end

				if iter_30_1.flag == 2 then
					var_30_2.widgets.jieBingIcon:setVisible(true)
					var_30_2.widgets.jiebingNumLabel:setVisible(true)
					var_30_2.widgets.jiebingNumLabel:setString(language.get(20030, iter_30_1.doneNum))
					var_30_2.widgets.state_bg:setVisible(true)
					var_30_2.widgets.state_keLQ:setVisible(true)
					table.insert(var_0_5, iter_30_1.wizardId)

					var_0_8 = true
				elseif iter_30_1.flag == 1 then
					var_30_2.widgets.clockIcon:setVisible(true)

					local function var_30_5()
						arg_30_0:refresh()
					end

					local var_30_6 = iter_30_1.time - iter_30_1.nowTime
					local var_30_7 = createTimerLabel(var_30_6, "@M:@S", "Thonburi", 22, var_30_5, nil, nil, colorTips.red)

					var_30_2.widgets.timerNode:addChild(var_30_7)
					var_30_2.widgets.state_bg:setVisible(true)

					if iter_30_1.nextStoped and iter_30_1.nextStoped == 1 then
						var_30_2.widgets.state_yiTZ:setVisible(true)
						table.insert(var_0_3, iter_30_1.wizardId)
					else
						var_30_2.widgets.state_yanJZ:setVisible(true)
						table.insert(var_0_4, iter_30_1.wizardId)

						var_0_6 = true
					end
				elseif iter_30_1.flag == 0 then
					var_30_2.widgets.resIcon:setVisible(true)
					var_30_2.widgets.reseachConsumeLabel:setVisible(true)
					var_30_2.widgets.reseachConsumeLabel:setString(language.get(20028, iter_30_1.cost))
					table.insert(var_0_3, iter_30_1.wizardId)
				end
			end
		else
			uiutil.initWidgets(var_30_2, var_0_0.layout.card_unopen)

			var_0_0.view.widgets["card_" .. var_30_0] = var_30_2.widgets.card_unopen

			var_30_2.widgets.card_unopen:setPosition(var_30_1)
			var_0_0.view.widgets.panel:addChild(var_30_2.widgets.card_unopen)
		end
	end
end

function var_0_0.showWarlockFactoryLevel(arg_32_0)
	if arg_32_0 == 0 then
		var_0_0.view.widgets.title_no:setVisible(true)
	elseif var_0_0.view.widgets["title_leve_" .. arg_32_0] then
		var_0_0.view.widgets["title_leve_" .. arg_32_0]:setVisible(true)
	end
end

function var_0_0.getJiebingTip(arg_33_0)
	local var_33_0 = smgr.getLayer("tipLayer")
	local var_33_1 = CCLabelAtlas:create(tostring(arg_33_0), "res/ui/common/number/get_numb.png", 29, 46, 48)
	local var_33_2 = CCSprite:createWithSpriteFrameName("res_plus.png")
	local var_33_3 = CCSprite:create("res/ui/common/text/warlock/warlock_get_result.png")

	var_33_1:setAnchorPoint(ccp(0.5, 0.5))

	local var_33_4 = createRichNode({
		var_33_3,
		var_33_2,
		var_33_1
	})

	var_33_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

	local var_33_5 = CCMoveTo:create(0.3, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
	local var_33_6 = CCDelayTime:create(0.3)
	local var_33_7 = CCMoveTo:create(0.5, ccp(0, visibleSize.height))
	local var_33_8 = CCScaleTo:create(0.5, 0.1)
	local var_33_9 = CCSpawn:createWithTwoActions(var_33_7, var_33_8)

	local function var_33_10()
		var_33_0:removeChild(var_33_4, true)
	end

	local var_33_11 = CCCallFuncN:create(var_33_10)
	local var_33_12 = CCArray:create()

	var_33_12:addObject(var_33_5)
	var_33_12:addObject(var_33_6)
	var_33_12:addObject(var_33_9)
	var_33_12:addObject(var_33_11)

	local var_33_13 = CCSequence:create(var_33_12)

	var_33_4:runAction(var_33_13)
	var_33_0:addChild(var_33_4)
end

function var_0_0.getJiebingAllTip(arg_35_0)
	for iter_35_0 = 1, #arg_35_0 do
		if arg_35_0[iter_35_0].num > 0 then
			local var_35_0 = smgr.getLayer("tipLayer")
			local var_35_1 = CCLabelAtlas:create(tostring(arg_35_0[iter_35_0].num), "res/ui/common/number/get_numb.png", 29, 46, 48)
			local var_35_2 = CCSprite:createWithSpriteFrameName("res_plus.png")
			local var_35_3 = CCSprite:create("res/ui/common/text/warlock/warlock_get_result.png")

			var_35_1:setAnchorPoint(ccp(0.5, 0.5))

			local var_35_4 = createRichNode({
				var_35_3,
				var_35_2,
				var_35_1
			})

			var_35_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4 - iter_35_0 * 35))

			local var_35_5 = CCMoveTo:create(0.8, ccp(visibleSize.width / 2, visibleSize.height * 0.6 - iter_35_0 * 35))
			local var_35_6 = CCDelayTime:create(0.5)
			local var_35_7 = CCMoveTo:create(0.8, ccp(0, visibleSize.height))
			local var_35_8 = CCScaleTo:create(0.5, 0.1)
			local var_35_9 = CCSpawn:createWithTwoActions(var_35_7, var_35_8)

			local function var_35_10()
				var_35_0:removeChild(var_35_4, true)
			end

			local var_35_11 = CCCallFuncN:create(var_35_10)
			local var_35_12 = CCArray:create()

			var_35_12:addObject(var_35_5)
			var_35_12:addObject(var_35_6)
			var_35_12:addObject(var_35_9)
			var_35_12:addObject(var_35_11)

			local var_35_13 = CCSequence:create(var_35_12)

			var_35_4:runAction(var_35_13)
			var_35_0:addChild(var_35_4)
		end
	end
end

function var_0_0.showTip()
	local var_37_0 = require("res/layout/helpPanel/warlockHelpLayout")
	local var_37_1 = uiutil.initUIComponent(nil, nil, var_37_0).displayObj

	local function var_37_2(arg_38_0, arg_38_1, arg_38_2)
		log.info("on panel touch ")

		if not tool.checkIfTouch(var_37_1, arg_38_1, arg_38_2) then
			var_0_0.view.widgets.root:removeChild(var_37_1, true)
		end

		return true
	end

	var_37_1:registerScriptTouchHandler(var_37_2, false, true)
	var_37_1:setTouchEnabled(true)
	var_0_0.view.widgets.root:addChild(var_37_1)
end

function var_0_0.showInvestCopperEffect(arg_39_0)
	local var_39_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_39_0:registerScriptTouchHandler(function(arg_40_0, arg_40_1, arg_40_2)
		if arg_40_0 == CCTOUCHBEGAN then
			return true
		elseif arg_40_0 == CCTOUCHMOVED then
			return true
		elseif arg_40_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_39_0:setTouchEnabled(arg_39_0 > 1)
	smgr.rootLayer:addChild(var_39_0, 60000)

	for iter_39_0 = 1, arg_39_0 do
		local var_39_1 = CCSprite:create("res/ui/general/jailView/laofang_tit_jzjd.png")

		var_39_0:addChild(var_39_1)
		var_39_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
		var_39_1:setOpacity(0)

		local var_39_2 = CCArray:create()

		var_39_2:addObject(CCDelayTime:create((iter_39_0 - 1) * 0.3))
		var_39_2:addObject(CCFadeIn:create(0.1))
		var_39_2:addObject(CCMoveBy:create(0.6, ccp(0, 120)))
		var_39_2:addObject(CCFadeOut:create(0.5))
		var_39_2:addObject(CCCallFunc:create(function()
			if iter_39_0 == arg_39_0 then
				var_39_0:removeFromParentAndCleanup(true)

				if var_0_2 then
					var_0_0.showUpgradeEffect("res/ui/common/text/warlock/warlock_build_esta.png", var_0_0.showBuildingLight)

					var_0_2 = false
				end
			end
		end))
		var_39_1:runAction(CCSequence:create(var_39_2))
	end
end

function var_0_0.showBuildingLight()
	var_0_0.view.widgets.btn_building:setEnabled(true)
	var_0_0.view.widgets.pic_djjr:setVisible(true)
	var_0_0.view.widgets.light:setVisible(true)
	var_0_0.view.widgets.bar_progress:setPercentage(100)
	var_0_0.view.widgets.value_progress:setString("100%")

	local var_42_0 = CCArray:create()

	var_42_0:addObject(CCFadeOut:create(0.6))
	var_42_0:addObject(CCFadeIn:create(0.4))

	local var_42_1 = CCSequence:create(var_42_0)

	var_0_0.view.widgets.light:runAction(CCRepeatForever:create(var_42_1))
end

function var_0_0.handleBuildBtnTap_LJ()
	log.info("btn立即建成")
	messageBox.confirm(language.get(85062), function()
		require("lua/layer/resource/ui")
		resourceUI.show(4)
	end)
end

function var_0_0.handleBuildBtnTap_KS()
	log.info("btn快速建造")

	local function var_45_0(arg_46_0)
		if arg_46_0.action.state == 1 then
			var_0_0:refresh()
			var_0_0.showInvestCopperEffect(5)
		end
	end

	cmgr.sendRequest(var_45_0, actions.phantomInvestCopper, 2)
end

function var_0_0.handleBuildBtnTap_PT()
	log.info("btn普通建造")

	local function var_47_0(arg_48_0)
		if arg_48_0.action.state == 1 then
			var_0_0:refresh()
			var_0_0.showInvestCopperEffect(1)
		end
	end

	cmgr.sendRequest(var_47_0, actions.phantomInvestCopper, 1)
end

function var_0_0.handleBuildBtnTap_TZ()
	log.info("btn图纸建造")
	var_0_0.view.widgets.btn_build_TZ:setVisible(false)
	var_0_0.showUpgradeEffect("res/ui/common/text/warlock/warlock_build_esta.png", var_0_0.showBuildingLight)
end

function var_0_0.handlerWarlockInfo(arg_50_0)
	log.info("@@ 术士等级 ", arg_50_0.action.data.workShop.state)

	var_0_0.canLevelUp = arg_50_0.action.data.workShop.canLevelUp
	var_0_0.state = arg_50_0.action.data.workShop.state

	var_0_0.root:removeAllChildrenWithCleanup(true)

	var_0_0.view = {}

	if var_0_0.state == 0 then
		uiutil.initLayout(var_0_0.view, var_0_0.layout.panel_notBuilt)
		var_0_0.root:addChild(var_0_0.view.widgets.root)
		var_0_0.view.widgets.btn_building:addHandleOfControlEvent(var_0_0.buildFactory, CCControlEventTouchUpInside)

		local var_50_0 = arg_50_0.action.data.workShop

		if var_50_0.buildLv and user.player.playerLv < var_50_0.buildLv then
			var_0_0.view.widgets.btn_building:setEnabled(true)
			var_0_0.view.widgets.open_level:setVisible(true)
			var_0_0.view.widgets.open_level:setString(language.get(85063, var_50_0.buildLv))
		elseif not var_0_0.canLevelUp then
			if var_0_1 == -1 then
				var_0_1 = var_50_0.finished
			elseif var_50_0.finished == 1 and var_0_1 ~= 1 then
				var_0_2 = true
				var_0_1 = var_50_0.finished
			end

			if var_50_0.finished == 1 then
				if not var_0_2 then
					var_0_0.showBuildingLight()
				end

				var_0_0.view.widgets.btn_building:setEnabled(true)
				var_0_0.view.widgets.bar_progress:setPercentage(100)
				var_0_0.view.widgets.value_progress:setString("100%")
			else
				var_0_0.view.widgets.btn_building:setEnabled(false)

				local var_50_1 = 0

				if var_50_0.investCopper and var_50_0.needCopper then
					var_50_1 = math.floor(100 * var_50_0.investCopper / var_50_0.needCopper)
				end

				var_0_0.view.widgets.bar_progress:setPercentage(var_50_1)
				var_0_0.view.widgets.value_progress:setString(var_50_1 .. "%")
				var_0_0.view.widgets.btn_build_LJ:setVisible(true)
				var_0_0.view.widgets.btn_build_LJ:addHandleOfControlEvent(var_0_0.handleBuildBtnTap_LJ, CCControlEventTouchUpInside)
				var_0_0.view.widgets.btn_build_KS:setVisible(true)
				var_0_0.view.widgets.btn_build_KS:addHandleOfControlEvent(var_0_0.handleBuildBtnTap_KS, CCControlEventTouchUpInside)
				var_0_0.view.widgets.btn_build_PT:setVisible(true)
				var_0_0.view.widgets.btn_build_PT:addHandleOfControlEvent(var_0_0.handleBuildBtnTap_PT, CCControlEventTouchUpInside)
				var_0_0.view.widgets.cost_build_KS:setVisible(true)
				var_0_0.view.widgets.cost_build_KS:setString(language.get(75021, math.floor(var_50_0.keyNum / 10000)))
				var_0_0.view.widgets.cost_build_PT:setVisible(true)
				var_0_0.view.widgets.cost_build_PT:setString(language.get(75021, math.floor(var_50_0.singleNum / 10000)))
			end
		else
			var_0_0.view.widgets.btn_building:setEnabled(false)
			var_0_0.view.widgets.btn_build_TZ:setVisible(true)
			var_0_0.view.widgets.btn_build_TZ:addHandleOfControlEvent(var_0_0.handleBuildBtnTap_TZ, CCControlEventTouchUpInside)
			var_0_0.view.widgets.bar_progress:setPercentage(0)
			var_0_0.view.widgets.value_progress:setString("0%")
		end
	else
		uiutil.initLayout(var_0_0.view, var_0_0.layout.panel_alreadyBuilt)
		var_0_0.root:addChild(var_0_0.view.widgets.root)
		var_0_0.view.widgets.tipButton:addHandleOfControlEvent(var_0_0.showTip, CCControlEventTouchUpInside)
		var_0_0.showWarlockFactoryLevel(var_0_0.state)

		if var_0_0.canLevelUp then
			var_0_0.view.widgets.upgradeButton:setVisible(true)
			var_0_0.view.widgets.buyMapButton:setVisible(false)
			var_0_0.view.widgets.upgradeButton:addHandleOfControlEvent(var_0_0.buildFactory, CCControlEventTouchUpInside)
		elseif var_0_0.state < 5 then
			var_0_0.view.widgets.upgradeButton:setVisible(false)
			var_0_0.view.widgets.buyMapButton:setVisible(true)
			var_0_0.view.widgets.buyMapButton:addHandleOfControlEvent(var_0_0.buyDrawings, CCControlEventTouchUpInside)
		end

		local var_50_2 = language.get(20036, arg_50_0.action.data.workShop.nowNum)
		local var_50_3 = ccc3(255, 189, 66)

		if arg_50_0.action.data.workShop.nowNum >= arg_50_0.action.data.workShop.maxNum then
			var_50_2 = var_50_2 .. language.get(20037)

			if arg_50_0.action.data.workShop.phantomMax == 1 then
				var_50_2 = var_50_2 .. language.get(20040)
			end

			var_50_3 = ccc3(253, 98, 98)
		end

		var_0_0.view.widgets.jiebingTotalNumLabel:setString(var_50_2)
		var_0_0.view.widgets.jiebingTotalNumLabel:setColor(var_50_3)

		var_0_0.warlocklist = arg_50_0.action.data.workShop.panel
		var_0_3, var_0_4, var_0_5 = {}, {}, {}

		var_0_0:showWarlockTab(var_0_0.warlocklist)

		if var_0_6 then
			var_0_0.view.widgets.btn_stop:setVisible(true)
			var_0_0.view.widgets.btn_stop:addHandleOfControlEvent(var_0_0.allStopResearch, CCControlEventTouchUpInside)
		else
			var_0_0.view.widgets.btn_start:setVisible(true)
			var_0_0.view.widgets.btn_start:addHandleOfControlEvent(var_0_0.allStartResearch, CCControlEventTouchUpInside)
			var_0_0.view.widgets.btn_start:setEnabled(not var_0_7)
		end

		var_0_0.view.widgets.btn_get:setEnabled(true)
		var_0_0.view.widgets.btn_get:addHandleOfControlEvent(var_0_0.allGetResearchResult, CCControlEventTouchUpInside)
		var_0_0.view.widgets.btn_get:setEnabled(var_0_8)

		local var_50_4 = 0

		for iter_50_0, iter_50_1 in pairs(arg_50_0.action.data.workShop.panel) do
			if iter_50_1.canGainNum then
				var_50_4 = iter_50_1.canGainNum + var_50_4
			end
		end

		if var_50_4 >= 1 then
			user.welfare.setWelfare("wizardIconType", var_50_4)
		else
			user.welfare.setWelfare("wizardIconType", 0)
		end
	end
end

function var_0_0.getWarlockInfo()
	cmgr.sendRequest(var_0_0.handlerWarlockInfo, actions.warlockInfo)
end

function var_0_0.refresh(arg_52_0)
	log.info("刷新界面")
	arg_52_0.getWarlockInfo()
end

return var_0_0
