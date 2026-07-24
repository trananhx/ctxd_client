astLogin = astLogin or {}
astLogin.ui = astLogin.ui or {}

function astLogin.ui.createRegisterView(arg_1_0)
	local var_1_0 = CCLayer:create()
	local var_1_1 = CCSprite:createWithSpriteFrameName("login_view.png")

	var_1_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
	var_1_0:addChild(var_1_1)

	local var_1_2 = CCStrokeLabelTTF:create(language.get(211001), "Thonburi", 28, 1, ccc3(207, 182, 128))

	var_1_2:setColor(ccc3(84, 72, 57))
	var_1_2:setPosition(ccp(225 - var_1_2:getContentSize().width * 0.5, 220))
	var_1_1:addChild(var_1_2)

	local var_1_3 = CCStrokeLabelTTF:create(language.get(211003), "Thonburi", 28, 1, ccc3(207, 182, 128))

	var_1_3:setColor(ccc3(84, 72, 57))
	var_1_3:setPosition(ccp(225 - var_1_3:getContentSize().width * 0.5, 165))
	var_1_1:addChild(var_1_3)

	local var_1_4 = CCStrokeLabelTTF:create(language.get(211004), "Thonburi", 28, 1, ccc3(207, 182, 128))

	var_1_4:setColor(ccc3(84, 72, 57))
	var_1_4:setPosition(ccp(225 - var_1_4:getContentSize().width * 0.5, 110))
	var_1_1:addChild(var_1_4)

	local var_1_5 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
	local var_1_6 = CCEditBox:create(CCSizeMake(374, 51), var_1_5)

	var_1_6:setPosition(ccp(420, 220))
	var_1_6:setMaxLength(15)
	var_1_6:setReturnType(1)
	var_1_1:addChild(var_1_6)

	local var_1_7 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
	local var_1_8 = CCEditBox:create(CCSizeMake(374, 51), var_1_7)

	var_1_8:setInputFlag(kEditBoxInputFlagPassword)
	var_1_8:setPosition(ccp(420, 165))
	var_1_8:setMaxLength(50)
	var_1_8:setReturnType(1)
	var_1_1:addChild(var_1_8)

	local var_1_9 = CCStrokeLabelTTF:create("", "Thonburi", 27, 1, ccc3(207, 182, 128))

	var_1_9:setAnchorPoint(ccp(0, 0.5))
	var_1_9:setPosition(ccp(550, 110))
	var_1_1:addChild(var_1_9)

	local function var_1_10(arg_2_0, arg_2_1)
		local var_2_0 = tolua.cast(arg_2_1, "CCEditBox")

		if arg_2_0 == "changed" then
			if var_2_0:getText() ~= var_1_8:getText() then
				var_1_9:setString(language.get(211005))
				var_1_9:setColor(ccc3(200, 15, 15))
			else
				var_1_9:setString(language.get(211006))
				var_1_9:setColor(ccc3(15, 200, 15))
			end
		end
	end

	local var_1_11 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
	local var_1_12 = CCEditBox:create(CCSizeMake(374, 51), var_1_11)

	var_1_12:setInputFlag(kEditBoxInputFlagPassword)
	var_1_12:setPosition(ccp(420, 110))
	var_1_12:setMaxLength(50)
	var_1_12:setReturnType(1)
	var_1_12:registerScriptEditBoxHandler(var_1_10)
	var_1_1:addChild(var_1_12)

	local function var_1_13()
		local var_3_0 = var_1_6:getText()
		local var_3_1 = var_1_8:getText()

		if var_3_1 ~= var_1_12:getText() then
			messageBox.alert(language.get(211007), language.get(211008))

			return
		end

		arg_1_0.register(var_3_0, var_3_1)
	end

	local function var_1_14()
		arg_1_0.showLoginView()
	end

	local var_1_15 = CCMenu:create()

	var_1_15:setPosition(ccp(0, 0))
	var_1_0:addChild(var_1_15)

	local var_1_16 = CCSprite:createWithSpriteFrameName("login_btn_reg_a.png")
	local var_1_17 = CCSprite:createWithSpriteFrameName("login_btn_reg_c.png")
	local var_1_18 = CCMenuItemSprite:create(var_1_16, var_1_17)

	var_1_18:registerScriptTapHandler(var_1_13)
	var_1_18:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
	var_1_15:addChild(var_1_18)

	local var_1_19 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
	local var_1_20 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
	local var_1_21 = CCMenuItemSprite:create(var_1_19, var_1_20)

	var_1_21:registerScriptTapHandler(var_1_14)
	var_1_21:setPosition(ccp(visibleSize.width * 0.5 + 335, visibleSize.height * 0.6 + 120))
	var_1_15:addChild(var_1_21)

	return var_1_0
end
