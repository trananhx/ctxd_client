require("lua/layer/versionUpdate/control")

function initVersionUpdateLayer(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = "res/ui/login/login_scene_start.jpg"

	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		var_1_1 = "res/ui/login/login_scene_start37.png"
	end

	local var_1_2 = CCSprite:create(var_1_1)

	var_1_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	arg_1_0:addChild(var_1_2)

	local var_1_3

	require("lua/manager/resourceManager")

	local var_1_4 = rmgr.getLoginUpOnPic()

	if string.find(var_1_4, "frame:") ~= nil then
		var_1_3 = CCSprite:createWithSpriteFrameName("login_up_on.png")
	else
		var_1_3 = CCSprite:create(var_1_4)
	end

	var_1_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height - var_1_3:getContentSize().height * 0.5))
	arg_1_0:addChild(var_1_3)

	local var_1_5 = CCSprite:create("res/ui/login/login_down_on.png")

	var_1_5:setPosition(ccp(visibleSize.width * 0.5, var_1_5:getContentSize().height * 0.5))
	arg_1_0:addChild(var_1_5)

	local var_1_6 = CCSprite:createWithSpriteFrameName("loadbackground.png")

	var_1_6:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.07))
	var_1_6:setVisible(false)
	arg_1_0:addChild(var_1_6)

	local var_1_7 = CCSprite:createWithSpriteFrameName("loadbar.png")
	local var_1_8 = CCProgressTimer:create(var_1_7)

	var_1_8:setType(kCCProgressTimerTypeBar)
	var_1_8:setMidpoint(CCPointMake(0, 0.5))
	var_1_8:setAnchorPoint(ccp(0, 0.5))
	var_1_8:setBarChangeRate(ccp(1, 0))
	var_1_8:setPosition(CCPointMake(0, var_1_6:getContentSize().height * 0.5))
	var_1_6:addChild(var_1_8)
	var_1_8:setPercentage(0)
	require("res/lang_zh_cn")

	local var_1_9 = CCLabelTTF:create(language.get(280007), "Thonburi", 22)

	var_1_9:setPosition(ccp(visibleSize.width * 0.5, 80))
	arg_1_0:addChild(var_1_9)

	function var_1_0.showTip(arg_2_0, arg_2_1)
		var_1_9:setString(arg_2_1)
	end

	function var_1_0.show(arg_3_0)
		var_1_6:setVisible(true)
	end

	function var_1_0.update(arg_4_0, arg_4_1)
		var_1_8:setPercentage(arg_4_1)
	end

	return var_1_0
end

function createVersionUpdateLayer()
	local var_5_0 = createBaseLayer()
	local var_5_1 = createVersionUpdateControl(var_5_0)

	function var_5_0.onEnter(arg_6_0)
		CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/sys/loading.plist")

		if conf.language == "vie" or conf.language == "tha" or conf.language == "tw" then
			CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/login/login3.plist")
		else
			CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/login/login2.plist")
		end

		local var_6_0 = initVersionUpdateLayer(arg_6_0)

		var_5_1:start(var_6_0)
	end

	function var_5_0.onExit(arg_7_0)
		var_5_1:over()
		CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile("res/sys/loading.plist")

		if conf.language == "vie" or conf.language == "tha" or conf.language == "tw" then
			CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile("res/ui/login/login3.plist")
		else
			CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile("res/ui/login/login2.plist")
		end
	end

	return var_5_0
end
