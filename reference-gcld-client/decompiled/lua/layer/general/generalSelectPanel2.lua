function createGeneralSelectPanel2(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = createLabelPage()
	local var_1_1 = 1

	for iter_1_0, iter_1_1 in pairs(arg_1_0) do
		local var_1_2 = CCSprite:createWithSpriteFrameName("general_zuoxiaoban.png")

		var_1_2:setAnchorPoint(ccp((var_1_2:getContentSize().width - 5) / var_1_2:getContentSize().width, 0.5))

		local var_1_3 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", iter_1_1.pic))

		var_1_3:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
		var_1_2:addChild(var_1_3)

		local var_1_4 = CCSprite:createWithSpriteFrameName("general_zuoxiaoban.png")

		var_1_4:setAnchorPoint(ccp((var_1_4:getContentSize().width - 5) / var_1_4:getContentSize().width, 0.5))

		local var_1_5 = CCSprite:createWithSpriteFrameName("general_item_selected.png")

		var_1_5:setPosition(var_1_4:getContentSize().width * 0.5, var_1_4:getContentSize().height * 0.5)
		var_1_4:addChild(var_1_5)

		local var_1_6 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", iter_1_1.pic))

		var_1_6:setPosition(ccp(var_1_5:getContentSize().width * 0.5, var_1_5:getContentSize().height * 0.5))
		var_1_5:addChild(var_1_6)

		if iter_1_1.isChief == true then
			local var_1_7 = CCSprite:create("res/ui/general/deputy/fj_icon_zj.png")

			var_1_7:setAnchorPoint(ccp(0, 1))
			var_1_7:setPosition(ccp(0, var_1_2:getContentSize().height))
			var_1_2:addChild(var_1_7)

			local var_1_8 = CCSprite:create("res/ui/general/deputy/fj_icon_zj.png")

			var_1_8:setAnchorPoint(ccp(0, 1))
			var_1_8:setPosition(ccp(0, var_1_2:getContentSize().height))
			var_1_4:addChild(var_1_8)
		end

		if iter_1_1 then
			local var_1_9 = iter_1_1.generalName
		else
			local var_1_10 = CCLabelTTF:create(language.get(81021), "Thonburi-Bold", 26)

			var_1_10:setColor(ccc3(204, 187, 135))
			var_1_10:setPosition(ccp(var_1_2:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
			var_1_2:addChild(var_1_10)
		end

		local var_1_11 = 122
		local var_1_12 = 560 - (var_1_1 - 0.5) * var_1_4:getContentSize().height
		local var_1_13 = 0

		if iter_1_1 then
			var_1_13 = iter_1_1.generalId
		end

		local var_1_14 = false

		if not arg_1_2 or arg_1_2 == 0 then
			if var_1_1 == 1 then
				var_1_14 = true
			end
		elseif var_1_13 == arg_1_2 then
			var_1_14 = true
		elseif iter_1_1.deputyData and iter_1_1.deputyData.generalId == arg_1_2 then
			var_1_13 = iter_1_1.generalId
			var_1_14 = true
		end

		var_1_0:addLabelButton(var_1_2, var_1_4, ccp(var_1_11, var_1_12), arg_1_1, var_1_14, var_1_13)

		var_1_1 = var_1_1 + 1
	end

	if arg_1_3 then
		local var_1_15 = CCSprite:createWithSpriteFrameName("general_zuoxiaoban.png")

		var_1_15:setAnchorPoint(ccp((var_1_15:getContentSize().width - 5) / var_1_15:getContentSize().width, 0.5))

		local var_1_16 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_1_3.pic))

		var_1_16:setPosition(ccp(var_1_15:getContentSize().width * 0.5, var_1_15:getContentSize().height * 0.5))
		var_1_15:addChild(var_1_16)

		local var_1_17 = CCSprite:createWithSpriteFrameName("general_zuoxiaoban.png")

		var_1_17:setAnchorPoint(ccp((var_1_17:getContentSize().width - 5) / var_1_17:getContentSize().width, 0.5))

		local var_1_18 = CCSprite:createWithSpriteFrameName("general_item_selected.png")

		var_1_18:setPosition(var_1_17:getContentSize().width * 0.5, var_1_17:getContentSize().height * 0.5)
		var_1_17:addChild(var_1_18)

		local var_1_19 = CCSprite:create(string.format("res/ui/common/generalPic/generalPic_%s.jpg", arg_1_3.pic))

		var_1_19:setPosition(ccp(var_1_18:getContentSize().width * 0.5, var_1_18:getContentSize().height * 0.5))
		var_1_18:addChild(var_1_19)

		local var_1_20 = CCSprite:create("res/ui/general/deputy/fj_icon_fj.png")

		var_1_20:setAnchorPoint(ccp(0, 1))
		var_1_20:setPosition(ccp(0, var_1_15:getContentSize().height))
		var_1_15:addChild(var_1_20)

		local var_1_21 = CCSprite:create("res/ui/general/deputy/fj_icon_fj.png")

		var_1_21:setAnchorPoint(ccp(0, 1))
		var_1_21:setPosition(ccp(0, var_1_15:getContentSize().height))
		var_1_17:addChild(var_1_21)

		local var_1_22 = 122
		local var_1_23 = 560 - (var_1_1 - 0.5) * 105
		local var_1_24 = 0

		if arg_1_3 then
			var_1_24 = arg_1_3.generalId
		end

		local var_1_25 = false

		if not arg_1_2 or arg_1_2 == 0 then
			if var_1_1 == 1 then
				var_1_25 = true
			end
		elseif var_1_24 == arg_1_2 then
			var_1_25 = true
		end

		var_1_0:addLabelButton(var_1_15, var_1_17, ccp(var_1_22, var_1_23), arg_1_1, var_1_25, var_1_24)

		local var_1_26 = var_1_1 + 1
	end

	return var_1_0
end
