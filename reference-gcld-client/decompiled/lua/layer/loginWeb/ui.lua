require("lua/common/tool")
tool.requireRes("loginWeb")

function createLoginWebLayer()
	local var_1_0 = createBaseLayer()
	local var_1_1 = createLoginControl(var_1_0)

	local function var_1_2()
		local var_2_0 = CCSprite:create("res/ui/login/login_scene.jpg")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_0:addChild(var_2_0)

		local var_2_1
		local var_2_2 = rmgr.getLoginUpOnPic()

		if string.find(var_2_2, "frame:") ~= nil then
			var_2_1 = CCSprite:createWithSpriteFrameName("login_up_on.png")
		else
			var_2_1 = CCSprite:create(var_2_2)
		end

		var_2_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height - var_2_1:getContentSize().height * 0.5))
		var_1_0:addChild(var_2_1)

		local var_2_3 = CCSprite:createWithSpriteFrameName("login_down_on.png")

		var_2_3:setPosition(ccp(visibleSize.width * 0.5, var_2_3:getContentSize().height * 0.5))
		var_1_0:addChild(var_2_3)
	end

	function var_1_0.onEnter(arg_3_0)
		rmgr.loadResource("res/ui/login/login3.plist")
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
		rmgr.clearup()
		eventManager.unregisterEvent("channelLoginSuccess", var_1_1.onLoginSuccess)

		if var_1_1.handlerUpdateEntry then
			-- block empty
		end
	end

	return var_1_0
end
