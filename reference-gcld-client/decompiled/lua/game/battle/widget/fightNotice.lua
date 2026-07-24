function showFightNotice(arg_1_0, arg_1_1)
	local var_1_0 = ccc3(143, 202, 197)
	local var_1_1 = ccc3(240, 217, 185)
	local var_1_2 = CCNode:create()

	var_1_2:setPosition(ccp(visibleSize.width - 30, visibleSize.height * 0.3))
	arg_1_0.layerTabel.uiLayer:addChild(var_1_2, 0, uiTag.notice)

	for iter_1_0, iter_1_1 in pairs(arg_1_1) do
		local var_1_3 = CCStrokeLabelTTF:create(iter_1_1.text, "Thonburi", 22)

		if iter_1_1.side == "att" then
			var_1_3:setColor(var_1_0)
		else
			var_1_3:setColor(var_1_1)
		end

		var_1_3:setPosition(ccp(0 - var_1_3:getContentSize().width * 0.5, 0 - (iter_1_0 - 1) * var_1_3:getContentSize().height))
		var_1_2:addChild(var_1_3)
	end

	local var_1_4 = CCArray:create()

	var_1_4:addObject(CCFadeIn:create(0.5))
	var_1_4:addObject(CCMoveBy:create(0.5, ccp(0, 10)))

	local var_1_5 = CCSequence:create(var_1_4)

	var_1_2:runAction(CCSequence:create(var_1_4))
end
