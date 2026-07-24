jubenEnter.control = {}
jubenEnter.data = {}

function jubenEnter.control.receive_jubenInfo(arg_1_0)
	if arg_1_0.action.state == 1 then
		jubenEnter.data = arg_1_0.action.data

		jubenEnter.ui.update()
	end
end

function jubenEnter.control.request_jubenInfo(arg_2_0)
	cmgr.sendRequest(jubenEnter.control.receive_jubenInfo, actions.getWorldJubenInfo, arg_2_0)
end

function jubenEnter.control.click_start()
	local var_3_0 = jubenEnter.data.playerEvent.soloId
	local var_3_1 = jubenEnter.data.playerEvent.grade

	guide.ui.disable_arrow_in_juben()
	cmgr.sendRequest(function(arg_4_0)
		log.info("actions.dealPlayerEvent=%s", tool.tableToJson(arg_4_0))

		local var_4_0 = arg_4_0.action.data.playerEvent.soloId

		cmgr.sendRequest(function(arg_5_0)
			user.soId = var_3_0

			smgr.changeScene(SCENE_JUBEN, var_3_0, var_3_1, 1)
		end, actions.getJuBenScene, var_3_0, var_3_1, 1)
	end, actions.dealPlayerEvent, jubenEnter.ui.cityId)
end
