platform = {}
platform.platform = CCApplication:sharedApplication():getTargetPlatform()

function platform.doLuaFile(arg_1_0)
	function reload_file(arg_2_0)
		log.info("@@ reload module ", arg_2_0)

		package.loaded[arg_2_0] = nil

		require(arg_2_0)
	end

	reload_file(arg_1_0)
end

function platform.getFlag()
	if platform.platform == kTargetAndroid then
		return "MOBILE_ANDROID"
	elseif platform.platform == kTargetWinRT then
		return "MOBILE_WP8"
	else
		return "MOBILE_IPHONE"
	end
end

function platform.getFlagSimple()
	if platform.platform == kTargetAndroid then
		return "a"
	else
		return "i"
	end
end

function platform.getOS()
	if platform.platform == kTargetWindows then
		return "Windows"
	elseif platform.platform == kTargetLinux then
		return "Linux"
	elseif platform.platform == kTargetMacOS then
		return "MacOS"
	elseif platform.platform == kTargetAndroid then
		return "Android"
	elseif platform.platform == kTargetIphone then
		return "iPhone"
	elseif platform.platform == kTargetIpad then
		return "iPad"
	elseif platform.platform == kTargetBlackBerry then
		return "BlackBerry"
	elseif platform.platform == kTargetNaCl then
		return "NaCl"
	elseif platform.platform == kTargetEmscripten then
		return "Emscripten"
	elseif platform.platform == kTargetTizen then
		return "Tizen"
	else
		return "unknown-os"
	end
end

function platform.getASTID()
	if platform.astId == nil and not conf.debug then
		local var_6_0 = ""

		reload("version.lua")

		local var_6_1 = sys_version

		if var_6_1 and var_6_1.client and tool.cmpVersion("7.8.0.0", var_6_1.client) then
			var_6_0 = PlatformHelper:getInstance():GetASTID("")
		end

		platform.astId = var_6_0
	end

	return platform.astId
end

function platform.getDeviceModel()
	if DeviceProxy.getDeviceModel then
		return (DeviceProxy:getDeviceModel())
	else
		return "0"
	end
end

function platform.isiPhoneX()
	if visibleSize.width == 1386 and visibleSize.height == 640 and (platform.platform == kTargetIphone or platform.platform == kTargetIpad) then
		return true
	end

	return false
end

function platform.getSafeDistance(arg_9_0)
	print("visibleSize:", visibleSize.width, visibleSize.height)

	if platform.isiPhoneX() then
		if arg_9_0 == "down" then
			return 20
		elseif arg_9_0 == "top" then
			return 0
		else
			return 50
		end
	else
		return 0
	end
end
