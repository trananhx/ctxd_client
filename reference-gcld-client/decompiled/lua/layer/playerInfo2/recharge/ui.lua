recharge = {}

tool.requireRes("playerInfo2/recharge")
require("lua/layer/limitedEditionGift/ui")

recharge.ui = {}
recharge.ui.table = {}
recharge.ui.beginX = 0
recharge.ui.beginY = 0

function recharge.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		recharge.ui.beginX = arg_1_1
		recharge.ui.beginY = arg_1_2

		return true
	elseif arg_1_0 == CCTOUCHENDED and math.abs(recharge.ui.beginX - arg_1_1) < 20 and math.abs(recharge.ui.beginY - arg_1_2) < 20 then
		local var_1_0 = recharge.ui.table.bg:getContentSize()
		local var_1_1, var_1_2 = recharge.ui.table.bg:getPosition()
		local var_1_3 = arg_1_1 - var_1_1 + var_1_0.width / 2 - 60
		local var_1_4 = arg_1_2 - var_1_2 + var_1_0.height / 2 - 30

		if var_1_3 > 0 and var_1_3 < 800 and var_1_4 > 0 and var_1_4 < 206 then
			if recharge.control.isChongZhiLayer == false then
				local var_1_5 = recharge.ui.table.scrollView:getContentOffset().x
				local var_1_6 = math.floor((var_1_3 - var_1_5) / recharge.constant.singleItemWidth)

				log.debug("luxiaodong: clicked", var_1_6 + 1)

				if tonumber(recharge.control.privileges[var_1_6 + 1].status) ~= 1 or var_1_6 == 14 then
					if var_1_6 == 7 and user.player.playerLv < 50 then
						smgr.showTipText(language.get(142007))

						return
					end

					if var_1_6 == 9 and user.player.playerLv < 60 then
						smgr.showTipText(language.get(142008))

						return
					end

					if var_1_6 == 7 then
						if recharge.control.vip5BonusNpc.canAttack == true then
							guide.control.loadGuideByMarkTrace("instance:5:13")
						end
					elseif var_1_6 == 14 then
						if recharge.control.currentLv < 10 then
							smgr.showTipText(language.get(142019))
							amgr.playEffect(enumAudioFile.ui_click_error, false, true)

							return
						end

						if recharge.control.changeNameGold > 0 then
							messageBox.confirm(language.get(136069, recharge.control.changeNameGold), function()
								require("lua/layer/createCharacterLayer")

								local var_2_0 = smgr.getLayer("topLayer")
								local var_2_1 = createCharacter(true)

								var_2_0:removeAllChildrenWithCleanup(true)
								var_2_0:addChild(var_2_1)
							end)
						else
							require("lua/layer/createCharacterLayer")

							local var_1_7 = smgr.getLayer("topLayer")
							local var_1_8 = createCharacter(true)

							var_1_7:removeAllChildrenWithCleanup(true)
							var_1_7:addChild(var_1_8)
						end
					else
						recharge.control.click_got(var_1_6 + 1)

						local var_1_9 = CCShow:create()
						local var_1_10 = CCDelayTime:create(0.1)
						local var_1_11 = CCHide:create()
						local var_1_12 = CCArray:create()

						var_1_12:addObject(var_1_9)
						var_1_12:addObject(var_1_10)
						var_1_12:addObject(var_1_11)

						local var_1_13 = CCSequence:create(var_1_12)

						recharge.ui.table.select_view:runAction(var_1_13)
						recharge.ui.table.select_view:setPosition(ccp(recharge.constant.singleItemWidth * var_1_6 + 155.5, 103))
					end
				end
			else
				local var_1_14 = recharge.ui.table.iap_scrollView:getContentOffset().x
				local var_1_15 = math.floor((var_1_3 - var_1_14) / recharge.constant.singleItemWidth)

				if var_1_15 >= 0 and var_1_15 < #recharge.control.iapData then
					recharge.control.click_buy(var_1_15 + 1)
				end
			end
		end
	end
end

function recharge.ui.init()
	recharge.ui.table.percent:setMidpoint(CCPointMake(0, 1))
	recharge.ui.table.percent:setBarChangeRate(CCPointMake(1, 0))
	recharge.ui.table.percentValue:setDimensions(CCSizeMake(300, 40))

	if conf.language == "kr" then
		recharge.ui.table.shengjixuyao:setDimensions(CCSizeMake(550, 40))
	else
		recharge.ui.table.shengjixuyao:setDimensions(CCSizeMake(400, 40))
	end

	recharge.ui.table.needValue:setDimensions(CCSizeMake(400, 40))
	recharge.ui.table.percentValue:setHorizontalAlignment(kCCTextAlignmentLeft)
	recharge.ui.table.shengjixuyao:setHorizontalAlignment(kCCTextAlignmentLeft)
	recharge.ui.table.needValue:setHorizontalAlignment(kCCTextAlignmentLeft)
	recharge.ui.table.percentBg:setScale(1.2)
	recharge.ui.table.percent:setScale(1.2)
	recharge.ui.table.percent:setPercentage(50)
	recharge.ui.table.btn_chongzhi:registerScriptTapHandler(recharge.control.click_chongzhi)
	recharge.ui.table.btn_tequan:registerScriptTapHandler(recharge.control.click_tequan)
	recharge.control.getVipInfo()
	recharge.control.setPlayerIconTextrue(user.player.pic)
	recharge.ui.table.layer:setVisible(false)

	local var_3_0 = createBaseLayer()

	var_3_0.onEnter = recharge.control.onEnter
	var_3_0.onExit = recharge.control.onExit

	for iter_3_0 = 1, 15 do
		local var_3_1 = CCSprite:create("res/ui/playerInfo/yihuode.png")

		var_3_1:setPosition(200, 80)

		recharge.ui.table["item_huode_" .. iter_3_0] = var_3_1

		local var_3_2 = CCLabelTTF:create(tostring(iter_3_0), "Thonburi", 30)

		recharge.ui.table["item_muti_" .. iter_3_0] = var_3_2

		var_3_2:setPosition(240, 125)

		local var_3_3 = CCSprite:create("res/ui/playerInfo/vip_icon_" .. iter_3_0 .. ".png")

		recharge.ui.table["item_icon_" .. iter_3_0] = var_3_3

		var_3_3:setPosition(ccp(155.5, 103))

		local var_3_4

		if conf.language == "vie" then
			var_3_4 = CCLabelTTF:create(tostring(iter_3_0), "Thonburi", 15, CCSizeMake(280, 90), kCCTextAlignmentCenter)

			var_3_4:setHorizontalAlignment(kCCTextAlignmentCenter)
			var_3_4:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		else
			var_3_4 = CCLabelTTF:create(tostring(iter_3_0), "Thonburi", 18)
		end

		var_3_4:setPosition(ccp(152.5, 40))

		recharge.ui.table["item_label_" .. iter_3_0] = var_3_4

		local var_3_5 = CCSprite:create("res/ui/playerInfo/vip_list_view.jpg")

		recharge.ui.table["huode_bg_" .. iter_3_0] = var_3_5

		var_3_5:setPosition(ccp(recharge.constant.singleItemWidth * (iter_3_0 - 1) + 155.5, 103))
		var_3_5:addChild(var_3_4)
		var_3_5:addChild(var_3_3)
		var_3_5:addChild(var_3_1)
		var_3_5:addChild(var_3_2)
		var_3_0:addChild(var_3_5)
	end

	local var_3_6 = {
		1,
		2,
		4,
		6,
		8,
		10,
		12,
		13,
		14,
		15
	}

	for iter_3_1 = 1, 10 do
		local var_3_7 = (var_3_6[iter_3_1] - 1) * recharge.constant.singleItemWidth
		local var_3_8 = CCSprite:create("res/ui/playerInfo/vip_tit.png")
		local var_3_9 = CCLabelAtlas:create(tostring(iter_3_1), "res/ui/common/number/get_numb.png", 29, 46, 48)

		var_3_9:setAnchorPoint(ccp(0.5, 0.5))

		local var_3_10 = CCSprite:create("res/ui/playerInfo/vip_tequan.png")
		local var_3_11 = createRichNode({
			var_3_8,
			var_3_9,
			var_3_10
		}, 0)

		var_3_11:setPosition(ccp(var_3_7, 225))
		var_3_0:addChild(var_3_11)
	end

	local var_3_12 = CCSprite:create("res/ui/playerInfo/icon_gold.png")

	var_3_12:setVisible(false)
	var_3_0:addChild(var_3_12)

	recharge.ui.table.needChongGold = var_3_12

	local var_3_13 = CCLabelTTF:create("0", "Thonburi", 30)

	var_3_13:setColor(ccc3(166, 146, 101))
	var_3_13:setVisible(false)
	var_3_0:addChild(var_3_13)

	recharge.ui.table.needChongValue = var_3_13

	local var_3_14 = CCSprite:create("res/ui/playerInfo/vip_list_view_on.png")

	var_3_14:setPosition(ccp(0, 0))
	var_3_14:setVisible(false)
	var_3_0:addChild(var_3_14)

	recharge.ui.table.select_view = var_3_14

	local var_3_15 = CCScrollView:create(CCSizeMake(800, 290))

	var_3_15:setContainer(var_3_0)
	var_3_15:setPosition(60, 30)
	var_3_15:setContentSize(CCSizeMake(recharge.constant.singleItemWidth * 15, 290))
	var_3_15:setDirection(kCCScrollViewDirectionHorizontal)

	recharge.ui.table.scrollView = var_3_15

	recharge.ui.table.bg:addChild(var_3_15, 10)

	local var_3_16 = CCLabelTTF:create(language.get(142004, user.player.gold), "Thonburi", 30)

	var_3_16:setAnchorPoint(ccp(0, 0.5))
	var_3_16:setColor(ccc3(166, 146, 101))

	if conf.language == "kr" then
		var_3_16:setPosition(85, 298)
	elseif conf.language == "vie" then
		var_3_16:setPosition(80, 303)
	elseif conf.language == "tha" then
		var_3_16:setPosition(65, 303)
	else
		var_3_16:setPosition(85, 280)
	end

	recharge.ui.table.bg:addChild(var_3_16, 10)

	recharge.ui.table.currentGoldValue = var_3_16

	if conf.language == "tw" and platform.getFlag() == "MOBILE_ANDROID" then
		-- block empty
	end

	local var_3_17 = createBaseLayer()

	for iter_3_2 = 1, #recharge.control.iapData do
		local var_3_18 = CCSprite:create("res/ui/playerInfo/iap/gold_list_view.jpg")

		var_3_18:setPosition(ccp(recharge.constant.singleItemWidth * (iter_3_2 - 1) + 155.5, 103))

		recharge.ui.table["iap_gold_bg_" .. iter_3_2] = var_3_18

		local var_3_19 = CCSprite:create("res/ui/playerInfo/iap/gold_0" .. recharge.control.iapData[iter_3_2].pic .. ".png")

		var_3_19:setPosition(ccp(148, 103))

		recharge.ui.table["iap_gold_" .. iter_3_2] = var_3_19

		var_3_18:addChild(var_3_19, 1)

		local var_3_20 = CCSprite:create("res/ui/playerInfo/iap/btn_buy_a.png")
		local var_3_21 = CCSprite:create("res/ui/playerInfo/iap/btn_buy_click.png")
		local var_3_22 = CCMenuItemSprite:create(var_3_20, var_3_21)

		var_3_22:registerScriptTapHandler(recharge.control.click_buy)
		var_3_22:setPosition(ccp(155, 30))

		local var_3_23 = CCMenu:create()

		var_3_23:setPosition(ccp(0, 0))
		var_3_23:addChild(var_3_22, 1, iter_3_2)
		var_3_18:addChild(var_3_23, 1)

		local var_3_24

		if conf.language == "tw" and channelMgr.getCurrentChannel() == channels.iosTW then
			var_3_24 = CCLabelTTF:create(language.get(142003, recharge.control.iapData[iter_3_2].extra ~= 0 and recharge.control.iapData[iter_3_2].gold .. "金幣\n贈" .. recharge.control.iapData[iter_3_2].extra or tostring(recharge.control.iapData[iter_3_2].gold)), "Thonburi", 23)

			var_3_24:setHorizontalAlignment(kCCTextAlignmentRight)
		elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
			var_3_24 = CCLabelTTF:create(language.get(142003, recharge.control.iapData[iter_3_2].extra ~= nil and recharge.control.iapData[iter_3_2].gold .. "金幣\n贈" .. recharge.control.iapData[iter_3_2].extra or tostring(recharge.control.iapData[iter_3_2].gold)), "Thonburi", 23)

			var_3_24:setHorizontalAlignment(kCCTextAlignmentRight)
		else
			var_3_24 = CCLabelTTF:create(language.get(142003, tostring(recharge.control.iapData[iter_3_2].gold)), "Thonburi", 23)
		end

		var_3_24:setPosition(268, 90)
		var_3_24:setColor(ccc3(227, 188, 70))
		var_3_24:setAnchorPoint(ccp(1, 0.5))
		var_3_18:addChild(var_3_24, 2)

		local var_3_25 = math.floor(recharge.control.iapData[iter_3_2].money / 100)
		local var_3_26 = tostring(var_3_25) .. ".00"
		local var_3_27 = 142009

		if channelMgr.currentChannel == channels.ppZhuShou or channelMgr.currentChannel == channels.ppZhuShou2 then
			var_3_27 = 142013
			var_3_26 = tostring(var_3_25)
		end

		if channelMgr.currentChannel == channels.android91 or channelMgr.currentChannel == channels.ios91 then
			var_3_27 = 142018
			var_3_26 = tostring(var_3_25)
		end

		if var_3_25 < 1 then
			var_3_26 = tostring(var_3_25)
		end

		if channelMgr.payMethod == 6 then
			var_3_27 = "142019_sunc"
		end

		if channelMgr.payMethod == 4 or channelMgr.payMethod == 5 then
			var_3_27 = "142019_sunc"
		end

		if channelMgr.payMethod == 5 then
			local var_3_28 = math.floor(recharge.control.iapData[iter_3_2].money)

			var_3_26 = tostring(var_3_28)
			var_3_27 = "142019_sunc"
		elseif channelMgr.payMethod == 7 then
			local var_3_29 = recharge.control.iapData[iter_3_2].money / 100

			var_3_26 = tostring(var_3_29)
			var_3_27 = "142020_lxr"
		elseif channelMgr.payMethod == 12 or channelMgr.payMethod == 22 or channelMgr.payMethod == 23 or channelMgr.payMethod == 13 then
			local var_3_30 = recharge.control.iapData[iter_3_2].money / 100

			var_3_26 = tostring(var_3_30)
			var_3_27 = "142021_yyl"
		elseif channelMgr.payMethod == 21 then
			local var_3_31 = recharge.control.iapData[iter_3_2].money

			var_3_26 = tostring(var_3_31)
			var_3_27 = "142019_sunc"
		elseif channelMgr.payMethod == 11 then
			local var_3_32 = recharge.control.iapData[iter_3_2].money / 100

			var_3_26 = tostring(var_3_32)
			var_3_27 = "142021_yyl"
		end

		local var_3_33 = CCStrokeLabelTTF:create(language.get(var_3_27, var_3_26), "Thonburi", 20, 2, colorText[10005])

		var_3_33:setPosition(155, 30)
		var_3_33:setColor(colorText[10004])
		var_3_18:addChild(var_3_33, 3)
		var_3_17:addChild(var_3_18, 1)
	end

	local var_3_34 = CCScrollView:create(CCSizeMake(800, 210))

	var_3_34:setContainer(var_3_17)
	var_3_34:setPosition(60, 30)
	var_3_34:setContentSize(CCSizeMake(recharge.constant.singleItemWidth * #recharge.control.iapData, 210))
	var_3_34:setDirection(kCCScrollViewDirectionHorizontal)

	recharge.ui.table.iap_scrollView = var_3_34

	recharge.ui.table.bg:addChild(var_3_34, 10)

	if conf.language == "vie" or conf.language == "tha" or channelMgr.payMethod == 20 then
		recharge.control.isChongZhiLayer = false

		recharge.control.click_tequan()
	else
		recharge.control.click_chongzhi()
	end

	local var_3_35 = createBaseLayer()
	local var_3_36 = limitedEditionGift.constant.giftIconPaths
	local var_3_37 = limitedEditionGift.constant.giftValue

	for iter_3_3 = 1, 8 do
		local var_3_38 = CCSprite:createWithSpriteFrameName("general_background_light.png")

		recharge.ui.table["item_bg_" .. iter_3_3] = var_3_38

		var_3_38:setPosition(50 + (iter_3_3 - 1) * 180, 75)

		local var_3_39 = CCSprite:create(var_3_36[iter_3_3])

		var_3_39:setPosition(var_3_38:getContentSize().width / 2, var_3_38:getContentSize().height / 2)

		local var_3_40 = CCStrokeLabelTTF:create(var_3_37[iter_3_3], "Thonburi", 20, 2, colorText[10005])

		recharge.ui.table["item_title_" .. iter_3_3] = var_3_40

		var_3_40:setPosition(50 + (iter_3_3 - 1) * 180, 18)
		var_3_40:setColor(ccc3(235, 209, 167))

		local var_3_41 = CCSprite:create("res/ui/firstPayActivity/delta_icon_add.png")

		recharge.ui.table["item_add_" .. iter_3_3] = var_3_41

		var_3_41:setPosition(135 + (iter_3_3 - 1) * 180, 75)
		var_3_38:addChild(var_3_39)
		var_3_35:addChild(var_3_38)
		var_3_35:addChild(var_3_40)
		var_3_35:addChild(var_3_41)
	end

	local var_3_42 = recharge.ui.table.item_bg_2
	local var_3_43 = CCSprite:create(limitedEditionGift.constant.giftPermenantIconPath)

	var_3_43:setPosition(var_3_42:getContentSize().width / 2, var_3_42:getContentSize().height / 2)
	var_3_42:addChild(var_3_43)

	local var_3_44 = CCSprite:create("res/ui/firstPayActivity/scjl_qp.png")

	recharge.ui.table.scjl_bg = var_3_44

	var_3_44:setPosition(380, 425)
	recharge.ui.table.bg:addChild(var_3_44, 200)

	local var_3_45 = CCSprite:create("res/ui/firstPayActivity/scjl_zz.png")

	recharge.ui.table.scjl_dark = var_3_45

	var_3_45:setPosition(725, 435)
	recharge.ui.table.bg:addChild(var_3_45, 150)
	recharge.ui.table.item_add_8:setVisible(false)

	local var_3_46 = CCScrollView:create(CCSizeMake(680, 200))

	var_3_46:setContainer(var_3_35)
	var_3_46:setPosition(50, 360)
	var_3_46:setContentSize(CCSizeMake(1370, 200))
	var_3_46:setDirection(kCCScrollViewDirectionHorizontal)

	recharge.ui.table.scjl_scrollView = var_3_46

	recharge.ui.table.bg:addChild(var_3_46)
	var_3_0:setVisible(true)
end

function recharge.ui.show()
	if channelMgr.currentChannel == channels.iosAppstore then
		log.info("channelMgr.payMethod", channelMgr.payMethod)

		channelMgr.payMethod = 1

		log.info("channelMgr.payMethod", channelMgr.payMethod)
	elseif channelMgr.currentChannel == channels.wp8WPStore then
		channelMgr.payMethod = 4

		log.info("channelMgr.payMethod is 4. wpstore pay")
	elseif channelMgr.currentChannel == channels.iosplay800 then
		log.info("channelMgr.payMethod", channelMgr.payMethod)

		channelMgr.payMethod = 5
	elseif channelMgr.currentChannel == channels.iosappstore30lv then
		channelMgr.payMethod = 6

		log.info("channelMgr.payMethod", channelMgr.payMethod)
	else
		channelMgr.payMethod = 3
	end

	local var_4_0 = createBaseLayer()

	recharge.ui.table = autoUI.initUI(var_4_0, getRechargeData())
	recharge.ui.table.layer = var_4_0

	local var_4_1 = platform.getFlag()

	if conf.language == "tw" then
		if var_4_1 == "MOBILE_ANDROID" then
			if channelMgr.getCurrentChannel() == channels.andTwPub then
				channelMgr.payMethod = 20
			elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
				channelMgr.payMethod = 21
			else
				channelMgr.payMethod = 4
			end
		elseif var_4_1 == "MOBILE_IPHONE" then
			channelMgr.payMethod = 6
		end

		if channelMgr.getCurrentChannel() == channels.andTw37Wan then
			channelMgr.payMethod = 22
		elseif channelMgr.getCurrentChannel() == channels.iosTw37Wan then
			channelMgr.payMethod = 23
		end
	elseif conf.language == "kr" then
		if var_4_1 == "MOBILE_ANDROID" then
			channelMgr.payMethod = 5
		elseif var_4_1 == "MOBILE_IPHONE" then
			channelMgr.payMethod = 7
		end
	elseif conf.language == "vie" then
		if var_4_1 == "MOBILE_ANDROID" then
			channelMgr.payMethod = 8
		elseif var_4_1 == "MOBILE_IPHONE" then
			channelMgr.payMethod = 9
		end
	elseif conf.language == "tha" then
		if var_4_1 == "MOBILE_ANDROID" then
			channelMgr.payMethod = 10
		elseif var_4_1 == "MOBILE_IPHONE" then
			channelMgr.payMethod = 11
		end
	elseif conf.language == "xm" then
		if var_4_1 == "MOBILE_ANDROID" then
			channelMgr.payMethod = 12
		elseif var_4_1 == "MOBILE_IPHONE" then
			channelMgr.payMethod = 13
		end
	end

	function var_4_0.onEnter()
		eventManager.registerEvent("vipLvPush", recharge.control.update_push)
	end

	function var_4_0.onExit()
		eventManager.unregisterEvent("vipLvPush", recharge.control.update_push)
	end

	if channelMgr.payMethod == 3 then
		recharge.control.getPayList()
	elseif channelMgr.payMethod == 1 then
		recharge.control.iapData = conf.iapPriceTable
		recharge.control.iapItemIdTable = conf.iapItemIdTable

		recharge.ui.init()
	elseif channelMgr.payMethod == 2 then
		recharge.control.iapData = conf.alipayPriceTable

		recharge.ui.init()
	elseif channelMgr.payMethod == 4 then
		recharge.control.iapData = conf.googlePayTwPriceTable

		recharge.ui.init()
	elseif channelMgr.payMethod == 5 then
		recharge.control.getPayList()
	elseif channelMgr.payMethod == 6 then
		recharge.control.iapData = recharge.constant.iapPriceTableTwNew
		recharge.control.iapItemIdTable = conf.iapItemIdTableTw

		recharge.ui.init()
	elseif channelMgr.payMethod == 7 then
		recharge.control.iapData = conf.iapPriceTableKr
		recharge.control.iapItemIdTable = conf.iapItemIdTableKr

		recharge.ui.init()
	elseif channelMgr.payMethod == 8 or channelMgr.payMethod == 9 or channelMgr.payMethod == 10 or channelMgr.payMethod == 20 then
		recharge.ui.init()
	elseif channelMgr.payMethod == 21 then
		if channelMgr.getCurrentChannel() == channels.andTwGo2Play then
			recharge.control.iapData = recharge.constant.twGo2PlayGpPriceTable
		else
			recharge.control.iapData = recharge.constant.twGo2PlayThirdPriceTable
		end

		recharge.ui.init()
	elseif channelMgr.payMethod == 11 then
		if channelMgr.isAppStoreReview() then
			recharge.control.iapData = conf.iapPriceTableTh
			recharge.control.iapItemIdTable = conf.iapItemIdTableTh

			recharge.ui.init()
		else
			recharge.ui.init()
		end
	elseif channelMgr.payMethod == 12 or channelMgr.payMethod == 13 then
		recharge.control.iapData = conf.iapPriceTableXm
		recharge.control.iapItemIdTable = conf.iapItemIdTableXm

		recharge.ui.init()
	elseif channelMgr.payMethod == 22 or channelMgr.payMethod == 23 then
		recharge.control.iapData = conf.iapPriceTableUjoytw
		recharge.control.iapItemIdTable = conf.iapItemIdTableUjoytw

		recharge.ui.init()
	end

	if conf.language == "tw" and channelMgr.payMethod == 4 then
		Purchase:googlePlay_sync()
	end

	var_4_0:registerScriptTouchHandler(recharge.ui.onTouch)
	var_4_0:setTouchEnabled(true)
	var_4_0:setVisible(false)

	return var_4_0
end
