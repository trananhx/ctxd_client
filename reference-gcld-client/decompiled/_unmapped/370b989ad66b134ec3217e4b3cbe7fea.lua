jubenSelect.control = {}
jubenSelect.data = {}

function jubenSelect.control.on_click_back()
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
end

function jubenSelect.control.request_jubenList()
	cmgr.sendRequest(jubenSelect.control.receive_jubenList, actions.getJubenList)
end

function jubenSelect.control.receive_jubenList(arg_3_0)
	if arg_3_0.action.state == 1 then
		jubenSelect.data = arg_3_0.action.data

		if #arg_3_0.action.data.jubens >= 12 then
			jubenSelect.data = {}
			jubenSelect.data.jubens = {}

			for iter_3_0 = 1, 12 do
				jubenSelect.data.jubens[iter_3_0] = arg_3_0.action.data.jubens[iter_3_0]
			end
		end

		jubenSelect.ui.init()
	end
end

function jubenSelect.control.convertTimeToString(arg_4_0)
	local var_4_0 = math.floor(arg_4_0 / 1000)
	local var_4_1 = math.floor(var_4_0 / 60)
	local var_4_2 = math.floor(var_4_1 / 60)
	local var_4_3 = math.mod(var_4_1, 60)
	local var_4_4 = math.mod(var_4_0, 60)
	local var_4_5 = "" .. var_4_4

	if var_4_4 < 10 then
		var_4_5 = "0" .. var_4_4
	end

	local var_4_6 = "" .. var_4_3

	if var_4_3 < 10 then
		var_4_6 = "0" .. var_4_3
	end

	local var_4_7 = "" .. var_4_2

	if var_4_2 < 10 then
		var_4_7 = "0" .. var_4_2
	end

	return var_4_7 .. ":" .. var_4_6 .. ":" .. var_4_5
end

function jubenSelect.control.on_click_high()
	if jubenSelect.ui.table.high_bg ~= nil then
		jubenSelect.ui.table.layer:removeChild(jubenSelect.ui.table.high_bg, true)

		jubenSelect.ui.table.high_bg = nil
	end

	local var_5_0 = jubenSelect.data.jubens[jubenSelect.ui.currentIndex]
	local var_5_1 = #var_5_0.degrees

	if var_5_1 > 0 then
		local var_5_2, var_5_3 = jubenSelect.ui.table.btn_high:getPosition()
		local var_5_4 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

		var_5_4:setAnchorPoint(ccp(0, 1))
		var_5_4:setPosition(ccp(var_5_2 - 50, var_5_3 - 35))
		jubenSelect.ui.table.layer:addChild(var_5_4, 10)

		local var_5_5 = {
			language.get(330003),
			language.get(330004),
			language.get(330005),
			language.get(330006),
			language.get(330007)
		}
		local var_5_6 = {
			language.get(330023),
			language.get(330024),
			language.get(330025)
		}
		local var_5_7 = 0

		for iter_5_0, iter_5_1 in ipairs(var_5_0.degrees) do
			local var_5_8 = var_5_5[iter_5_0]

			if iter_5_1.winName == nil then
				var_5_8 = var_5_8 .. ":  " .. language.get(330026)
			else
				local var_5_9 = jubenSelect.control.convertTimeToString(tonumber(iter_5_1.winTime))

				var_5_8 = var_5_8 .. ":  " .. var_5_6[iter_5_1.winForceId] .. " " .. iter_5_1.winName .. " " .. var_5_9
			end

			local var_5_10 = CCLabelTTF:create(var_5_8, "", 20)

			var_5_10:setColor(ccc3(197, 171, 141))

			local var_5_11 = var_5_10:getContentSize().width

			if var_5_7 < var_5_11 then
				var_5_7 = var_5_11
			end

			var_5_10:setAnchorPoint(ccp(0, 0.5))
			var_5_10:setPosition(ccp(10, (var_5_1 - iter_5_0) * 30 + 17))
			var_5_10:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_5_4:addChild(var_5_10)
		end

		var_5_4:setContentSize(CCSizeMake(var_5_7 + 20, var_5_1 * 30 + 10))

		jubenSelect.ui.table.high_bg = var_5_4
	end
end

function jubenSelect.control.showBestReward()
	local var_6_0 = jubenSelect.data.jubens[jubenSelect.ui.currentIndex]

	if var_6_0.openPower ~= nil then
		jubenSelect.ui.table.bestReward:setString(language.get(330028))
	else
		jubenSelect.ui.table.bestReward:setString(language.get(330027))
	end

	if jubenSelect.ui.table.openlv ~= nil then
		jubenSelect.ui.table.select_mid:removeChild(jubenSelect.ui.table.openlv, true)

		jubenSelect.ui.table.openlv = nil
	end

	if var_6_0.openPower ~= nil then
		local var_6_1 = CCLabelTTF:create(language.get(330029, var_6_0.openLv), "", 20)

		var_6_1:setPosition(ccp(180, 135))
		var_6_1:setDimensions(CCSizeMake(300, 30))
		var_6_1:setColor(ccc3(197, 171, 141))
		var_6_1:setHorizontalAlignment(kCCTextAlignmentLeft)
		jubenSelect.ui.table.select_mid:addChild(var_6_1)

		jubenSelect.ui.table.openlv = var_6_1
	end

	if jubenSelect.ui.table.opennpc ~= nil then
		jubenSelect.ui.table.select_mid:removeChild(jubenSelect.ui.table.opennpc, true)

		jubenSelect.ui.table.opennpc = nil
	end

	if var_6_0.openPower ~= nil then
		local var_6_2 = CCLabelTTF:create(language.get(330030, var_6_0.openPower), "", 20)

		var_6_2:setPosition(ccp(180, 85))
		var_6_2:setDimensions(CCSizeMake(300, 30))
		var_6_2:setColor(ccc3(197, 171, 141))
		var_6_2:setHorizontalAlignment(kCCTextAlignmentLeft)
		jubenSelect.ui.table.select_mid:addChild(var_6_2)

		jubenSelect.ui.table.opennpc = var_6_2
	end

	if jubenSelect.ui.table.openjuben ~= nil then
		jubenSelect.ui.table.openjuben:removeFromParentAndCleanup(true)

		jubenSelect.ui.table.openjuben = nil
	end

	if var_6_0.openPower ~= nil and var_6_0.sId == 12 then
		local var_6_3 = CCLabelTTF:create(language.get(330033), "", 20)

		var_6_3:setPosition(ccp(180, 35))
		var_6_3:setDimensions(CCSizeMake(300, 60))
		var_6_3:setColor(ccc3(197, 171, 141))
		var_6_3:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_6_3:setVerticalAlignment(kCCTextAlignmentCenter)
		jubenSelect.ui.table.select_mid:addChild(var_6_3)

		jubenSelect.ui.table.openjuben = var_6_3
	end

	local var_6_4 = {}
	local var_6_5 = 0
	local var_6_6 = 0
	local var_6_7 = 0
	local var_6_8 = 0
	local var_6_9

	for iter_6_0, iter_6_1 in ipairs(var_6_0.degrees) do
		for iter_6_2, iter_6_3 in ipairs(iter_6_1.totalRewards) do
			if iter_6_3.type == 3 then
				var_6_5 = var_6_5 + iter_6_3.val
			elseif iter_6_3.type == 4 then
				var_6_8 = var_6_8 + iter_6_3.val
			elseif iter_6_3.type == 5 then
				var_6_6 = var_6_6 + iter_6_3.val
			else
				var_6_9 = iter_6_3.type
				var_6_7 = var_6_7 + 1
			end
		end
	end

	if jubenSelect.ui.table.reward_food ~= nil then
		jubenSelect.ui.table.select_mid:removeChild(jubenSelect.ui.table.reward_food, true)

		jubenSelect.ui.table.reward_food = nil
	end

	local var_6_10 = 1

	if var_6_5 > 0 then
		local var_6_11 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_3.png")
		local var_6_12 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_rewa_plus.png")
		local var_6_13 = math.floor(var_6_5 / 10000)
		local var_6_14 = CCLabelAtlas:create(var_6_13, "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)
		local var_6_15 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_wan.png")

		var_6_14:setAnchorPoint(ccp(0.5, 0.5))

		local var_6_16 = createRichNode({
			var_6_11,
			var_6_12,
			var_6_14,
			var_6_15
		})
		local var_6_17, var_6_18 = var_6_14:getPosition()

		var_6_16:setPosition(ccp(20, 185 - 50 * var_6_10))

		jubenSelect.ui.table.reward_food = var_6_16

		jubenSelect.ui.table.select_mid:addChild(var_6_16)

		var_6_10 = var_6_10 + 1
	end

	if jubenSelect.ui.table.reward_exp ~= nil then
		jubenSelect.ui.table.select_mid:removeChild(jubenSelect.ui.table.reward_exp, true)

		jubenSelect.ui.table.reward_exp = nil
	end

	if var_6_6 > 0 then
		local var_6_19 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_5.png")
		local var_6_20 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_rewa_plus.png")
		local var_6_21 = math.floor(var_6_6 / 10000)
		local var_6_22 = CCLabelAtlas:create(var_6_21, "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)

		var_6_22:setAnchorPoint(ccp(0.5, 0.5))

		local var_6_23 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_wan.png")
		local var_6_24 = createRichNode({
			var_6_19,
			var_6_20,
			var_6_22,
			var_6_23
		})
		local var_6_25, var_6_26 = var_6_22:getPosition()

		var_6_24:setPosition(ccp(20, 185 - 50 * var_6_10))

		jubenSelect.ui.table.reward_exp = var_6_24

		jubenSelect.ui.table.select_mid:addChild(var_6_24)

		var_6_10 = var_6_10 + 1
	end

	if jubenSelect.ui.table.reward_tie ~= nil then
		jubenSelect.ui.table.select_mid:removeChild(jubenSelect.ui.table.reward_tie, true)

		jubenSelect.ui.table.reward_tie = nil
	end

	if var_6_8 > 0 then
		local var_6_27 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_4.png")
		local var_6_28 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_rewa_plus.png")
		local var_6_29 = math.floor(var_6_8 / 10000)
		local var_6_30 = CCLabelAtlas:create(var_6_29, "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)

		var_6_30:setAnchorPoint(ccp(0.5, 0.5))

		local var_6_31 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_wan.png")
		local var_6_32 = createRichNode({
			var_6_27,
			var_6_28,
			var_6_30,
			var_6_31
		})
		local var_6_33, var_6_34 = var_6_30:getPosition()

		var_6_32:setPosition(ccp(20, 185 - 50 * var_6_10))

		jubenSelect.ui.table.reward_tie = var_6_32

		jubenSelect.ui.table.select_mid:addChild(var_6_32)

		var_6_10 = var_6_10 + 1
	end

	if jubenSelect.ui.table.reward_piece ~= nil then
		jubenSelect.ui.table.select_mid:removeChild(jubenSelect.ui.table.reward_piece, true)

		jubenSelect.ui.table.reward_piece = nil
	end

	if var_6_7 > 0 then
		local var_6_35 = CCSprite:create("res/ui/juben/jubenLevelSelect/text/jb_rewa_" .. var_6_9 .. ".png")
		local var_6_36 = CCSprite:create("res/ui/juben/jubenLevelSelect/jb_rewa_plus.png")
		local var_6_37 = CCLabelAtlas:create(var_6_7, "res/ui/juben/jubenLevelSelect/jb_rewa_numb.png", 17, 29, 48)
		local var_6_38 = createRichNode({
			var_6_35,
			var_6_36,
			var_6_37,
			temp4
		})
		local var_6_39, var_6_40 = var_6_37:getPosition()

		var_6_37:setPosition(ccp(var_6_39, var_6_40 - 15))
		var_6_38:setPosition(ccp(20, 185 - 50 * var_6_10))

		jubenSelect.ui.table.reward_piece = var_6_38

		jubenSelect.ui.table.select_mid:addChild(var_6_38)

		local var_6_41 = var_6_10 + 1
	end

	local var_6_42 = CCSprite:create("res/ui/juben/jubenSelect/text/jb_jb_name_" .. var_6_0.sId .. ".png")

	jubenSelect.ui.table.text:setDisplayFrame(var_6_42:displayFrame())
	jubenSelect.ui.table.text_blood:setVisible(var_6_0.sId >= 12)
end

function jubenSelect.control.create_scroll_view()
	local var_7_0 = #jubenSelect.data.jubens
	local var_7_1 = createBaseLayer()

	for iter_7_0 = 1, var_7_0 do
		local var_7_2 = jubenSelect.data.jubens[iter_7_0]
		local var_7_3 = CCSprite:create("res/ui/juben/jubenSelect/map/jb_jb_" .. var_7_2.sId .. ".png")

		var_7_3:setPosition(ccp(480 + (iter_7_0 - 1) * 450, 270))

		if var_7_2.openPower ~= nil then
			local var_7_4 = CCSprite:create("res/ui/juben/jubenSelect/jb_jb_set_name_3.png")

			var_7_4:setPosition(ccp(182, 90))
			var_7_3:addChild(var_7_4)
		end

		jubenSelect.ui.table["item" .. iter_7_0] = var_7_3

		var_7_1:addChild(var_7_3)
	end

	local var_7_5 = CCScrollView:create(CCSizeMake(960, 518))

	var_7_5:setContainer(var_7_1)
	var_7_5:setPosition(213, 114)
	var_7_5:setContentSize(CCSizeMake(450 * (var_7_0 - 1) + 480 + 480, 518))
	var_7_5:setDirection(kCCScrollViewDirectionHorizontal)
	var_7_5:setBounceable(false)

	jubenSelect.ui.table.scrollView = var_7_5

	jubenSelect.ui.table.bg:addChild(var_7_5, 1)
end

function jubenSelect.control.calculate_scroll_index(arg_8_0)
	local var_8_0 = math.floor(arg_8_0 / 450)

	if var_8_0 < 0 then
		var_8_0 = 0
	elseif arg_8_0 - var_8_0 * 450 > 225 then
		var_8_0 = var_8_0 + 1
	end

	return var_8_0
end

function jubenSelect.control.set_scroll_stop_position(arg_9_0)
	jubenSelect.ui.table.scrollView:setContentOffset(ccp(0 - arg_9_0 * 450, 0), false)
end
