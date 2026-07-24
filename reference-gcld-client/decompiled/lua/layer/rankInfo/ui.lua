require("lua/component/labelPage")
tool.requireRes("rankInfo")

rankInfoUI = {}
rankInfoUI.uiTable = {}

local var_0_0 = rankInfoControl
local var_0_1 = {}

if conf.language == "vie" then
	var_0_1.tagLabelSize = -4
else
	var_0_1.tagLabelSize = 0
end

function rankInfoUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	local var_1_0 = true

	if channelMgr.getCurrentChannel() == channels.iosAppstore or channelMgr.getCurrentChannel() == channels.iosplay800 or channelMgr.getCurrentChannel() == channels.iosAppstore or channelMgr.getCurrentChannel() == channels.iosappstore30lv or channelMgr.getCurrentChannel() == channels.iosmouding then
		local var_1_1 = versionUpdateConstant.file.version

		reload(var_1_1)

		local var_1_2 = sys_version

		if game.newVersion.appStoreCode == var_1_2.appStoreCode then
			var_1_0 = false
		end
	end

	if user.getFunc(32) and var_1_0 then
		arg_1_0 = arg_1_0 or 1
	else
		arg_1_0 = arg_1_0 or 2
	end

	local var_1_3 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_3:setPreferredSize(CCSizeMake(960, 581))
	var_1_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 28))

	rankInfoUI.uiTable = autoUI.initUI(var_1_3, getRankInfoData())

	local function var_1_4()
		amgr.playEffect(enumAudioFile.ui_dialog_close)

		local var_2_0 = smgr.getLayer("topLayer")

		log.info("should remove child window")
		var_2_0:removeChild(var_1_3, true)
		guide.control.setCurrentMarkTrace(nil)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		eventManager.unregisterEvent("task_finished", task_finished)
	end

	local function var_1_5(arg_3_0)
		if arg_3_0 == 1 then
			-- block empty
		elseif arg_3_0 == 84 then
			var_1_4()
		end
	end

	eventManager.registerEvent("task_finished", var_1_5)
	rankInfoUI.uiTable.closeItem:registerScriptTapHandler(var_1_4)
	var_0_0.initControl(var_1_3)

	local var_1_6 = {}
	local var_1_7 = 1
	local var_1_8 = true
	local var_1_9 = true

	if user.getFunc(32) and var_1_0 then
		local var_1_10 = arg_1_0 == 1 and true or false
		local var_1_11 = {
			name = language.get(110001),
			callback = function()
				var_0_0.onFeatRankLabelClick()

				if not var_1_9 then
					guide.control.setCurrentMarkTrace("panel:6:1")
				end
			end,
			default = var_1_10
		}

		var_1_11.pageIndex = 1

		table.insert(var_1_6, var_1_7, var_1_11)

		var_1_7 = var_1_7 + 1

		local var_1_12 = false
	end

	if user.getFunc(14) then
		local var_1_13 = arg_1_0 == 2 and true or false
		local var_1_14 = {
			name = language.get(110002),
			callback = function()
				var_0_0.onOfficerLabelClick()

				if not var_1_9 then
					guide.control.setCurrentMarkTrace("panel:6:2")
				end
			end,
			default = var_1_13
		}

		var_1_14.pageIndex = 2

		table.insert(var_1_6, var_1_7, var_1_14)

		var_1_7 = var_1_7 + 1

		local var_1_15 = false
	end

	if user.getFunc(32) and var_1_0 then
		local var_1_16 = arg_1_0 == 3 and true or false
		local var_1_17 = {
			name = language.get(110003),
			callback = function()
				var_0_0.onChallengeRankLabelClick()

				if not var_1_9 then
					guide.control.setCurrentMarkTrace("panel:6:3")
				end
			end,
			default = var_1_16
		}

		var_1_17.pageIndex = 3

		table.insert(var_1_6, var_1_7, var_1_17)

		var_1_7 = var_1_7 + 1

		local var_1_18 = false
	end

	if user.getFunc(32) and var_1_0 then
		local var_1_19 = arg_1_0 == 4 and true or false
		local var_1_20 = {
			name = language.get(110004),
			callback = function()
				var_0_0.onStormRankLabelClick()

				if not var_1_9 then
					guide.control.setCurrentMarkTrace("panel:6:4")
				end
			end,
			default = var_1_19
		}

		var_1_20.pageIndex = 4

		table.insert(var_1_6, var_1_7, var_1_20)

		var_1_7 = var_1_7 + 1

		local var_1_21 = false
	end

	if user.workerOpen then
		local var_1_22 = arg_1_0 == 5 and true or false
		local var_1_23 = {
			name = language.get("222015_buildingTech"),
			callback = function()
				var_0_0.onWorkListLabelClick()

				if not var_1_9 then
					guide.control.setCurrentMarkTrace("panel:6:4")
				end
			end,
			default = var_1_22
		}

		var_1_23.pageIndex = 5

		table.insert(var_1_6, var_1_7, var_1_23)

		local var_1_24 = var_1_7 + 1
		local var_1_25 = false
	end

	local var_1_26 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_6) do
		local var_1_27 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_28 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_29 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26 + var_0_1.tagLabelSize)

		var_1_29:setColor(ccc3(255, 255, 209))
		var_1_29:setPosition(ccp(var_1_27:getContentSize().width * 0.5, var_1_27:getContentSize().height * 0.4))

		if conf.language == "vie" then
			var_1_29:setDimensions(CCSizeMake(120, 0))
		end

		var_1_27:addChild(var_1_29)

		local var_1_30 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26 + var_0_1.tagLabelSize)

		var_1_30:setColor(ccc3(204, 187, 135))
		var_1_30:setPosition(ccp(var_1_28:getContentSize().width * 0.5, var_1_28:getContentSize().height * 0.4))

		if conf.language == "vie" then
			var_1_30:setDimensions(CCSizeMake(120, 0))
		end

		var_1_28:addChild(var_1_30)

		local var_1_31 = var_1_27:getContentSize().width * iter_1_0 - var_1_27:getContentSize().width * 0.5 + 30
		local var_1_32 = var_1_3:getContentSize().height + var_1_27:getContentSize().height * 0.5 - 2
		local var_1_33 = var_1_26:addLabelButton(var_1_28, var_1_27, ccp(var_1_31, var_1_32), iter_1_1.callback, iter_1_1.default)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_33
	end

	closeItem = rankInfoUI.uiTable.closeItem

	closeItem:setScale(2)

	local var_1_34 = closeItem:getContentSize()
	local var_1_35 = var_1_3:getContentSize()
	local var_1_36 = var_1_35.width - var_1_34.width
	local var_1_37 = var_1_35.height + var_1_34.height - 5

	closeItem:setPosition(ccp(var_1_36 - 5, var_1_37 - 5))
	var_1_3:addChild(var_1_26)

	local function var_1_38(arg_9_0, arg_9_1, arg_9_2)
		return true
	end

	var_1_3:registerScriptTouchHandler(var_1_38, false, true)
	var_1_3:setTouchEnabled(true)

	local var_1_39 = smgr.getLayer("topLayer")

	var_1_39:removeAllChildrenWithCleanup(true)
	var_1_39:addChild(var_1_3)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end

	guide.control.setCurrentMarkTrace("panel:6:" .. arg_1_0)

	local var_1_40 = false
end
