local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			local var_2_0 = var_0_0.createSpriteFromPic(arg_1_0.pic)
			local var_2_1 = arg_1_0.progressType or kCCProgressTimerTypeBar

			var_1_0.displayObj = CCProgressTimer:create(var_2_0)

			var_1_0.displayObj:setType(var_2_1)
			var_1_0.displayObj:setMidpoint(CCPointMake(0, 0.5))
			var_1_0.displayObj:setBarChangeRate(CCPointMake(1, 0))
			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
