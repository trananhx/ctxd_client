menuControl = {}

function menuControl.setVisible(arg_1_0, arg_1_1)
	if arg_1_0 == "zhucheng" then
		menuUI.ui.table.mainCityItem:setVisible(arg_1_1)
	elseif arg_1_0 == "shijie" then
		menuUI.ui.table.shijieItem:setVisible(arg_1_1)

		if user.curMainTask and user.curMainTask.taskId == 89 then
			menuControl.addLight("shijie", true)
		else
			menuControl.addLight("shijie", false)
		end

		if channelMgr.getCurrentChannel() == channels.iosplay800 or channelMgr.getCurrentChannel() == channels.iosAppstore or channelMgr.getCurrentChannel() == channels.iosappstore30lv or channelMgr.getCurrentChannel() == channels.iosmouding then
			local var_1_0 = versionUpdateConstant.file.version

			reload(var_1_0)

			local var_1_1 = sys_version

			print("game.newVersion.appStoreCode , localVersion.appStoreCode", game.newVersion.appStoreCode, var_1_1.appStoreCode)

			if game.newVersion.appStoreCode == var_1_1.appStoreCode then
				menuUI.ui.table.shijieItem:setVisible(false)
			end
		end
	elseif arg_1_0 == "fuben" then
		menuUI.ui.table.fubenItem:setVisible(arg_1_1)
	elseif arg_1_0 == "juben" then
		menuUI.ui.table.jubenItem:setVisible(arg_1_1)
	end
end

function menuControl.delGuide()
	guide.ui.setVisible(false)
end

function menuControl.addGuide()
	if menuUI.exist == false then
		return
	end

	if smgr.nextSceneTag == SCENE_MAIN_CITY then
		if guide.constant.area[2] == true then
			guide.control.loadGuide(1, 1)
		elseif guide.constant.area[3] == true then
			guide.control.loadGuide(1, 2)
		end

		for iter_3_0 = 1, 7 do
			local var_3_0 = "isPopuiContainGuide_" .. iter_3_0

			if guide.constant[var_3_0]() == true then
				guide.control.loadGuide(3, iter_3_0)

				if menuUI.ui.isOpen == false then
					menuUI.ui.clickedMainItem()
				end

				return
			end
		end
	end

	if smgr.nextSceneTag == SCENE_INSTANCE then
		if guide.constant.area[1] == true then
			guide.control.loadGuide(1, 1)
		elseif guide.constant.area[3] == true then
			guide.control.loadGuide(1, 2)
		end

		for iter_3_1 = 1, 6 do
			if guide.constant.city[iter_3_1] == true then
				guide.control.loadGuide(1, 1)

				return
			end
		end

		for iter_3_2 = 1, 7 do
			local var_3_1 = "isPopuiContainGuide_" .. iter_3_2

			if guide.constant[var_3_1]() == true then
				guide.control.loadGuide(3, iter_3_2)

				if menuUI.ui.isOpen == false then
					menuUI.ui.clickedMainItem()
				end

				return
			end
		end

		if guide.constant.other[3] == true then
			guide.control.loadGuide(1, 1)
		end
	end

	if smgr.nextSceneTag == SCENE_WORLD then
		if guide.constant.area[1] == true then
			guide.control.loadGuide(1, 1)
		elseif guide.constant.area[2] == true then
			guide.control.loadGuide(1, 2)
		end

		for iter_3_3 = 1, 6 do
			if guide.constant.city[iter_3_3] == true then
				guide.control.loadGuide(1, 1)

				return
			end
		end

		for iter_3_4 = 1, 7 do
			local var_3_2 = "isPopuiContainGuide_" .. iter_3_4

			if guide.constant[var_3_2]() == true then
				guide.control.loadGuide(1, 1)

				return
			end
		end
	end

	if smgr.nextSceneTag == SCENE_RES_JUMING or smgr.nextSceneTag == SCENE_RES_MUCHANG or smgr.nextSceneTag == SCENE_RES_BINGYING or smgr.nextSceneTag == SCENE_RES_NONGTIAN or smgr.nextSceneTag == SCENE_RES_BINGTIE or smgr.nextSceneTag == SCENE_RES_HUANGCHENG then
		for iter_3_5 = 1, 3 do
			if guide.constant.area[iter_3_5] == true then
				guide.control.loadGuide(1, iter_3_5)

				return
			end
		end

		local var_3_3 = {
			SCENE_RES_JUMING,
			SCENE_RES_MUCHANG,
			SCENE_RES_NONGTIAN,
			SCENE_RES_BINGTIE,
			SCENE_RES_BINGYING,
			SCENE_RES_HUANGCHENG
		}

		for iter_3_6 = 1, 6 do
			if guide.constant.city[iter_3_6] == true and smgr.nextSceneTag ~= var_3_3[iter_3_6] then
				guide.control.loadGuide(1, 1)

				return
			end
		end

		for iter_3_7 = 1, 7 do
			local var_3_4 = "isPopuiContainGuide_" .. iter_3_7

			if guide.constant[var_3_4]() == true then
				guide.control.loadGuide(3, iter_3_7)

				if menuUI.ui.isOpen == false then
					menuUI.ui.clickedMainItem()
				end

				return
			end
		end

		if guide.constant.other[3] == true and smgr.nextSceneTag ~= SCENE_RES_MUCHANG then
			guide.control.loadGuide(1, 1)
		end
	end
end

function menuControl.addLight(arg_4_0, arg_4_1)
	if menuUI.ui and menuUI.ui.table.shijieItem and arg_4_0 == "shijie" and not tolua.isnull(menuUI.ui.table.shijieItem) then
		menuUI.ui.table.shijieItem:removeChildByTag(1034, true)

		if arg_4_1 then
			local var_4_0 = CCSprite:create("res/ui/mainUI/btn_sj_light.png")

			var_4_0:setPosition(ccp(menuUI.ui.table.shijieItem:getContentSize().width / 2 - 3, menuUI.ui.table.shijieItem:getContentSize().height / 2 + 2))
			menuUI.ui.table.shijieItem:addChild(var_4_0, 101, 1034)

			local var_4_1 = CCArray:create()

			var_4_1:addObject(CCFadeIn:create(0.3))
			var_4_1:addObject(CCFadeOut:create(0.3))

			local var_4_2 = CCRepeatForever:create(CCSequence:create(var_4_1))

			var_4_0:runAction(var_4_2)
		end
	end
end

return menuControl
