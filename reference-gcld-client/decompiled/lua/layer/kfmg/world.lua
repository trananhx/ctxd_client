local var_0_0 = class("mgWorld", function()
	return createBaseLayer()
end)
local var_0_1 = require("lua/layer/kfmg/mapLayer")
local var_0_2 = require("lua/layer/kfmg/menuLayer")
local var_0_3 = require("lua/layer/kfmg/kfmgNotice/kfmgNotice")
local var_0_4 = require("lua/layer/kfmg/Thumbnail")
local var_0_5 = require("lua/layer/kfmg/playerInfoLayer")
local var_0_6 = require("lua/layer/kfmg/infoLayer")

local function var_0_7(arg_2_0, arg_2_1)
	local var_2_0 = 0

	if arg_2_0 ~= arg_2_1 then
		local var_2_1
		local var_2_2
		local var_2_3 = worldConstant.BUILDING_INFO["world_building_" .. arg_2_0]
		local var_2_4 = worldConstant.BUILDING_INFO["world_building_" .. arg_2_1]
		local var_2_5 = math.sqrt((var_2_3.x - var_2_4.x)^2 + (var_2_3.y - var_2_4.y)^2)
		local var_2_6 = user.moveFaster and 294.3 or 131.9

		var_2_0 = 1000 * var_2_5 / var_2_6
	end

	return var_2_0
end

function var_0_0.ctor(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/world/thumbnail.plist")
	rmgr.loadResource("res/ui/world/cityWindow.plist")
	rmgr.loadResource("res/ui/world/convene.plist")
	rmgr.loadResource("res/ui/world/generalMove.plist")
	rmgr.loadResource("res/ui/world/generalMove_fast.plist")

	arg_3_1 = 2
	kfworld = kfworld or {}
	kfworld.isReloadWorld = true
	arg_3_0.isMyMgOver = true

	if arg_3_1 then
		kfworld.matchState = arg_3_1
	else
		arg_3_1 = kfworld.matchState
	end

	arg_3_0.cityId = arg_3_3
	arg_3_0.warOptionTable = arg_3_2
	arg_3_0.mapLayer = var_0_1.new(arg_3_0)
	arg_3_0.menuLayer = var_0_2.new(arg_3_0)
	arg_3_0.playerInfoLayer = var_0_5.new(arg_3_0)
	arg_3_0.infoLayer = var_0_6.new(arg_3_0)
	arg_3_0.warOptionLayer = CCLayer:create()

	arg_3_0:addChild(arg_3_0.mapLayer, 1)
	arg_3_0:addChild(arg_3_0.playerInfoLayer, 3)
	arg_3_0:addChild(arg_3_0.infoLayer, 4)

	arg_3_0.thumbnail = var_0_4.new(arg_3_0)

	local var_3_0 = smgr.getLayer("uiLayer")

	arg_3_0.generalPanelControl = showSimpleGeneralPanel(var_3_0, nil, true, true, nil, true)

	var_3_0:addChild(arg_3_0.menuLayer)
	var_3_0:addChild(arg_3_0.thumbnail, 15)
	arg_3_0.mapLayer:addChild(arg_3_0.warOptionLayer, 200)
	var_0_3:create(arg_3_0.generalPanelControl)

	arg_3_0.kfmgNotice = var_0_3

	arg_3_0:getWorldMap()
	arg_3_0:getSTaskInfo()
	arg_3_0:getSIndivTask()
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)
end

function var_0_0.setMgFunction(arg_4_0, arg_4_1)
	if arg_4_1 then
		arg_4_0.menuLayer:setVisible(true)
		arg_4_0.infoLayer:setVisible(true)
		arg_4_0.thumbnail:setVisible(true)
		arg_4_0.generalPanelControl.sideGeneralSetVisible(true)
		arg_4_0.mapLayer:setTouchEnabled(true)
		arg_4_0.mapLayer.worldLayer:setTouchEnabled(true)
	else
		arg_4_0.menuLayer:setVisible(false)
		arg_4_0.infoLayer:setVisible(false)
		arg_4_0.thumbnail:setVisible(false)
		arg_4_0.generalPanelControl.sideGeneralSetVisible(false)
		arg_4_0.mapLayer:setTouchEnabled(false)
		arg_4_0.mapLayer.worldLayer:setTouchEnabled(false)
	end
end

function var_0_0.battleOver(arg_5_0)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

	local function var_5_0(arg_6_0)
		local var_6_0 = require("lua/layer/kfworld/ResultCalc")
		local var_6_1 = 0
		local var_6_2 = 0

		for iter_6_0, iter_6_1 in pairs(arg_6_0.data.city) do
			if iter_6_1.force == 1 then
				var_6_1 = var_6_1 + 1
			elseif iter_6_1.force == 2 then
				var_6_2 = var_6_2 + 1
			end
		end

		local var_6_3 = var_6_2 <= var_6_1

		if (user.player.kfgzForceId or 1) ~= 1 then
			var_6_3 = not var_6_3
		end

		var_6_0:create(var_6_3, arg_5_0.changeMatchStateRef, arg_5_0.matchState)
	end

	kfcmgr.sendRequest(var_5_0, actions.kfWorldGetWorldMap)
end

function var_0_0.getNationName(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.nationNames) do
		if arg_7_1 == iter_7_1.forceId then
			return iter_7_1.nationName
		end
	end

	return ""
end

function var_0_0.getWorldMap(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		log.info("===========getWorldMap")

		kfworld.kfForceId = arg_9_0.data.kfForceId
		arg_8_0.KfmgServerInfos = arg_9_0.data.KfmgServerInfos
		arg_8_0.nationNames = arg_9_0.data.nationNames

		table.insert(arg_8_0.nationNames, {
			forceId = 6002,
			nationName = language.get("85040_sunc")
		})
		arg_8_0.menuLayer:handlerGetWorldMapAction(arg_9_0)
		arg_8_0.generalPanelControl.handlerGetWorldMapAction(arg_9_0)
		arg_8_0.mapLayer:handlerGetWorldMapAction(arg_9_0, arg_8_1)
		arg_8_0.menuLayer:changeRank(arg_9_0.data.rankInfo)
		arg_8_0.playerInfoLayer:handlerGetWorldMapAction(arg_9_0)
		arg_8_0.thumbnail:handlerGetWorldMapAction(arg_9_0)

		local var_9_0 = user.player.kfForceId or 1001

		if arg_9_0.data.expCoef ~= nil then
			user.battleBuffOfexpCoef = arg_9_0.data.expCoef
		end

		user.kfyzGeneral = arg_9_0.data.general or {}
		user.kfAutoBattleCityId = arg_9_0.data.autoBattleCityId
		user.autoMode = arg_9_0.data.autoMode
		user.autoType = arg_9_0.data.autoType

		if user.kfAutoBattleCityId then
			eventManager.dispatchEvent("autoBattleCityEffect", user.kfAutoBattleCityId)
			eventManager.dispatchEvent("autoBattle", {
				refresh = true
			})
		else
			eventManager.dispatchEvent("autoBattle", nil)
		end

		local var_9_1 = {
			123,
			19,
			207,
			[1002] = 105
		}

		if arg_8_0.cityId == nil then
			local var_9_2 = var_9_1[var_9_0]

			if var_9_2 == nil or kfworld and kfworld.memoryLocation then
				-- block empty
			else
				arg_8_0.mapLayer:moveTo(var_9_2, false, false, 0)
			end
		else
			arg_8_0.cityId = nil
		end

		if arg_9_0.data.mgOver and arg_9_0.data.mgOver == -1 then
			arg_9_0.data.failButWatchInfo.mgOver = arg_9_0.data.mgOver
			kfworld.mgOver = arg_9_0.data.mgOver

			if smgr.currentSceneTag == SCENE_KFEXPEDITION and kfcmgr.isShowFailurePanel then
				arg_8_0.infoLayer:handlerWinOrFailure(arg_9_0.data.failButWatchInfo)

				kfcmgr.isShowFailurePanel = nil
			end
		end

		if arg_8_0.warOptionTable and not arg_8_0.warOptionTable.isClosed then
			arg_8_0.mapLayer.warOptionTable = arg_8_0.warOptionTable

			require("lua/layer/warOption/warOptionController")

			local var_9_3 = smgr.getLayer("generalMoveLayer")

			warOptionController.updateWarOptionLayer(arg_8_0.warOptionLayer, arg_8_0.warOptionTable, arg_8_0.mapLayer.cityTable, "", var_9_3)
		end

		if arg_9_0.data.officeTokenList and #arg_9_0.data.officeTokenList > 0 then
			local var_9_4 = {}

			for iter_9_0, iter_9_1 in pairs(arg_9_0.data.officeTokenList) do
				table.insert(var_9_4, iter_9_1.officeToken)
			end

			var_0_3:showOfficeToken(true, var_9_4)
		end

		if arg_9_0.data.orderTokenList and #arg_9_0.data.orderTokenList > 0 then
			local var_9_5 = {}

			for iter_9_2, iter_9_3 in pairs(arg_9_0.data.orderTokenList) do
				table.insert(var_9_5, iter_9_3.orderToken)
			end

			var_0_3:showOrderToken(true, var_9_5)
		end

		if user.kfAutoBattleCityId then
			eventManager.dispatchEvent("autoBattleCityEffect", user.kfAutoBattleCityId)
			eventManager.dispatchEvent("autoBattle", {
				refresh = true
			})
		else
			eventManager.dispatchEvent("autoBattle", nil)
		end
	end

	kfcmgr.sendRequest(var_8_0, actions.kfWorldGetWorldMap)
end

function var_0_0.handlerPushKfGeneralAction(arg_10_0, arg_10_1)
	log.info("=============kfpushGeneral=======")
	showTable(arg_10_1)
	arg_10_0.thumbnail:handlerPushKfGeneralAction(arg_10_1)

	local var_10_0 = arg_10_1.data.directMove
	local var_10_1 = arg_10_1.data.hp
	local var_10_2

	if var_10_0 then
		var_10_2 = var_10_0
	elseif var_10_1 then
		var_10_2 = var_10_1
	end

	if var_10_2 then
		arg_10_0.generalPanelControl.kfMergeAttribute(var_10_2)
	end

	if var_10_0 then
		local var_10_3 = {
			[113] = 1003,
			[123] = 1,
			[34] = 1002,
			[188] = 1001,
			[19] = 2,
			[4012] = 1,
			[105] = 4,
			[207] = 3
		}
		local var_10_4 = {
			123,
			19,
			207,
			105,
			4002,
			[1003] = 113,
			[1001] = 188,
			[1002] = 34
		}

		if var_10_0.backCapital then
			var_10_0.fromCity = generalMoveLayer.generalTable["id_" .. var_10_0.gid].locationId

			local var_10_5 = var_0_7(var_10_0.fromCity, var_10_0.toCity)

			var_10_0.cd = var_10_5

			local var_10_6 = {
				var_10_0.fromCity,
				var_10_0.toCity
			}

			if smgr.getLayer("generalMoveLayer") ~= nil then
				traceData.createTrace(var_10_0.gid, var_10_6)
			end

			arg_10_0.mapLayer:generalMove(var_10_0)
			performWithDelay(arg_10_0, function()
				local var_11_0 = user.invastType == 1 and 4 or user.player.forceId

				eventManager.dispatchEvent("positionGeneral", var_10_0.gid, var_10_4[var_11_0])

				if var_10_0.minusEndurance then
					eventManager.dispatchEvent("showEffectMapShake")
					eventManager.dispatchEvent("showEffectEnduranceChange", var_10_3[var_10_0.toCity], 2)
				end
			end, var_10_5 / 1000)
		else
			eventManager.dispatchEvent("positionGeneral", var_10_0.gid, var_10_0.cityId)
		end
	end
end

function var_0_0.handlerPushKfWorldAction(arg_12_0, arg_12_1)
	log.info("============Push-Kf--World--Action------")
	log.info("## 跨服灭国")
	showTable(arg_12_1)

	local var_12_0 = arg_12_1.data

	if var_12_0.generalMove then
		arg_12_0.mapLayer:generalMove(var_12_0.generalMove)

		if eventManager.dispatchEvent("getIsTouchThumbnailButton") and arg_12_0.generalID and arg_12_0.generalID == var_12_0.generalMove.gid then
			local var_12_1 = eventManager.dispatchEvent("KfworldGetGenerals")

			eventManager.dispatchEvent("updataGeneralPos", var_12_0.generalMove.toCity, var_12_1[var_12_0.generalMove.gid].pic)
		end
	elseif var_12_0.cityInfo then
		arg_12_0.mapLayer:changeCity(var_12_0.cityInfo)
		arg_12_0.thumbnail:changeCity(var_12_0.cityInfo)
	elseif var_12_0.killRanking then
		arg_12_0.menuLayer:changeRank(var_12_0.killRanking.rankInfo)
	elseif var_12_0.cities and var_12_0.cities.reloadWorld == 1 then
		log.info("data.cities.reloadWorld")

		if kfworld.isReloadWorld then
			kfworld.isReloadWorld = false

			arg_12_0:getWorldMap(true)
			performWithDelay(arg_12_0, function()
				kfworld.isReloadWorld = true
			end, 0.5)
		end
	end

	if var_12_0.generalMove then
		arg_12_0.generalPanelControl.updateGeneralState(var_12_0.generalMove.gid, var_12_0.generalMove.generalState)
	end

	if var_12_0.orderToken then
		var_0_3:showOrderToken(true, {
			var_12_0.orderToken.orderToken
		})

		if arg_12_0.isShowCommand then
			var_0_3:setTokenVisible(false)
		end
	end

	if var_12_0.officeToken then
		var_0_3:showOfficeToken(true, {
			var_12_0.officeToken.officeToken
		})

		if arg_12_0.isShowCommand then
			var_0_3:setTokenVisible(false)
		end
	end

	if var_12_0.groupteam then
		var_0_3:showGroupTeam(var_12_0.groupteam.gstate)
	end
end

function var_0_0.handlerKfyzMineChange(arg_14_0, arg_14_1)
	log.info("--------------MineChange-----------")
	showTable(arg_14_1)

	if arg_14_1.data.minChange then
		if arg_14_1.data.minChange.mgOver and arg_14_1.data.minChange.mgOver ~= 0 then
			arg_14_0.infoLayer:handlerWinOrFailure(arg_14_1.data.minChange)
		else
			eventManager.dispatchEvent("updateForceInfo", arg_14_1.data.minChange)
		end

		if arg_14_1.data.minChange.failForce then
			arg_14_0:getWorldMap(true)
		end
	end
end

function var_0_0.handlerKfWorldMoveAction(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	log.info("--------------handlerKfWorldMoveAction---------------")
	arg_15_0.mapLayer:handlerKfWorldMoveAction(arg_15_1, arg_15_2, arg_15_3)
end

function var_0_0.getSTaskInfo(arg_16_0)
	local function var_16_0(arg_17_0)
		log.info("getSTaskInfo handler")
		arg_16_0.mapLayer:handlerGetSTaskInfoAction(arg_17_0)
		arg_16_0.thumbnail:handlerGetSTaskInfoAction(arg_17_0)
	end

	kfcmgr.sendRequest(var_16_0, actions.kfyzGetSTaskInfo)
end

function var_0_0.handlerPushKfChat(arg_18_0, arg_18_1)
	log.info("-----------handlerPushKfChat--------------")

	if user.getFunc(15) then
		local var_18_0 = arg_18_1.data.chatSend

		if chatEnum then
			table.insert(user.player.chatMessageList, var_18_0)

			if table.getn(user.player.chatMessageList) > chatEnum.maxMsgNum then
				table.remove(user.player.chatMessageList, 1)
			end

			eventManager.dispatchEvent("pushChat", var_18_0)
		end
	end
end

function var_0_0.handlerPushAutoBattleForKf(arg_19_0, arg_19_1)
	log.info("----------------handlerPushAutoBattleForKf------------")
	showTable(arg_19_1)

	local var_19_0 = arg_19_1.data

	if var_19_0.autoBattle then
		if var_19_0.autoBattle.autoBattleTechGain ~= nil then
			user.autoBattleTechGain = var_19_0.autoBattle.autoBattleTechGain
		elseif var_19_0.autoBattle.result then
			local var_19_1 = require("lua/layer/world/autoBattle/AutoBattleNew")

			var_19_1.new({
				response = arg_19_1,
				state = var_19_1.STATE.AFTER_BATTLE
			})
		end
	end
end

function var_0_0.handlerKfPushCitiesAction(arg_20_0, arg_20_1)
	log.info("====================handlerKfPushCitiesAction")
	showTable(arg_20_1)

	local var_20_0 = arg_20_1.action.data

	if var_20_0.groupCommand and var_20_0.groupCommand.type == 1 then
		eventManager.dispatchEvent("updataGroupPanel", var_20_0.groupCommand.groupInfo)
		eventManager.dispatchEvent("addKfWorldGroup", var_20_0.groupCommand.groupInfo)
	end
end

function var_0_0.handlerPushPlayer(arg_21_0, arg_21_1)
	log.info("===============handlerPushPlayer")

	local var_21_0 = arg_21_1.action.data.update

	if var_21_0 and var_21_0.zfjxNum and var_21_0.zfjxNum > 0 then
		local var_21_1 = smgr.getLayer("effectlayer")
		local var_21_2 = CCSprite:create("res/ui/battle/battle_tip_background.png")

		var_21_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
		var_21_1:addChild(var_21_2)

		local function var_21_3()
			var_21_1:removeChild(var_21_2, true)
		end

		local var_21_4

		log.info("playerUpData.zfjxForceId" .. var_21_0.zfjxForceId .. user.player.forceId)

		if var_21_0.zfjxForceId == user.player.forceId then
			var_21_4 = CCStrokeLabelTTF:create(language.get(490721, var_21_0.zfjxNum), "Thonburi-Bold", 32)
		else
			var_21_4 = CCStrokeLabelTTF:create(language.get(490722, var_21_0.zfjxNum), "Thonburi-Bold", 32)
		end

		local var_21_5 = 200

		if var_21_4 then
			var_21_4:setPosition(ccp(var_21_2:getContentSize().width * 0.5 + var_21_5, var_21_2:getContentSize().height * 0.5))
			var_21_2:addChild(var_21_4)

			local var_21_6 = CCArray:create()

			var_21_6:addObject(CCFadeIn:create(0.06))
			var_21_6:addObject(CCMoveBy:create(0.3, ccp(-var_21_5, 0)))
			var_21_6:addObject(CCDelayTime:create(2.5))
			var_21_6:addObject(CCMoveBy:create(0.3, ccp(-var_21_5, 0)))
			var_21_6:addObject(CCFadeOut:create(0.06))
			var_21_6:addObject(CCCallFuncN:create(var_21_3))

			local var_21_7 = CCSequence:create(var_21_6)

			var_21_4:runAction(CCSequence:create(var_21_6))
		end
	end
end

function var_0_0.getSIndivTask(arg_23_0)
	local function var_23_0(arg_24_0)
		arg_23_0.menuLayer:handlerGetSIndivTaskAction(arg_24_0)
	end

	kfcmgr.sendRequest(var_23_0, actions.kfyzGetSIndivTasks)
end

function var_0_0.handlerPushKfyzIndivChangeAction(arg_25_0, arg_25_1)
	arg_25_0:getSIndivTask()
	eventManager.dispatchEvent("kfyzIndivChange", arg_25_1)

	local var_25_0 = arg_25_1.data.indivchange

	if var_25_0 and var_25_0.isFinish and not var_25_0.isReward then
		local var_25_1 = CCSprite:create("res/ui/kfyz/kfyz_word_rwwc.png")

		var_25_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 50))
		smgr.showTipSpriteText(var_25_1)
	end
end

function var_0_0.onEnter(arg_26_0)
	log.info("mgWorld:onEnter")
	kfcmgr.sendRequest(nil, actions.kfEnter)

	function arg_26_0.getGeneralRef(arg_27_0)
		local var_27_0 = {}

		for iter_27_0, iter_27_1 in pairs(arg_26_0.generalPanelControl.generals) do
			var_27_0[iter_27_0] = iter_27_1
		end

		return var_27_0
	end

	arg_26_0.handlerPushKfyzIndivChangeActionRef = handler(arg_26_0, arg_26_0.handlerPushKfyzIndivChangeAction)

	function arg_26_0.handlerPushKfGeneralActionRef(arg_28_0)
		arg_26_0:handlerPushKfGeneralAction(arg_28_0)
	end

	function arg_26_0.handlerPushKfWorldActionRef(arg_29_0)
		arg_26_0:handlerPushKfWorldAction(arg_29_0)
	end

	function arg_26_0.handlerPushAutoBattleForKfRef(arg_30_0)
		arg_26_0:handlerPushAutoBattleForKf(arg_30_0)
	end

	function arg_26_0.handlerKfyzMineChangeRef(arg_31_0)
		arg_26_0:handlerKfyzMineChange(arg_31_0)
	end

	function arg_26_0.kfworldMoveRef(arg_32_0, arg_32_1, arg_32_2)
		arg_26_0:handlerKfWorldMoveAction(arg_32_0, arg_32_1, arg_32_2)
	end

	function arg_26_0.changeMatchStateRef(arg_33_0)
		arg_26_0:changeMatchState(arg_33_0)
	end

	function arg_26_0.onBattleover(arg_34_0)
		arg_26_0:changeMatchState(arg_34_0)
		arg_26_0:battleOver()
	end

	function arg_26_0.getWorldMapRef(arg_35_0)
		arg_26_0:getWorldMap(arg_35_0)
	end

	function arg_26_0.handlerKfPushCitiesActionRef(arg_36_0)
		arg_26_0:handlerKfPushCitiesAction(arg_36_0)
	end

	eventManager.registerEvent("KfworldGetGenerals", arg_26_0.getGeneralRef)
	eventManager.registerEvent("kfworldMove", arg_26_0.kfworldMoveRef)
	eventManager.registerEvent("changeMatchState", arg_26_0.changeMatchStateRef)
	eventManager.registerEvent("kfworldBattleOver", arg_26_0.onBattleover)
	eventManager.registerEvent("getYzWorldMap", arg_26_0.getWorldMapRef)
	kfcmgr.registerResponseHandler(actions.kfpushGeneral, arg_26_0.handlerPushKfGeneralActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfworld, arg_26_0.handlerPushKfWorldActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfAutoBattle, arg_26_0.handlerPushAutoBattleForKfRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzMineChange, arg_26_0.handlerKfyzMineChangeRef)
	kfcmgr.registerResponseHandler(actions.pushKfyzIndivChange, arg_26_0.handlerPushKfyzIndivChangeActionRef)

	arg_26_0.handlerPushKfChatRef = handler(arg_26_0, arg_26_0.handlerPushKfChat)

	kfcmgr.registerResponseHandler(actions.pushKfChat, arg_26_0.handlerPushKfChatRef)
	kfcmgr.registerResponseHandler(actions.pushPlayer, arg_26_0.handlerPushPlayer)
	cmgr.registerResponseHandler(actions.pushCities, arg_26_0.handlerKfPushCitiesActionRef)
end

function var_0_0.onExit(arg_37_0)
	eventManager.unregisterEvent("KfworldGetGenerals", arg_37_0.getGeneralRef)
	eventManager.unregisterEvent("kfworldMove", arg_37_0.kfworldMoveRef)
	eventManager.unregisterEvent("changeMatchState", arg_37_0.changeMatchStateRef)
	eventManager.unregisterEvent("kfworldBattleOver", arg_37_0.onBattleover)
	eventManager.unregisterEvent("getYzWorldMap", arg_37_0.getWorldMapRef)
	kfcmgr.unregisterResponseHandler(actions.kfpushGeneral, arg_37_0.handlerPushKfGeneralActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfworld, arg_37_0.handlerPushKfWorldActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfAutoBattle, arg_37_0.handlerPushAutoBattleForKfRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzMineChange, arg_37_0.handlerKfyzMineChangeRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfyzIndivChange, arg_37_0.handlerPushKfyzIndivChangeActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfChat, arg_37_0.handlerPushKfChatRef)
	kfcmgr.unregisterResponseHandler(actions.pushPlayer, arg_37_0.handlerPushPlayer)
	cmgr.unregisterResponseHandler(actions.pushCities, arg_37_0.handlerKfPushCitiesActionRef)
	var_0_3:clearup()

	for iter_37_0, iter_37_1 in pairs(tolua.getpeer(arg_37_0)) do
		arg_37_0[iter_37_0] = nil
	end
end

return var_0_0
