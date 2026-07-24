function createGeneralSelectPanel(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = createLabelPage()
	local var_1_1 = 1

	for iter_1_0, iter_1_1 in pairs(arg_1_0) do
		local var_1_2 = CCSprite:createWithSpriteFrameName("general_zuoxiaoban.png")
		local var_1_3 = CCSprite:createWithSpriteFrameName("general_zuozhongban.png")

		var_1_2:setAnchorPoint(ccp((var_1_2:getContentSize().width - 5) / var_1_2:getContentSize().width, 0.5))
		var_1_3:setAnchorPoint(ccp(1, 0.5))

		if iter_1_1 then
			local var_1_4 = "p-bai.png"

			if iter_1_1.quality == 2 then
				var_1_4 = "p-lan.png"
			elseif iter_1_1.quality == 3 then
				var_1_4 = "p-lv.png"
			elseif iter_1_1.quality == 4 then
				var_1_4 = "p-huang.png"
			elseif iter_1_1.quality == 5 then
				var_1_4 = "p-hong.png"
			elseif iter_1_1.quality == 6 then
				var_1_4 = "p-zi.png"
			end

			local var_1_5 = CCSprite:createWithSpriteFrameName(var_1_4)

			var_1_5:setPosition(ccp(var_1_3:getContentSize().width * 0.5, var_1_3:getContentSize().height * 0.5))
			var_1_3:addChild(var_1_5)

			local var_1_6 = CCSprite:createWithSpriteFrameName(var_1_4)

			var_1_6:setPosition(ccp(var_1_3:getContentSize().width * 0.5, var_1_2:getContentSize().height * 0.5))
			var_1_2:addChild(var_1_6)

			if iter_1_1.isChief == true then
				local var_1_7 = CCSprite:create("res/ui/general/deputy/fj_icon_zj.png")

				var_1_7:setPosition(ccp(20, var_1_5:getContentSize().height - 20))
				var_1_5:addChild(var_1_7)

				local var_1_8 = CCSprite:create("res/ui/general/deputy/fj_icon_zj.png")

				var_1_8:setPosition(ccp(20, var_1_6:getContentSize().height - 20))
				var_1_6:addChild(var_1_8)
			end

			local var_1_9 = iter_1_1.generalName
			local var_1_10 = CCStrokeLabelTTF:create(var_1_9, "Thonburi", 24, 2)

			var_1_10:setDimensions(CCSizeMake(38, 0))
			var_1_10:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_1_10:setPosition(ccp(var_1_6:getContentSize().width * 0.5, var_1_6:getContentSize().height * 0.5))
			var_1_6:addChild(var_1_10)

			local var_1_11 = CCStrokeLabelTTF:create(var_1_9, "Thonburi", 24, 2)

			var_1_11:setDimensions(CCSizeMake(38, 0))
			var_1_11:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_1_11:setPosition(ccp(var_1_5:getContentSize().width * 0.5, var_1_5:getContentSize().height * 0.5))
			var_1_5:addChild(var_1_11)

			local var_1_12 = CCSprite:createWithSpriteFrameName("general_shuxian.png")

			var_1_12:setPosition(ccp(55, var_1_6:getContentSize().height * 0.5))

			local var_1_13

			if iter_1_1.troopType == 1 or iter_1_1.troopType == 2 or iter_1_1.troopType == 3 or iter_1_1.troopType == 4 or iter_1_1.troopType == 5 then
				local var_1_14 = string.format("troop_%d.png", 5)
			elseif iter_1_1.troopType == 6 or iter_1_1.troopType == 7 or iter_1_1.troopType == 8 or iter_1_1.troopType == 9 or iter_1_1.troopType == 10 then
				local var_1_15 = string.format("troop_%d.png", 6)
			elseif iter_1_1.troopType == 11 or iter_1_1.troopType == 12 or iter_1_1.troopType == 13 or iter_1_1.troopType == 14 or iter_1_1.troopType == 15 then
				local var_1_16 = string.format("troop_%d.png", 7)
			elseif iter_1_1.troopType == 16 or iter_1_1.troopType == 17 or iter_1_1.troopType == 18 or iter_1_1.troopType == 19 or iter_1_1.troopType == 20 then
				local var_1_17 = string.format("troop_%d.png", 8)
			end

			local var_1_18 = string.format("troop_%d.png", iter_1_1.troopType)
			local var_1_19 = CCSprite:createWithSpriteFrameName(var_1_18)

			var_1_19:setPosition(ccp(65 + var_1_19:getContentSize().width * 0.5, var_1_6:getContentSize().height * 0.5))
			var_1_6:addChild(var_1_12)
			var_1_6:addChild(var_1_19)
		else
			local var_1_20 = CCLabelTTF:create(language.get(81021), "Thonburi-Bold", 26)

			var_1_20:setColor(ccc3(204, 187, 135))
			var_1_20:setPosition(ccp(var_1_3:getContentSize().width * 0.5, var_1_3:getContentSize().height * 0.5))
			var_1_3:addChild(var_1_20)
		end

		local var_1_21 = 122
		local var_1_22 = 560 - (var_1_1 - 0.5) * var_1_2:getContentSize().height
		local var_1_23 = 0

		if iter_1_1 then
			var_1_23 = iter_1_1.generalId
		end

		local var_1_24 = false

		if not arg_1_2 or arg_1_2 == 0 then
			if var_1_1 == 1 then
				var_1_24 = true
			end
		elseif var_1_23 == arg_1_2 then
			var_1_24 = true
		elseif iter_1_1.deputyData and iter_1_1.deputyData.generalId == arg_1_2 then
			var_1_23 = iter_1_1.generalId
			var_1_24 = true
		end

		var_1_0:addLabelButton(var_1_3, var_1_2, ccp(var_1_21, var_1_22), arg_1_1, var_1_24, var_1_23)

		var_1_1 = var_1_1 + 1
	end

	if arg_1_3 then
		local var_1_25 = CCSprite:createWithSpriteFrameName("general_zuoxiaoban.png")
		local var_1_26 = CCSprite:createWithSpriteFrameName("general_zuozhongban.png")

		var_1_25:setAnchorPoint(ccp((var_1_25:getContentSize().width - 5) / var_1_25:getContentSize().width, 0.5))
		var_1_26:setAnchorPoint(ccp(1, 0.5))

		if arg_1_3 then
			local var_1_27 = "p-bai.png"

			if arg_1_3.quality == 2 then
				var_1_27 = "p-lan.png"
			elseif arg_1_3.quality == 3 then
				var_1_27 = "p-lv.png"
			elseif arg_1_3.quality == 4 then
				var_1_27 = "p-huang.png"
			elseif arg_1_3.quality == 5 then
				var_1_27 = "p-hong.png"
			elseif arg_1_3.quality == 6 then
				var_1_27 = "p-zi.png"
			end

			local var_1_28 = CCSprite:createWithSpriteFrameName(var_1_27)

			var_1_28:setPosition(ccp(var_1_26:getContentSize().width * 0.5, var_1_26:getContentSize().height * 0.5))
			var_1_26:addChild(var_1_28)

			local var_1_29 = CCSprite:create("res/ui/general/deputy/fj_icon_fj.png")

			var_1_29:setPosition(ccp(20, var_1_28:getContentSize().height - 20))
			var_1_28:addChild(var_1_29)

			local var_1_30 = CCSprite:createWithSpriteFrameName(var_1_27)

			var_1_30:setPosition(ccp(var_1_26:getContentSize().width * 0.5, var_1_25:getContentSize().height * 0.5))
			var_1_25:addChild(var_1_30)

			local var_1_31 = CCSprite:create("res/ui/general/deputy/fj_icon_fj.png")

			var_1_31:setPosition(ccp(20, var_1_30:getContentSize().height - 20))
			var_1_30:addChild(var_1_31)

			local var_1_32 = arg_1_3.generalName
			local var_1_33 = CCStrokeLabelTTF:create(var_1_32, "Thonburi", 24, 2)

			var_1_33:setDimensions(CCSizeMake(38, 95))
			var_1_33:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_1_33:setPosition(ccp(var_1_30:getContentSize().width * 0.5, var_1_30:getContentSize().height * 0.5))
			var_1_30:addChild(var_1_33)

			local var_1_34 = CCStrokeLabelTTF:create(var_1_32, "Thonburi", 24, 2)

			var_1_34:setDimensions(CCSizeMake(38, 95))
			var_1_34:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_1_34:setPosition(ccp(var_1_28:getContentSize().width * 0.5, var_1_28:getContentSize().height * 0.5))
			var_1_28:addChild(var_1_34)

			local var_1_35 = CCSprite:createWithSpriteFrameName("general_shuxian.png")

			var_1_35:setPosition(ccp(55, var_1_30:getContentSize().height * 0.5))

			local var_1_36

			if arg_1_3.troopType == 1 or arg_1_3.troopType == 2 or arg_1_3.troopType == 3 or arg_1_3.troopType == 4 or arg_1_3.troopType == 5 then
				local var_1_37 = string.format("troop_%d.png", 5)
			elseif arg_1_3.troopType == 6 or arg_1_3.troopType == 7 or arg_1_3.troopType == 8 or arg_1_3.troopType == 9 or arg_1_3.troopType == 10 then
				local var_1_38 = string.format("troop_%d.png", 6)
			elseif arg_1_3.troopType == 11 or arg_1_3.troopType == 12 or arg_1_3.troopType == 13 or arg_1_3.troopType == 14 or arg_1_3.troopType == 15 then
				local var_1_39 = string.format("troop_%d.png", 7)
			elseif arg_1_3.troopType == 16 or arg_1_3.troopType == 17 or arg_1_3.troopType == 18 or arg_1_3.troopType == 19 or arg_1_3.troopType == 20 then
				local var_1_40 = string.format("troop_%d.png", 8)
			end

			local var_1_41 = string.format("troop_%d.png", arg_1_3.troopType)
			local var_1_42 = CCSprite:createWithSpriteFrameName(var_1_41)

			var_1_42:setPosition(ccp(65 + var_1_42:getContentSize().width * 0.5, var_1_30:getContentSize().height * 0.5))
			var_1_30:addChild(var_1_35)
			var_1_30:addChild(var_1_42)
		else
			local var_1_43 = CCLabelTTF:create(language.get(81021), "Thonburi-Bold", 26)

			var_1_43:setColor(ccc3(204, 187, 135))
			var_1_43:setPosition(ccp(var_1_26:getContentSize().width * 0.5, var_1_26:getContentSize().height * 0.5))
			var_1_26:addChild(var_1_43)
		end

		local var_1_44 = 122
		local var_1_45 = 560 - (var_1_1 - 0.5) * var_1_25:getContentSize().height
		local var_1_46 = 0

		if arg_1_3 then
			var_1_46 = arg_1_3.generalId
		end

		local var_1_47 = false

		if not arg_1_2 or arg_1_2 == 0 then
			if var_1_1 == 1 then
				var_1_47 = true
			end
		elseif var_1_46 == arg_1_2 then
			var_1_47 = true
		end

		var_1_0:addLabelButton(var_1_26, var_1_25, ccp(var_1_44, var_1_45), arg_1_1, var_1_47, var_1_46)

		local var_1_48 = var_1_1 + 1
	end

	return var_1_0
end
