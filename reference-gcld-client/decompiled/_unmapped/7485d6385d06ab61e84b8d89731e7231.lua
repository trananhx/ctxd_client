celebration.control = {}

function celebration.control.receive_celebrationInfo(arg_1_0)
	log.info("@@ receive_celebrationInfo ")

	local var_1_0 = arg_1_0.data or arg_1_0.action.data

	celebration.ui.setCelebrationInfo(var_1_0)
end

function celebration.control.request_celebrationInfo()
	cmgr.sendRequest(celebration.control.receive_celebrationInfo, actions.getCeleInfo)
end

function celebration.control.receive_enterCele(arg_3_0)
	log.info("@@ receive_enterCele ")
	smgr.changeScene(SCENE_GONGHE_INROOM, arg_3_0)
end

function celebration.control.request_enterCele(arg_4_0)
	cmgr.sendRequest(celebration.control.receive_enterCele, actions.joinCeleDinner, arg_4_0)
end
