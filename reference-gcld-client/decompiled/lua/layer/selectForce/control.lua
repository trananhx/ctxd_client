require("lua/data/actionHandler")

selectForceControl = {}
selectForceData = {}
selectForceData.forceSelected = 0
selectForceData.forceIdTable = {}
selectForceData.playerNameTable = {}
selectForceData.rewardTable = {}
selectForceData.playerNameScheduleEntry = nil
selectForceData.enterFromSelectForceAndBeforeFirstTask = false

local var_0_0 = selectForceControl
local var_0_1 = selectForceConstant

function var_0_0.getForceInfo()
	cmgr.sendRequest(var_0_0.handlerForceInfoAction, actions.forceInfo, platform.getFlag())
end

local function var_0_2()
	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		cmgr.sendRequest(var_0_0.handlerPlayerInfoAction, actions.getPlayerInfo, user.player.id, platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", "", PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "ft")
	else
		cmgr.sendRequest(var_0_0.handlerPlayerInfoAction, actions.getPlayerInfo, user.player.id, platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", "", PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "")
	end
end

local function var_0_3()
	var_0_2()
end

local var_0_4 = 1

local function var_0_5()
	local var_4_0 = smgr.getLayer("forceLayer")
	local var_4_1 = tolua.cast(var_4_0:getChildByTag(var_0_1.PLAYERNAMELABEL_1_TAG), "CCLabelTTF")
	local var_4_2 = language.get(270001, selectForceData.playerNameTable[var_0_4])

	var_4_1:setString(var_4_2)

	var_0_4 = var_0_4 + 1

	if var_0_4 > table.getn(selectForceData.playerNameTable) then
		var_0_4 = 1
	end

	local var_4_3 = tolua.cast(var_4_0:getChildByTag(var_0_1.PLAYERNAMELABEL_2_TAG), "CCLabelTTF")
	local var_4_4 = language.get(270001, selectForceData.playerNameTable[var_0_4])

	var_4_3:setString(var_4_4)

	var_0_4 = var_0_4 + 1

	if var_0_4 > table.getn(selectForceData.playerNameTable) then
		var_0_4 = 1
	end
end

function var_0_0.handlerForceInfoAction(arg_5_0)
	local var_5_0 = arg_5_0.action.data.forceList

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		local var_5_1 = iter_5_1.forceId

		selectForceData.forceIdTable[iter_5_0] = var_5_1
	end

	local var_5_2 = arg_5_0.action.data.info

	for iter_5_2, iter_5_3 in pairs(var_5_2) do
		selectForceData.playerNameTable[iter_5_2] = iter_5_3.playerName
	end

	local var_5_3 = arg_5_0.action.data.reward

	selectForceData.rewardTable.value = var_5_3.value
	selectForceData.rewardTable.kind = var_5_3.kind
	selectForceData.rewardTable.forceId = var_5_3.forceId

	local var_5_4 = {
		reward = var_5_3,
		playerNameTable = selectForceData.playerNameTable,
		forceIdTable = selectForceData.forceIdTable
	}

	eventManager.dispatchEvent(selectForceConstant.EVENT_GET_FORCE_DATA, var_5_4)
end

function var_0_0.handlerSelectForceAction(arg_6_0)
	local var_6_0 = arg_6_0.action.data.playerId

	user.player.id = var_6_0

	var_0_3()
	statMgr.update(statMgr.state.createPlayer)
	statistics.createRole(nil, var_6_0, language.get(213001), arg_6_0.action.data.forceId)

	if channelMgr.getCurrentChannel() == channels.andTHPubgame or channelMgr.getCurrentChannel() == channels.andVNPubgame then
		channelMgr.createRole()
	end
end

function var_0_0.handlerPlayerInfoAction(arg_7_0)
	actionHandler.handlerPlayerInfoAction(arg_7_0)

	if arg_7_0.action.state == 1 then
		local var_7_0 = arg_7_0.action.data

		statistics.roleLogin(nil, var_7_0.player.playerId, var_7_0.player.playerName or language.get(213001), var_7_0.player.playerLv or 0)
	end

	log.info("创角进入!!!!!! ")

	selectForceData.enterFromSelectForceAndBeforeFirstTask = true

	if user.player.areaId == 0 then
		smgr.changeScene(SCENE_MAIN_CITY)
	elseif user.player.areaId == 1 then
		smgr.changeScene(SCENE_RES_JUMING)
	elseif user.player.areaId == 2 then
		smgr.changeScene(SCENE_RES_MUCHANG)
	elseif user.player.areaId == 3 then
		smgr.changeScene(SCENE_RES_NONGTIAN)
	elseif user.player.areaId == 4 then
		smgr.changeScene(SCENE_RES_BINGTIE)
	elseif user.player.areaId == 5 then
		smgr.changeScene(SCENE_RES_BINGYING)
	end

	if channelMgr.currentChannel == channels.andPPS or channelMgr.currentChannel == channels.andVivo or channelMgr.currentChannel == channels.iospps then
		channelMgr.transform("serverId", user.serverId)
		channelMgr.transform("serverName", user.serverLoginName)
		channelMgr.transform("playerId", user.player.playerId)
		channelMgr.transform("playerName", user.player.name)
		channelMgr.transform("playerLevel", user.player.playerLv)
		channelMgr.createRole()
		channelMgr.enterGame()
	end

	if channelMgr.currentChannel == channels.andUmi or channelMgr.currentChannel == channels.andKudong or channelMgr.currentChannel == channels.andLewan then
		channelMgr.transform("serverId", user.serverId)
		channelMgr.transform("serverName", user.serverLoginName)
		channelMgr.transform("playerId", user.player.playerId)
		channelMgr.transform("playerName", user.player.name)
		channelMgr.transform("playerLevel", user.player.playerLv)
		channelMgr.enterGame()
	end

	if channelMgr.currentChannel == channels.andUC then
		local var_7_1 = versionUpdateConstant.file.version

		reload(var_7_1)

		local var_7_2 = sys_version

		if var_7_2 and var_7_2.client and tool.cmpVersion("1.4.0.0", var_7_2.client) then
			user.serverLoginName = tostring(user.serverLoginName)

			if string.match(user.serverLoginName, "(%d+)") == nil then
				user.serverLoginName = string.format("攻城掠地_%s服", user.serverId)
			end

			channelMgr.transform("serverId", user.serverId)
			channelMgr.transform("serverName", user.serverLoginName)
			channelMgr.transform("playerId", user.player.playerId)
			channelMgr.transform("playerName", user.player.name)
			channelMgr.transform("playerLevel", user.player.playerLv)
			channelMgr.transform("createTime", user.player.createTime)
			channelMgr.enterGame()
		end
	end

	if channelMgr.currentChannel == channels.wanDouJia then
		local var_7_3 = versionUpdateConstant.file.version

		reload(var_7_3)

		local var_7_4 = sys_version

		if var_7_4 and var_7_4.client and tool.cmpVersion("7.4.0.1", var_7_4.client) then
			user.serverLoginName = tostring(user.serverLoginName)

			if string.match(user.serverLoginName, "(%d+)") == nil then
				user.serverLoginName = string.format("攻城掠地_%s服", user.serverId)
			end

			channelMgr.transform("serverId", user.serverId)
			channelMgr.transform("serverName", user.serverLoginName)
			channelMgr.transform("playerId", user.player.playerId)
			channelMgr.transform("playerName", user.player.name)
			channelMgr.transform("playerLevel", user.player.playerLv)
			channelMgr.transform("createTime", user.player.createTime)
			channelMgr.enterGame()
		end
	end

	if channelMgr.currentChannel == channels.qihoo then
		local var_7_5 = versionUpdateConstant.file.version

		reload(var_7_5)

		local var_7_6 = sys_version

		if var_7_6 and var_7_6.client and tool.cmpVersion("7.2.0.1", var_7_6.client) then
			channelMgr.transform("serverId", user.serverId)
			channelMgr.transform("serverName", user.serverLoginName)
			channelMgr.transform("playerId", user.player.playerId)
			channelMgr.transform("playerName", user.player.name)
			channelMgr.transform("playerLevel", user.player.playerLv)
			channelMgr.createRole()
			channelMgr.enterGame()
		end
	end

	if channelMgr.currentChannel == channels.andJinshan or channelMgr.currentChannel == channels.andZhuodong then
		channelMgr.transform("serverName", user.serverLoginName)
	end
end

function var_0_0.startCallbackSelected(arg_8_0)
	if selectForceData.forceSelected == 0 then
		log.info("none selected")

		return
	end

	log.info("platform.getFlag(),", platform.getFlag())
	cmgr.sendRequest(var_0_0.handlerSelectForceAction, actions.selectForce, selectForceData.forceSelected, platform.getFlag())
	amgr.playEffect(enumAudioFile.ui_click_start, false, true)
end

return var_0_0
