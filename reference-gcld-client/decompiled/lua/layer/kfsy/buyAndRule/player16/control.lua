kfsyPlayerControl = {}

function kfsyPlayerControl.receive_kfsyGetRoomInfo(arg_1_0)
	log.info("kfsyBuyControl.receive_kfsyGetRoomInfo")
	smgr.changeScene(SCENE_KFSY_INROOM, arg_1_0)
end

function kfsyPlayerControl.request_kfsyGetRoomInfo(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 and arg_2_2 then
		cmgr.sendRequest(kfsyPlayerControl.receive_kfsyGetRoomInfo, actions.kfsyGetRoomInfo, arg_2_1, arg_2_2, arg_2_0)
	else
		cmgr.sendRequest(kfsyPlayerControl.receive_kfsyGetRoomInfo, actions.kfsyGetRoomInfo, kfsyInfo.RoomInfo.jiu, kfsyInfo.RoomInfo.pos, arg_2_0)
	end
end
