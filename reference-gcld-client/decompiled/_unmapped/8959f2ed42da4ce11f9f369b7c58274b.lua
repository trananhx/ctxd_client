diamondShop.control = {}
diamondShop.data = {}

function diamondShop.control.receive_diamondShopInfo(arg_1_0)
	if arg_1_0.action.state == 1 then
		diamondShop.data = arg_1_0.action.data

		diamondShop.ui.update()
	end
end

function diamondShop.control.request_diamondShopInfo()
	cmgr.sendRequest(diamondShop.control.receive_diamondShopInfo, actions.diamondShopInfo)
end

function diamondShop.control.receive_addDiamondShop(arg_3_0)
	if arg_3_0.action.state == 1 then
		local var_3_0 = arg_3_0.action.data.newLv

		if var_3_0 ~= nil then
			local var_3_1 = "res/ui/weapon/diamondShop/warlock_tit_shop_levelUp_" .. var_3_0 .. ".png"
			local var_3_2 = CCSprite:create(var_3_1)

			var_3_2:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			smgr.showTipSpriteText(var_3_2)
			diamondShop.control.request_diamondShopInfo()
		end
	end
end

function diamondShop.control.request_addDiamondShop()
	cmgr.sendRequest(diamondShop.control.receive_addDiamondShop, actions.diamondAddNewShop)
end

function diamondShop.control.receive_upgradeShop(arg_5_0)
	if arg_5_0.action.state == 1 then
		local var_5_0 = "res/ui/weapon/diamondShop/warlock_tit_man_update.png"
		local var_5_1 = CCSprite:create(var_5_0)

		var_5_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		smgr.showTipSpriteText(var_5_1)
		diamondShop.control.request_diamondShopInfo()
	end
end

function diamondShop.control.request_upgradeShop(arg_6_0)
	cmgr.sendRequest(diamondShop.control.receive_upgradeShop, actions.diamondUpgradeShop, arg_6_0)
end

function diamondShop.control.receive_diamondExchange(arg_7_0)
	if arg_7_0.action.state == 1 then
		local var_7_0 = arg_7_0.action.data

		if var_7_0.msg ~= nil then
			smgr.showTipText(var_7_0.msg)
		elseif var_7_0.diamondNum ~= nil then
			local var_7_1 = {
				{}
			}

			var_7_1[1].id = 7

			if var_7_0.spMerchant == true then
				var_7_1[1].id = 10059
			end

			var_7_1[1].value = var_7_0.diamondNum

			globalAction_gotResource(var_7_1)
			diamondShop.control.request_diamondShopInfo()
		end
	end
end

function diamondShop.request_diamondExchange(arg_8_0)
	local var_8_0 = diamondShop.data.shopInfoList[arg_8_0]

	if var_8_0.spMerchant == true then
		messageBox.showChargeWin("", language.get(137142, var_8_0.cunsumeAmount), "godEnchancer", function()
			cmgr.sendRequest(diamondShop.control.receive_diamondExchange, actions.diamondExchange, arg_8_0)
		end)
	else
		cmgr.sendRequest(diamondShop.control.receive_diamondExchange, actions.diamondExchange, arg_8_0)
	end
end

function diamondShop.control.click_exchange(arg_10_0)
	if diamondShop.ui.table.shop_single_tips == nil then
		diamondShop.request_diamondExchange(arg_10_0)
	end
end

function diamondShop.control.receive_buhuo(arg_11_0)
	diamondShop.control.request_diamondShopInfo()
end

function diamondShop.control.request_buhuo(arg_12_0)
	cmgr.sendRequest(diamondShop.control.receive_buhuo, actions.complementGood, arg_12_0)
end

function diamondShop.control.click_buhuo(arg_13_0)
	if diamondShop.ui.table.shop_single_tips == nil then
		messageBox.showChargeWinWithData(language.get(10003), language.get(122068), "diamondShopComplementGold", diamondShop.control.request_buhuo, arg_13_0)
	end
end

function diamondShop.control.click_shopUpdate(arg_14_0)
	if diamondShop.ui.table.shop_single_tips == nil then
		diamondShop.control.showShopSingleTips(arg_14_0)
	end
end

function diamondShop.control.click_buy(arg_15_0)
	if diamondShop.ui.table.shop_single_tips == nil then
		require("lua/layer/resource/ui")
		resourceUI.show(4)
	end
end

function diamondShop.control.click_open(arg_16_0)
	if diamondShop.ui.table.shop_single_tips == nil then
		diamondShop.control.request_addDiamondShop()
	end
end

function diamondShop.control.click_tips()
	local var_17_0 = 0

	if diamondShop.data.curShopId ~= nil then
		var_17_0 = diamondShop.data.curShopId
	end

	diamondShop.control.showShopTips(var_17_0)
end

function diamondShop.control.showShopTips(arg_18_0)
	local var_18_0 = {}

	if conf.language == "kr" then
		var_18_0.tipsFontSize = -3
		var_18_0.tipsFrameH = 0
	elseif conf.language == "vie" then
		var_18_0.tipsFontSize = 0
		var_18_0.tipsFrameH = 80
	elseif conf.language == "tha" then
		var_18_0.tipsFontSize = 0
		var_18_0.tipsFrameH = 80
	else
		var_18_0.tipsFontSize = 0
		var_18_0.tipsFrameH = 0
	end

	local var_18_1 = 820
	local var_18_2 = 260 + var_18_0.tipsFrameH
	local var_18_3 = 40
	local var_18_4 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	var_18_4:setContentSize(CCSizeMake(var_18_1, var_18_2))
	var_18_4:setAnchorPoint(ccp(0.5, 0.5))

	local var_18_5 = CCLabelTTF:create(language.get(122045), "", 26)

	var_18_5:setPosition(ccp(var_18_1 / 2, var_18_2 - var_18_3))
	var_18_5:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_18_5:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_18_5:setDimensions(CCSizeMake(var_18_1 - 50, 30))
	var_18_5:setColor(colorQuality[arg_18_0])
	var_18_4:addChild(var_18_5, 1)

	local var_18_6 = var_18_3 + 30
	local var_18_7 = CCSprite:create("res/ui/weapon/line.png")

	var_18_7:setPosition(ccp(var_18_1 / 2, var_18_2 - var_18_6))
	var_18_7:setScaleX((var_18_1 - 50) / 262)
	var_18_4:addChild(var_18_7, 1)

	local var_18_8 = var_18_6 + 30

	if conf.language == "cn" then
		for iter_18_0 = 1, 5 do
			local var_18_9 = CCLabelTTF:create(language.get(122045 + iter_18_0), "", 21 + var_18_0.tipsFontSize)

			var_18_9:setPosition(ccp(var_18_1 / 2, var_18_2 - var_18_8))
			var_18_9:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_18_9:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_18_9:setDimensions(CCSizeMake(var_18_1 - 50, 30))
			var_18_9:setColor(colorQuality[iter_18_0])

			if arg_18_0 < iter_18_0 then
				var_18_9:setColor(colorQuality[0])
			end

			var_18_4:addChild(var_18_9, 1)

			var_18_8 = var_18_8 + 30
		end
	else
		local var_18_10 = var_18_8 - 30

		for iter_18_1 = 1, 5 do
			local var_18_11 = CCLabelTTF:create(language.get(122045 + iter_18_1), "", 21 + var_18_0.tipsFontSize)

			var_18_11:setAnchorPoint(ccp(0.5, 1))
			var_18_11:setPosition(ccp(var_18_1 / 2, var_18_2 - var_18_10))
			var_18_11:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_18_11:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_18_11:setDimensions(CCSizeMake(var_18_1 - 50, 0))
			var_18_11:setColor(colorQuality[iter_18_1])

			if arg_18_0 < iter_18_1 then
				var_18_11:setColor(colorQuality[0])
			end

			var_18_4:addChild(var_18_11, 1)

			var_18_10 = var_18_10 + var_18_11:getContentSize().height
		end
	end

	local var_18_12 = createBaseLayer()
	local var_18_13 = visibleSize.width / 2
	local var_18_14 = visibleSize.height / 2

	var_18_4:setPosition(var_18_13, var_18_14)

	local function var_18_15(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_19_0 == CCTOUCHENDED then
			local var_19_0 = arg_19_1 - var_18_13
			local var_19_1 = arg_19_2 - var_18_14

			if var_19_0 > -var_18_1 / 2 and var_19_0 < var_18_1 / 2 and var_19_1 > -var_18_2 / 2 and var_19_1 < var_18_2 / 2 then
				-- block empty
			else
				smgr.getLayer("topLayer"):removeChild(var_18_12, true)
			end
		end

		return true
	end

	var_18_12:addChild(var_18_4, 100)
	var_18_12:registerScriptTouchHandler(var_18_15, false, true)
	var_18_12:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_18_12, 10002)
	var_18_12:setVisible(true)
end

function diamondShop.control.showShopSingleTips(arg_20_0)
	local var_20_0 = {}

	if conf.language == "vie" then
		var_20_0.bgWidth = 0
		var_20_0.titleX = 142
		var_20_0.costDesX = 45
		var_20_0.costIconX = 100
		var_20_0.costValueX = 100
	elseif conf.language == "tha" then
		var_20_0.bgWidth = 0
		var_20_0.titleX = 142
		var_20_0.costDesX = 20
		var_20_0.costIconX = 60
		var_20_0.costValueX = 60
	else
		var_20_0.bgWidth = 0
		var_20_0.titleX = 0
		var_20_0.costDesX = 0
		var_20_0.costIconX = 0
		var_20_0.costValueX = 0
	end

	local var_20_1 = diamondShop.data.shopInfoList[arg_20_0]
	local var_20_2 = 420
	local var_20_3 = 300
	local var_20_4 = 40

	if var_20_1.isTopLv == false then
		var_20_3 = var_20_3 + 100
	end

	local var_20_5 = tool.split(var_20_1.cunsumeTips, "<br>")
	local var_20_6 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	var_20_6:setContentSize(CCSizeMake(var_20_2 + var_20_0.bgWidth, var_20_3))
	var_20_6:setAnchorPoint(ccp(0.5, 0.5))

	local var_20_7 = "res/ui/weapon/diamondShop/warlock_tit_name_" .. arg_20_0 .. ".png"
	local var_20_8 = CCSprite:create(var_20_7)

	var_20_8:setPosition(ccp(75 + var_20_0.titleX, var_20_3 - var_20_4))
	var_20_6:addChild(var_20_8, 1)

	local var_20_9 = var_20_4 + 30
	local var_20_10 = CCSprite:create("res/ui/weapon/line.png")

	var_20_10:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_9))
	var_20_10:setScaleX((var_20_2 - 50) / 262)
	var_20_6:addChild(var_20_10, 1)

	local var_20_11 = var_20_9 + 30
	local var_20_12 = {
		10,
		5,
		5,
		5,
		5
	}
	local var_20_13 = CCLabelTTF:create(language.get(122034, var_20_12[arg_20_0]), "", 20)

	var_20_13:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_11))
	var_20_13:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_20_13:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_20_13:setDimensions(CCSizeMake(var_20_2 - 50, 30))
	var_20_6:addChild(var_20_13, 1)

	local var_20_14 = var_20_11 + 30
	local var_20_15 = language.get(122039 + arg_20_0)
	local var_20_16 = CCLabelTTF:create(language.get(122035, var_20_15), "", 20)

	var_20_16:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_14))
	var_20_16:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_20_16:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_20_16:setDimensions(CCSizeMake(var_20_2 - 50, 30))
	var_20_6:addChild(var_20_16, 1)

	local var_20_17 = var_20_14 + 30

	for iter_20_0, iter_20_1 in ipairs(var_20_5) do
		local var_20_18 = CCLabelTTF:create(iter_20_1, "", 20)

		var_20_18:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_17))
		var_20_18:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_20_18:setVerticalAlignment(kCCVerticalTextAlignmentCenter)

		if conf.language == "cn" then
			var_20_18:setDimensions(CCSizeMake(var_20_2 - 50, 30))
		else
			var_20_18:setDimensions(CCSizeMake(var_20_2 - 50, 0))
		end

		var_20_6:addChild(var_20_18, 1)

		var_20_17 = var_20_17 + 30
	end

	local var_20_19 = CCSprite:create("res/ui/weapon/line.png")

	var_20_19:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_17))
	var_20_19:setScaleX((var_20_2 - 50) / 262)
	var_20_6:addChild(var_20_19, 1)

	local var_20_20 = var_20_17 + 30
	local var_20_21 = CCLabelTTF:create(language.get(122036, var_20_1.gainAmount), "", 20)

	var_20_21:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_20))
	var_20_21:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_20_21:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_20_21:setDimensions(CCSizeMake(var_20_2 - 50, 30))
	var_20_6:addChild(var_20_21, 1)

	local var_20_22 = var_20_20 + 30
	local var_20_23 = createBaseLayer()

	if var_20_1.isTopLv == false then
		local var_20_24 = var_20_1.gainAmount + var_20_1.upgradeTipsGem

		if diamondShop.data.shopInfoList[1].spMerchant == true then
			var_20_24 = var_20_1.gainAmount + 2 * var_20_1.upgradeTipsGem
		end

		local var_20_25 = CCLabelTTF:create(language.get(122037, var_20_24), "", 20)

		var_20_25:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_22))
		var_20_25:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_20_25:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_20_25:setDimensions(CCSizeMake(var_20_2 - 50, 30))
		var_20_6:addChild(var_20_25, 1)

		local var_20_26 = var_20_22 + 30
		local var_20_27 = CCLabelTTF:create(language.get(122038), "", 20)

		var_20_27:setPosition(ccp(65 + var_20_0.costDesX, var_20_3 - var_20_26))
		var_20_6:addChild(var_20_27, 1)

		local var_20_28 = CCSprite:createWithSpriteFrameName("res_icon_19.png")

		var_20_28:setPosition(ccp(125 + var_20_0.costIconX, var_20_3 - var_20_26))
		var_20_28:setScale(0.5)
		var_20_6:addChild(var_20_28, 1)

		local var_20_29 = CCLabelTTF:create("x" .. var_20_1.upgradeTipsGold, "", 20)

		var_20_29:setPosition(ccp(170 + var_20_0.costValueX, var_20_3 - var_20_26))
		var_20_6:addChild(var_20_29, 1)

		local var_20_30 = var_20_26 + 45

		local function var_20_31()
			local function var_21_0()
				diamondShop.control.request_upgradeShop(arg_20_0)
			end

			messageBox.confirm(language.get(122032, var_20_1.upgradeTipsGold), var_21_0)
			smgr.getLayer("topLayer"):removeChild(var_20_23, true)
		end

		local var_20_32 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
		local var_20_33 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
		local var_20_34 = CCMenuItemSprite:create(var_20_32, var_20_33)

		var_20_34:registerScriptTapHandler(var_20_31)
		var_20_34:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_30))

		local var_20_35 = CCMenu:create()

		var_20_35:setPosition(ccp(0, 0))
		var_20_35:addChild(var_20_34, 1)
		var_20_6:addChild(var_20_35, 1)

		local var_20_36 = CCLabelTTF:create(language.get(122039), "", 20)

		var_20_36:setPosition(ccp(var_20_2 / 2, var_20_3 - var_20_30))
		var_20_6:addChild(var_20_36, 2)
	end

	local var_20_37 = {
		0,
		-150,
		150,
		-300,
		300
	}
	local var_20_38 = visibleSize.width / 2 + var_20_37[arg_20_0]
	local var_20_39 = visibleSize.height / 2

	var_20_6:setPosition(ccp(var_20_38, var_20_39))

	local function var_20_40(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_23_0 == CCTOUCHENDED then
			local var_23_0 = arg_23_1 - var_20_38
			local var_23_1 = arg_23_2 - var_20_39

			if var_23_0 > -var_20_2 / 2 and var_23_0 < var_20_2 / 2 and var_23_1 > -var_20_3 / 2 and var_23_1 < var_20_3 / 2 then
				-- block empty
			else
				smgr.getLayer("topLayer"):removeChild(var_20_23, true)
			end
		end

		return true
	end

	var_20_23:addChild(var_20_6, 100)
	var_20_23:registerScriptTouchHandler(var_20_40, false, true)
	var_20_23:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_20_23, 10002)
	var_20_23:setVisible(true)
end
