limitedEditionGift = {}

tool.requireRes("limitedEditionGift")
require("lua/common/tool")

limitedEditionGift.ui = {}

local var_0_0 = limitedEditionGift.ui
local var_0_1 = limitedEditionGift.constant

function var_0_0.show()
	amgr.playEffect(enumAudioFile.ui_dialog_open)

	local var_1_0 = createBaseLayer()

	var_0_0.table = autoUI.initUI(var_1_0, getLimitedEditionGiftData())
	var_0_0.table.layer = var_1_0

	local var_1_1 = var_0_0.table.closeItem

	var_1_1:setScale(2)

	local var_1_2 = var_1_1:getContentSize()
	local var_1_3 = var_0_0.table.bg:getContentSize()
	local var_1_4 = visibleSize.width / 2 + var_1_3.width / 2 - var_1_2.width / 2 - 30
	local var_1_5 = visibleSize.height / 2 + var_1_3.height / 2 + var_1_2.height / 2 - 20

	var_1_1:setPosition(ccp(var_1_4, var_1_5))

	local function var_1_6()
		amgr.playEffect(enumAudioFile.ui_dialog_close)
		smgr.getLayer("topLayer"):removeChild(var_1_0, true)

		if guide.control.isHideByTemp == true then
			guide.control.isHideByTemp = false

			guide.ui.setVisible(true)
		end

		guide.control.setCurrentMarkTrace(nil)
		CCTextureCache:sharedTextureCache():removeUnusedTextures()

		if globalAction_updateSpecialEffect then
			globalAction_updateSpecialEffect()
		end
	end

	var_0_0.table.closeItem:registerScriptTapHandler(var_1_6)

	local function var_1_7(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == CCTOUCHBEGAN then
			return true
		elseif arg_3_0 == CCTOUCHMOVED then
			return true
		elseif arg_3_0 == CCTOUCHENDED then
			return true
		end
	end

	local var_1_8 = createBaseLayer()
	local var_1_9 = limitedEditionGift.constant.giftIconPaths
	local var_1_10 = limitedEditionGift.constant.giftValue
	local var_1_11 = limitedEditionGift.constant.giftItemWidth

	for iter_1_0 = 1, #var_1_9 do
		local var_1_12 = CCSprite:createWithSpriteFrameName("general_background_light.png")

		limitedEditionGift.ui.table["item_bg_" .. iter_1_0] = var_1_12

		var_1_12:setPosition(50 + (iter_1_0 - 1) * var_1_11, 75)

		local var_1_13 = CCSprite:create(var_1_9[iter_1_0])

		var_1_13:setPosition(var_1_12:getContentSize().width / 2, var_1_12:getContentSize().height / 2)

		local var_1_14 = CCStrokeLabelTTF:create(var_1_10[iter_1_0], "Thonburi", 20, 2, colorText[10005])

		limitedEditionGift.ui.table["item_title_" .. iter_1_0] = title

		var_1_14:setPosition(50 + (iter_1_0 - 1) * var_1_11, 18)
		var_1_14:setColor(ccc3(235, 209, 167))
		var_1_12:addChild(var_1_13)
		var_1_8:addChild(var_1_12)
		var_1_8:addChild(var_1_14)
	end

	rmgr.loadResource("res/anim/resourceAnim/itemLight.plist")

	for iter_1_1 = 1, 4 do
		local var_1_15 = CCSprite:create()
		local var_1_16 = rmgr.getAnimation("sdtj_itemLight")
		local var_1_17 = CCAnimation:createWithSpriteFrames(var_1_16, 0.08)
		local var_1_18 = CCAnimate:create(var_1_17)

		var_1_15:runAction(CCRepeatForever:create(var_1_18))
		var_1_15:setPosition(ccp(39, 43))
		limitedEditionGift.ui.table["item_bg_" .. iter_1_1]:addChild(var_1_15)
	end

	local var_1_19 = CCSprite:create(limitedEditionGift.constant.giftPermenantIconPath)
	local var_1_20 = limitedEditionGift.ui.table.item_bg_2

	var_1_19:setPosition(var_1_20:getContentSize().width / 2, var_1_20:getContentSize().height / 2)
	var_1_20:addChild(var_1_19)

	local var_1_21 = CCScrollView:create(CCSizeMake(550, 200))

	var_1_21:setContainer(var_1_8)
	var_1_21:setPosition(350, 125)
	var_1_21:setContentSize(CCSizeMake(825, 200))
	var_1_21:setDirection(kCCScrollViewDirectionHorizontal)

	limitedEditionGift.ui.table.giftScrollView = var_1_21

	limitedEditionGift.ui.table.background:addChild(var_1_21)
	var_1_0:setTouchEnabled(true)
	var_1_0:registerScriptTouchHandler(var_1_7, false, true)

	local var_1_22 = smgr.getLayer("topLayer")

	var_1_22:removeAllChildrenWithCleanup(true)
	var_1_22:addChild(var_1_0)
	var_1_0:setVisible(true)
end
