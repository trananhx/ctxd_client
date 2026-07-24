local var_0_0 = class("IronMineUI", function()
	return createBaseLayer()
end)
local var_0_1 = require("lua/layer/ironMine/constant")

function var_0_0.ctor(arg_2_0)
	log.info("IronMineUI:ctor()")
	rmgr.loadResource("res/ui/ironMine/iconMine.plist")

	arg_2_0.control = require("lua/layer/ironMine/control").new(arg_2_0)
	arg_2_0.uidata = require("lua/layer/ironMine/uidata").new(arg_2_0)

	menuUI.ui.show()
	playerInfoUI.show()
	arg_2_0:preInit()
	arg_2_0.control:getMineInfo()
	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0.control:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end)
	arg_2_0:setTouchEnabled(true)
end

function var_0_0.preInit(arg_4_0)
	arg_4_0:removeAllChildrenWithCleanup(true)

	arg_4_0.uiTable = autoUI.initUI(arg_4_0, arg_4_0.uidata:getUiData())
	arg_4_0.mineSpriteTable = {}
	arg_4_0.mineInfoTable = {}
	arg_4_0.onEnter = arg_4_0.control.onEnter
	arg_4_0.onExit = arg_4_0.control.onExit
end

function var_0_0.init(arg_5_0, arg_5_1)
	multiLangOffset = {}

	if conf.language == "tha" then
		multiLangOffset.areaAtlasWidth = 150
		multiLangOffset.areaLabelY = 5
	else
		multiLangOffset.areaAtlasWidth = 220
		multiLangOffset.areaLabelY = 0
	end

	arg_5_0.board = nil
	arg_5_0.haveSmith = arg_5_1.action.data.haveSmith

	arg_5_0.uiTable.background:removeAllChildrenWithCleanup(true)

	arg_5_0.mineBatchNode = CCLayer:create()

	arg_5_0.uiTable.background:addChild(arg_5_0.mineBatchNode, 0)

	local var_5_0 = CCSprite:create("res/ui/ironMine/biaotidi.png")

	var_5_0:setPosition(ccp(693, (768 - visibleSize.height) / 2 + 45))
	arg_5_0.uiTable.background:addChild(var_5_0, 1)

	local var_5_1 = CCLabelAtlas:create(tostring(arg_5_1.action.data.currentPage), "res/ui/ironMine/sjbt_tit_numb.png", multiLangOffset.areaAtlasWidth / 5, 35, 49)

	var_5_1:setContentSize(CCSizeMake(38, 35))
	var_5_1:setAnchorPoint(ccp(0.5, 0.5))
	var_5_1:setPosition(ccp(138, 37.5 + multiLangOffset.areaLabelY))
	var_5_0:addChild(var_5_1)

	local var_5_2 = CCSprite:create("res/ui/ironMine/sjbt_tit.png")

	var_5_2:setPosition(ccp(178, 37.5))
	var_5_0:addChild(var_5_2)

	local var_5_3 = arg_5_1.action.data.mines
	local var_5_4 = 0

	for iter_5_0, iter_5_1 in pairs(var_5_3) do
		if iter_5_1.position == 0 then
			iter_5_1.position = 17
			iter_5_1.pic = 11
		end

		arg_5_0.mineInfoTable[iter_5_1.position] = iter_5_1

		local var_5_5 = string.format("sjbt_%02.f.png", iter_5_1.pic)
		local var_5_6 = CCSprite:createWithSpriteFrameName(var_5_5)

		var_5_6:setPosition(ccp(var_0_1.MINE_POS[iter_5_1.position].x, var_0_1.MINE_POS[iter_5_1.position].y))
		arg_5_0.mineBatchNode:addChild(var_5_6, 0, iter_5_1.position)

		arg_5_0.mineSpriteTable[iter_5_1.position] = var_5_6

		if iter_5_1.myself then
			local var_5_7 = CCSprite:create("res/ui/selectPlayer/vip_port_view.jpg")
			local var_5_8 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. user.player.pic .. ".png")

			var_5_8:setPosition(ccp(50, 50))
			var_5_7:addChild(var_5_8)
			var_5_7:setPosition(ccp(var_0_1.MINE_POS[iter_5_1.position].x, var_0_1.MINE_POS[iter_5_1.position].y + 20))
			var_5_7:setScale(0.5)
			arg_5_0.uiTable.background:addChild(var_5_7, 1)

			var_5_4 = iter_5_1.isNew
		end

		if iter_5_1.forceId and iter_5_1.flag == true then
			local var_5_9 = CCSprite:create("res/ui/ironMine/jgdy_sjbt_flag_" .. iter_5_1.forceId .. ".png")

			var_5_9:setPosition(ccp(var_0_1.MINE_POS[iter_5_1.position].x - 30, var_0_1.MINE_POS[iter_5_1.position].y))

			local var_5_10 = CCLabelTTF:create(user.forceIdToName[iter_5_1.forceId], "", 16)

			var_5_10:setColor(ccc3(0, 0, 0))
			var_5_10:setPosition(16, 28)
			var_5_9:addChild(var_5_10)
			arg_5_0.uiTable.background:addChild(var_5_9, 1)
		end

		if iter_5_1.ownerName or iter_5_1.myself then
			iter_5_1.ownerName = iter_5_1.ownerName or user.player.name

			local var_5_11 = CCSprite:create("res/ui/ironMine/sjbt_city_view_bg.png")
			local var_5_12 = CCStrokeLabelTTF:create(iter_5_1.ownerName, "Thonburi", 18)

			var_5_12:setColor(ccc3(235, 209, 167))
			var_5_12:setPosition(ccp(50, 14))
			var_5_11:addChild(var_5_12)
			var_5_11:setPosition(ccp(var_0_1.MINE_POS[iter_5_1.position].x, var_0_1.MINE_POS[iter_5_1.position].y - 30))
			arg_5_0.uiTable.background:addChild(var_5_11, 1)
		end
	end

	if var_5_4 == 1 then
		messageBox.confirm(language.get(380001), function()
			arg_5_0.control:rush()
		end)
	end
end

function var_0_0.showMineDetail(arg_7_0, arg_7_1)
	local var_7_0 = CCScale9Sprite:create("res/ui/ironMine/sjbt_view_bg.png")
	local var_7_1 = 161
	local var_7_2 = 87

	if arg_7_0.haveSmith then
		var_7_1 = var_7_1 + 42
		var_7_2 = var_7_2 + 42
	end

	var_7_0:setPreferredSize(CCSizeMake(233, var_7_1))
	var_7_0:setPosition(ccp(var_0_1.MINE_POS[arg_7_1.position].x, var_0_1.MINE_POS[arg_7_1.position].y))

	local var_7_3 = CCScale9Sprite:create("res/ui/ironMine/sjbt_view_up_bg.png")

	var_7_3:setPreferredSize(CCSizeMake(217, var_7_2))
	var_7_3:setPosition(ccp(116.5, var_7_1 - var_7_2 / 2 - 8))
	var_7_0:addChild(var_7_3)

	local var_7_4 = arg_7_1.ownerName

	if arg_7_1.myself then
		var_7_4 = ""

		local var_7_5 = arg_7_1.cd - mine.dt
		local var_7_6 = createTimerLabel(arg_7_1.cd, "@H:@M:@S", "Thonburi", 20, nil, nil, nil, ccc3(255, 255, 204))

		var_7_6:setPosition(ccp(108.5, var_7_2 - 20))
		var_7_3:addChild(var_7_6)
	end

	if arg_7_1.position == 17 then
		var_7_4 = language.get(380002)
	elseif arg_7_1.operation == "rob" then
		if user.player.forceId == 1 then
			var_7_4 = language.get(380003)
		elseif user.player.forceId == 2 then
			var_7_4 = language.get(380004)
		elseif user.player.forceId == 3 then
			var_7_4 = language.get(380005)
		end
	end

	var_7_4 = var_7_4 or language.get(380006)

	local var_7_7 = CCStrokeLabelTTF:create(var_7_4, "Thonburi", 20)

	var_7_7:setColor(ccc3(255, 255, 204))
	var_7_7:setPosition(ccp(108.5, var_7_2 - 20))
	var_7_3:addChild(var_7_7)

	local var_7_8 = CCSprite:create("res/ui/ironMine/sjbt_view_up_div.png")

	var_7_8:setScale(0.9)
	var_7_8:setPosition(ccp(108.5, var_7_2 - 42))
	var_7_3:addChild(var_7_8)

	local var_7_9 = CCSprite:create("res/ui/ironMine/get_icon_iron.png")

	var_7_9:setPosition(ccp(45, var_7_2 - 20 - 42))
	var_7_3:addChild(var_7_9)

	local var_7_10 = arg_7_1.output and arg_7_1.output .. language.get(380007) or ""
	local var_7_11 = arg_7_1.stone and arg_7_1.stone .. language.get(380008) or ""

	if arg_7_1.myself then
		var_7_10 = tostring(arg_7_1.currentOutPut)
		var_7_11 = tostring(arg_7_1.currentOutPutStone)
	elseif arg_7_1.id == 1 then
		var_7_10 = arg_7_1.output .. language.get(380009)
	end

	local var_7_12 = CCStrokeLabelTTF:create(var_7_10, "Thonburi", 20)

	var_7_12:setPosition(ccp(108.5, var_7_2 - 20 - 42))
	var_7_12:setColor(ccc3(255, 255, 204))
	var_7_3:addChild(var_7_12)

	if arg_7_0.haveSmith and arg_7_1.position < 17 then
		local var_7_13 = CCSprite:create("res/ui/ironMine/sjbt_view_up_div.png")

		var_7_13:setScale(0.9)
		var_7_13:setPosition(ccp(108.5, var_7_2 - 42 - 42))
		var_7_3:addChild(var_7_13)

		local var_7_14 = CCSprite:create("res/ui/ironMine/get_icon_xtys.png")

		var_7_14:setPosition(ccp(45, var_7_2 - 20 - 42 - 42))
		var_7_3:addChild(var_7_14)

		local var_7_15 = CCStrokeLabelTTF:create(var_7_11, "Thonburi", 20)

		var_7_15:setPosition(ccp(108.5, var_7_2 - 20 - 42 - 42))
		var_7_15:setColor(ccc3(255, 255, 204))
		var_7_3:addChild(var_7_15)
	end

	local var_7_16

	if arg_7_1.operation == "occupy" then
		local var_7_17 = CCSprite:createWithSpriteFrameName("btn1_gre_a.png")
		local var_7_18 = CCSprite:createWithSpriteFrameName("btn1_gre_c.png")
		local var_7_19 = CCSprite:createWithSpriteFrameName("btn1_gre_g.png")

		var_7_16 = CCMenuItemSprite:create(var_7_17, var_7_18, var_7_19)

		local var_7_20 = CCStrokeLabelTTF:create(language.get(380010), "Thonburi", 20)

		var_7_20:setPosition(ccp(48.5, 29))
		var_7_16:addChild(var_7_20)
		var_7_16:registerScriptTapHandler(function()
			arg_7_0.control:occupy(arg_7_1.id)
		end)
	elseif arg_7_1.operation == "abandon" then
		local var_7_21 = CCSprite:createWithSpriteFrameName("btn1_yel_a.png")
		local var_7_22 = CCSprite:createWithSpriteFrameName("btn1_yel_c.png")
		local var_7_23 = CCSprite:createWithSpriteFrameName("btn1_gre_g.png")

		var_7_16 = CCMenuItemSprite:create(var_7_21, var_7_22, var_7_23)

		local var_7_24 = CCStrokeLabelTTF:create(language.get(380011), "Thonburi", 20)

		var_7_24:setPosition(ccp(48.5, 29))
		var_7_16:addChild(var_7_24)
		var_7_16:registerScriptTapHandler(function()
			arg_7_0.control:abandon()
		end)
	elseif arg_7_1.operation == "rob" then
		local var_7_25 = CCSprite:createWithSpriteFrameName("btn1_gre_a.png")
		local var_7_26 = CCSprite:createWithSpriteFrameName("btn1_gre_c.png")
		local var_7_27 = CCSprite:createWithSpriteFrameName("btn1_gre_g.png")

		var_7_16 = CCMenuItemSprite:create(var_7_25, var_7_26, var_7_27)

		local var_7_28 = CCStrokeLabelTTF:create(language.get(380012), "Thonburi", 20)

		var_7_28:setPosition(ccp(48.5, 29))
		var_7_16:addChild(var_7_28)
		var_7_16:registerScriptTapHandler(function()
			arg_7_0.control:occupy(arg_7_1.id)
		end)
	elseif arg_7_1.operation == "rush" then
		local var_7_29 = CCSprite:createWithSpriteFrameName("btn1_gre_a.png")
		local var_7_30 = CCSprite:createWithSpriteFrameName("btn1_gre_c.png")
		local var_7_31 = CCSprite:createWithSpriteFrameName("btn1_gre_g.png")

		var_7_16 = CCMenuItemSprite:create(var_7_29, var_7_30, var_7_31)

		local var_7_32 = CCStrokeLabelTTF:create(language.get(380013), "Thonburi", 20)

		var_7_32:setPosition(ccp(48.5, 29))
		var_7_16:addChild(var_7_32)
		var_7_16:registerScriptTapHandler(function()
			arg_7_0.control:rush()
		end)
	elseif arg_7_1.operation == "mine" then
		local var_7_33 = CCSprite:createWithSpriteFrameName("btn1_gre_a.png")
		local var_7_34 = CCSprite:createWithSpriteFrameName("btn1_gre_c.png")
		local var_7_35 = CCSprite:createWithSpriteFrameName("btn1_gre_g.png")

		var_7_16 = CCMenuItemSprite:create(var_7_33, var_7_34, var_7_35)

		local var_7_36 = CCStrokeLabelTTF:create(language.get(380014), "Thonburi", 20)

		var_7_36:setPosition(ccp(48.5, 29))
		var_7_16:addChild(var_7_36)
		var_7_16:registerScriptTapHandler(function()
			arg_7_0.control:mine()
		end)
	end

	if arg_7_1.canDo == false then
		var_7_16:setEnabled(false)
	end

	local var_7_37 = CCMenu:createWithItem(var_7_16)

	var_7_37:setPosition(ccp(116.5, 35))
	var_7_0:addChild(var_7_37)
	arg_7_0.uiTable.background:addChild(var_7_0, 1)

	arg_7_0.board = var_7_0
end

return var_0_0
