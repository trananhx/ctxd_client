clockReward.control = {}
clockReward.data = {}

function clockReward.control.receive_onlineGift(arg_1_0)
	if arg_1_0.action.state == 1 then
		clockReward.data = arg_1_0.action.data

		clockReward.ui.action_shake()
		user.welfare.setWelfare("onlineNum", arg_1_0.action.data.number)
	end
end

function clockReward.control.request_onlineGift()
	cmgr.sendRequest(clockReward.control.receive_onlineGift, actions.getOnlineGift)
end

function clockReward.control.receive_onlineGiftNumber(arg_3_0)
	if arg_3_0.action.state == 1 then
		clockReward.ui.update_remain_times(arg_3_0.action.data.number, arg_3_0.action.data.remainNumber, arg_3_0.action.data.millseconds)
	end
end

function clockReward.control.request_onlineGiftNumber()
	cmgr.sendRequest(clockReward.control.receive_onlineGiftNumber, actions.getOnlineGiftNumber)
end
