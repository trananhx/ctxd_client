tool.requireRes("menu")
require("lua/common/eventManager")
require("lua/layer/general/ui")
require("lua/layer/resource/ui")
require("lua/layer/nation/ui")
require("lua/layer/rankInfo/ui")
require("lua/layer/technology/ui")
require("lua/layer/equipment/ui")
require("lua/layer/applyOfficer/ui")
require("lua/layer/juben/jubenLevelSelect/ui")
require("lua/layer/juben/jubenSelect/ui")
require("lua/component/timerLabel")

menuUI = {}
menuUI.exist = false
menuUI.ui = {}
menuUI.ui.table = {}
menuUI.ui.isOpen = false
menuUI.ui.isShowBubble = true
menuUI.ui.isDisplayingTechBubble = false
menuUI.constant = {}
menuUI.constant.rightIconX = visibleSize.width - 60
menuUI.constant.rightIconY = 46
menuUI.constant.rightIconSpan = 90
menuUI.constant.rightButtonX = visibleSize.width - 60
menuUI.constant.rightButtonY = 20
menuUI.constant.rightButtonSpan = 65
menuUI.constant.iconCount = 6
menuUI.constant.jubenIndex = 2

function menuUI.ui.clickedMainCity()
	if smgr.currentSceneTag ~= SCENE_MAIN_CITY then
		if user.curMainTask.taskId == 2 then
			messageBox.alert(language.get(190080), language.get("220650_xinshou"))

			return
		end

		smgr.changeScene(SCENE_MAIN_CITY)

		if guide.constant.area[1] == true then
			guide.constant.area[1] = false

			guide.ui.setVisible(false)
		end
	end
end

function menuUI.ui.clickedPaihang()
	if user.getFunc(14) == false then
		messageBox.error("该功能未开发")

		return
	end

	rankInfoUI.show()
end

function menuUI.ui.clickedGuojia()
	if user.isOpenCountry == true then
		nationUI.show()
	end
end

function menuUI.ui.clickedKeiji()
	if user.getFunc(19) == false then
		messageBox.error("该功能未开发")

		return
	end

	technologyUI.show()
end

function menuUI.ui.clickedZhuangbei()
	if user.player.playerLv > 125 then
		equipmentUI.show(2)
	else
		equipmentUI.show()
	end
end

function menuUI.ui.clickedWujiang()
	showGeneralPanel()
end

function menuUI.ui.clickedZiyuan()
	resourceUI.show()
end

function menuUI.ui.clickedBinqi()
	require("lua/layer/weaponTab/ui")
	weaponTab.ui.show()
end

function menuUI.ui.clickedShijie()
	if user.kfyzState == 1 and user.invastType == 2 and user.startTime < 180000 then
		notice.control.enterKfyz()
	elseif user.kfmgState == 3 and (kfworld and kfworld.mgOver ~= -1 or not kfworld) then
		log.info("@@ 进入跨服灭国")
		require("lua/manager/kfConnectManager")

		local function var_9_0(arg_10_0)
			kfcmgr.loginkfmg(arg_10_0.action.data)
		end

		cmgr.sendRequest(var_9_0, actions.kfmgSignUp)
	else
		if guide.constant.area[3] == true then
			guide.constant.area[3] = false

			guide.ui.setVisible(false)
		end

		loadingLayer.show(SCENE_WORLD)
	end
end

function menuUI.ui.clickedJuben()
	if user.inJuBen then
		smgr.changeScene(SCENE_JUBEN, user.soId, 0, 0)
	else
		jubenSelect.ui.show()
	end
end

function menuUI.ui.clickedFuben()
	if smgr.currentSceneTag ~= SCENE_INSTANCE then
		if guide.constant.area[2] == true then
			guide.constant.area[2] = false

			guide.ui.setVisible(false)
		end

		local function var_12_0(arg_13_0, arg_13_1)
			local function var_13_0(arg_14_0)
				if arg_14_0.action.data.battleId then
					smgr.changeScene(SCENE_BATTLE, arg_13_1, {
						battleId = arg_14_0.action.data.battleId
					})
				end
			end

			cmgr.sendRequest(var_13_0, actions.battlePermit, 0, 0, arg_13_0, arg_13_1)
		end

		if user.player.inPveBattle then
			var_12_0(0, battleType.BATTLE_ARMY)
		else
			smgr.changeScene(SCENE_INSTANCE)
		end
	end
end

function menuUI.ui.clickedMainItem(arg_15_0, arg_15_1, arg_15_2)
	if user.settings.isCharacterLayerDisplayed == true then
		return
	end

	if menuUI.ui.table.mainMenuItem:isTouchEnabled() == true then
		if guide.constant.isPopuiContainGuide() == true and menuUI.ui.isOpen == true then
			return
		end

		if menuUI.ui.isOpen and menuUI.ui.table.chatView then
			menuUI.ui.table.chatView:setVisible(menuUI.ui.isOpen)
		end

		menuUI.ui.table.mainMenuItem:setTouchEnabled(false)

		menuUI.ui.isOpen = not menuUI.ui.isOpen

		menuUI.ui.updateCountryLabel()
		menuUI.ui.acitonRotateCross()
		menuUI.ui.actionMoveIcons(arg_15_2)

		if menuUI.ui.isShowBubble == true and user.displayTech == 1 and menuUI.ui.isOpen == true then
			menuUI.ui.isShowBubble = false

			menuUI.ui.showTechBubble3Second()
		end

		eventManager.dispatchEvent("CrossMenuClicked", menuUI.ui.isOpen)
	end
end

function menuUI.ui.updateCountryLabel()
	local function var_16_0()
		if menuUI.ui.table.countryCD ~= nil then
			menuUI.ui.table.layer:removeChild(menuUI.ui.table.countryCD, true)

			menuUI.ui.table.countryCD = nil
		end
	end

	local function var_16_1()
		var_16_0()

		if user.player.playerLv > 29 then
			menuUI.ui.table["func_" .. 3] = true

			menuUI.ui.table["icon_" .. 3]:setEnabled(true)
		end
	end

	if menuUI.ui.isOpen == true then
		if user.isOpenCountry == false then
			local function var_16_2()
				local var_19_0

				if user.is2th > 3600000 then
					var_19_0 = createTimerLabel(user.is2th, "@H:@M:@S", "Thonburi-Bold", 22, var_16_1, nil, nil, ccc3(255, 255, 0))
				else
					var_19_0 = createTimerLabel(user.is2th, "@M:@S", "Thonburi-Bold", 22, var_16_1, nil, nil, ccc3(255, 255, 0))
				end

				local var_19_1 = menuUI.constant.rightIconX + 0 * menuUI.constant.rightIconSpan - 445
				local var_19_2 = menuUI.constant.rightIconY

				var_19_0:setPosition(ccp(var_19_1, var_19_2))
				menuUI.ui.table.layer:addChild(var_19_0, 10001)

				menuUI.ui.table.countryCD = var_19_0
			end

			local var_16_3 = CCDelayTime:create(0.2)
			local var_16_4 = CCCallFuncN:create(var_16_2)
			local var_16_5 = CCArray:create()

			var_16_5:addObject(var_16_3)
			var_16_5:addObject(var_16_4)

			local var_16_6 = CCSequence:create(var_16_5)

			menuUI.ui.table.layer:runAction(var_16_6)
		end
	else
		var_16_0()
	end
end

function menuUI.ui.showTechBubble3Second()
	local function var_20_0()
		guide.ui.setVisible(false)

		menuUI.ui.isDisplayingTechBubble = false
	end

	local var_20_1 = menuUI.constant.rightIconX + 2 * menuUI.constant.rightIconSpan - 450
	local var_20_2 = menuUI.constant.rightIconY + 75

	guide.control.loadGuide2(7, var_20_1, var_20_2, true, language.get(400000))

	local var_20_3 = CCDelayTime:create(3)
	local var_20_4 = CCCallFuncN:create(var_20_0)
	local var_20_5 = CCArray:create()

	var_20_5:addObject(var_20_3)
	var_20_5:addObject(var_20_4)

	local var_20_6 = CCSequence:create(var_20_5)

	menuUI.ui.table.layer:runAction(var_20_6)

	if menuUI.ui.table.tech_bg_flash ~= nil then
		menuUI.ui.table.tech_bg_flash:setVisible(false)
	end

	menuUI.ui.isDisplayingTechBubble = true
end

function menuUI.ui.click_officeMark()
	applyOfficer.ui.show()
end

function menuUI.ui.newFunc_Effect(arg_23_0)
	local var_23_0 = CCArray:create()

	for iter_23_0 = 2, 19 do
		local var_23_1 = CCSprite:create("res/ui/mainUI/effect/" .. string.format("1%04d.png", iter_23_0))

		var_23_0:addObject(var_23_1:displayFrame())
	end

	if menuUI.ui.isOpen == false then
		menuUI.ui.clickedMainItem()
	end

	local var_23_2 = CCAnimation:createWithSpriteFrames(var_23_0, 0.05)
	local var_23_3 = CCAnimate:create(var_23_2)
	local var_23_4 = {
		"res/ui/mainUI/navi_l_zy_click.png",
		"res/ui/mainUI/navi_l_wj_click.png",
		"res/ui/mainUI/navi_l_gj_click.png",
		"res/ui/mainUI/navi_l_zb_click.png",
		"res/ui/mainUI/navi_l_kj_click.png",
		"res/ui/mainUI/navi_l_ph_click.png",
		"res/ui/mainUI/navi_l_bq_click.png"
	}
	local var_23_5 = CCSprite:create(var_23_4[arg_23_0])

	var_23_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local function var_23_6()
		menuUI.ui.table.layer:removeChild(var_23_5, true)
		menuUI.ui.table["icon_" .. arg_23_0]:setEnabled(true)

		if arg_23_0 == 1 or arg_23_0 == 4 or arg_23_0 == 5 or arg_23_0 == 6 then
			taskUI.showTaskGuide()
		end
	end

	local var_23_7 = menuUI.constant.rightIconX + (arg_23_0 - 3) * menuUI.constant.rightIconSpan - 445
	local var_23_8 = menuUI.constant.rightIconY + 40
	local var_23_9 = CCDelayTime:create(0.3)
	local var_23_10 = CCMoveTo:create(0.5, ccp(var_23_7, var_23_8))
	local var_23_11 = CCCallFuncN:create(var_23_6)
	local var_23_12 = CCArray:create()

	var_23_12:addObject(var_23_9)
	var_23_12:addObject(var_23_10)
	var_23_12:addObject(var_23_3)
	var_23_12:addObject(var_23_11)

	local var_23_13 = CCSequence:create(var_23_12)

	var_23_5:runAction(var_23_13)
	menuUI.ui.table.layer:addChild(var_23_5, 10000)
end

function menuUI.ui.updateFunc()
	if menuUI.exist == true then
		-- block empty
	end

	menuUI.ui.showChatIcon(true)
end

function menuUI.ui.showChatIcon(arg_26_0)
	if arg_26_0 and user.getFunc(15) and menuUI.ui.table.chat_pane then
		menuUI.ui.table.chat_pane:setVisible(true)
	else
		menuUI.ui.table.chat_pane:setVisible(false)
	end
end

function menuUI.ui.actionMoveFooterEnd()
	if smgr.nextSceneTag == SCENE_INSTANCE then
		for iter_27_0 = 1, menuUI.constant.iconCount do
			menuUI.ui.table["icon_" .. iter_27_0]:setVisible(menuUI.ui.isOpen)
		end
	else
		for iter_27_1 = 3, menuUI.constant.iconCount do
			menuUI.ui.table["icon_" .. iter_27_1]:setVisible(menuUI.ui.isOpen)
		end
	end

	menuUI.ui.table.mainMenuItem:setTouchEnabled(true)
end

function menuUI.ui.actionMoveFooter(arg_28_0, arg_28_1)
	menuUI.ui.table.mainFooterFrameSprite:stopAllActions()

	local var_28_0 = CCMoveTo:create(0.2, ccp(menuUI.constant.rightIconX + 380 - arg_28_0 * menuUI.constant.rightIconSpan, 25))
	local var_28_1 = CCCallFuncN:create(menuUI.ui.actionMoveFooterEnd)
	local var_28_2 = CCArray:create()

	var_28_2:addObject(var_28_0)
	var_28_2:addObject(var_28_1)

	if arg_28_1 then
		log.info("callback", arg_28_1)
		var_28_2:addObject(CCCallFuncN:create(arg_28_1))
	end

	local var_28_3 = CCSequence:create(var_28_2)

	menuUI.ui.table.mainFooterFrameSprite:runAction(var_28_3)
end

function menuUI.ui.actionMoveIcon(arg_29_0)
	local var_29_0 = {
		2,
		1,
		0,
		-1,
		-2,
		-3,
		-4
	}
	local var_29_1 = {
		7,
		6,
		5,
		4,
		3,
		2,
		1
	}
	local var_29_2 = var_29_0[arg_29_0]

	if menuUI.ui.isOpen == true then
		var_29_2 = var_29_1[arg_29_0]
	end

	if smgr.nextSceneTag == SCENE_INSTANCE and menuUI.ui.isOpen == false then
		var_29_2 = ({
			0,
			-1,
			-2,
			-3,
			-4,
			-5,
			-6
		})[arg_29_0]
	end

	local var_29_3 = CCMoveTo:create(0.2, ccp(menuUI.constant.rightIconX - var_29_2 * menuUI.constant.rightIconSpan, menuUI.constant.rightIconY))

	menuUI.ui.table["icon_" .. arg_29_0]:runAction(var_29_3)
end

function menuUI.ui.actionMoveIcons(arg_30_0)
	for iter_30_0 = 1, menuUI.constant.iconCount do
		menuUI.ui.table["icon_" .. iter_30_0]:setVisible(true)
		menuUI.ui.actionMoveIcon(iter_30_0)
	end

	local var_30_0 = menuUI.constant.iconCount

	if menuUI.ui.isOpen == false then
		var_30_0 = smgr.nextSceneTag == SCENE_INSTANCE and 0 or 2
	end

	menuUI.ui.actionMoveFooter(var_30_0, arg_30_0)
end

function menuUI.ui.acitonRotateCross()
	local var_31_0 = 0

	if menuUI.ui.isOpen == true then
		var_31_0 = 45

		local var_31_1 = channelMgr.getCurrentChannel()

		if var_31_1 == channels.iosmouding or var_31_1 == channels.andmouding then
			var_31_0 = 180
		end

		menuUI.ui.showChatIcon(false)

		if smgr.nextSceneTag == SCENE_RES_HUANGCHENG then
			if user.getFunc(9) == true then
				menuUI.ui.table.fubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 1))
				menuUI.ui.table.fubenItem:setVisible(true)
			end

			if user.getFunc(10) == true then
				menuUI.ui.table.shijieItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 2))
				menuControl.setVisible("shijie", true)
			end

			if user.getFunc(62) == true then
				menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * menuUI.constant.jubenIndex))
				menuUI.ui.table.jubenItem:setVisible(true)
			end
		elseif user.getFunc(62) == true then
			menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * menuUI.constant.jubenIndex))
			menuUI.ui.table.jubenItem:setVisible(true)
		end
	else
		if smgr.nextSceneTag == SCENE_RES_HUANGCHENG then
			menuUI.ui.table.fubenItem:setVisible(false)
			menuUI.ui.table.shijieItem:setVisible(false)
			menuUI.ui.table.jubenItem:setVisible(false)
		end

		menuUI.ui.showChatIcon(true)
		menuUI.ui.table.jubenItem:setVisible(false)
	end

	local var_31_2 = CCRotateTo:create(0.2, var_31_0)

	menuUI.ui.table.mainMenuItem:stopAllActions()
	menuUI.ui.table.mainMenuItem:runAction(var_31_2)

	if smgr.nextSceneTag == SCENE_INSTANCE then
		if menuUI.ui.isOpen == true then
			eventManager.dispatchEvent("fbTitleSetVisibleFalse")
		else
			eventManager.dispatchEvent("fbTitleSetVisibleTrue")
		end
	end
end

function menuUI.ui.rightMenuSetVisible(arg_32_0)
	log.info("rightMenuSetVisible : ", arg_32_0)
	menuUI.ui.table.layer:setVisible(arg_32_0)

	if menuUI.ui.isOpen == true then
		menuUI.ui.clickedMainItem()
	end
end

function menuUI.ui.createMenuLayer()
	local var_33_0 = createBaseLayer()

	smgr.registerLayer(var_33_0, "menuLayer")
	var_33_0:setTouchEnabled(true)

	menuUI.ui.table = autoUI.initUI(var_33_0, getMenuData())

	local var_33_1 = require("lua/layer/chat/chatWindow")

	var_33_1:showFastChatPanel(var_33_0)

	menuUI.ui.table.chat_pane = var_33_1.widgets.panel

	menuUI.ui.showChatIcon(true)
	menuUI.ui.table.mainMenuItem:registerScriptTapHandler(menuUI.ui.clickedMainItem)
	menuUI.ui.table.mainCityItem:registerScriptTapHandler(menuUI.ui.clickedMainCity)
	menuUI.ui.table.fubenItem:registerScriptTapHandler(menuUI.ui.clickedFuben)
	menuUI.ui.table.shijieItem:registerScriptTapHandler(menuUI.ui.clickedShijie)
	menuUI.ui.table.jubenItem:registerScriptTapHandler(menuUI.ui.clickedJuben)
	menuUI.ui.table.wujiangItem:registerScriptTapHandler(menuUI.ui.clickedWujiang)
	menuUI.ui.table.ziyuanItem:registerScriptTapHandler(menuUI.ui.clickedZiyuan)
	menuUI.ui.table.guojiaItem:registerScriptTapHandler(menuUI.ui.clickedGuojia)
	menuUI.ui.table.zhuangbeiItem:registerScriptTapHandler(menuUI.ui.clickedZhuangbei)
	menuUI.ui.table.kejiItem:registerScriptTapHandler(menuUI.ui.clickedKeiji)
	menuUI.ui.table.paihangItem:registerScriptTapHandler(menuUI.ui.clickedPaihang)
	menuUI.ui.table.bingqi:registerScriptTapHandler(menuUI.ui.clickedBinqi)
	require("lua/guide/control")

	guide.uiElementsTable[1004] = menuUI.ui.table.zhuangbeiItem
	guide.uiElementsTable[1005] = menuUI.ui.table.wujiangItem
	guide.uiElementsTable[1011] = menuUI.ui.table.kejiItem
	guide.uiElementsTable[1017] = menuUI.ui.table.paihangItem
	guide.uiElementsTable[1018] = menuUI.ui.table.ziyuanItem
	guide.uiElementsTable[1021] = menuUI.ui.table.bingqi
	guide.uiElementsTable[1] = menuUI.ui.table.shijieItem
	guide.uiElementsTable[2] = menuUI.ui.table.mainCityItem
	guide.uiElementsTable[3] = menuUI.ui.table.fubenItem
	guide.uiElementsTable[4] = menuUI.ui.table.jubenItem

	local var_33_2 = {
		menuUI.ui.table.ziyuanItem,
		menuUI.ui.table.wujiangItem,
		menuUI.ui.table.guojiaItem,
		menuUI.ui.table.zhuangbeiItem,
		menuUI.ui.table.kejiItem,
		menuUI.ui.table.paihangItem,
		menuUI.ui.table.bingqi
	}

	menuUI.constant.iconCount = #var_33_2

	function var_33_0.onEnter()
		menuUI.exist = true

		eventManager.registerEvent("rightMenuSetVisible", menuUI.ui.rightMenuSetVisible)
		menuControl.addGuide()

		if user.player.showFirstPayReward == true then
			user.player.showFirstPayReward = false

			require("lua/layer/firstPayActivity/ui")
			firstPayActivity.ui.show()
		end
	end

	function var_33_0.onExit()
		menuUI.exist = false

		eventManager.unregisterEvent("rightMenuSetVisible", menuUI.ui.rightMenuSetVisible)
		menuControl.delGuide()

		if menuUI.ui.isDisplayingTechBubble == true then
			menuUI.ui.isDisplayingTechBubble = false

			guide.ui.setVisible(false)
		end
	end

	menuControl.setVisible("zhucheng", user.getFunc(4))
	menuControl.setVisible("fuben", user.getFunc(9))
	menuControl.setVisible("shijie", user.getFunc(10))
	menuControl.setVisible("juben", user.getFunc(62))

	if smgr.nextSceneTag == SCENE_INSTANCE then
		menuUI.ui.table.mainCityItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY))
		menuUI.ui.table.shijieItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan))
		menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 2))

		menuUI.constant.jubenIndex = 2

		menuUI.ui.table.fubenItem:setVisible(false)
	elseif smgr.nextSceneTag == SCENE_WORLD then
		menuUI.ui.table.mainCityItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY))
		menuUI.ui.table.fubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan))
		menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 2))

		menuUI.constant.jubenIndex = 2

		menuUI.ui.table.shijieItem:setVisible(false)
	elseif smgr.nextSceneTag == SCENE_MAIN_CITY then
		menuUI.ui.table.fubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY))
		menuUI.ui.table.shijieItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan))
		menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 2))

		menuUI.constant.jubenIndex = 2

		menuUI.ui.table.mainCityItem:setVisible(false)
	elseif smgr.nextSceneTag == SCENE_RES_HUANGCHENG then
		menuUI.ui.table.mainCityItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY))
		menuUI.ui.table.fubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan))
		menuUI.ui.table.shijieItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 2))
		menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 3))
		menuUI.ui.table.fubenItem:setVisible(false)
		menuUI.ui.table.shijieItem:setVisible(false)
	else
		menuUI.ui.table.mainCityItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY))
		menuUI.ui.table.fubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan))
		menuUI.ui.table.shijieItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 2))
		menuUI.ui.table.jubenItem:setPosition(ccp(menuUI.constant.rightButtonX, menuUI.constant.rightButtonY + menuUI.constant.rightButtonSpan * 3))

		menuUI.constant.jubenIndex = 3
	end

	menuUI.ui.table.jubenItem:setVisible(false)

	if smgr.nextSceneTag == SCENE_MAIN_CITY then
		menuUI.ui.table.mainCityItem:setVisible(false)
	else
		menuUI.ui.table.mainCityItem:setVisible(true)
	end

	local var_33_3 = {
		16,
		2,
		58,
		18,
		19,
		14,
		29
	}
	local var_33_4 = menuUI.constant.iconCount - 2

	if smgr.nextSceneTag == SCENE_INSTANCE then
		var_33_4 = menuUI.constant.iconCount
	end

	for iter_33_0 = 1, menuUI.constant.iconCount do
		menuUI.ui.table["func_" .. iter_33_0] = (function()
			if iter_33_0 == 3 then
				return user.player.playerLv > 29
			else
				return user.getFunc(var_33_3[iter_33_0])
			end
		end)()
		menuUI.ui.table["icon_" .. iter_33_0] = var_33_2[iter_33_0]

		menuUI.ui.table["icon_" .. iter_33_0]:setPosition(ccp(menuUI.constant.rightIconX - (3 - iter_33_0) * menuUI.constant.rightIconSpan, menuUI.constant.rightIconY))
		menuUI.ui.table["icon_" .. iter_33_0]:setEnabled(menuUI.ui.table["func_" .. iter_33_0])
	end

	if user.isOpenCountry == false then
		menuUI.ui.table["func_" .. 3] = false

		menuUI.ui.table["icon_" .. 3]:setEnabled(false)
	end

	menuUI.ui.table.mainFooterFrameSprite:setPosition(ccp(menuUI.constant.rightIconX + 380 - (menuUI.constant.iconCount - var_33_4) * menuUI.constant.rightIconSpan, 25))

	menuUI.ui.isOpen = false

	log.info("menu ui : menuUI.ui.isOpen  ", menuUI.ui.isOpen)
	menuUI.ui.actionMoveFooterEnd()
	menuUI.ui.table.officierMark:setVisible(false)
	menuUI.ui.table.officerMarkSprite:setVisible(false)

	if user.player.hasOfficialBuildingOthers == true then
		cmgr.sendRequest(menuUI.ui.receive_applyList, actions.getApplyList, 0)
	end

	menuUI.ui.isShowBubble = true

	if user.displayTech == 1 then
		local var_33_5 = CCSprite:create("res/ui/mainUI/navi_add_bg.png")
		local var_33_6 = CCArray:create()

		var_33_6:addObject(CCFadeIn:create(0.4))
		var_33_6:addObject(CCFadeOut:create(0.4))

		local var_33_7 = CCSequence:create(var_33_6)
		local var_33_8 = CCRepeat:create(var_33_7, 5)

		local function var_33_9()
			var_33_5:setVisible(false)
		end

		local var_33_10 = CCCallFuncN:create(var_33_9)
		local var_33_11 = CCArray:create()

		var_33_11:addObject(var_33_8)
		var_33_11:addObject(var_33_10)

		local var_33_12 = CCSequence:create(var_33_11)

		var_33_5:runAction(var_33_12)

		local var_33_13 = visibleSize.width - 50
		local var_33_14 = 50

		var_33_5:setPosition(ccp(var_33_13, var_33_14))
		var_33_5:setScale(1.5)
		var_33_0:addChild(var_33_5, 1)

		menuUI.ui.table.tech_bg_flash = var_33_5
	end

	if rmgr.isNotComplete() then
		menuUI.ui.table.guojiaItem:setEnabled(false)
	end

	if rmgr.isNotCompleteAndHighLevel() then
		menuUI.ui.table.fubenItem:setEnabled(false)
		menuUI.ui.table.jubenItem:setEnabled(false)
		menuUI.ui.table.ziyuanItem:setEnabled(false)
		menuUI.ui.table.wujiangItem:setEnabled(false)
		menuUI.ui.table.guojiaItem:setEnabled(false)
		menuUI.ui.table.zhuangbeiItem:setEnabled(false)
		menuUI.ui.table.kejiItem:setEnabled(false)
		menuUI.ui.table.paihangItem:setEnabled(false)
		menuUI.ui.table.bingqi:setEnabled(false)
	end

	return var_33_0
end

function menuUI.ui.receive_applyList(arg_38_0)
	if arg_38_0.action.state == 1 then
		local var_38_0 = arg_38_0.action.data

		if user.player.hasOfficialBuildingOthers == true and #var_38_0.list > 0 then
			if menuUI.ui.table.officerMarkSprite:isVisible() == false then
				menuUI.ui.table.officierMark:setPosition(ccp(visibleSize.width / 2 - 100, 150))
				menuUI.ui.table.officierMark:registerScriptTapHandler(menuUI.ui.click_officeMark)
				menuUI.ui.table.officerMarkSprite:setPosition(ccp(visibleSize.width / 2 - 100, 150))

				local var_38_1 = CCArray:create()

				for iter_38_0 = 1, 20 do
					local var_38_2 = CCSprite:create("res/ui/mainUI/promp/" .. string.format("promp%04d.png", iter_38_0))

					var_38_1:addObject(var_38_2:displayFrame())
				end

				local var_38_3 = CCAnimation:createWithSpriteFrames(var_38_1, 0.1)
				local var_38_4 = CCAnimate:create(var_38_3)
				local var_38_5 = CCArray:create()

				var_38_5:addObject(var_38_4)

				local var_38_6 = CCSequence:create(var_38_5)
				local var_38_7 = CCRepeatForever:create(tolua.cast(var_38_6, "CCActionInterval"))

				menuUI.ui.table.officerMarkSprite:runAction(var_38_7)
				menuUI.ui.table.officierMark:setVisible(true)
				menuUI.ui.table.officerMarkSprite:setVisible(true)
			end
		else
			menuUI.ui.table.officierMark:setVisible(false)
			menuUI.ui.table.officerMarkSprite:setVisible(false)
		end
	end
end

function menuUI.ui.show()
	localMenuLayer = menuUI.ui.createMenuLayer()

	local var_39_0 = smgr.getLayer("uiLayer")

	menuUI.ui.table.layer = localMenuLayer

	var_39_0:addChild(localMenuLayer, layerConst.UI, layerConst.UITAG)
	globalAction_checkGift()
	log.info("worldUI :  ", worldUI, " worldUI.shouldHdieMenu :", worldUI.shouldHdieMenu)
end

return menuUI
