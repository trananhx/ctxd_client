require("lua/common/tool")

workerListControl = {}

local var_0_0 = workerListControl

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	return
end

function var_0_0.onTouch(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0 == CCTOUCHBEGAN then
		if tool.checkIfTouch(workerListUI.uiTable.mujiang, arg_3_1, arg_3_2) then
			var_0_0.getWorkListInfo(2)
		elseif tool.checkIfTouch(workerListUI.uiTable.tiejiang, arg_3_1, arg_3_2) then
			var_0_0.getWorkListInfo(1)
		end

		return true
	elseif arg_3_0 == CCTOUCHMOVED then
		return true
	elseif arg_3_0 == CCTOUCHENDED then
		return true
	end
end

function var_0_0.getWorkListInfo(arg_4_0)
	local function var_4_0(arg_5_0)
		if arg_5_0.action.data then
			workerListUI.setListData(arg_5_0.action.data, arg_4_0)
		end
	end

	cmgr.sendRequest(var_4_0, actions.getWorkerStatic, arg_4_0)
end
