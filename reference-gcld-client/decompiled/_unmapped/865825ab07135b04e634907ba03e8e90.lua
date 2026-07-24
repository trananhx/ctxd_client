require("lua/common/tool")
require("lua/data/loginData")
require("lua/layer/loginWeb/firstEnterGame")
require("lua/layer/loginWeb/astUserLogin")
require("lua/layer/loginWeb/astUserRegister")
require("lua/layer/loginDebug/astUserProtocal")
require("lua/layer/loginWeb/firstEnterGame")
require("lua/layer/loginWeb/startGame")
require("lua/layer/loginWeb/selectServer")
require("lua/layer/loginWeb/astUserBind")
require("lua/data/channels")

local var_0_0 = require("lua/common/json")
local var_0_1

function createLoginControl(arg_1_0)
	local var_1_0 = {}

	var_1_0.defaultServerKey = "defaultServer"
	var_1_0.firstEnterGame = false
	var_1_0.hasConnect = false
	var_1_0.ticket = nil
	var_1_0.isVisitor = false
	var_1_0.loginData = nil
	var_1_0.user = {}
	var_1_0.user.name = nil
	var_1_0.user.pwd = nil
	var_1_0.isProtocalChecked = true
	var_1_0.stackPanel = {}

	function var_1_0.changeUi(arg_2_0)
		if var_1_0.stackPanel[#var_1_0.stackPanel] == arg_2_0 then
			return
		end

		table.insert(var_1_0.stackPanel, arg_2_0)
	end

	function var_1_0.returnToLast()
		table.remove(var_1_0.stackPanel)

		local var_3_0 = var_1_0.stackPanel[#var_1_0.stackPanel]

		log.info(var_3_0)

		if var_3_0 == "bind" then
			showAstUserBindWeb(arg_1_0, var_1_0)
		elseif var_3_0 == "login" then
			showAstUserLoginWeb(arg_1_0, var_1_0)
		elseif var_3_0 == "register" then
			showAstUserRegisterWeb(arg_1_0, var_1_0)
		elseif var_3_0 == "first" then
			showFirstEnterGameWeb(arg_1_0, var_1_0)
		elseif var_3_0 == "serverList" then
			var_1_0.showSelectServerWeb()
		elseif var_3_0 == "startGame" then
			var_1_0.showStartGame()
		elseif var_3_0 == "startVisitor" then
			var_1_0.showStartGame()
		elseif var_3_0 == "protocal" then
			showProtocal(arg_1_0, var_1_0)
		else
			showFirstEnterGameWeb(arg_1_0, var_1_0)
		end
	end

	function var_1_0.handlerYxTwLogin(arg_4_0)
		user.isLogin = true
		user.sessionId = arg_4_0.action.data.sessionId

		smgr.changeScene(SCENE_SELECT_PLAYER)
	end

	function var_1_0.handlerChannelLogin(arg_5_0)
		log.info("@@@登录成功，初始角色")

		user.isLogin = true
		user.sessionId = arg_5_0.action.data.sessionId

		smgr.changeScene(SCENE_SELECT_PLAYER)
	end

	function var_1_0.channelLogin()
		channelMgr.backButtonText = 141008

		if channelMgr.currentChannel and not var_1_0.isAstLogin then
			log.info("@@@ 渠道登录")

			if channelMgr.currentChannel == channels.iosTW then
				log.info("@@facebook ios channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxIOSFacebookLogin, loginData.data.uid, loginData.data.accessToken, platform.getFlag())
			elseif channelMgr.currentChannel == channels.andTW then
				log.info("@@facebook android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxIOSFacebookLogin, loginData.data.uid, loginData.data.accessToken, platform.getFlag())
			elseif channelMgr.currentChannel == channels.test then
				log.info("@@ for test channel")
			else
				log.info("@@@ 未知的渠道")
			end
		else
			log.info("@@@ 傲世堂登录")
			cmgr.sendRequest(var_1_0.handlerYxTwLogin, actions.yxTwLogin, loginData.data.timestamp, loginData.data.userId, loginData.data.token, platform.getFlag())
		end
	end

	function var_1_0.update(arg_7_0)
		if cmgr.isConnected() then
			var_1_0.channelLogin()
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_0.handlerUpdateEntry)
		end
	end

	function var_1_0.handlerEnterGame(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1:getResponseString()
	end

	function var_1_0.handlerRegister(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1:getResponseString()

		log.info(var_9_0)

		local var_9_1 = var_0_0.decode(var_9_0)

		if var_9_1.state ~= 1 then
			messageBox.error(var_9_1.msg)
		elseif CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor") then
			var_1_0.bindUser(var_1_0.user.name, var_1_0.user.pwd)
		else
			var_1_0.login(var_1_0.user.name, var_1_0.user.pwd)
		end
	end

	function var_1_0.handlerUserBind(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1:getResponseString()
		local var_10_1 = var_0_0.decode(var_10_0)

		if var_10_1.state ~= 1 then
			messageBox.error(var_10_1.msg)
		else
			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():setStringForKey("visitorId", nil)
			CCUserDefault:sharedUserDefault():flush()

			if loginData.fastLogin.bindUser and loginData.fastLogin.bindPwd then
				CCUserDefault:sharedUserDefault():setStringForKey("userName", loginData.fastLogin.bindUser)
				CCUserDefault:sharedUserDefault():setStringForKey("userPwd", loginData.fastLogin.bindPwd)
				CCUserDefault:sharedUserDefault():flush()
				var_1_0.login(loginData.fastLogin.bindUser, loginData.fastLogin.bindPwd)
			end
		end
	end

	function var_1_0.startGameFaild()
		var_1_0.hasclickStart = false
	end

	function var_1_0.goToRegister()
		showAstUserRegisterWeb(arg_1_0, var_1_0)
	end

	function var_1_0.register(arg_13_0, arg_13_1)
		local var_13_0 = string.format(url.register, arg_13_0, arg_13_1)

		var_1_0.user.name = arg_13_0
		var_1_0.user.pwd = arg_13_1

		getHttp(var_13_0, var_1_0.handlerRegister, "post")
	end

	function var_1_0.goToProtocal()
		showProtocal(arg_1_0, var_1_0)
	end

	function var_1_0.bindUser(arg_15_0, arg_15_1)
		if loginData.fastLogin and not loginData.fastLogin.tempPlayerId then
			messageBox.alert(language.get(10003), language.get(211009))

			return
		end

		if not loginData.fastLogin then
			loginData.fastLogin = {}
			loginData.fastLogin.tempPlayerId = CCUserDefault:sharedUserDefault():getStringForKey("visitorId")
		end

		loginData.fastLogin.bindUser = arg_15_0
		loginData.fastLogin.bindPwd = arg_15_1

		local var_15_0 = tostring(os.time())
		local var_15_1 = Utils:md5ToLua(var_15_0 .. loginData.fastLogin.tempPlayerId .. arg_15_0 .. arg_15_1 .. bindKey)
		local var_15_2 = string.lower(var_15_1)
		local var_15_3 = string.format(url.autoBind, var_15_0, loginData.fastLogin.tempPlayerId, arg_15_0, arg_15_1, var_15_2)

		getHttp(var_15_3, var_1_0.handlerUserBind, "post")
	end

	function var_1_0.handlerLoginWeb(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_1:getResponseString()
		local var_16_1 = var_0_0.decode(var_16_0)

		if var_16_1.state ~= 1 then
			messageBox.alert(language.get(211007), var_16_1.msg)
			var_1_0.returnToLast()
		else
			local var_16_2 = var_16_1.loginUser[1]

			showTable(var_16_2)

			loginData.userName = var_16_2.userId

			showTable(loginData)
			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():flush()

			if var_1_0.user and var_1_0.user.name and var_1_0.user.pwd then
				log.info("@成功登陆保存用户数据")
				CCUserDefault:sharedUserDefault():setStringForKey("userName", var_1_0.user.name)
				CCUserDefault:sharedUserDefault():setStringForKey("userPwd", var_1_0.user.pwd)
				CCUserDefault:sharedUserDefault():flush()
			end

			loginData.hasLoginIn = true
			var_1_0.isAstLogin = true

			var_1_0.onLoginSuccess(var_16_2)
		end
	end

	function var_1_0.login(arg_17_0, arg_17_1)
		if string.len(arg_17_0) == 0 or string.len(arg_17_1) == 0 then
			messageBox.alert(language.get(10004), language.get(211010))
		else
			local var_17_0 = string.format(url.login, arg_17_0, arg_17_1)

			var_1_0.user = {
				name = arg_17_0,
				pwd = arg_17_1
			}

			getHttp(var_17_0, var_1_0.handlerLoginWeb, "post")
		end
	end

	function var_1_0.changeToBindUser()
		showAstUserBindWeb(arg_1_0, var_1_0)
	end

	function var_1_0.changeToLogin()
		showAstUserLoginWeb(arg_1_0, var_1_0)
	end

	function var_1_0.changeToSelectServer()
		showSelectServerWeb(arg_1_0, var_1_0)
	end

	function var_1_0.returnToStart()
		showStartGameWeb(arg_1_0, var_1_0)
	end

	function var_1_0.returnToFirstEnterGame()
		showFirstEnterGameWeb(arg_1_0, var_1_0)
	end

	function var_1_0.returnVisitorStart()
		var_1_0.showStartGame()
	end

	function var_1_0.handlerConfigFile(arg_24_0, arg_24_1)
		local var_24_0 = arg_24_1:getResponseString()
		local var_24_1 = Utils:getAttributeByKeyFromXml(var_24_0, "socketServiceUrl", "value")
		local var_24_2 = Utils:getAttributeByKeyFromXml(var_24_0, "httpServiceUrl", "value")
		local var_24_3 = tool.split(var_24_1, ":")
		local var_24_4 = var_24_3[1]
		local var_24_5 = tonumber(var_24_3[2])

		if cmgr.init() then
			cmgr.serverAddress = var_24_4
			cmgr.serverPort = var_24_5
			cmgr.httpAddress = var_24_2

			cmgr.connect()
		end

		var_1_0.handlerUpdateEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_1_0.update, 0, false)
	end

	function var_1_0.startGame()
		log.info("== 开始游戏 == ")

		var_1_0.isAutoRegistLogin = false

		if var_1_0.checkServerState(loginData.selectedServer) then
			if loginData.selectedServer then
				if cmgr.init() then
					cmgr.serverAddress = loginData.selectedServer.ip
					cmgr.serverPort = loginData.selectedServer.port
					cmgr.httpAddress = string.format("http://%s/root/", loginData.selectedServer.ip)
					cmgr.host = string.format("Host:%s", loginData.selectedServer.host)

					cmgr.connect()
					CCUserDefault:sharedUserDefault():setStringForKey(var_1_0.defaultServerKey, loginData.selectedServer.serverId)
					CCUserDefault:sharedUserDefault():flush()
				end

				var_1_0.handlerUpdateEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_1_0.update, 0, false)
			else
				messageBox.alert(language.get(211007), language.get(211013))
			end
		end
	end

	function var_1_0.choiceServer(arg_26_0)
		if arg_26_0 then
			loginData.selectedServer = arg_26_0

			var_1_0.closeServerList()
		end
	end

	function var_1_0.onAutoLogin(arg_27_0, arg_27_1)
		var_1_0.isAstLogin = true

		local var_27_0 = arg_27_1:getResponseString()

		log.info(var_27_0)

		local var_27_1 = var_0_0.decode(var_27_0)

		if var_27_0 and string.len(var_27_0) > 0 then
			if var_27_1.state and var_27_1.state == 1 then
				local var_27_2 = var_27_1.loginUser[1]

				CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
				CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", true)
				CCUserDefault:sharedUserDefault():setStringForKey("visitorId", var_27_1.tempPlayerID)
				CCUserDefault:sharedUserDefault():flush()

				loginData.fastLogin = {}
				loginData.fastLogin.tempPlayerId = var_27_1.tempPlayerID
				loginData.hasLoginIn = true

				if var_1_0.firstEnterGame then
					var_1_0.startGame()
				else
					var_1_0.onLoginSuccess(var_27_2)
				end
			else
				messageBox.alert("error", var_27_1.msg)

				if var_27_1.state == 6 then
					CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
					CCUserDefault:sharedUserDefault():setStringForKey("visitorId", nil)
					CCUserDefault:sharedUserDefault():flush()
				end

				var_1_0.returnToLast()
			end
		end
	end

	function var_1_0.visitorLogin()
		local var_28_0 = tostring(os.time())
		local var_28_1 = CCUserDefault:sharedUserDefault():getStringForKey("visitorId")
		local var_28_2 = Utils:md5ToLua(var_28_0 .. var_28_1 .. loginKey)
		local var_28_3 = string.lower(var_28_2)

		log.info("tempPlayerId:", var_28_1)

		local var_28_4 = string.format(url.autoLogin, var_28_0, var_28_1, var_28_3)

		log.info("autoLoginUrl:", var_28_4)
		getHttp(var_28_4, var_1_0.onAutoLogin, "post")
	end

	function var_1_0.onAutoRegist(arg_29_0, arg_29_1)
		local var_29_0 = CCUserDefault:sharedUserDefault():getStringForKey("visitorId")

		if var_29_0 and string.len(var_29_0) > 0 then
			var_1_0.visitorLogin()
		else
			local var_29_1 = arg_29_1:getResponseString()

			if var_29_1 and string.len(var_29_1) > 0 then
				local var_29_2 = var_0_0.decode(var_29_1)

				if var_29_2.state and var_29_2.state == 1 then
					log.info("@@ 自动注册成功")

					var_1_0.isAstLogin = true

					local var_29_3 = var_29_2.loginUser[1]

					CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
					CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", true)
					CCUserDefault:sharedUserDefault():setStringForKey("visitorId", var_29_2.tempPlayerID)
					CCUserDefault:sharedUserDefault():flush()

					var_1_0.isAutoRegistLogin = true

					var_1_0.onLoginSuccess(var_29_3)
				else
					messageBox.alert("error", var_29_2.msg)
					var_1_0.returnToLast()
				end
			end
		end
	end

	function var_1_0.fastStart()
		local var_30_0 = tostring(os.time())
		local var_30_1 = var_30_0 .. reigsterKey
		local var_30_2 = Utils:md5ToLua(var_30_1)
		local var_30_3 = string.lower(var_30_2)
		local var_30_4 = string.format(url.autoRegister, var_30_0, var_30_3)

		getHttp(var_30_4, var_1_0.onAutoRegist, "post")
	end

	function var_1_0.astUserLogin()
		showAstUserLoginWeb(arg_1_0, var_1_0)
	end

	function var_1_0.check(arg_32_0)
		log.info(" loginData.hasLoginIn:", loginData.hasLoginIn)

		local var_32_0 = CCUserDefault:sharedUserDefault():getBoolForKey("hasEnter")
		local var_32_1 = CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor")

		log.info("isVisitor : ", var_32_1)

		var_1_0.isVisitor = var_32_1

		if not var_32_0 then
			showFirstEnterGameWeb(arg_1_0, var_1_0)
		elseif var_32_1 then
			local var_32_2 = CCUserDefault:sharedUserDefault():getStringForKey("visitorId")

			if loginData.hasLoginIn then
				showTable(loginData)
				var_1_0.showStartGame()
			elseif var_32_2 and string.len(var_32_2) > 0 then
				var_1_0.visitorLogin()
			end
		else
			local var_32_3 = CCUserDefault:sharedUserDefault():getStringForKey("userName")
			local var_32_4 = CCUserDefault:sharedUserDefault():getStringForKey("userPwd")

			log.info("userName :", var_32_3, "userPwd :", var_32_4)

			if loginData.hasLoginIn then
				showStartGameWeb(arg_1_0, var_1_0)
			elseif var_32_3 and var_32_4 and string.len(var_32_3) > 0 and string.len(var_32_4) > 0 then
				var_1_0.login(var_32_3, var_32_4)
			else
				showFirstEnterGameWeb(arg_1_0, var_1_0)
			end
		end
	end

	function var_1_0.goFromServerTxt()
		if channelMgr.currentChannel and not var_1_0.isAstLogin then
			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():flush()

			local var_33_0
			local var_33_1 = conf.address

			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_33_0 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_33_1, channelMgr.currentChannel.flag, os.time())
			else
				var_33_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", var_33_1, channelMgr.currentChannel.flag, os.time())
			end

			if var_33_0 then
				getHttp(var_33_0, var_1_0.handlerServerList)
			end
		else
			local var_33_2
			local var_33_3 = conf.address

			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_33_2 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_33_3, channelMgr.currentChannel.flag, os.time())
			else
				var_33_2 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", var_33_3, channelMgr.currentChannel.flag, os.time())
			end

			if var_33_2 then
				getHttp(var_33_2, var_1_0.handlerServerList)
			end
		end
	end

	function var_1_0.init(arg_34_0)
		user.init()
		loginData.init()
	end

	function var_1_0.onLoginSuccess(arg_35_0)
		loginData.data = arg_35_0

		log.info("@@@ 获取服务器列表")

		if channelMgr.currentChannel and not var_1_0.isAstLogin then
			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():flush()

			local var_35_0
			local var_35_1 = conf.address

			log.info("服务器列表地址1", conf.address)
			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_35_0 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_35_1, channelMgr.currentChannel.flag, os.time())
			else
				var_35_0 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", var_35_1, channelMgr.currentChannel.flag, os.time())
			end

			if var_35_0 then
				getHttp(var_35_0, var_1_0.handlerServerList)
			end
		else
			local var_35_2
			local var_35_3 = conf.address

			log.info("服务器列表地址2", conf.address)
			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_35_2 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_35_3, channelMgr.currentChannel.flag, os.time())
			else
				var_35_2 = string.format("%slyServers/gcld/new/%s_server.txt?ts=%s", var_35_3, channelMgr.currentChannel.flag, os.time())
			end

			if var_35_2 then
				getHttp(var_35_2, var_1_0.handlerServerList)
			end
		end
	end

	function var_1_0.closeStartGame()
		tool.safeRemoveChildByTag(arg_1_0, loginTag.startGame)
	end

	function var_1_0.showStartGame()
		table.insert(var_1_0.stackPanel, "startGame")

		if var_1_0.isAutoRegistLogin then
			showStartGameWeb(arg_1_0, var_1_0)
		else
			local var_37_0 = CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor")

			showStartGameWeb(arg_1_0, var_1_0, var_37_0)
		end
	end

	function var_1_0.closeServerList()
		tool.safeRemoveChildByTag(arg_1_0, loginTag.serverList)
		table.remove(var_1_0.stackPanel)

		local var_38_0 = var_1_0.stackPanel[#var_1_0.stackPanel]

		log.info("closeServerList , lastServer", var_38_0)

		if var_38_0 and var_38_0 == "startGame" then
			var_1_0.showStartGame()
		end
	end

	function var_1_0.showServerList()
		table.insert(var_1_0.stackPanel, "serverList")
		showSelectServerWeb(arg_1_0, var_1_0)
	end

	function var_1_0.handlerServerList(arg_40_0, arg_40_1)
		local var_40_0 = arg_40_1:getResponseString()
		local var_40_1 = var_0_0.decode(var_40_0)

		var_1_0.serverList = var_40_1.root
		var_1_0.serverList = {}

		if var_40_1 and var_40_1.root then
			for iter_40_0, iter_40_1 in pairs(var_40_1.root) do
				if iter_40_1.version then
					if conf and conf.serverVersion then
						if conf.serverVersion == iter_40_1.version then
							table.insert(var_1_0.serverList, iter_40_1)
						end
					elseif game.version.client and game.version.client == iter_40_1.version then
						table.insert(var_1_0.serverList, iter_40_1)
					end
				end
			end
		else
			var_1_0.serverList = var_40_1.root
		end

		local var_40_2 = CCUserDefault:sharedUserDefault():getStringForKey(var_1_0.defaultServerKey)

		log.info("@@ 默认服务器 ", var_40_2)

		if var_40_2 and string.len(var_40_2) ~= 0 then
			log.info("defaultServerId： ", var_40_2)

			for iter_40_2, iter_40_3 in pairs(var_1_0.serverList) do
				showTable(iter_40_3)

				if iter_40_3.serverId == var_40_2 then
					loginData.selectedServer = iter_40_3

					break
				end
			end
		else
			log.info("@@ 查找推荐服务器")

			local var_40_3 = {}

			for iter_40_4, iter_40_5 in pairs(var_1_0.serverList) do
				if iter_40_5.statusValue == 2 then
					table.insert(var_40_3, iter_40_5)
				end
			end

			local var_40_4 = #var_40_3

			if var_40_4 > 0 then
				math.randomseed(os.time())

				local var_40_5 = math.random(1, var_40_4)

				loginData.selectedServer = var_40_3[var_40_5]

				if loginData.selectedServer and loginData.selectedServer.serverId then
					CCUserDefault:sharedUserDefault():setStringForKey(var_1_0.defaultServerKey, loginData.selectedServer.serverId)
					CCUserDefault:sharedUserDefault():flush()
				end
			end
		end

		if loginData.selectedServer then
			log.info("has loginData.selectedServer")
			var_1_0.showStartGame()
		else
			var_1_0.showStartGame()
			var_1_0.showServerList()
		end
	end

	function var_1_0.checkServerState(arg_41_0)
		if arg_41_0.statusValue == 0 then
			messageBox.alert(language.get(10003), language.get(211020, arg_41_0.onlineDate))

			return false
		elseif arg_41_0.statusValue == 4 then
			messageBox.alert(language.get(10003), language.get(211021))

			return false
		elseif arg_41_0.statusValue == -1 then
			messageBox.alert(language.get(10003), string.format("%s", arg_41_0.msg))

			return false
		end

		return true
	end

	if var_0_1 ~= nil and var_0_1.isAstLogin then
		var_1_0.isAstLogin = true
	end

	var_0_1 = var_1_0

	return var_1_0
end
