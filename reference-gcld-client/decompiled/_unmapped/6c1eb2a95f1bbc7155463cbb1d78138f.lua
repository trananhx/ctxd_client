weapon = {}

tool.requireRes("weaponTab/weapon")

weapon.ui = {}
weapon.ui.table = {}
weapon.ui.existTipsLayer = false
weapon.ui.existListView = false
weapon.ui.beginX = 0
weapon.ui.beginY = 0

function weapon.ui.setSingleVisibleFalse(arg_1_0)
	weapon.ui.table["bg_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["name_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["notOpen_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["weapon_icon_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["weapon_gem_bg_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["weapon_gem_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["lvValue_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["quantiIcon_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["quantiValue_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["zhuzaoBarBg_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["zhuzaoBar_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["zhuzaoPercent_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost_icon_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost_value_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["donghuadi_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["donghuaValue_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["dazaoBarBg_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["dazaoBar_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["dazaoPercent_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["map_title_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["map_icon_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["map_percent_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost2_title_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost2_icon1_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost2_icon1Value_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost2_icon2_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["cost2_icon2Value_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_zhuzao_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_buy_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_drop_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_dazao_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_name_zhuzao_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_name_buy_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_name_drop_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_name_dazao_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["btn_reform_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["star1_" .. arg_1_0]:setVisible(false)
	weapon.ui.table["donghuaFire_" .. arg_1_0]:setVisible(false)
end

function weapon.ui.setAllVisibleFalse()
	for iter_2_0 = 1, 6 do
		weapon.ui.setSingleVisibleFalse(iter_2_0)
	end
end

function weapon.ui.step1_setSingleVisbileTrue(arg_3_0)
	weapon.ui.table["bg_" .. arg_3_0]:setVisible(true)
	weapon.ui.table["notOpen_" .. arg_3_0]:setVisible(true)
	weapon.ui.table["weapon_icon_" .. arg_3_0]:setVisible(true)
end

function weapon.ui.step1_setVisbileTrue()
	for iter_4_0 = 1, 6 do
		weapon.ui.step1_setSingleVisbileTrue(iter_4_0)
	end
end

function weapon.ui.step2_setSingleVisbileTrue(arg_5_0)
	weapon.ui.table["bg_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["name_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["weapon_icon_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["map_title_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["map_icon_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["map_percent_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["btn_buy_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["btn_drop_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["btn_name_buy_" .. arg_5_0]:setVisible(true)
	weapon.ui.table["btn_name_drop_" .. arg_5_0]:setVisible(true)
end

function weapon.ui.step2_setVisbileTrue()
	for iter_6_0 = 1, 6 do
		weapon.ui.step2_setSingleVisbileTrue(iter_6_0)
	end
end

function weapon.ui.step3_setSingleVisbileTrue(arg_7_0)
	weapon.ui.table["bg_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["name_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["quantiIcon_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["weapon_icon_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["cost2_title_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["cost2_icon1_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["cost2_icon1Value_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["cost2_icon2_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["cost2_icon2Value_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["btn_dazao_" .. arg_7_0]:setVisible(true)
	weapon.ui.table["btn_name_dazao_" .. arg_7_0]:setVisible(true)
end

function weapon.ui.step3_setVisbileTrue()
	for iter_8_0 = 1, 6 do
		weapon.ui.step3_setSingleVisbileTrue(iter_8_0)
	end
end

function weapon.ui.step4_setSingleVisbileTrue(arg_9_0)
	weapon.ui.table["bg_" .. arg_9_0]:setVisible(true)
	weapon.ui.table["name_" .. arg_9_0]:setVisible(true)
	weapon.ui.table["weapon_icon_" .. arg_9_0]:setVisible(true)
	weapon.ui.table["donghuadi_" .. arg_9_0]:setVisible(true)
	weapon.ui.table["donghuaValue_" .. arg_9_0]:setVisible(true)
	weapon.ui.table["dazaoBarBg_" .. arg_9_0]:setVisible(true)
	weapon.ui.table["dazaoBar_" .. arg_9_0]:setVisible(true)
end

function weapon.ui.step4_setVisbileTrue()
	for iter_10_0 = 1, 6 do
		weapon.ui.step4_setSingleVisbileTrue(iter_10_0)
	end
end

function weapon.ui.step5_setSingleVisbileTrue(arg_11_0)
	weapon.ui.table["bg_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["name_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["weapon_icon_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["weapon_gem_bg_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["lvValue_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["quantiIcon_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["quantiValue_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["zhuzaoBarBg_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["zhuzaoBar_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["zhuzaoPercent_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["cost_icon_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["cost_value_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["btn_zhuzao_" .. arg_11_0]:setVisible(true)
	weapon.ui.table["btn_name_zhuzao_" .. arg_11_0]:setVisible(true)
end

function weapon.ui.step5_setVisbileTrue()
	for iter_12_0 = 1, 6 do
		weapon.ui.step5_setSingleVisbileTrue(iter_12_0)
	end
end

function weapon.ui.onTouch(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0 == CCTOUCHBEGAN then
		weapon.ui.beginX = arg_13_1
		weapon.ui.beginY = arg_13_2

		return true
	elseif arg_13_0 == CCTOUCHENDED then
		if weapon.ui.existListView == true then
			local var_13_0 = weapon.ui.table.select_bg:getContentSize()
			local var_13_1, var_13_2 = weapon.ui.table.bg:getPosition()
			local var_13_3 = arg_13_1 - var_13_1 + var_13_0.width / 2 - 30
			local var_13_4 = arg_13_2 - var_13_2 + var_13_0.height / 2 - 30

			if var_13_3 > 0 and var_13_3 < 474 and var_13_4 > 0 and var_13_4 < 140 then
				if var_13_4 < 72 and math.abs(weapon.ui.beginX - arg_13_1) < 20 and math.abs(weapon.ui.beginY - arg_13_2) < 20 then
					local var_13_5 = weapon.ui.table.scrollView:getContentOffset().x
					local var_13_6 = math.floor((var_13_3 - var_13_5) / 90)
					local var_13_7 = weapon.control.gemData[var_13_6 + 1]

					if var_13_7 ~= nil then
						weapon.ui.existListView = false

						weapon.ui.table.bg:removeChild(weapon.ui.table.select_bg, true)
						cmgr.sendRequest(weaponGemLayer.ui.xiangqian_result, actions.weaponLoadGem, var_13_7.gemId, 1, weaponGemLayer.id, var_13_7.vId)
					end
				end
			else
				weapon.ui.existListView = false

				weapon.ui.table.bg:removeChild(weapon.ui.table.select_bg, true)
			end
		elseif weapon.control.isOpenGem == 1 then
			local var_13_8 = false

			for iter_13_0 = 1, 6 do
				if weapon.control.data[iter_13_0].maxNum == nil and tool.checkIfTouch(weapon.ui.table["weapon_icon_bg_" .. iter_13_0], arg_13_1, arg_13_2) then
					require("lua/layer/weaponTab/weapon/weaponGemLayer")

					weaponGemLayer.data = weapon.control.data[iter_13_0].gems
					weaponGemLayer.gemStar = weapon.control.data[iter_13_0].gemStar
					weaponGemLayer.gemValue = weapon.control.data[iter_13_0].gemValue
					weaponGemLayer.currentValue = weapon.control.data[iter_13_0].value
					weaponGemLayer.nextValue = weapon.control.data[iter_13_0].nextvalue
					weaponGemLayer.type = weapon.control.data[iter_13_0].type
					weaponGemLayer.id = iter_13_0

					local var_13_9 = weapon.control.isTrueWeapon[iter_13_0] and weapon.constant.names_true[iter_13_0].text or weapon.constant.names[iter_13_0].text

					weaponGemLayer.weaponName = language.get(var_13_9)

					if weapon.ui.table.gemLayer ~= nil then
						weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)
					end

					local var_13_10 = weaponGemLayer.ui.show()

					weapon.ui.table.gemLayer = var_13_10

					if iter_13_0 <= 3 then
						var_13_10:setPosition(320, visibleSize.height / 2)
					else
						var_13_10:setPosition(765, visibleSize.height / 2)
					end

					weapon.ui.table.layer:addChild(var_13_10, 10000)

					var_13_8 = true
					weapon.ui.existTipsLayer = true

					break
				end
			end

			if var_13_8 == false and weapon.ui.existTipsLayer == true then
				local var_13_11 = weaponGemLayer.ui.table.bg:getContentSize()
				local var_13_12, var_13_13 = weapon.ui.table.gemLayer:getPosition()
				local var_13_14 = arg_13_1 - var_13_12 + var_13_11.width / 2
				local var_13_15 = arg_13_2 - var_13_13 + var_13_11.height / 2

				if var_13_14 > 0 and var_13_14 < var_13_11.width and var_13_15 > 0 and var_13_15 < var_13_11.height then
					-- block empty
				else
					weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)

					weapon.ui.existTipsLayer = false
				end
			end
		end
	end
end

function weapon.ui.action_flyNoGemEnd(arg_14_0)
	weapon.ui.table.layer:removeChild(arg_14_0, true)
end

function weapon.ui.action_flyNoGem()
	local var_15_0 = CCLabelTTF:create(language.get(121005), "", 30)

	var_15_0:setPosition(visibleSize.width / 2, visibleSize.height / 2)
	var_15_0:setColor(ccc3(192, 53, 33))
	weapon.ui.table.layer:addChild(var_15_0, 1000)

	local var_15_1 = CCDelayTime:create(3)
	local var_15_2 = CCCallFuncN:create(weapon.ui.action_flyNoGemEnd)
	local var_15_3 = CCArray:create()

	var_15_3:addObject(var_15_1)
	var_15_3:addObject(var_15_2)

	local var_15_4 = CCSequence:create(var_15_3)

	var_15_0:runAction(var_15_4)
end

function weapon.ui.showListView()
	local var_16_0 = createBaseLayer()
	local var_16_1 = #weapon.control.gemData

	if var_16_1 == 0 then
		weapon.ui.action_flyNoGem()

		return
	end

	for iter_16_0 = 1, var_16_1 do
		local var_16_2 = weapon.control.gemData[iter_16_0]
		local var_16_3, var_16_4 = rmgr.getBaoshiFilePath(var_16_2.gemPic, var_16_2.gemLv)
		local var_16_5 = CCSprite:create(var_16_3)

		var_16_5:setPosition(ccp(90 * (iter_16_0 - 1) + 36, 36))
		var_16_0:addChild(var_16_5)

		if var_16_2.num > 1 then
			local var_16_6 = CCLabelTTF:create(var_16_2.num, "", "20")

			var_16_6:setHorizontalAlignment(kCCTextAlignmentRight)
			var_16_6:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
			var_16_6:setDimensions(CCSizeMake(60, 30))
			var_16_6:setPosition(ccp(40, 12))
			var_16_5:addChild(var_16_6)
		end

		local var_16_7, var_16_8 = rmgr.getBaoshiFilePath(var_16_2.gemPic, var_16_2.gemLv)
		local var_16_9 = math.mod(var_16_2.gemLv, 4)

		if var_16_9 == 0 then
			var_16_9 = 4
		end

		for iter_16_1 = 1, var_16_9 do
			local var_16_10 = CCSprite:create("res/ui/weapon/xing.png")

			var_16_10:setPosition(18 * iter_16_1 - 9, 62)
			var_16_10:setScale(0.7)
			var_16_5:addChild(var_16_10)
		end
	end

	local var_16_11 = CCScrollView:create(CCSizeMake(474, 72))

	var_16_11:setContainer(var_16_0)
	var_16_11:setPosition(30, 30)
	var_16_11:setContentSize(CCSizeMake(var_16_1 * 90, 72))
	var_16_11:setDirection(kCCScrollViewDirectionHorizontal)

	weapon.ui.table.scrollView = var_16_11

	local var_16_12 = CCLabelTTF:create(language.get(121006), "", 30)

	var_16_12:setPosition(ccp(267, 135))

	local var_16_13 = weapon.ui.table.bg:getContentSize()
	local var_16_14 = CCSprite:create("res/ui/weapon/cangku.png")

	var_16_14:setPosition(var_16_13.width / 2, var_16_13.height / 2)
	var_16_14:addChild(var_16_12)
	var_16_14:addChild(var_16_11)

	weapon.ui.table.select_bg = var_16_14

	weapon.ui.table.bg:addChild(var_16_14, 10000)

	weapon.ui.existListView = true
end

function weapon.ui.init()
	for iter_17_0 = 1, 6 do
		weapon.ui.table["weapon_icon_" .. iter_17_0]:setScaleX(1.5)
		weapon.ui.table["weapon_icon_" .. iter_17_0]:setScaleY(1.47)
		weapon.ui.table["btn_zhuzao_" .. iter_17_0]:setScaleY(0.9)
		weapon.ui.table["btn_reform_" .. iter_17_0]:setScaleY(0.9)
		weapon.ui.table["zhuzaoBar_" .. iter_17_0]:setPercentage(0)
		weapon.ui.table["dazaoBar_" .. iter_17_0]:setPercentage(0)
		weapon.ui.table["btn_zhuzao_" .. iter_17_0]:registerScriptTapHandler(weapon.control.clicked_zhuzao)
		weapon.ui.table["btn_buy_" .. iter_17_0]:registerScriptTapHandler(weapon.control.clicked_buy)
		weapon.ui.table["btn_drop_" .. iter_17_0]:registerScriptTapHandler(weapon.control.clicked_drop)
		weapon.ui.table["btn_dazao_" .. iter_17_0]:registerScriptTapHandler(weapon.control.clicked_dazao)
	end

	weapon.ui.table.layer:setVisible(false)
end

function weapon.ui.show()
	local var_18_0 = createBaseLayer()

	weapon.ui.table = autoUI.initUI(var_18_0, getWeaponData())
	weapon.ui.table.layer = var_18_0

	var_18_0:registerScriptTouchHandler(weapon.ui.onTouch)
	var_18_0:setTouchEnabled(true)

	var_18_0.onEnter = weapon.control.onEnter
	var_18_0.onExit = weapon.control.onExit

	weapon.control.getWeaponInfo()
	weapon.ui.init()

	return var_18_0
end

function weapon.ui.showReformPanel(arg_19_0)
	local var_19_0 = {
		"wcb",
		"xld",
		"hjf",
		"xdz",
		"bgd",
		"jjl"
	}

	if weapon.ui.existTipsLayer == true then
		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)

		weapon.ui.existTipsLayer = false
	end

	weapon.ui.table.bg:setVisible(false)

	local var_19_1 = weapon.ui.table.layer

	var_19_1:setTouchEnabled(false)

	weapon.ui.tableReform = {}

	autoUI.createUI(var_19_1, getWeaponReformPanelData(), weapon.ui.tableReform)

	local var_19_2 = CCSprite:create("res/ui/weapon/reform/bqcz_btn_djzz.png")
	local var_19_3 = CCSprite:create("res/ui/weapon/reform/bqcz_btn_djzz.png")
	local var_19_4 = CCSprite:create("res/ui/weapon/reform/bqcz_btn_zzwc.png")
	local var_19_5 = CCSprite:create("res/ui/weapon/reform/bqcz_btn_zzwc.png")

	var_19_2:setColor(ccc3(200, 200, 200))
	var_19_4:setColor(ccc3(200, 200, 200))

	local var_19_6 = CCMenuItemSprite:create(var_19_2, var_19_3)
	local var_19_7 = CCMenuItemSprite:create(var_19_4, var_19_5)

	weapon.ui.tableReform.btn1 = var_19_6
	weapon.ui.tableReform.btn2 = var_19_7

	var_19_6:registerScriptTapHandler(weapon.control.clicked_chongzhuStart)
	var_19_7:registerScriptTapHandler(weapon.control.clicked_chongzhuFinish)

	local var_19_8 = CCMenu:create()

	var_19_8:addChild(var_19_6)
	var_19_8:addChild(var_19_7)
	var_19_8:setPosition(ccp(466, 80))
	weapon.ui.tableReform.bg_reform:addChild(var_19_8)
	var_19_7:setVisible(false)
	weapon.ui.tableReform.txt_btn:setString(language.get(121055))
	weapon.ui.tableReform.icon:setDisplayFrame(CCSprite:create("res/ui/weapon/weapon_" .. arg_19_0 .. ".png"):displayFrame())
	weapon.ui.tableReform.name:setDisplayFrame(CCSprite:create("res/ui/common/text/weapon/reform/bqcz_tit_" .. var_19_0[arg_19_0] .. ".png"):displayFrame())
end
