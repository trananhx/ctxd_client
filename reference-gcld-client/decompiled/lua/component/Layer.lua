local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			var_1_0.displayObj = CCLayer:create()

			local function var_2_0(arg_3_0)
				log.info("@@@ 层事件 : ", arg_3_0, var_1_0.displayObj.onEnter, var_1_0.displayObj.tag)

				if arg_3_0 == "enter" then
					if var_1_0.displayObj.onEnter then
						var_1_0.displayObj:onEnter()
					end
				elseif arg_3_0 == "exit" and var_1_0.displayObj.onExit then
					var_1_0.displayObj:onExit()
				end
			end

			var_1_0.displayObj:registerScriptHandler(var_2_0)
			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
