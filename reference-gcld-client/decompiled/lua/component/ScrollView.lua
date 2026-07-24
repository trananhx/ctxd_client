local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0, arg_1_1)
		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			var_1_0.displayObj = CCScrollView:create()

			if arg_1_0.viewSize then
				var_1_0.displayObj:setViewSize(arg_1_0.viewSize)
			end

			if arg_1_0.dirction then
				var_1_0.displayObj:setDirection(arg_1_0.dirction)
			end

			if arg_1_0.bounceable ~= nil then
				var_1_0.displayObj:setBounceable(arg_1_0.bounceable)
			end

			if arg_1_0.offset then
				var_1_0.displayObj:setContentOffset(arg_1_0.offset)
			end

			if arg_1_1 then
				var_1_0.displayObj:setContainer(arg_1_1.displayObj)
				var_1_0.displayObj:setContentSize(arg_1_0.viewSize)
			else
				local var_2_0 = CCLayerColor:create(ccc4(255, 0, 0, 0))

				var_1_0.displayObj:setContainer(var_2_0)
				var_1_0.displayObj:setContentSize(arg_1_0.viewSize)
			end

			var_1_0:initBaseUI(arg_1_0)
		end

		var_1_0:create()

		return var_1_0
	end
}
