require("lua/component/labelPage")
tool.requireRes("kfworld/kfgzReward")

kfgzRewardUI = {}
kfgzRewardUI.uiTable = {}

local var_0_0 = kfgzRewardControl

function kfgzRewardUI.show()
	rmgr.loadResource("res/ui/general/general.plist")

	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "kfgzRewardLayer")

	kfgzRewardUI.uiTable = autoUI.initUI(var_1_0, getkfgzRewardData())

	kfgzRewardUI.uiTable.closeItem:registerScriptTapHandler(function()
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()
		guide.control.setCurrentMarkTrace(nil)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end
	end)
	var_0_0.initControl(var_1_0)

	local var_1_1 = {}
	local var_1_2 = 1
	local var_1_3 = true
	local var_1_4 = {
		name = language.get(430005),
		callback = var_0_0.onQinggongClick,
		default = var_1_3
	}

	table.insert(var_1_1, var_1_2, var_1_4)

	local var_1_5 = var_1_2 + 1
	local var_1_6 = false
	local var_1_7 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_7:setPreferredSize(CCSizeMake(960, 581))
	var_1_7:setPosition(ccp(var_1_7:getContentSize().width * 0.5, var_1_7:getContentSize().height * 0.5))
	var_1_7:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_0:addChild(var_1_7, 0)

	local var_1_8 = createLabelPage()

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		local var_1_9 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_10 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_11 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_11:setColor(ccc3(255, 255, 209))
		var_1_11:setPosition(ccp(var_1_9:getContentSize().width * 0.5, var_1_9:getContentSize().height * 0.4))
		var_1_9:addChild(var_1_11)

		local var_1_12 = CCStrokeLabelTTF:create(iter_1_1.name, "Thonburi-Bold", 26)

		var_1_12:setColor(ccc3(204, 187, 135))
		var_1_12:setPosition(ccp(var_1_10:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.4))
		var_1_10:addChild(var_1_12)

		local var_1_13 = visibleSize.width / 2 - var_1_7:getContentSize().width / 2 + var_1_9:getContentSize().width * iter_1_0 - var_1_9:getContentSize().width * 0.5 + 30
		local var_1_14 = visibleSize.height / 2 + var_1_7:getContentSize().height / 2 - 2

		var_1_8:addLabelButton(var_1_10, var_1_9, ccp(var_1_13, var_1_14), iter_1_1.callback, iter_1_1.default, {
			isNew = iter_1_1.isNew
		})
	end

	closeItem = kfgzRewardUI.uiTable.closeItem

	closeItem:setScale(2)

	local var_1_15 = visibleSize.width / 2 + var_1_7:getContentSize().width / 2 - kfgzRewardUI.uiTable.closeItem:getContentSize().width
	local var_1_16 = visibleSize.height / 2 + var_1_7:getContentSize().height / 2

	kfgzRewardUI.uiTable.closeItem:setPosition(ccp(var_1_15 - 6, var_1_16 - 5))
	var_1_0:addChild(var_1_8)

	local function var_1_17(arg_3_0, arg_3_1, arg_3_2)
		return true
	end

	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_17, false, true)

	local var_1_18 = smgr.getLayer("topLayer")

	var_1_18:removeAllChildrenWithCleanup(true)
	var_1_18:addChild(var_1_0)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end
end
