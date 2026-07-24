require("lua/component/CCStrokeLabelTTF")

function createTimerLabel(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7, arg_1_8)
	arg_1_6 = arg_1_6 or 0

	local var_1_0 = arg_1_6
	local var_1_1 = createBaseLayer()
	local var_1_2
	local var_1_3 = arg_1_0 or 0
	local var_1_4 = true
	local var_1_5 = 1

	local function var_1_6()
		local var_2_0 = CCStrokeLabelTTF:create(tool.formatTime(var_1_3, arg_1_1), arg_1_2, arg_1_3)

		if arg_1_7 then
			var_2_0:setColor(arg_1_7)
		end

		var_1_1:addChild(var_2_0, 1, var_1_5)

		var_1_1.display = var_2_0
	end

	local function var_1_7(arg_3_0)
		local var_3_0 = math.ceil(var_1_3 / 1000)

		var_1_3 = var_1_3 - arg_3_0 * 1000

		if var_1_3 <= 0 then
			var_1_3 = 0
		end

		if arg_1_8 then
			arg_1_8(var_1_3)
		end

		if var_3_0 ~= math.ceil(var_1_3 / 1000) then
			if var_1_1.display then
				var_1_1.display:setString(tool.formatTime(var_1_3, arg_1_1))
			else
				pcall(var_1_1.removeAllChildrenWithCleanup, var_1_1, true)

				local var_3_1 = CCStrokeLabelTTF:create(tool.formatTime(var_1_3, arg_1_1), arg_1_2, arg_1_3)

				if arg_1_7 then
					var_3_1:setColor(arg_1_7)
				end

				var_1_1:addChild(var_3_1)
			end
		end

		if var_1_3 <= var_1_0 and var_1_4 and arg_1_4 then
			if var_1_0 == 0 then
				var_1_4 = false
			end

			arg_1_4(arg_1_5)

			return
		end
	end

	function var_1_1.setAnchorPoint(arg_4_0, arg_4_1)
		if var_1_1.display then
			var_1_1.display:setAnchorPoint(arg_4_1)
		end
	end

	function var_1_1.onEnter(arg_5_0)
		var_1_2 = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_1_7, 0.1, false)
	end

	function var_1_1.onExit(arg_6_0)
		if var_1_2 then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_2)
		end
	end

	function var_1_1.setShouldCallBack(arg_7_0, arg_7_1)
		var_1_4 = arg_7_1
	end

	function var_1_1.setTime(arg_8_0, arg_8_1)
		var_1_3 = arg_8_1

		if var_1_1.display then
			var_1_1.display:setString(tool.formatTime(var_1_3, arg_1_1))
		else
			var_1_1:removeAllChildrenWithCleanup(true)

			local var_8_0 = CCStrokeLabelTTF:create(tool.formatTime(var_1_3, arg_1_1), arg_1_2, arg_1_3)

			if arg_1_7 then
				var_8_0:setColor(arg_1_7)
			end

			var_1_1:addChild(var_8_0)
		end
	end

	function var_1_1.getTime(arg_9_0)
		return var_1_3
	end

	function var_1_1.setTriggerTime(arg_10_0, arg_10_1)
		var_1_0 = arg_10_1
		var_1_4 = true
	end

	function var_1_1.getTriggerTime(arg_11_0)
		return var_1_0
	end

	function var_1_1.setColor(arg_12_0, arg_12_1)
		arg_1_7 = arg_12_1 or colorQuality[1]
	end

	function var_1_1.getSize(arg_13_0)
		return var_1_1:getChildByTag(var_1_5):getContentSize()
	end

	var_1_6()

	return var_1_1
end

TimerLabelClass = class("TimerLabelClass", function(arg_14_0)
	if arg_14_0.labelType == "LabelAtlas" then
		return CCLabelAtlas:create("", arg_14_0.fileName, arg_14_0.fontWidth, arg_14_0.fontHeight, arg_14_0.begin or 48)
	elseif arg_14_0.labelType == "LabelStroke" then
		return CCStrokeLabelTTF:create("", arg_14_0.font, arg_14_0.fontSize, arg_14_0.strokeSize, arg_14_0.shadowColor, arg_14_0.direction)
	else
		return CCLabelTTF:create("", arg_14_0.font, arg_14_0.fontSize)
	end
end)

function TimerLabelClass.ctor(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0)
		if arg_16_0 == "enter" then
			if arg_15_0.onEnter then
				arg_15_0:onEnter()
			end
		elseif arg_16_0 == "exit" and arg_15_0.onExit then
			arg_15_0:onExit()
		end
	end

	arg_15_0:registerScriptHandler(var_15_0)

	arg_15_0._callback = arg_15_1.callback or function()
		return
	end
	arg_15_0._updateCallback = arg_15_1.updateCallback or function()
		return
	end
	arg_15_0._triggerTime = arg_15_1.triggerTime or 0

	if tonumber(arg_15_0._triggerTime) < 0 then
		arg_15_0._triggerTime = 0
	end

	arg_15_0._time = tonumber(arg_15_1.time)
	arg_15_0._format = arg_15_1.format
	arg_15_0._isAdd = arg_15_1.isAdd or false
	arg_15_0._isTriggerStop = arg_15_1.isTriggerStop or true
	arg_15_0._shoudCallBack = true

	arg_15_0:setString(arg_15_0:formatTime(arg_15_0._time, arg_15_0._format))
end

function TimerLabelClass.formatTime(arg_19_0, arg_19_1, arg_19_2)
	return tool.formatTime(arg_19_1, arg_19_2)
end

function TimerLabelClass.update(arg_20_0, arg_20_1)
	arg_20_0._updateCallback(arg_20_1)

	local var_20_0 = math.floor(arg_20_0._time / 1000)

	if arg_20_0._isAdd then
		arg_20_0._time = arg_20_0._time + arg_20_1 * 1000

		if arg_20_0._time > arg_20_0._triggerTime and arg_20_0._isTriggerStop then
			arg_20_0._time = arg_20_0._triggerTime
		end

		if arg_20_0._time >= arg_20_0._triggerTime and arg_20_0._shoudCallBack then
			arg_20_0._shoudCallBack = false

			arg_20_0._callback()
		end
	else
		arg_20_0._time = arg_20_0._time - arg_20_1 * 1000

		if arg_20_0._time <= 0 then
			arg_20_0._time = 0
		end

		if arg_20_0._time < arg_20_0._triggerTime and arg_20_0._isTriggerStop then
			arg_20_0._time = arg_20_0._triggerTime
		end

		if arg_20_0._time <= arg_20_0._triggerTime and arg_20_0._shoudCallBack then
			arg_20_0._shoudCallBack = false

			arg_20_0._callback()
		end
	end

	if var_20_0 ~= math.floor(arg_20_0._time / 1000) then
		arg_20_0:setString(arg_20_0:formatTime(arg_20_0._time, arg_20_0._format))
	end
end

function TimerLabelClass.resetTime(arg_21_0, arg_21_1, arg_21_2)
	if tonumber(arg_21_1) >= 0 then
		arg_21_0._time = tonumber(arg_21_1)

		arg_21_0:setString(arg_21_0:formatTime(arg_21_0._time, arg_21_0._format))
	end

	arg_21_0._shoudCallBack = not arg_21_2
end

function TimerLabelClass.getUpdateCallback(arg_22_0, ...)
	return arg_22_0._updateCallback
end

function TimerLabelClass.setUpdateCallback(arg_23_0, arg_23_1)
	arg_23_0._updateCallback = arg_23_1 or function()
		return
	end
end

function TimerLabelClass.getCallback(arg_25_0, arg_25_1)
	return arg_25_0._callback
end

function TimerLabelClass.setCallback(arg_26_0, arg_26_1)
	arg_26_0._callback = arg_26_1 or function()
		return
	end
end

function TimerLabelClass.setIsAdd(arg_28_0, arg_28_1)
	arg_28_0._isAdd = arg_28_1
end

function TimerLabelClass.setTriggerTime(arg_29_0, arg_29_1)
	if tonumber(arg_29_1) >= 0 then
		arg_29_0._triggerTime = tonumber(arg_29_1)
	end
end

function TimerLabelClass.getTime(arg_30_0)
	return arg_30_0._time
end

function TimerLabelClass.onEnter(arg_31_0)
	arg_31_0._updateEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(handler(arg_31_0, arg_31_0.update), 0.1, false)
end

function TimerLabelClass.onExit(arg_32_0)
	if arg_32_0._updateEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_32_0._updateEntry)

		arg_32_0._updateEntry = nil
	end
end
