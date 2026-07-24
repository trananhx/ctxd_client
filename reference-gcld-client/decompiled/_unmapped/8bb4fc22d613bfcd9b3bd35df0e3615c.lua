trainingControl = {}

local var_0_0 = trainingControl

function var_0_0.onEnter()
	var_0_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(trainingUI.update, 1, false)
end

function var_0_0.onExit()
	if var_0_0.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerEntry)
	end

	trainingUI.trainingAnimNode = nil
	trainingUI.trainingAnim = nil
end

function var_0_0.startTraining(arg_3_0)
	local function var_3_0(arg_4_0)
		var_0_0.getTrainingInfo()
	end

	cmgr.sendRequest(var_3_0, actions.startTraining, arg_3_0)
end

function var_0_0.stopTraining()
	local function var_5_0(arg_6_0)
		trainingUI.showStopTrainingGainTips(arg_6_0.action.data.totalExp)
		var_0_0.getTrainingInfo()
	end

	cmgr.sendRequest(var_5_0, actions.stopTraining)
end

function var_0_0.getTrainingInfo()
	local function var_7_0(arg_8_0)
		var_0_0.generalInfo = arg_8_0.action.data.generalInfo
		var_0_0.modeInfo = arg_8_0.action.data.modeInfo

		trainingUI.updateGeneralsLayer(var_0_0.generalInfo)

		var_0_0.isTrainning = arg_8_0.action.data.isTrainning

		if arg_8_0.action.data.isTrainning then
			var_0_0.inTrainingInfo = arg_8_0.action.data.InTrainningInfo

			trainingUI.updateUnderTrainingLayer(var_0_0.inTrainingInfo)
		else
			trainingUI.updateDescriptionLayer(var_0_0.modeInfo[1])
		end
	end

	cmgr.sendRequest(var_7_0, actions.getTrainingInfo)
end
