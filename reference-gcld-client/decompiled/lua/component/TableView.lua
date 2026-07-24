local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			arg_1_0.viewSize = arg_1_0.viewSize or CCSizeMake(0, 0)
			var_1_0.displayObj = CCTableView:create(arg_1_0.viewSize)

			if arg_1_0.dirction then
				var_1_0.displayObj:setDirection(arg_1_0.dirction)
			end

			if arg_1_0.verticalFill then
				var_1_0.displayObj:setVerticalFillOrder(arg_1_0.verticalFill)
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
