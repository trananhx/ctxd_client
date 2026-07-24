gem.control = {}
gem.data = {}
gem.count = 0

function gem.control.clicked_hecheng()
	if gem.count > 0 then
		gem.control.request_gemMake()
	end
end

function gem.control.clicked_chaijie()
	if gem.count > 0 then
		gem.control.request_unMakeGem()
	end
end

function gem.control.gemSort(arg_3_0, arg_3_1)
	if arg_3_0.num >= arg_3_1.num then
		if arg_3_0.num == arg_3_1.num then
			return arg_3_0.gemLv > arg_3_1.gemLv
		end

		return true
	end

	return false
end

function gem.control.receive_gemInfo(arg_4_0)
	if arg_4_0.action.state == 1 then
		gem.data = arg_4_0.action.data.gem
		gem.count = 0

		if gem.data ~= nil then
			gem.count = #gem.data
		end

		if gem.ui.selectIndex > gem.count then
			gem.ui.selectIndex = gem.count
		end

		if gem.count > 0 then
			table.sort(gem.data, gem.control.gemSort)
			gem.ui.createGemList()
		end
	end
end

function gem.control.request_gemInfo()
	cmgr.sendRequest(gem.control.receive_gemInfo, actions.getGemInfo)
end

function gem.control.receive_unMakeGem(arg_6_0)
	if arg_6_0.action.state == 1 then
		gem.ui.action_effect()
		gem.control.request_gemInfo()
	end
end

function gem.control.request_unMakeGem()
	local var_7_0 = gem.data[gem.ui.selectIndex]

	cmgr.sendRequest(gem.control.receive_unMakeGem, actions.unMakeGem, var_7_0.gemId)
end

function gem.control.receive_gemMake(arg_8_0)
	if arg_8_0.action.state == 1 then
		gem.ui.action_effect()
		gem.control.request_gemInfo()
	end
end

function gem.control.request_gemMake()
	local var_9_0 = gem.data[gem.ui.selectIndex]

	cmgr.sendRequest(gem.control.receive_gemMake, actions.makeGem, var_9_0.gemId, 1)
end
