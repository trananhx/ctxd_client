local var_0_0 = require("lua/component/BaseUI")
local var_0_1 = require("lua/component/Layer")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil
		var_1_0.offset = 0
		var_1_0.triggerTime = 0
		var_1_0.updateSchedulerEntry = nil
		var_1_0.time = 0
		var_1_0.format = arg_1_0.format

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			local var_2_0 = var_0_1.create(arg_1_0)

			var_1_0.displayObj = var_2_0.displayObj

			local var_2_1 = var_1_0.displayObj

			local function var_2_2()
				if var_1_0.label then
					var_2_1:removeChild(var_1_0.label, true)

					var_1_0.label = nil
				end

				local var_3_0 = os.date(var_1_0.format, var_1_0.time)
				local var_3_1 = {
					type = "label",
					style = arg_1_0.style
				}
				local var_3_2 = uiutil.initUIComponent(var_2_1, nil, var_3_1)

				var_3_2.displayObj:setString(var_3_0)

				var_1_0.label = var_3_2.displayObj
			end

			local function var_2_3(arg_4_0)
				local var_4_0 = math.ceil(var_1_0.time)

				var_1_0.time = var_1_0.time - arg_4_0

				if var_1_0.time <= 0 then
					var_1_0.time = 0
				end

				if var_1_0.leftTriggerTime then
					var_1_0.leftTriggerTime = var_1_0.leftTriggerTime - arg_4_0

					if var_1_0.leftTriggerTime <= 0 then
						var_1_0.leftTriggerTime = var_1_0.triggerTime

						if var_1_0.callback and (var_1_0.alwaysTrigger or var_1_0.triggerCount > 0) then
							var_1_0.callback(var_1_0.time, var_1_0.args)

							var_1_0.triggerCount = var_1_0.triggerCount - 1
						end
					end
				end

				if var_4_0 ~= math.ceil(var_1_0.time) then
					var_2_2()
				end
			end

			function var_2_1.onEnter(arg_5_0)
				var_1_0.updateSchedulerEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_2_3, 1, false)
			end

			function var_2_1.onExit(arg_6_0)
				if var_1_0.updateSchedulerEntry then
					CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_1_0.updateSchedulerEntry)
				end
			end

			function var_2_1.setTime(arg_7_0, arg_7_1)
				var_1_0.time = arg_7_1 / 1000

				var_2_2()
			end

			function var_2_1.getTime(arg_8_0)
				return var_1_0.time
			end

			function var_2_1.setCallBack(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
				var_1_0.callback = arg_9_1
				var_1_0.args = arg_9_2
				var_1_0.triggerTime = arg_9_3
				var_1_0.leftTriggerTime = arg_9_3

				if arg_9_4 == 0 then
					var_1_0.alwaysTrigger = true
				end

				var_1_0.triggerCount = arg_9_4
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
