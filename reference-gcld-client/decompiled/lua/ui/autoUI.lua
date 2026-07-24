local var_0_0 = {
	label_normal = {
		fontSize = 50,
		font = "Thonburi",
		align = kCCTextAlignmentLeft
	}
}

autoUI = {}
autoUI.reuseableUI = {}

local function var_0_1(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in pairs(arg_1_1) do
		if arg_1_0[iter_1_0] == nil then
			arg_1_0[iter_1_0] = iter_1_1
		end
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0
	local var_2_1

	for iter_2_0, iter_2_1 in pairs(arg_2_0.pics) do
		log.debug("!!!!!!!", iter_2_1.pic)

		local var_2_2

		if string.find(iter_2_1.pic, "frame:") ~= nil then
			var_2_2 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(string.sub(iter_2_1.pic, 7)))
		else
			var_2_2 = CCSprite:create(iter_2_1.pic)
		end

		if var_2_0 ~= nil then
			var_2_0:addChild(var_2_2)

			if iter_2_1.x and iter_2_1.y then
				var_2_2:setPosition(ccp(iter_2_1.x, iter_2_1.y))
			end

			if iter_2_1.align == "center" then
				var_2_2:setPosition(cccp(var_2_0:getContentSize().width / 2, var_2_0:getContentSize().height / 2, var_2_0:getContentSize().height))
			end
		end

		if var_2_1 == nil then
			var_2_1 = var_2_2
		end

		if iter_2_1.children ~= nil then
			for iter_2_2, iter_2_3 in pairs(iter_2_1.children) do
				if iter_2_3.type == "pic" then
					local var_2_3

					if string.find(iter_2_3.pic, "frame:") ~= nil then
						var_2_3 = CCSprite:createWithSpriteFrameName(string.sub(iter_2_3.pic, 7))
					else
						var_2_3 = CCSprite:create(iter_2_3.pic)
					end

					var_2_3:setPosition(ccp(iter_2_3.x, iter_2_3.y))
					var_2_1:addChild(var_2_3)

					if iter_2_3.name ~= nil then
						arg_2_1[iter_2_3.name] = var_2_3
					end
				elseif iter_2_3.type == "label" then
					local var_2_4

					if iter_2_3.strokeSize and iter_2_3.strokeColor then
						var_2_4 = CCStrokeLabelTTF:create(iter_2_3.text, iter_2_3.font, iter_2_3.fontSize, iter_2_3.strokeSize, iter_2_3.strokeColor)
					else
						var_2_4 = CCStrokeLabelTTF:create(iter_2_3.text, iter_2_3.font, iter_2_3.fontSize)
					end

					var_2_4:setPosition(ccp(iter_2_3.x, iter_2_3.y))

					if iter_2_3.color then
						var_2_4:setColor(iter_2_3.color)
					end

					var_2_1:addChild(var_2_4)

					if iter_2_3.name ~= nil then
						arg_2_1[iter_2_3.name] = var_2_4
					end
				elseif iter_2_3.type == "menu_label" then
					local var_2_5 = CCStrokeLabelTTF:create(iter_2_3.text, iter_2_3.font, iter_2_3.fontSize or 20, 2, colorText[10005])

					var_2_5:setColor(colorText[10004])
					var_2_5:setPosition(ccp(iter_2_3.x, iter_2_3.y))
					var_2_1:addChild(var_2_5)

					if iter_2_3.name ~= nil then
						arg_2_1[iter_2_3.name] = var_2_5
					end
				end
			end
		end

		var_2_0 = var_2_2
	end

	return var_2_1
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0

	if string.find(arg_3_0, "frame:") ~= nil then
		var_3_0 = CCScale9Sprite:createWithSpriteFrameName(string.sub(arg_3_0, 7), arg_3_1)
	else
		var_3_0 = CCScale9Sprite:create(arg_3_1, arg_3_0)
	end

	var_3_0:setPreferredSize(arg_3_2)
	log.info("preferedSize H:", arg_3_2.height, "middleRect:", var_3_0:getCapInsets().size.width)

	return var_3_0
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0 = arg_4_0 or ccc4(0, 0, 0, 0)
	arg_4_1 = arg_4_1 or 0
	arg_4_2 = arg_4_2 or 0

	return (CCLayerColor:create(arg_4_0, arg_4_1, arg_4_2))
end

local function var_0_5(arg_5_0, arg_5_1)
	if type(arg_5_0) == "table" then
		return var_0_2(arg_5_0, arg_5_1)
	elseif arg_5_0 == nil then
		log.error("pic is nil !!!")

		return nil
	elseif arg_5_0 == "" then
		return CCSprite:create()
	elseif string.find(arg_5_0, "frame:") ~= nil then
		local var_5_0 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(string.sub(arg_5_0, 7))

		if var_5_0 == nil then
			log.error("找不到图片" .. string.sub(arg_5_0, 7))
		end

		return CCSprite:createWithSpriteFrame(var_5_0)
	else
		return CCSprite:create(arg_5_0)
	end
end

function autoUI.getPos(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = 0
	local var_6_1 = 0
	local var_6_2 = tool.getVisibleSize().height
	local var_6_3 = tool.getVisibleSize().width
	local var_6_4 = autoUI.getScale()
	local var_6_5

	if arg_6_0 ~= nil then
		var_6_5 = arg_6_0:getParent()
	end

	if var_6_5 ~= nil then
		var_6_2 = var_6_5:getContentSize().height
		var_6_3 = var_6_5:getContentSize().width
	end

	local var_6_6 = 0
	local var_6_7 = 0

	if arg_6_0 then
		var_6_6 = arg_6_0:getContentSize().height
		var_6_7 = arg_6_0:getContentSize().width
	end

	if arg_6_1.type == "button" then
		var_6_6 = 0
		var_6_7 = 0
	end

	if arg_6_1.xcenter ~= nil then
		var_6_0 = var_6_3 / 2 + arg_6_1.xcenter
	end

	if arg_6_1.ycenter ~= nil then
		var_6_1 = var_6_2 / 2 + arg_6_1.ycenter
	end

	if arg_6_1.top ~= nil then
		var_6_1 = var_6_2 - (arg_6_1.top + var_6_6 / 2)
	end

	if arg_6_1.down ~= nil then
		var_6_1 = arg_6_1.down + var_6_6 / 2
	end

	if arg_6_1.left ~= nil then
		var_6_0 = arg_6_1.left + var_6_7 / 2
	end

	if arg_6_1.right ~= nil then
		var_6_0 = var_6_3 - (arg_6_1.right + var_6_7 / 2)
	end

	if arg_6_1.x ~= nil then
		if type(arg_6_1.x) == type("") then
			loadstring("x=" .. arg_6_1.x)()
		else
			var_6_0 = arg_6_1.x
		end
	end

	if arg_6_1.y ~= nil then
		if type(arg_6_1.y) == type("") then
			var_6_1 = loadstring(arg_6_1.y)
		else
			var_6_1 = arg_6_1.y
		end
	end

	return ccp(var_6_0, var_6_1)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1.anchorPointX or 0.5
	local var_7_1 = arg_7_1.anchorPointY or 0.5

	arg_7_0:setAnchorPoint(ccp(var_7_0, var_7_1))
	arg_7_0:setPosition(autoUI.getPos(arg_7_0, arg_7_1, arg_7_2))
end

local function var_0_7(arg_8_0, arg_8_1)
	for iter_8_0, iter_8_1 in pairs(arg_8_1) do
		log.debug("hi", iter_8_0, iter_8_1)
	end

	local var_8_0 = var_0_0[arg_8_1.style]

	if var_8_0 then
		var_0_1(arg_8_1, var_8_0)
	end

	if arg_8_1.text == nil then
		arg_8_1.text = ""
	end

	local var_8_1

	if arg_8_1.fnt == nil then
		if arg_8_1.stroke == false then
			var_8_1 = CCLabelTTF:create(arg_8_1.text, arg_8_1.font, arg_8_1.fontSize)
		else
			var_8_1 = CCStrokeLabelTTF:create(arg_8_1.text, arg_8_1.font, arg_8_1.fontSize, arg_8_1.strokeSize, arg_8_1.strokeColor)
		end

		if arg_8_1.align ~= nil then
			var_8_1:setHorizontalAlignment(arg_8_1.align)
		end

		if arg_8_1.width or arg_8_1.height then
			arg_8_1.width = arg_8_1.width or arg_8_1.fontSize * string.len(arg_8_1.text)
			arg_8_1.height = arg_8_1.height or arg_8_1.fontSize

			if emgr and emgr.platform and emgr.platform == "Android" and arg_8_1.height == arg_8_1.fontSize then
				arg_8_1.height = arg_8_1.height + 10
			end

			var_8_1:setDimensions(CCSizeMake(arg_8_1.width, arg_8_1.height))
		end
	else
		var_8_1 = CCLabelBMFont:create(arg_8_1.text, arg_8_1.fnt)

		var_8_1:setScale(0.7)
	end

	if arg_8_1.color then
		var_8_1:setColor(arg_8_1.color)
	end

	var_0_6(var_8_1, arg_8_1, arg_8_0)

	return var_8_1
end

local function var_0_8(arg_9_0, arg_9_1)
	arg_9_1.fontSize = 20
	arg_9_1.color = colorText[10004]
	arg_9_1.strokeSize = 2
	arg_9_1.strokeColor = colorText[10005]

	return var_0_7(arg_9_0, arg_9_1)
end

local function var_0_9(arg_10_0, arg_10_1)
	return (var_0_4(arg_10_1.color, arg_10_1.width, arg_10_1.height))
end

local function var_0_10(arg_11_0, arg_11_1)
	local var_11_0 = var_0_3(arg_11_1.pic, arg_11_1.middleRect, arg_11_1.preferedSize)

	log.debug("init9SpritePic")

	return var_11_0
end

local function var_0_11(arg_12_0, arg_12_1)
	local var_12_0 = CCClippingNode:create()
	local var_12_1 = var_0_5(arg_12_1.mask)

	var_12_0:setStencil(var_12_1)
	var_12_0:setInverted(arg_12_1.inverted)
	var_12_0:setAlphaThreshold(arg_12_1.alphaThreshold or 0)

	return var_12_0
end

local function var_0_12(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.frameGap or 10
	local var_13_1 = arg_13_1.lineGap or 4
	local var_13_2 = var_0_3(arg_13_1.pic, arg_13_1.middleRect, CCSizeMake(0, 0))
	local var_13_3 = {}
	local var_13_4 = 0
	local var_13_5 = 0
	local var_13_6 = arg_13_1.showInCenter or false

	for iter_13_0, iter_13_1 in pairs(arg_13_1.content) do
		local var_13_7 = autoUI.createUI(var_13_2, iter_13_1, arg_13_0)

		var_13_3[#var_13_3 + 1] = var_13_7

		local var_13_8 = var_13_7:getContentSize().width
		local var_13_9 = var_13_7:getContentSize().height

		if var_13_4 < var_13_8 then
			var_13_4 = var_13_8
		end

		var_13_5 = var_13_5 + var_13_9 + var_13_1

		var_13_7:setAnchorPoint(ccp(0, 1))
	end

	local var_13_10 = var_13_4 + var_13_0 * 2
	local var_13_11 = var_13_5 + var_13_0 * 2 - var_13_1

	var_13_2:setPreferredSize(CCSizeMake(var_13_10, var_13_11))

	local var_13_12 = var_13_0
	local var_13_13 = var_13_11 - var_13_0

	for iter_13_2 in ipairs(var_13_3) do
		var_13_3[iter_13_2]:setPosition(ccp(var_13_12, var_13_13))

		if var_13_6 == true then
			var_13_3[iter_13_2]:setPosition(ccp(var_13_10 / 2 - var_13_3[iter_13_2]:getContentSize().width / 2, var_13_13))
		end

		var_13_13 = var_13_13 - var_13_3[iter_13_2]:getContentSize().height - var_13_1
	end

	return var_13_2
end

local function var_0_13(arg_14_0, arg_14_1)
	local var_14_0 = var_0_5(arg_14_1.pic)

	if arg_14_1.isGray then
		var_14_0 = GraySprite:createWithSpriteFrame(var_14_0:displayFrame())
	end

	if arg_14_1.scale then
		var_14_0:setScale(arg_14_1.scale)
	end

	if arg_14_1.rotate then
		var_14_0:setRotation(arg_14_1.rotate)
	end

	if not var_14_0 then
		log.error("create sprite faild by pic " .. arg_14_1.pic)
	end

	var_0_6(var_14_0, arg_14_1, arg_14_0)

	return var_14_0
end

local function var_0_14(arg_15_0, arg_15_1)
	if arg_15_1.new then
		local var_15_0 = CCLayer:create()

		local function var_15_1(arg_16_0)
			function arg_16_0.registerScriptTapHandler(arg_17_0, arg_17_1)
				log.info("menuItem:registerScriptTapHandler")
				arg_17_0:addHandleOfControlEvent(arg_17_1, CCControlEventTouchUpInside)
			end

			function arg_16_0.unregisterScriptTapHandler(arg_18_0, arg_18_1)
				log.info("menuItem:unregisterScriptTapHandler")
				arg_18_0:removeHandleOfControlEvent(CCControlEventTouchUpInside)
			end

			function arg_16_0.setNormalImage(arg_19_0, arg_19_1)
				log.info("menuItem:setNormalImage")
				arg_19_0:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrame(arg_19_1:displayFrame()), CCControlStateNormal)
				arg_19_0:setPreferredSize(arg_19_1:getContentSize())
			end

			function arg_16_0.setSelectedImage(arg_20_0, arg_20_1)
				log.info("menuItem:setSelectedImage")
				arg_20_0:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrame(arg_20_1:displayFrame()), CCControlStateHighlighted)
				arg_20_0:setPreferredSize(arg_20_1:getContentSize())
			end

			function arg_16_0.setDisabledImage(arg_21_0, arg_21_1)
				log.info("menuItem:setDisabledImage")
				arg_21_0:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrame(arg_21_1:displayFrame()), CCControlStateDisabled)
				arg_21_0:setPreferredSize(arg_21_1:getContentSize())
			end

			function arg_16_0.selected(arg_22_0)
				log.info("menuItem:selected")
				arg_22_0:setHighlighted(true)
			end

			function arg_16_0.unselected(arg_23_0)
				log.info("menuItem:unselected")
				arg_23_0:setHighlighted(false)
			end
		end

		local var_15_2 = 0

		for iter_15_0, iter_15_1 in pairs(arg_15_1.buttons) do
			local var_15_3 = var_0_5(iter_15_1.pic1, arg_15_0)
			local var_15_4 = var_0_5(iter_15_1.pic2, arg_15_0)
			local var_15_5

			if iter_15_1.pic3 then
				var_15_5 = var_0_5(iter_15_1.pic3, arg_15_0)
			else
				var_15_5 = GraySprite:createWithSpriteFrame(var_15_3:displayFrame())
			end

			local var_15_6 = CCControlButton:create(CCScale9Sprite:createWithSpriteFrame(var_15_3:displayFrame()))

			var_15_6:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrame(var_15_4:displayFrame()), CCControlStateHighlighted)
			var_15_6:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrame(var_15_5:displayFrame()), CCControlStateDisabled)
			var_15_6:setPreferredSize(var_15_3:getContentSize())
			var_15_0:addChild(var_15_6)

			if arg_15_1.listType == "hlist" then
				var_15_6:setPosition(ccp(var_15_2 * arg_15_1.xpadding, 0))
			elseif arg_15_1.listType == "vlist" then
				var_15_6:setPosition(ccp(0, var_15_2 * arg_15_1.ypadding))
			else
				var_0_6(var_15_6, iter_15_1, arg_15_0)
			end

			if iter_15_1.children ~= nil then
				for iter_15_2, iter_15_3 in pairs(iter_15_1.children) do
					autoUI.createUI(var_15_6, iter_15_3, arg_15_0)
				end
			end

			if iter_15_1.visible == false then
				var_15_6:setVisible(false)
			end

			if iter_15_1.enable ~= nil then
				var_15_6:setEnabled(iter_15_1.enable)
			end

			if iter_15_1.tag ~= nil then
				var_15_6:setTag(iter_15_1.tag)
			end

			var_15_6._addHandleOfControlEvent = var_15_6.addHandleOfControlEvent

			local var_15_7 = {}

			function var_15_6.addHandleOfControlEvent(arg_24_0, arg_24_1, arg_24_2)
				if not var_15_7[arg_24_2] then
					var_15_7[arg_24_2] = {}
				end

				var_15_7[arg_24_2].callback = arg_24_1

				local var_24_0 = {}

				setmetatable(var_24_0, {
					__mode = "v"
				})

				var_24_0.callback = arg_24_1

				arg_24_0:_addHandleOfControlEvent(function(...)
					var_24_0.callback(...)
				end, arg_24_2)
			end

			var_15_6:registerScriptHandler(function(arg_26_0)
				if arg_26_0 == "exit" then
					var_15_7 = nil
				end
			end)

			if iter_15_1.callback ~= nil then
				var_15_6:addHandleOfControlEvent(iter_15_1.callback, CCControlEventTouchUpInside)
			end

			if iter_15_1.callBack ~= nil then
				var_15_6:addHandleOfControlEvent(iter_15_1.callBack, CCControlEventTouchUpInside)
			end

			if iter_15_1.zoom ~= nil then
				var_15_6:setZoomOnTouchDown(iter_15_1.zoom)
			end

			if iter_15_1.name ~= nil then
				arg_15_0[iter_15_1.name] = var_15_6
			end

			var_15_1(var_15_6)

			var_15_2 = var_15_2 + 1
		end

		return var_15_0
	else
		local var_15_8 = CCArray:create()
		local var_15_9 = 0

		for iter_15_4, iter_15_5 in pairs(arg_15_1.buttons) do
			local var_15_10 = var_0_5(iter_15_5.pic1, arg_15_0)
			local var_15_11 = var_0_5(iter_15_5.pic2, arg_15_0)
			local var_15_12

			if iter_15_5.pic3 then
				var_15_12 = var_0_5(iter_15_5.pic3, arg_15_0)
			else
				var_15_12 = GraySprite:createWithSpriteFrame(var_15_10:displayFrame())
			end

			if iter_15_5.children ~= nil then
				for iter_15_6, iter_15_7 in pairs(iter_15_5.children) do
					autoUI.createUI(var_15_10, iter_15_7, arg_15_0)
					autoUI.createUI(var_15_11, iter_15_7, arg_15_0)

					if var_15_12 then
						autoUI.createUI(var_15_12, iter_15_7, arg_15_0)
					end
				end
			end

			local var_15_13 = CCMenuItemSprite:create(var_15_10, var_15_11, var_15_12)

			if arg_15_1.listType == "hlist" then
				var_15_13:setPosition(ccp(var_15_9 * arg_15_1.xpadding, 0))
			elseif arg_15_1.listType == "vlist" then
				var_15_13:setPosition(ccp(0, var_15_9 * arg_15_1.ypadding))
			else
				var_0_6(var_15_13, iter_15_5, arg_15_0)
			end

			if iter_15_5.visible == false then
				var_15_13:setVisible(false)
			end

			var_15_8:addObject(var_15_13)

			if iter_15_5.name ~= nil then
				arg_15_0[iter_15_5.name] = var_15_13
			end

			if iter_15_5.scale ~= nil then
				var_15_13:setScale(iter_15_5.scale)
			end

			if iter_15_5.rotate ~= nil then
				var_15_13:setRotation(iter_15_5.rotate)
			end

			var_15_9 = var_15_9 + 1

			if iter_15_5.enable ~= nil then
				var_15_13:setEnabled(iter_15_5.enable)
			end

			if iter_15_5.tag ~= nil then
				var_15_13:setTag(iter_15_5.tag)
			end

			log.debug("button.callBack", iter_15_5.callBack)

			if iter_15_5.callBack ~= nil then
				var_15_13:registerScriptTapHandler(iter_15_5.callBack)
			end
		end

		local var_15_14 = CCMenu:createWithArray(var_15_8)

		function var_15_14.getItemPos(arg_27_0)
			local var_27_0 = 0
			local var_27_1 = 0

			if arg_15_1.listType == "hlist" then
				local var_27_2 = autoUI.getPos(button, arg_15_1, arg_15_0)
				local var_27_3 = arg_15_1.xdirection or 1

				var_27_0 = arg_27_0 * arg_15_1.xpadding * var_27_3
				var_27_1 = 0
			elseif arg_15_1.listType == "vlist" then
				local var_27_4 = autoUI.getPos(button, arg_15_1, arg_15_0)
				local var_27_5 = arg_15_1.ydirection or 1

				var_27_0 = 0
				var_27_1 = arg_27_0 * arg_15_1.ypadding * var_27_5
			end

			return ccp(var_27_0, var_27_1)
		end

		return var_15_14
	end
end

function userId()
	return "createWithSpriteFrame "
end

local function var_0_15(arg_29_0, arg_29_1)
	local var_29_0 = createBaseLayer()

	var_29_0:setTouchEnabled(true)

	local var_29_1 = {}
	local var_29_2 = 1

	for iter_29_0, iter_29_1 in pairs(arg_29_1.buttons) do
		local var_29_3 = var_0_5(iter_29_1.pic1, arg_29_0)

		var_0_6(var_29_3, iter_29_1, arg_29_0)
		var_29_0:addChild(var_29_3)

		if iter_29_1.name ~= nil then
			arg_29_0[iter_29_1.name] = var_29_3
		end

		local var_29_4

		if iter_29_1.selectedPic ~= nil then
			var_29_4 = var_0_5(iter_29_1.selectedPic, arg_29_0)

			var_0_6(var_29_4, iter_29_1, arg_29_0)
			var_29_0:addChild(var_29_4, 101)
			var_29_4:setVisible(false)
		end

		var_29_3:setTag(iter_29_1.id)

		var_29_1[iter_29_1.id] = {
			button = var_29_3,
			selectedButton = var_29_4,
			data = iter_29_1,
			click_event = arg_29_1.click_event
		}
	end

	local var_29_5
	local var_29_6

	local function var_29_7(arg_30_0)
		local var_30_0 = arg_30_0.data
		local var_30_1 = arg_30_0.button

		var_29_5 = var_30_0.id

		if var_29_6 ~= nil then
			var_29_6(var_29_5)
		end

		for iter_30_0, iter_30_1 in pairs(var_29_1) do
			if iter_30_1.selectedButton ~= nil then
				iter_30_1.selectedButton:setVisible(false)
			end
		end

		if arg_30_0.selectedButton ~= nil then
			arg_30_0.selectedButton:setVisible(true)
		end

		if arg_30_0.click_event ~= nil then
			eventManager.dispatchEvent(arg_30_0.click_event, arg_30_0)
		end
	end

	local function var_29_8(arg_31_0)
		if var_29_1[arg_31_0] ~= nil then
			return var_29_7(var_29_1[arg_31_0])
		end
	end

	var_29_0:registerScriptTouchHandler(function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_0 == CCTOUCHBEGAN then
			local var_32_0 = ccp(arg_32_1, arg_32_2)

			for iter_32_0, iter_32_1 in pairs(var_29_1) do
				if not LayerTransparentCheck:ifTransparent(iter_32_0, var_32_0, var_29_0) then
					var_29_7(iter_32_1)

					break
				end
			end
		end
	end)

	arg_29_0[arg_29_1.name .. "_control"] = {}
	arg_29_0[arg_29_1.name .. "_control"].selectButtonById = var_29_8
	arg_29_0[arg_29_1.name .. "_control"].selectedId = var_29_5
	arg_29_0[arg_29_1.name .. "_control"].registerCallBack = function(arg_33_0)
		var_29_6 = arg_33_0
	end

	return var_29_0
end

local function var_0_16(arg_34_0, arg_34_1)
	if arg_34_1.text == nil or arg_34_1.text == "" then
		arg_34_1.text = "0"
	end

	local var_34_0 = CCLabelAtlas:create(arg_34_1.text, arg_34_1.pic, arg_34_1.width, arg_34_1.height, arg_34_1.startChar)

	var_0_6(var_34_0, arg_34_1, arg_34_0)

	return var_34_0
end

local function var_0_17(arg_35_0, arg_35_1)
	arg_35_1.midPoint = arg_35_1.midPoint or ccp(0, 0)
	arg_35_1.barChangeRate = arg_35_1.barChangeRate or ccp(1, 0)
	arg_35_1.percentage = arg_35_1.percentage or 0

	local var_35_0 = arg_35_1.pic
	local var_35_1

	if string.find(var_35_0, "frame:") ~= nil then
		var_35_1 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(string.sub(var_35_0, 7)))
	else
		var_35_1 = CCSprite:create(var_35_0)
	end

	local var_35_2 = CCProgressTimer:create(var_35_1)

	if arg_35_1.barType == nil then
		var_35_2:setType(kCCProgressTimerTypeBar)
	else
		var_35_2:setType(kCCProgressTimerTypeRadial)
	end

	if arg_35_1.reverse == true then
		var_35_2:setReverseProgress(true)
	end

	if arg_35_1.scale then
		var_35_2:setScale(arg_35_1.scale)
	end

	var_35_2:setMidpoint(arg_35_1.midPoint)
	var_35_2:setBarChangeRate(arg_35_1.barChangeRate)
	var_35_2:setPercentage(arg_35_1.percentage)
	var_0_6(var_35_2, arg_35_1, arg_35_0)

	return var_35_2
end

function autoUI.renderList(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = createBaseLayer()
	local var_36_1 = CCSprite:create()

	if arg_36_1.listType == "hlist" then
		if arg_36_1.listHeight then
			var_36_0:setContentSize(CCSizeMake(#arg_36_2 * arg_36_1.xcelling, arg_36_1.listHeight))
		else
			var_36_0:setContentSize(CCSizeMake(#arg_36_2 * arg_36_1.xcelling, var_36_0:getContentSize().height))
		end
	elseif arg_36_1.listWidth then
		var_36_0:setContentSize(CCSizeMake(arg_36_1.listWidth, #arg_36_2 * arg_36_1.ycelling))
	else
		var_36_0:setContentSize(CCSizeMake(var_36_0:getContentSize().width, #arg_36_2 * arg_36_1.ycelling))
	end

	local var_36_2 = {
		items = {}
	}
	local var_36_3 = 1

	for iter_36_0, iter_36_1 in pairs(arg_36_2) do
		local var_36_4 = arg_36_1.itemRender(iter_36_1, var_36_3)
		local var_36_5 = renderOneListItem(var_36_1, arg_36_1, var_36_4, var_36_3, arg_36_0)

		table.insert(var_36_2.items, var_36_5)

		var_36_3 = var_36_3 + 1
	end

	arg_36_0[arg_36_1.name .. "_extend"] = var_36_2
	arg_36_0[arg_36_1.name] = var_36_1

	var_36_0:addChild(var_36_1)
	var_0_6(var_36_1, arg_36_1, arg_36_0)
	log.debug("list layer content size ---", var_36_0:getContentSize().width, var_36_0:getContentSize().height)

	return var_36_0
end

function renderOneListItem(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	oneItem = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_2.uis) do
		if arg_37_1.listType == "hlist" then
			if iter_37_1.x ~= nil then
				iter_37_1.x = arg_37_1.xcelling * (arg_37_3 - 0.5) + iter_37_1.x
			else
				iter_37_1.x = arg_37_1.xcelling * (arg_37_3 - 0.5)
			end
		elseif iter_37_1.y ~= nil then
			iter_37_1.y = -arg_37_1.ycelling * (arg_37_3 - 0.5) + iter_37_1.y
		else
			iter_37_1.y = -arg_37_1.ycelling * (arg_37_3 - 0.5)
		end

		newUI = autoUI.createUI(arg_37_0, iter_37_1, arg_37_4)

		if arg_37_1.listHeight then
			newUI:setPositionY(arg_37_1.listHeight * 0.5)
		end

		if arg_37_1.listWidth then
			newUI:setPositionX(arg_37_1.listWidth * 0.5)
		end

		table.insert(oneItem, newUI)
	end

	return oneItem
end

function autoUI.updateListData(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	if arg_38_3 <= #arg_38_0[arg_38_1 .. "_extend"].items then
		local var_38_0 = arg_38_0[arg_38_1 .. "_extend"].items[arg_38_3]

		for iter_38_0, iter_38_1 in pairs(var_38_0) do
			arg_38_0[arg_38_1]:removeChild(iter_38_1, true)
		end
	end

	local var_38_1 = arg_38_2[arg_38_1].itemRender(arg_38_4, arg_38_3)

	oneItem = renderOneListItem(arg_38_0[arg_38_1], arg_38_2[arg_38_1], var_38_1, arg_38_3, arg_38_0)
	arg_38_0[arg_38_1 .. "_extend"].items[arg_38_3] = oneItem
end

function autoUI.updateListDataWithListUiData(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	if arg_39_3 <= #arg_39_0[arg_39_1 .. "_extend"].items then
		local var_39_0 = arg_39_0[arg_39_1 .. "_extend"].items[arg_39_3]

		for iter_39_0, iter_39_1 in pairs(var_39_0) do
			arg_39_0[arg_39_1]:removeChild(iter_39_1, true)
		end
	end

	local var_39_1 = arg_39_2.itemRender(arg_39_4, arg_39_3)

	oneItem = renderOneListItem(arg_39_0[arg_39_1], arg_39_2, var_39_1, arg_39_3, arg_39_0)
	arg_39_0[arg_39_1 .. "_extend"].items[arg_39_3] = oneItem
end

function autoUI.createUI(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0
	local var_40_1 = copy(arg_40_1)

	var_40_1.style = var_40_1.style or var_40_1.type .. "_normal"

	if arg_40_1.type == "label" then
		var_40_0 = var_0_7(arg_40_2, var_40_1)
	elseif arg_40_1.type == "menu_label" then
		var_40_0 = var_0_8(arg_40_2, var_40_1)
	elseif arg_40_1.type == "button" then
		var_40_0 = var_0_14(arg_40_2, var_40_1)
	elseif arg_40_1.type == "layer_color" then
		var_40_0 = var_0_9(arg_40_2, var_40_1)
	elseif arg_40_1.type == "clipping_node" then
		var_40_0 = var_0_11(arg_40_2, var_40_1)
	elseif arg_40_1.type == "pic" then
		var_40_0 = var_0_13(arg_40_2, var_40_1)
	elseif arg_40_1.type == "pic_9" then
		var_40_0 = var_0_10(arg_40_2, var_40_1)
	elseif arg_40_1.type == "pic_9_tips" then
		var_40_0 = var_0_12(arg_40_2, var_40_1)
	elseif arg_40_1.type == "group_button" then
		var_40_0 = var_0_15(arg_40_2, var_40_1)
	elseif arg_40_1.type == "list" then
		return
	elseif arg_40_1.type == "atlas" then
		var_40_0 = var_0_16(arg_40_2, var_40_1)
	elseif arg_40_1.type == "process" then
		var_40_0 = var_0_17(arg_40_2, var_40_1)
	else
		log.debug("ERROR,do not exist type", arg_40_1.type)
	end

	local var_40_2 = 100

	if arg_40_1.z ~= nil then
		var_40_2 = arg_40_1.z
	end

	local var_40_3 = arg_40_1.name

	log.debug("name", var_40_3)

	if var_40_3 ~= nil then
		arg_40_2[var_40_3] = var_40_0
	end

	if var_40_3 then
		log.debug("[create] ui " .. var_40_3)
	end

	if arg_40_1.layer ~= nil then
		local var_40_4 = smgr.getLayer(arg_40_1.layer)

		if var_40_4 then
			var_40_4:addChild(var_40_0, var_40_2)
		end
	elseif arg_40_0 then
		arg_40_0:addChild(var_40_0, var_40_2)
	end

	if arg_40_1.type ~= "group_button" then
		var_0_6(var_40_0, var_40_1, arg_40_2)
	end

	if arg_40_1.visible ~= nil then
		var_40_0:setVisible(arg_40_1.visible)
	end

	if arg_40_1.tag ~= nil then
		var_40_0:setTag(arg_40_1.tag)
	end

	if arg_40_1.child ~= nil then
		autoUI.createUI(var_40_0, arg_40_1.child, arg_40_2)
	end

	if arg_40_1.children ~= nil then
		for iter_40_0, iter_40_1 in pairs(arg_40_1.children) do
			autoUI.createUI(var_40_0, iter_40_1, arg_40_2)
		end
	end

	return var_40_0
end

function autoUI.initUI(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_1) do
		if iter_41_0 ~= nil then
			iter_41_1.name = iter_41_1.name or iter_41_0
		end

		if iter_41_1.delay ~= true then
			autoUI.createUI(arg_41_0, iter_41_1, var_41_0)
		end
	end

	log.debug("init UI over")

	return var_41_0
end

function autoUI.getScale()
	local var_42_0 = tool.getVisibleSize().width / 960
	local var_42_1 = tool.getVisibleSize().height / 640
	local var_42_2

	if var_42_0 < 1 or var_42_1 < 1 then
		var_42_2 = math.min(var_42_0, var_42_1)
	else
		var_42_2 = math.max(var_42_0, var_42_1)
	end

	return var_42_2
end

function autoUI.scaleUI(arg_43_0)
	do return end

	local var_43_0 = autoUI.getScale()

	arg_43_0:setScale(var_43_0)
	arg_43_0:setAnchorPoint(ccp(0, 0))

	local var_43_1 = 1136
	local var_43_2 = 768
	local var_43_3 = -(var_43_1 - 960) / 2 + var_43_1 * (1 - var_43_0) / 2
	local var_43_4 = -(var_43_2 - 640) / 2 + var_43_2 * (1 - var_43_0) / 2

	arg_43_0:setPosition(ccp(var_43_3, var_43_4))
end

function autoUI.getMargin()
	local var_44_0 = autoUI.getScale()

	return ccp(tool.getVisibleSize().width - 960 * var_44_0, tool.getVisibleSize().height - 640 * var_44_0)
end
