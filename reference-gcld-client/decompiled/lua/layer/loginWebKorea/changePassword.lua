function showChangePassword(arg_1_0, arg_1_1)
	arg_1_1.changeUi("changePassword")

	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:createWithSpriteFrameName("login_view.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCStrokeLabelTTF:create("기존 비밀번호", "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_1:setColor(ccc3(84, 72, 57))
		var_2_1:setPosition(ccp(225 - var_2_1:getContentSize().width * 0.5, 220))
		var_2_0:addChild(var_2_1)

		local var_2_2 = CCStrokeLabelTTF:create("신규 비밀번호", "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_2:setColor(ccc3(84, 72, 57))
		var_2_2:setPosition(ccp(225 - var_2_2:getContentSize().width * 0.5, 165))
		var_2_0:addChild(var_2_2)

		local var_2_3 = CCStrokeLabelTTF:create("비밀번호 확인", "Thonburi", 28, 1, ccc3(207, 182, 128))

		var_2_3:setColor(ccc3(84, 72, 57))
		var_2_3:setPosition(ccp(225 - var_2_3:getContentSize().width * 0.5, 110))
		var_2_0:addChild(var_2_3)

		local var_2_4 = CCScale9Sprite:createWithSpriteFrameName("login_input.jpg", CCRectMake(0, 0, 255, 40))
		local var_2_5 = CCEditBox:create(CCSizeMake(374, 51), var_2_4)

		var_2_5:setInputFlag(kEditBoxInputFlagPassword)
		var_2_5:setPosition(ccp(420, 220))
		var_2_5:setMaxLength(50)
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
		var_2_0:addChild(var_2_11)

		local function var_2_12()
			local var_4_0 = var_2_5:getText()
			local var_4_1 = var_2_7:getText()

			if var_4_1 ~= var_2_11:getText() then
				messageBox.alert(language.get(211007), language.get(211008))

				return
			elseif string.len(var_4_1) < 6 or string.len(var_4_1) > 20 then
				messageBox.alert(language.get(211007), "비밀번호가 정확하지 않습니다.6-20자리 영문 또는 숫자여야 합니다.")

				return
			end

			arg_1_1.changePassword(loginData.userName, var_4_0, var_4_1)
			var_2_5:setText("")
			var_2_7:setText("")
			var_2_11:setText("")
		end

		local function var_2_13()
			arg_1_1.returnToStart()
		end

		local var_2_14 = CCMenu:create()

		var_2_14:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_14)

		local var_2_15 = CCSprite:create("res/ui/login/btn_login_xgmm_a.png")
		local var_2_16 = CCSprite:create("res/ui/login/btn_login_xgmm_c.png")
		local var_2_17 = CCMenuItemSprite:create(var_2_15, var_2_16)

		var_2_17:registerScriptTapHandler(var_2_12)
		var_2_17:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
		var_2_14:addChild(var_2_17)

		local var_2_18 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_2_19 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_2_20 = CCMenuItemSprite:create(var_2_18, var_2_19)

		var_2_20:registerScriptTapHandler(arg_1_1.returnToLast)
		var_2_20:setPosition(ccp(visibleSize.width * 0.5 + 335, visibleSize.height * 0.6 + 120))
		var_2_14:addChild(var_2_20)
	end

	function var_1_0.onEnter(arg_6_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_7_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginTag.subScene)
end
