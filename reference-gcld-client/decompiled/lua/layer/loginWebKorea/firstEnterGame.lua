function showFirstEnterGameWeb(arg_1_0, arg_1_1)
	log.info("show first enter game web!!!!")
	arg_1_1.changeUi("first")

	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:create("res/ui/common/text/login/text_login_sanguo.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.7))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCMenu:create()

		var_1_0:addChild(var_2_1)

		if platform.getFlag() == "MOBILE_ANDROID" then
			local var_2_2 = CCSprite:createWithSpriteFrameName("btn_login_fast.png")
			local var_2_3 = CCSprite:createWithSpriteFrameName("btn_login_fast_hover.png")
			local var_2_4 = GraySprite:createWithSpriteFrame(var_2_2:displayFrame())
			local var_2_5 = CCMenuItemSprite:create(var_2_2, var_2_3, var_2_4)

			var_2_5:registerScriptTapHandler(function()
				if CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked") then
					arg_1_1.fastStart()
				else
					arg_1_1.trigerFastStart = true

					arg_1_1.gotoProtocal()
				end
			end)
			var_2_5:setPosition(ccp(-200, -10))
			var_2_1:addChild(var_2_5)
		end

		local var_2_6 = CCSprite:create("res/ui/login/btn_login_zhdl_a.png")
		local var_2_7 = CCSprite:create("res/ui/login/btn_login_zhdl_c.png")
		local var_2_8 = GraySprite:createWithSpriteFrame(var_2_6:displayFrame())
		local var_2_9 = CCMenuItemSprite:create(var_2_6, var_2_7, var_2_8)

		var_2_9:registerScriptTapHandler(function()
			if CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked") then
				arg_1_1.astUserLogin()
			else
				arg_1_1.trigerLogin = true

				arg_1_1.gotoProtocal()
			end
		end)
		var_2_9:setPosition(ccp(200, -10))
		var_2_1:addChild(var_2_9)

		local var_2_10 = CCSprite:create("res/ui/login/btn_login_qtzhdl_a.png")
		local var_2_11 = CCSprite:create("res/ui/login/btn_zh_face.png")

		var_2_11:setAnchorPoint(ccp(1, 0.5))
		var_2_11:setPosition(ccp(0, var_2_10:getContentSize().height * 0.5))
		var_2_10:addChild(var_2_11)

		local var_2_12 = CCStrokeLabelTTF:create("기타 아이디 로그인", "Thonburi", 30)

		var_2_12:setPosition(ccp(var_2_10:getContentSize().width * 0.5, var_2_10:getContentSize().height * 0.5))
		var_2_10:addChild(var_2_12)

		local var_2_13 = CCSprite:create("res/ui/login/btn_login_qtzhdl_c.png")
		local var_2_14 = CCSprite:create("res/ui/login/btn_zh_face.png")

		var_2_14:setAnchorPoint(ccp(1, 0.5))
		var_2_14:setPosition(ccp(0, var_2_13:getContentSize().height * 0.5))
		var_2_13:addChild(var_2_14)

		local var_2_15 = CCStrokeLabelTTF:create("기타 아이디 로그인", "Thonburi", 30)

		var_2_15:setPosition(ccp(var_2_13:getContentSize().width * 0.5, var_2_13:getContentSize().height * 0.5))
		var_2_13:addChild(var_2_15)

		local var_2_16 = CCSprite:create("res/ui/login/btn_zh_face.png")
		local var_2_17 = CCMenuItemSprite:create(var_2_10, var_2_13)

		var_2_17:registerScriptTapHandler(function()
			if CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked") then
				channelMgr.login()
			else
				arg_1_1.trigerFbLogin = true

				arg_1_1.gotoProtocal()
			end
		end)

		if platform.getFlag() == "MOBILE_ANDROID" then
			var_2_17:setPosition(ccp(0, -150))
		else
			var_2_17:setPosition(ccp(-200, -10))
		end

		var_2_1:addChild(var_2_17)
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
	arg_1_0:addChild(var_1_0, 0, loginTag.firstStart)
end
