require("lua/common/tool")
require("lua/data/loginData")
require("lua/layer/loginDebug/constant")
require("lua/layer/loginDebug/astUserLogin")
require("lua/layer/loginDebug/astUserRegister")
require("lua/layer/loginDebug/firstEnterGame")
require("lua/layer/loginDebug/startGame")
require("lua/layer/loginDebug/selectServer")

local var_0_0 = require("lua/common/json")
local var_0_1 = "http://42.62.60.31/"

function createLoginDebugControl(arg_1_0)
	local var_1_0 = {}

	var_1_0.firstEnterGame = false
	var_1_0.hasConnect = false
	var_1_0.ticket = nil
	var_1_0.isVisitor = false
	var_1_0.user = {}
	var_1_0.user.name = ""
	var_1_0.user.pwd = ""
	var_1_0.stackPanel = {}

	function var_1_0.changeUi(arg_2_0)
		if var_1_0.stackPanel[#var_1_0.stackPanel] == arg_2_0 then
			return
		end

		table.insert(var_1_0.stackPanel, arg_2_0)
	end

	function var_1_0.connect()
		if cmgr.init() then
			cmgr.serverAddress = conf.serverAddress
			cmgr.serverPort = conf.serverPort
			cmgr.httpAddress = conf.httpAddress

			cmgr.connect()
		end

		if cmgr.isConnected() then
			var_1_0:check()
		end
	end

	function var_1_0.returnToLast()
		table.remove(var_1_0.stackPanel)

		local var_4_0 = var_1_0.stackPanel[#var_1_0.stackPanel]

		if var_4_0 == "login" then
			showAstUserLoginDebug(arg_1_0, var_1_0)
		elseif var_4_0 == "register" then
			showAstUserRegisterDebug(arg_1_0, var_1_0)
		elseif var_4_0 == "first" then
			showDebugFirstEnterGame(arg_1_0, var_1_0)
		elseif var_4_0 == "select" then
			showDebugSelectServer(arg_1_0, var_1_0)
		elseif var_4_0 == "startNorml" then
			showDebugStartGame(arg_1_0, var_1_0)
		end
	end

	function var_1_0.returnToStart()
		showDebugFirstEnterGame(arg_1_0, var_1_0)
	end

	function var_1_0.handlerKeyLogin(arg_6_0)
		user.isLogin = true
		user.sessionId = arg_6_0.action.data.sessionId

		smgr.changeScene(SCENE_SELECT_PLAYER)
	end

	function var_1_0.update(arg_7_0)
		if cmgr.isConnected() then
			cmgr.sendRequest(var_1_0.handlerKeyLogin, actions.keyLogin, var_1_0.ticket, platform.getFlag())

			var_1_0.hasConnect = true

			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_0.handlerUpdateEntry)
			showAstUserLoginDebug(arg_1_0, var_1_0)
		end
	end

	function var_1_0.handlerEnterGame(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1:getResponseString()
	end

	function var_1_0.startGameFaild()
		var_1_0.hasclickStart = false
	end

	function var_1_0.goToRegister()
		showAstUserRegisterDebug(arg_1_0, var_1_0)
	end

	local function var_1_1(arg_11_0)
		if arg_11_0.action.state == 1 then
			require("lua/component/messageBox")
			messageBox.alert("", "注册成功")
			showAstUserLoginDebug(arg_1_0, var_1_0)
		end
	end

	function var_1_0.register(arg_12_0, arg_12_1)
		var_1_0.user.name = arg_12_0
		var_1_0.user.pwd = arg_12_1

		cmgr.sendRequest(var_1_1, actions.createUser, arg_12_0, arg_12_1)
	end

	function var_1_0.bindUser(arg_13_0, arg_13_1)
		if not loginData.fastLogin.tempPlayerId then
			messageBox.alert(language.get(10003), language.get(211009))

			return
		end

		loginData.fastLogin.bindUser = arg_13_0
		loginData.fastLogin.bindPwd = arg_13_1

		local var_13_0 = tostring(os.time())
		local var_13_1 = Utils:md5ToLua(var_13_0 .. loginData.fastLogin.tempPlayerId .. arg_13_0 .. arg_13_1 .. bindKey)
		local var_13_2 = string.lower(var_13_1)
		local var_13_3 = string.format(url.autoBind, var_13_0, loginData.fastLogin.tempPlayerId, arg_13_0, arg_13_1, var_13_2)

		getHttp(var_13_3, var_1_0.handlerUserBind, "post")
	end

	function var_1_0.handlerLoginWeb(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_1:getResponseString()
		local var_14_1 = var_0_0.decode(var_14_0)

		if var_14_1.state ~= 1 then
			messageBox.alert(language.get(211007), var_14_1.msg)
		else
			loginData.userName = var_14_1.playerid
			loginData.gamehistory = var_14_1.gamehistory
			loginData.gameservers = var_14_1.gameservers
			loginData.newestserver = var_14_1.newestserver

			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)

			if var_1_0.user and var_1_0.user.name == loginData.userName then
				CCUserDefault:sharedUserDefault():setStringForKey("userName", var_1_0.user.name)
				CCUserDefault:sharedUserDefault():setStringForKey("userPwd", var_1_0.user.pwd)
			end

			if table.getn(loginData.gamehistory) > 0 then
				loginData.selectedServer = loginData.gamehistory[1]
			elseif table.getn(loginData.newestserver) > 0 then
				loginData.selectedServer = loginData.newestserver[1]
			elseif table.getn(loginData.gameservers) > 0 then
				loginData.selectedServer = loginData.gameservers[1]
			end

			loginData.hasLoginInWeb = true

			showDebugStartGame(arg_1_0, var_1_0)
		end
	end

	function var_1_0.handlerLoginAction(arg_15_0)
		if arg_15_0.action.state == 1 then
			CCUserDefault:sharedUserDefault():setStringForKey("userName", var_1_0.user.name)
			CCUserDefault:sharedUserDefault():setStringForKey("userPwd", var_1_0.user.pwd)

			user.isLogin = true
			user.sessionId = arg_15_0.action.data.sessionId

			log.info("@@ 登录成功", user.sessionId)
			smgr.changeScene(SCENE_SELECT_PLAYER)
		end
	end

	function var_1_0.login(arg_16_0, arg_16_1)
		if string.len(arg_16_0) == 0 or string.len(arg_16_1) == 0 then
			messageBox.alert(language.get(10004), language.get(211010))
		else
			var_1_0.user.name = arg_16_0
			var_1_0.user.pwd = arg_16_1

			cmgr.sendRequest(var_1_0.handlerLoginAction, actions.login, arg_16_0, arg_16_1)
		end
	end

	function var_1_0.changeToBindUser()
		showAstUserBind(arg_1_0, var_1_0)
	end

	function var_1_0.changeToLogin()
		showAstUserLoginDebug(arg_1_0, var_1_0)
	end

	function var_1_0.changeToSelectServer()
		showDebugSelectServer(arg_1_0, var_1_0)
	end

	function var_1_0.returnVisitorStart()
		showStartGameForVisitor(arg_1_0, var_1_0)
	end

	function var_1_0.handlerConfigFile(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_1:getResponseString()
		local var_21_1 = Utils:getAttributeByKeyFromXml(var_21_0, "socketServiceUrl", "value")
		local var_21_2 = Utils:getAttributeByKeyFromXml(var_21_0, "httpServiceUrl", "value")
		local var_21_3 = tool.split(var_21_1, ":")
		local var_21_4 = var_21_3[1]
		local var_21_5 = tonumber(var_21_3[2])
	end

	function var_1_0.handlerGameLogin(arg_22_0, arg_22_1)
		var_1_0.ticket = tool.readCookie(var_1_0.serverUrl, "ticket")

		log.info("@@ ticket :", var_1_0.ticket)

		local var_22_0 = var_1_0.serverUrl .. "/Config.xml"

		getHttp(var_22_0, var_1_0.handlerConfigFile, nil, var_1_0.startGameFaild)
	end

	function var_1_0.parseServerUrl(arg_23_0)
		local var_23_0 = tool.split(arg_23_0, "/")

		log.info("login url:", arg_23_0)

		if table.getn(var_23_0) > 3 then
			var_1_0.serverUrl = var_23_0[3]

			return true
		end

		return false
	end

	function var_1_0.handlerStartGame(arg_24_0, arg_24_1)
		local var_24_0 = arg_24_1:getResponseString()

		log.info("@@ 服务器名：", var_24_0)

		local var_24_1 = tool.split(var_24_0, "\"")

		if table.getn(var_24_1) == 5 then
			local var_24_2 = var_24_1[4]

			if var_1_0.parseServerUrl(var_24_2) then
				var_24_2 = var_24_2 .. "&" .. "platform=" .. platform.getFlag()

				getHttp(var_24_2, var_1_0.handlerGameLogin, nil, var_1_0.startGameFaild)
			else
				messageBox.alert(language.get(211007), language.get(211011, var_24_2))

				var_1_0.hasclickStart = false
			end
		else
			messageBox.alert(language.get(211007), language.get(211012))

			var_1_0.hasclickStart = false
		end
	end

	function var_1_0.startGame()
		log.info("== 开始游戏 == ")

		if not var_1_0.hasclickStart then
			if loginData.selectedServer then
				var_1_0.hasclickStart = true

				getHttp(loginData.selectedServer.gameurl, var_1_0.handlerStartGame, nil, var_1_0.startGameFaild)
			elseif loginData.fastLogin.gameUrl then
				var_1_0.hasclickStart = true

				getHttp(loginData.fastLogin.gameUrl, var_1_0.handlerStartGame, nil, var_1_0.startGameFaild)
			else
				messageBox.alert(language.get(211007), language.get(211013))
			end
		end
	end

	function var_1_0.choiceServer(arg_26_0)
		if arg_26_0 then
			loginData.selectedServer = arg_26_0

			showDebugStartGame(arg_1_0, var_1_0)
		end
	end

	function var_1_0.onAutoLogin(arg_27_0, arg_27_1)
		local var_27_0 = arg_27_1:getResponseString()

		log.info(var_27_0)

		local var_27_1 = var_0_0.decode(var_27_0)

		if var_27_0 and string.len(var_27_0) > 0 then
			if var_27_1.state and var_27_1.state == 1 then
				CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
				CCUserDefault:sharedUserDefault():setBoolForKey("playerIsVisitor", true)
				CCUserDefault:sharedUserDefault():setStringForKey("visitorId", var_27_1.tempPlayerID)

				loginData.fastLogin.gameUrl = var_27_1.gameUrl
				loginData.fastLogin.serverName = var_27_1.serverName
				loginData.fastLogin.tempPlayerId = var_27_1.tempPlayerID
				loginData.hasLoginInWeb = true

				if var_1_0.firstEnterGame then
					var_1_0.startGame()
				end
			else
				messageBox.alert("error", var_27_1.msg)
			end
		end
	end

	function var_1_0.visitorLogin(arg_28_0)
		local var_28_0 = tostring(os.time())
		local var_28_1 = Utils:md5ToLua(var_28_0 .. arg_28_0 .. loginKey)
		local var_28_2 = string.lower(var_28_1)
		local var_28_3 = string.format(url.autoLogin, var_28_0, arg_28_0, var_28_2)

		getHttp(var_28_3, var_1_0.onAutoLogin, "post")
	end

	function var_1_0.onAutoRegist(arg_29_0, arg_29_1)
		local var_29_0 = arg_29_1:getResponseString()

		if var_29_0 and string.len(var_29_0) > 0 then
			local var_29_1 = var_0_0.decode(var_29_0)

			if var_29_1.state and var_29_1.state == 1 then
				log.info("@@ 自动注册成功")
				var_1_0.visitorLogin(var_29_1.tempPlayerID)
			else
				messageBox.alert("error", var_29_1.msg)
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
		log.info("@@ 傲视堂帐号登录")

		if var_1_0.addressField and var_1_0.addressField:getText() ~= "" then
			local var_31_0 = var_1_0.addressField:getText()
			local var_31_1 = stringSplit(var_31_0, ":")

			if #var_31_1 == 2 then
				local var_31_2 = var_31_1[1]
				local var_31_3 = var_31_1[2]
				local var_31_4
				local var_31_5
				local var_31_6, var_31_7 = string.find(var_31_2, "^%d+%.%d+%.%d+%.%d+")

				if var_31_6 and var_31_7 then
					var_31_4 = string.sub(var_31_2, var_31_6, var_31_7)
				end

				local var_31_8, var_31_9 = string.find(var_31_3, "^%d+")

				if var_31_8 and var_31_9 then
					var_31_5 = string.sub(var_31_3, var_31_8, var_31_9)
				end

				if var_31_4 and var_31_5 then
					conf.serverAddress = var_31_4
					conf.serverPort = var_31_5
					var_1_0.hasConnect = false

					CCUserDefault:sharedUserDefault():setStringForKey("address", var_31_0)
					CCUserDefault:sharedUserDefault():flush()
				end
			end
		end

		if not var_1_0.hasConnect then
			var_1_0.connect()

			var_1_0.hasConnect = true

			local function var_31_10()
				var_1_0.hasConnect = false
			end

			NewTimer(3, var_31_10)
		end
	end

	function var_1_0.check(arg_33_0)
		local var_33_0 = CCUserDefault:sharedUserDefault():getStringForKey("userName")
		local var_33_1 = CCUserDefault:sharedUserDefault():getStringForKey("userPwd")

		var_1_0.user.name = var_33_0
		var_1_0.user.pwd = var_33_1

		showAstUserLoginDebug(arg_1_0, var_1_0)
	end

	function var_1_0.init(arg_34_0)
		user.init()
		loginData.init()
		showDebugFirstEnterGame(arg_1_0, var_1_0)
	end

	return var_1_0
end
