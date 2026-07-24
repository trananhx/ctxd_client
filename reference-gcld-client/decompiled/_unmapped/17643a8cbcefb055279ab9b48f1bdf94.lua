kfwdEntranceControl = {}

local var_0_0 = kfwdEntranceControl

var_0_0.signInfo = {}

function var_0_0.onEnter()
	log.info("kfwdEntranceControl enter ")
	eventManager.registerEvent("kfwdStateDidChanged", var_0_0.getKfwdEntranceInfo)
end

function var_0_0.onExit()
	log.info("kfwdEntranceControl exit")
	eventManager.unregisterEvent("kfwdStateDidChanged", var_0_0.getKfwdEntranceInfo)
end

function var_0_0.getKfwdEntranceInfo()
	local function var_3_0(arg_4_0)
		if arg_4_0.action.state == 1 then
			showTable(arg_4_0)

			var_0_0.signInfo = arg_4_0.action.data.signInfo

			kfwdEntranceUI.updateEntrancePanel(arg_4_0.action.data)
		end
	end

	cmgr.sendRequest(var_3_0, actions.kfwdGetPlayerInfo)
end

function var_0_0.kfwdSignUp()
	local function var_5_0(arg_6_0)
		if arg_6_0.action.state == 1 then
			var_0_0.getKfwdEntranceInfo()
		end
	end

	cmgr.sendRequest(var_5_0, actions.kfwdSignUp)
end

function var_0_0.kfwdGetReward()
	local function var_7_0(arg_8_0)
		local var_8_0 = {
			nil,
			nil,
			26,
			27,
			[2004] = 10010,
			[2003] = 10009,
			[2006] = 10042,
			[2005] = 10011,
			[2007] = 10043,
			[2008] = 10044
		}

		if var_0_0.treasureId then
			local var_8_1 = {
				{}
			}

			var_8_1[1].id = var_8_0[var_0_0.treasureId] or 10009
			var_8_1[1].value = 1

			globalAction_gotResource(var_8_1)
			var_0_0.getKfwdEntranceInfo()
		end
	end

	cmgr.sendRequest(var_7_0, actions.kfwdGetTreasure)
end
