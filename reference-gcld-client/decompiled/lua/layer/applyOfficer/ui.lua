applyOfficer = {}

tool.requireRes("applyOfficer")

applyOfficer.ui = {}

function applyOfficer.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		-- block empty
	elseif arg_1_0 == CCTOUCHENDED then
		local var_1_0 = arg_1_1 - visibleSize.width / 2
		local var_1_1 = arg_1_2 - visibleSize.height / 2

		if var_1_0 > -260 and var_1_0 < 260 and var_1_1 > -177 and var_1_1 < 177 then
			-- block empty
		else
			smgr.getLayer("topLayer"):removeChild(applyOfficer.ui.table.layer, true)
		end
	end

	return true
end

function applyOfficer.ui.updateList(arg_2_0)
	if applyOfficer.ui.table.scrollView ~= nil then
		applyOfficer.ui.table.bg:removeChild(applyOfficer.ui.table.scrollView, true)
	end

	if #arg_2_0 == 0 then
		applyOfficer.ui.table.layer:setVisible(true)
		menuUI.ui.table.officierMark:setVisible(false)
		menuUI.ui.table.officerMarkSprite:setVisible(false)

		return
	end

	local var_2_0 = createBaseLayer()
	local var_2_1 = true

	for iter_2_0 = 1, #arg_2_0 do
		local var_2_2 = arg_2_0[iter_2_0]
		local var_2_3

		if var_2_1 == true then
			var_2_3 = CCSprite:createWithSpriteFrameName("offic_apply_list_view_bg1.png")
		else
			var_2_3 = CCSprite:createWithSpriteFrameName("offic_apply_list_view_bg2.png")
		end

		var_2_1 = not var_2_1

		var_2_3:setPosition(ccp(230, 64 * (#arg_2_0 - iter_2_0) + 40))
		var_2_0:addChild(var_2_3)

		temp = CCLabelTTF:create(tostring(var_2_2.playerName), "Thonburi", "20")

		temp:setAnchorPoint(ccp(0, 0.5))
		temp:setPosition(ccp(30, 32))
		var_2_3:addChild(temp)

		temp = CCLabelTTF:create("Lv. " .. var_2_2.playerLv, "Thonburi", "20")

		temp:setAnchorPoint(ccp(0, 0.5))
		temp:setPosition(ccp(140, 32))
		var_2_3:addChild(temp)

		local var_2_4 = CCSprite:createWithSpriteFrameName("btn1_gre_a.png")
		local var_2_5 = CCSprite:createWithSpriteFrameName("btn1_gre_c.png")
		local var_2_6 = CCSprite:createWithSpriteFrameName("btn1_yel_a.png")
		local var_2_7 = CCSprite:createWithSpriteFrameName("btn1_yel_c.png")
		local var_2_8 = CCMenuItemSprite:create(var_2_4, var_2_5)
		local var_2_9 = CCMenuItemSprite:create(var_2_6, var_2_7)

		var_2_8:registerScriptTapHandler(applyOfficer.control.click_yes)
		var_2_9:registerScriptTapHandler(applyOfficer.control.click_no)
		var_2_8:setPosition(ccp(280, 30))
		var_2_9:setPosition(ccp(380, 30))

		local var_2_10 = CCMenu:create()

		var_2_10:setPosition(ccp(0, 0))
		var_2_10:addChild(var_2_8, 1, iter_2_0)
		var_2_10:addChild(var_2_9, 1, iter_2_0)
		var_2_3:addChild(var_2_10)

		temp = CCStrokeLabelTTF:create(language.get(240001), "Thonburi", 20, 2, colorText[10005])

		temp:setColor(colorText[10004])
		temp:setPosition(ccp(280, 30))
		var_2_3:addChild(temp)

		temp = CCStrokeLabelTTF:create(language.get(240002), "Thonburi", 20, 2, colorText[10005])

		temp:setPosition(ccp(380, 30))
		temp:setColor(colorText[10004])
		var_2_3:addChild(temp)
	end

	local var_2_11 = CCScrollView:create(CCSizeMake(452, 150))

	var_2_11:setContainer(var_2_0)
	var_2_11:setPosition(33, 76)
	var_2_11:setContentSize(CCSizeMake(452, 64 * #arg_2_0))
	var_2_11:setDirection(kCCScrollViewDirectionVertical)
	var_2_11:setContentOffset(ccp(0, -64 * #arg_2_0 + 150))

	applyOfficer.ui.table.scrollView = var_2_11

	applyOfficer.ui.table.bg:addChild(var_2_11, 1000)
	applyOfficer.ui.table.layer:setVisible(true)
end

function applyOfficer.ui.init()
	applyOfficer.ui.table.btn_gou:registerScriptTapHandler(applyOfficer.control.clicked_auto)
	applyOfficer.ui.table.gou_yes:setVisible(false)
end

function applyOfficer.ui.show()
	local var_4_0 = createBaseLayer()

	rmgr.loadResource("res/ui/applyOfficer/applyOfficer.plist")

	applyOfficer.ui.table = autoUI.initUI(var_4_0, getApplyOfficerData())
	applyOfficer.ui.table.layer = var_4_0

	var_4_0:registerScriptTouchHandler(applyOfficer.ui.onTouch, false, true)
	var_4_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_4_0, 10000)
	applyOfficer.ui.init()
	applyOfficer.control.request_applyList()
	var_4_0:setVisible(false)
end
