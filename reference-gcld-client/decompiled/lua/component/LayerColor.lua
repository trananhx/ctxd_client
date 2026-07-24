local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		log.info("@@ create color layer 2 ")

		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			var_1_0.displayObj = CCLayerColor:create(arg_1_0.color)

			if arg_1_0.width and arg_1_0.height then
				var_1_0.displayObj:changeWidthAndHeight(arg_1_0.width, arg_1_0.height)
			else
				var_1_0.displayObj:changeWidthAndHeight(visibleSize.width, visibleSize.height)
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
