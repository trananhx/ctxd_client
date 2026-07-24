diamondShop = {}

tool.requireRes("weaponTab/diamondShop")

diamondShop.ui = {}
diamondShop.ui.table = {}

function diamondShop.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		-- block empty
	end

	return true
end

function diamondShop.ui.update()
	diamondShop.ui.updateTitle(diamondShop.data.curShopId)

	for iter_2_0 = 1, 5 do
		diamondShop.ui.updateSingle(iter_2_0)
	end
end

function diamondShop.ui.updateTitle(arg_3_0)
	local var_3_0 = "res/ui/weapon/diamondShop/warlock_tit_shop_level_" .. tostring(arg_3_0) .. ".png"

	if diamondShop.ui.table.title == nil then
		local var_3_1 = CCSprite:create(var_3_0)

		if conf.language == "vie" then
			var_3_1:setScale(0.65)
		end

		var_3_1:setPosition(ccp(463, 510))
		diamondShop.ui.table.bg:addChild(var_3_1, 10)

		diamondShop.ui.table.title = var_3_1

		local var_3_2 = diamondShop.ui.table.ticketNumber0:getPositionX()
		local var_3_3 = diamondShop.ui.table.ticketNumber0:getContentSize()

		diamondShop.ui.table.ticketNumber:setPositionX(var_3_2 + var_3_3.width)
	else
		local var_3_4 = CCSprite:create(var_3_0)

		if conf.language == "vie" then
			var_3_4:setScale(0.65)
		end

		diamondShop.ui.table.title:setDisplayFrame(var_3_4:displayFrame())
	end

	diamondShop.ui.table.ticketNumber:setString(diamondShop.data.ticketNumber)
end

function diamondShop.ui.updateSingle(arg_4_0)
	local var_4_0 = {}

	if conf.language == "kr" then
		var_4_0.overFontSize = -10
		var_4_0.buhuoGoldX = 25
		var_4_0.buhuoFontSize = -4
	elseif conf.language == "vie" then
		var_4_0.overFontSize = -10
		var_4_0.buhuoGoldX = 0
		var_4_0.buhuoFontSize = 0
	else
		var_4_0.overFontSize = 0
		var_4_0.buhuoGoldX = 0
		var_4_0.buhuoFontSize = 0
	end

	local var_4_1 = diamondShop.data.shopInfoList[arg_4_0]
	local var_4_2 = ""
	local var_4_3 = var_4_1.isOpen == false and "res/ui/weapon/diamondShop/warlock_view_up_list_1.png" or var_4_1.spMerchant == true and "res/ui/weapon/diamondShop/warlock_view_up_list_4.png" or tonumber(var_4_1.rTimes) == 0 and "res/ui/weapon/diamondShop/warlock_view_up_list_2.png" or "res/ui/weapon/diamondShop/warlock_view_up_list_3.png"
	local var_4_4 = 94 + ({
		2,
		1,
		3,
		0,
		4
	})[arg_4_0] * 182

	if diamondShop.ui.table["singleBg_" .. arg_4_0] == nil then
		local var_4_5 = CCSprite:create(var_4_3)

		var_4_5:setPosition(ccp(var_4_4, 255))
		diamondShop.ui.table.bg:addChild(var_4_5, 10)

		diamondShop.ui.table["singleBg_" .. arg_4_0] = var_4_5
	else
		local var_4_6 = CCSprite:create(var_4_3)

		diamondShop.ui.table["singleBg_" .. arg_4_0]:setDisplayFrame(var_4_6:displayFrame())
		diamondShop.ui.table["singleBg_" .. arg_4_0]:removeAllChildrenWithCleanup(true)
	end

	if var_4_1.isOpen == true then
		local var_4_7 = "res/ui/weapon/diamondShop/warlock_tit_name_" .. arg_4_0 .. ".png"
		local var_4_8 = CCSprite:create(var_4_7)

		var_4_8:setPosition(ccp(93, 315))

		if conf.language == "vie" then
			var_4_8:setScale(0.8)
			var_4_8:setPosition(ccp(94, 315))
		end

		diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_8, 10)

		diamondShop.ui.table["singleName_" .. arg_4_0] = var_4_8

		if var_4_1.isTopLv == false and var_4_1.spMerchant ~= true then
			if conf.language == "vie" then
				var_4_8:setPosition(ccp(94, 315))
			else
				var_4_8:setPosition(ccp(75, 315))
			end

			local var_4_9 = "res/ui/weapon/diamondShop/warlock_view_up_list_peop_jt.png"
			local var_4_10 = CCSprite:create(var_4_9)

			if conf.language == "vie" then
				var_4_10:setPosition(ccp(30, 275))
			else
				var_4_10:setPosition(ccp(145, 315))
			end

			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_10, 10)

			diamondShop.ui.table["singleArrow_" .. arg_4_0] = var_4_10
		end

		local var_4_11 = CCSprite:create("res/default.png")
		local var_4_12 = CCSprite:create("res/default.png")
		local var_4_13 = CCMenuItemSprite:create(var_4_11, var_4_12)

		var_4_13:setPosition(ccp(93, 315))
		var_4_13:setScaleX(45)
		var_4_13:setScaleY(12.5)
		var_4_13:registerScriptTapHandler(diamondShop.control.click_shopUpdate)

		local var_4_14 = CCMenu:create()

		if conf.language == "vie" then
			var_4_14:setPosition(ccp(-115, -40))
		else
			var_4_14:setPosition(ccp(0, 0))
		end

		var_4_14:addChild(var_4_13, 1, arg_4_0)

		if conf.language == "vie" then
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_14, 100)
		else
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_14, 10)
		end

		if tonumber(var_4_1.rTimes) > 0 or var_4_1.spMerchant == true then
			local var_4_15 = "res/ui/weapon/diamondShop/warlock_view_up_list_pic_" .. arg_4_0 .. ".png"
			local var_4_16 = CCSprite:create(var_4_15)

			var_4_16:setPosition(ccp(93, 202))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_16, 8)

			diamondShop.ui.table["singlePeople_" .. arg_4_0] = var_4_16

			if var_4_1.spMerchant == true then
				local var_4_17 = CCSprite:create("res/ui/weapon/diamondShop/warlock_view_up_list_gem_bg.png")

				var_4_17:setPosition(35, 80)
				diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_17)

				local var_4_18 = CCSprite:create("res/ui/weapon/diamondShop/warlock_view_up_list_gem.png")

				var_4_18:setPosition(23, 23)
				var_4_17:addChild(var_4_18)

				local var_4_19 = CCStrokeLabelTTF:create(language.get(490026, var_4_1.gainAmount), "Thonburi-Bold", 18)

				var_4_19:setPosition(42, 4)
				var_4_19:setAnchorPoint(ccp(1, 0))
				var_4_17:addChild(var_4_19)
			else
				local var_4_20 = "res/ui/weapon/diamondShop/warlock_tit_time_" .. tonumber(var_4_1.rTimes) .. ".png"
				local var_4_21 = CCSprite:create(var_4_20)

				var_4_21:setPosition(ccp(35, 90))
				diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_21, 10)

				diamondShop.ui.table["singleTime_" .. arg_4_0] = var_4_21

				local var_4_22 = "res/ui/weapon/diamondShop/warlock_tit_time_0.png"
				local var_4_23 = CCSprite:create(var_4_22)

				var_4_23:setPosition(ccp(35, 70))
				diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_23, 10)

				diamondShop.ui.table["singleTime_" .. arg_4_0] = var_4_23
			end

			local var_4_24 = "res/ui/weapon/diamondShop/bssh_icon_bssq.png"

			if var_4_1.spMerchant == true then
				var_4_24 = "res/ui/playerInfo/icon_gold.png"
			end

			local var_4_25 = CCSprite:create(var_4_24)

			var_4_25:setScale(0.6)
			var_4_25:setPosition(ccp(85, 80))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_25, 10)

			diamondShop.ui.table["singleTime_" .. arg_4_0] = var_4_25

			local var_4_26 = CCLabelTTF:create(var_4_1.cunsumeAmount, "", 18)

			var_4_26:setPosition(ccp(140, 80))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_26, 10)

			if var_4_1.isEnough == false then
				var_4_26:setColor(ccc3(224, 0, 0))
			end

			if var_4_1.spMerchant == true then
				var_4_26:setColor(ccc3(255, 255, 0))
			end

			local var_4_27 = CCSprite:create("res/default.png")
			local var_4_28 = CCSprite:create("res/default.png")
			local var_4_29 = CCMenuItemSprite:create(var_4_27, var_4_28)

			var_4_29:setPosition(ccp(93, 202))
			var_4_29:setScaleX(40)
			var_4_29:setScaleY(47.5)
			var_4_29:registerScriptTapHandler(diamondShop.control.click_exchange)

			local var_4_30 = CCMenu:create()

			var_4_30:setPosition(ccp(0, 0))
			var_4_30:addChild(var_4_29, 1, arg_4_0)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_30, 10)

			local var_4_31 = CCSprite:create("res/ui/weapon/diamondShop/warlock_btn_sj_a.png")
			local var_4_32 = CCSprite:create("res/ui/weapon/diamondShop/warlock_btn_sj_b.png")
			local var_4_33 = CCMenuItemSprite:create(var_4_31, var_4_32)

			var_4_33:registerScriptTapHandler(diamondShop.control.click_exchange)
			var_4_33:setPosition(ccp(93, 30))

			local var_4_34 = CCMenu:create()

			var_4_34:setPosition(ccp(0, 0))
			var_4_34:addChild(var_4_33, 1, arg_4_0)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_34, 10)

			local var_4_35 = 122030
			local var_4_36 = colorText[10004]

			if var_4_1.spMerchant == true then
				var_4_35 = 101018
				var_4_36 = ccc3(255, 255, 0)
			end

			local var_4_37 = CCLabelTTF:create(language.get(var_4_35), "", 24)

			var_4_37:setPosition(ccp(93, 30))
			var_4_37:setColor(var_4_36)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_37, 11)

			if var_4_1.spMerchant ~= true then
				local var_4_38 = "res/ui/weapon/diamondShop/warlock_view_up_list_3_up.png"
				local var_4_39 = CCSprite:create(var_4_38)

				var_4_39:setPosition(ccp(93, -30))
				diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_39, 10)

				local var_4_40 = var_4_39
				local var_4_41 = CCLabelTTF:create(language.get(122031), "Thonburi-Bold", 22)

				var_4_41:setPosition(ccp(50, 30))
				var_4_40:addChild(var_4_41, 11)

				local var_4_42 = CCSprite:createWithSpriteFrameName("res_icon_7.png")

				var_4_42:setPosition(ccp(90, 30))
				var_4_42:setScale(0.7)
				var_4_40:addChild(var_4_42, 11)

				local var_4_43 = CCLabelTTF:create("x " .. var_4_1.gainAmount, "", 24)

				var_4_43:setPosition(ccp(130, 30))
				var_4_40:addChild(var_4_43, 11)
			end
		elseif var_4_1.maxBuyTimes and var_4_1.buyTimes and var_4_1.maxBuyTimes > var_4_1.buyTimes then
			local var_4_44 = CCSprite:create("res/default.png")
			local var_4_45 = CCSprite:create("res/default.png")
			local var_4_46 = CCMenuItemSprite:create(var_4_44, var_4_45)

			var_4_46:setPosition(ccp(93, 202))
			var_4_46:setScaleX(40)
			var_4_46:setScaleY(47.5)
			var_4_46:registerScriptTapHandler(diamondShop.control.click_buhuo)

			local var_4_47 = CCMenu:create()

			var_4_47:setPosition(ccp(0, 0))
			var_4_47:addChild(var_4_46, 1, arg_4_0)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_47, 10)

			local var_4_48 = CCSprite:create("res/ui/weapon/diamondShop/warlock_btn_sj_a.png")
			local var_4_49 = CCSprite:create("res/ui/weapon/diamondShop/warlock_btn_sj_b.png")
			local var_4_50 = CCMenuItemSprite:create(var_4_48, var_4_49)

			var_4_50:registerScriptTapHandler(diamondShop.control.click_buhuo)
			var_4_50:setPosition(ccp(93, 30))

			local var_4_51 = CCMenu:create()

			var_4_51:setPosition(ccp(0, 0))
			var_4_51:addChild(var_4_50, 1, arg_4_0)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_51, 10)

			local var_4_52 = CCLabelTTF:create(language.get(122066), "", 24)

			var_4_52:setPosition(ccp(93, 30))
			var_4_52:setColor(colorText[10004])
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_52, 11)

			local var_4_53 = "res/ui/weapon/diamondShop/warlock_view_up_list_3_up.png"
			local var_4_54 = CCSprite:create(var_4_53)

			var_4_54:setPosition(ccp(93, -30))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_54, 10)

			local var_4_55 = var_4_54
			local var_4_56 = CCLabelTTF:create(language.get(122067), "Thonburi-Bold", 22 + var_4_0.buhuoFontSize)

			var_4_56:setPosition(ccp(50, 30))
			var_4_55:addChild(var_4_56, 11)

			local var_4_57 = CCSprite:createWithSpriteFrameName("res_icon_19.png")

			var_4_57:setPosition(ccp(90 + var_4_0.buhuoGoldX, 30))
			var_4_57:setScale(0.7)
			var_4_55:addChild(var_4_57, 11)

			if var_4_1.gold then
				local var_4_58 = CCLabelTTF:create("x " .. var_4_1.gold, "", 24 + var_4_0.buhuoFontSize)

				var_4_58:setPosition(ccp(130 + var_4_0.buhuoGoldX, 30))
				var_4_55:addChild(var_4_58, 11)
			end
		else
			local var_4_59 = CCLabelTTF:create(language.get(122033), "", 24 + var_4_0.overFontSize)

			var_4_59:setPosition(ccp(93, 30))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_59, 10)
		end
	else
		if diamondShop.data.hasLink == true and arg_4_0 == diamondShop.data.curShopId + 1 then
			local var_4_60 = "res/ui/weapon/diamondShop/warlock_view_up_list_peop_tz.png"
			local var_4_61 = CCSprite:create(var_4_60)

			var_4_61:setPosition(ccp(93, 55))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_61, 10)

			local var_4_62 = "res/ui/weapon/diamondShop/warlock_tit_gmtz_purple.png"
			local var_4_63 = CCSprite:create(var_4_62)

			var_4_63:setPosition(ccp(93, 30))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_63, 11)

			local var_4_64 = CCSprite:create("res/default.png")
			local var_4_65 = CCSprite:create("res/default.png")
			local var_4_66 = CCMenuItemSprite:create(var_4_64, var_4_65)

			var_4_66:setPosition(ccp(93, 55))
			var_4_66:setScale(25)
			var_4_66:registerScriptTapHandler(diamondShop.control.click_buy)

			local var_4_67 = CCMenu:create()

			var_4_67:setPosition(ccp(0, 0))
			var_4_67:addChild(var_4_66, 1, arg_4_0)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_67, 10)
		end

		if diamondShop.data.hasUpgradeButton == true and arg_4_0 == diamondShop.data.curShopId + 1 then
			local var_4_68 = "res/ui/weapon/diamondShop/warlock_view_up_list_peop_tz.png"
			local var_4_69 = CCSprite:create(var_4_68)

			var_4_69:setPosition(ccp(93, 55))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_69, 10)

			local var_4_70 = "res/ui/weapon/diamondShop/warlock_tit_djkq_purple.png"
			local var_4_71 = CCSprite:create(var_4_70)

			var_4_71:setPosition(ccp(93, 170))
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_71, 11)

			local var_4_72 = CCSprite:create("res/default.png")
			local var_4_73 = CCSprite:create("res/default.png")
			local var_4_74 = CCMenuItemSprite:create(var_4_72, var_4_73)

			var_4_74:setPosition(ccp(93, 215))
			var_4_74:setScale(38)
			var_4_74:registerScriptTapHandler(diamondShop.control.click_open)

			local var_4_75 = CCMenu:create()

			var_4_75:setPosition(ccp(0, 0))
			var_4_75:addChild(var_4_74, 1, arg_4_0)
			diamondShop.ui.table["singleBg_" .. arg_4_0]:addChild(var_4_75, 10)
		end
	end

	if diamondShop.data.furnaceLv == arg_4_0 or diamondShop.data.furnaceLv == 0 and arg_4_0 == 5 then
		if diamondShop.data.furnaceLv ~= 0 then
			local var_4_76 = diamondShop.ui.table["singleBg_" .. arg_4_0]
			local var_4_77 = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png", CCRectMake(24, 24, 1, 1))

			var_4_77:setPreferredSize(CCSizeMake(165, 80))
			var_4_77:setPosition(ccp(93, 145))

			local var_4_78 = CCStrokeLabelTTF:create(language.get(135509, diamondShop.data.furnaceNeedTimes - diamondShop.data.furnaceTimes, diamondShop.data.furnaceLv), "Thonburi-Bold", 18)

			var_4_78:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_4_77:addChild(var_4_78)
			var_4_78:setDimensions(CCSizeMake(160, 0))
			var_4_77:setPreferredSize(CCSizeMake(var_4_78:getContentSize().width + 10, var_4_78:getContentSize().height + 10))
			var_4_78:setAnchorPoint(ccp(0, 1))
			var_4_78:setPosition(ccp(5, var_4_78:getContentSize().height + 5))

			local var_4_79 = CCArray:create()

			var_4_79:addObject(CCMoveBy:create(1, ccp(0, 20)))
			var_4_79:addObject(CCEaseBounceOut:create(CCMoveBy:create(0.5, ccp(0, -20))))

			local var_4_80 = CCSequence:create(var_4_79)

			var_4_77:runAction(CCRepeatForever:create(var_4_80))
			var_4_76:addChild(var_4_77, 100)
		end

		if diamondShop.lastFurnaceLv and (diamondShop.lastFurnaceLv + 1 == diamondShop.data.furnaceLv or diamondShop.lastFurnaceLv == 5 and diamondShop.data.furnaceLv == 0) then
			log.info("显示获得新神鼎")

			local var_4_81 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)
			local var_4_82 = CCSprite:create("res/ui/activity/ironRotary/btdzp_lig.png")

			var_4_82:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
			var_4_82:setScale(1.5)

			local var_4_83 = CCSprite:create("res/ui/activity/furnace/sdyjs_sd_0" .. tostring(diamondShop.lastFurnaceLv + 1) .. ".png")

			var_4_83:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

			local var_4_84 = CCSprite:create("res/ui/activity/furnace/sdyjs_info_bg.png")

			var_4_84:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 200))

			local var_4_85 = CCSprite:create("res/ui/activity/furnace/sdyjs_word_gxnhd.png")

			var_4_85:setPosition(ccp(visibleSize.width / 2 - 100, visibleSize.height / 2 - 195))

			local var_4_86 = CCSprite:create("res/ui/activity/furnace/sdyjs_word_sd" .. tostring(diamondShop.lastFurnaceLv) .. ".png")

			var_4_86:setAnchorPoint(ccp(0, 0.5))
			var_4_86:setPosition(ccp(var_4_85:getPositionX() + var_4_85:getContentSize().width / 2 + 4, visibleSize.height / 2 - 195))
			var_4_82:runAction(CCRepeatForever:create(CCRotateBy:create(5, 360)))
			var_4_81:addChild(var_4_82)
			var_4_81:addChild(var_4_83)
			var_4_81:addChild(var_4_84)
			var_4_81:addChild(var_4_85)
			var_4_81:addChild(var_4_86)
			var_4_81:registerScriptTouchHandler(function(arg_5_0, arg_5_1, arg_5_2)
				if arg_5_0 == CCTOUCHBEGAN then
					return true
				elseif arg_5_0 == CCTOUCHMOVED then
					return true
				elseif arg_5_0 == CCTOUCHENDED then
					log.info("############################### touch color layer")
					activityUI.show(activityConstant.TYPES.ACTIVITY_FURNACE.tag)

					return true
				elseif arg_5_0 == CCTOUCHCANCELLED then
					return true
				end
			end, false, true)
			var_4_81:setTouchEnabled(true)
			var_4_81:setPosition(diamondShop.ui.table.bg:convertToNodeSpace(ccp(0, 0)))
			diamondShop.ui.table.bg:addChild(var_4_81, 10000)
		end

		diamondShop.lastFurnaceLv = diamondShop.data.furnaceLv

		log.info("######################## furnaceLv " .. tostring(diamondShop.data.furnaceLv))
	end
end

function diamondShop.ui.init()
	diamondShop.ui.table.btn_tips:registerScriptTapHandler(diamondShop.control.click_tips)
end

function diamondShop.ui.show()
	local var_7_0 = createBaseLayer()

	diamondShop.ui.table = autoUI.initUI(var_7_0, getDiamondShopData())
	diamondShop.ui.table.layer = var_7_0

	var_7_0:registerScriptTouchHandler(diamondShop.ui.onTouch)
	var_7_0:setTouchEnabled(true)
	diamondShop.ui.init()
	diamondShop.control.request_diamondShopInfo()

	diamondShop.lastFurnaceLv = nil

	return var_7_0
end
