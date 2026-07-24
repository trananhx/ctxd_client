machine.control = {}
machine.data = {}

function machine.control.receive_machineInfo(arg_1_0)
	if arg_1_0.action.data and arg_1_0.action.data.tank then
		machine.ui.data = arg_1_0.action.data
		machine.ui.tank = arg_1_0.action.data.tank

		machine.ui.setData(machine.ui.tank)
	end
end

function machine.control.request_machineInfo()
	cmgr.sendRequest(machine.control.receive_machineInfo, actions.getCatapultInfo)
end

function machine.control.receive_buyMachine(arg_3_0)
	if machine.ui.currentIdx == 1 then
		roleDialogue.control.loadSpeak(1951)
	end

	if arg_3_0.action.data then
		machine.control.request_machineInfo()
	end
end

function machine.control.request_buyMachine()
	if machine.ui.currentIdx and machine.ui.tank[machine.ui.currentIdx] then
		cmgr.sendRequest(machine.control.receive_buyMachine, actions.buyCatapult, machine.ui.tank[machine.ui.currentIdx].id)
	end
end

function machine.control.request_buyMachine_showChargeWin()
	if machine.ui.currentIdx and machine.ui.tank[machine.ui.currentIdx] then
		messageBox.showChargeWin(language.get(190080), language.get("220703_qixie", machine.ui.tank[machine.ui.currentIdx].gold), "buyCatapult", machine.control.request_buyMachine)
	end
end
