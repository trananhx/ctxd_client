function showProtocal(arg_1_0, arg_1_1)
	arg_1_1.changeUi("protocal")
	tool.safeRemoveChildByTag(arg_1_0, loginDebugTag.subScene)

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:create("res/ui/login/mzsm_view_bg.png")

		var_2_0:setPosition(ccp(arg_1_0:getContentSize().width / 2, arg_1_0:getContentSize().height / 2))
		var_1_0:addChild(var_2_0)

		local var_2_1 = createBaseLayer()
		local var_2_2 = {}
		local var_2_3 = 0

		for iter_2_0 = 4, 1, -1 do
			var_2_2[iter_2_0] = CCSprite:create("res/ui/login/mzsm_text_" .. iter_2_0 .. ".png")

			var_2_2[iter_2_0]:setAnchorPoint(ccp(0, 0))
			var_2_2[iter_2_0]:setPosition(ccp(0, var_2_3))

			var_2_3 = var_2_3 + var_2_2[iter_2_0]:getContentSize().height

			var_2_1:addChild(var_2_2[iter_2_0])
		end

		local var_2_4 = CCSizeMake(800, 330)
		local var_2_5 = CCSizeMake(795, var_2_3)
		local var_2_6 = CCScrollView:create(var_2_4)

		var_2_6:setDirection(kCCScrollViewDirectionVertical)
		var_2_6:setBounceable(true)
		var_2_6:setPosition(ccp(arg_1_0:getContentSize().width / 2 - var_2_4.width / 2, 140))
		var_2_6:setContainer(var_2_1)
		var_2_6:setContentSize(var_2_5)
		var_2_6:setContentOffset(ccp(0, var_2_4.height - var_2_5.height))
		var_1_0:addChild(var_2_6)

		local var_2_7 = CCMenu:create()

		var_2_7:setPosition(ccp(0, 0))
		var_1_0:addChild(var_2_7)

		local var_2_8 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_2_9 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_2_10 = CCMenuItemSprite:create(var_2_8, var_2_9)

		var_2_10:registerScriptTapHandler(arg_1_1.returnToLast)
		var_2_10:setPosition(ccp(arg_1_0:getContentSize().width / 2 + var_2_0:getContentSize().width / 2 - 25, arg_1_0:getContentSize().height / 2 + var_2_0:getContentSize().height / 2 - 20))
		var_2_7:addChild(var_2_10)

		local var_2_11 = CCSprite:create("res/ui/login/btn_back.png")
		local var_2_12 = CCSprite:create("res/ui/login/btn_back_highlight.png")
		local var_2_13 = CCMenuItemSprite:create(var_2_11, var_2_12)

		var_2_13:registerScriptTapHandler(arg_1_1.returnToLast)
		var_2_13:setPosition(ccp(arg_1_0:getContentSize().width / 2, arg_1_0:getContentSize().height * 0.1))
		var_2_7:addChild(var_2_13)
	end

	function var_1_0.onEnter(arg_3_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_4_0)
		return
	end

	arg_1_0:addChild(var_1_0, 0, loginDebugTag.subScene)
end
