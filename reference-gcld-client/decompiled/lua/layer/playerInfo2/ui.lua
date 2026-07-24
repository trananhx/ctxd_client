require("lua/component/labelPage")

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.tagFontSize = -4
else
	var_0_0.tagFontSize = 0
end

playerInfo2 = {}

tool.requireRes("playerInfo2")

playerInfo2.ui = {}
playerInfo2.ui.table = {}

function playerInfo2.ui.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open, false, true)

	local var_1_0 = createBaseLayer()

	playerInfo2.ui.table = autoUI.initUI(var_1_0, getPlayerInfo2Data())

	playerInfo2.ui.table.closeItem:registerScriptTapHandler(function()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end
	end)
	playerInfo2.control.initControl(var_1_0)

	local var_1_1 = {}
	local var_1_2 = 1
	local var_1_3 = true
	local var_1_4 = arg_1_0 == 1 and true or false
	local var_1_5 = {
		name = language.get(140001),
		callback = playerInfo2.control.onActorInfoClick,
		default = var_1_4
	}

	table.insert(var_1_1, var_1_2, var_1_5)

	local var_1_6 = var_1_2 + 1
	local var_1_7 = false
	local var_1_8 = arg_1_0 == 2 and true or false
	local var_1_9 = {
		name = language.get(140002),
		callback = playerInfo2.control.onRechargeClick,
		default = var_1_8
	}

	table.insert(var_1_1, var_1_6, var_1_9)

	local var_1_10 = var_1_6 + 1
	local var_1_11 = false
	local var_1_12 = arg_1_0 == 3 and true or false
	local var_1_13 = {
		name = language.get(140003),
		callback = playerInfo2.control.onSettingClick,
		default = var_1_12
	}

	table.insert(var_1_1, var_1_10, var_1_13)

	local var_1_14 = var_1_10 + 1
	local var_1_15 = false

	log.info("invite!!!", channelMgr.currentChannel, user.openInviteCode, user.haveInvite)

	local var_1_16 = false

	if channelMgr.currentChannel == channels.iosAppstore and user.openInviteCode == 1 then
		local var_1_17 = versionUpdateConstant.file.version

		reload(var_1_17)

		local var_1_18 = sys_version

		if var_1_18 and var_1_18.client and tool.cmpVersion("1.4.9.9", var_1_18.client) then
			var_1_16 = true
		end
	end

	if user.player.playerLv < 7 then
		if var_1_16 or user.haveInviteCodeActivity == 1 then
			local var_1_19 = arg_1_0 == 4 and true or false
			local var_1_20 = {
				name = language.get(140004),
				callback = playerInfo2.control.onInviteClick,
				default = var_1_19
			}

			table.insert(var_1_1, var_1_14, var_1_20)

			var_1_14 = var_1_14 + 1

			local var_1_21 = false
		end
	elseif var_1_16 or user.haveInviteCodeActivity == 1 then
		local var_1_22 = arg_1_0 == 5 and true or false
		local var_1_23 = {
			name = language.get(140004),
			callback = playerInfo2.control.onInviteClick,
			default = var_1_22
		}

		table.insert(var_1_1, var_1_14, var_1_23)

		local var_1_24 = var_1_14 + 1
		local var_1_25 = false
	end

	local var_1_26 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_26:setPreferredSize(CCSizeMake(960, 581))
	var_1_26:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_26, 0)

	local var_1_27 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		local var_1_28 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_29 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_30 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26 + var_0_0.tagFontSize)

		var_1_30:setDimensions(CCSizeMake(150, 0))
		var_1_30:setColor(ccc3(255, 255, 209))
		var_1_30:setPosition(ccp(var_1_28:getContentSize().width * 0.5, var_1_28:getContentSize().height * 0.4))
		var_1_28:addChild(var_1_30)

		local var_1_31 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26 + var_0_0.tagFontSize)

		var_1_31:setDimensions(CCSizeMake(150, 0))
		var_1_31:setColor(ccc3(204, 187, 135))
		var_1_31:setPosition(ccp(var_1_29:getContentSize().width * 0.5, var_1_29:getContentSize().height * 0.4))
		var_1_29:addChild(var_1_31)

		local var_1_32 = visibleSize.width / 2 - var_1_26:getContentSize().width / 2 + var_1_28:getContentSize().width * iter_1_0 - var_1_28:getContentSize().width * 0.5 + 30
		local var_1_33 = visibleSize.height / 2 + var_1_26:getContentSize().height / 2 - 2

		var_1_27:addLabelButton(var_1_29, var_1_28, ccp(var_1_32, var_1_33), iter_1_1.callback, iter_1_1.default)
	end

	playerInfo2.ui.table.closeItem:setScale(2)

	local var_1_34 = visibleSize.width / 2 + var_1_26:getContentSize().width / 2 - playerInfo2.ui.table.closeItem:getContentSize().width
	local var_1_35 = visibleSize.height / 2 + var_1_26:getContentSize().height / 2

	playerInfo2.ui.table.closeItem:setPosition(ccp(var_1_34 - 5, var_1_35 - 6))
	var_1_0:addChild(var_1_27)

	local function var_1_36(arg_3_0, arg_3_1, arg_3_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_36, false, true)

	local var_1_37 = smgr.getLayer("topLayer")

	var_1_37:removeAllChildrenWithCleanup(true)
	var_1_37:addChild(var_1_0)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end
end
