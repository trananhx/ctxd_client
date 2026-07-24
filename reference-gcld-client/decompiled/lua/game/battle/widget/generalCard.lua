local var_0_0 = {}

TAG_CARD_BACKGROUND = 1
TAG_CARD_DISABLE = 2
TAG_CARD_LIGHT = 3
TAG_SPRITE_FIGHT = 4
STATE_CARD_NORLMAL = 1
STATE_CARD_DIABLE = 2
STATE_CARD_NOT_FULL = 3
STATE_CARD_OTHER = 4

function var_0_0.createEmptyCard()
	local var_1_0 = CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_gray.png")
	local var_1_1 = CCSprite:createWithSpriteFrameName("battle_pre_gen_qual_empty.png")

	var_1_1:setPosition(ccp(var_1_0:getContentSize().width * 0.5, 120))
	var_1_0:addChild(var_1_1, 1, TAG_SPRITE_FIGHT)

	return var_1_0
end

function var_0_0.createGeneralCard()
	local var_2_0 = {}

	function var_2_0.handlerGeneralInfo(arg_3_0)
		local var_3_0 = arg_3_0.action.data
		local var_3_1 = var_3_0.military
		local var_3_2 = var_3_0.deputyInfos

		if var_3_1 then
			for iter_3_0, iter_3_1 in pairs(var_3_1) do
				if iter_3_1.generalId == var_2_0.userData.generalId then
					if var_3_2 then
						for iter_3_2, iter_3_3 in ipairs(var_3_2) do
							if iter_3_3.chiefId == iter_3_1.generalId then
								iter_3_1.forces = iter_3_1.forces + iter_3_3.forces
								iter_3_1.forcesMax = iter_3_1.forcesMax + iter_3_3.forcesMax

								table.remove(var_3_2, iter_3_2)

								break
							end
						end
					end

					var_2_0.refresh(iter_3_1)
					var_2_0.generalCard:removeAllChildrenWithCleanup(true)

					local var_3_3 = var_2_0.buildCard(var_2_0.isSelf)

					var_2_0.generalCard:addChild(var_3_3)

					var_2_0.cardSprite = var_3_3

					return
				end
			end
		end
	end

	function var_2_0.handlerRecover(arg_4_0)
		cmgr.sendRequest(var_2_0.handlerGeneralInfo, actions.generalInfos2, var_2_0.generalId)

		local var_4_0 = CCSprite:create("res/ui/common/text/genealPanel/full_army.png")
		local var_4_1, var_4_2 = tool.getPositionInScreen(var_2_0.cardSprite)

		var_4_0:setPosition(ccp(var_4_1, var_4_2 - 50))
		smgr.showTipSpriteText(var_4_0)
	end

	function var_2_0.generalRecover(arg_5_0)
		local function var_5_0(arg_6_0)
			if arg_6_0.action.state == 1 then
				if arg_6_0.action.data.token and arg_6_0.action.data.token > 0 then
					cmgr.sendRequest(var_2_0.handlerRecover, actions.generalRecover, arg_5_0)
				else
					messageBox.showChargeWin(language.get(10003), language.get(80007, arg_6_0.action.data.gold), "goldRecruit", function()
						cmgr.sendRequest(var_2_0.handlerRecover, actions.generalRecover, arg_5_0)
					end)
				end
			else
				cmgr.sendRequest(var_2_0.handlerGeneralInfo, actions.generalInfos2, var_2_0.generalId)
			end
		end

		cmgr.sendRequest(var_5_0, actions.generalRecoverInfo, arg_5_0)
	end

	function var_2_0.refresh(arg_8_0)
		if arg_8_0 then
			var_2_0.userData.state = arg_8_0.state or var_2_0.userData.state
			var_2_0.userData.side = arg_8_0.side or var_2_0.userData.side
			var_2_0.userData.generalId = arg_8_0.generalId
			var_2_0.userData.generalName = arg_8_0.generalName
			var_2_0.userData.quality = arg_8_0.quality
			var_2_0.userData.armyHp = arg_8_0.armyHp or arg_8_0.forces
			var_2_0.userData.armyHpMax = arg_8_0.armyHpMax or arg_8_0.forcesMax
			var_2_0.userData.generalPic = arg_8_0.generalPic or arg_8_0.pic
			var_2_0.userData.index = arg_8_0.index or var_2_0.userData.index
			var_2_0.userData.generalLv = arg_8_0.generalLv
			var_2_0.userData.reason = arg_8_0.reason
			var_2_0.userData.tssList = arg_8_0.tssList or var_2_0.userData.tssList
			var_2_0.userData.troopType = arg_8_0.troopType or var_2_0.userData.troopType
			var_2_0.userData.tacticName = arg_8_0.tacticName or var_2_0.userData.tacticName
			var_2_0.userData.needTime = arg_8_0.needTime or var_2_0.userData.needTime
			var_2_0.userData.troopId = arg_8_0.troopId
			var_2_0.state = STATE_CARD_NORLMAL
			var_2_0.userData.isZhujiang = arg_8_0.isChief or false

			if var_2_0.userData.state and var_2_0.userData.state ~= 1 and var_2_0.userData.state ~= 4 then
				var_2_0.state = STATE_CARD_OTHER
			elseif var_2_0.userData.armyHpMax and var_2_0.userData.armyHp < var_2_0.userData.armyHpMax then
				var_2_0.state = STATE_CARD_NOT_FULL
			elseif var_2_0.userData.armyHpMax and var_2_0.userData.armyHp == var_2_0.userData.armyHpMax then
				var_2_0.userData.state = 1
				var_2_0.state = STATE_CARD_NORLMAL
			elseif var_2_0.userData.state == 4 then
				var_2_0.state = STATE_CARD_NOT_FULL
			else
				var_2_0.state = STATE_CARD_NORLMAL
			end

			if not var_2_0.isSelf then
				var_2_0.state = STATE_CARD_NORLMAL
			end

			if showMubingTips then
				showMubingTips()
			end
		end
	end

	function var_2_0.buildCard(arg_9_0)
		multiLangOffset = {}

		if conf.language == "vie" then
			multiLangOffset.otherStateLabelSize = -6
		else
			multiLangOffset.otherStateLabelSize = 0
		end

		local var_9_0 = CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_bg.png")

		if var_2_0.state == STATE_CARD_DIABLE then
			var_9_0 = CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_gray.png")
		end

		local var_9_1 = CCSprite:createWithSpriteFrameName("battle_pre_gen_list_view_on.png")

		var_9_1:setVisible(false)
		var_9_1:setPosition(ccp(var_9_0:getContentSize().width * 0.5, var_9_0:getContentSize().height * 0.5))
		var_9_0:addChild(var_9_1, 0, TAG_CARD_LIGHT)

		if string.find(var_2_0.userData.generalName, language.get(190011)) then
			var_2_0.userData.generalName = language.get(190011)
		end

		local var_9_2

		if conf.language == "vie" then
			var_9_2 = CCStrokeLabelTTF:create(var_2_0.userData.generalName, "Thonburi", 20)
		else
			var_9_2 = CCStrokeLabelTTF:create(var_2_0.userData.generalName, "Thonburi", 25)
		end

		var_9_2:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 190))

		var_2_0.userData.quality = var_2_0.userData.quality or 1

		var_9_2:setColor(colorQuality[var_2_0.userData.quality])

		if conf.language == "vie" then
			var_9_2:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 195))
			var_9_2:setDimensions(CCSizeMake(100, 0))
		end

		var_9_0:addChild(var_9_2, 1)

		local var_9_3 = string.format("res/ui/common/generalHead/generalHead_%s.png", var_2_0.userData.generalPic)
		local var_9_4 = CCSprite:create(var_9_3)

		if var_2_0.userData.isZhujiang == true then
			local var_9_5 = CCSprite:create("res/ui/general/deputy/fj_icon_zj.png")

			var_9_5:setPosition(ccp(20, var_9_4:getContentSize().height - 2))
			var_9_4:addChild(var_9_5)
		end

		local var_9_6 = "battle_pre_gen_qual_white.png"

		if var_2_0.userData.quality == 2 then
			var_9_6 = "battle_pre_gen_qual_blue.png"
		elseif var_2_0.userData.quality == 3 then
			var_9_6 = "battle_pre_gen_qual_green.png"
		elseif var_2_0.userData.quality == 4 then
			var_9_6 = "battle_pre_gen_qual_yellow.png"
		elseif var_2_0.userData.quality == 5 then
			var_9_6 = "battle_pre_gen_qual_red.png"
		elseif var_2_0.userData.quality == 6 then
			var_9_6 = "battle_pre_gen_qual_purple.png"
		end

		if var_2_0.state == STATE_CARD_OTHER then
			var_9_6 = "battle_pre_gen_qual_gray.png"
			var_9_4 = GraySprite:create(var_9_3)

			var_9_2:setColor(colorQuality[0])

			local var_9_7 = language.get(190012)

			if var_2_0.userData.reason then
				var_9_7 = var_2_0.userData.reason
			end

			local var_9_8 = CCStrokeLabelTTF:create(var_9_7, "Thonburi", 24 + multiLangOffset.otherStateLabelSize)

			var_9_8:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 50))
			var_9_8:setColor(ccc3(225, 0, 0))
			var_9_0:addChild(var_9_8, 1)
		elseif var_2_0.state == STATE_CARD_NOT_FULL then
			local var_9_9 = CCSprite:createWithSpriteFrameName("res_icon_5_56_46.png")

			var_9_9:setContentSize(CCSizeMake(40, 40))
			var_9_9:setScale(0.7)

			local var_9_10 = CCSprite:createWithSpriteFrameName("icon_numb_multi.png")
			local var_9_11 = 0

			if var_2_0.userData.needTime and var_2_0.userData.needTime > 0 then
				local function var_9_12()
					cmgr.sendRequest(var_2_0.handlerGeneralInfo, actions.generalInfos2, var_2_0.userData.generalId)
				end

				performWithDelay(var_9_0, var_9_12, var_2_0.userData.needTime / 1000)

				var_9_11 = math.ceil(var_2_0.userData.needTime / 300000)
			end

			local var_9_13 = "res/ui/common/number/gen_amount_numb.png"
			local var_9_14 = CCLabelAtlas:create(string.format("%s", var_9_11), var_9_13, 12, 19, 48)

			var_9_14:setAnchorPoint(ccp(0.5, 0.5))

			local var_9_15 = createRichNode({
				var_9_9,
				var_9_10,
				var_9_14
			}, 0.5)

			var_9_15:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 50))
			var_9_0:addChild(var_9_15, 1)
		elseif var_2_0.state == STATE_CARD_DIABLE then
			var_9_6 = "battle_pre_gen_qual_gray.png"
			var_9_4 = GraySprite:create(var_9_3)

			var_9_2:setColor(colorQuality[0])

			local var_9_16 = CCSprite:createWithSpriteFrameName("gen_djsz.png")

			var_9_16:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 50))
			var_9_0:addChild(var_9_16, 1, TAG_SPRITE_FIGHT)
		else
			if not arg_9_0 and var_2_0.userData.armyHp and var_2_0.userData.armyHp <= 0 then
				log.info("head pic name : ", var_9_3)

				var_9_4 = CCSprite:create(var_9_3)

				tool.spriteToGray(var_9_4)

				local var_9_17 = CCStrokeLabelTTF:create(language.get(190014), "Thonburi", 19)

				var_9_17:setColor(ccc3(225, 0, 0))
				var_9_17:setPosition(ccp(var_9_4:getContentSize().width * 0.5, var_9_17:getContentSize().height * 0.5))
				var_9_4:addChild(var_9_17, 1)
			end

			if arg_9_0 then
				local var_9_18 = CCSprite:createWithSpriteFrameName("gen_djxz.png")

				var_9_18:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 50))
				var_9_0:addChild(var_9_18, 1, TAG_SPRITE_FIGHT)
			end
		end

		local var_9_19 = CCSprite:createWithSpriteFrameName(var_9_6)

		var_9_19:setPosition(ccp(var_9_0:getContentSize().width * 0.5, 120))
		var_9_0:addChild(var_9_19, 1, TAG_SPRITE_FIGHT)
		var_9_4:setPosition(ccp(60, 44))
		var_9_19:addChild(var_9_4)

		local var_9_20 = CCLabelTTF:create(string.format("Lv%s", var_2_0.userData.generalLv), "Thonburi", 22)

		var_9_20:setPosition(ccp(115, 100))
		var_9_20:setAnchorPoint(ccp(1, 1))
		var_9_19:addChild(var_9_20)

		if var_2_0.userData.troopType then
			if var_2_0.userData.troopType > 9 then
				var_2_0.userData.troopType = 9
			end

			local var_9_21 = string.format("troop_%d.png", var_2_0.userData.troopType)
			local var_9_22 = CCSprite:createWithSpriteFrameName(var_9_21)

			var_9_22:setScale(0.85)
			var_9_22:setPosition(ccp(19, 19))
			var_9_0:addChild(var_9_22, 1, TAG_SPRITE_FIGHT)
		end

		if var_2_0.userData.armyHp and var_2_0.userData.armyHpMax then
			local var_9_23 = "battle_pre_gen_blood_con.png"

			if var_2_0.userData.armyHp == var_2_0.userData.armyHpMax then
				var_9_23 = arg_9_0 and "battle_pre_gen_blood_full.png" or "battle_pre_gen_blood_full_red.png"
			end

			local var_9_24 = CCSprite:createWithSpriteFrameName(var_9_23)
			local var_9_25 = CCProgressTimer:create(var_9_24)

			var_9_25:setType(kCCProgressTimerTypeBar)
			var_9_25:setAnchorPoint(ccp(0, 0.5))
			var_9_25:setMidpoint(CCPointMake(0, 0.5))
			var_9_25:setAnchorPoint(ccp(0, 0.5))
			var_9_25:setBarChangeRate(CCPointMake(1, 0))
			var_9_25:setPercentage(var_2_0.userData.armyHp / var_2_0.userData.armyHpMax * 100)
			var_9_25:setPosition(ccp(36, 18))
			var_9_0:addChild(var_9_25, 1, TAG_SPRITE_FIGHT)
		end

		if var_2_0.userData.armyHp then
			local var_9_26 = "res/ui/common/number/gen_amount_numb.png"

			if var_2_0.userData.armyHpMax and var_2_0.userData.armyHpMax > var_2_0.userData.armyHp then
				var_9_26 = "res/ui/common/number/gen_blood_numb_red.png"
			end

			local var_9_27 = CCLabelAtlas:create(string.format("%d", var_2_0.userData.armyHp), var_9_26, 12, 19, 48)

			var_9_27:setAnchorPoint(ccp(0.5, 0.5))
			var_9_27:setPosition(ccp(82, 18))
			var_9_0:addChild(var_9_27, 2, TAG_SPRITE_FIGHT)
		end

		if var_2_0.userData.index then
			local var_9_28 = "res/ui/common/number/battle_prepare_compo_blue.png"

			if var_2_0.userData.side == "def" then
				var_9_28 = "res/ui/common/number/battle_prepare_compo_red.png"
			end

			local var_9_29 = CCLabelAtlas:create(string.format("%d", var_2_0.userData.index), var_9_28, 40, 48, 48)

			var_9_29:setPosition(ccp(85, 70))
			var_9_0:addChild(var_9_29, 2)

			var_2_0.indexSprite = var_9_29
		end

		return var_9_0
	end

	function var_2_0.resetIndex(arg_11_0)
		if arg_11_0.indexSprite then
			var_2_0.indexSprite:setString(string.format("%d", arg_11_0.userData.index))
		end
	end

	function var_2_0.getForce(arg_12_0)
		local var_12_0 = arg_12_0:getCardSprite():getChildByTag(TAG_CARD_LIGHT)

		if var_12_0 then
			var_12_0:stopAllActions()
			pcall(var_12_0.setOpacity, var_12_0, 255)
			var_12_0:setVisible(true)
		end
	end

	function var_2_0.loseForce(arg_13_0)
		local var_13_0 = arg_13_0:getCardSprite():getChildByTag(TAG_CARD_LIGHT)

		if var_13_0 then
			var_13_0:setVisible(false)
		end
	end

	function var_2_0.clicked(arg_14_0)
		if var_2_0.state == STATE_CARD_NOT_FULL then
			var_2_0.generalRecover(var_2_0.userData.generalId)

			return
		elseif var_2_0.state == STATE_CARD_OTHER then
			arg_14_0:loseForce()

			return
		elseif var_2_0.state == STATE_CARD_DIABLE then
			var_2_0.state = STATE_CARD_NORLMAL
		elseif var_2_0.state == STATE_CARD_NORLMAL then
			if user.player.playerLv < 30 then
				var_2_0.state = STATE_CARD_NORLMAL
			else
				var_2_0.state = STATE_CARD_DIABLE
			end
		end

		local var_14_0 = arg_14_0.cardSprite
		local var_14_1 = var_2_0.buildCard(var_2_0.isSelf)

		var_14_1:setVisible(false)
		arg_14_0.generalCard:addChild(var_14_1)

		arg_14_0.cardSprite = var_14_1

		local function var_14_2()
			arg_14_0.generalCard:removeChild(var_14_0, true)
		end

		local var_14_3 = CCArray:create()

		var_14_3:addObject(CCDelayTime:create(0.5))
		var_14_3:addObject(CCShow:create())
		var_14_3:addObject(CCOrbitCamera:create(0.5, 1, 0, 270, 90, 0, 0))
		var_14_1:runAction(CCSequence:create(var_14_3))

		local var_14_4 = CCArray:create()

		var_14_4:addObject(CCOrbitCamera:create(0.5, 1, 0, 0, 90, 0, 0))
		var_14_4:addObject(CCHide:create())
		var_14_4:addObject(CCCallFunc:create(var_14_2))
		var_14_0:runAction(CCSequence:create(var_14_4))
	end

	function var_2_0.setVertexZ(arg_16_0, arg_16_1)
		arg_16_0.generalCard:setVertexZ(arg_16_1)
	end

	function var_2_0.runAction(arg_17_0, arg_17_1)
		arg_17_0.generalCard:runAction(arg_17_1)
	end

	function var_2_0.getCardSprite(arg_18_0)
		return arg_18_0.cardSprite
	end

	function var_2_0.getCardNode(arg_19_0)
		return arg_19_0.generalCard
	end

	function var_2_0.create(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		if not arg_20_2 then
			return nil
		end

		var_2_0.isSelf = arg_20_3
		var_2_0.generalCard = CCNode:create()
		var_2_0.userData = {}

		var_2_0.refresh(arg_20_2)

		local var_20_0 = var_2_0.buildCard(arg_20_3)

		var_2_0.cardSprite = var_20_0

		var_2_0.generalCard:addChild(var_20_0)

		return var_2_0.generalCard
	end

	return var_2_0
end

return var_0_0
