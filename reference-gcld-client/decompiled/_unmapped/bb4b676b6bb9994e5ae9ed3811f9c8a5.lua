shenjiangControl = {}

local var_0_0 = shenjiangControl
local var_0_1

function handlerGetKaiguangInfoAction(arg_1_0)
	if arg_1_0.action.data then
		equipmentKaiguangUI.setKaiguangInfo(arg_1_0.action.data)
	end
end

function var_0_0.openKaiguang()
	cmgr.sendRequest(handlerGetKaiguangInfoAction, actions.getLightInfo)
end

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	return
end
