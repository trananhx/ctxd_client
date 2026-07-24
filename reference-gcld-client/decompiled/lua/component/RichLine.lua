local var_0_0 = require("lua/component/BaseUI")
local var_0_1 = {}
local var_0_2 = 2
local var_0_3 = 0

function var_0_1.create(arg_1_0, arg_1_1)
	local var_1_0 = {}
	local var_1_1 = arg_1_1.anchorPointX or var_0_3
	local var_1_2 = arg_1_1.gap or var_0_2

	var_0_0.extend(var_1_0)

	function var_1_0.create()
		var_1_0.displayObj = CCNode:create()

		var_1_0:initBaseUI(arg_1_1)

		local var_2_0 = 0

		for iter_2_0, iter_2_1 in ipairs(arg_1_0) do
			iter_2_1:setAnchorPoint(ccp(0, 0.5))
			iter_2_1:setPosition(ccp(var_2_0, 0))
			var_1_0.displayObj:addChild(iter_2_1)

			var_2_0 = var_2_0 + iter_2_1:getContentSize().width * iter_2_1:getScale() + var_1_2
		end

		var_1_0.displayObj:setPositionX(var_1_0.displayObj:getPositionX() - var_1_1 * (var_2_0 - var_1_2))

		function var_1_0.displayObj.reorder(arg_3_0)
			local var_3_0 = 0

			for iter_3_0, iter_3_1 in ipairs(arg_1_0) do
				iter_3_1:setAnchorPoint(ccp(0, 0.5))
				iter_3_1:setPosition(ccp(var_3_0, 0))

				var_3_0 = var_3_0 + iter_3_1:getContentSize().width * iter_3_1:getScale() + var_1_2
			end

			arg_3_0:setPositionX((arg_1_1.x or 0) - var_1_1 * (var_3_0 - var_1_2))
		end
	end

	var_1_0.create()

	return var_1_0
end

return var_0_1
