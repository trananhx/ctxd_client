require("lua/layer/world/eventWindow")

local var_0_0 = class("cityWindowControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
	arg_1_0.conveneGeneralTable = {}
end

function var_0_0.getAssembleGeneral(arg_2_0, arg_2_1)
	require("lua/common/msgTransform")

	arg_2_0.generalData = msgTransform.GeneralInfo2Assemble(arg_2_1).action.data

	if arg_2_1 == 206 or arg_2_1 == 253 or arg_2_1 == 254 then
		arg_2_0:getFarmInfo(arg_2_1)
	elseif arg_2_1 == 251 or arg_2_1 == 252 or arg_2_1 == 250 then
		arg_2_0:getManzuInfo(arg_2_1)
	elseif arg_2_0.ui.init then
		if arg_2_0.notFirit then
			arg_2_0.ui:init(true)
		else
			arg_2_0.ui:init(false)

			arg_2_0.notFirit = true
		end
	end
end

function var_0_0.getKfGeneralInfo(arg_3_0, arg_3_1)
	local function var_3_0(arg_4_0)
		arg_4_0.data = arg_4_0.data or {}
		arg_4_0.data.gIds = arg_4_0.data.gIds or {}
		arg_3_0.kfGeneral = {}

		local var_4_0 = eventManager.dispatchEvent("KfworldGetGenerals", arg_3_0.cityId)

		for iter_4_0, iter_4_1 in pairs(arg_4_0.data.gIds) do
			for iter_4_2, iter_4_3 in pairs(var_4_0) do
				if iter_4_3.id == iter_4_1 then
					arg_3_0.kfGeneral[iter_4_1] = iter_4_3
				end
			end
		end

		if arg_3_0.notFirit then
			arg_3_0.ui:init(true)
		else
			arg_3_0.ui:init(false)

			arg_3_0.notFirit = true
		end
	end

	kfcmgr.sendRequest(var_3_0, actions.getCallGeneralInfo, arg_3_1)
end

local function var_0_1(arg_5_0)
	local var_5_0 = {
		targetId = arg_5_0.id,
		attSide = {},
		defSide = {},
		cityTrickState = {},
		inBattle = (function()
			return arg_5_0.cityState == 1
		end)()
	}

	if var_5_0.inBattle == true then
		for iter_5_0, iter_5_1 in pairs(arg_5_0.battleArmies) do
			if iter_5_1.isAtt == true then
				var_5_0.attSide[#var_5_0.attSide + 1] = {}
				var_5_0.attSide[#var_5_0.attSide].num = iter_5_1.num
				var_5_0.attSide[#var_5_0.attSide].forceId = iter_5_1.forceId
			else
				var_5_0.defSide[#var_5_0.defSide + 1] = {}
				var_5_0.defSide[#var_5_0.defSide].num = iter_5_1.num
				var_5_0.defSide[#var_5_0.defSide].forceId = iter_5_1.forceId
			end
		end
	end

	return var_5_0
end

function var_0_0.getCityDetailInfo(arg_7_0, arg_7_1)
	arg_7_1 = tonumber(arg_7_1)

	local function var_7_0(arg_8_0)
		log.info("response%s:%s", arg_7_1, tool.tableToJson(arg_8_0))

		if smgr.currentSceneTag == SCENE_JUBEN then
			arg_7_0.cityData = arg_8_0.action.data

			if arg_7_0.notFirit then
				arg_7_0.ui:init(true)
			else
				arg_7_0.ui:init(false)

				arg_7_0.notFirit = true
			end
		elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
			arg_7_0.cityData = var_0_1(arg_8_0.data)

			arg_7_0:getKfGeneralInfo(arg_7_1)
		else
			arg_7_0.cityData = arg_8_0.action.data

			arg_7_0:getAssembleGeneral(arg_7_1)
		end
	end

	if smgr.currentSceneTag == SCENE_JUBEN then
		cmgr.sendRequest(var_7_0, actions.getJuBenCityInfo, arg_7_1, user.ywData.battleKey)
	elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		kfcmgr.sendRequest(var_7_0, actions.kfworldGetCityInfo, arg_7_1)
	else
		cmgr.sendRequest(var_7_0, actions.cityDetailInfo, arg_7_1)
	end
end

function var_0_0.getFarmInfo(arg_9_0, arg_9_1)
	local function var_9_0(arg_10_0)
		log.info("getFarmInfo:%s", tool.tableToJson(arg_10_0))
		eventManager.dispatchEvent("handlerGetFarmInfoAction", arg_10_0)

		arg_9_0.farmData = arg_10_0.action.data

		if arg_9_0.notFirit then
			arg_9_0.ui:init(true)
		else
			arg_9_0.ui:init(false)

			arg_9_0.notFirit = true
		end
	end

	cmgr.sendRequest(var_9_0, actions.getFarmCityInfo)
end

function var_0_0.getManzuInfo(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		arg_11_0.manzuData = arg_12_0.action.data

		eventManager.dispatchEvent("handlerGetShouMaiInfoAction", arg_12_0)

		if arg_11_0.notFirit then
			arg_11_0.ui:init(true)
		else
			arg_11_0.ui:init(false)

			arg_11_0.notFirit = true
		end
	end

	cmgr.sendRequest(var_11_0, actions.getManzuShoumaiInfo)
end

function var_0_0.conveneGeneral(arg_13_0, arg_13_1)
	amgr.playEffect(enumAudioFile.wujiang_zunming)

	local function var_13_0(arg_14_0)
		if arg_14_0.action.data.msg ~= nil then
			smgr.showTipText(arg_14_0.action.data.msg)
		end

		arg_13_0:getAssembleGeneral(arg_13_0.ui.cityId)
	end

	cmgr.sendRequest(function(arg_15_0)
		if arg_15_0.action.data.msg and arg_15_0.action.data.msg ~= "" then
			smgr.showTipText(arg_15_0.action.data.msg)
		end

		cmgr.sendRequest(var_13_0, actions.autoMove, arg_13_0.ui.cityId, arg_13_1)
	end, actions.autoMoveInfo, arg_13_0.ui.cityId, arg_13_1)
end

function var_0_0.conveneGongjiang(arg_16_0)
	local function var_16_0(arg_17_0)
		if arg_17_0.action.data.msg and arg_17_0.action.data.msg ~= "" then
			smgr.showTipText(arg_17_0.action.data.msg)
		end
	end

	log.info("self.ui.gongjiangId = ", arg_16_0.ui.gongjiangId)
	log.info("self.ui.cityId = ", arg_16_0.ui.cityId)
	cmgr.sendRequest(var_16_0, actions.castleAutoMove, arg_16_0.ui.gongjiangId, arg_16_0.ui.cityId)
end

function var_0_0.conveneJuntuan(arg_18_0)
	local function var_18_0(arg_19_0)
		local var_19_0 = arg_19_0.data or arg_19_0.action.data

		if var_19_0.msg and var_19_0.msg ~= "" then
			smgr.showTipText(var_19_0.msg)
		end
	end

	if smgr.currentSceneTag == SCENE_KFYZ_WORLD then
		local var_18_1 = user.kfCorpsInfo[user.player.kfgzForceId]

		if var_18_1 then
			kfcmgr.sendRequest(var_18_0, actions.corpsMove, var_18_1.corpsId, arg_18_0.ui.cityId)
		end
	else
		local var_18_2 = user.corpsInfo[user.player.forceId]

		if var_18_2 then
			cmgr.sendRequest(var_18_0, actions.corpsMove, var_18_2.corpsId, arg_18_0.ui.cityId)
		end
	end
end

function var_0_0.showJuntuan(arg_20_0, arg_20_1)
	local function var_20_0(arg_21_0)
		local var_21_0 = smgr.getLayer("topLayer")

		require("lua/layer/corps/CorpsPanelNew").new(var_21_0, arg_21_0.action.data, arg_20_1)
	end

	cmgr.sendRequest(var_20_0, actions.getCorpsInfo, 0, arg_20_1)
end

function var_0_0.jubenConveneGeneral(arg_22_0, arg_22_1)
	local function var_22_0(arg_23_0)
		if arg_22_0.notFirit then
			arg_22_0.ui:init(true)
		else
			arg_22_0.ui:init(false)

			arg_22_0.notFirit = true
		end
	end

	cmgr.sendRequest(var_22_0, actions.jubenAutoMove, arg_22_0.ui.cityId, arg_22_1)
	var_22_0({})
end

function var_0_0.kfworldConveneGeneral(arg_24_0, arg_24_1)
	local function var_24_0(arg_25_0)
		if arg_24_0.notFirit then
			arg_24_0.ui:init(true)
		else
			arg_24_0.ui:init(false)

			arg_24_0.notFirit = true
		end

		eventManager.dispatchEvent("kfworldMove", arg_24_1, arg_24_0.ui.cityId, arg_25_0)
	end

	kfcmgr.sendRequest(var_24_0, actions.kfworldMove, arg_24_1, arg_24_0.ui.cityId)
end

function var_0_0.onTap(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.ui.gidTable or {}

	if arg_26_0.ui.menuLevel == 0 then
		for iter_26_0, iter_26_1 in pairs(var_26_0) do
			if arg_26_0.ui.uiTable["cityGeneral_" .. iter_26_0]:isVisible() and tool.checkIfTouch(arg_26_0.ui.uiTable["cityGeneral_" .. iter_26_0], arg_26_1, arg_26_2) then
				if smgr.currentSceneTag == SCENE_JUBEN then
					arg_26_0.conveneGeneralTable[#arg_26_0.conveneGeneralTable + 1] = iter_26_1.info.id

					arg_26_0:jubenConveneGeneral(iter_26_1.info.id)
				elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
					arg_26_0.conveneGeneralTable[#arg_26_0.conveneGeneralTable + 1] = iter_26_1.info.id

					arg_26_0:kfworldConveneGeneral(iter_26_1.info.id)
				else
					arg_26_0:conveneGeneral(iter_26_1.info.gId)

					arg_26_0.conveneGeneralTable[#arg_26_0.conveneGeneralTable + 1] = iter_26_1.info.gId
				end

				return
			end
		end
	end

	if arg_26_0.ui.uiTable and arg_26_0.ui.uiTable.jianzaodui:isVisible() and tool.checkIfTouch(arg_26_0.ui.uiTable.jianzaodui, arg_26_1, arg_26_2) then
		arg_26_0:conveneGongjiang()

		return
	end

	if arg_26_0.ui.uiTable and arg_26_0.ui.uiTable.juntuan:isVisible() and tool.checkIfTouch(arg_26_0.ui.uiTable.juntuan, arg_26_1, arg_26_2) then
		arg_26_0:conveneJuntuan()

		return
	end

	if arg_26_0.ui.uiTable and arg_26_0.ui.uiTable.juntuanEnter:isVisible() and tool.checkIfTouch(arg_26_0.ui.uiTable.juntuanEnter, arg_26_1, arg_26_2) then
		if user.corpsCmdId and user.corpsCmdId == user.player.id then
			smgr.showTipText(language.get(215626))
		else
			arg_26_0:showJuntuan(0)
		end

		return
	end

	if arg_26_0.ui.uiTable and arg_26_0.ui.uiTable.personJTEnter:isVisible() and tool.checkIfTouch(arg_26_0.ui.uiTable.personJTEnter, arg_26_1, arg_26_2) then
		if user.corpsCmdId and user.corpsCmdId == user.player.id then
			smgr.showTipText(language.get(215626))
		else
			arg_26_0:showJuntuan(1)
		end

		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.cityBackground, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.switchPage, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.shaOrder, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.donate, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.buy, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.detail, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.fadong, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.mzJiasu, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.farmJiasu, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.xuezhan, arg_26_1, arg_26_2) then
		return
	end

	if tool.checkIfTouch(arg_26_0.ui.uiTable.jianshou, arg_26_1, arg_26_2) then
		return
	end

	arg_26_0.ui:exit()
end

function var_0_0.isTouchOn(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_0.ui.gidTable then
		return true
	end

	if arg_27_0.ui.menuLevel == 0 then
		for iter_27_0, iter_27_1 in pairs(arg_27_0.ui.gidTable) do
			if tool.checkIfTouch(arg_27_0.ui.uiTable["cityGeneral_" .. iter_27_0], arg_27_1, arg_27_2) then
				arg_27_0:conveneGeneral(iter_27_1.info.gId)

				return true
			end
		end
	end

	if tool.checkIfTouch(arg_27_0.ui.uiTable.cityBackground, arg_27_1, arg_27_2) then
		return true
	end

	return false
end

function var_0_0.showBattle(arg_28_0)
	if smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		bmgr.enterKfgz(arg_28_0.ui.cityId)
	else
		local var_28_0 = arg_28_0.cityData.battleId
		local var_28_1 = arg_28_0.ui.cityId

		smgr.changeScene(SCENE_BATTLE, battleType.BATTLE_CITY_NPC, {
			battleId = var_28_0,
			cityId = var_28_1
		})
	end
end

function var_0_0.showFarm(arg_29_0)
	smgr.changeScene(SCENE_FARM)
end

function var_0_0.farmDonate(arg_30_0)
	local function var_30_0(arg_31_0)
		arg_30_0:getFarmInfo(arg_30_0.ui.cityId)

		local var_31_0 = {
			{}
		}

		var_31_0[1].id = 6
		var_31_0[1].value = arg_31_0.action.data.exp

		globalAction_gotResource(var_31_0)
	end

	cmgr.sendRequest(var_30_0, actions.investFarm)
end

function var_0_0.startAutoBattle(arg_32_0, arg_32_1)
	local var_32_0 = require("lua/layer/world/autoBattle/AutoBattleNew")

	var_32_0.new({
		cityId = arg_32_0.ui.cityId,
		cityIsOurs = arg_32_1,
		state = var_32_0.STATE.BEFORE_BATTLE
	})
	arg_32_0.ui:exit()
end

function var_0_0.manzuBuy(arg_33_0, arg_33_1)
	local function var_33_0(arg_34_0)
		arg_33_0:getManzuInfo(arg_33_1)

		local var_34_0 = {
			{}
		}

		var_34_0[1].id = 6
		var_34_0[1].value = arg_34_0.action.data.exp

		globalAction_gotResource(var_34_0)
	end

	cmgr.sendRequest(var_33_0, actions.manzuShoumai, arg_33_1)
end

function var_0_0.manzuJiasu(arg_35_0, arg_35_1)
	local function var_35_0()
		arg_35_0:getManzuInfo(arg_35_1)
	end

	if user.chargeItems.coverManzuShoumaiCd.noDisturb then
		cmgr.sendRequest(var_35_0, actions.coverManzuShoumaiCd, arg_35_1)
	else
		cmgr.sendRequest(function(arg_37_0)
			local var_37_0 = arg_37_0.action.data.gold

			require("lua/component/messageBox")
			messageBox.showChargeWin(language.get(200302), language.get(200303, var_37_0), "coverManzuShoumaiCd", function()
				cmgr.sendRequest(var_35_0, actions.coverManzuShoumaiCd, arg_35_1)
			end)
		end, actions.getShoumaiCost)
	end
end

function var_0_0.farmJiasu(arg_39_0, arg_39_1)
	local function var_39_0()
		arg_39_0:getFarmInfo(arg_39_1)
	end

	if user.chargeItems.recoverGold.noDisturb then
		cmgr.sendRequest(var_39_0, actions.farmRecoverGold, arg_39_1)
	else
		cmgr.sendRequest(function(arg_41_0)
			local var_41_0 = arg_41_0.action.data.gold

			require("lua/component/messageBox")
			messageBox.showChargeWin(language.get(200302), language.get(200303, var_41_0), "recoverGold", function()
				cmgr.sendRequest(var_39_0, actions.farmRecoverGold, arg_39_1)
			end)
		end, actions.farmGetRecoverCostGold)
	end
end

function var_0_0.manzuFadong(arg_43_0, arg_43_1)
	local function var_43_0(arg_44_0)
		arg_43_0:getManzuInfo(arg_43_1)
	end

	cmgr.sendRequest(var_43_0, actions.fadongManzu, arg_43_1)
end

function var_0_0.showEvent(arg_45_0)
	local var_45_0 = smgr.getLayer("worldLayer")
	local var_45_1 = smgr.getLayer("worldCamera").cityTable["world_building_" .. arg_45_0.ui.cityId]

	if var_45_1.eventInfo.eventType == 1001 or var_45_1.eventInfo.eventType == 1002 or var_45_1.eventInfo.eventType == 1003 then
		local var_45_2 = createPlayerEventWindow(var_45_1.prop[1])

		var_45_0:addChild(var_45_2, 105)
	else
		local var_45_3 = createEventWindow(var_45_1.prop[1])

		var_45_0:addChild(var_45_3, 105)
	end

	arg_45_0.ui:exit()
end

function var_0_0.showOrder(arg_46_0)
	arg_46_0.ui:showOrder()
	arg_46_0.ui:exit()
end

function var_0_0.useKillToken(arg_47_0)
	local function var_47_0(arg_48_0)
		if arg_48_0.action.data.msg ~= nil then
			worldControl.shaDiLingNum = worldControl.shaDiLingNum - 1

			arg_47_0:action_fly("shadiling", nil)
			arg_47_0:action_playAnimation("shadiling")
			arg_47_0.ui:exit()
		end
	end

	if user.pin and user.pin <= 1 and worldControl.shaDiLingNum ~= nil and worldControl.shaDiLingNum > 0 then
		cmgr.sendRequest(var_47_0, actions.useKillToken, arg_47_0.ui.cityId)
	end
end

function var_0_0.switchPage(arg_49_0)
	arg_49_0.ui:switchPage()
end

function var_0_0.detail(arg_50_0)
	arg_50_0.ui:manzuDetail()
end

function var_0_0.click_plan1(arg_51_0)
	local var_51_0 = true

	if worldControl.stratagem ~= nil and worldControl.stratagem[1] ~= nil then
		var_51_0 = false
	end

	if var_51_0 == true then
		require("lua/layer/general/ui")

		user.is_enter_jiuguan_wujiang = false

		showGeneralPanel(3)

		user.is_enter_jiuguan_wujiang = true
	elseif worldControl.stratagem[1].cd ~= nil and worldControl.stratagem[1].cd > 0 then
		return
	else
		arg_51_0:useTrick(1)
	end

	arg_51_0.ui:exit()
end

function var_0_0.click_plan2(arg_52_0)
	local var_52_0 = true

	if worldControl.stratagem ~= nil and worldControl.stratagem[2] ~= nil then
		var_52_0 = false
	end

	if var_52_0 == true then
		require("lua/layer/general/ui")

		user.is_enter_jiuguan_wujiang = false

		showGeneralPanel(3)

		user.is_enter_jiuguan_wujiang = true
	elseif worldControl.stratagem[2].cd ~= nil and worldControl.stratagem[2].cd > 0 then
		return
	else
		arg_52_0:useTrick(2)
	end

	arg_52_0.ui:exit()
end

function var_0_0.useTrick(arg_53_0, arg_53_1)
	local var_53_0 = worldControl.stratagem[arg_53_1]

	if var_53_0.stratagemId == nil and var_53_0.stratagemList and var_53_0.stratagemList[1] then
		var_53_0.stratagemId = var_53_0.stratagemList[1].stratagemId
		var_53_0.trickName = var_53_0.stratagemList[1].trickName
		var_53_0.lv = var_53_0.stratagemList[1].lv
	end

	local var_53_1 = arg_53_0.ui.cityId

	local function var_53_2(arg_54_0)
		if arg_54_0.action.data.isCanUse == false then
			local function var_54_0(arg_55_0)
				local var_55_0 = arg_55_0.action.data.msg

				smgr.showTipText(var_55_0)
			end

			cmgr.sendRequest(var_54_0, actions.cilvilUseTrick, var_53_0.cilvilId, arg_53_0.ui.cityId, var_53_0.stratagemId, 0)
		else
			local function var_54_1(arg_56_0)
				worldControl.stratagem[arg_53_1].cd = arg_56_0.action.data.cd

				local var_56_0 = arg_56_0.action.data.type
				local var_56_1 = arg_56_0.action.data.forceSum

				log.info("还原cityId")

				arg_53_0.ui.cityId = var_53_1

				arg_53_0:action_fly(var_56_0, var_56_1)
				arg_53_0:action_playAnimation(var_56_0)
			end

			local var_54_2 = language.get(200409, var_53_0.trickName, var_53_0.lv)

			messageBox.confirm(var_54_2, function()
				cmgr.sendRequest(var_54_1, actions.cilvilUseTrick, var_53_0.cilvilId, var_53_1, var_53_0.stratagemId, 0)
			end, language.get(10001))
		end
	end

	cmgr.sendRequest(var_53_2, actions.cilvilUseTrick, var_53_0.cilvilId, var_53_1, var_53_0.stratagemId, 1)
end

function var_0_0.action_fly(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_2 == nil then
		local var_58_0 = CCSprite:create("res/ui/world/operateIcon/city_imp_" .. arg_58_1 .. ".png")
		local var_58_1 = ccp(visibleSize.width / 2, visibleSize.height / 2 - 30)

		smgr.showTipFloatYSprite(var_58_0, 60, var_58_1, nil, 1, 1)
	else
		local var_58_2 = CCSprite:create("res/ui/world/operateIcon/city_imp_" .. arg_58_1 .. ".png")
		local var_58_3 = CCLabelAtlas:create(tostring(arg_58_2), "res/ui/world/operateIcon/city_imp_numb_gre.png", 20, 38, 48)

		var_58_3:setAnchorPoint(ccp(0.5, 0.5))

		local var_58_4 = createRichNode({
			var_58_2,
			var_58_3
		})
		local var_58_5 = var_58_2:getContentSize().width
		local var_58_6 = var_58_3:getContentSize().width
		local var_58_7 = ccp(visibleSize.width / 2 - (var_58_5 + var_58_6) / 2, visibleSize.height / 2 - 30)

		smgr.showTipFloatYSprite(var_58_4, 60, var_58_7, nil, 1, 1)
	end
end

function var_0_0.action_playAnimation(arg_59_0, arg_59_1)
	local var_59_0 = {
		huangbao = {
			format = "hb%04d.png",
			endIndex = 18,
			startIndex = 1,
			deltY = 25
		},
		huogong = {
			format = "hg%04d.png",
			endIndex = 15,
			startIndex = 1,
			deltY = 25
		},
		kongcheng = {
			format = "kc_%05d.png",
			endIndex = 31,
			startIndex = 1,
			deltY = 25
		},
		luoshi = {
			format = "ls%04d.png",
			endIndex = 44,
			startIndex = 1,
			deltY = 65
		},
		shadiling = {
			format = "sdl%04d.png",
			endIndex = 34,
			startIndex = 1,
			deltY = 25
		},
		shuigong = {
			format = "sg_%05d.png",
			endIndex = 29,
			startIndex = 1,
			deltY = 25
		},
		xianjing = {
			format = "xj%04d.png",
			endIndex = 30,
			startIndex = 1,
			deltY = 25
		},
		gongshi = {
			format = "gs%04d.png",
			endIndex = 35,
			startIndex = 1,
			deltY = 25
		},
		pohuai = {
			format = "ph%04d.png",
			endIndex = 10,
			startIndex = 1,
			deltY = 25
		}
	}

	if var_59_0[arg_59_1] ~= nil then
		local var_59_1 = var_59_0[arg_59_1]
		local var_59_2 = string.format("res/ui/world/operateIcon/animation/%s.plist", arg_59_1)

		rmgr.loadResource(var_59_2)

		local var_59_3 = CCArray:create()

		for iter_59_0 = var_59_1.startIndex, var_59_1.endIndex do
			local var_59_4 = CCSprite:createWithSpriteFrameName(string.format(var_59_1.format, iter_59_0))

			var_59_3:addObject(var_59_4:displayFrame())
		end

		local var_59_5 = smgr.getLayer("worldCamera")
		local var_59_6, var_59_7 = var_59_5.cityTable["world_building_" .. arg_59_0.ui.cityId].sprite:getPosition()
		local var_59_8 = CCSprite:create()

		local function var_59_9(arg_60_0)
			arg_60_0:setVisible(false)
			var_59_5.worldLayer:removeChild(arg_60_0, true)
		end

		local var_59_10 = CCAnimation:createWithSpriteFrames(var_59_3, 0.1)
		local var_59_11 = CCAnimate:create(var_59_10)
		local var_59_12 = CCCallFuncN:create(var_59_9)
		local var_59_13 = CCArray:create()

		var_59_13:addObject(var_59_11)
		var_59_13:addObject(var_59_12)

		local var_59_14 = CCSequence:create(var_59_13)
		local var_59_15 = CCSprite:create()

		var_59_15:setPosition(ccp(var_59_6, var_59_7 + var_59_1.deltY))
		var_59_15:runAction(var_59_14)
		var_59_5.worldLayer:addChild(var_59_15, 108)
		CCSpriteFrameCache:sharedSpriteFrameCache():removeSpriteFramesFromFile(var_59_2)
	end
end

function var_0_0.convene(arg_61_0)
	if smgr.currentSceneTag == SCENE_JUBEN then
		local var_61_0 = arg_61_0.ui.gidTable or {}

		for iter_61_0, iter_61_1 in pairs(var_61_0) do
			arg_61_0:jubenConveneGeneral(iter_61_1.info.id)
		end
	elseif smgr.currentSceneTag == SCENE_KFWORLD or smgr.currentSceneTag == SCENE_KFYZ_WORLD or smgr.currentSceneTag == SCENE_KFEXPEDITION then
		local function var_61_1(arg_62_0)
			eventManager.dispatchEvent("handlerCallGeneralAction", arg_62_0)
			arg_61_0.ui:exit()
		end

		local var_61_2 = ""
		local var_61_3 = true
		local var_61_4 = arg_61_0.ui.gidTable or {}

		for iter_61_2, iter_61_3 in pairs(var_61_4) do
			if var_61_3 then
				var_61_3 = false
			else
				var_61_2 = var_61_2 .. "#"
			end

			var_61_2 = var_61_2 .. iter_61_3.info.id
		end

		kfcmgr.sendRequest(var_61_1, actions.callGeneral, var_61_2, arg_61_0.ui.cityId)
		amgr.playEffect(enumAudioFile.wujiang_zunming)
	else
		local function var_61_5(arg_63_0)
			arg_61_0.ui:exit()
		end

		local var_61_6 = ""
		local var_61_7 = true
		local var_61_8 = arg_61_0.ui.gidTable or {}

		for iter_61_4, iter_61_5 in pairs(var_61_8) do
			if var_61_7 then
				var_61_7 = false
			else
				var_61_6 = var_61_6 .. "#"
			end

			var_61_6 = var_61_6 .. iter_61_5.info.gId
		end

		cmgr.sendRequest(var_61_5, actions.assembleBattleAll, var_61_6, arg_61_0.ui.cityId)
		amgr.playEffect(enumAudioFile.wujiang_zunming)
	end
end

function var_0_0.buildCastle(arg_64_0)
	local function var_64_0(arg_65_0)
		local var_65_0 = require("lua/layer/world/cityWindow2/BuildCastleLayer").new(arg_64_0.ui.cityId, arg_65_0.action.data.fortresses)
		local var_65_1 = smgr.getLayer("topLayer")

		var_65_1:removeAllChildrenWithCleanup(true)
		var_65_1:addChild(var_65_0)
		arg_64_0.ui:exit()
	end

	cmgr.sendRequest(var_64_0, actions.getCanBuildInfo)
end

function var_0_0.adviseCastle(arg_66_0)
	cmgr.sendRequest(nil, actions.advice)
end

function var_0_0.repairRoad(arg_67_0)
	if user.buildRoadTimes and user.buildRoadTimes > 0 then
		cmgr.sendRequest(function(arg_68_0)
			local var_68_0 = arg_68_0.action.data
			local var_68_1

			for iter_68_0, iter_68_1 in pairs(var_68_0.cities) do
				if iter_68_1.start == arg_67_0.ui.cityId then
					var_68_1 = iter_68_1

					break
				end
			end

			if var_68_1 then
				local var_68_2 = ""

				if var_68_1.buildExist == 3 then
					var_68_2 = language.get(216311)
				elseif var_68_1.buildExist == 0 then
					if not var_68_1.canBuild then
						var_68_2 = language.get(216308)
					end
				else
					var_68_2 = language.get(216307)
				end

				if var_68_2 == "" then
					cmgr.sendRequest(function(arg_69_0)
						user.buildRoadTimes = arg_69_0.action.data.buildRoadTimes

						if var_0_0.panel then
							var_0_0.panel:removeFromParentAndCleanup(true)

							var_0_0.panel = nil
						end
					end, actions.buildRoad, arg_67_0.ui.cityId, 0)
					arg_67_0.ui:exit()
				else
					smgr.showTipText(var_68_2)
				end
			end
		end, actions.chooseBuildCity, 0)
	else
		smgr.showTipText(language.get(216316))
	end
end

function var_0_0.closeRoad(arg_70_0)
	if user.lockRoadTimes and user.lockRoadTimes > 0 then
		cmgr.sendRequest(function(arg_71_0)
			local var_71_0 = arg_71_0.action.data
			local var_71_1

			for iter_71_0, iter_71_1 in pairs(var_71_0.cities) do
				if iter_71_1.cityId == arg_70_0.ui.cityId then
					var_71_1 = iter_71_1

					break
				end
			end

			if var_71_1 then
				local var_71_2 = ""

				if var_71_1.buildExist == 3 then
					var_71_2 = language.get(216312)
				elseif var_71_1.buildExist == 0 then
					if not var_71_1.canBuild then
						var_71_2 = language.get(216309)
					end
				elseif var_71_1.buildExist == 4 then
					if not var_71_1.canBuild then
						var_71_2 = language.get(216315)
					end
				else
					var_71_2 = language.get(216307)
				end

				if var_71_2 == "" then
					cmgr.sendRequest(function(arg_72_0)
						user.lockRoadTimes = arg_72_0.action.data.lockRoadTimes

						if var_0_0.panel then
							var_0_0.panel:removeFromParentAndCleanup(true)

							var_0_0.panel = nil
						end
					end, actions.buildRoad, arg_70_0.ui.cityId, 1)
					arg_70_0.ui:exit()
				else
					smgr.showTipText(var_71_2)
				end
			end
		end, actions.chooseBuildCity, 1)
	else
		smgr.showTipText(language.get(216317))
	end
end

function var_0_0.repairRoadFind(arg_73_0)
	cmgr.sendRequest(function(arg_74_0)
		arg_73_0:buildRoadHelp(arg_74_0.action.data, 0)
		arg_73_0.ui:exit()
	end, actions.chooseBuildCity, 0)
end

function var_0_0.closeRoadFind(arg_75_0)
	cmgr.sendRequest(function(arg_76_0)
		arg_75_0:buildRoadHelp(arg_76_0.action.data, 1)
		arg_75_0.ui:exit()
	end, actions.chooseBuildCity, 1)
end

function var_0_0.buildRoadHelp(arg_77_0, arg_77_1, arg_77_2)
	if var_0_0.panel then
		var_0_0.panel:removeFromParentAndCleanup(true)

		var_0_0.panel = nil
	end

	local var_77_0 = smgr.getLayer("topLayer")

	var_0_0.panel = CCScale9Sprite:createWithSpriteFrameName("common_tip_frame_small.png")

	var_0_0.panel:setContentSize(CCSizeMake(200, 200))
	var_0_0.panel:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 200))
	var_77_0:addChild(var_0_0.panel)
	swallowTouch(var_0_0.panel)

	local var_77_1 = arg_77_2 == 0 and language.get(216305, user.buildRoadTimes or 0) or language.get(216306, user.lockRoadTimes or 0)
	local var_77_2 = CCStrokeLabelTTF:create(var_77_1, "Thonburi", 24)

	var_77_2:setPosition(ccp(100, 180))
	var_0_0.panel:addChild(var_77_2)

	for iter_77_0, iter_77_1 in ipairs(arg_77_1.cities) do
		iter_77_1.cityId = iter_77_1.cityId or iter_77_1.start
		iter_77_1.cityName = iter_77_1.cityName or iter_77_1.startName

		local var_77_3 = CCControlButton:create(iter_77_1.cityName, "Thonburi", 20)
		local var_77_4 = tool.hexToRgb("#00ff00")

		var_77_3:setTitleColorForState(var_77_4, CCControlStateNormal)
		var_77_3:setTitleColorForState(var_77_4, CCControlStateHighlighted)
		var_77_3:setTitleColorForState(var_77_4, CCControlStateSelected)
		var_77_3:setPosition(ccp(100, 200 - iter_77_0 * 50))
		var_0_0.panel:addChild(var_77_3)

		local var_77_5 = ""

		if arg_77_2 == 0 then
			if iter_77_1.buildExist == 3 then
				var_77_5 = language.get(216311)
			elseif iter_77_1.buildExist == 0 then
				if not iter_77_1.canBuild then
					var_77_5 = language.get(216308)
				end
			else
				var_77_5 = language.get(216307)
			end
		elseif iter_77_1.buildExist == 3 then
			var_77_5 = language.get(216312)
		elseif iter_77_1.buildExist == 0 then
			if not iter_77_1.canBuild then
				var_77_5 = language.get(216309)
			end
		elseif iter_77_1.buildExist == 4 then
			if not iter_77_1.canBuild then
				var_77_5 = language.get(216315)
			end
		else
			var_77_5 = language.get(216307)
		end

		local var_77_6 = CCStrokeLabelTTF:create(var_77_5, "Thonburi", 20)

		var_77_6:setPosition(ccp(100, 200 - iter_77_0 * 50 - 20))
		var_0_0.panel:addChild(var_77_6)
		var_77_3:addHandleOfControlEvent(function()
			loadingLayer.show(SCENE_WORLD, iter_77_1.cityId)
		end, CCControlEventTouchUpInside)
	end

	local var_77_7 = CCSprite:createWithSpriteFrameName("btn_close_a.png")
	local var_77_8 = CCSprite:createWithSpriteFrameName("btn_close_c.png")
	local var_77_9 = CCControlButton:create(CCScale9Sprite:createWithSpriteFrame(var_77_7:displayFrame()))

	var_77_9:setBackgroundSpriteForState(CCScale9Sprite:createWithSpriteFrame(var_77_8:displayFrame()), CCControlStateHighlighted)
	var_77_9:setPreferredSize(var_77_7:getContentSize())
	var_77_9:setPosition(ccp(185, 185))
	var_77_9:setScale(1)
	var_77_9:setZoomOnTouchDown(false)
	var_0_0.panel:addChild(var_77_9)
	var_77_9:addHandleOfControlEvent(function()
		if var_0_0.panel then
			var_0_0.panel:removeFromParentAndCleanup(true)

			var_0_0.panel = nil
		end
	end, CCControlEventTouchUpInside)
end

function var_0_0.onEnter(arg_80_0)
	function arg_80_0.onTapFuncEntity(arg_81_0, arg_81_1)
		arg_80_0:onTap(arg_81_0, arg_81_1)
	end

	function arg_80_0.clearFuncEntity()
		arg_80_0.ui:exit(true)
	end

	function arg_80_0.isTouchOnEntity(arg_83_0, arg_83_1)
		return arg_80_0:isTouchOn(arg_83_0, arg_83_1)
	end

	function arg_80_0.thisOpenEntity()
		return true
	end

	eventManager.registerEvent("tapOnScreen", arg_80_0.onTapFuncEntity)
	eventManager.registerEvent("worldLayerOnExit", arg_80_0.clearFuncEntity)
	eventManager.registerEvent("cityWindowIsTouchOn", arg_80_0.isTouchOnEntity)
	eventManager.registerEvent("cityWindowIsOpen", arg_80_0.thisOpenEntity)
end

function var_0_0.onExit(arg_85_0)
	eventManager.unregisterEvent("tapOnScreen", arg_85_0.onTapFuncEntity)
	eventManager.unregisterEvent("worldLayerOnExit", arg_85_0.clearFuncEntity)
	eventManager.unregisterEvent("cityWindowIsTouchOn", arg_85_0.isTouchOnEntity)
	eventManager.unregisterEvent("cityWindowIsOpen", arg_85_0.thisOpenEntity)
end

return var_0_0
