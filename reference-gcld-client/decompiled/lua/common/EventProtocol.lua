return {
	extend = function(arg_1_0)
		arg_1_0.listeners = {}

		function arg_1_0.addEventListener(arg_2_0, arg_2_1, arg_2_2)
			arg_2_1 = string.upper(arg_2_1)

			if arg_1_0.listeners[arg_2_1] == nil then
				arg_1_0.listeners[arg_2_1] = {}
			end

			local var_2_0 = arg_1_0.listeners[arg_2_1]

			var_2_0[#var_2_0 + 1] = arg_2_2
		end

		function arg_1_0.dispatchEvent(arg_3_0, arg_3_1)
			arg_3_1.name = string.upper(arg_3_1.name)
			arg_3_1.target = arg_1_0

			local var_3_0 = arg_3_1.name

			if arg_1_0.listeners[var_3_0] == nil then
				return
			end

			local var_3_1 = arg_1_0.listeners[var_3_0]

			for iter_3_0 = #var_3_1, 1, -1 do
				local var_3_2
				local var_3_3 = var_3_1[iter_3_0]

				if type(var_3_3) == "table" then
					var_3_2 = var_3_3[2](var_3_3[1], arg_3_1)
				else
					var_3_2 = var_3_3(arg_3_1)
				end

				if var_3_2 == false then
					break
				end
			end
		end

		function arg_1_0.removeEventListener(arg_4_0, arg_4_1, arg_4_2)
			arg_4_1 = string.upper(arg_4_1)

			if arg_1_0.listeners[arg_4_1] == nil then
				return
			end

			local var_4_0 = arg_1_0.listeners[arg_4_1]

			for iter_4_0 = #var_4_0, 1, -1 do
				if var_4_0[iter_4_0] == arg_4_2 then
					table.remove(var_4_0, iter_4_0)

					return
				end
			end

			if #var_4_0 == 0 then
				arg_1_0.listeners[arg_4_1] = nil
			end
		end

		function arg_1_0.removeAllEventListenersForEvent(arg_5_0, arg_5_1)
			arg_1_0.listeners[string.upper(arg_5_1)] = nil
		end

		function arg_1_0.removeAllEventListeners(arg_6_0)
			arg_1_0.listeners = {}
		end

		return arg_1_0
	end
}
