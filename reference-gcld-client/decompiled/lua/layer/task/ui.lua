tool.requireRes("task")
require("lua/component/timerLabel")

local var_0_0 = taskControl
local var_0_1 = taskConstant

taskUI = {}
taskUI.uiTable = nil

local var_0_2 = taskUI

function taskUI.showTaskReward(arg_1_0)
	log.info("taskMainBoard will add")
	guide.ui.setVisible(false)

	guide.isForceMarkTrace = false

	if dataCache.isNextDataNeedCache == true then
		log.info("should stop showing task reward")

		return
	end

	amgr.playEffect(enumAudioFile.ui_task_finish)
	amgr.playEffect(enumAudioFile.ui_award_popup)

	dataCache.isNextDataNeedCache = true

	log.info("should show task reward")

	local var_1_0 = smgr.getLayer("taskLayer")
	local var_1_1 = CCLayerColor:create(ccc4(255, 0, 255, 0))

	var_1_1:registerScriptTouchHandler(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == CCTOUCHBEGAN then
			return true
		elseif arg_2_0 == CCTOUCHMOVED then
			return true
		elseif arg_2_0 == CCTOUCHENDED then
			return true
		end
	end, false, true)
	var_1_1:setTouchEnabled(true)

	var_0_2.uiTable.shareSelectButton = nil

	local var_1_2 = autoUI.createUI(var_1_1, getTaskRewardPanel(arg_1_0), var_0_2.uiTable)

	var_0_2.shareSelectButtonSelected = false

	if var_0_2.uiTable.shareSelectButton then
		var_0_2.uiTable.shareSelectButton:selected()

		var_0_2.shareSelectButtonSelected = true
	end

	local var_1_3, var_1_4 = pcall(CCSprite.create, CCSprite, "res/ui/task/" .. arg_1_0.pic .. ".png")

	log.info("result,taskPic:", var_1_3, var_1_4)

	local var_1_5 = 0

	if var_1_4 then
		var_1_5 = var_1_4:getContentSize().width
	end

	log.info("picSizeWidth : ", var_1_5)

	if var_1_3 == false or not var_1_4 or var_1_5 < 5 then
		log.info("result,taskPic(no found):", var_1_3, arg_1_0.pic)

		var_1_4 = CCSprite:create("res/ui/task/task1.png")
	end

	taskUI.uiTable.taskRewardIcon:setDisplayFrame(var_1_4:displayFrame())
	smgr.rootLayer:addChild(var_1_1, 90000, var_0_1.TASKREWARD_TAG)

	var_0_0.tmp_task = arg_1_0

	log.info("taskMainBoard added", var_1_0:isVisible())

	local var_1_6 = CCSprite:create()
	local var_1_7 = CCArray:create()

	var_1_7:addObject(CCDelayTime:create(0.2))
	var_1_7:addObject(CCCallFunc:create(function()
		taskControl.taskGainMenuItemSelected()
	end))
	var_1_6:runAction(CCSequence:create(var_1_7))
	var_1_2:addChild(var_1_6)
	var_1_2:setVisible(false)
end

function taskUI.taskAnimation()
	local var_4_0 = var_0_0.tmp_task
	local var_4_1 = {}
	local var_4_2 = 1

	for iter_4_0, iter_4_1 in pairs(var_4_0.resource) do
		local var_4_3 = iter_4_1.type
		local var_4_4 = iter_4_1.value

		if var_4_3 == 42 then
			var_4_3 = 5
		end

		if var_4_3 == 999 then
			if iter_4_1.generalId == 230 then
				var_4_3 = 10036
			elseif iter_4_1.generalId == 270 then
				var_4_3 = 10037
			end
		end

		var_4_1[var_4_2] = {}
		var_4_1[var_4_2].id = var_4_3
		var_4_1[var_4_2].value = var_4_4
		var_4_2 = var_4_2 + 1
	end

	if var_4_0.chiefExp then
		var_4_1[var_4_2] = {}
		var_4_1[var_4_2].id = 6
		var_4_1[var_4_2].value = var_4_0.chiefExp
	end

	globalAction_gotResource(var_4_1)

	if var_0_0.tmp_task.type == 3 then
		user.curBranchTask = nil
	end

	var_0_0.tmp_task = nil
end

function taskUI.initBasicUI()
	if var_0_0.hideUI then
		return
	end

	local var_5_0 = smgr.getLayer("taskLayer")

	taskUI.uiTable = autoUI.initUI(var_5_0, getTaskUiData())

	taskUI.uiTable.taskButtonItem:registerScriptTapHandler(var_0_2.taskButtonSelected)
	taskUI.uiTable.killAllButtonItem:registerScriptTapHandler(function()
		nationUI.show(13)
	end)
	taskUI.uiTable.jungongButtonItem:registerScriptTapHandler(function()
		log.info("军功任务")
		var_0_2.showJungongPanel()
	end)
	require("lua/layer/nation/ui")
	taskUI.uiTable.weichengButtonItem:registerScriptTapHandler(function()
		if user.isOpenCountry == true then
			nationUI.show(9)
		end
	end)
	taskUI.uiTable.buildNationButtonItem:registerScriptTapHandler(function()
		if user.isOpenCountry == true then
			nationUI.show(11)
		end
	end)
	taskUI.uiTable.helpButtonItem:registerScriptTapHandler(var_0_2.helpButtonItemSelected)
	taskUI.uiTable.battleHelpLayer:setVisible(false)

	if smgr.nextSceneTag == SCENE_INSTANCE and tonumber(user.player.playerLv) >= 7 then
		taskUI.uiTable.battleHelpLayer:setVisible(true)
	end

	if user.curMainTask and user.player.playerLv <= 40 then
		taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_MAIN_BRANCH)

		if user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
			taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_NATION)
		else
			taskUI.taskButtonSelected()
		end
	end
end

function taskUI.checkNationTask()
	local var_10_0 = true

	if user.curNationTask and user.curNationTask.tasks then
		local var_10_1 = user.curNationTask.tasks

		if var_10_1[1].taskType == 16 then
			var_10_0 = var_10_1[1].taskState == 0 or var_10_1[1].taskState ~= 0 and var_10_1[1].hasReward
		end
	end

	return var_10_0
end

function taskUI.updateTaskButtonLayer(arg_11_0)
	if user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
		return
	end

	local var_11_0 = "task4"

	if var_0_2.nationTaskTimer then
		pcall(var_0_2.nationTaskTimer.removeFromParentAndCleanup, var_0_2.nationTaskTimer, true)

		var_0_2.nationTaskTimer = nil
	end

	if arg_11_0 == taskConstant.TASK_TYPE_ID_NATION and taskUI.checkNationTask() then
		var_11_0 = "nation_task"

		taskUI.uiTable.taskTitleLabel:setString("")
		taskUI.uiTable.taskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/task/task_icon_gjrw.png"):displayFrame())
		taskUI.uiTable.taskTitleTexturePic:setPosition(ccp(75, 45))

		local var_11_1 = 0

		for iter_11_0, iter_11_1 in ipairs(user.curNationTask.tasks) do
			if iter_11_1.taskType ~= taskTabConstant.TYPES.NATION_TASK_ZCCG and iter_11_1.endTime > 0 then
				var_11_1 = iter_11_1.endTime
			end
		end

		if var_11_1 > 0 then
			local var_11_2 = createTimerLabel(var_11_1, "@H:@M:@S", "Thonburi-Bold", 24, nil)

			var_0_2.nationTaskTimer = var_11_2

			var_0_2.uiTable.taskButtonLayer:addChild(var_11_2)
			var_11_2:setPosition(44, -8)
		else
			var_11_0 = "nation_task_finished"

			eventManager.dispatchEvent("nationTaskDidChanged")

			if user.curNationTask.tasks[1] and user.curNationTask.tasks[1].taskType and user.curNationTask.tasks[1].taskType == 18 then
				taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_MAIN_BRANCH)
			end
		end
	elseif arg_11_0 == taskConstant.TASK_TYPE_ID_MAIN_BRANCH then
		var_11_0 = user.curMainTask.pic

		taskUI.uiTable.taskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/task/task_icon_rw.png"):displayFrame())
		taskUI.uiTable.taskTitleTexturePic:setPosition(ccp(66, 73))
		taskUI.uiTable.taskTitleLabel:setString(user.curMainTask.taskName)

		if conf.language == "vie" then
			taskUI.uiTable.taskTitleLabel:setDimensions(CCSizeMake(100, 0))
		end
	end

	local var_11_3, var_11_4 = pcall(CCSprite.create, CCSprite, "res/ui/task/" .. var_11_0 .. ".png")

	log.info("result,taskPic:", var_11_3, var_11_4)

	local var_11_5 = 1
	local var_11_6 = 0

	if var_11_4 then
		var_11_6 = var_11_4:getContentSize().width
	end

	log.info("picSizeWidth : ", var_11_6)

	if var_11_3 == false or not var_11_4 or var_11_6 < 5 then
		local var_11_7

		var_11_7, var_11_4 = pcall(CCSprite.create, CCSprite, "res/ui/common/generalHead/generalHead_" .. var_11_0 .. ".png")
		var_11_5 = 0.67

		if var_11_4 then
			var_11_6 = var_11_4:getContentSize().width
		end

		log.info("picSizeWidth : ", var_11_6)

		if var_11_7 == false or not var_11_4 or var_11_6 < 5 then
			var_11_5 = 1

			log.info("result,taskPic(no found):", var_11_7, "generalHead_" .. var_11_0)

			var_11_4 = CCSprite:create("res/ui/task/task1.png")
		end
	end

	taskUI.uiTable.taskIcon:setDisplayFrame(var_11_4:displayFrame())
	taskUI.uiTable.taskIcon:setScale(var_11_5)

	if var_11_5 < 1 then
		taskUI.uiTable.taskIcon:setPositionY(52)
	else
		taskUI.uiTable.taskIcon:setPositionY(44)
	end
end

function taskUI.updateTaskButtonLayer2()
	local var_12_0 = "task4"

	if var_0_2.nationTaskTimer then
		pcall(var_0_2.nationTaskTimer.removeFromParentAndCleanup, var_0_2.nationTaskTimer, true)

		var_0_2.nationTaskTimer = nil
	end

	local var_12_1 = "nation_task"

	taskUI.uiTable.taskTitleLabel:setString("")
	taskUI.uiTable.taskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/task/task_icon_rw.png"):displayFrame())
	taskUI.uiTable.taskTitleTexturePic:setPosition(ccp(75, 45))

	local var_12_2 = user.ywData.taskTime or 0

	if var_12_2 > 0 then
		local var_12_3 = createTimerLabel(var_12_2, "@H:@M:@S", "Thonburi-Bold", 24, nil)

		var_0_2.nationTaskTimer = var_12_3

		var_0_2.uiTable.taskButtonLayer:addChild(var_12_3)
		var_12_3:setPosition(44, -8)
	else
		var_12_1 = "nation_task_finished"
	end

	local var_12_4, var_12_5 = pcall(CCSprite.create, CCSprite, "res/ui/task/" .. var_12_1 .. ".png")

	log.info("result,taskPic:", var_12_4, var_12_5)

	local var_12_6 = 1
	local var_12_7 = 0

	if var_12_5 then
		var_12_7 = var_12_5:getContentSize().width
	end

	log.info("picSizeWidth : ", var_12_7)

	if var_12_4 == false or not var_12_5 or var_12_7 < 5 then
		local var_12_8

		var_12_8, var_12_5 = pcall(CCSprite.create, CCSprite, "res/ui/common/generalHead/generalHead_" .. var_12_1 .. ".png")
		var_12_6 = 0.67

		if var_12_5 then
			var_12_7 = var_12_5:getContentSize().width
		end

		log.info("picSizeWidth : ", var_12_7)

		if var_12_8 == false or not var_12_5 or var_12_7 < 5 then
			var_12_6 = 1

			log.info("result,taskPic(no found):", var_12_8, "generalHead_" .. var_12_1)

			var_12_5 = CCSprite:create("res/ui/task/task1.png")
		end
	end

	taskUI.uiTable.taskIcon:setDisplayFrame(var_12_5:displayFrame())
	taskUI.uiTable.taskIcon:setScale(var_12_6)

	if var_12_6 < 1 then
		taskUI.uiTable.taskIcon:setPositionY(52)
	else
		taskUI.uiTable.taskIcon:setPositionY(44)
	end
end

function taskUI.showTaskGuide(arg_13_0)
	log.info("should show tasks")

	local var_13_0 = smgr.getLayer("taskLayer")
	local var_13_1 = {}

	log.info("smgr.currentSceneTag", smgr.currentSceneTag, SCENE_WORLD)

	if not rmgr.isNotComplete() and user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
		log.info("user.curNationTask.tasks", #user.curNationTask.tasks)

		local var_13_2 = user.curNationTask.tasks

		for iter_13_0 = 1, #var_13_2 do
			if var_13_2[iter_13_0].taskState == 0 or var_13_2[iter_13_0].taskState ~= 0 and var_13_2[iter_13_0].hasReward then
				var_13_2[iter_13_0].taskTypeId = taskConstant.TASK_TYPE_ID_NATION
				var_13_1[#var_13_1 + 1] = var_13_2[iter_13_0]
			end
		end
	elseif user.curMainTask then
		local var_13_3 = user.curMainTask

		var_13_3.taskTypeId = taskConstant.TASK_TYPE_ID_MAIN_BRANCH
		var_13_1[#var_13_1 + 1] = var_13_3
	end

	if not arg_13_0 and var_13_1[1] then
		require("lua/layer/selectForce/control")

		if selectForceData.enterFromSelectForceAndBeforeFirstTask == true then
			log.info("第一次也是最后一次进入这个逻辑！！！！！！！！！")

			selectForceData.enterFromSelectForceAndBeforeFirstTask = false
		else
			taskUI.taskListButtonTap(1, var_13_1[1])
		end
	else
		taskUI.showNewTaskEffect2(1)
	end

	ifExpandTask = false
end

function taskUI.taskButtonSelected(arg_14_0)
	log.info("task button tap ")

	if var_0_0.hideUI then
		return
	end

	if user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
		if not user.ywData.watch then
			notice.control.openMuilJbTask()
		else
			smgr.showTipTextGreen(language.get(215161))
		end

		return
	end

	local var_14_0 = smgr.getLayer("taskLayer")

	if type(arg_14_0) ~= "boolean" then
		arg_14_0 = false
	end

	if arg_14_0 == true or not ifExpandTask then
		taskUI.showTaskGuide(arg_14_0)
	else
		var_0_2.uiTable.taskButtonItem:unselected()

		if var_0_2.taskListMask then
			pcall(var_0_2.taskListMask.removeFromParentAndCleanup, var_0_2.taskListMask, true)
		end

		ifExpandTask = false

		if resourceAreaUI and resourceAreaUI.forceExpandTaskBoard then
			resourceAreaUI.forceExpandTaskBoard(false)
		end
	end
end

function taskUI.helpButtonItemSelected()
	if user.player.playerLv >= 7 then
		require("lua/layer/playerInfo2/ui")
		playerInfo2.ui.show(4)
	end
end

function taskUI.sceneWillChange()
	if user.isYw and smgr.currentSceneTag == SCENE_JUBEN then
		taskUI.updateTaskButtonLayer2()

		if var_0_2.uiTable.jungongButtonLayer then
			var_0_2.uiTable.jungongButtonLayer:setVisible(false)
		end
	elseif user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
		taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_NATION)
	elseif user.curMainTask then
		taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_MAIN_BRANCH)
	end
end

function taskUI.taskListButtonTap(arg_17_0, arg_17_1)
	log.info("should handle task event at QQQ", arg_17_0, arg_17_1)
	require("lua/layer/nation/ui")

	if arg_17_1.taskTypeId == taskConstant.TASK_TYPE_ID_NATION then
		log.info("should nation task panel")

		if arg_17_1.taskType == 18 then
			if user.inActivity then
				activityUI.show(activityConstant.TYPES.ACTIVITY_YEAR_BEAST17.tag)
			end
		elseif arg_17_1.taskType == 0 then
			nationUI.show(4)
		else
			nationUI.show(2)
		end
	elseif arg_17_1.taskTypeId == taskConstant.TASK_TYPE_ID_MAIN_BRANCH then
		showTable(arg_17_1)

		if arg_17_1.state == 2 then
			taskUI.showTaskReward(arg_17_1)

			return
		end

		log.info("task.isForceMarkTrace : ", arg_17_1.isForceMarkTrace)
		showTable(arg_17_1)

		if arg_17_1.isForceMarkTrace == nil then
			arg_17_1.isForceMarkTrace = true
		end

		guide.isForceMarkTrace = arg_17_1.isForceMarkTrace

		if guide.isForceMarkTrace then
			log.info("guide.control.forceGuideByMarkTrace(task.iosMarktrace)", arg_17_1.iosMarktrace)

			guide.forceMarkTrace = arg_17_1.iosMarktrace
			guide.forceMarkTraceDescription = arg_17_1.introLong

			guide.control.forceGuideByMarkTrace(arg_17_1.iosMarktrace, arg_17_1.introLong)
		else
			guide.control.loadGuideByMarkTrace(arg_17_1.iosMarktrace, arg_17_1.introLong)
		end

		if arg_17_1.iosMarktrace and #arg_17_1.iosMarktrace < 3 or not arg_17_1.iosMarktrace then
			local var_17_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

			if var_0_2.taskDescriptionMask then
				pcall(var_0_2.taskDescriptionMask.removeFromParentAndCleanup, var_0_2.taskDescriptionMask, true)

				var_0_2.taskDescriptionMask = nil
			end

			var_0_2.taskDescriptionMask = var_17_0

			autoUI.createUI(var_17_0, getTaskDescriptionBackgroundData(arg_17_1), taskUI.uiTable)

			local var_17_1 = var_0_2.uiTable.taskDescriptionLabel
			local var_17_2 = var_0_2.uiTable.taskDescriptionBg
			local var_17_3, var_17_4 = tool.getPositionInScreen(var_0_2.uiTable.taskButtonItem)

			var_17_2:setPosition(var_17_3 + 45, var_17_4 + 20)
			var_17_2:setPreferredSize(CCSizeMake(var_17_1:getContentSize().width + 20, var_17_1:getContentSize().height + 20))
			var_17_1:setPositionY(var_17_2:getContentSize().height - 10)
			var_17_0:registerScriptTouchHandler(function(arg_18_0, arg_18_1, arg_18_2)
				if arg_18_0 == CCTOUCHBEGAN then
					return true
				elseif arg_18_0 == CCTOUCHMOVED then
					return true
				elseif arg_18_0 == CCTOUCHENDED then
					if tool.checkIfTouch(var_0_2.uiTable.taskDescriptionBg, arg_18_1, arg_18_2) then
						-- block empty
					elseif var_0_2.taskDescriptionMask then
						pcall(var_0_2.taskDescriptionMask.removeFromParentAndCleanup, var_0_2.taskDescriptionMask, true)

						var_0_2.taskDescriptionMask = nil
					end

					return true
				end
			end, false, false)
			var_17_0:setTouchEnabled(true)
			smgr.getLayer("taskLayer"):addChild(var_17_0, 6000)
		end

		if user.curMainTask.taskId == 90 and user.curMainTask.state == 1 then
			eventManager.dispatchEvent("moveToCity", user.task90_cityId)
		elseif user.curMainTask.taskId == 91 and user.curMainTask.state == 1 then
			eventManager.dispatchEvent("moveToCity", user.task91_cityId)
		end
	elseif arg_17_1.taskTypeId == taskConstant.TASK_TYPE_ID_PROTECT then
		nationUI.show(5)
	elseif arg_17_1.taskTypeId == taskConstant.TASK_TYPE_ID_TRY then
		nationUI.show(3)
	end

	if var_0_2.taskListMask then
		ifExpandTask = false

		var_0_2.uiTable.taskButtonItem:unselected()
		pcall(var_0_2.taskListMask.removeFromParentAndCleanup, var_0_2.taskListMask, true)
	end
end

function string.split(arg_19_0, arg_19_1)
	local var_19_0 = {}

	string.gsub(arg_19_0, "[^" .. arg_19_1 .. "]+", function(arg_20_0)
		table.insert(var_19_0, arg_20_0)
	end)

	return var_19_0
end

function var_0_2.markTraceToScene(arg_21_0)
	require("lua/layer/general/ui")
	require("lua/layer/resource/ui")
	require("lua/layer/nation/ui")
	require("lua/layer/rankInfo/ui")
	require("lua/layer/technology/ui")
	require("lua/layer/equipment/ui")
	require("lua/layer/weaponTab/ui")

	if arg_21_0 == nil or #arg_21_0 == 0 then
		return
	end

	local var_21_0 = string.split(arg_21_0, ":")

	for iter_21_0 = 2, #var_21_0 do
		var_21_0[iter_21_0] = tonumber(var_21_0[iter_21_0])
	end

	if var_21_0[1] == "city" then
		log.info("should goto 资源区")

		if var_21_0[2] == 0 then
			smgr.changeScene(SCENE_MAIN_CITY)

			if var_21_0[3] then
				require("lua/guide/control")

				if guide.uiElementsTable.city[var_21_0[3]] then
					local var_21_1, var_21_2 = tool.getPositionInScreen(guide.uiElementsTable.city[var_21_0[3]])
					local var_21_3 = var_21_2 + guide.uiElementsTable.city[var_21_0[3]]:getContentSize().height * 0.3

					guide.control.loadGuide2(3, var_21_1, var_21_3, true)
				end
			end
		elseif var_21_0[2] == 5 then
			smgr.changeScene(var_0_1.cityMarkTrace[var_21_0[2]])

			if var_21_0[3] and var_21_0[3] > 100 then
				require("lua/guide/control")

				if guide.uiElementsTable[var_21_0[3]] then
					local var_21_4, var_21_5 = tool.getPositionInScreen(guide.uiElementsTable[var_21_0[3]])
					local var_21_6 = var_21_5 + guide.uiElementsTable[var_21_0[3]]:getContentSize().height * 0.5

					guide.control.loadGuide2(3, var_21_4, var_21_6, true)
				end
			end
		else
			log.info("taskConstant.cityMarkTrace ", var_0_1.cityMarkTrace[var_21_0[2]])
			smgr.changeScene(var_0_1.cityMarkTrace[var_21_0[2]])

			if var_21_0[3] then
				require("lua/guide/control")

				if guide.uiElementsTable[var_21_0[3]] then
					local var_21_7, var_21_8 = tool.getPositionInScreen(guide.uiElementsTable[var_21_0[3]])
					local var_21_9 = var_21_7 - guide.uiElementsTable[var_21_0[3]]:getContentSize().width * 0.8

					guide.control.loadGuide2(2, var_21_9, var_21_8, true)
				end

				if var_21_0[3] < 100 then
					require("lua/layer/resourceArea2/uidata")

					local var_21_10 = getResourceUiData()["building_" .. var_21_0[2] .. "_" .. var_21_0[3]]

					if var_21_10 then
						require("lua/guide/control")

						local var_21_11 = var_21_10.x
						local var_21_12 = var_21_10.y + 50

						guide.control.loadGuide2(3, var_21_11, var_21_12, true)
					end
				end
			end
		end
	elseif var_21_0[1] == "world" then
		if var_21_0[2] and var_21_0[2] ~= 0 then
			loadingLayer.show(SCENE_WORLD, var_21_0[2])
		else
			loadingLayer.show(SCENE_WORLD)
		end
	elseif var_21_0[1] == "instance" then
		require("lua/layer/selectInstance2/ui")
		require("lua/layer/selectInstance2/constant")
		log.info("should show instance ", var_21_0[2], var_21_0[3])
		smgr.changeScene(SCENE_INSTANCE, var_21_0[2])
		require("lua/guide/control")

		if var_21_0[3] and var_21_0[3] ~= 0 and selectInstanceConstant.NPC_POSITION[var_21_0[3]] then
			local var_21_13 = selectInstanceConstant.NPC_POSITION[var_21_0[3]]
			local var_21_14 = var_21_13.x
			local var_21_15 = var_21_13.y + 60

			if var_21_13 then
				guide.control.loadGuide2(3, var_21_14, var_21_15, true)
			else
				log.error("taks/ui: no such position found")
			end
		end
	elseif var_21_0[1] == "panel" then
		local var_21_16 = true
		local var_21_17 = 3
		local var_21_18 = true

		local function var_21_19()
			log.info("should show arrow", var_21_0[4])

			if var_21_0[4] then
				require("lua/guide/control")
				log.info("ui element :", guide.uiElementsTable[var_21_0[4]])

				if guide.uiElementsTable[var_21_0[4]] then
					local var_22_0, var_22_1 = tool.getPositionInScreen(guide.uiElementsTable[var_21_0[4]])

					if var_21_16 then
						var_22_1 = var_22_1 + guide.uiElementsTable[var_21_0[4]]:getContentSize().height
					end

					log.info("position :", var_22_0, var_22_1, guide.uiElementsTable[var_21_0[4]]:getContentSize().height)
					guide.control.loadGuide2(var_21_17, var_22_0, var_22_1, true)
				else
					log.error("task/ui: no such ui element Id : ", var_21_0[4])
				end
			end
		end

		if var_21_0[2] == 1 then
			resourceUI.show(var_21_0[3], var_21_0[4])

			if var_21_0[3] <= 2 then
				var_21_16 = false
			end
		elseif var_21_0[2] == 2 then
			if var_21_0[3] == 1 or var_21_0[3] == 4 then
				var_21_16 = true
				var_21_18 = false
				guide.callback = var_21_19
			end

			if var_21_0[3] == 3 then
				var_21_16 = false
				var_21_18 = false
				guide.callback = var_21_19
			end

			showGeneralPanel(var_21_0[3], var_21_0[4])
		elseif var_21_0[2] == 3 then
			nationUI.show(var_21_0[3], var_21_0[4])
		elseif var_21_0[2] == 4 then
			if var_21_0[3] == 2 then
				require("lua/layer/equipment/storeHouse/ui")

				guide.callback = var_21_19
				var_21_18 = false
			end

			equipmentUI.show(var_21_0[3], var_21_0[4])
		elseif var_21_0[2] == 5 then
			technologyUI.show(var_21_0[3], var_21_0[4])
		elseif var_21_0[2] == 6 then
			rankInfoUI.show(var_21_0[3], var_21_0[4])
		elseif var_21_0[2] == 7 then
			weaponTab.ui.show(var_21_0[3], var_21_0[4])
		end

		if var_21_18 then
			var_21_19()
		end
	elseif var_21_0[1] == "menu" then
		if var_21_0[2] then
			if var_21_0[2] > 3 and (var_21_0[2] ~= 1005 and var_21_0[2] ~= 1018 or smgr.currentSceneTag == SCENE_INSTANCE) then
				require("lua/layer/menu/ui")

				local function var_21_20()
					require("lua/guide/control")

					if guide.uiElementsTable[var_21_0[2]] then
						local var_23_0, var_23_1 = tool.getPositionInScreen(guide.uiElementsTable[var_21_0[2]])
						local var_23_2 = var_23_1 + guide.uiElementsTable[var_21_0[2]]:getContentSize().height

						guide.control.loadGuide2(3, var_23_0, var_23_2, true)
					else
						log.error("task/ui: no such ui element Id : ", var_21_0[2])
					end
				end

				if not menuUI.ui.isOpen then
					menuUI.ui.clickedMainItem(nil, nil, var_21_20)
				else
					var_21_20()
				end
			elseif var_21_0[2] == 1 and smgr.currentSceneTag == SCENE_WORLD or var_21_0[2] == 2 and smgr.currentSceneTag == SCENE_MAIN_CITY or var_21_0[2] == 3 and smgr.currentSceneTag == SCENE_INSTANCE then
				-- block empty
			else
				require("lua/guide/control")

				if guide.uiElementsTable[var_21_0[2]] then
					local var_21_21 = 3
					local var_21_22, var_21_23 = tool.getPositionInScreen(guide.uiElementsTable[var_21_0[2]])
					local var_21_24

					if var_21_0[2] > 5 then
						var_21_23 = var_21_23 + guide.uiElementsTable[var_21_0[2]]:getContentSize().height
						var_21_24 = 3
					else
						var_21_22 = var_21_22 - guide.uiElementsTable[var_21_0[2]]:getContentSize().width
						var_21_24 = 2
					end

					guide.control.loadGuide2(var_21_24, var_21_22, var_21_23, true)
				else
					log.error("task/ui: no such ui element Id : ", var_21_0[2])
				end
			end
		end
	elseif var_21_0[1] == "0" then
		log.info("dont need link")
	end
end

function taskUI.setVisible(arg_24_0)
	log.info("taskLayer set visible:", arg_24_0)
	smgr.getLayer("taskLayer"):setVisible(arg_24_0)
end

function taskUI.show(arg_25_0, arg_25_1)
	var_0_0.hideUI = arg_25_1 or false

	taskUI.initBasicUI()
	arg_25_0:registerScriptTouchHandler(var_0_0.onTouch)
	arg_25_0:setTouchEnabled(true)

	arg_25_0.onEnter = var_0_0.onEnter
	arg_25_0.onExit = var_0_0.onExit

	log.info("should show task ui")

	if arg_25_0.onEnter then
		arg_25_0.onEnter()
	end

	if user.curMainTask and tonumber(user.curMainTask.state) == 2 and tonumber(user.curMainTask.taskId) == 1 then
		roleDialogue.control.loadSpeak(20)
		var_0_0.addTaskToDataCache()

		user.player.isFirstTimeShowTask = false
	else
		var_0_0.checkHadFinishedTask()
	end

	var_0_0.doSomethingForTask()
end

function var_0_2.showNewTaskEffect(arg_26_0)
	local var_26_0 = {}

	if conf.language == "vie" or conf.language == "kr" or conf.language == "tha" then
		var_26_0.duration = 0.16
	else
		var_26_0.duration = 0.08
	end

	if var_0_2.newTaskAnimNode then
		pcall(var_0_2.newTaskAnimNode.removeFromParentAndCleanup, var_0_2.newTaskAnimNode, true)

		var_0_2.newTaskAnimNode = nil
	end

	local var_26_1 = rmgr.getAnimation("newTaskEffect")
	local var_26_2 = CCAnimation:createWithSpriteFrames(var_26_1, var_26_0.duration)
	local var_26_3 = CCAnimate:create(var_26_2)
	local var_26_4 = CCRepeat:create(var_26_3, 1)
	local var_26_5 = CCSprite:create()

	var_0_2.newTaskAnimNode = var_26_5

	log.info("newTaskAnimNode added to task layer")

	local var_26_6 = CCArray:create()

	var_26_6:addObject(var_26_4)

	local function var_26_7()
		if arg_26_0 then
			arg_26_0()
		end

		pcall(var_26_5.removeFromParentAndCleanup, var_26_5, true)

		var_26_5 = nil
	end

	var_26_6:addObject(CCCallFuncN:create(var_26_7))
	var_0_2.uiTable.taskButtonLayer:addChild(var_26_5, 1000)
	log.info("taskButtonLayer", var_0_2.uiTable.taskButtonLayer)
	log.info("newTaskAnimNode :", var_26_5)
	var_26_5:setPosition(ccp(44, 44))
	var_26_5:runAction(CCSequence:create(var_26_6))

	if conf.language == "vie" or conf.language == "kr" or conf.language == "tha" or conf.language == "ina" then
		local var_26_8 = CCSprite:create("res/ui/task/task_new.png")
		local var_26_9 = CCFadeIn:create(0.15)
		local var_26_10 = var_26_9:reverse()
		local var_26_11 = CCMoveBy:create(0.3, ccp(0, 20))

		log.info("newTaskAnimNode added to task layer")

		local var_26_12 = CCArray:create()

		var_26_12:addObject(var_26_9)
		var_26_12:addObject(var_26_11)
		var_26_12:addObject(var_26_10)
		var_26_5:addChild(var_26_8)
		var_26_8:setPosition(ccp(56, 120))
		var_26_8:runAction(CCSequence:create(var_26_12))
	end
end

local var_0_3 = 0

function var_0_2.setWeichengTaskSide(arg_28_0)
	if user.player.playerLv <= user.bstaskMinLevel then
		return
	end

	var_0_2.uiTable.weichengButtonLayer:setVisible(true)
	var_0_2.uiTable.weichengButtonLayer:removeChildByTag(1234, true)
	var_0_2.uiTable.bstaskNumberLabel:setVisible(false)

	if arg_28_0.leftTime > 0 and arg_28_0.state ~= 1 then
		local var_28_0 = createTimerLabel(arg_28_0.leftTime, "@H:@M:@S", "Thonburi-Bold", 24, nil)

		var_0_2.bsTaskTimer = var_28_0

		var_0_2.uiTable.weichengButtonLayer:addChild(var_28_0, 10, 1234)
		var_28_0:setPosition(44, -8)

		if arg_28_0.curCityNum and arg_28_0.target then
			taskControl.bstask.defCityNum = arg_28_0.curCityNum
			var_0_3 = arg_28_0.target

			var_0_2.uiTable.bstaskNumberLabel:setVisible(true)
			var_0_2.uiTable.bstaskNumberLabel:setString(arg_28_0.curCityNum .. "/" .. arg_28_0.target)
		end
	end

	if arg_28_0.serial == 1 then
		if user.player.forceId == arg_28_0.attForceId then
			taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_wmjs.png"):displayFrame())
		elseif user.player.forceId == arg_28_0.defForceId then
			taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_jszd.png"):displayFrame())
		else
			taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_wwjz.png"):displayFrame())
		end
	elseif arg_28_0.serial == 2 then
		if user.player.forceId == arg_28_0.attForceId then
			taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_yfss.png"):displayFrame())
		elseif user.player.forceId == arg_28_0.defForceId then
			taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_tpcw.png"):displayFrame())
		else
			taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_wwjz.png"):displayFrame())
		end
	elseif arg_28_0.serial == 3 then
		taskUI.uiTable.weichengTaskTitleTexturePic:setDisplayFrame(CCSprite:create("res/ui/nationTask/weicheng/wc_rw_tit_zbmm.png"):displayFrame())
	end

	taskUI.uiTable.weichengTaskTitleTexturePic:setPosition(ccp(75, 45))

	if arg_28_0.state ~= 1 then
		taskUI.uiTable.weichengtaskIcon:setDisplayFrame(CCSprite:create("res/ui/task/nation_task.png"):displayFrame())
	else
		taskUI.uiTable.weichengtaskIcon:setDisplayFrame(CCSprite:create("res/ui/task/nation_task_finished.png"):displayFrame())
	end
end

function var_0_2.setBuildNationTaskSide(arg_29_0)
	showTable(arg_29_0)

	if arg_29_0 == nil then
		var_0_2.uiTable.buildNationButtonLayer:setVisible(false)

		return
	end

	var_0_2.uiTable.buildNationButtonLayer:setVisible(true)
	var_0_2.uiTable.buildNationButtonLayer:removeChildByTag(1234, true)

	if arg_29_0.state ~= -1 and arg_29_0.endTime and arg_29_0.endTime > 0 then
		local var_29_0 = createTimerLabel(arg_29_0.endTime, "@H:@M:@S", "Thonburi-Bold", 24, nil)

		var_0_2.kbTaskTimer = var_29_0

		var_0_2.uiTable.buildNationButtonLayer:addChild(var_29_0, 10, 1234)
		var_29_0:setPosition(44, -8)
	elseif arg_29_0.state == -1 and arg_29_0.startTime and arg_29_0.startTime > 0 then
		local var_29_1 = createTimerLabel(arg_29_0.startTime, "@H:@M:@S", "Thonburi-Bold", 24, nil)

		var_0_2.kbTaskTimer = var_29_1

		var_0_2.uiTable.buildNationButtonLayer:addChild(var_29_1, 10, 1234)
		var_29_1:setPosition(44, -8)
	end

	if arg_29_0.state ~= 1 and arg_29_0.state ~= 2 then
		taskUI.uiTable.buildNaitonPic:setDisplayFrame(CCSprite:create("res/ui/task/nation_task.png"):displayFrame())
	else
		taskUI.uiTable.buildNaitonPic:setDisplayFrame(CCSprite:create("res/ui/task/nation_task_finished.png"):displayFrame())
	end

	if arg_29_0.type then
		if tonumber(arg_29_0.type) == 1 or arg_29_0.type == 1 then
			var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/task_icon_cbjz.png"):displayFrame())
			var_0_2.uiTable.buildNaitonWord:setPosition(ccp(70, 49))
		elseif tonumber(arg_29_0.type) == 2 or arg_29_0.type == 2 then
			var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/task_icon_gcqz.png"):displayFrame())
			var_0_2.uiTable.buildNaitonWord:setPosition(ccp(70, 49))
		elseif tonumber(arg_29_0.type) == 3 or arg_29_0.type == 3 then
			if user.kbLv >= 1 then
				var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/ejwc_word_jzbl.png"):displayFrame())
			else
				var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/task_icon_jzys.png"):displayFrame())
			end

			var_0_2.uiTable.buildNaitonWord:setPosition(ccp(70, 49))
		elseif tonumber(arg_29_0.type) == 4 or arg_29_0.type == 4 then
			if arg_29_0.isEnemyTask ~= true then
				var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/ejwc_word_jsbl.png"):displayFrame())
			else
				var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/ejwc_word_qltj.png"):displayFrame())
			end

			var_0_2.uiTable.buildNaitonWord:setPosition(ccp(70, 49))
		else
			var_0_2.uiTable.buildNaitonWord:setDisplayFrame(CCSprite:create("res/ui/nation/buildNation/mainTask/task_icon_jg.png"):displayFrame())
			var_0_2.uiTable.buildNaitonWord:setPosition(ccp(66, 73))
		end
	end
end

function var_0_2.setJungongTaskSide(arg_30_0)
	if arg_30_0 then
		var_0_2.uiTable.jungongButtonLayer:setVisible(true)
		eventManager.dispatchEvent("chgJunGongButton", true)
		var_0_2.uiTable.jungongButtonLayer:removeChildByTag(1234, true)
		var_0_2.uiTable.jungongPic:setDisplayFrame(CCSprite:create("res/ui/task/nation_task.png"):displayFrame())

		if arg_30_0.taskState == -1 then
			var_0_2.uiTable.jungongTaskProcess:setVisible(false)
			var_0_2.uiTable.jungongWord:setDisplayFrame(CCSprite:create("res/ui/jungong/mrjw_task_word_zwjw.png"):displayFrame())

			local var_30_0 = createTimerLabel(arg_30_0.cd or 0, "@H:@M:@S", "Thonburi-Bold", 24, nil, nil, nil, ccc3(255, 255, 255))

			var_0_2.uiTable.jungongTimer = var_30_0

			var_0_2.uiTable.jungongButtonLayer:addChild(var_30_0, 10, 1234)
			var_30_0:setPosition(44, -8)
		elseif arg_30_0.taskState == 0 then
			var_0_2.uiTable.jungongTaskProcess:setVisible(true)
			var_0_2.uiTable.jungongTaskProcess:setString(arg_30_0.finishTaskNum .. "/" .. arg_30_0.totalTaskNum)
			var_0_2.uiTable.jungongTaskProcess:setColor(ccc3(0, 255, 0))
			var_0_2.uiTable.jungongWord:setDisplayFrame(CCSprite:create("res/ui/jungong/mrjw_task_word_xjw.png"):displayFrame())
		elseif arg_30_0.taskState == 1 then
			var_0_2.uiTable.jungongTaskProcess:setVisible(true)
			var_0_2.uiTable.jungongTaskProcess:setString(tool.toint(arg_30_0.currProcess / arg_30_0.targetProcess * 100) .. "%")
			var_0_2.uiTable.jungongTaskProcess:setColor(ccc3(255, 0, 0))
			var_0_2.uiTable.jungongWord:setDisplayFrame(CCSprite:create("res/ui/jungong/mrjw_task_word_jgrw.png"):displayFrame())

			local var_30_1 = createTimerLabel(arg_30_0.cd or 0, "@H:@M:@S", "Thonburi-Bold", 24, nil, nil, nil, ccc3(255, 0, 0))

			var_0_2.uiTable.jungongTimer = var_30_1

			var_0_2.uiTable.jungongButtonLayer:addChild(var_30_1, 10, 1234)
			var_30_1:setPosition(44, -8)
		elseif arg_30_0.taskState == 2 then
			var_0_2.uiTable.jungongTaskProcess:setVisible(true)
			var_0_2.uiTable.jungongTaskProcess:setString("100%")
			var_0_2.uiTable.jungongTaskProcess:setColor(ccc3(0, 255, 0))
			var_0_2.uiTable.jungongWord:setDisplayFrame(CCSprite:create("res/ui/jungong/mrjw_task_word_jgrw.png"):displayFrame())
			var_0_2.uiTable.jungongPic:setDisplayFrame(CCSprite:create("res/ui/task/nation_task_finished.png"):displayFrame())
			var_0_2.showJungongFlyWord(2)
		elseif arg_30_0.taskState == 3 then
			var_0_2.uiTable.jungongTaskProcess:setVisible(true)
			var_0_2.uiTable.jungongTaskProcess:setString(arg_30_0.finishTaskNum .. "/" .. arg_30_0.totalTaskNum)
			var_0_2.uiTable.jungongTaskProcess:setColor(ccc3(0, 255, 0))
			var_0_2.uiTable.jungongWord:setDisplayFrame(CCSprite:create("res/ui/jungong/mrjw_task_word_gzzj.png"):displayFrame())
		else
			var_0_2.uiTable.jungongTaskProcess:setVisible(false)
			var_0_2.uiTable.jungongWord:setDisplayFrame(CCSprite:create("res/ui/jungong/mrjw_task_word_zwjw.png"):displayFrame())
			var_0_2.uiTable.jungongButtonLayer:setVisible(false)
			eventManager.dispatchEvent("chgJunGongButton", false)
		end
	else
		var_0_2.uiTable.jungongButtonLayer:setVisible(false)
		eventManager.dispatchEvent("chgJunGongButton", false)
	end
end

function var_0_2.setkillAllTaskSide(arg_31_0)
	if user.hasKillAllTask ~= true then
		var_0_2.uiTable.killAllButtonLayer:setVisible(false)

		return
	end

	var_0_2.uiTable.killAllButtonLayer:setVisible(true)
	var_0_2.uiTable.killAllButtonLayer:removeChildByTag(1234, true)
	var_0_2.uiTable.killAllTaskNumberLabel:setVisible(false)

	arg_31_0.deadTime = arg_31_0.deadTime or arg_31_0.endTime

	if arg_31_0.deadTime > 0 and arg_31_0.taskState ~= 1 then
		local var_31_0 = createTimerLabel(arg_31_0.deadTime, "@H:@M:@S", "Thonburi-Bold", 24, nil)

		var_0_2.uiTable.killAllButtonLayer:addChild(var_31_0, 10, 1234)
		var_31_0:setPosition(44, -8)

		if arg_31_0.currentNum and arg_31_0.target then
			var_0_2.uiTable.killAllTaskNumberLabel:setVisible(true)
			var_0_2.uiTable.killAllTaskNumberLabel:setString(arg_31_0.currentNum .. "/" .. arg_31_0.target)

			local var_31_1 = tool.hexToRgb("#FD6262")

			if arg_31_0.currentNum <= arg_31_0.target then
				var_31_1 = tool.hexToRgb("#72DF37")
			end

			var_0_2.uiTable.killAllTaskNumberLabel:setColor(var_31_1)
		end
	end

	local var_31_2 = "nation_task.png"

	if arg_31_0.canGetReward == true or arg_31_0.hasReward == true then
		var_31_2 = "nation_task_finished.png"
	end

	taskUI.uiTable.killAllTaskIcon:setDisplayFrame(CCSprite:create("res/ui/task/" .. var_31_2):displayFrame())
end

function var_0_2.showJungongPanel()
	local var_32_0 = user.player.jungong

	if var_32_0.taskState == -1 or var_32_0.taskState == 3 then
		return
	end

	local var_32_1 = createBaseLayer()
	local var_32_2 = smgr.getLayer("topLayer")

	var_32_2:removeAllChildrenWithCleanup(true)
	var_32_2:addChild(var_32_1)

	local var_32_3 = {}
	local var_32_4 = {
		resource = {}
	}
	local var_32_5 = 1

	if var_32_0 then
		for iter_32_0, iter_32_1 in pairs(var_32_0.rewardList) do
			var_32_4.resource[var_32_5] = {}
			var_32_4.resource[var_32_5].type = iter_32_1.type
			var_32_4.resource[var_32_5].value = iter_32_1.num
		end
	end

	local var_32_6 = autoUI.createUI(var_32_1, getJungongPanel(var_32_4), var_32_3)

	if var_32_0 then
		var_32_3.jungongNameLabel:setString(var_32_0.name)
		var_32_3.jungongIntroLongLabel:setString(var_32_0.intro)
	end

	if var_32_0.taskState == 0 then
		var_32_3.jungongBeginButton:setVisible(true)
	else
		var_32_3.jungongBeginButton:setVisible(false)
	end

	if var_32_0.taskState == 1 then
		var_32_3.jungongCancelButton:setVisible(true)
		var_32_3.jungongCancelLb:setVisible(true)
		var_32_3.jungongQuickFinishButton:setVisible(true)
		var_32_3.jungongQuickLb:setVisible(true)
		var_32_3.goldIcon:setVisible(true)
		var_32_3.goldNumLb:setString("x" .. user.player.jungong.goldFastForceTask)
	else
		var_32_3.jungongCancelButton:setVisible(false)
		var_32_3.jungongCancelLb:setVisible(false)
		var_32_3.jungongQuickFinishButton:setVisible(false)
		var_32_3.jungongQuickLb:setVisible(false)
		var_32_3.goldIcon:setVisible(false)
	end

	if var_32_0.taskState == 2 then
		var_32_3.jungongRewardButton:setVisible(true)
		var_32_3.jungongFinished:setVisible(true)
	else
		var_32_3.jungongRewardButton:setVisible(false)
		var_32_3.jungongFinished:setVisible(false)
	end

	local function var_32_7(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == CCTOUCHBEGAN then
			if checkIfTouch(var_32_3.jungongPanel, arg_33_1, arg_33_2) then
				-- block empty
			else
				var_32_2:removeAllChildrenWithCleanup(true)
			end

			return true
		end
	end

	var_32_1:registerScriptTouchHandler(var_32_7, false, true)
	var_32_1:setTouchEnabled(true)
end

function var_0_2.showJungongFlyWord(arg_34_0)
	local var_34_0 = smgr.getLayer("tipLayer")
	local var_34_1 = CCSprite:create("res/ui/saotao/stfx_long_bg.png")

	var_34_1:setScale(0.6)

	local var_34_2 = CCSprite:create("res/ui/jungong/mrjw_word_rwsb.png")

	if arg_34_0 == 1 then
		var_34_2 = CCSprite:create("res/ui/jungong/mrjw_word_rwks.png")
	elseif arg_34_0 == 2 then
		var_34_2 = CCSprite:create("res/ui/jungong/mrjw_word_rwwc.png")
	end

	var_34_2:setScale(1.7)
	var_34_2:setPosition(ccp(454, 80))
	var_34_1:addChild(var_34_2)
	var_34_1:setPosition(ccp(0 - var_34_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_34_0:addChild(var_34_1)

	local function var_34_3()
		var_34_0:removeChild(var_34_1, true)
	end

	local var_34_4 = CCArray:create()

	var_34_4:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_34_4:addObject(CCDelayTime:create(1))
	var_34_4:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width + var_34_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_34_4:addObject(CCCallFuncN:create(var_34_3))

	local var_34_5 = CCSequence:create(var_34_4)

	var_34_1:runAction(var_34_5)
end

function var_0_2.setWeichengCityNum(arg_36_0)
	var_0_2.uiTable.bstaskNumberLabel:setString(arg_36_0 .. "/" .. var_0_3)
end

function var_0_2.showXiaoqianWeichengDialogue(arg_37_0, arg_37_1)
	local function var_37_0(arg_38_0)
		if arg_38_0 == 1 then
			return language.get(95016)
		elseif arg_38_0 == 2 then
			return language.get(95017)
		elseif arg_38_0 == 3 then
			return language.get(95018)
		end

		return "#"
	end

	taskControl.bstask.att = var_37_0(arg_37_0.attForce)
	taskControl.bstask.def = var_37_0(arg_37_0.defForce)
	taskControl.bstask.sup = var_37_0(arg_37_0.supportForce)

	log.info("显示围城小倩对话")

	if arg_37_1 and arg_37_1 == true then
		if smgr.currentSceneTag ~= SCENE_WORLD then
			roleDialogue.control.loadSpeak(1819)
		end

		if user.player.forceId == arg_37_0.attForce then
			roleDialogue.control.loadSpeak(1803)
		elseif user.player.forceId == arg_37_0.defForce then
			roleDialogue.control.loadSpeak(1804)
		elseif user.player.forceId == arg_37_0.supportForce then
			roleDialogue.control.loadSpeak(1805)
		end
	elseif arg_37_0.serial == 1 then
		if arg_37_0.isWin == true then
			if user.player.forceId == arg_37_0.attForce then
				roleDialogue.control.loadSpeak(1806)
			elseif user.player.forceId == arg_37_0.defForce then
				roleDialogue.control.loadSpeak(1808)
			elseif user.player.forceId == arg_37_0.supportForce then
				roleDialogue.control.loadSpeak(1810)
			end
		elseif user.player.forceId == arg_37_0.attForce then
			roleDialogue.control.loadSpeak(1807)
		elseif user.player.forceId == arg_37_0.defForce then
			roleDialogue.control.loadSpeak(1809)
		elseif user.player.forceId == arg_37_0.supportForce then
			roleDialogue.control.loadSpeak(1811)
		end
	elseif arg_37_0.serial == 2 then
		if arg_37_0.isWin == true then
			if user.player.forceId == arg_37_0.attForce then
				roleDialogue.control.loadSpeak(1812)
			elseif user.player.forceId == arg_37_0.defForce then
				roleDialogue.control.loadSpeak(1814)
			elseif user.player.forceId == arg_37_0.supportForce then
				roleDialogue.control.loadSpeak(1816)
			end
		elseif user.player.forceId == arg_37_0.attForce then
			roleDialogue.control.loadSpeak(1813)
		elseif user.player.forceId == arg_37_0.defForce then
			roleDialogue.control.loadSpeak(1815)
		elseif user.player.forceId == arg_37_0.supportForce then
			roleDialogue.control.loadSpeak(1817)
		end
	elseif arg_37_0.serial == 3 and arg_37_0.isWin == true then
		roleDialogue.control.loadSpeak(1818)
	end
end

function var_0_2.showWeichengAction()
	local var_39_0 = smgr.getLayer("effectlayer")
	local var_39_1 = CCSprite:create("res/ui/nationTask/weicheng/wrd.png")

	var_39_1:setPosition(ccp(visibleSize.width + var_39_1:getContentSize().width * 0.5, visibleSize.height * 0.5))
	var_39_0:addChild(var_39_1)

	local var_39_2 = CCSprite:create("res/ui/nationTask/weicheng/wc_tit_wcrwks.png")

	var_39_2:setPosition(ccp(var_39_1:getContentSize().width * 0.5, var_39_1:getContentSize().height * 1.1))
	var_39_1:addChild(var_39_2, 10)

	local function var_39_3()
		var_39_0:removeChild(var_39_1, true)
	end

	local var_39_4 = rmgr.getSpeedEffectAnimation()
	local var_39_5 = CCAnimation:createWithSpriteFrames(var_39_4, 0.08)
	local var_39_6 = CCAnimate:create(var_39_5)
	local var_39_7 = CCRepeatForever:create(var_39_6)
	local var_39_8 = CCSprite:create()

	var_39_8:runAction(var_39_7)
	var_39_8:setPosition(ccp(var_39_1:getContentSize().width * 0.5, var_39_1:getContentSize().height * 0.5))
	var_39_1:addChild(var_39_8)

	local var_39_9 = CCArray:create()

	var_39_9:addObject(CCMoveTo:create(0.5, ccp(visibleSize.width * 0.5, visibleSize.height * 0.5)))
	var_39_9:addObject(CCDelayTime:create(2))
	var_39_9:addObject(CCMoveTo:create(0.5, ccp(0 - var_39_1:getContentSize().width * 0.5, visibleSize.height * 0.5)))
	var_39_9:addObject(CCCallFuncN:create(var_39_3))

	local var_39_10 = CCSequence:create(var_39_9)

	var_39_1:runAction(var_39_10)
end

function var_0_2.showThunderTaskAction(arg_41_0)
	if user.player.playerLv < 40 then
		return
	end

	local var_41_0 = CCSprite:create("res/ui/nationTask/thunder/lxgs_0000s_0000_shandianzhan.png")
	local var_41_1

	if arg_41_0.state == 0 then
		log.info("闪电战开始")

		var_41_1 = CCSprite:create("res/ui/nationTask/thunder/lxgs_0000s_0002_kaizhan.png")

		if arg_41_0.attType and arg_41_0.attType == 0 then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD, arg_41_0.city)
			roleDialogue.control.loadSpeak(1906)
		elseif arg_41_0.attType and arg_41_0.attType == 1 then
			smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
			loadingLayer.show(SCENE_WORLD, arg_41_0.city)
			roleDialogue.control.loadSpeak(1907)
		end
	elseif arg_41_0.state == 1 then
		log.info("闪电战失败")

		var_41_1 = CCSprite:create("res/ui/nationTask/thunder/lxgs_0000s_0010_shibai.png")

		if arg_41_0.attType and arg_41_0.attType == 0 then
			roleDialogue.control.loadSpeak(1902)
		elseif arg_41_0.attType and arg_41_0.attType == 1 then
			roleDialogue.control.loadSpeak(1901)
		end
	elseif arg_41_0.state == 2 then
		log.info("闪电战胜利")

		var_41_1 = CCSprite:create("res/ui/nationTask/thunder/lxgs_0000s_0001_shengli.png")

		if arg_41_0.attType and arg_41_0.attType == 0 then
			roleDialogue.control.loadSpeak(1900)
		elseif arg_41_0.attType and arg_41_0.attType == 1 then
			roleDialogue.control.loadSpeak(1903)
		end
	end

	if arg_41_0.attType == 0 or arg_41_0.attType == 1 then
		local var_41_2 = CCSprite:create("res/ui/nationTask/thunder/lxgs_samll_bg.png")

		var_41_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.65))

		local var_41_3 = createRichNode({
			var_41_0,
			var_41_1
		}, 0.5)

		var_41_3:setPosition(ccp(var_41_2:getContentSize().width / 2, var_41_2:getContentSize().height / 2))
		var_41_2:addChild(var_41_3)
		smgr.getLayer("pushLayer"):addChild(var_41_2)

		local var_41_4 = CCArray:create()

		var_41_4:addObject(CCFadeIn:create(0.5))
		var_41_4:addObject(CCDelayTime:create(2))
		var_41_4:addObject(CCFadeOut:create(0.5))
		var_41_4:addObject(CCCallFunc:create(function()
			var_41_2:removeFromParentAndCleanup(true)
		end))
		var_41_2:runAction(CCSequence:create(var_41_4))
	end
end

function var_0_2.showNewTaskEffect2(arg_43_0)
	if user.player.playerLv < 29 then
		return
	end

	if taskUI.uiTable.taskButtonItem then
		local var_43_0, var_43_1 = tool.getPositionInScreen(taskUI.uiTable.taskButtonItem)

		guide.control.loadGuide2(8, var_43_0 + 150, var_43_1, true, language.get(200128))
	end
end
