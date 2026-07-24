function generateTextNode(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	if arg_1_1 == tipType.selfToAuto then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_autofight.png")
	elseif arg_1_1 == tipType.joinBattle then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_join_fight.png")
	elseif arg_1_1 == tipType.autoToself then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_doself.png")
	elseif arg_1_1 == tipType.jiebingSucc and arg_1_2.isFree then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_freeJb.png")
	elseif arg_1_1 == tipType.tujinSucc then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_tujin.png")
	elseif arg_1_1 == tipType.createJtj then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_create_jtj.png")
	elseif arg_1_1 == tipType.cheTuiSucc then
		var_1_0 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_chetui.png")
	elseif arg_1_1 == tipType.jiebingSucc then
		var_1_0 = CCNode:create()

		local var_1_1 = arg_1_2.addExp or arg_1_2.expAdd

		if var_1_1 and var_1_1 > 0 then
			local var_1_2 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_goldJB.png")

			var_1_2:setAnchorPoint(ccp(0, 0.5))

			local var_1_3 = CCSprite:createWithSpriteFrameName("fightTip_add.png")

			var_1_3:setAnchorPoint(ccp(0, 0.5))

			local var_1_4 = CCLabelAtlas:create(tostring(var_1_1), "res/ui/common/number/Num_fightJiebingAddExp.png", 27, 41, 48)

			var_1_4:setAnchorPoint(ccp(0, 0.5))

			local var_1_5 = var_1_2:getContentSize().width
			local var_1_6 = var_1_3:getContentSize().width
			local var_1_7 = var_1_4:getContentSize().width
			local var_1_8 = var_1_5 + var_1_6 + var_1_7

			var_1_2:setPosition(ccp(-(var_1_8 * 0.5), 0))
			var_1_3:setPosition(ccp(var_1_2:getPositionX() + var_1_5, 0))
			var_1_4:setPosition(ccp(var_1_3:getPositionX() + var_1_6, 0))
			var_1_0:addChild(var_1_2)
			var_1_0:addChild(var_1_3)
			var_1_0:addChild(var_1_4)
		else
			local var_1_9 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_freeJb.png")

			var_1_0:addChild(var_1_9)
		end
	elseif arg_1_1 == tipType.youdiSucc then
		local var_1_10 = CCSprite:create("res/ui/common/text/battle/text_fight_tip_youdi.png")
		local var_1_11 = CCSprite:createWithSpriteFrameName("symbol_dantiao_subt.png")
		local var_1_12 = CCLabelAtlas:create(tostring(arg_1_2.copper), "res/ui/common/number/Num_fightJiebingAddExp.png", 27, 41, 48)

		var_1_12:setAnchorPoint(ccp(0.5, 0.5))
		log.info("@@@ 诱敌提示文字宽度:", var_1_10:getContentSize().width, var_1_11:getContentSize().width, var_1_12:getContentSize().width)

		var_1_0 = createRichNode({
			var_1_10,
			var_1_11,
			var_1_12
		}, 0.5)
	else
		var_1_0 = CCStrokeLabelTTF:create(language.get(490301), "Thonburi-Bold", 32)
	end

	return var_1_0
end

function showFightTip(arg_2_0, arg_2_1, arg_2_2)
	tool.safeRemoveChildByTag(arg_2_0.layerTabel.uiLayer, uiTag.textTip)

	local var_2_0 = CCSprite:createWithSpriteFrameName("battle_tip_background.png")

	var_2_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	arg_2_0.layerTabel.uiLayer:addChild(var_2_0, 0, uiTag.textTip)

	local function var_2_1()
		tool.safeRemoveChildByTag(arg_2_0.layerTabel.uiLayer, uiTag.textTip)
	end

	local var_2_2 = generateTextNode(arg_2_0, arg_2_1, arg_2_2)
	local var_2_3 = 200

	if var_2_2 then
		var_2_2:setPosition(ccp(var_2_0:getContentSize().width * 0.5 + var_2_3, var_2_0:getContentSize().height * 0.5))
		var_2_0:addChild(var_2_2)

		local var_2_4 = CCArray:create()

		var_2_4:addObject(CCFadeIn:create(0.06))
		var_2_4:addObject(CCMoveBy:create(0.15, ccp(-var_2_3, 0)))
		var_2_4:addObject(CCDelayTime:create(1))
		var_2_4:addObject(CCMoveBy:create(0.15, ccp(-var_2_3, 0)))
		var_2_4:addObject(CCFadeOut:create(0.06))
		var_2_4:addObject(CCCallFuncN:create(var_2_1))

		local var_2_5 = CCSequence:create(var_2_4)

		var_2_2:runAction(CCSequence:create(var_2_4))
	end
end

function showWarOptionTip(arg_4_0, arg_4_1, arg_4_2)
	tool.safeRemoveChildByTag(arg_4_0, uiTag.textTip)

	local var_4_0 = CCSprite:create("res/ui/battle/battle_tip_background.png")

	var_4_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	arg_4_0:addChild(var_4_0, 0, uiTag.textTip)

	local function var_4_1()
		tool.safeRemoveChildByTag(arg_4_0, uiTag.textTip)
	end

	local var_4_2 = generateTextNode(nil, arg_4_1, arg_4_2)
	local var_4_3 = 200

	if var_4_2 then
		var_4_2:setPosition(ccp(var_4_0:getContentSize().width * 0.5 + var_4_3, var_4_0:getContentSize().height * 0.5))
		var_4_0:addChild(var_4_2)

		local var_4_4 = CCArray:create()

		var_4_4:addObject(CCFadeIn:create(0.06))
		var_4_4:addObject(CCMoveBy:create(0.15, ccp(-var_4_3, 0)))
		var_4_4:addObject(CCDelayTime:create(1))
		var_4_4:addObject(CCMoveBy:create(0.15, ccp(-var_4_3, 0)))
		var_4_4:addObject(CCFadeOut:create(0.06))
		var_4_4:addObject(CCCallFuncN:create(var_4_1))

		local var_4_5 = CCSequence:create(var_4_4)

		var_4_2:runAction(CCSequence:create(var_4_4))
	end
end
