local var_0_0 = class("kfmgTask", function()
	return CCLayer:create()
end)

function var_0_0.ctor(arg_2_0, ...)
	arg_2_0.uidata = require("lua/layer/kfmg/kfmgTask/uidata").new()
	arg_2_0.control = require("lua/layer/kfmg/kfmgTask/control").new(arg_2_0)

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
	arg_5_0.uiTable = autoUI.initUI(arg_5_0, arg_5_0.uidata:getData())

	arg_5_0.uiTable.closeButton:registerScriptTapHandler(function()
		arg_5_0:close()
	end)
	arg_5_0.uiTable.jiasuButton:addHandleOfControlEvent(function()
		local var_7_0 = require("lua/layer/kfmg/kfmgJunku/ui").new()
		local var_7_1 = smgr.getLayer("topLayer")

		var_7_1:removeAllChildrenWithCleanup(true)
		var_7_1:addChild(var_7_0)
	end, CCControlEventTouchUpInside)
	arg_5_0.control:refreshData()
end

function var_0_0.initData(arg_8_0, arg_8_1)
	arg_8_0.killData = arg_8_1.indiv[1]
	arg_8_0.taskData = arg_8_1.indiv

	arg_8_0.uiTable.killNum:setString(language.get("hw_kfmg_000024", arg_8_0.killData.goal / 10000))
	arg_8_0.uiTable.processLabel:setString(language.get("hw_kfmg_000025", arg_8_0.killData.value / 10000, arg_8_0.killData.goal / 10000))
	arg_8_0.uiTable.process_1:setPercentage((arg_8_0.killData.index - 1 + arg_8_0.killData.value / arg_8_0.killData.goal) * 20)

	for iter_8_0 = 1, #arg_8_0.taskData do
		local var_8_0 = arg_8_0.taskData[iter_8_0]

		arg_8_0.uiTable["rewardLabel_" .. iter_8_0]:setString(var_8_0.rewards[1].value)

		local var_8_1 = CCSprite:createWithSpriteFrameName("icon_iron.png")

		if var_8_0.rewards[1].type == "gem" then
			var_8_1 = CCSprite:createWithSpriteFrameName("res_icon_7.png")

			arg_8_0.uiTable["rewardIcon_" .. iter_8_0]:setScale(0.6)
		elseif var_8_0.rewards[1].type == "exp" then
			var_8_1 = CCSprite:createWithSpriteFrameName("icon_exp.png")
		end

		arg_8_0.uiTable["rewardIcon_" .. iter_8_0]:setDisplayFrame(var_8_1:displayFrame())

		if iter_8_0 > 1 then
			arg_8_0.uiTable["renwu_" .. iter_8_0]:setString(var_8_0.name)
			arg_8_0.uiTable["renwuNum_" .. iter_8_0]:setString(var_8_0.value .. "/" .. var_8_0.goal)

			if var_8_0.isFinish == true and var_8_0.isReward == true then
				arg_8_0.uiTable["success_" .. iter_8_0]:setVisible(true)
			else
				arg_8_0.uiTable["success_" .. iter_8_0]:setVisible(false)
			end
		elseif var_8_0.isFinish then
			arg_8_0.uiTable.jiasuButton:setVisible(false)
		else
			arg_8_0.uiTable.jiasuButton:setVisible(true)
		end

		if var_8_0.isFinish == true and var_8_0.isReward == false then
			arg_8_0.uiTable["rewardButton_" .. iter_8_0]:setVisible(true)
		else
			arg_8_0.uiTable["rewardButton_" .. iter_8_0]:setVisible(false)
		end

		arg_8_0.uiTable["rewardButton_" .. iter_8_0]:addHandleOfControlEvent(function()
			arg_8_0.control:getReward(var_8_0.id, var_8_0.rewards)
		end, CCControlEventTouchUpInside)
	end
end

function var_0_0.close(arg_10_0)
	arg_10_0:removeFromParentAndCleanup(true)
end

function var_0_0.onEnter(arg_11_0)
	return
end

function var_0_0.onExit(arg_12_0)
	return
end

function var_0_0.onTouchBegan(arg_13_0, arg_13_1, arg_13_2)
	return true
end

function var_0_0.onTouchMoved(arg_14_0, arg_14_1, arg_14_2)
	return true
end

function var_0_0.onTouchEnded(arg_15_0, arg_15_1, arg_15_2)
	return true
end

return var_0_0
