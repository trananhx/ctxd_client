battleHelp.control = {}
battleHelp.control.battle_index = 0
battleHelp.control.battle_index_max = 0
battleHelp.control.keyTarget_index = 0
battleHelp.keyTargetData = {}

function battleHelp.control.receive_singleBattleInfo(arg_1_0)
	local var_1_0 = arg_1_0.action.data

	battleHelp.keyTargetData = var_1_0

	battleHelp.ui.create_keyTarget_list(var_1_0)
end

function battleHelp.control.request_singleBattleInfo()
	cmgr.sendRequest(battleHelp.control.receive_singleBattleInfo, actions.sinlgeBattleHelp, battleHelp.control.battle_index)
end

function battleHelp.control.receive_battleInfo(arg_3_0)
	local var_3_0 = arg_3_0.action.data

	battleHelp.ui.create_battleHelp_list(var_3_0)
end

function battleHelp.control.request_battleInfo()
	cmgr.sendRequest(battleHelp.control.receive_battleInfo, actions.battleHelp)
end
