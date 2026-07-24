selectPlayer = {}

tool.requireRes("selectPlayer")

selectPlayer.ui = {}
selectPlayer.ui.table = {}

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.lvNumX = 20
else
	var_0_0.lvNumX = 0
end

function selectPlayer.ui.createList()
	local var_1_0 = createBaseLayer()

	selectPlayer.exist_create_count = 0

	if selectPlayer.total_count < selectPlayer.max_count then
		selectPlayer.exist_create_count = 1

		local var_1_1 = 1
		local var_1_2 = CCSprite:create("res/ui/selectPlayer/choi_list_bg.png")

		var_1_2:setPosition(ccp(190, 130 * (var_1_1 - 1) + 65))

		selectPlayer.ui.table["bg_" .. var_1_1] = var_1_2

		local var_1_3 = CCSprite:create("res/ui/selectPlayer/vip_port_view.jpg")

		var_1_3:setPosition(ccp(63, 63))
		var_1_2:addChild(var_1_3)

		selectPlayer.ui.table["icon_bg_" .. var_1_1] = var_1_3

		local var_1_4 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. 0 .. ".png")

		var_1_4:setPosition(ccp(63, 63))
		var_1_2:addChild(var_1_4)

		selectPlayer.ui.table["icon_" .. var_1_1] = var_1_4

		local var_1_5 = CCSprite:create("res/ui/selectPlayer/choi_list_crea.png")

		var_1_5:setPosition(ccp(230, 63))
		var_1_2:addChild(var_1_5)

		selectPlayer.ui.table.create_icon = var_1_5

		var_1_0:addChild(var_1_2)
	end

	for iter_1_0 = 1 + selectPlayer.exist_create_count, selectPlayer.total_count + selectPlayer.exist_create_count do
		local var_1_6 = selectPlayer.control.data[iter_1_0 - selectPlayer.exist_create_count]
		local var_1_7 = CCSprite:create("res/ui/selectPlayer/choi_list_bg.png")

		var_1_7:setPosition(ccp(190, 130 * (iter_1_0 - 1) + 65))

		selectPlayer.ui.table["bg_" .. iter_1_0] = var_1_7

		local var_1_8 = CCSprite:create("res/ui/selectPlayer/vip_port_view.jpg")

		var_1_8:setPosition(ccp(63, 63))
		var_1_7:addChild(var_1_8, 8)

		selectPlayer.ui.table["icon_bg_" .. iter_1_0] = var_1_8

		local var_1_9 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_" .. var_1_6.pic .. ".png")

		var_1_9:setPosition(ccp(63, 63))
		var_1_7:addChild(var_1_9, 9)

		selectPlayer.ui.table["icon_" .. iter_1_0] = var_1_9

		local var_1_10 = CCLabelTTF:create(var_1_6.playerName, "", 20)

		var_1_10:setPosition(240, 90)
		var_1_10:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_10:setDimensions(CCSizeMake(200, 30))
		var_1_10:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_7:addChild(var_1_10)

		selectPlayer.ui.table["name_" .. iter_1_0] = var_1_10

		local var_1_11 = CCLabelTTF:create(language.get(212004), "", 20)

		var_1_11:setPosition(240, 60)
		var_1_11:setVerticalAlignment(kCCVerticalTextAlignmentBottom)
		var_1_11:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_11:setDimensions(CCSizeMake(200, 30))
		var_1_11:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_7:addChild(var_1_11)

		selectPlayer.ui.table["level_" .. iter_1_0] = var_1_11

		local var_1_12 = CCLabelTTF:create(var_1_6.playerLv, "", 20)

		var_1_12:setPosition(300 + var_0_0.lvNumX, 60)
		var_1_12:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_12:setDimensions(CCSizeMake(200, 30))
		var_1_12:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_7:addChild(var_1_12)

		selectPlayer.ui.table["levelValue_" .. iter_1_0] = var_1_12

		local var_1_13 = CCLabelTTF:create(language.get(212005), "Thonburi", 20)

		if conf.language == "kr" or conf.language == "vie" or conf.language == "tha" then
			var_1_13:setPosition(222, 30)
		else
			var_1_13:setPosition(240, 30)
		end

		var_1_13:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_13:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_13:setDimensions(CCSizeMake(200, 30))
		var_1_7:addChild(var_1_13)

		selectPlayer.ui.table["time_" .. iter_1_0] = var_1_13

		local var_1_14

		if conf.language == "vie" then
			var_1_14 = CCLabelTTF:create(os.date("%H:%M %d/%m", math.floor(var_1_6.lastLoginTime / 1000)), "Thonburi", 20)
		elseif conf.language == "tha" then
			var_1_14 = CCLabelTTF:create(os.date("%m-%d %H:%M", math.floor(var_1_6.lastLoginTime / 1000)), "Thonburi", 18)
		else
			var_1_14 = CCLabelTTF:create(os.date("%m-%d %H:%M", math.floor(var_1_6.lastLoginTime / 1000)), "Thonburi", 20)
		end

		if conf.language == "kr" then
			var_1_14:setPosition(350, 30)
		elseif conf.language == "tha" then
			var_1_14:setPosition(370, 30)
		else
			var_1_14:setPosition(340, 30)
		end

		var_1_14:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_1_14:setDimensions(CCSizeMake(200, 30))
		var_1_14:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_7:addChild(var_1_14)

		selectPlayer.ui.table["timeValue_" .. iter_1_0] = var_1_14

		local var_1_15 = CCSprite:createWithSpriteFrameName("guojia_di.png")

		var_1_15:setPosition(ccp(20, 105))
		var_1_7:addChild(var_1_15, 100)

		local var_1_16 = CCLabelTTF:create(user.forceIdToName[var_1_6.forceId], "", 25)

		var_1_16:setColor(colorForce[var_1_6.forceId])
		var_1_16:setPosition(ccp(20, 105))
		var_1_7:addChild(var_1_16, 100)

		local var_1_17 = CCSprite:create("res/ui/selectPlayer/choi_list_up.png")

		var_1_17:setPosition(ccp(190, 65))

		selectPlayer.ui.table["bgUp_" .. iter_1_0] = var_1_17

		var_1_7:addChild(var_1_17)

		local var_1_18 = CCLabelTTF:create(language.get(212006), "", 25)

		var_1_18:setPosition(ccp(172, 65))
		var_1_17:addChild(var_1_18)

		local var_1_19 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
		local var_1_20 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
		local var_1_21 = CCMenuItemSprite:create(var_1_19, var_1_20)

		var_1_21:setPosition(ccp(300, 65))

		selectPlayer.ui.table["btn_revert_" .. iter_1_0] = var_1_21

		selectPlayer.ui.table["btn_revert_" .. iter_1_0]:registerScriptTapHandler(selectPlayer.control.clicked_revertPlayer)

		local var_1_22 = CCLabelTTF:create(language.get(212007), "", 25)

		var_1_22:setPosition(ccp(300, 65))

		local var_1_23 = CCMenu:create()

		var_1_23:setPosition(ccp(0, 0))
		var_1_23:addChild(var_1_21, 2, iter_1_0 - selectPlayer.exist_create_count)
		var_1_17:addChild(var_1_23)
		var_1_17:addChild(var_1_22)

		if var_1_6.isDelete == true then
			var_1_17:setVisible(true)
		elseif var_1_6.isDelete == false then
			var_1_17:setVisible(false)
		end

		var_1_0:addChild(var_1_7)
	end

	selectPlayer.select_index = selectPlayer.total_count + selectPlayer.exist_create_count

	local var_1_24 = CCSprite:createWithSpriteFrameName("choi_close_a.png")
	local var_1_25 = CCSprite:createWithSpriteFrameName("choi_close_click.png")
	local var_1_26 = CCMenuItemSprite:create(var_1_24, var_1_25)

	var_1_26:setPosition(ccp(350, 90))

	selectPlayer.ui.table.btn_close = var_1_26

	selectPlayer.ui.table.btn_close:registerScriptTapHandler(selectPlayer.control.clicked_deletePlayer)

	local var_1_27 = CCMenu:create()

	var_1_27:setPosition(ccp(0, 130 * (selectPlayer.select_index - 1)))
	var_1_27:addChild(var_1_26)

	selectPlayer.ui.table.menu = var_1_27

	var_1_0:addChild(var_1_27, 10000)

	if selectPlayer.control.data[selectPlayer.total_count].isDelete == true then
		selectPlayer.ui.table.menu:setVisible(false)
	else
		selectPlayer.ui.table.menu:setVisible(true)
	end

	local var_1_28 = CCScrollView:create(CCSizeMake(380, visibleSize.height - 320))

	var_1_28:setContainer(var_1_0)
	var_1_28:setPosition(visibleSize.width / 2 - 190, 170)
	var_1_28:setContentSize(CCSizeMake(380, 130 * selectPlayer.select_index))
	var_1_28:setDirection(kCCScrollViewDirectionVertical)
	var_1_28:setContentOffset(ccp(0, -130 * selectPlayer.select_index + (visibleSize.height - 320)))

	selectPlayer.ui.table.scrollView = var_1_28

	selectPlayer.ui.table.layer:addChild(var_1_28, 1000)
	selectPlayer.ui.table.layer:setVisible(true)

	local var_1_29 = CCSprite:create("res/ui/selectPlayer/choi_list_on.png")

	selectPlayer.ui.table["bg_" .. selectPlayer.select_index]:setDisplayFrame(var_1_29:displayFrame())
end

function selectPlayer.ui.init()
	selectPlayer.control.getPlayerRoleList()
end

function selectPlayer.ui.show()
	statMgr.update(statMgr.state.selectPlayer)

	local var_3_0 = createBaseLayer()

	var_3_0:registerScriptTouchHandler(selectPlayer.control.onTouch)
	var_3_0:setTouchEnabled(true)
	rmgr.loadTable(selectPlayer.constant.plist)

	selectPlayer.ui.table = autoUI.initUI(var_3_0, getSelectPlayerUiData())

	selectPlayer.ui.table.start:registerScriptTapHandler(selectPlayer.control.clicked_start)

	selectPlayer.ui.table.layer = var_3_0

	selectPlayer.ui.init()
	var_3_0:setVisible(false)

	return var_3_0
end
