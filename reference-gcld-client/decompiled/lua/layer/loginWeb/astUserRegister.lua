require("lua/layer/loginDebug/astUserProtocal")

function showAstUserRegisterWeb(arg_1_0, arg_1_1)
	arg_1_1.changeUi("register")

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
		var_2_1:setPosition(ccp(225 - var_2_1:getContentSize().width * 0.5, 220))
		var_2_0:addChild(var_2_1)

		local var_2_2 = CCStrokeLabelTTF:create(language.get(211003), "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_2:setColor(ccc3(84, 72, 57))
		var_2_2:setPosition(ccp(225 - var_2_2:getContentSize().width * 0.5, 165))
		var_2_0:addChild(var_2_2)

		local var_2_3 = CCStrokeLabelTTF:create(language.get(211004), "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_3:setColor(ccc3(84, 72, 57))
		var_2_3:setPosition(ccp(225 - var_2_3:getContentSize().width * 0.5, 110))
		var_2_0:addChild(var_2_3)

		local var_2_4 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
		local var_2_5 = CCEditBox:create(CCSizeMake(374, 51), var_2_4)

		var_2_5:setPosition(ccp(420, 220))
		var_2_5:setMaxLength(15)
		var_2_5:setReturnType(1)
		var_2_0:addChild(var_2_5)

		local var_2_6 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
		local var_2_7 = CCEditBox:create(CCSizeMake(374, 51), var_2_6)

		var_2_7:setInputFlag(kEditBoxInputFlagPassword)
		var_2_7:setPosition(ccp(420, 165))
		var_2_7:setMaxLength(50)
		var_2_7:setReturnType(1)
		var_2_0:addChild(var_2_7)

		local var_2_8 = CCStrokeLabelTTF:create("", "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_8:setAnchorPoint(ccp(0, 0.5))
		var_2_8:setPosition(ccp(550, 110))
		var_2_0:addChild(var_2_8)

		local function var_2_9(arg_3_0, arg_3_1)
			local var_3_0 = tolua.cast(arg_3_1, "CCEditBox")

			if arg_3_0 == "changed" then
				if var_3_0:getText() ~= var_2_7:getText() then
					var_2_8:setString(language.get(211005))
					var_2_8:setColor(ccc3(200, 15, 15))
				else
					var_2_8:setString(language.get(211006))
					var_2_8:setColor(ccc3(15, 200, 15))
				end
			end
		end

		local var_2_10 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
		local var_2_11 = CCEditBox:create(CCSizeMake(374, 51), var_2_10)

		var_2_11:setInputFlag(kEditBoxInputFlagPassword)
		var_2_11:setPosition(ccp(420, 110))
		var_2_11:setMaxLength(50)
		var_2_11:setReturnType(1)
		var_2_11:registerScriptEditBoxHandler(var_2_9)
		var_2_0:addChild(var_2_11)

		local function var_2_12()
			if conf.language == "tw" and not arg_1_1.isProtocalChecked then
				return
			end

			local var_4_0 = var_2_5:getText()
			local var_4_1 = var_2_7:getText()

			if var_4_1 ~= var_2_11:getText() then
				messageBox.alert(language.get(211007), language.get(211008))

				return
			else
				arg_1_1.register(var_4_0, var_4_1)
			end
		end

		local function var_2_13()
			arg_1_1.returnToStart()
		end

		local var_2_14 = CCMenu:create()

		var_2_14:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_14)

		if conf.language == "tw" then
			local var_2_15 = CCSprite:createWithSpriteFrameName("login_btn_reg_a.png")
			local var_2_16 = CCSprite:createWithSpriteFrameName("login_btn_reg_c.png")

			if CCUserDefault:sharedUserDefault():getBoolForKey("playerIsVisitor") then
				var_2_15 = CCSprite:createWithSpriteFrameName("btn_bdzh_a.png")
				var_2_16 = CCSprite:createWithSpriteFrameName("btn_bdzh_c.png")
			end

			local var_2_17 = CCMenuItemSprite:create(var_2_15, var_2_16)

			var_2_17:registerScriptTapHandler(var_2_12)
			var_2_17:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.1))

			if not arg_1_1.isProtocalChecked then
				var_2_17:setEnabled(false)
			end

			var_2_14:addChild(var_2_17, 0, 100)
		else
			local var_2_18 = CCSprite:createWithSpriteFrameName("login_btn_reg_a.png")
			local var_2_19 = CCSprite:createWithSpriteFrameName("login_btn_reg_c.png")
			local var_2_20 = CCMenuItemSprite:create(var_2_18, var_2_19)

			var_2_20:registerScriptTapHandler(var_2_12)
			var_2_20:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
			var_2_14:addChild(var_2_20)
		end

		local var_2_21 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_2_22 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_2_23 = CCMenuItemSprite:create(var_2_21, var_2_22)

		var_2_23:registerScriptTapHandler(arg_1_1.returnToLast)
		var_2_23:setPosition(ccp(visibleSize.width * 0.5 + 335, visibleSize.height * 0.6 + 120))
		var_2_14:addChild(var_2_23)

		if conf.language == "tw" then
			local var_2_24 = CCSprite:create("res/ui/login/unite_view_on.png")
			local var_2_25 = CCSprite:create("res/ui/login/unite_view_a.png")
			local var_2_26

			if arg_1_1.isProtocalChecked then
				var_2_26 = CCMenuItemSprite:create(var_2_24, var_2_24)
			else
				var_2_26 = CCMenuItemSprite:create(var_2_25, var_2_25)
			end

			var_2_26:setPosition(ccp(visibleSize.width * 0.5 - 220, visibleSize.height * 0.25 - 10))
			var_2_26:registerScriptTapHandler(function()
				arg_1_1.isProtocalChecked = not arg_1_1.isProtocalChecked

				if arg_1_1.isProtocalChecked then
					local var_6_0 = CCSprite:create("res/ui/login/unite_view_on.png")

					var_2_26:setNormalImage(var_6_0)
					var_2_26:setSelectedImage(var_6_0)
					var_2_14:getChildByTag(100):setEnabled(true)
				else
					local var_6_1 = CCSprite:create("res/ui/login/unite_view_a.png")

					var_2_26:setNormalImage(var_6_1)
					var_2_26:setSelectedImage(var_6_1)
					var_2_14:getChildByTag(100):setEnabled(false)
				end
			end)
			var_2_14:addChild(var_2_26)

			local var_2_27
			local var_2_28 = CCLabelTTF:create("我已閱讀并同意遵守", "Thonburi-Bold", 22)

			var_2_28:setColor(ccc3(204, 176, 145))

			local var_2_29 = CCMenuItemLabel:create(var_2_28)

			var_2_29:setPosition(ccp(visibleSize.width * 0.5 - 90, visibleSize.height * 0.25 - 10))
			var_2_29:enableAction(false)
			var_2_14:addChild(var_2_29)

			local var_2_30 = CCLabelTTF:create("攻城掠地免責聲明", "Thonburi-Bold", 22)

			var_2_30:enableBaseLine(true)
			var_2_30:setColor(ccc3(121, 255, 103))

			local var_2_31 = CCMenuItemLabel:create(var_2_30)

			var_2_31:setPosition(ccp(visibleSize.width * 0.5 + 100, visibleSize.height * 0.25 - 10))
			var_2_31:registerScriptTapHandler(arg_1_1.goToProtocal)
			var_2_31:enableAction(false)
			var_2_14:addChild(var_2_31)
		end
	end

	function var_1_0.onEnter(arg_7_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_8_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginTag.subScene)
end
