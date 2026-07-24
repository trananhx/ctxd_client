require("lua/component/messageBox")
require("lua/common/tool")

local var_0_0 = require("lua/common/json")

kfConnectStatus = {}
kfConnectStatus.unConnect = 1
kfConnectStatus.connected = 2
kfConnectMode = {}
kfConnectMode.tcp = 1
kfConnectMode.http = 2
kfcmgr = kfcmgr or {}

function kfcmgr.create(arg_1_0, arg_1_1, arg_1_2)
	log.info("@@ 创建连接")

	kfcmgr.clientConnect = nil
	kfcmgr.ip = arg_1_0 or kfcmgr.ip
	kfcmgr.port = arg_1_1 or kfcmgr.port
	kfcmgr.url = arg_1_2 or kfcmgr.url
	kfcmgr.host = "Host:" .. kfcmgr.ip

	log.info(kfcmgr.host)

	kfcmgr.httpAddress = string.format("http://%s/root/", kfcmgr.ip)
	kfcmgr.connectMode = kfcmgr.connectMode or kfConnectMode.tcp
	kfcmgr.connectStatus = kfConnectStatus.unConnect
	kfcmgr.modal = {
		packetId = 0,
		enable = false
	}

	if not kfcmgr.ip or not kfcmgr.port or not kfcmgr.url then
		messageBox.alert(language.get(300001), language.get(300002))

		return false
	end

	log.info("kfserver address:", kfcmgr.ip)
	log.info("kfserver port:", kfcmgr.port)
	log.info("kfserver url:", kfcmgr.url)
	log.info("kfserver host:", kfcmgr.host)

	kfcmgr.ClientConnect = ClientConnect:create()

	if not kfcmgr.ClientConnect then
		messageBox.alert(language.get(300001), language.get(300003))

		return false
	end

	local var_1_0 = false

	if kfcmgr.connectMode == kfConnectMode.tcp then
		log.info("@@ kf 建立tcp连接")

		var_1_0 = kfcmgr.ClientConnect:connectTcp(kfcmgr.ip, kfcmgr.port, kfcmgr.onEvent)

		if not var_1_0 then
			kfcmgr.connectTcpFailed()
		end
	elseif kfcmgr.connectMode == kfConnectMode.http then
		log.info("@@ kf 建立http长连接")

		var_1_0 = kfcmgr.ClientConnect:connectHttp(kfcmgr.url .. "gateway.action?command=longhttp", kfcmgr.host, kfcmgr.onEvent)
	end

	if not var_1_0 then
		kfcmgr.onDisconnected()

		return false
	else
		log.info("@@ 跨服connect成功")

		kfcmgr.connectStatus = kfConnectStatus.connected

		kfcmgr.start()
	end

	return true
end

kfcmgr.responseCallFunc = {}
kfcmgr.reqeuestFunc = {}
kfcmgr.connectTime = 0
kfcmgr.reconnectCount = 0
kfcmgr.stack = {}

function kfcmgr.connectTcpFailed()
	local var_2_0 = string.format(conf.address, "TCP", 0, "kftcp connect failed")

	local function var_2_1(arg_3_0)
		return
	end

	CCHttpClient:createHTTPRequestLua(var_2_1, var_2_0, kCCHTTPRequestMethodGET)
end

function kfcmgr.onEvent(arg_4_0)
	if arg_4_0.event == "disconnect" then
		log.info("@@ 失去连接 ： ", arg_4_0.error)
		kfcmgr.onDisconnected()
	elseif arg_4_0.event == "recv" and kfcmgr.connectStatus == kfConnectStatus.connected then
		local var_4_0 = arg_4_0.response

		kfcmgr.handlerResponse(var_4_0)
	end
end

function kfcmgr.onDisconnected()
	if kfcmgr.loginIn == true then
		if kfcmgr.reconnectCount > 1 then
			local function var_5_0()
				smgr.changeScene(SCENE_MAIN_CITY)

				kfcmgr.reconnectCount = 0

				kfcmgr.clearup()
			end

			smgr.showMessageLayer(language.get(300100), var_5_0)
		else
			local var_5_1 = 3

			log.info("重连失败， %d秒后重新连接(重连次数：%d)...", var_5_1, kfcmgr.reconnectCount)

			kfcmgr.reconnectCount = kfcmgr.reconnectCount + 1

			if kfcmgr.timer then
				kfcmgr.timer:over()

				kfcmgr.timer = nil
			end

			kfcmgr.timer = NewTimer(var_5_1, kfcmgr.create, "")

			kfcmgr.clearup()
		end
	elseif kfcmgr.connectMode == connectMode.tcp then
		kfcmgr.clearup()
		log.info("切换到http")

		kfcmgr.connectMode = kfConnectMode.http

		kfcmgr.create(kfcmgr.ip, kfcmgr.port, kfcmgr.url)
	end
end

function kfcmgr.start()
	log.info("@@ start update connect manager")

	kfcmgr.handlerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(kfcmgr.update, 0, false)

	eventManager.registerEvent("kfDisconnect", kfcmgr.disconnectFromServer)
end

function kfcmgr.clearup()
	log.info("@@ clearup kf connect manager")

	if kfcmgr.ClientConnect then
		kfcmgr.ClientConnect:destroy()

		kfcmgr.ClientConnect = nil
		kfcmgr.connectStatus = kfConnectStatus.unConnect

		eventManager.unregisterEvent("kfDisconnect", kfcmgr.disconnectFromServer)
	end

	if kfcmgr.handlerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(kfcmgr.handlerEntry)

		kfcmgr.handlerEntry = nil
	end
end

function kfcmgr.disconnectFromServer()
	kfcmgr.clearup()
end

function kfcmgr.isConnected()
	return kfcmgr.connectStatus == kfConnectStatus.connected
end

function kfcmgr.registerResponseHandler(arg_11_0, arg_11_1)
	if arg_11_0 == nil then
		tool.traceback()
		messageBox.error(language.get(300008))
	end

	if arg_11_1 == nil then
		tool.traceback()
		messageBox.error(language.get(300011, arg_11_0.name))
	end

	if kfcmgr.responseCallFunc[arg_11_0.name] == nil then
		kfcmgr.responseCallFunc[arg_11_0.name] = {}
	end

	table.insert(kfcmgr.responseCallFunc[arg_11_0.name], arg_11_1)
end

function kfcmgr.unregisterResponseHandler(arg_12_0, arg_12_1)
	if arg_12_0 == nil then
		tool.traceback()
	end

	for iter_12_0, iter_12_1 in pairs(kfcmgr.responseCallFunc[arg_12_0.name]) do
		if iter_12_1 == arg_12_1 then
			table.remove(kfcmgr.responseCallFunc[arg_12_0.name], iter_12_0)
		end
	end
end

function kfcmgr.sendTcpReqest(arg_13_0, arg_13_1, arg_13_2)
	log.info("[kfsend]", arg_13_1.name, arg_13_2)

	local var_13_0 = kfcmgr.ClientConnect:sendTcp(arg_13_1.name, arg_13_2)

	kfcmgr.reqeuestFunc[var_13_0] = {
		action = arg_13_1.name,
		callback = arg_13_0
	}

	return var_13_0
end

function kfcmgr.sendHttpReqest(arg_14_0, arg_14_1, arg_14_2)
	local function var_14_0(arg_15_0)
		smgr.hideModal()

		local var_15_0 = arg_15_0.name == "completed"
		local var_15_1 = arg_15_0.request

		if not var_15_1 then
			return
		end

		if not var_15_0 then
			return
		end

		if var_15_1:getResponseStatusCode() ~= 200 then
			return
		end

		if arg_14_1 == actions.getPlayerInfo then
			log.info("@@ 登录后建立长连接")
			kfcmgr.ClientConnect:connectHttp(kfcmgr.httpAddress .. "gateway.action?command=longhttp", kfcmgr.host, kfcmgr.onEvent)
		end

		local var_15_2 = var_0_0.decode(var_15_1:getResponse())

		if var_15_2 == nil then
			log.info("@@@@@@\n", var_15_1:getResponse())
		end

		if var_15_2.state == 1 or cmd == actions.getAssembleGeneral.name or cmd == actions.getTryInfo.name then
			if arg_14_0 then
				arg_14_0(var_15_2)
			end
		else
			if var_15_2.state == 0 then
				smgr.showTipText(var_15_2.msg)
			end

			if var_15_2.state == 4 then
				smgr.showMessageLayer(var_15_2.msg)
			end
		end
	end

	local var_14_1 = kfcmgr.httpAddress .. "gateway.action?command=" .. arg_14_1.name

	log.info("[http][kfsend] %s", var_14_1)

	local var_14_2 = CCHttpClient:createHttpRequestWithoutStart(var_14_0, var_14_1, kCCHTTPRequestMethodPOST)

	var_14_2:setPOSTData(arg_14_2)
	var_14_2:addRequestHeader(kfcmgr.host)
	var_14_2:start()
	smgr.showModal()
end

function kfcmgr.sendRequest(arg_16_0, arg_16_1, ...)
	if kfcmgr.connectStatus == kfConnectStatus.connected then
		if arg_16_1 then
			local var_16_0 = {}

			for iter_16_0 = 1, select("#", ...) do
				local var_16_1 = select(iter_16_0, ...)

				if var_16_1 == nil then
					var_16_1 = ""
				elseif type(var_16_1) == "boolean" then
					var_16_1 = tostring(var_16_1)
				end

				var_16_0[iter_16_0] = var_16_1
			end

			local var_16_2 = string.format(arg_16_1.args, unpack(var_16_0))

			if kfcmgr.connectMode == kfConnectMode.tcp then
				local var_16_3 = -1
				local var_16_4 = kfcmgr.sendTcpReqest(arg_16_0, arg_16_1, var_16_2)

				if var_16_4 ~= -1 then
					kfcmgr.modal.enable = true
					kfcmgr.modal.packetId = var_16_4

					smgr.showModal()
				end
			else
				kfcmgr.sendHttpReqest(arg_16_0, arg_16_1, var_16_2)
			end
		end
	else
		smgr.showTipText(language.get(300009))
	end
end

function kfcmgr.sendRequestWithoutModal(arg_17_0, arg_17_1, ...)
	if kfcmgr.connectStatus == kfConnectStatus.connected then
		if arg_17_1 then
			local var_17_0 = string.format(arg_17_1.args, ...)

			if kfcmgr.connectMode == kfConnectMode.tcp then
				kfcmgr.sendTcpReqest(arg_17_0, arg_17_1, var_17_0)
			else
				kfcmgr.sendHttpReqest(arg_17_0, arg_17_1, var_17_0)
			end
		end
	else
		smgr.showTipText(language.get(300009))
	end
end

function kfcmgr.handlerConnect(arg_18_0)
	return
end

function kfcmgr.update(arg_19_0)
	if kfcmgr.connectStatus == kfConnectStatus.connected and user and user.isLogin and user.player.pkey then
		kfcmgr.connectTime = kfcmgr.connectTime - arg_19_0

		if kfcmgr.connectTime <= 0 then
			kfcmgr.connectTime = conf.connectTime

			kfcmgr.sendRequest(kfcmgr.handlerConnect, actions.kfHeart)
		end
	end
end

local function var_0_1(arg_20_0, arg_20_1)
	kfcmgr.stack = kfcmgr.stack or {}

	table.insert(kfcmgr.stack, 1, arg_20_0)

	if arg_20_1 < #kfcmgr.stack then
		table.remove(kfcmgr.stack, #kfcmgr.stack)
	end
end

function kfcmgr.handlerResponse(arg_21_0)
	local var_21_0 = arg_21_0:GetUncompressBoy()
	local var_21_1 = arg_21_0:GetCommand()
	local var_21_2 = arg_21_0:GetRequestId()

	log.info("[kfrecv]", var_21_2, var_21_1)

	if kfcmgr.modal.enable and kfcmgr.modal.packetId == var_21_2 then
		kfcmgr.modal.enable = false

		smgr.hideModal()
	end

	var_0_1(var_21_1 .. ":" .. var_21_0, 5)
	pcall(log.writeToFile, var_21_1 .. ":" .. var_21_0)

	local var_21_3 = var_0_0.decode(var_21_0)

	if not var_21_3 then
		log.info("[kfrecv] recv error, json decode faild :", var_21_0)
	end

	if var_21_3.state == 3 then
		local var_21_4 = false

		for iter_21_0, iter_21_1 in pairs(kfcmgr.responseCallFunc) do
			if var_21_1 == iter_21_0 and table.getn(iter_21_1) > 0 then
				for iter_21_2, iter_21_3 in pairs(iter_21_1) do
					if iter_21_3 then
						iter_21_3(var_21_3)

						local var_21_5 = true
					end
				end
			end
		end
	elseif var_21_3.state == 1 or var_21_1 == actions.getCallGeneralInfo.name then
		local var_21_6 = kfcmgr.reqeuestFunc[var_21_2]

		if var_21_6 and var_21_6.action == var_21_1 and var_21_6.callback then
			var_21_6.callback(var_21_3)
		end

		kfcmgr.reqeuestFunc[var_21_2] = nil
	else
		log.info("[kfrecv state = 0]", var_21_2, var_21_1, var_21_0)

		local var_21_7 = ""

		if not var_21_3.data then
			var_21_7 = var_21_3.message
		else
			var_21_7 = var_21_3.data.msg
		end

		if var_21_3.state == 0 then
			if language.get(300010) == var_21_7 then
				messageBox.createGoldWarning()
			else
				smgr.showTipText(var_21_7)
				amgr.playEffect(enumAudioFile.ui_click_error, false, true)
			end
		end

		if var_21_3.state == 4 then
			kfcmgr.gameOver = true

			smgr.showMessageLayer(var_21_7)
		end
	end
end

function kfcmgr.loginkfzb(arg_22_0)
	log.info("@@ 登录到跨服争霸")

	if not arg_22_0 or not arg_22_0.certifacate or not arg_22_0.competitorId or not arg_22_0.matchPort then
		messageBox.alert("ERROR", language.get(390100))

		return
	end

	local function var_22_0(arg_23_0)
		log.info("@@ 登录跨服争霸服务器成功")
		log.info("@@ kfConnectManager.lua,跨服争霸")
		bmgr.enterKfzb()
	end

	log.info("@@ 连接跨服争霸")

	local var_22_1 = arg_22_0.certifacate
	local var_22_2 = arg_22_0.competitorId
	local var_22_3 = arg_22_0.matchAdress
	local var_22_4 = arg_22_0.matchPort

	kfcmgr.create(var_22_3, var_22_4, string.format("http://%s/root/", var_22_3))

	if kfcmgr.isConnected() then
		kfcmgr.sendRequest(var_22_0, actions.kfzbLogin, var_22_1, var_22_2)
	end
end

function kfcmgr.loginkfwd(arg_24_0)
	log.info("@@ 登录到跨服武斗")

	if not arg_24_0 or not arg_24_0.certifacate or not arg_24_0.completedId or not arg_24_0.matchPort then
		messageBox.alert("ERROR", language.get(390100))

		return
	end

	local function var_24_0(arg_25_0)
		log.info("@@ 登录跨服武斗服务器成功")
		bmgr.enterKfwd()
	end

	log.info("@@ 连接跨服武斗")

	local var_24_1 = arg_24_0.certifacate
	local var_24_2 = arg_24_0.completedId
	local var_24_3 = arg_24_0.matchAdress
	local var_24_4 = arg_24_0.matchPort

	kfcmgr.create(var_24_3, var_24_4, string.format("http://%s/root/", var_24_3))

	if kfcmgr.isConnected() then
		kfcmgr.sendRequest(var_24_0, actions.kfwdLogin, var_24_1, var_24_2)
	end
end

function kfcmgr.loginkfgz(arg_26_0, arg_26_1)
	log.info("@@ 连接跨服国战")
	log.info(tool.tableToJson(arg_26_0))

	local var_26_0 = arg_26_0.matchaddress
	local var_26_1 = arg_26_0.matchport
	local var_26_2 = arg_26_0.competitorId
	local var_26_3 = arg_26_0.kfgzKey
	local var_26_4 = arg_26_0.matchState
	local var_26_5 = arg_26_0.playerId
	local var_26_6 = arg_26_0.worldId
	local var_26_7 = arg_26_0.battle

	user.player.kfgzForceId = arg_26_0.forceId
	user.player.kfgzCompetitorId = var_26_2
	user.kfworldId = var_26_6

	local function var_26_8(arg_27_0)
		kfcmgr.sendRequest(function(arg_28_0)
			log.info("kf@enter")

			kfcmgr.loginIn = true

			if not arg_26_1 then
				smgr.changeScene(SCENE_KFWORLD, nil, var_26_4)
			else
				eventManager.dispatchEvent("changeMatchState", var_26_4)
			end
		end, actions.kfEnter)
	end

	if var_26_4 == 2 and var_26_0 and var_26_1 then
		kfcmgr.create(var_26_0, var_26_1, string.format("http://%s/root/", var_26_0))

		if kfcmgr.isConnected() then
			kfcmgr.sendRequest(var_26_8, actions.kfgzLogin, var_26_3, var_26_2)
		end
	else
		smgr.changeScene(SCENE_KFWORLD, nil, var_26_4)
	end
end

function kfcmgr.loginkfyz(arg_29_0)
	log.info("@@ 连接跨服远征")
	log.info(tool.tableToJson(arg_29_0))

	local var_29_0 = arg_29_0.matchaddress
	local var_29_1 = arg_29_0.matchport
	local var_29_2 = arg_29_0.competitorId
	local var_29_3 = arg_29_0.kfgzKey
	local var_29_4 = arg_29_0.matchState
	local var_29_5 = arg_29_0.playerId
	local var_29_6 = arg_29_0.worldId
	local var_29_7 = arg_29_0.battle
	local var_29_8 = arg_29_0.isInSd

	user.player.kfgzForceId = arg_29_0.forceId
	user.player.kfgzCompetitorId = var_29_2
	user.kfyzState = var_29_4
	user.isInSd = var_29_8
	user.kfyzWorldId = arg_29_0.worldId

	if (var_29_4 == 1 or var_29_4 == 2 and var_29_8) and var_29_0 and var_29_1 then
		local function var_29_9(arg_30_0)
			kfcmgr.sendRequest(function(arg_31_0)
				log.info("kf@enter")

				kfcmgr.loginIn = true

				if smgr.currentSceneTag ~= SCENE_KFYZ_WORLD then
					smgr.changeScene(SCENE_KFYZ_WORLD, var_29_4)
				else
					eventManager.dispatchEvent("changeMatchState", var_29_4)
				end
			end, actions.kfEnter)
		end

		kfcmgr.create(var_29_0, var_29_1, string.format("http://%s/root/", var_29_0))

		if kfcmgr.isConnected() then
			kfcmgr.sendRequest(var_29_9, actions.kfyzLogin, var_29_3, var_29_2)
		end
	end
end

function kfcmgr.loginkfmg(arg_32_0)
	log.info("@@ 连接跨服灭国")
	log.info(tool.tableToJson(arg_32_0))

	local var_32_0 = arg_32_0.matchaddress
	local var_32_1 = arg_32_0.matchport
	local var_32_2 = arg_32_0.competitorId
	local var_32_3 = arg_32_0.kfgzKey
	local var_32_4 = arg_32_0.matchState
	local var_32_5 = arg_32_0.playerId
	local var_32_6 = arg_32_0.worldId
	local var_32_7 = arg_32_0.battle

	user.player.kfForceId = arg_32_0.forceId
	user.player.kfyzCompetitorId = var_32_2
	user.kfyzWorldId = var_32_6
	user.player.kfCompetitorId = var_32_2

	local function var_32_8(arg_33_0)
		kfcmgr.loginIn = true
		kfcmgr.isShowFailurePanel = true

		smgr.changeScene(SCENE_KFEXPEDITION, var_32_4)
	end

	if not var_32_0 and arg_32_0.showLetter then
		messageBox.alert(language.get(300001), language.get("hw_kfmg_000038"))

		return
	end

	kfcmgr.create(var_32_0, var_32_1, string.format("http://%s/root/", var_32_0))

	if kfcmgr.isConnected() then
		kfcmgr.sendRequest(var_32_8, actions.kfmgLogin, var_32_3, var_32_2)
	end
end
