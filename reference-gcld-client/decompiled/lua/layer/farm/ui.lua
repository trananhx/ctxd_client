farmUI = {}

tool.requireRes("farm")
require("lua/common/tool")

local var_0_0 = farmControl
local var_0_1 = farmUI
local var_0_2 = farmConstant

var_0_1.uiTable = {}
var_0_1.armyAnimNodes = {}

function var_0_1.createFarmArea()
	local var_1_0 = createBaseLayer()

	smgr.registerLayer(var_1_0, "farmAreaLayer")
	var_1_0:registerScriptTouchHandler(var_0_1.onTouch)
	var_1_0:setTouchEnabled(true)

	var_1_0.onEnter = var_0_0.onEnter
	var_1_0.onExit = var_0_0.onExit
	var_0_1.uiTable = {}
	var_0_1.uiTable = autoUI.initUI(var_1_0, getFarmAreaData())

	var_0_1.addButtons(var_1_0)

	var_0_1.armyAnimNodes = {}

	var_0_0.getFarmInfo()

	return var_1_0
end

function var_0_1.addButtons(arg_2_0)
	local var_2_0 = {}

	uiutil.initWidgets(var_2_0, getFarmButtonLayout())

	for iter_2_0, iter_2_1 in pairs(var_2_0.widgets) do
		var_0_1.uiTable[iter_2_0] = iter_2_1
	end

	arg_2_0:addChild(var_2_0.widgets.root, 201)
	var_2_0.widgets.zhengchanglianbing:addHandleOfControlEvent(function(...)
		var_0_1.farmStartAllButtonTap(5)
	end, CCControlEventTouchUpInside)
	var_2_0.widgets.yezhanchuishi:addHandleOfControlEvent(function(...)
		var_0_1.farmStartAllButtonTap(4)
	end, CCControlEventTouchUpInside)
	var_2_0.widgets.complete:addHandleOfControlEvent(function(...)
		var_0_1.farmStopAllButtonTap()
	end, CCControlEventTouchUpInside)
	var_2_0.widgets.jianshaohaoliang:addHandleOfControlEvent(function(...)
		var_0_1.farmStartAllButtonTap(1)
	end, CCControlEventTouchUpInside)
	var_2_0.widgets.fanbeishadi:addHandleOfControlEvent(function(...)
		var_0_1.farmStartAllButtonTap(2)
	end, CCControlEventTouchUpInside)
	var_2_0.widgets.zengqiangzhanli:addHandleOfControlEvent(function(...)
		var_0_1.farmStartAllButtonTap(3)
	end, CCControlEventTouchUpInside)
	var_2_0.widgets.back:addHandleOfControlEvent(var_0_1.backButtonTap, CCControlEventTouchUpInside)
end

function var_0_1.onTouch(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0 == CCTOUCHBEGAN then
		return true
	elseif arg_9_0 == CCTOUCHMOVED then
		return true
	elseif arg_9_0 == CCTOUCHENDED then
		for iter_9_0, iter_9_1 in pairs(var_0_1.armyAnimNodes) do
			if tool.checkIfTouch(iter_9_1, arg_9_1, arg_9_2) then
				if iter_9_1.tianfeng and iter_9_1.tianfeng == true then
					log.info("touch tianfeng")
					var_0_1.showTianFengTips()

					return true
				end

				var_0_1.handlerArmyNodeTap(iter_9_1.general, arg_9_1, arg_9_2)
			end
		end

		return true
	end
end

function var_0_1.showArmy(arg_10_0, arg_10_1)
	local var_10_0 = rmgr.getArmy("att", arg_10_0.generalTroop)
	local var_10_1 = var_10_0.win

	if arg_10_0.leftTime and arg_10_0.leftTime > 0 then
		-- block empty
	else
		var_10_1 = var_10_0.idle
	end

	local var_10_2 = CCAnimation:createWithSpriteFrames(var_10_1, 0.1)
	local var_10_3 = CCAnimate:create(var_10_2)
	local var_10_4 = CCRepeatForever:create(var_10_3)
	local var_10_5 = CCSprite:create()

	var_0_1.uiTable.farmBackground:addChild(var_10_5)
	var_10_5:setAnchorPoint(ccp(0.5, 0.5))
	var_10_5:setPosition(arg_10_1)
	var_10_5:runAction(var_10_4)
	log.info("army added@@@@@@@@@@@@@@@")

	local var_10_6 = CCSprite:create("res/ui/farm/farm_gray_bg.png")

	var_0_1.uiTable.farmBackground:addChild(var_10_6)
	var_10_6:setPosition(ccp(arg_10_1.x, arg_10_1.y - 10))
	var_10_6:setContentSize(CCSizeMake(118, 80))

	var_10_6.general = {}
	var_10_6.general = arg_10_0
	var_0_1.armyAnimNodes[#var_0_1.armyAnimNodes + 1] = var_10_6

	if user.player.id == arg_10_0.playerId then
		local var_10_7 = CCStrokeLabelTTF:create("", "Thonburi", 18)

		var_10_7:setColor(colorText[10003])

		if arg_10_0.leftTime and arg_10_0.leftTime > 0 then
			var_0_1.allCompleted = false

			if arg_10_0.type == 0 then
				local var_10_8 = TimerLabelClass.new({
					fontSize = 18,
					font = "Thonburi",
					labelType = "LabelStroke",
					triggerTime = 0,
					time = 600000 - arg_10_0.farmCd % 600000,
					format = language.get("190112_sy")
				})

				var_10_7:setString(language.get("190112_lxr", arg_10_0.reward + var_0_1.farmInfo.rewardFoodPerTenMinutes))

				local var_10_9 = rmgr.getAnimation("farmAddFoodEffect")
				local var_10_10 = CCAnimation:createWithSpriteFrames(var_10_9, 0.1)
				local var_10_11 = CCAnimate:create(var_10_10)
				local var_10_12 = CCRepeatForever:create(var_10_11)
				local var_10_13 = CCSprite:create()

				var_10_6:addChild(var_10_13)
				var_10_13:setPosition(ccp(59, 50))
				var_10_13:runAction(var_10_12)
				var_10_6:addChild(var_10_7)
				var_10_7:setPosition(ccp(59, 14))
				var_10_6:addChild(var_10_8)
				var_10_8:setPosition(ccp(59, 50))
				var_10_8:setCallback(function(...)
					var_0_0.getFarmInfo()
				end)
			else
				local var_10_14 = TimerLabelClass.new({
					fontSize = 18,
					font = "Thonburi",
					labelType = "LabelStroke",
					triggerTime = 0,
					format = "@M:@S",
					time = arg_10_0.leftTime
				})

				if arg_10_0.type == 1 then
					var_10_7:setString(language.get("190113_1"))
					var_10_7:setColor(colorQuality[2])
				elseif arg_10_0.type == 2 then
					var_10_7:setString(language.get("190113_2"))
					var_10_7:setColor(colorQuality[3])
				elseif arg_10_0.type == 3 then
					var_10_7:setString(language.get("190113_3"))
					var_10_7:setColor(colorQuality[4])
				elseif arg_10_0.type == 4 then
					var_10_7:setString(language.get("190113_4"))
					var_10_7:setColor(colorQuality[5])
				elseif arg_10_0.type == 5 then
					var_10_7:setString(language.get(190110))
					var_10_7:setColor(colorQuality[1])
				end

				local var_10_15 = rmgr.getAnimation("farmAddExpEffect")
				local var_10_16 = CCAnimation:createWithSpriteFrames(var_10_15, 0.1)
				local var_10_17 = CCAnimate:create(var_10_16)
				local var_10_18 = CCRepeatForever:create(var_10_17)
				local var_10_19 = CCSprite:create()

				var_10_6:addChild(var_10_19)
				var_10_19:setPosition(ccp(59, 50))
				var_10_19:runAction(var_10_18)

				local var_10_20 = createRichNode({
					var_10_7,
					var_10_14
				}, 0.5)

				var_10_6:addChild(var_10_20)
				var_10_20:setPosition(ccp(59, 14))
				var_10_14:setCallback(function(...)
					var_0_0.getFarmInfo()
				end)

				if not var_0_1.generalTimer then
					var_0_1.generalTimer = {}
				end

				var_0_1.generalTimer[arg_10_0.generalId] = var_10_14
			end

			if conf.language == "vie" then
				var_10_7:setString(var_10_7:getString() .. " ")
			end
		else
			if arg_10_0.type then
				if arg_10_0.type == 0 then
					var_10_7:setString(language.get(191001))
					var_10_7:setColor(colorQuality[3])
				else
					var_10_7:setString(language.get(191002))
					var_10_7:setColor(colorQuality[3])
				end
			elseif user.player.food < user.player.foodMax then
				var_10_7:setString(language.get(190111))
				var_10_7:setColor(colorQuality[1])
			else
				var_10_7:setString(language.get("190112_1"))
				var_10_7:setColor(colorQuality[5])
			end

			var_10_6:addChild(var_10_7)
			var_10_7:setPosition(ccp(59, 14))
		end
	else
		local var_10_21 = CCStrokeLabelTTF:create(arg_10_0.generalName, "Thonburi", 18)

		var_10_21:setColor(colorQuality[arg_10_0.generalQuality])

		local var_10_22 = CCStrokeLabelTTF:create(string.format("  (%s)", arg_10_0.playerName), "Thonburi", 18)

		var_10_22:setColor(colorForce[arg_10_0.forceId])

		local var_10_23 = createRichNode({
			var_10_21,
			var_10_22
		}, 0.5)

		var_10_6:addChild(var_10_23)
		var_10_23:setPosition(ccp(59, 14))
	end
end

function var_0_1.updateFarmArea(arg_13_0, arg_13_1)
	pcall(var_0_1.uiTable.farmBackground.removeAllChildrenWithCleanup, var_0_1.uiTable.farmBackground, true)

	var_0_1.armyAnimNodes = {}
	var_0_1.generalTimer = {}
	var_0_1.farmInfo = arg_13_0

	var_0_1.addTianFeng()

	if arg_13_1 and arg_13_1 == 2 then
		if arg_13_0.farmItem.normalItemNum then
			var_0_1.uiTable.remainTokenLabel:setString("×" .. arg_13_0.farmItem.normalItemNum)
			var_0_1.uiTable.zhengchanglianbing:setVisible(true)
			var_0_1.uiTable.yezhanchuishi:setVisible(false)
			var_0_1.uiTable.jianshaohaoliang:setVisible(false)
			var_0_1.uiTable.fanbeishadi:setVisible(false)
			var_0_1.uiTable.zengqiangzhanli:setVisible(false)
			var_0_1.uiTable.zclb:setString(language.get(191003, arg_13_0.farmItem.normalItemNum))
		else
			var_0_1.uiTable.remainTokenLabel:setString("×" .. arg_13_0.farmItem.foodAdderItemNum + arg_13_0.farmItem.attackAdderItemNum + arg_13_0.farmItem.doubleKillItemNum + arg_13_0.farmItem.reduceCostItemNum)
			var_0_1.uiTable.zhengchanglianbing:setVisible(false)
			var_0_1.uiTable.yezhanchuishi:setVisible(true)
			var_0_1.uiTable.jianshaohaoliang:setVisible(true)
			var_0_1.uiTable.fanbeishadi:setVisible(true)
			var_0_1.uiTable.zengqiangzhanli:setVisible(true)
			var_0_1.uiTable.yzcs:setString(language.get(191003, arg_13_0.farmItem.foodAdderItemNum))
			var_0_1.uiTable.zqzl:setString(language.get(191003, arg_13_0.farmItem.attackAdderItemNum))
			var_0_1.uiTable.fbsd:setString(language.get(191003, arg_13_0.farmItem.doubleKillItemNum))
			var_0_1.uiTable.jshl:setString(language.get(191003, arg_13_0.farmItem.reduceCostItemNum))
		end
	else
		local var_13_0 = 0

		if arg_13_0.generals then
			var_13_0 = #arg_13_0.generals
		end

		if var_13_0 > 20 then
			var_13_0 = 20
		end

		local var_13_1 = 1
		local var_13_2 = 1
		local var_13_3 = 1
		local var_13_4 = 0

		var_0_1.allCompleted = true

		local var_13_5 = {}

		for iter_13_0 = 1, var_13_0 do
			if arg_13_0.generals[iter_13_0].playerId == user.player.id then
				showTable(arg_13_0.generals[iter_13_0])

				var_13_4 = var_13_4 + 1

				if arg_13_0.generals[iter_13_0].type then
					var_13_5[#var_13_5 + 1] = arg_13_0.generals[iter_13_0]

					if arg_13_0.generals[iter_13_0].type == 0 then
						var_0_1.showArmy(arg_13_0.generals[iter_13_0], var_0_2.farmPositions[var_13_1])

						var_13_1 = var_13_1 + 1
					else
						var_0_1.showArmy(arg_13_0.generals[iter_13_0], var_0_2.trainPositions[var_13_2])

						var_13_2 = var_13_2 + 1

						showTable(arg_13_0.generals[iter_13_0])
					end
				else
					log.info("!!!!!!!!!!!!general should AutoMove!!!!!!!!!!")
					var_0_1.showArmy(arg_13_0.generals[iter_13_0], var_0_2.farmPositions[var_13_1])

					var_13_1 = var_13_1 + 1
				end
			end
		end
	end

	if arg_13_0.nowFarm then
		var_0_1.uiTable.farmTitleAtlas:setString(arg_13_0.nowFarm.farmLv)
	else
		var_0_1.uiTable.farmTitleAtlas:setString("0")
	end
end

function var_0_1.showGeneralMenu(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

	var_0_1.mask = var_14_0

	var_14_0:registerScriptTouchHandler(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == CCTOUCHBEGAN then
			return true
		elseif arg_15_0 == CCTOUCHMOVED then
			return true
		elseif arg_15_0 == CCTOUCHENDED then
			var_14_0:removeFromParentAndCleanup(true)

			var_0_1.mask = nil

			return true
		end
	end, false, true)
	var_14_0:setTouchEnabled(true)

	local var_14_1 = {}

	uiutil.initWidgets(var_14_1, geteFarmGeneralMenuLayout())

	for iter_14_0, iter_14_1 in pairs(var_14_1.widgets) do
		var_0_1.uiTable[iter_14_0] = iter_14_1
	end

	var_14_0:addChild(var_14_1.widgets.generalMenuLayout)

	local var_14_2 = CCSprite:create("res/ui/farm/btn_a_up_lig.png")

	var_14_2:setPosition(77, 30)

	if var_0_1.farmInfo.farmItem.normalItemNum then
		var_0_1.uiTable.lianbing:setVisible(true)
		var_0_1.uiTable.chuishi:setVisible(false)
		var_0_1.uiTable.jianhao:setVisible(false)
		var_0_1.uiTable.fanbei:setVisible(false)
		var_0_1.uiTable.qiangzhan:setVisible(false)
		var_0_1.uiTable.lb:setString(language.get(191003, var_0_1.farmInfo.farmItem.normalItemNum))
	else
		var_0_1.uiTable.lianbing:setVisible(false)
		var_0_1.uiTable.chuishi:setVisible(true)
		var_0_1.uiTable.jianhao:setVisible(true)
		var_0_1.uiTable.fanbei:setVisible(true)
		var_0_1.uiTable.qiangzhan:setVisible(true)
		var_0_1.uiTable.cs:setString(language.get(191003, var_0_1.farmInfo.farmItem.foodAdderItemNum))
		var_0_1.uiTable.qz:setString(language.get(191003, var_0_1.farmInfo.farmItem.attackAdderItemNum))
		var_0_1.uiTable.fb:setString(language.get(191003, var_0_1.farmInfo.farmItem.doubleKillItemNum))
		var_0_1.uiTable.jh:setString(language.get(191003, var_0_1.farmInfo.farmItem.reduceCostItemNum))
	end

	var_0_1.uiTable.lianbing:addHandleOfControlEvent(function(...)
		var_0_1.farmStartButtonTap(5)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.chuishi:addHandleOfControlEvent(function(...)
		var_0_1.farmStartButtonTap(4)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.jianhao:addHandleOfControlEvent(function(...)
		var_0_1.farmStartButtonTap(1)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.fanbei:addHandleOfControlEvent(function(...)
		var_0_1.farmStartButtonTap(2)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.qiangzhan:addHandleOfControlEvent(function(...)
		var_0_1.farmStartButtonTap(3)
	end, CCControlEventTouchUpInside)
	var_0_1.uiTable.complete1:addHandleOfControlEvent(function(...)
		if arg_14_0.type == 0 then
			if var_0_1.currentGeneralId then
				pcall(var_0_1.mask.removeFromParentAndCleanup, var_0_1.mask, true)
				var_0_0.farmGetReward(var_0_1.currentGeneralId)
			end
		elseif not arg_14_0.type then
			pcall(var_0_1.mask.removeFromParentAndCleanup, var_0_1.mask, true)
			var_0_0.farmAutoMove(arg_14_0)
		else
			var_0_1.farmStopButtonTap()
		end
	end, CCControlEventTouchUpInside)

	if arg_14_0.type == 0 then
		-- block empty
	elseif arg_14_0.type == 1 then
		var_0_1.uiTable.jianhao:addChild(var_14_2)
	elseif arg_14_0.type == 2 then
		var_0_1.uiTable.fanbei:addChild(var_14_2)
	elseif arg_14_0.type == 3 then
		var_0_1.uiTable.qiangzhan:addChild(var_14_2)
	elseif arg_14_0.type == 4 then
		var_0_1.uiTable.chuishi:addChild(var_14_2)
	elseif arg_14_0.type == 5 then
		var_0_1.uiTable.lianbing:setVisible(false)
	elseif not arg_14_0.type then
		-- block empty
	end

	if arg_14_1 > visibleSize.width * 0.5 then
		var_0_1.uiTable.generalMenuLayout:setPositionX(arg_14_1 - 130)
	else
		var_0_1.uiTable.generalMenuLayout:setPositionX(arg_14_1)
	end

	if arg_14_2 > visibleSize.height * 0.5 and not var_0_1.farmInfo.farmItem.normalItemNum then
		var_0_1.uiTable.generalMenuLayout:setPositionY(arg_14_2 - 200)
	else
		var_0_1.uiTable.generalMenuLayout:setPositionY(arg_14_2)
	end

	smgr.rootLayer:addChild(var_14_0, 60000)
end

function var_0_1.createGeneralInfoPanel()
	local var_22_0

	if data.force == 1 then
		local var_22_1 = CCSprite:create("res/ui/common/text/country/guojia-wei.png")
	elseif data.force == 2 then
		local var_22_2 = CCSprite:create("res/ui/common/text/country/guojia-shu.png")
	elseif data.force == 3 then
		local var_22_3 = CCSprite:create("res/ui/common/text/country/guojia-wu.png")
	else
		local var_22_4 = CCSprite:create("res/ui/common/text/country/guojia-man.png")
	end
end

function var_0_1.farmAllGetRewardButtonTap()
	var_0_0.farmStopAll()
end

function var_0_1.farmStopAllButtonTap()
	local function var_24_0()
		var_0_0.farmStopAll()
	end

	local var_24_1 = 0
	local var_24_2 = 0

	for iter_24_0, iter_24_1 in pairs(var_0_1.generalTimer) do
		local var_24_3 = iter_24_1:getTime()

		var_24_2 = var_24_2 + math.ceil(var_0_1.farmInfo.cdRecoverGold * math.ceil(var_24_3 / 1000 / 60))
	end

	if var_24_2 > 0 then
		local var_24_4 = language.get("191003_lxr", var_24_2)

		messageBox.showChargeWin(language.get(190080), var_24_4, "farmQuickFinish", var_24_0)
	else
		var_24_0()
	end
end

function var_0_1.farmStartAllButtonTap(arg_26_0)
	var_0_0.farmStartAll(arg_26_0)
end

function var_0_1.farmStartButtonTap(arg_27_0)
	if var_0_1.currentGeneralvId then
		pcall(var_0_1.mask.removeFromParentAndCleanup, var_0_1.mask, true)
		var_0_0.farmStart(var_0_1.currentGeneralvId, arg_27_0)
	end
end

function var_0_1.farmStopButtonTap()
	if var_0_1.currentGeneralId then
		pcall(var_0_1.mask.removeFromParentAndCleanup, var_0_1.mask, true)

		local function var_28_0()
			var_0_0.farmGetReward(var_0_1.currentGeneralId)
		end

		local var_28_1 = var_0_1.generalTimer[var_0_1.currentGeneralId]:getTime()
		local var_28_2 = math.ceil(var_0_1.farmInfo.cdRecoverGold * math.ceil(var_28_1 / 1000 / 60))
		local var_28_3 = language.get("191003_lxr", var_28_2)

		messageBox.showChargeWin(language.get(190080), var_28_3, "farmQuickFinish", var_28_0)
	end
end

function var_0_1.backButtonTap()
	smgr.changeScene(smgr.lastSafeScene)
end

function var_0_1.handlerArmyNodeTap(arg_31_0, arg_31_1, arg_31_2)
	log.info(" =================>handlerArmyNodeTap begin")

	if arg_31_0.playerId == user.player.id then
		var_0_1.currentGeneralId = arg_31_0.generalId
		var_0_1.currentGeneralvId = arg_31_0.vId
		var_0_1.currentGeneral = arg_31_0

		if arg_31_0.leftTime and arg_31_0.leftTime > 0 then
			var_0_1.showGeneralMenu(arg_31_0, arg_31_1, arg_31_2)
		elseif arg_31_0.type then
			var_0_0.farmGetReward(arg_31_0.generalId)
		else
			var_0_1.showGeneralMenu(arg_31_0, arg_31_1, arg_31_2)
		end
	end

	log.info("<====================handlerArmyNodeTap end")
end

function var_0_1.addTianFeng()
	local var_32_0 = CCSpriteFrameCache:sharedSpriteFrameCache()

	var_32_0:addSpriteFramesWithFile("res/ui/farm/tianfeng.plist")

	local var_32_1 = CCArray:create()

	for iter_32_0 = 1, 9 do
		local var_32_2 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("attack5000" .. iter_32_0 .. ".png")

		if var_32_2 == nil then
			log.error("animation %s error", framename)
		else
			var_32_1:addObject(var_32_2)
		end
	end

	var_32_0:removeSpriteFramesFromFile("res/ui/farm/tianfeng.plist")

	local var_32_3 = CCAnimation:createWithSpriteFrames(var_32_1, 0.1)
	local var_32_4 = CCAnimate:create(var_32_3)
	local var_32_5 = CCRepeatForever:create(var_32_4)
	local var_32_6 = CCSprite:create("res/ui/kfsy/150150.png")

	var_0_1.uiTable.farmBackground:addChild(var_32_6)
	var_32_6:setAnchorPoint(ccp(0.5, 0.5))
	var_32_6:setPosition(ccp(var_0_1.uiTable.farmBackground:getContentSize().width / 2, var_0_1.uiTable.farmBackground:getContentSize().height / 2))
	var_32_6:runAction(var_32_5)

	var_32_6.tianfeng = true
	var_0_1.armyAnimNodes[#var_0_1.armyAnimNodes + 1] = var_32_6
end

function var_0_1.showTianFengTips()
	local var_33_0 = createBaseLayer()

	local function var_33_1(arg_34_0, arg_34_1, arg_34_2)
		if arg_34_0 == CCTOUCHBEGAN then
			-- block empty
		elseif arg_34_0 == CCTOUCHENDED then
			smgr.getLayer("topLayer"):removeChild(var_33_0, true)
		end

		return true
	end

	local var_33_2 = {
		tipsBg = {
			xcenter = 0,
			anchorPointX = 0.5,
			type = "pic_9_tips",
			ycenter = 100,
			pic = "frame:common_tip_frame_small.png",
			anchorPointY = 0.5,
			middleRect = CCRectMake(0, 0, 0, 0),
			preferedSize = CCSizeMake(290, 300),
			content = {
				{
					fontSize = 22,
					type = "label",
					text = language.get(490600)
				}
			}
		}
	}

	autoUI.initUI(var_33_0, var_33_2)
	var_33_0:registerScriptTouchHandler(var_33_1, false, true)
	var_33_0:setTouchEnabled(true)
	smgr.getLayer("topLayer"):addChild(var_33_0, 10002)
	var_33_0:setVisible(true)
end
