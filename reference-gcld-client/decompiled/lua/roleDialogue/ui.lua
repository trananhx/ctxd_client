roleDialogue = {}

require("lua/roleDialogue/constant")
require("lua/roleDialogue/uidata")
require("lua/roleDialogue/control")
require("lua/common/dataCache")

roleDialogue.ui = {}
roleDialogue.ui.table = {}

function roleDialogue.ui.initUI()
	roleDialogue.ui.table.leftText:setDimensions(CCSizeMake(280, 155))
	roleDialogue.ui.table.leftText:setHorizontalAlignment(kCCTextAlignmentLeft)
	roleDialogue.ui.table.leftText:setVerticalAlignment(kCCVerticalTextAlignmentTop)
	roleDialogue.ui.table.rightText:setDimensions(CCSizeMake(280, 155))
	roleDialogue.ui.table.rightText:setHorizontalAlignment(kCCTextAlignmentLeft)
	roleDialogue.ui.table.rightText:setVerticalAlignment(kCCVerticalTextAlignmentTop)
	roleDialogue.ui.table.rightDialogueBox:setScaleX(-1)
end

function roleDialogue.ui.onTouch(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0 == CCTOUCHBEGAN then
		return true
	elseif arg_2_0 == CCTOUCHENDED then
		roleDialogue.control.nextSpeak()
	end
end

function roleDialogue.ui.setVisible(arg_3_0)
	roleDialogue.ui.table.layer:setVisible(arg_3_0)
	roleDialogue.ui.table.layer:setTouchEnabled(arg_3_0)
end

function roleDialogue.ui.setLeftVisible(arg_4_0)
	roleDialogue.ui.table.leftRole:setVisible(arg_4_0)
	roleDialogue.ui.table.leftDialogueBox:setVisible(arg_4_0)
	roleDialogue.ui.table.leftText:setVisible(arg_4_0)
end

function roleDialogue.ui.setRightVisible(arg_5_0)
	roleDialogue.ui.table.rightRole:setVisible(arg_5_0)
	roleDialogue.ui.table.rightDialogueBox:setVisible(arg_5_0)
	roleDialogue.ui.table.rightText:setVisible(arg_5_0)
end

function roleDialogue.ui.onEnter()
	log.info("enter roleDialogue layer ... ")
	cmgr.registerResponseHandler(actions.pushPlayer, roleDialogue.control.handler_push_player)
	eventManager.registerEvent(roleDialogue.constant.event1, roleDialogue.control.loadSpeak)
	eventManager.registerEvent("GameOver", roleDialogue.control.game_exit)
end

function roleDialogue.ui.onExit()
	log.info("exit roleDialogue layer ... ")
	cmgr.unregisterResponseHandler(actions.pushPlayer, roleDialogue.control.handler_push_player)
	eventManager.unregisterEvent(roleDialogue.constant.event1, roleDialogue.control.loadSpeak)
	eventManager.unregisterEvent("GameOver", roleDialogue.control.game_exit)
end

function roleDialogue.ui.createLayer()
	local var_8_0 = createBaseLayer()

	roleDialogue.ui.table = autoUI.initUI(var_8_0, getRoleDialogueData())
	roleDialogue.ui.table.layer = var_8_0

	roleDialogue.ui.setVisible(false)
	var_8_0:registerScriptTouchHandler(roleDialogue.ui.onTouch, false, true)

	var_8_0.onEnter = roleDialogue.ui.onEnter
	var_8_0.onExit = roleDialogue.ui.onExit

	roleDialogue.ui.initUI()

	return var_8_0
end

function roleDialogue.ui.special(arg_9_0)
	rmgr.loadResource("res/ui/battle/tractics/tractics.plist")
	rmgr.loadResource("res/ui/battle/tractics/tacticsSelect.plist")

	local var_9_0 = smgr.getLayer("topLayer")

	var_9_0:removeAllChildrenWithCleanup(true)

	if arg_9_0 == "zhanshu1" then
		local var_9_1 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		var_9_0:addChild(var_9_1, 0)

		local var_9_2 = GraySprite:createWithSpriteFrameName("tactics_arrows_1.png")

		var_9_2:setPosition(ccp(visibleSize.width / 2 - 117, visibleSize.height / 2 + 58 + 60))

		local var_9_3 = CCSprite:createWithSpriteFrameName("tactics_arrows_2.png")

		var_9_3:setPosition(ccp(visibleSize.width / 2 + 110, visibleSize.height / 2 + 61 + 60))

		local var_9_4 = GraySprite:createWithSpriteFrameName("tactics_arrows_3.png")

		var_9_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 131 + 60))
		var_9_0:addChild(var_9_2, 10)
		var_9_0:addChild(var_9_3, 10)
		var_9_0:addChild(var_9_4, 10)

		local var_9_5 = CCSprite:createWithSpriteFrameName("gongji_up.png")
		local var_9_6 = GraySprite:createWithSpriteFrameName("fangshou_up.png")
		local var_9_7 = CCSprite:createWithSpriteFrameName("tuji_up.png")

		var_9_5:setPosition(ccp(visibleSize.width / 2 + 122, visibleSize.height / 2 - 65 + 60))
		var_9_6:setPosition(ccp(visibleSize.width / 2 - 122, visibleSize.height / 2 - 65 + 60))
		var_9_7:setPosition(ccp(visibleSize.width / 2 - 5, visibleSize.height / 2 + 145 + 60))
		var_9_0:addChild(var_9_5, 10)
		var_9_0:addChild(var_9_6, 10)
		var_9_0:addChild(var_9_7, 10)
	elseif arg_9_0 == "zhanshu2" then
		local var_9_8 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		var_9_0:addChild(var_9_8, 0)

		local var_9_9 = GraySprite:createWithSpriteFrameName("tactics_arrows_1.png")

		var_9_9:setPosition(ccp(visibleSize.width / 2 - 117, visibleSize.height / 2 + 58 + 60))

		local var_9_10 = GraySprite:createWithSpriteFrameName("tactics_arrows_2.png")

		var_9_10:setPosition(ccp(visibleSize.width / 2 + 110, visibleSize.height / 2 + 61 + 60))

		local var_9_11 = CCSprite:createWithSpriteFrameName("tactics_arrows_3.png")

		var_9_11:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 131 + 60))
		var_9_0:addChild(var_9_9, 10)
		var_9_0:addChild(var_9_10, 10)
		var_9_0:addChild(var_9_11, 10)

		local var_9_12 = CCSprite:createWithSpriteFrameName("gongji_up.png")
		local var_9_13 = CCSprite:createWithSpriteFrameName("fangshou_up.png")
		local var_9_14 = GraySprite:createWithSpriteFrameName("tuji_up.png")

		var_9_12:setPosition(ccp(visibleSize.width / 2 + 122, visibleSize.height / 2 - 65 + 60))
		var_9_13:setPosition(ccp(visibleSize.width / 2 - 122, visibleSize.height / 2 - 65 + 60))
		var_9_14:setPosition(ccp(visibleSize.width / 2 - 5, visibleSize.height / 2 + 145 + 60))
		var_9_0:addChild(var_9_12, 10)
		var_9_0:addChild(var_9_13, 10)
		var_9_0:addChild(var_9_14, 10)
	elseif arg_9_0 == "zhanshu3" then
		local var_9_15 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		var_9_0:addChild(var_9_15, 0)

		local var_9_16 = CCSprite:createWithSpriteFrameName("tactics_arrows_1.png")

		var_9_16:setPosition(ccp(visibleSize.width / 2 - 117, visibleSize.height / 2 + 58 + 60))

		local var_9_17 = GraySprite:createWithSpriteFrameName("tactics_arrows_2.png")

		var_9_17:setPosition(ccp(visibleSize.width / 2 + 110, visibleSize.height / 2 + 61 + 60))

		local var_9_18 = GraySprite:createWithSpriteFrameName("tactics_arrows_3.png")

		var_9_18:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 131 + 60))
		var_9_0:addChild(var_9_16, 10)
		var_9_0:addChild(var_9_17, 10)
		var_9_0:addChild(var_9_18, 10)

		local var_9_19 = GraySprite:createWithSpriteFrameName("gongji_up.png")
		local var_9_20 = CCSprite:createWithSpriteFrameName("fangshou_up.png")
		local var_9_21 = CCSprite:createWithSpriteFrameName("tuji_up.png")

		var_9_19:setPosition(ccp(visibleSize.width / 2 + 122, visibleSize.height / 2 - 65 + 60))
		var_9_20:setPosition(ccp(visibleSize.width / 2 - 122, visibleSize.height / 2 - 65 + 60))
		var_9_21:setPosition(ccp(visibleSize.width / 2 - 5, visibleSize.height / 2 + 145 + 60))
		var_9_0:addChild(var_9_19, 10)
		var_9_0:addChild(var_9_20, 10)
		var_9_0:addChild(var_9_21, 10)
	elseif arg_9_0 == "zhanshu4" then
		local var_9_22 = CCLayerColor:create(ccc4(0, 0, 0, 180), visibleSize.width, visibleSize.height)

		var_9_0:addChild(var_9_22, 0)

		local var_9_23 = GraySprite:createWithSpriteFrameName("tactics_arrows_1.png")

		var_9_23:setPosition(ccp(visibleSize.width / 2 - 117, visibleSize.height / 2 + 58 + 60))

		local var_9_24 = GraySprite:createWithSpriteFrameName("tactics_arrows_2.png")

		var_9_24:setPosition(ccp(visibleSize.width / 2 + 110, visibleSize.height / 2 + 61 + 60))

		local var_9_25 = GraySprite:createWithSpriteFrameName("tactics_arrows_3.png")

		var_9_25:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 131 + 60))
		var_9_0:addChild(var_9_23, 10)
		var_9_0:addChild(var_9_24, 10)
		var_9_0:addChild(var_9_25, 10)

		local var_9_26 = CCSprite:createWithSpriteFrameName("gongjijiacheng.png")
		local var_9_27 = GraySprite:createWithSpriteFrameName("fangshou_up.png")
		local var_9_28 = CCSprite:createWithSpriteFrameName("tujijiacheng.png")

		var_9_26:setPosition(ccp(visibleSize.width / 2 + 122, visibleSize.height / 2 - 65 + 60))
		var_9_27:setPosition(ccp(visibleSize.width / 2 - 122, visibleSize.height / 2 - 65 + 60))
		var_9_28:setPosition(ccp(visibleSize.width / 2 - 5, visibleSize.height / 2 + 145 + 60))
		var_9_0:addChild(var_9_26, 10)
		var_9_0:addChild(var_9_27, 10)
		var_9_0:addChild(var_9_28, 10)
	end
end
