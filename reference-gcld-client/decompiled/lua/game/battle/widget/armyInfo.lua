function showArmyInfo(arg_1_0)
	local var_1_0 = smgr.getLayer("topLayer")
	local var_1_1 = CCSprite:createWithSpriteFrameName("armyInfoPanel.png")

	var_1_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

	local function var_1_2(arg_2_0, arg_2_1, arg_2_2)
		if not tool.checkIfTouch(var_1_1, arg_2_1, arg_2_2) then
			var_1_0:removeChild(var_1_1, true)
		end

		return true
	end

	var_1_1:setTouchEnabled(true)
	var_1_1:registerScriptTouchHandler(var_1_2, false, true)
	initScriptEventNode(var_1_1)
	var_1_0:removeAllChildrenWithCleanup(true)
	var_1_0:addChild(var_1_1)
end
