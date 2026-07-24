function showDebugStartGame(arg_1_0, arg_1_1)
	arg_1_1.changeUi("startNorml")
	tool.safeRemoveChildByTag(arg_1_0, loginDebugTag.subScene)

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:createWithSpriteFrameName("login_view.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCMenu:create()

		var_2_1:setPosition(ccp(0, 0))
		var_2_0:addChild(var_2_1)

		local var_2_2 = CCSprite:createWithSpriteFrameName("login_input_change.jpg")
		local var_2_3 = CCSprite:createWithSpriteFrameName("login_input_change_c.jpg")
		local var_2_4 = CCMenuItemSprite:create(var_2_2, var_2_3)

		var_2_4:registerScriptTapHandler(arg_1_1.changeToLogin)
		var_2_4:setPosition(ccp(390, 210))
		var_2_1:addChild(var_2_4)

		local var_2_5 = CCSprite:createWithSpriteFrameName("login_input_change.jpg")
		local var_2_6 = CCSprite:createWithSpriteFrameName("login_input_change_c.jpg")
		local var_2_7 = CCMenuItemSprite:create(var_2_5, var_2_6)

		var_2_7:registerScriptTapHandler(arg_1_1.changeToSelectServer)
		var_2_7:setPosition(ccp(390, 125))
		var_2_1:addChild(var_2_7)

		local var_2_8 = CCStrokeLabelTTF:create(language.get(211014), "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_8:setColor(ccc3(84, 72, 57))
		var_2_8:setPosition(ccp(195 - var_2_8:getContentSize().width * 0.5, 210))
		var_2_0:addChild(var_2_8)

		local var_2_9 = CCStrokeLabelTTF:create(language.get(211015), "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_9:setColor(ccc3(84, 72, 57))
		var_2_9:setPosition(ccp(195 - var_2_9:getContentSize().width * 0.5, 125))
		var_2_0:addChild(var_2_9)

		if loginData.userName then
			local var_2_10 = CCLabelTTF:create(loginData.userName, "Thonburi", 24)

			var_2_10:setAnchorPoint(ccp(0, 0.5))
			var_2_10:setPosition(ccp(210, 210))
			var_2_0:addChild(var_2_10)
		end

		if loginData.selectedServer then
			local var_2_11 = CCLabelTTF:create(loginData.selectedServer.serverName, "Thonburi", 24)

			var_2_11:setAnchorPoint(ccp(0, 0.5))
			var_2_11:setPosition(ccp(205, 125))
			var_2_0:addChild(var_2_11)
		end

		local var_2_12 = CCMenu:create()

		var_2_12:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_12)

		local var_2_13 = CCSprite:createWithSpriteFrameName("text_login_begin.png")
		local var_2_14 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
		local var_2_15 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
		local var_2_16 = CCMenuItemSprite:create(var_2_14, var_2_15)

		var_2_16:registerScriptTapHandler(arg_1_1.startGame)
		var_2_16:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
		var_2_13:setPosition(ccp(var_2_14:getContentSize().width * 0.5, var_2_14:getContentSize().height * 0.5))
		var_2_16:addChild(var_2_13)
		var_2_12:addChild(var_2_16)
	end

	function var_1_0.onEnter(arg_3_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_4_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginDebugTag.subScene)
end
