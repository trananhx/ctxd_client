function showStartGameWeb(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = 0

		if loginData.isTrailAccount then
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
			arg_1_1.astUserLogin()
		end

		local function var_2_4()
			arg_1_1.closeStartGame()
			arg_1_1.showServerList()
		end

		local var_2_5 = CCStrokeLabelTTF:create("계 정", "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_5:setColor(ccc3(84, 72, 57))
		var_2_5:setPosition(ccp(195 - var_2_5:getContentSize().width * 0.5, 210))
		var_2_1:addChild(var_2_5)

		local var_2_6 = CCStrokeLabelTTF:create("서 버", "Thonburi", 27, 1, ccc3(207, 182, 128))

		var_2_6:setColor(ccc3(84, 72, 57))
		var_2_6:setPosition(ccp(195 - var_2_6:getContentSize().width * 0.5, 125))
		var_2_1:addChild(var_2_6)

		local var_2_7 = CCSprite:createWithSpriteFrameName("login_input_change.jpg")
		local var_2_8 = CCSprite:createWithSpriteFrameName("login_input_change_c.jpg")
		local var_2_9 = CCMenuItemSprite:create(var_2_7, var_2_8)

		var_2_9:registerScriptTapHandler(var_2_3)
		var_2_9:setPosition(ccp(390, 210))
		var_2_2:addChild(var_2_9)

		local var_2_10 = CCSprite:createWithSpriteFrameName("login_input_change.jpg")
		local var_2_11 = CCSprite:createWithSpriteFrameName("login_input_change_c.jpg")
		local var_2_12 = CCMenuItemSprite:create(var_2_10, var_2_11)

		var_2_12:registerScriptTapHandler(var_2_4)
		var_2_12:setPosition(ccp(390, 125))
		var_2_2:addChild(var_2_12)

		if loginData.userName then
			local var_2_13 = CCLabelTTF:create(loginData.userName, "Thonburi", 24)

			var_2_13:setDimensions(CCSizeMake(230, 30))
			var_2_13:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_2_13:setAnchorPoint(ccp(0, 0.5))
			var_2_13:setPosition(ccp(210, 210))
			var_2_1:addChild(var_2_13)
		end

		if loginData.selectedServer then
			local var_2_14 = CCLabelTTF:create(loginData.selectedServer.serverName, "Thonburi", 24)

			var_2_14:setAnchorPoint(ccp(0, 0.5))
			var_2_14:setPosition(ccp(205, 125))
			var_2_1:addChild(var_2_14)
		end

		local var_2_15 = CCMenu:create()

		var_2_15:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_15)

		local var_2_16 = CCSprite:create("res/ui/common/text/login/text_login_begin.png")
		local var_2_17 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
		local var_2_18 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
		local var_2_19 = CCMenuItemSprite:create(var_2_17, var_2_18)
		local var_2_20 = true

		local function var_2_21()
			if var_2_20 then
				arg_1_1.startGame()
			end

			local function var_5_0()
				var_2_20 = true
			end

			var_2_20 = false

			NewTimer(3, var_5_0)
		end

		var_2_19:registerScriptTapHandler(var_2_21)
		var_2_19:setPosition(ccp(visibleSize.width * 0.5 - var_2_0, visibleSize.height * 0.2))
		var_2_16:setPosition(ccp(var_2_17:getContentSize().width * 0.5, var_2_17:getContentSize().height * 0.5))
		var_2_19:addChild(var_2_16)
		var_2_15:addChild(var_2_19)

		if loginData.isTrailAccount then
			local function var_2_22()
				log.info("shouldBind user !!")
				arg_1_1.changeToBindUser()
			end

			local var_2_23 = CCSprite:createWithSpriteFrameName("btn_login_gre_hover.png")
			local var_2_24 = CCSprite:createWithSpriteFrameName("btn_login_gre.png")
			local var_2_25 = CCStrokeLabelTTF:create(language.get(211017), "Thonburi", 30, 1, ccc3(207, 182, 128))
			local var_2_26 = CCMenuItemSprite:create(var_2_23, var_2_24)

			var_2_26:registerScriptTapHandler(var_2_22)
			var_2_26:setPosition(ccp(visibleSize.width * 0.5 + var_2_0, visibleSize.height * 0.2))
			var_2_26:addChild(var_2_25)
			var_2_25:setPosition(ccp(var_2_23:getContentSize().width * 0.5, var_2_23:getContentSize().height * 0.5))
			var_2_15:addChild(var_2_26)
		end

		local var_2_27 = CCMenu:create()

		var_2_27:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_27)

		local var_2_28 = CCSprite:create("res/ui/login/btn_login_tiaokuan_a.png")
		local var_2_29 = CCSprite:create("res/ui/login/btn_login_tiaokuan_c.png")
		local var_2_30 = CCMenuItemSprite:create(var_2_28, var_2_29)

		var_2_30:setAnchorPoint(ccp(1, 0.5))
		var_2_30:setPosition(ccp(visibleSize.width * 0.99, visibleSize.height * 0.9))
		var_2_30:registerScriptTapHandler(arg_1_1.gotoProtocal)
		var_2_27:addChild(var_2_30)

		local var_2_31 = CCSprite:create("res/ui/login/btn_login_facebook_a.png")
		local var_2_32 = CCSprite:create("res/ui/login/btn_login_facebook_c.png")
		local var_2_33 = CCMenuItemSprite:create(var_2_31, var_2_32)

		var_2_33:setAnchorPoint(ccp(1, 0.5))
		var_2_33:setPosition(ccp(visibleSize.width * 0.99, visibleSize.height * 0.9 - 65))
		var_2_33:registerScriptTapHandler(arg_1_1.gotoFBLink)
		var_2_27:addChild(var_2_33)

		if not loginData.isTrailAccount then
			local var_2_34 = CCSprite:create("res/ui/login/btn_login_xiugaimima_a.png")
			local var_2_35 = CCSprite:create("res/ui/login/btn_login_xiugaimima_c.png")
			local var_2_36 = CCMenuItemSprite:create(var_2_34, var_2_35)

			var_2_36:setAnchorPoint(ccp(1, 0.5))
			var_2_36:setPosition(ccp(visibleSize.width * 0.99, visibleSize.height * 0.9 - 65 - 65))
			var_2_36:registerScriptTapHandler(function()
				arg_1_1.changeToChPwd()
			end)
			var_2_27:addChild(var_2_36)
		end

		local var_2_37 = CCSprite:create("res/ui/login/btn_login_back_a.png")
		local var_2_38 = CCSprite:create("res/ui/login/btn_login_back_c.png")
		local var_2_39 = CCMenuItemSprite:create(var_2_37, var_2_38)

		var_2_39:setAnchorPoint(ccp(1, 0))
		var_2_39:setPosition(ccp(visibleSize.width * 0.99, 70))
		var_2_39:registerScriptTapHandler(function()
			cmgr.sendRequestWithoutModal(nil, actions.logout, platform.getFlag())
			channelMgr.logout()
			arg_1_1.returnToFirstEnterGame()
			CCUserDefault:sharedUserDefault():setStringForKey("userName", "")
			CCUserDefault:sharedUserDefault():setStringForKey("userPwd", "")
			CCUserDefault:sharedUserDefault():setBoolForKey("hasEnter", false)
			CCUserDefault:sharedUserDefault():flush()
		end)
		var_2_27:addChild(var_2_39)
	end

	function var_1_0.onEnter(arg_10_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_11_0)
		return
	end

	local function var_1_2(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == CCTOUCHBEGAN then
			if not var_1_0:isVisible() then
				return false
			end

			local var_12_0 = var_1_0:getParent()

			while var_12_0 do
				if not var_12_0:isVisible() then
					return false
				end

				var_12_0 = var_12_0:getParent()
			end

			return true
		end
	end

	var_1_0:registerScriptTouchHandler(var_1_2, false, true)
	var_1_0:setTouchEnabled(true)
	arg_1_0:addChild(var_1_0, 0, loginTag.startGame)
end
