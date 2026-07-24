require("lua/game/battle/uiConstant")
require("lua/game/battle/battleConstants")
require("lua/game/battle/control")
require("lua/game/battle/uidata")

function createBattleScene(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}
	arg_1_1.prepare = arg_1_1.prepare or false
	arg_1_1.target = arg_1_1.target
	arg_1_1.terrain = arg_1_1.terrain
	arg_1_1.watch = arg_1_1.watch or false
	arg_1_1.battleData = arg_1_1.battleData or {}
	arg_1_1.cityId = arg_1_1.cityId
	arg_1_1.state = arg_1_1.state
	arg_1_1.info = arg_1_1.info

	rmgr.loadResource("res/ui/battle/battle.plist")
	rmgr.loadResource("res/ui/battle/battle1.plist")
	rmgr.loadResource("res/army/army.plist")
	rmgr.loadResource("res/ui/battle/specialPhantom/specialPhantom.plist")

	local var_1_0 = createBattleControl()
	local var_1_1 = createBaseLayer()

	var_1_0.layerTabel.rootLayer = var_1_1

	local var_1_2 = createBaseLayer()

	var_1_0.layerTabel.backgroundLayer = var_1_2

	var_1_1:addChild(var_1_2)

	local var_1_3 = createBaseLayer()

	var_1_0.layerTabel.towerLayer1 = var_1_3

	var_1_1:addChild(var_1_3)

	local var_1_4 = createBaseLayer()

	var_1_0.layerTabel.bombLayer1 = var_1_4

	var_1_1:addChild(var_1_4)

	local var_1_5 = createFightLayer(var_1_0)

	var_1_0.layerTabel.fightLayer = var_1_5

	var_1_1:addChild(var_1_5)

	local var_1_6 = createBaseLayer()

	var_1_0.layerTabel.towerLayer2 = var_1_6

	var_1_1:addChild(var_1_6)

	local var_1_7 = createBaseLayer()

	var_1_0.layerTabel.bombLayer2 = var_1_7

	var_1_1:addChild(var_1_7)

	local var_1_8 = createBaseLayer()

	var_1_0.layerTabel.flagLayer = var_1_8

	var_1_1:addChild(var_1_8)

	local var_1_9 = createBaseLayer()

	var_1_0.layerTabel.effectLayer = var_1_9

	var_1_1:addChild(var_1_9)

	var_1_0.layerTabel.uiLayer = smgr.getLayer("uiLayer")

	local var_1_10 = createBaseLayer()

	var_1_0.layerTabel.prepareLayer = var_1_10

	var_1_1:addChild(var_1_10)

	local function var_1_11()
		if arg_1_0 == battleType.BATTLE_DEMO then
			return
		end

		local var_2_0 = {}

		if arg_1_0 == battleType.BATTLE_KFZB then
			var_2_0.sp1 = CCSprite:create("res/ui/kfzb/kfzbs_dzb.png")
			var_2_0.sp2 = CCSprite:create("res/ui/kfzb/kfzbs_dzb1.png")
		else
			var_2_0.sp1 = CCSprite:createWithSpriteFrameName("btn_fight_back_a.png")
			var_2_0.sp2 = CCSprite:createWithSpriteFrameName("btn_fight_back_c.png")
		end

		local var_2_1 = CCMenuItemSprite:create(var_2_0.sp1, var_2_0.sp2)

		var_2_1:registerScriptTapHandler(var_1_0.returnToLastScene)
		var_2_1:setPosition(ccp(visibleSize.width - var_2_1:getContentSize().width / 2 - 10, visibleSize.height - var_2_1:getContentSize().height / 2 - 10))

		local var_2_2 = CCMenu:create()

		var_2_2:setPosition(ccp(0, 0))
		var_2_2:addChild(var_2_1)
		var_1_0.layerTabel.uiLayer:addChild(var_2_2, 0, 1000)
	end

	function var_1_1.onEnter(arg_3_0)
		if arg_1_0 == battleType.BATTLE_KFWD then
			eventManager.registerEvent(battleEvent.armyUpdate, var_1_0.onEventDead)
			kfcmgr.registerResponseHandler(actions.kfwdRtPush, var_1_0.handlerPushKfwdRtInfo)
		elseif arg_1_0 == battleType.BATTLE_KFGZ then
			kfcmgr.registerResponseHandler(actions.kfgzPushGroupTeam, var_1_0.handlePushTeam)
			kfcmgr.registerResponseHandler(actions.pushKfworld, var_1_0.handlerPushKfWorld)
			eventManager.registerEvent("kfworldBattleOver", var_1_0.returnToKfgz)

			function arg_3_0.handlerPushKfyzIndivChangeActionRef(arg_4_0)
				local var_4_0 = arg_4_0.data.indivchange

				if var_4_0 and var_4_0.isFinish and not var_4_0.isReward then
					local var_4_1 = CCSprite:create("res/ui/kfyz/kfyz_word_rwwc.png")

					var_4_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 + 50))
					smgr.showTipSpriteText(var_4_1)
				end
			end

			kfcmgr.registerResponseHandler(actions.pushKfyzIndivChange, arg_3_0.handlerPushKfyzIndivChangeActionRef)

			function arg_3_0.handlerPushKfyzMineChangeActionRef(arg_5_0)
				local var_5_0 = arg_5_0.data.minChange

				if not var_5_0 then
					return
				end

				if var_5_0.win and var_5_0.yzOver and not user.isInSd then
					smgr.changeScene(SCENE_KFYZ_WORLD, user.kfyzState)
					require("lua/layer/nation/ui")
					nationUI.show(10)

					local var_5_1 = user.invastType == 1
					local var_5_2
					local var_5_3 = var_5_1 and (var_5_0.win == -1 and "kfyz_word_yzcg.png" or "kfyz_word_yzsb.png") or var_5_0.win == -1 and "kfyz_word_fscg.png" or "kfyz_word_fssb.png"
					local var_5_4 = CCSprite:create("res/ui/world/cityCombo/lxzc_bg4.png")

					var_5_4:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))

					local var_5_5 = CCSprite:create("res/ui/kfyz/result/" .. var_5_3)

					var_5_5:setPosition(ccp(430, 63))
					var_5_4:addChild(var_5_5)
					smgr.showTipSpriteText(var_5_4, nil, 1)
				end
			end

			function arg_3_0.handlerPushArena(arg_6_0)
				local var_6_0 = arg_6_0.data or arg_6_0.action.data

				if var_6_0.arena then
					eventManager.dispatchEvent("pushArena", var_6_0.arena)
					eventManager.dispatchEvent("PushJiaoZhen", var_6_0.arena.champion)
					eventManager.dispatchEvent("KfPushJiaoZhenIcon", var_6_0.arena)
				end
			end

			function arg_3_0.handlerPushCorpsRef(arg_7_0)
				local var_7_0 = arg_7_0.data.state

				if var_7_0 and arg_1_0(var_7_0) ~= "number" then
					if var_7_0.start ~= nil then
						local var_7_1 = (var_7_0.start == user.player.forceId or var_7_0.start == user.player.kfgzForceId) and "jt_word_wgjtzscz.png" or "jt_word_djjtqslx.png"
						local var_7_2 = CCSprite:create("res/ui/saotao/stfx_long_bg.png")
						local var_7_3 = CCSprite:create("res/ui/corps/" .. var_7_1)

						var_7_3:setPosition(ccp(454, 85))
						var_7_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
						var_7_2:addChild(var_7_3)
						smgr.showTipSpriteText(var_7_2)
					end

					if var_7_0.transfer == true then
						local var_7_4 = smgr.getLayer("topLayer")

						require("lua/layer/corps/MessageBox").new(var_7_4, var_7_0, true)
					end
				end
			end

			kfcmgr.registerResponseHandler(actions.pushKfyzMineChange, arg_3_0.handlerPushKfyzMineChangeActionRef)
			kfcmgr.registerResponseHandler(actions.pushKfArena, arg_3_0.handlerPushArena)
			kfcmgr.registerResponseHandler(actions.pushCorps, arg_3_0.handlerPushCorpsRef)
		elseif arg_1_0 == battleType.BATTLE_KFZB then
			eventManager.registerEvent("kfzbWatchBattleWait", var_1_0.showKfzbWaitLb)
		else
			cmgr.registerResponseHandler(actions.teamPush, var_1_0.handlePushTeam)
			eventManager.registerEvent(battleEvent.huizhanForceUpdate, var_1_0.changeHuizhanForceNum)
		end

		function var_1_0.getBattleInfoRef()
			return {
				type = arg_1_0,
				cityId = var_1_0.cityId
			}
		end

		eventManager.registerEvent("getBattleInfo", var_1_0.getBattleInfoRef)
		eventManager.registerEvent("deterUpdateChange", var_1_0.deterUpdateChange)
		eventManager.registerEvent("pushArena", var_1_0.onPushArena)
		kfcmgr.registerResponseHandler(actions.kfzbPush, var_1_0.handlerKfzbPush)
		eventManager.registerEvent("cityLockInfo", var_1_0.cityLockInfoUpdate)

		function arg_3_0.handlerFightBackRef(arg_9_0)
			if arg_9_0.data.all then
				user.isFightBackEffect = true

				smgr.changeScene(SCENE_KFYZ_WORLD)
			end
		end

		kfcmgr.registerResponseHandler(actions.pushFightBack, arg_3_0.handlerFightBackRef)
	end

	function var_1_1.onExit(arg_10_0)
		if arg_1_0 == battleType.BATTLE_KFWD then
			eventManager.unregisterEvent(battleEvent.armyUpdate, var_1_0.onEventDead)
			kfcmgr.unregisterResponseHandler(actions.kfwdRtPush, var_1_0.handlerPushKfwdRtInfo)
		elseif arg_1_0 == battleType.BATTLE_KFGZ then
			kfcmgr.unregisterResponseHandler(actions.kfgzPushGroupTeam, var_1_0.handlePushTeam)
			kfcmgr.unregisterResponseHandler(actions.pushKfworld, var_1_0.handlerPushKfWorld)
			eventManager.unregisterEvent("kfworldBattleOver", var_1_0.returnToKfgz)
			kfcmgr.unregisterResponseHandler(actions.pushKfyzIndivChange, arg_10_0.handlerPushKfyzIndivChangeActionRef)
			kfcmgr.unregisterResponseHandler(actions.pushKfyzMineChange, arg_10_0.handlerPushKfyzMineChangeActionRef)
			kfcmgr.unregisterResponseHandler(actions.pushKfArena, arg_10_0.handlerPushArena)
			kfcmgr.unregisterResponseHandler(actions.pushCorps, arg_10_0.handlerPushCorpsRef)
		elseif arg_1_0 == battleType.BATTLE_KFZB then
			eventManager.unregisterEvent("kfzbWatchBattleWait", var_1_0.showKfzbWaitLb)
		else
			cmgr.unregisterResponseHandler(actions.teamPush, var_1_0.handlePushTeam)
			eventManager.unregisterEvent(battleEvent.huizhanForceUpdate, var_1_0.changeHuizhanForceNum)
		end

		eventManager.unregisterEvent("getBattleInfo", var_1_0.getBattleInfoRef)
		eventManager.unregisterEvent("deterUpdateChange", var_1_0.deterUpdateChange)
		eventManager.unregisterEvent("pushArena", var_1_0.onPushArena)
		kfcmgr.unregisterResponseHandler(actions.kfzbPush, var_1_0.handlerKfzbPush)
		eventManager.unregisterEvent("cityLockInfo", var_1_0.cityLockInfoUpdate)
		kfcmgr.unregisterResponseHandler(actions.pushFightBack, arg_10_0.handlerFightBackRef)
	end

	var_1_11()

	var_1_0.battleType = arg_1_0

	if arg_1_0 == battleType.BATTLE_DEMO then
		var_1_0.watchDemo(arg_1_1)
	elseif arg_1_0 == battleType.BATTLE_KFWD then
		rmgr.loadResource("res/ui/battle/kfwd/kfwd.plist")
		var_1_0.watchKfwd(arg_1_1.state, arg_1_1.info)
	elseif arg_1_0 == battleType.BATTLE_KFGZ or arg_1_0 == battleType.BATTLE_KFGZ_SOLO or arg_1_0 == battleType.BATTLE_KFYZ_DONGYING_SOLO or arg_1_0 == battleType.BATTLE_KFYZ_JIAOZHEN then
		var_1_0.watchKfgz(arg_1_1.teamId)
	elseif arg_1_0 == battleType.BATTLE_KFZB then
		rmgr.loadResource("res/ui/battle/kfwd/kfwd.plist")
		log.info("battleScene.lua,跨服争霸")
		var_1_0.watchKfzb(arg_1_1.state, arg_1_1.info)
	elseif arg_1_0 == battleType.BATTLE_JIAOZHEN then
		if arg_1_1.yinzhanData then
			var_1_0.handlerBattlePrepare(arg_1_1.yinzhanData)
		else
			var_1_0.battleId = arg_1_1.battleId

			var_1_0.watch()
		end
	elseif arg_1_0 == battleType.BATTLE_KFYZ_JIAOZHEN then
		var_1_0.watchKfgz(arg_1_1.teamId)
	elseif arg_1_1.prepare then
		var_1_0.prepare(arg_1_1.target, arg_1_1.terrain, arg_1_1.generalId)
	elseif arg_1_1.watch then
		var_1_0.battleId = arg_1_1.battleId

		var_1_0.watchBattle(arg_1_1.battleData)
	else
		var_1_0.battleId = arg_1_1.battleId

		if arg_1_1.cityId then
			var_1_0.cityId = arg_1_1.cityId
		end

		var_1_0.watch()
	end

	return var_1_1
end
