require("lua/component/labelPage")
tool.requireRes("kfwd")

local var_0_0 = {}

if conf.language == "vie" then
	var_0_0.menuTabFontSize = -8
else
	var_0_0.menuTabFontSize = 0
end

kfwdUI = {}
kfwdUI.uiTable = {}

local var_0_1 = kfwdControl

function kfwdUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	arg_1_0 = arg_1_0 or 1

	if arg_1_0 > 1 then
		arg_1_0 = 1
	end

	local var_1_0 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_0:setPreferredSize(CCSizeMake(960, 581))
	var_1_0:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 28))

	kfwdUI.uiTable = autoUI.initUI(var_1_0, getKfwdData())

	local function var_1_1()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		eventManager.unregisterEvent("task_finished", task_finished)
	end

	kfwdUI.click_close_item = var_1_1

	local function var_1_2(arg_3_0)
		if arg_3_0 == 28 then
			-- block empty
		elseif arg_3_0 == 72 or arg_3_0 == 77 or arg_3_0 == 891 then
			var_1_1()
		end
	end

	eventManager.registerEvent("task_finished", var_1_2)
	kfwdUI.uiTable.closeItem:registerScriptTapHandler(var_1_1)
	var_0_1.initControl(var_1_0)

	local var_1_3 = {}
	local var_1_4 = 1
	local var_1_5 = true
	local var_1_6 = true
	local var_1_7 = arg_1_0 == 1 and true or false
	local var_1_8 = {
		name = language.get(390001),
		callback = function()
			var_0_1.onKfwdLabelClick()

			if not var_1_6 then
				guide.control.setCurrentMarkTrace("panel:8:1")
			end
		end,
		default = var_1_7
	}

	var_1_8.pageIndex = 1

	table.insert(var_1_3, var_1_4, var_1_8)

	local var_1_9 = var_1_4 + 1
	local var_1_10 = false
	local var_1_11 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_3) do
		local var_1_12 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_13 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_14 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26 + var_0_0.menuTabFontSize)

		var_1_14:setColor(ccc3(255, 255, 209))
		var_1_14:setPosition(ccp(var_1_12:getContentSize().width * 0.5, var_1_12:getContentSize().height * 0.4))
		var_1_12:addChild(var_1_14)

		local var_1_15 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26 + var_0_0.menuTabFontSize)

		var_1_15:setColor(ccc3(204, 187, 135))
		var_1_15:setPosition(ccp(var_1_13:getContentSize().width * 0.5, var_1_13:getContentSize().height * 0.4))
		var_1_13:addChild(var_1_15)

		local var_1_16 = var_1_12:getContentSize().width * iter_1_0 - var_1_12:getContentSize().width * 0.5 + 30
		local var_1_17 = var_1_0:getContentSize().height + var_1_12:getContentSize().height * 0.5 - 2
		local var_1_18 = var_1_11:addLabelButton(var_1_13, var_1_12, ccp(var_1_16, var_1_17), iter_1_1.callback, iter_1_1.default)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_18
	end

	closeItem = kfwdUI.uiTable.closeItem

	closeItem:setScale(2)

	local var_1_19 = closeItem:getContentSize()
	local var_1_20 = var_1_0:getContentSize()
	local var_1_21 = var_1_20.width - var_1_19.width
	local var_1_22 = var_1_20.height + var_1_19.height - 5

	closeItem:setPosition(ccp(var_1_21 - 5, var_1_22 - 5))
	var_1_0:addChild(var_1_11)

	local function var_1_23(arg_5_0, arg_5_1, arg_5_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_23, false, true)

	local var_1_24 = smgr.getLayer("topLayer")

	var_1_24:removeAllChildrenWithCleanup(true)
	var_1_24:addChild(var_1_0)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end

	guide.control.setCurrentMarkTrace("panel:9:" .. arg_1_0)

	local var_1_25 = false
end
