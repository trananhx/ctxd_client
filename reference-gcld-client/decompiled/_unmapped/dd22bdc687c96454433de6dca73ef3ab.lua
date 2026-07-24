dayTrain.control = {}
dayTrain.data = {}
dayTrain.data.exp = 0
dayTrain.hasSendMsg = false

function dayTrain.control.receive_dayTrainInfo(arg_1_0)
	if arg_1_0.action.data.exp then
		dayTrain.data.exp = arg_1_0.action.data.exp

		log.info("dayTrain:exp get: ", arg_1_0.action.data.exp)
		user.welfare.setWelfareSimple("dayTrain", false)

		dayTrain.hasSendMsg = true
	end
end

function dayTrain.control.request_dayTrainInfo()
	cmgr.sendRequest(dayTrain.control.receive_dayTrainInfo, actions.getDayTrain)
end
