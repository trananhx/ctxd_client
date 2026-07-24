nationControl = {}

local var_0_0 = nationControl
local var_0_1

function var_0_0.initControl(arg_1_0)
	var_0_1 = CCLayer:create()

	arg_1_0:addChild(var_0_1, 100)

	var_0_0.basePanel = var_0_1
end

function var_0_0.clearPanel()
	var_0_1:removeAllChildrenWithCleanup(true)
end

function var_0_0.onNationClick()
	var_0_0.clearPanel()
	require("lua/layer/nation/nationTab/NationTab").new(var_0_1)

	if guide.constant.popui[3][1] == true then
		guide.constant.popui[3][1] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onTaskClick()
	var_0_0.clearPanel()
	require("lua/layer/nation/nationTask/ui")

	local var_4_0 = nationTaskUI.show()

	var_0_1:addChild(var_4_0)

	if guide.constant.popui[3][2] == true then
		guide.constant.popui[3][2] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onManzuClick()
	var_0_0.clearPanel()
	require("lua/layer/nation/manzu/ui")

	local var_5_0 = manzuUI.show()

	var_0_1:addChild(var_5_0)
end

function var_0_0.onTryClick()
	var_0_0.clearPanel()
	require("lua/layer/nation/nationTry/ui")

	local var_6_0 = nationTryUI.show()

	var_0_1:addChild(var_6_0)
end

function var_0_0.onDonateTabClick()
	var_0_0.clearPanel()

	local var_7_0 = require("lua/layer/nation/donate/ui").new()

	var_0_1:addChild(var_7_0)

	if guide.constant.popui[3][3] == true then
		guide.constant.popui[3][3] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onBudokaiTabClick()
	var_0_0.clearPanel()

	local var_8_0 = require("lua/layer/nation/budokai/ui").new()

	var_0_1:addChild(var_8_0)

	if guide.constant.popui[3][4] == true then
		guide.constant.popui[3][4] = false

		guide.ui.setVisible(false)
	end
end

function var_0_0.onTaskTabClick(arg_9_0)
	return function()
		var_0_0.clearPanel()

		if arg_9_0 == taskTabConstant.TYPES.NATION_HUIZHAN_TASK then
			local var_10_0 = require("lua/layer/nation/huizhan/huizhanPanel").new()

			var_0_1:addChild(var_10_0)
		elseif arg_9_0 == taskTabConstant.TYPES.NATION_WEICHENG_TASK then
			log.info("围城任务")

			local var_10_1 = require("lua/layer/nation/weicheng/WeiChengLayer").new()

			var_0_1:addChild(var_10_1)
		elseif arg_9_0 == taskTabConstant.TYPES.NATION_BUILDNATION_TASK then
			log.info("建国大业")

			local var_10_2 = require("lua/layer/nation/buildNation/jianguodaye/buildNationMain").new()

			var_0_1:addChild(var_10_2)
		else
			var_0_0.onGetCurRankInfo(arg_9_0)
		end

		if arg_9_0 == taskTabConstant.TYPES.NATION_TRY_TASK then
			if guide.constant.popui[3][5] == true then
				guide.constant.popui[3][5] = false

				guide.ui.setVisible(false)
			end
		elseif arg_9_0 == taskTabConstant.TYPES.NATION_BAR_PROTECT_TASK then
			if guide.constant.popui[3][6] == true then
				guide.constant.popui[3][6] = false

				guide.ui.setVisible(false)
			end
		elseif arg_9_0 == taskTabConstant.TYPES.NATION_UPGRADE_TASK and guide.constant.popui[3][7] == true then
			guide.constant.popui[3][7] = false

			guide.ui.setVisible(false)
		end
	end
end

function var_0_0.onKfyzTabClick()
	log.info("kfyz")
	var_0_0.clearPanel()

	if user.jpsIndex > 0 then
		require("lua/layer/kfyz/DongYingLayer").new(var_0_1)
	else
		require("lua/layer/kfyz/TaskLayer").new(var_0_1)
	end
end

function var_0_0.onKindomBuildTabClick()
	log.info("三级东瀛")
	var_0_0.clearPanel()

	if user.kbLv == 2 then
		require("lua/layer/nation/buildNation/JuezhanYingzhou/JueZhanYingzhou").new(var_0_1)
	elseif user.kbLv == 3 or user.kbLv == 4 or user.kbLv == 5 or user.kbLv == 6 then
		require("lua/layer/nation/buildNation/KoreaBattlePanel").new(var_0_1)
	end
end

function var_0_0.onGetCurRankInfo(arg_13_0)
	local function var_13_0(arg_14_0)
		local var_14_0 = arg_14_0.action.data

		if var_14_0.arenaMatchInfo and var_14_0.arenaMatchInfo.type == 15 then
			local var_14_1 = require("lua/layer/nation/taskTab/TaskArena").new(var_14_0)

			var_0_1:addChild(var_14_1)
		elseif var_14_0.tasks and var_14_0.tasks[1] and var_14_0.tasks[1].taskType == 14 then
			local var_14_2 = require("lua/layer/nation/taskTab/TaskNewInvest").new(var_14_0)

			var_0_1:addChild(var_14_2)
		elseif var_14_0.tasks and var_14_0.tasks[1] and var_14_0.tasks[1].taskType == 17 then
			local var_14_3 = require("lua/layer/nation/taskTab/ExpandTaskView")

			user.NationData.expandTaskVo = var_14_0.tasks[1]

			local var_14_4 = var_14_3.new(var_14_0)

			var_0_1:addChild(var_14_4)
		elseif var_14_0.ywInfo then
			showTable(var_14_0.ywInfo)
			log.info("@@@@@@@@@@@@@@@@@@@@@@国家任务")

			local var_14_5 = user.NationData

			var_14_5.drillInfo = var_14_0.ywInfo
			var_14_5.taskId = var_14_0.ywInfo.taskId

			local var_14_6 = require("lua/layer/nation/taskTab/DrillView").new(var_14_0)

			var_0_1:addChild(var_14_6)
		else
			local var_14_7 = require("lua/layer/nation/taskTab/ui").new(arg_13_0)

			var_0_1:addChild(var_14_7)
		end
	end

	cmgr.sendRequest(var_13_0, actions.getCurRankInfo, 1)
end

function var_0_0.onKillAllTabClick()
	log.info("killAll")
	var_0_0.clearPanel()
	require("lua/layer/nation/taskTab/TaskKillAll").new(var_0_1)
end
