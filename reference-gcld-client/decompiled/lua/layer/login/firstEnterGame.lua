function showFirstEnterGame(arg_1_0, arg_1_1)
	tool.safeRemoveChildByTag(arg_1_0, loginTag.subUi)

	local var_1_0 = createBaseLayer()

	local function var_1_1()
		local var_2_0 = CCSprite:createWithSpriteFrameName("dl_tit_djjr_view.png")

		var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.4))
		var_1_0:addChild(var_2_0)

		local var_2_1 = CCScale9Sprite:createWithSpriteFrameName("dl_tit_djjr.png")
		local var_2_2 = CCScale9Sprite:createWithSpriteFrameName("dl_tit_djjr.png")
		local var_2_3 = CCControlButton:create(var_2_1)

		var_2_3:setPosition(ccp(300.5, 49.5))
		var_2_3:setBackgroundSpriteForState(var_2_2, CCControlStateHighlighted)
		var_2_3:setPreferredSize(CCSizeMake(310, 60))
		var_2_3:setZoomOnTouchDown(false)
		var_2_3:addHandleOfControlEvent(arg_1_1.login, CCControlEventTouchUpInside)
		var_2_0:addChild(var_2_3)

		local var_2_4 = CCArray:create()

		var_2_4:addObject(CCEaseBounce:create(CCScaleTo:create(0.6, 1.1)))
		var_2_4:addObject(CCEaseBounce:create(CCScaleTo:create(0.6, 1)))
		var_2_3:runAction(CCRepeatForever:create(CCSequence:create(var_2_4)))

		if conf.language == "cn" or conf.language == "xm" then
			local var_2_5 = "抵制不良游戏，拒绝盗版游戏；适度游戏益脑，沉迷游戏伤身；注意保护自我，谨防受骗上当；合理安排时间，享受健康生活。"
			local var_2_6 = CCLabelTTF:create(var_2_5, "Thonburi", 22)

			var_2_6:setColor(ccc3(250, 86, 125))
			var_2_6:setAnchorPoint(ccp(0, 0))

			local var_2_7 = var_2_6:getContentSize().width
			local var_2_8 = CCLayer:create()

			var_2_6:setPosition(ccp(0, 0))
			var_2_8:addChild(var_2_6)

			local var_2_9 = CCScrollView:create(CCSizeMake(600, 36), var_2_8)

			var_2_9:setPosition(ccp(visibleSize.width * 0.5 - 300, 8))
			var_2_9:setTouchEnabled(false)
			var_1_0:addChild(var_2_9)

			local var_2_10 = CCArray:create()

			var_2_10:addObject(CCMoveBy:create(30, ccp(-var_2_7, 0)))
			var_2_10:addObject(CCCallFuncN:create(function()
				var_2_8:setPosition(600, 0)
			end))
			var_2_10:addObject(CCDelayTime:create(1))

			local var_2_11 = CCSequence:create(var_2_10)

			var_2_8:runAction(CCRepeatForever:create(var_2_11))
		end

		if channelMgr.currentChannel == channels.iosxy or channelMgr.currentChannel == channels.iosxy_30 then
			local var_2_12 = "游戏著作权人：上海锐战网络科技有限公司\n出版服务单位：浦东电子出版社有限公司\n批准文号：新广出审[2014]496号\n出版物号：ISBN 978-7-89431-222-8"
			local var_2_13 = CCLabelTTF:create(var_2_12, "Thonburi", 20)

			var_2_13:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_2_13:setColor(ccc3(255, 255, 255))
			var_2_13:setAnchorPoint(ccp(0, 1))
			var_2_13:setPosition(platform.getSafeDistance(), visibleSize.height)
			var_1_0:addChild(var_2_13)
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
	arg_1_0:addChild(var_1_0, 0, loginTag.subUi)
end
