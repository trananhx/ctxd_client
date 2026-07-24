local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0)
		local var_1_0 = {}

		var_1_0.displayObj = nil
		var_1_0.anchorX = 0.5
		var_1_0.anchorY = 0.5

		var_0_0.extend(var_1_0)

		function var_1_0.parseText(arg_2_0, arg_2_1, arg_2_2)
			local var_2_0 = {}
			local var_2_1 = tool.split(arg_2_2, "#")

			for iter_2_0 = 1, #var_2_1 do
				local var_2_2 = var_2_1[iter_2_0]
				local var_2_3 = tool.split(var_2_2, "|")
				local var_2_4 = var_2_3[1]
				local var_2_5 = var_2_3[2]

				if var_2_4 == "label" then
					local var_2_6 = {
						type = "label",
						style = var_2_3[3],
						text = var_2_5
					}

					var_2_0[#var_2_0 + 1] = uiutil.initUIComponent(arg_2_1, nil, var_2_6)
				elseif var_2_4 == "sprite" then
					local var_2_7 = {
						type = "sprite",
						pic = {
							frame = true,
							path = var_2_5
						}
					}

					var_2_0[#var_2_0 + 1] = uiutil.initUIComponent(arg_2_1, nil, var_2_7)
				end
			end

			return var_2_0
		end

		function var_1_0.create(arg_3_0)
			var_1_0.anchorX = arg_1_0.anchorX or var_1_0.anchorX
			var_1_0.anchorY = arg_1_0.anchorY or var_1_0.anchorY
			var_1_0.displayObj = CCNode:create()

			var_1_0:initBaseUI(arg_1_0)

			local var_3_0 = var_1_0.displayObj

			function var_3_0.clearText(arg_4_0)
				if var_1_0.nodeList and #var_1_0.nodeList > 0 then
					for iter_4_0, iter_4_1 in pairs(var_1_0.nodeList) do
						local var_4_0 = iter_4_1.displayObj

						arg_4_0:removeChild(var_4_0, true)
					end

					var_1_0.nodeList = {}
				end
			end

			function var_3_0.setString(arg_5_0, arg_5_1)
				arg_5_0:clearText()

				var_1_0.nodeList = var_1_0:parseText(arg_5_0, arg_5_1)

				local var_5_0 = 0

				for iter_5_0, iter_5_1 in pairs(var_1_0.nodeList) do
					var_5_0 = var_5_0 + iter_5_1.displayObj:getContentSize().width
				end

				local var_5_1 = 0 - var_5_0 * var_1_0.anchorX

				for iter_5_2 = 1, #var_1_0.nodeList do
					local var_5_2 = var_1_0.nodeList[iter_5_2].displayObj
					local var_5_3 = var_5_2:getContentSize().width
					local var_5_4 = var_5_2:getContentSize().height * (var_1_0.anchorY - 0.5)

					var_5_2:setPosition(ccp(var_5_3 * 0.5 + var_5_1, var_5_4))

					var_5_1 = var_5_1 + var_5_3
				end
			end
		end

		var_1_0:create()

		return var_1_0
	end
}
