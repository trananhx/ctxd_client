return {
	init = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		arg_1_0.contentWidth = 900
		arg_1_0.msgNum = 0
		arg_1_0.control = arg_1_2
		arg_1_0.offsetY = 0
		arg_1_0.viewWidth = 900
		arg_1_0.viewHeight = 430
		arg_1_0.scrollView = CCScrollView:create()

		arg_1_0.scrollView:setViewSize(CCSizeMake(arg_1_0.viewWidth, arg_1_0.viewHeight))
		arg_1_0.scrollView:setDirection(kCCScrollViewDirectionVertical)
		arg_1_0.scrollView:setBounceable(true)
		arg_1_0.scrollView:setPosition(ccp(30, 120))

		arg_1_0.msgLayer = CCLayerColor:create(ccc4(255, 0, 0, 50))
		arg_1_0.subMessageLayer = createBaseLayer()

		arg_1_0.msgLayer:addChild(arg_1_0.subMessageLayer)
		arg_1_0.scrollView:setContainer(arg_1_0.msgLayer)
		arg_1_0.scrollView:setContentSize(CCSizeMake(arg_1_0.contentWidth, 0))

		for iter_1_0, iter_1_1 in pairs(arg_1_3) do
			if arg_1_2.checkHasInBlackList(iter_1_1.from) then
				table.remove(arg_1_3, iter_1_0)
			else
				arg_1_0:appendMsg(iter_1_1)
			end
		end

		if arg_1_1 then
			arg_1_1:addChild(arg_1_0.scrollView)
		end
	end,
	appendMsg = function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_0.control:parseMessage(arg_2_1)

		if var_2_0 then
			local var_2_1 = {}

			arg_2_0.control:parseHtmlToList(var_2_0, var_2_1)

			local var_2_2 = {}

			for iter_2_0, iter_2_1 in pairs(var_2_1) do
				local var_2_3

				if iter_2_1.type == "label" then
					var_2_3 = CCLabelTTF:create(iter_2_1.text, "Thonburi", 26)

					var_2_3:setColor(tool.hexToRgb(iter_2_1.color))
				elseif iter_2_1.type == "button" then
					var_2_3 = CCControlButton:create(iter_2_1.text, "Thonburi", 26)

					var_2_3:setTitleColorForState(ccc3(175, 217, 104), CCControlStateNormal)
					var_2_3:setTitleColorForState(ccc3(175, 217, 104), CCControlStateHighlighted)
					var_2_3:setTitleColorForState(ccc3(175, 217, 104), CCControlStateSelected)
					var_2_3:addHandleOfControlEvent(arg_2_0.control.clickNameOnMessageView, CCControlEventTouchUpInside)
				elseif iter_2_1.type == "voiceButton" then
					local var_2_4 = CCScale9Sprite:createWithSpriteFrameName("chat_voice_player.png")
					local var_2_5 = CCScale9Sprite:createWithSpriteFrameName("chat_voice_player_click.png")

					var_2_3 = CCControlButton:create(var_2_4)

					var_2_3:setBackgroundSpriteForState(var_2_5, CCControlStateHighlighted)
					var_2_3:setPreferredSize(CCSizeMake(52, 48))

					local var_2_6 = CCString:create(iter_2_1.data)

					var_2_3:setUserObject(var_2_6)
					var_2_3:addHandleOfControlEvent(arg_2_0.control.onPlayerVoice, CCControlEventTouchUpInside)
				elseif iter_2_1.type == "link" then
					var_2_3 = CCControlButton:create(iter_2_1.text, "Thonburi", 26)

					if iter_2_1.color then
						local var_2_7 = tool.hexToRgb(iter_2_1.color)

						var_2_3:setTitleColorForState(var_2_7, CCControlStateNormal)
						var_2_3:setTitleColorForState(var_2_7, CCControlStateHighlighted)
						var_2_3:setTitleColorForState(var_2_7, CCControlStateSelected)
					end

					local var_2_8 = CCString:create(iter_2_1.data)

					var_2_3:setUserObject(var_2_8)
					var_2_3:addHandleOfControlEvent(arg_2_0.control.openUrl, CCControlEventTouchUpInside)
				end

				if var_2_3 then
					table.insert(var_2_2, var_2_3)
				end
			end

			local var_2_9
			local var_2_10 = createMultiLineRichNode2(var_2_2)

			arg_2_0.msgNum = arg_2_0.msgNum + 1

			local var_2_11 = arg_2_0.msgNum % 2

			if var_2_11 == 0 then
				var_2_11 = 2
			end

			local var_2_12 = string.format("chat_list_bg%d.jpg", var_2_11)
			local var_2_13 = CCScale9Sprite:createWithSpriteFrameName(var_2_12, CCRectMake(0, 0, 0, 0))
			local var_2_14 = var_2_10:getContentSize().height + 34

			var_2_13:setPreferredSize(CCSizeMake(905, var_2_14))
			var_2_13:setPosition(450, -arg_2_0.offsetY - var_2_13:getContentSize().height * 0.5)
			var_2_10:setPosition(ccp(17, var_2_13:getContentSize().height - 17))
			var_2_13:addChild(var_2_10)

			arg_2_0.offsetY = arg_2_0.offsetY + var_2_13:getContentSize().height

			arg_2_0.subMessageLayer:addChild(var_2_13)
			arg_2_0.subMessageLayer:setPosition(ccp(0, arg_2_0.offsetY))
			arg_2_0.scrollView:setContentSize(CCSizeMake(arg_2_0.contentWidth, arg_2_0.offsetY))
		end
	end
}
