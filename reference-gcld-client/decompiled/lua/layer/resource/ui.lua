local var_0_0 = require("res/native/offset").get("layer.resource")

require("lua/component/labelPage")
tool.requireRes("resource")

resourceUI = {}
resourceUI.uiTable = {}

local var_0_1 = resourceControl

function resourceUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	if arg_1_0 == nil then
		arg_1_0 = 1

		for iter_1_0 = 1, 5 do
			if guide.constant.popui[1][iter_1_0] == true then
				arg_1_0 = iter_1_0

				break
			end
		end
	end

	local var_1_0 = createBaseLayer()

	resourceUI.uiTable = autoUI.initUI(var_1_0, getResourceData())

	local function var_1_1()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		guide.ui.setVisible(false)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if globalAction_updateSpecialEffect then
			globalAction_updateSpecialEffect()
		end

		if user.curMainTask.taskId == 29 or user.curMainTask.taskId == 75 or user.curMainTask.taskId == 77 then
			taskUI.showTaskGuide()
		end
	end

	resourceUI.uiTable.closeItem:registerScriptTapHandler(var_1_1)
	var_0_1.initControl(var_1_0)

	local var_1_2 = {}
	local var_1_3 = 1
	local var_1_4 = true
	local var_1_5 = true

	if user.getFunc(16) then
		local var_1_6 = arg_1_0 == 1 and true or false
		local var_1_7 = {
			pageIndex = 1,
			name = language.get(70001),
			callback = function()
				var_0_1.onIncenseLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:1:1")
				end
			end,
			default = var_1_6
		}

		var_1_7.pageIndex = 1

		table.insert(var_1_2, var_1_3, var_1_7)

		var_1_3 = var_1_3 + 1

		local var_1_8 = false
	end

	if user.getFunc(27) and not user.supplyOpen then
		local var_1_9 = arg_1_0 == 2 and true or false
		local var_1_10 = {
			pageIndex = 2,
			name = language.get(70002),
			callback = function()
				var_0_1.onMarketLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:1:2")
				end
			end,
			default = var_1_9
		}

		var_1_10.pageIndex = 2

		table.insert(var_1_2, var_1_3, var_1_10)

		var_1_3 = var_1_3 + 1

		local var_1_11 = false
	end

	if user.getFunc(43) and not user.supplyOpen then
		local var_1_12 = arg_1_0 == 3 and true or false
		local var_1_13 = {
			pageIndex = 3,
			name = language.get(70003),
			callback = function()
				var_0_1.onBlackMarketLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:1:3")
				end
			end,
			default = var_1_12
		}

		var_1_13.pageIndex = 3

		table.insert(var_1_2, var_1_3, var_1_13)

		var_1_3 = var_1_3 + 1

		local var_1_14 = false
	end

	if not rmgr.isNotComplete() and user.getFunc(10) then
		local var_1_15 = arg_1_0 == 4 and true or false
		local var_1_16 = {
			name = language.get(70004),
			callback = function()
				var_0_1.onTicketsLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:1:4")
				end
			end,
			default = var_1_15
		}

		var_1_16.pageIndex = 4

		table.insert(var_1_2, var_1_3, var_1_16)

		var_1_3 = var_1_3 + 1

		local var_1_17 = false
	end

	if user.getFunc(66) then
		local var_1_18 = arg_1_0 == 5 and true or false
		local var_1_19 = {
			pageIndex = 5,
			name = language.get(70005),
			callback = function()
				var_0_1.onBlacksmithsLabelClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:1:5")
				end
			end,
			default = var_1_18
		}

		var_1_19.pageIndex = 5

		table.insert(var_1_2, var_1_3, var_1_19)

		var_1_3 = var_1_3 + 1

		local var_1_20 = false
	end

	if (user.getFunc(79) or user.haveSilkFunction) and not user.getFunc(80) then
		local var_1_21 = arg_1_0 == 6 and true or false
		local var_1_22 = {
			pageIndex = 6,
			name = language.get(70008),
			callback = var_0_1.onSilkSellLabelClick,
			default = var_1_21
		}

		table.insert(var_1_2, var_1_3, var_1_22)

		var_1_3 = var_1_3 + 1

		local var_1_23 = false
	end

	if user.getFunc(80) and user.haveTreasureFinish == 0 then
		local var_1_24 = arg_1_0 == 7 and true or false
		local var_1_25 = {
			pageIndex = 7,
			name = language.get(70009),
			callback = function()
				var_0_1.onSilkRoadClick()

				if not var_1_5 then
					guide.control.setCurrentMarkTrace("panel:1:6")
				end
			end,
			default = var_1_24
		}

		table.insert(var_1_2, var_1_3, var_1_25)

		var_1_3 = var_1_3 + 1

		local var_1_26 = false
	end

	if user.getFunc(80) then
		local var_1_27 = arg_1_0 == 8 and true or false
		local var_1_28 = {
			pageIndex = 8,
			name = language.get(70010),
			callback = var_0_1.onSilkBuyLabelClick,
			default = var_1_27
		}

		table.insert(var_1_2, var_1_3, var_1_28)

		local var_1_29 = var_1_3 + 1
		local var_1_30 = false
	end

	local var_1_31 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_31:setPreferredSize(CCSizeMake(960, 581))
	var_1_31:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_31, 0)

	local var_1_32 = CCSprite:createWithSpriteFrameName("labelButon_light.png"):getContentSize().width
	local var_1_33 = 30

	if #var_1_2 >= 7 then
		var_1_32 = var_1_32 - 8
		var_1_33 = 8
	end

	local var_1_34 = createLabelPage()

	for iter_1_1, iter_1_2 in pairs(var_1_2) do
		local var_1_35 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_36 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_37 = CCStrokeLabelTTF:create(iter_1_2.name, "Thonburi-Bold", 26 + (var_0_0.tagFntSz or 0))

		var_1_37:setColor(ccc3(255, 255, 209))
		var_1_37:setPosition(ccp(var_1_35:getContentSize().width * 0.5, var_1_35:getContentSize().height * 0.4))
		var_1_35:addChild(var_1_37)

		local var_1_38 = CCStrokeLabelTTF:create(iter_1_2.name, "Thonburi-Bold", 26 + (var_0_0.tagFntSz or 0))

		var_1_38:setColor(ccc3(204, 187, 135))
		var_1_38:setPosition(ccp(var_1_36:getContentSize().width * 0.5, var_1_36:getContentSize().height * 0.4))
		var_1_36:addChild(var_1_38)
		var_1_38:setDimensions(CCSizeMake(130, 0))
		var_1_37:setDimensions(CCSizeMake(130, 0))

		local var_1_39 = visibleSize.width / 2 - var_1_31:getContentSize().width / 2 + var_1_32 * (iter_1_1 - 0.5) + var_1_33
		local var_1_40 = visibleSize.height / 2 + var_1_31:getContentSize().height / 2 - 2
		local var_1_41 = var_1_34:addLabelButton(var_1_36, var_1_35, ccp(var_1_39, var_1_40), iter_1_2.callback, iter_1_2.default)

		log.info("_item.pageIndex: ", iter_1_2.pageIndex, var_1_41)

		guide.curMenuItems[iter_1_2.pageIndex] = var_1_41
	end

	resourceUI.uiTable.closeItem:setScale(2)

	local var_1_42 = visibleSize.width / 2 + var_1_31:getContentSize().width / 2 - resourceUI.uiTable.closeItem:getContentSize().width
	local var_1_43 = visibleSize.height / 2 + var_1_31:getContentSize().height / 2

	resourceUI.uiTable.closeItem:setPosition(ccp(var_1_42 - 5, var_1_43 - 5))
	var_1_0:addChild(var_1_34)

	local function var_1_44(arg_9_0, arg_9_1, arg_9_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_44, false, true)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end

	guide.control.setCurrentMarkTrace("panel:1:" .. arg_1_0)

	local var_1_45 = false

	local function var_1_46(arg_10_0)
		if arg_10_0 == 28 then
			guide.constant.other[6] = true

			guide.control.loadGuide(5, 6)
		elseif arg_10_0 == 22 or arg_10_0 == 31 or arg_10_0 == 33 or arg_10_0 == 74 or arg_10_0 == 76 then
			var_1_1()
		end
	end

	function var_1_0.onEnter()
		eventManager.registerEvent("task_finished", var_1_46)
	end

	function var_1_0.onExit()
		eventManager.unregisterEvent("task_finished", var_1_46)
	end

	local var_1_47 = smgr.getLayer("topLayer")

	var_1_47:removeAllChildrenWithCleanup(true)
	var_1_47:addChild(var_1_0)
end
