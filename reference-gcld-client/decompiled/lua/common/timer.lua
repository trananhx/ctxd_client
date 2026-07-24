function NewTimer(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	var_1_0.schedulerEntry = nil
	var_1_0.time = arg_1_0

	function var_1_0.update(arg_2_0)
		var_1_0.time = var_1_0.time - arg_2_0

		if var_1_0.time <= 0 then
			arg_1_1(arg_1_2)
			var_1_0:over()
		end
	end

	function var_1_0.start(arg_3_0)
		arg_3_0.schedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_3_0.update, 0.1, false)
	end

	function var_1_0.over(arg_4_0)
		if arg_4_0.schedulerEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_4_0.schedulerEntry)
		end
	end

	var_1_0:start()

	return var_1_0
end

function NewScheduler(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0

	local function var_5_1()
		if var_5_0 then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_5_0)

			if arg_5_1 then
				arg_5_1(arg_5_2)
			end
		end
	end

	var_5_0 = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_5_1, arg_5_0, false)
end

function FrameTimer(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	arg_7_3 = arg_7_3 or 1

	local var_7_0 = {}

	var_7_0.schedulerEntry = nil
	var_7_0.time = arg_7_0 or 1

	function var_7_0.update(arg_8_0)
		log.info("[timer] ", var_7_0.time, arg_8_0)

		var_7_0.time = var_7_0.time - arg_8_0

		if arg_7_1 then
			arg_7_1(arg_8_0)
		end

		if var_7_0.time <= 0 then
			var_7_0:clear()

			if arg_7_2 then
				arg_7_2(arg_7_4)
			end
		end
	end

	function var_7_0.start(arg_9_0)
		arg_9_0.schedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(arg_9_0.update, arg_7_3, false)
	end

	function var_7_0.clear(arg_10_0)
		if arg_10_0.schedulerEntry then
			CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(arg_10_0.schedulerEntry)
		end
	end

	var_7_0:start()

	return var_7_0
end
