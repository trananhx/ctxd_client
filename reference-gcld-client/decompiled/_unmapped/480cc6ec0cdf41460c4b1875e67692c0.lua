applyOfficer.control = {}
applyOfficer.data = {}

function applyOfficer.control.receive_auto(arg_1_0)
	if arg_1_0.action.state == 1 then
		applyOfficer.control.request_applyList()
	end
end

function applyOfficer.control.clicked_auto()
	if tonumber(applyOfficer.data.auto_pass) == 0 then
		cmgr.sendRequest(applyOfficer.control.receive_auto, actions.changeAutoPass, 1)
	else
		cmgr.sendRequest(applyOfficer.control.receive_auto, actions.changeAutoPass, 0)
	end
end

function applyOfficer.control.receive_applyList(arg_3_0)
	if arg_3_0.action.state == 1 then
		local var_3_0 = arg_3_0.action.data

		if tonumber(var_3_0.auto_pass) == 0 then
			applyOfficer.ui.table.gou_yes:setVisible(false)
		else
			applyOfficer.ui.table.gou_yes:setVisible(true)
		end

		applyOfficer.ui.updateList(var_3_0.list)

		applyOfficer.data = var_3_0
	end
end

function applyOfficer.control.request_applyList()
	cmgr.sendRequest(applyOfficer.control.receive_applyList, actions.getApplyList, 0)
end

function applyOfficer.control.click_yes(arg_5_0)
	local var_5_0 = applyOfficer.data.list[arg_5_0].playerId

	cmgr.sendRequest(applyOfficer.control.receive_auto, actions.passApply, var_5_0)
end

function applyOfficer.control.click_no(arg_6_0)
	local var_6_0 = applyOfficer.data.list[arg_6_0].playerId

	cmgr.sendRequest(applyOfficer.control.receive_auto, actions.refuseApply, var_6_0)
end
