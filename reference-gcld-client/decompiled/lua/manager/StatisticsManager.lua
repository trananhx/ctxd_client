statMgr = statMgr or {}
statMgr.state = {
	needForceUpdate = "needForceUpdate",
	beforeDynamicUpdate = "beforeDynamicUpdate",
	tuijianFuS = "tuijianFuS",
	tuijianFuC = "tuijianFuC",
	ucLoginNil = "ucLoginNil",
	loginOver = "loginOver",
	enterGame = "enterGame",
	checkUpdate = "checkUpdate",
	version = "version",
	gameStartUp = "gameStartUp",
	firstOpen = "firstOpen",
	selectPlayer = "selectPlayer",
	getServerOver = "getServerOver",
	startInstall_30lv = "startInstall_30lv",
	afterDynamicUpdate = "afterDynamicUpdate",
	startDownload_30lv = "startDownload_30lv",
	open = "open",
	updateOver = "updateOver",
	installOver_30lv = "installOver_30lv",
	loginSDK = "loginSDK",
	createPlayer = "createPlayer"
}

function statMgr.getUUID()
	local var_1_0
	local var_1_1
	local var_1_2, var_1_3 = pcall(function()
		return PlatformHelper:getInstance():GetUDID("")
	end)
	local var_1_4 = var_1_3

	if not var_1_2 then
		log.info("@@ get uuid error ", var_1_4)

		return "no-udid"
	end

	return var_1_4
end

function statMgr.update(arg_3_0, arg_3_1)
	if conf.debug == true then
		return
	end

	if not statMgr.uuid then
		statMgr.uuid = statMgr.getUUID()
	end

	if not statMgr.channel then
		statMgr.channel = ChannelManager:getInstance():getChannelId()
	end

	local var_3_0

	if arg_3_1 == nil then
		var_3_0 = string.format("%sstat?%s&%s&%s", conf.address, statMgr.channel, arg_3_0, statMgr.uuid)
	else
		var_3_0 = string.format("%sstat?%s&%s&%s&%s", conf.address, statMgr.channel, arg_3_0, statMgr.uuid, arg_3_1)
	end

	local var_3_1 = string.format("%s#%s#%s#%s#%s", "gcmob", statMgr.channel, arg_3_0, statMgr.uuid, os.time())
	local var_3_2 = string.urlencode(var_3_1)
	local var_3_3 = string.format("http://log-hk.pub.aoshitang.com/root/log.action?game=gcmob&log=%s", var_3_2)

	local function var_3_4(arg_4_0)
		log.info("## stat ", var_3_0)
	end

	CCHttpClient:createHTTPRequestLua(var_3_4, var_3_0, kCCHTTPRequestMethodGET)

	local function var_3_5(arg_5_0)
		local var_5_0 = string.gsub(var_3_3, "([%%])", function(arg_6_0)
			return "%" .. arg_6_0
		end)

		log.info("## stat ", var_5_0)
	end

	CCHttpClient:createHTTPRequestLua(var_3_5, var_3_3, kCCHTTPRequestMethodGET)
end
