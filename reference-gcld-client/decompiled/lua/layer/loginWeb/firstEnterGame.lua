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

		local var_2_2 = CCSprite:createWithSpriteFrameName("btn_login_fast_hover.png")
		local var_2_3 = CCSprite:createWithSpriteFrameName("btn_login_fast.png")
		local var_2_4 = GraySprite:createWithSpriteFrame(var_2_2:displayFrame())
		local var_2_5 = CCMenuItemSprite:create(var_2_2, var_2_3, var_2_4)

		var_2_5:registerScriptTapHandler(arg_1_1.fastStart)
		var_2_5:setPosition(ccp(-200, -10))
		var_2_1:addChild(var_2_5)

		if conf.language == "tw" then
			local var_2_6 = CCSprite:create("res/ui/login/btn_login_zhdl_a.png")
			local var_2_7 = CCSprite:create("res/ui/login/btn_login_zhdl_c.png")
			local var_2_8 = GraySprite:createWithSpriteFrame(var_2_6:displayFrame())
			local var_2_9 = CCMenuItemSprite:create(var_2_6, var_2_7, var_2_8)

			var_2_9:registerScriptTapHandler(arg_1_1.astUserLogin)
			var_2_9:setPosition(ccp(200, -10))
			var_2_1:addChild(var_2_9)

			local var_2_10 = CCSprite:create("res/ui/login/btn_login_qtzhdl_a.png")
			local var_2_11 = CCSprite:create("res/ui/login/btn_zh_face.png")

			var_2_11:setAnchorPoint(ccp(1, 0.5))
			var_2_11:setPosition(ccp(0, var_2_10:getContentSize().height * 0.5))
			var_2_10:addChild(var_2_11)

			local var_2_12 = CCSprite:create("res/ui/login/btn_login_qtzhdl_c.png")
			local var_2_13 = CCSprite:create("res/ui/login/btn_zh_face.png")

			var_2_13:setAnchorPoint(ccp(1, 0.5))
			var_2_13:setPosition(ccp(0, var_2_12:getContentSize().height * 0.5))
			var_2_12:addChild(var_2_13)

			local var_2_14 = CCSprite:create("res/ui/login/btn_zh_face.png")
			local var_2_15 = CCMenuItemSprite:create(var_2_10, var_2_12)

			var_2_15:registerScriptTapHandler(function()
				arg_1_1.isAstLogin = false

				channelMgr.login()
			end)
			var_2_15:setPosition(ccp(0, -150))
			var_2_1:addChild(var_2_15)
		end

		if conf.language == "cn" then
			local var_2_16 = "抵制不良游戏，拒绝盗版游戏；适度游戏益脑，沉迷游戏伤身；\n注意保护自我，谨防受骗上当；合理安排时间，享受健康生活。"
			local var_2_17 = CCLabelTTF:create(var_2_16, "Thonburi", 22)

			var_2_17:setColor(ccc3(250, 86, 125))
			var_2_17:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.2))
			var_1_0:addChild(var_2_17)
		end
	end

	function var_1_0.onEnter(arg_4_0)
		var_1_1()
	end

	function var_1_0.onExit(arg_5_0)
		return
	end

	local function var_1_2(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			if not var_1_0:isVisible() then
				return false
			end

			local var_6_0 = var_1_0:getParent()

			while var_6_0 do
				if not var_6_0:isVisible() then
					return false
				end

				var_6_0 = var_6_0:getParent()
			end

			return true
		end
	end

	var_1_0:registerScriptTouchHandler(var_1_2, false, true)
	var_1_0:setTouchEnabled(true)
	arg_1_0:addChild(var_1_0, 0, loginTag.firstStart)
end
