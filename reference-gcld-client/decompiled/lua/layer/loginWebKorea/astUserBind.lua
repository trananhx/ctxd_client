function showAstUserBindWeb(arg_1_0, arg_1_1)
	arg_1_1.changeUi("bind")

	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:createWithSpriteFrameName("login_view.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCStrokeLabelTTF:create(language.get(211001), "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_1:setColor(ccc3(84, 72, 57))
		var_2_1:setPosition(ccp(225 - var_2_1:getContentSize().width * 0.5, 200))
		var_2_0:addChild(var_2_1)

		local var_2_2 = CCStrokeLabelTTF:create(language.get(211002), "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_2:setColor(ccc3(84, 72, 57))
		var_2_2:setPosition(ccp(225 - var_2_2:getContentSize().width * 0.5, 135))
		var_2_0:addChild(var_2_2)

		local var_2_3 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 285, 50))
		local var_2_4 = CCEditBox:create(CCSizeMake(374, 55), var_2_3)

		var_2_4:setPosition(ccp(420, 200))
		var_2_4:setMaxLength(30)
		var_2_4:setReturnType(1)
		var_2_0:addChild(var_2_4)

		local var_2_5 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 285, 50))
		local var_2_6 = CCEditBox:create(CCSizeMake(374, 55), var_2_5)

		var_2_6:setInputFlag(kEditBoxInputFlagPassword)
		var_2_6:setPosition(ccp(420, 135))
		var_2_6:setMaxLength(50)
		var_2_6:setReturnType(1)
		var_2_0:addChild(var_2_6)

		local function var_2_7()
			arg_1_1.bindUser(var_2_4:getText(), var_2_6:getText())
		end

		local function var_2_8()
			arg_1_1.goToRegister()
		end

		local var_2_9 = CCMenu:create()

		var_2_9:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_9)

		local var_2_10 = CCSprite:create("res/ui/common/text/login/text_login_gre_binding.png")
		local var_2_11 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
		local var_2_12 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
		local var_2_13 = CCMenuItemSprite:create(var_2_11, var_2_12)

		var_2_13:registerScriptTapHandler(var_2_7)
		var_2_13:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
		var_2_10:setPosition(ccp(var_2_11:getContentSize().width * 0.5, var_2_11:getContentSize().height * 0.5))
		var_2_13:addChild(var_2_10)
		var_2_9:addChild(var_2_13)

		local var_2_14 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_2_15 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_2_16 = CCMenuItemSprite:create(var_2_14, var_2_15)

		var_2_16:registerScriptTapHandler(arg_1_1.returnToLast)
		var_2_16:setPosition(ccp(visibleSize.width * 0.5 + 335, visibleSize.height * 0.6 + 120))
		var_2_9:addChild(var_2_16)
	end

	function var_1_0.onEnter(arg_5_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_6_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginTag.subScene)
end
