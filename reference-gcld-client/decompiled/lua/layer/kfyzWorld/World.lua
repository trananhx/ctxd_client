local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = 0

	if arg_1_0 ~= arg_1_1 then
		local var_1_1
		local var_1_2

		if user.jpsIndex == 0 then
			var_1_1 = worldConstant.BUILDING_INFO["world_building_" .. arg_1_0]
			var_1_2 = worldConstant.BUILDING_INFO["world_building_" .. arg_1_1]
		else
			var_1_1 = worldDongyingConstant.BUILDING_INFO["world_building_" .. arg_1_0]
			var_1_2 = worldDongyingConstant.BUILDING_INFO["world_building_" .. arg_1_1]
		end

		local var_1_3 = math.sqrt((var_1_1.x - var_1_2.x)^2 + (var_1_1.y - var_1_2.y)^2)
		local var_1_4 = user.moveFaster and 294.3 or 131.9

		var_1_0 = 1000 * var_1_3 / var_1_4
	end

	return var_1_0
end

local var_0_1 = class("KfWorld", function()
	return createBaseLayer()
end)
local var_0_2 = require("lua/layer/kfyzWorld/MenuLayer")
local var_0_3 = require("lua/layer/kfyzWorld/MapLayer")
local var_0_4 = require("lua/layer/kfyzWorld/PlayerInfoLayer")
local var_0_5 = require("lua/layer/kfyzWorld/kfyzNotice/kfyzNotice")
local var_0_6 = require("lua/layer/kfyzWorld/WaitLayer")
local var_0_7 = require("lua/layer/kfyzWorld/Thumbnail")

function var_0_1.ctor(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	kfyzWorld = kfyzWorld or {}
	arg_3_0.cityId = arg_3_3

	if arg_3_1 then
		kfyzWorld.matchState = arg_3_1
	else
		arg_3_1 = kfyzWorld.matchState
	end

	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/world/thumbnail.plist")
	rmgr.loadResource("res/ui/world/cityWindow.plist")
	rmgr.loadResource("res/ui/world/convene.plist")
	rmgr.loadResource("res/ui/world/generalMove.plist")
	rmgr.loadResource("res/ui/world/generalMove_fast.plist")

	arg_3_0.warOptionTable = arg_3_2
	arg_3_0.menuLayer = var_0_2.new(arg_3_0)
	arg_3_0.mapLayer = var_0_3.new(arg_3_0)
	arg_3_0.playerInfoLayer = var_0_4.new(arg_3_0)
	arg_3_0.warOptionLayer = CCLayer:create()
	arg_3_0.waitLayer = var_0_6.new(arg_3_0)
	arg_3_0.thumbnail = var_0_7.new(arg_3_0)

	arg_3_0:addChild(arg_3_0.mapLayer, 1)
	arg_3_0:addChild(arg_3_0.waitLayer, 2)
	arg_3_0:addChild(arg_3_0.playerInfoLayer, 4)
	arg_3_0:addChild(arg_3_0.thumbnail, 5)

	local var_3_0 = smgr.getLayer("uiLayer")

	arg_3_0.generalPanelControl = showSimpleGeneralPanel(var_3_0, nil, true, true, nil, true)

	var_3_0:addChild(arg_3_0.menuLayer)
	arg_3_0.mapLayer:addChild(arg_3_0.warOptionLayer, 200)
	smgr.hideNotice()
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)
	var_0_5:create(arg_3_0.generalPanelControl)
	arg_3_0:changeMatchState(arg_3_1)

	if arg_3_0.cityId then
		arg_3_0.mapLayer:moveTo(arg_3_3)
	end
end

function var_0_1.changeMatchState(arg_4_0, arg_4_1)
	if user.startTime > 0 and user.startTime < 180000 then
		arg_4_0.waitLayer:setVisible(true)
		arg_4_0.menuLayer:setStateWait(true)
		arg_4_0.mapLayer:moveTo(105)
		arg_4_0.mapLayer.effectLayer:setStateWait(true)

		return
	end

	arg_4_0.matchState = arg_4_1

	if kfcmgr.loginIn then
		arg_4_0:getWorldMap()
		arg_4_0:getSTaskInfo()
		arg_4_0:getSIndivTask()
	else
		notice.control.enterKfyz()
	end
end

function var_0_1.seeChampionCity(arg_5_0)
	user.kfChampionList = user.kfChampionList or {}

	for iter_5_0, iter_5_1 in pairs(user.kfChampionList) do
		if iter_5_1.cityId and iter_5_1.forceId ~= user.player.kfgzForceId then
			eventManager.dispatchEvent("moveToCity", iter_5_1.cityId, true, nil, nil, true)

			return
		end
	end
end

function var_0_1.getWorldMap(arg_6_0, arg_6_1)
	local function var_6_0(arg_7_0)
		arg_6_0.playerInfoLayer:handlerGetWorldMapAction(arg_7_0)
		arg_6_0.mapLayer:handlerGetWorldMapAction(arg_7_0, arg_6_1)
		arg_6_0.menuLayer:handlerGetWorldMapAction(arg_7_0)
		arg_6_0.thumbnail:handlerGetWorldMapAction(arg_7_0)
		arg_6_0.generalPanelControl.handlerGetWorldMapAction(arg_7_0)

		user.kfyzGeneral = arg_7_0.data.general or {}
		user.kfAutoBattleCityId = arg_7_0.data.autoBattleCityId
		user.autoMode = arg_7_0.data.autoMode
		user.autoType = arg_7_0.data.autoType
		user.bombNum = arg_7_0.data.bombNum or 0

		if user.kfAutoBattleCityId then
			eventManager.dispatchEvent("autoBattleCityEffect", user.kfAutoBattleCityId)
			eventManager.dispatchEvent("autoBattle", {
				refresh = true
			})
		else
			eventManager.dispatchEvent("autoBattle", nil)
		end

		if arg_6_0.warOptionTable and not arg_6_0.warOptionTable.isClosed then
			arg_6_0.mapLayer.warOptionTable = arg_6_0.warOptionTable

			require("lua/layer/warOption/warOptionController")

			local var_7_0 = smgr.getLayer("generalMoveLayer")

			warOptionController.updateWarOptionLayer(arg_6_0.warOptionLayer, arg_6_0.warOptionTable, arg_6_0.mapLayer.cityTable, "", var_7_0)
		end

		if arg_7_0.data.officeTokenList and #arg_7_0.data.officeTokenList > 0 then
			local var_7_1 = {}

			for iter_7_0, iter_7_1 in pairs(arg_7_0.data.officeTokenList) do
				table.insert(var_7_1, iter_7_1.officeToken)
			end

			var_0_5:showOfficeToken(true, var_7_1)
		end

		if arg_7_0.data.orderTokenList and #arg_7_0.data.orderTokenList > 0 then
			local var_7_2 = {}

			for iter_7_2, iter_7_3 in pairs(arg_7_0.data.orderTokenList) do
				if iter_7_3.orderToken.playerHasUsed ~= true then
					table.insert(var_7_2, iter_7_3.orderToken)
				end
			end

			var_0_5:showOrderToken(true, var_7_2)
		end

		local var_7_3 = arg_7_0.data.championList

		if var_7_3 then
			user.kfChampionList = {}

			for iter_7_4, iter_7_5 in pairs(var_7_3) do
				arg_6_0.mapLayer:addArena(iter_7_5)
			end
		end

		user.fightBackTokenIcon = arg_7_0.data.fightBackTokenIcon
		user.fbTokenNum = arg_7_0.data.fbTokenNum or 0

		eventManager.dispatchEvent("fightBackTokenIconUpdate")
		arg_6_0.mapLayer:updateFightBackButton(user.fbTokenNum)

		if user.isFightBackEffect then
			arg_6_0:fightBackMoveTo()

			user.isFightBackEffect = false
		end
	end

	kfcmgr.sendRequest(var_6_0, actions.kfWorldGetWorldMap)
end

function var_0_1.getSTaskInfo(arg_8_0)
	local function var_8_0(arg_9_0)
		arg_8_0.mapLayer:handlerGetSTaskInfoAction(arg_9_0)
		arg_8_0.thumbnail:handlerGetSTaskInfoAction(arg_9_0)
	end

	kfcmgr.sendRequest(var_8_0, actions.kfyzGetSTaskInfo)
end

function var_0_1.getSIndivTask(arg_10_0)
	if user.jpsIndex == 0 then
		local function var_10_0(arg_11_0)
			arg_10_0.menuLayer:handlerGetSIndivTaskAction(arg_11_0)
		end

		kfcmgr.sendRequest(var_10_0, actions.kfyzGetSIndivTasks)
	end
end

function var_0_1.handlerPushKfGeneralAction(arg_12_0, arg_12_1)
	arg_12_0.thumbnail:handlerPushKfGeneralAction(arg_12_1)

	local var_12_0 = arg_12_1.data.directMove
	local var_12_1 = arg_12_1.data.hp
	local var_12_2

	if var_12_0 then
		var_12_2 = var_12_0
	elseif var_12_1 then
		var_12_2 = var_12_1
	end

	if var_12_2 then
		arg_12_0.generalPanelControl.kfMergeAttribute(var_12_2)
	end

	if var_12_0 then
		local var_12_3 = {
			[113] = 1003,
			[123] = 1,
			[34] = 1002,
			[188] = 1001,
			[19] = 2,
			[4012] = 1,
			[105] = 4,
			[207] = 3
		}
		local var_12_4 = {
			123,
			19,
			207,
			105,
			4002,
			[1003] = 113,
			[1001] = 188,
			[1002] = 34
		}

		if var_12_0.backCapital then
			var_12_0.fromCity = generalMoveLayer.generalTable["id_" .. var_12_0.gid].locationId

			local var_12_5 = var_0_0(var_12_0.fromCity, var_12_0.toCity)

			var_12_0.cd = var_12_5

			local var_12_6 = {
				var_12_0.fromCity,
				var_12_0.toCity
			}

			if smgr.getLayer("generalMoveLayer") ~= nil then
				traceData.createTrace(var_12_0.gid, var_12_6)
			end

			arg_12_0.mapLayer:generalMove(var_12_0)
			performWithDelay(arg_12_0, function()
				local var_13_0 = user.invastType == 1 and 4 or user.player.forceId

				if user.jpsIndex > 0 then
					if user.isKfyn then
						eventManager.dispatchEvent("positionGeneral", var_12_0.gid, 6001)
					elseif user.isKfnz then
						eventManager.dispatchEvent("positionGeneral", var_12_0.gid, 8001)
					else
						eventManager.dispatchEvent("positionGeneral", var_12_0.gid, var_12_4[5])
					end
				else
					eventManager.dispatchEvent("positionGeneral", var_12_0.gid, var_12_4[var_13_0])
				end

				if var_12_0.minusEndurance then
					eventManager.dispatchEvent("showEffectMapShake")
					eventManager.dispatchEvent("showEffectEnduranceChange", var_12_3[var_12_0.toCity], 2)
				end
			end, var_12_5 / 1000)
		else
			eventManager.dispatchEvent("positionGeneral", var_12_0.gid, var_12_0.cityId)
		end
	end
end

function var_0_1.handlerPushKfWorldAction(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1.data

	showTable(var_14_0)

	if var_14_0.generalMove then
		local var_14_1 = {
			var_14_0.generalMove.fromCity,
			var_14_0.generalMove.toCity
		}

		if smgr.getLayer("generalMoveLayer") ~= nil then
			traceData.createTrace(var_14_0.generalMove.gid, var_14_1)
		end

		var_14_0.generalMove.cd = var_0_0(var_14_0.generalMove.fromCity, var_14_0.generalMove.toCity)

		arg_14_0.mapLayer:generalMove(var_14_0.generalMove)
	elseif var_14_0.cityInfo then
		local function var_14_2(arg_15_0)
			local var_15_0 = arg_15_0.data

			arg_14_0.mapLayer:changeCity(var_15_0)
			arg_14_0.thumbnail:changeCity(var_15_0)
		end

		kfcmgr.sendRequest(var_14_2, actions.kfworldGetCityInfo, var_14_0.cityInfo.id)
	end

	if var_14_0.generalMove then
		arg_14_0.generalPanelControl.updateGeneralState(var_14_0.generalMove.gid, var_14_0.generalMove.generalState)
	end

	if var_14_0.orderToken then
		var_0_5:showOrderToken(true, {
			var_14_0.orderToken.orderToken
		})
	end

	if var_14_0.officeToken then
		var_0_5:showOfficeToken(true, {
			var_14_0.officeToken.officeToken
		})
	end

	if var_14_0.groupteam then
		var_0_5:showGroupTeam(var_14_0.groupteam.gstate)
	end

	if var_14_0.update then
		if var_14_0.update.goodsState then
			arg_14_0.menuLayer:setGoodsState(var_14_0.update.goodsState)
		end

		if var_14_0.update.pushRes then
			arg_14_0.menuLayer:setResState(var_14_0.update.pushRes)
		end
	end

	if var_14_0.slaughter then
		arg_14_0.mapLayer:addTucheng(var_14_0.slaughter)
	end

	if var_14_0.cityEvent then
		arg_14_0.mapLayer:removeCityEvent(var_14_0.cityevent.cityId)
	end

	if var_14_0.cities and var_14_0.cities.reloadWorld == 1 then
		log.info("kfyz data.cities.reloadWorld")
		arg_14_0:getWorldMap(true)
	end
end

function var_0_1.handlerPushKfChatAction(arg_16_0, arg_16_1)
	if user.getFunc(15) then
		local var_16_0 = arg_16_1.data.chatSend

		if chatEnum then
			table.insert(user.player.chatMessageList, var_16_0)

			if table.getn(user.player.chatMessageList) > chatEnum.maxMsgNum then
				table.remove(user.player.chatMessageList, 1)
			end

			eventManager.dispatchEvent("pushChat", var_16_0)
		end
	end
end

function var_0_1.handlerPushKfyzMineChangeAction(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.data.minChange

	if not var_17_0 then
		return
	end

	if var_17_0.win and not user.isInSd then
		local var_17_1 = user.invastType == 1

		if var_17_0.yzOver then
			local var_17_2
			local var_17_3 = var_17_1 and (var_17_0.win == -1 and "kfyz_word_yzcg.png" or "kfyz_word_yzsb.png") or var_17_0.win == -1 and "kfyz_word_fscg.png" or "kfyz_word_fssb.png"

			if user.jpsIndex == 0 then
				local var_17_4 = CCSprite:create("res/ui/world/cityCombo/lxzc_bg4.png")

				var_17_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

				local var_17_5 = CCSprite:create("res/ui/kfyz/result/" .. var_17_3)

				var_17_5:setPosition(ccp(430, 63))
				var_17_4:addChild(var_17_5)
				smgr.showTipSpriteText(var_17_4, nil, 1)
			end

			require("lua/layer/nation/ui")
			nationUI.show(10)
		elseif var_17_0.win == -1 then
			if var_17_1 then
				roleDialogue.control.loadSpeak(1538)
			else
				roleDialogue.control.loadSpeak(1537)
			end
		elseif var_17_0.win == 0 then
			require("lua/layer/nation/ui")
			nationUI.show(10)
		elseif var_17_0.win == 1 then
			require("lua/layer/nation/ui")
			nationUI.show(10)
		elseif var_17_0.win == 2 then
			roleDialogue.control.loadSpeak(1536)
		end
	else
		if var_17_0.needPushCities then
			local var_17_6

			if var_17_0.showEnduranceState then
				var_17_6 = var_17_0.showEnduranceState
			else
				var_17_6 = var_17_0["ensuranceState" .. var_17_0.attackedForce]
			end

			if var_17_6 then
				for iter_17_0, iter_17_1 in ipairs(var_17_0.needPushCities) do
					arg_17_0.mapLayer:changeCity({
						id = iter_17_1,
						enduranceState = var_17_6
					})
				end
			end
		end

		if var_17_0.failForce then
			arg_17_0:getWorldMap(true)

			if user.player.kfgzForceId ~= 1001 and user.player.kfgzForceId ~= var_17_0.failForce and var_17_0.attackForce == 1001 then
				roleDialogue.control.loadSpeak(1535)
			end
		end

		eventManager.dispatchEvent("updateForceInfo", var_17_0)
	end
end

function var_0_1.handlerPushKfyzIndivChangeAction(arg_18_0, arg_18_1)
	arg_18_0:getSIndivTask()
	eventManager.dispatchEvent("kfyzIndivChange", arg_18_1)

	local var_18_0 = arg_18_1.data.indivchange

	if var_18_0 and var_18_0.isFinish and not var_18_0.isReward then
		local var_18_1 = CCSprite:create("res/ui/kfyz/kfyz_word_rwwc.png")

		var_18_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 50))
		smgr.showTipSpriteText(var_18_1)
	end
end

function var_0_1.handlerPushKfyzGroupTeamAction(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.data.teamchange

	if var_19_0 and var_19_0.gtc then
		var_0_5:getGroupTeamInfo()
	end
end

function var_0_1.handlerPushKfyzSdAction(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1.data.sd

	if var_20_0.removeCity then
		arg_20_0.mapLayer:changeCity({
			isInSd = 0,
			id = var_20_0.removeCity
		})
	end

	if var_20_0.state then
		user.isInSd = var_20_0.state == 1
	end

	if var_20_0.sdCities and #var_20_0.sdCities > 0 then
		for iter_20_0, iter_20_1 in ipairs(var_20_0.sdCities) do
			arg_20_0.mapLayer:changeCity({
				isInSd = 1,
				id = iter_20_1
			})
		end
	end
end

function var_0_1.handlerKfWorldMoveAction(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	arg_21_0.mapLayer:handlerKfWorldMoveAction(arg_21_1, arg_21_2, arg_21_3)
end

function var_0_1.handlerpushJpsEvent(arg_22_0, arg_22_1)
	showTable(arg_22_1)

	local var_22_0 = arg_22_1.data

	if var_22_0.rightBar then
		arg_22_0.menuLayer:handlerRightBarAction(var_22_0.rightBar)
		arg_22_0.mapLayer:handlerRightBarAction(var_22_0.rightBar)
	end

	if var_22_0.vietRightBar then
		arg_22_0.menuLayer:handlerRightBarAction(var_22_0.vietRightBar)
	end

	if var_22_0.serialChange then
		if var_22_0.serialChange.slaveInfo then
			arg_22_0.mapLayer:handlerhandlerpushSlaveAction(var_22_0.serialChange)
		end

		if var_22_0.serialChange.mainInfo then
			arg_22_0.mapLayer:handlerhandlerpushMainAction(var_22_0.serialChange)
		end

		if var_22_0.serialChange.cities and (user.isKfyn or user.isKflq) and var_22_0.serialChange.eventCityId then
			arg_22_0.mapLayer:removeCityEvent(var_22_0.serialChange.eventCityId)
		end

		if var_22_0.serialChange.vietmainInfo then
			arg_22_0.mapLayer:changeVietmainInfo(var_22_0.serialChange)
		end

		if var_22_0.serialChange.vietslaveInfo then
			arg_22_0.mapLayer:changeVietslaveInfo(var_22_0.serialChange)
		end
	end

	if var_22_0.specialNpc then
		user.caocaoCityName = var_22_0.specialNpc.cityName

		roleDialogue.control.loadSpeak(2100)
	end

	if var_22_0.sosCityState and user.kfyz.KfyzTaskVO then
		user.kfyz.KfyzTaskVO.sosCityState = var_22_0.sosCityState

		eventManager.dispatchEvent("kfntTaskInfoUpdate", user.kfyz.KfyzTaskVO)
	end
end

function var_0_1.handlerpushAutoBattle(arg_23_0, arg_23_1)
	showTable(arg_23_1)

	local var_23_0 = arg_23_1.data

	if var_23_0.autoBattle then
		if var_23_0.autoBattle.autoBattleTechGain ~= nil then
			user.autoBattleTechGain = var_23_0.autoBattle.autoBattleTechGain
		elseif var_23_0.autoBattle.result then
			local var_23_1 = require("lua/layer/world/autoBattle/AutoBattleNew")

			var_23_1.new({
				response = arg_23_1,
				state = var_23_1.STATE.AFTER_BATTLE
			})
		end
	end
end

function var_0_1.handlerpushKfyzBomb(arg_24_0, arg_24_1)
	showTable(arg_24_1)

	local var_24_0 = arg_24_1.data

	if var_24_0.bomb then
		local var_24_1 = smgr.getLayer("effectlayer")
		local var_24_2 = CCSprite:create("res/ui/saotao/stfx_word_bg.png")

		var_24_1:addChild(var_24_2)

		local var_24_3

		if var_24_0.bomb.isAtt then
			var_24_3 = CCLabelTTF:create(language.get("224201_bomb", var_24_0.bomb.bomber, var_24_0.bomb.killNum), "Thonburi", 24)
		else
			var_24_3 = CCLabelTTF:create(language.get("224202_bomb", var_24_0.bomb.bomber, var_24_0.bomb.killNum), "Thonburi", 24)
		end

		var_24_3:setPosition(ccp(var_24_2:getContentSize().width / 2, var_24_2:getContentSize().height / 2 + 5))
		var_24_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_24_2:addChild(var_24_3)

		local function var_24_4()
			var_24_1:removeChild(var_24_2, true)
		end

		local var_24_5 = CCArray:create()

		var_24_5:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
		var_24_5:addObject(CCDelayTime:create(2.5))
		var_24_5:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_24_2:getContentSize().width * 0.5, visibleSize.height * 0.5)))
		var_24_5:addObject(CCCallFuncN:create(var_24_4))

		local var_24_6 = CCSequence:create(var_24_5)

		var_24_2:runAction(var_24_6)
	end
end

function var_0_1.handlerPushKfyzWana(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1.data

	showTable(var_26_0)

	if var_26_0.wana then
		arg_26_0.mapLayer:addTrap(var_26_0.wana)
	end
end

function var_0_1.handlerPushArena(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1.data or arg_27_1.action.data

	if var_27_0.arena then
		eventManager.dispatchEvent("pushArena", var_27_0.arena)
		eventManager.dispatchEvent("PushJiaoZhen", var_27_0.arena.champion)
		eventManager.dispatchEvent("KfPushJiaoZhenIcon", var_27_0.arena)

		local var_27_1 = var_27_0.arena.result

		if var_27_1 and (var_27_1.challenger.playerId or var_27_1.challenger.id) == user.player.playerId then
			roleDialogue.control.loadSpeak(var_27_1.challengeWin and "kfglChampion" .. var_27_1.battleId .. "_2" or "kfglChampion" .. var_27_1.battleId .. "_1")
		end
	end
end

function var_0_1.handlerPushCorps(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.data

	if var_28_0.corpsAction and var_28_0.corpsAction.forceId then
		user.kfCorpsAction[var_28_0.corpsAction.forceId] = var_28_0.corpsAction

		local var_28_1 = var_28_0.corpsAction
		local var_28_2 = 0

		if var_28_1.path ~= nil then
			local var_28_3 = {}

			for iter_28_0, iter_28_1 in ipairs(var_28_1.path) do
				var_28_3[iter_28_0] = tonumber(iter_28_1.cityId)
				var_28_2 = var_28_2 + 1
			end

			if smgr.getLayer("generalMoveLayer") ~= nil then
				traceData.createTrace(var_28_1.corpsId, var_28_3)
			end
		end

		if var_28_1.orgCityId ~= var_28_1.curCityId and var_28_2 > 0 then
			eventManager.dispatchEvent("juntuanMoveFromTo", var_28_1.corpsId, var_28_1.orgCityId, var_28_1.curCityId, var_28_1.cd, false)
		end

		eventManager.dispatchEvent("juntuanFlag", var_28_1.forceId, var_28_1.curCityId)
	end

	if var_28_0.corpsInfo and var_28_0.corpsInfo.forceId then
		user.kfCorpsInfo[var_28_0.corpsInfo.forceId] = var_28_0.corpsInfo

		log.info("军团改变")
		eventManager.dispatchEvent("juntuanRefresh")
		eventManager.dispatchEvent("refreshJuntuan")
		eventManager.dispatchEvent("juntuanFlag", var_28_0.corpsInfo.forceId, var_28_0.corpsInfo.locationId)
	end

	showTable(var_28_0.state)

	if type(var_28_0.state) == "number" then
		eventManager.dispatchEvent("juntuanRefresh")
		eventManager.dispatchEvent("refreshJuntuan")
	elseif var_28_0.state and type(var_28_0.state) ~= "number" and var_28_0.state.corpsState then
		user.kfCorpsState = var_28_0.state.corpsState

		eventManager.dispatchEvent("juntuanRefresh")
	end

	if var_28_0.corpsNum then
		user.kfCorpsNum = var_28_0.corpsNum

		eventManager.dispatchEvent("juntuanNumChange")
	end

	local var_28_4 = var_28_0.state

	if var_28_4 and type(var_28_4) ~= "number" then
		if var_28_4.start ~= nil then
			local var_28_5 = (var_28_4.start == user.player.forceId or var_28_4.start == user.player.kfgzForceId) and "jt_word_wgjtzscz.png" or "jt_word_djjtqslx.png"
			local var_28_6 = CCSprite:create("res/ui/saotao/stfx_long_bg.png")
			local var_28_7 = CCSprite:create("res/ui/corps/" .. var_28_5)

			var_28_7:setPosition(ccp(454, 85))
			var_28_6:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
			var_28_6:addChild(var_28_7)
			smgr.showTipSpriteText(var_28_6)
		end

		if var_28_4.cartoon == true then
			-- block empty
		end

		if var_28_4.donationState ~= nil then
			user.kfDonationState = var_28_4.donationState

			var_0_5:showCrops()
		end

		if var_28_4.transfer == true then
			local var_28_8 = smgr.getLayer("topLayer")

			require("lua/layer/corps/MessageBox").new(var_28_8, var_28_4, true)
		end
	end
end

function var_0_1.kfntTaskInfoUpdate(arg_29_0, arg_29_1)
	if arg_29_1 then
		arg_29_0.menuLayer:kfntTaskInfoUpdate(arg_29_1)
	end
end

function var_0_1.rightEventListUpdate(arg_30_0)
	arg_30_0.mapLayer:addLQCityEventUpdate()
end

function var_0_1.handlerPushNanZhao(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1.data

	if var_31_0.defend then
		eventManager.dispatchEvent("moveToCity", var_31_0.defend.keyCityId, true)
		roleDialogue.control.loadSpeak("kfnzEvent1")
	elseif var_31_0.close then
		eventManager.dispatchEvent("moveToCity", var_31_0.close.cityId, true)
		roleDialogue.control.loadSpeak("kfnzEvent3")
	elseif var_31_0.tujin and var_31_0.tujin.first then
		eventManager.dispatchEvent("moveToCity", var_31_0.tujin.tujinCity, true)
		roleDialogue.control.loadSpeak("kfnzEvent2")
	end

	arg_31_0.menuLayer:handlerPushNanZhao(var_31_0)
	arg_31_0.mapLayer:handlerPushNanZhao(var_31_0)
end

function var_0_1.handlerFightBack(arg_32_0, arg_32_1)
	if arg_32_1.data.all then
		user.fbTokenNum = 0

		arg_32_0.mapLayer:updateFightBackButton(user.fbTokenNum)
		notice.control.flyPicEffect(1, function(...)
			arg_32_0:fightBackMoveTo()
		end)
	end
end

function var_0_1.fightBackMoveTo(arg_34_0)
	local var_34_0 = {
		123,
		19,
		207
	}
	local var_34_1 = user.player.forceId
	local var_34_2 = false

	if user.player.kfgzForceId == 1001 then
		var_34_1 = 1 + user.player.forceId % 3
		var_34_2 = true
	end

	user.fightBackCityId = var_34_0[var_34_1]

	if var_34_2 then
		roleDialogue.control.loadSpeak("fightBackAtt")
	else
		roleDialogue.control.loadSpeak("fightBackDef")
	end

	arg_34_0.mapLayer:fightBackEffect()
end

function var_0_1.showFightBackPic(arg_35_0, arg_35_1)
	arg_35_0.mapLayer:showFightBackPic(arg_35_1)
end

function var_0_1.onEnter(arg_36_0)
	function arg_36_0.getGeneralRef(arg_37_0)
		local var_37_0 = {}

		for iter_37_0, iter_37_1 in pairs(arg_36_0.generalPanelControl.generals) do
			var_37_0[iter_37_0] = iter_37_1
		end

		return var_37_0
	end

	arg_36_0.handlerPushKfGeneralActionRef = handler(arg_36_0, arg_36_0.handlerPushKfGeneralAction)
	arg_36_0.handlerPushKfWorldActionRef = handler(arg_36_0, arg_36_0.handlerPushKfWorldAction)
	arg_36_0.handlerPushKfChatActionRef = handler(arg_36_0, arg_36_0.handlerPushKfChatAction)
	arg_36_0.handlerPushKfyzMineChangeActionRef = handler(arg_36_0, arg_36_0.handlerPushKfyzMineChangeAction)
	arg_36_0.handlerPushKfyzIndivChangeActionRef = handler(arg_36_0, arg_36_0.handlerPushKfyzIndivChangeAction)
	arg_36_0.handlerPushKfyzGroupTeamActionRef = handler(arg_36_0, arg_36_0.handlerPushKfyzGroupTeamAction)
	arg_36_0.handlerPushKfyzSdActionRef = handler(arg_36_0, arg_36_0.handlerPushKfyzSdAction)
	arg_36_0.kfworldMoveRef = handler(arg_36_0, arg_36_0.handlerKfWorldMoveAction)
	arg_36_0.changeMatchStateRef = handler(arg_36_0, arg_36_0.changeMatchState)
	arg_36_0.seeChampionCityRef = handler(arg_36_0, arg_36_0.seeChampionCity)
	arg_36_0.handlerpushJpsEventRef = handler(arg_36_0, arg_36_0.handlerpushJpsEvent)
	arg_36_0.handlerpushAutoBattleRef = handler(arg_36_0, arg_36_0.handlerpushAutoBattle)
	arg_36_0.handlerpushKfyzBombRef = handler(arg_36_0, arg_36_0.handlerpushKfyzBomb)
	arg_36_0.handlerPushKfyzWanaRef = handler(arg_36_0, arg_36_0.handlerPushKfyzWana)
	arg_36_0.handlerPushArenaRef = handler(arg_36_0, arg_36_0.handlerPushArena)
	arg_36_0.handlerPushCorpsRef = handler(arg_36_0, arg_36_0.handlerPushCorps)
	arg_36_0.kfntTaskInfoUpdateRef = handler(arg_36_0, arg_36_0.kfntTaskInfoUpdate)
	arg_36_0.rightEventListUpdateRef = handler(arg_36_0, arg_36_0.rightEventListUpdate)
	arg_36_0.handlerFightBackRef = handler(arg_36_0, arg_36_0.handlerFightBack)
	arg_36_0.showFightBackPicRef = handler(arg_36_0, arg_36_0.showFightBackPic)
	arg_36_0.handlerPushNanZhaoRef = handler(arg_36_0, arg_36_0.handlerPushNanZhao)

	eventManager.registerEvent("KfworldGetGenerals", arg_36_0.getGeneralRef)
	eventManager.registerEvent("kfworldMove", arg_36_0.kfworldMoveRef)
	eventManager.registerEvent("changeMatchState", arg_36_0.changeMatchStateRef)
	eventManager.registerEvent("KfSeeChampionCity", arg_36_0.seeChampionCityRef)
	kfcmgr.registerResponseHandler(actions.kfpushGeneral, arg_36_0.handlerPushKfGeneralActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfworld, arg_36_0.handlerPushKfWorldActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfChat, arg_36_0.handlerPushKfChatActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzMineChange, arg_36_0.handlerPushKfyzMineChangeActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzIndivChange, arg_36_0.handlerPushKfyzIndivChangeActionRef)
	kfcmgr.registerResponseHandler(actions.kfgzPushGroupTeam, arg_36_0.handlerPushKfyzGroupTeamActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzSd, arg_36_0.handlerPushKfyzSdActionRef)
	kfcmgr.registerResponseHandler(actions.pushJpsEvent, arg_36_0.handlerpushJpsEventRef)
	kfcmgr.registerResponseHandler(actions.pushKfAutoBattle, arg_36_0.handlerpushAutoBattleRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzBomb, arg_36_0.handlerpushKfyzBombRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzWana, arg_36_0.handlerPushKfyzWanaRef)
	kfcmgr.registerResponseHandler(actions.pushKfArena, arg_36_0.handlerPushArenaRef)
	kfcmgr.registerResponseHandler(actions.pushCorps, arg_36_0.handlerPushCorpsRef)
	kfcmgr.registerResponseHandler(actions.pushFightBack, arg_36_0.handlerFightBackRef)
	kfcmgr.registerResponseHandler(actions.pushNanZhao, arg_36_0.handlerPushNanZhaoRef)
	eventManager.registerEvent("kfntTaskInfoUpdate", arg_36_0.kfntTaskInfoUpdateRef)
	eventManager.registerEvent("rightEventListUpdate", arg_36_0.rightEventListUpdateRef)
	eventManager.registerEvent("showFightBackPic", arg_36_0.showFightBackPicRef)
end

function var_0_1.onExit(arg_38_0)
	eventManager.unregisterEvent("KfworldGetGenerals", arg_38_0.getGeneralRef)
	eventManager.unregisterEvent("kfworldMove", arg_38_0.kfworldMoveRef)
	eventManager.unregisterEvent("changeMatchState", arg_38_0.changeMatchStateRef)
	eventManager.unregisterEvent("KfSeeChampionCity", arg_38_0.seeChampionCityRef)
	eventManager.unregisterEvent("kfntTaskInfoUpdate", arg_38_0.kfntTaskInfoUpdateRef)
	eventManager.unregisterEvent("rightEventListUpdate", arg_38_0.rightEventListUpdateRef)
	eventManager.unregisterEvent("showFightBackPic", arg_38_0.showFightBackPicRef)
	kfcmgr.unregisterResponseHandler(actions.kfpushGeneral, arg_38_0.handlerPushKfGeneralActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfworld, arg_38_0.handlerPushKfWorldActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfChat, arg_38_0.handlerPushKfChatActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzMineChange, arg_38_0.handlerPushKfyzMineChangeActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzIndivChange, arg_38_0.handlerPushKfyzIndivChangeActionRef)
	kfcmgr.unregisterResponseHandler(actions.kfgzPushGroupTeam, arg_38_0.handlerPushKfyzGroupTeamActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzSd, arg_38_0.handlerPushKfyzSdActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushJpsEvent, arg_38_0.handlerpushJpsEventRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfAutoBattle, arg_38_0.handlerpushAutoBattleRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzBomb, arg_38_0.handlerpushKfyzBombRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzWana, arg_38_0.handlerPushKfyzWanaRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfArena, arg_38_0.handlerPushArenaRef)
	kfcmgr.unregisterResponseHandler(actions.pushCorps, arg_38_0.handlerPushCorpsRef)
	kfcmgr.unregisterResponseHandler(actions.pushFightBack, arg_38_0.handlerFightBackRef)
	kfcmgr.unregisterResponseHandler(actions.pushNanZhao, arg_38_0.handlerPushNanZhaoRef)
	var_0_5:clearup()
end

return var_0_1
