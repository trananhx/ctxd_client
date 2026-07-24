require("lua/layer/createCharacterLayer")
require("lua/component/CCStrokeLabelTTF")
require("lua/common/tool")
require("lua/common/eventManager")
require("lua/common/dataCache")

taskControl = {}

local var_0_0 = taskConstant
local var_0_1 = taskControl
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 1
local var_0_5 = 2
local var_0_6 = 3
local var_0_7 = 1
local var_0_8 = 2
local var_0_9 = 3
local var_0_10 = 4
local var_0_11 = 5
local var_0_12 = 6
local var_0_13 = 7
local var_0_14 = 8
local var_0_15 = 9
local var_0_16 = false
local var_0_17 = true
local var_0_18 = true
local var_0_19 = true
local var_0_20 = true
local var_0_21 = true
local var_0_22 = true
local var_0_23 = true
local var_0_24 = true
local var_0_25 = true
local var_0_26 = true
local var_0_27 = true
local var_0_28 = true
local var_0_29 = true
local var_0_30 = true
local var_0_31 = true
local var_0_32 = true
local var_0_33 = true
local var_0_34 = true
local var_0_35 = true
local var_0_36 = 0

var_0_1.hideUI = false
var_0_1.tmp_task = nil
var_0_1.bstask = {}
var_0_1.bstask.att = language.get(95016)
var_0_1.bstask.def = language.get(95017)
var_0_1.bstask.sup = language.get(95018)
var_0_1.bstask.defCityNum = 0
var_0_1.buildNationDialogue = {}

function var_0_1.doSomethingForTask()
	local var_1_0 = smgr.getLayer("taskLayer")

	if user.curMainTask then
		local var_1_1 = user.curMainTask

		if var_1_1 then
			log.debug("$$$$$$ main task id ", var_1_1.taskId)

			if var_1_1.state == var_0_2 and var_1_1.taskId == 8 then
				if user.player.pic == 0 and user.getFunc(3) == true then
					eventManager.dispatchEvent("role_dialogue_speak", 10)
				end
			elseif var_1_1.state == var_0_3 and (var_1_1.taskId == 2 or var_1_1.taskId == 3) then
				if guide.constant.other[5] == true then
					guide.constant.other[5] = false

					guide.ui.setVisible(false)
				end
			elseif var_1_1.state == var_0_2 and var_1_1.taskId == 5 then
				resourceAreaUI.add_mazei()
			elseif var_1_1.state == var_0_2 and var_1_1.taskId == 12 then
				-- block empty
			elseif var_1_1.state == var_0_2 and var_1_1.taskId == 15 then
				-- block empty
			elseif var_1_1.state == var_0_2 and var_1_1.taskId == 90 then
				eventManager.dispatchEvent("moveToCity", user.task90_cityId)
			elseif var_1_1.state == var_0_2 and var_1_1.taskId == 91 then
				eventManager.dispatchEvent("moveToCity", user.task91_cityId)
			elseif var_1_1.taskId == 13 and var_0_17 == true then
				-- block empty
			elseif var_1_1.taskId == 19 and var_0_18 == true then
				if guide.constant.area[2] == true or user.getFunc(9) == false then
					menuControl.addGuide()
				end
			elseif var_1_1.taskId == 28 and var_0_19 == true then
				if guide.constant.city[3] == true or user.getFunc(6) == false then
					menuControl.addGuide()
				end
			elseif var_1_1.taskId == 39 and var_0_20 == true then
				if guide.constant.city[5] == true or user.getFunc(8) == false then
					guide.constant.city[5] = true
					var_0_20 = false

					menuControl.addGuide()
				end
			elseif var_1_1.taskId == 24 and var_0_24 == true then
				-- block empty
			elseif var_1_1.taskId == 112 and var_0_25 == true then
				-- block empty
			elseif var_1_1.taskId == 122 and var_0_26 == true then
				-- block empty
			elseif var_1_1.taskId == 23 and var_0_27 == true then
				-- block empty
			elseif var_1_1.taskId == 61 and var_0_28 == true then
				-- block empty
			elseif var_1_1.taskId == 107 and var_0_29 == true then
				-- block empty
			elseif var_1_1.taskId == 64 and var_0_30 == true then
				-- block empty
			elseif var_1_1.taskId == 102 and isFirstTimeReceiveTas102 == true then
				-- block empty
			elseif var_1_1.taskId == 127 and isFirstTimeReceiveTas127 == true then
				-- block empty
			elseif var_1_1.taskId == 93 and var_0_34 == true then
				var_0_34 = false

				smgr.showScoreTips()
			elseif var_1_1.taskId == 89 then
				menuControl.addLight("shijie", true)
			elseif var_1_1.taskId == 90 and var_0_35 then
				var_0_35 = false

				log.info("世界地图打开任务")

				if conf.language == "tw" and platform.getFlag() == "MOBILE_ANDROID" then
					statistics.customEvent("gcld_open_world_map")
				end
			end

			if var_1_1.state == var_0_3 then
				log.info("mainTask.state == task_state_finished")

				if var_1_1.plot ~= nil and tostring(var_1_1.plot) ~= "" and var_1_1.taskId ~= 1 then
					eventManager.dispatchEvent("role_dialogue_speak", tonumber(var_1_1.plot))
				end
			end

			if var_1_1.state == var_0_2 and user.curMainTask.isNewTask == true then
				user.curMainTask.isNewTask = false

				if var_1_1.iosMarktrace and #var_1_1.iosMarktrace >= 3 then
					if dataCache.isNextDataNeedCache == true then
						dataCache.isNeedClick_mainTask = true
					elseif var_1_1.taskId == 22 or var_1_1.taskId == 23 or var_1_1.taskId == 46 or var_1_1.taskId == 48 or var_1_1.taskId == 60 or var_1_1.taskId == 70 or var_1_1.taskId == 89 then
						if user.player.playerLv < 30 then
							taskUI.showTaskGuide()
						end
					elseif user.player.playerLv < 30 then
						taskUI.showTaskGuide()
					end
				end
			end
		end
	end
end

function var_0_1.checkHadFinishedTask()
	log.info("check task finnished .. ")

	if user.curMainTask and user.curMainTask.state == var_0_3 then
		taskUI.showTaskReward(user.curMainTask)
	end

	if user.curBranchTask and user.curBranchTask.state == var_0_3 then
		taskUI.showTaskReward(user.curBranchTask)

		user.curBranchTask = nil
	end
end

function var_0_1.addTaskToDataCache()
	if user.curMainTask and user.curMainTask.state == var_0_3 and dataCache.isTaskInCache(user.curMainTask.taskId) == false then
		dataCache.push(dataCache_type_task_reward, user.curMainTask)
	end

	if user.curBranchTask and user.curBranchTask.state == var_0_3 and dataCache.isTaskInCache(user.curBranchTask.taskId) == false then
		dataCache.push(dataCache_type_task_reward, user.curBranchTask)
	end
end

local function var_0_37(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = os.time()

		if var_0_1.buildNationDialogue[arg_5_0] == nil or var_5_0 - var_0_1.buildNationDialogue[arg_5_0] > 1 then
			var_0_1.buildNationDialogue[arg_5_0] = var_5_0

			roleDialogue.control.loadSpeak(arg_5_0)
		end
	end

	user.inkbtask = false

	taskUI.setBuildNationTaskSide()

	if arg_4_0.action.data and arg_4_0.action.data.taskInfo then
		local var_4_1 = 0

		for iter_4_0, iter_4_1 in pairs(arg_4_0.action.data.taskInfo) do
			var_4_1 = var_4_1 + 1
		end

		if var_4_1 > 0 then
			user.inkbtask = true

			taskUI.setBuildNationTaskSide(arg_4_0.action.data.taskInfo)

			local var_4_2 = arg_4_0.action.data.taskInfo

			if var_4_2.type then
				if tonumber(var_4_2.type) == 1 or var_4_2.type == 1 then
					if var_4_2.state == -1 then
						-- block empty
					elseif var_4_2.state == 0 then
						roleDialogue.control.loadSpeak(1974)
					elseif var_4_2.state == 1 then
						roleDialogue.control.loadSpeak(1975)
					elseif var_4_2.state == 2 then
						var_4_0(1985)
					end
				elseif tonumber(var_4_2.type) == 2 or var_4_2.type == 2 then
					if var_4_2.state == -1 then
						roleDialogue.control.loadSpeak(1976)
					elseif var_4_2.state == 0 then
						roleDialogue.control.loadSpeak(1977)
					elseif var_4_2.state == 1 then
						roleDialogue.control.loadSpeak(1978)
					elseif var_4_2.state == 2 then
						var_4_0(1986)
					end
				elseif tonumber(var_4_2.type) == 3 or var_4_2.type == 3 then
					if var_4_2.state == -1 then
						-- block empty
					elseif var_4_2.state == 0 then
						if user.kbLv == 1 then
							roleDialogue.control.loadSpeak(2024)
						else
							smgr.changeScene(SCENE_MAIN_CITY)
							roleDialogue.control.loadSpeak(1979)
						end
					elseif var_4_2.state == 1 then
						if user.kbLv == 1 then
							-- block empty
						else
							smgr.changeScene(SCENE_MAIN_CITY)
							roleDialogue.control.loadSpeak(1980)
						end
					elseif var_4_2.state == 2 then
						var_4_0(1987)
						smgr.changeScene(SCENE_MAIN_CITY)
					end
				elseif tonumber(var_4_2.type) == 4 or var_4_2.type == 4 then
					if var_4_2.isEnemyTask ~= true then
						if var_4_2.state == -1 then
							-- block empty
						elseif var_4_2.state == 0 then
							roleDialogue.control.loadSpeak(2025)
						elseif var_4_2.state == 1 then
							roleDialogue.control.loadSpeak(2026)
						elseif var_4_2.state == 2 then
							var_4_0(2027)
						end
					elseif var_4_2.state == -1 then
						-- block empty
					elseif var_4_2.state == 0 then
						roleDialogue.control.loadSpeak(2028)
					elseif var_4_2.state == 1 then
						-- block empty
					elseif var_4_2.state == 2 then
						-- block empty
					end
				end

				if var_4_2.isLast == true then
					if var_4_2.state == 1 then
						if tonumber(var_4_2.type) == 4 or var_4_2.type == 4 then
							if user.kbLv == 2 then
								roleDialogue.control.loadSpeak(2114)
							else
								roleDialogue.control.loadSpeak(2029)
							end
						else
							roleDialogue.control.loadSpeak(1981)

							if user.pin == 0 then
								-- block empty
							else
								roleDialogue.control.loadSpeak(1983)
							end
						end
					elseif var_4_2.state == 2 then
						if user.kbLv >= 1 then
							var_4_0(2023)
						else
							var_4_0(1988)
						end
					end
				end
			end
		end
	end
end

function var_0_1.setWeichengSidebar()
	local function var_6_0(arg_7_0)
		user.inbstask = true

		require("lua/layer/task/ui")

		if arg_7_0.action.data then
			taskUI.setWeichengTaskSide(arg_7_0.action.data)
		end
	end

	user.inbstask = false

	taskUI.uiTable.weichengButtonLayer:setVisible(false)
	cmgr.sendRequest(var_6_0, actions.getSpecialSInfo)
end

local function var_0_38(arg_8_0)
	if user.player.playerLv <= user.bstaskMinLevel then
		return
	end

	local var_8_0 = false

	local function var_8_1(arg_9_0)
		user.inbstask = true

		require("lua/layer/task/ui")

		if arg_9_0.action.data then
			taskUI.setWeichengTaskSide(arg_9_0.action.data)
		end
	end

	if arg_8_0.action.data and arg_8_0.action.data.refresh then
		if arg_8_0.action.data.refresh.defCityNum then
			var_0_1.bstask.defCityNum = arg_8_0.action.data.refresh.defCityNum

			taskUI.setWeichengCityNum(arg_8_0.action.data.refresh.defCityNum)

			return
		end

		taskUI.uiTable.weichengButtonLayer:setVisible(true)
		cmgr.sendRequest(var_8_1, actions.getSpecialSInfo)

		if arg_8_0.action.data.refresh.taskStart and arg_8_0.action.data.refresh.taskStart == true then
			user.inbstask = true

			taskUI.showXiaoqianWeichengDialogue(arg_8_0.action.data.refresh, true)
		end
	end

	if arg_8_0.action.data and arg_8_0.action.data.taskchange then
		user.inbstask = false

		taskUI.uiTable.weichengButtonLayer:setVisible(false)
		cmgr.sendRequest(var_8_1, actions.getSpecialSInfo)
		taskUI.showXiaoqianWeichengDialogue(arg_8_0.action.data.taskchange)

		if arg_8_0.action.data.taskchange.serial == 3 and arg_8_0.action.data.taskchange.isWin == true and arg_8_0.action.data.taskchange.isInSpecial == false then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
		end
	end
end

local function var_0_39(arg_10_0)
	if arg_10_0.action.data and arg_10_0.action.data.ysInfo then
		log.info("袁绍事件强化")

		if arg_10_0.action.data.ysInfo.ysCityId then
			local var_10_0 = arg_10_0.action.data.ysInfo.ysCityId

			roleDialogue.control.loadSpeak(1802)
			require("lua/layer/world/yuanshaoEvent")
			yuanshaoEvent.showYuanshao()

			if smgr.currentSceneTag == SCENE_WORLD or smgr.currentSceneTag == SCENE_PANEL_RESOURCE or smgr.currentSceneTag == SCENE_PANEL_EQUIPMENT or smgr.currentSceneTag == SCENE_PANEL_TECHNOLOGY or smgr.currentSceneTag == SCENE_PANEL_RANK or smgr.currentSceneTag == SCENE_PANEL_NATION or smgr.currentSceneTag == SCENE_MAIN_CITY or smgr.currentSceneTag == SCENE_RES_JUMING or smgr.currentSceneTag == SCENE_RES_MUCHANG or smgr.currentSceneTag == SCENE_RES_NONGTIAN or smgr.currentSceneTag == SCENE_RES_BINGTIE then
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
				loadingLayer.show(SCENE_WORLD, var_10_0)
			end

			local var_10_1 = {
				yuanshaoCityId = var_10_0
			}

			eventManager.dispatchEvent("changeCityState", var_10_1)
		end

		if arg_10_0.action.data.ysInfo.winYsForceId then
			if arg_10_0.action.data.ysInfo.winYsForceId == user.player.forceId then
				roleDialogue.control.loadSpeak(1800)
			else
				roleDialogue.control.loadSpeak(1801)
			end
		end
	end
end

local function var_0_40(arg_11_0)
	showTable(arg_11_0)

	if arg_11_0.action.data and arg_11_0.action.data.hjInfo then
		log.info("黄巾事件")

		local var_11_0 = arg_11_0.action.data.hjInfo.hjCenterCity

		if arg_11_0.action.data.hjInfo.phase == 1 then
			roleDialogue.control.loadSpeak(1840)
			require("lua/layer/world/yuanshaoEvent")
			yuanshaoEvent.showZhangjiao()

			if smgr.currentSceneTag == SCENE_WORLD or smgr.currentSceneTag == SCENE_PANEL_RESOURCE or smgr.currentSceneTag == SCENE_PANEL_EQUIPMENT or smgr.currentSceneTag == SCENE_PANEL_TECHNOLOGY or smgr.currentSceneTag == SCENE_PANEL_RANK or smgr.currentSceneTag == SCENE_PANEL_NATION or smgr.currentSceneTag == SCENE_MAIN_CITY or smgr.currentSceneTag == SCENE_RES_JUMING or smgr.currentSceneTag == SCENE_RES_MUCHANG or smgr.currentSceneTag == SCENE_RES_NONGTIAN or smgr.currentSceneTag == SCENE_RES_BINGTIE then
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
				loadingLayer.show(SCENE_WORLD, var_11_0)
			end

			local var_11_1 = {
				hjcity = var_11_0,
				phase = arg_11_0.action.data.hjInfo.phase,
				hjCountDown = arg_11_0.action.data.hjInfo.hjCountDown,
				hjRemainCities = arg_11_0.action.data.hjInfo.hjRemainCities
			}

			eventManager.dispatchEvent("changeCityState", var_11_1)
		elseif arg_11_0.action.data.hjInfo.phase == 2 then
			roleDialogue.control.loadSpeak(1841)

			local var_11_2 = {
				hjcity = var_11_0,
				phase = arg_11_0.action.data.hjInfo.phase,
				hjRemainCities = arg_11_0.action.data.hjInfo.hjRemainCities
			}

			eventManager.dispatchEvent("changeCityState", var_11_2)
		else
			roleDialogue.control.loadSpeak(1842)

			local var_11_3 = {
				hjcity = var_11_0,
				phase = arg_11_0.action.data.hjInfo.phase
			}

			eventManager.dispatchEvent("changeCityState", var_11_3)
		end
	end
end

local function var_0_41(arg_12_0)
	if arg_12_0.action.data.curTask then
		user.curTask.refreshTask = arg_12_0.action.data.curTask.refreshTask
	end

	local var_12_0 = arg_12_0.action.data.curTask.tasks
	local var_12_1 = arg_12_0.action.data.curTask.refreshTask

	if var_12_0 then
		for iter_12_0, iter_12_1 in pairs(var_12_0) do
			user.player.task.tasks[iter_12_1.type] = iter_12_1

			if iter_12_1.type == 1 then
				user.curMainTask = iter_12_1
			elseif iter_12_1.type == 3 then
				user.curBranchTask = iter_12_1
			end
		end

		if user.curMainTask.state == 1 then
			guide.forceMarkTrace = user.curMainTask.iosMarktrace
			guide.forceMarkTraceDescription = user.curMainTask.introLong

			taskUI.showNewTaskEffect()
			taskUI.showNewTaskEffect2()

			user.curMainTask.isNewTask = true
		end
	end

	if var_12_1 then
		for iter_12_2, iter_12_3 in pairs(var_12_1) do
			user.player.task.tasks[iter_12_3.type] = iter_12_3

			if iter_12_3.type == 1 then
				user.curMainTask = iter_12_3
			elseif iter_12_3.type == 3 then
				user.curBranchTask = iter_12_3
			end
		end
	end

	local var_12_2 = smgr.rootLayer:getChildByTag(var_0_0.TASKREWARD_TAG)

	if var_12_2 and var_12_2:isVisible() == true then
		dataCache.isNextDataNeedCache = false
	end

	if var_0_1.tmp_task and var_0_1.tmp_task.taskId == user.curMainTask.taskId then
		return
	end

	smgr.rootLayer:removeChildByTag(var_0_0.TASKREWARD_TAG, true)
	var_0_1.addTaskToDataCache()

	if dataCache.isNextDataNeedCache == false and dataCache.isDelayDispaly == false then
		dataCache.showNext()
	end

	var_0_1.doSomethingForTask()

	if arg_12_0.action.data.tasks and arg_12_0.action.data.tasks.newConstruction then
		eventManager.dispatchEvent("updateConstruction")
	end

	taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_MAIN_BRANCH)

	if user.player.playerLv > 33 and smgr.currentSceneTag == SCENE_WORLD and user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
		taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_NATION)
	end

	if var_12_0 and var_12_0[1] and (user.curMainTask.state ~= 2 or var_12_0[2] and user.curBranchTask and user.curBranchTask.state ~= 2) then
		log.info("should expand task")
		taskUI.taskButtonSelected(true)

		if resourceAreaUI and resourceAreaUI.forceExpandTaskBoard then
			resourceAreaUI.forceExpandTaskBoard(true)
		end
	end
end

local function var_0_42(arg_13_0)
	if user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
		for iter_13_0 = 1, #user.curNationTask.tasks do
			local var_13_0 = user.curNationTask.tasks[iter_13_0]

			var_13_0.endTime = var_13_0.endTime - arg_13_0 * 1000

			if var_13_0.endTime < 0 then
				var_13_0.endTime = 0
			end
		end
	end

	if user.curTryTask and user.curTryTask.cd then
		user.curTryTask.cd = user.curTryTask.cd - arg_13_0 * 1000

		if user.curTryTask.cd < 0 then
			user.curTryTask.cd = 0
		end
	end

	if user.curProtectTask and user.curProtectTask.cd then
		user.curProtectTask.cd = user.curProtectTask.cd - arg_13_0 * 1000

		if user.curProtectTask.cd < 0 then
			user.curProtectTask.cd = 0
		end
	end

	if taskUI.uiTable and taskUI.uiTable.taskButtonLayer then
		local var_13_1 = 120
		local var_13_2 = 1
		local var_13_3, var_13_4 = taskUI.uiTable.taskButtonLayer:getPosition()

		if taskUI.uiTable.killAllButtonLayer:isVisible() then
			taskUI.uiTable.killAllButtonLayer:setPosition(ccp(var_13_3 + var_13_1 * var_13_2, var_13_4))

			var_13_2 = var_13_2 + 1
		end

		if taskUI.uiTable.buildNationButtonLayer:isVisible() then
			taskUI.uiTable.buildNationButtonLayer:setPosition(ccp(var_13_3 + var_13_1 * var_13_2, var_13_4))

			var_13_2 = var_13_2 + 1
		end

		if taskUI.uiTable.jungongButtonLayer:isVisible() then
			taskUI.uiTable.jungongButtonLayer:setPosition(ccp(var_13_3 + var_13_1 * var_13_2, var_13_4))

			var_13_2 = var_13_2 + 1
		end

		if taskUI.uiTable.weichengButtonLayer:isVisible() then
			taskUI.uiTable.weichengButtonLayer:setPosition(ccp(var_13_3 + var_13_1 * var_13_2, var_13_4))

			local var_13_5 = var_13_2 + 1
		end
	end
end

function var_0_1.handlerPushNationTaskInfoAction(arg_14_0)
	if arg_14_0.action.data.simpleMessage then
		local var_14_0 = arg_14_0.action.data.simpleMessage.tasks

		if user.curNationTask then
			user.curNationTask.tasks = var_14_0
		else
			user.curNationTask = {}
			user.curNationTask.tasks = var_14_0
		end

		if #var_14_0 > 0 and user.player.playerLv > 33 then
			taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_NATION)
		else
			taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_MAIN_BRANCH)
		end

		amgr.playEffect(enumAudioFile.ui_task_finish, false, true)

		for iter_14_0, iter_14_1 in pairs(var_14_0) do
			if iter_14_1.taskState > 0 then
				local var_14_1 = CCSprite:createWithSpriteFrameName("nationShadiEnd.png")

				var_14_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

				local var_14_2 = CCArray:create()

				var_14_2:addObject(CCFadeIn:create(2))
				var_14_2:addObject(CCDelayTime:create(2))
				var_14_2:addObject(CCCallFuncN:create(function()
					var_14_1:removeFromParentAndCleanup(true)
				end))
				var_14_1:runAction(CCSequence:create(var_14_2))
			end
		end

		local var_14_3 = os.time()

		if var_14_3 - var_0_36 > 1 then
			var_0_36 = var_14_3

			eventManager.dispatchEvent("nationTaskDidChanged")
		end

		local var_14_4 = arg_14_0.action.data.simpleMessage

		if var_14_4.needTransfer and var_14_4.edictNotice and var_14_4.indivTasks then
			local var_14_5 = smgr.getLayer("pushLayer")
			local var_14_6 = var_14_4.indivTasks[1]

			var_14_6.edictNotice = var_14_4.edictNotice

			require("lua/layer/world/nationChallenges/ZhaoLing.lua").new(var_14_5, var_14_6)
		end

		local var_14_7 = var_14_4.special and var_14_4.displayType == 0

		for iter_14_2, iter_14_3 in pairs(var_14_0) do
			if iter_14_3.taskType == 1 then
				if var_14_4.predicateLeftTime or var_14_7 then
					require("lua/layer/nation/ui")
					nationUI.show(2)

					if var_14_7 then
						roleDialogue.control.loadSpeak(1569)
					end

					break
				end
			elseif iter_14_3.taskType == 9 and iter_14_3.taskState == 0 and iter_14_3.serial == 1 then
				smgr.changeScene(SCENE_MAIN_CITY)
				roleDialogue.control.loadSpeak(2130)
			elseif iter_14_3.taskType == 14 and iter_14_3.taskState == 0 then
				user.newInvestGold = iter_14_3.gold
				user.newInvestTarget = iter_14_3.target

				if iter_14_3.isFirst == true then
					roleDialogue.control.loadSpeak("newInvest0")
				end
			elseif iter_14_3.taskType == 17 then
				eventManager.dispatchEvent("expandTaskUpdate")

				if iter_14_3.serial and iter_14_3.serial == 1 then
					roleDialogue.control.loadSpeak("expandStart")
				end

				if iter_14_3.taskState == 1 then
					roleDialogue.control.loadSpeak("expand2")
				elseif iter_14_3.taskState == 2 then
					roleDialogue.control.loadSpeak("expand1")
				end
			elseif iter_14_3.taskType == 18 then
				if iter_14_3.taskState == 0 and iter_14_3.isFirst then
					if iter_14_3.monsters then
						for iter_14_4, iter_14_5 in ipairs(iter_14_3.monsters) do
							if iter_14_5.forceId == user.player.forceId then
								user.monsterCityId = iter_14_5.cityId

								break
							end
						end
					end

					roleDialogue.control.loadSpeak("monsterStart")
				end

				if iter_14_3.taskState > 0 then
					roleDialogue.control.loadSpeak("monsterOver")

					local var_14_8 = smgr.getLayer("worldCamera")

					if var_14_8 then
						var_14_8.removeMonster()
					end
				end
			elseif iter_14_3.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
				taskUI.setkillAllTaskSide(iter_14_3)
			end
		end
	end
end

function var_0_1.handlerPushPlayerInfoAction(arg_16_0)
	if isExpUpdate(arg_16_0) then
		return
	end

	if arg_16_0.action.data.update then
		local var_16_0 = arg_16_0.action.data.update

		if var_16_0.tryTasks then
			user.curTryTask = var_16_0.tryTasks
		end

		if var_16_0.tryTaskStage then
			-- block empty
		end

		if var_16_0.protectTasks then
			user.curProtectTask.state = var_16_0.protectTasks.state
			user.curProtectTask.cd = var_16_0.protectTasks.cd
			user.curProtectTask.taskType = var_16_0.protectTasks.taskType

			taskUI.taskButtonSelected(true)

			if user.curProtectTask.state > 0 then
				amgr.playEffect(enumAudioFile.ui_task_finish, false, true)
			end
		end

		eventManager.dispatchEvent("tryAndProtectTaskStateDidChanged")
	end
end

function var_0_1.handlerPushManWangLingAction(arg_17_0)
	if arg_17_0.action.data.manWangLing then
		-- block empty
	end
end

local function var_0_43(arg_18_0)
	local var_18_0 = arg_18_0.action.data

	if var_18_0.cnpInfo and var_18_0.cnpInfo.cityNums and user.hasKillAllTask == true then
		for iter_18_0, iter_18_1 in ipairs(user.curNationTask.tasks) do
			if iter_18_1.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
				iter_18_1.currentNum = var_18_0.cnpInfo.cityNums[iter_18_1.concernNation]

				taskUI.uiTable.killAllTaskNumberLabel:setString(iter_18_1.currentNum .. "/" .. iter_18_1.target)

				local var_18_1 = tool.hexToRgb("#FD6262")

				if iter_18_1.currentNum <= iter_18_1.target then
					var_18_1 = tool.hexToRgb("#72DF37")
				end

				taskUI.uiTable.killAllTaskNumberLabel:setColor(var_18_1)

				break
			end
		end
	end
end

function var_0_1.handlerGetCurTaskInfo(arg_19_0)
	return
end

local function var_0_44(arg_20_0)
	if guide.forceMarkTrace == "panel:4:1:1009" or guide.forceMarkTrace == "panel:4:1:1023" or guide.forceMarkTrace == "panel:2:3:1012" or guide.forceMarkTrace == "panel:2:3:1013" or guide.forceMarkTrace == "instance:1:1" then
		guide.isForceMarkTrace = false
		guide.forceMarkTrace = nil
	end

	if user.player.playerLv > 30 then
		guide.isForceMarkTrace = false
		guide.forceMarkTrace = nil
	end

	eventManager.dispatchEvent("refreshMainCityLayer")
	eventManager.dispatchEvent("refreshResourceAreaLayer")
	eventManager.dispatchEvent("refreshInstance")
end

function var_0_1.shareFailed()
	eventManager.unregisterEvent("shareSucceed", var_0_1.getShareReward)
	eventManager.unregisterEvent("shareFailed", var_0_1.shareFailed)
end

local function var_0_45(arg_22_0)
	if arg_22_0.action.data and arg_22_0.action.data.taskMessage then
		local var_22_0 = arg_22_0.action.data.taskMessage

		if var_22_0.taskType == 13 then
			if var_22_0.continentType and var_22_0.continentType == 0 then
				taskUI.showThunderTaskAction(var_22_0)
			end
		elseif var_22_0.taskType == 14 then
			if var_22_0.state ~= 0 and var_22_0.taskType == 14 and (var_22_0.rank == 1 or var_22_0.rank == 2 or var_22_0.rank == 3) then
				roleDialogue.control.loadSpeak("newInvest" .. var_22_0.rank)
			end
		elseif var_22_0.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
			if var_22_0.state == 1 then
				roleDialogue.control.loadSpeak("killAll_lose")
			elseif var_22_0.state == 2 then
				roleDialogue.control.loadSpeak("killAll_win")
			end
		end
	end
end

function var_0_1.taskGainMenuItemSelected()
	if cmgr.isConnected() == false then
		return
	end

	cmgr.sendRequest(var_0_44, actions.finishTask, 1, var_0_1.tmp_task.group or 0, var_0_1.tmp_task.type)
	amgr.playEffect(enumAudioFile.ui_click_award, false)
	smgr.rootLayer:removeChildByTag(var_0_0.TASKREWARD_TAG, true)

	local var_23_0 = var_0_1.tmp_task.taskId

	if var_0_1.tmp_task.group ~= nil and var_0_1.tmp_task.group == 206 then
		roleDialogue.control.loadSpeak(730)
	end

	taskUI.taskAnimation()
	log.info("should show share window !!!!!", taskUI.shareSelectButtonSelected)

	if taskUI.shareSelectButtonSelected then
		local var_23_1 = "http://gc.aoshitang.com"
		local var_23_2 = "攻城掠地"
		local var_23_3 = "gongchengluedi by aoshitang"
		local var_23_4 = "http://i.imgur.com/wzEuacb.png"
		local var_23_5 = "小夥伴們一起來玩吧！"

		if conf.language == "tw" then
			if channelMgr.getCurrentChannel() == channels.andTwPub then
				var_23_3 = "Pubgame"
				var_23_4 = "http://i.imgur.com/GbvVNZ3.png"
				var_23_1 = "https://play.google.com/store/apps/details?id=com.pubgame.mgc"
			else
				var_23_3 = "CHUKONG CO, INC."
				var_23_4 = "http://i.imgur.com/wzEuacb.png"
				var_23_1 = "http://gcld.tw.punchbox.org/m/?fbfrom=1"
			end
		elseif conf.language == "kr" then
			var_23_3 = "I Love Mobile Game Studio."
			var_23_4 = "http://i.imgur.com/PKDba1w.png?1"
			var_23_1 = "https://www.facebook.com/k3game"
		end

		if taskUI.shareTaskId == 52 then
			if conf.language == "tw" then
				var_23_5 = "基於歷史創作的劇情副本，副本中擊敗各個三國歷史人物，體驗馳騁亂世的英雄豪情！一起來玩史上最強戰略遊戲《%s》吧！"

				if channelMgr.getCurrentChannel() == channels.andTwPub then
					var_23_2 = "三國志風起蜀漢-副本"
					var_23_5 = string.format(var_23_5, "三國志風起蜀漢")
				elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
					var_23_2 = "天下霸圖-副本"
					var_23_5 = string.format(var_23_5, "天下霸圖")
				else
					var_23_2 = "攻城掠地-副本"
					var_23_5 = string.format(var_23_5, "攻城掠地")
				end
			elseif conf.language == "kr" then
				var_23_2 = "K3 모바일-던전"
				var_23_5 = "삼국시대를 배경으로 만들어진 시나리오와 던전! 삼국난세를 질주하며 삼국명장들을 격파! 다 같이 초호화 전략 시뮬레이션 <K3 모바일>을 즐기자!"
			end
		elseif taskUI.shareTaskId == 140 then
			if conf.language == "tw" then
				var_23_5 = "在最新“國戰”SLG力作《%s》中，魏蜀吳三個國家的玩家，可以在擁有多達247個城池關隘3個蠻族城的世界地圖上，自由地調兵遣將進行移動或攻擊。戰鬥每時每刻都不會停止。一起來戰吧！"

				if channelMgr.getCurrentChannel() == channels.andTwPub then
					var_23_2 = "三國志風起蜀漢-國戰"
					var_23_5 = string.format(var_23_5, "三國志風起蜀漢")
				elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
					var_23_2 = "天下霸圖-國戰"
					var_23_5 = string.format(var_23_5, "天下霸圖")
				else
					var_23_2 = "攻城掠地-國戰"
					var_23_5 = string.format(var_23_5, "攻城掠地")
				end
			elseif conf.language == "kr" then
				var_23_2 = "K3 모바일-국가전"
				var_23_5 = "최강 전략 시뮬레이션 K3 모바일중 위촉오 3개 나라의 유저는 247개 성지! 3개 만족 성지는 유저님의 손끝에서 지배되여 있다! 전쟁은 끝난적이 없다!당신의 출전으로 나라의 운명이 바뀐다! 다 같이 초호화 전략 시뮬레이션 <K3 모바일>을 즐기자!"
			end
		elseif taskUI.shareTaskId == 159 then
			if conf.language == "tw" then
				var_23_5 = "花費金錢鑲嵌寶石？打副本拿升級材料？升級存在失敗風險？最新“國戰”SLG力作《%s》全新裝備系統絕不如此坑爹！玩家需要更高品級裝備時，直接到道具商店去買即可，使用若幹銀兩即可購進優質裝備，玩家再也不用為裝備升級而浪費精力時間了！一起來玩吧！"

				if channelMgr.getCurrentChannel() == channels.andTwPub then
					var_23_2 = "三國志風起蜀漢-武器"
					var_23_5 = string.format(var_23_5, "三國志風起蜀漢")
				elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
					var_23_2 = "天下霸圖-武器"
					var_23_5 = string.format(var_23_5, "天下霸圖")
				else
					var_23_2 = "攻城掠地-武器"
					var_23_5 = string.format(var_23_5, "攻城掠地")
				end
			elseif conf.language == "kr" then
				var_23_2 = "K3 모바일-장비"
				var_23_5 = "아직도 현질하여 장비에 소캣석을 박고 있는건가요?던전을 클리어 하여 장비 재료를 수집하고 있는건가요?지금 초호화 전략 시뮬레이션 K3 모바일은 전혀 다른 장비 시스템으로 더 훌륭한 장비가 필요할시 직접 상점에서 구입 가능,적은 은화로 최고급 장비 구입 가능!장비 업그레이드에 신경 끝! 다 같이 초호화 전략 시뮬레이션 <K3 모바일>을 즐기자!"
			end
		elseif taskUI.shareTaskId == 167 then
			if conf.language == "tw" then
				var_23_5 = "最新“國戰”SLG力作《%s》在將領上的區分就只有兩大類，壹類是武將，另壹類是文官，這可與古代朝廷設置壹樣！分類不同，代表各自定位與能力的不同，但綜合起來看，兩者屬性分為普通攻擊，普通防禦，戰法攻擊，戰法防禦，計策系統五種。一起來玩吧！"

				if channelMgr.getCurrentChannel() == channels.andTwPub then
					var_23_2 = "三國志風起蜀漢-文官武將"
					var_23_5 = string.format(var_23_5, "三國志風起蜀漢")
				elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
					var_23_2 = "天下霸圖-文官武將"
					var_23_5 = string.format(var_23_5, "天下霸圖")
				else
					var_23_2 = "攻城掠地-文官武將"
					var_23_5 = string.format(var_23_5, "攻城掠地")
				end
			elseif conf.language == "kr" then
				var_23_2 = "K3 모바일-문관 무장"
				var_23_5 = "초호화 전략 시뮬레이션 K3 모바일의 무장 시스템은 삼국역사를 기초로 무장과 문관 두개 부분으로 나눈다!하지만 무장과 문관의 속성은 대체적으로  물리공격 물리방어 전법공격 전법방어 계책시스템 등 5가지로 나눈다. 다 같이 초호화 전략 시뮬레이션 <K3 모바일>을 즐기자!"
			end
		elseif taskUI.shareTaskId == 892 then
			if conf.language == "tw" then
				var_23_5 = "最新“國戰”SLG力作《%s》，特色蠻荒地圖，戰鬥不止限於“三國”而已！過關獲得超稀有武將！想要和全部玩家一起征服邊關蠻族嗎？一起來玩吧！"

				if channelMgr.getCurrentChannel() == channels.andTwPub then
					var_23_2 = "三國志風起蜀漢-蠻荒"
					var_23_5 = string.format(var_23_5, "三國志風起蜀漢")
				elseif channelMgr.getCurrentChannel() == channels.andTwGo2Play or channelMgr.getCurrentChannel() == channels.andTwGo2PlayThird then
					var_23_2 = "天下霸圖-蠻荒"
					var_23_5 = string.format(var_23_5, "天下霸圖")
				else
					var_23_2 = "攻城掠地-蠻荒"
					var_23_5 = string.format(var_23_5, "攻城掠地")
				end
			elseif conf.language == "kr" then
				var_23_2 = "K3 모바일-만황"
				var_23_5 = "초호화 전략 시뮬레이션 K3 모바일 전쟁은 \"삼국\"에서만 머물지 않는다.특색 만황 맵을 클리어 하여 희귀 무장을 모집 하여라! 전 서버 유저들과 함께 만족을 정복하고 싶은가?다 같이 초호화 전략 시뮬레이션 <K3 모바일>을 즐기자!"
			end
		end

		ChannelManager:getInstance():snsShare(var_23_1, var_23_2, var_23_3, var_23_4, var_23_5)
		eventManager.registerEvent("shareSucceed", var_0_1.getShareReward)
		eventManager.registerEvent("shareFailed", var_0_1.shareFailed)
	end

	var_0_1.doSomethingAfterClickedGain(var_23_0)
end

function var_0_1.doSomethingAfterClickedGain(arg_24_0)
	if arg_24_0 == 1 then
		guide.constant.other[2] = true

		guide.control.loadGuide(5, 2)

		dataCache.isNextDataNeedCache = false
	elseif arg_24_0 == 2 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(21)
	elseif arg_24_0 == 8 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(200)
	elseif arg_24_0 == 21 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(170)

		dataCache.isNeedClick_mainTask = false
	elseif arg_24_0 == 22 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(80)
		eventManager.dispatchEvent("task_finished", tonumber(arg_24_0))

		dataCache.isNeedClick_mainTask = false
	elseif arg_24_0 == 38 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(22)
	elseif arg_24_0 == 52 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(23)
	elseif arg_24_0 == 53 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(24)
	elseif arg_24_0 == 67 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(180)
	elseif arg_24_0 == 70 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(300)
	elseif arg_24_0 == 77 then
		dataCache.isNextDataNeedCache = false

		eventManager.dispatchEvent("task_finished", tonumber(arg_24_0))

		dataCache.isNeedClick_mainTask = false
	elseif arg_24_0 == 253 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1524)
	elseif arg_24_0 == 256 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1525)
	elseif arg_24_0 == 258 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1526)
	elseif arg_24_0 == 259 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1527)
	elseif arg_24_0 == 261 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1912)
	elseif arg_24_0 == 262 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1913)
	elseif arg_24_0 == 263 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1914)
	elseif arg_24_0 == 264 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1915)
	elseif arg_24_0 == 265 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1916)
	elseif arg_24_0 == 266 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1917)
	elseif arg_24_0 == 267 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2000)
	elseif arg_24_0 == 268 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2001)
	elseif arg_24_0 == 269 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2002)
	elseif arg_24_0 == 270 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2003)
	elseif arg_24_0 == 271 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2004)
	elseif arg_24_0 == 272 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2005)
	elseif arg_24_0 == 273 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1561)
	elseif arg_24_0 == 274 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1562)
	elseif arg_24_0 == 275 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1563)
	elseif arg_24_0 == 276 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1564)
	elseif arg_24_0 == 277 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1565)
		roleDialogue.control.loadSpeak(1566)
	elseif arg_24_0 == 279 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1567)
	elseif arg_24_0 == 280 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(2120)
	elseif arg_24_0 == 285 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1577)
	elseif arg_24_0 == 291 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1578)
	elseif arg_24_0 == 292 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1581)
	elseif arg_24_0 == 297 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1582)
	elseif arg_24_0 == 304 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1586)
	elseif arg_24_0 == 308 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1587)
	elseif arg_24_0 == 310 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1589)
	elseif arg_24_0 == 314 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1590)
	elseif arg_24_0 == 316 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1591)
	elseif arg_24_0 == 320 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1592)
	elseif arg_24_0 == 3061 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak("moJiaBuild10")
	elseif arg_24_0 == 10006 then
		dataCache.isNextDataNeedCache = false

		roleDialogue.control.loadSpeak(1918)
	else
		if tonumber(arg_24_0) ~= 1 then
			eventManager.dispatchEvent("task_finished", tonumber(arg_24_0))
		end

		dataCache.isNextDataNeedCache = false

		dataCache.showNext()
	end
end

function var_0_1.nationTaskDidDrawReward(arg_25_0)
	if user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
		log.info("task should be nil", #user.curNationTask.tasks, arg_25_0)
	end
end

local function var_0_46(arg_26_0)
	local var_26_0 = arg_26_0.action.data

	showTable(var_26_0)

	if var_26_0.taskFunction and var_26_0.taskFunction.open then
		roleDialogue.control.loadSpeak(2290)
	end

	if var_26_0.info then
		local var_26_1 = var_26_0.info

		if user.player.jungong and user.player.jungong.taskState ~= var_26_1.taskState and (var_26_1.taskState == -1 or var_26_1.taskState == 1) then
			taskUI.showJungongFlyWord(0)
		end

		user.player.jungong = var_26_1

		taskUI.setJungongTaskSide(var_26_1)

		if var_26_1.taskState == 2 and user.player.jwQuick and user.player.jwQuick == 1 then
			taskUI.showJungongPanel()
		end
	end

	if var_26_0.lcxx and var_26_0.lcxx.lcxxOpen then
		roleDialogue.control.loadSpeak(2300)
	end
end

function var_0_1.quickFinishJungong()
	messageBox.showChargeWin(language.get(190080), language.get(226301, user.player.jungong.goldFastForceTask), "goldFastForceTask", function(...)
		user.player.jwQuick = 1

		cmgr.sendRequest(function(...)
			return
		end, actions.forceTaskQuickFinish)
	end)
end

function var_0_1.getJungongReward()
	local function var_30_0(arg_31_0)
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

		local var_31_0 = arg_31_0.action.data

		if var_31_0.rewardList then
			local var_31_1 = {}

			for iter_31_0 = 1, #var_31_0.rewardList do
				var_31_1[iter_31_0] = {}

				if var_31_0.rewardList[iter_31_0].type == 112 then
					var_31_1[iter_31_0].id = 10001
				else
					var_31_1[iter_31_0].id = var_31_0.rewardList[iter_31_0].type
				end

				var_31_1[iter_31_0].value = var_31_0.rewardList[iter_31_0].num
			end

			globalAction_gotResource(var_31_1)
		end

		if user.player.jungong then
			user.player.jungong = nil

			taskUI.setJungongTaskSide(nil)
		end
	end

	cmgr.sendRequest(var_30_0, actions.forceTaskFinishTask)
end

function var_0_1.startJungongTask()
	local function var_32_0(arg_33_0)
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)

		local var_33_0 = arg_33_0.action.data

		if var_33_0 then
			user.player.jungong = var_33_0

			taskUI.setJungongTaskSide(var_33_0)
			taskUI.showJungongFlyWord(1)
		end
	end

	cmgr.sendRequest(var_32_0, actions.forceTaskReceiveTask)
end

function var_0_1.cancelJungongTask()
	local function var_34_0(arg_35_0)
		smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
	end

	cmgr.sendRequest(var_34_0, actions.forceTaskCancelTask)
end

function var_0_1.getShareReward()
	eventManager.unregisterEvent("shareSucceed", var_0_1.getShareReward)
	eventManager.unregisterEvent("shareFailed", var_0_1.shareFailed)

	local function var_36_0(arg_37_0)
		if arg_37_0.action.state == 1 then
			local var_37_0 = {
				{}
			}

			var_37_0[1].id = taskConstant.rewardTypeToId[arg_37_0.action.data.rewards[1].type]
			var_37_0[1].value = arg_37_0.action.data.rewards[1].value

			globalAction_gotResource(var_37_0)
		end
	end

	if taskUI.shareSelectButtonSelected and taskUI.shareTaskId then
		cmgr.sendRequest(var_36_0, actions.getShareTaskReward, taskUI.shareTaskId)
	end
end

function var_0_1.onEnter()
	log.info("enter task layer ... ")
	cmgr.registerResponseHandler(actions.pushKbtask, var_0_37)
	cmgr.registerResponseHandler(actions.pushBstask, var_0_38)
	cmgr.registerResponseHandler(actions.pushTask, var_0_41)
	cmgr.registerResponseHandler(actions.pushPlayer, var_0_1.handlerPushPlayerInfoAction)
	cmgr.registerResponseHandler(actions.pushManWangLing, var_0_1.handlerPushManWangLingAction)
	cmgr.registerResponseHandler(actions.pushNationTask, var_0_1.handlerPushNationTaskInfoAction)
	cmgr.registerResponseHandler(actions.ysEvent, var_0_39)
	cmgr.registerResponseHandler(actions.hjEvent, var_0_40)
	cmgr.registerResponseHandler(actions.nationTaskStateChange, var_0_45)
	cmgr.registerResponseHandler(actions.pushForceTask, var_0_46)
	cmgr.registerResponseHandler(actions.pushWorld, var_0_43)
	eventManager.registerEvent("weichengGetReward", var_0_1.setWeichengSidebar)
	eventManager.registerEvent("nationTaskDidDrawReward", var_0_1.nationTaskDidDrawReward)
	eventManager.registerEvent("forceExpandTaskBoard", taskUI.taskButtonSelected)
	eventManager.registerEvent("sceneWillChange", taskUI.sceneWillChange)
	eventManager.registerEvent("taskButtonItemSetVisible", taskUI.setVisible)
	log.info("task layer didi register GameOver event")
	eventManager.registerEvent("GameOver", var_0_1.shouldExit)

	var_0_1.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_42, 1, false)
end

function var_0_1.shouldExit()
	log.info("tasklayer should exit")

	guide.isForceMarkTrace = false
	guide.forceMarkTrace = nil
	guide.forceMarkTraceDescription = nil

	smgr.getLayer("taskLayer"):removeAllChildrenWithCleanup(true)

	local var_39_0 = smgr.rootLayer:getChildByTag(taskConstant.TASKREWARD_TAG)

	if var_39_0 ~= nil then
		var_39_0:removeFromParentAndCleanup(true)
	end

	if guide.ui.table.layer ~= nil then
		guide.ui.table.layer:setVisible(false)
	end

	if roleDialogue.ui.table.layer ~= nil then
		roleDialogue.ui.table.layer:setVisible(false)
	end

	local var_39_1 = smgr.getLayer("topLayer")

	if var_39_1 ~= nil then
		local var_39_2 = var_39_1:getChildByTag(10000)

		if var_39_2 ~= nil then
			var_39_2:removeFromParentAndCleanup(true)
		end
	end

	dataCache.isNextDataNeedCache = false
	dataCache.isDelayDispaly = false
	dataCache.isNeedClick_mainTask = false
	dataCache.beginIndex = 1
	dataCache.count = 0
	dataCache.data = {}

	if var_0_1.updateSchedulerEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_1.updateSchedulerEntry)
	end

	cmgr.unregisterResponseHandler(actions.pushKbtask, var_0_37)
	cmgr.unregisterResponseHandler(actions.pushBstask, var_0_38)
	cmgr.unregisterResponseHandler(actions.pushTask, var_0_41)
	cmgr.unregisterResponseHandler(actions.pushPlayer, var_0_1.handlerPushPlayerInfoAction)
	cmgr.unregisterResponseHandler(actions.pushManWangLing, var_0_1.handlerPushManWangLingAction)
	cmgr.unregisterResponseHandler(actions.pushNationTask, var_0_1.handlerPushNationTaskInfoAction)
	cmgr.unregisterResponseHandler(actions.ysEvent, var_0_39)
	cmgr.unregisterResponseHandler(actions.hjEvent, var_0_40)
	cmgr.unregisterResponseHandler(actions.nationTaskStateChange, var_0_45)
	cmgr.unregisterResponseHandler(actions.pushForceTask, var_0_46)
	cmgr.unregisterResponseHandler(actions.pushWorld, var_0_43)
	eventManager.unregisterEvent("weichengGetReward", var_0_1.setWeichengSidebar)
	eventManager.unregisterEvent("nationTaskDidDrawReward", var_0_1.nationTaskDidDrawReward)
	eventManager.unregisterEvent("forceExpandTaskBoard", taskUI.taskButtonSelected)
	eventManager.unregisterEvent("sceneWillChange", taskUI.sceneWillChange)
	eventManager.unregisterEvent("taskButtonItemSetVisible", taskUI.setVisible)
	eventManager.unregisterEvent("GameOver", var_0_1.shouldExit)

	smgr.hadShowTask = nil
	taskUI.uiTable = nil

	var_0_1.onExit()
end

function var_0_1.onExit()
	log.info("@@@ 退出任务层")
end

local function var_0_47(arg_41_0, arg_41_1)
	if var_0_16 then
		taskUI.uiTable.taskBoardBg:setVisible(false)

		var_0_16 = false

		if resourceAreaUI and resourceAreaUI.forceExpandTaskBoard then
			resourceAreaUI.forceExpandTaskBoard(false)
		end
	end

	return false
end

function var_0_1.onTouch(arg_42_0, arg_42_1, arg_42_2)
	if arg_42_0 == CCTOUCHBEGAN then
		return var_0_47(arg_42_1, arg_42_2)
	end
end
