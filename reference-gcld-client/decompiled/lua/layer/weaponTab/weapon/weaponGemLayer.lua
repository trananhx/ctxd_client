weaponGemLayer = {}
weaponGemLayer.ui = {}
weaponGemLayer.ui.table = {}
weaponGemLayer.data = {}
weaponGemLayer.gemStar = nil
weaponGemLayer.gemValue = nil
weaponGemLayer.id = nil
weaponGemLayer.type = nil
weaponGemLayer.currentValue = nil
weaponGemLayer.nextValue = nil

local var_0_0 = 0

function weaponGemLayer.ui.action_flyEnd(arg_1_0)
	weapon.ui.table.layer:removeChild(arg_1_0, true)
end

function weaponGemLayer.ui.action_fly(arg_2_0)
	arg_2_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height * 0.4))

	local var_2_0 = CCMoveTo:create(0.6, ccp(visibleSize.width / 2, visibleSize.height * 0.6))
	local var_2_1 = CCCallFuncN:create(weaponGemLayer.ui.action_flyEnd)
	local var_2_2 = CCArray:create()

	var_2_2:addObject(var_2_0)
	var_2_2:addObject(var_2_1)

	local var_2_3 = CCSequence:create(var_2_2)

	arg_2_0:runAction(var_2_3)
	weapon.ui.table.layer:addChild(arg_2_0, 100000)
end

function weaponGemLayer.ui.click_dakong()
	cmgr.sendRequest(weaponGemLayer.ui.open_result, actions.weaponOpenSlot, 1, weaponGemLayer.id)
end

function weaponGemLayer.ui.open_result(arg_4_0)
	if arg_4_0.action.state == 1 then
		weapon.ui.existTipsLayer = false

		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)
		weapon.control.getWeaponInfo()

		local var_4_0 = CCSprite:create("res/ui/weapon/mz12.png")

		weaponGemLayer.ui.action_fly(var_4_0)
	end
end

function weaponGemLayer.ui.click_xiangqian()
	cmgr.sendRequest(weapon.control.receive_unsetGemInfo, actions.weaponUnSetGems, 1, weaponGemLayer.id)

	weapon.ui.existTipsLayer = false

	weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)
end

function weaponGemLayer.ui.comboSprite(arg_6_0, arg_6_1)
	local var_6_0 = CCNode:create()
	local var_6_1 = CCSprite:create("res/ui/weapon/mz1.png")
	local var_6_2

	if arg_6_0 == 1 then
		var_6_2 = CCSprite:create("res/ui/weapon/mz3.png")
	elseif arg_6_0 == 2 then
		var_6_2 = CCSprite:create("res/ui/weapon/mz2.png")
	elseif arg_6_0 == 3 then
		var_6_2 = CCSprite:create("res/ui/weapon/daibing-green.png")
	end

	local var_6_3 = CCSprite:create("res/ui/weapon/plus.png")
	local var_6_4 = CCLabelAtlas:create(tostring(arg_6_1), "res/ui/weapon/number.png", 29, 46, 48)
	local var_6_5 = var_6_1:getContentSize().width
	local var_6_6 = var_6_2:getContentSize().width
	local var_6_7 = var_6_3:getContentSize().width
	local var_6_8 = var_6_4:getContentSize().width
	local var_6_9 = (var_6_5 + var_6_6 + var_6_7 + var_6_8) / 2

	var_6_1:setPositionX(var_6_5 / 2 - var_6_9)
	var_6_2:setPositionX(var_6_5 + var_6_6 / 2 - var_6_9)
	var_6_3:setPositionX(var_6_5 + var_6_6 + var_6_7 / 2 - var_6_9)
	var_6_4:setPositionX(var_6_5 + var_6_6 + var_6_7 + var_6_8 / 2 - var_6_9 - var_6_8 / 2)
	var_6_4:setPositionY(-var_6_4:getContentSize().height / 2)
	var_6_0:addChild(var_6_1)
	var_6_0:addChild(var_6_2)
	var_6_0:addChild(var_6_3)
	var_6_0:addChild(var_6_4)

	return var_6_0
end

function weaponGemLayer.ui.xiangqian_result(arg_7_0)
	if arg_7_0.action.state == 1 then
		weapon.control.getWeaponInfo()

		local var_7_0

		if arg_7_0.action.data.att ~= nil then
			var_7_0 = weaponGemLayer.ui.comboSprite(1, arg_7_0.action.data.att)
		elseif arg_7_0.action.data.def ~= nil then
			var_7_0 = weaponGemLayer.ui.comboSprite(2, arg_7_0.action.data.def)
		elseif arg_7_0.action.data.blood ~= nil then
			var_7_0 = weaponGemLayer.ui.comboSprite(3, arg_7_0.action.data.blood)
		end

		weaponGemLayer.ui.action_fly(var_7_0)
	end
end

function weaponGemLayer.ui.click_zhaichu()
	if weaponGemLayer.data[1].gemId <= 5 then
		cmgr.sendRequest(weaponGemLayer.ui.zhaichu_result, actions.weaponUnLoadGem, weaponGemLayer.data[1].gemId, 1, weaponGemLayer.id)
	elseif user.player.haveGemsActivity == 1 or user.player.haveGemRotaryEvent == 1 or user.activity.haveNewGemsActivity or user.activity.haveNewGemRotaryActivity or user.activity.haveSuperGemRotaryActivity then
		local var_8_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_8_0:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
			if arg_9_0 == CCTOUCHBEGAN then
				return true
			elseif arg_9_0 == CCTOUCHMOVED then
				return true
			elseif arg_9_0 == CCTOUCHENDED then
				var_8_0:removeAllChildrenWithCleanup(true)
				var_8_0:removeFromParentAndCleanup(true)

				return true
			end
		end, false, true)
		var_8_0:setTouchEnabled(true)

		local var_8_1 = messageBox.createMessageBox(language.get(10003), language.get(135005), {
			{
				text = language.get(10001),
				callBack = function()
					var_8_0:removeAllChildrenWithCleanup(true)
					var_8_0:removeFromParentAndCleanup(true)
					cmgr.sendRequest(weaponGemLayer.ui.zhaichu_result, actions.weaponUnLoadGem, weaponGemLayer.data[1].gemId, 1, weaponGemLayer.id)
				end
			}
		})

		var_8_0:addChild(var_8_1)
		smgr.rootLayer:addChild(var_8_0, 60000)
	elseif user.chargeItems.unloadGem.noDisturb then
		cmgr.sendRequest(weaponGemLayer.ui.zhaichu_result, actions.weaponUnLoadGem, weaponGemLayer.data[1].gemId, 1, weaponGemLayer.id)
	else
		cmgr.sendRequest(weaponGemLayer.ui.receive_money, actions.weaponPreUnlaodGem, weaponGemLayer.data[1].gemId, 1, weaponGemLayer.id)
	end
end

function weaponGemLayer.ui.receive_money(arg_11_0)
	if arg_11_0.action.state == 1 then
		require("lua/component/messageBox")

		local var_11_0 = weaponGemLayer.data[1].gemId
		local var_11_1 = 121021

		if weaponGemLayer.data[1].gemId > 1000 then
			var_11_0 = weaponGemLayer.data[1].gemId - 1000
			var_11_1 = 121057
		end

		messageBox.showChargeWin(language.get(10003), language.get(var_11_1, arg_11_0.action.data.gold, tostring(var_11_0)), "unloadGem", function()
			cmgr.sendRequest(weaponGemLayer.ui.zhaichu_result, actions.weaponUnLoadGem, weaponGemLayer.data[1].gemId, 1, weaponGemLayer.id)
		end)
	end
end

function weaponGemLayer.ui.zhaichu_result(arg_13_0)
	if arg_13_0.action.state == 1 then
		weapon.ui.existTipsLayer = false

		weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)
		weapon.control.getWeaponInfo()

		local var_13_0 = CCSprite:create("res/ui/weapon/mz13.png")

		weaponGemLayer.ui.action_fly(var_13_0)
	end
end

function weaponGemLayer.ui.select_gem()
	return
end

function weaponGemLayer.ui.init()
	weaponGemLayer.ui.table.title:setString(weaponGemLayer.weaponName)

	local var_15_0 = {
		language.get(121022),
		language.get(121023),
		language.get(121024)
	}

	weaponGemLayer.ui.table.cur_ack:setString(var_15_0[weaponGemLayer.type])

	local var_15_1 = {
		language.get(121025),
		language.get(121026),
		language.get(121027)
	}

	weaponGemLayer.ui.table.nxt_ack:setString(var_15_1[weaponGemLayer.type])
	weaponGemLayer.ui.table.cur_ack_value:setString("+" .. tostring(weaponGemLayer.currentValue))
	weaponGemLayer.ui.table.nxt_ack_value:setString("+" .. tostring(weaponGemLayer.nextValue))

	if tonumber(weaponGemLayer.data[1].gemId) < 0 then
		-- block empty
	elseif tonumber(weaponGemLayer.data[1].gemId) == 0 then
		-- block empty
	elseif tonumber(weaponGemLayer.data[1].gemId) > 0 then
		local var_15_2 = {
			language.get(121028),
			language.get(121029),
			language.get(121030)
		}
		local var_15_3 = {
			weaponGemLayer.data[1].att,
			weaponGemLayer.data[1].def,
			weaponGemLayer.data[1].blood
		}

		for iter_15_0 = 1, 3 do
			local var_15_4 = "" .. var_15_2[iter_15_0] .. "+" .. var_15_3[iter_15_0]

			weaponGemLayer.ui.table["xiangqian_value_" .. iter_15_0]:setString(var_15_4)
			weaponGemLayer.ui.table["xiangqian_value_" .. 3 + iter_15_0]:setString(var_15_4)
		end

		weaponGemLayer.ui.table.icon_title:setString(weaponGemLayer.data[1].gemName)

		local var_15_5, var_15_6 = rmgr.getBaoshiFilePath(weaponGemLayer.data[1].gemPic, weaponGemLayer.data[1].gemLv)

		if var_15_5 ~= nil then
			local var_15_7 = CCSprite:create(var_15_5)
			local var_15_8 = 1

			weaponGemLayer.ui.table["icon_" .. var_15_8]:setDisplayFrame(var_15_7:displayFrame())
			weaponGemLayer.ui.table["icon_" .. var_15_8]:setScale(1)

			local var_15_9 = math.mod(weaponGemLayer.data[1].gemLv, 4)

			if var_15_9 == 0 then
				var_15_9 = 4
			end

			for iter_15_1 = 1, var_15_9 do
				local var_15_10 = CCSprite:create("res/ui/weapon/xing.png")

				var_15_10:setPosition(18 * iter_15_1 - 9, 62)
				var_15_10:setScale(0.7)
				weaponGemLayer.ui.table["icon_" .. var_15_8]:addChild(var_15_10)
			end
		end
	end
end

function weaponGemLayer.ui.showUnOpen()
	multiLangOffset = {}

	if conf.language == "kr" then
		multiLangOffset.wOffset = 60
		multiLangOffset.lineScale = 1.2
		multiLangOffset.xOffset1 = -15
		multiLangOffset.HOffset = 0
		multiLangOffset.xOffset2 = 0
	elseif conf.language == "vie" then
		multiLangOffset.wOffset = 80
		multiLangOffset.lineScale = 1.2
		multiLangOffset.xOffset1 = -15
		multiLangOffset.HOffset = 20
		multiLangOffset.xOffset2 = -5
	else
		multiLangOffset.wOffset = 0
		multiLangOffset.lineScale = 1
		multiLangOffset.xOffset1 = 0
		multiLangOffset.HOffset = 0
		multiLangOffset.xOffset2 = 0
	end

	local var_16_0 = 250 + multiLangOffset.wOffset
	local var_16_1 = 300

	weaponGemLayer.ui.table.bg = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	weaponGemLayer.ui.table.bg:setContentSize(CCSizeMake(var_16_0, var_16_1))
	weaponGemLayer.ui.table.bg:setPosition(ccp(0, 0))
	weaponGemLayer.ui.table.bg:setAnchorPoint(ccp(0.5, 0.5))

	weaponGemLayer.ui.table.title = CCLabelTTF:create("name", "", 25)

	weaponGemLayer.ui.table.title:setPosition(ccp(60 - multiLangOffset.HOffset * 2, var_16_1 - 40))

	if conf.language == "vie" then
		weaponGemLayer.ui.table.title:setAnchorPoint(ccp(0, 0.5))
	end

	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.title)

	weaponGemLayer.ui.table.cur_ack = CCLabelTTF:create(language.get(121031), "", 20)

	weaponGemLayer.ui.table.cur_ack:setPosition(ccp(67 - multiLangOffset.HOffset * 2, var_16_1 - 80))

	if conf.language == "vie" then
		weaponGemLayer.ui.table.cur_ack:setAnchorPoint(ccp(0, 0.5))
	end

	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.cur_ack)

	weaponGemLayer.ui.table.nxt_ack = CCLabelTTF:create(language.get(121031), "", 20)

	weaponGemLayer.ui.table.nxt_ack:setPosition(ccp(67 - multiLangOffset.HOffset * 2, var_16_1 - 110))

	if conf.language == "vie" then
		weaponGemLayer.ui.table.nxt_ack:setAnchorPoint(ccp(0, 0.5))
	end

	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.nxt_ack)

	weaponGemLayer.ui.table.cur_ack_value = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.cur_ack_value:setPosition(ccp(140 + multiLangOffset.HOffset * 5, var_16_1 - 80))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.cur_ack_value)

	weaponGemLayer.ui.table.nxt_ack_value = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.nxt_ack_value:setPosition(ccp(140 + multiLangOffset.HOffset * 5, var_16_1 - 110))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.nxt_ack_value)

	weaponGemLayer.ui.table.line1 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line1:setPosition(ccp(var_16_0 / 2, var_16_1 - 140))
	weaponGemLayer.ui.table.line1:setScaleX(0.8 * multiLangOffset.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line1)

	weaponGemLayer.ui.table.lock = CCSprite:create("res/ui/weapon/baoshidi2.png")

	weaponGemLayer.ui.table.lock:setPosition(ccp(var_16_0 / 5 + multiLangOffset.xOffset1 * 2, var_16_1 - 190))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.lock)

	weaponGemLayer.ui.table.lock_title = CCLabelTTF:create(language.get(121032), "", 25)

	weaponGemLayer.ui.table.lock_title:setPosition(ccp(var_16_0 * 3 / 5 + multiLangOffset.xOffset1, var_16_1 - 190))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.lock_title)

	weaponGemLayer.ui.table.line3 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line3:setPosition(ccp(var_16_0 / 2, var_16_1 - 240))
	weaponGemLayer.ui.table.line3:setScaleX(0.8 * multiLangOffset.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line3)

	local var_16_2 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
	local var_16_3 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")

	weaponGemLayer.ui.table.btn_dakong = CCMenuItemSprite:create(var_16_2, var_16_3)

	weaponGemLayer.ui.table.btn_dakong:registerScriptTapHandler(weaponGemLayer.ui.click_dakong)
	weaponGemLayer.ui.table.btn_dakong:setPosition(ccp(0, 0))

	weaponGemLayer.ui.table.btn_menu = CCMenu:create()

	weaponGemLayer.ui.table.btn_menu:setPosition(ccp(var_16_0 / 2, var_16_1 - 270))
	weaponGemLayer.ui.table.btn_menu:addChild(weaponGemLayer.ui.table.btn_dakong)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.btn_menu)

	weaponGemLayer.ui.table.btn_menu_title = CCLabelTTF:create(language.get(121033), "", 25)

	weaponGemLayer.ui.table.btn_menu_title:setPosition(ccp(var_16_0 / 2, var_16_1 - 270))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.btn_menu_title)
	weaponGemLayer.ui.table.layer:addChild(weaponGemLayer.ui.table.bg)
end

function weaponGemLayer.ui.showInsert()
	multiLangOffset = {}

	if conf.language == "kr" then
		multiLangOffset.wOffset = 100
		multiLangOffset.label1X = 0
		multiLangOffset.label2X = 0
		multiLangOffset.label3X = 0
		multiLangOffset.label4X = 0
		multiLangOffset.label5X = 0
		multiLangOffset.lineScale = 1.4
		multiLangOffset.xOffset1 = -20
		multiLangOffset.xOffset2 = -20
		multiLangOffset.fontsize = 25
	elseif conf.language == "vie" then
		multiLangOffset.wOffset = 240
		multiLangOffset.label1X = 40
		multiLangOffset.label2X = 40
		multiLangOffset.label3X = 50
		multiLangOffset.label4X = 90
		multiLangOffset.label5X = 90
		multiLangOffset.lineScale = 2.2
		multiLangOffset.xOffset1 = -40
		multiLangOffset.xOffset2 = -30
		multiLangOffset.fontsize = 20
	else
		multiLangOffset.wOffset = 0
		multiLangOffset.label1X = 0
		multiLangOffset.label2X = 0
		multiLangOffset.label3X = 0
		multiLangOffset.label4X = 0
		multiLangOffset.label5X = 0
		multiLangOffset.lineScale = 1
		multiLangOffset.xOffset1 = 0
		multiLangOffset.xOffset2 = 0
		multiLangOffset.fontsize = 25
	end

	local var_17_0 = 250 + multiLangOffset.wOffset
	local var_17_1 = 300

	weaponGemLayer.ui.table.bg = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	weaponGemLayer.ui.table.bg:setContentSize(CCSizeMake(var_17_0, var_17_1))
	weaponGemLayer.ui.table.bg:setPosition(ccp(0, 0))
	weaponGemLayer.ui.table.bg:setAnchorPoint(ccp(0.5, 0.5))

	weaponGemLayer.ui.table.title = CCLabelTTF:create("name", "", 25)

	weaponGemLayer.ui.table.title:setPosition(ccp(60 + multiLangOffset.label1X, var_17_1 - 40))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.title)

	weaponGemLayer.ui.table.cur_ack = CCLabelTTF:create(language.get(121031), "", 20)

	weaponGemLayer.ui.table.cur_ack:setPosition(ccp(67 + multiLangOffset.label2X, var_17_1 - 80))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.cur_ack)

	weaponGemLayer.ui.table.nxt_ack = CCLabelTTF:create(language.get(121031), "", 20)

	weaponGemLayer.ui.table.nxt_ack:setPosition(ccp(67 + multiLangOffset.label3X, var_17_1 - 110))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.nxt_ack)

	weaponGemLayer.ui.table.cur_ack_value = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.cur_ack_value:setPosition(ccp(140 + multiLangOffset.label4X, var_17_1 - 80))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.cur_ack_value)

	weaponGemLayer.ui.table.nxt_ack_value = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.nxt_ack_value:setPosition(ccp(140 + multiLangOffset.label5X, var_17_1 - 110))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.nxt_ack_value)

	weaponGemLayer.ui.table.line1 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line1:setPosition(ccp(var_17_0 / 2, var_17_1 - 140))
	weaponGemLayer.ui.table.line1:setScaleX(0.8 * multiLangOffset.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line1)

	weaponGemLayer.ui.table.icon_select_bg = CCSprite:create("res/ui/weapon/gem_now_view_bg.jpg")

	weaponGemLayer.ui.table.icon_select_bg:setPosition(ccp(var_17_0 / 4 + multiLangOffset.xOffset1, var_17_1 - 190))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.icon_select_bg)

	weaponGemLayer.ui.table.icon_select = CCSprite:create("res/ui/weapon/gem_now_view_bg.jpg")

	weaponGemLayer.ui.table.icon_select:setPosition(ccp(var_17_0 / 4, var_17_1 - 190))
	weaponGemLayer.ui.table.icon_select:setVisible(false)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.icon_select)

	weaponGemLayer.ui.table.icon_select_tips = CCLabelTTF:create(language.get(121034), "", 25)

	weaponGemLayer.ui.table.icon_select_tips:setPosition(ccp(var_17_0 * 2 / 3 + 10 + multiLangOffset.xOffset2, var_17_1 - 190))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.icon_select_tips)

	weaponGemLayer.ui.table.line3 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line3:setPosition(ccp(var_17_0 / 2, var_17_1 - 240))
	weaponGemLayer.ui.table.line3:setScaleX(0.8 * multiLangOffset.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line3)

	local var_17_2 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
	local var_17_3 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")

	weaponGemLayer.ui.table.btn_xiangqian = CCMenuItemSprite:create(var_17_2, var_17_3)

	weaponGemLayer.ui.table.btn_xiangqian:registerScriptTapHandler(weaponGemLayer.ui.click_xiangqian)
	weaponGemLayer.ui.table.btn_xiangqian:setPosition(ccp(var_17_0 / 2, var_17_1 - 270))

	weaponGemLayer.ui.table.btn_menu = CCMenu:create()

	weaponGemLayer.ui.table.btn_menu:setPosition(ccp(0, 0))
	weaponGemLayer.ui.table.btn_menu:addChild(weaponGemLayer.ui.table.btn_xiangqian)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.btn_menu)

	weaponGemLayer.ui.table.btn_menu_title = CCLabelTTF:create(language.get(121035), "", multiLangOffset.fontsize)

	weaponGemLayer.ui.table.btn_menu_title:setPosition(ccp(var_17_0 / 2, var_17_1 - 270))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.btn_menu_title)
	weaponGemLayer.ui.table.layer:addChild(weaponGemLayer.ui.table.bg)
end

function weaponGemLayer.ui.showCut()
	local var_18_0 = {}

	if conf.language == "kr" then
		var_18_0.wOffset = 60
		var_18_0.lineScale = 1.2
		var_18_0.titleX = 0
		var_18_0.curAckX = 0
		var_18_0.nxtAckX = 0
		var_18_0.curAckValueX = 0
		var_18_0.nxtAckValueX = 0
		var_18_0.xOffset1 = 60
		var_18_0.xOffset2 = 60
	elseif conf.language == "vie" then
		var_18_0.wOffset = 120
		var_18_0.lineScale = 1.5
		var_18_0.titleX = 50
		var_18_0.curAckX = 50
		var_18_0.nxtAckX = 60
		var_18_0.curAckValueX = 120
		var_18_0.nxtAckValueX = 120
		var_18_0.xOffset1 = 55
		var_18_0.xOffset2 = 85
	else
		var_18_0.wOffset = 0
		var_18_0.lineScale = 1
		var_18_0.titleX = 0
		var_18_0.curAckX = 0
		var_18_0.nxtAckX = 0
		var_18_0.curAckValueX = 0
		var_18_0.nxtAckValueX = 0
		var_18_0.xOffset1 = 0
		var_18_0.xOffset2 = 0
	end

	local var_18_1 = 250 + var_18_0.wOffset
	local var_18_2 = 530

	weaponGemLayer.ui.table.bg = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	weaponGemLayer.ui.table.bg:setContentSize(CCSizeMake(var_18_1, var_18_2))
	weaponGemLayer.ui.table.bg:setPosition(ccp(0, 0))
	weaponGemLayer.ui.table.bg:setAnchorPoint(ccp(0.5, 0.5))

	weaponGemLayer.ui.table.title = CCLabelTTF:create("name", "", 25)

	weaponGemLayer.ui.table.title:setPosition(ccp(60 + var_18_0.titleX, var_18_2 - 40))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.title)

	weaponGemLayer.ui.table.cur_ack = CCLabelTTF:create(language.get(121031), "", 20)

	weaponGemLayer.ui.table.cur_ack:setPosition(ccp(67 + var_18_0.curAckX, var_18_2 - 80))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.cur_ack)

	weaponGemLayer.ui.table.nxt_ack = CCLabelTTF:create(language.get(121031), "", 20)

	weaponGemLayer.ui.table.nxt_ack:setPosition(ccp(67 + var_18_0.nxtAckX, var_18_2 - 110))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.nxt_ack)

	weaponGemLayer.ui.table.cur_ack_value = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.cur_ack_value:setPosition(ccp(140 + var_18_0.curAckValueX, var_18_2 - 80))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.cur_ack_value)

	weaponGemLayer.ui.table.nxt_ack_value = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.nxt_ack_value:setPosition(ccp(140 + var_18_0.nxtAckValueX, var_18_2 - 110))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.nxt_ack_value)

	weaponGemLayer.ui.table.line1 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line1:setPosition(ccp(var_18_1 / 2, var_18_2 - 140))
	weaponGemLayer.ui.table.line1:setScaleX(0.8 * var_18_0.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line1)

	weaponGemLayer.ui.table.icon_bg_1 = CCSprite:create("res/ui/weapon/gem_now_view_bg.jpg")

	weaponGemLayer.ui.table.icon_bg_1:setPosition(ccp(var_18_1 / 3 - 10, var_18_2 - 190))
	weaponGemLayer.ui.table.icon_bg_1:setScale(1)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.icon_bg_1)

	weaponGemLayer.ui.table.icon_1 = CCSprite:create("res/ui/weapon/baoshidi2.png")

	weaponGemLayer.ui.table.icon_1:setPosition(ccp(var_18_1 / 3 - 10, var_18_2 - 190))
	weaponGemLayer.ui.table.icon_1:setScale(1.5 * var_18_0.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.icon_1)

	weaponGemLayer.ui.table.icon_title = CCLabelTTF:create("+123", "", 20)

	weaponGemLayer.ui.table.icon_title:setPosition(ccp(var_18_1 * 2 / 3, var_18_2 - 190))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.icon_title)

	weaponGemLayer.ui.table.line2 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line2:setPosition(ccp(var_18_1 / 2, var_18_2 - 240))
	weaponGemLayer.ui.table.line2:setScaleX(0.8 * var_18_0.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line2)

	weaponGemLayer.ui.table.xiangqian_tips = CCLabelTTF:create(language.get(121036), "", 22)

	weaponGemLayer.ui.table.xiangqian_tips:setPosition(ccp(var_18_1 / 2, var_18_2 - 260))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_tips)

	weaponGemLayer.ui.table.xiangqian_name_1 = CCLabelTTF:create(language.get(121037), "", 20)

	weaponGemLayer.ui.table.xiangqian_name_1:setPosition(ccp(55 + var_18_0.xOffset1, var_18_2 - 290))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_name_1)

	weaponGemLayer.ui.table.xiangqian_value_1 = CCLabelTTF:create("+75", "", 20)

	weaponGemLayer.ui.table.xiangqian_value_1:setPosition(ccp(160 + var_18_0.xOffset2, var_18_2 - 290))
	weaponGemLayer.ui.table.xiangqian_value_1:setHorizontalAlignment(kCCTextAlignmentLeft)
	weaponGemLayer.ui.table.xiangqian_value_1:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	weaponGemLayer.ui.table.xiangqian_value_1:setDimensions(CCSizeMake(100, 30))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_value_1)

	weaponGemLayer.ui.table.xiangqian_name_2 = CCLabelTTF:create(language.get(121038), "", 20)

	weaponGemLayer.ui.table.xiangqian_name_2:setPosition(ccp(55 + var_18_0.xOffset1, var_18_2 - 320))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_name_2)

	weaponGemLayer.ui.table.xiangqian_value_2 = CCLabelTTF:create("+75", "", 20)

	weaponGemLayer.ui.table.xiangqian_value_2:setPosition(ccp(160 + var_18_0.xOffset2, var_18_2 - 320))
	weaponGemLayer.ui.table.xiangqian_value_2:setHorizontalAlignment(kCCTextAlignmentLeft)
	weaponGemLayer.ui.table.xiangqian_value_2:setDimensions(CCSizeMake(100, 30))
	weaponGemLayer.ui.table.xiangqian_value_2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_value_2)

	weaponGemLayer.ui.table.xiangqian_name_3 = CCLabelTTF:create(language.get(121039), "", 20)

	weaponGemLayer.ui.table.xiangqian_name_3:setPosition(ccp(55 + var_18_0.xOffset1, var_18_2 - 350))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_name_3)

	weaponGemLayer.ui.table.xiangqian_value_3 = CCLabelTTF:create("+75", "", 20)

	weaponGemLayer.ui.table.xiangqian_value_3:setPosition(ccp(160 + var_18_0.xOffset2, var_18_2 - 350))
	weaponGemLayer.ui.table.xiangqian_value_3:setHorizontalAlignment(kCCTextAlignmentLeft)
	weaponGemLayer.ui.table.xiangqian_value_3:setDimensions(CCSizeMake(100, 30))
	weaponGemLayer.ui.table.xiangqian_value_3:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_value_3)

	weaponGemLayer.ui.table.xiangqian_name_4 = CCLabelTTF:create(language.get(121040), "", 20)

	weaponGemLayer.ui.table.xiangqian_name_4:setPosition(ccp(55 + var_18_0.xOffset1, var_18_2 - 380))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_name_4)

	weaponGemLayer.ui.table.xiangqian_value_4 = CCLabelTTF:create("+75", "", 20)

	weaponGemLayer.ui.table.xiangqian_value_4:setPosition(ccp(160 + var_18_0.xOffset2, var_18_2 - 380))
	weaponGemLayer.ui.table.xiangqian_value_4:setHorizontalAlignment(kCCTextAlignmentLeft)
	weaponGemLayer.ui.table.xiangqian_value_4:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	weaponGemLayer.ui.table.xiangqian_value_4:setDimensions(CCSizeMake(100, 30))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_value_4)

	weaponGemLayer.ui.table.xiangqian_name_5 = CCLabelTTF:create(language.get(121041), "", 20)

	weaponGemLayer.ui.table.xiangqian_name_5:setPosition(ccp(55 + var_18_0.xOffset1, var_18_2 - 410))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_name_5)

	weaponGemLayer.ui.table.xiangqian_value_5 = CCLabelTTF:create("+75", "", 20)

	weaponGemLayer.ui.table.xiangqian_value_5:setPosition(ccp(160 + var_18_0.xOffset2, var_18_2 - 410))
	weaponGemLayer.ui.table.xiangqian_value_5:setHorizontalAlignment(kCCTextAlignmentLeft)
	weaponGemLayer.ui.table.xiangqian_value_5:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	weaponGemLayer.ui.table.xiangqian_value_5:setDimensions(CCSizeMake(100, 30))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_value_5)

	weaponGemLayer.ui.table.xiangqian_name_6 = CCLabelTTF:create(language.get(121042), "", 20)

	weaponGemLayer.ui.table.xiangqian_name_6:setPosition(ccp(55 + var_18_0.xOffset1, var_18_2 - 440))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_name_6)

	weaponGemLayer.ui.table.xiangqian_value_6 = CCLabelTTF:create("+75", "", 20)

	weaponGemLayer.ui.table.xiangqian_value_6:setPosition(ccp(160 + var_18_0.xOffset2, var_18_2 - 440))
	weaponGemLayer.ui.table.xiangqian_value_6:setHorizontalAlignment(kCCTextAlignmentLeft)
	weaponGemLayer.ui.table.xiangqian_value_6:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	weaponGemLayer.ui.table.xiangqian_value_6:setDimensions(CCSizeMake(100, 30))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.xiangqian_value_6)

	weaponGemLayer.ui.table.line3 = CCSprite:create("res/ui/weapon/line.png")

	weaponGemLayer.ui.table.line3:setPosition(ccp(var_18_1 / 2, var_18_2 - 470))
	weaponGemLayer.ui.table.line3:setScaleX(0.8 * var_18_0.lineScale)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.line3)

	local var_18_3 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
	local var_18_4 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")

	weaponGemLayer.ui.table.btn_dakong = CCMenuItemSprite:create(var_18_3, var_18_4)

	weaponGemLayer.ui.table.btn_dakong:registerScriptTapHandler(weaponGemLayer.ui.click_zhaichu)
	weaponGemLayer.ui.table.btn_dakong:setPosition(ccp(0, 0))

	weaponGemLayer.ui.table.btn_menu = CCMenu:create()

	weaponGemLayer.ui.table.btn_menu:setPosition(ccp(var_18_1 / 2, var_18_2 - 500))
	weaponGemLayer.ui.table.btn_menu:addChild(weaponGemLayer.ui.table.btn_dakong)
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.btn_menu)

	weaponGemLayer.ui.table.btn_menu_title = CCLabelTTF:create(language.get(121043), "", 25)

	weaponGemLayer.ui.table.btn_menu_title:setPosition(ccp(var_18_1 / 2, var_18_2 - 500))
	weaponGemLayer.ui.table.bg:addChild(weaponGemLayer.ui.table.btn_menu_title)
	weaponGemLayer.ui.table.layer:addChild(weaponGemLayer.ui.table.bg)
end

function weaponGemLayer.ui.getUiData()
	local var_19_0 = {}
	local var_19_1 = -50
	local var_19_2 = 50

	var_19_0.bg = {
		name = "bg",
		type = "pic",
		z = 1,
		pic = "res/ui/weapon/tips_di.png",
		x = var_19_1,
		y = var_19_2
	}
	var_19_0.title = {
		fontSize = 25,
		name = "title",
		type = "label",
		text = language.get(121044),
		x = var_19_1,
		y = var_19_2
	}
	var_19_0.cur_ack = {
		fontSize = 20,
		name = "cur_ack",
		type = "label",
		text = language.get(121045),
		x = var_19_1,
		y = var_19_2
	}
	var_19_0.nxt_ack = {
		fontSize = 20,
		name = "nxt_ack",
		type = "label",
		text = language.get(121046),
		x = var_19_1,
		y = var_19_2
	}

	return var_19_0
end

function weaponGemLayer.ui.show()
	local var_20_0 = createBaseLayer()

	weaponGemLayer.ui.table.layer = var_20_0

	if tonumber(weaponGemLayer.data[1].gemId) == -2 then
		weaponGemLayer.ui.showUnOpen()
	elseif tonumber(weaponGemLayer.data[1].gemId) == -1 then
		weaponGemLayer.ui.showUnOpen()
		weaponGemLayer.ui.table.btn_dakong:registerScriptTapHandler(function()
			smgr.showTipText(language.get(121058))
			amgr.playEffect(enumAudioFile.ui_click_error, false, true)
			weapon.ui.table.layer:removeChild(weapon.ui.table.gemLayer, true)
		end)
	elseif tonumber(weaponGemLayer.data[1].gemId) == 0 then
		weaponGemLayer.ui.showInsert()
	elseif tonumber(weaponGemLayer.data[1].gemId) > 0 then
		weaponGemLayer.ui.showCut()
	end

	weaponGemLayer.ui.init()

	return var_20_0
end
