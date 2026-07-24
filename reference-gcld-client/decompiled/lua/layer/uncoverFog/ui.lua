local var_0_0 = class("uncoverFog", function()
	return CCLayer:create()
end)

function var_0_0.ctor(arg_2_0)
	rmgr.loadResource("res/ui/activity/activity.plist")

	arg_2_0.uidata = require("lua/layer/uncoverFog/uidata").new(arg_2_0)
	arg_2_0.control = require("lua/layer/uncoverFog/control").new(arg_2_0)

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
	performWithDelay(arg_2_0, function()
		arg_2_0.control:getUncoverFogControlInfo()
	end, 0.1)
end

function var_0_0.init(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0, arg_7_1)
		local var_7_0, var_7_1 = arg_7_1:getPosition()

		arg_7_1:setPosition(ccp(var_7_0 - 20, var_7_1))

		local var_7_2 = arg_7_0 / 1000

		if var_7_2 < 3600 then
			arg_7_1:setString("")

			local var_7_3 = createTimerLabel(var_7_2 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			arg_7_1:addChild(var_7_3)
		elseif var_7_2 < 86400 then
			local var_7_4 = var_7_2 / 3600

			arg_7_1:setString(language.get(131001, tool.toint(var_7_4)))
		else
			local var_7_5 = var_7_2 / 3600 / 24

			arg_7_1:setString(language.get(131002, tool.toint(var_7_5)))
		end
	end

	arg_6_0:removeAllChildrenWithCleanup(true)

	arg_6_0.data = arg_6_1
	arg_6_0.uiTable = autoUI.initUI(arg_6_0, arg_6_0.uidata:getData(arg_6_0.data))

	var_6_0(arg_6_0.data.cd, arg_6_0.uiTable.calcTime)

	local var_6_1 = 0
	local var_6_2 = arg_6_0.data.winMistNum
	local var_6_3 = 0
	local var_6_4 = arg_6_0.data.uncoverMistRewardInfo

	for iter_6_0, iter_6_1 in ipairs(var_6_4) do
		arg_6_0.uiTable["processLabel_" .. iter_6_0]:setString(iter_6_1.condition)

		if var_6_2 > iter_6_1.condition then
			var_6_3 = var_6_3 + 100 / #var_6_4
		else
			local var_6_5 = 0

			if var_6_4[iter_6_0 - 1] ~= nil then
				var_6_5 = var_6_4[iter_6_0 - 1].condition
			end

			if var_6_5 < var_6_2 then
				local var_6_6 = var_6_2 - var_6_5
				local var_6_7 = iter_6_1.condition - var_6_5

				var_6_3 = var_6_3 + var_6_6 * 100 / var_6_7 / #var_6_4
			end
		end

		if iter_6_1.recieved == 1 then
			var_6_1 = var_6_1 + 1
		end
	end

	arg_6_0.uiTable.winMistBar:setPercentage(var_6_3)

	if var_6_1 >= #var_6_4 then
		for iter_6_2 = 1, 4 do
			arg_6_0.uiTable["processLabel_" .. iter_6_2]:setVisible(false)
		end

		for iter_6_3 = 1, 3 do
			arg_6_0.uiTable["gapLevel_" .. iter_6_3]:setVisible(false)
		end

		arg_6_0.uiTable.tishi:setVisible(false)
		arg_6_0.uiTable.processBg:setVisible(false)
		arg_6_0.uiTable.allReward:setVisible(true)

		user.uncoverFog = false
	end

	if var_6_2 >= var_6_4[#var_6_4].condition then
		arg_6_0.uiTable.gotoWorldButtonBg:setVisible(false)
	else
		arg_6_0.uiTable.gotoWorldButton:registerScriptTapHandler(function()
			arg_6_0:gotoWorld()
		end)

		if roleDialogue.control.lvNotEnough then
			taskGuide.uiElement.uncoverFogGotoWorldButton = arg_6_0.uiTable.gotoWorldButton

			performWithDelay(arg_6_0, function()
				taskGuide.showArrow("uncoverFogGotoWorldButton", 1, language.get(138005))
			end, 0.2)

			roleDialogue.control.lvNotEnough = false
		end
	end
end

function var_0_0.gotoWorld(arg_10_0)
	if user.getFunc(10) then
		if smgr.currentSceneTag == SCENE_WORLD then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		end

		if smgr.currentSceneTag ~= SCENE_WORLD then
			smgr.changeScene(SCENE_WORLD)
		end
	end
end

function var_0_0.getReward(arg_11_0, arg_11_1)
	arg_11_0.control:getReward(arg_11_1)
end

function var_0_0.showReward(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.reward[1]
	local var_12_1 = {
		{}
	}

	var_12_1[1].id = 6
	var_12_1[1].value = var_12_0.value

	globalAction_gotResource(var_12_1)
end

function var_0_0.close(arg_13_0)
	arg_13_0:removeFromParentAndCleanup(true)
end

function var_0_0.onEnter(arg_14_0)
	taskUI.setVisible(false)
end

function var_0_0.onExit(arg_15_0)
	taskUI.setVisible(true)
end

function var_0_0.onTouchBegan(arg_16_0, arg_16_1, arg_16_2)
	return true
end

function var_0_0.onTouchMoved(arg_17_0, arg_17_1, arg_17_2)
	return true
end

function var_0_0.onTouchEnded(arg_18_0, arg_18_1, arg_18_2)
	return true
end

return var_0_0
