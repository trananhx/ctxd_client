function createCountDownPanel(arg_1_0, arg_1_1)
	tool.safeRemoveChildByTag(arg_1_0.layerTabel.uiLayer, uiTag.timer)

	local var_1_0 = CCNode:create()
	local var_1_1 = {}

	var_1_0:setPosition(ccp(visibleSize.width * 0.5, 125))

	if arg_1_0.autoSt == -1 then
		local var_1_2 = CCSprite:createWithSpriteFrameName("chos_gre.png")

		var_1_0:addChild(var_1_2)
	end

	local var_1_3 = CCLabelAtlas:create(tostring(arg_1_1), "res/ui/common/number/chos_nb.png", 46, 56, 48)

	var_1_3:setAnchorPoint(ccp(0.5, 0.5))
	var_1_0:addChild(var_1_3)
	arg_1_0.layerTabel.uiLayer:addChild(var_1_0, 2, uiTag.timer)

	function var_1_1.setTime(arg_2_0, arg_2_1)
		var_1_3:setString(tostring(arg_2_1))
	end

	function var_1_1.destory(arg_3_0)
		if not tolua.isnull(var_1_0) then
			arg_1_0.layerTabel.uiLayer:removeChild(var_1_0, true)
		end
	end

	return var_1_1
end
