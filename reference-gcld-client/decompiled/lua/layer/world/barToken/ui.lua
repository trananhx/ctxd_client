require("lua/game/battle/widget/generalSelector")

function showBarTokenNoticePanel()
	rmgr.loadResource("res/ui/battle/tujing/tujing.plist")
	rmgr.loadResource("res/ui/battle/gyl/gyl.plist")

	local var_1_0 = smgr.getLayer("uiLayer")
	local var_1_1 = createBaseLayer()
	local var_1_2
	local var_1_3 = {
		generalList = {},
		getTip = function(arg_2_0)
			local var_2_0 = ""

			if arg_2_0.state < 2 then
				-- block empty
			elseif arg_2_0.state == 2 then
				var_2_0 = language.get(200201)
			elseif arg_2_0.state == 3 then
				var_2_0 = language.get(200202)
			elseif arg_2_0.state == 6 then
				var_2_0 = language.get(200203)
			elseif arg_2_0.state == 7 then
				var_2_0 = language.get(200204)
			elseif arg_2_0.state == 22 then
				var_2_0 = language.get(200205)
			else
				var_2_0 = language.get(200206)
			end

			return var_2_0
		end
	}

	function var_1_3.handleTokenInfo(arg_3_0)
		local var_3_0 = arg_3_0.action.data
		local var_3_1 = CCSprite:create("res/ui/nation/mwl_tit.png")

		var_3_1:setPosition(ccp(315, 390))

		local var_3_2 = createTimerLabel(var_3_0.countDown, language.get(200207) .. "@M:@S", "Thonburi", 27, nil, nil, nil, ccc3(214, 88, 54))

		var_3_2:setPosition(ccp(315, 330))

		local var_3_3 = CCStrokeLabelTTF:create(language.get(200208), "Thonburi", 27)

		var_3_3:setColor(ccc3(227, 202, 156))

		local var_3_4 = CCSprite:createWithSpriteFrameName("icon_forage.png")
		local var_3_5 = CCStrokeLabelTTF:create(tostring(var_3_0.rewardNum), "Thonburi", 22)

		var_3_5:setColor(ccc3(239, 167, 95))

		local var_3_6 = CCStrokeLabelTTF:create(language.get(200209, var_3_0.rewardNum), "Thonburi", 22)

		var_3_6:setColor(ccc3(172, 166, 159))

		local var_3_7 = createRichNode({
			var_3_3,
			var_3_4,
			var_3_5,
			var_3_6
		}, 0.5)

		if var_1_2 then
			var_1_2:addChild(var_3_1)
			var_1_2:addChild(var_3_2)
			var_3_7:setPosition(ccp(var_1_2:getContentSize().width * 0.5, 120))
			var_1_2:addChild(var_3_7)
		end

		local var_3_8 = arg_3_0.action.data.gArray
		local var_3_9 = 145
		local var_3_10 = 210

		for iter_3_0, iter_3_1 in pairs(var_3_8) do
			local var_3_11 = var_1_3.getTip(iter_3_1)
			local var_3_12 = ccp(var_3_9 + 115 * (iter_3_0 - 1), var_3_10)
			local var_3_13 = createGeneralSelector(var_1_2, var_3_12, iter_3_1.gId, iter_3_1.pic, iter_3_1.state, var_3_11)

			table.insert(var_1_3.generalList, var_3_13)
		end
	end

	function var_1_3.getTokenInfo()
		cmgr.sendRequest(var_1_3.handleTokenInfo, actions.getReplyMWLInfo)
	end

	function var_1_3.close()
		var_1_0:removeChild(var_1_1, true)
	end

	function var_1_3.joinBarToken(arg_6_0)
		eventManager.dispatchEvent("replyBarToken")
		var_1_3.close()
	end

	function var_1_3.ok()
		local var_7_0 = ""

		for iter_7_0, iter_7_1 in pairs(var_1_3.generalList) do
			if iter_7_1:getChecked() then
				var_7_0 = var_7_0 .. tostring(iter_7_1:getGenrealId()) .. "#"
			end
		end

		if string.len(var_7_0) > 0 then
			cmgr.sendRequest(var_1_3.joinBarToken, actions.replyManWangLing, var_7_0)
		else
			var_1_3.close()
		end
	end

	function var_1_3.initPanel()
		var_1_2 = CCSprite:createWithSpriteFrameName("gyl_view_bg.png")

		var_1_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 25))
		var_1_1:addChild(var_1_2)

		local var_8_0 = CCMenu:create()

		var_8_0:setPosition(ccp(0, 0))
		var_1_2:addChild(var_8_0)

		local var_8_1 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
		local var_8_2 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
		local var_8_3 = CCStrokeLabelTTF:create(language.get(200210), "Thonburi", 20, 2, colorText[10005])

		var_8_3:setColor(colorText[10004])
		var_8_3:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.5))

		local var_8_4 = CCMenuItemSprite:create(var_8_1, var_8_2)

		var_8_4:addChild(var_8_3)
		var_8_4:registerScriptTapHandler(var_1_3.ok)
		var_8_4:setPosition(ccp(170, 55))
		var_8_0:addChild(var_8_4)

		local var_8_5 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
		local var_8_6 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
		local var_8_7 = CCStrokeLabelTTF:create(language.get(200211), "Thonburi", 20, 2, colorText[10005])

		var_8_7:setColor(colorText[10004])
		var_8_7:setPosition(ccp(var_8_1:getContentSize().width * 0.5, var_8_1:getContentSize().height * 0.5))

		local var_8_8 = CCMenuItemSprite:create(var_8_5, var_8_6)

		var_8_8:addChild(var_8_7)
		var_8_8:registerScriptTapHandler(var_1_3.close)
		var_8_8:setPosition(ccp(455, 55))
		var_8_0:addChild(var_8_8)
	end

	local function var_1_4(arg_9_0, arg_9_1, arg_9_2)
		log.info(" @@@ onTouch")

		if arg_9_0 == CCTOUCHBEGAN then
			for iter_9_0, iter_9_1 in pairs(var_1_3.generalList) do
				if iter_9_1:ifClick(arg_9_1, arg_9_2) then
					break
				end
			end
		end

		return true
	end

	var_1_3.initPanel()
	var_1_3.getTokenInfo()
	var_1_1:setTouchEnabled(true)
	var_1_1:registerScriptTouchHandler(var_1_4, false, true)
	var_1_0:addChild(var_1_1)
end
