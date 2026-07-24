local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			arg_1_0.middleRect = arg_1_0.middleRect or CCRectMake(0, 0, 0, 0)
			var_1_0.displayObj = var_0_0.createSprite9FromPic(arg_1_0.pic, arg_1_0.middleRect, arg_1_0.preferedSize)

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
