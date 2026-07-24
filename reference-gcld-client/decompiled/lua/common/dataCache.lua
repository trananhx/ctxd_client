dataCache_type_task_reward = 1
dataCache_type_xiaoqian_dialogue = 2
dataCache = {}
dataCache.isNextDataNeedCache = false
dataCache.isDelayDispaly = false
dataCache.isNeedClick_mainTask = false
dataCache.beginIndex = 1
dataCache.count = 0
dataCache.data = {}

function dataCache.clearCache()
	dataCache.isNextDataNeedCache = false
	dataCache.isDelayDispaly = false
	dataCache.isNeedClick_mainTask = false
	dataCache.beginIndex = 1
	dataCache.count = 0
	dataCache.data = {}
end

function dataCache.isEmpty()
	if dataCache.count == 0 then
		return true
	end

	return false
end

function dataCache.push(arg_3_0, arg_3_1)
	log.info("abcxyz dataCache.push --> ", dataCache.beginIndex, dataCache.count)

	dataCache.data[dataCache.beginIndex + dataCache.count] = {}
	dataCache.data[dataCache.beginIndex + dataCache.count].type = arg_3_0
	dataCache.data[dataCache.beginIndex + dataCache.count].value = arg_3_1
	dataCache.count = dataCache.count + 1

	log.info("abcxyz dataCache.push --> ", dataCache.beginIndex, dataCache.count)
end

function dataCache.pop()
	if dataCache.isEmpty() == false then
		log.info("abcxyz dataCache.pop --> ", dataCache.beginIndex)
		log.info("abcxyz dataCache.pop --> ", dataCache.data[dataCache.beginIndex].type)

		return dataCache.data[dataCache.beginIndex]
	end

	return nil
end

function dataCache.remove()
	log.info("abcxyz dataCache.remove --> ", dataCache.beginIndex, dataCache.count)

	dataCache.count = dataCache.count - 1
	dataCache.data[dataCache.beginIndex] = nil
	dataCache.beginIndex = dataCache.beginIndex + 1

	if dataCache.isEmpty() == true then
		dataCache.beginIndex = 1
	end

	log.info("abcxyz dataCache.remove --> ", dataCache.beginIndex, dataCache.count)
end

function dataCache.showNext()
	local var_6_0 = dataCache.pop()

	log.info("abcxyz dataCache.showNext --> ", dataCache.beginIndex, dataCache.count, var_6_0, dataCache.isNeedClick_mainTask)

	if var_6_0 ~= nil then
		if var_6_0.type == dataCache_type_task_reward then
			taskUI.showTaskReward(var_6_0.value)

			if var_6_0.value.type == 3 then
				user.curBranchTask = nil
			end
		elseif var_6_0.type == dataCache_type_xiaoqian_dialogue then
			roleDialogue.control.loadSpeak(var_6_0.value)
		end

		dataCache.remove()
	elseif dataCache.isNeedClick_mainTask == true then
		dataCache.isNeedClick_mainTask = false

		taskUI.showTaskGuide()
	end

	log.info("abcxyz dataCache.showNext --> ", dataCache.beginIndex, dataCache.count)
end

function dataCache.isTaskInCache(arg_7_0)
	if dataCache.isEmpty() == true then
		return false
	end

	for iter_7_0 = dataCache.beginIndex, dataCache.beginIndex + dataCache.count - 1 do
		if dataCache.data[iter_7_0].type == dataCache_type_task_reward and dataCache.data[iter_7_0].value.taskId == arg_7_0 then
			return true
		end
	end

	return false
end
