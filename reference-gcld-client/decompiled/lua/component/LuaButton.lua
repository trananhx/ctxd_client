local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		var_1_0.displayObj = nil
		var_1_0.buttonObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			local var_2_0 = CCArray:create()
			local var_2_1 = var_0_0.createSpriteFromPic(arg_1_0.pic1)
			local var_2_2
			local var_2_3

			if arg_1_0.pic2 ~= nil then
				var_2_2 = var_0_0.createSpriteFromPic(arg_1_0.pic2)
			end

			if arg_1_0.pic3 ~= nil then
				var_2_3 = var_0_0.createSpriteFromPic(arg_1_0.pic3)
			end

			local var_2_4 = CCMenuItemSprite:create(var_2_1, var_2_2, var_2_3)

			var_2_0:addObject(var_2_4)

			var_1_0.displayObj = CCMenu:createWithArray(var_2_0)
			var_1_0.buttonObj = var_2_4

			var_1_0:initBaseUI(arg_1_0)
		end

		function var_1_0.getButtonObj(arg_3_0)
			return var_1_0.buttonObj
		end

		var_1_0:create()

		return var_1_0
	end
}
