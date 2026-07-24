dayReward.control = {}
dayReward.data = {}

function dayReward.control.receive_dayGiftInfo(arg_1_0)
	if arg_1_0.action.state == 1 then
		dayReward.data = arg_1_0.action.data

		dayReward.ui.update_reward()
		user.welfare.setWelfare("haveDayGift", false)
	end
end

function dayReward.control.request_dayGiftInfo()
	cmgr.sendRequest(dayReward.control.receive_dayGiftInfo, actions.getDayGift)
end

function dayReward.control.getNextTechInfo()
	local function var_3_0(arg_4_0)
		dayReward.ui.initNextTech(arg_4_0.action.data.nextTechInfo)
		dayReward.control.getMineDayGiftInfo()
	end

	cmgr.sendRequest(var_3_0, actions.getNextTechInfo)
end

function dayReward.control.getMineDayGiftInfo()
	if user.haveMineDayGift ~= 0 then
		cmgr.sendRequest(function(arg_6_0)
			dayReward.ui.initMineDayGiftInfo(arg_6_0.action.data)
		end, actions.getMineDayGiftInfo)
	end
end

function dayReward.control.getMineDayGift()
	cmgr.sendRequest(function(arg_8_0)
		user.haveMineDayGift = 0

		eventManager.dispatchEvent("welfareValueDidChanged")
		dayReward.ui.showGetMineDayGift(arg_8_0.action.data)
	end, actions.getMineDayGiftReward)
end
