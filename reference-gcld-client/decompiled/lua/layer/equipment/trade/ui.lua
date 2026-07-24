tool.requireRes("equipment/trade")

tradeUI = {}

local var_0_0 = tradeUI
local var_0_1 = tradeControl
local var_0_2 = tradeConstant

function tradeUI.show()
	local var_1_0 = createBaseLayer()

	rmgr.loadTable(var_0_2.RES)
	smgr.registerLayer(var_1_0, "tradeLayer")

	var_1_0.onEnter = var_0_1.onEnter
	var_1_0.onExit = var_0_1.onExit

	var_0_1.tradeGetTradeInfo()

	return var_1_0
end

function var_0_0.updateTradeUi(arg_2_0)
	if var_0_0.uiTable then
		var_0_0.uiTable = nil
	end

	if var_0_0.tradeViewBackground then
		pcall(var_0_0.tradeViewBackground.removeFromParentAndCleanup, var_0_0.tradeViewBackground, true)

		var_0_0.tradeViewBackground = nil
	end

	local var_2_0 = smgr.getLayer("tradeLayer")
	local var_2_1 = getTradeUiData(arg_2_0)

	var_0_0.uiTable = autoUI.initUI(var_2_0, var_2_1)
	var_0_0.tradeViewBackground = var_0_0.uiTable.tradeViewBackground

	for iter_2_0 = 1, 5 do
		local var_2_2 = arg_2_0.myTrades[iter_2_0]
		local var_2_3 = arg_2_0.trades[iter_2_0]

		if var_2_3 then
			var_0_0.uiTable["trade_" .. iter_2_0]:setScaleY(0.95)

			local var_2_4 = var_0_0.uiTable["btn_getReward" .. iter_2_0]

			var_2_4:setScaleX(5.34)
			var_2_4:setScaleY(8)
			var_2_4:setOpacity(0)

			if not var_2_2 or var_2_2 and var_2_2.finished ~= 1 then
				local var_2_5 = 160

				var_0_0.uiTable["icon" .. iter_2_0]:setOpacity(var_2_5)
				var_0_0.uiTable["icon_bg" .. iter_2_0]:setOpacity(var_2_5)
				var_0_0.uiTable["icon_info" .. iter_2_0]:setOpacity(var_2_5)
			end

			if var_2_2 then
				if var_2_2.finished == 1 then
					var_0_0.canGetRewardEffect(iter_2_0)
				end

				if var_2_2.invested then
					var_0_0.uiTable["lianzi" .. iter_2_0]:setVisible(true)
					var_0_0.uiTable["btn_touzi" .. iter_2_0]:setVisible(false)
				else
					var_0_0.uiTable["lianzi" .. iter_2_0]:setVisible(false)
					var_0_0.uiTable["btn_touzi" .. iter_2_0]:setVisible(true)
				end

				if user.sublimated then
					if iter_2_0 == 1 or iter_2_0 == 2 or iter_2_0 == 3 then
						if arg_2_0.currFinishedSilkTreasureId < 9 then
							var_0_0.uiTable["guanbi" .. iter_2_0]:setVisible(true)
							var_0_0.uiTable["lianzi" .. iter_2_0]:setVisible(true)
							var_0_0.uiTable["btn_touzi" .. iter_2_0]:setVisible(false)
							var_0_0.uiTable["processBackGround" .. iter_2_0]:setVisible(false)
						elseif var_2_3.gainType ~= 10 then
							var_0_0.uiTable["btn_touzi" .. iter_2_0]:setVisible(false)
							var_0_0.uiTable["processBackGround" .. iter_2_0]:setVisible(false)
						end
					end

					if iter_2_0 == 4 and var_2_2.changeImediate == 0 then
						var_0_0.uiTable["noOpenPic" .. iter_2_0]:setVisible(true)
						var_0_0.uiTable["noOpenPic" .. iter_2_0]:setDisplayFrame(CCSprite:create("res/ui/equip/trade/smsr_word_kqsczl.png"):displayFrame())
						var_0_0.uiTable["icon" .. iter_2_0]:setDisplayFrame(CCSprite:create("res/ui/world/world_silk.jpg"):displayFrame())
						var_0_0.uiTable["icon_info" .. iter_2_0]:setDisplayFrame(tool.spriteFrameByName("smsr_tit_sc1000.png"))
						var_0_0.uiTable["lianzi" .. iter_2_0]:setVisible(true)
						var_0_0.uiTable["btn_touzi" .. iter_2_0]:setVisible(false)
						var_0_0.uiTable["processBackGround" .. iter_2_0]:setVisible(false)
					end
				end
			else
				tool.spriteToGray(var_0_0.uiTable["trade_" .. iter_2_0])
			end

			if var_2_2 and var_2_2.changeImediate and var_2_2.changeImediate == 1 then
				var_0_1.isChangeImediate[iter_2_0] = 1

				var_0_0.uiTable["processBar" .. iter_2_0]:setVisible(false)
				var_0_0.uiTable["processWord" .. iter_2_0]:setVisible(false)

				if iter_2_0 == 4 then
					var_0_0.uiTable["icon" .. iter_2_0]:setDisplayFrame(CCSprite:create("res/ui/world/world_silk.jpg"):displayFrame())
					var_0_0.uiTable["icon_info" .. iter_2_0]:setDisplayFrame(tool.spriteFrameByName("smsr_tit_sc1000.png"))
				end
			end

			if iter_2_0 == 5 then
				var_0_0.uiTable["icon" .. iter_2_0]:setDisplayFrame(CCSprite:create("res/ui/world/world_silk.jpg"):displayFrame())
			end

			if var_2_3.gainType == 10 then
				var_0_1.isChangeImediate[iter_2_0] = 1

				var_0_0.uiTable["processBar" .. iter_2_0]:setVisible(false)
				var_0_0.uiTable["processWord" .. iter_2_0]:setVisible(false)
				var_0_0.uiTable["icon" .. iter_2_0]:setDisplayFrame(CCSprite:create("res/ui/activity/meteorIncense/yuntie2.jpg"):displayFrame())
				var_0_0.uiTable["icon_info" .. iter_2_0]:setDisplayFrame(CCSprite:create("res/ui/equip/trade/smsr_word_yt10.png"):displayFrame())
				var_0_0.uiTable["icon_info" .. iter_2_0]:setScale(1)
			end
		end
	end
end

function var_0_0.handleTipsBtnTap()
	log.info("should show tips ")

	local var_3_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_3_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			return true
		elseif arg_4_0 == CCTOUCHENDED then
			if var_0_0.uiTable.tradeTipFrame then
				var_0_0.uiTable.tradeTipFrame:setVisible(false)
			end

			pcall(var_3_0.removeFromParentAndCleanup, var_3_0, true)

			return true
		end
	end, false, true)
	var_3_0:setTouchEnabled(true)
	autoUI.createUI(var_3_0, getTradeTipFrame(), var_0_0.uiTable)

	local var_3_1, var_3_2 = tool.getPositionInScreen(var_0_0.uiTable.btn_tip)

	var_0_0.uiTable.tradeTipFrame:setPosition(ccp(visibleSize.width * 0.5, var_3_2 - 20))
	smgr.rootLayer:addChild(var_3_0, 60000)
end

function var_0_0.canGetRewardEffect(arg_5_0)
	rmgr.loadResource("res/ui/equip/trade/smsr_light.plist")
	rmgr.loadResource("res/ui/equip/trade/smsr_move.plist")

	local var_5_0 = var_0_0.uiTable["card" .. arg_5_0]
	local var_5_1, var_5_2 = var_5_0:getPosition()

	if var_5_0.effectNode then
		var_5_0.effectNode:removeFromParentAndCleanup(true)
	end

	var_5_0.effectNode = CCNode:create()

	var_5_0.effectNode:setPosition(ccp(var_5_1, var_5_2))
	var_0_0.tradeViewBackground:addChild(var_5_0.effectNode, 300)

	local var_5_3 = CCSprite:create()

	var_5_0.effectNode:addChild(var_5_3)
	var_5_3:setPosition(ccp(0, 255))

	local var_5_4 = CCArray:create()

	for iter_5_0 = 1, 12 do
		local var_5_5 = CCSprite:createWithSpriteFrameName(string.format("smsr_light_%02d.png", iter_5_0))

		var_5_4:addObject(var_5_5:displayFrame())
	end

	local var_5_6 = CCAnimation:createWithSpriteFrames(var_5_4, 0.1)
	local var_5_7 = CCAnimate:create(var_5_6)

	var_5_3:runAction(CCRepeatForever:create(var_5_7))
	var_5_3:setScaleX(0.3763440860215054)
	var_5_3:setScaleY(1.1363636363636365)

	local var_5_8 = CCSprite:createWithSpriteFrameName("smsr_tit_draw_bwysz.png")

	var_5_0.effectNode:addChild(var_5_8, 1)
	var_5_8:setPosition(ccp(0, 270))

	local var_5_9 = CCArray:create()

	var_5_9:addObject(CCMoveBy:create(0.5, ccp(0, 15)))
	var_5_9:addObject(CCDelayTime:create(0.1))
	var_5_9:addObject(CCMoveBy:create(0.5, ccp(0, -15)))
	var_5_9:addObject(CCDelayTime:create(0.1))
	var_5_8:runAction(CCRepeatForever:create(CCSequence:create(var_5_9)))

	local var_5_10 = CCSprite:createWithSpriteFrameName("smsr_light_dazzle.png")

	var_5_0.effectNode:addChild(var_5_10)
	var_5_10:setPosition(ccp(0, 240))
	var_5_10:runAction(CCRepeatForever:create(CCRotateBy:create(2, 360)))

	local var_5_11 = CCSprite:createWithSpriteFrameName("smsr_light_round.png")

	var_5_0.effectNode:addChild(var_5_11)
	var_5_11:setPosition(ccp(0, 240))

	local var_5_12 = CCSprite:createWithSpriteFrameName("smsr_box.png")

	var_5_0.effectNode:addChild(var_5_12)
	var_5_12:setPosition(ccp(0, 220))

	local var_5_13 = {
		ccp(-47, 214),
		[4] = ccp(19, 188),
		[5] = ccp(50, 207)
	}

	var_5_13[2] = ccp(var_5_13[1].x + (var_5_13[4].x - var_5_13[1].x) * 1 / 3, var_5_13[1].y + (var_5_13[4].y - var_5_13[1].y) * 1 / 3)
	var_5_13[3] = ccp(var_5_13[1].x + (var_5_13[4].x - var_5_13[1].x) * 2 / 3, var_5_13[1].y + (var_5_13[4].y - var_5_13[1].y) * 2 / 3)

	for iter_5_1 = 1, 5 do
		local var_5_14 = CCSprite:create()

		if iter_5_1 == 5 then
			var_5_0.effectNode:addChild(var_5_14, -1)
		else
			var_5_0.effectNode:addChild(var_5_14)
		end

		var_5_14:setPosition(var_5_13[iter_5_1])

		local var_5_15 = CCArray:create()

		for iter_5_2 = 1, 12 do
			local var_5_16 = CCSprite:createWithSpriteFrameName(string.format("move300%02d.png", iter_5_2))

			var_5_15:addObject(var_5_16:displayFrame())
		end

		local var_5_17 = CCAnimation:createWithSpriteFrames(var_5_15, 0.1)
		local var_5_18 = CCAnimate:create(var_5_17)

		var_5_14:runAction(CCRepeatForever:create(var_5_18))
	end
end

function var_0_0.afterGetRewardEffect(arg_6_0, arg_6_1)
	local var_6_0 = var_0_0.uiTable["card" .. arg_6_0]
	local var_6_1, var_6_2 = var_6_0:getPosition()

	if var_6_0.effectNode then
		var_6_0.effectNode:removeFromParentAndCleanup(true)
	end

	var_6_0.effectNode = CCNode:create()

	var_6_0.effectNode:setPosition(ccp(var_6_1, var_6_2))
	var_0_0.tradeViewBackground:addChild(var_6_0.effectNode, 300)

	local var_6_3 = CCSprite:createWithSpriteFrameName(arg_6_1 .. ".jpg")

	var_6_3:setAnchorPoint(ccp(0.5, 0.5))
	var_6_3:setPosition(ccp(0, 220))
	var_6_0.effectNode:addChild(var_6_3)

	local var_6_4 = CCSprite:create()

	var_6_4:setAnchorPoint(ccp(0.5, 0.5))
	var_6_4:setPosition(ccp(0, 220))
	var_6_0.effectNode:addChild(var_6_4)

	local var_6_5 = CCArray:create()

	for iter_6_0 = 1, 12 do
		local var_6_6 = CCSprite:createWithSpriteFrameName(string.format("smsr_light_%02d.png", iter_6_0))

		var_6_5:addObject(var_6_6:displayFrame())
	end

	local var_6_7 = CCAnimation:createWithSpriteFrames(var_6_5, 0.1)
	local var_6_8 = CCAnimate:create(var_6_7)

	var_6_4:runAction(CCRepeatForever:create(var_6_8))
	var_6_4:setScaleX(0.15053763440860216)
	var_6_4:setScaleY(0.3181818181818182)

	local var_6_9 = CCSprite:createWithSpriteFrameName("smsr_tit_draw_hdbw.png")

	var_6_0.effectNode:addChild(var_6_9)
	var_6_9:setPosition(ccp(0, 270))

	local var_6_10 = CCArray:create()

	var_6_10:addObject(CCMoveBy:create(0.5, ccp(0, 15)))
	var_6_10:addObject(CCDelayTime:create(0.1))
	var_6_10:addObject(CCMoveBy:create(0.5, ccp(0, -15)))
	var_6_10:addObject(CCDelayTime:create(0.1))
	var_6_9:runAction(CCRepeatForever:create(CCSequence:create(var_6_10)))

	local var_6_11

	if arg_6_0 <= 3 then
		var_6_11 = CCSprite:createWithSpriteFrameName(var_0_2.manInfo[arg_6_0].info)
	else
		var_6_11 = CCSprite:create("res/ui/common/text/resource/res_title_" .. var_0_2.picToResId[arg_6_1] .. ".png")
	end

	var_6_0.effectNode:addChild(var_6_11)
	var_6_11:setPosition(ccp(0, 60))
	var_6_11:setScale(2)

	local var_6_12 = CCArray:create()
	local var_6_13 = CCMoveTo:create(0.5, ccp(0, 160))
	local var_6_14 = CCScaleTo:create(0.5, 1)

	var_6_12:addObject(CCSpawn:createWithTwoActions(var_6_13, var_6_14))
	var_6_12:addObject(CCDelayTime:create(1))
	var_6_12:addObject(CCCallFuncN:create(function()
		var_6_0.effectNode:removeFromParentAndCleanup(true)

		var_6_0.effectNode = nil

		var_0_1.tradeGetTradeInfo()
	end))
	var_6_11:runAction(CCSequence:create(var_6_12))
end
