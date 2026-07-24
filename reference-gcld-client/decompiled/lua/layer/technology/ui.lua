require("lua/component/labelPage")
tool.requireRes("technology")

technologyUI = {}
technologyUI.uiTable = {}

local var_0_0 = technologyControl

function technologyUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	arg_1_0 = arg_1_0 or 1

	local var_1_0 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_0:setPreferredSize(CCSizeMake(960, 581))
	var_1_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 28))

	technologyUI.uiTable = autoUI.initUI(var_1_0, getTechnologyData())

	local function var_1_1()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		if user.curMainTask.taskId == 73 or user.curMainTask.taskId == 892 then
			taskUI.showTaskGuide()
		end

		eventManager.unregisterEvent("task_finished", task_finished)
	end

	local function var_1_2(arg_3_0)
		if arg_3_0 == 28 then
			-- block empty
		elseif arg_3_0 == 72 or arg_3_0 == 77 or arg_3_0 == 891 then
			var_1_1()
		end
	end

	eventManager.registerEvent("task_finished", var_1_2)
	technologyUI.uiTable.closeItem:registerScriptTapHandler(var_1_1)
	var_0_0.initControl(var_1_0)

	local var_1_3 = {}
	local var_1_4 = 1
	local var_1_5 = true
	local var_1_6 = true
	local var_1_7 = arg_1_0 == 1 and true or false
	local var_1_8 = {
		name = language.get(50007),
		callback = function()
			var_0_0.onDragonTechLabelClick()

			if not var_1_6 then
				guide.control.setCurrentMarkTrace("panel:5:1")
			end
		end,
		default = var_1_7
	}

	var_1_8.pageIndex = 1

	table.insert(var_1_3, var_1_4, var_1_8)

	local var_1_9 = var_1_4 + 1
	local var_1_10 = false

	if user.workerOpen then
		local var_1_11 = arg_1_0 == 2 and true or false
		local var_1_12 = {
			name = language.get("222000_buildingTech"),
			callback = function()
				var_0_0.onBuildingTechClick()
			end,
			default = var_1_11
		}

		var_1_12.pageIndex = 2

		table.insert(var_1_3, var_1_9, var_1_12)

		local var_1_13 = var_1_9 + 1
		local var_1_14 = false
	end

	local var_1_15 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_3) do
		local var_1_16 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_17 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_18 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_18:setDimensions(CCSizeMake(130, 52))
		var_1_18:setHorizontalAlignment(kCCTextAlignmentCenter)
		var_1_18:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_18:setColor(ccc3(255, 255, 209))
		var_1_18:setPosition(ccp(var_1_16:getContentSize().width * 0.5, var_1_16:getContentSize().height * 0.4))
		var_1_16:addChild(var_1_18)

		local var_1_19 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_19:setDimensions(CCSizeMake(130, 52))
		var_1_19:setHorizontalAlignment(kCCTextAlignmentCenter)
		var_1_19:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_1_19:setColor(ccc3(204, 187, 135))
		var_1_19:setPosition(ccp(var_1_17:getContentSize().width * 0.5, var_1_17:getContentSize().height * 0.4))
		var_1_17:addChild(var_1_19)

		local var_1_20 = var_1_16:getContentSize().width * iter_1_0 - var_1_16:getContentSize().width * 0.5 + 30
		local var_1_21 = var_1_0:getContentSize().height + var_1_16:getContentSize().height * 0.5 - 2
		local var_1_22 = var_1_15:addLabelButton(var_1_17, var_1_16, ccp(var_1_20, var_1_21), iter_1_1.callback, iter_1_1.default)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_22
	end

	closeItem = technologyUI.uiTable.closeItem

	closeItem:setScale(2)

	local var_1_23 = closeItem:getContentSize()
	local var_1_24 = var_1_0:getContentSize()
	local var_1_25 = var_1_24.width - var_1_23.width
	local var_1_26 = var_1_24.height + var_1_23.height - 5

	closeItem:setPosition(ccp(var_1_25 - 5, var_1_26 - 5))
	var_1_0:addChild(var_1_15)

	local function var_1_27(arg_6_0, arg_6_1, arg_6_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_27, false, true)

	local var_1_28 = smgr.getLayer("topLayer")

	var_1_28:removeAllChildrenWithCleanup(true)
	var_1_28:addChild(var_1_0)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end

	guide.control.setCurrentMarkTrace("panel:5:" .. arg_1_0)

	local var_1_29 = false
end
