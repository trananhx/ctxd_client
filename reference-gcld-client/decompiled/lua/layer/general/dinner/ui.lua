tool.requireRes("general/dinner")

dinnerUI = {}
dinnerUI.uiTable = {}

local var_0_0 = dinnerControl

function dinnerUI.exchange()
	local var_1_0 = smgr.getLayer("dinnerLayer")

	dinnerUI.j = nil
	dinnerUI.k = nil
	dinnerUI.m = nil
	dinnerUI.l = nil

	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end

	if var_1_0 ~= null and not tolua.isnull(var_1_0) then
		var_1_0:removeAllChildrenWithCleanup(true)
	end

	return var_0_0.getDinnerInfo()
end

function dinnerUI.dinneraway()
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
end

function dinnerUI.dinnerBegin()
	dinnerUI.animation()

	return var_0_0.haveDinner()
end

function dinnerUI.dinnerAddForce(arg_4_0)
	dinnerUI.j = 100
	dinnerUI.k = 100
	dinnerUI.m = 100
	dinnerUI.l = 100

	if dinnerUI.uiTable.dinnerRole01JinDuTiao ~= nil then
		dinnerUI.j = dinnerUI.uiTable.dinnerRole01JinDuTiao:getPercentage()
	end

	if dinnerUI.uiTable.dinnerRole02JinDuTiao ~= nil then
		dinnerUI.k = dinnerUI.uiTable.dinnerRole02JinDuTiao:getPercentage()
	end

	if dinnerUI.uiTable.dinnerRole03JinDuTiao ~= nil then
		dinnerUI.m = dinnerUI.uiTable.dinnerRole03JinDuTiao:getPercentage()
	end

	if dinnerUI.uiTable.dinnerRole04JinDuTiao ~= nil then
		dinnerUI.l = dinnerUI.uiTable.dinnerRole04JinDuTiao:getPercentage()
	end

	local var_4_0 = CCPointMake(285, 390)

	if arg_4_0 == 2 then
		var_4_0 = CCPointMake(530, 225)
	elseif arg_4_0 == 3 then
		var_4_0 = CCPointMake(360, 335)
	elseif arg_4_0 == 4 then
		var_4_0 = CCPointMake(620, 190)
	end

	dinnerUI.uiTable.dinnerChiefRoleTalk:setString(var_0_0.data.chiefContents)
	dinnerUI.uiTable.dinnerChiefRoleTalkTable:setVisible(true)

	local var_4_1 = CCDelayTime:create(1.5)
	local var_4_2 = CCDelayTime:create(1.5)

	local function var_4_3()
		if arg_4_0 == 2 or arg_4_0 == 4 then
			dinnerUI.uiTable.dinnerGeneralRoleTalkTable:setVisible(false)
		else
			dinnerUI.uiTable.dinnerGeneralRoleTalkTable2:setVisible(false)
		end
	end

	local var_4_4 = CCCallFunc:create(var_4_3)
	local var_4_5 = CCCallFunc:create(function()
		dinnerUI.uiTable.dinnerChiefRoleTalkTable:setVisible(false)

		if arg_4_0 == 2 or arg_4_0 == 4 then
			dinnerUI.uiTable.dinnerGeneralRoleTalkTable:setPosition(var_4_0)
			dinnerUI.uiTable.dinnerGeneralRoleTalk:setString(var_0_0.data.generalContents)
			dinnerUI.uiTable.dinnerGeneralRoleTalkTable:setVisible(true)
		else
			dinnerUI.uiTable.dinnerGeneralRoleTalkTable2:setPosition(var_4_0)
			dinnerUI.uiTable.dinnerGeneralRoleTalk2:setString(var_0_0.data.generalContents)
			dinnerUI.uiTable.dinnerGeneralRoleTalkTable2:setVisible(true)
		end
	end)
	local var_4_6 = CCArray:create()

	var_4_6:addObject(var_4_1)
	var_4_6:addObject(var_4_5)
	var_4_6:addObject(var_4_2)
	var_4_6:addObject(var_4_4)

	local var_4_7 = CCSequence:create(var_4_6)

	dinnerUI.uiTable.dinnerChiefRoleTalkTable:runAction(var_4_7)

	function updateForce()
		if dinnerUI.j < 100 then
			dinnerUI.j = dinnerUI.j + 1

			if dinnerUI.uiTable.dinnerRole01JinDuTiao ~= nil and not tolua.isnull(dinnerUI.uiTable.dinnerRole01JinDuTiao) then
				dinnerUI.uiTable.dinnerRole01JinDuTiao:setPercentage(dinnerUI.j)
			end
		end

		if dinnerUI.k < 100 then
			dinnerUI.k = dinnerUI.k + 1

			if dinnerUI.uiTable.dinnerRole02JinDuTiao ~= nil and not tolua.isnull(dinnerUI.uiTable.dinnerRole02JinDuTiao) then
				dinnerUI.uiTable.dinnerRole02JinDuTiao:setPercentage(dinnerUI.k)
			end
		end

		if dinnerUI.m < 100 then
			dinnerUI.m = dinnerUI.m + 1

			if dinnerUI.uiTable.dinnerRole03JinDuTiao ~= nil and not tolua.isnull(dinnerUI.uiTable.dinnerRole03JinDuTiao) then
				dinnerUI.uiTable.dinnerRole03JinDuTiao:setPercentage(dinnerUI.m)
			end
		end

		if dinnerUI.l < 100 then
			dinnerUI.l = dinnerUI.l + 1

			if dinnerUI.uiTable.dinnerRole04JinDuTiao ~= nil and not tolua.isnull(dinnerUI.uiTable.dinnerRole04JinDuTiao) then
				dinnerUI.uiTable.dinnerRole04JinDuTiao:setPercentage(dinnerUI.l)
			end
		end

		if dinnerUI.j >= 100 and dinnerUI.k >= 100 and dinnerUI.m >= 100 and dinnerUI.l >= 100 then
			dinnerUI.exchange()
		end
	end

	var_0_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(updateForce, 0.1, false)
end

function dinnerUI.moveSprite(arg_8_0)
	if arg_8_0 == 1 then
		local var_8_0 = CCMoveTo:create(1, ccp(350, 100))
		local var_8_1 = CCMoveTo:create(1, ccp(410, 100))
		local var_8_2 = CCCallFunc:create(dinnerUI.restSprite1)
		local var_8_3 = CCArray:create()

		var_8_3:addObject(var_8_0)
		var_8_3:addObject(var_8_1)
		var_8_3:addObject(var_8_2)

		local var_8_4 = CCSequence:create(var_8_3)
		local var_8_5 = CCRepeatForever:create(var_8_4)

		sprite:runAction(var_8_5)
	else
		local var_8_6 = CCMoveTo:create(1, ccp(610, 102))
		local var_8_7 = CCMoveTo:create(1, ccp(550, 102))
		local var_8_8 = CCCallFunc:create(dinnerUI.restSprite2)
		local var_8_9 = CCArray:create()

		var_8_9:addObject(var_8_6)
		var_8_9:addObject(var_8_7)
		var_8_9:addObject(var_8_8)

		local var_8_10 = CCSequence:create(var_8_9)
		local var_8_11 = CCRepeatForever:create(var_8_10)

		sprite2:runAction(var_8_11)
	end
end

function dinnerUI.restSprite1()
	sprite:setPosition(290, 100)
end

function dinnerUI.restSprite2()
	sprite2:setPosition(670, 102)
end

function dinnerUI.animation()
	return
end

function dinnerUI.init()
	local var_12_0 = {}

	if conf.language == "kr" then
		var_12_0.timePosX = 130
	else
		var_12_0.timePosX = 0
	end

	local var_12_1 = smgr.getLayer("dinnerLayer")

	dinnerUI.uiTable = autoUI.initUI(var_12_1, getDinnerData())

	dinnerUI.uiTable.tipItem:registerScriptTapHandler(dinnerUI.dinneraway)
	dinnerUI.uiTable.leftAutoSupplyCnt:setString(language.get(84014, var_0_0.data.remainRecruitNum))
	require("lua/guide/control")

	guide.uiElementsTable[1020] = dinnerUI.uiTable.tipItem

	if guide.callback then
		if var_0_0.isFull == 0 then
			guide.callback()
		end

		guide.callback = nil
	end

	if var_0_0.dinnerNum == 0 then
		dinnerUI.uiTable.dinnerUpdataLabel:setVisible(true)
		require("lua/component/timerLabel")

		local var_12_2 = createTimerLabel(var_0_0.data.millisecond, "@H:@M:@S", "Thonburi-Bold", 25, var_0_0.getDinnerInfo, nil, nil, ccc3(214, 88, 54))

		var_12_2:setPosition(ccp(230 + var_12_0.timePosX, 538))
		var_12_1:addChild(var_12_2)
	elseif var_0_0.isFull == 0 then
		dinnerUI.uiTable.dinnerButton1Label:setVisible(false)
		dinnerUI.uiTable.dinnerButton2Label:setVisible(true)
		dinnerUI.uiTable.dinnerChiefRoleTalkTable:setVisible(false)
		dinnerUI.uiTable.dinnerProcessAnimation11:setVisible(false)
		dinnerUI.uiTable.dinnerProcessAnimation21:setVisible(false)
		dinnerUI.uiTable.dinnerProcessLabel:setVisible(false)
		dinnerUI.uiTable.dinnerGeneralRoleTalkTable:setVisible(false)
		dinnerUI.uiTable.dinnerGeneralRoleTalkTable2:setVisible(false)

		local var_12_3 = 0

		if var_0_0.length == 4 then
			if var_0_0.generalInfos[1].type == 0 and var_0_0.generalInfos[2].type == 0 and var_0_0.generalInfos[3].type == 0 and var_0_0.generalInfos[4].type == 0 then
				var_12_3 = 1
			end
		elseif var_0_0.length == 5 then
			if var_0_0.generalInfos[1].type == 0 and var_0_0.generalInfos[2].type == 0 and var_0_0.generalInfos[3].type == 0 and var_0_0.generalInfos[4].type == 0 and var_0_0.generalInfos[5].type == 0 then
				var_12_3 = 3
			end
		elseif var_0_0.generalInfos[1].type == 0 and var_0_0.generalInfos[2].type == 0 and var_0_0.generalInfos[3].type == 0 then
			var_12_3 = 2
		end

		if var_12_3 ~= 0 then
			dinnerUI.uiTable.tipItem:unregisterScriptTapHandler()

			local function var_12_4()
				local var_13_0 = {}

				if conf.language == "vie" then
					var_13_0.labelX = 150
					var_13_0.labelMoveToX = 150
					var_13_0.labelMoveToY = -150
				else
					var_13_0.labelX = 0
					var_13_0.labelMoveToX = 0
					var_13_0.labelMoveToY = 0
				end

				local var_13_1 = smgr.getLayer("dinnerLayer")
				local var_13_2 = CCLabelTTF:create(language.get(84001), "Thonburi-Bold", 25)

				var_13_2:setColor(ccc3(255, 255, 0))
				var_13_1:addChild(var_13_2, 105, 2222)
				var_13_2:setPosition(480, -var_13_2:getContentSize().height * 0.5)

				local var_13_3 = CCMoveTo:create(1.5, ccp(480, visibleSize.width * 0.4))
				local var_13_4 = CCDelayTime:create(0.5)
				local var_13_5 = CCCallFunc:create(function()
					var_13_1:removeChild(var_13_2, true)
				end)
				local var_13_6 = CCArray:create()

				var_13_6:addObject(var_13_3)
				var_13_6:addObject(var_13_4)
				var_13_6:addObject(var_13_5)

				if var_13_2:numberOfRunningActions() == 0 then
					var_13_2:runAction(CCSequence:create(var_13_6))
				end
			end

			dinnerUI.uiTable.tipItem:registerScriptTapHandler(var_12_4)
		else
			dinnerUI.uiTable.tipItem:unregisterScriptTapHandler()
			dinnerUI.uiTable.tipItem:registerScriptTapHandler(dinnerUI.dinnerBegin)
		end
	end
end

function dinnerUI.show()
	rmgr.loadResource("res/ui/dinner/dinner.plist")

	local var_15_0 = createBaseLayer()

	smgr.registerLayer(var_15_0, "dinnerLayer")

	var_15_0.onEnter = var_0_0.onEnter
	var_15_0.onExit = var_0_0.onExit

	var_0_0.getDinnerInfo()

	return var_15_0
end

function dinnerUI.playDinnerAnimation(arg_16_0)
	local function var_16_0(arg_17_0)
		local var_17_0 = dinnerUI.uiTable[arg_17_0]

		if var_17_0 then
			local var_17_1 = CCStrokeLabelTTF:create(language.get(84013, arg_16_0.addGeneralExp / 10000), "Thonburi-Bold", 22)

			var_17_1:setColor(colorQuality[4])
			var_17_0:addChild(var_17_1)

			local var_17_2 = CCArray:create()

			var_17_2:addObject(CCMoveBy:create(0.8, ccp(0, 30)))
			var_17_2:addObject(CCCallFunc:create(function()
				var_17_1:removeFromParentAndCleanup(true)
			end))
			var_17_1:runAction(CCSequence:create(var_17_2))
		end
	end

	if arg_16_0.addGeneralExp and arg_16_0.addGeneralExp > 0 then
		for iter_16_0 = 1, var_0_0.length do
			var_16_0("expRewardLabel_" .. iter_16_0)
		end
	end

	dinnerUI.uiTable.leftAutoSupplyCnt:setString(language.get(84014, arg_16_0.remainRecruitNum))
	dinnerUI.uiTable.dinnerStart2:setString(string.format("%d/6", arg_16_0.dinnerNum))
end
