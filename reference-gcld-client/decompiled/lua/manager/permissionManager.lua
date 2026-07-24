PERMISSION = {
	RECORD_AUDIO = "android.permission.RECORD_AUDIO",
	GET_ACCOUNTS = "android.permission.GET_ACCOUNTS",
	READ_EXTERNAL_STORAGE = "android.permission.READ_EXTERNAL_STORAGE",
	READ_PHONE_STATE = "android.permission.READ_PHONE_STATE",
	READ_CALENDAR = "android.permission.READ_CALENDAR",
	CALL_PHONE = "android.permission.CALL_PHONE",
	WRITE_CALENDAR = "android.permission.WRITE_CALENDAR",
	WRITE_EXTERNAL_STORAGE = "android.permission.WRITE_EXTERNAL_STORAGE"
}

require("lua/common/eventManager")

pmgr = pmgr or {}
pmgr.corProcesss = nil
pmgr.registered = false

if platform.getFlag() == "MOBILE_IPHONE" then
	-- block empty
end

if platform.getFlag() == "MOBILE_ANDROID" then
	-- block empty
end

local var_0_0 = "com/regin/gcld/helper/ActivityBase"

function pmgr.requestPersmission(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	log.info("LuajTest ActivityBase")

	local function var_1_0()
		log.info("LUA: success !!!")
		arg_1_1()
	end

	local function var_1_1()
		log.info("LUA: falied !!!")
		arg_1_2()
	end

	if conf.language == "vie" or conf.language == "tha" or conf.language == "xm" then
		if platform.getFlag() == "MOBILE_ANDROID" then
			log.info("==== android sys version ====", DeviceProxy:getSystemVersion())

			if tonumber(DeviceProxy:getSystemVersion()) < 6 then
				arg_1_1()
			else
				if pmgr.registered then
					log.info("事件重复")
				else
					eventManager.registerEvent("PermissionSuccess", var_1_0)
					eventManager.registerEvent("PermissionFail", var_1_1)

					pmgr.registered = true
				end

				local var_1_2 = {
					permission = arg_1_3,
					permissionDes = arg_1_0
				}

				channelMgr.transform("permission", tool.tableToJson(var_1_2))
			end
		else
			log.info("==== no need ====")
			arg_1_1()
		end
	else
		log.info("==== no need ====")
		arg_1_1()
	end
end

function pmgr.requestPersmissions(arg_4_0, arg_4_1, arg_4_2, ...)
	pmgr.corProcesss = coroutine.create(function()
		return
	end)
end
