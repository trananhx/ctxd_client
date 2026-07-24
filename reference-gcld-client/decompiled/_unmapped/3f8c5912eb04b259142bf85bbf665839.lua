officer.control = {}
officer.control.isFisrtTime = true
officer.control.rankData = {}
officer.control.pageIndex = 0
officer.control.myBuildingId = -1
officer.control.myRank = -1

function officer.control.clicked_salary()
	officer.control.request_salary()
end

function officer.control.clicked_drop()
	officer.control.request_dropOfficer()
end

function officer.control.receive_dropOfficer(arg_3_0)
	if arg_3_0.action.state == 1 then
		officer.control.isFisrtTime = true
		officer.control.pageIndex = 1
		officer.control.rankData = {}

		if officer.ui.table.select_icon ~= nil then
			officer.ui.table.select_icon:setVisible(false)
		end

		if smgr.nextSceneTag == SCENE_RES_HUANGCHENG then
			empire.control.request_officerBuildingInfo()
		end

		user.player.hasOfficialBuildingOthers = false

		officer.control.request_rankInfo()
	end
end

function officer.control.request_dropOfficer()
	local var_4_0 = officer.control.myBuildingId

	cmgr.sendRequest(officer.control.receive_dropOfficer, actions.officerDrop, var_4_0)
end

function officer.control.receive_salary(arg_5_0)
	if arg_5_0.action.state == 1 then
		user.welfare.setWelfare("hasSalary", false)

		local var_5_0 = {
			{}
		}

		var_5_0[1].id = arg_5_0.action.data.type
		var_5_0[1].value = arg_5_0.action.data.output

		globalAction_gotResource(var_5_0)
		officer.ui.table.btn_salary:setEnabled(false)
	end
end

function officer.control.request_salary()
	cmgr.sendRequest(officer.control.receive_salary, actions.officerGetSalary)
end

function officer.control.rank_sort(arg_7_0, arg_7_1)
	return arg_7_0.rank < arg_7_1.rank
end

function officer.control.receive_rankInfo(arg_8_0)
	if arg_8_0.action.state == 1 then
		local var_8_0 = arg_8_0.action.data

		officer.ui.fill(var_8_0)

		for iter_8_0, iter_8_1 in ipairs(var_8_0.rankList) do
			table.insert(officer.control.rankData, iter_8_1)
		end

		local var_8_1 = var_8_0.totalPage

		if var_8_1 > 2 then
			var_8_1 = 2
		end

		if var_8_1 > officer.control.pageIndex then
			officer.control.pageIndex = officer.control.pageIndex + 1

			officer.control.request_rankInfo()
		else
			table.sort(officer.control.rankData, officer.control.rank_sort)
			officer.ui.createList(officer.control.rankData)
		end
	end
end

function officer.control.request_rankInfo()
	cmgr.sendRequest(officer.control.receive_rankInfo, actions.officerRankInfo, officer.control.pageIndex)
end
