gmgr = gmgr or {}

function gmgr.init()
	gmgr.action = {}
	gmgr.action.version = gmgr.getVersion
	gmgr.action.test = gmgr.setTest
	gmgr.action.cdn = gmgr.setCdn
	gmgr.action.echo = gmgr.echo
	gmgr.action.udid = gmgr.getUDID
	gmgr.action.testserver = gmgr.testServer
end

function gmgr.echo()
	return " 测试动态更新有没有生效=> " .. game.version.game
end

function gmgr.getVersion(arg_3_0)
	if game.version and game.version.client and game.version.game then
		return string.format("[client = %s][res = %s]", game.version.client, game.version.game)
	end

	return "找不到版本号"
end

function gmgr.setTest(arg_4_0)
	local var_4_0 = arg_4_0[1]

	if arg_4_0[2] == "on" then
		CCUserDefault:sharedUserDefault():setBoolForKey("ForTest", true)

		return "test on"
	else
		CCUserDefault:sharedUserDefault():setBoolForKey("ForTest", false)

		return "test off"
	end
end

function gmgr.setCdn(arg_5_0)
	local var_5_0 = arg_5_0[1]
	local var_5_1 = arg_5_0[2]

	if var_5_1 == nil then
		return "cdn地址为空"
	end

	if type(var_5_1) ~= "string" then
		return "cdn地址不是字符串"
	end

	if string.len(var_5_1) == 0 then
		return "cdn长度为0"
	end

	CCUserDefault:sharedUserDefault():setStringForKey("TestCdn", var_5_1)

	return "ok"
end

function gmgr.getUDID()
	local var_6_0 = PlatformHelper:getInstance():GetUDID("xxxxxxx")

	log.info("@@ udid ", var_6_0)

	return var_6_0
end

function gmgr.testServer()
	conf.useTestServerTxtUrl = not conf.useTestServerTxtUrl

	return "ok"
end
