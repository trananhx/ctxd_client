require("lua/common/eventManager")

selectPlayer.control = {}
selectPlayer.control.data = {}
selectPlayer.select_index = 0
selectPlayer.total_count = 0
selectPlayer.exist_create_count = 0
selectPlayer.max_count = 0
selectPlayer.beginX = 0
selectPlayer.beginY = 0
selectPlayer.revert_tag = 0

function selectPlayer.control.clicked_create()
	smgr.changeScene(SCENE_SELECT_FORCE)
end

function selectPlayer.control.clicked_start()
	log.info("@@ 点击按钮")

	if selectPlayer.select_index ~= 0 then
		local var_2_0 = selectPlayer.control.data[selectPlayer.select_index - selectPlayer.exist_create_count]

		if var_2_0.isDelete == true then
			messageBox.error(language.get(212001))
		else
			if conf.language == "tw" and var_2_0.sessionId ~= nil and (channelMgr.getCurrentChannel() == channels.iosTW or channelMgr.getCurrentChannel() == channels.andTW) then
				user.sessionId = var_2_0.sessionId
			end

			log.info("@@ 执行请求")

			user.player.id = var_2_0.playerId

			selectPlayer.control.getPlayerInfo()
		end
	end
end

function selectPlayer.control.clicked_deletePlayer()
	if selectPlayer.select_index ~= 0 then
		selectPlayer.ui.table.messageBox = messageBox.createMessageBox(language.get(212002), language.get(212003), {
			{
				text = language.get(10001),
				callBack = function()
					selectPlayer.ui.table.layer:removeChild(selectPlayer.ui.table.messageBox, true)

					user.player.id = selectPlayer.control.data[selectPlayer.select_index - selectPlayer.exist_create_count].playerId

					cmgr.sendRequest(selectPlayer.control.receive_deletePlayer, actions.deletePlayer, user.player.id)
				end
			},
			{
				text = language.get(10002),
				callBack = function()
					selectPlayer.ui.table.layer:removeChild(selectPlayer.ui.table.messageBox, true)
				end
			}
		})

		selectPlayer.ui.table.layer:addChild(selectPlayer.ui.table.messageBox, 10000)
	end
end

function selectPlayer.control.receive_deletePlayer(arg_6_0)
	if arg_6_0.action.state == 1 then
		selectPlayer.control.data[selectPlayer.select_index - selectPlayer.exist_create_count].isDelete = true

		selectPlayer.ui.table["bgUp_" .. selectPlayer.select_index]:setVisible(true)
		selectPlayer.ui.table.menu:setVisible(false)
	end
end

function selectPlayer.control.clicked_revertPlayer(arg_7_0)
	selectPlayer.revert_tag = arg_7_0

	local var_7_0 = selectPlayer.control.data[arg_7_0].playerId

	cmgr.sendRequest(selectPlayer.control.receive_revertPlayer, actions.retrievePlayer, var_7_0)
end

function selectPlayer.control.receive_revertPlayer(arg_8_0)
	if arg_8_0.action.state == 1 then
		selectPlayer.control.data[selectPlayer.revert_tag].isDelete = false

		selectPlayer.ui.table["bgUp_" .. selectPlayer.revert_tag + selectPlayer.exist_create_count]:setVisible(false)

		if selectPlayer.revert_tag + selectPlayer.exist_create_count == selectPlayer.select_index then
			selectPlayer.ui.table.menu:setPosition(ccp(0, 130 * (selectPlayer.select_index - selectPlayer.exist_create_count)))
			selectPlayer.ui.table.menu:setVisible(true)
		end
	end
end

function selectPlayer.control.onTouch(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0 == CCTOUCHBEGAN then
		selectPlayer.beginX = arg_9_1
		selectPlayer.beginY = arg_9_2

		return true
	elseif arg_9_0 == CCTOUCHENDED then
		selectPlayer.control.onTouchEnd(arg_9_1, arg_9_2)
	end
end

function selectPlayer.control.onTouchEnd(arg_10_0, arg_10_1)
	if math.abs(selectPlayer.beginX - arg_10_0) < 20 and math.abs(selectPlayer.beginY - arg_10_1) < 20 and arg_10_0 > visibleSize.width / 2 - 190 and arg_10_0 < visibleSize.width / 2 + 190 and arg_10_1 > 170 and arg_10_1 < visibleSize.height - 150 then
		local var_10_0 = arg_10_0 - (visibleSize.width / 2 - 190)
		local var_10_1 = arg_10_1 - 170
		local var_10_2 = selectPlayer.ui.table.scrollView:getContentOffset().y
		local var_10_3 = math.floor((var_10_1 - var_10_2) / 130)

		if var_10_3 >= 0 and var_10_3 < selectPlayer.total_count + selectPlayer.exist_create_count then
			if selectPlayer.exist_create_count == 1 and var_10_3 == 0 then
				selectPlayer.control.clicked_create()
			else
				local var_10_4 = CCSprite:create("res/ui/selectPlayer/choi_list_bg.png")

				selectPlayer.ui.table["bg_" .. selectPlayer.select_index]:setDisplayFrame(var_10_4:displayFrame())

				selectPlayer.select_index = var_10_3 + 1

				local var_10_5 = CCSprite:create("res/ui/selectPlayer/choi_list_on.png")

				selectPlayer.ui.table["bg_" .. selectPlayer.select_index]:setDisplayFrame(var_10_5:displayFrame())

				if selectPlayer.control.data[selectPlayer.select_index - selectPlayer.exist_create_count].isDelete == true then
					selectPlayer.ui.table.menu:setVisible(false)
				else
					selectPlayer.ui.table.menu:setPosition(ccp(0, 130 * (selectPlayer.select_index - 1)))
					selectPlayer.ui.table.menu:setVisible(true)
				end
			end
		end
	end
end

function selectPlayer.control.getPlayerInfo()
	log.info("@@ 角色信息")

	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		cmgr.sendRequest(selectPlayer.control.receive_playerInfo, actions.getPlayerInfo, user.player.id, platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", "", PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "ft")
	else
		cmgr.sendRequest(selectPlayer.control.receive_playerInfo, actions.getPlayerInfo, user.player.id, platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", "", PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "")
	end
end

function selectPlayer.control.receive_playerInfo(arg_12_0)
	require("lua/data/actionHandler").handlerPlayerInfoAction(arg_12_0)

	if arg_12_0.action.state == 1 then
		local var_12_0 = arg_12_0.action.data
	end

	local var_12_1 = user.curMainTask

	if var_12_1 then
		user.player.areaId = var_12_1.areaId
	end

	CCTextureCache:sharedTextureCache():removeUnusedTextures()
	log.info("@@ 区域", user.player.areaId)

	if user.inJuBen then
		if rmgr.isNotComplete() then
			smgr.changeScene(SCENE_MAIN_CITY)
		else
			smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
		end
	elseif user.player.areaId == 0 then
		smgr.changeScene(SCENE_MAIN_CITY)
	elseif user.player.areaId == 1 then
		smgr.changeScene(SCENE_RES_JUMING)
	elseif user.player.areaId == 2 then
		smgr.changeScene(SCENE_RES_MUCHANG)
	elseif user.player.areaId == 3 then
		smgr.changeScene(SCENE_RES_NONGTIAN)
	elseif user.player.areaId == 4 then
		smgr.changeScene(SCENE_RES_NONGTIAN)
	end

	if channelMgr.currentChannel == channels.andPPS or channelMgr.currentChannel == channels.iospps or channelMgr.currentChannel == channels.andUmi or channelMgr.currentChannel == channels.andKudong or channelMgr.currentChannel == channels.andLewan then
		channelMgr.transform("serverId", user.serverId)
		channelMgr.transform("serverName", user.serverLoginName)
		channelMgr.transform("playerId", user.player.playerId)
		channelMgr.transform("playerName", user.player.name)
		channelMgr.transform("playerLevel", user.player.playerLv)
		channelMgr.enterGame()
	end

	if channelMgr.currentChannel == channels.andUC then
		local var_12_2 = versionUpdateConstant.file.version

		reload(var_12_2)

		local var_12_3 = sys_version

		if var_12_3 and var_12_3.client and tool.cmpVersion("1.4.0.0", var_12_3.client) then
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
		local var_12_4 = versionUpdateConstant.file.version

		reload(var_12_4)

		local var_12_5 = sys_version

		if var_12_5 and var_12_5.client and tool.cmpVersion("7.4.0.1", var_12_5.client) then
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
		local var_12_6 = versionUpdateConstant.file.version

		reload(var_12_6)

		local var_12_7 = sys_version

		if var_12_7 and var_12_7.client and tool.cmpVersion("7.2.0.1", var_12_7.client) then
			channelMgr.transform("serverId", user.serverId)
			channelMgr.transform("serverName", user.serverLoginName)
			channelMgr.transform("playerId", user.player.playerId)
			channelMgr.transform("playerName", user.player.name)
			channelMgr.transform("playerLevel", user.player.playerLv)
			channelMgr.enterGame()
		end
	end

	if channelMgr.currentChannel == channels.andJinshan or channelMgr.currentChannel == channels.andZhuodong then
		channelMgr.transform("serverName", user.serverLoginName)
	end

	if channelMgr.currentChannel == channels.andyulong or channelMgr.currentChannel == channels.andyulongHD then
		log.info("QQQ:yulong test gold")
		selectPlayer.control.tengxun_yulong_testGold()
	end

	require("lua/layer/updateNotice/updateNotice"):create()

	if user.player.pic ~= 0 and user.getFunc(3) == true then
		local var_12_8 = createCharacter()

		smgr.getLayer("topLayer"):addChild(var_12_8, 1000)
	end
end

function selectPlayer.control.getPlayerRoleList()
	cmgr.sendRequest(selectPlayer.control.recevie_playerListInfo, actions.getPlayerList, platform.getFlag())
end

function selectPlayer.control.timeSort(arg_14_0, arg_14_1)
	return arg_14_0.lastLoginTime < arg_14_1.lastLoginTime
end

function selectPlayer.control.recevie_playerListInfo(arg_15_0)
	if arg_15_0.action.state == 1 then
		local var_15_0 = arg_15_0.action.data

		if var_15_0.weiName then
			user.forceIdToName[1] = var_15_0.weiName
		end

		if var_15_0.shuName then
			user.forceIdToName[2] = var_15_0.shuName
		end

		if var_15_0.wuName then
			user.forceIdToName[3] = var_15_0.wuName
		end

		selectPlayer.control.data = arg_15_0.action.data.playerList
		selectPlayer.total_count = #selectPlayer.control.data
		selectPlayer.max_count = arg_15_0.action.data.maxRoleNum
		user.serverId = arg_15_0.action.data.serverId
		user.serverName = arg_15_0.action.data.serverName

		if selectPlayer.total_count == 0 then
			selectPlayer.control.clicked_create()

			return
		end

		table.sort(selectPlayer.control.data, selectPlayer.control.timeSort)

		if g_quickLogin and not conf.debug then
			local var_15_1

			for iter_15_0 = #selectPlayer.control.data, 1, -1 do
				if selectPlayer.control.data[iter_15_0].isDelete == true then
					-- block empty
				else
					var_15_1 = selectPlayer.control.data[iter_15_0].playerId

					break
				end
			end

			if var_15_1 then
				user.player.id = var_15_1

				selectPlayer.control.getPlayerInfo()

				return
			end
		end

		selectPlayer.ui.createList()
	end
end

function selectPlayer.control.tengxun_yulong_testGold()
	local function var_16_0(arg_17_0)
		log.info("QQQ:receive yxYulongPay")

		if arg_17_0.action.data then
			log.info("QQQ:result: ", arg_17_0.action.data.result)
		end
	end

	local function var_16_1(arg_18_0)
		log.info("QQQ:handlerYulongBalance: ")

		if arg_18_0.action.data then
			log.info("QQQ:receive balance: ", arg_18_0.action.data.balance)

			if arg_18_0.action.data.balance > 0 then
				cmgr.sendRequest(var_16_0, actions.yxYulongPay, user.tengxun.openid, user.tengxun.openkey, user.tengxun.pay_token, user.tengxun.zoneid, user.tengxun.pf, user.tengxun.pfkey, "billno", user.player.vId, arg_18_0.action.data.balance, user.serverId, user.tengxun.pfid)

				local function var_18_0(arg_19_0)
					log.info("## warning: ", "yulong_diaodan")
				end

				local var_18_1 = statMgr.uuid or 0
				local var_18_2 = statMgr.channel or ChannelManager:getInstance():getChannelId()
				local var_18_3 = string.format("%swarning?%s&%s&%s", conf.address, var_18_1, var_18_2, "yulong_diaodan")

				CCHttpClient:createHTTPRequestLua(var_18_0, var_18_3, kCCHTTPRequestMethodGET)
			end
		end
	end

	if user.tengxun then
		log.info("QQQ:user.tengxun.openid: ", user.tengxun.openid)
		log.info("QQQ:user.tengxun.openkey: ", user.tengxun.openkey)
		log.info("QQQ:user.tengxun.pay_token: ", user.tengxun.pay_token)
		log.info("QQQ:user.tengxun.pf: ", user.tengxun.pf)
		log.info("QQQ:user.tengxun.pfkey: ", user.tengxun.pfkey)
		log.info("QQQ:user.tengxun.pfid: ", user.tengxun.pfid)
		log.info("QQQ:user.tengxun.zoneid: ", user.tengxun.zoneid)
	end

	if user.tengxun and user.tengxun.openid and user.tengxun.openkey and user.tengxun.pay_token and user.tengxun.zoneid and user.tengxun.pf and user.tengxun.pfkey and user.tengxun.pfid then
		cmgr.sendRequest(var_16_1, actions.yxYulongGetBalance, user.tengxun.openid, user.tengxun.openkey, user.tengxun.pay_token, user.tengxun.zoneid, user.tengxun.pf, user.tengxun.pfkey, user.tengxun.pfid)
	else
		log.info("QQQ:yulong some num nil")
	end
end
