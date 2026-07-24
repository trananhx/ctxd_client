setting = {}

tool.requireRes("playerInfo2/setting")

setting.ui = {}
setting.ui.pageIndex = 0
setting.ui.table = {}
setting.ui.touch = {}

function setting.ui.onTouch(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0 == CCTOUCHBEGAN then
		setting.ui.touch.x = arg_1_1
		setting.ui.touch.y = arg_1_2
	elseif arg_1_0 == CCTOUCHENDED and math.abs(setting.ui.touch.x - arg_1_1) < 20 and math.abs(setting.ui.touch.y - arg_1_2) < 20 then
		local var_1_0, var_1_1 = setting.ui.table.bg:getPosition()
		local var_1_2 = setting.ui.table.bg:getContentSize()
		local var_1_3 = arg_1_1 - (var_1_0 - var_1_2.width / 2)
		local var_1_4 = arg_1_2 - (var_1_1 - var_1_2.height / 2)

		if setting.ui.pageIndex == 1 and var_1_3 > 50 and var_1_3 < 885 and var_1_4 > 45 and var_1_4 < 300 then
			local var_1_5 = setting.ui.table.scrollView:getContentOffset().y
			local var_1_6 = math.floor((var_1_3 - 50) / 268)
			local var_1_7 = math.floor((setting.constant.xiaofei.count - 1) / 3) + 1
			local var_1_8 = (math.floor((var_1_5 - (var_1_4 - 45 - 16)) / 66) + var_1_7) * 3 + var_1_6 + 1

			if var_1_8 > 0 and var_1_8 <= setting.constant.xiaofei.count then
				local var_1_9 = setting.constant.xiaofei[var_1_8].key

				if user.chargeItems[var_1_9].noDisturb ~= nil then
					setting.control.click_xf_single_item(var_1_8, 0)
				else
					setting.control.click_xf_single_item(var_1_8, 1)
				end
			end
		end
	end

	return true
end

function setting.ui.update_giftList(arg_2_0)
	if setting.ui.table.scrollView_1 ~= nil then
		setting.ui.table.lb_bg:removeChild(setting.ui.table.scrollView_1, true)
	end

	if #arg_2_0 == 0 then
		return
	end

	local var_2_0 = createBaseLayer()
	local var_2_1 = true

	for iter_2_0 = 1, #arg_2_0 do
		local var_2_2 = arg_2_0[iter_2_0]
		local var_2_3

		if var_2_1 == true then
			var_2_3 = CCSprite:create("res/ui/playerInfo/setting/set_lb_list_bg1.jpg")
		else
			var_2_3 = CCSprite:create("res/ui/playerInfo/setting/set_lb_list_bg2.jpg")
		end

		var_2_1 = not var_2_1

		var_2_3:setPosition(ccp(400, 105 * (#arg_2_0 - iter_2_0) + 40))
		var_2_0:addChild(var_2_3)

		temp = CCLabelTTF:create(tostring(var_2_2.giftName), "Thonburi", "19")

		temp:setPosition(ccp(85, 52))
		temp:setColor(ccc3(188, 167, 145))
		var_2_3:addChild(temp)

		temp = CCLabelTTF:create(tostring(var_2_2.contents), "Thonburi", "18")

		temp:setAnchorPoint(ccp(0, 0.5))
		temp:setPosition(ccp(175, 52))
		temp:setColor(ccc3(188, 167, 145))
		var_2_3:addChild(temp)

		if tonumber(var_2_2.received) == 1 then
			temp = CCSprite:create("res/ui/playerInfo/setting/set_lb_got.png")

			temp:setPosition(720, 52)
			var_2_3:addChild(temp)
		else
			local var_2_4 = CCSprite:create("res/ui/playerInfo/setting/set_gift_icon_a.png")
			local var_2_5 = CCSprite:create("res/ui/playerInfo/setting/set_gift_icon_c.png")
			local var_2_6 = CCMenuItemSprite:create(var_2_4, var_2_5)

			var_2_6:setTag(var_2_2.id)
			var_2_6:registerScriptTapHandler(setting.control.click_lb_bao)
			var_2_6:setPosition(ccp(720, 52))

			local var_2_7 = CCMenu:create()

			var_2_7:setPosition(ccp(0, 0))
			var_2_7:addChild(var_2_6, 1, var_2_2.id)
			var_2_3:addChild(var_2_7)
		end
	end

	local var_2_8 = CCScrollView:create(CCSizeMake(800, 215))

	var_2_8:setContainer(var_2_0)
	var_2_8:setPosition(8, 76)
	var_2_8:setContentSize(CCSizeMake(800, 105 * #arg_2_0))
	var_2_8:setDirection(kCCScrollViewDirectionVertical)
	var_2_8:setContentOffset(ccp(0, -105 * #arg_2_0 + 215))

	setting.ui.table.scrollView_1 = var_2_8

	setting.ui.table.lb_bg:addChild(var_2_8, 1000)
end

function setting.ui.add_libao_list()
	local var_3_0 = CCScale9Sprite:create("res/ui/playerInfo/setting/set_fk_input_bg_small.jpg")
	local var_3_1 = CCEditBox:create(CCSizeMake(620, 50), var_3_0)

	var_3_1:setPosition(ccp(373, 91))
	var_3_1:setMaxLength(100)
	var_3_1:setFontSize(22)
	var_3_1:setReturnType(0)
	var_3_1:setFont("Thonburi", 30)
	var_3_1:setPlaceHolder(language.get(143037))
	var_3_1:setInputMode(kEditBoxInputModeAny)
	setting.ui.table.pane_4:addChild(var_3_1, 100)

	setting.ui.table.lb_editbox = var_3_1
end

function setting.ui.update_xiaofei_signle_gou(arg_4_0)
	local var_4_0 = setting.constant.xiaofei[arg_4_0].key
	local var_4_1 = "btn_check_1_a.png"

	if user.chargeItems[var_4_0] and user.chargeItems[var_4_0].noDisturb ~= nil then
		var_4_1 = "btn_check_1_on.png"
	end

	local var_4_2 = CCSprite:createWithSpriteFrameName(var_4_1)

	setting.ui.table["xf_gou" .. arg_4_0]:setDisplayFrame(var_4_2:displayFrame())
end

function setting.ui.update_xiaofei_gou()
	for iter_5_0 = 1, setting.constant.xiaofei.count do
		setting.ui.update_xiaofei_signle_gou(iter_5_0)
	end
end

function setting.ui.add_xiaofei_list()
	local var_6_0 = createBaseLayer()
	local var_6_1 = math.floor((setting.constant.xiaofei.count - 1) / 3) + 1

	for iter_6_0 = 1, setting.constant.xiaofei.count do
		local var_6_2 = math.floor((iter_6_0 - 1) / 3)
		local var_6_3 = iter_6_0 - var_6_2 * 3
		local var_6_4 = CCSprite:create("res/ui/playerInfo/setting/set_xf_list_bg.png")

		var_6_4:setPosition(ccp(265 * var_6_3 - 130, 66 * (var_6_1 - 1 - var_6_2) + 40))
		var_6_0:addChild(var_6_4)

		local var_6_5 = CCSprite:createWithSpriteFrameName("btn_check_1_a.png")

		var_6_5:setPosition(30, 33)
		var_6_4:addChild(var_6_5)

		setting.ui.table["xf_gou" .. iter_6_0] = var_6_5

		if conf.language == "vie" then
			local var_6_6 = CCLabelTTF:create(setting.constant.xiaofei[iter_6_0].name, "", 18)

			var_6_6:setAnchorPoint(ccp(0, 0.5))
			var_6_6:setPosition(ccp(60, 33))
			var_6_6:setDimensions(CCSizeMake(200, 0))
			var_6_6:setHorizontalAlignment(kCCTextAlignmentLeft)
			var_6_4:addChild(var_6_6)
		else
			local var_6_7 = CCLabelTTF:create(setting.constant.xiaofei[iter_6_0].name, "", "25")

			var_6_7:setAnchorPoint(ccp(0, 0.5))
			var_6_7:setPosition(ccp(60, 33))
			var_6_4:addChild(var_6_7)
		end
	end

	local var_6_8 = CCScrollView:create(CCSizeMake(835, 255))

	var_6_8:setContainer(var_6_0)
	var_6_8:setPosition(20, 10)
	var_6_8:setContentSize(CCSizeMake(835, 66 * var_6_1))
	var_6_8:setDirection(kCCScrollViewDirectionVertical)
	var_6_8:setContentOffset(ccp(0, -66 * var_6_1 + 255))

	setting.ui.table.scrollView = var_6_8

	setting.ui.table.xf_bg:addChild(var_6_8, 1000)
	setting.ui.table.xf_bg:setVisible(true)
	setting.ui.update_xiaofei_gou()
end

function setting.ui.yp_effect_valueChanged(arg_7_0, arg_7_1)
	if arg_7_1 == nil then
		return
	end

	local var_7_0 = tolua.cast(arg_7_1, "CCControlSlider"):getValue()

	CCUserDefault:sharedUserDefault():setDoubleForKey(setting.constant.yinping.effect_volume_string, var_7_0)
	CCUserDefault:sharedUserDefault():flush()
	amgr.setEffectsVolume(var_7_0)
end

function setting.ui.set_music_valueChanged(arg_8_0, arg_8_1)
	if arg_8_1 == nil then
		return
	end

	local var_8_0 = tolua.cast(arg_8_1, "CCControlSlider"):getValue()

	CCUserDefault:sharedUserDefault():setDoubleForKey(setting.constant.yinping.music_volume_string, var_8_0)
	CCUserDefault:sharedUserDefault():flush()
	amgr.setMusicVolume(var_8_0)
end

function setting.ui.add_yinping_bar()
	local var_9_0 = CCControlSlider:create("res/ui/playerInfo/setting/set_yp_degr_view_bg.png", "res/ui/playerInfo/setting/set_yp_degr_view_con.png", "res/ui/playerInfo/setting/set_yp_btn_a.png")

	var_9_0:setAnchorPoint(ccp(0.5, 0.5))
	var_9_0:setMinimumValue(0)
	var_9_0:setMaximumValue(1)
	var_9_0:setPosition(ccp(510, 150))
	var_9_0:addHandleOfControlEvent(setting.ui.yp_effect_valueChanged, CCControlEventValueChanged)

	setting.ui.table.yp_effect_slide = var_9_0

	setting.ui.table.pane_5:addChild(var_9_0, 1000)

	local var_9_1 = CCControlSlider:create("res/ui/playerInfo/setting/set_yp_degr_view_bg.png", "res/ui/playerInfo/setting/set_yp_degr_view_con.png", "res/ui/playerInfo/setting/set_yp_btn_a.png")

	var_9_1:setAnchorPoint(ccp(0.5, 0.5))
	var_9_1:setMinimumValue(0)
	var_9_1:setMaximumValue(1)
	var_9_1:setPosition(ccp(510, 260))
	var_9_1:addHandleOfControlEvent(setting.ui.set_music_valueChanged, CCControlEventValueChanged)

	setting.ui.table.yp_music_slide = var_9_1

	setting.ui.table.pane_5:addChild(var_9_1, 1000)

	if CCUserDefault:sharedUserDefault():getIntegerForKey(setting.constant.yinping.effect_mute_string) == 0 then
		setting.ui.table.yp_gou_1:setVisible(false)
	else
		setting.ui.table.yp_gou_1:setVisible(true)
	end

	if CCUserDefault:sharedUserDefault():getIntegerForKey(setting.constant.yinping.music_mute_string) == 0 then
		setting.ui.table.yp_gou_2:setVisible(false)
	else
		setting.ui.table.yp_gou_2:setVisible(true)
	end

	local var_9_2 = CCUserDefault:sharedUserDefault():getDoubleForKey(setting.constant.yinping.effect_volume_string)

	var_9_0:setValue(var_9_2)

	local var_9_3 = CCUserDefault:sharedUserDefault():getDoubleForKey(setting.constant.yinping.music_volume_string)

	var_9_1:setValue(var_9_3)
end

function setting.ui.add_diantiao_init()
	if CCUserDefault:sharedUserDefault():getIntegerForKey(setting.constant.dantiao.switch_scene_string) == 1 then
		setting.control.click_dt_right()
	else
		setting.control.click_dt_left()
	end
end

function setting.ui.add_fankui_init()
	setting.ui.table.fk_input_label:setDimensions(CCSizeMake(740, 180))
	setting.ui.table.fk_input_label:setHorizontalAlignment(kCCTextAlignmentLeft)
	setting.ui.table.fk_input_label:setVerticalAlignment(kCCVerticalTextAlignmentTop)

	if channelMgr.currentChannel == channels.androidFeiLiu or channelMgr.currentChannel == channels.androidFeiLiu2 or channelMgr.currentChannel == channels.iosFeiLiu or channelMgr.currentChannel == channels.iosFeiliu2 then
		setting.ui.table.fk_playerJiaoliu:setVisible(true)
		setting.ui.table.fk_qq2:setVisible(true)
	else
		setting.ui.table.fk_playerJiaoliu:setVisible(false)
		setting.ui.table.fk_qq2:setVisible(false)
	end

	local var_11_0 = CCScale9Sprite:create("res/ui/playerInfo/setting/set_fk_input_bg_small.jpg")
	local var_11_1 = CCEditBox:create(CCSizeMake(620, 50), var_11_0)

	var_11_1:setPosition(ccp(373, 91))
	var_11_1:setMaxLength(100)
	var_11_1:setFontSize(22)
	var_11_1:setReturnType(0)
	var_11_1:setFont("Thonburi", 30)
	var_11_1:setPlaceHolder(language.get(143024))
	var_11_1:setInputMode(kEditBoxInputModeAny)
	var_11_1:registerScriptEditBoxHandler(setting.control.click_fk_editBoxHandle)
	setting.ui.table.pane_2:addChild(var_11_1, 100)

	setting.ui.table.fk_editbox = var_11_1
end

function setting.ui.init()
	setting.ui.table.btn_1:registerScriptTapHandler(setting.control.click_btn_switch)
	setting.ui.table.btn_2:registerScriptTapHandler(setting.control.click_btn_switch)
	setting.ui.table.btn_3:registerScriptTapHandler(setting.control.click_btn_switch)
	setting.ui.table.btn_4:registerScriptTapHandler(setting.control.click_btn_switch)
	setting.ui.table.btn_5:registerScriptTapHandler(setting.control.click_btn_switch)
	setting.ui.table.xf_btn_all_yes:registerScriptTapHandler(setting.control.click_xf_btn_all_yes)
	setting.ui.table.xf_btn_all_no:registerScriptTapHandler(setting.control.click_xf_btn_all_no)
	setting.ui.table.yp_btn_1:registerScriptTapHandler(setting.control.click_yp_effect)
	setting.ui.table.yp_btn_2:registerScriptTapHandler(setting.control.click_yp_music)
	setting.ui.table.dt_bg_left:registerScriptTapHandler(setting.control.click_dt_left)
	setting.ui.table.dt_bg_right:registerScriptTapHandler(setting.control.click_dt_right)
	setting.ui.table.fk_btn_commit:registerScriptTapHandler(setting.control.click_fk_commit)
	setting.ui.table.lb_btn_commit:registerScriptTapHandler(setting.control.click_lb_commit)

	if conf.language == "vie" then
		setting.ui.table.yp_title_1:setDimensions(CCSizeMake(100, 0))
	end

	if conf.language == "xm" then
		setting.ui.table.lb_btn_commit:setVisible(false)
		setting.ui.table.lb_text_commit:setVisible(false)
	elseif channelMgr.getCurrentChannel() == channels.iosTw37Wan or channelMgr.getCurrentChannel() == channels.andTw37Wan then
		setting.ui.table.lb_btn_commit:setVisible(false)
		setting.ui.table.lb_text_commit:setVisible(false)
	else
		setting.ui.add_libao_list()
	end

	setting.ui.add_xiaofei_list()
	setting.ui.add_yinping_bar()
	setting.ui.add_diantiao_init()
	setting.ui.add_fankui_init()

	if setting.ui.pageIndex == 0 then
		setting.control.click_btn_switch(1)
	else
		local var_12_0 = setting.ui.pageIndex

		setting.ui.pageIndex = 0

		setting.control.click_btn_switch(var_12_0)
	end
end

function setting.ui.show()
	local var_13_0 = createBaseLayer()

	setting.ui.table = autoUI.initUI(var_13_0, getSettingData())
	setting.ui.table.layer = var_13_0

	var_13_0:registerScriptTouchHandler(setting.ui.onTouch)
	var_13_0:setTouchEnabled(true)

	var_13_0.onEnter = setting.ui.onEnter
	var_13_0.onExit = setting.ui.onExit

	setting.ui.init()
	setting.control.request_gift()

	return var_13_0
end

function setting.ui.onEnter()
	if channelMgr.currentChannel ~= channels.iosAppstore and channelMgr.currentChannel == channels.iosappstore30lv then
		-- block empty
	end
end

function setting.ui.onExit()
	if channelMgr.currentChannel ~= channels.iosAppstore and channelMgr.currentChannel == channels.iosappstore30lv then
		-- block empty
	end
end
