require("lua/component/labelPage")

weaponTab = {}

tool.requireRes("weaponTab")

weaponTab.ui = {}
weaponTab.ui.table = {}

function weaponTab.ui.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	arg_1_0 = arg_1_0 or 1

	local var_1_0 = createBaseLayer()

	weaponTab.ui.table = autoUI.initUI(var_1_0, getWeaponTabData())

	weaponTab.ui.table.closeItem:registerScriptTapHandler(function()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if globalAction_updateSpecialEffect then
			globalAction_updateSpecialEffect()
		end

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end
	end)
	weaponTab.control.initControl(var_1_0)

	local var_1_1 = {}
	local var_1_2 = 1
	local var_1_3 = true
	local var_1_4 = true
	local var_1_5 = arg_1_0 == 1 and true or false
	local var_1_6 = {
		name = language.get(120001),
		callback = function()
			weaponTab.control.onWeaponClick()

			if not var_1_4 then
				guide.control.setCurrentMarkTrace("panel:7:1")
			end
		end,
		default = var_1_5
	}

	var_1_6.pageIndex = 1

	table.insert(var_1_1, var_1_2, var_1_6)

	local var_1_7 = var_1_2 + 1
	local var_1_8 = false

	if user.getFunc(28) then
		local var_1_9 = arg_1_0 == 2 and true or false
		local var_1_10 = {
			name = language.get(120002),
			callback = function()
				weaponTab.control.onGemClick()

				if not var_1_4 then
					guide.control.setCurrentMarkTrace("panel:7:2")
				end
			end,
			default = var_1_9
		}

		var_1_10.pageIndex = 2

		table.insert(var_1_1, var_1_7, var_1_10)

		var_1_7 = var_1_7 + 1

		local var_1_11 = false
	end

	if user.getFunc(68) then
		local var_1_12 = arg_1_0 == 3 and true or false
		local var_1_13 = {
			name = language.get(120003),
			callback = function()
				weaponTab.control.onDiamondClick()

				if not var_1_4 then
					guide.control.setCurrentMarkTrace("panel:7:3")
				end
			end,
			default = var_1_12
		}

		var_1_13.pageIndex = 3

		table.insert(var_1_1, var_1_7, var_1_13)

		var_1_7 = var_1_7 + 1

		local var_1_14 = false
	end

	if user.getFunc(70) then
		local var_1_15 = arg_1_0 == 4 and true or false
		local var_1_16 = {
			name = user.catapultRebuilt and language.get("220700_catapult") or language.get("220700_qixie"),
			callback = function()
				weaponTab.control.onMachineClick()

				if not var_1_4 then
					guide.control.setCurrentMarkTrace("panel:7:4")
				end
			end,
			default = var_1_15
		}

		var_1_16.pageIndex = 4

		table.insert(var_1_1, var_1_7, var_1_16)

		var_1_7 = var_1_7 + 1

		local var_1_17 = false
	end

	if user.getFunc(81) then
		local var_1_18 = arg_1_0 == 5 and true or false
		local var_1_19 = {
			name = language.get(120004),
			callback = function()
				weaponTab.control.onSilkTreasureClick()

				if not var_1_4 then
					guide.control.setCurrentMarkTrace("panel:7:5")
				end
			end,
			default = var_1_18
		}

		var_1_19.pageIndex = 5

		table.insert(var_1_1, var_1_7, var_1_19)

		var_1_7 = var_1_7 + 1

		local var_1_20 = false
	end

	if user.getFunc(92) then
		local var_1_21 = arg_1_0 == 6 and true or false
		local var_1_22 = {
			name = language.get(120005),
			callback = function()
				weaponTab.control.onCastingClick()
			end,
			default = var_1_21
		}

		var_1_22.pageIndex = 6

		table.insert(var_1_1, var_1_7, var_1_22)

		local var_1_23 = var_1_7 + 1
		local var_1_24 = false
	end

	local var_1_25 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_25:setPreferredSize(CCSizeMake(960, 581))
	var_1_25:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_25, 0)

	local var_1_26 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		local var_1_27 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_28 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_29 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_29:setColor(ccc3(255, 255, 209))
		var_1_29:setPosition(ccp(var_1_27:getContentSize().width * 0.5, var_1_27:getContentSize().height * 0.4))
		var_1_27:addChild(var_1_29)

		local var_1_30 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_30:setColor(ccc3(204, 187, 135))
		var_1_30:setPosition(ccp(var_1_28:getContentSize().width * 0.5, var_1_28:getContentSize().height * 0.4))
		var_1_28:addChild(var_1_30)

		local var_1_31 = visibleSize.width / 2 - var_1_25:getContentSize().width / 2 + var_1_27:getContentSize().width * iter_1_0 - var_1_27:getContentSize().width * 0.5 + 30
		local var_1_32 = visibleSize.height / 2 + var_1_25:getContentSize().height / 2 - 2
		local var_1_33 = var_1_26:addLabelButton(var_1_28, var_1_27, ccp(var_1_31, var_1_32), iter_1_1.callback, iter_1_1.default)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_33
	end

	weaponTab.ui.table.closeItem:setScale(2)

	local var_1_34 = visibleSize.width / 2 + var_1_25:getContentSize().width / 2 - weaponTab.ui.table.closeItem:getContentSize().width
	local var_1_35 = visibleSize.height / 2 + var_1_25:getContentSize().height / 2

	weaponTab.ui.table.closeItem:setPosition(ccp(var_1_34 - 5, var_1_35 - 5))
	var_1_0:addChild(var_1_26)

	local function var_1_36(arg_9_0, arg_9_1, arg_9_2)
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

	guide.control.setCurrentMarkTrace("panel:7:" .. arg_1_0)

	local var_1_38 = false
end
