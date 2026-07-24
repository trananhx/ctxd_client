selectInstanceUI = {}

tool.requireRes("selectInstance2")

selectInstanceUI.uiTable = nil

local var_0_0 = selectInstanceControl

function selectInstanceUI.init()
	local var_1_0 = smgr.getLayer("selectInstanceLayer")

	if not var_1_0 then
		return
	end

	var_1_0:removeAllChildrenWithCleanup(true)

	selectInstanceUI.uiTable = autoUI.initUI(var_1_0, getSelectInstanceData())

	for iter_1_0 = 1, #var_0_0.powerInfo.rewardNpcsPos do
		local var_1_1 = 10 + iter_1_0
		local var_1_2 = var_0_0.powerInfo.rewardNpcsPos[iter_1_0]
		local var_1_3

		if var_0_0.powerInfo.rewardNpcsRight then
			for iter_1_1, iter_1_2 in pairs(var_0_0.powerInfo.rewardNpcsRight) do
				if iter_1_2.id == var_1_2 then
					var_1_3 = iter_1_2
				end
			end
		end

		if var_0_0.powerInfo.rewardNpcs then
			for iter_1_3, iter_1_4 in pairs(var_0_0.powerInfo.rewardNpcs) do
				if iter_1_4.id == var_1_2 then
					var_1_3 = iter_1_4
				end
			end
		end

		if var_1_3 and (not var_1_3.gold or var_1_3.isCbhs) then
			local var_1_4 = selectInstanceUI.uiTable["npc_" .. var_1_1]
			local var_1_5 = CCArray:create()

			for iter_1_5 = 0, 8 do
				local var_1_6 = tool.spriteFrameByName(string.format("ui01_0000%d.png", iter_1_5))

				var_1_5:addObject(var_1_6)
			end

			local var_1_7 = CCAnimation:createWithSpriteFrames(var_1_5, 0.05)
			local var_1_8 = CCAnimate:create(var_1_7)
			local var_1_9 = CCRepeatForever:create(var_1_8)
			local var_1_10 = CCSprite:create()

			var_1_10:runAction(var_1_9)
			var_1_10:setPosition(ccp(var_1_4:getContentSize().width / 2, var_1_4:getContentSize().height / 2))
			var_1_4:addChild(var_1_10)

			if var_1_3.isCbhs then
				-- block empty
			else
				log.info("countDown=%s", var_1_3.countDown)

				local var_1_11 = createTimerLabel(var_1_3.countDown, "@H:@M:@S", "Thonburi", 22, nil, nil, nil, ccc3(218, 35, 11))

				var_1_11:setPosition(ccp(78, 51))
				selectInstanceUI.uiTable["npc_" .. 10 + iter_1_0]:addChild(var_1_11)
			end
		end
	end

	if selectInstanceUI.uiTable.tipBg then
		local var_1_12, var_1_13 = tool.getPositionInScreen(selectInstanceUI.uiTable.tipBg)

		if var_1_12 > visibleSize.width * 0.8 then
			selectInstanceUI.uiTable.tipBg:setFlipX(true)
			selectInstanceUI.uiTable.tipHead:setFlipX(true)

			local var_1_14, var_1_15 = selectInstanceUI.uiTable.tipBg:getPosition()

			selectInstanceUI.uiTable.tipBg:setPosition(ccp(var_1_14 - 350, var_1_15))

			local var_1_16, var_1_17 = selectInstanceUI.uiTable.tipHead:getPosition()

			selectInstanceUI.uiTable.tipHead:setPosition(ccp(var_1_16 - 27, var_1_17))

			local var_1_18, var_1_19 = selectInstanceUI.uiTable.tipLabel:getPosition()

			selectInstanceUI.uiTable.tipLabel:setPosition(ccp(var_1_18 - 27, var_1_19))
		end

		if user.player.playerLv >= 29 and user.player.playerLv <= 34 then
			selectInstanceUI.uiTable.tipLabel:setString(language.get(150005))
			selectInstanceUI.uiTable.tipBg:setVisible(true)
		elseif user.player.playerLv >= 35 and user.player.playerLv <= 39 then
			selectInstanceUI.uiTable.tipLabel:setString(language.get(150006))
			selectInstanceUI.uiTable.tipBg:setVisible(true)
		end
	end
end

function selectInstanceUI.show(arg_2_0)
	rmgr.loadResource("res/ui/instance/instanceMap.plist")
	rmgr.loadResource("res/ui/instance/instanceMap1.plist")
	rmgr.loadResource("res/anim/instanceAnim/bonusAnim.plist")

	local var_2_0 = createBaseLayer()

	smgr.registerLayer(var_2_0, "selectInstanceLayer")
	var_2_0:registerScriptTouchHandler(var_0_0.onTouch)
	var_2_0:setTouchEnabled(true)
	var_0_0.getSelectInstanceInfo(arg_2_0)

	var_2_0.onEnter = var_0_0.onEnter
	var_2_0.onExit = var_0_0.onExit

	menuUI.ui.show()

	var_0_0.curPowerId = arg_2_0

	return var_2_0
end

local var_0_1 = 0

function selectInstanceUI.showZhengxing(arg_3_0)
	local var_3_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_3_0:setTouchEnabled(true)
	var_3_0:registerScriptTouchHandler(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == CCTOUCHBEGAN then
			return true
		elseif arg_4_0 == CCTOUCHMOVED then
			return true
		elseif arg_4_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)

	local var_3_1 = selectInstanceUI.createMessageBox(arg_3_0, var_3_0)

	var_3_0:addChild(var_3_1)
	smgr.rootLayer:addChild(var_3_0, 60000)
end

function selectInstanceUI.createMessageBox(arg_5_0, arg_5_1)
	local var_5_0 = "Thonburi"
	local var_5_1 = 25
	local var_5_2 = 75
	local var_5_3 = 65
	local var_5_4 = {}

	var_5_4[1] = "bs"
	var_5_4[2] = "hy"
	var_5_4[3] = "yl"
	var_5_4[4] = "cs"
	var_5_4[5] = "bg"

	local var_5_5 = CCSprite:create("res/ui/messagebox/atten_view_bg.png")
	local var_5_6 = CCStrokeLabelTTF:create(title, var_5_0, 20)

	var_5_6:setPosition(ccp(var_5_5:getContentSize().width / 2, var_5_5:getContentSize().height - 23))
	var_5_6:setVisible(false)
	var_5_5:addChild(var_5_6)

	local var_5_7 = CCSprite:create("res/ui/instance/zhenxing/zxxz_title.png")

	var_5_7:setPosition(ccp(var_5_5:getContentSize().width / 2, var_5_5:getContentSize().height - 30))
	var_5_5:addChild(var_5_7)

	local var_5_8 = CCSprite:create("res/ui/instance/zhenxing/zx_btn_h.png")

	var_5_8:setVisible(false)
	var_5_5:addChild(var_5_8, 16)

	local var_5_9 = CCStrokeLabelTTF:create(language.get(490413), var_5_0, 20, 1, ccc3(15, 15, 15))

	var_5_9:setColor(ccc3(255, 255, 255))
	var_5_5:addChild(var_5_9, 16)
	var_5_9:setPosition(ccp(var_5_5:getContentSize().width / 2, var_5_5:getContentSize().height / 2 - 85))
	var_5_9:setDimensions(CCSizeMake(500, 0))

	local var_5_10 = CCMenu:create()

	for iter_5_0 = 1, #arg_5_0 do
		local var_5_11
		local var_5_12

		if arg_5_0[iter_5_0].isObtained then
			var_5_11 = CCSprite:create("res/ui/instance/zhenxing/zx_" .. var_5_4[iter_5_0] .. ".png")
			var_5_12 = CCSprite:create("res/ui/instance/zhenxing/zx_" .. var_5_4[iter_5_0] .. ".png")
		else
			var_5_11 = CCSprite:create("res/ui/instance/zhenxing/zx_" .. var_5_4[iter_5_0] .. "_gray.png")
			var_5_12 = CCSprite:create("res/ui/instance/zhenxing/zx_" .. var_5_4[iter_5_0] .. "_gray.png")
		end

		if arg_5_0[iter_5_0].isSelected then
			var_5_8:setPosition(ccp(var_5_5:getContentSize().width / 2 + var_5_2 * (iter_5_0 - 3), var_5_5:getContentSize().height / 2 - 15 + var_5_3 * ((iter_5_0 + 1) % 2)))
			var_5_8:setVisible(true)
			var_5_9:setString(arg_5_0[iter_5_0].matrixName .. ": " .. arg_5_0[iter_5_0].matrixIntro)
		end

		local function var_5_13()
			log.info("currentZhengxing: " .. iter_5_0)

			var_0_1 = iter_5_0

			if arg_5_0[iter_5_0].isObtained then
				local function var_6_0()
					var_5_8:setPosition(ccp(var_5_5:getContentSize().width / 2 + var_5_2 * (iter_5_0 - 3), var_5_5:getContentSize().height / 2 - 15 + var_5_3 * ((iter_5_0 + 1) % 2)))
					var_5_8:setVisible(true)
					var_5_9:setString(arg_5_0[iter_5_0].matrixName .. ": " .. arg_5_0[iter_5_0].matrixIntro)
				end

				cmgr.sendRequest(var_6_0, actions.selectMatrix, iter_5_0)
			else
				var_5_9:setString(arg_5_0[iter_5_0].matrixName .. ": " .. arg_5_0[iter_5_0].matrixIntro)
			end
		end

		local var_5_14 = CCMenuItemSprite:create(var_5_11, var_5_12)

		var_5_14:registerScriptTapHandler(var_5_13)
		var_5_14:setPosition(ccp(var_5_5:getContentSize().width / 2 + var_5_2 * (iter_5_0 - 3), var_5_5:getContentSize().height / 2 - 15 + var_5_3 * ((iter_5_0 + 1) % 2)))
		var_5_10:addChild(var_5_14, 15)
	end

	local var_5_15 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("btn_green_a.png"))
	local var_5_16 = CCSprite:createWithSpriteFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("btn_green_click.png"))
	local var_5_17 = CCStrokeLabelTTF:create(language.get(10001), var_5_0, 20, 2, colorText[10005])
	local var_5_18 = CCStrokeLabelTTF:create(language.get(10001), var_5_0, 20, 2, colorText[10005])

	var_5_17:setColor(colorText[10004])
	var_5_18:setColor(colorText[10004])
	var_5_15:addChild(var_5_17, 20)
	var_5_16:addChild(var_5_18, 20)
	var_5_17:setPosition(ccp(var_5_15:getContentSize().width / 2, var_5_15:getContentSize().height / 2))
	var_5_18:setPosition(ccp(var_5_15:getContentSize().width / 2, var_5_15:getContentSize().height / 2))

	local var_5_19 = CCMenuItemSprite:create(var_5_15, var_5_16)

	var_5_19:registerScriptTapHandler(function()
		log.info("确定阵型，进入战斗")
		bmgr.tryEnterBattle(battleType.BATTLE_ARMY, {
			targetId = var_0_0.currentNpc,
			terrain = var_0_0.currentTerrain
		})
		arg_5_1:removeAllChildrenWithCleanup(true)
		arg_5_1:removeFromParentAndCleanup(true)
	end)
	var_5_19:setPosition(ccp(var_5_5:getContentSize().width / 2, var_5_5:getContentSize().height / 2 - 125))
	var_5_10:addChild(var_5_19, 15)
	var_5_10:setPosition(ccp(0, 0))
	var_5_5:addChild(var_5_10, 15)

	local var_5_20 = CCStrokeLabelTTF:create(content, var_5_0, var_5_1)

	var_5_20:setDimensions(CCSizeMake(var_5_5:getContentSize().width - 100, 200))
	var_5_20:setHorizontalAlignment(kCCTextAlignmentCenter)
	var_5_20:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
	var_5_20:setPosition(ccp(var_5_5:getContentSize().width / 2, 200))
	var_5_5:addChild(var_5_20)
	var_5_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	return var_5_5
end
