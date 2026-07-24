dinnerControl = {}

local var_0_0 = dinnerControl

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end
end

function var_0_0.getDinnerInfo()
	local function var_3_0(arg_4_0)
		local var_4_0 = arg_4_0.action.data

		var_0_0.isFull = var_4_0.isFull
		var_0_0.dinnerNum = var_4_0.dinnerNum
		var_0_0.data = var_4_0

		if var_0_0.isFull == 0 then
			var_0_0.generalInfos = var_4_0.generals
			var_0_0.length = #var_0_0.generalInfos
		end

		dinnerUI.init()
	end

	cmgr.sendRequest(var_3_0, actions.getDinnerInfo)
end

function var_0_0.haveDinner()
	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.action.data

		var_0_0.isFull = var_6_0.isFull
		var_0_0.dinnerNum = var_6_0.dinnerNum

		user.welfare.setWelfare("dinnerNum", var_6_0.dinnerNum)

		var_0_0.generalInfos = var_6_0.generals
		var_0_0.data = var_6_0

		dinnerUI.playDinnerAnimation(var_6_0)
	end

	cmgr.sendRequest(var_5_0, actions.haveDinner, 0)
end
