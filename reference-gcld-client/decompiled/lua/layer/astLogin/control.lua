require("lua/common/tool")
require("lua/data/loginData")

local var_0_0 = require("lua/common/json")
local var_0_1 = require("lua/layer/astLogin/constant.lua")

astLogin = astLogin or {}
astLogin.control = astLogin.control or {}

function astLogin.control.create(arg_1_0)
	local var_1_0 = {}

	var_1_0.firstEnterGame = false
	var_1_0.hasConnect = false
	var_1_0.ticket = nil
	var_1_0.isVisitor = false
	var_1_0.user = {}
	var_1_0.user.name = ""
	var_1_0.user.pwd = ""
	var_1_0.stackPanel = {}

	function var_1_0.showRegisterView()
		arg_1_0.showRegisterView()
	end

	function var_1_0.showLoginView()
		arg_1_0.showLoginView()
	end

	function var_1_0.handlerKeyLogin(arg_4_0)
		user.isLogin = true
		user.sessionId = arg_4_0.action.data.sessionId

		smgr.changeScene(SCENE_SELECT_PLAYER)
	end

	function var_1_0.update(arg_5_0)
		if cmgr.isConnected() then
			cmgr.sendRequest(var_1_0.handlerKeyLogin, actions.keyLogin, var_1_0.ticket, platform.getFlag())

			var_1_0.hasConnect = true

			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_0.handlerUpdateEntry)
			showAstUserLoginDebug(arg_1_0, var_1_0)
		end
	end

	function var_1_0.handlerEnterGame(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1:getResponseString()
	end

	function var_1_0.startGameFailed()
		var_1_0.hasclickStart = false
	end

	function var_1_0.handleRegister(arg_8_0, arg_8_1)
		log.info("****************** ast regist result **********************")

		local var_8_0 = arg_8_1:getResponseString()

		log.info(var_8_0)

		local var_8_1 = var_0_0.decode(var_8_0)

		if var_8_1.state == 1 then
			log.info("ast regist success")
			var_1_0.login(var_1_0.user.name, var_1_0.user.pwd)
		elseif var_8_1.datas and var_8_1.datas.message then
			messageBox.error(var_8_1.datas.message)
		else
			local var_8_2 = var_0_1.server.errorMsg[var_8_1.code]

			if var_8_2 then
				messageBox.error(var_8_2)
			else
				messageBox.error("注册账号出错")
			end
		end
	end

	function var_1_0.register(arg_9_0, arg_9_1)
		log.info("******************** ast regist **************************")

		local var_9_0 = CCApplication:sharedApplication():getDeviceUniqueId()
		local var_9_1 = string.format(var_0_1.server.registerUrl, var_9_0, arg_9_0, arg_9_1)

		log.info("register url: " .. var_9_1)

		var_1_0.user.name = arg_9_0
		var_1_0.user.pwd = arg_9_1

		getHttp(var_9_1, var_1_0.handleRegister, "post")
	end

	function var_1_0.bindUser(arg_10_0, arg_10_1)
		if not loginData.fastLogin.tempPlayerId then
			messageBox.alert(language.get(10003), language.get(211009))

			return
		end

		loginData.fastLogin.bindUser = arg_10_0
		loginData.fastLogin.bindPwd = arg_10_1

		local var_10_0 = tostring(os.time())
		local var_10_1 = Utils:md5ToLua(var_10_0 .. loginData.fastLogin.tempPlayerId .. arg_10_0 .. arg_10_1 .. bindKey)
		local var_10_2 = string.lower(var_10_1)
		local var_10_3 = string.format(url.autoBind, var_10_0, loginData.fastLogin.tempPlayerId, arg_10_0, arg_10_1, var_10_2)

		getHttp(var_10_3, var_1_0.handlerUserBind, "post")
	end

	function var_1_0.handlerLogin(arg_11_0, arg_11_1)
		log.info("******************** ast login result **********************")

		local var_11_0 = arg_11_1:getResponseString()
		local var_11_1 = var_0_0.decode(var_11_0)

		log.info(var_11_0)

		if var_11_1.state ~= 1 then
			if var_11_1.datas and var_11_1.datas.message then
				messageBox.error(var_11_1.datas.message)
			else
				local var_11_2 = var_0_1.server.errorMsg[var_11_1.code]

				if var_11_2 then
					messageBox.error(var_11_2)
				else
					messageBox.error("登陆出错")
				end
			end
		else
			log.info("login success")

			local var_11_3 = var_11_1.datas

			loginData.userName = var_11_3.username

			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", true)
			CCUserDefault:sharedUserDefault():flush()

			if var_1_0.user and var_1_0.user.name == loginData.userName then
				CCUserDefault:sharedUserDefault():setStringForKey("userName", var_1_0.user.name)
				CCUserDefault:sharedUserDefault():setStringForKey("userPwd", var_1_0.user.pwd)
				CCUserDefault:sharedUserDefault():flush()
			end

			loginData.hasLoginIn = true

			local var_11_4 = {}

			var_11_4.gameId = 1001
			var_11_4.userId = var_11_1.datas.userId
			var_11_4.token = var_11_1.datas.token
			var_11_4.yx = var_11_1.datas.yxSource
			var_11_4.ts = var_11_1.datas.ts
			var_11_4.action = "login"
			var_11_4.state = 1
			var_11_4.channelId = "wp8_wpstore"

			arg_1_0:removeFromParentAndCleanup(true)
			channelMgr.listener(var_11_4)
		end
	end

	function var_1_0.login(arg_12_0, arg_12_1)
		log.info("******************** ast login **************************")

		if string.len(arg_12_0) == 0 or string.len(arg_12_1) == 0 then
			messageBox.alert(language.get(10004), language.get(211010))
		else
			local var_12_0 = string.format(var_0_1.server.loginUrl, arg_12_0, arg_12_1)

			var_1_0.user.name = arg_12_0
			var_1_0.user.pwd = arg_12_1

			getHttp(var_12_0, var_1_0.handlerLogin, "post")
		end
	end

	function var_1_0.fastStart()
		local var_13_0 = tostring(os.time())
		local var_13_1 = var_13_0 .. reigsterKey
		local var_13_2 = Utils:md5ToLua(var_13_1)
		local var_13_3 = string.lower(var_13_2)
		local var_13_4 = string.format(url.autoRegister, var_13_0, var_13_3)

		getHttp(var_13_4, var_1_0.onAutoRegist, "post")
	end

	function var_1_0.init(arg_14_0)
		user.init()
		loginData.init()

		local var_14_0 = CCUserDefault:sharedUserDefault():getStringForKey("userName")
		local var_14_1 = CCUserDefault:sharedUserDefault():getStringForKey("userPwd")

		var_1_0.user.name = var_14_0
		var_1_0.user.pwd = var_14_1
	end

	return var_1_0
end
