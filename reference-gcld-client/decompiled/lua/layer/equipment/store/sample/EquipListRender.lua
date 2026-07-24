local var_0_0 = {}

function var_0_0.render(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		equipPicHandler = function(arg_2_0)
			arg_2_0.pic1 = {
				frame = true,
				path = arg_1_0.pic .. ".jpg"
			}
		end,
		equipQualifyHandler = function(arg_3_0)
			arg_3_0.pic1 = {
				frame = true,
				path = storeConstant.qualityFrame[arg_1_0.quality]
			}
		end,
		equipColorHandler = function(arg_4_0)
			arg_4_0.color = storeConstant.equipmentQualityColor[arg_1_0.quality]
		end,
		equipBuyHandler = function(arg_5_0)
			arg_5_0.noRender = not arg_1_0.bought
		end
	}

	uiutil.initUI(var_1_0, arg_1_1)
	var_1_0.nameLabel:setString(arg_1_0.name)
	var_1_0.priceLabel:setString(arg_1_0.price)

	var_1_0.index = arg_1_2

	local var_1_1 = not arg_1_0.bought

	var_1_0.buySilver:setVisible(var_1_1)
	var_1_0.buyButton_menu:setVisible(var_1_1)
	var_1_0.buyLabel:setVisible(var_1_1)
	var_1_0.priceLabel:setVisible(var_1_1)

	local function var_1_2()
		var_0_0.list:dispatchEvent({
			name = "buyEquip",
			item = var_1_0,
			data = arg_1_0
		})
	end

	var_1_0.buyButton:registerScriptTapHandler(var_1_2)
	var_1_0.equipmentNormal:registerScriptTapHandler(function()
		var_0_0.list:dispatchEvent({
			name = "clickEquipPic",
			item = var_1_0,
			data = arg_1_0
		})
	end)

	return var_1_0.equipItem, var_1_0
end

function var_0_0.update(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.equipItem
	local var_8_1 = CCArray:create()
	local var_8_2 = CCScaleTo:create(0.3, 0, 1)
	local var_8_3 = CCScaleTo:create(0.3, 1, 1)
	local var_8_4 = CCCallFuncN:create(function()
		arg_8_0.nameLabel:setString(arg_8_1.name)
		arg_8_0.priceLabel:setString(arg_8_1.price)

		local var_9_0 = not arg_8_1.bought

		arg_8_0.buySilver:setVisible(var_9_0)
		arg_8_0.buyButton_menu:setVisible(var_9_0)
		arg_8_0.buyLabel:setVisible(var_9_0)
		arg_8_0.priceLabel:setVisible(var_9_0)

		local var_9_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(arg_8_1.pic .. ".jpg")

		arg_8_0.equipmentNormal:setNormalImage(CCSprite:createWithSpriteFrame(var_9_1))
		arg_8_0.equipmentNormal:setSelectedImage(CCSprite:createWithSpriteFrame(var_9_1))

		if arg_8_0.equipBuyAlready then
			pcall(arg_8_0.equipBuyAlready.removeFromParentAndCleanup, arg_8_0.equipBuyAlready, true)
		end

		local function var_9_2()
			var_0_0.list:dispatchEvent({
				name = "buyEquip",
				item = arg_8_0,
				data = arg_8_1
			})
		end

		arg_8_0.buyButton:unregisterScriptTapHandler()
		arg_8_0.buyButton:registerScriptTapHandler(var_9_2)
		arg_8_0.equipmentNormal:unregisterScriptTapHandler()
		arg_8_0.equipmentNormal:registerScriptTapHandler(function()
			var_0_0.list:dispatchEvent({
				name = "clickEquipPic",
				item = arg_8_0,
				data = arg_8_1
			})
		end)
	end)

	var_8_1:addObject(var_8_2)
	var_8_1:addObject(var_8_4)
	var_8_1:addObject(var_8_3)
	var_8_0:runAction(CCSequence:create(var_8_1))
end

return var_0_0
