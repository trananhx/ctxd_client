require("lua/common/tool")
require("lua/layer/loginDebug/control")

function createLoginDebugLayer()
	local var_1_0 = createBaseLayer()
	local var_1_1 = createLoginDebugControl(var_1_0)

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

		local var_2_3 = CCSprite:create("res/ui/login/login_down_on.png")

		var_2_3:setPosition(ccp(visibleSize.width * 0.5, var_2_3:getContentSize().height * 0.5))
		var_1_0:addChild(var_2_3)
	end

	function var_1_0.onEnter(arg_3_0)
		if conf.language == "vie" or conf.language == "tha" or conf.language == "tw" then
			rmgr.loadResource("res/ui/login/login3.plist")
		else
			rmgr.loadResource("res/ui/login/login2.plist")
		end

		eventManager.registerEvent("disconnected", var_1_1.returnToStart)
		var_1_2()
		var_1_1:init()
	end

	function var_1_0.onExit(arg_4_0)
		eventManager.registerEvent("unregisterEvent", var_1_1.returnToStart)
		rmgr.clearup()

		if var_1_1.handlerUpdateEntry then
			-- block empty
		end
	end

	return var_1_0
end
