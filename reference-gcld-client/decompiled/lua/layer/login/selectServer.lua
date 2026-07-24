local var_0_0 = {
	new = 2,
	login = 3,
	normal = 1
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {}
	local var_1_1
	local var_1_2 = "server_list_view.png"
	local var_1_3 = "server_list_view_hover.png"

	if arg_1_3 == var_0_0.login then
		var_1_1 = "server_soon.png"
		var_1_2 = "server_list_green.png"
		var_1_3 = "server_list_green_hover.png"
	elseif arg_1_3 == var_0_0.new then
		var_1_1 = "server_recom.png"
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
		var_1_7:setPosition(ccp(0, var_1_4:getContentSize().height))
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

function showSelectServer(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = createBaseLayer()
	local var_4_1 = {}
	local var_4_2 = 0
	local var_4_3 = 0

	local function var_4_4()
		local var_5_0 = CCSprite:createWithSpriteFrameName("server_view.png")

		var_5_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_4_0:addChild(var_5_0)

		local var_5_1 = createBaseLayer()
		local var_5_2 = arg_4_1.serverList or {}
		local var_5_3 = var_5_2[1]
		local var_5_4 = table.getn(var_5_2)
		local var_5_5 = 20
		local var_5_6 = 10
		local var_5_7 = 151
		local var_5_8 = 46
		local var_5_9 = var_5_6 + math.ceil(var_5_4 / 3) * (var_5_8 + var_5_6)

		log.info("@@ server height : ", var_5_4, var_5_9)

		local var_5_10 = 95
		local var_5_11 = var_5_9 - var_5_6 - 18

		for iter_5_0, iter_5_1 in pairs(var_5_2) do
			local var_5_12 = (iter_5_0 - 1) % 3 * (var_5_7 + var_5_5)
			local var_5_13 = math.floor((iter_5_0 - 1) / 3) * (var_5_8 + var_5_6)
			local var_5_14 = var_0_1(var_5_1, ccp(var_5_10 + var_5_12, var_5_11 - var_5_13), iter_5_1)

			table.insert(var_4_1, var_5_14)
		end

		log.info("@@ 显示推荐服务器 =>", #arg_4_1.recommendServerList)

		if arg_4_1.recommendServerList and #arg_4_1.recommendServerList > 0 then
			local var_5_15 = CCSprite:createWithSpriteFrameName("server_list_div.png")

			var_5_15:setPosition(ccp(260, var_5_9 + 10))
			var_5_1:addChild(var_5_15)

			var_5_9 = var_5_9 + 22

			for iter_5_2 = 1, 3 do
				local var_5_16 = arg_4_1.recommendServerList[iter_5_2]

				if var_5_16 then
					local var_5_17 = (iter_5_2 - 1) % 3 * (var_5_7 + var_5_5)
					local var_5_18 = var_0_1(var_5_1, ccp(var_5_10 + var_5_17, var_5_9 + var_5_8 * 0.5), var_5_16, var_0_0.new)

					table.insert(var_4_1, var_5_18)
				end
			end

			var_5_9 = var_5_9 + var_5_8 + var_5_6
		end

		if arg_4_1.hadLoginServerList and #arg_4_1.hadLoginServerList > 0 then
			local var_5_19 = CCSprite:createWithSpriteFrameName("server_list_div.png")

			var_5_19:setPosition(ccp(260, var_5_9 + 10))
			var_5_1:addChild(var_5_19)

			var_5_9 = var_5_9 + 22

			for iter_5_3 = 1, 3 do
				local var_5_20 = arg_4_1.hadLoginServerList[iter_5_3]

				if var_5_20 then
					local var_5_21 = (iter_5_3 - 1) % 3 * (var_5_7 + var_5_5)
					local var_5_22 = var_0_1(var_5_1, ccp(var_5_10 + var_5_21, var_5_9 + var_5_8 * 0.5), var_5_20, var_0_0.login)

					table.insert(var_4_1, var_5_22)
				end
			end

			var_5_9 = var_5_9 + var_5_8 + var_5_6 + 17
		end

		local function var_5_23()
			if serverGroupsNode:isVisible() == true then
				serverGroupsNode:setVisible(false)
				onResizeHandler()
			else
				serverGroupsNode:setVisible(true)
				onResizeHandler()
			end
		end

		local var_5_24 = CCScrollView:create()

		var_5_24:setViewSize(CCSizeMake(520, 320))
		var_5_24:setDirection(kCCScrollViewDirectionVertical)
		var_5_24:setBounceable(true)
		var_5_24:setPosition(ccp(80, 60))
		var_5_24:setContainer(var_5_1)
		var_5_24:setContentSize(CCSizeMake(520, var_5_9))
		var_5_24:setContentOffset(ccp(0, -(var_5_9 - 320)))
		var_5_0:addChild(var_5_24)

		if arg_4_2 then
			local var_5_25 = CCMenu:create()

			var_5_25:setPosition(ccp(0, 0))
			var_4_0:addChild(var_5_25)

			local var_5_26 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
			local var_5_27 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
			local var_5_28 = CCMenuItemSprite:create(var_5_26, var_5_27)

			var_5_28:registerScriptTapHandler(arg_4_1.closeServerList)
			var_5_28:setPosition(ccp(visibleSize.width * 0.5 + 295, visibleSize.height * 0.5 + 190))
			var_5_25:addChild(var_5_28)
		end
	end

	function var_4_0.onEnter(arg_7_0)
		var_4_4()
	end

	function var_4_0.onExit(arg_8_0)
		return
	end

	local function var_4_5(arg_9_0, arg_9_1, arg_9_2)
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

	var_4_0:registerScriptTouchHandler(var_4_5, false, true)
	var_4_0:setTouchEnabled(true)
	arg_4_0:addChild(var_4_0, 0, loginTag.subUi)
end
