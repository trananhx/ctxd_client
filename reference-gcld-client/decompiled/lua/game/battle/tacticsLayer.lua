TAG_TACTICS_STRATEGY = 100

function createTacticsLayer(arg_1_0, arg_1_1)
	rmgr.loadResource("res/ui/battle/fightInfo/fightInfo.plist")
	rmgr.loadResource("res/ui/battle/tractics/tractics.plist")
	rmgr.loadResource("res/ui/battle/tractics/tacticsSelect.plist")

	local var_1_0 = createBaseLayer()

	function var_1_0.onExit()
		guide.ui.setVisible(false)
	end

	local function var_1_1(arg_3_0)
		if arg_1_0.battleType == battleType.BATTLE_DEMO then
			if bmgr.reportAttType ~= arg_3_0 then
				return
			end

			tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.tacticsPanel)

			arg_1_0.fightControl.waitForDemo = 0
		elseif arg_1_0.battleType == battleType.BATTLE_KFWD then
			kfcmgr.sendRequest(arg_1_0.handlerUseStrategy, actions.kfwdUsest, arg_3_0)
		elseif arg_1_0.battleType == battleType.BATTLE_KFGZ_SOLO or arg_1_0.battleType == battleType.BATTLE_KFGZ or arg_1_0.battleType == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_1_0.battleType == battleType.BATTLE_KFYZ_JIAOZHEN then
			kfcmgr.sendRequest(arg_1_0.handlerUseStrategy, actions.kfgzUseTactic, arg_1_0.teamId, arg_3_0)
		elseif arg_1_0.battleType == battleType.BATTLE_KFZB then
			kfcmgr.sendRequest(arg_1_0.handlerUseStrategy, actions.kfzbUseST, arg_3_0)
		else
			cmgr.sendRequest(arg_1_0.handlerUseStrategy, actions.battleUserStrategy, arg_3_0, arg_1_1.pos, arg_1_0.battleId)
		end
	end

	local var_1_2 = CCSprite:createWithSpriteFrameName("tactics_background.png")

	if conf.language == "tw" then
		var_1_2:setPosition(ccp(visibleSize.width * 0.8, 330))
	else
		var_1_2:setPosition(ccp(visibleSize.width * 0.5, 330))
	end

	var_1_0:addChild(var_1_2)

	local var_1_3 = var_1_2:getContentSize().width * 0.5
	local var_1_4 = var_1_2:getContentSize().height * 0.5
	local var_1_5 = getTacticsPicDetail(arg_1_1.panel.id1)
	local var_1_6 = getTacticsPicDetail(arg_1_1.panel.id2)
	local var_1_7 = getTacticsPicDetail(arg_1_1.panel.id3)
	local var_1_8 = CCMenu:create()
	local var_1_9 = CCSprite:createWithSpriteFrameName(string.format("%s_up.png", var_1_5))
	local var_1_10 = CCSprite:createWithSpriteFrameName(string.format("%s_down.png", var_1_5))
	local var_1_11 = CCSprite:createWithSpriteFrameName(string.format("%s_disable.png", var_1_5))
	local var_1_12 = CCMenuItemSprite:create(var_1_9, var_1_10, var_1_11)

	var_1_12:registerScriptTapHandler(var_1_1)
	var_1_12:setPosition(ccp(var_1_3 + 122, var_1_4 - 65))
	var_1_8:addChild(var_1_12, 1, arg_1_1.panel.id1)

	local var_1_13 = CCSprite:createWithSpriteFrameName(string.format("%s_up.png", var_1_6))
	local var_1_14 = CCSprite:createWithSpriteFrameName(string.format("%s_down.png", var_1_6))
	local var_1_15 = CCSprite:createWithSpriteFrameName(string.format("%s_disable.png", var_1_6))
	local var_1_16 = CCMenuItemSprite:create(var_1_13, var_1_14, var_1_15)

	var_1_16:registerScriptTapHandler(var_1_1)
	var_1_16:setPosition(ccp(var_1_3 - 122, var_1_4 - 65))
	var_1_8:addChild(var_1_16, 1, arg_1_1.panel.id2)

	local var_1_17 = CCSprite:createWithSpriteFrameName(string.format("%s_up.png", var_1_7))
	local var_1_18 = CCSprite:createWithSpriteFrameName(string.format("%s_down.png", var_1_7))
	local var_1_19 = CCSprite:createWithSpriteFrameName(string.format("%s_disable.png", var_1_7))
	local var_1_20 = CCMenuItemSprite:create(var_1_17, var_1_18, var_1_19)

	var_1_20:registerScriptTapHandler(var_1_1)
	var_1_20:setPosition(ccp(var_1_3 - 5, var_1_4 + 145))
	var_1_8:addChild(var_1_20, 1, arg_1_1.panel.id3)

	if arg_1_1.strategy.isChaos then
		var_1_12:setEnabled(false)
		var_1_16:setEnabled(false)
		var_1_20:setEnabled(false)
	end

	require("lua/guide/control")

	guide.uiElementsTable[2001] = var_1_12
	guide.uiElementsTable[2002] = var_1_16
	guide.uiElementsTable[2003] = var_1_20

	if arg_1_1.strategy and arg_1_1.strategy.useAble > 0 then
		local var_1_21 = CCSprite:createWithSpriteFrameName("tactics_view_lig.png")

		var_1_21:setScale(1.2)
		var_1_21:setPosition(ccp(var_1_2:getContentSize().width / 2, var_1_2:getContentSize().height / 2))

		local var_1_22 = CCArray:create()

		var_1_22:addObject(CCFadeOut:create(0.4))
		var_1_22:addObject(CCFadeIn:create(0.4))

		local var_1_23 = CCSequence:create(var_1_22)

		var_1_21:runAction(CCRepeatForever:create(var_1_23))
		var_1_2:addChild(var_1_21, 1)

		local var_1_24 = CCSprite:createWithSpriteFrameName("tactics_view_bg.png")
		local var_1_25

		if arg_1_1.strategy.juexing and arg_1_1.strategy.juexing == 1 then
			if arg_1_1.strategy.isChaos or arg_1_1.strategy.isWoman then
				var_1_25 = GraySprite:create("res/ui/general/juexing/jx_btn_j_c.png")
			else
				var_1_25 = CCSprite:create("res/ui/general/juexing/jx_btn_j_c.png")
			end
		elseif arg_1_1.strategy.isChaos or arg_1_1.strategy.isWoman then
			var_1_25 = GraySprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_1_1.strategy.gPic))
		else
			var_1_25 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_1_1.strategy.gPic))
		end

		var_1_25:setPosition(ccp(var_1_24:getContentSize().width / 2, var_1_24:getContentSize().height / 2))
		var_1_25:setScale(1.125)
		var_1_24:addChild(var_1_25)

		local var_1_26 = CCSprite:createWithSpriteFrameName("tactics_view_bg.png")
		local var_1_27

		if arg_1_1.strategy.juexing and arg_1_1.strategy.juexing == 1 then
			if arg_1_1.strategy.isChaos or arg_1_1.strategy.isWoman then
				var_1_27 = GraySprite:create("res/ui/general/juexing/jx_btn_j_c.png")
			else
				var_1_27 = CCSprite:create("res/ui/general/juexing/jx_btn_j_c.png")
			end
		elseif arg_1_1.strategy.isChaos or arg_1_1.strategy.isWoman then
			var_1_27 = GraySprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_1_1.strategy.gPic))
		else
			var_1_27 = CCSprite:create(string.format("res/ui/common/fightPic/fightPic_%s.png", arg_1_1.strategy.gPic))
		end

		var_1_27:setPosition(ccp(var_1_26:getContentSize().width / 2, var_1_26:getContentSize().height / 2))
		var_1_27:setScale(1.125)
		var_1_26:addChild(var_1_27)

		local var_1_28 = CCMenuItemSprite:create(var_1_24, var_1_26)

		var_1_28:setScale(1.2)
		var_1_28:setPosition(ccp(var_1_2:getContentSize().width / 2, var_1_2:getContentSize().height / 2))
		var_1_28:registerScriptTapHandler(var_1_1)
		var_1_8:addChild(var_1_28, 1, TAG_TACTICS_STRATEGY)

		if arg_1_1.strategy.isChaos or arg_1_1.strategy.isWoman then
			var_1_28:setEnabled(false)
		end

		if arg_1_1.strategy.useAble > 1 then
			local var_1_29 = CCSprite:createWithSpriteFrameName("icon_numb_multi.png")
			local var_1_30 = CCLabelAtlas:create(tostring(arg_1_1.strategy.useAble), "res/ui/common/number/gen_amount_numb.png", 12, 19, 48)

			var_1_30:setAnchorPoint(ccp(0.5, 0.5))

			local var_1_31 = createRichNode({
				var_1_29,
				var_1_30
			}, 0.5)

			var_1_31:setPosition(ccp(100, 50))
			var_1_28:addChild(var_1_31, 1)
		end
	end

	if arg_1_1.strategy.isChaos then
		local var_1_32 = CCSprite:createWithSpriteFrameName("battle_tractics_select_tip.png")

		var_1_32:setPosition(ccp(var_1_2:getContentSize().width / 2, var_1_2:getContentSize().height / 2))
		var_1_2:addChild(var_1_32, 100)
	end

	local var_1_33 = CCSprite:createWithSpriteFrameName("tactics_arrows_1.png")

	var_1_33:setPosition(ccp(var_1_3 - 117, var_1_4 + 58))

	local var_1_34 = CCSprite:createWithSpriteFrameName("tactics_arrows_2.png")

	var_1_34:setPosition(ccp(var_1_3 + 110, var_1_4 + 61))

	local var_1_35 = CCSprite:createWithSpriteFrameName("tactics_arrows_3.png")

	var_1_35:setPosition(ccp(var_1_3, var_1_4 - 131))
	var_1_2:addChild(var_1_33, 10)
	var_1_2:addChild(var_1_34, 10)
	var_1_2:addChild(var_1_35, 10)
	var_1_8:setPosition(ccp(0, 0))
	var_1_2:addChild(var_1_8, 10)

	local var_1_36 = arg_1_0.fightControl.battleData.defArmyInfo

	if var_1_36 and (var_1_36[0] or var_1_36[1]) and user.curMainTask.taskId <= 50 then
		local var_1_37 = {}

		var_1_37[190089] = 6
		var_1_37[190090] = 6
		var_1_37[190091] = 6

		local var_1_38 = {}

		var_1_38[190089] = 2002
		var_1_38[190090] = 2003
		var_1_38[190091] = 2001

		local var_1_39

		if var_1_36[0] then
			var_1_39 = basicTaticsById[var_1_36[0].data.tacticsId]

			log.info("defArmyInfo[0].data.tacticsId:", var_1_36[0].data.tacticsId)
		else
			var_1_39 = basicTaticsById[var_1_36[1].data.tacticsId]

			log.info("defArmyInfo[1].data.tacticsId:", var_1_36[1].data.tacticsId)
		end

		local var_1_40 = var_1_37[var_1_39] or 7
		local var_1_41 = guide.uiElementsTable[var_1_38[var_1_39]]

		if var_1_41 then
			local var_1_42, var_1_43 = tool.getPositionInScreen(var_1_41)

			if var_1_40 == 6 then
				var_1_42 = var_1_42 - var_1_41:getContentSize().width - 50
			elseif var_1_40 == 7 then
				var_1_43 = var_1_43 + var_1_41:getContentSize().height
			elseif var_1_40 == 8 then
				var_1_42 = var_1_42 + var_1_41:getContentSize().width + 20
			end

			log.info("arrowDirectionTable[tacticType]:", var_1_37[var_1_39], var_1_42, var_1_43, guide.uiElementsTable[var_1_38[var_1_39]])
			log.info("should selected button :", var_1_38[var_1_39], var_1_39)
			guide.control.loadGuide2(var_1_40, var_1_42, var_1_43, false, language.get(190109))
		end
	end

	if arg_1_1.strategy.isChaos then
		tool.spriteToGray(var_1_2, true)
	end

	return var_1_0
end
