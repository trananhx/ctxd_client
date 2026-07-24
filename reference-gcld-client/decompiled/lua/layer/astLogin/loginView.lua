astLogin = astLogin or {}
astLogin.ui = astLogin.ui or {}

function astLogin.ui.createLoginView(arg_1_0)
	local var_1_0 = CCLayer:create()
	local var_1_1 = CCSprite:createWithSpriteFrameName("login_view.png")

	var_1_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
	var_1_0:addChild(var_1_1)

	local var_1_2 = CCStrokeLabelTTF:create(language.get(211001), "Thonburi", 28, 1, ccc3(207, 182, 128))

	var_1_2:setColor(ccc3(84, 72, 57))
	var_1_2:setAnchorPoint(ccp(1, 0.5))
	var_1_2:setPosition(ccp(200, 210))
	var_1_1:addChild(var_1_2)

	local var_1_3 = CCStrokeLabelTTF:create(language.get(211002), "Thonburi", 28, 1, ccc3(207, 182, 128))

	var_1_3:setColor(ccc3(84, 72, 57))
	var_1_3:setAnchorPoint(ccp(1, 0.5))
	var_1_3:setPosition(ccp(200, 135))
	var_1_1:addChild(var_1_3)

	local var_1_4 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
	local var_1_5 = CCEditBox:create(CCSizeMake(370, 60), var_1_4)

	var_1_5:setPosition(ccp(400, 210))
	var_1_5:setMaxLength(15)
	var_1_5:setReturnType(1)
	var_1_5:setText(arg_1_0.user.name)
	var_1_1:addChild(var_1_5)

	local var_1_6 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
	local var_1_7 = CCEditBox:create(CCSizeMake(370, 60), var_1_6)

	var_1_7:setInputFlag(kEditBoxInputFlagPassword)
	var_1_7:setPosition(ccp(400, 135))
	var_1_7:setMaxLength(50)
	var_1_7:setReturnType(1)
	var_1_7:setText(arg_1_0.user.pwd)
	var_1_1:addChild(var_1_7)

	local function var_1_8()
		arg_1_0.login(var_1_5:getText(), var_1_7:getText())
	end

	local function var_1_9()
		arg_1_0.showRegisterView()
	end

	local var_1_10 = CCMenu:create()

	var_1_10:setPosition(ccp(0, 0))
	var_1_0:addChild(var_1_10)

	local var_1_11 = CCSprite:createWithSpriteFrameName("login_btn_login_a.png")
	local var_1_12 = CCSprite:createWithSpriteFrameName("login_btn_login_c.png")
	local var_1_13 = CCMenuItemSprite:create(var_1_11, var_1_12)

	var_1_13:registerScriptTapHandler(var_1_8)
	var_1_13:setPosition(ccp(visibleSize.width * 0.5 - var_1_11:getContentSize().width * 0.5 - 20, visibleSize.height * 0.2))
	var_1_10:addChild(var_1_13)

	local var_1_14 = CCSprite:createWithSpriteFrameName("login_btn_reg_a.png")
	local var_1_15 = CCSprite:createWithSpriteFrameName("login_btn_reg_c.png")
	local var_1_16 = CCMenuItemSprite:create(var_1_14, var_1_15)

	var_1_16:registerScriptTapHandler(var_1_9)
	var_1_16:setPosition(ccp(visibleSize.width * 0.5 + var_1_14:getContentSize().width * 0.5 + 20, visibleSize.height * 0.2))
	var_1_10:addChild(var_1_16)

	return var_1_0
end
