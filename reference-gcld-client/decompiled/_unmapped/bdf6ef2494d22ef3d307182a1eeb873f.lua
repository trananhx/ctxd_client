setting.control = {}
setting.control.data = {}
setting.control.isPrinting = false

function setting.control.click_btn_switch(arg_1_0)
	if setting.ui.pageIndex == arg_1_0 then
		return
	end

	for iter_1_0 = 1, 5 do
		setting.ui.table["tab_" .. iter_1_0]:setVisible(true)
		setting.ui.table["pane_" .. iter_1_0]:setVisible(false)
	end

	setting.ui.table["tab_" .. arg_1_0]:setVisible(false)
	setting.ui.table["pane_" .. arg_1_0]:setVisible(true)
	setting.ui.table.select_tab:setVisible(true)
	setting.ui.table.select_tab:setPosition(ccp(-50 + 150 * arg_1_0, 460))

	if setting.ui.table.yp_effect_slide ~= nil then
		setting.ui.table.pane_5:removeChild(setting.ui.table.yp_effect_slide, true)

		setting.ui.table.yp_effect_slide = nil
	end

	if setting.ui.table.yp_music_slide ~= nil then
		setting.ui.table.pane_5:removeChild(setting.ui.table.yp_music_slide, true)

		setting.ui.table.yp_music_slide = nil
	end

	if arg_1_0 == 5 then
		setting.ui.add_yinping_bar()
	end

	setting.ui.pageIndex = arg_1_0

	local var_1_0 = false

	if platform.getFlag() == "MOBILE_IPHONE" then
		local var_1_1 = versionUpdateConstant.file.version

		reload(var_1_1)

		local var_1_2 = sys_version

		if game.newVersion.appStoreCode == var_1_2.appStoreCode then
			setting.ui.table.pane_4:setVisible(false)
			setting.ui.table.btn_4:setVisible(false)

			local var_1_3 = ccp(setting.ui.table.btn_4:getPosition())

			setting.ui.table.btn_5:setPosition(var_1_3)
			setting.ui.table.tab_5:setVisible(false)

			if setting.ui.pageIndex == 5 then
				setting.ui.table.select_tab:setPosition(ccp(550, 460))
			end

			var_1_0 = true
		end
	end

	if conf.language ~= "cn" then
		if conf.language == "xm" and not var_1_0 then
			log.info("@@ 跳过")
		elseif not var_1_0 then
			setting.ui.table.btn_2:setVisible(false)
			setting.ui.table.tab_5:setVisible(false)
			setting.ui.table.btn_5:setPosition(550, 460)
			setting.ui.table.btn_4:setPosition(400, 460)
			setting.ui.table.btn_3:setPosition(250, 460)

			if arg_1_0 >= 3 then
				setting.ui.table.select_tab:setPosition(ccp(-50 + 150 * (arg_1_0 - 1), 460))
			end

			if arg_1_0 ~= 5 then
				setting.ui.table["tab_" .. arg_1_0]:setVisible(true)
			end
		else
			setting.ui.table.btn_2:setVisible(false)
			setting.ui.table.tab_4:setVisible(false)
			setting.ui.table.tab_5:setVisible(false)
			setting.ui.table.btn_5:setPosition(400, 460)
			setting.ui.table.btn_3:setPosition(250, 460)
			setting.ui.table.btn_2:setPosition(100, 460)

			if arg_1_0 == 2 then
				setting.ui.table.select_tab:setPosition(ccp(100, 460))
			elseif arg_1_0 == 3 then
				setting.ui.table.select_tab:setPosition(ccp(250, 460))
			elseif arg_1_0 == 5 then
				setting.ui.table.select_tab:setPosition(ccp(400, 460))
			end

			if arg_1_0 <= 3 then
				setting.ui.table["tab_" .. arg_1_0]:setVisible(true)
			end
		end
	end

	if conf.language == "xm" and not var_1_0 then
		log.info("@@ 新马三按钮")
		setting.ui.table.pane_2:removeAllChildrenWithCleanup(true)

		local var_1_4 = true

		if platform.getFlag() == "MOBILE_IPHONE" then
			var_1_4 = true
		end

		local var_1_5 = CCSprite:create("res/ui/playerInfo/setting/set_fk_view_bg.jpg")

		var_1_5:setPosition(441, 200)
		setting.ui.table.pane_2:addChild(var_1_5)

		local var_1_6 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy_jrgw.png")
		local var_1_7 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy_jrgw.png")
		local var_1_8 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy.png")

		var_1_8:setPosition(114.5, 82)
		var_1_7:addChild(var_1_8)

		local var_1_9 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy_gezx.png")
		local var_1_10 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy_gezx.png")
		local var_1_11 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy.png")

		var_1_11:setPosition(114.5, 82)
		var_1_10:addChild(var_1_11)

		local var_1_12 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy_wtfk.png")
		local var_1_13 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy_wtfk.png")
		local var_1_14 = CCSprite:create("res/ui/playerInfo/setting/sz_ujoy.png")

		var_1_14:setPosition(114.5, 82)
		var_1_13:addChild(var_1_14)

		local var_1_15 = CCMenuItemSprite:create(var_1_6, var_1_7)
		local var_1_16 = CCMenuItemSprite:create(var_1_9, var_1_10)
		local var_1_17 = CCMenuItemSprite:create(var_1_12, var_1_13)

		var_1_15:registerScriptTapHandler(function()
			ChannelManager:getInstance():transform("site", "")
		end)
		var_1_16:registerScriptTapHandler(function()
			ChannelManager:getInstance():transform("center", "")
		end)
		var_1_17:registerScriptTapHandler(function()
			ChannelManager:getInstance():transform("feedback", "")
		end)

		local var_1_18 = CCMenu:create()

		if var_1_4 then
			var_1_18:addChild(var_1_15)
		end

		var_1_18:addChild(var_1_16)
		var_1_18:addChild(var_1_17)
		var_1_18:setPosition(407.5, 155)
		var_1_18:alignItemsHorizontallyWithPadding(20)
		var_1_5:addChild(var_1_18)
	end
end

local function var_0_0(arg_5_0)
	local var_5_0 = {}
	local var_5_1 = {}
	local var_5_2 = 0
	local var_5_3

	if arg_5_0 == true then
		var_5_2, var_5_3 = 1, true
	end

	for iter_5_0 = 1, setting.constant.xiaofei.count do
		local var_5_4 = setting.constant.xiaofei[iter_5_0].key

		table.insert(var_5_0, var_5_2)
		table.insert(var_5_1, var_5_4)

		user.chargeItems[var_5_4].noDisturb = var_5_3

		setting.ui.update_xiaofei_signle_gou(iter_5_0)
	end

	cmgr.sendRequest(setting.control.receive_xf_result, actions.noDisturb, table.concat(var_5_0, ","), table.concat(var_5_1, ","))
end

function setting.control.click_xf_btn_all_yes()
	var_0_0(true)
end

function setting.control.click_xf_btn_all_no()
	var_0_0(false)
end

function setting.control.receive_xf_result()
	return
end

function setting.control.click_xf_single_item(arg_9_0, arg_9_1)
	local var_9_0 = setting.constant.xiaofei[arg_9_0].key

	cmgr.sendRequest(setting.control.receive_xf_result, actions.noDisturb, arg_9_1, var_9_0)

	if arg_9_1 == 0 then
		user.chargeItems[var_9_0].noDisturb = nil
	elseif arg_9_1 == 1 then
		user.chargeItems[var_9_0].noDisturb = true
	end

	setting.ui.update_xiaofei_signle_gou(arg_9_0)
end

function setting.control.click_yp_effect()
	if CCUserDefault:sharedUserDefault():getIntegerForKey(setting.constant.yinping.effect_mute_string) == 0 then
		CCUserDefault:sharedUserDefault():setIntegerForKey(setting.constant.yinping.effect_mute_string, 1)
		setting.ui.table.yp_gou_1:setVisible(true)
		amgr.setEffectEnable(true)
	else
		CCUserDefault:sharedUserDefault():setIntegerForKey(setting.constant.yinping.effect_mute_string, 0)
		setting.ui.table.yp_gou_1:setVisible(false)
		amgr.setEffectEnable(false)
	end

	CCUserDefault:sharedUserDefault():flush()
end

function setting.control.click_yp_music()
	if CCUserDefault:sharedUserDefault():getIntegerForKey(setting.constant.yinping.music_mute_string) == 0 then
		CCUserDefault:sharedUserDefault():setIntegerForKey(setting.constant.yinping.music_mute_string, 1)
		setting.ui.table.yp_gou_2:setVisible(true)
		amgr.setMusicEnable(true)
	else
		CCUserDefault:sharedUserDefault():setIntegerForKey(setting.constant.yinping.music_mute_string, 0)
		setting.ui.table.yp_gou_2:setVisible(false)
		amgr.setMusicEnable(false)
	end

	CCUserDefault:sharedUserDefault():flush()
end

function setting.control.click_dt_left()
	setting.ui.table.dt_select:setPosition(ccp(221, 200))

	user.battleSetting.changeSceneWhenSolo = false

	CCUserDefault:sharedUserDefault():setIntegerForKey(setting.constant.dantiao.switch_scene_string, 0)
	CCUserDefault:sharedUserDefault():flush()
end

function setting.control.click_dt_right()
	setting.ui.table.dt_select:setPosition(ccp(661, 200))

	user.battleSetting.changeSceneWhenSolo = true

	CCUserDefault:sharedUserDefault():setIntegerForKey(setting.constant.dantiao.switch_scene_string, 1)
	CCUserDefault:sharedUserDefault():flush()
end

function setting.control.receive_gift(arg_14_0)
	if arg_14_0.action.state == 1 then
		local var_14_0 = arg_14_0.action.data.rewards
		local var_14_1 = {}

		for iter_14_0, iter_14_1 in ipairs(var_14_0) do
			if iter_14_1.type == 42 then
				iter_14_1.type = 5
			elseif iter_14_1.type == 11 then
				iter_14_1.type = 7
			elseif iter_14_1.type == 21 then
				iter_14_1.type = 7
			elseif iter_14_1.type == 51 then
				iter_14_1.type = 10035
			elseif iter_14_1.type == 116 then
				iter_14_1.type = 55
			elseif iter_14_1.type == 119 then
				iter_14_1.type = 10033
			elseif iter_14_1.type == 48 then
				iter_14_1.type = 20
			elseif iter_14_1.type == 49 then
				iter_14_1.type = 48
			elseif iter_14_1.type == 126 then
				iter_14_1.type = 10030
			end

			var_14_1[iter_14_0] = {}
			var_14_1[iter_14_0].id = iter_14_1.type
			var_14_1[iter_14_0].value = iter_14_1.value
		end

		globalAction_gotResource(var_14_1)
		setting.control.request_gift()

		user.hasGift = false

		globalAction_checkGift()
	end
end

function setting.control.click_lb_bao(arg_15_0)
	cmgr.sendRequest(setting.control.receive_gift, actions.getGift, arg_15_0)
end

function setting.control.receive_giftInfo(arg_16_0)
	if arg_16_0.action.state == 1 then
		setting.control.data = arg_16_0.action.data.gifts

		setting.ui.update_giftList(setting.control.data)
	end
end

function setting.control.request_gift()
	cmgr.sendRequest(setting.control.receive_giftInfo, actions.getGiftInfo)
end

function setting.control.receive_giftByCode(arg_18_0)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.action.data.rewards) do
		var_18_0[iter_18_0] = {}
		var_18_0[iter_18_0].id = iter_18_1.type
		var_18_0[iter_18_0].value = iter_18_1.value

		if iter_18_1.type == 42 then
			var_18_0[iter_18_0].id = 5
		end
	end

	globalAction_gotResource(var_18_0)
end

function setting.control.request_giftByCode(arg_19_0)
	cmgr.sendRequest(setting.control.receive_giftByCode, actions.getGiftByCode, arg_19_0)
end

function setting.control.request_inviteGiftByCode(arg_20_0)
	local var_20_0 = PlatformHelper:getInstance():GetUDID(tostring(user.player.vId))

	cmgr.sendRequest(setting.control.receive_giftByCode, actions.getInviteGiftByCode, arg_20_0, var_20_0)
end

function setting.control.click_lb_commit()
	local var_21_0 = setting.ui.table.lb_editbox:getText()

	if var_21_0 ~= nil and var_21_0 ~= "" then
		if string.len(var_21_0) == 6 then
			setting.control.request_inviteGiftByCode(var_21_0)
		else
			setting.control.request_giftByCode(var_21_0)
		end
	end
end

function setting.control.click_fk_editBoxHandle(arg_22_0, arg_22_1)
	local var_22_0 = tolua.cast(arg_22_1, "CCEditBox")

	if arg_22_0 == "began" then
		setting.control.isPrinting = true

		var_22_0:setText(setting.ui.table.fk_input_label:getString())
	elseif arg_22_0 == "changed" then
		if setting.control.isPrinting == true then
			setting.ui.table.fk_input_label:setString(var_22_0:getText())
		end
	elseif arg_22_0 == "ended" then
		setting.control.isPrinting = false

		var_22_0:setText("")
		var_22_0:setPlaceHolder(language.get(143024))
	end
end

function setting.control.click_fk_commit()
	local var_23_0 = setting.ui.table.fk_input_label:getString()

	if string.find(var_23_0, "钓鱼岛") ~= nil or string.find(var_23_0, "尖阁列岛") ~= nil then
		smgr.showTipText(language.get(143040))

		return
	end

	if var_23_0 == "" then
		smgr.showTipText(language.get(143025))

		return
	end

	setting.ui.table.fk_input_label:setString("")
	emgr.feedback(var_23_0)
	smgr.showTipTextGreen(language.get(143026))
end
