silkTreasure.control = {}
silkTreasure.data = {}

function silkTreasure.control.click_tips()
	return
end

function silkTreasure.control.receive_treasereInfo(arg_2_0)
	showTable(arg_2_0)

	if arg_2_0.action.data then
		local var_2_0 = arg_2_0.action.data.treasures

		silkTreasure.data.tenTreasure = arg_2_0.action.data.tenTreasure
		silkTreasure.data.progress = arg_2_0.action.data.progress

		silkTreasure.ui.setData(var_2_0, true)
	end
end

function silkTreasure.control.request_treasereInfo()
	cmgr.sendRequest(silkTreasure.control.receive_treasereInfo, actions.getTreasureInfo)
end
