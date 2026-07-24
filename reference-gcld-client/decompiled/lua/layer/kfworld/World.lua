local var_0_0 = class("KfWorld", function()
	return createBaseLayer()
end)

KfWorldLayerMapping = {
	[2] = 2,
	[3] = 3
}

require("lua/layer/kfworld/kfgzConstants")

local var_0_1 = require("lua/layer/kfworld/MenuLayer")
local var_0_2 = require("lua/layer/kfworld/MapLayer")
local var_0_3 = require("lua/layer/kfworld/PlayerInfoLayer")
local var_0_4 = require("lua/layer/kfworld/ConfigureLoader")
local var_0_5 = require("lua/layer/kfworld/kfgzNotice/kfgzNotice")
local var_0_6 = require("lua/layer/kfworld/kfgzRank/kfgzCommonButton")

function var_0_0.ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	user.kfworldId = user.kfworldId or 1
	kfworld = kfworld or {}
	arg_2_0.cityId = arg_2_4

	if arg_2_2 then
		kfworld.matchState = arg_2_2
	else
		arg_2_2 = kfworld.matchState
	end

	rmgr.loadResource("res/ui/world/worldBuilding.plist")
	rmgr.loadResource("res/ui/world/cityWindow.plist")
	rmgr.loadResource("res/ui/world/convene.plist")
	rmgr.loadResource("res/ui/world/generalMove.plist")
	rmgr.loadResource("res/ui/kfworld/kfWorldName.plist")
	rmgr.loadResource("res/ui/juben/flag.plist")
	rmgr.loadResource("res/ui/juben/jubenForceIcon.plist")

	arg_2_0.warOptionTable = arg_2_3
	arg_2_0.config = var_0_4.new(arg_2_0)
	arg_2_0.menuLayer = var_0_1.new(arg_2_0)
	arg_2_0.mapLayer = var_0_2.new(arg_2_0)
	arg_2_0.playerInfoLayer = var_0_3.new(arg_2_0)
	arg_2_0.warOptionLayer = CCLayer:create()

	arg_2_0:addChild(arg_2_0.mapLayer, 1)
	arg_2_0:addChild(arg_2_0.menuLayer, 2)
	arg_2_0:addChild(arg_2_0.playerInfoLayer, 3)
	arg_2_0.menuLayer:changeMatchState(arg_2_2)

	local var_2_0 = smgr.getLayer("uiLayer")

	arg_2_0.generalPanelControl = showSimpleGeneralPanel(var_2_0, nil, true, true)

	arg_2_0.mapLayer:addChild(arg_2_0.warOptionLayer, 200)
	smgr.hideNotice()
	eventManager.dispatchEvent("taskButtonItemSetVisible", false)
	var_0_5:create(arg_2_0.generalPanelControl)

	if arg_2_5 then
		arg_2_0:battleOver()
	else
		arg_2_0:changeMatchState(arg_2_2)
	end

	if arg_2_0.cityId then
		arg_2_0.mapLayer:moveTo(arg_2_4)
	end
end

function var_0_0.battleOver(arg_3_0)
	smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

	local function var_3_0(arg_4_0)
		local var_4_0 = require("lua/layer/kfworld/ResultCalc")
		local var_4_1 = 0
		local var_4_2 = 0

		for iter_4_0, iter_4_1 in pairs(arg_4_0.data.city) do
			if iter_4_1.force == 1 then
				var_4_1 = var_4_1 + 1
			elseif iter_4_1.force == 2 then
				var_4_2 = var_4_2 + 1
			end
		end

		local var_4_3 = var_4_2 <= var_4_1

		if (user.player.kfgzForceId or 1) ~= 1 then
			var_4_3 = not var_4_3
		end

		var_4_0:create(var_4_3, arg_3_0.changeMatchStateRef, arg_3_0.matchState)
	end

	kfcmgr.sendRequest(var_3_0, actions.kfWorldGetWorldMap)
end

function var_0_0.changeMatchState(arg_5_0, arg_5_1)
	arg_5_0.matchState = arg_5_1

	arg_5_0.menuLayer:changeMatchState(arg_5_1)

	if arg_5_1 == 2 then
		var_0_6:destory()

		if kfcmgr.loginIn then
			arg_5_0:getWorldMap()
		else
			local function var_5_0(arg_6_0)
				local var_6_0 = arg_6_0.action.data.matchState

				arg_5_0.matchState = var_6_0

				if var_6_0 == 2 then
					kfcmgr.loginkfgz(arg_6_0.action.data, true)
				else
					var_0_6:create(var_6_0)
				end
			end

			cmgr.sendRequest(var_5_0, actions.kfgzSignUp)
		end
	else
		arg_5_0.mapLayer:removeFromParentAndCleanup(true)

		arg_5_0.mapLayer = var_0_2.new(arg_5_0)

		arg_5_0:addChild(arg_5_0.mapLayer, 1)

		arg_5_0.warOptionLayer = CCLayer:create()

		arg_5_0.mapLayer:addChild(arg_5_0.warOptionLayer, 200)
		var_0_6:create(arg_5_1)
	end
end

function var_0_0.getWorldMap(arg_7_0, arg_7_1)
	if arg_7_0.matchState ~= 2 then
		return
	end

	local function var_7_0(arg_8_0)
		arg_7_0.playerInfoLayer:handlerGetWorldMapAction(arg_8_0)
		arg_7_0.mapLayer:handlerGetWorldMapAction(arg_8_0, arg_7_1)
		arg_7_0.menuLayer:handlerGetWorldMapAction(arg_8_0)
		arg_7_0.generalPanelControl.handlerGetWorldMapAction(arg_8_0)
		arg_7_0.menuLayer:changeRank(arg_8_0.data.rankInfo)

		local var_8_0 = user.player.kfgzForceId or 1
		local var_8_1 = {
			{
				1,
				2
			},
			{
				51,
				83
			}
		}

		if arg_7_0.cityId == nil then
			local var_8_2 = var_8_1[user.kfworldId][var_8_0]

			if var_8_2 ~= nil then
				arg_7_0.mapLayer:moveTo(var_8_2, false, false, 0)
			end
		else
			arg_7_0.cityId = nil
		end

		if arg_7_0.warOptionTable and not arg_7_0.warOptionTable.isClosed then
			arg_7_0.mapLayer.warOptionTable = arg_7_0.warOptionTable

			require("lua/layer/warOption/warOptionController")

			local var_8_3 = smgr.getLayer("generalMoveLayer")

			warOptionController.updateWarOptionLayer(arg_7_0.warOptionLayer, arg_7_0.warOptionTable, arg_7_0.mapLayer.cityTable, "", var_8_3)
		end

		if arg_8_0.data.officeTokenList and #arg_8_0.data.officeTokenList > 0 then
			local var_8_4 = {}

			for iter_8_0, iter_8_1 in pairs(arg_8_0.data.officeTokenList) do
				table.insert(var_8_4, iter_8_1.officeToken)
			end

			var_0_5:showOfficeToken(true, var_8_4)
		end

		if arg_8_0.data.orderTokenList and #arg_8_0.data.orderTokenList > 0 then
			local var_8_5 = {}

			for iter_8_2, iter_8_3 in pairs(arg_8_0.data.orderTokenList) do
				table.insert(var_8_5, iter_8_3.orderToken)
			end

			var_0_5:showOrderToken(true, var_8_5)
		end
	end

	kfcmgr.sendRequest(var_7_0, actions.kfWorldGetWorldMap)
end

function var_0_0.handlerPushKfGeneralAction(arg_9_0, arg_9_1)
	if arg_9_0.matchState ~= 2 then
		return
	end

	arg_9_0.generalPanelControl.kfMergeAttribute(arg_9_1.data.hp)

	if arg_9_1.data.directMove then
		local var_9_0 = arg_9_1.data.directMove

		eventManager.dispatchEvent("positionGeneral", var_9_0.gid, var_9_0.cityId)
	end
end

function var_0_0.handlerPushKfWorldAction(arg_10_0, arg_10_1)
	if arg_10_0.matchState ~= 2 then
		return
	end

	local var_10_0 = arg_10_1.data

	if var_10_0.generalMove then
		local var_10_1 = {
			var_10_0.generalMove.fromCity,
			var_10_0.generalMove.toCity
		}

		if smgr.getLayer("generalMoveLayer") ~= nil then
			traceData.createTrace(var_10_0.generalMove.gid, var_10_1)
		end

		arg_10_0.mapLayer:generalMove(var_10_0.generalMove)
	elseif var_10_0.cityInfo then
		arg_10_0.mapLayer:changeCity(var_10_0.cityInfo)
		arg_10_0.playerInfoLayer:changeCity(var_10_0.cityInfo)
	elseif var_10_0.stgs then
		arg_10_0.mapLayer:updateTrick(var_10_0.stgs)
	elseif var_10_0.killRanking then
		arg_10_0.menuLayer:changeRank(var_10_0.killRanking.rankInfo)
	elseif var_10_0.cities and var_10_0.cities.reloadWorld == 1 then
		log.info("data.cities.reloadWorld")
		arg_10_0:getWorldMap(true)
	end

	if var_10_0.generalMove then
		arg_10_0.generalPanelControl.updateGeneralState(var_10_0.generalMove.gid, var_10_0.generalMove.generalState)
	end

	if var_10_0.orderToken then
		var_0_5:showOrderToken(true, {
			var_10_0.orderToken.orderToken
		})
	end

	if var_10_0.officeToken then
		var_0_5:showOfficeToken(true, {
			var_10_0.officeToken.officeToken
		})
	end

	if var_10_0.groupteam then
		var_0_5:showGroupTeam(var_10_0.groupteam.gstate)
	end
end

function var_0_0.handlerPushKfGroupTeamAction(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.data.teamchange

	if var_11_0 and var_11_0.gtc then
		var_0_5:getGroupTeamInfo()
	end
end

function var_0_0.handlerKfWorldMoveAction(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if arg_12_0.matchState ~= 2 then
		return
	end

	arg_12_0.mapLayer:handlerKfWorldMoveAction(arg_12_1, arg_12_2, arg_12_3)
end

function var_0_0.changeWorldIdByLayerId(arg_13_0, arg_13_1)
	log.info("World:changeWorldIdByLayerId(layerId)", kfworld.matchState)

	if arg_13_0.layerId ~= arg_13_1 and kfworld.matchState ~= nil and kfworld.matchState ~= 2 then
		arg_13_0.layerId = arg_13_1

		if arg_13_1 == 1 or arg_13_1 == 2 then
			user.kfworldId = 1
		elseif arg_13_1 == 3 or arg_13_1 == 4 then
			user.kfworldId = 2
		end

		arg_13_0.config = var_0_4.new(arg_13_0)

		arg_13_0.mapLayer:removeFromParentAndCleanup(true)

		arg_13_0.mapLayer = var_0_2.new(arg_13_0)

		arg_13_0:addChild(arg_13_0.mapLayer, 1)

		arg_13_0.warOptionLayer = CCLayer:create()

		arg_13_0.mapLayer:addChild(arg_13_0.warOptionLayer, 200)
	end
end

function var_0_0.onEnter(arg_14_0)
	function arg_14_0.getGeneralRef(arg_15_0)
		local var_15_0 = {}

		for iter_15_0, iter_15_1 in pairs(arg_14_0.generalPanelControl.generals) do
			var_15_0[iter_15_0] = iter_15_1
		end

		return var_15_0
	end

	function arg_14_0.handlerPushKfGeneralActionRef(arg_16_0)
		arg_14_0:handlerPushKfGeneralAction(arg_16_0)
	end

	function arg_14_0.handlerPushKfWorldActionRef(arg_17_0)
		arg_14_0:handlerPushKfWorldAction(arg_17_0)
	end

	arg_14_0.handlerPushKfGroupTeamActionRef = handler(arg_14_0, arg_14_0.handlerPushKfGroupTeamAction)

	function arg_14_0.kfworldMoveRef(arg_18_0, arg_18_1, arg_18_2)
		arg_14_0:handlerKfWorldMoveAction(arg_18_0, arg_18_1, arg_18_2)
	end

	function arg_14_0.changeMatchStateRef(arg_19_0)
		arg_14_0:changeMatchState(arg_19_0)
	end

	function arg_14_0.onBattleover(arg_20_0)
		arg_14_0:changeMatchState(arg_20_0)
		arg_14_0:battleOver()
	end

	arg_14_0.changeWorldMapRef = handler(arg_14_0, arg_14_0.changeWorldIdByLayerId)

	eventManager.registerEvent("KfworldGetGenerals", arg_14_0.getGeneralRef)
	eventManager.registerEvent("kfworldMove", arg_14_0.kfworldMoveRef)
	eventManager.registerEvent("changeMatchState", arg_14_0.changeMatchStateRef)
	eventManager.registerEvent("kfworldBattleOver", arg_14_0.onBattleover)
	eventManager.registerEvent("changeWorldMap", arg_14_0.changeWorldMapRef)
	kfcmgr.registerResponseHandler(actions.kfpushGeneral, arg_14_0.handlerPushKfGeneralActionRef)
	kfcmgr.registerResponseHandler(actions.pushKfworld, arg_14_0.handlerPushKfWorldActionRef)
	kfcmgr.registerResponseHandler(actions.kfgzPushGroupTeam, arg_14_0.handlerPushKfGroupTeamActionRef)
end

function var_0_0.onExit(arg_21_0)
	eventManager.unregisterEvent("KfworldGetGenerals", arg_21_0.getGeneralRef)
	eventManager.unregisterEvent("kfworldMove", arg_21_0.kfworldMoveRef)
	eventManager.unregisterEvent("changeMatchState", arg_21_0.changeMatchStateRef)
	eventManager.unregisterEvent("kfworldBattleOver", arg_21_0.onBattleover)
	eventManager.unregisterEvent("changeWorldMap", arg_21_0.changeWorldMapRef)
	kfcmgr.unregisterResponseHandler(actions.kfpushGeneral, arg_21_0.handlerPushKfGeneralActionRef)
	kfcmgr.unregisterResponseHandler(actions.pushKfworld, arg_21_0.handlerPushKfWorldActionRef)
	kfcmgr.unregisterResponseHandler(actions.kfgzPushGroupTeam, arg_21_0.handlerPushKfGroupTeamActionRef)
	var_0_5:clearup()
end

return var_0_0
