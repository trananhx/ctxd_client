jubenLevelSelect.control = {}
jubenLevelSelect.data = {}

function jubenLevelSelect.control.on_click_back()
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

	jubenLevelSelect.data.level_back = true

	jubenSelect.ui.show()
end

function jubenLevelSelect.control.on_click_start()
	local var_2_0 = jubenLevelSelect.data.sId
	local var_2_1 = jubenLevelSelect.ui.currentSelectIndex

	guide.ui.disable_arrow_in_juben()
	cmgr.sendRequest(function(arg_3_0)
		user.soId = var_2_0

		smgr.changeScene(SCENE_JUBEN, var_2_0, var_2_1, 1)
	end, actions.juBenPermit, var_2_0, var_2_1, 1)
end
