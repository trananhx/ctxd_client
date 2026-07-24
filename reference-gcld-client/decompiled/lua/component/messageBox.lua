require("lua/common/tool")
require("lua/component/CCStrokeLabelTTF")

messageBox = {}

local var_0_0 = "Thonburi"
local var_0_1 = 10001
local var_0_2
local var_0_3 = conf.language == "vie" and 20 or 25

function messageBox.createMessageBox(arg_1_0, arg_1_1, arg_1_2)
	tool.assert(table.getn(arg_1_2) < 3, true)

	local var_1_0 = CCSprite:create("res/ui/messagebox/atten_view_bg.png")
	local var_1_1 = CCStrokeLabelTTF:create(arg_1_0, var_0_0, 20)

	var_1_1:setPosition(ccp(var_1_0:getContentSize().width / 2, var_1_0:getContentSize().height - 23))
	var_1_1:setVisible(false)
	var_1_0:addChild(var_1_1)

	local var_1_2 = CCSprite:create("res/ui/messagebox/atten_tit.png")

	var_1_2:setPosition(ccp(var_1_0:getContentSize().width / 2, var_1_0:getContentSize().height - 30))
	var_1_0:addChild(var_1_2)

	local var_1_3 = CCMenu:create()

	for iter_1_0, iter_1_1 in pairs(arg_1_2) do
		local var_1_4 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("btn_green_a.png"))
		local var_1_5 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("btn_green_click.png"))
		local var_1_6 = CCStrokeLabelTTF:create(iter_1_1.text, var_0_0, 20, 2, colorText[10005])
		local var_1_7 = CCStrokeLabelTTF:create(iter_1_1.text, var_0_0, 20, 2, colorText[10005])

		var_1_6:setColor(colorText[10004])
		var_1_7:setColor(colorText[10004])
		var_1_4:addChild(var_1_6, 20)
		var_1_5:addChild(var_1_7, 20)
		var_1_6:setPosition(ccp(var_1_4:getContentSize().width / 2, var_1_4:getContentSize().height / 2))
		var_1_7:setPosition(ccp(var_1_4:getContentSize().width / 2, var_1_4:getContentSize().height / 2))

		local var_1_8 = CCMenuItemSprite:create(var_1_4, var_1_5)

		if iter_1_1.callBack then
			var_1_8:registerScriptTapHandler(iter_1_1.callBack)
		end

		var_1_3:addChild(var_1_8, 15)
	end

	local var_1_9 = CCStrokeLabelTTF:create(arg_1_1, var_0_0, var_0_3)

	var_1_9:setDimensions(CCSizeMake(480, 0))
	var_1_9:setHorizontalAlignment(kCCTextAlignmentCenter)
	var_1_9:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_1_9:setPosition(ccp(var_1_0:getContentSize().width / 2, 200))
	var_1_0:addChild(var_1_9)
	var_1_3:alignItemsHorizontallyWithPadding(50)
	var_1_3:setPosition(ccp(var_1_0:getContentSize().width / 2, 50))
	var_1_0:addChild(var_1_3, 15)
	var_1_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	return var_1_0
end

function messageBox.alert(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 == "" then
		return
	end

	local var_2_0 = {}
	local var_2_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_2_1:setTouchEnabled(true)
	var_2_1:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local function var_2_2()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_2_1, true)

		if arg_2_2 then
			arg_2_2()
		end
	end

	local var_2_3 = {
		{
			text = language.get(10001),
			callBack = var_2_2
		}
	}
	local var_2_4 = messageBox.createMessageBox(arg_2_0, arg_2_1, var_2_3)

	var_2_4:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_2_1:addChild(var_2_4)
	smgr.rootLayer:addChild(var_2_1, 60000)
	amgr.playEffect(enumAudioFile.ui_dialog_open)
end

function messageBox.countDownAlert(arg_5_0, arg_5_1)
	arg_5_1 = arg_5_1 or 3000

	if arg_5_0 == "" then
		return
	end

	local var_5_0 = {}
	local var_5_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_5_1:setTouchEnabled(true)
	var_5_1:registerScriptTouchHandler(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == CCTOUCHBEGAN then
			return true
		elseif arg_6_0 == CCTOUCHMOVED then
			return true
		elseif arg_6_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local function var_5_2()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_5_1, true)
	end

	local var_5_3 = {}
	local var_5_4 = createTimerLabel(arg_5_1, "@S", "Thonburi", 32, var_5_2, nil, nil, colorTips.red)
	local var_5_5 = messageBox.createMessageBox(language.get(10003), arg_5_0, var_5_3)

	var_5_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_5_5:addChild(var_5_4)
	var_5_4:setPosition(ccp(var_5_5:getContentSize().width / 2, 55))
	var_5_1:addChild(var_5_5)
	smgr.rootLayer:addChild(var_5_1, 60000)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	return var_5_2
end

function messageBox.confirm(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_0 == "" then
		return
	end

	local var_8_0 = {}
	local var_8_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_8_1:setTouchEnabled(true)
	var_8_1:registerScriptTouchHandler(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == CCTOUCHBEGAN then
			return true
		elseif arg_9_0 == CCTOUCHMOVED then
			return true
		elseif arg_9_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local function var_8_2()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_8_1, true)

		if arg_8_3 then
			arg_8_3()
		end
	end

	local function var_8_3()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_8_1, true)

		if arg_8_1 then
			arg_8_1()
		end
	end

	local var_8_4 = {
		{
			text = arg_8_2 or language.get(10001),
			callBack = var_8_3
		},
		{
			text = language.get(10002),
			callBack = var_8_2
		}
	}
	local var_8_5 = messageBox.createMessageBox(language.get(10003), arg_8_0, var_8_4)

	var_8_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
	var_8_1:addChild(var_8_5)
	smgr.rootLayer:addChild(var_8_1, 60000)
	amgr.playEffect(enumAudioFile.ui_dialog_open)
end

function messageBox.confirmWithCheckbox(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if user.confirmItems[arg_12_2] ~= nil and user.confirmItems[arg_12_2].noDisturb == true then
		arg_12_3()

		return
	end

	local var_12_0 = 0
	local var_12_1 = CCMenu:create()
	local var_12_2 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_12_2:setTouchEnabled(true)
	var_12_2:registerScriptTouchHandler(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == CCTOUCHBEGAN then
			return true
		elseif arg_13_0 == CCTOUCHMOVED then
			return true
		elseif arg_13_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local function var_12_3()
		local var_14_0 = tolua.cast(var_12_1:getChildByTag(var_0_1), "CCMenuItemSprite")

		if var_14_0 then
			if var_12_0 == 0 then
				var_14_0:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_on.png"))

				var_12_0 = 1
			else
				var_14_0:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_a.png"))

				var_12_0 = 0
			end
		end
	end

	local var_12_4

	local function var_12_5()
		arg_12_3()

		if var_12_0 == 1 then
			user.confirmItems[arg_12_2] = {
				noDisturb = true
			}
		end

		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_12_2, true)
	end

	local function var_12_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_12_2, true)
	end

	log.debug(arg_12_1)

	local var_12_7 = {
		{
			text = language.get(10001),
			callBack = var_12_5
		},
		{
			text = language.get(10002),
			callBack = var_12_6
		}
	}
	local var_12_8 = messageBox.createMessageBox(arg_12_0, arg_12_1, var_12_7)
	local var_12_9
	local var_12_10 = CCSprite:createWithSpriteFrameName("btn_check_1_a.png")

	if false then
		var_12_10 = CCSprite:createWithSpriteFrameName("btn_check_1_on.png")
	end

	local var_12_11 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("unite_view_click.png"))
	local var_12_12 = CCSprite:createWithSpriteFrameName("btn_check_1_on.png")
	local var_12_13 = CCStrokeLabelTTF:create(language.get(10201), "Thonburi", var_0_3)
	local var_12_14 = CCMenuItemSprite:create(var_12_10, var_12_12)

	var_12_14:registerScriptTapHandler(var_12_3)
	var_12_1:addChild(var_12_14, 15, var_0_1)
	var_12_1:setPosition(ccp(var_12_8:getContentSize().width / 2 - 38, 140))
	var_12_8:addChild(var_12_1, 15)
	var_12_13:setPosition(ccp(var_12_8:getContentSize().width / 2 + 30, 140))
	var_12_8:addChild(var_12_13, 15)
	var_12_2:addChild(var_12_8)
	smgr.rootLayer:addChild(var_12_2, 60000)
	amgr.playEffect(enumAudioFile.ui_dialog_open)
end

function messageBox.showChargeWin(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	require("lua/layer/chargeItems/constant")

	if user.chargeItems[arg_17_2] ~= nil and user.chargeItems[arg_17_2].noDisturb == true then
		arg_17_3()

		return
	end

	local var_17_0 = 0
	local var_17_1 = CCMenu:create()
	local var_17_2 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_17_2:setTouchEnabled(true)
	var_17_2:registerScriptTouchHandler(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == CCTOUCHBEGAN then
			return true
		elseif arg_18_0 == CCTOUCHMOVED then
			return true
		elseif arg_18_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local function var_17_3()
		local var_19_0 = tolua.cast(var_17_1:getChildByTag(var_0_1), "CCMenuItemSprite")

		if var_19_0 then
			if var_17_0 == 0 then
				var_19_0:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_on.png"))

				var_17_0 = 1
			else
				var_19_0:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_a.png"))

				var_17_0 = 0
			end
		end
	end

	local var_17_4

	local function var_17_5()
		arg_17_3()

		if var_17_0 == 1 then
			cmgr.sendRequest(nil, actions.noDisturb, 1, arg_17_2)

			user.chargeItems[arg_17_2].noDisturb = true
		end

		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_17_2, true)
	end

	local function var_17_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_17_2, true)
		eventManager.dispatchEvent("chargeWinCancel")
	end

	arg_17_1 = string.gsub(arg_17_1, "${gold}", tostring(user.chargeItems[arg_17_2].cost))

	log.debug(arg_17_1)

	local var_17_7 = {
		{
			text = language.get(10001),
			callBack = var_17_5
		},
		{
			text = language.get(10002),
			callBack = var_17_6
		}
	}
	local var_17_8 = messageBox.createMessageBox(arg_17_0, arg_17_1, var_17_7)
	local var_17_9
	local var_17_10 = CCSprite:createWithSpriteFrameName("btn_check_1_a.png")

	if false then
		var_17_10 = CCSprite:createWithSpriteFrameName("btn_check_1_on.png")
	end

	local var_17_11 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("unite_view_click.png"))
	local var_17_12 = CCSprite:createWithSpriteFrameName("btn_check_1_on.png")
	local var_17_13 = CCStrokeLabelTTF:create(language.get(10201), "Thonburi", var_0_3)
	local var_17_14 = CCStrokeLabelTTF:create(language.get(226069), "Thonburi", 20)
	local var_17_15 = CCMenuItemSprite:create(var_17_10, var_17_12)

	var_17_15:registerScriptTapHandler(var_17_3)
	var_17_1:addChild(var_17_15, 15, var_0_1)

	if conf.language == "kr" then
		var_17_1:setPosition(ccp(var_17_8:getContentSize().width / 2 - 38 - 70, 140))
	elseif conf.language == "vie" then
		var_17_1:setPosition(ccp(var_17_8:getContentSize().width / 2 - 38 - 60, 140))
	elseif conf.language == "tha" then
		var_17_1:setPosition(ccp(var_17_8:getContentSize().width / 2 - 38 - 60, 140))
	else
		var_17_1:setPosition(ccp(var_17_8:getContentSize().width / 2 - 38, 140))
	end

	var_17_8:addChild(var_17_1, 15)
	var_17_13:setPosition(ccp(var_17_8:getContentSize().width / 2 + 30, 140))
	var_17_8:addChild(var_17_13, 15)
	var_17_14:setPosition(ccp(var_17_8:getContentSize().width / 2, 110))
	var_17_8:addChild(var_17_14, 15)
	var_17_2:addChild(var_17_8)
	smgr.rootLayer:addChild(var_17_2, 60000)
	amgr.playEffect(enumAudioFile.ui_dialog_open)
end

function messageBox.showChargeWinWithData(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	require("lua/layer/chargeItems/constant")

	if user.chargeItems[arg_22_2] ~= nil and user.chargeItems[arg_22_2].noDisturb == true then
		arg_22_3(arg_22_4)

		return
	end

	local var_22_0 = 0
	local var_22_1 = CCMenu:create()
	local var_22_2 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_22_2:setTouchEnabled(true)
	var_22_2:registerScriptTouchHandler(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == CCTOUCHBEGAN then
			return true
		elseif arg_23_0 == CCTOUCHMOVED then
			return true
		elseif arg_23_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local function var_22_3()
		local var_24_0 = tolua.cast(var_22_1:getChildByTag(var_0_1), "CCMenuItemSprite")

		if var_24_0 then
			if var_22_0 == 0 then
				var_24_0:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_on.png"))

				var_22_0 = 1
			else
				var_24_0:setNormalImage(CCSprite:createWithSpriteFrameName("btn_check_1_a.png"))

				var_22_0 = 0
			end
		end
	end

	local var_22_4

	local function var_22_5()
		arg_22_3(arg_22_4)

		if var_22_0 == 1 then
			cmgr.sendRequest(nil, actions.noDisturb, 1, arg_22_2)

			user.chargeItems[arg_22_2].noDisturb = true
		end

		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_22_2, true)
	end

	local function var_22_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.rootLayer:removeChild(var_22_2, true)
		eventManager.dispatchEvent("chargeWinCancel")
	end

	arg_22_1 = string.gsub(arg_22_1, "${gold}", tostring(user.chargeItems[arg_22_2].cost))

	log.debug(arg_22_1)

	local var_22_7 = {
		{
			text = language.get(10001),
			callBack = var_22_5
		},
		{
			text = language.get(10002),
			callBack = var_22_6
		}
	}
	local var_22_8 = messageBox.createMessageBox(arg_22_0, arg_22_1, var_22_7)
	local var_22_9
	local var_22_10 = CCSprite:createWithSpriteFrameName("btn_check_1_a.png")

	if false then
		var_22_10 = CCSprite:createWithSpriteFrameName("btn_check_1_on.png")
	end

	local var_22_11 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("unite_view_click.png"))
	local var_22_12 = CCSprite:createWithSpriteFrameName("btn_check_1_on.png")
	local var_22_13 = CCStrokeLabelTTF:create(language.get(10201), "Thonburi", var_0_3)
	local var_22_14 = CCStrokeLabelTTF:create(language.get(226069), "Thonburi", 20)
	local var_22_15 = CCMenuItemSprite:create(var_22_10, var_22_12)

	var_22_15:registerScriptTapHandler(var_22_3)
	var_22_1:addChild(var_22_15, 15, var_0_1)

	if conf.language == "kr" then
		var_22_1:setPosition(ccp(var_22_8:getContentSize().width / 2 - 38 - 70, 130))
	elseif conf.language == "vie" then
		var_22_1:setPosition(ccp(var_22_8:getContentSize().width / 2 - 38 - 60, 130))
	elseif conf.language == "tha" then
		var_22_1:setPosition(ccp(var_22_8:getContentSize().width / 2 - 38 - 60, 130))
	else
		var_22_1:setPosition(ccp(var_22_8:getContentSize().width / 2 - 38, 130))
	end

	var_22_8:addChild(var_22_1, 15)
	var_22_13:setPosition(ccp(var_22_8:getContentSize().width / 2 + 30, 140))
	var_22_8:addChild(var_22_13, 15)
	var_22_14:setPosition(ccp(var_22_8:getContentSize().width / 2, 110))
	var_22_8:addChild(var_22_14, 15)
	var_22_2:addChild(var_22_8)
	smgr.rootLayer:addChild(var_22_2, 60000)
	amgr.playEffect(enumAudioFile.ui_dialog_open)
end

function messageBox.error(arg_27_0)
	return messageBox.alert("ERROR", arg_27_0)
end

function messageBox.createGoldWarning(arg_28_0)
	local var_28_0 = language.get(10003)
	local var_28_1 = arg_28_0 or language.get(10202)

	require("lua/layer/playerInfo2/ui")
	messageBox.confirm(var_28_1, function()
		playerInfo2.ui.show(2)
	end, language.get(10203))
end

function messageBox.showPicPopup(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = false
	local var_30_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_30_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

	local var_30_2 = CCSprite:create(arg_30_1)

	var_30_1:addChild(var_30_2)

	local var_30_3 = CCSprite:create()

	var_30_3:setContentSize(CCSizeMake(56, 48))

	local var_30_4 = CCSprite:create()

	var_30_4:setContentSize(CCSizeMake(56, 48))

	local var_30_5 = CCMenuItemSprite:create(var_30_3, var_30_4)

	var_30_5:setPosition(-30, -33)
	var_30_5:registerScriptTapHandler(function()
		smgr.getLayer("tipLayer"):removeChild(var_30_1, true)

		if arg_30_2 and var_30_0 then
			CCUserDefault:sharedUserDefault():setStringForKey("popUpWindowCheckBoxSetDate_" .. arg_30_0, os.date("%Y/%m/%d"))
			CCUserDefault:sharedUserDefault():flush()
		end
	end)

	local var_30_6 = CCMenu:create()

	var_30_6:setPosition(ccp(var_30_2:getContentSize().width, var_30_2:getContentSize().height))
	var_30_6:addChild(var_30_5)
	var_30_2:addChild(var_30_6)

	if arg_30_2 then
		local var_30_7 = CCSprite:create("res/ui/popup/check.png")
		local var_30_8 = CCSprite:create()

		var_30_8:setContentSize(CCSizeMake(39, 39))

		local var_30_9
		local var_30_10 = CCMenuItemSprite:create(var_30_8, var_30_8)

		var_30_10:registerScriptTapHandler(function()
			var_30_0 = not var_30_0

			if var_30_0 then
				local var_32_0 = CCSprite:create("res/ui/popup/check.png")

				var_30_10:setNormalImage(var_32_0)
				var_30_10:setSelectedImage(var_32_0)
			else
				local var_32_1 = CCSprite:create()

				var_32_1:setContentSize(CCSizeMake(39, 39))
				var_30_10:setNormalImage(var_32_1)
				var_30_10:setSelectedImage(var_32_1)
			end
		end)

		local var_30_11 = CCMenu:create()

		var_30_11:setPosition(ccp(var_30_2:getContentSize().width * 0.4 + 16, var_30_2:getContentSize().height * 0.2 - 52))
		var_30_2:addChild(var_30_11)
		var_30_11:addChild(var_30_10)
	end

	local function var_30_12(arg_33_0, arg_33_1, arg_33_2)
		return true
	end

	var_30_1:registerScriptTouchHandler(var_30_12, false, true)
	var_30_1:setTouchEnabled(true)
	smgr.getLayer("tipLayer"):addChild(var_30_1)
end

function messageBox.popUpWindow1()
	local var_34_0 = {
		date = os.date("%Y/%m/%d")
	}

	var_34_0.y = string.sub(var_34_0.date, 1, 4)
	var_34_0.m = string.sub(var_34_0.date, 6, 7)
	var_34_0.d = string.sub(var_34_0.date, 9, 10)

	local var_34_1 = CCUserDefault:sharedUserDefault():getStringForKey("popUpWindowCheckBoxSetDate_" .. 1)
	local var_34_2

	if var_34_1 ~= nil then
		var_34_2 = {
			date = var_34_1
		}
		var_34_2.y = string.sub(var_34_2.date, 1, 4)
		var_34_2.m = string.sub(var_34_2.date, 6, 7)
		var_34_2.d = string.sub(var_34_2.date, 9, 10)
	end

	if var_34_2 == nil or var_34_2.date ~= var_34_0.date then
		messageBox.showPicPopup(1, "res/ui/popup/popup1.png", true)
	end
end

function messageBox.popUpWindow2()
	local var_35_0 = {
		date = os.date("%Y/%m/%d")
	}

	var_35_0.y = string.sub(var_35_0.date, 1, 4)
	var_35_0.m = string.sub(var_35_0.date, 6, 7)
	var_35_0.d = string.sub(var_35_0.date, 9, 10)

	local var_35_1 = CCUserDefault:sharedUserDefault():getStringForKey("popUpWindowCheckBoxSetDate_" .. 2)
	local var_35_2

	if var_35_1 ~= nil then
		var_35_2 = {
			date = var_35_1
		}
		var_35_2.y = string.sub(var_35_2.date, 1, 4)
		var_35_2.m = string.sub(var_35_2.date, 6, 7)
		var_35_2.d = string.sub(var_35_2.date, 9, 10)
	end

	if var_35_2 == nil or var_35_2.date ~= var_35_0.date then
		messageBox.showPicPopup(2, "res/ui/popup/popup2.png", true)
	end
end

return messageBox
