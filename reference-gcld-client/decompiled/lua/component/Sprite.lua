local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			if arg_1_0.pic then
				var_1_0.displayObj = var_0_0.createSpriteFromPic(arg_1_0.pic)
			else
				var_1_0.displayObj = CCSprite:create()
			end

			if arg_1_0.opacity then
				var_1_0.displayObj:setOpacity(arg_1_0.opacity)
			end

			if arg_1_0.flipX == true then
				var_1_0.displayObj:setFlipX(true)
			end

			if arg_1_0.flipY == true then
				var_1_0.displayObj:setFlipY(true)
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
