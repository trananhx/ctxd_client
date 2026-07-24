local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			arg_1_0.text = arg_1_0.text or "0"

			if arg_1_0.text == "" then
				arg_1_0.text = "0"
			end

			var_1_0.displayObj = CCLabelAtlas:create(arg_1_0.text, arg_1_0.pic, arg_1_0.itemWidth, arg_1_0.itemHeight, arg_1_0.startCharMap)

			if arg_1_0.anchor then
				var_1_0.displayObj:setAnchorPoint(arg_1_0.anchor)
			else
				var_1_0.displayObj:setAnchorPoint(ccp(0.5, 0.5))
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
