function versionUpdateNoticeCreate(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = CCSprite:create("res/ui/updateNotice/post_view_bg.png")

	var_1_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	arg_1_0:addChild(var_1_0, 100)
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("res/ui/common/button/button.plist")

	local var_1_1 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
	local var_1_2 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
	local var_1_3 = CCMenuItemSprite:create(var_1_1, var_1_2)

	var_1_3:setPosition(ccp(240, 50))

	if arg_1_1 ~= nil then
		var_1_3:registerScriptTapHandler(arg_1_1)
	end

	local var_1_4 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
	local var_1_5 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
	local var_1_6 = CCMenuItemSprite:create(var_1_4, var_1_5)

	var_1_6:setPosition(ccp(400, 50))
	var_1_6:registerScriptTapHandler(arg_1_2)

	local var_1_7 = CCMenu:create()

	var_1_7:setPosition(ccp(0, 0))
	var_1_7:addChild(var_1_3, 1, 1)
	var_1_7:addChild(var_1_6, 1, 2)
	var_1_0:addChild(var_1_7)

	local var_1_8 = arg_1_3.versionRank or 0
	local var_1_9 = arg_1_3.versionName or "unknow"
	local var_1_10 = arg_1_3.versionSize or "unknow"
	local var_1_11 = arg_1_3.versionMethod or language.get(440009)
	local var_1_12 = arg_1_3.versionContext or {}

	log.info("version rank:", var_1_8)
	log.info("version name:", var_1_9)
	log.info("version size:", var_1_10)

	local var_1_13 = CCLabelTTF:create(language.get(440001), "", 20)

	var_1_13:setPosition(ccp(240, 50))
	var_1_0:addChild(var_1_13, 10)

	local var_1_14 = CCLabelTTF:create(language.get(440002), "", 20)

	var_1_14:setPosition(ccp(400, 50))
	var_1_0:addChild(var_1_14, 10)

	local var_1_15 = createBaseLayer()
	local var_1_16 = {}

	for iter_1_0 = 1, 4 do
		local var_1_17 = CCLabelTTF:create(language.get(440002 + iter_1_0), "", 20)

		var_1_17:setDimensions(CCSizeMake(100, 24))
		var_1_17:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_17:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_15:addChild(var_1_17, 10)

		var_1_16["left_" .. iter_1_0] = var_1_17
	end

	local var_1_18 = CCLabelTTF:create(var_1_9, "", 20)

	var_1_16["right_" .. 1] = var_1_18

	local var_1_19 = CCLabelTTF:create(var_1_10, "", 20)

	var_1_16["right_" .. 2] = var_1_19

	local var_1_20 = CCLabelTTF:create(var_1_11, "", 20)

	var_1_16["right_" .. 3] = var_1_20

	for iter_1_1, iter_1_2 in ipairs(var_1_12) do
		local var_1_21 = CCLabelTTF:create(iter_1_2, "", 20)

		var_1_16["right_" .. 3 + iter_1_1] = var_1_21
	end

	local var_1_22 = var_1_16["right_" .. 1]:getContentSize().height
	local var_1_23 = var_1_16["right_" .. 3]:getContentSize().width
	local var_1_24 = math.floor(var_1_23 / 450) + 1
	local var_1_25 = var_1_24 * var_1_22
	local var_1_26 = 5
	local var_1_27 = var_1_22 * 2 + 5 * var_1_26 + var_1_25 + #var_1_12 * var_1_22

	for iter_1_3 = 1, 3 + #var_1_12 do
		local var_1_28 = var_1_16["right_" .. iter_1_3]

		var_1_28:setDimensions(CCSizeMake(450, var_1_22))
		var_1_28:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_28:setVerticalAlignment(kCCVerticalTextAlignmentCenter)

		if iter_1_3 == 3 then
			var_1_28:setDimensions(CCSizeMake(450, var_1_22 * var_1_24))
			var_1_28:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		end

		var_1_15:addChild(var_1_28, 10)
	end

	local var_1_29 = 50
	local var_1_30 = 325
	local var_1_31 = (var_1_24 - 1) * 12
	local var_1_32 = var_1_27 - var_1_22 / 2 - var_1_26

	var_1_16["left_" .. 1]:setPosition(ccp(var_1_29, var_1_32))
	var_1_16["right_" .. 1]:setPosition(ccp(var_1_30, var_1_32))

	local var_1_33 = var_1_32 - var_1_22 - var_1_26

	var_1_16["left_" .. 2]:setPosition(ccp(var_1_29, var_1_33))
	var_1_16["right_" .. 2]:setPosition(ccp(var_1_30, var_1_33))

	local var_1_34 = var_1_33 - var_1_22 - var_1_26

	var_1_16["left_" .. 3]:setPosition(ccp(var_1_29, var_1_34))
	var_1_16["right_" .. 3]:setPosition(ccp(var_1_30, var_1_34 - var_1_31))

	local var_1_35 = var_1_34 - var_1_25 - var_1_26

	var_1_16["left_" .. 4]:setPosition(ccp(var_1_29, var_1_35))

	for iter_1_4 = 1, #var_1_12 do
		var_1_16["right_" .. 3 + iter_1_4]:setPosition(ccp(var_1_30, var_1_35))

		var_1_35 = var_1_35 - var_1_22 - var_1_26 / 2
	end

	local var_1_36 = CCScrollView:create(CCSizeMake(530, 220))

	var_1_36:setContainer(var_1_15)
	var_1_36:setPosition(ccp(50, 130))
	var_1_36:setContentSize(CCSizeMake(530, var_1_27))
	var_1_36:setDirection(kCCScrollViewDirectionVertical)
	var_1_36:setContentOffset(ccp(0, 220 - var_1_27))
	var_1_0:addChild(var_1_36, 1000)

	local var_1_37 = true
	local var_1_38 = true

	if var_1_8 == 0 then
		if arg_1_3.fileSize < 10 then
			var_1_37 = false
		end
	elseif var_1_8 == 1 then
		var_1_37 = false
	elseif var_1_8 == 2 then
		if arg_1_1 == nil then
			var_1_37 = false
		end
	elseif var_1_8 == 3 then
		var_1_37 = false

		if arg_1_1 ~= nil then
			var_1_37 = true
			var_1_38 = false
		end
	end

	if var_1_37 == true and var_1_38 == true then
		-- block empty
	elseif var_1_37 == false or var_1_38 == true then
		var_1_3:setVisible(false)
		var_1_13:setVisible(false)
		var_1_6:setPosition(ccp(320, 50))
		var_1_14:setPosition(ccp(320, 50))
	elseif var_1_38 == false or var_1_37 == true then
		var_1_6:setVisible(false)
		var_1_14:setVisible(false)
		var_1_3:setPosition(ccp(320, 50))
		var_1_13:setPosition(ccp(320, 50))
	end

	if var_1_38 == true and arg_1_3.isContinue ~= nil and tonumber(arg_1_3.isContinue) == 1 then
		var_1_14:setString(language.get(440007))
	end

	if channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		var_1_3:setVisible(false)
		var_1_13:setVisible(false)
		var_1_6:setPosition(ccp(320, 50))
		var_1_14:setPosition(ccp(320, 50))
	end

	return var_1_0
end
