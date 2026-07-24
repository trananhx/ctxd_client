return {
	create = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		local var_1_0 = CCDirector:sharedDirector():getVisibleSize()
		local var_1_1 = CCLayerColor:create(ccc4(0, 0, 0, 180), var_1_0.width, var_1_0.height)
		local var_1_2 = CCLabelTTF:create(tostring(arg_1_2), "Thonburi-Bold", 26)

		var_1_2:setHorizontalAlignment(kCCTextAlignmentCenter)
		var_1_2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_2:setDimensions(CCSizeMake(var_1_0.width, var_1_0.height))
		var_1_2:setPosition(ccp(var_1_0.width * 0.5, var_1_0.height * 0.5))
		var_1_1:addChild(var_1_2)

		local function var_1_3(arg_2_0, arg_2_1, arg_2_2)
			if arg_1_1 then
				arg_1_1:removeChild(var_1_1, true)
			end

			if arg_1_3 then
				arg_1_3()
			end

			return true
		end

		var_1_1:registerScriptTouchHandler(var_1_3, false, true)
		var_1_1:setTouchEnabled(true)

		if arg_1_1 and not tolua.isnull(arg_1_1) then
			arg_1_1:addChild(var_1_1)
		end
	end
}
