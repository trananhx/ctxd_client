local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		name = "tipFrame",
		type = "sprite9",
		visible = false,
		pic = {
			frame = true,
			path = "common_tip_frame_small.png"
		},
		anchorPoint = ccp(0, 0),
		middleRect = CCRectMake(24, 24, 1, 1),
		preferedSize = CCSizeMake(160, 140),
		children = {
			{
				fontSize = 20,
				name = "tipMsg",
				height = 0,
				type = "label",
				width = 0,
				textId = 135536,
				anchorPoint = ccp(0, 0),
				halign = kCCTextAlignmentLeft
			}
		}
	}

	log.info("should show tips ")

	local var_1_1 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_1_1:registerScriptTouchHandler(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN then
			return true
		elseif arg_2_0 == CCTOUCHMOVED then
			return true
		elseif arg_2_0 == CCTOUCHENDED then
			pcall(var_1_1.removeFromParentAndCleanup, var_1_1, true)

			return true
		end
	end, false, true)
	var_1_1:setTouchEnabled(true)
	arg_1_0:addChild(var_1_1, 60000)

	local var_1_2 = 0
	local var_1_3 = 0
	local var_1_4 = {}

	uiutil.initWidgets(var_1_4, var_1_0)
	var_1_1:addChild(var_1_4.widgets.tipFrame)

	local var_1_5, var_1_6 = tool.getPositionInScreen(arg_1_2)
	local var_1_7 = var_1_5 - 20
	local var_1_8 = var_1_6 + 20
	local var_1_9 = arg_1_1 or ""

	var_1_4.widgets.tipMsg:setString(var_1_9)

	local var_1_10 = var_1_4.widgets.tipMsg:getContentSize().width
	local var_1_11 = var_1_4.widgets.tipMsg:getContentSize().height

	var_1_4.widgets.tipFrame:setPreferredSize(CCSizeMake(var_1_10 + 30, var_1_11 + 30))
	var_1_4.widgets.tipFrame:setPosition(ccp(var_1_7, var_1_8))
	var_1_4.widgets.tipMsg:setPosition(ccp(15, 15))
	var_1_4.widgets.tipFrame:setVisible(true)
end

return {
	addDuelResultBanner = function(arg_3_0)
		local var_3_0 = CCSprite:create()
		local var_3_1 = CCSprite:create("res/ui/arena/jzxt_word_time_bg.png")

		var_3_0:addChild(var_3_1)

		local var_3_2

		if arg_3_0 then
			var_3_2 = CCSprite:create("res/ui/arena/jzxt_word_jdslcwlz.png")
		else
			var_3_2 = CCSprite:create("res/ui/arena/jzxt_word_jdsbzjzl.png")
		end

		var_3_0:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
		var_3_0:addChild(var_3_2)

		return var_3_0
	end,
	addSpeak = function(arg_4_0)
		local var_4_0 = CCSprite:create()
		local var_4_1 = CCSprite:create("res/ui/arena/jzxt_bupple_word_lczzssfz.png")

		var_4_1:setPosition(ccp(240, 150))
		var_4_0:addChild(var_4_1)
		var_4_0:setScale(0.2)

		local var_4_2 = CCArray:create()

		var_4_2:addObject(CCDelayTime:create(0.1))
		var_4_2:addObject(CCScaleTo:create(1, 1))
		var_4_2:addObject(CCDelayTime:create(2))
		var_4_2:addObject(CCCallFuncN:create(function()
			arg_4_0()
		end))

		local var_4_3 = CCSequence:create(var_4_2)

		var_4_0:runAction(var_4_3)

		return var_4_0
	end,
	createArenaAni = function(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = CCArray:create()

		if arg_6_2 then
			rmgr.loadResource("res/ui/arena/ani_blue/ani.plist")

			for iter_6_0 = 1, arg_6_1 do
				local var_6_1 = tool.spriteFrameByName("attack" .. 30000 + iter_6_0 .. ".png")

				var_6_0:addObject(var_6_1)
			end
		else
			rmgr.loadResource("res/ui/arena/ani_red/ani.plist")

			for iter_6_1 = 1, arg_6_1 do
				local var_6_2 = tool.spriteFrameByName("attack" .. 30000 + iter_6_1 .. ".png")

				var_6_0:addObject(var_6_2)
			end
		end

		local var_6_3 = CCAnimation:createWithSpriteFrames(var_6_0, 0.08)
		local var_6_4 = CCAnimate:create(var_6_3)
		local var_6_5 = CCSprite:create("res/ui/arena/arena.png")
		local var_6_6 = CCSprite:create()

		var_6_6:runAction(var_6_4)
		var_6_6:setPosition(ccp(110, 130))
		var_6_5:addChild(var_6_6)
		var_6_5:setPosition(ccp(visibleSize.width * 0.5 - 270, visibleSize.height - 100))
		arg_6_0:addChild(var_6_5)

		return var_6_5
	end,
	addBaseJiaozhen = function(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = CCSprite:create("res/ui/arena/jzxt_word_bg.png")
		local var_7_1 = CCNode:create()

		var_7_1:setPosition(20, 17)
		var_7_1:setScale(0.8)
		var_7_0:addChild(var_7_1)

		local var_7_2 = CCControlButton:create(CCScale9Sprite:create("res/ui/arena/jzcf_btn_tx.png"))

		var_7_2:setAdjustBackgroundImage(false)
		var_7_2:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/arena/jzcf_btn_tx_c.png"), CCControlStateHighlighted)
		var_7_2:setZoomOnTouchDown(true)
		var_7_2:addHandleOfControlEvent(arg_7_2, CCControlEventTouchUpInside)
		var_7_1:addChild(var_7_2)

		local var_7_3 = arg_7_0.challengers
		local var_7_4 = 0

		if var_7_3 then
			var_7_4 = #var_7_3
		end

		local var_7_5 = CCLabelAtlas:create(tostring(var_7_4), "res/ui/noticeIcon/icon_number.png", 17, 32, 48)

		var_7_5:setPosition(22, 22)
		var_7_5:setAnchorPoint(ccp(0.5, 0.5))
		var_7_1:addChild(var_7_5)

		if arg_7_0.inTaunt == 1 then
			local var_7_6 = CCNode:create()

			var_7_6:setPosition(-30, 17)
			var_7_6:setScale(0.8)
			var_7_0:addChild(var_7_6)

			local var_7_7 = CCControlButton:create(CCScale9Sprite:create("res/ui/arena/jzcf_btn_tzrs.png"))

			var_7_7:setAdjustBackgroundImage(false)
			var_7_7:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/arena/jzcf_btn_tzrs_c.png"), CCControlStateHighlighted)
			var_7_7:setZoomOnTouchDown(true)
			var_7_7:addHandleOfControlEvent(function()
				var_0_0(arg_7_1, language.get(213023, arg_7_0.tauntTimes), var_7_7)
			end, CCControlEventTouchUpInside)
			var_7_6:addChild(var_7_7)

			local var_7_8 = CCLabelAtlas:create(tostring(arg_7_0.tauntTimes), "res/ui/noticeIcon/icon_number.png", 17, 32, 48)

			var_7_8:setPosition(22, 22)
			var_7_8:setAnchorPoint(ccp(0.5, 0.5))
			var_7_6:addChild(var_7_8)
		end

		local var_7_9 = {}
		local var_7_10 = language.get(121066, arg_7_0.forceName, arg_7_0.name)
		local var_7_11 = CCLabelTTF:create(var_7_10, "Thonburi", 20)

		var_7_11:setColor(colorForce[arg_7_0.forceId])
		table.insert(var_7_9, var_7_11)

		local var_7_12 = CCLabelTTF:create(language.get(225002), "Thonburi", 20)

		table.insert(var_7_9, var_7_12)

		local var_7_13 = createRichNode(var_7_9, 0)

		var_7_13:setPosition(45, 17)
		var_7_0:addChild(var_7_13)
		var_7_0:setPosition(visibleSize.width * 0.5 - 50, 34)
		arg_7_1:addChild(var_7_0)

		return var_7_0
	end,
	addTauntBuff = function(arg_9_0, arg_9_1)
		local var_9_0 = CCNode:create()

		var_9_0:setPosition(visibleSize.width - 410, 34)
		var_9_0:setScale(0.8)
		arg_9_0:addChild(var_9_0)

		local var_9_1 = CCControlButton:create(CCScale9Sprite:create("res/ui/arena/jzcf_btn_tzrs.png"))

		var_9_1:setAdjustBackgroundImage(false)
		var_9_1:setBackgroundSpriteForState(CCScale9Sprite:create("res/ui/arena/jzcf_btn_tzrs_c.png"), CCControlStateHighlighted)
		var_9_1:setZoomOnTouchDown(true)
		var_9_1:addHandleOfControlEvent(function()
			var_0_0(arg_9_0, language.get(213025, arg_9_1.tauntTimes, arg_9_1.tauntBuff), var_9_1)
		end, CCControlEventTouchUpInside)
		var_9_0:addChild(var_9_1)

		local var_9_2 = CCLabelAtlas:create(tostring(arg_9_1.tauntTimes), "res/ui/noticeIcon/icon_number.png", 17, 32, 48)

		var_9_2:setPosition(22, 22)
		var_9_2:setAnchorPoint(ccp(0.5, 0.5))
		var_9_0:addChild(var_9_2)
	end,
	addYinzhanResult = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
		arg_11_2 = arg_11_2 > 1000 and arg_11_2 % 1000 or arg_11_2
		arg_11_5 = arg_11_5 > 1000 and arg_11_5 % 1000 or arg_11_5

		local var_11_0 = CCScale9Sprite:create("res/ui/arena/jzxt_word_bg.png"):getContentSize()
		local var_11_1 = CCRectMake(0, 0, var_11_0.width, var_11_0.height)
		local var_11_2 = CCRectMake(3, 3, var_11_0.width - 6, var_11_0.height - 6)
		local var_11_3 = CCScale9Sprite:create("res/ui/arena/jzxt_word_bg.png", var_11_1, var_11_2)

		var_11_3:setContentSize(CCSizeMake(640, 34))

		local var_11_4 = CCSprite:create("res/ui/arena/jzxt_icon_03.png")

		var_11_4:setPosition(ccp(0, 15))
		var_11_3:addChild(var_11_4)

		local var_11_5 = {}
		local var_11_6 = CCLabelTTF:create(arg_11_0 .. "·" .. arg_11_1, "Thonburi", 20)

		var_11_6:setColor(colorForce[arg_11_2])
		table.insert(var_11_5, var_11_6)

		local var_11_7 = CCLabelTTF:create(language.get(225000), "Thonburi", 20)

		var_11_7:setColor(tool.hexToRgb("#FFFFFF"))
		table.insert(var_11_5, var_11_7)

		local var_11_8 = CCLabelTTF:create(arg_11_3 .. "·" .. arg_11_4, "Thonburi", 20)

		var_11_6:setColor(colorForce[arg_11_5])
		table.insert(var_11_5, var_11_8)

		local var_11_9 = CCLabelTTF:create(language.get(225001), "Thonburi", 20)

		var_11_9:setColor(tool.hexToRgb("#FFFFFF"))
		table.insert(var_11_5, var_11_9)

		local var_11_10 = createRichNode(var_11_5)

		var_11_10:setPosition(ccp(30, 15))
		var_11_3:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
		var_11_3:addChild(var_11_10)

		return var_11_3
	end,
	addTimeBar = function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = CCSprite:create("res/ui/arena/jzxt_time_bg.png")
		local var_12_1 = CCSprite:create("res/ui/arena/jzxt_icon_clock.png")

		var_12_0:addChild(var_12_1)
		var_12_1:setPosition(ccp(22, 15))

		local function var_12_2()
			local var_13_0 = var_12_0:getChildByTag(1000)
			local var_13_1 = var_13_0:getTime()

			var_13_0:setTriggerTime(var_13_1 - 1000)

			if var_13_1 == 0 then
				-- block empty
			end
		end

		local var_12_3 = createTimerLabel(arg_12_0, "@H:@M:@S", "Thonburi-Bold", 22, var_12_2, nil, nil, colorTips.red, arg_12_2)

		var_12_3:setPosition(ccp(82, 15))
		var_12_0:addChild(var_12_3, 10, 1000)
		var_12_0:setPosition(ccp(visibleSize.width * 0.5 - 64, 68))
		arg_12_1:addChild(var_12_0)

		return var_12_0
	end,
	addChallengingList = function(arg_14_0, arg_14_1)
		local var_14_0 = CCScale9Sprite:create("res/ui/arena/jzxt_name_list_bg.png"):getContentSize()
		local var_14_1 = CCRectMake(0, 0, var_14_0.width, var_14_0.height)
		local var_14_2 = CCRectMake(5, 5, var_14_0.width - 10, var_14_0.height - 10)
		local var_14_3 = CCScale9Sprite:create("res/ui/arena/jzxt_name_list_bg.png", var_14_1, var_14_2)

		var_14_3:setContentSize(CCSizeMake(370, 210))

		local var_14_4 = arg_14_1.arenaInfo.champion.challengers

		local function var_14_5(arg_15_0, arg_15_1)
			log.info("cell touched at : ", arg_15_1:getIdx())

			local var_15_0 = var_14_4[arg_15_1:getIdx() + 1]

			if arg_14_1.isYz then
				smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_KFYZ_JIAOZHEN, {
					teamId = var_15_0.battleId
				})
			else
				smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_JIAOZHEN, {
					battleId = var_15_0.battleId
				})
			end
		end

		local function var_14_6(arg_16_0, arg_16_1)
			return 39, 366
		end

		local function var_14_7(arg_17_0, arg_17_1)
			local var_17_0 = arg_17_0:dequeueCell()

			if var_17_0 then
				var_17_0:removeAllChildrenWithCleanup(true)
			else
				var_17_0 = CCTableViewCell:new()
			end

			local var_17_1 = var_14_4[arg_17_1 + 1]

			if var_17_1 then
				local var_17_2
				local var_17_3 = CCLabelTTF:create(var_17_1.forceName .. "·" .. var_17_1.name, "", 20)

				var_17_3:setAnchorPoint(ccp(0, 0.5))

				if arg_17_1 % 2 == 1 then
					var_17_2 = CCSprite:create("res/ui/arena/jzxt_name_list1.png")
				else
					var_17_2 = CCSprite:create("res/ui/arena/jzxt_name_list2.png")
				end

				var_17_1.forceId = var_17_1.forceId > 1000 and var_17_1.forceId % 1000 or var_17_1.forceId

				var_17_3:setColor(colorForce[var_17_1.forceId])
				var_17_2:setPosition(ccp(183, 19))
				var_17_0:addChild(var_17_2)

				local var_17_4 = CCSprite:create("res/ui/arena/jzxt_icon_rg.png")

				var_17_0:addChild(var_17_4)
				var_17_4:setPosition(ccp(345, 18))
				var_17_0:addChild(var_17_3)
				var_17_3:setPosition(ccp(10, 18))

				local var_17_5 = CCLabelTTF:create(language.get(225004), "", 20)

				var_17_0:addChild(var_17_5)
				var_17_5:setPosition(ccp(210, 18))
				var_17_5:setAnchorPoint(ccp(0, 0.5))
			end

			return var_17_0
		end

		local function var_14_8()
			local var_18_0 = var_14_4

			if var_18_0 and #var_18_0 > 0 then
				return #var_18_0
			else
				return 0
			end
		end

		local var_14_9 = CCTableView:create(CCSizeMake(370, 195))

		var_14_9:setPosition(2, 15)
		var_14_9:setDirection(kCCScrollViewDirectionVertical)
		var_14_9:setVerticalFillOrder(kCCTableViewFillTopDown)
		var_14_3:addChild(var_14_9)
		var_14_9:registerScriptHandler(var_14_5, CCTableView.kTableCellTouched)
		var_14_9:registerScriptHandler(var_14_6, CCTableView.kTableCellSizeForIndex)
		var_14_9:registerScriptHandler(var_14_7, CCTableView.kTableCellSizeAtIndex)
		var_14_9:registerScriptHandler(var_14_8, CCTableView.kNumberOfCellsInTableView)
		var_14_9:reloadData()

		local var_14_10 = CCLayerColor:create(ccc4(255, 255, 255, 0))

		var_14_10:registerScriptTouchHandler(function(arg_19_0, arg_19_1, arg_19_2)
			if arg_19_0 == CCTOUCHBEGAN then
				return true
			elseif arg_19_0 == CCTOUCHMOVED then
				return true
			elseif arg_19_0 == CCTOUCHENDED then
				if not tool.checkIfTouch(var_14_3, arg_19_1, arg_19_2) then
					pcall(var_14_10.removeFromParentAndCleanup, var_14_10, true)
					arg_14_1.addChallengingList:removeFromParentAndCleanup(true)

					arg_14_1.addChallengingList = nil
				end

				return true
			end
		end, false, true)
		var_14_10:setTouchEnabled(true)
		arg_14_0:addChild(var_14_10, 60000)
		var_14_3:setPosition(ccp(visibleSize.width * 0.5 - 60, 158))
		var_14_10:addChild(var_14_3)

		return var_14_3
	end,
	addShadowSurrender = function(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		(function(arg_21_0, arg_21_1)
			local var_21_0 = CCSprite:create()
			local var_21_1 = CCArray:create()
			local var_21_2 = CCSprite:create("res/ui/battle/stategyPic/3.png")

			var_21_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

			if arg_21_1 == "def" then
				var_21_2:setFlipX(true)
			end

			var_21_2:setVisible(false)
			var_21_0:addChild(var_21_2)

			local var_21_3 = CCSprite:create("res/ui/arena/jzxt_word_weishe.png")

			var_21_3:setScale(0.8)
			var_21_3:setPosition(ccp(var_21_2:getContentSize().width * 0.5, var_21_2:getContentSize().height * 0.3))
			var_21_2:addChild(var_21_3, 0)

			local function var_21_4()
				arg_21_0:removeChild(var_21_0, true)
			end

			local function var_21_5()
				local var_23_0 = rmgr.getSpeedEffectAnimation()
				local var_23_1 = CCAnimation:createWithSpriteFrames(var_23_0, 0.08)
				local var_23_2 = CCAnimate:create(var_23_1)
				local var_23_3 = CCRepeatForever:create(var_23_2)
				local var_23_4 = CCSprite:create()

				var_23_4:runAction(var_23_3)
				var_23_4:setPosition(ccp(var_21_2:getContentSize().width * 0.5, var_21_2:getContentSize().height * 0.5))
				var_21_2:addChild(var_23_4, 0)

				local var_23_5 = CCSprite:create(string.format("res/ui/common/playerPic/player%s.png", arg_20_2.pic))

				var_23_5:setScale(0.6)

				local var_23_6 = ccp(70, 175)
				local var_23_7 = ccp(50, 0)

				if arg_21_1 == "def" then
					var_23_6 = ccp(var_21_2:getContentSize().width - 120 + 50, 175)
					var_23_7 = ccp(-50, 0)
				end

				var_23_5:setPosition(var_23_6)
				var_21_2:addChild(var_23_5)

				local var_23_8 = CCMoveBy:create(0.5, var_23_7)

				var_23_5:runAction(var_23_8)
			end

			local function var_21_6()
				var_21_2:setVisible(true)
			end

			var_21_1:addObject(CCCallFuncN:create(var_21_6))
			var_21_1:addObject(CCCallFuncN:create(var_21_5))
			var_21_1:addObject(CCDelayTime:create(1))
			var_21_1:addObject(CCCallFuncN:create(var_21_4))

			local var_21_7 = CCSequence:create(var_21_1)

			var_21_0:runAction(var_21_7)
			arg_21_0:addChild(var_21_0)
		end)(arg_20_0, arg_20_2.side)

		local var_20_0 = arg_20_1.figthSide == arg_20_2.side
		local var_20_1 = false

		if arg_20_1.arenaInfo and arg_20_1.arenaInfo.champion and arg_20_1.arenaInfo.champion.inTaunt == 1 then
			var_20_1 = true
		end

		local var_20_2 = CCNode:create()

		var_20_2:setVisible(false)
		var_20_2:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
		arg_20_0:addChild(var_20_2)

		local var_20_3 = CCSprite:create("res/ui/arena/jzxt_word_time_bg.png")

		var_20_2:addChild(var_20_3)

		local var_20_4
		local var_20_5
		local var_20_6

		if var_20_0 then
			if var_20_1 then
				var_20_4 = "jzcf_word_wfcfdj.png"
				var_20_6 = "jzcf_word_zhygx.png"
			else
				var_20_4 = "jzxt_word_df.png"
				var_20_6 = "jzxt_word_dfzhygxwf.png"
			end
		elseif var_20_1 then
			var_20_4 = "jzcf_word_djcfwf.png"
			var_20_6 = "jzcf_word_zhygx.png"
		else
			var_20_4 = "jzxt_word_wf.png"
			var_20_6 = "jzxt_word_wfzhygxdf.png"
		end

		local var_20_7 = CCSprite:create("res/ui/arena/" .. var_20_4)
		local var_20_8 = CCSprite:create("res/ui/arena/" .. var_20_6)
		local var_20_9 = CCLabelAtlas:create(arg_20_2.num, "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)

		var_20_9:setAnchorPoint(ccp(0.5, 0.5))

		local var_20_10 = createRichNode({
			var_20_7,
			var_20_9,
			var_20_8
		}, 0.5)

		var_20_2:addChild(var_20_10)

		local var_20_11 = CCArray:create()

		var_20_11:addObject(CCDelayTime:create(1))
		var_20_11:addObject(CCShow:create())
		var_20_11:addObject(CCDelayTime:create(1.5))
		var_20_11:addObject(CCCallFunc:create(function()
			arg_20_3()
		end))

		local var_20_12 = CCSequence:create(var_20_11)

		var_20_2:runAction(var_20_12)

		return var_20_2
	end,
	addDuelTime = function(arg_26_0)
		local var_26_0 = CCSprite:create()
		local var_26_1 = CCSprite:create("res/ui/arena/jzxt_word_time_bg.png")

		var_26_0:addChild(var_26_1)

		local var_26_2 = CCSprite:create("res/ui/arena/jzxt_word_djjz.png")

		var_26_2:setPosition(ccp(-150, 0))
		var_26_0:addChild(var_26_2)

		local var_26_3 = CCSprite:create("res/ui/arena/jzxt_word_djjzhzdks.png")

		var_26_3:setPosition(ccp(100, 0))
		var_26_0:addChild(var_26_3)

		return var_26_0
	end,
	addJiaozhenState = function(arg_27_0)
		local var_27_0 = CCSprite:create()
		local var_27_1 = CCSprite:create("res/ui/arena/jzxt_word_time_bg.png")

		var_27_0:addChild(var_27_1)

		local var_27_2

		if arg_27_0 == 1 then
			var_27_2 = CCSprite:create("res/ui/arena/jzxt_word_wgmjfqjz.png")
		elseif arg_27_0 == 2 then
			var_27_2 = CCSprite:create("res/ui/arena/jzxt_word_dgmjfqjz.png")
		else
			var_27_2 = CCSprite:create("res/ui/arena/jzxt_word_bcjzdcjs.png")
		end

		var_27_0:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)
		var_27_0:addChild(var_27_2)

		return var_27_0
	end,
	addCandidateList = function(arg_28_0, arg_28_1, arg_28_2)
		local var_28_0 = CCScale9Sprite:create("res/ui/arena/jzxt_name_list_bg.png"):getContentSize()
		local var_28_1 = CCRectMake(0, 0, var_28_0.width, var_28_0.height)
		local var_28_2 = CCRectMake(5, 5, var_28_0.width - 10, var_28_0.height - 10)
		local var_28_3 = CCScale9Sprite:create("res/ui/arena/jzxt_name_list_bg.png", var_28_1, var_28_2)

		var_28_3:setContentSize(CCSizeMake(310, 390))
		var_28_3:setPosition(visibleSize.width * 0.5, visibleSize.height * 0.5)

		local var_28_4 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
		local var_28_5 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
		local var_28_6 = CCMenuItemSprite:create(var_28_4, var_28_5)
		local var_28_7 = CCMenu:create()

		var_28_7:addChild(var_28_6)
		var_28_6:registerScriptTapHandler(arg_28_1)
		var_28_3:addChild(var_28_7)
		var_28_7:setPosition(ccp(295, 375))

		local var_28_8 = CCLabelTTF:create(language.get(225005), "", 20)

		var_28_3:addChild(var_28_8)
		var_28_8:setPosition(ccp(165, 375))

		local var_28_9 = {}

		local function var_28_10(arg_29_0, arg_29_1)
			log.info("cell touched at : ", arg_29_1:getIdx())

			local var_29_0 = var_28_9[arg_29_1:getIdx() + 1]

			if arg_28_2.battleType == battleType.BATTLE_KFGZ then
				kfcmgr.sendRequest(arg_28_2.handlerchooseChampion, actions.chooseKfChampion, arg_28_2.cityId, var_29_0.id)
			else
				cmgr.sendRequest(arg_28_2.handlerchooseChampion, actions.chooseChampion, arg_28_2.cityId, var_29_0.id)
			end
		end

		local function var_28_11(arg_30_0, arg_30_1)
			return 39, 366
		end

		local function var_28_12(arg_31_0, arg_31_1)
			local var_31_0 = arg_31_0:dequeueCell()

			if var_31_0 then
				var_31_0:removeAllChildrenWithCleanup(true)
			else
				var_31_0 = CCTableViewCell:new()
			end

			local var_31_1 = var_28_9[arg_31_1 + 1]

			if var_31_1 then
				local var_31_2 = CCSprite:create("res/ui/arena/jzxt_name_list1.png")

				var_31_0:addChild(var_31_2)
				var_31_2:setPosition(ccp(125, 20))

				local var_31_3 = CCSprite:create("res/ui/common/playerHead/playerHead_icon_11.png")

				var_31_0:addChild(var_31_3)
				var_31_3:setPosition(ccp(60, 18))
				var_31_3:setScale(0.45)

				local var_31_4 = CCLabelTTF:create(var_31_1.name, "", 12)

				var_31_0:addChild(var_31_4)
				var_31_4:setPosition(ccp(150, 18))

				local var_31_5 = CCLabelTTF:create(language.get(225007, var_31_1.leftTimes), "", 12)

				var_31_0:addChild(var_31_5)
				var_31_5:setPosition(ccp(240, 18))
			end

			return var_31_0
		end

		local function var_28_13()
			local var_32_0 = var_28_9

			if var_32_0 and #var_32_0 > 0 then
				return #var_32_0
			else
				return 0
			end
		end

		local var_28_14 = CCTableView:create(CCSizeMake(310, 352))

		var_28_14:setPosition(0, 0)
		var_28_14:setDirection(kCCScrollViewDirectionVertical)
		var_28_14:setVerticalFillOrder(kCCTableViewFillTopDown)
		var_28_3:addChild(var_28_14)
		var_28_14:registerScriptHandler(var_28_10, CCTableView.kTableCellTouched)
		var_28_14:registerScriptHandler(var_28_11, CCTableView.kTableCellSizeForIndex)
		var_28_14:registerScriptHandler(var_28_12, CCTableView.kTableCellSizeAtIndex)
		var_28_14:registerScriptHandler(var_28_13, CCTableView.kNumberOfCellsInTableView)
		var_28_14:reloadData()
		arg_28_0:addChild(var_28_3)

		local function var_28_15(arg_33_0)
			log.info("----------获取擂主列表---------------")

			if arg_33_0.action then
				showTable(arg_33_0.action.data.candidates)

				var_28_9 = arg_33_0.action.data.candidates
			else
				showTable(arg_33_0.data.candidates)

				var_28_9 = arg_33_0.data.candidates
			end

			var_28_14:reloadData()
		end

		if arg_28_2.battleType == battleType.BATTLE_KFGZ then
			kfcmgr.sendRequest(var_28_15, actions.getKfCandidate)
		else
			cmgr.sendRequest(var_28_15, actions.getCandidate)
		end

		return var_28_3
	end
}
