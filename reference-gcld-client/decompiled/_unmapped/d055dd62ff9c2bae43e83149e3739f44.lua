require("lua/common/tool")
require("lua/data/loginData")
require("lua/layer/loginWebKorea/firstEnterGame")
require("lua/layer/loginWebKorea/astUserLogin")
require("lua/layer/loginWebKorea/astUserRegister")
require("lua/layer/loginWebKorea/firstEnterGame")
require("lua/layer/loginWebKorea/startGame")
require("lua/layer/loginWebKorea/selectServer")
require("lua/layer/loginWebKorea/astUserBind")
require("lua/layer/loginWebKorea/changePassword")
require("lua/layer/loginWebKorea/kunlunProtocal")
require("lua/data/channels")

local var_0_0 = require("lua/common/json")

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
	var_1_0.isLeftProtocalChecked = false
	var_1_0.isRightProtocalChecked = false
	var_1_0.trigerFastStart = false
	var_1_0.trigerLogin = false
	var_1_0.trigerFbLogin = false
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
			showKunlunProtocal(arg_1_0, var_1_0)
		elseif var_3_0 == "changePassword" then
			showshowChangePassword(arg_1_0, var_1_0)
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

			if channelMgr.currentChannel == channels.andKR then
				log.info("@@kunlun android channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxKunlunLogin, loginData.data.klsso, loginData.userSource, platform.getFlag())
			elseif channelMgr.currentChannel == channels.iosKR then
				log.info("@@kunlun ios channel")
				cmgr.sendRequest(var_1_0.handlerChannelLogin, actions.yxKunlunLogin, loginData.data.klsso, loginData.userSource, platform.getFlag())
			elseif channelMgr.currentChannel == channels.test then
				log.info("@@ for test channel")
			else
				log.info("@@@ 未知的渠道")
			end
		else
			log.info("@@@ 傲世堂登录")
			cmgr.sendRequest(var_1_0.handlerYxTwLogin, actions.yx, loginData.data.timestamp, loginData.data.userId, loginData.data.token)
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
		var_1_0.user.name = arg_13_0
		var_1_0.user.pwd = arg_13_1
		loginData.userName = arg_13_0
		loginData.userPwd = arg_13_1

		channelMgr.directRegister(arg_13_0, arg_13_1)
	end

	function var_1_0.gotoProtocal()
		showKunlunProtocal(arg_1_0, var_1_0)
	end

	function var_1_0.bindUser(arg_15_0, arg_15_1)
		if not loginData.isTrailAccount then
			messageBox.alert(language.get(10003), language.get(211009))

			return
		end

		if string.len(arg_15_0) == 0 or string.len(arg_15_1) == 0 then
			messageBox.alert(language.get(211007), language.get(211010))
		elseif string.len(arg_15_1) >= 6 and string.len(arg_15_1) <= 20 then
			channelMgr.bindAccount(arg_15_0, arg_15_1)
		else
			messageBox.alert(language.get(10003), "비밀번호는 6~20자리 영문 또는 숫자여야 합니다.")
		end
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
			CCUserDefault:sharedUserDefault():flush()

			if var_1_0.user and var_1_0.user.name and var_1_0.user.pwd then
				log.info("@成功登陆保存用户数据")
				CCUserDefault:sharedUserDefault():setStringForKey("userName", var_1_0.user.name)
				CCUserDefault:sharedUserDefault():setStringForKey("userPwd", var_1_0.user.pwd)
				CCUserDefault:sharedUserDefault():flush()
			end

			loginData.hasLoginIn = true

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
			loginData.userName = arg_17_0
			loginData.userPwd = arg_17_1

			log.info("昆仑登录")

			var_1_0.isAstLogin = false

			CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", false)
			CCUserDefault:sharedUserDefault():flush()
			channelMgr.directLogin(arg_17_0, arg_17_1)
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

	function var_1_0.changeToChPwd()
		showChangePassword(arg_1_0, var_1_0)
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

	function var_1_0.handlerConfigFile(arg_25_0, arg_25_1)
		local var_25_0 = arg_25_1:getResponseString()
		local var_25_1 = Utils:getAttributeByKeyFromXml(var_25_0, "socketServiceUrl", "value")
		local var_25_2 = Utils:getAttributeByKeyFromXml(var_25_0, "httpServiceUrl", "value")
		local var_25_3 = tool.split(var_25_1, ":")
		local var_25_4 = var_25_3[1]
		local var_25_5 = tonumber(var_25_3[2])

		if cmgr.init() then
			cmgr.serverAddress = var_25_4
			cmgr.serverPort = var_25_5
			cmgr.httpAddress = var_25_2

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

	function var_1_0.choiceServer(arg_27_0)
		if arg_27_0 then
			loginData.selectedServer = arg_27_0

			var_1_0.closeServerList()
		end
	end

	function var_1_0.onAutoLogin(arg_28_0, arg_28_1)
		local var_28_0 = arg_28_1:getResponseString()

		log.info(var_28_0)

		local var_28_1 = var_0_0.decode(var_28_0)

		if var_28_0 and string.len(var_28_0) > 0 then
			if var_28_1.state and var_28_1.state == 1 then
				local var_28_2 = var_28_1.loginUser[1]

				CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
				CCUserDefault:sharedUserDefault():setStringForKey("visitorId", var_28_1.tempPlayerID)
				CCUserDefault:sharedUserDefault():flush()

				loginData.fastLogin = {}
				loginData.fastLogin.tempPlayerId = var_28_1.tempPlayerID
				loginData.hasLoginIn = true

				if var_1_0.firstEnterGame then
					var_1_0.startGame()
				else
					var_1_0.onLoginSuccess(var_28_2)
				end
			else
				messageBox.alert("error", var_28_1.msg)

				if var_28_1.state == 6 then
					CCUserDefault:sharedUserDefault():setStringForKey("visitorId", nil)
					CCUserDefault:sharedUserDefault():flush()
				end

				var_1_0.returnToLast()
			end
		end
	end

	function var_1_0.visitorLogin()
		local var_29_0 = tostring(os.time())
		local var_29_1 = CCUserDefault:sharedUserDefault():getStringForKey("visitorId")
		local var_29_2 = Utils:md5ToLua(var_29_0 .. var_29_1 .. loginKey)
		local var_29_3 = string.lower(var_29_2)

		log.info("tempPlayerId:", var_29_1)

		local var_29_4 = string.format(url.autoLogin, var_29_0, var_29_1, var_29_3)

		log.info("autoLoginUrl:", var_29_4)
		getHttp(var_29_4, var_1_0.onAutoLogin, "post")
	end

	function var_1_0.onAutoRegist(arg_30_0, arg_30_1)
		local var_30_0 = CCUserDefault:sharedUserDefault():getStringForKey("visitorId")

		if var_30_0 and string.len(var_30_0) > 0 then
			var_1_0.visitorLogin()
		else
			local var_30_1 = arg_30_1:getResponseString()

			if var_30_1 and string.len(var_30_1) > 0 then
				local var_30_2 = var_0_0.decode(var_30_1)

				if var_30_2.state and var_30_2.state == 1 then
					log.info("@@ 自动注册成功")

					local var_30_3 = var_30_2.loginUser[1]

					CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
					CCUserDefault:sharedUserDefault():setStringForKey("visitorId", var_30_2.tempPlayerID)
					CCUserDefault:sharedUserDefault():flush()

					var_1_0.isAutoRegistLogin = true

					var_1_0.onLoginSuccess(var_30_3)
				else
					messageBox.alert("error", var_30_2.msg)
					var_1_0.returnToLast()
				end
			end
		end
	end

	function var_1_0.fastStart()
		CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", true)
		CCUserDefault:sharedUserDefault():flush()
		channelMgr.autoRegist()
	end

	function var_1_0.astUserLogin()
		showAstUserLoginWeb(arg_1_0, var_1_0)
	end

	function var_1_0.check(arg_33_0)
		log.info(" loginData.hasLoginIn:", loginData.hasLoginIn)

		local var_33_0 = CCUserDefault:sharedUserDefault():getBoolForKey("hasEnter")
		local var_33_1 = CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor")

		log.info("isVisitor : ", var_33_1)

		var_1_0.isVisitor = var_33_1

		if not var_33_0 then
			showFirstEnterGameWeb(arg_1_0, var_1_0)
		elseif var_33_1 then
			channelMgr.autoRegist()
		else
			local var_33_2 = CCUserDefault:sharedUserDefault():getStringForKey("userName")
			local var_33_3 = CCUserDefault:sharedUserDefault():getStringForKey("userPwd")

			log.info("userName :", var_33_2, "userPwd :", var_33_3)

			if loginData.hasLoginIn then
				showStartGameWeb(arg_1_0, var_1_0)
			elseif var_33_2 and var_33_3 and string.len(var_33_2) > 0 and string.len(var_33_3) > 0 then
				var_1_0.login(var_33_2, var_33_3)
			else
				showFirstEnterGameWeb(arg_1_0, var_1_0)
			end
		end
	end

	function var_1_0.goFromServerTxt()
		if channelMgr.currentChannel and not var_1_0.isAstLogin then
			CCUserDefault:sharedUserDefault():flush()

			local var_34_0
			local var_34_1 = conf.address

			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_34_0 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_34_1, channelMgr.currentChannel.flag, os.time())
			else
				var_34_0 = string.format("%slyServers/gcld/%s_server.txt?ts=%s", var_34_1, channelMgr.currentChannel.flag, os.time())
			end

			if var_34_0 then
				getHttp(var_34_0, var_1_0.handlerServerList)
			end
		else
			local var_34_2
			local var_34_3 = conf.address

			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_34_2 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_34_3, channelMgr.currentChannel.flag, os.time())
			else
				var_34_2 = string.format("%slyServers/gcld/%s_server.txt?ts=%s", var_34_3, channelMgr.currentChannel.flag, os.time())
			end

			if var_34_2 then
				getHttp(var_34_2, var_1_0.handlerServerList)
			end
		end
	end

	function var_1_0.init(arg_35_0)
		user.init()
		loginData.init()
	end

	function var_1_0.onLoginSuccess(arg_36_0)
		loginData.data = arg_36_0

		log.info("@@@ 获取服务器列表")

		if channelMgr.currentChannel and not var_1_0.isAstLogin then
			CCUserDefault:sharedUserDefault():flush()

			local var_36_0
			local var_36_1 = conf.address

			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_36_0 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_36_1, channelMgr.currentChannel.flag, os.time())
			else
				var_36_0 = string.format("%slyServers/gcld/%s_server.txt?ts=%s", var_36_1, channelMgr.currentChannel.flag, os.time())
			end

			if var_36_0 then
				getHttp(var_36_0, var_1_0.handlerServerList)
			end
		else
			local var_36_2
			local var_36_3 = conf.address

			log.info("@@ 使用测试服务器 ", conf.useTestServer)

			if conf and conf.useTestServer then
				var_36_2 = string.format("%slyServers/gcld/%s_test_server.txt?ts=%s", var_36_3, channelMgr.currentChannel.flag, os.time())
			else
				var_36_2 = string.format("%slyServers/gcld/%s_server.txt?ts=%s", var_36_3, channelMgr.currentChannel.flag, os.time())
			end

			if var_36_2 then
				getHttp(var_36_2, var_1_0.handlerServerList)
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
			local var_38_0 = CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor")

			showStartGameWeb(arg_1_0, var_1_0, var_38_0)
		end
	end

	function var_1_0.closeServerList()
		tool.safeRemoveChildByTag(arg_1_0, loginTag.serverList)
		table.remove(var_1_0.stackPanel)

		local var_39_0 = var_1_0.stackPanel[#var_1_0.stackPanel]

		log.info("closeServerList , lastServer", var_39_0)

		if var_39_0 and var_39_0 == "startGame" then
			var_1_0.showStartGame()
		end
	end

	function var_1_0.showServerList()
		table.insert(var_1_0.stackPanel, "serverList")
		showSelectServerWeb(arg_1_0, var_1_0)
	end

	function var_1_0.handlerServerList(arg_41_0, arg_41_1)
		local var_41_0 = arg_41_1:getResponseString()
		local var_41_1 = var_0_0.decode(var_41_0)

		var_1_0.serverList = var_41_1.root
		var_1_0.serverList = {}

		if var_41_1 and var_41_1.root then
			for iter_41_0, iter_41_1 in pairs(var_41_1.root) do
				if iter_41_1.version then
					if conf and conf.serverVersion then
						if conf.serverVersion == iter_41_1.version then
							table.insert(var_1_0.serverList, iter_41_1)
						end
					elseif game.version.client and game.version.client == iter_41_1.version then
						table.insert(var_1_0.serverList, iter_41_1)
					end
				end
			end
		else
			var_1_0.serverList = var_41_1.root
		end

		local var_41_2 = CCUserDefault:sharedUserDefault():getStringForKey(var_1_0.defaultServerKey)

		log.info("@@ 默认服务器 ", var_41_2)

		if var_41_2 and string.len(var_41_2) ~= 0 then
			log.info("defaultServerId： ", var_41_2)

			for iter_41_2, iter_41_3 in pairs(var_1_0.serverList) do
				showTable(iter_41_3)

				if iter_41_3.serverId == var_41_2 then
					loginData.selectedServer = iter_41_3

					break
				end
			end
		else
			log.info("@@ 查找推荐服务器")

			local var_41_3 = {}

			for iter_41_4, iter_41_5 in pairs(var_1_0.serverList) do
				if iter_41_5.statusValue == 2 then
					table.insert(var_41_3, iter_41_5)
				end
			end

			local var_41_4 = #var_41_3

			if var_41_4 > 0 then
				math.randomseed(os.time())

				local var_41_5 = math.random(1, var_41_4)

				loginData.selectedServer = var_41_3[var_41_5]

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

	function var_1_0.checkServerState(arg_42_0)
		if arg_42_0.statusValue == 0 then
			messageBox.alert(language.get(10003), language.get(211020, arg_42_0.onlineDate))

			return false
		elseif arg_42_0.statusValue == 4 then
			messageBox.alert(language.get(10003), language.get(211021))

			return false
		elseif arg_42_0.statusValue == -1 then
			messageBox.alert(language.get(10003), string.format("%s", arg_42_0.msg))

			return false
		end

		return true
	end

	function var_1_0.changePassword(arg_43_0, arg_43_1, arg_43_2)
		channelMgr.changePassword(arg_43_0, arg_43_1, arg_43_2)
	end

	function var_1_0.gotoFBLink()
		CCApplication:sharedApplication():openURL("https://www.facebook.com/k3game")
	end

	return var_1_0
end
