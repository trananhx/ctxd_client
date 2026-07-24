function showStartGame(arg_1_0, arg_1_1)
	tool.safeRemoveChildByTag(arg_1_0, loginTag.subUi)

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:createWithSpriteFrameName("login_view.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCMenu:create()

		var_2_1:setPosition(ccp(0, 0))
		var_2_0:addChild(var_2_1)

		local function var_2_2()
			arg_1_1.closeStartGame()
			arg_1_1.showServerList(true)
		end

		local var_2_3 = CCSprite:createWithSpriteFrameName("login_input_change.jpg")
		local var_2_4 = CCSprite:createWithSpriteFrameName("login_input_change_c.jpg")
		local var_2_5 = CCMenuItemSprite:create(var_2_3, var_2_4)

		var_2_5:registerScriptTapHandler(var_2_2)
		var_2_5:setPosition(ccp(390, 155))
		var_2_1:addChild(var_2_5)

		local var_2_6 = CCStrokeLabelTTF:create(language.get(211015), "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_6:setColor(ccc3(84, 72, 57))
		var_2_6:setPosition(ccp(386.5, 250))
		var_2_0:addChild(var_2_6)

		if loginData.selectedServer then
			local var_2_7 = CCLabelTTF:create(loginData.selectedServer.serverName, "Thonburi", 24)

			var_2_7:setAnchorPoint(ccp(0, 0.5))
			var_2_7:setPosition(ccp(205, 155))
			var_2_0:addChild(var_2_7)
		end

		local var_2_8 = CCMenu:create()

		var_2_8:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_8)

		local var_2_9 = CCSprite:create("res/ui/common/text/login/text_login_begin.png")
		local var_2_10 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
		local var_2_11 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
		local var_2_12 = CCMenuItemSprite:create(var_2_10, var_2_11)
		local var_2_13 = true

		local function var_2_14()
			if var_2_13 then
				arg_1_1.startGame()
			end

			local function var_4_0()
				var_2_13 = true
			end

			performWithDelay(var_2_12, var_4_0, 3)

			var_2_13 = false
		end

		var_2_12:registerScriptTapHandler(var_2_14)
		var_2_12:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
		var_2_9:setPosition(ccp(var_2_10:getContentSize().width * 0.5, var_2_10:getContentSize().height * 0.5))
		var_2_12:addChild(var_2_9)
		var_2_8:addChild(var_2_12)
	end

	function var_1_0.onEnter(arg_6_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_7_0)
		return
	end

	local function var_1_2(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			if not var_1_0:isVisible() then
				return false
			end

			local var_8_0 = var_1_0:getParent()

			while var_8_0 do
				if not var_8_0:isVisible() then
					return false
				end

				var_8_0 = var_8_0:getParent()
			end

			return true
		end
	end

	var_1_0:registerScriptTouchHandler(var_1_2, false, true)
	var_1_0:setTouchEnabled(true)
	arg_1_0:addChild(var_1_0, 0, loginTag.subUi)
end
