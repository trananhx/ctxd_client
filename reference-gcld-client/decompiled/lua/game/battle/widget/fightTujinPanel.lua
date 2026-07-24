local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = CCSprite:createWithSpriteFrameName("tuijin_citybg.png")

	var_1_0:setPosition(arg_1_2)
	arg_1_0:addChild(var_1_0)

	local var_1_1 = {}

	var_1_1.checked = false

	local var_1_2 = CCSprite:createWithSpriteFrameName("tuijin_citybg_light.png")

	var_1_2:setPosition(ccp(var_1_0:getContentSize().width * 0.5, var_1_0:getContentSize().height * 0.5))
	var_1_2:setVisible(false)
	var_1_0:addChild(var_1_2)

	local var_1_3 = CCStrokeLabelTTF:create(arg_1_1.cityName, "Thonburi", 22)

	var_1_3:setPosition(ccp(var_1_0:getContentSize().width * 0.5, var_1_0:getContentSize().height - 10 - var_1_3:getContentSize().height * 0.5))
	var_1_0:addChild(var_1_3)

	local var_1_4 = CCSprite:createWithSpriteFrameName("tujin_check.png")

	var_1_4:setPosition(ccp(5 + var_1_4:getContentSize().width * 0.5, 5 + var_1_4:getContentSize().height * 0.5))
	var_1_0:addChild(var_1_4)

	local var_1_5 = CCSprite:createWithSpriteFrameName("tujin_ok.png")

	var_1_5:setPosition(ccp(var_1_4:getContentSize().width * 0.5, var_1_4:getContentSize().height * 0.5))
	var_1_5:setVisible(false)
	var_1_4:addChild(var_1_5)

	function var_1_1.ifClick(arg_2_0, arg_2_1, arg_2_2)
		if tool.checkIfTouch(var_1_0, arg_2_1, arg_2_2) then
			arg_2_0:check()

			return true
		end

		return false
	end

	function var_1_1.check(arg_3_0)
		if arg_3_0.checked then
			arg_3_0.checked = false

			var_1_2:setVisible(false)
			var_1_5:setVisible(false)
		else
			arg_3_0.checked = true

			var_1_2:setVisible(true)
			var_1_5:setVisible(true)
		end
	end

	function var_1_1.getChecked(arg_4_0)
		return arg_4_0.checked
	end

	function var_1_1.getCityId(arg_5_0)
		return arg_1_1.cityId
	end

	return var_1_1
end

local function var_0_1(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}

	var_6_0.checked = true

	local var_6_1 = CCSprite:createWithSpriteFrameName("general_background.png")

	var_6_1:setPosition(arg_6_2)
	arg_6_0:addChild(var_6_1)

	local var_6_2 = CCSprite:createWithSpriteFrameName("general_background_light.png")

	var_6_2:setPosition(ccp(var_6_1:getContentSize().width * 0.5, var_6_1:getContentSize().height * 0.5))
	var_6_2:setVisible(var_6_0.checked)
	var_6_1:addChild(var_6_2)

	local var_6_3 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_6_1.gPic))

	var_6_3:setPosition(ccp(var_6_1:getContentSize().width * 0.5, var_6_1:getContentSize().height * 0.5))
	var_6_1:addChild(var_6_3)

	local var_6_4 = CCSprite:createWithSpriteFrameName("tujin_check.png")

	var_6_4:setPosition(ccp(5 + var_6_4:getContentSize().width * 0.5, 5 + var_6_4:getContentSize().height * 0.5))
	var_6_1:addChild(var_6_4)

	local var_6_5 = CCSprite:createWithSpriteFrameName("tujin_ok.png")

	var_6_5:setPosition(ccp(var_6_4:getContentSize().width * 0.5, var_6_4:getContentSize().height * 0.5))
	var_6_5:setVisible(var_6_0.checked)
	var_6_4:addChild(var_6_5)

	local function var_6_6()
		var_6_2:setVisible(var_6_0.checked)
		var_6_5:setVisible(var_6_0.checked)
	end

	function var_6_0.ifClick(arg_8_0, arg_8_1, arg_8_2)
		if tool.checkIfTouch(var_6_1, arg_8_1, arg_8_2) then
			arg_8_0:check()

			return true
		end

		return false
	end

	function var_6_0.check(arg_9_0)
		if arg_9_0.checked then
			arg_9_0.checked = false
		else
			arg_9_0.checked = true
		end

		var_6_6()
	end

	function var_6_0.getChecked(arg_10_0)
		return arg_10_0.checked
	end

	function var_6_0.getGenrealId(arg_11_0)
		return arg_6_1.gId
	end

	return var_6_0
end

function showFightTujinPanel(arg_12_0, arg_12_1, arg_12_2)
	tool.safeRemoveChildByTag(arg_12_0.layerTabel.uiLayer, uiTag.tujin)
	rmgr.loadResource("res/ui/battle/tujing/tujing.plist")

	local var_12_0 = {}
	local var_12_1
	local var_12_2 = {}
	local var_12_3 = createBaseLayer()
	local var_12_4 = CCSprite:createWithSpriteFrameName("panel_action.png")

	var_12_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	var_12_3:addChild(var_12_4)

	local var_12_5

	if arg_12_1 == "tujin" then
		var_12_5 = CCSprite:createWithSpriteFrameName("panel_title_tujing.png")
	else
		var_12_5 = CCSprite:createWithSpriteFrameName("panel_title_chetui.png")
	end

	var_12_5:setPosition(ccp(var_12_4:getContentSize().width * 0.5, var_12_4:getContentSize().height))
	var_12_4:addChild(var_12_5)

	if arg_12_2.cityOptions then
		local var_12_6 = 80
		local var_12_7 = 270
		local var_12_8 = 0

		for iter_12_0, iter_12_1 in pairs(arg_12_2.cityOptions) do
			if iter_12_1.state == 1 then
				var_12_8 = var_12_8 + 1

				local var_12_9 = ccp(var_12_6 + 120 * (var_12_8 - 1), var_12_7)
				local var_12_10 = var_0_0(var_12_4, iter_12_1, var_12_9)

				if iter_12_0 == 1 then
					var_12_1 = var_12_10

					var_12_1:check()
				end

				table.insert(var_12_0, var_12_10)
			end
		end
	end

	if arg_12_2.gIds then
		local var_12_11 = 80
		local var_12_12 = 175

		for iter_12_2, iter_12_3 in pairs(arg_12_2.gIds) do
			local var_12_13 = ccp(var_12_11 + 115 * (iter_12_2 - 1), var_12_12)
			local var_12_14 = var_0_1(var_12_4, iter_12_3, var_12_13)

			table.insert(var_12_2, var_12_14)
		end
	end

	local function var_12_15()
		local var_13_0 = ""
		local var_13_1 = ""

		if not var_12_1 then
			messageBox.alert(language.get(10003), language.get(400054))

			return
		end

		local var_13_2 = var_12_1:getCityId()
		local var_13_3 = false

		for iter_13_0, iter_13_1 in pairs(var_12_2) do
			if iter_13_1:getChecked() then
				var_13_0 = var_13_0 .. tostring(iter_13_1:getGenrealId())
				var_13_0 = var_13_0 .. "#"
				var_13_3 = true
			end
		end

		if var_13_3 then
			if arg_12_1 == "tujin" then
				arg_12_0.doTujin(var_13_2, var_13_0)
			else
				arg_12_0.cheTui(var_13_2, var_13_0)
			end

			tool.safeRemoveChildByTag(arg_12_0.layerTabel.uiLayer, uiTag.tujin)
		else
			messageBox.alert(language.get(190007), language.get(190008))
		end
	end

	local function var_12_16()
		tool.safeRemoveChildByTag(arg_12_0.layerTabel.uiLayer, uiTag.tujin)
	end

	local var_12_17 = CCMenu:create()

	var_12_17:setPosition(ccp(0, 0))
	var_12_4:addChild(var_12_17)

	local var_12_18 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
	local var_12_19 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
	local var_12_20 = CCStrokeLabelTTF:create(language.get(190009), "Thonburi", 22)

	var_12_20:setPosition(ccp(var_12_18:getContentSize().width * 0.5, var_12_18:getContentSize().height * 0.5))

	local var_12_21 = CCMenuItemSprite:create(var_12_18, var_12_19)

	var_12_21:addChild(var_12_20)
	var_12_21:registerScriptTapHandler(var_12_15)
	var_12_21:setPosition(ccp(170, 55))
	var_12_17:addChild(var_12_21)

	local var_12_22 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
	local var_12_23 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
	local var_12_24 = CCStrokeLabelTTF:create(language.get(190010), "Thonburi", 22)

	var_12_24:setPosition(ccp(var_12_18:getContentSize().width * 0.5, var_12_18:getContentSize().height * 0.5))

	local var_12_25 = CCMenuItemSprite:create(var_12_22, var_12_23)

	var_12_25:addChild(var_12_24)
	var_12_25:registerScriptTapHandler(var_12_16)
	var_12_25:setPosition(ccp(455, 55))
	var_12_17:addChild(var_12_25)

	local function var_12_26(arg_15_0, arg_15_1, arg_15_2)
		log.info(" @@@ onTouch")

		if arg_15_0 == CCTOUCHBEGAN then
			for iter_15_0, iter_15_1 in pairs(var_12_0) do
				if iter_15_1:ifClick(arg_15_1, arg_15_2) then
					if var_12_1 then
						var_12_1:check()
					end

					var_12_1 = iter_15_1

					break
				end
			end

			for iter_15_2, iter_15_3 in pairs(var_12_2) do
				if iter_15_3:ifClick(arg_15_1, arg_15_2) then
					break
				end
			end
		elseif arg_15_0 == CCTOUCHMOVED then
			-- block empty
		elseif arg_15_0 == CCTOUCHENDED then
			-- block empty
		end

		log.info(" @@@ here", arg_15_1, arg_15_2)

		return true
	end

	var_12_3:setTouchEnabled(true)
	var_12_3:registerScriptTouchHandler(var_12_26, false, true)
	arg_12_0.layerTabel.uiLayer:addChild(var_12_3, 100, uiTag.tujin)
end
