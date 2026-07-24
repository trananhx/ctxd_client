require("lua/component/messageBox")
require("lua/common/tool")
require("pack")

local var_0_0 = string.pack
local var_0_1 = string.unpack
local var_0_2 = require("lua/common/json")
local var_0_3 = require("zlib")
local var_0_4 = 60
local var_0_5 = {}

var_0_5.unConnect = 1
var_0_5.connected = 2
var_0_5.disconnected = 3

local var_0_6 = 3
local var_0_7 = {
	packetSize = {
		packetId = 4,
		head = 4,
		action = 32
	},
	responseCallFunc = {},
	reqeuestFunc = {}
}

var_0_7.connectTime = 0
var_0_7.stack = {}

function var_0_7.init(arg_1_0, arg_1_1, arg_1_2)
	var_0_7.serverAddress = arg_1_0
	var_0_7.host = arg_1_1
	var_0_7.wsSocket = nil
	var_0_7._pakcetId = 1
	var_0_7.connectStatus = var_0_5.unConnect
	var_0_7.gameOver = false
	var_0_7.timer = nil
	var_0_7.reconnectCount = 0
	var_0_7.requestTime = 0
	var_0_7.modal = {
		packetId = 0,
		enable = false
	}

	return true
end

function var_0_7.connect()
	log.info("@@ address ", var_0_7.serverAddress)
	log.info("@@ host ", var_0_7.host)

	if not var_0_7.serverAddress or not var_0_7.host then
		log.info("@@ serverAddress or host is nil, cannot connect server")

		return
	end

	local var_2_0 = string.format("ws://%s:80/ws/echo", var_0_7.serverAddress)

	var_0_7.wsSocket = WebSocket:create(var_2_0, var_0_7.host)

	if var_0_7.wsSocket ~= nil then
		log.info("@@ websocket 创建连接")
		var_0_7.wsSocket:registerScriptHandler(var_0_7.onOpen, kWebSocketScriptHandlerOpen)
		var_0_7.wsSocket:registerScriptHandler(var_0_7.onError, kWebSocketScriptHandlerError)
		var_0_7.wsSocket:registerScriptHandler(var_0_7.onMessage, kWebSocketScriptHandlerMessage)
		var_0_7.wsSocket:registerScriptHandler(var_0_7.onClose, kWebSocketScriptHandlerClose)
	end

	NewScheduler(1, var_0_7.checkConnect)

	return true
end

function var_0_7.checkConnect()
	log.info("@@ 检查连接状态 ", var_0_7.connectStatus)

	if var_0_7.connectStatus == var_0_5.connected then
		return
	end

	if var_0_7.wsSocket ~= nil then
		var_0_7.wsSocket:close()

		var_0_7.wsSocket = nil
	end
end

function var_0_7.onOpen(arg_4_0)
	log.info("@@ socket onOpen ")

	var_0_7.connectStatus = var_0_5.connected
	var_0_7.handlerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_7.update, 0, false)

	eventManager.registerEvent("Disconnect", var_0_7.disconnectFromServer)
	eventManager.registerEvent("sendTimeOut", var_0_7.sendTimeout)
	log.info("@@ 检查重连 ", var_0_7.reconnectCount, user.sessionId)

	if var_0_7.reconnectCount > 1 and user and user.sessionId then
		if not var_0_7.lastTs then
			var_0_7.lastTs = string.format("%d", 9569378)
		end

		local var_4_0 = var_0_7.getExt()
		local var_4_1 = var_4_0.ts

		local function var_4_2(arg_5_0)
			log.info("@@@ 重连成功")

			var_0_7.obkey = arg_5_0.action.data.ext
			var_0_7.lastTs = var_4_1
		end

		var_0_7.sendRequestWithoutModal(var_4_2, actions.reconnect, user.sessionId, var_4_0.ts, var_4_0.sign)

		local var_4_3
	end
end

function var_0_7.getExt()
	require("lua/common/encrypt/BigInt")
	require("lua/common/encrypt/BitLibEmu")

	local var_6_0 = {
		sessionId = string.sub(user.sessionId, 1, 32),
		ext = var_0_7.obkey
	}

	if not var_6_0.ext or #var_6_0.ext == 0 then
		var_6_0.ext = "0"
	end

	var_6_0.l = 250200
	var_6_0.h = 992500
	var_6_0.p = 920461
	var_6_0.g = 11
	var_6_0.dts = var_0_7.lastTs
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
	var_0_7.connectNumber = var_6_0.a
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

	var_6_0.sign = var_6_1(string.upper(var_6_1(var_6_0.ext .. var_6_0.hexkey .. var_6_0.dts)) .. var_6_0.sessionId .. var_6_0.ts) .. string.gsub(string.format("%#x", var_6_0.hs[1] + var_6_0.sessionNum), "0x", "")

	return var_6_0
end

function var_0_7.onMessage(arg_7_0)
	log.info("@@ socket on message")

	local var_7_0 = require("lua/common/ByteArray")
	local var_7_1 = var_7_0.new()

	var_7_1:setEndian(var_7_0.ENDIAN_BIG)

	for iter_7_0 = 1, #arg_7_0 do
		var_7_1:writeByte(arg_7_0[iter_7_0])
	end

	var_7_1:setPos(1)

	local var_7_2 = var_7_1:readInt()
	local var_7_3 = var_7_1:readString(var_0_7.packetSize.action)
	local var_7_4 = var_7_1:readInt()
	local var_7_5 = ""

	for iter_7_1 in string.gmatch(var_7_3, "[^%z]") do
		var_7_5 = var_7_5 .. iter_7_1
	end

	local var_7_6 = var_7_1:readStringBytes(var_7_2 - var_0_7.packetSize.action - var_0_7.packetSize.packetId)
	local var_7_7, var_7_8, var_7_9, var_7_10 = var_0_3.inflate()(var_7_6)
	local var_7_11 = var_0_2.decode(var_7_7)

	var_0_7.handlerResponse(var_7_5, var_7_4, var_7_11)
end

function var_0_7.onClose()
	log.info("@@ socket onClose ")

	var_0_7.connectStatus = var_0_5.disconnected

	eventManager.unregisterEvent("Disconnect", var_0_7.disconnectFromServer)
	eventManager.unregisterEvent("sendTimeOut", var_0_7.sendTimeout)

	if var_0_7.handlerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_7.handlerEntry)

		var_0_7.handlerEntry = nil
	end

	if var_0_7.gameOver then
		return
	end

	if user.isLogin then
		if var_0_7.reconnectCount > var_0_4 then
			smgr.showMessageLayer(language.get(300005), smgr.returnToLogin)
		else
			local var_8_0 = 3

			log.info("重连失败， %d秒后重新连接(重连次数：%d)...", var_8_0, var_0_7.reconnectCount)

			var_0_7.reconnectCount = var_0_7.reconnectCount + 1

			if var_0_7.timer then
				var_0_7.timer:over()

				var_0_7.timer = nil
			end

			var_0_7.timer = NewTimer(var_8_0, var_0_7.connect, var_0_7.serverAddress)
		end
	else
		messageBox.alert(language.get(300001), language.get(300007))
	end
end

function var_0_7.onError()
	log.info("@@ socket onError ")
end

function var_0_7.sendTimeout()
	if var_0_7.wsSocket ~= nil then
		var_0_7.wsSocket:close()

		var_0_7.wsSocket = nil
	end
end

function var_0_7._sendMsg(arg_11_0, arg_11_1)
	if arg_11_0 == nil or string.len(arg_11_0) <= 0 or arg_11_1 == nil then
		return 0
	end

	if var_0_7.wsSocket == nil then
		return 0
	end

	local var_11_0 = var_0_7._pakcetId
	local var_11_1 = arg_11_0 or ""
	local var_11_2 = arg_11_1 or ""
	local var_11_3 = var_0_7.packetSize.packetId + var_0_7.packetSize.action + string.len(var_11_2)
	local var_11_4 = require("lua/common/ByteArray")
	local var_11_5 = var_11_4.new()

	var_11_5:setEndian(var_11_4.ENDIAN_BIG)

	for iter_11_0 = 1, 32 do
		local var_11_6 = string.sub(var_11_1, iter_11_0, iter_11_0)
		local var_11_7 = string.byte(var_11_6)

		if var_11_7 ~= nil then
			var_11_5:writeByte(var_11_7)
		else
			var_11_5:writeByte(0)
		end
	end

	var_11_5:writeInt(var_11_0)
	var_11_5:writeString(var_11_2)

	local var_11_8 = {
		string.byte(var_11_5:getBytes(1, var_11_3), 1, -1)
	}

	var_0_7.wsSocket:sendBinaryMsg(var_11_8, var_11_3)

	var_0_7._pakcetId = var_0_7._pakcetId + 1

	return var_11_0
end

function var_0_7.isConnected()
	return var_0_7.connectStatus == var_0_5.connected
end

function var_0_7.disconnectFromServer()
	var_0_7.gameOver = true

	if var_0_7.wsSocket ~= nil then
		var_0_7.wsSocket:close()
	end
end

function var_0_7.registerResponseHandler(arg_14_0, arg_14_1)
	if arg_14_0 == nil then
		tool.traceback()
		messageBox.error(language.get(300008))
	end

	if arg_14_1 == nil then
		tool.traceback()
		messageBox.error(language.get(300011, arg_14_0.name))
	end

	if var_0_7.responseCallFunc[arg_14_0.name] == nil then
		var_0_7.responseCallFunc[arg_14_0.name] = {}
	end

	table.insert(var_0_7.responseCallFunc[arg_14_0.name], arg_14_1)
end

function var_0_7.unregisterResponseHandler(arg_15_0, arg_15_1)
	if arg_15_0 == nil then
		tool.traceback()
	end

	for iter_15_0, iter_15_1 in pairs(var_0_7.responseCallFunc[arg_15_0.name]) do
		if iter_15_1 == arg_15_1 then
			table.remove(var_0_7.responseCallFunc[arg_15_0.name], iter_15_0)
		end
	end
end

function var_0_7.sendRequest(arg_16_0, arg_16_1, ...)
	var_0_7.requestTime = 0

	if var_0_7.connectStatus == var_0_5.connected then
		if arg_16_1 then
			local var_16_0 = {}

			for iter_16_0 = 1, select("#", ...) do
				local var_16_1 = select(iter_16_0, ...)

				if type(var_16_1) == "boolean" then
					var_16_1 = tostring(var_16_1)
				end

				var_16_0[iter_16_0] = var_16_1
			end

			local var_16_2 = string.format(arg_16_1.args, unpack(var_16_0))
			local var_16_3 = var_0_7._sendMsg(arg_16_1.name, var_16_2)

			var_0_7.reqeuestFunc[var_16_3] = {
				action = arg_16_1.name,
				callback = arg_16_0
			}

			log.info(string.format("[send][%s]%s", var_16_3, arg_16_1.name), var_16_2)

			if var_16_3 ~= -1 then
				var_0_7.modal.enable = true
				var_0_7.modal.packetId = var_16_3

				smgr.showModal()
			end
		end
	else
		smgr.showTipText(language.get(300009))
	end
end

function var_0_7.sendRequestWithoutModal(arg_17_0, arg_17_1, ...)
	var_0_7.requestTime = 0

	if var_0_7.connectStatus == var_0_5.connected then
		if arg_17_1 then
			local var_17_0 = string.format(arg_17_1.args, ...)
			local var_17_1 = var_0_7._sendMsg(arg_17_1.name, var_17_0)

			var_0_7.reqeuestFunc[var_17_1] = {
				action = arg_17_1.name,
				callback = arg_17_0
			}

			log.info(string.format("[send][%s]%s", var_17_1, arg_17_1.name), var_17_0)
		end
	else
		smgr.showTipText(language.get(300009))
	end
end

function var_0_7.update(arg_18_0)
	if var_0_7.connectStatus == var_0_5.connected and user and user.isLogin and user.player.pkey then
		var_0_7.connectTime = var_0_7.connectTime - arg_18_0

		if var_0_7.connectTime <= 0 then
			var_0_7.connectTime = conf.connectTime

			var_0_7.sendRequest(nil, actions.connect, user.player.pkey, nil, playerPkey(user.player.pkey, user.sesionId))
		end
	end
end

local function var_0_8(arg_19_0, arg_19_1)
	var_0_7.stack = var_0_7.stack or {}

	table.insert(var_0_7.stack, 1, arg_19_0)

	if arg_19_1 < #var_0_7.stack then
		table.remove(var_0_7.stack, #var_0_7.stack)
	end
end

function var_0_7.handlerResponse(arg_20_0, arg_20_1, arg_20_2)
	log.info(string.format("[recv][%s][%s]", arg_20_1, arg_20_0))

	if var_0_7.modal.enable and var_0_7.modal.packetId == arg_20_1 then
		var_0_7.modal.enable = false

		smgr.hideModal()
	end

	if arg_20_2.action.state == 3 then
		local var_20_0 = false

		for iter_20_0, iter_20_1 in pairs(var_0_7.responseCallFunc) do
			if arg_20_0 == iter_20_0 and table.getn(iter_20_1) > 0 then
				for iter_20_2, iter_20_3 in pairs(iter_20_1) do
					if iter_20_3 then
						iter_20_3(arg_20_2)

						local var_20_1 = true
					end
				end
			end
		end
	elseif arg_20_2.action.state == 1 or arg_20_0 == actions.getAssembleGeneral.name or arg_20_0 == actions.getTryInfo.name or arg_20_0 == actions.autoMoveInfo.name or arg_20_0 == actions.autoMove.name then
		local var_20_2 = var_0_7.reqeuestFunc[arg_20_1]

		if var_20_2 and var_20_2.action == arg_20_0 and var_20_2.callback then
			var_20_2.callback(arg_20_2)
		end

		var_0_7.reqeuestFunc[arg_20_1] = nil
	else
		log.info("[recv state = 0]", arg_20_1, arg_20_0)

		if not arg_20_2.action.data.msg then
			arg_20_2.action.data.msg = "no error message"
		end

		if arg_20_2.action.state == 0 then
			if language.get(300010) == arg_20_2.action.data.msg then
				messageBox.createGoldWarning()
			else
				smgr.showTipText(arg_20_2.action.data.msg)
				amgr.playEffect(enumAudioFile.ui_click_error, false, true)
			end
		end

		if arg_20_2.action.state == 4 then
			var_0_7.disconnectFromServer()
			smgr.showMessageLayer(arg_20_2.action.data.msg, smgr.returnToLogin)
		end
	end
end

return var_0_7
