require("lua/data/channels")

local var_0_0 = require("lua/common/json")

channelMgr = channelMgr or {}
channelMgr.payMethod = 1
channelMgr.pushToken = ""
channelMgr.reloginTime = 1800
channelMgr.enterBackgroundTime = nil
channelMgr.reconnecting = false

function channelMgr.init()
	ChannelManager:getInstance():registerListenter(channelMgr.listener)
	ChannelManager:getInstance():intSdk()

	channelMgr.currentChannel = nil

	log.info("client version: ", game.version.client)
	showTable(game.version)

	if not game.version.client then
		game.version.client = ""

		log.error("game.version.client not found!!!!!")
	end

	ChannelManager:getInstance():checkVersion(game.version.client)
end

function channelMgr.getChannel(arg_2_0)
	local var_2_0

	for iter_2_0, iter_2_1 in pairs(channels) do
		if iter_2_1.flag == arg_2_0 then
			var_2_0 = iter_2_1

			break
		end
	end

	return var_2_0
end

function channelMgr.getCurrentChannel()
	if not channelMgr.currentChannel then
		local var_3_0 = ChannelManager:getInstance():getChannelId()

		log.info("@@ 渠道号 ", var_3_0)

		channelMgr.currentChannel = channelMgr.getChannel(var_3_0)
	end

	return channelMgr.currentChannel
end

function channelMgr.reconnect(arg_4_0)
	log.info("开始调用重连接口...")

	local var_4_0 = channelMgr.getExt(arg_4_0)
	local var_4_1 = var_4_0.ts

	local function var_4_2(arg_5_0)
		log.info("reconnect succeed !")

		channelMgr.reconnecting = false
		user.isLogin = true
		cmgr.gameOver = false
		cmgr.obkey = arg_5_0.action.data.ext
		cmgr.lastTs = var_4_1

		local function var_5_0(arg_6_0)
			log.info("recevie playerListInfo succeed ")

			if arg_6_0.action.state == 1 then
				user.PlayerListResponseData = arg_6_0.action.data
				user.serverId = arg_6_0.action.data.serverId

				if not user.serverId then
					smgr.returnToLogin()

					return
				end

				if #arg_6_0.action.data.playerList >= 1 then
					local var_6_0

					if #arg_6_0.action.data.playerList == 1 then
						var_6_0 = arg_6_0.action.data.playerList[1].playerId
					elseif channelMgr.reconnectUserId then
						var_6_0 = channelMgr.reconnectUserId

						if var_6_0 == 0 or var_6_0 == nil then
							var_6_0 = arg_6_0.action.data.playerList[1].playerId
						end
					else
						smgr.returnToLogin()

						return
					end

					local function var_6_1(arg_7_0)
						require("lua/data/actionHandler").handlerPlayerInfoAction(arg_7_0)

						local var_7_0 = user.curMainTask

						if var_7_0 then
							user.player.areaId = var_7_0.areaId
						end

						CCTextureCache:sharedTextureCache():removeUnusedTextures()

						if user.inJuBen then
							smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
						else
							smgr.changeScene(SCENE_MAIN_CITY)
						end

						smgr.hideModal()
					end

					local var_6_2 = ""

					if loginData and loginData.selectedServer and loginData.selectedServer.host then
						local var_6_3 = string.match(loginData.selectedServer.host, "(%d+)")

						log.info("sunc tag")
						log.info(loginData.selectedServer.host)
						log.info(var_6_3)
						log.info(loginData.selectedServer.serverId)
					end

					if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
						cmgr.sendRequestWithErrorHandler(var_6_1, smgr.returnToLogin, actions.getPlayerInfo, var_6_0, platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", "", PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "ft")
					else
						cmgr.sendRequestWithErrorHandler(var_6_1, smgr.returnToLogin, actions.getPlayerInfo, var_6_0, platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", "", PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "")
					end
				else
					smgr.changeScene(SCENE_SELECT_FORCE)
				end
			end
		end

		cmgr.sendRequestWithErrorHandler(var_5_0, smgr.returnToLogin, actions.getPlayerList, platform.getFlag())
	end

	cmgr.sendRequestWithErrorHandler(var_4_2, smgr.returnToLogin, actions.reconnect, var_4_0.sessionId, var_4_0.ts, var_4_0.sign)

	local var_4_3
end

function channelMgr.getExt(arg_8_0)
	require("lua/common/encrypt/BigInt")
	require("lua/common/encrypt/BitLibEmu")

	local var_8_0 = {
		sessionId = string.sub(arg_8_0, 1, 32),
		ext = cmgr.obkey
	}

	if not var_8_0.ext or #var_8_0.ext == 0 then
		var_8_0.ext = "0"
	end

	if not cmgr.lastTs then
		cmgr.lastTs = string.format("%d", 9569378)
	end

	var_8_0.l = 250000
	var_8_0.h = 992500
	var_8_0.p = 920461
	var_8_0.g = 11
	var_8_0.dts = cmgr.lastTs
	var_8_0.ts = os.time()
	var_8_0.sp = var_8_0.dts % 11 + 5
	var_8_0.p1 = string.format("%d", "0x" .. string.sub(var_8_0.sessionId, 3, 8))
	var_8_0.p2 = string.format("%d", "0x" .. string.sub(var_8_0.sessionId, 24, 29))
	var_8_0.x = var_8_0.p1 % var_8_0.sp
	var_8_0.y = var_8_0.p2 % 3 + 2
	var_8_0.a = math.random(var_8_0.l, var_8_0.h)
	var_8_0.hs = BigInt_ModPower({
		var_8_0.g
	}, {
		var_8_0.a
	}, {
		string.format("%d", "0x" .. string.format("%d", var_8_0.p))
	})
	cmgr.connectNumber = var_8_0.a
	var_8_0.sessionNum = string.format("%d", "0x" .. string.sub(var_8_0.sessionId, var_8_0.x, var_8_0.x + var_8_0.y))
	var_8_0.bkey = string.format("%d", "0x" .. var_8_0.ext) - var_8_0.sessionNum
	var_8_0.key = BigInt_ModPower({
		var_8_0.bkey
	}, {
		var_8_0.a
	}, {
		string.format("%d", "0x" .. string.format("%d", var_8_0.p))
	})[1] + var_8_0.sessionNum
	var_8_0.hexkey = string.upper(string.gsub(string.format("%#x", var_8_0.key), "0x", ""))

	require("lua/common/encrypt/Sha1")

	local var_8_1 = Sha1

	var_8_0.sign = var_8_1(string.upper(var_8_1(var_8_0.ext .. var_8_0.hexkey .. var_8_0.dts)) .. var_8_0.sessionId .. var_8_0.ts) .. string.gsub(string.format("%#x", var_8_0.hs[1] + var_8_0.sessionNum), "0x", "")

	return var_8_0
end

function channelMgr.renewSocketAndReconnect(...)
	channelMgr.reconnecting = true

	local var_9_0 = user.sessionId
	local var_9_1 = user.serverName
	local var_9_2 = user.player.chatMessageList

	channelMgr.reconnectUserId = user.player.id

	eventManager.dispatchEvent("GameOver")
	user.init()

	user.sessionId = var_9_0
	user.serverName = var_9_1
	user.player.chatMessageList = var_9_2

	dataCache.clearCache()
	eventManager.dispatchEvent("Disconnect")
	smgr.showModal()

	local function var_9_3(arg_10_0)
		if cmgr.isConnected() then
			channelMgr.reconnect(var_9_0)
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(channelMgr.handlerUpdateEntry)

			channelMgr.handlerUpdateEntry = nil
		end
	end

	if channelMgr.handlerUpdateEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(channelMgr.handlerUpdateEntry)
	end

	log.info("重新建立服务器连接...")
	cmgr.connect()

	channelMgr.handlerUpdateEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_9_3, 0, false)
end

function channelMgr.checkTrailAccount(arg_11_0)
	if conf.language == "kr" then
		if string.find(arg_11_0, "@mobile") ~= nil then
			loginData.isTrailAccount = true

			log.info("is trail account!!!!!!!!")
		else
			loginData.isTrailAccount = false

			log.info("is normal account!!!!!!!")
		end
	end
end

function channelMgr.listener(arg_12_0)
	if conf.language == "kr" then
		channelMgr.KokrListener(arg_12_0)
	elseif conf.language == "xm" or channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		channelMgr.XmListener(arg_12_0)
	elseif conf.language == "tw" then
		channelMgr.TwListener(arg_12_0)
	elseif conf.language == "vie" then
		channelMgr.VieListener(arg_12_0)
	elseif conf.language == "tha" then
		channelMgr.ThaListener(arg_12_0)
	end
end

local function var_0_1(arg_13_0)
	CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
	CCUserDefault:sharedUserDefault():flush()
	eventManager.dispatchEvent("channelLoginSuccess", arg_13_0)
end

function channelMgr.TwListener(arg_14_0)
	if arg_14_0.state and arg_14_0.state == 1 then
		local var_14_0 = arg_14_0.action
		local var_14_1 = arg_14_0.channelId

		if var_14_0 == "enterBackground" then
			channelMgr.enterBackgroundTime = tostring(arg_14_0.time)
		elseif var_14_0 == "willEnterForeground" and channelMgr.enterBackgroundTime then
			local var_14_2 = 0

			if channelMgr.enterBackgroundTime ~= nil then
				local var_14_3 = tostring(arg_14_0.time)
				local var_14_4 = tonumber(var_14_3)
				local var_14_5 = tonumber(channelMgr.enterBackgroundTime)

				if type(var_14_4) == "number" and type(var_14_5) == "number" then
					var_14_2 = math.abs(var_14_4 - var_14_5)
					channelMgr.enterBackgroundTime = nil
				end
			end

			if var_14_2 >= channelMgr.reloginTime then
				smgr.returnToLogin()

				return
			end

			log.info("passedTime :", var_14_2)
			log.info("user.sessionId", user.sessionId)

			if user.sessionId and smgr then
				local var_14_6 = {
					[SCENE_SELECT_PLAYER] = false,
					[SCENE_SELECT_FORCE] = false,
					[SCENE_MAIN_CITY] = 120,
					[SCENE_INSTANCE] = 120,
					[SCENE_BATTLE] = 30,
					[SCENE_WORLD] = 50,
					[SCENE_FARM] = 120,
					[SCENE_JUBEN] = 120,
					[SCENE_KFWORLD] = 50,
					[SCENE_ADVENTURE] = 120,
					[SCENE_KFYZ_WORLD] = 50
				}

				if smgr.currentSceneTag and var_14_6[smgr.currentSceneTag] and var_14_2 > var_14_6[smgr.currentSceneTag] then
					smgr.modalTimeOutCount = 0

					channelMgr.renewSocketAndReconnect()

					return
				end
			end
		end

		if not var_14_1 then
			return
		end

		if not channelMgr.currentChannel then
			channelMgr.currentChannel = channelMgr.getChannel(var_14_1)

			if not channelMgr.currentChannel then
				log.error("[channel manager] find channel faild => ", var_14_0, var_14_1)

				return
			end
		end

		if var_14_0 == "login" then
			if channelMgr.currentChannel == channels.andTwPub or channelMgr.currentChannel == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
				var_0_1(arg_14_0)
			else
				loginData.userName = arg_14_0.uname

				channelMgr.checkTrailAccount(arg_14_0.uname)
				CCUserDefault:sharedUserDefault():setStringForKey("userName", loginData.userName)
				CCUserDefault:sharedUserDefault():setStringForKey("userPwd", loginData.userPwd)
				CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
				CCUserDefault:sharedUserDefault():flush()
				eventManager.dispatchEvent("channelLoginSuccess", arg_14_0)
			end
		end

		if var_14_0 == "logout" then
			statistics.roleLogout(nil, user.player.id, user.player.name, user.player.playerLv, 0)

			if cmgr.isConnected() == true then
				cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			end

			guide.ui.setVisible(false)
			log.info("@@ 退出游戏，返回到登录界面！！！")
			smgr.returnToLogin()
		end

		if var_14_0 == "shoumeng_pay" then
			function handlerPayInfo(arg_15_0)
				local var_15_0 = arg_15_0.action.data
				local var_15_1 = tool.tableToJson(var_15_0)

				channelMgr.pay(var_15_1)
			end

			local var_14_7 = arg_14_0.item

			cmgr.sendRequest(handlerPayInfo, actions.flPayInfo, var_14_7)
		end

		if var_14_0 == "setPushToken" then
			channelMgr.pushToken = arg_14_0.pushToken

			log.info("push token : ", arg_14_0.pushToken)
		end

		if var_14_0 == "shareSucceed" then
			eventManager.dispatchEvent("shareSucceed")
		end

		if var_14_0 == "shareFailed" then
			eventManager.dispatchEvent("shareFailed")
		end

		if var_14_0 == "googlePlay_purchase" then
			local function var_14_8(arg_16_0)
				Purchase:googlePlay_buyResult(arg_14_0.purchaseData, arg_14_0.dataSignature)
			end

			print("googleplay ->", arg_14_0.purchaseData)
			print("googleplay ->", arg_14_0.dataSignature)
			print("googleplay ->", arg_14_0.purchaseDataCode)
			print("googleplay ->", arg_14_0.dataSignatureCode)
			cmgr.sendRequest(var_14_8, actions.googlePlayPay, arg_14_0.purchaseDataCode, arg_14_0.dataSignatureCode)
		end

		if var_14_0 == "loginFailed" then
			log.info("channel login failed!!!")
			messageBox.alert(language.get(211007), arg_14_0.errorMsg)
		end

		if var_14_0 == "registerFailed" then
			log.info("channel register failed")
			messageBox.alert(language.get(211007), arg_14_0.errorMsg)
		end

		if var_14_0 == "bindAccountSucceed" then
			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():flush()
			ChannelManager:getInstance():autoRegist()
		end

		if var_14_0 == "changePasswordSucceed" then
			CCUserDefault:sharedUserDefault():setStringForKey("userPwd", arg_14_0.newPsd)
			CCUserDefault:sharedUserDefault():flush()
			log.info("password changed")
		end
	end
end

function channelMgr.KokrListener(arg_17_0)
	if arg_17_0.state and arg_17_0.state == 1 then
		local var_17_0 = arg_17_0.action
		local var_17_1 = arg_17_0.channelId

		if not var_17_1 then
			return
		end

		if not channelMgr.currentChannel then
			channelMgr.currentChannel = channelMgr.getChannel(var_17_1)

			if not channelMgr.currentChannel then
				log.error("[channel manager] find channel faild => ", var_17_0, var_17_1)

				return
			end
		end

		if var_17_0 == "login" then
			loginData.userName = arg_17_0.uname

			if arg_17_0.source ~= nil then
				loginData.userSource = arg_17_0.source
			else
				loginData.userSource = ""
			end

			channelMgr.checkTrailAccount(arg_17_0.uname)
			CCUserDefault:sharedUserDefault():setStringForKey("userName", loginData.userName)
			CCUserDefault:sharedUserDefault():setStringForKey("userPwd", loginData.userPwd)
			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
			CCUserDefault:sharedUserDefault():flush()

			if arg_17_0.isFbLogin ~= nil then
				CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", false)
				CCUserDefault:sharedUserDefault():flush()
			end

			eventManager.dispatchEvent("channelLoginSuccess", arg_17_0)
		end

		if var_17_0 == "logout" then
			statistics.roleLogout(nil, user.player.id, user.player.name, user.player.playerLv, 0)

			if cmgr.isConnected() == true then
				cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			end

			guide.ui.setVisible(false)
			log.info("@@ 退出游戏，返回到登录界面！！！")
			smgr.returnToLogin()
		end

		if var_17_0 == "setPushToken" then
			channelMgr.pushToken = arg_17_0.pushToken

			log.info("push token : ", arg_17_0.pushToken)
		end

		if var_17_0 == "popGameServerList" then
			user.popGameServerList = {}

			local var_17_2 = var_0_0.decode(arg_17_0.jsonTable)

			for iter_17_0, iter_17_1 in ipairs(var_17_2) do
				local var_17_3 = {}

				var_17_3.gameId = "gcld"
				var_17_3.gameName = "攻城掠地"
				var_17_3.host = iter_17_1.host
				var_17_3.id = "90"
				var_17_3.ip = iter_17_1.host
				var_17_3.lySource = "and_popGame"
				var_17_3.onlineDate = "2014-03-14 11:05:00.0"
				var_17_3.port = iter_17_1.port
				var_17_3.serverId = iter_17_1.code
				var_17_3.serverName = iter_17_1.name
				var_17_3.status = "xxxx"
				var_17_3.statusValue = 1
				var_17_3.version = game.version.client

				table.insert(user.popGameServerList, var_17_3)

				cmgr.canUseHttp = false
			end
		end

		if var_17_0 == "shareSucceed" then
			eventManager.dispatchEvent("shareSucceed")
		end

		if var_17_0 == "shareFailed" then
			eventManager.dispatchEvent("shareFailed")
		end

		if var_17_0 == "googlePlay_purchase" then
			local function var_17_4(arg_18_0)
				Purchase:googlePlay_buyResult(arg_17_0.purchaseData, arg_17_0.dataSignature)
			end

			print("googleplay ->", arg_17_0.purchaseData)
			print("googleplay ->", arg_17_0.dataSignature)
			print("googleplay ->", arg_17_0.purchaseDataCode)
			print("googleplay ->", arg_17_0.dataSignatureCode)
			cmgr.sendRequest(var_17_4, actions.googlePlayPay, arg_17_0.purchaseDataCode, arg_17_0.dataSignatureCode)
		end

		if var_17_0 == "loginFailed" then
			log.info("channel login failed!!!")

			if arg_17_0.errorMsg ~= "success" then
				messageBox.alert(language.get(211007), arg_17_0.errorMsg)
			end
		end

		if var_17_0 == "registerFailed" then
			log.info("channel register failed")
			messageBox.alert(language.get(211007), arg_17_0.errorMsg)
		end

		if var_17_0 == "bindAccountSucceed" then
			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():flush()
			ChannelManager:getInstance():autoRegist()
		end

		if var_17_0 == "changePasswordSucceed" then
			CCUserDefault:sharedUserDefault():setStringForKey("userPwd", arg_17_0.newPsd)
			CCUserDefault:sharedUserDefault():flush()
			messageBox.alert(language.get(10003), "변경 성공")
		end
	end
end

function channelMgr.VieListener(arg_19_0)
	if arg_19_0.state and arg_19_0.state == 1 then
		local var_19_0 = arg_19_0.action
		local var_19_1 = arg_19_0.channelId

		if not var_19_1 then
			return
		end

		if not channelMgr.currentChannel then
			channelMgr.currentChannel = channelMgr.getChannel(var_19_1)

			if not channelMgr.currentChannel then
				log.error("[channel manager] find channel faild => ", var_19_0, var_19_1)

				return
			end
		end

		if var_19_0 == "login" then
			loginData.userName = arg_19_0.uname

			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
			CCUserDefault:sharedUserDefault():flush()
			eventManager.dispatchEvent("channelLoginSuccess", arg_19_0)
		end

		if var_19_0 == "logout" then
			if cmgr.isConnected() == true then
				cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			end

			guide.ui.setVisible(false)
			log.info("@@ 退出游戏，返回到登录界面！！！")
			smgr.returnToLogin()
		end

		if var_19_0 == "googlePlay_purchase" then
			local function var_19_2(arg_20_0)
				Purchase:googlePlay_buyResult(arg_19_0.purchaseData, arg_19_0.dataSignature)
			end

			print("googleplay ->", arg_19_0.purchaseData)
			print("googleplay ->", arg_19_0.dataSignature)
			print("googleplay ->", arg_19_0.purchaseDataCode)
			print("googleplay ->", arg_19_0.dataSignatureCode)
			cmgr.sendRequest(var_19_2, actions.googlePlayPay, arg_19_0.purchaseDataCode, arg_19_0.dataSignatureCode)
		end

		if var_19_0 == "loginFailed" then
			log.info("channel login failed!!!")

			if arg_19_0.errorMsg ~= "success" then
				messageBox.alert(language.get(211007), arg_19_0.errorMsg)
			end
		end

		if var_19_0 == "registerFailed" then
			log.info("channel register failed")
			messageBox.alert(language.get(211007), arg_19_0.errorMsg)
		end

		if var_19_0 == "requestOrderId" and channelMgr.getCurrentChannel() == channels.andVNPocketGame then
			log.info("request new orderId")
			cmgr.sendRequest(function(arg_21_0)
				local var_21_0 = arg_21_0.action.data

				channelMgr.transform("orderId", var_21_0.orderId)
			end, actions.flPayInfo, 1)
		end

		if var_19_0 == "PermissionSuccess" then
			eventManager.dispatchEvent("PermissionSuccess")
		end

		if var_19_0 == "PermissionFail" then
			eventManager.dispatchEvent("PermissionFail")
		end
	end
end

function channelMgr.ThaListener(arg_22_0)
	if arg_22_0.state and arg_22_0.state == 1 then
		local var_22_0 = arg_22_0.action
		local var_22_1 = arg_22_0.channelId

		if not var_22_1 then
			return
		end

		if not channelMgr.currentChannel then
			channelMgr.currentChannel = channelMgr.getChannel(var_22_1)

			if not channelMgr.currentChannel then
				log.error("[channel manager] find channel faild => ", var_22_0, var_22_1)

				return
			end
		end

		if var_22_0 == "login" then
			loginData.userName = arg_22_0.uname

			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
			CCUserDefault:sharedUserDefault():flush()
			eventManager.dispatchEvent("channelLoginSuccess", arg_22_0)
		end

		if var_22_0 == "logout" then
			if cmgr.isConnected() == true then
				cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			end

			guide.ui.setVisible(false)
			log.info("@@ 退出游戏，返回到登录界面！！！")
			smgr.returnToLogin()
		end

		if var_22_0 == "googlePlay_purchase" then
			local function var_22_2(arg_23_0)
				Purchase:googlePlay_buyResult(arg_22_0.purchaseData, arg_22_0.dataSignature)
			end

			print("googleplay ->", arg_22_0.purchaseData)
			print("googleplay ->", arg_22_0.dataSignature)
			print("googleplay ->", arg_22_0.purchaseDataCode)
			print("googleplay ->", arg_22_0.dataSignatureCode)
			cmgr.sendRequest(var_22_2, actions.googlePlayPay, arg_22_0.purchaseDataCode, arg_22_0.dataSignatureCode)
		end

		if var_22_0 == "loginFailed" then
			log.info("channel login failed!!!")

			if arg_22_0.errorMsg ~= "success" then
				messageBox.alert(language.get(211007), arg_22_0.errorMsg)
			end
		end

		if var_22_0 == "registerFailed" then
			log.info("channel register failed")
			messageBox.alert(language.get(211007), arg_22_0.errorMsg)
		end

		if var_22_0 == "PermissionSuccess" then
			eventManager.dispatchEvent("PermissionSuccess")
		end

		if var_22_0 == "PermissionFail" then
			eventManager.dispatchEvent("PermissionFail")
		end

		if var_22_0 == "requestOrderId" and channelMgr.getCurrentChannel() == channels.andTHPocketGame then
			local var_22_3 = versionUpdateConstant.file.version

			reload(var_22_3)

			local var_22_4 = sys_version

			if var_22_4 and var_22_4.client and tool.cmpVersion2("2.0.0.2", var_22_4.client) == 2 then
				log.info("request new orderId")
				cmgr.sendRequest(function(arg_24_0)
					local var_24_0 = arg_24_0.action.data

					channelMgr.transform("orderId", var_24_0.orderId)
				end, actions.flPayInfo, 1)
			end
		end
	end
end

function channelMgr.XmListener(arg_25_0)
	log.info("channelMgr.XmListener", tool.tableToJson(arg_25_0))

	if arg_25_0.state and arg_25_0.state == 1 then
		local var_25_0 = arg_25_0.action
		local var_25_1 = arg_25_0.channelId

		if not var_25_1 then
			return
		end

		if not channelMgr.currentChannel then
			channelMgr.currentChannel = channelMgr.getChannel(var_25_1)

			if not channelMgr.currentChannel then
				log.error("[channel manager] find channel faild => ", var_25_0, var_25_1)

				return
			end
		end

		if var_25_0 == "login" then
			loginData.userName = arg_25_0.uname

			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
			CCUserDefault:sharedUserDefault():flush()
			eventManager.dispatchEvent("channelLoginSuccess", arg_25_0)
		end

		if var_25_0 == "logout" then
			if cmgr.isConnected() == true then
				cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			end

			guide.ui.setVisible(false)
			log.info("@@ 退出游戏，返回到登录界面！！！")
			smgr.returnToLogin()
		end

		if var_25_0 == "loginFailed" then
			log.info("channel login failed!!!")

			if arg_25_0.errorMsg ~= "success" then
				messageBox.alert(language.get(211007), arg_25_0.errorMsg)
			end
		end

		if var_25_0 == "registerFailed" then
			log.info("channel register failed")
			messageBox.alert(language.get(211007), arg_25_0.errorMsg)
		end

		if var_25_0 == "fbInvite" then
			local function var_25_2(arg_26_0)
				showTable(arg_26_0)
			end

			cmgr.sendRequest(var_25_2, actions.xmGetFbInviteReward, arg_25_0.inviteLevel + 1)
		end

		if var_25_0 == "PermissionSuccess" then
			eventManager.dispatchEvent("PermissionSuccess")
		end

		if var_25_0 == "PermissionFail" then
			eventManager.dispatchEvent("PermissionFail")
		end
	end
end

function channelMgr.isAppStoreReview()
	if channelMgr.getCurrentChannel() == channels.iosTH then
		local var_27_0 = versionUpdateConstant.file.version

		reload(var_27_0)

		local var_27_1 = sys_version

		if game.newVersion.appStoreCode == var_27_1.appStoreCode then
			return true
		end
	end

	return false
end

function channelMgr.login()
	log.info("@@ 渠道登录")
	ChannelManager:getInstance():login()
end

function channelMgr.logout()
	log.info("@@ 渠道退出登录")
	ChannelManager:getInstance():logout()
end

function channelMgr.destorySdk()
	log.info("@@ 销毁渠道sdk")
	ChannelManager:getInstance():destorySdk()
end

function channelMgr.pay(arg_31_0)
	log.info("@@ 渠道充值")
	ChannelManager:getInstance():pay(tostring(user.player.userId), tostring(user.player.playerId), tostring(user.player.name), tostring(user.serverId), arg_31_0)
end

function channelMgr.payWithSdkId(arg_32_0, arg_32_1)
	log.info("@@ 渠道充值")
	ChannelManager:getInstance():payWithSdkId(tostring(arg_32_0), tostring(user.player.userId), tostring(user.player.playerId), tostring(user.player.name), tostring(user.serverId), arg_32_1)
end

function channelMgr.directLogin(arg_33_0, arg_33_1)
	log.info("@@ 渠道用户名密码登录")
	ChannelManager:getInstance():directLogin(arg_33_0, arg_33_1)
end

function channelMgr.directRegister(arg_34_0, arg_34_1)
	log.info("@@ 渠道用户注册")
	ChannelManager:getInstance():directRegister(arg_34_0, arg_34_1)
end

function channelMgr.autoRegist()
	log.info("@@ 渠道快速登录")
	ChannelManager:getInstance():autoRegist()
end

function channelMgr.bindAccount(arg_36_0, arg_36_1)
	log.info("@@ 渠道绑定账号")
	ChannelManager:getInstance():bindAccount(arg_36_0, arg_36_1)
end

function channelMgr.changePassword(arg_37_0, arg_37_1, arg_37_2)
	log.info("@@ 渠道修改密码")
	ChannelManager:getInstance():changePassword(arg_37_0, arg_37_1, arg_37_2)
end

function channelMgr.showAccountCenter()
	log.info("@@ 显示用户中心sdk")
	ChannelManager:getInstance():showAccountCenter()
end

function channelMgr.enterGame()
	log.info("@@ 进入游戏")
	ChannelManager:getInstance():enterGame(user.serverId)
end

function channelMgr.createRole()
	log.info("@@ 创建角色")
	ChannelManager:getInstance():createRole(user.serverId)
end

function channelMgr.transform(arg_41_0, arg_41_1)
	log.info("@@ 传递数值")
	ChannelManager:getInstance():transform(arg_41_0, arg_41_1)
end
