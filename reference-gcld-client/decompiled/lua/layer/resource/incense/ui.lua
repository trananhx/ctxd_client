tool.requireRes("resource/incense")

incenseUI = {}
incenseUI.uiTable = {}

local var_0_0 = incenseControl
local var_0_1 = incenseConstant

function incenseUI.playXianglu(arg_1_0)
	local var_1_0 = incenseUI.uiTable["resourceIncense_" .. arg_1_0]

	var_1_0:removeChildByTag(var_0_1.XIANGLU, true)

	local var_1_1 = CCArray:create()

	for iter_1_0 = 1, 11 do
		local var_1_2 = tool.spriteFrameByName(string.format("xianglu_%04.f.png", iter_1_0))

		var_1_1:addObject(var_1_2)
	end

	local var_1_3 = CCAnimation:createWithSpriteFrames(var_1_1, 0.07)
	local var_1_4 = CCAnimate:create(var_1_3)
	local var_1_5 = CCSprite:create()
	local var_1_6 = CCArray:create()

	var_1_6:addObject(var_1_4)
	var_1_5:runAction(CCSequence:create(var_1_6))
	var_1_5:setPosition(ccp(var_1_0:getContentSize().width / 2, var_1_0:getContentSize().height / 2))
	var_1_0:addChild(var_1_5, 103, var_0_1.XIANGLU)
	amgr.playEffect(enumAudioFile.ui_jisi)
end

function incenseUI.flyItem(arg_2_0)
	local var_2_0 = arg_2_0.resourceGot[1]
	local var_2_1 = arg_2_0.multiple
	local var_2_2 = var_2_0.resourceType

	if var_2_2 == 119 then
		var_2_2 = 4
	elseif var_2_2 == 216 then
		var_2_2 = 5
	end

	local var_2_3 = incenseUI.uiTable["resourceIncense_" .. var_2_2]
	local var_2_4 = tolua.cast(var_2_3:getChildByTag(var_0_1.XIANGLU), "CCLayerColor")
	local var_2_5

	if var_2_1 > 1 then
		var_2_5 = CCSprite:createWithSpriteFrameName("js_bj_" .. var_2_1 .. ".png")

		var_2_5:setPosition(ccp(var_2_3:getContentSize().width / 2, var_2_3:getContentSize().height - 23))
		var_2_3:addChild(var_2_5)
	end

	local var_2_6 = var_0_1.RES_NAME[var_2_0.resourceType] .. " × " .. var_2_0.addNum
	local var_2_7 = CCStrokeLabelTTF:create(var_2_6, "Thonburi", 26)

	var_2_7:setPosition(ccp(var_2_3:getContentSize().width / 2, var_2_3:getContentSize().height * 0.3))

	if var_2_1 == 1 then
		var_2_7:setColor(ccc3(255, 255, 204))
	elseif var_2_1 == 2 then
		var_2_7:setColor(ccc3(255, 204, 0))
	elseif var_2_1 == 4 then
		var_2_7:setColor(ccc3(240, 112, 84))
	elseif var_2_1 == 10 then
		var_2_7:setColor(ccc3(200, 123, 245))
	end

	var_2_3:addChild(var_2_7, 104)

	local var_2_8 = CCMoveBy:create(1, ccp(0, 150))
	local var_2_9 = CCEaseExponentialOut:create(tolua.cast(var_2_8:copy(), "CCActionInterval"))
	local var_2_10 = CCScaleBy:create(0.1, 1.2)
	local var_2_11 = var_2_10:reverse()
	local var_2_12 = CCArray:create()

	var_2_12:addObject(var_2_10)
	var_2_12:addObject(var_2_11)
	var_2_12:addObject(var_2_9)

	local var_2_13 = CCCallFuncN:create(function()
		var_0_0.isPlayingAnim[var_2_0.resourceType] = false

		var_2_3:removeChild(var_2_5, true)
		var_2_3:removeChild(var_2_4, true)
		var_2_3:removeChild(var_2_7, true)
	end)

	var_2_12:addObject(var_2_13)
	var_2_7:runAction(CCSequence:create(var_2_12))
end

function incenseUI.showBigIncenseAwards(arg_4_0)
	local var_4_0 = arg_4_0[1].multiple

	local function var_4_1(arg_5_0)
		local var_5_0 = arg_5_0.multiple
		local var_5_1 = incenseUI.uiTable["resourceIncense_" .. arg_5_0.resourceType]
		local var_5_2 = tolua.cast(var_5_1:getChildByTag(var_0_1.XIANGLU), "CCLayerColor")
		local var_5_3

		if var_5_0 > 1 then
			var_5_3 = CCSprite:createWithSpriteFrameName("js_bj_" .. var_5_0 .. ".png")

			var_5_3:setPosition(ccp(var_5_1:getContentSize().width / 2, var_5_1:getContentSize().height - 23))
			var_5_1:addChild(var_5_3)
		end

		local var_5_4 = var_0_1.RES_NAME[arg_5_0.resourceType] .. " × " .. arg_5_0.addNum
		local var_5_5 = CCStrokeLabelTTF:create(var_5_4, "Thonburi", 26)

		var_5_5:setPosition(ccp(var_5_1:getContentSize().width / 2, var_5_1:getContentSize().height * 0.3))

		if var_5_0 == 1 then
			var_5_5:setColor(ccc3(255, 255, 204))
		elseif var_5_0 == 2 then
			var_5_5:setColor(ccc3(255, 204, 0))
		elseif var_5_0 == 4 then
			var_5_5:setColor(ccc3(240, 112, 84))
		elseif var_5_0 == 10 then
			var_5_5:setColor(ccc3(200, 123, 245))
		end

		var_5_1:addChild(var_5_5, 104)

		local var_5_6 = CCMoveBy:create(1, ccp(0, 150))
		local var_5_7 = CCEaseExponentialOut:create(tolua.cast(var_5_6:copy(), "CCActionInterval"))
		local var_5_8 = CCScaleBy:create(0.1, 1.2)
		local var_5_9 = var_5_8:reverse()
		local var_5_10 = CCArray:create()

		var_5_10:addObject(var_5_8)
		var_5_10:addObject(var_5_9)
		var_5_10:addObject(var_5_7)

		local var_5_11 = CCCallFuncN:create(function()
			var_0_0.isPlayingAnim[arg_5_0.resourceType] = false

			var_5_1:removeChild(var_5_3, true)
			var_5_1:removeChild(var_5_2, true)
			var_5_1:removeChild(var_5_5, true)
		end)

		var_5_10:addObject(var_5_11)
		var_5_5:runAction(CCSequence:create(var_5_10))
	end

	local function var_4_2(...)
		for iter_7_0, iter_7_1 in pairs(arg_4_0) do
			smgr.getLayer("incenseLayer"):runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.3 * (iter_7_0 - 1)), CCCallFuncN:create(function()
				var_4_1(iter_7_1)
			end)))
		end
	end

	if var_4_0 > 1 then
		local var_4_3 = CCSprite:create("res/ui/resource/incense/js_word_" .. var_4_0 .. ".png")

		var_4_3:setScale(5)

		local var_4_4 = CCArray:create()

		var_4_4:addObject(CCScaleTo:create(0.2, 1))
		var_4_4:addObject(CCDelayTime:create(0.5))
		var_4_4:addObject(CCCallFuncN:create(function(...)
			var_4_3:removeFromParentAndCleanup(true)
			var_4_2()
		end))
		var_4_3:runAction(CCSequence:create(var_4_4))
		var_4_3:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		smgr.getLayer("incenseLayer"):addChild(var_4_3, 100, 10086)
	else
		var_4_2()
	end
end

function incenseUI.addSpecialEffect(arg_10_0, arg_10_1, arg_10_2)
	log.info("id,limit,multiple", arg_10_0, arg_10_1, arg_10_2)

	if incenseUI.uiTable.specialIcon and not tolua.isnull(incenseUI.uiTable.specialIcon) then
		incenseUI.uiTable.specialIcon:removeFromParentAndCleanup(true)
	end

	if arg_10_0 == 1 and arg_10_1 > 0 then
		local var_10_0 = CCSprite:create("res/ui/activity/ironReward/acti_iron_icon_1.jpg")

		tool.scaleTo(var_10_0, 36, 36)
		var_10_0:setPosition(ccp(87.5, 75))
		incenseUI.uiTable.resourceIncense_4:addChild(var_10_0)

		incenseUI.uiTable.specialIcon = var_10_0

		local var_10_1 = CCSprite:create()

		var_10_1:setPosition(ccp(36, 36))
		var_10_0:addChild(var_10_1)

		local var_10_2 = CCArray:create()

		for iter_10_0 = 1, 8 do
			local var_10_3 = CCSpriteFrame:create(string.format("res/ui/activity/ironReward/btjs_gq/btjs_gq_%04d.png", iter_10_0), CCRectMake(0, 0, 100, 100))

			var_10_2:addObject(var_10_3)
		end

		local var_10_4 = CCAnimation:createWithSpriteFrames(var_10_2, 0.1)
		local var_10_5 = CCAnimate:create(var_10_4)

		var_10_1:runAction(CCRepeatForever:create(var_10_5))
	end
end

function incenseUI.initUI()
	local var_11_0 = smgr.getLayer("incenseLayer")

	incenseUI.uiTable = autoUI.initUI(var_11_0, getIncenseData())

	for iter_11_0 = 1, 5 do
		incenseUI.uiTable["resourceIncense_" .. iter_11_0]:registerScriptTapHandler(var_0_0["incenseButtonClick" .. iter_11_0])
	end

	local var_11_1 = CCArray:create()

	var_11_1:addObject(CCMoveBy:create(0.1, ccp(0, 7)))
	var_11_1:addObject(CCMoveBy:create(0.1, ccp(0, -13)))
	var_11_1:addObject(CCMoveBy:create(0.1, ccp(0, 11)))
	var_11_1:addObject(CCMoveBy:create(0.1, ccp(0, -9)))
	var_11_1:addObject(CCMoveBy:create(0.1, ccp(0, 7)))
	var_11_1:addObject(CCMoveBy:create(0.1, ccp(0, -3)))
	var_11_1:addObject(CCDelayTime:create(3))

	local var_11_2 = CCRepeatForever:create(tolua.cast(CCSequence:create(var_11_1), "CCActionInterval"))

	incenseUI.uiTable.incenseTips:runAction(var_11_2)
	require("lua/guide/control")

	guide.uiElementsTable[1002] = incenseUI.uiTable.resourceIncense_2
	guide.uiElementsTable[1003] = incenseUI.uiTable.resourceIncense_1

	incenseUI.uiTable.tenTimesBtn:registerScriptTapHandler(var_0_0.onTenTimesBtnTouched)

	if not CCUserDefault:sharedUserDefault():getBoolForKey(incenseConstant.IS_TEN_TIMES_SELECTED_KEY) then
		incenseUI.uiTable.checkedBtn:setVisible(false)
	end
end

function incenseUI.show()
	rmgr.loadTable(incenseConstant.RES)

	local var_12_0 = createBaseLayer()

	smgr.registerLayer(var_12_0, "incenseLayer")
	incenseUI.initUI()
	var_0_0.getIncenseInfo()

	var_12_0.onEnter = var_0_0.onEnter
	var_12_0.onExit = var_0_0.onExit

	for iter_12_0 = 1, 5 do
		var_0_0.isPlayingAnim[iter_12_0] = false
	end

	return var_12_0
end

function incenseUI.useGemToken(arg_13_0)
	local function var_13_0(arg_14_0)
		var_0_0.getIncenseInfo()
	end

	cmgr.sendRequest(var_13_0, actions.equipUseGemToken, arg_13_0.vId)
end

function incenseUI.updateGemTokenEffect(arg_15_0, arg_15_1)
	if arg_15_0 == 1 or arg_15_0 == 2 and arg_15_1 then
		local var_15_0 = smgr.getLayer("incenseLayer")
		local var_15_1 = var_15_0:getChildByTag(110)

		if var_15_1 == nil then
			var_15_1 = CCNode:create()

			var_15_0:addChild(var_15_1, 6000, 110)
		else
			var_15_1:removeAllChildrenWithCleanup(true)
		end

		if tonumber(arg_15_1) > 0 then
			local var_15_2 = arg_15_0 == 1 and "js_word_tcjbl.png" or "js_word_hfjbl.png"
			local var_15_3 = CCSprite:create("res/ui/activity/gemRotary/new/" .. var_15_2)
			local var_15_4 = CCLabelAtlas:create(tonumber(arg_15_1), "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)
			local var_15_5 = CCSprite:create("res/ui/activity/ironReward/acti_text_ci.png")

			var_15_4:setAnchorPoint(ccp(0.5, 0.5))

			local var_15_6 = createRichNode({
				var_15_3,
				var_15_4,
				var_15_5
			})
			local var_15_7 = 0
			local var_15_8 = 0
			local var_15_9 = var_15_7 + var_15_3:getContentSize().width + var_15_4:getContentSize().width + var_15_5:getContentSize().width

			var_15_6:setPosition(ccp(visibleSize.width / 2 - var_15_9 / 2, visibleSize.height - 50))
			var_15_1:addChild(var_15_6)

			local var_15_10 = CCSprite:createWithSpriteFrameName("js_view_bg.png")

			var_15_10:setPosition(ccp(visibleSize.width / 2 + 384, visibleSize.height / 2 - 35))
			var_15_1:addChild(tool.setShade(var_15_10, false), -1)

			local var_15_11 = CCSprite:create("res/ui/guide/jiantou-shang.png")

			var_15_11:setPosition(ccp(visibleSize.width / 2 + 384, visibleSize.height / 2 - 235))
			var_15_1:addChild(var_15_11)

			local var_15_12 = CCJumpBy:create(1, ccp(0, 0), -40, 1)

			var_15_11:runAction(CCRepeatForever:create(var_15_12))

			incenseUI.uiTable.gemCd = var_15_4
		end
	end
end
