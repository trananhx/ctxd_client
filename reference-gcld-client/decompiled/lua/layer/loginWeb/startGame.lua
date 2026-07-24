function showStartGameWeb(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = 0

		if arg_1_2 then
			var_2_0 = 174
		end

		local var_2_1 = CCSprite:createWithSpriteFrameName("login_view.png")

		var_2_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.55))
		var_1_0:addChild(var_2_1)

		local var_2_2 = CCMenu:create()

		var_2_2:setPosition(ccp(0, 0))
		var_2_1:addChild(var_2_2)

		local function var_2_3()
			arg_1_1.closeStartGame()
			arg_1_1.showServerList()
		end

		local var_2_4 = CCSprite:createWithSpriteFrameName("login_input_change.jpg")
		local var_2_5 = CCSprite:createWithSpriteFrameName("login_input_change_c.jpg")
		local var_2_6 = CCMenuItemSprite:create(var_2_4, var_2_5)

		var_2_6:registerScriptTapHandler(var_2_3)
		var_2_6:setPosition(ccp(390, 155))
		var_2_2:addChild(var_2_6)

		local var_2_7 = CCStrokeLabelTTF:create(language.get(211015), "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_7:setColor(ccc3(84, 72, 57))
		var_2_7:setPosition(ccp(386.5, 250))
		var_2_1:addChild(var_2_7)

		if loginData.selectedServer then
			local var_2_8 = CCLabelTTF:create(loginData.selectedServer.serverName, "Thonburi", 24)

			var_2_8:setAnchorPoint(ccp(0, 0.5))
			var_2_8:setPosition(ccp(205, 155))
			var_2_1:addChild(var_2_8)
		end

		local var_2_9 = CCMenu:create()

		var_2_9:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_9)

		local var_2_10 = CCSprite:create("res/ui/common/text/login/text_login_begin.png")
		local var_2_11 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
		local var_2_12 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
		local var_2_13 = CCMenuItemSprite:create(var_2_11, var_2_12)
		local var_2_14 = true

		local function var_2_15()
			if var_2_14 then
				arg_1_1.startGame()
			end

			local function var_4_0()
				var_2_14 = true
			end

			var_2_14 = false

			NewTimer(3, var_4_0)
		end

		var_2_13:registerScriptTapHandler(var_2_15)
		var_2_13:setPosition(ccp(visibleSize.width * 0.5 - var_2_0, visibleSize.height * 0.2))
		var_2_10:setPosition(ccp(var_2_11:getContentSize().width * 0.5, var_2_11:getContentSize().height * 0.5))
		var_2_13:addChild(var_2_10)
		var_2_9:addChild(var_2_13)

		if arg_1_2 then
			local function var_2_16()
				log.info("shouldBind user !!")
				arg_1_1.changeToBindUser()
			end

			local var_2_17 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
			local var_2_18 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
			local var_2_19 = CCStrokeLabelTTF:create(language.get(211017), "Thonburi", 30, 1, ccc3(207, 182, 128))
			local var_2_20 = CCMenuItemSprite:create(var_2_17, var_2_18)

			var_2_20:registerScriptTapHandler(var_2_16)
			var_2_20:setPosition(ccp(visibleSize.width * 0.5 + var_2_0, visibleSize.height * 0.2))
			var_2_20:addChild(var_2_19)
			var_2_19:setPosition(ccp(var_2_17:getContentSize().width * 0.5, var_2_17:getContentSize().height * 0.5))
			var_2_9:addChild(var_2_20)
		end

		local var_2_21 = CCMenu:create()

		var_2_21:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_21)

		local var_2_22 = CCSprite:create("res/ui/login/btn_login_back_a.png")
		local var_2_23 = CCSprite:create("res/ui/login/btn_login_back_c.png")
		local var_2_24 = CCMenuItemSprite:create(var_2_22, var_2_23)

		var_2_24:setAnchorPoint(ccp(0, 1))
		var_2_24:setPosition(ccp(20, visibleSize.height * 0.95))
		var_2_24:registerScriptTapHandler(function()
			log.info("@@ 退出游戏")
			cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			channelMgr.logout()
			arg_1_1.returnToFirstEnterGame()
			CCUserDefault:sharedUserDefault():setStringForKey("userName", "")
			CCUserDefault:sharedUserDefault():setStringForKey("userPwd", "")
			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", false)
			CCUserDefault:sharedUserDefault():flush()
		end)
		var_2_21:addChild(var_2_24)
	end

	function var_1_0.onEnter(arg_8_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_9_0)
		return
	end

	local function var_1_2(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == CCTOUCHBEGAN then
			if not var_1_0:isVisible() then
				return false
			end

			local var_10_0 = var_1_0:getParent()

			while var_10_0 do
				if not var_10_0:isVisible() then
					return false
				end

				var_10_0 = var_10_0:getParent()
			end

			return true
		end
	end

	var_1_0:registerScriptTouchHandler(var_1_2, false, true)
	var_1_0:setTouchEnabled(true)
	arg_1_0:addChild(var_1_0, 0, loginTag.startGame)
end
