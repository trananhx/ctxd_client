function createServerLabelWeb(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1
	local var_1_2 = "server_list_view.png"
	local var_1_3 = "server_list_view_hover.png"

	if arg_1_2.statusValue == 0 then
		var_1_2 = "server_list_green.png"
		var_1_3 = "server_list_green_hover.png"
	elseif arg_1_2.statusValue == 2 then
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

function showSelectServerWeb(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in pairs(loginTag) do
		tool.safeRemoveChildByTag(arg_4_0, iter_4_1)
	end

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
		local var_5_3 = table.getn(var_5_2)
		local var_5_4 = 20
		local var_5_5 = 10
		local var_5_6 = 151
		local var_5_7 = 46
		local var_5_8 = var_5_5 + math.ceil(var_5_3 / 3) * (var_5_7 + var_5_5)
		local var_5_9 = 95
		local var_5_10 = var_5_8 - var_5_5 - 18

		for iter_5_0, iter_5_1 in pairs(var_5_2) do
			local var_5_11 = (iter_5_0 - 1) % 3 * (var_5_6 + var_5_4)
			local var_5_12 = math.floor((iter_5_0 - 1) / 3) * (var_5_7 + var_5_5)
			local var_5_13 = createServerLabelWeb(var_5_1, ccp(var_5_9 + var_5_11, var_5_10 - var_5_12), iter_5_1)

			table.insert(var_4_1, var_5_13)
		end

		local var_5_14 = CCScrollView:create()

		var_5_14:setViewSize(CCSizeMake(520, 320))
		var_5_14:setDirection(kCCScrollViewDirectionVertical)
		var_5_14:setBounceable(true)
		var_5_14:setPosition(ccp(80, 60))
		var_5_14:setContainer(var_5_1)
		var_5_14:setContentSize(CCSizeMake(520, var_5_8))
		var_5_14:setContentOffset(ccp(0, -(var_5_8 - 320)))
		var_5_0:addChild(var_5_14)

		local var_5_15 = CCMenu:create()

		var_5_15:setPosition(ccp(0, 0))
		var_4_0:addChild(var_5_15)

		local var_5_16 = CCSprite:createWithSpriteFrameName("login_btn_back_a.png")
		local var_5_17 = CCSprite:createWithSpriteFrameName("login_btn_back_c.png")
		local var_5_18 = CCMenuItemSprite:create(var_5_16, var_5_17)

		var_5_18:registerScriptTapHandler(arg_4_1.closeServerList)
		var_5_18:setPosition(ccp(visibleSize.width * 0.5 + 295, visibleSize.height * 0.5 + 190))
		var_5_15:addChild(var_5_18)
	end

	function var_4_0.onEnter(arg_6_0)
		var_4_4()
	end

	function var_4_0.onExit(arg_7_0)
		return
	end

	local function var_4_5(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == CCTOUCHBEGAN then
			var_4_2 = arg_8_1
			var_4_3 = arg_8_2

			for iter_8_0, iter_8_1 in pairs(var_4_1) do
				iter_8_1:ifClick(arg_8_1, arg_8_2)
			end
		elseif arg_8_0 == CCTOUCHMOVED then
			-- block empty
		elseif arg_8_0 == CCTOUCHENDED and math.abs(var_4_2 - arg_8_1) < 151 and math.abs(var_4_3 - arg_8_2) < 36 then
			for iter_8_2, iter_8_3 in pairs(var_4_1) do
				if iter_8_3:ifClick(arg_8_1, arg_8_2) then
					arg_4_1.choiceServer(iter_8_3:getServer())
				end
			end
		end

		return true
	end

	var_4_0:registerScriptTouchHandler(var_4_5, false, true)
	var_4_0:setTouchEnabled(true)
	arg_4_0:addChild(var_4_0, 0, loginTag.serverList)
end
