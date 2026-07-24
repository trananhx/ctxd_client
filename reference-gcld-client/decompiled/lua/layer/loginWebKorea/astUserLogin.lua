function showAstUserLoginWeb(arg_1_0, arg_1_1)
	arg_1_1.changeUi("login")

	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:createWithSpriteFrameName("login_view.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCStrokeLabelTTF:create(language.get(211001), "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_1:setColor(ccc3(84, 72, 57))
		var_2_1:setAnchorPoint(ccp(1, 0.5))
		var_2_1:setPosition(ccp(225, 210))
		var_2_0:addChild(var_2_1)

		local var_2_2 = CCStrokeLabelTTF:create(language.get(211002), "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_2:setColor(ccc3(84, 72, 57))
		var_2_2:setAnchorPoint(ccp(1, 0.5))
		var_2_2:setPosition(ccp(200, 135))
		var_2_0:addChild(var_2_2)

		local var_2_3 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
		local var_2_4 = CCEditBox:create(CCSizeMake(370, 60), var_2_3)

		var_2_4:setPosition(ccp(400, 210))
		var_2_4:setMaxLength(30)
		var_2_4:setReturnType(1)
		var_2_0:addChild(var_2_4)

		local var_2_5 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
		local var_2_6 = CCEditBox:create(CCSizeMake(370, 60), var_2_5)

		var_2_6:setInputFlag(kEditBoxInputFlagPassword)
		var_2_6:setPosition(ccp(400, 135))
		var_2_6:setMaxLength(50)
		var_2_6:setReturnType(1)
		var_2_0:addChild(var_2_6)

		local function var_2_7()
			arg_1_1.login(var_2_4:getText(), var_2_6:getText())
		end

		local function var_2_8()
			arg_1_1.goToRegister()
		end

		local function var_2_9()
			arg_1_1.returnToStart()
		end

		local var_2_10 = CCMenu:create()

		var_2_10:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_10)

		local var_2_11 = CCSprite:createWithSpriteFrameName("login_btn_login_a.png")
		local var_2_12 = CCSprite:createWithSpriteFrameName("login_btn_login_c.png")
		local var_2_13 = CCMenuItemSprite:create(var_2_11, var_2_12)

		var_2_13:registerScriptTapHandler(var_2_7)

		if conf.language == "tw" then
			var_2_13:setPosition(ccp(visibleSize.width * 0.5 + var_2_11:getContentSize().width * 0.5 + 20, visibleSize.height * 0.2))
		else
			var_2_13:setPosition(ccp(visibleSize.width * 0.5 - var_2_11:getContentSize().width * 0.5 - 20, visibleSize.height * 0.2))
		end

		var_2_10:addChild(var_2_13)

		local var_2_14 = CCSprite:createWithSpriteFrameName("login_btn_reg_a.png")
		local var_2_15 = CCSprite:createWithSpriteFrameName("login_btn_reg_c.png")
		local var_2_16 = CCMenuItemSprite:create(var_2_14, var_2_15)

		var_2_16:registerScriptTapHandler(var_2_8)

		if conf.language == "tw" then
			var_2_16:setPosition(ccp(visibleSize.width * 0.5 - var_2_14:getContentSize().width * 0.5 - 20, visibleSize.height * 0.2))
		else
			var_2_16:setPosition(ccp(visibleSize.width * 0.5 + var_2_14:getContentSize().width * 0.5 + 20, visibleSize.height * 0.2))
		end

		var_2_10:addChild(var_2_16)

		local var_2_17 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_2_18 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_2_19 = CCMenuItemSprite:create(var_2_17, var_2_18)

		var_2_19:registerScriptTapHandler(arg_1_1.returnToLast)
		var_2_19:setPosition(ccp(visibleSize.width * 0.5 + 335, visibleSize.height * 0.6 + 120))
		var_2_10:addChild(var_2_19)
	end

	function var_1_0.onEnter(arg_6_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_7_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginTag.astLogin)
end
