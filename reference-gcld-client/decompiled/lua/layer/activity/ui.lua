require("lua/component/labelPage")
tool.requireRes("activity")

activityUI = {}
activityUI.uiTable = {}

local var_0_0 = activityControl

function activityUI.show(arg_1_0, arg_1_1)
	rmgr.loadResource("res/ui/activity/activity.plist")
	rmgr.loadResource("res/ui/general/general.plist")

	local var_1_0 = arg_1_1 or 1
	local var_1_1 = createBaseLayer()

	smgr.registerLayer(var_1_1, "activityLayer")

	activityUI.uiTable = autoUI.initUI(var_1_1, getActivityData())

	activityUI.uiTable.closeItem:registerScriptTapHandler(function()
		smgr.getLayer("topLayer"):removeChild(var_1_1, true)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()
		guide.control.setCurrentMarkTrace(nil)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end
	end)
	var_0_0.initControl(var_1_1)

	for iter_1_0, iter_1_1 in ipairs(user.actMenu) do
		if arg_1_0 and iter_1_1.tag == arg_1_0 then
			var_1_0 = iter_1_0 > 6 and 2 or 1
		end
	end

	local var_1_2 = {}
	local var_1_3 = true
	local var_1_4 = 1
	local var_1_5 = 1

	if var_1_0 == 1 then
		local var_1_6 = #user.actMenu

		if var_1_6 > 6 then
			var_1_6 = 6
		end

		var_1_4 = 1
		var_1_5 = var_1_6
	else
		var_1_4 = 7
		var_1_5 = #user.actMenu
	end

	for iter_1_2 = var_1_4, var_1_5 do
		local var_1_7 = false
		local var_1_8 = user.actMenu[iter_1_2]

		for iter_1_3, iter_1_4 in pairs(user.newActivity) do
			if iter_1_4 == var_1_8.id then
				var_1_7 = true
			end
		end

		if arg_1_0 ~= nil and arg_1_0 > 10000 then
			var_1_3 = var_1_8.tag == arg_1_0
		end

		local var_1_9 = {
			name = var_1_8.name,
			callback = var_0_0.onActivityTabOnClick(var_1_8.tag),
			default = var_1_3,
			isNew = var_1_7
		}

		table.insert(var_1_2, var_1_9)

		var_1_3 = false
	end

	local var_1_10 = CCScale9Sprite:createWithSpriteFrameName("bigPanel.png")

	var_1_10:setPreferredSize(CCSizeMake(960, 581))
	var_1_10:setPosition(ccp(var_1_10:getContentSize().width * 0.5, var_1_10:getContentSize().height * 0.5))
	var_1_10:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 28))
	var_1_1:addChild(var_1_10, 0)

	local var_1_11 = createLabelPage()

	for iter_1_5, iter_1_6 in ipairs(var_1_2) do
		local var_1_12 = CCSprite:createWithSpriteFrameName("labelButon_light.png")
		local var_1_13 = CCSprite:createWithSpriteFrameName("labelButton_noraml.png")
		local var_1_14

		if conf.language == "kr" then
			var_1_14 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 18)

			var_1_14:setDimensions(CCSizeMake(100, 0))
		elseif conf.language == "vie" then
			var_1_14 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 18)

			var_1_14:setDimensions(CCSizeMake(120, 0))
		elseif conf.language == "tha" then
			var_1_14 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 24)

			var_1_14:setDimensions(CCSizeMake(120, 0))
		else
			var_1_14 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 26)
		end

		var_1_14:setColor(ccc3(255, 255, 209))
		var_1_14:setPosition(ccp(var_1_12:getContentSize().width * 0.5, var_1_12:getContentSize().height * 0.4))
		var_1_12:addChild(var_1_14)

		local var_1_15

		if conf.language == "kr" then
			var_1_15 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 18)

			var_1_15:setDimensions(CCSizeMake(100, 0))
		elseif conf.language == "vie" then
			var_1_15 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 18)

			var_1_15:setDimensions(CCSizeMake(120, 0))
		elseif conf.language == "tha" then
			var_1_15 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 24)

			var_1_15:setDimensions(CCSizeMake(120, 0))
		else
			var_1_15 = CCStrokeLabelTTF:create(iter_1_6.name, "Thonburi-Bold", 26)
		end

		var_1_15:setColor(ccc3(204, 187, 135))
		var_1_15:setPosition(ccp(var_1_13:getContentSize().width * 0.5, var_1_13:getContentSize().height * 0.4))
		var_1_13:addChild(var_1_15)

		local var_1_16 = visibleSize.width / 2 - var_1_10:getContentSize().width / 2 + var_1_12:getContentSize().width * iter_1_5 - var_1_12:getContentSize().width * 0.5 + 30
		local var_1_17 = visibleSize.height / 2 + var_1_10:getContentSize().height / 2 - 2

		var_1_11:addLabelButton(var_1_13, var_1_12, ccp(var_1_16, var_1_17), iter_1_6.callback, iter_1_6.default, {
			isNew = iter_1_6.isNew
		})
	end

	closeItem = activityUI.uiTable.closeItem

	closeItem:setScale(2)

	local var_1_18 = visibleSize.width / 2 + var_1_10:getContentSize().width / 2 - activityUI.uiTable.closeItem:getContentSize().width
	local var_1_19 = visibleSize.height / 2 + var_1_10:getContentSize().height / 2

	activityUI.uiTable.closeItem:setPosition(ccp(var_1_18 - 6, var_1_19 - 5))

	if #var_1_2 > 6 then
		for iter_1_7, iter_1_8 in ipairs(var_1_11.buttons) do
			iter_1_8:setPosition(ccp(80 + 135 * (iter_1_7 - 1), 28))
		end

		local var_1_20 = CCScrollView:create(CCSizeMake(885, 65))

		var_1_20:setContainer(var_1_11)
		var_1_20:setBounceable(true)
		var_1_20:setPosition(visibleSize.width / 2 - var_1_10:getContentSize().width / 2, visibleSize.height / 2 + var_1_10:getContentSize().height / 2 - 30)
		var_1_20:setDirection(kCCScrollViewDirectionHorizontal)
		var_1_20:setContentSize(CCSizeMake(135 * #var_1_2 + 10, 55))
		var_1_1:addChild(var_1_20, 102)
	else
		var_1_1:addChild(var_1_11)
	end

	local function var_1_21(arg_3_0, arg_3_1, arg_3_2)
		return true
	end

	var_1_1:setTouchEnabled(true)
	var_1_1:registerScriptTouchHandler(var_1_21, false, true)

	local var_1_22 = smgr.getLayer("topLayer")

	var_1_22:removeAllChildrenWithCleanup(true)
	var_1_22:addChild(var_1_1, 0, s_windows.tag.activity)

	if guide.ui.isVisible() == true then
		guide.control.isHideByTemp = true

		guide.ui.setVisible(false)
	end
end
