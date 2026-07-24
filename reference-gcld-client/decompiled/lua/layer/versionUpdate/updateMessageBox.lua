return {
	create = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
		local var_1_0 = CCSprite:create("res/ui/messagebox/atten_view_bg.png")

		var_1_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

		local var_1_1 = CCSprite:create("res/ui/messagebox/atten_tit.png")

		var_1_1:setPosition(ccp(var_1_0:getContentSize().width / 2, var_1_0:getContentSize().height - 30))
		var_1_0:addChild(var_1_1)

		local var_1_2 = CCLabelTTF:create(tostring(arg_1_2), "Thonburi-Bold", 26)

		var_1_2:setDimensions(CCSizeMake(var_1_0:getContentSize().width - 100, 200))
		var_1_2:setHorizontalAlignment(kCCTextAlignmentCenter)
		var_1_2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_2:setPosition(ccp(var_1_0:getContentSize().width / 2, 200))
		var_1_0:addChild(var_1_2)

		local function var_1_3(arg_2_0, arg_2_1, arg_2_2)
			return true
		end

		var_1_0:registerScriptTouchHandler(var_1_3, false, true)
		var_1_0:setTouchEnabled(true)

		if arg_1_1 then
			arg_1_1:addChild(var_1_0)
		end

		local var_1_4 = {}

		if arg_1_3 then
			var_1_4.update = {
				pic2 = "res/ui/messagebox/btn_yes_c.png",
				pic1 = "res/ui/messagebox/btn_yes_a.png",
				text = language.get(400047),
				callback = arg_1_3,
				pos = ccp(0, 10)
			}
		end

		if arg_1_5 then
			var_1_4.ok = {
				pic2 = "res/ui/messagebox/btn_yes_c.png",
				pic1 = "res/ui/messagebox/btn_yes_a.png",
				text = language.get(400048),
				callback = arg_1_5,
				pos = ccp(0, 10)
			}
		end

		if arg_1_4 then
			var_1_4.cancel = {
				pic2 = "res/ui/messagebox/btn_no_c.png",
				pic1 = "res/ui/messagebox/btn_no_a.png",
				text = language.get(10002),
				callback = arg_1_4,
				pos = ccp(100, 10)
			}

			if var_1_4.update then
				var_1_4.update.pos = ccp(-100, 10)
			end

			if var_1_4.ok then
				var_1_4.ok.pos = ccp(-100, 10)
			end
		end

		local var_1_5 = CCMenu:create()

		var_1_0:addChild(var_1_5)
		var_1_5:setPosition(ccp(var_1_0:getContentSize().width / 2, 50))

		for iter_1_0, iter_1_1 in pairs(var_1_4) do
			local var_1_6 = CCSprite:create(iter_1_1.pic1)
			local var_1_7 = CCSprite:create(iter_1_1.pic2)
			local var_1_8 = CCLabelTTF:create(tostring(iter_1_1.text), "Thonburi-Bold", 22)
			local var_1_9 = CCLabelTTF:create(tostring(iter_1_1.text), "Thonburi-Bold", 22)

			var_1_6:addChild(var_1_8, 20)
			var_1_7:addChild(var_1_9, 20)
			var_1_8:setPosition(ccp(var_1_6:getContentSize().width / 2, var_1_6:getContentSize().height / 2))
			var_1_9:setPosition(ccp(var_1_6:getContentSize().width / 2, var_1_6:getContentSize().height / 2))

			local var_1_10 = CCMenuItemSprite:create(var_1_6, var_1_7)

			var_1_10:setPosition(iter_1_1.pos)

			if iter_1_1.callback then
				var_1_10:registerScriptTapHandler(iter_1_1.callback)
			end

			var_1_5:addChild(var_1_10)
		end

		return var_1_0
	end
}
