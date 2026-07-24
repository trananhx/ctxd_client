firstPayActivity.control = {}
firstPayActivity.data = {}

function firstPayActivity.control.receive_firstPayReward(arg_1_0)
	if arg_1_0.action.state == 1 then
		firstPayActivity.data = arg_1_0.action.data
		user.player.firstPayData = firstPayActivity.data

		firstPayActivity.ui.update_reward()
	end
end

function firstPayActivity.control.request_firstPayReward()
	cmgr.sendRequest(firstPayActivity.control.receive_firstPayReward, actions.getFirstPayReward)
end
