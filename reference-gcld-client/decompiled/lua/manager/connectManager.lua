require("lua/component/messageBox")
require("lua/common/tool")

local var_0_0 = require("lua/common/json")

MAX_CONNECT_COUNT = 60
connectStatus = {}
connectStatus.unConnect = 1
connectStatus.connected = 2
connectStatus.disconnected = 3
connectMode = {}
connectMode.tcp = 1
connectMode.http = 2
cmgr = cmgr or {}
cmgr.responseCallFunc = {}
cmgr.reqeuestFunc = {}
cmgr.connectTime = 0
cmgr.stack = {}
cmgr.protocolRecordMap = {}
cmgr.protocolLastClearTime = os.time()

function cmgr.isSkipSend(arg_1_0)
	if arg_1_0 == nil then
		return true
	end

	local var_1_0 = cmgr.protocolRecordMap[arg_1_0]
	local var_1_1 = os.time()

	if var_1_0 == var_1_1 then
		log.info("skip send protocol:", arg_1_0)

		return true
	end

	cmgr.protocolRecordMap[arg_1_0] = var_1_1

	return false
end

function cmgr.checkProtocolTime()
	if os.time() - cmgr.protocolLastClearTime > 60 then
		cmgr.protocolLastClearTime = os.time()
	end
end

function cmgr.init()
	cmgr.clientConnect = nil
	cmgr.serverAddress = nil
	cmgr.serverPort = nil
	cmgr.httpAddress = nil
	cmgr.host = nil
	cmgr.canUseHttp = true
	cmgr.clientSocket = nil
	cmgr.httpRequest = nil
	cmgr.connectMode = cmgr.connectMode or connectMode.tcp
	cmgr.connectStatus = connectStatus.unConnect
	cmgr.connectCount = 0
	cmgr.reconnectCount = 0
	cmgr.gameOver = false
	cmgr.timer = nil
	cmgr.modal = {
		packetId = 0,
		enable = false
	}

	return true
end

function cmgr.connectTcpFailed()
	local var_4_0 = string.format(conf.address, "TCP", 0, "tcp connect failed")

	local function var_4_1(arg_5_0)
		return
	end

	CCHttpClient:createHTTPRequestLua(var_4_1, var_4_0, kCCHTTPRequestMethodGET)
end

function cmgr.connect()
	if not cmgr.serverAddress or not cmgr.serverPort or not cmgr.httpAddress then
		messageBox.alert(language.get(300001), language.get(300002))

		return false
	end

	log.info("server address:", cmgr.serverAddress)
	log.info("server port:", cmgr.serverPort)
	log.info("server url:", cmgr.httpAddress)
	log.info("server host:", cmgr.host)

	cmgr.clientConnect = ClientConnect:create()

	if not cmgr.clientConnect then
		messageBox.alert(language.get(300001), language.get(300003))

		return false
	end

	cmgr.connectCount = cmgr.connectCount + 1
	cmgr.connectStatus = connectStatus.connected

	cmgr.start()

	local var_6_0 = false

	if cmgr.connectMode == connectMode.tcp then
		log.info("@@ 建立tcp连接")

		var_6_0 = cmgr.clientConnect:connectTcp(cmgr.serverAddress, cmgr.serverPort, cmgr.onEvent)

		if not var_6_0 then
			cmgr.connectTcpFailed()
		end
	elseif cmgr.connectMode == connectMode.http then
		log.info("@@ 建立http长连接")

		var_6_0 = cmgr.clientConnect:connectHttp(cmgr.httpAddress .. "gateway.action?command=longhttp", cmgr.host, cmgr.onEvent)
	end

	if not var_6_0 then
		if cmgr.connectCount == 2 and cmgr.connectMode == connectMode.http then
			messageBox.alert(language.get(300001), language.get(300004))
		else
			cmgr.onDisconnected()
		end

		return false
	elseif channelMgr.reconnecting == false and cmgr.connectCount > 1 and user and user.sessionId then
		if not cmgr.lastTs then
			cmgr.lastTs = string.format("%d", 9569378)
		end

		local var_6_1 = cmgr.getExt()
		local var_6_2 = var_6_1.ts

		local function var_6_3(arg_7_0)
			log.info("@@@ 重连成功")

			cmgr.reconnectCount = 0
			cmgr.obkey = arg_7_0.action.data.ext
			cmgr.lastTs = var_6_2
		end

		log.info("user.sessionId:", user.sessionId)
		cmgr.sendRequestWithoutModal(var_6_3, actions.reconnect, user.sessionId, var_6_1.ts, var_6_1.sign)

		local var_6_4
	end

	return true
end

function cmgr.getExt()
	require("lua/common/encrypt/BigInt")
	require("lua/common/encrypt/BitLibEmu")

	local var_8_0 = {
		sessionId = string.sub(user.sessionId, 1, 32),
		ext = cmgr.obkey
	}

	if not var_8_0.ext or #var_8_0.ext == 0 then
		var_8_0.ext = "0"
	end

	var_8_0.l = 250200
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

function cmgr.onEvent(arg_9_0)
	if arg_9_0.event == "disconnect" then
		log.info("@@ 失去连接 ： ", arg_9_0.error)
		cmgr.onDisconnected()
	elseif arg_9_0.event == "recv" then
		local var_9_0 = arg_9_0.response

		cmgr.handlerResponse(var_9_0)
	end
end

function cmgr.onDisconnected()
	cmgr.clearup()

	if cmgr.gameOver then
		return
	end

	if user.isLogin then
		if cmgr.reconnectCount > MAX_CONNECT_COUNT then
			smgr.showMessageLayer(language.get(300005), smgr.returnToLogin)
		else
			local var_10_0 = 1

			log.info("重连失败， %d秒后重新连接(重连次数：%d)...", var_10_0, cmgr.reconnectCount)

			cmgr.reconnectCount = cmgr.reconnectCount + 1

			local function var_10_1()
				if user and user.sessionId then
					smgr.modalTimeOutCount = 0

					channelMgr.renewSocketAndReconnect()
				end
			end

			cmgr.reconnectTimer = NewTimer(var_10_0, var_10_1, event)
		end
	elseif cmgr.connectMode == connectMode.tcp and cmgr.canUseHttp then
		log.info("切换到http")

		cmgr.connectMode = connectMode.http

		cmgr.connect()
	else
		messageBox.alert(language.get(300001), language.get(300007))
	end
end

function cmgr.start()
	log.info("@@ start update connect manager")

	cmgr.handlerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(cmgr.update, 0, false)

	eventManager.registerEvent("Disconnect", cmgr.disconnectFromServer)
end

function cmgr.disconnectFromServer()
	cmgr.gameOver = true

	cmgr.clearup()
end

function cmgr.clearup()
	log.info("@@ clear up connect manager")

	if cmgr.timer then
		cmgr.timer:over()

		cmgr.timer = nil
	end

	cmgr.clientConnect:destroy()

	cmgr.connectStatus = connectStatus.disconnected

	eventManager.unregisterEvent("Disconnect", cmgr.disconnectFromServer)

	if cmgr.handlerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(cmgr.handlerEntry)

		cmgr.handlerEntry = nil
	end
end

function cmgr.isConnected()
	return cmgr.connectStatus == connectStatus.connected
end

function cmgr.registerResponseHandler(arg_16_0, arg_16_1)
	if arg_16_0 == nil then
		tool.traceback()
		messageBox.error(language.get(300008))
	end

	if arg_16_1 == nil then
		tool.traceback()
		messageBox.error(language.get(300011, arg_16_0.name))
	end

	if cmgr.responseCallFunc[arg_16_0.name] == nil then
		cmgr.responseCallFunc[arg_16_0.name] = {}
	end

	table.insert(cmgr.responseCallFunc[arg_16_0.name], arg_16_1)
end

function cmgr.unregisterResponseHandler(arg_17_0, arg_17_1)
	if arg_17_0 == nil then
		tool.traceback()
	end

	for iter_17_0, iter_17_1 in pairs(cmgr.responseCallFunc[arg_17_0.name]) do
		if iter_17_1 == arg_17_1 then
			table.remove(cmgr.responseCallFunc[arg_17_0.name], iter_17_0)
		end
	end
end

function cmgr.sendTcpReqest(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = cmgr.clientConnect:sendTcp(arg_18_1.name, arg_18_2)

	cmgr.reqeuestFunc[var_18_0] = {
		action = arg_18_1.name,
		callback = arg_18_0
	}

	return var_18_0
end

function cmgr.sendTcpReqestWithErrorHandler(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	log.info("[send]", arg_19_2.name, arg_19_3)

	local var_19_0 = cmgr.clientConnect:sendTcp(arg_19_2.name, arg_19_3)

	cmgr.reqeuestFunc[var_19_0] = {
		action = arg_19_2.name,
		callback = arg_19_0,
		errorHandler = arg_19_1
	}

	return var_19_0
end

function cmgr.sendHttpReqest(arg_20_0, arg_20_1, arg_20_2)
	local function var_20_0(arg_21_0)
		smgr.hideModal()

		local var_21_0 = arg_21_0.name == "completed"
		local var_21_1 = arg_21_0.request

		if not var_21_1 then
			return
		end

		if not var_21_0 then
			return
		end

		if var_21_1:getResponseStatusCode() ~= 200 then
			return
		end

		if arg_20_1 == actions.getPlayerInfo then
			log.info("@@ 登录后建立长连接")
			cmgr.clientConnect:connectHttp(cmgr.httpAddress .. "gateway.action?command=longhttp", cmgr.host, cmgr.onEvent)
		end

		local var_21_2 = var_0_0.decode(var_21_1:getResponse())

		if var_21_2 == nil then
			log.info("@@@@@@\n", var_21_1:getResponse())
		end

		if var_21_2.action.state == 1 or cmd == actions.getAssembleGeneral.name or cmd == actions.getTryInfo.name then
			if arg_20_0 then
				arg_20_0(var_21_2)
			end
		else
			if var_21_2.action.state == 0 then
				smgr.showTipText(var_21_2.action.data.msg)
			end

			if var_21_2.action.state == 4 then
				smgr.showMessageLayer(var_21_2.action.data.msg, smgr.returnToLogin)
			end
		end
	end

	local var_20_1 = cmgr.httpAddress .. "gateway.action?command=" .. arg_20_1.name
	local var_20_2 = CCHttpClient:createHttpRequestWithoutStart(var_20_0, var_20_1, kCCHTTPRequestMethodPOST)

	var_20_2:setPOSTData(arg_20_2)
	var_20_2:addRequestHeader(cmgr.host)
	var_20_2:start()
	smgr.showModal()
end

function cmgr.sendHttpReqestWithConf(arg_22_0, arg_22_1, arg_22_2, ...)
	local function var_22_0(arg_23_0)
		smgr.hideModal()

		local var_23_0 = arg_23_0.name == "completed"
		local var_23_1 = arg_23_0.request

		if not var_23_1 then
			return
		end

		if not var_23_0 then
			return
		end

		if var_23_1:getResponseStatusCode() ~= 200 then
			return
		end

		local var_23_2 = var_0_0.decode(var_23_1:getResponse())

		if var_23_2 == nil then
			log.info("@@@@@@\n", var_23_1:getResponse())
		else
			showTable(var_23_2)
		end

		if var_23_2.action.state == 1 then
			if arg_22_1 then
				arg_22_1(var_23_2)
			end
		else
			if var_23_2.action.state == 0 then
				smgr.showTipText(var_23_2.action.data.msg)
			end

			if var_23_2.action.state == 4 then
				smgr.showMessageLayer(var_23_2.action.data.msg, smgr.returnToLogin)
			end
		end
	end

	local var_22_1 = arg_22_0.httpAddress .. "gateway.action?command=" .. arg_22_2.name

	log.info("[http][send] %s", var_22_1, string.format(arg_22_2.args, ...))

	local var_22_2 = CCHttpClient:createHttpRequestWithoutStart(var_22_0, var_22_1, kCCHTTPRequestMethodPOST)

	var_22_2:setPOSTData(string.format(arg_22_2.args, ...))
	var_22_2:addRequestHeader(arg_22_0.host)
	var_22_2:start()
	smgr.showModal()
end

cmgr.continuousRequestStates = {
	ONGOING = 2,
	CANCELED = 3,
	WAIT_FOR_TRIGGER = 1
}
cmgr.continuousRequestLimit = 0

function cmgr.setContinuousRequestLimit(arg_24_0)
	arg_24_0 = tonumber(arg_24_0)
	cmgr.continuousRequestLimit = arg_24_0
end

function cmgr.sendContinuousRequest(arg_25_0, arg_25_1, arg_25_2, arg_25_3, ...)
	if smgr.continuousRequestActionNode and not tolua.isnull(smgr.continuousRequestActionNode) then
		smgr.continuousRequestActionNode:removeFromParentAndCleanup(true)
	end

	local var_25_0 = CCNode:create()

	smgr.rootLayer:addChild(var_25_0)

	smgr.continuousRequestActionNode = var_25_0

	smgr.continuousRequestActionNode:stopAllActions()

	local var_25_1
	local var_25_2 = {
		...
	}
	local var_25_3 = var_25_2[1]
	local var_25_4 = 190092
	local var_25_5 = user.chargeItems.jiebingGold.cost

	if tonumber(var_25_3) == 10 then
		cmgr.countDown = 10
		cmgr.countPlus = 10
		var_25_4 = "190092_TJXS"
		var_25_5 = var_25_5 * var_25_3
	else
		cmgr.countDown = 1
		cmgr.countPlus = 1
	end

	local function var_25_6(arg_26_0)
		if arg_25_2 then
			arg_25_2(arg_26_0)
		end

		if cmgr.continuousRequestState == cmgr.continuousRequestStates.ONGOING then
			performWithDelay(smgr.continuousRequestActionNode, function()
				cmgr.countDown = cmgr.countDown + cmgr.countPlus

				if cmgr.continuousRequestLimit > 0 and cmgr.countDown > cmgr.continuousRequestLimit then
					cmgr.stopContinuousRequest()

					return
				end

				if cmgr.countDownLabel and not tolua.isnull(cmgr.countDownLabel) then
					cmgr.countDownLabel:setString(cmgr.countDown)

					if cmgr.countDownLabel.scaleActionHandler then
						cmgr.countDownLabel:stopAction(cmgr.countDownLabel.scaleActionHandler)

						cmgr.countDownLabel.scaleActionHandler = nil

						cmgr.countDownLabel:setScale(1)
					end

					local var_27_0 = {
						name = "sequence",
						actions = {
							{
								duration = 0.1,
								name = "scaleTo",
								scale = 1.1
							},
							{
								duration = 0.1,
								name = "scaleTo",
								scale = 1
							}
						}
					}
					local var_27_1 = tool.loadActionByTable(var_27_0)

					cmgr.countDownLabel.scaleActionHandler = cmgr.countDownLabel:runAction(var_27_1)
				end

				if cmgr.countPlus == 1 then
					if cmgr.countDown == 3 then
						arg_25_1 = arg_25_1 * 0.5
					elseif cmgr.countDown == 6 then
						arg_25_1 = arg_25_1 * 0.5
					elseif cmgr.countDown == 9 then
						arg_25_1 = arg_25_1 * 0.5
					elseif cmgr.countDown == 12 then
						arg_25_1 = arg_25_1 * 0.5
					end
				elseif cmgr.countPlus == 1 then
					if cmgr.countDown == 20 then
						arg_25_1 = arg_25_1 * 0.5
					elseif cmgr.countDown == 30 then
						arg_25_1 = arg_25_1 * 0.5
					elseif cmgr.countDown == 50 then
						arg_25_1 = arg_25_1 * 0.5
					elseif cmgr.countDown == 70 then
						arg_25_1 = arg_25_1 * 0.5
					end
				end

				if cmgr.continuousRequestState == cmgr.continuousRequestStates.ONGOING then
					if tonumber(var_25_2[3]) ~= 0 then
						if user.chargeItems.jiebingGold.noDisturb == true or cmgr.freePhantomCount > 0 then
							cmgr.sendRequestWithoutModal(var_25_6, arg_25_3, unpack(var_25_2))
						else
							messageBox.showChargeWin(language.get(190080), language.get(var_25_4, var_25_5), "jiebingGold", function()
								eventManager.dispatchEvent("singleGeneralBattleJieingOnce", var_25_3, var_25_2[3])
							end)

							if not tolua.isnull(cmgr.generalJiebingMask) then
								cmgr.generalJiebingMask:removeFromParentAndCleanup(true)

								cmgr.generalJiebingMask = nil
							end
						end
					else
						cmgr.sendRequestWithoutModal(var_25_6, arg_25_3, unpack(var_25_2))
					end
				elseif cmgr.countDownLabel and not tolua.isnull(cmgr.countDownLabel) then
					performWithDelay(cmgr.countDownLabel, function()
						cmgr.countDownLabel:removeFromParentAndCleanup(true)

						cmgr.countDownLabel = nil
					end, 1)
				end
			end, arg_25_1)
		end
	end

	if cmgr.countDownLabel and not tolua.isnull(cmgr.countDownLabel) then
		cmgr.countDownLabel:removeFromParentAndCleanup(true)

		cmgr.countDownLabel = nil
	end

	cmgr.continuousRequestState = cmgr.continuousRequestStates.WAIT_FOR_TRIGGER

	performWithDelay(smgr.continuousRequestActionNode, function()
		if cmgr.continuousRequestState == cmgr.continuousRequestStates.CANCELED then
			return
		end

		if cmgr.countDownLabel == nil and not tolua.isnull(arg_25_0) then
			cmgr.countDownLabel = CCLabelAtlas:create(tostring(cmgr.countDown), "ui/common/number/get_numb.png", 29, 33, 48)

			cmgr.countDownLabel:setAnchorPoint(ccp(0.5, 0.5))

			local var_30_0 = arg_25_0:getContentSize()
			local var_30_1 = arg_25_0:getScale()
			local var_30_2, var_30_3 = tool.getPositionInScreen(arg_25_0)

			if arg_25_0.customLayerContentSize then
				var_30_0 = arg_25_0.customLayerContentSize
				var_30_3 = var_30_3 + var_30_0.height / 2
			end

			log.info("nodeScreenPosX:", var_30_2, "nodeScreenPosY:", var_30_3)
			cmgr.countDownLabel:setPosition(ccp(var_30_2, var_30_3 + var_30_0.height * 0.5 * var_30_1 + 20))
			smgr.getLayer("pushLayer"):addChild(cmgr.countDownLabel, 1000)
		end

		cmgr.continuousRequestState = cmgr.continuousRequestStates.ONGOING

		if tonumber(var_25_2[3]) ~= 0 then
			if user.chargeItems.jiebingGold.noDisturb == true or cmgr.freePhantomCount > 0 then
				cmgr.sendRequestWithoutModal(var_25_6, arg_25_3, unpack(var_25_2))
			else
				messageBox.showChargeWin(language.get(190080), language.get(var_25_4, var_25_5), "jiebingGold", function()
					eventManager.dispatchEvent("singleGeneralBattleJieingOnce", var_25_3, var_25_2[3])
				end)

				if not tolua.isnull(cmgr.generalJiebingMask) then
					cmgr.generalJiebingMask:removeFromParentAndCleanup(true)

					cmgr.generalJiebingMask = nil
				end
			end
		else
			cmgr.sendRequestWithoutModal(var_25_6, arg_25_3, unpack(var_25_2))
		end
	end, 1)
end

function cmgr.stopContinuousRequest()
	log.info("结束")

	cmgr.continuousRequestState = cmgr.continuousRequestStates.CANCELED

	cmgr.setContinuousRequestLimit(0)

	if smgr.continuousRequestActionNode and not tolua.isnull(smgr.continuousRequestActionNode) then
		smgr.continuousRequestActionNode:stopAllActions()

		smgr.continuousRequestActionNode = nil
	end

	if cmgr.countDownLabel and not tolua.isnull(cmgr.countDownLabel) then
		performWithDelay(cmgr.countDownLabel, function()
			cmgr.countDownLabel:removeFromParentAndCleanup(true)

			cmgr.countDownLabel = nil
			cmgr.countDown = 0
			cmgr.countPlus = nil
		end, 1)
	end
end

function cmgr.sendRequest(arg_34_0, arg_34_1, ...)
	if cmgr.connectStatus == connectStatus.connected then
		if arg_34_1 then
			local var_34_0 = {}

			for iter_34_0 = 1, select("#", ...) do
				local var_34_1 = select(iter_34_0, ...)

				if var_34_1 == nil then
					var_34_1 = ""
				elseif type(var_34_1) == "boolean" then
					var_34_1 = tostring(var_34_1)
				end

				var_34_0[iter_34_0] = var_34_1
			end

			local var_34_2 = string.format(arg_34_1.args, unpack(var_34_0))

			if arg_34_1.extraCheck == "1" then
				cmgr.checkProtocolTime()

				local var_34_3 = string.format("%s:%s", arg_34_1.name, var_34_2)

				if cmgr.isSkipSend(var_34_3) then
					local function var_34_4(arg_35_0)
						log.info("## warning: ", var_34_3)
					end

					local var_34_5 = statMgr.uuid or 0
					local var_34_6 = statMgr.channel or ChannelManager:getInstance():getChannelId()
					local var_34_7 = string.format("%swarning?%s&%s&%s", conf.address, var_34_5, var_34_6, var_34_3)

					CCHttpClient:createHTTPRequestLua(var_34_4, var_34_7, kCCHTTPRequestMethodGET)

					return
				end
			end

			if cmgr.connectMode == connectMode.tcp then
				local var_34_8 = -1
				local var_34_9 = cmgr.sendTcpReqest(arg_34_0, arg_34_1, var_34_2)

				log.info(string.format("[send][%s] => ", var_34_9), arg_34_1.name, ...)

				if var_34_9 ~= -1 then
					local var_34_10 = user.player.playerId or 0
					local var_34_11 = user.player.userId or 0
					local var_34_12 = user.serverId or 0
					local var_34_13 = "[uid: " .. var_34_11 .. "][sid: " .. var_34_12 .. "][pid: " .. var_34_10 .. "][action: " .. arg_34_1.name .. "]"

					cmgr.modal.enable = true
					cmgr.modal.packetId = var_34_9

					smgr.showModal(5, var_34_13)
				end
			else
				cmgr.sendHttpReqest(arg_34_0, arg_34_1, var_34_2)
			end
		end
	elseif conf.language == "cn" then
		smgr.showTipText(language.get(300009))
	end
end

function cmgr.sendRequestWithErrorHandler(arg_36_0, arg_36_1, arg_36_2, ...)
	if cmgr.connectStatus == connectStatus.connected then
		if arg_36_2 then
			local var_36_0 = string.format(arg_36_2.args, ...)

			if cmgr.connectMode == connectMode.tcp then
				local var_36_1 = -1
				local var_36_2 = cmgr.sendTcpReqestWithErrorHandler(arg_36_0, arg_36_1, arg_36_2, var_36_0)

				if var_36_2 ~= -1 then
					cmgr.modal.enable = true
					cmgr.modal.packetId = var_36_2

					smgr.showModal()
				end
			else
				cmgr.sendHttpReqest(arg_36_0, arg_36_2, var_36_0)
			end
		end
	else
		smgr.showTipText(language.get(300009))
	end
end

function cmgr.sendRequestWithoutModal(arg_37_0, arg_37_1, ...)
	if cmgr.connectStatus == connectStatus.connected then
		if arg_37_1 then
			local var_37_0 = string.format(arg_37_1.args, ...)

			if cmgr.connectMode == connectMode.tcp then
				cmgr.sendTcpReqest(arg_37_0, arg_37_1, var_37_0)
			else
				cmgr.sendHttpReqest(arg_37_0, arg_37_1, var_37_0)
			end
		end
	elseif conf.language == "cn" then
		smgr.showTipText(language.get(300009))
	end
end

function cmgr.handlerConnect(arg_38_0)
	return
end

function cmgr.update(arg_39_0)
	if cmgr.connectStatus == connectStatus.connected and user and user.isLogin and user.player.pkey then
		cmgr.connectTime = cmgr.connectTime - arg_39_0

		if cmgr.connectTime <= 0 then
			cmgr.connectTime = conf.connectTime

			cmgr.sendRequestWithoutModal(cmgr.handlerConnect, actions.connect, user.player.pkey, PlatformHelper:getInstance():GetUDID(""), playerPkey(user.player.pkey, user.sesionId))
			cmgr.sendRequestWithoutModal(nil, actions.battleConnect)
		end
	end
end

local function var_0_1(arg_40_0, arg_40_1)
	cmgr.stack = cmgr.stack or {}

	table.insert(cmgr.stack, 1, arg_40_0)

	if arg_40_1 < #cmgr.stack then
		table.remove(cmgr.stack, #cmgr.stack)
	end
end

function cmgr.handlerResponse(arg_41_0)
	local var_41_0 = arg_41_0:GetUncompressBoy()
	local var_41_1 = arg_41_0:GetCommand()
	local var_41_2 = arg_41_0:GetRequestId()

	log.info(string.format("[recv][%s]", var_41_2), var_41_1)

	if cmgr.modal.enable and cmgr.modal.packetId == var_41_2 then
		cmgr.modal.enable = false

		smgr.hideModal()
	end

	var_0_1(var_41_1 .. ":" .. var_41_0, 5)

	local var_41_3 = var_0_0.decode(var_41_0)

	if not var_41_3 then
		log.info("cmd:", var_41_1)
		log.info(string.format("data[%s]:%s", string.len(var_41_0), var_41_0))
	end

	if var_41_3.action.state == 3 then
		local var_41_4 = false

		for iter_41_0, iter_41_1 in pairs(cmgr.responseCallFunc) do
			if var_41_1 == iter_41_0 and table.getn(iter_41_1) > 0 then
				for iter_41_2, iter_41_3 in pairs(iter_41_1) do
					if iter_41_3 then
						iter_41_3(var_41_3)

						local var_41_5 = true
					end
				end
			end
		end
	elseif var_41_3.action.state == 1 or var_41_1 == actions.getAssembleGeneral.name or var_41_1 == actions.getTryInfo.name or var_41_1 == actions.autoMoveInfo.name or var_41_1 == actions.autoMove.name or var_41_1 == actions.kfzbViewBattle.name or var_41_1 == actions.generalRecoverInfo.name or var_41_1 == actions.kfzbGetRewardInfo.name or var_41_1 == actions.getArrowTowerStaticInfo.name then
		local var_41_6 = cmgr.reqeuestFunc[var_41_2]

		if var_41_6 and var_41_6.action == var_41_1 and var_41_6.callback then
			var_41_6.callback(var_41_3)
		end

		cmgr.reqeuestFunc[var_41_2] = nil
	else
		local var_41_7 = cmgr.reqeuestFunc[var_41_2]

		if var_41_7 and var_41_7.action == var_41_1 and var_41_7.errorHandler then
			var_41_7.errorHandler(var_41_3)
		end

		cmgr.reqeuestFunc[var_41_2] = nil

		log.info("[recv state = 0]", var_41_2, var_41_1, var_41_0)

		if not var_41_3.action.data.msg then
			var_41_3.action.data.msg = "no error message"
		end

		if var_41_3.action.state == 0 then
			if language.get(300010) == var_41_3.action.data.msg then
				messageBox.createGoldWarning()
			else
				smgr.showTipText(var_41_3.action.data.msg)
				amgr.playEffect(enumAudioFile.ui_click_error, false, true)
			end
		end

		if var_41_3.action.state == 4 then
			cmgr.disconnectFromServer()
			smgr.showMessageLayer(var_41_3.action.data.msg, smgr.returnToLogin)
		end

		if var_41_3.action.state == 7 then
			messageBox.alert("", var_41_3.action.data.msg)
		end
	end
end

return cmgr
