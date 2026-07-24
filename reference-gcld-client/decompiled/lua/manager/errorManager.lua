emgr = {}
emgr.pool = {}

function emgr.init()
	emgr.game = "mobile_gcld"
	emgr.serverName = "ast"
	emgr.serverId = "0"
	emgr.type = 1
	emgr.version = "Unknow"
	emgr.manufacturer = "ast"
	emgr.platform = "Unknow"
	emgr.playerType = "normal"
	emgr.clientVersion = "Unknow"
	emgr.gameVersion = "Unknow"

	local var_1_0 = CCApplication:sharedApplication():getTargetPlatform()

	if var_1_0 == kTargetWindows then
		emgr.platform = "Windows"
	elseif var_1_0 == kTargetLinux then
		emgr.platform = "Linux"
	elseif var_1_0 == kTargetMacOS then
		emgr.platform = "MacOS"
	elseif var_1_0 == kTargetAndroid then
		emgr.platform = "Android"
	elseif var_1_0 == kTargetIphone then
		emgr.platform = "iPhone"
		emgr.version = DeviceProxy:getSystemVersion()
		emgr.playerType = DeviceProxy:isJailbreak() == 1 and "jailbreak" or "normal"
	elseif var_1_0 == kTargetIpad then
		emgr.platform = "iPad"
		emgr.version = DeviceProxy:getSystemVersion()
		emgr.playerType = DeviceProxy:isJailbreak() == 1 and "jailbreak" or "normal"
	elseif var_1_0 == kTargetBlackBerry then
		emgr.platform = "BlackBerry"
	elseif var_1_0 == kTargetNaCl then
		emgr.platform = "NaCl"
	elseif var_1_0 == kTargetEmscripten then
		emgr.platform = "Emscripten"
	elseif var_1_0 == kTargetTizen then
		emgr.platform = "Tizen"
	end

	if game.version and game.version.client and game.version.game then
		emgr.clientVersion = game.version.client
		emgr.gameVersion = game.version.game
	end

	emgr.version = emgr.version .. "-" .. string.format("[client = %s][res = %s]", emgr.clientVersion, emgr.gameVersion)
	emgr.initOK = true

	log.info("emgr.init --> OK")
	log.info("platform=%s", emgr.platform)
	log.info("version=%s", emgr.version)
end

local function var_0_0(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in pairs(arg_2_0) do
		if iter_2_1 == arg_2_1 then
			return true
		end
	end

	return false
end

function emgr.report(arg_3_0)
	if emgr.initOK ~= true then
		return
	end

	log.info("start report")

	local function var_3_0(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = {
			[arg_4_1] = arg_4_2
		}

		return string.gsub(arg_4_0, "$(%w)", var_4_0)
	end

	if var_0_0(emgr.pool, arg_3_0) then
		return
	end

	local var_3_1 = ""

	for iter_3_0, iter_3_1 in pairs(cmgr.stack) do
		var_3_1 = var_3_1 .. iter_3_1 .. "\n"
	end

	emgr.type = var_3_1
	emgr.lastTime = time

	table.insert(emgr.pool, 1, arg_3_0)

	local var_3_2 = {
		game = emgr.game,
		serverName = user.serverName,
		serverId = user.serverId,
		type = emgr.type,
		version = game.version.game,
		platform = emgr.platform,
		playerType = emgr.playerType,
		errorStack = arg_3_0
	}
	local var_3_3 = ""
	local var_3_4 = true

	for iter_3_2, iter_3_3 in pairs(var_3_2) do
		if var_3_4 == true then
			var_3_4 = false
		else
			var_3_3 = var_3_3 .. "&"
		end

		var_3_3 = var_3_3 .. iter_3_2 .. "=" .. tool.urlencode(iter_3_3)
	end

	if #emgr.pool > 10 then
		table.remove(emgr.pool, #emgr.pool)
	end

	CCHttpClient:createHTTPRequestLuaWithPost(function()
		log.info("report OK")
	end, "http://log.pub.aoshitang.com/root/errorLog.action", var_3_3)
end

function emgr.feedback(arg_6_0)
	if emgr.initOK ~= true then
		return
	end

	local function var_6_0(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = {
			[arg_7_1] = arg_7_2
		}

		return string.gsub(arg_7_0, "$(%w)", var_7_0)
	end

	arg_6_0 = string.gsub(arg_6_0, "\n", "<br>")

	if var_0_0(emgr.pool, arg_6_0) then
		return
	end

	emgr.lastTime = time

	table.insert(emgr.pool, 1, arg_6_0)

	local var_6_1 = {
		game = "gcld",
		serverName = user.serverName,
		serverId = user.serverId,
		yx = user.yx,
		playerName = user.player.name,
		playerLv = user.player.playerLv,
		vip = user.player.vipLv,
		version = emgr.version,
		os = emgr.platform,
		playerType = emgr.playerType,
		msg = user.player.name .. "(" .. user.player.id .. "):<br>" .. arg_6_0
	}
	local var_6_2 = ""
	local var_6_3 = true

	for iter_6_0, iter_6_1 in pairs(var_6_1) do
		if var_6_3 == true then
			var_6_3 = false
		else
			var_6_2 = var_6_2 .. "&"
		end

		var_6_2 = var_6_2 .. iter_6_0 .. "=" .. tool.urlencode(iter_6_1)
	end

	if #emgr.pool > 10 then
		table.remove(emgr.pool, #emgr.pool)
	end

	CCHttpClient:createHTTPRequestLuaWithPost(function(arg_8_0)
		log.info("feedback OK")
	end, "http://flash.aoshitang.com/root/feedback/report.action", var_6_2)
end

emgr.init()
