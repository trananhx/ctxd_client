twoRankInfoControl = {}

local var_0_0 = twoRankInfoControl

var_0_0.rankList = {}

function var_0_0.onEnter()
	log.info("twoRankInfoControl enter ")
end

function var_0_0.onExit()
	log.info("twoRankInfoControl exit")
end

function var_0_0.getTwoRankInfo(arg_3_0, arg_3_1)
	local var_3_0 = true

	local function var_3_1(arg_4_0)
		local var_4_0 = arg_4_0.action.data

		log.info("shouldUpdateRankList:", arg_3_1)

		if arg_3_1 then
			if var_3_0 then
				var_3_0 = false
				var_0_0.rankList = {}

				twoRankInfoUI.updateRankInfoLayer(var_4_0)
			end

			if var_4_0.totalPage > var_4_0.currentPage then
				for iter_4_0 = 1, #var_4_0.rankList do
					table.insert(var_0_0.rankList, var_4_0.rankList[iter_4_0])
				end

				cmgr.sendRequest(var_3_1, actions.getTwoRankInfo, var_4_0.currentPage + 1, arg_3_0)

				if var_4_0.currentPage == 2 then
					twoRankInfoUI.updateRankListLayer(var_0_0.rankList)
				end
			elseif var_4_0.totalPage == 1 then
				twoRankInfoUI.updateRankListLayer(var_4_0.rankList)
			else
				twoRankInfoUI.updateRankListLayer(var_0_0.rankList)
			end
		else
			twoRankInfoUI.updateRankInfoLayer(var_4_0)
		end
	end

	cmgr.sendRequest(var_3_1, actions.getTwoRankInfo, 1, arg_3_0)
end

function var_0_0.getRankReward(arg_5_0)
	local function var_5_0(arg_6_0)
		local var_6_0 = {
			{}
		}

		var_6_0[1].id = 6
		var_6_0[1].value = arg_6_0.action.data.rewards[1].value

		globalAction_gotResource(var_6_0)
		var_0_0.getTwoRankInfo(arg_5_0, false)
	end

	cmgr.sendRequest(var_5_0, actions.getRankReward, arg_5_0)
end
