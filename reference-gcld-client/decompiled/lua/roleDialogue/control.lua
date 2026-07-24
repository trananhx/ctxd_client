roleDialogue.control = {}
roleDialogue.control.isfubenFailed = false

function roleDialogue.control.handler_push_player(arg_1_0)
	if isExpUpdate(arg_1_0) then
		return
	end

	if arg_1_0.action.state == 3 then
		local var_1_0 = arg_1_0.action.data
		local var_1_1

		if var_1_0.update ~= nil then
			if var_1_0.update.openTrade == 1 then
				var_1_1 = 1506
			elseif var_1_0.update.hasDiscountIcon then
				if var_1_0.update.goodsType == 1 then
					var_1_1 = 1508
				end

				if var_1_0.update.goodsType == 2 then
					var_1_1 = 1509
				end
			elseif var_1_0.update.openGem == true then
				var_1_1 = 240
			elseif var_1_0.update.fEXiaPei == true then
				var_1_1 = 350
			elseif var_1_0.update.fEGuanDu == true then
				var_1_1 = 700
			elseif var_1_0.update.fEFreeCons == true then
				var_1_1 = 710
			elseif var_1_0.update.fEFreeCons == true then
				var_1_1 = 720
			elseif var_1_0.update.fEChangBanPo == true then
				var_1_1 = 830
			elseif var_1_0.update.fEJiangDong == true then
				var_1_1 = 850
			elseif var_1_0.update.fEManHuang == true then
				var_1_1 = 870
			elseif var_1_0.update.fEfoodLimit == true then
				var_1_1 = 500
			elseif var_1_0.update.fETroopLimit == true then
				var_1_1 = 510
			elseif var_1_0.update.fETroopLimit30000 == true then
				var_1_1 = 511
			elseif var_1_0.update.collectId == 1 then
				var_1_1 = 610
			elseif var_1_0.update.collectId == 2 then
				var_1_1 = 690
			elseif var_1_0.update.collectId == 3 then
				var_1_1 = 640
			elseif var_1_0.update.newConstruction == 1 then
				var_1_1 = 90
			elseif var_1_0.update.newConstruction == 2 then
				var_1_1 = 100
			elseif var_1_0.update.newConstruction == 3 then
				var_1_1 = 110
			elseif var_1_0.update.newConstruction == 4 then
				var_1_1 = 120
			elseif var_1_0.update.fEWood == true then
				var_1_1 = 160
			elseif var_1_0.update.fETroop == true then
				var_1_1 = 210
			elseif var_1_0.update.fEBattle == true then
				var_1_1 = 1
			elseif var_1_0.update.gainGeneral == true then
				if var_1_0.update.isRecruit == 1 and var_1_0.update.dropPic == "diaochan" then
					var_1_1 = 340
				end
			elseif var_1_0.update.fEOpenSilk then
				var_1_1 = 1546
			elseif var_1_0.update.newFeat then
				var_1_1 = 1553
			end
		end

		if var_1_1 ~= nil then
			roleDialogue.control.loadSpeak(var_1_1)
		end
	end
end

function roleDialogue.control.loadSpeak(arg_2_0)
	if dataCache.isNextDataNeedCache == true or dataCache.isDelayDispaly == true then
		if roleDialogue.constant.dialogueFrame(arg_2_0) ~= nil then
			dataCache.push(dataCache_type_xiaoqian_dialogue, arg_2_0)
		else
			log.info("收到小倩对话框，该index找不到对应的文本 ", arg_2_0)
		end

		return
	end

	log.info("收到小倩对话框，索引号为 ", arg_2_0)

	local var_2_0 = roleDialogue.constant.dialogueFrame(arg_2_0)

	if var_2_0 ~= nil then
		guide.ui.setVisible(false)
		log.info("内容: 第一句: ", var_2_0.step[1].desc)

		roleDialogue.control.isfubenFailed = false
		roleDialogue.control.dialogueData = var_2_0
		roleDialogue.control.index = arg_2_0
		roleDialogue.control.step = 1

		roleDialogue.control.currentSpeak()
		roleDialogue.ui.setVisible(true)

		if arg_2_0 == 1 or arg_2_0 == 330 or arg_2_0 == 230 then
			guide.ui.setVisible(false)
		end

		if roleDialogue.control.dialogueData.open == "maincitybtn" then
			menuControl.setVisible("zhucheng", true)
		elseif roleDialogue.control.dialogueData.open == "fubenbtn" then
			menuControl.setVisible("fuben", true)
		elseif roleDialogue.control.dialogueData.open == "worldbtn" then
			menuControl.setVisible("shijie", true)
		elseif roleDialogue.control.dialogueData.open == "yearBeast17" then
			activityUI.show(activityConstant.TYPES.ACTIVITY_YEAR_BEAST17.tag)
		end

		dataCache.isNextDataNeedCache = true
	end
end

function roleDialogue.control.quick_loadSpeak(arg_3_0)
	roleDialogue.control.isfubenFailed = true

	local var_3_0 = roleDialogue.constant.dialogueFrame(arg_3_0)

	if var_3_0 ~= nil then
		log.info("内容: 第一句: ", var_3_0.step[1].desc)

		roleDialogue.control.isfubenFailed = false
		roleDialogue.control.dialogueData = var_3_0
		roleDialogue.control.index = arg_3_0
		roleDialogue.control.step = 1

		roleDialogue.control.currentSpeak()
		roleDialogue.ui.setVisible(true)
	end
end

function roleDialogue.control.nextSpeak()
	roleDialogue.control.step = roleDialogue.control.step + 1

	if roleDialogue.control.step > roleDialogue.control.dialogueData.totalStep then
		roleDialogue.ui.setVisible(false)

		local var_4_0 = roleDialogue.control.dialogueData.open

		if var_4_0 ~= nil then
			if roleDialogue.control.index == 130 then
				eventManager.dispatchEvent("roleDialogue_dialogue_130")
			elseif var_4_0 == "createRole" then
				local var_4_1 = createCharacter()

				smgr.getLayer("topLayer"):addChild(var_4_1, 1000)
			elseif var_4_0 == "openincense" then
				menuUI.ui.newFunc_Effect(1)

				dataCache.isNeedClick_mainTask = false
			elseif var_4_0 == "openShangdian" then
				menuUI.ui.newFunc_Effect(4)

				dataCache.isNeedClick_mainTask = false
			elseif var_4_0 == "openkeji" then
				menuUI.ui.newFunc_Effect(5)

				dataCache.isNeedClick_mainTask = false
			elseif var_4_0 == "openPaihang" then
				menuUI.ui.newFunc_Effect(6)

				dataCache.isNeedClick_mainTask = false
			elseif var_4_0 == "fubenbtn" then
				guide.constant.area[2] = true

				menuControl.addGuide()
			elseif var_4_0 == "getGeneral1" then
				dataCache.isNeedClick_mainTask = false

				require("lua/layer/gainGeneral/ui")
				gainGeneral.ui.show(1)
			elseif var_4_0 == "getGeneral2" then
				dataCache.isNeedClick_mainTask = false

				require("lua/layer/gainGeneral/ui")
				gainGeneral.ui.show(2)
			elseif var_4_0 == "worldbtn" then
				dataCache.isNeedClick_mainTask = false

				taskUI.showTaskGuide()
			elseif var_4_0 == "openGuide" then
				dataCache.isNeedClick_mainTask = false

				taskUI.showTaskGuide()
			elseif var_4_0 == "openWeapon" then
				dataCache.isNeedClick_mainTask = false

				menuUI.ui.newFunc_Effect(7)
			elseif var_4_0 == "openComment" then
				-- block empty
			elseif var_4_0 == "openDayTrain" then
				require("lua/layer/dayTrain/ui")
				dayTrain.ui.show()
			elseif var_4_0 == "openJinNang" then
				require("lua/layer/threeColorBag/ui")
				threeColorBag.ui.show()
			elseif var_4_0 == "weichengBegin" then
				require("lua/layer/task/ui")
				taskUI.showWeichengAction()
			elseif var_4_0 == "gotoWorld" then
				log.info("围城 world！")
				loadingLayer.show(SCENE_WORLD)
			elseif var_4_0 == "showLeague" then
				log.info("结盟动画")
				require("lua/layer/world/ShowLeague")
				showLeague.showLeagueAction()
			elseif var_4_0 == "gotoBetray" then
				log.info("goto阵营转换")
				activityUI.show(activityConstant.TYPES.ACTIVITY_BETRAY.tag)
			elseif var_4_0 == "showBetrayReward" then
				require("lua/layer/betrayResult/ui")
				betrayResultUI.show(2)
			elseif var_4_0 == "getBetrayReward" then
				log.info("领取阵营转换奖励")
				eventManager.dispatchEvent("getBetrayReward")
			elseif var_4_0 == "showRenameDialog" then
				log.info("阵营转换奖励改名")
				eventManager.dispatchEvent("showRenameDialog")
			elseif var_4_0 == "showKingNotice" then
				log.info("国王公告提示")
			elseif var_4_0 == "gotoManzu" then
				log.info("石料部队_蛮族城")
				eventManager.dispatchEvent("moveToCity", worldConstant.MANZU_CITY[user.player.forceId], false)
			elseif var_4_0 == "gotoXiangYang" then
				log.info("石料部队_襄阳")
				eventManager.dispatchEvent("moveToCity", 105)
			elseif var_4_0 == "kingNotice" then
				log.info("成为国王")
				nationUI.show(1)
			elseif var_4_0 == "gotoTavern" then
				require("lua/layer/general/ui")

				user.is_enter_jiuguan_wujiang = true

				showGeneralPanel(3)
			elseif var_4_0 == "ganning1" then
				log.info("真甘宁step1")

				local var_4_2 = require("lua/layer/gainGeneral/zhenGanning").new(1)

				smgr.getLayer("topLayer"):addChild(var_4_2, 10001)
			elseif var_4_0 == "ganning2" then
				log.info("真甘宁step2")

				local var_4_3 = require("lua/layer/gainGeneral/zhenGanning").new(2)

				smgr.getLayer("topLayer"):addChild(var_4_3, 10001)
			elseif var_4_0 == "xiahoudun1" then
				log.info("真夏侯惇step1")

				local var_4_4 = require("lua/layer/gainGeneral/zhenXiaHouDun").new(1)

				smgr.getLayer("topLayer"):addChild(var_4_4, 10001)
			elseif var_4_0 == "zhurong1" then
				log.info("真祝融step1")

				local var_4_5 = require("lua/layer/gainGeneral/zhenZhuRong").new(1)

				smgr.getLayer("topLayer"):addChild(var_4_5, 10001)
			elseif var_4_0 == "sevenCatch" then
				log.info("七擒孟获，蛮族说话")
				eventManager.dispatchEvent("sevenCatch")
			elseif var_4_0 == "zhaoLingLayer" then
				log.info("国战诏令")
				eventManager.dispatchEvent("zhaoLingLayer")
			elseif var_4_0 == "kfyz_att_start1" or var_4_0 == "kfyz_att_start2" or var_4_0 == "kfyz_def_start1" or var_4_0 == "kfyz_def_start2" or var_4_0 == "kfyz_dongying1" or var_4_0 == "kfyz_dongying2" or var_4_0 == "kfyz_dongying3" or var_4_0 == "kfyz_dongying4" or var_4_0 == "kfyz_dongying5" or var_4_0 == "kfyz_dongying6" or var_4_0 == "kfyz_korea1" or var_4_0 == "kfyz_korea2" or var_4_0 == "kfyz_korea3" or var_4_0 == "cbhs_zf" or var_4_0 == "cbhs_gy" or var_4_0 == "cbhs_zy" or var_4_0 == "showmuniu" or var_4_0 == "seasilk2_1" or var_4_0 == "seasilk2_2" or var_4_0 == "seasilk2_3" then
				eventManager.dispatchEvent(var_4_0)
			elseif var_4_0 == "kfyz_result" then
				require("lua/layer/nation/ui")
				nationUI.show(10)
			elseif var_4_0 == "lubanxincheng" then
				smgr.changeScene(SCENE_MAIN_CITY)
			elseif var_4_0 == "gotoDinner" then
				guide.forceMarkTrace = "panel:2:4"
				guide.forceMarkTraceDescription = language.get(490944)

				guide.control.forceGuideByMarkTrace("panel:2:4", language.get(490944))
			elseif var_4_0 == "silk_npc_move" or var_4_0 == "silk_btn_att" then
				eventManager.dispatchEvent(var_4_0)
			elseif var_4_0 == "silk_power_begin" then
				local var_4_6 = {
					123,
					19,
					207
				}

				eventManager.dispatchEvent("moveToCity", var_4_6[user.player.forceId], false)
			elseif var_4_0 == "silkMarket" then
				require("lua/layer/resource/ui")
				resourceUI.show(8)
			elseif var_4_0 == "silkRoad" then
				require("lua/layer/resource/ui")
				resourceUI.show(7)
			elseif var_4_0 == "blacksmith" then
				require("lua/layer/resource/ui")
				resourceUI.show(5)
			elseif var_4_0 == "nationTask" then
				require("lua/layer/nation/ui")
				nationUI.show(2)
			elseif var_4_0 == "toushicheDialogue" then
				require("lua/layer/weaponTab/ui")
				cmgr.sendRequest(nil, actions.donghua)
			elseif var_4_0 == "openGeneralSilkPanel" then
				require("lua/layer/general/generalSilkPanel")
				showGeneralSilkPanel()
			elseif var_4_0 == "downloadDetail" then
				notice.control.showDownloadDetailView()

				user.haveShowDownloadDetailView = true
			elseif var_4_0 == "changeName" then
				local var_4_7 = require("lua/layer/nation/nationTab/ChangeNationName").new()
				local var_4_8 = smgr.getLayer("topLayer")

				var_4_8:removeAllChildrenWithCleanup(true)
				var_4_8:addChild(var_4_7)
			elseif var_4_0 == "gotoCity" then
				smgr.changeScene(SCENE_MAIN_CITY)
			elseif var_4_0 == "dailyFeat" then
				require("lua/layer/rankInfo/ui")
				rankInfoUI.show(1)
			elseif var_4_0 == "openBuildingTech" then
				user.workerOpen = true

				require("lua/layer/technology/ui")
				technologyUI.show(2)
			elseif var_4_0 == "learnFirstSkill" then
				eventManager.dispatchEvent("learnFirstSkill")
			elseif var_4_0 == "openStore" then
				equipmentUI.show(1)
			elseif var_4_0 == "openShenjiang" then
				equipmentUI.show(6)
			elseif var_4_0 == "moveToCity" then
				eventManager.dispatchEvent("moveToCity", roleDialogue.control.dialogueData.cityId, false)
			elseif var_4_0 == "openGemShop" then
				require("lua/layer/weaponTab/ui")
				weaponTab.ui.show(3)
			elseif var_4_0 == "drawBack1" then
				for iter_4_0, iter_4_1 in ipairs(user.taskDecide2) do
					if iter_4_1.strategy == "drawBack" and iter_4_1.selfNation == user.player.forceId then
						table.remove(user.taskDecide2, iter_4_0)

						break
					end
				end
			elseif var_4_0 == "drawBack2" then
				for iter_4_2, iter_4_3 in ipairs(user.taskDecide2) do
					if iter_4_3.strategy == "drawBack" and iter_4_3.concernNation == user.player.forceId then
						table.remove(user.taskDecide2, iter_4_2)

						break
					end
				end
			elseif var_4_0 == "surround1" then
				for iter_4_4, iter_4_5 in ipairs(user.taskDecide2) do
					if iter_4_5.strategy == "surround" and iter_4_5.selfNation == user.player.forceId then
						table.remove(user.taskDecide2, iter_4_4)

						break
					end
				end
			elseif var_4_0 == "surround2" then
				for iter_4_6, iter_4_7 in ipairs(user.taskDecide2) do
					if iter_4_7.strategy == "surround" and iter_4_7.concernNation == user.player.forceId then
						table.remove(user.taskDecide2, iter_4_6)

						break
					end
				end
			elseif var_4_0 == "killAll" then
				nationUI.show(13)
			elseif var_4_0 == "kfyzMedal" then
				local var_4_9 = require("lua/layer/notice/KfyzMedal").new()

				smgr.getLayer("topLayer"):addChild(var_4_9)
			elseif var_4_0 == "moveToMainCityRegional" then
				smgr.changeScene(SCENE_RES_JUMING)
				roleDialogue.control.loadSpeak("moJiaBuild6")
			elseif var_4_0 == "gotoGeneralPanel" then
				require("lua/layer/general/ui")
				showGeneralPanel(1)
			else
				log.info("luxiaodong call:" .. tostring(var_4_0))
			end
		end

		if roleDialogue.control.isfubenFailed == true then
			roleDialogue.control.isfubenFailed = false
		else
			dataCache.isNextDataNeedCache = false

			dataCache.showNext()
		end
	else
		roleDialogue.control.currentSpeak()
	end
end

function roleDialogue.control.currentSpeak()
	local var_5_0 = roleDialogue.control.dialogueData.step[roleDialogue.control.step]

	roleDialogue.ui.setLeftVisible(false)
	roleDialogue.ui.setRightVisible(false)

	local var_5_1

	if var_5_0.pic == "player" then
		var_5_1 = CCSprite:create("res/ui/common/playerPic/player" .. tostring(user.player.pic) .. ".png")
	elseif var_5_0.pic == "xiaoqian" then
		var_5_1 = CCSprite:create("res/ui/guide/npc_xq.png")
	else
		var_5_1 = CCSprite:create(rmgr.getGeneralBust(var_5_0.pic))
	end

	local var_5_2, var_5_3 = string.find(var_5_0.desc, "{0}")

	if var_5_2 ~= nil then
		local var_5_4 = string.sub(var_5_0.desc, 1, var_5_2 - 1)
		local var_5_5 = string.sub(var_5_0.desc, var_5_3 + 1)

		var_5_0.desc = var_5_4 .. user.player.name .. var_5_5
	end

	roleDialogue.ui.table.leftRole:setScale(1)
	roleDialogue.ui.table.rightRole:setScale(1)

	if var_5_0.type == 1 then
		if conf.language == "kr" or conf.language == "vie" then
			local var_5_6 = string.gsub(var_5_0.desc, "\n", "")

			roleDialogue.ui.table.leftText:setString(var_5_6)
		else
			roleDialogue.ui.table.leftText:setString(var_5_0.desc)
		end

		roleDialogue.ui.table.leftRole:setDisplayFrame(var_5_1:displayFrame())

		if var_5_0.pic == "player" then
			roleDialogue.ui.table.leftRole:setScale(0.8)
		end

		roleDialogue.ui.setLeftVisible(true)
	elseif var_5_0.type == 2 then
		if conf.language == "kr" or conf.language == "vie" then
			local var_5_7 = string.gsub(var_5_0.desc, "\n", "")

			roleDialogue.ui.table.rightText:setString(var_5_7)
		else
			roleDialogue.ui.table.rightText:setString(var_5_0.desc)
		end

		roleDialogue.ui.table.rightRole:setDisplayFrame(var_5_1:displayFrame())

		if var_5_0.pic == "player" then
			roleDialogue.ui.table.rightRole:setScale(0.8)
		end

		roleDialogue.ui.setRightVisible(true)
	end

	if var_5_0.special then
		roleDialogue.ui.special(var_5_0.special)
	end
end

function roleDialogue.control.game_exit()
	roleDialogue.control.isfubenFailed = false
end
