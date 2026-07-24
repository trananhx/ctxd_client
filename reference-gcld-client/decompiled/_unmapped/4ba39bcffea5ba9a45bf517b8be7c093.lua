weapon.control = {}
weapon.control.buyCost = 5
weapon.control.ironCost = 100000
weapon.control.isOpenGem = 0
weapon.control.data = {}
weapon.control.currentDazaoIndex = 0
weapon.control.currentZhuzaoIndex = 0
weapon.control.gemData = {}
weapon.control.isTrueWeapon = {
	false,
	false,
	false,
	false,
	false,
	false
}
weapon.control.hasReformBtnState = {
	0,
	0,
	0,
	0,
	0,
	0
}
weapon.control.reformData = {}

local var_0_0 = false

function weapon.control.setIconTexture(arg_1_0, arg_1_1)
	local var_1_0

	if arg_1_1 == true then
		if arg_1_0 >= 1 and arg_1_0 <= 6 then
			if weapon.control.isTrueWeapon[arg_1_0] then
				var_1_0 = "res/ui/weapon/reform/weapon_true_" .. arg_1_0 .. ".jpg"
			else
				var_1_0 = "res/ui/weapon/weapon_" .. arg_1_0 .. ".png"
			end
		end
	elseif arg_1_0 >= 1 and arg_1_0 <= 6 then
		var_1_0 = "res/ui/weapon/weapon_gray_" .. arg_1_0 .. ".png"
	end

	if var_1_0 ~= nil then
		local var_1_1 = CCSprite:create(var_1_0)

		weapon.ui.table["weapon_icon_" .. arg_1_0]:setDisplayFrame(var_1_1:displayFrame())

		if weapon.control.isTrueWeapon[arg_1_0] then
			if not weapon.ui.table["weapon_icon_" .. arg_1_0].light then
				rmgr.loadResource("res/anim/weapon/itemLightBig.plist")

				local var_1_2 = CCSprite:create()

				var_1_2:setScale(0.8)
				weapon.ui.table["weapon_icon_" .. arg_1_0]:addChild(var_1_2)
				var_1_2:setPosition(ccp(42, 37))

				local var_1_3 = CCArray:create()

				for iter_1_0 = 1, 32 do
					local var_1_4 = CCSprite:createWithSpriteFrameName("itemLightBig_" .. iter_1_0 .. ".png")

					var_1_3:addObject(var_1_4:displayFrame())
				end

				local var_1_5 = CCAnimation:createWithSpriteFrames(var_1_3, 0.04)
				local var_1_6 = CCAnimate:create(var_1_5)

				var_1_2:runAction(CCRepeatForever:create(var_1_6))

				weapon.ui.table["weapon_icon_" .. arg_1_0].light = var_1_2
			end
		else
			weapon.ui.table["weapon_icon_" .. arg_1_0]:removeAllChildrenWithCleanup(true)

			weapon.ui.table["weapon_icon_" .. arg_1_0].light = nil
		end
	end
end

function weapon.control.setResIcon(arg_2_0)
	local var_2_0

	if arg_2_0 == 1 then
		var_2_0 = "res/ui/weapon/silver.png"
	elseif arg_2_0 == 2 then
		var_2_0 = "res/ui/weapon/mucai.png"
	elseif arg_2_0 == 3 then
		var_2_0 = "res/ui/weapon/tie.png"
	elseif arg_2_0 == 4 then
		var_2_0 = "res/ui/weapon/tie.png"
	elseif arg_2_0 == 5 then
		var_2_0 = "res/ui/weapon/tie.png"
	end

	return var_2_0
end

function weapon.control.setQuantiString(arg_3_0)
	return language.get(weapon.constant.weapon_effect[arg_3_0].text)
end

function weapon.control.action_cuizi()
	local var_4_0 = CCArray:create()

	for iter_4_0 = 1, 4 do
		local var_4_1 = CCSprite:create("res/ui/weapon/donghuachui" .. iter_4_0 .. ".png"):displayFrame()

		var_4_0:addObject(var_4_1)
	end

	local var_4_2 = CCAnimation:createWithSpriteFrames(var_4_0, 0.1)
	local var_4_3 = CCAnimate:create(var_4_2)
	local var_4_4 = CCArray:create()

	var_4_4:addObject(var_4_3)

	local var_4_5 = CCSequence:create(var_4_4)
	local var_4_6 = CCRepeatForever:create(tolua.cast(var_4_5, "CCActionInterval"))

	weapon.ui.table["donghuaValue_" .. weapon.control.currentDazaoIndex]:runAction(var_4_6)
end

function weapon.control.action_jinduEnd()
	weapon.ui.setSingleVisibleFalse(weapon.control.currentDazaoIndex)

	local var_5_0 = weapon.control.data[weapon.control.currentDazaoIndex]

	weapon.control.currentDazaoIndex = 0

	weapon.control.updateSingleStep5(var_5_0)
end

function weapon.control.action_jindu()
	local var_6_0 = CCProgressTo:create(2, 100)
	local var_6_1 = CCCallFuncN:create(weapon.control.action_jinduEnd)
	local var_6_2 = CCArray:create()

	var_6_2:addObject(var_6_0)
	var_6_2:addObject(var_6_1)

	local var_6_3 = CCSequence:create(var_6_2)

	weapon.ui.table["dazaoBar_" .. weapon.control.currentDazaoIndex]:runAction(var_6_3)
end

function weapon.control.action_fire(arg_7_0)
	local var_7_0 = CCArray:create()

	for iter_7_0 = 1, 11 do
		local var_7_1 = CCSprite:create(string.format("res/ui/weapon/reform/bqgz_fire/bqgz_fire_%02d.png", iter_7_0)):displayFrame()

		var_7_0:addObject(var_7_1)
	end

	local var_7_2 = CCAnimation:createWithSpriteFrames(var_7_0, 0.1)
	local var_7_3 = CCAnimate:create(var_7_2)
	local var_7_4 = CCArray:create()

	var_7_4:addObject(var_7_3)

	local var_7_5 = CCSequence:create(var_7_4)
	local var_7_6 = CCRepeatForever:create(tolua.cast(var_7_5, "CCActionInterval"))

	weapon.ui.table["donghuaFire_" .. arg_7_0]:stopAllActions()
	weapon.ui.table["donghuaFire_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["donghuaFire_" .. arg_7_0]:runAction(var_7_6)
end

local function var_0_1(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0

	if arg_8_1 % 3 == 1 then
		var_8_0 = "res/ui/common/text/weapon/reform/bqcz_tit_qtgj.png"
	elseif arg_8_1 % 3 == 2 then
		var_8_0 = "res/ui/common/text/weapon/reform/bqcz_tit_qtfy.png"
	elseif arg_8_1 % 3 == 0 then
		var_8_0 = "res/ui/common/text/weapon/reform/bqcz_tit_dbsx.png"
	end

	local var_8_1 = arg_8_0:getContentSize()
	local var_8_2 = CCSprite:create(var_8_0)
	local var_8_3 = CCSprite:createWithSpriteFrameName("res_plus.png")

	var_8_3:setScale(0.8)

	local var_8_4 = CCLabelAtlas:create(arg_8_2, "res/ui/common/number/icon_numb.png", 19, 23, 48)

	var_8_4:setAnchorPoint(ccp(0.5, 0.5))

	local var_8_5 = createRichNode({
		var_8_2,
		var_8_3,
		var_8_4
	})

	var_8_5:setScale(1.26)
	arg_8_0:addChild(var_8_5, 100)

	local var_8_6 = var_8_2:getContentSize()
	local var_8_7 = var_8_3:getContentSize()
	local var_8_8 = var_8_4:getContentSize()
	local var_8_9 = 1.26 * (var_8_6.width + var_8_7.width + var_8_8.width)

	var_8_5:setPosition(ccp(0.5 * (var_8_1.width - var_8_9), 0.5 * var_8_1.height))

	return var_8_5
end

function weapon.control.action_text_fly(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	for iter_9_0 = 1, arg_9_1 do
		local var_9_0 = var_0_1(arg_9_0, arg_9_2, weapon.control.reformData[weapon.control.currentZhuzaoIndex].basePoint)

		var_9_0:setVisible(false)

		local var_9_1 = CCArray:create()

		var_9_1:addObject(CCMoveBy:create(0, ccp(0, -15)))
		var_9_1:addObject(CCDelayTime:create(iter_9_0 * 0.4))
		var_9_1:addObject(CCCallFuncN:create(function()
			var_9_0:setVisible(true)
		end))
		var_9_1:addObject(CCMoveBy:create(0.5, ccp(0, 30)))
		var_9_1:addObject(CCCallFuncN:create(weapon.control.action_none))
		var_9_1:addObject(CCCallFuncN:create(function()
			if iter_9_0 == arg_9_1 and arg_9_3 then
				arg_9_3()
			end
		end))
		var_9_1:addObject(CCFadeOut:create(1))

		local var_9_2 = CCSequence:create(var_9_1)

		var_9_0:runAction(var_9_2)
	end
end

function weapon.control.updateSingleStep1(arg_12_0)
	weapon.ui.step1_setSingleVisbileTrue(arg_12_0.id)
	weapon.control.setIconTexture(arg_12_0.id, arg_12_0.open)
end

function weapon.control.updateSingleStep2(arg_13_0)
	weapon.ui.step2_setSingleVisbileTrue(arg_13_0.id)
	weapon.control.setIconTexture(arg_13_0.id, arg_13_0.open)
	weapon.ui.table["map_percent_" .. arg_13_0.id]:setString("" .. arg_13_0.num .. "/" .. arg_13_0.maxNum)
end

function weapon.control.updateSingleStep3(arg_14_0)
	weapon.ui.step3_setSingleVisbileTrue(arg_14_0.id)
	weapon.control.setIconTexture(arg_14_0.id, arg_14_0.open)

	if arg_14_0.resources[1] ~= nil then
		local var_14_0 = weapon.control.setResIcon(arg_14_0.resources[1].type)
		local var_14_1 = CCSprite:create(var_14_0)

		weapon.ui.table["cost2_icon1_" .. arg_14_0.id]:setDisplayFrame(var_14_1:displayFrame())
		weapon.ui.table["cost2_icon1Value_" .. arg_14_0.id]:setString(arg_14_0.resources[1].value)

		if tonumber(user.player.copper) < tonumber(arg_14_0.resources[1].value) then
			weapon.ui.table["cost2_icon1Value_" .. arg_14_0.id]:setColor(ccc3(255, 0, 0))
			weapon.ui.table["btn_dazao_" .. arg_14_0.id]:setEnabled(false)
		else
			weapon.ui.table["cost2_icon1Value_" .. arg_14_0.id]:setColor(ccc3(255, 255, 255))
			weapon.ui.table["btn_dazao_" .. arg_14_0.id]:setEnabled(true)
		end
	else
		weapon.ui.table["cost2_icon1_" .. arg_14_0.id]:setVisible(false)
		weapon.ui.table["cost2_icon1Value_" .. arg_14_0.id]:setVisible(true)
	end

	if arg_14_0.resources[2] ~= nil then
		local var_14_2 = weapon.control.setResIcon(arg_14_0.resources[2].type)
		local var_14_3 = CCSprite:create(var_14_2)

		weapon.ui.table["cost2_icon2_" .. arg_14_0.id]:setDisplayFrame(var_14_3:displayFrame())
		weapon.ui.table["cost2_icon2Value_" .. arg_14_0.id]:setString(arg_14_0.resources[2].value)

		if tonumber(user.player.wood) < tonumber(arg_14_0.resources[2].value) then
			weapon.ui.table["cost2_icon2Value_" .. arg_14_0.id]:setColor(ccc3(255, 0, 0))
			weapon.ui.table["btn_dazao_" .. arg_14_0.id]:setEnabled(false)
		else
			weapon.ui.table["cost2_icon2Value_" .. arg_14_0.id]:setColor(ccc3(255, 255, 255))
			weapon.ui.table["btn_dazao_" .. arg_14_0.id]:setEnabled(true)
		end
	else
		weapon.ui.table["cost2_icon2_" .. arg_14_0.id]:setVisible(false)
		weapon.ui.table["cost2_icon2Value_" .. arg_14_0.id]:setVisible(false)
	end
end

function weapon.control.updateSingleStep4(arg_15_0)
	weapon.ui.step4_setSingleVisbileTrue(arg_15_0.id)
	weapon.control.setIconTexture(arg_15_0.id, arg_15_0.open)
	weapon.control.action_cuizi()
	weapon.control.action_jindu()
end

function weapon.control.updateSingleStep5(arg_16_0)
	weapon.ui.step5_setSingleVisbileTrue(arg_16_0.id)
	weapon.control.setIconTexture(arg_16_0.id, arg_16_0.open)
	weapon.ui.table["lvValue_" .. arg_16_0.id]:setString(tostring(arg_16_0.lv))

	if tonumber(user.player.playerLv) == tonumber(arg_16_0.lv) then
		weapon.ui.table["lvValue_" .. arg_16_0.id]:setColor(ccc3(255, 0, 0))
	else
		weapon.ui.table["lvValue_" .. arg_16_0.id]:setColor(ccc3(255, 255, 255))
	end

	local var_16_0 = math.floor(100 * arg_16_0.times / arg_16_0.totalTimes)

	if weapon.control.hasReformBtnState[arg_16_0.id] ~= 0 then
		var_16_0 = 100
	end

	weapon.ui.table["zhuzaoBar_" .. arg_16_0.id]:setPercentage(var_16_0)
	weapon.ui.table["zhuzaoPercent_" .. arg_16_0.id]:setString(tostring(var_16_0) .. "%")

	local var_16_1 = "res/ui/weapon/tie.png"
	local var_16_2 = CCSprite:create(var_16_1)

	weapon.ui.table["cost_icon_" .. arg_16_0.id]:setDisplayFrame(var_16_2:displayFrame())
	weapon.ui.table["cost_value_" .. arg_16_0.id]:setString(arg_16_0.upgradeCost)

	if user.player.iron < arg_16_0.upgradeCost then
		weapon.ui.table["cost_value_" .. arg_16_0.id]:setColor(ccc3(255, 0, 0))
	else
		weapon.ui.table["cost_value_" .. arg_16_0.id]:setColor(ccc3(255, 255, 255))
	end

	local var_16_3 = arg_16_0.value

	if weapon.control.isOpenGem == 0 then
		weapon.ui.table["weapon_gem_bg_" .. arg_16_0.id]:setVisible(false)
	else
		local var_16_4 = arg_16_0.gems[1]

		weapon.ui.table["weapon_gem_bg_" .. arg_16_0.id]:setVisible(true)
		weapon.ui.table["weapon_gem_" .. arg_16_0.id]:removeAllChildrenWithCleanup(true)
		weapon.ui.table["weapon_gem_" .. arg_16_0.id]:setVisible(false)

		if var_16_4.gemId > 0 then
			local var_16_5, var_16_6 = rmgr.getBaoshiFilePath(var_16_4.gemPic, var_16_4.gemLv)

			if var_16_5 ~= nil then
				local var_16_7 = CCSprite:create(var_16_5)

				weapon.ui.table["weapon_gem_" .. arg_16_0.id]:setDisplayFrame(var_16_7:displayFrame())
				weapon.ui.table["weapon_gem_" .. arg_16_0.id]:setVisible(true)

				local var_16_8 = math.mod(var_16_4.gemLv, 4)

				if var_16_8 == 0 then
					var_16_8 = 4
				end

				for iter_16_0 = 1, var_16_8 do
					local var_16_9 = CCSprite:create("res/ui/weapon/xing.png")

					var_16_9:setPosition(18 * iter_16_0 - 9, 62)
					var_16_9:setScale(0.7)
					weapon.ui.table["weapon_gem_" .. arg_16_0.id]:addChild(var_16_9)
				end
			end

			var_16_3 = var_16_3 + var_16_4[({
				"att",
				"def",
				"blood"
			})[arg_16_0.type]]
		elseif var_16_4.gemId == 0 then
			local var_16_10 = "res/ui/weapon/banshidi1.png"
			local var_16_11 = CCSprite:create(var_16_10)

			weapon.ui.table["weapon_gem_bg_" .. arg_16_0.id]:setDisplayFrame(var_16_11:displayFrame())
		elseif var_16_4.gemId < 0 then
			local var_16_12 = "res/ui/weapon/baoshidi2.png"
			local var_16_13 = CCSprite:create(var_16_12)

			weapon.ui.table["weapon_gem_bg_" .. arg_16_0.id]:setDisplayFrame(var_16_13:displayFrame())
		end
	end

	weapon.ui.table["quantiValue_" .. arg_16_0.id]:setString(weapon.control.setQuantiString(arg_16_0.type) .. "+" .. var_16_3)

	if arg_16_0.lv >= 50 and arg_16_0.lv <= 100 then
		if not arg_16_0.reformStars then
			arg_16_0.reformStars = 0
		end

		if arg_16_0.reformStars and arg_16_0.reformStars >= 0 and not weapon.control.isTrueWeapon[arg_16_0.id] then
			weapon.ui.table["star1_" .. arg_16_0.id]:setVisible(true)

			for iter_16_1 = 1, 5 do
				local var_16_14

				if iter_16_1 <= arg_16_0.reformStars then
					var_16_14 = CCSprite:create("res/ui/weapon/xing.png")
				else
					var_16_14 = CCSprite:create("res/ui/weapon/xing_dark.png")
				end

				weapon.ui.table["star" .. iter_16_1 .. "_" .. arg_16_0.id]:setDisplayFrame(var_16_14:displayFrame())
			end
		else
			weapon.ui.table["star1_" .. arg_16_0.id]:setVisible(false)
		end

		if weapon.control.hasReformBtnState[arg_16_0.id] == 0 then
			weapon.ui.table["btn_zhuzao_" .. arg_16_0.id]:setVisible(true)
			weapon.ui.table["btn_reform_" .. arg_16_0.id]:setVisible(false)
			weapon.ui.table["btn_name_zhuzao_" .. arg_16_0.id]:setString(language.get(121017))
		else
			weapon.control.action_fire(arg_16_0.id)
			weapon.ui.table["btn_zhuzao_" .. arg_16_0.id]:setVisible(false)
			weapon.ui.table["btn_reform_" .. arg_16_0.id]:setVisible(true)
			weapon.ui.table["cost_icon_" .. arg_16_0.id]:setVisible(false)
			weapon.ui.table["cost_value_" .. arg_16_0.id]:setVisible(false)

			if weapon.control.hasReformBtnState[arg_16_0.id] == 1 then
				weapon.ui.table["btn_name_zhuzao_" .. arg_16_0.id]:setString(language.get(121053))
				weapon.ui.table["btn_reform_" .. arg_16_0.id]:registerScriptTapHandler(weapon.control.clicked_gaizao)

				weapon.control.reformData[arg_16_0.id] = {
					num = 0
				}
			elseif weapon.control.hasReformBtnState[arg_16_0.id] == 2 then
				weapon.ui.table["btn_name_zhuzao_" .. arg_16_0.id]:setString(language.get(121054))
				weapon.ui.table["btn_reform_" .. arg_16_0.id]:registerScriptTapHandler(weapon.control.clicked_chongzhu)

				weapon.control.reformData[arg_16_0.id] = {
					num = 0
				}
			end
		end
	end
end

function weapon.control.updateSingle(arg_17_0)
	weapon.control.isTrueWeapon[arg_17_0.id] = false
	weapon.control.hasReformBtnState[arg_17_0.id] = 0

	if arg_17_0.open == true then
		if arg_17_0.maxNum == nil then
			if tonumber(weapon.control.currentDazaoIndex) == tonumber(arg_17_0.id) then
				weapon.control.updateSingleStep4(arg_17_0)
			else
				if arg_17_0.hasReformBtn then
					weapon.control.hasReformBtnState[arg_17_0.id] = arg_17_0.reformStars ~= 5 and arg_17_0.reformTimes and 1 or 2
				else
					weapon.control.hasReformBtnState[arg_17_0.id] = 0
				end

				if weapon.control.hasReformBtnState[arg_17_0.id] ~= 2 and arg_17_0.lv >= 100 then
					weapon.control.isTrueWeapon[arg_17_0.id] = true
				else
					weapon.control.isTrueWeapon[arg_17_0.id] = false
				end

				weapon.control.updateSingleStep5(arg_17_0)
			end
		elseif tonumber(arg_17_0.num) >= tonumber(arg_17_0.maxNum) then
			weapon.control.updateSingleStep3(arg_17_0)
		else
			weapon.control.updateSingleStep2(arg_17_0)
		end
	else
		weapon.control.updateSingleStep1(arg_17_0)
	end

	local var_17_0 = weapon.control.isTrueWeapon[arg_17_0.id] and weapon.constant.names_true[arg_17_0.id].pic or weapon.constant.names[arg_17_0.id].pic

	weapon.ui.table["name_" .. arg_17_0.id]:setDisplayFrame(CCSprite:create("res/ui/common/text/weapon/reform/" .. var_17_0):displayFrame())

	local var_17_1 = weapon.constant.weapon_effect[arg_17_0.type].pic

	weapon.ui.table["quantiIcon_" .. arg_17_0.id]:setDisplayFrame(CCSprite:create("res/ui/weapon/" .. var_17_1):displayFrame())
end

function weapon.control.update(arg_18_0)
	if arg_18_0.action.state == 1 then
		local var_18_0 = arg_18_0.action.data

		weapon.control.buyCost = var_18_0.buyCost
		weapon.control.ironCost = var_18_0.iron
		weapon.control.isOpenGem = var_18_0.isOpenTech
		weapon.control.data = var_18_0.weapons

		local var_18_1 = true

		for iter_18_0, iter_18_1 in pairs(var_18_0.weapons) do
			if iter_18_1.lv >= 50 then
				var_18_1 = false

				break
			end
		end

		if var_0_0 and not var_18_1 then
			roleDialogue.control.loadSpeak(1507)
		end

		var_0_0 = var_18_1
		weapon.control.reformData = {}

		weapon.ui.setAllVisibleFalse()

		for iter_18_2, iter_18_3 in pairs(var_18_0.weapons) do
			weapon.control.updateSingle(iter_18_3)
		end

		weapon.ui.table.layer:setVisible(true)

		local var_18_2 = var_18_0.specialId
		local var_18_3 = var_18_0.specialMulti
		local var_18_4 = var_18_0.specialLimit
		local var_18_5 = var_18_0.cd

		require("lua/layer/activity/activityTab/ui")
		globalAction_updateSpecialEffect(var_18_2, var_18_4, var_18_3, var_18_5)

		if var_18_0.cd and var_18_0.cd > 0 then
			if weapon.control.isZhuzao then
				weapon.control.isZhuzao = nil
			else
				local var_18_6

				if var_18_0.cd > 3600000 then
					var_18_6 = language.get(131082, tool.formatTime(var_18_0.cd, "@H"))
				elseif var_18_0.cd > 60000 then
					var_18_6 = language.get(131083, tool.formatTime(var_18_0.cd, "@M"))
				else
					var_18_6 = language.get(131084, tool.formatTime(var_18_0.cd, "@S"))
				end

				smgr.showTipTextGreen(var_18_6)
			end
		end
	end
end

function weapon.control.clicked_zhuzao(arg_19_0)
	weapon.control.isZhuzao = true

	if weapon.ui.existTipsLayer == true then
		weapon.ui.existTipsLayer = false

		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)

		return
	end

	if weapon.ui.existListView == true then
		weapon.ui.existListView = false

		weapon.ui.table.bg:removeChild(weapon.ui.table.select_bg, true)
	end

	weapon.control.currentZhuzaoIndex = arg_19_0

	cmgr.sendRequest(weapon.control.receive_zhuzaoResult, actions.weaponUpgrade, tostring(arg_19_0), "0")
end

function weapon.control.clicked_buy(arg_20_0)
	if weapon.ui.existTipsLayer == true then
		weapon.ui.existTipsLayer = false

		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)

		return
	end

	if weapon.ui.existListView == true then
		weapon.ui.existListView = false

		weapon.ui.table.bg:removeChild(weapon.ui.table.select_bg, true)
	end

	if user.chargeItems.buyWeaponItem.noDisturb then
		cmgr.sendRequest(weapon.control.none, actions.buyWeaponItem, tostring(arg_20_0))
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(121004, weapon.control.buyCost), "buyWeaponItem", function()
			cmgr.sendRequest(weapon.control.none, actions.buyWeaponItem, tostring(arg_20_0))
		end)
	end
end

function weapon.control.clicked_drop(arg_22_0)
	if weapon.ui.existTipsLayer == true then
		weapon.ui.existTipsLayer = false

		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)

		return
	end

	if weapon.ui.existListView == true then
		weapon.ui.existListView = false

		weapon.ui.table.bg:removeChild(weapon.ui.table.select_bg, true)
	end

	local var_22_0 = weapon.control.data[tonumber(arg_22_0)].markTrace
	local var_22_1 = {}

	var_22_1[1] = "instance:4:8"
	var_22_1[2] = "instance:5:1"
	var_22_1[3] = "instance:5:3"
	var_22_1[4] = "instance:8:1"
	var_22_1[5] = "instance:8:3"
	var_22_1[6] = "instance:8:5"

	guide.control.loadGuideByMarkTrace(var_22_1[tonumber(arg_22_0)])
end

function weapon.control.clicked_dazao(arg_23_0)
	if weapon.ui.existTipsLayer == true then
		weapon.ui.existTipsLayer = false

		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)
	end

	weapon.control.currentDazaoIndex = arg_23_0

	cmgr.sendRequest(weapon.control.none, actions.weaponUpgrade, tostring(arg_23_0), "0")
end

function weapon.control.clicked_gaizao(arg_24_0)
	local function var_24_0(arg_25_0)
		weapon.control.getWeaponInfo()
	end

	local function var_24_1()
		weapon.control.reformData[arg_24_0].num = 1 + weapon.control.reformData[arg_24_0].num

		if weapon.control.reformData[arg_24_0].num >= weapon.control.reformData[arg_24_0].numMax then
			cmgr.sendRequest(var_24_0, actions.weaponFinishReform, arg_24_0)
		end
	end

	local function var_24_2(arg_27_0)
		weapon.control.reformData[arg_24_0].totalPoint = arg_27_0.action.data.totalPoint
		weapon.control.reformData[arg_24_0].basePoint = arg_27_0.action.data.basePoint
		weapon.control.reformData[arg_24_0].numMax = arg_27_0.action.data.totalPoint / arg_27_0.action.data.basePoint

		weapon.control.action_text_fly(weapon.ui.table["bg_" .. arg_24_0], 1, arg_24_0, var_24_1)
	end

	weapon.control.currentZhuzaoIndex = arg_24_0

	if weapon.control.reformData[arg_24_0].num == 0 then
		cmgr.sendRequest(var_24_2, actions.weaponStartReform, arg_24_0)
	elseif weapon.control.reformData[arg_24_0].num < weapon.control.reformData[arg_24_0].numMax then
		weapon.control.action_text_fly(weapon.ui.table["bg_" .. arg_24_0], 1, arg_24_0, var_24_1)
	end
end

function weapon.control.clicked_chongzhu(arg_28_0)
	log.info("兵器重铸")

	local function var_28_0(arg_29_0)
		weapon.control.reformData[arg_28_0].totalPoint = arg_29_0.action.data.totalPoint
		weapon.control.reformData[arg_28_0].basePoint = arg_29_0.action.data.basePoint
		weapon.control.reformData[arg_28_0].numMax = arg_29_0.action.data.totalPoint / arg_29_0.action.data.basePoint

		weapon.ui.showReformPanel(arg_28_0)
	end

	weapon.control.currentZhuzaoIndex = arg_28_0

	cmgr.sendRequest(var_28_0, actions.weaponStartReform, arg_28_0)
end

function weapon.control.clicked_chongzhuStart()
	log.info("btn_点击铸造")
	weapon.ui.tableReform.btn1:setEnabled(false)

	local var_30_0 = CCArray:create()

	var_30_0:addObject(CCCallFuncN:create(function()
		weapon.ui.tableReform.star1:runAction(CCMoveBy:create(0.5, ccp(25, -40)))
		weapon.ui.tableReform.fire:setVisible(true)

		local var_31_0 = CCArray:create()

		var_31_0:addObject(CCScaleTo:create(0.3, 0.95))
		var_31_0:addObject(CCScaleTo:create(0.3, 1))
		weapon.ui.tableReform.fire:runAction(CCRepeatForever:create(CCSequence:create(var_31_0)))
	end))
	var_30_0:addObject(CCDelayTime:create(0.1))
	var_30_0:addObject(CCCallFuncN:create(function()
		weapon.ui.tableReform.star2:runAction(CCMoveBy:create(0.5, ccp(20, -40)))
	end))
	var_30_0:addObject(CCDelayTime:create(0.1))
	var_30_0:addObject(CCCallFuncN:create(function()
		weapon.ui.tableReform.star3:runAction(CCMoveBy:create(0.5, ccp(15, -40)))
	end))
	var_30_0:addObject(CCDelayTime:create(0.1))
	var_30_0:addObject(CCCallFuncN:create(function()
		weapon.ui.tableReform.star4:runAction(CCMoveBy:create(0.5, ccp(10, -40)))
	end))
	var_30_0:addObject(CCDelayTime:create(0.1))
	var_30_0:addObject(CCCallFuncN:create(function()
		local var_35_0 = CCArray:create()

		var_35_0:addObject(CCMoveBy:create(0.5, ccp(0, -40)))
		var_35_0:addObject(CCDelayTime:create(0.4))
		var_35_0:addObject(CCCallFuncN:create(function()
			weapon.ui.tableReform.star1:setVisible(false)
			weapon.ui.tableReform.star2:setVisible(false)
			weapon.ui.tableReform.star3:setVisible(false)
			weapon.ui.tableReform.star4:setVisible(false)
			weapon.ui.tableReform.star5:setVisible(false)
		end))
		weapon.ui.tableReform.star5:runAction(CCSequence:create(var_35_0))

		local var_35_1 = CCSprite:create()

		weapon.ui.tableReform.icon:addChild(var_35_1)
		var_35_1:setPosition(ccp(36, 5))

		local var_35_2 = CCArray:create()

		var_35_2:addObject(CCDelayTime:create(0.5))

		local var_35_3 = CCArray:create()

		for iter_35_0 = 1, 7 do
			local var_35_4 = CCSprite:create(string.format("res/ui/weapon/reform/bqcz_casting/casting_%02d.png", iter_35_0)):displayFrame()

			var_35_3:addObject(var_35_4)
		end

		local var_35_5 = CCAnimation:createWithSpriteFrames(var_35_3, 0.15)

		var_35_2:addObject(CCAnimate:create(var_35_5))
		var_35_2:addObject(CCCallFuncN:create(function()
			weapon.ui.tableReform.btn1:setVisible(false)
			weapon.ui.tableReform.btn2:setVisible(true)
			weapon.ui.tableReform.txt_btn:setString(language.get(121056))

			local var_37_0 = {
				"wcb",
				"xld",
				"hjf",
				"xdz",
				"bgd",
				"jjl"
			}

			weapon.ui.tableReform.icon:setDisplayFrame(CCSprite:create("res/ui/weapon/reform/weapon_true_" .. weapon.control.currentZhuzaoIndex .. ".jpg"):displayFrame())
			weapon.ui.tableReform.name:setDisplayFrame(CCSprite:create("res/ui/common/text/weapon/reform/bqcz_tit_z" .. var_37_0[weapon.control.currentZhuzaoIndex] .. ".png"):displayFrame())
			rmgr.loadResource("res/anim/sdtj/itemLight.plist")

			local var_37_1 = CCSprite:create()

			var_37_1:setScaleX(-1)
			weapon.ui.tableReform.icon:addChild(var_37_1)
			var_37_1:setPosition(ccp(36, 36))

			local var_37_2 = CCArray:create()

			for iter_37_0 = 1, 16 do
				local var_37_3 = CCSprite:createWithSpriteFrameName("itemLight_" .. iter_37_0 .. ".png")

				var_37_2:addObject(var_37_3:displayFrame())
			end

			local var_37_4 = CCAnimation:createWithSpriteFrames(var_37_2, 0.08)
			local var_37_5 = CCAnimate:create(var_37_4)

			var_37_1:runAction(CCRepeatForever:create(var_37_5))

			local var_37_6 = CCSprite:create()

			weapon.ui.tableReform.icon:addChild(var_37_6)
			var_37_6:setPosition(ccp(36, 36))

			local var_37_7 = rmgr.getAnimation("warlockUpgrade")
			local var_37_8 = CCAnimation:createWithSpriteFrames(var_37_7, 0.1)

			var_37_6:runAction(CCAnimate:create(var_37_8))

			local function var_37_9()
				weapon.ui.tableReform.info:setVisible(true)
				var_0_1(weapon.ui.tableReform.info, weapon.control.currentZhuzaoIndex, weapon.control.reformData[weapon.control.currentZhuzaoIndex].totalPoint)
				weapon.ui.tableReform.fire:setVisible(false)
			end

			weapon.control.action_text_fly(weapon.ui.tableReform.icon, weapon.control.reformData[weapon.control.currentZhuzaoIndex].numMax, weapon.control.currentZhuzaoIndex, var_37_9)
		end))
		var_35_1:runAction(CCSequence:create(var_35_2))
	end))
	weapon.ui.tableReform.star1:runAction(CCSequence:create(var_30_0))
end

function weapon.control.clicked_chongzhuFinish()
	log.info("btn_铸造完成")

	local function var_39_0(arg_40_0)
		weapon.ui.tableReform.bg_reform:removeFromParentAndCleanup(true)
		weapon.ui.table.bg:setVisible(true)
		weapon.ui.table.layer:setTouchEnabled(true)
		weapon.control.getWeaponInfo()
	end

	cmgr.sendRequest(var_39_0, actions.weaponFinishReform, weapon.control.currentZhuzaoIndex)
end

function weapon.control.getWeaponInfo()
	cmgr.sendRequest(weapon.control.update, actions.getWeaponInfo)
end

function weapon.control.action_none(arg_42_0)
	arg_42_0:getParent():removeChild(arg_42_0, true)
end

function weapon.control.receive_zhuzaoResult(arg_43_0)
	if arg_43_0.action.state == 1 then
		weapon.control.getWeaponInfo()

		local var_43_0 = arg_43_0.action.data.addType
		local var_43_1

		if var_43_0 == 1 then
			var_43_1 = "res/ui/weapon/mz7.png"
		elseif var_43_0 == 2 then
			var_43_1 = "res/ui/weapon/mz8.png"
		elseif var_43_0 == 4 then
			var_43_1 = "res/ui/weapon/mz9.png"
		elseif var_43_0 == 10 then
			var_43_1 = "res/ui/weapon/mz10.png"
		end

		if var_43_1 ~= nil then
			local var_43_2 = CCSprite:create(var_43_1)

			var_43_2:setPosition(ccp(222, 77))
			weapon.ui.table["bg_" .. weapon.control.currentZhuzaoIndex]:addChild(var_43_2, 100)

			local var_43_3 = CCMoveTo:create(0.5, ccp(222, 107))
			local var_43_4 = CCCallFuncN:create(weapon.control.action_none)
			local var_43_5 = CCArray:create()

			var_43_5:addObject(var_43_3)
			var_43_5:addObject(var_43_4)

			local var_43_6 = CCSequence:create(var_43_5)

			var_43_2:runAction(var_43_6)
		end
	end
end

function weapon.control.none(arg_44_0)
	if arg_44_0.action.state == 1 then
		weapon.control.getWeaponInfo()
	end
end

function weapon.control.receive_unsetGemInfo(arg_45_0)
	if arg_45_0.action.state == 1 then
		weapon.control.gemData = arg_45_0.action.data.gem

		weapon.ui.showListView()
	end
end

function weapon.control.onEnter()
	eventManager.registerEvent("refreshSpecialWindow", weapon.control.getWeaponInfo)

	var_0_0 = false
end

function weapon.control.onExit()
	eventManager.unregisterEvent("refreshSpecialWindow", weapon.control.getWeaponInfo)
end
