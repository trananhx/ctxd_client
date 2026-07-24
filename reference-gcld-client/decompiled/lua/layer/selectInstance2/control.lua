selectInstanceControl = {}

local var_0_0 = selectInstanceControl
local var_0_1 = selectInstanceConstant
local var_0_2
local var_0_3
local var_0_4
local var_0_5 = 5
local var_0_6 = 0
local var_0_7 = 1
local var_0_8
local var_0_9 = 0
local var_0_10 = false
local var_0_11
local var_0_12
local var_0_13 = 0
local var_0_14 = 1
local var_0_15 = 0

var_0_0.currentNpc = -1
var_0_0.currentTerrain = -1

local var_0_16 = 10

var_0_0.isloading = false
var_0_0.ismoving = false
var_0_0.curPowerId = nil

local function var_0_17(arg_1_0)
	return {
		name = "lashInfoFrame",
		y = 0,
		type = "pic",
		anchorPointY = 0,
		pic = "res/ui/instance/bonus/fb_Bonus_view.png",
		x = visibleSize.width / 2,
		children = {
			{
				fontSize = 22,
				xcenter = 0,
				type = "label",
				y = 145,
				strokeSize = 2,
				text = language.get(131194)
			},
			{
				left = 0,
				down = 0,
				pic = "res/ui/guide/npc_xq.png",
				type = "pic"
			},
			{
				type = "button",
				buttons = {
					{
						pic2 = "frame:btn3_yel_c.png",
						name = "btn_gold",
						pic1 = "frame:btn3_yel_a.png",
						y = 60,
						x = 380
					},
					{
						pic2 = "frame:btn3_yel_c.png",
						name = "btn_token",
						pic1 = "frame:btn3_yel_a.png",
						y = 60,
						x = 580
					},
					{
						pic2 = "frame:btn_close_c.png",
						name = "btn_close",
						pic1 = "frame:btn_close_a.png",
						y = 170,
						x = 900
					}
				}
			},
			{
				fontSize = 22,
				x = 380,
				type = "label",
				y = 60,
				strokeSize = 2,
				text = language.get(131195, arg_1_0)
			},
			{
				fontSize = 22,
				x = 580,
				type = "label",
				y = 60,
				strokeSize = 2,
				text = language.get(131191)
			}
		}
	}
end

local function var_0_18(arg_2_0)
	smgr.getLayer("selectInstanceLayer"):setPosition(ccp(0, 0))

	var_0_0.powerInfo = arg_2_0.action.data

	if not user.canZhouYuJueXing then
		var_0_0.powerInfo.hasCbhsPower = false
	end

	if var_0_0.powerInfo.rewardNpcs and #var_0_0.powerInfo.rewardNpcs > 0 then
		for iter_2_0 = #var_0_0.powerInfo.rewardNpcs, 1, -1 do
			local var_2_0 = var_0_0.powerInfo.rewardNpcs[iter_2_0]

			if var_2_0.limit and var_2_0.limit.type == 3 then
				table.remove(var_0_0.powerInfo.rewardNpcs, iter_2_0)
			end
		end
	end

	if var_0_0.powerInfo.vip5BonusArmy ~= nil and var_0_0.powerInfo.vip5BonusArmy.maxHp ~= nil then
		local var_2_1 = {}

		var_2_1.countDown = 0
		var_2_1.first = 0
		var_2_1.hp = var_0_0.powerInfo.vip5BonusArmy.hp
		var_2_1.id = var_0_0.powerInfo.vip5BonusArmy.id
		var_2_1.maxHp = var_0_0.powerInfo.vip5BonusArmy.maxHp
		var_2_1.level = 50
		var_2_1.name = "vip5"
		var_2_1.pic = "vip5"
		var_2_1.pos = 503
		var_2_1.plot = ""
		var_2_1.quality = ""
		var_2_1.terrian = 6
		var_2_1.totalTime = 1
		var_2_1.type = var_0_0.powerInfo.vip5BonusArmy.type
		var_0_0.powerInfo.rewardNpcs = var_0_0.powerInfo.rewardNpcs or {}

		table.insert(var_0_0.powerInfo.rewardNpcs, var_2_1)

		var_0_0.powerInfo.rewardNpcsPos = var_0_0.powerInfo.rewardNpcsPos or {}

		table.insert(var_0_0.powerInfo.rewardNpcsPos, 503)
	end

	if var_0_0.powerInfo.powerId == 13 and var_0_0.powerInfo.hasCbhsPower and not var_0_0.powerInfo.hasCbhsNpc then
		local var_2_2 = 9999
		local var_2_3 = {
			name = language.get(135641)
		}

		var_2_3.pic = "zhouyu"
		var_2_3.id = var_2_2
		var_2_3.pos = var_2_2
		var_2_3.isCbhs = true
		var_2_3.type = 6

		table.insert(var_0_0.powerInfo.rewardNpcs, var_2_3)
		table.insert(var_0_0.powerInfo.rewardNpcsPos, var_2_2)

		var_0_0.powerInfo.hasCbhsNpc = true
	end

	var_0_0.isloading = false

	if var_0_0.ismoving == true then
		var_0_0.cacheResponse = arg_2_0

		return
	end

	var_0_10 = false

	selectInstanceUI.init()

	var_0_0.curPowerId = var_0_0.powerInfo.powerId

	guide.control.setCurrentMarkTrace("instance:" .. var_0_0.curPowerId)

	if var_0_0.powerInfo.prePowerId then
		var_0_6 = 2
		var_0_7 = 2
	else
		var_0_6 = 1
		var_0_7 = 1
	end

	if var_0_0.powerInfo.attackable then
		var_0_6 = var_0_6 + 1
	end

	var_0_8 = var_0_0.powerInfo.powerId
	var_0_12 = {}

	local var_2_4 = 1

	for iter_2_1, iter_2_2 in pairs(var_0_0.powerInfo.npcs) do
		var_0_12[iter_2_1] = {}
		var_0_12[iter_2_1].normal = "fubenDituXiaodi4.png"
		var_0_12[iter_2_1].click = "fubenDituXiaodi3.png"
		var_2_4 = var_2_4 + 1
	end

	for iter_2_3 = 1, #var_0_0.powerInfo.rewardNpcsPos do
		local var_2_5 = 10 + iter_2_3
		local var_2_6 = var_0_0.powerInfo.rewardNpcsPos[iter_2_3]
		local var_2_7

		if var_0_0.powerInfo.rewardNpcsRight then
			for iter_2_4, iter_2_5 in pairs(var_0_0.powerInfo.rewardNpcsRight) do
				if iter_2_5.id == var_2_6 then
					var_2_7 = iter_2_5
				end
			end
		end

		if var_0_0.powerInfo.rewardNpcs then
			for iter_2_6, iter_2_7 in pairs(var_0_0.powerInfo.rewardNpcs) do
				if iter_2_7.id == var_2_6 then
					var_2_7 = iter_2_7
				end
			end
		end

		if var_2_7 and var_2_7.gold then
			var_0_12[var_2_5] = {}
			var_0_12[var_2_5].normal = "fubenDituXiaodi7.png"
			var_0_12[var_2_5].click = "fubenDituXiaodi6.png"
		else
			var_0_12[var_2_5] = {}
			var_0_12[var_2_5].normal = "fubenDituXiaodi2.png"
			var_0_12[var_2_5].click = "fubenDituXiaodi1.png"
		end
	end

	for iter_2_8, iter_2_9 in pairs(var_0_0.powerInfo.npcs) do
		if iter_2_9.firstWin == 1 then
			if iter_2_9.npcId == 102 then
				roleDialogue.control.loadSpeak(1929)
			end

			return
		end
	end
end

function var_0_0.handlerBuyBonusNpcAction(arg_3_0)
	cmgr.sendRequest(var_0_18, actions.getPowerInfo, "")
end

function var_0_0.onResetBonusNpc(arg_4_0, arg_4_1)
	local function var_4_0(arg_5_0)
		local var_5_0 = selectInstanceUI.uiTable["npc_" .. arg_4_1]
		local var_5_1 = CCSprite:create()

		var_5_1:setPosition(ccp(var_5_0:getContentSize().width / 2, var_5_0:getContentSize().height / 2))
		var_5_0:addChild(var_5_1)

		local var_5_2 = CCArray:create()

		for iter_5_0 = 0, 8 do
			local var_5_3 = tool.spriteFrameByName(string.format("ui01_0000%d.png", iter_5_0))

			var_5_2:addObject(var_5_3)
		end

		local var_5_4 = CCAnimation:createWithSpriteFrames(var_5_2, 0.05)
		local var_5_5 = CCAnimate:create(var_5_4)
		local var_5_6 = CCRepeat:create(var_5_5, 2)
		local var_5_7 = CCArray:create()

		var_5_7:addObject(var_5_6)
		var_5_7:addObject(CCCallFunc:create(function()
			roleDialogue.control.loadSpeak(1510)
			cmgr.sendRequest(var_0_18, actions.getPowerInfo, "")
		end))

		local var_5_8 = CCSequence:create(var_5_7)

		var_5_1:runAction(var_5_8)
	end

	cmgr.sendRequest(var_4_0, actions.resetBuyCount, arg_4_0)
end

function var_0_0.getSelectInstanceInfo(arg_7_0)
	var_0_0.powerId = arg_7_0
	var_0_0.isloading = true

	if arg_7_0 == nil then
		cmgr.sendRequest(var_0_18, actions.getPowerInfo, "")
	else
		cmgr.sendRequest(var_0_18, actions.switchPowerInfo, var_0_0.powerId)
	end
end

local function var_0_19()
	local var_8_0 = smgr.getLayer("selectInstanceLayer")
	local var_8_1 = CCMoveTo:create(0.2, ccp(-var_0_9 * 1136, 0))
	local var_8_2 = CCArray:create()

	if var_0_8 ~= var_0_0.powerInfo.powerId then
		var_8_2:addObject(CCCallFuncN:create(function()
			var_0_0.isloading = true

			cmgr.sendRequest(var_0_18, actions.switchPowerInfo, var_0_8)
		end))
	end

	if var_0_8 ~= var_0_0.powerInfo.powerId then
		var_8_2:addObject(CCCallFuncN:create(function()
			var_0_0.ismoving = true
		end))
	end

	var_8_2:addObject(var_8_1)

	if var_0_8 ~= var_0_0.powerInfo.powerId then
		var_8_2:addObject(CCCallFuncN:create(function()
			var_0_0.ismoving = false
		end))
	end

	if var_0_8 ~= var_0_0.powerInfo.powerId then
		var_8_2:addObject(CCCallFuncN:create(function()
			if var_0_0.isloading == false then
				var_0_18(var_0_0.cacheResponse)
			end

			var_0_10 = false
		end))
	end

	var_8_0:runAction(CCSequence:create(var_8_2))
end

local function var_0_20(arg_13_0, arg_13_1)
	var_0_2 = ccp(arg_13_0, arg_13_1)
	var_0_4 = ccp(arg_13_0, arg_13_1)

	if var_0_0.powerInfo then
		for iter_13_0 = 1, #var_0_0.powerInfo.npcs do
			local var_13_0 = selectInstanceUI.uiTable["npc_" .. iter_13_0]

			if var_13_0 and tool.checkIfTouch(var_13_0, arg_13_0, arg_13_1) then
				log.info("触摸到了%s", iter_13_0)

				local var_13_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_0_12[iter_13_0].click)

				var_13_0:setDisplayFrame(var_13_1)

				var_0_11 = iter_13_0

				log.info("set highlight pos:%s", var_0_11)

				return true
			end
		end

		if var_0_0.powerInfo.rewardNpcsPos then
			for iter_13_1 = 1, #var_0_0.powerInfo.rewardNpcsPos do
				local var_13_2 = 10 + iter_13_1
				local var_13_3 = selectInstanceUI.uiTable["npc_" .. var_13_2]

				if var_13_3 and tool.checkIfTouch(var_13_3, arg_13_0, arg_13_1) then
					log.info("触摸到了%s", var_13_2)

					local var_13_4 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_0_12[var_13_2].click)

					var_13_3:setDisplayFrame(var_13_4)

					var_0_11 = var_13_2

					log.info("set highlight pos:%s", var_0_11)

					return true
				end
			end
		end
	end

	return true
end

local function var_0_21(arg_14_0, arg_14_1)
	if var_0_10 then
		return
	end

	local var_14_0 = smgr.getLayer("selectInstanceLayer")
	local var_14_1 = ccp(arg_14_0, arg_14_1)
	local var_14_2 = ccp(var_14_0:getPositionX() + var_14_1.x - var_0_4.x, var_14_0:getPositionY())

	if not var_0_0.powerInfo.prePowerId and var_14_2.x > 0 then
		var_14_2 = ccp(0, 0)
	end

	if not var_0_0.powerInfo.attackable and var_14_2.x < 0 then
		var_14_2 = ccp(0, 0)
	end

	var_14_0:setPosition(var_14_2)

	var_0_4 = var_14_1
end

local function var_0_22(arg_15_0, arg_15_1)
	var_0_10 = true

	if var_0_11 then
		log.info("反转", var_0_11)

		local var_15_0 = selectInstanceUI.uiTable["npc_" .. var_0_11]
		local var_15_1 = CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName(var_0_12[var_0_11].normal)

		var_15_0:setDisplayFrame(var_15_1)
	end

	var_0_9 = 0

	local var_15_2 = smgr.getLayer("selectInstanceLayer")

	var_0_3 = ccp(arg_15_0, arg_15_1)

	local var_15_3 = var_0_3.x - var_0_2.x

	if math.abs(var_15_3) < 15 then
		var_0_0.currentNpc = -1
		var_0_0.currentTerrain = -1

		if var_0_11 and var_0_11 <= 10 then
			local var_15_4 = var_0_0.powerInfo.npcs[var_0_11]

			var_0_0.currentNpc = var_15_4.npcId
			var_0_0.currentTerrain = var_15_4.terrain

			log.info("npc.npcId, npc.terrain", var_15_4.npcId, var_15_4.terrain)

			if var_0_0.powerInfo.Matrix and var_15_4.npcId <= 128 and var_15_4.npcId >= 124 then
				log.info("5关有阵型，显示阵型面板")
				selectInstanceUI.showZhengxing(var_0_0.powerInfo.Matrix)
			elseif var_15_4.limit and var_15_4.limit.chuanguoyuxi and var_15_4.limit.chuanguoyuxi == 1 then
				local function var_15_5(arg_16_0)
					var_15_4.limit.chuanguoyuxi = 2

					roleDialogue.control.loadSpeak(2140)
				end

				cmgr.sendRequest(var_15_5, actions.activateLv3)
			else
				bmgr.tryEnterBattle(battleType.BATTLE_ARMY, {
					targetId = var_15_4.npcId,
					terrain = var_15_4.terrain
				})
			end

			var_0_11 = nil

			return
		elseif var_0_11 and var_0_11 > 10 then
			local var_15_6 = var_0_0.powerInfo.rewardNpcsPos[var_0_11 - 10]
			local var_15_7

			if var_0_0.powerInfo.rewardNpcsRight then
				for iter_15_0, iter_15_1 in pairs(var_0_0.powerInfo.rewardNpcsRight) do
					if iter_15_1.id == var_15_6 then
						var_15_7 = iter_15_1
					end
				end
			end

			if var_0_0.powerInfo.rewardNpcs then
				for iter_15_2, iter_15_3 in pairs(var_0_0.powerInfo.rewardNpcs) do
					if iter_15_3.pos == var_15_6 then
						var_15_7 = iter_15_3
					end
				end
			end

			if var_15_7.isCbhs then
				smgr.changeScene(SCENE_CBHS_POWER)
			elseif var_15_7.gold then
				if var_0_0.powerInfo.tokenNum > 0 and var_15_7.buyCount > 0 then
					local var_15_8 = createBaseLayer()

					local function var_15_9(arg_17_0, arg_17_1, arg_17_2)
						return true
					end

					var_15_8:registerScriptTouchHandler(var_15_9, false, true)
					var_15_8:setTouchEnabled(true)

					local var_15_10 = smgr.getLayer("topLayer")

					var_15_10:addChild(var_15_8, 10001)

					local var_15_11 = {}

					autoUI.createUI(var_15_8, var_0_17(var_15_7.gold), var_15_11)
					var_15_11.btn_close:setScale(2)
					var_15_11.btn_gold:registerScriptTapHandler(function()
						messageBox.showChargeWin("", language.get(150001, var_15_7.gold), "buyBonusArmyGold", function()
							cmgr.sendRequest(var_0_0.handlerBuyBonusNpcAction, actions.buyBonusNpc, var_15_7.id)
							var_15_10:removeChild(var_15_8, true)
						end)
					end)

					local var_15_12 = var_0_11

					var_15_11.btn_token:registerScriptTapHandler(function()
						messageBox.confirm(language.get(131192), function()
							var_0_0.onResetBonusNpc(var_15_7.id, var_15_12)
							var_15_10:removeChild(var_15_8, true)
						end)
					end)
					var_15_11.btn_close:registerScriptTapHandler(function()
						var_15_10:removeChild(var_15_8, true)
					end)
				else
					messageBox.showChargeWin("", language.get(150001, var_15_7.gold), "buyBonusArmyGold", function()
						cmgr.sendRequest(var_0_0.handlerBuyBonusNpcAction, actions.buyBonusNpc, var_15_7.id)
					end)
				end
			else
				require("lua/layer/selectInstance2/fbBonus/ui")

				local var_15_13 = fbBonus.ui.show(var_15_7.id)

				smgr.getLayer("topLayer"):addChild(var_15_13, 10001)
			end
		end
	elseif var_15_3 < -300 then
		if var_0_7 < var_0_6 then
			var_0_7 = var_0_6
			var_0_9 = 1
			var_0_8 = var_0_0.powerInfo.nextPowerId
		end
	elseif var_15_3 > 300 and var_0_7 == 2 then
		var_0_7 = 1
		var_0_9 = -1
		var_0_8 = var_0_0.powerInfo.prePowerId
	end

	var_0_11 = nil

	var_0_19()
end

function var_0_0.onTouch(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_0 == CCTOUCHBEGAN then
		return var_0_20(arg_24_1, arg_24_2)
	elseif arg_24_0 == CCTOUCHMOVED then
		return var_0_21(arg_24_1, arg_24_2)
	elseif arg_24_0 == CCTOUCHENDED then
		return var_0_22(arg_24_1, arg_24_2)
	end
end

local function var_0_23()
	local var_25_0 = smgr.getLayer("selectInstanceLayer")
	local var_25_1 = var_25_0:getChildByTag(var_0_1.HAND_TAG)

	if var_25_1 then
		var_25_1:stopAllActions()
		var_25_0:removeChild(var_25_1, true)
	end

	local var_25_2 = var_25_0:getChildByTag(var_0_1.ENTER_NEXT_TAG)

	if var_25_2 then
		var_25_0:removeChild(var_25_2, true)
	end

	var_0_15 = 0
	var_0_14 = 1
end

local function var_0_24()
	local var_26_0 = smgr.getLayer("selectInstanceLayer")

	selectInstanceUI.uiTable.fbTitleBgSprite:setVisible(true)
	var_0_23()

	var_0_13 = 0
	var_0_15 = 0
	var_0_14 = 1
end

local function var_0_25()
	pcall(function()
		local var_28_0 = smgr.getLayer("selectInstanceLayer")

		selectInstanceUI.uiTable.fbTitleBgSprite:setVisible(false)
		var_0_23()

		var_0_13 = 1
		var_0_15 = 0
		var_0_14 = 1
	end)
end

function var_0_0.updateScheduler(arg_29_0)
	if var_0_16 < 10 then
		var_0_16 = var_0_16 + 1

		return
	else
		var_0_16 = 0
	end

	if user.curMainTask.taskId < 62 then
		return
	end

	if not var_0_0.powerInfo then
		return
	end

	if var_0_0.powerInfo.attackable and var_0_14 == 1 then
		var_0_15 = var_0_15 + 1

		log.info("secondCount:%s", var_0_15)

		if var_0_15 >= 0 then
			var_0_14 = 0

			local var_29_0 = smgr.getLayer("selectInstanceLayer")
			local var_29_1 = CCCallFuncN:create(function(arg_30_0)
				local var_30_0 = tolua.cast(arg_30_0, "CCSprite")

				var_29_0:removeChild(var_30_0, true)
			end)
			local var_29_2 = tool.spriteByName("fubenDituShouzhi.PNG")

			var_29_2:setPosition(ccp(visibleSize.width * 773 / 960, 176))
			var_29_2:setOpacity(0)
			var_29_0:addChild(var_29_2, 102, var_0_1.HAND_TAG)

			local var_29_3 = CCProgressTimer:create(tool.spriteByName("fubenDituJinruxiayizhang1.png"))

			var_29_3:setType(kCCProgressTimerTypeBar)
			var_29_3:setMidpoint(ccp(0, 0))
			var_29_3:setBarChangeRate(ccp(1, 0))
			var_29_3:setPosition(ccp(visibleSize.width * 693 / 960, 238))
			var_29_0:addChild(var_29_3, 101, var_0_1.ENTER_NEXT_TAG)

			local var_29_4 = CCArray:create()

			var_29_4:addObject(CCFadeIn:create(0.3))
			var_29_4:addObject(CCCallFuncN:create(function(arg_31_0)
				var_29_2:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi1.PNG"))
			end))
			var_29_4:addObject(CCMoveBy:create(0.8, ccp(-175, 0)))
			var_29_4:addObject(CCDelayTime:create(0.3))
			var_29_4:addObject(CCCallFuncN:create(function(arg_32_0)
				var_29_2:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi.PNG"))
				var_29_2:setPosition(ccp(visibleSize.width * 773 / 960, 176))
			end))
			var_29_4:addObject(CCDelayTime:create(0.3))
			var_29_4:addObject(CCCallFuncN:create(function(arg_33_0)
				var_29_2:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi1.PNG"))
			end))
			var_29_4:addObject(CCMoveBy:create(0.8, ccp(-175, 0)))
			var_29_4:addObject(CCDelayTime:create(0.3))
			var_29_4:addObject(CCCallFuncN:create(function(arg_34_0)
				var_29_0:removeChild(var_29_3, true)
			end))
			var_29_4:addObject(var_29_1)

			local var_29_5 = CCSequence:create(var_29_4)

			var_29_2:runAction(var_29_5)

			local var_29_6 = CCProgressTo:create(1, 100)
			local var_29_7 = CCCallFuncN:create(function()
				local var_35_0 = CCArray:create()

				var_35_0:addObject(CCScaleTo:create(0.5, 1.25))
				var_35_0:addObject(CCScaleTo:create(0.5, 1))
				var_29_3:runAction(CCRepeatForever:create(CCSequence:create(var_35_0)))
			end)
			local var_29_8 = CCArray:create()

			var_29_8:addObject(var_29_6)
			var_29_8:addObject(var_29_7)
			var_29_3:runAction(CCSequence:create(var_29_8))

			var_0_14 = 0
			var_0_15 = 2
		end
	elseif var_0_0.powerInfo.attackable and var_0_14 == 0 then
		var_0_15 = var_0_15 - 1

		if var_0_15 <= 0 then
			var_0_14 = 1
		end
	end
end

function var_0_0.onEnter()
	playerInfoUI.show()
	eventManager.registerEvent("fbTitleSetVisibleTrue", var_0_24)
	eventManager.registerEvent("fbTitleSetVisibleFalse", var_0_25)
	eventManager.registerEvent("refreshInstance", var_0_0.getSelectInstanceInfo)

	var_0_0.updateSchedulerId = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_0.updateScheduler, 0.1, false)

	var_0_23()
end

function var_0_0.onExit()
	eventManager.unregisterEvent("fbTitleSetVisibleTrue", var_0_24)
	eventManager.unregisterEvent("fbTitleSetVisibleFalse", var_0_25)
	eventManager.unregisterEvent("refreshInstance", var_0_0.getSelectInstanceInfo)

	if var_0_0.updateSchedulerId then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.updateSchedulerId)
	end
end
