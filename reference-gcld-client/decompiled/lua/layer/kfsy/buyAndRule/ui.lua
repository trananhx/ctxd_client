require("lua/component/labelPage")
require("lua/layer/kfsy/buyAndRule/control")
require("lua/layer/kfsy/buyAndRule/uidata")

buyAndRuleUI = {}
buyAndRuleUI.uiTable = {}

local var_0_0 = buyAndRuleControl

function buyAndRuleUI.show(arg_1_0)
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	if arg_1_0 == nil then
		arg_1_0 = 1
	end

	local var_1_0 = createBaseLayer()

	buyAndRuleUI.uiTable = autoUI.initUI(var_1_0, getKfsyData())

	local function var_1_1()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()
	end

	buyAndRuleUI.uiTable.closeItem:registerScriptTapHandler(var_1_1)
	var_0_0.initControl(var_1_0)

	local var_1_2 = {}
	local var_1_3 = 1
	local var_1_4 = true
	local var_1_5 = true
	local var_1_6 = arg_1_0 == 1 and true or false
	local var_1_7 = {
		pageIndex = 1,
		name = language.get(320405),
		callback = function()
			var_0_0.onRuleLabelClick()
		end,
		default = var_1_6
	}

	var_1_7.pageIndex = 1

	table.insert(var_1_2, var_1_3, var_1_7)

	local var_1_8 = var_1_3 + 1
	local var_1_9 = false
	local var_1_10 = arg_1_0 == 2 and true or false
	local var_1_11 = {
		pageIndex = 2,
		name = language.get(320412),
		callback = function()
			var_0_0.onPlayerLabelClick()
		end,
		default = var_1_10
	}

	var_1_11.pageIndex = 2

	table.insert(var_1_2, var_1_8, var_1_11)

	local var_1_12 = var_1_8 + 1
	local var_1_13 = false
	local var_1_14 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_14:setPreferredSize(CCSizeMake(960, 581))
	var_1_14:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_14, 0)

	local var_1_15 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_2) do
		local var_1_16 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_17 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_18 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_18:setColor(ccc3(255, 255, 209))
		var_1_18:setPosition(ccp(var_1_16:getContentSize().width * 0.5, var_1_16:getContentSize().height * 0.4))
		var_1_16:addChild(var_1_18)

		local var_1_19 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_19:setColor(ccc3(204, 187, 135))
		var_1_19:setPosition(ccp(var_1_17:getContentSize().width * 0.5, var_1_17:getContentSize().height * 0.4))
		var_1_17:addChild(var_1_19)

		local var_1_20 = visibleSize.width / 2 - var_1_14:getContentSize().width / 2 + var_1_16:getContentSize().width * iter_1_0 - var_1_16:getContentSize().width * 0.5 + 30
		local var_1_21 = visibleSize.height / 2 + var_1_14:getContentSize().height / 2 - 2
		local var_1_22 = var_1_15:addLabelButton(var_1_17, var_1_16, ccp(var_1_20, var_1_21), iter_1_1.callback, iter_1_1.default)

		log.info("item.pageIndex: ", iter_1_1.pageIndex, var_1_22)

		guide.curMenuItems[iter_1_1.pageIndex] = var_1_22
	end

	buyAndRuleUI.uiTable.closeItem:setScale(2)

	local var_1_23 = visibleSize.width / 2 + var_1_14:getContentSize().width / 2 - buyAndRuleUI.uiTable.closeItem:getContentSize().width
	local var_1_24 = visibleSize.height / 2 + var_1_14:getContentSize().height / 2

	buyAndRuleUI.uiTable.closeItem:setPosition(ccp(var_1_23 - 5, var_1_24 - 5))
	var_1_0:addChild(var_1_15)

	local function var_1_25(arg_5_0, arg_5_1, arg_5_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_25, false, true)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end

	local var_1_26 = smgr.getLayer("topLayer")

	var_1_26:removeAllChildrenWithCleanup(true)
	var_1_26:addChild(var_1_0)
end
