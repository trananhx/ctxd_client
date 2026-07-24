require("lua/common/tool")
require("lua/data/loginData")
require("lua/layer/login/firstEnterGame")
require("lua/layer/login/startGame")
require("lua/layer/login/selectServer")
require("lua/data/channels")
require("lua/layer/selectPlayer/ui")

local var_0_0 = require("lua/common/json")

require("lua/manager/StatisticsManager")

local var_0_1 = 0
local var_0_2 = false

function createLoginControl(arg_1_0)
	local var_1_0 = {}

	var_1_0.defaultServerKey = "defaultServer"
	var_1_0.serverIdKey = "hadLoginServerId_"
	var_1_0.hasConnect = false
	var_1_0.serverList = nil
	var_1_0.recommendServerList = nil
	var_1_0.hadLoginServerList = nil
	var_1_0.loginData = nil
	var_1_0.handlerUpdateEntry = nil
	var_1_0.wujiangServerList = nil
	var_1_0.uiStack = {}
	var_1_0.timer = nil
	var_1_0.canClickLoginButton = true

	function var_1_0.handlerChannelLogin(arg_2_0)
		log.info("@@@@登录成功，初始角色")

		user.isLogin = true
		user.sessionId = arg_2_0.action.data.sessionId

		if channelMgr.currentChannel == channels.andxiongmaowan then
			channelMgr.transform("accessToken", arg_2_0.action.data.accessToken)
		end

		local var_2_0 = var_1_0.getExt(arg_2_0.action.data.sessionId)
		local var_2_1 = var_2_0.ts

		local function var_2_2(arg_3_0)
			if arg_3_0.action.state == 1 then
				local var_3_0 = arg_3_0.action.data

				if #arg_3_0.action.data.playerList == 0 then
					log.info("@@ 选择势力")
					smgr.changeScene(SCENE_SELECT_FORCE)
				else
					log.info("@@ 选择角色")
					smgr.changeScene(SCENE_SELECT_PLAYER)
				end
			end
		end

		local function var_2_3()
			log.info("重连 ok")

			cmgr.obkey = arg_2_0.action.data.ext
			cmgr.lastTs = var_2_1

			if not var_1_0._selectedPlayerSSP then
				cmgr.sendRequest(var_2_2, actions.getPlayerList, platform.getFlag())
			else
				var_1_0.selectPlayerAndStartGame()
			end

			if channelMgr.getCurrentChannel() == channels.iosAppstore then
				local var_4_0 = DeviceUtils:getIdfa()

				cmgr.sendRequest(function()
					log.info("idfa ok:", var_4_0)
				end, actions.registerRecord, var_4_0)
			end
		end

		if channelMgr.currentChannel.proxy then
			cmgr.sendRequestWithoutModal(var_2_3, actions.reconnect, var_2_0.sessionId, var_2_0.ts, var_2_0.sign)

			local var_2_4
		else
			var_2_3()
		end
	end

	function var_1_0.getExt(arg_6_0)
		require("lua/common/encrypt/BigInt")
		require("lua/common/encrypt/BitLibEmu")

		local var_6_0 = {
			sessionId = string.sub(arg_6_0, 1, 32),
			ext = string.sub(arg_6_0, 33, #arg_6_0)
		}

		if not var_6_0.ext or #var_6_0.ext == 0 then
			var_6_0.ext = "0"
		end

		var_6_0.l = 250000
		var_6_0.h = 992500
		var_6_0.p = 920461
		var_6_0.g = 11
		var_6_0.dts = string.format("%d", 9569378)
		var_6_0.ts = os.time()
		var_6_0.sp = var_6_0.dts % 11 + 5
		var_6_0.p1 = string.format("%d", "0x" .. string.sub(var_6_0.sessionId, 3, 8))
		var_6_0.p2 = string.format("%d", "0x" .. string.sub(var_6_0.sessionId, 24, 29))
		var_6_0.x = var_6_0.p1 % var_6_0.sp
		var_6_0.y = var_6_0.p2 % 3 + 2
		var_6_0.a = math.random(var_6_0.l, var_6_0.h)
		var_6_0.hs = BigInt_ModPower({
			var_6_0.g
		}, {
			var_6_0.a
		}, {
			string.format("%d", "0x" .. string.format("%d", var_6_0.p))
		})
		cmgr.connectNumber = var_6_0.a
		var_6_0.sessionNum = string.format("%d", "0x" .. string.sub(var_6_0.sessionId, var_6_0.x, var_6_0.x + var_6_0.y))
		var_6_0.bkey = string.format("%d", "0x" .. var_6_0.ext) - var_6_0.sessionNum
		var_6_0.key = BigInt_ModPower({
			var_6_0.bkey
		}, {
			var_6_0.a
		}, {
			string.format("%d", "0x" .. string.format("%d", var_6_0.p))
		})[1] + var_6_0.sessionNum
		var_6_0.hexkey = string.upper(string.gsub(string.format("%#x", var_6_0.key), "0x", ""))

		require("lua/common/encrypt/Sha1")

		local var_6_1 = Sha1

		var_6_0.sign = var_6_1(string.upper(var_6_1(var_6_0.ext .. var_6_0.hexkey .. var_6_0.dts) .. var_6_0.sessionId .. var_6_0.ts)) .. string.gsub(string.format("%#x", var_6_0.hs[1] + var_6_0.sessionNum), "0x", "")

		return var_6_0
	end

	function var_1_0.selectPlayerAndStartGame()
		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			cmgr.sendRequest(selectPlayer.control.receive_playerInfo, actions.getPlayerInfo, "", platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", var_1_0._selectedPlayerSSP, PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "ft")
		else
			cmgr.sendRequest(selectPlayer.control.receive_playerInfo, actions.getPlayerInfo, "", platform.getFlag(), channelMgr.pushToken, loginData.selectedServer and loginData.selectedServer.serverId or "", var_1_0._selectedPlayerSSP, PlatformHelper:getInstance():GetUDID(""), platform.getOS(), PlatformHelper:getInstance():GetUDID(""), platform.getASTID(), "", "", "")
		end
	end

	function var_1_0.channelLogin()
		statMgr.update(statMgr.state.enterGame)
		log.info("@@@ 渠道登录")

		channelMgr.backButtonText = 141008

		local var_8_0

		if channelMgr.currentChannel then
			if channelMgr.currentChannel == channels.iosXM then
				log.info("@@ujoy ios channnel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxXinmaIOSLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andXM then
				log.info("@@ujoy android channnel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxXinmaIOSLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.iosTw37Wan then
				log.info("@@37wan android channnel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxUjoyTwLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andTw37Wan then
				log.info("@@37wan android channnel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxUjoyTwLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andVN or channelMgr.currentChannel == channels.andVNPubgame then
				log.info("@@Changic android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxChangicLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.iosVN then
				log.info("@@Changic ios channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxChangicLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andTH or channelMgr.currentChannel == channels.andTHPubgame then
				log.info("@@Changic android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxChangicLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andTHPocketGame then
				log.info("@@th pocketgame android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxThPocketGameLogin, loginData.data.userId, loginData.data.token, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andVNPocketGame then
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxVnPocketGameLogin, loginData.data.userId, loginData.data.token, platform.getFlag())
			elseif channelMgr.currentChannel == channels.iosTH then
				log.info("@@Changic ios channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxChangicLogin, loginData.data.userId, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andTwPub then
				log.info("@@pubgame android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxPubgameAndLogin, loginData.data.uid, loginData.data.token, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andTwGo2Play or channelMgr.currentChannel == channels.andTwGo2PlayThird then
				log.info("@@go2play android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxTwGo2PlayAndLogin, loginData.data.userId, loginData.data.imei, platform.getFlag())
			elseif channelMgr.currentChannel == channels.and57k then
				log.info("@@and 57k channels")

				var_8_0 = {
					actions.yxAnd57kLogin,
					loginData.data.uid,
					loginData.data.token,
					user.serverId
				}
			elseif channelMgr.currentChannel == channels.andLoexu then
				log.info("@@loexu android channel")

				var_8_0 = {
					actions.yxLoeXuAndroidLogin,
					loginData.data.token,
					loginData.data.version,
					user.serverId
				}
			elseif channelMgr.currentChannel == channels.andGuopan then
				log.info("@@guopan android channel")

				var_8_0 = {
					actions.yxGuoPanAndroidLogin,
					loginData.data.uin,
					loginData.data.logintoken,
					user.serverId
				}
			elseif channelMgr.currentChannel == channels.test then
				log.info("@@ for test channel")
			else
				log.info("@@@ 未知的渠道")
			end

			if channelMgr.currentChannel.proxy then
				if game.loginProxy == nil then
					game.loginProxy = {}
					game.loginProxy.address = "42.62.92.221"
					game.loginProxy.port = "8400"
					game.loginProxy.host = "Host:proxy.gcmob.aoshitang.com"
				end

				if game.useDomain then
					game.loginProxy.address = "proxy.gcmob.aoshitang.com"
				end

				local var_8_1 = {
					httpAddress = string.format("http://%s/root/", game.loginProxy.address),
					host = game.loginProxy.host or "Host:proxy.gcmob.aoshitang.com"
				}

				if var_8_0 then
					cmgr.sendHttpReqestWithConf(var_8_1, var_1_0.handlerChannelLogin, unpack(var_8_0))
				end
			elseif var_8_0 then
				cmgr.sendRequest(var_1_0.handlerChannelLogin, unpack(var_8_0))
			end
		end
	end

	function var_1_0.update(arg_9_0)
		if cmgr.isConnected() then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_0.handlerUpdateEntry)

			var_1_0.handlerUpdateEntry = nil

			var_1_0.channelLogin()
		end
	end

	function var_1_0.closeStartGame()
		tool.safeRemoveChildByTag(arg_1_0, loginTag.subUi)
	end

	function var_1_0.showStartGame()
		table.insert(var_1_0.uiStack, "startGame")

		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan or conf.language == "xm" then
			var_1_0.getHavePlayerServer()
		else
			showStartGame(arg_1_0, var_1_0)
		end
	end

	function var_1_0.closeServerList()
		tool.safeRemoveChildByTag(arg_1_0, loginTag.subUi)
		table.remove(var_1_0.uiStack)

		local var_12_0 = var_1_0.uiStack[#var_1_0.uiStack]

		if var_12_0 and var_12_0 == "startGame" then
			var_1_0.showStartGame()
		end
	end

	function var_1_0.showServerList(arg_13_0)
		table.insert(var_1_0.uiStack, "serverList")
		showSelectServer(arg_1_0, var_1_0, arg_13_0)
	end

	function var_1_0.handlerServerList(arg_14_0, arg_14_1)
		statMgr.update(statMgr.state.getServerOver)

		var_1_0.wujiangServerList = {}

		if channelMgr.currentChannel == channels.andPopGame then
			var_1_0.serverList = {}

			for iter_14_0, iter_14_1 in pairs(user.popGameServerList) do
				table.insert(var_1_0.serverList, iter_14_1)
			end
		else
			local var_14_0 = arg_14_1:getResponseString()
			local var_14_1 = var_0_0.decode(var_14_0)

			var_1_0.serverList = {}

			if var_14_1 and var_14_1.root then
				for iter_14_2, iter_14_3 in pairs(var_14_1.root) do
					if iter_14_3.version then
						if iter_14_3.version == "1.4.2.0" then
							log.info("@@ 武将服")
							table.insert(var_1_0.wujiangServerList, iter_14_3)
						elseif conf and conf.serverVersion then
							if conf.serverVersion == iter_14_3.version then
								table.insert(var_1_0.serverList, iter_14_3)
							end
						elseif game.version.client and game.version.client == iter_14_3.version then
							table.insert(var_1_0.serverList, iter_14_3)
						end
					end
				end
			else
				var_1_0.serverList = var_14_1.root
			end
		end

		var_1_0.getHadLoginServer()

		var_1_0.recommendServerList = {}

		for iter_14_4, iter_14_5 in pairs(var_1_0.serverList) do
			if iter_14_5.statusValue == 2 then
				log.info("@@ 推荐1")
				table.insert(var_1_0.recommendServerList, iter_14_5)

				if channelMgr.currentChannel == channels.qihoo and not CCUserDefault:sharedUserDefault():getBoolForKey("tuijianFuS") then
					statMgr.update(statMgr.state.tuijianFuS, iter_14_5.serverId)
					CCUserDefault:sharedUserDefault():setBoolForKey("tuijianFuS", true)
				end
			end
		end

		for iter_14_6, iter_14_7 in pairs(var_1_0.wujiangServerList) do
			if iter_14_7.statusValue == 2 then
				log.info("@@ 推荐2")
				table.insert(var_1_0.recommendServerList, iter_14_7)
			end
		end

		local var_14_2 = CCUserDefault:sharedUserDefault():getStringForKey(var_1_0.defaultServerKey)

		log.info("@@ 默认服务器 ", var_14_2)

		if var_14_2 and string.len(var_14_2) ~= 0 then
			for iter_14_8, iter_14_9 in pairs(var_1_0.serverList) do
				if iter_14_9.serverId == var_14_2 then
					loginData.selectedServer = iter_14_9

					break
				end
			end

			for iter_14_10, iter_14_11 in pairs(var_1_0.wujiangServerList) do
				if iter_14_11.serverId == var_14_2 then
					loginData.selectedServer = iter_14_11

					break
				end
			end
		else
			local var_14_3 = #var_1_0.recommendServerList

			if var_14_3 > 0 then
				math.randomseed(os.time())

				local var_14_4 = math.random(1, var_14_3)

				loginData.selectedServer = var_1_0.recommendServerList[var_14_4]

				if loginData.selectedServer and loginData.selectedServer.serverId then
					CCUserDefault:sharedUserDefault():setStringForKey(var_1_0.defaultServerKey, loginData.selectedServer.serverId)
				end
			end
		end

		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan or conf.language == "xm" then
			var_1_0.getHavePlayerServer()
		elseif loginData.selectedServer then
			var_1_0.showStartGame()
		else
			var_1_0.showServerList(false)
		end
	end

	function var_1_0.checkServerState(arg_15_0)
		if arg_15_0.statusValue == 0 then
			messageBox.alert(language.get(10003), language.get(211020, arg_15_0.onlineDate))

			return false
		elseif arg_15_0.statusValue == 4 then
			messageBox.alert(language.get(10003), language.get(211021))

			return false
		elseif arg_15_0.statusValue == -1 then
			messageBox.alert(language.get(10003), string.format("%s", arg_15_0.msg))

			return false
		end

		return true
	end

	function var_1_0.startGame()
		log.info("== 开始游戏 == ")

		if var_1_0.checkServerState(loginData.selectedServer) then
			if loginData.selectedServer then
				if cmgr.init() then
					if game.useDomain then
						cmgr.serverAddress = loginData.selectedServer.host
					else
						cmgr.serverAddress = loginData.selectedServer.ip
					end

					cmgr.serverPort = loginData.selectedServer.port
					cmgr.httpAddress = string.format("http://%s/root/", loginData.selectedServer.ip)
					cmgr.host = string.format("Host:%s", loginData.selectedServer.host)

					cmgr.connect()
				end

				var_1_0.storeHadLoginServer(loginData.selectedServer)

				user.serverLoginName = loginData.selectedServer.serverName
				user.defaultserverName = loginData.selectedServer.serverName
				user.serverId = string.match(loginData.selectedServer.host, "(%d+)")
				user.serverLoginName = tostring(user.serverLoginName)

				if string.match(user.serverLoginName, "(%d+)") == nil then
					user.serverLoginName = string.format("攻城掠地_%s服", user.serverId)
				end

				if channelMgr.currentChannel == channels.qihoo and not CCUserDefault:sharedUserDefault():getBoolForKey("tuijianFuC") then
					statMgr.update(statMgr.state.tuijianFuC, loginData.selectedServer.serverId)
					CCUserDefault:sharedUserDefault():setBoolForKey("tuijianFuC", true)
				end

				if var_1_0.handlerUpdateEntry == nil then
					var_1_0.handlerUpdateEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_1_0.update, 0, false)
				end
			else
				messageBox.alert(language.get(211007), language.get(211013))
			end
		end
	end

	function var_1_0.choiceServer(arg_17_0)
		if arg_17_0 and var_1_0.checkServerState(arg_17_0) then
			var_1_0.closeServerList()

			loginData.selectedServer = arg_17_0

			CCUserDefault:sharedUserDefault():setStringForKey(var_1_0.defaultServerKey, arg_17_0.serverId)
			var_1_0.showStartGame()
		end
	end

	function var_1_0.check(arg_18_0)
		if conf.language == "vie" or conf.language == "tha" or conf.language == "xm" or conf.language == "tw" then
			if conf.language == "tw" and channelMgr.getCurrentChannel() ~= channels.andTwGo2Play and channelMgr.getCurrentChannel() ~= channels.andTwGo2PlayThird then
				showFirstEnterGame(arg_1_0, var_1_0)

				return
			end

			log.info(" loginData.hasLoginIn:", loginData.hasLoginIn)

			local var_18_0 = CCUserDefault:sharedUserDefault():getBoolForKey("hasEnter")
			local var_18_1 = CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor")

			log.info("isVisitor : ", var_18_1)

			var_1_0.isVisitor = var_18_1

			if not var_18_0 then
				showFirstEnterGame(arg_1_0, var_1_0)
			elseif conf.language == "xm" then
				if platform.getFlag() == "MOBILE_ANDROID" then
					local var_18_2 = versionUpdateConstant.file.version

					reload(var_18_2)

					local var_18_3 = sys_version

					if var_18_3 and var_18_3.client then
						if tool.cmpVersion2("2.0.0.3", var_18_3.client) == 2 then
							channelMgr.autoRegist()
						else
							showFirstEnterGame(arg_1_0, var_1_0)
						end
					end
				else
					showFirstEnterGame(arg_1_0, var_1_0)
				end
			else
				channelMgr.autoRegist()
			end
		else
			showFirstEnterGame(arg_1_0, var_1_0)
		end
	end

	function var_1_0.goFromServerTxt()
		local var_19_0

		if conf and conf.useTestServerTxtUrl then
			var_19_0 = string.format("%slyServers/test/gcld/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
		elseif channelMgr.getCurrentChannel() == channels.andTHPubgame then
			var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channels.andTH.flag, os.time())
		elseif channelMgr.getCurrentChannel() == channels.andVNPubgame then
			var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channels.andVN.flag, os.time())
		elseif channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
			var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channels.andTwGo2Play.flag, os.time())
		elseif channelMgr.getCurrentChannel() == channels.iosXM then
			local var_19_1 = versionUpdateConstant.file.version

			reload(var_19_1)

			local var_19_2 = sys_version

			print("game.newVersion.appStoreCode , localVersion.appStoreCode", game.newVersion.appStoreCode, var_19_2.appStoreCode)

			if game.newVersion.appStoreCode == var_19_2.appStoreCode then
				var_19_0 = string.format("%slyServers/gcld/new/%s_server_test.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
			else
				var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
			end
		elseif channelMgr.getCurrentChannel() == channels.iosTH then
			local var_19_3 = versionUpdateConstant.file.version

			reload(var_19_3)

			local var_19_4 = sys_version

			print("game.newVersion.appStoreCode , localVersion.appStoreCode", game.newVersion.appStoreCode, var_19_4.appStoreCode)

			if game.newVersion.appStoreCode == var_19_4.appStoreCode then
				var_19_0 = string.format("%slyServers/gcld/new/%s_test_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
			else
				var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
			end
		elseif channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", "http://gcmobpatch.ujoy.com/", channelMgr.currentChannel.flag, os.time())
		else
			var_19_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
		end

		if var_19_0 then
			log.info(string.format("download serverTxt, url:%s", var_19_0))
			getHttp(var_19_0, var_1_0.handlerServerList)
		end
	end

	function var_1_0.updateFeiliuDefaultServer()
		local var_20_0 = string.format("%s_%s", var_1_0.defaultServerKey, loginData.data.uuid)
		local var_20_1 = CCUserDefault:sharedUserDefault():getStringForKey(var_1_0.defaultServerKey)

		if var_20_1 and string.len(var_20_1) ~= 0 then
			CCUserDefault:sharedUserDefault():setStringForKey(var_1_0.defaultServerKey, "")
			CCUserDefault:sharedUserDefault():setStringForKey(var_20_0, var_20_1)
		end

		var_1_0.defaultServerKey = var_20_0
		var_1_0.serverIdKey = string.format("%s_%s", var_1_0.serverIdKey, loginData.data.uuid)
	end

	function var_1_0.onLoginSuccess(arg_21_0)
		statMgr.update(statMgr.state.loginOver)

		loginData.data = arg_21_0

		if channelMgr.currentChannel and channelMgr.currentChannel == channels.andUC and var_0_1 == 1 then
			log.info("@@@ UC 再次尝试登录")

			var_0_1 = 2

			var_1_0.channelLogin()

			return
		end

		log.info("@@@ 获取服务器列表")

		if channelMgr.currentChannel then
			if channelMgr.currentChannel == channels.iosFeiLiu or channelMgr.currentChannel == channels.iosFeiliu2 or channelMgr.currentChannel == channels.androidFeiLiu or channelMgr.currentChannel == channels.androidFeiLiu2 or channelMgr.currentChannel == channels.iosAppstore then
				var_1_0.updateFeiliuDefaultServer()
			end

			local var_21_0

			if conf and conf.useTestServerTxtUrl then
				var_21_0 = string.format("%slyServers/test/gcld/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
			elseif channelMgr.getCurrentChannel() == channels.andTHPubgame then
				var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channels.andTH.flag, os.time())
			elseif channelMgr.getCurrentChannel() == channels.andVNPubgame then
				var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channels.andVN.flag, os.time())
			elseif channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
				var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channels.andTwGo2Play.flag, os.time())
			elseif channelMgr.getCurrentChannel() == channels.iosXM then
				local var_21_1 = versionUpdateConstant.file.version

				reload(var_21_1)

				local var_21_2 = sys_version

				print("game.newVersion.appStoreCode , localVersion.appStoreCode", game.newVersion.appStoreCode, var_21_2.appStoreCode)

				if game.newVersion.appStoreCode == var_21_2.appStoreCode then
					var_21_0 = string.format("%slyServers/gcld/new/%s_server_test.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
				else
					var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
				end
			elseif channelMgr.getCurrentChannel() == channels.iosTH then
				local var_21_3 = versionUpdateConstant.file.version

				reload(var_21_3)

				local var_21_4 = sys_version

				print("game.newVersion.appStoreCode , localVersion.appStoreCode", game.newVersion.appStoreCode, var_21_4.appStoreCode)

				if game.newVersion.appStoreCode == var_21_4.appStoreCode then
					var_21_0 = string.format("%slyServers/gcld/new/%s_test_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
				else
					var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
				end
			elseif channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
				var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", "http://gcmobpatch.ujoy.com/", channelMgr.currentChannel.flag, os.time())
			else
				var_21_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", conf.address, channelMgr.currentChannel.flag, os.time())
			end

			if var_21_0 then
				log.info(string.format("download serverTxt, url:%s", var_21_0))
				getHttp(var_21_0, var_1_0.handlerServerList)
			end
		else
			log.error("@@ 不能判断当前渠道，当前渠道为nil")
		end
	end

	function var_1_0.login()
		if var_1_0.canClickLoginButton then
			statMgr.update(statMgr.state.loginSDK)
			pmgr.requestPersmission(language.get(470001), function()
				channelMgr.login(var_1_0.onLoginSuccess)
			end, function()
				messageBox.alert(language.get(211007), language.get(470002))
			end, PERMISSION.READ_PHONE_STATE)

			var_1_0.canClickLoginButton = false

			local function var_22_0()
				var_1_0.canClickLoginButton = true
			end

			if var_1_0.timer then
				var_1_0.timer:over()

				var_1_0.timer = nil
			end

			var_1_0.timer = NewTimer(1, var_22_0)
		end
	end

	function var_1_0.getHadLoginServer()
		var_1_0.hadLoginServerList = {}

		for iter_26_0 = 1, 3 do
			local var_26_0 = CCUserDefault:sharedUserDefault():getStringForKey(string.format("%s%s", var_1_0.serverIdKey, iter_26_0))

			if var_26_0 and string.len(var_26_0) > 0 and var_1_0.serverList then
				for iter_26_1, iter_26_2 in pairs(var_1_0.serverList) do
					if iter_26_2.serverId == var_26_0 then
						table.insert(var_1_0.hadLoginServerList, iter_26_2)
					end
				end
			end
		end
	end

	function var_1_0.storeHadLoginServer(arg_27_0)
		var_1_0.hadLoginServerList = var_1_0.hadLoginServerList or {}

		for iter_27_0, iter_27_1 in pairs(var_1_0.hadLoginServerList) do
			if iter_27_1.serverId == arg_27_0.serverId then
				return
			end
		end

		if #var_1_0.hadLoginServerList > 2 then
			table.remove(var_1_0.hadLoginServerList, 1)
		end

		table.insert(var_1_0.hadLoginServerList, arg_27_0)

		for iter_27_2, iter_27_3 in pairs(var_1_0.hadLoginServerList) do
			log.info("@@ 存储服务器列表：", iter_27_2, iter_27_3)
			CCUserDefault:sharedUserDefault():setStringForKey(string.format("%s%s", var_1_0.serverIdKey, iter_27_2), iter_27_3.serverId)
		end
	end

	function var_1_0.getHavePlayerServer()
		var_1_0.havePlayerServerList = {}

		if channelMgr.currentChannel then
			local var_28_0
			local var_28_1 = var_1_0.getUID()

			if not var_28_1 then
				log.info("uid is nil")
			end

			local var_28_2 = channelMgr.currentChannel.yx

			log.info("yx:" .. tostring(var_28_2))

			if var_28_1 and var_28_2 and var_28_2 ~= "" then
				log.info("getPlayers from http")

				local var_28_3 = "proxy.gcmob.ujoy.com"
				local var_28_4 = "119.28.107.165"
				local var_28_5 = string.format("http://119.28.107.165/root/getUserInfoByGameYxAndUid.action?game=gcmob&yx=%s&uid=%s&firstLogin=false", var_28_2, var_28_1)

				if game.useDomain then
					var_28_5 = string.gsub(var_28_5, var_28_4, var_28_3)
				end

				local var_28_6 = string.gsub(var_28_5, var_28_4, var_28_3)

				log.info(var_28_6)
				getHttp(var_28_6, var_1_0.handlerGetHavePlayerServer, nil, nil)

				return
			end

			log.info("not get getPlayers")
			var_1_0.showServers()
		end
	end

	function var_1_0.getUID(...)
		showTable(loginData)

		local var_29_0

		if channelMgr.currentChannel and loginData.data then
			var_29_0 = loginData.data.userId
		end

		return var_29_0
	end

	function var_1_0.handlerGetHavePlayerServer(arg_30_0, arg_30_1)
		local var_30_0 = arg_30_1:getResponseString()
		local var_30_1 = var_0_0.decode(var_30_0)

		var_1_0.havePlayerServerList = {}

		showTable(var_30_1)

		if var_30_1 and var_30_1.root then
			for iter_30_0, iter_30_1 in pairs(var_30_1.root) do
				log.info(iter_30_1)

				local var_30_2 = iter_30_1

				var_30_2.o = var_30_2.o or {}
				var_30_2.time = var_30_2.ll
				var_30_2.ll = os.date("%m-%d %H:%M", math.floor(var_30_2.ll / 1000))

				table.insert(var_1_0.havePlayerServerList, var_30_2)
			end
		end

		table.sort(var_1_0.havePlayerServerList, function(arg_31_0, arg_31_1)
			return arg_31_0.time > arg_31_1.time
		end)
		var_1_0.showServers()
	end

	function var_1_0.showServers()
		tool.safeRemoveChildByTag(arg_1_0, loginTag.subUi)

		local var_32_0 = require("lua/layer/login/loginLayer").new(var_1_0)

		if var_32_0 then
			arg_1_0:addChild(var_32_0, 0, loginTag.subUi)
		else
			log.info("create loginLayer error")
		end

		if g_quickLogin and loginData.selectedServer then
			CCUserDefault:sharedUserDefault():setStringForKey(var_1_0.defaultServerKey, loginData.selectedServer.serverId)
			var_1_0.startGame()
		end
	end

	function var_1_0.init(arg_33_0)
		user.init()
		loginData.init()
	end

	function var_1_0.clearup(arg_34_0)
		if var_1_0.timer then
			var_1_0.timer:over()

			var_1_0.timer = nil
		end
	end

	return var_1_0
end
