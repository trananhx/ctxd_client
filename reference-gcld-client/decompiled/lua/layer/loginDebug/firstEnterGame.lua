function showDebugFirstEnterGame(arg_1_0, arg_1_1)
	arg_1_1.changeUi("first")
	tool.safeRemoveChildByTag(arg_1_0, loginDebugTag.subScene)

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:create("res/ui/common/text/login/text_login_sanguo.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.7))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCMenu:create()

		var_1_0:addChild(var_2_1)

		local var_2_2 = CCSprite:createWithSpriteFrameName("btn_login_aoshitang_hover.png")
		local var_2_3 = CCSprite:createWithSpriteFrameName("btn_login_aoshitang.png")
		local var_2_4 = CCMenuItemSprite:create(var_2_2, var_2_3)

		var_2_4:registerScriptTapHandler(arg_1_1.astUserLogin)
		var_2_4:setPosition(ccp(0, -50))
		var_2_1:addChild(var_2_4)

		if conf.language == "cn" then
			local var_2_5 = "抵制不良游戏，拒绝盗版游戏；适度游戏益脑，沉迷游戏伤身；\n注意保护自我，谨防受骗上当；合理安排时间，享受健康生活。"
			local var_2_6 = CCLabelTTF:create(var_2_5, "Thonburi", 22)

			var_2_6:setColor(ccc3(250, 86, 125))
			var_2_6:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
			var_1_0:addChild(var_2_6)
		end

		local var_2_7 = CCUserDefault:sharedUserDefault():getStringForKey("address")
		local var_2_8 = CCScale9Sprite:create("res/default.png")

		CCRectMake(0, 0, 4, 4)

		local var_2_9 = CCEditBox:create(CCSizeMake(400, 60), var_2_8)

		var_2_9:setAnchorPoint(ccp(0.5, 0))
		var_2_9:setPosition(ccp(visibleSize.width * 0.5, 0))
		var_2_9:setMaxLength(100)
		var_2_9:setReturnType(1)
		var_2_9:setText(var_2_7)
		var_1_0:addChild(var_2_9)

		arg_1_1.addressField = var_2_9

		local var_2_10 = "游戏著作权人：锐战软件（上海）有限公司\n出版服务单位：上海浦东电子出版社有限公司\n备案号：文网游备字【2016】M-SLG 1817号\n批准文号：新广出审【2014】496号\n出版物号：ISBN 978-7-89431-222-8"
		local var_2_11 = CCLabelTTF:create(var_2_10, "Thonburi", 18)

		var_2_11:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_2_11:setColor(ccc3(255, 255, 255))
		var_2_11:setAnchorPoint(ccp(0, 1))
		var_2_11:setPosition(platform.getSafeDistance(), visibleSize.height)
		var_1_0:addChild(var_2_11)
	end

	function var_1_0.onEnter(arg_3_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_4_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginDebugTag.subScene)
end
