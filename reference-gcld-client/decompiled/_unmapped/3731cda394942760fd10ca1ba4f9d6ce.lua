noviceWantedActivity.control = {}
noviceWantedActivity.data = {}
noviceWantedActivity.control.current_clickIndex = -1
noviceWantedActivity.control.total_money = 0

function noviceWantedActivity.control.receive_noviceWantInfo(arg_1_0)
	if arg_1_0.action.state == 1 then
		noviceWantedActivity.data = arg_1_0.action.data

		noviceWantedActivity.ui.update()
	end
end

function noviceWantedActivity.control.request_noviceWantInfo()
	cmgr.sendRequest(noviceWantedActivity.control.receive_noviceWantInfo, actions.getNoviceWantedInfo)
end

function noviceWantedActivity.control.action_zoom(arg_3_0)
	arg_3_0:setScale(5)

	local var_3_0 = CCScaleTo:create(0.3, 1)

	arg_3_0:runAction(var_3_0)
	arg_3_0:setVisible(true)
end

function noviceWantedActivity.control.receive_getTaskReward(arg_4_0)
	local var_4_0 = {
		{}
	}

	var_4_0[1].id = 19
	var_4_0[1].value = arg_4_0.action.data.rewards[1].value

	globalAction_gotResource(var_4_0)

	local var_4_1 = noviceWantedActivity.control.current_clickIndex

	noviceWantedActivity.control.action_zoom(noviceWantedActivity.ui.table["lingqu_" .. var_4_1])

	noviceWantedActivity.data.armiesArray[var_4_1].goldState = 2

	noviceWantedActivity.ui.table["btn_" .. var_4_1]:setEnabled(false)
	noviceWantedActivity.ui.table["btn_title_" .. var_4_1]:setString(language.get(111007))

	local var_4_2 = GraySprite:create("res/ui/common/generalPic/generalPic_" .. noviceWantedActivity.data.armiesArray[var_4_1].pic .. ".jpg")

	noviceWantedActivity.ui.table["icon_" .. var_4_1]:setDisplayFrame(var_4_2:displayFrame())

	noviceWantedActivity.control.total_money = noviceWantedActivity.control.total_money + noviceWantedActivity.data.armiesArray[var_4_1].gold

	local var_4_3 = noviceWantedActivity.ui.calculate()

	noviceWantedActivity.ui.table.bar:setScaleX(var_4_3 - 25)
	noviceWantedActivity.ui.table.bar:setPosition(ccp(25 + (var_4_3 - 25) / 2, 18))
end

function noviceWantedActivity.control.request_getTaskReward(arg_5_0)
	cmgr.sendRequest(noviceWantedActivity.control.receive_getTaskReward, actions.getNoviceWantedReward, arg_5_0)
end

function noviceWantedActivity.control.click_lingqu(arg_6_0)
	noviceWantedActivity.control.current_clickIndex = arg_6_0

	local var_6_0 = noviceWantedActivity.data.armiesArray[arg_6_0].armiesId

	noviceWantedActivity.control.request_getTaskReward(var_6_0)
end
