local var_0_0 = {
	[1901] = 1901,
	[1902] = 1902,
	[237] = 237,
	[17] = 7,
	[1905] = 1905,
	[21] = 55,
	[1904] = 1904,
	[10] = 6,
	[4] = 4,
	[1903] = 1903
}
local var_0_1 = class("taskTabControl")
local var_0_2
local var_0_3 = false

function var_0_1.ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.initFunc = arg_1_2
	arg_1_0.type = arg_1_1

	arg_1_0:getTaskInfo(arg_1_0.type)
end

function var_0_1.getTaskInfo(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0)
		local var_3_0 = arg_3_0.action.data

		log.info(tool.tableToJson(arg_3_0))

		if arg_2_1 == nil then
			local var_3_1 = require("lua/common/json")

			for iter_3_0 = #var_3_0.tasks, 1, -1 do
				local var_3_2 = var_3_0.tasks[iter_3_0]

				if var_3_2.taskType == taskTabConstant.TYPES.NATION_TASK_ZCCG then
					if var_3_2.canGetReward == true or var_3_2.deadTime > 0 then
						if user.hasKillAllTask ~= true then
							user.hasKillAllTask = true

							nationUI.show(2)
						end
					elseif user.hasKillAllTask == true then
						user.hasKillAllTask = false
					end

					taskUI.setkillAllTaskSide(var_3_2)
					table.remove(var_3_0.tasks, iter_3_0)
				else
					arg_2_0.taskType = var_3_2.taskType
				end
			end

			arg_2_0.data = var_3_0
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_TRY_TASK then
			arg_2_0.data = var_3_0
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_UPGRADE_TASK then
			arg_2_0.data = var_3_0
		elseif arg_2_1 == taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK then
			arg_2_0.data = var_3_0
		end

		arg_2_0.initFunc(arg_2_0)

		if user.curNationTask and user.curNationTask.tasks and #user.curNationTask.tasks > 0 then
			taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_NATION)
		else
			taskUI.updateTaskButtonLayer(taskConstant.TASK_TYPE_ID_MAIN_BRANCH)
		end
	end

	if arg_2_1 == nil then
		cmgr.sendRequest(var_2_0, actions.getCurRankInfo, 1)
	elseif arg_2_1 == taskTabConstant.TYPES.NATION_TRY_TASK then
		cmgr.sendRequest(var_2_0, actions.getTryInfo)
	elseif arg_2_1 == taskTabConstant.TYPES.NATION_UPGRADE_TASK then
		cmgr.sendRequest(var_2_0, actions.getCurRankInfo, 0)
	elseif arg_2_1 == taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK then
		cmgr.sendRequest(var_2_0, actions.getProtectInfo)
	end
end

function var_0_1.investCopper(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {}

		if arg_5_0.action.data.exp > 0 then
			local var_5_1 = {}

			var_5_1.id = 6
			var_5_1.value = arg_5_0.action.data.exp

			table.insert(var_5_0, var_5_1)
		end

		if arg_5_0.action.data.expExtra > 0 then
			local var_5_2 = {}

			var_5_2.id = 6
			var_5_2.value = arg_5_0.action.data.expExtra

			table.insert(var_5_0, var_5_2)
		end

		globalAction_gotResource(var_5_0)
		arg_4_0:getTaskInfo(nil)
	end

	local function var_4_1(arg_6_0)
		arg_4_0:getTaskInfo(nil)
	end

	local function var_4_2(arg_7_0)
		local var_7_0 = arg_7_0.action.data.gold

		messageBox.showChargeWin("", language.get(94001, var_7_0), "copperInvest", function()
			cmgr.sendRequest(var_4_1, actions.investCdConfirm)
		end)
	end

	local var_4_3 = arg_4_0.data.tasks[1]

	if var_4_3.cd > var_4_3.cdToUnable then
		if not user.chargeItems.copperInvest.noDisturb then
			cmgr.sendRequest(var_4_2, actions.investCdRecover)
		else
			cmgr.sendRequest(var_4_1, actions.investCdConfirm)
		end
	else
		cmgr.sendRequest(var_4_0, actions.investCopper)
	end
end

function var_0_1.getNationTaskReward(arg_9_0, arg_9_1)
	amgr.playEffect(enumAudioFile.ui_click_award, false)

	local function var_9_0(arg_10_0)
		amgr.playEffect(enumAudioFile.ui_get_award, false)

		local var_10_0 = arg_10_0.action.data
		local var_10_1 = {}

		for iter_10_0, iter_10_1 in pairs(var_10_0.rewards) do
			if var_0_0[iter_10_1.type] then
				local var_10_2 = {
					id = var_0_0[iter_10_1.type],
					value = iter_10_1.value
				}

				table.insert(var_10_1, var_10_2)
			end
		end

		if var_10_0.hasExtra then
			for iter_10_2, iter_10_3 in pairs(var_10_0.extraRewards) do
				if var_0_0[iter_10_3.type] then
					local var_10_3 = {
						id = var_0_0[iter_10_3.type],
						value = iter_10_3.value
					}

					table.insert(var_10_1, var_10_3)
				end
			end
		end

		if var_10_0.indivRewards then
			for iter_10_4, iter_10_5 in pairs(var_10_0.indivRewards) do
				if var_0_0[iter_10_5.type] then
					local var_10_4 = {
						id = var_0_0[iter_10_5.type],
						value = iter_10_5.value
					}

					table.insert(var_10_1, var_10_4)
				end
			end
		end

		if var_10_0.predicateExtraRewards then
			for iter_10_6, iter_10_7 in pairs(var_10_0.predicateExtraRewards) do
				if var_0_0[iter_10_7.type] then
					local var_10_5 = {
						id = var_0_0[iter_10_7.type],
						value = iter_10_7.value
					}

					table.insert(var_10_1, var_10_5)
				end
			end
		end

		globalAction_gotResource(var_10_1)
		arg_9_0:getTaskInfo(arg_9_0.type)
		eventManager.dispatchEvent("nationTaskDidDrawReward", arg_9_1)
	end

	cmgr.sendRequest(var_9_0, actions.getNationTaskReward, arg_9_1)
end

function var_0_1.getIndivReward(arg_11_0, arg_11_1)
	local function var_11_0(arg_12_0)
		local var_12_0 = {}

		for iter_12_0, iter_12_1 in ipairs(arg_11_1.rewards) do
			local var_12_1 = {
				id = var_0_0[iter_12_1.rewardType],
				value = iter_12_1.rewardNum
			}

			table.insert(var_12_0, var_12_1)
		end

		globalAction_gotResource(var_12_0)
		arg_11_0:getTaskInfo(arg_11_0.type)
		eventManager.dispatchEvent("nationTaskDidChanged")
	end

	cmgr.sendRequest(var_11_0, actions.getIndivReward, arg_11_1.id)
end

function var_0_1.getExtraReward(arg_13_0)
	local function var_13_0(arg_14_0)
		local var_14_0 = arg_14_0.action.data
		local var_14_1 = {}

		for iter_14_0, iter_14_1 in ipairs(var_14_0.predicateExtraRewards) do
			local var_14_2 = {
				id = var_0_0[iter_14_1.type],
				value = iter_14_1.value
			}

			table.insert(var_14_1, var_14_2)
		end

		globalAction_gotResource(var_14_1)
		arg_13_0:getTaskInfo(arg_13_0.type)
	end

	cmgr.sendRequest(var_13_0, actions.getVoteReward)
end

function var_0_1.getTryTaskReward(arg_15_0)
	amgr.playEffect(enumAudioFile.ui_click_award, false)

	local function var_15_0(arg_16_0)
		amgr.playEffect(enumAudioFile.ui_get_award, false)

		local var_16_0 = arg_16_0.action.data.rankExp
		local var_16_1 = arg_16_0.action.data.winExp
		local var_16_2 = arg_16_0.action.data.rankIron
		local var_16_3 = arg_16_0.action.data.winIron
		local var_16_4 = {}

		if var_16_0 and var_16_0 > 0 then
			var_16_4[#var_16_4 + 1] = {}
			var_16_4[#var_16_4].id = 6
			var_16_4[#var_16_4].value = var_16_0
		end

		if var_16_1 and var_16_1 > 0 then
			var_16_4[#var_16_4 + 1] = {}
			var_16_4[#var_16_4].id = 6
			var_16_4[#var_16_4].value = var_16_1
		end

		if var_16_2 and var_16_2 > 0 then
			var_16_4[#var_16_4 + 1] = {}
			var_16_4[#var_16_4].id = 4
			var_16_4[#var_16_4].value = var_16_2
		end

		if var_16_3 and var_16_3 > 0 then
			var_16_4[#var_16_4 + 1] = {}
			var_16_4[#var_16_4].id = 4
			var_16_4[#var_16_4].value = var_16_3
		end

		globalAction_gotResource(var_16_4)

		local var_16_5 = smgr.getLayer("nationLayer")

		smgr.getLayer("topLayer"):removeChild(var_16_5, true)
	end

	cmgr.sendRequest(var_15_0, actions.nationGetReward)
end

function var_0_1.investLantern(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		arg_17_0:getTaskInfo(nil)
	end

	cmgr.sendRequest(var_17_0, actions.investLantern, arg_17_1)
end

function var_0_1.moveNationTask1(arg_19_0, arg_19_1)
	local function var_19_0()
		var_0_3 = false
	end

	currentGongshouCityPage = 2
	var_0_3 = true

	local var_19_1 = CCArray:create()

	var_19_1:addObject(CCMoveTo:create(0.4, ccp(-750, 0)))
	var_19_1:addObject(CCCallFuncN:create(var_19_0))

	local var_19_2 = CCSequence:create(var_19_1)

	arg_19_1.uiTable.gongshourenwu_scoll_layer:runAction(var_19_2)
	arg_19_1:setTitle()
end

function var_0_1.moveNationTask2(arg_21_0, arg_21_1)
	local function var_21_0()
		var_0_3 = false
	end

	currentGongshouCityPage = 1
	var_0_3 = true

	local var_21_1 = CCArray:create()

	var_21_1:addObject(CCMoveTo:create(0.4, ccp(0, 0)))
	var_21_1:addObject(CCCallFuncN:create(var_21_0))

	local var_21_2 = CCSequence:create(var_21_1)

	arg_21_1.uiTable.gongshourenwu_scoll_layer:runAction(var_21_2)
	arg_21_1:setTitle()
end

function var_0_1.onEnter(arg_23_0)
	var_0_3 = false

	log.info("taskTabControl on enter")
end

function var_0_1.onExit(arg_24_0)
	var_0_3 = false

	log.info("taskTabControl on exit")
end

function var_0_1.onTouch(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	if arg_25_2 == CCTOUCHBEGAN then
		var_0_2 = arg_25_3

		if arg_25_0.taskType == 1 then
			for iter_25_0, iter_25_1 in pairs(arg_25_0.data.tasks) do
				if iter_25_1.rankNum == 0 then
					-- block empty
				elseif iter_25_1.taskState == 0 and arg_25_1.uiTable["taskTitle_" .. iter_25_0] and tool.checkIfTouch(arg_25_1.uiTable["taskTitle_" .. iter_25_0], arg_25_3, arg_25_4) then
					arg_25_1.uiTable["jiangli_tips_" .. iter_25_0]:setVisible(true)
				end
			end
		end

		if arg_25_0.data and arg_25_0.data.tasks and arg_25_0.data.tasks[1] ~= nil and arg_25_0.data.tasks[1].taskState == 0 then
			if arg_25_0.data.tasks[1].rankNum > 0 and arg_25_1.uiTable.taskTitleOutBoard and tool.checkIfTouch(arg_25_1.uiTable.taskTitleOutBoard, arg_25_3, arg_25_4) then
				arg_25_1.uiTable.jiangli_tips:setVisible(true)
			end

			if arg_25_1.uiTable.donateProgressBg and tool.checkIfTouch(arg_25_1.uiTable.donateProgressBg, arg_25_3, arg_25_4) then
				arg_25_1.uiTable.info_tips:setVisible(true)
			end
		end

		if arg_25_0.taskType == 12 then
			log.info("制作元宵, CCTOUCHBEGAN, x:%s, y:%s", arg_25_3, arg_25_4)

			local var_25_0
			local var_25_1
			local var_25_2 = arg_25_0.data.tasks[1]

			for iter_25_2 = 1, 3 do
				if tool.checkIfTouch(arg_25_1.uiTable["res_pic" .. iter_25_2], arg_25_3, arg_25_4) then
					local var_25_3 = language.get(taskTabConstant.LANTERN_RES[var_25_2.serial][iter_25_2])

					var_25_0 = language.get(taskTabConstant.LANTERN_RES_INFO[user.player.forceId][iter_25_2], var_25_3)
					var_25_1 = ccp(180, 370 - 140 * (iter_25_2 - 1))

					break
				end
			end

			if not var_25_0 and tool.checkIfTouch(arg_25_1.uiTable.bowl, arg_25_3, arg_25_4) then
				local var_25_4 = language.get(135340 + var_25_2.serial)

				var_25_0 = language.get(135333, var_25_4)
				var_25_1 = ccp(550, 320)
			end

			if not var_25_0 and tool.checkIfTouch(arg_25_1.uiTable.mask_tips, arg_25_3, arg_25_4) then
				if arg_25_1.uiTable.rightBg:isVisible() then
					var_25_0 = language.get(135334)
				else
					local var_25_5 = language.get(91008 + var_25_2.force1st)

					var_25_0 = language.get(135355, var_25_5)
				end

				var_25_1 = ccp(620, 360)
			end

			log.info("zhu@@@show_tips", var_25_0)

			if var_25_0 then
				arg_25_1.uiTable.info_msg:setString(var_25_0)

				local var_25_6 = arg_25_1.uiTable.info_msg:getContentSize()
				local var_25_7 = var_25_6.width
				local var_25_8 = var_25_6.height

				arg_25_1.uiTable.info_tips:setPreferredSize(CCSizeMake(var_25_7 + 30, var_25_8 + 30))
				arg_25_1.uiTable.info_tips:setPosition(var_25_1)
				arg_25_1.uiTable.info_msg:setPosition(ccp(15, 15))
				arg_25_1.uiTable.info_tips:setVisible(true)
			end
		end

		return true
	elseif arg_25_2 == CCTOUCHENDED then
		if arg_25_0.taskType == 1 then
			for iter_25_3, iter_25_4 in pairs(arg_25_0.data.tasks) do
				if arg_25_0.data.tasks[iter_25_3] and arg_25_0.data.tasks[iter_25_3].taskState == 0 then
					if arg_25_1.uiTable["taskCityTarget_" .. iter_25_3] and tool.checkIfTouch(arg_25_1.uiTable["taskCityTarget_" .. iter_25_3].label, arg_25_3, arg_25_4) then
						local var_25_9 = smgr.getLayer("nationLayer")

						smgr.getLayer("topLayer"):removeChild(var_25_9, true)
						loadingLayer.show(SCENE_WORLD, iter_25_4.cityId)

						return
					end

					if arg_25_1.uiTable["jiangli_tips_" .. iter_25_3] then
						arg_25_1.uiTable["jiangli_tips_" .. iter_25_3]:setVisible(false)
					end
				end
			end
		end

		if arg_25_1.uiTable and arg_25_1.uiTable.jiangli_tips and not tolua.isnull(arg_25_1.uiTable.jiangli_tips) then
			arg_25_1.uiTable.jiangli_tips:setVisible(false)
		end

		if arg_25_1.uiTable and arg_25_1.uiTable.info_tips and not tolua.isnull(arg_25_1.uiTable.info_tips) then
			arg_25_1.uiTable.info_tips:setVisible(false)
		end

		if tool.checkIfTouch(arg_25_1.uiTable.arrow1, arg_25_3, arg_25_4) and arg_25_1.uiTable.arrow1:isVisible() and var_0_3 == false then
			arg_25_1.uiTable.arrow1:setVisible(false)
			arg_25_1.uiTable.arrow2:setVisible(true)
			arg_25_0:moveNationTask1(arg_25_1)
		elseif tool.checkIfTouch(arg_25_1.uiTable.arrow2, arg_25_3, arg_25_4) and arg_25_1.uiTable.arrow2:isVisible() and var_0_3 == false then
			arg_25_1.uiTable.arrow2:setVisible(false)
			arg_25_1.uiTable.arrow1:setVisible(true)
			arg_25_0:moveNationTask2(arg_25_1)
		end

		for iter_25_5 = 1, 255 do
			if arg_25_1.uiTable["dot_" .. iter_25_5] and tool.checkIfTouch(arg_25_1.uiTable["dot_" .. iter_25_5], arg_25_3, arg_25_4) then
				smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
				loadingLayer.show(SCENE_WORLD, iter_25_5)
			end
		end

		if arg_25_1.uiTable.gongshourenwu_scoll_layer then
			if var_0_2 - arg_25_3 > 100 and var_0_3 == false then
				arg_25_0:moveNationTask1(arg_25_1)

				if arg_25_1.uiTable.arrow1 then
					arg_25_1.uiTable.arrow1:setVisible(false)
					arg_25_1.uiTable.arrow2:setVisible(true)
				end
			elseif var_0_2 - arg_25_3 < -100 and var_0_3 == false then
				arg_25_0:moveNationTask2(arg_25_1)

				if arg_25_1.uiTable.arrow1 then
					arg_25_1.uiTable.arrow2:setVisible(false)
					arg_25_1.uiTable.arrow1:setVisible(true)
				end
			end
		end
	end
end

return var_0_1
