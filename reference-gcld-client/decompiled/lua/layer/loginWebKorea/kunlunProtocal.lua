function showKunlunProtocal(arg_1_0, arg_1_1)
	arg_1_1.changeUi("protocal")

	for iter_1_0, iter_1_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_1_0, iter_1_1)
	end

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked")
		local var_2_1 = arg_1_1.isLeftProtocalChecked
		local var_2_2 = arg_1_1.isRightProtocalChecked
		local var_2_3 = CCSprite:create("res/ui/login/mzsm_view_bg.png")

		var_1_0:addChild(var_2_3)
		var_2_3:setPosition(ccp(arg_1_0:getContentSize().width / 2, arg_1_0:getContentSize().height / 2))

		local var_2_4 = CCSprite:create("res/ui/login/mzsm_view_list.png")

		var_2_4:setPosition(ccp(var_2_3:getContentSize().width / 2 - var_2_4:getContentSize().width / 2 - var_2_4:getContentSize().width * 0.05, var_2_3:getContentSize().height / 2 - var_2_3:getContentSize().height * 0.03))
		var_2_3:addChild(var_2_4)

		local var_2_5 = CCSprite:create("res/ui/login/mzsm_tit_sytk.png")

		var_2_5:setAnchorPoint(ccp(0, 1))
		var_2_5:setPosition(ccp(0, var_2_4:getContentSize().height))
		var_2_4:addChild(var_2_5)

		local var_2_6 = createBaseLayer()
		local var_2_7 = {}
		local var_2_8 = 0

		for iter_2_0 = 9, 1, -1 do
			var_2_7[iter_2_0] = CCSprite:create("res/ui/login/mzsm_tit_sytk_0" .. iter_2_0 .. ".png")

			var_2_7[iter_2_0]:setAnchorPoint(ccp(0, 0))
			var_2_7[iter_2_0]:setPosition(ccp(0, var_2_8))

			var_2_8 = var_2_8 + var_2_7[iter_2_0]:getContentSize().height

			var_2_6:addChild(var_2_7[iter_2_0])
		end

		local var_2_9 = CCSizeMake(400, 220)
		local var_2_10 = CCSizeMake(795, var_2_8)
		local var_2_11 = CCScrollView:create(var_2_9)

		var_2_11:setDirection(kCCScrollViewDirectionVertical)
		var_2_11:setBounceable(true)
		var_2_11:setPosition(ccp(0, var_2_4:getContentSize().height * 0.2))
		var_2_11:setContainer(var_2_6)
		var_2_11:setContentSize(var_2_10)
		var_2_11:setContentOffset(ccp(0, var_2_9.height - var_2_10.height))
		var_2_4:addChild(var_2_11)

		if not var_2_0 then
			local var_2_12 = CCMenu:create()

			var_2_12:setPosition(ccp(0, 0))
			var_2_4:addChild(var_2_12)

			local var_2_13 = CCSprite:create("res/ui/login/unite_view_on.png")
			local var_2_14 = CCSprite:create("res/ui/login/unite_view_a.png")
			local var_2_15

			if arg_1_1.isLeftProtocalChecked then
				var_2_15 = CCMenuItemSprite:create(var_2_13, var_2_13)
			else
				var_2_15 = CCMenuItemSprite:create(var_2_14, var_2_14)
			end

			var_2_15:setPosition(ccp(var_2_4:getContentSize().width * 0.2, var_2_4:getContentSize().height * 0.1))
			var_2_15:registerScriptTapHandler(function()
				arg_1_1.isLeftProtocalChecked = not arg_1_1.isLeftProtocalChecked

				if arg_1_1.isLeftProtocalChecked then
					local var_3_0 = CCSprite:create("res/ui/login/unite_view_on.png")

					var_2_15:setNormalImage(var_3_0)
					var_2_15:setSelectedImage(var_3_0)
				else
					local var_3_1 = CCSprite:create("res/ui/login/unite_view_a.png")

					var_2_15:setNormalImage(var_3_1)
					var_2_15:setSelectedImage(var_3_1)
				end
			end)
			var_2_12:addChild(var_2_15)

			local var_2_16 = CCSprite:create("res/ui/login/mzsm_tit_tytk1.png")

			var_2_16:setPosition(ccp(var_2_15:getPositionX() + 150, var_2_15:getPositionY()))
			var_2_4:addChild(var_2_16)
		else
			local var_2_17 = CCSprite:create("res/ui/login/mzsm_tit_yty.png")

			var_2_17:setPosition(ccp(var_2_4:getContentSize().width * 0.5, var_2_4:getContentSize().height * 0.1))
			var_2_4:addChild(var_2_17)
		end

		local var_2_18 = CCSprite:create("res/ui/login/mzsm_view_list.png")

		var_2_18:setPosition(ccp(var_2_3:getContentSize().width / 2 + var_2_4:getContentSize().width / 2 + var_2_4:getContentSize().width * 0.05, var_2_3:getContentSize().height / 2 - var_2_3:getContentSize().height * 0.03))
		var_2_3:addChild(var_2_18)

		local var_2_19 = CCSprite:create("res/ui/login/mzsm_tit_grxx.png")

		var_2_19:setAnchorPoint(ccp(0, 1))
		var_2_19:setPosition(ccp(0, var_2_18:getContentSize().height))
		var_2_18:addChild(var_2_19)

		local var_2_20 = createBaseLayer()
		local var_2_21 = {}
		local var_2_22 = 0

		for iter_2_1 = 4, 1, -1 do
			var_2_21[iter_2_1] = CCSprite:create("res/ui/login/mzsm_tit_grxx_0" .. iter_2_1 .. ".png")

			var_2_21[iter_2_1]:setAnchorPoint(ccp(0, 0))
			var_2_21[iter_2_1]:setPosition(ccp(0, var_2_22))

			var_2_22 = var_2_22 + var_2_21[iter_2_1]:getContentSize().height

			var_2_20:addChild(var_2_21[iter_2_1])
		end

		local var_2_23 = CCSizeMake(400, 220)
		local var_2_24 = CCSizeMake(795, var_2_22)
		local var_2_25 = CCScrollView:create(var_2_23)

		var_2_25:setDirection(kCCScrollViewDirectionVertical)
		var_2_25:setBounceable(true)
		var_2_25:setPosition(ccp(0, var_2_4:getContentSize().height * 0.2))
		var_2_25:setContainer(var_2_20)
		var_2_25:setContentSize(var_2_24)
		var_2_25:setContentOffset(ccp(0, var_2_23.height - var_2_24.height))
		var_2_18:addChild(var_2_25)

		if not var_2_0 then
			local var_2_26 = CCMenu:create()

			var_2_26:setPosition(ccp(0, 0))
			var_2_18:addChild(var_2_26)

			local var_2_27 = CCSprite:create("res/ui/login/unite_view_on.png")
			local var_2_28 = CCSprite:create("res/ui/login/unite_view_a.png")
			local var_2_29

			if arg_1_1.isRightProtocalChecked then
				var_2_29 = CCMenuItemSprite:create(var_2_27, var_2_27)
			else
				var_2_29 = CCMenuItemSprite:create(var_2_28, var_2_28)
			end

			var_2_29:setPosition(ccp(var_2_18:getContentSize().width * 0.2, var_2_18:getContentSize().height * 0.1))
			var_2_29:registerScriptTapHandler(function()
				arg_1_1.isRightProtocalChecked = not arg_1_1.isRightProtocalChecked

				if arg_1_1.isRightProtocalChecked then
					local var_4_0 = CCSprite:create("res/ui/login/unite_view_on.png")

					var_2_29:setNormalImage(var_4_0)
					var_2_29:setSelectedImage(var_4_0)
				else
					local var_4_1 = CCSprite:create("res/ui/login/unite_view_a.png")

					var_2_29:setNormalImage(var_4_1)
					var_2_29:setSelectedImage(var_4_1)
				end
			end)
			var_2_26:addChild(var_2_29)

			local var_2_30 = CCSprite:create("res/ui/login/mzsm_tit_tytk2.png")

			var_2_30:setPosition(ccp(var_2_29:getPositionX() + 150, var_2_29:getPositionY()))
			var_2_18:addChild(var_2_30)
		else
			local var_2_31 = CCSprite:create("res/ui/login/mzsm_tit_yty.png")

			var_2_31:setPosition(ccp(var_2_4:getContentSize().width * 0.5, var_2_4:getContentSize().height * 0.1))
			var_2_18:addChild(var_2_31)
		end

		local var_2_32 = CCMenu:create()

		var_2_32:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_32)

		local var_2_33 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_2_34 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_2_35 = CCMenuItemSprite:create(var_2_33, var_2_34)

		var_2_35:registerScriptTapHandler(function()
			arg_1_1.isLeftProtocalChecked = var_2_1
			arg_1_1.isRightProtocalChecked = var_2_2
			arg_1_1.trigerFastStart = false
			arg_1_1.trigerLogin = false
			arg_1_1.trigerFbLogin = false

			arg_1_1.returnToLast()
		end)
		var_2_35:setPosition(ccp(arg_1_0:getContentSize().width / 2 + var_2_3:getContentSize().width / 2 - 25, arg_1_0:getContentSize().height / 2 + var_2_3:getContentSize().height / 2 - 20))
		var_2_32:addChild(var_2_35)

		if not var_2_0 then
			local var_2_36 = CCSprite:create("res/ui/login/btn_login_affirm_a.png")
			local var_2_37 = CCSprite:create("res/ui/login/btn_login_affirm_c.png")
			local var_2_38 = CCMenuItemSprite:create(var_2_36, var_2_37)

			var_2_38:registerScriptTapHandler(function()
				if arg_1_1.isLeftProtocalChecked and arg_1_1.isRightProtocalChecked then
					CCUserDefault:sharedUserDefault():setBoolForKey("isProtocalChecked", true)
					CCUserDefault:sharedUserDefault():flush()
				end

				if arg_1_1.trigerFastStart then
					arg_1_1.trigerFastStart = false

					if CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked") then
						arg_1_1.fastStart()
					else
						arg_1_1.returnToLast()
					end
				elseif arg_1_1.trigerLogin then
					arg_1_1.trigerLogin = false

					if CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked") then
						arg_1_1.astUserLogin()
					else
						arg_1_1.returnToLast()
					end
				elseif arg_1_1.trigerFbLogin then
					arg_1_1.trigerFbLogin = false

					if CCUserDefault:sharedUserDefault():getBoolForKey("isProtocalChecked") then
						channelMgr.login()
					else
						arg_1_1.returnToLast()
					end
				else
					arg_1_1.returnToLast()
				end
			end)
			var_2_38:setPosition(ccp(arg_1_0:getContentSize().width / 2, arg_1_0:getContentSize().height * 0.1))
			var_2_32:addChild(var_2_38)
		else
			local var_2_39 = CCSprite:create("res/ui/login/btn_login_return_a.png")
			local var_2_40 = CCSprite:create("res/ui/login/btn_login_return_a.png")
			local var_2_41 = CCMenuItemSprite:create(var_2_39, var_2_40)

			var_2_41:registerScriptTapHandler(arg_1_1.returnToLast)
			var_2_41:setPosition(ccp(arg_1_0:getContentSize().width / 2, arg_1_0:getContentSize().height * 0.1))
			var_2_32:addChild(var_2_41)
		end
	end

	function var_1_0.onEnter(arg_7_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_8_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginDebugTag.subScene)
end
