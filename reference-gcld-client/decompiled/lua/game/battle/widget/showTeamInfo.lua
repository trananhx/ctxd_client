function showInsperOrOrderTip(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = "res/ui/common/text/battle/text_jtj_zdlts.png"

	if arg_1_1 == "order" then
		var_1_0 = "res/ui/common/text/battle/text_jtj_qtjsmb.png"
	end

	local var_1_1 = CCSprite:create(var_1_0)

	var_1_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	var_1_1:setScale(0.5)
	arg_1_0.layerTabel.uiLayer:addChild(var_1_1, 500)

	local function var_1_2()
		arg_1_0.layerTabel.uiLayer:removeChild(var_1_1, true)
	end

	local var_1_3 = CCArray:create()

	var_1_3:addObject(CCScaleTo:create(0.3, 1, 1))
	var_1_3:addObject(CCMoveBy:create(0.7, ccp(0, 80)))
	var_1_3:addObject(CCCallFuncN:create(var_1_2))

	local var_1_4 = CCSequence:create(var_1_3)

	var_1_1:runAction(var_1_4)
end

function showTeamJoinInfo(arg_3_0, arg_3_1)
	local var_3_0 = 0
	local var_3_1 = 0
	local var_3_2

	if arg_3_1.batSide == 1 then
		var_3_0 = 420
		var_3_2 = 460
	else
		var_3_0 = 190
		var_3_2 = 25
	end

	for iter_3_0, iter_3_1 in pairs(arg_3_1.reports) do
		local var_3_3 = CCStrokeLabelTTF:create(iter_3_1.msg, "Thonburi", 22)

		var_3_3:setVisible(false)
		var_3_3:setAnchorPoint(ccp(0, 0.5))
		var_3_3:setColor(ccc3(229, 198, 153))
		var_3_3:setPosition(ccp(var_3_0, var_3_2))
		arg_3_0.layerTabel.uiLayer:addChild(var_3_3)

		local function var_3_4()
			var_3_3:setVisible(true)
		end

		local function var_3_5()
			arg_3_0.layerTabel.uiLayer:removeChild(var_3_3, true)
		end

		local var_3_6 = CCArray:create()

		var_3_6:addObject(CCDelayTime:create((iter_3_0 - 1) * 0.8))
		var_3_6:addObject(CCCallFuncN:create(var_3_4))
		var_3_6:addObject(CCMoveBy:create(1.6, ccp(0, 80)))
		var_3_6:addObject(CCCallFuncN:create(var_3_5))

		local var_3_7 = CCSequence:create(var_3_6)

		var_3_3:runAction(var_3_7)
	end
end

function showOfficerTokenTip(arg_6_0)
	local var_6_0 = "res/ui/common/text/battle/text_token_asse_wei.png"

	if user.player.forceId == 2 then
		var_6_0 = "res/ui/common/text/battle/text_token_asse_shu.png"
	elseif user.player.forceId == 3 then
		var_6_0 = "res/ui/common/text/battle/text_token_asse_wu.png"
	end

	local var_6_1 = CCSprite:create(var_6_0)

	var_6_1:setPosition(ccp(visibleSize.width * 0.8, visibleSize.height * 0.5))
	arg_6_0.layerTabel.uiLayer:addChild(var_6_1, 500)

	local function var_6_2()
		arg_6_0.layerTabel.uiLayer:removeChild(var_6_1, true)
	end

	local var_6_3 = CCArray:create()

	var_6_3:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_6_3:addObject(CCDelayTime:create(1))
	var_6_3:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width * 0.2, visibleSize.height * 0.5)))
	var_6_3:addObject(CCCallFuncN:create(var_6_2))

	local var_6_4 = CCSequence:create(var_6_3)

	var_6_1:runAction(var_6_4)
end

function showGoldOrderTip(arg_8_0)
	local var_8_0 = CCSprite:create("res/ui/common/text/battle/zzl_enter_tit.png")

	var_8_0:setPosition(ccp(visibleSize.width * 0.8, visibleSize.height * 0.5))
	arg_8_0.layerTabel.uiLayer:addChild(var_8_0, 500)

	local function var_8_1()
		arg_8_0.layerTabel.uiLayer:removeChild(var_8_0, true)
	end

	local var_8_2 = CCArray:create()

	var_8_2:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_8_2:addObject(CCDelayTime:create(1))
	var_8_2:addObject(CCMoveTo:create(0.3, ccp(visibleSize.width * 0.2, visibleSize.height * 0.5)))
	var_8_2:addObject(CCCallFuncN:create(var_8_1))

	local var_8_3 = CCSequence:create(var_8_2)

	var_8_0:runAction(var_8_3)
end
