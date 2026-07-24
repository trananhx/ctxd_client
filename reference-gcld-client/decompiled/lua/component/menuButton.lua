function creatMenuButton(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)
	local var_1_0 = CCMenu:create()

	var_1_0:setPosition(ccp(0, 0))

	if arg_1_2 then
		local var_1_1 = CCStrokeLabelTTF:create(arg_1_2, "Thonburi-Bold", 26)

		var_1_1:setPosition(ccp(arg_1_0:getContentSize().width * 0.5, arg_1_0:getContentSize().height * 0.5))

		if arg_1_6 then
			var_1_1:setColor(arg_1_6)
		end

		arg_1_0:addChild(var_1_1)

		local var_1_2 = CCStrokeLabelTTF:create(arg_1_2, "Thonburi-Bold", 26)

		var_1_2:setPosition(ccp(arg_1_0:getContentSize().width * 0.5, arg_1_0:getContentSize().height * 0.5))

		if arg_1_6 then
			var_1_2:setColor(arg_1_6)
		end

		arg_1_1:addChild(var_1_2)
	end

	local function var_1_3()
		if arg_1_3 then
			arg_1_3(arg_1_4)
		end
	end

	local var_1_4 = CCMenuItemSprite:create(arg_1_0, arg_1_1)

	if arg_1_5 then
		var_1_4:setPosition(arg_1_5)
	end

	var_1_4:registerScriptTapHandler(var_1_3)
	var_1_0:addChild(var_1_4)

	return var_1_0
end
