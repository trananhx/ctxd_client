require("lua/component/labelPage")
tool.requireRes("equipment")

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.tabFontSize = -6
else
	var_0_0.tabFontSize = 0
end

equipmentUI = {}
equipmentUI.uiTable = {}

local var_0_1 = equipmentUI
local var_0_2 = equipmentControl

function equipmentUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	if arg_1_0 == nil then
		arg_1_0 = 1

		for iter_1_0 = 1, 5 do
			if guide.constant.popui[4][iter_1_0] == true then
				arg_1_0 = iter_1_0
			end
		end
	end

	local var_1_0 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_0:setPreferredSize(CCSizeMake(960, 581))
	var_1_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 28))
	smgr.registerLayer(var_1_0, "equipmentTabLayer")

	equipmentUI.uiTable = autoUI.initUI(var_1_0, getEquipmentData())

	local function var_1_1(arg_2_0)
		if arg_2_0 == 23 or arg_2_0 == 29 or arg_2_0 == 47 or arg_2_0 == 59 or arg_2_0 == 61 then
			guide.constant.other[6] = true

			if user.player.playerLv < 30 then
				local var_2_0 = smgr.getLayer("topLayer")

				log.info("close close")
				var_2_0:removeChild(var_1_0, true)
				guide.ui.setVisible(false)
				guide.control.setCurrentMarkTrace(nil)
				amgr.playEffect(enumAudioFile.ui_dialog_close)
				eventManager.unregisterEvent("task_finished", var_1_1)

				if user.curMainTask.taskId == 24 or user.curMainTask.taskId == 30 or user.curMainTask.taskId == 48 or user.curMainTask.taskId == 60 or user.curMainTask.taskId == 62 then
					taskUI.showTaskGuide()
				end
			else
				guide.control.loadGuide(5, 6)
			end
		end
	end

	eventManager.registerEvent("task_finished", var_1_1)
	equipmentUI.uiTable.closeItem:registerScriptTapHandler(function()
		local var_3_0 = smgr.getLayer("topLayer")

		log.info("close close")
		var_3_0:removeChild(var_1_0, true)
		guide.ui.setVisible(false)
		guide.control.setCurrentMarkTrace(nil)
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		eventManager.unregisterEvent("task_finished", var_1_1)

		if user.curMainTask.taskId == 24 or user.curMainTask.taskId == 30 or user.curMainTask.taskId == 48 or user.curMainTask.taskId == 60 or user.curMainTask.taskId == 62 then
			taskUI.showTaskGuide()
		end
	end)
	var_0_2.initControl(var_1_0)

	local var_1_2 = {}
	local var_1_3 = 1
	local var_1_4 = true
	local var_1_5 = true

	if user.getFunc(18) then
		local var_1_6 = arg_1_0 == 1 and true or false
		local var_1_7 = {
			name = language.get(user.supplyOpen and 215400 or 100001),
			callback = function()
				var_0_2.onStoreLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:4:1")
				end
			end,
			default = var_1_6
		}

		var_1_7.pageIndex = 1

		table.insert(var_1_2, var_1_3, var_1_7)

		var_1_3 = var_1_3 + 1

		local var_1_8 = false
	end

	if user.getFunc(11) then
		local var_1_9 = arg_1_0 == 2 and true or false
		local var_1_10 = {
			name = language.get(100002),
			callback = function()
				var_0_2.onStoreHouseLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:4:2")
				end
			end,
			default = var_1_9
		}

		var_1_10.pageIndex = 2

		table.insert(var_1_2, var_1_3, var_1_10)

		var_1_3 = var_1_3 + 1

		local var_1_11 = false
	end

	if user.getFunc(11) then
		local var_1_12 = arg_1_0 == 3 and true or false
		local var_1_13 = {
			name = language.get(100003),
			callback = function()
				var_0_2.onSTBackLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:4:3")
				end
			end,
			default = var_1_12
		}

		var_1_13.pageIndex = 3

		table.insert(var_1_2, var_1_3, var_1_13)

		var_1_3 = var_1_3 + 1

		local var_1_14 = false
	end

	if user.getFunc(51) then
		local var_1_15 = arg_1_0 == 4 and true or false
		local var_1_16 = {
			name = language.get(user.sublimated == true and 100009 or 100004),
			callback = function()
				var_0_2.onQuenchingLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:4:4")
				end
			end,
			default = var_1_15
		}

		var_1_16.pageIndex = 4

		table.insert(var_1_2, var_1_3, var_1_16)

		var_1_3 = var_1_3 + 1

		local var_1_17 = false
	end

	if user.player.openTrade or user.getFunc(78) or user.getFunc(79) then
		local var_1_18 = arg_1_0 == 5 and true or false
		local var_1_19 = {
			name = language.get(490130),
			callback = function()
				var_0_2.onTradeLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:4:5")
				end
			end,
			default = var_1_18
		}

		var_1_19.pageIndex = 5

		table.insert(var_1_2, var_1_3, var_1_19)

		var_1_3 = var_1_3 + 1

		local var_1_20 = false
	end

	if user.getFunc(87) then
		local var_1_21 = arg_1_0 == 6 and true or false
		local var_1_22 = {
			name = language.get("224301_jiaotaozhuang"),
			callback = function()
				var_0_2.onJiaoSuitLabelClick()
			end,
			default = var_1_21
		}

		var_1_22.pageIndex = 6

		table.insert(var_1_2, var_1_3, var_1_22)

		local var_1_23 = var_1_3 + 1
		local var_1_24 = false
	end

	local var_1_25 = createLabelPage()

	for iter_1_1, iter_1_2 in pairs(var_1_2) do
		local var_1_26 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_27 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_28 = CCStrokeLabelTTF:create(iter_1_2.name, "Thonburi-Bold", 26 + var_0_0.tabFontSize)

		var_1_28:setColor(ccc3(255, 255, 209))
		var_1_28:setPosition(ccp(var_1_26:getContentSize().width * 0.5, var_1_26:getContentSize().height * 0.4))
		var_1_28:setDimensions(CCSizeMake(140, 0))
		var_1_26:addChild(var_1_28)

		local var_1_29 = CCStrokeLabelTTF:create(iter_1_2.name, "Thonburi-Bold", 26 + var_0_0.tabFontSize)

		var_1_29:setColor(ccc3(204, 187, 135))
		var_1_29:setPosition(ccp(var_1_27:getContentSize().width * 0.5, var_1_27:getContentSize().height * 0.4))
		var_1_29:setDimensions(CCSizeMake(140, 0))
		var_1_27:addChild(var_1_29)

		local var_1_30 = var_1_26:getContentSize().width * iter_1_1 - var_1_26:getContentSize().width * 0.5 + 30
		local var_1_31 = var_1_0:getContentSize().height + var_1_26:getContentSize().height * 0.5 - 2
		local var_1_32 = var_1_25:addLabelButton(var_1_27, var_1_26, ccp(var_1_30, var_1_31), iter_1_2.callback, iter_1_2.default)

		guide.curMenuItems[iter_1_2.pageIndex] = var_1_32
	end

	local var_1_33 = equipmentUI.uiTable.closeItem

	var_1_33:setScale(2)

	local var_1_34 = var_1_33:getContentSize()
	local var_1_35 = var_1_0:getContentSize()
	local var_1_36 = var_1_35.width - var_1_34.width
	local var_1_37 = var_1_35.height + var_1_34.height - 5

	var_1_33:setPosition(ccp(var_1_36 - 5, var_1_37 - 5))
	var_1_0:addChild(var_1_25)

	local function var_1_38(arg_10_0, arg_10_1, arg_10_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_38, false, true)

	local var_1_39 = smgr.getLayer("topLayer")

	var_1_39:removeAllChildrenWithCleanup(true)
	var_1_39:addChild(var_1_0)
	guide.control.setCurrentMarkTrace("panel:4:" .. arg_1_0)

	local var_1_40 = false
end
