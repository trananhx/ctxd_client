local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1
	local var_1_2 = "server_list_view.png"
	local var_1_3 = "server_list_view_hover.png"

	if arg_1_2.isHistory then
		var_1_1 = "server_soon.png"
		var_1_2 = "server_list_green.png"
		var_1_3 = "server_list_green_hover.png"
	elseif arg_1_2.isNewServer then
		var_1_1 = "server_new.png"
	end

	local var_1_4 = CCSprite:createWithSpriteFrameName(var_1_2)

	var_1_4:setPosition(arg_1_1)

	local var_1_5 = CCSprite:createWithSpriteFrameName(var_1_3)

	var_1_5:setPosition(ccp(var_1_4:getContentSize().width * 0.5, var_1_4:getContentSize().height * 0.5))
	var_1_5:setVisible(false)
	var_1_4:addChild(var_1_5)

	local var_1_6 = CCLabelTTF:create(arg_1_2.serverName, "Thonburi", 22)

	var_1_6:setColor(ccc3(204, 176, 145))
	var_1_6:setPosition(ccp(var_1_4:getContentSize().width * 0.5, var_1_4:getContentSize().height * 0.5))
	var_1_4:addChild(var_1_6)
	arg_1_0:addChild(var_1_4)

	if var_1_1 then
		local var_1_7 = CCSprite:createWithSpriteFrameName(var_1_1)

		var_1_7:setScale(0.8)
		var_1_7:setPosition(ccp(0, var_1_4:getContentSize().height - 12))
		var_1_4:addChild(var_1_7)
	end

	function var_1_0.ifClick(arg_2_0, arg_2_1, arg_2_2)
		if tool.checkIfTouch(var_1_4, arg_2_1, arg_2_2) then
			var_1_5:setVisible(true)

			return true
		end

		var_1_5:setVisible(false)

		return false
	end

	function var_1_0.getServer(arg_3_0)
		return arg_1_2
	end

	return var_1_0
end

function showDebugSelectServer(arg_4_0, arg_4_1)
	arg_4_1.changeUi("select")
	tool.safeRemoveChildByTag(arg_4_0, loginDebugTag.subScene)

	local var_4_0 = createBaseLayer()
	local var_4_1 = {}
	local var_4_2 = 0
	local var_4_3 = 0

	local function var_4_4()
		local var_5_0 = {}
		local var_5_1 = {}

		if not loginData.gamehistory then
			return var_5_0
		end

		local var_5_2 = table.getn(loginData.gamehistory)

		if var_5_2 > 2 then
			var_5_2 = 2
		end

		for iter_5_0 = 1, var_5_2 do
			local var_5_3 = loginData.gamehistory[iter_5_0]

			var_5_3.isHistory = true

			table.insert(var_5_0, var_5_3)

			var_5_1[var_5_3.serverId] = true
		end

		local var_5_4 = 3 - var_5_2

		for iter_5_1, iter_5_2 in pairs(loginData.newestserver) do
			if var_5_4 < iter_5_1 then
				break
			end

			iter_5_2.isNewServer = true

			if not var_5_1[iter_5_2.serverId] then
				table.insert(var_5_0, iter_5_2)

				var_5_1[iter_5_2.serverId] = true
			end
		end

		for iter_5_3, iter_5_4 in pairs(loginData.gameservers) do
			if not var_5_1[iter_5_4.serverId] then
				table.insert(var_5_0, iter_5_4)
			end
		end

		return var_5_0
	end

	local function var_4_5()
		local var_6_0 = CCSprite:createWithSpriteFrameName("server_view.png")

		var_6_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_4_0:addChild(var_6_0)

		local var_6_1 = createBaseLayer()
		local var_6_2 = var_4_4()
		local var_6_3 = table.getn(var_6_2)
		local var_6_4 = 20
		local var_6_5 = 10
		local var_6_6 = 151
		local var_6_7 = 46
		local var_6_8 = var_6_5 + math.ceil(var_6_3 / 3) * (36 + var_6_5)
		local var_6_9 = 95
		local var_6_10 = var_6_8 - var_6_5 - 18

		for iter_6_0, iter_6_1 in pairs(var_6_2) do
			local var_6_11 = (iter_6_0 - 1) % 3 * (var_6_6 + var_6_4)
			local var_6_12 = math.floor((iter_6_0 - 1) / 3) * (var_6_7 + var_6_5)
			local var_6_13 = var_0_0(var_6_1, ccp(var_6_9 + var_6_11, var_6_10 - var_6_12), iter_6_1)

			table.insert(var_4_1, var_6_13)
		end

		local var_6_14 = CCScrollView:create()

		var_6_14:setViewSize(CCSizeMake(520, 320))
		var_6_14:setDirection(kCCScrollViewDirectionVertical)
		var_6_14:setBounceable(true)
		var_6_14:setPosition(ccp(80, 60))
		var_6_14:setContainer(var_6_1)
		var_6_14:setContentSize(CCSizeMake(520, var_6_8))
		var_6_14:setContentOffset(ccp(0, -(var_6_8 - 320)))
		var_6_0:addChild(var_6_14)

		local var_6_15 = CCMenu:create()

		var_6_15:setPosition(ccp(0, 0))
		var_4_0:addChild(var_6_15)

		local var_6_16 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_6_17 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_6_18 = CCMenuItemSprite:create(var_6_16, var_6_17)

		var_6_18:registerScriptTapHandler(arg_4_1.returnToLast)
		var_6_18:setPosition(ccp(visibleSize.width * 0.5 + 295, visibleSize.height * 0.5 + 190))
		var_6_15:addChild(var_6_18)
	end

	function var_4_0.onEnter(arg_7_0)
		var_4_5()
	end

	function var_4_0.onExit(arg_8_0)
		return
	end

	local function var_4_6(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			var_4_2 = arg_9_1
			var_4_3 = arg_9_2

			for iter_9_0, iter_9_1 in pairs(var_4_1) do
				iter_9_1:ifClick(arg_9_1, arg_9_2)
			end
		elseif arg_9_0 == CCTOUCHMOVED then
			-- block empty
		elseif arg_9_0 == CCTOUCHENDED and math.abs(var_4_2 - arg_9_1) < 151 and math.abs(var_4_3 - arg_9_2) < 36 then
			for iter_9_2, iter_9_3 in pairs(var_4_1) do
				if iter_9_3:ifClick(arg_9_1, arg_9_2) then
					arg_4_1.choiceServer(iter_9_3:getServer())
				end
			end
		end

		return true
	end

	var_4_0:setTouchEnabled(true)
	var_4_0:registerScriptTouchHandler(var_4_6, false, true)
	arg_4_0:addChild(var_4_0, 0, loginDebugTag.subScene)
end
