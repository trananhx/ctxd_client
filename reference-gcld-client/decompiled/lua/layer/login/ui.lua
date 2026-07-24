require("lua/common/tool")
tool.requireRes("login")

function createLoginLayer()
	local var_1_0 = createBaseLayer()
	local var_1_1 = createLoginControl(var_1_0)

	log.info("登陆页面")

	local function var_1_2()
		local var_2_0 = "res/ui/login/login_scene_start.jpg"

		if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
			var_2_0 = "res/ui/login/login_scene_start37.png"
		end

		local var_2_1 = CCSprite:create(var_2_0)

		var_2_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_0:addChild(var_2_1)

		local var_2_2
		local var_2_3 = rmgr.getLoginUpOnPic()

		if string.find(var_2_3, "frame:") ~= nil then
			var_2_2 = CCSprite:createWithSpriteFrameName("login_up_on.png")
		else
			var_2_2 = CCSprite:create(var_2_3)
		end

		var_2_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height - var_2_2:getContentSize().height * 0.5))
		var_1_0:addChild(var_2_2)

		local var_2_4 = CCSprite:create("res/ui/login/login_down_on.png")

		var_2_4:setPosition(ccp(visibleSize.width * 0.5, var_2_4:getContentSize().height * 0.5))
		var_1_0:addChild(var_2_4)
	end

	function var_1_0.onEnter(arg_3_0)
		if conf.language == "vie" or conf.language == "tha" or conf.language == "tw" then
			rmgr.loadResource("res/ui/login/login3.plist")
		else
			rmgr.loadResource("res/ui/login/login2.plist")
		end

		var_1_2()

		if user.skipSDKStepFlag then
			user.skipSDKStepFlag = nil

			log.info("跳过sdk登陆界面，直接显示服务器列表")
			var_1_1.goFromServerTxt()
		else
			var_1_1:init()
			var_1_1:check()
		end

		eventManager.registerEvent("channelLoginSuccess", var_1_1.onLoginSuccess)
	end

	function var_1_0.onExit(arg_4_0)
		var_1_1:clearup()
		eventManager.unregisterEvent("channelLoginSuccess", var_1_1.onLoginSuccess)
	end

	return var_1_0
end
