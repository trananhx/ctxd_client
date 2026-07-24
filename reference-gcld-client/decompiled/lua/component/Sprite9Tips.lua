local var_0_0 = require("lua/component/BaseUI")

return {
	create = function(arg_1_0, arg_1_1, arg_1_2)
		arg_1_0.preferedSize = arg_1_0.preferedSize or CCSizeMake(2, 2)
		arg_1_0.middleRect = arg_1_0.middleRect or CCRectMake(0, 0, 0, 0)

		local var_1_0 = {}

		var_1_0.displayObj = nil

		var_0_0.extend(var_1_0)

		function var_1_0.create(arg_2_0)
			var_1_0.displayObj = var_0_0.createSprite9FromPic(arg_1_0.pic, arg_1_0.middleRect, arg_1_0.preferedSize)

			var_1_0:initBaseUI(arg_1_0)

			function var_1_0.displayObj.setContent(arg_3_0, arg_3_1)
				local var_3_0 = arg_1_0.frameGapHorizontal or 10
				local var_3_1 = arg_1_0.frameGapVertical or 10
				local var_3_2 = arg_1_0.lineGap or 4
				local var_3_3 = 0
				local var_3_4 = 0
				local var_3_5 = arg_1_0.showInCenter or false

				for iter_3_0, iter_3_1 in ipairs(arg_1_1) do
					local var_3_6 = iter_3_1
					local var_3_7 = var_3_6:getContentSize().width
					local var_3_8 = var_3_6:getContentSize().height

					if var_3_3 < var_3_7 then
						var_3_3 = var_3_7
					end

					var_3_4 = var_3_4 + var_3_8 + var_3_2

					var_3_6:setAnchorPoint(ccp(0, 1))

					if arg_3_1 then
						arg_3_0:addChild(var_3_6)
					end
				end

				local var_3_9 = var_3_3 + var_3_0 * 2
				local var_3_10 = var_3_4 + var_3_1 * 2 - var_3_2

				arg_3_0:setPreferredSize(CCSizeMake(var_3_9, var_3_10))

				local var_3_11 = var_3_0
				local var_3_12 = var_3_10 - var_3_1

				for iter_3_2 in ipairs(arg_1_1) do
					if not var_3_5 then
						arg_1_1[iter_3_2]:setPosition(ccp(var_3_11, var_3_12))
					else
						arg_1_1[iter_3_2]:setPosition(ccp(var_3_9 / 2 - arg_1_1[iter_3_2]:getContentSize().width / 2, var_3_12))
					end

					var_3_12 = var_3_12 - arg_1_1[iter_3_2]:getContentSize().height - var_3_2
				end
			end

			function var_1_0.displayObj.resetLayout(arg_4_0)
				arg_4_0:setContent(false)
			end

			var_1_0.displayObj:setContent(true)
		end

		var_1_0:create()

		return var_1_0
	end
}
