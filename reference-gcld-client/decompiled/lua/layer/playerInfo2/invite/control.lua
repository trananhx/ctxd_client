local var_0_0 = class("InviteControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.copyToClipboard(arg_2_0)
	DeviceProxy:copyToClipboard(arg_2_0.inviteCode)
	smgr.showTipTextGreen(language.get("450002_yyl"))
end

function var_0_0.share(arg_3_0)
	local var_3_0 = {
		"http://cdn01.aoshitang.com/mainos/upload/gcld/site/20140508152013075_wx01.png",
		"http://cdn01.aoshitang.com/mainos/upload/gcld/site/20140508152013282_wx02.png"
	}

	CCUserDefault:sharedUserDefault():setStringForKey("weibo_app_key", "3807001534")
	CCUserDefault:sharedUserDefault():setStringForKey("weibo_app_secret", "c8bac6a4c220a9dc48e23316e56d3689")
	CCUserDefault:sharedUserDefault():setStringForKey("weibo_redirect_url", "http://gc.aoshitang.com")
	CCUserDefault:sharedUserDefault():setStringForKey("weixin_app_key", "wxec9b8d963ca2e2be")
	CCUserDefault:sharedUserDefault():setStringForKey("weixin_redirect_url", "http://gc.aoshitang.com")

	local var_3_1 = 640
	local var_3_2 = 550

	DeviceProxy:share(ccp(var_3_1, var_3_2), language.get("450003_yyl", arg_3_0.inviteCode) .. "-->https://itunes.apple.com/cn/app/gong-cheng-e-shi-shang-chao/id726652663?mt=8", var_3_0[tool.random(1, 2)], "我们没有时间再耽搁了，城池马上就要被攻破了。你还在等什么？", "我们没有时间再耽搁了，城池马上就要被攻破了。你还在等什么？", "http://gc.aoshitang.com/wechat/gc_wechat.html#" .. arg_3_0.inviteCode, "2", "http://gc.aoshitang.com", "攻城掠地", "", "其他信息", function(arg_4_0)
		if arg_4_0.res == 0 then
			log.info("分享开始")
		elseif arg_4_0.res == 1 then
			log.info("分享成功")
		elseif arg_4_0.res == 2 then
			log.info("分享失败")
		elseif arg_4_0.res == 3 then
			log.info("分享取消")
		end
	end)
end

function var_0_0.getInviteInfo(arg_5_0)
	local function var_5_0(arg_6_0)
		arg_5_0.data = arg_6_0.action.data

		log.info(tool.tableToJson(arg_6_0))

		arg_5_0.inviteCode = arg_5_0.data.code

		arg_5_0.ui:init()
	end

	cmgr.sendRequest(var_5_0, actions.getInviteInfo)
end

return var_0_0
