local var_0_0 = 1001
local var_0_1 = 1101
local var_0_2 = {}

local function var_0_3()
	var_0_2.data.layer:getParent():removeChild(var_0_2.data.layer, true)

	user.settings.isCharacterLayerDisplayed = false

	CCTextureCache:sharedTextureCache():removeUnusedTextures()
end

local function var_0_4(arg_2_0)
	tolua.cast(var_0_2.data.bg:getChildByTag(var_0_2.data.nameTag), "CCEditBox"):setText(arg_2_0.action.data.list[1])
end

local function var_0_5(arg_3_0)
	if arg_3_0.action.state == 1 then
		user.player.name = arg_3_0.action.data.playerName or user.player.name
		user.player.pic = arg_3_0.action.data.pic or var_0_2.data.index

		var_0_3()
		eventManager.dispatchEvent("createCharacterOver")

		if var_0_2.isVip10 then
			return
		end

		if channelMgr.currentChannel == channels.andKuaiyong or channelMgr.currentChannel == channels.andTt or channelMgr.currentChannel == channels.andLoexu then
			channelMgr.statForAndroidKuaiyong()
			channelMgr.transform("method", "createRole")
		end
	end
end

function var_0_2.init()
	rmgr.loadResource("res/ui/character/character.plist")

	var_0_2.data = {}
	var_0_2.data.layer = createBaseLayer()
	var_0_2.data.name = nil
	var_0_2.data.role = nil
	var_0_2.data.roleTag = 10101
	var_0_2.data.nameTag = 10110
	var_0_2.data.bg = nil
	var_0_2.data.scheduleEntry = nil
	var_0_2.data.index = 1
	var_0_2.data.resouce = {
		"player1.png",
		"player2.png",
		"player3.png",
		"player4.png",
		"player5.png",
		"player6.png"
	}
	var_0_2.data.icon = {
		"res/ui/common/playerHead/playerHead_icon_1.png",
		"res/ui/common/playerHead/playerHead_icon_2.png",
		"res/ui/common/playerHead/playerHead_icon_3.png",
		"res/ui/common/playerHead/playerHead_icon_4.png",
		"res/ui/common/playerHead/playerHead_icon_5.png",
		"res/ui/common/playerHead/playerHead_icon_6.png"
	}

	function var_0_2.data.layer.onEnter(arg_5_0)
		return
	end

	function var_0_2.data.layer.onExit(arg_6_0)
		return
	end
end

local function var_0_6()
	var_0_2.data.bg:removeChildByTag(var_0_2.data.roleTag, true)

	var_0_2.data.role = CCSprite:create("res/ui/common/playerPic/" .. var_0_2.data.resouce[var_0_2.data.index])

	var_0_2.data.role:setPosition(ccp(var_0_2.data.role:getContentSize().width / 2, var_0_2.data.role:getContentSize().height / 2 + 12))
	var_0_2.data.bg:addChild(var_0_2.data.role, 1, var_0_2.data.roleTag)
end

local function var_0_7()
	local var_8_0 = tolua.cast(var_0_2.data.bg:getChildByTag(var_0_2.data.nameTag), "CCEditBox"):getText()
	local var_8_1 = var_0_2.data.index

	if not var_8_0 or string.len(var_8_0) == 0 then
		require("lua/component/messageBox")
		messageBox.alert("", language.get(290001))

		return
	end

	if string.find(var_8_0, "钓鱼岛") ~= nil or string.find(var_8_0, "尖阁列岛") ~= nil then
		smgr.showTipText(language.get(143040))

		return
	end

	local var_8_2 = string.format("playerName=%s&pic=%d", var_8_0, var_8_1)

	log.info(var_8_2)

	if var_0_2.isVip10 then
		cmgr.sendRequest(var_0_5, actions.changePlayerName, var_8_0, var_8_1)
	else
		cmgr.sendRequest(var_0_5, actions.createAndName, var_8_0, var_8_1)
	end
end

local function var_0_8()
	cmgr.sendRequest(var_0_4, actions.autoname, "")
end

local function var_0_9(arg_10_0, arg_10_1)
	local var_10_0, var_10_1 = var_0_2.data.bg:getPosition()
	local var_10_2 = var_0_2.data.bg:getContentSize()
	local var_10_3 = ccp(arg_10_0 + var_10_2.width / 2 - var_10_0, arg_10_1 + var_10_2.height / 2 - var_10_1)

	for iter_10_0 = 1, 6 do
		local var_10_4 = var_0_2.data.bg:getChildByTag(var_0_0 + iter_10_0)

		if var_10_4:boundingBox():containsPoint(var_10_3) then
			var_0_2.data.index = iter_10_0

			for iter_10_1 = 1, 6 do
				local var_10_5 = var_0_2.data.bg:getChildByTag(var_0_0 + iter_10_1)
				local var_10_6 = tolua.cast(var_10_5:getChildByTag(var_0_1), "CCSprite")

				if var_10_6 then
					var_10_5:removeChild(var_10_6, true)
				end
			end

			local var_10_7 = CCSprite:createWithSpriteFrameName("role_por_view_on.jpg")

			var_10_7:setPosition(ccp(var_10_4:getContentSize().width / 2, var_10_4:getContentSize().height / 2))
			var_10_4:addChild(var_10_7, 1, var_0_1)
			var_0_6()

			return
		end
	end
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_0 == CCTOUCHBEGAN then
		var_0_9(arg_11_1, arg_11_2)

		return true
	end
end

function createCharacter(arg_12_0)
	var_0_2.isVip10 = arg_12_0

	var_0_2.init()

	var_0_2.data.bg = CCSprite:createWithSpriteFrameName("role_frame_view.png")

	var_0_2.data.bg:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_0_2.data.layer:addChild(var_0_2.data.bg, 0)

	local var_12_0 = arg_12_0 and "xgjsm_title.png" or "text_cjjs_tit.png"
	local var_12_1 = CCSprite:create("res/ui/common/text/createRole/" .. var_12_0)

	var_0_2.data.bg:addChild(var_12_1)
	var_12_1:setPosition(ccp(var_0_2.data.bg:getContentSize().width / 2, var_0_2.data.bg:getContentSize().height - 40))

	local var_12_2 = var_0_2.data.bg:getContentSize().width
	local var_12_3 = var_0_2.data.bg:getContentSize().height
	local var_12_4 = 0

	for iter_12_0 = 1, 6 do
		local var_12_5 = CCSprite:createWithSpriteFrameName("role_por_view.jpg")
		local var_12_6 = CCSprite:create(var_0_2.data.icon[iter_12_0])

		var_12_6:setPosition(var_12_5:getContentSize().width / 2, var_12_5:getContentSize().height / 2)
		var_12_5:addChild(var_12_6, 2)

		local var_12_7 = var_12_5:getContentSize().width
		local var_12_8 = (iter_12_0 - 1) % 3 + 1
		local var_12_9 = var_0_2.data.bg:getContentSize().width / 2 + var_12_8 * var_12_7 + var_12_8 * 20 - 80
		local var_12_10 = string.format("%.f", math.floor((iter_12_0 - 1) / 3))
		local var_12_11 = var_12_10 * var_12_7 + var_12_10 * 20 + 330

		log.debug("indexx, indexy, px, py", var_12_8, var_12_10, var_12_9, var_12_11)
		var_12_5:setPosition(ccp(var_12_9, var_12_11))
		var_12_5:setTag(var_0_0 + iter_12_0)
		var_0_2.data.bg:addChild(var_12_5, 1)

		if iter_12_0 == 1 then
			var_0_2.data.index = 1

			local var_12_12 = CCSprite:createWithSpriteFrameName("role_por_view_on.jpg")

			var_12_12:setPosition(ccp(var_12_5:getContentSize().width / 2, var_12_5:getContentSize().height / 2))
			var_12_5:addChild(var_12_12, 1, var_0_1)

			var_0_2.data.role = CCSprite:create("res/ui/common/playerPic/" .. var_0_2.data.resouce[iter_12_0])

			var_0_2.data.role:setPosition(ccp(var_0_2.data.role:getContentSize().width / 2, var_0_2.data.role:getContentSize().height / 2 + 12))
			var_0_2.data.bg:addChild(var_0_2.data.role, 1, var_0_2.data.roleTag)
		end
	end

	local var_12_13 = CCScale9Sprite:createWithSpriteFrameName("role_input_name.png")
	local var_12_14 = CCEditBox:create(CCSizeMake(420, 70), var_12_13)

	var_12_14:setPosition(ccp(var_12_2 * 0.73, var_12_3 * 0.32))
	var_12_14:setMaxLength(15)
	var_12_14:setReturnType(1)
	var_0_2.data.bg:addChild(var_12_14, 1, var_0_2.data.nameTag)

	local function var_12_15(arg_13_0, arg_13_1)
		local var_13_0 = tolua.cast(arg_13_1, "CCEditBox")

		log.info("editBox", arg_13_0)

		if arg_13_0 == "began" then
			var_13_0:setText("")
		elseif arg_13_0 == "changed" then
			-- block empty
		elseif arg_13_0 == "ended" then
			-- block empty
		end
	end

	var_12_14:registerScriptEditBoxHandler(var_12_15)

	local var_12_16 = CCSprite:create("res/ui/guide/prompt_arrow_input.png")

	var_12_16:setPosition(ccp(var_12_2 * 0.39, var_12_3 * 0.32))
	var_0_2.data.bg:addChild(var_12_16, 2)

	local var_12_17 = CCMoveBy:create(0.4, ccp(50, 0))
	local var_12_18 = CCEaseOut:create(var_12_17, 1)
	local var_12_19 = CCMoveBy:create(0.4, ccp(-50, 0))
	local var_12_20 = CCEaseIn:create(var_12_19, 1)
	local var_12_21 = CCArray:create()

	var_12_21:addObject(var_12_18)
	var_12_21:addObject(var_12_20)

	local var_12_22 = CCSequence:create(var_12_21)
	local var_12_23 = CCRepeatForever:create(tolua.cast(var_12_22, "CCActionInterval"))

	var_12_16:runAction(var_12_23)

	local var_12_24
	local var_12_25
	local var_12_26
	local var_12_27

	if arg_12_0 then
		var_12_24 = CCSprite:create("res/ui/character/btn_gm_a.png")
		var_12_25 = CCSprite:create("res/ui/character/btn_gm_click.png")
		var_12_27 = 1.74
	else
		var_12_24 = CCSprite:createWithSpriteFrameName("btn_crea_a.png")
		var_12_25 = CCSprite:createWithSpriteFrameName("btn_crea_click.png")
		var_12_27 = 1.4
	end

	local var_12_28 = CCMenuItemSprite:create(var_12_24, var_12_25)

	var_12_28:setScale(var_12_27)
	var_12_28:setPosition(ccp(0, 0))
	var_12_28:registerScriptTapHandler(var_0_7)

	local var_12_29 = CCMenu:createWithItem(var_12_28)

	var_12_29:setPosition(ccp(var_12_2 * 0.67, var_12_3 * 0.14 - 5))
	var_0_2.data.bg:addChild(var_12_29, 2)

	if arg_12_0 then
		local var_12_30 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
		local var_12_31 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
		local var_12_32 = CCMenuItemSprite:create(var_12_30, var_12_31)

		var_12_32:setScale(2)
		var_12_32:setPosition(ccp(0, 0))
		var_12_32:registerScriptTapHandler(var_0_3)

		local var_12_33 = CCMenu:createWithItem(var_12_32)

		var_12_33:setPosition(ccp(925, 605))
		var_0_2.data.bg:addChild(var_12_33, 2)
	end

	if conf.language ~= "kr" and conf.language ~= "vie" and conf.language ~= "tha" then
		local var_12_34 = CCSprite:createWithSpriteFrameName("btn_name_auto_a.png")
		local var_12_35 = CCSprite:createWithSpriteFrameName("btn_name_auto_click.png")
		local var_12_36 = CCMenuItemSprite:create(var_12_34, var_12_35)

		var_12_36:setPosition(ccp(0, 0))
		var_12_36:registerScriptTapHandler(var_0_8)
		var_12_36:setScale(2)

		local var_12_37 = CCMenu:createWithItem(var_12_36)

		var_12_37:setPosition(ccp(var_12_2 * 0.8 + 110, var_12_3 * 0.15 - 5))
		var_0_2.data.bg:addChild(var_12_37, 2)
	end

	var_0_2.data.layer:setTouchEnabled(true)
	var_0_2.data.layer:registerScriptTouchHandler(var_0_10, false, true)

	user.settings.isCharacterLayerDisplayed = true

	return var_0_2.data.layer
end
