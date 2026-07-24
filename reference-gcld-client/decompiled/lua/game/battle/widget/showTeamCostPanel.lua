function showTeamCostPanel(arg_1_0, arg_1_1)
	local var_1_0 = {}

	if conf.language == "vie" then
		var_1_0.genNumX = 50
		var_1_0.expRewardX = 75
		var_1_0.costNeedX = 48
		var_1_0.moraleX = 20
		var_1_0.moraleY = 20
		var_1_0.forcesX = 20
		var_1_0.forcesY = 20
		var_1_0.inspireEffectX = -100
		var_1_0.inspireEffectY = -30
		var_1_0.totalForcesY = -30
	else
		var_1_0.genNumX = 0
		var_1_0.expRewardX = 0
		var_1_0.costNeedX = 0
		var_1_0.moraleX = 0
		var_1_0.moraleY = 0
		var_1_0.forcesX = 0
		var_1_0.forcesY = 0
		var_1_0.inspireEffectX = 0
		var_1_0.inspireEffectY = 0
		var_1_0.totalForcesY = 0
	end

	rmgr.loadResource("res/ui/battle/jtj/jtj.plist")
	tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.jtj)

	local var_1_1 = createBaseLayer()
	local var_1_2 = {}

	function var_1_2.init()
		var_1_2.panel = CCSprite:createWithSpriteFrameName("jtj_start_view_bg.png")

		var_1_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_1_1:addChild(var_1_2.panel)

		local var_2_0 = CCSprite:create("res/ui/common/text/battle/text_tit_jtj_start.png")

		var_2_0:setPosition(ccp(var_1_2.panel:getContentSize().width * 0.5, var_1_2.panel:getContentSize().height))
		var_1_2.panel:addChild(var_2_0)

		local var_2_1 = CCStrokeLabelTTF:create(language.get(190054), "Thonburi", 22)

		var_2_1:setPosition(ccp(85 + var_1_0.genNumX, 340))
		var_1_2.panel:addChild(var_2_1)

		local var_2_2 = CCStrokeLabelTTF:create(language.get(190055), "Thonburi", 22)

		var_2_2:setPosition(ccp(85 + var_1_0.expRewardX, 300))
		var_1_2.panel:addChild(var_2_2)

		local var_2_3 = CCStrokeLabelTTF:create(language.get(190056), "Thonburi", 22)

		var_2_3:setPosition(ccp(85 + var_1_0.costNeedX, 270))
		var_1_2.panel:addChild(var_2_3)

		local var_2_4 = CCStrokeLabelTTF:create(language.get(190057), "Thonburi", 22)

		var_2_4:setPosition(ccp(95 + var_1_0.moraleX, 135 + var_1_0.moraleY))
		var_1_2.panel:addChild(var_2_4)

		local var_2_5 = CCStrokeLabelTTF:create(language.get(190058), "Thonburi", 22)

		var_2_5:setPosition(ccp(390 + var_1_0.forcesX, 135 + var_1_0.forcesY))
		var_1_2.panel:addChild(var_2_5)

		local var_2_6 = CCMenu:create()

		var_2_6:setPosition(ccp(0, 0))
		var_1_2.panel:addChild(var_2_6)

		if arg_1_1.inspireEffect == 0 then
			local var_2_7 = CCSprite:createWithSpriteFrameName("btn_jtj_gw_a.png")
			local var_2_8 = CCSprite:createWithSpriteFrameName("btn_jtj_gw_click.png")
			local var_2_9 = CCMenuItemSprite:create(var_2_7, var_2_8)

			var_2_9:registerScriptTapHandler(arg_1_0.inspire)
			var_2_9:setPosition(ccp(110, 185))
			var_2_6:addChild(var_2_9)

			local var_2_10 = CCSprite:createWithSpriteFrameName("res_icon_19.png")
			local var_2_11 = CCLabelAtlas:create(tostring(arg_1_1.inspireCost), "res/ui/common/number/up_numb.png", 16, 21, 48)

			var_2_10:setPosition(ccp(200, 185))
			var_2_11:setPosition(ccp(var_2_10:getContentSize().width * 0.5 + 20, 0))
			var_2_10:addChild(var_2_11)
			var_1_2.panel:addChild(var_2_10)

			arg_1_0.inspireCost = arg_1_1.inspireCost
		end

		if arg_1_1.order == false then
			local var_2_12 = CCSprite:createWithSpriteFrameName("btn_jtj_hl_a.png")
			local var_2_13 = CCSprite:createWithSpriteFrameName("btn_jtj_hl_click.png")
			local var_2_14 = CCMenuItemSprite:create(var_2_12, var_2_13)

			var_2_14:registerScriptTapHandler(arg_1_0.order)
			var_2_14:setPosition(ccp(400, 185))
			var_2_6:addChild(var_2_14)

			local var_2_15 = CCSprite:createWithSpriteFrameName("res_icon_19.png")
			local var_2_16 = CCLabelAtlas:create(tostring(arg_1_1.orderGold), "res/ui/common/number/up_numb.png", 16, 21, 48)

			var_2_15:setPosition(ccp(490, 185))
			var_2_16:setPosition(ccp(var_2_15:getContentSize().width * 0.5 + 20, 0))
			var_2_15:addChild(var_2_16)
			var_1_2.panel:addChild(var_2_15)

			arg_1_0.orderGold = arg_1_1.orderGold
		end

		local var_2_17 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
		local var_2_18 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
		local var_2_19 = CCStrokeLabelTTF:create(language.get(190059), "Thonburi", 20, 2, colorText[10005])

		var_2_19:setColor(colorText[10004])
		var_2_19:setPosition(ccp(var_2_17:getContentSize().width * 0.5, var_2_17:getContentSize().height * 0.5))

		local var_2_20 = CCMenuItemSprite:create(var_2_17, var_2_18)

		var_2_20:registerScriptTapHandler(arg_1_0.blitzkrieg)
		var_2_20:setPosition(ccp(215, 60))
		var_2_20:addChild(var_2_19)
		var_2_6:addChild(var_2_20)

		local var_2_21 = CCSprite:createWithSpriteFrameName("btn_default_normal.png")
		local var_2_22 = CCSprite:createWithSpriteFrameName("btn_default_lighted.png")
		local var_2_23 = CCStrokeLabelTTF:create(language.get(190060), "Thonburi", 20, 2, colorText[10005])

		var_2_23:setColor(colorText[10004])
		var_2_23:setPosition(ccp(var_2_21:getContentSize().width * 0.5, var_2_21:getContentSize().height * 0.5))

		local var_2_24 = CCMenuItemSprite:create(var_2_21, var_2_22)

		var_2_24:registerScriptTapHandler(arg_1_0.defensiveWar)
		var_2_24:setPosition(ccp(410, 60))
		var_2_24:addChild(var_2_23)
		var_2_6:addChild(var_2_24)

		local var_2_25 = CCSprite:createWithSpriteFrameName("jtj_icon_recomm.png")

		var_2_25:setPosition(ccp(10, 40))

		if arg_1_0.figthSide == "att" then
			var_2_20:addChild(var_2_25)
		else
			var_2_24:addChild(var_2_25)
		end

		local var_2_26 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
		local var_2_27 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
		local var_2_28 = CCStrokeLabelTTF:create(language.get(190061), "Thonburi", 20, 2, colorText[10005])

		var_2_28:setColor(colorText[10004])
		var_2_28:setPosition(ccp(var_2_26:getContentSize().width * 0.5, var_2_26:getContentSize().height * 0.5))

		local var_2_29 = CCMenuItemSprite:create(var_2_26, var_2_27)

		var_2_29:addChild(var_2_28)
		var_2_29:registerScriptTapHandler(arg_1_0.dismiss)
		var_2_29:setPosition(ccp(525, 340))
		var_2_6:addChild(var_2_29)

		local var_2_30 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
		local var_2_31 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
		local var_2_32 = CCMenuItemSprite:create(var_2_30, var_2_31)

		var_2_32:registerScriptTapHandler(var_1_2.close)
		var_2_32:setScale(1.5)
		var_2_32:setPosition(ccp(605, 425))
		var_2_6:addChild(var_2_32)

		local var_2_33 = CCLabelAtlas:create(tostring(arg_1_1.curNum), "res/ui/common/number/jtj_general_num.png", 29, 49, 48)

		var_2_33:setAnchorPoint(ccp(0, 0.5))

		local var_2_34 = CCLabelAtlas:create(tostring(arg_1_1.maxNum), "res/ui/common/number/jtj_general_num.png", 29, 49, 48)

		var_2_34:setAnchorPoint(ccp(0, 0.5))

		local var_2_35 = CCSprite:createWithSpriteFrameName("general_numb_slash.png")

		var_2_33:setPosition(ccp(var_2_1:getContentSize().width * 0.5 + 10, 0))
		var_2_35:setPosition(ccp(var_2_33:getPositionX() + var_2_33:getContentSize().width + 5, 0))
		var_2_34:setPosition(ccp(var_2_35:getPositionX() + 5, 0))
		var_2_1:addChild(var_2_33)
		var_2_1:addChild(var_2_35)
		var_2_1:addChild(var_2_34)

		local var_2_36 = CCLabelAtlas:create(tostring(arg_1_1.teamExp), "res/ui/common/number/jtj_exp_num.png", 16, 21, 48)

		var_2_36:setAnchorPoint(ccp(0, 0.5))
		var_2_36:setPosition(ccp(var_2_2:getContentSize().width * 0.5 + 10, 0))
		var_2_2:addChild(var_2_36)

		local var_2_37 = CCSprite:createWithSpriteFrameName("res_icon_19.png")
		local var_2_38 = CCLabelAtlas:create(tostring(arg_1_1.gold), "res/ui/common/number/up_numb.png", 16, 21, 48)

		var_2_38:setAnchorPoint(ccp(0, 0.5))
		var_2_37:setPosition(ccp(var_2_3:getContentSize().width * 0.5 + var_2_37:getContentSize().width * 0.5 + 10, 0))
		var_2_38:setPosition(ccp(var_2_37:getPositionX() + var_2_37:getContentSize().width * 0.5 + 10, 0))
		var_2_3:addChild(var_2_37)
		var_2_3:addChild(var_2_38)

		local var_2_39

		if arg_1_1.inspireEffect == 0 then
			var_2_39 = language.get(190062)
		else
			var_2_39 = language.get(190063, arg_1_1.inspireEffect)
		end

		local var_2_40 = CCStrokeLabelTTF:create(var_2_39, "Thonburi", 22)

		var_2_40:setPosition(ccp(var_2_4:getContentSize().width * 0.5 + 10 + var_2_40:getContentSize().width * 0.5 + var_1_0.inspireEffectX, 0 + var_1_0.inspireEffectY))
		var_2_4:addChild(var_2_40)

		local var_2_41 = string.format("%d/%d", arg_1_1.totalForces, arg_1_1.totalMaxForces)
		local var_2_42 = CCStrokeLabelTTF:create(var_2_41, "Thonburi", 22)

		var_2_42:setPosition(ccp(var_2_5:getContentSize().width * 0.5 + 10 + var_2_42:getContentSize().width * 0.5, 0 + var_1_0.totalForcesY))
		var_2_5:addChild(var_2_42)
	end

	function var_1_2.close()
		tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.jtj)

		arg_1_0.team.show = false
	end

	function var_1_2.getCD()
		local function var_4_0(arg_5_0)
			local var_5_0 = arg_5_0.action.data.teamList

			if var_5_0 then
				for iter_5_0, iter_5_1 in pairs(var_5_0) do
					if iter_5_1.isCreator then
						local var_5_1 = iter_5_1.countDown
						local var_5_2 = createTimerLabel(var_5_1, "@H:@M:@S", "Thonburi", 22, var_1_2.close)

						var_5_2:setPosition(ccp(520, 300))
						var_1_2.panel:addChild(var_5_2)

						break
					end
				end
			end
		end

		cmgr.sendRequest(var_4_0, actions.getTeamInfo)
	end

	local function var_1_3(arg_6_0, arg_6_1, arg_6_2)
		return true
	end

	var_1_1:setTouchEnabled(true)
	var_1_1:registerScriptTouchHandler(var_1_3, false, true)
	arg_1_0.layerTabel.uiLayer:addChild(var_1_1, 100, uiTag.jtj)
	var_1_2.init()

	if arg_1_0.battleType ~= battleType.BATTLE_KFGZ then
		var_1_2.getCD()
	end
end
