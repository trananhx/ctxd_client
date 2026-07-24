require("lua/data/conf")
require("lua/data/statistics")
require("lua/common/functions")
require("lua/common/log")
require("lua/common/helper")
require("lua/common/platform")
require("lua/common/tool")
require("lua/common/utf8")

function __G__TRACKBACK__(arg_1_0)
	CCLuaLog("-----------------------------------------")
	CCLuaLog("LUA ERROR : " .. tostring(arg_1_0) .. "\n")

	local var_1_0 = debug.traceback("", 2)

	CCLuaLog(var_1_0)
	CCLuaLog("-----------------------------------------")
	emgr.report(tostring(arg_1_0 .. "\n" .. var_1_0))
end

function needSetResourcePath()
	local var_2_0 = CCUserDefault:sharedUserDefault():getStringForKey("gameVersion")

	platform.doLuaFile("version.lua")

	local var_2_1
	local var_2_2

	if sys_version then
		var_2_1 = sys_version.game
		var_2_2 = sys_version.client

		local var_2_3 = CCUserDefault:sharedUserDefault():getIntegerForKey("inComplete")

		log.info("the package is completed. ", var_2_3)

		if var_2_3 == 0 then
			if sys_version.isCompleted == false then
				CCUserDefault:sharedUserDefault():setIntegerForKey("inComplete", 1)
			else
				CCUserDefault:sharedUserDefault():setIntegerForKey("inComplete", 2)
			end

			CCUserDefault:sharedUserDefault():flush()
		end

		local var_2_4 = CCUserDefault:sharedUserDefault():getIntegerForKey("inComplete")

		log.info("the package is completed. ", var_2_4)

		if sys_version.isApp64 == true and CCUserDefault:sharedUserDefault():getIntegerForKey("inApp64Res") == 0 then
			local var_2_5 = CCUserDefault:sharedUserDefault():getStringForKey("currentResourcePath")

			if var_2_5 and string.len(var_2_5) > 0 then
				if not Utils:IsDirExist(var_2_5) then
					var_2_5 = CCFileUtils:sharedFileUtils():getWritablePath() .. var_2_0
				end

				if Utils:IsDirExist(var_2_5) then
					tool.clearDir(var_2_5)
				end

				CCUserDefault:sharedUserDefault():setStringForKey("gameVersion", var_2_1)
				CCUserDefault:sharedUserDefault():setStringForKey("clientVersion", var_2_2)
				CCUserDefault:sharedUserDefault():setBoolForKey("hasOpenGame", false)
				CCUserDefault:sharedUserDefault():setStringForKey("currentResourcePath", "")
				CCUserDefault:sharedUserDefault():flush()
			end

			CCUserDefault:sharedUserDefault():setIntegerForKey("inApp64Res", 1)
			CCUserDefault:sharedUserDefault():flush()

			return false
		end
	end

	if var_2_1 and var_2_2 and var_2_0 and string.len(var_2_0) > 0 then
		CCUserDefault:sharedUserDefault():setStringForKey("clientVersion", var_2_2)

		if tool.cmpVersion2(var_2_1, var_2_0) == 1 then
			CCUserDefault:sharedUserDefault():setStringForKey("gameVersion", var_2_1)
			CCUserDefault:sharedUserDefault():flush()

			return false
		end

		CCUserDefault:sharedUserDefault():flush()

		return true
	end

	return true
end

function start()
	local var_3_0 = CCUserDefault:sharedUserDefault():getStringForKey("currentResourcePath")
	local var_3_1 = needSetResourcePath()

	if var_3_0 and string.len(var_3_0) > 0 and var_3_1 then
		CCFileUtils:sharedFileUtils():addSearchPath(var_3_0)
		log.info("@@ 启动时设置资源路径 ", var_3_0)
	end

	log.debug("@@ 开始游戏")
	require("lua/checkVersion")
	checkVersion()
end

xpcall(start, __G__TRACKBACK__)
